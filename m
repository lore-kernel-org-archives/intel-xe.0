Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2831CE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 20:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B0E10E106;
	Thu, 12 Dec 2024 20:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDvkkBhw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C6610E106
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 20:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734035894; x=1765571894;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fUJQ+5t3x9FmR83DbhStwZF2Nn2SoISM74w3R6Zn64E=;
 b=EDvkkBhwslaYwB4qyVJ3RCkP8TvomWuf9fhjZxEOhB8B7cIJk+CxwERg
 V2EEExVGeee2vEpE2IWJeM3B07fizjYl5kWre7weSivgs61RUjLTj0xt/
 3bdFatMPhldd6Dlrs8OiQ53Z5OvvNMH00Mvbbn2PmkrY6UqY3+Li0HADt
 XxossqnuK+VLznAD7nInaEF8jqJ9qUxj+auMpafSy43EeO/KF7g7cQJuv
 IxUFQl1tzz02YvxSiJGqqneZ+AFWIugPHGjfOWxy8dj8cuFDt20WkR85Q
 rb9xTqstT5ESDbPnbhCeZDTKxUdoP9EwyP3At+zDnT0/LPx1s8Fw8ouPB w==;
X-CSE-ConnectionGUID: bm6tH6Y2SZirHy5QqLNegQ==
X-CSE-MsgGUID: IxOCPGmdTFWqi1OPJx8vAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34525534"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34525534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 12:38:14 -0800
X-CSE-ConnectionGUID: XBqsUenPReaNqidZ418U/g==
X-CSE-MsgGUID: EZvtR88KRSapLYUWuhE/gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96574857"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 12:38:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 12:38:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 12:38:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 12:38:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5rDoOxFCqVY/JU8zp5zUO6tGmQDKV72XiWydFO28YfFLHXJ6e1DMNscNbzBU9whfwsAxr7g8DjfnP6Ym/CcH+2j5JNK64dLWmxWSHU6XkiHZfB2qYtEWGTDsg8a0Djm4ZJ5GVvoeUejWQV9QSb+ekLqJ+44fCmk4kVoSnKIYq+zrwJkdHGcITn3NW1m7UWDe6INscs2jFl4xAKSZL5B/f2w5ZMw018PB+JeircNfDwgQWzfIs3eOLYMIKtdKlJH5UNE+Ue8dI6mYHkkLPmLn+NAO0oDjU2DlLzQFDDBiaxBTxklGAV98h8ocS5jnShiaGdPylUomIZtIlbTfF+Qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDcKIcfd0U/NUHeBFCde533kH4QAtQhuNi+KAp93Tzs=;
 b=i4C3ZqQSDVi5WJLDkp1w7Uafux0HSUN+Np2X3tnbVWSM1Wd5tSP+5/XsK94dYkeqpQxd/bI0HH7yeomTUNvPDkwcP9eShWLX2hksPoYxsIPXT1oY16IwaEk3lGLn7LXoKRtL3A/JUIG7UiGthaTxWDdWKsrNuMqCYh9hwvxj9PdSkwGuQ0UDxCBO+D4HM9kVAP37kEVe3Kq8WnQ8f1/2z+/zyWEpw7OIefNBeFuGF/EbmRPeWJe2kyFi6JPdATothgQOKFv0n3JoJag18I2ybIeCHL/pUe0SBoWMMB/roWtHseqBumM0qIqioxbSrRfnUc5dUs09uhUhUdLd9pdSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7349.namprd11.prod.outlook.com (2603:10b6:8:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 20:38:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 20:38:09 +0000
Message-ID: <64981791-184b-4f1e-9f15-4b3055a6fcfa@intel.com>
Date: Thu, 12 Dec 2024 12:38:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings and
 add tile info
To: "Souza, Jose" <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@Lists.FreeDesktop.Org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-4-John.C.Harrison@Intel.com>
 <ca2978d748368f37e0fd29fd65b059c52b1b755f.camel@intel.com>
 <1cd79769-73cc-4b4b-bac6-c03e6aec0d69@intel.com>
 <0825f33b47eaddf533bb378325b89202a43e34f3.camel@intel.com>
 <ea46ec11-b7a5-4103-8fdb-493e2489a688@intel.com>
 <2e25469bbaab8d1ee3d70b1bbbf295faa6220dd8.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2e25469bbaab8d1ee3d70b1bbbf295faa6220dd8.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:303:b4::10) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: b94a9d10-e11c-4f22-7537-08dd1aece3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1JJdnJ0VU56aGNvS2hZaHpzNlE2cEtVcDdIQXlFR1ZnQzRTU1E3R203NFda?=
 =?utf-8?B?RkkrOXFuZ0dTcitGVkE5MjRWcWQycndPaDB1WTBlL0EzWG5HSE11M25CZFVp?=
 =?utf-8?B?aHI0bVpIZlhBbE56eGpyeVZuWUV4NitlVkdhc1BYVzVLSW5adWFNeXFsTVdD?=
 =?utf-8?B?aG9hbUVJYUUvU0MxVHcvdVlud3JPY09hdUVkMVp0dXgxR204bmRmcnhPc09Y?=
 =?utf-8?B?aUwwdGd1bnJvOHFITTFqY1pTc1Q2MTU3SHB5eEhma1hNQXF3c21kWHVGaGhv?=
 =?utf-8?B?c21rNStCSXppQmlJZGNBM2VMQ2ZQSFJVRjV0aWRyV0VWRmtlbWZrSkdPTDc3?=
 =?utf-8?B?bzNNRDlyNFJkMmQ1Q1oreUhsS1VCaG1zTEV6VnNNUGNJcUMrd3B4bmQxMHlC?=
 =?utf-8?B?U290OFl2N2FTU2plenRzbFI5QkVCUnBEcFI5U2JwV0QrTUlaaldXbDE5Q2NN?=
 =?utf-8?B?emFiUFB6S1d3cDN5VXBRUmdSSTViSmRqcGRNZmt4ODdZcGxyUUh4b1NESzBt?=
 =?utf-8?B?VWlCN3pwL1NVRUNoTnNLV2tlaXhmaDdUemVSOTA0YnBSc0Z4NzYyTkJ6dHVK?=
 =?utf-8?B?MG80MDJ3QUtTdzFkYzgzWGJDYXQ4UjV1THVOL1VNMzBpU2hYTDFuQVRtd1NV?=
 =?utf-8?B?QnpGQ0tvV1JUL1czZ1dlS1p2TUdGT3hINHhGZzk1Z29LcUFjRmFxbmsvWGVH?=
 =?utf-8?B?cjZzRjM2TURpckVXREV6Z0tzUUt6Z1ZHb2c3YnVDT3lmVEJjWXEwQ3NVOVBN?=
 =?utf-8?B?MWVxd0k0bjdFSWg3QVdabFJYdGpuZkxBYWVxQWQ2b2F5NW9NM2pwRzZDYUVM?=
 =?utf-8?B?SHBMTkh3ZHhIVVRZZFJuTXdWRG9RZ3I0Q3dQM2JHMkttRG1MZ04yV3lXWlBG?=
 =?utf-8?B?b3F5Q0dtRTVBZHU5ZlZIOVk3bkdYTHdVeWdObDl6cEUrRWkzZFRpSk9MUEdT?=
 =?utf-8?B?MDJPaW1kU3djbmp2NzlNYVo2WlN6NEpncUQ2NVE2aUZLblpVVTlwQU5wa1BD?=
 =?utf-8?B?NUMraytZbExFNWlWMUZDVENNb3hYYVd4Z0xLSHJORi9rZUdKOTFEOGsvNkdK?=
 =?utf-8?B?dWtNb1VDZWxNMFVxL2hQWU1oZHBpZ1BYUHNvelR2Nk0xcFBTMTc1M2FXZCtF?=
 =?utf-8?B?REhEVDk0OFM5YWcxYnFzZlhsdEhLU2dHTjBSMmVIL1hqVVQzSmNxWGZ5V1Vu?=
 =?utf-8?B?SEE5a3YwL1hOY2lpVHlGaGc3bGk5bTVocXNldmd1dmJ0SStvSi9qTUM2OG02?=
 =?utf-8?B?K25SMm9Rd2pMNGlURFk4bWVYQ3FFdnR3dXFzdTRqM0hJUlp0N25HbExQc0Ux?=
 =?utf-8?B?SG9OY3R6RUI2ZmVyQ2p5ODl6VHNnbzkvNXVjcUdla1NESCtDUFEwVHh2SnVI?=
 =?utf-8?B?VXRERjFMM0VmSHpaREdGV0dEOTZxYS9zc1VuVG9Xck01a0ZBNDJwQzZ4aWRp?=
 =?utf-8?B?R3NxTmRSS0xRWkJLNUVGR1VoM3ZVTTNMYVJrakVaaERQQVFWWEc1WWk1MkZG?=
 =?utf-8?B?TERqa3RzWGp6dmpGUmZGaWtoc3BwdjVGZGowZmJobU9lOXRYVWIxMmgrUkRL?=
 =?utf-8?B?QXhTV1c0aHBQeTBZWjFMZEZpVENXQ3ArM2tERW50UUxYWW5YT1ZBWVlOc1VS?=
 =?utf-8?B?LzZqdVd1c0I5RzdFcWE4MDczTm9JalFxQ2ZqRHRvZnpDTGhsSVppUStKMno1?=
 =?utf-8?B?UnB3bTdMKzhDL1Y4STAwNjBNZ1JvUTNXMGEwSjNWalBuSHpXU2RTV1JZcUt1?=
 =?utf-8?B?TXlqMFB0QnlydnNCeTBGT29GQ3dsVllGQjd4Q1RUR0lCaEVsQk5hdkpVQnVQ?=
 =?utf-8?Q?Fy6UOtN4WxHzbCeqod5ppxd7n/mhcleEVfgsQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExhelcwUnFTSnFDMGhoamJiSlVPaXdpdnoxRmxBV254enVnRmRVOGdRSnA2?=
 =?utf-8?B?bDlPa290VFNmL29DVHNoQThhMVp3RXFwWUN0cmtSRlUwVFNMRVR2aDlJUjd2?=
 =?utf-8?B?UE5YdDkyeDV0UDBXclM2R3VsWkZwb2dVakVpYjMrallpZ2twcllWQ214NkxG?=
 =?utf-8?B?QlB4TjVnZmZmM1J5aER1eVZwSGttQ2gwbE9yODBSbEtNNWZmdjJXdXVPZlNS?=
 =?utf-8?B?dElzdFk0b1VpUzZ0ZTFCeU1zVTNxbXlxTm1RY0tHMEpCUVY1WVlMQlB0YnQw?=
 =?utf-8?B?eUxOa1JLQkt6SWlVbllxNi9Ca0duR0lwNlRGbVBiZUdaMVloWkhkM055YXgx?=
 =?utf-8?B?WjBJVUhFS1FpSGQxNHgzUDYzT0JHUmFzMjNQOVFsR0RUSzBFZ1ZWZ3ZhUVBM?=
 =?utf-8?B?T3VocGZXK0o3dFZ1RUtINVcrZS9yb092WWk2RDd1Y2lKVTBBMkRDV3dpdGNV?=
 =?utf-8?B?S2Jrd3BZYkQ4TXcxTmw4R1M2eWI2WjcrcjBkZ1VjRWZ5aUordGhLWWJZa09F?=
 =?utf-8?B?S3M4dmNiYkF6ZzZ6TDh2ZGhIR2dIQ1RNcER1QmVpWGRZTW5aU085TDM2ZmxB?=
 =?utf-8?B?Vkl4c0Z2cmlObkxDY3hCWDNTR1o3RVg3aHlvT2pBY3IraVNtUVc2cGZ5UitH?=
 =?utf-8?B?RnlDRzlmZ3podlAxby85dFRqOGFMOGVmaGtsUjlJWEdSalhWNUJndEY4OTM0?=
 =?utf-8?B?MlNyUXdWb1JQSlZqU2QxdUxWOTZLYmwxQXlsU1pBN3hrUU5OMDhNVWxoZ3dv?=
 =?utf-8?B?T1ZUalk4OFR5Z3pYdS9RSW5QMEEvNmdoOTBJeUZMU1puV0NxZHdZSHBUQWZk?=
 =?utf-8?B?N3dERVY4SzFJdUgwN1VRWU9zdGNRWGQwL2J3S3NOVmE3NDViMTlOOFFoMmxK?=
 =?utf-8?B?OUd0enYreEx4MW1pY0o5LzF6SXIvZG94ejBTNWlNU01FL0MzMnZ6L1JUSjVw?=
 =?utf-8?B?dEgzV1ExVXhjZU1KLzlPeENlcXJiWTByT1FTN1pPUlhJcDArUS8ybGZiNDFV?=
 =?utf-8?B?cDlSTFpuc2hqeGIzc1JiZmZSUjRLOTBKN0VUc2Nra2FqclNqSEszZTF3V3hD?=
 =?utf-8?B?TDB6UFdBeHlBWHFJMFVlVkwwWTVRMDh0WmFWb3EzTWpPNzFNZm95UzluMDFD?=
 =?utf-8?B?eHZ1VG5IKzZpOEh3WXE1cGRuTlIxSGU4VW1RYUtoWDZ6WXFrQkJZWUczekty?=
 =?utf-8?B?SWt5QUhxdDJuN05hK3NKK21QaGo5VXc4NnY2K3d4VVQyTlRjRjlDYm9RUlgv?=
 =?utf-8?B?bkNCRS8vcTJDUXpRTlN5M21HN0l4YlFBSUFhOUtSYnR6ZS9pMzVGRERXamRS?=
 =?utf-8?B?Y2I3ZWt4dXUzMTh4bGd5V1VDVFVDbW0xVWQzdDZpSGNuSlFNL3JFZUF2eHNP?=
 =?utf-8?B?dVQxeGhmNGgwTFRWcng1TnpPMU51M1gwUGlaOWNhTkJyT2RaUDhncG1OT1lW?=
 =?utf-8?B?RnYyV2pSNURkMjIxZGNJRkMxZmJ1ZDE0dzc5WDFPOUtyTnhTWGIwNzJDaXRD?=
 =?utf-8?B?bGhhakFHUjJaelhUZkRPdEROd1hkL1ZPV2dkZlRyaWRLaUpSUEZiMDdUWEpt?=
 =?utf-8?B?YXdVYzQ2dXJTVGR5a2dISG1qUkhVelQ0MXRTclFkNVJBN0xxVER5Z1VSdkV3?=
 =?utf-8?B?VXdaWjA0ZkNiZVBhK3BaZytSclVObldzdHRsNk1jNWYwSERCM09odERVTGZF?=
 =?utf-8?B?bGkwZGN6ZURUczhJU0ZsVDNoSktsNWhrNVR2bnk5U29VOUF0bElRM0RhNVo5?=
 =?utf-8?B?MzFkdno2Um1seW9pZnFoWENHQmhHM0VPUFF2a0ptZE9IL1AxdHMvRk85NzJh?=
 =?utf-8?B?Q3I4ajEvNjNjRzdTWGFJeGc0L3ZHZjJNVk5JakdTYW5hZ0dVbHNkd203b3Vm?=
 =?utf-8?B?aFBuUzFrZFlUdmhNZjB6dmdqNFExNHFLZm1mNHZtbWRFQWtPT2ZzL3lGRmRl?=
 =?utf-8?B?Ums3K2NneUhETU5HV1JPRUNsVDlqbXBGVXdsRU8rUG5WSlo3TWQwLzlWN2Rh?=
 =?utf-8?B?aUtrMytDcHlac0FZRlBweFY3Zi8ybjN0Q0RHZzJuZHFPdEM5TXNad3lDbFdY?=
 =?utf-8?B?UVovdU1oTURid0c5RlNQRWNqMFFHTWJaMHVDYUt2RnEzWlhkWUF3djBPenkv?=
 =?utf-8?B?MkVmaG1tem9BWXJ3aXdITFY1aFM3QzBuMGJHR01wZ2lJMCtnUmYwSkZJdURU?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b94a9d10-e11c-4f22-7537-08dd1aece3ae
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 20:38:09.2719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRHz7mrdc3shkqA7sUJtrW7hCCUccC+XSFwxT8WItIeJmGmIz1GK78XC2isT8C6aNNxEzO3huaLWFnnZr0ME1sHgqd4gZbGGd/CVJcefqNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7349
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

+Matthew B


On 12/12/2024 12:30, Souza, Jose wrote:
> On Thu, 2024-12-12 at 12:06 -0800, John Harrison wrote:
>> On 12/12/2024 11:31, Souza, Jose wrote:
>>> On Thu, 2024-12-12 at 10:59 -0800, John Harrison wrote:
>>>> On 12/12/2024 10:17, Souza, Jose wrote:
>>>>> On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> The xe_guc_exec_queue_snapshot is not really a GuC internal thing and
>>>>>> is definitely not a GuC CT thing. So give it its own section heading.
>>>>>> The snapshot itself is really a capture of the submission backend's
>>>>>> internal state. Although all it currently prints out is the submission
>>>>>> contexts. So label it as 'Contexts'. If more general state is added
>>>>>> later then it could be change to 'Submission backend' or some such.
>>>>>>
>>>>>> Further, everything from the GuC CT section onwards is GT specific but
>>>>>> there was no indication of which GT it was related to (and that is
>>>>>> impossible to work out from the other fields that are given). So add a
>>>>>> GT section heading. Also include the tile id of the GT, because again
>>>>>> significant information.
>>>>>>
>>>>>> Lastly, drop a couple of unnecessary line feeds within sections.
>>>>>>
>>>>>> v2: Add GT section heading, add tile id to device section.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_devcoredump.c       | 5 +++++
>>>>>>     drivers/gpu/drm/xe/xe_devcoredump_types.h | 3 ++-
>>>>>>     drivers/gpu/drm/xe/xe_device.c            | 1 +
>>>>>>     drivers/gpu/drm/xe/xe_guc_submit.c        | 2 +-
>>>>>>     drivers/gpu/drm/xe/xe_hw_engine.c         | 1 -
>>>>>>     5 files changed, 9 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>> index d23719d5c2a3..2690f1d1cde4 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>> @@ -96,8 +96,13 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>>>>     	drm_printf(&p, "Process: %s\n", ss->process_name);
>>>>>>     	xe_device_snapshot_print(xe, &p);
>>>>>>     
>>>>>> +	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>>>>>> +	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>>>>>> +
>>>>>>     	drm_puts(&p, "\n**** GuC CT ****\n");
>>>>>>     	xe_guc_ct_snapshot_print(ss->ct, &p);
>>>>>> +
>>>>>> +	drm_puts(&p, "\n**** Contexts ****\n");
>>>>>>     	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>>>>> This broke Mesa parser!
>>>>> It can't now parse the exec_queue context because it was expected to be on the '**** GuC CT ****' section.
>>>> Then the mesa parse needs to be updated. That was clearly a bug - exec
>>>> queue contexts are absolutely not GuC CT data and should not be in the
>>>> GuC CT section.
>>> Don't matter if it is a bug or not, it broke the parser.
>>> If this is not reverted we will have older Kernel versions that don't work with newer Mesa and newer Kernel versions that don't with old Mesa.
>> Debug tools cannot count as UAPI that must never change.
> That is not my understating from previous threads.
>
> Imagine that a big costumer file a bug to us and attach the devcoredump of a older kernel version.
> devcoredump parser will not work. If the developer is aware of this "contract" break he can checkout to a older UMD version, build it and then parse
> the devcoredump. Then checkout again to main/master branch and work on the fix... Not viable at all.
>
> At least UMD teams should be notified. At the moment Mesa debugging is blocked because of this patches.
The alternative is we can never update the devcoredump output to add new 
information, remove old entries that no longer make sense due to driver 
re-work, etc.? That is even less viable.

For this particular issue, the fix is presumably trivial. The mesa tool 
can be updated to look in either the old incorrect section header (I'm 
assuming the exec queue info was actually just not in any section at all 
previously, because it was really not ever part of the GuC CT info) or 
the new correct one. Then the new build will work on both the current 
kernel or the old one.

Going forwards, as I said, we can start adding format version numbers 
but my memory is that was argued against.

John.

>
>> The devcoredump contains much information that is essentially the
>> internals of the kernel. It is going to change. That is about the only
>> guarantee that we can make about it. And saying that we must
>> intentionally break the output of a developer only debug feature in
>> order to support older mesa is plain wrong. End users do not care about
>> debug tools. All user applications will still work just perfectly.
>>
>> We can start adding version numbers to the devcoredump format if we
>> really need to. But that was already shot down as a bad idea. It is
>> debug information and not UAPI. So version incompatibilities are
>> expected from time to time.
>>
>> John.
>>
>>
>>>> John.
>>>>
>>>>>>     
>>>>>>     	drm_puts(&p, "\n**** Job ****\n");
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>>> index 440d05d77a5a..3cc2f095fdfb 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>>>> @@ -37,7 +37,8 @@ struct xe_devcoredump_snapshot {
>>>>>>     	/* GuC snapshots */
>>>>>>     	/** @ct: GuC CT snapshot */
>>>>>>     	struct xe_guc_ct_snapshot *ct;
>>>>>> -	/** @ge: Guc Engine snapshot */
>>>>>> +
>>>>>> +	/** @ge: GuC Submission Engine snapshot */
>>>>>>     	struct xe_guc_submit_exec_queue_snapshot *ge;
>>>>>>     
>>>>>>     	/** @hwe: HW Engine snapshot array */
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>>>> index 09a7ad830e69..030cf703e970 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>>> @@ -961,6 +961,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>>>>>>     
>>>>>>     	for_each_gt(gt, xe, id) {
>>>>>>     		drm_printf(p, "GT id: %u\n", id);
>>>>>> +		drm_printf(p, "\tTile: %u\n", gt->tile->id);
>>>>>>     		drm_printf(p, "\tType: %s\n",
>>>>>>     			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
>>>>>>     		drm_printf(p, "\tIP ver: %u.%u.%u\n",
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>>> index 0ac4a19ec9cc..8690df699170 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>>> @@ -2240,7 +2240,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>>>>>>     	if (!snapshot)
>>>>>>     		return;
>>>>>>     
>>>>>> -	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
>>>>>> +	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
>>>>>>     	drm_printf(p, "\tName: %s\n", snapshot->name);
>>>>>>     	drm_printf(p, "\tClass: %d\n", snapshot->class);
>>>>>>     	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>> index ea6d9ef7fab6..6c9c27304cdc 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>> @@ -1084,7 +1084,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>>>>>>     	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>>>>>>     		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>>>>>>     			   snapshot->reg.rcu_mode);
>>>>>> -	drm_puts(p, "\n");
>>>>>>     }
>>>>>>     
>>>>>>     /**

