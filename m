Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94289D711C3
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ED610E123;
	Thu, 18 Dec 2025 21:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJel0amt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CE710E070
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766091784; x=1797627784;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hDhYABlhVH1ITAZ8Dkmyyk3Tu1GcZ1wu88k4bsXROAs=;
 b=QJel0amtzNV6BzvjxIsW2hZyMXF3UscLFGZrT6/xA5cPLJ438o1vZzAz
 v6X+pmpCD1HF8TLmaZ+w84lzDkqmVbENpCaQ9dkXBqMpd+Ms/Z4Zole5f
 ApZfuZXLMnR+ngP8qcmyJoIiCPNPFDf90Ly+dEQVrnNZuFpkJv2mkWJD7
 7q2rDiOZKslrUuyLiHIqAUqlWsTtZJLSWnetGe1Ul65edtti4SkdcZ1tO
 3ZD3LsthJvxlE8Mf+CgKVlE8alOUXBvSLMeh8GIISuIUYVBzg8yhfI0+b
 81y/SRM3jrwjrgJG+NavqEG4Du3iK9xbVOrBq+TCB07dNiLsk/2xtZqbq g==;
X-CSE-ConnectionGUID: PeGXGmekRaO90uOVVgD4lw==
X-CSE-MsgGUID: VHRMatCeRjib0KegnMNjjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67948545"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67948545"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:03:03 -0800
X-CSE-ConnectionGUID: l48x+xnbRh+4sOb2FEmKPw==
X-CSE-MsgGUID: qk2oyeUQS8291iFkrIk8uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229731849"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:03:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:03:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 13:03:01 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:03:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQuGe3/bO5JJOsmy8Q9XXEOHgsqNRlRSHtL5+g9fKlWj64btSgYrMRDkZu/Epzk7Wyd3HN1zyL75EaRe4j9+kEVvIh5GXxOA7XR8oHlh5Qa45d/8Fssbra+wlnE/sEYzjx1VsAWO3Vy4vZLIUqxAkVjfH5D3C7WCE5lhoYg+nCdeq7WApL93N2R4y0RPGiAr3x4TcDsKQRlLLtuvowCxHMv1VkxYMHhgfBk/aMC3Nz/hgXyo8PlxdIpp1DOBQnyWth1Gy6mSk1XttgGDeLFJD5c67Sk2H08cBKqH2xJ4SHekfBizY9upXzfe/IX/XvBOvf6wTsCDd1rvIBEilHs1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nE/W0OB7fHxuINFa5qwVoKptAIDX7kAzqXn4V1En8Kk=;
 b=IwcwLjcd/FAfxJeUip40mXfG27CiaHAOAIXm3DY4sZELvZAr6+gPO74Hv0f/KULZJxhd2AtrOapsjxBuTIEAYLgCsi0X65d5ejHc3UQZtdPgaFcQ81wRzh/lM3Pn1cWAeGZ3wj04QwGYfDhqoCcSrib9WIaEFn362EillH0z6taegkFbABPokjgQsxsOp9CtcOJWV2nMWDvN7G9TKEDYL6LsDG5VeRO+Z0nmivnxNbV0clm0O7SPOaV76xY1BOAEAmocnhfb0saTXOcw5KS/uAy+1em6/iYk2bcq095M6e6N10UpTgJv/vLLgP+N7liNA8tj22lag0CrFDXfUlX+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 21:02:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:02:59 +0000
Date: Thu, 18 Dec 2025 16:02:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <matthew.brost@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 6/6] drm/xe/xe_guc_ct: Justify WRITE_ONCE/READ_ONCE usage
Message-ID: <aURr_tv5sXUaAId-@intel.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
 <20251218153527.6436-14-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251218153527.6436-14-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:332::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: b74be718-4fab-4fa3-4b44-08de3e78d307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nacZzJxyHF3vr3PudZQLoYY/xM4MfaNSwFuDURVoPt7ZJaHVbL07B1SJcfaA?=
 =?us-ascii?Q?WP1J+lNIQmslINWTDNP+Pg6fNoP3JQPckjdRj0Qi0kP1imW73sBtHXVNN68n?=
 =?us-ascii?Q?WwzvulVL8MekdQ4ef81btktKXVVKNHedQnRr/Ao6zKGv1J1fYUHi5q4Capne?=
 =?us-ascii?Q?+RJYgvPtw2dRhtLVHL36yP9I3QDLUNa6SHDGreUgMRiIs+t4rnfJ3WVsoIZ9?=
 =?us-ascii?Q?zvwdWnrzW6SFjZYZYXy+QlP88dWkuv8dF+mGGFmp9XyhUxFT273gMHWzOxtv?=
 =?us-ascii?Q?B4qpfXf1C+7L13xkimlRHafgcWC9WBZKRrckdtSYne7L8SKqBNn5xqTln334?=
 =?us-ascii?Q?k2ul04jkYVbRHmWHFCzgad2QxHH4WMgCUNhUUrMQY1MlsdPV2EKaXmiP2jEc?=
 =?us-ascii?Q?uZwRRfsWQ+6Wry1fQI5BKhwSouT8thRXxPLJVfoBm5gVpYlFoeB0/4q1iQ7f?=
 =?us-ascii?Q?P1PnhKa4ScvYPjDe+RxRlrakPZBJ4ZggUjkk6zyjv5nkHWaIDAKk6DJLJCYG?=
 =?us-ascii?Q?7yj2mFwIqPQ6waW3HufvPfTNm/wgcWXrO/3dYUydilqOFq6mAIxM5Jc1yyNP?=
 =?us-ascii?Q?tPSnyAo/fYY81zZecAeDtnHeWon7e2kfsOdFpphLd7BcMZviPXWzB+xYdnVY?=
 =?us-ascii?Q?4ZYZmwD6GO5b2lvZw250PgcsesDO/SLZhz2HBCBEfWloqwlVc3mA+aLmZ+/Z?=
 =?us-ascii?Q?gK9wyBFDom7vUHveZ2QLZWmlp38MaKWZthtfWSA1Xr6Sk3R2wNc1ICeDFkkm?=
 =?us-ascii?Q?89B0mJDINoLorDT90sBNmhRt165MORbbpUCR3JsDGGIPFyNDzjPBZraEn9ZM?=
 =?us-ascii?Q?3C9/RgQxntAdYnJ1/NBsleuTK1/ZqrTa6hchW85oP02fAO6HAT0nLw3U5+yw?=
 =?us-ascii?Q?IHK8CiyblZkjhe5Hmd9ypVwgzjNbQxYo5ceZw3OjzWjRbfCZqGbXLftUtBZi?=
 =?us-ascii?Q?p3uT0459UexN6G/VuouQ4yfHrrFcwgQ3etJSOoFDrP4w9Mr37/nDNefcpAtw?=
 =?us-ascii?Q?FMSQMK6jtrm6idwXd+0yd+1BtwalLOqUgMU1Dz71rIlpPtw/d9BIZi46AwLk?=
 =?us-ascii?Q?yaMMb6oYBPdrubUXwfaTgTbttXHvl0U4rbsmalmrHYpL6GTJUfRYyTkHaMTB?=
 =?us-ascii?Q?gyklRSMJaZ4psM2o+OpTXQ2UWBbnoCxPfxa52zYpI0/2HcLctTRkocg1KpsU?=
 =?us-ascii?Q?z6wkS2SoX53v2kz0169YieP80OFcIkRnWIYpU1f+inN5h2uzOiG7gnuTcapW?=
 =?us-ascii?Q?U5PxmJMOWo/Zye9VFrQAmpdmRuuEGlbfe9X5KL84Mh/b74GMlr9bDAuhoODe?=
 =?us-ascii?Q?jeMFmyMdVIQV+gllxXIIPtHvhP/x8Ll1N2BqQmh1O+amDNicB2tTpZJ6TkNA?=
 =?us-ascii?Q?mGX1T+hPZk3Yssd8zEmAl3tfSyaHvm+tXQz0Pwlb0CF/hXjd/0uJN6RzE4UT?=
 =?us-ascii?Q?RAh0KrNKDflcRScfQrFH69MNk2n+fmdm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vTJ9VJEnscwY7bg4eMGPyNo+wrvHZYHVLZEEBZP6ucfm7fgAH2Af6yRJDwgI?=
 =?us-ascii?Q?mdgKQRAHQnZ4Sww+yojYu+Xo9ekQyX+2JHbNFr86W+0dpCkw6fe/AFAbXIgH?=
 =?us-ascii?Q?hB4oiCyH6LMJJ60d7NmfDK9ltyNt5t0jj9YAneXDSCPfVwXyXQ5Pvf/W7ILo?=
 =?us-ascii?Q?I6hHoRhrkeU63mxhWk0+fp39Igf1t2J+K1Vef0+GNUJCK29mV8bm9736rhkR?=
 =?us-ascii?Q?RWU9aYOhvLz97Z15/Dy/C9eImyKp/EF7gPwXwwo6YUmPbnaoEdxkEoCRDpb2?=
 =?us-ascii?Q?mhFSzYjKzJCf8Bqqdz0NRnKDOqUaK/2A4tnzZf43cLzG2wFqg2ka8hD4A1DD?=
 =?us-ascii?Q?rR+2M7y9AUxhSZNvqOtROhAAe/2R2yCRHcRGILiFTwT4/3ap+nXPXxgCH7lb?=
 =?us-ascii?Q?zhZjGAaFHdO4BO9kU4sGEILrGRin7QcXDfR6wVobeszF7RsxfOcMmh6mmQ5Z?=
 =?us-ascii?Q?z3Gxud27xNx38/4dyz8UTIo+p2NpRXu4dkdNsj407P/AVK9X6Zn9cUAOMvRT?=
 =?us-ascii?Q?AfY6le81bP8SRHmkt0GfOJwUP0XB0VyY/aR2XRiTY7rTeJrrh2cpmdyj8KWC?=
 =?us-ascii?Q?9FsJuqDK7nfa/r3Y1j87igwUwWmDSmuMPRQSx5J1iHAx0NgeK7AiWLKov4W/?=
 =?us-ascii?Q?RwuyYtKa2/+fudixNWuyVkjADhZpBepD2ESgwaGHFlCo4Dt7wjaop995mnON?=
 =?us-ascii?Q?kYGoHtHPhE8sKYiIHlMlQHiNO2m7N7tc56tYATRHSny8YA9/j90xkj7bTl4C?=
 =?us-ascii?Q?k6FVTtNVv5MG8WbtxOqwboG5IuJ0R+rngGg09HYaZJzYjuyv7szac4huRe2T?=
 =?us-ascii?Q?S3auKYdguGe3fBhA+XvDSw2TqM+wlmJvcO46sXpKupCwljcHH8bL4sBesOES?=
 =?us-ascii?Q?axWkP/1XlR0beHaRdWGAizEKvNL0NrC3W3qBSFTCG/EMZh5rEiInGQLcmV8z?=
 =?us-ascii?Q?Ih1ffSolIEdpyVTMqTVUh3qMBCe3d6alACHmYh9zs5Pd8ZMWKe2nnSWi8Ecm?=
 =?us-ascii?Q?wffK+pwHsl0WM/rJVXBhighrOOPMXXvtLQD7ht6xbHcTbaJYSVivGM9I0Taj?=
 =?us-ascii?Q?N23kY9Uzu5EY3iwu9G3wPZ0TOJbzILsSdpiG7b6erQ7HsnPUh9/n2wvBIHvL?=
 =?us-ascii?Q?SZ9M2EfPmRXgdkhIdFNMRrF/wavkNYl4VG4JpHvOLyFqHfkB9i/nfthITkAR?=
 =?us-ascii?Q?6ZR4YUKqJ1lfdOfWJ9ddE9LDA/yEfSgT2r1CIcVvRlBiX7QJXmyl2r3pqaA1?=
 =?us-ascii?Q?Y0iOEvMSxIZZ3ZiK2/d0Q8a8m8I8wse9689mliCC8WRVGBqkfUiC++8laFlx?=
 =?us-ascii?Q?hMmCcxiS1BKaTaSXt++x9Z32Eh6K4KFpVr0BkumTbNIdQojPFJTpedezizlJ?=
 =?us-ascii?Q?fDJMxTdC/5GMSgTJdKEGU4Zg4qTOmAmOTJ5kVmG/b85Wy9rqtYrQoJUCfg3V?=
 =?us-ascii?Q?1cxRfF4NgehgUmzrvgDSMvRO4pc2/qC5cDrqD2RsJsqupVYQGnig75JhnyOF?=
 =?us-ascii?Q?NRQiknuFrLUHQr0dSDpEkaVJ4PKdeHW+P79J/BDW5pq7+yzVafqUD8zPvMSW?=
 =?us-ascii?Q?guVjagtec9quzGGxrWzERycz4gl0cdBw9SL+YuhH/rjNui1cKfCcg0YWzGdE?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b74be718-4fab-4fa3-4b44-08de3e78d307
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:02:59.3136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyBDikJ5KwSWwKyFfr3iLpFZMVP5kDZPZLbHgUg56Tx4joHP7k5gnHFbjYY594ySgi3aq5fULY9bcDQJOSgLeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
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

On Thu, Dec 18, 2025 at 03:35:34PM +0000, Jonathan Cavitt wrote:
> Usage of READ_ONCE and WRITE_ONCE requires comments justifying it.
> Some recently added uses had cross-dependencies with each other, but
> needed to be added separately, so introduce the justifications now when
> it makes more sense to.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

No, I did not suggest that.

for instance below:

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++++
>  drivers/gpu/drm/xe/xe_guc_ct.h | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 20ac0438ffb6..24857c2c8cb5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -529,6 +529,11 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
>  	if (ct->g2h_outstanding)
>  		xe_pm_runtime_put(ct_to_xe(ct));
>  	ct->g2h_outstanding = 0;
> +
> +	/*
> +	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
> +	 * xe_guc_ct_enabled.
> +	 */


if this is true, then the patch 3 and 4 and this line should be combined in a single
fix and the only Fixes tag being the last patch, which introduced the relationship.
To the first patch that introduced the write without the need for the WRITE_ONCE.

>  	WRITE_ONCE(ct->state, state);
>  
>  	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index cb1335f1d66f..8d318b094f33 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -30,11 +30,13 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  
>  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
>  {
> +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
>  	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
>  }
>  
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
> +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
>  	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
>  }
>  
> -- 
> 2.43.0
> 
