Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9089FD3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 05:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FD610E131;
	Wed, 10 Dec 2025 05:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlRHMOzk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B4810E131
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 05:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765345622; x=1796881622;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0KQ6zGK5BdpkUdGa3odcbMfJFZln1VE7X4KrxnXqaZo=;
 b=GlRHMOzkqFPLcVze/4NGMfbu83T2krs4ScNBuutPHm9IJB9W3/F0q6oT
 X50/15TlX8FDLNjgiaxB+hjo++Lzop83co4y5Okh6QzDdtx6ZQpMTnF+W
 JPDRCvQzYbYbe4PzvxqVr+mmh7l+MLFTupWDWPZ4mnk2k/t3MjhB3VP4F
 6sSJgV2BZJ+YOttdF4U35MwgNXGd6kKhra2NUJgaaf4ZbU0Y5XNk77f+3
 /7KkT6TDcmEsuYDc44lSzapH8IxYlWngWDT1yQLbSdiEtdMd6gDFeBlGm
 HJhDePQ5rA+XirRJ89Gsbz9FrnFtynqjwiOXCwKA2cSGpIn4k6IiscM86 A==;
X-CSE-ConnectionGUID: AGAS6GH6RLuPcuMdKB2HfA==
X-CSE-MsgGUID: AW2WP7WAQ06PCGqJbuHWOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77926950"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="77926950"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:47:01 -0800
X-CSE-ConnectionGUID: w3+CwE7uS76NFJa7xTEP7w==
X-CSE-MsgGUID: xy/svC5+TJ2odktyiaBVxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="197203467"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:47:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 21:47:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 21:47:00 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 21:47:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWyTLW4ePFF/NV9mRP3l5kLIT9fR/8TycyVHR1g5MXYdQNOb1NAO95sdyAvNW1XOI7rhUel5H7TgO6rBPD36d8S36S5e6KOFrqvLO3aluU8ufqCjfT3/z1ZruPm7AKpaP6pHzti8PQkFcC3Zl5Zbgj6W3RVKcbnZwbhYtpfJko4gmby4qMyxbIUqsshjKNk2KCtDkoeQR2fpUEJl+hZgTifDRmpibr3ch+aI9rV84AYBqGHWEXAwh4+ppc2mRFqBNGEsRXe+wtR3WHyIkhUO2h55mKQ6EvJJmBR6qV+1Gxtvn7U9P1CiAMfP9KEd8pcDLfhoPrr/Ad9bFfQKwGXVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9zmPieqKLtuuTAfL+Ipdz4fqv6Z8IBwipbhiFWCr+4=;
 b=bNlXgFY9CzPkQEkHCPLrBMuzh9ixHDvOZaxGvOoqEG2QH9BP8uxj6ag60djxxsK4ybb+XX1ayiQqwJlyRkoVRprZIoazKQ8mgK5iRTls3bgxsW4GF5dzEEUrhcy2MVXmZ76RhFAYi8jid1zO65uXexZs1P2y92EMNRngd9vDrJUZ4OxEeb+4+88HFgwEJQ7Zs7ge8v9Sit1yWUaK725giXoYrelaxbdFulNlMzTTq8/Bf0Vw3jaD+smMIPB/KGoPofJ/sYiXpDBS3hJxVv9LvyK2KhZnUhdGH0S5wauEC1Nz44RZjRcKXRzDH3euZYRaQffC+c+gnPqv/DRtQZHpgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 05:46:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 05:46:59 +0000
Date: Tue, 9 Dec 2025 21:46:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v3 2/8] drm/xe/bo: Add purgeable bo state tracking and
 field madv to xe_bo
Message-ID: <aTkJUOI5vTQKTbvp@lstrano-desk.jf.intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
 <20251210043112.3267620-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251210043112.3267620-3-arvind.yadav@intel.com>
X-ClientProxiedBy: MW3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:303:2b::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 289b0882-85e4-415c-3862-08de37af88da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?50bMBAvKPFyFZzZYLzN36hOyxZbtiBeYBQGJYYR6ElaixoIPYIGLdtwlmg?=
 =?iso-8859-1?Q?W5ADrfXDrx3MQwzwOMJpO7iXvRQUGk7TyOLg2NQf6+IE7q6bVs5Y/SFgE1?=
 =?iso-8859-1?Q?M6WornvBATkDjj7IOyeeIKOyCvJZeRxLB+AyqndC7dzkYDta7L92KgKGD1?=
 =?iso-8859-1?Q?JWzKOr704V1eucoS7VaVbi7QOCnZe6cj28bysoZZD+zi6NL2iIHDkeSIJZ?=
 =?iso-8859-1?Q?uuMTK00ZtTUPQc0kRen1v6r6M5g6fEtqb1HRH2IKppNOeBW7/PMujIlYKY?=
 =?iso-8859-1?Q?HlqiXctrTqLB1hSzBYbxJdB2zmMZw7qNae/XGI7rvpIQu2KpbAti0p+8fv?=
 =?iso-8859-1?Q?cELyUwQ5Cb1ESvcOgAiCgtOzIXhmb1JDyQKAPLnMPwgJwIbMgfIAndW9M5?=
 =?iso-8859-1?Q?Kq1FEISKOGmMnfnBJlTiSkHyCN7c0zWyiv10Hw8WKnAwQbrcfcaxaJhRV/?=
 =?iso-8859-1?Q?fdT1PvgashlLJj8ITVL5mxDCqGOurcub95VM4lYnte81EBuGW/eeRtTeIf?=
 =?iso-8859-1?Q?eRBlUqn63EIui9j8YV4v8OD+dvlGt+Ym2k39+3+CaSkR058FHtzlGBopCS?=
 =?iso-8859-1?Q?kyI9lG3LZ5KibQ/jfIaGunasSOj3JcDIUdgLtCpQQUQtjPFrN1qUjzZvnY?=
 =?iso-8859-1?Q?NDwFF0Sh3pm7ISE1TKLPFiDD5nJ1OLjDb2lEJpYTFlTt7kmCkzbx4lnXkl?=
 =?iso-8859-1?Q?3bpdwhW4bmnPGDnJdW1fha1O8E6kz0mGyK3VCx9thbyhcPqMtSXbqixZMf?=
 =?iso-8859-1?Q?7++3RHLQJhtIcG2F/2MmzqXZY0VS0/wNyKwMsFcM4i5PpFWACigpowikIO?=
 =?iso-8859-1?Q?lKhrjirxkiOv7yQmaqLdyo94V6gsrMo2Vby2fCl1YLI2LU4/2/jW97oesZ?=
 =?iso-8859-1?Q?Ee4x4+YjM9+1eLfVF9zvA6edy4XkQfoCs2G5sf8dlDwetyumGmtv4I9xQB?=
 =?iso-8859-1?Q?UPxZ4juL++7gxbK6hQXE83lYjCvu1fWi9IZVGUxjJoZL2nA2DKaUacQLaI?=
 =?iso-8859-1?Q?/rFtxT6VqenAMSMBzVxw6D1KRfh4NcCMX87JlGLUm/60pPZT5WvOO9H7pw?=
 =?iso-8859-1?Q?APZIqUhkLrToueNc8ROYjR2oHZ2klJJSF6DEiXhIeeTHK/u22oFpEs/+I7?=
 =?iso-8859-1?Q?f1+s3s+7d9y58RoITAgplNVqZgTmcGu6MThPSa+cKEr8IDpFTjM21nLQEK?=
 =?iso-8859-1?Q?+3I8a3FeP0oZfhfjMlst3qOHM8GtCC6GN6Mxokpuqmr5MFOL1QX/Q/VHn3?=
 =?iso-8859-1?Q?z1vf/xuT2JMISBifG9oKLCLLp+3H69ZPjM0PZd0IPA9gwATcL8+EIm8JoC?=
 =?iso-8859-1?Q?515aBqIP3NmLiwPnS0+xBMl+wECQu6aIKeA51F2jyvOJOxR50YdYppJNBL?=
 =?iso-8859-1?Q?hNdS5pPrCmB6jXZGIauFzcNZ0lMdssFAN2P0yJ6+7/170PEkUUqPJmiza3?=
 =?iso-8859-1?Q?PoLyMJaS9qlIrydNifL4DMELyA1moPvbBqhpmIkmNuL4FA1eAnOiRjru+c?=
 =?iso-8859-1?Q?sKyQroJFLYh/9qUPVFj2dj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wdVkElOf+N0Ec4xGZLDXMCVT5z9Dg8q3GxHbnaJAeMd5D2S0yULtt0cwD8?=
 =?iso-8859-1?Q?k8XpfxsZzgYQh+dwtIuXiNxByPnIKYEOxA96Au+eA4lsFu7XdkemfHNxV1?=
 =?iso-8859-1?Q?0VPH/ZZwhdCKepT5WqyCeojSDZJP8oJesQGC2G3406pBnBEqKh/ZblhfOr?=
 =?iso-8859-1?Q?9qLej0yVRr8ckBb39VDc0aK0j810Ig6y0Dm1GWjP85LdYpaJ8l3FF838LP?=
 =?iso-8859-1?Q?T4MphVV0jw+BelJ5y4qqHRdngUfu9GRM9gjuh56//KBNMo6korf8+3zWlh?=
 =?iso-8859-1?Q?c/Etp5iJuYA6MO9TFn7pVmlWeKJptjQ6DNUl7P0sBew7mQZOHc4b6h/Uc4?=
 =?iso-8859-1?Q?sezebO3kx6uBuWXYz8ckQKJ/KtBSeXhXpishv+lp+8ZYWov4I8UEgETQZl?=
 =?iso-8859-1?Q?vgjFBTmCvAQ1R5SK4WhykLiXRQDTUx+G1h5Fs2a+7QBwcHvkRRNTqCWqeS?=
 =?iso-8859-1?Q?VJw1hn0Epr2lZ645zVpiYrIQRTyjspxkJJSisxxXpzJelTUC5Y9A7coj0G?=
 =?iso-8859-1?Q?y9qdwF4lhD6axeIGvEbns9k2mTkMbk5n/YnFBa50nwYVazmQm48tdoK45c?=
 =?iso-8859-1?Q?hqEHv2JffiV0YXA0A71pYzGNdn5qoPWFJLBsGBlERYDE5dDmvMB9nQaekW?=
 =?iso-8859-1?Q?yHoY/+wYTEBxvCASyPECWjxwp60QHR5vOLUg2mwyoe+7pGwVbr3EU73Vzy?=
 =?iso-8859-1?Q?GdphoR9t52ctthGNqKeZS3ATZbrOI4io3ZDgRHOUYmtH1wIqtWmxF0Nea8?=
 =?iso-8859-1?Q?l/rWxsRxQjpOjXaHkFsoTrJ55kWjn4nZRfcr5rl/MsnNvW9ctCyVK3HGne?=
 =?iso-8859-1?Q?4bi55BIN8uciKiWsvkmNdWaTuZAy7PDHOslsLmXZJvHC3Gpt9wAKFCyYJS?=
 =?iso-8859-1?Q?HcPI06FqkNpzwpvYI0vOExpEA/Lymz6PGwM+lFdeiHi1lq4KuR02tmeHIN?=
 =?iso-8859-1?Q?Sr2peoagP2U9lN6ZeDj/qsYjgkBHP5RTIkOtL2pYDX1UAFsOCmQ/MJ1qUY?=
 =?iso-8859-1?Q?WB7El1FldOueTLuq2l96lxjY5OUrgNPIYRmkTQXRK+yZOsnyQyf14FkYE4?=
 =?iso-8859-1?Q?u79zn8+jpuCMR5i5oi9W0YPl4XElEoizoXJQuEpZ8B2INs4G0VBKCdFPsK?=
 =?iso-8859-1?Q?WBktR2W537Vzb0Qi6kbUstCvsGTEKGN7TqhI5DKLjAsTOPN0kWBvDjhSa9?=
 =?iso-8859-1?Q?gJ63+2QrX7Jo9sCHL/kcB4MIINuFUuNkFJg6Nv2/qPG4g+jSLQ79K7tEJy?=
 =?iso-8859-1?Q?Ssdv8lsDAf4rsVhrAMaGv76T9QFYA9q4ZDGqHnQWdjvmXdnTMcG7316IBr?=
 =?iso-8859-1?Q?K39s/zb/2Zip25QWkInYALBagYqMu+NVr0NZ4DpUCTiEcjUQWGoR6aROy+?=
 =?iso-8859-1?Q?XtdSs3Fw5/o/6NSSo1kzgUxSqF1BWRoIMbXJmwXHBrVdG89b91mUcV7xDx?=
 =?iso-8859-1?Q?pL+6Zow2+9WQVhypU3AbZSSdyXEENEmg0VlYoDfVSDXKQOkz8OnB/7CGsv?=
 =?iso-8859-1?Q?/l4ujPYCJ1BLDfSgkyUqsfAsgl225f+IKr58UKKN2qSJpAojPOt5/P2PPL?=
 =?iso-8859-1?Q?WlcwXnbVBE56U9oDJ/777CSLnsGUl8EjPYLLi9Na67ncA37DXJgzlKwUZ7?=
 =?iso-8859-1?Q?rO7lT5Bb/CDWa8vcO93sZvmrYMcUlh+DBFNQ22CStqXRQ44Xmf1P5ivg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 289b0882-85e4-415c-3862-08de37af88da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 05:46:58.9056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ym20wJqbI0Xr7qlARnEWb0JjZXx5AUxWdP/aOHQ/w7f/76U+iCzXgLDozwRnHWpKIH5G74YpUYo4vbdGrR3krA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
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

On Wed, Dec 10, 2025 at 10:00:46AM +0530, Arvind Yadav wrote:
> Add infrastructure for tracking purgeable state of buffer objects.
> This includes:
> 
> Introduce enum xe_madv_purgeable_state with three states:
>    - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
>      purged. This is the default state for all BOs.
> 
>    - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
>      can be purged by the kernel under memory pressure to reclaim
>      resources. Only non-shared BOs can be marked as DONTNEED.
> 
>    - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
>      Accessing a purged BO results in error. Follows i915 semantics
>      where once purged, the BO remains permanently invalid ("once
>      purged, always purged").
> 
> Add atomic_t madv field to struct xe_bo for state tracking
>   of purgeable state across concurrent access paths
> 
> v2:
>   - Add xe_bo_is_purged() helper, improve state documentation
> 
> V3:
>   - Add the kernel doc(Matthew Brost)
>   - Add the new helpers xe_bo_madv_is_dontneed(Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h       | 56 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo_types.h |  3 ++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8ab4474129c3..1090a60f6ef6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -86,6 +86,28 @@
>  
>  #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>  
> +/**
> + * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
> + *
> + * This enum defines the possible purgeable states for a buffer object,
> + * allowing userspace to provide memory usage hints to the kernel for
> + * better memory management under pressure.
> + *
> + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
> + * This is the default state.
> + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
> + * purged by the kernel under memory pressure.
> + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
> + *
> + * Accessing a purged buffer will result in an error. Per i915 semantics,
> + * once purged, a BO remains permanently invalid and must be destroyed and recreated.
> + */
> +enum xe_madv_purgeable_state {
> +	XE_MADV_PURGEABLE_WILLNEED,
> +	XE_MADV_PURGEABLE_DONTNEED,
> +	XE_MADV_PURGEABLE_PURGED,
> +};
> +
>  struct sg_table;
>  
>  struct xe_bo *xe_bo_alloc(void);
> @@ -214,6 +236,40 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>  	return bo->pxp_key_instance;
>  }
>  
> +/**
> + * xe_bo_is_purged() - Check if buffer object has been purged
> + * @bo: The buffer object to check
> + *
> + * Checks if the buffer object's backing store has been discarded by the
> + * kernel due to memory pressure after being marked as purgeable (DONTNEED).
> + * Once purged, the BO cannot be restored and any attempt to use it will fail.
> + *
> + * Context: Caller must hold the BO's dma-resv lock
> + * Return: true if the BO has been purged, false otherwise
> + */
> +static inline bool xe_bo_is_purged(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +	return atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_PURGED;
> +}
> +
> +/**
> + * xe_bo_madv_is_dontneed() - Check if BO is marked as DONTNEED
> + * @bo: The buffer object to check
> + *
> + * Checks if userspace has marked this BO as DONTNEED (i.e., its contents
> + * are not currently needed and can be discarded under memory pressure).
> + * This is used internally to decide whether a BO is eligible for purging.
> + *
> + * Context: Caller must hold the BO's dma-resv lock
> + * Return: true if the BO is marked DONTNEED, false otherwise
> + */
> +static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +	return atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED;
> +}
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..57b4dc7012e2 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -108,6 +108,9 @@ struct xe_bo {
>  	 * from default
>  	 */
>  	u64 min_align;
> +
> +	/** @madv_purgeable: user space advise on BO purgeability */
> +	atomic_t madv_purgeable;

If this variable is only accessed under the BO's dma-resv lock, this
doesn't need to be an atomic.

So also...

'@madv_purgeable: user space advise on BO purgeability, protected by
BO's dma-resv lock'

Matt

>  };
>  
>  #endif
> -- 
> 2.43.0
> 
