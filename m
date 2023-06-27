Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC20EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 18:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D97F10E31A;
	Tue, 27 Jun 2023 18:08:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF61810E31F
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687889311; x=1719425311;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZlC8CWsUSKir2YJ7xGBB5bwnKH6uRJyXWNsqbk/mBm4=;
 b=I8XNOvBPx5b0SQE5b2wp0IqVASzEIuRrgKErpwtmpVs67VNsGLdD751W
 N9JDvP1RvrAv9EEZmCJ1pOyOSsRTGA8pPaPf9xLOEQUJtxX41Z4Mv4434
 IjuHoSh1snkBlZdedMxQNdc1mU35ry0NBEqdxlNxB1U9M0iHYGRH8zNB/
 ZNq+/40bxkBe4vs7zvEGAWThtIRKoq/2rXK0sQcKANHrSthoDAS8Q9ygE
 69xDo+JbINYq4XAVcz5J8DPoz27UJGa7BL1VtdSpKOJqK9R7SzQR58y3O
 mveo8wE4KkHbUTzl5uBuu4eMZn5hAxtrul0Advp2LyHKf3djJLDyCXFfr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="392260098"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="392260098"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 11:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="719912688"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="719912688"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2023 11:08:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 11:08:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 11:08:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 11:08:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 11:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpQQJeASZCtzTmduGglLVLaMoII6sjZdSiIP3dsElSjnkRw0B2sJaQWU3DDnA2OkO1gLJcDNOx9LWE2b3CEpExZG9zZxKj6ga9y72HqpzedavQ8nxEROwUMprKrxdMTfUvBi0RX/DvtNvXZH1LLyF6sKPgFGIGsQb6SLbHAFwisfCt03iGuhzxKSHzQdbWoK9VNhWLsPEWl8YvZLRjY04OVueatWpHHy9vP8GKZgCN5qI2zSx/foTTnxVDQ/h8TEosC7ren6G3ondAddBEiUuELy11H/Zuw6UpQrEXc02cKbDGmYaB/rgZlKdGG0heupYPRUnakZCzbMJ25/uRny2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS9Ecv7T3H+XgydBwh2Qndz9OTtlYaTzjL70U4lqnNY=;
 b=RRYYvSUVzJ+e0ilTfPt0+8CwEk2jGarNs1dQ6iJ4jcLyLtm2/YTSaIZC0I/WcYve8fxNtFkYO88KEIenyGOUACYe3r+7pY3KIl7VKHDXiIcWhJBkC2HAJA6qF1E1UvMSk9Wpizf3QH+jkVwMFcW/oq6cZuijDYtPEReHybBuAAp95OOrIHTRrzqP1UbRytBxdH27fs7iP/kUdaxkb1JM4qnRWMRE9R8WfGTuO2P6wjFL9ZE7w3fKzXE5GBHZth+Rkh6pAmDQX6XRo7aq8rs1rU/c8O8pR8iwe4bducAy4BWqS2J9FfTeWkdDwpqQS9MZuG+glYqHt2iw9PUka9gvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 18:08:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 18:08:26 +0000
Date: Tue, 27 Jun 2023 15:08:21 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <dxt5pxqhv7qhmi23klipxtyrd54mnoe4dbjjapcydvil2252ie@ztanzg5r3raq>
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
 <20230622072818.3182423-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230622072818.3182423-4-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb1e07f-4e2c-42ea-9f6f-08db773980a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BlM59PZmc2RVtRhyz5e9W4+xRjh9i7g0B0uLevBCj25qvG3H+Ue0rR3fJVVpRxeI6XPcKS1LO26SMwHrqJWdvxnHPAmoHSnlXCGBzF0689RQm64ZX0QDCkmBfgiWvEmk7VlfzI3eqwubTY4MMavXgh1ePdAjg6LMdRoY7PQiGL+96MaPg2JQp975zpo72nEnS1NWuaI3yWN6lD2WPlpjxY4T8EYnjjuwu5v3RdExsrWKR63ymi0sSI3pFcR8KiysyT9/Kuk2wDuv7twPrWxE44GkEiLI5o/lbaVW4+QvHqkT8OyXp4bzZoOUEU1Pb1DXcgdaV9wA72jjfrY0Pf3a7gLBGIm2ZYlsTFjtjOw9B5gbjzJCQ2fq9du463RfpRyE7Ybjc3mO9Tse8+yFt0HOOBcP0juYJyFtKeAT29Zb4VETrdjcfC8WOUMM1NqIJN+df3mJXRxUN6xFEPHevFwoghoe9Oqq03RIOrBZ6GGmVJp1p9iU1gB8rzv3nlVcQFOxdUuF0gAPWHfzJ6l7Dasr0dO8RO/ItX/CZ5NC2ak5x3ga1+ECqdBfqeYc9TLGUrUZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(66556008)(66476007)(6506007)(6666004)(478600001)(83380400001)(9686003)(186003)(2906002)(6486002)(5660300002)(6862004)(33716001)(6636002)(66946007)(82960400001)(38100700002)(8676002)(86362001)(316002)(4326008)(41300700001)(8936002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nmejIR+z985+cUljri/e1e90npOBsEBdyaBdPZixmRWr9yMpcLhn1khk0aje?=
 =?us-ascii?Q?96Vs3u90xUxCSZDeqgVS298w9E7UfdDaZao7+5noQbHOBeM8dRIMZxrZUcVU?=
 =?us-ascii?Q?7TvMBN1CI/7ab5qwVD7cTpFyRVXO+VuIflTWazm75A3ANDgaHWXBdFDkildy?=
 =?us-ascii?Q?s5Mx03W2/6cpRLCjvFLpDKCGqNL094Ob8ltKPTYZHbejZEEGOjQmHifdZDXY?=
 =?us-ascii?Q?morwhkWbidIo3CAcqO7yf5r07DmSStESaCjZFVWCQt7B7usN19inkXY64y23?=
 =?us-ascii?Q?nuygsb7JldsyTxaXbnM5N57hXBvoEIeWm4jBCwVGvmbltAnnaFpvSMWBF6V6?=
 =?us-ascii?Q?Le2gH1la+bBWi5iMuJZYijiLXQh9qT/r03hzBfvxwTSRumVy5rVEZGQvlMom?=
 =?us-ascii?Q?pf7NsZmCf5C1CNiXuNWeSmwxwddBaW+ipPor4ZLHOzfZEDCiXlgmThP8zb4M?=
 =?us-ascii?Q?v35VsN2rqfomsQOBW31so0JBgmHSfieYxtoZLLTJnFVecK4KEWLHyF9EZekw?=
 =?us-ascii?Q?iTAdKr08z7RXF2QOVlHoPvuYw8fPfWPxeCq3skFHEIRJ4WI7yW30e3ufPHxl?=
 =?us-ascii?Q?+iIXxJZnY8ws8mIFVGjvnpGCahXqsQJAvweSRy9To0Al3YvdopnhdYY+Le1+?=
 =?us-ascii?Q?CZjx2aV29j0aTp9KG39sM/5STlbWeytWs+oQt6e6UQh0ltg9d+OyfiEK2CsR?=
 =?us-ascii?Q?64b129zVaecwQKDBsnxbQtZbbP0bA+5hp7llt8xk1Nl6kB7eRdlYfTc/lxmL?=
 =?us-ascii?Q?1HBDif53Ez0+f9KIIm82qklSCwJnLr7mGaMK6ygvFPwwuNto/SKNtHGxOcQW?=
 =?us-ascii?Q?fVP1Rj2RkwOowoyICyaA/W+/IlFOyR+MOK69uV+2iCPHzr4sTq+xWR4Xj+hI?=
 =?us-ascii?Q?UQPpzpPOow2V+oHyZmP7R2TK+vRqqIQ/YgjIz11PNyo1euPqe/Qc8MgwIoL/?=
 =?us-ascii?Q?Cwi+zxwbGoocwYljaN56GwAnUcDtnvJGCDbY7/GyBDyxN6Ag0uRNaFRhhfKE?=
 =?us-ascii?Q?UfAflnuU6SAjxXg5I9JMD+vAPLEl1lR6h6UliKQeVczupWEh1rnrXYFGDpTv?=
 =?us-ascii?Q?MRIMvsTMnLio+i/o5teU8x5CUBpr9sXrz4wRfP3SUsKeux6M0GWQh1cuoGua?=
 =?us-ascii?Q?+VTDtj/tHIMfCl/Bd1ecXnKrG0Ez38z/Yh1MBrfmjqRyijg/ilEntB8MkLfl?=
 =?us-ascii?Q?DU7+VSbD1JIPwzvJjHeaUWEay4PfO+LJi2IeNTZpkp3v2TJ5zgjAXB9HCMSB?=
 =?us-ascii?Q?J5HqX+TEe+xq5xAQXgNj1peZ7QfZCorzScqwiriG6E4BKreuHzpS0tVSrSnd?=
 =?us-ascii?Q?zlql0qdggLgxjNm/CN8uxKdJnLwdZj8uLtZ0y+0SYdnfHlluJMNGjlFpJOgJ?=
 =?us-ascii?Q?sv3dbucGJtl45fQ5TIUDF+6h9PNwIdiE/KfmsMAk6kzr1VS54W6hrIuozqQJ?=
 =?us-ascii?Q?4ggyklYJOvt0xgz5tCXDmnMO1Qs/qUuWAFo2DX454S/3reY94xcG/JUZrr/6?=
 =?us-ascii?Q?Bi9Wpb7rgrAkqhkNTkxPnaZd23NnBfdp0Y7qlE8EyqbJ5oLZxdUz7pbBAd4o?=
 =?us-ascii?Q?DfVub9vaHrUicPdepUsWcx8FioPuBJ4fVihUpysyC7U1pz7vypl60q+c/7l9?=
 =?us-ascii?Q?5DpqLaXsOPkEKUpIxnnAe3d6kf2/y1weOwcVXHIDdz0lGjMjojInTnGNlxoG?=
 =?us-ascii?Q?Fj/WZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb1e07f-4e2c-42ea-9f6f-08db773980a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 18:08:26.2261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4aD0pvUftUEk0cBobnGBDq74lAiaIJzdVQHnESvgFsa1MN65NMbfVK0D6Jq6DzcqOVBltwDpMX6my4RSWG0YOYsDlXx8aef3CyIW1lkKU+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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

On Thu, Jun 22, 2023 at 12:58:18PM +0530, Tejas Upadhyay wrote:
>Add sysfs entry to read per tile physical memory
>including stolen memory.
>
>V4:
>  - %s/addr_range/physical_vram_size_byes, make it
>    user readable name - Joonas/Aravind
>  - Display in bytes - Joonas/Aravind
>V3:
>  - Exclude DG1, replace sysfs_create_file/files - Aravind
>V2:
>  - Use DEVICE_ATTR_RO - Aravind
>  - Dont put kobj on sysfs_file_create fail - Himal
>  - Skip addr_range sysfs create for non dgfx - Himal
>
>Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
> drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> drivers/gpu/drm/xe/xe_tile_sysfs.c   | 19 +++++++++++++++++++
> 3 files changed, 26 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index f2d4298fb0a1..dada97352330 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -108,6 +108,12 @@ struct xe_tile {
>
> 	/** @mem: memory management info for tile */
> 	struct {
>+		/**
>+		 * @actual_physical_mem: Track actual VRAM size
>+		 * including stolen mem for tile
>+		 */
>+		resource_size_t actual_physical_mem;

should probably be inside the vram struct below? Then you probably need
to tweak this doc

	/** @size: size of VRAM. */
	resource_size_t size;

to explain how these are different... i.e. that while your
physical_vram_size doesn't exclude anything, "size" excludes reserved
portions (e.g. the stolen memory).  So...

vram {
	io_size - vram that can be accessed by the CPU through the io mapping
	size - probably rename to "usable_size"?, the total vram minus reserved
	       portions
	actual_physical_size - ...
}

Lucas De Marchi

>+
> 		/**
> 		 * @vram: VRAM info for tile.
> 		 *
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index f1336803b915..4bb8e8c3080e 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -277,6 +277,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> 		if (err)
> 			return err;
>
>+		tile->mem.actual_physical_mem = tile_size;
> 		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
> 		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
>
>diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>index 386c6accd4dd..6b559e2f2f7b 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>@@ -20,6 +20,20 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
> 	.sysfs_ops = &kobj_sysfs_ops,
> };
>
>+static ssize_t
>+physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
>+			      char *buf)
>+{
>+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>+
>+	return sysfs_emit(buf, "%llu\n", tile->mem.actual_physical_mem);
>+}
>+
>+static DEVICE_ATTR_RO(physical_vram_size_bytes);
>+
>+static const struct attribute *physical_memsize_attr =
>+	&dev_attr_physical_vram_size_bytes.attr;
>+
> static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> {
> 	struct xe_tile *tile = arg;
>@@ -50,6 +64,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>
> 	tile->sysfs = &kt->base;
>
>+	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>+	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
>+		drm_warn(&xe->drm,
>+			 "Sysfs creation to read addr_range per tile failed\n");
>+
> 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> 	if (err) {
> 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>-- 
>2.25.1
>
