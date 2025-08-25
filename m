Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42BCCA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 15:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B6110E4F0;
	Mon, 25 Aug 2025 15:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hflSptcC";
	dkim-atps=neutral
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FB810E4F3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 15:58:08 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-3250e3b161bso3968394a91.0
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756137488; x=1756742288;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=lkwErEFpwwFQOHYRvZPN+kMZDZFEGs5jc16bYvoo+nE=;
 b=hflSptcC/6FXJ5Gt7o8zFr4EdDNje71EKuCe0FT19OM87WKCRNXo8At/fv34AcqSPs
 Mqt9k1L2uTvihI25DULruJ/bODc0U/H8GKOzNqjBfyiCL0ZpG0nZr+ZmDMLO1TlCWbey
 uqrKYp5j6BhCT5qCWCW9HD/G9wBqgik4i0dJGXqbHPBgOF7+2vAODGVWG3aoyUoL1EOY
 IIYxiEcdXBWhU+20jXi51CPJyaiZWiQsQctRD5uzz/4Zo370/yuoehUU17EFocuuO4FP
 8JfL1SKkPUAeBtZnDUsQ4izoMdXuAwrJtXRogNm1dIoTNZySjR5ERgSseQgh1IbR4823
 5MoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756137488; x=1756742288;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lkwErEFpwwFQOHYRvZPN+kMZDZFEGs5jc16bYvoo+nE=;
 b=qLCu2SSkvSys7FWlxphE7wuCRnBM1FRu4kP5edQlug8kOzSM2srH432jHqqUH1BHGp
 D47+t2VG+Os2nP6U0WJYA5Ea5a8qcwRJX8YwsSP8D2pUfZu+cGv5SpMvj9wQpg15Kj9V
 67X3sYQH2J2LFdyR1G0c2NP4sOTxfiTX3VUhtEbZiDKfLyEIn03eKp+i7J6PaNz/zS6l
 u/6sDJLm0VhgoqbD5f+xaocMg9CbEaW+QdHsGIEJZBFpCNDKDH34X1X2ylObx3zczSbB
 IHuD9ciDvHJ1ILn5la+KELdF4Qf7FD7Ni3CfpVhiqUsEeh7Q2RMa2b4ETL+eoKQIUZ7E
 9s6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvSNsuMfXcHaXubpsbTYJUdsuYg6eZfSrCDrHQVjR2mqzKWlZt/i83/fynQLdaBxw6w+CcguK/tA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGdpzWYXVSGgmUhx8zwQ46h6Mn1eGGw97KMEs/zzYa4jiBnIwZ
 MiinwNa15v/yjrhi22uROJoIyfaKgglr/+pcjTihg2CLl91Ztrt54+oEYHBXHA03rvIXIxPGc1o
 znR+Jx74xQ6GToQ==
X-Google-Smtp-Source: AGHT+IFFAXlYjauB8hf2P8M4bUyuciisgELTWwgt1wqb+R8oSPO5eYv/Ss8op3w6WvxFmQwmUhX4/UeNCsS7jA==
X-Received: from pjbok14.prod.google.com ([2002:a17:90b:1d4e:b0:325:8fba:708c])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c8e:b0:325:245d:79c2 with SMTP id
 98e67ed59e1d1-325245d7ac2mr16362226a91.15.1756137488184; 
 Mon, 25 Aug 2025 08:58:08 -0700 (PDT)
Date: Mon, 25 Aug 2025 15:57:42 +0000
In-Reply-To: <w4j3kzezrd4xqc4q4vkpbbxqvqxitam5htkex6rj6dguj5kbw5@27gqnp6veuu4>
Mime-Version: 1.0
References: <w4j3kzezrd4xqc4q4vkpbbxqvqxitam5htkex6rj6dguj5kbw5@27gqnp6veuu4>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250825155743.1132433-1-cmllamas@google.com>
Subject: [PATCH v3] drm/xe: switch to local xbasename() helper
From: Carlos Llamas <cmllamas@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 "=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matt Atwood <matthew.s.atwood@intel.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
 Carlos Llamas <cmllamas@google.com>, Tiffany Yang <ynaffit@google.com>, 
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Instead, implement a local xbasename() helper based on strrchr() that
provides the same functionality and avoids portability issues.

Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Tiffany Yang <ynaffit@google.com>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
v3:
 - Switch __basename() -> xbasename() per Lucas.

v2:
https://lore.kernel.org/all/20250821220054.3700783-1-cmllamas@google.com/
 - Wrap changes in a helper function per Lucas' feedback.
 - Fix typo in commit log: s/avoid/avoids/ per Tiffany.
 - Update commit log.
 - Collect tags.

v1:
https://lore.kernel.org/all/20250820201612.2549797-1-cmllamas@google.com/
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen=
_wa_oob.c
index 6581cb0f0e59..247e41c1c48d 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -123,11 +123,19 @@ static int parse(FILE *input, FILE *csource, FILE *ch=
eader, char *prefix)
 	return 0;
 }
=20
+/* Avoid GNU vs POSIX basename() discrepancy, just use our own */
+static const char *xbasename(const char *s)
+{
+	const char *p =3D strrchr(s, '/');
+
+	return p ? p + 1 : s;
+}
+
 static int fn_to_prefix(const char *fn, char *prefix, size_t size)
 {
 	size_t len;
=20
-	fn =3D basename(fn);
+	fn =3D xbasename(fn);
 	len =3D strlen(fn);
=20
 	if (len > size - 1)
--=20
2.51.0.rc2.233.g662b1ed5c5-goog

