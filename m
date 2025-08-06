Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF62C87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 19:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF7510E316;
	Wed,  6 Aug 2025 19:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AodeOMXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C6710E316
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 19:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754510265; x=1786046265;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lVTzSW6Gb0uNOLimdK2ouUMH8wwP6mRX4CBwecTNXfU=;
 b=AodeOMXMhrUhD0bFqA0dHM7nMes1qXVjTIUN+19XrxfKK/3hcjtR+RaU
 yrsERITsbDpV8f5Jx0JXPTE7d39rD66ny1BaoPG9dlIV89AA/LP0de902
 GCgI04Ka+8agqS+7VVl8nKwmozFXN8P5YWqtNdA4QjQEI5WFhJsfbGbOx
 c1cnB1kbfmMhBIoXVJ0xB/8b3IPc+T1f/iP8GQLVA2QUKx8HHpBVTXAcX
 AlBsZWhSEzDXxpgRGzfzq3l8BL7alEi4wUfzb21OUqSjsr9EMaD3eRI5O
 +nrf14KSSMCL5eoLhD/1rwjRfDWIkI2Tcb4R+oOSgXcPs4BeUX7X5dRn4 A==;
X-CSE-ConnectionGUID: z4TpJCzhRtmHpkZkMq9dSQ==
X-CSE-MsgGUID: IXFEpfr8Skup2ER03wEDFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56733398"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56733398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 12:57:45 -0700
X-CSE-ConnectionGUID: 1xmw7pmyRGGTC5qJVTQmEw==
X-CSE-MsgGUID: AL0tCWgeTo+liS0TJAVBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165272068"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 12:57:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 12:57:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 12:57:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.56)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 12:57:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2ROCThTTl+hXxFzRht5mzamppc+K/zq5hGdS+mCBVfsQZW876+SnqCJcdVkjaJU0CAKgZeLuoIxrSkTIbL5G0ySieiej90flYCulgqOh1J0cIOtWh6stj5VmyvjgL4xYRsxRiC1ZiXgOcC7XDLh97epS/e2L8k15J/35NW69US1On7wMpPc0ersQXTSzE8ivyoB6Rz7geC2uXUart1s4W3OlMUHwRV8M2/CMxk/JN9pCXiOBbPQHK1L+rclQYO1+BOBG5JIM8kgtelB1r7aeA2vPhLb0/flsbiaCHaaMHZ+xEksQ1RGp+GgKUq7p9FHuDSQongmAQiICT5bkMy2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1gIhPosOW3634EjCPxDb9iJwWG5CHbZRYATExFmX9M=;
 b=TLdfGVg4vtXf4X5z04EER5HY8ObaGJIjdlpZ/5GWSoz+iaVdjRCOAkPymkN766DxFXb5No22lZAcoYLEYlasaAfqlN4ZtCNxJZz9ZnSoUkU3TxnRHMo/gWvGuk1eNY2W1gAwPAfOkU5TMpJMliTn6envSE7mKN+gxzNCCEK7MlZ8VJTYrsS3VqHVdJIrv++4LYS7yvWtaNKsjtkoOtTB7lGhaGNBiUt7fxfo8LRyuvmlAEMVkzekEYWOlNcV6Pyg/58/quufE1kYxfEweFISSSnahdI9KoEtrYU43toAswWZmO7i/Yp0pVEL7pJMHipMDgiyM7Iop4o0vDv3r1VBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 19:57:42 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 19:57:42 +0000
Message-ID: <f2c26f5f-5033-4604-b355-05c234bd62fd@intel.com>
Date: Wed, 6 Aug 2025 12:57:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Scale mmio send/recv timeout for CCS
 save/restore with smem size
To: Matthew Brost <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
 <20250806082910.15845-3-satyanarayana.k.v.p@intel.com>
 <aJOCoZMciuSkCYgg@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aJOCoZMciuSkCYgg@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0026.namprd16.prod.outlook.com (2603:10b6:907::39)
 To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f498ae-9b6c-42a4-2bad-08ddd5238096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVMxY29nOTlUTW9nQUt1eDJwd1hOV3B5WkEwM2JqZm1HUjVZY0lqZ2xnZWsr?=
 =?utf-8?B?emxONFJEZXQraTI3NllUZVFPK1luK3dYdHY0WnBONzBkTjBXMEJzeTFRT3J5?=
 =?utf-8?B?a3o1NW9qQ2U2UzZZYk1nNXFLS1hub01RT2drUlBUVVJ5anMrOFVsVDhsa0Mz?=
 =?utf-8?B?eC9hbkxTeGF3ZDBBODhMK0wyRmQvWEI2TlZOaHUxdmpielBkMWlUT0tWYnBK?=
 =?utf-8?B?YVA2R3NvRE9OVzU0STVpbGtORnlnL0VaM3JvMnBZdEpQSUEvY1FkTGNLVHR5?=
 =?utf-8?B?czdKbmx2K05pbkpEcE42MVR1U2lHZm4xbEJDQWV4T0wzSUdIN3RTZ1VUMG1q?=
 =?utf-8?B?d0wvWEpjVCsxMWdSbkt1bThnZi9xT3NNS000WUlnOU5ZUU4yakNmME5ZTG1K?=
 =?utf-8?B?ZU5NMnBwNHNxendPVUhoMlBoekFSWFdURjN5NWx4VVUwUEl3NzBKSFlnbVFa?=
 =?utf-8?B?UVlRZGhVdWo3cU84blRCdk14MzkwYXQzVkF2MUkvY2F0cGlZYU1la0pIcitW?=
 =?utf-8?B?b1VsYmdldSs2OXNEWDBWeVh1WEJNdGREN2RYSG81cmN4WXFJRUphQU9xUWZU?=
 =?utf-8?B?RjkvY2xqR0pZOXdXUlp2Z2pZVVR1SzVxSHQ3VVJ4MWswbzh6U2VLaGdQcC9a?=
 =?utf-8?B?VmpHbFJaLytsVE52YWo0RjJ4YWN1WFQ3VEpOSVVKL2xuSEJsZG1BT3Qyazkw?=
 =?utf-8?B?RTBSaU1pMjVnM3RKbTdTckNqRlVUWEc5ZGhFelIvOFBrbmNHRDEwS1NpSlhJ?=
 =?utf-8?B?N01oMXRkalRQMmlJa0toR3lYWTR2SzhWbHdvRnF0dnBlajlMS0hoMUI5M2Z6?=
 =?utf-8?B?U3pETmNZdkpmZCtqMVVIakxqRG9FaUJNcnJ3ZVVMQUFoSGE1TUV5amdVb0Vt?=
 =?utf-8?B?NlhQUFluTElienYrVkhlaUlUK3h0TmFCQzFPaytJRkREVWUwc1FsS1NWVzlw?=
 =?utf-8?B?UmkzblhNU25JVW9od1g4QllRQjNZeGhlQkJkWjVnbnFpQ2NUQzAwdDUyNUZo?=
 =?utf-8?B?WnpYWVY5d0xLR1hScW9SQ2NKQktlR1FUR0czbjhRTTlLSzM1OWZoK3Y5a0tT?=
 =?utf-8?B?Nk1DdTJ1aGdKMDMyMXo2YkRNT2t3eVdhWUFrVUU1S0Rzdi9sM24xdG9jWDJT?=
 =?utf-8?B?VnlZNnBieEMyU3hESmdnRW1oSlEwUXNsblJHRlE0WmhZWERuTWlraTczdGM2?=
 =?utf-8?B?QVRocGU4ejRPWnV2QWorQ0Jsd2ZwcDdqZnNPS0R2WFA2NjJ3dGlkemdmUnJU?=
 =?utf-8?B?b2xTeHNBNHlHTVBLUjBlMXdpakxiT0o5WkhCWmIrYTZuZ1E0T1BOVXR6R3pj?=
 =?utf-8?B?WG1qVkp5UzhKNmZudFBzUXh2MXJGQ2w2a0dSNFFia20xSG1RcUNIdVNUKzVG?=
 =?utf-8?B?dUtlaVZHN2NFd25aemJjSnBrLzhJN2tsaGcwb3J3d0xPWWlHMUhvNVhHVWts?=
 =?utf-8?B?OGwrZnkzNDFxOGlGN2wzeEVORnpiMWpqRkpOZUxvVE1MNDdUQWU1T2Y0VVJN?=
 =?utf-8?B?amZMYnlkQ1E1MmdKTWcvRm1SQ0VJc1hDWU9ubmswZERkamNBNmNVZWZWZGFH?=
 =?utf-8?B?dVd3MjRkenNWblQwU0U1YjMvOGlZMUZ5Y2dJOFZzODRJUFVvODQ5elJxZjhM?=
 =?utf-8?B?MnBVRDA2d2crV2N5a2haQzJGUXVTV0I5K0NLOVJYWW83b1lSQWl5RktIWktk?=
 =?utf-8?B?NjNnNlJVUVI4OEl1M2Q0QlVFU0NNcWtMaVh0QXJPUGtGRzE2U3FVZVZ1M2lV?=
 =?utf-8?B?VitsT2VVM0lFb29HWFNPYnZBcHQ3ZzFFekxON0FySDBvYzREU2ZuQ1dQKzJX?=
 =?utf-8?B?alJtbmZIYzFEQXNFemF4YmZCSWpsRXpmajNlVnpDZTVxTko1TWpUUmRkaXly?=
 =?utf-8?B?djI3QlpxVkQ0Vy9hQVhwb3VhaXFvTUdtYnpxLzQwQ0YyZmZ2NzVaaE52Ym9k?=
 =?utf-8?Q?vELFtREE8vk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V210YVQ3OUxVeHlFNWlMV3BXamZoQ1E3YUJHQktqZDFMZ1Fvd3dCWmR3WDZy?=
 =?utf-8?B?OHdQZXMyNGtBTmdDSXRJdVYrd0xYb2p0K1ZOTDNSa0dMNVROVU9VbmwvMGk0?=
 =?utf-8?B?MEJkZXRWWDNPTGxEQVN4Mm90dFVBS0p5OCs0Rlo4QVRiZUVaSitzM0wzR0c1?=
 =?utf-8?B?cTFVSWhXQjM3MWNUMmJvZEdudE11VDFwQnRWdE5WY1RyTWlBYUk5YlBnS0xx?=
 =?utf-8?B?N3pqU1ZsZEJWV0VnaDAyT1ZQbVNZZ1Z5WDlmOFpQa3dNSSs3R21ZcUxST0Iv?=
 =?utf-8?B?MEtGUW9Sa3QrV1JERWdua3dua2R3RGNJNzhKL1hwY3hUZW5hTEd6WmpvSzNu?=
 =?utf-8?B?cUp6UVZBdUEvaGxqQVNEWFY0SzdYU21hSTRiNmNPZUUxOGpsQTBCWjVnc0tu?=
 =?utf-8?B?Q2YwM2hEUSs5NGhYTXhIZUVyeDEvbU9Qdkp4dlZDQU5nUTVGcEVLYnJSd1Iv?=
 =?utf-8?B?bWZnd0NRREhaTVFTVTZlNU5xUmNSQUoxNlRYUzc1ZTdCUGlKRG4yblhvOVNw?=
 =?utf-8?B?M1dXWEc5emZoNnk3clVYNCszTTNJSHRLbkhvalBMOXhzRzE1SWhwVUJ3SFpG?=
 =?utf-8?B?Y1pPb2hySlRrM0NCSmNoV3RPYk5uNXIxcXVXb0JwRjJLdlNmRlZvSUU5cmlV?=
 =?utf-8?B?dVAwMlZoR0hsS1c2a1FlUE5nVHFyRHZRa3phTDhhYW5wSjg0M1BFTkFhTkVX?=
 =?utf-8?B?VHoyUk14aXY3elFOdTVwTWNZS2taVlNtaVhNMTdkYndnSkJGTk45dStwamha?=
 =?utf-8?B?VFVPY1ZTMTdrZTNjdytFVVkxYTlvU1NXcnkvV3Z3eUhyeFhXWTdYT3R0SDhs?=
 =?utf-8?B?STl0VGJNRjQxeTlkZkdlNFFJL2IzVlhSZmRNdmkxdlBhSlkxSHFwY29uVkNk?=
 =?utf-8?B?VkJNdURmVzBMaDBLNlBRM0lXZlBacWRHLzM0K0ZQUUQvQXZSZzQ5WUdGUmdp?=
 =?utf-8?B?TFVSSFNKRUoxMUR3UXRMVkZJTENzSno4bDJKNEo0V2p2bnBjaFYyZEFCY0xJ?=
 =?utf-8?B?THZ4ajhDdjkwR0drVjFVczNOZU44a05lNUdidlg4VFJFajNxVGkrSlhtZGdj?=
 =?utf-8?B?dW9ia3N4RG5QWVVpcnl3MWV0NWZodkYraCtEZnhQeFc2M0FIZEZhL2VvY01I?=
 =?utf-8?B?SHBuck5XazhPbkhaNlc4WDRXMWRHVndwajcxOGt4ZDJtN1lhdC8xcEtGRktQ?=
 =?utf-8?B?S2wrZVAwb0ZWdVVBZjEwWEVuNytkQmY3akdpOThteEdCa0YyOHFiQkp4dkJw?=
 =?utf-8?B?T213bGxJWHFIaDRwRnY3YTFzR1c0a3k5N3VNMjUxalhKTlNpK2ZlVmRqKy9T?=
 =?utf-8?B?K0hKay9ZRVM1bU5zbjc2V3hRTE9KVWRUc3ZVL3ozcWd4Z0s0VHN0S29oVzVC?=
 =?utf-8?B?ZXVBamtsdjh4dDUwU3lta1JnakVpeTFyV0lKOHhocjZKaUs4cktLdWFYMTNN?=
 =?utf-8?B?VjRpWmx2b1UrM1Zzamk4MjNmamtwS3BVRnVmMzBCdlFCWW1wZURPdVR5Tlg3?=
 =?utf-8?B?ZytEZEtmRWdJbUVuS3hCS1VnMHkvUnhyenNFbGdhaUxvQUZ4K25pbUlVUkov?=
 =?utf-8?B?Sy9ZL3JJeG5aSG9kQ2QzU0E0bFUxN2VvRUxNazRoSHdFVmFGTENEVHJQYUJ4?=
 =?utf-8?B?d080R2paa3pjMVpiUlJQelZKNlduZTRvQnd6cnFpR3RrQjVvZWxRZ2pGTDc1?=
 =?utf-8?B?RlZLWE1NZGV3TUpnS2RJUnV0U1BIMXg4QllQVEhDR0k0ZDZINWo3THQ5Nmg3?=
 =?utf-8?B?QU1MeW15QVREeFVqNHl1amNKcUFlSHdsalpyTDYzekZxNWp3bXFhSkpIcWg3?=
 =?utf-8?B?SjRBZXNwVmlLckpyTW1GY1VUaklDVGlQOEMzcEtqcnBIVHY0VjFBemIrSGpL?=
 =?utf-8?B?ck1mNTRBcHlHYzljRWgrRStGN1o3dTdDbEhvY2hjT205NEhRVmE1aGxOcm9H?=
 =?utf-8?B?OGZWNnBqYWpoRVo4MjYvUzZ3MERURENISEh5NHFEdWhzOUxOaFY3UmdLa3pF?=
 =?utf-8?B?ZWE5K25UU2RMOElLMExSaHJ6UGJGS3R5UFAxY3p2ekhGOXc1azNIVC9Ka1BJ?=
 =?utf-8?B?TWNWZ1UzT3pPSTBWcEwya1pXaGpqYnZtZ0wwcnpuRjB5NGJMU081YnRzbnl0?=
 =?utf-8?B?MHZFZ3MzdURacHRzaithOHFhVjlnNDdjL0ZaVCtxd091Ym5wampmdGpsSkN0?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f498ae-9b6c-42a4-2bad-08ddd5238096
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 19:57:42.4566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q576Vb9CUFjdpOzTrNPyv4FQGRFemn8sAXU8f5AHh5pDmt2mowu+8tjnK6dXl8eaW3NNiEa8B6BQIfpwHq/z8Ex4C+HkLaOA804lWtrm3U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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

On 8/6/2025 9:28 AM, Matthew Brost wrote:
> On Wed, Aug 06, 2025 at 01:59:10PM +0530, Satyanarayana K V P wrote:
>> After VF migration, GUC restores CCS metadata scaled to system memory size.
>> The default timeout (50ms) is calibrated for 4GB memory capacity per
>> specification. Timeouts for other memory sizes are proportionally derived
>> from this baseline.
>>
>> This ensures adequate restoration time for CCS metadata across
>> different hardware configurations while maintaining spec compliance.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 33 ++++++++++++++++++++++++++++++++-
>>   1 file changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 9e34401e4489..d836ded83491 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -10,6 +10,7 @@
>>   #include <generated/xe_wa_oob.h>
>>   
>>   #include "abi/guc_actions_abi.h"
>> +#include "abi/guc_actions_sriov_abi.h"
>>   #include "abi/guc_errors_abi.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_gtt_defs.h"
>> @@ -1397,6 +1398,36 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>>   	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>   }
>>   
>> +/*
>> + * After VF migration, GUC restores CCS metadata scaled to system memory size.
>> + * Default timeout (50ms) is calibrated for 4GB memory capacity per
>> + * specification. Timeouts for other memory sizes are proportionally derived
>> + * from this baseline.
>> + */
>> +static u32 guc_mmio_send_recv_timeout(struct xe_guc *guc, const u32 *request)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	u32 timeout = 50000;
> Is this really the upper bound? It seems like if could be signicantly
> higher if multiple VFs are trying to do things all at the same time.
That is really a problem with the wait function itself rather than the 
timeout. The timeout is meant to be the maximum expectation for how long 
the operation will take once started. Unfortunately, we currently have 
no checks on whether GuC has actually read the message itself before 
starting that timer.

There is also the opposite concern - what happens to any other VF (or 
PF) that is trying to get work done while the GPU is tied up migrating 
this VF? A stall of multiple seconds will cause all sorts of timeouts to 
trip.

I think the expectation is that migration is a deliberate act and the 
system is not going to be doing anything else at the time. It is not 
something that just randomly occurs in the middle of a heavily loaded 
system. But I may be wrong on that?

>
> Scaling the timeout itself, does make sense though.
>
> Matt
>
>> +	u32 action, factor;
>> +	struct sysinfo si;
>> +	u64 sys_mem_size;
>> +
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]);
>> +	if (action != GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE || IS_DGFX(xe) ||
>> +	    !xe_device_has_flat_ccs(xe))
>> +		return timeout;
>> +
>> +	si_meminfo(&si);
>> +	sys_mem_size = si.totalram * si.mem_unit;
Do we have to worry about Linux supporting >64bit addressing any time 
soon? I assume that is the reason for having separated units here is 
that the total might be over 64bits? Or are there no plans for 6-level 
page tables yet?

John.

>> +
>> +	if (sys_mem_size <= SZ_4G)
>> +		return timeout;
>> +
>> +	factor = (sys_mem_size + SZ_4G) / SZ_4G;
>> +	timeout *= factor;
>> +
>> +	return timeout;
>> +}
>>   int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>   			  u32 len, u32 *response_buf)
>>   {
>> @@ -1439,7 +1470,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>   
>>   	ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
>>   			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
>> -			     50000, &reply, false);
>> +			     guc_mmio_send_recv_timeout(guc, request), &reply, false);
>>   	if (ret) {
>>   		/* scratch registers might be cleared during FLR, try once more */
>>   		if (!reply && !lost) {
>> -- 
>> 2.43.0
>>

