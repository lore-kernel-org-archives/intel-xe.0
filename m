Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FCEC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 16:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAEE10E604;
	Tue, 21 Jan 2025 16:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6vMwLal";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3480610E608
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737476384; x=1769012384;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6RKHdn0wCwcnu/jXHffijLbo12837gwoY59EmighsfM=;
 b=f6vMwLalYtH4ufdtoQGs3pJAYwzjyHt6IytryoeskXL05Z9eb47Q0yxI
 +mOcSJTwfAqcM6HYDmY338BxMEJTGUChTIM3Hj2ymKfugB4MZ/d7BFaF1
 O00hJh/O0sVYSq8QNAb5P5f4YDqWWTg6CRSPrXsEbrdvhwy+klq6Lbgtx
 hHJU+EcDwJEn5dD+OLWxJZK8/F0LEW/ACYv0ZMwPPFC2Za2kN65zhJBol
 Ta4Xpg1kN8YLBngf0mi77Ax3yGJTDVznICW64V5Y9IKYCclDapBtaAOn/
 zv8zl3WoXPPdQQFB3nM1Bd5FS4NnC+ESFgHbH2vfknG2IMZwxostLB4f/ g==;
X-CSE-ConnectionGUID: EtulnKneQn+sb9lnAcOeWg==
X-CSE-MsgGUID: n4ixbHWCTM2QUSeOZddQgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37773521"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37773521"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 08:19:35 -0800
X-CSE-ConnectionGUID: oqQJQRJSSW2Ze2Rmhm3zzg==
X-CSE-MsgGUID: 52/zh3fYTKiMHzHxpxKHnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111478966"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 08:19:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 08:19:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 08:19:33 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 08:19:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNK0wdSSEDLDR3iPH5J/dPV4+TBM0L6S/EU4th2zVbJPYe6djx4QOrjlIBqz8mqUn2FaTrL/Iz0wDd+gO4gKjRRWM8OCQCpxeFAS5bKh9nB8otA4AGNauULXoh11cLiOVwcvv6QP2tcR+cAZvR1g4XhqxmMIolMiP2G6BNyWLpR4cHSDn66n2x1q4t5HUrkoiUTC4ba3zw4otYtAIszvZGfPVOxdXXoSoL7Q96D6fTOahcBJaUbNZlfdP6QvjODrz2FR3VjLASX5f82hOm7SeGkegoxgEUDnv76ACVPim6qyudHxM/JoWHAp9nvXg0kP0FLVxJwtxXMmeBsHUjQD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+8L/tmcQ6oQO59HKUhQ8tUe5DmCt7Aa1I+z5HNRqBs=;
 b=pouT2ElpqfvQvJPDrNnI/foVTVeNb5wx9/QCSlllUG80ss0EchaxgCTlLp+BHDAeB7wr2XJ59g/Zv5ribnns2ljhafcFuNmDp5XB/6JhcoWCLny/cpcglp/Gvh7esH2xSTX1N1o63TCTfCptIxsGUkynS2iJJ9WjiKPjsiZ6VtzZLpY8+ilWqiHimbUqwvVlFiQb7dydQiTa3cfu6RVoeHUtIxVul4X7agf4eMYFkSPOgsqvoie8Bo4k/earxy8uP/TrRiA1Smlqan8nijl2s2p0AIprbfCI0G6Rg4Jeu6WWXo3xyph4XcV8cTqL6QHWrYRmLLkYz58EOb2QFjOSzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by BL4PR11MB8824.namprd11.prod.outlook.com (2603:10b6:208:5a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 16:19:31 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 16:19:31 +0000
Date: Tue, 21 Jan 2025 11:19:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Fix migration initialization
Message-ID: <Z4_JChiMm-GaNQa1@intel.com>
References: <20250120232443.544-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120232443.544-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:303:86::25) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|BL4PR11MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 4737a5a0-432c-47bc-b160-08dd3a3762af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVI2enhxb21RTUY3QVR5WFNJeVhrMXNZV2xlcG5GQmJwVENMYWN3S1FuWVJT?=
 =?utf-8?B?OUlNYWRxVmJTazFtUjZ2VUsxdXlQQlJ3Q0VWSVkwelVCMVVPZHRSS1pJa0w1?=
 =?utf-8?B?cFV6Y3U3UjZYYkVRWUVuVDVYUUZEN3h2NmxwcXdzNi94ZDZCVjlOU01uNC9j?=
 =?utf-8?B?VXpEbzE4SysweGVnbE5BSFdPU3MxclJRdWtMcXE1YnZyV3FsLzUvMTNicGF2?=
 =?utf-8?B?ZTJsU1NURHpjQlViV3ZkQlhibzlrUkwyUGVHZnYwVXhod3NvbDhIUDY0TWxv?=
 =?utf-8?B?RWl6eHIzTXV6ZU5UVjdkeDl4TzRoM1Y5S1JpVXY1YnJTZmtYTm0rd1k4Z1hh?=
 =?utf-8?B?NnNwRjNFc3JoankybUlBUEJJUXczbGFkYTRsZU5HVytmRjVDSWE3SkNHMTNC?=
 =?utf-8?B?TXExTStYRklhQ2dhenIxUXBDQkF0OWZzZHhMWlNOMHl2QnU1VjJ4cHhYNE9F?=
 =?utf-8?B?SWpBa3ZjTWRiL3NJL29jVVNLU3IyRDUya2tSdmZNbjVDZGNTTHV2ZDQwNlU3?=
 =?utf-8?B?TmtySmpPS001aUtoMG12TjErbGpZMjYyeTNIbnBmR0w3am9YMEZ5UWpPMHdI?=
 =?utf-8?B?djNMbjJvM09FNFpRQzU5Nmp2N0I0K0NVeHhXSjVFdmlyUTJJWHBJakpKeTM2?=
 =?utf-8?B?c1RicUxsVkMxNVJkS1NiMnAzSjBhc3VvcGtFd3BoWG94bGEzSUZleWxEN1l2?=
 =?utf-8?B?TlpDRS94QXpVZzE1ZDBML1VyaWM2QTZnanROTEVta1RZbzRBaWZKMnd3TzNN?=
 =?utf-8?B?eVNzK1ZoWEdBY3Q0QmVyck1CbWZOZlhPN2R2eGltaFF0Nzh6UTFmUHN2NkFS?=
 =?utf-8?B?WHowTFl3ZjU5KzVFWW5FSXNiYXp0QTF0OXdwN0NEK0tLbTMxTkRsQ0l3UVY0?=
 =?utf-8?B?WnlqNE1ibzh6YjZsK1hBWEhBaXVzWUkyaVk2MDliRWlxY1BnWjlsd0lrYVlB?=
 =?utf-8?B?eVVxQVBXamlBNlEvVDVBQTd1K3ZqSU9nU1Zka1NBZmczQTdJM0RIalljOWd3?=
 =?utf-8?B?T2hXN2t6SkxGNWprYlR2T2pFTFV3Qk1CMytQQkE0Z29oZ29SbUxURHFNczUz?=
 =?utf-8?B?OGtZdktjQm1BMzY2blpUWGhUYytha3pGa2lRQjNhcU1HQmhMdEU5MmZCVncy?=
 =?utf-8?B?cU5pMWs1UUNPaHgzdUNJMWNXYVJtNTg4dFpETFdiMWFZS1JEZnZ2cm1IVHd4?=
 =?utf-8?B?SHRIakJheWh3OWV2WHlxU1ZlMTZQbGZBMXNKdzhSREl1QldZVVZlaUhMbHRs?=
 =?utf-8?B?d2VTMnR2TWxvdVFhdWx3T0tLdjdLV2pLMmpqd3dlNlRWZGJ1SkpPQjd3Qk54?=
 =?utf-8?B?VzZ6VEdaSmVnY2FxUklnaWx1alVyTVNOek03dVlNeDN2SVAxaXdGcmpZV2h0?=
 =?utf-8?B?ZVhvZ0ZzbnRDS0xjRTZMYXR3NnlHbVdQazh0VmI4aDBWZ0JkTHY1MjR0aVZ0?=
 =?utf-8?B?SGliRDdFQjhLQ1JEakVRMWtJU3dWOGlUc3F3NG5PQTEyZjVjUURHUExFNHlh?=
 =?utf-8?B?N3ZiU3B5a1IxTldtdUdWWGEwOXUyRHZxR2haTFRtZ2p3di9senlGQWJ1bFM4?=
 =?utf-8?B?dUg1ZG00bk5qS3VDRC9DMmQvakhkQzVSVHJTTDFVeFFsNGZiRHhNYTBSQzBm?=
 =?utf-8?B?V3Zod2s1cWx1dW0yU3dQMW53bEw2T2hvak9UMlZtZUNXOUVVSDJhcGJMK0F0?=
 =?utf-8?B?ZlNtTzd3RDdjb1dnaVJXdW00ZWVwQk04YXA5WFFIbnBRMUowNVBpeWNtTWlU?=
 =?utf-8?B?NzBXUHRWUyszM0pwMkJ3TThRK3F3TmVqOG1mM016dnJLVEdWdTF4d2doNnNP?=
 =?utf-8?B?dE9TU1ZVNnE3a2FEZGMvUm53ME5iMkxmMENBWkVRd1lSSlVhR1NNWDVEcHFC?=
 =?utf-8?Q?Wl0ZvgesmRRgS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1hOGdGUTVpaTRMOUd4M3N2cmJwdkFKbllUYUFSbXRHejlLS3pvY2FxVjJF?=
 =?utf-8?B?V1JWU29yVUkwNGE1VU4zM2c3bk02WkFLeHhiRS9zODN0NzZwYkhOejdGZkpy?=
 =?utf-8?B?SDB1RzQvdDIyUEFPVnZhSkJFTHAvNS9OQjZYSG1jUHo1RU5tZisxZ2JJQXpS?=
 =?utf-8?B?UkFlTitFUVoxY0VoZEI3d01HTmFFSExNY2pmbmptRkhNd0Q2V1pFV0t0Zkxs?=
 =?utf-8?B?SU0xT0h4NWplbHRJcEZ4ZHRwTlhCRTNCQkhmRGw0QVc3QUY4QmFDRmFDSyt1?=
 =?utf-8?B?TUFPSmx0L0I1SW13UEViWEd6NVExVGRDMVplTFptRE9qcnlKbmVVQTcvZUxi?=
 =?utf-8?B?THFGVnZRNjZkcmJUVzlBQ3dSUVBWa3hKSlhaRCtMNWtSbnpJeHB2S3ZiU1pw?=
 =?utf-8?B?dkRlcXRycDJwYitkaXh4QWhzaEJubVhDWTR1czdnMkhYWEQ1dGlDdkRKbFE0?=
 =?utf-8?B?QXE2M2Z3L2Z5cjhJZUhBWEZRWk9kYkROMS9SM2c2SXRYMGtad2k1UGh5NHdq?=
 =?utf-8?B?MXREazNrWE5ocktMZlFYOWhxNlVlbmpMdHVabGxMWGhzK2N5UUNVcjlGNURw?=
 =?utf-8?B?QTFMRldKM09sUFlMWENRQnltd3hCdW51MS9JSk5xMEJqU2kyZWVBZ0V1MnA5?=
 =?utf-8?B?djBENi9YWTN2d0F2eDVHNzI5UVI2a043ZW5YUldic0puWXhyUkVnRENRemhF?=
 =?utf-8?B?Nzd6RjM2QWFQNXpRLzMwQzRwSE1XWGtWcU56cmw1U205OEJ2cE5rd1VCYVBv?=
 =?utf-8?B?ME9hS2tHbGpsekFMMkR2ZEdlWGJtVjhmT1kreXZUMHJEeDJHbzFubVZGVDdk?=
 =?utf-8?B?ZkI3c2JOcnN3TTlQbjlsU21qUHkyMmVGa0FOcXBoU3hZWTVYMVY3UURiNk4z?=
 =?utf-8?B?Y3FrT2xXS3RtTVNQc1BqcEJRSllsaEJHRzRxeVZua1BJcHhCUFpJWFU5MHZj?=
 =?utf-8?B?dy9qZzVSZ3JWS0NaaVE1Y2trblI5dHJxcTR1SW1QQVJqVm11VDZQTUtXdkFh?=
 =?utf-8?B?Yk04UWY0WmI1cVlzNzErVXNDSzJBVlV1bVVZaGx3MSt4RnBSWm43VlFWRkJC?=
 =?utf-8?B?TllLaUUzUkswd0pJSnlidUs5NTZzS2lYb0JDbmtqR1JnRHBSaHVpL2ZCdTVp?=
 =?utf-8?B?UUpkeFlGN0IyQWJHK21PTEF4bkEwM2wyZTQ4bElheTk4VStVcDFwN3hSVGxm?=
 =?utf-8?B?NldGeGhoUGxPcFZpWGUrWk1mTGg2L09ub25RMjI0WVV4UlZtSWF1UzRNVC9C?=
 =?utf-8?B?VFcwcnF5RjZnUmNhbE5YSnVDUHU5aDFsVVU4YUQ4WXBDUHBRcHdicE9sU2Vn?=
 =?utf-8?B?eXlmVVFtM1pXcStPWGZHWXIyZmJUYWFLam9pd0lQODNkdi9rSzdGWTFoUjc1?=
 =?utf-8?B?V0NPZXFZUGdjd0Z0YVBmTXduVE42dHRXWUc3aVRvNHpwRTl6dTkraldXNHhT?=
 =?utf-8?B?c3RzUGNMV2xtNEJ3T25FRTJHQi8zblpVL25NcGhtUXJhd05ldS9nSWVFWFF2?=
 =?utf-8?B?QjBJV0xoMytiN1BDci9yNjRhRW9idnFValB4c2VmMCsvRlk4V0pOR2hxMmRG?=
 =?utf-8?B?QnJIVnk3UmRkcU15V0tTdzlldjR3Mm5yekRLb0JSNVJ3M0Yrenp6ZkZRMGdx?=
 =?utf-8?B?NE1mZDhGY2U2emFiTG5wUkJWd0I0UFBsckpUUnM1aUp0bWk3alBPanBGM3pa?=
 =?utf-8?B?K0g3dk9KcWpzUjZzNVJGVHZMaTUyRWtQakdEK3F4Uy9qTHBkSEtnQkJhYkRk?=
 =?utf-8?B?QzdmcFlRTUk0VDVLQ2tEZW5aRkg4cm5PVUltcDVESVFiMVIycGQxcnBYTlI0?=
 =?utf-8?B?REFUcm5GeWNqYnFsN0dwTjZKclhQK1haK1BlUnVpSU94cXh2UTZuWXovZWo4?=
 =?utf-8?B?RVY3bndFM2c2d2J0RU1uMG9zcDlnS004QVpzSDBBMms2TFRSV1BDUFNmUjh4?=
 =?utf-8?B?M1EzaTV2RFpUZDJSdHJXN29ENHRsWE5Jd2YyVUduenJ1WGJUc0duYm45eE1y?=
 =?utf-8?B?RkFnVDJoQ3NtZTZLb0JHL3doWG95Z0Z2R0YxbU9UeUlsem03L0Vod25MUDRX?=
 =?utf-8?B?SmJMeUFreFgzelEyanVXOVNxVjZibkJ2WFNnZ0hyeFVvVFhZNzlGTlpzWEpD?=
 =?utf-8?B?ZUc0c3ZGdjJWeS81WHlhQUdyUkd0UkFyQ3prS2xtRWExd05BQUoyT1ZBcytQ?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4737a5a0-432c-47bc-b160-08dd3a3762af
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 16:19:31.1725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bx3JHM91GHV+NvxoclSfwQ6CElBrvoL7dAiOdlzV7QU7PDKBUvlR/rjpXP4unU6OcCApX8jXXRFiv9Jau1rKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8824
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

On Tue, Jan 21, 2025 at 12:24:43AM +0100, Michal Wajdeczko wrote:
> The migration support only needs to be initialized once, but it
> was incorrectly called from the xe_gt_sriov_pf_init_hw(), which
> is part of the reset flow and may be called multiple times.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Fixes: d86e3737c7ab ("drm/xe/pf: Add functions to save and restore VF GuC state")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c          |  4 +++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 14 +++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h |  6 ++++++
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b5c313a3e946..01a4a852b8f4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -532,8 +532,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>  		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt)))
> +	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> +		xe_gt_sriov_pf_init(gt);
>  		xe_gt_sriov_pf_init_hw(gt);
> +	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index e71fc3d2bda2..6f906c8e8108 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -68,6 +68,19 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_init - Prepare SR-IOV PF data structures on PF.
> + * @gt: the &xe_gt to initialize
> + *
> + * Late one-time initialization of the PF data.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_init(struct xe_gt *gt)
> +{
> +	return xe_gt_sriov_pf_migration_init(gt);
> +}
> +
>  static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
>  {
>  	return GRAPHICS_VERx100(xe) == 1200;
> @@ -90,7 +103,6 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  		pf_enable_ggtt_guest_update(gt);
>  
>  	xe_gt_sriov_pf_service_update(gt);
> -	xe_gt_sriov_pf_migration_init(gt);
>  }
>  
>  static u32 pf_get_vf_regs_stride(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index 96fab779a906..f474509411c0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -10,6 +10,7 @@ struct xe_gt;
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
> +int xe_gt_sriov_pf_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_restart(struct xe_gt *gt);
> @@ -19,6 +20,11 @@ static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static inline int xe_gt_sriov_pf_init(struct xe_gt *gt)
> +{
> +	return 0;
> +}
> +
>  static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  {
>  }
> -- 
> 2.47.1
> 
