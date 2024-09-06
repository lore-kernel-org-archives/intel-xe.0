Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C55CE7B17
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 13:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A5810EA63;
	Fri,  6 Sep 2024 13:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFlhyfLv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B84210EA63
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725630655; x=1757166655;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cZBSF+f39FOgd6RNmbL9qBql+OfsBZhHumC+4vaPBgY=;
 b=NFlhyfLvx7ylkn0ssyUdLKoxwxYqz7IAKHGNunaknZtf6rdNzvR5sTHe
 1TmvyinDrGOIbzXuhSiwRfCZkwaNnTgv1JJdpZCRp5gOT425iq7RqyUmZ
 RXXRu45a9PG8J4uMWZcHXq5MSO5sW28MztWWTC0xN6RoxHcVIcvSljRrP
 ib60pyh/vtXswmdCIhB2N8sHo+MkmsQeoLFQP75f+OMg69Ignj+NsP4db
 L/Gx2AUFPa/3iIHXnH0/BAQ/mTGfb1rhUw1MZxoIyXzk7/RWnjul2pJ7Y
 L5JeKB5BtSwPMD7WgnQ35qSKlFBT+QLqZb6dXoSawow3HQ9rNcJVyj32x w==;
X-CSE-ConnectionGUID: AQO2C2K+T1OwFtGTWaC4tA==
X-CSE-MsgGUID: b/Jw0bBHSTqrvzH/fRw2qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41895671"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="41895671"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 06:50:55 -0700
X-CSE-ConnectionGUID: XgpKJ7cnQL6l0Mk3YioalQ==
X-CSE-MsgGUID: u6PGzoFySKGofNErWlsvzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="65651366"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 06:50:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: use IS_ENABLED() instead of defined() on config
 options
In-Reply-To: <871q1zza67.wl-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240904145231.3902289-1-jani.nikula@intel.com>
 <871q1zza67.wl-ashutosh.dixit@intel.com>
Date: Fri, 06 Sep 2024 16:50:48 +0300
Message-ID: <87seucnb5z.fsf@intel.com>
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

On Wed, 04 Sep 2024, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> On Wed, 04 Sep 2024 07:52:31 -0700, Jani Nikula wrote:
>>
>> Prefer IS_ENABLED() instead of defined() for checking whether a kconfig
>> option is enabled.
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks for the reviews, pushed to drm-xe-next.

BR,
Jani.

>
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.c                  | 2 +-
>>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c | 2 +-
>>  drivers/gpu/drm/xe/xe_guc.c                 | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 06911e9a3bf5..53948a965404 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -468,7 +468,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>>		mem->bus.offset += vram->io_start;
>>		mem->bus.is_iomem = true;
>>
>> -#if  !defined(CONFIG_X86)
>> +#if  !IS_ENABLED(CONFIG_X86)
>>		mem->bus.caching = ttm_write_combined;
>>  #endif
>>		return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
>> index f3ddcbefc6bc..2ed5b6780d30 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
>> @@ -33,7 +33,7 @@ static const struct drm_info_list vf_info[] = {
>>		.show = xe_gt_debugfs_simple_show,
>>		.data = xe_gt_sriov_vf_print_version,
>>	},
>> -#if defined(CONFIG_DRM_XE_DEBUG) || defined(CONFIG_DRM_XE_DEBUG_SRIOV)
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) || IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)
>>	{
>>		"runtime_regs",
>>		.show = xe_gt_debugfs_simple_show,
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 52df28032a6f..db667850c8b8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -583,7 +583,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>>   * extreme thermal throttling. And a system that is that hot during boot is probably
>>   * dead anyway!
>>   */
>> -#if defined(CONFIG_DRM_XE_DEBUG)
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>  #define GUC_LOAD_RETRY_LIMIT	20
>>  #else
>>  #define GUC_LOAD_RETRY_LIMIT	3
>> --
>> 2.39.2
>>

-- 
Jani Nikula, Intel
