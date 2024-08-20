Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D01C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 07:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECE710E331;
	Tue, 20 Aug 2024 07:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFSElBvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796C710E331
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724139826; x=1755675826;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gVB9s2obcpytBMmzG+6BLJ2jbNIYUFM2vcMYDl4UUa4=;
 b=BFSElBvkgFO5MkzKKv8/mq04TSHsMPc3lF1XsRj/4wFjpsJbun1YXEbn
 clr0wsikorTFu9k3DNmVUaCSHJ6+6wPq7Q143lv082cySfzV6hd8HyMcT
 uS80QuOOoctqyAOdVMXlJNzPRMSim3FlrpUtRM8Jh/6p/Glj2HketHhlC
 kk+R2H26r50VBZE+mgmG6SpJjegxSkbfjV+FhsP+pU59txLz8Rs27H4IU
 kdTBzkfxNQQD0T7x35LlNCxFRfGA45SfV5a3udJd1U6jVuoRGeLz2slyW
 jxG9E4Jg0lcn8dcXlUfK92v3mwZOq3oOfl6MOwfxyz1XbT5kGPUCsAW8W Q==;
X-CSE-ConnectionGUID: It0uDs5cRqCkeHcUdGnGsw==
X-CSE-MsgGUID: mLwRo17rQHeI4oiD12TmCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26287956"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="26287956"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:43:45 -0700
X-CSE-ConnectionGUID: OHfPMFEMQsKqmmTkLCtW8w==
X-CSE-MsgGUID: MshdGgv2RdWtubonvxa9hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60688903"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:43:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/xe: Read out rawclk_freq for display
In-Reply-To: <20240819133138.147511-2-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
 <20240819133138.147511-2-maarten.lankhorst@linux.intel.com>
Date: Tue, 20 Aug 2024 10:43:40 +0300
Message-ID: <87msl763mb.fsf@intel.com>
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

On Mon, 19 Aug 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Failing to read out rawclk makes it impossible to read out backlight,
> which results in backlight not working when the backlight is off during
> boot, or when reloading the module.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Cc: <stable@vger.kernel.org> # v6.8+

Please find another way. See [1]. I'm trying to clean up the whole
RUNTIME_INFO() and rawclk_freq thing, and this makes it harder.

BR,
Jani.


[1] https://lore.kernel.org/r/ddd05f84ca4a6597133bee55ddf4ab593a16e99d.1717672515.git.jani.nikula@intel.com

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 30dfdac9f6fa9..79add15c6c4c7 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -159,6 +159,9 @@ int xe_display_init_noirq(struct xe_device *xe)
>  
>  	intel_display_device_info_runtime_init(xe);
>  
> +	RUNTIME_INFO(xe)->rawclk_freq = intel_read_rawclk(xe);
> +	drm_dbg(&xe->drm, "rawclk rate: %d kHz\n", RUNTIME_INFO(xe)->rawclk_freq);
> +
>  	err = intel_display_driver_probe_noirq(xe);
>  	if (err) {
>  		intel_opregion_cleanup(display);

-- 
Jani Nikula, Intel
