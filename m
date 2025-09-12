Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B632CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 10:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D15210EBF5;
	Fri, 12 Sep 2025 10:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntJ9OY63";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A30310EBF5
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 10:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757672313; x=1789208313;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NZV5Y8YhUWzHmYgLj1Uj3xSLwzw+01uMy9cK/Q52ryk=;
 b=ntJ9OY631im1z3MK0PXGMOh+4fW1Vxhv3y/M0gq1p60+PFIqgpBAaezF
 BK5Z+gApeC7cBErqk9RPHSKo1fPmMw8z7cLjiUH7XEH+hOEC5unuo/4nt
 JGnF07M5BTlSWO0A8ZhMEA8SyORvoI17nd0nwFHsJQhaPgLQrHMiSgbmR
 qKV2yDmuLZrk5S57u18zVnBvod3pttJrVRL3Mtywz//1rX/kRUUrUFuKR
 ho/pHCn5H4H0DeO/Ii4SFcM3ys1UtuZs0LtjCGhZvgiZcq5vgBDbUqLa0
 x5ce9zHydy5a52/Uky0AReFd5VFaE6Vb5m5yiTfiavd88bPwKtfSI0hWP Q==;
X-CSE-ConnectionGUID: tuc8vafVQTq91P/43uwKzg==
X-CSE-MsgGUID: UIebOVDcSTa/HOCxn5WaPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="62646088"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="62646088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:18:33 -0700
X-CSE-ConnectionGUID: t8olmKPBQW6vjMRWTwm04Q==
X-CSE-MsgGUID: 5KlbcbjYRWWIqbz7I281dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="177968303"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:18:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 03:18:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 03:18:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.88)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 03:18:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJzxpLXPdwXrtqWyBCo0IfBrWj4ZcHyIS1gC4rFzrHZCKbVSzSBurljQ5m1S3DLCaaYV4+n3To4CT0THHFGUnO1CZpXVtsGXmj9ZfpENY1+NUDvTwVQBr5/ex7+f5pmO8951awE1DT8VOhflvYTA6R6a1lrPH0Zh/jB9ry0CPEe90Qd5ffrVBq4wrvtV/+TgcotgScVcbsmGp7HTelc3CJVVRNVkH32zmyRb45pMCxmfg7LOchtkBp91KSkg9BBDXWnLI1fUmNsjL2WnT0CU2yIY1JipgmHgDpq2wmhb6McPjAXSAWCL9xDx0X1EbkwsN/KpfvXtIxUNbAQK3kjKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVsuP/McQdbrR1AvhhwXm/OFtOk193mpCe330z3r+zQ=;
 b=UCD433yi5Awgp0xClhtX8FHN4/IR9Yj4YIM16qXJmaXYMWRlJYmecZmuHqKk+5MNtpOd/cnum90dFZ3Uid1YMH4mY2U+HJBcPw5/j2bJjyQjLY8qpv5gkebS1DHpUoTM1myeMcZMdtju886j7IMlZmH9/mQTm1V7F+6awijipiJ6g/Ij05DFRb39xmLCen4Hk7jTZvBaXKJDQFLKAPrzqa4Ywr54xLE7hVlSUcBVPmln2sbFQTAjr3/3g6LxlK5gNmBsbLuBoGbtsEnPElBd4AwH+qBI9f0rSAB6SlNbZ8Dwp5kjgbO1rR0lkAdz+dX9riwcKpFq9SWVMKqz3RTZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:18:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 10:18:29 +0000
Message-ID: <441b7d2d-7b45-425b-b1e2-df41c9016acd@intel.com>
Date: Fri, 12 Sep 2025 12:18:24 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBSRkM6IEFkZCBk?=
 =?UTF-8?Q?edicated_printk_macros_for_tile_and_device_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250909165941.31730-1-michal.wajdeczko@intel.com>
 <175767112475.328926.9683820517827903192@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175767112475.328926.9683820517827903192@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0243.eurprd07.prod.outlook.com
 (2603:10a6:802:58::46) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB5010:EE_
X-MS-Office365-Filtering-Correlation-Id: cf59601d-c3fa-47d5-9ce5-08ddf1e5b7e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzNFNWI1RFVCL1MwbzEzN1lZYVZLd1dNWERvbHpXVlRZaERaNmtUK1V1Sm9G?=
 =?utf-8?B?aytUaWsyL1ZURWRPVzRyNUFDTzkwaURDQktPSFlZNGZLSFhMU3RVWjBHRzZk?=
 =?utf-8?B?eWRhRHRvYjZNTks3RkZOcVhGSi9nVi91dWc5MDhaOE1WbW1TL1hYWWxxQXh2?=
 =?utf-8?B?UTBJQzlURE1KVEtOcCtzaVZFN0xRdnRWM0sxN05CbC9YbHZ3Y1ZVQ3JOd0dn?=
 =?utf-8?B?Y3BWckJPZWdzK1dhbHRzTlpSTG9CRDlZMTdsVjlKclVEN2YvclBDVkEyRFd4?=
 =?utf-8?B?VFc3Y0R0U0N0N0dqLzJpcVhOQWk0VERZcGhWZVdGckVqWG9uN1gxYVNoVUpt?=
 =?utf-8?B?b0wyT21HcUJoSmhJUEEzU09BMHczcFoxQUNNazFGZXR1cUdwRzRvRXlzcENU?=
 =?utf-8?B?ZysyNmxMMWZwZG9hNkxFem8xYU1ubWJoOEpSUDhNR1FUWjlyZUFhV2t4Z3Bk?=
 =?utf-8?B?Nzk4RldDOERndlp3emhoRFVCZkNGQ0RKMkRFSk9zeEpabFFjMk54ZlJKSTNF?=
 =?utf-8?B?WGJaSDlWaWlGSUZGcll1NDVzb0tSbytHWHVHenM5eGlJTUlhd2VOMlFtSit6?=
 =?utf-8?B?eTV0WGd5U1EzUUJEOEFqd1IvdnBEZThZYmczV0VjeUNxNUdtKzd0SG9FVzAx?=
 =?utf-8?B?a2lsLzFTNXExY2thcU92ZjV1eEpFUHlza2swSlhCMFNDWVBTc3ZSK0kzSWxV?=
 =?utf-8?B?SE0zM3RzR3N5VGNTUkZaSjl4M1hMZy9pTVFKODM0UjdZWlFvakMvMUl5UDZK?=
 =?utf-8?B?RkdHMjlVa3N5VElWR1h2ZWliZ2VXMUwzYlR0SEVRZ1pxMDRoTXcxQWhkT2Vs?=
 =?utf-8?B?Vmd3ZWh0MmxsaWEzNWxydURrUitpcXlKZlJnTXArbzk2azdGUFpFeGhaTjJp?=
 =?utf-8?B?djZoQU5hclJEKzBGYXYrY0NiTVplWnp3dERvYTI3cnZEdzRHYzJ5T0NhOFJz?=
 =?utf-8?B?S0lxYzlibFo5bVNDbXZ2L3IyUW5XM2hSQUc3WlJGeTNGRkZ0RjBYZTVZUDU1?=
 =?utf-8?B?UStKYmZwUUMyTkx5UEpBNGlBSlc3aDBFcFRib0dBSE5HSGpnN3ZDOWRFVy9l?=
 =?utf-8?B?Y2FHaE9nVDRXbmM0MG1xRFozM1ZxQ3daZGNRRTM1dFRURHluTWdTc1RLV2N5?=
 =?utf-8?B?bXY0eENwOFdZeWhXdWZ1MkpLVmpmU1ExdFhSaXZPZSs2MzJ3R1F6UXRXRzJU?=
 =?utf-8?B?VUV0T3R1Q3JMaER1dUM2QlFpZCtRTDJVay92aDJXSDUxOTNDenFjRnozOEoy?=
 =?utf-8?B?R1MraFFJSTVyYzhxT0syTCtJbHlvbUJXZWwvNkh1WjFaU3U5K0VnOFdGcTZS?=
 =?utf-8?B?SlA3WTlENTFuOFNGV1NmdWp6MTFYMzFuYURuUnVJY2FCZUx0K2IxSzByeXRW?=
 =?utf-8?B?b2lOdmxOZXU3RlF5NGlPQU9QS25qN3NtMTcyVUpFelcvM3VpRWJQK0FCMUlG?=
 =?utf-8?B?blZDQTRvRUt6Y3RtUzEyQ2xGTGlRWDVPSnBocUsycE9WT0dDbjhRNlhLcHp0?=
 =?utf-8?B?QloveTlpOFZwTGQydmRHWGJ5OFdERnlhOG5WelE1NnZLZndmVVppV0dUSjMv?=
 =?utf-8?B?S0h6Rko5QVJRWFlGMWNqRlJwSmp3ZnM5T296NEZ0blJNZ1ptcjNQNXNXMFZE?=
 =?utf-8?B?RUM1Uk12UmJBam1RM1lTaXNSWS9TQTcxS1Mwa3RzRTQ1Wi81cDllWUdVeEFW?=
 =?utf-8?B?SHBtMGZUTk1idmxzS0JVdXlEVFE4YncrZ3gyMkxFQ0l1UHVYM0NoZldtYTUz?=
 =?utf-8?B?ZXFycC9Ickx1V0xteHl2TG9rMFg2K0txY29VRmFmUURCN0E1UDEyNGtPWStp?=
 =?utf-8?B?M3pMVTZOek5tdWRKc3NrZnp3M00zcDUwdG1Rc1BkbVFvUzNuWk1uNVNwVWdv?=
 =?utf-8?Q?TNENY6bOpoZ6K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2x4dzVSaFlaWFlGQ3dkUC9SaHV5V0wrTGwxZ2tjMk13TGtwcG5jMlM3ZmtF?=
 =?utf-8?B?U3Izdmh4dDZIK1dLQmZSZnNFZXFlTFBwMHVzb0JHNFFLM20wWWc1cUlXcGpI?=
 =?utf-8?B?TGZ1SzNsS2RwdUZ2dWF4eU5ha0lISU9YSEcvZko5RFBsR3JQZkI0TnZzazYr?=
 =?utf-8?B?NWNHa3RqUXJQYytGR0Yya1o1aHJXWVhHbXpVSms1T3hyQ29ISC9saENEUTJR?=
 =?utf-8?B?RUFCeWdtcFl4cUFGRVRyUkVJKzU2OS9PY0E2K056a0p3cXdmbDNSTDd6K2ll?=
 =?utf-8?B?aWxoQk1PUE04V2g5VGpoZkRMVXpSTHA4VWxyWUZ0UnVHa21weFFSaHVSTWNp?=
 =?utf-8?B?cnhpVFYzQ1hEaDFBQ2NDTUFCbVNjMzBBc0dRZVRIODFCdUE2bW45ZDBxRlQ5?=
 =?utf-8?B?Z21FM3MxOVRBOWFOYWJlYityemtidVpoZUgwSUlxVEIxMWVNcnpwRlcvVDds?=
 =?utf-8?B?SmJnRkhnWmNncDR5c0hHUFZnNmRocnFXampuamppVVlCQTlLMlJVd3JQNHZX?=
 =?utf-8?B?QndML24rVEFURWNxWHhYVjZxZUNSc0ZWVWdmc280aTZXTkkwZ0FVQWdGYUFj?=
 =?utf-8?B?Lzc4cWEyd3lLNkhKNWJGSW1hRGZpUFd6L1AzMXJZWlAxMlJRVDhaa05WWkJr?=
 =?utf-8?B?MWVnekVIL1Vhckt2NVBhTzZPSzNFam5JMndjcjJxZ0UzVWdrSFA4cHplV3hM?=
 =?utf-8?B?ZEFFdmlVNHEwV0VkckFDWFlmeEh1OFlYVWtwenZnMy90a00zNHVBVGJWb2pl?=
 =?utf-8?B?L1hTcjY1OUZTVkpiaU9PR0tXaTNINDBKeDYwUmtWZmxTSUt6QkJFQ3A0akZo?=
 =?utf-8?B?Y2lwNk1ScTVhYWZDZ3l2TFRLOENMc2pQalVWS0VlM29SZ0xKZkVIUmhMN21W?=
 =?utf-8?B?ZlRPYXJiMEtkNUJ0TVBVYkxtN2pMMXg4MnpqOVV1ZHFlNEJmbVRMbFRNbmNK?=
 =?utf-8?B?aEdZQmw1WnN3K2tpYnlyTUh2U2k5dUJvZk1TNSt4OXVnRDZ1WGpPb3U4ZDhm?=
 =?utf-8?B?K2d3cmdVbEM3TUp5RXN6bWlEOG5KaHg2U0ZFclFOeGZTRkw2cTkrOGQyc3J6?=
 =?utf-8?B?U1F6SndpbWd5U055eDNuZTdQcVNWR3BhVU02M2Y3WWcwVnpCTXdtUjV2dHln?=
 =?utf-8?B?T2FWMTl0N3hDK0kySWpzRHJYdjdnMVR4dDhUV3B2ZVhvV3R2WHJ5aGNzR3hI?=
 =?utf-8?B?NHNBV0xLV0JTcW45ZDU4dDlaVmU2VDhZWEtpaytSWUNDdHFBRzFid3hYUVFZ?=
 =?utf-8?B?VHFBMnFqbzBNUTdQL3BoNWpadkx1ZWlac0NyQ1BLK051RHo2TkhxNEpHbm02?=
 =?utf-8?B?VWdVbHJOd2M2akE1cVhDQm5TY1ZDcldHMHA3OWVkVGtNenJ4YnFLVkJ6ckpm?=
 =?utf-8?B?MVprRWNnMTgyd1pUTnc0UFdUUEFhbFVQTWM3NTBHRVVuYXplYnJaZTdLV1Z1?=
 =?utf-8?B?ZUpGMExNV0xQWnRYcHFaRlNZdDN1MHdUMGdiTHM5NFpzOTN2UkdnYzhoRjR3?=
 =?utf-8?B?dlVpc0kxQm1WYmRxRDMzeW4yeVRlQ2hwbXYzM3p1dCtNek9DZUUxdm5INmJ4?=
 =?utf-8?B?TEMrdklBd0VNaG9qYTRPaitJQjFYNXp0dEtVNWtDdk85aXprYTRSRHgzM1hu?=
 =?utf-8?B?dWZzamJibTE2ZlRNS2ltRW9yRkxRVUhpc1hwQkZlWmQrYTVHQmlZMzRNWCsw?=
 =?utf-8?B?QXY0ZWlUQTBjeWlqMTdnQi9tcGNjMEFzWm1XMCtQTnhGNFMvUnc3KzU1Y2ZM?=
 =?utf-8?B?akxYUU5McTJVUEdWTmFJb3RsSUFyTlJMdTdDY2NRVXJNbmNMdGxrTkVIcUlO?=
 =?utf-8?B?aG5XaDkvTHZFZ1ZCM1JIRXhIaklISGpDRmJXMjR1TnJPSDllOG9oZEFodHhy?=
 =?utf-8?B?a2VqKzY5dlJVSXlWaDQ5MEZmYWdRMEtpb3k5Z2JRSUFqVmFCTGVTSVdPVE41?=
 =?utf-8?B?dWk4TkNOK2lleDRXZlQ1RG5nOWNsejRkbFllSEZxYk96dFNzb0dvUTZ1NjNs?=
 =?utf-8?B?V3JTZFREQzZsQ09CNkprOWNoeE53UndDUzQreElmQ3VuMHpkLzJ1b1lOTnE3?=
 =?utf-8?B?TitiMVVobGkwdUJlU0tXc2JRRlNSaUlyR1RLaXE3ODhQM3hJMXVtaTViUDNU?=
 =?utf-8?B?bkNxalJhMWRzSzFVZzhzMnpyZ21WTGJNWXNDZXdNcEVGMmRqWTlPU2FlaXpB?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf59601d-c3fa-47d5-9ce5-08ddf1e5b7e6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:18:29.2615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaetKiBQfgR+K7+1ReqmZuBlRj+02512V+uck0EF31nahgh6tsHd02NFy6lbLFbEPZVIkz41amMrmLPwQeBHK4kpOskhhi2tkBzUixxvO+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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



On 9/12/2025 11:58 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	RFC: Add dedicated printk macros for tile and device (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/153985/ <https://patchwork.freedesktop.org/series/153985/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153985v3/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153985v3/index.html>
> 
> 
>   CI Bug Log - changes from xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c_FULL -> xe-pw-153985v3_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-153985v3_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-153985v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-153985v3_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-basic:
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c/shard-adlp-2/igt@xe_exec_threads@threads-cm-shared-vm-basic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153985v3/shard-adlp-1/igt@xe_exec_threads@threads-cm-shared-vm-basic.html>
> 

unrelated:

(xe_exec_threads:3160) [thread:3166] xe/xe_ioctl-CRITICAL: Test assertion failure function xe_wait_ufence, file ../lib/xe/xe_ioctl.c:676:
(xe_exec_threads:3160) [thread:3166] xe/xe_ioctl-CRITICAL: Failed assertion: __xe_wait_ufence(fd, addr, value, exec_queue, &timeout) == 0
(xe_exec_threads:3160) [thread:3166] xe/xe_ioctl-CRITICAL: Last errno: 62, Timer expired
(xe_exec_threads:3160) [thread:3166] xe/xe_ioctl-CRITICAL: error: -62 != 0

and new messages look correct:

xe 0000:00:02.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] Tile0: GT0: Engine memory CAT error: class=vcs, logical_mask: 0x2, guc_id=40
xe 0000:00:02.0: [drm] Tile0: GT0: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=80


