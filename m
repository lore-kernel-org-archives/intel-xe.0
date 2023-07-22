Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455AFC0015E
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jul 2023 02:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E098810E0D3;
	Sat, 22 Jul 2023 02:02:13 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E8210E0D5
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Jul 2023 02:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689991332; x=1721527332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8VitZVYWSFMyiT5FYkVq3uSSlE/MG9GRUg/ykhhC+po=;
 b=PIrakvKklMmIQDWluMQw7o3JS5kwpQlDVhew+duiFfaAgYZvUeelJl36
 sLHDri8JeaCPCaIEF2T4xb4oJjOIy56gIfIBkN7nD7hoHp4Xvu01aoRTI
 tlaqhucLI/OILsFKbCNsg36KrL0zVdPoTJoDL13K7e6qOU1VeB5ReywVq
 q8L2LpSY0YKZbqcWzP7+NnTyJQTUqdJyvZ1/1JiWxVAg2nx87KzUVb4XQ
 2sMTwDxkKI3I9dDwHWbKwmZOfbycGhNA7m9XKIsv2pYLz6VvK/bFCdQGv
 bguLeK1NnJM3JzBje2fkcdWFf1+ukSa+4IslR2pWbq4fBMbkOuXS6GemO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="453528138"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; d="scan'208";a="453528138"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 19:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="725071349"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; d="scan'208";a="725071349"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 19:02:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 19:02:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 19:02:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 19:02:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 19:02:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rndsit5hZrse/9ixBWagSqpI5QfT3PnjT/xWOpQ7ZkcAUEJSX+6HaeyB0H/KFZY2V/ulnp5e7I2xJ1MPZwDCECD8kU8p2mdXtTbqx8/Br9JO1heiIObwZLSey9QldHOnkOCoyPmXoZBX2Q3VqwOlCKLzP4twOvbmHwUm1e+n1VSJ0uCR/bQWmfjlvPEC0p7D5caJRWiHEd6zCwqr++RFhaHs1jGDmlesG1LNkydlUA3az/fK9+1DXYpSobGSZbEeAaH51QTIc+6/1TJFDiI3BEa2LLqWXafK0dzRm6RmkMFWm6qz6t1wr7Rs6GsE6evet1+bppLgGKNBtUeS3HgJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq20jwZV0RjxmyLA/lshVZx8vgx42mVEC4+2l9RDWkI=;
 b=KCQZiyRs6U8sIXkjwa0LhMVpsp2FwxfOwQlAdHcoQHtDHtogzRP3LES9jMUtVY8aEDdkzi/yHJoe0+rIrPeVjeMPXmL1bwTnujeTr86poxWHz35E3mYB7vFUq+oGebHrJGl2oW17Ft7qYxAXBxUcmMPULFAYKrQcNd1Il0tr+yee8h3R6lzD7/bR5UhQEJvWt+ZlUMiUL++zHmFWMW67noiDXesYmxFSrjrvQstgxQI9IGyTOlkKvEuv/I2jmKhdPTWA4NuNKcn0xJGrPCwTGj8pIer12Mjq6QUtn9EQFg7t0RYVSnOt9LDrfC7w6FjzKWspXWI2r8Bo3ECD8oiP2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Sat, 22 Jul
 2023 02:02:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.026; Sat, 22 Jul 2023
 02:02:08 +0000
Date: Fri, 21 Jul 2023 19:01:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <f2eif7jnbimsw5b7fexpjo3l6mbodsvnfnwgpjh5hday32p6v7@jep4u3b3445h>
References: <20230721175557.1513250-3-matthew.d.roper@intel.com>
 <20230721175557.1513250-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230721175557.1513250-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 5911d295-1401-4b30-1c34-08db8a57a744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uNAra5JzO5jJ8RWbXQ4a5ygoyNE8e3ICsV9N+v4FUY81dl0Rkv1toB0hOOgVFkP6MALLpzepRTD8iRhtgX+AAU1qOobrjQKM7cRQ/kz9Hn7NvEDyfFvlmSsg1ZoJbcG+pP9g+HTWsVHYcJHeH7dpVan33Fp71MQlNsTGtjis7Oe44EO1g6BOSSD+RhqNXMGS1AGiu4LqAth/CKANYjDgLvy334l31G7PiyTwvRWF7cS9KaI+iOtOXrRu1BlPw37KgfjG5RnT6lhnHt+PH1CRw8d48HF09iWOnYUb7guoHp8YiVL6Sc7HbNPyEhEAzy4ESVxQOt7svbr4YCaU5VoGxsoW6rJPq9abypKHiZvgEeqDy5oXXRwEsBsn34+TUz0TNh72+rdQODoEmJIKwYncdPdUfkCgmJPKjn9ieExUyRAJlEPPMShFFBD3sg4SWjWl5fkN1ff6clYE80Da+yxrVtkz4dLog9Rw7mD2TL4sF00SuoOkR90EI7bJQDLK0HkyY5FNhL+3/qXMGYaqXZ1CAojWuGeCYPgtO/IA5ePMLR9dP4uf8Wozn7yrlsXbId8i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(66946007)(83380400001)(2906002)(6512007)(6486002)(9686003)(41300700001)(186003)(26005)(6506007)(5660300002)(66556008)(316002)(33716001)(86362001)(38100700002)(82960400001)(8936002)(4326008)(8676002)(66476007)(6666004)(6862004)(6636002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lZZnF2XIDgp3Ajyx4X4i9aUAoPwmEsYwywk4nCUMUxfqJYvQxec63kBSdPLn?=
 =?us-ascii?Q?mgMiwrcaCCNWo4yhkW4wbhJqXoJEDIC+flGsyJLCP4+h+7PUxb6SPM4Wz6JY?=
 =?us-ascii?Q?R7DjH9BJBPph2A9EbPZFuT/XbNTsfzcupPFqHSgSp2eq6/da9jERacGKhpbY?=
 =?us-ascii?Q?4qLxgF7tHG9zJxP6fYoF56meJn6LZfSGX99SUiiWLNspgdyP8cVjVE6scKho?=
 =?us-ascii?Q?zUDsWirhPFBgw5CaWRel8PRI6y0DZ2A9Egrqk/lxpkplou1DEIG2GTGZ4j2K?=
 =?us-ascii?Q?lj4TXtxgA+Tu8TJdqulVE+YuqxfosOIFCwrRUvbNDB8rOL0Lws2OoXLqrCb3?=
 =?us-ascii?Q?PWrNiwdiakT/qRpgHdwetoveoGu8gI9yBkn22HsqvGv/tCXUq2Zbzz6xUb44?=
 =?us-ascii?Q?yiNDX6VQ68FL6ZRuEiRkiC0mY6swFB4IvKKJN0OqYlwSgbAdQ5dU4H7Hnx55?=
 =?us-ascii?Q?sq5QYy3i7QiFZc5eFFsGSHjrqvdNOw+pgnbOZUFoK9gw+jKdPYyTWZ1C0vIm?=
 =?us-ascii?Q?KG65JOJq3trHuCdOlsC0Kcd4pINdM7bRdmFKEFlS8IICHiNVG52Hn1e4jIB6?=
 =?us-ascii?Q?RQFoJbm9OIuzyygLqmmAdpNNYRWDgnQno27mfMyMjOX5EB+oUDLAbtV9xmj0?=
 =?us-ascii?Q?eIG4MCV9Vnc1W/MfPBp5FFtFCMGnj9EgyPgmxJElDckHJvFbpPgofqWgKgNF?=
 =?us-ascii?Q?DglaOYq0n9h+WEhPgginhttaLxEzBiG6ve5UapS+wIroOe896Q1Tbwsj4pDT?=
 =?us-ascii?Q?IOXI+ZTNJLZ97M3bEAhiBFD1mRZ6teyemuxeUJ2za6HzQF+LY2j3Z0C3ltMa?=
 =?us-ascii?Q?1ouH8jZHdab8Ce71PlRmKlwZ6kIfJ/85fk944XxIbVWpIeKUUreiD/U+CBBl?=
 =?us-ascii?Q?QQBpBrSKfw/WxryilXvtHXmFdlBttGseSi2PZVyQ+N79iWx2djxffSNhjGOY?=
 =?us-ascii?Q?8kGWAWTxBD0+/PQZWa7NDeFtS04lqkxPO3doHl8rShR8cQbCP52pmJ9Fl88M?=
 =?us-ascii?Q?TGXPYKD/bjDm9hSt27DRrmePLFAU3jGAwdg8bxOXXGf4bTLuf5FfUB2hcimz?=
 =?us-ascii?Q?g5fkflAoXtlE8BnZnfaPR6JYrL4rOsMyxTdXEzfcpaoHWAtmuGKc2svcBbSv?=
 =?us-ascii?Q?Wj81mc6vJi5HhqHvyJtkYwX29/OALMiN+wCKHBP2OfYY5ncYh+gjROe2cgSj?=
 =?us-ascii?Q?HXaQ/KJt4+PAc94hiUO2WL63XsMXdXZHcXI3JzdmK7+9rw9ezShRbOH9mYKt?=
 =?us-ascii?Q?ZOBED/oSn3LwhXc3hy6ATyR0HcrsNcFgwIBXbbo5g+g/uG0OvY+3+KjTIRBd?=
 =?us-ascii?Q?BvhZmmeyAbQMRh4wRY6YrFxLCuy4FCnSdMB/3SqoQHPIBJ+qUfFWLtGt6zAK?=
 =?us-ascii?Q?Q5YXW8Vl3/2uNrHJZMkR5FLajNjP31jqEErPtbuIVNrLzWzHZVCGcXNsZDRH?=
 =?us-ascii?Q?LbqdpCZKNWhASA5eQ6CK0ncbiv7lbSFKt8p76U6SGqpxd5Gk6HsEYb762T3X?=
 =?us-ascii?Q?zWNuodcS01lZb3EcltIDWinYcLeOxlKJGRYcClIppF4IISL2v5AkEER+yDqw?=
 =?us-ascii?Q?ZIO6orzg/yaqQ+KnWRTut51JeX+ArchRqzJp69s7k8Hd//sth201tdjy3X8A?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5911d295-1401-4b30-1c34-08db8a57a744
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 02:02:08.0019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FE70HUZoh+/Ygbp4k+FdVXwboi3d5DSQGCIeuPYdOWVEItpUVWNoCKsdkboEoCFQ/DHTxGgTNvCuHm8JdU/ruINK8KVwDrYGKJfpADWuSHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: xe_engine_create_ioctl should
 check gt_count, not tile_count
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 10:55:59AM -0700, Matt Roper wrote:
>Platforms like MTL only have a single tile, but multiple GTs.
>Ensure XE_ENGINE_CREATE accepts engine creation on gt1 on such
>platforms.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_engine.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index 59e0a9e085ba..0102dad16e29 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -416,7 +416,7 @@ find_hw_engine(struct xe_device *xe,
> 	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
> 		return NULL;
>
>-	if (eci.gt_id >= xe->info.tile_count)
>+	if (eci.gt_id >= xe->info.gt_count)
> 		return NULL;
>
> 	idx = array_index_nospec(eci.engine_class,
>@@ -539,7 +539,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
> 	if (XE_IOCTL_DBG(xe, err))
> 		return -EFAULT;
>
>-	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.tile_count))
>+	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> 		return -EINVAL;
>
> 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>-- 
>2.41.0
>
