Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4528C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 08:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482FF10E873;
	Thu, 20 Jun 2024 08:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rv2Bv9Wl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117D710E85C
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718872156; x=1750408156;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LLhl2cdw80RSty7urosXczhRfhZocWumm0PsXIqdh3o=;
 b=Rv2Bv9WlN12Y2SgNx11AJFRm8ZMdjGrrWb74GTx6HlWe+YJS8uoK3g8n
 3fxu3BGuEf6YhcYGobs/I2xzxmrI3vs5j/7lcYEthebK6I4abS2JV0dp8
 mhaaw6AYs+FJXCMODJ5WMfzQ/zK6QGXDmkvjLImu6VM9a2IOsUfQvqY2j
 4AjvqA2JN+i7dJGFTvjOcMdhNkcR4/r98NBnA64P6JlRTqyEooh18pR+L
 gZ3FwAIERS9Ab5pibTNBtv0c6KDwOm/ABw2B8YgtsmoW1ASDQM1txLJ0r
 LRXFEtJg4aTVdXIdGOGFAlWpJPmnnsoOfXc4rtrXTTo/OT6ixtGFjhA/8 g==;
X-CSE-ConnectionGUID: jape7CdBT+ywnlSoR4hAhA==
X-CSE-MsgGUID: vt5bGDlWRwuadhoh9nS5ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="12159194"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="12159194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 01:29:15 -0700
X-CSE-ConnectionGUID: ZCwkljH2RCmVaAAhDswNAQ==
X-CSE-MsgGUID: Y4s6KC+qSFqkCXAXv1+5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46618240"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2024 01:29:13 -0700
Received: from [10.246.49.231] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.49.231])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A9B2B2FC75;
 Thu, 20 Jun 2024 09:29:11 +0100 (IST)
Message-ID: <b8e74985-db87-4f7c-8c8b-f990c3bd1b1c@intel.com>
Date: Thu, 20 Jun 2024 10:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6397/7105] drivers/gpu/drm/xe/xe_oa.c:293
 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null
 (see line 292)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <1275c783-1fc4-4706-add8-3bc5d27b09fc@moroto.mountain>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <1275c783-1fc4-4706-add8-3bc5d27b09fc@moroto.mountain>
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



On 20.06.2024 08:59, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2102cb0d050d34d50b9642a3a50861787527e922
> commit: cdf02fe1a94a768cbcd20f5c4e1a1d805f4a06c0 [6397/7105] drm/xe/oa/uapi: Add/remove OA config perf ops
> config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200703.72WIWhEJ-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406200703.72WIWhEJ-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpu/drm/xe/xe_oa.c:293 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 292)
> drivers/gpu/drm/xe/xe_oa.c:392 xe_oa_remove_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 391)

the fix was already posted earlier [1]

[1] https://patchwork.freedesktop.org/patch/599969/?series=135074&rev=1

> 
> vim +293 drivers/gpu/drm/xe/xe_oa.c
> 
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  283  int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  284  {
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  285  	struct xe_oa *oa = &to_xe_device(dev)->oa;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  286  	struct drm_xe_oa_config param;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  287  	struct drm_xe_oa_config *arg = &param;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  288  	struct xe_oa_config *oa_config, *tmp;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  289  	struct xe_oa_reg *regs;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  290  	int err, id;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  291  
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @292  	if (!oa->xe) {
>                                                      ^^^^^^
> Pointer is NULL
> 
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @293  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>                                                                 ^^^^^^^^^^^^
> Dereferenced.
> 
> "Real Fact": This is drm_dbg() but the dev_dbg() macro has magic sanity
> checking where instead of checking for if the device is NULL, it checks
> for if the (drm < (void *)PAGE_SIZE).  That catches this sort of bug.
> Hyrum’s Law applies here where people have taken advantage of this to
> deliberately pass garbage pointers to dev_dbg().
> 
> I feel like in a different life I could have had a career writing facts
> for Snapple bottle caps.  My talents are wasted.
> 
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  294  		return -ENODEV;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  295  	}
> 
> [ snip ]
> 
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  384  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  385  {
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  386  	struct xe_oa *oa = &to_xe_device(dev)->oa;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  387  	struct xe_oa_config *oa_config;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  388  	u64 arg, *ptr = u64_to_user_ptr(data);
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  389  	int ret;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  390  
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @391  	if (!oa->xe) {
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @392  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
>                                                                 ^^^^^^^^^^^^
> Same.
> 
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  393  		return -ENODEV;
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  394  	}
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  395  
> cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  396  	if (xe_perf_stream_paranoid && !perfmon_capable()) {
> 
