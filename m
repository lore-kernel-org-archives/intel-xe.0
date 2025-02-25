Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E802C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 17:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A3410E697;
	Tue, 25 Feb 2025 17:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeyCzxyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D60110E6A0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740504952; x=1772040952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dQC7OOAr8Z2UOcC+T8c9vl+tK4GlvFTGflpsrpQrFZc=;
 b=VeyCzxyZsnz27VoF/yuY5Nlib3wPMSVRMvo+DW47gK7TkESB1+VZ1ngw
 U9c8UlKdph6E/HQgpWPTjzQ4KLPZaKjtgkZp55Lq5gVTSC7+6vdTS6Tj2
 6MoM6i+y/k9QA7lzY/3qshxF6q9LwjxQcueYcmK3sca1BmQATZ7FmtgEB
 56jV7dKFJjCoqVGENPXB/tD0CsPO2YEAS7WSDxSQw0sWZoney36uABpzC
 xHa3Fv4cJhtC1DcUxVlwA8WyFD7ztmDMXurwZvTihpTXWVLD3pdweQT/9
 /1ATr+Mu2c5y+YqKTAWm+MStp6oAcYDsohR+VnoeuZsu8uz21J693Irxq w==;
X-CSE-ConnectionGUID: /301GPeoQkSHeEXJ3NUpvw==
X-CSE-MsgGUID: IKCEw/ZxR02QSTWjK38zeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41238652"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41238652"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:35:52 -0800
X-CSE-ConnectionGUID: PCkdspAjStWRYJGMOkv34Q==
X-CSE-MsgGUID: lkiDXxZKREKsL2LtlZm+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121395269"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:35:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 09:35:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 09:35:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 09:35:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy9Mv6vw62ukBA/m9wJfAD4mXWlxKX5Qyfs0NKdhWjA4zB2uEnytVHPov3cdjm/EYFGbFVFGKKN/Fnn3R63p6aVAW21J9h4HDMiJFwPKPLAJ5tcfDNYrj4qYNeDXEiQtqhu2ggKZMH4s30G1ffIZfQj/i0BPEZRq7Sqp1TeJyGueI8wH4T4Bc8778Gzx970SMZQdKDm4ORIyD1T1XTX/4eiyXhw0GtdMECmV43rDGnyD136LjgYw3YeJL54ZA6tMeL3Jq1ZavbPQBQhqcPLPpOKrtP1oguB6RKdrd7D/sJLmUFCqAKfGEB7+uwthIf91XhpUgoB5DG1t/HFhnBcHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/4KGyWEi5DIvTt203s8l0FaCKsvB7t98tl0P3+Ew00=;
 b=JdChz2c52YNnUl+UWXpmt4pOf5syo7WZDejRvPfhi3MdOb5h02oiS1TCp3bdRSUWJxY0EaTnh6WfWOpiob8df1LZYfLZegah+Uw1B6x8X6qNGgyNyV8N+qw8i+3bmPGzv3IrI0kFRhHvQB6XpBeUWXfjnbLKIodB6HbNZT3kG2MT0ruhrdgReHrIY6ECvMROJfx8V/N5T5FPlBn9LYcpzXc7c4yFw+UMsfp48TXMh67MJ+zY5lvk9bWMHWPWkw3RU9HwYwrM/2amsxiBkHY/KeAnqW7+YksJY70h3fsHYuXUBS1srbpOSw+l67Z1/2Yj2FMWXWP/vn+8NBOJiPfdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 by MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 17:34:53 +0000
Received: from IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::62fc:d6dc:d0d2:bc4]) by IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::62fc:d6dc:d0d2:bc4%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 17:34:53 +0000
Date: Tue, 25 Feb 2025 18:34:46 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/gt_stats: Detect and log overflow
Message-ID: <Z73_NsccUSG3FjNj@fdugast-desk>
References: <20250225131753.1170520-1-francois.dugast@intel.com>
 <20250225131753.1170520-2-francois.dugast@intel.com>
 <u2rjimcjpdknreojf22kyb3s6j4b7h6ki2zr6455nxgqxj4xzn@jpb6jxsp3chy>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <u2rjimcjpdknreojf22kyb3s6j4b7h6ki2zr6455nxgqxj4xzn@jpb6jxsp3chy>
Organization: Intel Corporation
X-ClientProxiedBy: MI0P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::13) To IA0PR11MB7838.namprd11.prod.outlook.com
 (2603:10b6:208:402::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7838:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecffa35-9333-4a29-c502-08dd55c2b6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7wLi7QA9cI+oHeGnAx5mUNl82n8YToBpRL4RQdGb06pkHqASopioLk1GRkPg?=
 =?us-ascii?Q?Sx0gRngXinBMD9JdyLFkDFFFs/RW1QGZfia+kZoASxSOS3G/QSjtEago8s5E?=
 =?us-ascii?Q?FtqkIaxpX3KITkCiFeYauagJaHvRO311/3y0V1qW1xB4lQiKqONNY3XoAd3K?=
 =?us-ascii?Q?WO9dVBYCi2wA9o6sPpnZ6SaN3/Fj/8qZKpTXtZ0GR36jGToDmfNkHnTQkgDP?=
 =?us-ascii?Q?Xin4IJSrql1+yWZhr5qIBGes/l/Uo0eMzjExqZTJ9YYXptUf54y03RG6eK2Z?=
 =?us-ascii?Q?OWjCftEXJDsSdYdZFszr/WQiY+TcAwiH0M177HUmB/VjkON7Xpqr9OppC9Le?=
 =?us-ascii?Q?YMUNAmEqTwm68QGcKYxKJD3kQFfs4e/GPkP+cARGLSG2E+NzYdPlcsxoZcQZ?=
 =?us-ascii?Q?6NH+SzhGXwiFLdgKfubDzTMrbBBQ5opziBQt+Atg1quxSCuIE65lUzjAgVc3?=
 =?us-ascii?Q?f5Jc9VwZNjuiyCS/E7Lej9YW1r9FhdS0Y/yUxePhesOjFc6LTLoeCf2afxD5?=
 =?us-ascii?Q?ZvyNmfzHjbfsKi17Zgh7Aw+Gt3w82IcKFbbIZX6YeXDVV2dxR40wxfKBkZfT?=
 =?us-ascii?Q?67h55wXbYXM89RHnB/3OeqpGgb4ydU1xqaSYHvzpvgcGx6W0MgxqxtyKMU6Z?=
 =?us-ascii?Q?0mlam2vw7HM9OC1ItWfc3tDJHBygDrpCf0Xqdx+5emeTri9cddmXLt9X3dE9?=
 =?us-ascii?Q?p01CfqyKigUqp4rbIbsCi5/vEGKH+lyTaEf74FAS7sxAFKSUq91q8rGV49AE?=
 =?us-ascii?Q?MxVqXF9zSsCGIy5nRooSF+AdwnmcJSnY00aOmKITwaBI3Jd4GH/+6AdVPEF1?=
 =?us-ascii?Q?mX7vkHW9zcJyDnNGysRwEQuaisJkrBYFaWaA3cQ64itXhuiEucfZhcQFfC2j?=
 =?us-ascii?Q?kc1sTLmoW9IOROssY+xVv/sU2WbmMcLFdKhViZFQeAuirABFVucsNxSC0rix?=
 =?us-ascii?Q?GwJvtgLJ1OBNCldxGJ1VgEES+OixDtUmFT81yukHRO/0tZXNFINJQy8dp4Ht?=
 =?us-ascii?Q?0jKz4wvnJc+Of6BSEYl4v6jL/FSE/HIIV5HG/ArtGYoCoy1sUXuyi3wr0vQF?=
 =?us-ascii?Q?EGGnKeRLO58FU8yR/f0VR/FRmR+HF7jcXKjs1Yc9hrZRhadv2TEQtGFQfUME?=
 =?us-ascii?Q?yZfrZCA2Dnc5uuV0v5lIJMY/06B+lekQp3aN2qh7zew7aIHhez7CTvbzXHNV?=
 =?us-ascii?Q?JX2ihejIidKXZ9//3/ZZM/HutrZmynr+SovmHzdQx86ZwjogzdWWJUqihzQN?=
 =?us-ascii?Q?kKA9wYyJkpov/3hud+kdiQUd+9GM2Hs6ArOHjx/kpGGCNHi/ezXJRiz6an/M?=
 =?us-ascii?Q?IEHw7g2udJlyrB7Ew0K5iq0fAmwyDQDZGgzXe/3udpBD+EETT8Sksgru2jy3?=
 =?us-ascii?Q?IV7hZYYXLeXD3OUJulVdPv3+mSim?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7838.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8PMg85xhzhZwBdAkDLq5N3t/MLcL3i2cwhWj4J998F6sUxLT+kZ8lMTNCnD?=
 =?us-ascii?Q?ZLQh4Dvsiv1IboCOVPSz0nRBhpnO/IQMBoF631J6gIFSVikdtEY+Pg9U82dU?=
 =?us-ascii?Q?SwZZ8Xltf3o/w7YvTUj/8ib9APgxiFLOQxwIFWZI6at6jZZyKjAKKkhdpJZ1?=
 =?us-ascii?Q?iu5jtfTHwvLHwKRfDZasZclVEyIbSg0nURe1tz2LrfHfsjEfqYeje74BqFRB?=
 =?us-ascii?Q?wysTOies3d1xjifZdUgkZlvLfo757un2zixn3DnrZshTc2ylFfG6xAXV/a8+?=
 =?us-ascii?Q?RyyvwlD6AMJFM5RwlikS/laOGcMcaLo4DlNY8DEQ1HiOOnFD8JvBcFXf1L1M?=
 =?us-ascii?Q?iNPN2GLCu6DKnj3MVNxKa/M3g7W+0bcyMgyL5OhmHXUd+DcZAy+701us/jrb?=
 =?us-ascii?Q?p09kcsko/oOhOl/CA/s0iS3up68AvXxhng7YZYKXXD7H3ntWabVqHI04fqxw?=
 =?us-ascii?Q?6v7yv7fVTQ0aDLKAcwVu0sztRjjjM8J1pKpnB6JMDo4GehgchomWKzRIGXIf?=
 =?us-ascii?Q?kKoADFbv1OIWd1MHivFzZH4wRo5Zczc9q8uKp4p+UxfDOetFS2aRy4K+K9Nq?=
 =?us-ascii?Q?yPdcWQq7M0QpO0tMnjJsYUJD2/xj0JAs+ovfRjehgqHkpoHDDW9syIAg80LQ?=
 =?us-ascii?Q?fMmNR59HBEBEKoT8m1OV9dNU1EqXGJTC+LtV8p4Bar48nXMZoZbzxB28flaB?=
 =?us-ascii?Q?lSAkUwv5jx050yci/wWW5mtNLzfUttmeZIE6xGQy53GTlKMwF6FDCONb85pN?=
 =?us-ascii?Q?zPJcIr7zbiE3T0f+urSYLRP7vtzkxz+T0krAi3MIzzwBEynlJP9PNUROgERL?=
 =?us-ascii?Q?3fr9kHqnuYSixovgINpNIipQLex+NLBXICUpT26hzrYrrEVk06KdJwv4a3Ag?=
 =?us-ascii?Q?VBqM7UQ401I2dsNQxCyZAM7J2UVRVH0+irVLaPwoF2RCzzPURp9KJnqIqrfS?=
 =?us-ascii?Q?zkcJejc+S65FyDR/JbhHOGbi4tPQKFYFwqlKQ2Tc/CnMwD2EW6c1Jjkf2Y9L?=
 =?us-ascii?Q?bWT4y+DaPvuvZXnWS5GJuiRrRIH4YW7nkoxiRbetnnKu5w+QAFxXRxr0593/?=
 =?us-ascii?Q?1Uika/DOOVa+kIBropaFg8Ziw6K5XpXXdnUHinXBR171mXnC4KCuUXLelDor?=
 =?us-ascii?Q?+1vfAk53/RWRG4V2sYVHKswesNv8jFqFeDnDYvcCEKcVRWF5DB90WVYIWE08?=
 =?us-ascii?Q?lDx2qhxeCsOTbHMXnz17zi3W9bFgp+SLAfxs66Z8q8kWpPelv+5y4uRWbj3X?=
 =?us-ascii?Q?XVFWMm6d/6oYs1U613DJv8p3TgrkR19r5wj7AQjcn1oVW63hkNFkeA1hKsym?=
 =?us-ascii?Q?K7Gr5cZV2J3hOYXLIT21gFWKopwG3hkJsgDMa8wlQkgKWvqZaL0FOB2UCHfp?=
 =?us-ascii?Q?gNKhLmoYAjFC8CVvCUU9ybu3SSxl+I4ccWfoRbFqMy6XpG/NUxs/pldVpq6Z?=
 =?us-ascii?Q?61a5OwU+HW/qmS+7+6i8FTw3hMpockxj7sARvPPTN3Tg/cgk22ca/kmXhE1y?=
 =?us-ascii?Q?VVuOCSEUk8RJBy/AFtyyaF0j7qJ2RtwTy50mChlG9rqnWuJSIsb7Wz2CypEN?=
 =?us-ascii?Q?geH3zhWo3Fzu9Tk+05rszLPREYsgG7n9vHs9xAmirVgOpvhtbMNMTHtoi4jE?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecffa35-9333-4a29-c502-08dd55c2b6e0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7838.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:34:53.8159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5lIfMdpW9w6a15+iMkiYauiXctyX1wdz3kXan4eZbZmIU/EHm3xb09w6EaB1ksK7VsMieOgg0KXjJPJLH+ajx+FXd352C8/zCJYm99Fj0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
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

On Tue, Feb 25, 2025 at 09:41:15AM -0600, Lucas De Marchi wrote:
> On Tue, Feb 25, 2025 at 02:17:04PM +0100, Francois Dugast wrote:
> > Check if the atomic counter limit has been reached and if that is the
> > case, set the counter value to the new increment to prevent keeping
> > a garbage value, and notify it in the kernel log as below:
> > 
> >    [drm:xe_gt_stats_incr [xe]] GT0: stats vma_pagefault_bytes overflow, resetting
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt_stats.c | 18 ++++++++++++------
> > 1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 2e9879ea4674..753c081b68a6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -8,8 +8,15 @@
> > #include <drm/drm_print.h>
> > 
> > #include "xe_gt.h"
> > +#include "xe_gt_printk.h"
> > #include "xe_gt_stats.h"
> > 
> > +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> > +	"tlb_inval_count",
> > +	"vma_pagefault_count",
> > +	"vma_pagefault_bytes",
> > +};
> > +
> > /**
> >  * xe_gt_stats_incr - Increments the specified stats counter
> >  * @gt: GT structure
> > @@ -24,13 +31,12 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
> > 		return;
> > 
> > 	atomic_add(incr, &gt->stats.counters[id]);
> > -}
> > 
> > -static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> > -	"tlb_inval_count",
> > -	"vma_pagefault_count",
> > -	"vma_pagefault_bytes",
> > -};
> > +	if (atomic_read(&gt->stats.counters[id]) < 0) {
> 
> why are we not using unsigned logic? it stops being atomic when you
> update/read/set.

That is right, thanks for catching this.

@Matt: with the 2 other patches of the series, the counter limit was increased
so much that the purpose of this patch is much less relevant. Is it fine with
you if I retain your RB and merge the 2 other patches of this series, without
this one?

Francois

> 
> Lucas De Marchi
> 
> > +		xe_gt_dbg(gt, "stats %s overflow, resetting\n", stat_description[id]);
> > +		atomic_set(&gt->stats.counters[id], incr);
> > +	}
> > +}
> > 
> > /**
> >  * xe_gt_stats_print_info - Print the GT stats
> > -- 
> > 2.43.0
> > 
