Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77384CF8861
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B9410E09C;
	Fri,  4 Oct 2024 22:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNioDv/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8F410E00D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728079561; x=1759615561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AKpDAuZ0/y4NnJb6PkJpHFPY4b+MIi+Apr8F01xYvjM=;
 b=YNioDv/CN9dXfZSOmYzgMdkG6zRcJiGYcmPcoD53N1LGEG2qb2Nm/khv
 dsNzx0UQ30XsuYs8uYWFmYSx9Fiy9BUQNQ5Pr37R5r3XWu9GhbV/ZhnI4
 WGQArhuaSblMPtccz7DtI65ITACFST1XyAPif+afVw8xEH3OYnmJWbKbs
 0YL/hZwGdY4JfVoEBE6iH8ZmsTXTNYsYVPd//7eErsXwTdys0i3CwYXz0
 QNUjAyyO7jhIf+vx2Xqaf/IERbtTA5lxvwGNleVYAggnPsbwR4M1gn6OY
 4RSNA7zmXVp6seJKphiLW/lL9X0PlLWA1CT2sYLzMJGnkYqxYwjUB0lCR g==;
X-CSE-ConnectionGUID: BmzbrNXrQ9GwIuGgKcEypg==
X-CSE-MsgGUID: IAOwgJU+RdCql1F0s6wrWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30199415"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="30199415"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:01 -0700
X-CSE-ConnectionGUID: ubBy5pQzQ4yRvrY6MSXWMg==
X-CSE-MsgGUID: TS9Bp+tgTVqoOcD1F2qDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74836968"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:05:59 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/6] drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
Date: Fri,  4 Oct 2024 15:05:45 -0700
Message-ID: <20241004220550.94308-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241004220550.94308-1-matthew.s.atwood@intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 6bd6adfdfc74..b16473818173 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -387,7 +387,7 @@ static const struct xe_pat_ops xe2_pat_ops = {
 
 void xe_pat_init_early(struct xe_device *xe)
 {
-	if (GRAPHICS_VER(xe) == 20) {
+	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
 		xe->pat.ops = &xe2_pat_ops;
 		xe->pat.table = xe2_pat_table;
 
-- 
2.45.0

