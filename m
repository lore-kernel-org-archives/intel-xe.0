Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B174CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 17:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5212510E938;
	Thu, 23 Oct 2025 17:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j81Q7GPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30FD10E938
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761239418; x=1792775418;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7K4ZTJdicgxJThhXqyp7pMJHkNtFdg18HsRi7y8VnGg=;
 b=j81Q7GPToyPG1NMGYxE3vFetlzbvjPHe+9Jt83dM2e4LbX1ML2YkAP6y
 x5YgvN3B08PLrRpIcAjhsRD5FIhQT3G5K0egN+T4aAsJxIlCmnsvuDPD8
 NJlAXj7/n5oXBtIMr3StunMt87sDaFJ4ccI/zbzmUV+BrOLWFS3qPLWqM
 rwYTcsxJqjavRQ73cZ5wN6JUzjFC/GUSE8BvrjouLD4zEx1t75g6Vn5FI
 PVuF/qHcdeFkV5FtJxR0neB7FZGuJAeCfpey5P1IfA3kELcRkDyWXkE3v
 4nnj85MFOid7/+XYdY/wGLblCyJYx07fgqh0hEq4lc87GcbhFcwLWkeEl Q==;
X-CSE-ConnectionGUID: LSbbzexpSr+Lai0aO9VBvQ==
X-CSE-MsgGUID: gopUgssbQ5iUpcCAHSGRHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80852300"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="80852300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:10:16 -0700
X-CSE-ConnectionGUID: Ol6vBFJ4R3yeu99+U1/zfg==
X-CSE-MsgGUID: eZAohyMbQHmroXxOktVsxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="188604876"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:10:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 10:10:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 10:10:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 10:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZbQYeVwm35VLAVU1p5I8ECyC49Bh9ZuDbaZD0jz6MQPlsoIncSQ2YRx8OYSi+0bFDQlpPcy554v7HkpRctjSeftsEpjN2zZXKlB+1By9OH0Tyvpu7XSwHAP8afX0qbc1nbD57aMqlH3s2fdB91hqMwxyFFMYSCWaKAkVr3q0uLx4uc3DDGIHitq8Pgiqvow7Q9QkKrXQP6btahWm/5XK3lnYt7BaiqZ1U7ZVnH/f1XBZU81urJNCkKiPvtWJNLQJ4qlJ86LNjxZXQBsZ9+cMK6RL2XDFJb+xBKJU1tHh9wTtdBMrFi+Mkv8rW3Ynl3M1jGtOoRNFl3ayd7Y3UWwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPhp5Twd0H8M8Z7lDZdohVtQyBTuIIAHD3yoIaOz2QE=;
 b=QhLqrPMPG/6l4e1zzZ4Gf/Ghl7BBM4u8b684RdVCQE8Wl2iKFziAR9rwC/v+WECbDr8zZn5WSGTHUpcobC11NvAJ4VdAIFsngQTDmWRAI5lVG8Kcikbdiedse7Qra0XZlnHpttTv0tt2RMKKlQTBgFGb9qkqOSFYg13u9/ZVzjft04OtzYbZOrLxiK1nLBFH0htqFvloOAOMfpXT1WbTVnIv0+nWGyrHvC01UvqIYvk2bqRUhwLzvt8xSOp4zVZVu5p20wi2VMns1NFKPG3gCF1aoMfktx40cfWyQN+E4+2/E9QW93QTCr9BEnXJRZwjZiexkh9gcBKn2FvMv3SRDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB9454.namprd11.prod.outlook.com (2603:10b6:8:28c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 17:10:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 17:10:13 +0000
Date: Thu, 23 Oct 2025 10:10:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v13 04/12] drm/xe/xelp: Support auxccs invalidation on
 blitter
Message-ID: <20251023171011.GK1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-5-tvrtko.ursulin@igalia.com>
 <20251022225828.GX5409@mdroper-desk1.amr.corp.intel.com>
 <1bf5ca81-4bb0-4008-a1de-8e2c9158eebd@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1bf5ca81-4bb0-4008-a1de-8e2c9158eebd@igalia.com>
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: c2208900-9683-454b-2c76-08de125707ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZCPj6mqxyXrN674eTYHL47KcDXBBYm6XC4mk2Ivcdgj5AC3X2BvNc4uCj3oF?=
 =?us-ascii?Q?KS1YsiCZjBgReNt3qz9aHGfXDMJyORSmN4cZair27LN5+NlKjbQ0oYP0yYMF?=
 =?us-ascii?Q?t+5H4W5ZAqzZTUGgl0YpcDcUSDwJ4oqCSCyr5Rpvg74/ZWB/ujTzosKZLWtB?=
 =?us-ascii?Q?ZVp/BTWzYmFmL3Ly3l+LZewBRhnQAv9FhBbJRCfNCvd8xGSYghMIyU4Mooei?=
 =?us-ascii?Q?50PD07PyaG5+jK1DVWilfd8Y0j9/4SICUkCqQbwjajwiJk/oeiBajLzBP13M?=
 =?us-ascii?Q?yAKYw6+vHw11U27wofUgTE0B14yCFX0PcC3Z4AgBKf2GvReUKL+KcZ4gaMHY?=
 =?us-ascii?Q?H3vCvMudGzjjIlRIcwt/wf4tzm4YQDiMRarBAtZ8Gk+feSx/s0aTU4RY8pmm?=
 =?us-ascii?Q?77m00F+9h1pSyy0zQii1rz3ANEu8Sa3IvYwUDtVS7zRpPlLPdQtbO68Id9WU?=
 =?us-ascii?Q?Py3Uu/T2/iGmDXpfpYYiaLzcC+JLRbRM4jfJO0jG6lOyPUFqYsbYil84nMiG?=
 =?us-ascii?Q?H5SNuh7Up+Gdw4+IoJ3B0RmRKKeiwnH2T1SYO+07WtwBhjKceqIqB3Lka/kp?=
 =?us-ascii?Q?cqZjSVhMzsXvwA7BV8bvRnYS4ODNbuPDxUUBliEWlXEQBfrIhR3GO/G2+erB?=
 =?us-ascii?Q?hRSya29gnsUEpjobRzMXEp//JGnFv9wQK6bHNNQoVCTzzCudvho4yplytJRi?=
 =?us-ascii?Q?vPTZtl3SC2IHIVompBBrBf14Z1l2+TfJ59LzhHMvQvTmB5h26qoouB2zSBts?=
 =?us-ascii?Q?K/qURKyN7i905Zz5pJUGqdzX2WjYTTgk4HL0sLff9lf0kLsfLGL7wI4bM9rK?=
 =?us-ascii?Q?iO+Bqy1jfbTstXR3g4qKlWZQLS3NLCzoHZeZ497IhiGDIneDCEKjkqeceL/I?=
 =?us-ascii?Q?7k+H69XLYPN0fCal1NLLP53XHU/Sg6XlAgziDOXkU4rG3WXQEIKTrJkw/bRQ?=
 =?us-ascii?Q?UeHj1TeJ0Bo4VVM4ojtKFaP99rpc6WdJX3AhV4ul6Bvpd7Lb2p3Hx/lpMEuj?=
 =?us-ascii?Q?spNT6f+a5yVjsc9OTMDmPMWy8HG6MOHaHtdrOehRRmUO+EiGNBQJ0sVFYbYy?=
 =?us-ascii?Q?SlTvah7B4Lz6LhYzDmzf2XPlK07iJERC79QqjUPFZP+qrKtBKoNFoMncOu3o?=
 =?us-ascii?Q?dInnyXNoEwfrZLjj/ZBvWkkO7jMXjHkZQt135CrT64C5dEaXOHH2NrelCnKL?=
 =?us-ascii?Q?p/6ueNU05NR0Li8tu26MlsfZKekP78oSrbJ6TYmOEsZWL3Fo0QGzVo6TSeUM?=
 =?us-ascii?Q?y+IHzxFzQIi1AQW+cSwD6enNQ1E7og/R7vmN1Q/QkH0nJdW+L3CNQed8s8WD?=
 =?us-ascii?Q?RlvyiKFLcX5cY7p+i7QDHdZ3gMEOoRFfwK+Qjar9QPM16069AwaHpqwWGR7D?=
 =?us-ascii?Q?pnH3apXTl2gk9nsiWB+3L2kD0cBVZPDK+ot3SvxdzHq56TXL/CGc4cDMqAHP?=
 =?us-ascii?Q?tHkGcWmS+UWzMjE2OsgH7zrtA0BSfHqJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h9NC0xIQaulkxmfBDaD7T8EinVfrN2jC7NKCdbkS3quMEIKmjC+o8+sHooPI?=
 =?us-ascii?Q?aQQspMi3/dOA/Omit+hwtu7uv1QpF4GRGd7ExhjZe5ymuMZ1fJIpqcXNKGL6?=
 =?us-ascii?Q?jwZ8vf3XaElPwmSnIZMenJk7jrpyoX1AFFmfwPr1lGlP/mDr7l/KNv29DyQN?=
 =?us-ascii?Q?Sb7F/6CVB1Iv53t82zGZ5+/V7tk4LVFh8LxmG2u9FCjhM/1oI2l3lDXnUoZw?=
 =?us-ascii?Q?CWjVpOhY6XPgHp8Rvh3F0Skgs/qVgbkByYUH9evFmUcpJWvkBd7OQBTYs42M?=
 =?us-ascii?Q?1sGWskZaWpgN8+RYCnUc0E4i0Zi9T8rgiLj3bKXH2r15rEzepbwqXPzq+ULE?=
 =?us-ascii?Q?SznGOz6xP9srU3qvtADC3hJ3WKmN/LlUbFotFhVSjOXU13G2gC9dd5dMYAN/?=
 =?us-ascii?Q?XP1/4yE8DNApmC1tKroHs2noz4MyjDciqYqLV+PZdlxba+hlLv1UVIvak7th?=
 =?us-ascii?Q?moDPAqdjg9RHhLXQb691o5x7lqRVsiDuJmzv+dsMNXEjO5QdxBi2rxL4xvGn?=
 =?us-ascii?Q?eOMJ+J1aXXJ8xqOJSli1VnEW06yM1ZDlh5UrEiDQIr7sDrG5I15kYhYlhFa8?=
 =?us-ascii?Q?XcQMUe4srfaYFu2R9UakD+lhWbBg/OSZ/fHVFfOy2xkyNYAW8D9Et4ie4+cN?=
 =?us-ascii?Q?AhmmRoxLvwGYTfR85UO1oMpKZwQWXdW5bkf9DPz5bY0MP0mvxbOgyAHhkWLx?=
 =?us-ascii?Q?bKquyYySYsb/evCvjocFB2DQ+hv8lo3ekCkAnru2JUyZizL0pxZKwrXz7fCx?=
 =?us-ascii?Q?68yX9AUYLXlmtXEoTU76qy1IUdGEhHAYVaSH9YRYP/tqUDj8q04kQiSAi094?=
 =?us-ascii?Q?l+IDNBbRJCmDzg1Mh27H0vbta0Xgc75C0W8RlBsSV/Jz83rxvtVOFHzBhtt/?=
 =?us-ascii?Q?AcOrfYq2x9XEVAxxeH3+hb8fo+y7LaoZHb1cGAdA72bGKF+rq/RoyRRypLZ8?=
 =?us-ascii?Q?mRDS6TRQaGPHQ+6pyykX2J2J2SGlD6L6v5QCoZlnWBcpk9LamnEUEDVU8EPt?=
 =?us-ascii?Q?kNbrHoXfiq83l5t8niKWjh2zHPb4RhyCYRTPxVmWj2mPBSKDBonuOtWsDIyk?=
 =?us-ascii?Q?levYXpDpfmimyNNhrHezAIIQ0nMk2ptvXfNQb4EvBlKexnfn5gJO9RSXpTEn?=
 =?us-ascii?Q?HgYg0F+WHgwbO6wBS4Tx4vkf6LXNfDH1pDD559bcS3BC2d0+Pyi+sRNV6g8L?=
 =?us-ascii?Q?gMByNqepY4obaKS7ZO1535gIAgn/Cnp0xjrWGfPD7boE7ISml5G+NLaX8aBh?=
 =?us-ascii?Q?BvWe2LvOh1PZgCNEjkRzWyTNADhWLFsf2wWL2ENw0l2N0iIR4qu4F9U80RBv?=
 =?us-ascii?Q?EF0GAMLcZFTZWPLWfPNgR+/X9WmwcfjqbC2Sv0Ymcw1CvoGZRw5UjfPu2MIO?=
 =?us-ascii?Q?kfAsnswLhBJadGu67mjbi5BS57mEcPAqgCfNo2XLOXirdynL6qh9I3rYPd+6?=
 =?us-ascii?Q?umYT0Qr0685FEOKRhuBPq4u5Uye+h07LrG3mdmgSfyEEuy8H/yz6JQ6D0ivS?=
 =?us-ascii?Q?6Z5oVmUVr/ruFqmLAy3hZ5KAddBtQKQdzKgsz1Y7Yb+YNHmhKTsCgsroruK3?=
 =?us-ascii?Q?ibya760oVdItEwXAjEIfGz6VV2E8WBOKQgMa8rIbBQiKJ7Aqg8yjfgmLiJvb?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2208900-9683-454b-2c76-08de125707ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 17:10:13.4879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43vFyey/MGz07tqd8ny3kcRzpHY50TRyHB0x8R17X+71iMsyPtSEKohEA28QOEtwvoDnl2Wk93h+syHAtx8yHeNya73zMmuPkFw7eOu40+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9454
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

On Thu, Oct 23, 2025 at 08:51:45AM +0100, Tvrtko Ursulin wrote:
> 
> On 22/10/2025 23:58, Matt Roper wrote:
> > On Mon, Oct 20, 2025 at 08:58:22AM +0100, Tvrtko Ursulin wrote:
> > > Auxccs platforms need to be able to invalidate auxccs on the blitter
> > > engine.
> > 
> > Drive-by comment:  there's no auxccs invalidation on any platforms
> > except for MTL/ARL (and register 0x4248 does not exist outside those
> > platforms).  The blitter engine was not compression-aware on earlier
> > platforms, and after mtl/arl all platforms transitioned to flatccs.
> 
> When you say no auxccs invalidation before MTL what exactly do you mean?

Sorry, I specifically meant to say that *BCS* aux invalidation is only
relevant on MTL/ARL.  Aux invalidation for other engines did indeed
exist earlier.

> 
> I am confused because in i915 invalidation VCS and VECS was added in
> 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines"),
> and then expanded to BCS in 6a35f22d2225 ("drm/i915/gt: Support aux
> invalidation on all engines").
> 
> Are you saying even the initial one was wrong? It sounds doubtful because I
> don't think MTL was a thing back when that was written so people did get the
> concept from somewhere.
> 
> Maybe only 6a35f22d2225 was incorrect and only GEN12_BCS0_AUX_INV is MTL
> only, while the rest is good?

Right, only the second commit here (which added BCS invalidation
support) was wrong.  That was supposed to be specific to MTL/ARL.   In
fact, the r-b for the patch was even conditional on making it
MTL-specific, but I guess that got overlooked:

https://lore.kernel.org/all/5f846260-8416-fb19-bd46-ced39153a92a@intel.com/

> 
> All I can see are public TGL docs which dont even list 0x4218. And
> 972282c4cf24 is before ADL enablement so where did the info come from? It
> mentions bspec#43904 and hsdes#180917579, for what platforms are those if
> you could check?

Bspec 43904 is the register details page for
"Register_CCSAuxiliaryTableInvalidate."  Checking the "References"
information on that page lists the specific instances of the register
that exist for various engines, and the blit instance is marked as
"MTL,ARL."

HSD 1809175790 isn't terribly interesting here; it's a bug report
against the Windows driver that was originally root caused to a mistake
in aux programming and triggered an "oh, this is documented very clearly
in the bspec; let's clean that up" action.  The more useful HSD is
actually 16011159293 which represents the hardware change introduced by
MTL that added compression support to the copy engines.  Before MTL, the
copy engines couldn't do things like compressed<->uncompressed copies,
or fast clears of compressed surfaces (i.e., clears that just update the
CCS metadata to "this block is zero" and don't touch the main surface),
so the engine didn't read or use the CCS and aux invalidation wasn't
relevant.


Matt

> 
> Regards,
> 
> Tvrtko
> > > Add the relevant mmio register and enable this by refactoring the ring
> > > emission a bit to consolidate all non-render engines.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_gt_regs.h |   1 +
> > >   drivers/gpu/drm/xe/xe_ring_ops.c     | 118 ++++++++++-----------------
> > >   2 files changed, 46 insertions(+), 73 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 228de47c0f3f..12a7d7c73158 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -88,6 +88,7 @@
> > >   #define CCS_AUX_INV				XE_REG(0x4208)
> > >   #define VD0_AUX_INV				XE_REG(0x4218)
> > > +#define BCS_AUX_INV				XE_REG(0x4248)
> > >   #define VE0_AUX_INV				XE_REG(0x4238)
> > >   #define VE1_AUX_INV				XE_REG(0x42b8)
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index f384c9968859..87e467972070 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -248,46 +248,6 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> > >   	return i;
> > >   }
> > > -/* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
> > > -static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > -				    u64 batch_addr, u32 *head, u32 seqno)
> > > -{
> > > -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> > > -	u32 ppgtt_flag = get_ppgtt_flag(job);
> > > -	struct xe_gt *gt = job->q->gt;
> > > -
> > > -	*head = lrc->ring.tail;
> > > -
> > > -	i = emit_copy_timestamp(lrc, dw, i);
> > > -
> > > -	if (job->ring_ops_flush_tlb) {
> > > -		dw[i++] = preparser_disable(true);
> > > -		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> > > -					seqno, MI_INVALIDATE_TLB, dw, i);
> > > -		dw[i++] = preparser_disable(false);
> > > -	} else {
> > > -		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> > > -					seqno, dw, i);
> > > -	}
> > > -
> > > -	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > -
> > > -	if (job->user_fence.used) {
> > > -		i = emit_flush_dw(dw, i);
> > > -		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > -						job->user_fence.value,
> > > -						dw, i);
> > > -	}
> > > -
> > > -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
> > > -
> > > -	i = emit_user_interrupt(dw, i);
> > > -
> > > -	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> > > -
> > > -	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> > > -}
> > > -
> > >   static bool has_aux_ccs(struct xe_device *xe)
> > >   {
> > >   	/*
> > > @@ -302,40 +262,52 @@ static bool has_aux_ccs(struct xe_device *xe)
> > >   	return !xe->info.has_flat_ccs;
> > >   }
> > > -static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > -				   u64 batch_addr, u32 *head, u32 seqno)
> > > +static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > +				 u64 batch_addr, u32 *head, u32 seqno)
> > >   {
> > > -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> > > -	u32 ppgtt_flag = get_ppgtt_flag(job);
> > > +	const unsigned int class = job->q->class;
> > >   	struct xe_gt *gt = job->q->gt;
> > > -	struct xe_device *xe = gt_to_xe(gt);
> > > -	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
> > > +	const bool aux_ccs = has_aux_ccs(gt_to_xe(gt)) &&
> > > +			     (class == XE_ENGINE_CLASS_COPY ||
> > > +			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> > > +			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
> > > +	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
> > > +	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> > >   	*head = lrc->ring.tail;
> > >   	i = emit_copy_timestamp(lrc, dw, i);
> > > -	dw[i++] = preparser_disable(true);
> > > -
> > > -	/* hsdes: 1809175790 */
> > > -	if (has_aux_ccs(xe)) {
> > > -		if (decode)
> > > -			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
> > > -		else
> > > -			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
> > > -	}
> > > -
> > > -	if (job->ring_ops_flush_tlb)
> > > +	if (invalidate_tlb) {
> > > +		dw[i++] = preparser_disable(true);
> > >   		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> > > -					seqno, MI_INVALIDATE_TLB, dw, i);
> > > +					seqno,
> > > +					MI_INVALIDATE_TLB,
> > > +					dw, i);
> > > +		/* hsdes: 1809175790 */
> > > +		if (aux_ccs) {
> > > +			struct xe_reg reg;
> > > -	dw[i++] = preparser_disable(false);
> > > +			switch (job->q->class) {
> > > +			case XE_ENGINE_CLASS_COPY:
> > > +				reg = BCS_AUX_INV;
> > > +				break;
> > > +			case XE_ENGINE_CLASS_VIDEO_DECODE:
> > > +				reg = VD0_AUX_INV;
> > > +				break;
> > > +			default:
> > > +				reg = VE0_AUX_INV;
> > > +			};
> > > -	if (!job->ring_ops_flush_tlb)
> > > +			i = emit_aux_table_inv(gt, reg, dw, i);
> > > +		}
> > > +		dw[i++] = preparser_disable(false);
> > > +	} else {
> > >   		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> > >   					seqno, dw, i);
> > > +	}
> > > -	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > +	i = emit_bb_start(batch_addr, get_ppgtt_flag(job), dw, i);
> > >   	if (job->user_fence.used) {
> > >   		i = emit_flush_dw(dw, i);
> > > @@ -455,10 +427,10 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
> > >   	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
> > > -	__emit_job_gen12_simple(job, job->q->lrc[0],
> > > -				job->ptrs[0].batch_addr,
> > > -				&job->ptrs[0].head,
> > > -				xe_sched_job_lrc_seqno(job));
> > > +	__emit_job_gen12_xcs(job, job->q->lrc[0],
> > > +			     job->ptrs[0].batch_addr,
> > > +			     &job->ptrs[0].head,
> > > +			     xe_sched_job_lrc_seqno(job));
> > >   }
> > >   static void emit_job_gen12_copy(struct xe_sched_job *job)
> > > @@ -473,10 +445,10 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
> > >   	}
> > >   	for (i = 0; i < job->q->width; ++i)
> > > -		__emit_job_gen12_simple(job, job->q->lrc[i],
> > > -					job->ptrs[i].batch_addr,
> > > -					&job->ptrs[i].head,
> > > -					xe_sched_job_lrc_seqno(job));
> > > +		__emit_job_gen12_xcs(job, job->q->lrc[i],
> > > +				     job->ptrs[i].batch_addr,
> > > +				     &job->ptrs[0].head,
> > > +				     xe_sched_job_lrc_seqno(job));
> > >   }
> > >   static void emit_job_gen12_video(struct xe_sched_job *job)
> > > @@ -485,10 +457,10 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
> > >   	/* FIXME: Not doing parallel handshake for now */
> > >   	for (i = 0; i < job->q->width; ++i)
> > > -		__emit_job_gen12_video(job, job->q->lrc[i],
> > > -				       job->ptrs[i].batch_addr,
> > > -				       &job->ptrs[i].head,
> > > -				       xe_sched_job_lrc_seqno(job));
> > > +		__emit_job_gen12_xcs(job, job->q->lrc[i],
> > > +				     job->ptrs[i].batch_addr,
> > > +				     &job->ptrs[0].head,
> > > +				     xe_sched_job_lrc_seqno(job));
> > >   }
> > >   static void emit_job_gen12_render_compute(struct xe_sched_job *job)
> > > -- 
> > > 2.48.0
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
