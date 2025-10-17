Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D8FCCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7D310EC6D;
	Fri, 17 Oct 2025 15:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5OmMkau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D0210EC6D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760716566; x=1792252566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t5fcAkuy9+KJWQaAnHVd133Jd78AO5tpBRWp98O8T/4=;
 b=R5OmMkauZCqLJbYrKsfBMfmqchnD9wUl3DQ00uCkSHMpoZzScjb2T/7g
 fh4G7D1CZ231MJlp7wj7wZPdq4A0vIzFs35k+24tDXj3neciKD8TKNxoO
 89FmOph62M6t4mnbUdhvddZiWoI/x64y9Ga/VWyJ54AfWQ9uz/VfBpwMl
 NGd8YiU97YkqjfWY84CkPnfryuYjfPuWfb+0mHFx8061m7OobZ/+zOXrR
 b7vxJdc1TjJMetLwigOZ2dGOT1c5Yfkm0r7nE1UlXyIAKjtT/v9FbjQ1k
 xMG+mhChkJ7jrLrcnsQxxpg0A/DJBo5j8pKf8XNqE3wHHak8gALDsQ+ra g==;
X-CSE-ConnectionGUID: /0JfDT/bTkuGaMiC3f+SBw==
X-CSE-MsgGUID: uRal/wp+Qv+049uZC8H2Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62833766"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="62833766"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:56:06 -0700
X-CSE-ConnectionGUID: hLHZUgCaR/u9k2DYpXtLEw==
X-CSE-MsgGUID: t1ZjUgr0S0+MwLgf+pfpIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182462781"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:56:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:56:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 08:56:05 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:56:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWyY/5BvQi9texrM9+BaItFekWIKpY739HspUajTi+8rckqgvQ582mJ72r/t6Paz57dJuV9yxPYfw0GURqq/1Bvtofjqise1TlM+8tC4m64eVD7z4Ga/dVJNADCtZIs60OdBykgdxakZNi9UIML9CpZNekMdN6pLivY4lM4FftkReWta7kz/98E01zW/2nn9U5VYu9l+N7OefvzrmaPfIQ30I5IfsiNU+b8+Jf5ZnkpQMBqefusVSXdYu+UExB0lP80fk18PzMt6tgilyHh7QmUL0LAyquKeQIfp8eFnnvRKjtH09DSwGWXHYsmnEbQ6CZePviZCVvJY4m3ZQK/v2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfBZT/evTp763cUSYVLVwoSJMaQ3KiRlfcrKZ5BWihU=;
 b=N9PxCHQJkNk6DXKZXrhdP3jdIHBL/KFVZbqI6z1/JshLg2q8/KEtGwYAn0wp2UaUTEcgCxxRN3l56SYJlJb2PBtiZIdFq+dA2D1waLOSI55CZUhfcAkOLQSLb7JBdPGKLrbXH12aUmfkBHvbmRL7WCuxImzvk5GcoMif9hLzBDfERI6yDhOhNb/ar2o/4u3NsojD1e1e2MBflqf9qSurvSipqNRKnTMmWsSlZtiaeDgk5swb6Tkjjd0yQUZKHgWUsCvXwyAQnJARfoPE0lSyFTrBvh89PPE0hOQuXOWDAhighTYi932uAA2T0tQLT7w5R/EfSRJp9XhJvBmxIy/1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 15:55:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 15:55:57 +0000
Date: Fri, 17 Oct 2025 08:55:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>, "Niranjana
 Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v3 10/24] drm/xe/xe3p: Dump CSMQDEBUG register
Message-ID: <20251017155555.GQ5409@mdroper-desk1.amr.corp.intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-10-3dd173a3097a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251016-xe3p-v3-10-3dd173a3097a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 98adc75d-ebd2-447b-db00-08de0d95a948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P4oipYAR8FhVtaf1EFhOBBKeyhmWNKJ7zoQ/6MQblVJSpyhM0fN/Fo7fgnLS?=
 =?us-ascii?Q?vEtjCiAAbDIvf3xP/VeEvzTU8f1fnGEAJD8181119beipvyGPt83WtgEDspm?=
 =?us-ascii?Q?ignnxqwma7U9hDR0Kb96mnG1NgDOp2TCvoL4m6awCTcNHa9/MxyGxVCSrxiW?=
 =?us-ascii?Q?6OmuZR1Rmy2W6YXKvmxcLz+JX1VJQF9yi2feui4QiipvpFLYpRi1OqfemPFv?=
 =?us-ascii?Q?ZJFy7yO87hYR8BxhWtFIN8iQxKWGWtdqh+HR5+yNdafoQrmF8D1UQupunB7s?=
 =?us-ascii?Q?CCpn5ZJPswtjFymakvDfzGP79pRmTqshza41sfa8Fxxyd3LkKcC+UkfXG9vb?=
 =?us-ascii?Q?6pPKTIN6KxGoXVa94msuLoc4uCNsE4+D47vrolbKVeh+Q4wUXnN2Wgi2CVBK?=
 =?us-ascii?Q?WKtuw+YXb9EXAtMcZd9MSoOLfxKRWK7zSdPtyh+JcQVZiIzAmySJkEI19m1Q?=
 =?us-ascii?Q?mzlDV9orvk3rMTJvUJU2lwC5Yo9VVzJhdmFNOyv4XtIru07e8GaOD1zr6/ZV?=
 =?us-ascii?Q?1VXE1dZl7mkHZUZy3w6JXgKgnZGDhgWO1CPsLqZCzlI3VeHfM9qy8qPg3ubA?=
 =?us-ascii?Q?GwTYrRg+UK0A9QjrtVqmjqYi1Z7ezokLd7+YDycZoNaUcqD8QblS01MlT1dX?=
 =?us-ascii?Q?RXWtOMiv9c5ZF8xCcRq9tF2M0Ep15jVwKXaMtOBw7MxE0uqeR+63J32dceNa?=
 =?us-ascii?Q?yTOBPOEz+AexAf8I3FgGOjG7Al8Ec3gXR0oR86LKqnc39QCgRGJScFGnP53g?=
 =?us-ascii?Q?P7to5e5wgtM9YsfiWfUkIxaw0+leZ0HRs8Yt27HACtQ+1J4lGSZBtquqtkWj?=
 =?us-ascii?Q?sQpZ7MNH4QIvvX9SQXtcMTwWh1oANUHlfDpTuLGIGzeo1Tdb8TiaJy8dsJm0?=
 =?us-ascii?Q?rGFkVK23dlCgt4qM6GjRhgLNGJQNqYj0ZlvdhftyVT3bEPZODbc9bt0edGOM?=
 =?us-ascii?Q?AJYo37f/WSk4xA8e8+vmELrI/NU5jNowpySCg2B5qf4xQlR9R9s8o28znYF8?=
 =?us-ascii?Q?mhZE3ckWy5wlmmxxGpOlPjYKcKepLXyEz0hFQQ/46oHi7PbLAwJABrm8nELU?=
 =?us-ascii?Q?q/FQ9dKPl+txyy7D20Le3neVft/Jf0tksq29yCYPsbGKIyIWFkmGADRjrKwj?=
 =?us-ascii?Q?cY3rhHh7o/Yb2MuSJcRHCrk8SOQ9a2yl8CZIuMQ8FicaIfLtHLUSbgtFaEFt?=
 =?us-ascii?Q?JjS233+t24L0yem8SV3Gh/JLH51gnjm5KruF9V85jfI/jcj1law6LhVqCdNC?=
 =?us-ascii?Q?taJX1rgAah0fde08v+aMxURCTJiLY0uyKhU2Y8yhPMzKdxSQQkKbHAIUUMcc?=
 =?us-ascii?Q?0Wtb4+/McV4et7nI+Kntjf/h1WCLEU/Tm/lUHRX+xcBupXPHRaOUZlp0iWUn?=
 =?us-ascii?Q?RE9QLkyDAU3O8klxIG37p/w5RRs5mq9hNQdvBky2w9DjhJMcjzO4GJBWDTER?=
 =?us-ascii?Q?rhLOZnVyMzCXYmHvXMjRmIUD6liXf9w5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s+iz+pOMutX/uebhiL+KThm9NddcQvACsgXHT4aNmfWwg1LwwQv6x7vkFIMP?=
 =?us-ascii?Q?4fx0E/fWVmtYXF2kZohGc8kXQ6W4siwLOudWjbfDgh+AOpB9WsiJYh4HWs2u?=
 =?us-ascii?Q?Jg2tm5PKIETKcdSom4wgAexUXpkKBBXWc5OeN4CtqADq1oHlGdrtknIg+PoJ?=
 =?us-ascii?Q?AcnQ05mgrcRbYm5JlEUNmHEgAai5BRFfXD0eO+p7/LSAgjkydvssH5AoS9zn?=
 =?us-ascii?Q?Oo9wuLjyhGCRvwNChwS6v9F9zQJZee/dlqKjjh5maRMmmKm4/80nGjEjYNDw?=
 =?us-ascii?Q?jReDD3oe0fOYPtO+sR3k+93vqH+0dPAgOOicbRmIloDG/pXy61RQ0ZivavBY?=
 =?us-ascii?Q?+QUFppncc41W2slz+d6tjTfIyZSYK2Z/yHyGXwOltpAOvdXodERJHQuCRJbH?=
 =?us-ascii?Q?YSrZmViULDc3N8V7ESipHW/cQOMkh+3pboZgpzCEL7PSJXPVDtUZBBW8tCYH?=
 =?us-ascii?Q?HW1vPcIQds3GPE8eoPSp2iHlMeYAkadMu0FQ1UMWNkL5UQ5r6UfeHE5YyFZg?=
 =?us-ascii?Q?fEUYbAN61ikANW1qCWoTAPfS+VX9A1xZ4+S/lO+EFTSb5/UQJQMS9OPPI6jI?=
 =?us-ascii?Q?puhPS61tKUjhrPaYH56EkLBjnSRzNKnKFI0jAOGAiPnbiEhLon9Jw/9Xdfgl?=
 =?us-ascii?Q?XulDUY/GpxhpyPWdseAVrkEd44DKMpjRNYWEH3HOd8fyd+bXqSwuCDBS6Pbo?=
 =?us-ascii?Q?S0/yF1UpQUMsJRDfruUomqrFEsHLEQagz06+bA9Yb6wR9cPOgVy2kHU3hhev?=
 =?us-ascii?Q?dCpaF+rIPh1AYgGo3az1am86QH12s0eyih1pujdO8z9gYmQJcFYkp/AGHSd9?=
 =?us-ascii?Q?1vqFL/FA6MVIPlVL6/rqFIEN/ZTIgSX2AeJmxJQkU05k8uZMa2WwMECxFAbi?=
 =?us-ascii?Q?WRI41BEh/+ZzpGgx8Ro7Ew/LBnj2d6B4ykZpAnOVuYqGxUkaio/3K8WKn34H?=
 =?us-ascii?Q?hxPN+kOM94HRF3Kx45+P35NinhMOufRro2ujCiE1DWYA3u9VFMO7Gkakknhe?=
 =?us-ascii?Q?GKc3VtGL0HQ2jwZNFEGElPlRsRqZDmqurtKzM5R6ZN5OJOn3PnjgTtW6xvXW?=
 =?us-ascii?Q?aK3HoVoF+LGucT6Gf3JeK+Kr/HH+IiCO9VM33Q2ZeRMC7sUjyriQ8FBXYvg4?=
 =?us-ascii?Q?+JTuLzsD2u3IXq/lC1dCk4DECoVSw7+OonnCx/Q6fX5lEE7m0i4jMg2BFHen?=
 =?us-ascii?Q?CupYVn2ChDnOZLNfAmxkUhzuzUriSPlqyVgHekyMKnObLvIkgajvjwrcVe5R?=
 =?us-ascii?Q?o7LRc/z1M74Cdqax7pastP2Vfa3DJwHiFzbEDOaZgfKsqCKxA1DTADiwfKBs?=
 =?us-ascii?Q?3a4khdquVGqTY+AqY7N0xXlu3zjSNRL+soqvaSfBtKLl0qaCAlF+1557GJBO?=
 =?us-ascii?Q?x73YwS2lIixG9Zbz/L1wrBlS/KzaaPRkaauUB44aPPAtzclnRXi1qlyr1xLk?=
 =?us-ascii?Q?gqJ7Yho54VkU1AiYCx7SnCzKt6Spnm4KBD+53Z4DSxlSkbiUF9OOtWVvzUYt?=
 =?us-ascii?Q?YVJldkcnO+L9GZJycs1NbPDJf/Y/XtPRSQULTnK8g2UR+qpFhQxUQtXIsNNf?=
 =?us-ascii?Q?Rw9ZoMfakdQwGvfTgfFJtxotNAKyD48AQg+qbNbrHLUI5spi5z21scZjAWAs?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98adc75d-ebd2-447b-db00-08de0d95a948
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:55:57.7438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9u6cVt9SNai5KjV/lC53eDWLbKYZcyh2zCfWFHquMjjB+ZdkiEoL48e/4dpXk2SOEp3zADh+Io6sk0xHwXmMD21ajw6Bvn4IV0aI+7SG9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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

On Thu, Oct 16, 2025 at 07:26:29PM -0700, Lucas De Marchi wrote:
> From: Wang Xin <x.wang@intel.com>
> 
> The CSMQDEBUG is useful for the development of MQ feature. Start dumping
> the debug register.
> 
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Wang Xin <x.wang@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2:
>  - Extract CSMQDEBUG from other patch dumping multiple register (Matt
>    Roper)
>  - Simplify version check (Matt Roper)
>  - Do not dump CSMQDEBUG for engines that do not support MQ (Matt Roper)
> v3:
>  - Drop desc structs not needed anymore, just use the one for previous
>    platform (Matt Roper)
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 28 +++++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 0c02d0fe55315..68172b0248a6e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -155,6 +155,8 @@
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>  #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  
> +#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
> +
>  #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>  
>  #define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 8d1bfa2cdb151..0c1fbe97b8bf2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -150,6 +150,9 @@ struct __guc_capture_parsed_output {
>  	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
>  	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
>  
> +#define XE3P_BASE_ENGINE_INSTANCE \
> +	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
> +
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
>  	COMMON_XELP_BASE_GLOBAL,
> @@ -196,6 +199,12 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
>  
> +/* Render / Compute Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +	XE3P_BASE_ENGINE_INSTANCE,
> +};
> +
>  /*
>   * Empty list to prevent warnings about unknown class/instance types
>   * as not all class/instance types have entries on all platforms.
> @@ -246,6 +255,21 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
>  	{}
>  };
>  
> + /* List of lists for Xe3p and beyond */
> +static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
> +	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
> +	MAKE_REGLIST(xe_hpg_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(xe3p_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
> +	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
> +	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	{}
> +};
>  static const char * const capture_list_type_names[] = {
>  	"Global",
>  	"Class",
> @@ -293,7 +317,9 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>  static const struct __guc_mmio_reg_descr_group *
>  guc_capture_get_device_reglist(struct xe_device *xe)
>  {
> -	if (GRAPHICS_VERx100(xe) >= 1255)
> +	if (GRAPHICS_VER(xe) >= 35)
> +		return xe3p_lists;
> +	else if (GRAPHICS_VERx100(xe) >= 1255)
>  		return xe_hpg_lists;
>  	else
>  		return xe_lp_lists;
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
