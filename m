Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BD9D63930
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 12:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB8F10E733;
	Wed, 20 Nov 2024 12:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUd5IYoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A323B10E733
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732104983; x=1763640983;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JqOB7pRdHhTYOqg5dUyBfMoH8dqHhGkQi0g6QvoL2pA=;
 b=PUd5IYoPKtQVLYXmvFvcBgfEoMdBSCuZ/sRxLHU82Wx+Ck1OBdTDfoAB
 yfJUdgr9gn0cBc0WkGNk2L/tEpfrDtsL8sAXwfq0u6CeSe9il8ZXdFKIi
 Lz/4I3pnAJgkUktDdWphCruiAW1huOah1z4swmiHF/yLjwMscVLvrRUtx
 QktjQHf4p9IcCT0PbLfs2AZnT+FfkV8R182k+97lFaa1zxYanecf/tJRl
 7161IBpFWJdBwznmEDw1FGAm1/qo1gFy+Blvo2TmybkT9n2IkC+47uaxN
 560rh3MBetembJUwpZzKiydVdHYfuO0sazSqlmoTNzY3J4WDLdvpvmy02 w==;
X-CSE-ConnectionGUID: r2ZjTbCsRjGsm36J8zakDw==
X-CSE-MsgGUID: Qemuw4aZQ4KAKeVLHp4TCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35830549"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="35830549"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 04:16:22 -0800
X-CSE-ConnectionGUID: 3GE8fC5cQKSsK6yV7XnBNg==
X-CSE-MsgGUID: 7BVe8CC0Tc6TI3NX+dJvqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="127439307"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 04:16:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 ryszard.knop@intel.com
Subject: Re: [PATCH] drm/xe: Sort again the info flags
In-Reply-To: <pma4bikew4wnxhs2nczdzbbpz2yt77pvoy5xdxq23sg5cw4e3n@aypm5hztxb2v>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241118223314.1969166-1-lucas.demarchi@intel.com>
 <7f8fccfd-cb92-47bd-b6d3-bbed2a11094e@intel.com>
 <pma4bikew4wnxhs2nczdzbbpz2yt77pvoy5xdxq23sg5cw4e3n@aypm5hztxb2v>
Date: Wed, 20 Nov 2024 14:16:17 +0200
Message-ID: <87wmgy14oe.fsf@intel.com>
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

On Tue, 19 Nov 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Nov 19, 2024 at 10:51:58AM +0000, Matthew Auld wrote:
>>On 18/11/2024 22:33, Lucas De Marchi wrote:
>>>Those flags are supposed to be kept sorted alphabetically. Unfortunately
>>>it's a constant battle as new flags are added to the end or at random
>>>places. Sort it again.
>>>
>>>v2: Include the other non-has_* 1-bit flags in the sort
>>>
>>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/xe_device_types.h | 32 ++++++++++++++++------------
>>>  1 file changed, 18 insertions(+), 14 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>index 8592f1b02db11..8b2b12daa49dd 100644
>>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>@@ -294,14 +294,21 @@ struct xe_device {
>>>  		/** @info.va_bits: Maximum bits of a virtual address */
>>>  		u8 va_bits;
>>
>>Should we not document somewhere here that the below should be kept sorted?
>
> yes, probably. Also... we have the CI Hooks we should make better use of
> too. First check if the patch series changed drivers/gpu/drm/xe/xe_device_types.h
> at all and if it did, check that these flags are sorted. We should be
> able to add some quick and dirty checks so we don't have to keep
> changing it. Just need to make sure the output on what was
> the error is helpful, otherwise people will just ignore it.
>
> Ryszard / Jani  any thought on that idea?

Some random thoughts:

We need more transparency on all of CI. I still have no clue of all the
things that get run, where it's all hosted, how I could contribute
changes to it. I'm guessing maybe it's all out there somewhere, but I
find it difficult to figure out. A check like this would need to be
discoverable.

Something like this should be locally runnable. I know it's been hard to
get people to run even checkpatch or sparse, but it's just dumb noise to
get the first indication something's wrong in a CI result. And if you
don't block further runs based on this, it just burns resources.

On that last point, I think we should aim for reliable pass/fail, with
fast fail halting further resource intensive stuff. E.g. checkpatch is
not like this, we can't block on checkpatch failures, and due to this
the results tend to be ignored and we merge stuff with checkpatch
failures. Ditto with detailed checks like this, if it doesn't block
merging, it's bound to get ignored at times. (Side note, maybe we should
look into a limited checkpatch config that we could fail fast on?)

BR,
Jani.


-- 
Jani Nikula, Intel
