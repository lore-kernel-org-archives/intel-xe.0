Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7D9CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E590010EC3B;
	Mon,  5 Oct 2026 09:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFNn89bh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E528610EC3B
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791192641; x=1822728641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Im+MOjnI/T9ScsZe4Ky5fspCBJS3vccOwJXUozHueOg=;
 b=bFNn89bhnwsBKo3Moy2fMswhYQPxvaqRqar6uZvWoVrwNWBeCnKtbTqY
 Z1CRDXr16SvSw25jwU9q/wEA4TTmbioZRLFhvB09LxIw+8O6HUg3bkkEs
 NgRyV3wglB/YoZuDiDGN/Bdb8ZV/uTkkIvpSXJhDgu4eAsrSUep6TUjuy
 9Fo47VgARCGF6Z52bcXRP0gNVbn9rymu/SY12oo1FlKCBdFNGPWbk8mGE
 S1ZU3ZqHZ+nRdV5997VaHpBF5UKv9CljzjQgDGjuEzgnHH/dPQOGOqap1
 DedSsqirFJNaIdviUZpIvXBGOb1YFj6opyCmyJF5Glat6+xgVoW2oWwcq A==;
X-CSE-ConnectionGUID: 7NrRPle2SUK6CaHIRs6WpA==
X-CSE-MsgGUID: KCujHfuPSROUZm56cgb0tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90915998"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90915998"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:30:40 -0700
X-CSE-ConnectionGUID: vQ6w7F2OQ+idoszCNs8eBA==
X-CSE-MsgGUID: 5pq6AoQ8Sp+/VB41RCf7vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="284852507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:30:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 02:30:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1AxgVkULjtJ2+9sja9iK1LJPcG/8nqp7HVtzILv/bpsvgmWaQvvS0Ip2qew0dg5yCi/FHOh+9RDihm/e7nVFIaMow2lC7pBUyggzWJ2H+nCpnMAMfHN7NWL6pxl72q2JCzWKZHyIIoyhJ6GJ2kjeUSG4dS4jjQ18VTyK0pdJqBzflMFhys8AKWcvOz21agKi8PpWZIfwUq9GbgJzsqsjiMeFX8qVxXpxvkN5oCTa9z4eWzN6gk+u/KnGhY894zFVdiaxvccKCp91set18659gFNc9MN9N6Iy3auhwJiRuZA47Uppd2aYp67r4UEMLLjLKDQNIhDloGDknYn9X1ZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDLvPqZUcV+TqS7Tq0uvInvjw61DZdPfjJNvDZe6lYU=;
 b=NSPlFzFiHBEeXEBDzi8KGnJgojgQ5cC9uF+GS+Lld2PQGEvlCDg4O/7326EUZ2x5d5eeEjel/WFq8NZ5uFYl8TPhcPnklIx6vSN/mdHVJhqq7XXY1Y9r8zF0kb2Uu8yei3AsH+mplk5497EcDkYAoHancM7R9JNujsxrsuKGqHKPiu95HnxnPyFoKlrD4LqPc34pWk6TqTD67Vh+1fM6VVfgAIEbsO9FzpORC6dlIALC9uMh4UNzxh5U5rcxe2XteoLl0G7OsHVdey89qwr9ScYQTjDi/XffoaSqpiJWZwhCM3CQ82sB19bjaDiXGArotZ2Fygs3rf4tXN1FEFqYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB662844.namprd11.prod.outlook.com (2603:10b6:806:538::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:30:37 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 09:30:37 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v2 1/7] drm/xe: Define partitioned VRAM manager types
Date: Mon, 5 Oct 2026 11:30:15 +0200
Message-ID: <20261005093021.3741599-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
References: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0025.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB662844:EE_
X-MS-Office365-Filtering-Correlation-Id: a21ca92d-e9f3-4fe3-92cd-08df22c35067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: a2eZEmhbiGgcVRLf/9d5hzPPl+ERg4eIiA6hpq51Xbja8oi/drT7Sl/yCz3X/MsfAlsXCHs67mn23pXLmpIkR3o+GRO/8HFMdXLhm6aoSUd/90GyOA0sUU4z1bYr894VLTa+BmIo6fiM8Ur/YiHvU9QZGf99gyf3MJoA0Fb/H/Mz0QpqA4AxJ1EJEKH2HqNy5HHIwoSlvCaBdJ6F6RZBkjk2CDZn/jwGFSrpK6QlV5Xsg3LRk/rn4qu0+A25MBoNKB02FeE7oDDxM57J6hKk8xQOiDVrtFAW/AaWPq9/DHLgytw2LNk2iFFceStDELe92I6kz8aTpcv1q0iSPS4JzERGFgb2qcSJbryQvhcoij5JMzKrPHPrbgz46gWP6sCHKWRg0QHqhkgFA0BGn07McYpK+ZM5yASMPQbrGH9xu544V+js+tDgM2POuubtERCzlmMx3GZ8W/iFMi93Xtm+AatdBpXDwlXNuXfHR6XAnlXNcNHuv09kptj4Rv/IOxwPkMQ6mewxcSHOd3vPOh7fY8q/T+MI5JI7JUL7MNOolyePrJlezomgM/PUn+uCuM9INMsHd2aNQxBykLtGy4j5WsL94ieFCoyh64B5EtAyL/ylOwYp3WVGjckKeuaMyDUq4+Jb6/ufJ6qFP9Oc+3J7s+030fhM2+JuqLpNtaUU3Sg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE9kZ0hQSVYxQ296eXM0dDZZL05HTUIyYTNURVFOUWhPbzlkNC93U0lLaENP?=
 =?utf-8?B?L3pDdHFxbWMrekxsMTVCdjdEclZIZmI5bjJLNXc1Z2ozY3AwaEZtZXRIM3li?=
 =?utf-8?B?WlBibVJyeEhmbm9yc096VFpCNUpocHNFN25qRnpPVnNKN1JSNW9yazNESEhI?=
 =?utf-8?B?cnBqTGlRcTd4MEJUS2Ftb0VWTUdraTcvaDk1QWlpMHFRMFZ4Y0U4Q1hmSjh2?=
 =?utf-8?B?cGoyam1DZHRiTFZSU1UzRmNtUjJPbHpmNmtKQ2ZwTlduK1hrRzJ0d0t2UDYy?=
 =?utf-8?B?UG5hb3h1V0VuNUdGUHBvWXRRNlR5VHdiUzh3dmJJUTRwZXNMZjI0czA4OUo3?=
 =?utf-8?B?U2pnbWZEZm9HNFhVNE15SHF3REZOenNaNTRRU01GNFBSUlp2a3hQMnduR3Bt?=
 =?utf-8?B?MzdDZTRkUnZKbk53NVlzdTh5alRDUk1SQ200cks2cEJhMy9Sd1psRkdZam5C?=
 =?utf-8?B?bEMwdi9BalNPYU9IREFIN3FzZHMrZyt6T1lzV08vaGNQY3B0cWtpMDJoV2hn?=
 =?utf-8?B?cll1TmdsakV1RjNTT0tQVG90eHRLeVovaktqT2Y2TTlvMm4xb0hPS1lDSzQw?=
 =?utf-8?B?THRhSTlUTU44ZnlkSXRGRzFyeXFuRVZSVlVRVVpLVkJKVDliQkJ0VTRaMWxa?=
 =?utf-8?B?V1JWcVNVaEhuK0owSGdqbklCTG82SHppZ21BL0tmb1JrakxUdTNFT014N1FE?=
 =?utf-8?B?aWJKUHlsOWJUei9mN2J1aDRrRUthNHlYSmg5L1lyQlhQNWdlYnBLZnl4YS9L?=
 =?utf-8?B?MWhXbExZNkYwQW1wRmpCVUZVekxTbmpLVlF2OEpTRjJOYlozOU91ZzRVWjMw?=
 =?utf-8?B?Z3Y4aE5tU1dHV0ZxMExQeE9JWDhMTGs0M21XazdwRXZYdkZpV3B1Tm8xc1l2?=
 =?utf-8?B?c1hZZHJvcWswZk9aTElibjVmYi9xRjQ1ckRjRS9PWFVaQnFncnpSaUZLNWlP?=
 =?utf-8?B?bHNKTXNtOEp3Qng3VC9NalM2WXVGTFd2NUdjV0xBSDBkVWl1OWQvVVp2RnVi?=
 =?utf-8?B?OUJGc2gyVmZoREQ1a1M2OTRpaEN3dUpIS1k4MGVwUUtoSzlqdGphdlc5WlFM?=
 =?utf-8?B?R3hNcmQxOGVkazZIdmVWRGxXbWwyZ280U3Q5U25kb1ppTzhWQ1lWSmVOWU9R?=
 =?utf-8?B?ZUJCM0VYeE1PSnJ4M1dHOUZVVXY4WXhQdFRDTGVrUUdmWmJkM2MxTkpxLzBk?=
 =?utf-8?B?SXNnWFg3cWVwRjhhbUF6YlAwa3JPdnBqNXJxSHVlUExISDRLMnhYTk1NZDlZ?=
 =?utf-8?B?bnlJSWU5RXZacSt0RFloRlJrK2VBak40RXAvWHN0Mi9VSVFjbFFHOGZLTS82?=
 =?utf-8?B?UUc4WFVwYkJVWU4vQlovYnd1T0NXRnU3eDNZMFNZMmp1Wk5OTXp2TEFtdDJC?=
 =?utf-8?B?TVdGSkRpL3pwSFYxR2Q0NnZNai9kSDk2UjQ2dzBsQzc5dHd2WlU5WHV0Vk03?=
 =?utf-8?B?L0krUWpZcE5YWU9GZkpXRGNtejZkMmRGYUlLTTZRbzQ2WFEyK3hFVkovcS9C?=
 =?utf-8?B?YVFzZ0pLNHhHMTRFQmNualA4Nk9QMkFWQjVFcG1oQ3BBUjZpWjJCWDJ5U0lk?=
 =?utf-8?B?a2hMZlZTN2dOdnZlbkI3QlFOQWp6dUw0TWFiQmhYUURiKzZ0T1YrN2l4SnEv?=
 =?utf-8?B?NExSZEU5U0ZmdUg2Q0hiOFpEbzh2cWJMbGVtMzFrcTRLcG1sT0oyN3BGWlFX?=
 =?utf-8?B?T1Q1Z1pFTUVKeit3NTZ5a2YycUdnLzJSaEM2VWRJS0kyNzdMcHQxbW9xNTRI?=
 =?utf-8?B?bHUwdW5NaEZCUTVMbVh1UldsdGNzNlpxZFREa1NHdlNsRHF6VGpIMzRrVW9n?=
 =?utf-8?B?NEswZmlBeTJyNlBzbzloL2oxeDdLOW5XRzd1ZWx2SmJHR1d1RzY2VmZrQ2dZ?=
 =?utf-8?B?OWFhTlY4WHJ2YzVoYUl0T1JWeWE1MnppSTMwY3JvRWxac05uNEJJbUpiRjZE?=
 =?utf-8?B?aGFTV1VwN0VEVmdXWHY5SXBESVRid0FyNWhOeFA1b0dacmpUbVJmYllSa0Rp?=
 =?utf-8?B?ZFZSQnB1OEV1TkxaSDRUL1lFUmU0UWFvZ2w2R3k1Y2ZLT0VTQm1IUWJEbGNo?=
 =?utf-8?B?OHo5Snl6K2EvcGw4MzFISzJndy9YdzgzSGNCbzhoeHNNZHFzZDdJOU1Mc1hT?=
 =?utf-8?B?NlNQNjFBUEJJR21CNlpBOHFhQlIrN3ZwOEF5YzlMTWVXd1BsRFI1K2JJN2Jw?=
 =?utf-8?B?TmxyRkhVeDNOSzEvWFJTOWw3ZytLNkFnb2lmSmRtcVl2ZWpBazNrSzhMbUxY?=
 =?utf-8?B?UXhkK0ZYVjJXMzJ4NWoxV3ZrMHVWNDhjTlM5YlQ3RUllQncxejljVGViZVJU?=
 =?utf-8?B?b0dHci9DbUZLZWZRODM3dENHUFBKQnVKN0FGVXl2aUo5QWthVHlUUGJHQW1O?=
 =?utf-8?Q?mq1oj7FDCHd4VJxI=3D?=
X-Exchange-RoutingPolicyChecked: Xr247ABaMpY1G0vgHYN/tPSxksQOX71O+U2855LW27VehCM2wBw5q163TIFE7/2TFzn3UNtN5zmVx/YA4sOyXv8Mccm0Q3eVGc+smh/QpOZeWccnD9RUwMVQal3pxkEVbp3wypZzspmcQHg0sRcWHpEBhm1wK6KN2TSqrGOagRhXawJnLMt8K8Ks/SQGkBpmr0VLmbe2F2P67ret+raKeYbuEEStaF47tMsJ32TziG+kPIHyPiFcq/EqqG0QHCBsb35QH7gswjsljR35vgj4+6TExjtqTbJPUrWfImKi/ob24dkXpuYOReomZJ2N4fJT/7ehH+HJF2Dp9tvdxWBgaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a21ca92d-e9f3-4fe3-92cd-08df22c35067
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:30:37.5494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlxq8oW0zK4aqO0P6RYHC63sjxMw5kS8IkDOlqboLF6t3IR1oNPe7wRjLYwMaoI12P80c6YazLhnZBS4foyo2OXJh2+rXQe0oNBllCNEkas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB662844
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

A VRAM region may need to be split into hard partitions, e.g. to keep
kernel allocations in a dedicated low range of VRAM. Expressing such a
split purely as a placement range would turn every VRAM allocation into
a %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy algorithm for
what is really a hard, statically known split.

Describe the types needed to manage each partition with a buddy
allocator of its own instead. struct xe_ttm_vram_mgr_part ties a buddy
allocator to the VRAM pool it backs, the manager holds up to
XE_TTM_VRAM_MGR_MAX_PARTS of them, and resources and offlined pages
record the partition their blocks were allocated from, as buddy offsets
become partition relative.

Each partition also tracks the CPU visible memory allocated from it, so
that usage can be reported per pool purpose, and the alignment a
partition base must honour is defined next to the partition itself.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index efcf3e1d4e80c..6af179b2b95b5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -7,8 +7,46 @@
 #define _XE_TTM_VRAM_MGR_TYPES_H_
 
 #include <linux/gpu_buddy.h>
+#include <linux/sizes.h>
 #include <drm/ttm/ttm_device.h>
 
+struct xe_vram_pool;
+
+/**
+ * struct xe_ttm_vram_mgr_part - Partition of a VRAM region
+ *
+ * A VRAM region may be split into disjoint partitions, each managed by its
+ * own buddy allocator. An allocation belongs to exactly one partition and
+ * cannot span partition boundaries. This lets the manager allocate directly
+ * from the requested partition without resorting to
+ * %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy allocation
+ * algorithm.
+ */
+struct xe_ttm_vram_mgr_part {
+	/**
+	 * @pool: VRAM pool backed by this partition
+	 *
+	 * Once the manager is initialized, pool->part points back here.
+	 */
+	struct xe_vram_pool *pool;
+	/** @mm: DRM buddy allocator which manages this partition */
+	struct gpu_buddy mm;
+	/** @used_visible: CPU visible bytes allocated from this partition */
+	u64 used_visible;
+};
+
+/** XE_TTM_VRAM_MGR_MAX_PARTS - Max partitions of a single VRAM region */
+#define XE_TTM_VRAM_MGR_MAX_PARTS	2
+
+/**
+ * XE_TTM_VRAM_MGR_PART_ALIGN - Required alignment of a partition base
+ *
+ * Buddy offsets are partition relative, so a partition base has to be
+ * aligned to the largest VRAM page size in regular use, otherwise an aligned
+ * buddy allocation is not aligned in the region.
+ */
+#define XE_TTM_VRAM_MGR_PART_ALIGN	SZ_2M
+
 /**
  * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
  *
@@ -19,6 +57,10 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct gpu_buddy mm;
+	/** @parts: Partitions this VRAM region is split into */
+	struct xe_ttm_vram_mgr_part parts[XE_TTM_VRAM_MGR_MAX_PARTS];
+	/** @num_parts: Number of initialized entries in @parts */
+	unsigned int num_parts;
 	/** @offlined_pages: List of offlined pages */
 	struct list_head offlined_pages;
 	/** @n_offlined_pages: Number of offlined pages */
@@ -49,6 +91,8 @@ struct xe_ttm_vram_mgr_resource {
 	struct ttm_resource base;
 	/** @blocks: list of DRM buddy blocks */
 	struct list_head blocks;
+	/** @part: Partition owning @blocks, set on successful allocation */
+	struct xe_ttm_vram_mgr_part *part;
 	/** @used_visible_size: How many CPU visible bytes this resource is using */
 	u64 used_visible_size;
 	/** @flags: flags associated with the resource */
@@ -75,6 +119,8 @@ struct xe_ttm_vram_offline_resource {
 	struct list_head queued_link;
 	/** @blocks: Buddy blocks reserved for this page */
 	struct list_head blocks;
+	/** @part: Partition owning @blocks, set on successful reservation */
+	struct xe_ttm_vram_mgr_part *part;
 	/** @used_visible_size: CPU-visible bytes consumed */
 	u64 used_visible_size;
 	/** @addr: Faulty DPA reported by HW */
-- 
2.34.1

