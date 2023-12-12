Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF66AC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 17:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBC010E1A6;
	Tue, 12 Dec 2023 17:35:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0B10E1A6
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 17:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702402557; x=1733938557;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ni0kilZ8N0m9ycRrzqJL4iWKB51ijFqw84j2lai0whU=;
 b=TdQXh6GoHWrNQMF5Qyuc9p7juyTrX5LNKAWhfOLEc6DAotK819zz1Z2d
 aWl//g77GGCU4oqTDuXWqXTDgt8jAjjOHl+oSZZN2hh4BL1jVrAhSng04
 P9FW+5yUaJ5bYr/uWz4d4PTVvdj+KacBryhHDe+AZD5rpQRjLD9XaybRY
 dGJpGWTOI53o0j60YT2rcc2G/C2z8sariiBI1sVOzM2KPczsMUcW/kGvA
 IPxOiRAPkE1f+6YRxRaTR+lnDJMLdvLrVKSUiV1i7A2Ts1+fVEg73o4zv
 h7alLwn8pYZnbRcbXE98m7D5dxLxCPpQumpMWj1w+ptKGIg/nW+Jhaw/Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1659906"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1659906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 09:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1104979360"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="1104979360"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 09:35:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 09:35:55 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 09:35:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 09:35:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 09:35:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTZbsD460TpuJSp9kMnPyPwf0MmOxDzYGGHUU3a1HDKW/IM93PO+d9hUT32v5d9CC5Z9MfoNlAbJMPDnSamjhcbijSuB95cYIyUDfs0DUL9WRXyC0VVYHxGIkfXihGVFJKAs+OEBuaOxBh1HGg+xYEKBvyVD1XnBqXy1s+UyPcjyv2utocq1C2V/jTyiIKMbobydn9hjQ9mu29BWkzPRolUnwk5u9nDbeq2LxNqcDXQ6GAxbb8OzIylEW+GxM33GrF3/i4X+sl08rIhWfYsH8I1O6bsAxMFzRgztHDayvjPzGXprBOpcmxntQiK3xzOpID/wqdQX1iyFGzucWc6X0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVZPiR4YQFa3X3pU57yRoK+8TjrWpP87RXilqXS3sng=;
 b=nWPOs/q0+qRoARm3QDH/VPZ5DJPu1qdDtlng7/s5pXVHwXKFfgXz9LJtWmK/SBmIr9Ybbq+domkkc53SL7hGWGkrvYwgMxW4meRF5sR7oRyV+7l5jlHrlclGutt3NnEwpSi/xuLuwUK84KvIo5Qyvt1iXyrdF/PZqJdHRVPnDx4x3fWkxG4m5qOvl3O/DOc/N+Q4Uf5tQp15Il7tMC/aMM7DDyAmzi7m2FwlBdlRzAyHyfp0K+M4CmY0E8Z3IW8pq/P6wGaCJnHTeGDApKpgr+a8DsM98agLw5ccaY5lbPV8+5tf1OEw94AjHgURzRMmbeydyMjXWNsQaj1olNmB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 17:35:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 17:35:46 +0000
Date: Tue, 12 Dec 2023 09:35:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Remove vram size info from sysfs
Message-ID: <20231212173521.GF1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW5PR11MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e07587-0df7-4887-1b30-08dbfb38bc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvBN8W92IjU7PFRJXr3feJsZSEe4TkInUQIardzHPSC18kJZBbqL1x+LKYFvNNniEGqRqbuD9HYYioqoQfLXeWUz3yjDX2vDoSTpHmNfHLYmzfmVnz8RefO6w0he8nWgCzR+js8x5iaAloIsYV5lLKtYMlp/kTLDt5bglLYGtMOwUugBIjQoXCRLd0ciJNo/ReH9tJ3wQ4htEab9JSsVBTr1J8Lvkg3DM0AIH8gTEjkSU3BYqcrzNoFqOxTPShcelUIwHLSRbC0md85iE9OMGoyNzGX5D+PVYzL9VwILHeYaFLlPlDYjtRjEsvm70q1hEs/8xLZ1KUy8VUBk0DNcFH6R6GBxl0mwZ27Jfo8c6XBEEVcOhS8WH1PoM6WCkavLwGp8PSi5CQExdMXPTWNr4ZMQyl612kTR+8DaGgPQ6E6cRTEug9gD3uutKmC/uRDjro+/1jukMOl0IhDAp/A2SWFwZAyRgpdN1VZzuqUWZB1XeOxkaFA8wXoDox93k9cGjRcL7E+a4MpSyPregvthGFfJXOggCVmStOFalTCnIPRQmRgEzMrP9Bw9GhtwAbzB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(8676002)(6862004)(4326008)(66946007)(6636002)(66556008)(2906002)(5660300002)(66476007)(316002)(6506007)(6512007)(6666004)(478600001)(6486002)(41300700001)(38100700002)(33656002)(86362001)(82960400001)(83380400001)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xGH6DpeJTQ/UetzU/+XHqbPQlydbrh+JGbmFZTLqCG9Xf9wPlSjpiNSQR1bZ?=
 =?us-ascii?Q?pKSjn5UZHiV9BHcbUow3nA/gvvavzQLcMZqBlJkfe+peIAHxw7ffK6/N3WF0?=
 =?us-ascii?Q?pH/+9ZFoOui6EOKdI2ZAQf2NghtUGs4cgVAKY2PhRUBP/A/lVR7q/w1mlUgK?=
 =?us-ascii?Q?ektTv036etovF6an9hP2ZoNqHY2CWLplkSTmMa8qmLkFtf0OP/lP4+DIkFNC?=
 =?us-ascii?Q?p4saeTm+LT2EbJ9IA0jTtb+qZNo80WQaU5XXWcGf4weSn8CgmJgDFOK0GfQ6?=
 =?us-ascii?Q?AMozaAJKuAlnSNnojeNLBJgd475jxCtde4d8clfMFGFMw3oDrFL1KDz1tt48?=
 =?us-ascii?Q?b1xOrEmlD0ZW7YsK/GYYetigR0c5jkgHWiKCPw45KvVbNY26LYG6Ix7NN2ZC?=
 =?us-ascii?Q?mE0Aazr/wiXheEC0fRasKzl62uJATytEb+IguJ+3nFOgLsKv8W7/pZEcp1GT?=
 =?us-ascii?Q?g3DWQfayFmGGZ4M/OhxDJgJAZ+vnUahlPErWUzzEfJCuJ7eqeYr+bbmP3KuS?=
 =?us-ascii?Q?Vc083a0GnPmsAhFxksXTMD4PtuYsto2n4tvtpqAXqp4tm8t1MjWLpyG93A5R?=
 =?us-ascii?Q?a+4TkFRbDWNg1MV7dIbnfzPCSxE5bGZtCo7uJzFA+OEE40iWrtW7qe4VaOLT?=
 =?us-ascii?Q?D0ZmmrCb7IDiOOJPp/tQOvAqU03DUvRXCwFyECK8NVAEpPDqALnuCgLaQEd8?=
 =?us-ascii?Q?2UgI20hrW5KzW2SXInC2nI5Eddhohplb2CGfcOTXsSHjwaaaOtlCflDcOo3p?=
 =?us-ascii?Q?8dd/sOEOZMdUgZX6n8wng/18pSZAZbob6EuiKXIu6fTdECMEMuGpuZFgOojk?=
 =?us-ascii?Q?1DepXXnniwDlWYW84s7KiAYdHbkvlj5xrg0S8OXuPKNfNikzmtp1lpatPkYQ?=
 =?us-ascii?Q?1TADDGv0qitCl7x2d0jCFhKGbp6KXJ9FQvr4PUb7a6MJnIhTu/22lRlAlT76?=
 =?us-ascii?Q?IoVuHjK/HTy+iuRhd38zRR3VMg1w9GwthC0oJ21gRrArwOi4vbBDPlqqeFEm?=
 =?us-ascii?Q?3wpTKUrGof5Trk7rVc+IH+o+fGkwH1DdaGf0AhNAnmaBqnaA9ZRoGSh94DXZ?=
 =?us-ascii?Q?qCAv4yUwUJkyzo5CqGcoYO4O2V1E/q3tbmwys1oPY9NkKMP+nlJJpGy6AdF6?=
 =?us-ascii?Q?FVaEa6ueARoVPE5MxkoHjDRwq0rCgyukfuhKN4FxtBk894Gv0wodv3ZjhCdU?=
 =?us-ascii?Q?wQFlAhmzjMQsO9Kvylo5HK/gSlqC+YIwdEKPPfK50tloh/JSBNcPH9sgMdTn?=
 =?us-ascii?Q?11HIYvpX3RDnH3fo8uF90oNkdxaN0jprThvIUp2AUbTaURE6CZjI/aLqy2B+?=
 =?us-ascii?Q?sZCim5m7FHJm+ArW357p2CpyiUChODUG3rwDfUqRwE88d0wF3HcHKl428tW4?=
 =?us-ascii?Q?F2VfM13MxtMzwhM+/bfyU7m5p8NgU7kOKMJb61TPBgBoAaQ+rcochQX5Iyz+?=
 =?us-ascii?Q?Sh2oTZqe2gFSKA6craUkha/YeJtjr6WCG1sRmuKwaH2p9ansWq/PhKHDrJ/4?=
 =?us-ascii?Q?6J3XHDPKREBq3yWEW3wiiApMoiqqJ/5eYBDKgeAj5fxP0jjVIQ49fyjK73Xl?=
 =?us-ascii?Q?NVRGlLnUvplCzWxA6JFWrqec2cQf6r6ezgzcmiz3yyblxaJgF4LV3DDzgaeU?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e07587-0df7-4887-1b30-08dbfb38bc47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 17:35:30.0040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkZeVQnmxZDoJzMhT1hucJcNUM9a0nMpBiDsrXytUD4pr+y77vrvwbDy+kaoAjReVherLjAenz2I3CQt2vxvuR/aRbggY+6Z2+TXKpdUF50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 07:20:58PM -0500, Rodrigo Vivi wrote:
> This information is already part of the query IOCTL.
> Let's not duplicate it here in the sysfs.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 16376607c68f..0f8d3e7fce46 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -20,20 +20,6 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> -static ssize_t
> -physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
> -			      char *buf)
> -{
> -	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> -
> -	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
> -}
> -
> -static DEVICE_ATTR_RO(physical_vram_size_bytes);
> -
> -static const struct attribute *physical_memsize_attr =
> -	&dev_attr_physical_vram_size_bytes.attr;
> -
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_tile *tile = arg;
> @@ -64,15 +50,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  
>  	tile->sysfs = &kt->base;
>  
> -	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
> -		drm_warn(&xe->drm,
> -			 "Sysfs creation to read addr_range per tile failed\n");
> -
>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> -	if (err) {
> +	if (err)
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>  			 __func__, err);
> -		return;
> -	}
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
