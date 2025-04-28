Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142C8C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 10:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20F310E3E5;
	Mon, 28 Apr 2025 10:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLiKrbYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A3810E3E5
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745836914; x=1777372914;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XMijibIsMTm2lsLnpHTZGcTJahRJkr+5HeY38hhbhMc=;
 b=JLiKrbYft5feNEx6hQRC8aojO6meWqb8uBPct0LkRb+TlxOxZSUhj1mH
 gIHnLeqMS75/CQijn6dGfwHmOX03WOADdsMPmQK8zp4PoYWg/jqyYWQQS
 lLDTVKCpDw8kE6BhS5Uc34VXtAtaRS87D+yxkV+olkpc/ezeIMtm8FYZb
 3yNHjeTCAll3vREkYFVsLRcV0YUtFNzoMS193V5gTD/MyLPDbYkG2Yq+t
 p3SftkwdIjDL1FzZq6qknleJb1z7YwJlKgK3B4g3yNDTSAm9tKzh4EWjg
 t8iYlgQ++GzLhcXHsBt9bL0LoKPkeSu/2V+q2zDtXl18+TVr/j6tJvHmL w==;
X-CSE-ConnectionGUID: cIrV4ZExQ+i/GK6hUEMcEg==
X-CSE-MsgGUID: nuVV1aMHQuiFiWPceFDYrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47551887"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="47551887"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:41:53 -0700
X-CSE-ConnectionGUID: zL9xorcgRHmbIyMRPowOLw==
X-CSE-MsgGUID: S7hkXvh3SUOwYfUOjA0tsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="137537020"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:41:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 03:41:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 03:41:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 03:41:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtRA8OAWmf2uDDhre2jKgKPoBOzowBjvGc3Pkm4q1GLl6feFlcDnYIN7j00AdrhqtwFDVZj2idSkoxWEKxmZ/d4vUd4019iHkhRcYpCi6G+HGnEKOS4jyJlpisfEAtlR0DZNQuWG6qmqYoWimGMwkd972WRdKTNfgQCKEnjYjb+/h1YfxlaT4oyL6/Pu1pq50Rc8jAJ//dQPImPxhvoMkkYLH0SVBzMc2pA6+w8IbPw2qZZHfioUtlX+pVVp2h8C9w1WBLd0OGPfkdlRtro3ZbePKVYTRYlkAu02XdVxjs5SNymycMPepQg9dLwLr2QBGKjE22tEcCoednQ7/7PZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh9nzn33kxnB97QHlOV82B/p333DB1L05lf2TIEMGSc=;
 b=mve30Pyn6q9E6tizjrf9W0xAnHCY0f6OmRcxH7vLyeZp510bVV5x9Ca03zA3eNelgh5TUbtNfMUTIeJSRcROWoZBW7Ks6bQCyclFmkRfujaYFOZUgcSzhubZxsNYN56A3X3vYiNKRFZKTvbSr5hoRA0ef/q8ajVLuSw+KXOJLmwZOhycxraT3WS6HftyYSXgcJnqD97lHQBdsThPhzwv/QOxkGVjwohzWGcu0rzOVmpuD99uJlD2GDIRJQ2QAFgxTbZim/0TN179QGJkVFgJ5kFt21TXY1V9Iy/YsXpB8somvU/6yeV8VX6+KY3fWtdrMVQyoJ+0Hd6tudoE32dWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 10:41:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 10:41:35 +0000
Message-ID: <bbaeda29-297b-4f2f-aba2-c0e80ed41729@intel.com>
Date: Mon, 28 Apr 2025 16:11:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250428082357.1730068-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250428082357.1730068-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 5355bc5c-5dfc-4a5d-d26a-08dd86413f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTlWMGFjbng5VzdHY0I5VDZLd2FDY01rQk80WkFFQWI3eUFjWlBuL0dLejhx?=
 =?utf-8?B?eUgyVnRZR2RmcnlwYTNZV3dnZWVCM2hRSDV5bDMxWWRVNC9zQ01DbUo1U2Rp?=
 =?utf-8?B?enRaR2U0WFh6ZGM5RU50Mk5DMUV6SHhBWlJDcGVqZXQvOEdIYW5QZXU0RmNY?=
 =?utf-8?B?bXo4ajZVMHdGTWdQdWo3NWNyVUUwNUhjYThkUEhHQWJkcmd0QzlrNkRNYzJN?=
 =?utf-8?B?RTdvNnNMeFNLMGd5VmJoaEdidzhvM1BJTE9Kc0dYWnRlMEM5T3pOandrS29X?=
 =?utf-8?B?dERiQ2FCTU9nRlltRzJJTVpIMjNiQVJlZjBmdG5DVG95c1FrdWp5S29zMmhh?=
 =?utf-8?B?WHpOMW9IL0Q1M2NRNklWMGpBcy9lTW9tczdTVzhQMU04ZDNqSnpGRVowNzF0?=
 =?utf-8?B?NDNpYVBWOFZNMGdzbXdoSGVoTXoxMlkzSHowaXVNcUJpOXcyUmdXQ09lOHY4?=
 =?utf-8?B?TDRVc09DaWxMQVNENjRlZ0t6ZFM0dElqTGlkUENockpMV3pkOEZwSGVEcCt0?=
 =?utf-8?B?K2tMM29qNnhqU1VpaWlLZGRaQVBFbWR3U3BZRWozd05tNHhOME1VeTRlZUwv?=
 =?utf-8?B?OXRXTnlxOXFINEZETm81Lysyb0lGRlozc0FrTHlTdmwxRkVqbEZENHBQbTFp?=
 =?utf-8?B?UVArNmZTcGd0NGdLTnROY1UrMjV4WG9Gcmo0Vld1bDJ2VWxMcmgzcm1GNmJC?=
 =?utf-8?B?MTM4WEdnblVHWFU2bVY0ZHVkTXpIZUtEUndUU29lZW9RcmJQYzdRZnNXblZR?=
 =?utf-8?B?WFRwN3NWWWNUUnVQY2pPZC9jYTdCT2toQ1hxTlNOVmlnZzVxMlY2RzRVQ1Vr?=
 =?utf-8?B?cHJOalFpcVJseDIvbWxzaU5ITnFFa1BxS3BST25QTWxRSHB0V3dUS3lXeUJM?=
 =?utf-8?B?Mkd3cGUzWVkyVFRkNEFmUTMxV05WTHU0RG9kYWFNVTQrQUEzVFFvM1RseUU4?=
 =?utf-8?B?OTBNM2ROVjJaWUdYb0VOZ1pJYUN0R1pCaGJxRU5FaEZrNElyMjF4S2FtUTRG?=
 =?utf-8?B?b2xUd3IxM3BLdmVnSWh0Mm41eDg4ckdSMW5PTUJVWmdmRTAvWDQ4ZEJuekl4?=
 =?utf-8?B?eWlYeFdVY1pFZFpiUUJuQW1ES3NHUDg4czdjLzdoekQ0ZXduOStHUXFNYzJE?=
 =?utf-8?B?bE1zamxIQ2ZWcW9heHlGdFA5RkNlcmtENjJTL2tqMFZYdFNETmRuNU9tUUlE?=
 =?utf-8?B?MWJUMFhxWlY3UXFqakxOSkg0N2hpeW9TRHpVQ2Z2SXV2eTNRMWEwaEpUdEtO?=
 =?utf-8?B?UzNuQzh0RUE4ekh3cTZNdUViYUtORXVmT25Hc1I4R1hLUFAvTDB5Z3MzZC83?=
 =?utf-8?B?U1pFaVRZRWMrWEFMSlljdmdRd0t3Z1FsbWlxbjJzTGk5MDRJL0pmTllaNFIx?=
 =?utf-8?B?RENmNy9nR25ZbTVZbCtnK0RvWXlxeXpwYnhkRmhTQ0JkZ0JNd3p6NWlwTjVX?=
 =?utf-8?B?WDdGSVM1WGQ5ZTJBOU9VYjROMkVnNkZ3aDR4U0F0RG0yeXd5Q3A2SUduSGNV?=
 =?utf-8?B?MnVGdVRhYXVRNGJibXZpYm1ldkhMVzlOYVhQdDVJRjNlV01SNklaSmNVQWRL?=
 =?utf-8?B?Y2ZtOGhFLzYzcEloK0ZpemdkdG12RnM1d2ZYQkp3V1RVZjNNS1JVQnZiaHJ6?=
 =?utf-8?B?UVVCZXJvOEdjcmJWN0hLM2hTVUJDLzB5WmtmRFBFTEdwQ015US9KMkR1S0N5?=
 =?utf-8?B?cFoydFl5OXNLbFpGdEkzWElRc0RzVWNWT2pkRjBzT3FuWkdtZ3JnUVlYWE9V?=
 =?utf-8?B?L0tzUWZaVlVpcmFOcUg4bmJFQUhZN3VuWVJsWnlCZkZ1ek1zRm5qejh1czg1?=
 =?utf-8?Q?1J/I0OWpoD7yxqrWKgUbx6pPQoHz0pfk1Nn2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVRBVVMxVW9NU0tkRExjbCtoZ21JNVVtcGQ1V1JpNFg5UXZzMC84OWxSUUky?=
 =?utf-8?B?M1VRNVNqUGRMeXgvSDZtQXV0YVQxaE9IcVltZHJwdzVUVVFxTnZ6UTQ4MExX?=
 =?utf-8?B?elR6ZnhycnV5cVVDR2tLZlUzV3phV08wcXNlNmZheFBUTXZCdHdKY3IzOG94?=
 =?utf-8?B?TnB2eGU1eXEyZTc3ODIwblJidzYrZHBqSVJiZGNkdHZOeVJhTXRrbnhZRVFD?=
 =?utf-8?B?bTNiMS9yYmY2bDM4SC9IN3BYZGhQVVdsUFJqekYvd0U2RkRUNStnT0dUUEp5?=
 =?utf-8?B?Rmx2RjdEWGg5RURvVkNnbndBMkNVOUtIUDBKSDVSSWpnZitteFduc0RySHVP?=
 =?utf-8?B?TEpPbTI3UTM4NVBWSExGd1p5MlZxSDlHa0swRXM5YWptb0dmeWZ3SFk0VnVH?=
 =?utf-8?B?L2JWVlBaNW0rT1ZabUhIYmN5aVlwd0djOGMrUWVMbkNxU2hIUWJEUFhTZkxS?=
 =?utf-8?B?MzJlcEo0TFR6OG83L3dZeWlURkRIOGIxSVpqVWoxMTFMSEM2S28rVFBKd2Yw?=
 =?utf-8?B?REZsbW1KZnFER0tDSVQzMEtUYVhicnprL3RCZFg3cnNpeHovZHQ3dUxwcmIv?=
 =?utf-8?B?T29lUm95MFJjZCtENENBRXZDS2VQbk1uTmI0UEdwaHZwUVdhUGlvQ3RqUnpD?=
 =?utf-8?B?OXVreVVLT1hxS3ZSeTdyRk56MW8zT0hLNFhpMnFWZFNBbzI1VUlUd2UweFJn?=
 =?utf-8?B?WEZDa21TUDhDVkNPR09Ud1QxalBNdktiZnhQTk5KT3VHcW5ZUkhXMzk2WTNH?=
 =?utf-8?B?dTlKdjgrUkRVcGEwcU9QUmlCTVIyMjlSSnd5RTVLdDRxZkpqR1psc293THBS?=
 =?utf-8?B?blBTb1VxU3lzQXRvWjAxeXNJMkErS1FxR0hpUjQ4Wk8vU0xoUkdhVlBaaGJv?=
 =?utf-8?B?NmloYXNIWUltN0xPV0VRK2lYZXNoQjVhZUo4eG1JUTBsa0lGWFpDVkZYOHRv?=
 =?utf-8?B?QWZsNUw3VlJYM05vd2ZWYnhlSGFiTUZYWGQ2TUhSSHZMMkdjUGhpSkEzOEtw?=
 =?utf-8?B?SzRtcEdGQ1MrcFQwTVJXTmtwMGdxT21WL2ZIcGthdUw2Ylo0T1RqUEgzT1g0?=
 =?utf-8?B?NUlCdUdjWnBsT2hOUkZ0ZSs2SUc4Z2tPZ00xS1VZT3F2bDZ6Q25wNEljM0ZB?=
 =?utf-8?B?T0ZBZEJ2blJJMFdEdjF2OG4ya283cjdyU0cvbVhpMkZjZUlFd2plVFNJY2lE?=
 =?utf-8?B?QkJWREFjT1VaVy9teEJZYkZJMzdOcFNyQTlVSjYrOUNEVFJ0QVh6RVBsdGpX?=
 =?utf-8?B?SlNFUWYzN0draENwcmtCTkxRWCtuM3Q4L1R3dSs4dThERzhuUFlRRXlwK05C?=
 =?utf-8?B?VFVrVktab0tsZVBYQmk2clAzU2l3eitNYjFFSUFISSs2cHkyQXpiWk1XbFl5?=
 =?utf-8?B?SmZrclhETi9SZUFpNlFqT1Nrc3BLWlJoaTRUb0lULzRQN1ZxU0hmeDZqQ3Yy?=
 =?utf-8?B?N3N1WjF5ZWR0WDVFOUprcG5xVVc0cjhnaStsWlZWbXVxT3dVdWhtM1lYM3VC?=
 =?utf-8?B?dkRBOThDTVFTZ2kyYXdtNHg3UkMxOTh2VkhpcVV2MUpJRlJrd3B1eFd5TXpR?=
 =?utf-8?B?T1pYT1ZGZE8vejZXRjJKVnZYKzB6LzV2U1UzY1hmdlcyZFNpVlEzRWhEamky?=
 =?utf-8?B?THNma0J6MVlsYWRmd015Wjl0QU9SVHpGdFZIdGVEaFdheDhNU3RwRWRXSzNy?=
 =?utf-8?B?WWNyMVFOcjd5bWwwUkh5OUU2WXozclM0WVhUUWZzT3ZmMkxzdlNSTTZJYU9n?=
 =?utf-8?B?RWN2U09xMHBtY1p0R0F5QmVHZW9rK3h0NnlsdEYvNklwZlFTYUJNYkVlM3N1?=
 =?utf-8?B?bkhpUkVwc2ZQOENHMzUraU1VVjhiQWQ5WE1maTVMd29sMUEyVUczeUg1dWhH?=
 =?utf-8?B?ZkxyM2E4QXZsRVBsaTNTNGgxcnJCQ25kVmE2TEg0QjBXdVI4NHpPL0JwM2FX?=
 =?utf-8?B?NFk2RmhrdXcwRE5JaW9SNkJIWkE5RHZUZGdIYmgvYS9CRTdjTXcvMHN1Yy94?=
 =?utf-8?B?WGhBMnhuSDZ6QmNXVTF5eHJQYkNNMDd2QklCSXlMTldvdi9Sa0tyWS80VnEr?=
 =?utf-8?B?MU8rUWx2SUhiQy83djkrRG9BeXdiSzRERUlxaTZ0SlgyUEFpYzlwRWU4SXE0?=
 =?utf-8?B?UE5Tbkl2WjlpdmVhSFYwUWhRZkwvV1NNQzJYVUd3VkJnckVBQXdmenRZOUVW?=
 =?utf-8?Q?5zKg7HhAOAyFBXT0wEWpESM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5355bc5c-5dfc-4a5d-d26a-08dd86413f91
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:41:35.6797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0339gbZJbx0oygaFMGLNr5TnKJ6veEMNaefJKXTL7JcP4CCvYgVcwIFmCdx5bw6A4bUnEqCZb9LWdib1xH5ozVlrMuMADx3L7gvS447sTM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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



On 28-04-2025 13:53, Tejas Upadhyay wrote:
> LNCF registers report wrong values when XE_FORCEWAKE_GT
> only is held. Holding XE_FORCEWAKE_ALL ensures correct
> operations on LNCF regs.
> 
> V2(Himal):
>   - Use xe_force_wake_ref_has_domain
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1999
> Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_mocs.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index ef1e5256c56a..0e502feaca81 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -46,8 +46,11 @@ static void read_l3cc_table(struct xe_gt *gt,
>   	unsigned int fw_ref, i;
>   	u32 reg_val;
>   
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
> +	}

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	for (i = 0; i < info->num_mocs_regs; i++) {
>   		if (!(i & 1)) {

