Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA84D65559
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 12:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A62510E2EE;
	Wed, 17 Dec 2025 12:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MogrWqmd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1646A10E2EE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765974291; x=1797510291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wuZJHUdPGhv1HSK1yRfcbbvlgvRDFbq9V88iff8dr1o=;
 b=MogrWqmduxjLxwmnPqTreYkmtYOy8q2eH6iNIgqOfOhfMaPxgNf0EXFj
 0qialewr4Icvt4jF5mqrySEnzOV71TUYCrVSUW81j1oMuHofJExuEIw/T
 xyol6fFGbBjywmTPnoJWxqoQIptbjqiUjG/4hrWq/dyWMh+PDiXNE40Pl
 KCKkj5egAFNMZyxN6f+/cDXlAfY17Bs/RNhyL9qIwJBdRJsIQR5hJ+GhE
 22UwAtgiHAJAnrocR8yP3VAU/LTpiFBnH0rwzCXZD9hRq/f9Y3s8OC5/u
 1fwjU8n3MXeDrLLZLwboUuQS+tKtup/HCGSbbtUFsSPYEDLmeAXrajd84 A==;
X-CSE-ConnectionGUID: Rx2XsZrqTCmrdmAbllCb5A==
X-CSE-MsgGUID: mMYIOn+6Sk6cEwWr/N/log==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67949868"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="67949868"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 04:24:51 -0800
X-CSE-ConnectionGUID: diZ5keaUR/ulvHynkXGKOA==
X-CSE-MsgGUID: GwnnpOpxTZGOipwrCipJMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="197910939"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 04:24:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 04:24:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 04:24:50 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 04:24:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roezmULrS096Dud+vB+fGL4Zb7KttbXpuI8RCCIUPncKfUcnZ6TGRu17Mv5NrWifvkJ//DKF5CbdUJ5FA/tHaluIgeYx4zSR4T8MNaKylDxKusFwJH4XdCEkJyC/vEqqPb+QLdwHHDqp/p0UBbt6Dw/moSVdCW4zm4WfBHFkg4WTYbl7bWcMFZ64JAnrDFIlX1eC5E7Nm4OjLXxkAsKEr1/QKJyKTRgdqM4bBWXH0ZjMrPwN0hej0oHztTbt7+jA+rRPiRevSsGU5ACDGi4ZcVDusURboJdpCffC4/Nxi7LiMvc7g0l9ilmZfCGV+4doQWKewkw6U3QSKT7hy1jOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSNGC/et/O2of3GfIYCXQGM1DPdiK5Q5DQPlsbhR6ow=;
 b=UU1+aN1hvdiYwxyNcOvkR0JeqqfcrhA+0+YDTpamYAgBfScs3l4ANtsvaJ7BZ6Jo40oC3xzgVR5lf2KwTPXEw+d/tKQD8LEftcaEkCErkVL6jpfUYQR9N1FsezvNqnsQRDY1MIMYCsUh6icYeRJbSB5U2FDoPKDqtzoGgvcht2uLC2eMVRFisnkD22Mn7YGr7Tx/X8hvbsYPrNQdOYLxigN5JGo+QFJq5tx6KbZGR2+gwbS4y6y73fYGbttziQJxZGx79HNKYyPndPACL6cLgGVPZqI2PE2H6N89hU7zlmz0zWRAVEWSqiYAF4zPqfm3lHANrku2IaB1VKNJtbGlgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 12:24:47 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349%2]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 12:24:46 +0000
Message-ID: <f1ae6465-3276-48a5-8dc4-e3caf2b9e2b8@intel.com>
Date: Wed, 17 Dec 2025 14:22:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20251217061728.35768-1-tapani.palli@intel.com>
 <773d97c4-defc-422c-a3a9-c7769f367493@intel.com>
 <e14dc32f-3c4a-453e-b0fe-09da137e172c@intel.com>
 <dfaff8d8-9158-411c-8feb-b2dfddf85e29@intel.com>
 <7c5458b3-8f14-4495-9e0f-f2feb99f411e@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
In-Reply-To: <7c5458b3-8f14-4495-9e0f-f2feb99f411e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0387.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::15) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: d6410182-ef58-4b07-0e29-08de3d6742dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2RHRitJNEtickFCT0kwZnVZMFhNNzk4amNGdHVHRkJ3OWJJVU4xRnkwSGNl?=
 =?utf-8?B?WmhzSDNaajZzZTBmdzBCdGxiQm5xQkg5Sy80RUpnN25DYkQ4OXEzQ1hSQVlo?=
 =?utf-8?B?cWFhUDkrcENjQ3NQT1NYaWZ2K0twVlJLRFZRSEdnbkVadUFFeUFRMDhPRTF6?=
 =?utf-8?B?dW9YSVF3QXdSTENNWWk4QmtJdVBLQWNVNEhuSkFhczdWeFN2cnJaSDBSODZn?=
 =?utf-8?B?M3FHOGRCNDFTQVFXU2JJM2hoS0lsa25vNUFUM2EvMXZpdnNqRHAyVTMxUmt2?=
 =?utf-8?B?VWRvQ3NuUk5DdDNHR1FQM3BDZVlrTWVqWG1kMXhyM3RiVE10aDBvYlphc25K?=
 =?utf-8?B?blYyK28xMXpKUGlZNFZlYWVxd0hLQWFiRU1YVHlmSmloUUZWSWN5SHNkTE1r?=
 =?utf-8?B?dkY3aVkzQTlMeXZ2MTEvNDRybWJMZDlxcEFzSkl5cG1RdVFOZlgzd1FDNmF4?=
 =?utf-8?B?TVg0YjNqd0laNHVNOG1XRDFtWHVWckF5cHdFU1VRVVNHRVNabE9hMitTaE9j?=
 =?utf-8?B?TlhvU1VOc0VIYXpWajlvZy9XSkN6enRwZTdRZkxxenU0Y1FneHoyYXB3akJX?=
 =?utf-8?B?dnNEeTE5a3EyRlI1akN2TnI3a2NhQ2RFU2RJTVY5OU5PSFgwNVgrRU1rRVhu?=
 =?utf-8?B?QVpqWDNxenN5eGVzLzBVMENvN1hXUkU4ZnIya3lsMzQzUGdISUlISFZnd2JE?=
 =?utf-8?B?QitLZmovOUJtcnpKRytEQUtaRWpwKytXR01ENk9zQk0zcjVqMDdxVW1MdEFv?=
 =?utf-8?B?eWZtNmtHTUNxTDdBWEpyL3hUOUszdjJZV2pERDc0c0Nqb1dNNVFEYXRkdy8r?=
 =?utf-8?B?YUF3eFFzSXlmYVN6WjRzWnB6ek9UVXVncWZObnZaZmlnZ3BROUNxMlRDdWdm?=
 =?utf-8?B?RHJTMzdhM1JwTVcvRUdHL1h0T1BRblQrN0ZlblRBS3pOVVp2Z2pJUFZFVk5B?=
 =?utf-8?B?VHc0b3hpaDh5KzdvVkM3YU1VYVhERVQwWjFnS3Bmc0wzaVc3V2R4ZVhiUDd3?=
 =?utf-8?B?RnlVSnZOZVdwaXRONTBuLy9NOGoxUTNyTDVReFNoTVFzOXJ6NitETEN3Rm0v?=
 =?utf-8?B?WXhaZWNhYkJ3bmw0NVhQODJSNXZEbnhZaDBHbVR3M0R5djRPWDFlTjcweUNW?=
 =?utf-8?B?OVNzTU85a3ZYeWxoeVJzOUpPTFdkQVdDUGZKWUoycHV6NklTTmlYWTZ2dFMx?=
 =?utf-8?B?ei9pcGpOOU9tQ1UwcUEyaGRrZkxnQ1RaSVJRUjBGVEh0Rm04SHE1SFUrUVFU?=
 =?utf-8?B?ck5uZ1Q5aWpQR09Rc2RtY0ZmUzFZdThsOVFNaUw4N21IdHdYS0VFcjhsM2FF?=
 =?utf-8?B?MDVFRTVUZ3Uwb3orcjlWZCt0NDFNR2p6cGc0bGNMRHNzTTE0UlFSME5OSkQz?=
 =?utf-8?B?WlVUeThXUWJCUnYvREhUMW1KVCswWXREaDN1SHlmNkhaSXgxdnNtUFVlWkND?=
 =?utf-8?B?MVh3dHNkaGorTDloYW1RZlV0MFpuRVJWTFlTQ3lxWXQvYUgzNzZXT0sxbTA5?=
 =?utf-8?B?VGZheHJGbzlZb1RWNjE1MFIwSnQ4aWpJY2hjeXdCZ1ZjS3pkRCtiQUtRR1Vo?=
 =?utf-8?B?dW4rV2VMcWtkL3N2aWxFY0RkWXRIa00rY0xHNjM0UGtWMmlJRHh4dUZDRW9r?=
 =?utf-8?B?cEd6SFNnSHlPRGVFWHA1bE8reHE3Z1RFYkxtV3ZqZVcyR1ppaGpXb005ekJ3?=
 =?utf-8?B?RFp6aHQ1UCtuWUNCVXZXSFlGZ0J6VFZhT0Y2a3NQQnRsTnNacHppd3F4aDQz?=
 =?utf-8?B?SG5wS1hIa2F4M0pabTZoNWZmME5ZSkJla2tUZ3Bib3Y5cGpFVkwrZnVDWndS?=
 =?utf-8?B?UXhDd0QxQ1NzNmMxNzJaUS84a29JQWlRdUthQmd6clU2UmZhY0Q3LzIyUzNS?=
 =?utf-8?B?VkpkSjRJaW5wWEdLTEJwam9lZE54MUc1c2duUFZTb1Mxb04rRlcwd1oxY2dC?=
 =?utf-8?Q?jURtIOb5sLad34IFkplMQDEMtVgsA89e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWEwR0J1UXJ1TkZqQ0wwQ296RWhDT3BMQzg0amVSemZ3S0dZbWxsaVBHcVlZ?=
 =?utf-8?B?Y1paZGU0V3lSbGpTblFBenhkVmFxN3o0TlhldHQ2dzdTeU1qNGo4L2N0Um1S?=
 =?utf-8?B?RnpaZlNzelpQSTFrWm5JTFhjMVpRbGhyK2hYQnhhWm5xcGQvRHF6WXlmaFRp?=
 =?utf-8?B?Y3JtTllsWHEvcEk2Y3hQdWV1SVFVTFJtUlQxd3E2aUxiTHgvNmRhMWphRGFz?=
 =?utf-8?B?aCtwNmRieHBnY2JiQ1JkbVZoWENVMW9MNXF1aXA1KzlMc3YrRDI2OVp2dWtx?=
 =?utf-8?B?RzMzd0dBQUlSaWRMY09sdDJ2N3V1a1dzc2dLcXlTalNYbEZHYXV3Q1VJZHVi?=
 =?utf-8?B?NGpJWkowWFl5VWZaWDU2elBiWlhPZldPbUpONmdJaklOL3hsRWhuaWo5Z3Fz?=
 =?utf-8?B?WHVQSWhyeUcrU1BYd2FHMS9UeGhFemY4Y1dPd1BlOUNHS0hYZ0hRRFFycFNy?=
 =?utf-8?B?NDgrRUYrcFpBZHNCODZHeGpSek5oeDFzZ3hJVExOR1NGL0xzclVQR2xtVXVu?=
 =?utf-8?B?L2pIRjY1bnYzR3FKVDAwUU8rbnVWdkU2dk11WFh4clRxZXF3TmdvdmVvc0p6?=
 =?utf-8?B?TG5zR0dpWTI2Ump5ODFMN2RZdUpuRm5pVHd2YnhFT0kwSnkwVWpiQVh4b0lX?=
 =?utf-8?B?OWkvLzRtNXVFdWdIczRNWXdlNnBIQk4zTHNrR1UzWHFiazdpZVJYVktIcldm?=
 =?utf-8?B?RTN0Ny9Nd1hBSlRNWVRJbmFRK1lYMTR6MkUrL1g3eUFSRlJuWFJhcDhMS3Bn?=
 =?utf-8?B?cXRyNTgwWXdpMjVDYWNOWVZINWxXRnBaM0NyMmxxZ0JCdEVtVVAvNDlNYlFZ?=
 =?utf-8?B?QmFUYmNEQmJoZk5vLytJZ0pFSVJsVHVTVFJrWnRmTzJQRWNjZjdLemRtMkNw?=
 =?utf-8?B?V3Q1ODlxTnJnZzBoeU1mQnV5a2F6NWRtOVFOL0lIT1UwaUN3aXlYMjhlUFlF?=
 =?utf-8?B?Q0NqNkgzYkx2ODBMbDFjMi9UcUZpMW0vbDllU1JNMjZPRW1LNTU0NXNnRmpH?=
 =?utf-8?B?THhqeXErUTF2ZHhEdGVNYm03Nm1uNDNCOTVQMnBlcklNeGpoQmdTU2VETnNi?=
 =?utf-8?B?bGUvOGxZbS9jNzh0bUZQSU1TYjVISDcvYTVubjMyWitsZ3FtTityUmdwUnRQ?=
 =?utf-8?B?Vk1NRFJ1TzFVUWg2RjdVcGh5VkhNY2o4cUVOaFFHcDlLSGJ4OXpyd2NFMmNj?=
 =?utf-8?B?dTh6QVA2bFllS1ZaYXFmQjl3M01URGhoajQzNkU1eXRPS1lnNVNXT1NDUU9T?=
 =?utf-8?B?b1RCNVI3QnAxZFNoSUR6NWk2a3I4ZTRkRzlNNVJDb0JteHp3QVJSQm1QcFJw?=
 =?utf-8?B?RHByQWVWcHhNN1Q2T01VT085amE1ZHQ2MmVGdk1rK3Y5ZGdCdU9MR21tWUl5?=
 =?utf-8?B?UVF0eGVYOEFEWXkvRnhTR3dEaTF4OHdpaDhsQ01PeWZrYVV5NGhwUG9jNDNm?=
 =?utf-8?B?NGFBazdHOTh6Mis0eVNXdEZNZlgyZlR2d3VsZFJHeDZjclRZTjB6aDBrbzRX?=
 =?utf-8?B?cFZSalJwbDA4NS9mNmQ4YUFMSVZoemdlZHpEQVRucVFZNk94UHh0bEMzRy9w?=
 =?utf-8?B?R1lUL3RZekRaSHErcld5TDluQ051NGc2NkxObERXTDIrY202cFlhbVZMaFph?=
 =?utf-8?B?UU05bW43bzNRVGJTckxIbTBHMmJWaFQyeHNyMHJzZ3NaOGpZa1UxcVdvWmo2?=
 =?utf-8?B?ZndiUnJmdzY2NTQ3YkwwNWJNWHg5RVdKR0NiZU9UWUxYZXFhd05OSkxOdG5o?=
 =?utf-8?B?VE05enIwWjNpbFJhQ3BPWXhyU0xXSXlZeU82MUl3Zy9qNVcybXY1bnZLMWxu?=
 =?utf-8?B?em1HTXUyTUt6N201czdtNGFVN0FKQmhYTFhSdk1NdGMxbXRqNHMwL1JicnVS?=
 =?utf-8?B?Wk5WQmNxT1AvclVwZTkxNGJPNFhFUjVEcDJIVS9oVzZBQVpzZUNjZXZDNjJy?=
 =?utf-8?B?UDRybkhPT2ErU210ekVpK0t5QWpMQXQyWlNhYmw4dG5ZWE9WelYxdmZrMC9Q?=
 =?utf-8?B?eVVYM1lORGFGckVrOXN0S1dRbHR2akl2ZVVFZE9DL1hJelRybExlTEp3ZzdH?=
 =?utf-8?B?NG9oMWd6bWtGdFVrd3NqZEgyUGNDQmRXcmdHWkZMbEJXSUwrMDFjTFNmMmVy?=
 =?utf-8?B?d0swa0ZpRStjSDNHb0F4RnYxcUVzOG04OVZUTXB2dEhWaWowSGt2MVBoVWw1?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6410182-ef58-4b07-0e29-08de3d6742dc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 12:24:46.7268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdtAZDeno7bDzedLU/6UCOUWMN4nA03CYa9kWT9mWvx628il8cTB4eEG+CswdsPTWEcUZUCEbqOW8NOA5dkO8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
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


On 12/17/25 13:51, Matthew Auld wrote:
> On 17/12/2025 10:51, Tapani Pälli wrote:
>>
>> On 12/17/25 12:31, Matthew Auld wrote:
>>> On 17/12/2025 10:27, Matthew Auld wrote:
>>>> On 17/12/2025 06:17, Tapani Pälli wrote:
>>>>> Helper function xe_sync_needs_wait expects sync->fence when accessing
>>>>> flags, patch makes sure we call only when sync->fence exists.
>>>>>
>>>>> Fixes NULL pointer dereference seen with Vulkan workloads:
>>>>>
>>>>> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
>>>>>
>>>>> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to 
>>>>> dma- fence mode")
>>>>> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_exec.c | 3 ++-
>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/ 
>>>>> xe_exec.c
>>>>> index 730a5c9c2637..ea368f02cb9f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>>>> @@ -184,7 +184,8 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>>>> *data, struct drm_file *file)
>>>>>           if (xe_sync_is_ufence(&syncs[num_syncs]))
>>>>>               num_ufence++;
>>>>> -        if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
>>>>> +        if (!num_in_sync && syncs[num_syncs].fence &&
>>>>> +            xe_sync_needs_wait(&syncs[num_syncs]))
>>>>
>>>> In xe_sync_entry_parse() it looks like it will always populate the 
>>>> fence for the !signal case, otherwise throwing an error if that is 
>>>> not possible. And xe_sync_needs_wait() will only touch the fence if 
>>>> it's the signal case? So it seems like this should not be possible?
>>>
>>> Sorry meant to type:
>>>
>>> s/touch the fence if it's the signal/touch the fence if it's the 
>>> !signal/
>>>
>> I'm not sure of the complete flow but it is quite easy to reproduce.
>
> Oh, I think I see it now.
>
> I assume the below also fixes it? There is also the case in 
> xe_sync_entry_wait() which has the same bug, I think, so would also 
> need to handle that.
>
> @@ -178,6 +179,9 @@ int xe_sync_entry_parse(struct xe_device *xe, 
> struct xe_file *xef,
>
> sync_in.timeline_value);
>                         if (err)
>                                 return err;
> +
> +                       if (!sync->fence)
> +                               sync->fence = dma_fence_get_stub();
>
I will try this one.


> So it looks like dma_fence_chain_find_seqno() can return NULL if the 
> seqno has already signalled. Also means we are missing some IGT 
> coverage for this.
>
> Can you resend your patch but perhaps we move the check into 
> needs_wait() and then add a similar check in xe_sync_entry_wait() 
> also? Or perhaps might be cleaner to have xe_sync_entry_wait() first 
> check needs_wait(), which will now also check for a NULL fence?
>
Yes, that sounds fine to me, I'll add null check to needs_wait().


>>
>> Here is the stacktrace snippet:
>>
>> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
>> [  118.410940] Code: 90 90 90 0f 1f 44 00 00 55 48 89 f1 48 89 e5 48 
>> 83 ec 08 48 83 7e 08 00 0f 84 79 be 1c 00 31 c0 f6 41 4c 01 75 11 48 
>> 8b 41 08 <48> 8b 40 30 48 d1 e8 83 e0 01 83 f0 01 c9 31 d2 31 c9 31 
>> f6 31 ff
>> [  118.410949] RSP: 0018:ffffccec8ea7bb18 EFLAGS: 00010246
>> [  118.410957] RAX: 0000000000000000 RBX: 00007ff23812f460 RCX: 
>> ffff8c1790db4800
>> [  118.410964] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>> 0000000000000000
>> [  118.410968] RBP: ffffccec8ea7bb20 R08: 0000000000000000 R09: 
>> 0000000000000000
>> [  118.410973] R10: 0000000000000000 R11: 0000000000000000 R12: 
>> ffff8c1790db4800
>> [  118.410978] R13: 0000000000000000 R14: ffff8c178b67e000 R15: 
>> 0000000000000000
>> [  118.410984] FS:  0000000101aff6c0(0000) GS:ffff8c27350d1000(0000) 
>> knlGS:000000007fe20000
>> [  118.410992] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  118.410998] CR2: 0000000000000030 CR3: 00000001037ef005 CR4: 
>> 0000000000772ef0
>> [  118.411004] PKRU: 55555554
>> [  118.411008] Call Trace:
>> [  118.411013]  <TASK>
>> [  118.411022]  xe_exec_ioctl+0x375/0xea0 [xe]
>> [  118.411377]  ? __x64_sys_ioctl+0xbd/0x100
>> [  118.411392]  ? do_syscall_64+0xa7/0x580
>> [  118.411403]  ? dma_fence_free+0x1a/0x30
>> [  118.411419]  ? __pfx_xe_exec_fn+0x10/0x10 [xe]
>> [  118.411752]  ? drm_syncobj_array_free+0x56/0x80 [drm]
>> [  118.411915]  ? drm_syncobj_query_ioctl+0x20f/0x460 [drm]
>> [  118.412035]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
>> [  118.412372]  drm_ioctl_kernel+0xae/0x110 [drm]
>> [  118.412524]  drm_ioctl+0x2ee/0x5d0 [drm]
>> [  118.412649]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
>> [  118.412989]  ? __pm_runtime_resume+0x5f/0x90
>> [  118.413002]  xe_drm_ioctl+0x61/0xb0 [xe]
>> [  118.413329]  __x64_sys_ioctl+0xa3/0x100
>> [  118.413338]  x64_sys_call+0x1060/0x2360
>> [  118.413347]  do_syscall_64+0x74/0x580
>> [  118.413355]  ? x64_sys_call+0x1060/0x2360
>> [  118.413360]  ? do_syscall_64+0xa7/0x580
>> [  118.413368]  ? __do_sys_getpid+0x1d/0x30
>> [  118.413377]  ? x64_sys_call+0xf9d/0x2360
>> [  118.413383]  ? do_syscall_64+0xa7/0x580
>> [  118.413389]  ? x64_sys_call+0x1060/0x2360
>> [  118.413395]  ? do_syscall_64+0xa7/0x580
>> [  118.413401]  ? sysvec_apic_timer_interrupt+0x54/0xd0
>> [  118.413410]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [  118.413418] RIP: 0033:0x7ff29c93287d
>>
>>
>>
>>>>
>>>>>               num_in_sync++;
>>>>>       }
>>>>
>>>
>
