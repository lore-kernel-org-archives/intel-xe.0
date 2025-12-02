Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1250CD12685
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 22:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21C810E085;
	Tue,  2 Dec 2025 22:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+/WRiPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C633B10E5C8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 22:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764714990; x=1796250990;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2cwqNKOpzR3wT+Er7uw3V0fTGFSlhyD7M/w2zQcPEY8=;
 b=D+/WRiPEXLQBUL3YjUrtCQMGRMGnt0b+Xg8wISE/knEVRzJbRHDWI6l5
 TzV6NdKvYHiPiP+1h1FrqFha9390QZ0xg8CfEzR0mU/7D34npSKRiTnVT
 yhq/1Zzgh2Mz9hCtJrVaqYscnTvnmnAKs7a3t5l394MubiOUxlniXkOiH
 3EOmSnl4s/RfflCgxRkXCshXmclMvixmqIvbx7VDiuB0Zt6kQyftoQVfa
 9zcQ0XPEID/XbOZTJ1Es+i3LhQaCvHSAD6fh7tmcpdD5+Jh8ICY7F23PJ
 XfljlV4jDRAmwXWCgcuJDl+U1Twx0RFitEgjfltnpvUEUsS0MzFafv58e g==;
X-CSE-ConnectionGUID: uNIAJnygTa2bThnXkpVA2Q==
X-CSE-MsgGUID: ANQpSHG7Q6as6XuD4/yrog==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66738707"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66738707"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:36:27 -0800
X-CSE-ConnectionGUID: 54DhXfsmRJ2i6mjsU+e+VA==
X-CSE-MsgGUID: tyzgGvwsTWOZoEr4zzPc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194312804"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:36:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:36:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:36:26 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:36:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3sz5euYqmqQ5W/R9wOiZEHbfqVaI75Sj+XeNWelMSDJ2rd6EC41WL6V3M2ctiarxwffoOg417LiEPi+vXWIi6W7EdKmTgMl/rzdh7e2eG5kursurkXfcXmD5r4OfTXDfyYW64slafXDZdCrwBe3fsmeS3KUAmqiEs3CA9NwHIOR4qetbNG7eTbVU7ETmrFssx3ewKqNyPiX/fejOdr8B+WZS5qRU+0byLl6BIDtzJHD/f1JIerQFcp4kS4eCTHxbe2CiF0to4zj/FVeWM7h+erYGqNVeduztvZRPIqrPziS2Ml9ORdKDF0cOX/BzuP5Xy7gTvsdVxK9FLjbhyomow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLVHsk8zi+/hMsElgwD15qeJhfRLeb62UcUBVRX0GQo=;
 b=h0slLZSynAeEnOZXKuLqx87wDd0lx3gjlAC2vVW1ud1foddBPbY611lvEo/3Q7HdwfyolDGhMv2yOmmg4jXihZsyDxBthQh/JE3xpe+4Puy/RDd1em6fewIIrbB8UUzH91VmO4Gks+jLND0ncdT86cK5lzeLe+MMGcn9ZuU75Zu+PyWO00N6CgLcskrLExqpGNh9i384cHZsbsl8eF3mAdYo7pRVFcKXovnYR+ayWa2XmRh21cO8YVo6ZIkoF+dFm/FffT7nWIfaXAmmWSP+dSiuCc2vraHHsyHnjEySThuocQE781C97NmNFAvfBBOXziXNfPPUwz5F6qN8QdQQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 22:36:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 22:36:24 +0000
Date: Tue, 2 Dec 2025 14:36:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/sync: Use for_each_tlb_inval() to calculate
 invalidation fences
Message-ID: <aS9p5QpVfVg42Tau@lstrano-desk.jf.intel.com>
References: <20251202222551.1858930-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202222551.1858930-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:303:b7::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a418d56-08e0-4988-8d5a-08de31f33928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+1BG3EKx7ygCA/nSUSMwhugUeBXy0jce3pcdkk3ght3Gl0M+wDGlD+5aPV3u?=
 =?us-ascii?Q?TVRD+fjrZvVBYWMeBwVaEuclSdT8t71ZAANUO6sDF/fnuzDKD+0tbukFFzko?=
 =?us-ascii?Q?RaETOwnKhj+GRit3bkWHknAP6PEbfwXOlue/Ue0n7B1ZUSGb0BH56uVrUNa0?=
 =?us-ascii?Q?nYt1IZbko8ajce4hbOHZchamLpmipO59zQg3j+Uy1z8yFL+3h3AETbsSm9S8?=
 =?us-ascii?Q?Fs+lJoQ1kQ8k6BjsPDaVHFYqgP6x1E45jKe3bcr9N4jBCREsJLgvxdFLE9Nu?=
 =?us-ascii?Q?Yicfs1e61dh+GWRmOt3W7iB0d9XyLDeu2l0d6fhxACOQAxScBA6eAp4UFEeK?=
 =?us-ascii?Q?57yFssQgnRUNyI8LPgPzfVAWbQNPIwmesFz8IvW8jaohJbiMX6GrC+6YajF+?=
 =?us-ascii?Q?E8XReE+fTL5RMUOkdDvgRwSTQC21Y/6gdktWbyjdJ4inqiokH1bKlUne73ea?=
 =?us-ascii?Q?FB9vwlfefZEvDgY9BOatoExJ8CK4FCZdmAtQeWCTaAqCzE6frRk4DmLAAKgK?=
 =?us-ascii?Q?hHIBGk5GqkSMz237HdeCYV0JVnxesOldAvVqwrIFQBPLfXFCFmsqS60aHETB?=
 =?us-ascii?Q?gFMGwMfpmWSydCHKVPB0a8ZzFi4dudvRJvAxciBnmGYTxNs01rDaGtKyNHw4?=
 =?us-ascii?Q?UV9n29U3o5Tu0SPZiPm/SAg34/yCZgGtXu+3ZstKGP6SFs9qQtuFJ2eCrxkP?=
 =?us-ascii?Q?TLcm+YUEFeapkwrHYd/Uy7ABochLVt5VX72y9z3M5EGbSh9PMN+psZLiUI9U?=
 =?us-ascii?Q?I5PZSrYMNr9xaT9VWzYEj1Nv4eeRtjipKhna38txdrrWZWwddERpR//JHrCz?=
 =?us-ascii?Q?S55++BYOQ7otpUOhzYtm6n3yD0mMgMc/3ucXq61hKd2MVH1sbZfdnXWYFx/4?=
 =?us-ascii?Q?Eif2QGrM8s4TzSEacaG/UdOcAshc/3msoM1Zu9Y9As/j1gUa8FG6gEvcEkR+?=
 =?us-ascii?Q?K6JKQ+lhil64a9S7R7sKz+0GG9VSdHLRJteCtAh0DbxBYRnC6c1DgS8ifr+m?=
 =?us-ascii?Q?x7xmS67wzi4RRatE8qcAGgPnJUHVOM1sLYjlsEGQc5TgcO2m6XQ9eSs9pWIH?=
 =?us-ascii?Q?z8zria8QNn/nru+v7udC5T4PKkEegButAt4oZYeKqsSDpJzpccHqC5I8AV4t?=
 =?us-ascii?Q?rnzxKO0QJhTkRsTuIW2w4nFkn1PMEwCd/p9U93KyK/PiteeYRXjM1G2gtrX1?=
 =?us-ascii?Q?Ukgj+zFfbY9OIozM9/k9R4B5WECI3zSUqTUTZlWR+QBeuJpRYpyjFvHvkQFF?=
 =?us-ascii?Q?6EMQ5p9HZYES8el67Sx2UVITgtKI1A3KgZCEjwvEfnxs3627wYXnvy7n6Frg?=
 =?us-ascii?Q?idFY8VAs/DmPk8YJapGhiKOSFUxux9qn1wDibKOESEAG3+NfFayIBOBYR3xH?=
 =?us-ascii?Q?rFqJcFGYuyDLdu9a2172JQNR4GCQPp+eswqLxDPSEsqA1yUPILCxRjkwRwCS?=
 =?us-ascii?Q?ua37y5ibDFSccWuH8CfphUXjeQ6BfPbQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EGIBXZofJplX3aGxsnMN6XNHLm/GIuuJLFF2qjt78FAe+hg5fZnZ3qusb6ME?=
 =?us-ascii?Q?k0P5ysfZU5KNJZVeDPwP8DqjywJLVBQupDXEYKnmfocpS9GRwuF5sesc3As8?=
 =?us-ascii?Q?/ipfnQc9elZY4i3LYr9i52NP8EnOUSlmhC74KdifSEFKmhKMpIBQfaCj7xVz?=
 =?us-ascii?Q?c7K62N7UHhV7J7Po9JqDpUbFFkTByGvx/exjToSRkHAPr5XFZMQ573lMZu/Q?=
 =?us-ascii?Q?jE/rIQQTkepJts46d2F0F6e5PiOjAFJlvT6jDq51N9OMEGWdO6CWT0/iV/ei?=
 =?us-ascii?Q?ai53XLox/5TX67MB4Z+jWRVi4NmPzSZvMG9Y9We7JIuy9gfKHXFN5FKHwsva?=
 =?us-ascii?Q?ZEbLrg8KIllnKqNSpjGd2Ezuw71KUoaEnY1tuLpTSWTetoYYd4ReOTsShd9v?=
 =?us-ascii?Q?BaMMNhRwBaATcQJXXAUCD3rizgpFrda7jxQSyQogT06bJ3rU7oGOkdjIPPW3?=
 =?us-ascii?Q?549IQM9EWXNxlJnB32nhpXPj8AWPGjfysPqVSM6SbhQ3ygKF/eD6NaHLpM6e?=
 =?us-ascii?Q?BcBBtsXn8tOycLWy8ow0LyT3CqzKtGNFxP9nAjB13o0ZVdKN21kdt1kDOS18?=
 =?us-ascii?Q?sp9wOt4eYAt+2Ew3a6HBd0iR4JqG/6UzdTbqMxeMcJBXq8H2sWwlpPfmKV4m?=
 =?us-ascii?Q?9AF1PlPxTNcG2Gzvu8MqTRHRaWn85zlu8fVY2bkFHw67gsYef7bUPJYY55wJ?=
 =?us-ascii?Q?47h+bPMHAv7RgEQ+bvbQJJ06wqrCS7OhOoOcdcfKpnb2SZnuIqrBbeDAhUyF?=
 =?us-ascii?Q?dMClFEykQerFZll1/ghEdYmsV4rqK2yZJbSaCviB1YXRWWriXMxuf/SbMCqC?=
 =?us-ascii?Q?GeR4A8GjWm4UkK3+Z1z/mIkjCXz2I1b0TceQVNw2oTmgVYErUJJjax/S0kpQ?=
 =?us-ascii?Q?qCRI+Gbz4UGKK3mfJ9s+QbDAT+q6cRQyT678D2qrmC25w0OTMW5oO8JuAZj9?=
 =?us-ascii?Q?6+EEMFo9kO75WPHRGNkzBaUIYIfuTmBcNfwcreg4bpda/d6Rm2L1u7qv8uV2?=
 =?us-ascii?Q?gPDDscRXNJ/7luzSGXVidU42+bOnXU9aDpwAHXJVOaRDiPMxbf/SLJEGAPC+?=
 =?us-ascii?Q?JWxznK22gj2Vg3yeED1mzMUHPLi4tmLdwirZNT71cMluliHE2DK8P/vMCBGI?=
 =?us-ascii?Q?7hifn3Ge2ZcWa7JdROel/l1Ain5gPCpHOQP4Y0cs22c25ptkLEpQJ5PGg8aW?=
 =?us-ascii?Q?y2wt1u17gE29AQLQa+pSWITOkPMv0bLazr73ok4/AG60VdqaobFyBNJEEK7u?=
 =?us-ascii?Q?AWVYSuMpFhrRD5P47RF71duv3VGLKEo8knLRUbYutNyyZKMLAmudnEyqukNI?=
 =?us-ascii?Q?2VXpsG8F50+X0FRfiS9V3nd37Yb2gvXDountDPvwpuLkPtLGpEI4qeQgsoJZ?=
 =?us-ascii?Q?YhGVZPVP6t+6ufMZveKUfQC9OOAP7OcqWVMz3/WHO9DZUosVssBdPAKOZWtK?=
 =?us-ascii?Q?19f5mz5AFbC2UsAidQQdVhw1sw5L7TxmA8LJjtybZhZyu94SpoRfx/r8H/0c?=
 =?us-ascii?Q?cpYDlie7pyck+ZcLm5jmhWLJvdzJUNXLWMsZUQ4pC/fo9kxCcc9NJv5YoCKq?=
 =?us-ascii?Q?0vIPgUG/KwBdcw4LZWEplZ/5/BMZsqZbOacpSznU05vLIqkeKDPX1ZR0UdXj?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a418d56-08e0-4988-8d5a-08de31f33928
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:36:24.0566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYiick5bwYzAzzYT9Q3ShbuicHG2MhUU+QMkIr43BnH0B4bXo3kLMPqoA90vbj6zbzOPs22LJvbr706Z0rlZ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
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

On Tue, Dec 02, 2025 at 02:25:52PM -0800, Matt Roper wrote:
> xe_sync_in_fence_get() uses the same kind of mismatched fence array
> allocation vs looping logic that was previously noted and changed by
> commit 0a4c2ddc711a ("drm/xe/vm: Use for_each_tlb_inval() to calculate
> invalidation fences").  As with that commit, the mismatch doesn't cause
> any problem at the moment since for_each_tlb_inval() loops the same
> number of times as XE_MAX_GT_PER_TILE (2).  However we don't want to
> assume that these will always be the same in the future, so switch to
> using for_each_tlb_inval() in both places to future-proof the code.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sync.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index ff74528ca0c6..1fc4fa278b78 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -311,8 +311,11 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
>  		struct xe_tile *tile;
>  		u8 id;
>  
> -		for_each_tile(tile, vm->xe, id)
> -			num_fence += (1 + XE_MAX_GT_PER_TILE);
> +		for_each_tile(tile, vm->xe, id) {
> +			num_fence++;
> +			for_each_tlb_inval(i)
> +				num_fence++;
> +		}
>  
>  		fences = kmalloc_array(num_fence, sizeof(*fences),
>  				       GFP_KERNEL);
> -- 
> 2.51.1
> 
