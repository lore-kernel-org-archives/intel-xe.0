Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C43AD29C33
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 15:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9313010E114;
	Mon, 19 Jan 2026 15:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juIAald+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B41210E114
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768835971; x=1800371971;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AgHDjhkhnT1NskB2WGODKITFk5ExkD6CM2m+5RvyUrs=;
 b=juIAald+kymGMC+eRhuLj+B3VdEd2snwt53uAXWK/zKv66ib8SjqEHCb
 6ifeUDcaxUNlPvWtHG6X4YeJo84zEMh+ZQVzgpWEQxS3z1kX7i9PlF6SU
 aJ37SqZ53W4gzLeRDzMH/Nhuq6zh6I4Qiq01Hzt55BSjBer+6hc2MHr6C
 tz4yZTWORX2+FdzW9YQwL55WpY3iNmitcQeJhCKR4NYpAfkK1n/XEi+tP
 81pBtUWAkpC0KafWJo4QpEHHmR1z18trrpnQFnthX+2Rzrjo0vCAR4pW1
 92FVYDQGP2xdiP9yfNEpKtnfvAqgk/R+QpS5MBMUmZlo+YsDoiVwYNLze w==;
X-CSE-ConnectionGUID: i+Avbp2ZTO6ia828Z2HtFw==
X-CSE-MsgGUID: EVKAI4l1SCCrhrqlQo8cqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70209907"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="70209907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:19:30 -0800
X-CSE-ConnectionGUID: JtTbyNnKQNOtM9K1TalX0g==
X-CSE-MsgGUID: R4RonYHsRCqje8s7k0u/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="236565388"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.99])
 ([10.245.244.99])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:19:29 -0800
Message-ID: <eaf959db-5ab7-40e3-904b-58a37291b0f1@intel.com>
Date: Mon, 19 Jan 2026 15:19:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: derive mem copy capability from graphics version
To: Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
References: <20260119150304.1739757-2-nitin.r.gote@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260119150304.1739757-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 19/01/2026 15:03, Nitin Gote wrote:
> Drop .has_mem_copy_instr from the platform descriptors and compute
> it in xe_info_init() once handle_gmdid() populates graphics_verx100.
> Early init was running with graphics_verx100==0, so the old placement
> silently disabled MEM_COPY on every GMDID platform. Centralizing the

Nit: IMO the wording is odd here, it makes it sound like the old 
behaviour was to check GMDID in early init which ofc doesn't work. But 
it never it did that. Maybe just drop that entire sentence?

> GRAPHICS_VER(xe) >= 20 check keeps Xe2+ enabled and removes redundant
> per-platform plumbing for future Xe platforms.
> 
> Bspec: 57561
> 
> Fixes: 1e12dbae9d72 ("drm/xe/migrate: support MEM_COPY instruction")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
