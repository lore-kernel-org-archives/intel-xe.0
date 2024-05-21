Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBD3C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 16:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36AA89321;
	Tue, 21 May 2024 16:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEUZ0dGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400CB89321
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716307770; x=1747843770;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3OKMngDhowx037HaIquVFad4HBTbVHRhuUL+MCZPIw4=;
 b=JEUZ0dGGKUHV7s5cRnNTv8Hxi8gcXJjoFM1EJHmD+ZNx//llTBrOClSM
 5gvCipDXlz7B4ZOowL153B0ttY1nwHBjCJVgqzVxp6CVoiRnCEOWqn+3O
 jELzNWuHg4vVjtPfo4++4VrBbEedBYBtoQFyfxZVbMc0kYI6HjcF0vPaM
 5m1A51LggAtzsNi+aZ2kFNAQitQ8TWrzLWvzGJiOby3pycYi/LIwIR92f
 E7D9xjAR7qZVk6vhSvAbuF3ZvtHdBV5dhJDD7U/w/p9RJFEIjE7VFSHjI
 RvkGB588PiktjnCJrz3DSLznau1RXonk8qq5JrrcvsnutMMfD+rnK4e8N g==;
X-CSE-ConnectionGUID: GV6josObSXeJvxT3PaWMew==
X-CSE-MsgGUID: Pb9Q/Gh2ThqURsdTXDyV/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23650490"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23650490"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:09:29 -0700
X-CSE-ConnectionGUID: YIQKeisIQcODBnM24SMkmA==
X-CSE-MsgGUID: 1l4x/vZhT12Sb1m3p0CENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32833879"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 09:09:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 09:09:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 09:09:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 09:09:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2D994rBDqrsYgbnMIBBR1ChkKrmExi6OvqJj7C1mG2rlywdc2sNME5F60G8fsRm8FNdEAhamNbEpza5Nnne4sszgC8tkx/0bwFHuVnGA2k+s9gMEVTtcHCK1TeCai/G5fzUSgfK30oJlmUeTPafmOe1szv+EIdNKey/m6lCIw0MnraycZ+sl6qyViEheX1XYEF+NoiDPzfGQeDz4lkq5HZw4qVCwhvNUOyx7JlMYf68QOdkB2tIo4VVT7t7R3vxT8a+ImagvS/dWgejmoNMxdzb6YonOqawvKjdNT+OscglOQ3z1IY1SWsal89LEyevz+sLbbhVZdHvVZL50tSLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtWCEyEkq6Hm9ny8fgUX3ZD5xzWpGSULrOzomRJ+t1M=;
 b=a8UMtv9w5LsIGcoOTuHiMfuuxbGkBqZDgaKUolsyiDnhfVA3skPkDlfILYHuJV+y/NJXVjVbva7oDUQgTZ234unditP8ccY6HWnVCxTHAPCgI3ZRWQEth0l+Dy7zPyKNW2lWI7I8dGks+/QpxBpLB5rziykebJESIKXxZXA/xx6U8z5NczjYQIAVtni6nnsQoOhT8Dlc3h8n6amVBvi5soMJygEOezRVYMBhMxDAlTmiu4dJYG1sbhCfmjJ4DRnwhqwMJGb3liKU6zPa//OiNUiRd0QZESvkyhJoKrkoay2yoTBOpxGL7j+WOTq0DlCItFcMfeV1UypPXmUwFeJesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 16:09:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 16:09:26 +0000
Date: Tue, 21 May 2024 09:09:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>, "Krzemien, Robert"
 <robert.krzemien@intel.com>, "Jablonski, Mateusz"
 <mateusz.jablonski@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/uapi: Expose the L3 bank mask
Message-ID: <20240521160922.GA5383@mdroper-desk1.amr.corp.intel.com>
References: <20240416145037.7-1-francois.dugast@intel.com>
 <20240416145037.7-2-francois.dugast@intel.com>
 <2a0eaa1aeb074fdd98f32d3df84826d7903c981b.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a0eaa1aeb074fdd98f32d3df84826d7903c981b.camel@intel.com>
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: a7074df8-ca27-4bb6-73e5-08dc79b062bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Tq1L1+xzOGfAPIJ8ed9ebD3e/MpTOaJHjo1SRJmK1ORy7k7wcfWkN2eEiL?=
 =?iso-8859-1?Q?ESnIMWHyb9rtVQznttefpnWciMJM+h8/NQZBejDfifc7tSdtR0qcfNQRJE?=
 =?iso-8859-1?Q?4d3+l2E9NkLPcMKgt8LB+P5r46Nl7ty7VioPkOJXg7gquqph6puzREUG4B?=
 =?iso-8859-1?Q?cnStHpJMeXdxlZqXW693M8j/KaOeTD6pVBnfNhA7V5ocQF5UWEyK6xvYL7?=
 =?iso-8859-1?Q?AnxAePNlQlgLlzw74EzEOQdPa9VkwImjrp2+LBCxU5HegTdYdphMEWVkFY?=
 =?iso-8859-1?Q?Zbk3pZUjHNEtUu0lEo2Lhm5ZHbse1ICp+Zx80cNhCqVqRd92s/je7n2JnQ?=
 =?iso-8859-1?Q?nOHODQI/nAju0mp+8XOP0tqE4+cSOiJ4gJmrBga3HtpWfzpAQye067ESwR?=
 =?iso-8859-1?Q?f9jlp4IpELDp5WUwOf2XWcGjgw8xMWBH4FuS46/MGY9OhV69mMdrXXIK5B?=
 =?iso-8859-1?Q?JjaAiJXBGuK5PN22Ll0eAIB7WB9xN+/9PhHvGMrX5X25Etvs5V0mCSBqu8?=
 =?iso-8859-1?Q?gpUIEemUty9lBZFZ53MFzkwHoCDgF7bf1UCTW9M9Ro5I8vuXzKiMbFwOeT?=
 =?iso-8859-1?Q?vxyqlrpITq3lLgwg5ua2BySEr6yRbEGpJMbIfvhq8jm3I86PkrVx8CNCcm?=
 =?iso-8859-1?Q?fOc7w1VCCZ+GkYJgrRQFdBNh8LlS+BR0vqzi4V4e8gChJS7hJlDmAmyKF+?=
 =?iso-8859-1?Q?F09NaoQXXTsnoRoQMbPdMXxK5S9+Mr3sZ/kjeY7zqvOHBBfoMZaVP0vXMD?=
 =?iso-8859-1?Q?PlDWlDtAExiV1z1s4lmXLD0iaAZbJQNlr3UedaZ+z+RCOvjT3NOnd0J6DN?=
 =?iso-8859-1?Q?GaP1tZPmphCjZDHzwFRudIEGKXXR2Zsys6vGApniwsQera4+Ge19yLEvOn?=
 =?iso-8859-1?Q?SiYt1ndhK9V+8MnUPNd0pvL3x7gVFJfUy9o50NUa8IfNPliLZHNsucYc/W?=
 =?iso-8859-1?Q?y4G++4XSsA9rK1vl3/jgiHTqw9++AqUrZKOjWSprkmynSQ2jdoy38d9Rd1?=
 =?iso-8859-1?Q?J7FwlV7MF9UJ3dEwbtpYeqxdwV42nafmAD3IJxdLjJ/8G10Qfkl3TjXILm?=
 =?iso-8859-1?Q?VJv62VuuAn8BAGlNkBdukcJPF52OGIa+pg545tKBGH93yGN3Ii+hL+sl3l?=
 =?iso-8859-1?Q?QgtRbsS8UlaqEwZ4BiGAXYmUm2acomt61ZOXByv3exPnLNb9mkIE3mBkXL?=
 =?iso-8859-1?Q?ZEazEb7XSCmZ0WfCIFSxiqOPfnZZnKgnUFVAbci2wTCD0ul+dMZRllGKQ/?=
 =?iso-8859-1?Q?g129Si08ACJQNYqHs4Zkiymp6SR6Hpx2okN/4N4Tw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KEnYLGYDvSynalYm0pBzlBlg8tj+/IUPt1545oRR/NWiI4/nvX2UoFZXGt?=
 =?iso-8859-1?Q?NPk20wvo/I4aRml0NHdoW7Zf3oHVryzC3Hd73nTMMPe0mAWbv4iD7TPY3a?=
 =?iso-8859-1?Q?kAhZ7REd0OW33HhPtm+P8H6JC8se/tw01ECl3TTqH+hOEaXEd224EjlmUV?=
 =?iso-8859-1?Q?7tiAlZStoPG3p5AgFJfE9e0D69JPMxEUFsaWZQK0uHeO7FcZYAs722npYl?=
 =?iso-8859-1?Q?KWYVR+F8ccK/SUvUnKYD6oN533SaBLPCgDrq3ABaavkrTIs1rxuxyxSOUa?=
 =?iso-8859-1?Q?zzoCfsf25nZ8lIG/iKqJ97yB9yVasRdY0D9927DZiRW/QztBkOb2wjZ3gf?=
 =?iso-8859-1?Q?QGqNk0M7QSy9XPJBsNdilZKMQG0D+8uX4i1VKqeV3DxBN02t02uccMx2AI?=
 =?iso-8859-1?Q?UC2vToOI9IG1xcPjxC9yhCi4KP3HpJqscCX1H+eSoWV6dLfbjikli9Z/Hy?=
 =?iso-8859-1?Q?slyRAsMFXkViI0cT18//6+z9E7MPukP5msbCq3WUqMam0mPGeMHrWbcGwK?=
 =?iso-8859-1?Q?XmSySHluDr6DXFXFN8P74oArqSC3MeH5oQArnuUvDelNBX5xjahVwg3AqB?=
 =?iso-8859-1?Q?sdtMGE9Buvjjj4qyAhX93XhoBZe/RcfdGcM9HH96w+TTfu6daW8NKyMx4s?=
 =?iso-8859-1?Q?Y/usXz4yLKUowAYNha8AHrAUiuJ3I3wafje0ABz+R62nMJHAfSFiN5u4u7?=
 =?iso-8859-1?Q?Pvw5+pL5CoYeeLF9ana3kRo4KTvXvDKi/4bC0twLoxyW2xvtSPcptLz+Z8?=
 =?iso-8859-1?Q?uSa1UBaC0nrYo4S/GQMKQOjM08a7LhcetGP90PmN3D+ECJ8rv4c5qTzhco?=
 =?iso-8859-1?Q?Q3H5w2fjwRbEV9hiOjAPZoEpKj68ZEVrYVF9foAkJYWOLs5FfjFjewpUID?=
 =?iso-8859-1?Q?EZTDtJsG4fIekTIR/p9Qu/gxu1V0B4olt60qZ1EGIDbhUHz2XfhzHVjihA?=
 =?iso-8859-1?Q?REnVH3AfwPAZTBJqOx15F0CbLFD473rdaeBihsFxtxNZEQf58oD7PmxzAt?=
 =?iso-8859-1?Q?7V/mK58hT/CRtwKdl8xZMpQ2Ub106Dnp1pxqeyz5pfSb32V4h1sOfFnThA?=
 =?iso-8859-1?Q?YNDN/6VraX7FVecCze1Q86+lltj+fhzg6D7wg3UXYgR4YOQM8nvHCJYhqU?=
 =?iso-8859-1?Q?SSHH9Ux5RncryXmqZBVt++1CzDjHt1sh5BIwdJETSMpmRerXqhGOZ5zWgD?=
 =?iso-8859-1?Q?VS1/XaBV3mywyfJ2e6HhU45L7HHq9kiik092eWHZncwGHySASgLXuTafDO?=
 =?iso-8859-1?Q?YNg9hCDsfR+A18pe+zOJk57hjSJQEdnH4Zgs2nE45wvZ8/SwE4ohlWwAhU?=
 =?iso-8859-1?Q?SkaBKOlSDOdy/aGhONMKiSi8TQ3Up/93Cyl4PWSirMP0bJso+19VCXU8e8?=
 =?iso-8859-1?Q?uDZ9x+pMuxcssYArhumPJcffJOskVnX98wrKTstMEjpSGA9TorDTy8wwGP?=
 =?iso-8859-1?Q?F5C6SXBIz2c/DlRhuQRNvsmMTD6WOBqABtml2KHrNxt6IsEh+y7e2DWHGW?=
 =?iso-8859-1?Q?bDsSoJGOv09VHZAHNjN3X+f7thrSBb45GviY+2BJnRl+ndp8156r9UzDbL?=
 =?iso-8859-1?Q?3dluZmHVSudsesDYOMHvC8D7Wmt87Lp31E59LLdRwgIMbh1uDkYTTjKs47?=
 =?iso-8859-1?Q?eGv3zZB3qjfuR+qkGHaRF8Rw+ZyHPnPOleK878tw8Vt39AtfZLIyqnuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7074df8-ca27-4bb6-73e5-08dc79b062bc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 16:09:25.9234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wx3lJJYOYqY1L3Vh12d70QtHjl9nst1EgVDeWzbH6p7CGEJrCKGFGDF/nkTmEiLrjE7AZu+rT0faoL6S5iWH5wWNH/Q1kcVQq+feFiwgNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
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

On Tue, May 21, 2024 at 08:31:12AM -0700, Souza, Jose wrote:
> On Tue, 2024-04-16 at 14:50 +0000, Francois Dugast wrote:
> > The L3 bank mask is already generated and stored internally with
> > the rest of the GT topology. In user space, the compute runtime
> > now needs this information to be added to the device properties
> > therefore the topology mask query is extended to provide a new
> > mask which represents the L3 banks enabled on the GT.
> > 
> > The changes in the compute runtime are ready and approved, see
> > link below.
> > 
> > v2: Rewrite commit message and add a link to the compute
> >     runtime PR (Francois Dugast)
> > 
> 
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>

Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt

> 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Robert Krzemien <robert.krzemien@intel.com>
> > Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
> > Link: https://github.com/intel/compute-runtime/pull/722
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 9 ++++++++-
> >  include/uapi/drm/xe_drm.h     | 2 ++
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index df407d73e5f5..6e0170bdae44 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -454,9 +454,10 @@ static int query_hwconfig(struct xe_device *xe,
> >  static size_t calc_topo_query_size(struct xe_device *xe)
> >  {
> >  	return xe->info.gt_count *
> > -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> > +		(4 * sizeof(struct drm_xe_query_topology_mask) +
> >  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> >  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> > +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
> >  		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> >  }
> >  
> > @@ -510,6 +511,12 @@ static int query_gt_topology(struct xe_device *xe,
> >  		if (err)
> >  			return err;
> >  
> > +		topo.type = DRM_XE_TOPO_L3_BANK;
> > +		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
> > +				sizeof(gt->fuse_topo.l3_bank_mask));
> > +		if (err)
> > +			return err;
> > +
> >  		topo.type = DRM_XE_TOPO_EU_PER_DSS;
> >  		err = copy_mask(&query_ptr, &topo,
> >  				gt->fuse_topo.eu_mask_per_dss,
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 1446c3bae515..d7b0903c22b2 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -508,6 +508,7 @@ struct drm_xe_query_gt_list {
> >   *    containing the following in mask:
> >   *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
> >   *    means 32 DSS are available for compute.
> > + *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
> >   *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
> >   *    available per Dual Sub Slices (DSS). For example a query response
> >   *    containing the following in mask:
> > @@ -520,6 +521,7 @@ struct drm_xe_query_topology_mask {
> >  
> >  #define DRM_XE_TOPO_DSS_GEOMETRY	1
> >  #define DRM_XE_TOPO_DSS_COMPUTE		2
> > +#define DRM_XE_TOPO_L3_BANK		3
> >  #define DRM_XE_TOPO_EU_PER_DSS		4
> >  	/** @type: type of mask */
> >  	__u16 type;
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
