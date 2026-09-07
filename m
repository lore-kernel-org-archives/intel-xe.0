Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B65C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 12:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D1710E4A1;
	Mon,  7 Sep 2026 12:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIa6IBEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FBE10E4A1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788782885; x=1820318885;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3frjBkI5ZQxdSaYkcin/kf/KqygHoMx7sNsNP50Ggo=;
 b=mIa6IBEv1s5ir1kMXaEkdjMiNsmxi8dChCYNFG1lT417wYVnIm41qZ5n
 d7lFN/SXCiher3Hf/Lp0SnJ/sm95Vcf1BVuCRkAPWUo4nxtb1fgfPWZaZ
 DXgf0D53L88l8jII3m6xMgANXtEdnwqWIxuUYUDskYzVJNT/CmvzvQ5jU
 48/8ujmk4QKsVxub35lpwMAfDgNa2crBGMBZGuNRKOIbEueDzorDha7E3
 LYUgoofF0ddWmmBFFfRRUf6iezyRJUSBZyO9MraJHgIbPjq3YZNdSkHxh
 F8mBZSvFC5yhjTEdjuYR+91eevo6ipszty2Lw28G2GMsTa1LdtwlXqVMy Q==;
X-CSE-ConnectionGUID: 0WU8t4LQTdS/TUYbDrQpDA==
X-CSE-MsgGUID: k2GXLsXAQ8+md9q92Ba/PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88333431"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88333431"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:08:04 -0700
X-CSE-ConnectionGUID: WpvzanGeRcuSxhEhtYe6WA==
X-CSE-MsgGUID: BpgcmqtbSxan8l0xMbfZzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="300579345"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:08:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:08:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:08:04 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yomsd3dFHMaQ6oyH9U8XuAUoladVryh7TF2SoOFeTfMSkz6ml7w8CK+bkJ/1y6AOWancEzdfqjN3fqpd0J+XJMcVsY2+/891y7sqXVAy+XeR0Qh009/xuhUZcESH7lRYvFeiTOCl81cNXeWYb8oUjyPRlMnwkXrntiu5mMVj/v86M+gclKIjbJKK5B6KrVOo0S3ES+Ohm0du+9QpC0GkVbGirNuIuabRyW+ETnJR4lKUEH78rLTycql96dhhG+Fumd8eNCGnuGoH+ac9coNUD8El7z1KyqAlMaBzF8fF/TEstkkNelEKaAx6u2CiQwS27r8Q/l+JanzkCNiqRxEEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8Bf/l0OnnT22L+gqi4ySJZMvrs6cWyu0v8HlEpSo1A=;
 b=wQzEcMkSLKnTlduIiZUeKocfkx7vOMBgP05thyFgjmHJUm1hDgDMd/ONZ6AG9hBHK2zrCet/o7bMjSaOdHWi6LkbrYczqd2nCINXkung+F1CZIA1mi7c0K4asTGt/3idjdKg2tNd/zzjaKTnr4TwWFtGk+ES8qFd9mTdzlwI9E0nNHA+tA6s8IOQjQZwgoqAUv+Ipx95tItB/eL7jVy7MVSaFZxrP3d/qXk6jVOoHD7NX9Vgj6GUP6zEqZ90WLsqaKvtMd416hmWDvuQugAM+GGEsCClr1jSJCAGAinp0FQkMnkhqD118CfJbBhHwXaNo7R/2pF7xIsOM3GWNjfnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:08:01 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:08:01 +0000
Message-ID: <6ea0523c-0a37-4fdb-be63-ff0f2b8d0774@intel.com>
Date: Mon, 7 Sep 2026 17:37:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
 <20260907105313.2208003-17-mallesh.koujalagi@intel.com>
 <3be73c89-0ad9-4299-8c6e-ed55120f6b64@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <3be73c89-0ad9-4299-8c6e-ed55120f6b64@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0270.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f38e579-91fa-4850-de19-08df0cd8a98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T1Y9kYNviB+schqKwAGViTp4Ve1TTJl8NdirKrlUCTMqKZd/n0fU8r+WlJxYmIWbmiY4BKGe64vD75YiqWHoY4dYZp+mFBckQL9ZDmLSq6n3z5RL5klZ18Nj7Sde7PO43/hxEqlK66vWQlXSHf78NkPIlzA7b3gy+0r4dMF4ttn5IAqxr7lWTCpdtJBnssItnSp+j+8GO3auULWIWsc3G8faYfDKIAZi9t5a7YUM4n5llouKd/EAK8H/RcSBc/2pxAS/0468hdZhNZ+U/c1GbrmG00Mb2roXAvL7OXgbAwSfS1Dv19EOUyQNCoAsyPYIIjsX32ig951w2XjSHHaTQfYpJg+87OpiHg3km9tkw5gZBAFd6aQbdy76NnuVEYX9yopRxYfjZG6euRoGwFPGTbIlSFJk+KhSnuxQz1BTa4lJFrnkoL/ty7eCzeAfuDUVxBtAKvk1ZyL/dDmlTCtrrdu/76Ib1FvyJEIgqIxbUSPujauoHFXAXG4wglWO16b3asPddSo5fxlndzh4oJg7l2JutbOFSBvTM6Ul4Tr97bUfmegl5OApQuP7uaNiaWwclMWz3MHRrg3z7wWN/dSQffdRK6GqWz/QnM8MKWaHVBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVdFa2JOcjZuUWJLRzVXVnRmVWVGbVBVZUE3c0Z6a21WbGdWaG9YRXdqcTJp?=
 =?utf-8?B?aGFJZlhacHJIeEs3RGcwR1UrMVlhYXdxOFdVNEo3bStOY3gxNzkvSGd4UHVQ?=
 =?utf-8?B?NEh3NHE2NW9CUHhjNkFPVEhuWHg1UDQ3am83Y0xFcjgyWFlDellOazR1N1pI?=
 =?utf-8?B?RnRna0x0YldmMi83S045eGpYdEpTWWtiWWhPK0pnejVFeDNHTkJrTU9Uc0dp?=
 =?utf-8?B?WFFRSnA3NnV5ZXFRbGRYeHdJVFBnaWdzMnFYTEJ1YjFYbU5NZlVJem5memE0?=
 =?utf-8?B?VWJSR045YXhCQVlwbDNXU0ZvbEhBTWZqSUdMTW44RWdHREpRTnphU2N4OHhX?=
 =?utf-8?B?ZGRaMnJVTXgrTW5yK3h5ZUxiemlmM3lBa0ZOYkJTZThXVEN1SmlCellCZ2hE?=
 =?utf-8?B?UzM3dWl5RWJwYitSSFhncEZHZ2ZxaEJ2R0pTVit2OWZIOWhYUnp1a2Q1OCsx?=
 =?utf-8?B?MTRsWitVMWdxazZPRCtlNE5TMFVnVHhRMGxSQzU3bXBzSkxNNm1EaVozK0sw?=
 =?utf-8?B?aWM2NG1abTNVelhMOWEwVDVpTDFPUHBXVmo0OExXU2ozSzVwQkhOWHo2OStl?=
 =?utf-8?B?ak5MZWNMU0N0cDBLYnBZUVVDT1BGalk1SXBEd05XbEdGRDF1QlMzcUtpWjRQ?=
 =?utf-8?B?RThEWEVKRFRIbFlreUV2bkUrRXpRd1kzak1pNTNBdHZtTVNPdVorRm9UbWI5?=
 =?utf-8?B?WjZDMHE3T3A0T1RpUkdMM0laQjg1c1RidHJYVFhJYXFiNUNTWFJaV1FzRmdm?=
 =?utf-8?B?THg1d2JWRUE3RE5yMUdaNjdmZ3RXWTRkZ0tRUFEyYUFwZEc4Yk13cERDZnBo?=
 =?utf-8?B?anpId2tWNG9Gd1h2WitsOVYyOS9BYjRNMjB4djRnRUozc2QrN0FYQkplM2Jj?=
 =?utf-8?B?WW9LM1pRbkgrSFk1YXBBdzNsS2lObUlpbG9pdXZtMkxpQWdIN2JCVnVnZnoy?=
 =?utf-8?B?V3prTUsvMkQ4OGNGYytTc1BkQUwwZks3eDdYVXBuOVF3MEIxVHVxSlRFaUZC?=
 =?utf-8?B?N2QzaUEwSTVDQWkvVXdKSzJqcEF3ME5vVGRaZDNTMDZEZExKVWc2Mm9oU0pC?=
 =?utf-8?B?RGlMKzlOSVlldEhrT0ZibmJQZVlaK3dXcEsrOENFVC9YNWtxcytDdW9rUGVG?=
 =?utf-8?B?V293V2hBRjFxblJ3b2pWWW9SSlJjenUwdzJUTzlIdHFEWk9icTZvb0FrTEJQ?=
 =?utf-8?B?Q0o3WHVkK1JMSHJwZTVvUVU5eGdzeXU1TGZaQVlDN2JlMDNFekpUQmxjOWl0?=
 =?utf-8?B?YnBJWGZVZUdEcjJDVjRTTENmUTl0S0FoeFU3dDZPZGFUZ29oUHJCMDJYVWJB?=
 =?utf-8?B?RXpkSWJRdG5FRHJrRmNmQVliemhpV2QxQU5lZWhmNm9oSDNWMUZYMnB1NWZK?=
 =?utf-8?B?QTY1Zy9BQUc4UHBCbW1NdjFRdEdKR2RFMFlxNEhtdUd2a05WNVNucGEyeVJm?=
 =?utf-8?B?VU5nSUthdnRQYnBPZkJIak12cnBQSTg2QXp4UDZPTjU1ZjBMakJjZVh5eWov?=
 =?utf-8?B?S0xFeCt3TUpvd3R5OTY5cmgvVU92SG1xV2FYUjRlMVBGTE85WHFCWHVQblRx?=
 =?utf-8?B?YnE2ZitWK1Vqb1ROY01NMGw5Mk03NCszSXBvMldjQ3ltQ1llaU93UUpiYTZZ?=
 =?utf-8?B?bm1zUTNINVlxUHh3RmJzQ253NGlkaENjZm9kYVExeCtSa0ZTQU5kdXR4ZUxN?=
 =?utf-8?B?Z0cwVi95eVdkdU9YaE54T2RiMytyU0t1RnNhN1pYU3BwY0dXRkhRZUtiNjVn?=
 =?utf-8?B?MjVBQnR0eUJEbFBoYk4xbEMzZTZEai9iSnVxSEYyWStsNEIzQ1ZoMEkxaHFi?=
 =?utf-8?B?RGZQeE0zM2UvRy9UWDNETS9ySEl5dCtadENPRmVkVzhER01Ubk9iNjdieEIz?=
 =?utf-8?B?cEFLckxXWTFySkx2K2FFakNWQ3poZWw0d3poME9kN0x5YS90WVF6VE9rMWl0?=
 =?utf-8?B?dC94UXEzUVZXd2t5cmJhVHlENWVZRUphaG5BQXNmQWpPallxa25teG1xUUd5?=
 =?utf-8?B?bzRyTUowYjFmbE9vcXVvbUtiS0phWUpHNFp3VXJ0R1htdjNLSDRpUXI1WGtZ?=
 =?utf-8?B?Ym1QTllSWDJybXFUV2szRjdLODMzZEl3bHByZS9QaGs3OW10UHR2ekNwakJl?=
 =?utf-8?B?OUlWd2hmVmZZeHZ4bjVqY1VxajNVZWE2VHVTUTY4WEp3cVFnK3drWUpNMUZ3?=
 =?utf-8?B?TzVMM2tKSytiYXlCZit1aldXaHNVd3V3eWlPblZBcFJnb0cvbXdDN1ZpUHp1?=
 =?utf-8?B?M1BCanQyaVVZUTZlWXRxR05pa1lEUXp0VTBhOVhaM2hSR0dPcU5KRmphSU9S?=
 =?utf-8?B?NFZBNmZHb3BBcWRNNXVTRHpYY3oxbyswNVJqbEpWM2NJMkp4SjVpb2Y3MjJG?=
 =?utf-8?Q?8ofVgWgeDiMXGzhc=3D?=
X-Exchange-RoutingPolicyChecked: HwJNxoaV7cjTxEeHLVq3G1TGyzFaMcXUVaABJX+DcX0SlfJ/xNo5rcAVo7TKTU6ii2eifOZm4+Lt9rJKoASQ6Xl3oXMfrfx4+uOEMHfIRm85YPgGOe9dOEiLV8d80GhyeGzdJmggTCOUjTMtlDA1w3vw+9XVD5Z0PzTo0cHUtRnbUVsTTOwMNQQWoRV93nRXIarrSwVFedVVZamlX5u6MO4ARahzDnXrJvm4j6ykZxid6jdTZf6FbVNE/8qA3ZC6fN4IXMNmHRpNqiub0Swx+bRLPmm4FV6LEoJy0p6BTVRT5TXAs8L6JEr10glSI/2lBRXqtS0dhyUE6BRr11vdeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f38e579-91fa-4850-de19-08df0cd8a98e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:08:01.1562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZyJxkDyjsTU4CeXy2nm1qQHtFyXXBfRO/5jIGLLWf3c1h7qqK2UzHCjCERabYLa+1126/UIBNBKGdmmpy2uLyYeMkcul3p4agL6H9u0/RE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
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


On 07-09-2026 05:17 pm, Michal Wajdeczko wrote:
>
> On 9/7/2026 12:53 PM, Mallesh Koujalagi wrote:
>> Use REG_FIELD_GET() when extracting fields from SysCtrl and
> nit:
>
> Use REG_FIELD_GET()and REG_FIELD_PREP() when working with fields
Sure!
>
>> application headers. This better reflects that the masks
>> represent register-style bitfields and improves consistency.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v7:
>> - Update FIELD_PREP to REG_FIELD_PREP. (Sashiko)
>> - Update FIELD_GET to REG_FIELD_GET.
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 20 ++++++++++----------
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  6 +++---
>>   2 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 50bbdab072de..cdd929ebed4a 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>   } __packed;
>>   
>>   #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>   
>>   #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>   
>>   #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>   
>>   #define XE_SYSCTRL_HDR_RESULT(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>   
>>   static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>   				  unsigned int timeout_ms)
>> @@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>>   		return -ENOMEM;
>>   
>>   	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>> -	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>> -				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>> +	hdr->data = cpu_to_le32(REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>> +				REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>>   
>>   	if (data_in && data_in_len)
>>   		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
>> @@ -186,8 +186,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>>   	}
>>   
>>   	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>> -	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>> -	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>> +	total_frames = REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
>> +	curr_frame = REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>>   
>>   	sysctrl_read_frame(sc, out, frame_size);
>>   	sysctrl_clear_response(sc);
>> @@ -295,8 +295,8 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
>>   {
>>   	struct xe_sysctrl_app_msg_hdr header = {0};
>>   
>> -	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>> -		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>> +	header.data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
>> +		      REG_FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> hmm, shouldn't we use le32 conversion here?
> other sysctrl cmd/hdr parsing/prep seems to use it

le32 conversion is not required.

le32 already removed in the code, find the change: 
https://patchwork.freedesktop.org/patch/717045/?series=164526&rev=1

>
>>   
>>   	command->header = header;
>>   	command->data_in = request;
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> index f0d5e3d7f5e3..5a3dd14e3a11 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>>   struct xe_sysctrl_mailbox_command;
>>   
>>   #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>> -	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>> +	REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>>   
>>   #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>> -	FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>> +	REG_FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>>   
>>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>> -	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>> +	REG_FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
> ditto
ditto
>>   
>>   void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
>>   			       void *request, size_t request_len, void *response,
