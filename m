Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA88EFCD9F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 09:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430DD10E6AA;
	Tue, 10 Mar 2026 09:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYkm1U1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0CD10E6AA
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773136269; x=1804672269;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VQjO1hk7kZBDxIbE99OImkF8neAUea//ZGLJhgsA6xQ=;
 b=cYkm1U1rWZdLzLtFgH1Q/J5m95Qy4EI3kz79EwipoP+5ai/M8kGMZoYi
 yiis0piJzP883VkFvLC8XjRSZAo8De9kolnnrQj2r+G2hCSDRSOmCjSpO
 xiaZVm2Hb79WMN7SLjNiOVCy+K+cTDSOEAi3mis2TlIubhlhPiiNT7prk
 lIUPfr64VDm7neG7UY1dwiX8AyiUi7zSGMK0LhrS8dvxEroiu4mb0z8Le
 vKmYL/ihAND2wLHpAzWyUuOJeDcFvZrV9aa8/b0F1MMX2suixC1kdDt0a
 /QM0umBVLDb2sGBCHqbD7ycu6Fn/kzvXPqK3+WF3h93zxxW/KY9uC86Ay w==;
X-CSE-ConnectionGUID: pHbrvZjvQkKLEcVweXWwzQ==
X-CSE-MsgGUID: 2OxbaCkwQGqjuMwR12JEnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91751943"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="91751943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:51:09 -0700
X-CSE-ConnectionGUID: 2LebLm3fRWmraYqjHqNwrA==
X-CSE-MsgGUID: SsBjFE+PRAaISETv/ABOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224231777"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:51:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:51:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 02:51:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.58)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:51:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrYZdMH2DYBIBIODouJdcL+U24luCLT6TRqtOiUSs3/yWC8Ngqw+8I4R+FetH7Tt9nEbf8X87bxZOcWkcwVetph293cFm009bLfQPPVBdkg7Ijq/FAchke6ZtY/Q7G60Xmnak0KegS0/w6FbE7Lwm9HLMbm5wncaNodrbAsJ455mKr037EPGtpK3JEvLDQgFRgQL9IOGFbmQblvtlfhTbubve1ySSUFPk0AODXfApCkABbIycBSukinM8jbpvnqtTUGkUXMIKz+0rMrJqeq6hCvc141sisv9NTMn2dx8ZPufQdiloNVjuVvqSnSxUR6QBolGWUB0VFGF+qqJE8qUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsyPMSVe/q7wXBtSD1yUUivbOUhGN+plnyKuMwr/Cco=;
 b=asFob2sp2OOikz3+ibjzkcgqI8eTk2J6J8pxiv8cbfy2EPsUAhuaQdPY+KzS2vz2mnrP9a7yKbZR86tvkUw5m9T8xdL94e89CN7R7VWVeTZHb6cBC/llbUI1i3iadav/Ik7PopF4wyIc3YUb/IqFipRrRjuwRFr2rlgOn8c/bZxmOCHI/3xG6nEkGoDNQ0ZTJ0SzYvnzD9BmbliA7BNQ8ioG7nHPkmNRlqFAsg50VTyTDGsujE8MwpHWzugzcczN5EuC0tyM0zKWSd3xTScV+6J+YUXqcdMPh5ZcBrLKKssJlxpLhh6M2VhlNb4UT7RmJqzLFLBj9FEP/0nr32waiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 09:51:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 09:51:06 +0000
Date: Tue, 10 Mar 2026 15:20:56 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 2/6] drm/xe/sysctrl: Add System Controller register
 definitions
Message-ID: <aa/pgMwEHxWq8QZd@soc-5CG1426VCC.clients.intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
 <20260302081002.3275868-10-anoop.c.vijay@intel.com>
 <aa6OkckbtLnwl7Kh@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6OkckbtLnwl7Kh@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MA5PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 086b4d1f-dac6-4a43-129f-08de7e8a8c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: zl7GmUAmfS6lQYbb/N0oGEXMmaL4QJt53M4w2kYDBMb5juy8jakFw090SfpgwDTGFF27zfBVefFmpfmogMSR29ySsoci0z6MnevUg9HLFpY+YiztonKDlGmRV1O20gOBBz+Dt5IUFEkW3j9NS9M12wvpCGX/481JaMOUlHw5xJAx+nYdpTpD1g+GXxEdzuJGfebBcJccfJys0bVwEF5eNE4CbC7sP99nL3ovTbts4FST2aZ0RZ/vSVfmHa9ceInsRBUUA/43nmxxmWYEuPjzqAki3ne8kyQMxNBSZR2fKDMakUwnmQldMpxRuYj+agHpGvlq181C1llRrTU42ACBnXhhZlsvd4w9/h94DBrtwyQ7MQKqqvV4CvmPfXqJHd1uc9tBqCJhwoT7j0sHmAOwnbpFxoBPnQ7pytbYzI9knQNGCLynyhxauATs0GG2D0sp0Z5/yirwjfGoC/MVYiW85Jj8qP9WCy6LRNBEdbJ1/bzE5Iuz2dFWwmWK8wv+pSdWj5C81JlGr6BakgOKKHoeT0tkB9/r9KMnisBsje+prAa+d+CP4awkXXRQcad77Oc8GVrh8I8Lo3TVc70jjpW7588on7kgvOEW2Mh0GNAw+h6bOruXvn4d/zUVv7shn9f6KQloWreqkdbiwD1SrFWKNPLXVHdvlvGCxVzb6bnSZ22ayodIvc4kRoZWlPLETAqMaO1zlLCdMfD8zk6fSgrlR7J+G10hSsTWSaYHYy9hybI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGtuTEVGcUEvN0ZCVGk0M3J0THRQUERvNVJTNFkySzNXdHordlgxalpGSE8v?=
 =?utf-8?B?S0ZPVjhxYlB0YjQwNlVtWktrL01sSUI0cXY3YlhGMDRlNWoybjA1clkrYWla?=
 =?utf-8?B?S283cGpSYUlhUllRQWJDYmFMV3NPRXpPdk5JR0ZrcUFxNkM4N25hSlQ4YXNh?=
 =?utf-8?B?bFp4dkl2bGw2UmEvVUNXOUFlK0ZucXhjUkxxL0ZOQk9aMWRVRGQ5LzJNa0ZC?=
 =?utf-8?B?TVJpNEpFUWtmSmYvek9lTERwb0VuS0RPOFJ6QmNjK0xPZ29tV0JnOU9CVzBP?=
 =?utf-8?B?MXhWVTZWSEtQU1JoSmFqNWlhVUJtQ3FaTmV6eFRmaHRqZDFWRmErMk10emhk?=
 =?utf-8?B?Zm5QaFRsQW9rS0Z2eEorc2lVUmlMMC9iNm5sVkxMaGdYdU5Zcy9Za3hrZEtT?=
 =?utf-8?B?Zjh6NEgxa3BTUmZGMExJY1pQTWNFdENXR0RWMWtZa0wyUzJIK3JBRnI2SEc1?=
 =?utf-8?B?ZDkrMFFuLzVzSC8rVVMvSE5hZ2x5d0VmUGl2SmNiODVhZ0dRa2dSMkFOaEVs?=
 =?utf-8?B?MXdsOTJYaUorOTFqZ1hTYSsyQ0NsZ1VnSkhZZm9sWmJnbGVVWVViZGpXSk9j?=
 =?utf-8?B?M2gxdWFuNFQ2cEdIZlo2dlYxSDFwbU5GTHdXd2FGWUhmcndvTS9WU1ZEMkR4?=
 =?utf-8?B?cGRRZXQ3L3JiVzVseFU0dFVqcm1qZUFIazk3UkFSYTNOMU04OXh5V09Bd0F6?=
 =?utf-8?B?ZGdBcDNvUDVsTUNOdllPMms4RUgvOEhCTkYvbW5vOC8yRGhKRGp0akVsaUY0?=
 =?utf-8?B?bjhleFd2TVJ5alcrWFNMVmR6d1FEWm14SDdIQkFqbmYxS28zVlFFdE5FMU5R?=
 =?utf-8?B?R3RtTFlLd3gzaUkyVWRCTkd3eWZmYkRsT1dVNlkwUHNsMGMzQW5NZXdmZmp3?=
 =?utf-8?B?YkFHUVVIeHNPSUhITk1ZV09MeUFHWFZ6c2VDRjNScExBek9oUk1YK2pWaC93?=
 =?utf-8?B?djdWUU5vRy9tTDlsMGZhY0lOd1lJMGltdURKWENWbHNycldXZW9Fd3pTSUht?=
 =?utf-8?B?alRBRXZWRXpDRDJZT3NGT1JWSVg0cVozeFNHL1UrcVZDM0l3TGN3RjUrWmRa?=
 =?utf-8?B?ZSt5ZDhWbEhoemxLVEpDQmJGeDlLVjQ0Q1k0bkNXRm5xMnBGNm1JK0NWQWRr?=
 =?utf-8?B?TVVJaFFsYk4wcXRMWlI5emZXQWJQWUhXMEhlMllzQlFUQ1RsejF3YzlWV0cy?=
 =?utf-8?B?eUxqUlluYjh1a21OcDRUL3dhYWZxcDU0by8yNEplUzlmbURrYlJ5TGQzZEdI?=
 =?utf-8?B?OXM2TTF5ZUppSXgyVUpvMzdhQjBxOXZYbzhpRUNYU3JSYnR6bnVLNGFibnVC?=
 =?utf-8?B?a21zOGVLZTRnb3QzQm0xTVQxOHRIN1FKVjloSUtTSGVSN2JRWmFxUllkeS9K?=
 =?utf-8?B?MFkrYlhHQ0xETnlsS3hSUXFrRFo5TFJUY3NKMmwvR0xVWGJHeGxiTmhzb05U?=
 =?utf-8?B?eVJpNTMrVklPYmpHdThQTnk0SGx5dUVSYjl0TkxmMXptMUJ3cUNZdEZEbXBw?=
 =?utf-8?B?bWlHUm1lOEZKMkpCWU1pdDQrU2FSMHJIcy9wczFKT05vSk5nRjdGbWpJTWdq?=
 =?utf-8?B?WWphRWkxeU9id2JqdXVUME53b0dwWHhOVE5RS3ZMN25xWFhhbXdkZW9BbGh1?=
 =?utf-8?B?WnRTT2JlSVJCMHNFcmltbnB4SDdXYmVzNk9IZk1ZUDZsZ3I2OU1tUGppN252?=
 =?utf-8?B?dm9MS3U5WWsrWldnMHM0Mk03YU5hRUF6a2hrNk5HdDdnTWNOVkhEVWd0djB0?=
 =?utf-8?B?aSs0ZHR0VzNKaVZUTUVFYTZ0L1hxMlZ5dWhWTFVxMk00ci9pVHpmZk5jTDdo?=
 =?utf-8?B?Y2UwK0lmU1h2MTRqbDB5QzlxWEptRWJsR2lDUll2SDVmMTMwbVBvSUxaY25z?=
 =?utf-8?B?S2xuRUFqY0d1KzE0M0hQay92Q1lJdlpKUW5RNW9ueTdyWWxOLzV3LzFjOWdO?=
 =?utf-8?B?aTluNzNwYjVKZGVBMG05U1Q5aWJpVzVRTVNaUEorY3hvbWM4cENJODlHMk9R?=
 =?utf-8?B?UHhHTXpCTUVIdzEwdlBTRktDb0dWNXZYWHBEakl3ZW1XalppaXQzcnRSQzFX?=
 =?utf-8?B?cGhrdGFHOTRXY0pKeWFXZloyS2hRU25BdVNYdzlsaDBWNDBvc1pVQm5Zcldn?=
 =?utf-8?B?WmV0YkpSTnY3SWsrMXc1dGFwNXlIZTJ4aFlFdnpybmZpcDlaRC9hZmhIanBR?=
 =?utf-8?B?emZDQUpNUFA5bmlzMXhWNkJ4RjVhaXR0eGFOSWVDMElWTE5Pa3BySTkrSWtq?=
 =?utf-8?B?My9Oa2NDS2ZRTGZ4MDdwc1o4ckYwZFpFUHVRY0FpUjBKeXo2cUFHaDd5bVJp?=
 =?utf-8?B?MVhMOXp1Z0ozQkFVQUdBRW9NZTZVVDMwT1NOVENCVTdSQ0pBTjBUN2VtcmQ0?=
 =?utf-8?Q?CJAbdHoL3bdY71So=3D?=
X-Exchange-RoutingPolicyChecked: dLdc0fYRN1MHo77lQsb7lL8N9F0CEs7Bfii0t8E8ZIHkfgXPTujJ24xKViubN6NHjqe5iYWcVVcIhOUsgjc9UrhqCHOZAnL57naxJ/FGXRa0dU8JL2a36FZYIvI2aiCzWqfPXYK7ZB3rJGmiSj3FHm6kSncvcvDuUe1CB4jFcyRpQ4Ij8lo7dny1SMFdiZTKd75DRXJXWyTCERxj3C59hlardcZqPlRoHqu3hgBZR+4aEO9X88NWKlfjBBlutHNzzRFAQyDdydWs5INA7XHFqiH07MD1P4mvBG03Ayw8GuTGO6CR5wAymw965fhvCi8IpysMJDJpPXrWNttkVc1wnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 086b4d1f-dac6-4a43-129f-08de7e8a8c14
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:51:05.8525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NVmTcRJl7vQEA32s7EOmtBirv9KoRnjf5uA5IRSmXEnBvDVI3hcaNPx3EUf9uZ2gNTZh6EHIChJoOBuUtY44Igy4VBu7VkAi231D3ub5hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
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

On Mon, Mar 09, 2026 at 02:40:41PM +0530, Umesh Nerlige Ramappa wrote:
>On Mon, Mar 02, 2026 at 12:10:04AM -0800, Anoop, Vijay wrote:
>>From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>Add register definitions for System Controller mailbox interface:
>>- Control and data registers
>>- MKHI protocol frame control fields
>>- Base address and BAR configuration
>>
>>No functional changes, just register definitions.
>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>---
>>v4: (Matt)
>>- Use lowercase hex values
>>- Align macro definitions to column 49
>>- Change to relative register offsets
>>
>>v6: (Matt)
>>- Move protocol constants to xe_sysctrl_mailbox_types.h
>>- Add SYSCTRL_MB_CTRL_MKHI_CMD helper macro
>>---
>>drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h | 36 +++++++++++++++++++++++
>>1 file changed, 36 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>>new file mode 100644
>>index 000000000000..f3c00f54a2ce
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>>@@ -0,0 +1,36 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_SYSCTRL_REGS_H_
>>+#define _XE_SYSCTRL_REGS_H_
>>+
>>+#include "xe_regs.h"
>>+
>>+#define SYSCTRL_BASE_OFFSET			0xdb000
>>+#define SYSCTRL_BASE				(SOC_BASE + SYSCTRL_BASE_OFFSET)
>>+#define SYSCTRL_MAILBOX_INDEX			0x03
>>+#define SYSCTRL_BAR_LENGTH			0x1000
>>+
>>+#define SYSCTRL_MB_CTRL				XE_REG(0x10)
>>+#define   SYSCTRL_MB_CTRL_RUN_BUSY		REG_BIT(31)
>>+#define   SYSCTRL_MB_CTRL_IRQ			REG_BIT(30)
>>+#define   SYSCTRL_MB_CTRL_RUN_BUSY_OUT		REG_BIT(29)
>>+#define   SYSCTRL_MB_CTRL_PARAM3_MASK		REG_GENMASK(28, 24)
>>+#define   SYSCTRL_MB_CTRL_PARAM2_MASK		REG_GENMASK(23, 16)
>>+#define   SYSCTRL_MB_CTRL_PARAM1_MASK		REG_GENMASK(15, 8)
>>+#define   SYSCTRL_MB_CTRL_COMMAND_MASK		REG_GENMASK(7, 0)
>>+#define   SYSCTRL_MB_CTRL_MKHI_CMD		REG_FIELD_PREP(SYSCTRL_MB_CTRL_COMMAND_MASK, 5)
>>+
>>+#define SYSCTRL_MB_DATA0			XE_REG(0x14)
>>+#define SYSCTRL_MB_DATA1			XE_REG(0x18)
>>+#define SYSCTRL_MB_DATA2			XE_REG(0x1C)
>
>s/1C/1c/ if converting to lowercase.
nit ^

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Umesh
>>+#define SYSCTRL_MB_DATA3			XE_REG(0x20)
>>+
>>+#define MKHI_FRAME_PHASE			REG_BIT(24)
>>+#define MKHI_FRAME_CURRENT_MASK			REG_GENMASK(21, 16)
>>+#define MKHI_FRAME_TOTAL_MASK			REG_GENMASK(13, 8)
>>+#define MKHI_FRAME_COMMAND_MASK			REG_GENMASK(7, 0)
>>+
>>+#endif
>>-- 
k>2.43.0
>>
