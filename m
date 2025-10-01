Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F4ACCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 13:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8E010E6BE;
	Wed,  1 Oct 2025 13:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSUSLfU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFEA10E6B5
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759326353; x=1790862353;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EMm4uCnETVRk9PeLt0Qhwv6zE1WTOWgtbdLxJX8uNmc=;
 b=BSUSLfU6tGoprFgWiYhq1v+h070U/ohBB3KyUpYPmSuXqdUffh4LUYFy
 jK9QY8nh2WTaMn2ljdEu9RjaUOILOs50F4+NuabTmtOwzy80Q8As0Z+JV
 tDib/RgyG+4LpZ9p5UDLsJ1vqlLQNVH9pJrspZablxVQ8HptQ+DB5s1M0
 pKUCKeO5JZxYq7DS+VK7Wej/gF3ZTNaA3fUVjXEVEY49qtoKytCo3jxZ2
 zP6Y/MaDRpSVPWF8n7eICiiO+tt9Om9bVzP1xbqOsBHfgIJLW2hiIjW6F
 CPlYzc7nxof7XuTxFxPa7ArjYIIaPL6SpwThPwFw6bHXas3S5uSSJGjWU g==;
X-CSE-ConnectionGUID: 8uAGDHFRSNKjsGaHg40Y4w==
X-CSE-MsgGUID: qBP9IhZvSV29R0yJB3oFXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61703834"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61703834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 06:45:47 -0700
X-CSE-ConnectionGUID: L70sOfttTTGu+3M0UZIOEA==
X-CSE-MsgGUID: cdM3Tdb4RLa71Wq6FvJsNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178594650"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 06:45:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 06:45:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 06:45:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 06:45:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBcbFc6L/u//5jyfYcUXPRwfp8m0WskwKWWg/ejT66HFfF6LeQDsr+XGT1utfarogNjPBVH3dh9hEJbZ1J8wrCkpIgodJ5PUFWsKRD7sTblzYqK06faK4bU108QauYdSSxJ9E9r1BJ7ssM3EZiQwHO7gMBOALZWaWNDiIr68omG5qvjOGzU9J7HOu+CspQKMCuUj0A72aS+qenKPyhNbBhabeld1r6AYS+8XBKKiSyYVPtjm5L/VfhcS2ijLIZs36DOu+aWZNgLxlcL4GMuGeuaBlupfWSVU7t9vJXP/Zvby5bLKe+FCe3jJKJqbeEUBgCeHF7dezGKTeBre+OGn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4CxwMGDWbLUNcv+V0J74INJM+FviWi6uNv/bz9SIeE=;
 b=xVNz37SmkmiFfNA7+ZrN17j1fSqRZKQumN2TzGzU0qX4JtsxblQ5HM3P+A1wcziWUeihe81hN8ML4myDZkC7RsqSZEOIGq0OcxKKsftwcyVSSLc5lM1WyNfWeF08z9dF7chyzT3vrNs+/PD4c8teVwVeDAxN2fVAvz0odYpWTOnBxT1UpvAZHe+8cZF73q213PrN2bRIN479nVmMxBtFCAOU+qFSdC5tI+ERjKlBK6dE14JEKahuPpyerZzUKTWKzxdT+a9oan52LvP/w/QpwdfojtUmOTypYjQdNbxVzPIuBtZA2KQrmdqj8uJcQDGmKPjggNgBDGGGzqLkDyxZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 13:45:43 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 13:45:43 +0000
Message-ID: <b535bacb-4f28-42ba-84e7-812ec28a07d9@intel.com>
Date: Wed, 1 Oct 2025 15:45:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/36] drm/xe/vf: Avoid indefinite blocking in preempt
 rebind worker for VFs supporting migration
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-21-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-21-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0089.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::42) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e9dd20-1893-453a-0c8d-08de00f0d14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RENLdFB3Rmh2MllkaE5qaUhaNE5PWS9JdG5HWmN4WlZiczNFL3J1Y0h6aGFF?=
 =?utf-8?B?NGFHY1AvQ3RrOUpBRFErdERqQlZyd3pYVk80L09KNmRSNmNkZk9sMXVsN0Yw?=
 =?utf-8?B?YnJIeE9iV2pIRUxoZ1E3TVU2S05VZTFBZU9NNDJqbHM3dmFxdGlNNUVUUWM5?=
 =?utf-8?B?YXFGbXNOZWF3MzlneTNMWXFrWEdNTWI4ZkVxRlF3SGRVWFhKeFNIcWlLM2xv?=
 =?utf-8?B?TWhnMWl6Z0dkaFFkZTBxN3JZWmtjMncrVkczSUVVNGw3R3k0S1orSWVqMEMz?=
 =?utf-8?B?Rk1IM1QrbnRDUkZFR0xqNzgrWERrVjNQOHhRTkdHZkE1SFhRYzFZWUMvNEs2?=
 =?utf-8?B?RkVPeG1IcEF0ODdJNzloRThUS2NUK2I4a3hxR1E3QmhSa3ROOXNOQmtWRGlw?=
 =?utf-8?B?WGl4UFI4M3RiUVJ5Sm9aa3BRVjBFWGl2cTJNQVlHeUltaXB5Q0xjU04vUW5Z?=
 =?utf-8?B?VWpqT2lqenlQMWtnTDJQRGh0dnRxSE1tTldpaXZTUldVbDFad0ppdTI2cVM3?=
 =?utf-8?B?b01VQTMwc1UvRHFhcmpnMEQ3VE55TnRWVDY2aUN3cVNjZGVhSjJiKzR5cEIv?=
 =?utf-8?B?TXBrc2hiS0Joa25VcFV1bDREdmEvR3ZvdkFMVTh1NG0wV3l4SndDZXVQWE5l?=
 =?utf-8?B?Ukg2eDNFTjhBWDZXSG1HTE02c1M3T3dPdGdQdS9LNUVnQURYN2JWUGZQOVdV?=
 =?utf-8?B?Um8rbjhFdC9CbUtJcTdkWjlxdzlVankrVnpTK1ROdW5mRUM1eHBZdVBPTWc3?=
 =?utf-8?B?em5qUFpGSHRNSkV3RC8rNXcvcTdvUmFDTXhFbjNjRk1Bd21QWVJ0Z2ZRdGlW?=
 =?utf-8?B?VEVjUENWR1hKUnRCSjdURjcvcW80UmlkWUsvV2hOYWc3T1dQR29hVTFXSXBx?=
 =?utf-8?B?Q2NET05oMVU4SzFJZ2U3bzRIVFBES2NxOHgzRjJZaHpqSTFOcjV0b1c2aXEx?=
 =?utf-8?B?WVh5SnpCY3J2dE5wUG9ubm0wdkRNVUFSeE5UazFoRjBBYVVxQ3BKanV5cnk3?=
 =?utf-8?B?bzZTT0pkVHFPb1M4YlBRdTRmK091YnVlZXZVaVlJZmMwNmQyUjkwdXlzMmRQ?=
 =?utf-8?B?eWU5YmF2OERGaUhqaTV1Slc4d2xOeTVNRTFEOVlTTEhBZldRNS9xYTQzbVQz?=
 =?utf-8?B?QW9yakVrNnhUWGora2ljQ0FCUVBHWVM0Vm16WERsOXdXVENycnAxTGxyTnYr?=
 =?utf-8?B?RE9QQm1HMkJHd3JseGtGZi90VFJYTGQ4Wm15bGFmZ05mNzlWK3IvUXpXaE5P?=
 =?utf-8?B?OFlHTXJ4eFVFNCttRGY4RjY1N3BBVy9HUzNqRVNqcm9HdWE3b3ljcks5Vlk0?=
 =?utf-8?B?c1F6R2RHZ3lwR1pCaisrdlRJaTRNNDQ2R284ZTMvWStpUDBrZGlDdjBBcnJm?=
 =?utf-8?B?OEZnckVxSmZXL1JGUVM5bWptbUIyRnVtUjlDN2g5ZUQ2SWxmU0hwSEIzakgv?=
 =?utf-8?B?SGhQdmRRcDM3cnJER1JWK1BYUDBqNzBEZU1YdEE1ZGU0eDBBUXpQTHRtZ1FD?=
 =?utf-8?B?OHFDQ3hQejlKeWpCL2cyTXE2TjYyZzFlS2xUS014OGtnZ3pVNWpDOVdsRnNM?=
 =?utf-8?B?UVpaUDdzdWdJdVRwM1BPS01QbVU5Z2YyYitWcXZpUG1Rc3hjWUFHMDhIdDAw?=
 =?utf-8?B?amJrTnVlNnhReXFVbDFTMmxOTENrOWVtKzJTTlZuWEw4aXFoRy96VlpwMG5z?=
 =?utf-8?B?SkRIWk9Nb2pGS2hsckR3SlJVVWptanBURjYvaTlJOVZnd2NKMFkvMnMwOHVX?=
 =?utf-8?B?RkpHNmhYbFQrZVFINHlFVmpTUFpXOXNCTGdWNUszM1U2V0hlSTRHTTlrNmF2?=
 =?utf-8?B?QVdUdGtjaUplUFVYVVBVRHlPaitwSWx5a2RERlB3VVR5QTVjcEx0U1pVZGlz?=
 =?utf-8?B?Y2c1ZDgvZWE2b2pJVDQ4TitNYm94VDlqb2tDTEtXRHNKN09FbFRndzZ0aWdT?=
 =?utf-8?Q?3UF1/djMinsX7na2Ibgvh4rr+bn8XWhe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnFmZkliU1B4VDhNbXA2dTlmRVRPNGVoeG9BSmJSQVJWbFZNNW1QK1lvaVFU?=
 =?utf-8?B?K0VKbE9URnhLTzNPdHBFbHBrbHBtb05jT21pNUdjZHYvWmpWNVBiQzJWZHY4?=
 =?utf-8?B?WkpZU3hwUFBNMERRUm8wZGw3anpxMTVDdk1kblY2aE90c09sQ2lnQTc5TklX?=
 =?utf-8?B?TFdLRW5uL21oNHlmNjdGc0Y3clV6NHdJbkh0Ykp0N0VsZjN0TXVZaStQNUxY?=
 =?utf-8?B?cXBicmxnN1FXb25MZVBDWjYycFNXb1lhTVdPTlJqdlkrUXBXTi9IV3ZYWVFK?=
 =?utf-8?B?NStOZ3poQkFId2RxTG9HamVTTmxoKzNYck5ZNSs5cHpTU0ZEUmNSWUd3Vy94?=
 =?utf-8?B?OEdrbnphQzdPWUdhNG02UGEzVThoRTRsaDlveWdrU1g0WnlwZyt0UzJURVlw?=
 =?utf-8?B?T0hSQzlxclNiQ3V3MEtDUkZsaUFTUGgrYVdHaWRlRE9wc1BvT2JrV2FHY0R0?=
 =?utf-8?B?dW84Mm01V1hwdWVzODB0L3RhWnV2SXFWZXYvcWVhMzJuMVIvYTl0U2Foa3cx?=
 =?utf-8?B?UjNzeEt1dnlSb3hMdUVyLzVMdzFJbFpMMy9tY3Q2SWZCejIxWmVEK005Snh2?=
 =?utf-8?B?dkJ2UHRBOTZGY09uelpkRGw4a3ljcHBySW50Mnk4L2Y2dWhNNkdLdXZzeHRa?=
 =?utf-8?B?L3BkNnIwNWFGVGU0S1QrRTlBanVhdlVsUlh0M3NLc2JyeC84RytvZVlKWTBD?=
 =?utf-8?B?NnFFWkxYSEp1OHV3elh1NU9NL002dnJ5aldlejlDdHE0czNWU2NrNzYwWHhS?=
 =?utf-8?B?b1BHeXVWb1JxQXJTY2VvallqeWZzTXdiOUlJaDRQLzZ0TFdJR1JoN29ubHV6?=
 =?utf-8?B?YWVUZy85TkxMMFo3OUw0WmN3cTB6NEZCbGwvR29KVlhJaTBvY0VqVnRiWlQ4?=
 =?utf-8?B?MGJrS3l4cmZSNXFlRzA0eW8zYjFzMkI3MkFZUy9hWGVXd3VnUTV4N1RoQmFK?=
 =?utf-8?B?ZVMwRlROS3Z4WnlpbVhEYkU3UDBpMjVLZE9hN2kzVUJtWHZNMm9hTnNXSklC?=
 =?utf-8?B?a1ZuQk9hdzd0eXUza3JoQVZlR2xmWjJURzE3S2ZjMmluQ3RwdHNoUjVTcU9Q?=
 =?utf-8?B?a2psLzdEYlBWclhGdFpaeElqMXBLaTNJRDhVNDJCRE5JZGU0eEtUdUpEMHFx?=
 =?utf-8?B?QVBWN1BXeEdET3J4M3RNd1RDUVozcStXNWhCU0IyY1lmR2FlUmJXUVBlY3FM?=
 =?utf-8?B?RjB2YTM2ejY1citLZFZkTFZZeFdaV0RkWW5vd3prRWpGY3dFNjZGdHdmWmtu?=
 =?utf-8?B?TDd4RzF4VmNzZ2hwcjhVVWx2dWwzUkpBanBseXV4R3VaeEx4eDVwbXMydjBD?=
 =?utf-8?B?YjNLRURYcWdPRVhQaEtDMHJxd09oNGUzS3ZKbWZtWjdEczhNbG5PQWxKbUNQ?=
 =?utf-8?B?LzZiV1BDVnJ0TUYyZll1dWJSSjg1cEhUVzdOUmp0M2dIVGVNcnRXMlhwZDF2?=
 =?utf-8?B?bmFhdDYyN3M5c09IcHRrMU5mMjkxK2dTU21LSEpDazJ1ZzZ5ZmFkQlVZSzhW?=
 =?utf-8?B?MXJuQnZQNTFKa2RLYWtpZ0pPR0dHaTQvWlRZZlh3Q2k2dkU2SCs5bUFrU0Jr?=
 =?utf-8?B?d2sxUUY1QTM4M25Xc1crVkdlNFQzZzV1cS9wbk1YWjQ1MXVUaFBHWTNNVTho?=
 =?utf-8?B?THdrdSt0SVNEeG42TXV0TDUrWFFEdURIcDJNOThtMnd4ZlFCZUdLSktEMDRB?=
 =?utf-8?B?UDBHTWdpSndjRmFxcCtzZEtSRWpNU1diK2M3TDl0Vktxb3pXcG5qM2FDV0dU?=
 =?utf-8?B?NVZkdGpLVEQyZk9Sd0hOWS85OFRLcWk2Y0NtSmtXSGFsUHZyTGxMbGZzVEJR?=
 =?utf-8?B?Mk54TlV0TVloYXpuWmpSU2pnN2kyUUV4M2RnbFg5SFBlb1Mvbi9ZWXVObm96?=
 =?utf-8?B?aUtoQjQ5OVV6c0ZIenhoT1NJSnk0VUk5RXo2TjNaTmJXbTZRck1MUzcwckU4?=
 =?utf-8?B?ckp0ZzNSR0ZaZ0NTcEN6SEt3R0FMWGhvellkTmViQ3d6WTZKRmhOTThYMWIw?=
 =?utf-8?B?eWI0UmFxNTRtaFFERk1oSGYxU2c2T1Zab3lnbVhpS25rVEtjVmxMOFVhczBt?=
 =?utf-8?B?b1BjZ3lUVGhNdy96TFI0SEtNYXBLNUxSQjNTakVnU3FEanZucEM1VnBWRTQz?=
 =?utf-8?Q?aLRKgHJ5J6pYzllcFg0iaKtic?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e9dd20-1893-453a-0c8d-08de00f0d14c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 13:45:43.8068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDvGd6cFTVRpTRyC+Yc3um4vdKjWjJKVDUMw9EcYhkdhycQPW6SP7Ay/KW6N5IzYj5aIjeQHcsrPU8QN/UUH+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> Blocking in work queues on a hardware action that may never occur —
> especially when it depends on a software fixup also scheduled on the
> awork queue — is a recipe for deadlock. This situation arises with
> the preempt rebind worker and VF post-migration recovery. To prevent
> potential deadlocks, avoid indefinite blocking in the preempt rebind
> worker for VFs that support migration.

Some would say the timeout value is a magic number here, but I don't 
have anything better to propose.

And we do not have obligation to match each tracepoint _enter() with 
_exit(), that's ok as well.

So, all good:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>


> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 80b7f13ecd80..b527ee2a5da5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -35,6 +35,7 @@
>   #include "xe_pt.h"
>   #include "xe_pxp.h"
>   #include "xe_res_cursor.h"
> +#include "xe_sriov_vf.h"
>   #include "xe_svm.h"
>   #include "xe_sync.h"
>   #include "xe_tile.h"
> @@ -111,12 +112,25 @@ static int alloc_preempt_fences(struct xe_vm *vm, struct list_head *list,
>   static int wait_for_existing_preempt_fences(struct xe_vm *vm)
>   {
>   	struct xe_exec_queue *q;
> +	bool vf_migration = IS_SRIOV_VF(vm->xe) &&
> +		xe_sriov_vf_migration_supported(vm->xe);
>   
>   	xe_vm_assert_held(vm);
>   
>   	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
>   		if (q->lr.pfence) {
> -			long timeout = dma_fence_wait(q->lr.pfence, false);
> +			long timeout;
> +
> +			if (vf_migration)
> +				timeout = dma_fence_wait_timeout(q->lr.pfence,
> +								 false, HZ / 5);
> +			else
> +				timeout = dma_fence_wait(q->lr.pfence, false);
> +
> +			if (!timeout) {
> +				xe_assert(vm->xe, vf_migration);
> +				return -EAGAIN;
> +			}
>   
>   			/* Only -ETIME on fence indicates VM needs to be killed */
>   			if (timeout < 0 || q->lr.pfence->error == -ETIME)
> @@ -541,6 +555,19 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   out_unlock_outer:
>   	if (err == -EAGAIN) {
>   		trace_xe_vm_rebind_worker_retry(vm);
> +
> +		/*
> +		 * We can't block in workers on a VF which supports migration
> +		 * given this can block the VF post-migration workers from
> +		 * getting scheduled.
> +		 */
> +		if (IS_SRIOV_VF(vm->xe) &&
> +		    xe_sriov_vf_migration_supported(vm->xe)) {
> +			up_write(&vm->lock);
> +			xe_vm_queue_rebind_worker(vm);
> +			return;
> +		}
> +
>   		goto retry;
>   	}
>   
