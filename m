Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A3CCD343F
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 07:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E4810F236;
	Thu, 21 May 2026 07:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gr7rdSsI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A1F10F236
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 07:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779349876; x=1810885876;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j/gTHCrP9Cm5wXdqMubdnUnKaSwWamTEbrkJzIb4KLE=;
 b=gr7rdSsI6tcJ+9pE9gZUxbWjttx04P6iAVPMD9WhXS7KI2edpO9P78hN
 We33ucM/YGbaOLT7/zP6CjX99svfaNzFMH0b8SPS0sU4f/cHe9vWDLeL+
 FID8Bj7OoYa8Ra3gE0PM0q7zFD416/+s12P0A9HPnwsShOls8H2cOdG7f
 K7/YchF2XLXl0qjYjoasLxy0tOyAEr/kGHRrITjjplcskSseOAmJS2+x8
 +CHdR/eSUU7++bVGcHkbd1mEbxyB1uDZ2aMSdLBmIhn2VZA0Mh0nSlq7S
 kpppwMjcSOsZbOdvcSugP4vYgeSu5pmC6EC9JjOVzebjhnWaeFk66KBHI g==;
X-CSE-ConnectionGUID: dDZrlYjfRfKGOobGjAhx0w==
X-CSE-MsgGUID: ANfzSSbqTOmxANeMSXc6Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79412508"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="79412508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 00:51:16 -0700
X-CSE-ConnectionGUID: Na/9ktu7RAKZtCr54RIIkw==
X-CSE-MsgGUID: HnO+do2gS6q44sp+EsGpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="240690741"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa007.jf.intel.com with ESMTP; 21 May 2026 00:51:15 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH v2 1/2] drm/xe: Fix return type of disable_late_binding_set()
 in debugfs
Date: Thu, 21 May 2026 13:15:02 +0530
Message-Id: <20260521074502.2112483-1-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521060338.2112191-3-mohanram.meenakshisundaram@intel.com>
References: <20260521060338.2112191-3-mohanram.meenakshisundaram@intel.com>
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

Sorry for creating this new series by mistake, I already replied [1] to original series
Don't review this patch

[1] https://patchwork.freedesktop.org/series/166914
