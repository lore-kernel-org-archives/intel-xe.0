Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B1DC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 02:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B831810E05F;
	Thu, 18 Jul 2024 02:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXDh8Qho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B4210E05F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 02:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721268647; x=1752804647;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S3eHRdf9GVRABGQ+5a1mZ3kPdPVsw4ahsHk3xpSGzZg=;
 b=MXDh8QhoBqnobGKsJoflBFBJsMcUkYozdD8XWADpHGEl9DVsv2MWFLn5
 pUDQ9iibDrvLR3HNpCwfpc/3WdLrFUFWeuc9oBMqSVfLE116wJmugxUn7
 7nTIEZMrN64cGN75NFonuV6Q2ekQkpmohf/EoTsyvu7nSiwyKIsar1pik
 qT2pop6G0Rbgulyv5olCAHc+m1T21up/cFPQ0j8v0sCRAT9cucpQboJAi
 ks+TgZCINJLsUIu0h+fTqa3cz8y105gFMkwEiNp+F5wYnFrtRw6AsywCu
 /qXr3jrCiUWqE2hL+tj7Nq/wRCGzzlslJT5AxX7MJC9m2i8J4THX/2IYI A==;
X-CSE-ConnectionGUID: V+urwBnZQzO4sxq1+c5tww==
X-CSE-MsgGUID: dAhb0S2NSHig0P8w3CzlfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30222407"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="30222407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 19:10:46 -0700
X-CSE-ConnectionGUID: 5EofuBV+TlWRLCR0UcInSQ==
X-CSE-MsgGUID: j4C4r8KnT1yPgFbta3r/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="50318640"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 19:10:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 19:10:45 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 19:10:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 19:10:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 19:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwDeTmK5x/BT096ZJCKP6zePfeST0Byzjlos2sx69335uyC7NFL4bH30YQA0eGC8LTQy8zmSIybvNNHcKIjBrrFV3iK4JEL7AvGFYIYBBPl6KzG/JD1PxjuW/euCEMkxvFFFPc5GAOADCIfY3VzZjVVfiN66FEcBx5YjJ938fMRJ8hmEZkPl+sL2SsFxZHEol3+1Bd73uXXtmb+0KD1uD1dEGFHBJEZoppPygQ5/AlP3mD7cU2UAbyN/v7+WPHUNiHK12u1WnyPYWswqR3lwFh3FitnfzjfPKFb2/wNNEG6o+uWm2X5tge+jt3yfK4YDa5uQ0jMIUVu5JE/ysLJVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3CAcdoeuDBFbG8F8CG40U2H6kn6ZHBsbnoLyhc34ow=;
 b=sDiL/A3Up3ikDDrmu+H1JmcYSMQ5miwrJYcYeNq86tHEW4L1/K2cqvIouFTOf7saTQmY0Gwb30oh6xHKTSteTVlamJqDPzfbyVLxWY/kP/cKaZ+0WD8C9u04gXtklJ5ThhZ4pmtA6GjSqlM9ODYH2jlG0Xzy3rvBFkmFMf0Avl4OyB22xNnxyVPuHhLOOimonyiD3EbF5zSwxCtBCWeGlUKR8C8Gx3S8jPuK3AAauE6qPhFd6YbRIudFuxE4HONxLOc8anrejAXC9mKmUgGiGo/oDhVlpCAXaq26vbDlXSTsm+cO7C2i0nMYfzbMMREncGxG/GJvUEiy7uxh2zYJRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5812.namprd11.prod.outlook.com (2603:10b6:303:193::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 02:10:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Thu, 18 Jul 2024
 02:10:42 +0000
Date: Thu, 18 Jul 2024 02:09:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 7/9] drm/xe/exec: Switch hw engine group execution mode
 upon job submission
Message-ID: <Zph5dF5r9emxSMry@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-8-francois.dugast@intel.com>
 <ZphMQp7ZW3Xhhpwm@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZphMQp7ZW3Xhhpwm@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: e23e82f8-b58f-4474-56ee-08dca6ced390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vjrikF5oVugYG43qW+xV4x6zvY1M3AKWjNNoE7v8G5gQZ/Aq+K3wYMKkKZku?=
 =?us-ascii?Q?p0tZO9XLS57w4ppX1sqCeomzmym6WlEP8UwYuMElvkYEMxjrP26wdNBRDdsB?=
 =?us-ascii?Q?2rI7xrHt4qW9Afhku8Q81dpI2g1AWrcABUG3+HYLmFy9ZkHUECYu0Afs4UF+?=
 =?us-ascii?Q?7pY7l/CxOHYamfLWop6fWxWWNi5bDRABEZELOGValcb6OwI1ilSSE5VgTuBc?=
 =?us-ascii?Q?ueesZe2vsM/jLYagFDCCOkauC5GgnROpAe29z91N1UlNM2QzGMMDS9p6RH2O?=
 =?us-ascii?Q?47jcO3zWoeoVGF1V+vJpzOd/+HtVFnZxN65Gdtmg37AZEVtaPos0OKnE9xYu?=
 =?us-ascii?Q?3g2BMt2Uh3EpuGuzZWAx3UVQjepc6EL8qLXnpMZ95A0VhhLe1NVtUiyq9awS?=
 =?us-ascii?Q?iiKDlhsvRRHNMJZ4QCgdcbVIv3w8lZAfo5bMAZfhbmxX7HkEFrTrXrPEzuEQ?=
 =?us-ascii?Q?Z5RQmo12A7XmWmzNfvCHlijYCF6+STCCIAEtOXBSSRYkM8+Kfg68Hckhwh6O?=
 =?us-ascii?Q?dj+Zx+z/aoPa6LSZ/ylCdaNLiyDeomvFdt0KBIsbiQzu2Pl9fYf+jjR/rWZK?=
 =?us-ascii?Q?Lz855ruSkx8Aw1WFzsm/vai/cKcoe1Z370+MDIBiVEQzRR6pE8g+xscTNSDR?=
 =?us-ascii?Q?APAQWJ2tKBIrIp8ZCZtk5ZEebDMslkPr7/6U5jfg+bPnbIWl+6sEmMKZm33d?=
 =?us-ascii?Q?iP7Rxs4UFgnag6tJ1HGcgpadraLgXLSyCo6EJr74vFj7uGHG3kXPGvtrEq9s?=
 =?us-ascii?Q?Zk+wm6P1UGmQIvX78RgHPEMjRF3Uq1hymXeKYSN7GyVux7rvPiGTD5h49zN6?=
 =?us-ascii?Q?69cNPe7EfJZ34REchS8tODIQ5L5oKyN6gR/Gy7Ok8PCQH/ciKnCm6c0YqMqd?=
 =?us-ascii?Q?tg5WGKM/Ss4VM2AEyMpTWZgLI8O1mwELNuiykt2VAiq/WMmJPVDswWF+ldBV?=
 =?us-ascii?Q?1fb3z60/y6xprGiwmaaffvT4OSkCEfKzHGr5b9z/ML4faBtCm0lYBjhYpuUc?=
 =?us-ascii?Q?OHo6YgBm1sbU4uGoYboPeWRmi4LumRU++ne+umuPjuPeKxd01G5iGN+sxhm2?=
 =?us-ascii?Q?RrVkhFEpaNHABcyiskrFqG9QQhX3U09Sh30wIEbWHraK8P5vpcQOyT7szj4d?=
 =?us-ascii?Q?CRCP2/3NtqgpdChESXE5+72KV6QRK+/NnLTHqyMwMRj+H3hikn3qcs/AJS4u?=
 =?us-ascii?Q?W/yv4o6J5JyZI9SEqMSdWCe87sycjLhly41z3v1XP91vUOIUFL1hNDbpGkFR?=
 =?us-ascii?Q?ZV9oNbM8novOXZsBi3/xzYb/2LTaK90b2nUQhs6fHFq4zytNtqI5aVjDfwww?=
 =?us-ascii?Q?0y7PHGPOZ1jsVqJQ7N6qhwPQVgLADVDDYdVfREAbrU2Phw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tv2DSzDNo5HWYRjav/hlZIP1pgFV+wRkcNVdR8Gt/8agJNf5euvluEaqfMbt?=
 =?us-ascii?Q?z64eVbg0/G57JxhaxWDIDtQuCLpUFX+qlLahL79nWgFObqss9aOjs1RrxZIp?=
 =?us-ascii?Q?LdtkmGO5pymZpy6RHDIq4lv102No+/NrQyz6SfhxNZZa++1gjF8Y15NwnDxA?=
 =?us-ascii?Q?Sv5tP+NPskEoi4nNRgS+4vJxAxBAIs8VMvCC2KmVj3+vcd2cJD6wB2HWYB53?=
 =?us-ascii?Q?8wqKy8S30FRM8t9Bcu4Jet9XX/DKLFhXOFQAc5rV9E/wzWDz3MEmFe+aJ76t?=
 =?us-ascii?Q?JDz73oVgKmY9icplDN47lIN6FSz/t3KIPq+bLY/9+WWlT46MMi8ejoSGvJSB?=
 =?us-ascii?Q?O6ru4p3pGn/Li2u9y/Urqx0sUWbCJqn+0IH02pXFru/BElMWOW/d68R9NTDk?=
 =?us-ascii?Q?+h/toU/TZoHi36BbNso+WhR7bugQJ+4jibE1PLgtpYLm1066bd6YHOIHWRNt?=
 =?us-ascii?Q?MYCPV1LjcBbkIvoQPKHdKbWdsyy2Hc/Oc7ZavFrb3hWYF2CNEFZ96fd7rS07?=
 =?us-ascii?Q?+eezH1sgm2fd2wxaAnns3c6JE7Xr5EFABFJ7CBKyi2tfo9t/voVb41akc3E3?=
 =?us-ascii?Q?B4GQKyoYUoOApJkBRV7Q33bFbWBPP3pwaGAy5sqRvcLDzU1T15C2LLjBGWEP?=
 =?us-ascii?Q?oKfDXgiuTfzGVrNn1fimdsCvU8NRD3yc9XdAD49JX2t99zoXtYcxTYcFSJtX?=
 =?us-ascii?Q?xXzXEMylYHCi7pwW1jytFeYDxWKALjEoda9AJww8jebIaFcUd2yW/WA404wc?=
 =?us-ascii?Q?aDaWYP6xKKOPHXM3UILvK+7Qf0xbmhU7LIABrtx6Vc6kgIzo3BTD2REuN9sn?=
 =?us-ascii?Q?cR59c4w9k0IeRp+/JHvhtXL5jOYj9771StSoRTDYxO3aQsq0WEm8jI3sMV7k?=
 =?us-ascii?Q?Ce7qer7NPWEnkQDtLymS06wMi7xSJnJAMFuJ9S987BBPY1xPA2XtA4G5MYZA?=
 =?us-ascii?Q?J4dAPeqb0xHXJiEHiqX0pb8Tv9C6iNhuWv2xnskTU4mW9da+n3mZAfhtgoKf?=
 =?us-ascii?Q?oDmzsOtiwFXbJL0Wu1YcmuV5h1GlYcXez+CTCNvGi3aVe/BiJgQuBeFKcAjk?=
 =?us-ascii?Q?E1EzRJ5c+ab/KpePj5bowDU8cqFy4CcJR0p7VHE9mNhIL1WNy4jruu2YjVue?=
 =?us-ascii?Q?WQinAehebXdQ1tkNgIQ863j9sLjaTaDnj7Uzh2pH35+tC2h3T5yDWmovd8/4?=
 =?us-ascii?Q?Zmv7lBE5Jh6KMx135cEBSlZgP1Sy+JDH3Ql2cLBW/9GQ24S097kDq93CBOs4?=
 =?us-ascii?Q?FBO3TQTcszr9+dnPOy3uETMb2px/WjCGqRxKNNV2JeJjXRXJDln3dprjBlOe?=
 =?us-ascii?Q?RID90d3FXNrbpMz4xHBo+ie+ZN0Ms6Cpuj/1KjuWWUPT6GNhoZaoYsAD5MH2?=
 =?us-ascii?Q?X4GjccUkGNLTt3YiySQqRy6WXpMB39irpHATgbGtIIec4I7pnm1roLWFx0Di?=
 =?us-ascii?Q?T2y1T5g2ZkmjyQTZVLNKOpB6ZZ6MZ90t7xu+bdunGfoNnj3IFVRFI5ukbHM+?=
 =?us-ascii?Q?uiqp7c3IMsgayEynh1aZngWP7w+ZtBTFdykje5hd088IV61iMWdsnQmArusD?=
 =?us-ascii?Q?79YOnVe2jAgRHj045tXV0DQ+DMGadfEMOIOTYWsRl7xKuNJfWwYbxzMhiEZA?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e23e82f8-b58f-4474-56ee-08dca6ced390
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 02:10:42.4140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5gU9JriZAaVUWBi3domuQvhn5REe4+aik75Pfoo411XRgwckx/qHKP2iRNm/BsYr56AK0RsdVmLul+VdBl3Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5812
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

On Wed, Jul 17, 2024 at 10:57:06PM +0000, Matthew Brost wrote:
> On Wed, Jul 17, 2024 at 03:07:28PM +0200, Francois Dugast wrote:
> > Update the current execution mode of the hw engine group which will be
> > used to run the job that is about to be submitted. This triggers the
> > required operations to ensure mutual exclusion of executions modes in
> > this hw engine group.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c      | 14 +++++++++++++-
> >  drivers/gpu/drm/xe/xe_hw_engine.c | 13 +++++++++++++
> >  drivers/gpu/drm/xe/xe_hw_engine.h |  2 ++
> >  3 files changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 2d72cdec3a0b..35418b5d1f5c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -14,6 +14,7 @@
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_exec_queue.h"
> > +#include "xe_hw_engine.h"
> >  #include "xe_macros.h"
> >  #include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> > @@ -124,6 +125,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	bool write_locked, skip_retry = false;
> >  	ktime_t end = 0;
> >  	int err = 0;
> > +	struct xe_hw_engine_group *group;
> > +	enum xe_hw_engine_group_execution_mode mode;
> >  
> >  	if (XE_IOCTL_DBG(xe, args->extensions) ||
> >  	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> > @@ -182,6 +185,13 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		}
> >  	}
> >  
> > +	group = q->hwe->hw_engine_group;
> > +	mode = xe_hw_engine_group_find_exec_mode(q);
> > +
> 
> So you only need to call xe_hw_engine_group_get_mode if in dma-fence
> mode as LR submissions are allowed in the suspended state. They are just
> held in GuC until submission is enabled.
> 
>

You will have to kick the worker though to resume if in fault mode
though. Kinda a trade off I guess but I'd lean towards just kicking the
worker.

> > +	err = xe_hw_engine_group_get_mode(group, mode);
> > +	if (err)
> > +		goto err_syncs;
> > +
> >  retry:
> >  	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
> >  		err = down_write_killable(&vm->lock);
> > @@ -199,7 +209,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		downgrade_write(&vm->lock);
> >  		write_locked = false;
> >  		if (err)
> > -			goto err_unlock_list;
> > +			goto err_hw_exec_mode;
> >  	}
> >  
> >  	if (!args->num_batch_buffer) {
> > @@ -324,6 +334,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	up_read(&vm->lock);
> >  	if (err == -EAGAIN && !skip_retry)
> >  		goto retry;
> > +err_hw_exec_mode:
> > +	xe_hw_engine_group_put(group);
> >  err_syncs:
> >  	for (i = 0; i < num_syncs; i++)
> >  		xe_sync_entry_cleanup(&syncs[i]);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 4f539711357a..e6c755a04fd8 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -1345,3 +1345,16 @@ void xe_hw_engine_group_put(struct xe_hw_engine_group *group)
> >  {
> >  	up_read(&group->mode_sem);
> >  }
> > +
> > +/**
> > + * xe_hw_engine_group_find_exec_mode() - Find the execution mode for this exec queue
> > + * @q: The exec_queue
> > + */
> > +enum xe_hw_engine_group_execution_mode
> > +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
> > +{
> > +	if (xe_vm_in_lr_mode(q->vm))
> > +		return EXEC_MODE_LR;
> > +	else
> > +		return EXEC_MODE_DMA_FENCE;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> > index fce0adf6a7c4..6dfebb18cbb7 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > @@ -76,5 +76,7 @@ int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct x
> >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> >  				enum xe_hw_engine_group_execution_mode mode);
> >  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> > +enum xe_hw_engine_group_execution_mode
> > +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
> 
> Same comment as previous patch, consider a standalone file for
> xe_hw_engine_group.
> 
> Matt
> 
> >  
> >  #endif
> > -- 
> > 2.43.0
> > 
