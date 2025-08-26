Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76846CA0FF0
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 20:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A0310E298;
	Tue, 26 Aug 2025 20:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ai8G4tFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4574310E298
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 20:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756240948; x=1787776948;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7AKRz5fOGKe/Z2jfb19gyF7h19ZnAuWcmKwEoo+1dx0=;
 b=ai8G4tFrNVPhuNoASOUhXO0NNbVaf6eU/mM6ht+XBT5dn+1H1jMsdJWH
 wbVK/tczplA/lbYw0hrnus1TwSMQAF4oa83ptI7506kCDjyuskNqWVQHc
 HGo6lqglpyGGJUwEmbaYJ72luWrEiVFh4fVP3rLQJB5KGFS3BDkYhhO1A
 PGAtrsIyrcUVkBTE1kDrDLwBXNAkR3eEOUzLzKS2+ypMJnvrv9CTL4HOz
 YmN9AVy3io64rI39nczH1nCYmUaV4PxxUiS7l+BuMKMpxkZW8146olXSq
 JNG3tF4RqUEz5CLXnmUS/U7e6bzb3xhhc/O++eik1w16S9egfVXSUKS5v Q==;
X-CSE-ConnectionGUID: jsp+OSipSAqptipFobChig==
X-CSE-MsgGUID: Bq9GV/vDQ0uIuqVk5mj+bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69589037"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69589037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:42:28 -0700
X-CSE-ConnectionGUID: 1QiB6RbyQ4GkGx0rKeU3ng==
X-CSE-MsgGUID: PLnAZCKmSEuYU/zZej0DIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169280351"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:42:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 13:42:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 13:42:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.89) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 13:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WI7ex55pCgyKcyGbI8MeuDYoYk2mzUo/+qwINIxKJrI///UllYrCV2ZH8tENiaXzJI75QssekilajD7cZSQE4hidlSJ0V+YHFbHjetKFg1qwy7Gj/Pw6P6KlJ9j60vZcVh/1b3QBbkBScdGFJ2Ba/V3y7pZCiyjI6EDcTUVTNddCKoN/tHLrwF3aHjgwCuSqe6KU1JwNJ49KcvWgiGFOOh3F9P0pcW51ljTe2LfYNNfQdAKH439Ax9G825AQ7vWlnt71M8tSx6HtzI0P8naf1GRiajSXPINrGw8Ap6d19FMqLDtG3mfdaETmBc0Ofw+t+8YWUZqCwW9mKWfnqnOjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThST8I/2XmebMk4axYdb/1DXWW0O7PzF7iqRnDcoEi0=;
 b=xAeBMZOm8FhEKnmKf0hLJPn+uzIwCz6a2K0g+Ffmhs9tdukTMEJxypw7HAdpM5+21nnHVMLVhUa5BA9f0iiLuUWRvPx4UJG3acxIDF+bUu7Wknf3s1q7mM+GsZn97PbmxzUpX/77SWyeof0yp5XU6VZshqC4o/dVK12Tb6SxGmp3hBpnJlsjppzVwS1pet7DnI58BFmLVe5lmO8JFOyUz+I8qipo77j84t7F9of8a7bg6qehxVMzRIUrzo7AVtyAm/sOgSD1CIV/vXpzVNe+nYYcLzfztm5YUSNNjlteExFAetTjDQubVkm9yZ2MGeGsLlRnfYwrWLnQx298KSfYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB6800.namprd11.prod.outlook.com (2603:10b6:806:260::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 20:42:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 20:42:25 +0000
Date: Tue, 26 Aug 2025 13:42:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 05/16] drm/xe: Introduce an xe_validation wrapper
 around drm_exec
Message-ID: <aK4cLQqbiDRR52nc@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822094030.3499-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b66371-df3b-4809-69f1-08dde4e11029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0Zv2CeYzMdpHShUcIkJeX/facInLIyAtMECcRSPZL1Z42//9Oh6U08v1T1?=
 =?iso-8859-1?Q?ACcNEs6OywSvY2ZLmFVFESrYloAwaG+KdcthiDWcAdtQhMrkPn/Fdbvl9Y?=
 =?iso-8859-1?Q?pf14KsVqpZLDKAfZCqGiPhZUoOoLbjOP8v5O+m+wiDw830uiGAJhMAEB7J?=
 =?iso-8859-1?Q?zzT//AY8Ygt1QtG3R7QAmr2/cCfoOGj1OgysmMSuGEyCYU+6CyeNfnCdVK?=
 =?iso-8859-1?Q?/6ZnUUs1RbzbEY9GEhdRFdXaftYk4JRyrULJojctueP/cA4PqL4XU0Q98K?=
 =?iso-8859-1?Q?hKQGOa1SUrH/B2g9ACGo9dyRUzL/pKZn8VMBCDkRrKSpNhZCFZukrRAdQI?=
 =?iso-8859-1?Q?YglIb/e8aT7l15tYh3CfquMcbAvVPlRWEO/dyMhgxiLqUX9XfPErx6b0kz?=
 =?iso-8859-1?Q?V3id7wiFbR5LiXmy7VdK4i0MQQwWTYwAoOvdUFiKJtadegYhwZ+OQ5IIyw?=
 =?iso-8859-1?Q?K24gSPDgI/98YR3A6tqjC7t5GdHQDWu+FJCox/w+Mv6FisjM9u24aLMwMb?=
 =?iso-8859-1?Q?+EgfWZ+py9QKqs6YTMPvIoA+ibKb2PB7AcBcytlxcfyJcZHg+hZiWASi0d?=
 =?iso-8859-1?Q?Er8aKiGCf+A+0CUEOUp4UzLbV+1tXrh0zAXq957tQZzlgB4OAB+EjHTCKf?=
 =?iso-8859-1?Q?xJMuvHdYFbuycGBiF/oL03Myah7G2N3Md6vEsxTARYgsS+mPf0xbkyQPZ3?=
 =?iso-8859-1?Q?nlF0rzAjq0nJKwQualocqt3D5W84yw1yHa8RslUruQzH+wola564mAwczn?=
 =?iso-8859-1?Q?QEeiuUBgaM6mESKYLTXzSq2s50IFY4m4w8ablilJKVsyqNXzevS7qEcGHS?=
 =?iso-8859-1?Q?lHxVEoNe6Qgd87dtaLUJpYpGo/QjtOoXKjlwAn9v+ULRzOPso6FnQooz9l?=
 =?iso-8859-1?Q?SKZEcWWBOwTmt6lEHraGhgYLINLgBwsHnQUAbH1m4d2XOqQa0g8gwJYVNp?=
 =?iso-8859-1?Q?n2R5m4kVTScyb8nAkfvA34c3i93y9Ha5ygXJgilczJSsYaKdjNDvJZHnn7?=
 =?iso-8859-1?Q?4PWBt4qwjxmFSOJctsUYF0QS3k0RIoZrmifaljjxrutv1rl/1HMajG+A9L?=
 =?iso-8859-1?Q?JmeFI0LIZEzI2CO+U2e8vHFkjixRM4McheRu0zzK7dPt313Ksasjvitr1j?=
 =?iso-8859-1?Q?GunBEcPHvUwsOZOsYtOHwBUl4RcifJFtVUhX9qKaJt7bmuTHwFuvstBybU?=
 =?iso-8859-1?Q?eSIGGP0TM3bORybWuKd0ZfeRG61elqDKvdXHZLb342KEcmVOcDgfUakV5H?=
 =?iso-8859-1?Q?IBhCsMi32GvTJOKk1WRyfovC5VYS1QH0pLcdD6XEEdLaBOaTy4KABWLoo6?=
 =?iso-8859-1?Q?VQmKQ8bRAWER31hOD3IExnKJcfK4Y6yQbgMCD1L0VmnjSJfY26SHEhjD3o?=
 =?iso-8859-1?Q?h+ScE9hMgZbUO94F/7JE8v3DazTt6VYhmCT9Phg84MKEKm7BUjqyUX27lv?=
 =?iso-8859-1?Q?3TNZ28nKzr6h3ysiElRO/C3SR9DQkRipKYkFO36dsNaCFQfwqRg2kSVer0?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Mq2hsRiwfpUc1EzMfjXQV7MjzuBBkAaAR1LYuT1yoQiwFUQjzQxFCpWVEs?=
 =?iso-8859-1?Q?s3sIwMIPce6DLdQ+tR293pkB4ymRLUf/XrF0FuCHPbT8h6M4hfOlQn6DQc?=
 =?iso-8859-1?Q?yg3TgM9ZkfjV2vjris45QYEInc/sp091ypMPv0h0JutcWm1hESfxeNnwgl?=
 =?iso-8859-1?Q?1m8PvQWpwRK3OK+sQgcC5vdMB2X1+nYH5SijOfLQK+bpmVMzMyayfmN6K9?=
 =?iso-8859-1?Q?2zC9YkDaBOmCMmUwcZCGX7jTlF3cHRjAffhB6NRgRZAB6RL/AfeiFNhc3p?=
 =?iso-8859-1?Q?QxTXWyhGDZiHC/FgeucWEgmzGUOTqcO2a1JHrqADWNDNFRlOfKxiDvCfKf?=
 =?iso-8859-1?Q?X+24dn7b3OKTvGtudJtWYCo7FTXUbOMZ5GymDwFd841TY6RQjYP278aWR0?=
 =?iso-8859-1?Q?kEKtomWFb1Pq7Hu3bLsZi7V3/E6aNuDmwYmByTQc4oSdI6OwASDdZZGaPp?=
 =?iso-8859-1?Q?ECyttHLqE3SN3ESdoaa3j8kzfBGlWSxppPd23TcV8oI3qGC47ofWPmP/Mv?=
 =?iso-8859-1?Q?vOJFVdp6Yeb7vp/GoSyrvvF7soj5H0uskizhuueFhUXCGi1WBHLQ7wMZAb?=
 =?iso-8859-1?Q?Apt5TgC7lNKKFV+fFSd+lHMjIJu8JxENW6IN0pnUVKS/fmRXX+uMvTtiz1?=
 =?iso-8859-1?Q?UIg4bsHUUNSqrsz6X5EjA0X8MDdch9Vnp3WZQIWHYlrHi5nTSkqrq70w8b?=
 =?iso-8859-1?Q?DakUltIzw0dsuTafGsy30slvWsRC0J50w3rp5EGkDxhF3ewDonUSzLE+ek?=
 =?iso-8859-1?Q?fpO5O3X375qy9knWko8S46vFqwQ/By85cwx3pT9aMAJv1FuLypMWgvtxQt?=
 =?iso-8859-1?Q?XTQ2b7uSTYfw7xrwtHfJruXgq21UiqjaCwL8sD70Q5Ah/8kp8rZyZT3+Nl?=
 =?iso-8859-1?Q?KdVIobvs7KAA4CRFVCE9RveZpUsnZpu6WbgpW4AUqBlg4qUHam1kaZl+Uu?=
 =?iso-8859-1?Q?oQJ1CzR37Pi+C2FVDGec38pl0vPAQ4KzgdhLlzoqmpEHARO6Q+deRTJ45A?=
 =?iso-8859-1?Q?vMMZ04nYFao617IobddAL8VaakmKWXd0PSssmZwK0g3X5z2J96QyBtN7GH?=
 =?iso-8859-1?Q?eSCebm9VdTwHpExx/O2PwA44wxa4NxQnUbnhv5psNCnlKZtIJlukLc5q5X?=
 =?iso-8859-1?Q?5IR3wKM1btv8oYEXdC5aiQlrIf3foyigQxcdApVa16UnCMnI1Njm6n7HOX?=
 =?iso-8859-1?Q?eXxbOER4Fbea6aVbbtAPO2i/DJ9CAOXGyUCHFnjvDwcNevV+R0Nh0eDNJU?=
 =?iso-8859-1?Q?xYtIUVvLffIUaDVnSlmZXAYqRk+g+t6arRy4/pJk0p2si/6KSQMepJfEuQ?=
 =?iso-8859-1?Q?BDbO2PRSeKF0JZBLqhk2QFWowK64NhFQTrfsJ43KwTwjKNyWFlyYAHgghv?=
 =?iso-8859-1?Q?PqljzrWA2yxZq1PJVZMxEQYH7KBHfYnOZpKegnC/JFg1UO3T+GivUPJfjv?=
 =?iso-8859-1?Q?vfQ6HjTbEq/BxAhJVqhvn4k8b8H7iyY6PLiOJFUTtxAlI+rhUfN/tpAH8g?=
 =?iso-8859-1?Q?amjDe/Ptrd/DwN6ml2M4bgaQ6AvPrTtWCJbgoX90rXIIquEhUYq6HI0Bf7?=
 =?iso-8859-1?Q?nYolAGiJBMYYi/iYWQn4ygxo1hvVYn+SYmhojQIlF+oPySexE/FHp2JEco?=
 =?iso-8859-1?Q?oPEwymKaX9pSgkOKd42vSRb0nfOg+ZtZ9RGeeUOV5riVi1oKV+asMs8w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b66371-df3b-4809-69f1-08dde4e11029
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 20:42:24.9664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUfRjK5AKJGe8pC9X2uyeSJ3XmjoaH9+VvNNJb6QNCJa4igAbgFQfgy9a0+NmYVR1C1di76MJC6FAYt78uArkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6800
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

On Fri, Aug 22, 2025 at 11:40:19AM +0200, Thomas Hellström wrote:
> Introduce a validation wrapper xe_validation_guard() as a helper
> intended to be used around drm_exec transactions what perform
> validations. Once TTM can handle exhaustive eviction we could
> remove this wrapper or make it mostly a NO-OP unless other
> functionality is added to it.
> 
> Currently the wrapper takes a read lock upon entry and if the
> transaction hits an OOM, all locks are released and the
> transaction is retried with a write-lock. If all other
> validations participate in this scheme, the transaction with
> the write lock will be the only transaction validating and
> should have access to all available non-pinned memory.
> 
> There is currently a problem in that TTM converts -EDEADLOCKS to
> -ENOMEM, and with ww_mutex slowpath error injections, we can hit
> -ENOMEMs without having actually ran out of memory. We abuse
> ww_mutex internals to detect such situations until TTM is fixes
> to not convert the error code. In the meantime, injecting
> ww_mutex slowpath -EDEADLOCKs is a good way to test
> the implementation in the absence of real OOMs.
> 
> Just introduce the wrapper in this commit. It will be hooked up
> to the driver in following commits.
> 
> v2:
> - Mark class_xe_validation conditional so that the loop is
>   skipped on initialization error.
> - Argument sanitation (Matt Brost)
> - Fix conditional execution of xe_validation_ctx_fini()
>   (Matt Brost)
> - Add a no_block mode for upcoming use in the CPU fault handler.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_validation.c | 228 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_validation.h | 122 +++++++++++++++
>  2 files changed, 350 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> index cc0684d24e02..b90fda3dd5f4 100644
> --- a/drivers/gpu/drm/xe/xe_validation.c
> +++ b/drivers/gpu/drm/xe/xe_validation.c
> @@ -5,6 +5,7 @@
>  #include "xe_bo.h"
>  #include <drm/drm_exec.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gpuvm.h>
>  
>  #include "xe_assert.h"
>  #include "xe_validation.h"
> @@ -47,3 +48,230 @@ void xe_validation_assert_exec(const struct xe_device *xe,
>  	}
>  }
>  #endif
> +
> +static int xe_validation_lock(struct xe_validation_ctx *ctx)
> +{
> +	struct xe_validation_device *val = ctx->val;
> +	int ret = 0;
> +
> +	if (ctx->val_flags.interruptible) {
> +		if (ctx->request_exclusive)
> +			ret = down_write_killable(&val->lock);
> +		else
> +			ret = down_read_interruptible(&val->lock);
> +	} else {
> +		if (ctx->request_exclusive)
> +			down_write(&val->lock);
> +		else
> +			down_read(&val->lock);
> +	}
> +
> +	if (!ret) {
> +		ctx->lock_held = true;
> +		ctx->lock_held_exclusive = ctx->request_exclusive;
> +	}
> +
> +	return ret;
> +}
> +
> +static int xe_validation_trylock(struct xe_validation_ctx *ctx)
> +{
> +	struct xe_validation_device *val = ctx->val;
> +	bool locked;
> +
> +	if (ctx->request_exclusive)
> +		locked = down_write_trylock(&val->lock);
> +	else
> +		locked = down_read_trylock(&val->lock);
> +
> +	if (locked) {
> +		ctx->lock_held = true;
> +		ctx->lock_held_exclusive = ctx->request_exclusive;
> +	}
> +
> +	return locked ? 0 : -EWOULDBLOCK;
> +}
> +
> +static void xe_validation_unlock(struct xe_validation_ctx *ctx)
> +{
> +	if (!ctx->lock_held)
> +		return;
> +
> +	if (ctx->lock_held_exclusive)
> +		up_write(&ctx->val->lock);
> +	else
> +		up_read(&ctx->val->lock);
> +
> +	ctx->lock_held = false;
> +}
> +
> +/**
> + * xe_validation_ctx_init() - Initialize an xe_validation_ctx
> + * @ctx: The xe_validation_ctx to initialize.
> + * @val: The xe_validation_device representing the validation domain.
> + * @exec: The struct drm_exec to use for the transaction. May be NULL.
> + * @flags: The flags to use for initialization.
> + *
> + * Initialize and lock a an xe_validation transaction using the validation domain
> + * represented by @val. Also initialize the drm_exec object forwarding parts of
> + * @flags to the drm_exec initialization. The @flags.exclusive flag should
> + * typically be set to false to avoid locking out other validators from the
> + * domain until an OOM is hit. For testing- or final attempt purposes it can,
> + * however, be set to true.
> + *
> + * Return: %0 on success, %-EINTR if interruptible initial locking failed with a
> + * signal pending. If @flags.no_block is set to true, a failed trylock
> + * returns %-EWOULDBLOCK.
> + */
> +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> +			   struct drm_exec *exec, const struct xe_val_flags flags)
> +{
> +	int ret;
> +
> +	ctx->exec = exec;
> +	ctx->val = val;
> +	ctx->lock_held = false;
> +	ctx->lock_held_exclusive = false;
> +	ctx->request_exclusive = flags.exclusive;
> +	ctx->val_flags = flags;
> +	ctx->exec_flags = 0;
> +	ctx->nr = 0;
> +
> +	if (flags.no_block)
> +		ret = xe_validation_trylock(ctx);
> +	else
> +		ret = xe_validation_lock(ctx);
> +	if (ret)
> +		return ret;
> +
> +	if (exec) {
> +		if (flags.interruptible)
> +			ctx->exec_flags |= DRM_EXEC_INTERRUPTIBLE_WAIT;
> +		if (flags.exec_ignore_duplicates)
> +			ctx->exec_flags |= DRM_EXEC_IGNORE_DUPLICATES;
> +		drm_exec_init(exec, ctx->exec_flags, ctx->nr);
> +	}
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +/*
> + * This abuses both drm_exec and ww_mutex internals and should be
> + * replaced by checking for -EDEADLK when we can make TTM
> + * stop converting -EDEADLK to -ENOMEM.
> + * An alternative is to not have exhaustive eviction with
> + * CONFIG_DEBUG_WW_MUTEX_SLOWPATH until that happens.
> + */
> +static bool xe_validation_contention_injected(struct drm_exec *exec)
> +{
> +	return !!exec->ticket.contending_lock;
> +}
> +
> +#else
> +
> +static bool xe_validation_contention_injected(struct drm_exec *exec)
> +{
> +	return false;
> +}
> +
> +#endif
> +
> +static bool __xe_validation_should_retry(struct xe_validation_ctx *ctx, int ret)
> +{
> +	if (ret == -ENOMEM &&
> +	    ((ctx->request_exclusive &&
> +	      xe_validation_contention_injected(ctx->exec)) ||
> +	     !ctx->request_exclusive)) {
> +		ctx->request_exclusive = true;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * xe_validation_exec_lock() - Perform drm_gpuvm_exec_lock within a validation
> + * transaction.
> + * @ctx: An uninitialized xe_validation_ctx.
> + * @vm_exec: An initialized struct vm_exec.
> + * @val: The validation domain.
> + *
> + * The drm_gpuvm_exec_lock() function internally initializes its drm_exec
> + * transaction and therefore doesn't lend itself very well to be using
> + * xe_validation_ctx_init(). Provide a helper that takes an uninitialized
> + * xe_validation_ctx and calls drm_gpuvm_exec_lock() with OOM retry.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
> +			    struct drm_gpuvm_exec *vm_exec,
> +			    struct xe_validation_device *val)
> +{
> +	int ret;
> +
> +	memset(ctx, 0, sizeof(*ctx));
> +	ctx->exec = &vm_exec->exec;
> +	ctx->exec_flags = vm_exec->flags;
> +	ctx->val = val;
> +	if (ctx->exec_flags & DRM_EXEC_INTERRUPTIBLE_WAIT)
> +		ctx->val_flags.interruptible = 1;
> +	if (ctx->exec_flags & DRM_EXEC_IGNORE_DUPLICATES)
> +		ctx->val_flags.exec_ignore_duplicates = 1;
> +retry:
> +	ret = xe_validation_lock(ctx);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_gpuvm_exec_lock(vm_exec);
> +	if (ret) {
> +		xe_validation_unlock(ctx);
> +		if (__xe_validation_should_retry(ctx, ret))
> +			goto retry;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_validation_ctx_fini() - Finalize a validation transaction
> + * @ctx: The Validation transaction to finalize.
> + *
> + * Finalize a validation transaction and its related drm_exec transaction.
> + */
> +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> +{
> +	drm_exec_fini(ctx->exec);
> +	xe_validation_unlock(ctx);
> +}
> +
> +/**
> + * xe_validation_should_retry() - Determine if a validation transaction should retry
> + * @ctx: The validation transaction.
> + * @ret: Pointer to a return value variable.
> + *
> + * Determines whether a validation transaction should retry based on the
> + * internal transaction state and the return value pointed to by @ret.
> + * If a validation should be retried, the transaction is prepared for that,
> + * and the validation locked might be re-locked in exclusive mode, and *@ret
> + * is set to %0. If the re-locking errors, typically due to interruptible
> + * locking with signal pending, *@ret is instead set to -EINTR and the
> + * function returns %false.
> + *
> + * Return: %true if validation should be retried, %false otherwise.
> + */
> +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret)
> +{
> +	if (__xe_validation_should_retry(ctx, *ret)) {
> +		drm_exec_fini(ctx->exec);
> +		*ret = 0;
> +		if (ctx->request_exclusive != ctx->lock_held_exclusive) {
> +			xe_validation_unlock(ctx);
> +			*ret = xe_validation_lock(ctx);
> +		}
> +		drm_exec_init(ctx->exec, ctx->exec_flags, ctx->nr);
> +		return !*ret;
> +	}
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> index db50feacad7a..36860974165e 100644
> --- a/drivers/gpu/drm/xe/xe_validation.h
> +++ b/drivers/gpu/drm/xe/xe_validation.h
> @@ -7,9 +7,11 @@
>  
>  #include <linux/dma-resv.h>
>  #include <linux/types.h>
> +#include <linux/rwsem.h>
>  
>  struct drm_exec;
>  struct drm_gem_object;
> +struct drm_gpuvm_exec;
>  struct xe_device;
>  
>  #ifdef CONFIG_PROVE_LOCKING
> @@ -66,4 +68,124 @@ void xe_validation_assert_exec(const struct xe_device *xe, const struct drm_exec
>  	} while (0)
>  #endif
>  
> +/**
> + * struct xe_validation_device - The domain for exhaustive eviction
> + * @lock: The lock used to exclude other processes from allocating graphics memory
> + *
> + * The struct xe_validation_device represents the domain for which we want to use
> + * exhaustive eviction. The @lock is typically grabbed in read mode for allocations
> + * but when graphics memory allocation fails, it is retried with the write mode held.
> + */
> +struct xe_validation_device {
> +	struct rw_semaphore lock;
> +};
> +
> +/**
> + * struct xe_val_flags - Flags for xe_validation_ctx_init().
> + * @exclusive: Start the validation transaction by locking out all other validators.
> + * @no_block:  Don't block on initialization.
> + * @interruptible: Block interruptible if blocking. Implies initializing the drm_exec
> + * context with the DRM_EXEC_INTERRUPTIBLE_WAIT flag.
> + * @exec_ignore_dupllicates: Initialize the drm_exec context with the
> + * DRM_EXEC_IGNORE_DUPLICATES flag.
> + */
> +struct xe_val_flags {
> +	u32 exclusive :1;
> +	u32 no_block :1;
> +	u32 interruptible :1;
> +	u32 exec_ignore_duplicates :1;
> +};
> +
> +/**
> + * struct xe_validation_ctx - A struct drm_exec subclass with support for
> + * exhaustive eviction
> + * @exec: The drm_exec object base class. Note that we use a pointer instead of
> + * embedding to avoid diamond inheritance.
> + * @val: The exhaustive eviction domain.
> + * @lock_held: Whether The domain lock is currently held.
> + * @lock_held_exclusive: Whether the domain lock is held in exclusive mode.
> + * @request_exclusive: Whether to lock exclusively (write mode) the next time
> + * the domain lock is locked.
> + * @flags: The drm_exec flags used for drm_exec (re-)initialization.
> + * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
> + */
> +struct xe_validation_ctx {
> +	struct drm_exec *exec;
> +	struct xe_validation_device *val;
> +	struct xe_val_flags val_flags;
> +	bool lock_held;
> +	bool lock_held_exclusive;
> +	bool request_exclusive;
> +	u32 exec_flags;
> +	unsigned int nr;
> +};
> +
> +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> +			   struct drm_exec *exec, const struct xe_val_flags flags);
> +
> +int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct drm_gpuvm_exec *vm_exec,
> +			    struct xe_validation_device *val);
> +
> +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
> +
> +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
> +
> +/**
> + * xe_validation_retry_on_oom() - Retry on oom in an xe_validaton transaction
> + * @_ctx: Pointer to the xe_validation_ctx
> + * @_ret: The current error value possibly holding -ENOMEM
> + *
> + * Use this in way similar to drm_exec_retry_on_contention().
> + * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
> + * blocks other transactions and allows exhastive eviction. If the transaction
> + * was already restarted once, Just return the -ENOMEM. May also set
> + * _ret to -EINTR if not retrying and waits are interruptible.
> + * May only be used within a drm_exec_until_all_locked() loop.
> + */
> +#define xe_validation_retry_on_oom(_ctx, _ret)				\
> +	do {								\
> +		if (xe_validation_should_retry(_ctx, _ret))		\
> +			goto *__drm_exec_retry_ptr;			\
> +	} while (0)
> +
> +/**
> + * xe_validation_device_init - Initialize a struct xe_validation_device
> + * @val: The xe_validation_device to init.
> + */
> +static inline void
> +xe_validation_device_init(struct xe_validation_device *val)
> +{
> +	init_rwsem(&val->lock);
> +}
> +
> +/*
> + * Make guard() and scoped_guard() work with xe_validation_ctx
> + * so that we can exit transactions without caring about the
> + * cleanup.
> + */
> +DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> +	     if (_T) xe_validation_ctx_fini(_T);,
> +	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
> +	       _ret ? NULL : _ctx; }),
> +	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
> +	     struct drm_exec *_exec, const struct xe_val_flags _flags, int _ret);
> +static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
> +{return *_T; }
> +#define class_xe_validation_is_conditional true
> +
> +/**
> + * xe_validation_guard() - An auto-cleanup xe_validation_ctx transaction
> + * @_ctx: The xe_validation_ctx.
> + * @_val: The xe_validation_device.
> + * @_exec: The struct drm_exec object
> + * @_flags: Flags for the xe_validation_ctx initialization.
> + * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
> + *
> + * This macro is will initiate a drm_exec transaction with additional support for
> + * exhaustive eviction.
> + */
> +#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
> +	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
> +	drm_exec_until_all_locked(_exec)
> +
>  #endif
> -- 
> 2.50.1
> 
