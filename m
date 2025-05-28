Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA06C5B555
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49C210E5C2;
	Wed, 28 May 2025 09:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PmiCbTJi";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A4110E5BB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:13:25 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so29617915e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423604; x=1749028404; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qE1J46FoBAJitXj1m8vWSPEGkQ+jGKiXPyegG+/SpTI=;
 b=PmiCbTJiy/w+Uxkr17yglQg2jGmRmGXcvQUmg1TbS6mYkO4v0vXwJ9FgXV3KRmnyJg
 csVs4Q72d5oFGNIOWqkKi54IxJSfHiq3UU9jillzZICMrizshWPFFAyUU1oRdGObJ0K0
 sZ17gsUsQUjfh8aLW5yRMKkSDuKww9MI+SPrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423604; x=1749028404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qE1J46FoBAJitXj1m8vWSPEGkQ+jGKiXPyegG+/SpTI=;
 b=P5HYQEMpQ4oLQtXnJ6lH38AS7NZleZ6sfIlqtG6q0e0kskrv6dLy0TGUiLnATCeAsR
 DFulQ6IRj4HdX9JcUMld7BDOXR3jgiMVvk6mUDXbkLoLVUvHvbaEsE9Lxv1A6i9CK6Et
 2QfD85+JMEbfII4v+pO/qRo72CkqAxebc2FWrZZL97tPzIMcCsQKzL2rhgmL1QAvjILb
 /2TnNdja+9AJtZme9Ou354+wFTsizebLazRrxxlFgQtrUJqYWRwtiGED34VUYmvSQow4
 wXv+2r8WWhkBDaoP2FKoal3P2Fx1i/EqoICdeb5XyA72xPq+SCU/CGDGVu3TMjkx8fpA
 sBvg==
X-Gm-Message-State: AOJu0Yycupq/7SrLaMDmeERIfdMrBt9uOZkrsvLPLCTTXo44IeKt9L55
 a96iYBiO/JxbTpLs5RdQHF1aiIfoko9RWSeGXgv/aspftDYoaBCsgI/WN6UrOfEff8Y=
X-Gm-Gg: ASbGncvfMz9bbAnzcK6McDfuvPU1orDHm0SCel9HWW6WnlP6M5gI3+5P6O878XVARci
 2U8nxX3nPY1qdlj0eDRHqlCcnVRL+QILCPub18JpQtAiGjX43KJIboRRG05ACPzdjGN4ah33E8V
 KhSGpNmlXt5yZwnf1H2cufHtNOttWUZRKQ51oG89uaHu86/M8U63t2bsnrHCpFvDDjdxBj/dQ8Y
 SAjCE0vhwz3TGgz+USi2TcjABpbgkeSkkVHunh/ASXzIvtDChBxCoxQhDXv2Bph9aJ91oEEVgN6
 Z0xciLCJ1smtnVuhx9J+WZiJG7b9YcWnUEV8Zecxbr8vMFjqBoR3oU2uzbIFeHU=
X-Google-Smtp-Source: AGHT+IEl4ra8RUOaI+5/H5P2jSSuex3Nu8eBIcc9Q+A1x9PSyFfWR4vZKMKNUZELTXvYj6FyAPzHSA==
X-Received: by 2002:a05:600c:35d3:b0:442:f4a3:b5ec with SMTP id
 5b1f17b1804b1-44c9301650cmr163046715e9.4.1748423603663; 
 Wed, 28 May 2025 02:13:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:23 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
Date: Wed, 28 May 2025 11:13:02 +0200
Message-ID: <20250528091307.1894940-5-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Handles are per-file, not global, so this makes no sense. Plus it's
set only after calling drm_gem_handle_create(), and drivers are not
allowed to further intialize a bo after that function has published it
already.

It is also entirely unused, which helps enormously with removing it
:-)

Since we're still holding a reference to the bo nothing bad can
happen, hence not cc: stable material.

Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
---
 drivers/accel/qaic/qaic.h      | 2 --
 drivers/accel/qaic/qaic_data.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 0dbb8e32e4b9..7817ce18b8f2 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -213,8 +213,6 @@ struct qaic_bo {
 	bool			sliced;
 	/* Request ID of this BO if it is queued for execution */
 	u16			req_id;
-	/* Handle assigned to this BO */
-	u32			handle;
 	/* Wait on this for completion of DMA transfer of this BO */
 	struct completion	xfer_done;
 	/*
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 1bce1af7c72c..797289e9d780 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -731,7 +731,6 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (ret)
 		goto free_bo;
 
-	bo->handle = args->handle;
 	drm_gem_object_put(obj);
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
-- 
2.49.0

