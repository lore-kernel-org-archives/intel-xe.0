Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACDDC61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 04:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B0910E2D9;
	Fri, 28 Aug 2026 04:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKeIl7Ig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BF510E2D9
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 04:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787890908; x=1819426908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZlSVNJ1di6Zat4AF9ahNhTgiwYZ86Pqg2hdAIasO/z8=;
 b=oKeIl7IgEceaPcplztYCqcOrOu4rXxnbbSxBNDye+2OId4KK1z6HdV/y
 BNirLNljmFpvH9bIlnsZ57tyQQvDEoBQih2N6vIL1tSFutTP+QdjPBc+o
 Ekn2DLYjJxqCemtJ9579Whp31lXjIw0rxi/yKavnWMWGEHZRoRMV4/Oxf
 gN8444o7pd3WQwkAPwuJauDD2TQWH+Ib7aB2LLplJUZVHoG69Cn4c3uAu
 rC2OEbnodQSRGQGKYTo7W5/XZmmf0i2BvCIbpGQpC8Qc+BU/twiX8jrkV
 POWAd9iDc5+iZL9e7ll4i+hE+/RtdQvsrfW/6N+6GNVns2K2NOOIVEqPu w==;
X-CSE-ConnectionGUID: AUN8M0xASu2+dtNBOlIoTw==
X-CSE-MsgGUID: GwnIyJPBTEiHECLpdOyd0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88162809"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="88162809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 21:21:48 -0700
X-CSE-ConnectionGUID: MXLXsvmeTCqI9Y/q24JYeQ==
X-CSE-MsgGUID: 4Jz1rypsQG+bvvGNQtz5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="268075397"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 21:21:47 -0700
Date: Fri, 28 Aug 2026 06:21:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 lukasz.laguna@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v1] drm/xe: Introduce xe_wedge
Message-ID: <apEM168MvU8R9R36@black.igk.intel.com>
References: <20260825114450.1371821-1-raag.jadav@intel.com>
 <e7b7a00e-37b2-4be7-a275-f339c84d82ab@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7b7a00e-37b2-4be7-a275-f339c84d82ab@intel.com>
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

On Thu, Aug 27, 2026 at 07:38:14PM +0200, Michal Wajdeczko wrote:
> On 8/25/2026 1:42 PM, Raag Jadav wrote:
> > Consolidates all wedging implementation into a dedicated xe_wedge
> > component. While at it, add a worker to schedule the wedge handling to

...

> > +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> 
> as we are adding/renaming functions, should we combine two old:
> 
> 	xe_device_declare_wedged(xe)
> and	xe_device_set_wedged_method(xe, method)
> 
> functions into single new:
> 
> 	xe_wedge_declare(xe, method)
> 
> as we either already know the recovery method or can use
> default one

This was already on my backlog after FLR, including other improvements
to xe_gt_declare_wedged().

...

> > +static void wedged_work(struct work_struct *work)
> > +{
> > +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> > +	struct xe_gt *gt;
> > +	u8 id;
> > +
> > +	for_each_gt(gt, xe, id)
> > +		xe_gt_declare_wedged(gt);
> 
> is it ok to do that in the async worker?

There are mutexes deep inside it. I have a cleanup in mind but it
requires landing FLR series.

...

> > +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> 
> maybe this can be static - all we need is to move here also
> debugfs stuff that adds "wedged_mode" attribute

Shouldn't it be the other way around? Keep it consolidated into debugfs?

Raag
