Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF5C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 10:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DCC10E1AB;
	Fri, 31 Jan 2025 10:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXB8LIc2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED9C10E1AB
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738320081; x=1769856081;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j7Sjujk2N3Tnvb3XKdmipvWApMD0Q64IGsOynD+qKd0=;
 b=HXB8LIc2B1w21a8jl0okUYUn7/gJGc6PYFJxZsdvsEKSByL1dIBrYLxS
 WGUHEvhl2XGD4nevLcfu/cWy9jRxnPUqKbrFDTWbB2WY7JfINLG5zof9A
 VgfNbEIG5ffAVOZvVV1DYHsKQ+2U4ubXGcPkfQjt5KMJcWsyDcmjhwJcx
 Grv4V5SJ7qbXuvFBA3GAEnAc196oM1+ik7eU+kk/YRKMcTySHji6/2iht
 7GeUXqQYKsgloD5CEG7nzPTkFnjL7dImdDDB4s9tPr20fcS/+vkuMLX0c
 gFK02D4y45Vrd00+ganIuc5WmEt9oDqqltHaxsiVQbgcuWqvFtpBqWqKe Q==;
X-CSE-ConnectionGUID: JQi4jqr1TX+yiVzSDmRV1g==
X-CSE-MsgGUID: lVYbCPLDQryEnk/R8rNK1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61355731"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="61355731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 02:41:21 -0800
X-CSE-ConnectionGUID: v5bBy+DxSIuKuLx/9goekg==
X-CSE-MsgGUID: yCnPiSXdSg2IGAD5Ae9fKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114202719"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 02:41:20 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 02:41:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 02:41:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 02:41:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+3p8ACeNxCA1Ga+NhUWWlKSiIVsI9mXqnBzePd54qmSsQa1voPoAaPvEzDl4FjepIxw5WFYl7yvncoFNZoRn+4RCMy84APla/UAGoN55okSJayfwyPs/ZBYB7bOJeZw0QgHMVbPpl5VwupVXtFUy030cR0f+KB83EKc0H6QCVmXbX++mWFbJdQ3yTNWg2HPC2Tk80WUdrT9r0IqW8mA5grekYuoLpNYh4DaMQxsZ7rTNXFICkzgb1qlt6Zb0k/bp1md2TROnpMSXtGH7QfOBheDTDclBemUAHDdKH8uHEFFHKW64PupI9Tgi23H9boh3b6k912nUetZ5gd0NRt4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPBLQyWfemvnup9eVIwaN7mIU/E2BvhpuUVkpWemQ2Y=;
 b=IbW1aqd1toCqXUjo0XGX81u9ASwAicWM1UKrdCxnHKgLTchk+gvH1wtF8A1DDnuvZgW5p5Y8yFltL9IPp3JikwJ776RuGhO3byCDBkT6+CAUEsfr2Op0HxovjDq6jWNvWAFEQnt0IkD6r5tZJezcvsKsl+i8v3SEGaBdoG+Uzzx2bbyt4m1hKD7pQBusv294V23QdvuZMhvS4bK18waamqSBR0Jd+MLm1fyBHp08Sr1Gh74Xh+YUdUu1wMsGLiQQiUkq/dC3pqsXihgLdjlQHeqW5pkYAMzscqn/YOuNVCw6xu4z392xtMiHjNPOHdmvOdlI+bHcMS5T7ekeWWTopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by IA1PR11MB6419.namprd11.prod.outlook.com (2603:10b6:208:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 10:41:18 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%4]) with mapi id 15.20.8398.014; Fri, 31 Jan 2025
 10:41:18 +0000
Date: Fri, 31 Jan 2025 05:41:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe: Skip survivability mode for VF
Message-ID: <Z5yoy-3z1i15sAbg@intel.com>
References: <20250131080527.2256475-1-riana.tauro@intel.com>
 <LV3PR11MB86955F5650261C62E14F5C94F9E82@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <LV3PR11MB86955F5650261C62E14F5C94F9E82@LV3PR11MB8695.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:303:8c::11) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|IA1PR11MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 57507bcd-69e6-4838-7c6a-08dd41e3cb5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qTaAjHc/V0Lny1Mrzk/kcEDTeu3ceD+NzHOpZ2SeLtEDuko4YfqzQDXWCLG9?=
 =?us-ascii?Q?2b+rxU43AKC0iTjCzJWFKvEetHZ4NPrv+T3sULD1+VmUoJN5jenR1p1y+qhv?=
 =?us-ascii?Q?lYvPfuW2UfDPGLwA4Q6qNK2/uVWhgkvFBkwpH4Iva6XdbGJuBgc+E3a8X4zK?=
 =?us-ascii?Q?3ensA6N6UYootz55OPWUtnvTF3H5CbsYRU7xbXU39VyJ0D6n6Ie5W1XhOkPu?=
 =?us-ascii?Q?ptIDqenPEpFLgcvexvlDhbz9MxSdYI7kSxHTPqwHuMsrL57GcEhFaePl3c8G?=
 =?us-ascii?Q?q4FWxciUhXrnP+050SbtFYdEP5s8PBzGO0qPIiTiIjvfzGWfouH9nxraU6g/?=
 =?us-ascii?Q?bL2CTg4yGdNr8ei0YQRaINzUXOnkH2jz4+DR9LVx3teg2B4tvQ6v3RO5hMSv?=
 =?us-ascii?Q?m+m/ZAlm7dOaDDmMQyC+4JQ2GWed7fggyOJXYl4Q0u7vBhx6G6f/34WM/6rm?=
 =?us-ascii?Q?pLMfMyS932VRolXAAwa231WCJJWmJ3oLdWkU8J4f6xsZlEy+rp8bIPRMjUCR?=
 =?us-ascii?Q?FoyH/CVgueB1PlADmFtyHSA2uEbHdkhbAWM3mNt2FRHYW4Ho+jXaIjue+F7D?=
 =?us-ascii?Q?GuiITZVc/AKMzKYRB7EA19Bo4Ia3Ir7dG37DJoqDciXkUmJfm+0N1gpncKuo?=
 =?us-ascii?Q?eY6xMtnI50Y7uRMYhkwiaSYViG3LvwwSi9OIbhkG93Qas9b2Ty2EzaRbkFpc?=
 =?us-ascii?Q?6s+XSSsPvnu7oAlosaxDM/ZEp8FrRmNmpBfN1lLVhKN9tNZ3ZXKGCzhtWm3C?=
 =?us-ascii?Q?gLUwS7mjUn4YkAzHzZGPEmPwyopWDOC+yoDE0VY5j/0pABtHIw+ulG9Cadz2?=
 =?us-ascii?Q?1iteBVnu45wHhDwsBnhji7LQJMD154vxuvKqXGs03hld0uY95919PivysDnY?=
 =?us-ascii?Q?CeGzDshZyTa8KLLruRKchXXjvySo19FWz1MmVHEPQsFPgkVI6HqsvfHUHlnv?=
 =?us-ascii?Q?0RqDfw1bxLwJxT07k6ReVpq7u0mIsV9yrLP/ctLx4WIXugf+nfOg306yxyPV?=
 =?us-ascii?Q?hqNodF+rideEuBau9PtXfqLuZhumG3Lz2ap2zeZXrUI8AT3tOxjWrW+MnhP5?=
 =?us-ascii?Q?srqrursnoRZV/a8Y5rTa+cp6KZcnWg6tFb75Y+DkreoJDaWf76cvYieucqWl?=
 =?us-ascii?Q?Qn4qpOTxxCKggssOKAj3OQsROw6yBS9kqh7CFg234JYXAk1d6ib7K4W05ArU?=
 =?us-ascii?Q?MZgbVgFOogMEOICVy+PS/0tltat5snt+9SwBlt99Fe+vo8wc5jEQpE77WL3n?=
 =?us-ascii?Q?yDONs9LcI+OmxCaQV2mnsepGHVMvWKGHGo2R3W1mjE/gn68yWB8EBORaDekX?=
 =?us-ascii?Q?EudlxxReruA3fxqq/AtV6dY4sYDyCkyrrjjwUhoVAjzw+DnPKDpllxugeCkx?=
 =?us-ascii?Q?XVsJWTB3yqAz1iXYbW2UZot++6Qz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IUw7LA5ajy7RBoVtKedSf8XDkluI1TdkAEkllGLDH6rB4lbOf8Iq05aB0wo0?=
 =?us-ascii?Q?EGvKLql2vPU4Bn7zT8oBs+ZyBG9hJFOkIel3vC5dFXSRTqYZpW/LW+m2daGG?=
 =?us-ascii?Q?CeBV3k4jUwRrSQIPDwf4cwbaMKfQDmBXsvvt3wDly4GwbOeF0CUfJlDM6rxG?=
 =?us-ascii?Q?eWmhLAcWuXMQqN3XmfA1h6J0Chdce8cFC114qzbUHf3dL0oJk7Vhr17XCOmd?=
 =?us-ascii?Q?4kcNCCn79L4rjwrG2Xeu9+kIRJvEtvHZRJg/KAebRSmuF5soGg3GqR6/5e8K?=
 =?us-ascii?Q?lpi1Ct0yG6zmF/w/GUjKldawjf0yDnYTzOJ80l8iZflWGjP6/plyyAuFZcGx?=
 =?us-ascii?Q?sAV7xIvmLr1idvwlsfX9IohM3oopOyhmkwMcxN8uVxu8vgtau5tRo1xb32qa?=
 =?us-ascii?Q?bTkKkQyJ1rOedMQ78riUdhPDE/Pv8dv5UhGDk3S1qZEUz89sDkpQ1qmQ7pGK?=
 =?us-ascii?Q?MbKXOGlrTRSa54DicMlnr9f8yPjaqhIKN4MbWce8n2mBeoZotKISnhRfLtD+?=
 =?us-ascii?Q?5HbQ9WrVwb4XyqYhsMl+fVQQcijR/rtxlpaPqM7CPejZQPCyGx6Ox3TQHpxh?=
 =?us-ascii?Q?xF7Go+oWEINtUaqLuZ618YgU3w/WybSPuhLEs84Q1ViulmP1Az/sRo6g3urM?=
 =?us-ascii?Q?zYfgehvVuvfs5/26i0+N359iEM6pxYR6dN9NrDrXrj6Qfosa5GeuVxHig41L?=
 =?us-ascii?Q?woQEBbg28iuWKgtq9BUmhA8dBwj1jFzL8+3EwPcucyJdDEl2MmrxHHkv+XGs?=
 =?us-ascii?Q?wa3QJ7vKh2lrOcA+jM0/ZfBwho5wWq7PphNPPKMi9520pOLN2gxCXLZKznru?=
 =?us-ascii?Q?iiK/qFR7MxfTr3FHopP1zagnXSh56WK5xB0ajezTvDAmbjyC7DjqXUD2kUQf?=
 =?us-ascii?Q?T7JkSuC7oW9xd9RoB6eUthBL+x2B5MmLpdOgQ5Smz5Ilo7UMJkOPiTzTmmoo?=
 =?us-ascii?Q?RS/M5pjqfH823muFUwH/D/0EJmynhGwUnpfLj8BSDaSQUEeLhF2LesllAYf9?=
 =?us-ascii?Q?9i3JMnqI6zpcIA1DrKrkZau+xrKP/E/tcnx1poqL5dGvgMMtxPAee88qacx4?=
 =?us-ascii?Q?+JmUh7dD0uJwbe2Q8A0d1QWaRZ13Y0gENLGrG86JBSl2OFwdqO1VbIlvoAts?=
 =?us-ascii?Q?5j6LdQHw59lP7XUgxyJ3WVzd0o5q9WVp0eHt6729n3+BBiInRG8JuEaar6cv?=
 =?us-ascii?Q?JAyH9yGUGJVBRajI96RAiJUnbcx2yWZkMrxdmN3bjgSh3VvDxfpISF+X0tN8?=
 =?us-ascii?Q?8QIaSuOil7iOBDc8bT1P+0piDXF7BDPpN1ZDCwU5C0Ldtqqg6Knzw1UfPZJ5?=
 =?us-ascii?Q?4uERpB57IeOAVZ0XUjPecDYTwJkoTZ0B0GNMWJPPLbEiGXFpU+8vkgZxQWkq?=
 =?us-ascii?Q?vGh8j8XhiLBrIMvuI0ty9o/sV8FwhtOqKdpkMFGoZs1bxGBRoc3Hl+PR9jPy?=
 =?us-ascii?Q?PCuDYbnra4ngG1mJyFCM/yptTuwvxpd0ctM6OG7Jm3+8GvgChfSZGDA3smt8?=
 =?us-ascii?Q?IQVomnOd9B2PTcoLOtoe4OwfgaOJNFyMTw+OsL+wmVX1lZBJPwLHTF8DdTwZ?=
 =?us-ascii?Q?g34ew4VR+VDeCGieMeir9NUxGh7hDpJy9WjG58fn3qVubN3Q9JpO+nZuLocl?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57507bcd-69e6-4838-7c6a-08dd41e3cb5a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:41:18.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6nuiB036XbbJBQNr8+Rbe8X6lOK5zD6xnVJSuTpojoyEAktuBk5cugDgojC3ZQSqRhQZTA5B6Dmd1RhuaykkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6419
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

On Fri, Jan 31, 2025 at 08:37:14AM +0000, K V P, Satyanarayana wrote:
> Hi
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: Friday, January 31, 2025 1:35 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; K V P,
> > Satyanarayana <satyanarayana.k.v.p@intel.com>
> > Subject: [PATCH] drm/xe: Skip survivability mode for VF
> > 
> > Follow the probe flow in case of VF and do not enter survivability mode
> > in case of pcode init failure.
> > 
> > Fixes: 5e940312a2ac ("drm/xe: Add functions and sysfs for boot
> > survivability")
> > Suggested-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_survivability_mode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > index c619560af74f..02b4eadf8407 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > @@ -177,7 +177,7 @@ bool xe_survivability_mode_required(struct
> > xe_device *xe)
> >  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> >  	u32 data;
> > 
> > -	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
> > +	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE ||
> > IS_SRIOV_VF(xe))
> >  		return false;
> > 
> LGTM.
> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

pushed to drm-xe-next. Thank you both

> >  	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
> > --
> > 2.47.1
> 
