Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8E1CCFA06
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 12:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349BB10E3CB;
	Mon,  3 Nov 2025 12:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="GXa+vhZC";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3477D10EBD3
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 14:49:07 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-294fe7c2e69so18759725ad.0
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 07:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1761922147; x=1762526947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x8KBeMeYUon6BQraYtudMUHNR0dTqRE5CF3A2DrTv9E=;
 b=GXa+vhZCd1em1IU73Ju9B1U21iX7L0DsUskGMEHjVe0NxrFY3PiaKojGg0EKDRd1Wc
 J5qdyZFDYnyexZCt97W0p5ilBPQBQphR+oQp6kU4gb+2nNmRI26tZ0g6loRBT+gqIaCY
 df751cmGZMYQ0pf4z1u4vi9T9NdnDT5Nd1ZshI5Ir7LWTuPKTH/DSuQ/C6vEFnK3cA0z
 nNGboAgfgGGOw3KqGCguxlUMXhips+2kXifto4HpOUjzyEWcqhnww8FB/jEXlOH+gudq
 KpnMIkfgr7/g1muzpUOgZyD0ekcxnvc9M7XIK+RHmeCuUnPxN3VUm0He/znVOrtLS/us
 fAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761922147; x=1762526947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x8KBeMeYUon6BQraYtudMUHNR0dTqRE5CF3A2DrTv9E=;
 b=iJFEEOn6wOPzdEzF3y8XTY0eOz3g5T9RrXhGYkFWE/s+pwpHDQuqH47HJtr9E2Lsh/
 /S7jZlyD2BCjOu5sY3IxVloVK3/FD5kVF8q1u6L2BIc9POH6px3WkUAg+9zUiW9CXj3k
 HWgyKF/Fe6ZKEvMCus5ahsuh/zqU6SoP6Gtl8U6e5/q+niCL3EynMhg4NbNX6gaoteyn
 iz4tctxNGmc2IsIs3h53exJ9BU7Qh1T2e+z3ITCxI6SnyQjzEvDGcvXV4QGV7WKWe327
 eqAgSodntRYYgz6r6pNNJjC8xla+ZYH5hibf2xTUfkFIMY8V3k1+Y50cPKd/rtcsWUId
 l0Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxr607leuBmbeuhUQBDsrcUuuatp1Al7SVqSHwGKTAFgw1PjXBU9xoOk8t+aMR/avsh1+hZnqWDg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuIRa7nHF7aysSIRV00k8NRkikin+IMpIOnAx9X0NBsY0PhWLA
 TFjygixkMKEc2OwcXO7KFyTDOcphVV+LfZhtlCYl4StJRQrbsPGhWrlvriCnjJHjUsk=
X-Gm-Gg: ASbGncs/UuO/DVtpO4+eeToyFBQKaodKUsDkjYAwz2THt7XtX+fSX+YsP+PodjPc9Lx
 NTdCNZHCj49WOvCL9JNs/b8qzE7Uo/l3gvwqaQHXXzSZHiVKUpn1mMdY6OGM7sMymQZxNg8Ras6
 yvuYU/nODoNoE3503oJ5jlUTjqpRiAP3EIeZTOx85TL7Tu/P69DB+WMPxhW/JhUdCuyvcbIR/oi
 7LGIYdfsFRgOAe7fP5zap5DG/jANmtlpHsvPsTrIlA9D5RxobIVZBzq5lEWLua96A3x0c5jGDh7
 MKKdh1epdNHxUHqch51I7Hxz8aH0KmTDEbKX4xFXtLxDkgzQ0Nn4VCaIz2JMz42wvLYRnJQPmJv
 MK6wbyIaKnkoWzwQX0Q30ObEG8QOEfhC/mdSTLv1Dq+QNQ2vsRNvEvmowqljGxGLH3q7WPndUJE
 8N4uv/C0coYCqt
X-Google-Smtp-Source: AGHT+IHPF2x0DGEn26EwYhqgvCtNpun32sTU7vWqgQS1gMXJpOJKN9HNTpNSlv3IlQSbO5TEaferpw==
X-Received: by 2002:a17:902:d487:b0:273:59ef:4c30 with SMTP id
 d9443c01a7336-2951a39e2eemr55702665ad.15.1761922146176; 
 Fri, 31 Oct 2025 07:49:06 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-295269bd2fesm26064835ad.105.2025.10.31.07.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 07:49:05 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 thomas.hellstrom@linux.intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe: Don't use absolute path in generated header comment
Date: Fri, 31 Oct 2025 07:48:53 -0700
Message-ID: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Nov 2025 12:45:22 +0000
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

Building the XE driver through Yocto throws this QA warning:

    WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
    WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]

...because the comment at the top of the generated header contains the
absolute path to the rules file at build time:

    * This file was generated from rules: /home/calvinow/git/meta-house/build/tmp-house/work-shared/nuc14rvhu7/kernel-source/drivers/gpu/drm/xe/xe_device_wa_oob.rules

Fix this minor annoyance by putting the basename of the rules file in
the generated comment instead of the absolute path, so the generated
header contents no longer depend on the location of the kernel source.

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 247e41c1c48d..e7a50b1348b7 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -195,7 +195,8 @@ int main(int argc, const char *argv[])
 		}
 	}
 
-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
+	fprintf(args[ARGS_CHEADER].f, HEADER, xbasename(args[ARGS_INPUT].fn),
+		prefix, prefix);
 
 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
 		    args[ARGS_CHEADER].f, prefix);
-- 
2.47.3

