Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED39EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 17:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F5310E01F;
	Tue, 27 Jun 2023 17:40:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211F310E01F
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 17:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687887602; x=1719423602;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IzeCprkJwgz3YnQ/QiLGymzmwFCiiCVJyXddl5KvmJw=;
 b=MNb5ugtPcGOe2yr82+UOq25eYQjbcBnvnYrESA95qb/H2VGZ9Sp6HrAn
 im5rEOrERW3shLo8KvbomZa7rXohrm9gLT3aDzgw2T7auKgi3/J2bQlKb
 WfZqmGCZvmrDYvgN3jqA6PvNWGtTxBFHhRE2i/Jct/wD+hItCgMeQEmZP
 PhBpCuklinPUjSiiqzQ33HqAl58ysImyThXyy6rMPogLV49fl2WjZGVxh
 eXIDNjBjRHcTPDjdSKRppFq8oV0L5R8o6RMmO02d8nULu5ZdiWF6vk657
 Q0kW9VJfNi5ROyZ9WBoe6cbp/RPgim/eZtPgdhJewN7y7tBwOFVKA7okW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="448030205"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="448030205"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 10:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="781933757"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="781933757"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2023 10:37:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 10:37:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 10:37:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 10:37:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1e6YPqD0Y+4VjGUG0J0+aqeCd76ylUsOvCXJ5QyUy0vxsz/qr6HcwQEfuFXbnlIuz9cosXwWks2R3h9dIs4xK01ndwjFMohLZ9ZNYbsQMLhGmOzlrC5ILxgBIlpPxBi1+wLKomjXibojiDZarHGl5VV7pfqbSrce1YuWLgJm3C3ZKKjhip3DSY6kNCQGUM2rBwl0B3rsuFzmUK4U0AvsQXvvQEr6c7gyw0AFzUI0zbNiduuVdC2qvSq/zT+rxix7fhS+yyzZAsGTJVAJiYCWxt67Mqu/zLwTKmMTP+0FVaJvSPCWDd8lGmKE60rVgT2beFcKumOf6b36tUnELamgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyxW3k5uI2VPOWjHUOXuNaq6X4GiRPEol45hzs0MmMk=;
 b=T3Chg6RglqVsOtLl+DoxXb1/eANXsabUFHibz/770BqoHgzPxor7GxTrVIMVYbs0kUXDttgwqqPz4p3QfdwZ0M4BBILH6TtQ2AFYLrgBkDaiqUpzrwJs3rh3AF3TWazwXnzOj0IcHDyFYrXBKznqp+0Dqc2ZZ4BmIaT2DuIA1/IVCCxYbhrlzKHhGMcHeIDOaoi4OGhQz4EVaqGJSecloF92hYyxrVgdx46nQhdLoRZqsNtDYToV9J9IEQR+2hmaeQ5pIZBsGORz/YgfJv3eB9J112yRL/5x0MOqsxF3RCdCNXB3bvy7VsoC+90SJ9HG+ez8g2bNPLXMxHcmTOVPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 17:37:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 17:37:46 +0000
Date: Tue, 27 Jun 2023 14:37:41 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <pmzxaxpm3ycndjmtlnxwx5dwewgyeprmfxjzkgcnuvxyfiaww7@lwqjio7wvneo>
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
 <20230622072818.3182423-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230622072818.3182423-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c66ed2-4c7e-4588-8435-08db773537fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZHyhUPRpHOjSwpLdekUNRuLxr9gZ9jjiFWgR2DoCE0sOaJoaqu7xUfIkProc+R4n3R51NOGcaGb13fhjsns5EV57mWTndWMFNJraoIOsmtJc96XmdIBmj2db8SKfGH9Jl+UUfw0Ek8cw7rrMJEHAQlm+38x/3Y/lM+oAIOAOL3RUpHBE1XbtD5LSCQgUia9q8AugAHwf+jAmH7+lagfWG+9/fzr9I0aHibovJPMIUVgLAeuH5akQMGXj0CigLZ2RCfLY+S55oZ6nBKceJN5q+gmH27Y9VGcrvI2xCyD44rubAeZo0gJg2LdiH0PqLzD29yZPlsO4Mo9NCocelfaIWAU2j3zAfgcb6kyDlSHFR5ME57YDCLmd2wuQ6eGfIhsaAVQrLlHsCx7E6/FPWWSd1NHMDHJPkjxg8d3+ex3qIBJp9JxOIn1QxslO06rc9DPLTBuMuSH5pJfslO0niyuAgs5fQgc55OCvdJ7KxSWgSrIm4frHzukId55r7xjsHGwfftIX9K2AFGPq7ZCDjZgWy0f5Wx3jrI++8vn5TvyQb82qXSteJ98rFlNrngtNY0G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(66556008)(66476007)(6506007)(6666004)(478600001)(83380400001)(9686003)(186003)(2906002)(6486002)(5660300002)(6862004)(33716001)(6636002)(66946007)(82960400001)(38100700002)(8676002)(86362001)(316002)(4326008)(41300700001)(8936002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?foGgAf71nZgNBi1MGA9brVQWjEBDurlF9aCbLVXs0bG0F9apjvIL20dwaWU2?=
 =?us-ascii?Q?eBiHQ0ynjooOHL2/dI2QhnzoCi7KOd69No73X0g9oe1f9aI2N5xOe9uoAP7Y?=
 =?us-ascii?Q?h0lYJZsVacl04n8L62zg1FEZF8pXCkugdXH80HqEmktUg8fMc5Ww/kC3/i92?=
 =?us-ascii?Q?WL011Ua8glZU4Q7D/1InH1K9l663TVEtue3Re+0EDUrs7su7+7kuVF4buVRl?=
 =?us-ascii?Q?kc7wobd2ug2jg5utYE8OC5Xco6J1pUe0uEFInG0fv6CSwlU9qzFnC2owNAU/?=
 =?us-ascii?Q?gPMRnmCysbrYptwo5aarkpmSrE0obmGuwAJfQOcILAgmSWvA6+kF5ngsl0Rt?=
 =?us-ascii?Q?KaSXyB6OzxjbM5oeYhCRt8Gz0fZXz7x3YSWTUUhCLVcN7HJmkkbazCiAOLi7?=
 =?us-ascii?Q?89PU3dTLJ9quv/Y6hdxBgop9bCp5psZoxe1Defk3Nl9aiCvtrnvOE6azVOsy?=
 =?us-ascii?Q?iOU3YnhJ8GjYTkT7XiZSotoPzE31NRSBhUzroT6hkrRku2/di42DOdPkZ9iD?=
 =?us-ascii?Q?dHeRYo0+aHVSVBQaYUv+uVRHrO6MPBsgU925A6cw8MpmSDBNfqqQ02tiJiR+?=
 =?us-ascii?Q?PAAzOE+Ahd+kG3DniXFNv2P8FFo1oQxaXOm1cN1VO0z7mjIyLWh8Wa67U/H8?=
 =?us-ascii?Q?CO02S9MXvNEezBQmqDwlal+PdNeHD5GKIh+H4i50e3r9/yjP20iU2XI1rtu+?=
 =?us-ascii?Q?S3yknhw5DuUBOUI+K2ep8C6LrCRDoxxFS64Pup5e1ncNzsBudynbaKVLkw6e?=
 =?us-ascii?Q?y7T3J5d8ckyv1s7YigeXkYXaPPHoe00wwLs/7w9xUNISIHhsHT7GOk5IOJfc?=
 =?us-ascii?Q?/jch0sR3A+ys6Z8T20/dy8W8vRjzHuM5PFWkTTFQr6bWiBpkH/3D1CWXLexa?=
 =?us-ascii?Q?6B2s9ISXAb6xjqNDaxasqVt04vlN/IluIme5kd+p9ti9HylqeiD0NvtBsbZd?=
 =?us-ascii?Q?A6nqp/w6XXAtJoy8bNuRlNGpbsnvfnxkHTjZIe1PbwO3RWhye2Q1toNgcjOn?=
 =?us-ascii?Q?iqOmZrcyzZTZxIPrVt71UKXd+mnvezbDXkEEHLCGFOj9rPYL0XwcPOmQSReH?=
 =?us-ascii?Q?0kYoCKQqG3+MLz0xQhjuJI3kIHNZ+F9Iv3colggbCL+3ygfvg6705AZHG4sQ?=
 =?us-ascii?Q?7wdRpkTZx81bWggjdOrKSa5fAKDgKB9H+P9mQtHQKqVzcggylHa7quIY4qUA?=
 =?us-ascii?Q?kVSARv7xveY89XSn0RMRi1ZPRrMg1OZ7Z/l9lWrY9yIH6yC/nUI5GXtUxIxL?=
 =?us-ascii?Q?9AAorAvI0J5i4/IH1+5lQSVb+K07ltdsMQ2ftrJ8oJqL8svt3Ii3s4lC7q42?=
 =?us-ascii?Q?V2yVQdq3xkee1oTzxylnn4Dpxlki5EVF8IiHq60VvFjedrm4bVUaa7/eRUCn?=
 =?us-ascii?Q?EXytBo+jNmZcEg00of/1kg4x2Avv2LXPKNMoBTNmUa8FUJmYOH2FLv3GBWMJ?=
 =?us-ascii?Q?XtOMHWXoqEGEZgc61nFRkLg6NzzEfUQP3F0MU48jVLd9mFGQiVVWMhmC6Ggn?=
 =?us-ascii?Q?M5YbrCgXislYib68VwUxv2qVOjBjt7w2UHORvCO/0CpKUNpnvf/9d2g1RIjp?=
 =?us-ascii?Q?RG4nS5U1yw3TAXqNDTf57iOrDcuTcKeseeai1PHjb1U/pxf/Wfi+SIOufiFU?=
 =?us-ascii?Q?8+oOHLYUebBzuxFEo+2tiBtote9bBMH80VWK1z9m0/FlALxfL+7EtZ9tryUv?=
 =?us-ascii?Q?6e7NwA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c66ed2-4c7e-4588-8435-08db773537fb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 17:37:46.2391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIAPnEH1HArNMMXzBJ9h5alhvenfUApA03A7h/DyI9e7LzkHHLxJmZ6dZSKqZJSubWYAT/tJGccTQ49Jlf/oPxaUGTSN1JdEwFpiUGR4vDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4 2/3] drm/xe: Add GTs under respective tile
 sysfs
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

On Thu, Jun 22, 2023 at 12:58:17PM +0530, Tejas Upadhyay wrote:
>With the separation of xe_tile and xe_gt, We now consider
>a PCI device (xe_device) to contain one or more tiles (struct xe_tile).
>Each tile will contain one or more GTs (struct xe_gt).
>So lets align sysfs paths accordingly.
>
>TODO: Currently we have gt0 under tile0 and gt1 under tile1
>on multi-tile. This GT indexing still under discussion, when
>it is concluded we need to revisit this change.

do we want to merge this commit with this TODO? Once we export things to
userspace it's always harder to change it. When you say multi-tile, are
you referring to devices like PVC (real multi-tile) or like MTL
(multi-gt)?

Also we had a discussion in the past, but I don't see any current
discussion about it being taking care of. Where is the discussion
you're talking about?

Lucas De Marchi

>
>Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_sysfs.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index c01cc689058c..13570987a756 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -31,7 +31,7 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
>
> int xe_gt_sysfs_init(struct xe_gt *gt)
> {
>-	struct device *dev = gt_to_xe(gt)->drm.dev;
>+	struct xe_tile *tile = gt_to_tile(gt);
> 	struct kobj_gt *kg;
> 	int err;
>
>@@ -42,7 +42,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
> 	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
> 	kg->gt = gt;
>
>-	err = kobject_add(&kg->base, &dev->kobj, "gt%d", gt->info.id);
>+	err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
> 	if (err) {
> 		kobject_put(&kg->base);
> 		return err;
>-- 
>2.25.1
>
