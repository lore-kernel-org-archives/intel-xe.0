Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C3BC0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 14:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4B110E3DC;
	Tue, 25 Jul 2023 14:07:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BC710E3DC
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690294030; x=1721830030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jIsUDc8a+9xrvfbbZhyXkXPYqmXwV0DTyWSyhDmNzDA=;
 b=P7vtMT64kyT83ZLcO6uVPtoEBEsLsNbnK8ACDj8634QkL1HXJImDV5TH
 how2de041W/L41A+SaXJCnV/TjO/EphpZ0M+IZeskhwWUFVCwMIcCBxDQ
 3ZBO6/AlyjTkM5zvL8/P2jAKwLeFOvPdZJ4txIJP3ivQwhcQBLCIgEdLh
 VcBGSq4aY7ZqVCCt3eIzXSO66eFGuAgUOODduon43owMfDaBBpvgQZ9+U
 7duQRrTd7nv1ELyWLSZKoFRXyccdAyxEhisDnZ/vBktrd49f93Vr5L2lk
 JSgbtTlqMxbLuyBJiqMJ0JKV+1kY3WRC5qdsO0I0Z8R2aBVRZfR1nSNL6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370402073"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="370402073"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 07:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="899950461"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="899950461"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 25 Jul 2023 07:07:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 07:07:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 07:07:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 07:07:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxKOIBsHqr6C7f3ebE2eXBAywCedGU1TM9mZCwZ6oh2iYXdgk5d06BaMmggSKJkuJCi7Xslurr88lo2mB3G4hE5hz/UMUMSCDD3NW7ud4IGheH0+eyTF4xg7N3ZDiEFyqjkgAaJkoKN/4SPrDXGfwsgmYoB0y2tqFxmFP9+wE5uDmv+KsrFNj//hd2JzCGqBsCjyF651RBJokLEPvcw9H/MGZZ/L2zMXk6G+UJQobvyD/dlqjWjLlhebbCpI3R8DSZxaiw4cuWftRnB3cSY2aZgFuyXWDshtT3LMFkQS7A5Vvzxw5VEbJNItx2DR4wZbMVuTOr+dO5tuAR1Nr3+YRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoyokNodkgg6OJtQeMJhUfmMADUtwZ5JtWgfeRTAZh8=;
 b=Y4KlmNkIzr4E8WwNxolQLqq/rllKZpsVbslxzsen0had21CGFx7A2yc5geMiolGucKHJQUxoWk1f8BeEffQi2pjWvR/JcKYAZMGPYv4dT19+hh+lZtrruUIQ3Og1Qagv4YqiLXP7KjMjxgI66lGbRw90DC5KHRYv+/iYx9ZYbNwpBSsQeVOU47wzpAZ/ByYb6OvWlhMUFBhMUnq7PCSPZMOvv8euM0/gAxa/goKSB98vpS8/Oex5agQPxRQ6fwFfU38nG85EsioXUK755OSgCxC/OqaKsgxQodiiM18TgKEAGY88ukBk6RU9945pCgaun5mIXFnLQcLQx4Rhp5tX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 14:07:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 14:07:04 +0000
Date: Tue, 25 Jul 2023 10:07:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZL/XBN7wCqeEKLn2@intel.com>
References: <20230725110116.114688-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725110116.114688-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ae43f2-7c18-4e6f-8e2b-08db8d186c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AGZglD3TW9aGUHeJ+bTpsuYLX0DiStlhZVfbA/4yySS90eIGSANge5FFfe+zToIJUE+9EsUF8vQ2A7MueSFimRXfhqDvKZ819KZRGaNE7qw8Gs2qWDX5sftTZfnvlfiIhQMx3RvN8HdB1xqEmmnydmsbvmbwfEKZK0cY9PuIAYCxn2hIlrJ8mtKvPPvwW8jyIZLepohcgQyfx8R9gocNS2ak2zUoPURdhR1vjfGz2KwxpxAJEix1ya0KI0CH9RYX4vXFdaskJMTUGI67ZtLSmSlylTEv8KlCIH54ysQAbGzZopem1u0N9nyobNvybs1X/fPey6en9pMPjF6XnuD2vcHEzcmBVmXPoFJ3FFnwgkJHmQCz+z34jujd58P8rj26BHIfYhFvKc9AYD9NRlAIXwjtLFDijyX/IUYvSh+b86G1HqzCDpix0OBiys8FXXst7d1qtfS8GQ9uG+vU44J7w1e567zg8sfKDLBkgZ5aTlrIgrcaj6zj2QVxd0AeIxhNdUSMacRSogbP9fVRwhk9Urop7i909Fv4Y2hJ43xObks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199021)(2616005)(26005)(186003)(6506007)(83380400001)(66476007)(66556008)(66946007)(316002)(4326008)(6636002)(8936002)(8676002)(6862004)(44832011)(41300700001)(5660300002)(966005)(6486002)(6512007)(6666004)(2906002)(37006003)(478600001)(38100700002)(82960400001)(36756003)(86362001)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/HoxJECbqc7rJxTLsJHoipcuMlm7Wm5aFxQ33Ye7d6wbBQiDXxy8eGKZRoNa?=
 =?us-ascii?Q?CgjpfjBfezOyeyOPDJJYbR5Z7iwRD+1WpQlO6uqBhqvsFnNVBdEO2gi4tnKb?=
 =?us-ascii?Q?57rbarfWq+4/Wrk/0n+okOUWdSx+Aq3WCD1z9VuXIju8wBdQYkjnR3F+nUXj?=
 =?us-ascii?Q?TK0456UtyOHRzrAGeyoM7JnSuKv+tvo7y9cCIIVt4PxzFN0ghF3C5wGCpuai?=
 =?us-ascii?Q?GR8bbhzc601FgcJvc2x2jQDmzpgXt5IHHHDCQ/YZg6oFWPahZUa2tGPO0hB1?=
 =?us-ascii?Q?LiDZQ+pYbo7F2qJXsCAaoYY9bpH/EpVy0Fiw2P8JwXj8SF+bRM/hcVfYhkM9?=
 =?us-ascii?Q?lnUBej1wl/RfuNC/Jb+05JhfZYKHZ7NvAeUQIVOAXk1cWIfZ669AuY1DrhPU?=
 =?us-ascii?Q?mXPzv5JkLWmhB1CJxi4WmCxm/YKSgiB1vMWoQMTfKIqwc7Lq3KezbALwW4qB?=
 =?us-ascii?Q?kowJK1HiOqzdOr0BYvtw+m7q1BeflSCt4lddwenEUBl+RwRwXLOyfpqyx47s?=
 =?us-ascii?Q?aXiKnWa4WLGmOWSy9SaETisv3tOSzp96+tiQkzeKQAWALiVtFaoSDyjNJUfU?=
 =?us-ascii?Q?N5c8S9+4W//RLkqnLY9oBUVG1KhINy5ikzMYqzTc2Tmq2oh45tzu+5xdxfAt?=
 =?us-ascii?Q?+wHA4XAybgpuPynt86ZU/qQyLce4O5Wfd6K2LrolfyEHCHHkKlfcdZE+eDnO?=
 =?us-ascii?Q?sf2obdOTAay0ALx1scdDimccnwF2upO08uiW+4J1OwUIWQpo0v6Zi0OfHdCp?=
 =?us-ascii?Q?UF/Zq9DdPcRijLOVoMFi1UNltxmw/UWy61cDGx/pPQKNxfvi7qTJeRBWnpEL?=
 =?us-ascii?Q?jsWQYoiOtZ13cMUWb5w4P3Swfrl5VRidazSLDquyLoQ64Zuz1ftYJmOlimPY?=
 =?us-ascii?Q?GELVUeZpzDYXItupPE1QK+7zabQ7gWOt2pESaasLAz5jfhWzYrS2zAWswjEJ?=
 =?us-ascii?Q?nQ4pYGhbPeCRCiTzxlNHQ6172ZTHNH7veZB11UZnbk8NE00iGcz2gGNd6LTp?=
 =?us-ascii?Q?hyyQpAAjbADFjvGbbTSjuQpRhFfg0GjO92xvbSupQaQOtQZBSfh0tPVIXHej?=
 =?us-ascii?Q?DAzuyybajTeECL0Y74YdyRIN6pgv3id/vFMC0ZngEswFEZc+IDxoKMi1Jdme?=
 =?us-ascii?Q?cBLsHN7T4e/X2LNkjxV6T48dvXoWCi8tKw1Qslq6LbkAhE0LmZ2LixWOsD0b?=
 =?us-ascii?Q?LugwG2qSy1q2HPnpQ6R5xm56QeCXTC8y6Ye3PahSisaM0BK/kvo3bv+IaG+J?=
 =?us-ascii?Q?6KIMM6OsMvSryUsk0lKB5+8b5izlC78sPGZ2UPmp260qH4X2kk87eAT05x+I?=
 =?us-ascii?Q?ZV7JRC64lC5cnDqbs3QpG+5gMgIbtS9SfzsFf6Ejq3ik1NkHDuBX13EBIpMr?=
 =?us-ascii?Q?BVxItqwFmeSF6sV0PC3aK0f+YZeMazK2zkyLy5FnL/WPtBVuDuUstt5EpZrj?=
 =?us-ascii?Q?UmCWHcCA+Jnt9e8eqFGLIkLWhoNdzvwbgGgWVWxIHiZf6trZikEjsb0+n94B?=
 =?us-ascii?Q?Xesk6NbOWUwgiVN2Vcl/y5Q181NAgPgP+SLUBgW/hh1hSGYvbXIcbf3F6gAu?=
 =?us-ascii?Q?V3NdrMgPqxbtY8dEbVMPMNYe6S95W0rD4IcNC5Hl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ae43f2-7c18-4e6f-8e2b-08db8d186c39
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:07:04.0410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSJ8Cnl2Rsy6kwMKp7x7pm7nho3Edq+zmkNAOmAhPfoZaslNJJZzD+Wg+/yjde2P99bMfRO1ETxgOqWKvxJcsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/engine: add missing rpm for bind
 engines
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

On Tue, Jul 25, 2023 at 12:01:17PM +0100, Matthew Auld wrote:
> Bind engines need to use the migration vm, however we don't have any rpm
> for such a vm, otherwise the kernel would prevent rpm suspend-resume.
> There are two issues here, first is the actual engine create which needs
> to touch the lrc, but since that is in VRAM we trigger loads of missing
> mem_access asserts. 

with this in mind, should we really create the new ENGINE_FLAG_HOLD_RPM,
or should we simply use the existent ENGINE_FLAG_VM?

> The second issue is when destroying the actual
> engine, which requires GuC CT to deregister the context.
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499

I wonder if we should get the mem_acceess from inside the ct path
to be sure?

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c       | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_engine_types.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 59e0a9e085ba..dba71f53e53e 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -76,6 +76,17 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>  	if (err)
>  		goto err_lrc;
>  
> +	/*
> +	 * Normally the user vm holds an rpm ref to keep the device awake, and
> +	 * the context holds a ref for the vm, however for some engines we use
> +	 * the kernels migrate vm underneath which offers no such rpm ref. Make
> +	 * sure we keep a ref here, so we can perform GuC CT actions when
> +	 * needed. Caller is expected to have already grabbed the rpm ref
> +	 * outside any sensitive locks.
> +	 */
> +	if (e->flags & ENGINE_FLAG_HOLD_RPM)
> +		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> +
>  	return e;
>  
>  err_lrc:
> @@ -152,6 +163,8 @@ void xe_engine_fini(struct xe_engine *e)
>  		xe_lrc_finish(e->lrc + i);
>  	if (e->vm)
>  		xe_vm_put(e->vm);
> +	if (e->flags & ENGINE_FLAG_HOLD_RPM)
> +		xe_device_mem_access_put(gt_to_xe(e->gt));
>  
>  	kfree(e);
>  }
> @@ -560,14 +573,21 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, !hwe))
>  				return -EINVAL;
>  
> +			/* The migration vm doesn't hold rpm ref */
> +			xe_device_mem_access_get(xe);
> +
>  			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>  			new = xe_engine_create(xe, migrate_vm, logical_mask,
>  					       args->width, hwe,
> +					       ENGINE_FLAG_HOLD_RPM |
>  					       ENGINE_FLAG_PERSISTENT |
>  					       ENGINE_FLAG_VM |
>  					       (id ?
>  					       ENGINE_FLAG_BIND_ENGINE_CHILD :
>  					       0));
> +
> +			xe_device_mem_access_put(xe); /* now held by engine */
> +
>  			xe_vm_put(migrate_vm);
>  			if (IS_ERR(new)) {
>  				err = PTR_ERR(new);
> diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
> index 36bfaeec23f4..a3867e4db0bb 100644
> --- a/drivers/gpu/drm/xe/xe_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_engine_types.h
> @@ -59,6 +59,7 @@ struct xe_engine {
>  #define ENGINE_FLAG_VM			BIT(4)
>  #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>  #define ENGINE_FLAG_WA			BIT(6)
> +#define ENGINE_FLAG_HOLD_RPM		BIT(7)
>  
>  	/**
>  	 * @flags: flags for this engine, should statically setup aside from ban
> -- 
> 2.41.0
> 
