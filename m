Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC53CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 11:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA6C10E4B5;
	Thu, 12 Oct 2023 11:56:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B3D10E4B5
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697111817; x=1728647817;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Z8gIVFHJlXToYQgDBKWf4WhmhaL434Kry+G9XtWGXF8=;
 b=PeU8Q6lY/VMpSAwu3WgLYxllkSPt9+N4dH+bV3Y6pVxiyw24G2xtWoBc
 wtqBv1H0FJt7SwAoCSDwOBnOv8QFuFoOPqzjdn0N6p7qKiVRaJNPjsQ7p
 7BwdOaUi2lZ6EZK8e1Ffr/jokhOfNDkXZg2UCu4v6An93yUGAAcbFsMyu
 14RDq7hibZNhunJjAPxz6d+WC+j2jaJQHZoEb6hrwBnYw/ZCHYiRQk/V9
 kfRo7IEILCwkMukj9XAiQsoUlAfigZOaqgOx3J7+b4BSCL3wyX+JS4kEl
 M+jsz/vL8BsHF/r61qeJE0I/cGmLbQeS0zUuNEqYArhcBOaDvjHth8UU1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="369967465"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="369967465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 04:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704134069"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="704134069"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 04:56:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
In-Reply-To: <SJ1PR11MB612979618F7681A6887D9E68B9D3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
 <87r0m02op1.fsf@intel.com>
 <SJ1PR11MB612979618F7681A6887D9E68B9D3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Date: Thu, 12 Oct 2023 14:56:52 +0300
Message-ID: <87ttqw12bf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2 0/6] Fix compatibility issue for intel_dmc
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

On Thu, 12 Oct 2023, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> Hello Jani,
>
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Thursday, October 12, 2023 2:38 PM
>> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Shankar, Uma <uma.shankar@intel.com>; Manna, Animesh
>> <animesh.manna@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>
>> Subject: Re: [PATCH v2 0/6] Fix compatibility issue for intel_dmc
>> 
>> On Thu, 12 Oct 2023, Chaitanya Kumar Borah
>> <chaitanya.kumar.borah@intel.com> wrote:
>> > This series reverts hacky #ifdefs from intel_dmc
>> >
>> > v2: Rebase
>> >
>> > Acked-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> Mmh, come to think of it, the last three patches probably also need to be
>> fixup! drm/xe/display: Implement display support.
>> 
>
> Just so that I understand correctly, we need to add the header
> inclusion as fix ups?

I think so yes. Everything under compat-i915-headers has been added in
"drm/xe/display: Implement display support".

>
> Regards
>
> Chaitanya
>
>> BR,
>> Jani.
>> 
>> 
>> >
>> > Chaitanya Kumar Borah (6):
>> >   Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
>> >   drm/i915: Add wrapper for getting display step
>> >   fixup! drm/xe/display: Implement display support
>> >   drm/xe: Add intel_step.h compatibility header
>> >   drm/xe: Add i915_gpu_error.h compatibility header
>> >   drm/xe: Add intel_uc_fw.h compatibility header

These three.


>> >
>> >  drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
>> >  drivers/gpu/drm/i915/intel_step.c             |  5 +++++
>> >  drivers/gpu/drm/i915/intel_step.h             |  1 +
>> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
>> >  .../xe/compat-i915-headers/i915_gpu_error.h   | 18 +++++++++++++++++
>> >  .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
>> >  .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 12 +++++++++++
>> >  7 files changed, 61 insertions(+), 18 deletions(-)  create mode
>> > 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
>> >  create mode 100644
>> > drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
>> >  create mode 100644
>> > drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
