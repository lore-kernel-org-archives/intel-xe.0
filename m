Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A18CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEBF10E27E;
	Mon, 25 Aug 2025 18:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbKUI1AS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404F10E27E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756145747; x=1787681747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S7AiKJqK7MghMxCCsOiAlCUICnmLVFPz0XAc0Zvak5A=;
 b=jbKUI1AS8c0i69SG5782Wn8KZnRFTsgdUtNnuZA+RFXvsrSCFHAwh6B5
 jjl8yH7X9RAkLKt2k5w8mcLnmp/5EwAQlIZ/0fs8WzOtYZe1rV6G5b8TW
 0yQMGmlYXSrAAjEGyrix2noRuGUNuP3oOT0W3N0j3dqp2yOxNamqYASD0
 jpeaPTtj7KMXblH02LmbXWoQSX9FccIxns991xJj7cKJS6c7/hHv55ktT
 ZKqET+rteZlQJRyRK+zlZsqyvzoegfvpZ+SgNR6eGJaZJqkHVSxDSAqsY
 szJUSI0QZhs2zJm2YFcv/ZFFsn1G21r44Q12utYCFuu+A2ND8qUcJldlw g==;
X-CSE-ConnectionGUID: RpdEAYB7Sj2H+gP5Q8TFpw==
X-CSE-MsgGUID: QeBlwMvLRkSIG0qiPF+KgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="62185391"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="62185391"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:15:44 -0700
X-CSE-ConnectionGUID: hS64dBNxS2iH7JpDzgih5w==
X-CSE-MsgGUID: Pp4LHsEvQaGCOsGGsQATiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168873450"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:15:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:15:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:15:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:15:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVYnO+ZmyGaAO+eC+QxgMomUWCYLQmNtXZRF82fWfHYx/dk1jEIwTDrx6/pbYZOKjEJDNYKoZK10CtV3n+bTI+btkf7wTDj2By3ByVUrae1x1tSRr4OOD5K3K9ZbaEqhYgXpXhdO3Q4/Iq+4mkyQlvXWO31+VnJcpt6IVbimoQ4EXkPBU6yn2DVg+5esf02XmOhDY5R2HB1K32th1DLTo588vDakKRUMDURm2h3s50tjqFh4Z5NRwRo4qtTr+1R5qZAAC2QlXNhiixSwJUNG03O+nWMU3msIZT2y351nkjZv2rx/ci8aSwBGj5LJoAekpngbztj25g452OWq+l4diQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYX9bV9ZmcHXLA+T6XPY3kpzGLp9kPyzh4NJDkL9fYg=;
 b=BIRRh5vnSnb0Kq39XtkeSUhpqm2MomJow9u4qv4+cxSIOSSCbKCc29kj7aLhmxGOskQg4cSCiWhr81XuEwJHbqvTT2JuO1j2SDk0kiqG8zPz2eDH2pwrPLM2BwM17Wqf6s/emu1FnblBKx9vhKgpu/ml10PWYX+5Ty8bLjf+DTPNRML7z1UP3xgXndFpMUyT0EaBgUDTkV2a9LdNuiigMZbvUqDiuUoVCngny0qNR1ASO+rcqcgaZxkg960FHW6qR6pSdj+bc76H2ddBr8TIKkQnpYQe2VF9PNK3rth6XG8RjTR9OxkUbH56PnRlR0IMzpBpd9FNbmGKV5EX7zxGqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 18:15:39 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Mon, 25 Aug 2025
 18:15:39 +0000
Date: Mon, 25 Aug 2025 14:15:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <karthik.poosa@intel.com>,
 <james.xiong@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Message-ID: <aKyoQNJEq70Q4nkv@intel.com>
References: <20250825165759.1263546-1-x.wang@intel.com>
 <20250825165759.1263546-2-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250825165759.1263546-2-x.wang@intel.com>
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb78ab9-d0f3-48a4-8467-08dde4036571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cbk58hEvTwv4mIvSm2ADSink7pyJwxDsn4XWzATjX4qd087Mn+yOJI9UKQ9p?=
 =?us-ascii?Q?sot6baU9EIhX37rH9kLASsbRi6h52/kP+Yzcm2PxO3Llr85Pc6NO9Cm9u6Gb?=
 =?us-ascii?Q?6DtXsPVNzU9Ie3cnJHvWxUYlc6dO1C6md5QH/Wd8bVGd88qvo1Jks6F7UFLT?=
 =?us-ascii?Q?S9OqkaYXEG2EiBeAZbZmd4FQq15lZUWqJAWVmaDDjmZZhKyuQOwFebE5PJ/5?=
 =?us-ascii?Q?og9C2EKmVZGXxCk8ePGnQ/iIn2BNuLviB7fnKl1Rh8PuNwYRWtJRMJnHZEFC?=
 =?us-ascii?Q?GMdct53zBnyQVMlcx5rCoeHAWZxRQO+j6YsdSI0GRE3BpMM2DeMtfbPzqHOd?=
 =?us-ascii?Q?LuuBM6lvsb4D9lyz+fjqx+CzDSH1YTQB0cTlPbjoBE45cXQMcfWXDH/CT8B5?=
 =?us-ascii?Q?TiPHUHPDXyzXB85p1y9vx3l3iYcxA/PN6D7Mb2sbLdtKtzud02W4AmftnuPW?=
 =?us-ascii?Q?ojff35mTMhvAW2jS9Yc0WDjj66y61GQWyIzlnL/gJvxZ8jMsjXphY8JGta9w?=
 =?us-ascii?Q?E7EDMntsTpTZ2LEd63hhhuXASMNOBU+rZs9Ev5X9U7PrSoqppxLw0RZ43phz?=
 =?us-ascii?Q?CHudchmoKZEiA/aDcRtJXUBZeojpJDmnhAva153xUIirSV8vUeiC6e1TLqwq?=
 =?us-ascii?Q?jLLuBl87x/dGROojCjgHyW0yZA66v+Z+h/e52H/DycAuaTLP2WXQaTXg1IED?=
 =?us-ascii?Q?7CeXWg9yQMtF76pHTpgIhbnT5Gj91oVxv8ZnloE3Zm/qU+/o/rTAfC15YSmo?=
 =?us-ascii?Q?ttc9kKFS8gfVxgjaYa9OXKWyqfsVIIbn+oxc/L/9VHaEWU3j5lEbQCqNFo1E?=
 =?us-ascii?Q?mfmCaIKQbr7jnpbh6mk9R6gsW0TutbuM8iLVbM8v0HjM8ojmVfXwRWJu+MpJ?=
 =?us-ascii?Q?AlTF75LwZyMvg3VA2q1d9S1apgykrVME9DcAW9qq2evCykYo0c2qnmzeQrN1?=
 =?us-ascii?Q?IxOqBhvCLxYfwSfU42GaDgtroWQOKkxYPtCEk9brC1cgcx0Hzcq3ZfpziYnK?=
 =?us-ascii?Q?MPAOC/WrfusNUObDGAAR33BxuvXy8hUXI1b1ZoCZvsNAFxiFT1ub/xAZmwUP?=
 =?us-ascii?Q?UT1VLn3ApcawVgjPNpZJSDvAUHv1h3pBFrU30MthCT4Jsf1hVED0tfjgCngd?=
 =?us-ascii?Q?yl72QEuVTZT9fex+AABlTD13TjrA3bDCLzl2tr/hd+AASCpbon2KP6AEQ6j4?=
 =?us-ascii?Q?h+nylKcOnm6pQxNt2XwDNUGwC5SG/2NZiOGJDfp8zlJirjHK+Qto64Pm9Vez?=
 =?us-ascii?Q?xmqkmLUE8YGPspsZrXoXwpSj7JS7jD5R9EW8XI+2ZRTvxVwGI6YSFcIP8HV3?=
 =?us-ascii?Q?gQ3xu799wR/Obug8H3vtNoceXl8+H0dachMO/dQeZdkGlf0qRyWgLWbRexyS?=
 =?us-ascii?Q?7DLi4DyNaeT3O2FUUvRfEg4ds3N00j6YaloJQTcO7KLfI+Fnaq2AMqivFQ0l?=
 =?us-ascii?Q?364pYy0rGEQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A5FSieAtBrDxAn0PNeZSfuTWxWNsWdopLLTtwC8BJ2Clf6Ne+h9FcQQiDI01?=
 =?us-ascii?Q?PyrOjBRv0Wzmb4O7i4/wQsIGa0WDHtDHLZS3AUj2gCOcHohoNkIJhTlmLLgg?=
 =?us-ascii?Q?hO5ghXCaizV9jW7KQQA8knZ64PLbqNYnsnscwE8AFi6MgqSqtrHTnyAn/irl?=
 =?us-ascii?Q?RYqJXOHMAvIihik5WyDgR+iEhxc4stXfdZnNjnEcjIxw9cUVoMBOutSi7HId?=
 =?us-ascii?Q?SzOUXqL6IczcWMpKHZFEQPv9fFVCSpbYfctt/5YdtMG7iQi8EQ6ZnkbU/tzd?=
 =?us-ascii?Q?EDKqWaH7521j9wdEv+TaSqTArQkXqu4ErF9sGCTJrJBeZhtKA3pll8UJX9Wu?=
 =?us-ascii?Q?/kt70p5o7EizUFTfW6BNXriIq/HnX0OMNvBHuHGwChZ1kIG3YIYujM167F0r?=
 =?us-ascii?Q?5yDtrXow2RNpcuA4CXB9z3Vslp6zcS/3Y6pzupwO3do2DfmkkncxFzXoCPSz?=
 =?us-ascii?Q?GCPRTlbmj0Rwiw3CU0wB4ogmxzqI+ITu2hE7I/ngkO3N/FXKyMCyDFWFL5w6?=
 =?us-ascii?Q?lvY6eisRNkrCKyE4sJe0WrwbGQWKAD31SKRavrSBTOYshLy1A9n+kO6qH7ND?=
 =?us-ascii?Q?t9kPUGTKrZd2GpFpGJKK78kcEuhHqejPGww5caXfdeZ5BaN1+EHYXaPR4LyT?=
 =?us-ascii?Q?OYf8qr14KZxrXgDh+8D0E2OkoVBkuggYYVvGFV5dLkvPtQE4qFQEZ9Cn1En+?=
 =?us-ascii?Q?unq0lhEAKRihqTfXlZK0qx9R8Uersc7kBaBbhsc1TKabb222znkNg9yns0GY?=
 =?us-ascii?Q?Sih/262S5dbw36TlaL6kbAFqdfK/rq+NFa4tTuPaI95FcKZZ2yq6O62m/ssX?=
 =?us-ascii?Q?5f2kP9SeE53PsurG0kK1BoLJpOQtw19EYkS+0oQ+cSOIe2EmlT8J6x7B8X2Z?=
 =?us-ascii?Q?6fPURILHK0rMVQhUL37NGVQuhRrfhcXQTQDsB/9QuqihxdvZVUGSEMNtTq+r?=
 =?us-ascii?Q?hsF9UevSdieU4PEagd7ooWeDYMrz2Ycjv3iQC6grhC4+vAbfVq+MnNkqYxpz?=
 =?us-ascii?Q?rMrLsTmxHoFQNIhkVsHSJvFElwOCKyf4QF6dwWQ+TPL4GZWHXw1w4SH+8qB3?=
 =?us-ascii?Q?0jNAvDVvq1Jp2aTZBhCiA733DBU1msUntrlBXW55HwXj1YfYWSoUhYeZL9vP?=
 =?us-ascii?Q?lI/W+OXX5zlu9sHHvVgr5IIIASAuSM5TTyLWaDfkY14A01bQ4b1aiXHG3leV?=
 =?us-ascii?Q?R5PQFa0qATiSfwtPJbrbX2WeCkjxqEbVEaTNMXmd6Q8KR8ONcyLFlZFqJGwq?=
 =?us-ascii?Q?6+icnuBRNA2o569CM9NLKWhkI/zIv4f+p/FBe222lrAS6Ohbi4+fcd16+euc?=
 =?us-ascii?Q?vfau+9WaqVimkngaKT2P3o1r8W8H9VDrYTm2hqnYk+xVMbIACs4808rKF4zy?=
 =?us-ascii?Q?UthPyMuPvs11NQXcYhH63/uxIJ8pgnWR5NvDC0S2NqI09jyzr7f2eOdsCZmB?=
 =?us-ascii?Q?6cMqz4b6Lu30XJl0vbugdT7dHMKcVFIHE0Q9aDHWQuJDnMBTsDONr2mvhv55?=
 =?us-ascii?Q?9EE6el+2VkqbEEiI6WtgbC/kgGxITyVvjt/ub1g+hBLYowoUfxiwn2yKgdZK?=
 =?us-ascii?Q?LPJZxWiRzdDnj8+3sRj+7/p6yi4ugJq9LXSIJTA8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb78ab9-d0f3-48a4-8467-08dde4036571
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:15:39.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XgQ3HhVnoSM1E1ya2w7+cfLSyHI4YGSzinY+e0nTQRyMH7LOs7gEUZruFFl/FLlZwbOwLlQ5k+q8cY/dVKA8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
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

On Mon, Aug 25, 2025 at 09:57:58AM -0700, Xin Wang wrote:
> Move forcewake_get() into xe_gt_idle_enable_c6() to streamline the
> code and make it easier to use.
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 23 ++++++++++++++---------
>  drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
>  3 files changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index ffb210216aa9..8556b3ff1561 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -322,15 +322,11 @@ static void gt_idle_fini(void *arg)
>  {
>  	struct kobject *kobj = arg;
>  	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> -	unsigned int fw_ref;
>  
>  	xe_gt_idle_disable_pg(gt);
>  
> -	if (gt_to_xe(gt)->info.skip_guc_pc) {
> -		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (gt_to_xe(gt)->info.skip_guc_pc)
>  		xe_gt_idle_disable_c6(gt);
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	}
>  
>  	sysfs_remove_files(kobj, gt_idle_attrs);
>  	kobject_put(kobj);
> @@ -390,14 +386,23 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>  			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
>  }
>  
> -void xe_gt_idle_disable_c6(struct xe_gt *gt)
> +int xe_gt_idle_disable_c6(struct xe_gt *gt)
>  {
> -	xe_device_assert_mem_access(gt_to_xe(gt));

I'm afraid you missed my comment about this line in the previous review.

This line has nothing to do with forcewake, so it should remain.
or if you really want to remove, please send it in a separate patch
with proper explanation.

Thanks,
Rodrigo.

> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +	unsigned int fw_ref;
>  
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> -		return;
> +		return 0;
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>  
>  	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
>  	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 591a01e181bc..9c34a155e102 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -13,7 +13,7 @@ struct xe_gt;
>  
>  int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>  void xe_gt_idle_enable_c6(struct xe_gt *gt);
> -void xe_gt_idle_disable_c6(struct xe_gt *gt);
> +int xe_gt_idle_disable_c6(struct xe_gt *gt);
>  void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 0f8430acd16d..88557e86d637 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1076,7 +1076,6 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	unsigned int fw_ref;
>  	int ret = 0;
>  
>  	if (xe->info.skip_guc_pc)
> @@ -1086,17 +1085,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -		return -ETIMEDOUT;
> -	}
> -
> -	xe_gt_idle_disable_c6(gt);
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
> -	return 0;
> +	return xe_gt_idle_disable_c6(gt);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
