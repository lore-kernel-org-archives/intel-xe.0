Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DDDCD8CB9
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 16:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CD310E529;
	Tue,  9 Jun 2026 16:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axDBlTjp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC8A10E520
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 16:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781022196; x=1812558196;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h7zBQubK8MFhtiFoo2yp778kk5wtSrk+FjBKN/dBXOM=;
 b=axDBlTjpVKCO1WVM4fJG+wjAr8dj7zrgW4OmbNTLUe9WVYQ4bOs3HFTe
 qtJWouoyHMO3exvUsGsoiHPizVH/sFb5T8cbweWtcmYGBfun52DTRdM4d
 WVkb6uqK3+I0Yqka/Yi8R8G6QpEI71C1Qqif4rwIfCFJ4jSjT3HbVa8og
 3knbiowMNTzHaU3T0frNiRYvLp4IJDndvel62mOh8DHYxVHF+N1BGiPFZ
 fWmL29G+xZumbCIpn0OQMALRPyWwvg3zbD77ku/DOZcdj5oBY2WOa9LDE
 aboUxLVsQqVbGHD3hsmPro28Yojy5FIMY+T0hwAeKOKADtC3fG90AYtcC A==;
X-CSE-ConnectionGUID: aHq9ixNlQCOOGNIR4APdXA==
X-CSE-MsgGUID: X6KbRhDlTeyXkEH16cBt2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92110645"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="92110645"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:23:16 -0700
X-CSE-ConnectionGUID: Z8AX1hKkQfGR9j5JFwSQOg==
X-CSE-MsgGUID: QHpsOyOyRqel3HXHEjJZiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="242945012"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:23:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:23:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 09:23:15 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:23:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQEdPs00GRb4NQL2dfIOc1gwXVdVwikHFy/V0zGXe0y3Rhl7IsPPgVsAfAcsNWCcWcCbJSKAOW1sO5yVBS2WvL3UUNNkeFYEHHaQEeE8zjzePJQvtMORT6ChyznpzgjmpL+5k9LBB6obl83sRfkPKrXJyNueHNcsoHFFhfGyUgp/XPg1heCRB5TAx/uUspGsdXToxnPpSxOWQvj/Rx4mKhrfH4D2o6W5MLBJhiHGmurLnyWEQwRRAiKCDbcO7vkBhjm4QwhXGB4WK08GDDBlfJdGW4WlDHc6I5Cn2kewB62nHZrCytSI0kn7hrW1CnF+EQGMd01fnePgEOIPBe+Rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZAqFCOsd9uP2VOTLYTxwOknUafS/smKtyV0s7ldkgM=;
 b=PzTbrfVHP+R95ijAkT5eQ64G0B6pEEdP3TIdY5M8CAhDCdSgIV8rmAxlp5sh8+RTBFrL6O65QjeysGZPXdLq8aI85/zBW0X0oCcTH3V4rqykvqM/GP4tKrwjdLEc/rHZtPEilD/SQ1Z7XpbxzfePxlbEZ7Lr55CYNqiPm0cPz75v/rpEZ2XWT0ohS64BqHNFiRZ7cDULXOaSk6nPuj6eU+oBXZJnCneT5KJCwrlQI6c/T3cETSqb1lRRVg3ROcDcQ26WR1VVJiSjba54cmB2iy+6jnlrYXIV6Fo3b+3JhWFVDstA4TR5utyOa/tqNN6wrY7RuV6K3a2L+VWXJ+8QcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ5PPF0D72A1BA6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 16:23:12 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:23:12 +0000
Message-ID: <bc1c5b74-3ff6-4679-9f20-4f98ec461172@intel.com>
Date: Tue, 9 Jun 2026 21:53:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/lrc: fix spurious warning when reading context
 timestamp
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Sanjay Yadav <sanjay.kumar.yadav@intel.com>
References: <20260609144412.244678-3-rodrigo.vivi@intel.com>
 <20260609144412.244678-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260609144412.244678-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ5PPF0D72A1BA6:EE_
X-MS-Office365-Filtering-Correlation-Id: 4774bab8-135d-4cde-93ae-08dec6436695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dPgM1u/liTocwj6JgovJiLoZBAg9eelo8AK31Rttid3lkA8NLDbPJXrvxVAbbu4qydFAAV77soRAe7NQ+URartxQPZmvyRGkn+m+YUHNQezSR2DeYvRV+qKwxDNeDve9M/Rkoy1hIIBH9v1QWiexRD+uksbMjDlWmmrFXQDxZQZerDtXDwoSWW2apiSzTiv/GaVPa1CxRr3X2gftBRVNqLA8Bln2GbjghzYEqWIi50rY9BWQVWIcMxhusRBM7cpNHCs0qXEcPFQxVNBFe+CkDwoLuO90mn8MHDG8YyYxZ/ti0lgRvvL0h+OYaJqXRHNdzoAojO8KJ0oJryEmdhs93d7tXGBLP7t06+868nNik1TD4Wwnpa8krl6qnkl8gycgylsgPIEb/109e6N+KUd0Q5DW1gl48gkAW1AK5FaPX3Zy6UwgwbqQDZi4nP8sNC5YDhHMhU7hxrVTryPLuGBPUU28K6tHjsYUlmzwarFktEETtQ+MWzpEMIZPmAru6TLALe+GQocvnOZqLyFfo0gzA3+UzexPrKw8/x8Dn0zDQ4qKTzumqim9jBEVAtp0BT6/+uzYObZ+v1W4A5SXy+aF6fFw3KcHdc5HYV4JHOmbr9kICzYx7yAiOwXtrB+z4OSzyfl2SUq9uK8uf56gLiyxqQ6Zsn+aRvyZNm9xao13/he4RWNL29kRre68QUtoFZ0g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qisvc2V3NVM1aE5Lc2F3ZzNLdFVTLzIzeDJRU2svamgvU1E0UzA1M3NJYzJF?=
 =?utf-8?B?TTRJcC9hQm1KQllXeGZYWGMxeCtrNFNTSHN6WTBTYk0xdnBicXI5ZmhUazNr?=
 =?utf-8?B?aEhQU1ZMQmNYQmhjNjlyVFRsWkEvK05JckJwTDNYT04zYmRnK0NDUVZRRWw2?=
 =?utf-8?B?L1lRZFpnank2UGttbG54a0J6WDMzaE8xOGhNdlg0TUFzMHNNVnBHTkZ1SW15?=
 =?utf-8?B?Uk11eVlQSkJyeDRRblZNSWMwWllKd1dBNkNSVlY2S25OaEZqeTY0RThzTTVN?=
 =?utf-8?B?TEtyc0g1MzNCR2tPanAyNFVkVUtUMWNiZnZOcGdPck14dEVUdTF4OWdkRGVV?=
 =?utf-8?B?MVlQNkV3MzdsZGx2OU9GblZseG0xS1gvQUJzbHJHejZRNXhVdmQ4YnhBamk4?=
 =?utf-8?B?aDNhalpmQUIzOE1HQlRUUkYrelJJdTBRK0FLTlpjVzZrR3FkN29jYmp4OTlt?=
 =?utf-8?B?ZloxUkgwdEpncjlhd1lZY1gxeTdMTkV3WmxzaklXZHRoaks1SEEwUVVXUDJK?=
 =?utf-8?B?MU93eDhIQTgvWVYrNWZYcG1iMlpDMlZlOHRvcFRnRnNvWGVJNHBTMW5RZFBW?=
 =?utf-8?B?OHgxUjBwUWJyNDkzemJxbjVJTHA5UE1td3Z4Zm5mc3g1amllTnI5b2lNMDds?=
 =?utf-8?B?SVpTZGtUeE9WNUpqaVk2MHAvdWZFd0hLNXhYTjR0RHZZWXo5ejVpVTUvS0c1?=
 =?utf-8?B?V3BRR0VBT3F2YnZlZHp3aDFZQ0hjR3JWQVFLZTI0WllmajhaMTcrRzhWeXBm?=
 =?utf-8?B?OHJGU1hXUDQyL2ZDMnlJUlU2ekRGOVNsTWdjaTJwbi9zTnV6QzZvR1NwMXM0?=
 =?utf-8?B?OWEyMHEyRXhDVU1Ja2ZNUXlOZUozQkt1emtRWjBLVjkvV05vT1dmcXQ2cVBE?=
 =?utf-8?B?Qk1xVC9wUnRQcnZaanp1ZkgzcEhCaWlHYWp6bWpQNU05R2ErbGFVWXJJckNG?=
 =?utf-8?B?SmRJUzBGVzlIZCtWZGVCOElNeHU1VUpYWXJudVVuV2xrVEFSdDU4cEZtR1kr?=
 =?utf-8?B?d09RU3Z1T1Z0MjB4bURCZzAwRW84SG5URWMrN1ZTcXIyYjl4c25QZU51VDZ2?=
 =?utf-8?B?b3ZTSEo4Ukx0aXdxZ1I4QlRsU0IzdmRxZ0R4K3pJWUk1b3FkSzU5bWd1TFpQ?=
 =?utf-8?B?c3Y5SHM4Vm1KQWJLK3ljb09ESkN3dEpMZ2dYSldkUlNjUXV5ZnNOZmlmYWw1?=
 =?utf-8?B?aVhJdi91dFI0MExWTjJRTmV0QWNlRy9NcmdzbU9ZeFpsQkE2UC9mSk1HN2JM?=
 =?utf-8?B?TXVUWENWQUp2UmJady9SM2dLL1J3MXpFTlpWalJVSzdCL0wvQmdyY3BjWE0y?=
 =?utf-8?B?dFdMQnhxdW5lUlRWQVRQM3BPaEdNVkVNa0UzVGFBLzZsaVhSUHJNaFpkYUk0?=
 =?utf-8?B?VytDaVJhbGhaQm1jdWJkSEF5Wm9GMm5ocnp2OFhKQXFnZXpVclZTbjhZcTI1?=
 =?utf-8?B?VHRkNGVaTmpWSU5xdE1NVTZGeGFXWk9Ma3lJbW54OGF0OTJLbHN4YlMwR1VR?=
 =?utf-8?B?S2FiK1dyN1RyanBSeVlHb0ZRN0lCakNHa1RHT0NhR1M2S1huZTdwZHlpbWdm?=
 =?utf-8?B?a0FWVnF0M3k3NDRvM1RoRy9WZVBFaGpkZWtlTUhKdllDQWJ0K2dpVFJ1M3Zv?=
 =?utf-8?B?aUNuTEo0OTMxQm5uMDV3cS9LdUpTZ1NmZG1kQmQ3UGZ5OHFrUDZrWWZLbnph?=
 =?utf-8?B?MHMrVGUrajlqeW43OGRxZTdlM2tKZWVkbDdNZUJwRDh4eWRQN2MrZFppV2x1?=
 =?utf-8?B?U01WRTloUmIwUWFjLzI4TXd4VmtSRS9iUlVSRi9JTFpLOHF3WmwrMC9wdEt5?=
 =?utf-8?B?UHB1MVo0bjFrMlVYQWNFMmVnU2NlRjdsektEaFMwOFdjTHd3a2JKRWdscGlu?=
 =?utf-8?B?T0Z2SHJ2dEhheUJOL1NRQzFURmR4QnpEbFhYdHlnc1hUV1RuZnl4dzJOK2pD?=
 =?utf-8?B?TVhpWUtFNExTbDZLWUIrcVBLa0xnOG9RVTNXdlJtWlROeExCUkd1TDZXdE85?=
 =?utf-8?B?WHJsMEtIRHBZZkh6aHJRMHl3UGtWS2NhQWJVWnFaYjg2YThFQkZqaVc1VnVO?=
 =?utf-8?B?RktIVFN1U29wd2dvZ0ZSU2dJcG5hZU1HWWFrbW9adFIxSXlhNW1GZmxQSVE5?=
 =?utf-8?B?ZDBNTXZScld1M0k3NzZ5eWV5S05HNnVDeUdnY1NhOW1RUkliNWJVTlV5cUlz?=
 =?utf-8?B?d2tPc0o3dkZPMlVMUXNTZVpTb2lzM3BvUFZ6RHF5SDRHYjRscFFwVUdhaU5s?=
 =?utf-8?B?UXFRd1BnMVk1U1BOVjhjd3IxZkNKWlNST1l3MjYvZm1GckZXaW5VejU0TlVm?=
 =?utf-8?B?Qk5WeFFDYkViaXFsQlRwbUdaa0I4VHRxWG9mVTB6N09jTlppUlErRTFxV2Zi?=
 =?utf-8?Q?r4BOEMjoutAt57lo=3D?=
X-Exchange-RoutingPolicyChecked: dCNv6RZ1fyDGAdzQKhmtAGkucp9LoCc70DydFPbtdvHn3yC+f7x8inYU5Qb2HXOVQyPm85qLsRJXvgHQlJKw24XWpOj+eW7N/F2A+Ydo5DaW0rIh52hYXSqe1Kqc6+djgWJ1r9ltCB67AHVS5L64KoqoRY6tJ/tQEbfD/MrKpTU+Nawt7uBwi1mK2DXDV1/uAxwe6ECQozeJA7Qh//2YyrWRUOaN52evkm4pX9SjML52LjSCzvgUsotamPyMUvgUQPXWHXEFaPXT3wLDN4pQ8Z43BR+tSavmCafRhf1fBcSYfdGxPnIbUjqkU1nrHdSrjRPhjo8/fCKzNaR8iS9OCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4774bab8-135d-4cde-93ae-08dec6436695
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:23:12.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOY8UnrrkcgUW2cx1RGRN07fBNCDBaLso7DzWbEbVrRcSflXwv6vftvnI9maT3Zpc96kidhNrRJxm0rOuHF3Z+mBzb4cDyXOQfq+/w/7CeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D72A1BA6
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



On 09-06-2026 20:14, Rodrigo Vivi wrote:
> Fixes the following warning that fires during timeout handling for a
> context running on the USM-reserved copy engine:
> 
>    xe 0000:03:00.0: [drm] Tile0: GT0: Unexpected engine class:instance 3:8 for utilization
>    WARNING: at engine_id_to_hwe+0x88/0xc0 [xe]
>      xe_lrc_context_timestamp+0x61/0xb0 [xe]
>      guc_exec_queue_timedout_job+0x713/0x1020 [xe]
> 
> class:instance 3:8 is XE_ENGINE_CLASS_COPY on the highest BCS instance,
> which xe_hw_engine.c reserves for USM (gt->usm.reserved_bcs_instance) and
> on which the migrate engine runs kernel contexts. When such a context's
> utilization is read - e.g. from the TDR path - engine_id_to_hwe()
> rejected it because xe_hw_engine_is_reserved() is true, firing WARN_ONCE
> and returning NULL, which made the timestamp read silently fall back to
> stale data.
> 
> The reserved-engine guard was added defensively with the original WA BB
> utilization support and simply overlooked that the migrate engine is a
> valid, present engine whose CTX_TIMESTAMP can legitimately be read.
> 
> Allow the USM-reserved copy engine specifically (xe_gt_is_usm_hwe()),
> while still rejecting the other reserved cases (GSCCS / XE_ENGINE_CLASS_
> OTHER and ccs_mode-disabled compute engines), which would indeed be
> unexpected on this path. The dynamic engine resolution via the ENGINE_ID
> stashed in the PPHWSP by the WA BB is kept intact, so utilization for
> load-balanced/virtual exec queues still resolves the engine the context
> is actually running on.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index a4292a11391d..3e7c995085d0 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -2618,13 +2618,19 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>   	kfree(snapshot);
>   }
>   
> +static bool engine_valid_for_utilization(struct xe_gt *gt, struct xe_hw_engine *hwe)
> +{
> +	/* The USM-reserved copy engine runs kernel migrate contexts queried here */
> +	return hwe && (!xe_hw_engine_is_reserved(hwe) || xe_gt_is_usm_hwe(gt, hwe));
> +}
> +


LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   static struct xe_hw_engine *engine_id_to_hwe(struct xe_gt *gt, u32 engine_id)
>   {
>   	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>   	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>   	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
>   
> -	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
> +	if (xe_gt_WARN_ONCE(gt, !engine_valid_for_utilization(gt, hwe),
>   			    "Unexpected engine class:instance %d:%d for utilization\n",
>   			    class, instance))
>   		return NULL;

