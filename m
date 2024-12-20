Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E98E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4310E0ED;
	Fri, 20 Dec 2024 21:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a955JMn1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32A10E0ED
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734729789; x=1766265789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/f1Ne9EHpCMLRbJb0CCxZn7yDlmkDT0EcalbQHK4tHQ=;
 b=a955JMn1wn8NeYfSEnX8iqlCtH1eQ0EcE8ob/MfvYcHyMLcPTun8H/tJ
 uZKP1YAVfVmadS11FmuVSEY9p0KvsOO9joTQoPTgbP/JdlesmIuhU/no3
 +VfifB6dRZa96UVaeCkmMGIrXD5pRkTl9raGQ24LnfHdYyM47a4enK+Gp
 APbljO5EFY5GKBMKFE3lxaQd8MFb3NXixloxy+uJF5wOTLbezhvdvwt7W
 pTDoUU0o1rcjMUURteKw0o56DXaT0NAAxOYbMnZ8WRFwIMAJGjoQPS4ro
 vzA6QzKWJAB7edeV5NWS32ALTTJDtuzK/wMza8b4LAwzA7kwUPgqBpTnc w==;
X-CSE-ConnectionGUID: 3151kLWjRP2BCCIFdQYmiA==
X-CSE-MsgGUID: R4TPmQ7ISGOnhI206heA/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34568365"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34568365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:23:08 -0800
X-CSE-ConnectionGUID: B/bJ3JsvRJSY1t22IF0wXw==
X-CSE-MsgGUID: Tpf084PETQ2HwuWjdR3xpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="99132346"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:23:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:23:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:23:06 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:23:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWUUIThKMuO1yKsTAoo6ks3YO58l2XP7HHKX4MGEbB0DCJoVwV/9yckkXxIaBIddslPr+NfuHqg8ZFuD1Llg1kTzKMqP0AhiBvSFbfo7ESqDp8wMJVcZ5T9g0C8t4UpKZy6eem8ImAYjf3jFQQLP6wE52pllLfJ02cXdXmUD4vrw9oBUq9uCqlVQSyQ35AIRJTRdZZHp94tRq1U8MPZN/GsDOw+CQsZl7u99Eaemr6HsWFUOuRYCTxoZC90B4SjPGFMu+QUtsHpjsiCfEF80YMj+SCMhSjVaUV3OaGSzoLtAuseXw3CQ5jWGFbhG1tX8NX3CuacPCHBQYpjlfq/EGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0yWA3GKNz8OXImvfKdvVN4DXrwEU1yNSb/XFnUJmP4=;
 b=iTaJpadOAPUmZL6vZj0fmsK4HsjPjEu99peqMYjX9mvrFJaONLIXuIzBrEVTpyc6QaGn0YNGpJQsOADmleNJzNfvRWSOPYcGiaJzKkWJwggLHNeiullMl6OuGVO4NIVBPMXN6wputo9W+lNYIsCGHMlyIScNK+D4iqgO0GIEKlQuoTUEnyorHXNBIs+iMTS5oPvUO4XbvBBsfVn3pzjRL83vJH9GKphcaEuNog4RmuYrYdjye2TDY/1F+00mVd/IhBqLEYbPZVng9pYvch13hgzSxex1YsuU5p+ej04PeFeA/XcA/yR9Vo7CHupBWkDNAQWGaPC1arOaMvmbcU5E7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7092.namprd11.prod.outlook.com (2603:10b6:806:29b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 21:23:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:23:02 +0000
Date: Fri, 20 Dec 2024 13:23:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 09/11] drm/xe/pf: Use GuC Buffer Cache during VFs
 provisioning
Message-ID: <Z2XgYxuAoJZOyzoo@lstrano-desk.jf.intel.com>
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
 <20241220194205.995-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241220194205.995-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:303:8c::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd2b23f-9370-451d-bead-08dd213c7c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cJ8IgpAgpyi9v6lJs863MossZ9cqSrNwnZdj3UeN8l6KbtF1pYeVgFsxoFCv?=
 =?us-ascii?Q?oVZcwEdB6LHHjsQdWPbaAldIQT5iJZmNkF5aTfAZJzJ9dv5FCG7KTKPjQap0?=
 =?us-ascii?Q?G1l1M81xuU4i+ALT9rDFzPZpeNLA6b3SgX9T/bZ1+zlgzlm5HNJFg+nPewdn?=
 =?us-ascii?Q?lW3GbX8uWcmKj1q+WgC2FNV4DCTFMmQuAhntWCYfvXbtxpDno9zDmmU2DpMA?=
 =?us-ascii?Q?r51rl4x+QMKFRicoFPnusX0X8HnQXUAEHJBXNtlDlINVAk2QJx2ZV8cl2ihT?=
 =?us-ascii?Q?eIq9uXc1Zwq2qagit1IGyrt+odfc/o0Lzwmq9LJCj0OAozncoYV8xeScmt0v?=
 =?us-ascii?Q?F+DIIKnLnbC8nV5NFoPTQDKMuXBhalsCt1NLvN3Q3qNhNJwqNkklKtHlQWut?=
 =?us-ascii?Q?ugopA+GD2MkdTkxbCEDbkX5Ib+srNlcqXUYQ2ac9vh9UEQFPF2M0r3vNocMx?=
 =?us-ascii?Q?g6zRYfBVvbCCE22lYbOcwCzgbkiuQVJmTFLfNQqEb1jjTDn9YPCiwIo1LD4Z?=
 =?us-ascii?Q?Q9Z4uZId579JFSZfzgTDtv08w5mLV7q00XqEkT745KGfFkQWQrfBw9Tdwedl?=
 =?us-ascii?Q?JfpJ6MGlEjUMJ4nr76jUJCMgZwCpohd8TlgLZLG8pkV4fZybrh2s++uwIw3O?=
 =?us-ascii?Q?NlRLw/QhvdXMAodpX9jI6McR/MGQC/ULRZnH8AVTIifACOKSV0hedWXxuaFp?=
 =?us-ascii?Q?uWrFUMOYbdK84J1exHyr5XPscW9iIQKLySZKBUf1BBRwVhruEgzbnOd6xVgV?=
 =?us-ascii?Q?QxsFIAc+kU25AmlZtU0qwIg/MTjZdL/H4F7bcd+iNakbkIAwETI9EOglNhW8?=
 =?us-ascii?Q?HCkWmZ0rZY9TN/Uf1I2PpkVcBhS/0OG7/XQ8I6A6YXNeDDwp0GXdsOic4M1V?=
 =?us-ascii?Q?422o0pgKrW/i9el5ZjqBxO4VESAF44ZfZDo5VS+VHCNn2FCI1E9KKxogtaYj?=
 =?us-ascii?Q?ZwHcRvWWJ00n8I3uTYs8pHI0ydTI5dW2ifokjBroOZDpf+gGo+UgrYIql+Wn?=
 =?us-ascii?Q?tI3Og76ZeIb/scwBkihm4G7+2JGKHJp67GlZ0HaJWsBvZYuf0QCelh59zwsv?=
 =?us-ascii?Q?7erxEFnM8AnVcOooyi+K01nKrAKxI/ox410kxEfAPfnee3QBPO2bHD4iR+rS?=
 =?us-ascii?Q?IDwK66038VpXy26qp224VHNq6VCPFTpyfK8bsmsggz/yY2tCHV4TEEStIdFn?=
 =?us-ascii?Q?0u1bP712hWggwCyBEcOzkaQMk5GqADFN87YPXk6S4fwQj2+p801kLdYvvvvH?=
 =?us-ascii?Q?ASOgGauEc43z/VceH5/XBiiJzl8sweyAtrppSHtTLcvrtuDZ/ydtwbRHTU+v?=
 =?us-ascii?Q?eMvXTFfLvLiIaU0Lq/yRmL6SBfnyPD5MZ6DG5PEr7WvwcbwsXQyZyDRpMBAm?=
 =?us-ascii?Q?bcSJd0gU57fR8O08L0KnIiLG5/Wx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hLkxDXpynolP6Nw1B2jLyxfxZW43/VQNto0YY7E6PAjGdl+/OQFdbE8uslJK?=
 =?us-ascii?Q?KXuidFCkV5CK2s1O+P7AMb2ynt1yypdwTybZeYFNACEZ54jgHAascq5SiKZ1?=
 =?us-ascii?Q?FRIrS3Yg0oqvWVixddPAYy/RYWj8unku1JuPYRZTa4sFKXE1QRzZL8jqEGrB?=
 =?us-ascii?Q?A3sHvH7Y6iEXTDt2s0QhRwN7zz2KnMQ4IuZrhIkwl1Lw9oH98886dsosfg8x?=
 =?us-ascii?Q?uqmeysYS/s7MwwozWpqeVNOxE9hlupHlMMkxTRw0rwdvGAJorgUgJRmMZi1X?=
 =?us-ascii?Q?70Ym7/K5khlWG5StVjSPVEiZc497hoh2MAMl+8c4TbquQM9+EHtEG2OYX7kH?=
 =?us-ascii?Q?nioYPHWbp7D8ytm9DmDufJDG6jQ41Z+NjbHRIxYgTp9EcIy3Kzm9s8mnoDt3?=
 =?us-ascii?Q?DS9MX6KSjK9PSoAq9i54GbeRYGsiqPAjgcPfoqKloY69l47njpIww6K62WRB?=
 =?us-ascii?Q?hfSGCL2IpTV99vDUlP+FfSPsXxZBt0Z+vtKiueyE49ZFS4XGuG7Iw4RaLSH5?=
 =?us-ascii?Q?4g9GCAg04gSCSEcl4wMWJr3MRQ0ah5OlkXrfmCZSYgtYxQbi/RRsDl+DYs27?=
 =?us-ascii?Q?OTUWm+0gh208ov+WPGebwxdAjMj1ZWsnumMip+47UCq5Hvs//vPlF4Y8HZvL?=
 =?us-ascii?Q?3pizWHztzku6PsZENlvt1LuhnvHaK61Rg4BJvOIrkHdD32/TRQ7Y3aQZ11lB?=
 =?us-ascii?Q?zfkKTaGeWWdKfHppqv6779ZDNdrYhgqy6UsaXbpxLrf5GuWAyvw5N5LiujlG?=
 =?us-ascii?Q?tbSdXM65XnTzZ18bP0KxdJ9r+oTn6dWDXkJjlm5fbX37VJiws0dQ5U6KO3Q9?=
 =?us-ascii?Q?i2zTAJwmwmWDGlz00f7qc4RY0UzqDACkuTyAitOARAUyQtj6NpIawUWao2kX?=
 =?us-ascii?Q?3Rb9b77Fn4vdITti325v6d05VngsFIVN6kF6raisIC9pWJNy9rupLVWNnwxf?=
 =?us-ascii?Q?ZlrXKhhMO0cNzId5ttn7Y9PA45VzDKATPJnYX2c11MTCyeWgEE4QIgpNOb95?=
 =?us-ascii?Q?NQOkkjj3Q5940lzikuFE3/R6lcnbn8YUraDJpv1jHcqfiaRWZw0+gLBijb7m?=
 =?us-ascii?Q?GDZ+rgS6nMYbgj6/Xo4+juY5CgnTjqCReIAvbAd3JBcdeWMjtZPtz+UDRgAy?=
 =?us-ascii?Q?M5PGoLIl5Ctes0erM+8OQPBXkm2UZwp80z9ruGldWbnBzODWLVe23jNmxjC9?=
 =?us-ascii?Q?3Me8h039zgvguugfWGAmAYdOg1weOSVIEq6zCWlBONx5eATsRsUweq2jx/px?=
 =?us-ascii?Q?U//rr67KO13Uuce80ex9/mLFk3Lu57hNfgS+97Au7/4gDqW5BB/h9h8Gxm8E?=
 =?us-ascii?Q?vuPUEGZ4s60SxffyHHRslQh0qyk3ihjHc0pHXnUt0iaYoROJZReWYiA5NTDd?=
 =?us-ascii?Q?7NcpQcJmC3iYDax+CxvnUD22LiFoa5Sw1nNqOMdG6YfFgr3ODf/WTajruhng?=
 =?us-ascii?Q?Z62OdBxN1ZKySj1wVOcijjZAloPtk1u68PR+xScNC1gvVAPo/Dxp6T/lVmbz?=
 =?us-ascii?Q?RdMRfZQ4LHg1+hnRLrFuYkLCgo+WuBJ0p3nrG6rWA/p+32HVp1fnGIRnfr3o?=
 =?us-ascii?Q?oALDNrrw2WVZsNgkcGBbEJhaSx6LapM2VI0worOxiKeL9ZrI20ihyPoo5ffF?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd2b23f-9370-451d-bead-08dd213c7c6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:23:02.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VdI6iKE5I4zwmagxzb9AE7TFd3VS4H0iBxa3X6C1Eev8c2Ydy9UyycYMODXN1qFjWBRtCfjPQ2+z85A/sUdyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7092
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

On Fri, Dec 20, 2024 at 08:42:02PM +0100, Michal Wajdeczko wrote:
> Start using GuC buffer cache for the VF's configuration actions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: rebased (Michal)
> v3: make sure to call xe_guc_buf_flush() (Michal)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 68 +++++++++++-----------
>  1 file changed, 35 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index bd621df3ab91..c5c0879d1d9a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_db_mgr.h"
>  #include "xe_guc_fwif.h"
> @@ -71,48 +72,27 @@ static int pf_send_vf_cfg_reset(struct xe_gt *gt, u32 vfid)
>   * Return: number of KLVs that were successfully parsed and saved,
>   *         negative error code on failure.
>   */
> -static int pf_send_vf_cfg_klvs(struct xe_gt *gt, u32 vfid, const u32 *klvs, u32 num_dwords)
> +static int pf_send_vf_buf_klvs(struct xe_gt *gt, u32 vfid, struct xe_guc_buf buf, u32 num_dwords)
>  {
> -	const u32 bytes = num_dwords * sizeof(u32);
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_bo *bo;
> -	int ret;
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL,
> -				  ALIGN(bytes, PAGE_SIZE),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				  XE_BO_FLAG_GGTT |
> -				  XE_BO_FLAG_GGTT_INVALIDATE);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	xe_map_memcpy_to(xe, &bo->vmap, 0, klvs, bytes);
> -
> -	ret = guc_action_update_vf_cfg(guc, vfid, xe_bo_ggtt_addr(bo), num_dwords);
> -
> -	xe_bo_unpin_map_no_vm(bo);
> -
> -	return ret;
> +	return guc_action_update_vf_cfg(guc, vfid, xe_guc_buf_flush(buf), num_dwords);
>  }
>  
>  /*
>   * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO if reply was malformed,
>   *         negative error code on failure.
>   */
> -static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
> -			       const u32 *klvs, u32 num_dwords)
> +static int pf_push_vf_buf_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
> +			       struct xe_guc_buf buf, u32 num_dwords)
>  {
>  	int ret;
>  
> -	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
> -
> -	ret = pf_send_vf_cfg_klvs(gt, vfid, klvs, num_dwords);
> +	ret = pf_send_vf_buf_klvs(gt, vfid, buf, num_dwords);
>  
>  	if (ret != num_klvs) {
>  		int err = ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
> +		void *klvs = xe_guc_buf_cpu_ptr(buf);
>  		struct drm_printer p = xe_gt_info_printer(gt);
>  		char name[8];
>  
> @@ -125,13 +105,35 @@ static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs
>  
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
>  		struct drm_printer p = xe_gt_info_printer(gt);
> +		void *klvs = xe_guc_buf_cpu_ptr(buf);
> +		char name[8];
>  
> +		xe_gt_sriov_info(gt, "pushed %s config with %u KLV%s:\n",
> +				 xe_sriov_function_name(vfid, name, sizeof(name)),
> +				 num_klvs, str_plural(num_klvs));
>  		xe_guc_klv_print(klvs, num_dwords, &p);
>  	}
>  
>  	return 0;
>  }
>  
> +/*
> + * Return: 0 on success, -ENOBUFS if no free buffer for the indirect data,
> + *         negative error code on failure.
> + */
> +static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
> +			       const u32 *klvs, u32 num_dwords)
> +{
> +	CLASS(xe_guc_buf_from_data, buf)(&gt->uc.guc.buf, klvs, num_dwords * sizeof(u32));
> +
> +	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
> +
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	return pf_push_vf_buf_klvs(gt, vfid, num_klvs, buf, num_dwords);
> +}
> +
>  static int pf_push_vf_cfg_u32(struct xe_gt *gt, unsigned int vfid, u16 key, u32 value)
>  {
>  	u32 klv[] = {
> @@ -304,16 +306,17 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>  static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	u32 max_cfg_dwords = SZ_4K / sizeof(u32);
> +	u32 max_cfg_dwords = xe_guc_buf_cache_dwords(&gt->uc.guc.buf);
> +	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, max_cfg_dwords);
>  	u32 num_dwords;
>  	int num_klvs;
>  	u32 *cfg;
>  	int err;
>  
> -	cfg = kcalloc(max_cfg_dwords, sizeof(u32), GFP_KERNEL);
> -	if (!cfg)
> -		return -ENOMEM;
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
>  
> +	cfg = xe_guc_buf_cpu_ptr(buf);
>  	num_dwords = encode_config(cfg, config, true);
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>  
> @@ -330,9 +333,8 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>  
>  	num_klvs = xe_guc_klv_count(cfg, num_dwords);
> -	err = pf_push_vf_cfg_klvs(gt, vfid, num_klvs, cfg, num_dwords);
> +	err = pf_push_vf_buf_klvs(gt, vfid, num_klvs, buf, num_dwords);
>  
> -	kfree(cfg);
>  	return err;
>  }
>  
> -- 
> 2.47.1
> 
