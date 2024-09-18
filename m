Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B7DC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 06:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6BA10E533;
	Wed, 18 Sep 2024 06:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVbQnjlI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB69610E533;
 Wed, 18 Sep 2024 06:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726640774; x=1758176774;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Cw6GCroHh7iyzfXGXrkMCEe/4UvolMBb7aXMahBqfZM=;
 b=mVbQnjlIgRrdbsSSgPnjTSr2w2FNnEHCZh7VNZnS2T4THL0+WEjYM/TP
 lXmR0O8e8bS6QjR8wqEGoH4KM5trOENQ/wFggyjCVvPQELL5fuNj1RSEn
 0wMwn4eARIlshO+zdPrtMcR94KeUfyXcNkclhzvcpc14/k9gBB3I5luaL
 EndpP513V7Trxnd/07BmeKcVcnmL0DElbCGCKa57baP1zf4qZxKIlGwEq
 ZE7iesHZ8bVhUh45BpypMQPvdCFip4ssfk7QtP8arztCD35bNBc4HIm6M
 wiZlqvRRLCC8LGMnQE2BoGi/9w8lK3rj7XBs/0rUgpX25eNNP2AKT2LO8 w==;
X-CSE-ConnectionGUID: JL14HAJQQLe7VBxg5gZO3w==
X-CSE-MsgGUID: j8DPryrpSjumrtcYf+XVog==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25352902"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25352902"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 23:26:14 -0700
X-CSE-ConnectionGUID: /WEJHEs9RL6bKdny8MRunA==
X-CSE-MsgGUID: RQMOoQowTwCm8mD+Mon02Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="70229841"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 23:26:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 03/22] drm/i915/fb: convert parts of intel_fb.c to
 struct drm_gem_object
In-Reply-To: <2ddf117d-8007-47ba-b7e8-b7d2d58d1573@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1726589119.git.jani.nikula@intel.com>
 <2751dd56c9b45e0ace9b57b861aa0a78d75e779c.1726589119.git.jani.nikula@intel.com>
 <2ddf117d-8007-47ba-b7e8-b7d2d58d1573@linux.intel.com>
Date: Wed, 18 Sep 2024 09:26:08 +0300
Message-ID: <87y13pbhq7.fsf@intel.com>
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

On Tue, 17 Sep 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Den 2024-09-17 kl. 18:13, skrev Jani Nikula:
>> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
>> index d564fb7d85e5..f57b684050da 100644
>> --- a/drivers/gpu/drm/xe/display/intel_bo.c
>> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
>> @@ -10,3 +10,13 @@ bool intel_bo_is_tiled(struct drm_gem_object *obj)
>>  	/* legacy tiling is unused */
>>  	return false;
>>  }
>> +
>> +bool intel_bo_is_userptr(struct drm_gem_object *obj)
>> +{
>> +	/* legacy tiling is unused */
> This comment should be 'xe does not have userptr bos'. :)

Ack, I just copy-pasted this from compat i915_gem_object_is_userptr().

BR,
Jani.

>> +	return false;
>> +}
>> +
>> +void intel_bo_flush_if_display(struct drm_gem_object *obj)
>> +{
>> +}
>

-- 
Jani Nikula, Intel
