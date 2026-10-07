Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB92CA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 05:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D67F10E0C2;
	Wed,  7 Oct 2026 05:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aS0OsFhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A8A10E0C2
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791349577; x=1822885577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ahDwxU79Xry5Lb5XNJQej9CJtAadn4A3rEXvO7onb0o=;
 b=aS0OsFhWHeBghbrzJfjqfEEtjkJLAwuDzYUBhre0xshDX12q5fg2gJyu
 7AztNkAz43pAafKPoBIQUvAO4d2+FJqgVvKGUhFUZHAaWo7ZuNv06Gu1u
 fGmRmQvkzFyDr0x/ov5rgtv9aCtLKbSG7T6xDsK4E3Vi3tlpSxJYxK7ES
 D2X0dPk+aB3yCfb2JiH0cZwd9ZU/rTJ/dPtXtDjcynXglvCxa2fSuSVte
 RG03cNd5Ercck8iSmjjxgIHfITaDODI66S7mmGq/bTy9NSmomkRnVTmq2
 10hpuDJbkn1zsF6PEo7jCeD41u3lbZGOuLIloMH/fY94FmcHx1ENcYv+x w==;
X-CSE-ConnectionGUID: OBki8zi4RPKq8cNJg46a1A==
X-CSE-MsgGUID: eg3k1UboQ/y1jTuUURPoHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="101372014"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="101372014"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 22:06:17 -0700
X-CSE-ConnectionGUID: 7I7OM7M1TqqWx6OkzzsVvQ==
X-CSE-MsgGUID: Wdd4c1rkTXmN2z5Mgqy8ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="285267120"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 22:06:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 22:06:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 22:06:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 22:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQn73wCIUwgD/82lJ7CSE6PKGy/VTlYkKJLb8NbMp3PeJQU1JHExjyicRUPVN3RP6NK/uAg3pzv41d/Qd3lgLyf42/RM7lD2mBsAWg4s2IoqdIgFUd8wAIQqa7bshj3xpf37XTAixMFMYPob0ynJy+SAe/eAxTDYuqXvaBWzDDaRD0aQv3dk6h0uKlJKZTSXVtbax0XQJ9s+N2ITuOvXcj1fkLNfldVWK/Y3qmGFR+I9otLkuDylqaAdk6K9pB8pn0x7YBHphcZhDGJ8e7rEpCaxLE7uDdXI4OEIq/KDczqAvZfyj8dqLE4RPEPsh95lSDJh75rdFLXSNtOH1BIqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12/3Xyp3F9dRsQ/b7HfylRtR7WZa7SwajUIvnnJJqrk=;
 b=JQAoClWtJGEYhw8KruSHVC6Juk0yOzNoZqLIk7kSaifvFLpGYATyqWsbnjNI/uYe5r17y1XVxRQcbtxkFSdf3civoHhoQaXcHag2KWqtgguWi9y2J0in6QXX6apGeaHM4l3i4Yd4UseBk0neRnj1UzohSJc0hs9zYx3LnZi2UxlbQgla/GzfyP83uRTG5EwBamtQU3kMfz8THV0QiHCcE7huTqgX60AU+FZQejiDfVPDLV89+5c9aa54G5uxLpQp4xUN0zJSUMlSmC2zC0Z//7c79ED4FrYMxr48BuHXUOWLUUQZK7xW8d5zgmjIHgOqUmFTikpA3sQASfkd+YjxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7676.namprd11.prod.outlook.com (2603:10b6:610:127::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.15; Wed, 7 Oct 2026 05:06:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 05:06:09 +0000
Message-ID: <7cf5bba0-5be2-4e5b-a9a6-10abd73d2330@intel.com>
Date: Wed, 7 Oct 2026 10:36:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
 <20261005090156.1233748-11-riana.tauro@intel.com>
 <DS0PR11MB871825E717FD05B9DE95144381962@DS0PR11MB8718.namprd11.prod.outlook.com>
 <DS0PR11MB8718657531C7847104A807AB81952@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB8718657531C7847104A807AB81952@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: c18d7cac-3b1e-46f0-e440-08df2430b310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|4143699003|22082099003|18002099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: LeAGw98HR54HbtiDPm6F6jmq4FfuRC5QHrHRa6G/yD/B3LpgThR0ZMmjtqsrCyp1g7epGTSh/FOg+a+hUvuWHF4fbY/0x/moOk6F8gsT9jXpFVXLPJlWBuGYcbSSP6/L7MKHHpkVsudz57xhZm0QZFbBwgAa2OP5OevU6S1rftQ5a763BuFhawvrSZ0fwregUqoFYubT2ETbgGw86qmU0k5JCQVOHmrYuG3lkzoou83Knlx+qdDM7xzAvKy00Ok1Cj/zy/k2otU+ee+19M4J+EQlbUYX/INnvzzvmdjrcFkfISaQKzsQvtVx7gUXHn1wAOvT/LikDYSnrEiMNvzFmxAcnbEHsSeNtRDuL3jSYNTKY8bRCwAO5C0shsa8ikg/tmBwAtb/NXtepRco8mj0eGOv3cfSB5MGMqOy8wuqqkl+z6kWoOPMFSIF2xj73Xh9Lw4BVf69Rk3/yiUH6R8BzXCTR+0cBJxiFKLL95K3QhVjkDaygPArfdNNJ/bJ8JJnd4Aw3op0U7u/kMZ/ocm2+LmlUJwARQkcvCtw284j0hjk3cxYYwFTpBUTJEG6puC0UibKI504BcqTliE2X3O44LxaZm2HaL7MMBK2Q5bdMFoEQh6Uy2BCHrnLmi4toWgTUnaTGR3oQl1hRwthBOp1ruamxcVKiKGaqJeFoElKR/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3ZsYzA1WHJHQ3FOYzFVbElDVmVLUGpRb3ovL1dTVDE2RGhlMkpaU29pQ3Fi?=
 =?utf-8?B?bHI5T3h4MUFPYmVwcDVtMStWcU10dWM5UG13bXZzbHZmTk5NalJCaTF5RTVR?=
 =?utf-8?B?WE02VkdPV0N0SngreDBhM2RUU2VmS3Q5aTdWMEd0WmxoVE4xMEp0eEVZV3hY?=
 =?utf-8?B?Q040OE1FdThwN3JMeGJYK2hpaDU4M0U2UHUybnMxVUkxeGlJZnlFcEhUQVNV?=
 =?utf-8?B?TmNrd2V0VmNzclpCMVdieFBuRHdFZHNWZStwNC8xUWl0Si90QnlqMit2c1Vt?=
 =?utf-8?B?eVYxRENJVzlHY1J0ckJLRWtYMGpRUm9KUk9TcXB4MXlrYmhuN1hCZyt1Nkht?=
 =?utf-8?B?V2h6Q0Ywa3YwRGFNTHJydnkvRG95ejZrVjVWMTJwRW1OMVRhQnBKb3lxejFv?=
 =?utf-8?B?dlErY0U5RzF1VUFyODU0ME5BeERWd0xuOUhPQ1Q1MXoxcm1nUm8xYXdWNGVv?=
 =?utf-8?B?L1R0WEFQSGQyMEIyK2FaZStzUkRydVAxb25hQUphOStMQXJtanNLTml0V3BV?=
 =?utf-8?B?T3pVRnFFZVl0dzhMV2RTNjFrQVlwUzFOVkYwNUtyK1FseUJweDVKdVZUc1ZH?=
 =?utf-8?B?czdtWElmaVVhWVdIb2loaEg0Rlc5bTM4SnRieHVvL3pnSThkRGRIWmRFMFEy?=
 =?utf-8?B?SWMwL3FoL0J1akQyS1hKd3lIQzJSdUp5OStSNTh6dWRtUnFlbUpqWVhwbmpP?=
 =?utf-8?B?aklzUExEbjMvL0FiSklFWDAwTWVqdmY1ZldNT09vSkdEV2h6a2VRZ0xWQnhP?=
 =?utf-8?B?UE9hUGNjV25Scys2VlcxendmZjJEQkViTEFVVmJwbEpmRFhkaVNDcFFDYTdi?=
 =?utf-8?B?SmFacVVxQ0hRWmRRNGNPSXZ5d200Z0lMb2FpQitnSW5sUjByK0tHNkZCL000?=
 =?utf-8?B?bElsUVJ5emN1V2F2am1uTlBXM0piZERJYjN6eE1lOFVSa2FubTFsV0V2Zi9O?=
 =?utf-8?B?NTdWK0pkRjdlL3UwR05JdkU4b2E5dHNxMS9vRllqbWZhWTJHTjdrQnc5T3hF?=
 =?utf-8?B?OWkvbU1vLysySVhwYWpFcDZlb0piaVcxOSsyZjhiWVRUSkQxd2VDcTZkQkZX?=
 =?utf-8?B?R0NIeVcxMXMwaU5PRGkvNU84aGlMeUdqU0lEYzA0bVl4VlVzb3J1MDVTSlVO?=
 =?utf-8?B?TzUvUjNDenZVdVk0Vm1mOVZRZ3FVak9TcDlnV0RxaGhZa0pkb0F2c0FvMU1L?=
 =?utf-8?B?NGhkMlJ6ZTlUbFJPN2xQdnZ3VlV6Vk0waGt4eGM1SmxNckFhM3JsdUpRSnRN?=
 =?utf-8?B?ZTdwZE1TTFFBZlpBbURxSGhIQ1REUUZ2S0VmNzJiVURSZkJnQzRoRXZyZ1dB?=
 =?utf-8?B?eXNVc21yOHIvZjhKRDY2am9IM0l5WGNoamJ2aDRYdE5DNGZXc0FZQm44UFha?=
 =?utf-8?B?L0RnYkhRVjRVQTV2Z1pyUnVLVDM5b3BkSjNyVFkzWTJoRlFPNE81OHVtYWp2?=
 =?utf-8?B?UzhVQ3lSdVA2UGgzKzVlZmJGVURYMWl2RFhXSFBKWUtia0RDcTBCQThWdGRw?=
 =?utf-8?B?L0NqOWdYd1dlb0s5UU9Ddm12eVZPaVZXb3ZOZzJQYUdVeDFSZ1U4aytFT1g4?=
 =?utf-8?B?MlVNZlhlWHFDR2UyK0dyLy96Z2krQlF2K012V3g2UHNNNTcvK2dzTStEb3Ay?=
 =?utf-8?B?U0tHSnNyQnZ4L29oVGYzajJKNlRkU2xjd1FBWmlPam50bEN0anFSMitGWU9U?=
 =?utf-8?B?QXJLUWR5K2s0SkgwMy9pc21ScktkNWhqYTZianJEK1ViUnYvWUlRU01aaSt3?=
 =?utf-8?B?VEpkNmN3dm0rQitkcFJiamwyYTFlajYxSmhRK291SG42YWgvWnBCdjRHWm5n?=
 =?utf-8?B?MUV0R3hRTENkd3cxa05sV3NJZzFOc01HMTlLS0xGUUZXQkNnR0RyRG9DK295?=
 =?utf-8?B?VVJqVUc0OCtsTzdqd1Bhd1BnYlYvZFFVU1FBMFh6UnVXa2pnVlEreXhrbkZM?=
 =?utf-8?B?YlFQK2VueUJxckpuMUdqTkdyNm5LbnYrcEYzaGlkSFpXb3lsNWtEOGRVWW5v?=
 =?utf-8?B?WWpxaUFBY2p4TEJtLzFQSE9LWHpacEVZWkQyVkQrODZqWjV4dVovcWlqYmdp?=
 =?utf-8?B?Y1Y2aERuZUJuNTVUTlpoOStRVFhqL0FXNURDOGpPSkJ0NFdjMk16L2NnNW1z?=
 =?utf-8?B?SkFMUklUZDBNQWdCS24rbzFZQkx2djJHc2JTb1k3MDVMbERHOEpCTFpkMTVU?=
 =?utf-8?B?VmJYQUtpTVkwR1R4UjJ0QzRPWUMxQnZJYW5VaTJYWHFQb2I3ekFmeFI2ekJT?=
 =?utf-8?B?SklHKzlPMUl6SFZiVjBTM1l3a2VsUDBXTlB6VlYzQkdHdmEva3NzU0h2N1c0?=
 =?utf-8?B?dVcwTHM5dVpmQ1Z1bHdkN1AyRE5HRkI0OW92dXp6aEZEcEFma2N0Zz09?=
X-Exchange-RoutingPolicyChecked: Jo2sJGsTooVfD0yPIkOsSsgQHJigWd+pu0IAvhB78kEWhJJB/kNw+OmCA4OHzzuanZ7ZqqGLb55XCl/JsdbPzHIkFl2U7hcCvsLo9oah7xDVO5OQN2JUz+ECAVfF8CU2FYS1WKDkvD4F0EbH5d8qO98MDcKyZbdPRAZVGejjmVdB4rQw0KBEqkzNaraKBD7X4v+QUtIjaeFnD0CZbhlADV/D6bw6IK5NcKLOihkmP4ZCJ0To2C8lOCo8Wmaj9QhyCjSJEka3PLpfC6cIsMuS7rRcueeUqRbMcQ8lz2zLkhNHrJnexTPuujha6Hi/08uft+AvS+rPFr1lXiN7/HtFZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c18d7cac-3b1e-46f0-e440-08df2430b310
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 05:06:09.3595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWpCnt5Qwq+CzpNn5lCv1IDd57r4vDgSFyDJmE9MqbrhFkk3sVkts5D13fmnKQUP7ajxDpCEOhZbDJOlytFjEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
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


On 06-10-2026 09:25, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Upadhyay, Tejas
>> Sent: 05 October 2026 16:59
>> To: Tauro, Riana <riana.tauro@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>
>> Subject: RE: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offline
>> queue and list
>>
>>
>>
>>> -----Original Message-----
>>> From: Tauro, Riana <riana.tauro@intel.com>
>>> Sent: 05 October 2026 14:32
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>;
>>> Koujalagi, Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
>>> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
>>> <himal.prasad.ghimiray@intel.com>
>>> Subject: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page
>>> offline queue and list
>>>
>>> Add support to query page offline list and queue from firmware during
>>> module load. The page offline list command retrieves pages that are
>>> already offlined by the firmware. The page offline queue command
>>> retrieves the pages pending to be offlined by the firmware.
>>>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> v2: rebase
>>>      store total pages once per response (Sashiko)
>>>
>>> v3: common function for offline and queue (Himal)
>>>
>>> v4: re-order list and queue (Sashiko, Himal)
>>>      remove type
>>> 	use size_t
>>> 	add description and rename functions (Tejas)
>> LGTM,
>> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> Tejas
>>> ---
>>>   drivers/gpu/drm/xe/xe_ras.c                   | 87 +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ras_types.h             | 35 ++++++++
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>>>   3 files changed, 126 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 2ec310c29489..14fc3227483c 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -343,6 +343,89 @@ static bool ras_counter_is_valid(struct xe_device
>>> *xe, struct xe_ras_error_class
>>>   	return true;
>>>   }
>>>
>>> +/*
>>> + * Fetch and process offline list and queue from firmware via mailbox.
>>> +@notify_fw controls
>>> + * whether firmware is notified of the offline/remove action.
>>> + */
>>> +static void process_offline_pages(struct xe_device *xe, u32 cmd, void
>>> +*req,
>>> size_t req_size,
>>> +				  void *resp, size_t resp_size,
>>> +				  struct xe_ras_offline_common *common,
>>> bool notify_fw) {
>>> +	struct xe_sysctrl_mailbox_command command = {0};
>>> +	struct xe_ras_offline_list_request *list_req;
>>> +	u32 total_pages = 0, count = 0;
>>> +	size_t rlen;
>>> +	int ret, i;
>>> +
>>> +	list_req = req;
>>> +
>>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
>>> cmd, req, req_size, resp,
>>> +				  resp_size);
>>> +
>>> +	do {
>>> +		memset(resp, 0, resp_size);
>>> +
>>> +		if (list_req)
>>> +			list_req->index = count;
>>> +
>>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>> +		if (ret) {
>>> +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline
>>> data, cmd=%#x\n",
>>> +				   cmd);
>>> +			return;
>>> +		}
>>> +
>>> +		if (rlen != resp_size) {
>>> +			xe_log_err(xe, SYSCTRL, -EINVAL,
>>> +				   "unexpected page offline response length
>>> %zu (expected %zu), cmd=%#x\n",
>>> +				   rlen, resp_size, cmd);
>>> +			return;
>>> +		}
>>> +
>>> +		for (i = 0; i < common->pages_returned && i <
>>> XE_RAS_NUM_PAGES; i++)
>>> +			handle_page_offline(xe, common->page_addresses[i],
>>> notify_fw);
>>> +
>>> +		count += common->pages_returned;
>>> +		if (!common->pages_returned)
>>> +			break;
>>> +
>>> +		if (!total_pages)
>>> +			total_pages = common->total_pages;
>>> +
>>> +		if (count > total_pages) {
>>> +			xe_log_err(xe, SYSCTRL, -EINVAL,
>>> +				   "Pages returned exceed total pages %u,
>>> returned %u, cmd=%#x\n",
>>> +				   total_pages, count, cmd);
>>> +			return;
>>> +		}
>>> +	} while (common->additional_data);
>>> +}
>>> +
>>> +/*
>>> + * Retrieve firmware queued pages from warm-retained SRAM during
>> probe.
>>> +Handle and soft-offline
>>> + * each page as required.
>>> + */
>>> +static void get_offline_queue(struct xe_device *xe) {
>>> +	struct xe_ras_offline_common response = {0};
>>> +
>>> +	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE,
>>> NULL, 0, &response,
>>> +			      sizeof(response), &response, true); }
>>> +
>>> +/*
>>> + * Retrieve permanently offlined pages from firmware's non-volatile
>>> +storage during probe,
>>> + * allowing the driver to soft-offline them before kernel allocations begin.
>>> + */
>>> +static void get_offline_list(struct xe_device *xe) {
>>> +	struct xe_ras_offline_list_response response = {0};
>>> +	struct xe_ras_offline_list_request request = {0};
>>> +
>>> +	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
>>> &request, sizeof(request),
>>> +			      &response, sizeof(response), &response.common,
>>> false); }
>>> +
>>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)  {
>>>   	struct pci_dev *vsp;
>>> @@ -1067,6 +1150,10 @@ void xe_ras_init(struct xe_device *xe)
>>>   	if (IS_ENABLED(CONFIG_PCIEAER))
>>>   		ras_usp_aer_init(xe);
>>>
>>> +	/* Fetch the offline list before queue to avoid duplication */
> How about suspend/resume, do list persist or again ras_init()?

The soft page offlined buffers would retain across suspend resume . So 
do we need to fetch
again from firmware?

The pages stored in flash will be retained.

Riana

>
> Tejas
>>> +	get_offline_list(xe);
>>> +	get_offline_queue(xe);
>>> +
>>>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>>   	if (ret)
>>>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>>> b/drivers/gpu/drm/xe/xe_ras_types.h
>>> index 1495a8636255..40224db38906 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -10,6 +10,7 @@
>>>
>>>   #define XE_RAS_NUM_COUNTERS			16
>>>   #define XE_RAS_NUM_ERROR_ARR			3
>>> +#define XE_RAS_NUM_PAGES			25
>>>   /* Error bits in IEH global error status register */
>>>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>>>   /* Device memory error categories */
>>> @@ -330,6 +331,40 @@ struct xe_ras_page_offline_response {
>>>   	u32 reserved;
>>>   } __packed;
>>>
>>> +/**
>>> + * struct xe_ras_offline_common - Common structure for offline list
>>> +and queue  */ struct xe_ras_offline_common {
>>> +	/** @total_pages: Total number of queued pages */
>>> +	u32 total_pages;
>>> +	/** @pages_returned: Number of pages returned in this response */
>>> +	u32 pages_returned;
>>> +	/** @page_addresses: Array of page addresses (4KB aligned) */
>>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>>> +	/** @additional_data: Indicates if more data is available */
>>> +	u8 additional_data;
>>> +	/** @reserved: Reserved for future use */
>>> +	u8 reserved[3];
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_offline_list_request - Request for get offline list
>>> +command  */ struct xe_ras_offline_list_request {
>>> +	/** @index: Zero-based index into the offline page list */
>>> +	u32 index;
>>> +} __packed;
>>> +
>>> +/**
>>> + * struct xe_ras_offline_list_response - Response from get offline
>>> +list command  */ struct xe_ras_offline_list_response {
>>> +	/** @max_entries: Total no of pages that can be stored in flash */
>>> +	u32 max_entries;
>>> +	/** @common: Common offline page information */
>>> +	struct xe_ras_offline_common common; } __packed;
>>> +
>>>   /**
>>>    * struct xe_ras_get_health_request - Request structure for obtaining
>>> gpu health
>>>    */
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> index 60d17ccc002c..e1bb64856f43 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>> @@ -31,6 +31,8 @@ enum xe_sysctrl_group {
>>>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove
>>> a page
>>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined
>>> + pages from flash
>>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined
>>> queued
>>> + pages from firmware
>>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>>    */
>>> @@ -42,6 +44,8 @@ enum xe_sysctrl_gfsp_cmd {
>>>   	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
>>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>>>   	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
>>> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
>>> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>>>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>>>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>>>   };
>>> --
>>> 2.47.1
