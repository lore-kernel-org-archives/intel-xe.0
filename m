Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1C8C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E9310E08B;
	Thu,  1 Jun 2023 15:12:37 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FE110E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685632355; x=1717168355;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=7SpaV24PfKhcJ5l1tK/CXxzVXfljtr35GsYXz/FEvOw=;
 b=Yr/gVU2dGP/XfLF3ez0CUaGiUCTcWogCljHidLPLOXpMjcOYhsUh1QOu
 sLqFWfEQYx2T0s/yQEuGy2A76NHiS5I8L1sXT43TfAKJ4FSE9Gqmt8tmD
 9II4KKCp8xzv5GwlRVJuZHq45Yo17DG3wpXZ03OcLcVs6Vl1o6VvOKoP3
 lXMwPVdRmu0fVH7V2fta0J8uWQhKIuAt9SHweoCBAodEgtopQeB9H9Ylm
 wbtnXIooXSme56Iz862pd8XpMOJ82+jDo9PovALZnX1hKvAYIoXm+cwzz
 TbnXAWxwUXjlHzVAlq45LUQn/MGTO6cpBZmyymMtCeydRb15vCmJwRfjn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335938010"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335938010"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777240445"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="777240445"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2023 08:12:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:12:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:12:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:12:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:12:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwsqcBlTTP8aN2yg8dZw82+r7YwfZt8zCbw5SeAKCt7QrgV/oznaDanlttsGR+NvzSsvnOLi1aEU/p7E+0YIRvGetSi9HizMR1uhimwhfYms7yvepm4pD9IT20dmiNfvvKPs89K4BacX+WOhcCx4k3JXCR1CJTi1V0wpoeZrmWpLC34Fo9RtD5Wqt9pGqq/yID0vR7t0xfv4rnUYpGOAdaFKHk1RXKkItUl4oG74xG+4OGU7jfiP3fdH5tT1axHZM5F5cBlEBI0nQUb+dFjhhtdEyiRE6NFuP2DFyIMo0Dx+tpd7ueS5sjoDHFE6qMazsJSGw4HlOixtLkH0QF6+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RkdHrFiygmfSdE5HnPWait4ZTmJdenzRO72Q5JQ5wI=;
 b=Iq++io4cB6+BZvoJNm+ZG8rc10QrtxmIklFwDOYh1hvKaOC+I91I9t5fLQnnv5AqXMAWCqVOfCbJWQ0x4NSpsWXCJ+MOm4hP8xRqiHbBkGPnJXa2+eCXYL8P6i8rceaKOi8rJ96ZhT+el+9VmBiUnR/OgugbzBa/zDw58d1f800eBFUBh3oADeOF1OV9uX+Kvz1skoXiTywadV3rWpyxtvjZ6tp0XSyJX4NYHBQc4cPlMPnT2BssIHGkwp90NKE4plkk22jYp2kR9W5cgsiaugQTlvfnWqfmdc1UyuQTAkQ3+AcrPQnk0ZsD5DyR+SCZS3yN4lBTbmFrO25x/tq6cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Thu, 1 Jun 2023 15:12:30 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:12:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601000403.432517-15-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
 <20230601000403.432517-15-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 12:12:25 -0300
Message-ID: <168563234511.3435.7605479525404435228@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 75810cf4-b6d0-47a7-d2e5-08db62b29e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFL6MOlV22aRaTnF1GWLffSZeS/qICGBmDK4nJwQTLEzkOUU5dE8jq4Xo2TCoMjCvApmxI+6pf0S02AtoIOu6xPyqChW7OzbrTpMGmJ9RaUZ9JELtUvOwET7Ux4NZQ/azaqZ4CrZrWgIIwv8E1SOPkPVmMfkaMYbkk8NHIifAQqAnwhWC4c3Bda7AZCj48swxgWbJC+cjJTAA9ZVpcbFnsd2vjduSqNzjKN90MMBCpbnmaUqZIKlU5ENTQebEZ1/N4eLELarWgpXq1DkKzumhcNdEpodu8fheJIPYtaBWnnROjbBBGX7D5b74d7lZOMsYqRkhQAaU93o8/hdeixvycSNfhH+TW2KKKJ/37MErqKvLQcXAMPmKi2xShhsHF7nAoKICtXJ1cRcwWVTZD2DdJ87ed94b0+sce182jlznsz17lYxk1noGyQdsp2RZl+8oMsdqJ29t0xsz4o+Yz85A3oywCqYmkVZjAidwcai0lsck9El0Km6MzNGU2BkF2M9KECnyBC+jgpjfGnxTUiB6qJko1XRKro0brhHvYLNYFSDqsO/p+YZUGM3KT09J5BI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(8936002)(8676002)(2906002)(66556008)(30864003)(4326008)(66946007)(66476007)(44832011)(316002)(5660300002)(478600001)(41300700001)(6486002)(107886003)(6666004)(9686003)(6506007)(33716001)(6512007)(186003)(26005)(83380400001)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTI4aHhkdVFCY0V3aVFHeE5ycmF1R1p5MDA1SmkvR09qK3JYSnBMb2lVZEhB?=
 =?utf-8?B?RStiMmVvdEpFbW8zalhNN1RRMWJUVGYwRGw4R01DYU5vTXBJa3lrU2Q0K09q?=
 =?utf-8?B?SCt3ZHM0dzlJZzlPSERFTG56elRKdmh2RkNySTlhQ1QzUWNpY1FEdXNrb0pz?=
 =?utf-8?B?MlFWazdvN1RVNkM0c1EyRzdGc2Viakh4ZWRXQkRGTEp6eGgyZ2p1OWxnT1lF?=
 =?utf-8?B?dnZQc2ZBdUhtVXFtb1cvM3VtZDJCRGRKcmM5UzVlekx4RHl2U3Q2SzZ3R3Bl?=
 =?utf-8?B?TWdUMEpHeGh5YUYxdndaOTNHR1BUbHA4aHlaNmNrYW1QcFN0L3RpOTYweVVY?=
 =?utf-8?B?M1ZUMmtocm4yRFpWNGE3cklFNFRNbE0raDlwcnhYbG8vb3lhcnFGWWxnZGNG?=
 =?utf-8?B?S3hYRFhaNkRvemFFNnp2NUxMYmI4UWdTemFkVWMreUZkVVh0YVh0OWQ2QVJQ?=
 =?utf-8?B?bkxtOGZVeDJ3TU52NlpLNXBXMERDOER6ejk1M3BMTmhrQ2FQQ1lSb0xwejhZ?=
 =?utf-8?B?M0pJQ3EvVXZJbC9NeUEycXErVCtuUXc3d1g4SzR0Tkk4eERqKzNPN1ZVSFBM?=
 =?utf-8?B?bGZCUDhKS3ZreC8zdTYzUXdjd2c2K0w1T2FWbUtqbFNVVklvckdyREtCMnZ0?=
 =?utf-8?B?R1VRQ2IzNGxFS0pZZm9ibE1JNEZya1YvSGdkb0JhRXkzai8vc3ZxOGoxUmsy?=
 =?utf-8?B?TGQxSzR0b0Q3L3VyVCtyQmxLeUVRWHM1VnRGaHpJc1NybjFqM3RDcGJvOHpr?=
 =?utf-8?B?Z3U4T0RmcVg3aE9CR014dGtwMlp4QTlLR2VKek9FMm5pa0NubDZLd1M0Szlw?=
 =?utf-8?B?YjlSc05PY09BOVhvMmtkb0E1dlZhWFhLUHFaaVBqd2tyZ3VXMGIxL3BWOHBF?=
 =?utf-8?B?WUFLVkFTcFdTaFdWckVBMUoydWFmYmhUUS9iWkhxOW1YNy91Uy9XNEV0aU9R?=
 =?utf-8?B?bkFKQzFudS9jbmhjbitRMWtGR3VSd1MzbWVMdENwTlpCa0krTWlnYnNnNFVo?=
 =?utf-8?B?aXFUcm9ic1lveGhxKzJFQVlBd2FMbzlTd1FhemVpTUU2Nmhnam5rbllla3dK?=
 =?utf-8?B?NnI4ay8zNmZwekxHRUsyS2lsdTFqVU9DcUs1eGN1Mi9HSDJzd3BJMEZxTGlK?=
 =?utf-8?B?bm5CR1lVK3kwSzljOERkUWxiSUhqOURSRUVOREVNdjRWOW1jVDhpN1NPdDdG?=
 =?utf-8?B?MDF2Zkp5M3Q2bGJqWFB6azUrL1N2bGFTV241Y1p2R0JuWkhBb2hIYnMyZkRQ?=
 =?utf-8?B?OWpGNkM3azMra1RBbExTYmVMOUdLRUk4djFIcHIxem5wUFh4U3hkeG55eksx?=
 =?utf-8?B?bm8yY1lSZkdpTFVGY3RQTTllUGljS3VpSFhseTg4ZC9pTXJpM2xtSThxeGNr?=
 =?utf-8?B?blRyWVFXOTFTQW9wYVFPU0wwWTJFcWRVb2lHd3dzWCtGT3BrbzZFSFV3cWww?=
 =?utf-8?B?QUNrRU0zcHBHL2dNOG9yWmFFRWZEcFA0RU9sdTdObWJ4TzhxN3dpczBrQStr?=
 =?utf-8?B?TjlBSytvdFV1dTdoK2tFcDVlNFZmMCtFL0hNYi8wUWIwSWd3amtUS2ZhaUNw?=
 =?utf-8?B?c084S0hFa1YzQTQ1RzUzQktIYXBVR0JUVzJFMUdjZWpsWCthRWlsTW5HQ1Iv?=
 =?utf-8?B?Wk0wSm4yS1NWT1VranI4S2ZzM0ZzNlppTEhseUV5ZGlVUDhiUytzOThRTDlE?=
 =?utf-8?B?VWFpdlBkeVY2QkIvd1NiWTFMeGN1ZDJrWjhWL1dDR0xtSHJTUUpuTyt5Nzc0?=
 =?utf-8?B?VEZzenFkVnRFMDh4MkhOZERyc0ZQQ1JwV3NBVzkzZkdJVml3ZVpEK0RvVElu?=
 =?utf-8?B?Ry9YbmN4UXRyWndwVzBpako5QUZVUDNRcWt1QzliMTFLVGlycUhhWkQzS1JN?=
 =?utf-8?B?UkVRK251V0thcks4anBBdDF5aHhiWlREYWxtNWFPNThBOHNtYlkyTmdmb3RO?=
 =?utf-8?B?M3U0dWQ5d2dPSXpKZW5vNjVjelZuVXhuNE9SRk8xQTZwVldGUm81cXpQbFUy?=
 =?utf-8?B?YUUyZGVjYm9ralUxM3hnU21mT1I1TEJyQ2xKVlFla25qT0dsd2NuY0xDZ3Bs?=
 =?utf-8?B?MDhDT1hneFpWcFQxYitvSFNPc1plWnVpeHBTTGJ5ZnNOVDFpQ1AybjhmN3Bz?=
 =?utf-8?B?OERJVkltSmF4YU1hbkxERDBiTGRJV2VZSThQV1hDTm5Ha2Jsc2E5Q2hSbzhn?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75810cf4-b6d0-47a7-d2e5-08db62b29e04
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:12:30.2147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3u96fh7mlwSCotVCXZwB8/FLBi+lnl37w2Mop9dvt6I7rVO/UDLAH6MhLiFQyHn0WY4JEG5SRQhrUUxB/DyZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 14/31] drm/xe: Move migration from GT to
 tile
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

Quoting Matt Roper (2023-05-31 21:03:46-03:00)
>Migration primarily focuses on the memory associated with a tile, so it
>makes more sense to track this at the tile level (especially since the
>driver was already skipping migration operations on media GTs).
>
>Note that the blitter engine used to perform the migration always lives
>in the tile's primary GT today.  In theory that could change if media
>GTs ever start including blitter engines in the future, but we can
>extend the design if/when that happens in the future.
>
>v2:
> - Fix kunit test build
> - Kerneldoc parameter name update
>v3:
> - Removed leftover prototype for removed function.  (Gustavo)
> - Remove unrelated / unwanted error handling change.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_bo.c      |  4 +-
> drivers/gpu/drm/xe/tests/xe_migrate.c | 25 ++++++-----
> drivers/gpu/drm/xe/xe_bo.c            |  6 +--
> drivers/gpu/drm/xe/xe_bo_evict.c      | 14 +++---
> drivers/gpu/drm/xe/xe_device_types.h  |  3 ++
> drivers/gpu/drm/xe/xe_engine.c        |  2 +-
> drivers/gpu/drm/xe/xe_gt.c            | 27 +++---------
> drivers/gpu/drm/xe/xe_gt.h            |  3 --
> drivers/gpu/drm/xe/xe_gt_pagefault.c  |  2 +-
> drivers/gpu/drm/xe/xe_gt_types.h      |  3 --
> drivers/gpu/drm/xe/xe_migrate.c       | 61 +++++++++++++--------------
> drivers/gpu/drm/xe/xe_migrate.h       |  4 +-
> drivers/gpu/drm/xe/xe_pt.c            |  4 +-
> drivers/gpu/drm/xe/xe_tile.c          |  6 +++
> drivers/gpu/drm/xe/xe_tile.h          |  2 +
> drivers/gpu/drm/xe/xe_vm.c            |  2 +-
> drivers/gpu/drm/xe/xe_vm_types.h      |  2 +-
> 17 files changed, 79 insertions(+), 91 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/x=
e_bo.c
>index f933e5df6c12..5309204d8d1b 100644
>--- a/drivers/gpu/drm/xe/tests/xe_bo.c
>+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>@@ -35,7 +35,7 @@ static int ccs_test_migrate(struct xe_gt *gt, struct xe_=
bo *bo,
>=20
>         /* Optionally clear bo *and* CCS data in VRAM. */
>         if (clear) {
>-                fence =3D xe_migrate_clear(gt->migrate, bo, bo->ttm.resou=
rce);
>+                fence =3D xe_migrate_clear(gt_to_tile(gt)->migrate, bo, b=
o->ttm.resource);
>                 if (IS_ERR(fence)) {
>                         KUNIT_FAIL(test, "Failed to submit bo clear.\n");
>                         return PTR_ERR(fence);
>@@ -174,7 +174,7 @@ static int evict_test_run_gt(struct xe_device *xe, str=
uct xe_gt *gt, struct kuni
>         struct xe_bo *bo, *external;
>         unsigned int bo_flags =3D XE_BO_CREATE_USER_BIT |
>                 XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
>-        struct xe_vm *vm =3D xe_migrate_get_vm(xe_device_get_root_tile(xe=
)->primary_gt.migrate);
>+        struct xe_vm *vm =3D xe_migrate_get_vm(xe_device_get_root_tile(xe=
)->migrate);
>         struct ww_acquire_ctx ww;
>         int err, i;
>=20
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/te=
sts/xe_migrate.c
>index 85ef9bacfe52..d9f1f31c92d2 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -101,14 +101,14 @@ static const struct xe_migrate_pt_update_ops sanity_=
ops =3D {
> static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>                       struct kunit *test)
> {
>-        struct xe_device *xe =3D gt_to_xe(m->gt);
>+        struct xe_device *xe =3D tile_to_xe(m->tile);
>         u64 retval, expected =3D 0;
>         bool big =3D bo->size >=3D SZ_2M;
>         struct dma_fence *fence;
>         const char *str =3D big ? "Copying big bo" : "Copying small bo";
>         int err;
>=20
>-        struct xe_bo *sysmem =3D xe_bo_create_locked(xe, gt_to_tile(m->gt=
), NULL,
>+        struct xe_bo *sysmem =3D xe_bo_create_locked(xe, m->tile, NULL,
>                                                    bo->size,
>                                                    ttm_bo_type_kernel,
>                                                    XE_BO_CREATE_SYSTEM_BI=
T);
>@@ -189,7 +189,7 @@ static void test_copy(struct xe_migrate *m, struct xe_=
bo *bo,
> static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
>                            struct kunit *test, bool force_gpu)
> {
>-        struct xe_device *xe =3D gt_to_xe(m->gt);
>+        struct xe_device *xe =3D tile_to_xe(m->tile);
>         struct dma_fence *fence;
>         u64 retval, expected;
>         ktime_t then, now;
>@@ -239,16 +239,15 @@ static void test_pt_update(struct xe_migrate *m, str=
uct xe_bo *pt,
>=20
> static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *te=
st)
> {
>-        struct xe_gt *gt =3D m->gt;
>-        struct xe_tile *tile =3D gt_to_tile(m->gt);
>-        struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_tile *tile =3D m->tile;
>+        struct xe_device *xe =3D tile_to_xe(tile);
>         struct xe_bo *pt, *bo =3D m->pt_bo, *big, *tiny;
>         struct xe_res_cursor src_it;
>         struct dma_fence *fence;
>         u64 retval, expected;
>         struct xe_bb *bb;
>         int err;
>-        u8 id =3D gt->info.id;
>+        u8 id =3D tile->id;
>=20
>         err =3D xe_bo_vmap(bo);
>         if (err) {
>@@ -287,7 +286,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *=
m, struct kunit *test)
>                 goto free_pt;
>         }
>=20
>-        bb =3D xe_bb_new(gt, 32, xe->info.supports_usm);
>+        bb =3D xe_bb_new(&tile->primary_gt, 32, xe->info.supports_usm);
>         if (IS_ERR(bb)) {
>                 KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
>                            PTR_ERR(bb));
>@@ -324,7 +323,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *=
m, struct kunit *test)
>         xe_map_wr(xe, &pt->vmap, 0, u32, 0xdeaddead);
>         expected =3D 0;
>=20
>-        emit_clear(m->gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), =
4, 4,
>+        emit_clear(&tile->primary_gt, bb, xe_migrate_vm_addr(NUM_KERNEL_P=
DE - 1, 0), 4, 4,
>                    IS_DGFX(xe));
>         run_sanity_job(m, xe, bb, 1, "Writing to our newly mapped pagetab=
le",
>                        test);
>@@ -391,14 +390,14 @@ static void xe_migrate_sanity_test(struct xe_migrate=
 *m, struct kunit *test)
> static int migrate_test_run_device(struct xe_device *xe)
> {
>         struct kunit *test =3D xe_cur_kunit();
>-        struct xe_gt *gt;
>+        struct xe_tile *tile;
>         int id;
>=20
>-        for_each_gt(gt, xe, id) {
>-                struct xe_migrate *m =3D gt->migrate;
>+        for_each_tile(tile, xe, id) {
>+                struct xe_migrate *m =3D tile->migrate;
>                 struct ww_acquire_ctx ww;
>=20
>-                kunit_info(test, "Testing gt id %d.\n", id);
>+                kunit_info(test, "Testing tile id %d.\n", id);
>                 xe_vm_lock(m->eng->vm, &ww, 0, true);
>                 xe_device_mem_access_get(xe);
>                 xe_migrate_sanity_test(m, test);
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 311fd83f1929..b94a80a32d86 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -643,7 +643,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo=
, bool evict,
>                 tile =3D mem_type_to_tile(xe, old_mem->mem_type);
>=20
>         XE_BUG_ON(!tile);
>-        XE_BUG_ON(!tile->primary_gt.migrate);
>+        XE_BUG_ON(!tile->migrate);
>=20
>         trace_xe_bo_move(bo);
>         xe_device_mem_access_get(xe);
>@@ -681,9 +681,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo=
, bool evict,
>                 }
>         } else {
>                 if (move_lacks_source)
>-                        fence =3D xe_migrate_clear(tile->primary_gt.migra=
te, bo, new_mem);
>+                        fence =3D xe_migrate_clear(tile->migrate, bo, new=
_mem);
>                 else
>-                        fence =3D xe_migrate_copy(tile->primary_gt.migrat=
e,
>+                        fence =3D xe_migrate_copy(tile->migrate,
>                                                 bo, bo, old_mem, new_mem)=
;
>                 if (IS_ERR(fence)) {
>                         ret =3D PTR_ERR(fence);
>diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_e=
vict.c
>index 9226195bd560..f559a7f3eb3e 100644
>--- a/drivers/gpu/drm/xe/xe_bo_evict.c
>+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>@@ -8,7 +8,7 @@
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_ggtt.h"
>-#include "xe_gt.h"
>+#include "xe_tile.h"
>=20
> /**
>  * xe_bo_evict_all - evict all BOs from VRAM
>@@ -29,7 +29,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>         struct ttm_device *bdev =3D &xe->ttm;
>         struct ww_acquire_ctx ww;
>         struct xe_bo *bo;
>-        struct xe_gt *gt;
>+        struct xe_tile *tile;
>         struct list_head still_in_list;
>         u32 mem_type;
>         u8 id;
>@@ -83,8 +83,8 @@ int xe_bo_evict_all(struct xe_device *xe)
>          * Wait for all user BO to be evicted as those evictions depend o=
n the
>          * memory moved below.
>          */
>-        for_each_gt(gt, xe, id)
>-                xe_gt_migrate_wait(gt);
>+        for_each_tile(tile, xe, id)
>+                xe_tile_migrate_wait(tile);
>=20
>         spin_lock(&xe->pinned.lock);
>         for (;;) {
>@@ -186,7 +186,7 @@ int xe_bo_restore_user(struct xe_device *xe)
> {
>         struct ww_acquire_ctx ww;
>         struct xe_bo *bo;
>-        struct xe_gt *gt;
>+        struct xe_tile *tile;
>         struct list_head still_in_list;
>         u8 id;
>         int ret;
>@@ -224,8 +224,8 @@ int xe_bo_restore_user(struct xe_device *xe)
>         spin_unlock(&xe->pinned.lock);
>=20
>         /* Wait for validate to complete */
>-        for_each_gt(gt, xe, id)
>-                xe_gt_migrate_wait(gt);
>+        for_each_tile(tile, xe, id)
>+                xe_tile_migrate_wait(tile);
>=20
>         return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_=
device_types.h
>index f25165c2e983..11042e565208 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -142,6 +142,9 @@ struct xe_tile {
>                  */
>                 struct xe_sa_manager *kernel_bb_pool;
>         } mem;
>+
>+        /** @migrate: Migration helper for vram blits and clearing */
>+        struct xe_migrate *migrate;
> };
>=20
> /**
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine=
.c
>index 1a9082db8f1b..b3036c4a8ec3 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -560,7 +560,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, voi=
d *data,
>                         if (XE_IOCTL_ERR(xe, !hwe))
>                                 return -EINVAL;
>=20
>-                        migrate_vm =3D xe_migrate_get_vm(gt->migrate);
>+                        migrate_vm =3D xe_migrate_get_vm(gt_to_tile(gt)->=
migrate);
>                         new =3D xe_engine_create(xe, migrate_vm, logical_=
mask,
>                                                args->width, hwe,
>                                                ENGINE_FLAG_PERSISTENT |
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 74023a5dc8b2..aa047db4c937 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -43,15 +43,6 @@
> #include "xe_wa.h"
> #include "xe_wopcm.h"
>=20
>-struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
>-{
>-        /*
>-         * FIXME: Once the code is prepared for re-enabling, this functio=
n will
>-         * be gone. Just return the only possible gt for now.
>-         */
>-        return gt;
>-}
>-
> int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
> {
>         XE_BUG_ON(gt->info.type =3D=3D XE_GT_TYPE_UNINITIALIZED);
>@@ -169,6 +160,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_eng=
ine *e)
> int xe_gt_record_default_lrcs(struct xe_gt *gt)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_tile *tile =3D gt_to_tile(gt);
>         struct xe_hw_engine *hwe;
>         enum xe_hw_engine_id id;
>         int err =3D 0;
>@@ -192,7 +184,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>                 if (!default_lrc)
>                         return -ENOMEM;
>=20
>-                vm =3D xe_migrate_get_vm(gt->migrate);
>+                vm =3D xe_migrate_get_vm(tile->migrate);
>                 e =3D xe_engine_create(xe, vm, BIT(hwe->logical_instance)=
, 1,
>                                      hwe, ENGINE_FLAG_WA);
>                 if (IS_ERR(e)) {
>@@ -383,13 +375,13 @@ static int all_fw_domain_init(struct xe_gt *gt)
>         }
>=20
>         if (!xe_gt_is_media_type(gt)) {
>-                gt->migrate =3D xe_migrate_init(gt);
>-                if (IS_ERR(gt->migrate)) {
>-                        err =3D PTR_ERR(gt->migrate);
>+                struct xe_tile *tile =3D gt_to_tile(gt);
>+
>+                tile->migrate =3D xe_migrate_init(tile);
>+                if (IS_ERR(tile->migrate)) {
>+                        err =3D PTR_ERR(tile->migrate);
>                         goto err_force_wake;
>                 }
>-        } else {
>-                gt->migrate =3D xe_find_full_gt(gt)->migrate;
>         }
>=20
>         err =3D xe_uc_init_hw(&gt->uc);
>@@ -644,11 +636,6 @@ int xe_gt_resume(struct xe_gt *gt)
>         return err;
> }
>=20
>-void xe_gt_migrate_wait(struct xe_gt *gt)
>-{
>-        xe_migrate_wait(gt->migrate);
>-}
>-
> struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>                                      enum xe_engine_class class,
>                                      u16 instance, bool logical)
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 27e913e9a43a..01c1d226faeb 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -24,11 +24,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
> int xe_gt_suspend(struct xe_gt *gt);
> int xe_gt_resume(struct xe_gt *gt);
> void xe_gt_reset_async(struct xe_gt *gt);
>-void xe_gt_migrate_wait(struct xe_gt *gt);
> void xe_gt_sanitize(struct xe_gt *gt);
>=20
>-struct xe_gt *xe_find_full_gt(struct xe_gt *gt);
>-
> /**
>  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and ret=
urn the
>  * first that matches the same reset domain as @class
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_=
gt_pagefault.c
>index 1c2b23ae89cf..73db7f7c0381 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -208,7 +208,7 @@ static int handle_pagefault(struct xe_gt *gt, struct p=
agefault *pf)
>=20
>         /* Bind VMA only to the GT that has faulted */
>         trace_xe_vma_pf_bind(vma);
>-        fence =3D __xe_pt_bind_vma(tile, vma, xe_gt_migrate_engine(gt), N=
ULL, 0,
>+        fence =3D __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile=
), NULL, 0,
>                                  vma->tile_present & BIT(tile->id));
>         if (IS_ERR(fence)) {
>                 ret =3D PTR_ERR(fence);
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_t=
ypes.h
>index c44560b6dc71..34d5dd98885e 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -278,9 +278,6 @@ struct xe_gt {
>         /** @hw_engines: hardware engines on the GT */
>         struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
>=20
>-        /** @migrate: Migration helper for vram blits and clearing */
>-        struct xe_migrate *migrate;
>-
>         /** @pcode: GT's PCODE */
>         struct {
>                 /** @lock: protecting GT's PCODE mailbox data */
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migra=
te.c
>index 9de7bdeee85c..ca6f3e6c2e9e 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -36,8 +36,8 @@
> struct xe_migrate {
>         /** @eng: Default engine used for migration */
>         struct xe_engine *eng;
>-        /** @gt: Backpointer to the gt this struct xe_migrate belongs to.=
 */
>-        struct xe_gt *gt;
>+        /** @tile: Backpointer to the tile this struct xe_migrate belongs=
 to. */
>+        struct xe_tile *tile;
>         /** @job_mutex: Timeline mutex for @eng. */
>         struct mutex job_mutex;
>         /** @pt_bo: Page-table buffer object. */
>@@ -70,17 +70,17 @@ struct xe_migrate {
> #define NUM_PT_PER_BLIT (MAX_PREEMPTDISABLE_TRANSFER / SZ_2M)
>=20
> /**
>- * xe_gt_migrate_engine() - Get this gt's migrate engine.
>- * @gt: The gt.
>+ * xe_tile_migrate_engine() - Get this tile's migrate engine.
>+ * @tile: The tile.
>  *
>- * Returns the default migrate engine of this gt.
>+ * Returns the default migrate engine of this tile.
>  * TODO: Perhaps this function is slightly misplaced, and even unneeded?
>  *
>  * Return: The default migrate engine
>  */
>-struct xe_engine *xe_gt_migrate_engine(struct xe_gt *gt)
>+struct xe_engine *xe_tile_migrate_engine(struct xe_tile *tile)
> {
>-        return gt->migrate->eng;
>+        return tile->migrate->eng;
> }
>=20
> static void xe_migrate_fini(struct drm_device *dev, void *arg)
>@@ -128,8 +128,7 @@ static u64 xe_migrate_vram_ofs(u64 addr)
>  */
> static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_v=
m *vm)
> {
>-        struct xe_gt *gt =3D m->gt;
>-        struct xe_tile *tile =3D gt_to_tile(gt);
>+        struct xe_tile *tile =3D m->tile;
>         struct xe_device *xe =3D vm->xe;
>         size_t cleared_size;
>         u64 vram_addr;
>@@ -155,14 +154,13 @@ static int xe_migrate_create_cleared_bo(struct xe_mi=
grate *m, struct xe_vm *vm)
>         return 0;
> }
>=20
>-static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>+static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate =
*m,
>                                  struct xe_vm *vm)
> {
>-        u8 id =3D gt->info.id;
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        u8 id =3D tile->id;
>         u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]->=
level;
>         u32 map_ofs, level, i;
>-        struct xe_device *xe =3D gt_to_xe(m->gt);
>-        struct xe_tile *tile =3D gt_to_tile(m->gt);
>         struct xe_bo *bo, *batch =3D tile->mem.kernel_bb_pool->bo;
>         u64 entry;
>         int ret;
>@@ -231,7 +229,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, str=
uct xe_migrate *m,
>                 m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr);
>=20
>                 if (xe->info.supports_usm) {
>-                        batch =3D gt->usm.bb_pool->bo;
>+                        batch =3D tile->primary_gt.usm.bb_pool->bo;
>                         batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE,
>                                                 &is_vram);
>                         m->usm_batch_base_ofs =3D xe_migrate_vram_ofs(bat=
ch_addr);
>@@ -308,34 +306,33 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, s=
truct xe_migrate *m,
>=20
> /**
>  * xe_migrate_init() - Initialize a migrate context
>- * @gt: Back-pointer to the gt we're initializing for.
>+ * @tile: Back-pointer to the tile we're initializing for.
>  *
>  * Return: Pointer to a migrate context on success. Error pointer on erro=
r.
>  */
>-struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
>+struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> {
>-        struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        struct xe_gt *primary_gt =3D &tile->primary_gt;
>         struct xe_migrate *m;
>         struct xe_vm *vm;
>         struct ww_acquire_ctx ww;
>         int err;
>=20
>-        XE_BUG_ON(xe_gt_is_media_type(gt));
>-
>         m =3D drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
>         if (!m)
>                 return ERR_PTR(-ENOMEM);
>=20
>-        m->gt =3D gt;
>+        m->tile =3D tile;
>=20
>         /* Special layout, prepared below.. */
>         vm =3D xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
>-                          XE_VM_FLAG_SET_GT_ID(gt));
>+                          XE_VM_FLAG_SET_TILE_ID(tile));
>         if (IS_ERR(vm))
>                 return ERR_CAST(vm);
>=20
>         xe_vm_lock(vm, &ww, 0, false);
>-        err =3D xe_migrate_prepare_vm(gt, m, vm);
>+        err =3D xe_migrate_prepare_vm(tile, m, vm);
>         xe_vm_unlock(vm, &ww);
>         if (err) {
>                 xe_vm_close_and_put(vm);
>@@ -343,9 +340,9 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
>         }
>=20
>         if (xe->info.supports_usm) {
>-                struct xe_hw_engine *hwe =3D xe_gt_hw_engine(gt,
>+                struct xe_hw_engine *hwe =3D xe_gt_hw_engine(primary_gt,
>                                                            XE_ENGINE_CLAS=
S_COPY,
>-                                                           gt->usm.reserv=
ed_bcs_instance,
>+                                                           primary_gt->us=
m.reserved_bcs_instance,
>                                                            false);
>                 if (!hwe)
>                         return ERR_PTR(-EINVAL);
>@@ -354,7 +351,7 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
>                                           BIT(hwe->logical_instance), 1,
>                                           hwe, ENGINE_FLAG_KERNEL);
>         } else {
>-                m->eng =3D xe_engine_create_class(xe, gt, vm,
>+                m->eng =3D xe_engine_create_class(xe, primary_gt, vm,
>                                                 XE_ENGINE_CLASS_COPY,
>                                                 ENGINE_FLAG_KERNEL);
>         }
>@@ -549,7 +546,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>                                u64 dst_ofs, bool dst_is_vram, u32 dst_siz=
e,
>                                u64 ccs_ofs, bool copy_ccs)
> {
>-        struct xe_gt *gt =3D m->gt;
>+        struct xe_gt *gt =3D &m->tile->primary_gt;
>         u32 flush_flags =3D 0;
>=20
>         if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_v=
ram) {
>@@ -613,7 +610,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m=
,
>                                   struct ttm_resource *src,
>                                   struct ttm_resource *dst)
> {
>-        struct xe_gt *gt =3D m->gt;
>+        struct xe_gt *gt =3D &m->tile->primary_gt;
>         struct xe_device *xe =3D gt_to_xe(gt);
>         struct dma_fence *fence =3D NULL;
>         u64 size =3D src_bo->size;
>@@ -876,7 +873,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *=
m,
>                                    struct ttm_resource *dst)
> {
>         bool clear_vram =3D mem_type_is_vram(dst->mem_type);
>-        struct xe_gt *gt =3D m->gt;
>+        struct xe_gt *gt =3D &m->tile->primary_gt;
>         struct xe_device *xe =3D gt_to_xe(gt);
>         struct dma_fence *fence =3D NULL;
>         u64 size =3D bo->size;
>@@ -1083,7 +1080,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>         for (i =3D 0; i < num_updates; i++) {
>                 const struct xe_vm_pgtable_update *update =3D &updates[i]=
;
>=20
>-                ops->populate(pt_update, gt_to_tile(m->gt), &update->pt_b=
o->vmap, NULL,
>+                ops->populate(pt_update, m->tile, &update->pt_bo->vmap, N=
ULL,
>                               update->ofs, update->qwords, update);
>         }
>=20
>@@ -1150,9 +1147,9 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>                            struct xe_migrate_pt_update *pt_update)
> {
>         const struct xe_migrate_pt_update_ops *ops =3D pt_update->ops;
>-        struct xe_gt *gt =3D m->gt;
>-        struct xe_tile *tile =3D gt_to_tile(m->gt);
>-        struct xe_device *xe =3D gt_to_xe(gt);
>+        struct xe_tile *tile =3D m->tile;
>+        struct xe_gt *gt =3D &tile->primary_gt;
>+        struct xe_device *xe =3D tile_to_xe(tile);
>         struct xe_sched_job *job;
>         struct dma_fence *fence;
>         struct drm_suballoc *sa_bo =3D NULL;
>diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migra=
te.h
>index e627f4023d5a..204337ea3b4e 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.h
>+++ b/drivers/gpu/drm/xe/xe_migrate.h
>@@ -71,7 +71,7 @@ struct xe_migrate_pt_update {
>         struct xe_vma *vma;
> };
>=20
>-struct xe_migrate *xe_migrate_init(struct xe_gt *gt);
>+struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
>=20
> struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>                                   struct xe_bo *src_bo,
>@@ -97,5 +97,5 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>=20
> void xe_migrate_wait(struct xe_migrate *m);
>=20
>-struct xe_engine *xe_gt_migrate_engine(struct xe_gt *gt);
>+struct xe_engine *xe_tile_migrate_engine(struct xe_tile *tile);
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 094058cb5f93..41b2be028b8a 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -1303,7 +1303,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma=
 *vma, struct xe_engine *e,
>                         return ERR_PTR(-ENOMEM);
>         }
>=20
>-        fence =3D xe_migrate_update_pgtables(tile->primary_gt.migrate,
>+        fence =3D xe_migrate_update_pgtables(tile->migrate,
>                                            vm, vma->bo,
>                                            e ? e : vm->eng[tile->id],
>                                            entries, num_entries,
>@@ -1624,7 +1624,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_v=
ma *vma, struct xe_engine *e
>          * clear again here. The eviction may have updated pagetables at =
a
>          * lower level, because it needs to be more conservative.
>          */
>-        fence =3D xe_migrate_update_pgtables(tile->primary_gt.migrate,
>+        fence =3D xe_migrate_update_pgtables(tile->migrate,
>                                            vm, NULL, e ? e :
>                                            vm->eng[tile->id],
>                                            entries, num_entries,
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 59d3e25ea550..fa56323aa988 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -7,6 +7,7 @@
>=20
> #include "xe_device.h"
> #include "xe_ggtt.h"
>+#include "xe_migrate.h"
> #include "xe_sa.h"
> #include "xe_tile.h"
> #include "xe_ttm_vram_mgr.h"
>@@ -88,3 +89,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>         xe_device_mem_access_put(tile_to_xe(tile));
>         return err;
> }
>+
>+void xe_tile_migrate_wait(struct xe_tile *tile)
>+{
>+        xe_migrate_wait(tile->migrate);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
>index 77529ea136a6..33bf41292195 100644
>--- a/drivers/gpu/drm/xe/xe_tile.h
>+++ b/drivers/gpu/drm/xe/xe_tile.h
>@@ -11,4 +11,6 @@ struct xe_tile;
> int xe_tile_alloc(struct xe_tile *tile);
> int xe_tile_init_noalloc(struct xe_tile *tile);
>=20
>+void xe_tile_migrate_wait(struct xe_tile *tile);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 803ed7b9ba88..c47680ad4920 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1267,7 +1267,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32=
 flags)
>                         if (!vm->pt_root[id])
>                                 continue;
>=20
>-                        migrate_vm =3D xe_migrate_get_vm(gt->migrate);
>+                        migrate_vm =3D xe_migrate_get_vm(tile->migrate);
>                         eng =3D xe_engine_create_class(xe, gt, migrate_vm=
,
>                                                      XE_ENGINE_CLASS_COPY=
,
>                                                      ENGINE_FLAG_VM);
>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_t=
ypes.h
>index c45c5daeeaa7..76af6ac0fa84 100644
>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>@@ -179,7 +179,7 @@ struct xe_vm {
> #define XE_VM_FLAG_SCRATCH_PAGE                BIT(4)
> #define XE_VM_FLAG_FAULT_MODE                BIT(5)
> #define XE_VM_FLAG_GT_ID(flags)                (((flags) >> 6) & 0x3)
>-#define XE_VM_FLAG_SET_GT_ID(gt)        ((gt)->info.id << 6)
>+#define XE_VM_FLAG_SET_TILE_ID(tile)        ((tile)->id << 6)
>         unsigned long flags;
>=20
>         /** @composite_fence_ctx: context composite fence */
>--=20
>2.40.1
>
