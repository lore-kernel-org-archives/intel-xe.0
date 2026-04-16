Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCC3F8DFC3
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 21:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9979610E277;
	Thu, 16 Apr 2026 21:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpUmqtDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A088510E277
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776374709; x=1807910709;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Vc5uc7DZW32JFGO1eRTtrPnB17fAeNwr5Tl8uTu1/Ec=;
 b=VpUmqtDW9UL5wZKqkpkAIxjdgiXgGZwz1anL+xnyrxzliGVOuQ00XUjt
 6NXms6sqfTTMcVOU+ay6D9XkR+jWwox0Jln6xdhwqdDdi69Am1dnacmjV
 uHz27A3/n0sE1S1BGA/p99hFulcZ6fGpR1sKktazMFcnaXguvR+ew7mmw
 TJjEdGQ7SRAjriAJTpilCULARnz+QsAnIh31cin0EZtyMrdmEAhzoMUSU
 TodKbWuJtQSvCxZfaV3PtGDnRP+8PapBlQQx35cjx3iDdKhNyMWVbpo5X
 PoantgzzOHyAGtgaR/w6q0SmpsfBqWVwdaH4a/xBbD8V5pVAYbAtVcIvN A==;
X-CSE-ConnectionGUID: N73k+mlFTJCMix3+/BbOqg==
X-CSE-MsgGUID: 5V2+vA2bSES5ip1UNDSvYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81260444"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81260444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 14:25:09 -0700
X-CSE-ConnectionGUID: Et77On6zSpekllhWRzclbQ==
X-CSE-MsgGUID: 2arF3nW6T4KKZp8DfwLOzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="231102963"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 14:25:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 14:25:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 14:25:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 14:25:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMnMErU6mp7O4dR6YLeid+tnnutwmAeZiTQpXDonKC/9ExOLoqm0tZE1C9h0R2PNyJSj9DMu/T0oQN7SY0msAx6C4F3pD8u1xuBDaDnut5nxvpHwGKgcrG1wg1fQ07iGd4eqgBeQ6fGJLMeMnu30P95jemNK3IjfENK9i/LQnzHFaH+50fmejFCyjwlzN6Xnab+ckEkuHNMzvZEA1j+WnKEsIB6K2ri034ewGF9pZHIZFtSNb12YFnOYVYnd3sv5pYKwK+fZTYHYIxhMLwI1gvekYK+5Md54qfWuZ3IWxQYoJOfbakFbBVXern59LVDFvwnBwa7fvHwpa0JuvGTXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAGeSey8TpUwBpqiBzPMVrnj/J+3UJIwKAXG2YVonc0=;
 b=SVFpZUSYBfxOsYo0g9chqmYVjCpRduiJVAMIR39L1sIarDw0VqC9E5TY18KcRRp3gi1KvIem7Nw/dOA+ykzdRZKV8Ws2cgeOHmi3MV3k7s0pJZGfg5zqH25XPpUPHHR9X0+beydiOFmAwnJchu6L5KfprIfdzzkXgAawCGOfpzBmwklMxDRSeBb04dOeOoZQwp9QAiZCWSNv5ky8GDjytiToRDjR3NsypPn0IONJlJefhlXOzIpS3JDz6yFXqbWLYdwcMmDpnamMfKfw1O7uWcHznH7vwDxae4JXP7PVEtMfKQzwLkTEcHLcpX61G7SPOssmuiqg/VS0b0mCrbU5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4868.namprd11.prod.outlook.com (2603:10b6:303:90::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 21:25:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 21:25:04 +0000
Message-ID: <0d1f835a-e7a2-4233-a20c-5f145624bd6b@intel.com>
Date: Thu, 16 Apr 2026 23:24:59 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Fix_VF=27s_scheduling_priority_reporting?=
To: <intel-xe@lists.freedesktop.org>
References: <20260416131831.7302-1-michal.wajdeczko@intel.com>
 <177635380524.469471.45147512968706428@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177635380524.469471.45147512968706428@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0047.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: 851fae4f-53d2-48d7-b2a2-08de9bfea006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Cl9uCUxyoVKBsJyBvRMgmDOKMQYLmd5Es5wHeuWqiJ0CdAoaNuHHTjV0JK1JfZlen4tA3FaEw0CfOc8WxZMnrKumXWY5VfMwjA6h/MNH8qN/EwhsfjS3vdHjiMsWIs1NGyb6D6b0quKpw5PeyZnRBRmw/CpxUSb319CTiEa5+yGlqOl3V/Cf7ddVU/3iaUZgl8NjiKiA+meuqR1P1eBwFPhp8pX+b6I1Ubhfc8lP/DcStJQ1fZmAFnMCyGj3EmMqCOft9LyGEjWNaqVt6XwI0capeDRsibFb++kC/sDOsO3lwtzwa1TwUX82rhyTovYtImvhSqAYo9TtLPUsbJ9RbWK2+zoXSGNjJVXAxTjb5ow5vaEUenkoxLsSvFo7v9H3kifo0gT7rB+pN1uuHRhpZcM2QRttXOMLGW9PiSrMAYZqh1jEZdaEmIJZhuCcThIW5XYl1yZ3OPu9NbOETA2aTeyZ21No3bT0sDzbfGhY4FcaQJ9QHAq02QgXccHJ+suz8zXpfK6DjVDnmeiDKNOAYQeez4QDLAYqz8B8Ck8FGuyA9GfsAOaqjLzg1n6dp7+EUl4glz4BsLH9EA2MpWWrqmmlH/5C4VzXQhyEtlMUKzyWqNRYzxs2BD3ehMFigfmEmnekeLn387S4nxuLaNZteOWG9vfTlAPKUzCf4t5BF0kzn598k5jqVUVMJgEEKxCn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWtKdGdJcG8xV3E0ajRpK0EwbTFsdldneHZYbWJDNjB1YTg4eTFqTXBGSTE5?=
 =?utf-8?B?S2FYT2htUDY3SGxyQW0wQzk3WWZocHIyNmpIV0ZjVk5UZHpBeFJvWGhuamhN?=
 =?utf-8?B?S3h4VUszOUZmMGdOOFQxVFJXY09sSWNLcDF3LzVQNnUwR01TRjJaR1BnTWkz?=
 =?utf-8?B?VTBGL244Mk9qZVhTQVROVnBESWprOWFJMSt0R3EzTmh3V3VzMUgrZ2xWb3RI?=
 =?utf-8?B?REdLc3NiUHJDSFI2Y01PajF4SG5Xa3g5alBHUHhuL1NPSkQvR0l6d0tCMWdq?=
 =?utf-8?B?Mlo4WDZ5VUZYOEc0cGZJWGdXL1JXblVxYVpRb3dGQXJ5VTJkdDYxd1RVbGNJ?=
 =?utf-8?B?em0wd1dUZlVMRVdZRStvL2xJN2lBWndOejZGdmcrUnkyb3hnK0JuS3ZZMGsv?=
 =?utf-8?B?Q0J1R01XbldTMXFsOW91c1doTWVDVGlSVWFWa09HWFV3Vk0rOTd4aXBGK3c4?=
 =?utf-8?B?NnBFa2pyaTFDZURsOE52SjhmRlJRYXBtU1BGQUxocXBUZ2hLYmxKcU9wcDA0?=
 =?utf-8?B?NDlwMFR5Ly83NVNhSTE1dCtrdVlEano1a0cvbUNlMlREWURjUVZPMzU1NmZq?=
 =?utf-8?B?VmpuSHR3UmV4eFY2UVJQU0VHMitsOTQvNEdwUE9hQVFtMUd1Z0w3NjhBVVdy?=
 =?utf-8?B?aGVqaE4zK3lMaWo0TnJKaVJJWGprY3BTRTQ1ODVKWDZ3T2lUZmpzazkweWFp?=
 =?utf-8?B?RTRzbTAxTjlwSEE2Ym80QlJYVmNOV0xURXpLMzBUdlQxc0VlOTI3RUJtUk01?=
 =?utf-8?B?Z0FMZGwrcEJFZnk1N21ZcitpQWxOUGN3M2dpVzRpbXpKamhLYThMcHJ4L0cr?=
 =?utf-8?B?VHJXVURTQXZrTUN4UnM1R3g5bDBZRGkxMjB0WjgxM3dCM3ZaZVIzelhEa1F4?=
 =?utf-8?B?UWJydHRvdWw5Z2JUY3ArR2xFR0tMYko3cDIvbkJWaFdEa1JkcDB2WTZ6M0c4?=
 =?utf-8?B?NTR1YVZCUFI0WG94RnpiNS8xSG9UYXNEbjNUVkJlamFBbVc1MDlVRWNWeWNB?=
 =?utf-8?B?aTAwNnNpNDBFRng5c1kwL1lqY0FKRzFKeUdKaGtud01SRWVuWFpCZldYNG5w?=
 =?utf-8?B?Ym8rSmdYb2xaOURUMnB5NnJzSDFpMG9GS0h3Z0I1UE1jRHNEUWFJZ2s5SDJx?=
 =?utf-8?B?UTNnVGpzaG4yVFArdzc3UXExOWtmTmV2c0FnRExCelZ2SWdKZ2p0ckJqSnJS?=
 =?utf-8?B?MFpLaStJMUQ0bmJrczdsY3dEOEhNNEFnMVJWQzhYVmZVTlN6OERqUkNFMCtm?=
 =?utf-8?B?SmtiNURTa1l0di9jcFU2bzhuUlphcFN3Yzh6ZXJyRW5oWkRtOWQvb3F6WEdK?=
 =?utf-8?B?U0oxRmxoMmpINkJHK1E3UkRKRTk1Wk5HWExiNWNQTSthTk5pcWE4ZXRFUi9R?=
 =?utf-8?B?THpEdGVpM1ZYbTBKMXJqcTlJYWZvcGxDVzBRcC9odHp1TUYwWmxJeVhIa29Z?=
 =?utf-8?B?YUFHWUQyQmpwUGpEK3B1ZVJuMC9CRS9yQVVUUXhiWlZGY1FPcVNnbFhlTVoz?=
 =?utf-8?B?ODRyTUt3aDUvdG94ZlZrR0NGRFNzUGY4VVpIUnNtUys0NFFWWTNpa2Z1dllr?=
 =?utf-8?B?OUk1WjZnaHVQZHBidVR1NkZuL25QQ2J5OXNiOVhQM2lDNnhWbTdkeXBwb0sv?=
 =?utf-8?B?U2tWaXllNW9OUDlXZnQzcFl6bHpOZVpVcVp5WVNyOEs0NnREMEt0djlDREEr?=
 =?utf-8?B?Zk9paksxRkFyNWY3Nk45eWRIMHRyK2pEeDdjNGkzUnhCd3lBbGU3aE82c0JM?=
 =?utf-8?B?RGhhWnpENGlSbEFHUkFsWTV0Rk8rMFJYRmQxNFcvcktGb2VBemdhaVROZ3Bl?=
 =?utf-8?B?L01MVGh5MVhNd3VhUjJRLzBpL2I0aEVpZ0ovRnRKL3NwdDZWakplRUVjKzIz?=
 =?utf-8?B?UVovajZsYVhicm9FSmF1QXFWRjZaVjBHWnZycWNwNWtwT0FpVEt2Z1ozUFZn?=
 =?utf-8?B?R3BIVmtWdGR2ejF1OFkrV0ZscFIyRXN5RU9ZMW1zNFhVVVRnK3FDMm11bGpY?=
 =?utf-8?B?TklpUWRCZzhQdk9mdTM5MGpuSk1uOVJEalhhZ3NsT2hxQ0J3OCszUkJ4cC9S?=
 =?utf-8?B?TjV3ekdTTmREU3V2MFIwcUVIY2xIc0puelBMc1cvd3FyVTlKaExrd0xWaGtB?=
 =?utf-8?B?cFpGVnFQT3dhUGhwaCtQTzQ5d1V2MDdCcnhlNnNPZk9nSXRKQmlFQm5EU2RE?=
 =?utf-8?B?blpkcDNVMjNYbGp4OE1uSHpRTW9BSU9PRDMxOGlBYkdGb0pRQ1d4UXNFelJC?=
 =?utf-8?B?SFJoSmdERitxeUExb3BXNERqN0Fjdk10QUFPRCtuUkJOZ2hpRU5WUTA2VzMz?=
 =?utf-8?B?M2tQZGlBdXE4ZzFNU0ZjSmlob09xVkl6QVdPaGc1YUlRMTQyWWhpdU93WWFC?=
 =?utf-8?Q?Zy/0ihLGNyAuSOCM=3D?=
X-Exchange-RoutingPolicyChecked: qHxHMUgNByA0luoVZP9ksRP2t6fqi9cN1nDO+PWl8ajup81BuwhgFKDAd4JeI2tlAd5k8SsJIRp6jlU4iegEGzjfJb9Jivpppg3YBhgKdioNvLZ9H51y6OtgrEmMto1iN7oR60UOcdvAsetIwkiPH5OmO08cCIynJNH1wc/qVwd6m5OMW2RSQ5wxbWp3HottxpXnYaXBiwr6pdiNEaOs00H5GrtbvgnE29/eT8kQZHA45jjfPdCp2zbZihdREXjKyFPb9az1oGw8FwIV3EGAV1jMT4LHgVZlrYd9pR6od+VQw1vMPAhuN3FJ7fAW1tUHLofbJILRNrr3SG6y8E/bfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 851fae4f-53d2-48d7-b2a2-08de9bfea006
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 21:25:04.4039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V00wwDFjFvWk6ZMnhV/OYdO4A+BSBTpVXzHDa0tSP2XAifFfEPeMSNRwtC8O90dWZaeD4o0K5dXfinwnfWiPlru0YGTq7p8lMOdZuqIfhXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4868
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



On 4/16/2026 5:36 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Fix VF's scheduling priority reporting
> *URL:*	https://patchwork.freedesktop.org/series/164999/ <https://patchwork.freedesktop.org/series/164999/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164999v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164999v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-4913-207a25698a481a39132b52060d7bb294384876ac_FULL -> xe-pw-164999v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-164999v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-164999v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-164999v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

all unrelated

> 
>   *
> 
>     igt@kms_concurrent@multi-plane-atomic-lowres@pipe-d-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4913-207a25698a481a39132b52060d7bb294384876ac/shard-bmg-9/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-d-dp-2.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164999v1/shard-bmg-6/igt@kms_concurrent@multi-plane-atomic-lowres@pipe-d-dp-2.html> +3 other tests skip

Test requirement: !(mode_default->hdisplay < 1024)
No suitable resolution was found

>   *
> 
>     igt@kms_plane@pixel-format-linear-modifier-source-clamping:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4913-207a25698a481a39132b52060d7bb294384876ac/shard-bmg-9/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164999v1/shard-bmg-6/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html> +6 other tests dmesg-warn

<4> [462.224006] drm_dp_i2c_do_msg: 13 callbacks suppressed

>   *
> 
>     igt@kms_vblank@wait-forked@pipe-a-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4913-207a25698a481a39132b52060d7bb294384876ac/shard-bmg-9/igt@kms_vblank@wait-forked@pipe-a-dp-2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164999v1/shard-bmg-6/igt@kms_vblank@wait-forked@pipe-a-dp-2.html> +2 other tests fail

kms_vblank:6468) CRITICAL: Test assertion failure function vblank_wait, file ../tests/kms_vblank.c:379:
(kms_vblank:6468) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
(kms_vblank:6474) CRITICAL: Last errno: 22, Invalid argument
(kms_vblank:6474) CRITICAL: error: -22 != 0


