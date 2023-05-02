Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458ACC77B7E
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 09:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8C110E4E0;
	Tue,  2 May 2023 09:38:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF8A10E4E0
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683020308; x=1714556308;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CjDG/U9I7bMD4LbpgTJyOaSIoWVR2cQScR5Vh1TEKh4=;
 b=e5jJeI8ozx35Z7WXjQWbebSLV1JmrQJjT2vzI4bx1c8wPdlqKiZCZNeu
 u2FpjKyypUl84YNQk1ZnkkBE6eVnNNbFQu1ZthIEYJYZG7AKcvPPFqrNo
 3s26keLpNMfr/8DsAUDGAk7H0NLVkDuawPLmL1+gO05AovAz4KzZyUrKn
 a6JTS+R4xj0ceTlzgnUS776oH9NrBxeQAyu0LJno1QI1ez8xuse1AZepg
 m+osYOgC4RK8OFsdRX0DsR7sRuotlI5pJE2pKcXuq8f7QMoNusmyaQZHr
 zP+79KguTXoxCw0QqEtA4VhF43N0JVd1fbTotSdRxopvzGENtBS+LytYP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="413793803"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="413793803"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 02:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="646471384"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="646471384"
Received: from xinpan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 02:38:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
In-Reply-To: <SA1PR11MB70389B5E7E0207B638A90228B3659@SA1PR11MB7038.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <871qkxyz7g.fsf@intel.com>
 <SA1PR11MB70389B5E7E0207B638A90228B3659@SA1PR11MB7038.namprd11.prod.outlook.com>
Date: Tue, 02 May 2023 12:38:21 +0300
Message-ID: <87y1m713aq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE.
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 26 Apr 2023, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com> wrote:
> Hi Jani,
>
> Is recommendation to create new .h file for error related registers ?
> Can I go ahead with adding file xe_gt_error_regs.h (GT, SOC, GSC) which explicitly mentions registers related to error handling ?

I don't know what the best grouping for this stuff would be. Maybe I'd
go for grouping by hardware blocks rather than functionality like
errors. Cc: Lucas, Matt, Rodrigo, just to pick a few names who might
have a better idea.

Just don't dump register macros to a single file that will bloat to
become unmanageable.

BR,
Jani.


PS. Please also don't top-post on mailing lists.



>
> BR
> Himal Ghimiray
>
>
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: 06 April 2023 17:56
>> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: Re: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE.
>> 
>> On Thu, 06 Apr 2023, Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com> wrote:
>> > These patches in series are for adding Reliability, Availability and
>> > Serviceability support on xe.
>> > Patches provide the infra for various hardware error counting and
>> > logging. These error counters will be exposed to userspace in
>> > subsequent patches.
>> > In current patches:
>> > 1) We are adding support to handle new interrupts bits.
>> > 2) Counting of GT errors.
>> > 3) Soc/SGunit error counting.
>> > 4) CSC HW and FW error counting and sending uvent.
>> >
>> > Akeem G Abodunrin (1):
>> >   drm/xe/ras: Add support for reporting CSC HW and FW errors.
>> >
>> > Aravind Iddamsetty (2):
>> >   drm/xe/ras: Log the GT hw errors.
>> >   drm/xe/ras: Count SOC and SGUNIT errors
>> >
>> > Himal Prasad Ghimiray (1):
>> >   drm/xe: Handle GRF/IC ECC error irq
>> >
>> >  drivers/gpu/drm/xe/regs/xe_regs.h    | 244 ++++++++
>> 
>> Please don't recreate i915_reg.h in xe. Please add separate regs files like
>> we've been doing in i915. It's pain to split a monster register file later.
>> 
>> BR,
>> Jani.
>> 
>> 
>> >  drivers/gpu/drm/xe/xe_device.c       |   6 +
>> >  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>> >  drivers/gpu/drm/xe/xe_gt.c           |  30 +
>> >  drivers/gpu/drm/xe/xe_gt_types.h     | 105 ++++
>> >  drivers/gpu/drm/xe/xe_irq.c          | 824
>> +++++++++++++++++++++++++++
>> >  drivers/gpu/drm/xe/xe_pci.c          |   6 +
>> >  7 files changed, 1219 insertions(+)
>> 
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
