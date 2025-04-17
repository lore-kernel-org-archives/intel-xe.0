Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6344EC369CB
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE84A10E3C6;
	Thu, 17 Apr 2025 20:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHcYtTz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C4710E3C7
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744922885; x=1776458885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RbTt+mI+j4qG1kBPYSAwz6qSrN0bGe6wE8TooW2DL0c=;
 b=hHcYtTz480MNKKP9OJdiFuxuXFNZ7gyYtxtlnvXUbDWMKOP0EA/I8Npg
 HBTqV1nZW3N1bK95cPka/dmbj4GPC6yUDTAXwuARmJhSOrztgr9Hv+kcx
 YPgHhZtjung+JXC+3hVBp3jwRItzkMzWR8RItqarwpRHmZh8l7XxKQSXa
 LV0V42PpBg8askKuPikE3Tekd+aPVTE5nP4NY+/5lc/QNoa19oq6q2LbZ
 vn2QQ42kJMegbsCLM5ROAt2xx1GqaRIxTixe4mcOvaDakNzU2HmA3p8s/
 B2eThrm2pFrkUHabxLYRWChKsYRxJtw4mlkpggOSEELoihqv0N3sC8KMe g==;
X-CSE-ConnectionGUID: kxixA2e2RamRjfJpc6RC6w==
X-CSE-MsgGUID: aYscaBLETCmAMaofSVm71w==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50346752"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="50346752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:48:03 -0700
X-CSE-ConnectionGUID: s1Aipb+ORo2ktdIpeoIU9w==
X-CSE-MsgGUID: gfNns9cITbutau8VhIYQbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="130915467"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:48:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 13:48:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 13:48:02 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 13:48:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAd9hG4BLh6E8Ht60kOv9qegiNlyFjK/DeR22WPV5rm0Ati9zQk8Y3smNQbG/OR/2XLRr2dvML5dqeVtG1Q4xe8Ydvwgf3PqPhC/ZUa5+iTbdLcr6+h9e45+XhzT7RLdUVc1Evz61UhXh4irz45Y+QblIW5spSTlje3QmlWsQwTDqbpRUG3FN6tP41wx1TuJZh7Gq8z+Ydnrd8YvuOt2aUcVysbn9yk4S/stogg/2IMiv3zVq+q4dc1Mymm8MCYtjnCDn8xl8e6f4eGRyDTVxGsowckRcrElP/xQ6H6DXxQPCfw3mV7iUsmkZ38cJEmW7C7+SkzTBjqe2lYnNFvKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fevflyDsJlUkHyLvitaI6OT9qBzlor7SyxcGDTU2ds=;
 b=cpaYbd0Wn0SS9ePiytEN2WgHf3ni2YvqbvCpQiKJj4wEYMzEQsLapmoQ4XOsQDzjxWY9T1+KL/O6QuOOWvwo1clzuU1P9xNXNHUBWirqVbYLs7AiaKYJdLinHhBbXBE2nJzGqOuoV/8eJjIN02cDouSOChG/UXAfETG/gOnJ0zSdq5wB4jZDCDmOx5xs+474qz4Zd0t0MBHZ5oRgPekghT1zB39GALRi+dObmFWvE1NLOR1yVdvkWuhdBlce9nndUAU5SSZxHyRRcqkIIttxH+DmQrhqj/uCOfW+UhlMJMaL5gjTO0pWkWZNwJ2iNtrEqE4gr4UvdasBl0as4hdTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 20:47:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 20:47:43 +0000
Date: Thu, 17 Apr 2025 13:47:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/guc: Use the steering flag when printing
 registers
Message-ID: <20250417204741.GF6239@mdroper-desk1.amr.corp.intel.com>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
 <20250417195215.3002210-3-John.C.Harrison@Intel.com>
 <20250417201752.GD6239@mdroper-desk1.amr.corp.intel.com>
 <c6da8d02-a770-4730-a8d7-48562d1f40fd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c6da8d02-a770-4730-a8d7-48562d1f40fd@intel.com>
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: b72427a4-3a74-4fde-14cb-08dd7df119ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aa/WP8DyRVMqdsijyB/1d+iZU/dZE9T/CQmvPvHYtwLY3Aj1Wq30K6DYhQ5N?=
 =?us-ascii?Q?kYTs2tbZcOyf5LjbtiAH2ybO5mD9CE0mUGUPacfbjjG8zVhgMnNs5zhp+7RK?=
 =?us-ascii?Q?x8vP/RCfJR/P/SfEtL69zPiG1a2f21y9LShHLMpTbGZal/DO7rNE+VDCgHsl?=
 =?us-ascii?Q?AlEQSZQo20VwPjusZ+52yQLZ5SMzVy1Yy6R5aUD7SNmVSYUQqZEuTgu5UHLs?=
 =?us-ascii?Q?clyIvLnqmwNOfl8cqX/NrKoa0cGRJb7eQh76ewjO3IZguW+J2KeWnXqx18Le?=
 =?us-ascii?Q?1dNDPttK2epiFzYGQJd0js/BqolNa3VF8Px3yGTDjQWjuohWoC0kEl/uyR47?=
 =?us-ascii?Q?zBtYiVtAgiDk7CKj0oKqMQeIYkvQ4G5E6+NeyJMhAHHPO2mDCV3EH/Yd2tfe?=
 =?us-ascii?Q?zOBlSA/kLyk66HEvH8TTdESdhwH2UDr0PLuRsSjCUmMhXlZI9efzz1ZQsMYP?=
 =?us-ascii?Q?ayegD6Bqsarfav/d3Mf/wAfPKj1+YU4+v5eeZrDdroEJzy94YKgPBw6QcuUi?=
 =?us-ascii?Q?6gUJf6C+T9SYd/jf9TK+WL/khO8bCSB2v96iQCIFji1YX9ZT4OtXHMJuxh60?=
 =?us-ascii?Q?8fzvMFzGdWipNl8QaWT0dr0biwovm9rBpbBe2y7oQElOHJehAwtK7BCuHoX7?=
 =?us-ascii?Q?BMHsmhAX3akbxzXnkXPPqixE1+gfiCeQOZQA7NtbPjVmrR/PemVK7tLEKa3E?=
 =?us-ascii?Q?GAO2bH4VlQw00ftesgLFgecDEUEkqYLfW851+HitH8qZuB8hecA0EP/jscaU?=
 =?us-ascii?Q?A2szP/Ty8xB+udR1aya/mqvjkw4oExYOI41I8K+7OXzLzkMfAq99YT/ZCqkj?=
 =?us-ascii?Q?s2KnD5hycFw83S42az4tdvDvI0nywgyEYgZ8Ed5sz9JEWxeqiEjwSP9hBfhD?=
 =?us-ascii?Q?84ALYWEU07m4g3lpX0DQd6GH2Qrl20BeCkAaAqu4voifxMl2BXYoZJGChVeE?=
 =?us-ascii?Q?dnLin+ek0dhl7P6+yehvrd9qOO8KUYCqmiOYaAl7zfXVWZNj1HWwTEF9icEM?=
 =?us-ascii?Q?PtAOyazJF6Kn1SCe/HSgc10HNbAEZKtWt1spcmBLB+4Z+fzMS3rsCb37l0bH?=
 =?us-ascii?Q?YjMRM3xCqv1PMJ5aDeCuMPskQMGPdPgwELX0EBe96opWs2dhwinQjKkuPMud?=
 =?us-ascii?Q?nGIueeWBcH4vBX1QKzXLa/N0e7Nwhfvi4sdjiBqjt7bVtamZDJpUJxfxtTks?=
 =?us-ascii?Q?5sDVt/aBpVHTsHBG2TpNaI1hxHkh/JhFe6bPb8uSwPPymDNsTKwnBGdxJlkb?=
 =?us-ascii?Q?dCREBqB+aNM27euV/dcZwOM0I9hoXRorV/VOh6WKF48WnpTN/QNmuZPoDf0j?=
 =?us-ascii?Q?Ysf734jSk38VLq94GEUDT8xfhSi9f2b4tTdOWyu24MqgOvZP16as/ZFNo8QT?=
 =?us-ascii?Q?JFHJcpJ08TzJMIXnEEJV6qqWfIdaoR5QyacSY3HPCVtta60L4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VdQXK9Uo2VhZNIHbkwkOneKMqSDYYEuYGiBSDev7a3TKqemQKBLxq9EopCeA?=
 =?us-ascii?Q?6QfK5AUo5lNVXD+jGaP2aJx6pCHfFoxcbnDTccGe91r52JRobAH7m41hfPhM?=
 =?us-ascii?Q?kYEjSeYhDPqDZfrCuKEBqBjHlaQQkalBzHfpfrmtlF8/WWhtmNVRbSpMpYTl?=
 =?us-ascii?Q?oRcsJnTpGbu1Xd+piYsUCWj09WM78vexPgyIDeto4oFhSOxKge6VgFk2XbsY?=
 =?us-ascii?Q?Ni5yDvdBwd2EVvBVQks7UKNmu1LIbg68VqaGxPfh1/CIw3i8htNH2cOz5IgA?=
 =?us-ascii?Q?zhpc9dJ3ikE20whL1zf3nvmB/tDDWnuauxCoQccDRFz36S8nZj1vqnUrPgR7?=
 =?us-ascii?Q?D4iUgPAkEr61GXeMsPzJ2/0ex8n1pJoeNuZTE9g7UsYmvoYJFn3ygyKK3+lp?=
 =?us-ascii?Q?u5pS7N97HvoBB0WCBl214ECNcvUdEsuM04xDEdaLO6hA/pytVTFRPTGhAx0Q?=
 =?us-ascii?Q?8LS2EwI0bhkFPIDjhO/TT8L5LoeGlj5vnR79Zi5NA4h5F9PPJ4LOBd6Yux7L?=
 =?us-ascii?Q?hKpm+QcOSFhLnLhI6G35TMXIX7JztWYiCdTIiwb5jIkG/Y2MZI/PNsjNQI5f?=
 =?us-ascii?Q?UHHEUa70m/ObtEwImyXnNI/7zsfBFuZsskL0I+agpPCtjn+S25QQTB8QtCYt?=
 =?us-ascii?Q?7cjeOmYno6xBbDNd7iNHugLsylq/KyiXXb9L5ue1gmwccy187mSa0Wwxu7WY?=
 =?us-ascii?Q?EEMbfm1XG/46C9CnvgVOXk7WGj3UhmBEADp8KpcOEZcrLK8xiCSsBzswMTK2?=
 =?us-ascii?Q?kRSaZgZKwdqw0aN/qUwkFVPby7P9ta5lthsXT15vPYm50r8XkhDr7ToUoKe8?=
 =?us-ascii?Q?AEU076Ct8C1pP1cmIHr+/3vHmFw0QDsIBGVyDdTjV+1Tg0IjerWchUEAIVtT?=
 =?us-ascii?Q?BCzryePnMqreuwVrSewy7Lw5dZqzZh3Dtvt5M2Ka+QbOfZcbo0RT82nfWfX9?=
 =?us-ascii?Q?cm+qqhqFkKGWso/kdcDw3vTke6T1NBIEtnvMK7PjBtxOL+Ai+umVnivSU6Qu?=
 =?us-ascii?Q?3jogQiWjYStOuuuc+t2j48/qKXwAXlbq2CpRa7ZBke3FRclbDSpfmfn3gFp/?=
 =?us-ascii?Q?Or2QXWhcV7uvpnAx5IVw1zMnL8O2QhuhkiCQTHsW9RP6nEc0qUaMeqV7JOKx?=
 =?us-ascii?Q?ov8UJcVacvdAYc4szonpqP5KhugRuAJ3nNDa7CfLOC1yJ+qgx1UVBxuv/+xT?=
 =?us-ascii?Q?xVDre7zewwbENrey7FiurG/QGl/1LtaXrWBpBM9Sjf7XQ7CQ4e+5leIg3nZ7?=
 =?us-ascii?Q?+uCWs3RiTiEEfj5iz44pwe5GNscjMgKjuZVN2hXOIZ1qEQLBcG/Mp+3gT0w1?=
 =?us-ascii?Q?WwmgUJ7IBm9dLBihXxVvvyYMkZc3fAANtXNGFreoc5yFXIYSocFdtfCjk0Uv?=
 =?us-ascii?Q?OyQBXHnl4O1TW4cC0Y1zgdUWQ4QJhlZX1GRtqBsXQZhM+ZcNZT6n+08XZUj0?=
 =?us-ascii?Q?Yl3pChVSFGRVTrm6845wji4ES134MetAgPt4CMl07StWxXszY2ylSxXLhNPE?=
 =?us-ascii?Q?KiJVSwNR3q/OT60m5tLU7uymTsZ/t4b79t9ArLgXCZyc5Jmng99EIt3geFPT?=
 =?us-ascii?Q?YrX1bfBco9ZNHxElfkZYUEGiWCLWkGJnIrNs2ACIuXmkyXqEz8XgVhoFxSPr?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b72427a4-3a74-4fde-14cb-08dd7df119ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:47:43.3367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2is5xCRZ8fGS6Ikwbv4catbFA9wBdvqYVVE/HD27k6F/PX+jBvcf00OJoM2ePakF31QjeFQl29xJI/3605VU/kpymUodkwJvzu7cowSJzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

On Thu, Apr 17, 2025 at 01:45:32PM -0700, John Harrison wrote:
> On 4/17/2025 1:17 PM, Matt Roper wrote:
> > On Thu, Apr 17, 2025 at 12:52:13PM -0700, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > The printing code was doing a test on which list a register was in to
> > > decide whether it is steered or not. That might be valid at this
> > > moment but there may be other reasons for extended lists in the
> > > future. Plus, there is a flag specifically for identifying steered
> > > registers. So, just use that instead - it is simpler and safer.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_capture.c | 6 ++----
> > >   1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> > > index 9095618648bc..f4b08136e472 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > > @@ -1672,18 +1672,16 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
> > >   {
> > >   	struct xe_gt *gt = snapshot->hwe->gt;
> > >   	struct xe_device *xe = gt_to_xe(gt);
> > > -	struct xe_guc *guc = &gt->uc.guc;
> > >   	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> > >   	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
> > >   	struct gcap_reg_list_info *reginfo = NULL;
> > >   	u32 i, last_value = 0;
> > > -	bool is_ext, low32_ready = false;
> > > +	bool low32_ready = false;
> > >   	if (!list || !list->list || list->num_regs == 0)
> > >   		return;
> > >   	XE_WARN_ON(!devcore_snapshot->matched_node);
> > > -	is_ext = list == guc->capture->extlists;
> > >   	reginfo = &devcore_snapshot->matched_node->reginfo[type];
> > >   	/*
> > > @@ -1749,7 +1747,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
> > >   			 */
> > >   			XE_WARN_ON(low32_ready);
> > > -			if (is_ext) {
> > > +			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags)) {
> > This is a single-bit flag, so can't we just do a simple '&' rather than
> > using FIELD_GET?
> I was just being consistent with the other usages. Could convert them all to
> bit ops instead, but having a mix seems wrong.

Okay, fair enough.  We can convert all the flag matches some other time.
The logic here looks fine, so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> John.
> 
> > 
> > 
> > Matt
> > 
> > >   				int dss, group, instance;
> > >   				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
> > > -- 
> > > 2.49.0
> > > 
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
