Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91464CA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 22:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90D10EA18;
	Thu, 21 Aug 2025 22:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KkrdpSJf";
	dkim-atps=neutral
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
 [209.85.210.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90E410EA1A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 22:00:58 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-76e2e62284dso3038565b3a.0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 15:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755813658; x=1756418458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4cLlpuHdBM/UdMtUWDBy4/i+9L6ubcblOqSNe/mP7/k=;
 b=KkrdpSJf9GynGDMDP4YV0EdRsafyZDsVtcFcTYJnIQ6Zk0TVGZ8uLbuggvMjM3MVhx
 fePXE8idRxBJvMntr3NOfwR6C9w02a3N1fhN+8GWZ7LJm7ghulrgsF1B8QtYzjE5rQum
 jTAHinYfnLjDV/Dmdh76z1HYF8nNE1H6Ml3NFUAd/RR754a6CExEhhEirCL4UfYg98D3
 KDg7BXT0r7auHWeQt6WnxfGg01GXFp6p66mhxOyj+ScZ6AmgDblyS7L6o/+11puFadX6
 Iidgh0MnBkPmTls7GdBAuBhr16/tvLWb9fGc6qketJM7ostJIGiV4kLb92TG1WozDCLJ
 W2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755813658; x=1756418458;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4cLlpuHdBM/UdMtUWDBy4/i+9L6ubcblOqSNe/mP7/k=;
 b=umbeL62QRyMdQRifU3gVpIC2kM42pV0nd+H9sBNjzosjO+9l/woIm29J30KkGrAmgJ
 snc7Q7112YKx23KUMR76XkUNSG5D7/6C5/tAcpxNU6ZSObKEKDiR+Y94XRpn6L86wPdS
 aXijigT8Is6PmSg2AYzz3wvSI5DPVNCL8gy0ad4NhaD3v02VYg/YKRgdsI4//7r0i0y6
 DlUd2CErHJaXTw+XqHA9NIq2WWEvdOrMtH8GSBKTWl3gyyUpja8MpI8mKVpI5xVHdqt+
 HM9edV0PvBvaI8hu2nYgRkNsw6x0VHL0FwPlEc2CSOVdsJbnZZvMM8nUlvFKwB1pDQ/H
 lmrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKYOMsXlYwUg66YDfYeFEle2g07ZRdynYvkFoDpdz6B8ox86D7owcaf5E7tGVDhDmg0UaCXUh2Mw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjmYqwbXKB8KolOvJuwbtog36y+/fZGTnfJ9wemWtIR/ZBG+P/
 gdWgsiIxkO6phSAm9RmL1jYql9V7+xi+nMYql2dDa3PVgu2khV+r534oLPa1apoIGxDw7sKQd94
 +rib5pn+OoJFoag==
X-Google-Smtp-Source: AGHT+IEAbdE+rBrrN9gQKjiTu1VWCSa69pr7H1Wqyou0ZlgqSmruqcwdp3/7Db/srMjoEdDP7SkVIJMHghXH9A==
X-Received: from pfop21.prod.google.com ([2002:a05:6a00:b55:b0:746:1931:952a])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3d0e:b0:76e:885a:c1cd with SMTP id
 d2e1a72fcca58-7702fc472d4mr1141804b3a.31.1755813658055; 
 Thu, 21 Aug 2025 15:00:58 -0700 (PDT)
Date: Thu, 21 Aug 2025 22:00:53 +0000
In-Reply-To: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
Mime-Version: 1.0
References: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821220054.3700783-1-cmllamas@google.com>
Subject: [PATCH v2] drm/xe: switch to local __basename() helper
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

Instead, implement a local __basename() helper based on strrchr() that
provides the same functionality and avoids portability issues.

Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Tiffany Yang <ynaffit@google.com>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
v2:
 - Wrap changes in a helper function per Luca's feedback.
 - Fix typo in commit log: s/avoid/avoids/ per Tiffany.
 - Update commit log.
 - Collect tags.

v1:
https://lore.kernel.org/all/20250820201612.2549797-1-cmllamas@google.com/

 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen=
_wa_oob.c
index 6581cb0f0e59..c18faccdeb90 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -123,11 +123,19 @@ static int parse(FILE *input, FILE *csource, FILE *ch=
eader, char *prefix)
 	return 0;
 }
=20
+/* Avoid GNU vs POSIX basename() discrepancy, just use our own */
+static const char *__basename(const char *s)
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
+	fn =3D __basename(fn);
 	len =3D strlen(fn);
=20
 	if (len > size - 1)
--=20
2.51.0.rc2.233.g662b1ed5c5-goog

