Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F601C021BE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 03:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF0310E2FE;
	Thu, 27 Feb 2025 03:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTuAp4NX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2581D10E2FE
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 03:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740625889; x=1772161889;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+QSKb9voxKLoUM6ocPdNx0HmGMJRCJgbGrr/DFycEik=;
 b=jTuAp4NXHTQGnL4rPO8mBYZM65RKKcVLWF39kHzfUv4ysNtC8JgYwr9P
 /F8O0/k8nycR/Cc4F152Jc4HSsfHqmEMtmwsxlj0WrP34PRxw+CRW29PS
 Qz1n7Xv9gEkFspolbONqnyYw1Cl0fe02LpvQPH8T0ZUwkCaBchJchalVk
 uWiCoa2UVpRxSipH+mdXShxXagewL2LyG9dQKbfzc0MjMPTf5VCZM1j21
 BYIGRdhF/QyXUQ9W2AkU2C9fy4qqiP57Q0+sYegm2B5xb6TVyrQAaA5B/
 yKigfnz0MVbZCpbs77jGj3MSrqpeHZBuq5XXGFaSsBWPCY9pA4tZQW0Xb g==;
X-CSE-ConnectionGUID: u7UIWfQYQXKIj66oh6dzAg==
X-CSE-MsgGUID: n1hJBL0aSV+zHwKcU226Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52898213"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52898213"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 19:11:28 -0800
X-CSE-ConnectionGUID: E5zFCtIBTEK0U4dmixbvvw==
X-CSE-MsgGUID: zdGbqrXcRDKAkQMqryYQeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117382058"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 19:11:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 19:11:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 19:11:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 19:11:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3cHc7wZKZE4csatXnuYxnocgrGF6hDaMlXsT37yR40irH3JZyHQHEO3QAeMHJueuCd10AkntlfE9LS6sho6yuJNAGVhg8oobLxd48IDic2KnNecnaEGc/dhSo8yaI8+SK6AmwyGWU727RgKks3F+x3e/vf6Fd+L7iMUXvBlSDJ2RluAbnsgmFtcE4hiSDBZqz56G6faTISORhmNW2BB5D0zX5Mn2NPiIm4gzhN7AUXc/8dpK1BDc+FmYjWB44kz8T1aCgppv9UGrLFVgab5Sv1EX3Dmk6BzTh5B5adtmE2N/3CrBjGKAPNdRj+7H2dU5JGZwP9DYHwXOXH1DneNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaCbDPqMKpF6aU/BbRbZAKIoeu6fS8TQ9AkmjsXERBw=;
 b=OuBV6qWKXSNzxdSIWz6zDleROk83wgcUye2In0jgiimrFjYvPERkTtA5sdhNa2YKuopEkuCEDlvgYnCegEAMkVzoKx1snZI3M5by8jlQUksDtslUss1/NOrcOv9NB7CgJT6LUt9AL/04HtHLwj0idksuyPD9LZjQw/kX4PxC/J8XRHmYYs+uVUEESI8qZF8OEhOGs+Xyh9fNaEOnEmQYd+w7nNLzQFzYrwAzuEFRQiIhGF3UJkmGHvcP9I26bLhCSimSbCV/lrEMfswH+7PVE6eU29dGv5/MERc8quD8votw5pNHp12WDqXR/crQ3IB9vEDT/iPsb6MlgBWsFWKbXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Thu, 27 Feb
 2025 03:11:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 03:11:19 +0000
Date: Wed, 26 Feb 2025 19:12:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v5 2/3] drm/xe: Clear scratch page on vm_bind
Message-ID: <Z7/YGEw7lKMnp6GD@lstrano-desk.jf.intel.com>
References: <20250227030205.793478-1-oak.zeng@intel.com>
 <20250227030205.793478-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250227030205.793478-3-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a962ca2-cd61-4609-09f5-08dd56dc681b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I07jvlFuhsl0Rqnef/MVm7qkGeLKzPaELpsecI3ScFeA31AOkA6JjWNO3ygJ?=
 =?us-ascii?Q?+G+D1LiuIGzcHCSsg7hb5GOU5ISyukDl6jMKjAcLOOsHR8ukk39aPf9mxYE3?=
 =?us-ascii?Q?pmlpr/Uo+ZrYzz09BBzhDWrkp2kokz9L+4qoUCEtzD6uU7xwYCxUb5cyrAk7?=
 =?us-ascii?Q?CWMDPLnvATBKyE0aBfgqYzoI/pFs/hjC90P7ziEH5VAy5zBOTrtz4BdbUDVk?=
 =?us-ascii?Q?YMphY6ux/+NHnheTiNWzYEU0QMWDEIyj7gaguoFQPpNSeXByMHePrvYFTLGx?=
 =?us-ascii?Q?gG4uWksSGW4ZMioc5QZvdRE5Eqz0GYSzP65rABfKeJbhq1BGaOUxxB6XD+VL?=
 =?us-ascii?Q?tcUU83V4mikokfw22F3bfQ9D4wzFesGSFXn/rFtzdIfvUOErA2z1ADjM52HZ?=
 =?us-ascii?Q?Y3Pof3k5gZxcc/gPN+8HxvklNbyFG5Q/2VG1+ZUV4Do7b2awLQJQFTjw3ATl?=
 =?us-ascii?Q?OrDq4x3K+bUqGPBhqTaFBaxVdpd+gX2HKXZFMspuvWqiPIjQPf2Jl59ziT1w?=
 =?us-ascii?Q?XDQuKU/+hps4SBs8dhv9zhNghSkUOoKZhfkroSvUGm5pwgtMerQyol3eiNQn?=
 =?us-ascii?Q?5JqqxRVQ4w/VuZK3pA0HwHUHNAPGRCyqqAcspCeQ44d6IGSo5/muoKENL4If?=
 =?us-ascii?Q?um5Y6Yji+VjxhsP8DYP9u+9Bx+eW5FOEHK2WBoOHxpXF2Zs4cPAHVpdm4vJP?=
 =?us-ascii?Q?MPd6G1a7iEeQfvETXDl0S7Qxm9jBzmsijMoIDHyRQkYUpfpqe6E3sLtD6Pvf?=
 =?us-ascii?Q?c623QppUAQR4QlQE86imldQkDZMPNiL7FsJwP8Ia5c3D3EQDexR+HOtxE8Y1?=
 =?us-ascii?Q?j6uR9s2q8Ib1Ffixkw8rA7pQLbL3VWTsjcIL5qsceVXZRGrWR4tVVr+/Id3Q?=
 =?us-ascii?Q?TthsEFck7EqNJYo2p3gt2wcGCg5FDBOGEsYojR4r9rkxHmUgZohRPvjRP4kf?=
 =?us-ascii?Q?5IzOWOXFvMJCStURgr4VGCResKnBE1SU+FwOb4U6n4e+oaMQhoqcg6RJ5CCz?=
 =?us-ascii?Q?bGo3Ii99dDI8wmtIf+8EsCVgJNksznJJEvayjnE/cPAcf0fmXfF9HOxsv6Ql?=
 =?us-ascii?Q?6rN7DS42HtdyWjYRjdacw9S0bpc8lROiv3IicsYV2YL+lJ827jXOsyTHsMb+?=
 =?us-ascii?Q?SWjRaqAA03WQnvylW8JCEBfB00woROnjuxu8+1PRxVBUikyQn3z5OAyUam8N?=
 =?us-ascii?Q?0yu1dQGWxVGG91aszfGmUQ7gxE5uAX7aoXJw8gvH2iuWFeKkhXWBj16xcW1G?=
 =?us-ascii?Q?2K9QBRX5N3uHm1KkSgdmaqDjP96sgAdXukU0Ldd2Hhk5SwlH663hdXhnDWQC?=
 =?us-ascii?Q?d5j+vzq+wJHCh9LimUAL/vzJ6ke8Arzp0hhlHR6u+tKA7kHdC3/CE+Ep8LXS?=
 =?us-ascii?Q?E/PiRgBYowjP8XI6IqE7EUQHUv3e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?538SqKvu3NbNzVxECReKRSgufGqpP2YN8WBGN2rgMVIusynL5lk9rtYKOdhn?=
 =?us-ascii?Q?o4JuSSWrKQcJTEuhCRdN2Cg83LWO7YZ3x9kpQx6fDglw4eCyn6HS6II9Ja4E?=
 =?us-ascii?Q?dUTuZS2PXuEUKiDNgvWOk1JERF6nOytCHjv5wUG/QBWEkFgwV2Sv87r5gVbm?=
 =?us-ascii?Q?G9zJ9z1amZterNqcrGV9aV0uxXGkL/f2c0CiKAl4+NqXbAeoUO+rHJxL5fDv?=
 =?us-ascii?Q?G8lmLZsi0EGJTCpx/PkSstUUMyxUL5wxw9K0uAINRHKsM5COkxoPnKBdNIgn?=
 =?us-ascii?Q?dFnYQld93v6/FFfoCWgSfqKXFPlPaCH6TxshsaYvebpmNVpDrVruc9sYVxxQ?=
 =?us-ascii?Q?WbGTHznsF4AyPFLIs7elkz5nHw6yukYp5ntD0v0tfggplfqnwNjfaBVPgtVs?=
 =?us-ascii?Q?7fRGxhVRR/mg0fYFc6PRIfx0S44psgZc/cYk09wvs2jirWuOF4sjFCdUMAtq?=
 =?us-ascii?Q?OEtnDlK1qHJfKRbZLfDyNs/X2JvomCGWo7Wp9kEyrc7Pv4iS4LqVBmGdsTCU?=
 =?us-ascii?Q?pJ2X3ayRkf+j2DhqsmisnMihyz2Yw24yeSYa6ArqlgY+buV3B5uxE41sBFeC?=
 =?us-ascii?Q?PMwlvc23q/83LDxpPqTPQDxDkDmwfGwIBknG30TifvzRg08RzgP6+RVqfUIF?=
 =?us-ascii?Q?JNMBrQMqs2nG5SQgAHF/bsvzAcYo7Hvgm8bJEmmTfXmvzAVmu6dfG4Jvk6/p?=
 =?us-ascii?Q?p/qbTNhz/DF3uQ1vgoVgMRUBUOr/CNWkmAXUqSbZDZ9UrFVLh5FlbFZIh4Hb?=
 =?us-ascii?Q?GnWwFNfuId8ZxG6gKDYmMS14BwN4tZyQr6YOQTvVECb8jKsBtM43KDOH0Alm?=
 =?us-ascii?Q?RLV7mf3TYf3SSgUR1n4u1capt6MG86gp+XHGNpQRGozHt2fb8y6teFLelqKK?=
 =?us-ascii?Q?BlmTTFxPNzkQENfzON2waWcaDfvbVpKLVaC0hBGO8IN3pG+2BFIwhHQF4Hqk?=
 =?us-ascii?Q?m6Ap5ckoB/ceYOt/KzWV6L7146Qp5wsBnaaKpzPnXA6TwP6n0V79jBwZveBJ?=
 =?us-ascii?Q?tlVnCU7X/+fG/W+3fP5t4T48lcbS+kdXbOd5d2HjrWXrs5nv2ev4TRGSjmw1?=
 =?us-ascii?Q?3pp2MtwnvAWBcliqQEZmzNOvc1b/ZoTcExNvMwDaU89Re1B6ovBI7VmQyjd0?=
 =?us-ascii?Q?ldZ4LNCzmGhomuiVNa/3mZZnQTzYSU7VDvXJ9ZZoFlT+cLuTirBLcN6+y4OF?=
 =?us-ascii?Q?cFko2ox5nCX3b95uSTnftyti8eNPUJ6g8yeTRGuFCKFiO3tPHHqA0wLVf8NZ?=
 =?us-ascii?Q?eH6byQw5vtZLrQZ4pw4g7cSszsp4Xt7PbMfZOqeXAQil1R90PPHPT4nEqKMK?=
 =?us-ascii?Q?RQg1i59DCLakPELLEIHjrRHG0lQWFiqwr5Hp7utkmWXDvRhwb/eDGDs1HpOy?=
 =?us-ascii?Q?COFvTp3f40l5Mz0BaVLXArdCVQyEyi+t9hpbdIORVxJnkY1BNV7BOl8xXEbz?=
 =?us-ascii?Q?4Aux4CDgwr8d0xEMs2XNn4ZhlDjixl59nL18VqNKyYURXONHCaW6OZBRp5wp?=
 =?us-ascii?Q?HxRAtl/EzL8fHSjDgOCoHSDzyfiiXgPhhjir6mnXfYt+1frXv+9Y3ZljXi3c?=
 =?us-ascii?Q?ZdgMPYJCoS6bFm1oXsGdTEBRED3uoTf8Y0tIQvQ4CoFETLkMw0Fq/l8+LWCn?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a962ca2-cd61-4609-09f5-08dd56dc681b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 03:11:19.7256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yztmpQ8MmNWeYZEAPEkg32m3pVSye+Cauzbh4tTOh/aXGIYuix236xceedwA1DOhuvO+Op/BPx3s+txoYH7gQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7705
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

On Wed, Feb 26, 2025 at 10:02:04PM -0500, Oak Zeng wrote:
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping on vm_bind for the vm_bind address
> range. Under fault mode, we depend on recoverable page fault to
> establish mapping in page table. If scratch page is not cleared, GPU
> access of address won't cause page fault because it always hits the
> existing scratch page mapping.
> 
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
> 
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
> 
> v2: Rework vm_bind pipeline to clear scratch page mapping. This is similar
> to a map operation, with the exception that PTEs are cleared instead of
> pointing to valid physical pages. (Matt, Thomas)
> 
> TLB invalidation is needed after clear scratch page mapping as larger
> scratch page mapping could be backed by physical page and cached in
> TLB. (Matt, Thomas)
> 
> v3: Fix the case of clearing huge pte (Thomas)
> 
> Improve commit message (Thomas)
> 
> v4: TLB invalidation on all LR cases, not only the clear on bind
> cases (Thomas)
> 
> v5: Misc cosmetic changes (Matt)
>     Drop pt_update_ops.invalidate_on_bind. Directly wire
>     xe_vma_op.map.invalidata_on_bind to bind_op_prepare/commit (Matt)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 94 +++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 +
>  3 files changed, 88 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..0c96cb11d34c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
>  	 * granularity.
>  	 */
>  	bool needs_64K;
> +	/* @clear_pt: clear page table entries during the bind walk */
> +	bool clear_pt;
>  	/**
>  	 * @vma: VMA being mapped
>  	 */
> @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (xe_vma_is_null(xe_walk->vma))
>  		return true;
>  
> +	/* if we are clearing page table, no dma addresses*/
> +	if (xe_walk->clear_pt)
> +		return true;
> +
>  	/* Is the DMA address huge PTE size aligned? */
>  	size = next - addr;
>  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -497,21 +503,28 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> -						 xe_res_dma(curs) + xe_walk->dma_offset,
> -						 xe_walk->vma, pat_index, level);
> -		pte |= xe_walk->default_pte;
> +		if (xe_walk->clear_pt)
> +			pte = 0;
> 

Extra newline and also check patch doesn't like this:

-:73: CHECK:BRACES: braces {} should be used on all arms of this statement
#73: FILE: drivers/gpu/drm/xe/xe_pt.c:506:
+		if (xe_walk->clear_pt)
[...]
-		/*
[...]

-:86: CHECK:BRACES: Unbalanced braces around else statement
#86: FILE: drivers/gpu/drm/xe/xe_pt.c:509:
+		else {

Other than this, I think the patch is correct.

Matt

> -		/*
> -		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> -		 * this device *requires* 64K PTE size for VRAM, fail.
> -		 */
> -		if (level == 0 && !xe_parent->is_compact) {
> -			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> -				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> -				pte |= XE_PTE_PS64;
> -			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> -				return -EINVAL;
> +		else {
> +			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +							 xe_res_dma(curs) +
> +							 xe_walk->dma_offset,
> +							 xe_walk->vma,
> +							 pat_index, level);
> +			pte |= xe_walk->default_pte;
> +
> +			/*
> +			 * Set the XE_PTE_PS64 hint if possible, otherwise if
> +			 * this device *requires* 64K PTE size for VRAM, fail.
> +			 */
> +			if (level == 0 && !xe_parent->is_compact) {
> +				if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> +					xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> +					pte |= XE_PTE_PS64;
> +				} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> +					return -EINVAL;
> +				}
>  			}
>  		}
>  
> @@ -519,7 +532,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null)
> +		if (!is_null && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -590,6 +603,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   * @entries: Storage for the update entries used for connecting the tree to
>   * the main tree at commit time.
>   * @num_entries: On output contains the number of @entries used.
> + * @clear_pt: Clear the page table entries.
>   *
>   * This function builds a disconnected page-table tree for a given address
>   * range. The tree is connected to the main vm tree for the gpu using
> @@ -602,7 +616,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   */
>  static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		 struct xe_vm_pgtable_update *entries,
> +		 u32 *num_entries, bool clear_pt)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> @@ -622,10 +637,14 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.vma = vma,
>  		.wupd.entries = entries,
>  		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
> +		.clear_pt = clear_pt,
>  	};
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> +	if (clear_pt)
> +		goto walk_pt;
> +
>  	/**
>  	 * Default atomic expectations for different allocation scenarios are as follows:
>  	 *
> @@ -685,6 +704,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		curs.size = xe_vma_size(vma);
>  	}
>  
> +walk_pt:
>  	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
>  			       xe_vma_end(vma), &xe_walk.base);
>  
> @@ -981,12 +1001,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
>  
>  static int
>  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		   struct xe_vm_pgtable_update *entries,
> +		   u32 *num_entries, bool invalidate_on_bind)
>  {
>  	int err;
>  
>  	*num_entries = 0;
> -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> +	err = xe_pt_stage_bind(tile, vma, entries, num_entries,
> +			       invalidate_on_bind);
>  	if (!err)
>  		xe_tile_assert(tile, *num_entries);
>  
> @@ -1640,7 +1662,7 @@ static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
>  
>  static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			   struct xe_vma *vma)
> +			   struct xe_vma *vma, bool invalidate_on_bind)
>  {
>  	u32 current_op = pt_update_ops->current_op;
>  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> @@ -1661,7 +1683,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		return err;
>  
>  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> -				 &pt_op->num_entries);
> +				 &pt_op->num_entries, invalidate_on_bind);
>  	if (!err) {
>  		xe_tile_assert(tile, pt_op->num_entries <=
>  			       ARRAY_SIZE(pt_op->entries));
> @@ -1681,11 +1703,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
>  		 * PTE is already cached in the TLB so it needs to be invalidated.
>  		 * On !LR VMs this is done in the ring ops preceding a batch, but on
> -		 * non-faulting LR, in particular on user-space batch buffer chaining,
> -		 * it needs to be done here.
> +		 * LR, in particular on user-space batch buffer chaining, it needs to
> +		 * be done here.
>  		 */
>  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> -		     xe_vm_in_preempt_fence_mode(vm)))
> +		     xe_vm_in_lr_mode(vm)))
>  			pt_update_ops->needs_invalidation = true;
>  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
>  			/* We bump also if batch_invalidate_tlb is true */
> @@ -1759,10 +1781,12 @@ static int op_prepare(struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm) &&
> +		    !op->map.invalidate_on_bind)
>  			break;
>  
> -		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
> +		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
> +				      op->map.invalidate_on_bind);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
> @@ -1771,12 +1795,12 @@ static int op_prepare(struct xe_vm *vm,
>  
>  		if (!err && op->remap.prev) {
>  			err = bind_op_prepare(vm, tile, pt_update_ops,
> -					      op->remap.prev);
> +					      op->remap.prev, false);
>  			pt_update_ops->wait_vm_bookkeep = true;
>  		}
>  		if (!err && op->remap.next) {
>  			err = bind_op_prepare(vm, tile, pt_update_ops,
> -					      op->remap.next);
> +					      op->remap.next, false);
>  			pt_update_ops->wait_vm_bookkeep = true;
>  		}
>  		break;
> @@ -1786,7 +1810,8 @@ static int op_prepare(struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  		err = bind_op_prepare(vm, tile, pt_update_ops,
> -				      gpuva_to_vma(op->base.prefetch.va));
> +				      gpuva_to_vma(op->base.prefetch.va),
> +				      false);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
>  	default:
> @@ -1856,7 +1881,7 @@ ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
>  static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  			   struct xe_vm_pgtable_update_ops *pt_update_ops,
>  			   struct xe_vma *vma, struct dma_fence *fence,
> -			   struct dma_fence *fence2)
> +			   struct dma_fence *fence2, bool invalidate_on_bind)
>  {
>  	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>  		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> @@ -1871,6 +1896,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	}
>  	vma->tile_present |= BIT(tile->id);
>  	vma->tile_staged &= ~BIT(tile->id);
> +	if (invalidate_on_bind)
> +		vma->tile_invalidated |= BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
>  		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
> @@ -1929,7 +1956,7 @@ static void op_commit(struct xe_vm *vm,
>  			break;
>  
>  		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> -			       fence2);
> +			       fence2, op->map.invalidate_on_bind);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		unbind_op_commit(vm, tile, pt_update_ops,
> @@ -1938,10 +1965,10 @@ static void op_commit(struct xe_vm *vm,
>  
>  		if (op->remap.prev)
>  			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> -				       fence, fence2);
> +				       fence, fence2, false);
>  		if (op->remap.next)
>  			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> -				       fence, fence2);
> +				       fence, fence2, false);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		unbind_op_commit(vm, tile, pt_update_ops,
> @@ -1949,7 +1976,8 @@ static void op_commit(struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  		bind_op_commit(vm, tile, pt_update_ops,
> -			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
> +			       gpuva_to_vma(op->base.prefetch.va), fence,
> +			       fence2, false);
>  		break;
>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 996000f2424e..6f50394dd877 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1946,6 +1946,23 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  }
>  #endif
>  
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!vm->xe->info.needs_scratch)
> +		return false;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
> @@ -2016,6 +2033,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index = pat_index;
> +			op->map.invalidate_on_bind =
> +				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
>  		}
> @@ -2213,7 +2232,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return PTR_ERR(vma);
>  
>  			op->map.vma = vma;
> -			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +			if (op->map.immediate || !xe_vm_in_fault_mode(vm) ||
> +			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
>  							      op->tile_mask);
>  			break;
> @@ -2441,9 +2461,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		err = vma_lock_and_validate(exec, op->map.vma,
> -					    !xe_vm_in_fault_mode(vm) ||
> -					    op->map.immediate);
> +		if (!op->map.invalidate_on_bind)
> +			err = vma_lock_and_validate(exec, op->map.vma,
> +						    !xe_vm_in_fault_mode(vm) ||
> +						    op->map.immediate);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52467b9b5348..dace04f4ea5e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -297,6 +297,8 @@ struct xe_vma_op_map {
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
>  	bool dumpable;
> +	/** @invalidate: invalidate the VMA before bind */
> +	bool invalidate_on_bind;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.26.3
> 
