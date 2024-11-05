Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D1D35E53
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 20:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DAD10E114;
	Tue,  5 Nov 2024 20:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J98tKvZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBE410E114
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730840136; x=1762376136;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pi8/0uLF7u5wC98PwMbf8Kj5IdPWGgPFsBNUvxvjcng=;
 b=J98tKvZS/dpgIRfzOCREc6hfw5NjBh1bptmWfegM/3ILJ69i/hHwEsw7
 4w0dvFCmh8iz+k3Z7vSsXcVZAg17I/HJtuUtGvUnSy6b0xXkrJA9iMokn
 PaF6K4MykzOteakSx0Hxr8vvMntXJ72pkGfDe/ZMGEMxWxEsTc4Y3XJDa
 3kcCQYXBeQfYIZvmK6yaAxwA3vrt3qsIvZvvPmGPAg1bHP+SDCRPDkopX
 BO6wzMmQPgUSVxYpJqWLPbM04dSWOZcYL+JWfTr0cLRqYoYYrhDfVbOOJ
 NkMEiQJ+rntJSNMj2RSTxWs/pyxJzeHGnyj2Q5DDu9rKuECGlXt5wlP/6 A==;
X-CSE-ConnectionGUID: v6gzjCiGTX2WyQLTLdlniA==
X-CSE-MsgGUID: EVr4QZtlRMCL5VhfNYkE2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30464901"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30464901"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:55:36 -0800
X-CSE-ConnectionGUID: VcZE5DGhRoOpCoqxTqsV2g==
X-CSE-MsgGUID: jikSygk4TEi9KMNoXh0y+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88663697"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 12:55:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 12:55:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 12:55:34 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 12:55:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzihg5BHNFunMZ66rZY3QJWfBBUD2MYbhuWzXYddYjPVFFGGxWYqossGsOSU5Tc6Cdq33baAuHOvheoDEu2CrAtaM3VVqRZIVMOv+7U2DX3tuZT0ZTP/LHvYwrzjYVNQsq6p3rvxCSck5r+LYdnI5g3t9kHzQr6gZe3j933RT7ry5a06PYWMAOnPbAcLifE6ba/4iDT9wNtD3ku0nQbIg18IDuRiiaI8RidlGtaoXX9//687owiQGeC+/LzurdSnF82oaiBlAqg/HkTgUVOij2w6jUgUZqvP5XkMD9WKtVB/llwBy0hD4hzExQLi3Pd9iYWEj6Gj7hVBaGpqRGF//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP2z3aHv5rUc17FwpIvAB4JOUnvu9tzn3yhuom3jNro=;
 b=xI583YGM/qzYbDjQbxeofaX/7oWjVMduR6eowuEHE9tPK7r9r4CPtrjqTKk7AR+0SBclH/rhClKiv5J+skW/Xt+7LU/nXq0z/3vs7CN1CSuiXQg5GFLTVoaxZQ0Bg7JgLvV6PSDbCumZ1UQZTpcsldg/45RACkZXuuG6qvh04+lPY1ACEfG0yxuIzpFHN7BGR4QKaW3YFJtyJ1ZXEHF9A50Wca7axt9vG1h481PGUHLFgs3z8p1zksC3eXsG2tSOk5cEUYWAAZXOPti51qoG0Z3fT8OQaHq6LrU0xVABhdBmP3MkuRfhY4IQfzbAoBKnGh56B0J3BBFHb4mfV/DZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7089.namprd11.prod.outlook.com (2603:10b6:806:298::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 20:55:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 20:55:32 +0000
Date: Tue, 5 Nov 2024 14:55:29 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Drop VM dma-resv lock on
 xe_sync_in_fence_get failure in exec IOCTL
Message-ID: <hcupqsul7gcgwu2unplcm5cvix6p3ntmqfarkfw5cvn4rdxdn7@5ozmrfnges5q>
References: <20241105043524.4062774-1-matthew.brost@intel.com>
 <20241105043524.4062774-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241105043524.4062774-3-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0116.namprd04.prod.outlook.com
 (2603:10b6:303:83::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f49ebc-9b15-4749-61f4-08dcfddc3013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Yx5ndZeG3OKH7ArzCYlQIyrn4Le21S9d8lnCHEC1aunpZb5zl4swLIe2bNH?=
 =?us-ascii?Q?vsYUiKzpU6W4b+Baort3ReIVAtUTgcp4Y5MoS3f2HoPQILicjN8ADBHnwGKW?=
 =?us-ascii?Q?lu1XaDAbw7KxX6cXUW6ymDdjV/nilrYSmDO5+h6W5KqrZ8RbaBQm5oICFFRz?=
 =?us-ascii?Q?p08D7uRimpDrWBtdpbBjHevRtc89g8eS7haCQp3xXw3CXj7El1wGTDAriV+W?=
 =?us-ascii?Q?9HKITAh6WWzDKuNPul6lyBbnWdsiulsXZbDp+Ilc5K9JrmR5SJt19bJqGjjY?=
 =?us-ascii?Q?JkZlfvVy+IBPvfBmlMtsqRoEAgf7iB/7iOkM7ldqajQth+FFPaZ8SRavo7kG?=
 =?us-ascii?Q?N8qLby7DJQo/icHv4zw+dbIuKADIicZsS3MDXZWgE4ADD50n/0DUHujfotL9?=
 =?us-ascii?Q?w/rl8odr4yIdWVQ44ZSfG1HLoPlXu6mvpMTe/mDp2jIL1q4WYjmFlqMoBIe9?=
 =?us-ascii?Q?E4aooQYJOw8HRpl/59VLj0i4Xg6C2+GWX3d/PGhTr3YJDeHoW95u5aIXVpBf?=
 =?us-ascii?Q?YpVLjL7USCFr2BbiVoc4Xuje9a7X84ztcBwqgHSIJZCPQYGg7Y6uygAr/gER?=
 =?us-ascii?Q?2lB8AgXfIcpthrRd6WEFTETExA35uVy06VKpQYtaXRPuCN0+FdZoP7uDZ+eV?=
 =?us-ascii?Q?WIgVyre9gKXIsKJ17IWFQOywSK4Dk7ImkFQoZF9CIY+K6b5XeFMBNqqrobhH?=
 =?us-ascii?Q?HQxfCsLycsLNaoHGZxgDNh+XhByPd7ddkmGED3pJR1MU0lGHFOgy/PeNVMI0?=
 =?us-ascii?Q?x18ek+zHqwrjuNZIQpwJfjLBeIFIxV6t2vvtgqxR8KchDKveVyjbpT0AyJdA?=
 =?us-ascii?Q?p8TGI0tdKDUFQzztvOE70y1lTJANqhYIekq6Gkhj2CxWH2FtU/TZmtG2mXSs?=
 =?us-ascii?Q?w0nzGtBnETIb4x1PINazNGcXJ4aZflBiCDBdS5W9iFVvDIBTUcbWTXt3CqBl?=
 =?us-ascii?Q?mOv19UcjIVzWFYnj0FRANcOlSqDznQieV9J5WzkYj1ZlQzqeG5Xf18CfR91v?=
 =?us-ascii?Q?PU+XSrBO9tWmIHMT3QsIdRDW2jGHblO47f6NziMKvyoL/s7e+xEAEAVfRJW2?=
 =?us-ascii?Q?LNiWFlYOea5bM0YJnQcMa8Yl6MHPl47hLe6H/25PA3d+glKfEu6BlfEb3W/o?=
 =?us-ascii?Q?0aEHflzQq0lI626tAueY65eXzkslVfROUkvIVv4KWqZW9b/aiu1611TPROmh?=
 =?us-ascii?Q?Q8PuvGd+5AwIoiWmPiplg/TfPpkPUnQtx8slLFAz91qxSlmZVI9iP/UFf5PP?=
 =?us-ascii?Q?PaHW0aezxbU32u5ZVKsUiT+CyDmbm4mHcYyvlTNDcjIE5khH3K+OlwtfzPJi?=
 =?us-ascii?Q?Bn82RlTXArrE7r1VJCE7rWOB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NXgVJFG75eMzMs/UF2H6hdJuPEo91+vSR6CeePq2drfiYWAkB1SHHNvbzuYC?=
 =?us-ascii?Q?q049NuvePqGRDZpXO26Ynkcve1F/jUAwK+E1V5nDLTsiiJIy0RWHIMczXvha?=
 =?us-ascii?Q?ue1u79xXVwss1GEkypLdJmqxyAvXRE/z4Y4+qqlQqmLL7KKI16C2RdOHX/qV?=
 =?us-ascii?Q?pYce+1iRG/bHwX5/bfLgvoJP5FM+rkSSmnUqTQJuiePPXPux9s3r0s5Ac38P?=
 =?us-ascii?Q?cYuRgE9WhHW3VymJfqUxDCh4lR03vvsVykXK105y0/gdtm0jm9IMlr/4sQw5?=
 =?us-ascii?Q?loW5/XPV95vpjmslHJkOE+UNNydaAKwyKZcCdm7p0uNpH+jCh08kmobZTMqT?=
 =?us-ascii?Q?5CJn52Z2x4PTSCz8eWlH9jGnMD+rJdBrus1UU2mBd9ej1EANwHunAHImhRgK?=
 =?us-ascii?Q?EawcTLrO1aqoxFkh4xPabXEcvEnqQ+LJjWcHzdamIKYXgpe6uvcY+/pqUhei?=
 =?us-ascii?Q?+/HvIil4Za5GZ0jUbqLj4wiRLpU/F8rPGJrDZuXdGjcm/xEqypyX3/lMPE2+?=
 =?us-ascii?Q?gf3DkDCVyv4irdXgMO34dAEU+PE2wxxLMkf+EiqXw7MYk9lTHX/6SaXyaX7d?=
 =?us-ascii?Q?iwg1YXRC/B8QQrb+q5hBo1v9LXL2u55Sm2wkqhwsVH8GrW/W/Y8eHZNsbJuB?=
 =?us-ascii?Q?O9JnnPUTije/TEDQbe2UtIkM5DdYC7rkK4vpLIPrBoVof+Qszzv/S6j+ffHh?=
 =?us-ascii?Q?DYkcRhdwHI8ib2DooqvCewIyQkCOTaeJETbgkcHs37W49jW1wqWO3LJIMu/C?=
 =?us-ascii?Q?cpniw6RzzgiRvn5/T+ufqSHDkx79ZJPYmAO2dnpOLxiVvrcGBz/Mmh6GmY3O?=
 =?us-ascii?Q?3xms1XllNA/3iGQwwPkfFjsa7pVc5DSnohC/9niM6fT6htcSmQUrl0LQfyJl?=
 =?us-ascii?Q?0Xj0NBUiRwaQn7ooJeBW16qj5VazB+kttwUWIjw8PjGk1TXXuP3ApaBre7HA?=
 =?us-ascii?Q?SxCiVpYl2Aj/NVInbQa53tC60DIAmG757ZjAMBeHW4XWCo7IFYGNGgeVakrK?=
 =?us-ascii?Q?Nsj3au+9aY9+6sI2+Biypv/hVfMyqissxpvpf6t8rBvy6h9Em4fH6KF8VO0k?=
 =?us-ascii?Q?lVDrGRhUMLCUL49btVF3fHtJ0K6LcxYAbDEEfOF3qu3OfGyyrKnXT+2e6aPL?=
 =?us-ascii?Q?4i3VxWLGJ6yD87rbiLeto1N67rfF682zXVwuXL8USd0vsmK75a9dpsRKLqOI?=
 =?us-ascii?Q?NZCXDrw3az7LnqyQTY8hRWNs7f848fYJ0sMmwIv+pI5CZzMKLg3Dsuf0NRAf?=
 =?us-ascii?Q?pkqmHaKsx3feRRktxeEdk907n8Yj1whkkshpMIPfwHfC0zDwXVvJqw3oiPIL?=
 =?us-ascii?Q?u20zwksIdlLIZLc92KJ0jfXzLcHcGscXgV0Mm1Oia8doawXmWGEVpje32tJE?=
 =?us-ascii?Q?Bp3WzB4X4likTVv/oWGWMUogJItQ8NVw8EMq8QSeKPh+yEhpqtcWTZiwQiS8?=
 =?us-ascii?Q?3lpCeK1h3QwiI5aE+AwUIj8tZ0QbKoe92y6dugBe0RU/BNzZc5BUwn26wgJR?=
 =?us-ascii?Q?9vz2fFsNWGPRz+629bGO4dTrMHfct3q6jIKB+n4NIu5/QaDUnGqCouVc5EIB?=
 =?us-ascii?Q?8pPmiqgkuyHJyMWYfmD3BoipfKFHSCRS7j4d0f+VCRcG4lSNtRz5WLgLcqIV?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f49ebc-9b15-4749-61f4-08dcfddc3013
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:55:32.2093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnfY4B5mv0kfIzBxL5Y5tOCHPy7FpdFVmvv+7ftYwOj3U3Gy0bvlI8OBkC0hVtkKOm+e3ibKhp+vvIkS46IAXrr8dUF6f0ulzN5T1/RTzM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7089
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

On Mon, Nov 04, 2024 at 08:35:24PM -0800, Matthew Brost wrote:
>Upon failure all locks need to be dropped before returning to the user.
>
>Fixes: 58480c1c912f ("drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC")
>Cc: stable <stable@kernel.org>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_exec.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>index 6de12f91b865..756b492f13b0 100644
>--- a/drivers/gpu/drm/xe/xe_exec.c
>+++ b/drivers/gpu/drm/xe/xe_exec.c
>@@ -224,6 +224,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
> 			if (IS_ERR(fence)) {
> 				err = PTR_ERR(fence);
>+				xe_vm_unlock(vm);
> 				goto err_unlock_list;
> 			}
> 			for (i = 0; i < num_syncs; i++)
>-- 
>2.34.1
>
