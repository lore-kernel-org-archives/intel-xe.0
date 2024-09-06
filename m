Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB52E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7303310EB01;
	Fri,  6 Sep 2024 21:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4m/xDuG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E720010EB00
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659521; x=1757195521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2Fnv5Rf8koQLbE322dzGWWfOG7wjSSAFQQ4WX1mhEQ=;
 b=m4m/xDuGXsM8d1+L5ljQbQUyU1glNQtr0BtAOBYTs8vIDlJU7YbqUdTZ
 d/ivXsFm31aJCNe9deV4KTPVjpgknZgaULCUm4rKFxR8BQ2dRo5iEZght
 DnC52t+2ZsOIJID84apw9wkbb4uPuf+kHpvypT8jm+XAg3hAr93UMSfay
 Vz9HOWOxb15qZS76lS67i3wjiBr13aLYOGz/phn2E6CIXr+I3b4lUe/+4
 ijrD2/DirsM7Q5ufUd8oavD3WtvSkI5NL9jOMbuON2CF1mHvig3T9vUN7
 vDzA7rOmkhOQVfUeFtTQhSgIvlir09upYRVZedOEFNrTtJ2c5Pe9Jcw7h w==;
X-CSE-ConnectionGUID: w2CpnuZESUS/4JBeXypmQg==
X-CSE-MsgGUID: TfepMsUHQmqZl/qd5UDX0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580561"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580561"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:01 -0700
X-CSE-ConnectionGUID: Fm3CAcqwSlSRf8pJ4RXLWQ==
X-CSE-MsgGUID: Gb7t5JmuT7qKk35hF2ePug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656317"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:00 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 1/9] drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
Date: Fri,  6 Sep 2024 14:51:45 -0700
Message-ID: <20240906215153.31210-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe3 platforms use the same PAT tables as Xe2.

Bspec: 71582
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index f291a1730024..aad9345180e8 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -382,7 +382,7 @@ static const struct xe_pat_ops xe2_pat_ops = {
 
 void xe_pat_init_early(struct xe_device *xe)
 {
-	if (GRAPHICS_VER(xe) == 20) {
+	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
 		xe->pat.ops = &xe2_pat_ops;
 		xe->pat.table = xe2_pat_table;
 
-- 
2.44.0

