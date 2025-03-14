Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B673C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 08:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27BE10E378;
	Fri, 14 Mar 2025 08:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPoRhchF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A633310E378
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741941987; x=1773477987;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T3RICwbJt1UZiHJ+naRSSMEjdAdpWIuqWPWiK/9e4vA=;
 b=LPoRhchFn+U6z3Njz6t0WfMwNyC1kFi9cX85HcCLCjV5niT8zMCSEfwF
 PNqB/e5yTliacEEux68X70bLuXVPCuTGJJiMRdTdt0pu9B5kfV+C22aPp
 WsRS3fK5rtvmesiyEam5/krHbpEpzv638Q85j3EP23Kd3sgZ8ZZ6DRWr2
 Db+fTIyEIbOS+TLBG1uyE72lxHjyT2AtxP/MdjshcCz4sQno2lChxkdCA
 0HhpT0fMYmm0rS6RG/4HtwW2YHUJYajBHhP/ePzSz2DLBI3bOeo+RHqBN
 e5nANCD2NM0DHzFKrSrYdVtq9evXK7L164fMQL/XFpRyUSh3tLpx8laDc A==;
X-CSE-ConnectionGUID: TRTwCrAoSk6jegFQ1Uo8+A==
X-CSE-MsgGUID: lRnmFbcoQNeAhTJUdpK/mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60625802"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="60625802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 01:46:27 -0700
X-CSE-ConnectionGUID: xMRBw4AgSey+ff/kGGihHA==
X-CSE-MsgGUID: Jue0sF8mSnCdq0waEdm53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152144661"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 01:46:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 01:46:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 01:46:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 01:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Th/5uq945cBLxhJ+34pBJ4pMbCXkIvKGpnumwT6rbTHRqGydsyIer29LZTGaqe5C5B8G/GaQMfMBNSxpD8SGorJywxkh/ZST0mAp2zTAdVdLgjTqR+gKGFUI43imBaw9Dsxf5zlgtbVUzzQ89qsAWzA6vT1ylF2y2u9V8GI1enpuAQonaN0DxmLDMs19fbQ01E9Vky4Uh2pwy4KaDQFPo3RYNWxIU6O/bN+ehAaFDgVcWaH3GKkqOqabxruBhwlUAY7dp+UePd3BIQQ8jmGZb+/t4DWCxhiwb4Qud+Em8gIGa8RbubD1wBg7+cgBu+dCFh9Vg6kc4B0vMIkWA9r5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThmUqi5lLtrWT6N8uX7uoV7ox26a8/CCrOyKwcfxVTc=;
 b=kntyv0MiigOziXaAPmdv8zBpn8lSe5V4SB9jembZ7s8w8PeKGu730vZKl9/733XqPtSmXmF0U9A6g7Z+ie+ALZcEOGetBLoUGr3MacCPgRCGv2Y5T1uNmc/LYzPo2mCpIEajyT4+wm3zToO3eky3MEXhdnSyIvOTvkcFGi/xB09dzl5g4ka1E4mUrtQlgjW12vPPFvm5/dQLkc6ZE/TEtmVsgqfrOTgEl8nV85eaja65lsvYPnG36VdEAAddtuQIKJHkYY8ZJUh0sJol0TqtbfvXY+grFjW/iuYs4e8suID+RTVYdzmG5PxkVBZUSRDG01W5RfmaC0niyvDdjJPYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 08:46:18 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 08:46:18 +0000
Message-ID: <97665538-698d-497b-9f34-248a3656af3c@intel.com>
Date: Fri, 14 Mar 2025 14:16:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 13/29] drm/gpuvm: Introduce MADVISE Operations
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-14-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250314080226.2059819-14-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 439804be-eec8-4681-b39b-08dd62d4aff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cCtNd2EwUTdJanRZa0puZUxRMmlkVDMzNEU2R2YwNDdzRmptdXlwL1czSkZj?=
 =?utf-8?B?bFhnZUFlMnp3SHdaOGVKbkhXd1l0WmZSV1RGdUdFaXZxK0VvM0h1a29LUGZT?=
 =?utf-8?B?QVlhT0tNQkhIT1dyYUFjUnZJTlpHVkdrdFBjaWp4aFRqS1ZjSFppcE8wWFI4?=
 =?utf-8?B?V2JkbHFabkdyQy9WMVZzWUpxZ05XTjZ0Qkl3OHRFckR2ajd4VWhUeTQ1d0JH?=
 =?utf-8?B?ODdReUlQN3E4T0Z2OHQwQStSanAySU1uVEhIZlpXT2IxakdCRWFKaGNMdlhE?=
 =?utf-8?B?VnpjZDJhVDdCS1NjY0gvV0xPQUpwZEE3emVPLzJuRjl3OUk0L1RtenFiL0hX?=
 =?utf-8?B?T2YzRlFCZnlRZ3pDVkY5RUtGZUVSNFZOV2ZtN3MvVlMxUnFxQUtNRnoxU1Fp?=
 =?utf-8?B?TkRibWoyNzg3Uk9Vai9QK2h1OEtxTEFLd0RudkhIYVpCUVNkQ3JQYXMzWE9H?=
 =?utf-8?B?VjczWllDelF1YzIzNGhsTG1VTkwzcXcrY0ZkU0RBZTJ0MlZPRGFobGZ2WmNt?=
 =?utf-8?B?NUIvZTJSdzEvWkFQci9GNkZ3T29WYXpOekM0cDF5cXY4Nm50V2FtR280bGtl?=
 =?utf-8?B?R0tHaFhobklUemRvdGRrNDVTa0FwUS9WRTlPRkg3T1N4bkJZd0dFdTNUSFlG?=
 =?utf-8?B?RTVCS2ZMMGhkYjR6Y3MwYytocHkvSDRtUUhHUHk2N3FGSFBzVTliVnBsQ0Vp?=
 =?utf-8?B?MmVlQWM5TWcxd0xlUmlVTVJEaG5heHhEcFlORHpjTWRWbnN1Z1ZFckRlVmk4?=
 =?utf-8?B?YVJGTnh2SlVqQzMzQ3krS3hla3h0RHppdnovb2dKN3JOS2pkY21lT1VkODB4?=
 =?utf-8?B?YVdPaFRVZCtlT2gzdW1sb3NGakMzcW92TzRNZjJJMURUeldzQTFkV0lHdUgw?=
 =?utf-8?B?QjVrTENZU25Uc0FhWDlNN2loQjF3eFVtb0xrMlRtVGxMOW1pQUxBNlRTdjdt?=
 =?utf-8?B?QjZlOXcvZlhGRksyNno4akVmem1ISys5QW1rL3VHWGFYcVg5L3l2SVNTKzFl?=
 =?utf-8?B?bHphNno3NGtzWGkvdzZTWWx5alZHN01neFZoUk5vRGdoSmxqUW85T2h6ckVR?=
 =?utf-8?B?aGErYW5RQjlPMDFXeFpXWEwweW9ZYTNZL08rTHJYeDJuNVBHOFlpeUlmWmNq?=
 =?utf-8?B?TnhtRjl3RFhiMDdCeVZUcVBmM2x2eVorYTRsZ2Z2aHFmSDBmcUhYZFA1Q0FU?=
 =?utf-8?B?WVZrazh6N3MvZEtTMy9jdVhRYi9pU0xoL1RFZ1lRcEgwVExnT1E4QTdJT2ta?=
 =?utf-8?B?TG9sak5zQmtjZVFxTDRVc1pnUnZOZ2hNY2dNVjhBbjVDVDN5aWlYOEIyNnhB?=
 =?utf-8?B?VmRzNitmbHMvT1Q5Vm04U1oyQTVtbG4yYksra1QzTXYwZmIyNk5LMC96dGNB?=
 =?utf-8?B?a0w0dXZWcjY1SFhxQXN6T0FkV3RzZVovWS9vbSs5Wk5WK1NwMjdaUlByaGlV?=
 =?utf-8?B?QzBJa0pNOG5xRVoxc2lndVkxTkE5YW1CaUFGbzUwWkxDSnNrSjlqWVUvMkZ6?=
 =?utf-8?B?K1Y5RDdjaWhEWG1oNXR5RTl6T01oWCtTSVBrY0szOW93WThyUGdDMkpuZHlD?=
 =?utf-8?B?U0hhd0Y5MTNyVVZPMjNnOU1aVlFUWG9PN2ZEbGtSR3BUU3BHbSs1QmNjTTR5?=
 =?utf-8?B?ZlZMb3B4QUhyaG5pTWorOXFzTTROVGVZZUFmK0ZLWlJBUDlXOGgyWitvTU5r?=
 =?utf-8?B?eWZSa2pzRy9mTSthd2VYVkdPWGZFK2Z0eHRZcGY3WVdTc2dlN0pZampNNVA4?=
 =?utf-8?B?OWUxVkt0cmF0ZkFUZUJJRUhoTWVzUEg0alF2UTNNV3FqUXlhcnFlTjVOb0xy?=
 =?utf-8?B?dmNDd2JGMEhJQ0swcFN5VkdqRlR1YWtlYjRuVTNSRW1CYjZhazhnT3FzS1p6?=
 =?utf-8?Q?ZRhKUSc3IEyd+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNKME00YXhBcHp4ME1iUjdMWUFWWmRHbDhXR09QZnFMN0RPMDl1TTEwckFX?=
 =?utf-8?B?WVZ4Z0VnMm9vQ2U0RmRqR3hBU2VQRytSUTA4Q3pJOHIzZUZLZnpQRDBiNXVp?=
 =?utf-8?B?VDdIVnVzL3dFOG1QY3U2d3I1UWxtYWcrU0NJT09aTk1iU3puYTJGbmNOOEVE?=
 =?utf-8?B?SmdiUitjRUtYNHllczRMbFUzQysyVHJHWVQ1dmU3ajUyMXc0R282azVXWG5R?=
 =?utf-8?B?R0dPN3pYYm1zd2wwc05vbkZQQVBZRVZwNnBjcU1NTm9oODFwcXNBQXRNRFdU?=
 =?utf-8?B?Rmx6eGthUHlPVkhFT2JuL0tKejY0c05aTnczYUhmR0lpbXRrUFA5Y1lxcVdj?=
 =?utf-8?B?QkhkZDhadWxvRktiU3NJMkhnUHY5cC9rbElmRkhscU0rWGtSZU5UR3lrS3ZD?=
 =?utf-8?B?S21wZytVRFVRQ0RPYmJJTys4b0Eyc1BUNW51RWRyK1MwNURDOFFaTkR3M3pV?=
 =?utf-8?B?TG9ndVFIZnF6QlROd0x0azBUZ1lIOHFwRE9nbHR4UmJNUHgxM0pVaWVucEg5?=
 =?utf-8?B?WVo0YUpGb3NtckVQSU4zSEYvekF5akdjeGxZL3Y1SHY5dEtGL3NNOTU3TWkv?=
 =?utf-8?B?ZkM2YmE2WThkbzRYTyt5SDlaM0pyVCtab2tEZVowSWJaeEdTWjFmRmR3VnhJ?=
 =?utf-8?B?YWNWSzhkaDBqRzNldU12SDJYQkZLWFlPb1N3aU82bkdLR2JuUW1NZ2xiVkMv?=
 =?utf-8?B?Yi8wdUx4REVLb0s0R2gycEZtYnp5ZFhmSjU5a0VDelRrY3FzZ204NEJSTVVH?=
 =?utf-8?B?YjRabk84eUUwSTJjZUE2eXBJeStjUGtOZUlwdnlaVlJNZVNIMERaSU5nRnl3?=
 =?utf-8?B?SDB4K202aFl2YmVBZ0NwQWZKbmRtYi9XcjRmbmNaVVpkamUxSk1UdFBxQWRy?=
 =?utf-8?B?YmFoUG9BNVE3ZlM0WGZFaEFQS3dubEIyQkJSSGJvckR4cWYzQ0hFcDhZenhR?=
 =?utf-8?B?aTBwYmhJeS92OFhtMFRRTnJzREx2RnEvR3BqTFN0TThvU0t6MDJXbXVIZEw5?=
 =?utf-8?B?TE92L0k0YWZ3d0Y0ZCtCTTVwUDIyeWUvdkxqZ1dwdzltcUlIak5OYzB0cEJx?=
 =?utf-8?B?U0lmTlJyemowWDZLM0M5c09IUzRYcjJ5SUd0WURiZEx0RSsxNTFZZk9YQ1ly?=
 =?utf-8?B?ZFowNlRQS2JkNjdmQ3hLcXpMOTZtSkRHVFJPYm8vZWdUZnJsUzhMaWlBbitV?=
 =?utf-8?B?cGJPWEtacjhzZ2FOOWs0RDhIcFdYd2FqOHNOT1NNcU8vcS9mc1VmenVBWTJJ?=
 =?utf-8?B?c01LYWhhQzZNMHUzVGxoalIrTlc3anlxbHMxNTMvczZla2xyN2NzTURkbld4?=
 =?utf-8?B?NXZ6M2dPa21Db3NzMGVJQlNHQUlmdjJ1dE9pT1FaMmFMRG9ab0dFeGRhb3c4?=
 =?utf-8?B?WmorUzJpdWIxcnJmVVhUK1BaRkhqZ1hQN2ZEdEdmRU90dDR2RUFjUm5OeGVQ?=
 =?utf-8?B?OFo3bmhpNjQ2WDVHd1BaVy9nZkphaTFITGhJK1daQndZTXMzWm5qeVkwSlhT?=
 =?utf-8?B?aDhhR0s1cCt1ZTM4RzRPNU8zZEZ0TThnWGZOSUdBU0tNZ2pkOWdmYTBFWVFn?=
 =?utf-8?B?YlhFYzllOXNKcHhGQ3V1MnB3alhiWVNaY2dkYWNPU3lyRmtXOTdqVVRiRzdT?=
 =?utf-8?B?Z1ZJRWx3bEpqVlV5ZUl6K25GbXJuS3NTODBYUzY0YklHUng5TlZkQWdXV2F5?=
 =?utf-8?B?VDVWdGh3MGk5VmlrYkVsdzNJZDN0Q0krU05WYUprbG1INmZZOWRieDF6MUZl?=
 =?utf-8?B?MVJVb2hTZGlKTm1QTlhqZWxoMUl0cE9BSXlOY1JMMjJnZ0p0MGJYRi9sMHor?=
 =?utf-8?B?c29pT2lWRm5HRVloNDBIN1VsVFNFK1ZTUHd3YkFjZDNQWXVDMzhUZkdrb3NP?=
 =?utf-8?B?YjBLcGpUZU9HSWhsK0lZMFovMDN3VVJYWGVKYXlHV0tRTktySVlvQy9OMThR?=
 =?utf-8?B?VGRudm85cDlOeUZ5em5rT2hwVlNUWDdTY2YwSysvQkVMN2pXMndFa0hUbzF1?=
 =?utf-8?B?NVViY2FiSGNVZzlNZXVGWUh3Z0J0cGhkWTcvRk1WS2gvUjAzSzJTRlptY1F0?=
 =?utf-8?B?eGVybzNiY1lOc3JLN25vZG5zdDRZc0ZkRzFPbXQ5eG5XTkluYmVsZlUza2t4?=
 =?utf-8?B?V0t2dmRVTmF0cXhHUlJQZElXdHZVc2FmdDRJR0dGeU5yVnZDYnc4VWNTdjF4?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 439804be-eec8-4681-b39b-08dd62d4aff5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:46:18.4409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zP67f7I38cgLYcSO7QtG9V0RNchdd1PGitH6UGAa0Nc4O9+gcldX4DYw3m7eDN4QMDrhiE0WJfs5KwPRvVEy2vqWPyydIhEefDH5CwUbjhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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



On 14-03-2025 13:32, Himal Prasad Ghimiray wrote:
> Introduce MADVISE operations that do not unmap the GPU VMA. These
> operations split VMAs if the start or end addresses fall within existing
> VMAs. The operations can create up to 2 REMAPS and 2 MAPs.
> 
> If the input range is within the existing range, it creates REMAP:UNMAP,
> REMAP:PREV, REMAP:NEXT, and MAP operations for the input range.
>    Example:
>    Input Range: 0x00007f0a54000000 to 0x00007f0a54400000
>    GPU VMA: 0x0000000000000000 to 0x0000800000000000
>    Operations Result:
>    - REMAP:UNMAP: addr=0x0000000000000000, range=0x0000800000000000
>    - REMAP:PREV: addr=0x0000000000000000, range=0x00007f0a54000000
>    - REMAP:NEXT: addr=0x00007f0a54400000, range=0x000000f5abc00000
>    - MAP: addr=0x00007f0a54000000, range=0x0000000000400000
> 
> If the input range starts at the beginning of one GPU VMA and ends at
> the end of another VMA, covering multiple VMAs, the operations do nothing.
>    Example:
>    Input Range: 0x00007fc898800000 to 0x00007fc899000000
>    GPU VMAs:
>    - 0x0000000000000000 to 0x00007fc898800000
>    - 0x00007fc898800000 to 0x00007fc898a00000
>    - 0x00007fc898a00000 to 0x00007fc898c00000
>    - 0x00007fc898c00000 to 0x00007fc899000000
>    - 0x00007fc899000000 to 0x00007fc899200000
>    Operations Result: None
> 
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/drm_gpuvm.c | 175 +++++++++++++++++++++++++++++++++++-
>   include/drm/drm_gpuvm.h     |   6 ++
>   2 files changed, 180 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..904a26641b21 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2230,7 +2230,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>   				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>   				if (ret)
>   					return ret;
> -				break;
> +				return 0;

 > -				break;
 > +				return 0;

Incorrectly left in patch, ignore this part.

>   			}
>   		}
>   	}
> @@ -2240,6 +2240,143 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>   			 req_obj, req_offset);
>   }
>   
> +static int
> +__drm_gpuvm_skip_split_map(struct drm_gpuvm *gpuvm,
> +			   const struct drm_gpuvm_ops *ops, void *priv,
> +			   u64 req_addr, u64 req_range,
> +			   bool skip_gem_obj_va, u64 req_offset)
> +{
> +	struct drm_gpuva *va, *next;
> +	u64 req_end = req_addr + req_range;
> +	int ret;
> +
> +	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
> +		return -EINVAL;
> +
> +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
> +		struct drm_gem_object *obj = va->gem.obj;
> +		u64 offset = va->gem.offset;
> +		u64 addr = va->va.addr;
> +		u64 range = va->va.range;
> +		u64 end = addr + range;
> +
> +		if (addr == req_addr) {
> +			if (end == req_end)
> +				return 0;
> +
> +			if (end < req_end)
> +				continue;
> +
> +			if (end > req_end) {
> +				if (skip_gem_obj_va && !!obj)
> +					return 0;
> +
> +				struct drm_gpuva_op_map n = {
> +					.va.addr = req_end,
> +					.va.range = range - req_range,
> +					.gem.obj = obj,
> +					.gem.offset = offset + req_range,
> +				};
> +				struct drm_gpuva_op_unmap u = {
> +					.va = va,
> +					.keep = false,
> +				};
> +
> +				ret = op_remap_cb(ops, priv, NULL, &n, &u);
> +				if (ret)
> +					return ret;
> +
> +				break;
> +			}
> +		} else if (addr < req_addr) {
> +			u64 ls_range = req_addr - addr;
> +			struct drm_gpuva_op_map p = {
> +				.va.addr = addr,
> +				.va.range = ls_range,
> +				.gem.obj = obj,
> +				.gem.offset = offset,
> +			};
> +			struct drm_gpuva_op_unmap u = { .va = va, .keep = false, };
> +
> +			if (end == req_end) {
> +				if (skip_gem_obj_va && !!obj)
> +					return 0;
> +
> +				ret = op_remap_cb(ops, priv, &p, NULL, &u);
> +				if (ret)
> +					return ret;
> +				break;
> +			}
> +
> +			if (end < req_end) {
> +				if (skip_gem_obj_va && !!obj)
> +					continue;
> +
> +				ret = op_remap_cb(ops, priv, &p, NULL, &u);
> +				if (ret)
> +					return ret;
> +
> +				ret = op_map_cb(ops, priv, req_addr,
> +						min(end - req_addr, req_end - end),
> +						NULL, req_offset);
> +				if (ret)
> +					return ret;
> +				continue;
> +			}
> +
> +			if (end > req_end) {
> +				if (skip_gem_obj_va && !!obj)
> +					return 0;
> +
> +				struct drm_gpuva_op_map n = {
> +					.va.addr = req_end,
> +					.va.range = end - req_end,
> +					.gem.obj = obj,
> +					.gem.offset = offset + ls_range +
> +						      req_range,
> +				};
> +
> +				ret = op_remap_cb(ops, priv, &p, &n, &u);
> +				if (ret)
> +					return ret;
> +				break;
> +			}
> +		} else if (addr > req_addr) {
> +			if (end == req_end)
> +				return 0;
> +
> +			if (end < req_end)
> +				continue;
> +
> +			if (end > req_end) {
> +				if (skip_gem_obj_va && !!obj)
> +					return 0;
> +
> +				struct drm_gpuva_op_map n = {
> +					.va.addr = req_end,
> +					.va.range = end - req_end,
> +					.gem.obj = obj,
> +					.gem.offset = offset + req_end - addr,
> +				};
> +				struct drm_gpuva_op_unmap u = {
> +					.va = va,
> +					.keep = false,
> +				};
> +
> +				ret = op_remap_cb(ops, priv, NULL, &n, &u);
> +				if (ret)
> +					return ret;
> +				return op_map_cb(ops, priv, addr,
> +						 (req_end - addr), NULL, req_offset);
> +			}
> +		}
> +	}
> +
> +	return op_map_cb(ops, priv,
> +			 req_addr, req_range,
> +			 NULL, req_offset);
> +}
> +
>   static int
>   __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   		     const struct drm_gpuvm_ops *ops, void *priv,
> @@ -2548,6 +2685,42 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_ops_create);
>   
> +struct drm_gpuva_ops *
> +drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
> +			     u64 req_addr, u64 req_range,
> +			     bool skip_gem_obj_va, u64 req_offset)
> +{
> +	struct drm_gpuva_ops *ops;
> +	struct {
> +		struct drm_gpuvm *vm;
> +		struct drm_gpuva_ops *ops;
> +	} args;
> +	int ret;
> +
> +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> +	if (unlikely(!ops))
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ops->list);
> +
> +	args.vm = gpuvm;
> +	args.ops = ops;
> +
> +	ret = __drm_gpuvm_skip_split_map(gpuvm, &gpuvm_list_ops, &args,
> +					 req_addr, req_range,
> +					 skip_gem_obj_va, req_offset);
> +
> +	if (ret || list_empty(&ops->list))
> +		goto err_free_ops;
> +
> +	return ops;
> +
> +err_free_ops:
> +	drm_gpuva_ops_free(gpuvm, ops);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_madvise_ops_create);
> +
>   /**
>    * drm_gpuvm_sm_unmap_ops_create() - creates the &drm_gpuva_ops to split on
>    * unmap
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2a9629377633..e521ebabab9e 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1062,6 +1062,12 @@ struct drm_gpuva_ops *
>   drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>   			    u64 addr, u64 range,
>   			    struct drm_gem_object *obj, u64 offset);
> +
> +struct drm_gpuva_ops *
> +drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
> +			     u64 addr, u64 range,
> +			     bool skip_gem_obj_va, u64 offset);
> +
>   struct drm_gpuva_ops *
>   drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>   			      u64 addr, u64 range);

