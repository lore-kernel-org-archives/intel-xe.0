Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF741073CAB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 12:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8484B10E63D;
	Wed,  8 Apr 2026 12:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0uXNQdJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DFF10E63B
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775652075; x=1807188075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ojYiQd0J381JKfYUwZnkcU47HGQqoSSjp00Prc6je3U=;
 b=M0uXNQdJU0beoCTwC8yrak1Q0BhZCsomj2Z2P1jlpMgyBSyvJbYI/vjX
 x1xhMNfpBJXern1qzTqyJtUbPcrmd9TYetYqzlafeHKF8V6hXChzZuCs7
 hR2+37cpL0F/QdEfNGjEtsG9dNl+b7DrZuF/3mPulUWNOyZP7fJD2H1Im
 /sCs/HYSP58Ryza8bJL4YRlIVtrGAYvbZiDkSmV6SuIkky+E8200I342x
 0fCgj25kVBjaJvdk/unUq6WUMi+K8WRFISzfsJOvKphJAGnQg3uznuJdU
 F57lex+cK63lKzTLN0Cj+l4Oqsl3YMV32W49/+J2lU8ad+puLE0x0Po8e A==;
X-CSE-ConnectionGUID: /ai8WXJITYOdwDCe8hFe0Q==
X-CSE-MsgGUID: TKlFlYshSNSZkPti+6piPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76754390"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76754390"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:41:14 -0700
X-CSE-ConnectionGUID: lebrjy/kS2qbdUyJYqqcqQ==
X-CSE-MsgGUID: O8mP55CoR5yAHkCsaXrArQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:41:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 05:41:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 05:41:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 05:41:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ht6+sCzBysbXV0ONugandbzdAbJ4Pro4JNPcCD9L0w+OyLQbt7ZnkoHkL/xK4iwtnoAi1Duej83pl6Bd6JlseHtIwToTgyGIVJRpbK0NwUGlVjtzqb3OVOgdWiwokhIWuVLawxlV5eNqTDIBSu73iK96wdu6ojSltf2eyRi4LS2Z8Of/rlLDt5pg8RSb+KbqECctdUYajCjjaAnQhLU2kjzC40yPUKJoaDiX3Mgs1JUCuoDfQlkPfcBbJw1ZObRtgxHamx0/NweKOGpW06CrWWhuTLY/a91SO+/+Nc5NOBAwVwwQyqmPk6NiQt7Fui4gX+yXTvFXnZEBTSR8iwTLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvNfLx601FznKh1Ldu4a6CEtAOx/t54NSub2Gq1d0ZA=;
 b=X4EuRaRNxA7CYXynF6r6YfIHnXyjnnmtHHbp2hFkEvONwmevqBLkby6B2hDktppM+IeE+tMTCsz6ZBsGagGQJsm/xEsLvTS5eUnxdsG/jMtQWQhwwBMiVRaVRYeUGdR6O4/ZJuDa1ECq12lS3Qwkv1i2yJWvpMJCPHkvyMyhLYYu1v0f8H7AGtYjK2n43MkUhfUcNZgLFAoUBNADL3fkCPkIAdvSQeTYK4GpitDv4WLiFJGLeskMvLOyWvGMaOES8PTOP/7tPGwHJXdt0gz5czGj8R8sYA+3uQT5TmG5iCax9wNDuEWVGyYP9/JifBuOZG7I0VdE4O6nvwwjsYHh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 12:41:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 12:41:00 +0000
Message-ID: <4ca0d2ff-b58e-46d5-b18e-9c78435bdf32@intel.com>
Date: Wed, 8 Apr 2026 14:40:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
To: "Summers, Stuart" <stuart.summers@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
References: <20260406225338.98533-1-stuart.summers@intel.com>
 <fa58f4c0-d126-417f-803f-7a521c5df8da@intel.com>
 <4c38349fdee090e69100437781c3f5cc2a354b4c.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <4c38349fdee090e69100437781c3f5cc2a354b4c.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0136.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d86b487-5f4b-445c-645e-08de956c16d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: r4IjdwBzhzcT5YoeGB1G59hDaKBryOP82byJlXhT4+gN+PR41wFwnbt6NLv8PMGUCSxCLfieQI0s0SEeU5vknGlwSQcwjRiNdHVEbyCAKMyriNFClZB4SOpNDbfFYbo4RcLg3VzoqT1bBQbZcSrN/2LrmZ7NIGlZN7PK5f4/XKEhQ4uZivJEmAO2G+uwRklGIlTs9m4LpPVZjSYQ1Mpr1jFq+KNax++87PBtSf4chMptT/w/rA3qGvK1gfffEYFbFJlyeV1M1IQ6fZ4k+cZHfXqrdcQY4tD4Av28b9B4TwI42HEsInYKGc6AWxWD/lEVwVW7CgQsjjj8ccgt6vuaagAcUbZV+wEomsQSjQPyJtrR2K09lh6Cv5plyvZiH99lgiRF5Xa4Bh0hfxRp3OJfcSgtYY6IG/L6OZcYZL37F9Q17R8vQkQldNirCH5WqFWUE4KAievzn2Y+Z5QuJGUHnnQp8kMHd39PZzrYlM92aQhaB4wj+uYJBeDvrddohvNOOyutDtj+wZr45FKXy9/4U0fzVi8MwJwtZnLrcy0zvGkx2xiG9QMS3iTUohkppWqtGD9iNmF3APIj36hdcnNg9SCaEK6z3yVPSvyvp7ivjjE3ZPKhWicNh59bIcsugN+Xdvede1yAu4zmZoEvdCQv6UszoTtlb8yS/3sWCjldY+Cv2M2ZHk25/ysYoxht6V6Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEdPRmRBK1hueW1EZG43M29jL3RuT3h5WVYyTTU0U3FpdzgvU3VGMU5ZSnlv?=
 =?utf-8?B?a3VsRU1zZU1jVExmUlZ3cjBITWtWS0xsdHV6aFJOUkpBN2lSVHVKY1o0ay9a?=
 =?utf-8?B?TzZjbkRWTmxiWG5uZWR1VkVSYVhreTAyM292RnFHVFREY1dTYXFHTHF0ZnY3?=
 =?utf-8?B?UVRybnNmVk93R2lPQ3N1SlNHVkxGTnJFQUdQSmFNckhUekhmOTc1Sk9SZ3Vr?=
 =?utf-8?B?V253aUZ6N3QxSmYrdTNxYVYvUGNWUmtxUmRSNGtEQ2pjRmlCRnpMV1lBRCt3?=
 =?utf-8?B?d1FzUkMwSFk5WldGTUZCZm9ucDZid3h5ZXdWeGl1ek5SKzRtdzh0RGdweWJi?=
 =?utf-8?B?Q012NzVUYkNqOS8yZ0JoNi9BaXV0cHNTZTJtazZCeGlrRTZFVm9jbUhEb2xt?=
 =?utf-8?B?YzR6TDlPS3JRdnFCcU04TDl2ekJPbDdhclhDb1RKUmJNcmRuR0t5U2J4S25Y?=
 =?utf-8?B?cUVTYnczLzZkSVRFK0QwMnNhSGlMcTVtNUhBbytWczJRWTAxQVREa3VxTzVp?=
 =?utf-8?B?dGJncnlWSUFiNHd6VllnK0lDZXkrRHc0RkhmdXEzMi9uR051WW00WE9qbnRz?=
 =?utf-8?B?QzI1blV0ZDlSdmhVZ1ZqWitkQWxDZGVHRTd4ZTlESHFxUHVPeGYyMjNPU2JU?=
 =?utf-8?B?NEM4c3NlTWVwdmJlcnVUUFNIMmRUWmJxdXZLSldiMS9iamdKNEM0Z2NybmRw?=
 =?utf-8?B?RjdQZll0cmtSbktWUjdFWEcrY2J5SFpkSVBhK3pPdjNFNmZINWVET3FQVE5O?=
 =?utf-8?B?bXJKWUN3dU1xdEIvVVcveDdzTGNsbTBVT0d3MlNwMEVDajR2NzMwd3RIYTlW?=
 =?utf-8?B?MkpDTFU1Rmo1ZWoyT1plQ3UwMTRZOFlvUUg0SHRWVmg5bm1HeitqcmdiMlNq?=
 =?utf-8?B?azdrYm11cndua0NkemtMSWROQmVhWmxjb0svdHo2eGk3Y3k5clp0a0h2RlpM?=
 =?utf-8?B?NWZMSlNtMk9XQ2NjNHROM1dFR3RvMFJXTTUxcVA0UU9UVGkxNlJwTUZmdEFF?=
 =?utf-8?B?M0k2M20zWkxOU0RVOFVTU3phUk55OXFmOVFsQWtlU1RVZDZIa0xGQnVhaVEz?=
 =?utf-8?B?MW1qMnpXRUlwdVVQcE84WHpIODhZRm11Smtrd1huYnZrS1VOOUE1L2tmcVZh?=
 =?utf-8?B?UjJZNStqdWxVSnNWc05pZk0raXg0emlkMkhuNENSOWRtT3RZNEdSM0JkbGlk?=
 =?utf-8?B?UlhhT2FFVjVhb2YvbkR0MmdpejAyOVh1NDBqejdWUjBjR25JOXA2NmhmclVz?=
 =?utf-8?B?N2U3WlZQRkVzaFUyVlpGUG01Z2FBTWtaSWwrQXY1ZlFTanBFaFZma21veXhI?=
 =?utf-8?B?UGJHYVlKdlVjbnBJaUJKQ0UyWUpEQWVXdGJ1bmpQblQvWFYzTVdJV2Jja2F1?=
 =?utf-8?B?WnUzREhFUUpCM0pTSEREVmprbFJHTEZWUTJRQ1ltK0lTR01IeWlhZHUwRVpR?=
 =?utf-8?B?R1BzRHU1UzdKMXdHQ0xWL3VzbXk0YUQySzZXbjBUVzJSbWxoUGxkeFZlSEJm?=
 =?utf-8?B?ZE1neGtWVGlUcUZwcmdxS1RoTDM2eXJESnJxZHljZ2xLdUFZdnA0WFptYWdX?=
 =?utf-8?B?QzhCMGhkQ0EzUGY4TjNFbGZNN0Z1WndFYk5IcExOeVVMQWhKak5OUUhCNUgy?=
 =?utf-8?B?N0ZyaThETHVHYk1CTkpJaWdUNk9KMXAwRDRPTFg3bVgrbmRadzQ3K09uaFpU?=
 =?utf-8?B?QVcrTHBYcGtkWVlrUnJodXMyTlE0a2krcVhYRzRlcytoRXR1Q09aYWdRV2My?=
 =?utf-8?B?eFJwSnRtQ0NsNGxna0wzZFh0YnpzZTZMS09sMDY1Q3dJS2R5b3NRT3kweVdX?=
 =?utf-8?B?cldPNkFTMG10RjlJQ3ltMHo5L2RHYWtwNFpubDFHTVVEd3R1cjRrZS9lK2tS?=
 =?utf-8?B?UStYZFFkdHF0R0V4YjF0S2NKL0l3Y0YzeDhQNVU1RjJ4UWFJWTAyaFcxYnBi?=
 =?utf-8?B?aFpiVEhnTE9laUk3dXVLTHVvS2ZGNFdaVVdQcjdSQXdDTFQ2YVlMZUNSVlVw?=
 =?utf-8?B?NkM2d2taUFFPNW12K2hYelBKZDg4L1gzU3FXd0hSSEZoOG5CUEFGSHhueWE2?=
 =?utf-8?B?eWZIOTlINnpaTXV5TXB5ZnBTeUxCYjNCRmdMMktyRk1sNUJKeHdsR0dxbWdx?=
 =?utf-8?B?VzJnVUpoYklsaW43MnNzZzd1MXMzcTk2Ym9VOWpyY0dPYUxVamszaHlWNTFp?=
 =?utf-8?B?SHlPZE5zL1NZbjA0ZmhFU1MvTjA0cTNhYUl4SysyS3ovTUFVaHkyS0pZWjFN?=
 =?utf-8?B?cGtwblVSbU1pVGVwYnZFaE1IWGhCMWhJeEczQUVYUzF4bW9DbStoWVlMaXBG?=
 =?utf-8?B?SkhQZGlXRklaQWpDM1NlTDh6NUtQYjJ1ZEFTK3Y5WVZkazFpQ0lkSUlFdy91?=
 =?utf-8?Q?OcsndDq+rVdInmQo=3D?=
X-Exchange-RoutingPolicyChecked: PlE05NsFO32q5cW2qQcRo8UNqdwddP4O5822D+q5N5cvkdg8k5BRkT1U7dHyvF6YugZpj/QcpyOOi93sr8ruFy9JSyyLMucdhXuDKN/xyVo8Gxwosiyu4yvwV4XXoqCCDQftZcGafvgMsY1R2vTAsjngDbYVI1AUS+YFs+A3npOuMVt3Hzj9d+TR3FhRXu9Dk71BIXGlyUzJebCABYzYtNOHDLfiCHDkAb6ksNgXqRaTwzCWIiMog6IGeLToBYXETjs3sYCz5CG1aIxEHxtrmyxkYZKy+6BGpuU7CjSD5nVbbjP7N/ZqNFfz7+EdHGK9IlrFJBPmR+8+q6cjSp/1sQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d86b487-5f4b-445c-645e-08de956c16d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 12:41:00.6846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ewIuuxOQLH052aOzLg4XXS7cnPKBVwwp7qlRfNaoasDjyo/yOkH2oz+SwU09K9thMCkSLM/ellmsvPsabe7cn51gJdX73WiE97+dknlZAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
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



On 4/7/2026 8:55 PM, Summers, Stuart wrote:
> On Tue, 2026-04-07 at 11:48 +0200, Michal Wajdeczko wrote:
>>
>> On 4/7/2026 12:53 AM, Stuart Summers wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> GuC provides the ability to gather logs through a hardware
>>> interface
>>> called NPK. For certain debugging scenarios this can be
>>> advantageous
>>> over getting logs from memory (or in addition to).
>>>
>>> Add a hook for this alternate debugging mode via a configfs. This
>>> translates into a parameter passed to GuC during load time.
>>>
>>> v2: Convert to configfs from modparam (Matt)
>>> v3: Configfs documentation formatting (Shuicheng)
>>>     Kerneldoc/comment add + configfs entry ordering
>>>     Only set the guc_log_target when GuC log is enabled (Daniele)
>>
>> nit: we may keep change log under --- so it stays on the ML only
> 
> Ok makes sense I'll do that on the next upload.
> 
>>
>> and please not forget to use -v option while preparing new patch
>> revisions
> 
> Thanks Michal, I'll make sure to include this going forward.
> 
>>
>> [1]
>> https://git-scm.com/docs/git-format-patch#Documentation/git-format-patch.txt--vn
>>
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>>> Acked-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_configfs.c | 70
>>> ++++++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_configfs.h |  5 +++
>>>  drivers/gpu/drm/xe/xe_defaults.h |  1 +
>>>  drivers/gpu/drm/xe/xe_guc.c      | 11 +++--
>>>  4 files changed, 84 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>>> b/drivers/gpu/drm/xe/xe_configfs.c
>>> index 32102600a148..e4511ee4e135 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> @@ -83,6 +83,16 @@
>>>   *
>>>   * This attribute can only be set before binding to the device.
>>>   *
>>> + * GuC log target:
>>> + * ---------------
>>> + *
>>> + * Set the destination for the GuC log. 0 - memory only (default),
>>> + * 1 - NPK only, 2 - memory + NPK. Example::
>>> + *
>>> + *     # echo 2 >
>>> /sys/kernel/config/xe/0000:03:00.0/guc_log_target
>>> + *
>>> + * This attribute can only be set before binding to the device.
>>> + *
>>>   * Allowed GT types:
>>>   * -----------------
>>>   *
>>> @@ -256,6 +266,7 @@ struct xe_config_group_device {
>>>         struct config_group sriov;
>>>  
>>>         struct xe_config_device {
>>> +               u8 guc_log_target;
>>>                 u64 gt_types_allowed;
>>>                 u64 engines_allowed;
>>>                 struct wa_bb
>>> ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>>> @@ -277,6 +288,7 @@ struct xe_config_group_device {
>>>  };
>>>  
>>>  static const struct xe_config_device device_defaults = {
>>> +       .guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
>>>         .gt_types_allowed = U64_MAX,
>>>         .engines_allowed = U64_MAX,
>>>         .survivability_mode = false,
>>> @@ -357,6 +369,41 @@ static bool is_bound(struct
>>> xe_config_group_device *dev)
>>>         return ret;
>>>  }
>>>  
>>
>> can we expose this new attribute only for XE_DEBUG_GUC config?
>> we can easily use xe_config_device_is_visible for this
> 
> Makes sense to me. I'll make the change.
> 
>>
>>> +static ssize_t guc_log_target_show(struct config_item *item, char
>>> *page)
>>> +{
>>> +       struct xe_config_device *dev = to_xe_config_device(item);
>>> +
>>> +       return sprintf(page, "%d\n", dev->guc_log_target);
>>> +}
>>> +
>>> +static ssize_t guc_log_target_store(struct config_item *item,
>>> const char *page, size_t len)
>>> +{
>>> +       struct xe_config_group_device *dev =
>>> to_xe_config_group_device(item);
>>> +       u8 guc_log_target;
>>> +       int ret;
>>> +
>>> +       ret = kstrtou8(page, 0, &guc_log_target);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       /*
>>> +        * No need to define full enumeration set since this is
>>> directly
>>> +        * applied from the user here to GuC.
>>> +        */
>>> +#define GUC_LOG_TARGET_MAX     2
>>
>> late to the party but agree with Daniele that this should be part of
>> the
>> GuC ABI file, and unlike Daniele I would prefer to enforce that as
>> otherwise
>> we will start again mixing local defines that we can change with GuC
>> definitions that we don't own and can't change
>>
>> (and yes, GUC_LOG_LEVEL min/max definitions should also follow that
>> rule
>> so they should be fixed too - someday ...)
> 
> Maybe I'll just include that in the next rev...

btw, as there might be more "GuC" specific attributes, maybe we should
try to group them?

/sys/kernel/config/xe/
└── 0000:4d:00.0
    ├── ...
    └── guc
        ├── firmware_path	""
        ├── log_level		0..5
        ├── log_npk		false|true
        ├── log_target		0..3
        └── ...

> 
>>
>> for me it looks that this MAX could be based on existing define:
>>
>> #define GUC_LOG_TARGET_MAX      FIELD_MAX(GUC_LOG_DESTINATION)
>>
>> but I'm wondering whether actually we should expose in stable
>> configfs
>> the low-level GuC ABI definitions
>>
>> maybe more safe solution would be to add just higher-level attribute
>>
>>         bool guc_npk; /* use NPK? default: false */
>>
>> and just convert that into GuC ABI bits in guc_ctl_debug_flags() ?
>>
>>         flags |= FIELD_PREP(GUC_LOG_DESTINATION,
>>                         xe_configfs_guc_npk(pdev) ?
>>                         GUC_LOG_TARGET_MEM_AND_NPK :
>>                         GUC_LOG_TARGET_MEM_ONLY);
> 
> So I do like having the ability to pick and chose how we configure the
> logging here. I think in most cases sending to both lmem and npk is
> what we want, but there might be some corner case debugs where any
> regular access to lmem (or even smem) like this causes problems and we
> really do just want to send everything to npk. And we could of course
> default to send to npk and lmem, but I think for the general case we
> will never actually use this - it's a debug only function.
> 
> But your point about ABI is fair here. We don't have any use case
> beyond these two targets today, but that doesn't mean it always has to
> be the case... We could enforce these values for 0-2 and only add
> additional destinations on top of that.
> 
> Although given this is really a debug feature, would it make more sense
> to split this out as part of a debug only configfs? That's really the
> case for almost all of what we have in configfs today, minus maybe the
> max VF configuration - it isn't about performance tuning or anything,
> just about reducing scope of the driver in one way or another or
> enabling some debug capability otherwise. To me that isn't a true ABI.

+1

but in the past I was told that configfs is ABI

> 
> What if I split this into xe_configfs.c and xe_configfs_debug.c, moved
> all of the debug specific entries to the latter with a little less
> restriction and kept the max VF one in xe_configfs.c for now? Then
> xe_configfs_debug.c can wrap in
> CONFIG_DRM_XE_DEBUG/CONFIG_DRM_XE_DEBUG_GUC?

so now that's the question to the maintainers - and I guess the main
question here is if already exposed attributes can be now hidden

(maybe we can just clarify that some entries are DEBUG only, and
thus may be changed/dropped in the future)

> 
> I'll wait to hear back before making a change like that so we're on the
> same page.
> 
>>
>>
>>> +       if (guc_log_target > GUC_LOG_TARGET_MAX)
>>> +               return -EINVAL;
>>> +#undef GUC_LOG_TARGET_MAX
>>> +> +    guard(mutex)(&dev->lock);
>>> +       if (is_bound(dev))
>>> +               return -EBUSY;
>>> +
>>> +       dev->config.guc_log_target = guc_log_target;
>>> +
>>> +       return len;
>>> +}
>>> +
>>>  static ssize_t survivability_mode_show(struct config_item *item,
>>> char *page)
>>>  {
>>>         struct xe_config_device *dev = to_xe_config_device(item);
>>> @@ -815,6 +862,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
>>>  CONFIGFS_ATTR(, enable_psmi);
>>>  CONFIGFS_ATTR(, engines_allowed);
>>>  CONFIGFS_ATTR(, gt_types_allowed);
>>> +CONFIGFS_ATTR(, guc_log_target);
>>>  CONFIGFS_ATTR(, survivability_mode);
>>>  
>>>  static struct configfs_attribute *xe_config_device_attrs[] = {
>>> @@ -823,6 +871,7 @@ static struct configfs_attribute
>>> *xe_config_device_attrs[] = {
>>>         &attr_enable_psmi,
>>>         &attr_engines_allowed,
>>>         &attr_gt_types_allowed,
>>> +       &attr_guc_log_target,
>>>         &attr_survivability_mode,
>>>         NULL,
>>>  };
>>> @@ -1095,6 +1144,7 @@ static void dump_custom_dev_config(struct
>>> pci_dev *pdev,
>>>                                  dev->config.attr_); \
>>>         } while (0)
>>>  
>>> +       PRI_CUSTOM_ATTR("%d", guc_log_target);
>>>         PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>>>         PRI_CUSTOM_ATTR("%llx", engines_allowed);
>>>         PRI_CUSTOM_ATTR("%d", enable_psmi);
>>> @@ -1147,6 +1197,26 @@ bool
>>> xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>>>         return mode;
>>>  }
>>>  
>>> +/**
>>> + * xe_configfs_get_guc_log_target - get configfs GuC log target
>>> attribute
>>
>> nit: we try to append () to the function name in doc, like:
>>
>>     * xe_configfs_get_guc_log_target() - Get GuC log target
>> attribute.
> 
> Ah makes sense thanks.
> 
> Thanks,
> Stuart
> 
>>
>> [2]
>> https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
>>
>>> + * @pdev: pci device
>>> + *
>>> + * Return: guc_log_target attribute in configfs
>>> + */
>>> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
>>> +{
>>> +       struct xe_config_group_device *dev =
>>> find_xe_config_group_device(pdev);
>>> +       u8 target;
>>> +
>>> +       if (!dev)
>>> +               return device_defaults.guc_log_target;
>>> +
>>> +       target = dev->config.guc_log_target;
>>> +       config_group_put(&dev->group);
>>> +
>>> +       return target;
>>> +}
>>> +
>>>  static u64 get_gt_types_allowed(struct pci_dev *pdev)
>>>  {
>>>         struct xe_config_group_device *dev =
>>> find_xe_config_group_device(pdev);
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>>> b/drivers/gpu/drm/xe/xe_configfs.h
>>> index 07d62bf0c152..fb5cb7c57e75 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>>> @@ -19,6 +19,7 @@ int xe_configfs_init(void);
>>>  void xe_configfs_exit(void);
>>>  void xe_configfs_check_device(struct pci_dev *pdev);
>>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
>>>  bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>>>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>>>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>>> @@ -38,6 +39,10 @@ static inline int xe_configfs_init(void) {
>>> return 0; }
>>>  static inline void xe_configfs_exit(void) { }
>>>  static inline void xe_configfs_check_device(struct pci_dev *pdev)
>>> { }
>>>  static inline bool xe_configfs_get_survivability_mode(struct
>>> pci_dev *pdev) { return false; }
>>> +static inline u8 xe_configfs_get_guc_log_target(struct pci_dev
>>> *pdev)
>>> +{
>>> +       return XE_DEFAULT_GUC_LOG_TARGET;
>>> +}
>>>  static inline bool xe_configfs_primary_gt_allowed(struct pci_dev
>>> *pdev) { return true; }
>>>  static inline bool xe_configfs_media_gt_allowed(struct pci_dev
>>> *pdev) { return true; }
>>>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev
>>> *pdev) { return U64_MAX; }
>>> diff --git a/drivers/gpu/drm/xe/xe_defaults.h
>>> b/drivers/gpu/drm/xe/xe_defaults.h
>>> index c8ae1d5f3d60..fbe670668a04 100644
>>> --- a/drivers/gpu/drm/xe/xe_defaults.h
>>> +++ b/drivers/gpu/drm/xe/xe_defaults.h
>>> @@ -12,6 +12,7 @@
>>>  #else
>>>  #define XE_DEFAULT_GUC_LOG_LEVEL               1
>>>  #endif
>>> +#define XE_DEFAULT_GUC_LOG_TARGET              0
>>>  
>>>  #define
>>> XE_DEFAULT_PROBE_DISPLAY               IS_ENABLED(CONFIG_DRM_XE_DIS
>>> PLAY)
>>>  #define XE_DEFAULT_VRAM_BAR_SIZE               0
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c
>>> b/drivers/gpu/drm/xe/xe_guc.c
>>> index e762eada21db..c40bd4aec2ce 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -73,13 +73,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>>  
>>>  static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>>  {
>>> +       struct pci_dev *pdev = to_pci_dev(guc_to_xe(guc)->drm.dev);
>>>         u32 level = xe_guc_log_get_level(&guc->log);
>>>         u32 flags = 0;
>>>  
>>> -       if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
>>> +       if (!GUC_LOG_LEVEL_IS_VERBOSE(level)) {
>>>                 flags |= GUC_LOG_DISABLED;
>>> -       else
>>> -               flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
>>> GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>> +       } else {
>>> +               flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
>>> +                                  
>>> GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>> +               flags |= FIELD_PREP(GUC_LOG_DESTINATION,
>>> +                                  
>>> xe_configfs_get_guc_log_target(pdev));
>>> +       }
>>>  
>>>         return flags;
>>>  }
>>
> 

