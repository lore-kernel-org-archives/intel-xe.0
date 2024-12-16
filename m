Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C972DE7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 22:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB6610E036;
	Mon, 16 Dec 2024 22:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcZX9+gS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D8810E036
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 22:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734389298; x=1765925298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YaCq/osgZf/70gzBZzvQoCzbGc4kapHxVd9X4VoY0oY=;
 b=BcZX9+gSoV2Zd7hVyenkXQpZ07cauy/bTuLico3DEhG4HnqMf+T1Ik6g
 4gA6Y6Fz4wKBctPf+NSTi9J9lsPCWNM9bDVeDvUJ4Gq87p00lCO6bFAdn
 umTgRZgOZxtdQaqyy3R22LBPzRcnu8Z2HMglTiXdGhucwODdnt7M616oO
 f26Efot34EbgXNGr5YJAFu1GVhN622oZZUW8ak20XEiX+1tUrslHX07IV
 W99L1XQNka4TpHW/P+oz/4o1ytSluX/U2bEdDPFDoCAfTM42xUKhMqQS4
 JvK+qahRG1qZu5zDzhv0KEvrs2//ddoggtPds8Q7zBGqa9crpEagSfkEQ A==;
X-CSE-ConnectionGUID: oE2Av4PwTECqQN5euVpzCg==
X-CSE-MsgGUID: cv1wUbbeS6yrkimmqrvQaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52316868"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="52316868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 14:48:18 -0800
X-CSE-ConnectionGUID: y63YkGDKTEC+Vjx7Jhe3aA==
X-CSE-MsgGUID: IXT2rNEiQUWrgopbc60bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101496452"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 14:48:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 14:48:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 14:48:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 14:48:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQ2vhDeUrFriDlg/RxSaQqLzwqHJ8xBmhjCdvJyq/Ouqzx9HvtQA03TZA6zgMvR8LlJAr9MEsi7jcgTmO6ylBhtaBlmQN2kQxgVGn4h/4zWWfj8JVgx9HnSyyE1+L66f5MIF43Og1x8A7p4Fl5291RCwlbdqWy9fzJ0uQRE7P6RQibg663Gkuw2f7YXOmUAfDrQrmZ7BVHeq52C2Pvm6o5O6t3ys5gfyMssCSDmMD71D194VtcRno7IjCmo1jJU9kAAvw+WvmxbifoyQDZMdKzKhx1ukhBJkqh2lUQnoyJ/Xjv+oL/npOczPW4PoGyCQnuZn5kVPX6hsGUSH1Vs4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JrSgwVPz+q4nlLH02lrsYfVnSiVAyUDRPWs6rOy3jE=;
 b=DOnYClicoz2n16JQhcEoD4HOsFhwjWKj2fm6BhnF4QlZBs5hIZgTL/hkm9+IWpsvyd3h2QUx9vObfviHMUUGQSGCWgfVvfvuzQy6m3uTUxByWVBTpgeVWKJU6JrEaOeotPRMPZlr34x3xJg8WYCcNJebxykAYVqkObcu0cNAAYmiWtE29fXiJ2BsBWWv44hV5nElSbTywyet4YXzrYqe+chim0mgpx93OISHUOKCttYXSokPpgFIAv2JNZqpyUnjpEz7fJvfffxqDpcmJPId6Kh1jShBNO9aiWOM1HTLHsZIvlRwveFym6Cbg6yIAfHnPGkeVRJe255WCz9x30YNbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 22:48:09 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%6]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 22:48:09 +0000
Date: Mon, 16 Dec 2024 14:48:06 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/oa/uapi: Expose an unblock after N reports OA
 property
Message-ID: <Z2CuJsoml8u3azAO@orsosgc001>
References: <20241212224903.1853862-1-ashutosh.dixit@intel.com>
 <Z1zXUdMPUGQVO5yJ@orsosgc001>
 <85a5cz2hrx.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85a5cz2hrx.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:303:85::6) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c3a404-a9e6-456a-3fa1-08dd1e23b65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWdSc09LY2lmSC96THhxdjBUNmNJMHpQYVBzYjA2L01DUkZkN0VySHA2a3Vt?=
 =?utf-8?B?MmJwNmM5VGtObS9PblRTZW5KNFV0Y2p4TWxwRFV3cWxEbnhXYkl1eU5ucEc5?=
 =?utf-8?B?QUp3dXFSeXc4VnIyTzRWdTlpQkwxOFcyR3hwVm1kWkNyK2ZQaGVuNExkaHI3?=
 =?utf-8?B?ZlpuQXp6bW16dXBBNFAxMzZveStTUE5EZ29vZlVVWUFvM1dwanhhcEVpbGlH?=
 =?utf-8?B?Nm8yZDVDdUYwMTVaTjlLTHRQbURHTXZ0Rk9RamxRWlVHajVsVmZORUNQQkxB?=
 =?utf-8?B?Y2JsOU9qakJ0L2RLWFdybVlZNnFIbjZMeFRRM2UyN3ZzbDF0VEV2RDVCRW1z?=
 =?utf-8?B?eVQ0TmErV3pWVVU0TlRyeHR5cVZzSkk2dTdJNXlzbWZKVXpHd1FLSTIzelhF?=
 =?utf-8?B?MGlaTUoxZ0I5RzBURFBEKzlqVnArSytIUFlBaWFybUJ1WDhNZHd4cytROGxN?=
 =?utf-8?B?OG51WjFQYVh3MzdZb3RmKzE5UHpNQW4rMTJ6bkpLRGh6M0JNVWtCVXNCdlEz?=
 =?utf-8?B?ME9PdFQxYWJjTWJwdXVhbzR1UWpiZ2F0WmgyMU5CVGY0WHVYbEZpSkRrQnR1?=
 =?utf-8?B?aWtLS3BObjc3dDZnbHpXdEJaZWgvbENsd01uQ3RQeEtGQnErN3J6aU9ZOUpQ?=
 =?utf-8?B?NFF6RGVYUjg3Q1BlQWt5QTVOMlVBTGJEM05KUHM2d1ZXeFpsQmVvQUV3dll6?=
 =?utf-8?B?NXNrd1F4WHlBWmV3K0pIR1h3WXQ1VHZVTElNemNvR1FGRjA2MjZFTmx4b0ty?=
 =?utf-8?B?enIxSWFjb1hkUkxFK2Z5bGltbVB3OXpvSkJubTZsTkc2b2gvWUlzSUR5cEsz?=
 =?utf-8?B?M2EzTzhkR3NVSjdaNnRYZmFtYzBreEdoRWdPL2YwVXNLT2hEL2pDSVNqbk1l?=
 =?utf-8?B?bWUraWRFbTd4UE5QTzI3V1ZlT2xnVWlLYWc2R2RqMnlpZDR2a3pZWXZ0Uzly?=
 =?utf-8?B?Wk4yQVdUS2tnczJWR0NyMzlKVzFuMWowL21oV3VUUFhVRmsxUzZhbkVDS1li?=
 =?utf-8?B?NDBFUjI0RDZyM0xlM0pIOXZTSE5tZ2NDKzVmN0hUVFMrOHNvODZEd2N5NHFB?=
 =?utf-8?B?bjBhTFk0ZDNNbjc3Z2RDL0w2U2FTL3YwckczVkxkaFNNc3JaY2VaWkFIeTg4?=
 =?utf-8?B?c3BFK0hNQVYycmYvSUlVQWo4OVRzYk8xUGV0Ty9HKy9TOEZGRERjZWpjdFFi?=
 =?utf-8?B?VFJVR0dlMDY5WmxXcElMbVQrd1NienMvSitJMGpxVHNMZVAyeERrRTRLQ2or?=
 =?utf-8?B?RTJ6eU5Lc2g2Q2tBazBoTEJ1bFBiS2lpNStPTk1MWWp4UUg2b0g3cVpnKzJY?=
 =?utf-8?B?M0hWNVI5b3d4ZHRtNUNud2FGS2RpdERGVmx0dlY0Qjg2dFUxVEdJaER1UXdr?=
 =?utf-8?B?QWdzMFB0dHZtdkZDNk9MNWQwc1dsS1ZUNE9UL0JXam1nSi9QMFpiSjNNREhv?=
 =?utf-8?B?QmZmdzg4WVluS3VqMjJoYlAvTlJLUHVySkh5Vk1FMVdKOXdQVlBBZWQwL1k3?=
 =?utf-8?B?d0g0ek4zR293cmdqcnJGNXNCVnN4cmJKaTF3VkRQMmZzWU50WXYvTU9IWE9X?=
 =?utf-8?B?b2VSTjF4SVcrbk5jMW9wMVFzUlNNeFpPb2RyZmZKczEzU2hEUjM1dHRDSnpQ?=
 =?utf-8?B?NXphbFo2eEg2Mkh5Y01mb1UwVjhpcVJxM3ZWTldEVXA4dWNnMGxKNytXam1W?=
 =?utf-8?B?ZWEycjNIVnFkVDJmMHA4UEpXaXRka01rUk5aWmh1b2tjTU5rVW1UdVpzTjFM?=
 =?utf-8?B?V2VuTnhNWHNKNUtYeGV6MGxROGxHQ2krUEMrT2FpeStNeWp2dUdkYmlBNm4z?=
 =?utf-8?B?M2hwY2x1aGF4OW5jZFNxWWxZZytzYU5NSFIwTlVBbHJ1OS9ZWVRSUVRHdENQ?=
 =?utf-8?Q?ImiV4kJTa7T8q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXljOERPeFdxYXA4Y21LQmpBVHpZOWRnQmR0cmdIaDZZQ1A5VjMvckNJbmxl?=
 =?utf-8?B?dzYxYU1XRXJUZVJwTUk4K2xwY2tyRDlYRU5od2Q3Z1E2c1I2L0ZHMHNtTE54?=
 =?utf-8?B?U2gvT3dBSFlCKzByWU1Sa01pbFBjcXRsblgzSGNzL3poa2RZMWJraWZQTkR5?=
 =?utf-8?B?V29wRHBmMk5TUExTeXJRWmpzakp2ZUliY3luOHcwaTVuT0ZGNU5tZXhqcUVu?=
 =?utf-8?B?OSs5c0kwSlNndzhDUm12cmhLZGViWUljSUhNc2txajhXZ2gwbWZsT2VCRVJu?=
 =?utf-8?B?TXJDTlBTaHZXbUtHZE9FZ2IyV0drdXA4R0RTemFCOGFocUhnREhtUStJVHgw?=
 =?utf-8?B?ckpZMS9HeFpMcks3c0RFY2ZaTmluQmZpd3QxK0J1OUxiQ0MxQjRXbG5zb3U5?=
 =?utf-8?B?cWd5alV0bEh1UXF6b2VWanNNZER1YzFmdGpzTU9SR0gvU1JtSE5OVjZxbzh2?=
 =?utf-8?B?OEJub3V1RGkyT1Y5eW5jTTNhaU9raUhGaHlwSGg5VkVxcnoyUFBBaW5PK25u?=
 =?utf-8?B?VnJLOWdFZXAydlNhV3VzdkhqaytEajhOdjBPUTdWTVpSaGxEL1VJRDFzWUgw?=
 =?utf-8?B?UzhIUVFpcE5yS2wvcDRGWjRLd2VGeXNEZjduSzNYYURJL0poc2Rvdit1MGUw?=
 =?utf-8?B?ZkR6SSttS2tGTGtaMmxVZCtPbldVbWxLZEoxaklEaWhNbTZsa0Z4SGo0YjlG?=
 =?utf-8?B?QVhIMk94V1hkcU5XeFpRYnh0b3ZJSUVGd2pTejFoMDlXY3I2WWE2bS9OSm40?=
 =?utf-8?B?Ry8xb1Ntb1E3QVBPMk5mNG8xNmNnQUVPcHpKZDgyK1V6M2dWZ2JINFNqa3NJ?=
 =?utf-8?B?dEhGZ0tySUFRWDE2V3lycHorZXhxd1JJdWFpaE5QZUNWR0RhenZGUTcvc2xx?=
 =?utf-8?B?MHVzbjRXVXpCYVp2a3VBejYxVlVPcG9nTXJkdXR5RTBsZVY1eUR2UUVOVnFy?=
 =?utf-8?B?N2dYeUt3cEVsWjcyMUxxaW5pU2puYWdKUldjeVFMTTFKMVBHbi90YU1XR3Vh?=
 =?utf-8?B?KzZwb1ZjQm9yWGxDdGQzSW4zR1FhNjFXU3Faam4wbU8yajZ6OEhJZ1VUUGtD?=
 =?utf-8?B?a2hhcmRQY0RNS0lkOVdWVzdjdCtnR1pzYkU0aVRqU0FmOVpxeGRvN0hWRUVw?=
 =?utf-8?B?b3U1TUR2Q29CMGhaNklOT3NwcC81TW1rSHAweFpjU0JCR2x3WDRUMklXMTFm?=
 =?utf-8?B?S0MvRjYwKzlKSUo0ZzdLY3IwcFcrakFUNUd5SzFITHJVZ0VrZFpUTGN2Q2Ev?=
 =?utf-8?B?bm5kdUFtd3U0S0xtU0dMQ3VIUHVrT1FGWlVIUVRuRUh4R3ZZNUNYeWtGSVlt?=
 =?utf-8?B?OGFZZFlTQk4wd3FIK0R1WTJQRFBndWZ2SmZOdjQxTWhOK2xNOHAzbDFhNHll?=
 =?utf-8?B?cHFqMll6V3NCN2NsemxXRWM4UjR3dWozTFlXaTZIZm16eURRVytUOWFLV2N0?=
 =?utf-8?B?blJJUzd3amVITWFUcUhTM1E2bXVteGhnWmlIYnJKckxHSlpWNFFHM0tLTmlp?=
 =?utf-8?B?d3pWbjlHMEV1TEZ6Mlo3WHRibGFWRWhCM1NwNkQvZitCaUlZajA1QzZUc0JQ?=
 =?utf-8?B?RDRDZGF2cW10SmFOdDl5ZTBlQ0JKYVRHak1ycFM3cHlVbnEwRFEweUE0ZGMw?=
 =?utf-8?B?ekJCS1ptYVNYSGFISXoyRzB6a25Ba0VadHJRN2RFcEttYml5MG0vMG5zM1Rj?=
 =?utf-8?B?T0RyNEcxQURHbDEwYUxaeGlGNmNKUEduV1hwa2FCMzJHdWk3NjY5YXN6ampQ?=
 =?utf-8?B?dHo3NTcrUDM4SURsTU1mcjlpM3VoMGprWHVDSGhVQWhiT2piOWV1YTRQYWtG?=
 =?utf-8?B?NExXNEs3QjhxUVBVazBhNWw1RVpqRHB2djVPKzc4MkJZaVpCK0h2RmgxT2Rx?=
 =?utf-8?B?ZTRCSzFvYjhRQW5zVG4wRlVSRDFIQnFJcDdteWpOSzFSQVIybitPdkNObG5G?=
 =?utf-8?B?WC90VHhIRVNlQUx0enFQNjEzRjV0RDkyUkJheWNoczBaYVZMUnNmOHgzUFZU?=
 =?utf-8?B?OE1xUXpxTVFJUEZxZExUbGJzS1YyTmlWbjJQUndBOW1QYnN4T0ZmcVJ4TmVT?=
 =?utf-8?B?dXZFWjNPNHRTYU1NZnAxeEFjMjZJd0kwTW5PdmxkZ0gyQXg1NCs0VkhWeTlH?=
 =?utf-8?B?RXlIS1ZkckptWk9QQnNsTG1FMysvT0lINjlRcEpXczVmanJYUjJ3MEdmZ2lL?=
 =?utf-8?Q?AaINW864vMWwjGHbkMfz758=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c3a404-a9e6-456a-3fa1-08dd1e23b65c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 22:48:09.0121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98yZnie3ywc6yOa6iVw/N9YHgKA+dZgyohCOe8JRMBiTOWttl/wFByOdQ6wS0zfbBY2eiKWPm/oGDBh6CIYs436vOflUxcSVa/moe+PhnGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
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

On Fri, Dec 13, 2024 at 05:08:18PM -0800, Dixit, Ashutosh wrote:
>On Fri, 13 Dec 2024 16:54:41 -0800, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Thu, Dec 12, 2024 at 02:49:03PM -0800, Ashutosh Dixit wrote:
>> > Expose an "unblock after N reports" OA property, to allow userspace threads
>> > to be woken up less frequently.
>> >
>> > Co-developed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_oa.c       | 30 ++++++++++++++++++++++++++----
>> > drivers/gpu/drm/xe/xe_oa_types.h |  3 +++
>> > drivers/gpu/drm/xe/xe_query.c    |  2 +-
>> > include/uapi/drm/xe_drm.h        |  7 +++++++
>> > 4 files changed, 37 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> > index ec88b18e9baa2..56bf375a9d4bc 100644
>> > --- a/drivers/gpu/drm/xe/xe_oa.c
>> > +++ b/drivers/gpu/drm/xe/xe_oa.c
>> > @@ -97,6 +97,7 @@ struct xe_oa_open_param {
>> >	int num_syncs;
>> >	struct xe_sync_entry *syncs;
>> >	size_t oa_buffer_size;
>> > +	int wait_num_reports;
>> > };
>> >
>> > struct xe_oa_config_bo {
>> > @@ -241,11 +242,10 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>> > static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>> > {
>> >	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>> > +	u32 tail, hw_tail, partial_report_size, available;
>> >	int report_size = stream->oa_buffer.format->size;
>> > -	u32 tail, hw_tail;
>> >	unsigned long flags;
>> >	bool pollin;
>> > -	u32 partial_report_size;
>> >
>> >	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>> >
>> > @@ -289,8 +289,8 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>> >
>> >	stream->oa_buffer.tail = tail;
>> >
>> > -	pollin = xe_oa_circ_diff(stream, stream->oa_buffer.tail,
>> > -				 stream->oa_buffer.head) >= report_size;
>> > +	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
>> > +	pollin = available >= stream->wait_num_reports * report_size;
>> >
>> >	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>> >
>> > @@ -1285,6 +1285,17 @@ static int xe_oa_set_prop_oa_buffer_size(struct xe_oa *oa, u64 value,
>> >	return 0;
>> > }
>> >
>> > +static int xe_oa_set_prop_wait_num_reports(struct xe_oa *oa, u64 value,
>> > +					   struct xe_oa_open_param *param)
>> > +{
>> > +	if (!value) {
>> > +		drm_dbg(&oa->xe->drm, "wait_num_reports %llu\n", value);
>> > +		return -EINVAL;
>> > +	}
>> > +	param->wait_num_reports = value;
>> > +	return 0;
>> > +}
>> > +
>> > static int xe_oa_set_prop_ret_inval(struct xe_oa *oa, u64 value,
>> >				    struct xe_oa_open_param *param)
>> > {
>> > @@ -1306,6 +1317,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs_open[] = {
>> >	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
>> >	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
>> >	[DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE] = xe_oa_set_prop_oa_buffer_size,
>> > +	[DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS] = xe_oa_set_prop_wait_num_reports,
>> > };
>> >
>> > static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] = {
>> > @@ -1321,6 +1333,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] = {
>> >	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
>> >	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
>> >	[DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE] = xe_oa_set_prop_ret_inval,
>> > +	[DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS] = xe_oa_set_prop_ret_inval,
>> > };
>> >
>> > static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user_extn_from from,
>> > @@ -1797,6 +1810,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>> >	stream->periodic = param->period_exponent > 0;
>> >	stream->period_exponent = param->period_exponent;
>> >	stream->no_preempt = param->no_preempt;
>> > +	stream->wait_num_reports = param->wait_num_reports;
>> >
>> >	stream->xef = xe_file_get(param->xef);
>> >	stream->num_syncs = param->num_syncs;
>> > @@ -2156,6 +2170,14 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>> >	if (!param.oa_buffer_size)
>> >		param.oa_buffer_size = DEFAULT_XE_OA_BUFFER_SIZE;
>> >
>> > +	if (!param.wait_num_reports)
>> > +		param.wait_num_reports = 1;
>> > +	if (param.wait_num_reports > param.oa_buffer_size / f->size) {
>> > +		drm_dbg(&oa->xe->drm, "wait_num_reports %d\n", param.wait_num_reports);
>> > +		ret = -EINVAL;
>> > +		goto err_exec_q;
>> > +	}
>>
>> If possible, I think this check where wait_num_reports has an upper limit
>> should be moved to xe_oa_set_prop_wait_num_reports().
>
>It's not possible since the properties can come in any order, so both the
>OA buffer size as well as the format might not be available when
>wait_num_reports property is parsed. So they could both still be 0 when
>xe_oa_set_prop_wait_num_reports() is called.
>
>That is why the code which checks for consistency between multiple
>properties comes after the code which parses individual properties.

Oh, makes sense. Then this is:

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

as is.

Thanks,
Umesh
