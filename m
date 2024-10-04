Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D0BCF34DD
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 02:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3556E10E276;
	Fri,  4 Oct 2024 02:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIp7mV6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAA310E9BA
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 02:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728008503; x=1759544503;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WVzEzijCDYTFtY9T79T73xnEUVNFCwHhYhqkNNzrr0c=;
 b=mIp7mV6tSKhDfEHi15qkmTfpTrEEWkMzn0KOANwftc0AUxqGygVI67Ne
 XNrgrfyZhW9zUCPGC3sAb1MO6/XLfigi5V+vPpirpqFfjaf0x7AAkVEOQ
 /gorDee4AthBKsenS9mOtZYQBCHHOQxp41MYt9mgFJhP516h8pALxb+zj
 AC8fIAiXfIVdDeYnRWAL8lH3rjFi5KzmAleCBHa2Fmnc7rT9WUerLEBky
 tnz9SPVZTNOvFAnwJlzDdnvItQJofHdJqUiaQu6EooDEKDLDclP0vB4Jx
 JODHXgGXl3fWk/ehtvCtlFop9qpCrRZPn1OqDFxJ01KBeluLbP6H5o4VP Q==;
X-CSE-ConnectionGUID: k+xU4F+GRpG58Q6S8BmlAg==
X-CSE-MsgGUID: kVxIe28LTDitdyqiAX/zCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30934834"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="30934834"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 19:21:42 -0700
X-CSE-ConnectionGUID: igLT/PZcTPqdqSyjg7fBOw==
X-CSE-MsgGUID: aMtBRUm1RjW9rGvobtrA7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="74562711"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 19:21:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 19:21:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 19:21:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 19:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvtRgCA5yjSNm8f17vcCNESbVSu9CP4DWA7x3KcAYsjlhBo3M069BIP+oWqdKAlKXszv7Mf2lE9sydQS9Dwxpy0F0W2BOqdLZMV33CDaTsB2nPMSvjzmdtHKDyOrZFuHuLFf17OYDJlX2Ig5rJgeeKl/9k8M64wzdtD+OIfHYBdf4SLiz/tI5NAKLSveoukZvT33TJ/JCNwJ1LE3MpWFE5QDPfex7566wDiyRjA2ikOqBFWliB9cV2rPlvQXCmSZcvD6O83yaS1GhWcNOeOdMYohZ1YJFtn9aSolbrwAKuCE3scIOL1pNB2DNlO9zjDwehC6p7+atUeUFy7ax6Klbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WhaXL1N4MNWL6eimY+Z+hWd3WrP2oipo4WGf3JLMhI=;
 b=kjDGd9ud6nCCK9wWUmyIkVvKqdJ6fq75PokaqCpH4jno93gxUaBv6J9tnnXuEx3FbLQsCAh6QJ+8RwE7Waax/sl9XW6DaLc+9Y7ELhAmL8oVq2VK7cGNybrCL2qnZ158DWeMVLAfSoi4GkHFWFPCnJGScc3PBl4aB5o5CBDDDMV6zYxGcdG5bE1afaJfJKF7dBneVvUawqUGte9eaXL3sE+gEgdnI7vFhGV0d9BiC/q/q1624ns1RCnfvjXLKOzUxbpS9Bbbm3+bQZt9qpQJpxJZ5a8CglFsd3xvpZP5bo4q99faehaym5R4lH9cMGtA8YAW7HMg39VVo5vujiphjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by PH7PR11MB8504.namprd11.prod.outlook.com (2603:10b6:510:2fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 02:21:31 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%6]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 02:21:31 +0000
Message-ID: <8a59bf46-759f-40da-ace5-7cb3cb02a9fb@intel.com>
Date: Thu, 3 Oct 2024 22:21:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 4/6] drm/xe/guc: Extract GuC error capture lists
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241003151626.2901703-1-zhanjun.dong@intel.com>
 <20241003151626.2901703-5-zhanjun.dong@intel.com>
 <6ebbd8a703734f51a39e4dcba6dd33997d8b9e6c.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <6ebbd8a703734f51a39e4dcba6dd33997d8b9e6c.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|PH7PR11MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 706c4ea1-6df1-47dc-86a1-08dce41b42a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXpzZkFIMnUyS3plNnVUOVhYMG1kQVZnQWNiWE5KU1lZYjduT2ZXY2JyUVIr?=
 =?utf-8?B?ZGF2Zms5a0Nqd0dhanRRSWtuSUlEY2tqdnVtb2VsT1hIOUQ4eTltSW5mVS9R?=
 =?utf-8?B?Y0NkVHRTWWsrTzhpcTlhZE0wTEptVysxbml5RFRYRkNZRENDaWZlZ2ZtZUQv?=
 =?utf-8?B?aVp2MVRSSmNKVUZFSGUwQWVoemNzZFFWZ1l2bS9rQTFwTXNtbE9xaE9hVTdY?=
 =?utf-8?B?THVZaWtkVEJUbk9RWnA4alduYmNoOFNoVGVHaElXWjRvNnBGR2plcytPRW91?=
 =?utf-8?B?VWorTWdXUyt6cTFEMk1BNlRWTjZIc0lVaWZYdGhwN0dSczFURmxNUnZraWtM?=
 =?utf-8?B?emxrcjdBOVBoRFZ1YzlzQy9VU0xjaDlxZUVnRUtrMnB5Sm9ET3lGMU5ibGxr?=
 =?utf-8?B?Z21zTG5SYXlhZmN6NXZxc1Q4anlrUm95bkxmQ0RmZk1LbmM4NHNycTZjOWF5?=
 =?utf-8?B?YzVCZFNZNFhKVEdjT1gyN0hRT0p3aFhvNWd0TmFCL085b2lzeW0reTBZcFJD?=
 =?utf-8?B?UG1uT1MyOU95dXdIbEFPQW4vL2x0RXRVMkVnNEtmL256bnhGRTRIZTBUa2hy?=
 =?utf-8?B?Y3RrQk0yajVraXpMWFYrYmZ0RGZuQzFUUVZFMXdTdTBqSEtxS21LYzBZVVcr?=
 =?utf-8?B?OTQ3NlNiSm55cE15N2RTVTNicDVlUHRLMDhHVVpZcldZcjJHOHpaR2dHNVo3?=
 =?utf-8?B?Z1FKc3FsRS96bUw5MkxBRDJrOG1wZUx2a1RodHBPamw4VmNIbXBCbC9CeUxH?=
 =?utf-8?B?Qjk4UTBTeitEOGR4MmkrYXorTVF2WUFkZ29ERVdKcUI5Ukg1Si9FNEtrSWtQ?=
 =?utf-8?B?MUxidDBUbEZ6SHFSQVY0dGJNNVFrODd1Q3VySmNSTENMRE9JZ3NBNkpzODNp?=
 =?utf-8?B?V1hCdmp6RUE5bVJVNVFBVHNpaUdIbnErTzg3RUJXSzY3S2xWdExmcW9KdXVM?=
 =?utf-8?B?QnI2dHc3T0w5UVBjSUxGY2JuUkdKeWNGMk0rUnh2TlBYRUZQT3lsOUhIaU9G?=
 =?utf-8?B?dVBaMWRJNWJGa1FpeUFWc0o5RzBaSXlXaHcxaTNycmNPNjFoK3I4VEE0Yk1l?=
 =?utf-8?B?RFNIQzZkUlF5NUtPZmtEem8vc0Q4UnliTXBIK08zR3ozYjA1QnE5TUNwOXlB?=
 =?utf-8?B?QytpbXBUeG90RlE0bkxIQVhFY2crcnp4MnZVek01aDI5djlSSWhRTHNXdFNQ?=
 =?utf-8?B?SnIySlY3d0FvWXdVbXdybTl6NGtlUmhZWENlYWR3VlVOYnEyZWhPbERnQnFM?=
 =?utf-8?B?U29pRER6OUlyQjg0SldhelZEcS9wVk8zWFZhekJUOVVOUXkvSXludnNpU3oy?=
 =?utf-8?B?dzlPeDJjdy9FMm1GbjhiN2FJc2tFRmJqUkdUVzRESDJCbUFuQVg2TGVWaSt1?=
 =?utf-8?B?TU1lbUZrOVN6aEJnclhPaXJkajRBM1Z3M2xvcDhpZWoxTGY0ODkyZy9QVkpr?=
 =?utf-8?B?MkdLR3FNZ2szWnhZbktJNmwvZ2hvRnNkcVF4RzQ2K1NxbHJtWm1YVi92VktU?=
 =?utf-8?B?ZjJwRkFQVk9XMGlXRnhoRzZUbEpyRmdsTDVVc01WSW5UQ3lURk0wWFhnSGtR?=
 =?utf-8?B?NndHOTcwaXAyczBpZEYycVdOZmRzWUZZOUR0anNRZS9XbUFVUFdqU1UyVlVj?=
 =?utf-8?B?QUQvK0xJZ1VRaHE5T01EOFNMa1NkcTdmYk85VUdxMjRlUXNpYVpQOFpyWSt5?=
 =?utf-8?B?QTMxdTJGdUZmME55VkRUYjVzQkJIeFB3ZVdYZTU3bVdUY25kYTZLekd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnUvaTc1Ykw2Ynp2YkRMd0xDb0pPWGdlK0FaQmlLdlUyaUJrL2RqdW5NOEZj?=
 =?utf-8?B?dlpuMTU4NWhsNGpxTlBRRDJrRTVOVitJSmVuZ2N3QjJUa1lhSmVxNGVSQmRv?=
 =?utf-8?B?Rnh2MnVQQ2EvNEVuREd4aFRkQTBCRW1lQjY2ZFVZOGVkRHBVeWd2QlY0YTBq?=
 =?utf-8?B?TGNBRGZkYVY0bkFTMkZEbzJML1FtRURZNzI0NjJhRnRaY3FqSlhhaDhRa1hS?=
 =?utf-8?B?SFZxSjZoODk5RDQ3cTg0VlVyQmdHcHNFc2F1UFBDMERVTGZhUmN3VjdCSmNq?=
 =?utf-8?B?VVdTYzdWWUgxOXZhUGxsUGx3WmdTNFNMcjM5SHNid2E1K2U5NE5WcGZRNVBx?=
 =?utf-8?B?eGdwK3BjR21jWDdvNU9oMVRqNmUxRk5LUUpKTS8zeUpGZTZ5dXM0bHhRZlBl?=
 =?utf-8?B?VllTR3ljTnhoSnc4bDdkSnVvMTl0NS82UlpQQW9Ja24zT1BFTnI3SURkRU8x?=
 =?utf-8?B?UUZyT0ZaV2ZaZ0NIRkp5bHZTTnY3cVQ1dzdwZ3VFUUUzSVVKUFFhdXk4MUp1?=
 =?utf-8?B?b29xUTJSdmJQeDRjNmxpTEtWallNcG5SZ09RdEp0RjA3NHZ5MjV0My9KZjkw?=
 =?utf-8?B?RHdMbVY2NUdwNTM0VS9uK0NJdG1LZTNMcGdPc3M1Q1FPZy8xZHU5d2RQMG5H?=
 =?utf-8?B?SGdBRlZFaHZyeWNvazNMT3V4dC9ZN0c3bjRlci9SVUJuZVhEazU3ZXNtOVVI?=
 =?utf-8?B?WUVSSjZ3MzdveFFrYld1czNHQVczQ3BVTWxOUE5OQnBFNFBlbkYwZXk3TkpQ?=
 =?utf-8?B?aHQyOTVvZTdOQjJkMUN5d0w2QWtrZEZsZmQxOENnMjJjYlhndWYrSXdJd2ZI?=
 =?utf-8?B?OU9CaWdMYWVyRWtxbUVGbEdlbUw2b0tUQ2l5THR3c1BsL0R2WVRQeDhXdG1z?=
 =?utf-8?B?WWI1Qkc5ekw4V3JrL1dxMWZGZGtuRkhVVUJrL09vdEs0UjczV3RZbzZaZUNm?=
 =?utf-8?B?V1IySS83VTZZaWp4cFRmc1RPcDBZNTNqQ2c4V0VYdmVlUnFxdTZXeG84djEz?=
 =?utf-8?B?dnNlYzliZXpQTkwzRnBkbXFINVZRalo3UmJJc1NlMzBURnVYUTRIaktyL0F5?=
 =?utf-8?B?ZmFWYlg4R3JDMWxhQWFJMFZTVTVBb3dwQzhlVlJNYm5NSXFmV0ovYmhnWUJl?=
 =?utf-8?B?OGJIK09BdlpJOElFdWN6MDhCRXFlTnNPQUQ0a2NXT3dLQzlCL1EydXJwNC9Z?=
 =?utf-8?B?bno1SDRhL3I0cG1acEh1ZEd0YndqTWd5U1l6VDFDR1B3bkRqT1B3Y0YvbUpT?=
 =?utf-8?B?eVFBWTNXOEFxbW0vREwwd1BxdHUvN1JJd3NFTUNhdXFodHUwcUdLeFFjclIz?=
 =?utf-8?B?SDZpeVpnQ01IZHRzRFBjZUtwWWxWdXVyb2Z2K1dqVjM0blpmbjhtTUx6Z0VM?=
 =?utf-8?B?NVNlc2hjVytLOGpOZGozNDV4V0h0L0c0NWJCcHFaUWpjbFRpQm51UEkwS1B4?=
 =?utf-8?B?czRBdS9vaUxBNUxENytQMElLeGJmU2NGRmd3WVdQTUIwZ2FicHVpdndCc1Zz?=
 =?utf-8?B?TDdKdjEyeUZWSEVyb2kxZ1lNUnpva1JlVXM4dFVGR0dQM0JEUlRNNkFEYlgr?=
 =?utf-8?B?ek5kcjVhcHowdmRxZ3FXamZhWlFkVHdMK3lNZkpYQnpjTE1MaFljMm12bjND?=
 =?utf-8?B?Z3B2R1NtSnhqTXlJYnRLVjlGVU45RlNtQ3hwcWJBM05CdEF2OUJhY1h1OGo2?=
 =?utf-8?B?NmZkSGxwVk1KMmtydXpQdWFYaEFaODhmZmlsVlJpSTAyOWNUeXBST2EwcVRl?=
 =?utf-8?B?M01DWDZ0WXZoYk9UcEQvZlp4dkdZbUJYTktKZzFwdUtSWjg5WTZ2U2ovZ3RY?=
 =?utf-8?B?QjJrZ0ZvRDBYK0RLdUFicFUwcUNqNE0rYng4NzdpVzFqdmFSbjVaN2JuMEJz?=
 =?utf-8?B?WHE1U2JpYUljekMzQnVSY3NkL0REVGhmYmg4TW9WMkU3NFdrbDE4MmNHdlRK?=
 =?utf-8?B?c0I1QlRFOUo0MW12cGJqWVhOT1ZUVlpTSjJEd2NYM3RrdFhpNi81WHpmR3pj?=
 =?utf-8?B?UzM2RmFWOU1ybTQ3UThmRCtJSG9aYjBtNzhVdTdveEg3dXhzM3hIbGlhOFE4?=
 =?utf-8?B?bWVwWWtCMXVnOUlvRytuT1hxUzU0enBQOHlIRDVJaUQyb1lxbFZyZjB2dDc1?=
 =?utf-8?Q?0Kuxr+SRdB2ik0MbblTVQOhlQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 706c4ea1-6df1-47dc-86a1-08dce41b42a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 02:21:31.5538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UrlGpeGLOGaY0oFQ/lKWsbv/CIsTFy0s2RbSz3HqQYYcSHZU5c11pi5ekUJoczpJMWLEZOhJIFNxE5TLG4Krw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8504
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

Thanks Alan.
Will update it and post another rev soon.

Regards,
Zhanjun

On 2024-10-03 4:57 p.m., Teres Alexis, Alan Previn wrote:
> I've reviewed the delta from my last rb on this patch and only found a minor nit which you can choose to ignore.
> Thus:
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> thanks.
> 
> 
> 
> On Thu, 2024-10-03 at 08:16 -0700, Zhanjun Dong wrote:
>> Upon the G2H Notify-Err-Capture event, parse through the
>> GuC Log Buffer (error-capture-subregion) and generate one or
>> more capture-nodes. A single node represents a single "engine-
>> instance-capture-dump" and contains at least 3 register lists:
>> global, engine-class and engine-instance. An internal link
>> list is maintained to store one or more nodes.
> alan:snip
> 
> 
>> +struct __guc_capture_parsed_output {
>> +       /*
>> +        * A single set of 3 capture lists: a global-list
>> +        * an engine-class-list and an engine-instance list.
>> +        * outlist in __guc_capture_parsed_output will keep
>> +        * a linked list of these nodes that will eventually
>> +        * be detached from outlist and attached into to
>> +        * xe_codedump in response to a context reset
>> +        */
>> +       struct list_head link;
>> +       bool is_partial;
>> +       u32 eng_class;
>> +       u32 eng_inst;
>> +       u32 guc_id;
>> +       u32 lrca;
>> +       struct gcap_reg_list_info {
>> +               u32 vfid;
>> +               u32 num_regs;
>> +               struct guc_mmio_reg *regs;
>> +       } reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
>> +#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
>> +#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
>> +};
>> +
>>   /*
>>    * Define all device tables of GuC error capture register lists
>>    * NOTE:
>> @@ -221,6 +267,12 @@ struct xe_guc_state_capture {
>>                                                  [GUC_STATE_CAPTURE_TYPE_MAX]
>>                                                  [GUC_CAPTURE_LIST_CLASS_MAX];
>>          void *ads_null_cache;
>> +       struct list_head cachelist;
>> +#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
>> +#define PREALLOC_NODES_DEFAULT_NUMREGS 64
>> +
>> +       int max_mmio_per_node;
>> +       struct list_head outlist;
>>   };
>>   
>>   static const struct __guc_mmio_reg_descr_group *
>> @@ -451,7 +503,10 @@ guc_cap_list_num_regs(struct xe_guc *guc, u32 owner, u32 type,
>>                  num_regs += match->num_regs;
>>          else
>>                  /* Estimate steering register size for rcs/ccs */
> 
> alan: nit: maybe more clarity in the comment is required here else one might be
> wondering why we are still providing a number when extlists returned null.
> Please correct me if im wrong, but i assume it might read something like:
> "if a caller wants the full register dump size but we have not yet got the hw-config,
> which is before max_mmio_per_node is uninitialized, then provide a worst-case number
> for extlists based on max dss fuse bits, but only ever for render/compute"
>> -               if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE)
>> +               if (owner == GUC_CAPTURE_LIST_INDEX_PF &&
>> +                   type == GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS &&
>> +                   capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE &&
>> +                   !guc->capture->max_mmio_per_node)
>>                          num_regs += guc_capture_get_steer_reg_num(guc_to_xe(guc)) *
>>                                      XE_MAX_DSS_FUSE_BITS;
>>   
> alan:snip
