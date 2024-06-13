Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E7BC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 06:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0864310E20F;
	Thu, 13 Jun 2024 06:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbtTSuKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BCB10E20F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718260312; x=1749796312;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j+BVol5DpoNfdgYCDOXoZNgd1t4x66PcAU4bKene/k0=;
 b=gbtTSuKyhbGX9lascOJMy0mHuYCh1lEArE9Jcrl2IFVSEtH5SIMKvymy
 ovY9GN0u/HNEPg6NZt5NXtoi9ToUX+di4fXfF+6xOKVFt1CFuJ69xr1EK
 uHKUb2QfvbqLz0krJKIiNts7nk3ZinnHfahHOVQ39I0k9K2lkt5OdeD8R
 H6v7Z+SJeO88bJZzTrXm+mMjmYjZTf7IeclHkaXpehqklg3hjHmtzhbE/
 wqTNppRqQdOy/4XejTGNKr+1/is8XbCmLsW/eFVuveIBXdQ5wdDJHClLT
 9StozkK3tJU8nQNNd3z84e9xeaByfnk7UVT2dSl51etnKHQsrk326tjqh A==;
X-CSE-ConnectionGUID: oZ2vHa/FTyKsf1wO5/AbRg==
X-CSE-MsgGUID: eMAF16hsR+6Eev8xn1ha4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15287833"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15287833"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:31:51 -0700
X-CSE-ConnectionGUID: BLzfgM6/SrGaBSKQAqRuZg==
X-CSE-MsgGUID: byvIm3ZnS6Cfr+uQWv1nvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="77489016"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:31:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [CI] drm/xe: Add xe_gt_clock_interval_to_ms helper
In-Reply-To: <20240611160846.2812036-1-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240611160846.2812036-1-matthew.brost@intel.com>
Date: Thu, 13 Jun 2024 09:31:46 +0300
Message-ID: <87zfrpica5.fsf@intel.com>
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

On Tue, 11 Jun 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> +static u64 div_u64_roundup(u64 n, u32 d)
> +{
> +	return div_u64(n + d - 1, d);
> +}

If math64.h doesn't offer what you need, maybe update it instead of
accumulating local variants?

BR,
Jani.


-- 
Jani Nikula, Intel
