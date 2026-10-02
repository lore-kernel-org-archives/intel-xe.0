Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE6CA5FD4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 10:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955A910E42D;
	Fri,  2 Oct 2026 10:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKEbyIQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E91F10E42D
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 10:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790937639; x=1822473639;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Yz1d6EyXEYsKOVed5K1XDVfBqSICbdTiRI4H1HsUBm0=;
 b=AKEbyIQVc9mtyHtT1Ugh88PzgW3t+5R7shGYMhnmFq7NxRxQXa3ZH0XW
 xJxO+uxKaTiCcpqYlu09Mk3ajePp+6yhduJwTjTD19VdH8Lbbjrf6RaOg
 40seNAf+hjWQeDn03BsDnPHLJ6NzclzEHMhKNkBzDBa4ixcl4DBNhxAki
 qSu/oX8kChRvczvpotM0KwroHhJByJkjgpddKEqXIn6lZ1qtWPLugtBVf
 YdBJOg49YXyiv70N08VzBxOMM5TvxzMCQmdl3U54bMNpYRJkJ01iQjLw6
 Lnd0VvySY68lk1VkU1wsQkKacYzAQI4zBA5ujLcxY/3lU9pCaCpIuWapD g==;
X-CSE-ConnectionGUID: 5aoHrcWXSCaQOxvQhynrGQ==
X-CSE-MsgGUID: 9UY1qYKkTsqNvFfob0AV/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91722713"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="91722713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:40:39 -0700
X-CSE-ConnectionGUID: lLCDIcgVRnKa75bs0RuK3Q==
X-CSE-MsgGUID: 34Lu8SbgSPuEfGj8ZYUn3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="274312586"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:40:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:40:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 03:40:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:40:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oshp6I9d3dFhs2YOMXew8PxWJuMzYqfAWfNTK+m4OY54Mt7uQFjHXktmmroZ93Z9f2PbwjvW4h2Ib7dueNivt0scsVz5Ni/Th7HFyzOoXZBbcY/khDgrQBNq63LRviyssvNkgzFdghqR+8m6ELW/G9paL/mEzq4ycNIgVCDHOmggN44aBHQLwoJH5mE5Zhgqb7BBEdhMaK0nOkZzgr5686cMc3WLBUE21drm+sD2mNQSvXmfv/Xx1oJddTqhsrZXqYyhj1jS7NZkD5in0lC66EZkjfH0VuW/pSV9wzy9VvXaARx7A6ZBqhSECfLe2aiMyuuMZ1y6CM2Txq+yT+9Vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1i7EFrx/srbyYRL9gkYwp6OOctje/rPzkpZBUNpq58=;
 b=vvNmSU8HzwxJ/plPgiD7cpH2wQJ59AzFZObuPRgw7wCnlyZ6B2SFj7GkU9Kst33HzKmtWMT/U3CobOiV5RYd7/gKtztyoYu+xPd/+jvSrdLAXKumxfHNqSkd27PLRxoNqGCHvlWpyyF6bowttL0BlWGJpWrWy/MSrB/g68fiAQrH/sWsxjck/2Rwclly6SZJZLH3QijghoSEUsMEqLk1yzZSBdd6rgVtjw5J+dU7iYajFmwimEDaNSKbNN6LYEgSQkd+2bICPBo3IlFEBG9Z0/Hbwg0kgNI76vZ1+xamW5PXQDeT7/YkhwE/+HTVtpq+KFMaKZairIBK//1fZo4ERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:40:36 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 10:40:36 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v1 0/7] Introduce purpose-specific VRAM pools
Date: Fri, 2 Oct 2026 12:40:11 +0200
Message-ID: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0292.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 4579f77b-08a7-468c-888b-08df207197b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: Iehyjzy4AizpLIb6vDsGEKVlhqu7TQXPgLYtGlA3qY+sEq7MgN6VDTclnPt1kJCa1vTVGoWNMCsWi1kjiXRw21/S0pSC+u5/Z+OJ4gwuZLY4aT0lGyVJYpEsWBUhXa8tU0K2HELeFKV00+dnvpBsBAQuwH7SPrZEY2ljDViRsnAUUF4UjmTocTDrqkkdXaTRNagGkxx5OGb+SQ3SjprzwAYUOlpD8Rd8Ptqafxlk5ZaibZEoLB1yf1ahfHjGcIvjZoOXQhGXb+/97pFB95Xo+q9dDHERlWuN2D+b1I+epXbgnDCupUNNLfb7BfZX46YQjXmKc3TX/3bxEQHpT2iYNqUTaF48IA8/RsZwxJ+OFONiHoY8RnRkQn5FpjXdn96IhUfyl+ngNLRKx1cOVyC0bHY33UUhd3qWIPTWPlDFQWW4ACNNmMNRHA/hWj07o1lYYigfaQI6L1wUwTKniIjZS2wSdCB1Nsud3YpWoqV0jUqYCYRwzlu/MVTDn/WQ9z4IpayiCXcsmILhHFxPvlmY++k9WA674uPuZ/ikaR3Bo3TZU5UtH62qi7WN0EabdsCIInos5w9t79cmhFtr2NCbmyjvTbbAjPyOde1ZcpA2NzYs7WHPDbIHdiqkdpjMY6SQqgFRolONDUVnR8eaE1SI5sxhIb4vcxGwWGUiOU+vlcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTR3VytDb3RzckRxejQ5R1lWalRSZDA5bi9wQWdkWnFwUFc1TmFKU2VXWllm?=
 =?utf-8?B?UlBLeS9MTC9RQmtwNVlJMWI3R1I4UkxsWHpKakJORlUyVitIc2VQc0xiMXp0?=
 =?utf-8?B?OTBvWFpzd1R2R3pMSmw4WjRRMW5lUE9FeEFUZDRpNmx1ekcxMnBZLzdUVXZC?=
 =?utf-8?B?Nm1od0tXUzZDRUp1QU5lMk5XREM2Ylk1MHNwR3lmT1pqWGQ0MlZIU0dTMVRV?=
 =?utf-8?B?L2dLTlhFRitQdGpsSVdOTnpQRE9naDlkdWV0S1cyMk92ekZaaUlVZkd1Y3k0?=
 =?utf-8?B?Z21rUHpwQ1FUVTVIeGcyVjRRMmRuUGhRVW1hUitwdDRmTmp1LzVCMUdhcE5j?=
 =?utf-8?B?SzVLa0tjaldRc3gvelJSZkFYcGptblM5Q2Q3V2x6bjlUQWd4dy9UTUszRVZo?=
 =?utf-8?B?Y0d6ZXdIejFPdTdBcm5ldTQwblpCMkdFbVdFZk8rVEE2QkpvN1RJS2g0TG5C?=
 =?utf-8?B?VXh3cUJJTEZSWmNSS2hocnFNcVRmTXRtZHlzWG13SzBtc0pxVllGbkhSSmww?=
 =?utf-8?B?R09zY2lnUU1XYVBBcWFYbXB6b1hzVG5TcVVhSEUwZStzUlN3YVkwMkxaUjJG?=
 =?utf-8?B?a1dKL012WGpqWDZDTUMyY21kTkk4UURkS0p0L3BIQ3NsSWRsMVMwdzlvTTBy?=
 =?utf-8?B?S0hKajQzWVFlSlk0QmJMSlplZ0gxQytnOFFVOVc2c2ZaL09vNDgxRWJXTUZJ?=
 =?utf-8?B?NUFUc0RpVzlqMGxjc1dOc1p3NExDS1RTZVJUTzRiS211RXI3S2psbXFYMmJz?=
 =?utf-8?B?b3VhNHc3ZUVxVFEyMnpFZVNPV01IY1grcHNkOWsyUnNCaEZMQzlXU1ArRDFq?=
 =?utf-8?B?YWpka2p1WERsZFB6VHRxcVFkVUNoSEZMVGs3REV0NDhRQ3ppajhSNGtyMmpV?=
 =?utf-8?B?dUZpYUs1dUhLbkVsRE96dWpwMEZBY0xmYUV4cGZXNHYzOFFWQ0hrUWErZ2ZF?=
 =?utf-8?B?RFd5UjZlVXBsVmFPNXNqWG5xWVdtaGo4d1FLaTg0bERua3EzMTNpeU1yUnl1?=
 =?utf-8?B?V05qclhqL2xkUWRheDJmc1phQ2hrR05TS2h0MWU1aEN6bVFKMWluVnZVeUQ4?=
 =?utf-8?B?YnloVkdpeTNBR1E4VmU2ZXU0Y0o5U29Oc0dtZ0dkZG0xRXloeWU2K09sanNn?=
 =?utf-8?B?djQyVm1FUEtTVWxaVEpXWHpiUlJqMUJZM0tCekp2ZlN2UnU3dDFlQ2NYdGhY?=
 =?utf-8?B?VW4xWGtVR1NwOC9xVFE2aFBBcFkzb3V0bkEzdldjMGdRRStlSDBlKzMycm1Z?=
 =?utf-8?B?SEs5NmljMmpQd1dWQXFINUtVNy9Vam9hb1JMd3ExOUhvcmtXRDMzNzFDQ3NG?=
 =?utf-8?B?Zm9Cb0NTVGw1ZjhFUGRqNkFoNGZtRXhWV2JWWCsvZVFwTlhSVW5TclBFbmQ3?=
 =?utf-8?B?MzRVN2MyY0h2NHpMSFk3MlpKMEIyb2hKM1VPOW1EU2F2MGl2S1BwZUJlenM1?=
 =?utf-8?B?QStyZzJwcmRqRTJxRXBsRDdKQXVNZnlwaTNqeGFxME9PYjg2eWJVYUtyV0hU?=
 =?utf-8?B?UitnemVPQVZ3NWNlajVjWEVBMGFqTWUrOXUzT2tIcUN6d0g2d2I2VVhWLzFJ?=
 =?utf-8?B?RUpwY3U3WCtkY1lzV080TnFZYVduTEJ2Zk9yTmNLYU9ieWZ2Z1JBRW5tVXg0?=
 =?utf-8?B?Ni8xcFdXMWMva3NCNllRNGVFdXlickZ6RUFaZkw4OTBiNDZwRk80ZzdmSmVW?=
 =?utf-8?B?aUVBTjc2UVdhd2VNMCs5MnZLOU5EZW16bzRxMDhQYW5la2NVWVJzUG9CNFVr?=
 =?utf-8?B?TmRFZ3ZaQlU0b0RXT25YVlNTeWRlUE41bWZRdVJOalg2aXR3ZVRRT0dpL3cz?=
 =?utf-8?B?VHJKOGhLN2l2WkNlR2VabWZTR0lKTVBkRmx2bnJ1azRaQzFEenhpbHVpMGFT?=
 =?utf-8?B?TUhaU3UwN1hnNnRzeEpVOGdVanpCc0Y1Y25mbEVMSExOOXJCcEpwUEQ0VWI1?=
 =?utf-8?B?d2RhL1FGVS9VdEkydVFlVEtBb3duVklmeWNPTWpiZndPOEhpd2tlMzhyY0Uz?=
 =?utf-8?B?ZjdJVmJ2eXE4SUZnMG5QaElkeEloNnZBd253V3BhRVZDZXIzdDJ4TVdHQUNV?=
 =?utf-8?B?dVRVckhTRWZrNzl3cW5ySWhZRzRkSExWbzE3WGVXRFpNdDh0c2x1QVZyYm9v?=
 =?utf-8?B?cmRoS1p5U0NqVkZjWFVTckNrdmNmMTZHK3B5R3VpMWd1L3lXYmJIWkRreTZt?=
 =?utf-8?B?R3dnNXRONDkvU0N3OGdodXNsbWdoUDNRMEhNdFpKVGIzc1dGUWwyMllkQVVp?=
 =?utf-8?B?UmtWZ2tQaStuTGFvdjVVR29IRGdqRy9uU3RoUlEvYUN1Sjk2SHdpeUZkb2NI?=
 =?utf-8?B?OTgydXJIRDB4NXA5aUFDQTIveUlBOUZTb3Q5YWE1MVlHUWZERHJXV2hFS25M?=
 =?utf-8?Q?Rdm7PiUUBlSEw8io=3D?=
X-Exchange-RoutingPolicyChecked: Rs+aH/hMx1OdMepliCO21LaekDSyymnKMwFAqc9ZSmIHrmUbvfF/IWECAlps/KtPL4lmOoWDH1YJxkxqpK4EHBokDZZazdtNj1431d3ukjLNA2YCBY1VBBzmPpk3Jt2j6H9WZeD7zFQr9lrYUEXuwtctfdFsmWX4vW7fp0VeREldBgobfeGZ5AkMK6ZRisLvDA2aUldUxr3rJAaU3f9/Ws76aM6cNABOslK+uoljqCC0WfPN3ahd8r3OoxOj+ywXH23TWwySWQwJVvIu4nLd9wCJyaaOvVGg0mGGwOkmjUZMBu+erCKI6KlXlIZbhrj82hVzvlAo3WaG3CudDkEi5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4579f77b-08a7-468c-888b-08df207197b3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:40:36.0530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awpgyfwpNzitL++Ps6PvG2McjN6f3ySbljjYSjZO8hmezx39BOm49bf32mnjF2dnUEKrn60FybNVGmwngYNB+2AOQZD6x0+GVYpZ/IWBEts=
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

This series separates VRAM regions, which own physical resources, from
VRAM pools, which represent allocation domains within those regions.
A region can then be split into hard partitions for different purposes
without requiring each allocation path to manage the physical range
directly.

Each pool is backed by its own buddy allocator. BO creation and
migration resolve the pool for an allocation consistently, and pool
placement narrows caller-provided ranges while rejecting fixed placements
that do not intersect the pool. VRAM usage and CPU-visible memory
accounting are tracked per partition, and the PF reports free memory
from the pool backing VF LMEM.

The series introduces the partition and pool types, routes allocations
through pools, adds region splitting, and includes KUnit coverage for
manager partitioning, accounting, pool setup, splitting, and TTM
placement.

Normal initialization still uses one pool spanning each region’s usable
range, so the new abstraction does not yet change allocation policy.
The series also makes the VRAM manager handle lpfn == 0 according
to TTM’s unbounded-range semantics.

Cc: Matthew Brost <matthew.brost@intel.com>

Piotr Piórkowski (7):
  drm/xe: Define partitioned VRAM manager types
  drm/xe: Define VRAM regions and pools
  drm/xe/vram: Make VRAM pools the allocation handle
  drm/xe/ttm: Back each VRAM pool with its own buddy allocator
  drm/xe/vram: Allow splitting a region into pools
  drm/xe/kunit: Test partitioned VRAM manager
  drm/xe/kunit: Test VRAM pool allocation

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/display/xe_panic.c         |   4 +-
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   8 +-
 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c    | 147 +++++++
 drivers/gpu/drm/xe/tests/xe_vram.c            | 155 +++++++
 drivers/gpu/drm/xe/xe_assert.h                |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  86 ++--
 drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   2 +-
 drivers/gpu/drm/xe/xe_pagefault.c             |   2 +-
 drivers/gpu/drm/xe/xe_query.c                 |  27 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |  45 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  18 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  22 +-
 drivers/gpu/drm/xe/xe_tile.h                  |   6 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c          |   4 +-
 drivers/gpu/drm/xe/xe_tile_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 398 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |  54 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |  48 ++-
 drivers/gpu/drm/xe/xe_vram.c                  | 271 +++++++++++-
 drivers/gpu/drm/xe/xe_vram.h                  |  15 +-
 drivers/gpu/drm/xe/xe_vram_types.h            | 159 ++++++-
 29 files changed, 1272 insertions(+), 231 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

-- 
2.34.1

