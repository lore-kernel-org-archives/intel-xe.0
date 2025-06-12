Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65273C71143
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 14:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F8010E880;
	Thu, 12 Jun 2025 14:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBEtRpzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8982810E880;
 Thu, 12 Jun 2025 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749739825; x=1781275825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3h9gypN1qx3R2sUQ7AyQtb8A+3I5sGBZrRNJ+su9FuM=;
 b=BBEtRpzx6Qpr+jm+uh2GoejuKtkdV42tfOxNHNlTqKFt2ib1+YhJ8j5D
 i5xE7SMJVl0hib8RCpZgO9mZSUUs0Pe3C2tgM8zA9uOKGNoMjlAQvUA1L
 NqeEu9lgsBp7ZJP/55enKE7lG5E4DnzmBwKYYUWSW4e5C1epWvKL58PXP
 8CDKmtfWPBoGp78B+whST3A9V0U4R7rK2XY9TFM5eUFw18k7CGMeMC1Vz
 EmLyJvv9xYOxhFlzDzvfqgj4g4nJAXrzGuiGU+00PcNOE6vLfqMGb00ky
 3HHnFtjXZHHfPoH05Z+YCzDkewAqCICtuSB+9Eio/+bc8QXWd37QKvlq9 A==;
X-CSE-ConnectionGUID: B26dJpcWRby8FAm1/14Vaw==
X-CSE-MsgGUID: IV2kNuEkScWBqHG5o6lIbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52066746"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="52066746"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 07:50:25 -0700
X-CSE-ConnectionGUID: RFW9trnVT7W3z4zs8Lj1Hw==
X-CSE-MsgGUID: 9VslDhBXTzuXGJO+LNZGXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152826176"
Received: from abityuts-desk.ger.corp.intel.com (HELO stinkbox)
 ([10.245.244.200])
 by orviesa005.jf.intel.com with SMTP; 12 Jun 2025 07:50:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 12 Jun 2025 17:50:22 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 1/6] drm/i915/dsb: Use intel_dsb_ins_align() in
 intel_dsb_align_tail()
Date: Thu, 12 Jun 2025 17:50:13 +0300
Message-ID: <20250612145018.8735-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612145018.8735-1-ville.syrjala@linux.intel.com>
References: <20250612145018.8735-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

If the free_post is not QW aligned we don't have to memset the
extra DW needed to make it so, as the only way that can happen
is via intel_dsb_reg_write_indexed() which already makes sure
the next DW is zeroed.

Not a big deal, but this is more consistent how all the other
stuff operates that puts instructions into the DSB buffer, and
we'll get a few more of those soon.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 4252eba7f7d0..96baef5d5b1a 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -527,6 +527,8 @@ static void intel_dsb_align_tail(struct intel_dsb *dsb)
 {
 	u32 aligned_tail, tail;
 
+	intel_dsb_ins_align(dsb);
+
 	tail = dsb->free_pos * 4;
 	aligned_tail = ALIGN(tail, CACHELINE_BYTES);
 
-- 
2.49.0

