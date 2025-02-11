Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9831C021A5
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A13910E8B8;
	Wed, 12 Feb 2025 14:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel-corp-partner-google-com.20230601.gappssmtp.com header.i=@intel-corp-partner-google-com.20230601.gappssmtp.com header.b="TEoq36gq";
	dkim-atps=neutral
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FEE10E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 02:20:47 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e5b22d35268so4489849276.3
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739240446; x=1739845246; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zwr9/tQFz50zBK/rUZp+Db4GI+9+Uw67YPkTnUbcAvA=;
 b=TEoq36gq/bNuWL6rVlHfGZOg+k9qQlx8IHboeF+xnPphnPk0WvfSCOKaDoVI3C1kIH
 6KkZgSIzmP3hVrZ88WK7z21BJMcOkvyn3btt9XweJZxNzcFEgqU1TQeq/TISq5ZunnS6
 jkGT4gKroV4EvXFEEnSzDF1c08atcACOtpocwj4ngvYYzYAshevdwOXagZLsh+YFBg+h
 rFbAtnOVde0DfgsBB0826z9rgpyCG0hpgmOmerNgUXaDDKbYTXhvbl40nwxmd2DNM/bE
 gBLK6PdxF2mH+npaLHuSQODZkIxjcVV7Fu4MGJEa1xPoMBH+TPJkScYTZVVl6Fvk1ymQ
 kJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739240446; x=1739845246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zwr9/tQFz50zBK/rUZp+Db4GI+9+Uw67YPkTnUbcAvA=;
 b=Ry16/etrTjQy00S8y6oFy0r8JcBZLuUaSq+5yW2uXABtRPypnhvEcRlq4XMLzNCr/d
 EUK8/0rQz5dOj//bCTdeYwQXBYmXfap8FOcsXrQj6CsCjXXY6vGy7+AUa4WmlHFA2P2w
 niNdpdr68thZTeLgLJ/jl3nzq8I3z81DGvX3tqcpCqdwcMcq4q8FEljDxe/SiionysW0
 va0FhIE8cHRoYpXaXbv1M60krDLShtFqoCpwuIqgXegYpT0vygn8SYXAr3nE9a609rMw
 AI9/WiqrxyoXT6hLhQ0mh2W3UKLeZQvTCz3/TiTeBxHD9A4y5qwIdLpb6XLo5Ytgpm4w
 LFVQ==
X-Gm-Message-State: AOJu0Yzwz01/Gp0GzQbrYio/xtYhFvfpXx3/QkQjdwg/QczfGdDjYXHd
 uv6hAdpgvvci6niNVCNHAsTWbZFhveUdmasHs6mDtAx4tOs6BQvq8+Tc4P7rOcsVCPYZXWvMUDQ
 hI3o=
X-Gm-Gg: ASbGncsGqCldfKejE12Ofz6JJNa59DgV0MTo3LHo0a5Jfl++FzTdwtKhqAPnkBAtSLC
 2E7885+YwvkGbzMiLpQ9ol0OLrYpHQG7/tfOMR03CEe88bKVRVwikcTJjFEC0AnvSxq2NH9T1P5
 jERfF01vlsZDCFGKJZ1KgjT1atUe4dX6WVvK8rl3L+Ke5uv+2GiHIhBnhPKK0ta0PlLBCuWJwqo
 O4qxAvJYR31WD/GKex+DRKmSRBJj+5ij63JxGbTcrbiHi2Ypbt8WK3BgtCDpVSAiqu8DfqYZfP9
 1e3sx5evjGh+Y3PLKZoW5KMi/8a+llIkSs6uwQ9koLtqfFUy
X-Google-Smtp-Source: AGHT+IGC7o+88pqDfW0OeHLWJ/B7ycKEF4getxGxYLJBvqErPr6l6danVasZDvfXh2safAbofPN/zA==
X-Received: by 2002:a05:6902:1102:b0:e5b:3a59:525e with SMTP id
 3f1490d57ef6-e5b4619f45dmr13304256276.18.1739240445929; 
 Mon, 10 Feb 2025 18:20:45 -0800 (PST)
Received: from nucskully.lan ([192.254.97.188])
 by smtp.googlemail.com with ESMTPSA id
 3f1490d57ef6-e5b3a203ef8sm2860928276.13.2025.02.10.18.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 18:20:45 -0800 (PST)
From: Carlos Santa <carlos.santa@intel.corp-partner.google.com>
X-Google-Original-From: Carlos Santa
 <carlos.santa@intel-corp-partner.google.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 rodrigo.vivi@intel.com, carlos.santa@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Carlos Santa <carlos.santa@intel-corp-partner.google.com>
Subject: [RFC v2 4/6] drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Date: Mon, 10 Feb 2025 18:20:04 -0800
Message-ID: <20250211022006.23234-5-carlos.santa@intel-corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
References: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Feb 2025 14:09:49 +0000
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

From: Matthew Brost <matthew.brost@intel.com>

Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which accepts a user pointer
to populate the exec queue state so that a GPU hang can be replayed via
a Mesa tool.

v2: Update the value for HANG_REPLAY_STATE flag

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Carlos Santa <carlos.santa@intel-corp-partner.google.com>
---
 include/uapi/drm/xe_drm.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 892f54d3aa09..339c812cae1a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -204,8 +204,12 @@ struct drm_xe_ext_set_property {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/** @value: property value */
-	__u64 value;
+	union {
+		/** @value: property value */
+		__u64 value;
+		/** @ptr: pointer to user value */
+		__u64 ptr;
+	};
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -1210,6 +1214,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
+#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

