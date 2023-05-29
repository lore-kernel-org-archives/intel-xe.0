Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35900C77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 07:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCE710E061;
	Mon, 29 May 2023 07:58:27 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141210E222
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685347106; x=1716883106;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LRUQHxBVp3LEqUuVXbhUby3spnUK506dChdM/vQyIEE=;
 b=GId4ZPKttRq8YkQH/Whu6AbYaO1aQekrPoAUg8ChFzkXYfoVnV+T8x8E
 sW8i5AU67UlqdZyqTKS/uPN3Cp3+1j5IF+3HQcUhZkOtSp5NNGMPp1EBL
 rMQGn5zsSZw/ZGk2kekmJjFGnguSPoPtkI/76EfZuO7TdeOpRX+A2NF7L
 8iKNslw8fR1pSGPSdQkyd/MUuur8efHz5NKQzz7Wc8Wg8KjATUzikmLof
 1OD+WxdBPnxnnFiXMSaroYUFHPsOLPuvL76x+a39dje4liHR6IUzCw1A8
 C6EPnDF1A0dc2rzppWcqgRhlnYg/4RZUBrpbpthp9Cxc3D724hqsHXSDv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="334272122"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="334272122"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 00:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="795834456"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="795834456"
Received: from iswiersz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.191])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 00:58:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>
In-Reply-To: <20230526214817.GL10045@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
 <20230526004235.745730-3-gustavo.sousa@intel.com>
 <20230526214817.GL10045@mdroper-desk1.amr.corp.intel.com>
Date: Mon, 29 May 2023 10:58:21 +0300
Message-ID: <87edmzin6q.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Replace DRM_ERROR() with pr_err()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 26 May 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Thu, May 25, 2023 at 09:42:35PM -0300, Gustavo Sousa wrote:
>> The former has been deprecated in favor of the latter.
>
> It has?  I thought generally the goal has been to replace DRM_FOO() with
> drm_foo() (i.e., drm_err() in this case) because then you get nicer
> device-specific output.

Yes, drm_foo is preferred over pr_foo.

BR,
Jani.

> Or when we're doing something GT-specific, we
> move to xe_gt_err() so that the useful information about which GT is
> automatically included.
>
> It looks like xe_reg_sr_add() doesn't have a reference to a drm_device
> to use drm_err (I didn't check how hard it would be to plumb down to
> that point), but xe_vm_bind_ioctl() should be able to use drm_err() I
> think?
>
>
> Matt
>
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_sr.c | 11 ++++++-----
>>  drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
>>  2 files changed, 8 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 24d9c73ef279..4266999cdeb6 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -7,6 +7,7 @@
>>  
>>  #include <kunit/visibility.h>
>>  #include <linux/align.h>
>> +#include <linux/printk.h>
>>  #include <linux/string_helpers.h>
>>  #include <linux/xarray.h>
>>  
>> @@ -123,11 +124,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>>  	return 0;
>>  
>>  fail:
>> -	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>> -		  idx, e->clr_bits, e->set_bits,
>> -		  str_yes_no(e->reg.masked),
>> -		  str_yes_no(e->reg.mcr),
>> -		  ret);
>> +	pr_err("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>> +	       idx, e->clr_bits, e->set_bits,
>> +	       str_yes_no(e->reg.masked),
>> +	       str_yes_no(e->reg.mcr),
>> +	       ret);
>>  	reg_sr_inc_error(sr);
>>  
>>  	return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 4d9c8de8b348..89d8240ea6aa 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/delay.h>
>>  #include <linux/kthread.h>
>>  #include <linux/mm.h>
>> +#include <linux/printk.h>
>>  #include <linux/swap.h>
>>  
>>  #include "xe_bo.h"
>> @@ -3019,7 +3020,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>  	}
>>  
>>  	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
>> -		DRM_ERROR("VM closed while we began looking up?\n");
>> +		pr_err("VM closed while we began looking up?\n");
>>  		err = -ENOENT;
>>  		goto put_vm;
>>  	}
>> -- 
>> 2.40.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
