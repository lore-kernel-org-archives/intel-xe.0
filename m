Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F0C25B79
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 16:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD28310E042;
	Tue, 14 May 2024 16:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsKj/nFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC3E10E042;
 Tue, 14 May 2024 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715704759; x=1747240759;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6GX3GKU2J2L7IiDF/UVBndF08kkj3/YRjdVsfrKyT3A=;
 b=hsKj/nFxyyYpqU6c7JTB18RCrvgyGrV0iFHy1NvbHthNVwyzBr+5aR+C
 hFTz98xn5BDBSS+mcdCGWjfkZU8vyaeVV0N0Jj5nIU8peF5Ij5p5xgmI/
 lfybrfa7FISuxud4zQz3yLWd/LgKnzD54l2jqmV9pjDNdyEAgi4dKcL60
 PbMQKnsCaZeAYiyA+kCOJ1cuesT71tpVF8k+w0c1Jsx3Zrza9f/zkJ7ap
 UDlYBjTAJiBTXxAytI3PF8qFaJIhH9y9FmyNO3+d++2LN48md4vsllG/L
 YS3X7dhLDK4V1kQ1C4mga0r5tQkBZdK+xXgYvGYLukZo3SNGPFasJZ3Co g==;
X-CSE-ConnectionGUID: oYSFfGI8R+qpNc2WSrfo7A==
X-CSE-MsgGUID: knoc/INzSQSRpDA0BN2aNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11873952"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11873952"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 09:39:13 -0700
X-CSE-ConnectionGUID: YHq0IZFeTvSB6bgssX25Zw==
X-CSE-MsgGUID: Z4c/+Ak6QvKEbRKUATFW9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30864016"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 09:39:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 09:39:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 09:39:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 09:39:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 09:39:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uz9ez1FuO2tkUG6WvwbFvnJNtDSHQ39Og6ldb0HrlBzZ2Fv3lgy34c4KGIk4ikI0HQo/tZe264lwXN/kPSfOvaVbZFvdgBvjAoxyHaU0mmwZlM5VHH98WIAEyVjWud820o9epg/6UBMYi8uQI+E6T6ImfGcWdQztdItGLh73M0gkAluy76u2OuSzv1EmX1sLrYnRU4hqAdPSY1skyU5Wofjr2K/eNg2dPcp64hoolib0/3lBxIGYUNcFLCkIAFzzjUVrSeg+lIzwIsiUIoPjx7nLg9sFcnQm+2udXVsLtds/mTo4A5BeogvR2oYhUTtcKZIFpUaQK83CfvUy2kMpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t49VpOShJ2vJnU343dyNi3G5zN7dqVkAwq6MsvPFZzs=;
 b=LEvZ5XtMz0M396ge8WsKMCa6Vgk5r8aC/A0HSQjcFCRHY8S4/cZkKdU1jIMe0xuBmW73pf3k4yRryCPEDTCngj/OFJViw7qG8ZOxRIyJI4nAbP24FYMFmPDlDjMdEXCbfj+yKVnF5nxsiiP7GC1Tpwmn4vKTK8r2m0ImvdU4mPyMfSdfIT6pRBvltFbHoqFMSI4HiWyMC2K1IrnEXQf8Q4GLxgZhRhOsVGbD/OOp37nj9ChxPo+FIlWt7w9viyezHig+0riZdW2jRgonC6Ab+UKlMV2ptTGjMjcq0eYz1t4iV214P83asc7lt0kNd2+qe/YEdQJQCI2eUaoJf32qBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 16:39:08 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 16:39:08 +0000
Message-ID: <ef48d5cb-7ddd-4c88-b0ef-d1def71aafd0@intel.com>
Date: Tue, 14 May 2024 22:09:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] tests/intel/xe_pm: Only check the rpm resume
 after the first mmap operation
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
 <20240513185518.772398-4-rodrigo.vivi@intel.com>
 <c33614a5-2e89-427f-8e8e-6126ef728901@intel.com>
Content-Language: en-US
In-Reply-To: <c33614a5-2e89-427f-8e8e-6126ef728901@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0241.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 9415edbc-f0cd-4cd4-a9b8-08dc74346043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmZnNzcrNnk3ZjRIc1JEUFFIMmhHam9PZ2dHUlRSNUpDOHNLU1pJYzJkS0JN?=
 =?utf-8?B?Vkd6NGlWbWNKNnBsM1Y4S010RG5zZ1VIMGdVaE5GeGZYZ1dZYWNQQ2YvaDcv?=
 =?utf-8?B?L281aGJDd01nOTBUMHBOT0NSeDEzcWZyb3RwQVR4MW5yVFN0cGVYcHJOTytV?=
 =?utf-8?B?SXJvK0tvNStnSnlXUXhqeHFwUmk5blBBSjkzU0FjZzRwUVMzUHFRMmpkK1pJ?=
 =?utf-8?B?bmNsMDAzQ3J2M3lMN1FHekhCRm9qeVhDNWpydzl2ZzdQOVEwOG5GaDBRVEQv?=
 =?utf-8?B?ckVCTW1kQWlpTkw1NEUwdndJWnFDVXJFenZwQmk0RzNaZ3FkVGFNdGZ6S2Jm?=
 =?utf-8?B?RUJiY01VcWU2Z3doQ1dFVWVHenlOU0JNeFVabHlFY3pKVWdrQlJrS1l6enpq?=
 =?utf-8?B?TUVWNFVzb1YxTEF2Y2R6QlFhWjFrL3g3VllJUXRodlhrUjRqSDViUytseFJ5?=
 =?utf-8?B?STBmYThGdFl3M2RQMVpHNUhQeS9ZQzV5eUhuR1YvNmJSanRmL2s3cHY2K2Zs?=
 =?utf-8?B?d3NydXF2Wm0zYm5nRXpIMjQ3bnMrejZHb3ZFT1JlVkVCRWcwV1lCWXMrMG1D?=
 =?utf-8?B?STI3MHhOWnFGdzNsejlIZ1gxNEdIMVFYSmxqa1pJQUhPN1l3ZVUwMEt6emw2?=
 =?utf-8?B?ellRSVJSYnF3ZVJmeXp4Skw1bkVrSVNESXRmZndQcUs3M1FiN3RvcGZWa3lF?=
 =?utf-8?B?VGlqZUw4UThIZEg2eXBGaURHdzdBc05pVlU5UUtaQ2hZWXVsaHBBQXpVNzlD?=
 =?utf-8?B?eTZweUV6SDdHZVJwTDZqUXBxcGNQeVl6WFJ2VXcySXZTSEJXVndFQXBUZXdB?=
 =?utf-8?B?Tk8rZHF1Y3RoOEg3blkzWnRVN3lQTFBwb051WklSSDFCZG1hNmFJZGJpTjVq?=
 =?utf-8?B?RjVNck5LeTdwUUliTlpka1BsaWROSEYzcks1aW1STG51MVRJeG9waWhPOUc1?=
 =?utf-8?B?QzlhM3M1azRsbExVc3VKd3dBNGk0dnVQcVMvdlpHbTNSeDFRaExOV0J3T2tJ?=
 =?utf-8?B?UlJIZC9FL1EycWVJWlBqblltbmMyU3dwM0FRaU5QbTlPWVlvRDVHdFhBcE4w?=
 =?utf-8?B?bk82SGlOVXVoMUhxWnB2UGZuWU9wY2xTZTM0ZFNoOXZ6cm9oazNZTXNudFRW?=
 =?utf-8?B?NWphcVVzWXNKbmwrbW4xS29WU1Y1YjdPek5DdlJPaE16dmFYRlNYczVKREhh?=
 =?utf-8?B?UHFtN1JLUVFRWk9vdDBVM0hTVjNsdmQwTDBEK2lMcURaSm4xTDZQRVI4ek1M?=
 =?utf-8?B?R1E3ZENzeWtWcWZIM2RuUVlRU1lmenU1VktjYkNwVEhuKzhyeVRwbElNZmpi?=
 =?utf-8?B?emx1MUt1d3lIRGdtRWp0ekhBS3dJYUxQL1lwZ0tSa21QRmsxem5mTWh6VkRU?=
 =?utf-8?B?TWlIVVhSNE9HUXU5WXI2T0RZM0lWRm5KU2plL1lXT0N1QWVwMmVuaHlNOVhz?=
 =?utf-8?B?UTN2U3liaXNsR01wVytuNEtHTHBISjVibVB0aXZMQ3dtM1RVT1dGUDZ2Zisr?=
 =?utf-8?B?Z1RTYVlSNUVsRm84TllpTmpVS010VHBLM3ZnODg3c0hVOWlSYVJBNmhRTDlW?=
 =?utf-8?B?cGpPZ1F6elNDdXB2dWprN1lBUm1ITlpzNExQUVEwVXRPemdhWk8wMTlZZTdy?=
 =?utf-8?B?d1ZQQ1FZZGd4bEZRWm52VFNQVFJoQzRFdUpDY3JLZWVMM3FnNCtmTFQ3NGps?=
 =?utf-8?B?aThSMEhyMWIxWVBaYzJGc2ZMN2ZybmZVSzZqNEd3cldNUWtQYVhTMytBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFd6akRwNTlQZDVxWU5EZWo0bGUzMDRKTlFsUm9CR1FpLyswbncvd1dwT1VW?=
 =?utf-8?B?V2ZYazJYSlFkdjNpMTA3MjAzV1NHQXlYcWgxS0NMZWtkMVYvV3YzdjRnNTBv?=
 =?utf-8?B?VlcrN0o0VGppcm9lVks2dzNhdmRYeUxkNTVZcTVsNHlvVURvcElydFNhQk5J?=
 =?utf-8?B?b1ZLd1ExcTZCbEZKb0hidHc3UlZoeXZsbWRPTjVoZ1NJWkZ1OGhJSWtoTWRy?=
 =?utf-8?B?Qml0Z05hb2xqQUg3WE42RDNzQTRLZysxZjJlYzcyNU12b1ZLU2Q0NUlmc2Fs?=
 =?utf-8?B?QlBENG5PQ3VCRXp4eEJ6NlQ1d2hFaDlpcDdxTW1JMFBaVzVzMWNuZTRwYXpI?=
 =?utf-8?B?R2ZIMUFKZDArNzJHRi85ay81cGU5L3o2NE1BYkxiSHU1WjdvZDhLVUkxS2dh?=
 =?utf-8?B?blByNnFRelNyRlJibVhvSWRDaEZYeE1qOGlNSUtLckNvTXUwNTNKY0VwWlJJ?=
 =?utf-8?B?SHQvREZQclRlOWcwYVBqZ0I2SDFtdVhBQjJvc3Y5OWxrK0ZjTjBWQU8yY2NW?=
 =?utf-8?B?dFY4SlZoSXdiTzdSRFVyU0JlcE02VmJuZGdoNGhUVFhKalJpTmZFTXNMVm11?=
 =?utf-8?B?M1ArN3czcTU5bFo3V0JkK3hueHVxYmlzd1dnN0JlQVllOUx5eFVMeWdvaEdP?=
 =?utf-8?B?U1JPZ2VTakdDUHZ0aE55L09EcU5LTG9ESTBMLytKMUV4NmRVeCtPRWZocktt?=
 =?utf-8?B?OEk0VkRKcmNxZ0Z2UU1QU2JDR3BVR2JTcjlYNzdEZmJ3WFhzUHN5YkNsNUdx?=
 =?utf-8?B?eldMc09jeFlyKzREazk5bExpb1dFcHdNYjZsOXBCUVU2Nk5UZ3lWci80QmVs?=
 =?utf-8?B?dEwrTUdlTzliSzVBYXlHcjh0YlkreExIQ3o4S0dxSS9MaXM1b3RMUXl4NHdF?=
 =?utf-8?B?QXZxUlYzanR4bXZJRHFTSVdoT0FEdDJsejZFMDdCaDBZa212eTJhbVhHZDIx?=
 =?utf-8?B?a1FjT25ldlJ5YXdkaDdnU0Ixa1BwKzdpMm1tbXpNVlNKYVRsN1ppWkFrdEwr?=
 =?utf-8?B?WnJlVm43TFVyajJUa0ZEaVZncUdMWnlmNW9TTGxvdU8yNkx5QzBxcWtFenQ4?=
 =?utf-8?B?ZGRHVXk4WUhLaHFnMkRqWFZSeWNBQTlLK0NQWXNlYmwvSVplSjZ0L1NYdTBC?=
 =?utf-8?B?elI1Qmc5TG1VMHI2dFBPV0JlRDlMZGc1MExtMjQwcjd5ektER2VMaFF1aVFR?=
 =?utf-8?B?UDA0OG1SN0VvTWZZb21NcVNxN2wvZkxyajJ5UmNjQ2dCaHQvQW41NU1uLzhC?=
 =?utf-8?B?U1JCTlNyby9tOEpFRVZDZGJtM21WYlBxeGJIYUpiUlU5Mi9VSUhld0xJcTlS?=
 =?utf-8?B?N2Y0MlQ1SVFsQ1d4d21Wa3MyTFRVYThITHp1a2g3c2hHSUpUKzBidTM2V29s?=
 =?utf-8?B?ZDJ0bmZ4bHJ0bjNQUUZzVWFPV0Jqck9FV255eVpXQldCMW9iVWdOUVplcTF1?=
 =?utf-8?B?eEoxRDFQclhIV2Z5RVNkd21YdlNKSzJudE5udzBYN3M0c0FuNnRqRlhXVDRW?=
 =?utf-8?B?TmpIdUI5bkpnSG9aM2FzM2EzbnRPdjNicWM0eGRNTmMwanJOYmFvQXBLS3hO?=
 =?utf-8?B?WEVWa3ZyNmVzK2FOQUZvb0ZSbU04NFo4VHh5RUJZTlZvUGFYU1NIQkVNSjRz?=
 =?utf-8?B?Sm1sUXhoNGNZdnNuTzRFcmhlaERoM0NaaHdjM3p2aHZ0Qm9YNk5qMnFWYmg4?=
 =?utf-8?B?K1RNeTJHY2tPU2tWd3RVMDlOT0FiK0ErYVJWTFUxWCs1U2hoNXhYZDJVNjBu?=
 =?utf-8?B?alNVU3VYOVVHb3FzK3BTM0o0alZaOFJJNXBXNGx3ZXFpWTZCUk1XOU1DdUM5?=
 =?utf-8?B?VGZHbGRRSENJakFZcUxkRUMyUGlmTVhuOGNUUlNXcjY1NHF4RjlvOGpoY29u?=
 =?utf-8?B?WmF6bU40NGR2NUFUWGRKYjQ2NzIvWFpJay8yS3dPeUxFQ0doenJ4UnRoazJw?=
 =?utf-8?B?cEUwbnlWMmdqRGR3L211dWsxZ0dwVkxVbG42M0NNQUE3RTZURHpERWcxVlNG?=
 =?utf-8?B?T2dRSk1IcDZ1TmJHRzlSaG5tSURKV1ZSNm9FYVEvWnIyalNuUVZnalBOb1p0?=
 =?utf-8?B?V3VQWElRY1QxMjZxV1VsUUNXeDJXQ3AwaGtzWnl2WjVsQ0xjbzBod01CSWNw?=
 =?utf-8?B?Vm0xZ3E1NXh2UUlOVXNtRmpYYmdTeko2RkF1U1Jyd0ZEOWhlekZlc2NaODhH?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9415edbc-f0cd-4cd4-a9b8-08dc74346043
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 16:39:08.5219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eziBm0OK1B6gUBa/x4zakmeVDuPYy+SpKivPYk8inGVpEAitEqGc02p6N190rmGw/+24iTPBp0NO1xUpuQNRpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
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



On 14-05-2024 20:49, Nilawar, Badal wrote:
> 
> 
> On 14-05-2024 00:25, Rodrigo Vivi wrote:
>> The very first memory operation on a mmaped region after runtime suspend,
>> the device will be resumed if the memory used is vram.
>> However, after this first operation with page fault, the memory
>> can be migrated to the system memory.
This probably due to xe_bo_evict_all() in D3 cold.
>>
>> During this migration, Xe kernel will get a notification at
>> xe_bo_move_notify, and the bo will be removed from the
>> vram_userfault list. Then, on the next suspend, we won't mark
>> bo for page fault and resume won't happen and the active count
>> won't increase. This is okay, since the bo is now in the system
>> memory we don't need to wake up the device. But the current
>> test is wrong, because it assumes that the bo keeps forever
>> in vram, what is the issue here.
Not completely wrong in D3 Hot.
>>
>> Only checking the resume after the first operation is the
>> enough. But also, ensure that both read and write operations
>> are actually validated.
Should we keep "first operation" check only for D3 cold and previous 
logic for D3 hot? May be combine patch 4 and 5 to handle this.

Regards,
Badal
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   tests/intel/xe_pm.c | 36 +++++++++++++++++++++++++-----------
>>   1 file changed, 25 insertions(+), 11 deletions(-)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index 72d484163..81226a910 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -37,6 +37,11 @@
>>   #define PREFETCH (0x1 << 1)
>>   #define UNBIND_ALL (0x1 << 2)
>> +enum mem_op {
>> +    READ,
>> +    WRITE,
>> +};
>> +
>>   typedef struct {
>>       int fd_xe;
>>       struct pci_device *pci_xe;
>> @@ -525,7 +530,8 @@ static void test_vram_d3cold_threshold(device_t 
>> device, int sysfs_fd)
>>    *
>>    * Functionality: pm-d3
>>    */
>> -static void test_mmap(device_t device, uint32_t placement, uint32_t 
>> flags)
>> +static void test_mmap(device_t device, uint32_t placement, uint32_t 
>> flags,
>> +              enum mem_op first_op)
>>   {
>>       size_t bo_size = 8192;
>>       uint32_t *map = NULL;
>> @@ -563,8 +569,12 @@ static void test_mmap(device_t device, uint32_t 
>> placement, uint32_t flags)
>>       
>> igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>>       active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>> -    for (i = 0; i < bo_size / sizeof(*map); i++)
>> -        igt_assert(map[i] == MAGIC_1);
>> +    for (i = 0; i < bo_size / sizeof(*map); i++) {
>> +        if (first_op == READ)
>> +            igt_assert(map[i] == MAGIC_1);
>> +        else
>> +            map[i] = MAGIC_2;
>> +    }
>>       /* dgfx page-fault on mmaping should wake the gpu */
>>       if (xe_has_vram(device.fd_xe) && flags & 
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
>> @@ -574,12 +584,12 @@ static void test_mmap(device_t device, uint32_t 
>> placement, uint32_t flags)
>>       
>> igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>>       active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> Above line can be removed.
>> -    for (i = 0; i < bo_size / sizeof(*map); i++)
>> -        map[i] = MAGIC_2;
>> -
>> -    if (xe_has_vram(device.fd_xe) && flags & 
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
>> -        igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
>> -               active_time);
>> +    for (i = 0; i < bo_size / sizeof(*map); i++) {
>> +        if (first_op == READ)
>> +            map[i] = MAGIC_2;
>> +        else
>> +            igt_assert(map[i] == MAGIC_2);
>> +    }
>>       
>> igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>> @@ -781,7 +791,8 @@ igt_main
>>                    "when device along with parent bridge in d3");
>>           igt_subtest("d3-mmap-system") {
>>               dpms_on_off(device, DRM_MODE_DPMS_OFF);
>> -            test_mmap(device, system_memory(device.fd_xe), 0);
>> +            test_mmap(device, system_memory(device.fd_xe), 0, READ);
>> +            test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
>>               dpms_on_off(device, DRM_MODE_DPMS_ON);
>>           }
>> @@ -800,7 +811,10 @@ igt_main
>>               /* Give some auto suspend delay to validate rpm active 
>> during page fault */
>>               igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
>>               dpms_on_off(device, DRM_MODE_DPMS_OFF);
>> -            test_mmap(device, vram_memory(device.fd_xe, 0), 
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +            test_mmap(device, vram_memory(device.fd_xe, 0),
>> +                  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
>> +            test_mmap(device, vram_memory(device.fd_xe, 0),
>> +                  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, 
>> WRITE);With a comment this is
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> 
> Regards,
> Badal
>>               dpms_on_off(device, DRM_MODE_DPMS_ON);
>>               igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>>           }
