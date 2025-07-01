Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB0FC83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 21:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357D210E083;
	Tue,  1 Jul 2025 21:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZizygFj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4182310E083
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751404817; x=1782940817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JGt3KsPP/pcuG8RhfRzJCm+iQEb4rApE/RGV6cY/cPQ=;
 b=EZizygFjPOupUiNrrDj9T/0IQeefgXEseJQVRSxBlmSTZcP56WpfJo/S
 zeQDuEyJBnuhxr12tDW4W0DlSvzQVgguj5VhDbhLUSqGWpMrrIOUPUKw9
 Ysia5wK0Qx4HltbnnB0rwqvsNRC/4r/zFaH0WESCmoNOg7fX6CV0TYUYx
 TV8PzkK75xUO4spP/d9FVyH0EYru4WlHb+TDl16HRpDwiJgAzkF6mE1mn
 nhWXxZGOZ7BfMI0hmWiOJ7U9y0sZzJhOxHIThFDvNKN2aCk/9PBtzc1AP
 8qafLNTPtV1CiyzOaSHKn02sDnB2SKp5NkA9LI+nmB8nCBm5qGnd2aj6n g==;
X-CSE-ConnectionGUID: Op6aUj6BSmWnofv0Ayr74w==
X-CSE-MsgGUID: w4eg2tIsR9yDRqjG3+kWDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71251327"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71251327"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:20:17 -0700
X-CSE-ConnectionGUID: 6+i3hNI3TEe1A38KRZiwTw==
X-CSE-MsgGUID: gsFKf/hQS1yN7BgJFYGiCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="158444405"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 14:20:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:20:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 14:20:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 14:20:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2Iu2z5pez1zClDed6z+olRdtLTUmsc8fpCWHYoYIQn5xbrd7wygERsI2iIsLlGHTiVz4KAidMY4P2Is+jfBlZ+gtt2xRIovnOa+wZ7LBKXqffvgA8D4hckb1K1Oq9zLFelHdT8c7L/XOZ2WF+UHSRPTcjobVP9xh7UP8bWL+8GFg91Fdm1WsN5nFNbH+RFLBHAw6Vx5mFR1u4dtBDRQMxRUTlhd+QxqmT0slXiyRx3YCUrVysondLH3OWbyCf9bh/MbY2zTMZc4MWzhtAUOiKKpk+vSsm3lt8K4g6CP3pV9FMVmIRZTu2XzmG/b6N4CE7GA7dlk70BmcokkVmzmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGhYMtquOVBtzSJRQHzv5CWm4A8tFZSkM0Oo66Zj83I=;
 b=D9dmWU9iHcPTvCkHga5q20hY45Z7x1FhRR3ykeMpeGfR0Dt9gsQoC1hkE4DG1YaNB8jUACc/Wq4MRTbRPyu3EZ6sGyxpeaX5/1duVPtDaPW85SEdkuWhSvh6H5K/1Ozl91XsYF/7pD7Mr5pTYL7uaiSOcM5bMewlkoAOvfnwyFaWEFK9djr06+QPJGR9NdNpQ9Uq/O1Ha96p6Ti6gcfyOt6Gn1C2Y9qlcPxbtQb1Dp3/GMaezqedh/MEhi0veFJhe00JlzkDZZc2ZrljhlOJJ6IJh521B80dhXZEINsJfn6SOaGHvjgRs0V6zcl3EYSD92CYVHZ44vSSvtGXTM3JgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 21:19:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 21:19:57 +0000
Date: Tue, 1 Jul 2025 14:19:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH] drm/xe/xe_pmu: Validate gt in event supported
Message-ID: <20250701211954.GM4868@mdroper-desk1.amr.corp.intel.com>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
 <q7bmmb7s3v2wxjeamrcuhcpwm23tlju2l3uqobg3mo4y47dj5r@ndr2kbjfhhkc>
 <20250701203128.GL4868@mdroper-desk1.amr.corp.intel.com>
 <dn56hltsdh4ftxxrpcvyyow5rmv7j5jipq2mxymmaj4xucgknj@zhnnyt5r545m>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dn56hltsdh4ftxxrpcvyyow5rmv7j5jipq2mxymmaj4xucgknj@zhnnyt5r545m>
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 82301f9b-1d39-4e9b-19f3-08ddb8e507cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LH7i4BHj1bQTov2oa4oFpjKIrhF0VEoupYr+OQUzGutN4HEx5YwBMHgewpzE?=
 =?us-ascii?Q?lyiTZtCV9wuKF/eDSANy8BJZCBI2NTAryOLZKJ90Y3cIXG5g6lWHYTP79/Bh?=
 =?us-ascii?Q?DNNh4YijCXczdWYw3nJu9itBdhM+32hFZx6IraIWnL1Mx9Dpej+CT+s8AVK2?=
 =?us-ascii?Q?+DSnT+7t+9lnbp74twT2yS2QW1oNhbmeHVbp++8Q9T+yb8p2qP+ED5rWCVsh?=
 =?us-ascii?Q?xGKgbFEbfKGWXfeJe4QgFm1/nranJPnUSd8xte0qRadurq6XzWsSZxovM92I?=
 =?us-ascii?Q?9saLd5RtQVHiPoVo21SynxPIJCSDb9ox4ePisnl3LTXMBkM0kgq5EaDU3oeZ?=
 =?us-ascii?Q?bbj3znQFJcJvbY+b3xN0ZJTG2xmra9GpMxJ5G5mkM5BHiHFFjskL6/ZTJPOe?=
 =?us-ascii?Q?UpA9GrrVf9TGH1n40MLi54HEurHzVHdbzJDvIeEH47cuv/WVIMfiMTe2l0lR?=
 =?us-ascii?Q?BWxY/ahww7FToPwl8T+B9uwDt3YQrLeJbRpimo4v6igbK4WOW3sZbV672mRW?=
 =?us-ascii?Q?6ZunfBnrhlfBL3GKU+/5bqXv2DpWP9wc2wq8QKOYbRTmTnwpODmcsIx2E0ut?=
 =?us-ascii?Q?YL8J+5uFrWbxPsx4x8HdtGql0oQ/wi+bbqzKUYH96AjnLCDuT11eshKMmtJ7?=
 =?us-ascii?Q?9f21HZJrwHUX0yvZn9aGrsmXmBB5URxDtJ6344D3j1t4QwvcNqws2A+zrk1V?=
 =?us-ascii?Q?Vxxnhfe1RAlkNPvAPwUwZpMNhwIZQOSblhAZctxqAmErlVBRZbDMbiOQiiRu?=
 =?us-ascii?Q?MPsbRQZOKVbJ30YTdYpNPK8ajWFLk3EgTfkKdwg4oGkFbKpPyBAqIpTDCgS5?=
 =?us-ascii?Q?WQPN9wF+DJTnB294Y2+fKdoR59prd3JU1yK3vFb+ridovF7zB/W2khKYiYnD?=
 =?us-ascii?Q?V3E3D988e7MoizNXiaRLwIieUxfWDvyUCVjhNX99WzqNsJKz1GtW0g1zlqo/?=
 =?us-ascii?Q?TlC7sunrr4Zj6XsxpYCdD4Tk/BKSmepaJfzAf5kNedF3MkdqI/KFjIF+lvYC?=
 =?us-ascii?Q?31Is1S+nDHKHAYURRR5MiKSYbv9xevg1Qfuldpl6Jye6OU4G0f5ML7q13TIP?=
 =?us-ascii?Q?cxyriJTvnLdoo3ytaHTweUIZXRnAkHPJGXrVMMjuvDhDnJkXoKTQ6zRDhFP0?=
 =?us-ascii?Q?cP6maigw9U9tP/scdOswwlZSDoJnZY81YU4FRBwVgOc0ujjZfcFrFfDbHs1y?=
 =?us-ascii?Q?IaTTq9vL6c9EhFmi0BRwx3cSECBlTm0TBbn/KlwLr5pHw6r+v9RTAe+QH5JK?=
 =?us-ascii?Q?dITDgY8FMjoduz5kD7w7WtD4oVgdcYwCVnTalW10iMTxYvKssVwEROrmxFx+?=
 =?us-ascii?Q?1lwJw7MIeegGfykt9IK8dLh/NF3YlkCvFC7gkuaVUnnHqIMfrr/8PSKWVu0K?=
 =?us-ascii?Q?/nsLIBg0wrfl6w0EYAGG6++jGsoJay3N7aOdViKFlPxn5hhE6ExshcMrR06X?=
 =?us-ascii?Q?jqvfoTwHCLc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QG6r0hnkYS0MhxppCNvP7rFW7uWWnfaVJopQAUfM7Sn35BGm+i7iX6eB5Yik?=
 =?us-ascii?Q?2O69KPDCqoQoDw1e9AzO+4cdmzN9DaBEaeACAT5suCi5mk7RoahopglwSaUz?=
 =?us-ascii?Q?udgDxd157JQIr37mpOb83mYC6jZ6obbzUGPLfv0mWyy+nuVRHgvoQ+hDRlNx?=
 =?us-ascii?Q?mclIO4aRjGz29ayyQzYf6Mkq9U+hdBCahNJ26ot+QGINFEvnWl3a0PdmJzZJ?=
 =?us-ascii?Q?JdQJjUtWhjp5FksBz67y4PqgUxWqL+sV3I0StKLBSIcgzp9bBsWBVaY6k6D+?=
 =?us-ascii?Q?S4FEScS0/N43W2wz9x3GHsRjT8LT9+PpQaOHGtyp+ra+U1EYasK2k43/x1vP?=
 =?us-ascii?Q?diH2aVyIMz1ELVjA+OCkDO592s5zENd4rfgyZOP49wp7ELEcvGk/ezl8efpn?=
 =?us-ascii?Q?z8yuuI+rFXAIsKI5FlH1iMoPzAVQ0hgi1aaUdc9VY06JEnbnb4eS7g7nEp/z?=
 =?us-ascii?Q?wwVh5XnTYnW0x/apZPEKU78KCFFO1T3zxQSoSGKP0BHz4bFbceG5nuNVzGXU?=
 =?us-ascii?Q?UHjXiKIpXrOC1tCCGWECE0afrt2kC/g3f4JGapaFB12bXAfjNE1yG++zN2fS?=
 =?us-ascii?Q?oWaPKEBY41O7Qq+OWT3kFEcv3iBywzuNyGss9vfoNNlZUnmrNKn1g1r3B5Oq?=
 =?us-ascii?Q?TzVLPhYyWRPOUVYCuk5iNFOlMlsnQ9Hw4L7qCwJbB/MshWIwb0ky1bsFFMpl?=
 =?us-ascii?Q?qyh9dHq9HV3LhT8mDUl4RveUPEkec3klMZ/u2GgCZrdVeOhXBRVVlu/I7kRX?=
 =?us-ascii?Q?eunQHLRPqk4HX1C2nqc4UbwTt4iha7rejrgwUxb5gDX9vUOv8+27BDepq2ep?=
 =?us-ascii?Q?SlE4tAMPefYYM/bKQqbNemOk0myUKP6kD4SWLHt/37J2UvPGiA40+wqlVBId?=
 =?us-ascii?Q?has1oWbVjK67kL/3QkJBVOtzd9lNRpSTMVivw1OAYxndfgbrpD8T423erqZb?=
 =?us-ascii?Q?IS1GGSozlCwEAGWlZB+vxwjj3IXlWwtYvF9emIPhzkEVVbT/jzB1he2JvxAB?=
 =?us-ascii?Q?IQCEthpvZO4+V7QJHXqhEuxo+L1fDzsNkJOFgeEmXyhqELpmQMJB70jOVtHk?=
 =?us-ascii?Q?0Tw1k2P4MeZJrmCH4xnUgdbaE4Y0kR9nnOMnq+QTJijzTwP4bC+ZGCDXQiKV?=
 =?us-ascii?Q?0YhJPTjoVaGaAVD851WDHu0XHaSBxlsNO2aq3EJA5KyyOFgY0inyQjJeGZwF?=
 =?us-ascii?Q?AGfALFZpwX8N1CvRFGfxl/LeCQds2iPFUufKZM3OEOmrUmBQlE4eR+1KHuIz?=
 =?us-ascii?Q?W1FlXEanoeitrWfPuoz5sSN/4QYI3jHvEq9gQqJitzYsu4M5CP/7lMqKJLKn?=
 =?us-ascii?Q?vIZA7Pv80tQFZ+dbCLbQt6OXBlnTLpEmV8puwoPzqB3pcvN9rNxrH6QGlTVk?=
 =?us-ascii?Q?vi05MMLkRYRoE/NMgjiBbq2fDJxwmE7tDYplcwPusLbsoLZniuAmwthiuyNi?=
 =?us-ascii?Q?qfG/w/yYZ43KXW5r7ZLOq/GvUfGG8naNumxCSpT25EWY68ccjxSVKK4/YR0x?=
 =?us-ascii?Q?ll3VY2abZkWhtf7ZCZH3iBmLFm0qrYwpJrMV5LpU5RFrvs62ozT0K1YdouUt?=
 =?us-ascii?Q?QyGazIyKCSUoeqEmf8enAOIQkKzoigV+2M/CWu3CMV8aiYWqI0WB2jzGMTUF?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82301f9b-1d39-4e9b-19f3-08ddb8e507cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 21:19:57.5997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbqXcRJeBAYCHqltNfT+0EChA3bnVQmOPDj8tk6OHfeLui6kJ7q1tyqjFJyyfksWB47MvnQRjzTW0n3JGwrxOWpkdkiB+/+pWOih07ISf+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
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

On Tue, Jul 01, 2025 at 04:09:44PM -0500, Lucas De Marchi wrote:
> On Tue, Jul 01, 2025 at 01:31:28PM -0700, Matt Roper wrote:
> > On Mon, Jun 30, 2025 at 05:28:53PM -0500, Lucas De Marchi wrote:
> > > On Mon, Jun 30, 2025 at 03:07:41PM +0530, Riana Tauro wrote:
> > > > Validate gt instead of checking gt_id is lesser
> > > > than max gts per tile
> > > 
> > > I prefer the series from Matt Roper that is refactoring this part well.
> > 
> > I think we want this change regardless.  My series is about refactoring
> > to future-proof the behavior in case we wind up with multi-tile+multi-GT
> > platforms in the future.  However Riana's patch here is fixing a real
> > bug in the code that exists for existing platforms like PVC (i.e., the
> > code currently lets "GT1" through as valid even on single-tile variants
> > of PVC).
> 
> I misread this patch and thought it was an impossible condition that was
> already protected during event init and it was added more as an "assert
> we always have this". Now I see this is the call that actually protects
> the event creation. So, yes, this looks the correct thing to do.
> 
> Riana, could you expand the commit message to emphasize this is a real
> issue for platforms like PVC?
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> thanks
> Lucas De Marchi

I did just notice (as Karthik also pointed out on another part of this
thread) that if we apply this patch _without_ my series, then
xe_device_get_gt() could throw a WARN and return something non-NULL if
the GT ID is too high, which doesn't actually help.  But if we apply
this fix after my refactoring, then xe_device_get_gt() will return NULL
on any invalid GT ID and the logic here works as expected.  So I guess
rather than applying this on its own, we could wait and apply it after
my series (and I'd drop the patch #1 that I had added to v4 of my
series).


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
