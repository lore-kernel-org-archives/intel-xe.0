Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5307606A31A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0MDTjUi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA0210E0D6;
	Sun, 22 Nov 2026 21:10:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8230E10E0D6
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 21:10:07 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-49a92144733so1241842f8f.0
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 13:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795381805; x=1795986605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pATs5bElep757B7vKLxVq23Oy5RJBIjcPNQtv8rHsyk=;
 b=W0MDTjUiugqhVgMJ261Qrw10fAg4PrfqBB0XFejqjRPa3nekx5FNKK4G34Qh13sJn0
 4Ovh0zWF1cFQ60oX2ZRK5gr7urSpFBFUNsxZfFv598j5ZylMBIHDqs2QYgNsFR8ZKTG0
 yZZ4Ud+kdePIkYm27LPii21YmLIXgzNVoG2qkZkF7kkidvqLSauQaQLGsG1rfD58oUPk
 hrM/uc7PJRKNmDs7SBugCQgPbXAug9Ud6QAcHjdfjOhyh9juUYDM92pp0urL7pcQSJLH
 5zCBodmynXRBuqtwJMY0AOAwEld9UiBhIWq8MlKTzhU0Nh0gcqLt+PFhNT2SSuSg0/w0
 TRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795381805; x=1795986605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pATs5bElep757B7vKLxVq23Oy5RJBIjcPNQtv8rHsyk=;
 b=xgU2h9yS5TXAfBQvQCtAZbpEJychyKCUh2koL7yw3E1wRL6QshtUi7Oz6UoDSX/XrT
 1eqOHzdta9omwvYLI/NuiO83+bHnSIHf3a9ykZNh2VBd07IRnXzxMhEraePiLeJWAgNr
 /xGGUFEtOxlz/pZo4aYOuarFROgFHwbFgSvIZ35QQFr4JUAI5t5T+cztteELmq3u4RYz
 8jzrDZhjTktdTAB20Pu7WQVIotJBVD75mWOfISf63M0MZPqgPxEfX2UVkhuRbiXTKrse
 GL4OSi2fetSYFfGzIvb3dc/Id7Fq4USF3zDaXvsYRH4A91YWv7m79qdDflrFRHcuDLHt
 d4yg==
X-Gm-Message-State: APuU4Z8uN7OHdslrU9by+UsQiUmvYzxtPEtWUxQ/YR68COsrlfXxfaOk
 0EjchqmR5BH7DyHK2JPiMj4CSAsrzGYtOqrMIqWkSoi1DhmGOpfvqa0/gwYFWrVl
X-Gm-Gg: AZFdTZd0Cja8RoblFq5LzMWPQZ2XIjSfS+5FpP20do7R4hu6u3OpLkFoKRDBKtrLsyb
 VJHWHhowdpHgl/kMILbyWlofXp189rjmD+nlRK6o2BeYEMZaG3XirojQHmucADs9opmETwKs6e1
 4TA5We68PhU09mwvJ2OyKKfq0t8u6BMBWYqbp+AE5JsMK6RxjKKKLnGUtKdl+J+m4j1LyG8lmB0
 kJV2CDyYFygHgqZGur/WOwXrKGTu63zcqhB9DcWWDnnUnzY24ZCi/YXbIyKbfXIMbWxeJGBXplS
 eaZ5RK/y3VxRrhtigVIvOv7J99TOHM2TaSvCmPMkVZKtZ+IZw/Slcx++NS25fVWGSe1Rm+Luu77
 UqaI5wmM1B6TJ6mpIZe1LbgFiGpljVi0DGLjfUrWW8KzSR1qQoA0V7swlnAvAiweHmVBbinFil5
 CvIdjAeH2WNwuDCBtfvTGi1jl66lXAzva5LvzOeDX+zBQILdfxmyPacvNzkR+4EYlnbtrodtKb7
 g3eowqpeMiuN78uPtd3E+6TgoYEaUli9gEUX5d4np0XZiLz/uXq/qSxyIIe+Mn13aEjq6aEschL
 ID/tbLDigMro+s+V/1LrPky44jfxM+YuszX+ZptiXXl07TdNnuazU5kkzlY9uYErKAZtL5h1cmj
 W8wpCURI2w1JWEA7aDMoQYrdYZRc=
X-Received: by 2002:a5d:428b:0:b0:49d:78ad:a2ec with SMTP id
 ffacd0b85a97d-4abb47b1ba6mr14490518f8f.25.1795381805492; 
 Sun, 22 Nov 2026 13:10:05 -0800 (PST)
Received: from fedora.speedport.ip
 (p200300f5bf18ab2ae5bbfb8de26be908.dip0.t-ipconnect.de.
 [2003:f5:bf18:ab2a:e5bb:fb8d:e26b:e908])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bc8ce06sm17822034f8f.47.2026.11.22.13.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 13:10:05 -0800 (PST)
From: aleskxyz <aleskxyz@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>, aleskxyz <aleskxyz@gmail.com>
Subject: [PATCH 0/1] drm/xe/hwmon: DG2 fan-table follow-up on 168027 v3
Date: Sun, 22 Nov 2026 22:09:29 +0100
Message-ID: <20261122210931.66822-1-aleskxyz@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015190113.1268522-1-karthik.poosa@intel.com>
References: <20261015190113.1268522-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an add-on to 168027 v3, not a rewrite of the Battlemage path.
Every extra branch is gated on XE_DG2.

DG2 does not apply the BMG FSC encoding (one point per write, then a
count commit). The dual-point Set used here matches the Arc A Windows
KMD path for IP 12.70, then was checked on A310 with xe: fan 0,
subcommand 1 is the point count, subcommand 2 packs two 8/8 points per
dword. enable=2 is subcommand 1 with count 0, which restores factory
control. The BMG subcommand-0 count write does not.

Point counts are even (2-10). An odd last pack is one real point plus
(0,0) and is not applied. There is no user or stock GET; stock-mode
auto_point reads as 0. The Intel Graphics Software default curve
(25/0..97/90) is only a seed when enable=1 finds an empty USER table.
It is not shown in enable=2 and is not sent on reset.

Tested on Sparkle A310 (8086:56a6) with xe. Dual-point Set moves RPM
(~6500 at 100%); enable=2 count 0 returns factory (~3300); a 3-point
35/100% table stays ~3000, the even 4-point control reaches ~6500.

Not tested: 2-fan A750/A770 (whether pwm1 drives both tachs) and Arc A
laptops. Probe still does not send count 0, so after rebind sysfs can
say enable=2 while firmware still has the last table; that is a
possible follow-up.

LLM coding assistants (Cursor, Claude) were used to draft and iterate
the DG2 encoder. I reviewed the mailbox encoding against A310 tests
and take DCO responsibility for the patch.

Signed-off-by: aleskxyz <aleskxyz@gmail.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 170 +++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode_api.h |   2 +
 2 files changed, 170 insertions(+), 2 deletions(-)
