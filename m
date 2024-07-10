Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDE6C38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 06:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037BE10E63A;
	Wed, 10 Jul 2024 06:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJl8d3E+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BAD10E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 06:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720592953; x=1752128953;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ax26lhDR/k+s9nc9YyFuSZLiLBjFxCIdh8Pa7lDzRIE=;
 b=LJl8d3E+Fu8ahj4KeQIzHJDZb26ssmUdIWgAbrkM/IQZV/M5Y2YCJU/m
 KtPIDtgjJXSAbq7D/RqRH5lpCPE+TapZfIFxAGmi9eqFvb9FNANZE3AAO
 oHAJmXp4iFxY55ch/StAJ75yD1fUlqbGNJjSyqXSnDjTa9gQ1dHlEl4bs
 UN/0H2pcqkJkcZ7WG2asmSuI9TTJhfTQ8jB7VDkgQweGIfNl/MoFULG1P
 KgvgD31ABnWz+SEPX31+JlF0urvKw+EextxMNYvFqJclKSoMP4ox14892
 e/xqd5JHFDuaGFV0OwL+uJv0kgWFqcdH0eMsVmXyMyDlAnBjWihWxB2qI A==;
X-CSE-ConnectionGUID: mi0FB2pXSgipL6b9YE89yg==
X-CSE-MsgGUID: bm7lzk9uQ7OfNPDHWzFrHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17755471"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="17755471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 23:29:12 -0700
X-CSE-ConnectionGUID: amw5uGVsSo+ffQyy0y3f0Q==
X-CSE-MsgGUID: KjTQWMDOToa1SovHBSsPjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="71329548"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 23:29:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 23:29:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 23:29:12 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 23:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9G8qJeyDEpdo3v2tL34sAxkFAUAJrzwbPjRvp+QlUpTWUl3LixN27Je2AlQc7tkR2jwi0jCLCp/b0TJJnNIYdo51AE8ZElvf2gYBSM6vGZ1aqguIMmnSvx1TXX65GGS4/7AKAODCdTo/1weihxKzqrND1iXKZFmJOLMX9dcFV33Eqjs2WHwtXrxqFPyp24AFJ99ovpXdS53RabSzFxVrDU+Jv18Gx0qpJpV7IExuUsMEtH/bg0MD3f8DiRnSqxsmlRTdeqI9en9KFyEGUBCeWCX5Pn08Q8eSkCbY3UiFoNOul9Gq3pt+Plvk/Ae7cXRtI2PJCJlM/0rLa6Ii5qjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrycjhEaN0+2EZNRe+n5MJyceyJH2XdhNFVLyqsaML8=;
 b=bd0aR+HYPrAxA7Bc2JjmRJlbUI2VTN9Qj1AgjaFr5G6mYPKDubM8iYMkyRBYafDQJjYQ4/RrAJ57/75P+XUp0t4Z23o7tobjhfLQVl4q3qwRXLRMy2nGNB1F2X/u3wV3sIDJb3U5SGA5WwJuy/wyJtA46MBD3Zn0FQ+N1UmS1wTRR7x8gg5Ao90LUMKb7acImqqFHLqrNesRFn1ixYL8S8EU0X2Eod4WdtVYuMmzOEGYlMVpiRAjEqZevEpEAoy4fhno/Yex8++FTij5UYi9YiMs5e0TvOLeFZwnbW98tCJL2hunFYId3sVDsP7jxjGKltwOEflD3FKabKx7jB2+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 06:29:10 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 06:29:10 +0000
Date: Tue, 9 Jul 2024 23:29:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 5/8] drm/xe: move the kernel lrc from hwe to execlist
 port
Message-ID: <Zo4qMybgv6tVoLAR@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-6-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-6-dliberman@habana.ai>
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: efaf9825-2d15-4f66-ae2d-08dca0a99b8a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rW2A4CMj3qRPCEUKvzFe+ajDSUQ9Gi5RcBpCg7zXgYBv59En34I1RHh0s1T7?=
 =?us-ascii?Q?g44FNR1EjqEPJsmXW5jgl+DEnJAWkLUvtG+agSRNYYAgtV0KylhqecBZtBsS?=
 =?us-ascii?Q?vE6XJGMxOlX1R2zK1A8mRuCIR0PsiHQdknE5tcG7gnRQirHQ0tC4iwFO996K?=
 =?us-ascii?Q?UW4hx2ku7VqrEkhBWQDQEzJRIc6aK5FrazSS50p7fuNoIYUL2+m5dbJzMYFS?=
 =?us-ascii?Q?l68GyB2S1fkGCLH6znV+6nw+S/mfx/NpaUcVdsmDOLif5XaACunjR1k3HRvk?=
 =?us-ascii?Q?coVmYcBfLOPxivtQABSEOPXg6GRZimE1XHuIo7kGjiy0BAXDzw77cYEow3A+?=
 =?us-ascii?Q?9H7QVfv3fT+aBpiRI6c7wdC0XBlFDtE+XFUSU1E/pg/DgUKIQ4+Sebs5GkhF?=
 =?us-ascii?Q?aVA8Yy8PrgICiF3INfpSEJvLF6G4gKnZguItnYG2Qm6XlKYn1TJbYkmELw9H?=
 =?us-ascii?Q?3PFFCQy3tmpTeVZJNJGpKqfmEHfJZu5hiRudACGN2pz2uUHdlgF6pmI/G0uW?=
 =?us-ascii?Q?lxOifSSt0vCRj9f52L+Uq/Fke8xgRMiQ5del3pCjtFd3aBobGS2cUR69TiFe?=
 =?us-ascii?Q?r+TV4OEdi4oHn+hSF+kIIqITkcOm7HW16WmoOYiX/YiRpzm0dWz976tb0guS?=
 =?us-ascii?Q?8Mdr0CcA+KS/FhRuy03MaLpXagJcL4ShLXQ8jHofb0q8yPzt98pQMXc56L0I?=
 =?us-ascii?Q?ES8L0mpu5/vIB/v5UbqXO4Cc9OHryldfUZ3xg8qsHj45Gm8svO/+NCSjm5uc?=
 =?us-ascii?Q?LfR4bQ+2Ye3v9NxxaW6Og/jvlreD9cqQmvvKgvotXg/4pQmU/LA+mZLzgis+?=
 =?us-ascii?Q?XAYv+QGaBcC4PAqkER6NncyIQDmWTEiqgqximYF4n/fnkcykyB9dP8qleRZs?=
 =?us-ascii?Q?f74qo0I1MSlOb8t/8Yl21Jwznwi5t+9IXy7KrukW+7mLeCaWbX13EsLIwP1H?=
 =?us-ascii?Q?83MymE+VdyZrMbj/zpb8Dj7/yWKB98fHbBeJUNxNUNP659TAim9XnCU54iyE?=
 =?us-ascii?Q?rQjAbIF97Q9VzidQXEGBYCt7irWdPGkH3VzIq4vyD1BGahcX2G6u8tu74Q7c?=
 =?us-ascii?Q?hfAiR3bAB+YPQ5NDY2QBUF6KHOqwbTl8WdQrQoKjHIJxCGOCmCvMFlNDP38d?=
 =?us-ascii?Q?GcH5+lTsEnSq0zRK2EoN7Ztbr6v+q4Q8oMBBXUy5mSLA3MAl9NgQkYstiJ1f?=
 =?us-ascii?Q?Lm9Mx2IOOL6sP8Z3sGdSzSN39zPfj0O3ixxgD5XqJa91200htFrKvSu6R9wL?=
 =?us-ascii?Q?TO/uoxMZu/zx/P4nTx1pvJPNVaxU/8KXNaxwgEW7la1MsphA8vDCxg2xM4vj?=
 =?us-ascii?Q?F0I5fi+fr/x3oYd/I1mfZgLeg7GYhjsZZ2GcCBOkANoGOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m3UOiMd6eYXFwQmx/lfl4xJV+6udVQcZ+Mo43ohTNnazmLV+Emf5UegPe+dg?=
 =?us-ascii?Q?5ssv50AfxtkWSptWbbfPzAJXfsU8ZduMSdT25aD9AaR9iWkgwr8/T33fW8fx?=
 =?us-ascii?Q?XXe9f1HucnMT+ZL5GXKl5A3eXTWd2g7750qCTaDRPe5o1GBpwp+z6ZYmpKQ5?=
 =?us-ascii?Q?QSY4dHZRH7NJtVB6G2VkUS8/K6xKAm1vPgsyvY18k2f4DSufM7nZAOWZvVa7?=
 =?us-ascii?Q?kF2kM4q4x87FhNW+vIEjomI1++uMpzXwfWLSajsDHGKVwl8hnvYYtmJmddvA?=
 =?us-ascii?Q?QO2+7VBJBHl210ugpAxh70io4EA5utuccreVfGQ40DUXCF6HretrHTKlyVxC?=
 =?us-ascii?Q?Rs4JC+hLAuUJPqXLb5lkFIlxss4S9xJKEZihyp4xTj59ZTwKAt0ZvWjoyyFu?=
 =?us-ascii?Q?Vx5PzfEyKOyaOvGSxeljGSgA2UTEGPUtoatqiXyU+/KRsWcKD8V3tjBiNu8J?=
 =?us-ascii?Q?YxzWaSozl68nit1lvcvv32AqizLEf9mdqyBzJG6lzCiNWCDi/5SlxsTXLTay?=
 =?us-ascii?Q?XGs6t7at1xs23bipC9fFIHrhyksJ+R6/I2JHkLkzhdUJbJwphGo9QTbBoYQ3?=
 =?us-ascii?Q?lC4iAsmsa15cuXIUyf12T2WHYaFpNrNGQHz0OMWG3srU2DJmgRqoGZoDuEcS?=
 =?us-ascii?Q?Wvec6OSh792elep3QMn2/2rizgJsKmYZhLOPly1CWxcNmyY1Tik89qmSXCq3?=
 =?us-ascii?Q?9BpY/+NfQS5dXf18FVlaR2HS8YnSOmKKFu1/nnbOIT1/IlSmqoXwghFAR6As?=
 =?us-ascii?Q?U8JWi/BUTBfJguCoLVzLrkMB0sbw7SbWMHlJx/CjxUrzQMqzIfjHcMvpHos/?=
 =?us-ascii?Q?VEMWV+fAycdONVFUM1tfr11mMwksyNL87oYrwwky2WACp5ddm/9GQHw6luZ8?=
 =?us-ascii?Q?qOu+agbtjliRf2snIJOfyinCtAUaXKZyvCl2IRP3bDDGktxDD1WUllQrEfG8?=
 =?us-ascii?Q?YAx3oO+9WxNt3m5TlLVkGIo04a3epcc7JsxZc632vSMvq928Y4hRVWx3waKS?=
 =?us-ascii?Q?9snKddITuWz5HCegf5CZCJkCOdJGQItna+WXKNiYhh00WrFCfoqEebWN5/yF?=
 =?us-ascii?Q?CI+X5t52aUsbci8iURFih5hFreIg04Xt4EvWnZ3EEzxYpgsp6yMvGCiZlSe8?=
 =?us-ascii?Q?vBd2tvaZvyDo6OBCuOtBNYeCCHh1ve69FHqUWzBWhpus3J5Ax8bqQE4hCg84?=
 =?us-ascii?Q?YeXIKUltEF0dkbotr0A7ATuQDZpPsMWiyJaYjphdKdRvDq84kAqE419Kq09M?=
 =?us-ascii?Q?JLEl6YoNsuUmajy0aSHKKoJN1RZzWLFc5h5w9ATNlr9zTLVqn+KCrGaY+c3F?=
 =?us-ascii?Q?PL2i/P9pxdPXb/SLE8iTMJrvGQN5IZB6LTGedXzo/Dq//974lJ2Z0/VXUmgH?=
 =?us-ascii?Q?1a+dAGuRvTPkm/uElITPa4hRSYyXraVq/mCL+Zpy7IMwAg51oh2Y/rzMtiRs?=
 =?us-ascii?Q?2HHJXDQxibJY9CSSIKU5INy4swxNwv/5gzqCYjHdKdHpY1ysawTMTmP/fpq3?=
 =?us-ascii?Q?+XbWymyoycjJc+QrviPwu5FicQvQHyKBnPo5wtlJbHSrwPmuOYdMcDoyFaC6?=
 =?us-ascii?Q?kZxQjZu6ZyBsxcjQ03SLgzPfsCeuHDih+qHahyvliPm51uw3piWPeaUqL8Nu?=
 =?us-ascii?Q?q6CchAtyAZGJvHD6cuh+70o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efaf9825-2d15-4f66-ae2d-08dca0a99b8a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:29:10.0225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXzKZye/ZYktVtbzrysHt84aRb8ln9EKOdtOUWsUr47g70zTXilHa4CsmUIYh8cx664AiTCZwEjFoJqXLWhAeUtiv7UmiNzD9QxnwFQcY9IvNa0ZJUhg985z3pW/rzyB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
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

On Thu, Jun 27, 2024 at 03:40:40PM +0300, Dani Liberman wrote:
>From: Ilia Levi <illevi@habana.ai>
>
>The kernel lrc is used solely by the execlist infra.
>We move it to the execlist port struct and initialize it only when
>execlists are used.
>

Why is this patch part of this series?
This patch perhaps should go ahead as a standalone patch?

Niranjana

>Signed-off-by: Ilia Levi <illevi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_execlist.c        | 10 ++++++++--
> drivers/gpu/drm/xe/xe_execlist_types.h  |  2 ++
> drivers/gpu/drm/xe/xe_hw_engine.c       | 15 ++-------------
> drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 --
> 4 files changed, 12 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index db906117db6d..354f85b591b1 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -123,8 +123,8 @@ static void __xe_execlist_port_idle(struct xe_execlist_port *port)
> 	if (!port->running_exl)
> 		return;
>
>-	xe_lrc_write_ring(port->hwe->kernel_lrc, noop, sizeof(noop));
>-	__start_lrc(port->hwe, port->hwe->kernel_lrc, 0);
>+	xe_lrc_write_ring(port->lrc, noop, sizeof(noop));
>+	__start_lrc(port->hwe, port->lrc, 0);
> 	port->running_exl = NULL;
> }
>
>@@ -262,6 +262,10 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
>
> 	port->hwe = hwe;
>
>+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
>+	if (IS_ERR(port->lrc))
>+		return ERR_PTR(PTR_ERR(port->lrc));
>+
> 	spin_lock_init(&port->lock);
> 	for (i = 0; i < ARRAY_SIZE(port->active); i++)
> 		INIT_LIST_HEAD(&port->active[i]);
>@@ -287,6 +291,8 @@ void xe_execlist_port_destroy(struct xe_execlist_port *port)
> 	spin_lock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
> 	port->hwe->irq_handler = NULL;
> 	spin_unlock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
>+
>+	xe_lrc_put(port->lrc);
> }
>
> static struct dma_fence *
>diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
>index f94bbf4c53e4..415140936f11 100644
>--- a/drivers/gpu/drm/xe/xe_execlist_types.h
>+++ b/drivers/gpu/drm/xe/xe_execlist_types.h
>@@ -27,6 +27,8 @@ struct xe_execlist_port {
> 	struct xe_execlist_exec_queue *running_exl;
>
> 	struct timer_list irq_fail;
>+
>+	struct xe_lrc *lrc;
> };
>
> struct xe_execlist_exec_queue {
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 78b50d3a6501..90660d9382a0 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -269,7 +269,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
>
> 	if (hwe->exl_port)
> 		xe_execlist_port_destroy(hwe->exl_port);
>-	xe_lrc_put(hwe->kernel_lrc);
>
> 	hwe->gt = NULL;
> }
>@@ -528,21 +527,13 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
> 		goto err_name;
> 	}
>
>-	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
>-	if (IS_ERR(hwe->kernel_lrc)) {
>-		err = PTR_ERR(hwe->kernel_lrc);
>-		goto err_hwsp;
>-	}
>-
> 	if (!xe_device_uc_enabled(xe)) {
> 		hwe->exl_port = xe_execlist_port_create(xe, hwe);
> 		if (IS_ERR(hwe->exl_port)) {
> 			err = PTR_ERR(hwe->exl_port);
>-			goto err_kernel_lrc;
>+			goto err_hwsp;
> 		}
>-	}
>-
>-	if (xe_device_uc_enabled(xe)) {
>+	} else {
> 		/* GSCCS has a special interrupt for reset */
> 		if (hwe->class == XE_ENGINE_CLASS_OTHER)
> 			hwe->irq_handler = xe_gsc_hwe_irq_handler;
>@@ -557,8 +548,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>
> 	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
>
>-err_kernel_lrc:
>-	xe_lrc_put(hwe->kernel_lrc);
> err_hwsp:
> 	xe_bo_unpin_map_no_vm(hwe->hwsp);
> err_name:
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 70e6434f150d..2b74dd1098a7 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -136,8 +136,6 @@ struct xe_hw_engine {
> 	enum xe_force_wake_domains domain;
> 	/** @hwsp: hardware status page buffer object */
> 	struct xe_bo *hwsp;
>-	/** @kernel_lrc: Kernel LRC (should be replaced /w an xe_engine) */
>-	struct xe_lrc *kernel_lrc;
> 	/** @exl_port: execlists port */
> 	struct xe_execlist_port *exl_port;
> 	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
>-- 
>2.34.1
>
