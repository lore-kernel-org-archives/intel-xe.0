Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05E7D2F7D1
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 11:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950E510E049;
	Fri,  5 Dec 2025 11:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="heSebT0Y";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDD610E049
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 11:10:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42e2e2eccd2so1304619f8f.1
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Dec 2025 03:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764933036; x=1765537836; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zh3HlpbXaEbsFU72svAbecwrRCi03W2DYbr0+25RALI=;
 b=heSebT0YwLGcFfctAD/6K7k3zouyyHKgVuoH6CbMYmHdoISCxMc4FOkZ5K62PPedxM
 8e9BOEjhBKkycD/dplmKWz+y2VGBm8H+YDFAaBHMZcX1jZLrnDX4PJ2N2BT4SqoUE3ko
 xH8kJUOv0cFKS7RukqAmNGyLexCpE7Kia1Ptdxwzi895w5rpepqMrQhCw5GsEqwpvsgY
 pRas8J+iBzVdes2IjI5c8vHM1YIkppBLOknHkbt2yldTr0USOaEl8wAV4J9ETISZw+vE
 Pt9Jeq9bCazVAWs8ohLPaMC+OLEQDNj4CDZ4lwf0oEvX38n12l+pgIbMDSDvkQ3VhMam
 sN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764933036; x=1765537836;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zh3HlpbXaEbsFU72svAbecwrRCi03W2DYbr0+25RALI=;
 b=Bp/p3vfpzmsBRyX0gSH6bi6u3Ap0N1UJkFus+kVSpifa9fUlb8tt7c18Prb1CDxxA2
 754TZW1k+DJ6d+iqb+kaIb+Oo47/dVsBxCc7xqmwQe6iRKkQpOoC4urjn06I9GcIcdOA
 VOr0mXfQv8qC/h1UIOkMQa+kI5Blmh0jPTvXUcuIr3NYMCozmh6XnqmQ/c49tlx9nF5j
 CXXALwZN1fG0BXOCeQc3yLiNM16S8kh/cCk/ncHObYwlkM64mBMXl8MPfpgAfpguzvg4
 7xnya0Tt7UnZt6ekmzzvBdw0gi56wLVe1ECsOHKnIu/9ACAl6CxRhCFTqv5MQL2+fkvj
 y0bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWci4RiWWKwlZZ/q7kJvK7WNYz2pRLySs1+LgTJxKlSHOviXFBU75WYUVKKmh4RRBfkGfM/jy59lA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC7z5zCEMpovK9saHHzE9+vfRmstCZ/eHiRGxUVUzon3NNXLwi
 D2dD6s6dTGkddE6rSl918IsrpE4jdkktcpMqQfgjzSwYojgfv3RwEfKZUC1J5/0JCo8=
X-Gm-Gg: ASbGncsqRtLcYdjX5sBYJyBzO5GcfmAsGCbbmP/ODA5efBNvsrrVfofelvQfujk1nid
 r82WUSHCf0mZrNOdbBGDSwvxTtA/gjDZtTRyItob+xBJgdIkepbdbg2L4aAzZUVyAtd1LTK5tG/
 zSZc+4e4o7xDq6IVyGk1odjRpNmwZ+cbpEGE3mSK2I1xX4mPzQLbV4KNhs6nQOy0yz5TSKA9BgL
 bSY1ZzCNKPFzrekovRuxRUNJcAomd+hMiQrYQXyEEFmnSC/P7CLfoYzzu0kvgsx8Q5GClZ8szRn
 7W/CPq8XHmWUzfWpQ782xTRcPqacS7mpKvbmJcMp/wlQcyYqi2/X5GhZ0z7GrKws7hFaW7WiGCY
 u2wKsq26JotI2tGqhvNbpofDJuf+czfhBB2aS21UzOcRjFqIs2Ws4T6E6vLeW/P7PU8jKKRrARh
 R1h9XTZiOLt0lp3yOjk4HrFcFuHTk=
X-Google-Smtp-Source: AGHT+IFBPmoLYadSLlgUwTUBgvI/LNUXNDFZy6frbQ03ZessPie4IT5h/pfwlVJys+MolOQK0aUa6w==
X-Received: by 2002:a05:6000:22c2:b0:42b:3c25:cd06 with SMTP id
 ffacd0b85a97d-42f731729b0mr10031252f8f.22.1764933035867; 
 Fri, 05 Dec 2025 03:10:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42f7d2231dfsm8337840f8f.26.2025.12.05.03.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 03:10:35 -0800 (PST)
Date: Fri, 5 Dec 2025 14:10:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/vf: fix return type in vf_migration_init_late()
Message-ID: <aTK9pwJ_roc8vpDi@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The vf_migration_init_late() function is supposed to return zero on
success and negative error codes on failure.  The error code
eventually gets propagated back to the probe() function and returned.
The problem is it's declared as type bool so it returns true on
error.  Change it to type int instead.

Fixes: 2e2dab20dd66 ("drm/xe/vf: Enable VF migration only on supported GuC versions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 86423a799d57..1b75405b8d02 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -226,7 +226,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	vf_migration_init_early(xe);
 }
 
-static bool vf_migration_init_late(struct xe_device *xe)
+static int vf_migration_init_late(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	struct xe_uc_fw_version guc_version;
-- 
2.51.0

