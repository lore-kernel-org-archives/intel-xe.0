Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E266EB7ED0
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 11:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E550A10E9D6;
	Wed,  4 Mar 2026 11:56:22 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873BF10E9D2;
 Wed,  4 Mar 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772625383; x=1804161383;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ri3HsTSLDu3EZafDIHqGSqeqZsYKpo8/LFagdvZSA0g=;
 b=fpHntbrRAc1dC1jR9WAiXCz9AfcyVraiY4eybrikhCHYDS8I2XEcVs8v
 McETxBadX7TXoVr0FjjD/QiecKsDqIDIlQRclVZ3IhXQQ3fbluZtqDqhR
 4RyhePj0hgfyWOWPhoo+WXGoZtr2wkwIf0DMJflWxdhYTPCj/YYDwH61l
 mBxj4thJyPXccjeh5SSuyE+MMWNvg57LpJW9NhZVe0oqXnu+kgQkGIHWD
 5mxas2jocsRNnM5i9vN6Em589AqSswFWKUYGg54OBL2BUuP3cNZyZLjh0
 bDPfrqt8X9XtQAcLzZoUypm3AKdhNt4bY1YKVtoCsogv5QYL2lCBXzlyh Q==;
X-CSE-ConnectionGUID: 0irivKYGQ06efU8q3VjGvg==
X-CSE-MsgGUID: 8tZpDlEETB6KtlND87GqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73751387"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73751387"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:56:12 -0800
X-CSE-ConnectionGUID: XdvuEKH4ShC67VQuiXOGtQ==
X-CSE-MsgGUID: HwkgNmTuQUaOT4ZTtXbigg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="217554542"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:56:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm/{i915,xe}: refactor register helpers
In-Reply-To: <aab6Y_u1dZjWrwWj@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1772042022.git.jani.nikula@intel.com>
 <aab6Y_u1dZjWrwWj@intel.com>
Date: Wed, 04 Mar 2026 13:56:07 +0200
Message-ID: <18693734614df43572488ea293c9b9b6639119d4@intel.com>
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

On Tue, 03 Mar 2026, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Wed, Feb 25, 2026 at 07:57:02PM +0200, Jani Nikula wrote:
>> I realized xe_reg_defs.h subtly pulls in i915_reg_defs.h from i915 via
>> the compat headers, which is ugly and wrong to say the least, and then
>> xe uses the macros all over the place.
>
> I also hadn't realized we had this mess o.O
>
>> 
>> Clean this up by creating two shared headers under include/drm/intel,
>> with some related cleanups on top.
>
> Nice idea on the common header and nice clean up.
>
> Either way is good but probably drm-intel-next is easier:
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks, pushed the lot to drm-intel-next.

BR,
Jani.

-- 
Jani Nikula, Intel
