Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B70CC3600B
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 02:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD9710E963;
	Fri, 28 Mar 2025 02:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHpEfzGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D2E10E963
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 02:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743130570; x=1774666570;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NJQgXNwN4GHmL4Y30w7cFIeSB0Z0zL0fFQTc0KkMY4E=;
 b=oHpEfzGi8brjfRkyiIbhoYhyMFRK+4NyJrKgpKJxIPDk1SFpNBDXJzsn
 zNX63pJ4Q235dSNzu7sfqAj60TN/W9ffRa9EHJj6TSnRCfPEzvqjYbQnp
 CUuL5Q0UIWFvhlNvEtCFmYwSTEzqgJ9v/70QVBtTh1rVQ+hscp3aQ7Py1
 8H5bvfz++LoSYl5jAg955ygRmyD5pBzRtyf8TN3WtMPC0zpjPF1NNqfSR
 kT1/5X4jcK/I/ZJuwecJRCGPNKGZ+s1L6Q+fhEkvdHg2F2R0ETH0ll19H
 tguxWTWOC1/j4euLKybRUog25vFWb7KEfLfkJ2oi+0gfeV8mULZsWQPcW w==;
X-CSE-ConnectionGUID: s5uGY2QGRVWAU/8kjkkQeg==
X-CSE-MsgGUID: zZwxppSeSvasn7Zp+y0Dzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55856575"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="55856575"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 19:56:10 -0700
X-CSE-ConnectionGUID: 5jPAPsMWQmiO1kons7wufQ==
X-CSE-MsgGUID: ESbWCbv6QyGQCKb/oU+1LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125073524"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 19:56:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 19:56:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 19:56:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 19:56:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORAOdl2bXTwxLLxDccjNrCxhhHR0kAT+LvW1jWdNGOpYU89F4P69T5dTldOdSH1ndQyG89CCA/H8TMF4ipaoc+uOoq0Mp0N8wYOOHtcwv8W3BBFFjy9L0FIfroOR1NHYVqnXAeZ4vxsGVg9jLsOs9Kx/GdCFV/OdRcq0dy8dCgi+wADJg3DXHMakG/Ntig3USsoxEL5wSUCz1hLDJHGHGTGgUOifI+aEJPauUlQDfvbvAMxQoENfjuRw1TbnCzlWFqDnb+JPdzqsphMiTwa+8Zs00UUNjaAMOnIsusdI5q8RhKk+mLySJjimVWGn1O4sFsPep0djSb49mDhUPMWFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGwzrl8F07tUIgUnvlPTxyRAM11L1bAurSEK4xLFEbM=;
 b=SMEUt0GYWuUd9I2irh3hClwuXRSZZKz6LlklExD50E6i7Vagle0tHZ7oy2ddNKbGJMuuExDygOnfQDcmFMSFcwmkPkRyN8QW5tIXyv4eNYKpbswHU6gIdj13Brv8pAg+C618Xhka68I48uM0Aj1Zopxb7LOVeeJnIS9hIblufoFeEFqtVIaFb3rkNOwUlgXyje5RYrqLGpV0XNFXUDyStIu23KTdomIrBwAMJK1R44DUBzKf5D+hJrjoCU1HwYElkM8NgHO+++04xmGoy+/tmKp28yNDM5opTj1T6efxqMZDYobMhsvjYyrm5CyZwYcQfrNkzGFOyfpoYoC5wxEg4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFD80FA6330.namprd11.prod.outlook.com (2603:10b6:518:1::d52)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 02:55:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 02:55:53 +0000
Date: Thu, 27 Mar 2025 19:57:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 04/29] drm/xe/svm: Make to_xe_range a public function
Message-ID: <Z+YQAiGwZyxsiMtN@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0267.namprd04.prod.outlook.com
 (2603:10b6:303:88::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFD80FA6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 115d0c10-27d1-4c57-4a3f-08dd6da40db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a8Gjb7/Drkoh4Y9C3TxriAPspkwaabpB5ylTBzsD3HCLwYsLWErd4RWRC8Ot?=
 =?us-ascii?Q?qltfQclQgI0Vj6ZrR0YY6dYnPo1mvmFKldbDlk6CQLmA92u6vsAV7Hvmb1fE?=
 =?us-ascii?Q?tUU6m6joPhuKtEbGcf0kkhmV8yB/0vNfK63Oot/WfEx6RaMjaDvb9YyX1q7h?=
 =?us-ascii?Q?AFP6TvYnOMMv/IBuUDDFEoFm6nH9RhCjzeme+GU7Enk0XLLPeTvKrsaUq3vx?=
 =?us-ascii?Q?gMdajeDRR/mQohBpSTBHmqezOIjAHv61NHnAkwlB0wC8p4i7Z01gwdEwmb09?=
 =?us-ascii?Q?m3dQnHcoXdjI9gH6CwdoiqhPLPKl9Ve2xdPpbQwZwsIo6x2ILsB02t8gq9vL?=
 =?us-ascii?Q?m4Ha/RMk4ClymFCNak77epgqju4kjrWaegcOy9lrTgAnZm5qHe5KnsMvWqMq?=
 =?us-ascii?Q?csl0Az6jndVZ8Acxh7/ggdwz07JVr+ngqp55JL7cDBWIcUZLUqULYV292NXO?=
 =?us-ascii?Q?M4s+XwkREGRO+18hoXM+F1U/3LA78/JNjX15QE/vES0hd5UEEUryWVznxhIE?=
 =?us-ascii?Q?bku9wmEzll4P2ihDZz7qsgttk4X+A9UHot543GQ9o4CDPOq0dndfDaxCyEB/?=
 =?us-ascii?Q?P4lY8uMY/3+W7xsqjglTWV+KZGJpRrux3NCaCXepkDCEqmWz0ovTOJKukWBW?=
 =?us-ascii?Q?ZVlRpO/Iw0vifS9qeehH5lrL5Tm9PLwD3ffrOv3t9CyRsMPgDla4H4CCJI9p?=
 =?us-ascii?Q?aVd4L5Np7sLopnPojj3Ysp+1TVhPonI3gwJZAOqb1JHm8VJnmB5k9D7yui/f?=
 =?us-ascii?Q?QfaeZTdmcP66fFDvHEgM96mLn5nNLw4LacHZZG2Lf+T5ip0WYZf6PARv3YsC?=
 =?us-ascii?Q?J5GA0eGb12syS6dc5x2u3SRLZaakY/FjC2lRoCcqIJ3ZFOC4Rt+9XkpFQOyt?=
 =?us-ascii?Q?ceV9h4jhk5jSQo5FVyFSW9OInoXdQtKy0YbBvck9hTfAGVp0B2x/UNqvOFG9?=
 =?us-ascii?Q?no/sJGI6PxQ1ECuy8n++7T8M/FHjpCG38bOPorxyYwEC6zi0j1sCwkmEs/cV?=
 =?us-ascii?Q?MM0tFNFhnw3c2/C3w1cUtYqRerJcMhqrTS3uyM5ctZlT6WKEExTPF2+qHYPX?=
 =?us-ascii?Q?f9s0RYkOF+rIPxE6g417KPHWdpv/TiHzGTREvoMv2hPVN87BDpB9JrMtzFh2?=
 =?us-ascii?Q?ZV1qbu/ZDKP1wo74jNJKm7kzh8lVGKRDRK6g27uJX/lINt8vJIna6L2rtB5s?=
 =?us-ascii?Q?wGylOTCV3ReD6gwJbSYV/d9U3h1pa5Uwg1D/4DW9EDxNUdw+QvefJfs/zaTq?=
 =?us-ascii?Q?A/f1RimmdBeA2v3f/hXRB+O7nSgOaMT8TIZdUAZgBKRWyMr8GrM+iHVs6e+h?=
 =?us-ascii?Q?kdUl5dTFKtyy5ehE5pC1b+em45zt225thMhziky1kXFOvE4EFD2ssLTB/O1v?=
 =?us-ascii?Q?LyAkJPpacXmKL8CAxfCEzTg5ojgs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MTL7WxanqtwaiawXakLuJK+NguLqGqSHTo+9kE5t/y2aXlC8O2cg13y7zJy6?=
 =?us-ascii?Q?kwEPNXC8UUZZ2MoXA3WPHSbB2tqwZp4taFT+iSqRDz1E3V6xAr3jsGqDVcHI?=
 =?us-ascii?Q?Wzjc0s697t3V/LYqvDUqfcnmXRh5nH7l5arFvAX+/zGctq41HMk+yxj8ewil?=
 =?us-ascii?Q?HondzKqPDxWiXKUqs6+Patb7im2AAMlXTqUvY+K85qjLwATauxildyyLDeTF?=
 =?us-ascii?Q?xfk9v7sdnR4m6BrtgA+NKhWefm8jFxfyAmIz9ezBJCbMFTjojo2DfMApaBG1?=
 =?us-ascii?Q?Y6uiPALFro1zXJCIowuxGq7mMi+PuTjXKLpN0MIG0kxbFdGXs3j/3BD4pIS6?=
 =?us-ascii?Q?pXJicw4qjQzxC/8clTcGXnQY5TNR7GOLzf8Tcq7zJcGvg8NN1+k+EGWQPGeP?=
 =?us-ascii?Q?6FqruzaQK6IIGf68ri3cBXsyQNWP4w0o5zoRA8PDdlT3fcBGX3j8swVJgH/W?=
 =?us-ascii?Q?ucQBja8QSOkZJPBerMSr2qzEPJW0+tfHltml3OglqiP7KIClDjSl4iVZROiw?=
 =?us-ascii?Q?8cHykixN9Rgf3Mzt65Nw10El8KKQ/1NSS/W2kGFGjtWkHH94VE9dM4shIYee?=
 =?us-ascii?Q?hxDgLHqed+JOJ8Aj0ccqRc1GnzdVVE9sJzVXmij3q7nai87ye+V8Gjr8qgWE?=
 =?us-ascii?Q?XUZC0kGxqXaBNhp/zc+1v5RhyUxKGygqSVu9gLvV6o/WMVI+KyYqsbBf+j9S?=
 =?us-ascii?Q?dWbUFkA89KG8st62+E9Z/qO+JnSqqOtEBeES4x8zK1E5KWaVWf1l1Ka9gKna?=
 =?us-ascii?Q?PJpm7pH9r3WqbQLZm/3CzUXFCLzbBhEPjFQ42nw+PwN1dpx2eTQLmESCCspV?=
 =?us-ascii?Q?/VIQtlk+CfHBfzaPFimv8Z1baQTTOmFPe6iVWW/2xurvfMvCj8SNSOkvDdEf?=
 =?us-ascii?Q?RjWNMue1rm3uowFYbriIKQ1bv7WodXG0jMc/uLCzImQpB1dPq14fiLKx2RRV?=
 =?us-ascii?Q?bpDQ8hPj68fHYhAhCwp+YH/YwCp1bXq7p7OqC7KonqB56brtJ+LmA2ss2omx?=
 =?us-ascii?Q?9xg0D6E1U0mE3afLtXzBcW6nw1L4nuEYnVf2ofFvJvEcuXemBfhzUZlDwJwv?=
 =?us-ascii?Q?0hVX/ai+sdFNcJ01Ai3GYJNN2s4ZLX7Chbc8Vhng090Wre0Uss4YmhnWG9SQ?=
 =?us-ascii?Q?5KB2T0LRnd4tCHiwV09DhgXStsdzXQShFdvPW17JgsX2BIBESp5tlBMW7Yfo?=
 =?us-ascii?Q?56WwrM+TM2Vs/Qnf4/vVeiZzDaHkUOVOo0l+dvYVr8PP2JK3q7cX4Zf/6aQ3?=
 =?us-ascii?Q?KkFw4VidQ/uZ/BprIiZ3o6F0rVw0ZyJ1jVAiRPVdSzEiVgo4pxdbrCymtyLe?=
 =?us-ascii?Q?Cs1ljubK9Bz09KjIaj0trj5hBBqnWoqoLEpZWqiMfwDzw/ZmaDvBIXETRfp4?=
 =?us-ascii?Q?VT1kit4ApkiSRWEWjTEy6vePCpCs6ozpAEsEvtlECw/F0iMKe6pN3BBy0m54?=
 =?us-ascii?Q?yDhMSTWoIBjmykrW8D0KDJRShtCA/wdfoIu9j4GLojVM2Qf08VnxedGmY65p?=
 =?us-ascii?Q?ZyclcBEziu3P7sNcdF3h+w/f79qCiXPLy4oM+v0msJ0FtX+1uFKf1iX9RUIy?=
 =?us-ascii?Q?qEt7gR6l44W/BcOW5FgHI3jRALGSkH0J3qagGcg7Ex/LPQ8O+kxznchO6Je7?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 115d0c10-27d1-4c57-4a3f-08dd6da40db9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 02:55:53.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUOP/CKwYiWuvywkubCKqVOLoWdsyR/qlAzwrf7GJRequOJKcSAAaeyvUsWXRX62uVCwWxx76hOHwKXRqKsO6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD80FA6330
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

On Fri, Mar 14, 2025 at 01:32:01PM +0530, Himal Prasad Ghimiray wrote:
> The to_xe_range function will be used in other files. Therefore, make it
> public and add kernel-doc documentation
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c |  5 -----
>  drivers/gpu/drm/xe/xe_svm.h | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 2d2b385b691e..2b041f44730b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -93,11 +93,6 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
>  	kfree(range);
>  }
>  
> -static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
> -{
> -	return container_of(r, struct xe_svm_range, base);
> -}
> -
>  static void
>  xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>  				   const struct mmu_notifier_range *mmu_range)
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 976059545173..1af245400799 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -139,6 +139,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  
>  #endif
>  
> +/**
> + * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
> + * @r: Pointer to the drm_gpusvm_range structure
> + *
> + * This function takes a pointer to a drm_gpusvm_range structure and
> + * converts it to a pointer to the containing xe_svm_range structure.
> + *
> + * Return: Pointer to the xe_svm_range structure
> + */
> +static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
> +{
> +	return container_of(r, struct xe_svm_range, base);
> +}
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> -- 
> 2.34.1
> 
