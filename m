Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C87AC7EE22
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 17:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E4910E133;
	Thu,  4 May 2023 17:45:11 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DE910E133
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683222310; x=1714758310;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vEObIHNSoWehCkZdw2HWfn6rGdCWCbAbfSHztpklXqA=;
 b=Lzp+P0cOA4cTgVJru85K+qWkfjpHp8Vv+Y4tdLgpwbM7qrZ8VGbfDz+B
 MKPMf9UI0bKtwimzPzmqsNRJBRKuCoJTdbAfv0gOuu0S7gVuI+OSGvoxL
 Cqm9kvcaD8NaA6HnBg7vtR1nNZUnROvgHzTxYKZge98580sTJhfcMrqp4
 L+5WHN6E/qPvnea2eCzF5kIyPDLVnrIUxe3Yh3Bw+ESuPW4nAa4sDOC1c
 QmXl8RIUqrthzCGZ6PCE5ozCzcoy+7RP24oUalsz2W+LVyuVvAgNd766t
 XKb7MylMaCCKO8uWr83pgM0mTQjE/FsC+YquK67rTuDKiKFEk1YCbEi+Z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377079475"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="377079475"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 10:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="674629012"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="674629012"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 04 May 2023 10:45:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 10:45:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 10:45:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 10:45:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 10:45:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOcotlWKq5Thbx11OAbtuDvSJB8kvsaLaUUAkL+VCyySi3f/z2wB+Him6dlu5M53mA1Z8CIn0z7gg7XAjgit19yKfH1pLyTqIW7vuStS+8zDiySkyw9mMHNxd+YJ3NNcv0AsOMVq1yeOfamJwApeLUvg7MnAtjeh10ziuiHGJmilaxcIc+jDHE0UNMwSMnweuLBF+PrZsn6wOi/H9T8q8htufu+slLXqMnLoWOpIMhfUkOUaVk3KsAPxmhlJAsQO+1/A4kDLySnLITP/jlCP67HCEpm3Hi4O0Oyhzpl3UZahq3l017MFq9+HrM3fi6KqpAuiq0GlYDjH4U5CcvHjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9EA+f93KKDzsURht5WOkBG4nTYyUtoTE2Y6oDODJHU=;
 b=IBYwkc3q06f+i+fxvmGEmcU07AndTzp7DgmqB0ZbVqrehZsEG+fASky85aekBKUp0YLyRj8JrYA9JuUOgpjdiADxC2U5SgXqXSzH1mXWWeemlZ4dIcqyeGxUQy2JzY9qo/w5a+6K5mnT5nIqTg8SXeoM8iQGmBUXnE/ZgSQfBT95XgNKt1Uc0BSbbeWZFd0GcZJyc2i5XlDo3Nw/riO+blXlEQUKVgIyXXJfavNy+x9sKOyLB10lo1LIX25qHUKahiQS/VKWFrU8xrTAvXXFmAAX8Cnx0bVx88eG0czAhX1xoLmfod3PoeREgEEUysJyoc93QdbSCvzil2mu9zsWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7391.namprd11.prod.outlook.com (2603:10b6:610:151::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22; Thu, 4 May 2023 17:45:06 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 17:45:06 +0000
Date: Thu, 4 May 2023 10:45:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230504174503.GP10045@mdroper-desk1.amr.corp.intel.com>
References: <20230504171115.89838-1-jose.souza@intel.com>
 <20230504171115.89838-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230504171115.89838-2-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0198.namprd05.prod.outlook.com
 (2603:10b6:a03:330::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: a91f497d-4952-4947-27b8-08db4cc74c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e41r2QRZgQFpUhw/gznLH9cyMspAv8CGvlu1T7Lpqe92oOQ88GeFOObwMfQZKwPBA8ab3rLI3Fr6P4yHdrgetmVnxxk+ATmxRcx6cwe6jO8XXbCUiF4DsD1vT7GZbOKHEx4KF4BlRDs/h2yW5m1XO2cc7N3tDCN2vDSAKfQEefNYNG8ojrsT0UWw5Nx7ry2dg+hLevMIF037Np/WpVD/0dMKztTCXUliZQN6aILpGUH3q+8jmPqzd91tBp9JP9ievkH/jDdcdbnxPOWI+TWo1OwDW7SZgKYAc3tSjwbzf8yIQ/1WQHvjj8epwpWb2UOPhveiAqMKTSjBlgFtDjYzCYCKYJSNyn0z8h63aotFDBkVk6cG6+iTWImzURJMHSEsfeefPxy8XHvIY2ZMOMrY+X/MSmSEg0uq6KDXUOiXeKbXhx+Tt0NVvH9hQuCjmkqVoERIfCYJPZJTKSSzoeZUguEY2kAUwxLP4GOsmLmQSLcuG1QU/PtqUCgQMreAPOxMy3FBsx34FQB6u+BoxCPx7GJ5/os8sesHxL480tZY2c7/YXMeCbywzbfLd+WH+2+C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(6666004)(6486002)(6512007)(186003)(38100700002)(86362001)(33656002)(82960400001)(6506007)(1076003)(26005)(5660300002)(2906002)(66556008)(4326008)(8676002)(66476007)(66946007)(6636002)(316002)(8936002)(6862004)(478600001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GVwZ9oB2KAXyFoFhPtImmBnTjUdiQwwbyOXngLedg2rupv7eN9zWH1JMu2?=
 =?iso-8859-1?Q?sMmCUGdb2PYpqRPTYs28OBROSVD6wXo9X4YwenSqYXu2HUEOL5lzD8bDLi?=
 =?iso-8859-1?Q?Lq0shmuiIcTZvx2nAjpJFvjjbBQ7zrtzs2ZRyipsaOrGQxEubvMEPF0XNR?=
 =?iso-8859-1?Q?Q/vDCXIEnAKjAXmizmsoHZFGXuGG97nEmBd799bEXhdWMi5LLPdFIslJ/m?=
 =?iso-8859-1?Q?iAdtz17hrxOIVFlcGJQaJoUT1i+L5ZJmWC8mStwwJoH1EHLpy59BRvKKV9?=
 =?iso-8859-1?Q?DUEM6EvatFBXKtGOvV3hY/leDEuBHsxwlqxLH/x4Zj7F4RRmAI4Jx/1hBz?=
 =?iso-8859-1?Q?zwQZON6IeN+5rzxF76cBkgNU9URlUce3x9Wc0MBkRK5a8eW1inql2a+iYF?=
 =?iso-8859-1?Q?CytRoWhugtsnhL7djiuWUUVRCDwtm18KiER4qtG4FXT5Tb4LU/57PJpvsT?=
 =?iso-8859-1?Q?Z79b9mA4W9eqWmLwfZM49zm9A0L1xOkIcl8/QlcHq4lBCblZT16BwcU9gE?=
 =?iso-8859-1?Q?L60kXtvtnjCoM5razNLswBnUaBblyrmkXtZ3GfL2u7bdHMnrF9Dck0OXBR?=
 =?iso-8859-1?Q?2huPRedVy9zKBGTAMQ8ZLXJq+nWTHolkkyzlTrZ+gM18bHMc5/6xO4SvBb?=
 =?iso-8859-1?Q?1B/UBImJ56EED7s5Vyf/JtKbqK4b87byGjThuF9h6kLJqxHAx/pRrzi6ct?=
 =?iso-8859-1?Q?KPs4R3G/Xzywof41zbvNiK/c86qu+cLmha805A19u68Hk51QDdXPQD0oxm?=
 =?iso-8859-1?Q?KBvDmLbs1c2jPfWoirqJzOzn7aKr/hWOPuxYoeVhYVmNAy9ydGVLaYDEyh?=
 =?iso-8859-1?Q?e3fcMRrVtPywzQrGXjak+eNULBHT48P5s4hL9NzPn1C5JNSCCwbc98zPlR?=
 =?iso-8859-1?Q?zTHMdxzU2A8A0G+LJBrZhH36FfzZKwjy0Fg8pxQYV7R0MBOGtoRFqE1Eq/?=
 =?iso-8859-1?Q?BBiCyTbST0FmbMVyr+1h+vQdvZE0gRGyKhWzW5FUZeixEe3LRHzp2TDwwm?=
 =?iso-8859-1?Q?KG3FJlw7lk3fcaxjYO0cfSZfSKOGyXTmdEKg9gkrKRuhPbeTPsKWFumFcR?=
 =?iso-8859-1?Q?RYHmzYdgfAuVYh35xTY/gJv+r31XX/CeOccAm6+nWUQ5WrHqjCD+6SYaTN?=
 =?iso-8859-1?Q?nKY3HwiT59E630kw+BORgDs8USoKdUwo/W/LI/RRMzOeyq5xxX1t79yNHq?=
 =?iso-8859-1?Q?mraJXHGbmXWTgZzv+yhGwEoOvpUCTouTquQENnPlB/v6JnFbySEu1cPgDJ?=
 =?iso-8859-1?Q?3ws9/aal6I3IbocvfiHnX1Z/S+RrTj/C6bpChy5HyihcFvhy1GJU3SMOAm?=
 =?iso-8859-1?Q?cNKcriFlqcqO54aZyIqukzH46TANCNgmkf1NM/AWOCuJW6d+bKJXHpCCvJ?=
 =?iso-8859-1?Q?xPXjuD5UgwoUszlyC+DqNbaD0s35vx6XKe+5GMQuI/CsigUy2sM1aNFAk2?=
 =?iso-8859-1?Q?NFH3Wt0fo9bXzcAaSdqIwTAoE2i3A11aklMNHD2iZ58wtz00S+e95a2uhR?=
 =?iso-8859-1?Q?pL39I4FnX0oagNPtZSO8SXUNmtBSgxf8PBq1WmwfoUrZmb4wp7sy7wQRDQ?=
 =?iso-8859-1?Q?R2JVbsJ5aQ6ksDzlvFNcoI41SZ/sBPJTPnnC6/s4xxiZzvAPsylgR58vcb?=
 =?iso-8859-1?Q?eBOKcmyVlJlcuJbjoF4YGeeg7faluXlQmZKABFQ7DdvjWFHUdmejzRyw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a91f497d-4952-4947-27b8-08db4cc74c31
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 17:45:06.5008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giC7AozrAfNTk6Gb/Wq1zX6CXqyANqIPP1cWRuD1U8cVUIzpKcm1wmkHJBtAU3KN/lJlcEMJ6PHlokuDeX/B9syzeDaFO5LJqNG0AvbsWas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7391
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 2/2] drm/xe: Set default MOCS value for
 copy cs instructions
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

On Thu, May 04, 2023 at 10:11:15AM -0700, José Roberto de Souza wrote:
> copy cs instructions that dont have a explict MOCS field will use this
> default MOCS value.
> 
> v2:
> - move to xe_hw_engine.c
> - remove BLIT_CCTL auxiliary macros
> - removed MASKED_REG
> 
> v3:
> - rebased
> 
> v4:
> - process workaround in hwe->reg_lrc
> 
> v5:
> - add a new function and call it from xe_gt_record_default_lrcs()
> because hwe->reg_lrc is initialized later
> 
> BSpec: 45807
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v4

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

for v5 as well.  Thanks.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 +++++
>  drivers/gpu/drm/xe/xe_gt.c               |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 29 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h        |  1 +
>  4 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 717d560626cec..79873bf64e8dd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -58,6 +58,12 @@
>  
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
> +
> +/* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
> +#define BLIT_CCTL(base)				XE_REG((base) + 0x204)
> +#define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
> +#define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
> +
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 603bb3ae3e370..3afca3dd9657d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -225,6 +225,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  
>  		xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
>  		xe_wa_process_lrc(hwe);
> +		xe_hw_engine_setup_default_lrc_state(hwe);
>  		xe_tuning_process_lrc(hwe);
>  
>  		default_lrc = drmm_kzalloc(&xe->drm,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index d497f0289c372..ce9975df1c98b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -268,6 +268,35 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  	hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
>  }
>  
> +void
> +xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	const u8 mocs_write_idx = gt->mocs.uc_index;
> +	const u8 mocs_read_idx = gt->mocs.uc_index;
> +	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
> +			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
> +	const struct xe_rtp_entry lrc_was[] = {
> +		/*
> +		 * Some blitter commands do not have a field for MOCS, those
> +		 * commands will use MOCS index pointed by BLIT_CCTL.
> +		 * BLIT_CCTL registers are needed to be programmed to un-cached.
> +		 */
> +		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> +			       ENGINE_CLASS(COPY)),
> +		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
> +				 BLIT_CCTL_DST_MOCS_MASK |
> +				 BLIT_CCTL_SRC_MOCS_MASK,
> +				 blit_cctl_val,
> +				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
> +		{}
> +	};
> +
> +	xe_rtp_process(lrc_was, &hwe->reg_lrc, gt, hwe);
> +}
> +
>  static void
>  hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index ceab653972568..013efcd6d8c5b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -17,6 +17,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>  void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
> +void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>  
>  bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
>  static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
