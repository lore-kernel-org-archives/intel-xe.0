Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B80BD2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 05:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B92210E663;
	Wed, 10 Dec 2025 05:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEGJsgGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949A210E663
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 05:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765345176; x=1796881176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/SK4uBXPb1fUOB4HgUsXx3fgS+UWSqC8dgVwjK2rrD0=;
 b=TEGJsgGX7AeSbR0OH7VXccfCGfalL7M77jmH/1qBzz+VYOjsYxXSUIjq
 107EHEqzN9rNKcMbqCsOx/kiVHgYwDmDlhB1nr7tPbcyiik3nX/bQh8Wn
 ClDOLWksPS5B4xMmBP9lB+yTGAwi8tJGpLSSLCIEFTnr1FOjbRXc5QlKT
 ZhqBq+ZMBu5hv9zmlIjuAMG/l36VrHZrLK6tJhXO2jpaZJnUMxOK9Dt7D
 /NpiTni0O0ejxkmYhzV3Petn7jyxSNYj0pZKUOT1JLJLgDQlheTzeGt5w
 +B0Vc1eLfIg4c81HVA4WW3LDTgT9fPYhFQBbieZ6jFEc6Otw6WCnQIVBT A==;
X-CSE-ConnectionGUID: FNzFSXXnROytdA9wlVqU6w==
X-CSE-MsgGUID: nzr316YbTzuKit0bqpBPYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69898931"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="69898931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:39:36 -0800
X-CSE-ConnectionGUID: Hk6hoemwSuCs23M1S9Km+w==
X-CSE-MsgGUID: pR4vTwAETwmntA2LtbvVsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233823694"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:39:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 21:39:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 21:39:35 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 21:39:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJ9XLFSCXns0AtJs8ATKxdytO1AY9oQqaHXpshYXLTSjlMKUrJm2ddgFqPnq0gKLfO4mwLrau7P7zXdROwHzQU0v0xDbYtaaQ9+PI7MwKD2wE4pZMWTg4vdqOv2BHanDHZOGL04qZ/+UgFx+iyZ3LhOXNn7rJycML4bv7rIAuhxC3YdnO5lMpHbWvbIJ5Rk+/DREMDzC6XaXbz2AWOD5ALFjvqDWIokeB/9vcyahuYh5dhIxNX5XijL+YFKLR18zTBklwW14C/iZsFwXaqaW2CWj2GhD6Kx1f60jb586EGHVg+BVdAFGh2HXNRTS3Z5THan8Z5qTtLtlPra+y1cy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpI+OVgdBtaNzhTlj+8ZIH1nt4SYlEh9e5dtw+UBOy4=;
 b=s4nmbCErWxBMqExLPmQojBkZglPEVMB/7TgPeAaBszShEpOpRVSbd3MLrl0I7nCEosW8WzQWhwKRt5INM+U3PJWjXpYVV11bq6eVbjud8dncvVtvjgei0P4yeTGum6Mvm+DZh4udEPukTNiyjJkizYiIRJ/E6AhTNKBxCAjLW/5a0Zfn6wGfMjEI2Furj2S4soBqajdo597+Mlrj4M6fdW6GsEzUIkQOM/rSFmMxLEGAGs+usuoZRGCd1RsyRAnf4e0nPrSUMAgWMKa4c6YiQ4RwyJviVPHWH+7paA6o16z/5OxjuhOgXlj2pQaukKVSXyiep5n1/A4C43L30n/esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 05:39:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 05:39:27 +0000
Date: Tue, 9 Dec 2025 21:39:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/vf: Reset recovery_queued after issuing
 RESFIX_START
Message-ID: <aTkHjclBK1ly6Hsz@lstrano-desk.jf.intel.com>
References: <20251210052546.622809-4-satyanarayana.k.v.p@intel.com>
 <20251210052546.622809-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251210052546.622809-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: fff53a53-fa8d-4cca-af46-08de37ae7c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lArwBBoVrf0Fmsq0hpVlpYH3eFo7ChoOTcrjsFRB80mycUXgsp42W8rl2Gmi?=
 =?us-ascii?Q?1Llk477Yeo27sma3VIgF4w1CULkd1RCSCUN9jiPhaZpC3LIH8g2tJuSccVbT?=
 =?us-ascii?Q?G3G/oYXXN7Lr6GXADemxFdHsAOiLONnY6bzz80XICzDch/WAg5HnV7A6ibjV?=
 =?us-ascii?Q?0IDBLpvkW2hcD+DDCQ7jCp73teufcdunT1TYXybQgGHEOSL118ySwLwi9bRA?=
 =?us-ascii?Q?XEQELAZ54Fnj2gAZShjW9uLnZpVMeukCbSU4UGKahTpNDwmBBwAoDVdbgoUG?=
 =?us-ascii?Q?CPxLFWTm25DX1R1i63JW5hYCRF+Bb72Z9mUaWQwYTcSDEXntvtmUlab/1o7c?=
 =?us-ascii?Q?+sITpbfqTJAWewUShKEFZpPySQkNkiZX67i0zek283P9R4VyulWADExIgtDi?=
 =?us-ascii?Q?bniNl+Eefz8dy6Y9QHd0t43Rsa2yMUcBPPD6H8Tmpsozh6D2rxmGUEQOjBGi?=
 =?us-ascii?Q?V2HQ8ho883C2TVi8PuBuweCZCPq5zDs2vlvVLKdOjh5iRppYpCkV0HKRsQDP?=
 =?us-ascii?Q?LoP50E1Zu3rOaexeQnyM80BgkjUSqmLE4iCAz7w289KoruvnMBjNLLM7JeXZ?=
 =?us-ascii?Q?Ht+KLXSDrNAiOHrhhXNgZ8Xf9e06EQYpHOgTGMyltMEx10d1FxjPfSeKGUaM?=
 =?us-ascii?Q?6z2QiPi9+fu84F0pFZHd4qmf8nnh2UvE2tXNK81Kkc4ZsZd4DojFr+pKMeZs?=
 =?us-ascii?Q?Lb/VFBIKIz8wDY+4FjZU9uFLELkcPrOU83w9tZbCHsjk+n2odgsSPgivHooW?=
 =?us-ascii?Q?0QfE2AfjMABUcJBhl8Br8pOb9hDrocdDcNpUKlnCPR52zmAY3OG7bOnrhKkS?=
 =?us-ascii?Q?sv4DjDtba/h2SQfnBLZNm9aHyv4NLXjRUD6ql1eWBlYyFRXrgMswPRPl3F5L?=
 =?us-ascii?Q?E4MKrBwP1drEjegZhnNjMar099n/ElqeTbgLv7SBXS5Le46gsczEYuqK4Ti7?=
 =?us-ascii?Q?wFwFLz2l2/9IIqnbNxiinpdk/H6v5xp+A/8Zp2OsdE8CsZE2vO44JCkG9dzN?=
 =?us-ascii?Q?k0F1ZQwH47+HIsA+G2ldUy0CYPt12geF9aaoEgff9SsgMkp1sAiVR87Dn+2K?=
 =?us-ascii?Q?4GS9LdskncgkQWrWcFRAXv4oBns7FFzUehcRG0n7k7wBaAbWkv6wLWmFm9o9?=
 =?us-ascii?Q?adp6A1xl7jEgZ2oSoyv8FaXwWwtpZfTwwM/fwHhGD3105/0zpfcTbUg9P2aV?=
 =?us-ascii?Q?n9gh421Ty78UldgbEbDmq3AJCj3YFaxdsEoiuZeHwskZHqX5NdKUfSnpJvB6?=
 =?us-ascii?Q?Ax5+KMwvlacUAGJ4LfXF3AmiKaFwHif9sXgqApGWcY23IFAKaZKr3/9tCD6g?=
 =?us-ascii?Q?+5bRnKkF22gsq71apX7S/8zNKdU1EZ6xxq4/E3Mwy2l/tX3lZ3nAHTxAZytb?=
 =?us-ascii?Q?u/uq7WXjghltFdaFX4VuTxdsxvgpcYUxJgLSc9yZNVxFjOdLnIHHxgJsAjUt?=
 =?us-ascii?Q?0GOKmGSo24zFVF0PU5LRcGrBVLSiWoXm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JnCYSoXpXDjjdMHAOOL097+M2daXVtF7Ry0H/YOBX9d8W/qC7E5oddWmxtSL?=
 =?us-ascii?Q?r602v+dWtkECf19lJrqeuh7pCgvuAQ179IhEhU0jJ17BQ/YjcfmFQUdVZLJJ?=
 =?us-ascii?Q?w1Wg47pa6DX4eQrvNWc7Knv7XsJ3SfLwKPw0i1hcA6Ha82F84o7Wz2qGDrM4?=
 =?us-ascii?Q?1i2CzmvEroAum7b9j0y/fZQooInAlLxnh0GvBZli1daPu+kWuE+zh3oh07PZ?=
 =?us-ascii?Q?uLIbji3XT7Fl+w9fi3bjDYiIUuN5Honh8UHHbiJpN9G1wlmE7GgA4Vrs3mMU?=
 =?us-ascii?Q?PJT60FqppiJxjfQu6puM0TWvxXTPVe1qXEmEO8g6Xi0a8sjok+dtxK2o0OMO?=
 =?us-ascii?Q?UCEHIH4uCGI/7lqoQI/GmuMZlo5xSm4CmeIe3GeQ78csAAqubZ66nHJALyAJ?=
 =?us-ascii?Q?gYTThh40347UymEsiq91T+VVuoGGu8OLLw5B6LO//Yqv0Hwer0Ooh0DhgNZ0?=
 =?us-ascii?Q?CfBk0FvOAq9Z8tCQ6ZyM2n0or31CDO5fjnVkfLFh/1k/gh7OEhxFuwNtRplH?=
 =?us-ascii?Q?NKsytwK+Pzc2USzlt2Tze66jOA1HDlddgfb5W0Kx0LfEKtJliJlYeakSqDgK?=
 =?us-ascii?Q?9XB6s/ZTMPTPydX/6GKH/tBq8Zrcfv+3hIhqgyfOzYqRPZcxnfdXU2seN+WM?=
 =?us-ascii?Q?Wcb/Ow9aZmJbCnoWrzbKatytMtLTI80XmALXUjy3D4vzjP28HxMxu+cX5ASI?=
 =?us-ascii?Q?AoKEt0Y2T/XahuWaZL8aByEqSZUf/fekUnbZTymmS40N9YS9q5jqKXU/S1kA?=
 =?us-ascii?Q?g2ZSyzTDEdGHIPknm37QkpOVe9I+O1aNN+6ueUw9HMHy1C62MIWL94CIqJnI?=
 =?us-ascii?Q?7j48ZsYJckIOKneQbrfz7OmGQ6tOABz3VLTGyho22qRi8B8ALBqcPwwItoZk?=
 =?us-ascii?Q?f6Ftl2b9bCU6qWcR/g76GJ0WRUbv0fYvf/kKm0yv7Sd3WZ7iDSRfbDqjUW3h?=
 =?us-ascii?Q?weH4vmWu0KBGWvntcz/IQOdzGD3WSVOKrxGtXYtbjfLtme9slndC5yYJhoT+?=
 =?us-ascii?Q?VxZfbC1JYD4agAOL5pJtR7HD71fCMcGHhwGrlHtKJks6zTjBs6VsBnIT/XVs?=
 =?us-ascii?Q?8H9dmIy4ynYvYZhzP7Rq0ExB9Pja3HHHdEqyNl8iVWkac16EROrNsQ0HErui?=
 =?us-ascii?Q?zjuLQdfd3/E5fmh2EsaSh9Vhr5yjtsBsE/rh26RHJz9zyMUR2U5t9zyDT4Te?=
 =?us-ascii?Q?hIZbV7cZG46ixcZudqtQBhiEBT4Q67Y4nuqYOYMpviNML2RuS3Nux5cpEkLr?=
 =?us-ascii?Q?cMWE4w1dcQ4IqY866QRFW7V7EV4u/wl2nxnAOT4JoNi10xYtdn06bYCrFCXa?=
 =?us-ascii?Q?simZBfDGiqs+0o/75vuz64FNB3+TtPUw9vVNj5Lmb4lKLILDG9rEAooSJYO0?=
 =?us-ascii?Q?JgyO0Uds6INhHptmSKTMcASzNoV73LHjroKJg3rwhEOaU3EKbQWnRX9kOCW8?=
 =?us-ascii?Q?4em7eTGdSs5qCY26X+0ZXj7WIOcXlEKULf9H5kjdGQhGe55OpMVB5XAP20SX?=
 =?us-ascii?Q?DnLy59b3eIceGjuENjjEuVfyH25H9ebKW686zD/eeKNAHjwHR6d2g8hkLIY7?=
 =?us-ascii?Q?2y66HqMxsi13CFMS4Yvp2k3Enp/U1AHIpiDiwmFjeNebgkMg2ZhfpSeplHVK?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff53a53-fa8d-4cca-af46-08de37ae7c00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 05:39:27.8551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJSwJacJ5lPgKOJ8PzVh/aiW3fGQsZwFLIIRLX//Q6wRGTZOnkkagkA+grLTYZoW2rN88Iq4CZCpIbxHcIxRpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
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

On Wed, Dec 10, 2025 at 05:25:49AM +0000, Satyanarayana K V P wrote:
> During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
> clears the RESFIX_START marker. If migration or resume occurs before the
> VF issues its own RESFIX_START, VF KMD may receive two back-to-back
> migration interrupts. VF then sends RESFIX_START to indicate the beginning
> of fixups and RESFIX_DONE to mark completion. However, the second
> RESFIX_START fails because the GuC is already in the RUNNING state.
> 
> Clear the recovery_queued flag after sending a RESFIX_START message to
> ignore duplicated IRQs seen before we start actual recovery.
> 
> This ensures the state is reset only after the fixup process begins,
> avoiding redundant work item queuing.
> 
> Fixes: b5fbb94341a2 ("drm/xe/vf: Introduce RESFIX start marker support")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V2 -> V3:
> - Fixed review comments (Matt B).
> 
> V1 -> V2:
> - Fixed review comments (Michal W).
> - Updated commit message.
> - Used scoped_guard for spin_lock/unlock_irq.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 47612e67d462..b8b391cfc8eb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1171,10 +1171,6 @@ static bool vf_post_migration_shutdown(struct xe_gt *gt)
>  			return true;
>  	}
>  
> -	spin_lock_irq(&gt->sriov.vf.migration.lock);
> -	gt->sriov.vf.migration.recovery_queued = false;
> -	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> -
>  	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
>  	xe_guc_submit_pause_vf(&gt->uc.guc);
>  	xe_tlb_inval_reset(&gt->tlb_inval);
> @@ -1258,7 +1254,14 @@ static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>  
>  static int vf_post_migration_resfix_start(struct xe_gt *gt, u16 marker)
>  {
> -	return vf_resfix_start(gt, marker);
> +	int err;
> +
> +	err = vf_resfix_start(gt, marker);
> +
> +	guard(spinlock_irq) (&gt->sriov.vf.migration.lock);
> +	gt->sriov.vf.migration.recovery_queued = false;
> +
> +	return err;
>  }
>  
>  static u16 vf_post_migration_next_resfix_marker(struct xe_gt *gt)
> -- 
> 2.43.0
> 
