Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12305CAC599
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 14:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA92810E377;
	Tue, 16 Sep 2025 14:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1Qe6WDi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD4B10E377
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758033002; x=1789569002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y/sw1ImwLplDQodp8ueYSysvUj537amsp4nXDA/RFvY=;
 b=e1Qe6WDiIco4d5QohwyzvOXAuamyXdSDlkxQw7ASKZ+99EgfPaW593rK
 X3MG4uFamwD7iz13bvMpHqRMKF9pEEaV/dKhKszlN53llQwckKJAedn7f
 rH/tcgIshd6i4Szvs4Ew6RKd9RJKf72PVjchnhUxCBZWfKP0/fQz5peBw
 2/ePqpI6HGRarr3vk64nVY4OAScU0n1vpizgUUPs21xkWJ+mRrm4CdpYk
 c/PTsaVIR76/gVxSM89UCcXsfMYmnXtf6B96/JBJXi2iUR9P2bFHW0BdK
 duPbVP6mw/mqAQLhHZhPOCo4T4x3HCAnFlNnJgAMgqQixVJfLxudACXzk Q==;
X-CSE-ConnectionGUID: 3+YNlr3bTsCDZ75jlXF38Q==
X-CSE-MsgGUID: 076FIIkDQHOleouJ1dH1GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64119233"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64119233"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 07:30:02 -0700
X-CSE-ConnectionGUID: xh8r8kLRSKWrl5xPpt1I0Q==
X-CSE-MsgGUID: 3p9VI+jVSxqWe5qWcK0+uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="175043087"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 07:30:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 07:30:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 07:30:00 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 07:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hwhszueg+O3aEw37KqZUQxVcf15VbZ9Ml8a4S6Q5RC9gQ1Kv0aPbXHzCd7WLvjjvmP7R0v6o8P1KZgHQJNGZVPRgBqOQlIbkhWNfTYfnaImYBqnnO23mBgDY2x4A/sXddjwIxJ6L4fTcSH0opx3a02577l0qlKUqBffpF4suUNS0zxgpnKPmoRwNeapF/IJt9H2XM/2ud4oRxF64dnHmVJE0AvYgWun3lQt3jqNxeuLg/K3pPi771AaNUDa4uyYV7fw3fj4gjryThMaotM1Sycb9fkS9dU37vqSmvYyii7ryVCjoFiOXpvHvErz/RojdQ3mhI9qKMkHVS3Jr6fqmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+vOuLIPyUi0d/bnM+y/PqWbz2rI3J+tPDpj55JgGIg=;
 b=EgEGNxpN0PzL7fhKAgwnX2ataznIOudCqE1mRzAltf14RgEPvL7oE5nMV/HM+j7QzURY/Yd09hOS/wokqRvPCuP03l7o5DFX43rl6D/AKKUCYJIDkCj1R1r+56pHctBno73r81JZxjoIDAnJ/REgVYaDdS0y2PicdXaBwm3YVZ4bmwwTk7aHBJPqa8fuCx6nvkCAXzi5/NKjApSMhBb8B/ytJClV66m0VgvlN2DVff8HLvV80kBupmdY8t6squcwqKHNJelgX7C+CnCAlIZSbAixE4Ujkzfzv7W+0tyVG7RNqoplcsXzCISo827iu9Fdf8+2H7FZB4leVn8XhiaTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB7930.namprd11.prod.outlook.com (2603:10b6:8:da::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.22; Tue, 16 Sep 2025 14:29:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 14:29:54 +0000
Message-ID: <d2a38554-c096-430f-a289-0fb2e299b688@intel.com>
Date: Tue, 16 Sep 2025 16:29:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/xe_device_sysfs: Add cleanup action in
 xe_device_sysfs_init
To: Zongyao Bai <zongyao.bai@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
 <20250915214716.1327379-1-zongyao.bai@intel.com>
 <20250915214716.1327379-2-zongyao.bai@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250915214716.1327379-2-zongyao.bai@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0149.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: f7322a05-c867-4b3c-dcf0-08ddf52d8115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVZOUzlaMVdVNFNBY3pYMnZTK2I4bmlmRWlxK3NpRUVQSTJuRVlHNGZHVXJk?=
 =?utf-8?B?QlZ0dG9aZ1N4cHJjT3hNWFJRdjFzckxlZUlTUE1VeEpOTVdqdEJkaUlJbXcw?=
 =?utf-8?B?V3NlTmRndTBkU0JwQkFEak1LeEYreXduVFdBK2RCd1dxN0wxRk0rZmpLKzha?=
 =?utf-8?B?RkZVaXVWN2h6aWVFWnE0QytKdTN6S1MwTXdsbHFGckl5UWYvWC94dS93WnFz?=
 =?utf-8?B?Y2pUaFJjZkh0OHdaOWxhYVJ6Y0hRRlgvV3p6aGNWTVhraXNiWWFkNnRCNWd3?=
 =?utf-8?B?QURpd2IwREo3QkhYckRLQXNFSlJINXhReUJibmdNTm5SdHJqYy82YTd3ZGti?=
 =?utf-8?B?eUE0YkwxaE54dUkvKzJ6NmdLTDZzMXN0aVdKM2V1dklJZEFVNmthY2NLVUFl?=
 =?utf-8?B?cGtZMU9oZkVPSG9VMk5HUkJpM2x3U3dzUm9FNldDVjJPNDEzZkFZNHJZYUVN?=
 =?utf-8?B?LzZhcnpDSEpnOXA4MWNHMlRBc0xvUXVYRkZkR3R0R2FzTmF1QVErZkErS2hQ?=
 =?utf-8?B?YjVZaHZWamNjTW9tSlhzS2IvNTArcGl1Qi8wTnJmZUR5WmRWRkcvUEZvUG0w?=
 =?utf-8?B?cDNGZ3FkWUhTZ0JYYitUMEFUNVZkZGZCVmpacUt3NVFWQ0FPOGNJTHgvRzNi?=
 =?utf-8?B?Wk1QV2lBYjZVazVCVWcvZkIxK2xVMVdMbUJ4L1loWFp3WEErWVJ2bjczUzdI?=
 =?utf-8?B?K2d0QUhXeGxlSXFuaWVEbU5pdWhPUVcyS0xtUnR5aEExbXRPWnROalZ2WC9C?=
 =?utf-8?B?UDJHTmZiWHBFYnpvYTNYdE1MaGpCY0NPclpycStPSEN5Qlkyc1B0OEk1VkVY?=
 =?utf-8?B?MnE4WE9hbVFVZmR3TytyeHNUR1Jidkd4TjI1cVkyU1lEMmhZM1llMXlEUWFi?=
 =?utf-8?B?YmVqM3NpcCsya3pPUm1OWnZ1d3BRV0szdVkyTmlVSXJ4SDhaY1FMU0g5a29N?=
 =?utf-8?B?QTBLSURRMWh4SG91OHVndVA3OWV6M2pDTHpiY0pUQittRExLTTNDN28zTXZG?=
 =?utf-8?B?VGdpdDdlakZ1dnhNVnhMWnJzR0g3WWlmalpJbUFnbzNXSlNzZW0zeE81N3Fq?=
 =?utf-8?B?Qi9DczZ0SFVWdC9vcnVhTGxJVXdhb3JCVmpHQkV6K0Y2VXJzYTdyS1JPWjFT?=
 =?utf-8?B?eFhETUVnbldHQjUyQmFWdFJFUzZYQ2dZUEpwbGp2dnVmZFFKcmx2UmphUmxy?=
 =?utf-8?B?ODM0dUpHSWhSY1Vjb2xLcy9xQ1FYb3R0clZ3aU9IVWRDcGRYaGtzbGNHQWps?=
 =?utf-8?B?NTRRNGp6bXJRc1YwQjJQNVU2ZHQyMmtISmJmVjN3ZGZ2S2gyb2owZ1B2RTZv?=
 =?utf-8?B?OUZlT3VlOWR3RTYrS2ptZTcycytsT3dnalY5VzIxZUpIUlViVzZLMFlqamxF?=
 =?utf-8?B?bkpjV1U3bXRQUzBPRkFpbW80Zy94dTlRVXRPSmtFeDArMHJaKzNLWjBUZXc4?=
 =?utf-8?B?OTlDNGhIVEFDVFhuZVRLRXdVQXhTSWorbHdWaUE3NElzdjJiUFd4ajhkUWNI?=
 =?utf-8?B?cldwN0JXR2IvODRnNjBDUEZEVUFvbGtvWHlHZ092UTVYc2FyNFc3aGVsaEtt?=
 =?utf-8?B?SnZoZjZFa3gvV3FEaW5xREFlR0RuODlzcDBTQ2hlY2doblFFVmpNVk5YdXg2?=
 =?utf-8?B?SG1LVmU1QytWWVYrQzl0WHlmN3k3a1o2QnY5YStRY1lwMW5HQkZHOFdMYnhC?=
 =?utf-8?B?bzhDakNWSEx2U2NnL0dXZ0NHU0JUQUJBNXNCZlI4RWxtQklqQWd1YkpjUWE3?=
 =?utf-8?B?a28vOWk2bXdBOG5DYjdnR1FQTVRmblFDbjVkNVJhbjMvMEhWZlNjS0xjSWsr?=
 =?utf-8?B?cm9hV2VsQ3lKb0Fid3BLaTEwR2svR3ZOWURmcFFyZ2czQmZUVG1hOHFmbC9w?=
 =?utf-8?Q?5IFwqFuCSoRcN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTQ0R2tsUUdOekVNUWk0VGFjKzIxaGYzZGRxYWpPdlV5bDFIQ2pWNFhhUGJZ?=
 =?utf-8?B?UUxHYXpGL3h2RXNmYVFJa3F6UEYvZzk0TWhzY1RCbVFnZWhuL2haSFdjRldW?=
 =?utf-8?B?UEsvb09kYzU2bUN3bGQwV0I0dys2RitSakJreVowREJ6b0lHSEdpMG5RZmZu?=
 =?utf-8?B?SXNjNDZUdWt3UmFTbW9tT1EySW1Pa3Zud25LZmNZVjJsN2RTS1ZrR1k2SktO?=
 =?utf-8?B?aEo0QUVpTC9ucFFFU2hyM0dPVUkxSlNwNHlnNDNEbDhlc0VnSUZDb3kvWUZL?=
 =?utf-8?B?cC84cmZ1emxjL1oxUy84SE12ZHZIbE9WSHJVV29PWllETWpTK1VoakpZdnRv?=
 =?utf-8?B?dXBIckNQWWdybmgzYWw5NVhjZGpUbG52N1lHZlNocEg3T2NxZmNjQW5DVDlX?=
 =?utf-8?B?ZDZ4dlpZM1h5dXZGZDJKK2FEdHRmV1hQWWRGUURDZWRadzJBYlRKbHk4NGs3?=
 =?utf-8?B?SDZNM1ZJMHdPcFg5YmZJSHhubHd6TXBPMnpRNXovKzBHMkgxbGhobHpsSWhl?=
 =?utf-8?B?OEVXQnNqNktiQWoxdEp4aUlYakdnRjN6K3cyT01XTStOV25tNzNGbVV0OGhC?=
 =?utf-8?B?VjZYT1ZoR2JNcUNBeEFoUDVFV0hhQ29FS0VhTmpNcDNqajMraWNUYVYvVHov?=
 =?utf-8?B?SG1uUkJkUXFZRVI2UGFUd2xjQlJrL3pHcXBybC9ibHcxdnZHdUdlNTkxem44?=
 =?utf-8?B?c1NDb3VMYVJRbGFzWlV1SlhWWGptbE5HYlNHektuVFYxRFpwUXNPdWZUMzFV?=
 =?utf-8?B?RXRBa2R2OUJrTmhnMWNuS2VyZ1RWZjhvN3MvNjVIOTBtR2xIcVdRUjFhVG5Y?=
 =?utf-8?B?bW5MbmRhdFg5V09mcndIczJoNFpRNXNKUkJoUjdiM3dHM2NHV0l3aWVVWjFr?=
 =?utf-8?B?NkNKYWVyUHd5dHUzSldndjAzejUyNzdFZFdjSWhJOWZ1NEpYc2M5MjJzcWFM?=
 =?utf-8?B?R1FUWC9lQ1AyRGN1RlovMk16d2xBdTRjQm5jNXBvL01SQ2lrejJ0cWN3TFp6?=
 =?utf-8?B?WnF0dWJTdUtHTzgvcnNYRFd5cXdETUVvcndYdE1rTVFtVHI1TVRtRkpFdlZQ?=
 =?utf-8?B?WTdiZjZMWkMxdnErR0poOHo4dTlwa2VhMVY2L2JKbXFpbCtBOG5HREFsRlNX?=
 =?utf-8?B?QVM5a0VmUWMyTXRtNm9zamtrUnN1Q29YeTNsR1VuSmtvaVFrT0c3enNDQTIy?=
 =?utf-8?B?WWNCVDcvRUNiUjlOQjBXakJzUU9vcENpdlFYcjNSTVkxK1IrWWdobmV5ZlJQ?=
 =?utf-8?B?MG52MXJEYnJKRHIxR1ZJZUo0djFBUHAzQStzRkhBWEJ4aW55V1JTRzN6NUNF?=
 =?utf-8?B?cW9STGpEVUIvbDc1a1g5UVl1Vy95RlZ6VjNaU2ZjVldlQytpSHcxQ2tNQU13?=
 =?utf-8?B?WnJ3NjA2UlFSRml2YzdFRXExUlBrTmEyUHhpVktjZmdManN0OFhtSERuajJl?=
 =?utf-8?B?RVp3NnJHenBOOTB1QVllUWd1UFQzaHBrNlBjcDFXbWVKak9xTkswRXdYb2lo?=
 =?utf-8?B?RkJFam1ZWlhaTTBoOXFzYzJuVk0wRzQ5ZitRNmQ4MmJRQkViMytKVGtVT1RT?=
 =?utf-8?B?WXArMEw1NnNqSnJBTmY3ZU5id0xQc3Q3R2ZIbTJWRGlmb0VQRHcxVmd3aUlE?=
 =?utf-8?B?TWJzUWdGZWJhZkc2N0VWTXgySXhKN3IzNWhZSjlDZ0o4aElMRGlPT3RWcnJJ?=
 =?utf-8?B?anJSVjkrNFgwaTBaVlRySm91bGlQbG1ocVQ1NzRmbzA1YXBhRnIwb1lINzBq?=
 =?utf-8?B?clZ5dGU0dDA3dVM2dW8wLysyS3lqZjJhelAycTVHY29wMW9KVURJMEwvMWJH?=
 =?utf-8?B?ZVZoRVRyU0dXRms1WGZDa3NNeTdkRTdsTlIrMzQ3aW9BOXpZVHhVd2g1Rmdj?=
 =?utf-8?B?SUUvZnFIYytoMDFaSllQNlRlVml4V0cwcUNJckdzeDNia0VpWmJYSTdUVWVo?=
 =?utf-8?B?TXZ1Q2ttUkJlS3V1V1NTZGNNelAvSlFCYjRvU0dDMmFDQWo1UG50L3Y4dGZ0?=
 =?utf-8?B?Tk9LSHh6eTd3RWlLTG8yQUZCa2s2T3ZtdVBneHJPMzBKM1lkeGdweHFaeXJQ?=
 =?utf-8?B?NmlEaDVKZWJaSVhtMWQvQ1VnbUlyRW0vaE1mMnpOaEduTTZ4OGNBb0NOZmdT?=
 =?utf-8?B?UDFmcXAveWZjanZvZ3JhWVdxUmRKTzhFeUxTcHA4NE83Y1pCMTJCWXcyTmZj?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7322a05-c867-4b3c-dcf0-08ddf52d8115
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:29:54.7120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CO9I6mG1y3vl3SCGNz3KTTCO/ELcfveDk6t0CwBLGWnSpWHa4EZxSzB08HDyLD5xex8Bd41nyx1WoxhqFR3jrAJQPJ+wxLixXtwoPYQBLjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7930
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

Hi,

I guess you need to modify the subject to something like:

"drm/xe/sysfs: ..."

On 9/15/2025 11:47 PM, Zongyao Bai wrote:
> xe_device_sysfs_init(): on partial failure, any sysfs files created
> before the failure will be cleaned up via xe_device_sysfs_fini,
> ensuring no leaked sysfs entries.

IMO this should be rephrased into something like:

"On partial failure, some sysfs files created before the failure might
not be removed. Add common cleanup step to remove them all immediately,
as is should be harmless to attempt to remove non-existing files."

see https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> 
> v2: Using "goto cleanup" to reduced code duplication.(Stuart)
> 
> v3: Split patch & remove unnecessary notes (Lucas)
>     Adjust the comments accordingly.
> 
> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 6ee422594b56..e5e3c56ea53c 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -311,12 +311,17 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  	if (xe->info.platform == XE_BATTLEMAGE) {
>  		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>  
>  		ret = late_bind_create_files(dev);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>  	}
>  
>  	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> +
> +cleanup:
> +	xe_device_sysfs_fini(xe);
> +	return ret;
> +
>  }

