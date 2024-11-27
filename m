Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E773D6ACF7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 17:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640FC10E301;
	Wed, 27 Nov 2024 17:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2V/n+vz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDA010E301
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 17:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732727630; x=1764263630;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JgNL60LJJd5AIdg5AMt45q0xYY8EkGYO2S1Srqv1xGA=;
 b=d2V/n+vzUdgsGaZYAMXs7ROirxq6TfV1sqF+bRNKHfYk/myRUOFxueP7
 014bieB7DDYWj/RniMMW52NSOHwJ6ezpLDekd4y7qtN++OmS/rw/u00pg
 XLDhoG1WSO/gONU/Y2s+S0zuBPB9Lv4N8H5vc0Kvnyg8y3ARXbT2Vi6oW
 /OZA2LH6+ObxEoCqz8zWbz+r0ZpUnO4KhvDX7e1jUvsHQR3TZiwXAfuv8
 6eQSRRCcqJiBdsm5SOHxoEbOXTqvuBcYUeJH+qhLjhRMtrvGiwWvEESSv
 SXZNH2WG37NWL1zX7DOQhIvLevN8IpP1MBiFSRH1OG/hDfxZjbBDORchR g==;
X-CSE-ConnectionGUID: I49YIPCzSUOoHJtoElvlYQ==
X-CSE-MsgGUID: NZkdViDnQJu1p4Zr34Goxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33097052"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="33097052"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 09:13:31 -0800
X-CSE-ConnectionGUID: Ws1Crg13RnuTA+ksvFV2Kw==
X-CSE-MsgGUID: NA5Ev2soSK6VrzN9IjBdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92176554"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 09:13:29 -0800
Date: Wed, 27 Nov 2024 11:13:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, 
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>, 
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, 
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <bdthqtjd6va275hbcesr7uayjie3ykxtebaxf7cuf64fczhrqd@khrjqxa5nuq4>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
 <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
 <3de57ee4-d8a6-4b39-bd17-0fd2f00adc2b@linux.intel.com>
 <shrwluh7x22szbsntnu7chuxr4i4q2uvrmfy6bxeru4ue6vemd@moyhm6rfrw3f>
 <Z0TLB2W3n37mPFRM@orsosgc001>
 <3288651c-3b4f-4e84-accf-a0ae8c77eb83@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3288651c-3b4f-4e84-accf-a0ae8c77eb83@intel.com>
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

On Wed, Nov 27, 2024 at 12:42:14PM +0530, Riana Tauro wrote:
>Hi Lucas
>
>On 11/26/2024 12:37 AM, Umesh Nerlige Ramappa wrote:
>>On Mon, Sep 02, 2024 at 10:01:11PM -0500, Lucas De Marchi wrote:
>>>On Mon, Sep 02, 2024 at 11:29:05AM GMT, Aravind Iddamsetty wrote:
>>>>
>>>>On 30/08/24 03:40, Belgaumkar, Vinay wrote:
>>>>>
>>>>>On 8/28/2024 12:33 PM, Lucas De Marchi wrote:
>>>>>>On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>>>>>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>>>index b6fbe4988f2e..de6f39db618c 100644
>>>>>>>--- a/include/uapi/drm/xe_drm.h
>>>>>>>+++ b/include/uapi/drm/xe_drm.h
>>>>>>>@@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>>>>>>    __u64 reserved[2];
>>>>>>>};
>>>>>>>
>>>>>>>+/**
>>>>>>>+ * DOC: XE PMU event config IDs
>>>>>>>+ *
>>>>>>>+ * Check 'man perf_event_open' to use the ID's 
>>>>>>>XE_PMU_XXXX listed in xe_drm.h
>>>>>>>+ * in 'struct perf_event_attr' as part of perf_event_open 
>>>>>>>syscall to read a
>>>>>>>+ * particular event.
>>>>>>>+ *
>>>>>>>+ * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>>>>>>+ *
>>>>>>>+ * .. code-block:: C
>>>>>>>+ *
>>>>>>>+ *    struct perf_event_attr attr;
>>>>>>>+ *    long long count;
>>>>>>>+ *    int cpu = 0;
>>>>>>>+ *    int fd;
>>>>>>>+ *
>>>>>>>+ *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>>>>>>+ *    attr.type = type; // eg: 
>>>>>>>/sys/bus/event_source/devices/ xe_0000_56_00.0/type
>>>>>>>+ *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>>>>>>+ *    attr.use_clockid = 1;
>>>>>>>+ *    attr.clockid = CLOCK_MONOTONIC;
>>>>>>>+ *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>>>>>>+ *
>>>>>>>+ *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>>>>>>+ */
>>>>>>>+
>>>>>>>+/*
>>>>>>>+ * Top bits of every counter are GT id.
>>>>>>>+ */
>>>>>>>+#define __XE_PMU_GT_SHIFT (56)
>>>>>>>+
>>>>>>>+#define ___XE_PMU_OTHER(gt, x) \
>>>>>>>+    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>>>>>+
>>>>>>
>>>>>>The perf uapi is self-describing and users should look up on 
>>>>>>sysfs what
>>>>>>to use. Example for i915 since it's what I'm currently working on:
>>>>>>
>>>>>>    $ cat /sys/bus/event_source/devices/i915/events/actual-frequency
>>>>>>    config=0x100000
>>>>>>    $ cat /sys/bus/event_source/devices/i915/events/actual- 
>>>>>>frequency.unit
>>>>>>    M
>>>>>>
>>>>>>`perf list` works fine and doesn't know anything about this xe-only
>>>>>>header. Why would we add anything here rather than encourage 
>>>>>>other users
>>>>>>to read from the generic interface?
>>>>>
>>>>>Agree. perf list | grep rc6 is sufficient.
>>>>
>>>>This was previously asked by Rodrigo https:// 
>>>>patchwork.freedesktop.org/patch/555013/?series=119504&rev=5
>>>>
>>>>so what changed from then to now.
>>>
>>>2 different things. That rev you are pointing out had:
>>>
>>>include/uapi/drm/xe_drm.h            |  16 +
>>>
>>>so the uapi was being changed without proper doc. Rodrigo asked for the
>>>documentation to be added, because that is the proper way to add things
>>>to the uapi header.
>>>
>>>In this review what I noticed though is that the change shouldn't be
>>>there in the first place. We shouldn't change anything in the drm/xe
>>>UAPI header because this is actually an UAPI (via sysfs) coming from
>>>perf.
>>
>>@Lucas,
>>
>>Agree. This is carried over from i915, where other constraints may 
>>have led to adding some header bits for gt.
>>
>>I want to mention that now there are 2 events per engine - ticks 
>>(actual engine run ticks) and total_ticks (total ticks that the 
>>engine was alloted) which enable us to take a ratio of deltas to 
>>calculate utilization at the engine level. If we add the config for 
>>each possible combination of gt and vf_id, we would have
>>
>>num_engines * 2 * num_gts * num_vfs

not sure what you're trying to do here with that * 2...?

what are you trying to read from the userspace side?  2 separate
counters or just 1 with the embedded info?

Also, why is this considering num_vfs? Is this to monitor from the host
all the VFs being used?  If so, then we need to be careful what we are
trying to support: there's no dynamic event creation in perf - we'd
need to unregister and register the pmu again like it's done in the
uncore pmu

>>
>>where num_vfs should (ideally) be the number of vfs provisioned.
>
>Here it will be max_vfs instead of provisioned num_vfs. Pmu event 
>attributes are added on pmu_register.
>
>num_engines * 2 * num_gts * max_vfs
>
>Did not find a way to add/remove events dynamically.

there isn't. other PMUs unregister and register it again... but that is
only done on early probe, not something really dynamic. If we want to
support something dynamic like that then we really need to wait the
perf_pmu_unregister() to be fixed: not really possible without that.


Lucas De Marchi

>
>Thanks
>Riana
>
>>
>>Do you think that's fine?

you have config, config1 and config2, each with 64bits

I'm not really sure what that *2 mean and we'd better have some room
to grow it for ABI compatibility (even if a proper tool would read the
sysfs to check what is the meaning of each bit).

Lucas De Marchi

>>
>>Thanks,
>>Umesh
>>
>>>
>>>Lucas De Marchi
>>>
>>>
>>>>
>>>>Thanks,
>>>>Aravind.
>>>>
>>>>>
>>>>>Thanks,
>>>>>
>>>>>Vinay.
>>>>>
>>>>>>
>>>>>>Lucas De Marchi
>
