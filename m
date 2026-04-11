Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA91F45A12
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 01:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746D010E03D;
	Sat, 11 Apr 2026 01:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDxvtdVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5008010E03D
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 01:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775870378; x=1807406378;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WhVnQN6RYe/FOoHGmzjc09J0fUs6iiJhRzUTRLBx5QQ=;
 b=jDxvtdVuyQYlYgzWn/0rFQe9N4dobNPaWR4HM4qxDxiAim8ugKn8zyhN
 lYprs36MoXhyZuw7tvj2Jndqzdh5AMsetwgBNTo6Hu6fy8IUnywgerssV
 9kHYF21Icm/OEOAUI3eEZ8GpE3Fj1NjCYYr29MwKyPjVJdD8yUpoQ+XYo
 5gOZnZ9ETJ9y0iFSatG+D3j9a30JvLK9Qx+fIGKFo8xgR6ehqLLXth3YB
 4h28m2xX1y8ascFXhlSxi7Izk74mewoA+laUZ+ugRpS/jOBrf5uDclwT+
 ZgFWcMyJrueJrV8B7IpAe+NIWmv4iLNKFbIp31ISeGntkO+wAWdPKW0nR Q==;
X-CSE-ConnectionGUID: BtZbk8ggRt6a5ofg0X9J7g==
X-CSE-MsgGUID: WpmGo15gRzOvNz90IgrUwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87973322"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="87973322"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 18:19:37 -0700
X-CSE-ConnectionGUID: MGOmTPnmSNey1W5QCX4SmQ==
X-CSE-MsgGUID: sx6mXhpyR1mqtG/O52cZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="228397816"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 18:19:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 18:19:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 18:19:36 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 18:19:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGMKMPeH+1tUkOc5l+v9ebvAKADdCycn36l9cmg1iUyrACjKZ78/aVUy0b4D1VJpuHRYS02bITTIfCxq568Sn3j+lLyQNdNCHB7b9QSlRh03LejnAeO76kJFx8q7a1bLQuTbQCsNry7Nxd5AWOmgQ8vtbki8SK/09CX0yDrFJKrdudjhTRfe7Gh9HIX36BRuSCrp93lVdhTIBjL1mE3eqqVg3qoTC6g2PxUvFrTTbPoT/hC7hT66iTTNk6QE89OokX3WE92ZQ3DMr9iGOfr2tyhP7tK/0lOlXZCS/pG56W8PIWQuPVKfaVvs2Bm64iki4kWD6b/712Ww7vyeC8lu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjovFP8yKS+K3zRKQzhE+vabQWz4+uIEuLLl63qcnak=;
 b=nU5vhMmn1OruhV2wQXI9r3p0s2kuLACb+vT86Sa3Xfw5JArvVg+v7CrJ+C08FLzqH0c5qdDZiykhelKdi1voztsbncG5ANXJwc4JZ9flFvgQBquOcwaAFNyKzWItovCuJfug+f6FAANW4UcUrcjpW0fnqhVn5C3CThf/Cmattlsy3+16gMyIP5+4Ndz1s085oryCwKAe/4zdFgCNlbKKK/WwxtO/d1Vf0SF4z9BO52gd2SuDvVGiCsaw9dxs4af/GtGF7sUVs3ev2Aib/9X1lep3STQs3Lmz/0lptZh8usvywrq0Kno7ECIG3QzAM9deVqfxDaDQett6w6G5Lv/RjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Sat, 11 Apr
 2026 01:19:33 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Sat, 11 Apr 2026
 01:19:33 +0000
Date: Fri, 10 Apr 2026 18:19:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Convert stolen memory over to ttm_range_manager
Message-ID: <admhoW9DCLOWbwpN@gsse-cloud1.jf.intel.com>
References: <20260410120601.3234709-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410120601.3234709-2-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0250.namprd04.prod.outlook.com
 (2603:10b6:303:88::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: b23a1cd1-f684-400c-b3b4-08de97686303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: xVUwTioozYFs5tb7uF3Gjo/j1QMiybGEVmPPFsf0wt5TnU/d+3irQiqPkO8bwy78gegqBMHChbtnn0E5OohaOHOp/CqhpZiGKGb643ehsK4CQs6TPcLOLgpUNNVMpl1mJGichqCiyDo0UO60Bkzbl/hTYLeT+twzyVWJd45vfsu0iF/LWYfWrnKLc/fnbN73VFmpDxBHs18AT3VeQFxIcOhUzofPmt5MzEaMFK9JKdvpJgRqBhf6T+roGyZrqh+rVvCQ//WCaSFz5lFSLeO74TYpbAVSRQemENhtzqAVb+z7GWEG4wxG2lYgbLyy3ng69rZ9FPxWo49jdo3PBhHxIqf2vBmMkH/j19vpOfzxm35Uo6c4rCPVpLBXziHChdOXZJEixlyCHIXG9Z2KUCnBKVaO+6OM1XzvIbSJJ6SwasbnSEfThYn5g5RSPygPRdBgb7d4IqLTqQCFBDaxkLCeJCq3X54ovdpOtYGaAC5FNfU1Bd7AfN7YvRZptRG4yMgG2wSG3DYxEbTOaySjr/GvRSBT707zpxaA+j67VxIKPCPYtZh4zDIHyehuY7tS8WU5CP/SZrXWfuHGkvO8oZw+psqzlCJfQ6boE4G6geWphXd0IqIEfg0qnH9tSuu825vCRPtLKm3kWkPb5B9ArEPQmmk4WdwNoZxS4z6gDMy4b7jOuI3q/k9ObaA4l1mmI2dA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWgzNmNJcWxoYnRMSExnVkh6M09TNHlKMWxXSlNYeGI2Tk13YVdLMFNyTTBF?=
 =?utf-8?B?VU80T2hZb2VZN1lHaVYwNTZ1L005ZXNnUDhMeG5sNkZMUFFadWRobE4xWHUx?=
 =?utf-8?B?a2lhZGdiV3UzMmtJd0MxR0MvMFBadFlrMjVDdnhRMFVydHVXY2RGenVUSFlW?=
 =?utf-8?B?RlpUZVVGY3Rqem05Qmw3YkhzUVJlcTZMTHM4bSt0K0ZnZG55R3ZMOEhsa0pV?=
 =?utf-8?B?T0pYbm1sQUJMUmRBNFhwL2VycmM1LzB5dEROTDBtZnNjcWVOQWQyclA1MW9j?=
 =?utf-8?B?cTRqTW9uNUY0T2dUaGVNU3FON2RYbzhscER5bVdXQ0VZcnRwSi9lWU1OZHpa?=
 =?utf-8?B?MzB4YkxuU3dDejRTSUxJdXBHWEZMcUllNEt0TlduNmJkQ3ROSEc2cExBOFRU?=
 =?utf-8?B?QU01Z09mY24wcTVoU1R1TkF6cVU1WHJ4VEJuK0NGbG9WSnUvSmVMMVhHdEI0?=
 =?utf-8?B?WlNpM2pnNUNvNzJnQUFXenhoazZTNlNPQUVKTVZiVTlHNEFHVm1yZnB2T20r?=
 =?utf-8?B?YXdlTnlRcVZrSmRtaXZaNkx4Y2JPTFppVGNaeHh4NzZtdzJUNHM0UDJ0QnYy?=
 =?utf-8?B?cnVKNEZyZW1zUk5aQ2NtdkFoY0NLZlVIZS9EQWV3dGFlYzc4TGNqM000S3JP?=
 =?utf-8?B?L281aFk3UTQ4c3VuL0s1TUFOYys1UjFiREdTNFIyMW5nOXJJKzBHaGVnT0Iv?=
 =?utf-8?B?b0tlVEd0VERMTnRQVEdWWklQV2hBT2pIY2dCOE54YU9yZUxkQ1dRNHBwdSsv?=
 =?utf-8?B?TmxlWFN0WTE0aEh1a2xqa3JkQUdYM3F0UmJlRVBhMFp3cnhPM1ZKSXRvOXho?=
 =?utf-8?B?VU5zTVUwMVlYdE10SjRYUDIwT3RRZHVFa2RKc0VRR3V1TFpxM3lBTlZBb2Y4?=
 =?utf-8?B?SXVldUptaXYzVTZjbUlFa1ByaVcxNTlWMG1iNWo4cTdEbFVrR2lnWDhrSnlw?=
 =?utf-8?B?QnZxbW1DQ0xZUWYxMmNVaXE2VlE4NlovWU5GUUFSMjd2UXhxRktrUjZqNksy?=
 =?utf-8?B?TXhwYUNqVksxM3crZGJ5NVEyMkdwdVBDUzNKQkNoeEZPVjNQOXJZVlozUkpL?=
 =?utf-8?B?ZURVTDU2RDM4UytCcmFqM0dZT0ZnRTFZRjBEWE4yWjRsblJENXNrekdlNDlE?=
 =?utf-8?B?eDhNSkhIdVhHYU01ZWt6UzJkNFhySnJoTEIvdmRKNHdkZkppZUdNSVZqQWpX?=
 =?utf-8?B?SUlLWFJ4Q1NEYVE0ZkMyd0lrS3lqUVJxM3IzM0E1QytLYytFektnU3Z1QjAv?=
 =?utf-8?B?M1VaSFpFS0FjbEwzbG83aGc0T3E0aStyRGtoRlZzbXIxcDZUeTBjdGt6cktS?=
 =?utf-8?B?bkFzSHM3a2NLbWdtdFdSTHdVMC9Oc1FFYUI0S1dxMmxuMDhNamhrczdFQm1G?=
 =?utf-8?B?cTBFdjJ3UUpFV0dwOWg1ZGpBa2JkVmw0TnNNRU5yNFNEZWViKzdmTTliN1Bt?=
 =?utf-8?B?c3l0R1BiZjdPOFkvUGx3R3RMVjBDWFJ6aTh6aEFSb3BvQzRJT0RnM2NMdG5W?=
 =?utf-8?B?Y2U2YnpmVUFCTk56QWNrcVA5TkRDanNwTnMvaTZtbC9WTVpUc28yZFBpdUVV?=
 =?utf-8?B?OThQbDRuclh3Vnl5Ky9mU3Y3cUUyUkIyTU00ckdpSXF6NjlRRFhFdjk5QWFp?=
 =?utf-8?B?MVg0VDM0L2YxejlVLzR0TmMyZWM5ci80eFhiUFlqVUpTR3V0ZFJhYjl1QkVE?=
 =?utf-8?B?N00wU0dYVXRZRlJYVmpBRG9uSXUrSlhBZXZyUkdmM3J4b2dZckhEQ25kdUo4?=
 =?utf-8?B?Z0YzUnFRODBrMWJNUUdBcExDYkN3R1U0b090WitjREI0WHNUWnVYVmNsK3I1?=
 =?utf-8?B?bm1tMnRrOGFoSHcxZGZxYnh3RXgwMUhYMEJ2TGNXbitpemovS252U0R0K2dY?=
 =?utf-8?B?disxQnF3dXRKcEJRWXUzU283NmQ0Y0JLUGF6RjR3UzN4TXRmbEE4ck1qSk5M?=
 =?utf-8?B?WnByMWNSTjdQS0szMG92N0VVS1VnRFVGSmhhNk5mc2E3bVJHNktvT0ZlaHlO?=
 =?utf-8?B?c2kxTzFOWVdDV3ZWZnJEVFhiWGVuS1p1amE4MUIxSFdCMHY1VldWRTlCNWFn?=
 =?utf-8?B?NlVlS2pWL3IwMElTcXUrRUhqRmg4L05CVWxGdkh5dE9hK0NZU3JaTk0zRFQz?=
 =?utf-8?B?dm5lUWtkbi82UENaRzJxSzBubEpBai80bWcrdDFncUdGZ2F5NHZjcDV0R1dt?=
 =?utf-8?B?R2YrZUxoOFE3Q2tVZ2tPR0wrdURrajBqM3RJRkI1UXRoV1dTczBhVlBVNFdt?=
 =?utf-8?B?NHcya3RTckU0NXVrVi9jbWUrYkRQS3BFTXpHM3RxYS9WTzZIc1Z4V3p1aXBS?=
 =?utf-8?B?UGNwTjNpMG5QTzVUNDlTK2M3YnUvUnpwNGNLVGoxWmIzZ2c5cXUwZz09?=
X-Exchange-RoutingPolicyChecked: XEqCxWNjdfcpTBRz9ehaK+k1Rzv8Rkx0XQKYZZhJjq5LeYE57iP0hRovQMgnkiX7ybzeHrb4Cjt+eVP0qkovrKU1eE6ynIbVNQWNVU6nXJslQwkoKn9lE2WISKtVejKkj81B76P+p/HBTjUKvWJnl3K5axa67BEvg0t3tWFPkwqP/Sq1He3JBu9/q6x8coCjfU3r25b+1f4LMV7ZSd9mVoTzZNEYkH2LcxdbqYET3Lcf02kqaKzZ0mgvy6BALcYOlDZgyOKIMdAmZnAd2AfCqKiJZORIYYrz7z0L+9xPWQ4yvVHEqADqVW4WPn8h8M7vkF4bw3dCyn4n367Hhc93SA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b23a1cd1-f684-400c-b3b4-08de97686303
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 01:19:32.9811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu7SFXZFmK0QigXr+soYOsCcDTxRJfsd6YG3ABuNU7r/5242KJjDnEIueM+r2Gconyxzdnj+Q+7Jw0Ee/cDYYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
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

On Fri, Apr 10, 2026 at 05:36:02PM +0530, Sanjay Yadav wrote:
> The stolen memory manager was sharing the gpu_buddy allocator backend
> with the VRAM manager. However, stolen memory has fundamentally
> different allocation patterns that make the buddy allocator a poor fit.
> 
> - Allocation sizes are not power-of-two. Since buddy rounds up to the
>   next power-of-two block size, a ~17MB request can fail even with
>   ~22MB free, because the free space is fragmented across non-fitting
>   power-of-two blocks.


This sounds like a problem in the buddy allocator, right?

Shouldn’t the buddy, in this case, try to find enough blocks for 16MB
and then 1MB?

Regardless of fragmentation, the buddy allocator should always be able
to construct the blocks in your example—unless I’m completely missing
something.

Matt Auld is an expert; maybe he can chime in.

> - Hardware restrictions prevent using the first 4K page of stolen for
>   certain allocations (e.g., FBC). The display code sets fpfn=1 to
>   enforce this, but when fpfn != 0, gpu_buddy enables
>   GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
>   coalescing path, further reducing allocation success.

Can we not just allocate a dummy allocation on stolen manager init which
reserves fpfn=0? Then release it on fini? Then display can safely pass in
fpfn=0?

> 
> This combination caused FBC compressed framebuffer (CFB) allocation
> failures on platforms like NVL/PTL. In case of NVL where stolen memory
> is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
> leaving ~22MB for subsequent allocations.
> 
> Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource

Wouldn't drm_mm just have different set of fragmentation problems?

Simple example: We have 20M.

node[0] = alloc(5M);	/* this lands on 0-5M) */
node[1] = alloc(5M);	/* this lands on 5-10M) */
node[2] = alloc(5M);	/* this lands on 10M-15M) */
node[3] = alloc(5M);	/* this lands on 15M-20M) */

free(node[1]);
free(node[3]);

/* Now we have 10M free at 5-10M, 15M-20M */

node[4] = alloc(6M);	/* We fail as no 6M hole */

Matt

> manager for stolen memory. This reuses the TTM core's ttm_range_manager
> callbacks, avoiding duplicate implementations.
> 
> Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
> contiguous free hole after initial plane framebuffer allocation, and
> FBC successfully allocates its CFB from that region. The corresponding
> IGT was previously skipped and now passes.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c             | 12 +++++-
>  drivers/gpu/drm/xe/xe_device_types.h   |  3 ++
>  drivers/gpu/drm/xe/xe_res_cursor.h     | 14 ++++++-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 55 +++++++++++---------------
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 11 +++---
>  5 files changed, 53 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index a7c2dc7f224c..cf22cf8ff9f0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -601,9 +601,17 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>  
>  static bool xe_ttm_resource_visible(struct ttm_resource *mem)
>  {
> -	struct xe_ttm_vram_mgr_resource *vres =
> -		to_xe_ttm_vram_mgr_resource(mem);
> +	struct xe_ttm_vram_mgr_resource *vres;
>  
> +	/*
> +	 * Stolen uses a range allocator (not buddy) and doesn't track
> +	 * used_visible_size like VRAM.  Actual CPU accessibility is
> +	 * gated by io_base in xe_ttm_stolen_io_mem_reserve().
> +	 */
> +	if (mem->mem_type == XE_PL_STOLEN)
> +		return true;
> +
> +	vres = to_xe_ttm_vram_mgr_resource(mem);
>  	return vres->used_visible_size == mem->size;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 150c76b2acaf..ffb84659c413 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -42,6 +42,7 @@ struct xe_ggtt;
>  struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
> +struct xe_ttm_stolen_mgr;
>  struct xe_vram_region;
>  
>  /**
> @@ -278,6 +279,8 @@ struct xe_device {
>  		struct ttm_resource_manager sys_mgr;
>  		/** @mem.sys_mgr: system memory shrinker. */
>  		struct xe_shrinker *shrinker;
> +		/** @mem.stolen_mgr: stolen memory manager. */
> +		struct xe_ttm_stolen_mgr *stolen_mgr;
>  	} mem;
>  
>  	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 5f4ab08c0686..0522caafd89d 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -101,7 +101,15 @@ static inline void xe_res_first(struct ttm_resource *res,
>  	cur->mem_type = res->mem_type;
>  
>  	switch (cur->mem_type) {
> -	case XE_PL_STOLEN:
> +	case XE_PL_STOLEN: {
> +		/* res->start is in pages (ttm_range_manager). */
> +		cur->start = (res->start << PAGE_SHIFT) + start;
> +		cur->size = size;
> +		cur->remaining = size;
> +		cur->node = NULL;
> +		cur->mm = NULL;
> +		break;
> +	}
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1: {
>  		struct gpu_buddy_block *block;
> @@ -289,6 +297,10 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>  
>  	switch (cur->mem_type) {
>  	case XE_PL_STOLEN:
> +		/* Just advance within the contiguous region. */
> +		cur->start += size;
> +		cur->size = cur->remaining;
> +		break;
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1:
>  		start = size - cur->size;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 27c9d72222cf..7e204d5e9cbe 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -19,16 +19,12 @@
>  #include "xe_device.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
> -#include "xe_res_cursor.h"
>  #include "xe_sriov.h"
>  #include "xe_ttm_stolen_mgr.h"
> -#include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_wa.h"
>  
>  struct xe_ttm_stolen_mgr {
> -	struct xe_ttm_vram_mgr base;
> -
>  	/* PCI base offset */
>  	resource_size_t io_base;
>  	/* GPU base offset */
> @@ -37,12 +33,6 @@ struct xe_ttm_stolen_mgr {
>  	void __iomem *mapping;
>  };
>  
> -static inline struct xe_ttm_stolen_mgr *
> -to_stolen_mgr(struct ttm_resource_manager *man)
> -{
> -	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
> -}
> -
>  /**
>   * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly CPU access
>   * stolen, can we then fallback to mapping through the GGTT.
> @@ -210,12 +200,19 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  #endif
>  }
>  
> +static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void *arg)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +
> +	ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
> +}
> +
>  int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct xe_ttm_stolen_mgr *mgr;
>  	u64 stolen_size, io_size;
> -	int err;
> +	int ret;
>  
>  	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>  	if (!mgr)
> @@ -244,12 +241,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		io_size = stolen_size;
>  
> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
> -				     io_size, PAGE_SIZE);
> -	if (err) {
> -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
> -		return err;
> -	}
> +	ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN, false,
> +					 stolen_size >> PAGE_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	xe->mem.stolen_mgr = mgr;
>  
>  	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>  		    stolen_size);
> @@ -257,36 +254,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	if (io_size)
>  		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>  
> -	return 0;
> +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_stolen_mgr_fini, mgr);
>  }
>  
>  u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
> -	struct xe_res_cursor cur;
> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>  
>  	XE_WARN_ON(!mgr->io_base);
>  
>  	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>  
> -	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
> -	return mgr->io_base + cur.start;
> +	/* Range allocator: res->start is in pages. */
> +	return mgr->io_base + (bo->ttm.resource->start << PAGE_SHIFT) + offset;
>  }
>  
>  static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
>  					       struct xe_ttm_stolen_mgr *mgr,
>  					       struct ttm_resource *mem)
>  {
> -	struct xe_res_cursor cur;
> -
>  	if (!mgr->io_base)
>  		return -EIO;
>  
> -	xe_res_first(mem, 0, 4096, &cur);
> -	mem->bus.offset = cur.start;
> +	/* Range allocator always produces contiguous allocations. */
> +	mem->bus.offset = mem->start << PAGE_SHIFT;
>  
>  	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
>  
> @@ -329,8 +322,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
>  
>  int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>  {
> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -	struct xe_ttm_stolen_mgr *mgr = ttm_mgr ? to_stolen_mgr(ttm_mgr) : NULL;
> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>  
>  	if (!mgr || !mgr->io_base)
>  		return -EIO;
> @@ -343,8 +335,5 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>  
>  u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
>  {
> -	struct xe_ttm_stolen_mgr *mgr =
> -		to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
> -
> -	return mgr->stolen_base;
> +	return xe->mem.stolen_mgr->stolen_base;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5fd0d5506a7e..79ef8e1b5e5c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  			   u64 default_page_size)
>  {
>  	struct ttm_resource_manager *man = &mgr->manager;
> +	const char *name;
>  	int err;
>  
> -	if (mem_type != XE_PL_STOLEN) {
> -		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> -		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> -		if (IS_ERR(man->cg))
> -			return PTR_ERR(man->cg);
> -	}
> +	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> +	man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> +	if (IS_ERR(man->cg))
> +		return PTR_ERR(man->cg);
>  
>  	man->func = &xe_ttm_vram_mgr_func;
>  	mgr->mem_type = mem_type;
> -- 
> 2.52.0
> 
