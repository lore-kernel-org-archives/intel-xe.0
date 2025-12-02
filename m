Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FD6D11700
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 16:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820C810E187;
	Tue,  2 Dec 2025 16:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2dwPdF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0293010E187
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764692708; x=1796228708;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fVKsv63b/Vf4Cl5Kxjosf5V11mjxUi3xaqnYD6vdlmE=;
 b=O2dwPdF4Fcmj1xa+yE79H9MfMOuffwkUdpwFjISDcTGfKsd7RL7QhMLb
 VHUS5crz9owEPTCc58uHlOF0BpzMaSSueo0CM8O9jdPNRKPG+pSVtzaLj
 TOqsMTM0Llgsp3X5g1W16/IMmixILYJXSeLxpeAEVa318SrqeF2oraKiy
 6SOdQQLvw/+KNA7dIsw7JZn8jlXF8prs5mJHEOwTfx3Jfd7o3SWcYTGDS
 sd3b8Cc5Yv0GPLyvu9NDD9PXd2x9gLhw7aWhE0PC7XKgMiC3DL87MEPHu
 lkYkSoQLldDWnhOOtNeawhSzeoED+7Jnp7G0Vn8eg6Scjz3TxbWhJwi5F Q==;
X-CSE-ConnectionGUID: 3+d51AcXTFCMMJewqLmSow==
X-CSE-MsgGUID: eqxqwOXTTiyq71uX+TWwnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78012818"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="78012818"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:25:07 -0800
X-CSE-ConnectionGUID: IB87GQmgQLehKQ40Pep27Q==
X-CSE-MsgGUID: kmlaipStQ9W9oAT4Dr1kxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194096001"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:25:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:25:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:25:07 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:25:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaeqOFxNsBEus4VbzFh1k6+moRSBLh2DCkNqFuekCS0gpL0NgrZc+S4JRSurqjTSQGgIc1JPQYtumHBz/Uo50IVNN5UjTH9bfBz+DWJ6FcHgXifyX/yoR7yNiwXcLn53qtGs2spKcI6IvRPnO83MupnYPr1iDLckUyk9GQGrrJImouL/J88uPf9Syme9ql4BoxR+eOBTJ7jgB39McgddHgGAAcp1Dd2bF5C5ydaY6ivCo8pBeZa+ALiAdYUkZJveUf/4rD8K8QxGM6e6CCPLQ1jXgjggNN4ydmScRCIXjqF72befV5sMzh9Df3XF8ewjimVHMfIcaaSBpXiT4WJsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRkHeqP+xZEFTsEIeveCOfWBNlEVsn+9BPPAAYQWBRc=;
 b=pC/DuJcSO6mHvC1AnGQatLgwVE7QALl3kXId9rP9S0dUh41KgPokOGhGEGtUmS/xJLaECkdk1x8rK5QBmCVIdpiVpN3ml2g4L1Ebu39wbKH/NHsXmJovUYdqcO6H8OgVdNc2iKagTa2lqGmUHX6MfixEO8oAddzHISMttoeZlR0MAKkXz86vjYgKLCmTlnC44PvOYpDahpMOkz4S+dlyoctOVQwwBmnSccVxD5nXJn5sVzXhnPJbFv7WdQwtPqiLS61V7ELT2L+Go6FW6nG+njS8RMNQefVmdyswMtQcDztXtxE6nGTdd00Jmo8o8j9a4RHstX7uH0TzR/2VgQdhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 16:24:59 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:24:59 +0000
Message-ID: <f702edc8-b8b0-4c8e-abd9-5ff017b6c896@intel.com>
Date: Tue, 2 Dec 2025 17:24:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] drm/xe/sriov: Add debugfs with scheduler groups
 information
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-18-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-18-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2551fe-1d1d-4a31-df8f-08de31bf5638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emZDRXZsc3lUVzFjZE8vb2YrRzE4QmpTOVplVEloYWFuMG55c0MySU1GbFkw?=
 =?utf-8?B?eTVvR0RZZ24zQ3h0NTk2QmJTRUJCQUFUN0Fuak5oN1pxR1ErZmM1YldXakd5?=
 =?utf-8?B?d2hQUFZnQnpXdmVtVkIxT25nTnBuaTlMU1c5cUNjNWNza0N6WjU0c3gyYUln?=
 =?utf-8?B?NU9XNHhpKzVhKzVEbjZTWkJla3ZPSUFkTzBjUU5KTzdxWjRBbjB0SmtvK2Uv?=
 =?utf-8?B?N05jQWJnTWVxSXNTNWZybEpKZ0hOZk9ZVVp4ekdFVktxdUgwNkxwSURQMVFE?=
 =?utf-8?B?eTZUZVhNWDAyZFRCYmRWUFY3RStpTEthaVhta0VCRTdsRW5QVkhXQVJEQ3hN?=
 =?utf-8?B?OVBXZTd4M1g5R0VwVGROc3ZLSGp1Z3BVZm1QQnk5VXlXUFU2OEJnS3k5LzUw?=
 =?utf-8?B?eEtadW9peitGcVUyakVTQTZVTUVORHlYMVFvWUdJQkYxKzhpTXA0N1BYNHBj?=
 =?utf-8?B?UnNuTWROMDlVSnFZYWNOKzRFWkNmUHA0MzF4ZHRVaUdGLzVaRmZ6Z2psVEFD?=
 =?utf-8?B?aS95ZTcvRHV3ZEp6OGplYkx5V2lEQmNuNjlvRVJabWhjMEJTTy9QVVJpSENW?=
 =?utf-8?B?eHBNc0k2cDNpc3QwNVlCVFM5SDNTTTVTSEhsNThRSUxpdXdWOHhJK1ZvVlBW?=
 =?utf-8?B?UHlFTVVDV0xnU3UwenB2TWNuWmZaSDJXRjRtbk5TZW80cWN0WHNjL3ZDcjFH?=
 =?utf-8?B?a2dwVVFkamtLUmh1WHNZS2dsMFUrclh2Yy9TMXF1WU9pUUU0ZG9xc0hhL2pn?=
 =?utf-8?B?WmJHZTEwNHlyV3ZhVjFtbXA4ckVGS1kza3pydHpmVDg0dDdubXhhdlhVZWpx?=
 =?utf-8?B?bzZGY25QN0ZleFJ4VWoyQUFsanE3RGJ6WStYMHlpbjBycW9RWHhCYytNOWc5?=
 =?utf-8?B?M3RTdklhVDVUNkRYUGN2QWswRGY5QUh1Q2MxY1VRSmR5a2lVN0VKQXZ4MDhS?=
 =?utf-8?B?UjJ5MldZd1B3N3NqMkZSbk43Sm52aG9rNUNQWFVLNVkxOHJYTUxHRVFZMFBE?=
 =?utf-8?B?L0VZbDhwNEpnSlJjNUgvTngvekVJQWFOMzJCUlN1emdjTDVPSmJjcVBNbXBD?=
 =?utf-8?B?N3Y1L0pHeUNYS3RyaEVPeTNOKzdyOSsxSVZ5Y2FEOU8rRUthLzcvbEhxYVJR?=
 =?utf-8?B?TVovZ2s1MVVKV2N3SC9yV1RNZFdVdWlJTk1LaURleUN0a3NKaVNHRWNhU2RB?=
 =?utf-8?B?eENoTUxYUkdhTXF0ZFN2K1BqdzNUcjJubVdGN3dHRVJNSjk2MnV3bngzcVB1?=
 =?utf-8?B?RzYyekN0b3k0d2YzSHBQTHlkNEs1WUJXdkNqb1BvbjFSekxWQVJBRWdiWm1k?=
 =?utf-8?B?SGFUVFRuUVpzcVlmRTVpVUE2VWIweGlITHFkcXdieXlwdkpLa2pFeFprb04z?=
 =?utf-8?B?bXd3UHlTS1ZHM2lhaERNRTRMb0Y0cngzbGsrMndNdVgxdlMzU3QwY3FETmQ4?=
 =?utf-8?B?enNyaDN1SG5rVHA3U09pWjJNVVVCaUFTTXhabGkzRjZsb1lIRWxUWTlDUURF?=
 =?utf-8?B?Y21abUwzeTJENy9KOFlUa1QyWm9ja1hTQ29tbTZxZ1pHQnMvcFhiZCs2dzZi?=
 =?utf-8?B?WkNhZUsybkN4K3U1ZzJDWExVcllqcEpadmV1OVo4TE5Uc1JhQzV6bENJYnJi?=
 =?utf-8?B?T3lRY0QzV2NISGQzUTJJMFRCNWsxb20ramZUQXNiQlIvU3hQTTVnYWVTMC85?=
 =?utf-8?B?ZWhZQit2cy9KSmRoUExZVWpoTjdzWlFJMkt5eWhVeDFDSHYrMG03VzhaWFM1?=
 =?utf-8?B?OU4xeUswNytQZEhqOTIydzJpbU9BWDUrMlFSRVkrVnNqSDJRV2hkWFhWMy9u?=
 =?utf-8?B?Sno2eGZva2dYYVBSUDNvcU8yT05ZckhQbjJHMVZSZTNwUi9nQUhHaVkxZHBy?=
 =?utf-8?B?R1ZxNkZBeU5kd0plZmRtcHY4aWFmVVA2T28xYWlUclFKS3RrcVVvYVU5Nzdq?=
 =?utf-8?Q?aw4hfd2ChPALobnVwGvwEv//B+WB0/O6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmFHZmRBeWJHYUl0azBKbmlzWks0U3NuREw5TFFxa1hHcWpkQlpITC80bWE4?=
 =?utf-8?B?U3hxVS9icVMwc0h4TFM3SWRXR05iazA0aDdZMklDTWdDdC9LVW4vSW1FalJ0?=
 =?utf-8?B?M1g0eHZJb2ZQTnZsNnM5Qkt1eVZFekljaGV1a3poY09TbjFkYkpyNmZwZjB6?=
 =?utf-8?B?MUZLWHp5UlhHeXpUaWNVNFh6N09NVW5oaElYenZZSUZwNDNHUG5Lb3NaUHlm?=
 =?utf-8?B?bjd0cmNPMGhGWC9hL2xickl2L1BrQjlOMlIzWndWL2NkRjl2SER6di9zbkNB?=
 =?utf-8?B?YkJlTy9YQ2tEUG1sK1dYYWQwSXBQczlEYnl6d2N6Y2JGVXRDbmtIOU9QQ2Jj?=
 =?utf-8?B?YWpkTXp4dktWY3NmODd5OTZOems2d3prRitQZ2I3KzlPSkpIQkxLV2kxcVo4?=
 =?utf-8?B?VVVkOUxqdjVZaXMvYk9tYk1vVlJPMmpKTVNzaThMVmVidnBtMHRaSGpUOWFr?=
 =?utf-8?B?d0dJWVJ6d09PV3R1Wm5CR2NPd3d3MTIvdnBuZjlkdXBWb252OWpTVUl1UVlr?=
 =?utf-8?B?OGJoSTZEWFJhZ1dZZlpudytOcWNCeTdNd3RZYmdET0pZZFcwRFE4Yy9XbjJm?=
 =?utf-8?B?QjhvQzhXU01sUkJBYjVXQnFRQ2I1TmdHWnhoRDNRSWdmWi9uUExRajhQMUpC?=
 =?utf-8?B?aFJIQXNLS21yMUFyQTRwd3M1RXUvQk9qYUpSWElmOG0wb0UveEpxN0w1SU02?=
 =?utf-8?B?S0pabU5PSUpwRWNCc2NvNWROUjJmTVRHTTJnWXd3YmtJaVZjUVFiME9tTFVP?=
 =?utf-8?B?OVVNcW5ic2ZrVUdaVXg5czA3L09DaTRiWXltay9aYk9yekNxRkFkZ3gwdXZu?=
 =?utf-8?B?UEllVzkvN2hFL0ZuYnhUR0duLzJJa2pqSzhUZ0xad3BEL2xweGo1aDZ1b0s3?=
 =?utf-8?B?OGRKVko1djQ0U2RaZWQ0STBiOGZRZnp5V0MycFlUQU0rdmpLQjRVdHhwdVNZ?=
 =?utf-8?B?ZC9JQTF6WU85eWFiK2d3SGxrckhFZUhKMEFTdWM2S3VzTFp6c3hqUDlmQzMw?=
 =?utf-8?B?NHpZWlNnOXNia2FTd2xSRThFY0dRZ0ZsVUV3SHU3TjJiazMwSDBFS0xGbHZv?=
 =?utf-8?B?T0hITjU3R3JNalpWTkI3Q2JnRGxDa3lheDMxblJxcm1aMFh1b0ZLaXZvcHE4?=
 =?utf-8?B?UUY1V1hieUlRMFNiTHBibVcrVWJNY2NMc3I4UFkvczVTdXJQMFVqTUd2Tjhj?=
 =?utf-8?B?ZjdKZzBGelcwN1hSYllYOVBiWllQbUZOUTZrODlwYnlqeUx3TDkrUlY3OTRj?=
 =?utf-8?B?VWhCTEQwdmxpK0RmV09RZHl0QzJRSFQ3QVZ0d084Q0NTSm96NXNJeDhOQTF2?=
 =?utf-8?B?OTJ5VnhNSm5aNWtyU1FwajA3VW5BeXhKSXAzWUt2WjREUkZtTkkyRWZWanE3?=
 =?utf-8?B?RlU2bVNvYnVvM1crZUc0NnVEV2NMNDdVZzhsUzlyVlA3MGdlZ2QzcjlkY1J2?=
 =?utf-8?B?S2t0NkFPWXlieGpzS2Q1R0lMaXJKWDlCWWYvTkJvUU1ROUlLZ0lDdVAxejFm?=
 =?utf-8?B?N3BIbEhBWFhGamw4cnZrc2VDeGpjenRULzdteW92cUg5dms4Q2NNOTZSdEV4?=
 =?utf-8?B?U05aM08vN2xXRzJHMHBuY0VjYnYwV2lwRU1NQTlQU3dyZU12Y0hlOFAxbWxh?=
 =?utf-8?B?Y2lYQ25PUktpY0k3alF1Rk43bFdzaXZmUWs3Vkxoa0NTSTBvNVhUNzVOVDM4?=
 =?utf-8?B?bmZpb3ZMUVdlYks3SjFva0doZlZybldVNDduK1pRaVRwcUlRY3dBWTl1ZzBs?=
 =?utf-8?B?Ykt2eXpFRXgxYy9IVzJEU2lENys1MHVMTCtNUmpFcWk0RHRXeUhDYVpyRWpJ?=
 =?utf-8?B?RDBVSUhJT0RBNkYzdWovYXByd0VlV21CcENncEZCZkQrQ3luSDE2VXVYRitx?=
 =?utf-8?B?TTc5aHcxdGQ2TTJHQVBZQnJ4alYvTXBsN2E4WDdkMXN2VHZPWnBObVVoSytp?=
 =?utf-8?B?V1FwMkFLS3dYS3F0OWVMbG5PS2RES3h6amtHaEkzVWFrRFZJZ0R3RVFUVGRN?=
 =?utf-8?B?akgwOTlnZGQ2SVZFUEl4WkxUZXljOXF0NVQ2L0k1c0N1NWFjaDF4NnlLYXdO?=
 =?utf-8?B?cDBYcWlxOUNPRmtLTTJacFZUbjI3VmFKQWwvNzVNWExLMk92L3lZMGVmWmJo?=
 =?utf-8?B?dnVpU3dabGRnNkFSMVVuQ3VmenJ6T1NXUW5kRlQvNUxyRGo0U2tQNnVTSWZo?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2551fe-1d1d-4a31-df8f-08de31bf5638
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:24:59.1734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFkIZeyy/kdcw4HmINC7M8ur9FipBtqDgQRExlG1J64kXmM57u8T/ufGHEbLQo5DpAs/9aCRPUex2vBTxwR9pvuoLIkLxu56vkMgFvbE+d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> When schedulers groups are enabled, we dynamically create new debugfs
> folders under the GT folder for the PF and each VF. The aim is to have

hmm, but since this is debugfs and groups (even uninitialized) still exist
then maybe it is easier (and safer) to create static list of groups (8 or 2)
and just print their configurations: either empty (if uninitialized) or with
engine names (after selecting predefined EGS mode)

then debugfs files (not directories) will reflect currently used configuration

> all the info for each VF under the sched_groups folder, with individual
> folders per-group under it. Right now the only info is the engine list,
> but follow up patches will add execution quantum and preemption timeout
> as well (which are configurable per-group-per-VF).

but groups EQ/PT configuration is not per-group, but only per-GT (GuC)
so it should be OK to have them level up

> 
> Note that the engine lists are not configurable per-VF and therefore not
> strictly needed in the VF folders. However, it is still useful to have
> them there because an admin might want to check the engine list while
> configuring the EQ/PT values for a specific VF.

duplicating RO entries per-VF seems odd, maybe it's better to use symlinks:


/sys/kernel/debug/dri/BDF/
├── sriov
:   ├── pf
    :   ├── tile0
        :   ├── gt0
            :   ├── sched_groups_mode			# disabled [media_slices]
                ├── sched_groups_exec_quantums_ms	# 20 20
                ├── sched_groups_preempt_timeouts_us	# 2000 2000
                ├── sched_groups
                :   ├── group0				# vcs0 vcs1 vecs0
                :   ├── group1				# vcs2 vcs3 vecs1
                :   ├── group2				#
                    :
                    └── group7
    ├── vf1
    :   ├── tile0
        :   ├── gt0
                ├── sched_groups_exec_quantums_ms	# 30 30
                ├── sched_groups_preempt_timeouts_us	# 3000 3000
                ├── sched_groups --> ../../../pf/tile0/gt0/sched_groups

    ├── vf2
    :   ├── tile0
        :   ├── gt0
                ├── sched_groups_exec_quantums_ms	# 40 40
                ├── sched_groups_preempt_timeouts_us	# 4000 4000
                ├── sched_groups --> ../../../pf/tile0/gt0/sched_groups

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 140 +++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h   |   4 +
>  2 files changed, 143 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 2953ef21a5ad..947e2b92d58a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/debugfs.h>
>  
> +#include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>
>  
> @@ -21,6 +22,7 @@
>  #include "xe_gt_sriov_pf_monitor.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
> +#include "xe_guc.h"
>  #include "xe_pm.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_provision.h"
> @@ -162,8 +164,127 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>   *          :   ├── tile0
>   *              :   ├── gt0
>   *                  :   ├── sched_groups_mode
> + *                      ├── sched_groups
> + *                      :   ├── group0
> + *                          :   └── engines
> + *                          :
> + *                          └── groupN
> + *          :                   └── engines
> + *          ├── vf1
> + *          :   ├── tile0
> + *              :   ├── gt0
> + *                  :   ├── sched_groups
> + *                      :   ├── group0
> + *                          :   └── engines
>   */
>  
> +struct sched_group_info {
> +	struct xe_gt *gt;

we should be able to get gt and vfid from parents d_inode->i_private

> +	u32 *masks;
> +};
> +
> +static int sched_group_engines_info(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct sched_group_info *gi = m->private;
> +	struct xe_gt *gt = gi->gt;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	bool first = true;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +		u32 mask = gi->masks[guc_class];
> +
> +		if (mask & BIT(hwe->logical_instance)) {
> +			drm_printf(&p, "%s%s", first ? "" : " ", hwe->name);
> +
> +			first = false;
> +		}
> +	}
> +
> +	drm_printf(&p, "\n");
> +
> +	return 0;
> +}
> +
> +static int sched_group_engines_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, sched_group_engines_info, inode->i_private);
> +}
> +
> +static const struct file_operations sched_group_engines_fops = {
> +	.owner = THIS_MODULE,
> +	.open = sched_group_engines_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +static void __sched_group_info_cleanup(struct xe_gt *gt, struct dentry *dent)
> +{
> +	if (dent->d_inode->i_private)
> +		drmm_kfree(&gt_to_xe(gt)->drm, dent->d_inode->i_private);
> +
> +	debugfs_remove_recursive(dent);
> +}
> +
> +#define GROUP_INFO_ROOT "sched_groups"
> +static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_pf_policy *policy = &gt->sriov.pf.policy;
> +	u32 mode = policy->guc.sched_groups.current_mode;
> +	u8 num_groups = policy->guc.sched_groups.modes[mode].num_masks / GUC_MAX_ENGINE_CLASSES;
> +	struct sched_group_info *infos;
> +	struct dentry *parent;
> +	struct dentry *old;
> +	u8 g;
> +
> +	if (!gt->sriov.pf.debugfs_roots)
> +		return;
> +
> +	/* remove existing debugfs entries for old groups */
> +	old = debugfs_lookup(GROUP_INFO_ROOT, gt->sriov.pf.debugfs_roots[vfid]);
> +	if (old)
> +		__sched_group_info_cleanup(gt, old);
> +
> +	/* re-create debugfs for new groups (if any)*/
> +	if (!num_groups)
> +		return;
> +
> +	parent = debugfs_create_dir(GROUP_INFO_ROOT, gt->sriov.pf.debugfs_roots[vfid]);
> +	if (IS_ERR(parent))
> +		return;
> +
> +	infos = drmm_kzalloc(&gt_to_xe(gt)->drm, sizeof(*infos) * num_groups, GFP_KERNEL);
> +	if (!infos)
> +		goto out_err;
> +	parent->d_inode->i_private = infos;
> +
> +	for (g = 0; g < num_groups; g++) {
> +		struct sched_group_info *info = &infos[g];
> +		u32 base = g * GUC_MAX_ENGINE_CLASSES;
> +		struct dentry *dent;
> +		char name[10];
> +
> +		snprintf(name, sizeof(name), "group%u", g);
> +		dent = debugfs_create_dir(name, parent);
> +		if (IS_ERR(dent))
> +			goto out_err;
> +
> +		info->gt = gt;
> +		info->masks = &policy->guc.sched_groups.modes[mode].masks[base];
> +
> +		dent->d_inode->i_private = info;
> +		debugfs_create_file("engines", 0644, dent, info, &sched_group_engines_fops);
> +	}
> +
> +	return;
> +
> +out_err:
> +	__sched_group_info_cleanup(gt, parent);
> +}
> +
>  static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>  {
>  	switch (mode) {
> @@ -220,7 +341,7 @@ static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>  	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
>  	char name[32];
>  	int ret;
> -	int m;
> +	int m, i;
>  
>  	if (*pos)
>  		return -ESPIPE;
> @@ -250,6 +371,10 @@ static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>  	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
> +	if (!ret)
> +		for (i = 0; i <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)); i++)
> +			sched_group_info_register(gt, i);
> +
>  	return (ret < 0) ? ret : size;
>  }
>  
> @@ -693,6 +818,19 @@ void xe_gt_sriov_pf_debugfs_populate(struct xe_gt *gt, struct dentry *parent, un
>  		return;
>  	dent->d_inode->i_private = gt;
>  
> +	/*
> +	 * we allocate an array to store the GT-level dentries for PF and all
> +	 * VFs when creating the PF folder. Failing to create this allocation
> +	 * is not fatal.
> +	 */
> +	if (vfid == 0)
> +		gt->sriov.pf.debugfs_roots =
> +			drmm_kcalloc(&gt_to_xe(gt)->drm,
> +				     1 + xe_sriov_pf_get_totalvfs(gt_to_xe(gt)),
> +				     sizeof(struct dentry *), GFP_KERNEL);
> +	if (gt->sriov.pf.debugfs_roots)
> +		gt->sriov.pf.debugfs_roots[vfid] = dent;

for per-VF data we have struct xe_gt_sriov_metadata that can be accessed from
struct xe_gt_sriov_pf

but maybe it shouldn't be needed at all if we create static egs files as
suggested above


> +
>  	xe_gt_assert(gt, extract_gt(dent) == gt);
>  	xe_gt_assert(gt, extract_vfid(dent) == vfid);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 667b8310478d..747ec5dae652 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -15,6 +15,8 @@
>  #include "xe_gt_sriov_pf_policy_types.h"
>  #include "xe_gt_sriov_pf_service_types.h"
>  
> +struct dentry;
> +
>  /**
>   * struct xe_gt_sriov_metadata - GT level per-VF metadata.
>   */
> @@ -52,6 +54,7 @@ struct xe_gt_sriov_pf_workers {
>   * @migration: migration data.
>   * @spare: PF-only provisioning configuration.
>   * @vfs: metadata for all VFs.
> + * @debugfs_root: GT debugfs root for all VFs.
>   */
>  struct xe_gt_sriov_pf {
>  	struct xe_gt_sriov_pf_workers workers;
> @@ -60,6 +63,7 @@ struct xe_gt_sriov_pf {
>  	struct xe_gt_sriov_pf_policy policy;
>  	struct xe_gt_sriov_spare_config spare;
>  	struct xe_gt_sriov_metadata *vfs;
> +	struct dentry **debugfs_roots;
>  };
>  
>  #endif

