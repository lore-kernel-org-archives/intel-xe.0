Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F01C3600B
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 15:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6953210E594;
	Tue, 25 Mar 2025 15:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAt3XH3E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9878A10E594
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742917126; x=1774453126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGHNTo/rF9l2saBVRKlUW4cHtX/0TT2Uy+Cxw+HCS40=;
 b=OAt3XH3EH/R69Gs6TSG3clnzQUrkCkkEVAN9r8crPHGM475EUnq4/2qg
 TZBYIYoOjLv5JUNtIJBZ5WtllFdZtXQZd2YmbzMEsljc02pSOUIgIV2ge
 ac3hRRFTZj2z5b7mN2Wa5w2z2hWA72SbJ+ak6PwHN0tdbLqrJKKn5yN0V
 v3TH8QXVudUfmtUOECTDc3P2kkH8dWorBykB04E42mO/tTrEqF/qOal4q
 GmYs6DRKl3u8/R6OPLmTr+m/18E8plRFzvbPS6NJTvSKt0Fpj6jNf83fj
 yp4hWKq2yI+bKq4PvOvrDwVo5pkmNjm7tPR9uYBnhDLXfmSl8+WU3OjYT w==;
X-CSE-ConnectionGUID: hp9ikcHVRQSAD5XeR7+a5A==
X-CSE-MsgGUID: pf+721fOTLm9hsbac4VJvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="47955239"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="47955239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:38:45 -0700
X-CSE-ConnectionGUID: laY+Fz2wRbqYxlHLUREbEA==
X-CSE-MsgGUID: ofHafgrlSd+SKl03Rb0RZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129461691"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:38:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, michal.wajdeczko@intel.com,
 vinay.belgaumkar@intel.com
Subject: Re: [PATCH v2 0/3] PMU support for function engine activity
Date: Tue, 25 Mar 2025 08:38:34 -0700
Message-ID: <174291706443.1040998.14597625946012575057.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250311071759.2117211-1-riana.tauro@intel.com>
References: <20250311071759.2117211-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Tue, 11 Mar 2025 12:47:56 +0530, Riana Tauro wrote:
> Extend PMU support for engine activity for PF and VF's.
> PMU provides two counters (engine-active-ticks, engine-total-ticks)
> to calculate engine activity. To get function engine activity from PF,
> the user must provide the function values using the format
> 
> function - config:44-59
> 
> [...]

Applied to drm-xe-next. Thanks for the patches and reviews.

[1/3] drm/xe: Add support for per-function engine activity
      commit: 2de3f38fbf89d3cb96d1237aa7a10c0f6480f450
[2/3] drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
      commit: 8a4339fe2422a8080e45b76b4938827c807dcd52
[3/3] drm/xe/pf: Enable per-function engine activity stats
      commit: bf6cb06c0e05ff6fb5bfab3e5d7c22e4617e23e0

Best regards,
-- 
Lucas De Marchi

