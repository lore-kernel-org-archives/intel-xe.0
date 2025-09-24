Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAA0CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AF110E7CC;
	Wed, 24 Sep 2025 20:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbfeT+tD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B457F10E7CC
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758745816; x=1790281816;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6PxIjXTBZ+AmSKiBj2MnuLPn6ev/rc6szlPq64k/dlc=;
 b=CbfeT+tDTGonlAY3SIQ/FqhB00hapofw0b6pCLJSOUDMbM8oJWTbe7wa
 Yvz657+Dqa8GQaMbXhH6tmF6WXD3Q+uN85hcDZMGMoNgxSdjhYWuZBZO7
 V7RzZIjrUh/9DIh0BJD7qJBRH8v0eavTtEK9sP2ep2XUAI4gdL1DDhey4
 66cm2FaVNu5OVAkTwTsgIrYPwAG0mjCjPHO/TUqdltyJ1lpOVwG/KM/Pk
 PzgResNNWrrn+S7HCchLnB9xJj20pZzD9rEaSNVdORfwQEH9BU0lr9uth
 VQ9tTCA5EfyDPBUhrfOhr6dSDoV1UY5merc6wwiEq7P6CT5haCjxZSrU6 w==;
X-CSE-ConnectionGUID: QpUNaFj8TWm0qN2OlnPjEw==
X-CSE-MsgGUID: 0sP1f3/MTauUQaIbZK1UNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="48618902"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="48618902"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:30:15 -0700
X-CSE-ConnectionGUID: YSIiNgk5T2O1INjNBY/7vg==
X-CSE-MsgGUID: rfp+GC6tSMWECMW2vbzpWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176972283"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:30:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:30:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:30:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jq00Vj7f9Fs/Bl5NuxX4AfrN52mgPbl288U3CpMH9/QDmaDjNrjaK7WRyXeoBkYg/OjseDKmgG+UP999FyQGTiaOmXB9xkQnDpwzz0endHWMJDyLj0qvOOksB6PpaOVsKP1mBdMES7Xa5N7wTCjQvZWFzDR3F/gHFL3LmZBSXdCqNrYWUPneOcBzUq8niBnlj6xApUlDLVpq0F2f7ePcWkRlxlMvIQiyFxBc+q/QHKIUv0hNvhf7HVPYvlqsyBmWlF5gc/N7cXg+EO6/Mv1fYoxx9otJrVGa/sngFcmHnj4r0cYpN7cmUwfEI8Tr+yB9QBo1rUf6uUzBlAoHFT+tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7496jY3QLeNgQXC++ek9Ue1bfnTFP7hLBG1tFa/XoGM=;
 b=PEfmYtmAMCjg8WwP4gNfSftznksBhUDG1kSji/VeL7j7MlgzpEhOaAejY3VL8Ue+vzsvAAW3egnAoSm91D3l6fHWLF1Wt7UPerRe4/BvBIbDgfBk6/dVJ2yWVcree7sau8jWJPA1uaQKrMiy5PWo4D4fVyiPFlldvpBXL8RUUOOKDxTuicjHyKiSg2fZVg3Fkmc2QWrcgNJx4BWxQArhDXxjRJ7teMv/CcPz+5V2SZcd0b8jH+OktMg2cuMFd1+tp/WM/YgygKgnAlDE36sqDHdPUVf6OJpn7Zh1e2zLJXqQ55d2ZP2EyrIknbNXkTunT4LTybuv0Gklq08vz1Kxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 20:30:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:30:11 +0000
Date: Wed, 24 Sep 2025 13:30:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 11/34] drm/xe/vf: Add
 xe_gt_sriov_vf_recovery_inprogress helper
Message-ID: <aNRU0XdxBe2ZQZQo@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-12-matthew.brost@intel.com>
 <30efe3a4-0598-44e7-90aa-5283ed8247f9@intel.com>
 <aNRI24axOgeDirc+@lstrano-desk.jf.intel.com>
 <739191aa-d593-4080-a5ca-6d903da8acb2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <739191aa-d593-4080-a5ca-6d903da8acb2@intel.com>
X-ClientProxiedBy: BY5PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c11b449-d743-4d04-8d5d-08ddfba928d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tRQUgPENm2fnengErTu0Q7aUn/7UjpPV0tQi5otWZa99BpSdBTMhP7YsNILP?=
 =?us-ascii?Q?7JBiGk+UjWDVxqyZzkC6L8LBkpyaFpShcDl0qeQwK26Vk/UVgkDlM8W1HEBW?=
 =?us-ascii?Q?ZNHu2g8ofsu7EsnJaKWNvTWHfNMMVXdbihzXAgiQWLpCr/YpsWwiS6nDQ0bK?=
 =?us-ascii?Q?iLdUlLxNFPQ7Z8rVabZhzJ6UkGPtcXMe3i+ASzQ1L6mXkweQ2pwgneR8dFhi?=
 =?us-ascii?Q?rlNA3j5vnhKGIaCAjqaoZG4yvKUsatRk/9T05isQaZJp+PNtxPGploOs3UqX?=
 =?us-ascii?Q?+9ShtIt/1fFVNOytMSYiTEQy28ncLfjiA1PG9fhytNKKKMixheoubjodWtYm?=
 =?us-ascii?Q?QVfFqDUiWYBSrK+cIOWYxJNK7JzE+br4JgfRCebBrF98l47rnsCOCA15yNxg?=
 =?us-ascii?Q?DAKIct/mzUAF9M0jTJN2ymAbM6oiDzkkPidTVm4zN5xtEeiiwMIVa4DZ3+tl?=
 =?us-ascii?Q?z4q4VPV7J9jlsv3dzuZh+6/ewTU90WFxlvJAf/Ap5e5Ru04JZXmpZU9zj7dz?=
 =?us-ascii?Q?0PyFPkND9u1NdlHiAl2nG78Rqe3GT5zRJXB5xyp2VsQSxcxRjEmZxOvkWp8h?=
 =?us-ascii?Q?wDlixv0+XWQBHs1TqRPod/WigIjV05qSWgLJiUafehtMIpl2mUyyp2zDRuMz?=
 =?us-ascii?Q?nwz+m4Jcm7wceVv1JVdZexyQKAOyZzDDshbTRMzcziXUDjPyvgcH1FkmGg4L?=
 =?us-ascii?Q?+zrP+PhJbIRbQZemf0YuafvYKzbIbhjG8Wjf2crkFw1DRoB+H4e7myz96E3S?=
 =?us-ascii?Q?Mws+pCeV3Ugu+uXCbr2PzaGurVHv0plfRRU9JPUqusUDjgm5gjL6yZZ0jypq?=
 =?us-ascii?Q?W1w5K8IE4BAjdmkrPcEXlUxwkLXX/q1jjta4fBEMAbFBdMeUKXMrdM7Egjn/?=
 =?us-ascii?Q?W0oNMsMSykwfzhGpNEvUgzqCfrdob9tYFs7Y5ZYqKkFLI9D1mOxUpd3Tigjj?=
 =?us-ascii?Q?IOxdK7A3G2VoR0TZT3i6z397BqtyFPXd5Ne2Gd19wA0WMN2Vdh6H0QVIaphW?=
 =?us-ascii?Q?QNY6oqHk6D/XcJi+rnEnx6cX6Ni4He/JXQtFpFLRThBcj+oTrsTlaHmqKDZX?=
 =?us-ascii?Q?/MvGWFMv8XFKGBAWGqinfM5jiwn/qql3sHNSq5VmwWqphOja6xsmY81387MO?=
 =?us-ascii?Q?mB7nwCyxGEvMLgAf4bH/Bqx/EWhfGUg/wpOoJw1ao0S7HJzd/yCpLaJyouk4?=
 =?us-ascii?Q?vQLXmfzmadQD0v/uFE50Y++XAe6z9qEkFPqaDE4MVllBXWYp9oeJmN8r4ZbX?=
 =?us-ascii?Q?i/Bv3U+3z7qB28Lbk44jkwjhflhQ6Zpg/YXoGmT2PuDhG8hvtBMdR3d8p50z?=
 =?us-ascii?Q?IV5clBYiyDOybD0Gpxg33gPMH7Hdtuto8dTT46OroPD10SyMoxE9G63MqTP7?=
 =?us-ascii?Q?AlmLin8rdBwHVI9FAIu/cmd3dxkP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TWzyBHY+oDfbVzuJPfBfIsNhAXPHrhB4Bq1Qd2AF3/PfUf91GdRbZvQv7583?=
 =?us-ascii?Q?Ug+0IPH0Q6NqeMGcCWltIprbINdLlJ15KEjWAxHIwEIXOWXJNeduUt4RjWUY?=
 =?us-ascii?Q?ZmEXi+zl4A79CBTbfCIZ+q/5yO4JrOZbTPtqv1kwSnylvlOmhf3dF5dB5tJD?=
 =?us-ascii?Q?q3wplk2xtj1bSUeXVxftrA1hTISfzQhFXq8iMy8d64mO0hCY6QA6xrxX91FR?=
 =?us-ascii?Q?q/dNuVj0tPQ0AdjXXFbmuiTcndZHJjFl2xlyEO5MrDhwgnbZf3B/faa3RdPz?=
 =?us-ascii?Q?K6Z1uKNsKvqvdJK87byVDFBI+ZEvzn2qOU1FWibrSgfCjlg9NU4ENSZjNm7Y?=
 =?us-ascii?Q?Er/6HIHj59HNAPggJ+C9o0kIdMGJZ9erttLD4vt+/RMoz9lnefQSFqprt7MZ?=
 =?us-ascii?Q?EFxnciE51KGlDkWXnK7ExpabpHuPraBJB9dtekuZinn1MaqaSaJ6r4sty2xV?=
 =?us-ascii?Q?m3L7kgC4jU8Pc3Ajfbaa/csaU94SyiM4v+cgppevxmabO9Kld8WwU4ifGcjw?=
 =?us-ascii?Q?ZriqghliLYL9t/50f+cJrCCqItYV0jTQfDeUdOUL67unYolzNybeZFaT9Kk6?=
 =?us-ascii?Q?t19cF0ia/x9F60ChE4Ry9DIQC8EOKMgyczdUq8MIvzd4hMpuIj2iGwMiCany?=
 =?us-ascii?Q?WI2T65miYhqKDkIPggEMoTAcdOgHN9nngzD3KkE1SSWNbwzBMb1tlBEZyNbn?=
 =?us-ascii?Q?YajAlEdJAi8ObwJ19BdHrwKUTFZpAD+JXsywwKEzsAGfp5eYnhnhXPesN7sh?=
 =?us-ascii?Q?ZEVpdkbpNhLN7vjMaCdzzSv7gPngG6pi11UDQbUoUu5pLH8H48+3oCPxisGy?=
 =?us-ascii?Q?WxcMb3mv4HQMIG/qkpah50CM8/FEVZ5TLzJKmJCbMv0cfd4RTsvtgFaOEGh/?=
 =?us-ascii?Q?OnCbLERYTfTVzYk9A3O1xzWAleDCnbjG0P+vouXca+Bdij3wvWrSFbj3VVLn?=
 =?us-ascii?Q?KVRykvFyT/QmNPMqiB5mDhyzNn5gAJ+8FeKz5KzK5ug1ncKReKb/HxzjD2qV?=
 =?us-ascii?Q?Ifoi02ToQrUjcoSKYu1NnFP0IheETtPgYxLBWebjx22piX8fxVfWvGLmsyb9?=
 =?us-ascii?Q?6HrbKyGxaoZlPLYnLj3hD9AMtZ6SI+W4paghKUGIPV4k36Q6RwDKufmo73ts?=
 =?us-ascii?Q?ybUzv4g74acYiOh4CsClzgZD5bGymHUntE2FjvvNqOtqGkPKz/LJYzu87TwJ?=
 =?us-ascii?Q?RDkn+BDIvaTQyQGvMt7qQ7AxdEf8+LwKZdvUFmD+BNrgtn0ZVLecK9B4l3nU?=
 =?us-ascii?Q?fv81RO0vatQY6uzMHx+J5ko4zDSBAwdbI8XKBqrH1KyFzH+JSH2cYt+Z1e1h?=
 =?us-ascii?Q?k+FFUc5q26CU24H5z0DRdnK9UR712YYT7fB8XO23vWt36EHLJ2GEQc/pHasL?=
 =?us-ascii?Q?HMnl3gm1+7acnAE3aplhntQnDUDJeVe2fs6euSu5H6mF+DitzsodWoikyciI?=
 =?us-ascii?Q?LJfjyA3YpGq6f61e8//J2sQvAsaiHn6ekl3par5kPVgHX7188pkmXHK/jwV/?=
 =?us-ascii?Q?ahLr79nZp+MxCwfuKZBwg5FX/VopISdHPOZI5eyPRIxCE8bWolh8phPbykRU?=
 =?us-ascii?Q?Cw39xK9Ao/QhA42RvPXsFE/XZTMfNg1ugZ4HCTzs6TyvZrAgSC926gkiXpJR?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c11b449-d743-4d04-8d5d-08ddfba928d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:30:11.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beEQ0CG5yF0YUL17Y99gwYBCe2aYUUIbr6uAP/gtC8ta5gifNtIRGqeXln+rlCA+Df6YasE8nWmctgKzsH4lwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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

On Wed, Sep 24, 2025 at 10:12:10PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 9:39 PM, Matthew Brost wrote:
> > On Wed, Sep 24, 2025 at 12:14:28PM +0200, Michal Wajdeczko wrote:
> >>
> >>
> >> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> >>> Add xe_gt_sriov_vf_recovery_inprogress helper.
> >>>
> >>> This helper serves as the singular point to determine whether a VF
> >>
> >> hmm, this "singular" looks like a GT-level only, not global
> >>
> > 
> > Yes, it is GT scoped. I will adjust the commit message.
> > 
> >>> post-migration recovery is currently in progress. Expected callers
> >>> include the GuC CT layer and the GuC submission layer. Atomically
> >>> visable as soon as vCPU are unhalted until VF recovery completes.
> >>>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 ++++++++
> >>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
> >>>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
> >>>  drivers/gpu/drm/xe/xe_memirq.c            | 48 ++++++++++++++++++++++-
> >>>  drivers/gpu/drm/xe/xe_memirq.h            |  3 ++
> >>>  5 files changed, 79 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> >>> index 016c867e5e2b..c9d0e32e7a15 100644
> >>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> >>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> >>> @@ -26,6 +26,7 @@
> >>>  #include "xe_guc_hxg_helpers.h"
> >>>  #include "xe_guc_relay.h"
> >>>  #include "xe_lrc.h"
> >>> +#include "xe_memirq.h"
> >>>  #include "xe_mmio.h"
> >>>  #include "xe_sriov.h"
> >>>  #include "xe_sriov_vf.h"
> >>> @@ -828,6 +829,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> >>>  	struct xe_device *xe = gt_to_xe(gt);
> >>>  
> >>>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> >>> +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
> >>>  
> >>>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> >>>  	/*
> >>> @@ -1172,3 +1174,18 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >>>  	drm_printf(p, "\thandshake:\t%u.%u\n",
> >>>  		   pf_version->major, pf_version->minor);
> >>>  }
> >>> +
> >>> +/**
> >>> + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> >>> + * @gt: the &xe_gt
> >>> + *
> >>> + * Return: True if VF post migration recovery in progress, False otherwise
> >>> + */
> >>> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> >>> +{
> >>> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> >>> +
> >>> +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> >>
> >> this is xe_gt_sriov_vf function, so it is expected to be called only by
> >> the VF code, thus we should rather use xe_gt_assert here and the caller
> >> is responsible for the IS_SRIOV_VF check
> >>
> > 
> > That is not how I have coded this. I blindly call this in various places
> > and I don't think it could at call site to determine if it is a VF as we
> > have if (VF) statements all over the driver. If perf is the concern, we
> > could move the IS_SRIOV_VF(gt_to_xe(gt)) part of function to static
> > inline and reset of the function in an exported function.
> 
> inline will work, preferable not in xe_gt_sriov_vf.h ;)
> 
> static inline xe_gt_recovery_inprogress(gt)
> {
> 	return IS_SRIOV_VF(xe) && xe_gt_sriov_vf_recovery_inprogress(gt);
> }
> 

+1

> > 
> >>> +		(xe_memirq_vf_recovery_irq_pending(memirq, &gt->uc.guc) ||
> >>> +		 READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
> >>> +}
> >>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> >>> index 0af1dc769fe0..bb5f8eace19b 100644
> >>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> >>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> >>> @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> >>>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> >>>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> >>>  
> >>> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> >>> +
> >>>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >>>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >>>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> >>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> >>> index d95857bd789b..7b10b8e1e10e 100644
> >>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> >>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> >>> @@ -49,6 +49,14 @@ struct xe_gt_sriov_vf_runtime {
> >>>  	} *regs;
> >>>  };
> >>>  
> >>> +/**
> >>> + * xe_gt_sriov_vf_migration - VF migration data.
> >>> + */
> >>> +struct xe_gt_sriov_vf_migration {
> >>> +	/** @recovery_inprogress: VF post migration recovery in progress */
> >>> +	bool recovery_inprogress;
> >>> +};
> >>> +
> >>>  /**
> >>>   * struct xe_gt_sriov_vf - GT level VF virtualization data.
> >>>   */
> >>> @@ -61,6 +69,8 @@ struct xe_gt_sriov_vf {
> >>>  	struct xe_gt_sriov_vf_selfconfig self_config;
> >>>  	/** @runtime: runtime data retrieved from the PF. */
> >>>  	struct xe_gt_sriov_vf_runtime runtime;
> >>> +	/** @migration: migration data for the VF. */
> >>> +	struct xe_gt_sriov_vf_migration migration;
> >>>  };
> >>>  
> >>>  #endif
> >>> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> >>> index 49c45ec3e83c..94d5d6859aab 100644
> >>> --- a/drivers/gpu/drm/xe/xe_memirq.c
> >>> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> >>> @@ -398,6 +398,23 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
> >>>  		memirq_set_enable(memirq, true);
> >>>  }
> >>>  
> >>> +static bool memirq_received_noclear(struct xe_memirq *memirq,
> >>> +				    struct iosys_map *vector,
> >>> +				    u16 offset, const char *name)
> >>
> >> maybe instead of duplicating code of memirq_received() in 90% just add there
> >> the "bool clear" flag?
> >>
> > 
> > Sure.
> > 
> >>> +{
> >>> +	u8 value;
> >>> +
> >>> +	value = iosys_map_rd(vector, offset, u8);
> >>> +	if (value) {
> >>> +		if (value != 0xff)
> >>> +			memirq_err_ratelimited(memirq,
> >>> +					       "Unexpected memirq value %#x from %s at %u\n",
> >>> +					       value, name, offset);
> >>> +	}
> >>> +
> >>> +	return value;
> >>> +}
> >>> +
> >>>  static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> >>>  			    u16 offset, const char *name)
> >>>  {
> >>> @@ -434,8 +451,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
> >>>  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
> >>>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
> >>>  
> >>> -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> >>> +	/*
> >>> +	 * We must wait to perform the clear operation until after
> >>> +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> >>> +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
> >>
> >> but the VF recovery "inprogress" shall be already set in the top level
> >>
> >> 	xe_sriov_vf_start_migration_recovery()
> >>
> >> even before the GT-level recovery starts, where is this race ?
> >>
> > 
> > If we clear the interrupt it here, this is before the IRQ handler is
> > called which flips the software bit for "inprogress". There would be
> > window where xe_gt_sriov_vf_recovery_inprogress could return false which
> > is problematic.
> 
> but who calls that recovery_inprogress() and why should it be problematic?
> 
> note there might be still other threads that will finish some actions
> (including sending CTB) that will just be stuck there until we start
> the recovery, so even if recovery_inprogress() returns false for the
> small window that shouldn't change the picture
> 

No. Read 'Waiters during VF post migration recovery' in [1]. That should
explain the reason why this is required. Let me know if what is
documented there is unclear.

[1] https://patchwork.freedesktop.org/patch/676374/?series=154627&rev=2

> > 
> >>> +	 */
> >>> +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> >>> +				    name)) {
> >>>  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> >>
> >> what if new MEMIRQ will arrive just here
> >>
> >> is it ok that we will clear it immediately?
> >>
> >> the whole memirq flow is that we clear irq byte first and then process
> >> it, so if anything comes right after we finish processing will be noticed
> >> on next iteration
> >>
> > 
> > I don't see why that matters in this cabuse. In either case multiple IRQs
> > could happen and single IRQ handler runs.
> > 
> >> I assume any races due to double migration shall be handled on the VF2GUC
> >> communication level while sending RESFIX_START/DONE, not here
> > 
> > I don't think it should be possible to get multiple RESFIX_START IRQs
> 
> I assume the SW_INT_0 is set on every migration, even in case we didn't
> have a chance to read it and clear it, or we didn't start (by sending 
> RESFIX_START) nor finish (RESFIX_DONE)
> 

But can migration be triggered and then another one before the initial
migration completes? I just don't see how that is possible or how it
wouldn't break the world (i.e., The VF of GuC explodes somewhere).

> > before DONE is complete. This existing code upstream seems to handle
> > these cases, so my series attempts to handle this too, but it seems like
> > something that shouldn't be possible.
> > 
> >>> +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> >>> +	}
> >>>  }
> >>>  
> >>>  /**
> >>> @@ -460,6 +485,27 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
> >>>  	}
> >>>  }
> >>>  
> >>> +/**
> >>> + * xe_memirq_vf_recovery_irq_pending() - VF recovery IRQ is pending
> >>
> >> this function isn't really using anything VF specific except that on the
> >> VF the SW_INT_0 means "migrated"
> >>
> >> maybe we can drop the _vf from function name?
> >>
> > 
> > Sure, so 'xe_memirq_recovery_irq_pending'?
> > 
> > Or 'xe_memirq_sw_int0_irq_pending'?
> 
> 
> > 
> >> 	xe_memirq_pending_guc(memirq, guc, bit)
> 
> I would make it more generic and provide bit param
> 
> note that xe_guc_irq_handler() also takes a bit
> 

Sure.

Matt

> 
> >>> + * @memirq: the &xe_memirq
> >>> + * @guc: the &xe_guc to check for IRQ
> >>> + *
> >>> + * Return: True if VF recovery IRQ is pending on @guc, False otherwise
> >>> + */
> >>> +bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
> >>> +				       struct xe_guc *guc)
> >>> +{
> >>> +	struct xe_gt *gt = guc_to_gt(guc);
> >>> +	struct iosys_map map;
> >>> +
> >>> +	if (xe_gt_is_media_type(gt))
> >>> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
> >>> +	else
> >>> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);
> >>
> >> nit: maybe just calc offset conditionally?
> >>
> >> 	u32 offset = is_media ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> >>
> > 
> > Sure.
> > 
> >>> +
> >>> +	return iosys_map_rd(&map, ilog2(GUC_INTR_SW_INT_0), u8);
> >>
> >> as we have helpers we should use them
> >>
> >> 	return memirq_received_noclear(...)
> > 
> > Sure.
> > 
> > Matt
> > 
> >>
> >>> +}
> >>> +
> >>>  /**
> >>>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
> >>>   * @memirq: the &xe_memirq
> >>> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> >>> index 06130650e9d6..476b8cba179d 100644
> >>> --- a/drivers/gpu/drm/xe/xe_memirq.h
> >>> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> >>> @@ -25,4 +25,7 @@ void xe_memirq_handler(struct xe_memirq *memirq);
> >>>  
> >>>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
> >>>  
> >>> +bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
> >>> +				       struct xe_guc *guc);
> >>> +
> >>>  #endif
> >>
> 
