import 'dart:convert';

AudioSurahModels audioSurahModelsFromJson(String str) => AudioSurahModels.fromJson(json.decode(str));

String audioSurahModelsToJson(AudioSurahModels data) => json.encode(data.toJson());

class AudioSurahModels {
    AudioFile? audioFile;

    AudioSurahModels({
        this.audioFile,
    });

    factory AudioSurahModels.fromJson(Map<String, dynamic> json) => AudioSurahModels(
        audioFile: json["audio_file"] == null ? null : AudioFile.fromJson(json["audio_file"]),
    );

    Map<String, dynamic> toJson() => {
        "audio_file": audioFile?.toJson(),
    };
}

class AudioFile {
    int? id;
    int? chapterId;
    int? fileSize;
    String? format;
    String? audioUrl;

    AudioFile({
        this.id,
        this.chapterId,
        this.fileSize,
        this.format,
        this.audioUrl,
    });

    factory AudioFile.fromJson(Map<String, dynamic> json) => AudioFile(
        id: json["id"],
        chapterId: json["chapter_id"],
        fileSize: json["file_size"],
        format: json["format"],
        audioUrl: json["audio_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "chapter_id": chapterId,
        "file_size": fileSize,
        "format": format,
        "audio_url": audioUrl,
    };
}
