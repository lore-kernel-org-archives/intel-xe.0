Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C09CC53219
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 15:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2A210EC72;
	Wed, 29 Jul 2026 15:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQ58N5Vz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFAF10EC72
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785337328; x=1816873328;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QCyGWqofjgfOhNgbR7ozn4UdSD9KFYc2blXrRPakcqs=;
 b=dQ58N5VzNi8um9IVyKRI+yp0CInTbhBNPG/2cm0gjCYZtkAMcAm5LkqL
 j/ZyYI2vtlYGpBfg/CV1pYkl53iU1DQnYopA5yxmdON6E3PTc/jVxX0yj
 eETRUOy4+XFzdmxKHIpHneahX3xkbdRlRwPGUAAwICBUXG4hERdhD/Hq2
 aCy4566hqI+2qo7ZHsXQ+ACkoPwhQiZifFNSkiTdYrR77vS5R0dcJ+F7j
 3NGdbzqscUANNqlehtfjMRjFBLdusnf2iC5nEAC/2VxipBBsTMeL5CIrv
 WE2fNnO2KZVcVW6DLEriG7+YyPA4pcyV0gREQDq130obR6tMkhNRIu/JQ Q==;
X-CSE-ConnectionGUID: ciLGKd19TIycmt1LfI+CLQ==
X-CSE-MsgGUID: bAxK7U7pRICs+I0Ww4pc7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96304915"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="96304915"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:02:08 -0700
X-CSE-ConnectionGUID: BADB++J+RfWWCHFZJH43HQ==
X-CSE-MsgGUID: 1EhkQXNCSEid5rot6/1Hqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256697985"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.212])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:02:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v2 08/22] drm/xe/log: Add SIGID log helpers for components
In-Reply-To: <0a665be1-15b1-42c2-b1f7-d5d8db12c937@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <20260728161039.579-9-michal.wajdeczko@intel.com>
 <62dadb83a10fe3c30db950a60e968582ed54a304@intel.com>
 <0a665be1-15b1-42c2-b1f7-d5d8db12c937@intel.com>
Date: Wed, 29 Jul 2026 18:02:02 +0300
Message-ID: <a1bc858bc2088b556953cc817cc8ab904c58a10a@intel.com>
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

On Wed, 29 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 7/29/2026 10:06 AM, Jani Nikula wrote:
>> On Tue, 28 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>>> Our component list already defines relation between the component
>>> name, identified by the TAG, and its numerical identifier and the
>>> assigned SIGID. We can also already prepare location identifier
>>> based on the pointer type used to emit the log entry. Add helper
>>> that will prepare SIGID, COMPONENT and LOCATION parameters for
>>> xe_log_emit() using provided componentn TAG and the pointer.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> v2: rebased/simplified (Michal)
>>> ---
>>>  drivers/gpu/drm/xe/xe_log.h | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>>> index 43deaf93ce3e..b0f50aa35a96 100644
>>> --- a/drivers/gpu/drm/xe/xe_log.h
>>> +++ b/drivers/gpu/drm/xe/xe_log.h
>>> @@ -85,4 +85,22 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>>  	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
>>>  		    (data), (len), fmt, ##args)
>>>  
>>> +/**
>>> + * xe_log_comp() - Emit a structured SIGID log entry on the component behalf.
>>> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
>>> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>>> + * @TAG: the component tag to use
>>> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
>>> + * @len: length of the @data in bytes, or 0 if not applicable
>>> + * @fmt: printf-style free text format string (not a stable interface)
>>> + * @args: arguments for the @fmt format string
>>> + *
>>> + * The SIGID will be determined from the component's @TAG.
>>> + * The component identifier will be determined from the component's @TAG.
>>> + * The location used to emit SIGID entry will be based on the @any pointer type.
>>> + */
>>> +#define xe_log_comp(any, cper_sev, TAG, data, len, fmt, args...) \
>>> +	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
>>> +		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
>> 
>> I understand you want to use a short TAG at call sites, but the string
>> concatenation means cscope/global can't find any of them, and you have
>> to resort to git grep.
>
> but there should be no need to look for full enum names, as those are
> only needed for internal use by the macros. And "grep -w TAG" shall
> point you to the component definitions in xe_log_abi.h (PATCH 3/22)

The point is to look for where each tag is used. The tags are short,
like PROBE, WEDGED, GUC, etc. so the simple 'git grep -w' will produce
too much, and then you have to figure out what *else* to include in the
grep, and it's a bit meh.


BR,
Jani.


>
>> 
>> BR,
>> Jani.
>> 
>>> +
>>>  #endif
>> 
>

-- 
Jani Nikula, Intel
