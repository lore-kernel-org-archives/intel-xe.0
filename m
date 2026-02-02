Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E307E7FDF7
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45A10E4B5;
	Mon,  2 Feb 2026 21:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4gStIKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E17E10E4B3;
 Mon,  2 Feb 2026 21:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068669; x=1801604669;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=D2KiAw2jiuHzd3aPvnCnuxS6G/8zvv7CohabzQ3qViQ=;
 b=R4gStIKPJAplf9SuB++bFqXvzzP7sYbD4PKNj9hiVOrimK1bEbUPHGV2
 jgwyKWmoJaz2TO2tJtC4zkk3hjzrXk5rfcmEo39fqKrztjdEDBtgcXnWu
 PoVyutgExYIpsnW5l8jDKNNA5um+7wXhD5Q6rrKCDvQm6mDeZ7NYZe9ai
 172EFdV7oxSZGZz3jJV4RLpCMC+HaRnINqvhghoGiJ0bP/4STQIgRdb81
 qXOkkfnuHWVsezNJ9VXJvGHauUtt/HHbXIhPyKJ9yCt1+W+aCIYtoirXZ
 kIQCPgUszT8Qy86XmgJss/ALV8VsbQhBw7Fkl+kl+bk4KrZUHMGCb46ON g==;
X-CSE-ConnectionGUID: 0rC25LiZTfO782WrPW/3+w==
X-CSE-MsgGUID: dwAgwV8QShmp/vafhvM03w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814369"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:29 -0800
X-CSE-ConnectionGUID: 4J02nvIlQEKQensMQSThsg==
X-CSE-MsgGUID: xTo65c6aQiqTW/zYqoNN+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646891"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:27 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:22 -0300
Subject: [PATCH 16/16] drm/xe/nvlp: Define GuC firmware for NVL-P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-16-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 John Harrison <John.C.Harrison@Intel.com>
X-Mailer: b4 0.15-dev
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

From: John Harrison <John.C.Harrison@Intel.com>

Novalake P has different IP on each GT and requires a different GuC
for each. So add separate graphics and media GT entries or NVL-P.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6a8e692fd7a1..60c82b920f47 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,8 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 55, 4))	\
+	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 55, 4))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\

-- 
2.52.0

