Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08ADCA5FD4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 10:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4110E478;
	Fri,  2 Oct 2026 10:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJ9SK0TU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1499310E478
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790937648; x=1822473648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Im+MOjnI/T9ScsZe4Ky5fspCBJS3vccOwJXUozHueOg=;
 b=aJ9SK0TUSuln34qL8UHYnw5Ye+2WiD6e2mB7p2rC7D1EeqyH8nC8P0dc
 8IthYqLRUtxBXoQFrzgrCupV3VLnygA78XEDWqwLlzIXGrUYvLt2kZ9ZJ
 BeZf+QrLX831yDuotBF41aITZGOnd0fA+Kip5DLgxcPtuvH6KcfFa3d7D
 tqVJBluQss59IIHPYjPnU2zJhLYkJfanDv2ko/zHTdVHORvJVXdiDlxh0
 bQOiLCVKlOxrMeuVHmCu7lJbhlbg/6nWJPPyYDB2e0CjWPdqGalIfJ/jU
 KifeIhzmN3X2ghhm8U5UGX40//TG8Z69ULDWM5tM+frr2gx0hrmQAvWHk g==;
X-CSE-ConnectionGUID: mJTndXLiQdWxhLcaDROavg==
X-CSE-MsgGUID: WF606Kw9RKmjmfdieMCslQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90733228"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90733228"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:40:47 -0700
X-CSE-ConnectionGUID: zP1HW+O5RgSisME+aXpp/Q==
X-CSE-MsgGUID: beV3sEqxSo+YzWv62n/wtQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:40:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:40:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 03:40:47 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:40:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3lKJ32uS8iRM9yzS4gaWZv16XnglytVQgJPxst4aVvo/6oteXZRnYYpUQUffcBFG1+Swnlg3lK0CraOWhMtIK/mXJ1iZKBTvW2o4c2YGH5GJq0l7wLxGMRxs4mf/VqFNqLbjpDj6zQt5ZLHj4xcuVeuduvsyzfQhi7tA8IYRhzKRPs2E+uRyQpZ2iaKTYmjayAYKlLuOoopaoMjh8aiAIJTRQu8LSurX5s/nnd6AB+ScvBUlP0utWGfqb7dUxUabBqsLrTg9CRG70vftNgmH5Y9SLpjtIkYoEdz3DbyAGCwEN/nvupspqtzqrccfaZf8edotPD/FcO7Xft56XsTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDLvPqZUcV+TqS7Tq0uvInvjw61DZdPfjJNvDZe6lYU=;
 b=pwBj753ascAVKR6kW1J3NmrbP8cNtcMwIAxZq2XUUHXcK4A4N2ZfPLEY2swJj7ZXpSE17zz6JjLcXnGH16ioJEfW4qYBzDgl3xxy1HLkW/sMepVtlKjnvs6T1qtqN7OunJKeWK1q6POxQKvba0mhMRRO8uE4GWOGcv/FIB2tTAru8S5k+wrLu+cAMcTgFNEyjNGsX/Dr6l4ydTe3WOX4HuKOs0164qeroC0wwUfPa5KkV7YquICJEcKIaUzZDGpU1qBCv6ipp5QmQBnlnJTL5cd6fwqAKRhVFGY07LgvQgzupc8/6VGLucLGMYLQ17wqN1+WXpLn1pDoOj8mvzvYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:40:40 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 10:40:40 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v1 1/7] drm/xe: Define partitioned VRAM manager types
Date: Fri, 2 Oct 2026 12:40:12 +0200
Message-ID: <20261002104018.3648425-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
References: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::24) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: c488970f-ec8f-4e1f-03cb-08df207199f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: BSyYwhcgBdppn2O8ifbzXthGHnFveiOCK5hQyd7ps/uwKalZXK2TFULcuSKzZQFKHMQ3dgYeB10UvMt56BVtiBQh8ANkhgfxgNPrkU+9/8AEbg/8IGOlZYT664tReyiudq2z6SDZl3+5Sjh5VXYAh+L8GLdv+o6kSOqCby60NWpeXco9j0IoIsNuULADcfmwtNfzPkpdY8uqSNg0Xp0E1wOdYbBf9Q8tlBhiGaPn/J2KzFdx6qhpZZTsEkihl5EY71Tsvjw7KWZ3eA3d6liyCkIodCPxJ5hsrSG4VwCtmplW/WtZroBmghc9B7A1f4XFOp562bnXYYZfve7UUP6lRqyYrEUwTa0embx1m+1v+9XsuzcgDdfSbv7ozo0PY5YZ4AEkLRYwTo4m6jTAfShLEdeeILOvFhHdAoosVri3wMt//CJxwaWnnFFyw7d3R3s88yHOMADfyaacudlGpTSQ7ZOXLIhk0PmzZollrdHr3Xn2mdFF5Thzi3cGwv2KpXW2ZUfLyPF7G4xQp7YqiPIHSuNgTR8rdxQpFOWuRF3WX3Mj9+puzBPMzTabX4/GeY39UsH9jwdUMvrcu5gcbbLWafO7yuyork0UVKBFkUcGuBeGFxhNvH7faXdlkSOh8ZhZMnw4pNY6J/eb7qp33u/N3rL+fHTd7/QJRrDHn153xIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlR3MW0xOFloREZSVERaUHFTUkF6YXhrd3hmVmRDaitWV0VPTnIzYno2b2Vw?=
 =?utf-8?B?VWVhbkJCT0NVWlplTWhUQjdLekFJM1NndE15TFR2aVBVenVQdVhVRDI5UXc2?=
 =?utf-8?B?dkdPbzVnNG9nR21LdnMvN3RMZjVIWEdpcTQ3UlAzckQyRFdVcThIRmtVak8w?=
 =?utf-8?B?L1VSbDVlWnVoOXFWK0tsdzZuYTZhOWFwMGU1SENQcHNZTHNYM3ZSV2hhZ3JW?=
 =?utf-8?B?S0tQZDJRYWhpY2RoSmFjRlJCVjdPekVPblgvVjBvS1RLV3ZHcGM1TjJjbDFV?=
 =?utf-8?B?QTZNVzZVUDhIRVl2Q213RTRmdlVOM3VtKzRQcmZwc0tRQWVQUVRKaUJmSm1q?=
 =?utf-8?B?K3M2RGhSOGZ5eEV5UWorVndQdDVjcm5xaXV5eGJvajF4NC95YUUxZjU0cWJF?=
 =?utf-8?B?Snhud1RZQ2VQeUlWSnV6SE9RWlN0cHNabmNRc2hlRy9oZVVmbkl4bUV5cFRn?=
 =?utf-8?B?MzZ3R053Y1NQRmgyOFhGbVVXTlRBaDk1T1dzZjZtQzEvU2FhbHdCMlJuek1G?=
 =?utf-8?B?UFBLTWdiK082Y29URm1xUDFscC96VGNkaWJGenZvaU1lOG1HY1BNSXpsY3k0?=
 =?utf-8?B?WlNJZjdoZU9jVFh4ZDUyOVJsT1Q4Y0E0K0lDOXEwOTRxR2UzVG01NFdwN2N6?=
 =?utf-8?B?a25kL3A0RjR6eHR3Mmc4TE5Ec3R2bXluT2RXNzFsS3huOGlLYUpWdHZvYnlR?=
 =?utf-8?B?Z3NaT01LQWx6T1pGWDZoSjFJek4rcloyWUlqMVlsUnBENVh2WnFJTWRXdCtN?=
 =?utf-8?B?TlVuc09IYmlLU2FMcE9NNWZsaFhMazBLN25VODdwUURhRXpYUjRWZjF3TjFv?=
 =?utf-8?B?RUppMGprbzRtL2svdWQ1VGg2dlduSzNRb3EwbWZkMmJxcmpXNVRMT29qOUlw?=
 =?utf-8?B?Z3FwbUdhU0toMDZwMnlNWFprU0NNMlEwK1FnR3hObE9Hc2JwcUVrZE14RXdr?=
 =?utf-8?B?Ti9paCtXTlk4NVZjYWl6VXZQS0thblFjNEJPUXNLamZKNjB6UURDeWVpWXgx?=
 =?utf-8?B?N1FoYXNqNXlKYlMvUXlpSldnSms2WHR0eU16VTNaYXFQenlRY3BFYzNTMHp4?=
 =?utf-8?B?NHcyS1VsdGV6K3dUZnNUaXVCZ3NNOGJMc0RWb3pHb0FvK1BISUJkZXM0ZjZP?=
 =?utf-8?B?TnN5K1dvM3ZlaGZuVVI1WVMxb1FvL0dCQ0l6V2xFYk5CRmlWa040aVdQdmZD?=
 =?utf-8?B?NkEwN3ZwTHY1QkQzMjUvNFZERDlMVTBpaTdsQzRueVcySmxWL0FIV1RmbGJT?=
 =?utf-8?B?eEFWNlZlUkFLOGxpZkhZRDNzbXh2RHNJS1QxZ3RKeG1mYmdZR3NYU1JDYlBG?=
 =?utf-8?B?SjJEM1U2NTI0cmJkVGVLWmo4RTl1M2UzU2tLanZLekNRNEt3KzVrRlR3Q0pM?=
 =?utf-8?B?eTFzMUM3ZnNtN1ZucHBndVErSGhKeWhIMytnSXRNekJvU0VBd1RDcUoxZFlI?=
 =?utf-8?B?dS9KVzVmRkZoTlRsTHJFZkRkNUtsVyt0YmQ2QnYxZzlHUkFqam93bGNBa2RZ?=
 =?utf-8?B?ZFhqRTRRRm5wYyt0NWh0VE1jUzFFd1ZIYys2bjZSVG9UVk1yc3BwcnVKc3RL?=
 =?utf-8?B?OEpLb21iZHNvWE5nbEJiUzBpRERja3Q5M0E1ck5tTjE1WkRLQmRFWDVPU0ow?=
 =?utf-8?B?bXVUaXVvOUNaUGtGSktjOUw0cHJIMmlYWFZic1BrKzhuSTVMUm1tWkZSVUhC?=
 =?utf-8?B?cE1tTTdGZXM0WitaTFRkUjI2QThOL3lDMkFFMGF2NXNtSHVCejVRdGdsaFAw?=
 =?utf-8?B?bGhNcnAxQ1VmK2ZaNWdHendmZFozN05wOFZ0dUdHRTV1MUg0WDdmVHN5MDBz?=
 =?utf-8?B?ajhQbVFBNnlsc1lseExhMjBGVk9IbnJlRGR3YWFyUlk3TXlKWENLd1NqZnMr?=
 =?utf-8?B?NHZlZzIyQzRaV2FzSmpUZ0paUWRoN3pnNVFVYm5RNkhGSWNER012NmlETDJn?=
 =?utf-8?B?T0NoRE40L2pQRzJSVndEU1IzWGJmM2RqMGl0QUQrNUZaWU14TDNvRzhqaERU?=
 =?utf-8?B?RG91aVp5b1QycVdSTmRHSU1sT1lzS29Ga0JUSWE4SHdPYmxZelJJeS9EMHlN?=
 =?utf-8?B?TlRENlptNzg4WnpSYU9pV1pHdjFLMGoyODBOZ1hrMnljNnZEa3N3NmlqdzNt?=
 =?utf-8?B?bFhtYWR3N0dReHFnZlpiL1o5ZkZDMTQ4VHdVQ2p5Z1M2a2JNbndDaVcvNStH?=
 =?utf-8?B?dVMwTUVnRUN2RGFpTldTallqd2dTT2ZmL2VHS2hQU0orakk3MTJrUjljZEgv?=
 =?utf-8?B?MlpxU0JJNG5JdFlvWVU1OVVLdEVpcFZkaVNPd0dORVBsRDFmNUVCTzZ3TVBD?=
 =?utf-8?B?blVIbEZQVW80c2c3czFQcjcrREt6QU5zaWFCNDlVM3RkdERVSVZEMzBUMkRl?=
 =?utf-8?Q?0qvHvEvjNuSPsOPU=3D?=
X-Exchange-RoutingPolicyChecked: 3TFogkhHEhcGEyzUekTQGIt5/fgKFM7ExZR2pF50X/DMUIg9IT971NzD1Hxy6fBznLyx3uiwNl1XhztX+og1pAR+OALvkhXzUWq08tw9A8dvEp6bzd3eS0pT2GbiGaEhpISHOYO1u2lwfitKDd0IljvxqqLHy8pX3b5SptTuJqYRdDqkaZ9jzFFEUh7IQ5/dlbs0TPzohN/GQG1EhtrK8jbJ2yw9N2p23yIbqaudPn29rbES3Gs0P38mIGAGMnEYUX0oVd6c702Q1+BRXnRzBb4T+RTJqHC1JEFBML40ZKV8LfXkvhBxRnoVEbAcXYva6rbPjN6B254bDIkYn++2oQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c488970f-ec8f-4e1f-03cb-08df207199f4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:40:40.0048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JD5h89TVoiAlHKPznZs9akwZJqaCrM80wpGK6vxnSFqdpVsJW/jwtAaLaPu1H36wx7MmocInpGl+T4doYsGrUyK83Ve0uyywCCvYQvADFoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9577
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

