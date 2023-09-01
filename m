Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76A0CA0FE8
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 20:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B410E09D;
	Fri,  1 Sep 2023 20:35:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A89B10E08D
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 20:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693600554; x=1725136554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E8kfpLtQ/v+uOEAOAhd5Lp8ubagsh7YPJ/7GXrz4ZNY=;
 b=bSl5WGYbbkKIsLB3Pp/a6fT4fBKoDJgnxcKpOqTMsu7ntaPXbK0FvqRS
 qyrCUE91PvOSH1yuRWQ8JsL1zBPSdm5VjQ7MyYNKgDd7/3t+rhrsEUmR1
 EdIEjq/R5ObaDikOmqFdg9SZPQAfVrpEkxrnbl5Uk36FxWeTCNQ2cdwXx
 Y2FmSqIwBPayKg4ITy2yGcuyPTk08hmdfq37UglV0zkpixsy3x8Kef42a
 IC/yvr2qLSDTe3GdW95wJTdwaU9bvRIwhzNkLjV1wO/eBe5u2Dhlrap/y
 8JCKP8GkNKHDN+a1MLdU0EhRSsBg0PeyjvLB55Z1B+0rLV/mzZA65FGAo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442701389"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="442701389"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 13:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863672904"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="863672904"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 13:35:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 13:35:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 13:35:53 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 13:35:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrVfK7tU9dpIWMxdkN7JIdAqgtLyUoEp1qFSRcwF1u2MLxN3V6Pb5qAtzr5eLVn6pH4qAdb1uH1RvYB7pnNLl1HHbSaREg3o1m0AGB+GkjVtrX0Pe2/L328QkPa15Iput2B4Gpyh4Jik8TfYnF+LnhYt9+rnOQo9NURkkkv+2Nmpgzh3SwxFbSJltDczImT5/O/CSNLOyxwm6T/JGtITC+Um4EGGbLKe84BBUfXFcU7GRO6Rvyi3dKaXyLLfUSz98D+Dd/AB4l+ymirqx7wrscafWJXfvS9o2HcZF/LtUx3HjpPexJbXQqurAOsm+p8YX1l7o2r+toltbv9oOH1ryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVSDZ5IMH+/couw+NJiQsKEHcghFp4E680TIz2SPUkc=;
 b=iaQbdvXXav7KLGY8PNle/zOIjqtZ8lRolS1BVGASuBShuKSfIFZ/vIdtbL7iL223R/u0DXi29bdlzyCpfpjwOXVoPhYbQqCNMovjuxM3Sad3HXqcbjy/xlSRHy+YJGN/q3bgfhRYSbTjWS43p0EQcVONBxViv13AgwGitNtrDWD6tUoH42j2Bdyi4O/R32Jc3iZFxranQFXoNCsaUA89JLliAJKc8tUD9GhKr7sF80+Ym4i1kRnbYXEpJpFf+PPVT9A7PV5D9xWmJiWvO3KjuvfpkwwBtHV54Xr44zV+GP+CRKm4xOV8mw6oUarfxSUHweqxW3HoKDuL4i48W0V5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Fri, 1 Sep
 2023 20:35:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 20:35:50 +0000
Date: Fri, 1 Sep 2023 16:35:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZPJLIlS7K7ey17kL@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-3-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230901121545.361436-3-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: BYAPR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:a03:80::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: f21cac6a-db8c-49a5-94b1-08dbab2b0753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0W7do5n90zw0nsZtYhH6EdhUGmSMHKCoVR1IlN17SqydDJK8ncZsDRN5Up+hGU7YBOdEFNgbGg04pnaNAyqS11jDrNb2nWx9au25lEgFpFn5i6Hta7J+EsNzBgLGg3f/N3leh9dIvi2PbpO62eO6AtHglH+TDEGONJLEgu45iSOQ88Sna1REi0xqQgIFKPAGsbcb+1dm23YCWzlrQIuXK9SWhE0xvcbxtY2TANs0q3rsy03nc+Qs0778rlhS+XZjVKdVh7yXa11lehV2sGNp1H+WkQCR62ykhVaxLz3yPsf3LbUdlaQUmMgzs/kDt/A0SdhyPKF0L0nJJqN/lLcDvhc2duXQoLfvWuwLFd60nxMbmNQ/DA3ENzj71IAX2Q1tV1HeSRcbs7j1nRts/xi40evZgre3P3hJI21gTYFG+x3T8q5VB9tmWHTncVCF8gyMSHqwEYSKivqCO7HC9s3WE0AbALjNA+JPp7O5wZSLkJZoFSPcwy/59G4zXA1rikAhoipq7UcOsVquqOZ4foq9Ddbk+Ksq4rJPoMsPrBkF6udROVFX80Vzf9lzIdirzsRQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(366004)(136003)(376002)(1800799009)(186009)(451199024)(66476007)(6486002)(6512007)(6506007)(6666004)(83380400001)(2906002)(478600001)(6862004)(8676002)(26005)(44832011)(41300700001)(6636002)(316002)(37006003)(5660300002)(4326008)(66556008)(2616005)(66946007)(8936002)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/PkA0acCYfIhS78BGImG8Y2FhYKmMJJJibFr+iwTDeNz2M7Ptga7q3A3dHbb?=
 =?us-ascii?Q?K3tydH0B6yMuc6Li2XKAYX9zX8AwtYNsAxDtxumpXI4jy1LeOhHjjDFEwEmC?=
 =?us-ascii?Q?UxQMTT1PcEMzg5FGv91MFbm6tdyLWwXsL0ZIEkZCe1kzf6x9lWLoY1vHM0ba?=
 =?us-ascii?Q?oXhr3l5zX/Sr8l7CVVFnGfEloTl7wE9zcSxuMM2trvjR4b2e7usbJotHm5a+?=
 =?us-ascii?Q?57zUBFjUYIDFp6uxQx2XaN7tEP097yRXZlSpCys1xRus+2lM71Hv8QYNa8ER?=
 =?us-ascii?Q?GWlAEi+VRqLwj2eHkOHmrM3zTcPgCDVUyV5/WvhFZdIyKeGq8A5C8/guwd+Q?=
 =?us-ascii?Q?Sl335JWOZeiUDYgzp1hoazjPk5SBlTjmgK7Usq1wfEsraQyWaBqosTr5kYH2?=
 =?us-ascii?Q?TcERrGC9AdU0einPPZG0S33IAq7EBk5S2zPRaosH6KXn06GnSVCZSgrZPtER?=
 =?us-ascii?Q?aOK7EKwQ0cz7btyqowncr+iA9shoMaKSQR7k5f/4PIRfkcsbN9Y/Pj0Md0Rc?=
 =?us-ascii?Q?xbrO2YNrM5yn0G11+bU32Xq9avCesOGo6sZIgyT0v00nlNmvcA/oc4UxhKN2?=
 =?us-ascii?Q?w122hrO02FUvg9ZmNaoLv/JxrxayWbx7IjlqYH5BDgZvX9WzlTTN0SsKbk50?=
 =?us-ascii?Q?6QK+uX4ObGd0PYYousnQIWKUvo8Sgsim5rlAoCdFCcE4Rq2ADYaeJsJSI61J?=
 =?us-ascii?Q?1YUGYLgC6v+B+ImNFfr4pVrv4i+47WkZ9F83BWv5lTKDBmOomlt12SQC9leQ?=
 =?us-ascii?Q?nLenx/YKoxLgP5ZIxMvBJADWT7dCVUg9NrEro4XIYbBYIp/HaNN4WJ/PqClK?=
 =?us-ascii?Q?+ck2NfrSopPtg6SqMy9nSpYkts2AULX64uzXrU1ItKCEcdi9XrsZ9DMw96/e?=
 =?us-ascii?Q?4DZvKpAq9CY095pYmWIqOHBm28UsCc7E0IzO5GDwzQ2kf7iAXNTOUkrfzwK5?=
 =?us-ascii?Q?jNXur+IajW7hbSSbrtG7K39bZOACFHzdmEbrYQCr75WQo7qdw7Y8gMp8yOsE?=
 =?us-ascii?Q?M+LZluF0BM2UxTOPvpLK/QvZ66PXxVCpq6AOUXC0TC6cLtJju5SV+54HiOH4?=
 =?us-ascii?Q?rzogcED2Cucz9v+p1hTBvUPAKCokZyTmTXrRGOq7AVjusExOzWF7pjq8DHmG?=
 =?us-ascii?Q?opgkT05xhfS2Z9juLPoWC08suq/XPbCnrhFsQlW0LLVxZ95IHZ4Sn71DX4/L?=
 =?us-ascii?Q?3+jBYoH8mBF2wE1mbu9bWuW2k47zg3YGY8FCIT+hgpeZNiy3EZyVCDxSUbpU?=
 =?us-ascii?Q?kNUcnDt3GdoT3fnJNNwmv/M+2aAyqRaokJYgUFvkfSAFbKa2CkZDX6fbLZgc?=
 =?us-ascii?Q?BuhTJ/xwYznMYJv+HGV1MELtLDqwcspYg/namESczb1MVjHJS+FRArAny9//?=
 =?us-ascii?Q?/1Fv9DbyZn5qXsd+jICXzq2YtgFMtcQR71QH031iey0dG41eGpGIl6ZZAaJ7?=
 =?us-ascii?Q?1b7M6XUQXblEzG8ZnSMDxZTCKP/u1iwsl6vnZlIAJnNbsXUBotZZnpl3/n+O?=
 =?us-ascii?Q?IPY0XhegX562XooES5+2Siq6bUg60yoGjjcD4I6F5di4hOhQQrgcTXLRM8Cp?=
 =?us-ascii?Q?Zr5OHhFyq6ahXG4qb19K2kkYWWJ3czKB8RCf5tR4BQEIgdMUi7BR/HDo4aaC?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f21cac6a-db8c-49a5-94b1-08dbab2b0753
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 20:35:50.0364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0o8FjmymHMrALwC0hQp2fPpLBySb3e0X1GyhmlogOPmeAe8VHKZdPZdb9xkTXj6PCvvDRMdVoI3NiAxeGEw0hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add base performance sysfs
 attributes
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

On Fri, Sep 01, 2023 at 05:45:44PM +0530, Sujaritha Sundaresan wrote:
> Add the following attribute to Xe sysfs
> - base_freq_factor
> - base_freq_factor.scale
> - base_freq_rp0
> - base_freq_rpn
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c    | 116 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode_api.h |  19 +++++
>  2 files changed, 135 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index c03bb58e7049..6a139d1dbf66 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c

again, this has nothing to do with guc_pc.
We clearly need a new component to handle the frequency.

> @@ -20,6 +20,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
>  
> @@ -37,6 +38,9 @@
>  #define GT_FREQUENCY_MULTIPLIER	50
>  #define GEN9_FREQ_SCALER	3
>  
> +#define U8_8_VAL_MASK           0xffff
> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
> +
>  /**
>   * DOC: GuC Power Conservation (PC)
>   *
> @@ -642,6 +646,112 @@ static const struct attribute *pc_attrs[] = {
>  	NULL
>  };
>  
> +static ssize_t freq_factor_scale_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buff)
> +{
> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
> +}
> +
> +static ssize_t base_freq_factor_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read_p(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
> +				PCODE_MBOX_DOMAIN_CHIPLET,
> +				PCODE_MBOX_DOMAIN_BASE, &val);
> +	if (err)
> +		return err;
> +
> +	val &= U8_8_VAL_MASK;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +
> +static ssize_t base_freq_factor_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buff, size_t count)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = kstrtou32(buff, 0, &val);
> +	if (err)
> +		return err;
> +
> +	if (val > U8_8_VAL_MASK)
> +		return -EINVAL;
> +
> +	err = xe_pcode_write_p(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
> +				PCODE_MBOX_DOMAIN_CHIPLET,
> +				PCODE_MBOX_DOMAIN_BASE, val);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(base_freq_factor);
> +static struct device_attribute dev_attr_base_freq_factor_scale =
> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
> +
> +
> +static ssize_t base_freq_rp0_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +				PCODE_MBOX_FC_SC_READ_FUSED_P0,
> +				PCODE_MBOX_DOMAIN_BASE, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(base_freq_rp0);
> +
> +static ssize_t base_freq_rpn_show(struct device *dev, struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> +				PCODE_MBOX_FC_SC_READ_FUSED_PN,
> +				PCODE_MBOX_DOMAIN_BASE, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(base_freq_rpn);
> +
> +static const struct attribute *pvc_perf_power_attrs[] = {
> +	&dev_attr_base_freq_factor.attr,
> +	&dev_attr_base_freq_factor_scale.attr,
> +	&dev_attr_base_freq_rp0.attr,
> +	&dev_attr_base_freq_rpn.attr,
> +	NULL
> +};
> +
>  static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
> @@ -925,6 +1035,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	if (err)
>  		return err;
>  
> +	if (xe->info.platform == XE_PVC) {
> +		err = sysfs_create_files(gt->sysfs, pvc_perf_power_attrs);
> +		if (err)
> +			return err;
> +	}
> +
>  	err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 837ff7c71280..da4114bfaa7a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -30,6 +30,25 @@
>  #define   PCODE_READ_MIN_FREQ_TABLE	0x9
>  #define   PCODE_FREQ_RING_RATIO_SHIFT	16
>  
> +#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_NONE			0x0
> +#define     PCODE_MBOX_DOMAIN_GT			0x1
> +#define     PCODE_MBOX_DOMAIN_HBM			0x2
> +#define     PCODE_MBOX_DOMAIN_MEDIAFF			0x3
> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER		0x4
> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY		0x5
> +#define     PCODE_MBOX_DOMAIN_CHIPLET			0x6
> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK		0x7
> +#define     PCODE_MBOX_DOMAIN_BASE			0x8
> +#define   PVC_PCODE_QOS_MULTIPLIER_SET			0x67
> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
> +#define   PVC_PCODE_QOS_MULTIPLIER_GET			0x66
> +
>  /* PCODE Init */
>  #define   DGFX_PCODE_STATUS		0x7E
>  #define     DGFX_GET_INIT_STATUS	0x0
> -- 
> 2.25.1
> 
