Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F03CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 20:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476CC10E156;
	Wed, 22 Oct 2025 20:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mckPWcwY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B149210E156
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 20:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761165027; x=1792701027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wTQbrbN/pTNUHNxyyDS9vi1b+sIcgKg/PMnRhY5uNKQ=;
 b=mckPWcwYc7OMgzODeCR987id+c9xK5lKe7ip8iklpqb/DtwMFm/Fua3O
 O3HxFSCNzTvE8vTIr2fy0qU4KPxhhSTh8GQqMDBebljDkI+RtiHS0RFYm
 H4LvAUMD3s9m6VVWidKyYHfToeedCgQJ2aqTLDSs6mH6uNc8sHAWxwJCE
 0OWK1j8Zvc597e3seyS1n/HmLkliLUbb5B6OH3BVmi0+iaLZpRYdi1eeC
 9xuYEqk1zk4o2QdeYZLmJWXtWGaeomzxj6Kr4kssH2PGOr0Xn1+PUH+p8
 KP9nka7Mi5x/VK7ieobyEDcmxCfxuz6NXcp6TDf8YYvVCiiA2wuNJFAwb Q==;
X-CSE-ConnectionGUID: GHWuUDGLS6uaNJT3AL3Alg==
X-CSE-MsgGUID: xZz1EyuGS22rLh3MxkPM1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63219827"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63219827"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 13:30:26 -0700
X-CSE-ConnectionGUID: 7IucuT5+TkudTPB9E6cn+w==
X-CSE-MsgGUID: Jj7746KsTGOTfB+H77Uvzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="184452822"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 13:30:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 13:30:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 13:30:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 13:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHuSVZh07UCsyMz2hrfunSmHptkkJjpSWM9VjxAAsgYk4A+GpvL69op9t3N3EWQseZNY0d79ypf4yZUYTMOxFoJeS17nF/eB1CFng3ALjz6ztWIG0BqCzD4K2slizzL41PZfSvDNJ/2yS8qq739JMuAui0p1hs3fERQkooMkagUuvLFbxy6uWmPP2ah6VinWS3oUEDFxVzWj9hj/RC1cnfkVNN6wFdR8sRyTJqXvO2TT2I4pH8gldFyQM22Hv1qyGj1KOgrnLGMZsaxOcWxj31IYihMBlGXxOLkIH4A+5QIy3c/lsZZ3NAr28+GGhvJo6rEMlirCUhGjkz8S1E9O8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE0DJXIa7LHFL75owvLwvo6k+X7VMPZ19z6kmuupFJs=;
 b=iedf6iQrFj0EcsdEZT87VmXB8tIcUErdz6jjr43d9rmH4C3YisOiCHn4hRH9ap4tBV4wqOiyE3s0PSYqvoTQ4/BgMVJp4UEemek+hkXZP8iW6ITqnaCi9qDrz8we4ZpCxXkv+FqUIx/Sz6XkoycB6lI4hQSZfTnXatw/x5d0eOmoBayrVcHccrpE+klMNIgW5fSygS9pVGYH+l2itIhW16OfT+iS/UJBWM3X4np/F2CaIQIw+OBpir/IJrKr4Z0Dg6wzhjdvBm0nBpAinGjvhZKStsahzwEGZL5PiVtfCQmRLiR82LhgKwz+gCH3OMzfofHSdcXmHTo7bDRxZHIVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 20:30:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 20:30:23 +0000
Date: Wed, 22 Oct 2025 13:30:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <zhanjun.dong@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH 5/7] drm/xe: Correct migration VM teardown order
Message-ID: <aPk+3LWPfFeLmwU9@lstrano-desk.jf.intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
 <20251020214529.354365-6-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020214529.354365-6-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:303:8d::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e661ae-f15d-41f1-2c14-08de11a9d36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?byEyhy1ocG5P0cbJG3VHmTBNIhfKr4pneapDaNPSiZcy9Th2pi70PldUI8zw?=
 =?us-ascii?Q?uiCstcmsxSRxl3v3fekeRMpL37EZyB6I86ZI0rvQClSOX1LuOS2BBT85vz/t?=
 =?us-ascii?Q?5a/0kLyexf68lbP9DyytBoPPeyP6KPSXLUMNvUF68U/SgwgNKhOXGlZhgJeC?=
 =?us-ascii?Q?I+UMQn2GkPULIA1NkLTzLmGtuevGKaR7/MJF5ND9/+cn5paeUW2CXMqY/ehp?=
 =?us-ascii?Q?20ySXqMuvN46e9JAuf2VaC8MSG5QlXBoiPsso9bCqQav3R8G4BzZtHa6TfWK?=
 =?us-ascii?Q?iJnMou8JI0TZY2PS3eqjqnly36QRbxrHRVavvWqUql2zZev/1rzpZDOcnr8I?=
 =?us-ascii?Q?s/FokjNcGta5niD0/H928zuNwuJdtDB44O/ykjWpu860TTPg8HZW+nd05zBW?=
 =?us-ascii?Q?lLlq8u3XS4VGpmGdAmjDpkdgDrqb5WPuCNqKRf172fiu4cNkpY0jiJTY5doC?=
 =?us-ascii?Q?paLdWk2D7qg7GlGb/B5G/sZtOxk/wbQbDv5II1wSiG26kwboCAz+qDBGDf/U?=
 =?us-ascii?Q?MoOsITVqFkoglDI4/+ZHosYuqriqoxBbw+roDahdr51m8N0uZKlhmZlF615n?=
 =?us-ascii?Q?mOoiVYYDTvll6aB1FJtbRZee0wPKxNC8KDIaPbzcdyOFhWe7QTX0TX1sh1iY?=
 =?us-ascii?Q?5dmtUoPY9VucdsJ2DvT+maUDzGPTKKjpMC46lrb//eTP3vXtisIfBGrtuZjo?=
 =?us-ascii?Q?mmThQakHkZYTaRPJdyswAq0+fWPf7PDF7z/SDRSiBU4tWf46JhhfUiqshZa6?=
 =?us-ascii?Q?Sd5g+SrMvsy32EvGkK2qyneVlvng20qAgBrUXbkXHqAnItD1RrhZ7bGqO+7y?=
 =?us-ascii?Q?I1l8BALv3I01bC7tDlo+Cr6bAIMbju8tRnKbloKjfwqfRb8yJYsP5uz6CK67?=
 =?us-ascii?Q?cISjQ1luU7MZvZpDe/EqU10GjFro88o+TxypQBFHMDDZ70/+POhKHCDub/Iy?=
 =?us-ascii?Q?6CfXhDNOIG1PIn1qN8T/MVcKfawAuB5piwzK0qR3Nlhvqd48VOklprWY55li?=
 =?us-ascii?Q?DMJR7NpQdiQUvsFsA3PGlIgvks93BRqk8OwHYrb7OAuTjjpJSenGBKUOI/HR?=
 =?us-ascii?Q?dZ8bf8XWVmwaJVe3sN9+Reee7YrkA06xklBCihICjicTQlxo3adUFwbYK+bj?=
 =?us-ascii?Q?4zn5t6nJ7CnIDy3aHqv7ApbZ43L2QSts/Eh7tITednYG7x2k9OMOURnFK+gI?=
 =?us-ascii?Q?LlVtc+bGGamEDKuFR+hMl0POe7wSOT7syO9HzQ7IWT+oJlvMJvO5xAr/AMtl?=
 =?us-ascii?Q?YK8/qGnYwHV82io/jOrLUJI9ABAC4KXvvY+HeOpghmdfG+Rc6ZQOTs1mpdje?=
 =?us-ascii?Q?3jVyd3g2uKqsb8mQ754T4TJV/O4EDt36y0+cHcXk6OcHPIhVv1fJiuTm5lFV?=
 =?us-ascii?Q?EcobwLvQJ2t8b8wShpTaMtwCOLBIg9eDla4dxzkrNWf4zI/29Xco1OOUzgKf?=
 =?us-ascii?Q?ceFmCEjT0cBWy8fciEYtFFD4CNngXUUp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HzwVk9D5rhCSJhL4YiZLn5guKf7+xjduP5hM1LuhDPpbPsK08VXTeCnDvO9t?=
 =?us-ascii?Q?a4BfnYbyA7DDaBmyKUVJTesWn2RZNTO++D29aXLaM+p4lNtInQ7WbJFtpdjs?=
 =?us-ascii?Q?eL71AWcVGY0aG8p7B6K2iqOe6yzrCJ+Ab1Habcg5c8ubIBpvjZZPaAcRxTyY?=
 =?us-ascii?Q?/4qC2/rISO1/iELj9n0krTpd2eWjs5wj9LoriWYap62D5ubFWb0lIbZfoo3W?=
 =?us-ascii?Q?onnXltzCGpe8MfFBUl5uTNUPnY/47D2tiF6lX9L2jh/6ObecGhvVc/jI5Y5s?=
 =?us-ascii?Q?Kt+9d+VwPng4HS7EIseWLcKOczM+JKLXJYdJfgJJhbKhGRwS7DYkTdmHZNA0?=
 =?us-ascii?Q?WisrA/QaErsX+EPp/plP7M0ufUanc9B+HAxx2HJvzm26ivpa9nUKHcBgCCuV?=
 =?us-ascii?Q?4icVK4l9iaEBr2qCa+SqaMSUGJ4HJFG5dQU5uVR3Ex/oVe3I98a7lNuH1sDG?=
 =?us-ascii?Q?YGdmvI8FHNFiBAVkeplzwQUa9CTPgESQau0TlhLWs/z64TAkTALi8Fj8fc/l?=
 =?us-ascii?Q?/zoELzGqtVeRWXJ7MA1PyNk46M0E+xTRd+uroMwAy7c0ZFxpjPsBlPu5xFi+?=
 =?us-ascii?Q?RbqCj0SE566WOp9KRU6ezGzREpT9lfiIdrKf8bclG/YMvGZPsAtgUJfZe785?=
 =?us-ascii?Q?HCjnHqIisNHxTOxSpJUUjtqhFV16lxbQLUVnKQwsvrK2LeJSMgATWM9GzGWQ?=
 =?us-ascii?Q?E7QVmvPf3frS/0++GDEm86pxLoh1RJDjDutsa/Pn3owzqd+xorGsTZHceqqs?=
 =?us-ascii?Q?HSnah68R3GwLmqaYFpad8Pv8EYob1NIg4nymJqbC3jpnXLyTFEjCibpJB0/e?=
 =?us-ascii?Q?gZm1RbgwymHXTdNtDDEr1Pyu22059t4cEIrayAdCewvSJ11WFcP/yK3Qcjkb?=
 =?us-ascii?Q?whHUNQwq5gYpRZzbFhXkiYf4n1nq9A1LaS/0IM9BdfnE0UDoCfHgF2EXwmBe?=
 =?us-ascii?Q?KgwBi18sHGh507Zfc5hhWIKRX+5W8VJP035NR23gPyVfNSUWcreMNkoVL6xN?=
 =?us-ascii?Q?IZ6u5Ct9AFRurBs++1uJiPrLnpmscWThnOUz02lnGkFV0XuBI2nmD3GZrioR?=
 =?us-ascii?Q?0IMHHJDiC2j2HgW8CQJjkAlH3zIOJQVI5N9Un76AYnTkNIX6bU0ceAEmaogW?=
 =?us-ascii?Q?nZalaF3SBkVnLR5xyBlef+cc6/WwIXF423gIN9rX0a0dfuLBcyo83J7JlBFe?=
 =?us-ascii?Q?goKQUE5QQNEVLGjDvgHUadIHORM7+jXYL6H7bDKvc4hx6IjER4iSjgZ0e1Ib?=
 =?us-ascii?Q?Boc7rcbrtv/tqRPBzMoliSEgkJ2zhMjVK1abSJjm9glWeQCMnMqyfIAk7LYj?=
 =?us-ascii?Q?pgpuyhezVPVbePaaGTKOK6glt92JUbFjRs5krYjjuG4WqWZZO0pSYH1jEFjP?=
 =?us-ascii?Q?yO1S5WeCPH8ndYCayzuaWPRG0Fx2M1j03CllfYmjIsVBbzBlu1Y9vTPTUqrh?=
 =?us-ascii?Q?/3HEIk/9cqWvF7/1aSwkIzMw2NIpjLTT7YZwiFXVmXr3Jb5Yb5gbxFlVsnRQ?=
 =?us-ascii?Q?GWOxTBPpzdeF+k0H6ny+8YRE5BXrQD01F5hsZvq7CUkbPeyTE+xWhECcPsUb?=
 =?us-ascii?Q?IhUnIQjGAsvnIssvJ819hVBmjQWnpa5UzmQxU7ssDuAIO4emqYlBBD9I4XAN?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e661ae-f15d-41f1-2c14-08de11a9d36f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 20:30:22.9493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnmSkv02Ga0ZOjEie4jjVLwrJ2Db5Nz7FsG4hunl5sYCVSmukWuMz0Mvobyy7BR/CGoPL455WmCzPAvIbWAWhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
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

On Mon, Oct 20, 2025 at 09:45:27PM +0000, Stuart Summers wrote:
> Adjust the sequence of the migration teardown to match what
> is happening in the init() function.
> 
> v2: Take a reference to the migrate queue before put (Matt)
> 

You need to store the VM on the stack, not the queue;

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 7345a5b65169..ae42917918e5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -91,17 +91,18 @@ struct xe_migrate {
>  static void xe_migrate_fini(void *arg)
>  {
>  	struct xe_migrate *m = arg;
> +	struct xe_exec_queue *q = m->q;
>  
> -	xe_vm_lock(m->q->vm, false);
> +	xe_vm_lock(q->vm, false);
>  	xe_bo_unpin(m->pt_bo);
> -	xe_vm_unlock(m->q->vm);
> +	xe_vm_unlock(q->vm);
>  
>  	dma_fence_put(m->fence);
>  	xe_bo_put(m->pt_bo);
>  	drm_suballoc_manager_fini(&m->vm_update_sa);
>  	mutex_destroy(&m->job_mutex);
> -	xe_vm_close_and_put(m->q->vm);
> -	xe_exec_queue_put(m->q);
> +	xe_exec_queue_put(q);

^^^ This can destroy the 'q'.

> +	xe_vm_close_and_put(q->vm);

^^^ Now 'q->' can dereference invalid memory.

Matt

>  }
>  
>  static u64 xe_migrate_vm_addr(u64 slot, u32 level)
> -- 
> 2.34.1
> 
