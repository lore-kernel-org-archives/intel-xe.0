Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14437CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 18:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB2910E9A5;
	Thu,  6 Nov 2025 18:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0y0xdNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3097A10E9A5
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 18:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762452874; x=1793988874;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tP3odo6C5Vi1rXl+e0wE9uU+MZDmvim8D51OdAmgQTM=;
 b=A0y0xdNHGvjdI4HERbjrujt+brmzvBmSiotLBHUt4O0hyUXSZcuot6sW
 xt4JfGMI2zqtLSNXKuogSUZaoES3bE7mjwoaZ7QM42zrsyhViBXO3l2XA
 olzJNFuqKFzqm6qB1qv4kmy22RBHAKrdhQapjMwIIAMbaJrg8bUyN5B+R
 n6r+hwJdtgx5ytzHKZ0bDjpApoZF7095V9YBPUts3uhST7HLnXt/bAd0U
 qSSBRWHvkQlFxfo11IPVqoGrMmPQ6PDaJggk+lCfU6TaOi+CwbsSfvf5H
 wg1na0IWIedpd3wZ9gaeQoYi23oaguhrWzQFQQMe1fIkSJnjacih9Dmpu A==;
X-CSE-ConnectionGUID: 1TXBaHxvQ2mxp2wn5ijqnw==
X-CSE-MsgGUID: SuAB9gPtSDWZelpGFa1//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="90071536"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="90071536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 10:14:33 -0800
X-CSE-ConnectionGUID: DF5uZUoSRDKQWgmDC4zJFg==
X-CSE-MsgGUID: LOeJE2i9RdSeXjrHZgENcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="192187225"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 10:14:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 10:14:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 10:14:33 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 10:14:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xk8i6CdQIShnERWDJG1lY8buTvXFOIvHf2DIp3QPGPGnvBR2WJMixXkysCx4xUT594pRSiI7rJwhMtDmSqzSo67ynOx01C7v1zTdqX2NWZYNjoLmYJtoPgLDKsc4XrjwIRSpINwESg3I3WxWFrEmHZ2FhKTAUtr22Htpn2Cy9MAHpMq9Ta2RC3vh2jljVdCdn3AhLrLkpX2vpHSD9zBYUPeG4Iq9o7GiRy7kbu9x1cAAZwzfG06FqFQvWV5MauCA409rWB/GgfCaHYFrFdcNXb8STFYwFWwcLqAdZj6KLrSlc/ztXzBwfdH5qsr0vfNwFgSJwMQghetQY+masqKnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YPZj6kBKYh5TKlSIpV4V+mwFL6PrhdHv+1J+rVeXVo=;
 b=LFVLPxDlMhxl40vib0k8NcOvv8Vffr6x2vF1rVLJYS1wfuWLmc+1rjfatlH3ZVNLT91l+JguwvP4qkZ2P1WMmbD558HhNq72j+6zhpfKc3xHzMrxGLNQrzsOTK01dqXoBACCVcpeldIs+hb3popt1+dIpxv8SeaeSfkSIngy0eVgfj558tubKMNsXKd66JCdbD2TAZTx/vqwBSEeSgs6N49yJinrpWCZX8Qdkd+9JlUp0ets03bgrnFUu2+XPFpyk0HslVAgrwHE5bXe3izs7UUYJYD31+fWPwAy5dEdMgisERr4sKA/oW5vxx0mO198gtdrzrYXaEsK327DsR+9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 18:14:31 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 18:14:30 +0000
Message-ID: <0351a69e-3888-4104-9592-371935c41d3a@intel.com>
Date: Thu, 6 Nov 2025 13:14:27 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Cleanup_GuC_log_buffer_macros_and_helpers_=28rev5=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251105233143.1168759-1-zhanjun.dong@intel.com>
 <176244526797.25862.2302160472021861018@10055242dc62>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <176244526797.25862.2302160472021861018@10055242dc62>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:303:8c::12) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 830c7932-ece5-421a-c54b-08de1d605477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDkxYnpiWlFpV01IcE5rUHZoTXVzekpXaW1Va3k0QWZhYjE3czNDbnJuei9y?=
 =?utf-8?B?cW9HSTcyRjluWDNpUURUamlqZEhwVXU3SGo0K3g4RVFZT1R0cWM2Tnk4b2RK?=
 =?utf-8?B?aERIMXQ3SFQrMGtZSE05TGxpZmVYYk90YmIvVUFKQ0FYQnFvUnlHTWVYQUY5?=
 =?utf-8?B?SHpGR3c3dzhOVkJaaGViTnN1VE9HNXlCMFNsbTdQaUNoWEtHdE50VkFOMXd2?=
 =?utf-8?B?NEl2WEw0YjMvZ1MwaW1kRFIzbWZDNERGSWJrdEdvLzNaR0VISVBlTVlBdzJW?=
 =?utf-8?B?L1JlZDJ5TEgrMVJEWVBuTmhqK1NHOG5YWWt0U1RpeTJ6WDFHU1JsbWE1SzhL?=
 =?utf-8?B?QWpJL2RTdUIxSnRnRU43cVZqckZnV0FQaXUrTCtsbVB5bVB2b2JYMldiZU9u?=
 =?utf-8?B?dURmMDhncmRvR01lUEduMjBPQmd3N3hYbTVoMDVtRDN0NStjNjlWeWZVMGNS?=
 =?utf-8?B?eHBjcDFaYUZXUS9oUHZyZ0ExYzUvdEVYSjQrWnNTVE9kczFHZnRIS2k4V1ov?=
 =?utf-8?B?YVh4d21jWkw0b3YwVlRlSmhXdjZwcEt6SzdwSjB5L2NMQTJjY0JRdkJkNytM?=
 =?utf-8?B?ZnAvVXhoNG0xTGQ2TTJTVDNWaG9TazNWZ2c4OS96V1E4UnBMSlZ4RExib1Nq?=
 =?utf-8?B?Ym9NdFNES2Z1UE9jR2F6TlZXd0R0U1pueUZUSWlBY1lXdEFQU3NveWVTS1Zz?=
 =?utf-8?B?S21yeTB4dEhqRmp5VC92K052L21BUkM3RHIyNGZCdTkzaEVocFlaejVibVRx?=
 =?utf-8?B?NGtncFBaNUgvU2Yvd2NKVDJrNWRSdFY0U1NSQy9FTVY1cU9qSVV1K0VlZjdW?=
 =?utf-8?B?QnRpck9GNmpyOS9EQndYREw1bkpkU2pxajJ2UmpnNlk4czRlWUppdUlaTE1Q?=
 =?utf-8?B?WFFHN213bGNBWWJMdUdqMGZhaEFqMkl0OW9JV0ZXMXRpaGFHUFdoWDBWMld3?=
 =?utf-8?B?VzdRckJEdlhueE5BTHRndHh6WTUwdU40ZCs1TTJtZTZlNzlsT0tqaEc2d05K?=
 =?utf-8?B?b2ducHVaQmZVemc3VlBoSmZKaWpLdk9vOVVDZkxXV25kczE0Z2JPL0wwWGRq?=
 =?utf-8?B?V1ZDZHNKVXJSV0JOQ0NaTTQxVVh0NWZWSVhBUFlHaE1PY1RoU2l5c0pqeUx5?=
 =?utf-8?B?ZEQyVFZtVTB3dFNVRllUd1UxWC85RTF6Z3NMVlNqZlZkd1JJaEM2VnZnMTk1?=
 =?utf-8?B?QnNnNVg5VGFWK3Zrb1dqaGxhcVA4ZVYzMFJyOEZGZThvS2N4bHJ5cHZKMXBC?=
 =?utf-8?B?c3VDK1grTTNoMGt3QkdRcEdFVExRWEh2akVDL0tqUndRa2o0Y0FWOHNaTk9G?=
 =?utf-8?B?SlR2eGJPK0lpc1BwSVBhQzRFdGpsUGdBM05hSGEvUGFiSmw0Q0N1eXVMVVBU?=
 =?utf-8?B?SVVYR1RrRnRhdDljaWZNYmVKNG5hSzdhZzgyeEJuczhTa1dEdkFUako5TU1I?=
 =?utf-8?B?QzNqcmhaRnduODVxZ2kyZW5yZUlaZ1lPMkxnc2xIcCs1SHFFMVJPMWsrd0NJ?=
 =?utf-8?B?MW1DcTJuWWpDNE9STUhvT1FYaDlZRTZHQ3FlVU9oNWhDeEJQUlhQb1ROdS83?=
 =?utf-8?B?ZkdaZkpiWGJMQjZKM0JvREd3RWhNUlJRNWJIT2MrRU1LdXo3UjFSck1qSDhp?=
 =?utf-8?B?RDluOEZtSHlBQlJiUE5XWUFoSHc1dElIZkc2akt1UGlKOHl2U1k1em5wbTNE?=
 =?utf-8?B?cU1PM09EenNNSnZTTzl1bzhZVEwvR2dmL2FUZ2VuNThQcy9IMDZITm5Hdm11?=
 =?utf-8?B?aGZRdmdWa2JEem1JS1lweEwwbzFOWUVLVlpKNkNNemh4WHdTaGVVOGk3OUh3?=
 =?utf-8?B?T1hyd0txNk1uYXRXTlNqTWFDUytFWW1zRDlvaHdYTWJVUzV6Wnh4TU5taEJo?=
 =?utf-8?B?MmU0UllseVJ2aGNMLzhTVGJxbGNidkd1bU1RK1VqVTQxUlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1d3ZWtHcHlmZVpmWGFKWk1XeFZVb3pkeGFrZWF6akRpKzdjU1M2ek9XYjdD?=
 =?utf-8?B?L2h6Ym5JcW1zVm13NzJ3UU9wUzdHZm5hQkZaQmZPdmlQcURmQkJTRzRGWXBO?=
 =?utf-8?B?ajB5SVk2ZndJRjhuUGhFZlhLSDFoWkJtUHV6OCtvRVUwUmhMK096cUdvcmE1?=
 =?utf-8?B?d0t5YjJzR1FXQ0hLT1ZKb2JwcTJhL01laXEwKzIxbVVOR1oya1k5NEFnVTdh?=
 =?utf-8?B?OG4rNitXYmxwaHdlOWZ4OTBiRHBhSGUyLy9tNzNuZ0VNLzFQQVIweS9IclNP?=
 =?utf-8?B?WjA5MVlpRFVBR1Jibk1OeDZZbW9xOWRIRy9KdURueE4zZnNaU2U2dWNWZ2Vx?=
 =?utf-8?B?TEdUenMrYzVHV3oySXEvV3hjR29wVDZ3b0tsVGo2bktqVjM5K2svcmx3ZkZa?=
 =?utf-8?B?dUUvTU16NkJLR2ZRYlp6SGFDUWlON3NtV1dZVzA0cStFa1UzQ3lXb0o4R1Ux?=
 =?utf-8?B?YVRpcW1ORXFGUHVoNG9BL1U3eVZhQS9nUVRwMnlXVFBjVVlrV1l5c1d5V2Jz?=
 =?utf-8?B?cGk1b21ybmRINmhoSllJRlhLL1hBZm9MRWpOZVZ3TFp6dFRVWTNHUmsrSkhH?=
 =?utf-8?B?MjE4dGdzVTVRY0ZMbEI3VmM4MmJEWEFSMVkvaC9VWXFVbStzdXVVb2FFbkZw?=
 =?utf-8?B?aitHUjhBWUZXdmo3WXExWUNUZ2Ivbk5FNS9XbjNwVzJicW9sb29jVzJXUnJ5?=
 =?utf-8?B?dFUvc3ZIKzE3QzlMQ1NKd3lJZm82bmhsYVl6VStzaVJaVFRMR3hnc3N5amdT?=
 =?utf-8?B?OXBGbVJoZFpTbUt2Z3FaUThtQTlQcjZTSG5MNm1HRVYwVnZYRjZCREhJdXZP?=
 =?utf-8?B?UVQ4MmY0TnZrc3pHQjdpZFhXUGRkMDMzK29nTU9zeTNiOEZma2U4VVdpVVNm?=
 =?utf-8?B?V3NEZUFRMVVjaHVPY0tHWlFkWUV3M1FYV2R5U0VnSVNsNkM0THhkL0xYa1li?=
 =?utf-8?B?Vnpod2JHZ0ErTXhWNDFVVGM2bWlSaTVZcjJGcHo5UTZwb0lISytndU4wcXNl?=
 =?utf-8?B?N2YyaHFmTXlxK0NxSUsxSXgyQlFuNXFnb2lVTkxwSlhoRmZTdEhnTnZLOEls?=
 =?utf-8?B?Qlk4T0k1SnRrNnlkZkpOVjRHZEdlSU42aVhBYlFZQndlcEJmZVA4RmcwTjVJ?=
 =?utf-8?B?Y2JPejFyN2M0bE5WSjdkUjRwZDRhcFFqKzh5T2dBMkpjM1RWNW1yYWd5TkFR?=
 =?utf-8?B?WDlTYmt2UHhvNmdWSzhSLzFNK1Fkd1U4WWhySkJCbDZudmV2SDQ3azQzTHFT?=
 =?utf-8?B?OHg3S3p0ZkNHZkpnMWpmZlVZbmdGK3FDWUZJQjJVYTZySjM5OEcxbWNPdTNm?=
 =?utf-8?B?UHRjVXhnUzZ6V0pWdHVPU3BUeGJVOVplMzZFREtjc044MHV2SGJIbGs1UFVW?=
 =?utf-8?B?SCtENXdyRThzLzlZOGFXRkY3U2VpR3RuN1k5TGRxVzJoK2pjbk1CblIyY1lZ?=
 =?utf-8?B?bUtMaWpmQ0hlWmRBOHZjWFBsaHloczBqNGVGL2QwUVpxT0JpTzVHRnVpYUJD?=
 =?utf-8?B?TUFDRU0rNnJxM2dtSjc5anJFWTJPQjU1VFpQaS9VVXZkck0veVNvTUVlVTNa?=
 =?utf-8?B?RnNVS3VkZUxZMWZjUlZNL210cm9SczNJUWlBdll5MVhqNlZBSncvTm5Hb005?=
 =?utf-8?B?dU0wOWpFZTRsbXVvK0UwM0lHZS9nRlA4bDNXU3Fya2lNRFU5cXEzaXdJY3Rj?=
 =?utf-8?B?MmJMN2ZtckdSR3VQaXFIVjJDYnprWjg2WWU2R1FDckdVY3VMaXhGdll1OW9L?=
 =?utf-8?B?eXJlNUR3VkFiTlk4TTFQY2RFNkMxNTc0TCtPN0p5TVZmUWVPYm5sUWJYblNC?=
 =?utf-8?B?VDdzRlV5U0ZQVEwwZXA2QldCd3JvdzNIR2VFYjdFc1pycFBsTU1Edy9rc0Ru?=
 =?utf-8?B?ZlF4ME5oaUI0OEdhMnFoMWtMK0Qyb0trZ1JmSEpJN3dobTRtMHlTRlVaL2Y0?=
 =?utf-8?B?OStFVkJlZWJHV2ZQektJZFhMZnJOSGVaTXREbkFLODhTUEFVeDZoMkFLVFZi?=
 =?utf-8?B?VDJwYkF4K2R4SWl6dURvS0NPQjM3WWVFb3diTXN3L09OM05pVDJ6Q3ByQTR1?=
 =?utf-8?B?Y2xJYzRYczFaanUxYTlzZ1Q0NE5UemY2Y0JzblV4KzBHR1E0M3ZhV0o3aUNq?=
 =?utf-8?B?Q09idGFxY2hlazlCTDlZc3JEUVpXQk96NkpqYWJYelFyaGxhM2c4ZTlPWmpL?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 830c7932-ece5-421a-c54b-08de1d605477
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 18:14:30.6926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDcmnVmrLAn0HtcadnFSwVZxxOv3ZFcE0g8KnA5/RoZnJ7kg0e2FyatMMUQXDDI5F7kYYb6QIjmovyLxcI/Bgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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



On 2025-11-06 11:07 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Cleanup GuC log buffer macros and helpers (rev5)
> *URL:*	https://patchwork.freedesktop.org/series/155338/ <https:// 
> patchwork.freedesktop.org/series/155338/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/ 
> index.html>
> 
> 
>   CI Bug Log - changes from xe-4053-
>   b68b360d3df2b2f221a6b2395911630bc9749512_FULL -> xe-pw-155338v5_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-155338v5_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-155338v5_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-155338v5_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_pmu@engine-activity-suspend:
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-dg2-466/
>         igt@xe_pmu@engine-activity-suspend.html>
This incomplete test is not related to this patch.

Regards,
Zhanjun Dong

> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-155338v5_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@intel_hwmon@hwmon-write:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/igt@intel_hwmon@hwmon-
>         write.html> (Intel XE#4665 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4665>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/
>         igt@kms_atomic_transition@plane-all-modeset-transition-internal-
>         panels.html> (Intel XE#2370 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2370>)
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@kms_big_fb@4-
>         tiled-64bpp-rotate-90.html> (Intel XE#2327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@y-tiled-16bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-435/igt@kms_big_fb@y-
>         tiled-16bpp-rotate-90.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@kms_big_fb@y-
>         tiled-32bpp-rotate-90.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-435/igt@kms_big_fb@y-
>         tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/619>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-7/
>         igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-155338v5/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/igt@kms_bw@connected-linear-
>         tiling-3-displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/igt@kms_bw@linear-
>         tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-433/igt@kms_ccs@crc-
>         primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +34 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-mtl-mc-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-2/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-435/igt@kms_ccs@crc-
>         sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +9 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@kms_ccs@missing-ccs-
>         buffer-y-tiled-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-
>         a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4345> / Intel XE#6168 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6168>) +1 other test incomplete
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-dg2-436/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-
>         a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/igt@kms_cdclk@plane-
>         scaling@pipe-b-dp-4.html> (Intel XE#4416 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4416>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-466/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-cmp-planes-random:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/
>         igt@kms_chamelium_frames@hdmi-cmp-planes-random.html> (Intel
>         XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2252>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-466/
>         igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6
>         other tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-2/
>         igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) +1 other test fail
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-435/
>         igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@srm@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-433/
>         igt@kms_content_protection@srm@pipe-a-dp-4.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/
>         igt@kms_content_protection@type1.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-466/
>         igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@kms_cursor_crc@cursor-
>         offscreen-max-size.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@kms_cursor_crc@cursor-
>         sliding-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-1/
>         igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-
>         atomic.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-155338v5/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-
>         modeset-vs-cursor-atomic.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +4 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-5/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> (Intel
>         XE#4633 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>)
>   *
> 
>     igt@kms_cursor_legacy@single-move:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-dg2-463/
>         igt@kms_cursor_legacy@single-move.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-dg2-432/
>         igt@kms_cursor_legacy@single-move.html> (Intel XE#6363 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6363>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@kms_dp_linktrain_fallback@dsc-fallback.html> (Intel XE#4331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331>)
>   *
> 
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-464/
>         igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html>
>         (Intel XE#4422 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4422>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-8/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/
>         shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#3149 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3149> / Intel
>         XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3321>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-2/
>         igt@kms_flip@2x-nonexisting-fb.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-bmg-6/
>         igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +7 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-lnl-4/
>         igt@kms_flip@flip-vs-expired-vblank@b-edp1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-rmfb:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-adlp-1/
>         igt@kms_flip@flip-vs-rmfb.html> -> DMESG-WARN <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-adlp-8/
>         igt@kms_flip@flip-vs-rmfb.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543> / Intel
>         XE#5208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208>)
>   *
> 
>     igt@kms_flip@flip-vs-rmfb@b-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-adlp-1/
>         igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         adlp-8/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html> (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +5
>         other tests dmesg-warn
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +2
>         other tests skip
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-adlp-9/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-
>         y.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-155338v5/shard-adlp-3/igt@kms_flip_tiling@flip-change-
>         tiling@pipe-d-hdmi-a-1-x-to-y.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-
>         blt.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6312>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5390>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-rte:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbc-1p-rte.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-rte.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-
>         wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +17 other tests skip
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-2/
>         igt@kms_hdr@static-toggle-suspend.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-bmg-6/
>         igt@kms_hdr@static-toggle-suspend.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-433/igt@kms_joiner@basic-
>         force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>) +1 other test
>         skip
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-464/
>         igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel
>         XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>   *
> 
>     igt@kms_panel_fitting@atomic-fastset:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@kms_panel_fitting@atomic-fastset.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +7
>         other tests skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-4:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-2/
>         igt@kms_plane_multiple@2x-tiling-4.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-4.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_pm_dc@dc5-retention-flops:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/igt@kms_pm_dc@dc5-retention-
>         flops.html> (Intel XE#3309 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3309>)
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/igt@kms_psr2_sf@pr-
>         cursor-plane-move-continuous-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-
>         plane-move-continuous-exceed-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-435/igt@kms_psr@fbc-psr-
>         sprite-render.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +9 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@kms_psr@fbc-psr2-
>         primary-blt.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850>) +2 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#2939 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-466/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html> (Intel
>         XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#2330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1127>) +1 other test skip
>   *
> 
>     igt@kms_sharpness_filter@filter-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/
>         igt@kms_sharpness_filter@filter-suspend.html> (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +1
>         other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-464/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1500>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_eudebug@basic-vm-access-parameters:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/igt@xe_eudebug@basic-
>         vm-access-parameters.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/igt@xe_eudebug@basic-vm-
>         bind-metadata-discovery.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3 other
>         tests skip
>   *
> 
>     igt@xe_eudebug_sriov@deny-eudebug:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@xe_eudebug_sriov@deny-
>         eudebug.html> (Intel XE#5793 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5793>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-4/
>         igt@xe_evict@evict-mixed-many-threads-small.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel
>         XE#6321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-null.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-433/
>         igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +18 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@once-large-mmap-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/
>         igt@xe_exec_system_allocator@once-large-mmap-huge-nomemset.html>
>         (Intel XE#4943 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4943>) +5 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-
>     prefetch-shared:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-
>         prefetch-shared.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +182 other
>         tests skip
>   *
> 
>     igt@xe_oa@mmio-triggered-reports-read:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/igt@xe_oa@mmio-
>         triggered-reports-read.html> (Intel XE#6032 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6032>)
>   *
> 
>     igt@xe_oa@non-zero-reason:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/igt@xe_oa@non-zero-
>         reason.html> (Intel XE#3573 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3573>)
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/igt@xe_pat@pat-index-
>         xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-lnl-3/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_copy0.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-lnl-1/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_copy0.html> (Intel XE#6251 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +2 other
>         tests fail
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-464/igt@xe_pxp@pxp-stale-
>         bo-exec-post-suspend.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1 other test
>         skip
>   *
> 
>     igt@xe_pxp@pxp-stale-queue-post-termination-irq:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-
>         post-termination-irq.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>   *
> 
>     igt@xe_query@multigpu-query-config:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-4/igt@xe_query@multigpu-query-
>         config.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/
>         igt@xe_query@multigpu-query-invalid-extension.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_sriov_scheduling@nonpreempt-engine-resets:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-435/
>         igt@xe_sriov_scheduling@nonpreempt-engine-resets.html> (Intel
>         XE#4351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351>)
>   *
> 
>     igt@xe_sriov_vram@vf-access-after-resize-up:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-dg2-434/igt@xe_sriov_vram@vf-
>         access-after-resize-up.html> (Intel XE#6318 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6318>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-adlp-8/
>         igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-
>         hdmi-a-1.html> (Intel XE#3908 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3908>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-adlp-2/
>         igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-
>         hdmi-a-1.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3862 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3862>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-155338v5/shard-dg2-464/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-dg2-mc-ccs.html>
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-
>         d-hdmi-a-6.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-dg2-464/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-
>         hdmi-a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#6168 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6168>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-155338v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
>         varying-size.html> +2 other tests pass
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/
>         shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>   *
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_flip@2x-modeset-vs-vblank-race.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/
>         shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html> +6
>         other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-panning-interruptible:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         adlp-1/igt@kms_flip@flip-vs-panning-interruptible.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#4173 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4173> / Intel XE#5208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5208>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html>
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         bmg-2/igt@kms_hdr@static-swap.html>
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_joiner@invalid-modeset-force-big-joiner.html> (Intel
>         XE#3012 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3012>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-155338v5/shard-bmg-2/igt@kms_joiner@invalid-modeset-
>         force-big-joiner.html> +1 other test pass
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-none.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/
>         shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html>
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-
>         rotation@pipe-a.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-155338v5/shard-adlp-3/igt@kms_plane_scaling@plane-
>         downscale-factor-0-75-with-rotation@pipe-a.html> +9 other tests pass
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         bmg-7/igt@kms_vrr@negative-basic.html>
>   *
> 
>     igt@xe_pm@s2idle-d3hot-basic-exec:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         adlp-9/igt@xe_pm@s2idle-d3hot-basic-exec.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173> / Intel XE#4504 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4504>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-adlp-9/
>         igt@xe_pm@s2idle-d3hot-basic-exec.html>
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-90@engine-
>     drm_xe_engine_class_video_enhance0:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-lnl-3/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_video_enhance0.html> (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/
>         shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_video_enhance0.html> +1 other test pass
>   *
> 
>     igt@xe_pmu@fn-engine-activity-load:
> 
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-adlp-9/
>         igt@xe_pmu@fn-engine-activity-load.html> (Intel XE#5213
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213> /
>         Intel XE#6421 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6421>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-155338v5/shard-adlp-9/igt@xe_pmu@fn-engine-activity-
>         load.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html>
>         (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-adlp-9/igt@kms_async_flips@async-
>         flip-suspend-resume.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173> / Intel XE#4543 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4543>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#4345 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4345> / Intel
>         XE#6168 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6168>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-dg2-436/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#4212 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4212> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4345> / Intel XE#4522 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_content_protection@legacy.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-
>         bmg-7/igt@kms_content_protection@legacy.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) +14 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#5390 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5390>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-155338v5/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5390>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-155338v5/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-155338v5/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +14 other tests skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-y:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-bmg-6/
>         igt@kms_plane_multiple@2x-tiling-y.html> (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/
>         shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html> (Intel
>         XE#5021 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-dg2-463/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v5/
>         shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1729>)
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512/shard-
>         dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html>
>         (Intel XE#4842 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4842>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-155338v5/shard-dg2-466/igt@xe_exec_basic@multigpu-once-
>         basic-defer-bind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
> 
> 
>     Build changes
> 
>   * Linux: xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512 -> xe-
>     pw-155338v5
> 
> IGT_8608: 42ea0108ec47e4a00aed97d6f98e5339847c7331 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4053-b68b360d3df2b2f221a6b2395911630bc9749512: 
> b68b360d3df2b2f221a6b2395911630bc9749512
> xe-pw-155338v5: 155338v5
> 

