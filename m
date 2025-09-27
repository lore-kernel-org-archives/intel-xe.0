Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D58CAC5B9
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 03:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EA010E010;
	Sat, 27 Sep 2025 03:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P44mNSoh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD8310E010
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 03:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758942981; x=1790478981;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5/pFOw/41XBWr4Xwn0XPd9wVvqYrd48mHPAD22fq0b8=;
 b=P44mNSohiFnM/XW+W3UKwzrX4BqjFDh3vqqTxT3Ro1qXWl5LUg1YcKsD
 +L6EILLWLRgagljtfBfWCdjzo4RltYMM8bE0ARXbRQKkeUrL4Q7pu8LRi
 Xf6zVLKoB5KvIbu+3nVKU2b2Zwm8cMmtCRNsOJ9w7hofwntf3ewZOlF87
 IZisnKTyWdGc35CQmcD+f08kZmu3bRN6pxl/Cqil/WtZmKkHluKzghCbE
 +3F9svVyXy4IQJ55BDUyPAtTU2ypKn4lE5E5wZnlfQ90G8kgXRXFut3bu
 v9aOD+liSMmxQVaB8eiPwIo3N5U8bcfCtFfiFc4SHR7pMKXSg4zjBET6M A==;
X-CSE-ConnectionGUID: Sh4HhKUsQ4+FV1281sj27g==
X-CSE-MsgGUID: xBrgC19QSAq8LP9I7UkLWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61229464"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61229464"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 20:16:21 -0700
X-CSE-ConnectionGUID: 6yRihZwCTX+ZKeFieH+3wg==
X-CSE-MsgGUID: IH20K8gGRiOQbwlDNy4d6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="182059461"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 20:16:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 20:16:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 20:16:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 20:16:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZEZcd26Tv6ymMpqolle+idfcyjq84t4SfolFAU8S+BtYolbOy41R8Z+bF374OdUygiQSYc1/4DRebNDs6E6oof6XFPdQduycbnbg0/WrMb5BNS0B/XRrPrMJDCAWvFVo6vfCL3E/5Wwax+Y2aBmlQSN9f0rL2p2IdC5vcIIDL9h1R3qwrbl4C9KzT1eUO0KcAZyPaeZ/ekrzvD5To1o0qopmhLTqhaKocuowh3XfqUw3UN8/aUkSG2qX00V7uyXGlwaiRMMlUo2ntnoHdIFDUfM9DWur+QTa8V42Lk4/F9H3XQw9aAszBnLh3KJGbsXMkXMJZq6cy2rE55PaZmr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnUUA0h6MpjjOaPBR1AoFD290+tYwJBmfxJ4OqCA2+w=;
 b=c2CgV0mDKGtNS8H7i+HZEboO71N4n/SIyVh0/GYhharghSp7JHURiTetpcvHeAcRTi87WSy69sPVscqLX5J9mjvNq+KbQ7KbGoORfygtFKNLhBxIGygYlYUeIuQ03cg62S2YN5GdNszoCz5piAXYNlMzXME94jLqh1WloEq1Oz+Drgp5FZQthSjHpEe8BTA2xRjR2yngA05CyA/qVov68ofZzHMpldVVzfBYhJo4iDG2x/Q9nMT5/UAIt1fxDxtiqOMGrl8yHGUv2xImIQkh5exg+2jTL+pvaON1F/KAjkYz7IrAUkPm5MXvgPuNMFEXHDR/aCY4FMXkt1wke+J+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Sat, 27 Sep
 2025 03:16:18 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 03:16:18 +0000
Message-ID: <9f99012b-0224-4156-a5be-aa5ff4f8604b@intel.com>
Date: Sat, 27 Sep 2025 05:16:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/34] drm/xe/vf: Extra debug on GGTT shift
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-20-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-20-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0051.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::40) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 027fcfb1-f076-4342-a526-08ddfd74396d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGlmVkROb056U0tKY0p2SGtZV2VqU0ZISGRYYVhnZzJjcmJKb2hHaGNMQVJN?=
 =?utf-8?B?bzZwS04wN1pPdXFCWGlBY1dORzhYVjRMTklRRzJVZGN5NVRkR2VLREx6akRR?=
 =?utf-8?B?NEpVTVlKVmFzMDBySEFOUXdMdU9kWWV3V2RlT1RuaW1sTldYbUczdmFTYmY0?=
 =?utf-8?B?SmU0c0JTZUhxNDEzQ1lNZW5DNDFQWXNVVlFtYythUDlxblFFNmtqRFdoRFBP?=
 =?utf-8?B?c0w3Y21FNjRWQWZXbThuTGlod2p0R3J5NmdQWEZ2TlRoVENKbmFndFU2QW9N?=
 =?utf-8?B?Tk9DRWFZSU9mR243L1kxTU5vQ0k0dTFRMjhYaWsrOGJ4Vm10cVFnb2M0TEJj?=
 =?utf-8?B?dU1PWDZ6RVVkd2R0RWFBT1N2NEg1eURvdWVnT3B4UEVBdG85VmNOSk5veDdV?=
 =?utf-8?B?M2RRaWxpQXRBc1Y3MUN0RjJNTUxSZUxGQ0xZckdTOFVmZ1MxelNBMmt6dTUx?=
 =?utf-8?B?S1d4cmdQckNVWW51WUpkSFkzclpuY2dJbm1zSlJlQXQ4R2NIQlF5SFR4LzF3?=
 =?utf-8?B?N0hRQUtCdlNMdlJ6bG1sRzZNR04xUy9JQXZqa1ZIM0dpU2FidFlOQm00Y2NY?=
 =?utf-8?B?L2I1WlRXWCsrT0NoVGdwS1U4U3ZRK2FUUHQzdHdFaVlWMjJQQjdZVmtUMjBG?=
 =?utf-8?B?M3pybHJyT2RFQ2dHcFZmdnA3NWJmVkdBQ2JtdTI0RWFkMlB3c29kOWJDZmxH?=
 =?utf-8?B?bFh2alhscFI1UFA5UDIwWUdTTk1VYkd4VHJzMy9ZK0hadm42ZG9VaElvemJy?=
 =?utf-8?B?TVFmUlFqeVQ0VkpieTcyWE5IV3RHQ0VGV1pOOVhTYlNXQ25lNzlRV3cveGJL?=
 =?utf-8?B?TDJ0ZDY5N3FPWlBydm8zY2psN2l2c09GU1hHWHp5UjhrK29Kb1Vvd0gxQ1BD?=
 =?utf-8?B?eWZ0OEtqaEM1T0lEU2hSSFpKU3BSeDBMM0lyR3U3T1dhVW1WT3ZRRFFyY3dD?=
 =?utf-8?B?bzMzcnQ4VkgyR3puV2RDbWlUY2VPdVJDYVVJT2pMaEtYZXBXeG9NREhvL0dI?=
 =?utf-8?B?anBSdThnT3FWV1BNMG1id3RWTnVPcnR5YnF6bytOUDR4YWxqbkwzUGtBS0ow?=
 =?utf-8?B?L0ZSRWtoaFQxTExDRVBHVWlOMjRNUTh5cDJPOW92QWVSa0FRMk5QdmNGRnNn?=
 =?utf-8?B?SVFvOGQ2MHQ2RXlCbmNXaEdHdTFMeTM0bWFpdDNEVHFIbWpsUkU4K2VsM3lG?=
 =?utf-8?B?RWN3ZnJUYyt1bWVKYjFlOWZQWi9mamR5WVg3SGJOVVJiMjcrdktzbXJ3V2Jk?=
 =?utf-8?B?MjEvYTdJeXNxZDl3WjE4NUM2Qy8xVk0vOHpvYUlIWEtKYXJPcnBFbGFiSzhE?=
 =?utf-8?B?STE0c3czRTNKQktZZGE1aDF2NGUxdXFjZmprM3BCU2VuekJlM3ZiRTFTUkZI?=
 =?utf-8?B?b2Z2UHBGbERWNGhtcFNlQi9iV0tERGJEZ0h0UmZsRVEweXFrY1FxM25UOTdP?=
 =?utf-8?B?VWNka3hsRWJscDRsajl0RUY1NGtUdURkZ1hMOXcrODY5REtUR280WnRQd3NN?=
 =?utf-8?B?NDVadGxZakpaei9yU3hSVXI1djRlcTZKZ3JhM2dIQlJIdjlyaTUvNmk4SVZS?=
 =?utf-8?B?MTNLZVJkU3hQYXlicVpPUGRzcVd5aC9BbGtwZGRIRW1YYkRreElTVmc3WFVn?=
 =?utf-8?B?R01ESm1hejZKMWNkZkVISGhzVzBrbFVVZU50UCtaUGE3K09GOUs5clJOcm42?=
 =?utf-8?B?WUtxWE4yVnkwNFBmNTV1SDM4WUJvYzQvakZUWkZzdnhZUzN1WXlIL3Q1M2tn?=
 =?utf-8?B?QU1WUk5xY1RrY010Vk5GUGFzRmxMMkJzWmVSMzhEcWZuN1luU0dGd3EwQTMw?=
 =?utf-8?B?cDJLZ2FBdGx2ZktLT0NRemYraDdHeWd5TVFKMEFkSGlYek1keVg3Q05Zckcw?=
 =?utf-8?B?R2QzSUJCNCsvTVd5SzhTdnVzN2pqUzdQY3oxaEtFa2JEdE9RdTNvcjVmeVlO?=
 =?utf-8?Q?adqG0YEAptptt/JQiGf3AYXwHMc9VOf5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1dOREg3M3kyR3psMkIyb2dqNGhOZ3lsN1JVOXlLNURDSjhCRVF0M2N4LzJk?=
 =?utf-8?B?U3dNeStlN1czM2JMckxzT2xRWlo1bDdJYWdMVEZuTXZ4RUZoeDdDSi8zdWg1?=
 =?utf-8?B?T2JBOUZwQUVpTVJkQk9ycUQwRWpuSldiZjcyTllia0dSNjRoY2gwT1ZNQVJG?=
 =?utf-8?B?N09qdFRFWG5ObkNCeWQrb1NKcUJmS3JBTlY2UGNVMUxTNDMyWURUNnBWMUtJ?=
 =?utf-8?B?T1dYYkdsWUxvWUVucjNMdW5oU1luZy91bVV6eHBHb1JuZWRQVGhPZkI4YjJs?=
 =?utf-8?B?d1BsWmRXczk3SG9pVTJ3U1pHOFNTc1dpd0QwOWFlS1Z2RWtmcVpzaG1Gd1d3?=
 =?utf-8?B?NjVuYTAzMTRCa2JlYkc1OUhkR1RFZEpaR2k2UGlJd093WGh6SUdCY2dXVXpz?=
 =?utf-8?B?bWQxc1RtRnhsbldOejQ3TkFGTzNYNThHSXAwTktHMmJiQnlpZmlBM3FaRDdj?=
 =?utf-8?B?UXlER0tFVnVjZVRzWFNVWWxKMzJaeWNHK3JXa0J2cDZ5N2tPQXhaVXpUdjR4?=
 =?utf-8?B?QlV4UEt6a1NTS3NLbkYxUjZJV3lXWmxkdkhvQTd4blZzTzZXVFhzM3R3ZnFC?=
 =?utf-8?B?Sy9BeEFXZjZuTzFINVN0UWt2dXN1eFZyVUhDcHFHeUw4WU9RcXZsNnIyWnZm?=
 =?utf-8?B?UUdVNkx4WUI3SGVzNVEzSjJoOGw0TWNaQnMycGc4dDdLS2p3dnpEa0dGVFRM?=
 =?utf-8?B?QTNwcXlicVZpVWN0SnVXKzYwMVJFTjRzN0Q4STRyV05kOXVNVGUxR296Yytz?=
 =?utf-8?B?WWY5THpOenZ5VGkxczNCL1FEblhVeGtJWTNiV3NnTmRxTnl4SkpBaDJ2YTBp?=
 =?utf-8?B?NXUwVEFCbG56eGlEK2kvTWdhR0RZejBKK3dhdEhPanQySXZ0UDhvdjh4WEpQ?=
 =?utf-8?B?bDMyWFU5eEsxVDRMdHZCaWlUZFhReVF2SVJGTUl3VUo2T2ZMcG9LVzlVekxU?=
 =?utf-8?B?SXBvK044ZVpBbi9DTEZkNDVWZS9HU1dLY2tzTXNNRk9vRzR0eVZlRGFXckNj?=
 =?utf-8?B?UGZieGxYY0N6U0xoblFlaUY2TTV6SFQ4aC9QSzRreTNUTktHa3RnN0pIZkdX?=
 =?utf-8?B?dFJROWhxYzkvei9BNDQvUytTS1czc2hMZHhUSFF5T0pneWczTHNOSUc4b1I0?=
 =?utf-8?B?cnVXYXdvMHVsQTdreTBWTTV4UjB2bXBYZnV4dUR5UXR6eXA5U3BZeFhjVGU0?=
 =?utf-8?B?THRieWxydXd6Q0haeFRMd1BLaHl6blNMd2ljZmx4NjlVVk5pbXJZVHlUUVM4?=
 =?utf-8?B?VDFrNHFFWE94ZTkwTktLc2JLUWp6RHFzRHFMYUR3cGNxME9ORXB3eHQwU3Zh?=
 =?utf-8?B?ekllWGFhNFNROVJWUFNNVzlpUkNSZDNVQm9pczV3bUtJU1NLMURKZmlqbG14?=
 =?utf-8?B?UnoyN2RqSjNldU1vcXA0aWtmTWU5K2I4TTAvOVRtRHFlaHc1Sk1aWktudWtX?=
 =?utf-8?B?TWNHWHhXRmhVdzNReXhwTDBKSlI3dklZaDlHOFhpUEhKVHBPblppRmtIUWR6?=
 =?utf-8?B?ZDZKT0QxUXV4bktlc293a2ozYVV3SVJhTHBJWlVhbTRMTEJmUThwRWRhMGxT?=
 =?utf-8?B?RkpmMmMydkxyMmNrZk9ad0VxZVE4K000T0huSHFEZDdDVmxRT2w0LzhIa2JK?=
 =?utf-8?B?OHArR1lVTnpLdE1mVlhVcFdjazJXVnUyWXNpdkxmN1pGRUVtaG92MmM1eFJr?=
 =?utf-8?B?T2FTTmYwNU1kZHBtVWl3SUhES1pSLyt0ZGFVTCtZV1YyZXc0V2NOUVJKMVNJ?=
 =?utf-8?B?M1VEYlBkdnFEUDBEVGU1OWJvcENzWHh2eGRUZy9yYVlxbUp5SU5oZ0pMaTJP?=
 =?utf-8?B?cVlZTkJPWjlrWC9xM3NBN2pSU1FTWlNGbjJPTWIvOGViR2NxemRrZG9PVWJP?=
 =?utf-8?B?ZzBKcEhGMzArZTN1cERFV0FTeFpEcmdxdnZiaVRJdUJSN1ZhKzY5YWlzUFVv?=
 =?utf-8?B?bjgrMFowcGZmTndlQ2loZithNFhkTStTNXdHRVhvTldMNVNOMHRTaUQxYjU4?=
 =?utf-8?B?SHY4ekZpUWNKRmZqLy9wTy92c2xkNlRiUGNUVmNWRjdtdHNNQmZVYk1uVXNB?=
 =?utf-8?B?Z1YrMkErY211UnlTak84a0diVlROakIwVk1KdVdEOGZRMHN1bHIvZ1h6UnZv?=
 =?utf-8?Q?kzYsJGCVRFRIAzBDALqWuho4T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 027fcfb1-f076-4342-a526-08ddfd74396d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 03:16:18.0010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktuXHyfLNEMSZ5CB5uhoE9WnJJQA0YCs6mzo0l4r/qAVPP+pv8sUjRwXEDMAjPS/64YrsELVCc7txqPGGL5xbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> A little extra debug on GGTT shift printing the GGT shift value is
> helpful for VF post-migration recovery.

Right, good. It is possible to compute the shift from "GGTT" message 
printed earlier and the same during first probe, but this has higher log 
level and also allows to confirm that node fixups were entered.

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index a96e0dd65bc1..e79ab4a2a273 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -475,8 +475,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>   		primary_config->ggtt_base = start;
>   	err = config->ggtt_size ? 0 : -ENODATA;
>   
> -	if (!err && shift && recovery)
> +	if (!err && shift && recovery) {
> +		xe_gt_sriov_info(gt, "Shifting GGTT %lld -> 0x%016llx\n",
> +				 shift, config->ggtt_base);
>   		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> +	}
>   out:
>   	up_write(config->lock);
>   	return err;
