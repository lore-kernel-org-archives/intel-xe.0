Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838C4C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 20:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F07910E163;
	Wed, 25 Jun 2025 20:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2HmuRXf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670BC10E163
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 20:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750884404; x=1782420404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mmrceZzO8hVG4qd4NDAm03zFwvP7ta5u1AFo0DrLsDE=;
 b=R2HmuRXf/p9ghY6jxBTZZdi7oHXU/Ce9eCKVT7oMzmziaJIL3d+AJ242
 HOvpb0Z57K814u30jwJuAEC4ujeRg9RKD+/RVEavZtu4U3rG/RhEKrb70
 0NeLfzj4Wt0SVIwiX/4ElavWRJvhTYEbnfCSpXdSjDQNYfyEkM9qArc+3
 i0TfI7SN7z4VyP2GGm3hdyTw1mhGfbV/PuuQt5zWg3OgAJdmzPqeAZMJb
 f+56agie57zSynLHS7jDBHOthZsVn5L4UailLSc74Dx7ddhV5W+FHdJfG
 6YYd7clURfPknCkfa9FbEs/p2VpPoAK9im9DCPxcb1EG1i8eL6tgVQWfk A==;
X-CSE-ConnectionGUID: bjs67PhFRbmEwrEkN871Wg==
X-CSE-MsgGUID: 6PtSUb1pSWWWhk+iRG1FOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63428879"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63428879"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:46:43 -0700
X-CSE-ConnectionGUID: 0n44OpejRKezVLdcBLErKw==
X-CSE-MsgGUID: QgELh+93RwWHQM9NOl+KuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151742665"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:46:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:46:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 13:46:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:46:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6h4ZQLqzVBxCnevPk6SDnVGK2GU16IIWrfU1+XQlCP9lCy+WygLzilp0QtSmwpFEPOqJx5kPJnLOcklqsuH82F1Uu/YGeTwoqyjyuIuEX5unZ6h8b9tZwNFuzSY4cQOkt0TjgSmeeUDIefyiEtyzJh/9lndZDNz4JenIZCIMFZ7I6mlYbH+wIP5jPVcZEC0NNPv7jk2P8xEkXd6Sv1HKwnmwuEywKwuwOEVZ+esD67Aj7QzjZZjkaNrEXMbS/OoUkBfEfquOHmR6B2WXBMQdr1usqE8NivuPeM4z3uvRTeSSHB3ieX88931OcMPNlylTG5Zz/A6VGkTUOFPIq776Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+OpneBxbTyFe0bjxB7n+4mJT1dWKoouccFGjhuDaJQ=;
 b=UTjHESqvROuvHaW+JDIK4ergdTPUTB1c0+9nVhvXPyE9LMUZLsw4uAYDfY1i2Ep1ja7R6lpUSJzhJ51NZAoB1BCoaE3fLf2w/sskmepVt9ffGKa3c+z99BPDfSqevAvANlIYhaG6UIm0HDWmff3m+lDGqjBr0abs1f1oVRCBMgSwd7/nPd8VrLoMWpVAQ4NpzS+y7FotLwdjtEjCVLWSEKSvW8+dz6HI21iZJIaAh9qgcUXohSsS8fVbqlxixoK8AzT6DX0KSmbcBzHegsRIKvrW+r7KEXlYSbCI9cYtOni9bRBXiSMekIpdH5chTX1kbPDJqWvz76xFRYvV5GSb2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 20:46:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 20:46:21 +0000
Date: Wed, 25 Jun 2025 13:46:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 0/5] drm/xe: Create and use XE_DEVICE_WA infrastructure
Message-ID: <20250625204619.GJ4868@mdroper-desk1.amr.corp.intel.com>
References: <20250625200751.205166-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625200751.205166-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BY5PR17CA0030.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aafdacc-9f42-4779-12a0-08ddb4295774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fXND5aAUQzhTfWxnAnUE+0C8v26d3eEWQ6y5uva4xyGctDzix8onN7HYf7Ia?=
 =?us-ascii?Q?osuEtmMLEZF6HhQfIzFojkFxrAL9BUcz5chqRDk+FtOfxJsTI/GYM+Di7DUY?=
 =?us-ascii?Q?ujWxNh/M8DUrO5TdlVpPdHSl4CF2/H+rEEOJfLww24QLYivb1LJ9ofTzLJ28?=
 =?us-ascii?Q?zYr9khy0Et6KvnGZH9qRdMj439cWx/EmJWlHFr0L5IdE20vzMn/zfUdJqkXP?=
 =?us-ascii?Q?4KsWm2haKkfcEQuRyaVhgZZ3ol4BGf7DMEGSRmnSZ9qzlHongdc2Zxfuc6/8?=
 =?us-ascii?Q?oUdAZm/ctUEmsFFCHvbeFVDrWwpbgyQWNaVRLWKIyHeyePPb0Jy0Q9B/8Hs2?=
 =?us-ascii?Q?2JJl2/SBdTaNe5OgrgRKdPgc7Z49qoxaN0rVH//5dH9Scmja3iw3xxXB4xd9?=
 =?us-ascii?Q?aMgOd+hjpOlX9HurIog52pWu+DrpadJEuPU+wRFc8nFU9zMNbr09z3mHlnqc?=
 =?us-ascii?Q?Zn1atnHfaEefdSxbIcKjMxjDu1r+J0dx1X8+QTXtlULWy7AXivoa1dPXeeir?=
 =?us-ascii?Q?p0Q2fy/LCRR36jcdsBOLGC2T7C8J+U8g6jjUzfKMd7MmoAH79cjTRYm7SAxX?=
 =?us-ascii?Q?t9oZp4ouPjsnmcvTszMskcckyXE1CJ+oaG2ZVryJGqW37qXKQiW0+a+lFG7B?=
 =?us-ascii?Q?eNl67cRztcNiyWAUeIvmH+tT63i9w+v9bT9CSnV34sx1x+jW5zjJWEV10+VZ?=
 =?us-ascii?Q?obL/Dm1lJQMEhtAirLjIuikPoYJzNzCILbDcPD+0hlA+GUDdNgSXyXjIv0Kf?=
 =?us-ascii?Q?92By5qBpbJPUOSerpKg1+GZ5fu+jzQ9Tgm9USzYVpuoAN/mTrGsv/ZviTlGL?=
 =?us-ascii?Q?YWdiCECZwgRdDt+253FfvaV999CM3+xsBAUGV4ywo3p7W5nbXMP8O5kYBcl7?=
 =?us-ascii?Q?0uF607NPJnoXB4o07AtZhpf7d31T3PB7L4JFwVDdz0JyBvl+JBTrlLBqhwVS?=
 =?us-ascii?Q?PmzfdaWZYCDH+4hOPtYDCJEzLVs7vaeSupPHG0GknFpNu7wA6XOwWm2HkWq8?=
 =?us-ascii?Q?EhoHx9Gp56Jp3AMjOBYi9To+5XpiIALPihCv9BGRJjryNuWJif27Ot1Zpu1o?=
 =?us-ascii?Q?FalgHy0rAVUMOogBnocbzqIPFge1/EZ24UHJrUBbmoMz3pKNA3IFhsDLneJO?=
 =?us-ascii?Q?iSuEo0QM8OQyzUts/UW9P6jpi5QKFD/p9xHEZdfJ70F7c9Nf8qIyX4/QtT+E?=
 =?us-ascii?Q?K0AxuDkQX40l0ZGeEVeRbD039YJQfuw7H2a5KXrt4UtU/A613pm7QyIKOkRT?=
 =?us-ascii?Q?3fzI9f+1aKinsDiAKB5E5Wl4nwYSk0mh5kKVqG7R+47F5y4iiPAf+CBvKBXi?=
 =?us-ascii?Q?pSbW8LnmpmnE2K5LO5WYzh7V8s3bxO8OEj5ya1mT09vPG31ZMzPgnRVlImIT?=
 =?us-ascii?Q?4OS7//JXYFsa4Z8A0RUuaci40JVLE1UQmKd9H3Njz+6VoKsMs7T0I/6qeYWp?=
 =?us-ascii?Q?YEKpifBWBos=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dBRcB+ngZigX4Ut6ZRr8oJCw1smE+Hwh76hVJliobiLI/06mlZes/6MGxTnP?=
 =?us-ascii?Q?11GHd8dN54ooppCI4+U7sbTqftB0wYX8/xdQc/cf7Ga6fFGycwzQmqsi+Z73?=
 =?us-ascii?Q?XnUrtOT0OL6dR+UMYktPX9P4A5YOrPrvqRbeVmwef5gnmwKV8fa2HN082XlB?=
 =?us-ascii?Q?Fr/W8EA2hlxjskxFBnc4QIEDq8ZJxPAK+Klo52nayYglk+ShCnKbO5Xfhef5?=
 =?us-ascii?Q?uPrEGQDR1J1CwyMqXnddnuncTpLYnSfYv1zV3nYF+whVQWPQNPCBihKAS+fg?=
 =?us-ascii?Q?nPcGkevnoMSWI3SZSUY5w49eHHcTW6BwSV2+NTBetx7aCIJBQOHLUCdlwBVM?=
 =?us-ascii?Q?sAYfRgVIOpXZVuPfT+HeybcUCyoFIUuF8eBlBvMVqFtvq8+ITFaCKB2vCbpk?=
 =?us-ascii?Q?o070zqiErVdCHzcc18Q4xf/MXu9XVuC+vsQM86s7+oo5F+pe6MpYFB0NkYax?=
 =?us-ascii?Q?3T0EzX4GRXHUOOy1mKx0emP1EmGyTtKKQffALbf8HW7+oU6kBkHgu3ojKU5N?=
 =?us-ascii?Q?0Lvi8TqiASq2ySVhdafMvCffbj/B9iI6OaK93MqMghmxa0tjwqtobmmqxNX6?=
 =?us-ascii?Q?sxd+vwdWMwA1xH235cr/RRDExyX/AJ3BySPnd3Byu4w6prRMYbs8wmNPTM/w?=
 =?us-ascii?Q?ufuX531d8sa7A0PDFXY4ClPE2w2ndAQzg12g0PIYtY4lt7smtVs0YGYuKqu8?=
 =?us-ascii?Q?0IUIecTHfQRhnO+mghMgRM2OylDb1Na0gEODDM6b+Tscn5WRk1o0klpG8HkG?=
 =?us-ascii?Q?JQIXPY4XNBKnsiVnc5Rb94AijAIgIBGfjYR1jzAu/gZmo+YK5/vsd66NTqDj?=
 =?us-ascii?Q?k9c+Sl7gwid9Bfk5blMVSy6nbcDup0FoYmzp4nnVcCZ46RKtJfaoyjXF49E8?=
 =?us-ascii?Q?r814lPitju+QcpcZnl/OCNZxF0C4mx3BN8iZ2ELJELHzcqQ32WkGC5nfJUCY?=
 =?us-ascii?Q?L2ornxoJ3Wjsn6MwNeq9eEuhqmVNP1vKWP46gO3dSUYUvUzQuVQFy7LYrXZF?=
 =?us-ascii?Q?1BU3JxeUl9CgfcFbWgPwY3R2XurGrq9bFEU/nUmchmsE83eGIZ+obruZOi2i?=
 =?us-ascii?Q?+naHnBYydVFGt7KyRNoy3NKcqoH4Gq9Zn7/Ht4uEnR9Adlj71UOOPGdAGtYO?=
 =?us-ascii?Q?1OeHgDhpZKddQF7b+B9pT0ZPadV8Q0As8fCOIjAM6vKpZz+rbcxj9Ehr2O62?=
 =?us-ascii?Q?ORTY9sSWoE5Djc5llX3xLk3KdXB7Aj1Xhmgh9sLKdpi09sO9z+lY39fydlsa?=
 =?us-ascii?Q?dya/lUbCIhEb3JmKKcIDeOXctutRynsjQD3NRUdWW00Xl6U1lOtu2DcawTDh?=
 =?us-ascii?Q?A6bGlyMrTJQLAEEmtOSGZK1GJYiqpYu/sNyL8AsyHV08y8+LEL7kvj8qod8j?=
 =?us-ascii?Q?bDl0kxp75D6zKDKQ1eyVeqL22FeXeS7EMuWNxH239WNzTL9SK2jr360MA2bB?=
 =?us-ascii?Q?T77gvi4MgAeKJd+spmYlBs2aa1+ansQjbxJdlo6e8Ncvj60Mz2MU7PaYg9+B?=
 =?us-ascii?Q?tR21pIw6UORKlTNOVUehANIFTWNBM6zFDqOTTGVhmbdOKbUN7vRiF2GtkZt1?=
 =?us-ascii?Q?tQ8kxBI4oLKCArdxrwbPjalX6hbtZdayGLPfITF4Kyw/flJIjQx2MLQLQXsf?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aafdacc-9f42-4779-12a0-08ddb4295774
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:46:21.1251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7E33eD5w49Yon/DNxR/opvfij/eqsPOiHIj08zqEzD4kRkW+mRwmlOZVaxJT5k+t6bnOWiK1zxC8pPvLymBJ1V/70nmQyiOe8Ks+uh+tIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5866
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

On Wed, Jun 25, 2025 at 01:07:45PM -0700, Matt Atwood wrote:
> There currently is not a way to apply and track workarounds that are
> needed ahead of GT init. This series adds a bit field to the xe_device
> structure similar to those in the GT structures to apply and track
> workarounds applied at runtime (oobs).
> 
> Device workarounds in this new infrastructure are tracked in the
> existing sysfs entries in gtX/workarounds.
> 
> Currently 15015404425 is the only workaround like this, so move it to
> using this new infrastructure.
> 
> PTL A0 is impacted by 15015404425, but only applies to Compute Die A0
> stepping. The reality of modern platforms is that we're a Multi Chip
> Package with logic spread acress multiple dies. This information not
> being readily available during PCI probe without a read makes this more
> complicated.
> 
> Apply 15015404425 to PTL unconditionally during PCI probe (and GT init).
> After GT init use the Media GT stepping to determine if we can disable
> this workaround.
> 
> v2: Change naming from SoC to device, address styling issues, update
> commit messages
> v3: rebase
> v4: fix compile issue

You've sent three different versions of this series all with "v2" in the
cover letter subject.  The patches themselves have v3 or v4, but you
have a stale cover letter subject which is confusing.

Also, please try to avoid rapid-firing new versions of a series while
it's being actively reviewed since the review comments can get lost on
the old versions.  It looks like the mistakes that required v3 and v4
resends could have been caught by simply doing a local build test before
sending so please make sure you're doing that (and running stuff like
checkpatch to catch other mistakes) up front to minimize the thrash.


Matt

> 
> Matt Atwood (5):
>   drm/xe: add xe_device_wa infrastructure
>   drm/xe: Add infrastructure for Device OOB workarounds
>   drm/xe: Move Wa_15015404425 to use the new EX_DEVICE_WA macro
>   drm/xe: extend Wa_15015404425 to apply to PTL
>   drm/xe: disable wa_15015404425 for PTL B0
> 
>  drivers/gpu/drm/xe/Makefile               | 11 +++++-
>  drivers/gpu/drm/xe/xe_device_types.h      |  9 +++++
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 +
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 27 +++++++++----
>  drivers/gpu/drm/xe/xe_mmio.c              | 10 ++---
>  drivers/gpu/drm/xe/xe_pci.c               | 11 ++++++
>  drivers/gpu/drm/xe/xe_rtp.c               |  5 +++
>  drivers/gpu/drm/xe/xe_rtp.h               |  3 +-
>  drivers/gpu/drm/xe/xe_rtp_types.h         |  2 +
>  drivers/gpu/drm/xe/xe_wa.c                | 46 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h                | 18 +++++++--
>  drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
>  12 files changed, 127 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
