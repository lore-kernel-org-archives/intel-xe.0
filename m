Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2009CFB43F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 13:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79A10E209;
	Mon,  7 Oct 2024 13:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcMkoQ5h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62FA10E209
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728306026; x=1759842026;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=MDFKmuaxqTSEsaTyzXb06vX4kt5mtzF9dGDJIjN0BC4=;
 b=EcMkoQ5hJtGR+QeCciLVRbC3vt+TeQvdh2UHCr5CDZWUAQHP713FeIoK
 3ZFqV1ToFOhod8vtx4ymzJNZV3/Or2eC4q4EY1MWISAXw8i8GuyI3aq2V
 +ehvSszy9PqTsGUKLThYOq5edFGtvvo3SNP4Xo1Q+FzdEw1c8uTVB4UBG
 jTy79ILuCiZ9SA+IS5Dzn3VwhOf/8+VgfwFKYYSz+qIex3pBAyjEqtqAb
 P7C68pSIzTMa3hQt1dwlCxklfJZjGniAHj9aAUnq/GUVhlMyweSC5Vpte
 EEt4FSlscMokxk3+uErpXXPEaV6qLv2ZK3p9NUiae8GIKLkqUXmWq89DM g==;
X-CSE-ConnectionGUID: JJMWFK/nTVepzh+5vC2Tmg==
X-CSE-MsgGUID: pn1iX0okRWqvuyyppXqx8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27337430"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="27337430"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 06:00:22 -0700
X-CSE-ConnectionGUID: C0hFLKsUSVST3QSJSEDFVg==
X-CSE-MsgGUID: RuBT96JeRv6UgOAQ1upNcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="80445290"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 06:00:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 06:00:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 06:00:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 06:00:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 06:00:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI2GjabCMYgduvPf5kQahNqRULieZl1IUrQtGLYDdQ1dK9BmmIvpFIwNqUQBR9Fd3G0dYfDP+K1WOtE4IGn/ABGIjSsSnmztGrKeG80d82dggggRU0OIJLGDpgFc1AqAkbd6STKpVI2hjof88ln7/RKbFa02hacZahHx6mQLmMTicaFsWcIe+c4Dl6zGeKyDSsURfCvZEJ58CkieamWvLrovL3WBedI5XZ9fSiJOXP9zwTFIxpntDUQ0+BDupTYcH5p/E/5FG3SgeMQB9055DT4DPJ/FwQIlcht4vgZP3jkfiadh+c0IXqrbYloOIRzfH+yEpMlgbPxGqX0l8pwg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9qNQOIu5LITMej1t39xAVJsbcS5gBI5tH5TIkTrQZs=;
 b=aU5Xys4kY4dKj7ydU4cJS67EDfi4S38C5mNyPvUNWmzdIpHq05MxGG1iSZsopzqdLGTtIa2f03iZHyLRu84+lCenQphsldnplotJRO4hIGCKX2yp91xL/wWwpU9zJmPX6p0qYV4H76K1DliTDSkwrATNHdJYH247BsW4cYhuNN43/dgRIYTjSfqYwjvZ7MxamDWiAZeNHJ5S9BAEhbalDP/bzXqELPClIvQahJB0+niiylY6jXIUJZOv8Pjz6CsndAh/sxTEFKIKt+X+DmruSQmytmm3KNODYCOYAOvOoLYUaKomkjNrzfM0nQerKJ2grX9RqwLVzY2vwL0lB9Dq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 13:00:18 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 13:00:18 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241004212037.1431184-2-matthew.d.roper@intel.com>
References: <20241004212037.1431184-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: L3bank mask is not available on the media GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Shekhar Chauhan <shekhar.chauhan@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 7 Oct 2024 10:00:12 -0300
Message-ID: <172830601242.4006.10113903163161827172@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:303:87::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a945e6-8259-4351-67b1-08dce6cffe6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVRjYVhGRFRnZDhDU3JOcnZ6R0M5b290bUJNYkYvRmYrb3htQVh6ekd6ZFhE?=
 =?utf-8?B?ZWRUNDMxbE9NcnhQak1tL2xqemY4cVQzc3ZpYUpOWGg0TTY3WmY1Zmk1TW5n?=
 =?utf-8?B?UkxlczVIR3VyMnNhMWM4Sy9MMXVqc2xyQzh1RjBqUitUWU4zL1pTOVJJMEh3?=
 =?utf-8?B?T1F0ZjJjczd3dXoyeEF4dFh1OEhrRlJJY3pIMm8zWDdoNWtmSEtnQ2tXdzRz?=
 =?utf-8?B?ZUpjb0FNQTNXaEQ5eEFlQnNEMGdRRE1wZmtLdUdEbnRrNlluY3NvaU43eFBU?=
 =?utf-8?B?cVBvWGhzRGhjSExIMm5LOUpwTnYrd1JCY2ExaTNPVnI5blNSNGkvY0JkaWEv?=
 =?utf-8?B?NjFMUDZURjc3aTMyeEowMkp6SjZkUVAzeDRRV0dMTGlhVmNUTm1YWGszOHEy?=
 =?utf-8?B?L2ZyZThuZS9rTWVJZ0ZRSmhxMTI5SFl5K2dZRThUKzZJYnl3T2p3cElXbjU4?=
 =?utf-8?B?a3B6aC9yaDlKZG9DdEttUnFQVGs0YkhsZnpqanZZOExKem9FRk82L1RGMzNv?=
 =?utf-8?B?eEw2anl6T2FkL1graGhhUXArZk1hREEwNnpEZG0wcUVLN21FRStkTnFPakFK?=
 =?utf-8?B?M29kTUNBTGdQTmlhMzhya3BhVGs1MmUvd202SDdDdkJ1LzBzamR5K1dDQ3J0?=
 =?utf-8?B?MEoyVU1XMlplclAwS0xwTWM0cWVoR2x0aUtZNXlzSVhQQlBjNTA3SGZjRHZ5?=
 =?utf-8?B?Z3V2K3p5V2xmRFJyNTRMejB6S09YSXJpaHl0UHBZclpTNkY4bVBvZVBoRGJ6?=
 =?utf-8?B?Z0FZcVJyeUR6czU1bldrd0tPMmtBZ1NuTmhYMWJWWW9jUWlXTmxHOG5sZGVS?=
 =?utf-8?B?N0VsRXVLR0R5N0VGRTl4a0J2V3JiUEsvM1VJRS91R3gyc1ptZTR4YzNRRXJW?=
 =?utf-8?B?YUdwbk9VMHdvUitrRUNiRzU3UVJlRmt2M3J3US91OXN0cFZhMG81czV4UVdS?=
 =?utf-8?B?aktZUWFXRVNrb1RKZGdlaDZmZDBQVnRmam9zV055NmtKWVQxMzhuU2IrZ1JC?=
 =?utf-8?B?eDJDNGgycWJ0Y0Yrd2FuNXl0SWxpc1lsUzUrdUhIMzJNaEpqdDF3Z1RRMW85?=
 =?utf-8?B?T0FIY2tibDdsZ2pDV2tNeWlsd01idEpMeEJDUTYyTUpZcUpHR0xGR1cvSGhU?=
 =?utf-8?B?VFJLWlYrSnkzOUMyYmVOTnBnR3hoOWMyOE5HR05GSmVQMHlReG4rU2NTY0pn?=
 =?utf-8?B?YzNnbmFvZmRxbjJaNHJIMk12QVBxakFNd1hkWHgvNGNjejRBMGk2TmxrRW4y?=
 =?utf-8?B?eWFpKzIwc2p1dXlKRlhVSG9MRXhBVVlQNzU3Y1hKUDB0MmkvaTR0SFYydXdr?=
 =?utf-8?B?VzhJMnUvNWxzUG9hTVQyQ1dwQVptSEVnOXlkeU9PampFZ2pzMGsvQ2NFTXBX?=
 =?utf-8?B?NHpPNU92R3M3M05EK1AxTkpRMlFyb05CT1FpR1llK25HOW1Pb1B3SlpQTnNs?=
 =?utf-8?B?VENNdTUxT3BHOHErZTZTWDRYamlqK0s3Y0hILytGbWs3NDdNZGRkdlBxbjVq?=
 =?utf-8?B?Qyt3N3ZTYUZNTFgwRVBIc25vNWgxbkt3ZVpJeW9IdXBKZFRYc2kvN0V4allK?=
 =?utf-8?B?ZlRKSW52NEIvanRBMVozZTNoMW43L1ppcVczN3dWWE4vb09RVE5CeHV6b3oz?=
 =?utf-8?B?VzRhdDgwN1JIdkRjaFkwUWdTazRNNW5BSlNBSHB0MnY3bEJRNUx3bFB4ZStt?=
 =?utf-8?B?Q2VpSC80cDd1ZHZSVnhueEc0MzRkUGlGWEowMUVCUytrQlhQQzNBcWJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1lRdzhlWWJKUThkVFMwbGNFVXlTNDhNU2U2K1QrMUFaVVlGdjdjQlNUUGdl?=
 =?utf-8?B?MkNmRHZqbWt1cENFcDRyMW9KSi8rU2ZZSkVLb0tsUGlNTDJQdElabXQ3c1pi?=
 =?utf-8?B?NzlwcVg5M1ZWQ2t1UkJCMVpVdXNXeXJ2MWRVWTRMTUNWTGZNclpzYmpQd1FE?=
 =?utf-8?B?dzk0WWplaGhNeHBiR0xzY2dzZmxmbzNLeGdmRXRiUWg4MXZlb1JoK1Q4ZUZ1?=
 =?utf-8?B?eGZJM2xsbmtUSDl6QVFFcldrVlFxMUllZGhDNVVuN0o3bW5Lb3FKSnB1K3ZG?=
 =?utf-8?B?LzZ1ZElHNUc5a2c4c0NFNytRbVhXTUxJd3VVdng0M24rQ042RGhEV3dEWXI1?=
 =?utf-8?B?SG8wQTZUdnV1c0dZZVBBd0IycFhENEwyV3Btc0pyL0p3S3M3Zzd0UHFlKzhS?=
 =?utf-8?B?UktoNWRRaWRuUGFPQ05wOW1hSnRTUTBNMXpwNUh0MExVeVN2Sjh0MXY2NVQy?=
 =?utf-8?B?MkpVR2JXcVhDMXRvc3R4UjZIeUdvZmZ1SGZWL0xzVnFyaU14SjBFd29zTys5?=
 =?utf-8?B?MTRrWmVXKzluSWM3TjVqdlZpUjNCTGo4UjFXUjJxSUtlUTFUZXVPd045KzBh?=
 =?utf-8?B?ZEtPT0FqZG94RWxhTGh3bWtYRE9GNGlvdUtnWmlpdXdzV3dUQVB5RWpQU2sw?=
 =?utf-8?B?QVpCelNLVGRPWWlpSTBMOFgrYm0vMkkwV2MySWZGVVgza25KNDBpRzNHT0hs?=
 =?utf-8?B?ZlIvZFFaeWdhbGFBUGJ6bVIwdzgxa2U2SWY5cndVK2IzditHcjQzTk43YndZ?=
 =?utf-8?B?N2lWNmVRYUxYeG00QUI2dHhXRXpjQXVJVFV1MUgzQlo3V3pQSTlLM3o5c1Rr?=
 =?utf-8?B?V00yejRGcksxWTd2ZzJuMkp2SHVYTDVsSzl3SWl0ekZoZ3NPWEFjY0IxcFBn?=
 =?utf-8?B?eFNEaW9QbW51c1U0WXJXL0JaWCtsUTJQM3A2dDMrMW9xUmd3UmZhbi9GTHQ0?=
 =?utf-8?B?SDZ6emk2S1hLWW05LzFSOFZrc0ZwNkRrcTF0bUdwTTh2TEwwOFlzR0FyWlBF?=
 =?utf-8?B?VEFvaFhyREZ4ZGlZbm5SVVJtcFhzVDFlNG5ocDFsSm4vRDBDRkRCZk9kTlV4?=
 =?utf-8?B?ZXVrdFJidGFZaXNYZVMrQ045NlZQNVNhaWNwQWxobGRMSmQ1KzQrTy9EMjBk?=
 =?utf-8?B?SEp4bG1VZ2pDbEFDWThKWWd5OXpZRXNLS0VzaUJ2SzBkS1ovWXFkNCsrYVVw?=
 =?utf-8?B?cFk1dzIxVjZ1YzRtQ3ZMM2tFQVp4cXEyZ202RG1pTWtZQmlEWC9jYi9oMzUy?=
 =?utf-8?B?TGRGcFNwVlhpRU1nN2tjVFhzWllYQmtYOTRRWk12aTlJTG9ZeWdGdzgxWjB3?=
 =?utf-8?B?UTFNYWltQTN4VWdwbGZDaXZkOWFralBRZ3g0YzhnM3JOalN5VjM2aEFIVWI4?=
 =?utf-8?B?WkVZeFBZWjBTVDc1K0NNSE4rR1czdFZvbDBXcG5SK1pBUlcra1M1cDkzckQx?=
 =?utf-8?B?WDl5VTkwM1ByM2I0b2R3RTVHRmkxWHJPY0hMVG50WTVaNktTZHZNODhOMnUw?=
 =?utf-8?B?SGpsalZEVWVpNjZQbEpBWTdpanNrTFY3a3JOZlB4eVBGbXRMdlBaT1pSWFZy?=
 =?utf-8?B?eTJKSkZ2TVlzL1BVUG9IVEkvcGQwUVBWSUR3UGVnMU1pYnVRUXN3V0oyS2dI?=
 =?utf-8?B?NENKNFhrSTZJWFhLdTNjWjd2Z0VkUU44RjUyVUM1WkxnL1Zyb2FUZWZJN0N3?=
 =?utf-8?B?RzA4UDkyOThxMFEwTGlFRmR0eDdhUEVQU29DWHRlVTAxWWNGZWQ1eG9sQWdN?=
 =?utf-8?B?bFpWdzYzck9CZ1Iya1pyelZmRzI0amRJNVU5NVR5U2Y4WERUTjBTS2YzMGx2?=
 =?utf-8?B?S3ZJYzZRRGcvSUhsVitwZkl4YVVkSVVFYUpRZlZVU0FhNEdiRTUyVGdUWldz?=
 =?utf-8?B?OS9sR0U1OENXbTd5Q2ZSMTVTTnd0ajVmeTJiTXpIOTdEdjhPY2RjK0RQZFQz?=
 =?utf-8?B?K3h1emVLR2ZqNFZiQVhvMlF1VVROVzZqYm9mKzhWbll5OGova0tjMXdXM3NL?=
 =?utf-8?B?VVAvTDAvbnlSdzB3QXRtS2VpRXlOUHg4MmlnM1lQQ2Y1RjNDQWNCMFJ5Tndl?=
 =?utf-8?B?ZHEzZnFUUVRIWm9ibm52SFlRaVh1MEV6R2xNZ0lsVTJZZjNxempsZnVlM2dF?=
 =?utf-8?B?dHZYSkNDR05DY2ptM3FEdkNJTURYdzQ0Z2dnSHhTMXN5YkozSjgvanVrQ1ov?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a945e6-8259-4351-67b1-08dce6cffe6c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 13:00:18.4065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11WO3ft2iBWo3WiGPvCX0laqSyMoChYomaTFtitovowqOfyOuDOoHXLWSJ0zaxUf/j1HS4Z2E806mnhX3L0HRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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

Quoting Matt Roper (2024-10-04 18:20:38-03:00)
>From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
>On PTL platforms with media version 30.00, the fuse registers for
>reporting L3 bank availability to the GT just read out as ~0 and do not
>provide proper values.  Xe does not use the L3 bank mask for anything
>internally; it only passes the mask through to userspace via the GT
>topology query.
>
>Since we don't have any way to get the real L3 bank mask, we don't want
>to pass garbage to userspace.  Passing a zeroed mask or a copy of the
>primary GT's L3 bank mask would also be inaccurate and likely to cause
>confusion for userspace.  The best approach is to simply not include L3
>in the list of masks returned by the topology query in cases where we
>aren't able to provide a meaningful value.  This won't change the
>behavior for any existing platforms (where we can always obtain L3 masks
>successfully for all GTs), it will only prevent us from mis-reporting
>bad information on upcoming platform(s).
>
>There's a good chance this will become a formal workaround in the
>future, but for now we don't have a lineage number so "no_media_l3" is
>used in place of a lineage as the OOB workaround descriptor.
>
>Cc: Matt Atwood <matthew.s.atwood@intel.com>
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_topology.c | 14 ++++++++++++++
> drivers/gpu/drm/xe/xe_query.c       | 19 ++++++++++++++-----
> drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 +
> 3 files changed, 29 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_g=
t_topology.c
>index 651ba53623e5..df2042db7ee6 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -5,6 +5,7 @@
>=20
> #include "xe_gt_topology.h"
>=20
>+#include <generated/xe_wa_oob.h>
> #include <linux/bitmap.h>
> #include <linux/compiler.h>
>=20
>@@ -12,6 +13,7 @@
> #include "xe_assert.h"
> #include "xe_gt.h"
> #include "xe_mmio.h"
>+#include "xe_wa.h"
>=20
> static void
> load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>@@ -129,6 +131,18 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t=
 l3_bank_mask)
>         struct xe_device *xe =3D gt_to_xe(gt);
>         u32 fuse3 =3D xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
>=20
>+        /*
>+         * PTL platforms with media version 30.00 do not provide proper v=
alues
>+         * for the media GT's L3 bank registers.  Skip the readout since =
we
>+         * don't have any way to obtain real values.
>+         *
>+         * This may get re-described as an official workaround in the fut=
ure,
>+         * but there's no tracking number assigned yet so we use a custom
>+         * OOB workaround descriptor.
>+         */
>+        if (XE_WA(gt, no_media_l3))
>+                return;
>+
>         if (GRAPHICS_VER(xe) >=3D 20) {
>                 xe_l3_bank_mask_t per_node =3D {};
>                 u32 meml3_en =3D REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse=
3);
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 5246a4a2740e..fd2cf8efc99f 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -9,6 +9,7 @@
> #include <linux/sched/clock.h>
>=20
> #include <drm/ttm/ttm_placement.h>
>+#include <generated/xe_wa_oob.h>
> #include <uapi/drm/xe_drm.h>
>=20
> #include "regs/xe_engine_regs.h"
>@@ -23,6 +24,7 @@
> #include "xe_macros.h"
> #include "xe_mmio.h"
> #include "xe_ttm_vram_mgr.h"
>+#include "xe_wa.h"
>=20
> static const u16 xe_to_user_engine_class[] =3D {
>         [XE_ENGINE_CLASS_RENDER] =3D DRM_XE_ENGINE_CLASS_RENDER,
>@@ -513,11 +515,18 @@ static int query_gt_topology(struct xe_device *xe,
>                 if (err)
>                         return err;
>=20
>-                topo.type =3D DRM_XE_TOPO_L3_BANK;
>-                err =3D copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_ban=
k_mask,
>-                                sizeof(gt->fuse_topo.l3_bank_mask));
>-                if (err)
>-                        return err;
>+                /*
>+                 * If the kernel doesn't have a way to obtain a correct L=
3bank
>+                 * mask, then it's better to omit L3 from the query rathe=
r than
>+                 * reporting bogus or zeroed information to userspace.
>+                 */
>+                if (!XE_WA(gt, no_media_l3)) {
>+                        topo.type =3D DRM_XE_TOPO_L3_BANK;
>+                        err =3D copy_mask(&query_ptr, &topo, gt->fuse_top=
o.l3_bank_mask,
>+                                        sizeof(gt->fuse_topo.l3_bank_mask=
));
>+                        if (err)
>+                                return err;
>+                }

I believe this would cause a mismatch between the advertised and the
real size of the returned data. Could this be problematic to user-space?

Also, should we probably add a note about the possibility of
DRM_XE_TOPO_L3_BANK not being available for the media GT in certain
platforms?

As an example, DRM_XE_TOPO_EU_PER_DSS and DRM_XE_TOPO_SIMD16_EU_PER_DSS
do note the possibility of being omitted).

--
Gustavo Sousa

>=20
>                 topo.type =3D gt->fuse_topo.eu_type =3D=3D XE_GT_EU_TYPE_=
SIMD16 ?
>                         DRM_XE_TOPO_SIMD16_EU_PER_DSS :
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index 920ca5060146..0154fbe154e9 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -37,3 +37,4 @@
> 16023588340        GRAPHICS_VERSION(2001)
> 14019789679        GRAPHICS_VERSION(1255)
>                 GRAPHICS_VERSION_RANGE(1270, 2004)
>+no_media_l3        MEDIA_VERSION(3000)
>--=20
>2.46.2
>
