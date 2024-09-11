Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19D1EE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7409710EA8F;
	Wed, 11 Sep 2024 20:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiMS1QT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D510EA8F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726085833; x=1757621833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KvjlG9/AWtyblZPYpAjfpydVOYsA6sfFCYn8qqD3q8s=;
 b=BiMS1QT/J+m1/FVDcHvFSINE9bjl38WadjxxnpRXz7cJlONohyzgi3Hh
 AvapaVt2pJ40LKU9uuWae2MjWUJ6g9jIgQK8cVEF5QykaDCaTDGUEMrH1
 kgm5q5dnjBwX7SWHHkaqzH3NzwDK9VQUG3TOYxSswjTWi689gnpk1sRVT
 rO3AC8+tB+UU8dQYF+JXjaMDgZv0Ai/pnz711231XD97qpnfMB6fU0bYr
 e0qf9/X2u5hpZyU0SGOAfQ1yuLkYiRVXyjRrQEGLdv28WY0ggRq9hvdRe
 uFqqIEVpEwh0WaMXZxApzYkNcIVRQ3COFE8FnMJ/8md175a14xCYukk9g w==;
X-CSE-ConnectionGUID: sJubXo7+R9+27Ozs5CQ08A==
X-CSE-MsgGUID: yvJ7Wzl+TOGBWrIatIIHUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24449863"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="24449863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:17:12 -0700
X-CSE-ConnectionGUID: CNUs+EerQIGvZ7o5bGCTfQ==
X-CSE-MsgGUID: 3WF3xNGPQaq6kvPJFq+xtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67784665"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:17:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:17:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:17:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:17:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKpFHlTz6CayLaJ6L8U95e/s1dazWIgJiJk+lHf0RaoVny9aoUGvVVvsEIoIRPUOkI/tAcQnSTABueEY0AO/sGPyup7xSLiyu/zeJUtq/BtkS6VlV6Mo0ZZjYR7lAgz2ZxESEPBmHBmAJ9HjmXWsK3lwJmSppbYfFXEdwhAjQqoW8tN2Q52RhIiB/aYEkz0txphE2vTydjE8iiwhs2lNGL3jnZcTBG2xoGnHOnFSipGleETPyMgTmCGbDo/Au4xp1n4Jns/sJMlErgaG+TjESttLidXm/HL59rvyLWpGY8nLMe2E712ZhPeg1P9aWD+Yp88NyYTMi01CglxFIyjgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYhfY8DwYCARs4JWYiGQTNWh/HPn+ymobEyHLOR4Cqg=;
 b=Yg0bHSAlT+WLmQh31/05D0T6pe/tb5Rm3IfYllm4Rfk/sG2WgUFtqRSLco8/6caQUukcUkJDdQaURowt2h67OZl44xLnPs+2X+7u1WK5HxKOHbRaBr6gbGySUEsacUbWClJ/3RPp/x4wrxHTwuIKQYRymPqzFZE+4eXrfO1Y8ZtCUg/4KFidZZPtUbeOap43lKvvUn9Vjejo19JNPSLAwGdyzh5t5hM9DgJ9Gl9E3fAAy/UmRuqS4jCaN6RDubYarg60q5HPD1s6vgrwLCys7dcI7ywgFSfGCS3sY8OPAF5y8cIHlx9OjEo41zo3GC6ZzTgM9Q7xxG5pyMINArKtEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.33; Wed, 11 Sep
 2024 20:17:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 20:17:09 +0000
Date: Wed, 11 Sep 2024 13:17:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 5/9] drm/xe/xe3: Extend wa_15015404425 for xe3
Message-ID: <20240911201706.GM5091@mdroper-desk1.amr.corp.intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-6-matthew.s.atwood@intel.com>
 <20240906235239.GZ5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906235239.GZ5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa5abb4-fbed-4529-c03b-08dcd29eb6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k1S3pCxvZlfay8wjE4JrfPnOD56TU/rUdsFc/+b9JsWtNl9OSDm4nErW/OX6?=
 =?us-ascii?Q?SQODVyDNVPLvKzGablUfz6Ku2ptk6jotZSYv0xbc2PVk6+Aa7fhCYJj9A58A?=
 =?us-ascii?Q?TYR/PpkVsFNKl53tDdSP0YsJbiVXJY6WfN9+27Pmd0XmIPD+5oqS4Egip0Xh?=
 =?us-ascii?Q?DztbfL/WSVJEKQdIEv6yLRjjNrnOaGUZJT4A3EURMBDf1HNZQNXRNRkw8+dt?=
 =?us-ascii?Q?s0WlPAtrCqpsxE1q2OsdcNYcPZx6AF57otmJ0d3M2Wp2jOf1RHbkk13Lh6GF?=
 =?us-ascii?Q?hulcZ/Jh4WOPvgJ6WgaP80j7Nue1LhOUgmHuxnpeyAmhEhzpq8bH+vbovckW?=
 =?us-ascii?Q?vz82Wl3+2EPGqru0vOGpthieREBuVCp70dUmRfUU6gbYcj2ig4TV8lPlzbG4?=
 =?us-ascii?Q?j0K3xmc10Y1aM+9c6XIluHHQoAmmJxvSo4hNM4HdlKNrzTPaB2nMkOwksWsD?=
 =?us-ascii?Q?SnGwxswN3v9YSU6Pe3NbOp+HUnyd00gsqoX48JxfE3ZfHtFmS2HieaBqaQED?=
 =?us-ascii?Q?2zwx3Lzf0CyPEBsCmsmcVoOAkP7WFogqCLPbcRt5YM5viCABq7JFeHvzjWpl?=
 =?us-ascii?Q?2g0mmJEkdZ54LgJQRRMSLMUJqCVFAWHe4H3SeuqM/3Ib5Y0qzDTxQbv2CG9G?=
 =?us-ascii?Q?lMsAsty/v8XFfLf6RYLjDcZF8jV8H36x054Z7y9pQxWNO+/wq4MRBGpnNNKt?=
 =?us-ascii?Q?wNKb0mfbrCyBcWkObneUsZhNlsFOHWV3e4LCNfQvm6MZ/s09gN4M4SL4o15X?=
 =?us-ascii?Q?Yjf64Z5Hq0/lKfmja4ocpF8Paq62iGE8mrxevqA9r46W9KB48+kuWES92hu1?=
 =?us-ascii?Q?7adrPzC+u7YM6Ze0tp8tAtoYe7Yhrci9tS3yTxgeNA54hjuswOnZtTrq0HCM?=
 =?us-ascii?Q?3IxQ0Od3bchsy8ZqYZX6HuxqNzQvJmj2aDY6eGoPm6iEVGNga4QDF8Y6G4dk?=
 =?us-ascii?Q?tlyllkScgerMDcjVNZ0BvP5f/dMVVZzWAsnh0lCuI0o077XBe9ovaW7mgX+1?=
 =?us-ascii?Q?ADN8K5P7VZf+KvO5RljNNDaWZ7lINxz7hWff5E/JXwSEWeAEFyRVbwdW243p?=
 =?us-ascii?Q?argbdPliwBepEj9+Oa+Ya4EsAyYpObGHUq6CuyjbxAnSPVpAr41WhLka8Sbt?=
 =?us-ascii?Q?Dy5IKHCNAH8a+nxC90LuuP+EtgfC9dS59n33RTHg3z+PdXIJ9m9lDAjX0w06?=
 =?us-ascii?Q?PzqhjX8d4XNbyoyAMAwkhU930XJO64ySCs0EH5MjEQnghQZ9Hd5vo5+jumPt?=
 =?us-ascii?Q?SkLAhcMZI2v1v1NORshqYwn91P0NShmNWjmq6uzbZiSDqNfor9+XVIAdDFCJ?=
 =?us-ascii?Q?VYoMeSG1UfnKyMO8UXGxgX5j1ZVrmd6ghvhtONgK/9+58w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ut9GwrDCy+DMeFUfVJCwLMcxOkZ5q2wL/1tP5Swv8CovRc4Dyl5i7ugCA9TL?=
 =?us-ascii?Q?Woj9dU6OzmIbbTDZZJa6bixlLSAHovewOigzj7Xu6wGeYvjEJWSedazeqB0x?=
 =?us-ascii?Q?5Ukag5fX4ghQbokTJJdV/y0cAZatqXVZsoO5BPGMeVqqNA9zMt0mfbBQKe5u?=
 =?us-ascii?Q?WC2KQ6Hpt6Qd6Ee0svCN628yCWKrLKDWEGGTwqa/5Foj8KwI4cGvMNFe5UGM?=
 =?us-ascii?Q?w1sAq8DMMHUHxzSiBI/HKeyceRWGyWwh22SYimpOTh0IuN8qQ8oLpDR6EtWH?=
 =?us-ascii?Q?6Xa2/+fZWfRAo4XRudNET7CYclsHAWmTolMVnnp7TK+vZVrFqYdYrjdPCSZI?=
 =?us-ascii?Q?J9yOLQ7Cl1Z7g0SO132rB0pvEiPibRWACPs8YXotMlG+2vR1TenEKrPbrMRw?=
 =?us-ascii?Q?FaezA2nRxCkV2vuM3Ad84MD8udPmoOtk5UnP/+KpRk2v5ESXKnMDEIDhlM52?=
 =?us-ascii?Q?V/F4gYT46dPH/MtbXHgqzSWVq052t8GkY8PoQ2ah79OpSBgXjt2EESTJeSBt?=
 =?us-ascii?Q?nRMJDns4MqOs4GbRsP0GnLjFrIbE7L2BCB60FTd90/AsMpv1FEfX83EvWg6k?=
 =?us-ascii?Q?eu/vwRQ/sBnwGfKph/KwhgrY8iK2n14tq7/uco71N0qyf0IA4PqoHyunBkNb?=
 =?us-ascii?Q?jvYrr0IvE+m9oFADm4kW98chlePpb95hJOfV36o0QwTiaiKNbEU6DQ0NWpPU?=
 =?us-ascii?Q?zOB1ClqHMIYOmxFGtM7i5qfomoAVy1bEVH1ignU0xWDqf2wt+fk4eUVqAjLf?=
 =?us-ascii?Q?mTdA+3uoeICPMF4d+SfPEA3lfldVkHN2Uyn0eCgFVd5UTPGH5bwjZOrDa/oZ?=
 =?us-ascii?Q?XdL84v109h/jDZKpVWMJ+aQJMz3K2T8oGAyO170ukCCXE5nEdS62bXvkUOog?=
 =?us-ascii?Q?duA18ouNekY9qAnXhW3CkhiBc47RT/doyw80dlmDlByh72af9yOgwB2LsB2o?=
 =?us-ascii?Q?MnLnRqNRUJssMnBwUtOLyCxkH53cLzCObKuUmHpnGZ25bY7ZGAs78lSj3TRU?=
 =?us-ascii?Q?FcIH8d0QeTeSlXZ5Zcxeimk2GfQqlGssIXyT4ENFS/KDQBaY27mfa5UPVFdp?=
 =?us-ascii?Q?ii2boNqxkN3qxdsxPY414017gB9f+llq/SNUo78Ph5AiQ8g1ewh3CHysRgiw?=
 =?us-ascii?Q?cJ8KLpKj5D3/4RXKZUx8BsNELPHb0SSrWZyPEIgaz0N7YVeA3Yq+P0pZbmlz?=
 =?us-ascii?Q?XN6DQKYKrokJLgzz5oD4aaBQf4SOY0Uz7zYxMAv2Sj4DECad6EYCRbBg7Urq?=
 =?us-ascii?Q?rSct10qMeggAiNIwBEJenZgOZL27Uch5NQy94GbGEXmuoiL1f0+MTqribnme?=
 =?us-ascii?Q?IQcs4cjOvbZAsGNQzJHlJpWzK5oAXi8PnseMovp481t5LmoUGHcSmStNBTK9?=
 =?us-ascii?Q?izzssjC+NsPq4dDplI8Ld+ak7rbi7Is/0HwejHvYulUlrrb+qJYPQot2w4/u?=
 =?us-ascii?Q?LBXpu6HqxracSxbOYBH45mypI4DekUeMbMxWPzA7bQtWWi8fZXecmcHf+k3Q?=
 =?us-ascii?Q?2MhOn/u9UbhSIWTlJ7I89tIRHuFqx0BeRbFpMgzGGSuotwJq/Z+t8H7BtJzb?=
 =?us-ascii?Q?speJjvRpIJYpd3QEH5meisr6FUZ6LiY40m6uAPxKosUnmZOPesbbjit9s59f?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa5abb4-fbed-4529-c03b-08dcd29eb6c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:17:09.4290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1pWlwIfEJS7RanX/HN8pE/2iZ5f5zkkjpntwUKLQIoRmhWmiJa4N2uxFA588oU0RBLzrxgTMHrWKsUvz2uBAVhjUBzggGbyR6P178nVNG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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

On Fri, Sep 06, 2024 at 04:52:39PM -0700, Matt Roper wrote:
> On Fri, Sep 06, 2024 at 02:51:49PM -0700, Matt Atwood wrote:
> > From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > 
> > wa_15015404425 applies to xe3 A0 step as well.
> 
> The workaround database can be a bit confusing for this one because the
> workaround is technically a platform / SoC workaround rather than a
> graphics workaround so it doesn't show up in the normal manner in the
> regular database we look at.  But that means this is "PTL A0" (the
> platform) not "Xe3 A0" (the GPU).   And that also means...
> 
> > 
> > V2:
> >   - make condition check simple(guludo)
> > 
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 3fd462fda625..4c3f07d89622 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -184,12 +184,12 @@ static void mmio_flush_pending_writes(struct xe_gt *gt)
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	int i;
> >  
> > -	if (tile->xe->info.platform != XE_LUNARLAKE)
> > -		return;
> > -
> > -	/* 4 dummy writes */
> > -	for (i = 0; i < 4; i++)
> > -		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
> > +	if (tile->xe->info.platform == XE_LUNARLAKE ||
> > +	    (tile->xe->info.platform == XE_PANTHERLAKE &&
> > +	     tile->xe->info.step.graphics == STEP_A0))
> 
> ...that the graphics stepping isn't really what we should be checking
> here either.  While it's likely true that A0 graphics are paired with A0
> SoC, we can't say for certain that, for example, A1 graphics won't also
> be paired with A0 SoC or that A0 graphics won't be paired with A1 SoC,
> etc.
> 
> To handle this properly, this is one of the cases where we really should
> be looking at the PCI revid to infer an SoC stepping rather than the
> GMD_ID's graphics stepping.

I also just noticed that this commit is broken since XE_PANTHERLAKE
isn't defined yet.


Matt

> 
> 
> Matt
> 
> > +		/* 4 dummy writes */
> > +		for (i = 0; i < 4; i++)
> > +			writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
> >  }
> >  
> >  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > -- 
> > 2.44.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
