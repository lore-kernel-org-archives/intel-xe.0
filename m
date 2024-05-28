Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885B8C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 20:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5FC10E13B;
	Tue, 28 May 2024 20:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ux3hmCBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7965510E13B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 20:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716927487; x=1748463487;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=XbMaaqijgizRBCQmvxn6gE69MwrTgVecumuBOuxTG5s=;
 b=Ux3hmCBP5+XE93YtUESV/xtcxXSeVV3CZfljih1X+tmYJCKRiQQl9+8/
 xLKDLIbDU3BZn37FeagUiKgAWT01Y7AVe/JD2GS+GkZOdsCPK/ueSw8lo
 LqBw6AqHs/b44ejZnEuF12ROL26sTFzu4AoVG3hEso/FGgtlCUvTLnkkt
 N3KraF6qKFt/ZoTnDAiGF+u5GrgpGtUmtrxysVKKHJr9rmbqo4iPM4429
 Qgkop5hLJc0AJYng+idnVkmmCcxC5WxBWDFY/DWmtAJwtVnriOxmGc782
 3WZVmQ+pwgUGQk+PYD94dIMs+9YALf7tlZNRkWMk0hjny3FXiur2Y+Bzy w==;
X-CSE-ConnectionGUID: 2hqUe6b4RlKvuxAvZsTqoA==
X-CSE-MsgGUID: QuYNYN4aR3G6pFKTKR6CCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13466368"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208,217";a="13466368"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 13:18:06 -0700
X-CSE-ConnectionGUID: WxuE6q9GSzGuHiTWi5oO8w==
X-CSE-MsgGUID: +Z/nHHOSSQqqsJmgmH0Zxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208,217";a="35170364"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 13:18:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:18:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:18:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 13:18:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 13:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpNAMn777tnTp6oo3wcTmkdyVYBximJfOYqONGuXqg6P5LDpcwLfVNEiZ5ERKYaBes3800fjKhZRU9EvoV4QFCCdCWFC5CeGC1j6ODE+87vZD6gOwsfn+kBQPUudKar6D0/h0x+HjS4kjAwYYAislguVxpn9LILEKh98UB2kPdkx3p64mgN0De9KWoNp0oOz2ts6DcnoNGjBzu/Rfx9Td2JjLPM1XRKlcUOhMNcA+LpdxdGaWWMKhE+bpIajXq0MVr3FsqAPYK15VRSgUmfjsV0CFL+lIhLdYtIv2yKf/0J0iFhTyayvThADDo2kuQuYekPSDlyP9yJPqzXUYsDk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdK+FlkIK4Oe4b2fYw4F71Tvfr3UZ1rBWBpOTtzhBtM=;
 b=ir+DIytowH5Jc3dd6EkXAmLGY3Ir6Va7+vlS1CaP6yBfrHIAOaNFHhmST5KRjwnR+v5aBRNqT7F79XliIbSMR3ensbowqVl1wLq5vhn/ELMBVap3GOsawLQ0pc3eraIXmubXYzGpO27I1+ZBgDClEs3cz49ZOe00Uml5MmZlNY4cQJ+T5qGN2nJnDjSCVxuLS3tDXdIOi14o+LX5l7tVBAtid/AGRm36QL3sqmwlimfYHsmJe4VCUhmj5iG69SqAICsm7s6PdOHPfT/gfzj4SBG+KChlWSpu3wKYs8qwqxMuzYm0Vk5KV3/cEu7gLYwTY6rBh6yeUihz2RJ0UH4NOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 20:17:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 20:17:31 +0000
Content-Type: multipart/alternative;
 boundary="------------qYacMOpKEWO5WgeXQZSGj0W1"
Message-ID: <11c724b6-46ff-4d31-8ff8-a4ed33707c5b@intel.com>
Date: Tue, 28 May 2024 13:17:26 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Fi?=
 =?UTF-8?Q?x_uninitialised_count_in_GuC_load_debug_prints?=
To: <intel-xe@lists.freedesktop.org>
References: <20240524202603.4011656-1-John.C.Harrison@Intel.com>
 <171681752891.2212767.9432755041532987799@8e613ede5ea5>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <171681752891.2212767.9432755041532987799@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 21172747-66c7-4c40-2b82-08dc7f533439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUJRYndVQVM4YklIdncxQVFBT05YbUd0ZzVmN1JWQ1d0TUsrK2x2M3BlVlBX?=
 =?utf-8?B?ZkVqd0IzekdNN245MFQ5TDQwZ1ZFc1ZDeERLcE5ZQjJVOHM2Kzc2QlUrdkFH?=
 =?utf-8?B?dXBPbTVqNlRRMVRyQUhXb0Y0R3dZT0NONzVzUjhJcmhxWGxBNit6MUhvOWRR?=
 =?utf-8?B?b2FtR0pDZmhLMXRqNml0OHl6ekY1OHZWb29DTUJENmpRNkJuTU5icVk5WmJ3?=
 =?utf-8?B?eVN1R3lSWjNkZjlqdXNuVmdZbFo2Z3ZzUkJyT0phVCt5aDBSWGYwZkRmTFNt?=
 =?utf-8?B?WEE0Q1Z4Njlqeit2bWg0MUx3YUhvRHVJai8zdnVLb1FWbVkvdzZaUFg4L0NU?=
 =?utf-8?B?ZWE2MWc1dWJHeFhHZlc0a0FCNnhXOXJCMlRqeW90K1NwcnVJL0Yyb2R5dUZ0?=
 =?utf-8?B?cHZtVkpjVEkxTnIvOHU1WmNzOGZyN1hhLy8waURNUTRZdWJRYUdEVUVYcEtl?=
 =?utf-8?B?SzNZdkNjVnloOEpuak9CSE1tNmpCNlhaaE9iRk5GbkV0NEtEbUhIcmtRTUJO?=
 =?utf-8?B?RlduNktqclpRQjVKakJ5V1A5ZWpzazEwbjB6ZG9QeXB1Uis0QUxDa1YyVjFW?=
 =?utf-8?B?QmVFZDVwRitBR3RlRXdVbXVrK3NJdEFlZzZWVXlicjJqZlRsWnI0YkdKT1lt?=
 =?utf-8?B?OS9YZ3dlY0lDTFhvK3ZXbmxNY0NlNjcyNEJPZzBhVEpRUHhVWk1Mc0s5ak45?=
 =?utf-8?B?VkdTU2djb0NoSHBiY2swTlNtTzNzaFh6b1h1M0R1UlhnSHQvTjNFeDlRYkF2?=
 =?utf-8?B?c3NyTE5pd3ZUSkdGc3AwK24wOGNKMW5ielJPQkNsU1hZK3AvT1ozc2M0Vysr?=
 =?utf-8?B?OGJNS1ZwM3llaFIybFJtbUpDczN6c0RPeTY4d1Q2TDNpcUw1UmRwQUNZQkNR?=
 =?utf-8?B?RTRjcDc5Wm11K3phbjV0emNYUjdYcGtETEpWN2Y5VkdmdWlNeGJOT2tkMW4y?=
 =?utf-8?B?bFQvdit6Yjhhd0NBb0c5Y1JrY1pCc0VIcHF0SkRIZ2tlY3RDNnQyRXo1SGth?=
 =?utf-8?B?YXdNckxhS0dtSEhCQjlJQUxLandNeWVuM210MXlsN2VHRHlPUndUOTVBazNL?=
 =?utf-8?B?bjlQaWxRcG83dGsvb2E3aGFYaHMvVjJlQjd4SS9OcWE5c29EUWsxT3F2bU4z?=
 =?utf-8?B?NkxtTUo1YWtkcUViUEdEcTBnTmdFZmM4TjRwODBHVHhYdDJ6cGpZNXBlV0Jv?=
 =?utf-8?B?S1FsSkdTOVBHZDdaTEFwRmJNWkVRQS82dzNHWFl3dzZ3ZnVyZ3dsa2tlSEF6?=
 =?utf-8?B?UTgrK1FMOUU1TlVGWkVYVUZ2SDdEeHRyOERvQStDSDRaYWgyWUNnNmJtQ0hy?=
 =?utf-8?B?WGtMUUwxNmZXbVVmYmR0TlE5RjBMZGJyMWVnOEJpQzZPZWtVR2NBMVJkTjlh?=
 =?utf-8?B?R0hYZ2JlVXEyRWdzRjNqemFrQ05mM0dzNVFFNG5hL0tubHBLWXRzME5JSW00?=
 =?utf-8?B?L0hrdzlRRmpqZnQ4OFRWT29xK1ZqRWZQcnFXQ01HVmdlTWN6TlR2N3RSWFZQ?=
 =?utf-8?B?ZS9NaUoybTRQOHBBSmx4ancwM0JFZXlRMUUzVWlvVG1ZcnBoK0lKK053K2k2?=
 =?utf-8?B?cE51eGdJWVkxWDY5cy9BSi9kL1hJSHhvekFzZkhmdWxwclo3cWNLQjVIZ24r?=
 =?utf-8?Q?Lk/SMEbj1AfCTD896TOuRKdB1O9lr84GsTze1YkbLV0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFJTTjVjYXNXZVFsZFI3MStuUkpLOTZ4eUFrT2RCWThobWRMNVlpTGp2Z2lt?=
 =?utf-8?B?UERHV3ZBb3lXMXg1NnhpNU8rUlJGSUlWY2NrWXpnS0kzaGgxYXpJL1BTMXky?=
 =?utf-8?B?RUh3ZTd2bEg3bHhjQ1lDMWRUcElCZ3QxQTVyeHB6YzlLb0IxaXptcnNnUTd1?=
 =?utf-8?B?RUFxUHIzRXozMFV4d2U1QzV5MFUxeVY4R0MxWUI0OXdKWk9LWGxFZ092aHZz?=
 =?utf-8?B?SEl5SVBvWERBSHMzVmxWZVptbnZDY1ppTlF4MG9PS24zV0QzYjF2QkEwUEJ6?=
 =?utf-8?B?QjFFeksxSXpCMDdTL2JEcHlYOUpsL3NIVm1uNktja0k0eWwrYXpSVnRyNnRu?=
 =?utf-8?B?b3gvRWtwWC94bXhma1lUU3BCTGxEWXN3OWtFV0dneFZmTkxOUXRvZUQwVy9o?=
 =?utf-8?B?SzNMMnJPSDVMd1NkZmtaZURuNURYTHRlS1BKN2ZuV1BHb09tdkYwV1hGUUFU?=
 =?utf-8?B?enhjTUcrb0JsZ2FoVmlWSjFyMjAvdTRkRXNHd0Z3NlRRdEZ6d0RlK0V0QjNW?=
 =?utf-8?B?K0tqTkp6YldDZDZtL0NDYWRIclBEVjljazR6RTNOcHppRklycTRLM2NGMVph?=
 =?utf-8?B?YlFhK0N0bXNhc3JmQmZ0cnRlOUF2L05nRjlKYi9hZ2ZYYThFNEFJVGhGMDZv?=
 =?utf-8?B?T3NWT3BMNXJ6RFl0cHV0VHV4ZDFJWGlJQWIxakNlcVhsZGtVVFFXVE9qdlBx?=
 =?utf-8?B?WU9lNmFxcWJXZ0dRSkVoQnJURVRQQi9jMGRFc3liTlhvbW9WTXR3ME50SmpE?=
 =?utf-8?B?VzN4aVRxUE1HcXJsODBseHAzOGF2Nmxiay9XVDkvWTNsL0Znb2Zvd0svMVhU?=
 =?utf-8?B?S3Z0T3RkRWFucDJ4YkZJaHFrVFJzWkhtMjY2em1JajFpaDNWaFZPUUxmYnZU?=
 =?utf-8?B?bDZYanQ2Z0JBUG9WRVgrSS9qTllpSDJvcmdJZ2pXeWF1TVdQOGhxOERzWVRw?=
 =?utf-8?B?aXAxTjBhY01Ba0VZVXNDU2ozTUZtVUtkN0t0SFkxZjhCUUM4anJWL1FvcFZv?=
 =?utf-8?B?M2hSRG1XSmxqeFJMeUJoTHlDS013QjE4cGN2SldqNU5DQ0FhMTk4ZnhzVFpo?=
 =?utf-8?B?ZlRpVkl3VHgzeDVLeWY3UG9ScTFWb2Z2NDRldkE3Rml1RXlPUXdwZHF1NW9K?=
 =?utf-8?B?Q0VUUCtwanpPbWdPY242dmhReENJTlhIcmJYWllGMW04Y1htZXFIRXNKVTlX?=
 =?utf-8?B?T0FSY29QYmdObExxWmR0MitDQ05UWjgzZVZWRkRyTjc3czZZODVCV0pVTWZT?=
 =?utf-8?B?YUZIcTRCY25EQzBxRU1NYmJMdGY4SzZCSnE4QXRUemV0cFVVNk5wb0dBZnJ2?=
 =?utf-8?B?SndkUGNhMS8xS0RQcG1EaWhlWHFlbk9XbllwUTFLeWpWc3dTSnRpODNYYjVE?=
 =?utf-8?B?Z1lyNlVoc2RzMjZORTdCVWlYLzZXVWVRaDFzSUFmVEZUTnp6SFhkd1NKTTMx?=
 =?utf-8?B?dERoT2hkT1FQaGRielhWY3I0MkU5TEtQZmpPUTVIRjV3R0xpUW94endyRWJu?=
 =?utf-8?B?VlgvRU1RaXhHV1JjZjFUUHpDNnluWXlVSjZQVHJlT0ZPUk83bGtqMHZmdkFz?=
 =?utf-8?B?Z0ZjSGgxRy8rclBPY0wycFFOK0RXWllLY2RQTVpMRzdFRjBUY004SGpmQjRV?=
 =?utf-8?B?L3VVNUxpaVVwdVFLK2JSTDlmRGcvbTcxY0VhNnp5QTBhZCtkVnJhVCtPSWdB?=
 =?utf-8?B?azRmT1RlVUVYR1B4TkdENmc1N3E1OTdJWmp3bUpsNmxnUWN0ZFNRN0lxRG1I?=
 =?utf-8?B?VVVVQzk4V2h1M3RIYXZSSEg5ekUwS2lwQkFTK0ZIdGdxcTMxTkMrL1hxWmFQ?=
 =?utf-8?B?UG1pQ2pDMlVNbk0zWnZkRTZ5WklVMTBEMmY1ZTZOMWg0Q3FDa2FoOFp3NTRE?=
 =?utf-8?B?Q0tvQlkva1F0ZGtBVlFJaklIdktpYU9IUysreW84bEVkNVgvOUU2STBmamly?=
 =?utf-8?B?RitpelFkdDN0eStrVElCMzVPd1RONFlONXVWbGMzZTBXUlNJcHhScFEvRXRI?=
 =?utf-8?B?T2xrV0k1RW1mck9vcGF4anFzTkRsR0NPbFovK0FKTlNXWUJmSWdZSDd6RytX?=
 =?utf-8?B?SWR4cDg1UGhtRnhVNnFhWVB4aENhcjZ4cmhRNmw2dHBiV0xhakluSW1BMmc1?=
 =?utf-8?B?T1R0Tng1ZmxGYWVESmtxcjdGeXpGdmx3cnFFMUUwUk9uaUtsWHpzQWJobkNh?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21172747-66c7-4c40-2b82-08dc7f533439
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 20:17:31.8644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66Yp+FT38ACM7zVZJZx7iUh7IK/8Uxkd4b0fcx1athXoeb5pd0ObFyKHWC8GEcnzuBAGMvh6+j9FJV0i8oPCGSMX98ktl3iyq7AgpMBvVc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
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

--------------qYacMOpKEWO5WgeXQZSGj0W1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/2024 06:45, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/guc: Fix uninitialised count in GuC load debug prints
> *URL:* 	https://patchwork.freedesktop.org/series/134032/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f_full ->
>   xe-pw-134032v1_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-134032v1_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-134032v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-134032v1_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html>
>
This failure is not related to a patch which only changes debug prints.

John.

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>
>       o {shard-lnl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html>
>  *
>
>     igt@kms_psr2_sf:
>
>       o {shard-lnl}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-6/igt@kms_psr2_sf.html>
>  *
>
>     igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
>
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html>
>         +1 other test incomplete
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o {shard-lnl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-134032v1_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +8
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +62
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +25
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +38
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3
>         other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html>
>         (Intel XE#1152
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_content_protection@content-type-change.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +15
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_edge_walk@128x128-right-edge:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_cursor_edge_walk@128x128-right-edge.html>
>         (Intel XE#581
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/581>)
>  *
>
>     igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +3
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>  *
>
>     igt@kms_cursor_legacy@forked-move@pipe-a:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-a.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +3
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@torture-move@pipe-a:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-436/igt@kms_cursor_legacy@torture-move@pipe-a.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_flip@2x-absolute-wf_vblank.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +5
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-9/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>         +32 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +15
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +12
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +35
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +15
>         other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>)
>  *
>
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-436/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html>
>         (Intel XE#1939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939>) +2
>         other tests abort
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#829
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/829>) +5
>         other tests skip
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) +1
>         other test fail
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_pm_backlight@fade.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_rpm@basic-rte:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html>
>         (Intel XE#1203
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203>)
>  *
>
>     igt@kms_prop_blob@blob-prop-validate:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_prop_blob@blob-prop-validate.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#780
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/780>)
>  *
>
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-move:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +11
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +10
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +3
>         other tests fail
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_vblank@query-forked-hang:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_vblank@query-forked-hang.html>
>         (Intel XE#1939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939>) +1
>         other test abort
>  *
>
>     igt@kms_vblank@query-forked-hang@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_vblank@query-forked-hang@pipe-a-dp-4.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +4
>         other tests dmesg-warn
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@kms_vrr@flip-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +9
>         other tests skip
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_ccs@block-copy-compressed:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x369:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_evict@evict-cm-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) +1
>         other test timeout
>  *
>
>     igt@xe_evict@evict-small-multi-vm-cm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-threads-large-multi-vm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_evict@evict-threads-large-multi-vm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@many-bindexecqueue-rebind:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@xe_exec_basic@many-bindexecqueue-rebind.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html>
>         (Intel XE#1939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +23
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_dma_buf:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_mmap@vram:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_mmap@vram.html>
>         (Intel XE#1008
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_module_load@unload:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@xe_module_load@unload.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@xe_module_load@unload.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>  *
>
>     igt@xe_pat@display-vs-wb-transient:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html>
>         (Intel XE#827
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html>
>         +1 other test pass
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html>
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-64x64:
>
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-64x64.html>
>         (Intel XE#1908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908> /
>         Intel XE#1939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-64x64.html>
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> /
>         Intel XE#910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>  *
>
>     igt@kms_cursor_legacy@forked-bo@all-pipes:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html>
>         +5 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#480
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/480> /
>         Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html>
>         (Intel XE#1939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html>
>         +5 other tests pass
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pm_rpm@modeset-stress-extra-wait:
>
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes@plane-59:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-59.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_pm_rpm@universal-planes@plane-59.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes@plane-68:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_pm_rpm@universal-planes@plane-68.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_pm_rpm@universal-planes@plane-68.html>
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html>
>         (Intel XE#1939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html>
>         +4 other tests pass
>  *
>
>     igt@xe_exec_threads@threads-bal-mixed-fd-basic:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html>
>         (Intel XE#1908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908> /
>         Intel XE#1939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html>
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html>
>         (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html>
>  *
>
>     igt@xe_gt_freq@freq_reset_multiple:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@xe_gt_freq@freq_reset_multiple.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_gt_freq@freq_reset_multiple.html>
>         +2 other tests pass
>  *
>
>     igt@xe_live_ktest@xe_mocs:
>
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs.html>
>         (Intel XE#1553
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html>
>  *
>
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html>
>  *
>
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit:
>
>       o {shard-lnl}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +55
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +15
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html>
>         (Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +34
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +11
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-edge:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-edge.html>
>         (Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-edge.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html>
>         (Intel XE#282
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +5
>         other tests dmesg-warn
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) +3
>         other tests dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +16
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +12
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +11
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-rte.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-rte.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +15
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html>
>         (Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html>
>         (Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html>
>         (Intel XE#305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +8
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#734
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/734>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>)
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr@fbc-pr-no-drrs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +10
>         other tests skip
>  *
>
>     igt@kms_psr@psr-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_psr@psr-dpms.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_psr@psr-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +9
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x369:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x369:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_exec_fault_mode@once-rebind-prefetch:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +14
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_reset@cm-cat-error:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html>
>         (Intel XE#358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>)
>  *
>
>     igt@xe_live_ktest@xe_dma_buf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-9/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@d3hot-mmap-vram:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1948
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_pm@s2idle-basic-exec:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>)
>  *
>
>     igt@xe_pm@s2idle-vm-bind-userptr:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694>)
>  *
>
>     igt@xe_pm@s3-mocs:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_pm@s3-mocs.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@xe_pm@s3-mocs.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +1
>         other test dmesg-warn
>  *
>
>     igt@xe_pm@s3-vm-bind-unbind-all:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1941
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1941
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>)
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1941
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>)
>  *
>
>     igt@xe_pm_residency@gt-c6-freeze:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1349
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html>
>         (Intel XE#1191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> /
>         Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1941
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>)
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f ->
>     xe-pw-134032v1
>
> IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f: 
> 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f
> xe-pw-134032v1: 134032v1
>

--------------qYacMOpKEWO5WgeXQZSGj0W1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    On 5/27/2024 06:45, Patchwork wrote:<br>
    <blockquote type=3D"cite" cite=3D"mid:171681752891.2212767.943275504153=
2987799@8e613ede5ea5">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/guc: Fix uninitialised count in GuC load debug
              prints</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/134032/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/134032/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
134032v1/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f_full -&gt;
        xe-pw-134032v1_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-134032v1_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-134032v1_full, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-134032v1_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbc-modesetfrombusy.html" moz-do-not-send=3D"tru=
e">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-134032v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.h=
tml" moz-do-not-send=3D"true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    This failure is not related to a patch which only changes debug
    prints.<br>
    <br>
    John.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:171681752891.2212767.943275504153=
2987799@8e613ede5ea5">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms=
_chamelium_hpd@hdmi-hpd-storm-disable.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz=
-do-not-send=3D"true">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-2/igt@kms_chamelium_hpd@hd=
mi-hpd-storm-disable.html" moz-do-not-send=3D"true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf:</p>
          <ul>
            <li>{shard-lnl}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-6/igt@kms_psr2_sf.html" moz-do=
-not-send=3D"true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-sy=
stem:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-5/igt@xe_=
ccs@suspend-resume@linear-compressed-compfmt0-system-system.html" moz-do-no=
t-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-134032v1/shard-lnl-4/igt@xe_ccs@suspend-resume@linear-compre=
ssed-compfmt0-system-system.html" moz-do-not-send=3D"true">INCOMPLETE</a> +=
1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>{shard-lnl}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.h=
tml" moz-do-not-send=3D"true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-134032v1_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp=
-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Int=
el XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_big_fb@x-tiled-=
8bpp-rotate-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316" moz-do-not-send=3D"true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp=
-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/316" moz-do-not-send=3D"true">Intel XE#316</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip=
:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_big_fb@y-tiled-=
max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" =
moz-do-not-send=3D"true">Intel XE#1124</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#12=
01</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_ccs@bad-aux-str=
ide-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787<=
/a>) +62 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_ccs@bad-pixel-f=
ormat-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" m=
oz-do-not-send=3D"true">Intel XE#787</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format=
-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-se=
nd=3D"true">Intel XE#787</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-h=
dmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_ccs@crc-primary-basi=
c-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#7=
87</a>) +38 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_cdclk@mode-tran=
sition@pipe-c-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send=3D"tru=
e">Intel XE#314</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_cdclk@plane-sca=
ling@pipe-b-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1152" moz-do-not-send=3D"true=
">Intel XE#1152</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_chamelium_color@ctm-=
blue-to-red.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306" moz-do-not-send=3D"true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_chamelium_color=
@ctm-red-to-blue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306" moz-do-not-send=3D"true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd=
-storm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
373" moz-do-not-send=3D"true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_chamelium_hpd@h=
dmi-hpd-after-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +3 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_content_protection@c=
ontent-type-change.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_content_protection@d=
p-mst-lic-type-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/307" moz-do-not-send=3D"true">Intel XE#307</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_cursor_crc@curs=
or-rapid-movement-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/308" moz-do-not-send=3D"true">Intel XE#308</a>) +1 othe=
r test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_cursor_edge_wal=
k@128x128-right-edge.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/581" moz-do-not-send=3D"t=
rue">Intel XE#581</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-6:</p=
>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@kms_cursor_edge_wal=
k@256x256-left-edge@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214=
" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel XE#2=
82</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_cursor_legacy@2x-fli=
p-vs-cursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/309" moz-do-not-send=3D"true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-si=
ze:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_cursor_legacy@b=
asic-busy-flip-before-cursor-varying-size.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send=3D"true">Intel XE#3=
23</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_cursor_legacy@cursor-vs-flip-toggle.html" moz-do-not-send=3D"true">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134=
032v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html" moz-d=
o-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a>) +=
1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-134032v1/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic=
-transitions.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"tr=
ue">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/282" moz-do-not-send=3D"true">Intel XE#282</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/910" moz-do-not-send=3D"tr=
ue">Intel XE#910</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/ig=
t@kms_cursor_legacy@forked-move@pipe-a.html" moz-do-not-send=3D"true">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032=
v1/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-a.html" moz-do-not-=
send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-se=
nd=3D"true">Intel XE#282</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_cursor_legacy@short-=
busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send=3D"true">Intel XE#=
323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/ig=
t@kms_cursor_legacy@torture-move@pipe-a.html" moz-do-not-send=3D"true">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13403=
2v1/shard-dg2-436/igt@kms_cursor_legacy@torture-move@pipe-a.html" moz-do-no=
t-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-=
send=3D"true">Intel XE#877</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_feature_discove=
ry@display-3x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703" moz-do-not-send=3D"true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_feature_discovery@ps=
r2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1135" moz-do-not-send=3D"true">Intel XE#113=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_flip@2x-absolute-wf_=
vblank.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
310" moz-do-not-send=3D"true">Intel XE#310</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_flip@flip-vs-su=
spend@a-hdmi-a6.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1162" moz-do-not-send=3D=
"true">Intel XE#1162</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms=
_flip@plain-flip-fb-recreate@b-hdmi-a1.html" moz-do-not-send=3D"true">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032=
v1/shard-adlp-9/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html" moz-do-=
not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a>) +1 =
other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-dow=
nscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_flip_scaled_crc=
@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +32 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt=
:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@drrs-1p-primscrn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" m=
oz-do-not-send=3D"true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@drrs-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-=
do-not-send=3D"true">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_frontbuffer_tracking=
@fbcdrrs-rgb565-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-=
send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>) +12 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw=
-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_frontbuffer_tracking=
@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#=
653</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@fbcpsr-rgb565-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-no=
t-send=3D"true">Intel XE#653</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-cur-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"true">Intel XE#656<=
/a>) +35 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_frontbuffer_tra=
cking@psr-slowdraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653" moz-do-not-send=3D"true">Intel XE#653</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_hdmi_inject@inject-a=
udio.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
7" moz-do-not-send=3D"true">Intel XE#417</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html" moz-do-not-send=3D"=
true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-134032v1/shard-dg2-436/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-=
nv12.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1939" moz-do-not-send=3D"true">Intel XE#=
1939</a>) +2 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_pipe_crc_basic@=
nonblocking-crc-frame-sequence.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-no=
t-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/829" moz-do-not-send=3D"true">Intel XE#829</a>) +5 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_plane@plane-panning-=
bottom-right-suspend.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-se=
nd=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not=
-send=3D"true">Intel XE#1608</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_plane@plane-panning-=
bottom-right-suspend@pipe-a.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do=
-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_plane@plane-panning-=
bottom-right-suspend@pipe-b.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do=
-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1608" moz-do-not-send=3D"true">Intel XE#1608</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_plane_scaling@intel-=
max-src-size@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361" moz-do-not-s=
end=3D"true">Intel XE#361</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_pm_backlight@fade.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-=
do-not-send=3D"true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-rte:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms=
_pm_rpm@basic-rte.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@k=
ms_pm_rpm@basic-rte.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1203" moz-do-not-send=3D"t=
rue">Intel XE#1203</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prop_blob@blob-prop-validate:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@kms_prop_blob@blob-=
prop-validate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/780" moz-do-not-send=3D"true">Intel XE#780</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_psr2_sf@primary-plan=
e-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"=
true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p0=
10.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1122" moz-do-not-send=3D"true">Intel XE#112=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-=
plane-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_psr@fbc-psr2-pr=
imary-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-tiling:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_rotation_crc@bad-til=
ing.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/327=
" moz-do-not-send=3D"true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_rotation_crc@multipl=
ane-rotation-cropping-bottom.html" moz-do-not-send=3D"true">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-=
send=3D"true">Intel XE#1874</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_rotation_crc@pr=
imary-y-tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-se=
nd=3D"true">Intel XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_rotation_crc@primary=
-yf-tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=3D=
"true">Intel XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-hang:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_vblank@query-fo=
rked-hang.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1939" moz-do-not-send=3D"true">Inte=
l XE#1939</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-hang@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@kms_vblank@query-fo=
rked-hang@pipe-a-dp-4.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-s=
end=3D"true">Intel XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_vblank@ts-conti=
nuation-dpms-suspend.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162" moz-do-not-se=
nd=3D"true">Intel XE#1162</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>) +4 ot=
her tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@kms_vrr@flip-dpms.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz=
-do-not-send=3D"true">Intel XE#455</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_writeback@writeback-=
check-output-xrgb2101010.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-434/igt@sriov_basic@enable-=
vfs-autoprobe-off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send=3D"tru=
e">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@block-copy-compressed:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@xe_ccs@block-copy-compre=
ssed.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5" moz-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/488" moz-do-not-send=3D"true">Intel XE#4=
88</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@xe_copy_basic@mem-c=
opy-linear-0xfd.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send=3D"true"=
>Intel XE#1123</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_copy_basic@mem-set-li=
near-0x369.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send=3D"true">Inte=
l XE#1126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-cm-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_evict@evict-cm-t=
hreads-large.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"tr=
ue">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@xe_evict@evict-mixe=
d-threads-large.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"tr=
ue">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/392" moz-do-not-send=3D"true">Intel XE#392</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-multi-vm-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_evict@evict-small-mul=
ti-vm-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/261" moz-do-not-send=3D"true">Intel XE#261</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel =
XE#688</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large-multi-vm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_evict@evict-threads-l=
arge-multi-vm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/261" moz-do-not-send=3D"true">Intel XE#261</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@xe_=
exec_basic@many-bindexecqueue-rebind.html" moz-do-not-send=3D"true">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1=
/shard-adlp-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html" moz-do-not-=
send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1939" moz-do-not-send=3D"true">Intel XE#1939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_exec_basic@multigpu-m=
any-execqueues-many-vm-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not=
-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel XE#1392</a>) +6=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_exec_fault_mode@=
many-bindexecqueue-userptr-rebind.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-=
not-send=3D"true">Intel XE#288</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-r=
ebind-prefetch:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_exec_fault_mode@many-=
execqueues-bindexecqueue-userptr-rebind-prefetch.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Int=
el XE#288</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@xe_exec_fault_mode@=
many-execqueues-userptr-invalidate-imm.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288<=
/a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_dma_buf:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1192" moz-do-not-send=3D"true">Intel XE#1192<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@vram:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_mmap@vram.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1008" moz-do-not-send=3D"true">Intel XE#1008</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@unload:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@xe_=
module_load@unload.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@=
xe_module_load@unload.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-s=
end=3D"true">Intel XE#1214</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@display-vs-wb-transient:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@xe_pat@display-vs-w=
b-transient.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1337" moz-do-not-send=3D"true">Intel XE#1337</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_=
pm@s4-vm-bind-unbind-all.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-=
9/igt@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send=3D"true">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-d=
o-not-send=3D"true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@xe_=
pm_residency@toggle-gt-c6.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp=
-8/igt@xe_pm_residency@toggle-gt-c6.html" moz-do-not-send=3D"true">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/958" moz-d=
o-not-send=3D"true">Intel XE#958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-hwconfig:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_query@multigpu-query-=
hwconfig.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/944" moz-do-not-send=3D"true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-433/igt@xe_query@multigpu-q=
uery-uc-fw-version-huc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#944</a>) +1 other =
test
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/ig=
t@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html" moz-do-not-se=
nd=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/827" moz-do-not-send=3D"true">Intel XE#827</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@=
kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html" moz-do-not-send=
=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hd=
mi-a-1-y:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms=
_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html" moz-d=
o-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033" moz-do-not-send=3D"true">Intel XE#1033</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do=
-not-send=3D"true">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/igt@kms_async_flips@async=
-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html" moz-do-not-send=3D"true=
">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms=
_cursor_crc@cursor-offscreen-64x64.html" moz-do-not-send=3D"true">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908" moz-=
do-not-send=3D"true">Intel XE#1908</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1939" moz-do-not-send=3D"true">Intel XE#1939</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032=
v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-64x64.html" moz-do-not-s=
end=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/ig=
t@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html" moz-do-not-send=3D"=
true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"tr=
ue">Intel XE#282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/910" moz-do-not-send=3D"true">Intel XE#910</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt=
@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html" moz-do-not-send=3D"t=
rue">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_cursor_legacy@forked-bo@all-pipes.html" moz-do-not-send=3D"true">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel =
XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-134032v1/shard-dg2-436/igt@kms_cursor_legacy@forked-bo@all-pipes.html" mo=
z-do-not-send=3D"true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms=
_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send=3D"tru=
e">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/480" moz-do-not-send=3D"true">Intel XE#480</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send=3D"true">Intel X=
E#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-134032v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible=
.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:<=
/p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms=
_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/886" moz-do-not-send=3D"true">Intel XE#886</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-7/igt@kms_=
flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html" moz-do-not-send=
=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p=
>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-6/igt@kms=
_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html" moz-do-not-send=
=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1939" moz-do-not-send=3D"true">Intel XE#1939</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-lnl-4/igt@k=
ms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html" moz-do-not-send=
=3D"true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/ig=
t@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html" moz-do-not-send=3D=
"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/361" moz-do-not-send=3D"true">Intel XE#361</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-464/igt@kms_p=
lane_scaling@intel-max-src-size@pipe-a-dp-4.html" moz-do-not-send=3D"true">=
PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@kms=
_pm_rpm@modeset-stress-extra-wait.html" moz-do-not-send=3D"true">INCOMPLETE=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13403=
2v1/shard-lnl-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html" moz-do-not-s=
end=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_pm_rpm@universal-planes@plane-59.html" moz-do-not-send=3D"true">ABORT=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13403=
2v1/shard-dg2-432/igt@kms_pm_rpm@universal-planes@plane-59.html" moz-do-not=
-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes@plane-68:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_pm_rpm@universal-planes@plane-68.html" moz-do-not-send=3D"true">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
214" moz-do-not-send=3D"true">Intel XE#1214</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_pm_rp=
m@universal-planes@plane-68.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecque=
ue-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebi=
nd.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1939" moz-do-not-send=3D"true">Intel XE#19=
39</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
4032v1/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bin=
dexecqueue-userptr-rebind.html" moz-do-not-send=3D"true">PASS</a> +4 other =
tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@xe_exec_threads@threads-bal-mixed-fd-basic.html" moz-do-not-send=3D"true"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1908" moz-do-not-send=3D"true">Intel XE#1908</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1939" moz-do-not-send=3D"true">Intel=
 XE#1939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-134032v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-basic.h=
tml" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-434/ig=
t@xe_exec_threads@threads-hang-fd-userptr-invalidate.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1081" moz-do-not-send=3D"true">Intel XE#1081</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-435/igt@=
xe_exec_threads@threads-hang-fd-userptr-invalidate.html" moz-do-not-send=3D=
"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_reset_multiple:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@xe_=
gt_freq@freq_reset_multiple.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do=
-not-send=3D"true">Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_gt_freq@freq_reset=
_multiple.html" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_=
live_ktest@xe_mocs.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1553" moz-do-not-send=3D"t=
rue">Intel XE#1553</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-134032v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html" moz-do-n=
ot-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_=
live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html" moz-do-not-send=3D"true"=
>ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-134032v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.h=
tml" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kunit:</p>
          <ul>
            <li>{shard-lnl}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-lnl-3/igt@xe_=
live_ktest@xe_mocs@xe_live_mocs_reset_kunit.html" moz-do-not-send=3D"true">=
DMESG-FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-134032v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_reset_kuni=
t.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/623" moz-do-not-send=3D"true">Intel=
 XE#623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-134032v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/623" moz-do-not-send=3D"true">Intel XE#623</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_big_fb@x-tiled-16bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz=
-do-not-send=3D"true">Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_big_fb@x-tiled=
-16bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tru=
e">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316" moz-do-not-send=3D"true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Intel XE#316</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v=
1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316" moz-do-not-send=3D"true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-as=
ync-flip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@kms=
_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-d=
o-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1231" moz-do-not-send=3D"true">Intel XE#1231</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-ad=
lp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#=
324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_big_fb@y-tiled-addfb.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do-not-sen=
d=3D"true">Intel XE#619</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do=
-not-send=3D"true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/=
igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_big_fb@yf-tiled-64bpp-rotate-90.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" mo=
z-do-not-send=3D"true">Intel XE#1124</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1340=
32v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a>) +5 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_big_fb@yf-tiled-addfb-size-overflow.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send=3D"true">Intel XE#6=
10</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
4032v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/610" moz-do-not-send=3D"true">Intel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_bw@linear-tiling-1-displays-1920x1080p.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">Intel X=
E#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-134032v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>) +2=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true=
">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pi=
pe-a-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">In=
tel XE#787</a>) +55 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true=
">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@k=
ms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Inte=
l XE#787</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1252" moz-do-not-send=3D"true">=
Intel XE#1252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-134032v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tile=
d-xe2-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1252" moz-do-not-send=3D"true">Intel=
 XE#1252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe=
-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/sh=
ard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-=
c-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55" moz-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#=
787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
34032v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-n=
ot-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +9 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_chamelium_color@ctm-0-25.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-no=
t-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#306</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shar=
d-dg2-432/igt@kms_chamelium_color@ctm-0-25.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306=
" moz-do-not-send=3D"true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_chamelium_edid@dp-edid-stress-resolution-4k.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373" moz-do-not-send=3D"true">Intel XE#373</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_ch=
amelium_edid@dp-edid-stress-resolution-4k.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#3=
73</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_chamelium_hpd@vga-hpd-for-each-pipe.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#3=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
4032v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +4 other=
 tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
 moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#45=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134=
032v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +11 other =
tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms=
_cursor_crc@cursor-suspend.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-=
not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/927" moz-do-not-send=3D"true">Intel XE#927</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/sh=
ard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html" moz-do-not-send=3D"true"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">=
Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1608" moz-do-not-send=3D"true">Intel XE#1608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@kms=
_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1195" moz-do-not-send=3D"true">Intel XE#1195</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_cu=
rsor_crc@cursor-suspend@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel=
 XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1608" moz-do-not-send=3D"true">Intel XE#1608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_cursor_edge_walk@256x256-top-edge.html" moz-do-not-send=3D"true">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
282" moz-do-not-send=3D"true">Intel XE#282</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_cursor=
_edge_walk@256x256-top-edge.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do=
-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">Intel XE#282</a>) =
+2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_cursor_legacy@cursor-vs-flip-varying-size.html" moz-do-not-send=3D"tr=
ue">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true=
">Intel XE#282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varyi=
ng-size.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/282" moz-do-not-send=3D"true">In=
tel XE#282</a>) +5 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@mst-extended-mode-negative:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_display_modes@mst-extended-mode-negative.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/307" moz-do-not-send=3D"true">Intel XE#307</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_displ=
ay_modes@mst-extended-mode-negative.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-=
do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/307" moz-do-not-send=3D"true">Intel XE#307</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not=
-send=3D"true">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-form=
ats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
" moz-do-not-send=3D"true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html" moz-do-not-send=3D"true"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1162" moz-do-not-send=3D"true">Intel XE#1162</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">=
Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-134032v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-=
dp4.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1162" moz-do-not-send=3D"true">Intel=
 XE#1162</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms=
_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html" moz-do-not-send=3D"true=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true"=
>Intel XE#1214</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-134032v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@=
b-hdmi-a1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-send=3D"true"=
>Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not-send=3D"tr=
ue">Intel XE#1608</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-sen=
d=3D"true">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-=
send=3D"true">Intel XE#651</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"=
 moz-do-not-send=3D"true">Intel XE#651</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_frontbuffe=
r_tracking@fbcdrrs-1p-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>) +12 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653" moz-do-not-send=3D"true">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/=
igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-sen=
d=3D"true">Intel XE#653</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@psr-1p-rte.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" mo=
z-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032=
v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-rte.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/653" moz-do-not-send=3D"true">Intel XE#653</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifie=
rs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498" moz-do-not-sen=
d=3D"true">Intel XE#498</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-modifiers.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-n=
ot-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498" moz-do-n=
ot-send=3D"true">Intel XE#498</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifie=
rs@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-=
a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/498" moz-do-not-send=3D"true">Intel XE#498=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1340=
32v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-m=
odifiers@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/498" moz-do-not-send=3D"true">Intel XE#498</a>) +2 othe=
r tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi=
-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/305" moz-do-not-s=
end=3D"true">Intel XE#305</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg=
2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/305" moz-do-not-send=3D"true">Intel XE#305</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do=
-not-send=3D"true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-fac=
tor-0-25@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c=
-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/305" moz-do-not-send=3D"true">Intel XE#305</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@kms_pla=
ne_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/305" moz-do-not-send=3D"true">Intel XE#305</a=
>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@kms=
_pm_dc@dc9-dpms.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send=3D"true"=
>Intel XE#1204</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-134032v1/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/734" moz-do-not-send=3D"tru=
e">Intel XE#734</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-4/igt@kms=
_pm_rpm@modeset-non-lpsp.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/836" moz-do-not-send=3D"true">Intel XE#836</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-ad=
lp-8/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1211" moz-do-not-send=3D"true">Intel XE#1211<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-d=
o-not-send=3D"true">Intel XE#1122</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v=
1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122" moz-do-not-send=3D"true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-no-drrs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_psr@fbc-pr-no-drrs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929" moz-do-not-send=3D"true">Intel XE#929</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg=
2-432/igt@kms_psr@fbc-pr-no-drrs.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-n=
ot-send=3D"true">Intel XE#929</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_psr@psr-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"tru=
e">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_psr@psr-dpms.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"tru=
e">Intel XE#929</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send=3D"true">Inte=
l XE#327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-134032v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-9=
0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/327" moz-do-not-send=3D"true">Intel XE#327</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-433/ig=
t@kms_tiled_display@basic-test-pattern.html" moz-do-not-send=3D"true">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729" m=
oz-do-not-send=3D"true">Intel XE#1729</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-463/igt@kms_tiled_displ=
ay@basic-test-pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/362" moz-do-not-send=3D"true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756" moz-do-not-send=3D"true">Intel XE#756</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@kms_w=
riteback@writeback-check-output-xrgb2101010.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE=
#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@xe_compute_preempt@compute-preempt.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1280" moz-do-not-send=3D"true">Intel XE#1280<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" m=
oz-do-not-send=3D"true">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-432/igt@xe_compute_preem=
pt@compute-preempt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send=3D"tr=
ue">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@xe_copy_basic@mem-copy-linear-0x369.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" mo=
z-do-not-send=3D"true">Intel XE#1123</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1340=
32v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123" moz-do-not-send=3D"true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@xe_copy_basic@mem-set-linear-0x369.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz=
-do-not-send=3D"true">Intel XE#1126</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_copy_basic@mem=
-set-linear-0x369.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send=3D"tru=
e">Intel XE#1126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@xe_exec_fault_mode@once-rebind-prefetch.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#2=
88</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
4032v1/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</a>) +14 othe=
r tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@xe_exec_fault_mode@twice-userptr-invalidate-race.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/288" moz-do-not-send=3D"true">Intel XE#288</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_ex=
ec_fault_mode@twice-userptr-invalidate-race.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE=
#288</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-cat-error:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_=
exec_reset@cm-cat-error.html" moz-do-not-send=3D"true">DMESG-FAIL</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-=
adlp-1/igt@xe_exec_reset@cm-cat-error.html" moz-do-not-send=3D"true">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
8" moz-do-not-send=3D"true">Intel XE#358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_dma_buf:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@xe_live_ktest@xe_dma_buf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192" moz-do-not-se=
nd=3D"true">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1192" moz-do-not-send=3D"true">Intel XE#1192</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@xe_pm@d3cold-basic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/366" moz-do-not-send=3D"true">Intel XE#366</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg=
2-432/igt@xe_pm@d3cold-basic-exec.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-=
not-send=3D"true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-system:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-436/ig=
t@xe_pm@d3cold-mmap-system.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/366" moz-do-not-send=3D"true">Intel XE#366</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-dg=
2-433/igt@xe_pm@d3cold-mmap-system.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-d=
o-not-send=3D"true">Intel XE#1201</a>)</li>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_=
pm@d3cold-mmap-system.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366" moz-do-not-send=3D"true">Intel XE#366</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-9/=
igt@xe_pm@d3cold-mmap-system.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-=
send=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-mmap-vram:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-8/igt@xe_=
pm@d3hot-mmap-vram.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1948" moz-do-not-send=3D"true">Intel XE#1948</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-8/i=
gt@xe_pm@d3hot-mmap-vram.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_=
pm@s2idle-basic-exec.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191" moz-do-not-se=
nd=3D"true">Intel XE#1191</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608" moz-do-not=
-send=3D"true">Intel XE#1608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-134032v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.h=
tml" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1=
195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
58" moz-do-not-send=3D"true">Intel XE#1358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/927" moz-do-not-send=3D"true">Intel XE=
#927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-6/igt@xe_=
pm@s2idle-vm-bind-userptr.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-n=
ot-send=3D"true">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1608" moz-do-not-send=3D"true">Intel XE#1608</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/s=
hard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html" moz-do-not-send=3D"true"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1195" moz-do-not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1694" moz-do-not-send=3D"true">=
Intel XE#1694</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-mocs:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-9/igt@xe_=
pm@s3-mocs.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true=
">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-134032v1/shard-adlp-8/igt@xe_pm@s3-mocs.html" moz-do-not-send=3D=
"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1214" moz-do-not-send=3D"true">Intel XE#1214</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send=3D"true">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162" moz-=
do-not-send=3D"true">Intel XE#1162</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1941" moz-do-not-send=3D"true">Intel XE#1941</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032=
v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html" moz-do-not-send=3D"t=
rue">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1162" moz-do-not-send=3D"true">Intel XE#1162</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"tr=
ue">Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1941" moz-do-not-send=3D"true">Intel XE#1941</a>)</li>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_=
pm@s3-vm-bind-unbind-all.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-no=
t-send=3D"true">Intel XE#1195</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-134032v1/shard-adlp-4/igt@xe_pm@s3-vm-bind-unbind-=
all.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">Intel=
 XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1941" moz-do-not-send=3D"true">Intel XE#1941</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@gt-c6-freeze:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-1/igt@xe_=
pm_residency@gt-c6-freeze.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-n=
ot-send=3D"true">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1349" moz-do-not-send=3D"true">Intel XE#1349</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/s=
hard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html" moz-do-not-send=3D"true"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1191" moz-do-not-send=3D"true">Intel XE#1191</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1214" moz-do-not-send=3D"true">=
Intel XE#1214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1941" moz-do-not-send=3D"true">Intel XE#1941</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-464/ig=
t@xe_query@multigpu-query-engines.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do=
-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#944</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134032v1/s=
hard-dg2-432/igt@xe_query@multigpu-query-engines.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/944" moz-do-not-send=3D"true">Intel XE#944</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-hwconfig:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-432/ig=
t@xe_query@multigpu-query-hwconfig.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do=
-not-send=3D"true">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-134032v1/shard-dg2-466/igt@xe_query@multigpu-que=
ry-hwconfig.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944" moz-do-not-send=3D"true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-adlp-2/igt@xe_=
query@multigpu-query-topology-l3-bank-mask.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#=
944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
34032v1/shard-adlp-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a>)<=
/li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f/shard-dg2-463/ig=
t@xe_query@multigpu-query-topology-l3-bank-mask.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Inte=
l XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-134032v1/shard-dg2-434/igt@xe_query@multigpu-query-topology-l3-bank-mas=
k.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201=
</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f
          -&gt; xe-pw-134032v1</li>
      </ul>
      <p>IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-1341-573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f:
        573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f<br>
        xe-pw-134032v1: 134032v1</p>
    </blockquote>
    <br>
  </body>
</html>

--------------qYacMOpKEWO5WgeXQZSGj0W1--
