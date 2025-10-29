Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4569CCD1BF
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 01:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DBE10E6CE;
	Wed, 29 Oct 2025 01:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrQHDMpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F5B10E6CE
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 01:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761701670; x=1793237670;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gFqUxPwh2sRRJjVZbwJueELEpbfdSNLIgg6HL3eK02o=;
 b=WrQHDMpkqX77fY+p6hVgzh4fPq0usMCydRSyALR6rcVFchKG3egKFkXK
 AzVJOWyTsNuRF7GiqpZRdTqN/KArQWsa1UUm/zYqIb1Sqoa84Lmpp4J4a
 /GdjtwnlWlyyVfafBX5d+xil5lboNxdA7Nfcp3/urMFymnWYnRkIct+/i
 RzUFiI6gWVixyYNs67kCHSDqQM+wMqxBSb12K9EXS4VdrBzoVG6f4HplT
 RWjhBdb7+HjKbTLW2E0LIsbKTx7mp5ms7PW5xLCEF7Ubj3XbNRwOSIV/u
 Ln0SExlnwHNFtjZfpjAQcDZ9ZosF2M238R38YhZsNEbDkCTFK9ySIdj9U Q==;
X-CSE-ConnectionGUID: b6NGaB1aQ1SpzG3szFrTFg==
X-CSE-MsgGUID: ia12xjCwSlulfb6LWFuWww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63910002"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63910002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:34:29 -0700
X-CSE-ConnectionGUID: 1+OGjO4ISVqqIpMMVAYk+g==
X-CSE-MsgGUID: VD/LgyGER5+BgQceS7nNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="216385220"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 18:34:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:34:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 18:34:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 18:34:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcNhTZziKjSfyR0nMHaDe7wKhxL/Tlwf3h90oMDlJ+3EfTabXtWn7aNMMaIoUoiwZCP8lTfNSgKitRcN8WAfPs5wD1Vss94S494SiYYyuNIL2v5pi1r9VqNEp69Dtbd7MU2gOH4OLLEnMmvUPrR75pQKpObOHo/l3S4ZRX/1gii8HhRtSuq77hIg7pSSBwb6OIysS/2lbjGcjcPhrFIurE4aITBwdxXCPV5T4Ze03LeHdt+TuKoOfseVOfI11jniTfawF2mQ3QNKT4gltyXsScfuODbpmtAGcW12/Yaes4TSin6pXE2Nnq3xbzbrqanbGIuE1Nf4bvuevspPdeFS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUVEOP5hvZBu1y3gPEAEH+znABJXKpgyIul9FNf78Qo=;
 b=SzIWWwcUrtIWsHb6iX3+k3x8HF+01ZDfyPZhvKnAtN/BN/UtLn896uXoP2pTSPYP6JQRttXF/37kqU7iECq9uYpFZKgwaldqcM+WQPLRCoiRRBIP7nlujtBflO4JPi1qTdJgjYVgsJTy6Xc1fP2LLg6A0VT5e1BtAF90aF24bXd4EgD2uNWkHgAmo+0AdOUPwmEbpVRiz5AzSVE97wCl0HirW5eBOucNHfPfl6nm6hqBcCT1DJ/WhvrjBoTuu/U9Ld93TBWd1iRHnRYD8+LZgFf1ZeFXgrpi48OvSi43TILTpFqQQ4NiPbhDu6Z5RvAq+c+BkKw1d7+EELrSokwAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 01:34:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 01:34:26 +0000
Date: Tue, 28 Oct 2025 18:34:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nareshkumar Gollakoti
 <naresh.kumar.g@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Allow to lock/unlock the PF
Message-ID: <aQFvINr7G/aFNzd6@lstrano-desk.jf.intel.com>
References: <20251028200521.184592-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251028200521.184592-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: d8790f47-7360-4e99-1e3f-08de168b4bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TRhSPpwZeOSTm8EjGIAsRW3xvaxyhxgPqpaQXRVPxa/vU1imGRu7ADpvNAyX?=
 =?us-ascii?Q?gM9268OFFrXoJ7LNP5XI1swMd1dGEN0po5dldWgs1CuCLM45nWB8agBeOC4h?=
 =?us-ascii?Q?lKaLXZJirUGTzhDNHMEuxEaR+Ihl/WY/ntQXPW7AHHP+OGyJu/AqJltpxRBu?=
 =?us-ascii?Q?ba59q+jOhtOGLkl4bY8ST1fmEdrlJvv6/o6TsOGczVNmZw5EBcA5rnkynr6n?=
 =?us-ascii?Q?A66sVX3qy5NqbXoe8Pc3hrCMgDKQ0NhjUl6AL61R85sl/FBBoZoIMuOuNHeX?=
 =?us-ascii?Q?WieKDkgdd4bg5LzY7dp8EGZtb7G4i+KtoPA4c/pkjFkLLJTikkNDI2bUHpBB?=
 =?us-ascii?Q?bH5tjAUP6E1bvKC9xw/nWgwWXFxYyaZAWip+9vhpX4n1bn6Zc6oruB5Db6UK?=
 =?us-ascii?Q?WY7MCNKMjxA+9vJTRcdmubbnE8JyBdSPO6yvoJTQPZZIpQTt++lhbc+eqGM1?=
 =?us-ascii?Q?uRqzRbv1YwDeggvXlr3sXtWzZKX73/cIEHOgealsVaqA54r6HJvW7nLIWwpi?=
 =?us-ascii?Q?6UhugUxB+SHv9fiL9SpiMoDsfkT+1cyo7V24gsWRai3cNdwKyxbRtHoLB1yV?=
 =?us-ascii?Q?ZJqNKzM7yVAe3yd6/KHhDz2wRjFXTuecfhbo9qQUnwNo2w693TVmF11//q25?=
 =?us-ascii?Q?NprqSl0BtQObzfOypmCSz+viiKKFP9626+U6iMi3UxrhxIhOAc3Ai/tXhoSb?=
 =?us-ascii?Q?F2Sjy2GtaP2I0BfEdcM2ph6WOfI8y9WgvzpyLsc4CU9WLzP+jbbVnImYft1C?=
 =?us-ascii?Q?cvg/3ZAo56keBn48ZiR/YBrj300Lancnf3bbrSUfLQkz5MzWZV/U3C+KCbt6?=
 =?us-ascii?Q?pHdL52qPKWUzC/tlgkmlwnsKAUr1UFoyqSCFnh8+kHOApGHcJsnMPS7o/+91?=
 =?us-ascii?Q?dQKpSwhCSbqZVbkvvX3W+ImX6p8NeVDQJfUkDtQLHp1m9cDOc0q0SmuM4bj3?=
 =?us-ascii?Q?a5Zuddea3X2Kw46BJ39piFG6xaFO0WVoKuxcUM/VSuqTLE61bNgEu6JbIxkv?=
 =?us-ascii?Q?CBfpy88SY5Z7dobylXtPbG4ZTT1c1JZqM2ZM66wM2gjT44Suai9fihbFGhGT?=
 =?us-ascii?Q?2er9kkTmTM4r8KGWU1mAu30o2NFrKJyAe8vP3BtZus3mNrg3z58pTwA87wsV?=
 =?us-ascii?Q?eiFz5ef4ycrMQr6vztApmSQwgnqtnYhyhB3Dil8tc/8pHD24QJ8Hav3P/+e5?=
 =?us-ascii?Q?oPACuAfZ3dHuxrtsgJ9hza+dR6q+99bFh2kTVj1RnZFq+agpY0zDn9eAUUa9?=
 =?us-ascii?Q?tM8VGEB2KzgzFxJ2Ril5lEDlTVomTOluBAltE+OnmgijzdNjiTaVPktHKbWC?=
 =?us-ascii?Q?wGwum9WlwQwbR4kBKmsTFp4YvhxPM7ko+2ikQxOHFzgVBAs4qX1oCej7CT5t?=
 =?us-ascii?Q?+DUd7bBUhvZ9bpy7vQsMb5iKQHGwJsRmU/k+M9twnMbiSPaGfDzK2iYcq9VJ?=
 =?us-ascii?Q?0mWUf88UPZdb2+AWOwdis/02o1KEvy/o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fbz7Aw4u7dq4mYqK/5XDGssURTN+uqdoCEg4VYVP5MegNsB2fxj31no3guXe?=
 =?us-ascii?Q?6SS01NeOqp4BpReQ04+385PDrvXJ95W/hgs9RY30sLtR5Bj0KXarDS0EYGcS?=
 =?us-ascii?Q?AVYzkpjDmRl8R371eY2JSQzAufV+YZoo2XAsnl8FgKQcEbNX85GLaFgf9ScC?=
 =?us-ascii?Q?4n/JfGGspHSdlWydAGBhg+ro3295wsbNGDJydcMz+bErByhzBisI1ScVuOH7?=
 =?us-ascii?Q?4anNHSV4dqqFbXihuHjichHtsBD+/51PUfwEx2fK/G23FUO7s1qVgAxzvHRu?=
 =?us-ascii?Q?BEtJs2Ck32ltiNSYLq+6nGkyglXoeks/IiiFOaHgdyveY8wsJB9Kjxm3yS2D?=
 =?us-ascii?Q?E30gFo2XweYc5ptRPaOcNHFIN44pkM1DmDMd/y0Ls54dMvQs253tLlPspC+S?=
 =?us-ascii?Q?sikMNpfyhMag72LuEpijGifOo5N32IFWQYriOayOJ7y6H9ucKcumK56VmWdG?=
 =?us-ascii?Q?Ax14sfugUw2tSO2Vev8fzLkHCeKR4CxKVvLVAWlOb23HnWVmbAs92HAISi9B?=
 =?us-ascii?Q?bpJxsxy3v+gbA9HfxTOtmmK4exAMPMeTqpHUkcXJOnkBpyv0tFquqoVbEOSL?=
 =?us-ascii?Q?7S7GEXmQsplK2nKjvfQVdnMRSVq4QVo4NuNV26n4rFUdWRzByAdUhB90EeJ+?=
 =?us-ascii?Q?+pWAwTrPl3BJmxixJwO+ciHj5dtZLeVhaYeXkE/P1B3OErWxddWFKVsvR+gD?=
 =?us-ascii?Q?exnDy/qqa+JE03V3lnn3+n1wSfFAk9xR02mB1jqnjzkjwJoRngSIdx14YKCO?=
 =?us-ascii?Q?5zvGMRJgNMQcuuBN3FFOxi9mDnUIn1AXZpP9UeYFuyYZYcC9K2eRqP8R+nRr?=
 =?us-ascii?Q?U7cuAMbsLjq7b028MMUj6G6TWiidRgUboUyOYtSS2RI08nQXNvTAztUHkNEa?=
 =?us-ascii?Q?od+7KC6etYDJov0+ccvKrhTt9o8E+/x5BW/4j3RwlNZH/O7JWZvTyShlf/fy?=
 =?us-ascii?Q?65Cmrb+bCPRSId8CFST5+Jp4yvJ+R3iSYn62hSAT7F5R3A3GGFy2ftcWDTpM?=
 =?us-ascii?Q?Zr7wN1oIo1bXUTS2zMzwdY6iurGXw0mvY6hkLM4LbEqa9KcWqEptQSaSQZdO?=
 =?us-ascii?Q?w14LmIlBXhzvxy2su45DIS7ObfninMKKQ0E7fNdry3GbvGng6RIeLvcNuoez?=
 =?us-ascii?Q?Efn286+VcCNC0pOedJmy/34AkfC8xtr+OnCYik8tTwMuWD1HaYHjlAeKoEXV?=
 =?us-ascii?Q?cm5hitv4cLlrOolDmbuLGHgWonKRIIMnhFeDwDNad6YNaCX69iqbmCy8TK82?=
 =?us-ascii?Q?kNJNfAMXKhOpdsMDLdGfRkUvrlXgIgrXLwOpDsrTR6a22YmONR94KjH7Pdg3?=
 =?us-ascii?Q?08ZUQiKS+ziqUGXDfUghDrwEWslqRWptoGGF7X5ZG/iiJ8gF3umaa8m6Idcu?=
 =?us-ascii?Q?Xxnfcz+/W2dtH54rAtlvcO1jy0XJyOrpGyIkNhKwxwMhFhFwUNCjv+npshNi?=
 =?us-ascii?Q?sy80c9xJs9Np16pNivXgtQSa+g8ZTSV3iyo+ynl7sgw70dylP9oOMjETnnfU?=
 =?us-ascii?Q?R/RUtxexRFIZj6k/U8nwkwMXcGgI50ApJF9aaGB5Ekjt1O08TzKS2Y2fr8Mr?=
 =?us-ascii?Q?rcatuTlYQxSAI7QbuzAy/62OgmfR66TNOlCVj0Xwdg+wYYDUk0EWeKghkjH5?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8790f47-7360-4e99-1e3f-08de168b4bd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 01:34:26.2976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvVfjj4FOSUcfcX1L6lRZmqX6KXcQuny2OvSs7GrbrGmkdRBdx0q/ffwbJpQsTawkrdo8+7tMFFbUEmKM48tPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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

On Tue, Oct 28, 2025 at 09:05:21PM +0100, Michal Wajdeczko wrote:
> Some driver functionalities, like eudebug or ccs-mode, can't
> be used when VFs are enabled.  Add functions to allow locking
> the PF functionality for exclusive usage (either for enabling
> VFs or to enable those other features, or simply for testing).
> Add also debugfs attributes to explicitly call those functions
> if needed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c        |  7 +++++
>  drivers/gpu/drm/xe/xe_sriov_pf.c         | 38 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h         |  4 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 15 ++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h   |  3 ++
>  5 files changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 735f51effc7a..e1d34860b064 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -120,6 +120,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	if (err)
>  		goto out;
>  
> +	err = xe_sriov_pf_try_lock(xe);
> +	if (err)
> +		goto out;
> +
>  	/*
>  	 * We must hold additional reference to the runtime PM to keep PF in D0
>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
> @@ -157,6 +161,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  failed:
>  	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>  	xe_pm_runtime_put(xe);
> +	xe_sriov_pf_unlock(xe);
>  out:
>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>  			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> @@ -186,6 +191,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>  	/* not needed anymore - see pf_enable_vfs() */
>  	xe_pm_runtime_put(xe);
>  
> +	xe_sriov_pf_unlock(xe);
> +

Also you don't have a try lock in pf_disable_vfs which also looks very
looks very suspicious.

Matt

>  	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index bc1ab9ee31d9..8cdd25db2cf9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -157,6 +157,44 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
>  	return 0;
>  }
>  
> +/**
> + * xe_sriov_pf_try_lock() - Try to lock the PF.
> + * @xe: the PF &xe_device
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_try_lock(struct xe_device *xe)
> +{
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	if (xe->sriov.pf.owner) {
> +		xe_sriov_dbg(xe, "already locked by %ps\n", xe->sriov.pf.owner);
> +		return -EBUSY;
> +	}
> +
> +	xe->sriov.pf.owner = __builtin_return_address(0);
> +	xe_sriov_dbg_verbose(xe, "locked by %ps\n", xe->sriov.pf.owner);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_unlock() - Unlock the PF.
> + * @xe: the PF &xe_device
> + *
> + * This function can only be called on PF.
> + */
> +void xe_sriov_pf_unlock(struct xe_device *xe)
> +{
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	xe_assert(xe, xe->sriov.pf.owner);
> +	xe_sriov_dbg_verbose(xe, "unlocked by %ps\n", __builtin_return_address(0));
> +	xe->sriov.pf.owner = NULL;
> +}
> +
>  /**
>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>   * @xe: the &xe_device to print info from
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> index cba3fde9581f..2261596bb4fe 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
>  int xe_sriov_pf_init_early(struct xe_device *xe);
>  int xe_sriov_pf_init_late(struct xe_device *xe);
>  int xe_sriov_pf_wait_ready(struct xe_device *xe);
> +int xe_sriov_pf_try_lock(struct xe_device *xe);
> +void xe_sriov_pf_unlock(struct xe_device *xe);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>  #else
>  static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
>  static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
>  static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
> +int xe_sriov_pf_try_lock(struct xe_device *xe) { return 0; }
> +void xe_sriov_pf_unlock(struct xe_device *xe) { }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index a81aa05c5532..7c011462244d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -96,12 +96,27 @@ static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
>  	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_AUTO);
>  }
>  
> +static inline int xe_sriov_pf_try_lock_pf(struct xe_device *xe)
> +{
> +	return xe_sriov_pf_try_lock(xe);
> +}
> +
> +static inline int xe_sriov_pf_force_unlock_pf(struct xe_device *xe)
> +{
> +	xe_sriov_pf_unlock(xe);
> +	return 0;
> +}
> +
>  DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
> +DEFINE_SRIOV_ATTRIBUTE(try_lock_pf);
> +DEFINE_SRIOV_ATTRIBUTE(force_unlock_pf);
>  
>  static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
>  {
>  	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
>  			    &restore_auto_provisioning_fops);
> +	debugfs_create_file("try_lock_pf", 0200, dent, xe, &try_lock_pf_fops);
> +	debugfs_create_file("force_unlock_pf", 0200, dent, xe, &force_unlock_pf_fops);
>  }
>  
>  static int simple_show(struct seq_file *m, void *data)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index c753cd59aed2..91da3c979922 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -36,6 +36,9 @@ struct xe_device_pf {
>  	/** @master_lock: protects all VFs configurations across GTs */
>  	struct mutex master_lock;
>  
> +	/** @owner: the RET_IP of the owner who locked the PF */
> +	void *owner;
> +
>  	/** @provision: device level provisioning data. */
>  	struct xe_sriov_pf_provision provision;
>  
> -- 
> 2.47.1
> 
