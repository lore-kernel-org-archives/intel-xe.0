Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F023CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 18:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B2110E449;
	Mon,  6 Oct 2025 18:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+Yb2rs4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A5C10E449
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759776201; x=1791312201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rFjHMD8XsCXiUoFDatpvEWasBY/3Z0fG/tiHPDDJtGA=;
 b=D+Yb2rs4Rfd23oJYYFMkVo995oen3tT1nYF0BIKBBGiUlHTWTi6FHU0H
 83KsMbJcbIxVTi3+DFvf397vsaWLyrCNmdCvcYLN9Rz7VDqE3LVT1pQKl
 LdDF2fHa3lwRDqdfqypUakYVVrEyUgWXuXWhrC1nLarfqRAjlMRtIN2Km
 IDhUnjaItphz0X9mWXJibqidunq3tjgPhosgTOV6VYx04LjKO5VYrA4fB
 SOioBJTGpl2TITiMRw5E1fbRzubTpRq0PUaBiNnzxV4wXeL368oQdXn2g
 7bUyMP5FIgwF2ENU/MqDnEYhtyBgHfhM/s/02W/NiIsWXWwhVVQD4Gf1F Q==;
X-CSE-ConnectionGUID: a97AWM7MQj2rTh/bXeNSQg==
X-CSE-MsgGUID: 9Zce+fjXQ1OxyR/NcZ+NLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61873378"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61873378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 11:43:21 -0700
X-CSE-ConnectionGUID: 8AWZMWbERoK2TjDkkfc5kg==
X-CSE-MsgGUID: YFRjfwWrQF22pBHhf3ZaTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="210625696"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 11:43:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 11:43:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 11:43:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 11:43:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anatTqi9kDW+0lO52hCZYR4MQzPH1XetwojPLpTgYeUhTUNS4SPU+eiHnwpjRcx8W6gwzzNAjW0IOhs7FtJEFzu5ymzHRjXknIRP5bP+SN13ZqhcErPvAxE4LeI2vq6ALUABgN9WACayfeIj4GRgoB6DhxoYI1xS1k0M7tTL3thXHNCol4qDKlWD2gL+Dw2VV8PkzKj44ALSkZSQXfSvOziaxhpJuE4k7y7YzY5yesATSgVj2hIPYD3LhhzvmunA1oKifOBSXSwDF1g9oDV8cuuRQnEtJpl3OpzyBbMgMK/JdtZ/aUfNkBWfhy5G3h2z6lgzejw+ic9IMFbE6RdvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esh4fMB2fk9LlZFeqq17xojSiBN2IlOrnZrMpRRkgmA=;
 b=vDYk0FfjDEiuv6W3tO82zBCTTSLvYwDYI6xOM/upvuYdM9mmOJLOyo9r6Aowjwi4rEF26rRrpxzhKTwA/X+FjzTCcGB7o55ULJUGOZJ8tmVMtPomGyX16Gw0UYrqL5TohJxEAOwoyZ7XcDb6hJ7+HUWmGVz0D9sDUNm2NfssL9ucpzvggI/705oeTuSkvHlBukvbcCM79i6H5b9WjJCqsSdzRnr4EuXe9PEAqMoEChPeQGpcsaQEv3yAmo+douAQ2zd3PqKgWyF3m1/Tp7mVB1mrtD+cLK23zFyrhLF4j9qx5ZxUUhltKxSJG/4I+xeWljgV02JGPKbIasos2H33qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 18:43:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 18:43:10 +0000
Date: Mon, 6 Oct 2025 11:43:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <simona.vetter@ffwll.ch>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <christoph.manszewski@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <andrzej.hajda@intel.com>, <matthew.auld@intel.com>,
 <maciej.patelczyk@intel.com>, <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH 20/20] drm/xe/eudebug: Enable EU pagefault handling
Message-ID: <aOQNvNBXq4mgbiL4@lstrano-desk.jf.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
 <20251006111711.201906-21-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251006111711.201906-21-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e8aefa-d0e4-40a2-a66f-08de050832e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wzHNgqrDr5kAiwmbMYWzHlYegUHRoklEz3Bt4bB9LB8vkYx/b35B70yLbSEc?=
 =?us-ascii?Q?2UCsF8ZH5sEJTW9nn0Snpv3BZj0ySwy+1rkwr+sWRyRUyY4xBYNUanmivAXU?=
 =?us-ascii?Q?7b4G1UZJ1i+jUnNRQHr0+QS/fQ/8vrDwrCfM5I2euXfBE13OyEpTtWP1GqHQ?=
 =?us-ascii?Q?ZXw7JnalBBrCbDNmySu6kQlNNL7vunssCdiPB2hYc0IxW+GtjathcfrDkPSA?=
 =?us-ascii?Q?DXTBc8z+wNq0hdcy2fddK/DRty2/zMTABUC/7ljnmSA+bfZps5btFuSx1heK?=
 =?us-ascii?Q?Hwh289HIqoRcmX2849WQBdr4fEphI2p98vhR/W3SGvEJ0IHk7LyLvEvw4t7G?=
 =?us-ascii?Q?Mb0yvxE/YWLTZLEwJshdwJ/xz1qLAKNEEBN/gExinGKs+U1idZTwWdHlgGW7?=
 =?us-ascii?Q?o2uqkuhKHifov4HqfCmwKNbXiRiI9kewSLncnr3yA6D/oxXcFGds/sNnXB10?=
 =?us-ascii?Q?LhqITUrLqmIQ2UfqPIlPFMmsmSOVxac/dMtuuM9sDXkBQie6rKl0c4ZBsOvL?=
 =?us-ascii?Q?T+CeSbHAndkFHAFkdowFpawNJPrq0I8AoMFywuuX1lz5wSw9p0jJeHBB0s5H?=
 =?us-ascii?Q?EGq+ewmWxs6uvNdD2/rXUvJcgJjVqFnZXoSp85SGLUCR1oU2dhII/ZQ6DmMb?=
 =?us-ascii?Q?EGc2DuyeIdCbrIsy9MymMeVX6Gjp+3gX42MTMxNuNzJQYkoMi2634wLaU0Jv?=
 =?us-ascii?Q?JwsCRAG7CMn27MOETJmHHdh4t/phjHwTVBVxxi8OWJ2Am2tHF/te2Gi3mvz+?=
 =?us-ascii?Q?bnWTp2ZoW8AxeqAt5/uLAKfJ6b43wAICmfxBbIZlisedEUP0kuZo8fo/YcZf?=
 =?us-ascii?Q?ZhbRVkfdEcWpNiN2KGH327O0/gCfMmP9iUk0CTHIFz1yJs9y6uw70e3pldb1?=
 =?us-ascii?Q?s68aRftko5CmmqN8tyfrvG2utDxDqKjMFkrNH5uxJwvQLJ904Ly+YHu+ZZdp?=
 =?us-ascii?Q?Bp9rnVRhHGxIJ0++KmiVQllb8m7PY7e6WxrUkibkJku+ZHqH2tjy7BWNHLOg?=
 =?us-ascii?Q?JapBUJEhzqV7K1OXv61aZcZsrfsb8J/YYYTUVTBjagoldIwkwCWwJBbBN3Pc?=
 =?us-ascii?Q?M9ty6NEhP0Bn/EU3yUHEYq67u6S+ila0PX1ih7cPdX4mbsjxaXPCvtE7jcDO?=
 =?us-ascii?Q?L4DxknHfpN00CDrrtZQNj1eK2yhCwLCDNGQOZvl/AAfG+4qSemdG8ulnEsoX?=
 =?us-ascii?Q?arOUpE52q4zo8Ty8okKeRF6SSF0cjQulnaQ/ZivcQeHZqb/8ufgE0cZf6kXU?=
 =?us-ascii?Q?W0W3EjKaeWhq4qSzf3hmNZx0AYgABPGCNEWlRyrLcnemRWqnd1fb9gmBb+Zf?=
 =?us-ascii?Q?5S8Py+3ooA6XDevffFVNxEusVb5mlCHtvBC9+GFYE1TaEbEuQOKJcp9p6Tgw?=
 =?us-ascii?Q?TCKeXDl5+UoKqsKdDfl8KM+MyqYSewzLFma3AlSdEWMCG6ceCx+iKyeXkK20?=
 =?us-ascii?Q?wbHgFqeefp9ryFiMDFE3SREXp5hxlt9M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?09kvPNO2fzgUPKgFRMTAQcF6UkH7FT4yqEPtyI3pyog3P5oL66DF+Pf99LDM?=
 =?us-ascii?Q?teUw3u0sCBQGjAmTpNdjzp+0p4vcS2wKPaKrQ4MCxhIJlek6c90/7puPRh0O?=
 =?us-ascii?Q?fiTNoP4U4ufrRLHUaeZbHjIgHLCYWFjyXsEGPNZKQ6WcsdKMquIOtHogMLJG?=
 =?us-ascii?Q?wSAAZgpGK64aI4yExgQt6yHRwQrSg5J8HUrIp3o6yg1m1upaN6qQAt7rJ/oi?=
 =?us-ascii?Q?JHeUwmcQfi42OLsDlSYp8OZccuQuPzhla61mtwAkfZHmvYNXHqwtnSb7UGnY?=
 =?us-ascii?Q?4fLVdqV7ZOiXSsPJCbukIb6cTErMhddTxxHTV3QODbxvV6H5BRH3UeQaN0lM?=
 =?us-ascii?Q?vHO/7CRXSLRFXMZzdas02SqYTH5P/vskC2tNs89lwAA0cW8HG0lcpSvA6au/?=
 =?us-ascii?Q?GIKzi5VPSkwvm/sOe49sznHy/EQeTruRw3b52p26VOUIq2rknDBIB9MmAz/H?=
 =?us-ascii?Q?5vXBkeQDJg4qNOE85dVtUm6Jq//H0e7JpQbtVU/cB9wZa7HNUhpqr+gCv50k?=
 =?us-ascii?Q?YffsDXwLJayIk8RdzHmRRfuCnsyND81SuhzNqd9dn6NvFqG0j2PQvwE04CPC?=
 =?us-ascii?Q?LOx9kUBGJsnsmc2xSa24LyE08YD8KrbgEXJyCtbrqAVA5/m7P8QnI6laXyz+?=
 =?us-ascii?Q?waEGjpfWHax1Ax5yaUY04p3nAEloWnFqJ3WWvY6/bNKfkSskclqnrxTnpcud?=
 =?us-ascii?Q?brB1oakYtX1Nl5OHDkYuWNnPZR2tZNnGsCk4o5f/71wF7jl1Vg4B7o/iSPyx?=
 =?us-ascii?Q?RmEP4RsCH1GavlVQK0/noWBQFgOljZpO8H1/9KnnMJFd2Efj9tqjbeRaUM9t?=
 =?us-ascii?Q?lQYeZamw+2s9dV0wPXLV2wGvGKfUmMzLcjE9Rv7qWypds+Pbrjx/kosxXbbq?=
 =?us-ascii?Q?imOllSLRf+l7UDbtOxaiHZmOd/o/j5Gx7vAJBfyBLRMbKCrCVkLgWASbCrlN?=
 =?us-ascii?Q?p4COPvCxugRBFV9bP+smjY7ZrOtOXvjufE4PRRMuTvv0JkMZhlLvFt6/0Ecp?=
 =?us-ascii?Q?JvrOI/vAFIiAh6q4Kf+/0S0dDRMQoZ6xoojKG7EO38Wug+DAEtNxUMmACC+t?=
 =?us-ascii?Q?ZUabpYZ9o23Q8fnA8uXOTPK6PTp0zNL0UGKYjxx6CMc6v44AN/TJH5B3g1q3?=
 =?us-ascii?Q?Jou03qex7796xqa72k6efYF7QKpvkxBxGpGJkLDK/IIdZT9D7T5YaluhCw5K?=
 =?us-ascii?Q?0KmG0X5gcGXQx5UeQnIGcCeSrxJQllyAUGti1A/TXUVV/v4qnaCX4hwkaJB1?=
 =?us-ascii?Q?LCrKPXNjvRZN52gnjTp9FQNQAwjrU6g3oDqtYvLN3CWtEAaVMWksJfUshheg?=
 =?us-ascii?Q?9TUXYam7c1c92HUloQwnGA6QPkUBk5V1HtmCA5cqYv2/+kE9DDJ1FqA5q/Sk?=
 =?us-ascii?Q?kyCMO1MiOlhy7MHqGQys6x1kzGrEyRHt7mYu12wpz89xumViqzMMvBNVrT8j?=
 =?us-ascii?Q?UdriWE0VQC7xeDauo58R4PTRqhuiC0ORJyfcjcUgs0CliHfWITsY4Nk8tLpW?=
 =?us-ascii?Q?B/XjmvV+vvwKn+5NjIWGPU0HKHA00iXSR8N3pfflZ2PYtpBSPI4WRMgKTJQr?=
 =?us-ascii?Q?rd1KHssxd6aZTEvRPy/2Tl1vlgd9uqYCbprUp34+YVp1Enxe4pL1xe9PYX0K?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e8aefa-d0e4-40a2-a66f-08de050832e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 18:43:10.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajhIrlJu2yn/UWP5oIeYzBs0XOax3ugsRzbtnZhggUQGB18eZVtBuL+ruTNLyXkmdSN6muTtalLHuSdaDV6ejg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
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

On Mon, Oct 06, 2025 at 02:17:10PM +0300, Mika Kuoppala wrote:
> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> 
> The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
> access will halt the corresponding EUs. To solve this problem, enable
> EU pagefault handling functionality, which allows to unhalt pagefaulted
> eu threads and to EU debugger to get inform about the eu attentions state
> of EU threads during execution.
> 
> If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
> after handling the pagefault.
> 
> The pagefault handling is a mechanism that allows a stalled EU thread to
> enter SIP mode by installing a temporal null page to the page table entry
> where the pagefault happened.
> 
> A brief description of the page fault handling mechanism flow between KMD
> and the eu thread is as follows
> 
> (1) eu thread accesses unallocated address
> (2) pagefault happens and eu thread stalls
> (3) XE kmd set an force eu thread exception to allow the running eu thread
>     to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
>     TD_CTL register)
>     Not stalled (none-pagefaulted) eu threads enter SIP mode
> (4) XE kmd installs temporal null page to the pagetable entry of the
>     address where pagefault happened.
> (5) XE kmd replies pagefault successful message to GUC
> (6) stalled eu thread resumes as per pagefault condition has resolved
> (7) resumed eu thread enters SIP mode due to force exception set by (3)
> 
> As designed this feature to only work when eudbug is enabled, it should
> have no impact to regular recoverable pagefault code path.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 +++++++++++++++++++++++++---
>  1 file changed, 74 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index a054d6010ae0..873ffd982030 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -13,6 +13,7 @@
>  
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
> +#include "xe_eudebug.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_stats.h"
> @@ -173,10 +174,14 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
>  	return vm;
>  }
>  
> -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> +static int handle_pagefault_start(struct xe_gt *gt, struct pagefault *pf,
> +				  struct xe_vm **pf_vm,
> +				  struct xe_eudebug_pagefault **eudebug_pf_out)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_vm *vm;
> +	struct xe_eudebug_pagefault *eudebug_pf;
> +	bool  destroy_eudebug_pf = false;
>  	struct xe_vma *vma = NULL;
>  	int err;
>  	bool atomic;
> @@ -189,6 +194,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> +	eudebug_pf = xe_eudebug_pagefault_create(gt, vm, pf->page_addr,
> +						 pf->fault_type, pf->fault_level,
> +						 pf->access_type);
> +
>  	/*
>  	 * TODO: Change to read lock? Using write lock for simplicity.
>  	 */
> @@ -201,8 +210,27 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
>  	if (!vma) {
> -		err = -EINVAL;
> -		goto unlock_vm;

Not a full review, it will take me a minute to wrap my head around what
this doing but if a user application has SVM enabled the VMA lookup will
never fail as the entire VMA space is always populated by either valid
VMAs with bindings or VMAs which indicate the CPU address space is being
mirrored. The latter doesn't mean that CPU address exists though - the
xe_svm.c layer figures that out. I suspect you are missing some logic to
properly handle EU debug + SVM.

Let try to wrap my head around exactly what the EU debug pagefault code
is doing.

Matt

> +		if (eudebug_pf)
> +			vma = xe_vm_create_null_vma(vm, pf->page_addr);
> +
> +		if (IS_ERR_OR_NULL(vma)) {
> +			err = -EINVAL;
> +			if (eudebug_pf)
> +				destroy_eudebug_pf = true;
> +
> +			goto unlock_vm;
> +		}
> +	} else {
> +		/*
> +		 * When creating an instance of eudebug_pagefault, there was
> +		 * no vma containing the ppgtt address where the pagefault occurred,
> +		 * but when reacquiring vm->lock, there is.
> +		 * During not aquiring the vm->lock from this context,
> +		 * but vma corresponding to the address where the pagefault occurred
> +		 * in another context has allocated.
> +		 */
> +		if (eudebug_pf)
> +			destroy_eudebug_pf = true;
>  	}
>  
>  	atomic = access_is_atomic(pf->access_type);
> @@ -217,11 +245,43 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	if (!err)
>  		vm->usm.last_fault_vma = vma;
>  	up_write(&vm->lock);
> -	xe_vm_put(vm);
> +
> +	if (destroy_eudebug_pf) {
> +		xe_eudebug_pagefault_destroy(gt, vm, eudebug_pf, false);
> +		*eudebug_pf_out = NULL;
> +	} else {
> +		*eudebug_pf_out = eudebug_pf;
> +	}
> +
> +	/* while the lifetime of the eudebug pagefault instance, keep the VM instance.*/
> +	if (!*eudebug_pf_out) {
> +		xe_vm_put(vm);
> +		*pf_vm = NULL;
> +	} else {
> +		*pf_vm = vm;
> +	}
>  
>  	return err;
>  }
>  
> +static void handle_pagefault_end(struct xe_gt *gt, struct xe_vm *vm,
> +				 struct xe_eudebug_pagefault *eudebug_pf)
> +{
> +	/* if there no eudebug_pagefault then return */
> +	if (!eudebug_pf)
> +		return;
> +
> +	xe_eudebug_pagefault_process(gt, eudebug_pf);
> +
> +	/*
> +	 * TODO: Remove VMA added to handle eudebug pagefault
> +	 */
> +
> +	xe_eudebug_pagefault_destroy(gt, vm, eudebug_pf, true);
> +
> +	xe_vm_put(vm);
> +}
> +
>  static int send_pagefault_reply(struct xe_guc *guc,
>  				struct xe_guc_pagefault_reply *reply)
>  {
> @@ -346,7 +406,10 @@ static void pf_queue_work_func(struct work_struct *w)
>  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
>  	while (get_pagefault(pf_queue, &pf)) {
> -		ret = handle_pagefault(gt, &pf);
> +		struct xe_eudebug_pagefault *eudebug_pf = NULL;
> +		struct xe_vm *vm = NULL;
> +
> +		ret = handle_pagefault_start(gt, &pf, &vm, &eudebug_pf);
>  		if (unlikely(ret)) {
>  			print_pagefault(gt, &pf);
>  			pf.fault_unsuccessful = 1;
> @@ -364,7 +427,12 @@ static void pf_queue_work_func(struct work_struct *w)
>  			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>  			FIELD_PREP(PFR_PDATA, pf.pdata);
>  
> -		send_pagefault_reply(&gt->uc.guc, &reply);
> +		ret = send_pagefault_reply(&gt->uc.guc, &reply);
> +
> +		if (unlikely(ret))
> +			xe_gt_dbg(gt, "GuC Pagefault reply failed: %d\n", ret);
> +
> +		handle_pagefault_end(gt, vm, eudebug_pf);
>  
>  		if (time_after(jiffies, threshold) &&
>  		    pf_queue->tail != pf_queue->head) {
> -- 
> 2.43.0
> 
