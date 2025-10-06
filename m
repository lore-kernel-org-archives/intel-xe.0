Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F9ACCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 18:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79B310E44E;
	Mon,  6 Oct 2025 18:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mE/8MXBL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9A910E458
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 18:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759776382; x=1791312382;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xkq2VmU0SWZweSZuh0oLIoznug9elrhJJyAXxLseUMk=;
 b=mE/8MXBLB72wqAIJKWzEZBGk69bT4TTxPaXu8eqR3Z65hkda0SF/PxDe
 tMBoTp2GTUgJmKPHHRorBjKF6dS0xVwNfOgROicXsghgcarFqyC8j/oZx
 9lZTcEc7ZDIchnJU1kA3S4mfqHLe9QQphJzx9S4mJbZNhw65C9T0GYbcL
 DBFhmLHpQupUNstPCCyIPZUN6eDq0TRYCqqToPqSLzcHbRtYUIHf9jell
 ze0TdfMhk+in+0hnqU7XAfycZa2SpwzIiWk53A3N/ksd0lyLah6iSxV9R
 5ayXYvEXBQdJpMKnXcxA95HuLBGr2pJBmKT1Jg9vro6MpE761jcUP+F1C A==;
X-CSE-ConnectionGUID: vxYZYtiORmmiCylPl37z9g==
X-CSE-MsgGUID: bnxR3u8YTN+p6cJsZJc80Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61664403"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61664403"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 11:46:21 -0700
X-CSE-ConnectionGUID: TiP17439R4KzBrtqgPkG/g==
X-CSE-MsgGUID: T9+t7osVRpC+tqRB8SeBag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="183974036"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 11:46:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 11:46:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 11:46:20 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 11:46:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNv2NOcv4imbGxVS1aE6Hl6NvMHQ3zy3KcBl85DUUgHFSjUOelnmeYL+hH/OZ7FKXQ/xbkw/klVCGavmRe1C3PrggMfg1JZiskSErF7Ki1IhKjfazXDlob+rgalMQi1ov8gpDjhdej6H0QgX40z4lNjWXikxqoKEPviwH+QfiZhZKms7qEolLiP8qfqMV8fny9RGldb6CklnxGBjnS7R1D1meRqTlSa9Hn25+EoUbiue896MZH6bV5pmryu8zjIFEeVkVNnXixU8Bw9ZE+tjfUXC1gaCekJEdcZdG4jBUZcv/Ae0qZgeowQLq2hWgT8hcx1KOFk/UPVBRJ69TSRQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLfzc7gob9+oHe8pCOHKY2z/8jZQAC2egr2JEdIuoVk=;
 b=Gi/m+Jw8izSDi2FWRssWKcUhIedxK6y8pcdJELOhVOSZadhVnSOR3SZtvkGTidJrCe872o2R4/Nr8uG/VYL0Rr8WCDio48O6QtNMOaJgHIm0rfybF++k9ByEwMeQVTjaeRRBvm9XUaa0TgVBcnAcrxV+Q8PicP+n0x4sXrKHu8NLUP8niPDVTypSzVB03WOW3W5bPSb1Bz1grJF5YDr2ZR85+NsVyLfnq5Rb9Z5FvxXf0C565SKD3ZFBnCutuMWnSIgrMC8CbURHZx2+Xnv635Uy3Z+yMCq5tnC3X+aEUTHi24u9kOVD57GK9FkCa2V2cWTjW/2YSj2yUA/SN1hKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Mon, 6 Oct
 2025 18:46:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 18:46:04 +0000
Date: Mon, 6 Oct 2025 11:46:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix comments in xe_gt struct
Message-ID: <aOQOaarvFobuBrQl@lstrano-desk.jf.intel.com>
References: <20251003234850.2481736-2-shuicheng.lin@intel.com>
 <20251006151317.2553182-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251006151317.2553182-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: d988f666-2e6a-4e67-4413-08de05089a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VvjPe1y4X1aygdDRVNgp6PnprvGy+3e5xMfQaDHhvSzUsNedjMMdtSoaf7Dg?=
 =?us-ascii?Q?9tsbYhvQnu0K8Ccq4021MGswHXA903NTtNHjh+bYD8rvrYnchAWmVkMVWlvm?=
 =?us-ascii?Q?GiYtXphBTJT2a8Mz4nW3BorjA2mYvIjOssr7UnRP1MI3uytIlJxxcqFiYSpP?=
 =?us-ascii?Q?prOaxYdpQv6Jt30KLtPv5DPYo0eq7LMdOohGVRgD7B8qpnUKy2dq6C1RF2Qc?=
 =?us-ascii?Q?pMLqj5pEc4kh9Yi2Zy6Nba2BVArPtm2odchglEh4nMj9V2Nrqoo4Zmt6K6MD?=
 =?us-ascii?Q?JanlW4fqQFRFTc/V05Gi4u+8BxtIDeF2gP9tq/1zyldNvKltOoE0xxfLIt1J?=
 =?us-ascii?Q?WM1FJkrUXjtJSn37/3OtUWkboBRcRR6adqt0szWikorYscrqiRgejhRJNEXr?=
 =?us-ascii?Q?S/LruPwd/dh3xuos3QY+g4A2ZNuHJwmcJUMEbJxx4GWkK6Ixmcp1I02u2HLR?=
 =?us-ascii?Q?JBt9W3zHxyPx2VWdXH42SRREguKmGYqJThUeI/RMr2LDAYgHmL1LOCvgRO50?=
 =?us-ascii?Q?vOot2JKmoNiVjWyNTQJfoqpv/SnxEonu6kX+ZE84Eq9i/chD8dfXqIuiXXlc?=
 =?us-ascii?Q?27oM+bGTFs+/9dptuDZKXFdrW256Y6cYx4zWqTnWMCBxmvZ/vcKmi89d24fe?=
 =?us-ascii?Q?c3DwymjmYZUacksj8BUsd+FCqPCWKDpZ0oX1vQuDYbbIfoCck59Ll4Wkg1ek?=
 =?us-ascii?Q?cx7dGzfit/xCMzilXxmejSyLFgaNH45b2mnUm7qLRynyrhVIDXxjCB1175nm?=
 =?us-ascii?Q?346QKFE2M1owz8hqa2eCPoEOAaKStrRIp6sCFgBpT71T5otcWvAVcJNyFCbE?=
 =?us-ascii?Q?k+B2mS0LQrEaqAGRPE6UF89RTWKIftzGhV8zibCYFoPX1IgRQIqV0pSoO71x?=
 =?us-ascii?Q?STB1pVEGYNE9CrBjaXgrRAcZIxnjwMg01vYJCM9XzGIOcV8Qmv+Oj9J51O6L?=
 =?us-ascii?Q?NfvY+29DHLBbwO+n8r/uPbpfLc3q2vdkyvmbgfyauNG4uoXIc2nyrN+a2TKD?=
 =?us-ascii?Q?ckDEwwmmcipjJkpLNqebO3gWl5nba3RARm+5loF+rVjttibV8Gkb60fxpvMh?=
 =?us-ascii?Q?qoSyBZ9b6Jjk3KxKHqWj5+DkgLNUu5Ht0S0c/MYZOext4sR387sqqq0GZS+A?=
 =?us-ascii?Q?GpvdmuxKYxk2Jt5u0QhtgdWvf3Y1E3SJjzd6AqXufgscVHzvbZzKjbwAznaI?=
 =?us-ascii?Q?FO1CXpCR9yyB+60qE0P/9IczPoFENFn7LDaVjB/+G7vO5twkA7Hwncfner73?=
 =?us-ascii?Q?oWCcYWyYcMwKq6f3gA4wFfkWhyy/2xGX69YdgUqKQfSAjWFX8cN85JVPij/q?=
 =?us-ascii?Q?Xddw3ZiTfwjZUPReC3SzhkgPfEfnQ3c864FEDdDwKnubFZz0F8nx0QQ8TrkF?=
 =?us-ascii?Q?yDCHxK77miC2hv/reyhH9Z1i/7sX0GnVoET0VIEte77HT0pGZcdfs2CeyzC+?=
 =?us-ascii?Q?xoxGIn4LsAR8Jf1ySO9fJ0KRB4d2nvcU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5SHdqYJu69EOSjcAo3C0ns4lZFLdcZWIQdYr/CAhS3TyKjic/H6XR21bwDTQ?=
 =?us-ascii?Q?AtbIYXdeC2m00MiaIHwqjybG3lGuMfBcuu+c5Ft8M/FT+AehHAGYjgndyens?=
 =?us-ascii?Q?DDMuSwp/XY+YGqn8VxuVX4cX6RX7x7xSl8c5a40Wi91OiXfApxyWxADx+1fA?=
 =?us-ascii?Q?X6U4NzhD79i9TIQCdAz+NgYmUemRak+DFV98EonB/yc6dPoY6drCwRSyCb0l?=
 =?us-ascii?Q?ryThfs8oEvluGqi1dhJdQVvlAeV3AB4HRdwHnU6gyP2mcQZHT6+AMh6McU4o?=
 =?us-ascii?Q?9Fqjjgn+OWw2Wuz/9xIEFPbaJVOH4C1dvHCEoT8V1xIkQ7WzP3Tli/1ZH3wn?=
 =?us-ascii?Q?W0vvpskaQ/p7kybgkk/unlvxKCVxg0t0WGHDi0yDgyR6Ixk8bxFmqjbjT9H5?=
 =?us-ascii?Q?7UhqoDo6PLtYKwdGv6iI4XBQmUlcWdCd7uURwhA5IDiXoFfm7THd9tDSzZCM?=
 =?us-ascii?Q?9Qin4knLtvh0i5VxnL/OQnC0pHnG1iolJQ/zV4B5tBgXnubleU0YMryYSUGG?=
 =?us-ascii?Q?8IdYopk/xX9ZPzaAwVC8Sjx5lM1CIjw76PJ6+sfKRoV2/dRURR2q2maO5AOY?=
 =?us-ascii?Q?FmpVva2uMTaA2QRmu/BMOTtIwg9JM+VMJExRhfWo3+peY5tA+mkwmWXgkrr9?=
 =?us-ascii?Q?XXg2veXUFP8XQtUHiEBszKmzqtC/fS2Nxnp8YIS4B0wQVnoX/cbatiR2Mhxk?=
 =?us-ascii?Q?CGEEG/7VRsqBFm0dSjxDYETxOLSXWUXPRMeZzCHsk+cVqIeHKTUDiUACIrG0?=
 =?us-ascii?Q?HikZeNUSIUoaIPdA5WTYr0ID/0YpIYepedm5Ek9Q6kBLMfQomqw1VUDnCks+?=
 =?us-ascii?Q?ZBSWo0lMu/lsFsK2C9umBlNCIq8rHX6gLkG9eqm1maJwIedVi5anfy6j65xy?=
 =?us-ascii?Q?ZKVIvyFV0A/uR/Zc9dK2cEzNV4N1at8ZAt+JU9MDFK5YL5cL7PAAP+JTXDgt?=
 =?us-ascii?Q?WchGVmwqyObEGDa3S4YiQQR/VCMjobOsHKTBYHPXO3/AiID39+NOLdsbvsEz?=
 =?us-ascii?Q?fmLy14sedqSioOTVIddxoTM4PhOnXo+YlWporrwwDasaLuLyX6i+Kmm/qrFU?=
 =?us-ascii?Q?k4GEaoInK/kWom6mKwiYe4i5tDkLc0MuzgnICvSbu2Veu/F8B7FK9FnY9ZOA?=
 =?us-ascii?Q?cwAqCLEzRLYVN1djqmDIVjEPx0X5MmAouqOtmdfEZ5U9DUtI9SSgDm7hp+Xr?=
 =?us-ascii?Q?JkOfq5TdbOWxUi3szDQUqli9BVC9E1g0SyUw2V8HRly9GA+3eB/HbhU/OB0V?=
 =?us-ascii?Q?KgtXJEQT8Ldfj99HH0dLiTSPYhRk/3smmZbojlERZ2/6NJToOWroWWh5Vqwz?=
 =?us-ascii?Q?ujtdFiB9RLtyyoZWl2ZYvX/xacDYBnN88E8MHToJaNaySy3+8GrPlRoI0t/H?=
 =?us-ascii?Q?S0RXT02PIKVqySaSWw500ep2COJsDhozCNn6Ku6cdk25OR+h/sGOZ9aWSjV9?=
 =?us-ascii?Q?fLMcgqxCyZigrt5kffzaZviiGIL0ctHhNCYRr9bwN4LyOVXlDYzopPqZgS5t?=
 =?us-ascii?Q?KjPbOHucc2WZuSC6PYiuzMr/9HkJVRiITJGDtdaoZ8nSn9v7U6M0YGbybrij?=
 =?us-ascii?Q?YCFFNCaOVVGTr71O4QNfuSHWmAJan3W1g9cYwhF0AXXxDzPyz0V39wiaMET3?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d988f666-2e6a-4e67-4413-08de05089a71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 18:46:04.4298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nH+voPUaaiVZRVpbMRT3sQcrpcznKfT1jaBqfKaQDPW97pfnGfViAMxA/3oiJsJhZLv5iWa5O6Gknv4Cm3vYSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
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

On Mon, Oct 06, 2025 at 03:13:18PM +0000, Shuicheng Lin wrote:
> Correct several spelling and grammar issues in xe_gt struct
> documentation to improve readability:
> 
> - Fix "to not" -> "do not".
> - Fix "mmigrations" -> "migrations".
> - Fix "Multiple queues exists" -> "Multiple queues exist".
> - Fix "are be processed" -> "to be processed".
> - Fix "have being processed" -> "have been processed".
> 
> These changes are purely cosmetic and do not affect functionality.
> 
> v2: drop kernel-doc formatting change. (Jani)
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_types.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 66158105aca5..8b5f604d7883 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -202,14 +202,14 @@ struct xe_gt {
>  		/**
>  		 * @usm.bb_pool: Pool from which batchbuffers, for USM operations
>  		 * (e.g. migrations, fixing page tables), are allocated.
> -		 * Dedicated pool needed so USM operations to not get blocked
> +		 * Dedicated pool needed so USM operations do not get blocked
>  		 * behind any user operations which may have resulted in a
>  		 * fault.
>  		 */
>  		struct xe_sa_manager *bb_pool;
>  		/**
>  		 * @usm.reserved_bcs_instance: reserved BCS instance used for USM
> -		 * operations (e.g. mmigrations, fixing page tables)
> +		 * operations (e.g. migrations, fixing page tables)
>  		 */
>  		u16 reserved_bcs_instance;
>  		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> @@ -220,8 +220,8 @@ struct xe_gt {
>  		 * @usm.pf_queue: Page fault queue used to sync faults so faults can
>  		 * be processed not under the GuC CT lock. The queue is sized so
>  		 * it can sync all possible faults (1 per physical engine).
> -		 * Multiple queues exists for page faults from different VMs are
> -		 * be processed in parallel.
> +		 * Multiple queues exist for page faults from different VMs to be
> +		 * processed in parallel.
>  		 */
>  		struct pf_queue {
>  			/** @usm.pf_queue.gt: back pointer to GT */
> @@ -387,7 +387,7 @@ struct xe_gt {
>  		/**
>  		 * @wa_active.oob_initialized: mark oob as initialized to help
>  		 * detecting misuse of XE_GT_WA() - it can only be called on
> -		 * initialization after OOB WAs have being processed
> +		 * initialization after OOB WAs have been processed
>  		 */
>  		bool oob_initialized;
>  	} wa_active;
> -- 
> 2.49.0
> 
