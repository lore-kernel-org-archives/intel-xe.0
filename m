Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A938CA0FF6
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 21:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33BE10EAE4;
	Thu, 28 Aug 2025 21:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmKwuSOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4870510EAE4
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756417781; x=1787953781;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xAd3iLgOluoeGJHt1F87SsBHgKS4lzjjFmB8aLPa+2Y=;
 b=KmKwuSOWxM4r+HolXYaYn/DUTRjrCUVX7XHm/6AukLOFTTB/imlqIiYA
 LovIkxq74pjcaWLYS68T/7HzM3G94T4Nc7g10b9s/XoWJOmsqvv8j1lwU
 jeTAUSvhjgUK71N2VwxX2oT5XdxfRrHthk4sEeywYk0Ss6DP4cv77tpRD
 tBQtA3ceM7PiZIm/VCVNGqNdhB9Zc6WbxBsHH8nlKtzmzst9DU6yP5qU+
 8dsKxUF6a9q4hAu5HRNmW31bgQww63mmfGuyzpWBlI330JPngxa3+v+fv
 syv2w0IrbKqJv56LNJq+9Nl9HeqhdtUKMojMfycc7EeARyUuuEMDAQVD6 A==;
X-CSE-ConnectionGUID: 0oKtmCDJTsSLtL9voukRQg==
X-CSE-MsgGUID: K10fDdVnS4GIGsvWf1Yp8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58632682"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58632682"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:49:40 -0700
X-CSE-ConnectionGUID: 71Cjfva9QUul86Z/eu8mpg==
X-CSE-MsgGUID: oHHEqawiQzm/BMeL/JNjlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170614629"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:49:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:49:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 14:49:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.60)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:49:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPrB3ZDvLes56V5xl6V0g2j0O/+q88oVitjFVMlELb/o2PUNbITkGUcUeJlugDHPh5oKhSgGpGLob/PxkS7JVDr5y/TtNx7Fj7d/Tg+2fFVy1bYIUsnqd4+/ob55NbVrH6G2TTQAsU3hjO11chf9qyoUY7poPU1OFDJIkVNMeIwmUohgGNuqrvOgTAVS6q/u2UNx7Ai3yHSGfhKu3fKLW7Njvl7rr2/8MrIk/lh6RqVjAj0yOrXL5waQQgBnPGpBL044w2wCqffdoa74hdItsXyEEQmh/WlV0Cx10/3YGLvKZHJiBL+ZXKucflPk07Wt/7KcID5upbk6ug5c3eb0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1U/regNCsbkPIYT4tfc1we/XEgaeeBneJKy0cRNCpE=;
 b=b3mBXge/EB3FQcYqdXpjcvozE5+8UbyoBwPIYYkDiUIhfCxK71HMrywLztkrAMHNabTqeVs2s4RZA7ddwmvLLuTRXovN2tF+ghS1dDJb40++VGTelGyX4rI4P/+gbPSZNr1WZLgStEDhFHhELIcpxOjOlWm9yQuvDWnoNSb1Xb6RjoGUggIXpRtXdkMHKZopA+SGaNcR/xmihK0c7a2Ic19XTZNBRmdC1ttJcEzN+vPtxhBrt1ZiXsW2r6HOXKl6kRAXc8MRlHDbDi00p+mDSokEkAvpQKcsh5+zJ5Evvih+iWemlov56a4PkqNvRFhHH3ncKKHKTHvBv4PxhJvTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB8861.namprd11.prod.outlook.com (2603:10b6:208:59a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 21:49:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 21:49:29 +0000
Message-ID: <0b71e049-bdc7-4ece-a978-26e4f538efc6@intel.com>
Date: Thu, 28 Aug 2025 23:49:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
To: "Summers, Stuart" <stuart.summers@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
 <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: 786a0af6-c0b5-4018-dbc3-08dde67cc402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjNtNDlxRUxkL1ltUi9WaEt1TDRiN3BRRU1WbEtSU1owYTYwbVhoR3N2WlI3?=
 =?utf-8?B?SlhuMUoxaFJQcDhwUXF6OVl2bWNrcUhLSklXZnRlb0VqSXhIWllkeXZuejVH?=
 =?utf-8?B?OEhvaUk5YXlaVlFtcVFHMStKY2Q2RlgwNXVyNmgwK012azNINkhXTXlHb1ZP?=
 =?utf-8?B?RDRIT09pY2ZhTDZIVmxJTnpnNmRPZ1VPMXV2VWFOTXd2TWtoNk5zY3MxUXda?=
 =?utf-8?B?YmRMdzF1UlpJMjFIcG5KTjREeUpkQVZBWWpnc2tDQVdseW9qaFJPaytvNC9N?=
 =?utf-8?B?MHE4L1hqeWQ0UDNHRzlWSjg4eEdyOHRlY3UvYlVzZTA0NmlDYjRoMWFTdjR6?=
 =?utf-8?B?c1QwTnBpaFhXbkYyVkJWK1BYQUxmK2pRM2FUd3o0akE5ck04Q2JidTBpMzRL?=
 =?utf-8?B?QUgyMU5DQWFoWnNGZXJyakNxTWpxc0ZzKzNGQlRXRzBwQ0Y1eEJiOG8rVGNv?=
 =?utf-8?B?bGQ3enlEcllDVm1tTlhKakl0ZzZlV3pDRlFxY2pjY2xnYnVhNXg2c2ZidHJ6?=
 =?utf-8?B?ZUJYUWdCc1puQkpRTFRJWXJJTlRLaFRJNjV2WjVEYk5tMUk3K2poRC83T1Zt?=
 =?utf-8?B?a0NQdUluQ3MxeDF1WHdxTmtjMk9HeU8veFJyTVI2ZVJURnB2THkwSjdXY3BQ?=
 =?utf-8?B?RG0reGk0cElaVHNyT1dCWnVTZ3FkcENNcFdwd0hzUjhxemFlNmpJSU8rR0JK?=
 =?utf-8?B?ckJuNG1LSnlCMG9CVnRvdi9wbFJoUTJJK2o4K3h0Um02OUs2LzV3NUsxU0li?=
 =?utf-8?B?UWE4bkZhTHI4WFV4K3FXL1pFczJMSHNQQVZmOFNuNERQRG04UUF0ME9OQWln?=
 =?utf-8?B?REN3SlNIb0o1QUNMRTc5Wms3aFRNR3hxV3R0L0dvOXR0QlI0cHdJdVFSbWJ6?=
 =?utf-8?B?eVd4N0xIb3FqUkhKem9ESTZUeC81cHd6SUY5bk0xeERkcWVmbjNlUFVVbWZ0?=
 =?utf-8?B?cmZFZmx4MHJrUTJmZU9LNjdkR2V1YWx4bnZadDRIRmtyNmxpMDBxVmdROTdZ?=
 =?utf-8?B?VWFKTGg2NE1kVUhqYjMrT2FmbkN1UUNTNXRzbmhXOXpsWThxbjBaMzBSQW8w?=
 =?utf-8?B?VW1mRjhqQ2o5U0UwS0JzSy95a2ZHbm1qVVdVYm1DTFN0SXdWZmJGTkZseHd0?=
 =?utf-8?B?Ulo5azN5d3hxd2gwSjJmTlpGRFhFMjlVcDZDaGpwT0JSZ2FsOVArZ2E2T1RR?=
 =?utf-8?B?K0E3VDRGd1hPOTNDditBaU0wT3dIcDh0ZVhkYWZlYm5meU1KOWpEd1p0TlRp?=
 =?utf-8?B?RTErTnhyYTdVaFp4OTFEY3NXRjJ3N3JEd2IwZEZNc1plUWs0dzFJbUtDakJ2?=
 =?utf-8?B?NnFDRmMzblNleGFjdWlKUnVvaEFHc3p1ZEUveCtzVzZkOWh4emxjb1hrL2tJ?=
 =?utf-8?B?Y3lmcUNkZHJDcHQwZHplYStuUVVHY0RycTZpQmdjMUpCR2l3UlprQk5yaTFz?=
 =?utf-8?B?WkxuZ2xvQjNncG9qSUxLTnBsUTc2QlpRdlJ6bEtrVWpRWHdvRkIyOHFPWjhM?=
 =?utf-8?B?MHllUlN6UDUrdWpkMFZ5RTBUN0d3M1hqS3lOb2FFVDF4LzFBc0g1RjZybkdF?=
 =?utf-8?B?b3RwQ2V1ZitTM1NsTkZBdjA5Mkt5d012MmJzeVk0OG9jbGcwT3NQR3hwdnFG?=
 =?utf-8?B?K1NpeHE2Z0lQaFpXWkk2eVArS05tZnkybFQ1VTM2d1QxNVBPb05maUhVNVM3?=
 =?utf-8?B?VENHUmNYSkNkYTB5UlVxVEpSNlRseU9qRnFqV2VWNnVZYm4zeEI5alk2andN?=
 =?utf-8?B?US96dU9sd0hjRkwrRHVLWjFwWExGdlJRTW9xdWxzbGhVbng3UzlSK1J2MlNv?=
 =?utf-8?B?MGM3WHhVYWQ1d2ovelZQUzZUL0pIU0hNVHZCK2FaSnd6OWwxT242L011ZSth?=
 =?utf-8?B?WVd5ckZNcXBRdGFUa0RyTDBaVzBOR0pBWisxeFh6S01Wb2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cks4MTdFLzRwcm9ZN3ViZWtaRzVRMkFwY2tYTlhNL1hzNHJUUkhoOWl0aXpi?=
 =?utf-8?B?MjNQV0UwbnBIZHBnblpuZ1hqRG1VODBSYWVwdHdOaEVFYUlWVHZlNWFHVnZx?=
 =?utf-8?B?SzNpQVE0SkxKSUoxdGpzWUNzM2lNVHlTS0dHRWkwcERBeDdmdEYwTW5UVEFF?=
 =?utf-8?B?NFJvS0xzTEJja3BUVlk1dHJqTmFwNGJ2NEJ4dnBXcklydDFNYlpZbDhxVTJS?=
 =?utf-8?B?UC9SMjhxbjhsbWUxaXl0eXRha2d2NHFlVG9oeXhMNUMzekpNTDErclFYVlQx?=
 =?utf-8?B?Nis4SVJkdXZzNGVrZkdTcUlDRGpjd0tyTXFSRmNNZjA0NGp0QUdhem02NzhU?=
 =?utf-8?B?cFg4eFo4U0EyWmdTLzFETThXeU1kODJMRmw4dmpRTVNLNXlXa2JFcW9BVFJT?=
 =?utf-8?B?YzNneEpBdnZaSVVacjkwNEFYM0VRSGJXbysxRnUxTFNKY1BHang4UXE1RzdU?=
 =?utf-8?B?MVo3TWx5N3FLRDMrVjV0SGZpRjNmWW5SUGdpREFBSTRoaTFHTWg4d2pqNFEx?=
 =?utf-8?B?OHpJNlVaR09SRzhtem1VbjVpTUFoV29rSVZwU3dNUk4zYkYwb1FUcHA1OS9v?=
 =?utf-8?B?c1FxUHlSZ1VqUUdCZEdIZUVieHlldDQ0Nlg3U2NCbFR3Z1lVd0wzZ3VoTmdB?=
 =?utf-8?B?WEdnNzFkYWUrd29reVEyalQwVnFDV09VV3VuSjBVdlFVVUpjOGwyTXZyYnhT?=
 =?utf-8?B?VW5OSFcyL2djUmdLS0ZzbnFyVmFlM2IwTkROdU5xRXg5UnhBZjhuOGFNVXow?=
 =?utf-8?B?cXZ5b2hLZlkvaGoyb01aeDFmSVR2MTdHVkovUitVTnREdTZlNjhXajFwRWFy?=
 =?utf-8?B?TUNlUXlVOXlBUGJNUUJ3bGNsNGhKVkduNVlpQ1hUd2ZvSmxBZ2lYUnQvdHN0?=
 =?utf-8?B?MXdPbGpsODl4L3lxNkZrOGhIUmFiODUyM2dQZE5VNmY5Zm9pUVdKdk45dUoz?=
 =?utf-8?B?NzdSK3RWVVBNa0dTaXlCU2FwZWtZSzExUHhFSE9EME0wUm1BQkRKWjFNMk93?=
 =?utf-8?B?dFY2b0s1STB6b2x4N0FnSVFyajU3NmFQdXd2L09VaWhzMFVWWDRMYXl2UC80?=
 =?utf-8?B?cC8yZUh2RVpSeTBHTXVSaUxQbHZpRWk1UVgxWDhlSytJditzZThpbjBSTFdG?=
 =?utf-8?B?Mi9EcERVbm01a3JyZXJ6WHE2ajRVbEQ4SmdpQmRzUUxYcVBZNHVDM0ZjZ1pu?=
 =?utf-8?B?K1hGemZ6RDllZEdPcytFMEdHbFN0R1NvOFZpY3VLQXJRWURZM28xOENuNEtC?=
 =?utf-8?B?OUVuZnNZeTJIQ2UyeHpuTmN6K2l5UUZGdDk2bXEzeDNZeVVBNmk1SXNTdlZH?=
 =?utf-8?B?V3NockZYN1N1eVRHMGorZnM4YWpEbmlnbEp6bFBEZzd1SHdBNUJ1Y2xrMmU4?=
 =?utf-8?B?N3p3ZDVNNjBoS01KcmtvSzg4dXhPc3lVL1k2UHViRjh5TVgxUk1ES1Z3dHZa?=
 =?utf-8?B?TFlVN2FudzRlK0txUzZPWGU3U3JyU3htKzZTY3BTY3AvNkI2VFlGWHEvTDd2?=
 =?utf-8?B?czVjK01jMG5UdS9sNWt5cjJUNXhDMkFmOHpBWFJablpyTERFQWNtQUdaYUFM?=
 =?utf-8?B?ai9pMDBNdVV3ZTRKbzRNY3lmZEJ2UklETHpWTXBoRTVJUjQ2a3ozVk1ldkZX?=
 =?utf-8?B?QWFTQ0pqZUdzY2FEVjhLbUJxbFYrS3RKTDZFTEFRZE5HQlcwSlFqNHB3ZzFZ?=
 =?utf-8?B?NUkyOVIxTFJDTlhEZVlKT1lWZTlnN0dhSGNqU05kV0ViSjhnRG9Gem5WTXFw?=
 =?utf-8?B?MzJsK04xMVBnRUNBTkpQdjBkaHhGdUR4ZS8wNlJoOHJLSkdzRlVySVhpWlFD?=
 =?utf-8?B?azRPTFBMYm0zTnVoZkJPQWxHVE9QWWpRWWVWWFZ2NmM4aTI0cGdQWFk3TmdO?=
 =?utf-8?B?dUVXRFZFUzRDT0FNVk1sNm1tQkJrR3g0clFCOFJpSldiUHdFZHJISlpIUE9p?=
 =?utf-8?B?TjYvZzV0eWVEN21tWGw5Q1MxakRwdzlSV2laU0gvU3cvOGpDQlZsb1pGQVF6?=
 =?utf-8?B?SVowVmVYNzFQTzdjUGp4Y3VGUzM0dG5NOEV6c2pERlErek0rMFFUVEI1WjIx?=
 =?utf-8?B?REl3SitORnN6MXpWUjc5aXdxNlpUSGRyTllvZkk0NEI5RWkxRGRVTnp5L01i?=
 =?utf-8?B?cDBRMzRvVnkwQXdlVDV0WHVsR2NxYXdXeUE0eDZFQ0NJOFZYVkhBTUdKUUpS?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 786a0af6-c0b5-4018-dbc3-08dde67cc402
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 21:49:29.7916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlaPvTzM6xZDoxnhIfJFFtsf5bPnYJTw10lSsL+VOEM0JAN2U32KC+dJaix3Bo9EKponNY3SJnuHYMhd3CEHJnS4KhDF/7fsk9+0CAH06N4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8861
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



On 8/28/2025 8:59 PM, Summers, Stuart wrote:
> On Wed, 2025-08-27 at 17:52 -0400, Zhanjun Dong wrote:
>> Update GuC log buffer type value, make buffer types equal to
>> guc_log_buffer_type in intel_guc_fwif.h.
> 
> This is just to maintain consistency with i915? Can you add in the
> commit message that intel_guc_fwif.h is in the i915 driver?

hmm, but looks like a FW definition (it's part of the ABI headers)
so IMO better reasoning should be:

"to align with the GuC ABI specification"

> 
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>  drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>>  drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..b1819679fa35 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -10,8 +10,8 @@
>>  
>>  /* GuC logging buffer types */
>>  enum guc_log_buffer_type {
>> -       GUC_LOG_BUFFER_CRASH_DUMP,
>>         GUC_LOG_BUFFER_DEBUG,
>> +       GUC_LOG_BUFFER_CRASH_DUMP,
>>         GUC_LOG_BUFFER_CAPTURE,
> 
> Can you move GUC_LOG_BUFFER_TYPE_MAX in here as the last enum also to
> align with i915?

GuC spec does not specify MAX

it's our implementation helper (so shouldn't be part of ABI)

> 
>>  };
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>> b/drivers/gpu/drm/xe/xe_guc_log.c
>> index c01ccb35dc75..470c83ead543 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct
>> xe_guc_log *log, enum guc_log_buffer_typ
>>         enum guc_log_buffer_type i;
>>         u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>  
>> -       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i <
>> GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> 
> I see that i915 is going from i = GUC_LOG_BUFFER_DEBUG and not from 0.
> Should we do that here too?

actually if "i" was defined as "enum" then we shouldn't use 0
nor TYPE_MAX (since it is also not part of the enum)

maybe the implementation should look like:

	offset = SZ_4K; // don't use PAGE_SIZE!

	switch (type) {
	case GUC_LOG_BUFFER_CAPTURE:
		offset += xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_CRASH_DUMP);
		fallthrough;
	case GUC_LOG_BUFFER_CRASH_DUMP:
		offset += xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_DEBUG);
		fallthrough;
	case GUC_LOG_BUFFER_DEBUG:
		break;
	}

> 
> Thanks,
> Stuart
> 
>>                 if (i == type)
>>                         break;
>>                 offset += xe_guc_get_log_buffer_size(log, i);
> 

