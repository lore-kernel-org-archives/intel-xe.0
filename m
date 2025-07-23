Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9C2C83F25
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 03:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91BD10E03B;
	Wed, 23 Jul 2025 03:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIQIEXdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D86A10E03B
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753241130; x=1784777130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IbxiXRvDs77T2lVuYk4FhPlw1mmiLjaF4tUwV32Sfh4=;
 b=YIQIEXdS2bYiw7wV8MxjhyWbFwMZonNVbvlUw5nDEu/VDdavHKOvcpYL
 GRiUHEDQFEEGLYJng26R30Fj2LIhNFTLgpQ53sYO3Mzgrjt3ebfqfueWC
 lBegtYaW9WJ0wXQ9IQ87gtJGKhUNZUEm1L0aXGJ8aLEhny6ArefA0sln0
 hfP25/0YuDEgKxtuEnl/G0otWr7EV7dOGsTdtz9AQ2rvr7kBn4WuQkfrO
 sia8k3m9kGF2Lqx+ZarFVMYzaNUzSue3NA21e82L6pZS8vpdozpGlxm2u
 Y7diQ+UTsIgdja4Lbr19Cd0N43UWQ+u4rEeswMmLdwPJjks88diksHu1y A==;
X-CSE-ConnectionGUID: ey+do6VITTmSSQwNSndfYQ==
X-CSE-MsgGUID: RKU3bLfTS/q8TfmRqCDXFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="78047964"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="78047964"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 20:25:23 -0700
X-CSE-ConnectionGUID: lae4FmtuSTiuKufbVqiHmQ==
X-CSE-MsgGUID: oMz0UxzYSfO/2hb6WdsaaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164961192"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 20:25:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 20:25:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 20:25:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 22 Jul 2025 20:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+Fs3YULE+XqHMA3qXZ30/mYESrXzMc1yyNlJvFp64desCDONrArkzqEnTXRzKujBeh3+9QFatsB/0scf1jI1tDJMw/W6II+ghlgHP9tvVdRgEKZGQrmjb/9XLGk+u4llUJ3sZ4FHCOvrXksZVsWebRt7zew3SJoH8H2ax5LW+V0318VonelWAl1hM4bmInEALLWFTX154NuKsANfEoLei+8PE2lJlNkqVHyT87Bn/EGuRGqYCgNSDG08+wDXRlrKLo+CdO3tLEfC/d5OLGx2y+6xoVlGc9hD7WTe9pq47aMg7fAFkD2AHY8O60taMfwnhXQTnD2OpuakimleY6kbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kjoVMXrTttzvQILGjPervXCJj0+rSaUvgNLzEgh/nI=;
 b=A80hC4nJSIyZU7fr8VahY1tu9DvfRNrSi/5Lxuf36cLdqiHnk3dPWin6Sxx+2nN02qmy+H+WhlXQeDOlaXCoEFpIlz+wkmoU92BwyMc9sfZ9S/7m+1oSc75lj6oIC1txn4MzcQibs6Jr8MG7XNYO5i1AKKAqag+lkuCno7H0kQbs9S8ztGrIEHZIQIGRsN+yZUZSZ2gdGVhM4ytWEUeEHHoao0jFSNOzsiv2Q4yJXMLx7STb/qmyw26zgpUUBsP8ijHYWBVPHnFYuKs+8Zkk2c05+bw5oqox9soG/zzVxRWjC+J0B3wFhHrh39wX7RABJ+LiWa9hmKJyHwYJuGTcVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW5PR11MB5907.namprd11.prod.outlook.com
 (2603:10b6:303:1a1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Wed, 23 Jul
 2025 03:25:15 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8943.027; Wed, 23 Jul 2025
 03:25:15 +0000
Message-ID: <44243118-517a-4a75-a9d6-1ae4128ef58e@intel.com>
Date: Wed, 23 Jul 2025 08:55:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix build without debugfs
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Randy Dunlap <rdunlap@infradead.org>
References: <20250722-xe-fix-build-fault-v1-1-157384d50987@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250722-xe-fix-build-fault-v1-1-157384d50987@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: ed78dd67-2ad8-4027-d02b-08ddc9988a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUFiWWFIemsyaEp3LzhCT1E3Q3c2ZUdRWjYyTkQvY3JsTzZ3R0ExWUc2NExN?=
 =?utf-8?B?c2tST1E2L2RiWGgySXlJenllaWJFbTZaczZXVlhEZmRRb2h0amtZeGIzdGM0?=
 =?utf-8?B?WmRZai9sZjhOekx3QWlOQUJMc0hvOUNQVmNpTUhtVzBPL2kzVVZwRitvK0J0?=
 =?utf-8?B?ZG1IMTJuWjRDOU9VRTlYY0MxWGlJNVZUOUJkZ3lhUm5WbndLdGp4ZGRrdzZC?=
 =?utf-8?B?RXBQTHdCUkNMZWxrZXg0cWtxd2ZTa09aWThMcHRKOGhhRXJ6V3BEd1lkSjZX?=
 =?utf-8?B?OFVMSWlNVjV1dTBJQmRnRWNLek5UZFpjakNnVzJ2bEhRekZzOUprNGY3K3c3?=
 =?utf-8?B?OERJUUNJRE1CNFE5ekxUSEE0MnowNVhmYS9uQ0Uwa2FEWWsvN3BFTVpZbzJU?=
 =?utf-8?B?cVRyOFR4UTZqOEtGOHdUNkZXNTVNRTh0MHZNNUxDM3lpb1NZRVI4MVBDbi9N?=
 =?utf-8?B?cnk5a0F0YStlNHVXeFVTQkpXWWNJcHdTQWhVemZuWVp5dzVtZzdpUHZ3Vlpu?=
 =?utf-8?B?U2RpZlE3T1J4My9yTkpxMmtqTlA1cHh4NWhZdy9hM3JLVUxFS09Id2lCZEZS?=
 =?utf-8?B?UVpyZW0wcE9BTjhTZlMwL2JwcWZkTlVnWnlRSFhKOVVYY2hMVHJuaVEwdFpz?=
 =?utf-8?B?OEt0bDBrYTJTN3ZZSEh3bzVTS2Y0UWQxb0VxZ210YWFtZzNreDNEbHVOYkRE?=
 =?utf-8?B?dkovdC9PMlhHaFB5dmtERWtEbjR4eDZZNGFxaHIwOFBhM2FxdlA4d25ic2Rx?=
 =?utf-8?B?YnVrUTFmNzV2VVhDL2lmVmpvYmcyTWtoT3l3bUJXV1cwNUtLanNEeUUwY3Ux?=
 =?utf-8?B?ZWU0ZTBDbUFYNHlHbUM2ZlpQeVU5ZjUzSmh5Qk5tV1B4bUFSNC96dE0xQWhr?=
 =?utf-8?B?ZUUwZ01HK3N4dFZNdWJ3a05QZkNNK3QwQ2ZpUlVkbmRHeFRyT3h0THA0aW1j?=
 =?utf-8?B?NDlHbVNKZnNhejdmelEzcG53eFRiY0hzZVJ4Q0hqc0ZDMm5XdmVIVVhKZlcy?=
 =?utf-8?B?NGd6TDFQd2gzSWhtT1k1NDRmNEwxeHNEeStaWUREOEM5L0MzTFE3VEpJRm52?=
 =?utf-8?B?cktSTnhEd2ZBZzF2Q2IrRGwxVWZYSjN2VUhLdGVaeVBDc3lNS3AyaSt4bnBp?=
 =?utf-8?B?UTR5aWhHN0U4bytiMm5nVHo3bmdHL0tSNVBzT3RqZzhvdUE1dWJzVWxXNGw0?=
 =?utf-8?B?aDJsMTJkY1VLOWsrZ0xTeEpOV3BrYjB2TityQk1OVzMzYjRoblBhS1hyVytJ?=
 =?utf-8?B?bHh5ZnhoTnNLWVpUSFp6Z1RHUWhwc1pVUXhma3ZUbEhnQXFlSmFZcTJjU3ow?=
 =?utf-8?B?OHRHbTZVWlhYcW9WYUhZeFBxSXpHM0taaEErWDhDSnJxNVUyK1NLT2NjS3l0?=
 =?utf-8?B?enJTcUpxa3pqczZsU1RucXIzQ0N3cWhrcjBXdXd1SWhaYnhxWE1TOHJKVmhw?=
 =?utf-8?B?aHpCMU9lYjN4cllNZmNiVHhzTklmN01JK0tNOEd2aXU2b0RDamhFOFVWbnFR?=
 =?utf-8?B?TVV0YTV6SmZ1SkNEaFZ1c3VZT28yd29yQ2xzN2VsZGN3WTRWOUZXNzVSank5?=
 =?utf-8?B?ZFJCeE5XVVZrblJ2bmhqNlhzbTM5L20xcEZwcExNZ1ZoTWpYSFZRN1F6ZC9o?=
 =?utf-8?B?MnhHRnRZTjlIVGsyWS9idE4yOUlIK0ZBQmVGbkFsZDkyemhvTWRtd3YycDNH?=
 =?utf-8?B?QWdhMUxKOWJoWFBFK3MveVdhR3lDOEJWZmxJQXgwNHBmR1pLVEZwaFZjek5X?=
 =?utf-8?B?b2xtblNuYTNVMkJ3bUwwUkI2Y2p6WkRqZm4zTTlGT2tqQlJ1aFZjbGNqaW5V?=
 =?utf-8?B?S01iRUlaVWpyVXVPQ0NJalhCKzVPcE9GUitnUTZzSVFOYThiQW5IZVNudGF5?=
 =?utf-8?B?VXdSZGl1WVlFdTFPUm96QTJkNExhdDJKY0JGeDc4SEE0Wk9GTk5aSVprZHNV?=
 =?utf-8?Q?l2GpqPeYI/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUVMTFRjUWd0RTNmamY0K1FvcGtVdUllNXdkblYyOGVGWnNtTVpzOVRNajB5?=
 =?utf-8?B?V3lmNHpRZ1N0cERGdFhra1VXeWYyTU5HRWpUc3hjVlVpNWoxUHY2QkdLaEdR?=
 =?utf-8?B?Y3YrQXlUNEthUUtTRTNEQWZqLzF5M0NDWjF4RlNHOTlpSnRySFZ5a2dqQmJw?=
 =?utf-8?B?TU04aXppZ2IvbFNUK1dsaUIrM2ZGd1dzdmR5TUhYUXYzZmRmb2FKY2dhaHk4?=
 =?utf-8?B?VjJxRXdDU2ZlUlJOK0dWenhGamdQSXg5VmdoSEZhVzFlcTFCTEV2c0tRMVBU?=
 =?utf-8?B?aWRIa04yMlYzUmxVOWhudThrelA2T3lDT2N3MGlDajh3VnVuc3JvS0hKb3ZS?=
 =?utf-8?B?cm5ib0dwWElKYW1adWFqcE1XM0ZQZ1QrQlY3a3pmTHZrZGRyK0dDWU9oZWJN?=
 =?utf-8?B?alQvOVhrSGd0c1h3OWVESGVydlZibFF2bmJYWDlyRjA1SGpEalVKMTVHdm5i?=
 =?utf-8?B?Z1NScnFaYWYyMHNsUEFzZkFZZGN5RUplNlRsdytzTk9lMEVySUoyUkZJeUdG?=
 =?utf-8?B?UkZlZzJHV2dlS0dqSWZKSWh0SjVxZThyV3JITlhJOE9idXFhZk1OazZ4TFFr?=
 =?utf-8?B?bHcyN1FabXVUTDNsV3d3MENDV2xRTGlSM3hnK3NnNzkyako2Wlc4NW9TRjNQ?=
 =?utf-8?B?ZUVzZENsZENTRThWbmtsYmdKMm1YdUdDSUNIaExYbjdnbTc5eVJaTVBpUnBR?=
 =?utf-8?B?RHRZYmdrYUtmTFdwUGJKNmNuNVJzSXR2TTdjVEw2dGt1UytHMzg4WHpYL1Q4?=
 =?utf-8?B?OTVjV1RrK2I5L201Rmt0bmRwN0MwMkcyVE5tSDhIZVBxTFdMRTFwcjFSRlQ4?=
 =?utf-8?B?bVZ6bDM4ME81ZkF4MXFDbjRkdGJIRGdYYXo4SDJqWEtpNTV1b256TFQ5SGZo?=
 =?utf-8?B?a1F4djZsT0JDKzE2RjI5OFhST2ZQcHV1ZkFaWVFlU1BPNXd5MzVDLzIxbDdN?=
 =?utf-8?B?dmFRckhselpyclhxeHlxY3ZieFlYTTZGSW44TVZFcFF2ZVNMWmFTa3gwakhx?=
 =?utf-8?B?aFZETnJXRm5jTVl2TDFUZis5VW41UHQwM1BRa0JtdFVvMTNXbUVMc3ZpWi82?=
 =?utf-8?B?VGt6RE54amFXcHhTeVdQaGhkTXQwWktSS2ZZTXdhbjIrdHNjdTBUWjdnTGhL?=
 =?utf-8?B?RiswRDI0clFZRHRGRmNXTEczMHh3UitIaDM1bXdFSkxLTzhYNGM5QzcyTEdN?=
 =?utf-8?B?YXljYWNtWGNRNWRUVnJ3ell2VEdWMTZKcWlGS1R3RGxIbUpjMko0QisyL3kr?=
 =?utf-8?B?TWxPUkVEaU9kWXpzT0RnbjQ0LzFYck8rRWtzQk5JNFEySXhQenl3dlRJQWFw?=
 =?utf-8?B?OVhvRkdQS3NhZFZFWWRSdWJZcjM2UlNKZGlRSnJlUEU5TkFhb0ZVSHJwdmVS?=
 =?utf-8?B?UC9KZm1EWnlyelIyMXJTTzY3MVFrdi93R1Q2NUVPWEJnT0NyK1h2QjlFR2J4?=
 =?utf-8?B?QjdYTXVBQU5xRnVHTEZqZ2gwNVRxc0J0MUF4dllHaWtzQ1VtekNmcnFacklY?=
 =?utf-8?B?aWNEZ1RETEdoZHdaWFZ2elVEMXA5QXdqZ0ExQmVMdkZDREJwSS92bmhJMGNY?=
 =?utf-8?B?N2JpUG05UjNoNEp4UTFza1ZpbVZWNmRNZjAvdWw4bVEwMjNMK3ZHMzZuM0lS?=
 =?utf-8?B?RGExV3UwNS9lWXNUYzMyVVUrQWFpZFZJNWYweCtWZkdWMzlxb2txMDN6V1dw?=
 =?utf-8?B?MTRTZVBtbFcxNFpUMmxVeXhHdEhQYjBqOW1FRXVkSms3eU5rOHdqQmp2ZVZa?=
 =?utf-8?B?OTlLN2pSekdjTnJhRmlNZ0s0aG1KWTlZTUVJRTJBS2NYaXAzRFo5eTJ2WllY?=
 =?utf-8?B?UlNIY0FwV3RSTERGVW1tYlJYdmIwVHg2cDRWOXM1UW52WDVwZEdOU0JFdldD?=
 =?utf-8?B?aXVRWlpVYVRIT01ESDhscmdWM3BBYWQyeXNHODVUUWRQT2hTVURaK3dpaG9O?=
 =?utf-8?B?Z0ZKZzZ1SFlYUUpyMUlzYzcwdmNwdldOQTZXdEJTeXU3Y1dLbFRLSFFieStS?=
 =?utf-8?B?cGpCMVJGdXFhRndBOHRCV1VKR0k4SHVxOW11aDNwL2RkRzVmbkk2UVMyRXJh?=
 =?utf-8?B?L3hRejhXZ2dudmo2R25LTjZVMVo0TDlvY3VLRHBiODRRdXBSemN1K2dCK0p0?=
 =?utf-8?B?WmJuWkszeEY3eXQ2K0Z4Q1lSb3loNWl6MEFlT3UzUVFzM2gybVBvdHkvejlW?=
 =?utf-8?Q?cku0nzivWu1q/Qii9zeUlzs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed78dd67-2ad8-4027-d02b-08ddc9988a28
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 03:25:15.0154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcvqHYV6sfIBal8fF+IwZAxwNh2mLrRZYE5kELKB9El+ud1zGgTBx2Ug2lwXA1WwW80HrJI4/qGOR3W7z3oTAcZYDh9t23DnqIpNapPSkw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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



On 23-07-2025 01:22, Lucas De Marchi wrote:
> When CONFIG_DEBUG_FS is off, drivers/gpu/drm/xe/xe_gt_debugfs.o
> is not built and build fails on some setups with:
> 
> 	ld: drivers/gpu/drm/xe/xe_gt.o: in function `xe_fault_inject_gt_reset':
> 	drivers/gpu/drm/xe/xe_gt.h:27:(.text+0x1659): undefined reference to `gt_reset_failure'
> 	ld: drivers/gpu/drm/xe/xe_gt.h:27:(.text+0x1c16): undefined reference to `gt_reset_failure'
> 	collect2: error: ld returned 1 exit status
> 
> Do not use the gt_reset_failure attribute if debugfs is not enabled.
> 
> Fixes: 8f3013e0b222 ("drm/xe: Introduce fault injection for gt reset")
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Change LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index e9ccab8aedbef..41880979f4ded 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -24,7 +24,7 @@
>   extern struct fault_attr gt_reset_failure;
>   static inline bool xe_fault_inject_gt_reset(void)
>   {
> -	return should_fail(&gt_reset_failure, 1);
> +	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
>   }
>   
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> 
> 
> 

