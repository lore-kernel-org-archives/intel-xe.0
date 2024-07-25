Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE40C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 14:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AA410E155;
	Thu, 25 Jul 2024 14:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Omz+pISz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D3D10E155
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721916015; x=1753452015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k30WPz+EFQH7pu5vibhb0d9fzSaKjEVDBopI1FCmJ/k=;
 b=Omz+pISz4pkP1GXR9TXXjceGwYcG65plVtL6vfXY190W2rXOB3m/FHdn
 v3qygWHZsxr7hJr1i7B6G17DtI2jInOfcBnHctaTQcUgdSXANIRhK9LsL
 PofGaSDzh85WclTx2Es3NdOEZ/52LRnNFsma5So6CigMOm0aKZ9BpZ/28
 115cD4fxVtlRfYMpzXZuwkqGGHk5y0PVD5BD2H7+qRISgpOCk4J37DKfW
 IzasT1FT/fVE2hi2pepWvOhLPHxrFwdYPN4MSFaiCJ+aEL4rbzKrJp70k
 i8D931FIbFeLmkldsyMwX3xOw2ywDwYRbkR8hblScIEkvLMtQldvGJk6X Q==;
X-CSE-ConnectionGUID: 0oah/TXmReGc7BAVfFTL0Q==
X-CSE-MsgGUID: cE0qyASmR8+yU62IAGEXaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="30254675"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="30254675"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:00:15 -0700
X-CSE-ConnectionGUID: 3pWVku7WQuOyEO3yFOauTw==
X-CSE-MsgGUID: NlqfETlCQVuZgGVmEy/rmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="53701096"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 07:00:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 07:00:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 07:00:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 07:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s44MnGLFlsnkqWuEYWrpFW6oom9X9EBPzZbnUHd7FSggENVjKcP1tDyJn5K0dAPJWBwEfir3TwLAnLgk+pjaUkTstKvinaUoKUHBd1de6W1MUYy1JwBXRue0FO5Yj3VTCyOQlbmuUwjff2yr8EmyeIqai/MZ3ci0L0Qy1nmikVXlhcmNy2QReAJ1l4Or80BjrD4EE2Aqh/ceqpXMi2T6gdPWRqFXJQqDibVBRb0Lb7CrYvvT/zkkpxuh2CiBpI2A9qlOyTyqR7kPYS/4rj9E6246PGO1y31V+jd6KDr3dqan8jbd7Wtd0h9F2xaQBXiTuAVhKM+SQINHPC+/xWjtpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFo/8AVWsTEp0lEwk0A88HJAbKbskgX296Mg/GYXBo8=;
 b=fJGj91AbG5iFcLiiJvXZ0opzOOiZwQE+wB7iIRmpoPMLbVYychPMXLzHOvRYOBQXdddQPjEgx5wIR3m6hPQXvV/xav6wNJGgvrbcRAjiL4WUxpylUrxWGHHf0iZJhgmEkvVijVsYsH8lfBLb9CasXSLb70uI7Fn3MS8YHZAfekPsnbPc01Ht3ThMfupW0eeLOcdUJMROPEfj/xFTTn72R8qD0wbOalID7D0gFL2qaeCwPxrCA/QMgVw+TaSyWW1G9MHsDr/2xuJvWmIagj2RMtojsy31awoD9VOYW3B7w9RzcxS7XhlA/qp55eePYoONOxT6LtWF2ngkt0EGWuxXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.14; Thu, 25 Jul 2024 14:00:11 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 14:00:10 +0000
Message-ID: <854aed07-fd1d-4676-a1ed-3dc2bd8800df@intel.com>
Date: Thu, 25 Jul 2024 19:30:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_gt_idle: add debugfs entry for powergating info
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20240725073507.723568-1-riana.tauro@intel.com>
 <bc392037-c61e-4be9-b836-d6b18378bab0@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <bc392037-c61e-4be9-b836-d6b18378bab0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 501577fe-babd-4d60-b742-08dcacb21911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkU3ZlRRZURkUCtlN1NuNXB0cWVoeGJpQWFQcnJmbGdjQUZYeTRZek42THpO?=
 =?utf-8?B?QjJNem4rU1pzeXV3aUZGcEFkZ2czcDRiYjEzREhwTW9YNWN6SGtDTHg5MldP?=
 =?utf-8?B?eHkybnRmSU9ZK0FFdHBEWTVDTTJoRTlkTGNzazFRNXdkNEF5c1ZkYnhaS2M3?=
 =?utf-8?B?eUZtdW1UK2lwL0FybS8vNUFlR0VPWEwyVlc0RE1jM0xMalBKTE02cW4wNkZ2?=
 =?utf-8?B?WnhwbzFITUJTUTRsZENBREVUUHZQMGpRenZnY3pCNHpycG00QTFqTVMvVEZC?=
 =?utf-8?B?dG9PWGcwVkNDV3NqQ0N3V1Y5dWpkazUxOUxZTGZlQzRvU2I0MCtzOHZWb0Fv?=
 =?utf-8?B?QTZwQUh6ZHNKckUyemZUSm16dnppS3dBSkw3eFhZRXdObmhpdTFLUlBDMU4v?=
 =?utf-8?B?cFhqOUhQUi8yWEFGV0tQUDRYcW9TeUR1dFp1alI0VTN5Rlc0QjBTRGVWRU5L?=
 =?utf-8?B?cjUrSlAzbFRTbjFlNi9lZUtIK2wzWGFlb29Jd0pGR3NhZXpBYmNxTzRrUmFh?=
 =?utf-8?B?dnlVeCt4NWVZblgrL055di95Y240MGRTb1IrQitQV0FpNmtpNDhjRDR1blN5?=
 =?utf-8?B?SSswRTRyWWJ5QXFQdlVJREVMT1pIRmRDN2xnSWIzaVBMNm9IZFBKeDVlV3do?=
 =?utf-8?B?TGRrOW1BR1Jkb2s5V1Vta1pZNUNocDVmMGVRVXRSL2dvTVByK00vM2R1NGZ2?=
 =?utf-8?B?OXk3RlQ2RG8yTkVjQ1gyT21NTGp0d2pTZXptOUFUYjBtTXRjMy9OS1Q1OWti?=
 =?utf-8?B?ZzJ3MGhqZ2lVT0Qra3o5eFN0R1RnbWtZREJJaFBnVGFkazlPbklCdU4vMVA1?=
 =?utf-8?B?T0hKM2RkZVp2MmpuUFNTTVZTTGp6Vkp2cWV6U1BlK3pYaStRR3lBNW50Qnkr?=
 =?utf-8?B?c0JhN29SYjBiZFpFY0lGRDNnY0w1RjhaUXVXUWRKSExhRThncXN2cldKWnRp?=
 =?utf-8?B?UXlKUkJOUGttdGM1NjU5dWUzTGRZSHZlMno3WURSbVBVUlJCOG4yRnBTdzdC?=
 =?utf-8?B?c2p4MGQwYVljVTNlT1FTQ0xVM1duUmFhMGlPaTZQSnpyWVlyZ2Raa09JVFhM?=
 =?utf-8?B?RzlWNWdQWG1LcWFUUjRRN2IzL0RwZHFrc1lHaGFZNU42TC83ZzJSWXBta3Nv?=
 =?utf-8?B?NlYxODVFT3hLdXVtOXA5WmdFbzgrRWlRMTJFbVdvQzNYV1pwRTlzTC9obnlP?=
 =?utf-8?B?WmxXbjJkNnhEYXlVVU4zTWYrYUdiK2Z0blA0TkdQYVU1YzdGc1FLdHJuNVlQ?=
 =?utf-8?B?QjhFM1E4QkY4dkE3cjZ6WkVlNTR5OEhCdi96dndCazFUTnZkTmFER0hWNXA5?=
 =?utf-8?B?ZmNpY0tRSnQ2Wkx2RGpkZ1lWR3MvZXhvL1hGS2FWZFlNRjZlODMvRlh4S0sz?=
 =?utf-8?B?NmNIcHQ0N1lFYzlOTUd6eCtIaC9VV3dzTHRHdWRIdDVQYnZRNkJJTHQyM0dI?=
 =?utf-8?B?UXFxVEFBRU11enplVUJnWTR4QTRXb21rbm9SUTJ6RTA2RC9sM0s0ZnVKR21M?=
 =?utf-8?B?VGRXcFVjM2lXL2M4NDlnWktjL0RnRDZxWmRpWVB1ejhBT0RaMUd2alFmUWpw?=
 =?utf-8?B?Q1M0dmtQeTFvd2VmanRTOXFaN3IzTDBDdllyY0VvRE5Kak5wT2VkUkgwYVl0?=
 =?utf-8?B?dXltbjlUQ3piL1VRK09lbGpjRmVrbnB4MEVZaDFTVUpnNlZnaTJQcUFVaktk?=
 =?utf-8?B?b2pCWmJJc3UrWjllNVdZRGlRVzRXSy85bXB4akMwd3J1NFZYWjNBWlk3RVAv?=
 =?utf-8?Q?sh05tP/E7S+LHGskOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajFsUDRPSmdPTTZuMWhYa21ZcjVNbUh6U1lYaDFNMzV6aU5EaXBZUHd1dytn?=
 =?utf-8?B?WlRqRVJsbHkvRnJRSUxtK1M4dHBCdGg1YlNRczQ4RDNYOVFZOXd1bW9HRTZS?=
 =?utf-8?B?SWROUEorU1B1c1NXQXMxUEhLZENRL3ZSanR1QnJkVnd1NmdJT2pGZzRWZGxW?=
 =?utf-8?B?UnlBVUh1Y2JERzJDLzVMSTVjdlhJb2FQeHh3WDBkY2hnaTFyYVNwWG51Tk9i?=
 =?utf-8?B?eFRzTlV5WEpGakQ1T1JuazJUblhKRmsySlI5NnNNM2VlMy91eCtCeTVjcWpy?=
 =?utf-8?B?Z0V3RWk3a1Y1UXVRVFNscUVUUWx5S00vUUdra3F5MkVyNmFLNzV3RjBjRUFl?=
 =?utf-8?B?U1hMVUFuNmNVTTdLbWJCalUxdFM4cmY1NnUzOG1hQ3ZENzd3UVp2TWlmeWo5?=
 =?utf-8?B?L0J0V0VYb245dk85ZnNmY2U4dFNsaWlkRG94NDRFenlzN2laczI5dXhqVnZD?=
 =?utf-8?B?ZUdKNjNHY3IwNzRST0Z0YkNjNEE2WEZlenRzSSsxR2ozRnh4Qml3cktxdGNX?=
 =?utf-8?B?M2tvNHI0WnAwR2MwL3VqTWc4WklEZWZOZDZnVVpUR1g1Y2xQMU9LTlpNYWo4?=
 =?utf-8?B?Z2htb3dLSElMU0Y1UG9PdVZyOXBRTzFYRTVUVkJsd3o2S3ZPa2lKS3MrMHEz?=
 =?utf-8?B?bHdrSEVvL1RBWWZBRjdMWGsxOUo0aitFKzVOUm9Cbml3RWJja25PdXA2ZEt2?=
 =?utf-8?B?TDVoLzFOYllTaHkzRjI5M1RWOU1QdEdDdk5HNEpUZGNIMU9nVm53T2RXWDNP?=
 =?utf-8?B?UmQxbjJwNm92VjRhVmZMSEtlVXplU09VYVNBU3R2YkRNL29zOG96aHIvajN5?=
 =?utf-8?B?ejd0MEVhQVBEWWpOSkZjaUhDMy9XaEV5VmpGK2R6by9DTW5UT0FvY1FWcW9V?=
 =?utf-8?B?KzF1OWZEZ3hTeTNNVE45WStwQSt1S2xqamFjN3JMTDczYThWemRHRU4zaklV?=
 =?utf-8?B?eFRKNFp3bG00VXVpWWxjN1dUNTY3OE1xbndzTXkydjk4VFRmNjRUZEM4RHox?=
 =?utf-8?B?djRpa1lZZm5DcWQybjBHT0VKMUhmWjUyNzg3d2dWOEVTZ1QxYnVQZ0ZCZTNQ?=
 =?utf-8?B?MmJDMC82dEFwS0U2K1A4cStCaGwyQ2YwOVQxUUVWTFdpZncvWFo3QXN0d0tC?=
 =?utf-8?B?cHBvdGpWTVkzTFZyZ21Rd0E2dHNPS21kM0ZlR0gyRDBtbWViZlVzOExFTUJB?=
 =?utf-8?B?SEphR0RtdDJpczFsRmpzME1BWWt4WmZZUThZb0NTNEhvdDU3ZVcrQmZPdGRD?=
 =?utf-8?B?QmVzQzZkaEFRT0lWVzRKQ2pFQ3Z5bGZoalRvbVNpVEZRR3hSQzBaOGNjZFJN?=
 =?utf-8?B?ekdTdWNqamxYdHVKbm9jT2ljRi9seERwanRETWpNaTBJdGhqU0RkdWJveG8r?=
 =?utf-8?B?cWtjVTdJODh6VERZRzNoVTZHZWxacmxrcTVtUXJTUktrSm53amk0ZlhHSndo?=
 =?utf-8?B?NXZwNG9XcXJMd0hSN1pQbS90RmpmWmpVamR4akxWOFk0TTBicDl5ZDEzdGRT?=
 =?utf-8?B?WTFrSFZ4aHFXd2VJZDlzcTdEUkpDdmVZemQ5WWpJbDFWVHFvVkw2UlJrMnNs?=
 =?utf-8?B?VWZ0ZEwxdG9MYW1yMGZ1QjBIVFRkOCtPQmtLUGxjaWhIOVFWbE9vbTNtV3ln?=
 =?utf-8?B?aWQzQ3QzVzAxSDhHVkhINUdXZmw4UGtSSTVkRmhlaEYwanFWMFpmdzdwTzhq?=
 =?utf-8?B?UjlJQWVMZHgrMmI4WElXRWt1ZkNreHREaVFJVzBJdlkraXlmekt6ZXNQYWRz?=
 =?utf-8?B?TzA2V1YzaEYrQjlWNjhmQXlQM3EwRjRJWlRtVXZOY3ZUZTRhR0dEUEZLMTVW?=
 =?utf-8?B?ZnhwVWZDL2xrV0Fqb1FUNjRRZm43MzdkV3l4T0lWMjdYNlBTVHdEWlM1NzVW?=
 =?utf-8?B?a0VyQ2NzWWh5UHJsZi9qVXNic0tMRGdJVHR0ZTc3cUU1c25ORlYrakxYK3By?=
 =?utf-8?B?b2ppeGZjTjJ1YXBwOTBFdnQ5ZE9MTXNYTTBDMm51aFRXNTJ2dWpaMUwxQjVu?=
 =?utf-8?B?MnhmZC9nSFg5OEhoRW0zai9DL01UMjE2a3g3MVdVZ00xemFyN3d2cm1CVGFq?=
 =?utf-8?B?N3haaWd1S3o4M25iSWNCT1N0Y0c1cmhPL25MWk5haEhTTHlndDJweDA0ZlFV?=
 =?utf-8?Q?5TtAcKyAaVBSJjY3NMa7oQaWk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 501577fe-babd-4d60-b742-08dcacb21911
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 14:00:10.7970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyJbG7Y6vHDoJh4K6wl75GV3KEPh00r8YvFr4dhIpZwes7SkI1+/btbhLG9EsdzMSh2j890BnJQK56BOEURo0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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

Hi Michal

Thank you for the review comments

On 7/25/2024 4:09 PM, Michal Wajdeczko wrote:
> 
> 
> On 25.07.2024 09:35, Riana Tauro wrote:
>> Coarse Powergating is a power saving technique where Render and Media
>> can be power-gated independently irrespective of the rest of the GT.
>>
>> For debug purposes, it is useful to expose the powergating information.
>>
>> v2: move to debugfs
>>      add details to commit message
>>      add per-slice status for media
>>      define reg bits in descending order (Matt Roper)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++
>>   drivers/gpu/drm/xe/xe_gt_idle.c      | 80 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>>   4 files changed, 101 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 8a94a94d2267..fe774d0894fa 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -336,6 +336,14 @@
>>   #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>>   
>>   #define FORCEWAKE_RENDER			XE_REG(0xa278)
>> +
>> +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
>> +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
>> +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
>> +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
>> +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
>> +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>> +
>>   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>>   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>>   #define FORCEWAKE_GSC				XE_REG(0xa618)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 5e7fd937917a..5ba153aac577 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -15,6 +15,7 @@
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>> +#include "xe_gt_idle.h"
>>   #include "xe_gt_sriov_pf_debugfs.h"
>>   #include "xe_gt_sriov_vf_debugfs.h"
>>   #include "xe_gt_topology.h"
>> @@ -107,6 +108,15 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>>   	return 0;
>>   }
>>   
>> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	xe_pm_runtime_get(gt_to_xe(gt));
>> +	xe_gt_idle_print(gt, p);
> 
> this print function may also return an error

Missed this. Thanks for pointing this. Will fix it
> 
>> +	xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +	return 0;
>> +}
>> +
>>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	xe_pm_runtime_get(gt_to_xe(gt));
>> @@ -277,6 +287,7 @@ static const struct drm_info_list debugfs_list[] = {
>>   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>   	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>>   	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>>   	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>>   	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 67aba4140510..c8dd4b732658 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -145,6 +145,86 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>>   
>> +/**
>> + * xe_gt_idle_print - Xe gt idle print
>> + * @gt: GT object
>> + * @p: drm_printer.
>> + *
>> + * This function prints the powergating information
> 
> missing "Return:"
> 
>> + */
>> +int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 pg_enabled, pg_status;
>> +	u32 vcs_mask, vecs_mask;
>> +	int err;
>> +
>> +	if (xe->info.platform == XE_PVC) {
>> +		drm_printf(p, "Power Gating Enabled: no\n");
>> +		return 0;
>> +	}
>> +
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (err)
>> +		return err;
>> +
>> +	pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
>> +	pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
>> +
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +
>> +	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>> +		drm_printf(p, "Render Power Gating Enabled: %s\n",
>> +			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>> +
>> +		drm_printf(p, "Render Power Gate Status: %s\n",
>> +			   (pg_status & RENDER_AWAKE_STATUS) ? "Up" : "Down");
> 
> FYI: just posted a patch [1] with the helper that could be used here;
> you may want to start with a local variant until that lands in our tree
> 
> [1]
> https://lore.kernel.org/linux-hardening/20240725101841.574-1-michal.wajdeczko@intel.com/
Sure will do this. Else i could also use str_on_off for now.
> 
>> +	}
>> +
>> +	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
>> +	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
>> +
>> +	/* Print media CPG status only if media is present */
>> +	if (vcs_mask || vecs_mask) {
>> +		drm_printf(p, "Media Power Gating Enabled: %s\n",
>> +			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
>> +
>> +		/*
>> +		 * Media Slices
>> +		 *
>> +		 * Slice 0: VCS0, VCS1, VECS0
>> +		 * Slice 1: VCS2, VCS3, VECS1
>> +		 * Slice 2: VCS4, VCS5, VECS2
>> +		 * Slice 3: VCS6, VCS7, VECS3
>> +		 */
>> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0)
>> +					    | BIT(XE_HW_ENGINE_VCS1)
>> +					    | BIT(XE_HW_ENGINE_VECS0)))
>> +			drm_printf(p, "Media Slice0 Power Gate Status: %s\n",
>> +				   (pg_status & MEDIA_SLICE0_AWAKE_STATUS) ? "Up" : "Down");
>> +
>> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS2)
>> +					    | BIT(XE_HW_ENGINE_VCS3)
>> +					    | BIT(XE_HW_ENGINE_VECS1)))
>> +			drm_printf(p, "Media Slice1 Power Gate Status: %s\n",
>> +				   (pg_status & MEDIA_SLICE1_AWAKE_STATUS) ? "Up" : "Down");
>> +
>> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS4)
>> +					    | BIT(XE_HW_ENGINE_VCS5)
>> +					    | BIT(XE_HW_ENGINE_VECS2)))
>> +			drm_printf(p, "Media Slice2 Power Gate Status: %s\n",
>> +				   (pg_status & MEDIA_SLICE2_AWAKE_STATUS) ? "Up" : "Down");
>> +
>> +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS6)
>> +					    | BIT(XE_HW_ENGINE_VCS7)
>> +					    | BIT(XE_HW_ENGINE_VECS3)))
>> +			drm_printf(p, "Media Slice3 Power Gate Status: %s\n",
>> +				   (pg_status & MEDIA_SLICE3_AWAKE_STATUS) ? "Up" : "Down");
> 
> maybe this could be transformed into some loop?
> 
> 	static const struct {
> 		u64 engines;
> 		u32 status;
> 	} slices[] = {
> 		{ BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
> 		  BIT(XE_HW_ENGINE_VECS0), MEDIA_SLICE0_AWAKE_STATUS },
> 		...
> 	};
> 
> 	if (gt->info.engine_mask & slices[n].engines)
> 		drm_printf(p, "Media Slice%u Power Gate Status: %s\n",
> 			n, str_up_down(pg_status & slices[n].status);
> 
>> +	}
>> +
>> +	return 0;
>> +}
Will try this.

Thank you,
Riana
>> +
>>   static ssize_t name_show(struct device *dev,
>>   			 struct device_attribute *attr, char *buff)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 554447b5d46d..4b8192d3aee0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include "xe_gt_idle_types.h"
>>   
>> +struct drm_printer;
>>   struct xe_gt;
>>   
>>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>> +int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p);
>>   
>>   #endif /* _XE_GT_IDLE_H_ */
