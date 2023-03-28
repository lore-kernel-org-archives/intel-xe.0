Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD24CC6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 17:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29AA10E971;
	Tue, 28 Mar 2023 17:59:09 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA5E10E973
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 17:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680026346; x=1711562346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EYW+IZdte9kvHXLMXAV0LgIDJsye0kVjRVBfkMkm/Lo=;
 b=BeXdETOhlwNESQFX7tEyoWMZIPTG5xhA6E0QPk46QifvE7IF6VugG88J
 R2TLtbM1KlK0E7b5B7TlBQmIpzrslMKPNElgszfnlEgy7P3WHegimBSlc
 iXLOzLRcMy960gqI2GgkC+BuCYu0IX+r9RV715DkygBHK1ZoKmNC//hob
 8nzhL/bXoGtwjmaplLSgui2cAspv6VJ80dlhdeAwXb+OqZJY1w/zDlxhx
 e8XIdG/b7WYAw4KitClGPO3l03WIbwsEbGZuVrcKrlQ2577nXUTBL4IE7
 836Hu+SSHSe10YUVd9SvQyf6yuM5Unz8TOcoNVSBP11dt1CmNgouObhuX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="329105462"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="329105462"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 10:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="714347142"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="714347142"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 28 Mar 2023 10:59:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 10:59:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 10:59:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 10:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcQCFNz/YLMH/VPtzR3AFkjeJu1PqIhzPFad/CtqUsyRJZ4aJMYsTFGFx4+MMVyn+P5JNrunxwaJUGVHldW011SewCHxhD4uTOP5yiWCrQLFmHe3gzZiJmp0huy3iFUvi+HVSMhR9lLSskTfTAylFpcfiaGTTmrvqSQYJx3UUSWiWxbGvBMjoKa4dd6an5BBJ8GpxkXvMDSLUjKonP0cnzqgl9w/zhIAM8pQCQ1pH+i4PIaspxhr5YlX+Qoap9LtZ8heyGzlW5i3XZJjwCHDggGuJ4Dg2IlAprSckS5IwQ7TO/cfqnsGPY5M4zmpoPggEy41H6aq0zhl0DuxGw4MSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhkjQw1KJz4CBgJ6KcezZOEugFSNDVQCc0F0Z3pywV8=;
 b=A2NrhdWcomx5q/0PTIPXK44to2HmEgg7irfbUi4D0rTsV+HTBGgu3OqlROGxS0J/FYV8ZsIrr1p7kU1yBl+QBAqqK91VhsE97mLNiGa1oP/F4iLC9Kxl99thiRmP06xtbC0apn6Xu9m+A828ATcHOQs9fM8Li0e3WvoZlgbamsMjGg1lcpkeCP4C08lM56yUrqszX3MaMZmFoY28EIRzsc/mYMR2FDy1m1gpxOjEJUR1kyBY2Ro9n6UVkByTmDfhME3HWBKCay7ESvNd+GD9W1uQUOgG03a3l9yxOAView+Mi8ma3bNQnA/HUWFWhh86vsftIB1/n82nFGnmbG7wCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 17:59:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%5]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 17:59:01 +0000
Date: Tue, 28 Mar 2023 17:58:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZCMqu7BWZV1qCR/v@DUT025-TGLU.fm.intel.com>
References: <20230328104836.251873-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230328104836.251873-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc53c4a-167b-4ac5-4111-08db2fb61c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lC2IIn/cQfGoDVZJ8e6EgDDUGWJ1iemQegsiUe/F/9YT+Aeq1X9krQjOseScGjpyrA2O2I/goTf9gVKxP30tQeW0bg9OJrbNyku8uWh5vszrLEjrIMEO+DwGmLAccQ8RWpRqumRlGTnypaWbglJ03CcigcBfQP7PCWCHdrsCnJ9UxQgOBW0JDuzmfJJLQzIspmtaBLwiPClIbnV+v+akhWhS5UE3uEubYLyPWY+6ZNA2uPa79SyCaUzWhCs+7tnpyJBd9ScNrsPpgyuCj8Xm9uX7IHhmeSiTKDSoxkaOpshDyou/4fVQZiijeAn/Zl1jy5eDNPrFehH9I5vNwdC0gCDijndLiJle35+O4OQbIgkdOkmLUgZUZvZiMbwKMckSQIFLoPApM3tV5OWsb+ZzTvpiKhamCLnmZouX99440GiqW+BrFHXKSt++5axSZ8Gq61sFGEZL16DPoWXwnxbVFz1/WMuwu0Q0AlENJx4DmkjGVLd64bT50wyimOV7sORkiuCIeaNJQbYp0QIIJ2CPYO6aRJs842pVMbnbSl9B4LdukPyQ0uBxSCJMD6SHZksU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199021)(8936002)(316002)(41300700001)(15650500001)(82960400001)(2906002)(5660300002)(6916009)(44832011)(8676002)(478600001)(4326008)(30864003)(66946007)(66476007)(66556008)(38100700002)(86362001)(6486002)(83380400001)(186003)(6666004)(26005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WTM66KKt+DCmurKW6llTp1shyajSel9wOkWohTkDWRW+k57uv+3WV/J1GwLM?=
 =?us-ascii?Q?xmZoZpri45+tkjYEZylIDlKVkLlBWpGxAiI/UCs07BJgl/r7/5Nqkb99K4D3?=
 =?us-ascii?Q?yFVMbJzH3tmFdlOETJd7bSk2re0dT4HituQ6M5sAykCMVAeJ/iWho9/Fm8UP?=
 =?us-ascii?Q?lZeLK+xIxuOj0K2XfyYn5oF6kFBondj137gu+sCh/ehg4k65RFHwU405GHUt?=
 =?us-ascii?Q?YJ4fInu3LXk7VwIMoDHLgGBh0jNva1MurnuqBuwPfZUYHmdDqDxeQ86icJ9R?=
 =?us-ascii?Q?PDBDttwP5V73/MwAnjjKU4obwOcPA3YXIumrR0qDjlpCEOzg3YCa4ym0DtTm?=
 =?us-ascii?Q?rHH2//74bhCiZcBLDdFpPUdnpadMJvzGdJc9Dj66eainuyheCo9ZTy0KnSqP?=
 =?us-ascii?Q?ZlFKWQGdUjdgxRYC4TwKcr8cP00klVkz0K3txssc4+jjcLbgxNtjsnujkTvu?=
 =?us-ascii?Q?UBCLLRzj30j6hBTGNKSIZPAJonPmAEn6Ec7CETylPFnmcy8FjpmjzT7sDV/1?=
 =?us-ascii?Q?jmNUGwX6wy5oC369Qwe3c3HEYsE806v4e9nzr0eeC4kaYN19TVupxb1tC8Bc?=
 =?us-ascii?Q?+Af1LG2ijzOmpiRFTIwf0JRCgcX6a24hmKWkzqTc61wkafMQ4K9eF8B4Yevz?=
 =?us-ascii?Q?FqCvcpvkBXngGipVUBnRzBB5sYnd7/175x7lxO3bt8G5Q4MSfBSHoaqtEGnr?=
 =?us-ascii?Q?0IzkERJuIRqlH1OWkInrcJ0r1z5GbbOZC9QU/BIkAvKzqTzHoBN9dCIqrtEV?=
 =?us-ascii?Q?Nty2k6y5rY5opXy9HtN0nrD1vyBn1Zsxg6J+74TiqH6PD4goGN+j0NTzznkT?=
 =?us-ascii?Q?0yRWvZ6owIMWx/ShWquon7ECSJPHWtgWq7/auNFoB7hjwXZqG3pAm8byf9Wr?=
 =?us-ascii?Q?Nb3sRc3kCphk1UZtsh9mixnept+aIauo7z/K3YjY46lpOJtAOSl+VhrmIbUE?=
 =?us-ascii?Q?PlcWPUjjxIxl8ESeyt0SbMjKYJuRQM/z9hxhTauzKYaf2IiIDexzSs0AeWKg?=
 =?us-ascii?Q?pvj1NoLFERYCWP8u+8A9JhWsxYgMX9SpLyOa5h7SH+12mF+PIEhRbeiBOQir?=
 =?us-ascii?Q?7uCUj9qtkvP/8nqTZZJX5iCO/1b9mRgFQYV6cfkrTXCPRg1e8PvSX6YE8lBl?=
 =?us-ascii?Q?5OkE7vEcTr3DVM0+MbHJRAtUf5u5fqQYo12ngVrSbiVvc93ViCIAbAcUp3F6?=
 =?us-ascii?Q?iz+sbgWcY+lZkV1EOyyLLyGsvB5nD2TA3x2an03V0gicU+ScX4VYxtbTHrVr?=
 =?us-ascii?Q?s9/IrBYAhcbvVKLzV3SiZL/GWu9Bngd8rjFBfVwlJpx6CgCnSXz12pZhxZBK?=
 =?us-ascii?Q?z5IVJUsIhsP/msIrN59HM74lCMOqEZ7QPqyvJC1zf83yg2PytPOg9C6FRGM+?=
 =?us-ascii?Q?B9f/n3mG0d9ONTOOqKPFoJPwk1+g1BAhIF/cq3uFe8+fIkb4D7J24d9QpnNe?=
 =?us-ascii?Q?Su90UUOWa9oV7wsy7HK61dYklT72Op79QgGV6dV2a41sSzx7RPnTosJKBFdm?=
 =?us-ascii?Q?qj1c+PnG6qX5Jb/s32S9ESimBWJrhKHi3Dj4V8otY6X+2e3YI0wrCLVJUA5t?=
 =?us-ascii?Q?flthXMad9Kv0/njVx4j9ArwC/bM1FVcjyxDG/hqr+bhVSWGHv6iE5b+WFSJv?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc53c4a-167b-4ac5-4111-08db2fb61c92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 17:59:01.5233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXQuZhRw2H2KF1BII0yDkhyWpZIAyNe7pslhFCMqb3FGLmAVBh5m+EScspWmK4+94Bioc5k9C3L8zWZ/jyhXWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Reshuffle and validate all of the
 UAPI structs
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
Cc: intel-xe@lists.freedesktop.org, Ryan Houdek <sonicadvance1@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 12:48:36PM +0200, Maarten Lankhorst wrote:
> Verified through pahole:
> I've created a hdrtest.c with these contents:
> 
> struct xe_user_extension               __PASTE(dummy, __LINE__);
> struct drm_xe_engine_class_instance    __PASTE(dummy, __LINE__);
> struct drm_xe_query_mem_usage          __PASTE(dummy, __LINE__);
> struct drm_xe_query_config             __PASTE(dummy, __LINE__);
> struct drm_xe_query_gts                __PASTE(dummy, __LINE__);
> struct drm_xe_query_topology_mask      __PASTE(dummy, __LINE__);
> struct drm_xe_device_query             __PASTE(dummy, __LINE__);
> struct drm_xe_gem_create               __PASTE(dummy, __LINE__);
> struct drm_xe_gem_mmap_offset          __PASTE(dummy, __LINE__);
> struct drm_xe_vm_bind_op_error_capture __PASTE(dummy, __LINE__);
> struct drm_xe_ext_vm_set_property      __PASTE(dummy, __LINE__);
> struct drm_xe_vm_create                __PASTE(dummy, __LINE__);
> struct drm_xe_vm_destroy               __PASTE(dummy, __LINE__);
> struct drm_xe_vm_bind_op               __PASTE(dummy, __LINE__);
> struct drm_xe_vm_bind                  __PASTE(dummy, __LINE__);
> struct drm_xe_ext_engine_set_property  __PASTE(dummy, __LINE__);
> struct drm_xe_engine_set_property      __PASTE(dummy, __LINE__);
> struct drm_xe_engine_create            __PASTE(dummy, __LINE__);
> struct drm_xe_engine_get_property      __PASTE(dummy, __LINE__);
> struct drm_xe_engine_destroy           __PASTE(dummy, __LINE__);
> struct drm_xe_sync                     __PASTE(dummy, __LINE__);
> struct drm_xe_exec                     __PASTE(dummy, __LINE__);
> struct drm_xe_mmio                     __PASTE(dummy, __LINE__);
> struct drm_xe_wait_user_fence          __PASTE(dummy, __LINE__);
> struct drm_xe_vm_madvise               __PASTE(dummy, __LINE__);
> 
> and then ran the resulting .o file through pahole.
> 
> All padding holes are gone on 64-bits, some through extending the width
> of some members, others by reorganizing, and even more by explicitly
> adding padding.
> 
> I'm also ensuring xe verifies that all pad and reserved members are
> zero in each ioctl implementation.
> 

Thanks for doin this, LGTM but this will break our IGTs and UMDs. Can
you also post a IGT oatch + coordinate the merges? Also notify our UMD
friends to pull the latest header after this merges.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Suggested-by: Ryan Houdek <sonicadvance1@gmail.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c              |  6 ++-
>  drivers/gpu/drm/xe/xe_engine.c          | 19 +++++--
>  drivers/gpu/drm/xe/xe_exec.c            |  4 +-
>  drivers/gpu/drm/xe/xe_mmio.c            |  3 +-
>  drivers/gpu/drm/xe/xe_query.c           |  3 +-
>  drivers/gpu/drm/xe/xe_sync.c            |  4 +-
>  drivers/gpu/drm/xe/xe_vm.c              | 21 ++++++--
>  drivers/gpu/drm/xe/xe_vm_madvise.c      |  3 +-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 +-
>  include/uapi/drm/xe_drm.h               | 68 +++++++++++++++++--------
>  10 files changed, 98 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e4d079b61d52..b78f9d11d895 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1505,7 +1505,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	u32 handle;
>  	int err;
>  
> -	if (XE_IOCTL_ERR(xe, args->extensions))
> +	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_ERR(xe, args->flags &
> @@ -1575,7 +1576,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	struct drm_xe_gem_mmap_offset *args = data;
>  	struct drm_gem_object *gem_obj;
>  
> -	if (XE_IOCTL_ERR(xe, args->extensions))
> +	if (XE_IOCTL_ERR(xe, args->extensions) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_ERR(xe, args->flags))
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 37209b13bcd6..d576f3c9d843 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -348,7 +348,8 @@ static int engine_user_ext_set_property(struct xe_device *xe,
>  		return -EFAULT;
>  
>  	if (XE_IOCTL_ERR(xe, ext.property >=
> -			 ARRAY_SIZE(engine_set_property_funcs)))
> +			 ARRAY_SIZE(engine_set_property_funcs)) ||
> +	    XE_IOCTL_ERR(xe, ext.pad))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(engine_set_property_funcs));
> @@ -380,7 +381,8 @@ static int engine_user_extensions(struct xe_device *xe, struct xe_engine *e,
>  	if (XE_IOCTL_ERR(xe, err))
>  		return -EFAULT;
>  
> -	if (XE_IOCTL_ERR(xe, ext.name >=
> +	if (XE_IOCTL_ERR(xe, ext.pad) ||
> +	    XE_IOCTL_ERR(xe, ext.name >=
>  			 ARRAY_SIZE(engine_user_extension_funcs)))
>  		return -EINVAL;
>  
> @@ -523,7 +525,8 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  	int len;
>  	int err;
>  
> -	if (XE_IOCTL_ERR(xe, args->flags))
> +	if (XE_IOCTL_ERR(xe, args->flags) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	len = args->width * args->num_placements;
> @@ -655,6 +658,10 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
>  	struct drm_xe_engine_get_property *args = data;
>  	struct xe_engine *e;
>  
> +	if (XE_IOCTL_ERR(xe, args->extensions) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
>  	mutex_lock(&xef->engine.lock);
>  	e = xa_load(&xef->engine.xa, args->engine_id);
>  	mutex_unlock(&xef->engine.lock);
> @@ -734,7 +741,8 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, void *data,
>  	struct drm_xe_engine_destroy *args = data;
>  	struct xe_engine *e;
>  
> -	if (XE_IOCTL_ERR(xe, args->pad))
> +	if (XE_IOCTL_ERR(xe, args->pad) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	mutex_lock(&xef->engine.lock);
> @@ -765,6 +773,9 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
>  	int ret;
>  	u32 idx;
>  
> +	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
>  	e = xe_engine_lookup(xef, args->engine_id);
>  	if (XE_IOCTL_ERR(xe, !e))
>  		return -ENOENT;
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index ea869f2452ef..0ffbb8f8f4df 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -160,7 +160,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	bool write_locked;
>  	int err = 0;
>  
> -	if (XE_IOCTL_ERR(xe, args->extensions))
> +	if (XE_IOCTL_ERR(xe, args->extensions) ||
> +	    XE_IOCTL_ERR(xe, args->pad) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	engine = xe_engine_lookup(xef, args->engine_id);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 5cacaa05759a..dc8da9c1a040 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -409,7 +409,8 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  	bool allowed;
>  	int ret = 0;
>  
> -	if (XE_IOCTL_ERR(xe, args->extensions))
> +	if (XE_IOCTL_ERR(xe, args->extensions) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_MMIO_FLAGS))
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index dd64ff0d2a57..97742d003c8a 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -374,7 +374,8 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct drm_xe_device_query *query = data;
>  	u32 idx;
>  
> -	if (XE_IOCTL_ERR(xe, query->extensions != 0))
> +	if (XE_IOCTL_ERR(xe, query->extensions ||
> +	    XE_IOCTL_ERR(xe, query->reserved[0] || query->reserved[1])))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_ERR(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 99f1ed87196d..3c9ac74970c5 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -110,7 +110,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		return -EFAULT;
>  
>  	if (XE_IOCTL_ERR(xe, sync_in.flags &
> -			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
> +			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)) ||
> +	    XE_IOCTL_ERR(xe, sync_in.pad) ||
> +	    XE_IOCTL_ERR(xe, sync_in.reserved[0] || sync_in.reserved[1]))
>  		return -EINVAL;
>  
>  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdf82d34eb66..3d70ca235ba3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1774,7 +1774,9 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
>  		return -EFAULT;
>  
>  	if (XE_IOCTL_ERR(xe, ext.property >=
> -			 ARRAY_SIZE(vm_set_property_funcs)))
> +			 ARRAY_SIZE(vm_set_property_funcs)) ||
> +	    XE_IOCTL_ERR(xe, ext.pad) ||
> +	    XE_IOCTL_ERR(xe, ext.reserved[0] || ext.reserved[1]))
>  		return -EINVAL;
>  
>  	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
> @@ -1802,7 +1804,8 @@ static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
>  	if (XE_IOCTL_ERR(xe, err))
>  		return -EFAULT;
>  
> -	if (XE_IOCTL_ERR(xe, ext.name >=
> +	if (XE_IOCTL_ERR(xe, ext.pad) ||
> +	    XE_IOCTL_ERR(xe, ext.name >=
>  			 ARRAY_SIZE(vm_user_extension_funcs)))
>  		return -EINVAL;
>  
> @@ -1833,6 +1836,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	int err;
>  	u32 flags = 0;
>  
> +	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
>  	if (XE_IOCTL_ERR(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>  		return -EINVAL;
>  
> @@ -1916,7 +1922,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	struct drm_xe_vm_destroy *args = data;
>  	struct xe_vm *vm;
>  
> -	if (XE_IOCTL_ERR(xe, args->pad))
> +	if (XE_IOCTL_ERR(xe, args->pad) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	vm = xe_vm_lookup(xef, args->vm_id);
> @@ -2866,6 +2873,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  	int i;
>  
>  	if (XE_IOCTL_ERR(xe, args->extensions) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]) ||
>  	    XE_IOCTL_ERR(xe, !args->num_binds) ||
>  	    XE_IOCTL_ERR(xe, args->num_binds > MAX_BINDS))
>  		return -EINVAL;
> @@ -2898,6 +2906,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  		u64 obj_offset = (*bind_ops)[i].obj_offset;
>  		u32 region = (*bind_ops)[i].region;
>  
> +		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
> +		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
> +				     (*bind_ops)[i].reserved[1])) {
> +			err = -EINVAL;
> +			goto free_bind_ops;
> +		}
> +
>  		if (i == 0) {
>  			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
>  		} else if (XE_IOCTL_ERR(xe, !*async) ||
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 29815852985a..c7e3ae7203d7 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -301,7 +301,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  	struct xe_vma **vmas = NULL;
>  	int num_vmas = 0, err = 0, idx;
>  
> -	if (XE_IOCTL_ERR(xe, args->extensions))
> +	if (XE_IOCTL_ERR(xe, args->extensions) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_ERR(xe, args->property > ARRAY_SIZE(madvise_funcs)))
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 15c2e5aa08d2..eef989647bb0 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -100,7 +100,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
>  	unsigned long timeout = args->timeout;
>  
> -	if (XE_IOCTL_ERR(xe, args->extensions))
> +	if (XE_IOCTL_ERR(xe, args->extensions) ||
> +	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_FLAGS))
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b0b80aae3ee8..13b50198ba04 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -91,7 +91,7 @@ struct xe_user_extension {
>  	 */
>  	__u32 name;
>  	/**
> -	 * @flags: MBZ
> +	 * @pad: MBZ
>  	 *
>  	 * All undefined bits must be zero.
>  	 */
> @@ -137,7 +137,7 @@ struct xe_user_extension {
>  #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>  
>  struct drm_xe_engine_class_instance {
> -	__u16 engine_class;
> +	__u32 engine_class;
>  
>  #define DRM_XE_ENGINE_CLASS_RENDER		0
>  #define DRM_XE_ENGINE_CLASS_COPY		1
> @@ -291,6 +291,13 @@ struct drm_xe_gem_create {
>  	 */
>  	__u32 handle;
>  
> +	/**
> +	 * @pad: MBZ
> +	 *
> +	 * All undefined bits must be zero.
> +	 */
> +	__u32 pad;
> +
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
>  };
> @@ -335,6 +342,9 @@ struct drm_xe_ext_vm_set_property {
>  #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>  	__u32 property;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	/** @value: property value */
>  	__u64 value;
>  
> @@ -379,6 +389,9 @@ struct drm_xe_vm_bind_op {
>  	 */
>  	__u32 obj;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	union {
>  		/**
>  		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
> @@ -469,6 +482,12 @@ struct drm_xe_vm_bind {
>  	/** @num_binds: number of binds in this IOCTL */
>  	__u32 num_binds;
>  
> +	/** @num_syncs: amount of syncs to wait on */
> +	__u32 num_syncs;
> +
> +	/** @syncs: pointer to struct drm_xe_sync array */
> +	__u64 syncs;
> +
>  	union {
>  		/** @bind: used if num_binds == 1 */
>  		struct drm_xe_vm_bind_op bind;
> @@ -479,12 +498,6 @@ struct drm_xe_vm_bind {
>  		__u64 vector_of_binds;
>  	};
>  
> -	/** @num_syncs: amount of syncs to wait on */
> -	__u32 num_syncs;
> -
> -	/** @syncs: pointer to struct drm_xe_sync array */
> -	__u64 syncs;
> -
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
>  };
> @@ -497,6 +510,9 @@ struct drm_xe_ext_engine_set_property {
>  	/** @property: property to set */
>  	__u32 property;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	/** @value: property value */
>  	__u64 value;
>  };
> @@ -604,8 +620,12 @@ struct drm_xe_sync {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> +	/** @flags: One of DRM_XE_SYNC_* flags */
>  	__u32 flags;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  #define DRM_XE_SYNC_SYNCOBJ		0x0
>  #define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
>  #define DRM_XE_SYNC_DMA_BUF		0x2
> @@ -613,7 +633,7 @@ struct drm_xe_sync {
>  #define DRM_XE_SYNC_SIGNAL		0x10
>  
>  	union {
> -		__u32 handle;
> +		__u64 handle;
>  		/**
>  		 * @addr: Address of user fence. When sync passed in via exec
>  		 * IOCTL this a GPU address in the VM. When sync passed in via
> @@ -654,7 +674,10 @@ struct drm_xe_exec {
>  	 * @num_batch_buffer: number of batch buffer in this exec, must match
>  	 * the width of the engine
>  	 */
> -	__u16 num_batch_buffer;
> +	__u32 num_batch_buffer;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -664,8 +687,10 @@ struct drm_xe_mmio {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> +	/** @addr: Address in mmio space to do an op on */
>  	__u32 addr;
>  
> +	/** @flags: Combination of DRM_XE_MMIO_* flags */
>  	__u32 flags;
>  
>  #define DRM_XE_MMIO_8BIT	0x0
> @@ -712,12 +737,13 @@ struct drm_xe_wait_user_fence {
>  #define DRM_XE_UFENCE_WAIT_GTE	3
>  #define DRM_XE_UFENCE_WAIT_LT	4
>  #define DRM_XE_UFENCE_WAIT_LTE	5
> -	__u16 op;
> +	__u32 op;
>  	/** @flags: wait flags */
>  #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
>  #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
>  #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
> -	__u16 flags;
> +	__u32 flags;
> +
>  	/** @value: compare value */
>  	__u64 value;
>  	/** @mask: comparison mask */
> @@ -747,15 +773,21 @@ struct drm_xe_vm_madvise {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -	/** @vm_id: The ID VM in which the VMA exists */
> -	__u32 vm_id;
> -
>  	/** @range: Number of bytes in the VMA */
>  	__u64 range;
>  
>  	/** @addr: Address of the VMA to operation on */
>  	__u64 addr;
>  
> +	/** @vm_id: The ID VM in which the VMA exists */
> +	__u32 vm_id;
> +
> +	/** @property: property to set (DRM_XE_VM_MADVISE_*) */
> +	__u32 property;
> +
> +	/** @value: property value */
> +	__u64 value;
> +
>  	/*
>  	 * Setting the preferred location will trigger a migrate of the VMA
>  	 * backing store to new location if the backing store is already
> @@ -791,12 +823,6 @@ struct drm_xe_vm_madvise {
>  	/* Pin the VMA in memory, must be elevated user */
>  #define DRM_XE_VM_MADVISE_PIN			6
>  
> -	/** @property: property to set */
> -	__u32 property;
> -
> -	/** @value: property value */
> -	__u64 value;
> -
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
>  };
> -- 
> 2.34.1
> 
