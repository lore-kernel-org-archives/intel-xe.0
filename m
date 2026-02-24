Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64477F4BB9B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 22:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F65510E631;
	Tue, 24 Feb 2026 22:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4zCNhfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5C210E631
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 22:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771972850; x=1803508850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FZ0vO+Ji1Q2DZr2N5SseKf7wa/DKoFC8jasMAxiGk68=;
 b=U4zCNhfH4D4IhP9007n0Fk95U0cUPAKZHGjakU/JUplELAFVhMIiTqc9
 BDdW38IuUCwCQLR/to1iupGzXS8L2c99IhxMmhY3YuKoBJpLSTtf+zY3Y
 aLX6GHhlln6PaOX4ey3f9WwXiNbbYx6Qrpb8EKYfZYGpqoHqpH5yJO8d+
 H0JV1lC5uDzC2ZU9HeY6Y4AymlAdeNbgOJblZtO6qHO3kvM1ZsLZZdbCi
 ne+ubtcg8tUhNW3QA/Byc7isfW6GaLNaNBAhgkkaRUkEo4mMkQn0EnQsi
 mxKdgz9CrVu0flSCgsRJPPyFhqnmYBiprbm6YVXWvAsrCukpyMM4CUoZK Q==;
X-CSE-ConnectionGUID: Zuqv1mCGQdWMAgh58RAeFA==
X-CSE-MsgGUID: 3oD7Zma0S3Syt62zS08YBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72039278"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72039278"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:40:50 -0800
X-CSE-ConnectionGUID: yn9uCtX+QJuY6Hk8Jk3L5w==
X-CSE-MsgGUID: qdColX91SkS/hbK3cuxRqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="214371451"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:40:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:40:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 14:40:49 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:40:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qz0RIKa76BmcctUtO3KiRr6RrqZxXMoxJLRbLm9vAoFGUn2wy4CinMQ5wiQbcUx5kbnDkwoBI4hcXIsTUgkg76wUWSHB9BwBo3Ae1M0bqcCgAiRQPAJ1w0X70eT+ie/s4GObUF8RqDXD0YmSE/ssfOtlIZYdapcGZwyn6L7ocn2Pt70MT79ffN7B4Ib1LmyEO6kZZ58QWiQtHbRcr5JGpgy6ozCS/D0nJmODpHaPp62VFgLwENPimTc2c0o1BMgHiN6hhRmw3qtWIyo+uJ6ptsJDFP40YKgYA1F3xqPi65n1NyMwp6j/P+fErvjGqRBBKcdYrQVlq7Cn52+DkwVd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUH98jTHgaUTF4Ki7IX7te3o4+t3UchVBU8NbV+bFkA=;
 b=YcK6JilnUWXT3W37mupweVstRzUhijA5tHrykcvwW3ZE9CGhAgEr3jPmnorNZ6yYVBvADrQhUec+EDFuyMPH8Din299g3uWNcfawLj4xSyWC/o2BUInYf4geCxWEAFOOs3ju9Zyw5h+NHIM860l21bD6PMP8HgsIVH3zTYIqgOKflWhMdHKCMktGEcDcQUVtvZM+o+yThEh788aaxie/07fRQj36WK/yM9zjdGIGnNXUmRtrnLu/jYyw5iGRpPO/2TbRfrLfXdkgBVftjCtINsan/39MG88FvII7nL4RgDwwoB/1YW1lHDZL6t7WxCmSuKmvmR5fAz1+4dgF54tlgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:40:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:40:37 +0000
Date: Tue, 24 Feb 2026 14:40:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v3] drm/xe: restrict multi-lrc to VCS/VECS engines
Message-ID: <aZ4o4/T7BiPP3TeC@lstrano-desk.jf.intel.com>
References: <20260224023354.182306-1-x.wang@intel.com>
 <20260224220548.GL4694@mdroper-desk1.amr.corp.intel.com>
 <c42a6636-c639-4c4c-93a7-3755baf351bf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c42a6636-c639-4c4c-93a7-3755baf351bf@intel.com>
X-ClientProxiedBy: MW4PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:303:6b::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6bdf2f-d672-47cd-8b0e-08de73f5bb05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZZ7TcnQ2gVsXKbJNEaOp53ZG5vXi8kr5xFiE/80UOhlsPlJcvzRrjnQ8lEov?=
 =?us-ascii?Q?6bSYH1mIWY8Xtp2qtxAa4N2ZhGTK5m21C1Mn84eTbnuCNA+mWy4Xoeg99DDx?=
 =?us-ascii?Q?PDSeJpiiQ9ll8Ie1CwWPqu91GHgb+uJgxlejUGr7DvEPBBgH5mANGiEZcrBl?=
 =?us-ascii?Q?MHhvVdEpDGutJspIM1fce2baGh9Sq0X+h5FM6xk2eDkcP/hcVQOSe61v0OOE?=
 =?us-ascii?Q?biUPL3I3hgL1bVzrN1cQJqefM2d3Fst8W/8cs94hbC+VDJX49rNJvLOdFJ94?=
 =?us-ascii?Q?C1UyAyof+5TOxISGo57EYEL03//l7BpvT//Tcay3qikxn2x3nqTq4QzncNxz?=
 =?us-ascii?Q?kxY+i+3WoPRmi9JK9VZUDYDmEv/R//UtNCoF/XpvIASYPF77rMD1EOa3LcjX?=
 =?us-ascii?Q?+2+tQo8F3ATxl7Fy22yP9p6gpG33vovMFenYj/2AnYgO0PQ6l1YuyI14ew1t?=
 =?us-ascii?Q?IqAV1auz2RpM5et3nlmcasBrZ2S8r//b7vD7tc/GeqSIhqtRbMWnRbgNZsYD?=
 =?us-ascii?Q?55dwrwRugGuuZZVxN4Tsz6PHNXREhuRRPRxw20/nSLUyjMWsiGe4LGhdI0k7?=
 =?us-ascii?Q?pZKTvh+xshs6RPcTtXBASl73BgpZeOvQHrlePdkJUhAwC+uuLLFRqxdMSk68?=
 =?us-ascii?Q?jDS8/WxAz6TjlWinSAIHSirubBPP5AD9AD8uEQ6pwWsorIj0dqAyb8lPjPDQ?=
 =?us-ascii?Q?3OGdfGdGlgyAmk4mKqMkeuPB9a33H7dg8sHI1FcAGgzHdCcT4t0biOPzz2+n?=
 =?us-ascii?Q?j4ik9iKJWorkYLIg8trY6PZH4e5G7DdvBp5dPs4x6Qs+2KMADKEgxOzIsG6C?=
 =?us-ascii?Q?2xqhyxbS+scjsk8I5PhoA860tG1j8kDNqf1zcgg0tnoqsqhBd4zbIt0K4uC/?=
 =?us-ascii?Q?iRyqzLDR23VVdxA7EAdX7+FTihoZ1cQd2lFMzpsaH5Jm3kwwFB4E2ZHTrqE5?=
 =?us-ascii?Q?BnJxSsOfNWproFU/qReUv5pdWRB3xI27X02XV/VzoUwPsLD5loBouNFcK9x2?=
 =?us-ascii?Q?3rtlDfNZD/vFUcV1tiZGK7doQN3mLqnMxqkYZoT3S108enwD/AM5fpfbkO2D?=
 =?us-ascii?Q?xamhACH20apH6nmNh3J3yEgO7MsFj9twxRfGuvCxzds5WQx1Xbk2UwRCn9Us?=
 =?us-ascii?Q?Zvvmf+VlFEr6bLpUJYYKpyRzQblUIHQXRmlUz8CY5cA3gZBRsfyXCJFJDq05?=
 =?us-ascii?Q?0UOGwLyW5JyMD3twhxu16Ymv4KD2R0gVkFKLjjdQcPTWIT9SapA9XoY1oGEO?=
 =?us-ascii?Q?QrVmUmbidoO3auBcMRhmvhag8u08I7Pa2cZkma+1XtvQuICxBcEDmnYNRe6o?=
 =?us-ascii?Q?YCgD07dEMxW48UdzN0dk9klAy0DUO1LRO84ehCuCiIPMj6gschr9M3vfu16A?=
 =?us-ascii?Q?v0P6+iH7/73x9R+Z9RZCn5Bqscu+tnFT6NtHBmmApXcDyoiooEZHUZygvDVS?=
 =?us-ascii?Q?XqhxrdbI9mE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Eh7fgRqTfo1Pr18elFlpTo3EI1TUM3G8T2+6cxO2xADvwaM2MkdjePgojMt?=
 =?us-ascii?Q?NWqIF/OCkVXLXhwyeOS/W4eLa76OsvL/ttaEk1SeXDSkjcDgReM+YeTk5b8+?=
 =?us-ascii?Q?31WfZM1ethE9aFy3CTq3H6v8v4a8/Cvc425I/JwbovCMTNlTMNgwEqqhy7PR?=
 =?us-ascii?Q?YH7A2gFJTK+d3nZ6mZ07N6QdnFtA2jG0XJGPHdd+8GqSnEPHd1Bl9wN7klS0?=
 =?us-ascii?Q?o6JCTfwmeeGjNstZPQ5RxiM7XgjC3N+ptTTJAiW/JgD9DFcP/o7dJsEe7LGm?=
 =?us-ascii?Q?VejE7/sidemWsdxSFpY+LWQohYtTMZn3yXgw9illMd08L62wb7So2BlBYyt7?=
 =?us-ascii?Q?y/0tvMoHPjtWjcsKF/zGwt1w3ma6zM08FDDrOJQgDDANkKw9XNu1shNOAFSi?=
 =?us-ascii?Q?HPKznwAWBKODF1/HhSLmptlWmo55N8UPRpbRPbu+PEaG2lpbHeulYb/Qb8y3?=
 =?us-ascii?Q?IMdnhp/uUyq0PE90FMerG2bZuAkH4Fa4W3OkGh1vtp10GAsyufRYN6jsuS73?=
 =?us-ascii?Q?oyCE7E5mEcba0c3P/Z9t1pRm0NtO682nkPoAQFWpFjj8H++3lHUAUK9BlEGo?=
 =?us-ascii?Q?0/F44h/cPPj83xpIjlFGB/Tcr1TrZsCS3hlyx2QyVX1m/VQbD04wq/xpBO/Z?=
 =?us-ascii?Q?rJ0+B7uEIqaQ3CryAKyTbgjANIAsShPvptv9FxQsNmzlYhlyciXcKHNsM/ug?=
 =?us-ascii?Q?Z4T9P/OnCREhVk9YB8SReZACjZl1hf5cPMhN/cXQlixjrGW/YacqyYWwUJm/?=
 =?us-ascii?Q?CNan7qw6fsEUlLOsJWrXVSIltp7oWOgmP7KX0FDYaPWLsH5SxMzCT89flzwe?=
 =?us-ascii?Q?I7IfKWHJ8uZkKE/W4yWI0iW5zwSAWOj9MbgqOw9A8hYv4tKAemwMV3G/6YBr?=
 =?us-ascii?Q?/65qt6picmywG5QhW35r8t5AMYswZbxsJ+23xSUSmvEP2DgXHu1HNr8IsSTe?=
 =?us-ascii?Q?aBlRUah6s/ZaSMVMnn+odkO1gGcvI/alXS+m9Vje/dW9uYNhCBdNatRpnS6r?=
 =?us-ascii?Q?3zrgAbupgqS/U2ucRyyKnq9kV7vOXfca7STm8mfK4+CE/kTC+uF9PALSwFTt?=
 =?us-ascii?Q?GbSRsxgSfMM8lOIUHxK0WYiV1ghSlWdP8zHLeDLGDWXYhUAhByv5rcVBIlE5?=
 =?us-ascii?Q?RBNz97UKTFoz8Ve9e/Jfza3kFqGSGhoWK7jBhmL+U3s/Gw+RwhVQ9x5CHLr3?=
 =?us-ascii?Q?c/n9hBsnvMTyjbk7WOx4+fxLZJtH15D20+fMW2pShL4wuEgYEt0VR8S2H9UD?=
 =?us-ascii?Q?qtcxxegs+BfKUnPuTQn402PN8MwxxG6Ic7KfIrYg3i6S0eLq/vSkXZmv6UQf?=
 =?us-ascii?Q?6/hNUL7ozhIlU20iSiYbsu+3ayzDgu3Y/qmTvWneNfakdXnvrkL7piTtgm4u?=
 =?us-ascii?Q?frCYoQV3By0rUrdzfOyo/6374+ve54/iEoD2UhqQbHpMdCEbC3/Mi/MGEEbr?=
 =?us-ascii?Q?nlEhhDomxEDE5HnqmdzoHqTE7sXUI/k2yPpzgue7T7fIEsnGgUdcQgbl4z9a?=
 =?us-ascii?Q?7+Owm2rD4RLDtN9sQmM3RX892yfnRcymPFRCzWgq+43BgIF5wdrPTTm7emfi?=
 =?us-ascii?Q?7I0lLFsZ5gephYofqYw4uMM2WvZPg87bhduimulv1s2brhf7xS02jgh3QMTD?=
 =?us-ascii?Q?rCplVxl92PUSmRcWGYYfYhcRZa+I+yIfTYwtq7WNYM8chj8L2E2izUzb1UcR?=
 =?us-ascii?Q?XrbXnCveXB/gSk91rS0DqcL5gYffwktAgYgCP6f06PtRXe5TFr8z5KT5HlHZ?=
 =?us-ascii?Q?Tp1LkDHvMXSywQ+QJYARgVE2WWbz71c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6bdf2f-d672-47cd-8b0e-08de73f5bb05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:40:37.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrnFMzIb2vP629fO9yRhR0ziINBXPVD6AQSNHSwA4WzqrraLp1UL2/wbWmqWLVHArBGZ7q54Vsv6BnQ9Cye23A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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

On Tue, Feb 24, 2026 at 02:20:33PM -0800, Wang, X wrote:
> 
> On 2/24/2026 14:05, Matt Roper wrote:
> > On Mon, Feb 23, 2026 at 06:33:54PM -0800, Xin Wang wrote:
> > > Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
> > > VIDEO_ENHANCE engines only. This check should have been in place from the
> > > start, as the driver typically avoids allowing uapi cases that we have
> > > no userspace consumer for.
> > > 
> > > Additionally, the GuC firmware on ModSched platforms no longer supports
> > > multi-lrc on non-media engines.
> > > 
> > > V3:
> > >   - store a multi-lrc enable class mask in xe->info and populate from
> > >     xe_device_desc in xe_pci.c (Matthew Brost)
> > > 
> > > V2:
> > >   - correct the typo (Shuicheng)
> > >   - move the check earlier to avoid VM lookup (Shuicheng, Matt Roper)
> > >   - remove the graphics version check (Matt Roper)
> > >   - input more details in the commit info (Matt Roper)
> > > 
> > > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > >   drivers/gpu/drm/xe/xe_exec_queue.c   |  5 +++++
> > >   drivers/gpu/drm/xe/xe_pci.c          | 17 +++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> > >   4 files changed, 25 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 8f3ef836541e..caa8f34a6744 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -138,6 +138,8 @@ struct xe_device {
> > >   		u8 tile_count;
> > >   		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
> > >   		u8 max_gt_per_tile;
> > > +		/** @info.multi_lrc_mask: bitmask of engine classes which support multi-lrc */
> > > +		u8 multi_lrc_mask;
> > >   		/** @info.gt_count: Total number of GTs for entire device */
> > >   		u8 gt_count;
> > >   		/** @info.vm_max_level: Max VM level */
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 66d0e10ee2c4..5abb29454d1f 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -1184,6 +1184,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > >   		if (XE_IOCTL_DBG(xe, !hwe))
> > >   			return -EINVAL;
> > > +		/* multi-lrc is only supported on select engine classes */
> > > +		if (XE_IOCTL_DBG(xe, args->width > 1 &&
> > > +				 !(xe->info.multi_lrc_mask & BIT(hwe->class))))
> > > +			return -EOPNOTSUPP;
> > > +
> > >   		vm = xe_vm_lookup(xef, args->vm_id);
> > >   		if (XE_IOCTL_DBG(xe, !vm))
> > >   			return -ENOENT;
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index e1f569235d8a..fe63387d4077 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -194,6 +194,7 @@ static const struct xe_device_desc tgl_desc = {
> > >   	.has_llc = true,
> > >   	.has_sriov = true,
> > >   	.max_gt_per_tile = 1,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > Is there a reason why some platforms list both VCS + VECS but others
> > only list VCS?  The new .multi_lrc_mask is intended to restrict usage to
> > just the engine type(s) where we have a real userspace consumer, and for
> > now I'd expect that to be the same across all current platforms.  We

Matt R beat me to this suggestion too, +1.

> > should double check whether the media driver is actively using this on
> > both media engine types or just one of them (I don't know off the top of
> > my head), and then set the mask accordingly.
> > 
> > An ioctl request for multi-LRC might also get rejected on a platform if
> > the engine fusing indicates that there aren't 2+ engines of the given
> > type, but that's an orthogonal check that's independent of the
> > multi_lrc_mask we're defining here.  Finding out how many engines
> > actually exist on a device is something that we can only find out at
> > runtime after reading the fuse registers for a specific device.
> > 
> > 
> > Matt
> I checked the specs and found that some devices have fewer than two VCS or
> VCES
> instances. In these cases, I don't think it's necessary to allow multi-LRC
> to
> those engines. This would prevent the injection of some illegal ioctl
> parameters.

See Matt's response above, we check in the IOCTL how many engines the
platform has, if it only has 1 the IOCTL will prevent multi-LRC queue
from being created.

So again, I'd just enable XE_ENGINE_CLASS_VIDEO_DECODE |
XE_ENGINE_CLASS_VIDEO_ENHANCE on platforms.

Matt

> 
> Xin
> > >   	.require_force_probe = true,
> > >   	.va_bits = 48,
> > >   	.vm_max_level = 3,
> > > @@ -208,6 +209,7 @@ static const struct xe_device_desc rkl_desc = {
> > >   	.has_display = true,
> > >   	.has_llc = true,
> > >   	.max_gt_per_tile = 1,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > >   	.require_force_probe = true,
> > >   	.va_bits = 48,
> > >   	.vm_max_level = 3,
> > > @@ -225,6 +227,7 @@ static const struct xe_device_desc adl_s_desc = {
> > >   	.has_llc = true,
> > >   	.has_sriov = true,
> > >   	.max_gt_per_tile = 1,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > >   	.require_force_probe = true,
> > >   	.subplatforms = (const struct xe_subplatform_desc[]) {
> > >   		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> > > @@ -246,6 +249,7 @@ static const struct xe_device_desc adl_p_desc = {
> > >   	.has_llc = true,
> > >   	.has_sriov = true,
> > >   	.max_gt_per_tile = 1,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > >   	.require_force_probe = true,
> > >   	.subplatforms = (const struct xe_subplatform_desc[]) {
> > >   		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> > > @@ -283,6 +287,7 @@ static const struct xe_device_desc dg1_desc = {
> > >   	.has_gsc_nvm = 1,
> > >   	.has_heci_gscfi = 1,
> > >   	.max_gt_per_tile = 1,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > >   	.require_force_probe = true,
> > >   	.va_bits = 48,
> > >   	.vm_max_level = 3,
> > > @@ -313,6 +318,8 @@ static const struct xe_device_desc ats_m_desc = {
> > >   	.pre_gmdid_media_ip = &media_ip_xehpm,
> > >   	.dma_mask_size = 46,
> > >   	.max_gt_per_tile = 1,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > >   	.require_force_probe = true,
> > >   	DG2_FEATURES,
> > > @@ -325,6 +332,8 @@ static const struct xe_device_desc dg2_desc = {
> > >   	.pre_gmdid_media_ip = &media_ip_xehpm,
> > >   	.dma_mask_size = 46,
> > >   	.max_gt_per_tile = 1,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > >   	.require_force_probe = true,
> > >   	DG2_FEATURES,
> > > @@ -358,6 +367,7 @@ static const struct xe_device_desc mtl_desc = {
> > >   	.has_display = true,
> > >   	.has_pxp = true,
> > >   	.max_gt_per_tile = 2,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > >   	.va_bits = 48,
> > >   	.vm_max_level = 3,
> > >   };
> > > @@ -393,6 +403,8 @@ static const struct xe_device_desc bmg_desc = {
> > >   	.has_soc_remapper_telem = true,
> > >   	.has_sriov = true,
> > >   	.max_gt_per_tile = 2,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > >   	.needs_scratch = true,
> > >   	.subplatforms = (const struct xe_subplatform_desc[]) {
> > >   		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
> > > @@ -445,6 +457,8 @@ static const struct xe_device_desc cri_desc = {
> > >   	.has_soc_remapper_telem = true,
> > >   	.has_sriov = true,
> > >   	.max_gt_per_tile = 2,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > >   	.require_force_probe = true,
> > >   	.va_bits = 57,
> > >   	.vm_max_level = 4,
> > > @@ -459,6 +473,8 @@ static const struct xe_device_desc nvlp_desc = {
> > >   	.has_page_reclaim_hw_assist = true,
> > >   	.has_pre_prod_wa = true,
> > >   	.max_gt_per_tile = 2,
> > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > >   	.require_force_probe = true,
> > >   	.va_bits = 48,
> > >   	.vm_max_level = 4,
> > > @@ -746,6 +762,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > >   	xe->info.skip_pcode = desc->skip_pcode;
> > >   	xe->info.needs_scratch = desc->needs_scratch;
> > >   	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> > > +	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
> > >   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > >   				 xe_modparam.probe_display &&
> > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > > index 470d31a1f0d6..47e8a1552c2b 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > @@ -30,6 +30,7 @@ struct xe_device_desc {
> > >   	u8 dma_mask_size;
> > >   	u8 max_remote_tiles:2;
> > >   	u8 max_gt_per_tile:2;
> > > +	u8 multi_lrc_mask;
> > >   	u8 va_bits;
> > >   	u8 vm_max_level;
> > >   	u8 vram_flags;
> > > -- 
> > > 2.43.0
> > > 
