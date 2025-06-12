Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D01C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E41F10E095;
	Thu, 12 Jun 2025 18:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UINaFIWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8110E095
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749752503; x=1781288503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sjku2bWtvfSCPcO+3R3xWkHhduDxHMAFSw3lxjFKU3g=;
 b=UINaFIWjh7GblR/hOtbMGQ9cQ9JTi41tnKQuHeXY+e5ysUAbD/pFcPyY
 uIu7wq76jbYnis32dsVau81DXyC/w9fHbxfjxcUiRVNj3Der8U1qLNk1F
 YPXnBpDDplmHsstdHd1KhTf/r3hxfxOEkTevo87Bgc+WQMbMKG1nwbUyz
 I74xPnTT3o+Whi6YqOOnczmrMzGRgC7F/1b4BJdigaYtuHEW17aZ3NGEg
 nJeu91bQaW8QG6gcqNpcJWtWo+EDcjcFiaaLkuT+kmiIp9jVfu7paB9xw
 +GnMpMaOSOmIcAwBel9MDGUqQZqAFVYxanTqaLbENZZc78/9lzvMclB1p w==;
X-CSE-ConnectionGUID: tIYK4yJlQuaqK1NezQg5Qw==
X-CSE-MsgGUID: O2IKdb+WRbmZbpDMmRYiEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63297061"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="63297061"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:21:43 -0700
X-CSE-ConnectionGUID: mkDCu9XaTPW5rfEmpg7eMA==
X-CSE-MsgGUID: QAx4qqL+SdOylscI/QUoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147435786"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:21:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:21:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:21:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.76) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:21:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVxexU0/7A6byDZl/e8dlaf3RNEud3pmglY4aBs44JgmS2uM0TyNxe7T00x8ejcS/5wD7NYKh4hLe0MUGjB9jNIcCQErS+bf1jDqOkQ+4sIQ7JMpSS5yJ8y2fJVp74YVdmxOrFmTwp/XYwx7v9kbO59B+yCZL36zKIvisL9IKxqpPfSbB1yByaajHxGOye1XQGG7pqTIihVER5ZGWWHrW/4a9G593g2dDObLqLoAI7fE2e7wfRVM6hYtoLIkuyrkTlsTjNRJ7Ov7cgTwKIlL6IVn5NpDuDZpkbrq203QENMTFi/ylbfH5UlccAcW6w/LvFC8oA8Pw00t4pOnWDtfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvAYDUOm37wyIgmvABuxr3JiPaLKqSgJvpZtxmUMuY0=;
 b=Dm4MIaGCuK+Ihqt1EzW5coHNegZHkV4Ivaj3LtURWsROFamNutFXRrb9OTE3dshrIUWQhFaYHkjQ49fYABNldZ/vyJpYZBqDOGKFJwzQ9cCZ9f+5H9rgoHV3LX/dZzP6xIyeiWRlDGM7tf3U5Yhy3EOS43XMRxQ7+TEjHQC6bWyvNCZAgXux8MjKJvZsp4RL3uuO1ERcAwY5mqZkocwk8Wtr/x0Cn0FAYStVimYHZDRBYsK3vzIIau6Z19lAvvv0MFep5/m90vIodo/00KWNbI14wd7senn4ARJlvNpyp3Dd6Ln8y3d/QA5BZ2iahGiYXdMQdcG1AI/Q5O45UbKYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Thu, 12 Jun
 2025 18:21:41 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:21:41 +0000
Message-ID: <276c2f6c-c5db-49d1-80b4-6aaaf527bf60@intel.com>
Date: Thu, 12 Jun 2025 11:21:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Default log level to non-verbose
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Mrozek <michal.mrozek@intel.com>
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
 <20250612-guc-log-level-v1-1-51f124a3be6d@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250612-guc-log-level-v1-1-51f124a3be6d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:303:2b::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b6bb61-f668-4fcd-d7a6-08dda9ddfa54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3grQTVGUGhrNUNlNFRLbzdyR3JqU2daNGZYK1J0eWRCYUpBcVQ5Mm45QUoz?=
 =?utf-8?B?ZEU4cW41SjJGejR0enl0YWV0eUxsMlNScXhoc1JzTWdaY1EvVDZBMEE4eXhy?=
 =?utf-8?B?SzErYXJvbXJ5U2xZdXBjMFg2enloREd3YWRNOFlaZk5aU3hvd3RLYTF0NEVN?=
 =?utf-8?B?QklzU3NHMWJEUDBIOGJhbU5zSUk2ZXNqZ2E2NlhQQXhJYStrU3h2TEJOVi93?=
 =?utf-8?B?OTd1bHpiK25nZ1UyNjBPTWRUY2YzWVVnNUNxSU02NU0rR3VyRk5vT0xmb3B6?=
 =?utf-8?B?YU84S0dtbTV5QnpCWm9XY1JPc3VGaXAwZktQdCtzSzVKQndnS0JGclFpdHpE?=
 =?utf-8?B?dFpOYU52WEtGdW1QSHdia3FDSk5hL1hqWUZ6WFl0akFhS2N2emFnMUx6d3By?=
 =?utf-8?B?aVowZ2JXNjF2VVJkWitZNDhLdmZIb25xQWY3cm5JTFMyQkJZY1hTZkM3MW5u?=
 =?utf-8?B?KzViZzBvUE5OTEU5QVZxNVBtdHZuWFpoU3M4UmQyeW5OZktERmExaEtIZGJ2?=
 =?utf-8?B?SlRpaVNSQitKV3dPa2RBSnN6ZmxDVkRxNkorWGFLZVdNNDFPMXM0Y1g0LzUy?=
 =?utf-8?B?YzlYOEhmc3c2SmY4RkZodEt6b2p0bFhWNmhJUXl1NU53TWtnNUMrcWZiZGFP?=
 =?utf-8?B?NVBRczRqd1BHOHVqTWtGckhmNHRWRncxekw4cG9naEw4OGRQMGVhWGFsRVRY?=
 =?utf-8?B?bEMvb3huc01CR1lUVnF3RHV0dWhaYk9vQU9XMW1jYjhrV1oxVlRtNXZiYVdw?=
 =?utf-8?B?Vm42RTM3aDdHTEgwVURyaUwwNC9OemYwc3pJcEZnNHQyMjl0SWRjbWFPTEpX?=
 =?utf-8?B?aG81VitQS0lSWmJ3NzA2elcrVFc0QmlhZy9oeFRFaWMyM0M3SkRsV1pHNFhu?=
 =?utf-8?B?V0ZRdWVJTGIrL2xORjg3aXR2RC8xS1ZRZGFqMU1NbzFMTWFvNjlmd2lGRUJ3?=
 =?utf-8?B?YW9HcVRzUjZOb0xhQ0pVS0VSTXY1Mm1BZlgxTjAzYlcrSGxBTm1icDlDZTB4?=
 =?utf-8?B?N0tobUFrZFVHUzk0TTI4cTZvZDdrZlJVQlRGZFJURW9nbUM5akl6WXQwZm1B?=
 =?utf-8?B?aFVzTUJiT2o1UFlWSldHTHd4UWpoTlBsQUswYXJNYUxrMUoyY1RWajNNRWkz?=
 =?utf-8?B?UC9EK2FrOXJuNjk3dlRYN042SXlaa0VQYjh4YitYdWV0bkZsbVZqdDhtVzNO?=
 =?utf-8?B?YUNWNW9LRjR0QnJDNkdKdmhjdFIzN2pvNGt6TDZZU3N0VGROc09KaW5uYjJQ?=
 =?utf-8?B?Q1daRGpVdS9QNGpkU2ZXSCtWcms0VnRTaVpzL1NlajZyNWVHOEdXbnY1SVdG?=
 =?utf-8?B?andmbTBzamtOejAxQVBqNDlSQmdCYlF0WjR3M25mNlVMbHFRWWViOGMxekdy?=
 =?utf-8?B?TjhIMWIrL3llay9qcDJrMnQ0ZUt2YnR4ZUV1b2U0UlNaZERCOE1rMGtUL1g0?=
 =?utf-8?B?aytnL3crRXNQbW52cXc5QkVjbFFZRk91R0syZFhOdUdFSTU1UnpMZTRydmFt?=
 =?utf-8?B?TXBPNEN1ZXJVZ21weStTWFdTUTh0MmkxRGdOMldid05KWXZIZUdIRDc1Zktz?=
 =?utf-8?B?Q2RFNEs5VlZ6Z01LL1psMXdZblNhcTI5d21zb2pBMWlScTVlQ2tDV3BEeDdQ?=
 =?utf-8?B?Ly9CREwvMThiSUpLQVdHc2xYK1J2QTBDcWMrV0ZkcFFieXBQSzRRUXpNN2l1?=
 =?utf-8?B?aE1LdVFTR1lqbS9BOUV1RHVmSVQyV1JrQWxnVG0vUDFPeEhBeWZremo1TWtQ?=
 =?utf-8?B?UlJnMWJWS29GWGNpUUp2K0RENHBJWTl6NXpqcFU1NmpYaEJqZndiK1VEOGtn?=
 =?utf-8?B?TmlBZWpVNWg1c0hFMHFGNHRaNHJSWTRsS3ppV29Gbk5FdUc0eDNETjRBeGdn?=
 =?utf-8?B?TzNQUFgxSmVCZWsxWEFaTklGRjJHOFZUNXI4aWp0VUVtcUZkdTN2aU9FOXVp?=
 =?utf-8?Q?WeZXZwImMm8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlBnOWRFQmRmQnFYQlRUai9mZWlVYUNyQjk0RjRObFBXeVZwaVdFcjA5V2Vx?=
 =?utf-8?B?Yll6cnNxK0dSU3VVWDZXcHdURGFTRzRZNjQ0T0JSNVhQbXlrcFNNZllGMjN0?=
 =?utf-8?B?alVEVVdOYkdHN1prbVFtR3hObTNLNmYzby9SRGZ5YlRJaURRL3k1cUlZaVBV?=
 =?utf-8?B?V2VKamJJL2lUUFdVUmJ3M0M4ZGxyVlozSWErdkhaUytHQWxiM0F4MUtaZ0ww?=
 =?utf-8?B?dTNOVlVBN1dFRUYyeWVWS0d0bE44QXRaQWpYVGltTDBYdzhpdmcrd2FiNjFD?=
 =?utf-8?B?Q1RSdUZnTjdyNHNRRytLSjI5Wmw2SnBjZWc2cnNhd2VVOURGSFhvNU9sQ1Jh?=
 =?utf-8?B?MUpJNzFyS0xyTU5scEU0cnU0ZlY0SU9IZUU0d1F2eG8zZkk3cmFUS0VZd0tW?=
 =?utf-8?B?ZkFyR05DUVpHbHRONU1vYlZrYWsxcFJSVDhFOHhwRE5teG4wM0dYUHhseW1O?=
 =?utf-8?B?YVo3dkJ4WDRRREdZVGp5YnI5Q1ZFRTEvVGZtRVJodFBWZzJjcnVXSmpseTdY?=
 =?utf-8?B?ODZqNjBIYjNkRE0yc3FKSWp3K0wrUHlqdmorSzlBVU8vZ1psRDhWdTV3bWp6?=
 =?utf-8?B?WndYUGpTeG5lSjA1cUNUeHhjcDhkSDVIMXNqRXllOWt5bytIM3doVlpuV0xp?=
 =?utf-8?B?ckVHRnFVbXlad3BkUytkWXJWS0kzblE1YisyaUthTWlmSDhrcnRWaFpsS1lB?=
 =?utf-8?B?L3J1WTZhcGdzdzArdXJMTVdtVU9kcXdDaWZacEplRVlsNU5uMXhtMTA3WmxD?=
 =?utf-8?B?eGFWbXROYytRd1kzUE5oRlpPcHZoa0wvU1M5WDJmbUcxMEFHdWtpdUJNZjh1?=
 =?utf-8?B?cjBzbzczVS9YUXhxUE1SN1NqWUhkclJnYXZQT2pCNnhZTGxKUC9XYkVuOTNw?=
 =?utf-8?B?MEVJSzlMY21XRkVZcnNvV1hKRHBZV3NoSThUSGRhLzU1bk5nSmR4ZmI2MnJF?=
 =?utf-8?B?RE5vaTZ2OXZid1pYblFvc25wcnBiR0pqWmRvdkRoM0JFUTFtbzVIeUYyZ2VO?=
 =?utf-8?B?NG1JNnVJV3YreFYxSHBQWEdkQlVkUitUQ3A4VkM2YTV5d1dEOWdaQ0phdVF3?=
 =?utf-8?B?dTk1VXQ1L2tCYTYxdXJJQ0tLYTErdFVWRlJ0TzErbjJYcjdWNGw2YmF6eDZo?=
 =?utf-8?B?ZXFySE9rWGorVWlCTS9rRnBId2RVVWlBQU8zUlNkRU0zOGpsNmhHelJ6RnZX?=
 =?utf-8?B?akpKb210a0ZPUmpJdFFwOEl5NVdkKzFDd1V2dDFlTWl1V2dpU0xja011bVlD?=
 =?utf-8?B?bU5uY2NmQ1d5UVBwQmVwTmlBekllZWhuanZ2S2grOWQreFhCZkNjYWxCbTg4?=
 =?utf-8?B?eWZEVUVuemhRNmhKaVdWQkV2blhUdlRlOXZSQTRzN1hOWUNkRHFUM25RVld2?=
 =?utf-8?B?cCtEd2lZNGI5SlpXdXdmbnpONDFqMkFWWEhtMy9uSzJlN3h2KzNndWxnMFZ0?=
 =?utf-8?B?ZlhWT2V4SDZ6R25GeXdEZTY3V0lvcTJtVVJOMEl6eFNReXZIYlhnMzhoZzJa?=
 =?utf-8?B?NmJlVWRDYUlLWVhuVmZXY0ticWtOd3h6MGRNRmpYV2dHYVZMM29DamNIb0RX?=
 =?utf-8?B?dXBHa0JKdm9STWtYbGE4VHJNYkswWm9JcElwaVZiSUdiVGx0SXozUFRwWmtl?=
 =?utf-8?B?NlVLRDVkTDVLNE9vWldiTnp2N2FiNnc1dGlKZHlHRmdBWVArUmV6MG1xTVhH?=
 =?utf-8?B?RXB6Zmw0REtHTjVBWXV5Ni80SDV6bHhWcGtDdjlIQ2xVUWFId2EzUng3OXF1?=
 =?utf-8?B?eGJTNjFaZWtuOUxTaytHcy9PNWRXV2F5d2YrdUVxT01JeklDalI5YWk5U05p?=
 =?utf-8?B?a2hZNWhGVlZoOElLaCtxU3c3dFNmSXlWWXFLdnJ2OU1uSVJTK3pvc00zNGNp?=
 =?utf-8?B?aS92S2UydzJobWN3SkwwUm0rS3lSZS9FdStBbm5IUkY3QUJHUVZQNU5QM2R6?=
 =?utf-8?B?RE1HYWJNYmhqQ2NYV1hoNWlmTFc3VVA2M0xzNmoyL0pFYmxKbm8ycTVHRWkx?=
 =?utf-8?B?VDE1YzZTdkFuT1RyYlRFcFZIWktzSTZMQzJBbkt4blRreS9UTHZLb3pMMHZS?=
 =?utf-8?B?bzBESVcvNHFnQVY4dmlua1pXaGd4emVzd0VRbHN6U2dpN1g5c3AvMW1qTGVO?=
 =?utf-8?B?RStLQkRrTndmT0Z1dlVOOHlESmdiazRLNS9BY2FlWXBaOHl4WkdmRGxJRVAw?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b6bb61-f668-4fcd-d7a6-08dda9ddfa54
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:21:41.0938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAhPwHyWqbWpATKNmxVHX8cFiRVsbJVl2z4fUCVc03WUgYGz7lQwzyGLw/DlM+7+3e5gUPvUyKkoR5FrcdNgvnlRJVyXb1/m7no02/IKByY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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

On 6/12/2025 11:05 AM, Lucas De Marchi wrote:
> Currently xe sets the guc log level to a verbose level since it's useful
> to debug hangs and general development. However the verbose level may
> already be too much and affect performance.
>
> Michal Mrozek did some tests with the L0 compute stack for submission
> latency with ULLS disabled. Below are the normalized numbers with log
> level 3 (the current default) as baseline for each test:
>
>                            Test \ Log Level                        3      0      1      2
>   ----------------------------------------------------------- ------ ------ ------ ------
>    BestWalkerNthCommandListSubmission(CmdListCount=2)           1.00   0.63   0.63   0.96
>    BestWalkerNthSubmission(KernelCount=2)                       1.00   0.62   0.63   0.96
>    BestWalkerNthSubmissionImmediate(KernelCount=2)              1.00   0.58   0.58   0.85
>    BestWalkerSubmission                                         1.00   0.62   0.62   0.96
>    BestWalkerSubmissionImmediate                                1.00   0.63   0.62   0.96
>    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=2)   1.00   0.58   0.58   0.86
>    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=4)   1.00   0.70   0.70   0.83
>    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=8)   1.00   0.53   0.52   0.78
>
> Log level 2 is the first "verbose level" for GuC, where the biggest
> difference happens. Keep log level 3 for CONFIG_DRM_XE_DEBUG, but switch
> to 1, i.e.  GUC_LOG_LEVEL_NON_VERBOSE, for "normal" builds.
Note that this performance is understood, although it was not realised 
quite how much of a hit it was on this benchmark. The impact comes from 
logging around context switches. The logging adds a few microseconds to 
the context switch time. In general, this is not noticeable as the 
context switch time is negligible compared to the runtime for the 
workload itself. However, I'm guessing from the name that this benchmark 
is specifically measuring context switch performance with empty 
workloads. Thus it is the pathological worst case scenario with regards 
to the impact of the logging.

Anyway, not logging in release builds is generally a good idea and 
better benchmark scores are always good :).

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_module.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 1c4dfafbcd0bc..4809afa7ce3f9 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -20,7 +20,7 @@
>   
>   struct xe_modparam xe_modparam = {
>   	.probe_display = true,
> -	.guc_log_level = 3,
> +	.guc_log_level = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? 3 : 1,
>   	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>   #ifdef CONFIG_PCI_IOV
>   	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>

