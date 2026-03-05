Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8509DEFCE5E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 03:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290B410E160;
	Thu,  5 Mar 2026 03:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeQ8aw5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAD910E160
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772681922; x=1804217922;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z7T/Cv++KNdpbtsIEzxHlUxkg0oe8JmyYL30jvygdKI=;
 b=EeQ8aw5DD15ciq1yM6EF0kD6uWU/uyQ+oQtPR+4jMBG7kMU5cyrUPko6
 n4XhcXDNRD7IBvqvSdTgSH2cg7VnsQDb+lis5lWSFX8xX54K7koS53fDK
 M836xft5kjksoA9jTtNV9ZeDiHUSWIf6JLETQ3ElWfo7aNjzIHvlEU7ne
 gnby66SXnc2KylBVO3JFRSHYa2B83LUUxZyYFznUR46mAU7hpTtG+MOuK
 SVjY4pthd7L8A6PYi0SXHVFqfZLdVWZZf9MGbbsLJwkDnLp8E26n/NlzH
 HmaaXB3pZwfY8wh4Y7sPvhBme5behVvrznbMR0dAR9spOCX2JOnLP8PB9 w==;
X-CSE-ConnectionGUID: h6WU2ResQGG6bNDCcSTbBA==
X-CSE-MsgGUID: gIcwE/RSQaGiWkqAnb3Nig==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84093278"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="84093278"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 19:38:41 -0800
X-CSE-ConnectionGUID: b06bqj8yQ7Wjib56pH2BkQ==
X-CSE-MsgGUID: HfI4Ud6rSfO09/cvm5TlQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="216372183"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 19:38:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 19:38:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 19:38:39 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 19:38:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEQeP7Zb2gtXdGjP4i3db3BjNk8UAkC9MtL2Nttu6sqP3sTalyQbnP8AUeNlsI1wzK299Yx5jLpCy+aHfNG1EHhGQfChMcjk54dVsNiFZ8v5H9M9dHYDD/MDktHgRImtZZxCooM9xH98oxjrId4YU76hypxefP94DOT2g2qoRT5fTPCBCD/+ligfCf6tZoaqPRk1pyETugj6U975007od8aXK9s9G/a++S9f4t9vrP7QG34Zk9Q3JuV0ony0QgE/tTjFlIx9QzwnM99i+6GbICBUp3HUjssFK639fmp0ME9Tdodaz/5luY+sKFvUtgMoF74+D0pMI0Kb2wqLcecBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lswiopyITePsU76rheTgRIN9LrZtpV75EcenDYtT+bA=;
 b=DWGBWT/lJSsWctuyvXgL3XifmjhJlHs9OXxrYAhbMRvSFLsNbn3RFX3DeEbN2FSQEVDa3hfvaN3K6ql8jZqJ+AOJSNgo3Qpv5S6Iew/TMaJGC4PZ1WFNgZzSN0IFv1aTBCdNE7dNYN18ANDgfyccTJKgOXbA8TWbEkZCDTIjoePktTINv33+ntREdtfLMFD/ZYZgVSmNu3m2tFmdMdz41o+VY1jQP3WPnNMdM+dVbWGl9dwLTgUStLRkkk70AMtIkf5RS+gsQCe2lyl3V3i4EKT9zoKeXvGLoNwTZi/punMQry/jcSxsQl/kT2SxT+fuV8xeYQ0C8Ym5aCgQf+SXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 03:38:36 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 03:38:36 +0000
Message-ID: <ce4b99da-1e31-4ba0-83cc-bd4f2b0f4279@intel.com>
Date: Thu, 5 Mar 2026 09:08:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/7] drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU
 fault
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
 <20260219091312.796749-4-arvind.yadav@intel.com>
 <aZjAMO2aGh8cHbYg@lstrano-desk.jf.intel.com>
 <aZjhKPaPbR4l1C63@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aZjhKPaPbR4l1C63@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::7) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 51dc52c5-a996-4a19-9b69-08de7a68aebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: J+XS6fzpctK1AwUpjoVFLMMf0582MbafVCZQb5CM7O8hqV3z1/v+ltoLTipE1HAwssHE+d6PPAR4gpjQc7uigcdbsrkbPxKpOK2ILL3ZbasJXFfwz4IG/p0DCn5/qXZvOFIA6JPQeuuX1OiwBt+L2gpHXrFzBfaiaMGNJvwW4ZpB9lWJaPgyhF4eN/e9AKF/JDoKGp0aBG+UkNyR171U7vICheULLetWRUBVqLQ9ehs4oEaaKkBIz4qdAF0Jxm1bprRo86cvydz3/1Qj8UDX/sUxFQKAn1p9G3SUG0QqM4pf3lZSLG4BZNu33NWp/+mqRQ04B6v1oNW3V7q3VGosALA9v9hGDd00+FftFyD8aTLln3syWhe0G0rqNMJR34CSDEcBMuaP2/7tqLnIPBwB5sYi7I7I3CD7UzTJ4xvxrIMQmeSWF/TyNo/w+OyZYJy4qq7lW5HqVbdCw5uPr3+hD9aOUU1lBDlN/llbrgSmdnR5wR5m94O4Z7xb0sAEjLa4efwbG0KpRmmNSmmZ9CigkDt693/cDQKufVkqWHMknw74sj9abJxD1kz9gasnyMAKoi8BMjo5C0xzofUziVn7rp/xxWAUS8D3f9BTWUpG0tZilkPC/9DNtCN+Re8cVPTG/9L5l96SEhCJLLsCeIuutGYO8kDGq66k4RFUSXnCTFmPiF+yx54tgs+5dNn0Cwdr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRuQldTS2VpRllEQjg5MzJPL1hMbkZhbDZwSzQ0R3ZWVU1GUmJ1K0N4bjdr?=
 =?utf-8?B?OVNpWSt2OEN2Sko0TWxWcmZ4TzBTOXhPNCtodkovd2pUNWtuOGRKbmE5OWdn?=
 =?utf-8?B?YjNaZHU4OFRHUEsxTUFkSW5HWXRKVEhJUGJEU1RYdTlERW05K2RlMjRaZ3pI?=
 =?utf-8?B?NTVZZ1VKQXQ5M1RWbTR4OGlUZDBPbCs4K21RZWloTFcyZ0xQajRhYVlSeVJy?=
 =?utf-8?B?VGljUUNQOU10TWh4SkNiV1U5QXc5a3NzdDFUbFFlNlNyT3RkdEVSTUhxZUJP?=
 =?utf-8?B?WnRWVTVUQm44eHE4ZVdSUWxCM0RUd3J4VDhFRVMxTk5qdXlYVEVaK1FEUmlU?=
 =?utf-8?B?Qy9qMUhZWGxaSU5hVmZTWGhKZTdERkNEQWRlaS9HYnFQOFRDallZQld6MDd2?=
 =?utf-8?B?blIxK0dqOHU4ejNCcFFmZEoyNkUrbXRmSTJ1Wm1FdGVKbDNIRENHQnhRWnVJ?=
 =?utf-8?B?SldLRGk5eENBazZWMG01M1VyZXBQbXhOY0tGWmszaWFRYlBKSURRb2VVZlVi?=
 =?utf-8?B?Q2p3TmV5N08rVlZsaU1EVUpHRW5kUXZEWFpkaHJNdlFRMWhWQmNwMlg2Tkl6?=
 =?utf-8?B?Q3grYVZwV1NiRUdBVU84VndqMnZXdTBqR0RsellSbkk2VkplbUYwbGs1SDNs?=
 =?utf-8?B?VXZPZTNEWjdMWldzclEyY3pwWmxVOGphUGM4Uy9VZ01HY1lrUWZQYURGN2J0?=
 =?utf-8?B?RFNZb0tmam1XS1pLbkpzSUxBQndXTTZIeUlnbFovdXdGZ2FydnduZTJJL0VC?=
 =?utf-8?B?Z2Y3dHd0VzF6czNjT1MzWkdpVVF5bEt2SXIyaTY3RExOejc1RmwrWXRJeHIr?=
 =?utf-8?B?czFHbmExeUU1SW1FMU5TK2hwTldVR1ZqaUpWdHZOQ2I3c3ZJaGxWLys1V1dV?=
 =?utf-8?B?Z2RsN0FRMGg3QkJLc3dLTkF0ek1kcmhRek5DZ1Z1bk01TGE4M2N0WDF6NXpQ?=
 =?utf-8?B?Vjk4Zmh5cFl4RWNveWE4ZEtPcCtRMUptN1ZXT2cveWNUU1l1Y1k3R056TW1u?=
 =?utf-8?B?QWVyM3hjNXpCSzhnaE1ncUg3OXNCZFQyQW5qQVdSSWlTRkdLRldtTVRXSTZC?=
 =?utf-8?B?bko5OWgvTWMrcHFZT2NSOEh3Wkd4NVFhTVFhOTE2RWdpUjBJdHlySmNtZHBx?=
 =?utf-8?B?UFhaREMyRFRhak8rVUxQVTljT0JycGdPVGs5QmpoUHRaeWd5a3FBN2IyU2xF?=
 =?utf-8?B?UXQvZEl4VnRSMUlqSkVxLzM3MXJUNFNTOWtlWDNpNERIdXFTSTlaODdBQlFK?=
 =?utf-8?B?QjlFMHhzTGQ5eXVla2pIWG83eThzaW5vMFIxZmdVa2VRWjlxR1k5dTAvS1U4?=
 =?utf-8?B?Mk80RHlnUGpFaUpkaEtoc3NNRCtwL2xobjVSRnNsb2docU42UXVyY2tSbEl4?=
 =?utf-8?B?TUNaVERIYzNxckVsOU5nbm0vR1gwVmVkYnhaS1ltQ3p6aUJUKzhLZ0hUUzhp?=
 =?utf-8?B?S0pXMjd3aTdUU0JQbGxFcHQ2M0wrQ3QzQzAvR2Z0TmxpVG9mWWtTMlNvNXRS?=
 =?utf-8?B?NWFjZjA2dFRhUGNTM1NGRmZEcW91V2tTcitwZ0s0czR6K3ZHWTdCdUZtYnVL?=
 =?utf-8?B?NlRSSHZ1RTBhTjJ5bi9mNloxQVNXbENycS9aempjWkV5bE9kRW5XS0ZzQklo?=
 =?utf-8?B?WnQ3Q0FrbzI0UUI3aTlWSW00ait6TnZOSCtWeFYyZEpGWmRsVWJvdWErL1ZM?=
 =?utf-8?B?ZURCZ0JmUmZReVRFVnEvUEJwNnk1dEwwK1Nrek9nZHcyUCtWcC9NTmViVy9H?=
 =?utf-8?B?N3ZSdHpLaUJNZlEvaDRtREFoQmlvRVR5ZVNzeTZMaXNBa1psb3FFWXc1bWRy?=
 =?utf-8?B?TUZBQXBaaHFyZENxdWVZaFVLSEVLelUxbkJvZmN2WG56NXZMSlBHcWxjZnlC?=
 =?utf-8?B?YkQ0SCtTUzgrVURKUlRoNzFzdzM4TXVnZENWUVpnOG4rSjlSQ3BsMU40a0ow?=
 =?utf-8?B?amZPem5wQ1h0N3ZmZ2NWZmp2THlDU281dkMrRVl1S2tUdHVjVlVRS3FwYjVw?=
 =?utf-8?B?RWV6aE5IR3lYcCtlK2tpSW5FOGtBb01JNUR5NVVtM2pQZDNFSW1NZWxBUGxK?=
 =?utf-8?B?RWJXY1RKb2k0L09GV3MxQ3RVeGxBK2JldjRFd1owTFZBam9VaVVHc1ZTLzZw?=
 =?utf-8?B?MlVLYmRLR1B6akFOUDVtZ3BBZzhkOHlZNDlBTjZWSTNqenlVK01JK2JHcnh4?=
 =?utf-8?B?R3QzWDNtT1VsZ1dPeEt3cTlRTGlWSjFGMTZ0Qmg1aExyMk1CVUUyeUkwSDYv?=
 =?utf-8?B?QlZlbHE3TVNwTHJTMEx3OXN4NDFDVE4zUGozbnJsRUZiamcrVWJ3TzdzMFF0?=
 =?utf-8?B?bUJSQzBlK0dDbnY1dERXQWtzVmdkdXZ5emxuMFJEeElvbUtkdkJGdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dc52c5-a996-4a19-9b69-08de7a68aebd
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 03:38:36.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MX1EPXs+Pld+I66eeQhkjNRCHbRMNFhuj6TcAY7aydhyyVozQKp7OWUm1oXqMaPZojcKKpERd7YLhMb0cBr1sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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


On 21-02-2026 04:03, Matthew Brost wrote:
> On Fri, Feb 20, 2026 at 12:12:32PM -0800, Matthew Brost wrote:
>> On Thu, Feb 19, 2026 at 02:43:08PM +0530, Arvind Yadav wrote:
>>> Clear XE_VMA_CPU_AUTORESET_ACTIVE before installing GPU PTEs for CPU
>>> address mirror VMAs.
>>>
>>> This marks the one-way transition from CPU-only to GPU-touched so munmap
>>> handling can switch from the MADVISE autoreset notifier to the existing
>>> SVM notifier.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_svm.c | 10 ++++++++++
>>>   drivers/gpu/drm/xe/xe_vm.h  | 11 +++++++++++
>>>   2 files changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index cda3bf7e2418..b9dbbb245779 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -1209,6 +1209,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>   	lockdep_assert_held_write(&vm->lock);
>>>   	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>>>   
>>> +	/* Invariant: CPU_AUTORESET_ACTIVE cleared before reaching here. */
>>> +	WARN_ON_ONCE(xe_vma_has_cpu_autoreset_active(vma));
>>> +
>>>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>>>   
>>>   retry:
>>> @@ -1360,6 +1363,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>>   			    bool atomic)
>>>   {
>>>   	int need_vram, ret;
>>> +
>>> +	lockdep_assert_held_write(&vm->lock);
>>> +
>>> +	/* Transition CPU-only -> GPU-touched before installing PTEs. */
>>> +	if (xe_vma_has_cpu_autoreset_active(vma))
>>> +		xe_vma_gpu_touch(vma);
>> I don’t think this will work going forward. I plan on making the fault
>> handler run under vm->lock in read mode [1], and VMA state will only be
>> allowed to be modified under the lockdep constraints in [2], which are
>> vm->lock in write mode or vm->lock in read mode plus the garbage
>> collector lock. Maybe this is fine for now, and we can rework it once
>> [1] and [2] land—most likely by taking the garbage collector mutex
>> introduced in [1] before touching this VMA’s flags.
>>
>> Another issue is what happens if we don’t want to taint the VMA unless
>> we actually fault in a range. It is valid to not find a range to fault
>> in if this is a prefetch, as that fault just gets suppressed on the
>> device. So at a minimum, this needs to be moved to where the function
>> returns zero (i.e., by the out label).
>>
>> [1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/08fa2b95800583e804a91caf477f9c30b3440a33#33e7d2d9323cd529c8d587d9d3801e353439d783_181_179
>> [2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/08fa2b95800583e804a91caf477f9c30b3440a33#71bf077daec46f3ebd785235e8ecc786681aff99_1112_1128
>>

Good catch on both. I will move the gpu_touch to after 
__xe_svm_handle_pagefault() returns 0 so we donot taint on suppressed 
prefetch faults. For the future locking rework, happy to revisit — 
likely taking the GC mutex there as you mentioned.

>>> +
>>>   retry:
>>>   	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>>>   	if (need_vram < 0)
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>> index 7bf400f068ce..3dc549550c91 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>> @@ -423,4 +423,15 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>>>   	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>>>   
>>>   void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
>>> +
>>> +/**
>>> + * xe_vma_gpu_touch() - Mark VMA as GPU-touched
>>> + * @vma: VMA to mark
>>> + *
>>> + * Clear XE_VMA_CPU_AUTORESET_ACTIVE. Must be done before first GPU PTE install.
>>> + */
>>> +static inline void xe_vma_gpu_touch(struct xe_vma *vma)
>>> +{
>>> +	vma->gpuva.flags &= ~XE_VMA_CPU_AUTORESET_ACTIVE;
>> Thinking out loud — not strictly related to your series, but I think we
>> should route all accesses to vma->gpuva.flags through helpers with
>> lockdep annotations to prove we aren’t violating the rules I mentioned
>> above (right now this would just require vm->lock in write mode).
>>
> Actually I looked at this and exec IOCTLs can set some of the
> vma->gpuva.flags in vm->lock read mode only, so we basically don't have
> any rules for vma->gpuva.flags and it all happens to work by chance. So
> at minimum here let's define some clear rules /w lockdep for
> XE_VMA_CPU_AUTORESET_ACTIVE, if that needs to be moved out
> vma->gpuva.flags for now that would be my preference as we shouldn't
> make the usage of vma->gpuva.flags worse.


I will move it out of vma->gpuva.flags into a dedicated bool 
cpu_autoreset_active in struct xe_vma with explicit lockdep comment 
(write: vm->lock write; read: vm->lock read). 
XE_VMA_CPU_AUTORESET_ACTIVE is kept as a pipeline-only bit in 
op->map.vma_flags to carry state through MAP/REMAP ops, not stored in 
vma->gpuva.flags.

>
> Matt
>
>> Perhaps when I post [1] and [2], I can clean all of that up, or if you
>> want to transition all access to vma->gpuva.flags to helpers (e.g.,
>> xe_vma_write_flags(vma, mask), xe_vma_read_flags(vma, mask),
>> xe_vma_clear_flags(vma, mask)), I wouldn’t complain.


We can add the xe_vma_write_flags/read_flags/clear_flags wrappers too if 
you want that done in this series or prefer to do it alongside your 
locking rework.


Thanks,
Arvind

>>
>> Matt
>>
>>> +}
>>>   #endif
>>> -- 
>>> 2.43.0
>>>
