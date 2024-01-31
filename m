Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96032C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 08:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489E6113A9C;
	Wed, 31 Jan 2024 08:58:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B956113A9C
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706691534; x=1738227534;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9EEE0v0/i3HU0lspuGbvirf/BIIUae4vcdOMfES3hIU=;
 b=JpD+jHWKBnn0PFmdbITh+yIKFPVCrXJ/+10jbhvjncubQ5+TvJ9mGp8U
 vsWuqnGG/1RAHIBRfLBDQVyIgADLvoIGKqn+93KZVdZQ/qYuzNrxHuY8u
 OUMiqfAvIMlk1GDWoZ92OqR4n8+8SC5DEQkKAG1Lw9ArJAvYWxxyxU6Eh
 YNs1anXti9tbJARxtEU2nQ2Te2wI7TcVRqw5TU8giIWuZbe2vsPpO+7SC
 dStZ+istRX4tkuvrrx0/B9kUqcQB+XYQxqxiFsV6i7tA7xKD7eIo6hScr
 o5AH5pHVlq8TlO/hI8qqNbC/yOSntC6RdoidTUWGsZqgSQNEERO/1uhmT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10640590"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10640590"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 00:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911727054"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="911727054"
Received: from abarrete-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.174])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 00:58:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/xe: Make a standalone snapshot to that survives
 unbind
In-Reply-To: <20240130223709.50881-2-rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240130223709.50881-1-rodrigo.vivi@intel.com>
 <20240130223709.50881-2-rodrigo.vivi@intel.com>
Date: Wed, 31 Jan 2024 10:58:46 +0200
Message-ID: <87jznpj2ux.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 30 Jan 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> Instead of having the coredump embedded to the xe device,
> let's dynamically allocate that and remove only when
> requested by devcoredump.

[snip]

> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 50dac1a5b053..4372f5cc98b6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -214,7 +214,7 @@ struct xe_device {
>  	struct drm_device drm;
>  
>  	/** @devcoredump: device coredump */
> -	struct xe_devcoredump devcoredump;
> +	struct xe_devcoredump *devcoredump;

Yes! I *much* prefer having pointer members in struct xe_device over
embedding structs, for anything where pointer chasing is not a
performance issue. Which is most things, really. Ditto in struct
drm_i915_private, but converting now is a lot of churn.

Anyway, with dynamic allocation you also don't need the type definition
here. You can just forward declare, and drop the include. This file here
is included by absolutely everywhere, and by proxy, so is
xe_devcoredump_types.h. Modify xe_devcoredump_types.h, and you need to
rebuild the entire driver, including all of display. It adds up.

For added bonus, move the struct definitions inside xe_devcoredump.c,
and make struct xe_devcoredump an opaque pointer. This is one of the few
things C has to enforce use of interfaces to access data. There's no
reason for anyone outside of xe_devcoredump.c to directly access
xe->devcoredump. And making the pointer opaque guarantees nobody
bypasses the interfaces in a whim. Those things happen, "I just quickly
...", and you end up in a mess.


BR,
Jani.


-- 
Jani Nikula, Intel
