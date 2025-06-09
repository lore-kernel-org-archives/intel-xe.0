Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E867BC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 21:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9804C10E1A6;
	Mon,  9 Jun 2025 21:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvN/qKSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5855410E1A6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 21:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749506311; x=1781042311;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fdlptSnupzd9SEobBQttpRLdPsNpVYAPPbDJCT3OS/k=;
 b=hvN/qKSlX9yigKv97nnvhlN/m0nmYhL7TajhqcQd/PiPzNJ22CId+XSD
 7BkIxvOz15gygaoAc99avruBrqPPLvYIto7j7THXGDkea1yP1EnPuQKTm
 PYcyQhXaV2tfNJqiE43UJGF9iUwsN68FFb07Xrfy483SDg8KmWjUmjiOb
 cDpe7nEmQYouzkIkNDZ3GmdvdFdWDvaEoF71am/Ke0Os0V+3AISYNkXzi
 j6X+2JKCsrR8/EygJwHfUW7RgfsCK9N7LmUIOejjE2Nv5yxQ/DH/P6v8H
 hvTfXV6oQwxcl24UX8kdt8ifu+s6BF7qG+nNgfvjQbhba96GjUFunsjlQ A==;
X-CSE-ConnectionGUID: W1Es4CdwTDqG5wm7QZLqaw==
X-CSE-MsgGUID: LYIzAMx4RKGQC6RkkKp6gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51451322"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="51451322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:58:27 -0700
X-CSE-ConnectionGUID: oilXUUrKTYS/bSQ0/WoOYA==
X-CSE-MsgGUID: KasXFQQ1SZSXqqJ80lHdEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="147149178"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:58:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:58:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 14:58:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:58:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbX3M+EQxBAGJnCU0a4ZQOE3ZgvPVzevHpWdyrQsPYsyOd8uNT4Ii8GJSvI2X/ayNUDklDPqjpeI5pQvdDcdGef5mryUpTP0xFzUwVRLKRoWuLKeoFYhkHG8LMpyv/pGXbLSAxg0pYGqCFORqxq0fwkjbswjm1I6zrZePefkoVZcdl0J9D3OfOUctcvmXKNQyEKUA6TvpLNUJINqD3OseSGUn+GSFhYF5g+FaVdcrm2iyGFa++LpakEN30e93EgwdQO5+oEJoPCp3fawObd3JvMHl+V48O56y4Ye9ee+Ybj6/jfgeQjMXLKR6Fb+V8Na6XasIrnxg/kxIyKoscjQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrQjv6yubntA3XYP+oNaq6Kk9xTrGt6tg0Vcdjc3A0k=;
 b=hEaa8rM/4RCKKakh5bKsDSSF7MOsLdhjnnn7HBNOV9GOSfu0NnHhhR7uLKqAvEJQyFVfPelpz9iWoXKltSC3mZCQwk47qp2gfSPhRQJkBrSAOMk19O965FyQdOoPaT8g1nwbrITiU74cPNAKazmM7h78uS0lRxtoOO+a9zI8nfSZjmbsGobCiGMZZqOv6kISL5WWlTt5bUQv0amHXkAvBPZHupHUKvmFMR+gpAHdrNpwSBUBAJt7DUL/UrsgDdG5DbApZeiQ+9pci0o97eaCui8uTzHKxeKhS1ZiiaxBvo66dIMjksMFiix7/OSBCggf4cWEmgG8ABfZCOyoMS8NOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 21:58:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 21:58:23 +0000
Date: Mon, 9 Jun 2025 14:58:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Ilia Levi <ilia.levi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <koby.elbaz@intel.com>, <konstantin.sinyuk@intel.com>,
 <yaron.avizrat@intel.com>, <moti.haimovski@intel.com>,
 <didi.freiman@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Message-ID: <20250609215820.GR5080@mdroper-desk1.amr.corp.intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b85779e-c224-4fd8-c0eb-08dda7a0c0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Awvb7vgSN7p7vxRVzmTz7ImeAO8YM34Pp0qGqyRnwCMSEVS1Dif4lPCrfzbf?=
 =?us-ascii?Q?sdXEBtC2jap2/RIxHPqnhcH7nG86xEX9EFIoiQ+bj/qhNashCDLw9vFUE6QA?=
 =?us-ascii?Q?BnNGrjiPJB2GJAOQ5ye3PqZRVC2O7RoF3LLZLQVzlJx4kTguBSbfrl8D5vwI?=
 =?us-ascii?Q?C1426hCepEOQAIyAfaitimUH+YQvXwxw7gX+gHs9YOLQPd+TV83A7KjIxVHe?=
 =?us-ascii?Q?yZl8YZkrm2HiwAc83xBMpixsfzi8pcjTCwtMWXut627W6wwne8Ntt0WGy8jG?=
 =?us-ascii?Q?bNtqXXukjRNE0oIeX7je+lOvQDk5zK2Cdi89BF6bWAARRSNho4qyXCpGbyl6?=
 =?us-ascii?Q?1gqILgU18/I5NQD0Jru9Ot5BoJhji9lqdpapf9/EErwTRu4cgOX87evYPfHp?=
 =?us-ascii?Q?A6bmwNCBw10J0mGFGGDFLP4NdT2/5LW/TKvUyH/bAwc20e9C/YbGwzkqdObk?=
 =?us-ascii?Q?JP63rG69rGNCaqmP4/cZw/dxrghm7eM3nR86SBCYUol3Yr+1I1IJOhOD60s8?=
 =?us-ascii?Q?IzwgSye6FsbM9BkidmqyWKpMGfXH8tEhCOQeE/zc/Lb1InNC9z3tSUZ2qQiO?=
 =?us-ascii?Q?TEIoor2hpmDVo2XLBkENL20Hyj8Lt9f4k4bpwakjR05Dz2IYP88SJxJQlgby?=
 =?us-ascii?Q?aBzP6KbTEVCXjBawV6ir+v7X4RoRpyhVIymIXw0c7IL0x1BYXbPxJawRsSY4?=
 =?us-ascii?Q?pRgvZoZJ5p3NtVSaPiMY/zm5qI8m2z8oTF0BCUwmh6yUdXxXuUIZc1lC8/8a?=
 =?us-ascii?Q?sn4aGi1EbSNFdDvWoQoZILkptebVDY8XY+J4KpMkgJfUYJwJI5O00qccjgYF?=
 =?us-ascii?Q?OX0b5pnKGoOgxfsBmMVm/z7NlEWHQoEphxRK09QX+Ao4aTPAPlDWgnLxNLwA?=
 =?us-ascii?Q?Bj+ey/xjvt7GEZlU0iZzIXG8l2lgBtTPZBkJTuVM5q49C5akGD3ZqMKq7HzV?=
 =?us-ascii?Q?NZRm/FUEXXY+kbMMSZoARYlGY+bd717LHIcFXHxecjxK7JpzvVkkL0674KAe?=
 =?us-ascii?Q?L8MiPp5Amak9gjD2GN5t0VUWEqZzvGlOj/QywyNgdcIMeapss4BjH8wYT1Yd?=
 =?us-ascii?Q?Bf129rYQy8APBXvK8nZMExOfHj0IzBT0TGXI37+6F6vY87vN4/xCraU4jxPI?=
 =?us-ascii?Q?mrqo+ROyrRDDIXfQvQq1BGBTKmSH3T9UOk1zSbCMwJp2y/nRYzHXl+jkwdm6?=
 =?us-ascii?Q?zU2CLvVAFD4DGBdsBsf583Y5HHjhQAKOiQTxu4SckY+/26dYUCnlmZb0Tnpz?=
 =?us-ascii?Q?xwiZHRr+iMub5M6Nub9oC5b9EHotOZshXQRy5uxuKaekgx7qrEhkIS8r3BGp?=
 =?us-ascii?Q?Xb8K1CEWZ5rskT0Z1/hF19z6f/8SoOqPN0jBJnIJE62mSl5nkQeFQ8Py6RXZ?=
 =?us-ascii?Q?1jUfWDi6TZA8CEQfpzR7XVrNlKseyh1dId/GUek+xGYg/bpkXIKfHN1pdwAr?=
 =?us-ascii?Q?yNX9sXZ36zE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wcDSUOjVqIs6rZIc39mDGn4QldqRfNbM5RCpL1Ujxuo/ogUo+31ZuSc3LBPd?=
 =?us-ascii?Q?5t7gd/OYEdfl+b+5VXeN805vGwuoDUvf1EOuL5oaHRWRGUkwhaO1dDek0CW7?=
 =?us-ascii?Q?xZcoeVEt6FN+yoHN7GjhQu0BIFf8/8/dThOgFgmgbOvcoBvZVRN9C/itRH4X?=
 =?us-ascii?Q?ysPsdOEt5ZRf/SRnnnS29ZSIMYgZdz3i4KwqB69Vvy571yISU2IprUZJ52z7?=
 =?us-ascii?Q?HNXiJyZK+e5z2zVKdSSrcQvBk0FrY64PuC8SSgDQoRsGy51OHlKIaF6Rf7j6?=
 =?us-ascii?Q?YcjPxPodYzoQiihQSzQBLkdPnRfKl/ndipfdUYnZ2yCUPZGBK7Ym0itVmlvW?=
 =?us-ascii?Q?93X0VkOEOliPWS37rpcKTIY9U0Uj4LSd+hII9DE4Hy0GJLByANLJp7ICReYm?=
 =?us-ascii?Q?VBXZSRVtt77u1I+8tHOJDoulG4EZ5twhgD/XsZrojGxc1tfTQwjn66PPc7de?=
 =?us-ascii?Q?EnkyP8bfQoY/cDHJ8n5vRPYnowXhCbpk4nlFtBYOCAZuiB6r0j+g+/+5jUcW?=
 =?us-ascii?Q?IzpaDF8ZXSikvILlDpytraWC3yuKgqep7HropPgvhr4+qqQ/D/vVRLgNcgCo?=
 =?us-ascii?Q?YfHuoJRYtid6F56s4e/9NceOBgTpzu1ZWx9B4cxrP0JKq9YvA1T0VRU/UOf7?=
 =?us-ascii?Q?JfYopSzucosJ3nKLHp4sm0ww1ZB+3RxJbNeumuyEyUdtU3ef88tFMhmYGPVC?=
 =?us-ascii?Q?Vk+xTwzcpQOiZxewiluRA+PZr7Cbqtbgi4OLrz+wvuqzlvL0S7DRsxzdQG+b?=
 =?us-ascii?Q?HY+PFthVcSGZpLGF9TeeWg3HrYB2qLpBJkrwISvvf7ooWhTkyuzX1fcCb9OA?=
 =?us-ascii?Q?AsSbWCD51K256kwnq5s05v9V6G6GJQmw5sm1sCO12NC4qyVAjz+4w0EXME2L?=
 =?us-ascii?Q?lbUgGTalFCnatZDBLx+5N4BaqbyTph0CJv0ZN5y91HxYUwQeKGnOxrH8fN1r?=
 =?us-ascii?Q?+Vmiw+Vkim8lx31VKIikw0zEFBD25HuxjINix6AjfS1lvWvAKyObEltbhqgz?=
 =?us-ascii?Q?8OzIvbEslSy0ZG7m2EOyZVAKqftYIzN/uJ0FvTIqPLI1xw/nu1m1a+nnkyTD?=
 =?us-ascii?Q?5cmD6NskTbNjhokr+KkrrEDuZjzhpHcA3EoKhaJ3hP6ZlDjELsha4DemJoTo?=
 =?us-ascii?Q?Z2P3rm9XoylOpxCBNjTEsurP4BMYDzqYCKthDo+ILqeSgq/mnh7QRMfTrZg/?=
 =?us-ascii?Q?FyUp4aHk7CNmPH4/yj+/kMQ+A+vy9N1CfjB/PFOOxR8LAsCLKKP8NHjqmtCR?=
 =?us-ascii?Q?rnySDG42L14zgT/CZmFwKhPz0ecqiondcndagyEXD1Rtflg2WqOFlnLJgRu/?=
 =?us-ascii?Q?Z6AOPeyRR7CqczuogTc72eIIc6KmCGPAgyaCTi2XIpfadrWqgp59F5tEGK5a?=
 =?us-ascii?Q?1d0rbH65kIkoIJ1eId1FJsb7w2k/eklBHFoHUUBkxAWiJdzK4lLZnvvS41UI?=
 =?us-ascii?Q?nVrdBP7/4L5HjseOid6v5JFuKS/q8q5QOH374Zr2c8hQzXOxQvOefwiWmPI5?=
 =?us-ascii?Q?QTb/UQh1ECyckovXgH6tFQjd95CSaOoqFuI+WhJ5RiSGxyMPsL1WB7D2l5vm?=
 =?us-ascii?Q?GCjIiHh7crG4D1rnH/pTesxuJGlvRrdUsXcFBS/AbAPVS9AUXYJWpbrDloBO?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b85779e-c224-4fd8-c0eb-08dda7a0c0dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 21:58:23.0555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iDcgvzaB60U3wIqHfgA7c7OjaIH2T+lLToXOMGLT9FOKF89G7fIUoTaEHPa8Cs7WjSmXXz4+i/Les0ya003WSxu6YSFzRz3ITsUfWvxE+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
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

On Mon, Jun 09, 2025 at 08:46:19AM -0700, Matthew Brost wrote:
> On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
> > Allow the driver to expose hardware register spaces to userspace
> > through GEM objects with fake mmap offsets. This can be useful
> > for userspace-firmware communication, debugging, etc.
> > 
> > v2: Minor doc fix (CI)
> > 
> > Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
> >  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
> >  3 files changed, 160 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index ac27389ccb8b..78542de0d48d 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -10,6 +10,7 @@
> >  
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_gem.h>
> >  #include <drm/drm_pagemap.h>
> >  #include <drm/ttm/ttm_device.h>
> >  
> > @@ -161,6 +162,19 @@ struct xe_mmio {
> >  	u32 adj_offset;
> >  };
> >  
> > +/**
> > + * struct xe_mmio_gem - GEM wrapper for xe_mmio
> > + *
> > + * A GEM object for exposing xe_mmio instance to userspace via mmap.
> > + */
> > +struct xe_mmio_gem {
> > +	/** @base: GEM object base */
> > +	struct drm_gem_object base;
> > +
> > +	/** @mmio: The MMIO region to expose */
> > +	struct xe_mmio mmio;
> 
> Any reason not this is not a pointer to xe_mmio?
> 
> > +};
> > +
> >  /**
> >   * struct xe_tile - hardware tile structure
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 7357458bc0d2..6bfa915a9602 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
> >  {
> >  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> >  }
> > +
> > +/**
> > + * DOC: Exposing MMIO regions to userspace
> > + *
> > + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
> > + *
> > + * This can be done as follows:
> > + * 1. Define an xe_mmio instance that represents this portion.
> > + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
> > + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
> > + * 4. Provide the fake offset to userspace.
> > + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
> > + *    must match the size of the xe_mmio instance.
> > + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
> > + *
> > + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
> > + *
> > + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
> > + * Make sure not to expose any sensitive registers.
> 
> This is no secondary issue, it is a primary one. There is no way we can
> expose entire PCIe MMIO register space to a non-root user (a root user
> itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
> btw).
> 
> What is the requirement for this patch? I know on other PCIe devices
> I've worked on we had similar issues where we needed to expose a subset
> of the PCIe MMIO register space to user space for kernel bypass
> submission - everything we needed to expose in that case was 4k aligned
> + tied to a single process via a KMD config before mapping to user
> space. I suspect to do anything safely here, somethine similar needs to
> be done.

I don't think it was the original intent of Ilia's patch, but I can
think of at least one feature expected on an upcoming platform where
there is a page or two of registers that the hardware team designed
under the assumption that they'd get mapped directly to userspace in a
read-only manner (i.e., information read-out only, no control of the
hardware).  I think some of the internal discussion was considering just
going our own direction and exposing the contents of that register block
via an xe_query instead since the contents likely wouldn't be changing
after boot, but if this infrastructure exists it might be a simpler and
more natural match for the hardware design.  +Cc Shuicheng since he
might find this interesting.

But if we're allowing this to map registers to userspace in a read/write
manner (or map any special registers that have side effects on read)
then we probably need a bit more scrutiny of the specific use cases to
determine what kind of permissions are required, whether they're safe to
access in concurrent / racing manners, etc.

And of course since this is new uapi, the regular graphics upstreaming
rules apply and we'll need an opensource userspace consumer fully
developed and reviewed before we can merge the kernel changes.


Matt

> 
> Matt
> 
> > + */
> > +
> > +static void xe_mmio_gem_free(struct drm_gem_object *);
> > +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> > +
> > +static const struct vm_operations_struct vm_ops = {
> > +	.open = drm_gem_vm_open,
> > +	.close = drm_gem_vm_close,
> > +};
> > +
> > +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
> > +	.free = xe_mmio_gem_free,
> > +	.mmap = xe_mmio_gem_mmap,
> > +	.vm_ops = &vm_ops,
> > +};
> > +
> > +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
> > +{
> > +	return container_of(obj, struct xe_mmio_gem, base);
> > +}
> > +
> > +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
> > +{
> > +	struct xe_device *xe = tile_to_xe(mmio->tile);
> > +
> > +	/*
> > +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
> > +	 * In the future we may want to store the physical address in struct xe_mmio.
> > +	 */
> > +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
> > +		(uintptr_t)(mmio->regs - xe->mmio.regs);
> > +}
> > +
> > +/**
> > + * xe_mmio_gem_create - Expose an MMIO region to userspace
> > + * @mmio: xe_mmio instance
> > + * @file: DRM file descriptor
> > + *
> > + * This function creates a GEM object with an mmap-able fake offset that wraps
> > + * the provided xe_mmio instance.
> > + *
> > + * See: "Exposing MMIO regions to userspace"
> > + */
> > +struct xe_mmio_gem *
> > +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
> > +{
> > +	struct xe_device *xe = tile_to_xe(mmio->tile);
> > +	size_t size = mmio->regs_size;
> > +	struct xe_mmio_gem *obj;
> > +	struct drm_gem_object *base;
> > +	int err;
> > +
> > +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> > +	if (!obj)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	base = &obj->base;
> > +	base->funcs = &xe_mmio_gem_funcs;
> > +	obj->mmio = *mmio;
> > +
> > +	drm_gem_private_object_init(&xe->drm, base, size);
> > +
> > +	err = drm_gem_create_mmap_offset(base);
> > +	if (err)
> > +		goto free_gem;
> > +
> > +	err = drm_vma_node_allow(&base->vma_node, file);
> > +	if (err)
> > +		goto free_gem;
> > +
> > +	return obj;
> > +
> > +free_gem:
> > +	xe_mmio_gem_free(base);
> > +	return ERR_PTR(err);
> > +}
> > +
> > +static void xe_mmio_gem_free(struct drm_gem_object *base)
> > +{
> > +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> > +
> > +	drm_gem_object_release(base);
> > +	kfree(obj);
> > +}
> > +
> > +/**
> > + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
> > + * @gem: the GEM object to destroy
> > + *
> > + * This function releases resources associated with the GEM object created by
> > + * xe_mmio_gem_create().
> > + *
> > + * See: "Exposing MMIO regions to userspace"
> > + */
> > +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
> > +{
> > +	xe_mmio_gem_free(&gem->base);
> > +}
> > +
> > +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
> > +{
> > +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> > +	struct xe_mmio *mmio = &obj->mmio;
> > +
> > +	if (vma->vm_end - vma->vm_start != base->size)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> > +	 * whole buffer from the start.
> > +	 */
> > +	vma->vm_pgoff = 0;
> > +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> > +
> > +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> > +		     VM_DONTCOPY | VM_NORESERVE);
> > +
> > +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
> > +			       base->size, vma->vm_page_prot);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index c151ba569003..2990bbcef24d 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -8,6 +8,7 @@
> >  
> >  #include "xe_gt_types.h"
> >  
> > +struct drm_file;
> >  struct xe_device;
> >  struct xe_reg;
> >  
> > @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> >  	return &xe->tiles[0].mmio;
> >  }
> >  
> > +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
> > +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> > +
> >  #endif
> > -- 
> > 2.43.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
