Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC46C77B61
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 15:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1434310E2F8;
	Mon,  1 May 2023 15:08:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E44010E2F8
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682953681; x=1714489681;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=09pHK8A6mbYaqvjPRYuy8sOTfEJdQXhokgIja5CkvMo=;
 b=LQNMET94Zo6hLvn0eLGturp3Off9qJ6B+du/oE5I2p18eHLfB//PbJ2r
 FRrmM+C5bJQiRbCbsRxUQJkDkwD9z7l4QqWMeyQA9g0QDwuMcm7/ZXG9L
 JeZUUiQJLauzfOGswG9IZV1EVwNu9dW1X6mO/8QBY3MKLyxbTaq7B2WRG
 H0UauFtfkkP9z3K6UyRZvmr94Yt8DmCDSdYgCJdWn1v/4vvZZgEHG1pfO
 R3I1kF/MRwGI+Bu2KR7YPjuweFwnztlvHXl2FeLWIldXLYMOaQJVyeyCo
 GF5+LtmWY3plVBz8SAXFzeXdh5oCNom02xIhYNIZLvWcT0BbTEPNpUFJm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="346969177"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; d="scan'208";a="346969177"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 08:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="726371756"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; d="scan'208";a="726371756"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 01 May 2023 08:07:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 08:07:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 08:07:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 08:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIoFcLCDUZUC0nzcmNRryHUI+7xHstA1JrkPq7ML05dsmVlp2hLtdOf8XRHXSSveCSNwXBmURYHBgK7M/y9DRW4IOu4b3lbrXgB6VQU7DoItp47yQmzNik6Cr4U6rARLSHNk10bqB/OfA3kHvaUvTx57IC8yD7DCblN3+Nn3RKtKvGawU0/fv/TiXAbfbrfLRO0zdWHfNmzu4dRGhnZSBG0aTL6q8atjgTd5tRIrkNXFa05sJ6i3DBAi2FEpUPpLN9UNaIooo/vpBP7o6wgJp2NmA8n64KqCGVuBfwVvDCdT/rf+TFhXZ6GZNVcywhqKHi9q/4WBwWNcQjO5IjXa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ysXFlKyqXQ3tuN9qd7e5FevYLRcgl2gk9TVq5M22Xo=;
 b=hHWbHjmCx3mt9ZoVAWW2wPfebSnBHtBRVCxeM6gBpuuy8CS+k/VBxq1H6PyNLmdp5VzB4JyTyouNJQBLdbbmu04h0PE8/xE2sWXr0fVf6gToeznhlnTtaKOnJAxJldshUlhr7Jac9ESnnnKCcn+68XiWpvYCStRgjd49ILnDsac27P++Rs91N3HTqUzjJCKOQCYfqyu5WenqPJ6RIi0Ipo2MWRmJ0WYKdREhy39LWoS3QbcDntOGi0nEh4mfBz/QOAcXn2y39DiR4c+tm4yLYIfhwGb/H4fxh+SdlFI8MSBz+UVAEFPyOPY04OPiRx81F/iYuZyJgfetMfaLm9M3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 15:07:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 15:07:55 +0000
Date: Mon, 1 May 2023 08:07:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <srdmqn6iwo43zl2m556sqfjqi3dexy3n7hvkitzada2mfurq43@mbeffvffzo36>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-4-lucas.demarchi@intel.com>
 <8fdb51d8-0626-0d03-2080-b978f25cfa3b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <8fdb51d8-0626-0d03-2080-b978f25cfa3b@intel.com>
X-ClientProxiedBy: BYAPR01CA0065.prod.exchangelabs.com (2603:10b6:a03:94::42)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6b5143-a1a3-4f21-0294-08db4a55d789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBMrud3pTFPo+ZZrihNnQUtJ+Sbxem3LPywD07uBhmiwG4uplmIAbsueSY6M45noLk3LUC7JekR002Emgs0CoZ8lWg5Aoe82PBjs48/JeF7jHn6wHYm3JZ81XBgbrYo8LulLNcJpci8hbHNy5UPNfS0u4Xxnx3fosmjZNMBk5iuz5EfsLzP6Z8Fj0SVHRz5/lBE0dIiNlGnQRQ0Ml0PcjJEFGiL/Emg+F2JKkxmmO4srea3koh175qLpah72dZPH9BlGAGavWm7jwjeh+KKqAqB2Y/sdOKlseioKv/xmNRhabl6plbsek72znfFudaslNBYjpHr0lPNUEX94dGf7PmVbv3EO4wbhbs0sesUUccixvAXYEB54+118iSMvbKukhpNMQjdLkdwPIOwrnKQT4qrt1NxDqEqodq2hpflyXsWlrPTbXDJPJpk+3toFHdjm3RDpGqzmwyDE3CYdRe71RNIOZ+LjKnvG4My/s79Txh0qbqytGfVdzMsHKhYs+lbfjJKyJKrVxZQjghN0yY1wBmL7Y7c32E7EltAjlJdNPTagblslU1BFKtM3JupsLjm7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(86362001)(82960400001)(38100700002)(8676002)(5660300002)(66556008)(6636002)(4326008)(66946007)(66476007)(8936002)(316002)(41300700001)(6862004)(2906002)(83380400001)(6666004)(6486002)(478600001)(6506007)(186003)(9686003)(6512007)(26005)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iS/+bN70m2KiujP1v4lPyiVVA+VBJvqQPKART6NaVTNyuHfuvGIbUUqVaWFy?=
 =?us-ascii?Q?W3uQs5BpLIEhVyvQRUUN8YlCpgz/qiASDnLtXq+o/zNCD3SkMAJzjE7ufkdC?=
 =?us-ascii?Q?dWLpJraxn7PuKom5IHUgoSHF2UXc/R0PepVognkjLRDqjx7dIQR04Kgx2wRo?=
 =?us-ascii?Q?HNjURBsiELdnhfUBnd/fg5LUU2DhNk1amLomOgBhjhlUVAY4wNURlqUv1PlG?=
 =?us-ascii?Q?pTCheoLbkJbR9FM1eQ92Hd4BmV7ifSpxGAqLHYmV/Qg1Pt3mk9eX6RXL4CYC?=
 =?us-ascii?Q?TS+szcdYMWjbs56AjIDGOT4L5afZnvwM0Ni1MKpv9NXdkYGqar36F3CVVmo0?=
 =?us-ascii?Q?EmIilsFeDlIgIrpX19whFdIlPxnZWyjr87GcIsTXVAmpEvheOHHzax1KrUiG?=
 =?us-ascii?Q?UWUSGWfHJyjGmZ8cmaEwzD5e3Xev02Fqa+mQoPraWxV4m92UmUv2aIcaeWkH?=
 =?us-ascii?Q?lI29eqpoxdrTWEx1Wl2iuNZeNuD7dcpTxKL2XxhYxqGuWFN5Lo1KR3wT0PDm?=
 =?us-ascii?Q?rSEJcMK+njShHWJN6ZLB9gGgLEKjPis7i1Ey6/snxB54XQltmFupw5HjWkVu?=
 =?us-ascii?Q?BSS+6rPDsbLLoR2w0D7hg2D/OvCtKE13bwkAq2o5h7FCJYxR0X1iBQ077jGm?=
 =?us-ascii?Q?8RlI9+eW593cWQnz1KVI/0Qpfaw16tCBbjmgzjv5WXRbinasQB29m14wsW76?=
 =?us-ascii?Q?vyRnLOcB4syQbZd6krz1mdgXuDLehWdzKd9Gi3K4Wu34KmwTxhwFauTwjBNR?=
 =?us-ascii?Q?jX+NRcJvKyj4MkPx+lJNFkkqGDTt9XVf0y2i2XKetEV1sNM2h/WMv3bQEeug?=
 =?us-ascii?Q?2R1K9qJPXZ1gjKigLzK5ed7UIMV2w+jhynp87T4Ncx6LZJOIYNYMC/uMLE+3?=
 =?us-ascii?Q?7rpzgNMlrQsOXR4dWpAvLiCyM1ohCDq9tDXMeXWKnZ8rmoCGtH/WA7DQWcrI?=
 =?us-ascii?Q?isa6LYX3JL/72iLkAwm/c5pCRZPlxipNS8CWDmVkXdPNy30HxugfwPLLA4cB?=
 =?us-ascii?Q?04Ux6grDUmMczgEg/l1budF6tKTJAR7ZeFebB9Ft8VQXH6Ng64uN1wtqtaPT?=
 =?us-ascii?Q?jJzHQ0zwH7MDoDRBdjiBEEFcyn8vwo3CBTIKeTrAEMNRvXxrG1pPalmFWH6w?=
 =?us-ascii?Q?t4GFKSiIjrrZWmJ7svfHbXYWTXdEtBqpvpHAbKDdHGH3gABY4JZdVa4/vn+w?=
 =?us-ascii?Q?v8zO7ffbTwpXKaPa3KJLtXPgLEbYoUFawAQn1/Z29x0AMCZHV6C6NRzdVqC9?=
 =?us-ascii?Q?B2S5mRgbTOuMRWsT7JMoAyZVX9lR+L+0emHJE8zA5XsSd3fEvfYoXb8nAOZG?=
 =?us-ascii?Q?ccNHo9hbujgQ40zHbNfiYHCoHPAFn8spCRydALAwAjYo1qxQtUHM5WEK8t8G?=
 =?us-ascii?Q?PTa0bPL1Z/eE7imbYL0R+/OaP6w4YZ5FWElICXUSi0WROAn65lAryjrW/hB5?=
 =?us-ascii?Q?H9/a+ZWY5jJ/Gt0s/fcqH3/ZcrYWsBvmzeZYSCtMg2hK9gAk/C2DKzve6jSN?=
 =?us-ascii?Q?wuVbBaSDBvv3enz9TX3KNKkVwI6ETBgUgRv8PPUrdx4JazZiv3IrESLIHzFv?=
 =?us-ascii?Q?w04zKI5Koq/jZCG6Q5j56A4IxvOVKem6SYJdeMzVTVUyQQrKb6xfwXIe8og9?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6b5143-a1a3-4f21-0294-08db4a55d789
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 15:07:55.4896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuDCYdbcCHJlPck6mnjUg4juTzBiIbwRoINcAxxoCUi6nCPKcicPRe/PGr5jkp/+SS1CRIBB9GB1nAKH2ciqXWyexkhQlIPA0pMQ+uGKTGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5359
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe: Use media base for GMD_ID access
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

On Sun, Apr 30, 2023 at 07:47:38PM +0200, Michal Wajdeczko wrote:
>
>
>On 29.04.2023 08:23, Lucas De Marchi wrote:
>> Instead of adding a hardcoded base, define GMD_ID() with a base
>> argument and use it in all places.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 +++-
>>  drivers/gpu/drm/xe/xe_pci.c          | 9 +++++----
>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 4d87f1fe010d..da7b6d2c7e01 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -8,6 +8,8 @@
>>
>>  #include "regs/xe_reg_defs.h"
>>
>> +#define MTL_MEDIA_GT_BASE			0x380000
>
>maybe for completeness (and to avoid using anonymous 0 offset in other
>places) we should define also:
>
>#define GRAPHICS_GT_BASE			0x0

there are very vew places in the driver that would care about the base.
Today the base is automatically applied for anything using xe_mmio_,
just like we have it automatically applied in intel_uncore for i915.
So, we really don't want to change each register to receive base as
param.

>
>> +
>>  /* RPM unit config (Gen8+) */
>>  #define RPM_CONFIG0					XE_REG(0xd00)
>>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
>> @@ -21,7 +23,7 @@
>>  #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		XE_REG(0xd70 + (n) * 4)
>>  #define FORCEWAKE_ACK_RENDER			XE_REG(0xd84)
>>
>> -#define GMD_ID					XE_REG(0xd8c)
>> +#define GMD_ID(base)				XE_REG((base) + 0xd8c)
>
>this register is not the only one that's has it's counterpart at this
>0x38000 MEDIA offset, and other registers we are treating in automatic
>way, without the need to explicitly pass the 'base', so I'm not sure we
>should change that here

becaues in the other cases the base is applied by xe_mmio

>
>>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>>  #define   GMD_ID_STEP				REG_GENMASK(5, 0)
>
>btw, is there a plan to s/REG_GENMASK/XE_REG_GENMASK or something ?

no. My plan is to eventually submit a patch to have
GENMASK_U32 and use it throughout the driver

>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 35dcb8781f2a..8687e51cb0a4 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -276,7 +276,7 @@ static const struct xe_gt_desc xelpmp_gts[] = {
>>  		.type = XE_GT_TYPE_MEDIA,
>>  		.vram_id = 0,
>>  		.mmio_adj_limit = 0x40000,
>> -		.mmio_adj_offset = 0x380000,
>> +		.mmio_adj_offset = MTL_MEDIA_GT_BASE,
>>  	},
>>  };
>>
>> @@ -391,8 +391,9 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>>  	return NULL;
>>  }
>>
>> -static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
>> +static u32 peek_gmdid(struct xe_device *xe, struct xe_reg gmdid_reg)
>
>better to keep u32 but defined as new 'base' for the GMD_ID:
>
>peek_gmdid(xe, GRAPHICS_GT_BASE)
>peek_gmdid(xe, MTL_MEDIA_GT_BASE)
>
>then since we parse the value according to the GMDID definition we will
>prevent passing wrong register offset and always refer to the right
>GMD_ID address inside the function:
>
>static u32 peek_gmdid(struct xe_device *xe, u32 base)
>{
>	xe_reg gmdid = XE_REG(GMD_ID.addr + base);

we try to minimize those calculations outside the header.
I don't see a benefit of passing the base here over passing the register
to be used.

Lucas De Marchi

>...
>	WARN_ON(base != GRAPHICS_GT_BASE && base != MTL_MEDIA_GT_BASE);
>...
>  	map = pci_iomap_range(pdev, 0, gmdid.addr, sizeof(u32));
>...
>	REG_FIELD_GET(GMD_ID_ARCH_MASK, value)
>
>
>Michal
>
>>  {
>> +	u32 gmdid_offset = gmdid_reg.reg;
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>>  	u32 ver;
>> @@ -441,7 +442,7 @@ static void handle_gmdid(struct xe_device *xe,
>>  {
>>  	u32 ver;
>>
>> -	ver = peek_gmdid(xe, GMD_ID.reg);
>> +	ver = peek_gmdid(xe, GMD_ID(0));
>>  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>>  		if (ver == graphics_ip_map[i].ver) {
>>  			xe->info.graphics_verx100 = ver;
>> @@ -456,7 +457,7 @@ static void handle_gmdid(struct xe_device *xe,
>>  			ver / 100, ver % 100);
>>  	}
>>
>> -	ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
>> +	ver = peek_gmdid(xe, GMD_ID(MTL_MEDIA_GT_BASE));
>>  	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
>>  		if (ver == media_ip_map[i].ver) {
>>  			xe->info.media_verx100 = ver;
