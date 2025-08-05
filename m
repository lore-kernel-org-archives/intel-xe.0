Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6624C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 20:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A186A10E29C;
	Tue,  5 Aug 2025 20:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HotgvoEo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3819310E29C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754424255; x=1785960255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HXQBWcP4/eXhdoVcmD554M4fW2ZITC/5EdDb84soaTM=;
 b=HotgvoEo7b9M7q03jCcE6UhnvT1Aar20N0riej/Lnb9oZgPxTNdExhML
 sDAiafAhgsg59PnX16DLJjVvs6Wx+BL2g2WDyu9o66Z8hoNVPjcqKB5t7
 exHlXcJJwiegTZQCL57fEJq2O9Qh3FC+xtLr5+UmbF8EWv2u13rcQQFw3
 OY1cHQCtMMLk228QUxvwwPbO7AH+cuyY0gel/Ew53g45ai+pLUFz+KPBH
 eJ8kv5mPLcqt2feBvfS+anEFXRjHqZX0qRQR89KSwoxArBcK2Ojt0dqiA
 IIZTguWdwbfVKrys28EDriT/ScY8eyRHjAHlBaf8iSepAUyARGoeLXbCc w==;
X-CSE-ConnectionGUID: pmnDAqSjT8qd0+jUqqSzUA==
X-CSE-MsgGUID: ybmFla18RsejYym+s+SBBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56602211"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56602211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 13:04:15 -0700
X-CSE-ConnectionGUID: QpXgNzb/RZ6QUcA3FN1YVQ==
X-CSE-MsgGUID: fY3+Wi6SQviQL24BWXtpJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168832723"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 13:04:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 13:04:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 13:04:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 13:04:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRukXFaJOA7xQY/5kEp6Bf51pZC8bWbNifIY3nzCaMlI2JB2CKa+zDEG1bB8iu2tTVr1ccqHhdiUqjqzwEckiNxl1GGbh9r9FYBisAs2HtArBucfYYQXkHErDDOCImAMlIipqzwiyNKHOGaQ7p+uIDqYscHZera+Ms0ycofima3TD7ouWpNGQlNRFa2QEYdKB8qyRAjhnm99tw1Icn4Op02TyaKVKG98nTn4ncsx/vNGc1UDX7w8SYEsX0FSXRhGRpNNIjUePcydRsa6jFtxk/gfl+DcJXTgnx8nrQCXEk7W3LxTSBOlezkFSOuHKelSzq6DqoUSy57QOfBb3FftGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvSTWAOJJ5CkaFk04U1x+qsypW6Cv/jGfXkJYFodwko=;
 b=F93IuJ7y2/N+1qcNwxwRzgHEyut/ecXcE6QbXw5iJV7+Bw2mf3ehkpL2UsT+KCGFf0esby7gmqzMM+UZghw5JmImx/RXmlkWpV0KOVJ87P2J/t/DF/tiyRnz8j6T3WB+0rh7AFsC4iIs4+csKt/0kpHHiyAFLvaewtc2AU9x7bfbDnG4J0eK1q4cnLkwN698GBCaCHp21D5nn0Qqr1HQvtFX3WgtMxsVFlSzlTrO/yYK7XJbZGqbpb3ZyZ9V3RyyitzICB1ssQAAMWmrnZiluaN8RgBTgy7xC/5UgkuCnqNEx3IZEQ1Fv0Le4+KC1PMMnguIsBhG1bYrOTPTMCTeOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 20:03:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 20:03:55 +0000
Date: Tue, 5 Aug 2025 13:03:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 14/25] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aJJjqO836wXuAB2Z@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-15-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-15-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0325.namprd04.prod.outlook.com
 (2603:10b6:303:82::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 45490f5c-1515-427c-57be-08ddd45b34ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DJjNUuwh9p9K/IYifpdHvMZYJE9hAlyU/E+zq5AWodkAhFvsq9e7tBWq5DPG?=
 =?us-ascii?Q?jTpZ6EKJJ5KdPJNmP2CPnYca1OCFtFmWXQ4Fl8cAKNJ19qEIshyb12tuEqew?=
 =?us-ascii?Q?2oj/0rAz515s5Na9eOUPXgLKuZMziwHW738NrwoZ52EaHUAIodI4UsUoo4qG?=
 =?us-ascii?Q?noc2y/xxCCtZ7YKA4Nv1UsT5zxAgj+wUJ2rd+E3aLl4SJcEJL7S5uK/VsihW?=
 =?us-ascii?Q?sWTagRM9yCdSW9IMHwraYVnSB9+fbKg4BANOMm4J4b5Pl/S/qcp39O1qi3+R?=
 =?us-ascii?Q?yrqi4BpCiMkOzgDx9+f7jSrJzwaujm+YLexmk4C4Vhi+1ZHuN9LdkK486bdi?=
 =?us-ascii?Q?ya3QfVeAxgzIiWzcLWk65WorpM3dZOWwXG4+SLxROshlQNCit5i99X3T47sT?=
 =?us-ascii?Q?XwWSm94p2R4Rz8xSjVgEbBBgZUAXr6lOcmr55QnsFV/iMJbPw12j7AVrra/8?=
 =?us-ascii?Q?ChhG3Ggr7HuwKMIldvoCsa3yw3LJQ277o0A4Wry7Rofx7xjb3V2fPX0fT/lp?=
 =?us-ascii?Q?edRk8lNjsKjg8KNKq4D951IlF2INIChiYNACg0sJJbHvqJYYAvwY+fADpLeM?=
 =?us-ascii?Q?BgEwRtdc1mC1VrKGna1sZIPZWzSx8I1MIku3P+Sfe8t22fnvZA42gkcbz/yS?=
 =?us-ascii?Q?ycCK64tRM3krfFerw3ZOGDu4BcOPdP56pEMH3hkQds22B5HxDrd26N2WRvvG?=
 =?us-ascii?Q?Hne2a7nIhynmjnxU3BxHSQniJyOfiBCyhnp2HQ6lg/o5U8hQCFizlC/DwJj0?=
 =?us-ascii?Q?E0+cZMfHHGRovOEm6N/CBLwZNF9ErqWRDh4aMTwBk964F8v0/p1s2Sylof52?=
 =?us-ascii?Q?T/CGf4md740v/z1kNwDH//ZO/RO5bksRgiCd42JqmDS7sUQmKeBZncHPq5CV?=
 =?us-ascii?Q?UFpgDo9GvElMUG7KCkdmcoB3DN9KUiK/aexq8ef7BhbGrRttTXfZGN4HurI/?=
 =?us-ascii?Q?oPK385bmkOGlPaQP8xKWckjY6cm6Xe0VleTnLxMh04HMGOPjGIin+Z70D2Pw?=
 =?us-ascii?Q?LGyyDm51/AUr8yFHeZVw7Bta4pe5enaen8WHpp702RlmxJzRWsKUao58ZAoR?=
 =?us-ascii?Q?0Zi0yHOjh8h1acqY83Yqd49ETyZOg3rn1sx1p8T1wBZdU4jHx+wB4j8dW9Ac?=
 =?us-ascii?Q?Un0c6JA9ZYygnt4Me7/6p6GnhRHNEzQ2Eb9morE1okpQJZ0xWtJX1uP0qOGP?=
 =?us-ascii?Q?jzkS1LQzAS4NC9AiJIG6pUQt+Za35TNiK1oEP6PS5nryhMx5heW0cJZqDs3F?=
 =?us-ascii?Q?qqCkTbvf8EQvxDxa3seejq3IbEiWZ6a99zuUrxLjGpQqg4ed1OkbSR0HeM/W?=
 =?us-ascii?Q?o6kwdQJxIa78iYLydjCf5N0XzRf9WqdaM9n3KW+MmKGdY8C3Y2nKL6+zqFLD?=
 =?us-ascii?Q?9u45uECE4ZVCdVumhJCgb57y8QYlvsTy7avV3uWU1LkZTgijWHF365bzF/0c?=
 =?us-ascii?Q?GaIqdjO9+pk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dnyWcjUe71DhMFpqCnVoHQnH1OF/y2kyh5Xk6YIcbbtZGQVKfx3sPTakh5Bn?=
 =?us-ascii?Q?yPDFbOKi1yLjWx5sSseziDxz2zuMPA0MWy81uQw528KCLM7rUynFNwyfLDvt?=
 =?us-ascii?Q?/dmeTJOkx+GzFgQNDzA6sPajDOu6iOsZwcMv8ZH+h73l4isU8ekPkX88D+AB?=
 =?us-ascii?Q?suJ4CxcdMe8KIImoGEVSiFUr3rW60ZdaKp8NEZtcFklM9dnOH49ruPkSQLId?=
 =?us-ascii?Q?+6xcb9Rk5exTHZu7604sCnNToO+HKqKRTg3MLBMsEsVDZiX80kDe8XkxfEpc?=
 =?us-ascii?Q?cgc0XOLzk7Y2/mbMKZNV21YsSmyHSjwoaBHQe1oTid86rY/hQi+PsamnLpf6?=
 =?us-ascii?Q?JbdCEhUfiwjtCk9v0jHMXLegMpBFyLf2BxHl8bgZjRltnG7KYH4msF001cX2?=
 =?us-ascii?Q?R2Jy2JJNhjQi99GML0HTJmLAHs6jJCKzUpjB4NP2hzU7PcL6/poNi0MP3Qcp?=
 =?us-ascii?Q?y3vV7bdP9G0huMGRK7NLpEh3akr+1ZT4k3AEI6HSbZ8rYfIRRAyIw9hukwKQ?=
 =?us-ascii?Q?Zd9V8QnmYMphw58MdsT5HKNWtwIrCfsePzp6EHDTFhi2RCcSwVTKoHlQOPhc?=
 =?us-ascii?Q?HZvY2KirsI3xG8gWj4hQa65FR1ca88oBMr61sNtRFPc98VVUeQ15B/T6pF8r?=
 =?us-ascii?Q?lftyE5b2UHui3sAz6y9gJncjNnm7A+A7yD+MlhBeGdHdbjACWy1T9B8OcklY?=
 =?us-ascii?Q?+aIK9yNxJpRVKuii/zQwy+NQv5R9zMbAts//K7tAyvioTaXQICu/GQMQFDpr?=
 =?us-ascii?Q?AkasIAZvSqCgBit8wUzdXnSmaGIMnmy7aBG2v7hqPqYCSCid9/ZgLDVmLcs7?=
 =?us-ascii?Q?eBasYESQIfSMasf7JObBd8ieh2fr+lxohRxwsVAwP8mAkeQ2fVsLitmzJ9+t?=
 =?us-ascii?Q?+YvL/CgAtirNBb6IeWVM4KexbE5/UjJZ6f6dBshVkAgTaQcjfHu104Z0Dwdm?=
 =?us-ascii?Q?xz9eT/+PVNGRNjM4GaVfJACfQtUY0VomKZ+UK6M1X2fZOzsw7HeTfN2BbcEb?=
 =?us-ascii?Q?HshZQhq6z1TTsamYPZxKbNom1QnaL3R7vgxYGC3vKs2vt8MVQsbPxKgMFZ/O?=
 =?us-ascii?Q?ZKO6DZldBCRkgiuy+n7Jv0N1YXylxNrcO4O1RiltulSvsbxTv+72/bFrO5CN?=
 =?us-ascii?Q?SGiZlPq6+quAyqZEIyBmXOywCtgwMq7NIhnILGQ7BFbpd81CHPUAw04AGTxs?=
 =?us-ascii?Q?ICDbq0mKc37d3syS+mpynu/RT0w4572u+0yRdMgnofoG262V9W3NyJVH1Gls?=
 =?us-ascii?Q?zE4umbgmJ92vg/CByTJVy33t/3htVZiDXfET5tpENoDhTXRaFvy5Uugd3nVG?=
 =?us-ascii?Q?5Vumx3PjhUlqkLUu//6ZPTo/zXSVFpowxHe/UP76S+ntXygqoVPkeMHxTmnY?=
 =?us-ascii?Q?Q9+sPBeN/0ABUZ1NAQHmWN7h5N4UYePyhNlCIZUajcY/BRhswsbiU6Qo8tuW?=
 =?us-ascii?Q?hFIWqo6UlIBSwtXH173UN3GhAlEZC/NV2V+aTJPIiisUiwO4kkdGK5cju5CW?=
 =?us-ascii?Q?Qh8K3hbjKP/Bik/JVlMKYZUu6+87whmBRg3oeU9FpVKr24bdLf8bqOWNVzuF?=
 =?us-ascii?Q?QyOWVJ+vznrOf22J6MBmk+1kAfo1G7lqF3vhiInc/ktKSffZLOlRqJwJvugD?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45490f5c-1515-427c-57be-08ddd45b34ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 20:03:55.1202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smhhdMEDIQcUr/XOWWAMd3QndJUOCOqJVV9PMEsfq7twd6Mq6Ie7H9m/qYfLezSUEqugHF8magkaBQDMccjBAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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

On Wed, Jul 30, 2025 at 06:30:39PM +0530, Himal Prasad Ghimiray wrote:
> If the platform does not support atomic access on system memory, and the
> ranges are in system memory, but the user requires atomic accesses on
> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> operations as well.
> 
> v2
> - Drop unnecessary vm_dbg
> 
> v3 (Matthew Brost)
> - fix atomic policy
> - prefetch shouldn't have any impact of atomic
> - bo can be accessed from vma, avoid duplicate parameter
> 
> v4 (Matthew Brost)
> - Remove TODO comment
> - Fix comment
> - Dont allow gpu atomic ops when user is setting atomic attr as CPU
> 
> v5 (Matthew Brost)
> - Fix atomic checks
> - Add userptr checks
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c         | 23 ++++++++++--------
>  drivers/gpu/drm/xe/xe_svm.c        |  8 ++++--
>  drivers/gpu/drm/xe/xe_vm.c         | 39 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 15 +++++++++++-
>  5 files changed, 74 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 593fef438cd8..6f5b384991cd 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   *    - In all other cases device atomics will be disabled with AE=0 until an application
>   *      request differently using a ioctl like madvise.
>   */
> -static bool xe_atomic_for_vram(struct xe_vm *vm)
> +static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
>  {
> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
> +		return false;
> +
>  	return true;
>  }
>  
> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> +static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
>  {
>  	struct xe_device *xe = vm->xe;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>  
> -	if (!xe->info.has_device_atomics_on_smem)
> +	if (!xe->info.has_device_atomics_on_smem ||
> +	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>  		return false;
>  
> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
> +		return true;
> +
>  	/*
>  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>  	 * atomics will cause a gpu page fault and which then
>  	 * gets migrated to LMEM, bind such allocations with
>  	 * device atomics enabled.
> -	 *
> -	 * TODO: Revisit this. Perhaps add something like a
> -	 * fault_on_atomics_in_system UAPI flag.
> -	 * Note that this also prohibits GPU atomics in LR mode for
> -	 * userptr and system memory on DGFX.
>  	 */
>  	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
>  				 (bo && xe_bo_has_single_placement(bo))));
> @@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		goto walk_pt;
>  
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> -		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 1d0b444bf2ae..5e78beebe114 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -793,14 +793,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic)
>  {
> +	int need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> +
> +	if (need_vram < 0)
> +		return need_vram;
> +

Does the compiler not complain about logic before declartions?

Either way how about...

xe_svm_handle_pagefault()
{
	/* Logic above */

	return __xe_svm_handle_pagefault(.., need_vram);
}

Matt

>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
>  		.devmem_possible = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>  		.check_pages_threshold = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> +		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>  		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d039779412b3..463736db19d9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4183,6 +4183,45 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	kvfree(snap);
>  }
>  
> +/**
> + * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
> + * @xe: Pointer to the XE device structure
> + * @vma: Pointer to the virtual memory area (VMA) structure
> + * @is_atomic: In pagefault path and atomic operation
> + *
> + * This function determines whether the given VMA needs to be migrated to
> + * VRAM in order to do atomic GPU operation.
> + *
> + * Return:
> + *   1        - Migration to VRAM is required
> + *   0        - Migration is not required
> + *   -EINVAL  - Invalid access for atomic memory attr
> + *
> + */
> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
> +{
> +	if (!IS_DGFX(xe) || !is_atomic)
> +		return 0;
> +
> +	/*
> +	 * NOTE: The checks implemented here are platform-specific. For
> +	 * instance, on a device supporting CXL atomics, these would ideally
> +	 * work universally without additional handling.
> +	 */
> +	switch (vma->attr.atomic_access) {
> +	case DRM_XE_ATOMIC_DEVICE:
> +		return !xe->info.has_device_atomics_on_smem;
> +
> +	case DRM_XE_ATOMIC_CPU:
> +		return -EINVAL;
> +
> +	case DRM_XE_ATOMIC_UNDEFINED:
> +	case DRM_XE_ATOMIC_GLOBAL:
> +	default:
> +		return 1;
> +	}
> +}
> +
>  /**
>   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0d6b08cc4163..05ac3118d9f4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
> +
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index b861c3349b0a..a53b63dd603d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -85,7 +85,20 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
>  			   struct drm_xe_madvise *op)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
> +	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		if (xe_vma_is_userptr(vmas[i])) {
> +			if (!(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
> +			      xe->info.has_device_atomics_on_smem))
> +				continue;
> +		}
> +		vmas[i]->attr.atomic_access = op->atomic.val;
> +	/*TODO: handle bo backed vmas */
> +	}
>  }
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> -- 
> 2.34.1
> 
