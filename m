Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B7FCFC53C
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 08:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7924510E417;
	Mon, 14 Oct 2024 08:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flfEXOas";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FEA10E411
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728896274; x=1760432274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SfAlcPFO6cAuPjHjK5ouPii43y5xYxGuIwAefqmCG8A=;
 b=flfEXOasU1KWaoIcVDej1RFPfdWWjFW9x8vY81O2mIYvwKQbk/4KUc1n
 Tfwt3rEcYttVA5E679/uyC3hKjFHvr3pkyyRKbgSEkyu1UYU2PsGOlpS4
 BY1s40T1OBaJeRZX+3NfAcbBtwT3RnIgAPZXKW5wfZc6TgkHj8DRvzioB
 tctK67EL2J1GRtYHHN6es9pWDAM8woYa+btH89o0dqDW+bUMgmIvC0T+O
 2DmgWOfCVHitSQ2XIzdw10bE5mKHAmgIVJCwGJP/ztyQ8glXTAfrXkVsX
 ydwupcD77pzQW8wQsu8/I00c5F7GYGcis6/HIgpTuoUhdsPVeL+E2VH0a Q==;
X-CSE-ConnectionGUID: jJgGDL8HTJa6XExNK2Tv/A==
X-CSE-MsgGUID: gu3RbeITR7iZ3e1MQBlmEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="45734042"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="45734042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:57:53 -0700
X-CSE-ConnectionGUID: AUg3Y/w2STCIK388/aNGYg==
X-CSE-MsgGUID: 22ERRC7CTuqmOBzlyDX72A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77961253"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 01:57:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:57:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 01:57:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 01:57:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 01:57:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZl7Zeo+qvymgC8BbcLYEbZorNr7vgjpTO+c5/d8sgz72KvahxeyJeAD3+P42ddyzh8ikUTLuC2Sr4d/w2LPwQ89HoNPStWYxnBarFq/Z+vzrCnPff+/e3aE79RG3Cpo/xenT5NCPC1m+8rpIrNK3d9L+9J6gTgugwExyYiwYMkrl4lWuryKzh09kxOp2h4V/TKgF6Zfc57yrX9JVNm3mk1X0U4RW87Ff2PEiIwiVRfzgcE6DVZKxctXxv8aeUghrIEwPGsvvPT3aBKnvd9+SiqqBza58em9WN6osyUDv6Km2huUmTp5yf1Ix9ZKeC6DrAeYkUUPwB6PQ8M/VlgjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMDsqrnf8qwEQYkttO2VAISW/pJ+btkNJ1LIBNpebFw=;
 b=AIipADeHY3mZIcPS1eUWPfRMjQP/rZeIb0EJBySNJDIpgWKSXBEAVXklidIFCLvIUcYoecKk5uXpqKApuO+JYvP0otQHpr/IXl8nYWahjUR2flNpfZqTwIed4HJqU9wxlnfxa6ENOdLP293Whh8FY/VHCwlnxp3UzMO82LaZRoggPtMKxMIjg41cJPBUqOjDfC0ID017paaok5OODCUA449quELkhrNLkOtHo5NMt0fb8wLdTXKOZbfztd1urmqGwX5W1rk6RGIhR89pAfT0/yajSfNSOjPRed4BRMvj9BkKM/uSv5/r87l15yL+HsNE4tPkyiEbKkTkCr52vZ9+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DM4PR11MB6143.namprd11.prod.outlook.com (2603:10b6:8:b1::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Mon, 14 Oct 2024 08:57:50 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:57:50 +0000
Message-ID: <37adabef-60ca-4f45-bcfa-509814c3cf20@intel.com>
Date: Mon, 14 Oct 2024 10:57:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 25/26] drm/xe: Ensure __must_check for
 xe_force_wake_get() return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-26-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20241014075601.2324382-26-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DM4PR11MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdf1890-3211-442e-c072-08dcec2e47fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0l0aGhOYTk0bVRWaXpJV2dXY2tocUpsUXdOVkZBZzBOOExHQkNBeTR6K09R?=
 =?utf-8?B?UERhOHBCeUdBd2NRUThuaWk3Z1VoNGtuZmFpMnV4cWY0cklvaGE4NjFqYWFT?=
 =?utf-8?B?L1R2dWpjUWZ2ZjFFNytLdElYTzh2N1dBWktjSW5Zci9ORy8zWW1GNCtJcWtQ?=
 =?utf-8?B?SjdPRnhvZmJ6VVJnVkNJTDN1NmJCa2prM3hBWTdiOWpZQkl2U1JUeE5QWUVF?=
 =?utf-8?B?YytWeE5VTEk0SFZaR0wwMHR6T0xOY3FXb0NFQWJCaUx6Y3dxQ2JvdE5WWG5N?=
 =?utf-8?B?RG1oWDg3VG9GazhKaStSSlhVZ3pFZGwraGtDai9hMW1ERmFBa3dGQ0VUay96?=
 =?utf-8?B?SVNUaGtwbCs5enByMkdLNUFNNEp2enZEWmRhczNxTy9qL00rSnRtM3FTY3gx?=
 =?utf-8?B?NEVLQzBncDBPR1FCOUt0MkJYOWdCcWszak1KNmM1YTl2OGZqSUlCZHpnYndJ?=
 =?utf-8?B?T0NsbFV0V21iSHpGUEVIN01wVEZ0RmRKNHNjVlU4R3JJRWIyV0JseHdNZ2Qv?=
 =?utf-8?B?dnplUVQ5Vy91T2lOKytPTlEyN2M2c2JWM3FHcWRieDZnR250TDZZcU5rMzhQ?=
 =?utf-8?B?cVJaR1MvLzZDQTk1MVREczdSbVJJeU90eUtMUG82QXdCVGFUbVZVamNUdWtk?=
 =?utf-8?B?d1hQYlFUVitpQWVaenRMTVR6a25COUR1b0dJZXRVOHI1VXh4VEw1TDMveUJs?=
 =?utf-8?B?SElzMysxVkYwQnYxV2szeEIvcjh3OGZVZHRPL0M5dE9VVEtURTh0U1k4Z2dy?=
 =?utf-8?B?bE8va2svM1ZqMzlZazQ1eFRPalhmSGdSWlp4a09mR0w2RFVhOHIzUkY2R0ts?=
 =?utf-8?B?dGt5YVg2TXN1Rm4zNGhvOTZYUFlLYkZtblQ2NU9uR0tQM1V5NTdJNVUwcmJp?=
 =?utf-8?B?NFJrMjJwSno2b2R5WEJXVkE0aUtJZTFkY2RJeXZ6WEZJbThTWi9YbEt1Uk8r?=
 =?utf-8?B?cE1yNE95UkZFWnBIY3ZTYWNCRnE4R0lISzZzT3dTYlBGL3NGY0pPdU1uSlZI?=
 =?utf-8?B?WFNEblBSZ0JlSk1SMTlwMmgvTk90bEF5aHlkdjdQU0pCVFJYVUtCUlIrSzZW?=
 =?utf-8?B?SXNQaVhWejZxcUczZWpTbnBTWlZXb3J1OVR4VlllV0t3elhIKzJrOFZnZmF6?=
 =?utf-8?B?Q2k2WFdKYUFXdVBsRGNBU2MxbzRxMEZ2NHJydGc0amNFUngwbEFRNThLOWdr?=
 =?utf-8?B?bHdxTXRlVjgrYmVONzgwU2x3aWNONkpoYjkyQWd2QlRrSGZ2RWlWWkcwejFT?=
 =?utf-8?B?dWpEVjl4aVJLM2d4cmQ1clJxSEgzYmdCbVBqQXNhUWo2Y2pyalZlT3cvMmFj?=
 =?utf-8?B?VnFBNUxwU0VIVlFZWnBYdTBCczR2cGJvVVIzNHVIMzVEYk5udzcyU1o4U0dR?=
 =?utf-8?B?Z2VNUDhpbUhUeVg2TEJGMUYxdUtCYzZiSENHc1JYMTRoMkhhSzdhTWxXdVhZ?=
 =?utf-8?B?S0Vzc0lvK3JZU3IzWmFtdVpCWW5SVnh4dTNoSTcwdEFmL1VmaHBjRkJsNC92?=
 =?utf-8?B?ajZzM05hMGFmWE41WFRaelVUbXB5YXNqZVMvMnNZWmdJMWJ6Q1pYeFhRZ1lW?=
 =?utf-8?B?U21mZjhkdnMyclZJSVJlZDE4dmpob0NNTlI0dWtmWS9kNFZQNGZMZkFTVG9z?=
 =?utf-8?B?SFlCYWJIdEVKNjl5bnVNbmFrb1NvMXRsWHZFUHhNQ3NiYldmNXlyS3JzTnNX?=
 =?utf-8?B?ZkIzdm53UW5uaFdpVXphNkxGUTY1ZmhnRUk3KytaOTl5V0RyamdLbTJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk1vME01N1ovcG85U2Y0ODlNL1IrZ3RRWDBUS0JSWm9kNzNra24zeXErbU5p?=
 =?utf-8?B?V3ZiR0dwbDNCREF5S3gwcWJJZWt1UXdBSVNnWUxmaUZOQnBHa1lJbXRXeEd2?=
 =?utf-8?B?cHJFWEZONkNOMXBlQVh3bFBZRnEvV2ErQ1plQkdadDlTci9NQ1R1V2FLYjYx?=
 =?utf-8?B?M3p0dXBoREZaZHE1UG1EYVZCcW1BZ0I1VGxCTkRaQmxEZTk1ZGdYUWF1QnRP?=
 =?utf-8?B?bktwWWZKb2Z1OVBOdWNQcUd2TGdsVzI2Vys2Q2tXYWYxYnV6dzBRSDc1ZlZP?=
 =?utf-8?B?VG54VW4vdUtVbExOc0JXcCtNcWg2WHhWMTZDSUJLazF5MEV5Zjhpa2VQY2pK?=
 =?utf-8?B?aENnV1NtVFpDeUJweFBLWVhGQW82RWR6MjMyaEx3MjlHNkZUSE9UalVnWmxB?=
 =?utf-8?B?ajNUQ0tNY0w0dlEyWDdlNXVna1pUMWt3MVZ3ei9uTVFOdzlXRkdsNGZEd1lM?=
 =?utf-8?B?SEYvTFB5Kys0SVVEMEZoUG8wUnpzVDJNZExlRk0zM2dkV1BhM0NueU5xeXNl?=
 =?utf-8?B?YVNHR29oa3FOdVZUaXUxTUNVbEFXRkwrdXkwNnZSU09WV25WNUhkeTBYRisz?=
 =?utf-8?B?eUxDT0RTK1J6cUUzbzZXd2hZRlhsMkZreTJKQTNkcVRmd1E1dXliQVBzVGtP?=
 =?utf-8?B?QUxPa1E5RVpHNVRndGZ2Y0p0a1FEQVNyeDJYU2ZNZnBSdTZOUFJWRVF1dDlh?=
 =?utf-8?B?SHhhTSt3aDd5ZHR4WWYxYU9KY1k4SWRJTVRYWHdSaWZ5L2xGUm9GZjZvcnF3?=
 =?utf-8?B?YnNKTnVQWG03SkFibG5EZklyZEQzckJSRE9jKzg4cEp1UFA0dkdXamFTTHBO?=
 =?utf-8?B?cVlnTUtXSm1IZDZ6ck9OYUJoZkgrSDNURjlGbkVJZzVMeEhtVUlMc2IyTEsw?=
 =?utf-8?B?LzdsM1pkOWE3MUhGVFBSZUFlaWJMQ1ZUQ3dyd29QaDVqZDY1TERXWlNEZThn?=
 =?utf-8?B?cUJ0ODRvRjhHb2RWN2lPdzV2YVJIdTlQTDZkbG9QNlhqSXhWVHI2OFo3Q1dw?=
 =?utf-8?B?TVlXWGY4SDAxZURlUkFrbmxGcUJRaG5wRWF3TlBvN1cvRHRIR0FFSUVtTUtH?=
 =?utf-8?B?eU1Ib0FBSkxsaDlSSHRGeUdtSVVqaytTSXJpSHdDdzI5TmFmMm9oUjMxc29Q?=
 =?utf-8?B?M1lVZHU0Ym5WeGNHYmhvWVJYNENHaDlKZk40RzlWc0F0V25Sbmg5QXY0UzVN?=
 =?utf-8?B?RThia0pDSnp2NDQwbmIyeWVyYUFoM0I0K1ZOdHQ3UmNEcTEvamJ6QjlETkRm?=
 =?utf-8?B?YkNScG54cCtDR2crWUc1OUwrc0MxQU00dVpxd245N25TVUJoZHpDTnNVa3p2?=
 =?utf-8?B?NEVTcFlpS1JGYnBMS0FsWGJER3F6UWlXRjg0TzhPa3pTMXJmUnRWRjE3OTNm?=
 =?utf-8?B?YjUvcmNZRkdaNGMrMGhURzhSWnJ5N2VwMko5bThrZXlqclZOaU53bmU3L3g3?=
 =?utf-8?B?QTBpeWowc0Q2T1I1WnlvMXVQNTFMT1Zaa01zZUhOc2Rvc1JuT2lGM1VyUVJo?=
 =?utf-8?B?RnE1bVMrOTgvbGN0ajdURUZMZXhmSGQ4eTE0TEtRTnF3T2hWWlpjcldkRDY3?=
 =?utf-8?B?K2wrRkNzUzZoTWVJWm1WYnpVVzBpSCtZMnc5K0ZrbnZlSERTOVpGWVlQT2ZU?=
 =?utf-8?B?R2QxWStDZ3BZeFoyd3lIWGd4SU9XT0dmcnBxTktKWGJyRzBMdll0R0pHbnd3?=
 =?utf-8?B?bFJiZU9ISXRxMnRBMkwrTkliMDEzQ253Y21LTGg5Qk1zUjBGZzVLUFJkNElX?=
 =?utf-8?B?a212cy92blhyVUhkRXZQVEtsWmZyRFowZmNuemVGRDhUWGtFQm1qaFN2QlJZ?=
 =?utf-8?B?VVJwMGcvQU1GZWRHQTRneFZ2UUM2QXp0VStVUnBnT2ZPemF2d242WW15c1kz?=
 =?utf-8?B?VVFTZkFEUUZJVmVVcWx2Y2M3Z1FaczVLdEpoQ0dpR3RwQWdGbm11RWlxZVlG?=
 =?utf-8?B?Z2xsL0c5d0pTVWJxbFdHU1ZzR0l1S2NuQTlTV0ZMNk1NZnlEOWxBc0tyd3N0?=
 =?utf-8?B?djBvckxBOFRQU3kwa1N5UitOQW5IZFBxVzVwL20rTmR1YnB3ajFoMGhSWDZL?=
 =?utf-8?B?UFk3UGVnUGtmTTl2elhuV1RyMUdLeU05SFVISG1Zb0FiSWpyMlp1dWUvL08r?=
 =?utf-8?Q?Y3Nbndb75hTtPEM8oa6RnLFon?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdf1890-3211-442e-c072-08dcec2e47fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:57:50.2707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0j+/HU/vuOqkbZ9OvKvZtMuH+nZm4BvlIIy6FltmhekgmdGUzHJ0seSQ6Pb4wFJfawl7O68pjPJdApnfL7Ag1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6143
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


On 10/14/2024 9:56 AM, Himal Prasad Ghimiray wrote:
> Add __must_check attribute for xe_force_wake_get().
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (#rev1)
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
>  drivers/gpu/drm/xe/xe_force_wake.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 7f285dbe6e2c..c60db78c44e6 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -169,8 +169,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
>   * Return: opaque reference to woken domains or zero if none of requested
>   * domains were awake.
>   */
> -unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> -			       enum xe_force_wake_domains domains)
> +unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> +					    enum xe_force_wake_domains domains)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index f0b27dbe7581..70faec9ae2d9 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>  			   struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
> -unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> -			       enum xe_force_wake_domains domains);
> +unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> +					    enum xe_force_wake_domains domains);
>  int xe_force_wake_put(struct xe_force_wake *fw,
>  		      unsigned int fw_ref);
>  
