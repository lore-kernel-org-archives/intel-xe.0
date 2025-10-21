Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F82CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 13:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F1B10E5E4;
	Tue, 21 Oct 2025 13:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUmIY9Cp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1775710E5E4
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761052560; x=1792588560;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oLnmRk0KmXVwDqdBVMKUiQvwa+Ay4MM8biTdEHwyXXs=;
 b=lUmIY9CpwMNCzlHT8NzxPfszLhHzEpPfgT0HDDpYlHIftVQh9RaSEQeq
 950KXAt2JCQAxW9cfiIfivxcIN6P5sQkMhAvm2EBnnncN2MjlXh7RnQRk
 ZdPijOUeyFvNZt6vRWvTv8Hcrx5NCRScuGCVKcLEqch/BbZcF5h2Wpaey
 4cUhN3cbPLYed+ytnxfaBL1NqCPZQXXJ/oV6TE/jmSHx1iDUxrG7TcE1J
 O9T/lAt3uzafetLiGRDaICs9i6bb4JX5QQbtVEgUDHOQfZ8kyaG3iCpTm
 VTe0DN64zKGq1N79UPWp5A4gpnfIT84HrkwD1skTIXK78zv6TtwpNcuwP w==;
X-CSE-ConnectionGUID: B3+RAqr1TOmVIxUMW+g0Ew==
X-CSE-MsgGUID: xSXNmkb4T4+7qs8h8itJ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67040864"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="67040864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 06:15:59 -0700
X-CSE-ConnectionGUID: CK8KJqFKQnSkNK7C6Pi/SQ==
X-CSE-MsgGUID: H41EldkwRxyOSpMO3el5Mw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 06:15:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 06:15:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 06:15:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 06:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZheyeiQ/sxm2FKSt2nn+BA1CBWRkQS0tVeD2TxEj5Y+p8OyccXJYaHz9N0AJ5UoBkMw32T3jcEbMKGopwWTJOqJdSST4/VeUNOfCgEp/F14EODof9ce8yPhP4wioS4RZ/38LUMlvg3Kak3q4KCL+6xvSR+IyzCqHpApJmYp0JNXeI0H6EXpSovbQQcP3/1sf0P/8YKUNAL9iembNzL6z2nzA3cyWl5UPZKoFfmvhP6q/+IFHuN3XrfnPjF20miAZTEuz4RgzjDS6M+lBp3cp+2lSILOuXEkzrSAVzaOaDsFeOf4UFi/0cHNFfEfi/qUpUEh/njyiVmwfKnTfP4Fsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDsg6qKYAGgqv/+Qm1ApdPzuJwDNHZqAVmGRhynp7LI=;
 b=Y8HUHm4uhS2RoMAlZzY6JLN64yCAbKvp09+FCkMatPtz4ckByHPjGtNsuWRT48C3Ge63GoPUFMIF5uDCQqMmoypc8l9n4RJhewk1ngiZUmFqhNSaXQ6gVNWWbuAvGSZwCrQeLEPGxi85M0jMpdFGwLfJszef5Ob6FzPYe9UzBSSNKsho9GVWxK9b/MFSbnob+wWzRqTjUQuh74NSErDJ3KbOMSCpMpDTPGTwcUul9Fv7vVu8IlU9Kooz2utzuEoOLTHzx+38LKj8OIURG9Z3uhFViM5kZOVfXm1fi5/ZR8nlElaNQnTCpSLOJqa/fvtRVHwZu8HQpBYyNzlydf61YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB8235.namprd11.prod.outlook.com (2603:10b6:610:187::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 13:15:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 13:15:55 +0000
Message-ID: <15bc327f-275a-4b03-8ce9-e69e29237d82@intel.com>
Date: Tue, 21 Oct 2025 15:15:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/xe: Add xe_ggtt_node_addr() to avoid
 dereferencing xe_ggtt_node
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
References: <20251021121814.2193153-9-dev@lankhorst.se>
 <20251021121814.2193153-12-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021121814.2193153-12-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: de5c1a61-570f-4fe9-8e64-08de10a3f773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjdwT2lacTYrZUFvMXBadzZ3Z3BUcXZyQ3FTQWNGMWxQWFQ5am9GZkdGWTM0?=
 =?utf-8?B?eVRhNWJYdmRobStaQUJCV25INWJNV0NWb3RkUlE0QmoxOVl5Mnd0aCtrZEhq?=
 =?utf-8?B?WDZVSTE5alRxeHF5NWJxUzgzSGk5VmlNaWVkM0ZBb0VuOVhiNFB1c2s3RTgz?=
 =?utf-8?B?dklJKzlmMDJnMVY3VXlLODI3bDc5OEkycmFOUDhab3BuOVIzdWlPMTZMSFVH?=
 =?utf-8?B?c3VXSExQM2xRUWtrbmlJSE1SbDhyV01IdTZkTWR0cUVYZjhjdVJqaVJsSlFN?=
 =?utf-8?B?WHd5WHpTL2d6SHcySFhzVkV5MGorQjFselprbXQ0aVo4MllaNXlVV2d2eFE5?=
 =?utf-8?B?THRQSGtYWVZpcTkySzFBSUpkM3RnQ0FWMVZlZktJaW9TRmlMZnNKNnRKQVN1?=
 =?utf-8?B?dmNSR055UnhGYVlMcHZEWjNFNUNLZ1JhcHNHZlRKTk1GK25qS04rR3FnOVZC?=
 =?utf-8?B?emhKejlvZUdGVG5SSDRpaHV2QjEwOHh5K2hpTTJlRWpNSk5BVDZsMEYxM2hH?=
 =?utf-8?B?dzMydVRFOVZXSk9JV0NUaHVlc25IOFA2bGdZODFjem9GR1k1RmpHUnMxOXdR?=
 =?utf-8?B?bTBIR0lwbXo3dXF1MzFGbUhieS9RaTJ0aUpQZmR4UVRQY2JYcXZSN3lvTXBl?=
 =?utf-8?B?SjlldUxBR2NGeEltSlEwOVlhVFNSeWRKNlpsMFN4WlBwa28yOWNPQTlOZnRo?=
 =?utf-8?B?TEs1MmxpdTEwY0w5YjJJT2R4NkdEdjliQU1MajZRSUdRSzNFdWNBSmtSSFJq?=
 =?utf-8?B?Y2FwUWV3Wlc5VXJ2MGQ5S2l1ZEJlN1pQMi9QZk1wUFZCY1VYQ0RmMVc1WXdz?=
 =?utf-8?B?NE9pR2I1Smg1K0dlSWhhNHo1NnZlVnZwVGMwdXVIQ0FqazUyOXM1VXZncmpv?=
 =?utf-8?B?cmFyejY2a2xxdHg3MDRON1AxQnM1NDEvaGJ5NUJmUE93N1Y3dWZGRE9WcHQx?=
 =?utf-8?B?TWs1c3M2bUx6RjZzTWRsaXJRZVpTUTV3TzRrTVNmekxCaGtlQUJWbldhbmp3?=
 =?utf-8?B?VzhBSkFtSGEyR3FodnI5eUU4UFBEV1Vva0ZVeHJQUEFKUkdSTHFjajVWak1V?=
 =?utf-8?B?bllWZ2ViSVQwYklYNnpsd3pKN3lUcFowNFduNTRUa0NtQkZyS1Q0SG5IVTFQ?=
 =?utf-8?B?am1CaUhiUmFvbW5MS205YmFmcjFUQjFpU0NnWksyTlpTcms2M1FRb05iRDdp?=
 =?utf-8?B?NVB3b3hwQTJIbVF6WVhMSUM4K0xlT2tYc2tEalBXUENJNWRyalVKNHdIMjFk?=
 =?utf-8?B?NnRHZytKNm1rcVFFMklobVN0cWNoQStnOTlPQTZZcmNxY2FhRi91VnpXNEwz?=
 =?utf-8?B?UUZ6bTdFK2VJM0JiMjhXYW9vakFhaE9wNmtONHNXOWM5NGRXV0x6MmRBbG9H?=
 =?utf-8?B?bUgxL1h2MkpqZ05WcnNzemw4UzRZMm1SQzdtUjR2WVhXNXBJM1J6QllpcVBy?=
 =?utf-8?B?ZzVzRk1vSk9mcXlHQ1JEOTB4WUMxZU0vd2xKNzBJZlJLb3V3czhsK3BHQXQz?=
 =?utf-8?B?d3M4U1pveHhOZGZ2bDV0VkozSm1zYm1CemxiR3hHTE02Qzd3N1JvN1UweFZw?=
 =?utf-8?B?VHhWSVY2cVU4UGN1SyttTUpYOElHcDl0UXc4ZlZSN3MraG9kSHRWVVpybmRs?=
 =?utf-8?B?a0VmRUFvbDlTZkZvWWFUbUo0cTdnUUVZc2luSFZmdXJFM25rdWY2N0Y1NE85?=
 =?utf-8?B?Z2p3a0puU0dSQ25LTVhPNFkzSEswNzNyRHFVQXl4bXFjSngyYVQxS01lMExX?=
 =?utf-8?B?MXdEb1p6NzBFSTdyRk9TSS8zM2psWURobXVRTFZKNzJFK3RMUld3cUlNN0Fs?=
 =?utf-8?B?cGE0MERXaXBJK2JENlFscjJrRXRqZVM5UHBmcUxBZUIyNE45d0ZLUlcvQjd5?=
 =?utf-8?B?ejZjUVhrMG1FQ3VJaVBqdUxCN0VqOFROT1R3Q1NjV2FiRkpreitwQ1VkaE0r?=
 =?utf-8?Q?E3aOXCr6cKaJUr749/+Rj73XsojjR9Dn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0FYcWVySXJvTzJSb3pMcTRsYVVCS0grcllsUEQwTUlzNlNsWlJmN2VVNitN?=
 =?utf-8?B?cTZ4djJmeEJEK2ozS2UyZ0p6dVlrNll0Z3JqZzF5bmVOQm12dE1yMG9TZElq?=
 =?utf-8?B?cmRud0pUQ0QxZnYzcnIvdEJvK255ZVFzSmlhMnV6QWZyY2VlNmJhUnVIZVJR?=
 =?utf-8?B?M1krTEtsWnV6S3MrWW5ubS82Y0FtR1FJb3BKTFJMeEpVdVVVdGxzTWEwNlJD?=
 =?utf-8?B?LzVwTTVqWlA3WXRUL1BsQWM2WEkxbHFNdkRDRjR2aXE2dFAzTVFBaVBldzQv?=
 =?utf-8?B?Qy8vR2paaW04M1MrTGFVT0JoUnNObnk4ZWllSjQzSWVrVDlYRDZib1hsTlpv?=
 =?utf-8?B?N25EYnlnS0JWakVhakNKeHFBcFB6WnVHcFU0d01Ob3BjUXFxejVHQXoyd1hu?=
 =?utf-8?B?SlRpcHlsams3bDZzZXBXbS85cmdvcURJU1JQaVlNUnhXNDBLVjM3TVdweVU0?=
 =?utf-8?B?L25tRlduMVE4Z25nZjJQaThwV3AvNGF4SXl3SHN3QWU0eHlHZ3VaaDJhRlRj?=
 =?utf-8?B?NkloS1JnTE1lcjJrTW90K2p3dUl0Qk4zdkVqaXpVc2lGcVZhbjl3c3p0Wktu?=
 =?utf-8?B?USt4MExORWpBQXBEK3Q2MTJjN1ZjMmVKUWkwZ05ycVpkRDV0Nm13T3QrTExZ?=
 =?utf-8?B?VVpNTlVsZ3M1NkkweHlQNHFySkE4TzR3RnpRM28zN0hzclNHRmExY3BDcExU?=
 =?utf-8?B?N0t1NXA3ajdWQ0VPWmJaUE9tbzhiWWp3VkdZSHNQNUFNbkFROGkweHFxRjc4?=
 =?utf-8?B?cE55Rk1rUS9EOFZPSUh0WTNoM0VteGVkTURIWjFQRW5SVVZzeldjeDdpdDJh?=
 =?utf-8?B?UlNpSzBxdGhTejB4UzJRbDJGdjBxay9rOUR1TDJkdlFGNmFpbnBmMEI3aG45?=
 =?utf-8?B?SWxGODVYVFRTems3VldNUmlrNndVdE1aOWI4TDQzVjdGdXhlOG9CMHlKL3Bn?=
 =?utf-8?B?U09sK3lJMjlFN1lKR1MxQ2dqWG5JTEZKQjdiUU1sdDFLb2s1aXIyVllNanZE?=
 =?utf-8?B?Z2FKYXBnQjFkMHcxZGlUcTNIVDNhVVFOeW1SRUQ1eEk0bWxyRGpsY2xiaXE5?=
 =?utf-8?B?K2YvMXFHNVhiZUZoMDJJSysxSENFR21VdVdFalF4NUpRWjRDamcvaEJzdnVN?=
 =?utf-8?B?YVB2dnVPOU9zRkU2T3ByczdsMy9QNDM0aGxGU1lpVDZseFR1UDNRT3BhR2N0?=
 =?utf-8?B?NmhMT1BSUXpiV25sLytnQWRkR3ZDeEhKNURKdk5tc2NZL3ppWWpHcTdqUG1j?=
 =?utf-8?B?NzVGUlJ0NmdCc1lYd2NSbkN4TGhwWi8ya2VsT0V5VnNaQTMzTDVFbUlCN2Jy?=
 =?utf-8?B?cHI1VXVLQzM2eGc1dEt5MUkyZ1VxVDZkQWpMMGxYdnlvSEFnYzB2TUhZV01T?=
 =?utf-8?B?TVBBR3hIc24yYk80SHlPb0wwVnpRbUp0NCtxakQ4MlVlUldoc0doZ1BBeS8r?=
 =?utf-8?B?UkdSdUVGZHRGVnZUNXdobnY3U0JMeElyNWtXWTBzQnNzTlhQSkkzdVdvZ09r?=
 =?utf-8?B?cU9Pd1NGYlZNTVVUb2xEaFJlVlJUNmhoS2FjY2VsWkFqVFFGbXlOM3hPcWc3?=
 =?utf-8?B?WktvRVdvcTNEMGNNTW5JdWFHUXZIdm5WeUMwTGNXMTBoRmFXNjNGeFpMM3U2?=
 =?utf-8?B?bDVhQjRFWkJsZVNtT0lWNkRmZll5WXNUTTZDVGNRVDhuczlsU3pVbFZ0QU10?=
 =?utf-8?B?aTVKM3pZTE8vcVpSaExhYTdTVmxUVDQ3NGxuRTB0bHFhOEhxYW9kSmZSaHFs?=
 =?utf-8?B?d2FjZlhDWFBhL0plVytIMUV2c2hXeUdibDIrbEJaNDZXeWVDSHVMekdpazRp?=
 =?utf-8?B?TXkzZ1Q4blBSNWYrN0todkhYTFlNazdSK3R0cUhkQzkxRFBvK1FGckJ1U0FS?=
 =?utf-8?B?R3g4eEs0a2M0RVVBcFJSWVpFZlBOUm1XblU4bVluRXhKcEpLUlVsNGVUL25l?=
 =?utf-8?B?dHlPaTJXOFpublo1SmtwSWlEZnJTSitERWgrU0RtNDNXWkJsTkNscFBnUVdh?=
 =?utf-8?B?N1dQbGp5eVdCNXlaVkF4S0d3elNLL3NzcURVMG9laWtYRFZ2Sk42NEIybHZW?=
 =?utf-8?B?VDdjVlBZdHcwbmlBMGVMUStzbEV1RDhObnlHSnZWdUNCOFFUM2pMdnIyL01W?=
 =?utf-8?B?dGZSVmp4SjVpUWxDTXBkWk93d01aUGk1WURKVGxkMEdpbzNaY2tnMGhFRHds?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de5c1a61-570f-4fe9-8e64-08de10a3f773
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 13:15:55.4128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jd8Tk6H4zkwLOt7PnoZPCgDr5+Qg8ZVGRrTq4wLaAigFAelgzafjtG/Q6L5NurrGFv52tAPjeTOjWwKBMQbzKMsThMjS3vFiTNLH1grsLgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8235
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



On 10/21/2025 2:18 PM, Maarten Lankhorst wrote:
> This function makes it possible to add an offset that is applied to
> all xe_ggtt_node's, and hides the internals from all its users.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.h   |  8 +++++---
>  drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 911d5b90461a2..9c3f0ebaa1554 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -9,6 +9,7 @@
>  #include <drm/ttm/ttm_tt.h>
>  
>  #include "xe_bo_types.h"
> +#include "xe_ggtt.h"
>  #include "xe_macros.h"
>  #include "xe_validation.h"
>  #include "xe_vm_types.h"
> @@ -251,13 +252,14 @@ static inline u32
>  __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
>  {
>  	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
> +	u64 offset;
>  
>  	if (XE_WARN_ON(!ggtt_node))
>  		return 0;
>  
> -	XE_WARN_ON(ggtt_node->base.size > xe_bo_size(bo));
> -	XE_WARN_ON(ggtt_node->base.start + ggtt_node->base.size > (1ull << 32));
> -	return ggtt_node->base.start;
> +	offset = xe_ggtt_node_addr(ggtt_node);
> +	XE_WARN_ON(offset + xe_bo_size(bo) > (1ull << 32));

maybe better to use U32_MAX and convert to:

	xe_assert(xe_bo_device(bo), offset + xe_bo_size(bo) <= U32_MAX);

or at least to xe-oriented:

	xe_WARN_ON(xe_bo_device(bo), offset + xe_bo_size(bo) > U32_MAX);

and what about checking bo_size vs node_size ?

> +	return offset;
>  }
>  
>  static inline u32
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 42e3caa3a6d9c..05515037e2d6a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -1079,3 +1079,14 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>  {
>  	return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
>  }
> +
> +/**
> + * xe_ggtt_node_addr - Get @node offset in GGTT.
> + * @node: &xe_ggtt_node
> + *
> + * Get the GGTT offset for allocated node.
> + */
> +u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
> +{

we can also have here:

	xe_ggtt_assert_fit(node->ggtt, node->base.start, node->base.size);

> +	return node->base.start;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index d54a2ae2b4aa8..4a8ef1b824156 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -58,4 +58,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_index);
>  u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
>  
> +u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node);

nit: shouldn't we keep "node" related functions together ?

> +
>  #endif

