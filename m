Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374CDEE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 14:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D5510E089;
	Mon, 21 Aug 2023 14:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72D510E089
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692628534; x=1724164534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vDkkfxSA9wkjw0R+5dsOpjgxpvfhEvQ7DRRVLF0UORE=;
 b=ZVGebjMzjvEwAxGvbNx/aU8D9ZUI7B4MK2BVTKAPvPSpCPjtYsNMjria
 kSBhUcorZN5V/URLvR0QDNhaU3NIlfVgxE8OAL71rWKNAWGB9rWw5tS0X
 E1ye000B9kf7AFnA01akDl/D7lWQQqPM6F52vqtofNRSGpynsiSUUPv+G
 UGFC+Lmv8HWxQ99AJCEja/8Bf2dA6DQfytlLJEtqsD8E1wCZxpHMsRgF3
 2rKNfXm9l99M9pllSmYCIOc8cPVu3972MWeCpZ2ZzmQ5itBNpNBG0AJF4
 lwGx6vhc3XgavU+TO74A0Gtf919uKVKEonExfuQ35UHHGwbqpDjxCf0jt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372505766"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="372505766"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 07:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066621029"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="1066621029"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2023 07:32:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 07:32:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 07:32:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 07:32:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aly1GblgXSZD/e6x5NnanSY20Qs8e+6m/tG1YAnZSUaEaAvd9NJEY9InAjpkFW3n8seYqVlhMr0qC+lnC0anJ9NhzCXHeauDw6PI+nUpEFUbdaZ7smv/s4ogoVs4L6Lj4dbLxrrGqxe2JW4YLJpVc5ZKtT2362cOtn7ScolzGjEP5gd10pErQRmHCRPtBZ6NepEKkCUKFUI0Kw/uHPFOA4/Xx+M4oQng8gBxHMEm+9K17/kz56gh9NR5A9qZN2gO0lNeTS35J6V9C8t7TjAQkr/dejroW/ZVD1i3/jSCNbpl4rxNR4VRgipESCiNEZLxqiOUjPHPnji0ShyTntYToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mV6atRsDaeOVKTyNpkYnF9ayhlTQhKRDdN1qq9deaiQ=;
 b=LEpYI1jSsNjlbt7dgRYhm49M2Pz1R4DxC21fDtjwou5QYuABB2vcb5JAUzfMbQDaWLAgzMuJuSTjctAxADiBUEJa7PhtMx5UnW/cIBBTT7J1vaWMCo2FAjqBg6B0+35gTOZDy5iPklimMPBTgXMaHDAuwHw9LWtLnuqrIzTAVFc01lutbYFpKzcNKlA6WLQqgX5KWbCyBxorIO++YmcFzTeY+tIuj5fbLISG+jIS0XmXUSbO0QN03AeXFzJl8Ybt+joDA3cs+8dH22y+anbLZIFOMyV32vp6sGoXLnOxYJLlnHHryKS8/bMT+WRoPwuYtzjER0We0qTUsNEIercAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CY5PR11MB6438.namprd11.prod.outlook.com (2603:10b6:930:35::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:32:37 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:32:37 +0000
Date: Mon, 21 Aug 2023 20:02:27 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZON1ew4Z2aRBG0oG@bvivekan-mobl>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230818220824.700519-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN2PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::11) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CY5PR11MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a28580-4641-48fa-cbc8-08dba2537727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZ/RORqRZZ3/2hci7H7of5kWgqhuYM6Sefo5vvOv20d4tE86ZgmUd2enCYk84Qc9wB0RyySs5Rk93qNqqpDv6LXFIfmyuTjLJrBQrYR09p5UIs5wMKE+GEdOq0VQ10jgzrkYxihisHCtPkAbt1x8OewcvBQuPQQtdUM6aIL/7SZ/cX6ZhVTBBAVuGiXUB2hJVgsAvdQ4lcI6CmUQ8/eJIF3ZINVtsZL06UEoSuI5lqMbnHUxBzUEbYKOp47IGG56jIdVbRQsfXkFpEsDWAjUIoqnUFa5cedzbNVzer038nj6mOfw1OeHvt0bzQ2JA0DC+Fq8rdgI45lCWOCufllMr+FAZas1OdTfpZjo7sTvchYGYoxCUYyD1RNTfW9wSsxFHU9i/Mup88MTFdPYAp4fkGBnfBFlvjzIyInBsIzGtAGtsGqIam1eKftgCGd2h4KhyeC0IO/QgccgWppny2t/25ThRZVXtg5Fn2SfdiC71BAl4QNblkm0XrFlOHLclYNxZJ0wyGCKeptUiuKZlCD5nKoR3nfNwOS1p+APTztGvzGujcWwTYFpGALDmc9xBU3e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(8676002)(8936002)(107886003)(4326008)(316002)(9686003)(66946007)(6512007)(66556008)(66476007)(82960400001)(478600001)(6666004)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUFKeE9kYzZubmEyS3lPRUxCWVZvTm9MMUlxZERjZk1PYk9heU96SWFZRmVH?=
 =?utf-8?B?MVZ6ODVMRUJjNnpyZnBVSkNDQzN0R0tPcVhYK0tzVGV3MGJ3aFpKdEQzUmlw?=
 =?utf-8?B?cEIwSnU4ZEVUY0E0dTJxdk92RHpvVUd2dGFTNzdiVkpMMzVqZTYvUlp2SVlm?=
 =?utf-8?B?K3BRQlFQQW9SNGViSGtHQlM4OFgybnZVejJyanFvdkxBUSs1OWx1WjNtUjlH?=
 =?utf-8?B?V1RpdXNpMjlKNE5MeDBXYnM2bzhFR2ROWGZOK2VCeW5PVVBIenhKUHI5ZGFY?=
 =?utf-8?B?ZVdMeWdRWVI0Yk9xWEx4Y0MxNlVKc0JlL0xsejMyQ1M3Y201ZTRUZHNOekls?=
 =?utf-8?B?eFJBU214ejdZWFhoVUxmZVhDclkxZ25rWkpHbDhncTl1UkI4UUp4MU13bU9r?=
 =?utf-8?B?UlFXZndwQTZOcndHR3FPVHR0a01qeGlqakd2NXl4bGc0cUZVNTNjZitPNEJj?=
 =?utf-8?B?SHM5QytCRkg2ajNJREhWNnppY1R5MnlleWFOYXc5d1ZLWDUwejhQMTUwKzh1?=
 =?utf-8?B?Z0lEcCtYLzNMSGlvQXZldVZVb05YajVVOWl0UUxXbGY5MXVmNklIZVhaUlpQ?=
 =?utf-8?B?V0JJa2V3eVhIOG04YjFYMnA1ckN0NW9YRnV6RVFGZTRIUXlNcWdqWTV3U1V4?=
 =?utf-8?B?NTNtNUtzRGpLZUJQeGp2ZzcyZzc0dDlIVzhwUjFmdHJpZDVzbTFiWnVyWWhT?=
 =?utf-8?B?U3hNemg0eFppS2Y5aElGMloxa1FwNkhxbU12RmZ5TFk1ZkpMd25relI4NkVX?=
 =?utf-8?B?Y3d2U3lMd3R2YUNTaUdaY3duUnBpVmltV1VlQVhPeEZ3NE1KRkpDYW4rL0Z3?=
 =?utf-8?B?UExMMnZVSHJaa0pIb2tMRVBKZStpQlp1dEZFcjFmZGk0dTNSRjZPWmZnKzU0?=
 =?utf-8?B?R0hWMlUyV2F2YWU1T21qRkcrL3RiMjNrMVU2RVc2dEhGNTBvQ1cyRGZhbkZB?=
 =?utf-8?B?ZzY4bzB0Z2VGeTFOZFUweENTM291MjhkQlhSQmFCU2ZQdzE1Mi9TejVmYWZn?=
 =?utf-8?B?RXNJbk9Vc01lUSs4bVh3RFFrQzJicjhGdkk5QkNPWm91MDkyTzY0RGptb2R1?=
 =?utf-8?B?dEF6R3d1RGR4Njk5VCtSdTJFSktVYVF3OUtJOGpBSDVFdHFYTU40c3JOMU9p?=
 =?utf-8?B?UVNxalJuRjh4eUZUS0RDSUZycHRrODRKMExtdlZaK1ZWV203eDcvcW1yZW9U?=
 =?utf-8?B?eGlXdDNxMXBiNXUwNWlXU1JmQ3dWcUYvVXozRWFvMCtoaXlwaVlJTklaZSs0?=
 =?utf-8?B?VHRORWt5WTFxYW85ZndYN2h4NHBFdUxrRUlSM1RWZWlEYktjeDlxMzQ1WlBy?=
 =?utf-8?B?WHBHMXJSN1RSRUxINThyR001aGhmVFRXOFdqUmhSUmVaUlJzQjZxTjhBZXNp?=
 =?utf-8?B?dGtwV3lTaCt4bXJENUJrcWIzZnJvZW1SeUxBc1V2K1BOOXl0L3pxSG9UNDlZ?=
 =?utf-8?B?cm9qUzJYTEEvNGExb0phQldsVkZqbTRtREZKTkZqZ3lCN3ZMNGRNZFhQVEhR?=
 =?utf-8?B?ZXNUb1JBenV5TFE0ZGs4Mm9nS3F3Z2Q0SXhValQ5aC91NHpSd016Z2o0UHZn?=
 =?utf-8?B?Y3lvVnl4d01ZeFdHc0YrSHdDM09zTzZrbVdLc3B2WHpMZ09rWVF1KzgzRVJa?=
 =?utf-8?B?dHFLc2pQWmJVQVpGTTVMcUd1S0ZoMUxoVk5SREF0UkVpVWFndU9mUkgwVDFn?=
 =?utf-8?B?T1BnN01sMnBla05peU9BV3IzNGNrVzk2a29hclVrMVd0b1ppT1Vtc3VzN2Ev?=
 =?utf-8?B?QlJZZVg3dmZGSU9nY3BlZ3h4dy9oaUd4Tlg3dEpqRW9pdGNMTGtKRUNnYjhG?=
 =?utf-8?B?Q0Q4S3F3bzZ2WFF2YWRzdWo4KzhVMG5SR0ZIbVBiVEtmUG9uN2taQ01BejQv?=
 =?utf-8?B?Qi85bE02SEJ6WlYrMTZXeVNzU1FadE1hOG9UdTR6VUFqMUxDNlQ4RFhpUlVn?=
 =?utf-8?B?UUVCZnVDRHFFb0NuVVNJOGtqNFJWRnlkQ1dZN0FRUzBYT2t2Tlo4SzdwTFZv?=
 =?utf-8?B?cEFHbXNvYXBrY05xcGxuWkh2YnJRa1RQcVhpOURCTXp2ME90TWhldDZtakt4?=
 =?utf-8?B?ZDVCa1NnVlNZNERrMlkzSDF3TElNRUFSdzg3Y1JsUDJXU2R6Q0o5SlBLeUF0?=
 =?utf-8?B?RXpVUDRibFh5UVpheEowbml6Q0VlV3dKK2FDRE9ZcmVJWXlLMFp1cVB4UzFw?=
 =?utf-8?Q?1nyyv+ppiAfz05QZ++ZBqLU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a28580-4641-48fa-cbc8-08dba2537727
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:32:37.2183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5ZGn9YiMVQyd/efug0T8ACj/c4uVymT6GLygh12Xoa+abbaVkvyRVbEaXi6BQ/mvKmPndmw2zaoF6u/VUWlz52cv8fD0jy6X9jStt8PBm0CybDlNUWQd6lbRJFWQQaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6438
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/15] drm/xe/xe2: Add MCR register
 steering for primary GT
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 18.08.2023 15:08, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe2 uses the same steering control register and steering semaphore
> register as MTL.  As with recent platforms, group/instance 0,0 is
> sufficient to target a non-terminated instance for most classes of MCR
> registers; the only types of ranges that need to consider platform
> fusing to find a non-terminated instance are SLICE/DSS ranges and a new
> SQIDI_PSMI type of range.
> 
> Note that the range of valid bits in XE2_NODE_ENABLE_MASK may be reduced
> for some Xe2 SKUs.  However the lowest bits are always valid and only
> the lowest instance is obtained via __ffs(), so there's no need to
> complicate the masking with extra platform/subplatform checks.
> 
> Also note that Wa_14017387313 suggests skipping MCR lock acquisition
> around GAM and GAMWKR registers to prevent MCR register accesses in an
> interrupt handler from deadlocking when the steering semaphore is
> already held outside the interrupt context.  At this time Xe never
> issues MCR accesses from within an interrupt handler so the workaround
> is not currently needed.
> 
> v2:
>   - [0x008700-0x0087FF] range to extend up to 0x887F (Matt Attwood)
>   - [0x00EF00-0x00F4FF] -> [0x00F000, 0xFFFF] to follow latest
>     bspec version (Bala)
> 
> Bspec: 71185
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_mcr.c       | 50 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_types.h     |  1 +
>  3 files changed, 51 insertions(+), 1 deletion(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 55367dcca603..366818127317 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -143,6 +143,7 @@
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
> +#define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>  #define   L3BANK_PAIR_COUNT			4
>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 9eb7a6a1348d..26f69e52b120 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -181,6 +181,39 @@ static const struct xe_mmio_range dg2_implicit_steering_table[] = {
>  	{},
>  };
>  
> +static const struct xe_mmio_range xe2lpg_dss_steering_table[] = {
> +	{ 0x005200, 0x0052FF },         /* SLICE */
> +	{ 0x005500, 0x007FFF },         /* SLICE */
> +	{ 0x008140, 0x00815F },         /* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
> +	{ 0x0094D0, 0x00955F },         /* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
> +	{ 0x009680, 0x0096FF },         /* DSS */
> +	{ 0x00D800, 0x00D87F },         /* SLICE */
> +	{ 0x00DC00, 0x00DCFF },         /* SLICE */
> +	{ 0x00DE80, 0x00E8FF },         /* DSS (0xE000-0xE0FF reserved) */
> +	{ 0x00E980, 0x00E9FF },         /* SLICE */
> +	{ 0x013000, 0x0133FF },         /* DSS (0x13000-0x131FF), SLICE (0x13200-0x133FF) */
> +	{},
> +};
> +
> +static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
> +	{ 0x000B00, 0x000BFF },
> +	{ 0x001000, 0x001FFF },
> +	{},
> +};
> +
> +static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
> +	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
> +	{ 0x008700, 0x00887F },         /* SQIDI, MEMPIPE */
> +	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
> +	{ 0x00C800, 0x00CFFF },         /* GAM */
> +	{ 0x00D880, 0x00D8FF },         /* NODE */
> +	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
> +	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
> +	{ 0x00F000, 0x00FFFF },         /* GAM, GAMWKR */
> +	{ 0x013400, 0x0135FF },         /* MEMPIPE */
> +	{},
> +};
> +
>  static void init_steering_l3bank(struct xe_gt *gt)
>  {
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> @@ -265,6 +298,16 @@ static void init_steering_oaddrm(struct xe_gt *gt)
>  	gt->steering[DSS].instance_target = 0;		/* unused */
>  }
>  
> +static void init_steering_sqidi_psmi(struct xe_gt *gt)
> +{
> +	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> +				 xe_mmio_read32(gt, MIRROR_FUSE3));
> +	u32 select = __ffs(mask);
> +
> +	gt->steering[SQIDI_PSMI].group_target = select >> 1;
> +	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
> +}
> +
>  static void init_steering_inst0(struct xe_gt *gt)
>  {
>  	gt->steering[DSS].group_target = 0;		/* unused */
> @@ -280,6 +323,7 @@ static const struct {
>  	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
>  	[DSS] =		{ "DSS",	init_steering_dss },
>  	[OADDRM] =	{ "OADDRM",	init_steering_oaddrm },
> +	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
>  	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
>  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
>  };
> @@ -298,7 +342,11 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  
>  		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
>  	} else {
> -		if (GRAPHICS_VERx100(xe) >= 1270) {
> +		if (GRAPHICS_VER(xe) >= 20) {
> +			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
> +			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
> +			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
> +		} else if (GRAPHICS_VERx100(xe) >= 1270) {
>  			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
>  			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
>  			gt->steering[DSS].ranges = xelpg_dss_steering_table;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 48fd698ff62a..d4310be3e1e7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -55,6 +55,7 @@ enum xe_steering_type {
>  	LNCF,
>  	DSS,
>  	OADDRM,
> +	SQIDI_PSMI,
>  
>  	/*
>  	 * On some platforms there are multiple types of MCR registers that
> -- 
> 2.40.1
> 
