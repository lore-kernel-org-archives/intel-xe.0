Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420E4D374A1
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 20:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D9710EBB7;
	Fri,  5 Dec 2025 20:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoCu8J4L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E6C10EBB7
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 20:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764968139; x=1796504139;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mkMOuxNeNTo+1leAbAFVjSx+AELXdvWxSJPJopW+BeI=;
 b=CoCu8J4Ld6+LEkNjkHmuAmRMqC+LfjJ/QkcJ2iuAuz2+geobpFxJE82I
 qGdxxQ8fLN/bJL8pegPK2krp2kfiGxJgLXc7BAMZVoNCz/Ip1kf6bneuW
 hRUIxABoNlD12RZ/jqgSJwKBhtCjzQQ4OAKuQKIl74KosbSVYmVpk3h0y
 GPEsLHzJoo8paJdPNNUda14sIa0Roe17ypNuNX7ASXJxO0CX8jYe0yufs
 tA+q1dGNXCyH2zpXiyKopKgpvVja2QPap3KIykpUjfl7KCYFv2HkNSOQm
 tdL2nUP6PamPQGmge/KRy3amG3l/BE7pP8EfPZlctG6vG85OXG+CknZgp Q==;
X-CSE-ConnectionGUID: 0AcbVQaAQrm/ve5xCrr+qQ==
X-CSE-MsgGUID: BLY0OXLzQhuOC6kISvS5pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77692360"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="77692360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:55:38 -0800
X-CSE-ConnectionGUID: Jhi1iujJQxuryaall/KayQ==
X-CSE-MsgGUID: jmUh36kLTuikLu8bS03JRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226040090"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:55:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:55:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 12:55:37 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:55:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNZkcXBvE6BB9T79sqDqlcORnFZe5luuhQGhiKGrGx3GKNyA2t4CU9Nu+OS1nZj9NQiTQscJe12NuCiqFRQDkCOSquGLyQhqdv99c2nygRVExC0Etqo5iWz96+wyBONerWcZACmeo4IAITYOzb3hkO0yX6MP2VeIIYFS7UapKajeiXxF51HEiuCBXpjsZSbn4Lf+TVFB/7Uo2kirvhIZZlTRG3Ue78lVCACjma7YF5XjQErtxKvEFzyMzc5/Ws/9cHryj4v/e0gr7rhP0NBdyl8nJiP/Em58NDumiPzK+3HKFUWdhvqNj+ZMRMnykcL89RkDbZ+DgzoA/FwA2SRYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rejbepq4me2IwIyPnxRPo/5GLObmKlPKLs+h/rf/1bY=;
 b=Xt5U5mFbLsOezFP6Hhp2xjl1wO9svV1Bs/DF2036ZZ/uKTPeHlSyCLO3KCVmEAEtbIhpSaeWBEJWmpz+Yyc2VQTDDSc3W91XozuLXL6mqWcYAubdRNPDlXa2+FqAk2rNmYIG1aeq7tEnBETeLdFbiy8sQC61Khv7pKGq89sdSiemmeU05/Mh0zxsWS/i4BK3WiwNOHCp71ol5DMyaBXVPO68spPF2vhzpKMZHHUmMIRBYJpz1yycitIbahz7//PVF8Xlbj7FyWN0KFhL5pN4UXTFCTbTIGpXJzqjjMkPcGGYhiSLaJlUFtLxG/tbDcK0bED9XPbW3yEVij8X3oj2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB9451.namprd11.prod.outlook.com (2603:10b6:8:261::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 20:55:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 20:55:35 +0000
Date: Fri, 5 Dec 2025 12:55:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/oa: Limit num_syncs to prevent oversized
 allocations
Message-ID: <aTNGxDOR5j04uGMc@lstrano-desk.jf.intel.com>
References: <20251205190506.2426471-5-shuicheng.lin@intel.com>
 <20251205190506.2426471-8-shuicheng.lin@intel.com>
 <87ms3wpsy6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ms3wpsy6.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:303:8f::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: cd00daa6-cdba-451d-7e23-08de3440a2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wyl6b3FNriaeDgG3x6ct+sheV3OgQupO/+Ns4A5IMAaOKvL2AMWtPtIN9MV1?=
 =?us-ascii?Q?dc/R7jxNc09O6oEMDsYtzNMOPmdyuXKj8Oqpt9OzywNJwtjOx3OA6V5BeUJu?=
 =?us-ascii?Q?FLbU6dhH6fclGBZ49d//fjj9Oxl+OeGin1czvzSs6tNJ+LUS37HApopqhHxc?=
 =?us-ascii?Q?GY0aJgBx89h+02rf4FdjQZYVVnUyNOfaIcj+FgHf6teH5Y3vZqwlLk5a0j38?=
 =?us-ascii?Q?RBktE+xrdBrYivAyI5Jmlbp4TvswArVUFmqW/kPvm2UM+xs73/gKGCARfd0K?=
 =?us-ascii?Q?4VzJy2f1OytHVQsTCbOedF/GgA9OvRpMmSxJ6OE30iZ/zx/Wyiu7Ykkj3j6X?=
 =?us-ascii?Q?3ZLbUYwpBaC7I9Dvx1gNpg1ItxPfOdLaErhm3jg+DlrvVEMqKxmsvTiFoF9y?=
 =?us-ascii?Q?05OVhNi+crGy4+k1iften29mu+PypjekZob/87yhdCQtxAcRCJNIiWTknabq?=
 =?us-ascii?Q?FGQARrrAI0g8YT1mjMaCkcQvuCGmyinmlRTL0gJj3IVTWfUu3DERasDyrLKm?=
 =?us-ascii?Q?EiuYY16rh40cb5aiynIuRAoUfgaVbxK2gNiraiSCLN6IXMCYOhf5gjyX1lxP?=
 =?us-ascii?Q?qi0bbgWnni/vQpQoX7Vmh5Y7pFybwsCtc6EB40x+Punya9lvrYb6faYSmVEM?=
 =?us-ascii?Q?bPuT4bnyDy4Oc5zPU89/RroKjsRtv/qvD5e9LEVdlZu1JjgjESgyhneVtrEM?=
 =?us-ascii?Q?u8EOvMImkV5owAWmaDT3T7MHQEpN9yLeIGVGAF2sXKCUdouGkxUdDW0Msyr9?=
 =?us-ascii?Q?8aXfIaksPOgQFBwaEni1y1elP9EjfnI3XARzz4I6B5u5WsDzYPGy5SsGpWJR?=
 =?us-ascii?Q?kh4MWE07OqwmJv38ak7bSb8j53TW1A8peKZTW+UOV91y6AAvD1zMn66l6OLp?=
 =?us-ascii?Q?/mDowjQfL07g013VeEdqFUOV8cdeT1l7oNPwF++6cfsH5HPfBbjt8fsNc/6o?=
 =?us-ascii?Q?cNJ0q5qePqzHCO0nYwH0bQnI/4LtL2RffLTi+S7P1JW6jLHoDnRt2dWDPDuM?=
 =?us-ascii?Q?izCrDU9Vwynd9gklng1RR91kyfszA3cVAAFjWXt6kH/3fo8iF7jv9oyWq9vA?=
 =?us-ascii?Q?idHUc0W2jX3goxW+l3s8U5uHnTwyKI2HmzK+bza3Vyk7rik326WaxP6HChBk?=
 =?us-ascii?Q?40YMihFpElw1hpWNNJ7HYaSVoUtDGs9OSFq+hnMOI5JYEQ7KxLG6vl0j5IyF?=
 =?us-ascii?Q?juwfD6mgPZRvzHB3OHYaD0DP9RI6HJXqDW7kpc9k1W09YGHkV5rodf7WGz8l?=
 =?us-ascii?Q?9fIChuSoi4ltyfkZq58vyQzUYJl7TmX/x4QNiITNJJL0z15wNyUw3zyd7q5F?=
 =?us-ascii?Q?zYXmO0D8o819BfLZrjak/5U+n6Q/LMiIsUEnfetmbyuPR1wN2iz+iYpZP1Y+?=
 =?us-ascii?Q?E2QQqWnM+qkxRSG9SIsiaz0L8vDKOJkqMDJuYzWVBoZGYruzXPp54Fed49v9?=
 =?us-ascii?Q?8QgR0g6IUx//ucxwptZwlaSnRKmT9DcE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h2gbNfMtzhyRUWmOxpINPnLiZ5Gva4UJWA1/Xh0dQVIAchaQpNs05H5KCv9V?=
 =?us-ascii?Q?2DTLRhA5MPfQY709gl/1sk6PdhrhCHty3sq9wAkTMeltnmGQy/5YFgdjT1mO?=
 =?us-ascii?Q?IAfZVa6S158CEmw16mCMjYp+JQbVZHscxLgorOv3oDvj4q7dT71hpjQLeOxM?=
 =?us-ascii?Q?cMyfqc8PuE0K0AjabGcTJsCEHOjNNtBnwNcxpJlAJFoZ80EI7QjSlZTX5TJ1?=
 =?us-ascii?Q?uN1TVaAeayZx8nhJEV4zr3B2MUXHdTImnX+ZWWQPH7x9H7LjfwHbkGust0KG?=
 =?us-ascii?Q?N+oicZWwG0uto3UdmFvk2PRSttzI5HglpNVeUFbGEeD9VSS7gON65Igjvaky?=
 =?us-ascii?Q?SAL54Vyl5Jq0RTn15s+OCEiZHk1n4IDARHFxPf6TkrKCNVx5QKym0bXU8FZC?=
 =?us-ascii?Q?XgL+3CmQVqn9kX86Nm30YUyCm+0qmBIBjyB2XKg/BNhyhhwrKpMU2M+ip3TB?=
 =?us-ascii?Q?85hIJWnH0qpxDqF+aucgoPNwwbNTLhalkLy8WwUmWEhY1p59KDgrkHmTrZjx?=
 =?us-ascii?Q?k8d/ntMzep07NUjFGot+BYMFA0w/HUO0rZ2Px3HGC5+ZWBN8V+Aekla74krj?=
 =?us-ascii?Q?dcD3npD3QuJQAGmT8VZjRNdeyTEP262hwKxtCIOYgJOhtXqFD0l4kBisUSXr?=
 =?us-ascii?Q?VqIr3sLHSRGLjFe7ZES25pguzH9svyMnGtlDDKPDn0v4nIB7fl+r9IuEwYqK?=
 =?us-ascii?Q?T2rKgzFjmJ59o3PURlpY/kRxCn8Xg+h6gTn2Fkn2iPCAea83bKuM0kKoeE7e?=
 =?us-ascii?Q?3wZaMkat8gR2Wvux+kTtk4oY21Poe8f8oM4nZDNUgY/A/OJ85sgQvi5D9LGJ?=
 =?us-ascii?Q?wWRUMakuZAJ+eKGvnoqW0PmxkfRbfYd3rfslrdF3ge+00Sia6DPfVDhCYaRB?=
 =?us-ascii?Q?dlIDj5KiTOrWV3eryM7lFXvVTMR1KpSmPReDGmp7dR0uzv8Jk2sHbNvYcxvu?=
 =?us-ascii?Q?R+BtaBRenqpxx5MQHVtjFSEdmhVC68vOqUdBjVrxXjju+0zh0M+map+FkJzq?=
 =?us-ascii?Q?LPdXcIT01YfBvNSS5heXe3oedQaXUwlTssqtS5QqDJvwAqgNaBb2dbygyhhH?=
 =?us-ascii?Q?AryX1I/oHwwScdwW4I6u45AqDkjYkW3rprFJ48rHbsj3BnKCMYmBeoBCL59g?=
 =?us-ascii?Q?gYu1kLr7j2PV5o5LQoj1Mx9v8tq1xjbpAP78yNzlVb9g9c0BxyJ5DcI9+lkr?=
 =?us-ascii?Q?V011LZVH7zSaOBBJ+H/n/qNV+HARWFwj/LPQC3Zmlh+naycxAmNH2eSXmS+j?=
 =?us-ascii?Q?wR7FsmHkct8FClUTGyZu7rRCigLeJfX8JMdoKNogRSYpWNX3qs7IM2lhRyVR?=
 =?us-ascii?Q?NTSM07c8yv4qZo/jd5OR/MaTUgLe4255KrOuRAZpiVz9BpMvgVgVqT46M1za?=
 =?us-ascii?Q?zAInoZSD4k7iFcMapAcrznSKACjfe7PoYEC52DZkuxs3a/iN+w/iUIEPmbR4?=
 =?us-ascii?Q?u2T2TuRUcSsVn2kBAqRVj87R4w4ebkMxxDVp19BqMZozZANyTVI6iBiMR6WJ?=
 =?us-ascii?Q?25So576Wp9bXjsqemAC7HlIFtVTvJBzsvFqiNWS405aMIWvGr4epMzLOmzXN?=
 =?us-ascii?Q?FQi13lcfxfmzfCPGRGLV0DBWV3SiCmHHboYjZ7pVknzoOIa0mZ9XDGBFxPCQ?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd00daa6-cdba-451d-7e23-08de3440a2d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:55:34.9198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKCvM0ma1eY1/45bl7gqe4EOw2E+A6IZ7CNYR7a94NXHhGtbxgMS+NqSwWLPNBn4QmdV5jGR5EkMLMFlnP1Vsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9451
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

On Fri, Dec 05, 2025 at 12:36:01PM -0800, Dixit, Ashutosh wrote:
> On Fri, 05 Dec 2025 11:05:10 -0800, Shuicheng Lin wrote:
> >
> 
> Hi Shuicheng,
> 
> > The OA open parameters did not validate num_syncs, allowing
> > userspace to pass arbitrarily large values, potentially
> > leading to excessive allocations.
> >
> > Add checks to ensure that num_syncs does not exceed XE_MAX_SYNCS,
> > returning -EINVAL when the limit is violated.
> >
> > Fixes: c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA sync properties")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_oa.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > index cc48663c2b48..7477c27a4ba2 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -1254,6 +1254,11 @@ static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
> >  static int xe_oa_set_prop_num_syncs(struct xe_oa *oa, u64 value,
> >				    struct xe_oa_open_param *param)
> >  {
> > +	if (value > XE_MAX_SYNCS) {
> > +		drm_dbg(&oa->xe->drm, "num_syncs %llu must be <= %u\n",
> > +			value, XE_MAX_SYNCS);
> > +		return -EINVAL;
> > +	}
> 
> Like the other patches, let's just do:
> 
> 	if (XE_IOCTL_DBG(xe, value > XE_MAX_SYNCS))
> 		return -EINVAL;
> 
> I might change the other functions here to also use XE_IOCTL_DBG(). They
> may have been written before XE_IOCTL_DBG() was implemented.
> 
> >	param->num_syncs = value;
> >	return 0;
> >  }
> > @@ -1404,6 +1409,12 @@ static int xe_oa_parse_syncs(struct xe_oa *oa,
> >	}
> >
> >	if (param->num_syncs) {
> > +		if (param->num_syncs > XE_MAX_SYNCS) {
> > +			drm_dbg(&oa->xe->drm, "num_syncs %d must be <= %u\n",
> > +				param->num_syncs, XE_MAX_SYNCS);
> > +			ret = -EINVAL;
> > +			goto exit;
> > +		}
> 
> This is not needed. If we return -EINVAL from the code at the top, this
> will never get executed.
> 
> Also, maybe squash the 3 patches into a single patch? Not sure if we need 3
> patches, a single patch with XE_IOCTL_DBG() in all 3 places might make more
> sense?
> 

When did OA land? Before or after force probe removal? If after then
best at least keep the OA part in a different patch so backport patches
(hopefully) just apply.

Matt 

> >		param->syncs = kcalloc(param->num_syncs, sizeof(*param->syncs), GFP_KERNEL);
> >		if (!param->syncs) {
> >			ret = -ENOMEM;
> > --
> > 2.50.1
> >
> 
> Thanks.
> --
> Ashutosh
