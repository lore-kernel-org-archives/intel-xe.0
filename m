Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E78C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 22:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DE710E913;
	Thu, 26 Jun 2025 22:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRxLs75p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFDD10E913
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 22:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750977156; x=1782513156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zbliubMslnbJ05GZi/RVjKMEELKENqmeNRhipJOMEWM=;
 b=nRxLs75pmKuzPLtwZejKdcJBQg2WdDvFl/DVkBaHOGZ3+XtQJc1/9br2
 0B5zrqe8DqXxxAEevcrAT7Vahq02omMA/4dJ7pEm50mwqMelGrqmsjWzB
 1G4xvWBv36O1+K5qKxm7mw2qZwP457PbRGQ00lfkbjaGaxjht5EMeyJpm
 xDuknWYPIsdUM/oevWHbf+fNKSaA/fBb/ZTg9i5Y7zIim5ZcwlZeJKWdL
 amAWpyBfKn5EE3HR4MslKDMIjCfxPjv7Tt5JxpVyfLCIe2TUzqg36J/5c
 qIAtzS5iWCtagfjpc4AzDN7RV8jotnXE+Q/EZcHjglFMiBaBXid905sE8 g==;
X-CSE-ConnectionGUID: K9nC71MIQrqCB7JvgiT+XA==
X-CSE-MsgGUID: nr7ABXBQRu62JMEpStCOiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63887329"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="63887329"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:32:36 -0700
X-CSE-ConnectionGUID: XRUIjuzsRXemflUZWpBerw==
X-CSE-MsgGUID: QpzoL1FLQDaIDvgerEjD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152039945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 15:32:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:32:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 15:32:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 15:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nb6DU3L9DRL0XsWdclIDgj2Pjb226FCwUoGb0kV1Ct0abNdx/oL7tQPW2HRXYYYdVllGRI0yIopMNwN96ONvPROvM/SKKKGP0VUHb+wjis7kGGhgfkKW0/n073WFWtLdYbvzpdaQFbdtT4bxTYw9Dxiu+ZesM3mLGvCto66wxeYKINbY2H+Ve/+zXagAiLrUy8RFJNlqyrm9u9InzfWpuX7mSlKl6Wr2qEKFagAupAIaZgjImUr1ZGWNn4mgNuRtZzNxxJj3S3T4DImf0viJz55twPzOO4hR85BWexuRFyQ2o5scRf0Ze1YdOf+ci9b8yI6MeJkQCVjnNQnLNia//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFWofzYXusHxWVwF5IWVHwsjIw6+Q1Qb5U25jU58wjs=;
 b=aza+QZq9QkY0yMNBSxU+hg82g4Qq35towY1N9l5oss5Lbyv2MJ+oYcWonL/Ey7ckaKjjR6iOKD5+732fI9viCAgkDzbZHP/+MhHh/lluNQZoMM1ZNf/HOquxvumscV/eWLVjIGumATHEcC6TLb7HFF3NJD5VYZNFK1coVI5wDQ59PlKj5E5hHZoHpE3u7DCrV6uK5Uqc+W6qQk+6k6pkAj73ZbdsrAMQY98JAVI34IRSzFgUHkDvfOMSsKCI5cjQsAWO+Ixey4eA4XT89BJITQ7DOdhdV+PXdON3r7+ZCQV/5KP8cii1nGksBcpgvKd5PoIjAk21Us2KEh7932wvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Thu, 26 Jun
 2025 22:32:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 22:32:29 +0000
Date: Thu, 26 Jun 2025 17:32:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe: Add infrastructure for Device OOB
 workarounds
Message-ID: <amlekrvocqmlgx22venqjqjqwzvsix3swgbrtewxptpcmokxy3@gsquzgm3w77g>
References: <20250625200751.205166-1-matthew.s.atwood@intel.com>
 <20250625200751.205166-3-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625200751.205166-3-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: e697ebcf-706e-4631-197f-08ddb501559e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VPAv+zMCbF4fLgrYdfyRVJJMH5itw1vGk5ZF4cnf7UdLovkq5SWMji0oQRNP?=
 =?us-ascii?Q?wDpKxLPIm7VSbAqA3rLXo0zdONhg8LKqQpYia03rZUc1otoht1I2QdDSVJBh?=
 =?us-ascii?Q?8BNWooENRONJz4cnpINRksXE9QoauinF/JKH5LK98pbQSgQ1F94vKWOB0rGL?=
 =?us-ascii?Q?zhABonUpwln+KIjgK57TV/RttJco6Jk06dHOu6s/GfcDjtB66Tug9kwNz2dd?=
 =?us-ascii?Q?l0d17C+ySQt4go6JuO9JTyHU4YlP2d/E6xSMZ70qKi4pRYJHvmTepdFOVVlb?=
 =?us-ascii?Q?4WVj7n6INF+zLyTq+zGGkwCgFo2v2cg3f8m6WD9KWZGsXQ89aC3eghYHahxu?=
 =?us-ascii?Q?EsDYTp+H6fMv55Qr/QDSSkQHrMZpn7MsKQVI8sML4AIqEs9z6JKPh41MLVkK?=
 =?us-ascii?Q?Wn7Bu9KXrGhp/EwOg99+KzwZXvqX6Ano7WYONflCfFutoCoOy4ufdgJAPfw8?=
 =?us-ascii?Q?KzUdYjVKNN5tiNuhigkVs1wbyoFgn0ILE/YdN1HvtJlUD8wRkYgFP+uMVcyg?=
 =?us-ascii?Q?UqWgGgiqaKX0Z0aPToCk/At5u042R4QYebv8rgYj+Iunj6UVUEdvxCll7AxZ?=
 =?us-ascii?Q?CfxS6/kKFz97pCgvNUa2lyRE4jj9dBbfLeEkpNIdSwcWH/uJbJMbpTtHSy1s?=
 =?us-ascii?Q?cyUwj9WEQeGUGV/4U2EiKgf49aWgdDcg6pzs5NUQoJwDKRVFBudEfW4kCxZL?=
 =?us-ascii?Q?dHsgFT8R11iNGT84auYcr/fgsG8Q62z2gAiUsZfWZA9QKURD7/qVe8aE4Nn6?=
 =?us-ascii?Q?m9MViYnLjfDPx0yK01ClhSLidAQnQEV2od231rhMxBAh+t3GBMdY2yHxxWrQ?=
 =?us-ascii?Q?OxQbbtmL3w79SiULFu+oXWyFkAtusmaVMfPnW836zsbTrV8WlhNXs8S7pz8X?=
 =?us-ascii?Q?jktum+Ibz4fENHYlqQlqw3cR4aeWDVD6QmvcohzUb1xMrCQ3A5xs7dsZGuUD?=
 =?us-ascii?Q?5ui/uGZMW4y3Ng3xiOwW6vD9uiktOBJoRerdzngfGGS36uJ5+u7mZdj/dJ8t?=
 =?us-ascii?Q?dK49lE/176WLeR6SpCzo/FgqgWAzgvl9yGNau0JKwZA2RlDK4zGYN7kezDCI?=
 =?us-ascii?Q?reaf4ZzNR9y19qJ6rUl17U97QaNtM4qfzPAkezlVB48Nvi0Jaormzh+78a/Z?=
 =?us-ascii?Q?uRlYLJNWT10rOac618xFcVOhJQlyoB6FKILMGuAQS8ElNG0KME8gYiMFdHhz?=
 =?us-ascii?Q?C3H3LJCZKuKejnftcjLIibWUWj2ziSD4zKxLcgpPpMvSMGooJYr4PGDMOlvc?=
 =?us-ascii?Q?EIDw4Fq3L4vc8KpeEQkNq1MybYkaL9JXR8J8zBRM6CjKEh52kTEe/5XU5CMb?=
 =?us-ascii?Q?S8SAJYzLjvIaOZMPGHbHEsVSS44DnmNtrdU/377raIz2S6LBKvjRaXhyLeI3?=
 =?us-ascii?Q?KBfrWKzel8/JahvntGQbopq9G4FMvEeLxQ/+EQ0algfqRGSZV9NMGgj4m52a?=
 =?us-ascii?Q?UyLT22j+zmk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B+hLrKu8bcjrTl9YeXrsxWyjDJiT3lFx24NeZ+EgRAOgHXFPOIdGSQzxIVty?=
 =?us-ascii?Q?VA4WjjS4HGesC/kZsP0s7jSWz4bbm8FTmsti2KcB6UzR6Oab/ONdiWFaef8Q?=
 =?us-ascii?Q?tmGk5SiYzMh+WaCjh3c0u0S+TVhYcU7zvyE9rB+Qbqe9qFemZtwR17L3BGEe?=
 =?us-ascii?Q?/2PZ+F0B4Y1/aXuAbyAUdz96R6zgJXUd375fdFarh0eveCZeP33LKan8y/y+?=
 =?us-ascii?Q?+UVZI2p2cpamBHsU4oCqWvsJBIjCEbZnBEsWODkLloRP6N0RljcPZaP09pKt?=
 =?us-ascii?Q?oqratHhSVVJ2pUdWykryp8zw8IHDUrSClPktSU9irHTm4X2P3x94mKJ8dqa2?=
 =?us-ascii?Q?++KlQLRgOZBH1gJX+yU5VptyJlXg87ZZqc2EIHMVtXihCmhsC1WIMLkIQ0Zv?=
 =?us-ascii?Q?JMz+xBw8Z2fBC06DOVd7DdSMuNgPz/ZL2+6/X+FOB8PXflRmqvUrVQhtbGS3?=
 =?us-ascii?Q?ONNY+Gk78svHo5/TvmzQcR1eRy2nA+eDhSVT5GNZ77aPCpUbIPPU3pGQM4re?=
 =?us-ascii?Q?gGpJBFn2qZjk8yRUrhZIbOrnokHVMhklR1kar3DN2iz7Nkgs6bnz5TDKmtaJ?=
 =?us-ascii?Q?egj7m7PrPnYbtMYxmq1V2s6gWRFPxzLUFFwMBJjf2oaLz1UjjdHQFbTN5Qoe?=
 =?us-ascii?Q?GpfL0Bt9gOfB+JtQVvhKYyuOC9UnZMwhmg2Q+dT1Pxlinxy5gs24mREftFcM?=
 =?us-ascii?Q?EP7BrSUjhGH5wiaFnCh70XPpbUhrB6iESgnBD//hyW5j4Ruqt8Llp5xiYMwy?=
 =?us-ascii?Q?giJPgf+gK9eBdvBYOop3PeZjl3exuoZaowrNVZEyTkobrq0cbmLxJEMBBrzP?=
 =?us-ascii?Q?k8Jd+x98i4KWIjlg00UV7VQmftKWQ0d6kKTYucE+8JRmqRaF2xhZpzzCN73I?=
 =?us-ascii?Q?oPn29Tc4R1zqjTgAEUHcsEirnZxMYXvwuv582dZOT9rRrVY3NICleHv4vLhy?=
 =?us-ascii?Q?wKY7qpNKZaX92OSoE+LDB7a2+nYEJR/j+q1WohEdf+KJdfCyirQw7WzeQCcK?=
 =?us-ascii?Q?YGHX+Bny7LzZEBLpxf0VDmbA/21VhWuOD9AEbN2x7M/1cKz6Vg3LzS7mffQI?=
 =?us-ascii?Q?YbYoonykpLzp6gKqxP5eHu4ZNDUeiagniJAFI5LGmqBrr1ZIJrBzRdYOKbp0?=
 =?us-ascii?Q?FM9fELb4G3rFLtNIrfOKtGwMYgmZpN7bDV/E2Danz3UkmuN5z+hSAcY3IYwQ?=
 =?us-ascii?Q?YbsqTXCcm9T1jhhL5J5lY+4oxBfYpwoUuDkHq79A9N6S5eKwofUxYh9Q0nCU?=
 =?us-ascii?Q?1gxbEyJ+lW3BExozJ2MpIYieLr+DaqSqREeK45B4rFbkaBT02y8E2N6S7tb1?=
 =?us-ascii?Q?riwz3tvALVafcqWjQ+FqJzW1d2LJd+Huy0/k7M0EnoxHuzEdLCN1SLV74fNl?=
 =?us-ascii?Q?KNNhXBxWlSozlQhRYoHlij8B3dkChzTPaGYopdGOQ/hAL6lVsLYMfbFjU2xj?=
 =?us-ascii?Q?a4Lh+6zBdSGNWTw61skonxtMe9Y94uFmaqjgtsk2vdWXHMGcYXw8KK3IST0e?=
 =?us-ascii?Q?OwXpuyxY20INubB2wjQ6ZRqVo9cVt990GXf9OHZh3XQA05WXtnrhzswqFOKx?=
 =?us-ascii?Q?Ca7wMojuPPDU0SiCyvNHWbF6FMu22yPcYWajdsBVyjm5M1f0hHvAEgLXSays?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e697ebcf-706e-4631-197f-08ddb501559e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:32:29.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAw7EtIi5s7NHulqUeYIWmQJMF3BaTRVgEEHzKmR2abgXUbGdflr3KsGyIOlUF8EheVx6749D7oQ3krvV7oFiz9VeQAE7CdDDV4E1b2IOrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9107
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

On Wed, Jun 25, 2025 at 01:07:47PM -0700, Matt Atwood wrote:
>Some workarounds need to be able to be applied ahead of any GT
>initialization for example 15015404425. This patch creates XE_DEVICE_WA
>macro, in the same vein as XE_WA. This macro can be used ahead of GT
>initialization, and can be tracked in sysfs. This should alleviate some
>of the complexities that exist in i915.
>
>v2: name change SoC to Device, address style issues
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  9 ++++++
> drivers/gpu/drm/xe/xe_pci.c          |  4 +++
> drivers/gpu/drm/xe/xe_rtp.c          |  5 +++
> drivers/gpu/drm/xe/xe_rtp.h          |  3 +-
> drivers/gpu/drm/xe/xe_rtp_types.h    |  2 ++
> drivers/gpu/drm/xe/xe_wa.c           | 46 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_wa.h           | 18 +++++++++--
> 7 files changed, 83 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 6aca4b1a2824..62f09d2923c3 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -360,6 +360,15 @@ struct xe_device {
> 		u8 skip_pcode:1;
> 	} info;
>
>+	/** @xe_active.oob: bitmap with active OOB workarounds */
>+	unsigned long *oob;
>+	/**
>+	 *  @xe_active.oob_initialized: mark oob as initialized to help
>+	 *  detecting misuse of XE_SOC_WA() - it can only be called on
>+	 *  initialization after SOC OOB WAs have been processed
>+	 */
>+	bool oob_initialized;
>+
> 	/** @survivability: survivability information for device */
> 	struct xe_survivability survivability;
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 824461c31288..a9f708608f3e 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -32,6 +32,7 @@
> #include "xe_step.h"
> #include "xe_survivability_mode.h"
> #include "xe_tile.h"
>+#include "xe_wa.h"
>
> enum toggle_d3cold {
> 	D3COLD_DISABLE,
>@@ -832,6 +833,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	if (err)
> 		return err;
>
>+	xe_device_wa_init(xe);
>+	xe_device_wa_process_oob(xe);

avoid exporting interface. These 2 calls could easily be inside the
xe_device_probe_early()

>+
> 	err = xe_device_probe_early(xe);
> 	/*
> 	 * In Boot Survivability mode, no drm card is exposed and driver
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 29e694bb1219..2a0b0a1a8969 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -196,6 +196,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
> 		*gt = (*hwe)->gt;
> 		*xe = gt_to_xe(*gt);
> 		break;
>+	case XE_RTP_PROCESS_TYPE_DEVICE:
>+		*hwe = NULL;
>+		*gt = NULL;
>+		*xe = ctx->xe;
>+		break;

make this the first to one so it goes from more broader scope to more
targeted scope, i.e. device, gt, engine.

> 	}
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index 4fe736a11c42..ac260feaabef 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -422,7 +422,8 @@ struct xe_reg_sr;
>
> #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
> 	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
>-	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
>+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
>+	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
>
> void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
> 					       unsigned long *active_entries,
>diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>index 1b76b947c706..123579ebf2cf 100644
>--- a/drivers/gpu/drm/xe/xe_rtp_types.h
>+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>@@ -112,12 +112,14 @@ struct xe_rtp_entry {
> enum xe_rtp_process_type {
> 	XE_RTP_PROCESS_TYPE_GT,
> 	XE_RTP_PROCESS_TYPE_ENGINE,
>+	XE_RTP_PROCESS_TYPE_DEVICE,
> };
>
> struct xe_rtp_process_ctx {
> 	union {
> 		struct xe_gt *gt;
> 		struct xe_hw_engine *hwe;
>+		struct xe_device *xe;
> 	};
> 	enum xe_rtp_process_type type;
> 	unsigned long *active_entries;
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index f51218a7a580..2cb2fab20070 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -11,6 +11,7 @@
> #include <linux/fault-inject.h>
>
> #include <generated/xe_wa_oob.h>
>+#include <generated/xe_device_wa_oob.h>
>
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
>@@ -876,6 +877,13 @@ static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>
> static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
>
>+static __maybe_unused const struct xe_rtp_entry device_oob_was[] = {
>+#include <generated/xe_device_wa_oob.c>
>+	{}
>+};
>+
>+static_assert(ARRAY_SIZE(device_oob_was) - 1 == _XE_DEVICE_WA_OOB_COUNT);
>+
> __diag_pop();
>
> /**
>@@ -895,6 +903,39 @@ void xe_wa_process_oob(struct xe_gt *gt)
> 	xe_rtp_process(&ctx, oob_was);
> }
>
>+int xe_device_wa_init(struct xe_device *xe)
>+{
>+	unsigned long *p;
>+
>+	p = drmm_kzalloc(&xe->drm,
>+			 sizeof(xe->oob) * BITS_TO_LONGS(ARRAY_SIZE(device_oob_was)),
>+			 GFP_KERNEL);
>+
>+	if (!p)
>+		return -ENOMEM;
>+
>+	xe->oob = p;

oob is not a good name without "wa" as context, like we have in gt.
Please add wa_active, like in the gt case. This could also be inside
xe_wa.c so we have xe_wa_device_init() / xe_wa_gt_init().

>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_device_wa_process_oob - process OOB workaround table
>+ * @xe: xe device instance process workarounds for
>+ *
>+ * Process OOB workaround table for this platform, marking in @xe the
>+ * workarounds that are active.
>+ */
>+void xe_device_wa_process_oob(struct xe_device *xe)
>+{
>+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
>+
>+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->oob, ARRAY_SIZE(device_oob_was));
>+
>+	xe->oob_initialized = true;
>+	xe_rtp_process(&ctx, device_oob_was);
>+}

ditto, I think the namespace should rather be xe_wa.

>+
> /**
>  * xe_wa_process_gt - process GT workaround table
>  * @gt: GT instance to process workarounds for
>@@ -1000,6 +1041,11 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> 	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
> 		if (oob_was[idx].name)
> 			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
>+
>+	drm_printf(p, "\nDevice OOB Workarounds\n");
>+	for_each_set_bit(idx, gt_to_xe(gt)->oob, ARRAY_SIZE(device_oob_was))
>+		if (device_oob_was[idx].name)
>+			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);
> }
>
> /*
>diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>index 52337405b5bc..09d065e0abb5 100644
>--- a/drivers/gpu/drm/xe/xe_wa.h
>+++ b/drivers/gpu/drm/xe/xe_wa.h
>@@ -14,7 +14,9 @@ struct xe_hw_engine;
> struct xe_tile;
>
> int xe_wa_init(struct xe_gt *gt);
>+int xe_device_wa_init(struct xe_device *xe);
> void xe_wa_process_oob(struct xe_gt *gt);
>+void xe_device_wa_process_oob(struct xe_device *xe);

follow the name below...

void xe_wa_process_device_oob(struct xe *xe);

> void xe_wa_process_gt(struct xe_gt *gt);
> void xe_wa_process_engine(struct xe_hw_engine *hwe);
> void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>@@ -22,14 +24,24 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
> void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>
> /**
>- * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
>- *         other more specific type

while at this let's reword this sentence as it doesn't make much sense.


Lucas De Marchi

>+ * XE_WA - Out-of-band GT workarounds, that don't fit the lifecycle any
>+ *         other more specific type,
>  * @gt__: gt instance
>- * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>+ * @id__: XE_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>  */
> #define XE_WA(gt__, id__) ({						\
> 	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
> 	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
> })
>
>+/**
>+ * XE_DEVICE_WA - Out-of-band Device workarounds, that don't fit the lifecycle any
>+ *         other more specific type
>+ * @xe__: xe_device
>+ * @id__: XE_SOC_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>+ */
>+#define XE_DEVICE_WA(xe__, id__) ({					\
>+	xe_assert(xe__, (xe__)->oob_initialized);			\
>+	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->oob);			\
>+})
> #endif
>-- 
>2.49.0
>
