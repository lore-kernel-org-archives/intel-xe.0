Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321F0606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yklw+KrD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA38410F165;
	Mon,  2 Nov 2026 18:54:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A515810F165
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793645680; x=1825181680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cLQgyxJA/q5EUbfnlSfpgY03eKaswLYEUtAQPeW56X0=;
 b=Yklw+KrDsL6aW+KYFfOZBtE5kHdIuf0O1zOjT/eD3EaG6bgzFluXTn/1
 1ZZe1jHkdQ3RAnvSxiTlAlvt85R3ZCskeys4QL/RwHb8Y9inFSzM5fp0x
 S/I6Zy97gl0uw6285garMakk3XBzw+UkJLGZfLAwyTMCyjlQe6I6/yzD6
 zL3T/sjbKMLi3R+AMnx7Lh7XoOlZlxLmW5B4TTgMhnfqAM68a4ZGUbDso
 I4Ifsjem7isaqhSVv9LLfEFvEdSMFZ0iLGK0X5zqCyuT/DWGiAAmOSN/O
 7vXEuFc8ZnGzvHva37xelekxAAdVQqHeOPLyfjkRPb+F4w88HtvkQiRgS w==;
X-CSE-ConnectionGUID: HFMQmGcGSby8pb0zy4xe1Q==
X-CSE-MsgGUID: i8wZE/WiSPipbQF9EoUbIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2364606"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2364606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 10:54:39 -0800
X-CSE-ConnectionGUID: e3yrIyylTMW29b+upsW+mA==
X-CSE-MsgGUID: LoXntizaRgqGhqQU+9D60Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6535854"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 10:54:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 10:54:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 10:54:38 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 10:54:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rlj9pdAMS5lL1cHoUcy7meXi281PuJVOKXJdyENdMZFNxadP4uoiZkN5TPxwTS3Nlziif+dgfJyCpExTycG67nZU26PAPGTOu6Xt1KMjs7/okriV2HCYvpX1VBYgK5103UFwAIdypAK6tjyv+FETS/PU1r8/Ej/EVGViNW5uMFwU2otLI25pbagSMNmcpXERoo5zLhrgFQOPMahzQ7zxIS7b+dA/3C+gRo57Z2Z1If2cCAcySKuN9Jjql/0lufw/a4H6RmLxdYWBRmzJ5Imegf84KTGKi1pLo6nAIcQpsazZpoooExi3Io3/lcK42L/56FEj3lXWd3eXvqrPbskrwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW4szMVMNxHqeQFRdTytsKNJ49PlxbK2hI4siPunSzU=;
 b=GIkq1PU+kpdQoIsuSv2y0lFUCgbcPL44B5uPFi7k6P/v4Lkzsgi21pAxb4wW3D9miPFFMZA06GTrSraFHLw81Mkp9NXqmVM+T8jNKHqIBPQ8++tjQGtIOWVTCQJvlxFAngm2Byq3Noz1o74iRfNayNouvR++G1R4PaYRvuEmcUl3e6VPRnostJT0MDoICixIY6jjRq/J9samTaaQl1i14mC0dElfMfjuVzPu85+ySNAvCAGx4VObyYx+ykqkU8y2ZzDgy8CUzKdsSGT27APEC7WiaFLYYzBb3BgSuxvdSLYxBmH0GnZA+fvisvK2pUT7FCJToo3Tsw0pn1WItQVHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by DS0PR11MB7309.namprd11.prod.outlook.com
 (2603:10b6:8:13e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:54:36 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::4fa4:138e:7455:9384]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::4fa4:138e:7455:9384%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 18:54:36 +0000
Date: Mon, 2 Nov 2026 10:54:33 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 03/10] drm/xe: Use picosecond as common unit in
 adjust_idledly()
Message-ID: <20261102185433.GB326958@msatwood-mobl>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-3-919fa1c27070@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261030-wa_16031259911-v2-3-919fa1c27070@intel.com>
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|DS0PR11MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: d3400c9d-e73c-4caf-75fb-08df3912bd69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10070799003|260925022911599003|260925021311599003|260925021911599003|22082099003|18002099003|10067099003|56012099006|261009223027099003|261102123227099003|261022105027099003|261021121427099003|261021123027099003|11063799006|4143699003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: mk8chGfWRWyiTkxHM4gzKjkbD/I57ACHIA9oJF/sNGUh80Li4O1yKhE1fl6JmFLeVGDulkRlimIKEwASx1hUqeQrRzMBrAT6+kw3FQ5PE5Z/PSE/LIfnpgGs0LVWwNDZQ35Ah9ceHmubgDRVZkDe5eWXZmWpnuj33+7z5WuIwTulEiYkIzPPxJCz8XayegKO0gVZPmHIqSMeM81IAm0UpK3hhUiWUr2PJMspR1khRbry1I97aDqE4yuYID00xTW+AVSzPLlMl4y0USaeePWsrWw9JDFw1yMPEY3BhbGiu8uHV/AW9CAd3mHXtvxM9yY29uU0tyHXpTWyeXS/FteHeKISq/Rc0j0S+BzdKOZlbLY+w6CQ6WtsBaLLiseR17Z5r6akC9jCYSccoLtExAOVgq2xNMa5+d0uprDNdTry+0SJnEEpXUIG4pPmSNBcBwPmzZdZ58oTc1im2gwLGE4pyy6vlxA8bGsWK2YRgX1q47VXk2KiDPK7Fmjk2TFBWBf7H8OwpJGmLuPvDvGOTzf5YEKsTk0KNFySASNfuSGPhOKL2GwgCTN0ZiADtHfFaOHIWL937u1JznpoLEkq2itObn3NnhJF2EarbJnun/uDvPeDj/tPrIOEXwW311xeyPNFe2d3CzLpnMzYJzBGsux3DXRgd7en425bZOUuyyDHPHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10070799003)(260925022911599003)(260925021311599003)(260925021911599003)(22082099003)(18002099003)(10067099003)(56012099006)(261009223027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021123027099003)(11063799006)(4143699003)(261028144727099003)(261026121527099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pZtFqNa6L83BznBa1M+UX51YT+R9YfKD9xfIVu3LwblK/StbkSUQXsI1gqtZ?=
 =?us-ascii?Q?za5lZN0SDAOE4V0i1eRe+936AutnlWPmOoKiTR0WYFmcwLreaHdKRG+2zytR?=
 =?us-ascii?Q?IQt9JzFGA/bJDmYjgJS/moVOHGWBopksTwccyd32gs07n674x+a8v3mxYLJ4?=
 =?us-ascii?Q?nMvOOXc1nt34JhndI7qtvO1ti6/ydGEGN6YreGpjw+pnv4nd0dV/BzKWa1Hn?=
 =?us-ascii?Q?cd2R2o4NBnRJPS4uK6Wu/lTN4oVdDYjS51AWK7NGPL5LI7JjMHuCcLSBBrp0?=
 =?us-ascii?Q?ly4UlHU8e9XnVw08YGVP0eYFfQd9NDcu5wq2iW8l2xWboNbpcHB+uwPuqev4?=
 =?us-ascii?Q?KKVmIs2/7sLLnZlLA9BZkv8dTFIQkVHeuDfLr4YQawClcj0U4WcyHSdkc5is?=
 =?us-ascii?Q?+wdjxfaNvXz1+AF32i0TVomNKRfGTcmejGxhl5ZZkLp1ty9TGvwzy0H/OMHN?=
 =?us-ascii?Q?bF385CEm9Kuqr6SfNc4fYElYw65IKVL71GgadxexgwsX6F1VoamaefIOSJTf?=
 =?us-ascii?Q?SAywE6p4hENaND909E/LSqqEkJ3DJh0pv0Sw5U73Zn+DKKAusfp2lvwUFFyE?=
 =?us-ascii?Q?Jg+of/sllnF6R2QIP/EGiEhlzxPxp5iq6NJc+oCJ0LiKaCyYcKREELUBOVRV?=
 =?us-ascii?Q?BhZ2f+RM+fRNlVNZyjJIcbdwrImt1/hLjDkCKzoDuzYtoKVlWAyOx8jKomXs?=
 =?us-ascii?Q?mKC3kLx1KyJOgQSq4dpIaN4wxvVe2mCqy3tnTHB0XG1oCywviU5EzFLzZqel?=
 =?us-ascii?Q?qqBKfTA7crLy4o95cQAGwuXMCM19FD7r6cgeT4FcC3ezd1C0RN4NDcFWHfZQ?=
 =?us-ascii?Q?i86PaHKMw66SGk1dpx1VWTDANuA0z1vGabAIyrFgvBUVpB4QZZOIvf6jqRyq?=
 =?us-ascii?Q?iy9QKtnKNCJbTWdUapmjMbKXdy6mLWgNAID6BGiYApyNoVwxWvrkNCd8OEKo?=
 =?us-ascii?Q?5M4UNJfa32AjXpZvL5buqqfLxtw5bFpTAygL+36zOFSKR/A+TCm9MbU0lEY3?=
 =?us-ascii?Q?WsqD0UeATH6xYZ5xPcx/gdtLOnQrBsXou0avN2bq0JnJM2DxYnYP/bMY07/D?=
 =?us-ascii?Q?WPLhfePtMGOi98yhbhuJYadVLDzHfcE6eGuafGIzglURzf/wJ7tx3+lP8CwN?=
 =?us-ascii?Q?hlF/HEzh3ttR3WkNP9M7T68MBjEZPvXtC1tE80rJc5XIQkD2EFVrCeX8iAdU?=
 =?us-ascii?Q?LbhDJBopGwVHdfOM44ltyHMpmy3otocVpR8CBJWSRPbutnMALoy2VTGCiqeY?=
 =?us-ascii?Q?oOiKcRpU7sNOdSgViuu6+YEle1zF53bu/a5HdCFvqI8LMCmcwG0ekOAYT55h?=
 =?us-ascii?Q?S7rnqoazlgwn9odudpKInV8airuEIcwqXwOLgiMWFRZWE+EtLynPgvVDjOBL?=
 =?us-ascii?Q?ZCd/WNKIjpf7+FCrU7k4PJCdtTEMHatqXvK+14Gh9NvAqZ+C40wA6EtotTxz?=
 =?us-ascii?Q?kXVF6fLNcMoY76gphCZe1ifjzPXKB+QJvMB26raltN4Py8usYIokIAH8z3q1?=
 =?us-ascii?Q?iaDlD3f4rq2zwoVc+OszEaIBsez/CjCh519wmD4tQTtks+d+flljaHX0/mcq?=
 =?us-ascii?Q?250rfwigJaLu1UtvCKLTGSOcQrzUqJJbdhYT6LXkoOuoqfS3bhAGoULwvF4l?=
 =?us-ascii?Q?kE0WneurL7c2m2mSZCyeDVPXcDoZxE4t7bNEw55EVbdd+x07SbVBVVcHRr0Q?=
 =?us-ascii?Q?TvdmBD1SpFTbijL+x9bWFLaWWXU7FIve5CPMLK/rKnSY6WFeSvFrBlCrlNzJ?=
 =?us-ascii?Q?aPNO2MGNrc83EULlEecMts/mACW+3PwLnHa4ju7udEwIwef+oG3bdXFQHt9L?=
X-MS-Exchange-AntiSpam-MessageData-1: eSB+1utXljVOIdURjb7b7O0ncqPf7BWoXWw=
X-Exchange-RoutingPolicyChecked: gAJRaCbW+5ZmpNtRiiQxEjy7d5MtxIWe4TCzVlxTpBFNOSkVyElEfJoYuoDVpqS9jWWiDlaDl7IQFfM+8FBv8MzLCnSBnDxWZoPlGg2fMDgsxgtIXdl/9aIcCZHEXqPAVn0IjIJps2B36TH/566b0rNrzoebRUWSNmYenouNQZhfhqu7078smCYhEb5/pGgq6whOpMg1dMpu9J+Xy9d0l9qhWruLKFzABBbEfqepMb9zHvb5OdvPGRZ+V/ZNY+aErVkrLt0skvwJyNf5tz41paZeNvwL9t+7X6ybD240UOJbwgfE2pWXtXDoFep1mMqW5IK3ykoaL3WySTlnEwmOdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3400c9d-e73c-4caf-75fb-08df3912bd69
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:54:36.1377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knz/8fTHBjdB94uPy1XtUdupcoky11DKlGzNchmFOYCU3enTxOH8cXlbR8RA58Pptuhy2wl4kR/YjQfaMmkr+zVN/bRS7SWtwCNpyKXv46Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 07:57:42PM -0300, Gustavo Sousa wrote:
> Because gt->info.timestamp_base is given in picoseconds, we lose
> precision when calculating the current idle delay in nanoseconds.
> Let's avoid that by using picosecond as the common unit of time in
> adjust_idledly().
> 
> A good side effect of this is that we avoid issuing some integer
> divisions.
> 
> v2:
>   - Change idledly_units_ps and maxcnt_units_ps to u64 to avoid 32-bit
>     multiplication overflow. (Sashiko, Matt)
> 
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 55 +++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 50e8c5103bdc..eb99284af3cc 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -596,17 +596,19 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
>  
> -static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
> +static u32 idledly_floor_ticks(u64 idledly_ps, u64 idledly_units_ps)
>  {
> -	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000, idledly_units_ps);
> +	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
>  }
>  
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt = hwe->gt;
> -	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
> -	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
> -	u32 maxcnt_units_ns = 640;
> +	u32 idledly_reg_val, maxcnt_reg_val;
> +	u64 idledly_units_ps = 8 * gt->info.timestamp_base;
> +	u64 maxcnt_units_ps = 640000;
> +	u64 idledly_ps, idledly_hw_ps;
> +	u64 maxcnt_ps;
>  	bool inhibit_switch = false;
>  	bool wa_applied = false;
>  	bool clamped_below_maxcnt = false;
> @@ -615,29 +617,27 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  		return;
>  
>  	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> -		u32 mincnt_idledly_ns = 5000;
> +		u32 mincnt_idledly_ps = 5000000;
>  
>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
>  		if (!idledly_units_ps)
>  			return;
>  
>  		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> -		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> -
>  		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> -		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
> -		idledly_hw = idledly;
> -		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
> -		maxcnt *= maxcnt_units_ns;
> +		idledly_ps = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_units_ps;
> +		idledly_hw_ps = idledly_ps;
> +
> +		maxcnt_reg_val = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> +		maxcnt_ps = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_units_ps;
>  
>  		/*
>  		 * Wa_14025941587 is applied before Wa_16023105232, which takes
>  		 * priority if the two ever conflict (not expected in practice).
>  		 */
>  		if (XE_GT_WA(gt, 14025941587) &&
> -		    idledly < mincnt_idledly_ns) {
> -			idledly = mincnt_idledly_ns;
> +		    idledly_ps < mincnt_idledly_ps) {
> +			idledly_ps = mincnt_idledly_ps;
>  			wa_applied = true;
>  		}
>  
> @@ -649,11 +649,11 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  			}
>  
>  			/* Warn only on the value read from hardware. */
> -			xe_gt_WARN_ON(gt, idledly_hw >= maxcnt);
> +			xe_gt_WARN_ON(gt, idledly_hw_ps >= maxcnt_ps);
>  
> -			if (idledly >= maxcnt) {
> +			if (idledly_ps >= maxcnt_ps) {
>  				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> -				idledly = maxcnt ? maxcnt - 1 : 0;
> +				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
>  				clamped_below_maxcnt = true;
>  				wa_applied = true;
>  			}
> @@ -668,10 +668,9 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  			 * Wa_14025941587 minimum survives tick quantization.
>  			 */
>  			if (clamped_below_maxcnt)
> -				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
> +				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
>  			else
> -				idledly_ticks = DIV_ROUND_UP_ULL((u64)idledly * 1000,
> -								 idledly_units_ps);
> +				idledly_ticks = DIV_ROUND_UP_ULL(idledly_ps, idledly_units_ps);
>  
>  			/*
>  			 * Tick quantization can still push the rounded-up value
> @@ -679,17 +678,17 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  			 * priority even in that case.
>  			 */
>  			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
> -			    (u64)idledly_ticks * idledly_units_ps >= (u64)maxcnt * 1000) {
> -				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%u, so flooring\n",
> -					  hwe->name, idledly_ticks, maxcnt);
> -				idledly = maxcnt ? maxcnt - 1 : 0;
> -				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
> +			    idledly_ticks * idledly_units_ps >= maxcnt_ps) {
> +				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%llups, so flooring\n",
> +					  hwe->name, idledly_ticks, maxcnt_ps);
> +				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
> +				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
>  			}
>  
>  			idledly_reg_val &= ~IDLE_DELAY;
>  			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
> -			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u ts=%u\n",
> -				  hwe->name, idledly, maxcnt,
> +			xe_gt_dbg(gt, "idledly %s: set %llups max=%llups inh=%u ts=%ups\n",
> +				  hwe->name, idledly_ps, maxcnt_ps,
>  				  !!inhibit_switch, gt->info.timestamp_base);
>  			xe_mmio_write32(&gt->mmio,
>  					RING_IDLEDLY(hwe->mmio_base),
> 
> -- 
> 2.56.0
> 
