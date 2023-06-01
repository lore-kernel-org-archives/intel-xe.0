Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090E1C77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 15:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C564D10E08B;
	Thu,  1 Jun 2023 15:10:56 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC4610E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685632255; x=1717168255;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=FWmVXPDbntkI7q94lz4e9mRhxVtWw7YbKhWVrheOIIE=;
 b=ZrGBdCJ88azwdOcgEhA+qgBzoA7iUxU4Zv60+qiGr0JZHFhne2APh/Xj
 EmkeKbIJ6rYtoOvO6hcdWezG22DBiYMQz5fmMLt4N7BDI9PMcR73Rqom+
 mONenBZAj674VysvHm7DwV0hFbBEv3MsguKtuI4odBapk8SXAREMbQ2bD
 1Lu6Kr6rYe7U8YFuopoAVybKYC4MtkFeleB5YUbfoYLnIOo3zTjS6o6cD
 EsSo86yoVJB8GyXhq2VnHeOiRJHaoGs61fpI+GRmSKqYw53w1OKRH+ucB
 +84m1AtxAts0jb7NhephL7V26ELY4Wxud7y4OwuV85FfzMsZj0TuPKu39 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354439280"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="354439280"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 08:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772463225"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="772463225"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jun 2023 08:08:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:08:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 08:08:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 08:08:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 08:08:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLd/8AwcxqDcJ68KoWArg/wsNFfigSH58/mQ//iZdcaPwn4UPuuQHp9Tao0F6jZcMfz99smD6FIhR3gugWeKLoVLow6Bk6QmdiV0EYUtm063I2jhV6OE+xQYdvfAM+XR0+l11eeI9JG1T0gC017HC4eswsEpCLMCWy+l0epzIofGf7zHrDtaTAK32oZgLPmeN2TwxWH6TZBmH32Qrn6Ep+9Kgz8fd7mV1UbvWIUUKwFmuRgYxcqbsiB7JhcFCscnLKYbJogUK/Gu2v9heyLHvX+L9moUzSzciMhIpPr/Mh4CeV4EjhSdMc9NnUwahFljj6oLArnALbhcXI2EwspvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nzl8QZe0EEZ9eD+YeDpNifi2eXeWxEODa70iddS9O6g=;
 b=UOvf5npUOYmPVx8un8Hnewyqwbjidl95s0WlUDIpo1zcmFZzjISeXRqbts0JU60xd3mxqtdkdQPJjkBgwRJSDN4iUHEOPm1SyKRyqa1TSHQgD5kfcUxa3w/xhga5lThflbfbitNu9u9cAgdRr171h9IW+oaUM2T6t1dCQsntBPgLaQ17zohI28/z2Nc8nSa4dF6HP6QO7/I85Oc0DTSBAf2bz0SDQq/BZ/LOUvRGGx+Rt40KBP0fwamLxHgPt0qOb2Qz6jlg1VN83cwHyniihI0+mNNdVaEf3GhlYRnvhRtrs+jrtjATw97nEwXmFKTZrRwZVp60Z2Z1HQaD93vxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 15:08:51 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:08:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601000403.432517-2-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
 <20230601000403.432517-2-matthew.d.roper@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 12:08:45 -0300
Message-ID: <168563212586.3435.2816159279699159656@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ2PR11MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: f851bd2b-ba4b-443c-85de-08db62b21be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oIvjtOGml0XdbIQrYy8TqWkKUBkasWzvr4DoeF/9xwx/T8PE8o8K9dl7dqEiRZ/G4T1KYU4Rm5IorJXhJI+s56AzXYGdjidtVb9++pC5ict/0jI6K8F2hyh61QxIoGzoKdiVXlekB2O8rt6p8wOKvbAglD93I0uQxObplppYf/uBH0mDOHpDdCgAeifmHhsByH3j6MUL+ZmVtdKz+bd5px8MdqsbXyF+UJCoMvxU/Ybx+L2GXvHyr6MnfXYD1gM1wRvNrL+2sQMNhXBRKBmwHnuru7ybe0NIpOFtGgj8zV/cNWAzDcAqXmAkw7QRqYoYF41KKC3oY4oHu/2TsS3Ei473SmYC6kG9GkNLEsmEc0mfgV5wSRLztZf1EuVJAtSgQPCBbquxQK2s7zQnPGdASSjpJlaiJOZuNhzhSo5WyWDq0qna3qexabc4aS90Muhrn7WnEmErCo6V2njOeu0aYCYp4a0qeNYM0UguHpeli3dSOIpf/nuqe4BU0ojpUoDA+RMpPwBI+hanoZmryjHrAL3xmAbWi2pEIWzgXNeMRo489C13eZv/75yZTknkmbVs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(6486002)(6666004)(478600001)(6506007)(33716001)(83380400001)(9686003)(38100700002)(86362001)(82960400001)(107886003)(6512007)(186003)(26005)(316002)(41300700001)(66946007)(66476007)(66556008)(4326008)(44832011)(8676002)(2906002)(5660300002)(54906003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzZxaTI0Vno0UHBRcmZGU1hibHdBSTRVMzM3MnJZS3Vuc3VnUHY1Qi90YlZ1?=
 =?utf-8?B?alJ3SjI2emNGNm9SaE5tb2lvck94TTZnanZTbjVoeTl5Ykpvek15b2x6MHQz?=
 =?utf-8?B?bUdmZmlNODZkekNQZFRNUHNtc3BkenZ1dWNHOWh4aWJxYTJFQ25nV3BvZzlx?=
 =?utf-8?B?TE96anhhSXNTdWFRbHdYcFI3c2hzMEdxSlN5bEc3emtyV0JpSHhBNmROMEIx?=
 =?utf-8?B?RjhjRkNJQjNVTWNVQVVqMUs0ZjAzYXZjb0greGk5OWFrVVNMQ0RVZDBMQW8v?=
 =?utf-8?B?cy9YQmpwVXpXdDBNQU95Y01HdVNBWTdoaG4rdS8wM1RDL0N2eU51eElaUmZ1?=
 =?utf-8?B?SDJubU12VlI5cHNTbDUzMEN6NjN5TmJQMEdacGxUTGNuNUZBYWxRdVpJS01l?=
 =?utf-8?B?UjJwVzRFQk1oelc5SS92TitVckhFYzgvQVhCazRqS3Iyd2lhRzB2d1Mzakpy?=
 =?utf-8?B?TWxxems5em5pZCtXWWRVdzFIZTdtS0R6TGtDQVRCcW5YWFNheExTaTViSys3?=
 =?utf-8?B?dkpsRDM1TEtVZmJQZE5LOG9MWm9uMHZaYlUxS0k3aXF1aTFvRkdocUZRbWE1?=
 =?utf-8?B?bXJtVXhrUTdSY0dBbnZQMVhvZXo4K2xCTjRtZEZDd0dsUVkxMmN6TzRWZ1VU?=
 =?utf-8?B?L3FEeEh4OC96elVFSy8yNDBtT3RJNjc1dFcwSlNuMFFiZU1Md0xLNnREb1ZJ?=
 =?utf-8?B?aXNRa1hqeXVPNHA4N3JCTlJOMXg2VVBtTy9lUmFpNlZ3YnJ3aFFuaWIzczRo?=
 =?utf-8?B?dUh6YlFnYitCWlJGa3BmUFRHcmJHaXZMM29aTGU4eTFVRzJzUjNvL21taGF5?=
 =?utf-8?B?NzVyRFJRQUtBd3I0YVlxQXhsL20wVWR3YWJwKzZFaFlURGU5VWdVUFd0dHFQ?=
 =?utf-8?B?K3VTdFgzbC83VkdFdDYzNWZBRDBhb05WdHZiMHFaY0VZYkdURVdkUW1hcURS?=
 =?utf-8?B?WVFFZkZyd0Jpa3l5WmtRZTFZWFp5cy9KdDVmNUJ6Z25jWnl1VzRKQ1NkYTNG?=
 =?utf-8?B?Ulh1aE83ZzJEc0hYQThia0k1eUVNVHZWWEJ5NXlVaUVvMjQwd09YTjFpdGJm?=
 =?utf-8?B?aUUxcWw2WHErdmh4Q3FiR1UvNlk0Y1hyUVZlSC9zRlZ3SDFjaEVNUEVjQmdG?=
 =?utf-8?B?ckpoN3RkVjgzSXIwRS9WMFh6SThWVjdGRkFkblF0QXJqMkRSeWZ4MnZuQnVl?=
 =?utf-8?B?MnBSeDh4NW13SUllSlpnZHlaTklyWFRwWHNnbEtyUG04SjNUKzZhQUt4RmFZ?=
 =?utf-8?B?d2YxU0piSTdtdEc1Z1dlL3lYdDVzNTZVeGhscTdWZjFFcWRhNlA0cUtqbXRS?=
 =?utf-8?B?RTZHMG5MWEozUlgxSWVQSklPazdaY3AwVWxSL2xtdXg2OGJFcm9QLytIRWcz?=
 =?utf-8?B?QlpVSTJsSzNoVTlrMTJFNU15YnN4RlJ5T05yOFJRNldDRHJhWnlOTkRTdjRh?=
 =?utf-8?B?eVBLSElRaUZ4RVNwSjAxMU5yU1RiQ0h1NWJxTDBrMjlpQXpyWTRPdXdlR3hY?=
 =?utf-8?B?enFYSGhVb1FRWUY0cFc4SzA5dHRNYlpwMm0rYTJ4dGZyczB0WnAxaEkwUUVS?=
 =?utf-8?B?WU8yQ05VZEZ6T255Q1ZPdCsxZmhsWWZZaVhqUDFTTW9ZbXRKc2k4aTNtQnRy?=
 =?utf-8?B?TFB6ZFVOQTFUQXdIQVdRdVAwZVBqcCthTzRtUWtrblgyOHo0anlrcHpBYmRt?=
 =?utf-8?B?eTFkWEw0a1VCN294UzNxaktlVkswZWtkeU92WkJ5UG5KZXlKVFdwN2hONDh1?=
 =?utf-8?B?NDhFYmIvcnZObXFJVkM2aVdhTGxrb2thYkJWYXZ4TVVrc3VPRWg3WWR5d3Zp?=
 =?utf-8?B?SmNkazJxaG1uNkUxR0FaalFsTFVhbHdBK1ZxRlBFTHZZaXJ6alJPYkdzV2xM?=
 =?utf-8?B?aUZMNTNsbDhPdlNVaTYzdUhPMXprR3U1YmlXQldtOHNvYXBINDNtMVJ4a1JP?=
 =?utf-8?B?clN1MDVMOTNZZWdCOUhKeFQwSDlSbUxqWmFXeHJXMTdLNVMyckhUSFMydHRr?=
 =?utf-8?B?cU1xNW5VbThOZUdGN2RnalJJNU8yRzlrOHdCdklSTThVczNYeGpCQjlvTk5X?=
 =?utf-8?B?R0J1UkZnakNyVEV4QWo5R0VtaE42WTg4dnFsSkVFT29jWkFmZHN3cFVtejA2?=
 =?utf-8?B?WlpxQUxGcWVWRi9wc2tzMU5xOWRMdWFrUDAzRytHc0ZDU0x0Z3RYVnBvamU1?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f851bd2b-ba4b-443c-85de-08db62b21be9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:08:51.6951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENI+hB2Catg4OdS4OG7+4HZaLsVMuJ95/YiwZ+dyXjNrIKOpkdGzNhOZ0mc7SStxALob2oZh8vDUjvIL+jKE8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 01/31] drm/xe/mtl: Disable media GT
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

Quoting Matt Roper (2023-05-31 21:03:33-03:00)
>Xe incorrectly conflates the concept of 'tile' and 'GT.'  Since MTL's
>media support is not yet functioning properly, let's just disable it
>completely for now while we fix the fundamental driver design.  Support
>for media GTs on platforms like MTL will be re-added later.
>
>v2:
> - Drop some unrelated code cleanup that didn't belong in this patch.
>   (Lucas)
>v3:
> - Drop unnecessary xe_gt.h include.  (Gustavo)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_mmio.c |  2 --
> drivers/gpu/drm/xe/xe_pci.c  | 12 ------------
> 2 files changed, 14 deletions(-)
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
>index d8f1213ae1d6..6f0c4203fca3 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -290,21 +290,11 @@ static const struct xe_device_desc pvc_desc =3D {
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
>@@ -566,8 +556,6 @@ static int xe_info_init(struct xe_device *xe,
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
