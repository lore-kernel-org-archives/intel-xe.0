Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D15DC77B7A
	for <intel-xe@archiver.kernel.org>; Sat, 20 May 2023 05:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD56D10E494;
	Sat, 20 May 2023 05:52:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6DD10E494
 for <intel-xe@lists.freedesktop.org>; Sat, 20 May 2023 05:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684561953; x=1716097953;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x56ZA8zFxTIGbiCd69EzvQaSYG4E9RPKh9jh+GhmOwA=;
 b=nQaU23z+Ub4WahfwLJZ25H6jx5+FU4xnCNJktN57FtYI77wVLEwNEbsT
 nVZXoflM7DH/UK0+70iBF41LELVz/VMPZHme7C14P367T+YP9EpYFQzvZ
 s5bLLfx0QZFj6WHqKkuXv065ccprpiQFl37Zkxd/wSOsq7k5iAm5PtwWB
 I2Jh3jMNM5Zwti8wyL2Yo0fNENj/W0HqerLUQhUzZicjLcVq4qpOpbF4C
 Cuhz3Wq424PYglP6G6MGjPisfzHU4URGTQO/NtRhm4od580dT1XhLdH0H
 ExX/WqROnh3P34zzsqfdQaLjkVdMnEPZW2dERl8/hzUQzOgKf7GYShXXf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="350065309"
X-IronPort-AV: E=Sophos;i="6.00,179,1681196400"; d="scan'208";a="350065309"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 22:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="735753782"
X-IronPort-AV: E=Sophos;i="6.00,179,1681196400"; d="scan'208";a="735753782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2023 22:52:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 22:52:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 22:52:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 22:52:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPeUwZpwvfmI5gEiYQZ3vJ9ydaj6jSUmb3Yl1gaaWi90JV9cFmU4M5Q+OxEV/jquBGTGyXFX635p5n5OUGMxTe7FNP9D/eAhYQUkRhUuRAMv4u5Yo7ixqHLOUM2U+JRWBYA5fBasUiPUShdPqx38Yqg9j62I80d7Aprb9i1qRoyx/gWAFUnNBgNv6Py5+zV9Wzok+yMvyGJE4gdu+iUKTZBEUFIOu7ivNlQ3ZifOSMKaoGzXI50la0aw7qZ8umBeZQ7NcjA/+XSpEfj07B3OB8vcDaUB6Mbj1LqUnER0p5SSdUi+hg230OzlpVD8rNMpJLRQWb3C+wvuYk/X/rUZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5ievYEE/hr+AN9kRN9bCjFRMNocba4fVVgzws7Ct9g=;
 b=gfop0+CEKo3GwatkQMSD/ujOu0ubryRluGm8a7OO3YrVMl2ccUzRbmHhDIsYD5QUSyxosNIrytY0I8zI7WjRbBSUe/JDTZOZ2fJN+PfbA/LjCdekfn/VqWpie/63olBLRZtZixRUzsN9wTl2TNVw+IDRAvdiNRbh2A2WiJwflNpQi+7wn3n60FA4N4nMLdU1+J0ZVaxRUyNbYKQqXuzTYIJQg91ICX1WVQ4NWw1J30xq1jA9IaCrNV4mw7A+rqgr2pwZgfRgQyNT2zkH8TJp/7+45NMSqlGUdNNXH8bgSw0J/NZItzUIJJ9n1zzIDA3zgGZo1AOeqCS51dIumPmnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Sat, 20 May
 2023 05:52:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.021; Sat, 20 May 2023
 05:52:30 +0000
Date: Fri, 19 May 2023 22:52:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <bj3znaidiyjruvb7rfq4wfamduha4payz7j6lkcoarpdklmy7q@w3p5xgatwifg>
X-Patchwork-Hint: comment
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-7-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: dcce583e-eebb-4664-a2b6-08db58f665e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8LxBjLxrh9zrWpbzjrpYxsgnHg/SkX9JkOmc6jMKKZTfiZYSGPYw3lP23Cw1U2qbhxpmOt7y/TxaIz/tUrtQJrZgrw/41+JULAXEpiFEEhC6yYvmFxK+4UPVbLD+/qv06OUDEKxMxuLIKgsQoEBAiavt5QWE/xglort/2d2lGlvdE25bsY0dEMeq/y4RsCYtPsvz8+ho18it4mz8Ofrv14lkGSRtxUdw3uWxMNhufYLa7nLe1+QZOXuneUyxrzCbbWJ6MimxzzU6x2yBLgdymUR9NQl9nxz1MBIrMcdR4eqDJJyIJOp5bIOwy75SLOkArClkT73UrCS0UOQ57fHqxmNaVuF5my0s+ASsUD+f38z3wbvMH0aYhNTP762huC/WR0XY713KfHniz4MRKtyKkdoWcZbCiWIgmw1qySDNdmauXuGHlqt9QQvPWp2sYDBDy02rnqIKsYeUXYI0mxqSfpRvk38dTEicYvQ/ug+m3G+xZzFbR9ic31t0V9dTmFNnjMNbxuPxzNIMXflNuFCftNXb9z8kciZKuS8DGNr4QegWu8KywQlocMsuaE9wte4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(6486002)(26005)(9686003)(6506007)(6512007)(186003)(5660300002)(66556008)(66946007)(66476007)(82960400001)(6862004)(8936002)(4326008)(8676002)(86362001)(41300700001)(6636002)(38100700002)(316002)(33716001)(2906002)(4744005)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VPsJj5dxSgJaX5eH2UWyjzKPPBA5/ZgJJs94a/4w+fpP5bnjLgcbsCZzmKiP?=
 =?us-ascii?Q?IG/61sBvGa/XDI315u6kviC6IdD6m7Dp3B9VRMw6UN775qZ4IzNpaELbjDtW?=
 =?us-ascii?Q?wbWXHgbwJvHci8mOyPU+KZRG9gioN6SlgwL6HEOS2dnsUarxGgak0YHFpHKd?=
 =?us-ascii?Q?iGdFVwTLUusD4UhCIPYFwhR0B6ppVM5sxdNssUNxBOVRhuRz89+X1RyoXUY0?=
 =?us-ascii?Q?FwzQ4079cJVMYsXLKLqyujvxZ7RSNiLef/pzR+oeJW5FWKRnQRV4flZiPdsM?=
 =?us-ascii?Q?SWwhkMJnhQ9ofNSbPiwHkaqXohgOyo3h9XK5B7q+1S36fc51ER8A6zHvwVIi?=
 =?us-ascii?Q?O7c9xF1Fc6RoBD62DxoJfAlu25bSdrESawStJaG0NqJzWb1QcyRSij9bRc4q?=
 =?us-ascii?Q?D3ZpllpEwab6ihTcX13UTb15uLep2et2BYtiDf+AdXk65ertgTXwiBUzfxYe?=
 =?us-ascii?Q?IIqrSwWcijrFt3A/if7Ns5joIFmLOFusi60xn3KCPlVTKB9Ba57N7Mv+sG70?=
 =?us-ascii?Q?w6JpfJH6YkQXvSW24f+BJ6gCd63Eoqm3eZHeGiTYdLXBnDndEOhes/zHlKZZ?=
 =?us-ascii?Q?1de4D/LfpV6rQY7MOly7BZS5XSuY22LXW4DCjz5oBbdlXTf7R7Yym+FbxiCL?=
 =?us-ascii?Q?XYNHbg0KAQaX6kOwk1dxNDh7xVwilYOfqhmfwiW7ZArAt4MrxjWSuu85nzV8?=
 =?us-ascii?Q?pG1/7ye+kfUfg49Hav13LyFT29gRw8vwVTJ7qSegvQBLnH31pp0GnWfgOQJa?=
 =?us-ascii?Q?1LVP4Mhr7/ZOxW12UrqTFg+00Nudi7d7cfm5j/iSwkcFU6UMycEM/tbNyJnX?=
 =?us-ascii?Q?sbreH7FAiPe5X22DJi3hxP/duhwl2Gvn2KzvkdAfhzkoJrbkQqePv2gJ4I2a?=
 =?us-ascii?Q?EN9wv38qGdxJMO0vQpb44fd73XZPtmTVGCQggv6bXScej0VkoF41ucp7cnCL?=
 =?us-ascii?Q?Ae8tG1HXkJ7pLubdLFkNobCqIU8g8ve5D5vOj8hkkDJxkjNd06JPCzArtAaA?=
 =?us-ascii?Q?l9m/C0clkevgNESvpvHTSK3zvEcM5SxmvuN+YSEMKHRDJb+4lTk5sFph8jra?=
 =?us-ascii?Q?Ovzm9Qj399SlL7ibwlHXR+XEY+bhQb5REbIbA438jvHeBi5W7ZcGvzKBM7K4?=
 =?us-ascii?Q?73bptZXcwE/RNkudeVNjKFYZezBBERdh7BjRL4cH0QJUBpnmaRzmMoy6lrZk?=
 =?us-ascii?Q?GtYzjkxi6ldximrVSjJRT/iJnXxCTeSZCTa61oKNlRVs+UZR/2F+d35bf8Uc?=
 =?us-ascii?Q?k2qq9KuKKzT7tD0FUb7yvruvW12e3j6nNy+yEqNCKF+iurXF2H/jIyk9pkD3?=
 =?us-ascii?Q?IdEqN6Xs6OhJMEeBs8zqS11/Lr7TchHpS/X4Syf3xJixbsXKQbomCI0bbGrR?=
 =?us-ascii?Q?JLHAEw9hRM1QeeatBuqkCBML0RRTaPN88X5l/VA7656zSONulww7kniWSL6d?=
 =?us-ascii?Q?eKsvs1BPfsUowhCyzlWRw23FRgrrp70m6CMUCjrPCvZ2dTHfr1ksS8p2kOB2?=
 =?us-ascii?Q?20gs0ynW7x0rE/WrJBHBBMr0mu61UVqfa33wC6m5N4HDy/P5uuPetgrR+e9v?=
 =?us-ascii?Q?JA1IveAsk7KopxHmWYPjAtVoXVElzYEJ60dHfCfC3A1NyBGY0bznQD03j7zV?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcce583e-eebb-4664-a2b6-08db58f665e1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2023 05:52:30.0922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6xDvUOHhebEGRnHJ+N+y6m+0H736Nw9RGbRx2vltvBskjzqI6XE5oO4heR90UirNgt5ngIT1UlVJAdUFf0RGhIkohRqqJ9FZRqDZJeNmvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/30] fixup! drm/xe/display: Implement
 display support
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


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

On Fri, May 19, 2023 at 04:18:03PM -0700, Matt Roper wrote:
>---
> drivers/gpu/drm/xe/display/ext/i915_irq.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>index a0f22bd52549..6235ff9dec36 100644
>--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
>+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>@@ -670,7 +670,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
>
> void gen11_display_irq_handler(struct drm_i915_private *i915)
> {
>-	void __iomem * const regs = to_gt(i915)->mmio.regs;
>+	void __iomem * const regs = xe_device_get_root_tile(i915)->mmio.regs;
> 	const u32 disp_ctl = raw_reg_read(regs, GEN11_DISPLAY_INT_CTL);
>
> 	/*
>-- 
>2.40.0
>
