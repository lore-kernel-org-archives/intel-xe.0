Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE8FC36014
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 20:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5D10EB4B;
	Thu,  3 Apr 2025 20:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZsao0so";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43D10EB4B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 20:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743713774; x=1775249774;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KwI7Biee9c10KCugFPibbDDju3nZ2l54SbBbKCsUh88=;
 b=TZsao0sojZAcBE0+h5mxykL52SvgkO6hl/1Lc8PiQTVdZxWKo27Gq4Zs
 T03Bs5N/CiajoCAaSAGT9vi2Ttr0Jb4jH5Nvx2g4aO7PR7tEwC3WFs7fA
 2MzU9Vl31EelD/wZFVeUSKCBx4F4TCFNf1Y5RVZadc/vS8RLtLxKfY4bZ
 AAAssxjX2kdrFEDiRSyr76MiCeTc0fK8ZL2GJkLoP90F5SY/WqSITFdaX
 qj7AzIir4/1tqyNHegTJU9+6cFzNXUay2ShsuSYBF5CRmAKklSzy2uJ2w
 Uw7ouycveUgtxaqCY6XS7/rull4kk/wLPW3pdd8dyxh8DznfbKlkgDaUg A==;
X-CSE-ConnectionGUID: p98Z8VMzQbeiihM2f/Wo3Q==
X-CSE-MsgGUID: 2x0Du9GSQV+CmP5br1OebQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45288099"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45288099"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:56:13 -0700
X-CSE-ConnectionGUID: ZRcIy0DoRdqbuzubXF5+Cw==
X-CSE-MsgGUID: RAC43Om0SKmuNDfSERgPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="131838012"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2025 13:56:12 -0700
Received: from [10.245.114.177] (unknown [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1C8CA32ECE;
 Thu,  3 Apr 2025 21:56:11 +0100 (IST)
Message-ID: <83f0a79d-3eba-4e87-8e53-6b5767dd92fd@intel.com>
Date: Thu, 3 Apr 2025 22:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/vf: Don't expose privileged GT debugfs
 files if VF
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
 <20250403142635.1821-4-michal.wajdeczko@intel.com>
 <Z+7vf3ejc0/r6yRf@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z+7vf3ejc0/r6yRf@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 03.04.2025 22:28, Matthew Brost wrote:
> On Thu, Apr 03, 2025 at 04:26:35PM +0200, Michal Wajdeczko wrote:
>> Some of the debugfs files require access to the registers that are
>> not accessible to the VFs. Don't expose those files on VF drivers.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2: avoid "privileged" word, make it clear it's about VF/PF (Lucas)
>>     add hint for developers where to add new files (Lucas)
>> ---
>>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 30 ++++++++++++++++++++++--------
>>  1 file changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 2d63a69cbfa3..a88076e9cc7d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -299,20 +299,20 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>>  	return 0;
>>  }
>>  
>> -static const struct drm_info_list debugfs_list[] = {
>> -	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>> +/*
>> + * only for GT debugfs files which can be safely used on the VF as well:
>> + * - without access to the GT privileged registers
>> + * - without access to the PF specific data
>> + */
>> +static const struct drm_info_list vf_safe_debugfs_list[] = {
>>  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
>>  	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
> 
> Probably don't expose the reset ones to VF either.

why not? from commit 459777724d30 ("drm/xe/vf: Don't try to trigger a
full GT reset if VF") we just use H2G action VF_RESET(0x5507) to
exercise the reset flow as applicable method for the VF

