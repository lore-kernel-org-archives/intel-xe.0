Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF944C3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 07:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4C410E9CD;
	Fri,  9 May 2025 07:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwaOVt/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341FF10E9AE;
 Fri,  9 May 2025 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746776720; x=1778312720;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TxIeUew1IYMvTjU4udf1ygt1dT/zNKfYfUJZNZz/noc=;
 b=VwaOVt/ArlyV7pWWPWY/ZCjey9ISqGaZwpfl0tb88T5qiUxZIJOLWngt
 mn/CeYcAlHgUBZka4pRhoMh6hn74KlEnDg4pgGAB+ba/ibAZaRASbcPEv
 QvW1ciOI06MGzg103QIJrMkoOzRTnuNn8llgV08dScVFihGKhdNEKRXdw
 FVdhNpc9QhHmXdm0aDAb0Hz6I+ORJnujkVyEzy3b8lgosRwwms8278s6x
 DFsi0onjcl6WIkbUadcwEBGiFSDw7s0J8WzyKs8/eFCNdPm551DnTt8RF
 qBCYTJCi+BDshnBPYU64X1dcsSLVaq/AZVGcRTVqu9QDMt0ymygRhHopq g==;
X-CSE-ConnectionGUID: ebsv8e29TceS8MIS/OAyJQ==
X-CSE-MsgGUID: 4MktPSu4Tn+YrqnsJc7vHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48673162"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48673162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:45:20 -0700
X-CSE-ConnectionGUID: snzII8GWQAug8gCQByA6Yw==
X-CSE-MsgGUID: UjYmEgLSQtq560XXkpHl+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141318953"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:45:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@intel.com, Arun R Murthy
 <arun.r.murthy@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 Naveen Kumar <naveen1.kumar@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
In-Reply-To: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
Date: Fri, 09 May 2025 10:45:13 +0300
Message-ID: <87plgimdme.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 07 Apr 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Arun R Murthy (5):
>       drm/i915/display: Populate list of async supported formats/modifiers
>       drm/i915/display: Add function for format_mod_supported_async

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging these via drm-misc-next.

Maarten, I see that you did the final pull drm-misc-next pull request
yesterday... would you consider doing one more once this is merged so we
can get back in sync faster?

Thanks,
Jani.


-- 
Jani Nikula, Intel
