Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70231C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 09:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241A410E1FD;
	Tue, 14 May 2024 09:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/dNNnBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D004510E1FD
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715677457; x=1747213457;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5Nn1uHk62EswDo+TtoPc/12dhMcElpQxgblW/BEBmZc=;
 b=W/dNNnBZkCdhq2kFdcPl/nFqM0OnXRuOX5JmRNHUz5t5kEafDOLqFRx0
 YzeOKMOmqkXfFCYtQVm954q7g3P5IyfEUcKWM4Q7BFBOb3uxXhn57iTYC
 NSX1+gQthF1qROoNrjYYQXtfHGNCU1JKMPaqXvg49EmnWTONluNapNGzs
 NmC4gG5nDJRqcSkdeQG0bNXycvwzZ7I9yLIRMDc/vcSYDuomkkVezEIlE
 cEpB0aX5DhJNynrX3/tzgUe9t9gRE2V2pV1ps8Q9oAozxeHFtd0PCm2yA
 kXWmiHvX35nTnuyOMJcY9VOKh11lDIWl47qwz01EkunlXl7XZYlP26H8r A==;
X-CSE-ConnectionGUID: WnsUIHvtSr2GxZ4lnAAU8g==
X-CSE-MsgGUID: B+B1ra3sSWe4fNfG3M0xDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11592054"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11592054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 02:03:56 -0700
X-CSE-ConnectionGUID: EWQ+jR0sS6CRnw5QFzp9kQ==
X-CSE-MsgGUID: gHJ5i626QAizpau0dFXM3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35162026"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 02:03:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 02:03:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 02:03:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 02:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G60lkOoH8K+c2QBm4ya3tXYzudU/sFfIISbLrpc1cZNM/CkfbxktMv3oC+MUrEkwZWse6GySpmAjSTW9OXsUHUGJNJUmdhCnEOdQcwWRjZH14ln5GD7PZtWa30C6wXsG58KtMtx9rLhP5aZuBD9rSiBwpvrks9iEPsWXy7VpGhUN5aKoGAni9OMAiR9p3kuu/6w4MeOSf3s/WZZJzBJTR30szG9PlStkqH7PnCw3+qihvocNZ9iyzNymbXh7fOSse1ssvsanHnULLA81hhIcmB9ozeyiSZ1Ic6mbrSntcGxN3otGgpce8QNdQRa9PfctC4l7S1t7E8rN26PHvhM9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfc0c3UR1KRC12NGY+Sb4MXscUEt7LrRxpWBTY73qLg=;
 b=M6sPuJcL9ubjl9AiwFVwO2uE8gP8RXuYbC7651N+giJhcYIdGynpW/eAnlKBwkYtuYtPrf+RnIIzY3gnvkt/W0QKlfiW18/Fmf3wUlsX+8ho/WHai0PKx2miYRiGiIwi0RZ1kIZHmL7DL3seKrNOSbUzdV0IDZF2uI+AXbK77aSPBxhPhFVv5rriuLvYws4V5M555v0+VQPEIPvY6DbEM4gKDs2LI4irZ6jkasNLjSIpK98uyFPhTyxgIV/7/vqjTp5ubcFpBPVSUgUcEOXAoEovv36PkxyBPAqBrlELqVJS47+lpPAJV88aPHHbrdhAsKtGDTAQWqKnma0CiKUTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 09:03:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 09:03:53 +0000
Date: Tue, 14 May 2024 11:03:50 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/8] drm/xe/pf: Allow configuration of VF thresholds over
 debugfs
Message-ID: <20240514090350.qamnaxvbkqcce4o2@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
 <20240506133814.2571-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240506133814.2571-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DBBPR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b59bcd-c828-424d-41d6-08dc73f4c70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vktyc1JRbHJVNGJhQlBzYnhYMi9VVk1PNDgvdVh6Y1lSNFhlQUtub1ZKdW04?=
 =?utf-8?B?bmRYYzBwTENPWkFSQnBmSkNQaDd1MjU0clp1Y0tOWUFleXArVndaYjM2Y0Zj?=
 =?utf-8?B?enAxbVlHejdoQjR5RC96ZFdoUCtwVTZuZUEwaUpWWVFJNjVBdDE1eUtkbmlH?=
 =?utf-8?B?VzJudGZVcjFMeS9rUjl4cnE3QmkyWUZ1bkxqVnVlR2Yrb3FmY2dHTHN1cDFx?=
 =?utf-8?B?Wm9hZTVRdVUxNGx6RFdoaU1ZRDNhbTA1YjBjOGZ0NlBOTGFDcFB5S0xwc05U?=
 =?utf-8?B?MXFMb1RnK01YdGtmaGdRNXhYWEdwNjlUcmxrOHRjVEgwRVBKKzZ1U0ExcUtl?=
 =?utf-8?B?em43WWh4ZGFKWVBhekdWT0xPQVVnYnd3d3pzcGxDWnpRVm5DZG5TZWZuRitD?=
 =?utf-8?B?VDBTcFBtMzVNaTZsQitxRmd0UnlhalpCcmdVc3ZDWXplekdDUUVibHdWWVRJ?=
 =?utf-8?B?c01WYXY0MjltbmhndXJwTXJvZG9vNkRSNHJ6dW1JNUlVMkVjNVlwSHlYTW5v?=
 =?utf-8?B?dzBkcTdUNnNHbVJMRTRKSU9HT251VEtpWWtTWUUvdTZjbm5nUE1zYUsyOHRL?=
 =?utf-8?B?dU1BTFpaVGEybmVIcTZlUnZuQUViMnVkNHc4RTVSSlhGeXJSZ2pZT09Nbkdn?=
 =?utf-8?B?SDFrN0NtTEt6QUZWNis3MThRbVZSeTdZUEFKLzRqM1BwOHlqa3FsRURxRVJW?=
 =?utf-8?B?MmtiVVhNSzJwc2I2UkVXVlhia2pRWTRqbHN1MzNPalhiTEdENytXeEFyRVRH?=
 =?utf-8?B?ZlpTb0RrQjF2S0RoR1ZjUEozbWRXYUp2WTlDTmEyYWdpUXJUbUZWL3d3Mkkz?=
 =?utf-8?B?MG1BUWRoRFVjR0RWR1Z4Mkk0ektkQkZPalY3dFlCTjVDQkVrbk1XREVhRTFN?=
 =?utf-8?B?bHl3NTFZN1gxOVRWQVo0eUFzK0xaWHhEODY4OWc2dFkrMW1SQ2MxUDNRMDY0?=
 =?utf-8?B?aWU2cGd5OStnbmlDaXBjWC9iZ1AxZHVZcGxZT21oclRRY3dhR3VHclF0b1RP?=
 =?utf-8?B?T2ZLMEYyODF5VHZOY2ZNMGY0Tyt3MTNPU1UxcFNVRDVHUVc0aUhzZGZ5a0pU?=
 =?utf-8?B?VnZIR2VGZUNnN216eU9icHh6dk1PTUxxT2grMUhQc3BkLzJ5MGVWVjlOWGtr?=
 =?utf-8?B?T3Z2aFZrRngyMVJJZVdJN2RMOFJjM1FQVUNiNUxBN3M4NGo5cktQQ1NnNHEw?=
 =?utf-8?B?Mk43L0pCajJPWUFpSDNvU0dQUUZYL2dxYWFhWUpaZFFsbkg1aGNBZWNSQjlq?=
 =?utf-8?B?Rk43Yk5YMHZUdHlQaFZNVkw3L3dEN1N0cU16TWE3OGdkd3lINW91U1RGWGEv?=
 =?utf-8?B?bHBwOUVMb291SHVoYU5PUE81TFNvVEFwRzBnaWl6SFovNGpzN1l3Sng1KzBH?=
 =?utf-8?B?bEF2RnVvaGlXaUFxUm9IdnF2R2VKbmVCa1hpT3ZRYjBtZ3V3R2xkUWpDUFA2?=
 =?utf-8?B?NDdlNFRkcHlyNzNReG5pZ3ZEQm1WSExMUW8vaTFSS1c5TzZDcUh4NFU1b2Zr?=
 =?utf-8?B?ZU9rODRtUENzOGZVV1dmb3BBRkVlSnZ1eXZhbE5MS0gxYjhNVXIrTTZ4bUNW?=
 =?utf-8?B?MjdkZ0N1blBWRlRhdzErdTgwZnYzU3IzSVdhcGp3ZzFSWkZFSmlBaHZDWG5R?=
 =?utf-8?B?RlJEckk2NTFBSnlqdDFqb2RYL2xhdm5SYytoWmJCRWJCNnR3enJGK2I3Y0xj?=
 =?utf-8?B?QW5OU1llYU1yZWluSHorNXBYREFvTUh4ZjJreXh1Ylh6ckFFZm5YRXlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNtY08rSUJxMnljQlZtVDBZKzE4b3NKQnIrMWdrVFN4S3NBV0x0U2VwTVJB?=
 =?utf-8?B?eE1hVWR4M0xBWnpaS1VMeThSM1NhZkJJa2JrSHFWek1ENkZmSHhHUWliQjVC?=
 =?utf-8?B?NTl5cjhGTXV5dG8vb1djZFlOSE04WWdmRUo4cUJCSW5qYnZiakpGcFlacWhl?=
 =?utf-8?B?MXNRQW5iWk1xVFlyRXRCNzlTeXNPQ3ZFalBIeHAvTk5aamFHU2VBUjBPTjdD?=
 =?utf-8?B?SUphQlpqcDd4TTdIendPQTlpZ09va0lSTDN2bGo3bXM5WDAybXBDeDBZNnFP?=
 =?utf-8?B?SXZFdG9pR1UvTGdheVVTeVpvRWpMZjBLb1FYK2dCYXFzK0t0N0RpMWxYdWY4?=
 =?utf-8?B?MEovQ3Rkbkl4OHlXODRnTkdESkwySTVYc05Xbm5mK3gxVWRoeVZDWHpHcTcr?=
 =?utf-8?B?L0lzRzNPNjVHRXk3bEZYWXZkcDJoSGdxbmZvdXkrZDUvWk9QWlBWYWh3a2x2?=
 =?utf-8?B?K3Zxa2tnQW9GdWRjMkJNWnhjbXFGaVhmS3dxLysxV0ovb2lDY1JRRmRnS1Ev?=
 =?utf-8?B?d21rWCtabWpvM1lxcXFRcENxZ0FMZDlLeThQVWpnVkwzMzdMN3A2cjJIUy9h?=
 =?utf-8?B?eXhodnM2Rzk3L2ViZzNxMm8xR3poZkNmczU2QzFTaEdyb0ZxTzZlZDJsNU95?=
 =?utf-8?B?Si94Rk1FR1BWNjdUQkw5Q00raE81OGxiT0ZkemxSTXZxNVFESUNhUTB1SnBy?=
 =?utf-8?B?T2hETG94ZEhCTURUUCtsRmNaYmdsZGpjYk9qSnRCQ3FrdVFNOUdNbnZxckto?=
 =?utf-8?B?THdLYy9TcnM1aEFMbzdXVlpwZ1oyT2NQclhPN0xkMmR4dWU2MzlOeHJjN1RJ?=
 =?utf-8?B?blE0NkRwNlJnbVZEbDgrQ3ZyYUZtYlUrOEJYMy9jRjAzWkFjM29yOEU3dzVj?=
 =?utf-8?B?V1kyVW5qb3lkNUc0V3dtNm0vMVFjQmdVS3ZiaG9BTkJKK3Y0NEhUNVdsM1Na?=
 =?utf-8?B?dStWSXMyb0ljcHdsaTgvRkVtSnBsckFBY1pVR1VRSmRIWnUrR3Mxb0x0N1NF?=
 =?utf-8?B?U3NhdVpwWXZjWFluZzZ5VUxwemgvK2JWalhxWk5FZVBWMWM5SlhkVFR1ZDlI?=
 =?utf-8?B?Q2wxanpGMjNXWXBKZXNnVkt1MThhUWZac1ZjNmxwbDJEUWNWaGJpQ3RiU2Vj?=
 =?utf-8?B?TlN6Ri9LVnVLTVdWcjZONFB2d21LYWlLN20xYzBVMmJab1RnUHA1QWpZVVJl?=
 =?utf-8?B?bzBzSnZiVmd5NVUyUTBHclNlK3hGeFFUOXN2R2J0MmFjaStVYU9raWVsWTB1?=
 =?utf-8?B?cGkrQUQ5Y1I0Q0lFZ2dGWmhpTE1iTGsweUl6bnBKR1dYbG5KNDk3MVJtK1RJ?=
 =?utf-8?B?RWZSdXE0T1NLTkpVaUdMSHpBTkxyTDhsZFNoWEt1NFg5a0xZazJzdnQyN3Jv?=
 =?utf-8?B?akVKSTgyWU04SHFvL3BVNWFLaFc1OVNDbyt6NFVmT1JMUmFXWjRVQnArSlNE?=
 =?utf-8?B?bkRvZlVkQkkwVnNWcGdveHIrL3UxUnF4cGNKSUFoTHlvOUFicS92M2dXYnoy?=
 =?utf-8?B?WVJ1ZThtWEdsVVZZQ3ZDRUorUFA5cW9NaUtpbnFMUzFRNVhoYS96YXVIekFS?=
 =?utf-8?B?bEpwNWZsUEVFa2Y5UU1CMnI0K0dGd1d3Z0VPU28ySG5oYjBiK0RDQnJ3VGx2?=
 =?utf-8?B?aUdCNmZlVDFlMDhZMXJMRWF0TzlNZko3dU5Ta0tzd1VuQzBTRmJnV2lEUkpQ?=
 =?utf-8?B?V0diakxwbjRwTWJmRUJMT0lDaUdCL1cxM011dG5lbmwxT3BRVUUxcHBLWDdt?=
 =?utf-8?B?c2l6V1MwNXg2enRMcnk3QUVJK01qbEFuY1BRNzhSemJsK3E1eTlON29TK1gr?=
 =?utf-8?B?emdCRUVhT2tST2ZVMmdWSTlUY2VjSVQ5Q3VUeVEyd3hLeW1jRWxncWVNRVgr?=
 =?utf-8?B?UFdFd0NWMnJVaURzcGxwRlFUb0MybEkzald4T3R2NktrRXVaS1RhS0JvbExU?=
 =?utf-8?B?b21FUWJVa1lySTc3SnlRTDlSaW5CUEpranpBM1hDZXQ3aGkvdE1PUGhWc1E5?=
 =?utf-8?B?bVhUL1NCT2gvMGcrZWZMMnRVRUNJYzdDZkVkd0lHWWI3TGloUHNjYmVkS0dT?=
 =?utf-8?B?eURsamF0SE5hT1lOcTJhbGc5OUZMdzdUQnhnZEtySEhxR2tBQ1FkZ1hTbTB0?=
 =?utf-8?B?bHdLUXlnZmpVMVh1L3QzV0R1ci9XZ3o5eG5ablVWbjg2OFZ0d2tMbytpYVp6?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b59bcd-c828-424d-41d6-08dc73f4c70a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 09:03:52.9987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PkdeWf9HJfGzMgFcpIeVmK4Abzptmjuqlucylpl+d7L/cTiwc59tE2ZiU9EfBOvVfHB47IH7+fIflGOGHh0HSKsMTQhYzy2HzEHk0dW5Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-maj-06 15:38:11 +0200]:
> Initial values of all thresholds used by the GuC to monitor VF's
> activity is zero (disabled) and we need to explicitly configure
> them per each VF. Expose additional attributes over debugfs.
> 
> Definitions of all attributes are generated so we will not need
> to make any changes if new thresholds would be added to the set.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 72 +++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 5102035faa7e..eb71c2009c34 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -197,6 +197,71 @@ DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
>  DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
>  DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
>  
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── pf
> + *      │   │   ├── threshold_cat_error_count
> + *      │   │   ├── threshold_doorbell_time_us
> + *      │   │   ├── threshold_engine_reset_count
> + *      │   │   ├── threshold_guc_time_us
> + *      │   │   ├── threshold_irq_time_us
> + *      │   │   ├── threshold_page_fault_count
> + *      │   ├── vf1
> + *      │   │   ├── threshold_cat_error_count
> + *      │   │   ├── threshold_doorbell_time_us
> + *      │   │   ├── threshold_engine_reset_count
> + *      │   │   ├── threshold_guc_time_us
> + *      │   │   ├── threshold_irq_time_us
> + *      │   │   ├── threshold_page_fault_count

Only the comment is not as dynamically generated as the rest of the code :)

> + */
> +
> +static int set_threshold(void *data, u64 val, enum xe_guc_klv_threshold_index index)
> +{
> +	struct xe_gt *gt = extract_gt(data);
> +	unsigned int vfid = extract_vfid(data);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (val > (u32)~0ull)
> +		return -EOVERFLOW;
> +
> +	xe_pm_runtime_get(xe);
> +	err = xe_gt_sriov_pf_config_set_threshold(gt, vfid, index, val);
> +	xe_pm_runtime_put(xe);
> +
> +	return err;
> +}
> +
> +static int get_threshold(void *data, u64 *val, enum xe_guc_klv_threshold_index index)
> +{
> +	struct xe_gt *gt = extract_gt(data);
> +	unsigned int vfid = extract_vfid(data);
> +
> +	*val = xe_gt_sriov_pf_config_get_threshold(gt, vfid, index);
> +	return 0;
> +}
> +
> +#define DEFINE_SRIOV_GT_THRESHOLD_DEBUGFS_ATTRIBUTE(THRESHOLD, INDEX)		\
> +										\
> +static int THRESHOLD##_set(void *data, u64 val)					\
> +{										\
> +	return set_threshold(data, val, INDEX);					\
> +}										\
> +										\
> +static int THRESHOLD##_get(void *data, u64 *val)				\
> +{										\
> +	return get_threshold(data, val, INDEX);					\
> +}										\
> +										\
> +DEFINE_DEBUGFS_ATTRIBUTE(THRESHOLD##_fops, THRESHOLD##_get, THRESHOLD##_set, "%llu\n")
> +
> +/* generate all threshold attributes */
> +#define define_threshold_attribute(TAG, NAME, ...) \
> +	DEFINE_SRIOV_GT_THRESHOLD_DEBUGFS_ATTRIBUTE(NAME, MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG));
> +MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_threshold_attribute)
> +#undef define_threshold_attribute
> +
>  static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
>  {
>  	xe_gt_assert(gt, gt == extract_gt(parent));
> @@ -217,6 +282,13 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
>  				   &exec_quantum_fops);
>  	debugfs_create_file_unsafe("preempt_timeout_us", 0644, parent, parent,
>  				   &preempt_timeout_fops);
> +
> +	/* register all threshold attributes */
> +#define register_threshold_attribute(TAG, NAME, ...) \
> +	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
> +				   &NAME##_fops);
> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
> +#undef register_threshold_attribute


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  }
>  
>  /*
> -- 
> 2.43.0
> 

-- 
