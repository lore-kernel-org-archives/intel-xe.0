Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F09EC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 22:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243C010E0A0;
	Fri, 21 Feb 2025 22:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7zZVMPc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844F810E0A0
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 22:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740178177; x=1771714177;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hlCnOcTVXyOWLZM0ujLNZ/xCjCLc5qmtFrXw9cCIeFU=;
 b=j7zZVMPcYmD8jy9O13j4CssXrD48oQqodJJFZbA7bkSM0/jB0zq1Gdzn
 5AcMuRv33L0OlUTksG46dN6OZ6PNxnnbid7h64twKxGsDivVdZGnnWBYa
 QWU82P/D2yaZlpNHTe6LPjU66NA0/PpkhG9oD7xiQZFaK4l6QiTHMt+dC
 9O04NdVBqLc+BEgcadlNQpZicibAK0gp7/MqZVH1IJfqtW3a8sb9yQJl7
 tKBiAASxKG53G/wNuScIHgO3kwQBGR6+rDMtsaFHeF6CyMX/xXDvmRJXL
 mt8X0Z4vZFsgRhqzJ/KXZicRmB5ZYr40Iat6iQb1i3IAFuvbeI/l7g+Xk w==;
X-CSE-ConnectionGUID: M/GABvc9RBOoHAS7Tv7gSA==
X-CSE-MsgGUID: qR+Dh51vRH+BT2LT6v3amA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44922202"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44922202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:49:36 -0800
X-CSE-ConnectionGUID: tOeW6xlhSXqqGpLSUnp24w==
X-CSE-MsgGUID: yyilQd7gQRO83v10zOECJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115993085"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:49:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 14:49:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 14:49:35 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 14:49:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckji0orOdTTlbR2iUsyoVg4HrqSvGSFNJdQPsnG2q9oLT19DH7BXrlmA23NfhKvo5gc2cI9AWJnqhknJ96dBNZCaE9fN5KiM4TbxY7b8jnjgf5YSZHpOc2OEykvSha8Cbtb56nK48pXv6EEcxiX5siYJ2P4WeeHq7eT3TvPsLBcrsAMkShAtmHgMLn9iVaMaIcQlz8/1dbd1HzMEfaWSTjL1E7q7V5iCS4ZX45kRuog7ILIryKsvJPF9tFgWk++VW13vkP0WX764Q7AQJniSy7Y6vfxhVetUeIAwSetB/d/TqvE5f4LTgPcJ1m3CpXm97nzreLUQGmHB40o2LAEbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7v/r6a7ujSyQC+8GiRx8VnXIq21MXNBXev4Tw3gsOAU=;
 b=Fsk454Tk4tiNLPMvbl8gGAMd1gFrsMlOBd746aWfbE8mapnafPA8BSPZGQ+8Hk5Uk/6VT6ENzTWPiF2hs5nEHTYFFJR7Rmo0ASfwLyoZiiBGkKpfpNhd+wMfHGyP+skCAFtE34uW7/2zjDJ1wovX3ZqAVvweMCmfBg18x/wMl7nziQqTYGkfVTjUCYi9RijvHrFJxabYXUIizB4IvyUn5Ka6q8IhaZhAqe5tDhgrzUn4CnmPBAo2pVEXTS53LxOrrBtmMaqKddMWI4P/yMxULCmWKADtNJa24vLPPnyOMh8a6wA1IXkP/XM4eEMVddL6j6pOrHSXTU2FIyd6e3sijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 22:48:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 22:48:51 +0000
Date: Fri, 21 Feb 2025 16:48:47 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
Message-ID: <dqwh2xz7y3fnyf32mybuzpqjqqma6zlfnrmo5m32ll3hyd7xsi@xifkysgmlzwr>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-6-lucas.demarchi@intel.com>
 <CH0PR11MB5444196378A058BFAC94EDA6E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444196378A058BFAC94EDA6E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW2PR16CA0046.namprd16.prod.outlook.com
 (2603:10b6:907:1::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: f065b21f-eee0-45e3-721d-08dd52c9e92b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r5/ocKX41gJKYngbVzhJGzs+/5cFmmOprWhZSv0r15J7whWGxSCYdSvpBg8o?=
 =?us-ascii?Q?a+MM8S8tTDoL9k5AaPSMoLr7alpk/wyG3sQyyKTi2v2tl8LIGgjlXVtSfTfb?=
 =?us-ascii?Q?yG/vV7Uje59b1FjhrjpTQiFoKsDmvot4pV1unow4KsSctuu1mzFHHDT6+nJm?=
 =?us-ascii?Q?4J+vMzZ9xXcX1Wdjdk4oz/HZT5DbUsXX0BBSB/gNXPccqBmEwbzOuof4k9RP?=
 =?us-ascii?Q?88XuaNA+ptHijpp0D8efQzxbPrVyt+j7Z8TysyA5vznl1iM1bT8qNPdBVA+o?=
 =?us-ascii?Q?C0SreUN/YCKOJsQX6CzHr9JDG5xN4BvQFckNivCeHMbuBNEIQzgbpnFjVxqo?=
 =?us-ascii?Q?MU4QcvzwhouS3T7QxpwX60DALKSTiFnYZRDJHGZI1oWlEUSkJuIuaRbK3Tp1?=
 =?us-ascii?Q?aMamL25G6lTW+I/MRf8Yb64EQzIfCl8IfVzDlGALA2vHwLdatgESSE1HGa9T?=
 =?us-ascii?Q?Hn2mHnMnKsj3SljfyNIsP/9z1GWWKWu9FUnR9UfpP4/l065V2VrSnZejbZ2o?=
 =?us-ascii?Q?mRBXuTAId8sT/Bp7QGr0AA7gY72wrZq8xauWnl9XF7C+T/xEc7JPKSd4Scmu?=
 =?us-ascii?Q?WpKknUzg/U3J8VTKt+x1RSCJJLWJH2+S6C20ZiRk8spV99j/CUncm2KHDS+v?=
 =?us-ascii?Q?BQGSqMMaY1oWqZLUZBxVIgTxJITsrYek7+8Z9cq4EbxxsxfKXPWBCvdLg12C?=
 =?us-ascii?Q?d51uRSZj08xI8gPtdia3UHDpfxXU1zfsrf2VLjUQwVIY36MlVTfXljSe6yGX?=
 =?us-ascii?Q?SPnUe94QHrQW05M7LOMBSvISkXa4lWv5T16aF4s1WjoEhNAbKw+ZjuU30yCA?=
 =?us-ascii?Q?E0qRBWKY1fVhWhjWJADa0QzLbYgPlQnjI0HHMpDEj0O+RMa57T0v8qlcaxnu?=
 =?us-ascii?Q?DiuBDaSo0DsQM/f7woJQ0uPHFfOXFeY6e85x8Lc3fjApvGlayVyGDrF3YyKR?=
 =?us-ascii?Q?0jQPBM2eZUWyF/Om5cLbTX3s3vJgRszUECe8cHOX4IYBk4rgB4cVH9KsN3Tm?=
 =?us-ascii?Q?/eYmS7g3YqOkhhHBB4tS4RXsIDDOWO+d3ionlEnyOssF+UD419NMB/mzPWG8?=
 =?us-ascii?Q?F/bmXyV3x88tdPKDGMnDra40PMxSnauqsc7YQhojcQFLk2RsOAzFwnW080Q7?=
 =?us-ascii?Q?2Z0Dc0lhAYOoJf5KzDPqTUBUKBMPXxEhUgxkd6YGFNDww0pkoPHL30U7K19g?=
 =?us-ascii?Q?UV+xU4jfUtyA2ys6j8W8/pgfmMeiAr1iDCbdhBSUKtVjWHynfn0sCFYEcUhF?=
 =?us-ascii?Q?gHlM4AWniqj+BBcbB+dMODGyulWBeDw2d+XAMXlJCAjVkHG2Ye0NVxTQfnVd?=
 =?us-ascii?Q?OGK41I1DatI5g7MHGxgmvvg8U7Dts+rWLnu1VVPGShIcpCri2FyrcYnJvMru?=
 =?us-ascii?Q?wzd4TWa6g42ptsbd4KyERJ2ImT+3jr8ga0jjziuVvaz0uacUXvitxG3k4qFZ?=
 =?us-ascii?Q?Qok9f0HgOd5bvpc5ztQ5AtkNqq+a8qi1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+mmEjCLcf8OTONo0P7MaMl2MG/eln/y9Zb1vrWpwVf+hCf8JSLdpwp2Lvq1+?=
 =?us-ascii?Q?68RRPmLLAHf3jwtWS1FXqN6KHLdD+DhjUZJCx3srOwe1b0VYOZNscpcmNpxa?=
 =?us-ascii?Q?RFxg/FQDlTerYIn8asajVPHujeA0NUtI5U4Wp77N2ctmapb3iCL2/0qBT12Q?=
 =?us-ascii?Q?8qN97Xs2D8AoZRaO5A516b349K9vnfeatuBlLCG5rfOcFjxn2u/6mpTOdCZ0?=
 =?us-ascii?Q?4mXjbLltQB3vqWUr8sbB7A81wtfakBoPRzENyd9B/T35jHsZwRByAJPqmOVG?=
 =?us-ascii?Q?ctI4KAJza+v2nIZouuGhjQQaJk5np/IzFPpUWQ7X+KyOBkY0UU0HYQJsty1E?=
 =?us-ascii?Q?otO3FVrMUM3u5Z8N4axL0zpcpNovtL+YwtnokkOgxRDVrJjH3uzsxwl+KCWh?=
 =?us-ascii?Q?RWj3mZPXWO0eykD8UWWXH1LisQAO5RqmPftsUSItWm9bTbDdUKF7v2Xc/1oX?=
 =?us-ascii?Q?iK1p31DPNVZ9o0KphBL6nRpmMfNP/JERk9GgZZDqZTbBj1Rq7zcYb1tj6ATi?=
 =?us-ascii?Q?9rvmLDjZnqV0JoSOQzgCdsxst39fJh8AZ0pfwQqozRD5wNcVcmvkhwANJXAB?=
 =?us-ascii?Q?Jt5Bbz9ypgBrTgBAQiO/S3Y0BKdjnzL56IcRXrIv+qBokyGnSXf5Y5AhN3Lk?=
 =?us-ascii?Q?/jgVvTXEMuEhO0TBIWmrKC64aWczzDV3Rud+4/Tcl+n0hR+k0B++hwQsUPSx?=
 =?us-ascii?Q?oCS3tmnPXTled+ZM0uvGnCz0dQ3o4+885D5EeXXncCfaXpWyCc3bOEh8xz/U?=
 =?us-ascii?Q?tfEFQDtj8cgqrVLFkwm20YbhaneMHNc1W4mXUqWc1MTbNSg3YhUDKb4gQV8E?=
 =?us-ascii?Q?pkXU9H0mEkKwn1sz2nR2ePHcwu5PTsdF5JdutPFQixRiQAFP9e3zfYR07Ekp?=
 =?us-ascii?Q?nL0NEopflnUkiDF2gihSKHEDdw+UIz4d8zRIOLk3AAA1gdEnynS6BkskAfKA?=
 =?us-ascii?Q?OgDVlSx2k0YDnP4j2Ehy7/FwlLpg5L7Fe7owlZMSC17ySo9Zurl3I/Q2ljfL?=
 =?us-ascii?Q?4blUlPsh+54lLMYsLobxAi2h1UzBFB8JgLmA8IH98Y9Qene3xxFMmUFG+ubn?=
 =?us-ascii?Q?GmU5qkGlWln7jdcgRCLqzt6Lv4TdIHc567s+Mu3SZ7RtwpvxQyB/liWbr+/i?=
 =?us-ascii?Q?SUepPXzkzudy6pmY18CbXppvEJbSKIMlqgA5H9nq+fB5tFl3vYv1fVbEZ6g7?=
 =?us-ascii?Q?l8NEuDymGQTCCR3yV1LSSxSG7R41lvd1QtD5Wbh7Ls7fI/G5MV94eyMf2pqH?=
 =?us-ascii?Q?e56XNYiKmnsA+eCfH4HmKfcLUMFo1p1WysCijxTnQwifzoKtjgFmQ/XBFGfX?=
 =?us-ascii?Q?DeCMzGNLAWx7lYB2EaqY9YgifJjXUv5tMeUhB3gkY7HqE09Yq+wdIjjeIL7r?=
 =?us-ascii?Q?FEEh2K/TZjEvCONTf7iZ0HaVpeikc5TbEzzKuwhD/YF4BF05B8fTIXYD0Ljq?=
 =?us-ascii?Q?Jp4BIQxEBouTUSEkSczSM7XYceubE1IQ2T93EN1eN8SixQ7xHUv7vR1cxSoI?=
 =?us-ascii?Q?BcWs7tt0JLH9JGWmhB3emLeN1pvnmCiHWZmU1iezhboFTsCJIYXY0ZxSxJrr?=
 =?us-ascii?Q?1ANPiJtAY+AOSFB7Rk2JuT04auXV3UrM1H5Dh/Rj3yLIniJj/7OGCiUAiDFQ?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f065b21f-eee0-45e3-721d-08dd52c9e92b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 22:48:51.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHgkWEN/XgdBD117gIjtehMkqKo7nxuqPCQVaYYnVEQ9kAd8J8WHS5ov4qoRd6b3c7KnyVpd4BGE29Oh671M3IAz687V79oocuHJ48+/e9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
X-OriginatorOrg: intel.com
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

On Fri, Feb 14, 2025 at 10:19:10PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas De Marchi
>Sent: Friday, February 14, 2025 1:23 PM
>To: intel-xe@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Nikula, Jani <jani.nikula@intel.com>
>Subject: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
>>
>> Handle it as part of xe_display_fini(). The error handling was already
>> calling it if a step after xe_display_init() failed. Just re-use the
>> same xe_display_fini() for driver remove.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Looks good to me, though we can probably remove the first
>sentence of the commit message as it makes it sound like
>we're adding the functionality into xe_display_fini, rather than
>leveraging functionality that's already there.

humn... I'm confused. See below

>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>-Jonathan Cavitt
>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 11 +----------
>>  drivers/gpu/drm/xe/display/xe_display.h |  1 -
>>  drivers/gpu/drm/xe/xe_device.c          |  8 ++------
>>  3 files changed, 3 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index 5ad2c99a9ae74..b7c99b8df11f9 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -170,6 +170,7 @@ static void xe_display_fini(void *arg)
>>  	intel_hpd_poll_fini(xe);
>>  	intel_hdcp_component_fini(display);
>>  	intel_audio_deinit(display);
>> +	intel_display_driver_remove(display);

^ here

what I meant is that we don't have to do this manually from
xe_device_remove(). We can just do it from xe_display_fini()
that is already called by the cleanup functions.

Do you think a reword would be better?

thanks
Lucas De Marchi
