Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1400BD711CC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE64C10E147;
	Thu, 18 Dec 2025 22:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWMvUEBr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C8B10E147
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766098138; x=1797634138;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0bTld3gq1x9BJhUf67mlAdg5tFQaX0Ogw9RVllQnem4=;
 b=nWMvUEBrQivE5tLhpxIE0k1V3sBJho3UFitbCOwql7rH6X+4XzYqTzpG
 yNDOEBdeJKXWuewAmlMpEnF6S9/DQ3VpFEzhaVM1M/1hqa0h+beu71QJv
 r372P03MFkUG9ldVvTwjgHPrZfwmNYyXsGH4/K2dtCSMgPINGFpKs4hy5
 ZBHoL4MbW+jP1YEaMiSZCBTNnEeLnwZJ9SjCCued1mAkLUBFH+R9GYjqK
 I8vLVlUi/SjgJtokKW17hchlR2U69CZuoX+fqGmALD22RyKpWtl37qad2
 9Wl6le0gNeBGa3wCKnqkiom/M3rNK4J6VMSLMkxSWe4+/k0bUFAW0x0w8 w==;
X-CSE-ConnectionGUID: nK0n+TyoRtOrYn4CMr1LJw==
X-CSE-MsgGUID: z/YJbJt/SZiQqWcYEYyY9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78697045"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78697045"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:48:58 -0800
X-CSE-ConnectionGUID: MtHyanUSTx+FKC7JpKX7CA==
X-CSE-MsgGUID: K22H89+JTqyxfyN5U8AdRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203108307"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:48:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:48:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:48:57 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:48:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q48Pa1O3q49P2gIlWjaeXjuAAgX/oplWpMuqcMzQfK1GgL3hBtwcyF+v+A9i9X45IdQ/4+W5DbrmH3zD6Tv+zNbtfuD9gPuPSeiAJMCTe1CmD9eBW4Pyt6l6k8jpryzs3oqNQRRkD7oaIESGN7FJVMYz4dsD4eIYtzdxoP7cQYhwIg+C4+klVQ0NVPj5ac5Ws/dw0YpN04BGGMdsCARRKH4ciE1Ejd+9u5l8s4J+LJbfgN61uHVHYhNQBEWrK9MGZrlsI9qrHE/1RHfUFnIBbXFw2QDTDLp7qPOHSulnsfB3qFdnaVKJHfHvxnwNHx1AwgvYY86dGPblDqCBlaCwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4JGA2w+htJnjFycvFQcBCo/5YzFPcp4pbrljKmCUug=;
 b=bdZMKONhAaTEaP61PLEhBfcq6QH62bBiATUBUILdMPS9wf6uUMokoitn1zwyHOQpx1sGUeS9mJyFeYUZnjgpP8pkCAgTZAGXzlbggGOPk+hEwH70YRkfUzlZWzyFJV18SbHV0tw0ojnJ3HUMBvEEsiJM5rG3Q7tpNjIot26PR4Gx79CxHnZZ/42qRCJoJNkYURHuH0KRprFh/f3i5S7dGlHYN2wSv3biBK+mRgY/B/y6wL6DBf2pCQDuUloVxnYIoBqwDZP8wC+A88nJs9eqUt5/1mjEcfXrXOvsvMnNG8VaVPpXV9xs8x8oF3/LdWzneqPnI+aQEYKXO9+d+sMTSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 22:48:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:48:48 +0000
Date: Thu, 18 Dec 2025 17:48:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Increase log level for unhandled page faults
Message-ID: <aUSEzt21yLZnyots@intel.com>
References: <20251218223745.4045207-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251218223745.4045207-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 1616962d-0487-43ce-3196-08de3e879b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qmuEK9o6kYoXFER5NvtTGHKCjFWV11qQ6ipTev3jrOHhMzDq7P6pmimdIbng?=
 =?us-ascii?Q?jEkb38Al7FnyEo/muJSeC/HiFCtg/VzbEssaXVh/IfPw35+ircqg2NGpKXSU?=
 =?us-ascii?Q?9LykWugrmnj4GW7GkSJ/oOrwO3Xd3yZ0RRNbb+/0TQPgOms+p8m8NOZDRrY6?=
 =?us-ascii?Q?lPxURu1YNW3HO1PR9IF/yuVn6lUEFNl3OSTxg9WHALCFz30It5BB99Udaf3I?=
 =?us-ascii?Q?zjmw/1nVdfOHlZWYNxSYmAQJ1ZlOBwfyV7UR/MWGkJXlBVL1k39nzOQEBr5Q?=
 =?us-ascii?Q?m2NunOaFiKwOQV5etimYDvEkShBd5Nl7dyY+fcxffn0/NVhuqSdcHF2j80Or?=
 =?us-ascii?Q?iY2TIaXF2cuf/+aoIhR3Xk2S84X+JIgTZeTgelovWhVwb6LkbM6+hUevMXw0?=
 =?us-ascii?Q?CGjJhVSXuZTC5zMnV5LX1uPx8lSouEbctBqwCOa+92ZuiFYbH7XaOoo+q6og?=
 =?us-ascii?Q?gvWB/dKL7Hb8efKFPhz7EDoAc3h/VyAFavWJpEzqe8uhyjwPJvez9dGS9YkL?=
 =?us-ascii?Q?ICtGs8P2sVbBmhzzcgvrkLJrLTgAgGB/kzGfmpTdbdLKfLsRwPSEJok1DXFE?=
 =?us-ascii?Q?B6KMAuknhlVx7DAVAwaIypzBCo7BwMt5Rws7yIQT69MchxjWYwUKukYwjbU1?=
 =?us-ascii?Q?cIo7bLvXIzjyjnLzl22zme2HZCMVlIB9t9Ra4b378Y3YtZo7C2EZbN5tEX0a?=
 =?us-ascii?Q?9RoXdm4QwtbZVMUwCDpyzRInQVTC/SY5xm10BloytiHNQ5nbFSn0VPdLsyah?=
 =?us-ascii?Q?qaJ7crNbQr9/Q4mJBZgHYiFRE7Aagqlmq3DGDOSvU2OR7htYkVg17HCMRFDR?=
 =?us-ascii?Q?4R9OjUZ1F0OdwUQjaBcVquRpfxJMv+Uz/arRl6FF/LLTRFB9FnX4rbECAP77?=
 =?us-ascii?Q?cU4Ltoy8pYNmo8UtVQznB4e5A1YVsba36UtlkL6kzPU3YSYhZpoTVzGp4MR2?=
 =?us-ascii?Q?qJgM9CwGMB9GkVYcK1SBVNgViqW+gkwokw5q/j8lS7YY4/e/xNOq6abiCuh1?=
 =?us-ascii?Q?2VrZXacyx3isJ3BRQOR5yaFRzs85u4ifBGjS+COoN5i0BGSFUimwIji+yRpa?=
 =?us-ascii?Q?JhLhYtLWOg3VllMJq6s/KDUjHfRmv0zZHqcCSUuGWOSGcZgSNt3EmY3wepZ3?=
 =?us-ascii?Q?rtJuK63ZpGrW6je6JAXxHF3/Ez8tJ5NNp8RJj+/pqkYh8X/AsvjGDoaYQF89?=
 =?us-ascii?Q?DRER6GI+aCPcf7ApCcSeSy6sIzhaDoVI3ljPKbcT0RPi0CyT6LO+kcgwb6Iq?=
 =?us-ascii?Q?s9KmR2KfrGL3K7lXa8iDxEK59atOxyyeRIIgMbcV7WJX7b/SGfJaqh0VdX0o?=
 =?us-ascii?Q?EXpT3iJPM3rKcPG2S/qhNTPSSrFwvbiyeEoAAe+NKItY+8AOl4D2XqbkiCsh?=
 =?us-ascii?Q?otB13ErN1S5ipucO7lDsAsQJwj7n5BOU4dtRgV2mUBK2HKNluTWQxnlBzSj2?=
 =?us-ascii?Q?UGjJkN126sQQna/+lwCx1rRJ45kAYsMH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6k1hKBIyud6Z4tGysn+JQQUiYODKkYT+BVrhcq3Bm6k3p6k8nrF8gjv61egG?=
 =?us-ascii?Q?VRYt2WL5/fupBa0BtVXOhxEMCgU273sRsP1v4TbeMz1nKW7X5cqQPGEVQovn?=
 =?us-ascii?Q?BnfaOY8C/Fw9nibvJzybU7++Ex2PTGr7YbrRlNKNKJh4aL84sNAPnRPfLK+V?=
 =?us-ascii?Q?RZWjlwc7LMb7iFhmsqSG5ohZuZ0vmu+pEgBPMr87y78IIZuNoZZwQ50OBG8K?=
 =?us-ascii?Q?WEuGSY2U0qgOx4zF/Alhm+TmVLNx+I+GeWXfLTizIo78Id/To+19NcFKJ1vX?=
 =?us-ascii?Q?uguSpt0Uvq0hKBBtH5QGeQ5aRy6OHbl+/TAAkBOjXcgU1zkVll1s5rTNA54K?=
 =?us-ascii?Q?fU1O0pPqZ+masyy3goGziZ22YvtE4qAUdyIQ9xdoDcWIrKlpELUiBdSyPaOK?=
 =?us-ascii?Q?s9xSxIO0UOB86KCNYetIk9x/SkjuuDqG2qaIwR+p7i/gTvWE3KE1Trc3pbUt?=
 =?us-ascii?Q?4Xo8ZKmougHj0hRcP+Mj9K4wUYHs0eIp4CX0M68p6YIqqify24HG6U2HA355?=
 =?us-ascii?Q?mHuM32PR9+pBzZeWBmf0rqR6E817bGE6j4ds8LM7zSfUjUPKWaPUyhuNoh4R?=
 =?us-ascii?Q?LlXHEREMn3EwvLvRYr1goB6P44sjFS6R+vK+D7knxUJV2trqSX/VGgwAkV3y?=
 =?us-ascii?Q?QmfTy8TYuMDa8sz/Jl+A6H9kSaRz+J1kxayVub6iKYZdSXa4EOMIvxFm0nll?=
 =?us-ascii?Q?inRS5ak5WYgEGIAIF1VqtzZRs1LCCEZYFWLyDwAMg4zGAQw7ND/BbB1NEkKE?=
 =?us-ascii?Q?bUcew39W4y/tjPui5M2b7CJoQE3wGFc/ngx3GyKIRU+sb60R+KnDQ7LkeZS8?=
 =?us-ascii?Q?zM1VNWPw4pBNtQyS7QdJzcHwuG+EQdfSMAEOD5EyJyakLXncRz17SVxyIQcW?=
 =?us-ascii?Q?/5CIn94hjaIkyibHRojCQQma+su5xB063ysZMtEah4eMDtVyowXh7XX6SxYX?=
 =?us-ascii?Q?rQlCoN5du8i6BDYHh4Czb0OkSb0Tdql/mmuZNmdtZ1lQd2vRjaWObdUHkvTE?=
 =?us-ascii?Q?C1uCmADTcJm0nnSka6R1XuZMUFx8inmQ7jfGIsS5nr0B1pGM1SieuszPS0yv?=
 =?us-ascii?Q?BZkHwxeTeA2Mm+j+Il8OCwTi7erjFq+THeqgYNeYc3G2tsmMtZw8aw4cw90u?=
 =?us-ascii?Q?+vmbYcuSAyGT1f2sZaOgD6pOtqHKHcGinq/Y2npCueOfaB5XW8K82VBZUin9?=
 =?us-ascii?Q?pxIrfCx4tSk3R36dqfHe0YowCvw7Jibue263EX33YFjOy+2yD5G8N9kQA8zy?=
 =?us-ascii?Q?e7mHGgWsIJm0oW9xLV8d5O8YS5txRyw/xpVErb2jl7yfsEfsefWV5E+NB2R9?=
 =?us-ascii?Q?W44v6t7KsePXv/RIX2+lCzga8Y/E8vHfP6q9MOBO0DBolwYHAx1g2bL3BE/j?=
 =?us-ascii?Q?cMKy+J4t5yZbSVkR5uk+1dRtyH513PdQX8ikjiRq47NQtOgPBzA97KN5DhDq?=
 =?us-ascii?Q?88VIIzLmCp3HWfY7ktfoG455Fh72G/4YqR2WGMQFWGGJ70oeVqrJMXEA082L?=
 =?us-ascii?Q?jICeYExOvyFBXaDqANd00Kv1cC46mhlgX+uR//pfCVhJ299z7Mdq7YHfAeSA?=
 =?us-ascii?Q?8iuCiOpxCx6Cacv0LwLkcXgGzAksHjtBxaKwAPP/rMK91/kE+YeG8+JaVnWz?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1616962d-0487-43ce-3196-08de3e879b9d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:48:48.7483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIWrnw5h70crviT3f3lf/12ei4qrf3+YmBQ7LL+GXL86/sNFagSW1Htwmdnw2j0/aP1HZ/fQj8ooS8cl0ka5Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

On Thu, Dec 18, 2025 at 02:37:45PM -0800, Matthew Brost wrote:
> Set the kernel log level for unhandled page faults to match the log
> level (info) for engine resets. Currently, dmesg output can be confusing
> because it shows an engine reset without indicating the page fault that
> caused it. Without this change, the GuC log must be examined to
> determine the source of the engine reset.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++-----
>  drivers/gpu/drm/xe/xe_pagefault.c  | 36 +++++++++++++++---------------
>  2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 43fd2069f9b2..259c4e1dcae7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3159,13 +3159,13 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	 * See bspec 54047 and 72187 for details.
>  	 */
>  	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
> -		xe_gt_dbg(gt,
> -			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
> -			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +		xe_gt_info(gt,
> +			   "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
> +			   type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>  	else
> -		xe_gt_dbg(gt,
> -			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
> -			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +		xe_gt_info(gt,
> +			   "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
> +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>  
>  	trace_xe_exec_queue_memory_cat_error(q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index afb06598b6e1..6bee53d6ffc3 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -223,22 +223,22 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>  
>  static void xe_pagefault_print(struct xe_pagefault *pf)
>  {
> -	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
> -		  "\tFaulted Address: 0x%08x%08x\n"
> -		  "\tFaultType: %d\n"
> -		  "\tAccessType: %d\n"
> -		  "\tFaultLevel: %d\n"
> -		  "\tEngineClass: %d %s\n"
> -		  "\tEngineInstance: %d\n",
> -		  pf->consumer.asid,
> -		  upper_32_bits(pf->consumer.page_addr),
> -		  lower_32_bits(pf->consumer.page_addr),
> -		  pf->consumer.fault_type,
> -		  pf->consumer.access_type,
> -		  pf->consumer.fault_level,
> -		  pf->consumer.engine_class,
> -		  xe_hw_engine_class_to_str(pf->consumer.engine_class),
> -		  pf->consumer.engine_instance);
> +	xe_gt_info(pf->gt, "\n\tASID: %d\n"
> +		   "\tFaulted Address: 0x%08x%08x\n"
> +		   "\tFaultType: %d\n"
> +		   "\tAccessType: %d\n"
> +		   "\tFaultLevel: %d\n"
> +		   "\tEngineClass: %d %s\n"
> +		   "\tEngineInstance: %d\n",
> +		   pf->consumer.asid,
> +		   upper_32_bits(pf->consumer.page_addr),
> +		   lower_32_bits(pf->consumer.page_addr),
> +		   pf->consumer.fault_type,
> +		   pf->consumer.access_type,
> +		   pf->consumer.fault_level,
> +		   pf->consumer.engine_class,
> +		   xe_hw_engine_class_to_str(pf->consumer.engine_class),
> +		   pf->consumer.engine_instance);
>  }
>  
>  static void xe_pagefault_queue_work(struct work_struct *w)
> @@ -260,8 +260,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
>  			xe_pagefault_print(&pf);
> -			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
> -				  ERR_PTR(err));
> +			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> +				   ERR_PTR(err));
>  		}
>  
>  		pf.producer.ops->ack_fault(&pf, err);
> -- 
> 2.34.1
> 
