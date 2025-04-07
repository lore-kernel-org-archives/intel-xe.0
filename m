Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A951BC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 10:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C268910E3F2;
	Mon,  7 Apr 2025 10:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlxtB25s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECD810E3F2
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744021336; x=1775557336;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6LRR2n3SZ77KBg1plgBZes80Ob7JrAkiWSsXQsxaeC4=;
 b=BlxtB25s00BOEQTILOj/y0GgCp2XJTfVtmzarpYisgurV855oup+TAvs
 uEVydw9tRaZTROq5aGt/tJhrDYFxz8CIGMVme04+uQx/7FKdYGiNcPmYA
 hI7E1BuTu+CryCVuE2yK5oSKRAanQuaj2RQ+2d3864PyVtlpvaFIKsDC+
 oQQ7y3UeVl5O0EsVsB/yijth1ih5n5Fq6pOVJF7xGSZPzitvWlE6Lhkm9
 dj7Mw8+D6KYhV4O5byjfUgUELzEgLD7Q6UCkhPzklfZVTrmANLIYz812Y
 AyLVXwS8kCucHmFihCQK+kDpr0ZManjRqHkZEomDVJcZgoGdA101XUJJ7 A==;
X-CSE-ConnectionGUID: 7vcDoHEiSgmydibVnwR+aw==
X-CSE-MsgGUID: gmE9+kXTS8+0zNWqEOShHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="33001001"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="33001001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 03:22:16 -0700
X-CSE-ConnectionGUID: 6FZNFuoSRviZlBSWCKfpHQ==
X-CSE-MsgGUID: lutHbfV1Qy67OsxWH7Z2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="132647805"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 07 Apr 2025 03:22:15 -0700
Received: from [10.245.96.73] (unknown [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C843D32EDE;
 Mon,  7 Apr 2025 11:22:13 +0100 (IST)
Message-ID: <3c2ef067-9290-4b2e-90a0-1ecccfb36ecb@intel.com>
Date: Mon, 7 Apr 2025 12:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe: xe_hw_engine_class: Add fault injection and improve error
 handling in kobj_xe_hw_engine_class
To: Sobin Thomas <sobin.thomas@intel.com>, intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com
References: <20250405071703.2255259-1-sobin.thomas@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250405071703.2255259-1-sobin.thomas@intel.com>
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

Hi,

Please use shorter title

You may drop "xe_hw_engine_class:" tag from the prefix
Just "drm/xe:" or "drm/xe/sysfs:" should be sufficient

On 05.04.2025 09:17, Sobin Thomas wrote:
> - Added fault injection for `kobj_xe_hw_engine_class` to enhance coverage.
> - Improved error handling by checking for `IS_ERR_OR_NULL` on `keclass` and
>   propagating the error using `PTR_ERR`.

Describe your changes according to [1] and (in case it turns out both
changes are correct) consider split them into two patches since they are
logically separate [2]

[1]
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

[2]
https://docs.kernel.org/process/submitting-patches.html#separate-your-changes

> 
> Can be tested using inject-fault-probe-function-kobj_xe_hw_engine_class

Please mention that this is about IGT test (or use igt@... notation)

> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 640950172088..0cafe1175389 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -571,6 +571,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
>  
>  	return keclass;
>  }
> +ALLOW_ERROR_INJECTION(kobj_xe_hw_engine_class, NULL);
>  
>  static void hw_engine_class_defaults_fini(void *arg)
>  {
> @@ -662,8 +663,8 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>  		}
>  
>  		keclass = kobj_xe_hw_engine_class(xe, kobj, name);
> -		if (!keclass) {
> -			err = -EINVAL;
> +		if (IS_ERR_OR_NULL(keclass)) {

why?

kobj_xe_hw_engine_class() seems to be always returning NULL on any error
condition, and for error injection cases you also declare it as
EI_ETYPE_NULL, not as EI_ETYPE_ERRNO_NULL like this condition may
suggest, so it should be never an ERR_PTR

> +			err = PTR_ERR(keclass);

and now when kobj_xe_hw_engine_class() actually fails and returns NULL
then "err" will be 0 instead of any proper error code

>  			goto err_object;
>  		}
>  

