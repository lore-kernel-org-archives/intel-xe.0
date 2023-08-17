Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4916BC2FC0F
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 18:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CE810E544;
	Thu, 17 Aug 2023 18:06:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FA310E544
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692295564; x=1723831564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=55uKnWCcyGxreOwHy2skihG/09T+kjFn8IQ4FpTm9kc=;
 b=HgDf3+KUXnLUZnICLPDhI9ln42e0dO6E44ER9VlCx81GEL5nH/aMDN4p
 3pXms3aV4ejNEmUG5dR0BLkrc0Ze4SEEmK/b2shpl/JG68ySiw2LMlMiy
 cX6UGO6nIEtD2AT6xsHwiC6ep+oXlP2AppbK5H9SkNlgOwfpcWJ53saH+
 8G2fO2aiQA4AaX3fxKZJuZASBYwE709COudkt3rMUTWYWekpXALwx9yU6
 VB4ib8G8ILRYl+omDpU+g3oR4eIhE0SMgf12Qy4wNCVpL5Zh6X9Ht+I5q
 md2uI69jju/UhwrAeBBjwN1bUyzwAgX1JVDI6UGQa3HhwORJmibUBIcgq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403871392"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="403871392"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 11:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="1065379145"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="1065379145"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2023 11:05:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 11:05:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 11:05:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 11:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMiqaIZvUkGVNOnJgYeOkENnORuCeAhx4UadoUlaek/E2He69kokTJAHnK6eRjcnpyw9nvAfoH1ZpbJ1OINhlFLT66B1to+zSmckasPeYjjBQSL1CuS4V8ZPslRAqQR5FHRKe3HQ6BN5J0lRDle9E0MXfzUskrXU7rCyo2M6HUE4ttwwa1FTASDlfIw/LqaVsS77bszBVuvnMeVyb8yLcAKa42hHdp233W77ZhQ0dutiv5KM838LbRJyfAn2iqbX+gTQaxc0AuVDl+qekYHP2vmbvF55vTN7hherAjBl7TCMJXxLALigy7mZqCYOVd6t1C+YE7h73tfMUcudGyf1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Shv7C6j/ZcyWRVnR9tx4XQ0Op9DrsfpZ8DB/jDwaWJ0=;
 b=oLTcj7phL5JDJ0jrisn9xI3WQcn6wVGeMl83QtUd2Z4vIQV2BqDTrQhc8oo+Qj55ARJrIgzbzAh+ZsAItPQvc92a4M8vwlGvo97eDu/lbp2g7vk4lHfJZZ592ESHPLiNZw9rNR9vZc1ukVISbJgX+Sg8zl+wxndNGTZAxvGtYuwUAxxwXY+fQIvZ5oXa4GXE6a4MPdEG9Ut4+SbfNIjGWAI/mYknjSgPbHZNYrV5pO4Pe9vRWsMYMkrMGRm/Pz2p3FGq5J3ghUOyhoNkCtA31lqzWfKyo+dBXbf6d2I6KF8tUbCMxbjbrkHXwAcSVTyespcjH5fG7wmxVErxWdueag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 18:05:55 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc%4]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 18:05:54 +0000
Date: Thu, 17 Aug 2023 11:05:40 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZN5hdObYI2QPFqFe@msatwood-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: a909f887-f1b9-4eec-5d9b-08db9f4c996f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUGoPF4YmwDiFFKMWMDem50dfXfE23QN5/qPqm3tmCvMpj7UzLupGBkCyLbWQsVEthdyiAwDeb9FmcxbisCULvbGugeUYYdhjStSOtHRsN+FMjop3ZgTOknl06KdUpdEtnpCU3LX3H2e9V+WGrLlyTojinAxyjHW3UFVPDtgiGW5Keb8UXq7N2FTBSY/umdnNbp9cCuHWLsZNZvj4NoBhoUgAbav7OWlJrL7jaxAZWRp7/nATYC95KQ0z4/+wZJNjLY2vT8NLwqfQKcrrpdUPCfrGpzKEgkFnxa22uOPdabCe2wFMlO3nbRBpzYrY+P7BdTrVH0zwqY3SbAfzqTXNsXnrLuhtpH2RXKzhFozJ/8YybM5GaAVaHcVRpty0dEkcAMkvhDi/3Aitl91UnhCkdHE+clpImlTx9tDTQrIAJy/Lrwc+HnVPHdG2JQejHqAFYTyf32iegVM7lzVW7DaHb2RzSQdxxNkZQu6NlmddjB2qOwAAnzNUP7uVXchxZeeZmQ4kAn3K7fzG7crRc/zPN9bBC0Ys0UuK+UKBta/xI/g/fKJnCNmNpBOqOUwEPDV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199024)(186009)(1800799009)(33716001)(86362001)(83380400001)(8936002)(5660300002)(8676002)(4326008)(2906002)(41300700001)(26005)(6666004)(6506007)(107886003)(6512007)(6486002)(9686003)(478600001)(66476007)(82960400001)(316002)(38100700002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2YxN0YzaTl3MTJPaHBQVld0dHU0aXpNK1I5OFRnVWFQVkhaOVJWTThQMUcw?=
 =?utf-8?B?ckY3MmwyN2VGRWxBY29IdHdLOGdBaElVY2o1MktYMnM3OW11eC85M2IzanNS?=
 =?utf-8?B?THZwZ3p4enFIWVdkemduVEFKd0huM0haYmdPNHkzaE1qdWRrMFZaSERMQnBI?=
 =?utf-8?B?cWpaY25LZjEybVdrUC9lUzFSeXdYN1p0R1QwUEZOc1VOZ2xHUVpDODdaQjJl?=
 =?utf-8?B?Q3NPc3JNaFFpVXFYcHJJb1ZJMXZNL2xsNkVPMUpQTDZtMTdvWDR0UjlXaTBq?=
 =?utf-8?B?cCt6Mm5mNDZDTTVFRyt0WGZLdzB2WHFUMG9PdTFXMWlwT2ZrSXo0djNyNS9p?=
 =?utf-8?B?Z3FGbHQvUSttNDNDU0VDcjNVa1U1Q2lCSFdrRXR4KzR6YXVERzE4YzFuQmRx?=
 =?utf-8?B?ZHJDNTFvRWlPc0hkQUpEQjdPaVE4YmNEQ0QzZG9iVlBPSkg4Uzd0M0Z0Z0o2?=
 =?utf-8?B?K0dyb3pZOTdlV293N1hpY0FHUzZXTXdrd05LTDFmaVljT0hUL2dYMStjcjNG?=
 =?utf-8?B?TXZ4Qjd3bi9DMjZ6ekRGYVh0RDEwTXJVRS9WMTQ3SmpiNXdLc0h4QzRhNUQ2?=
 =?utf-8?B?aXdnVnptZUo5ZXkyL1ZqdDlGWFdQSFFVVmdtdWZ2eGtMaDNMMzkzeDlxWDdr?=
 =?utf-8?B?VG0xUERGbE5wSHBvZU5sSjlycDZsd0pNRGYrWVBUZmJpR25GU2dDTDFJTk95?=
 =?utf-8?B?V3piSWNRQy8xL3Y2UTZSZWxPSXFmMXArZ0RvRUdmMDVJdmJwNjNSOFFGNGZF?=
 =?utf-8?B?QzM0bitrUXY1UFZOQVNLbVZ6cDNocjZ4YkV0Q1RRSFYrazBLTlhtbkhVT3I4?=
 =?utf-8?B?dFI1NXRFZWFOTitwTncvRUZSMlFIcWVRY2djRDJoTXRXeFVpZGZMU3hKbzd5?=
 =?utf-8?B?cG9sSVhKK1RIYVllbzM4dkp4TXRwK1Z0a1ZPekFVNEc3Y3BqaHBvc2dJT0sy?=
 =?utf-8?B?T01CRnJGd0VlUytKODFzNUx4a2pWVERzdXlMNm9zR3F1SDA0SDhzdkF3cjNw?=
 =?utf-8?B?MEc4b1V6Q3JLUTMrWXo3MEo0dGM4YXlCK1czRXByWm5QWVlIQ0FOYUhJVjRz?=
 =?utf-8?B?WktJUEp1eXRkT0cwbDgyQ3Q3N3M4UzNyQ1orcWE3aDdubGdDdWVrRXBSNHUv?=
 =?utf-8?B?SDIyNHptT1BvdHdabEE3TExzNXlROG8vbXRRdStsRTlyTWM3QXlOYnNCbXA1?=
 =?utf-8?B?aGdnSTZxRklDOU8zSmVrRTh5djkwYUxpWFFCZEczVVBPbUw3NU5BdkJtZ1Rn?=
 =?utf-8?B?N0FRdXhNZzBsWDkya2pFcW5tMldMeHFJVVRaT0tTUTRDelJkUDR6UmlmY3dF?=
 =?utf-8?B?bHAzbjh1cFpkSFdIeW9FejE4YTVKaFExWVU2RldWcG9USVh6elFvazdNSDE3?=
 =?utf-8?B?MEpiemNBWDFQMDBGMXZRaUZlWGFPL3lLV3VYd1pua2RGSlU5NVo2bThUd292?=
 =?utf-8?B?QS9ydCtMdXNGS0l6NDF0ZG15UXdDdnlNWDJTSTFKbVJDaTdNZkJyVEVwRzZG?=
 =?utf-8?B?UnVoK3FTZllkZXhUWUlvbTNyMHFteHg1YjZRRzkvbkRRdHYvbFdYZGdTRU1h?=
 =?utf-8?B?YkdmQmlPQk1qMStqcUpMbVl4ZkxrUnVtbS90NnlJUm1sZUdsdHgxVTZ1SUNj?=
 =?utf-8?B?K1ZSWUM0YXNHWHlDZXZVeis0bGR3WXB0T2M4TnRjR0sreXdHTjMyU1F5MVdU?=
 =?utf-8?B?cS8xU2hrQVZNZWluMlBtZXRNem55QXZwY2pkc3ZSRW1BcVJZYzhOdFMxa0Ey?=
 =?utf-8?B?aTBuaWUyQ3lMOERwU1B6dEl5YTVqdDkrekQyakRsQjlpWUNMMXZQSi9xcllk?=
 =?utf-8?B?VW45L3BIVmZtTG9kMnhHYmpoQU9ocXpuY0J2Z1JxTjNreHFleDIxdS90M1Bx?=
 =?utf-8?B?RXVYMTVsZUVia0JTYVNjMzN4MWJnSmFUZzNxS21GakZyZ0YyS1FDMDBST1VX?=
 =?utf-8?B?OXdoZG5qNjBDZXVnakdKZFIrcC9TL0kxN2llZ2JKRzBicktxT2dFY2ljc04z?=
 =?utf-8?B?Smo4cCtWUWNiR3N3NW9LWVpncG5LV3lGNGFGZURNVTVRcTNhQ0N1TU9TRmx4?=
 =?utf-8?B?UmZMNG5mMWxRbmVSK0llSDRpZVZjWUo5a2ZoekNTbS9Qb1hiR1dUc1psNXo5?=
 =?utf-8?B?SElUZGxYYzNCQ3k3eVRIMkFGSWU2R2xPbEF0cVR4Rng1TFI3VEF0dUErOE1x?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a909f887-f1b9-4eec-5d9b-08db9f4c996f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 18:05:54.5626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZ9vG6jwIw4dZMly6RKl2HbUjitnuL4A/8krXCCBMTmGOBOv4dMohSuIiJ+eK707xHpEareBzr0AmILKr4IH92Noqg5PJrh9IKtRG0xpyZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/15] drm/xe/xe2: Add MCR register steering
 for media GT
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:06:07AM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe2 media has a few types of MCR registers, but all except for "GPMXMT"
> can safely steer to instance 0,0.  GPMXMT follows the same rules that
> MTL's OADDRM ranges did, so it can re-use the same enum value.
> 
> Bspec: 71186
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index ef9f4044ca1fd..c01799b4efcb5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -214,6 +214,23 @@ static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
>  	{},
>  };
>  
> +static const struct xe_mmio_range xe2lpm_gpmxmt_steering_table[] = {
> +	{ 0x388160, 0x38817F },
> +	{ 0x389480, 0x3894CF },
> +	{},
> +};
> +
> +static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
> +	{ 0x384000, 0x3847DF },         /* GAM, rsvd */
in keeping with the format of the previous patch rsvd is 382000->383FFF
> +	{ 0x384900, 0x384AFF },         /* GAM */
> +	{ 0x389560, 0x3895FF },         /* MEDIAINF */
> +	{ 0x38B600, 0x38B8FF },         /* L3BANK */
> +	{ 0x38C800, 0x38D07F },         /* GAM, MEDIAINF */
> +	{ 0x38F000, 0x38F0FF },         /* GAM */
> +	{ 0x393C00, 0x393C7F },         /* MEDIAINF */
> +	{},
> +};
> +
>  static void init_steering_l3bank(struct xe_gt *gt)
>  {
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> @@ -322,7 +339,7 @@ static const struct {
>  	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
>  	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
>  	[DSS] =		{ "DSS",	init_steering_dss },
> -	[OADDRM] =	{ "OADDRM",	init_steering_oaddrm },
> +	[OADDRM] =	{ "OADDRM / GPMXMT", init_steering_oaddrm },
>  	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
>  	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
>  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
> @@ -340,7 +357,12 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
>  		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>  
> -		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
> +		if (MEDIA_VER(xe) >= 20) {
> +			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
> +			gt->steering[INSTANCE0].ranges = xe2lpm_instance0_steering_table;
> +		} else {
> +			gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
> +		}
>  	} else {
>  		if (GRAPHICS_VER(xe) >= 20) {
>  			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
> -- 
> 2.40.1
> 
