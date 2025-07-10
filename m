Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3761C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 21:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862F910E0E6;
	Thu, 10 Jul 2025 21:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ie858SwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3462710E0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752181801; x=1783717801;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ISIv5DmCo45wBKEQMabB+IB+u4FGFJdRe/8sq9FW5WQ=;
 b=ie858SwMLlkts3lwsyf0i4LXNiiZ4aQw2ZHPdaflG5NVXeCWp9AmyAYf
 gF13DEYwwji5NuWCxi0fGY83Oyxe1ZlOaQjjO8r2Nao5/9hMaaiK1CN5s
 8G9GPBxltlrBlwi1mrNfyYcib7gacXe6c7i2/Yd2USy+6+NmkhuwzY2pK
 rywqqfkyPvV/oxKT0vHy/VF5rJfXknF3fOJW3viUXgnukprRZsvbiJe4Q
 RYKLY6oYL2yYfPtJJDsFbtvK90ySC62TMw5/gzVMdXB5lxHl76dRFNaVr
 sxsJso8R4MKkVgBrZm+WtMJ+L3/2TkM/Jin5hFGWJOAEp8SwDtsYQRhg1 g==;
X-CSE-ConnectionGUID: hzGUvFz2R+OTLjCBgKazog==
X-CSE-MsgGUID: OZVScwWnSo6qaCXWsZA3Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65536272"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="65536272"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:10:01 -0700
X-CSE-ConnectionGUID: V5/EkxE8RfSnIclEYr2tTw==
X-CSE-MsgGUID: 8HLMMjzcQVuuICefJWNAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="155615558"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:09:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:09:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 14:09:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1PXLEbHknK9j7TAnuL35j3yZQ15wWg4GQ4Uz4Y5mWbrxnzNrBNkiPOSQMmGS0BcqOLtjMlsB+rj4bQAyTdKmjasuH7lGj27ipmeJF5xmPaDKLsUaUoZscel9dRV+e1P18b4G7MhQAdSM0ItkYu/opo+aEZLjWCqmmOaYDaxWlPWcvGawBcBFm/Z/Q4fwP85yn0e0ku99UOKWFd19tnTGcoPLF1noFuBO2cwd6/lmJ8uPLTh6X4u+Hm+PT5VL5w11YBaqrQ3pNYNGoeNH+4i4DS/l41WKcg2WaUgrmNRiqHe6Jlhbu9d5EY1wYa9lHS86yrYc7X/R9Ves+JpcWNLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/Az03Xp81T3vLqrEFK3vEoaTM86QVEyFzxpC55Yp0Y=;
 b=SUMaKoe/niz3TQBAe+nsn58KLpIeNwka5BqNhaLqXFRGxuuHm6K90VH2/O0mun2sQ0TpokJVaptTKA0PbcrA2ZXdudfoC3QZLUgJMOhJUWM4YPuVgYXQZznARlyn7szmCR39bnZXHDZRHSB+7okO89W4Bpgretps7Z0Vf4/IQYCfY+MZsxZllf5lexyNM5gdYd/5r18xT2ZODIdBRQZuGYJJJayGZX04sMAglVzchGt71jqt6Oi+WoQ0e60fv8O1hQH0+W8kwkFH6DIDT8v8B9XnvVADGe1YoI27X0W1NpSY20XG+DAI/qm+ANhB6j9Yz/3j/Jx7CWtcpFSUfWM5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Thu, 10 Jul
 2025 21:09:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 21:09:48 +0000
Date: Thu, 10 Jul 2025 14:09:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 7/9] drm/xe: Add support to handle hardware errors
Message-ID: <aHAsEY6SY6O3DnMM@unerlige-desk.amr.corp.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-8-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709112024.1053710-8-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0363.namprd04.prod.outlook.com
 (2603:10b6:303:81::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e61c78-f6e6-417a-4a9b-08ddbff61a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFpKYTg0UkhRZnBiUUdsZFZRdXR4emdPNzdDWnNoaGdSRFJ3L1pJa1VWcDRU?=
 =?utf-8?B?c0ZRQzgvSWUzTjdpZkRCTXlLZ0hsYVVvaHFBRmYyaHEvTTJUaWIzSjBTWFEz?=
 =?utf-8?B?ZUpuallSdWJJaFdUYXh3MHpZOFBwbjVtQjExZm9SUTg2TUplbHlBa3NqNU51?=
 =?utf-8?B?ZTRESStrT2p3U2tQVmhaZDU3eHZCV3dyblF5d25PMlJYSStsWFRKVmtmZ2I2?=
 =?utf-8?B?YjlYWkJWbEtBbEM1YWEwNEg0S0dBeWdPciszbmh5c1MxbEpWN0QrR1doVzc2?=
 =?utf-8?B?Vy8zREU1R05YNk9NVzRwWVBoK1gvT3lEc0NPWE91Q09vS1o4S2h6Qkl1MUZu?=
 =?utf-8?B?Nms4MXIzS08rRWFNWkdSbGtLdWNFY3E1Vk5scjNFdHJjMnBQTnZMUFBPQkU3?=
 =?utf-8?B?YncxOGt6WFZxb1E4SEE0eGlBR2drMDNhRjl3d0paQlZ6OTlOV3pSejNlR0Rw?=
 =?utf-8?B?VG1TdjVKNitBUDJxbzdsdThsNjRlSStwNllSTHNybTRkNUxGUU9ZaUt0SDl0?=
 =?utf-8?B?RkFxZWhWNmI2bDF0dDBEbjFNTHZ6dEpYV1ZobUk1RGRQVlBIUlBnUS9pZVZl?=
 =?utf-8?B?bjBTSXJKYXFERFllZm9BSm1ZMXQ2a1NKSlY1WlZBZGxXYnJFa05Ja09heWtR?=
 =?utf-8?B?Mmx2N3Z4LzlrQVJTdHcyMkFWZnBZUlppdVJTaEw0OWxBbHMzS3I4YTk1bjdl?=
 =?utf-8?B?Y1g3N1dLNFB1Zjk3WWQwUjlUMHlETTg1WExzR2wrK1Y2eFJHOEsycGpTL0pP?=
 =?utf-8?B?RkF6VzNYUzRySEpyNVJ4VEFUZkcwU1I3OS9BZVhaeW1OZGwwOVJRcFlaOGJZ?=
 =?utf-8?B?RTZncHhLcHk3VUlDTHdUTXRUYXdESEtnZ0tnOW1qUzBQU2JhWTBRamI4VkU2?=
 =?utf-8?B?L04rRFFzN0QwMVlRWVlxcVZEa1NEMFZ0RmlrTzNMS1NzWWhTWVVsZ05NdHdN?=
 =?utf-8?B?SU51UmliMElZbUYyRjNCUnhLVzNQNEFrbG15SzdLejVHYy9YdXNJTERoZUts?=
 =?utf-8?B?aEpOZmU3ZHFJNm1KdEUreFVOOWJTSm1qV3BqNFJLVFBjNUZNMk0wRXJjK2dE?=
 =?utf-8?B?eFN0ZFZIcUdYTVJ4M2l4Q3VmQjRkNFZCMEh2YjVLOFJrOXBmNlFFcnNET09x?=
 =?utf-8?B?K09POHFZdXNLRldMaTY0SFJBd0IzalRNOHoxSGQ5V0YwT09RajgrMWljZk5n?=
 =?utf-8?B?YzNEemc2c21IODMxQmRuREJ0NHdoM3Z3QVlzbFVxdmQrVjVyUEtvbW00YUZv?=
 =?utf-8?B?NDkwUXQ1UG1CcGlJT1RzQTFNdXRQbjIrRktEcmc3UlY2eDZ0bEQ4MXMvdUlX?=
 =?utf-8?B?YXJINXNRRVBBZlByVjJKbzRWR014OVF0Mi91S2ZzOHZ6U0l5SFlFM29KU1hz?=
 =?utf-8?B?MzNJOWJmZ1ZONjVSSWxzb1VVR3pmK1hhRkZaZWhIMTVxeWdHbktYNnZhVE1B?=
 =?utf-8?B?N2ZMNEdEU2IyNUVpVi8vTFE1ZEtYa1JVTGVGWDUzRk93ZWs0YXRsQjZoYXM5?=
 =?utf-8?B?RzdnMnNabnVIZFV6VlN2eTh1bUo0cFJyN1BDcFlQN1crMld0RnAxaUFRUjBH?=
 =?utf-8?B?TWtPYXUwRko5cUp0OUpuMGV5d0dlVGxid05qZGpBR2FOMVo5ME42WFZKKy9k?=
 =?utf-8?B?OHdwclZ4VjFocFFMb1hMQi9IK3ZsKytveEgyY3pVdDltZ1JVaWdGYllIZHNZ?=
 =?utf-8?B?ZFhIOG5HWW4vR2J3a1F1TDlkZ0c5NXN4RitKNzgyL2RlbDA1RFBVS1pkcUJv?=
 =?utf-8?B?OTZOL2FOSUhUdHFheURqSUZmOGhnR1R1QVVvQTVQbW10SUZyNjRIenZvb2Fi?=
 =?utf-8?B?aXhUZFlPV1A0OUFKWW5Jd2V2aEV5ZFF0TExiMnRxNUtxdm16dW1MNXpGZ2cz?=
 =?utf-8?B?emV3ZUdOeGNmTm5BaWdraDZjSUs3OWhhb2FPeXQ2VnhiSit1NEpNdEdRZkxZ?=
 =?utf-8?Q?aUUouHrcYco=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnZyQkhaYVZvQy9WZXV0cjFYVWZpWEhpckFmYVVCZ3VYamVPUDY5M0F0eTRx?=
 =?utf-8?B?NWNjZG9WQVR1T0kveHhYZ1BLZUxRUU1vU09qYlJLeFFWZUVpZDZMMDJpektm?=
 =?utf-8?B?ckdvaXU1cGJ5VkNwYkhvNTZ0WGZOa2tBbG9ScUlmOFM2NWxuQkpWRlVGWFhU?=
 =?utf-8?B?M29XQ29LWGtVeVo4dWxJVmd4L2drcnJKMlN1SDVjV0RYNUV6Q0hrUUdvWVBj?=
 =?utf-8?B?UFdrdFl5TlBDYTdsQ1dxc01DaVVzM0dTVVNYOGxkc2pIOUFaeG5DUi9JZThU?=
 =?utf-8?B?T2xaRmplOVZPT3QwVmt0MG5HVkFiK3g1NlhneVhDR2ZrbGZMUnZQbXE0Wkxv?=
 =?utf-8?B?VHlXS1I2bWhjOUhPbFU2Q0NsV01BeEFWaDFCVnhoYnluVk40T2crQWlDSVdE?=
 =?utf-8?B?dDJnd2ZJSlFETDBpeUJMQkZwNjE4SEY0UmRieFE0bFhNQkprRlJpRnBBb0lt?=
 =?utf-8?B?WTVhYUU0NDBFYUlZQ0JHNVJ3QUtkdWJDSVdpWkY0dmVIT1Z4TGxIa3JLTW9S?=
 =?utf-8?B?MUhhbGhDa2V3Q1l6ZXB6RG9QT3hPL1BITXBzelg2YThrcmhGZUhqUFErV25F?=
 =?utf-8?B?b1RLUXBPMjZCcDNFSlg2allwN3dlWHRnVElFRXh3M1ZsY1oxeHRCdDZmcUtI?=
 =?utf-8?B?dVRwZnZBVEdVbWtGNy8xQjhnVlRwaFRTdHBUSXhZMlJGaWhQcldHK2V1QUhN?=
 =?utf-8?B?TVBkdmkyOVFHblNxU1dHWnZUOXc4VWFBNkFtV3JodXlzUWVsN3JSUWVjbk5W?=
 =?utf-8?B?dUw3UVNVdTc0RStkN0RUOGVQZTVJcG5tcy9BTC91OUNJbU9sRndXcEZyQWtX?=
 =?utf-8?B?bTN4S1RQWXlwWDlRb1MxR1F0b2U2Q1R5T2d0NmIvc2wyUXhiUlRlRk5xRTE5?=
 =?utf-8?B?M2FZSlExVmZJczVSVWhRRFhEMWlDenF2U290RzhNV1VvZjQwUy8wNW1WMEUy?=
 =?utf-8?B?RURlT2NXbSs0S1VENE1IeWxDdzIzSjYxbndvSVplNVdITDg1dlRKN1dLYnZn?=
 =?utf-8?B?SVNKbW9ReXF6cUNXNzlTYUlmYTZzYXNud21GVjIrVGl5aTVQK2dwdEpQc1Zx?=
 =?utf-8?B?aEV3YUZaUUZPWU9sdG1FUm5Pd3c3QnRwdGVSemVydXJHV0lIMG5tQW5jRlVP?=
 =?utf-8?B?VW11WEhrV1ZjWkJBNmhDRWdndkhDNHJNMXNET29CaDBxQ29JNmdrMlBwc1hh?=
 =?utf-8?B?QTBEckpQS0VQVTQwWTF2d1oyQVdPM2dYSi9XdS9OdklCYm4yNFR0cDZqZjdi?=
 =?utf-8?B?RVJlTkNkV3VHMmN1TXRtejA2TGs3VElRRU0wd0hIT2YzUlJKZHNWQjhMNUZm?=
 =?utf-8?B?UjUzU0NYV0ZCbUpya1R0K2N2clViZ3pvUTRYSG4wTUF4Zk9PMGx0azNCOUpp?=
 =?utf-8?B?RnFjbi9JSVpna1hyd1lsQTRaSVFQTERGNUovLy9kM0dWcXAxbDA3cnlxcUQ5?=
 =?utf-8?B?Tjk5VTVhMGlYd0JuVktSU0FlRFlnMkdsMHdGME1UQUh4OW5lVTFrUDQvVWJ2?=
 =?utf-8?B?OS8rMnU2UWFPbW5iSVBEN3lBODJ3OGZ2UEo2VnNxb3ZtbjVOZC94QWttaC9H?=
 =?utf-8?B?cWdiazQzbXF4T2ZHUUJkcWNZTGJsWDVCQmRmQVU3d1FrTlBwcUNqUEY0N2hC?=
 =?utf-8?B?Z0Nlak1ldUdKSVhtRjlzY2Zqb2ZYcEVTQTAramVwUk9DMURSSm5YUGpvdmgv?=
 =?utf-8?B?QWNiUW00VHhqSVlsNlBzUi83LzB6TGxIQnJJODJvODkrYVpGb04ra2E1WThF?=
 =?utf-8?B?enVVZUdWOFZubkJGZlNFelhiei9Gb2x5VlQ5T1ZjZjlpNGJwK2crYVZkZmwr?=
 =?utf-8?B?MGhJM1JXb2thWjdUeWYyU0Z6MWRBQ09xSjVmRkhiL0Z0ajh0QXhRazN3MTEw?=
 =?utf-8?B?ejJRcVdOYk9Ha0Vyc2IybkJRcCtSZHg3ZzVmRnhjSWtJVE1kdkIwZ3ZSQ3g0?=
 =?utf-8?B?RFJyRVRvL3c3eGh5NTFpSytQVE9UNE9YRk5hOW8vTC9aci93VjR6NlkrYnMy?=
 =?utf-8?B?cmxJeUlRVkJTcngwamdUdFlqTXZNMjNQcWxUV1FoaHp6WStBdlZPN1pDckJo?=
 =?utf-8?B?cmRqNldSS2UzM0hDNy95ZnRUbHhYZ3JNaEtPNmF4U0JMWnVyM0NkdUc4azZY?=
 =?utf-8?B?U01ZVlRjc25uUTl0Qm56MUx1UnJpYXFEbDRtUk5iTU5nRVhlZUJPa09oQUdO?=
 =?utf-8?Q?GgFrnz8VLvoNj47dTgoQqJ4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e61c78-f6e6-417a-4a9b-08ddbff61a27
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 21:09:47.9641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z84Kp9jnwc8flqd65o/QYOACH2fKkDFWTl3rljVWhfkgHMFLQGFnflm/BbDXiyxWMkw7DDs9L+NxY14sB3LUwjUEbODPlG3B12tSB6HaI5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
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

Resending since it got lost earlier...

On Wed, Jul 09, 2025 at 04:50:19PM +0530, Riana Tauro wrote:
>Gfx device reports two classes of errors: uncorrectable and
>correctable. Depending on the severity uncorrectable errors are
>further classified as non fatal and fatal
>
>Correctable and non-fatal errors are reported as MSI's and bits in
>the Master Interrupt Register indicate the class of the error.
>The source of the error is then read from the Device Error Source
>Register.

nit: Since Fatal is a separate category, maybe a split here into a 
separate paragraph and some formatting would be good.

>Fatal errors are reported as PCIe errors
>When a PCIe error is asserted, the OS will perform a device warm reset
>which causes the driver to reload. The error registers are sticky
>and the values are maintained through a warm reset
>
>Add basic support to handle these errors
>
>Bspec: 50875, 53073, 53074, 53075, 53076
>
>Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                |   1 +
> drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  15 +++
> drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
> drivers/gpu/drm/xe/xe_hw_error.c           | 108 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_hw_error.h           |  15 +++
> drivers/gpu/drm/xe/xe_irq.c                |   4 +
> 6 files changed, 144 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
> create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 1d97e5b63f4e..fea8ee3b0785 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -73,6 +73,7 @@ xe-y += xe_bb.o \
> 	xe_hw_engine.o \
> 	xe_hw_engine_class_sysfs.o \
> 	xe_hw_engine_group.o \
>+	xe_hw_error.o \
> 	xe_hw_fence.o \
> 	xe_irq.o \
> 	xe_lrc.o \
>diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>new file mode 100644
>index 000000000000..ed9b81fb28a0
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>@@ -0,0 +1,15 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_HW_ERROR_REGS_H_
>+#define _XE_HW_ERROR_REGS_H_
>+
>+#define DEV_ERR_STAT_NONFATAL			0x100178
>+#define DEV_ERR_STAT_CORRECTABLE		0x10017c
>+#define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
>+								  DEV_ERR_STAT_CORRECTABLE, \
>+								  DEV_ERR_STAT_NONFATAL))

For x = 1 and x = 2, I don't see the above result in correct values. Can 
you please double check?

What about DEV_ERR_STAT_FATAL?

Rest looks good,

Umesh

>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>index f0ecfcac4003..2758b64cec9e 100644
>--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>@@ -18,6 +18,7 @@
> #define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
> #define   MASTER_IRQ				REG_BIT(31)
> #define   GU_MISC_IRQ				REG_BIT(29)
>+#define   ERROR_IRQ(x)				REG_BIT(26 + (x))
> #define   DISPLAY_IRQ				REG_BIT(16)
> #define   GT_DW_IRQ(x)				REG_BIT(x)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>new file mode 100644
>index 000000000000..0f2590839900
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_hw_error.c
>@@ -0,0 +1,108 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include "regs/xe_hw_error_regs.h"
>+#include "regs/xe_irq_regs.h"
>+
>+#include "xe_device.h"
>+#include "xe_hw_error.h"
>+#include "xe_mmio.h"
>+
>+/* Error categories reported by hardware */
>+enum hardware_error {
>+	HARDWARE_ERROR_CORRECTABLE = 0,
>+	HARDWARE_ERROR_NONFATAL = 1,
>+	HARDWARE_ERROR_FATAL = 2,
>+	HARDWARE_ERROR_MAX,
>+};
>+
>+static const char *hw_error_to_str(const enum hardware_error hw_err)
>+{
>+	switch (hw_err) {
>+	case HARDWARE_ERROR_CORRECTABLE:
>+		return "CORRECTABLE";
>+	case HARDWARE_ERROR_NONFATAL:
>+		return "NONFATAL";
>+	case HARDWARE_ERROR_FATAL:
>+		return "FATAL";
>+	default:
>+		return "UNKNOWN";
>+	}
>+}
>+
>+static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>+{
>+	const char *hw_err_str = hw_error_to_str(hw_err);
>+	struct xe_device *xe = tile_to_xe(tile);
>+	unsigned long flags;
>+	u32 err_src;
>+
>+	if (xe->info.platform != XE_BATTLEMAGE)
>+		return;
>+
>+	spin_lock_irqsave(&xe->irq.lock, flags);
>+	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
>+	if (!err_src) {
>+		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported DEV_ERR_STAT_%s blank!\n",
>+				    tile->id, hw_err_str);
>+		goto unlock;
>+	}
>+
>+	/* TODO: Process errrors per source */
>+
>+	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>+
>+unlock:
>+	spin_unlock_irqrestore(&xe->irq.lock, flags);
>+}
>+
>+/**
>+ * xe_hw_error_irq_handler - irq handling for hw errors
>+ * @tile: tile instance
>+ * @master_ctl: value read from master interrupt register
>+ *
>+ * Xe platforms add three error bits to the master interrupt register to support error handling.
>+ * These three bits are used to convey the class of error FATAL, NONFATAL, or CORRECTABLE.
>+ * To process the interrupt, determine the source of error by reading the Device Error Source
>+ * Register that corresponds to the class of error being serviced.
>+ */
>+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>+{
>+	enum hardware_error hw_err;
>+
>+	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>+		if (master_ctl & ERROR_IRQ(hw_err))
>+			hw_error_source_handler(tile, hw_err);
>+}
>+
>+/*
>+ * Process hardware errors during boot
>+ */
>+static void process_hw_errors(struct xe_device *xe)
>+{
>+	struct xe_tile *tile;
>+	u32 master_ctl;
>+	u8 id;
>+
>+	for_each_tile(tile, xe, id) {
>+		master_ctl = xe_mmio_read32(&tile->mmio, GFX_MSTR_IRQ);
>+		xe_hw_error_irq_handler(tile, master_ctl);
>+		xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ, master_ctl);
>+	}
>+}
>+
>+/**
>+ * xe_hw_error_init - Initialize hw errors
>+ * @xe: xe device instance
>+ *
>+ * Initialize and process hw errors
>+ */
>+void xe_hw_error_init(struct xe_device *xe)
>+{
>+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>+		return;
>+
>+	process_hw_errors(xe);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>new file mode 100644
>index 000000000000..d86e28c5180c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_hw_error.h
>@@ -0,0 +1,15 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+#ifndef XE_HW_ERROR_H_
>+#define XE_HW_ERROR_H_
>+
>+#include <linux/types.h>
>+
>+struct xe_tile;
>+struct xe_device;
>+
>+void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>+void xe_hw_error_init(struct xe_device *xe);
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 5362d3174b06..24ccf3bec52c 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -18,6 +18,7 @@
> #include "xe_gt.h"
> #include "xe_guc.h"
> #include "xe_hw_engine.h"
>+#include "xe_hw_error.h"
> #include "xe_memirq.h"
> #include "xe_mmio.h"
> #include "xe_pxp.h"
>@@ -466,6 +467,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>
> 		gt_irq_handler(tile, master_ctl, intr_dw, identity);
>+		xe_hw_error_irq_handler(tile, master_ctl);
>
> 		/*
> 		 * Display interrupts (including display backlight operations
>@@ -753,6 +755,8 @@ int xe_irq_install(struct xe_device *xe)
> 	int nvec = 1;
> 	int err;
>
>+	xe_hw_error_init(xe);
>+
> 	xe_irq_reset(xe);
>
> 	if (xe_device_has_msix(xe)) {
>-- 
>2.47.1
>
