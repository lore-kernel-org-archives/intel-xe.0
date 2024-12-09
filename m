Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D5DE77181
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 16:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B8E10E4D4;
	Mon,  9 Dec 2024 16:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsrUs/kb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D2310E4B6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733762834; x=1765298834;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D2D8Bb6xLupQTfqXaNP7ChX3VA3TvF2XxIvRAehDFHE=;
 b=XsrUs/kbsmNygKWWTx+QP9m/YhSuFYBxAiURenybU7acQgipNP6xfZHe
 SNVArzunF9nRxsmPNpAY785fNQskJCzmAgN6mLJefIemGrcHAYpz1sSMt
 ALw22cYOwlkFTYUgXKsMZqp5gJgSOFioC090HJyMaehSwC6WC4mh149nG
 6Ch2CUYRzsTt/e5p/uTqvEFPfqE2vdmhmtqosI/3YGf6wJMEd0Q5uLpRM
 3/HHerm4jEBbJyz49/J0NaYknQvNQcpyGLEOdzScvGOoDqU75Tk6XTtw9
 QT4ZCktdofp3SGohhg3Q4oQKBtqwf5SedeJtT5hfzQsloAMTqC3SJ7iHx w==;
X-CSE-ConnectionGUID: vsNxBg/fRyqc6cHYvj7/kA==
X-CSE-MsgGUID: kg/0/rrOR6SDc5bkXXdieA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34128596"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34128596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:47:13 -0800
X-CSE-ConnectionGUID: 3xGHHx7iREeDx5uJCBciQA==
X-CSE-MsgGUID: 1ob8JBbRQwer2piqQUdCaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="94829236"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 08:47:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 08:47:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 08:47:11 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 08:47:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BasHDYkYu3i/KPqvmvJA+sXBtN1WGsiu7rlWkku1+6r/AROryg3Ed09E6StG+QsDn4HHuhxFNVuq6mibrFVR6dEUzDiUffkbQm12+39oF9Hx0mS8ghcXhsXZG8HqA1NW+WFLbgzt2q1nPQoWqZCEKujhRvQN6fOiqmhvuhffvwky2UyvQ6nr0X0SP8vSs/LZ6pR7CDlEaZ3HE1LRQrJsIPuuBI9zjrIZt78LIWSgZApby5AxcEiHnMvDbOtqehEk+1x+NESG98DHpFbfCA/2gW66IO4Hp/sUScRfDyGsY+TQFfq5RPiuaY8k9FhHfXX1yISoPc7WjCsSZTrRzAhl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0MRpp4iZ4+3oSLCG+KRALmxYCWez3OhWRMgB/gECV4=;
 b=g+RCT5ydxULLgW2aAxkmLpXviSooDwbiROkL1hK9Ge+hzuk2KaKBtR3/kvCF+TRTateEJWxd8Vsm36K9/Z6aTrpRVxRTSMs5Rkfa2a4s7diugqLmG5JmVZQcWaRY736bOTbXwHHiqSD4O5nRBbUUI224RcuVb6M3q0amv7xJHJyX924i6riRdlqjkxAiRp0MxcRPOBqMMR3TiVp/wbuP0Ig6OquVEUUiQSHRlYPb7Nj/rtPBGnPHHiJBIQph7RwqoMaODFPk1BUVA7mPoZmF5iFp/1S4Gvfmk6mMXO3fc2faHNu/zWW4F7yeJDU7ytCYXoovXXxD/caYB3dolzxM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 16:47:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 16:47:08 +0000
Date: Mon, 9 Dec 2024 08:47:02 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
CC: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <intel-xe@lists.freedesktop.org>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Michal Winiarski
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>, "Piotr
 Piorkowski" <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't apply Wa_22019338487 for VF
Message-ID: <20241209164702.GT5725@mdroper-desk1.amr.corp.intel.com>
References: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
 <20241205181814.1484975-3-jakub1.kolakowski@intel.com>
 <20241205210436.GH3224633@mdroper-desk1.amr.corp.intel.com>
 <d083b661-04ee-4201-8962-480a093924a2@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d083b661-04ee-4201-8962-480a093924a2@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e80f252-c482-4cfd-7600-08dd18711eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RrnCkTDwws+jtOnDtSyHpa/46ZAaC0xPFLCNR7lD+JnpmKLs6X6aSjHE6HL1?=
 =?us-ascii?Q?l+xlooVQ/0NM1WsazTQQh5eWSC354EZ2yGlfs9ufVS4+7aLrVToRItUkTaW7?=
 =?us-ascii?Q?NnlJU64WCi+Dm2JJSyJbbyboqBlRl0/opXVieuJ0NZsqQSFJwheb3e8zgY7j?=
 =?us-ascii?Q?agL9qCl/3ccWcCEq63Kt31BTN6OSBzdeAd4B0T1aGdj/8qOzSstqcX1qkj4c?=
 =?us-ascii?Q?gyezU+Y6KbRC6LjyBc74mhkylQigig3IfQbYXjkEXrOcI8lNJa3PTFW6ni6u?=
 =?us-ascii?Q?h6YkqyL5bwHOLBGkkElAhkFwUNY3mcYloed1Muqru012Lv2/RfnXXhD1bEW4?=
 =?us-ascii?Q?Zi/xa4YdjVeLU5n5CFbJgWy8y+PQYnh6JUdTBSr88bkBt0w5XIQFTes9tTGo?=
 =?us-ascii?Q?rTbnhMo64o0cWuteB7yE//LFZn8raZiYxyQBsLyOE/AvwawfAjRKYnCB3YG1?=
 =?us-ascii?Q?88gmV2JPp97WJt6J2D4odISJDuWWvziS5nE6U0KA7k1rKo3/vM8xOVrYY/r/?=
 =?us-ascii?Q?YdzpHyR51DzpmbKrsVtelL03JaxZmfDvCDFOuG34p/ffurs3WPpr+XOrLmmK?=
 =?us-ascii?Q?VCMMp4zh4oBi/bk3yhKg1e3WfH0GMNa5jhClxTKLdcjISuq75LOP77kOd+HG?=
 =?us-ascii?Q?PP2DSAq0wCL/qCEU3aygWMGyf5lAhmxESp4iGsR8Obh9GDWPefgoniGsIAa7?=
 =?us-ascii?Q?gem6i8LKf6ioCm8ot2EEDTqsr5Te3UynsrbnJbTFHMD5o5XO9pmNgNUikMCE?=
 =?us-ascii?Q?JScHXdUWTE5aw2lEGZ8fFHnYPu+26ARrgP0M2fKpBiV+hkNLEg9gLyUuUuAp?=
 =?us-ascii?Q?T+nbqvYxveDPT624Ki/2DrPSd0zXw96RRFX8Nl/jalUid0nZdSW0k9d1vi6D?=
 =?us-ascii?Q?nve9MvHmF2lJxWbuH/Ycp6pkD4LExc68hp9Bq1qwjYQ8DYPRSULR/xqOD9xv?=
 =?us-ascii?Q?aHoDCLex5oUs6zTdxb9Nuo+6QcX0tASsdcNaHu32Yi/KL7W69LOOUh23tpPC?=
 =?us-ascii?Q?XBLEvnTOU8Z6w7WS5eJ5Iws9gGCa1BLYA7E1fvNm/zKAoGy49S3OI3v3LVD4?=
 =?us-ascii?Q?w/3/zLqeGQysVvbDZAjz7uf7TRteCfmRSB3r/juU0w2/a++QQ9+0OQAhntq/?=
 =?us-ascii?Q?0NmUnNnGiOy7TeJtAAfnVP9OiHq3ArKUxEVTFnJqY6lFvoNcesmuw9BTIOVU?=
 =?us-ascii?Q?pET8rwfYJQs/8PziSp1ttWHYmWOunFAJAtSTsXkhI7Bq9sxHECuhFgcx2rKr?=
 =?us-ascii?Q?xSsjUpi+l2PHixH/J14RdmGDdYuBs0n9hhTeGS8Onw60eusGKyiMkD+Y0brA?=
 =?us-ascii?Q?15vOlKC44sn0lWYg0MIjSzZU3drgOFsgkP/cayXzvtoISQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?awDF9hqbr7m9yJdA/yu0+iPCqx564bEjQNww2sBeRGgFSREZB3/GTmciivO5?=
 =?us-ascii?Q?fILWJ6aABWuKmdGMujjYRM6MUX/wjcV6UtSwoWIOD/14Ez+hFLro9vvEd7U+?=
 =?us-ascii?Q?RbEy8BlGMCbipiVfqi22p1WljX94kKDI6yDyenysfTfR4QNOtder8cPMq1Xh?=
 =?us-ascii?Q?KrWoh8CAhKrzKtQAtJvF2ClrhxHsuQnYC77EmnpglL+L5zcGYbfxTpbHtpjK?=
 =?us-ascii?Q?wiJY/Nug502Cteifo3Qlwo7ddgE06tMnFpeCoP80hvjmEAHPeWenubyZmxKC?=
 =?us-ascii?Q?zloKCGk26E44LVmbksd2NkqPDxQBqex1sB0ZxQGyUsp2F0rxThp0b9ou/LB1?=
 =?us-ascii?Q?Zp45XJyO27gQ2B/Oz32LIDlgnLTvxogkpNEGUarlPbIL+/qCMILvMz7qfWfi?=
 =?us-ascii?Q?05XZ3+igw3mfxiVCJeDL3lWMumxCVGTr1rrfdUfD84Mi6E3POfT4Y6RapNUY?=
 =?us-ascii?Q?Npibl7d6ZgI+KsjVD3zHGIGtE8s6+Svo8QQoq6WdJNF4GFpgatHdiRbRwaxO?=
 =?us-ascii?Q?AnQi7DfJihwXcHDqI8OB/euHAI14Y+IGNOekWSMmFFY+xuX9zrauTjTTDmUB?=
 =?us-ascii?Q?FT5VhT0xFQa2ZbAarBgEpTU5ApLaCQzJdl+KKKxwmgIbm2SLocbK0zJuqLgC?=
 =?us-ascii?Q?NUMEmFVHW62NpxnaNDATAEu0w9i7LeL6jCy4w0t8BvV+NgmJg5u0E6NCDW/E?=
 =?us-ascii?Q?x0HL3d6zwo73fcIk/UeYi+0ZUtPWcR3wce0BJsB9kqYT3XqTlm4OCpFzRpEy?=
 =?us-ascii?Q?bUqYZGT7upjfF/7dvORuw9FNYRVEoSSJKHG6zi7iUoqK4035AJvqIziOu4EM?=
 =?us-ascii?Q?a8epsYI82Y6fAPynJZDqDGF/bLVxqdz7lxavZ+/t86+FyUbw/VS0DjH8vr0Z?=
 =?us-ascii?Q?rNpU7D4exK0pD3zWdO67jqagigXa/rFeaQIMC2H866c5ezl/7WXKjOv4eBnB?=
 =?us-ascii?Q?WPlw3oe2jJKzDAiVTsH/vLR3GIgCQTS2NN8i6ufUQtMQBuA7SO6wJlE/ox3U?=
 =?us-ascii?Q?crVYvkA/cbo7nhZboEx+/T7Z2/SRS0ZhTNsri+pfUvGx7jMRBH0fpWOfx5Af?=
 =?us-ascii?Q?LjO2+UjiwD2mcm690xdOQjRTXjOlmnX7t835tBIboLlEsK0glkLfUXISjYsq?=
 =?us-ascii?Q?ysveEfwxIgdAM4NfKPWRZMOhY4W3KgCoNY23JiJsEaaFDZygRgdgiPAEN9UX?=
 =?us-ascii?Q?kJ3c2gUW88uXa0Nov4uvucJo2QbSVM5SZcoRnWcjcaSMoWLUXTZgLrhHRAW1?=
 =?us-ascii?Q?2n/n+onQn39qn3csCG7+obj/yfv3DUl2eUf+eQV6qmhF5bPmC8HoJcwqFMaP?=
 =?us-ascii?Q?/15oOOHPbBCbi+/JLV3os+By0W58tZiJ4SZCam5sbdLJAOeTz2AS/ayhzxje?=
 =?us-ascii?Q?ff0bNVybs+kdKb7wgKTM/mXIX2iIbrBClVlmqJW12b535Zibcc+T1sCIAxJ2?=
 =?us-ascii?Q?+4jDp0YapZHf1btiY7TSOZS1u7IZVjrCaS4t2+06wVXIFT1OW95ty9HADGND?=
 =?us-ascii?Q?Gza1Z7fZV2N/mtpcXYqSM1yuc6lcMdJfi8MiMSNmBjlTg9Zf+/IooscSapDG?=
 =?us-ascii?Q?gPfigPzbGrHhASeej/69eWEs4LX0THpI+VWJrZwg7tgGGWLbnvwTNfS1BXNW?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e80f252-c482-4cfd-7600-08dd18711eb5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 16:47:08.3872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTIV/6ogwh+KRl5crzT7d6E4T1E7ROaDJ33IziDY+a8702mMKi31m+n/yUgIaZ+ypzOiZeleZz6rpfh4u3nrVwOL7JlMZ2u2BaPtN1I5Gqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
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

On Mon, Dec 09, 2024 at 10:44:42AM +0100, Bernatowicz, Marcin wrote:
> 
> 
> On 12/5/2024 10:04 PM, Matt Roper wrote:
> > On Thu, Dec 05, 2024 at 06:18:14PM +0000, Jakub Kolakowski wrote:
> > > Don't use Wa_22019338487 for VF.
> > 
> > Would it make sense to add some kind of "PFONLY" RTP action that can be
> > applied to workaround definitions that should only apply when running on
> > the PF and not on the VF?  Then we could just add that flag to this
> > workaround in xe_wa_oob.rules and we wouldn't need to change the
> > callsite(s) where XE_WA is invoked.
> > 
> > I'm not sure how common PF-only (or VF-only for that matter) workarounds
> > are going to be going forward.
> > 
> > 
> > Matt
> > 
> 
> As first step I would add something like NOT VF,
> that should better handle the case SR-IOV is disabled.
> 
> So adding a helper to xe_rtp.c:
> 
> bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
>                               const struct xe_hw_engine *hwe)
> {
>        return !IS_SRIOV_VF(gt_to_xe(gt));
> }
> 
> and updating rules:
> 
>  22019338487    MEDIA_VERSION(2000)
>                 GRAPHICS_VERSION(2001)
> -               MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> +               MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
> FUNC(match_not_sriov_vf)
> 
> It looks the rules on each line are ORed, so here the generated output is:

The rules on a single line of the OOB rule file are AND'd together
(unless you insert the explicit "OR" rule).  But the separate lines are
OR'd.


Matt

> 
> { XE_RTP_NAME("22019338487"),
>   XE_RTP_RULES(MEDIA_VERSION(2000), OR,
>         GRAPHICS_VERSION(2001), OR,
>         MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(match_not_sriov_vf)) }
> 
> --
> marcin
> 
> > > 
> > > Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> > > Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> > > Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> > > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > > Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Michal Winiarski <michal.winiarski@intel.com>
> > > Cc: Narasimha C V <narasimha.c.v@intel.com>
> > > Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
> > > Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index 05154f9de1a6..11aba2437818 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -238,7 +238,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> > >   	if (ggtt->size > GUC_GGTT_TOP)
> > >   		ggtt->size = GUC_GGTT_TOP;
> > > -	if (GRAPHICS_VERx100(xe) >= 1270)
> > > +	if (GRAPHICS_VERx100(xe) >= 1270 && !IS_SRIOV_VF(xe))
> > >   		ggtt->pt_ops = (ggtt->tile->media_gt &&
> > >   			       XE_WA(ggtt->tile->media_gt, 22019338487)) ||
> > >   			       XE_WA(ggtt->tile->primary_gt, 22019338487) ?
> > > -- 
> > > 2.25.1
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
