Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ABFC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 17:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DE310E720;
	Mon, 25 Mar 2024 17:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgGkWiqn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8554610E720
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 17:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711388064; x=1742924064;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4DysAQ4SxYsrPEVgP9ckjbfcm/yrxHjhKKOpepx5K/I=;
 b=XgGkWiqnTxNakh1F5HusvHMGJEnYpDsVyy2Gxvl3LgtkqFS91+oWqY+q
 zbSVobV+EZxk3Fhi4EIIk9xwtyfscMn83A7uybgASviQwI/M6w2WAZbmB
 0nvK/oxfVCOVDtH8w5mbrv6NNuK4TWTJjfxbbWxEI4rBttB1jMCekzj5m
 RUZ0EIZrnPr3pfJFiJJAQ3EkMRQQDccndZUWhv4pRpE1Tue+0n/mKZzWL
 uouXExy5i0Rr/pocqizXm7t5H0s8PzVODamDaD6Yz0d72tiNLgFt71Pda
 AI+sdWok60+ZZyLc3VcUvim1vzf0qI6vqPriHsXBjgw4aTwmn09P5eILY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6342821"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6342821"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20414318"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 25 Mar 2024 10:34:22 -0700
Received: from [10.249.156.183] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.156.183])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 22CF528791;
 Mon, 25 Mar 2024 17:34:12 +0000 (GMT)
Message-ID: <5a8f32d8-1321-4f71-ac8e-8e55455e59ad@intel.com>
Date: Mon, 25 Mar 2024 18:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Store pointer to struct xe_gt in gt/ debugfs
 directory
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-xe@lists.freedesktop.org
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
 <20240214115756.1525-2-michal.wajdeczko@intel.com>
 <ZgGuAzMpdheUTPke@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZgGuAzMpdheUTPke@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 25.03.2024 18:01, Rodrigo Vivi wrote:
> On Wed, Feb 14, 2024 at 12:57:54PM +0100, Michal Wajdeczko wrote:
>> Attributes added under 'gt/' directories may wish to use that
>> in case they can't obtain it from elsewhere.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index c4b67cf09f8f..207b992f1240 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -225,6 +225,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>  		return;
>>  	}
>>  
>> +	/* other attributes may use parent->d_inode->i_private */
> 
> what did you mean with this comment?
> if others are using, what would be the risks?
> is this a good thing? is this a bad thing?

maybe better wording should be:

/*
 * Store the xe_gt pointer as private data of the gt/ directory node
 * so other GT specific attributes under that directory may refer to
 * it by looking at its parent node private data.
 */

> 
>> +	root->d_inode->i_private = gt;
> 
> At first I thought this was intrusive, but then the following
> patches made me realize that we are already being intrusive
> when disrespecting the data:
> 
> include/drm/drm_debugfs.h
> struct drm_debugfs_info
> /** @data: Driver-private data, should not be device-specific. */
> 
> 
> So it looks that we do need something else.
> 
> Looking the i_private that you pointed out seems an alternative
> 
> include/linux/fs.h
> struct inode {
> void                    *i_private; /* fs or device private pointer */
> 
> it is a 'device' pointer rather then a 'driver', but I'm still confident
> that it is the right one to use.

GT aka xe_gt is more a device than a driver, no ?

> 
> It looks like the debugfs_create_file functions would override that
> anyway with the data. Also other places in the fs code where this is
> used for other checks.

the drm_debugfs will use i_private only on nodes that represent
individual attributes, it will not touch the parent node i_private
(which is our gt/ directory - and this where we set pointer to xe_gt)

> 
> So, perhaps we need something more flexible at the drm_debugfs layer
> that would allow us to have a sub-device pointer?
> 
> The other 2 patches are great and you can already use rv-b on them if
> we agree that this i_private change here is good.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
>> +
>>  	/*
>>  	 * Allocate local copy as we need to pass in the GT to the debugfs
>>  	 * entry and drm_debugfs_create_files just references the drm_info_list
>> -- 
>> 2.43.0
>>
