Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A5EE77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 01:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D13E10E7CB;
	Fri,  3 Jan 2025 01:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKIhbCRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9386810E7CB
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 01:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735866131; x=1767402131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gTzqIvrMTKUNG/rm75hZIwL6EX7zGHXOc0PcBD1HY8c=;
 b=IKIhbCRhnpKjOBfaoiVHl8psIJw0ifTsRQmcwQxK68ZqjARG+oA0Dia9
 qL2sGdWB+wAz641f9w+tBBYBbI903jifGbTex827J0S20jwjiWzRVsFb5
 MjWqctmYWqBmlAsw6JfnWGpxEaoyEo3v8OWVHfbW7RKlSh9e87HFDWFTP
 HoiWk8T01YbDb2IYVVho8S71/BqCy3OiR2psP7am+YTiR7u39s/xyidt4
 YsN3KCqbg+JB3Nx0aBxY6KojWpp/3PKlLCe/iMbyNqns8emH+kFD6dhFk
 Rb8ZHDBamFfK2kNpIhrt6P9KGqzmHYArk5luvu+pYyKtMYSqYsT5a/hLr w==;
X-CSE-ConnectionGUID: 7C/3k0HFQV6ixDb3d7xdhw==
X-CSE-MsgGUID: keaIGdR8S06JdGyLbI2HyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35357531"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="35357531"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 17:02:10 -0800
X-CSE-ConnectionGUID: bnnN/sPNSq2CTZr2EK+4ig==
X-CSE-MsgGUID: ygkZbGAwQmOz7o+7toUwLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="101725832"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 17:02:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 17:02:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 17:02:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 17:01:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rh4re7pPYH7qYFdZ5tka9jXayyO/zm6iEPUvINOyJIy22qg6l7gt4MjfCD8jefQaEut0rXVK02VHv/woFLDagy+o/kt68SJ1o9tS+Cwynr+deUbDUJemxTEMb70n3Zmw7Hldl0AYRkZpgUVYhqKuoyJq85TI9FSqupzpPc0JCuykRk5hcnnlOmqm4iUVrYxyfEyHQBNB3ybB5VI9dkuqeEfF8KK2PwapqvAXyvNwgiMQKtS0YllI4xUUmvCFZN9mnyIs6A9/q77iqNjKnqc/lctHaQ3sfkz/4HrN0rurn1p/tEdq8WmlpJwexU2epbUxRWN+TWAql+SJQF/yfFWBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiY7m64MI+XAjnQv6upb6yrU6OSfHxM84DaAdk01qHg=;
 b=kEjvZTxST4ay1yLImNuO7uhQ3qRVDgu2G4xOIzfAROc4reRZ/DisQoMbtuJi4tBjfUPOC8wQ5IAfxgU6YavbmDGu1jB4Ymfuu35885aCBAdaVf4coz+wMwSjlqQEKIFQCv5jE0pPAMnF14Nj8Kvhk+TL3WmOkPUafXbDFn89lpBHV3qCkNRSbKCQ9p12bLUPXooihiRtQknOD0XQ8Q9VW6t7r32fhkegVRrg2wcwMtaJsV06UKpoJMRfxvhZ0vCaKJwGvbcr3fqqLK4OF0VH78AdQ9CINhmRgTK4fzRoWu4MC/2CZfuap5rE91yIxr/FZxe6R8+EWkZOf7tJAI2VWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 01:01:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8293.021; Fri, 3 Jan 2025
 01:01:34 +0000
Date: Thu, 2 Jan 2025 17:02:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Fix tlb invalidation when wedging
Message-ID: <Z3c3Hk5Cid4CvpOJ@lstrano-desk.jf.intel.com>
References: <20250103001111.331684-1-lucas.demarchi@intel.com>
 <20250103001111.331684-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250103001111.331684-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: e361018f-2622-401f-5d87-08dd2b922af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MGk6afMziZceBBCtUle7B1NZvYR51DXiBzzFCipZPKt3LX5RRqNMX+c5fvLs?=
 =?us-ascii?Q?RHJ7mSSPIq+1zqfo56x/L0urEmUVIZR3w9XYyp1Tz8UjDwnFXz7scYBTIYIk?=
 =?us-ascii?Q?u3zhvpN2+3StcACmHR7EaKEWlOlc0Fqh4wCweQGqqtem+q6ruDztQPXbZ2Sw?=
 =?us-ascii?Q?HN2JNDkldlN/KgYZkX0lu9NhfWr3e875BWmgtKsWWPdoXb3yG1yNKFu2fRdQ?=
 =?us-ascii?Q?hC/EEYgluV56vBquapXrPLWwJ5jJvYjP4izUb/O3DJCNLsRRMIVBC3Xyd0gM?=
 =?us-ascii?Q?uBbZ17H0TJGwOeLxEeJwzK11kJSAy2gckNCWOeMXSPcUGhtDVT6jPBKuA/TF?=
 =?us-ascii?Q?keMOtzr6V41zWJDaoAPImG7gr1GKUeg9mn+uPbrQXVnpaQGBmIPFuFWBCf22?=
 =?us-ascii?Q?PVaLieWK3jf0o5pec7YLK4PiIO+T2lMAPmtb5+TDazzW6p7mFMKiGWt4v7J1?=
 =?us-ascii?Q?nBPBOZJla7IA91+RtQzu/NkQkdRh/pDDu6+fF6fTw9iY4zL+o0yEs6llwy23?=
 =?us-ascii?Q?gFNRaah6pe1eRv1HhMolPbEWcWnnRgmB9RDxa8tzvny/XB9Ug2axT/cmVN8m?=
 =?us-ascii?Q?RrC8YYGznHpNchWP3+D0f2TsriCZ9HABdDVI89giEdaP1RyVmifsdsySqtZh?=
 =?us-ascii?Q?9Yok2kK1His+6WOnqOMksFa5BOzmSmVmmRn3W5XclnKPXqz7k1+JiAnfYUZf?=
 =?us-ascii?Q?QxbxJSZnE/hhlRBFvjnBTTdkuGVA4V0CxTEMGHHhhTYhDyBuH2SeDOp9OY/3?=
 =?us-ascii?Q?uwzmQjdc4qBBtEFnOhiRuMyvuGQQP2c5B538BNKT0qXbm3UlcL4/IKclseSD?=
 =?us-ascii?Q?fFzZsCYQ3aJt2tfwOeeh/UreMDe0p15AzXk8voSyNtFhWuMhcrt3EjDOiRzH?=
 =?us-ascii?Q?xMjSQFcGoFQxp6I7l8PBX5lT0pb+S714+kSe5fWb37ZgK7Ou+OCP2S9Uxpfp?=
 =?us-ascii?Q?Uc+IdQa1IYCkUcO4HCXfuqa4wQUiWIVFNS8Zy3peheEFEUlYTmLcA+9vj1Oc?=
 =?us-ascii?Q?kaEvR/eJobQIcIEVR5NmGPU/8/l4rWiAXGODWp04YGWWiWu5msauWRviIuVr?=
 =?us-ascii?Q?OfnKBCyl7kWypwbBstd4zSUD2gg3kk6ssBcpvo9VRFlpicnc2+UKtMjzXxzq?=
 =?us-ascii?Q?wjrqfuW617d/jZ74i5jb09evI1HAlg7O0neiSmJpfS8NB/FYim94SXkPsz+y?=
 =?us-ascii?Q?Issz2KpPuoaaYrVSuz9QJ/TPKXD5kWrJ/uegvrDB7xZGycxAI6oSd8+mWoGW?=
 =?us-ascii?Q?pqjLEL5NHwi5DT59ItHS8FcNSpMlI33NttQJMVihP+eJSa/yWIpU5tLNJfPl?=
 =?us-ascii?Q?fT5vj6ihZb7tSDQJ7bECO6KwsczivPGSotuo7G4MJmvSyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0eJWGVFK7LzPVUdtm8369y3oeBCkLLUp0w3guZ22KVOCiwMAiUQ1ymWYwe1C?=
 =?us-ascii?Q?/Awajt6FPa1ig3RUvEQvaIvMkgLX0lj4ftxf5JC4mbybJGOAvXmNqGxNIct1?=
 =?us-ascii?Q?zgUEV3r6PNliaMGAqqZHkovDAxxD5tSMTsze8yWH8si2R7+S01EIZUa2ADe3?=
 =?us-ascii?Q?mLFr6BQAVudSPi/8HOZVW5KxQuCnP+ckSzrpz2IB5YUJQ48Jf+mxDy/84x9i?=
 =?us-ascii?Q?nDLB208sdnQBUydcIO6FWXKbRv013C/gH+BP2yFmibt06iU7ThzhsGNRFFTp?=
 =?us-ascii?Q?/1GrPxJ36X1DtaFaKEr0RdC+1aE6irQtjXw3w5b0Cnk5z/tljLimxE7yRV82?=
 =?us-ascii?Q?14hc96bxb6ScgEO1YDui4X+x/DRalam+uyiCtqrpdJji+RqVwIfKZwBh5nUD?=
 =?us-ascii?Q?navdqXIqg3L9H8yS5Znl8oVj/aFdh4bcGqc7CHeCNHvaf7gEmsv6rzSmzDKU?=
 =?us-ascii?Q?CGbce6/GyN2Cj/JvV9mr8REa8rvQYdKlLY6MvQCi5weqFs01azkrZFoG+tsN?=
 =?us-ascii?Q?DBPKS9bX/6EHUd3vPXCO+PS7ss8iXHcI26FdAHuqdJEWXAel1pZzCKYpnZnL?=
 =?us-ascii?Q?UD2kmtMTtX0i7+o2g9+PqwLFSEFxV+M/MLYMEGJ5+zNA8eRPikPO43kdjCHy?=
 =?us-ascii?Q?vb0Zg6dHY27W43mFFFy2s2ogQleN2ysE5psKdBzrrwqdFbG/WJHrqI9iJMrT?=
 =?us-ascii?Q?0MvLaoAi82boi80SHzgw/U/fV4nj/WvvBofm+lHe0JN+Go5QcmUVF2dDa/tu?=
 =?us-ascii?Q?q4vZlJ58cq1z8/FMJQv+JcG0Zm0t7n6CS43+5RFCTbwezLRqswRwsU/nB5D7?=
 =?us-ascii?Q?j09eps/PiDC/J8xtN5g7QvZS0iRGyCM1fnYa1KI2q4qtGL8l4FDEBiPAbPMd?=
 =?us-ascii?Q?GY2QZHc+iWiZPN97wPhstOrGh4PSvjUuoPkgDrlMvwswbOQSWousZBzUB18D?=
 =?us-ascii?Q?c1m6rinj/yPbmbbuBw48NUIDdsDSXjhiBZfnJisNffmBa/E5GZe54vKjJqvP?=
 =?us-ascii?Q?CG+Sn6yjbXsPU5dPoA5ZZmdurjPbYUXiWNR53iBSjVESrRNK0E1d/xnqkzJT?=
 =?us-ascii?Q?1v3Ll7lVsvytFopkJ0rQ2CX9gtJ8gG/d3hFXv1aL9lOwBrDcWje12rNBcL/V?=
 =?us-ascii?Q?LhrePFkV3ZsQlyDXUhcZh9lVryQTl/EDZoX/ZkMkCb6yY2KisOdKu+8GceXO?=
 =?us-ascii?Q?f1kw0dz1usJkhp0luXm3Q4mc4uLtnBU07UulbAXzLnGyMG45FkbVEjAAjC7q?=
 =?us-ascii?Q?UOT4imb/Pq0cHuM/NN6nVKfGz4OD/y5x3O6JPI2x7+0KyNslSJ01J60YxTtf?=
 =?us-ascii?Q?086YYvQuAYmbd68HEs//NOjYtpsRe1+3mpG4QBDJrBX9Pcwbm3iDsKrIch90?=
 =?us-ascii?Q?4efRID7ZHCQTiv5hwNNpXl6MaSV/1LWF+WcCcCfn2pUFWoKsNeddPZz8Q+IK?=
 =?us-ascii?Q?EeAVZ/Uwt2rPuDDnd0YJ6lgrdfz3XG8TwJmE+cV7vKKftoaMIeIPQCzJSMv0?=
 =?us-ascii?Q?nGV20bhxICUD1kt+ftBruh0rT9so5QJKyYg++AQ3+yvs32/bUB76rEzkyFSD?=
 =?us-ascii?Q?+U+YeDoF59/q8B2Z6eMCJMM/kZ3hjbepK1LJJB3PAF9K20MbgAbIqbZ/IGzC?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e361018f-2622-401f-5d87-08dd2b922af2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 01:01:34.3553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //yoobKJ00KoaPL6P+p2sIWk8gv++yQ5NZg2PNlouv4XUL+V0bhJ3PsTGa8cypvOkLfXAgSTse0FHXK39Juc0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8405
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

On Thu, Jan 02, 2025 at 04:11:10PM -0800, Lucas De Marchi wrote:
> If GuC fails to load, the driver wedges, but in the process it tries to
> do stuff that may not be initialized yet. This moves the
> xe_gt_tlb_invalidation_init() to be done earlier: as its own doc says,
> it's a software-only initialization and should had been named with the
> _early() suffix.
> 
> Move it to be called by xe_gt_init_early(), so the locks and seqno are
> initialized, avoiding a NULL ptr deref when wedging:
> 
> 	xe 0000:03:00.0: [drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x50, UKernel = 0x00, MIA = 0x00, Auth = 0x01
> 	xe 0000:03:00.0: [drm] *ERROR* GT0: firmware signature verification failed
> 	xe 0000:03:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:03:00.0 as wedged.
> 	...
> 	BUG: kernel NULL pointer dereference, address: 0000000000000000
> 	#PF: supervisor read access in kernel mode
> 	#PF: error_code(0x0000) - not-present page
> 	PGD 0 P4D 0
> 	Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> 	CPU: 9 UID: 0 PID: 3908 Comm: modprobe Tainted: G     U  W          6.13.0-rc4-xe+ #3
> 	Tainted: [U]=USER, [W]=WARN
> 	Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-S ADP-S DDR5 UDIMM CRB, BIOS ADLSFWI1.R00.3275.A00.2207010640 07/01/2022
> 	RIP: 0010:xe_gt_tlb_invalidation_reset+0x75/0x110 [xe]
> 
> This can be easily triggered by poking the GuC binary to force a
> signature failure. There will still be an extra message,
> 
> 	xe 0000:03:00.0: [drm] *ERROR* GT0: GuC mmio request 0x4100: no reply 0x4100
> 
> but that's better than a NULL ptr deref.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3956
> Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c                  | 8 ++++----
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++--
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 3 ++-
>  3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 41ab7fbebc193..26e64530ada27 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -387,6 +387,10 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  	spin_lock_init(&gt->global_invl_lock);
>  
> +	err = xe_gt_tlb_invalidation_init_early(gt);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -588,10 +592,6 @@ int xe_gt_init(struct xe_gt *gt)
>  		xe_hw_fence_irq_init(&gt->fence_irq[i]);
>  	}
>  
> -	err = xe_gt_tlb_invalidation_init(gt);
> -	if (err)
> -		return err;
> -
>  	err = xe_gt_pagefault_init(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 665927b80e9ea..257b500e17037 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -106,7 +106,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  }
>  
>  /**
> - * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
> + * xe_gt_tlb_invalidation_init_early - Initialize GT TLB invalidation state
>   * @gt: graphics tile
>   *
>   * Initialize GT TLB invalidation state, purely software initialization, should
> @@ -114,7 +114,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   *
>   * Return: 0 on success, negative error code on error.
>   */
> -int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
> +int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
>  {
>  	gt->tlb_invalidation.seqno = 1;
>  	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index 00b1c6c01e8d9..672acfcdf0d70 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -14,7 +14,8 @@ struct xe_gt;
>  struct xe_guc;
>  struct xe_vma;
>  
> -int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
> +int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> +
>  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> -- 
> 2.47.0
> 
