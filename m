Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B6DC48BC1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 18:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404010E832;
	Wed, 14 Feb 2024 18:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jb2/HtTT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F7110E81C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 18:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707936500; x=1739472500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+PCUaAXP33Vsl5LWP2jADhvJY76whAfhpbO0wnKBmts=;
 b=Jb2/HtTT9rfw5X3+JOKseD64TJ6Lwhg44235FpQdUHjG992OvCx6dWTx
 Ozo6anYRNM2hzvf+iY1bUPzzxL+KxeRcbjo7/H4ho4/eQRYU3SWxVf+Xy
 HgNliKJskRtq67wH7LdW8ccicj4+TvoV/dbP5gNuNGDwkEol17ZrHTY2V
 7SY+B4XbN5fpJlD/RjDVyUVgZfLgdXIt/Ope7IZplwHMlbkvBFHfRw0XP
 7owF3+zF2CVP389W7+fhWZ744i0aEoU9kuBTpuIftwyYFMa674C50KsPB
 r3vFmJ5eF2x8VQcsYqYK/yMfGEYZ2jrIaP66X4IfIfXdre33YYNvAu1YJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1872932"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="1872932"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="7900298"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 10:48:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:48:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 10:48:17 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 10:48:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY+YxAuzcE9ecyKsHlZB9BXFazV1KIQZT1PS9RSUF1JKeKM/XxFBqXOvF0dlqjW3ZdEeNzvG0bCvBxIpS/b1ddu7Hzxe0Ut0FbmF1jGEpPZqY5PVfSezoPiQ1WKMjjcjtypFYdlZs678oDV3zyCml7AT5RnGfs1PixIwnBaJ4mDEiEpEHvlo58JRbNiAjfE7O2JL4V1DoL30l4k6DKKYLnjtxneoEDaP2wYNICcA/LMnoiRrCM5uIYmrj5ZEdeEcXSq36Of7CxEykA8cXvMSzTY3iowsdL95pATndGHMxkVF5m8f0bEwn6zPpKpw9kwT0P/r2Wx6xuhupdO5ZF4pSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLMTN3t73VqGyGwUxxQ1kG4RUJJM2e0Z48xCoG1s5+8=;
 b=RwZZair0870HpCOYM38/HBxQnSmxbxZsYRo3Qy0h45i6xRygVuVs1saRaOpWGdR7z+y/bxHTctOzGUDDjP8iCGUzb1aemBoBPSWOwfn6MPlxJEk9pJemvKCFYQQtmSKmnc3z/GQ/Ogc7xgCIuzuayCPcx4ZrKaFUVybs9XC5RX7hJJFxKm9lLPdNetcfTj8SIGcLqa/8cJ0W7a+dStySY9Am5Oo2GnK7Zc7pOVV9zABBSpRhfCMwRVJPvsh12ff/GIkY8N6sW9G0DTgGJlMph1rDGxfwFL6ljg6wT0drwKV585Rti6SY1C6xl1G8nT8SDFDrC4DjHe+dz9L1wXOq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5123.namprd11.prod.outlook.com (2603:10b6:303:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 18:48:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 18:48:11 +0000
Date: Wed, 14 Feb 2024 13:48:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 11/34] drm/xe: Runtime PM wake on every sysfs call
Message-ID: <Zc0K55byC9pAmJZ3@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-12-rodrigo.vivi@intel.com>
 <b5c42b69-cbc1-4c1b-959f-202847456636@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b5c42b69-cbc1-4c1b-959f-202847456636@intel.com>
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: 135ba976-1080-4a6c-4cd6-08dc2d8d7e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bX3SesRxlpj5vh0ujgRZ8Y1o7+I/Jenqwi7Tc5I6c/3ZNUeXumm3J0p36J8kc1GWeB3CaV8xVw9WcdAWIaesqgs/DI+cVpS31IoXsFLIMcHF9Nx2seuih5HE7GZuNxIdiW8cp2jEheGAfgIi71XKdpZx2qDKAFgmsH7W4kvRMwhL0/Ga3RPpgmdnIKG7D/DE3c6UycwKDBjenz2dBjR3vi5xQGJvbNr2msdC2tcPspJJJWVN74lg7SoKxNQnc7yrYMf28I2yksKKZMFJsyV2m8TxRLMb321hCmCCf4ysWLXzaZVnZK7k1bPjeYl2+MLomsm/KQsDdEyfFCP9LbhVdPVyUgktuYcN3dKHkhURmzSj02bifa2Y3SNuiBKZQlsf0f//JAuli8z6g/bmyqwYisfQt76m4k1pm/cz07momI0bWZfp9VjhqwSojAbG62p01XEYgPf8S6Qy4mYWYhNSrFFRQcAv5UqFdQmO8b5v/oWPyiVCaqNvXfhxLT+BiCqTakC/6ODbgOPltu37/xmMRZush34SOKECYHYdsTBwimFb7LMpGU3loVs8IvuUWiWT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(86362001)(83380400001)(82960400001)(38100700002)(36756003)(2906002)(5660300002)(30864003)(44832011)(66946007)(66476007)(66556008)(41300700001)(8936002)(6862004)(4326008)(8676002)(37006003)(316002)(6666004)(6636002)(6486002)(53546011)(6506007)(478600001)(6512007)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?erPArUcjkl0l3X2Ldf2+C1Qz4eeqA9MyPkG1YxDG+cwN0s2HhA89xnIBeXXn?=
 =?us-ascii?Q?5ZlCJ+JJNDjbASq/a4t9XTCqM5Y2W314LwoDsKd3VnKYHTeg/fWnyuG14Zad?=
 =?us-ascii?Q?owOTOflkzED9ipUNlh9ELVPhiJ7u4C7RKpdMPDVuj8aBX4JfHeyJPLYUGWG8?=
 =?us-ascii?Q?Io7elj8mdwMjuYdglr6jesBmpdW8EfK8Ic9HYwwKUk/O/WsHpJJhQ7Fck9a8?=
 =?us-ascii?Q?aUkcsDYoM4yGhzmZuL4qFgmr1vCBVWQcI9TB0M2ungYt7Nyb2Y7NL8sNhWkf?=
 =?us-ascii?Q?Opq7r1aStd5k5l5UznF+B4A6OeLP8Jh5E4Drg0kur+dqy2NtVuFlo9QD73kC?=
 =?us-ascii?Q?j80qHVAMLVvIEHsOl5KTumtYif5PUhBtqkxoOgq+aCaSBIeMZqfLYr+/nkip?=
 =?us-ascii?Q?s0SH0QoMCCs0uqtVZZ8XfpqkXcm5xGOveo9TV9YVlqmAk96XTuhgNBql5PtW?=
 =?us-ascii?Q?iMXKaj3me7o/8zEnTk0GCgHZgGhqt7B9PvCc2WVsSf4n5lEtIEMp/yFJyAiH?=
 =?us-ascii?Q?lM82rsI3Ft5nxho9DS8PPiTo9E/OgIC8xyQOAy9z96Xx1KfKTJBU1fHMNTTf?=
 =?us-ascii?Q?/aIXqTa/O75+QjT85DpSAhB1ePikjxXcIiHEShhUbtq0fRBz+tGlVUj+cI8L?=
 =?us-ascii?Q?UbGmM6yjG3JdtExAB4WsJFxiG15QOUi1wMHh8chp9Nh1Fyr6E9PxYkgq/VV7?=
 =?us-ascii?Q?NnIZtedjSvFaaqq8W1LXNWsUGzqg/fyE/VUJRNE6EK0v6JqbmCLLugYaKZDu?=
 =?us-ascii?Q?VFykebHcQLqwO6JeWj1PI7JxzICznleK6ZdmLX2+1bqPJncp20iqxBomN2ZZ?=
 =?us-ascii?Q?ywVrxZgE/nhJOnQlx3+mnhZJBJr6/Tl24icAdkqr21Cz5FDXehKSp0kV4nfU?=
 =?us-ascii?Q?rYgKeyvH2AvbfYxltc1+vJHVbuYWx2r4Dp6IfWQEga+L8coc5eV9mGLSSsPb?=
 =?us-ascii?Q?wiSiXXWMZAg2VXOcLYXjJgBrAbd9RYc9/hTtMW1rOK58rlbi9U8CMLfDWrC9?=
 =?us-ascii?Q?YqR/bTFUQ2YmuyUbn3EGdeB23cCJQjo4KSHxBJUmnCyUJk0+dqijCAkv5tZN?=
 =?us-ascii?Q?uc1pd9AsvDgaqIT8kPUzZnwaDghjgRKAdvjgp76nrpSvA19FivJjitlAiXr2?=
 =?us-ascii?Q?fDmoOUgqT/PERHVogIx4ePVekHEg+gLQy6EOyJHw4qYb0t2tetAewU4eij4m?=
 =?us-ascii?Q?oVoqEk5/3pgLENP9lisHyuavxYA6Xr6OneaCb0JLIw7gGXO+Z02wkVibXdyj?=
 =?us-ascii?Q?eQOjjMjf2ZSS4ezK5I4rjrQrpQB9tjO2rSI+Qz7fkVDMKFHQeulN5FUc3oo+?=
 =?us-ascii?Q?ZKV5ri/alS0NLkwARjYtnjp5MElMYSyoAoiGO//JaHNHg+SNFiwDvhAfTbrI?=
 =?us-ascii?Q?1gMigxd/bStn98jUC6/PYjYalMdGKL3rx0kqp+jKSNV01fNuvWBtsGhTKor1?=
 =?us-ascii?Q?8A0GtOFAi22s0TAcLWgAFOYIMN8oIGGxe04VO6i08SyTQMsx2xmavi6rEIUH?=
 =?us-ascii?Q?NePXWAx5s5MeBt52Nt5D2J6GyKESTUhqY96jrZDrTr+VONZkawZeWT22oTf0?=
 =?us-ascii?Q?WE+WXSvTZyZveTgiZnY6hKZQDnJ1FD3bXL9bdN7AlQGjDfM78kLTsRaQNK1O?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 135ba976-1080-4a6c-4cd6-08dc2d8d7e48
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 18:48:11.4988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwJu9VQvQ89V/aX1wWc/B1OoNwm9DFgKBvnseUO2yYyQoUnsA0Z1VLkMOIU12oqAUS2poemySDuugdxSrOoQug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5123
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Feb 05, 2024 at 10:55:42AM +0000, Matthew Auld wrote:
> On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > Let's ensure our PCI device is awaken on every sysfs call.
> > Let's increase the runtime_pm protection and start moving
> > that to the outer bounds.
> > 
> > For now, for the files with small number of attr functions,
> > let's only call the runtime pm functions directly.
> > For the hw_engines entries with many files, let's add
> > the sysfs_ops wrapper.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device_sysfs.c          |  4 ++
> >   drivers/gpu/drm/xe/xe_gt_freq.c               | 38 +++++++++++-
> >   drivers/gpu/drm/xe/xe_gt_idle.c               | 23 +++++++-
> >   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |  3 +
> >   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 58 ++++++++++++++++++-
> >   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  7 +++
> >   drivers/gpu/drm/xe/xe_tile_sysfs.c            |  1 +
> >   7 files changed, 129 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > index 99113a5a2b84..e47c8ad1bb17 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > @@ -35,7 +35,9 @@ vram_d3cold_threshold_show(struct device *dev,
> >   	if (!xe)
> >   		return -EINVAL;
> > +	xe_pm_runtime_get(xe);
> 
> Does it make sense to use the get_sync/ioctl version?\

I renamed the other to _ioctl as you suggested...

> 
> Assuming CI is happy,

in the end it is a get_sync because it will call resume directly.
but without any error handling and prepared to be called from
anywhere even from inner places that might be on resume path.

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks,

perhaps we can later come and revisit the error check and
the names.

> 
> >   	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> > +	xe_pm_runtime_put(xe);
> >   	return ret;
> >   }
> > @@ -58,7 +60,9 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> >   	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
> > +	xe_pm_runtime_get(xe);
> >   	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
> > +	xe_pm_runtime_put(xe);
> >   	return ret ?: count;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> > index e5b0f4ecdbe8..32b9a743629c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> > @@ -15,6 +15,7 @@
> >   #include "xe_gt_sysfs.h"
> >   #include "xe_gt_throttle_sysfs.h"
> >   #include "xe_guc_pc.h"
> > +#include "xe_pm.h"
> >   /**
> >    * DOC: Xe GT Frequency Management
> > @@ -49,12 +50,23 @@ dev_to_pc(struct device *dev)
> >   	return &kobj_to_gt(dev->kobj.parent)->uc.guc.pc;
> >   }
> > +static struct xe_device *
> > +dev_to_xe(struct device *dev)
> > +{
> > +	return gt_to_xe(kobj_to_gt(dev->kobj.parent));
> > +}
> > +
> >   static ssize_t act_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> > +	u32 freq;
> > +
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> > +	freq = xe_guc_pc_get_act_freq(pc);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> > -	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_act_freq(pc));
> > +	return sysfs_emit(buf, "%d\n", freq);
> >   }
> >   static DEVICE_ATTR_RO(act_freq);
> > @@ -65,7 +77,9 @@ static ssize_t cur_freq_show(struct device *dev,
> >   	u32 freq;
> >   	ssize_t ret;
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> >   	ret = xe_guc_pc_get_cur_freq(pc, &freq);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> >   	if (ret)
> >   		return ret;
> > @@ -77,8 +91,13 @@ static ssize_t rp0_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> > +	u32 freq;
> > +
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> > +	freq = xe_guc_pc_get_rp0_freq(pc);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> > -	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
> > +	return sysfs_emit(buf, "%d\n", freq);
> >   }
> >   static DEVICE_ATTR_RO(rp0_freq);
> > @@ -86,8 +105,13 @@ static ssize_t rpe_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> > +	u32 freq;
> > +
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> > +	freq = xe_guc_pc_get_rpe_freq(pc);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> > -	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpe_freq(pc));
> > +	return sysfs_emit(buf, "%d\n", freq);
> >   }
> >   static DEVICE_ATTR_RO(rpe_freq);
> > @@ -107,7 +131,9 @@ static ssize_t min_freq_show(struct device *dev,
> >   	u32 freq;
> >   	ssize_t ret;
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> >   	ret = xe_guc_pc_get_min_freq(pc, &freq);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> >   	if (ret)
> >   		return ret;
> > @@ -125,7 +151,9 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> >   	if (ret)
> >   		return ret;
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> >   	ret = xe_guc_pc_set_min_freq(pc, freq);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> >   	if (ret)
> >   		return ret;
> > @@ -140,7 +168,9 @@ static ssize_t max_freq_show(struct device *dev,
> >   	u32 freq;
> >   	ssize_t ret;
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> >   	ret = xe_guc_pc_get_max_freq(pc, &freq);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> >   	if (ret)
> >   		return ret;
> > @@ -158,7 +188,9 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> >   	if (ret)
> >   		return ret;
> > +	xe_pm_runtime_get(dev_to_xe(dev));
> >   	ret = xe_guc_pc_set_max_freq(pc, freq);
> > +	xe_pm_runtime_put(dev_to_xe(dev));
> >   	if (ret)
> >   		return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> > index 9358f7336889..824ff458011f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > @@ -12,6 +12,7 @@
> >   #include "xe_guc_pc.h"
> >   #include "regs/xe_gt_regs.h"
> >   #include "xe_mmio.h"
> > +#include "xe_pm.h"
> >   /**
> >    * DOC: Xe GT Idle
> > @@ -40,6 +41,15 @@ static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle)
> >   	return &gtidle_to_gt(gtidle)->uc.guc.pc;
> >   }
> > +static struct xe_device *
> > +pc_to_xe(struct xe_guc_pc *pc)
> > +{
> > +	struct xe_guc *guc = container_of(pc, struct xe_guc, pc);
> > +	struct xe_gt *gt = container_of(guc, struct xe_gt, uc.guc);
> > +
> > +	return gt_to_xe(gt);
> > +}
> > +
> >   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
> >   {
> >   	switch (state) {
> > @@ -86,8 +96,14 @@ static ssize_t name_show(struct device *dev,
> >   			 struct device_attribute *attr, char *buff)
> >   {
> >   	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> > +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> > +	ssize_t ret;
> > +
> > +	xe_pm_runtime_get(pc_to_xe(pc));
> > +	ret = sysfs_emit(buff, "%s\n", gtidle->name);
> > +	xe_pm_runtime_put(pc_to_xe(pc));
> > -	return sysfs_emit(buff, "%s\n", gtidle->name);
> > +	return ret;
> >   }
> >   static DEVICE_ATTR_RO(name);
> > @@ -98,7 +114,9 @@ static ssize_t idle_status_show(struct device *dev,
> >   	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> >   	enum xe_gt_idle_state state;
> > +	xe_pm_runtime_get(pc_to_xe(pc));
> >   	state = gtidle->idle_status(pc);
> > +	xe_pm_runtime_put(pc_to_xe(pc));
> >   	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
> >   }
> > @@ -111,7 +129,10 @@ static ssize_t idle_residency_ms_show(struct device *dev,
> >   	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> >   	u64 residency;
> > +	xe_pm_runtime_get(pc_to_xe(pc));
> >   	residency = gtidle->idle_residency(pc);
> > +	xe_pm_runtime_put(pc_to_xe(pc));
> > +
> >   	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
> >   }
> >   static DEVICE_ATTR_RO(idle_residency_ms);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > index 63d640591a52..9c33045ff1ef 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > @@ -11,6 +11,7 @@
> >   #include "xe_gt_sysfs.h"
> >   #include "xe_gt_throttle_sysfs.h"
> >   #include "xe_mmio.h"
> > +#include "xe_pm.h"
> >   /**
> >    * DOC: Xe GT Throttle
> > @@ -38,10 +39,12 @@ static u32 read_perf_limit_reasons(struct xe_gt *gt)
> >   {
> >   	u32 reg;
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> >   	if (xe_gt_is_media_type(gt))
> >   		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> >   	else
> >   		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> >   	return reg;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > index 2345fb42fa39..9e23ca7f45ad 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > @@ -9,6 +9,7 @@
> >   #include "xe_gt.h"
> >   #include "xe_hw_engine_class_sysfs.h"
> > +#include "xe_pm.h"
> >   #define MAX_ENGINE_CLASS_NAME_LEN    16
> >   static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
> > @@ -513,6 +514,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, char *name
> >   		kobject_put(&keclass->base);
> >   		return NULL;
> >   	}
> > +	keclass->xe = xe;
> >   	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
> >   				       &keclass->base);
> > @@ -567,9 +569,63 @@ static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
> >   	kfree(kobj);
> >   }
> > +#include "xe_pm.h"
> > +
> > +static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
> > +{
> > +	return pci_get_drvdata(pdev);
> > +}
> > +
> > +static inline struct xe_device *to_xe_device(const struct drm_device *dev)
> > +{
> > +	return container_of(dev, struct xe_device, drm);
> > +}
> > +
> > +static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
> > +						  struct attribute *attr,
> > +						  char *buf)
> > +{
> > +	struct xe_device *xe = kobj_to_xe(kobj);
> > +	struct kobj_attribute *kattr;
> > +	ssize_t ret = -EIO;
> > +
> > +	kattr = container_of(attr, struct kobj_attribute, attr);
> > +	if (kattr->show) {
> > +		xe_pm_runtime_get(xe);
> > +		ret = kattr->show(kobj, kattr, buf);
> > +		xe_pm_runtime_put(xe);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
> > +						   struct attribute *attr,
> > +						   const char *buf,
> > +						   size_t count)
> > +{
> > +	struct xe_device *xe = kobj_to_xe(kobj);
> > +	struct kobj_attribute *kattr;
> > +	ssize_t ret = -EIO;
> > +
> > +	kattr = container_of(attr, struct kobj_attribute, attr);
> > +	if (kattr->store) {
> > +		xe_pm_runtime_get(xe);
> > +		ret = kattr->store(kobj, kattr, buf, count);
> > +		xe_pm_runtime_put(xe);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct sysfs_ops xe_hw_engine_class_sysfs_ops = {
> > +	.show = xe_hw_engine_class_sysfs_attr_show,
> > +	.store = xe_hw_engine_class_sysfs_attr_store,
> > +};
> > +
> >   static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
> >   	.release = xe_hw_engine_sysfs_kobj_release,
> > -	.sysfs_ops = &kobj_sysfs_ops,
> > +	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
> >   };
> >   static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > index ec5ba673b314..28a0d7c909c0 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > @@ -26,6 +26,8 @@ struct kobj_eclass {
> >   	struct kobject base;
> >   	/** @eclass: A pointer to the hw engine class interface */
> >   	struct xe_hw_engine_class_intf *eclass;
> > +	/** @xe: A pointer to the xe device */
> > +	struct xe_device *xe;
> >   };
> >   static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
> > @@ -33,4 +35,9 @@ static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kob
> >   	return container_of(kobj, struct kobj_eclass, base)->eclass;
> >   }
> > +static inline struct xe_device *kobj_to_xe(struct kobject *kobj)
> > +{
> > +	return container_of(kobj, struct kobj_eclass, base)->xe;
> > +}
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > index 0662968d7bcb..237a0761d3ad 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > @@ -7,6 +7,7 @@
> >   #include <linux/sysfs.h>
> >   #include <drm/drm_managed.h>
> > +#include "xe_pm.h"
> >   #include "xe_tile.h"
> >   #include "xe_tile_sysfs.h"
> >   #include "xe_vram_freq.h"
