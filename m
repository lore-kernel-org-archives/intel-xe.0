Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB41C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C9710E08B;
	Thu,  1 Jun 2023 15:11:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A4D10E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685632312; x=1717168312;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ucWROKFuESXz4TwEe7Ui1y2RQZevogrLGqkNnO44xsg=;
 b=WCXe8j37iNPeHc/SKOZpEVVguPLe4XvfLHZcWqlgDpHm1u2mbGgYbIa2
 uGhJVq9TqqPiMeozu+WJZEhv/ftI44yoZdFtgwCodCRWrdcdO9N/IxkAn
 y+3teZMn0+fC4itx56KMgId41R10vKhrCk7ft41ugYQ1sJYbyRmc+AvOK
 6stt/NzSY5oLd9lAn4FfH/OD3pmCGRmcMgr6kWej1sfHoiOwZCzMmVKIs
 5yrfkIX5HJavfk9dOFieBZSSKqbGZkGNDLkjqs5WXltcD5kNhUNQtmale
 JciSCxpKwr6od1uyYdgDI+uc25gtHuBFPuAS7sC8tqxjIfwgDosUBoVRL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421394453"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="421394453"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="684882068"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="684882068"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 01 Jun 2023 08:10:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:10:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:10:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NccMuNlEfvAuWZTmjp1gQvTxML/AvciecRd73BeehVY1Wuuf1+I8+b/sbahudAvjqafzI/dL5WEyB4qClEIi+Nwe6A5e+qQvDe0sFiL5Aux0zDmsZ33Vpd7hOhDU2cgRmqHkK1kcTDYkEyXI9mmCHd5C4ozXb5IBuGS9wBOAwkQO4QOHYI7Qy2kCPEMr4w56pNlp8BB09upHc+YeW0umLzvPN0r5m62ei3e1RpUNVjbSshOMkB00qTyrTzHpRWEQnL+Rpz7AZjfElYToMmGcVFdJ2OLY3Bq1QBkJugnrhjTT0TLyltxOZClbb93/7/99zH64SfCTyZYcGXTQT+D+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxuGDSZBp7KdP3daHisnXR0ep6QWqQJpWyGno8R1lUM=;
 b=PG/ugU3w6ce9343gqcFo4FvT8eGBTBd0YFjPNP2Ao8rD0Gq5iz8ljxtDLAfRt9O0aIEmk5KQ8wAeIABPLVuTzJN9J9V1X7fDCcG9tTWoR0KkIK/KJWVAEtbf8BjcJ4LSjU0/gkMW1PI0AbzakuE9C2zOjXA+6cuoNkl7Xm5VD3PjJMXEY3hQUv74RZCOQQcd2apmb85XT+IAog5cTROUhDMxyUlaucTUiZmDnvgT/axUqDlW9ZdrBUR7lcw6dC+sWPCtRxG7A/Er6T5v1GzaiVQvDLNNAY5RAvt7aR0r+zT4vJsYnGJ6BYU9N7q6c2yi5WnklsZBnaaXCsZT+xjS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Thu, 1 Jun 2023 15:10:26 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:10:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601000403.432517-9-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
 <20230601000403.432517-9-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 12:10:21 -0300
Message-ID: <168563222102.3435.13111248101168774235@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: fe99a11a-40ce-4a27-50b9-08db62b25405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zv5eYxYsNwyMJd/s8e9wdHmoR/mMfQhD90Ji3Q8WEu6/oC2N2fYJyvEBoj7qG5zjcoFEajR2V8VezOhxxnLOyPZ0ApVU6X/q1kd+79tz5ugdxCaR1LW9OX/ZVqhj4dt/DXN9PVoZhL+hKVTrOd0qfQCgOPWae6Y+rvm3rzGiSutt5Z2t7VnleShIuwie1l9Qr0puW78pLWk5ahTLB9CEnb+oShTr4NL4XjorGk78hADMiX0n+UI/zJeU/6k6V2SZYOA6yM0Mh5JYYAgcSo9UgIwtZbKcZZkbUwANvx/30Wu8uE3KCMqXOS5Og7435hVKPSVqL1tPA8ELCFQ4c+Ct6qmW96vAWOu4NZZbHmJn+9ngv2GcJ7fSBg9ZNzyeHv4G6d18FkpJ5ANqbGK20i9T7S6QGAqrsE9r7Rd+hFNL3pjn+dcL25gE3mWC+HEyh4jAlvXkRIechOfkmB8eiVbY8yRtqt68KBwaz6kyCNIO+VMelLpSFw3Rpu0n3ty8INxK9OA8MNUcLg8aUaGl8sTqyTzVgJiSV8gHZ2a1+JCWJIloHpd9i06BoYacTyM0dT/S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(8936002)(8676002)(2906002)(66556008)(30864003)(4326008)(66946007)(66476007)(44832011)(316002)(5660300002)(478600001)(41300700001)(6486002)(107886003)(6666004)(9686003)(6506007)(33716001)(6512007)(186003)(26005)(83380400001)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjZrZ2laNmRZaWZCcG44aFk5RDJPdDRNWDFOOVRsU2ViVDIzMlE5NUo3V3Jn?=
 =?utf-8?B?NmtvbjdIMlZYMUFCcW1GM0ZsMTVlTWpMZXN2amxZQUI2TzJ3NVVDR0ZTaVls?=
 =?utf-8?B?K0xvaTBVV0orNW9zcEpkbnZwUGFhZnhMaDRWSWw3S1QvK0E1Y0tJWXppUXJk?=
 =?utf-8?B?UmFQbXdHbGtLeGpZZk5Ob2FzRGZSV2kzS05XRURqOEJBbDcvN1EreGJGWUpl?=
 =?utf-8?B?RURsTml1QVNXS2RoVHpUNVZobExIcFZYNWdJTUpPQnlLQ3NtQ0xoeGZ4Z3ln?=
 =?utf-8?B?WGZvalNPQk1hdGhDLzErQUk0YXhLT3FDM1JzcWxkMTJjelp4SXF1RmxYb3kx?=
 =?utf-8?B?dFRSR2FweUhIaUtqS09qL1hXTldESC9JcjVXRDZDck1RbklnbHE5cFBsc1Iy?=
 =?utf-8?B?MFZIVzZjakN5Nk1wOEtxSDQ4c1lxeTFXVjZaT3BhRGVleW9DVGZBcldJMmpX?=
 =?utf-8?B?UjI1S2RFQVkvZVFvajc3UFFFTFRWZm40cEk0VkVLaFZxdWtiZDlXK1pmOUkx?=
 =?utf-8?B?RTRrZzlsdS9MVHAxZnp6dGhYUkFTM0NTNlF1WFNXcFhRMWtlKzBvRWdITER2?=
 =?utf-8?B?eDlSb21MWVRoZlZVVXVGWE1tTk1IUzBDL04rVFY1N2JMQVd0TjlqNlhVcWs0?=
 =?utf-8?B?MURNc0MrK2FVMWQyVlNEN3lQYVQ1ZTJkVWJtOWE5M3pFbXlGUTA2WU4rQjhQ?=
 =?utf-8?B?MlNiS2ZKYmZrampaaDExSTFueFhKRlV2ZGRzY2g3K3h2aXRMYTZDTFpWaS9F?=
 =?utf-8?B?WmNUMGt0dDZ0NXRrMmdhRmJDNW8rbnl6dURkb2RrOG1nTzVtSjVlNTV1bkZJ?=
 =?utf-8?B?V3dIV2FLT3ZoY0ljOHFjNTJNRDZQb1dtc3pOcFBDYmtZa0U3N0RhWWVabG9n?=
 =?utf-8?B?VUhBaTRCanZFU1JTTjlNWGhFNWZpMFRBL3BRQWRGeHpRaUVwbXhySHlJV2Zl?=
 =?utf-8?B?L1p4N1hENFg5UEowU3NXSkI5eWwrTmdOblFyTzZrM2haVWVDMW51SWRpN1Ar?=
 =?utf-8?B?WFdVWHRNa1ZZS3ZmK0VIcGJQN1pEK3pIYXRmaVc2Zkh0bExDcnRvTVNMYWRW?=
 =?utf-8?B?eGVqVmwvZ3pVZ1dtdzZlbjVSSkVmcENucE1OQTRvTGE1OEI5UUxGNDBqOXFw?=
 =?utf-8?B?U3dNYVY3Y2dIWDJKMEFyODIrKzhPOUFadnVrMjJ6dG9oQzVHMktJaGs1TGIy?=
 =?utf-8?B?YlVURHdscElweW1ESzJROU0vbzBtSGo5R3JaaXJVRjg4UFl5ZTB5MVBuQmRP?=
 =?utf-8?B?N0VNekxpRUFZNWVha2sxdTNDR3RLd1ZUSFZIV3NjSDUvcmJwS2JSN2VxQlNP?=
 =?utf-8?B?OWkzdDh0eE1tbEZoK21jYVhEMXl5VnIvTjdRZXZKYWVkN25adlVLWmliOEFi?=
 =?utf-8?B?ZjZWSHFDeWNhREpPU2djUG9JVHVLbkhnSHNJVUFhNXltc08yYXJ4RVNIcHNs?=
 =?utf-8?B?ZHhtQy8yQjNMZU5NTDNlQTdqZHdnN2FPUm83c1VDWmgwQXNyS0FwY21oRkdk?=
 =?utf-8?B?enZITk1aVHN1dlNEYU9QalpjVFF1allVYnhrSnNQMS8rRjNYdm8yS1htZStj?=
 =?utf-8?B?M1V2V0IzeHlSaGtac2hqTUhzZzc3akJyQk1Pdk1PdEk0TFpzb2YzRXRYMU5L?=
 =?utf-8?B?SGN4ZnhWZWpQRU5XWVBWNmttSktzelErYnVkWG5peCs3QkMxQ0JHeHFxMndt?=
 =?utf-8?B?amc5YVhIN0QxRUNyQ2txTXdzWXFKN3RNaHQ0a2NnSldrdVJYUno0Zll4cFRt?=
 =?utf-8?B?K0YrS2hCckN0TjdrZ2hQS0k3RHRQMU81MTZzZlZ2MTd4WUtmZ0pjS2tRQi9Z?=
 =?utf-8?B?Zy9oTXpNc0JKb3R5aGJXd3o2a1EwTVpLYWhWSnFWRmlaVTVZTXFLVDBaRVJl?=
 =?utf-8?B?VWQ0RlFadzUwU2FkSXMzWmtGbktnSHRDam5LR2lqUWNYYjFQTEF6ai8zM28v?=
 =?utf-8?B?RHlkTXBialA4TGNPaUdwV01LOXZsdWlZYldjaXdaU1BKUjZsOU9oUk9JQ1kz?=
 =?utf-8?B?UjZkc0pmdkR5VEFaZ0Fkc0ZpTEh1R0daVDJhaW1neHh0eGdDT1dMeWl3SW1r?=
 =?utf-8?B?dFRwUlE5T0RMRmswS0hrdXBvUTkxMmM2a3RSUUg5MHlYZk5XbnZFUXhQQldO?=
 =?utf-8?B?bmtHTUxyWnpCMWF6K2hBazBoWkFIY1JFekpMK0RzWWFvSEp5K0Q4Nm02em9k?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe99a11a-40ce-4a27-50b9-08db62b25405
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:10:26.0313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI9y3W+M6xG70oO4qc9aIJFeTbPsQj/bU4f6FhDDCN+P+Kg5CQTVoWXTumiw25p23AYF6Ay3iiojeBi/UlGMrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 08/31] drm/xe: Move GGTT from GT to tile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-31 21:03:40-03:00)
>The GGTT exists at the tile level.  When a tile contains multiple GTs,
>they share the same GGTT.
>
>v2:
> - Include some changes that were mis-squashed into the VRAM patch.
>   (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/Makefile          |  1 +
> drivers/gpu/drm/xe/xe_bo.c           |  6 ++--
> drivers/gpu/drm/xe/xe_bo_evict.c     |  8 +++--
> drivers/gpu/drm/xe/xe_device.c       | 18 +++++++---
> drivers/gpu/drm/xe/xe_device_types.h |  8 +++++
> drivers/gpu/drm/xe/xe_ggtt.c         | 42 +++++++++++-----------
> drivers/gpu/drm/xe/xe_ggtt.h         |  6 ++--
> drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +-
> drivers/gpu/drm/xe/xe_gt.c           | 10 +-----
> drivers/gpu/drm/xe/xe_gt_debugfs.c   |  2 +-
> drivers/gpu/drm/xe/xe_gt_types.h     |  3 --
> drivers/gpu/drm/xe/xe_tile.c         | 52 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tile.h         | 14 ++++++++
> 13 files changed, 125 insertions(+), 47 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_tile.c
> create mode 100644 drivers/gpu/drm/xe/xe_tile.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index da1e447c08c7..f34d4bdd510b 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -97,6 +97,7 @@ xe-y +=3D xe_bb.o \
>         xe_sched_job.o \
>         xe_step.o \
>         xe_sync.o \
>+        xe_tile.o \
>         xe_trace.o \
>         xe_ttm_sys_mgr.o \
>         xe_ttm_stolen_mgr.o \
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 94f3a8ce4b69..09a9c121a84d 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -964,7 +964,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object=
 *ttm_bo)
>         WARN_ON(!list_empty(&bo->vmas));
>=20
>         if (bo->ggtt_node.size)
>-                xe_ggtt_remove_bo(bo->gt->mem.ggtt, bo);
>+                xe_ggtt_remove_bo(gt_to_tile(bo->gt)->mem.ggtt, bo);
>=20
>         if (bo->vm && xe_bo_is_user(bo))
>                 xe_vm_put(bo->vm);
>@@ -1241,10 +1241,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
>                 XE_BUG_ON(!gt);
>=20
>                 if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
>-                        err =3D xe_ggtt_insert_bo_at(gt->mem.ggtt, bo,
>+                        err =3D xe_ggtt_insert_bo_at(gt_to_tile(gt)->mem.=
ggtt, bo,
>                                                    start + bo->size, U64_=
MAX);
>                 } else {
>-                        err =3D xe_ggtt_insert_bo(gt->mem.ggtt, bo);
>+                        err =3D xe_ggtt_insert_bo(gt_to_tile(gt)->mem.ggt=
t, bo);
>                 }
>                 if (err)
>                         goto err_unlock_put_bo;
>diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_e=
vict.c
>index 6642c5f52009..a72963c54bf3 100644
>--- a/drivers/gpu/drm/xe/xe_bo_evict.c
>+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>@@ -149,9 +149,11 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>                 }
>=20
>                 if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
>-                        mutex_lock(&bo->gt->mem.ggtt->lock);
>-                        xe_ggtt_map_bo(bo->gt->mem.ggtt, bo);
>-                        mutex_unlock(&bo->gt->mem.ggtt->lock);
>+                        struct xe_tile *tile =3D gt_to_tile(bo->gt);
>+
>+                        mutex_lock(&tile->mem.ggtt->lock);
>+                        xe_ggtt_map_bo(tile->mem.ggtt, bo);
>+                        mutex_unlock(&tile->mem.ggtt->lock);
>                 }
>=20
>                 /*
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index dd4a4a6e0b94..e86583fbbdce 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -28,6 +28,7 @@
> #include "xe_pcode.h"
> #include "xe_pm.h"
> #include "xe_query.h"
>+#include "xe_tile.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
> #include "xe_vm.h"
>@@ -244,6 +245,7 @@ static void xe_device_sanitize(struct drm_device *drm,=
 void *arg)
>=20
> int xe_device_probe(struct xe_device *xe)
> {
>+        struct xe_tile *tile;
>         struct xe_gt *gt;
>         int err;
>         u8 id;
>@@ -253,8 +255,12 @@ int xe_device_probe(struct xe_device *xe)
>         if (err)
>                 return err;
>=20
>-        for_each_gt(gt, xe, id) {
>-                err =3D xe_gt_alloc(xe, gt);
>+        for_each_tile(tile, xe, id) {
>+                err =3D xe_tile_alloc(tile);
>+                if (err)
>+                        return err;
>+
>+                err =3D xe_gt_alloc(xe, &tile->primary_gt);
>                 if (err)
>                         return err;
>         }
>@@ -289,8 +295,12 @@ int xe_device_probe(struct xe_device *xe)
>=20
>         xe_ttm_sys_mgr_init(xe);
>=20
>-        for_each_gt(gt, xe, id) {
>-                err =3D xe_gt_init_noalloc(gt);
>+        for_each_tile(tile, xe, id) {
>+                err =3D xe_tile_init_noalloc(tile);
>+                if (err)
>+                        goto err_irq_shutdown;
>+
>+                err =3D xe_gt_init_noalloc(&tile->primary_gt);
>                 if (err)
>                         goto err_irq_shutdown;
>         }
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_=
device_types.h
>index 619f40a7e275..d7b809253eb9 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -23,6 +23,8 @@
> #include "intel_display_core.h"
> #endif
>=20
>+struct xe_ggtt;
>+
> #define XE_BO_INVALID_OFFSET        LONG_MAX
>=20
> #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
>@@ -97,6 +99,12 @@ struct xe_tile {
>                 /** @regs: pointer to tile's MMIO space (starting with re=
gisters) */
>                 void *regs;
>         } mmio;
>+
>+        /** @mem: memory management info for tile */
>+        struct {
>+                /** @ggtt: Global graphics translation table */
>+                struct xe_ggtt *ggtt;
>+        } mem;
> };
>=20
> /**
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 3333b2545740..eae20b50497e 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -90,24 +90,19 @@ static void ggtt_fini_noalloc(struct drm_device *drm, =
void *arg)
>         xe_bo_unpin_map_no_vm(ggtt->scratch);
> }
>=20
>-int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>+int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
> {
>-        struct xe_device *xe =3D gt_to_xe(gt);
>-        struct xe_tile *tile =3D gt_to_tile(gt);
>+        struct xe_device *xe =3D tile_to_xe(ggtt->tile);
>         struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>         unsigned int gsm_size;
>=20
>-        XE_BUG_ON(xe_gt_is_media_type(gt));
>-
>-        ggtt->gt =3D gt;
>-
>         gsm_size =3D probe_gsm_size(pdev);
>         if (gsm_size =3D=3D 0) {
>                 drm_err(&xe->drm, "Hardware reported no preallocated GSM\=
n");
>                 return -ENOMEM;
>         }
>=20
>-        ggtt->gsm =3D tile->mmio.regs + SZ_8M;
>+        ggtt->gsm =3D ggtt->tile->mmio.regs + SZ_8M;
>         ggtt->size =3D (gsm_size / 8) * (u64) XE_PAGE_SIZE;
>=20
>         if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>@@ -143,19 +138,20 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *gg=
tt)
>         u64 start, end;
>=20
>         /* Display may have allocated inside ggtt, so be careful with cle=
aring here */
>-        xe_device_mem_access_get(gt_to_xe(ggtt->gt));
>+        xe_device_mem_access_get(tile_to_xe(ggtt->tile));
>         mutex_lock(&ggtt->lock);
>         drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>                 xe_ggtt_clear(ggtt, start, end - start);
>=20
>-        xe_ggtt_invalidate(ggtt->gt);
>+        xe_ggtt_invalidate(ggtt);
>         mutex_unlock(&ggtt->lock);
>-        xe_device_mem_access_put(gt_to_xe(ggtt->gt));
>+        xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> }
>=20
>-int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
>+int xe_ggtt_init(struct xe_ggtt *ggtt)
> {
>-        struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_device *xe =3D tile_to_xe(ggtt->tile);
>+        struct xe_gt *gt =3D &ggtt->tile->primary_gt;
>         unsigned int flags;
>         int err;
>=20
>@@ -195,8 +191,14 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *gg=
tt)
> #define PVC_GUC_TLB_INV_DESC1                        XE_REG(0xcf80)
> #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE        REG_BIT(6)
>=20
>-void xe_ggtt_invalidate(struct xe_gt *gt)
>+void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> {
>+        /*
>+         * TODO: Loop over each GT in tile once media GT support is
>+         * re-added
>+         */
>+        struct xe_gt *gt =3D &ggtt->tile->primary_gt;
>+
>         /* TODO: vfunc for GuC vs. non-GuC */
>=20
>         if (gt->uc.guc.submission_state.enabled) {
>@@ -269,7 +271,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo=
 *bo)
>                 xe_ggtt_set_pte(ggtt, start + offset, pte);
>         }
>=20
>-        xe_ggtt_invalidate(ggtt->gt);
>+        xe_ggtt_invalidate(ggtt);
> }
>=20
> static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>@@ -291,14 +293,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *gg=
tt, struct xe_bo *bo,
>         if (err)
>                 return err;
>=20
>-        xe_device_mem_access_get(gt_to_xe(ggtt->gt));
>+        xe_device_mem_access_get(tile_to_xe(ggtt->tile));
>         mutex_lock(&ggtt->lock);
>         err =3D drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo=
->size,
>                                           alignment, 0, start, end, 0);
>         if (!err)
>                 xe_ggtt_map_bo(ggtt, bo);
>         mutex_unlock(&ggtt->lock);
>-        xe_device_mem_access_put(gt_to_xe(ggtt->gt));
>+        xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>=20
>         return err;
> }
>@@ -316,17 +318,17 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct x=
e_bo *bo)
>=20
> void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> {
>-        xe_device_mem_access_get(gt_to_xe(ggtt->gt));
>+        xe_device_mem_access_get(tile_to_xe(ggtt->tile));
>         mutex_lock(&ggtt->lock);
>=20
>         xe_ggtt_clear(ggtt, node->start, node->size);
>         drm_mm_remove_node(node);
>         node->size =3D 0;
>=20
>-        xe_ggtt_invalidate(ggtt->gt);
>+        xe_ggtt_invalidate(ggtt);
>=20
>         mutex_unlock(&ggtt->lock);
>-        xe_device_mem_access_put(gt_to_xe(ggtt->gt));
>+        xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> }
>=20
> void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>index 333947100504..205a6d058bbd 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt.h
>@@ -12,9 +12,9 @@ struct drm_printer;
>=20
> u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset);
> void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>-void xe_ggtt_invalidate(struct xe_gt *gt);
>-int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt);
>-int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt);
>+void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>+int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt);
>+int xe_ggtt_init(struct xe_ggtt *ggtt);
> void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
>=20
> int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node =
*node,
>diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_gg=
tt_types.h
>index ea70aaef4b31..d34b3e733945 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>@@ -12,7 +12,7 @@ struct xe_bo;
> struct xe_gt;
>=20
> struct xe_ggtt {
>-        struct xe_gt *gt;
>+        struct xe_tile *tile;
>=20
>         u64 size;
>=20
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 18eda5b1377f..0f07f810bb1f 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -67,11 +67,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>         XE_BUG_ON(gt->info.type =3D=3D XE_GT_TYPE_UNINITIALIZED);
>=20
>         if (!xe_gt_is_media_type(gt)) {
>-                gt->mem.ggtt =3D drmm_kzalloc(drm, sizeof(*gt->mem.ggtt),
>-                                            GFP_KERNEL);
>-                if (!gt->mem.ggtt)
>-                        return -ENOMEM;
>-
>                 gt->mem.vram_mgr =3D drmm_kzalloc(drm, sizeof(*gt->mem.vr=
am_mgr),
>                                                 GFP_KERNEL);
>                 if (!gt->mem.vram_mgr)
>@@ -80,7 +75,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>         } else {
>                 struct xe_gt *full_gt =3D xe_find_full_gt(gt);
>=20
>-                gt->mem.ggtt =3D full_gt->mem.ggtt;
>                 gt->mem.vram_mgr =3D full_gt->mem.vram_mgr;
>         }
>=20
>@@ -354,8 +348,6 @@ int xe_gt_init_noalloc(struct xe_gt *gt)
>         if (err)
>                 goto err_force_wake;
>=20
>-        err =3D xe_ggtt_init_noalloc(gt, gt->mem.ggtt);
>-
> err_force_wake:
>         err2 =3D xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>         XE_WARN_ON(err2);
>@@ -376,7 +368,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>         xe_pat_init(gt);
>=20
>         if (!xe_gt_is_media_type(gt)) {
>-                err =3D xe_ggtt_init(gt, gt->mem.ggtt);
>+                err =3D xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>                 if (err)
>                         goto err_force_wake;
>         }
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt=
_debugfs.c
>index 339ecd5fad9b..1114254bc519 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -98,7 +98,7 @@ static int ggtt(struct seq_file *m, void *data)
>         struct xe_gt *gt =3D node_to_gt(m->private);
>         struct drm_printer p =3D drm_seq_file_printer(m);
>=20
>-        return xe_ggtt_dump(gt->mem.ggtt, &p);
>+        return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
> }
>=20
> static int register_save_restore(struct seq_file *m, void *data)
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_t=
ypes.h
>index 81e6ab0c77e0..c06a0b27d6fc 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -14,7 +14,6 @@
> #include "xe_uc_types.h"
>=20
> struct xe_engine_ops;
>-struct xe_ggtt;
> struct xe_migrate;
> struct xe_ring_ops;
> struct xe_ttm_gtt_mgr;
>@@ -176,8 +175,6 @@ struct xe_gt {
>                 } vram;
>                 /** @vram_mgr: VRAM TTM manager */
>                 struct xe_ttm_vram_mgr *vram_mgr;
>-                /** @ggtt: Global graphics translation table */
>-                struct xe_ggtt *ggtt;
>         } mem;
>=20
>         /** @reset: state for GT resets */
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>new file mode 100644
>index 000000000000..7ef594f301ca
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -0,0 +1,52 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright =C2=A9 2023 Intel Corporation
>+ */
>+
>+#include <drm/drm_managed.h>
>+
>+#include "xe_device.h"
>+#include "xe_ggtt.h"
>+#include "xe_tile.h"
>+#include "xe_ttm_vram_mgr.h"
>+
>+/**
>+ * xe_tile_alloc - Perform per-tile memory allocation
>+ * @tile: Tile to perform allocations for
>+ *
>+ * Allocates various per-tile data structures using DRM-managed allocatio=
ns.
>+ * Does not touch the hardware.
>+ *
>+ * Returns -ENOMEM if allocations fail, otherwise 0.
>+ */
>+int xe_tile_alloc(struct xe_tile *tile)
>+{
>+        struct drm_device *drm =3D &tile_to_xe(tile)->drm;
>+
>+        tile->mem.ggtt =3D drmm_kzalloc(drm, sizeof(*tile->mem.ggtt),
>+                                      GFP_KERNEL);
>+        if (!tile->mem.ggtt)
>+                return -ENOMEM;
>+        tile->mem.ggtt->tile =3D tile;
>+
>+        return 0;
>+}
>+
>+/**
>+ * xe_tile_init_noalloc - Init tile up to the point where allocations can=
 happen.
>+ * @tile: The tile to initialize.
>+ *
>+ * This function prepares the tile to allow memory allocations to VRAM, b=
ut is
>+ * not allowed to allocate memory itself. This state is useful for displa=
y
>+ * readout, because the inherited display framebuffer will otherwise be
>+ * overwritten as it is usually put at the start of VRAM.
>+ *
>+ * Note that since this is tile initialization, it should not perform any
>+ * GT-specific operations, and thus does not need to hold GT forcewake.
>+ *
>+ * Returns: 0 on success, negative error code on error.
>+ */
>+int xe_tile_init_noalloc(struct xe_tile *tile)
>+{
>+        return xe_ggtt_init_noalloc(tile->mem.ggtt);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
>new file mode 100644
>index 000000000000..77529ea136a6
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_tile.h
>@@ -0,0 +1,14 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright =C2=A9 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_TILE_H_
>+#define _XE_TILE_H_
>+
>+struct xe_tile;
>+
>+int xe_tile_alloc(struct xe_tile *tile);
>+int xe_tile_init_noalloc(struct xe_tile *tile);
>+
>+#endif
>--=20
>2.40.1
>
