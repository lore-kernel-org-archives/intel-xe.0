Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D33C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 09:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4CB10E0C9;
	Tue, 15 Apr 2025 09:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMg979l8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80C310E0C9
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744708478; x=1776244478;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=twRBgGn2AiXfm1puz0Cz6CmfJetZQoh666uqPlvP8dQ=;
 b=aMg979l8TtgTlwwVAyPDIQynbM2z+8lg/Wz1xr+2PCnmzJIb4twB4YMj
 HZSNdXFQ1UzEmXYGHNif2VDYGGGPv0Vx6d1MMrviYJTHiz1OafkP521pf
 2fhGfotj87+Mfc6asyZOOyC2jr93HQX3cMr2xVRXyfZvH8UTu4VOnaQyP
 v7dv16xqmQbZDo+CurzkMNRRWaofRV+pdmwdoEMqcu7b8lHOPGVDe0HKQ
 mTbWATrB/bwUC6yIv0pCozHq7yA6RfqtxPlZ+wzOAw93fYN52RmgRmEz6
 NgXnFYtTkMRFx0xxh4iPWSevuTujzKc60xOJEjjTQQaSCsjzUysr+ZuG6 Q==;
X-CSE-ConnectionGUID: 1a+2IdGDRjiQn7KPZBlQaQ==
X-CSE-MsgGUID: 7tiIraInSbS4l5Mv+n2Rkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46219832"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46219832"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:14:37 -0700
X-CSE-ConnectionGUID: yhh2YM1zSfOeoeSi7W6vmw==
X-CSE-MsgGUID: uEcbcB6XRhu0zUz/e/Clfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134923004"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 15 Apr 2025 02:14:36 -0700
Received: from [10.245.83.107] (unknown [10.245.83.107])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 09D2833BED;
 Tue, 15 Apr 2025 10:14:34 +0100 (IST)
Message-ID: <9db4da80-2244-43dd-ad9d-31b51540ae33@intel.com>
Date: Tue, 15 Apr 2025 11:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add fault injection for
 kobj_xe_hw_engine_class
To: Sobin Thomas <sobin.thomas@intel.com>, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tejas.upadhyay@intel.com
References: <20250415064211.2889970-1-sobin.thomas@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250415064211.2889970-1-sobin.thomas@intel.com>
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



On 15.04.2025 08:42, Sobin Thomas wrote:
> - Add NULL ptr injection for kobj_xe_hw_engine_class
> - Can be tested with igt@inject-fault-probe-function-kobj_xe_hw_engine_class 

don't use bullets and "describe your changes in imperative mood"
see [1]

[1]
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> 
> v2: Modified the Fault injection with NULL.
> 
> v1: Initial checkin for Fault Handler.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 640950172088..f9616ddf4376 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -571,6 +571,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
>  
>  	return keclass;
>  }
> +ALLOW_ERROR_INJECTION(kobj_xe_hw_engine_class, NULL);

while this looks fine, I'm wondering whether the better option would be
to start testing all slab failures and thus cover much more fail points
in the driver, as after all injecting NULL here is the same thing as
failing kzalloc used by this function, see also [2]

+ @Lucas

[2]
https://docs.kernel.org/fault-injection/fault-injection.html#application-examples

>  
>  static void hw_engine_class_defaults_fini(void *arg)
>  {

