Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66427C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 20:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB9A10E339;
	Tue, 28 Nov 2023 20:51:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497A510E33B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 20:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701204684; x=1732740684;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+xlQVm6pc7NeBKlySr1ts7HHe+F6tCiANipfAF2++To=;
 b=XcnfqzSutFbvQ/0Q76OgXh4GRAac5jlSxvjcURctyXq/TrBpDW8lX1nf
 FLl+jt//zxMbYgQX8Uz8kGlRjckeNSz4u3noi1nk5frCB5dkEIlJiRSs4
 8mFEdt5qgx2ZjCOpPA6nEZUiIF0hBqT8LZmrBRHqeybbCP/OB5BBlHwlJ
 3kNEDYhBp6SjAZpuFEwUP19iIrE+Fjmz/07taNM5FEHs4dRI7mcp5Drzr
 SpsywKxQObVXu7BjCie8rdZ0huxJsgIOQuqFelgul1dqpda6IVvYHNojS
 CxAjkXRFNgPZwyJ+0bgzPnirSzjQnEl6EwHKNmUl4lvge6fPt++n9hAGE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373207890"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="373207890"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="10111748"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 12:51:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 12:51:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 12:51:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 12:51:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGLD3vV9VqZbqurzEM0pzVJbBmyJ/fymJSe43uHIYKOhq2BDD8UxzQWqIxST6WfDEXwLE/tpQnZLV5PxUNLF39nR2VNlSQ0JvgiEXR3go09hczqnr5MpaRvV0duUodyjmqxWcqL4RtALT1zvauE4vXGxdnfCMQcP9xfiR1ANJoJGDLi3MRHTR+hm7kL6mNX2tPwqpCJpkCDkG5qTA6DOzYK13rmvToySE2MdS6XK7CuCSb2V4kSpO6QR73IE4JHgtZsoLBWMzPE6i02Q7EVbGMarMVIAKhtgLkqMHyppBZ2UJME/h7rgMj2hgZ3TqIOXmU5mJaGipVRcSpdYXO0mqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxrY2DZjzxC8HecfBd/cbUiYEBeRipyo4skblz2gGnk=;
 b=NXtTpVZEKXgDjGl9B1F54mh7DjqoHWGX5enjcyFi0Cx65B9nwNhov3l+v7oBMcComzi2uZ0ieuD0LdblN4UWUYeFr/p0/yy55pQhY3LEC3oF8IE0TpmWKY+YKs9b4zXBJJVnSAsHrtwXbCYj3/G3wZZ2Oz4GHoS4qSTafsKQWN6ApvPaoq7Uw3dPY+RGF9DbJH3kNWSLfnDedjDn2W04+1Jm5T6aeO3Hox4tDrhO5PmWTEAUDe20aiEmeSDeVxjpr3xyjmJRrFeHvdoxa9fgVL7IWuFN06LJdPWXH+f8NwK63oJ+4vy60KTvYVk4Rd83eud7xn5iaPCDnV3/1cQEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 20:51:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 20:51:16 +0000
Date: Tue, 28 Nov 2023 15:51:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZWZSwQXvcAB5v9fW@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-6-francois.dugast@intel.com>
 <3c34b03bd2bab567ca6891b095332a2f2b4ddc29.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c34b03bd2bab567ca6891b095332a2f2b4ddc29.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ea1f95-f6a0-4486-86de-08dbf053c40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YvD4CPxXwBLsDy0xaJfg0c7Y/EhTRcMDRK8Tjj5X/DV0BxGwfH/r8XVnVWZA0y66SppgY83DzCxr8VDzs1qi/KFQcBroxEiLusTUTnAM3Hk86rHzbmdxcGRd2RjxqR2SWoB0BghkabjKDLvL5B2nlfAmGoCIJZe/PIiAHVDk6GXxaVxRLtYyB7XfM/AclGQqoESDdiENcEvZKnZ2MfsFHxizpSXbC6MshuHhp32VBQ81zRJWb7QY285Xb2g3KiD410ZGik2RRyfav/Pq3jSRr6S3ioRZZBfkthk7jj3mxDsB/mOR7e1SZwCEG8GknWW2+1WsDqC9WF8TM+JxyoJbx7rcAktmJf/w0k/8Xz7Yf86M6B0wDB5amQ3souu70YevHK9E5WjkyXITmyTjxaglxmDYAS9I+iuV8TZ2SbgERiGow6H+nqxq2L6VFlD1uJz78qbXTfBayvHDtmD+CH2OII939BKTcUgsjWekG6RjEeaLSDHjg0wTvLQVNUEuXHfToY4gvhmsJtCBf5YjPtAZbpXDZpm/jnVfWzX/ui1tB4fhEQT2nzszFg+qNEqJaozScPTpOZYpLat59MP+ozp9oaeZC9yXICX3K1kcSD+bBYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6486002)(82960400001)(36756003)(41300700001)(478600001)(4326008)(8936002)(8676002)(6506007)(6862004)(37006003)(86362001)(6636002)(107886003)(316002)(26005)(66946007)(38100700002)(54906003)(66476007)(83380400001)(2616005)(66556008)(6512007)(6666004)(44832011)(4001150100001)(2906002)(5660300002)(43043002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aLdPENrb/H3UBxNhMl/qW6oC3FeS7wUomH+YUHOLExgbbF1WZY0+p9+PNP?=
 =?iso-8859-1?Q?1e70Bls7Yk1hPObIvUKnM7LW5LEBopoE9yupYokM56iHU3ovA1WntlVi/s?=
 =?iso-8859-1?Q?bpLBoW5Hoy/jGMobG+3k85fHwcV08J/gIJsxdq51zazpRMy5IXbzpTyt92?=
 =?iso-8859-1?Q?jYvNCxmttoIQ3Yuhb6cakd44SqejHTvjlHoEzSbpZfLIQp36zcpkdEbp5u?=
 =?iso-8859-1?Q?AnYIWTTJEJYppPMLviKjlzhACpMi2MAaOq3Vq7eumwyONdzwNTp9Gxc6Ay?=
 =?iso-8859-1?Q?sVUvaD72q9k9POWLGUJEVE47gZcWCzRu/QjGMY2YBYg5cyxT5eJjSb4B4l?=
 =?iso-8859-1?Q?3pOx0A/nE4f4Rr2/4tU4Y0tm9fl4VgiAHDoRQQUCzkVwGqMQ9CG5A+mvQb?=
 =?iso-8859-1?Q?Ss3bmcdhNIcKHZ3EZKTK2cYjaSaFZe2WCiRJ5fO9XzTX/l5f4RP1QY+L1z?=
 =?iso-8859-1?Q?Y5wms9XVZhPoTjQqEcZ6U1oOYiS2OHNCwo8uy9aceyqf9Y7zsOc8XoUZMg?=
 =?iso-8859-1?Q?l6nSe8cbx9WPnENOKvyAnBkNtsycWn5L7nZ/O8013Y6mYg/jwmf1XHNqVH?=
 =?iso-8859-1?Q?aHXnRA1LnlTq6b9QUSWjK9tYJ/N0ReXIRJjbHtiKMQubpNNDcY4NA2oD27?=
 =?iso-8859-1?Q?7s3XRZGWgFh/53+1/P+q8NcEEzPSzgKgAl5b+aWXv3GFCgICVU2kYgmCbH?=
 =?iso-8859-1?Q?m/NhluGneEPkzT4TPbLS6li4MimCAGYtC8p3Ezu4utUwjZ5O32cmyXUNVU?=
 =?iso-8859-1?Q?p2of7TyUIGk3QPT+xK4votpJ1TC3RiYPJTDbGMPqWF42TVYI3VsylrJ6DX?=
 =?iso-8859-1?Q?cYzobWazHpD5dK/okrZXwNVUe6TGTe9vOmnQ//kYuVJfmCujL6eeMvdzjx?=
 =?iso-8859-1?Q?7zG9UbSJGhAPpI70LEJA/6t9UOGhBKUdua8C5jJ3n2UwXFJUqju+lijO2+?=
 =?iso-8859-1?Q?CIlzkYHcEEwg4/iB9dFESvWjLnQ7ev9IP8S4r5gSsj/HdUqV92l03K/QEW?=
 =?iso-8859-1?Q?NuU39TbhyZ8s1JMkxFo7HGOh3ZDjsPkqBOMxZ5XcYYlKXtEp5nKpw8Yo/I?=
 =?iso-8859-1?Q?n1JMD9ni6qCWLaCgJrC7mqsy34PPOfpKYI2+hH7JCnxXgrorFp66zXogKl?=
 =?iso-8859-1?Q?kXFG4NTLJfjcZ9ueWsuaTLAIH1J5hPkzIazpVnJPUGEmc1SKkFgOmzfsGc?=
 =?iso-8859-1?Q?cPtOB5YAbDlOaqJFj3gq854qBQttenz0tJ0L9vN/bCi7Ba8ZYCLv4dIemc?=
 =?iso-8859-1?Q?HIQS9bUC9Ihvxvh3afheeE418jl7BVr34aucUkldIbWFrEHKJpij+4d1gY?=
 =?iso-8859-1?Q?wd8CCO5hfi3Sy+8m67jyWr6CoTxUS5lz8vgA3jexSCk8lxOcDvhwAPsjpa?=
 =?iso-8859-1?Q?HvVlUj3i6jESeeZc1gYALez4Ob2AtRQRdwFbRILO4rmc4j8SZNHoX4FrS+?=
 =?iso-8859-1?Q?GD1BkJAZ7ar1xU71b5LYMsIkwGcoxHAD9qtZA2fSCuFors/S+/XKc8wtJq?=
 =?iso-8859-1?Q?CyyUMKnuNZTLjrpfpdrC1VUNcGQfaxMY5y4AmUJJz4zMNZSdsXPKQU6P66?=
 =?iso-8859-1?Q?iE8ARKAn3347rlAmXm8cAg5ejWeqQDfXeYL0E4kDvL9qGzlLc1CkMpC4ml?=
 =?iso-8859-1?Q?yZuW+lq2YnfTqg2IImCplTk+JQeV89HWTv6pZkzbn5lgXHH8LXuAkKEg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ea1f95-f6a0-4486-86de-08dbf053c40c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 20:51:16.8240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7L6PjLx5n0BTBP+QZzIkjweY+mL8hdmSO9l4mZNBTzo6Bfiq5KTrtlmFiVWHuFRqE0vuhayuNvOGNU2l59NaHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/14] drm/xe/uapi: Align on a common way
 to return arrays (memory regions)
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 24, 2023 at 06:19:47PM +0000, Souza, Jose wrote:
> On Wed, 2023-11-22 at 14:38 +0000, Francois Dugast wrote:
> > The uAPI provides queries which return arrays of elements. As of now
> > the format used in the struct is different depending on which element
> > is queried. Fix this for memory regions by applying the pattern below:
> > 
> >     struct drm_xe_query_Xs {
> >        __u32 num_Xs;
> >        struct drm_xe_X Xs[];
> >        ...
> >     }
> > 
> > This removes "query" in the name of struct drm_xe_query_mem_region
> > as it is not returned from the query IOCTL. There is no functional
> > change.
> > 
> > v2: Only rename drm_xe_query_mem_region to drm_xe_mem_region
> >     (José Roberto de Souza)
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 36 ++++++++++++++++++-----------------
> >  include/uapi/drm/xe_drm.h     | 12 ++++++------
> >  2 files changed, 25 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 0cbfeaeb1330..f321ed4d3b0b 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -240,11 +240,11 @@ static size_t calc_mem_regions_size(struct xe_device *xe)
> >  		if (ttm_manager_type(&xe->ttm, i))
> >  			num_managers++;
> >  
> > -	return offsetof(struct drm_xe_query_mem_regions, regions[num_managers]);
> > +	return offsetof(struct drm_xe_query_mem_regions, mem_regions[num_managers]);
> >  }
> >  
> >  static int query_mem_regions(struct xe_device *xe,
> > -			     struct drm_xe_device_query *query)
> > +			    struct drm_xe_device_query *query)
> >  {
> >  	size_t size = calc_mem_regions_size(xe);
> >  	struct drm_xe_query_mem_regions *usage;
> > @@ -265,36 +265,38 @@ static int query_mem_regions(struct xe_device *xe,
> >  		return -ENOMEM;
> >  
> >  	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
> > -	usage->regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
> > -	usage->regions[0].instance = 0;
> > -	usage->regions[0].min_page_size = PAGE_SIZE;
> > -	usage->regions[0].total_size = man->size << PAGE_SHIFT;
> > +	usage->mem_regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
> 
> nit: can you also rename 'usage' to something else, it was named 'usage' because of the old query name.

my bad for having forgotten this 'usage' in here. Let's fix that in a follow-up after this series is merged.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> 
> > +	usage->mem_regions[0].instance = 0;
> > +	usage->mem_regions[0].min_page_size = PAGE_SIZE;
> > +	usage->mem_regions[0].total_size = man->size << PAGE_SHIFT;
> >  	if (perfmon_capable())
> > -		usage->regions[0].used = ttm_resource_manager_usage(man);
> > -	usage->num_regions = 1;
> > +		usage->mem_regions[0].used = ttm_resource_manager_usage(man);
> > +	usage->num_mem_regions = 1;
> >  
> >  	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> >  		man = ttm_manager_type(&xe->ttm, i);
> >  		if (man) {
> > -			usage->regions[usage->num_regions].mem_class =
> > +			usage->mem_regions[usage->num_mem_regions].mem_class =
> >  				DRM_XE_MEM_REGION_CLASS_VRAM;
> > -			usage->regions[usage->num_regions].instance =
> > -				usage->num_regions;
> > -			usage->regions[usage->num_regions].min_page_size =
> > +			usage->mem_regions[usage->num_mem_regions].instance =
> > +				usage->num_mem_regions;
> > +			usage->mem_regions[usage->num_mem_regions].min_page_size =
> >  				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
> >  				SZ_64K : PAGE_SIZE;
> > -			usage->regions[usage->num_regions].total_size =
> > +			usage->mem_regions[usage->num_mem_regions].total_size =
> >  				man->size;
> >  
> >  			if (perfmon_capable()) {
> >  				xe_ttm_vram_get_used(man,
> > -						     &usage->regions[usage->num_regions].used,
> > -						     &usage->regions[usage->num_regions].cpu_visible_used);
> > +						     &usage->mem_regions
> > +						     [usage->num_mem_regions].used,
> > +						     &usage->mem_regions
> > +						     [usage->num_mem_regions].cpu_visible_used);
> >  			}
> >  
> > -			usage->regions[usage->num_regions].cpu_visible_size =
> > +			usage->mem_regions[usage->num_mem_regions].cpu_visible_size =
> >  				xe_ttm_vram_get_cpu_visible_size(man);
> > -			usage->num_regions++;
> > +			usage->num_mem_regions++;
> >  		}
> >  	}
> >  
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index da10d946930b..a9bbdf141fe2 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -182,10 +182,10 @@ enum drm_xe_memory_class {
> >  };
> >  
> >  /**
> > - * struct drm_xe_query_mem_region - Describes some region as known to
> > + * struct drm_xe_mem_region - Describes some region as known to
> >   * the driver.
> >   */
> > -struct drm_xe_query_mem_region {
> > +struct drm_xe_mem_region {
> >  	/**
> >  	 * @mem_class: The memory class describing this region.
> >  	 *
> > @@ -322,12 +322,12 @@ struct drm_xe_query_engine_cycles {
> >   * struct drm_xe_query_mem_regions in .data.
> >   */
> >  struct drm_xe_query_mem_regions {
> > -	/** @num_regions: number of memory regions returned in @regions */
> > -	__u32 num_regions;
> > +	/** @num_mem_regions: number of memory regions returned in @mem_regions */
> > +	__u32 num_mem_regions;
> >  	/** @pad: MBZ */
> >  	__u32 pad;
> > -	/** @regions: The returned regions for this device */
> > -	struct drm_xe_query_mem_region regions[];
> > +	/** @mem_regions: The returned memory regions for this device */
> > +	struct drm_xe_mem_region mem_regions[];
> >  };
> >  
> >  /**
> 
