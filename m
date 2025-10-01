Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DE1CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 13:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23C810E0F5;
	Wed,  1 Oct 2025 13:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHE2PfZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAAA10E0F5
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759327025; x=1790863025;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pl4/BW80mXIdSHJvA3tkSBcyN5Bm8DpM5/Xk40uL7Q8=;
 b=JHE2PfZ3+joESemL81o4Tlv6I2x9fbjIGQ10dK9QgTUekR+cfFGanTaM
 OxoF+VI9UwUZyOY6AlYAbozq2bKDVuz+NT3B4Sb+nbPy/ruMgkqNbq07j
 +vaMSoYnNujEEe7IKwMId65zfPTSpzO4uHJk/YvDwhqthOeRH36BTkXvm
 E7kaRveK0xmnvF1wq/lDzPYGPnNpW4geEMFfFPrK2PC3z3KCpiGaI+Odb
 srDFvpm1EIU2cwPXuk+TEHdIbkrzyfrsuxikM2w495lZ2l06pA7Oz9n+t
 XSyboPn6ysKFPKfurHmiVfzz0x53UI1K3X/q3UM8GZt0BR9clkiht+w8O A==;
X-CSE-ConnectionGUID: iklOfiZGRKaaNy3lo0Cj4Q==
X-CSE-MsgGUID: jBz7kv46RsS6RCPlM1QTfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60815241"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60815241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 06:57:05 -0700
X-CSE-ConnectionGUID: OXJJrbbdTxWrQYYYDDjq7Q==
X-CSE-MsgGUID: 73xCpwrdRLWN7Z+lhnqsYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209740541"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 06:57:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 06:57:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 06:57:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 06:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGDb0yiQNDm3u+7l0RgWP86cVE5je+7bu9MhErbq/ifgmBprHs6/8nqgiFjrp5sze5iXkkKmknB/Lckx18n1Dbun+YPn3ncRG0BfQFvb/3aG2YjA3C1QqO3EFaPah4fzxQmpNZob+e4auS4S02xtVEybOo6aMcUhccHM4u1R7o0UpeRsMYsCYFUafAivo8SRfJduHhBnt/XA4bfNeJLDLgqUWXfeocH4M+EPTbCvF+oSkA5U8Bc/wg5LvBemIhWCq1qSGMPXOgA2HScQFTKK8AsF9vX11PQhY0r+zdjV9VLEHpUSIPgdgBrXAt5PAOHarsY1etwsqo1HR/seH+1EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8lrP425iDGK9+aY191vgkt8heVfQh8o4lZgyNw6psE=;
 b=WAy0w7bDdGLxI0b6xlluae0G+KF/HfKwBXG5H+D98ry2F4fwLvgDtQd9R2EthDg0pkpRcV9O4QE1tv7NlbywhhtvEVVo9i0R+L+UzntlfjFm0IQTRs8uYYz7OLlus5KUJ6IOe6c03zD0Lz/FdTRvHQ3ULe19kRQ84e41Ovi/OP7lhscuzS/FrUa4P9fokC72dcLklIxEDFNwfBDjb4H17Umijvw68nieI2TY74uKHEAyxAJrz8C2MPFhRd6vFGeQB6cErw1FItDswT0tW5GtWKSn1xmKkhR4K017ppulnIQi8P95gj6XowqLOVorKw9Pcv0l+woBLTXLFIIFqht4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH3PPFD114713BA.namprd11.prod.outlook.com (2603:10b6:518:1::d50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 1 Oct
 2025 13:57:01 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 13:57:00 +0000
Message-ID: <5eaff27c-0714-42bd-8441-a88904c987ed@intel.com>
Date: Wed, 1 Oct 2025 15:56:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/36] drm/xe/vf: Avoid indefinite blocking in preempt
 rebind worker for VFs supporting migration
From: "Lis, Tomasz" <tomasz.lis@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-21-matthew.brost@intel.com>
 <b535bacb-4f28-42ba-84e7-812ec28a07d9@intel.com>
Content-Language: en-US
In-Reply-To: <b535bacb-4f28-42ba-84e7-812ec28a07d9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0079.eurprd04.prod.outlook.com
 (2603:10a6:803:64::14) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH3PPFD114713BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da5650f-9930-4273-f6d4-08de00f264ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVhBMHprWmRmV2d5RTBKUkhPYjMwMzlnZis5QlMvcVJEZVZBc2pIVElNaFdH?=
 =?utf-8?B?MWZWYWZBWFRXazhETVo4Wm5wVTY4RzZFRVpTeGFLa2JocjRIL25NUUNVSmFt?=
 =?utf-8?B?a2t3TzJrUWpNZlB2Y09XQnBKMEduL0FtaDd0S3pxemlVV1pKTkcvRmhCc0lC?=
 =?utf-8?B?ZzhJNnlaSmp2OHBuRy9XRkk0cVVRYm55amhjdG90NlM4RUk2RXJtaFlWM2ND?=
 =?utf-8?B?UC93WURPM0RFTERYZVVYVGtUcjFXY29qV21nTmJKb041aXIyQ1hiWlRoYnlB?=
 =?utf-8?B?N2NyQVVnOG5ZK1pEdHhWUDYyMUQ4R1g3R3N4MHM4MUpmQkV5cUtlRmhDYk9B?=
 =?utf-8?B?QVRrNFVNZzZBZGpiMDJpQjJ2R3pITmpDQjNpUGZGcjR4ZjhkSkd6Zi9Nek1G?=
 =?utf-8?B?NUVoa3FDa3Z1MDA2czFnbWVYZmV0OHR1a1R4cldiSDdOczl6YjJOVDRxRDhE?=
 =?utf-8?B?cDBKSGxaRVhFVGVXcDBqL1BFRmdGQWgzZUhhbTBvZHlnZzBLc0s0MXVtbDlS?=
 =?utf-8?B?L2pmRTQ0SjlIRDBpTjkyb2lUYjZSUzlKK1VKQzBqNGZOMGZGRnVZTHNyWW9n?=
 =?utf-8?B?OFllb3gwNmcvb2NRQmxFdjJQcWN6STZscUV4RXdsS201RUpoNS9nNWI5VGpI?=
 =?utf-8?B?MHpBakowNHk1ZkpJQ3FDOG5HMnFXYVcrelNBUklxaklXcXZKb3JLVnoxRnI3?=
 =?utf-8?B?VThMRy90eGhnbm5icTcxQ2VnVFdFUFNZYmE2Y2REQ1ZhcWNGcGdZY0hoT0Qr?=
 =?utf-8?B?eVdhSFdyWStwS2JhSGF3WnZZZWVucFVLRjRCMDgrMEVhMjZWR2I2R3h3ZjE4?=
 =?utf-8?B?Um9ta09ackk4a1NPMWtpYU5EcTVKVmJoUExiRWFMS3UvbUZldjFaSytWQWhx?=
 =?utf-8?B?aktObXVwWW5UdXl3Ris2V3orc29pR0taRy9iYndzbTV1UlJ3dU5Ha0RWdUpO?=
 =?utf-8?B?djBLOEJWMWtNOGViL3VDVFFxZjBkNEE3bEtxNFkyWWlCeml6ZGdkZkZXQ2lX?=
 =?utf-8?B?dXRUZjFNSm84Z1dTQXVnT2dHNUFhcjZQTnFFUmd6N2s0SDBTQ0kxSzZUeHFD?=
 =?utf-8?B?bmY2MnVDQzVqeHVDWDZEcmlRRmlIMjRVbUhvellZNC8wYm9pVE9iYXcybkJR?=
 =?utf-8?B?dnZXZW9hS1JwUXliekVwRC8wdXlabHA0MnB0K3dZZ0JpRmhVWm1DbkJPKzJi?=
 =?utf-8?B?U0lDOUoyWFJBYlpLM0lLbElLVG80NExvMWJCbW0zZXIvOWpJODh4QXR5a0Vy?=
 =?utf-8?B?SitLSU9HQU5HSHpURVJXYlVYTHNSbUFzcjVOV25vRkQ4OUFPKzROUFoyR1pO?=
 =?utf-8?B?SDlIY2o4YWVnbTVzSXp2bWNzL2ZzSVNCYjFMV0xwM0Z0cGFIRHRETmI0Zm1j?=
 =?utf-8?B?bnhET3VVRjV5WDlFYzFYQ1NmdHF0VzV5ZWh2d3R4c1hiY1J0eVg4eGVQRG1K?=
 =?utf-8?B?aEFvSEdGa1RITkdwOEU4bVFwWmd3MnBrV2RJNHFnVmZubWRzZnFwZFd5TzNr?=
 =?utf-8?B?T3FSV3VuS0dCV3B3eFVFK3h0YXBWWVIrMUxhRWpqTldIL1VxcjZEWUVGUWU2?=
 =?utf-8?B?dzVOZ2dxQzduQ0ZPVW9vQ1V3bVpxSjZxMG1qSjFDcndib3loVG5BV1BHMnJY?=
 =?utf-8?B?dEgxUUlOYyt5cDRNZnhVUnVIQ0hUZjd3SGhGNk9QaWVxSngwbWFCMnFWWGpK?=
 =?utf-8?B?dHBlZnNWU0czVzl4Nk4xdHFSSllPYTdyZVVzSC9SOFFLVGdyVXM2Sm0vay9p?=
 =?utf-8?B?TmEzMmxrSjVLT3FHWmRrNzN0QjNGeEdIOUZyMXlTRjRVRnI0WWlYclB6WTFF?=
 =?utf-8?B?YnEzTWxhYUdoeUcvaWx6NkxKZG9mRnlKcUVGU1ZxMzJPcE85c0Z2alBlRk0y?=
 =?utf-8?B?Z0hhVjdORkVUNUpHeGUzSTlJRnk3SHBqdkU5bEJFZU5iTlJwRDJkUER2YU53?=
 =?utf-8?Q?HO6D3ODagmAO5xScJHqV/9y8NpB/259Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWIxaWR2L3grckI4OHNSc0h6L1g0N040SXhYLzhLV2pLWnNmQVUxSUUvMHdq?=
 =?utf-8?B?WXo0WVpLdW9EdXFxY2Q3NUhBMnEzTkpsWHFSU3JNSmpxMVVsaWo2aTdMNjdG?=
 =?utf-8?B?UlVtb0N5andoWktJR2FjSmhXbkVyZDZqaUc1bENVUHhBck92dHZTbUt6bUJ0?=
 =?utf-8?B?TWY5QzU4aGhkYXpXVE14ZUgxTW1ndm1yd2JBTFFDTmRBdGI3cmFqZFRoNXls?=
 =?utf-8?B?dXd2Rzg2akdpem4rWHZQQStnRFJGQVpsUHZKcUhEOUgraG9GV25pN0YwMXhs?=
 =?utf-8?B?Rmk4RjZyMUxXUnJSWlNWNHg4Q0Fvdmd5RG0xV2tEMDkrT05hSmpQQVZjYUhN?=
 =?utf-8?B?QlRmbUFlRjU3bmRJSlhFcGxVc2NHdVBrVGVOenZrSVo1WWhzOC8vMStIVzly?=
 =?utf-8?B?NzlTSmJiNG5EdVlFdlFLazRzVGUxTkppalFzSFRPOTVKZmxjQUZzbSs1MDRu?=
 =?utf-8?B?S3RZUlVLRlZEWG83NHJGbzNxUlh5eUZ2L3VMNytRaFVDVDFDeExvQVlvOGcw?=
 =?utf-8?B?aTJQeFZCVWkvR0taV25UQU5ybm84bnNFQTFSeXoxM0t3aG1McFAveWRkTjZ3?=
 =?utf-8?B?MnR0YzZwc1NQVVJ2U1h6RlA2c3BHSEkwc21ZaXc3Q1hMV1ZRYmM0bjByZE0r?=
 =?utf-8?B?Z01kU1BZVVk0N1UrTXZGV0owMFZjWEhNTW5nZHpIK3NxS0doYkpyS1ZkaFYz?=
 =?utf-8?B?eXlGK0FYVWE5cW0xZ3hFUDB0VTIyMEp3T3VoS2lndTVUYkNwK1pTaXlqd2tr?=
 =?utf-8?B?ZWhNNlFzZHZPbkplMnVxS0FPaG90Wkk5a1hucGRIS1ozR1RMNTBZQkdWemJs?=
 =?utf-8?B?Rmx5YjVKOWEweGZ5UzNmSEkxb2NNUG96aGd3OTVFS0tFWVdWT293WWNMSkdJ?=
 =?utf-8?B?WG5nUGhKWkk5WHdxU0U2OElTSUg0cDZlVWNBQWFVb2NkbVR4aG1pZGFCdlRC?=
 =?utf-8?B?OGVwTElBaC9NU2lzUTVjYituU3ZGOWEzUVovTmRpcVpsUExSZlFiRmJIZ0U4?=
 =?utf-8?B?MnllalpQVHR2bXd1Zk5uRnhkTUIycU1lc1dsM2VKSVg5b0pidUFKQ21yd0pP?=
 =?utf-8?B?d3ltQ2NWajFNR2x6MjRwWHRtNmR1RE0weWFyeEZLNDhuMUpzU3krM3ZaUXJh?=
 =?utf-8?B?bkFYV25jY0tzdHdPUDF5V3N4SEI1ZllqOWhsNHhmak9SUHhNdEtaM0Rkbmxz?=
 =?utf-8?B?Tm1zWWx6eTdQdXpzcVhTcytkMmJHZG9IMW9WSk1KKy9PL2lDWXpwdS9JaVpE?=
 =?utf-8?B?cjZiVHVpUGRQaWVaejNKUEpjRlR2RE10em03d0FnU1gzeUZxZXpJc3FJTTBO?=
 =?utf-8?B?SGR5WXZod2VING5WcGxwOExQSC9GNlZydmpnTXFrTnorUmEvVlRUMytwUDJB?=
 =?utf-8?B?UDVaY3JGM3EyUTJGenB1citNTmIrQXBKY2JCQnhjSnBPTWJpa1VsaENwcmhB?=
 =?utf-8?B?d0NVMVZoRSt0SmV5Uzc3aDdHa0JHY1Z4ckF6WFIxNmV0dCtEYjRCRndRVlFn?=
 =?utf-8?B?bGRUajB3UVU4dWlqbml6ZjBrV0dTNTRGczI3RDBDMU1GbGdOODhsSGE3SkJU?=
 =?utf-8?B?bGxtVVRZRmJVMUZXUUJMK1N2SVY5Zmpsd3I0SWNBMk93dy9PSCtNSDdCTmNB?=
 =?utf-8?B?V2ZOZ0pjOE5KNkQ5eDNqeWxINGpHMVRTSkh5MEs3aXV1NUEyNWlLck8zVE5m?=
 =?utf-8?B?bXl0Y1g5ZTdrU3RMOExvTGlZaDlrdTNGQlIxT2FhVzVHT0xYK1k2cVowNHps?=
 =?utf-8?B?U1hUc2U3aHU3THhLRllVYjlUb1hMbmNVcFNtUmJUWDlIeFloYjh2UVQreGhm?=
 =?utf-8?B?V1NTVHNOWW5FM0Z6ZEZ5WVBORUhNWDJTbGxteDlEZHNpeGFnV0NoLzdjSWo1?=
 =?utf-8?B?TklqN0wraGtUVVlTNnA1bE5qemdEbGFzMm85MEZrVTdSTkhSYnpFWUNaUmov?=
 =?utf-8?B?SG9iU08zVGJhNFNIRHBWaVdZeGlrU3dFZXZORzZDdURXbk5SVk9oZWt1SmpO?=
 =?utf-8?B?ZzJYV0xQYyt4TW84R08xQnpFVVhyL2lCUjZ1RmNDc2pCaHpMUndNbDBkMXkz?=
 =?utf-8?B?aFdGT2haRk4zeEluTngzT2JURUJMQmNnUi9WZTgvYitCZUdUU0FXbEV3Y1Fy?=
 =?utf-8?Q?cGOhw3medhpn3RsNuRj08XSQu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da5650f-9930-4273-f6d4-08de00f264ac
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 13:57:00.6372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unDTTklfDNQSFbixd/txBDlvVpCKdRpCTinHQM/uRud48G+3xB9s6+Fj7Ma3QaDaUIwWwu9KBOknjEELhWu1zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD114713BA
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


On 10/1/2025 3:45 PM, Lis, Tomasz wrote:
>
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
>> Blocking in work queues on a hardware action that may never occur —
>> especially when it depends on a software fixup also scheduled on the
>> awork queue — is a recipe for deadlock. This situation arises with

Forgot about the typo - awork.

-Tomasz

>> the preempt rebind worker and VF post-migration recovery. To prevent
>> potential deadlocks, avoid indefinite blocking in the preempt rebind
>> worker for VFs that support migration.
>
> Some would say the timeout value is a magic number here, but I don't 
> have anything better to propose.
>
> And we do not have obligation to match each tracepoint _enter() with 
> _exit(), that's ok as well.
>
> So, all good:
>
> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
>
>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 80b7f13ecd80..b527ee2a5da5 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -35,6 +35,7 @@
>>   #include "xe_pt.h"
>>   #include "xe_pxp.h"
>>   #include "xe_res_cursor.h"
>> +#include "xe_sriov_vf.h"
>>   #include "xe_svm.h"
>>   #include "xe_sync.h"
>>   #include "xe_tile.h"
>> @@ -111,12 +112,25 @@ static int alloc_preempt_fences(struct xe_vm 
>> *vm, struct list_head *list,
>>   static int wait_for_existing_preempt_fences(struct xe_vm *vm)
>>   {
>>       struct xe_exec_queue *q;
>> +    bool vf_migration = IS_SRIOV_VF(vm->xe) &&
>> +        xe_sriov_vf_migration_supported(vm->xe);
>>         xe_vm_assert_held(vm);
>>         list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
>>           if (q->lr.pfence) {
>> -            long timeout = dma_fence_wait(q->lr.pfence, false);
>> +            long timeout;
>> +
>> +            if (vf_migration)
>> +                timeout = dma_fence_wait_timeout(q->lr.pfence,
>> +                                 false, HZ / 5);
>> +            else
>> +                timeout = dma_fence_wait(q->lr.pfence, false);
>> +
>> +            if (!timeout) {
>> +                xe_assert(vm->xe, vf_migration);
>> +                return -EAGAIN;
>> +            }
>>                 /* Only -ETIME on fence indicates VM needs to be 
>> killed */
>>               if (timeout < 0 || q->lr.pfence->error == -ETIME)
>> @@ -541,6 +555,19 @@ static void preempt_rebind_work_func(struct 
>> work_struct *w)
>>   out_unlock_outer:
>>       if (err == -EAGAIN) {
>>           trace_xe_vm_rebind_worker_retry(vm);
>> +
>> +        /*
>> +         * We can't block in workers on a VF which supports migration
>> +         * given this can block the VF post-migration workers from
>> +         * getting scheduled.
>> +         */
>> +        if (IS_SRIOV_VF(vm->xe) &&
>> +            xe_sriov_vf_migration_supported(vm->xe)) {
>> +            up_write(&vm->lock);
>> +            xe_vm_queue_rebind_worker(vm);
>> +            return;
>> +        }
>> +
>>           goto retry;
>>       }
