Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EC1C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 13:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A2010E4DC;
	Wed, 31 May 2023 13:45:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6902310E4DC
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685540747; x=1717076747;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=IDyUCf0JylBWmS75ooUGLyBm5olPYru6S1DFOApfLtE=;
 b=GKw9QlKw/JO6cD8YRgXPBBM3unu73IrtgDq6BsxuMBsWbSbj/xbi4BVP
 6Mz6klvK6ZJSkIrtGSq6/mDuiakrrU7snho5pAwchirb2SpwtbPmNLDIY
 IVBWIpK6GGZXqSNQ6bk192+/tRJTWUWKi0SgUHaETHs2rsABP41mw9e0q
 R3N+o1IHSqA0sO0akqZYAdk1tF9iUgxjAwaVG9GOnSP6/i6dUtv/MwIB1
 ZewpC8jd7pkNW+EtyBvsWYpM3Qs2exb8iJ40fqM0CRaoZ0X/DDr5EClyb
 Nq8w8R3jeghwFOgynep86nWPQ1Jkn8JaPUr7SndS4Z0dRUrQovE1MjUnM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="334860810"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="334860810"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 06:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="771994196"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="771994196"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 31 May 2023 06:45:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 06:45:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 06:45:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 06:45:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 06:45:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfRHxBOQk0cyjlKd+i+LlAivw1Bivt7anlRsAQ34Y+TPv/qiF50nCqwtsNpndmypM+71Xec3TL2ZotrhX1GWHWOSHkVvIBDkfW9ebJ16u48ZNVzwOirNFR/Y0T/Tn/h4aw7dlMPlWhM7iW9bQn0dVn26BZ5aCv/JHHOWyzu0jhbtoS+ahYTrJER4H2sTGbyavoC0jj5xqdWC0R0Ug4TTgzra6w6RC1y/zvhH6fj9T59enJKwoBFTJODLX2kUbcP8nVkYvwEGf97Zr5uA21zcLDePOTzhAshz4h/r/q/ZlIQ27xNm2jmacrK/v9xwZ0kDQPuPuZ5B1zUyuCD0z+h7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqOqNMwTZzyXXSDDiA2FHPDlqcHFsxnDs13HPyYDpns=;
 b=khjr37etw39lC7wHdW+Jtw1AVH8Zx28BDAnsZnWlqYSTqkMvttlCKbUNfaOes2gx/I48ayPic+QgvPP+FzomI7VcD9g/06Oma+tT65UR0ljYsvV4Yz06eCUxTq7NLvMVZYXBLq52aHgLkgkqklxdal3Qoi97l1V2bQhNSwPm//g4RPCFTYmyk7RFVaIgJx5OGvSaMmWWd6n6R1x6bF6qo5oN/eqNfVEPhj/6rPYywfkwGCEmV+of59VyEAiGGcYx9z3Tr946ZJD0lfGjiOJ46sZAdgoAuvuplCufkKggl7dPWAVyp0GNLW1IFsHwZbWlofyTnYuBmA+B6GV4zSnJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 13:45:44 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 13:45:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230530211549.2632538-2-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
 <20230530211549.2632538-2-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 31 May 2023 10:45:39 -0300
Message-ID: <168554073974.1068887.6426728155271310264@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac41fde-7851-4fe8-b500-08db61dd54a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nGSN6srp3TGYdNB5fLjcsUvpdymhAEJBejbmcf2t6h0WHAQfrypdFOETynE0e10K+Ku5jN5zTq+pi79CVQaeJ1wHHDaXDWrTeOGqthqE68hK0nU4KYWuTZUMplyShpMu9RpCQbV5F68yCiHsplVODXDrZ9o/bFnY0gBOfSxtBZnc6TnoRoX84UxYn0K9tBwIl5bYsgyRpxcfwwh9Ot6M4zH9tlhUFoVT0lbjOa9i3VxLk/2eTGVqPqYHHkdxcMzdk3sLS8ubWhOTSzNpt9PW/6y5Y/aWAFeYfocI3oMkPm2Ue6uZvaXgCvfmlF+hd7+PgXdha/EANpS1U7yy4guZJi8vKbKP6YMVS57gLcnM/DjSi8Kj9Cwswas0FRQxxKFo3t4N5Swv+LpEIn7vvt7DV8ui2z7mX93Jf3zX0E5AcZ/ncb8gvM8QG+FCC+dZ6H4jdFOuJrCJt5f3xs5nA6l4zxdx1zVAoXesseW0AkGGFoBfnbVOq727ORzoSNEEI5dyyiKbAiB8gxaL+1CvOlXu2sWj2KuWjuxqs44nj0eZMquzQ5v6WnLxjrm4XAPEuwLt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(83380400001)(9686003)(86362001)(66946007)(66556008)(66476007)(41300700001)(186003)(4326008)(82960400001)(44832011)(2906002)(6506007)(26005)(6512007)(33716001)(8936002)(8676002)(5660300002)(107886003)(6486002)(478600001)(6666004)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzU5SW44eVlVTDczWVlVNFc5eitLNGd4UTBhYWN6WGxJWFFXdS8yM2Y2dGt6?=
 =?utf-8?B?enEyMGlTbGhrOFdNV1M3OWVCelpiTHNqSDZiWGpKTlY4aWRkSlNJNkFIQjZp?=
 =?utf-8?B?T1VENUJIbFAwbk1ueXN5bElYSzdBTTNTQ09qZGh3dHdIZHNxaStHcStCRXBz?=
 =?utf-8?B?bnhaeTNiQ0xVUU5NUmVmb0NPbWQxYndxbTN2MWtHekpjUTBEYU9uMmN3NzhK?=
 =?utf-8?B?WitqWGlURlA4cTZUcU52UFNEeE1PM2Npa1lDL2dlOUxuaHZQWVl3Q3pQZW43?=
 =?utf-8?B?V3ZndkR5bFpGaC9EWTZRMW9pd0hCT2d2U1RRMHkvOUVuVVQzNXhualpMWVhj?=
 =?utf-8?B?YXZvcW5KdTJwNGpqZkM3NFVYZEJKUUtLczE5NVNxR2NLRG5yUGt2VU16OG1q?=
 =?utf-8?B?WTNPc0xmbWtTeTF6a292bmVleG03UDJoTGJPKzRRYTVnKzhGOS9iMkp6TWp3?=
 =?utf-8?B?RlZqOUc2M2pTQzc0TUxQL05aK2dZcEJSRGd0c1gvS04xSGJEK1pXWHlUQWp4?=
 =?utf-8?B?dWVVRGNlQ3VPc3B4SDRSV1g2eXpqS0RlbXp0Z3RkTldSaUFqVzNVZVhNK0du?=
 =?utf-8?B?RW1jdnpkMmo2Z2g1TXIzOTZQWFJqR1gyRXpsTlRyNHdDejFkSWFESkFuREgz?=
 =?utf-8?B?amw0dCtzNWVGSWx5N2VJZ3dtMEJiOU5qSVgzWUcvQnNqU2k5eEpsUitMSTB3?=
 =?utf-8?B?VUJHS1ZHT2RsaUNkcUhYRVo5ZHFXNmNScUlmc2hnZGxkcXBpeEE4OTgxUzgv?=
 =?utf-8?B?TWxFdmo1UTdiRjcwUTNrTTJjbHhod0UvZzY1Z0IxbmdWMlQ2RlltQllsaGJ4?=
 =?utf-8?B?MittTjIyeWZzSDYvSDYzYkN4UjFJcUNpRnhhdi9EMGJzNERMNVo5OEt5U1Ft?=
 =?utf-8?B?VEQvZzVPNU5FVTJScGJhcExnQUV6UnhqMWx2U3FJaDc4TDk1MHdyeGNkRDJ1?=
 =?utf-8?B?RDMrbG9Gam5wQ3BPSTFXUkRnQ2VIeWV1emRndEE1MWlZYVNqVDcycm8xTTN6?=
 =?utf-8?B?bVBTNGZhUGNBRStZS1JhMkxXSVJDYm8wZzMyZC9vUE5zdVlzRmVFaWNaK25F?=
 =?utf-8?B?ZDZRTkZKQURRRlZaTmdyVFVqUkV4MlVvSlVFb0JxZXdaWnZNZzFLUXNnZ0Nj?=
 =?utf-8?B?c3NQUDlabVV1WmZpcVBWL1hISFMzbFlLSURKVXJ5Q2pqRlIvTmpDbituRGx3?=
 =?utf-8?B?VjJ1OTlXSUFIdFNkT282ME10ckJlWUYzV2daRkI1blVaRHNRTktrUkU5ZVNy?=
 =?utf-8?B?aG15SmdoajJoQ2lBUVJCVElqNnZHdlpVK2s5T01RVFFtdDI2SjYveHM3VTQv?=
 =?utf-8?B?ZTJ1WkdWZkcxWDRPcFBZNGVEL2Z3OFpDVUtWcVZYZjlCUnJsakpIelBIcmg3?=
 =?utf-8?B?N2hvdmkyeGZ6bDV5bWthNWtpUktPUGsrZmt2djIzRDRmTnZJL1pScGRxVDBD?=
 =?utf-8?B?ZzFEanRrT0JqcVpkaDljbXJ3MnF6cmlXd0U4Q3JUMDZGeTFKUVBVbXc5cVFM?=
 =?utf-8?B?OVdhbTdESCtFWTc0aWdmWS9sN21LNVRrb2cwdjRjNzZPL0RMcjJMUXhyNzY0?=
 =?utf-8?B?M2dJWklJMU1RZGIrSGtTY25QM1ROWlErWFNiSUROSkZ6NU1wbHNBbVVaUTJY?=
 =?utf-8?B?Q3FNbko4SURxblR2S0hycTRnRGN6bUZlVkFSYWlCaXNRanRKZm1hSDRJczIx?=
 =?utf-8?B?dzZHTUhnWVBybE81MmpsY0JaU0tRaHV0bVlYTWRtVzRrZFRHcmpmMnB3bUdW?=
 =?utf-8?B?R1psak1IS2UxVjRTazREOTFnNFI0d2pUSXVtL3lkREYxWC9CcW42L1lxSFZz?=
 =?utf-8?B?KzRJT2hiWW5iVW1DdG9KNFYzdFVrVUlEa3hVS3ZxMk5veExCQkpacHFPY2hG?=
 =?utf-8?B?Sno2RFlKSUFRMWpYNmlGc2RZNWxNL1FjNFo0Myt6cW9NT2ZrOUkxMXlicHpH?=
 =?utf-8?B?aDdWZG1qaVNSM2h1WmFSWVdBUEp1KzFZWGM2djhkdjlsSWZGRVJrcTBXOStK?=
 =?utf-8?B?L0Y4WUJ3L3M1d3dmcnpSc2ZiKzVlaElQRE52cHd3VGJ2dUxGSWliU2FOaEU4?=
 =?utf-8?B?L3BUZnh0WWtzSFV4cXcvMytYRVUxbFlDSk0wS3FzQ2ptVThJb0xTOGl2WSt0?=
 =?utf-8?B?OXhlREJ4SEt0dnc4UEJRVUI1SGN1YU1vSTBiMVRaWTU4RXpvRXJScVErTERq?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac41fde-7851-4fe8-b500-08db61dd54a7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:45:44.2535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nTWzo8S7skApJ8SBAM9fDr3017Y3IZgM9UYXkO2SHq0HUl+I6vVl7kq1CpZgwIh8fh1pC1i1Jh7PtJCkha6sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 01/31] drm/xe/mtl: Disable media GT
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
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-30 18:15:19-03:00)
>Xe incorrectly conflates the concept of 'tile' and 'GT.'  Since MTL's
>media support is not yet functioning properly, let's just disable it
>completely for now while we fix the fundamental driver design.  Support
>for media GTs on platforms like MTL will be re-added later.
>
>v2:
> - Drop some unrelated code cleanup that didn't belong in this patch.
>   (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c |  2 --
> drivers/gpu/drm/xe/xe_pci.c  | 13 +------------
> 2 files changed, 1 insertion(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index d3b57669c9a7..ef2353eef6fe 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -340,8 +340,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>         mtcfg =3D xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
>         adj_tile_count =3D xe->info.tile_count =3D
>                 REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>-        if (xe->info.media_verx100 >=3D 1300)
>-                xe->info.tile_count *=3D 2;
>=20
>         drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
>                  xe->info.tile_count, adj_tile_count);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index d8f1213ae1d6..be860f6d0a4f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -19,6 +19,7 @@
> #include "xe_device.h"
> #include "xe_display.h"
> #include "xe_drv.h"
>+#include "xe_gt.h"

I'm not sure why we are adding this include here.

--
Gustavo Sousa

> #include "xe_macros.h"
> #include "xe_module.h"
> #include "xe_pci_types.h"
>@@ -290,21 +291,11 @@ static const struct xe_device_desc pvc_desc =3D {
>         .extra_gts =3D pvc_gts,
> };
>=20
>-static const struct xe_gt_desc xelpmp_gts[] =3D {
>-        {
>-                .type =3D XE_GT_TYPE_MEDIA,
>-                .vram_id =3D 0,
>-                .mmio_adj_limit =3D 0x40000,
>-                .mmio_adj_offset =3D 0x380000,
>-        },
>-};
>-
> static const struct xe_device_desc mtl_desc =3D {
>         /* .graphics and .media determined via GMD_ID */
>         .require_force_probe =3D true,
>         PLATFORM(XE_METEORLAKE),
>         .has_display =3D true,
>-        .extra_gts =3D xelpmp_gts,
> };
>=20
> #undef PLATFORM
>@@ -566,8 +557,6 @@ static int xe_info_init(struct xe_device *xe,
>          * treats it as the number of GTs rather than just the number of =
tiles.
>          */
>         xe->info.tile_count =3D 1 + graphics_desc->max_remote_tiles;
>-        if (MEDIA_VER(xe) >=3D 13)
>-                xe->info.tile_count++;
>=20
>         for (id =3D 0; id < xe->info.tile_count; ++id) {
>                 gt =3D xe->gt + id;
>--=20
>2.40.1
>
