Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389AEC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 21:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E549B10E413;
	Mon, 24 Feb 2025 21:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZkZrsJH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D29710E413
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740432519; x=1771968519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FGsRD97tMrmusq88Ntux7lSf4YP4EmwfgHrY9UAprMg=;
 b=XZkZrsJHyCzjj/+1E4JRhrlPmXu0LXRt1IWSbmMAZWbzGOAcc0tBJmO8
 fKifdD5o9X86kXRqkYVk97jzevIDtHsj8C+OmZrYyEr5YkpUWhoFgKMuZ
 KKmv2Pbag2D4Yq/0JYZmcrp2m/W6eyWKHJBBXZU7hVkkNr9uCe3Z3MLOz
 KKLhATpQu75wHtsH3VEDift2j9eUdiuNdWRT4bgfCCZdatlttliMaOpEW
 +IsBw6kQbWYXcz9glNoQxHrNVv+snnbqtZriMOj+1AfcE8veZgQfhF4wQ
 aE1ApuExcsmlM0Fr32htbNotKfNQoeXwjGMV/d9YDVDIAayl7NeEF49jt A==;
X-CSE-ConnectionGUID: q1gTGwxiTHK6g835m2cc3w==
X-CSE-MsgGUID: vJjuMxJDSieRtjazWw523g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52205487"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="52205487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 13:28:36 -0800
X-CSE-ConnectionGUID: ge3ZvmbFSyi8Stk16ksdbA==
X-CSE-MsgGUID: bXbcXOf/RheJzDlbQ0lDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116679598"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 13:28:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH v9 0/5] PMU support for engine activity
Date: Mon, 24 Feb 2025 13:28:26 -0800
Message-ID: <174043248270.3551353.18155329890428345328.b4-ty@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224053903.2253539-1-riana.tauro@intel.com>
References: <20250224053903.2253539-1-riana.tauro@intel.com>
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


On Mon, 24 Feb 2025 11:08:57 +0530, Riana Tauro wrote:
> PMU provides two counters (engine-active-ticks, engine-total-ticks)
> to calculate engine activity. When querying this, user must group
> these 2 counters using the perf_event group mechanism to ensure
> both counters are sampled together.
> 
> To list the events
> 
> [...]

Applied to drm-xe-next, thanks!

[1/5] drm/xe: Add engine activity support
      commit: b729ea271e849c88f91ba51208e7ca3fb2f1bc4c
[2/5] drm/xe/trace: Add trace for engine activity
      commit: 9e19f42955ff9863c5fa17916502de38f138f456
[3/5] drm/xe/guc: Expose engine activity only for supported GuC version
      commit: 0e6ffdb2b740f3aab098e3a7857ddf53fe2e0059
[4/5] drm/xe/xe_pmu: Add PMU support for engine activity
      commit: 6978c5f5a64d4bdd6b00214368d5fe59f56e9890
[5/5] drm/xe/xe_pmu: Acquire forcewake on event init for engine events
      commit: c7f2b8bfca78be8880af3ae4b6719767d4832d92

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
