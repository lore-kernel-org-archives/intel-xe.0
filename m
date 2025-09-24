Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349A6CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 19:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E790910E068;
	Wed, 24 Sep 2025 19:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V311iotI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED4C10E068
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 19:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758743465; x=1790279465;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UbGjjOCHiR5B6qdU0p5a2CBJ5KqU8BL5ilihKM1E18g=;
 b=V311iotIxGuoddQMPUWm6KrN9/BgF8SNEzCofgh/mbixeRM1F9JKRFCX
 S1h9mgQtBrB4b9MvITkRwAN4O05HtVW7NtrrZ1CCswexDWJzLObBeQWfs
 hiWdtF5ST9XVp7FFbJC9yfD1WWlncHCSMc1AM0wfA7LBSl4X4CEKaCuNS
 LCut9sk1dW9Ot2YAsSZov0k0bJqywJlH2ArKdCwIZOVF0XWvzBeig9DqO
 vkwRN+D8FsDO+2nwEfKVryLbcpMvaqN7ix0YT5GKmmAGPSy8GC9UWGW4u
 ZZ6nXLPiNyRJykNtshqp7sWLd9xUhQRKsi/MWeN5H2bmSp/V7RSiXxdGE g==;
X-CSE-ConnectionGUID: 4DFhep9fS3icV+56P51eYw==
X-CSE-MsgGUID: d+QHm1ljTdKjfjxIH1wJQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="71671843"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="71671843"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:51:04 -0700
X-CSE-ConnectionGUID: yg2fHShrTVCdNeekYGvDVw==
X-CSE-MsgGUID: 7TonI8h6QFSgjAUh6YlXMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176725185"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:51:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 12:51:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 12:51:01 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 12:51:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isWfsvU5/R+fak26R7G5BK5AKBT16imvbY4QRrjwU9JFe06GcHgdke+1NHt/ahd5kLxcHaUlEvZbHyP0w5Gd6T+09AxHMWonTeDyMyNZKKq3+iemQ6xNFuYorr3IysYLxtc544RYC81Oa0Ee1QGBtfv0U9NyILe1OC3/m7ON8RHHlEeGYqdtKFa89355cwPBOG4wZwkS8GIxuhXN9Dk/dwDrvuVGQ/t3nwu0T+gYbAbo0VmZjMuPomOIUqquJs4P0aQHsstPOO409Sjnx0fqLeijeRv7u3PQXGYXxZQordwqyKmgEjNGxzgyqjMuDb4p954zrVyutxrQew2m8G4aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aNHrO5dJqbJ+N+L24wsSAtcu5akMR0NK/KTeU66Jdw=;
 b=pC86BpZt5I8k9BhHoIWmIJNX/QerJyQJaDBMi9nT6tt/78LT/2a9uiEwVbyziFOUjEHAENTUcttgvl+BfWoS1JX7XDpADlc+GfgvbXQtuIGgXzxVi3cDdUtAHA5BdoikWw5ZkTgvUNrjQqbLofv+TMD8ffDtJfnjAwS21YqET9wefwJilm/LnFAMz6tdXnE+EiJAxWC/2Qdw7/MHvwsPOocheUZLofg/uhmVB8Xw2PXsb5QjT7pkmGWWgyz1866yVYAlN0EgJ32KH7oqfy4D7/JxXBI9SDlS4SgLCtHz+2OGntzakZ8ER5g7B3lJ+JXZRNuP7ve8g60UNp3MdQO09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Wed, 24 Sep
 2025 19:50:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 19:50:52 +0000
Date: Wed, 24 Sep 2025 12:50:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 12/34] drm/xe/vf: Make VF recovery run on per-GT worker
Message-ID: <aNRLmmK5yqXa3xNb@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-13-matthew.brost@intel.com>
 <55c5e870-6823-4fb3-80ab-0e6914d054d2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55c5e870-6823-4fb3-80ab-0e6914d054d2@intel.com>
X-ClientProxiedBy: BYAPR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:74::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2c0607-fdb1-4a7f-aff5-08ddfba3ab07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4/gUAHHgAOm2/2WXSNN0PDcAmHgHALtKHCDkkjr5EwnfoXjtXuN2SPG6Aq++?=
 =?us-ascii?Q?pk/rdXZ0d3kfZCHu2sTs4dpcQR9+lqvK1VYPhOIcjx1Ps6GV4X6KNlRdmqjT?=
 =?us-ascii?Q?abiQQ5Q3EGX3PdYK93IUwNx2glJJP1n/A2mBcmu+elAuWyKzDYYSmsJ6COut?=
 =?us-ascii?Q?3cWE1G2ZWl3DKNEu9FWSWyuAEiaVt37Cy3bvY5sU4ANYm/1LfKwiBilSh/q6?=
 =?us-ascii?Q?v1aLop5UN5W2JHwEeSjXKcl/SRuvC+lG5v92BWMgvlIJIcM1eC/1wVWUzUDn?=
 =?us-ascii?Q?Grro2bk0hPIWjG7IyntyrYg+JvHgGZAw16T2ggYaOnTaBB+9fgCU3PJqPuo8?=
 =?us-ascii?Q?FXoH3zyZlQNQn45hq7qZifNbwxYJ2AwLHADE9ajuui4ZPwWE07xazt+Gsw00?=
 =?us-ascii?Q?Rd2Gfa1Xxo/sZNfpLGJELefJYU0+oYDuecouumWKgmO0eBb/vXQDmMDTJn+V?=
 =?us-ascii?Q?t0xw4zS8rw/7bM3y/bePF+euRPFui2gNikgXUOu3H76sVLOAd+mCjCGlXfuH?=
 =?us-ascii?Q?zjGGF+lIPVaO9OMaJtP4wBaRLkSUU0aq/lwyXinXqXe2iOIX9Sp3Jcd76KvT?=
 =?us-ascii?Q?v8VKdsatXDou/CDlYeYMLe08jcFutq/hHsD2o/J2koUCIQjxUc0FgDZCyF1W?=
 =?us-ascii?Q?qZ5k5JryC1opcIBmyEdWXCF/YlIeRDM2Wqn03rr2QfAuXFpaTZ/hxz5fzsBi?=
 =?us-ascii?Q?tg5TRSwiJIvPsVxtjjk0WoSRdYG1EgqGA25YPCcSbZpfY5Y1xYZa73yGl6vi?=
 =?us-ascii?Q?bdh9ARKxSjEz6nixPkELdGzV5dOKf1MSvBTYuP/3fmV8As0IOrvoFujpXuTd?=
 =?us-ascii?Q?T2/PjxQLF2R1lfn7/PUswK7kZs5XzTvo2LDrYPdcQn36UGrpBmSdylxfvtJO?=
 =?us-ascii?Q?TqZLQiJcwyA3UcIatmWFeFvR/KJ3ml7yoXO984wxyP6y/ZStP+LSooBlTCDy?=
 =?us-ascii?Q?TIa7X5Pc+qKFksv8SJeKNWLewQrQ+Pm7r4QRxk0ENBrlyESytYCz1U4Z7gSb?=
 =?us-ascii?Q?8vBwGT905p6vT3IoC2cfFRlb/E9wsN86/Rba1n872hdQcITqGjwJLyb0HZKA?=
 =?us-ascii?Q?Cxj5jstilYVM2SrHOODIq1alWOw54+Us+dDGqw6rS07NPjAG1JfV3xrfRhdZ?=
 =?us-ascii?Q?Rxu0fWSXAOplOVnFOlFufXgvVFInhVXRRlqEWFfFaXMvDKxueu/MPgYMO+C/?=
 =?us-ascii?Q?BHEL3o1PmgxAAl0XPsIhlEq+HBhxkdipBglwewIepEOIEYtaD2OFr6xpJBto?=
 =?us-ascii?Q?N6oonoQc8yJszztdH++VIKUPaLuvHUGVffTnm17/uBGMeqzhRF+j3nEMpTik?=
 =?us-ascii?Q?dbUTvs7pt779WhYS77lVvruKUyIKZoAD0MHaIpVsvtyue/WTy28o5oRsCgVe?=
 =?us-ascii?Q?5dwgaTGaf0YfqNs+bC7bnnH9nxBo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zm19w1PdPkXeZVd4+vMALwVqQwu8wpT00rf2fQzgvcvV1wz/V3XH7QEAGfvw?=
 =?us-ascii?Q?Z0VNRkDxmFaSuQ4/WC25VGkOals+v44hdyVU6KxrsjUvfgWhTawUZfZ3yHPi?=
 =?us-ascii?Q?OLNX5Yjlsiy6gIBb/ObNDcK+RLAEECUXRDK1MqY1LtVA+0o7gMQeZy1aNqzW?=
 =?us-ascii?Q?9b5ZEhfhK7h9a+i32tzFRG5UCEIcNU699aeShfVrTG5CD0DLtkwOl4Obiv4P?=
 =?us-ascii?Q?Q2xf9rJa81GysLgeQIVP21dB8PGZg48eUMiGjWrnqc/eUB/juGB1VnvWYC+2?=
 =?us-ascii?Q?4FSmPUUOgzFCoiFoaCtggFjWCTc6V3uOxbUQdExshL5HyDaWig8e3If3T7Sr?=
 =?us-ascii?Q?tNp2XgQw3hdMgKzRE0j+hJexlXtwxSlKm4ca3dUabkRvnIoWwAGEM3Tp4Zd/?=
 =?us-ascii?Q?L0snYtK3xXF/Zk554b46vaXQNN20hdNyQ9/aZ1iGapcQcAARv+iyvoDw98Pr?=
 =?us-ascii?Q?KikcAD2GwckEzMcusjgioYqka3AN+6ZPeRiUQQbsa8S7bPMzrV7DfoDTeuFA?=
 =?us-ascii?Q?2yZVoIUjc5FeTv5OGaKjcsmRNNyxDthd+XIVagNT6OpmbFOMBZSh/pQBlLxj?=
 =?us-ascii?Q?Mf6zaNV0oJ84dTPcObpv3A7ljH8Zpl9rPdIAWpgTklcoklO111t/FrPH+s4S?=
 =?us-ascii?Q?QSZR92rNo01/3iA82zF6LlYirZF9fWzGSGr7V3vnrRF7a1yt6ItUT85vmB5W?=
 =?us-ascii?Q?mdsXM3tNT8kbArbNzT+t0bY1HHlY1FXVlPfAwBL9WY4edh6cGAb6b0mep8TV?=
 =?us-ascii?Q?ticmQQynKZ3FNLAdKbLiB3HzGJE9WJXWHm0+rjaCrUxpvJxJb8Siebk+g5QF?=
 =?us-ascii?Q?I5WvUlVA+ejmDbxWFsckyaBBLrX7Lfj7kF3z+DW9YSWrPAah4ZH9vyR+/nFx?=
 =?us-ascii?Q?6gAM8ixqLJ8SOJgkGZXLJcOBEoDu2YMg+UzPpQEX5VmF2WmQcy1k+aK8rD0u?=
 =?us-ascii?Q?fgcdxw5SDyhqbvexG5oFsPwUk6ophIjXqI/TlzpLXNfoD4HRQ1auUDTfZspQ?=
 =?us-ascii?Q?AeOdJIRQiGaSKehdtVClj9HEOJJUtDneF+D/VX3USqIMRoU/WKm4GyQeXefL?=
 =?us-ascii?Q?N05g5B4nGo45lXZlcG6sFwZ62yNgRPazH/pnM60JRD7cQ7SBvuSktBZr++Yh?=
 =?us-ascii?Q?Ft+jzmbX/MO8eCqsjzyJ2e/Sd7NM/GvQsijoh+OOJzyAseIDgePzNfvQg1ei?=
 =?us-ascii?Q?rW7OgLxzMrnnMPNnZ89yhqYd7GNa3lzo5y51VUBV4n0TU3ADhgJHpM24Edq4?=
 =?us-ascii?Q?cVQMjHMy2lWNOqak5AmNFVBqTev7x7W8wcqxuOSpp3viWi7z2hfMrEzVp3Zq?=
 =?us-ascii?Q?zAB9kAAtH/qtLBpehHEX4xmt6+se0NS/4Ym81MaAOE8ac/USyN+MIa2M0Xpn?=
 =?us-ascii?Q?vi0UnnFf2rSo1udhnWtTSY0Kvwd8FbQAb6Gia4PoNoO5eE5Uuib352QRf2Zy?=
 =?us-ascii?Q?j/bENANPkDA8UjuD3p31WGraVG7/WVwXtXzZUCKaQcA9XHYeHABSQJhfAqaS?=
 =?us-ascii?Q?cyL8p16Xw9k5YiFlzbFTCdsUj4Y091EePFJ7h/jHxr8TLUIiFWc0M83DACe0?=
 =?us-ascii?Q?MwM6sGKXhtza1U9VRijWWaK+RBSYQEkk83PGQQy9Lak/5L8qwlIBS05jGMww?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2c0607-fdb1-4a7f-aff5-08ddfba3ab07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 19:50:52.6392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5HpQGCDPALKd8HRS9dGr7hQEay+DTdTNRVThpuZ7cktbbodMYEpWRK50URToJcSER180+ZB0y74ONy2zbvHtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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

On Wed, Sep 24, 2025 at 12:49:25PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > VF recovery is a per-GT operation, so it makes sense to isolate it to a
> 
> that was also my suggestion to make it per-GT, good to see it happen now
> 

+1

> > per-GT queue. Scheduling this operation on the same worker as the GT
> > reset and TDR not only aligns with this design but also helps avoid race
> > conditions, as those operations can also modify the queue state.
> 
> but while the recovery is per-GT, we should still protect against that
> one GT starts the recovery sooner then other GTs notice about it
> 

Yes. There is shared state in 2 places:

 - The GGTT shifting, this handled by [1] in my series.
 - CCS restore on iGPU (PTL) handled by [2] [3] in my series.

[1] https://patchwork.freedesktop.org/patch/676394/?series=154627&rev=2
[2] https://patchwork.freedesktop.org/patch/676393/?series=154627&rev=2
[3] https://patchwork.freedesktop.org/patch/676397/?series=154627&rev=2

> > 
> > v2:
> >  - Fix lockdep splat (Adam)
> >  - Use xe_sriov_vf_migration_supported helper
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 170 ++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   7 +
> >  drivers/gpu/drm/xe/xe_sriov_vf.c          | 242 +---------------------
> >  drivers/gpu/drm/xe/xe_sriov_vf.h          |   1 -
> >  drivers/gpu/drm/xe/xe_sriov_vf_types.h    |   4 -
> >  6 files changed, 169 insertions(+), 258 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index c9d0e32e7a15..cfb71b749e52 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -25,11 +25,15 @@
> >  #include "xe_guc.h"
> >  #include "xe_guc_hxg_helpers.h"
> >  #include "xe_guc_relay.h"
> > +#include "xe_guc_submit.h"
> > +#include "xe_irq.h"
> >  #include "xe_lrc.h"
> >  #include "xe_memirq.h"
> >  #include "xe_mmio.h"
> > +#include "xe_pm.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_vf.h"
> > +#include "xe_tile_sriov_vf.h"
> >  #include "xe_uc_fw.h"
> >  #include "xe_wopcm.h"
> >  
> > @@ -314,7 +318,7 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> >   * Returns: 0 if the operation completed successfully, or a negative error
> >   * code otherwise.
> >   */
> > -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> > +static int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
> >  {
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	int err;
> > @@ -808,7 +812,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
> >   * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
> >   * @gt: the &xe_gt struct instance
> >   */
> > -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> > +static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> >  {
> >  	struct xe_hw_engine *hwe;
> >  	enum xe_hw_engine_id id;
> > @@ -817,6 +821,26 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> >  		xe_default_lrc_update_memirq_regs_with_address(hwe);
> >  }
> >  
> > +static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
> 
> nit: if this is static then could be just:
> 
> 	vf_start_migration_recovery(gt)
> 

Sure.

> > +{
> > +	bool started;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	spin_lock(&gt->sriov.vf.migration.lock);
> > +
> > +	if (!gt->sriov.vf.migration.recovery_queued) {
> > +		gt->sriov.vf.migration.recovery_queued = true;
> > +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > +
> > +		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> > +		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> > +				 "scheduled" : "already in progress");
> 
> with this .recovery_queued flag, can we hit "already in progress" case?
> 

This was existing code so kept it but I'm really unclear how we can get
multiple resfix IRQs without the prior resfix flow being completed.
Maybe Tomasz can clear this one up? Ideally I'd like to remove multiple
resfix IRQ handled code if this is not possible.

> > +	}
> > +
> > +	spin_unlock(&gt->sriov.vf.migration.lock);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
> >   *   or just mark that a GuC is ready for it.
> > @@ -831,15 +855,8 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> >  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> >  	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
> >  
> > -	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> > -	/*
> > -	 * We need to be certain that if all flags were set, at least one
> > -	 * thread will notice that and schedule the recovery.
> > -	 */
> > -	smp_mb__after_atomic();
> > -
> >  	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
> > -	xe_sriov_vf_start_migration_recovery(xe);
> > +	xe_gt_sriov_vf_start_migration_recovery(gt);
> >  }
> >  
> >  static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
> > @@ -1175,6 +1192,139 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >  		   pf_version->major, pf_version->minor);
> >  }
> >  
> > +static void vf_post_migration_shutdown(struct xe_gt *gt)
> > +{
> > +	int ret = 0;
> > +
> > +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > +	gt->sriov.vf.migration.recovery_queued = false;
> > +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> > +
> > +	xe_guc_submit_pause(&gt->uc.guc);
> > +	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> 
> this |= seem unneeded
> 

This is existing code copy / pasted and is removed in [4].

[4] https://patchwork.freedesktop.org/patch/676382/?series=154627&rev=2

> > +
> > +	if (ret)
> > +		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
> 
> is this the only possible reason? maybe worth to add %pe ?
> 

Again this existing code and will be removed in [4].

So with above statements, I'd prefer just to leave as is.

> > +}
> > +
> > +static size_t post_migration_scratch_size(struct xe_device *xe)
> > +{
> > +	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> > +}
> > +
> > +static int vf_post_migration_fixups(struct xe_gt *gt)
> > +{
> > +	s64 shift;
> > +	void *buf;
> > +	int err;
> > +
> > +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	err = xe_gt_sriov_vf_query_config(gt);
> > +	if (err)
> > +		goto out;
> > +
> > +	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> > +	if (shift) {
> > +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > +		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > +		if (err)
> > +			goto out;
> > +	}
> > +
> > +out:
> > +	kfree(buf);
> > +	return err;
> > +}
> > +
> > +static void vf_post_migration_kickstart(struct xe_gt *gt)
> > +{
> > +	/*
> > +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> > +	 * must be working at this point, since the recovery did started,
> > +	 * but the rest was not enabled using the procedure from spec.
> > +	 */
> > +	xe_irq_resume(gt_to_xe(gt));
> > +
> > +	xe_guc_submit_reset_unblock(&gt->uc.guc);
> > +	xe_guc_submit_unpause(&gt->uc.guc);
> > +}
> > +
> > +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> > +{
> > +	bool skip_resfix = false;
> > +
> > +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> > +	if (gt->sriov.vf.migration.recovery_queued) {
> > +		skip_resfix = true;
> > +		xe_gt_sriov_dbg(gt, "another recovery imminent, skipped some notifications\n");
> > +	} else {
> > +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> > +	}
> > +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> > +
> > +	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);
> 
> nit: this looks cleaner:
> 
> 	if (skip_resfix)
> 		return -EAGAIN;
> 
> 	return xe_gt_sriov_vf_notify_resfix_done(gt);
> 

Sure.

> > +}
> > +
> > +static void vf_post_migration_recovery(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int err;
> > +
> > +	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
> > +
> > +	xe_pm_runtime_get(xe);
> > +	vf_post_migration_shutdown(gt);
> > +
> > +	if (!xe_sriov_vf_migration_supported(xe)) {
> > +		xe_gt_sriov_err(gt, "migration is not supported\n");
> > +		err = -ENOTRECOVERABLE;
> > +		goto fail;
> > +	}
> > +
> > +	err = vf_post_migration_fixups(gt);
> > +	if (err)
> > +		goto fail;
> > +
> > +	vf_post_migration_kickstart(gt);
> > +	err = vf_post_migration_notify_resfix_done(gt);
> > +	if (err && err != -EAGAIN)
> > +		goto fail;
> > +
> > +	xe_pm_runtime_put(xe);
> > +	xe_gt_sriov_notice(gt, "migration recovery ended\n");
> > +	return;
> > +fail:
> > +	xe_pm_runtime_put(xe);
> > +	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> > +	xe_device_declare_wedged(xe);
> > +}
> > +
> > +static void migration_worker_func(struct work_struct *w)
> > +{
> > +	struct xe_gt *gt = container_of(w, struct xe_gt,
> > +					sriov.vf.migration.worker);
> > +
> > +	vf_post_migration_recovery(gt);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
> > + * @gt: the &xe_gt
> > + */
> > +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
> > +{
> > +	init_rwsem(&gt->sriov.vf.self_config.lock);
> > +	spin_lock_init(&gt->sriov.vf.migration.lock);
> > +	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> > +
> > +	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> > +		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
> 
> we likely don't want to repeat that message on every GT
> 

So move this to xe_sriov_vf_init_early?

> > +}
> > +
> >  /**
> >   * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> >   * @gt: the &xe_gt
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index bb5f8eace19b..2ac6775b52f0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -21,10 +21,9 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >  int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> > -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> > -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> >  
> > +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
> >  bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> >  
> >  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 7b10b8e1e10e..53680a2f188a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/rwsem.h>
> >  #include <linux/types.h>
> > +#include <linux/workqueue.h>
> >  #include "xe_uc_fw_types.h"
> >  
> >  /**
> > @@ -53,6 +54,12 @@ struct xe_gt_sriov_vf_runtime {
> >   * xe_gt_sriov_vf_migration - VF migration data.
> >   */
> >  struct xe_gt_sriov_vf_migration {
> > +	/** @migration: VF migration recovery worker */
> > +	struct work_struct worker;
> > +	/** @lock: Protects recovery_queued */
> > +	spinlock_t lock;
> > +	/** @recovery_queued: VF post migration recovery in queued */
> > +	bool recovery_queued;
> >  	/** @recovery_inprogress: VF post migration recovery in progress */
> >  	bool recovery_inprogress;
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > index da064a1e7419..7d91553c4acc 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -6,21 +6,12 @@
> >  #include <drm/drm_debugfs.h>
> >  #include <drm/drm_managed.h>
> >  
> > -#include "xe_assert.h"
> > -#include "xe_device.h"
> >  #include "xe_gt.h"
> > -#include "xe_gt_sriov_printk.h"
> >  #include "xe_gt_sriov_vf.h"
> >  #include "xe_guc.h"
> > -#include "xe_guc_submit.h"
> > -#include "xe_irq.h"
> > -#include "xe_lrc.h"
> > -#include "xe_pm.h"
> > -#include "xe_sriov.h"
> >  #include "xe_sriov_printk.h"
> >  #include "xe_sriov_vf.h"
> >  #include "xe_sriov_vf_ccs.h"
> > -#include "xe_tile_sriov_vf.h"
> >  
> >  /**
> >   * DOC: VF restore procedure in PF KMD and VF KMD
> > @@ -158,8 +149,6 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> >  	xe->sriov.vf.migration.enabled = false;
> >  }
> >  
> > -static void migration_worker_func(struct work_struct *w);
> > -
> >  static void vf_migration_init_early(struct xe_device *xe)
> >  {
> >  	/*
> > @@ -184,8 +173,6 @@ static void vf_migration_init_early(struct xe_device *xe)
> >  						    guc_version.major, guc_version.minor);
> >  	}
> >  
> > -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
> > -
> >  	xe->sriov.vf.migration.enabled = true;
> >  	xe_sriov_dbg(xe, "migration support enabled\n");
> >  }
> > @@ -200,238 +187,11 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
> >  	unsigned int id;
> >  
> >  	for_each_gt(gt, xe, id)
> > -		init_rwsem(&gt->sriov.vf.self_config.lock);
> > +		xe_gt_sriov_vf_migration_init_early(gt);
> 
> still, this should be called from gt_init_early kind of functions
> 

Kinda a nit that I'm not convinced is worth while to have
xe_sriov_vf_init_early and then xe_gt_sriov_vf_migration_init_early
called in gt_init_early...

Matt

> >  
> >  	vf_migration_init_early(xe);
> >  }
> >  
> > -/**
> > - * vf_post_migration_shutdown - Stop the driver activities after VF migration.
> > - * @xe: the &xe_device struct instance
> > - *
> > - * After this VM is migrated and assigned to a new VF, it is running on a new
> > - * hardware, and therefore many hardware-dependent states and related structures
> > - * require fixups. Without fixups, the hardware cannot do any work, and therefore
> > - * all GPU pipelines are stalled.
> > - * Stop some of kernel activities to make the fixup process faster.
> > - */
> > -static void vf_post_migration_shutdown(struct xe_device *xe)
> > -{
> > -	struct xe_gt *gt;
> > -	unsigned int id;
> > -	int ret = 0;
> > -
> > -	for_each_gt(gt, xe, id) {
> > -		xe_guc_submit_pause(&gt->uc.guc);
> > -		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> > -	}
> > -
> > -	if (ret)
> > -		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
> > -}
> > -
> > -/**
> > - * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
> > - * @xe: the &xe_device struct instance
> > - *
> > - * After we have finished with all post-migration fixups, restart the driver
> > - * activities to continue feeding the GPU with workloads.
> > - */
> > -static void vf_post_migration_kickstart(struct xe_device *xe)
> > -{
> > -	struct xe_gt *gt;
> > -	unsigned int id;
> > -
> > -	/*
> > -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> > -	 * must be working at this point, since the recovery did started,
> > -	 * but the rest was not enabled using the procedure from spec.
> > -	 */
> > -	xe_irq_resume(xe);
> > -
> > -	for_each_gt(gt, xe, id) {
> > -		xe_guc_submit_reset_unblock(&gt->uc.guc);
> > -		xe_guc_submit_unpause(&gt->uc.guc);
> > -	}
> > -}
> > -
> > -static bool gt_vf_post_migration_needed(struct xe_gt *gt)
> > -{
> > -	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
> > -}
> > -
> > -/*
> > - * Notify GuCs marked in flags about resource fixups apply finished.
> > - * @xe: the &xe_device struct instance
> > - * @gt_flags: flags marking to which GTs the notification shall be sent
> > - */
> > -static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long gt_flags)
> > -{
> > -	struct xe_gt *gt;
> > -	unsigned int id;
> > -	int err = 0;
> > -
> > -	for_each_gt(gt, xe, id) {
> > -		if (!test_bit(id, &gt_flags))
> > -			continue;
> > -		/* skip asking GuC for RESFIX exit if new recovery request arrived */
> > -		if (gt_vf_post_migration_needed(gt))
> > -			continue;
> > -		err = xe_gt_sriov_vf_notify_resfix_done(gt);
> > -		if (err)
> > -			break;
> > -		clear_bit(id, &gt_flags);
> > -	}
> > -
> > -	if (gt_flags && !err)
> > -		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
> > -	return err;
> > -}
> > -
> > -static int vf_get_next_migrated_gt_id(struct xe_device *xe)
> > -{
> > -	struct xe_gt *gt;
> > -	unsigned int id;
> > -
> > -	for_each_gt(gt, xe, id) {
> > -		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
> > -			return id;
> > -	}
> > -	return -1;
> > -}
> > -
> > -static size_t post_migration_scratch_size(struct xe_device *xe)
> > -{
> > -	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
> > -}
> > -
> > -/**
> > - * Perform post-migration fixups on a single GT.
> > - *
> > - * After migration, GuC needs to be re-queried for VF configuration to check
> > - * if it matches previous provisioning. Most of VF provisioning shall be the
> > - * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
> > - * range has changed, we have to perform fixups - shift all GGTT references
> > - * used anywhere within the driver. After the fixups in this function succeed,
> > - * it is allowed to ask the GuC bound to this GT to continue normal operation.
> > - *
> > - * Returns: 0 if the operation completed successfully, or a negative error
> > - * code otherwise.
> > - */
> > -static int gt_vf_post_migration_fixups(struct xe_gt *gt)
> > -{
> > -	s64 shift;
> > -	void *buf;
> > -	int err;
> > -
> > -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
> > -	if (!buf)
> > -		return -ENOMEM;
> > -
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > -	if (err)
> > -		goto out;
> > -
> > -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> > -	if (shift) {
> > -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > -		if (err)
> > -			goto out;
> > -	}
> > -
> > -out:
> > -	kfree(buf);
> > -	return err;
> > -}
> > -
> > -static void vf_post_migration_recovery(struct xe_device *xe)
> > -{
> > -	unsigned long fixed_gts = 0;
> > -	int id, err;
> > -
> > -	drm_dbg(&xe->drm, "migration recovery in progress\n");
> > -	xe_pm_runtime_get(xe);
> > -	vf_post_migration_shutdown(xe);
> > -
> > -	if (!xe_sriov_vf_migration_supported(xe)) {
> > -		xe_sriov_err(xe, "migration is not supported\n");
> > -		err = -ENOTRECOVERABLE;
> > -		goto fail;
> > -	}
> > -
> > -	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
> > -		struct xe_gt *gt = xe_device_get_gt(xe, id);
> > -
> > -		err = gt_vf_post_migration_fixups(gt);
> > -		if (err)
> > -			goto fail;
> > -
> > -		set_bit(id, &fixed_gts);
> > -	}
> > -
> > -	vf_post_migration_kickstart(xe);
> > -	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
> > -	if (err)
> > -		goto fail;
> > -
> > -	xe_pm_runtime_put(xe);
> > -	drm_notice(&xe->drm, "migration recovery ended\n");
> > -	return;
> > -fail:
> > -	xe_pm_runtime_put(xe);
> > -	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
> > -	xe_device_declare_wedged(xe);
> > -}
> > -
> > -static void migration_worker_func(struct work_struct *w)
> > -{
> > -	struct xe_device *xe = container_of(w, struct xe_device,
> > -					    sriov.vf.migration.worker);
> > -
> > -	vf_post_migration_recovery(xe);
> > -}
> > -
> > -/*
> > - * Check if post-restore recovery is coming on any of GTs.
> > - * @xe: the &xe_device struct instance
> > - *
> > - * Return: True if migration recovery worker will soon be running. Any worker currently
> > - * executing does not affect the result.
> > - */
> > -static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
> > -{
> > -	struct xe_gt *gt;
> > -	unsigned int id;
> > -
> > -	for_each_gt(gt, xe, id) {
> > -		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
> > -			return true;
> > -	}
> > -	return false;
> > -}
> > -
> > -/**
> > - * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
> > - * @xe: the &xe_device to start recovery on
> > - *
> > - * This function shall be called only by VF.
> > - */
> > -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
> > -{
> > -	bool started;
> > -
> > -	xe_assert(xe, IS_SRIOV_VF(xe));
> > -
> > -	if (!vf_ready_to_recovery_on_any_gts(xe))
> > -		return;
> > -
> > -	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
> > -	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
> > -		 "scheduled" : "already in progress");
> > -}
> > -
> >  /**
> >   * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
> >   * @xe: the &xe_device to initialize
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> > index 9e752105ec2a..4df95266b261 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> > @@ -13,7 +13,6 @@ struct xe_device;
> >  
> >  void xe_sriov_vf_init_early(struct xe_device *xe);
> >  int xe_sriov_vf_init_late(struct xe_device *xe);
> > -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
> >  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> >  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > index 426cc5841958..6a0fd0f5463e 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> > @@ -33,10 +33,6 @@ struct xe_device_vf {
> >  
> >  	/** @migration: VF Migration state data */
> >  	struct {
> > -		/** @migration.worker: VF migration recovery worker */
> > -		struct work_struct worker;
> > -		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> > -		unsigned long gt_flags;
> >  		/**
> >  		 * @migration.enabled: flag indicating if migration support
> >  		 * was enabled or not due to missing prerequisites
> 
