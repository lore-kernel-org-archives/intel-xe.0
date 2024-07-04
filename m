Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E865C2BD09
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 03:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED7F10E331;
	Thu,  4 Jul 2024 03:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W06Y70Ef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A53C10E331
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 03:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720063058; x=1751599058;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q0bfXunVEVIpQoyeJqB/X7e3sQkUkq58Pr5HEjeRKrU=;
 b=W06Y70EfzYICGqEVhkRiPcnkGfOFgidAC0WVINZaDZaEx6GBosLvGfYv
 0CAKwhst4E0pCVP97oadLAZ6Pq8fBqg2nxSWbaZwG05fqM/RmSWfGyiB/
 zrcrJhs5f/JN1L4SPvcFeD+6CrCtevZFb1gPM8G23MPIwMCe565YqZjxW
 epozNKM+AuaHoWPkl0YSwC1hmdJYjBu3IVA6s+y9A214iOvAksl46MZDK
 Sgeu1B+ajh38oTLQhIr9r/13k9HNtpVafAejXrTW/Tu8f8bCT3NdQMs6c
 MdDugl300CdArnUsVdz/oqvKZ5zjkqAp5b+phne9MHIkk8VEHV47vSALD w==;
X-CSE-ConnectionGUID: vRvIK/VVR4ileraOfG3zNw==
X-CSE-MsgGUID: 5ST3S7CLQhirl+5i1dWHqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28465515"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28465515"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 20:17:37 -0700
X-CSE-ConnectionGUID: YYadwiyaRiefrRTh76yJpg==
X-CSE-MsgGUID: XIe+15i1Sfe2q6A7uPEQGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46876575"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 20:17:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 20:17:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 20:17:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 20:17:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 20:17:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADPnjt/M2zd/l6fk5E9kSqbN1Jy7o/OAE12PDzITe5q25bwASNieGBJbp9DKPiU/g0x2QLQyyZ/hB3t+juCN5Za4Z5hZdOEIkBOLxqqw/w8qII1nC6a7HXlLBucXmSOUfrV7YhkEj9r29IB7Nuyyojag5UbRs824KheJwyxY8LBS4C/UCVq7z+WLTnaFYwTjgjwYRTL2JI4OXCeEAbvKoF3j+2lhihCJgjVgJyID4e3YTwa8li5n0BIj44qvaLTkbs6McpVQnCfaho3ZAgaT5kBiFIYtBjNam97b6svRPGICXxuB3Kt/bsAsdjZxTtgWdmMS3VQHi/fwO6ONGun7NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVwWVaSKRpjFISy5dhwY+yXsKQgb2KsarkosCQhu17o=;
 b=QPo7ttKeZs6tKuhnOQXy6Dpsz0y+ywLZQUTSrwmhbkWPHKCEYUWMDOx4TGvgovTn5zTOtFJT9OnSA2RwZBqSrmWOZmYIErOeTzkgDC7Uwbhlb3iZmdo1lTVZABBbgzz3UJzAyxHQ0TM6tN2ni8gSCePboSZyiaqBEl7WZlq6nDEf0EHx4u5G7kYuhxh5GWimqVWpJ27mGnKeyUdx8S3p6T2EruO6rZG1wJhUL4lki9qkiDvKFyR5Somqk+ElucfQFxDPSrl/SgnJmK0MZneYl6VCMsT3v29JromNaXSUGd8JKba5TFQUn6H6kUMHFozGkO9Fg6i6CFcmi41nykTPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Thu, 4 Jul
 2024 03:17:27 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7719.028; Thu, 4 Jul 2024
 03:17:27 +0000
Message-ID: <03ee425e-bf6e-40fa-8f57-61bd667e46ea@intel.com>
Date: Thu, 4 Jul 2024 08:47:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Fix register definition order in xe_regs.h
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
 <20240702183704.1022-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240702183704.1022-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: db6b03f6-8929-4e76-7859-08dc9bd7d4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjA2SytMTjN5ZzFGck4yUXNwckRJdStZZ0dUbUpOeFBCY2NIeHRzbjZETzR3?=
 =?utf-8?B?dXA3ZWE0dmpxZ1kxVGVFTjhTV2RlTjZRQmtqUjJOZWFjcmNtc1RnMXppZzdw?=
 =?utf-8?B?UEt4cmxpMXh0azRaL0ROTUFWdnlSREFDaUlnOGhHaDBibWE2WUx6eU9YZmZR?=
 =?utf-8?B?SDVpd0RSdWNrNmhSKy9TZGQrRUV2R29zRzZQcjlqUkFyWWh2RzYyUUdFSW12?=
 =?utf-8?B?S0UrMWd0WmIrMm4zU2syeFcvUHJOS00rbHd6a21kWVF5NVF0TjhBUTFzTzVm?=
 =?utf-8?B?VkhZeUNnQ3FhMGdzOGJtUi83TnFpRTBBMVcyWGxQdDhVUFBHVGMwUVcvcExW?=
 =?utf-8?B?NGhFc3lNUnV3ODVkVlB4bEh1c21TNkwzM0F4bERlZlF2RUlKNHI4L2lWazcx?=
 =?utf-8?B?eXNJZzUrNm5mWGpieVBGaVE5V01mZWd3cTZaYlpQanRrR0JtTkwzbTFOLzFv?=
 =?utf-8?B?dE93dEtHUFlMTG00MSsrVElCMUtSS0Q4YzV2cTY4MlFwOWJiR2w0SnFSTnY2?=
 =?utf-8?B?T2pyaEozMXRWRWNYajNKcERKaHVxMUtwMC82VzAwMXI0Y3daZkpML2tERmtx?=
 =?utf-8?B?Z3NDdkMyakhOMmZpVTQ4WDlHdDBCbTk1L1Z6RXJuUXR1ZmVwNmpyM3VpMFpn?=
 =?utf-8?B?TG52SXFTeXRVUDMwMGpEcXN6TlFONkNBMktrcnlHZ3o3MFJpRVFlazlGSlNL?=
 =?utf-8?B?dm51MzloeWEvM1J6Y0lEVkx6cXR0NUdyZCtuNzd2dGgrZVNFdE14OWxDbDhJ?=
 =?utf-8?B?WFM5dlByUmdxbjFTazcxREpKNFBXSHlNcFdyaXZPYkJtb200MFlIeTBXRExE?=
 =?utf-8?B?WmxlNm1URkh0RGhsZHNWNnBjTnQzaW9mdUpXLzNIQWVUcTRaRkpGUFI3aVo2?=
 =?utf-8?B?Zkp2UVJDZkZZUFVwcmNtaDU5SXpEckc3QVZFUHl0TGdnekdOK3U4amdTMk5h?=
 =?utf-8?B?TGE5ZUtIcFF6aHJoMmdMSW5hNFQ3VkNySlltdFBjMkMrbFRwYXhlVHg3N0V1?=
 =?utf-8?B?c3lRT1FGek9acHdySnFINVB0d2hYTWFaQkd6NitJOVptM04vYm9pRkdFMEly?=
 =?utf-8?B?ZFBCMStGZXVtWCtaMzRhYm4zbWV5bU9WQlJXSFY1b0dQNGszOWlyQURzcVM3?=
 =?utf-8?B?VzIyZmlpcGxrWno5ZmRPcFBTWVR3VDc3M3lUOGhZV3hzN3dZZ3RWQWxOMnJt?=
 =?utf-8?B?TzQzdDJZV0UxNTZUaTd4SnRJeEVmeFF0QjQwbHpVY0gzeVFzU1JHVnNra1FH?=
 =?utf-8?B?RmxmZmpRYmZjSjI3Q2lOWE96YzZyWHhjTGN6bld4TytGdU9JdWU3UDQxaW1W?=
 =?utf-8?B?STRNeEpFc1RYSDhvc09TallpTzRjZE9EdjdGakFRVEErZlpQek9qYmdvY2ky?=
 =?utf-8?B?Z2lnQklHcEp2NkdTQVhmR2VleXpsNVVHNWdPeC9NNUxHQVdVTDdGS0pIdW9U?=
 =?utf-8?B?L3hRUFFIVDZEV3F2OUpXY0pROVBzZkowOU9oZ3ZiWVVoTjNaNU8vaFo5ZXhG?=
 =?utf-8?B?ZzVPa2xJYjMrcXdLd0Zidk1ReGdVRDZBd3ozSWE4ekJGV2dBZWFuOFhCOXc5?=
 =?utf-8?B?T2NzQm13eW01dEIwNFgzM093cXhwcnhZcVBwdWFVVjMzZzhidFdPcldIWlhl?=
 =?utf-8?B?cVhER0c5bDV0dHRYWWxtdTdQZHNRbDE2VlJRcFFEYTdBYXdDQzd6UExuZnpY?=
 =?utf-8?B?b21CS1pXaW12aVZmdjdXTzkwVUo0aW5hQytsMnhzbDJYQ2RaK3NubEhoZTVi?=
 =?utf-8?B?Y3pwVGl6TXBMY282V0h0MUQvdmJCMmVWQWZ6RmFFajRHME5ldEtPWGExZEVl?=
 =?utf-8?B?ZGVWM0Z2YVBaMXpBd0ZTdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlMvb09LRDVXV2dBejRqUmZCQ3lZRDA2ZFRqVC9VUEJxekZzbkFFK3pOTFNv?=
 =?utf-8?B?MkpRRVZna0lCdVA2SzM3cWNySEpvRzFtUFE2TWlMTmVEVlRjbGNMTmtXNE9p?=
 =?utf-8?B?c1RMVUVjZ0hkUEtXTUpwUzFtaS94MUlGS0QzSzNWanZIejJkVWNqTlQyUWlp?=
 =?utf-8?B?UGNYT1VRbGhuMFNudHl1dkQ3aUdvR2hWb3VsZ1d4T2Yzckdpb25mOS9ld2Vw?=
 =?utf-8?B?ZnZWZlRaNk5jUVNLWFlCZExoRFdCUk8xNTdTUkR4MnUxZ05kSEVyYk1IT2pD?=
 =?utf-8?B?T2NhMldqNGNkZVhtWnZUVXowUnRJcWZid2xJUHVTZTFLWkY3OVdOazlybGF2?=
 =?utf-8?B?TXJiL01iekpHdTFPOTQxQ3BZd3U2Uko1UWo0aHRISXNCeVpoeE04MUYvNnFB?=
 =?utf-8?B?TGs5bS9xNkkrek0rRS9JdUx3cllwZDZaTUEzM1N1V0hmSkVCNEFvUEQ3b244?=
 =?utf-8?B?Qm1UY0R6Z2Q5b1h6bFllTFM5NjB1SVVtTzU4a2hYSWhkaDFWdmFIZ04wWTNU?=
 =?utf-8?B?eTBDSVNjRDhpOU1LWVY4cm51OGNlNjdHUnorcjBma1h2M0tWMnRHcjkzeFNG?=
 =?utf-8?B?NXNPUWV2R2VCRG9aOU5YbXQyeXg3QVpKUkt5dlBRV2lNcEtudEt2bk1MMGhh?=
 =?utf-8?B?L2RTRS9YbHVlVDU4YmFiaWZEZmNQaTRING1NNUZJZlVwTmw5dHpBNFZqM2FB?=
 =?utf-8?B?cGZKV3RWSGVZdVc3N2h0aWtyekFId1lobUtJLzNlZnd2T0g5NnNhVVlEaHRz?=
 =?utf-8?B?QTRLODJZYzhoZWZxWjFCMFEvR3Y0MnZvOENiVFlub3RudE9Dd2JQSzdteG45?=
 =?utf-8?B?UWljNGhxR21mdTd4N1NqUENlQXdUTGZ3TnVQU0pTYXpNMlR1aWpyWnpKR3RC?=
 =?utf-8?B?cEVLelBPM1psNllRMnk1cXEzWDc2a0NTUEZqNGdFNWlRZDRWanAxMEdkd2Q1?=
 =?utf-8?B?bEdTNXYwUUZoSkd4cmovRDh1NEwyYU5kUmthZ1lLVDFLYUlIaUlVeGNVQTEy?=
 =?utf-8?B?RThGWEhnVXdmMmdRbmxWMHBYSll6ZCtzV1NEbk5OTjMzRFE5ZnRZNTYwY3po?=
 =?utf-8?B?TExJUE0zeWJxeEN4aTJmVk43WmZjZEI1aU84K3hhUll4ak5JU1BjNGY2NUd3?=
 =?utf-8?B?TjU0SWgxT3F6aXNNSGxZNGdWanlFbm5UK1JKaXg3aVdxNFVOMVdDMHB3Qm5S?=
 =?utf-8?B?c0lnclFMVGhFYSs5dDRqcHdSNEFBa1h2NmY4eEw5RHhtZ2cyWWFUWHR6UEx3?=
 =?utf-8?B?Y25LMkxqWWtxaFhncXJ6M2graU5PRWg0YlBnT0RUd1Z6ZFlSckFoZ25hK1hX?=
 =?utf-8?B?dUNwWWdyRk0raDJUSFpPMWlLdlBzN01NRnJYallWWlR4bmNjQ3I5UFJva0cz?=
 =?utf-8?B?TVV3bmRNaDBhaEh5UC93ZlRtSnhQT2diMTE5MGsyYno2bjJKM09xY0t1SUR2?=
 =?utf-8?B?MUJvNWsyS1VpRjVZZEtVa28rT01vN2ZmVFVEa01IczRaaFJNekRBOWI4Zlhl?=
 =?utf-8?B?TWNUbFRFYk9laVF1VC9QYkQrNXNBekJOdGx5R3RWR2c2UmJKRUFxeGZwTW5a?=
 =?utf-8?B?SVMrM2J2d0RZWE9vWXhLd2Y1clJabVBPWlFZWmRwNUMyaEdsMEEyNDF3b1Zv?=
 =?utf-8?B?VTVVWUFJK3N5MHJkdkhSeGEwKzFra09CUTZPc09RVEtJM1U2T0Fsa2xZTmx3?=
 =?utf-8?B?M0ZFOEdjN29jNjdNcTN3QmtXSDFzeTBLTVVXYjhVbmN2NHZtVFZuTm1taVlC?=
 =?utf-8?B?UEVHNFFLdlZOQ01jMlJSMFVtU1MydTVqdTh2NzAvblNlcDYwV3NKbnBFUHNr?=
 =?utf-8?B?REYxamcyRlpiSjlhT1RvZklGajJHOS9RSWl5bmo2U0FNTDNKRWRLL2JjU09V?=
 =?utf-8?B?T0pMOXZ3eVRrbkR0MlJVWk5Ed3F3UmJ4WGI1dkpGcXZGZ0JPZmVmUGhhTlRs?=
 =?utf-8?B?dXBCZWRBQmtiZXkrYjJBam1Ydi9LN09jNFlvcjZ2Ynd0OHBaSXpYdVVORWZj?=
 =?utf-8?B?YnovU2hLTi9Ia1hOc2J0eEN1WUtUTCtMZXIrK01tL3h3b3RTeSsvSEJhYWt0?=
 =?utf-8?B?SjRBakxqNG80QlVJTjZnOTl0VUJzZCtpdit5UCt5cFZCTWZZTXJsZ1F4VFJG?=
 =?utf-8?B?MHo1UDY5dUttbnJ1VzBsVHY5Z29PSXkwb0paMk95Ymc1dUx6NFRjdEcwQ1Rz?=
 =?utf-8?Q?rEiLynw2S5aq6JWZiujy6N8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db6b03f6-8929-4e76-7859-08dc9bd7d4eb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 03:17:27.4862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1/OOUl5WZWihkKgj29g7LtjMnLQLF77WQbp1+JSGfAVM5P6DdJCT1TKXc7BS6bX9UV9pM6k8C17zDVsz8+mq7A0+i80Vca+IzjYQdi71VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
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



On 03-07-2024 00:07, Michal Wajdeczko wrote:
> Swap XEHP_CLOCK_GATE_DIS(0x101014) with GU_DEBUG(x101018).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_regs.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 23e33ec84902..23ecba38ed41 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -24,12 +24,12 @@
>   #define   LMEM_INIT				REG_BIT(7)
>   #define   DRIVERFLR				REG_BIT(31)
>   
> -#define GU_DEBUG				XE_REG(0x101018)
> -#define   DRIVERFLR_STATUS			REG_BIT(31)
> -
>   #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
>   #define   SGSI_SIDECLK_DIS			REG_BIT(17)
>   
> +#define GU_DEBUG				XE_REG(0x101018)
> +#define   DRIVERFLR_STATUS			REG_BIT(31)

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +
>   #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>   #define   TILE_COUNT				REG_GENMASK(15, 8)
>   
