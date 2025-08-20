Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E986CA0EFC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 13:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA49810E370;
	Thu, 21 Aug 2025 13:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KiRKnS9C";
	dkim-atps=neutral
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22C210E7E4
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 20:16:16 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-76e2eac3650so941031b3a.2
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 13:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755720976; x=1756325776;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qIpEd04LLhW7wC7d9HjCp8cUc68SFaxpbzBA9V+sYjc=;
 b=KiRKnS9CVGQsVvjMAPXZOYO+jahlIew1wM5+3OtLYJQf1aPJ/8W2CxKMt5z8IpGYeY
 Ozuk8BpKfSQ7G67KqPTalzK/7tN8dkVTSkIKYAdZxQduJqKeunvY7D4FL6AK23j69sGf
 3Kd6pQYuyS9B3BoWHdTfxJNNRjVbERrGNKMEMelHVIYCF/SidEgaB8bcAA+IVo0XpGGN
 U381riCkmB0IE2tkAO07Sgj0GPyXKe7NS2B4jhXsLJBg/GDJxSN2iAnS9m8/X9+3CEmC
 69JQ3clfOip+RTkAiH0CkGwdIDYW1IW7D316Qxz/8R7nQTA1mBBGTN1cOTqA89SMY8So
 i6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755720976; x=1756325776;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIpEd04LLhW7wC7d9HjCp8cUc68SFaxpbzBA9V+sYjc=;
 b=MjCSsL6lLZQoU5vNYZe1X3DQOyMakYgwk1p7qmW4ik99D6KlSLWd4o9WZ9d1o2+0Qc
 KrhuM9qBxD6ElwRDo10nbbzA2Zlw4HtlgswPvdpB0D/2AO73JQsJOr3MvsVWR7u+Vlgj
 NOUlUpLaooIBcvbIcv/udIRpUghWavMEQcooj0544M3PdcFK8vqGJlTcX60W1xoaX6yj
 W46DpjdRhPssrMMjerCnu7ae6OGMV9jElHsBhR1rXKhHz3jNosC0VCSahIHJTK6INQSO
 Hg7wt1U63uJvGL6OyHjMsGzYZ8VXOpIxMXS5CEAut8c3UvTn32dDNgha39fVpo1pRIRs
 Cacw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg8h099ZcpMBDQI7PwByWGJK9/FqDtsxSQlUcSwfAPiE/1cIOF7Xe2ceWuymgO+LKUssQ/yJqepA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhowj8TxAqKYlk/gsYQ7dBcSlsqbwIpynpVgZv3UzlnicaKNZn
 zT877ZuihCmAJpbXfiZyMUkzkVhz9J3HIlxTaTFhORug4s9IzzDCRE9Qj5zhE6eLvr1BRV2n7M/
 jMppEiCO+P/pynQ==
X-Google-Smtp-Source: AGHT+IE7GwfmR2D95ArpXhAM3e3FihMKCVaV4jn2nhnJyETg8rpRDPNgsDsY/10SNk9YeSB+51j2Lgd5YnxM/A==
X-Received: from pfbjw5.prod.google.com ([2002:a05:6a00:9285:b0:76b:de2b:6796])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1813:b0:76b:d746:733a with SMTP id
 d2e1a72fcca58-76e8dd85d39mr5837029b3a.21.1755720976156; 
 Wed, 20 Aug 2025 13:16:16 -0700 (PDT)
Date: Wed, 20 Aug 2025 20:16:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc1.193.gad69d77794-goog
Message-ID: <20250820201612.2549797-1-cmllamas@google.com>
Subject: [PATCH] drm/xe: replace basename() with portable strrchr()
From: Carlos Llamas <cmllamas@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 "=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matt Atwood <matthew.s.atwood@intel.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
 Carlos Llamas <cmllamas@google.com>, 
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 21 Aug 2025 13:06:33 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
introduced a call to basename(). The GNU version of this function is not
portable and fails to build with alternative libc implementations like
musl or bionic. This causes the following build error:

  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to =E2=80=98=
const char *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer=
 without a cast [-Wint-conversion]
    130 |         fn =3D basename(fn);
        |            ^

While a POSIX version of basename() could be used, it would require a
separate header plus the behavior differs from GNU version in that it
might modify its argument. Not great.

Instead replace basename() with a strrchr() based implementation which
provides the same functionality and avoid portability issues.

Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen=
_wa_oob.c
index 6581cb0f0e59..0a94a045bcea 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -125,9 +125,11 @@ static int parse(FILE *input, FILE *csource, FILE *che=
ader, char *prefix)
=20
 static int fn_to_prefix(const char *fn, char *prefix, size_t size)
 {
+	const char *base;
 	size_t len;
=20
-	fn =3D basename(fn);
+	base =3D strrchr(fn, '/');
+	fn =3D base ? base + 1 : fn;
 	len =3D strlen(fn);
=20
 	if (len > size - 1)
--=20
2.51.0.rc1.193.gad69d77794-goog

