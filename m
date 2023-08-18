Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0A9C7113E
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 12:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA3A10E05E;
	Fri, 18 Aug 2023 12:40:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FDC10E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692362443; x=1723898443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jTElNzv8jKTbhRip7gbeAzNQtmeP1EA/WDCAHEJkQfo=;
 b=GizwMfzxrMrRJ4sTCIi/a51vQFZeXe5brhXKJupd40aBmWT5CxywseEY
 rsKBgASfalPAk3inHWTQLOsAXSdw2hhqETF90/nCV9CkcbfD7QzD8vVYF
 a5mXqWSP2aGc7DjxHkI48nJZwMMddHmTthuOAeSznBkMdN747D+pfIr0P
 wW3sid3LAS5BE1XkXnWlho0bT2pEqfTJv8fT8rRvq1bqZUi10Dd3Q06cn
 6fm0eun6DSQG8Im2HyHhRh6JD3nnweClKVZxI/9PGNFNsdeFsCe8el7YD
 f5F34AgfXeTqdiSk7Xn5A25Tyk/9n3V/DnA9Rl16Y64QziGVnDOo1Wu8I Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353394378"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="353394378"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 05:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770126231"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="770126231"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 05:40:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 05:40:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 05:40:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 05:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5IEuWwtOM1B4iu7SpRqz875qg4eObNs5TAsC3WDb0BZ+S4ZIL/64+anUiSqnQhsX+biMPjPSAt60aiQC8OFBQnMJy8f9njzGJ0EhqzeX5eGY+p0Olz27ZdiPP9ZR9mv4ks1ZDFnrikceRB6wLO0wGWkzfFyhywCVqP+ZXw8Z4zh3pd5dcfVlvSl3SZqQR3EDAc0sBlAg7Am6GA7KABYlXNzCE+BqfuRS+K3z5g1Cj5aEEmvTjzFJulakYp9RxYLZEkbbXte/Y3Ek10aZ5i8zoLrGHjwHN7RjF7xsXTfp0OcfYVSnmT/Y5cN7QFbqxjp0D/KcBwpeZP/0MZ5rXlv5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYdribZsAInKUBYcjuF5S5SZuYgn5r9IFQI1Luft7oQ=;
 b=W3097qynwZMFH6Xn6eOz8H3P6lIkWo7IAzsV+pUO5PmEYrrCagvH9AOEn/rDHiLRCwnSf29f0t8iijiXDfODNFuwjLU+ScN/31TxTsfbD/1Z7kMVwa2RbpTv5z7cEOAoqa3OSY/v1UPJoW4jBwA3eUNAXUOubhBeokTY/3oigmoln3O/8jTIJTdNd942yq1P816bvnPfSIEciGcC+RYhinuRDxNS8LcZsM7Rabm0bqm93oeCtqMhYMI6o6jLtvgg+9KKfmQ8Z6rgOAwdxg8FNCvrNZP5Y+UN/HynoduRm5zO/ki+M2Erj2b99NG5lCrJoITbMJRxs2U09WHSCyWbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 by PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 12:40:40 +0000
Received: from SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a]) by SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::9716:fa94:b58a:9a6a%6]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 12:40:39 +0000
Date: Fri, 18 Aug 2023 05:40:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZN9mxPC9/c4qLEXB@nvishwa1-DESK>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-3-niranjana.vishwanathapura@intel.com>
 <20230817162217.GC3375865@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230817162217.GC3375865@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::31) To SN7PR11MB6945.namprd11.prod.outlook.com
 (2603:10b6:806:2a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6945:EE_|PH7PR11MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3b1bd8-64e9-4b53-6d52-08db9fe85428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYmlhbNuDMGLCQigdhRZGh/AZ2SYEvSRRtRnSZm60J5G+PeRdV0bGvIp1n22MymeZ9vag5W9ajRtX9ZjSnRzNSw+4WygPiLYbDNFTwAs4QQ5AnFs6+oqz3LzRM8Sel10ftlgjkdSmqxPsryd8sPuNLK64O8vSbVMIcklAAQQXKtvDnbbQZoOHxJxvePojf+JOKWVQG6MdOwUJArVFRPFKPavMq1E2IkdgDZQwqnTnn05N3rjTpuL5qAcXDpmjcxHvzOVuEbTxBqBcVz1MrDB+AtIfYRJfO776VZJE3tAkYrEhPE9bvXkDTvDlkPcyBEoXES3Km1pnljJKx2sIqIJ8WNJUcVHwL0xhhONhxQHbOh1jtbhDJPwpaqBB2c+KjAeC1wNK7oH+9cV3sKwkmPQ3t/owwmIpvoZA98VLITlJFNGeKxZzGywHg/nDZG1Uh2TX32geum6bvdd056ViXYNdvqmstlpUEtBxW+mXDflDKUsYDN41iqWXFvpLYlHVlfuAVS1dhR8tefcQ6X+Tfk0fG4njsSBmGJ+QILyhjquSLV9bmMZM7MsP3Y+0f/kUkQ4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6945.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(39860400002)(366004)(376002)(396003)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(38100700002)(9686003)(6512007)(82960400001)(86362001)(107886003)(26005)(83380400001)(33716001)(2906002)(66946007)(66476007)(66556008)(316002)(6636002)(41300700001)(44832011)(5660300002)(8676002)(6862004)(4326008)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xhFBTLp9Crxspt6PonUStEMQNiFL7CP3hw9Y5htZs3KIC7g4ClScGbnYIFK1?=
 =?us-ascii?Q?7hpeyw5Licbh4WAtTaRkulTC3AObP3lvByrX3n/YsFfqU2WLPXyUz84XhVg7?=
 =?us-ascii?Q?+MtwaQocF3JyEuB38iw2J5iXoymEiNBBAmaFpQB5M45KOBogFx+sCE0hzwaV?=
 =?us-ascii?Q?lt85x0AZSkzB1ir8GroRRu+j9K0hCabh+6+mYSkzvwys0XbJMWPhzmzRwpwp?=
 =?us-ascii?Q?JirsABY+Y39wnCEelwBfCa2zEZLV4KKYVzjOXl2s9ASUKECB0uHnyL9/utOT?=
 =?us-ascii?Q?enL2H6ZVfNsbACRqs4iR7yoQRvFBsPk/gklaiGRlahp40frErLeIY2PWA1p+?=
 =?us-ascii?Q?qcouzU5F14zr9mkZ+iLKq1Sf8BJq4ej/lUbO17BPSJCcSde2Fee+1XlJ7Xo3?=
 =?us-ascii?Q?1qpUyOyvSYhNSzUUTEpteSLYFwVrp34rlDMjxwrjwU6eFgEkMdaZQDRQGt+g?=
 =?us-ascii?Q?z49JxeeYJM27+Bm2QErNxxAMBzSrlrnojM2q1aUEV97n7rtOaWXhHgIgCNog?=
 =?us-ascii?Q?WUGkVAZsIhZnE3g5hkraAUJLu2cDHeg/Y6uA2SdlRF23XLXnY/MrfXzCJQva?=
 =?us-ascii?Q?NTcWysf6ZUl4GIJLEgtfFnnPJkdf1vZp57cCSyPzMNQbeZe0D0Ez4BESGoA8?=
 =?us-ascii?Q?J+Bk16a41mHcWydOxyY477GaXseg0rlqIUjr0/3Ub6jKwi6BB74ck3uhTuGD?=
 =?us-ascii?Q?uXSqzXTQxntGYoW7OYZ1fnAm1baQFMH8lu2iZg05hvLK4SxK/4z4kzHLBckG?=
 =?us-ascii?Q?ypfq7Vz4I1V0Ji+1yvyVSv2ZGc4BeYMy7t1LNmC3+Rg7cX2NU+V9TLMO19Su?=
 =?us-ascii?Q?MSfIPuKFWuioO+8IvoOSHJU+WEFd2YIUMTzU4o5+IXHFgmQifk+uQIS3B9m1?=
 =?us-ascii?Q?vyXMTFzLe5TXfnrYDXTtlUDZtqMmWIjpcu2rM1IFAsAgbtZzpzcsr8o51t/b?=
 =?us-ascii?Q?ypaIJHG5Kx5U/OHI4mtYuSF6hZ6WTok8hNawULKeys0KfJRpPzoGqNDk1UAD?=
 =?us-ascii?Q?iQ13FodjeyJS01lnO6H8OZ2OIIC35mIcN4SM8e7R36+x8Kvpl6baYxGprFSY?=
 =?us-ascii?Q?gt2IyzjRRTRdlKKImDmGxxNYcgyBtPNUF6j6hvwU93fucbR8xwt/TXh/wBRm?=
 =?us-ascii?Q?DbNWrbGt9Erm66vnvyiO/yambVOIFjo/wEIgYXZvmnjz0k8MxsHdpwTikoFC?=
 =?us-ascii?Q?Ff9RIzZ8O/8d3o9noc2GVdmsyO7l6wuOMVlKFmZjXA1VGaJrO2TmoGq8jxmT?=
 =?us-ascii?Q?UHygGBaYRxsal8+ImUjeeyQpDgzNOqzoGKstTu/8/aypf4eTMcsVxn9F6s2F?=
 =?us-ascii?Q?ZwbXQySHbEoqmrDEtLg741VQVKMxtlkJdLR7IEBUUjQEySV4wkK67dKOPwYV?=
 =?us-ascii?Q?bSuAVA9PPa4WtzLFMtDji6WDYOCRDt3aYw3EUQSln1I96D0WV9FHw/FCvAms?=
 =?us-ascii?Q?4NHH5qFKG1k8+WhKvB/y8Gd6NOFwSq6fn9eV6V/lPCPVO7NsKrdn+RUKQLUz?=
 =?us-ascii?Q?bt3bnURfBFwF2ReXt5razPxikvPXOQ01sgQaZCgufuh2psv9NHtkFBA4fWDw?=
 =?us-ascii?Q?QRjbbTXbFlpHKEL3hkNdReVqsVBQS5roFLWQHQ3N4yFvQITCVep7ACEwA7mf?=
 =?us-ascii?Q?uOnjCJKATiXdgnpEhViMgo0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3b1bd8-64e9-4b53-6d52-08db9fe85428
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6945.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:40:39.7937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SNtqmc4GwYu0MJta6wo0lEDRZdDuql7VStehHQH2+5mS+nEwCTtiWZOgS+meINyMEfXVaHUccZ8xMBSp0msdzyR1ac3slHvMbVTgKGR0SWK8Ly1uGAzy0vSTAJBSaWt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/3] drm/xe/pvc: Force even num engines to
 use 64B
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

On Thu, Aug 17, 2023 at 09:22:17AM -0700, Matt Roper wrote:
>On Thu, Aug 17, 2023 at 04:03:51AM -0700, Niranjana Vishwanathapura wrote:
>> Wa_16017236439 requires that we update BCS_SWCTRL
>> (via indirect context batch buffer) to set 64B
>> transfers when running on an even-numbered BCS
>> engine and 256B on an odd-numbered BCS engine.
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>>  drivers/gpu/drm/xe/xe_wa.c               | 7 +++++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 79873bf64e8d..8e488cbe332b 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -59,6 +59,9 @@
>>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>>
>> +#define BCS_ENGINE_SWCTL(base)                 XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
>> +#define BCS_ENGINE_SWCTL_DISABLE_256B          REG_BIT(2)
>> +
>>  /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
>>  #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
>>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index e2b6e17d7ec4..e7b8cbbaf002 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -515,6 +515,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  		       GRAPHICS_STEP(B0, C0)),
>>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>>  	},
>> +	{ XE_RTP_NAME("16017236439"),
>> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
>> +		       FUNC(xe_rtp_match_even_instance)),
>> +	  XE_RTP_ACTIONS(SET(BCS_ENGINE_SWCTL(0),
>
>According to bspec 53978, this register is part of the BCS engine's
>context (when searching the page, they spell it as "SWCTRL" rather than
>"SWCTL").  That means we should add this change to lrc_was[] instead of
>engine_was[].
>

Got it. Will move it to lrc_was[].

Niranjana

>
>Matt
>
>> +			     BCS_ENGINE_SWCTL_DISABLE_256B,
>> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
>> +	},
>>
>>  	/* Xe_LPG */
>>  	{ XE_RTP_NAME("14017856879"),
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
