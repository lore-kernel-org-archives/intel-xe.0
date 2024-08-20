Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F860C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 21:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671C110E495;
	Tue, 20 Aug 2024 21:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SD1YAtBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEA010E495
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 21:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724188048; x=1755724048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k3uRniLbOCIGXDahSwJp7N3bHH0j1V8qkJl4s4hB3a0=;
 b=SD1YAtBA/l9GW1IVRIyBgZeo6sePGze26cjxynW7vczxIoz5teF2HDZt
 vlNsaAWtIZ7yZwy0wjF8qTSrDrkMqmCiq2O8/554p0ws+WPRWs6KNBRDl
 rKHFpOx5W7J5wZlG8gqIY7IHCkkcSb3DtPPdLu5o2z4MWRMuEu3izXdIF
 njhtMhA9hDDF1Gxx7daQGSbY4F30k7RWxdqCvOEAOntwbtXkdj7oL6dqU
 5ZhveqqyWz5ssIo6XMdgeCR+jV66S2todMV4IJohmPvNK05zkD8yUUoGo
 wA09hr6/JWOp1mK6vAGTPKQDK8wQeEAPWsciViX/9/gT50PIEzYvRVS2a A==;
X-CSE-ConnectionGUID: bTZaur2ETQmnmfrCNi69nQ==
X-CSE-MsgGUID: MR5VTc1SSpqDu4aRu1pZkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="40030347"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="40030347"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 14:07:27 -0700
X-CSE-ConnectionGUID: zeI2Xtz4S86cio12wz46bQ==
X-CSE-MsgGUID: PAaOkY0/RD20RGeDhCy2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65820697"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 14:07:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:07:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:07:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:07:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIemqBuTwB0+B+9/TS3U1NPauPt3nMJoXExQIK3/zTkBrywKgjtoTKPfzpGsDJvLWb0txlthoxE+baBpkCRxe8jfnQztP90HI2mkZs/f4oRrLHigT2gX+kk1n1PYT8qN3s04LiBcmENEbRLYrzL4CIQF9M3xNNXKX+Vfawl3wP+4ZoIdJab/qJKmwh9N6lD0w93ceAO9Vr1BoT2VBaAKNFV8tduec1BrxN5AwgW7v1JuqTHQ4Bqcy12rujqAEVH4GbVpc3xHn0NCYupKRKdKxxSh/fGAf/R5NE2ERluuY6bTzz5tqpOxZyrAefZGwbVbJ2Y4gi5eq6VV5stiVOOwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJKZBen6oynbyIJfZtbdP6Z2E5nb8FOqZa58Mu6Iav4=;
 b=If0kKNAS1ZMzUjrBkGLQwYjsR6REh0+906XaTEpa5cKgcagmsV8jlgZXzZAp/selQIdrh5vaxlnApF2lHoTh0cS9MHIXOBqmGRlXFZRWcxxv8HTjesSAXuL297gBoz6CcvffekdAeTYILMLTYNZyO5Ly509aQNpCIf4yFD9rC6Wsrx/E589YZckj6JSf9oIuvT4SZIgCiLAVkel9gCl2uyr7QAH5WEn/dOEJmUR6RhJlu8TUpD7J+TqNylATYMKiOTfClmvpxKkue/ZeKxyoaXZZr34JRVk6352MAINnvoF//OfguHZv1/vUEih1RIbzw/yHE0LHUCZ0zfVvnCsPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Tue, 20 Aug
 2024 21:07:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 21:07:24 +0000
Date: Tue, 20 Aug 2024 16:07:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/6] drm/xe: Update xe_sa to use
 xe_managed_bo_create_pin_map
Message-ID: <2clofwr62i3fvrez5f6h3ofcxiwfud5sxqd36wfisfzkh3pvyo@watqqlykxtdh>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
 <20240820172958.1095143-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240820172958.1095143-7-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0329.namprd04.prod.outlook.com
 (2603:10b6:303:82::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 11011c7b-a312-4ccc-1928-08dcc15c1694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eIp24aZ9YmDeu14P1V9YHv4fitEWLX4JwSFPg0LcherH15dsOUsZW/5GD8/A?=
 =?us-ascii?Q?aYxEuukQSQ76ANQhrNXkWjF26J9BVy/K3glv0837UoZnLbwa1kf/iFL955aG?=
 =?us-ascii?Q?f2HbYSxs0qCXONJT+sDK/bFjdNzwtOFMxZ6SetxdIHqkHOv9v9BuDLE2WIeP?=
 =?us-ascii?Q?FfYPZetkwQtAhe1u1ZIZdiAP3kHWUdLJ3ze0ljmpQfaRyarblj0qb6I/EQWY?=
 =?us-ascii?Q?Jto+fwfpNcrJ6L5laLxTqREOBBmMUQzNYVE1wFxd5BYiqJqla+zHn7p+435Y?=
 =?us-ascii?Q?xKOo5x9y+sA3la751a+L/m4GiSklhztdq3Ri7ZNK2O5AkT+dgD1Lm7LiHHrw?=
 =?us-ascii?Q?2wvu9vy1OBvxC9V81m22LCPEszWZi5Be4kWLvK43Xj1AUcrI1vtIjSiqA8pP?=
 =?us-ascii?Q?/j7PPxvXaCq0yI7n0PX4rBV6VeApmZmSJrpmyHjtOcupsnzkxXPdLM4glL3+?=
 =?us-ascii?Q?r0KNKfYASkYG5xAQigvDj4SPOHFiJHzENgLO35LWz+OUlt3aIvDm77JBjqup?=
 =?us-ascii?Q?Et+uKmF0s1Sw3ODNwTCAW0SVKbn75+t8RXNKOhqhq0lr2nNTKDy1do8TFR8q?=
 =?us-ascii?Q?vLQzqYDRT0YxVDhOcqI555iFTy7Wlqa7zniha739fwEmWIydADRVOcLqqgfV?=
 =?us-ascii?Q?JCnYJ0R/1eSR2XEyHiXeBRB/mqah5yqzuoTYwO7KqRFcbl8l4uZChBpwCagk?=
 =?us-ascii?Q?niLu894isCb6Fg8+IAbi0no8a1gvoJ5NughcvAe1B2B0WxxnoM0VPugP7Fpa?=
 =?us-ascii?Q?Oi9/JJKcmMnhVSrHPTB1j2cLgdgMqIhrLQ9oYGZqIWkEZcZ3+cYu261xISnf?=
 =?us-ascii?Q?HtDUsBo9QI1z6DsE7ZPIYCvCbNd+Dt02tFndjjII1pMauqqf9NxwO7IpW196?=
 =?us-ascii?Q?imA3VB9Za/jToOqqrWkouE3EIiQRUDe258k9MZPA++moi2FNEJnKMioo2GFX?=
 =?us-ascii?Q?69jnIdX7nCrWyPtqIm6krdAJE23dchAkd3B7QfL2tGxMlJL3/8irXquT7ZWS?=
 =?us-ascii?Q?Trs2weTNg/jaL00ST2Id6w25YJ8gJkn91B9j+pHZejMjuyKBOAeYHYNEPv7O?=
 =?us-ascii?Q?yZTix6SmmgX/u7plgPsg4haOtpBmHFB6jPprDGsWG6WiNK/TEtIu7n1Roens?=
 =?us-ascii?Q?m3xvYUpMZUcCDIf6Y2uRPFe+VDo1U1f+9E65N6LssZ2htzGRFnv9KC6pCasQ?=
 =?us-ascii?Q?mH2jwSNYuFt5u3W5jy9QTV8HnmnobqPMYYw/JmHfKOqDHFKppLoa8wsPPC2z?=
 =?us-ascii?Q?8qw/jNGwycYPbpOt/V8euMu3rr9fuBOy0sUe48QWfs6CAR4CKAIFhp0klMw5?=
 =?us-ascii?Q?ZXOPMSdqK1gM3+hT1THmd3HnSiu9nMMBId4zDiVYDY5hPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hfh/0iWK36G73JWabh/RKfDIOhsqX2Wg6wl4CDipqEzgs9S8A93cSENRKaXa?=
 =?us-ascii?Q?Lt94lqM4uZeV5IewNnxUpVZcozP97Vbmj5q5vWCkzWNjPvdigHiryl6goisK?=
 =?us-ascii?Q?RYU/MXsymB68B6VTwUBqxdyWDEHdaQpoDVjVAA/Wxdtncw3uo+eTMk+XbGnZ?=
 =?us-ascii?Q?UUdCCenkk4e56WqT851hx8CuPVoHEVYnDXBj0y+kKPkFsR7Zy1k2LSdfaY64?=
 =?us-ascii?Q?Muo9/jP4amvCeAJgK5wahpgbcuv2eEKMAc+80R06qzCDAT30ODYcDw26QUr2?=
 =?us-ascii?Q?zuT73/+Iw0jGtMuO/T3xIL7Cvn8c3l1ZAfS2QmMx047gzwzhLO+0ND76rTf9?=
 =?us-ascii?Q?GNdlotHL/c9KTLwGMIa9A25XOFNQh5KN7+aXUGShYYrIGlA5UrSDq0oZ4qGT?=
 =?us-ascii?Q?wAy+NObU6PQhfZzuC66ZM+4CKC4i9Sc9yxoGeh9qBBncji9SHDFraM9uId3n?=
 =?us-ascii?Q?E8g6iX1ATI6Eij4KDWJfYB6OeapsJpjGNKv0K5NEWz892uc8oACwnaaliZs0?=
 =?us-ascii?Q?bts3L3++r7WJxC5FkVl8MO/f3lfNHnMbWSDcESaaU8rdkDx2MkPNWHfN8pM/?=
 =?us-ascii?Q?y5dgYpirI4MFykfqeeM3PNL4RPeaaCizcHiMwQPn5MI+xCaEvxtW4Dmknzdu?=
 =?us-ascii?Q?e1Gx4CA1l+OwOy248ecT4a7S7yLZH687pW5DUOYko/iK7P0ljKgimjrux8Pw?=
 =?us-ascii?Q?ExzCsyP74Y1gm2mOJ2LAsddYJXGdMDq7Dt2EbjtNLMC4P8sjH8yJD9EguQ3p?=
 =?us-ascii?Q?AhPcgKx4nabPyXmNd532vglgzi0RgmercDpyfQD8FLCapYcs21eyVusqy8Al?=
 =?us-ascii?Q?T0916zJDMy3HxJiIsN9ysvuzA1Y2rvlK9Fpqnn/0bWLHosi4GmGTtJ5/vHSi?=
 =?us-ascii?Q?axUimWYCN4L6LrjvckWVDC6ty/tlZLSOi3/g9rsUDF4hY+S71MK9FTa1gjpF?=
 =?us-ascii?Q?Ouo5P/UbWmSHq/ksFF2l6HxGETyr8BGHp4srdj3CIpv21AWz3HcIhGJnXvJo?=
 =?us-ascii?Q?p9nb3ydmeIBuqVlDnIRRb6ElxrTeKnFpmWZSPRx2bXuwGefKrQ6++vFRigZd?=
 =?us-ascii?Q?3h3UmZW07zgajmM/Dzd8LFLJZ9dVe7tu9AgSdNAArPL0ZaESHlFgYULMQsDd?=
 =?us-ascii?Q?k04F+q72WtMH1MtpwhunwTXJpibWu0ZW1WyB0+GRtiVCTKev1yTVlSRP0FrY?=
 =?us-ascii?Q?jS89Ka9mNAFvm85xzG/sWMmvSwGNNx7klIVYkxJGhLuNQCrvpCScFHwictDl?=
 =?us-ascii?Q?sZJ/62MEp6r1cLNTewt4YktkuERI23WyAdqJ+hH6ZSgK2vtVP7i6lwkn2adU?=
 =?us-ascii?Q?DunfgUXM6+moKbus2V8yDV45v4m4zJ66Pl9XgOAglJxjtz76V7O9d7KC1iot?=
 =?us-ascii?Q?5DHF+coXIkHP8NDsrSucAtbV3FpSQVE2YVGFvFarpo1E1zD+rKLRth5Mw6rV?=
 =?us-ascii?Q?SKIDZZ1Z/c1xK5G6T/pIyJfQ2IfVyL86N/wCaMFq/siNxOH1HvyL4tRC7qeU?=
 =?us-ascii?Q?wfgdmBtKWZCj7RuDfrx/sPPf2UNvWjDJH+dBbXNXgZKX3wqX0cEtCNixfcB3?=
 =?us-ascii?Q?iTUC8+KkJ6vNI3JN1im1bGa3ln3mHdbkZxNKVVMbrBC1YwHOahyqY1Okb9ho?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11011c7b-a312-4ccc-1928-08dcc15c1694
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:07:24.1342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0SsePGaHN4m3ChFghswu5NwJiuToe8RG7ISTGK7oDCWbIxq7liTC14RS/hjqY1peVCFeGEdeI7mcC1w26dQwWE35A1g6aq8ONZS/XoCZcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
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

On Tue, Aug 20, 2024 at 10:29:58AM GMT, Matthew Brost wrote:
>Preferred way to create kernel BOs is xe_managed_bo_create_pin_map, use
>it.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_sa.c       | 13 ++++++-------
> drivers/gpu/drm/xe/xe_sa_types.h |  1 +
> 2 files changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>index f3060979e63f..fe2cb2a96f78 100644
>--- a/drivers/gpu/drm/xe/xe_sa.c
>+++ b/drivers/gpu/drm/xe/xe_sa.c
>@@ -25,10 +25,9 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>
> 	drm_suballoc_manager_fini(&sa_manager->base);
>
>-	if (bo->vmap.is_iomem)
>+	if (sa_manager->is_iomem)
> 		kvfree(sa_manager->cpu_ptr);
>
>-	xe_bo_unpin_map_no_vm(bo);
> 	sa_manager->bo = NULL;
> }
>
>@@ -47,16 +46,17 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>
> 	sa_manager->bo = NULL;
>
>-	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel,
>-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>-				  XE_BO_FLAG_GGTT |
>-				  XE_BO_FLAG_GGTT_INVALIDATE);
>+	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>+					  XE_BO_FLAG_GGTT |
>+					  XE_BO_FLAG_GGTT_INVALIDATE);
> 	if (IS_ERR(bo)) {
> 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
> 			PTR_ERR(bo));
> 		return (struct xe_sa_manager *)bo;
> 	}
> 	sa_manager->bo = bo;
>+	sa_manager->is_iomem = bo->vmap.is_iomem;
>
> 	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
> 	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>@@ -64,7 +64,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
> 	if (bo->vmap.is_iomem) {
> 		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
> 		if (!sa_manager->cpu_ptr) {
>-			xe_bo_unpin_map_no_vm(sa_manager->bo);
> 			sa_manager->bo = NULL;
> 			return ERR_PTR(-ENOMEM);
> 		}
>diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
>index 2ef896aeca1d..2b070ff1292e 100644
>--- a/drivers/gpu/drm/xe/xe_sa_types.h
>+++ b/drivers/gpu/drm/xe/xe_sa_types.h
>@@ -14,6 +14,7 @@ struct xe_sa_manager {
> 	struct xe_bo *bo;
> 	u64 gpu_addr;
> 	void *cpu_ptr;
>+	bool is_iomem;
> };
>
> #endif
>-- 
>2.34.1
>
