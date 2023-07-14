Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3529BEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 13:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021AF10E88A;
	Fri, 14 Jul 2023 13:40:07 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E0F10E88A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689342005; x=1720878005;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9C8sTRvyzQN7YNyiWgQkYpaxKe9pU7yZ/UaI0M7xHqA=;
 b=jyyIxof0FUyElEeG+RHFO5qDqdx4G4xTmc0Po3QHVql9qEbASOYlhQbj
 4dcrQTOWwzcINnXgT/PrGqOP+mI16CLokzhI/AuiZIqtqouxM1oBETln2
 o4GOngUY+DodSyDK4oR967V7Oadbl+rAoAieFPUl37bic44jTBQUvLjHg
 x25T/AbgEG6+1+oqIew+1jxOyiP+xgWQmBwxoN83ENcZu+u5aPxdoBacp
 WvddNn+G2uupwO7s+NPwXujtnLFDCzEy8J2qbuhNK2d3MHUJL/Z3wZSY6
 nWDiuY/uLCPjbOAccn0BjOe+FA26Oe+cq4ihCTvw5myoluIJhZCvInFJ8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="368114288"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="368114288"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 06:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="1053057638"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="1053057638"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 06:40:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 06:40:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 06:40:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 06:40:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwrVDJP+Q/dQ8eMJbrI+dYJOOybyRrNBaCL1fHqZXxogWzkVKMbq3OyKIRN5ytccLro226x9QvbO+rLF19j+Pre0O5bTvmh1CVh/+PH9y6VZWlyiSm/HJLiCPvOnztGwP7MMUq+Z7chj2GVIO0boSt8+pyiIgG++cp6vPKTO9q0C1C1T41EOEepEvO0H15bFZyn1HD5ayBrDD8RWE5TBZqQV7fmu41Zz9JkZfnZg4Ruj8/RrbrBQOs5rl7cOIl3fNSH54wRZHwT4vVxhkGituBBE6Iao5x6CEl1Ifk5+AqdH+w2gSVQTAuT7suQrMW6Dvah2sAqCKIhn9xdS/Y4CNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4IowAywyTNUTiXcG52Omavqee75n3+CeKaAfJZR+d4=;
 b=U4Llir3xuFx0eO6a+8PzfxRKglgSCBP8GViOtHiXSFUaefQ7lkREVN/E814MFfuxlxb4KAJlBgaCc64wh125zTytWAr3u4fd8Gfytunm3Y0nPW7HiHEUxT/Ru5jA6R2SBtjyfwQqR5h7DGTHCCXVfR/pQ4y6++KA9ik0poYz+eHW2RYfqMe0GJDidkgaSU/echghhAVaPNFccQfpfDHQkVnGXdSaIKUMkbx9YnvQFxSRVkYxgl2ZlQK92/AaaphyJrJo/Mue+0PYh7pW8Or3b2c/jD20AoqxgjsiXSmchtIZz+u9RcEvrOZOAOAosF5xeHCNpLKRGxa0Fbp/7hedMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8237.namprd11.prod.outlook.com (2603:10b6:610:154::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 13:39:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 14 Jul 2023
 13:39:59 +0000
Date: Fri, 14 Jul 2023 09:39:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZLFQKmAWdCXCGUmd@intel.com>
References: <20230713143121.3901357-1-anshuman.gupta@intel.com>
 <20230713143121.3901357-4-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230713143121.3901357-4-anshuman.gupta@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7c1633-af2e-4468-8c35-08db846fd0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gzxOe5Db3Jd465fzXRrfgIRKObb4lhrGNknPsPnKhjdaEIkOMIqPZoOdH/SCKdEQAU6j494Kv7ZMp2aNBiTgZhg3PUiV9zwe92l+SzgXaZb/LjenHqsVaStu4Hri5i2qkYXMMNO7FtEAwAOpsswIlE1mBY5DCuTx1iJtUC6lnc2SIQo0S50+bmYFDJCBgFHyGR3zL7klzoarxgGZr0CPXmZcLbkFJGTYAtzTAIl8bV1mOfcGejPL6aBBDIib8Nbm5u3Ef/on1cLLrSnjvpot1+U62bktBFPsSsCoQLaVeTfeL04GLq7bjS7gpVR597b7NrHYTpSW+krIfTFqJAbts6rMDpypaaKUeUngLG0Kp9dfBu0/eau+Ed7+ah975jH5PvcIeBG25RNqKfviRenpR56tPxIGfPN6ERKXi8oMfhR6tSUmldI8t8/9WLVGaglSZkN0omDpiFlHLKk4lzRCB7XgZLar7L+oL3McxfGAoq4sBYLwWlaCWR1izIaE9vg2kVeCISASlz91kH+YPHbTOFExkbJ6LGJOmAMUi007FWGx+GgF7rSOcx6D0hZDTzUM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(37006003)(2906002)(38100700002)(82960400001)(6512007)(83380400001)(186003)(107886003)(2616005)(26005)(6506007)(5660300002)(86362001)(6862004)(8676002)(36756003)(44832011)(8936002)(30864003)(6486002)(6666004)(41300700001)(66946007)(66556008)(6636002)(66476007)(316002)(4326008)(478600001)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aaj2MK59wfJ8KVm4tSdznAkGSF4qfaedrNdhZ3Kru06LYOt5f5uAJjkk85?=
 =?iso-8859-1?Q?JwJ8f5wXA4As/xdCECL2g8OtmpFs6lFeob7cuF2Vy3YNSxIkuaq95slsv4?=
 =?iso-8859-1?Q?DZgQYm47iEHqFLXMCZ5gOc522CAq+Dm3xawo5hPdA285ff0bQLNFyO9kEY?=
 =?iso-8859-1?Q?y8bbizDnFJ9+er4W+gv6cLbLJCfHX0I7VVdLzA/nRa8AoqDH12AUqV2FWl?=
 =?iso-8859-1?Q?LIt3wwi81AGlETnNt5FoqpfFAqV2opsKCvPykcotO82b0TZign+HrqCWd/?=
 =?iso-8859-1?Q?+xR0mUmJ+pCxenS3GsgFIIQc9nLcCgvArwFoCxd9j54IVF6E3LosMRBm19?=
 =?iso-8859-1?Q?jYI4L+MuSG1YCs/pbyn+51xjmW948ynKFaZgpETnDxycYLQtMQlZiMZx5k?=
 =?iso-8859-1?Q?VDzmtOGAD7DlZhGjHk/EN+PpC3Hk/y0FZJlm1OZ5rMm9kwF872NTwpXCr6?=
 =?iso-8859-1?Q?uUessAiLeqxAWE1DgTlTpKkm8AVhUkbLyJ9RcxoaSmdYQLl2M90zZji+20?=
 =?iso-8859-1?Q?4KJxH8DM8npYUrjcaDTyguCqkOusS4Wg8fb+ATWQInIHjrCKzrMnJsWEya?=
 =?iso-8859-1?Q?E8fBDE1P2Qmy8z1kqAF1GBphUZ76Uv0zfCtIyxy2f70e9fIMFXlp8p80rI?=
 =?iso-8859-1?Q?3UKVYpliEGV1SKIVHkHiXURhXqRI5BFVbq7BJxibWscm65FYBn1Lu918pR?=
 =?iso-8859-1?Q?6x7Ip0KvLvFAWZa+xEvrjG4DbMq0QSng1eKIo0cNpPgRlL8tVwt3ZPi8w5?=
 =?iso-8859-1?Q?aAZnC8YSiYZEI5IIdcubchFQmM4qJM0ElYJ++e+dUt0/PQ62qgVexpblu6?=
 =?iso-8859-1?Q?YDpV0Bh0VKLH3s1InyXra7htI4z8DdQXLQMLhMXMjiyDXCwH6X07HLPXIt?=
 =?iso-8859-1?Q?pq/f7wjSmz/sf2MxBO1mSTBjBIWVINd0pvb/wIHI8JTwed+3qs96hryMEy?=
 =?iso-8859-1?Q?ax2lJoH1mCFYLp+Mst4VY5uSbVRfupD30QLSDFGubeXCEManweKwfqE16a?=
 =?iso-8859-1?Q?tn6PC1SpiQ1OyNWRNCSPQvsngipfcUPuPZsuwZNh+syZOvP4wKY4UnDMpI?=
 =?iso-8859-1?Q?+P8xrvkGPfGUZwTy3EOEEO8ggMO6MkceF2Y9Y2jZ4BmdES/MsKrL1Zwdxj?=
 =?iso-8859-1?Q?4BWcG1KlUb0Rkl7pzVpIKw+ZjmfPuXE/6w8Ia68+W/cR+0E8Ao/nwmr708?=
 =?iso-8859-1?Q?enJQBTcEBxW0BZ2fPffwvNOrbwVcL0Rmpy1wACHhMlGs4ZpnrPFsYrFP1j?=
 =?iso-8859-1?Q?MhUzAnGBQtJYL/y25pySclrcxaIbHV4/oayDy0uILuqaRTSor2yRIWJlF4?=
 =?iso-8859-1?Q?VP5ldPlN0Z16DcdkB4poefX5WYLPueOTBtzNEIpSzTXPcIW/yjf2kfsZTR?=
 =?iso-8859-1?Q?gdNci2aHdd9TxtEk8XiCnxQwQIJs0RvI6zRRs5PRlW50Y9VYUrsrUXEQsv?=
 =?iso-8859-1?Q?PJehICXxXlUK55dS3Z1ZG0YTYJIjCYNI5LE3xubk7WiZdnyAPMXJVLoKZl?=
 =?iso-8859-1?Q?s+64X86zPhiFxuko/M01+OEqELIUShcyM1wp0/VgxzAQc0tfp6Hxqh/xl4?=
 =?iso-8859-1?Q?HwRlpgz+h2tvly9QnIh/ha6qKkXCT75wNsp+nu2oSN2RH04QalGj3rMVLA?=
 =?iso-8859-1?Q?jcVx9Ux5InfZc9hOP6MWY9nHI0y9f0wjhZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7c1633-af2e-4468-8c35-08db846fd0eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 13:39:59.1843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOwxXUvLsN5LW/NSR0pmVjC7tPt1BCwlN7XDjrJjHWfNOCEAzZUq3u5ORXikALQf7TsE6UGATDAgJGDZcGi8zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8237
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 3/5] drm/xe/pm: Add vram_d3cold_threshold
 Sysfs
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
Cc: sujaritha.sundaresan@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 08:01:19PM +0530, Anshuman Gupta wrote:
> Add per pci device vram_d3cold_threshold Sysfs to
> control the d3cold allowed knob.
> Adding a d3cold structure embedded in xe_device to encapsulate
> d3cold related stuff.
> 
> v2:
> - Check total vram before initializing default threshold. [Riana]
> - Add static scope to vram_d3cold_threshold DEVICE_ATTR. [Riana]
> v3:
> - Fixed cosmetics review comment. [Riana]
> - Fixed CI Hook failures.
> - Used drmm_mutex_init().
> v4:
> - Fixed kernel-doc warnings.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 86 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_sysfs.h | 13 +++++
>  drivers/gpu/drm/xe/xe_device_types.h | 24 ++++++--
>  drivers/gpu/drm/xe/xe_pci.c          | 10 ++--
>  drivers/gpu/drm/xe/xe_pm.c           | 38 ++++++++++--
>  drivers/gpu/drm/xe/xe_pm.h           |  3 +
>  7 files changed, 162 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 336f0eb8f91e..c37587ae20c2 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -49,6 +49,7 @@ xe-y += xe_bb.o \
>  	xe_debugfs.o \
>  	xe_devcoredump.o \
>  	xe_device.o \
> +	xe_device_sysfs.o \
>  	xe_dma_buf.o \
>  	xe_engine.o \
>  	xe_exec.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> new file mode 100644
> index 000000000000..3a5dbb8a67bc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_device_sysfs.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: Xe device sysfs

probably worth a text here explaining the overall need for the device
sysfs... and then add the individual descriptions next...

But no big deal for now and we can move ahead with this in the way it is:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> + * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
> + * which vram save/restore is permissible during runtime D3cold entry/exit.
> + * vram_d3cold_threshold sysfs attribute will be available under pci device
> + * kobject directory.
> + */
> +
> +static ssize_t
> +vram_d3cold_threshold_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
> +	if (!xe)
> +		return -EINVAL;
> +
> +	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buff, size_t count)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 vram_d3cold_threshold;
> +	int ret;
> +
> +	if (!xe)
> +		return -EINVAL;
> +
> +	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
> +	if (ret)
> +		return ret;
> +
> +	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
> +
> +	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
> +
> +	return ret ?: count;
> +}
> +
> +static DEVICE_ATTR_RW(vram_d3cold_threshold);
> +
> +static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +}
> +
> +void xe_device_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	if (ret) {
> +		drm_warn(&xe->drm, "Failed to create sysfs file\n");
> +		return;
> +	}
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> +	if (ret)
> +		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
> new file mode 100644
> index 000000000000..38b240684bee
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVICE_SYSFS_H_
> +#define _XE_DEVICE_SYSFS_H_
> +
> +struct xe_device;
> +
> +void xe_device_sysfs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 66bde0578229..f2a6998e8873 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -347,11 +347,27 @@ struct xe_device {
>  		bool hold_rpm;
>  	} mem_access;
>  
> -	/** d3cold_capable: Indicates if root port is d3cold capable */
> -	bool d3cold_capable;
> +	/** @d3cold: Encapsulate d3cold related stuff */
> +	struct {
> +		/** capable: Indicates if root port is d3cold capable */
> +		bool capable;
> +
> +		/** @allowed: Indicates if d3cold is a valid device state */
> +		bool allowed;
>  
> -	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
> -	bool d3cold_allowed;
> +		/**
> +		 * @vram_threshold:
> +		 *
> +		 * This represents the permissible threshold(in megabytes)
> +		 * for vram save/restore. d3cold will be disallowed,
> +		 * when vram_usages is above or equals the threshold value
> +		 * to avoid the vram save/restore latency.
> +		 * Default threshold value is 300mb.
> +		 */
> +		u32 vram_threshold;
> +		/** @lock: protect vram_threshold */
> +		struct mutex lock;
> +	} d3cold;
>  
>  	/* private: */
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 4919fe85c704..ce4bdfcbc46d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -766,7 +766,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  
>  	pci_save_state(pdev);
>  
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>  		pci_disable_device(pdev);
>  		pci_ignore_hotplug(pdev);
>  		pci_set_power_state(pdev, PCI_D3cold);
> @@ -789,7 +789,7 @@ static int xe_pci_runtime_resume(struct device *dev)
>  
>  	pci_restore_state(pdev);
>  
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>  		err = pci_enable_device(pdev);
>  		if (err)
>  			return err;
> @@ -805,8 +805,8 @@ static int xe_pci_runtime_idle(struct device *dev)
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  
> -	if (!xe->d3cold_capable) {
> -		xe->d3cold_allowed = false;
> +	if (!xe->d3cold.capable) {
> +		xe->d3cold.allowed = false;
>  	} else {
>  		/*
>  		 * TODO: d3cold should be allowed (true) if
> @@ -819,7 +819,7 @@ static int xe_pci_runtime_idle(struct device *dev)
>  		 * 3. at resume, detect if we really lost power and avoid memory
>  		 *    restoration if we were only up to d3cold
>  		 */
> -		xe->d3cold_allowed = false;
> +		xe->d3cold.allowed = false;
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4371a6a04f4a..07e204990aa9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -7,11 +7,13 @@
>  
>  #include <linux/pm_runtime.h>
>  
> +#include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_placement.h>
>  
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
>  #include "xe_device.h"
> +#include "xe_device_sysfs.h"
>  #include "xe_display.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> @@ -148,8 +150,11 @@ void xe_pm_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
> +	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>  	xe_pm_runtime_init(xe);
> -	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe_device_sysfs_init(xe);
> +	xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>  }
>  
>  void xe_pm_runtime_fini(struct xe_device *xe)
> @@ -166,7 +171,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	u8 id;
>  	int err;
>  
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>  		if (xe_device_mem_access_ongoing(xe))
>  			return -EBUSY;
>  
> @@ -192,7 +197,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	u8 id;
>  	int err;
>  
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>  		for_each_gt(gt, xe, id) {
>  			err = xe_pcode_init(gt);
>  			if (err)
> @@ -213,7 +218,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume(gt);
>  
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>  		err = xe_bo_restore_user(xe);
>  		if (err)
>  			return err;
> @@ -262,3 +267,28 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
>  		device_set_pm_not_required(&pdev->dev);
>  	}
>  }
> +
> +int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
> +{
> +	struct ttm_resource_manager *man;
> +	u32 vram_total_mb = 0;
> +	int i;
> +
> +	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
> +	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> +		man = ttm_manager_type(&xe->ttm, i);
> +		if (man)
> +			vram_total_mb += DIV_ROUND_UP_ULL(man->size, 1024 * 1024);
> +	}
> +
> +	drm_dbg(&xe->drm, "Total vram %u mb\n", vram_total_mb);
> +
> +	if (threshold > vram_total_mb)
> +		return -EINVAL;
> +
> +	mutex_lock(&xe->d3cold.lock);
> +	xe->d3cold.vram_threshold = threshold;
> +	mutex_unlock(&xe->d3cold.lock);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 193e5d687353..bbd91a5855cd 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -8,6 +8,8 @@
>  
>  #include <linux/pm_runtime.h>
>  
> +#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
> +
>  struct xe_device;
>  
>  int xe_pm_suspend(struct xe_device *xe);
> @@ -22,5 +24,6 @@ int xe_pm_runtime_put(struct xe_device *xe);
>  bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>  int xe_pm_runtime_get_if_active(struct xe_device *xe);
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> +int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>  
>  #endif
> -- 
> 2.38.0
> 
