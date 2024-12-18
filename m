Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5F4E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 17:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0608F10E205;
	Wed, 18 Dec 2024 17:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyutBHK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A3310E205
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734542846; x=1766078846;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6jn+JHhtPv+AosZLWp6ELcLQstkNV4Np3zCHAF5d7zc=;
 b=jyutBHK5slunZaWRLkdWwNBj0dlpaloZd3ANMGHlMqN+BGRS/qcRrGQz
 dyVP3OW2T7D9ZI3LqDldcYj9m10cSLzKNhETnMeUJvGpsNwKVP0Z5jAjx
 kiEVWAdLvzggEPU7cWcsmjP4g4d79S0T9VSAv7k/nA8YeV5iqtyY6fRpn
 ID0WvXhyWLJ9LHK2xyRHKOSWifNejUZt+N/j/n8bUvCeoZzfoIY5yWohW
 IoVA+26y03tAaP+WmQXdCRCn6zbuAFq6XEUXIct3w5XEggjXDQrrCGQCW
 sFqDyd3zy1mJb18NUWatu0QcZTxxp/hbPXIC9UueSg2/B6EGXZxhAKM86 Q==;
X-CSE-ConnectionGUID: 25g+AU9/TTyhFVLFhvaYog==
X-CSE-MsgGUID: 0rfl0HBtRmCsGa7lkUL9JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38811652"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="38811652"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 09:27:25 -0800
X-CSE-ConnectionGUID: SkfT2hkLSWKAknyPGl9N+w==
X-CSE-MsgGUID: 7npRiPQMQIi0Z6fRTOQCTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="98483033"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 09:27:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 09:27:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 09:27:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 09:27:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acA+NCPUlRVjipvLvXsASASxcoZNBTxLKSAFIfKrJIXbhouUkpbn83X3AO4xJroxVxnSdjxFS5BQLJSwEU1c0/0YmuSYiu8G8c2zP1uIdRFueXGgn3j5B/n0vEYnQpIBBh4+0XSXmTpyQEVbNKeTuQFdZMxltMGOrc3KTscsDJvqo9AX6X3FHi5zAEiCCSRdrbYqC/CFGX553L2u9422kUL9RuFBdcqtyVokQ7fvcRZy3nlarLFzQVW6F3R7pdq1NcGc6OBWqtBdIlnAqRA0q3aFMEOnlicgRQJIylqgv+J/ANwDnNBTjwWXivSCUAGAkkL6g3pe+C8Z3pqIY9hFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8IJbgszSfnYx/YVLUV/2EJMPccnl7YwU2r/J9719Xw=;
 b=uT/sTrBk9tMMX9YTfj9XP+BPIzhvZO+NPBVcmCVKDcRZqZUPjsj/UOGXvp5I0l/bTdHaFqN1gTQpUETyY5hfZ0Be7G+Y5g+n6M2uxvYZo1XYDkN55H18VAbDGjMqCeWhw4bWadBZfEuWduoPe8nm7mBnXApp/BkPKEQlxH/ltd8ObwUSsvSaBaEY+VdJP37+sqrpKqJqnxAv8GDHagPJ3sN2fxStD69njrn03dZnrIqrhkzjYRnPnRPyc5lPlgBlhJk+sje3ng2OLN3QbghwRaRtpq9Lq++AWdRkXrynilZ4oMMkRTqI+euoLhWdwQDoYxcg1KZAS7sVJJOfmRHzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Wed, 18 Dec
 2024 17:26:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 17:26:52 +0000
Date: Wed, 18 Dec 2024 09:27:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Force write completion of MI_STORE_DATA_IMM
Message-ID: <Z2MGCDqGmlsYwi+J@lstrano-desk.jf.intel.com>
References: <20241217160732.46280-1-jose.souza@intel.com>
 <Z2ILvmX9y87iFvZP@lstrano-desk.jf.intel.com>
 <3ebdd73cecef119cbfb7fc902909c8c2adc5b0fc.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ebdd73cecef119cbfb7fc902909c8c2adc5b0fc.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 143fcd2a-fb47-4925-117a-08dd1f8929a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3BSizUDqQPbTA4cVWY8vfq5hKIaVh6LhPSAZZ+opUf0ZjRZJTeu4Nh0Cxm?=
 =?iso-8859-1?Q?DXjBpRP0GdrgGl/L9/N3EyW4/bVjZIvRatE2kdNBEKaqWalYmLkB3ofrp0?=
 =?iso-8859-1?Q?yx3Mc+dij9TvjFrgORyJ0pebwsWO3qzpxy3a8Ig89Ae/q0w+SvfvNDgJKD?=
 =?iso-8859-1?Q?vGSFaCyew6A+M14zDzgAkPXMZN+ZsPqt0lReqq2od8qdIjNY28frFheVtM?=
 =?iso-8859-1?Q?aelKsS6ETdXurM78Fv3s1iDlWi9+3BkDNSO2oPVlAbnJ2Oei8POp2pNzhD?=
 =?iso-8859-1?Q?gkDw+RSZM9Pqv9ooVXTIKK0rt8iCYoHGwo06P9iai0LYQK3agg/E8afioc?=
 =?iso-8859-1?Q?UzKSJDwHT4w4+XQfR+lmE8OGsbKZoTroWIzFuX0b90VmPfYQ2anmuHm2gu?=
 =?iso-8859-1?Q?wRv40q9ImvRyTTaC8iMK5tkD+TSPRfgJaU7ZcCPwKvKKdKhPaWyjud23Mo?=
 =?iso-8859-1?Q?Ihq4KpFPH0bE/Tb8noBCl5r1TydKvweasGU7je6xDUtCeR3XI61TYYC/pc?=
 =?iso-8859-1?Q?kVqeyltQAEAOzQCZ7Bq4ccZoCe3SdjXpX0Ob6JuONdxlovaXQBEyM1E76F?=
 =?iso-8859-1?Q?IVVHCB8dxxEo9Sg4BAxaBYZ8iwQJaBrDKtht1s4H6aVo2i1xl2ftxI9EjK?=
 =?iso-8859-1?Q?1fkxnee4uefludgMfO+I41mqzgpRO1UbulmzEbEvSZDOltG3QPtFrMZDE3?=
 =?iso-8859-1?Q?ZlqJUrMwG/ZOnoImnKHm6u+fy66jO1V/mNpe9Zf+oEyGIahibdLJx+GX6V?=
 =?iso-8859-1?Q?d/JAxMQKAsjYmPd40HNCUeCu9lJp3gl0qkuxmfPWsEXxmfsnf3UKMDZKpd?=
 =?iso-8859-1?Q?Z9ZTGqynW7HAgugS1t0aYTuA+BKxssEf9CGFZlnMWdOfxRvqPrXU0kZ/jV?=
 =?iso-8859-1?Q?winbbKVWcHYHEEkALCgnmFcICCAsUC0fq+vR7B85vzktMuygPWUJsfTUL8?=
 =?iso-8859-1?Q?CdEQ3cDJgw+dGuHwvRVvsP17IeEGilIaMY/I/VyjNjLwtlYGxmzwaqREea?=
 =?iso-8859-1?Q?i66aJuKjcc6uq85cDt4+24obE8F9p2CSA+UzNVS/krzf/beAdsf/a0A0XF?=
 =?iso-8859-1?Q?x9Sw6fBap2WpRF6rbdodf9zjZQauVeqp/g/LbHcCM4zsbmn2BVdjWG+LzB?=
 =?iso-8859-1?Q?skfKKJ96lRg9HvIeu5A+6YxzLtrwZu3HiryHfA8BEKax+hpKg1xovsQxVb?=
 =?iso-8859-1?Q?yKc2Y6aG3CPf+j8lNEfRhaxRIFEEL1X1kLK8CYv2DVr3IM7FwaETK7klVb?=
 =?iso-8859-1?Q?VTWTxn7IB6y9k7D+l3ySuPf28uWbL020KQIu72/xD0HQxZ5dQoFlVALKkN?=
 =?iso-8859-1?Q?6CBbsGWNGKY8TGVs7P2/tDLllDIAWwXa0w7nWcvlr1NgBlg+jhoeopUBWQ?=
 =?iso-8859-1?Q?Uy6GipWZ6Sy2zA6hHBnS4kbTG0Y3snC2UFIO2R2Z/vTDBddKwGV+OCv9dV?=
 =?iso-8859-1?Q?CY+EH5njOH6/kLqa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YoyZVzKJhfSLLbU3Csa/vW0C9wwvP+ruJzvBmJW4TdqJ9Lulirt5vFRN4u?=
 =?iso-8859-1?Q?TJmVzNvybmLLiHsEvewXTm/NFKyURmjsHa+LDBghr9vCe0Zu+bbXG9Nb/L?=
 =?iso-8859-1?Q?90QjHbjXcIw1N1AjBbqKZoFh1aafDphXSv76UAmR9R+57QBsk8iSBap9hI?=
 =?iso-8859-1?Q?pSZ11eDF7ZkZ7yXgh/d6C8weC6ySannBo+hfssLXoBehCls6iO7ra44SpS?=
 =?iso-8859-1?Q?FtCzdct3Xf9SNOEoaEz8lVy1rcxzPssW3YyKbWZOpyhtJkWsjtK0Jd7gY9?=
 =?iso-8859-1?Q?ecqtg2fn+NTDKuJlAwYdnfF0qkEBYBucjVpTxxixlmeUiAsDS9rfoRn5kw?=
 =?iso-8859-1?Q?aSouxQcGo45t5nidGdvkZg2I28ioKpQp5FbbfeoWftMfqJdVQ0zHILG1TD?=
 =?iso-8859-1?Q?tf5D6A0scAcMkSA7PXcnj00glcMmh5n5lpYqd/Rv5AhrSvUGA4MxPyCb2/?=
 =?iso-8859-1?Q?rv0yoAK4/eme4NpYsY8jHt5JiNxaanjScRrStaX3vpfud/YuZY8Ix2gugj?=
 =?iso-8859-1?Q?xRDDVtLHwnqoDWl7ZKT4SV/Mx1HuTGNe9bxEYW0NsBFpYI09SMDCHB6ZcF?=
 =?iso-8859-1?Q?IZ3NToP1Kncn9Y2NEB1HjOwhSBMSOXaW8oj9qUIoX3iP2HG4Th/bUDJGcc?=
 =?iso-8859-1?Q?UwHdCsGCbB7Bqai51jdGmKzDEHJLTAzL71fK09kqBt9+y4KLqSsKyLPFN2?=
 =?iso-8859-1?Q?IQu2PV2cSpdVu5B30+ZClLe4nZqVjrCXcOLUnUqqKMEgY6fq/GHMiaZJHk?=
 =?iso-8859-1?Q?TQu5HFDb79UWjRLY45Hdqkwy+S5Uo6egnImnvXn+jmKQNCo+fF0DQS7jp3?=
 =?iso-8859-1?Q?+6iX3lUmRki/wzgmvYp9HgtU2+3t0ikljxLxw7o3PTghXHcvN8j9WK+obc?=
 =?iso-8859-1?Q?J5AVf7ElM/kEgbbYwUsaNy1zsmGF+J3pOveXaplRTEg+6OstP0CCpU6vzK?=
 =?iso-8859-1?Q?r/E58rc42PIp1BjAAY40Z83tD6N3N8NG5r3kczxucNLX3QqHcpGDI6xdgZ?=
 =?iso-8859-1?Q?51azSBQwYskyhu9G+3l6xYp0swm21Evq3wr6acqqXdym8lf6FT4nIvcmSw?=
 =?iso-8859-1?Q?Kou7M8I9TLUpjr0rcVXft4LoFM9ztRvH15UGJcnl/KjoOTtL45EyvbryI6?=
 =?iso-8859-1?Q?fm8uWBnDFMhhn8HMTC931E7xU9kImD+piECLQ+HE0W3GYFqG9dDfH1RMKq?=
 =?iso-8859-1?Q?m+ogHneiX+dVuTj4KsUZ7itD44p/VnTkKnhkGiBYbDDZP57CDrHl62Y+b1?=
 =?iso-8859-1?Q?kFeD6fKIxljQGX0xCq53o0g3OWzCJLdfrW8qzETliZEYyYjsvCGBoIFnPj?=
 =?iso-8859-1?Q?WYmt8ACWF4DkTdCbj4W5v0lasiVsR5AWyknv8YGt3VJpZAh5HiYVqRXXb3?=
 =?iso-8859-1?Q?Jejv3rO1L2+WkpJTl2FtD3M81+o3RDutQ0mal7KFPeWAiAe6Iyc8dzkKpR?=
 =?iso-8859-1?Q?zgErZ+x7byoVZ5C0tUHp7Njv+77a77Dy8BBiFLHaEqsB9P+2iXZz/oAxTk?=
 =?iso-8859-1?Q?Xb/TweYDH3/Uhr8TFo0zXBuh9wrxWde3Bk0ZUUL6obGX99lHuXtiXU8aGs?=
 =?iso-8859-1?Q?t4KE3ATue7k2ZpnsgLvBQsXcfEbgGbDUuz9eQDZaCTERCRisEVEeMSB03W?=
 =?iso-8859-1?Q?9wVWj62QQruq9YnNoWjb9nZMyz+TktZkv8Ai4duq3pwhjVdlGqY7uBDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 143fcd2a-fb47-4925-117a-08dd1f8929a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 17:26:52.8317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98sXAgjPU5E0+UT7mSYLji7IxIBQNeEiF5h4cGs2EDbICzRumZEYX1tc08xZURpqpYMLcLwaowj2CFNwZ+ebWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6304
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

On Wed, Dec 18, 2024 at 08:38:49AM -0700, Souza, Jose wrote:
> On Tue, 2024-12-17 at 15:39 -0800, Matthew Brost wrote:
> > On Tue, Dec 17, 2024 at 08:07:32AM -0800, José Roberto de Souza wrote:
> > > With Force write completion unset there is no guarantees of when the
> > > write will be globally visible what is not the behavior wanted.
> > > 
> > 
> > Do we want this backported? If so, maybe add a fixes?
> 
> Not sure, I don't have an actual issue that is fixed by this but I think would be good to have it backported.
> But what do you suggest? Add a fixes tag to the patch removing force probe from LNL?
> 

Yea fixing LNL force probe removal sounds reasonable to me.

Matt

> > 
> > Matt
> > 
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 13 +++++++------
> > >  drivers/gpu/drm/xe/xe_migrate.c                  | 11 ++++++++---
> > >  drivers/gpu/drm/xe/xe_oa.c                       |  4 +++-
> > >  drivers/gpu/drm/xe/xe_ring_ops.c                 |  6 ++++--
> > >  4 files changed, 22 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > index 10ec2920d31b3..f4ee910f09432 100644
> > > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > > @@ -33,12 +33,13 @@
> > >  #define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
> > >  #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
> > >  
> > > -#define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
> > > -#define   MI_SDI_GGTT			REG_BIT(22)
> > > -#define   MI_SDI_LEN_DW			GENMASK(9, 0)
> > > -#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> > > -#define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
> > > -					 REG_BIT(21))
> > > +#define MI_STORE_DATA_IMM			__MI_INSTR(0x20)
> > > +#define   MI_SDI_GGTT				REG_BIT(22)
> > > +#define   MI_FORCE_WRITE_COMPLETION_CHECK	REG_BIT(10)
> > > +#define   MI_SDI_LEN_DW				GENMASK(9, 0)
> > > +#define   MI_SDI_NUM_DW(x)			REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> > > +#define   MI_SDI_NUM_QW(x)			(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
> > > +						 REG_BIT(21))
> > >  
> > >  #define MI_LOAD_REGISTER_IMM		__MI_INSTR(0x22)
> > >  #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 1b97d90aaddaf..8b32fad678782 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -581,7 +581,9 @@ static void emit_pte(struct xe_migrate *m,
> > >  	while (ptes) {
> > >  		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> > >  
> > > -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> > > +		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > > +				    MI_FORCE_WRITE_COMPLETION_CHECK |
> > > +				    MI_SDI_NUM_QW(chunk);
> > >  		bb->cs[bb->len++] = ofs;
> > >  		bb->cs[bb->len++] = 0;
> > >  
> > > @@ -1223,7 +1225,9 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > >  		if (!(bb->len & 1))
> > >  			bb->cs[bb->len++] = MI_NOOP;
> > >  
> > > -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> > > +		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > > +				    MI_FORCE_WRITE_COMPLETION_CHECK |
> > > +				    MI_SDI_NUM_QW(chunk);
> > >  		bb->cs[bb->len++] = lower_32_bits(addr);
> > >  		bb->cs[bb->len++] = upper_32_bits(addr);
> > >  		if (pt_op->bind)
> > > @@ -1388,7 +1392,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
> > >  			u32 idx = 0;
> > >  
> > >  			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> > > -				MI_SDI_NUM_QW(chunk);
> > > +					    MI_FORCE_WRITE_COMPLETION_CHECK |
> > > +					    MI_SDI_NUM_QW(chunk);
> > >  			bb->cs[bb->len++] = ofs;
> > >  			bb->cs[bb->len++] = 0; /* upper_32_bits */
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > index 56bf375a9d4bc..ae94490b0eac8 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > @@ -690,7 +690,9 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
> > >  	u32 offset = xe_bo_ggtt_addr(lrc->bo);
> > >  
> > >  	do {
> > > -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> > > +		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
> > > +				    MI_FORCE_WRITE_COMPLETION_CHECK |
> > > +				    MI_SDI_NUM_DW(1);
> > >  		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
> > >  		bb->cs[bb->len++] = 0;
> > >  		bb->cs[bb->len++] = flex->value;
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index 0be4f489d3e12..3a75a08b6be92 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -72,7 +72,8 @@ static int emit_user_interrupt(u32 *dw, int i)
> > >  
> > >  static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
> > >  {
> > > -	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> > > +	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
> > > +		  MI_FORCE_WRITE_COMPLETION_CHECK | MI_SDI_NUM_DW(1);
> > >  	dw[i++] = addr;
> > >  	dw[i++] = 0;
> > >  	dw[i++] = value;
> > > @@ -162,7 +163,8 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
> > >  static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> > >  				       u32 *dw, int i)
> > >  {
> > > -	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
> > > +	dw[i++] = MI_STORE_DATA_IMM | MI_FORCE_WRITE_COMPLETION_CHECK |
> > > +		  MI_SDI_NUM_QW(1);
> > >  	dw[i++] = lower_32_bits(addr);
> > >  	dw[i++] = upper_32_bits(addr);
> > >  	dw[i++] = lower_32_bits(value);
> > > -- 
> > > 2.47.1
> > > 
> 
