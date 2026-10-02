Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12410CA5FC4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 10:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F7310E478;
	Fri,  2 Oct 2026 10:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjkO1PFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F10E10E478
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790937662; x=1822473662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SXNjFbzlGVq2qwrAPN8qC8MNqe+K15phRchm50VSPEU=;
 b=MjkO1PFYm6Px3FrpP+efhFgGuSGPg7u5w5P6RXGSiyJVDxGA4DBStk69
 M/c3HH7jtthATsd+fGTsMrXFcWK2sQv92oQkeMpKLAFAql4cB1Hecet4C
 3nAai590p5fN5HdbfVYSJDjjyNQDH9or7xxByaakx2UDUzJrEHofxNrOl
 fv4dVYUDwxXJQJHZ89v1GCgAeuDgn3V30dioAcZN4nw8LpxQ2XDVJObe/
 m+bQ5ZxM6rDAvzs4PVDs+30wOX+uDvrf7xQbn3cuK7oHG/DstsnGd6WiB
 iQN/ypKYwFoKkNInOuJkhyVwdE8uQW/1nIV+7BPSKXibqN/z5Sbu3S6eK A==;
X-CSE-ConnectionGUID: VLahOKp7QCijVXbTBYV87w==
X-CSE-MsgGUID: aPu5ADkIQz6XBvGGK9Q7Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91722726"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="91722726"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:41:01 -0700
X-CSE-ConnectionGUID: hXik8c9HSmy8zKZ7OkcKTQ==
X-CSE-MsgGUID: X9Xyw1zYQJSGWOIFlgSxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="274312605"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:41:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:41:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 03:41:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xcw9EbE54he2G1eXmiJq1GSXcCt+5zUT4rwRrNcLacG3SQPSsbUGFK/yBnRThC2WkZYrL948CJMIRhO1LaV13e+tAsNZe/9AXTwtbiP+qu0tLvozp+ODFZFyACIXjPiGNtkLMhKeZwaDkESt7tH9BNgD2KAZIeFaIx/Gv39TYb8/21V4wWkmHFUamu3gc8CByMDOFRjU1Xr9v+Iif2B+2ujwr89L5C3uVlj3WD/993mYy5Y8gZMHGNUsyLDpjUV6I1B6PX1diWjcaWbWtxdz0ZK73r91sl6hP3YuSSy794kmH4W73kRbsDfobSV7TAa87tn69vjX6vNhYJAZS/hhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9npg5UlhjQo9KU1Znt4fJw4ufooQ05sf1Y/HcUjaAHA=;
 b=rxcQz6sldJjlTxRqK68w4IA9Z0gHw5N38UuXWeaLKEvqI3bVTkPSpJKFF+kYn4+TYNGbi2wt/p+1X8IlV+6XKm/lHJm05LDLlkc44f82L/i/S/QiDa7Qm51lS21276ezS/UUBS/PI0KdiTblwtbUBJ+zl4xk35lSLXPfJnYfij6r1nHZKGPZwIBdiU0GI71s+Zml789mltdPc6GECSGKnCwZmbjV6LGscXCb3W/Kp+wSe9kUZqFaOY3hCJKuXPavg7QGPl+CidKUfvZtrdROG1rLWtYUNWHhSOE6rq0tS20YkUdeoOLmOZeCAvzVeiOzspNFJE88NxdnOuT1rjDSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:40:59 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 10:40:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 6/7] drm/xe/kunit: Test partitioned VRAM manager
Date: Fri, 2 Oct 2026 12:40:17 +0200
Message-ID: <20261002104018.3648425-7-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
References: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0292.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::27) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: e5568b31-b465-4994-c90a-08df2071a59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: W04JWkldIdKiovIBOlt618vUwwxXqEqUrX5wcqI/foyxGOD56c8zJAuIBIFcL1kiXaKsaCTEienTCycMEVQLXGIT9w6zcSIB6xzGKBQBqfRHeJLOkxh1LkwKr+b0oqPpbj1q3/cLpfYHtSKWUPeXJxATyv6BFKkTo07HBGUK1YJeSOINvxU9xp3As6rgsY8LhjMX793uKjomk6inCrEV7nT4JYHVZc/tjgQ0sHySlqrLSt12ATJL8gngTBAZ5pvrV1m/mQvn9RRgdQNirYzsj14n9N7yIguznVWWrAIc0urC/wQQmiCDQ/P6V8keQRenSXP59KB0w+le/rdOkDWnJKqJ+rYli0nGTBsYFDkurvgqSt4ie/Wt9GAzBBhXeu7HliNOIJIzfPMHa5GxJJNHI5SCkyReddbiwKrPhMZhTWcsPp1ngRIl0bnaTVu67psbAVqB9etwhpkh4c6AEpWGt01R9pRsZOyKB61H/hf5jZtPYYQjB4iBQyiPyp2r3bDLAOcDG+68Q8Lbgoy+48MjUbLDccJCfcLJjQ22ov0b7LXTIZvxchjIf2K9KQg0Fi8wgMkv9jLczj7h9tca5UNKTiHcUCQ9Iwv5kqrFF0dw9au5c+NHqUiMpfSKZK+oeOVT4qijQgjjCbZegCEQCqpsiswYX9R98VyOK//ZnsBTWp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVZEUWJvUVVXSk01TzRhTE10S2dWSFBjUmoyK2NGazN2VGtGRTdyVUlqL2t5?=
 =?utf-8?B?VjR6QWtCL2RDYWZjQnlDdzM1ODl2dW56QThrNWpyV0tVUWpjRnBnZjA2eE0v?=
 =?utf-8?B?Q1J5YUErUWdjSldnRFZuOEl1cVZtNUg1d0x5NnB1TmZXZUVwOGR6TmJzUUdp?=
 =?utf-8?B?dVNWVFNFQ0k2M3J3c05WNVJhOWY2dWp1NlhRRHVPNlhJNjhCVHVrcEJ0VkIw?=
 =?utf-8?B?aWhOK0tnRllMTjZaUFlCYUhrZkJwMStWL08rODFFNVUyNFdEbTIvdTBqVnJa?=
 =?utf-8?B?OThEU05FUXZUQ1kxSk0xTzFGekRLeUt3WkFuWndvSVB1TUxmZlJGR0txWm9Q?=
 =?utf-8?B?a3NpTFdGVnMzM211cERRdkhCbjcxRHFkQUFCa3R6bmFxRU5tWS9CdS9vQzY5?=
 =?utf-8?B?eFV1ZmZieUFCNUNMQmpSdTVGbHJ0ZlJrWGtWblhxUzdvWXlVUjNpVS90Q253?=
 =?utf-8?B?KzNnOUx6eDBpU1E5NENTbERYVS96ZDE0dUt3R25ZR3lvZFJXaHlzVDZnS24x?=
 =?utf-8?B?ZTJtQzlKSEUzck5EQk13WWZ0ajhXRjFSdFoxNURseUdHdEhMcm5qNVRkQnNm?=
 =?utf-8?B?YkJPSkowYWxyQ3QzbjhOcXk3YUlReVpPakxaam5yMURnczVZTkVkN2sxRVhZ?=
 =?utf-8?B?YmJFL01IMUd5ZFpHMTdNNTlIRXVpbUhBNC94V1BweXVqdTNvK2REa3BoMDVZ?=
 =?utf-8?B?ZFd0U2dYWkM2bGVYZXRsZ1l5ZmFFN2lCdlhTVHY3eVlTOTRiOHlpdnFHRTh4?=
 =?utf-8?B?OXZJbS8zN2VRSHRrYzgrbktFTVJUOXNpVmpUTklGaStpZVNZOFF4a29oLzd2?=
 =?utf-8?B?QVl6UFFEQkFKcStXTDB6UUE4b1lOUlFXbFdtUU8vSDVmTm1Ncy9Fa2JaMXQ4?=
 =?utf-8?B?UzQ2MVpHeldFNEJpZVc0SzNtQkRzallhQXIrNUVFamk0QUF1dDlGQklIdkxm?=
 =?utf-8?B?Y0g0Mlo4MXZwbDJzV3QxVFJwUnZONnBZaDNMYTh6RGljK0dZbHFKcmtaRHF5?=
 =?utf-8?B?c2ZvcStzczc2eExmSE02cjk4N3FDNmVtQ1lSbytNRWhpUlF4cS93MDl6YXly?=
 =?utf-8?B?RDdlL1loQ2FRTFV5Q3lYNHQ0VWhNN3ZZMXU4dlQ5RHJ4aUdCQXdkSWh0V1Jx?=
 =?utf-8?B?WldGa0tIbElyM2ZpTXdzYmhpRm1GV3VsVmZCYmdrdkRNbUlDRjZsbWJLMzdC?=
 =?utf-8?B?dXNrVEVZb08wMG5BVGFwSks4blRTdjJoNDhtcGNTTVFNRlV4SCt2eElOWURB?=
 =?utf-8?B?bC9hTlhKRjJrOXZ2UWRTNEYxbGFTVkNZWHFXN1g2Q01wQ1pxdDEvSVd2WE9s?=
 =?utf-8?B?UHMwbU1JNEZkbjJOQ285Ujlab3EzZU9udm1mMVlVdHROMFlXUmIxRG9qQ0po?=
 =?utf-8?B?TGFtbW5YbGl2SlAyRm45SzlOKzg3SnRhT1pTVmZydUk3OFRUdU1kR0RiS2Fo?=
 =?utf-8?B?a1EvSVF1eE1MUHJ3MHpldk4rRHNDSDJqY0l2eGRZWGVDRDJyY2ZKSkY3SmxR?=
 =?utf-8?B?UGQvMlZ5VG1PVUJTZm93OEdCT1hkcy9pNWMwRmtDcUFHelA4Mm51YTB4RGFG?=
 =?utf-8?B?cGJmRXEwQmg3ZkRyL2JWNDh5bmJJQWZJK1JZTW5xci8vNCtWUGZrNkp2NjBm?=
 =?utf-8?B?OUFDay96dGlZSzlzdUJPZThXNEVBSEJ1ZktiZk1DVExudHdvTU1Da29HQjNE?=
 =?utf-8?B?Y0kweWpieVVZTndtbmloamxlWTVZUDNsUGEvV1U4SmhZYXVXdGxhbmpJVU4y?=
 =?utf-8?B?NzZraHBzM2ZtV29mVzVkYmdNdXcrRXJNZytoaG93Y0VBUCtzdG9aVmJ4dCtO?=
 =?utf-8?B?R0FvdzBjcnhYT1V6WmJTaE0zODlrWEViVUp0NFpjYzhTZ3ZiL0RyQ0ZlcE43?=
 =?utf-8?B?M2ZMODlaQnVVUjhNdTNjcENhTmV1blpjQ09aOEIrVDhxUHNsZ3VaOFdxcVZD?=
 =?utf-8?B?SldXMXN5ZTQ0NGxpSkVnUDFPR1JQRWNNSUZOTUx1OGNRTkZnTzl3SXp6UXpP?=
 =?utf-8?B?Rkdxb1lkMWcrTll2d2FzWmEyTHVZMC9OZ1VaOEs2aHlPZkQwNHdhUktqWU9R?=
 =?utf-8?B?T0N6TUFhaWlvUnVhK1RTTmJQL09TMDlmZ3lRYmJBakFGRituRk5HblplWHhk?=
 =?utf-8?B?bjZDWjJxeVYyOFU3OU5CRTlCUEIwOFhZUmVxNTFSTWNndXRzY29HMFV5b3c4?=
 =?utf-8?B?ejJ4K21OMkNtL3l0UEplSjBlQVJ2UjczaVUrelo2ZGNFbjRJdG1ubHIrWHpG?=
 =?utf-8?B?cEhSNkVia0lJajRDMDZPNkFOVzdRWWhDdVJkbG8zVHFTVDdLYjVCWHNxRTVn?=
 =?utf-8?B?VGJyZm5ld0gzUVJFTVFCMnFsN1k1MWQ4cnBMbWZPWXV4MnJObmVmdm51TXV2?=
 =?utf-8?Q?s03YRqC/KpysyYz8=3D?=
X-Exchange-RoutingPolicyChecked: ngWxLR4u4YifISHfr9yg5ZvlxX1enZJAWx9b9Vh6iIYBvlpb4EpEXwKZRKER6spIfpiNGF5cBki57siW8lhQBRo9qJTbVsCEMfVpbhhHHket46m1/C5QUQE0zymPQDzDiF64q9D6TWTQvWuw0alL7GVrQaHeVyXR8rcXcs6d1e1uwxqlDmbFLFeHFQ6SLrlb4xXNvND1ruabkb6XnWd9d0SRN/UaUaJjYCCzYElKm+SJEVVeDehC+B4TBxToQ2bryGEy7CUFTB1hHEw2cFrb+OnZH//yPWFwx/dOfXeK7mJGIZ5su1ZS6b8g7I/fGdv1P8XDdzPu45WfA0qNf5qnlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5568b31-b465-4994-c90a-08df2071a59f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:40:59.3211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSDToLQqHjKIUEtzePMQTM2fyS+rTeZS8cqVSjtUMkHOSN+ODSr+kivZewEL7A4PvzE6Z9BM35JUTBbExtundMyAcZZPzdZf7ClIhS+DXas=
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

Exercise partition selection and address lookup, plus pool usage and
CPU-visible memory accounting across partitions.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c | 147 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |   4 +
 2 files changed, 151 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
new file mode 100644
index 0000000000000..1ad3186e6d5be
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_vram_types.h"
+
+/* The layout xe_ttm_vram_mgr_init() derives from the pools of a region */
+static struct xe_ttm_vram_mgr *split_mgr(struct kunit *test, u64 kernel_size, u64 size)
+{
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_vram_pool *pools;
+
+	mgr = kunit_kzalloc(test, sizeof(*mgr), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, mgr);
+	pools = kunit_kcalloc(test, 2, sizeof(*pools), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pools);
+
+	pools[0].offset = 0;
+	pools[0].size = kernel_size;
+	pools[0].purpose = XE_VRAM_POOL_KERNEL;
+	pools[1].offset = kernel_size;
+	pools[1].size = size - kernel_size;
+	pools[1].purpose = XE_VRAM_POOL_GENERAL;
+	mgr->parts[0].pool = &pools[0];
+	mgr->parts[1].pool = &pools[1];
+	mgr->num_parts = 2;
+
+	return mgr;
+}
+
+static void select_part(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+	struct xe_ttm_vram_mgr_part *part;
+	bool exact = false;
+
+	/* The ranges a pool resolves to cover a whole partition */
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_128M, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[0]);
+	KUNIT_EXPECT_TRUE(test, exact);
+
+	part = xe_ttm_vram_mgr_select_part(mgr, SZ_128M, SZ_1G, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[1]);
+	KUNIT_EXPECT_TRUE(test, exact);
+
+	/* A narrower range still resolves, but needs a range allocation */
+	part = xe_ttm_vram_mgr_select_part(mgr, SZ_256M, SZ_512M, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[1]);
+	KUNIT_EXPECT_FALSE(test, exact);
+
+	/* Partitions are a hard split */
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_256M, &exact);
+	KUNIT_EXPECT_NULL(test, part);
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_2G, &exact);
+	KUNIT_EXPECT_NULL(test, part);
+}
+
+static void addr_to_part(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, 0), &mgr->parts[0]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_128M - PAGE_SIZE),
+			    &mgr->parts[0]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_128M), &mgr->parts[1]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_1G - PAGE_SIZE),
+			    &mgr->parts[1]);
+	KUNIT_EXPECT_NULL(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_1G));
+}
+
+static void general_pool_usage(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+	LIST_HEAD(kernel_blocks);
+	LIST_HEAD(general_blocks);
+	u64 kernel_visible = 0;
+	u64 general_visible = 0;
+	u64 used, used_visible;
+	unsigned int i;
+	int err;
+
+	mutex_init(&mgr->lock);
+	/* Only the bottom 256M are CPU visible */
+	mgr->visible_size = SZ_256M;
+	mgr->visible_avail = SZ_256M;
+	for (i = 0; i < mgr->num_parts; ++i) {
+		KUNIT_ASSERT_EQ(test, gpu_buddy_init(&mgr->parts[i].mm,
+						     mgr->parts[i].pool->size,
+						     PAGE_SIZE), 0);
+		gpu_buddy_driver_set_lock(&mgr->parts[i].mm, &mgr->lock);
+	}
+
+	mutex_lock(&mgr->lock);
+	err = xe_ttm_vram_buddy_alloc(mgr, &mgr->parts[0], 0, SZ_128M, SZ_8M,
+				      PAGE_SIZE, &kernel_blocks,
+				      GPU_BUDDY_RANGE_ALLOCATION, NULL,
+				      &kernel_visible);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	/* Straddles the end of the CPU visible window */
+	err = xe_ttm_vram_buddy_alloc(mgr, &mgr->parts[1], SZ_256M - SZ_4M,
+				      SZ_256M + SZ_4M, SZ_8M, PAGE_SIZE,
+				      &general_blocks,
+				      GPU_BUDDY_RANGE_ALLOCATION, NULL,
+				      &general_visible);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	mutex_unlock(&mgr->lock);
+
+	KUNIT_EXPECT_EQ(test, kernel_visible, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general_visible, (u64)SZ_4M);
+	KUNIT_EXPECT_EQ(test, mgr->visible_avail, (u64)(SZ_256M - SZ_8M - SZ_4M));
+
+	/* Memory taken from the kernel-only pool is not reported */
+	xe_ttm_vram_get_general_pool_used(&mgr->manager, &used, &used_visible);
+	KUNIT_EXPECT_EQ(test, used, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, used_visible, (u64)SZ_4M);
+
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_buddy_free(mgr, &mgr->parts[0], &kernel_blocks, kernel_visible);
+	xe_ttm_vram_buddy_free(mgr, &mgr->parts[1], &general_blocks, general_visible);
+	mutex_unlock(&mgr->lock);
+
+	xe_ttm_vram_get_general_pool_used(&mgr->manager, &used, &used_visible);
+	KUNIT_EXPECT_EQ(test, used, 0ull);
+	KUNIT_EXPECT_EQ(test, used_visible, 0ull);
+	KUNIT_EXPECT_EQ(test, mgr->visible_avail, (u64)SZ_256M);
+
+	for (i = 0; i < mgr->num_parts; ++i)
+		gpu_buddy_fini(&mgr->parts[i].mm);
+	mutex_destroy(&mgr->lock);
+}
+
+static struct kunit_case xe_ttm_vram_mgr_tests[] = {
+	KUNIT_CASE(select_part),
+	KUNIT_CASE(addr_to_part),
+	KUNIT_CASE(general_pool_usage),
+	{}
+};
+
+static struct kunit_suite xe_ttm_vram_mgr_test_suite = {
+	.name = "xe_ttm_vram_mgr",
+	.test_cases = xe_ttm_vram_mgr_tests,
+};
+
+kunit_test_suite(xe_ttm_vram_mgr_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d4665851f727b..4cc720c9f9caa 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -1285,3 +1285,7 @@ void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
 		return;
 	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ttm_vram_mgr.c"
+#endif
-- 
2.34.1

