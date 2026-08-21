Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C85C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 09:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3D10F2A7;
	Fri, 21 Aug 2026 09:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQXJADU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5395810F2A7
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787305588; x=1818841588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kRQaYOy5uEdLWJjlsBTpR9G4mrSUi/47lFMzFKdYZuI=;
 b=mQXJADU42QTqAcBS2fvxBmFykF2dCbbJMpZrzsGXJTmzxMXHvniBwpAH
 mFrm7IMOaBa6xpMBz5jS2v0N560hTtWeznqHildV+GFpQ2dIqQYiOaIZc
 LoK2lNpwCwZzZURUoh9LQ1GuU/WsX8R9OfI5XOwYDybNp+TJ0QdmpE8cd
 ehalVKGkLlBkrWneUpDAakzEFqO/E4jAYYxDiPz2dIXx3nNDZcIumFZBR
 eHovE2awyi26xbm+NQ+rUR5ZutLW61MpXXW3irdzhH7QtRxhZftz5SEMm
 bTEKPqK02vCkmhvYzLz7RoEkTTzP0+Xampj1J7FuwSBrcg4MPt1JERnpL w==;
X-CSE-ConnectionGUID: WZ8oCjhPSkmFjybYSAOF4w==
X-CSE-MsgGUID: 3Tp0CZYtSGyMDTXOtdtF0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="88055701"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="88055701"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:27 -0700
X-CSE-ConnectionGUID: Hfk7BAJbRtuExd2KndI06g==
X-CSE-MsgGUID: DQopISygRESH8+WWIxCWvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="262018389"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 02:46:25 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clsNQSyA8N5fwhC+HV1pHN5Ar/i0umDTuqgyAr57+EVXAqqhT0xN9R2xrszclHJda3IBNtFchJeihbxKQjXOBXENAMWNEpX4ilTlrO90yLABIgqoeZO9JuVlozONHL7tuEPJjhtHY7ZifkD/prNJkZiGCodbsOvoljPkGL90R382oWo6zZ67Q0nVCCXUoG/a6Lhm6VhADnoBMJjaxwq+YMQAdWV0RdyfKzbFgttEfV8OKNZjmIt8rzhcoVJ/2fvooD9257q4LSb0cFbQxGcrrl9blOz/HPn4/gSKIFsS1/rl/bRN1gmb+1/QhjtRt3SwQt9UY+qf5RvL1Re5Lvv0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Seh44cwJJtRMJ6MJDdx2D6fNtSXtkdlgDoJeGxWq904=;
 b=t11h0SlvRLED00w/mAmjESJAtaflqumO52gGEMr1LXcaWMRgOuJbFk0A+196z5m2iEkpqx1fbegVAzt1XRdpBUV0ziRXmEB5gG2dzSaY6g0k4lWMjctZT9/XX8QfvET4Lo6QO1wSGEBWwNGPhjfJnLRsc8Gv9lrIHajzC3ZzqaH049PVyuDC5fjlstRPLKTPExtwWVLHFdPXKhBf10y01DM5BNSU3DFnFoPEv4r9c/ZUcssglr36HSqtkTQSogOjzK5+XPxCvi0XPalzcaamUJHFQwxMlqColpbZFlxtPFqfu5TwTlx0utzXhRD1aYRaUUemL/yZjIPepg51cPmb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 09:46:23 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 09:46:22 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/4] drm/xe/ttm: Add PF-mem VRAM placement types for TTM
Date: Fri, 21 Aug 2026 11:45:59 +0200
Message-ID: <20260821094601.607060-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821094601.607060-1-piotr.piorkowski@intel.com>
References: <20260821094601.607060-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0016.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c31a40-4eb1-4c66-bef3-08deff690f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: p0HZlYxWaCOtEOJnFByL6QC1CgQpaXmykhQ3DP9rbSdrVefcsp1PwSKTKEuir9ZQE/Sbg+Kw+PtyqcKy+EdcE7BAxdNHhwAoYHgeTBonpOj7WJgPS2A6JEO4avUo/ZkU6lO5SkhtxQMsZFSPCs4hLtOHIr0o5GppKr/X6h92EJuc9tsHG6RnKcQzMiL42AHcYhaDTj0B4Ib3Kb3mrQ2wMVF88Z18ecvGi8/LaoRaoZPVnM/MEiImy3NTB4B0XnxnCbkaqxnz/pu/QcJupcrW+ymhkuUPHIdzdboTsapb73Saq996DuxoQ954KloobZaVjsWEYY7Ahb0hfiQG8ciqGVOV0kui4MJcNcjxVDn55dY2B6Xz23M0kztKken9nk9bvMKOZuQ8Oce5kRYwu9miKKYw11/giuJz6nWpoRU6bVY7P7tJSndQvYxPgINf7Vm70s311mbzOWTBEfxZ8iggdK4LHOr/oka38tp+r+OuKft3li4Vg3NWAaFWQilG0jA4EoEXCWAFx/WuKmg6fzdUpseGbLzujXyUlVYpl/UnyMIu4xZVcHWg0VulW2EC8LK92W9LFi079Gq5qpmXoaTk8lrhMc0iQYm9VPlJ7M83kqHLNa8QYVW8R8sq76CRmoc2f3bKnIJj24U157yYrQfftKc6PmJ9Ex6MsMCiBbYa2Us=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBkSXhlYm1waWJQZXFZakJKSWVadFEyYXYvbmcwekpNMCtWNGMvRTdoek96?=
 =?utf-8?B?Sks3UmNhaldIYVdibTlaRWdUV3BsUmI5emdQRGdMZHdXMzFJS1FuSmZ4ZENs?=
 =?utf-8?B?YnJjSS9wOWkvL1hzcFB3elhrVUFnZ3VpQ3ZmVGU1Rlk1bWFUd1RLN1RNaCtz?=
 =?utf-8?B?T3JCaUswL3JzeVdFTlZ3ZlY1Y29sdWNEUTdjelh1OTYvWWRETVhyVU5OOHpL?=
 =?utf-8?B?Y2w4blU4TVNYK1JGMGJkaVBuN1pVTThkUXhTTUJmTE5DTEJlUjlPazYwbEZB?=
 =?utf-8?B?WGdEVXBKVitwOTdzanZoUVFsd3JlWjQzOWovNDBLaWxwdWNCN2IyMGlQcFpz?=
 =?utf-8?B?emtPc3RlR2MrMnBTNWlDYjhwUWhuVXVscFFxcDFBc0NWajREakV0dmhMY25E?=
 =?utf-8?B?eE5QWW5NVE5EZEU4SzhBVU10WDgvTzczLzU5N0NhSU1lV05WTXRRUmYzSlpw?=
 =?utf-8?B?cHZENU1LS3VpenY5M2kzb2F0N1dQMHBGbXBJVlRKdlEyWlBYUWZjdU9uSjla?=
 =?utf-8?B?MEFMeXhwSS9ORzN3QW8rQyt1VG1VVlpoZkdTdDNXM1VlYkR2Y1l2VEFYa0xD?=
 =?utf-8?B?OE1YMEdZcEtJTkFhMDkzTk9xQ1UvUWZFelJUK1UxeWdpcUlLdmZPWFE2RnNh?=
 =?utf-8?B?VUt3V3ArekxvRnFwN3JRWUxvK2dHUEJjNFBzZ05rUHdWOHJBYXRTZytPWEp4?=
 =?utf-8?B?Vk9TbUlXWHpXRThHY3cvL2xBdDZ2UEIvQ3B6TU1UNmF1L3YrWW1rQ2J3aW4z?=
 =?utf-8?B?bDRyT04zb0x5TG9uSCtVQVVzaWQ5M3cya0NxWEkyNzgyYWZuZWpQek5RRkpv?=
 =?utf-8?B?Rk56dWV5ODFLWGxBS0pUREJEdGNrSWFVR0l1OTZWaStGTmhFTjhFYVBsNVJp?=
 =?utf-8?B?SjY5REhjQ1dPblJzdUVleW5hS3RjVlh0YjFNa3FoMHpraWhLQS9mNm9GYkF5?=
 =?utf-8?B?L3R3eTNBaDFqSG91ZXBYYlozVDRKdm1Ma1MzMUw1NHJyRlZlTkRCNnY1b0Mx?=
 =?utf-8?B?TWg0TXU5bjd6RUVLVkxMNVBSaDEyUG9KZnFDUHFxOUt3RHdQYU1CaUNOTnFS?=
 =?utf-8?B?Q3dXcFhNUWJLVC9yNElKL0I1aDdQRFJQTlE0LzVRd3VYTFREdUJ6NHU3SXha?=
 =?utf-8?B?bnFxNDZxaWJ1RzBSK05ydmc4VE9FakNoK1NUbW5GOFJzVGxEV20yQ3g3U24z?=
 =?utf-8?B?KzE3NFdRb3J5b2dZWi9idk1GbzNxcGtmc0JKZ2RIWXpTdGVHWmppY1hGTzhx?=
 =?utf-8?B?UUxabGRSbkN0K0VvWXlZd1Y1c3d1WmtkRnY1UjFnYXJMUU1wcE93YjExWHJN?=
 =?utf-8?B?R0R4cnVpL0hmZ3hSMUlxcWxBa1B3WC9kamt2dGp5WXZIQUpKaWhsMEdqMGhY?=
 =?utf-8?B?L3BzMkJ6ZE1ZN1g5OHZ0bEFyTXBTR0txTm9JbXdTK0U2K1F2N3B2d2svcWFz?=
 =?utf-8?B?YVZmckJQWHNWME5XQXFLemQwYnVMeUVCbEY4SCsvT3pPb0YzMXROUVlITllJ?=
 =?utf-8?B?QWVMNHNpcE5xSUtCcjk5eEo5ZVJGZ0tSdG5HNkM5cUlyZ0dzY3pKd2pQU1ZV?=
 =?utf-8?B?ZEllcXprUzhRNjlmWFRwYUdrbXRFOUxYRE5VSXFFeDRSeHQ5VFgvcThDelFK?=
 =?utf-8?B?R3ZrNHlDMDhsbFVDeHJsQkpyNTllenB4OCtncWRlNGIyd05ESkpTTmRZbWQ1?=
 =?utf-8?B?b1pRRGt6YithejRlSTdkSnFnWEZUN0s3dEhIRnovSyt5Zk4wYnNFYTFhT3hL?=
 =?utf-8?B?WkYzTEdPYU5GVmlKZzNycHUwYzJkdWZzaHA1SjZZZkFZMXZyVkcxVWRaRmdk?=
 =?utf-8?B?V3hrcDFTN3BEamR2bW5CQS93bkQxS2hDYnJMcnk2R2JDZ2NIYkIyQ2RDOUg5?=
 =?utf-8?B?VmE1ZzJKdjVMZ2Z0dmZiZEdxSGVtNzJ5Unc4cjlJbjhrb3hsajEwZ29NdGtF?=
 =?utf-8?B?d3JZdW01OUhRNXZVTU0ybDl3ZU9BWERKQjQ1bTVKUkVuM0NsUkc2MUJpTUE2?=
 =?utf-8?B?V0ZCRTFueWoxWUFLblpOdnpDNVgyeWttclBMWC9QYTVjT0tjaHAySE8yRXI5?=
 =?utf-8?B?OG96TGRDd3NHdE9palhCZlJHVmpEdVFCak95WnB5aTFMY1RuNCswRzI4NlpI?=
 =?utf-8?B?UjRTVUNwVjJYN0QrQjVMQmdRd2FHbkZwblVUd2kycEJvekpQZ3l4OGdSVFdz?=
 =?utf-8?B?QW5hN3JtMStvZkJKdVoyZFBobTdtVUJ3ejg0K1JzSU9ENS9OS0FqbnJJRlhP?=
 =?utf-8?B?M2d0ZWdFdjlpOVlGMDl4U3VicXNOQVNtMlN5alZ4b3poYmFFZWo3T3dId0pt?=
 =?utf-8?B?WEk5S0paY1pYTDFCL3ZHRDc5UHZ2MG1sdEQ1U0lCcWx2eDYrUmgvbXVyUlRC?=
 =?utf-8?Q?IB0P/YsDM1163o6o=3D?=
X-Exchange-RoutingPolicyChecked: OlLBf3U9uYzyFikQdIx9IaopfDJQcIXu+Ty1NjqjnZVSymx+rYAMHog0Ql+UITeh2K9POdTLJSjOFeMzCrt4So/v/aLWG97jA1/wnyvETFx4BgdRu5DB4VMs1cwAMRHPRmkdns/VHKfOYsLHwe+MtXAaOhTkLg1pJi7peSlPV4D5EFUWN9BpuU9tVO242JUlMZ7DxQA2ddR7AzcEwxKgWK2L7eUSWOWO4Vb6pIaO4ge2W00Npy7UFhTp8hhxhhGeYXgCz+vTnKcitS9v0zyhOiJfRqi6hUI5oIyWP+ZoKLuGlqFzCd2Fg+kM8DjD9k1IF4Xu99n+MUiVXyNfrD9IVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c31a40-4eb1-4c66-bef3-08deff690f67
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:46:22.9315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1mnEBbJlJZUzXuDdtFYLGdmvPHeqk2EBzhvdQhhG6uE2vQ6WQj+AyVqfkwsc1fShoEbasNt9qICtV8heQF2TOsIMtZBVQdKdp4plZ3U8Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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

PF-mem regions are dedicated to kernel-only pinned BOs. They are not
exposed to userspace and cannot be exported through dma-buf.

Add dedicated TTM placement types for PF-mem VRAM regions and update
the BO, resource iterator, power-management, and PCI removal paths to
recognize them. Since PF-mem cannot contain user memory, its placement
types are intentionally excluded from user BO eviction.

v2:
 - Modify commit message.
 - Add comments explaining why PF-mem is excluded from user BO eviction
   (Sashiko).
 - Resolve xe_ttm_vram_mgr_alloc_sgt() physical address via
   xe_map_resource_to_region() instead of the tile's
   VRAM region (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h           | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_evict.c     |  7 +++++--
 drivers/gpu/drm/xe/xe_pm.c           |  4 ++--
 drivers/gpu/drm/xe/xe_res_cursor.h   |  9 ++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  9 ++++-----
 6 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dde309821237..7b1a82e18faa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -46,6 +46,8 @@ const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_TT] = "gtt",
 	[XE_PL_VRAM0] = "vram0",
 	[XE_PL_VRAM1] = "vram1",
+	[XE_PL_VRAM0_PFMEM] = "vram0_pfmem",
+	[XE_PL_VRAM1_PFMEM] = "vram1_pfmem",
 	[XE_PL_STOLEN] = "stolen"
 };
 
@@ -166,11 +168,12 @@ static bool xe_bo_is_user(struct xe_bo *bo)
 static struct xe_migrate *
 mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 {
-	struct xe_tile *tile;
+	u8 tile_id;
 
 	xe_assert(xe, mem_type == XE_PL_STOLEN || mem_type_is_vram(mem_type));
-	tile = &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
-	return tile->migrate;
+	tile_id = mem_type == XE_PL_STOLEN ? 0 : xe_vram_pl_to_tile_id(xe, mem_type);
+
+	return xe->tiles[tile_id].migrate;
 }
 
 static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
@@ -360,6 +363,8 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	switch (tbo->resource->mem_type) {
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
 	case XE_PL_STOLEN:
 		*placement = tt_placement;
 		break;
@@ -639,7 +644,10 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 	case XE_PL_TT:
 		return 0;
 	case XE_PL_VRAM0:
-	case XE_PL_VRAM1: {
+	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
+	{
 		struct xe_vram_region *vram = xe_map_resource_to_region(mem);
 
 		if (!xe_ttm_resource_visible(xe, mem))
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e8081af5bfc1..c698f70a3b0c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -83,8 +83,13 @@
 #define XE_PL_TT		TTM_PL_TT
 #define XE_PL_VRAM0		TTM_PL_VRAM
 #define XE_PL_VRAM1		(XE_PL_VRAM0 + 1)
+#define XE_PL_VRAM0_PFMEM	(XE_PL_VRAM1 + 1)
+#define XE_PL_VRAM1_PFMEM	(XE_PL_VRAM0_PFMEM + 1)
 #define XE_PL_STOLEN		(TTM_NUM_MEM_TYPES - 1)
 
+#define xe_for_each_vram_pl(i) \
+	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1_PFMEM; i++)
+
 #define XE_BO_PROPS_INVALID	(-1)
 
 #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
@@ -614,4 +619,16 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
 	xe_bo_assert_held(bo);
 	return bo->ttm.resource->mem_type == mem_type;
 }
+
+static inline u8 xe_vram_pl_to_tile_id(struct xe_device *xe, u32 mem_type)
+{
+	xe_assert(xe, mem_type_is_vram(mem_type));
+
+	if (mem_type >= XE_PL_VRAM0 && mem_type <= XE_PL_VRAM1)
+		return mem_type - XE_PL_VRAM0;
+
+	xe_assert(xe, mem_type >= XE_PL_VRAM0_PFMEM && mem_type <= XE_PL_VRAM1_PFMEM);
+	return mem_type - XE_PL_VRAM0_PFMEM;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 7661fca7f278..a25ec6c750da 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -118,7 +118,10 @@ int xe_bo_evict_all_user(struct xe_device *xe)
 	u32 mem_type;
 	int ret;
 
-	/* User memory */
+	/*
+	 * Iterate over placements that can contain user memory. PF-mem placements
+	 * are excluded since they are reserved for pinned kernel BOs.
+	 */
 	for (mem_type = XE_PL_TT; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		struct ttm_resource_manager *man =
 			ttm_manager_type(bdev, mem_type);
@@ -303,7 +306,7 @@ void xe_bo_pci_dev_remove_all(struct xe_device *xe)
 	 * Move pagemap bos and exported dma-buf to system, and
 	 * purge everything else.
 	 */
-	for (mem_type = XE_PL_VRAM1; mem_type >= XE_PL_TT; --mem_type) {
+	for (mem_type = XE_PL_VRAM1_PFMEM; mem_type >= XE_PL_TT; --mem_type) {
 		struct ttm_resource_manager *man =
 			ttm_manager_type(&xe->ttm, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f517bf453b54..a4fe6a89d9dd 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -975,7 +975,7 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 	u32 vram_total_mb = 0;
 	int i;
 
-	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+	xe_for_each_vram_pl(i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man)
 			vram_total_mb += DIV_ROUND_UP_ULL(man->size, 1024 * 1024);
@@ -1012,7 +1012,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 		return;
 	}
 
-	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+	xe_for_each_vram_pl(i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
 			vram_used = ttm_resource_manager_usage(man);
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 0522caafd89d..4603a3356e53 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -111,7 +111,9 @@ static inline void xe_res_first(struct ttm_resource *res,
 		break;
 	}
 	case XE_PL_VRAM0:
-	case XE_PL_VRAM1: {
+	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM: {
 		struct gpu_buddy_block *block;
 		struct list_head *head, *next;
 		struct gpu_buddy *mm = xe_res_get_buddy(res);
@@ -303,6 +305,8 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		break;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM: {
 		start = size - cur->size;
 		block = cur->node;
 
@@ -322,6 +326,7 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 				cur->remaining);
 		cur->node = block;
 		break;
+	}
 	default:
 		return;
 	}
@@ -358,6 +363,8 @@ static inline bool xe_res_is_vram(const struct xe_res_cursor *cur)
 	case XE_PL_STOLEN:
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+	case XE_PL_VRAM0_PFMEM:
+	case XE_PL_VRAM1_PFMEM:
 		return true;
 	default:
 		break;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 05911904c1f9..bb28b493fd93 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -18,6 +18,7 @@
 #include "xe_pm.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram.h"
 #include "xe_vram_types.h"
 
 static inline struct gpu_buddy_block *
@@ -336,7 +337,6 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 {
 	struct ttm_resource_manager *man = &mgr->manager;
 	struct dmem_cgroup_region *cg;
-	const char *name;
 	int err;
 
 	man->func = &xe_ttm_vram_mgr_func;
@@ -365,8 +365,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	if (err)
 		return err;
 
-	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
-	cg = drmm_cgroup_register_region(&xe->drm, name,
+	cg = drmm_cgroup_register_region(&xe->drm, xe_mem_type_to_name[mem_type],
 					 &(struct dmem_cgroup_init){
 						.size = size,
 						.ops = &xe_ttm_vram_mgr_dmem_ops,
@@ -405,7 +404,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
 {
-	struct xe_tile *tile = &xe->tiles[res->mem_type - XE_PL_VRAM0];
+	struct xe_vram_region *vram = xe_map_resource_to_region(res);
 	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct xe_res_cursor cursor;
 	struct scatterlist *sg;
@@ -443,7 +442,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);
+		phys_addr_t phys = cursor.start + xe_vram_region_io_start(vram);
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
-- 
2.34.1

