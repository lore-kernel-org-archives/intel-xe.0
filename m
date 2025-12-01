Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D44D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 14:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1658897C8;
	Mon,  1 Dec 2025 14:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuV3DuhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0418B897C8
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764599110; x=1796135110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jK//NQSKcGG+NdLfV28RhUtZVHOV6qPeNiRpap9WMj4=;
 b=AuV3DuhGRStsMa8Y5NMvxXnYBAwiwa6VfpWRxVcJXFLlZOw0bDhZcZwu
 EWIjaDM5qi6wn21IQKgEKg0JhlOzNr9egHT4K73t3KVDpzPIdPyu3ArkW
 YM9HWM9SEiOVxSUAE8A8cIWnhoN4UwF/6gKXXNVDL3HsPPZ+m9AbFwxUP
 +gav3X7omD1WW7DfnP8pCvJbOGtdHLyyH58dp63q+wK0NXaJIXWZOpSWm
 j4ixmgy0rxNNv5NcCht9BvXvO7bWY30qA1QJLEpLHvmjnscmJhbi4MMOL
 O7rENy3oI1vBzo9mnAw1yDkhC6GZRjlTEsD3qS/KDFLw+dgj4d/SUiJ37 A==;
X-CSE-ConnectionGUID: LXsuCi3aTw2J7NIgDd7E5w==
X-CSE-MsgGUID: qH2IRSvBTZ2f5YHLsHVgUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66429135"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66429135"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:25:09 -0800
X-CSE-ConnectionGUID: AxCX0dELT4S1gNaoCPy1jg==
X-CSE-MsgGUID: gXwXbREMRtOoaQiAMhXfNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="225065249"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:25:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 06:25:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 06:25:08 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 06:25:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaounMj1DHk3hAG+efjdOTJwkheEVEmSl/c25r3pcq+1/ja4vYmOH8v55enOJOYjeZzvw1NTvFN21AQtTy4SGi0YtuBMSk+O9tgnrwOGAkKpe4dApySeIYwGVx3Xe9dhlJLNww8pXUCXkCK3lgqEgdHqiQmL1LngGbDyS63lzqSuEjpIJ2IX9ZbUbzGRJVwi9620DF33S9OKLgCZ9mRPo3KXSDLfC81CNkBpSNKJ+DSqOjsQ3wLFLQZ7d3p4ekqtIQzndD9pXn/0aVmL+bRBAKi15rxG+bdXr/ZM2t3QS6faZi6yAePzKT3TdznXo902Axnmlv38Fi1wLLwETJO+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ii7hRr/RsIjr/ZK9qcjcyPDkdE1prCB+NZ8svAPujNo=;
 b=UAiw18VW5b6o64/ZjgHfLstO0iQbl9Lhlt6v89Av64l5B8OHXZE/RHzkey7WlFyjvO32cKnOIBMuzZ2PVx/2Qk+WLEbtYzpqnoj/vz6vWH04l6mWuX7hyK24DBVa1Y0v2bCHe85QVMGbmRC8Jd3cn9s9E/We5ysw+AUXIeDdqRL/fj3Lf+/JXaaw+EoIc3thqzL1FYFofK3oanm2ft3bT4/g7NSl0u11/yNhpl+szZsTS9QpjyRauMtAV6vxPVMAyKZHJnVKZLYbQiM2e1wEkvnavI21Mj/w26QyEeMfekFAb4jFN3mfs/Y2UyFGnvhkAquEh9F6t00zb7h/yqbXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:25:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:25:06 +0000
Message-ID: <2f5810a2-1ab9-4624-92b0-faf376084909@intel.com>
Date: Mon, 1 Dec 2025 15:25:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] drm/xe/vf: Introduce RESFIX start marker support
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
 <20251201095011.21453-8-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251201095011.21453-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b6e667-84f4-40cc-2621-08de30e56cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlRmU3E3UUVPWVlsN1FRYWt2cGswNzZTbnBMaEhtejJDOEZQd0cwZnZxa3Jn?=
 =?utf-8?B?WVJKdXNyRHYzdGc5dmdtdXlJZkVpZ1orMkRoZ1RlQW1ta0MwSkhLWTRobjdu?=
 =?utf-8?B?ZWRPeGhXTDkxTDJDWE8wS2JzNnBSY0tZQTJ6SmJzUS95bUhDTGpFQWFpQkxQ?=
 =?utf-8?B?RktoUkdPdmpIRVJQS2llRTFTL3l6czdDTWptNFl2cjcvRlBXTGtXa1h6RGw4?=
 =?utf-8?B?YVhMeC9QSjM3NzFmTXBVK3BOd2pOL3VLYnVVbFhvN3BoNHh4RzJhSFpKMzJY?=
 =?utf-8?B?cGs1V2JXTlBlV1dLdmk2V0t5ckd2TDVEbjlta2tCWFNMVFB3cE1wc1BQODZU?=
 =?utf-8?B?MWFCK1lmcWpSSCs3c3ZUY3RPZ2RBVE5BMW11dDdYQlFka2VWcVVDQUNXaWNX?=
 =?utf-8?B?K0VWTWFUNGFtK3QvWnBORE9VRTc0NDdpelNQbEVDTWxobldxY0RBenZUd3ov?=
 =?utf-8?B?ZUg1dEZTaXVSWU5NOGtBaVZNMEx1UlZZVmJWL1JEQzNpZlBKQ3liVWphbmtM?=
 =?utf-8?B?NldRZnUweW1JQmdUNzF6cFFpS20rN0hCVlVna1dXWmhJTG9lODQxOG81N09Y?=
 =?utf-8?B?ZzBCTW9tSmcxZzViU3JLRzh0MDBjQ3NhRjFlNnQ0em1OTGxNanNGclRJbWVq?=
 =?utf-8?B?MVBVcWRoMmdCZWQrTE9rekgzU3RFTW96by9hRlF0bmh1NTBpaThvZ1A1MHBp?=
 =?utf-8?B?UU16M1hMWXdweU5sWWVnMWVEcnh2NHpkRVBXbzR5UVdkZzBMRml6ZU5NWG1j?=
 =?utf-8?B?Q3I1RHg3MDdVdVkyMS9kUUJ2eFVNbnB2dFJWTnNicnRTV2VmM1lrVElvYXpY?=
 =?utf-8?B?WERrbUxkWFZLUVpRYnJyajNYZWtsc2hRMXd5RVJNV2dYN1FQZTVTQ0pXdnE0?=
 =?utf-8?B?VjVBQWdiUEdxUXMvbFpIMkdEOGVVVmh2ZHU3S2U4SXBJeHZKcGZ1Z01IVjNZ?=
 =?utf-8?B?elBxZ1UwQWNEL1IraXpuK3JWTHJiTU5JOEtmKy9FSmduQUF6bFdJb0JSb3FI?=
 =?utf-8?B?ZTJvV1lJOE51WDkwZzFkWnIxUGszeDRuKzZ2bzFuYWxzdmtpMkZLdHpLTlRQ?=
 =?utf-8?B?YkgwSERlOW5hRXRLbkh5UWNwRmYwWDFySFFFaXpaQ01EdkNsaDZZcjZHeXkx?=
 =?utf-8?B?NXlBQkI4WXFRTGdXeE9nV3Y1cXNVTU04bHovMEx2TUlKZVk2WWQxK1VLL0lt?=
 =?utf-8?B?Nk96cGFiaGV2R0h3Sm1URFhMSUFNK2NFQ29Lb2xYU1BKZ0h1ZHR2Q3RDUW1r?=
 =?utf-8?B?a2d0RzZEczRyTlpEdWZDOWsxdks2TFhZeTQxNlk1clg0SVNGUGlueW0ydlZ1?=
 =?utf-8?B?cFB4dmZISHZXc3BZUU1KTkZqZ09iZ29xWXlOY3dveVl3bEI2bklaYmQ2VDdC?=
 =?utf-8?B?QmZHR3kya3VsbkJmbU5uc0huRUJQZUtJMFhJUFdWL0syK1luSlpTWElvamhF?=
 =?utf-8?B?SXo4T2lnc3k3bW9yYmJ4L1NkVUFOVlhKQm9Kcmc3NWllT001QThHZjBrT3R2?=
 =?utf-8?B?akZzTnpXV3N6TE9DRkFHK0xDSTFacU5YK3F6Z2RuZnlVaEpJSDNVMWxCQ1JD?=
 =?utf-8?B?K1JyTXBibTV4d1pnbk0yd1R4c012aWsyakhya3lPV0FhRzdyQ3h2S1BBM1pE?=
 =?utf-8?B?SFJaQ2Zham9vUmhTQUJEdDdpejRsdHkwVE1VRHhTNVR2ZVZ5T0l2QzJVekNJ?=
 =?utf-8?B?ODZBMUpXeVRVcnkxdFFIVExCVVdURXdBcUs4c0FOZWIzaUs4RnJkS0VGU0JB?=
 =?utf-8?B?QU1xbUczYVUyUFh2S3gxemhDdFJHQ2dja1pJUFdNT3BZTFBmdzhHcVJBdExn?=
 =?utf-8?B?SlVFaHFEdDVvM1A5YzR2N2FBMWg4dFl3V3N4UTE5ZzROMEorVUhvcXpGU3Zk?=
 =?utf-8?B?eVNjMVIvd1VXUkRpVHJUdVg2M1c0dWFFZTBkL3BkeWtwU1ZTUVJYWXN5bmNr?=
 =?utf-8?Q?lYZav6Pxf0lQLt3ejnO6u80pEJLWHY1S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEZYdnJId2JoN3Q5OFVudVZPQ2x0RnZBS2tsOEFybzFFVlBWTEsyZVR5Wkla?=
 =?utf-8?B?UWpTRWpBWGxERVNFTXI0U0MvWCtBVml6V3lLOEU4eGR1MXRqbytja0RIZDBn?=
 =?utf-8?B?N0FGNzU2SHNkcEhIRUJGSk4vRTVYcWZkZDNCSndVZTU2N3B5T0Z2elVxUC8x?=
 =?utf-8?B?TDR2WW5HSWhhdVZITS82WDFwYjdyZnVnbTVGRis0R3BCWmpzU2VGeWtHbmky?=
 =?utf-8?B?ZXZMTXNidTNUR1hGRnNZRGhsL2N4NGpVakpXNXJBN2J1eTg0eFVoUDJrTXpx?=
 =?utf-8?B?M0E4TmlLVVU0a2tqNTVNQXg5STRvMVJSN0xGZHdKNVVpbmhXZ05pdm42aGZT?=
 =?utf-8?B?U2hDR3F0bW1Bb0hzamRmNmdVUVFsUXh4bGtQeUgwdTJHZ1RBWTdjc0tJRU1W?=
 =?utf-8?B?VTBnWmxVaTA5T1ROa1lsbllGU2RrT0VmbjlGcVBzU0UrNzduNk5GTWV6eEJX?=
 =?utf-8?B?MUkxcFJIWm9YMUg4NzlwTWlzZWR5RXBrU0NrZ0UzUHN6eHRRYzkwcitoUHc3?=
 =?utf-8?B?YmZwQlZxbEE0R3NBVjBKeGYwSXJHS0E1Q054bW01Y3NaMjdmSVI5eWJuS3Rz?=
 =?utf-8?B?Qllpams1cEZwNzNmVjF2TU1kWmFUNUg5U21WSWZ2d1BVUisrR1Azc2tVbGxK?=
 =?utf-8?B?ZEwvMWJDNkFUbThPZkxpdEJQTzlTUW8wd3hEYmZZMkhFdE5zaXZ6UHhCbjZx?=
 =?utf-8?B?Q2V6VXJMUkxMR3B2MTR2Y3lGc0FLVjhpMG5rbkt4YU5tUnlTUXdQNW9HWXI1?=
 =?utf-8?B?TFdrbWVKOUt5ZlkxUVdYZ2VoNVR3R0c2TkFoTHBFRURLdC9oS0JIVTAyZzJI?=
 =?utf-8?B?QXA0RFhBMFFodDN5bnliaUxSMmdkbzQ1VldLQlRQSDNnbENPSUc2a1pPSnFl?=
 =?utf-8?B?NUdFc1dTSnNlaXR0Qml2WXg1SFlkVXlCK2UvbllVUmlyYXduOElEZHh5V0xh?=
 =?utf-8?B?NXAxVjhTUnp2NC9abXkzTE1xakxhQWRzeW9hVVZlb3VtNWJtd3BybUFTdmFZ?=
 =?utf-8?B?ZTRqNkFHOEpuWWNWaG9JYmxhbCtjdk9EbVlaOS9SOXNlNXNMS0IydWpITmFX?=
 =?utf-8?B?Vm1ZTzRZcEk2SWE5OUtPb0hBS1Jsc2JvY0oycmYva2FVWUZuZ1dZMTllOUda?=
 =?utf-8?B?dXFZMytoTjdSRkNsYXBmZUdDWGVCdHFmdDNqSWNCcGc5L01NL2RZR2FhSHp2?=
 =?utf-8?B?OUoxYjhDdW1rTlQ4SHdxRUxQbHZwb3k5K2hhU0RFQ1Joa2xJeUxHQ1c2cWlR?=
 =?utf-8?B?WEd1MTB1TnBWTXFxRHVjTDEvaEpDOWdPdDMvUURlYVZJS3FKNDdYV2E2WHpp?=
 =?utf-8?B?NzRsRTlMUTROS1pDTEZvSDh3WnRZUkZadUI1alFyRSs4REZ3RlVjd3NEakQy?=
 =?utf-8?B?NHVsZE1yNzdZaTMvNGxuenVaN0NNVWY4cjdjSVZUVFo4TnNHRlU2OFVZUU5K?=
 =?utf-8?B?ZHkyZmNGd21nQVZ0WVN6UmhZVlRQbmdtV054SnJRSm01NHFkQ1p0MGo0ZkRJ?=
 =?utf-8?B?eEEvWlVzS1QwL0pMZVJiNEFTVE1laS9xaEVJczVGREF3TTcramFyK1FaVFRv?=
 =?utf-8?B?RFY1K2VCM3J5K05JMDFhaEkxUEFNM28xNXhhVWs5TzhPcENjSUw1a1R6Qnox?=
 =?utf-8?B?NUM1YzhiOC81a1JLTDA5eGgva0ptR0oveVBxc3dOdC9JYzI3c3pNbnY3YXVR?=
 =?utf-8?B?SytBL1B2UmNCRHhpRWU4V0I3THM1a2RGNjBoWlRLZHU5VTlmRzNrOU1MZE9h?=
 =?utf-8?B?UENxMVRJV0RidWNXeHA0cXNGMmp5MFVKMWVSUm5VVHJEcTVNSUI2OEJINDNN?=
 =?utf-8?B?RjQ2NTgxWWovb2NDS3AzNlh3ZlRBUE0xUXlIa2QxdG1JdlFISWFNdmNLbFNx?=
 =?utf-8?B?OTFuNEd1WklmRnlaaURvdnhMS01NK1ZzTHovY21MTkxMM0JQN05seUhzRC9m?=
 =?utf-8?B?b1dGNDB2cThJTldJaWhkVmZ1OFRSTGdMWWd3bWwrbmRMOTcreVc4QSszRE0y?=
 =?utf-8?B?TGRRek1QKzRvdVVMeERrT2xoZ3dEYmpVMENFQzZOQmo5d0c3L2VFTjZQb3VP?=
 =?utf-8?B?MnVTUlMwdnNTSy9yQzk1UU9ra0FRdEQxSGdSR2txYStieDUrOHRDb1A4c1BE?=
 =?utf-8?B?K3VGbHlGdEFpV1B0eGdoSEh3bTArSnc4SkUvU2haRG8vT3JPMXFqRU12aWpR?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b6e667-84f4-40cc-2621-08de30e56cdf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:25:06.7586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaEdUluxUg/P5ThgWlRZ3pJjKFd3aUuBGwO7TgMsehJlJUiSwGWjiqc1Y6yBcbgw9sW+/P8bVD4fJmcPw55CarCKElhSLXjcjPe/rXtpclw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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



On 12/1/2025 10:50 AM, Satyanarayana K V P wrote:
> In scenarios involving double migration, the VF KMD may encounter
> situations where it is instructed to re-migrate before having the
> opportunity to send RESFIX_DONE for the initial migration. This can occur
> when the fix-up for the prior migration is still underway, but the VF KMD
> is migrated again.
> 
> Consequently, this may lead to the possibility of sending two migration
> notifications (i.e., pending fix-up for the first migration and a second
> notification for the new migration). Upon receiving the first RES_FIX
> notification, the GuC will resume VF submission on the GPU, potentially
> resulting in undefined behavior, such as system hangs or crashes.
> 
> To avoid this, post migration, a marker is sent to the GUC prior to the
> start of resource fixups to indicate start of resource fixups. The same
> marker is sent along with RESFIX_DONE notification so that GUC can avoid
> submitting jobs to HW in case of double migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V7 -> V8:
> - Fixed review comments (Michal W).
> - xe_irq_resume() is moved to vf_post_migration_rearm().
> - Renamed vf_post_migration_resfix_start_marker() to
> vf_post_migration_next_resfix_marker().
> - Created new wrapper vf_post_migration_resfix_start() for vf_resfix_start()
> - Updated flow diagram as per review comments.
> 
> V6 -> V7:
> - Fixed review comments (Michal W).
> - Made resfix_start marker width to u8.
> - Removed XE_GUC_RESPONSE_VF_MIGRATED handling in xe_guc_mmio_send_recv()
> function and moved to seperate patch.
> 
> V5 -> V6:
> - Fixed review comments (Michal W).
> - Updated resfix_done and res_fix_start function names.
> - Handled XE_GUC_RESPONSE_VF_MIGRATED error case received from GuC.
> - Remove skip_resfix error when another migration is in queue.
> 
> V4 -> V5:
> - Fixed review comments (Michal W).
> - Fixed minor debug log levels and documentation part.
> - Moved complete marker logic to vf_post_migration_resfix_start_marker()
> 
> V3 -> V4:
> - Updated RESFIX_DONE action name and documenation part. (Michal W)
> - Enable resfxi_start marked by default as sav/restore is gated on
> Guc version 70.54.0
> 
> V2 -> V3:
> - Fixed review comments (Michal W).
> - Updated commit message.
> - Fixed CI.BAT issues.
> - Added helper function to assert on unsupported GUC versions.
> - Updated RESFIX_DONE action name and documenation part.
> 
> V1 -> V2:
> - Squashed "Enable RESFIX start marker only on supported GUC
> versions" commit into a single commit. (Matt B)
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  67 +++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 112 ++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |   5 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c              |  64 +++++++++-
>  4 files changed, 197 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..d9f21202e1a9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -502,13 +502,17 @@
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
> - * DOC: VF2GUC_NOTIFY_RESFIX_DONE
> + * DOC: VF2GUC_RESFIX_DONE
>   *
> - * This action is used by VF to notify the GuC that the VF KMD has completed
> - * post-migration recovery steps.
> + * This action is used by VF to inform the GuC that the VF KMD has completed
> + * post-migration recovery steps. From GuC VF compatibility 1.27.0 onwards, it
> + * shall only be sent after posting RESFIX_START and that both @MARKER fields
> + * must match.
>   *
>   * This message must be sent as `MMIO HXG Message`_.
>   *
> + * Updated since GuC VF compatibility 1.27.0.
> + *
>   *  +---+-------+--------------------------------------------------------------+
>   *  |   | Bits  | Description                                                  |
>   *  +===+=======+==============================================================+
> @@ -516,9 +520,11 @@
>   *  |   +-------+--------------------------------------------------------------+
>   *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
>   *  +---+-------+--------------------------------------------------------------+
>   *
>   *  +---+-------+--------------------------------------------------------------+
> @@ -531,13 +537,13 @@
>   *  |   |  27:0 | DATA0 = MBZ                                                  |
>   *  +---+-------+--------------------------------------------------------------+
>   */
> -#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
> +#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
>   * DOC: VF2GUC_QUERY_SINGLE_KLV
> @@ -656,4 +662,45 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_RESFIX_START
> + *
> + * This action is used by VF to inform the GuC that the VF KMD will be starting
> + * post-migration recovery fixups. The @MARKER sent with this action must match
> + * with the MARKER posted in the VF2GUC_RESFIX_DONE message.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + * Available since GuC VF compatibility 1.27.0.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
> +
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 97c29c55f885..5bf13e41de80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +static int guc_action_vf_resfix_start(struct xe_guc *guc, u16 marker)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
> +		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
>  	};
>  	int ret;
>  
> @@ -313,28 +314,41 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> -/**
> - * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> - * @gt: the &xe_gt struct instance linked to target GuC
> - *
> - * Returns: 0 if the operation completed successfully, or a negative error
> - * code otherwise.
> - */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_resfix_start(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
> -	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> -	if (unlikely(err))
> -		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> -				ERR_PTR(err));
> -	else
> -		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
>  
> -	return err;
> +	return guc_action_vf_resfix_start(guc, marker);
> +}
> +
> +static int guc_action_vf_resfix_done(struct xe_guc *guc, u16 marker)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
> +		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int vf_resfix_done(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix done marker %u\n", marker);
> +
> +	return guc_action_vf_resfix_done(guc, marker);
>  }
>  
>  static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
> @@ -1162,6 +1176,13 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  
>  static void vf_post_migration_rearm(struct xe_gt *gt)
>  {
> +	/*
> +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> +	 * must be working at this point, since the recovery did started,
> +	 * but the rest was not enabled using the procedure from spec.
> +	 */
> +	xe_irq_resume(gt_to_xe(gt));
> +
>  	xe_guc_ct_restart(&gt->uc.guc.ct);
>  	xe_guc_submit_unpause_prepare_vf(&gt->uc.guc);
>  }
> @@ -1183,37 +1204,40 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>  {
> -	bool skip_resfix = false;
> -
>  	spin_lock_irq(&gt->sriov.vf.migration.lock);
> -	if (gt->sriov.vf.migration.recovery_queued) {
> -		skip_resfix = true;
> -		xe_gt_sriov_dbg(gt, "another recovery imminent, resfix skipped\n");
> -	} else {
> +	if (gt->sriov.vf.migration.recovery_queued)
> +		xe_gt_sriov_dbg(gt, "another recovery imminent\n");
> +	else
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> -	}
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
> -	if (skip_resfix)
> -		return -EAGAIN;
> +	return vf_resfix_done(gt, marker);
> +}
>  
> -	/*
> -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
> -	 * must be working at this point, since the recovery did started,
> -	 * but the rest was not enabled using the procedure from spec.
> -	 */
> -	xe_irq_resume(gt_to_xe(gt));
> +static int vf_post_migration_resfix_start(struct xe_gt *gt, u16 marker)
> +{
> +	return vf_resfix_start(gt, marker);
> +}

little use of this helper
but since it's a artifact of chosen naming schema, let it be

> +
> +static u16 vf_post_migration_next_resfix_marker(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	return vf_notify_resfix_done(gt);
> +	BUILD_BUG_ON(1 + ((typeof(gt->sriov.vf.migration.resfix_marker))~0) >
> +		     FIELD_MAX(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER));
> +
> +	/* add 1 to avoid zero-marker */
> +	return 1 + gt->sriov.vf.migration.resfix_marker++;
>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err;
> +	u16 marker;
>  	bool retry;
> +	int err;
>  
>  	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>  
> @@ -1227,15 +1251,27 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	marker = vf_post_migration_next_resfix_marker(gt);
> +
> +	err = vf_post_migration_resfix_start(gt, marker);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_START step (%pe)\n",
> +				ERR_PTR(err));
> +		goto fail;
> +	}
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> -	if (err && err != -EAGAIN)
> +	err = vf_post_migration_resfix_done(gt, marker);
> +	if (err) {
> +		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_DONE step (%pe)\n",
> +				ERR_PTR(err));
>  		goto fail;
> +	}
>  
>  	vf_post_migration_kickstart(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..db2f8b3ed3e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/**
> +	 * @resfix_marker: Marker sent on start and on end of post-migration
> +	 * steps.
> +	 */
> +	u8 resfix_marker;
>  	/** @recovery_teardown: VF post migration recovery is being torn down */
>  	bool recovery_teardown;
>  	/** @recovery_queued: VF post migration recovery in queued */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index d56b8cfea50b..db1a48e707b8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -49,11 +49,13 @@
>   *
>   * As soon as Virtual GPU of the VM starts, the VF driver within receives
>   * the MIGRATED interrupt and schedules post-migration recovery worker.
> - * That worker queries GuC for new provisioning (using MMIO communication),
> + * That worker sends `VF2GUC_RESFIX_START` action along with non-zero
> + * marker, queries GuC for new provisioning (using MMIO communication),
>   * and applies fixups to any non-virtualized resources used by the VF.
>   *
>   * When the VF driver is ready to continue operation on the newly connected
> - * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
> + * hardware, it sends `VF2GUC_RESFIX_DONE` action along with the same
> + * marker which was sent with `VF2GUC_RESFIX_START` which causes it to
>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
>   * CTB messages and scheduling workloads from the VF::
>   *
> @@ -102,12 +104,17 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_RESFIX_START        [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]
>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
>   *      |                               |                       -----> [ ]
>   *      |                               |                              [ ]
> - *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
> + *      |                               |    VF2GUC_RESFIX_DONE        [ ]
>   *      |                              [ ] <---------------------------[ ]
>   *      |                              [ ]                             [ ]
>   *      |                              [ ]  GuC sets new VF state to   [ ]
> @@ -118,6 +125,57 @@
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                               |
>   *      |                               |                               |
> + *
> + * Handling of VF double migration flow is shown below::
> + *
> + *     GuC1                                             VF
> + *      |                                               |
> + *      |                                              [ ]<--- start fixups
> + *      |                  VF2GUC_RESFIX_START(marker) [ ]
> + *     [ ] <-------------------------------------------[ ]
> + *     [ ]                                             [ ]
> + *     [ ]---\                                         [ ]
> + *     [ ]   store marker                              [ ]
> + *     [ ]<--/                                         [ ]
> + *     [ ]                                             [ ]
> + *     [ ] success                                     [ ]
> + *     [ ] ------------------------------------------> [ ]
> + *      |                                              [ ]
> + *      |                                              [ ]---\
> + *      |                                              [ ]   do fixups
> + *      |                                              [ ]<--/
> + *      |                                              [ ]
> + *      :                                               :
> + *      -------------- VF paused / saved ----------------
> + *      |

nit: we don't care about GuC1 anymore, hence suggested 'X' as termination point

> + *
> + *     GuC2
> + *      |
> + *      :                                               :

nit: no need for 'continue' marks here

> + *      ----------------- VF restored  ------------------
> + *      |
> + *     [ ]
> + *     [ ]---\
> + *     [ ]   reset marker
> + *     [ ]<--/
> + *     [ ]
> + *      ----------------- VF resumed  ------------------
> + *      |                                              [ ]
> + *      |                                              [ ]
> + *      |                   VF2GUC_RESFIX_DONE(marker) [ ]
> + *     [ ] <-------------------------------------------[ ]
> + *     [ ]                                             [ ]
> + *     [ ]---\                                         [ ]
> + *     [ ]   check marker                              [ ]
> + *     [ ]   (mismatch)                                [ ]
> + *     [ ]<--/                                         [ ]
> + *     [ ]                                             [ ]
> + *     [ ] RESPONSE_VF_MIGRATED                        [ ]
> + *     [ ] ------------------------------------------> [ ]
> + *      |                                              [ ]---\
> + *      |                                              [ ]  reschedule fixups
> + *      |                                              [ ]<--/
> + *      |                                               |
>   */
>  
>  /**

just nits (and will try to fix them while applying), so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

