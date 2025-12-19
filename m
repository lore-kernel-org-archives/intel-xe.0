Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A618FE66884
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC6B10F0B3;
	Fri, 19 Dec 2025 21:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToJPIR+T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B70410F0B3
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766178384; x=1797714384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/rgrtzh0xSZ2v9Y3DW/GY0G+5SkpNiOc2hn197wztXg=;
 b=ToJPIR+TY0+7IecibljFadGOi2LDHFNfWF9Dksolexkk7QtH7WK8d+tM
 sAvPkuFl4qGAvkED+1rFcGC8ykGOZfVy/6rkpeqKWtGJRk6GaXVDbj20s
 3mLGVdxvfMZ471TjVgsMET54pE3tORBPLb0jfGqtANnhfWUEB6Vf3rhN5
 S/5U5LY0aD2Q1cQq3yT6WVbhUWTFq9n2sDeJb7Hs7WoSq9x/beN+E9wxp
 L+PtR2tB5j4tAm5078Zi8H6mLgzAMep9HvdPq2gcEvBzpVnbVXfNyq8IE
 uEXD4eqzd+opa8q6C63oDx/Krw18Fkgu0fPiQv/Qlw/0xpWHSVGtxoxUw Q==;
X-CSE-ConnectionGUID: Ag8AXDTGQQyhfvVqMYF94w==
X-CSE-MsgGUID: D3g104loS9Of8NGRX2pqvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="93615729"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="93615729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:06:23 -0800
X-CSE-ConnectionGUID: AVj/8cbTSLalrMGvKDxTbA==
X-CSE-MsgGUID: MTPXPS47SdWuDVz7qF6ylg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:06:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 13:06:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 13:06:22 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 13:06:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UawbBTIOLg+r0pQWvg2WU87aG9k7341m3Jn9lgIzifvHkrqaEPROQU9GrzHWx6d4xux0zz3pleFejMH7U71zX3GAVL+LO0744IRx7lWs1wIQbry569s7PfjwC3+mVdF4kRtBMAHBXIwUPquHn7HKNlJFi/L+XvKUl1lsD5Fn189487M5yDzKjqvds4Y1jRhlYFnuzX7D2o1tnt2Vh2GBMt6L5DzKUFHGGONjjGdfM6lEIGH+ZQqOTfYkUKCTtwAt3Y0Hf171o7p7hvFGUc283HPYpOE6hHBfcbbg8c2Z+bG9KHVKKwewQI6pqkJ1KMTHyQUWDDA0PEeRZXhJd1UNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64f54/gLVVRz80OzfrGYy/WOvnPWRsjzCc8Yo1im+A0=;
 b=vZerBgvkBwngAOSV+WGI7OPOyMXhlVzkJ6nDghHp+C5QyvGIFL+fnWXBOa548+ztdheTzugN4ahjVQD0GZJpEMCbKxzg6FYerKWqi67u0XZVlRkIxP3Bw5/h+lQAfvoNTxEomidFHJeD0EaxvrlJSBwfMmzixFOVVLmXFxZhgdXkneAikQb8rZrfeOFKaw3JKXfV2hjaPSkdxDup26WL9Ul5eOuUgVZO3vo8ylkjeiAybSlMnBUu7OEbvgQmkmv09hteYD+Iz1Dt02s6QdzsGiq2XBDikYN5YAQz1fbaQ327cTGepHZ9QgX7xMKiIvbLUCZQINe/+KyozgLJNABMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 21:06:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 21:06:20 +0000
Date: Fri, 19 Dec 2025 16:06:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 15/17] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <aUW-SeH7NnRoN0AM@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-34-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251211010249.1647839-34-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f11b85-88a6-43ae-20ce-08de3f42756a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6hV291wUVbRdKsXjwi+VoeWMwaZdEi8lQyvkbWzAYfmtpBoj5vxLQNioJsdh?=
 =?us-ascii?Q?WdLOJgHTgEX716QhOT6qCwlc/cozW7uCjCjGuz31hCcasBkPPRCeEen3Hshx?=
 =?us-ascii?Q?GW0yREj51Qi8c6lZsb1lNVfXKTxR0fo8hp/9suXHykMvKPgNGd2fTg9GMB4W?=
 =?us-ascii?Q?Wym+IuwvkwGSml8+QzrZ0PsVSyGaCloJF8ekb78XM4WklxdSiZf51Hw2WUnm?=
 =?us-ascii?Q?q7Zv7rhK0a0Eyq/uZIS0yZ0wyqsB8EQh2wpEHKFQxz58CC1i4YYdlfNTcvWX?=
 =?us-ascii?Q?9dSvyn0ntc3mkMqJM5FTUdLsiz2sBg0IGCMvRewyY25XAjNfaj4nqIurxp1a?=
 =?us-ascii?Q?FIrpioU5X+r6Ou6+1A0p3n+xUvPvyTb4X2wyJOQopAFV95ZreY7XFYtVhSZj?=
 =?us-ascii?Q?CzKvP4kKmtLAbpbdgTuqnKnKkPuyhTG/c4ayAraFis6muF4+2kqrz6OpX67B?=
 =?us-ascii?Q?nz/i81qwOPvOufs4ElJV32ASloU7S11dHu6oSa0DoGpbtwHMmfk1oAqhD8mp?=
 =?us-ascii?Q?2Fb0i+QmhtWxHDzzdxifXZDQfMK+SAP1FFmtkXeoxkm94pzp7Jj5pyiThZ+f?=
 =?us-ascii?Q?59k9XiMzWuCRbmEbWSkie9xliLfTZ+ggZM+nCvslgJEHuAiQZOl6sqhxp+d2?=
 =?us-ascii?Q?+wn3AHf09XXT6/xSf32Uh1PH+6iDnCvYib4xTLjKEtmZ+5HkbQK5WTXEkkvg?=
 =?us-ascii?Q?9GRPAFrBQwfXCJOuvDEbfYATD4pPbCjCyn/+wVyYOgBQ6kr3jKX0FEpV1P/x?=
 =?us-ascii?Q?xQ+urIigyvjR0rmMmtQb2EiAN2Q9HQC6fh6RKYveKIvXPZ7C+QSuHFoIKoxM?=
 =?us-ascii?Q?pVyq5Mt1xkS71fU0F6gOkdSnjT5epBSZEmAsEsQ9ELf4ImLZzbTzaKeSHtPE?=
 =?us-ascii?Q?LaguSis8lYl/ynz4raHRhIhPF5B7clEjXf/UejjmxJ4WKZQdLIqD98ZsEefS?=
 =?us-ascii?Q?3quWYvpPfFbpA4stZzkJbPv3N8DaIjt8PvzZpmnxq45b2sWjYNrxmvvCNS50?=
 =?us-ascii?Q?Ddo6vFiRFr1yTPvDUarc45WhT+Z5IHvAgLzm089DSS7w8VDVQ/963GUdhnfz?=
 =?us-ascii?Q?Ubu4st6pXIIeLPzyl0Lk8cw5r3ByscLIrci3mMHGh/OuE6CUHWEsi1Z6q/sV?=
 =?us-ascii?Q?UrHdQWpI8qxvwdZrgkh74Jhrll62D3/WzOJBniHOIUamMMQ9bh4PDIpxa9s+?=
 =?us-ascii?Q?jfS/OV1E3DYZMP3oyxGj2ziyeyc1FP9UIfjPP2Ga2laR2toqvVO55iHfep1Q?=
 =?us-ascii?Q?381k8gkhru1pYq4GMT84k+qC8KRi9xB/v6tca0y01YxLyzvybohcxacZYpbQ?=
 =?us-ascii?Q?3fud38OFW5Wz0lzWRnyDI45vlw3BSZUO3/KWsMlO46lJyaKU9htb8+SBcKb8?=
 =?us-ascii?Q?7uxVWqjzE7BR9Jd+7ps9Xr6p8aVp7auwZJXZzb6bGGaChAgYBSM0WMWg1p70?=
 =?us-ascii?Q?EIxPs+MBH9ZGonXYZzcCWlGkXLjPThBX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VSWbo8pecYw0zA4kTi6i4KXTyf7QeW1gjindKFjwmOfM7RxzlKSMMCEc2EW+?=
 =?us-ascii?Q?1PBCLaevv7sIBzihhoUoDl//yLlMLUoqjRAxIXhq43ncbiBTGxA1nApD+ka9?=
 =?us-ascii?Q?BbUIH1nS2ralscqElatfPfsP7hdI2GJr3UrA4+CHPxnYgB9PQ2Ln0IJkpeml?=
 =?us-ascii?Q?Gn4YZK4mgBaIC/hg4lWaLlZKiPP8ksVTl9C4h0WAD3mh7WCqcJuOVd3iCfYb?=
 =?us-ascii?Q?bvAq+NoWtFDwZU/ee9FdRrMddR6ZCsuA8hwYhdn/gdoGptdF+nA9pwz/HDsU?=
 =?us-ascii?Q?1qXiOEsTpibx1RwFBDlAuem6pIyQe5lHhyRZz0qhV5Rwg93IDGXsN5ca1ByG?=
 =?us-ascii?Q?S+kNdFEXp7JRt9ZFZsIXXwZ36YEZFoEW68lK04frF/ogTxoSow2yuh+NmcqJ?=
 =?us-ascii?Q?+T92bcLePihqzOkZ+Vz5Swoh9iBiI05PhXQLPcsptPDYAm9kDU9TWlJICA73?=
 =?us-ascii?Q?0H8EidLDXoQuam2lQRBFTYG/YG5Czy2VQzMeli0TM9aZTy5f+5dMdIZqVbfN?=
 =?us-ascii?Q?huYmdXl9AGpwB4g5ra8+isATpY0tkDrUasPE5m5Ue5qRuv2OuupLl72rUh3+?=
 =?us-ascii?Q?5Aoyvgnxq+/daTiw0isSZrSsDGD5MYAPhi/ztTmXNr8M5V8T9WoVywxGFQwL?=
 =?us-ascii?Q?zphGSJxu5BRaNrgsJCiJlIQZ9aOIpRE9OfeaFaLDWFUdk99jThdCWkVxLady?=
 =?us-ascii?Q?djfewzYDPaQ6BZ0Lz0v/HJPS9sY8+PQzaKPqdQD1chTjVLL1vV8jnsEJrr9p?=
 =?us-ascii?Q?3tPau2xf+GcDZcyHnW7pZyOtTmOi+2LqN6noR3IpCsC2Pmq8SAXMZUaYvcS7?=
 =?us-ascii?Q?xwD5uS+kCEjVW7CmWGdmAGp36l0o9c60Guq00INAr4J7/kLjALlsZCdVKfr7?=
 =?us-ascii?Q?/XvH/0r4nA86h3I7bH3AFl0/bYRdUGmj6v/CDdRhIzDGgNcShAAq/TABfPbv?=
 =?us-ascii?Q?nQT2rwlu1WsHKIuIPlnyqXoKxvb54rDI8SFoK0zF4FENKt38vq2nBpRgXRl4?=
 =?us-ascii?Q?MYX+ULtpEf7PZTMhljPQBrrsR8+/Ypr2n6M48ik7u+PGYCA7nfYlAmK8252P?=
 =?us-ascii?Q?RUjvHB7wquP0tuU/Szp/cXEawZwjkaNdTSxSMDzacj5PlTnY6xwsxCYY+Jga?=
 =?us-ascii?Q?h7D1sB3TLuu+i0eGlUGroz3gPxi0CjGjiqohlbkgCvuodaWyMFjeD8dg+xrF?=
 =?us-ascii?Q?XJw0NP/tVQ/rKLVLkqRSjAB14sJQOFCXnu0YVe67TPBbI56JCEZWJtFotVaS?=
 =?us-ascii?Q?ZmSArIWuRUU+XYzQ5WCEfMcZuto4PrmeZtd0lHHttBx+y1/zajifKf67IL/t?=
 =?us-ascii?Q?An0Uxu7PCo+ZA14+0uXMSRif3OohpKdz1ls06vjGxQ+sJv54bADzgUE9/SEe?=
 =?us-ascii?Q?Cer1Ndcz3MHcbJDcLL3ygGgc/RaTcrLuNN/LokRf+HiqFYtou1lpovIdOhVW?=
 =?us-ascii?Q?SwKe+vAmmiMlCZgNgsRNkavGan8HPqy0fnglQxAbSsu2jI+BFY3jjA+kB4d2?=
 =?us-ascii?Q?OGmeGsduWQS97ckXSzCyQ8Z9Ze1lWJSuNzTTn5xNPL/zCo/UcH6sCZqJzRz7?=
 =?us-ascii?Q?6GKc2HbtLwOOsthVZm6Kyz+/8yEZMKnSf4iFtDXSioYQg358hzCI2H9ZjNyN?=
 =?us-ascii?Q?Ffoz+lFvv0EHsp3+frp+5ZZnLQcv1sq5zehLYTtJ84Tm0AHnrqh6NVcP3SOx?=
 =?us-ascii?Q?naUEwcUIRtmQ/HFFchdEUah0caeGZ/fE9tvlL1DM0nZK7aZkvoVQj2wNywAi?=
 =?us-ascii?Q?rmlPuDdtjw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f11b85-88a6-43ae-20ce-08de3f42756a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 21:06:20.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Flk64PKrVFyGn6Nm2K2zPi+yLlYPjF9lOUJaB5uM+dvc6Atllv2Rbnjag2EWU4Bklv4FJ8Mz5nSdnlv7SwRMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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

On Wed, Dec 10, 2025 at 05:03:03PM -0800, Niranjana Vishwanathapura wrote:
> Add support to keep the group active after the primary queue is
> destroyed. Instead of killing the primary queue during exec_queue
> destroy ioctl, kill it when all the secondary queues of the group
> are killed.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c           |  7 ++-
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
>  include/uapi/drm/xe_drm.h                |  4 ++

Hi Niranjana,

Where is the UMD ack for this? Who is using this uAPI?

Thanks,
Rodrigo.

>  5 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7a498c8db7b1..24efb6a3e0ea 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -177,7 +177,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> -		xe_exec_queue_kill(q);
> +
> +		if (xe_exec_queue_is_multi_queue_primary(q))
> +			xe_exec_queue_group_kill_put(q->multi_queue.group);
> +		else
> +			xe_exec_queue_kill(q);
> +
>  		xe_exec_queue_put(q);
>  	}
>  	xa_for_each(&xef->vm.xa, idx, vm)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index d337b7bc2b80..3f4840d135a0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -418,6 +418,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  }
>  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>  
> +static void xe_exec_queue_group_kill(struct kref *ref)
> +{
> +	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
> +							 kill_refcount);
> +	xe_exec_queue_kill(group->primary);
> +}
> +
> +static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
> +{
> +	kref_get(&group->kill_refcount);
> +}
> +
> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
> +{
> +	if (!group)
> +		return;
> +
> +	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
> +}
> +
>  void xe_exec_queue_destroy(struct kref *ref)
>  {
>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
> @@ -650,6 +670,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  	group->primary = q;
>  	group->cgp_bo = bo;
>  	INIT_LIST_HEAD(&group->list);
> +	kref_init(&group->kill_refcount);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>  	mutex_init(&group->list_lock);
>  	q->multi_queue.group = group;
> @@ -725,6 +746,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>  
>  	q->multi_queue.pos = pos;
>  
> +	if (group->primary->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_get(group);
> +		q->multi_queue.keep_active = true;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -738,6 +764,11 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
>  	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>  	xe_assert(xe, lrc);
>  	xe_lrc_put(lrc);
> +
> +	if (q->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_put(group);
> +		q->multi_queue.keep_active = false;
> +	}
>  }
>  
>  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> @@ -759,12 +790,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>  		return -EINVAL;
>  
>  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> -		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
> +		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
> +					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
> +			return -EINVAL;
> +
> +		/*
> +		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
> +		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
> +		 */
> +		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
> +				 xe_vm_in_preempt_fence_mode(q->vm)))
>  			return -EINVAL;
>  
>  		q->multi_queue.valid = true;
>  		q->multi_queue.is_primary = true;
>  		q->multi_queue.pos = 0;
> +		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
> +			q->multi_queue.keep_active = true;
> +
>  		return 0;
>  	}
>  
> @@ -1312,6 +1355,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  
>  	q->ops->kill(q);
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
> +
> +	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
> +		q->multi_queue.keep_active = false;
> +	}
>  }
>  
>  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> @@ -1338,7 +1386,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (q->vm && q->hwe->hw_engine_group)
>  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  
> -	xe_exec_queue_kill(q);
> +	if (xe_exec_queue_is_multi_queue_primary(q))
> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
> +	else
> +		xe_exec_queue_kill(q);
>  
>  	trace_xe_exec_queue_close(q);
>  	xe_exec_queue_put(q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index ffcc1feb879e..10abed98fb6b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -113,6 +113,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>  }
>  
> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
> +
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5fc516b0bb77..67ea5eebf70b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -62,6 +62,8 @@ struct xe_exec_queue_group {
>  	struct list_head list;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
> +	/** @kill_refcount: ref count to kill primary queue */
> +	struct kref kill_refcount;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  	/** @banned: Group banned */
> @@ -161,6 +163,8 @@ struct xe_exec_queue {
>  		u8 valid:1;
>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>  		u8 is_primary:1;
> +		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
> +		u8 keep_active:1;
>  	} multi_queue;
>  
>  	/** @sched_props: scheduling properties */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 705081bf0d81..bd6154e3b728 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1280,6 +1280,9 @@ struct drm_xe_vm_bind {
>   *    then a new multi-queue group is created with this queue as the primary queue
>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
> + *    set, then the multi-queue group is kept active after the primary queue is
> + *    destroyed.
>   *    All the other non-relevant bits of extension's 'value' field while adding the
>   *    primary or the secondary queues of the group must be set to 0.
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> @@ -1328,6 +1331,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -- 
> 2.43.0
> 
