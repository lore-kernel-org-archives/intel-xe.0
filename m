Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D32ACD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C2D10E113;
	Fri, 19 Jun 2026 19:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6DNT0xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F6410E10B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896337; x=1813432337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EBZX6BpKvgSbOaYAzTvSYHzN+YIqcBfi6igm/AMkJNE=;
 b=I6DNT0xeJ3ltc4mSJVUabVXwffPTCtuGy0HhTbUqeergwfvO6W6EU1Ix
 mjCv+nzt5hKdk5Iiu8W1sibkktPlWGWD3IBewvPQPd0OZJZU4XBYKSsaA
 43U9HC1/7G5g+dzc5HdOwt1Hwe5A6Cibt+xpI2ztrvFPb4yEFTx0Cy+rU
 UyFz7oLjFeCZ3xTAP0i9DEhvXpDOp9BTOo5NMLVe361VEw3viMSm2U0p6
 LCg9tjviMPROPzWBUt7O1r0NPt/PjBp7oVTHAhlPrjZB9hJtqCC8wK33N
 urCGqmFOrR3a/dQiKMWaF/noyff72fhIkDHktESCQvs6tVugU/qz1XHPS Q==;
X-CSE-ConnectionGUID: G0qJILG5TcGxAm2ExxMpkg==
X-CSE-MsgGUID: 5jezZUo8SayWNjXAdJf8WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="81845234"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="81845234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:14 -0700
X-CSE-ConnectionGUID: gsfSyX+yRKOC2vonFNVKDA==
X-CSE-MsgGUID: armqQDxMR62bsgk/dPMP4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="248753249"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 12:12:13 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0vnVPj3LvzfEfcx3QtVO3EtSXRe5vFf2pi0QAUVW/DBy3Hkf5cXuVHgEWvNH8XtqPiYVT9abVBg5CWisMPe/SlBYh5yCBUTXTzqZS/1qAyGhZY51D5rYgLjA3OYxaRam5BB292nfijbLqw8Jjnx2z9lFDJcJG2o5iL/VfiBYNLE91Mtbrts2gdWxs/Jw/U41ljuZAX8de3P6X7Rrn1IvWHoOlSmEr0zakPQYzADrbiPbXzVj4txF+iJ27+t+Y4h+TQM2PoRdaEbpDGEejay5FVbtaQAWP4O9oYItVRjb1pEJ9JZ4b/p44jVkTv0sFC8KQQClRaBEXqKtI1gzBgf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP6A+Y74H6lttEdfhaq3y/7i7PpSprvlJvJU3D+TPbM=;
 b=U/0QTk/2PVpwhlWdBsKSDBRGAwNuVUKD39doqUqyRaSi8yB2agdTB4KUVXGBGstJpTD+qARdsJdeoL1KT8XCGbC63RkemmWQMH7b7A4XrtuM8/sWyo5xIYWwL7RnfT7xFf4z1/CLYfks/e+2gGx5bPQBHl17s8MCwCgM8NObvLvDlFopWouclRBHRs/FutwAknlKcFc6L+JT+bh6mMPklOlu/M3scS16q4WG+eNmW9cc7o13hefCfZQiO8lOfZT884u2zt/cbZVtkHAbKO7C9JMLFG/QLKLmtNpPw0mP0FjK6EoxiOMl5WYLUrJ9gos9pvKpvgXeWm+rjLxF78WkcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:12:11 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:12:11 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 6/7] drm/xe/guc: Add start offset support to GuC doorbell
 manager
Date: Fri, 19 Jun 2026 21:11:06 +0200
Message-ID: <20260619191107.2628783-7-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
References: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: f5bffb7f-140b-4ac2-725c-08dece36aa34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JpSpqUTCnOLldvGuidwCfhWMC9XGrxAUoLG8qmX97BUyLLnCL0NbmDnvSgTLrwyKFx+ucxCcjkj3WuAvgmD9OAEnNYfZtC16GhfTRLdYVR7Q0ratZKq+tPTiEigvoW5rQGhdwRCQXvNoLKfEc86wvbXz6Rt7G9Z9acZnv+3gRaJ77r1nj3ceu/ffZN515KqqM6FrsosI8Fvg3Amz3owBpnyw50BZXMpg8IJedyaQBwRO+66hEJHKEtnPh+vgQovt8iURtBkSOQpy2AJTkfV7+E1CpQ/NIMl/pRnbrSHzOETquCcwW48mPOocOOSTwr95PeJukkl8rR6Nq4kZ287ZBSIgKFAEtIJgOUGo0UG6ybXYxbCUTlH46OQPnD28lWLi2kAGXH4Q3gdb7c/7wgD6MU/4yxL7Bz9mH5FjOHxPV536TD0feQly/eat41bUOP7CqtIuf1Vuh8PzMtVpe5om+K87wQFU1yJz/2dlpbzjxfvU5Ik4zbnhF8EeR1yNgT4wNeGneMuK24vOGrZUOdb1YMKstnwKwnb4Smi+i1dAf0GkkAE5RAy+cJCy9ADBLGYPng5nLflESdCKuSZGcDtsq8AE6LEwoMeNX9IwHaI9GG026N1kmNUlH0g+sENdMPknJyAH/LYaHXxHMc2K81ZTqtnwWwNhb+bben4z4pIuyOA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3psU3NJVGZBSUE0UlpLakFVVE1MWVRJd1kxeEhjK05jWkkxeFNvWkVmUml6?=
 =?utf-8?B?SUQrWTZTNnVnaXFjNFZkZGQrc0ZJUm80N0xsYWdEd3lOWW05SXVCb2cycSs0?=
 =?utf-8?B?M3EwTlBuYW44bGphRkVxL284T0Z0V21PYlBoT1Q4M2c0bDJkZjUvK1RIaWJH?=
 =?utf-8?B?TVFYdk1Uc2oyZTJXMndDaGYyb1JnaHV1YnNJTUNOSEpqaE9UTCtIUnRXODVR?=
 =?utf-8?B?VTJWSW44VlYxblV1QWcyTGhhaHFmS0hvUkpRS1hJNERlay9CY0doQWdkT0ZS?=
 =?utf-8?B?MzlPVWFITDVDV2g5RXRySVJORHRnRG1PUVduMjN0RVhFT2ZNcytiWkx2R3Rx?=
 =?utf-8?B?amxHY2tVVUJkcHpueUZDR0tyY25NaDViYUVNYndYYWVTS0wvV0RMUnpsbUlG?=
 =?utf-8?B?ck4xOG5tN28yaHA0Vm1SbWR5SVd2OHl1eUh0amhzczhiK3VOMWxDTFBiTGpV?=
 =?utf-8?B?TTJTN2I5d1l2RWh3ZWxxUUo2bC9QYStjSlMrbHNtY1dkUWdvMHFtVWNyWFpQ?=
 =?utf-8?B?aVYzOWRVVlRGMjFRejdMdmRHTHV3TzJUajF5VDZsRDNIbFMremlON3NmQk51?=
 =?utf-8?B?OTZvWDVvVUFlQ2xkSm1jRlNNNXU3QTNWLzNYcVNvWnRnVlM2YVdmTjdsZFhP?=
 =?utf-8?B?elJVRGRCaUVEV25QdGhnWTFHdnBTcWlValE1Si9ORmdnSUhvbG03S3lzcUY3?=
 =?utf-8?B?RHEySVo3a1ZkYmNlbmRQOTNEM3hwQlo1eEVlYlRmUFJPUWVTWENLU2VpM0Z2?=
 =?utf-8?B?aUZBa0dGbUdRQ3Z1OEE3MFhJb1h1K3Z4VHJLODJiMVlBVVJLU0U4dVRXN3Zy?=
 =?utf-8?B?dEtTWllzb1hzS2dtcEMwelBObXVRelI1REl5NnFzTTJPR0w3LzQzd2hxVmZG?=
 =?utf-8?B?eThMRTY0Nk40Y0w5WGJvaFlYak9BZk5BUnhnSVgwdXU3ZjFmbkJSQXpWZjM4?=
 =?utf-8?B?RHJURHNST1dySEoxZk1YWGVkZjBLTEcwMjVQZXNncURpT3NvZlJjeXozL2J3?=
 =?utf-8?B?V0o3QzhBVHlVaytxMG8rNmpLZ1hnQUwxanZhQm8vdTZDMThsQkNwTnpSS2xm?=
 =?utf-8?B?M2pyclBMY2k1SXZ1YjhSQWg3eU0zblhMTnRTd0M1cERZbG5oOHJ6dmRlQmVL?=
 =?utf-8?B?VE9OZGZJYXV5MXJDVkNRRFF6ZHpCbjlacCs4b0h5Yk1uKzdpbkNpSWRvVFdQ?=
 =?utf-8?B?TDIxRVl4dVlJODFTUjFFbVhqTTA0MmI0NVhVY3FXcThXdWZKS0N6ZWhBdlI5?=
 =?utf-8?B?Q24vNUwrbDRBRUZCUHN6Q21Jb2ROMmdtcXM3OW8za3FGYVUvaFVkVVRMTDI2?=
 =?utf-8?B?R0ZZVmNTaVZQUFdWeG5KRFVBVlg0Mmt5YWxRTC9PZnFTRGY2Y3ZSQmxnNDJI?=
 =?utf-8?B?OHA3WThuSVhyb2VvY085L0Y2TEQ3SXR2REdvOHVORU8xZS9JaVRGQ1NsVUZ5?=
 =?utf-8?B?ZDVCQ0c2UFVZcWozZ1B2dmQyL2V6ZWd2SzhSKy9jQkFGUG9Yc0QzMlVWampX?=
 =?utf-8?B?ZHFjNVZ6TlN5YzJ4WnpPdXhJSVlhUStHVEEzQTVXWTNEYS95Mll1ODE1TXJ5?=
 =?utf-8?B?SXFlMGhhdDlkL1ZJcHNpRTBDemQyMmNUcGM1R29zSnMxZndNRlpoUURMUHpQ?=
 =?utf-8?B?SmREVy9mczhjWXE3dlBhNE40UDRpZ1JDQnFZMjYwZkdaWU9KdlEvbWNaeHh0?=
 =?utf-8?B?cjBnbEZsU0VsRVp6R3RpM0hYMlBXMGJzZmJJbWdDVk9OMEp4UmdQMzljSXk3?=
 =?utf-8?B?UDJ2NFdJbzcvN0YyQkQ3bGd2b0lLN0dXVHk5RWNnYlZOK2lhRjRoS1JXUG1N?=
 =?utf-8?B?elZuTDlzcTk2YjRWc09DN1RBdHBvdWpLWkNwZk5EKzcwbzRKQkJJRHl2dnNV?=
 =?utf-8?B?eGRiUVFXeGxaYmowcnpyRG02cDRFaXloMXo2RGtsVUZWSXgxVXpwWWp5d3Z6?=
 =?utf-8?B?YWw2cTRhMzFBSTRPdnlQZkdKNitsN3NYWi91aEdtZzdhcExwVkg1QWRiWW5t?=
 =?utf-8?B?UU9kWXhZV243TU8zTHpyZDRjRlZCUkgxTzhQb3c0MXR2aE5ENzhvKzlybyt6?=
 =?utf-8?B?bzVQcHZ4Q216aEtjU0gvZmMzWisya1d5enRuTXdFeFNzbWdndzJqaG9DdmE4?=
 =?utf-8?B?R0J2eC9telJsTUdLQUt0RDNNQlg3TysxNnc1VFh3cDBLbjU0amEwMzF6RXFp?=
 =?utf-8?B?UmZ0bFJBZkoxZmJwd1UvMDB0NEFXUGY1VjBWbEp6RVQyRC9jcE9McTc4Y3RP?=
 =?utf-8?B?eEYrbWt6YUhucEFLcUVXMEZXaG5MRWpLc2FPYXJPQitJbjV6eStGVWJGSzRK?=
 =?utf-8?B?SFFmbVlUTDdweDg4UFpGNE5tdHdwai9Ja0M5S0FUZ0M4S2tZd2w1czV1R01V?=
 =?utf-8?Q?ggMfs6i/09Qj4u5k=3D?=
X-Exchange-RoutingPolicyChecked: J0FHZ4/vRaR8G61LWnqQYb7RXajjaEyeQflNK1vtlKk4WXYWGaeDsY66vkIgBRFrykBufs1HnkCG7K5veULnXDAlBHSJ8j0GrXOjENC6tg5VqtjI7hK2317KsLB5/sxrOsO2UR+X7PyUWAnnGfbEwWtDCMxo/k2S29mwLpL3ZqUOXsYSt9pc64qT4rJ98s+/Fs84KQykbGhkJUCRUph5zeYDIK6eU9W0wkVzW10aJWvnYNsQEqD+Ml4HLYSEX5r47oYU3aFx3bI1D7EhLxCh9jzIOlREpV7WhUlS2SieHU3N8qHfm3MDiU3HOuBFWUMl0+Rhs3arpG+ZJ5bDz2vv7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bffb7f-140b-4ac2-725c-08dece36aa34
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:12:11.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zL7hBX+XSHLQcWvrN4Tc4/cSQBRRQSlG4eDJTRey7fEc4m4tcq1RG3X3DyYQmHhwTRMHZrZeAbiMfOFHKEliJUPWV+wIUaNcynar1ASt27E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

Add support for managing doorbells starting from a given
start ID. Introduce a start field to the doorbell manager
and update allocation and release paths to operate on IDs
in the range [start, start + count).

This allows using subranges of doorbell IDs instead of
always starting from 0.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 29 ++++++++++++
 drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 46 +++++++++++++------
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |  2 +
 5 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index 95a713f10034..2d4af4f8116f 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -112,6 +112,34 @@ static void test_reuse(struct kunit *test)
 	mutex_unlock(dbm_mutex(dbm));
 }
 
+static void test_start_offset(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int start = 8;
+	const unsigned int count = 4;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			xe_guc_db_mgr_init(dbm, test_dbm_to_guc(dbm), NULL, start, count));
+	KUNIT_EXPECT_EQ(test, dbm->start, start);
+	KUNIT_EXPECT_EQ(test, dbm->count, count);
+
+	mutex_lock(dbm_mutex(dbm));
+	id = xe_guc_db_mgr_reserve_id_locked(dbm);
+	mutex_unlock(dbm_mutex(dbm));
+	KUNIT_ASSERT_EQ(test, id, start);
+
+	mutex_lock(dbm_mutex(dbm));
+	xe_guc_db_mgr_release_id_locked(dbm, start);
+	mutex_unlock(dbm_mutex(dbm));
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_reserve_range(dbm, 2, 0), start);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_reserve_range(dbm, 2, 0), start + 2);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+
+	xe_guc_db_mgr_release_range(dbm, start, count);
+}
+
 static void test_range_overlap(struct kunit *test)
 {
 	const unsigned int *p = test->param_value;
@@ -188,6 +216,7 @@ static void test_range_spare(struct kunit *test)
 static struct kunit_case guc_dbm_test_cases[] = {
 	KUNIT_CASE(test_empty),
 	KUNIT_CASE(test_default),
+	KUNIT_CASE(test_start_offset),
 	KUNIT_CASE_PARAM(test_size, guc_dbm_gen_params),
 	KUNIT_CASE_PARAM(test_reuse, guc_dbm_gen_params),
 	KUNIT_CASE_PARAM(test_range_overlap, guc_dbm_gen_params),
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 092084b200b9..bd87b8f94519 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -882,7 +882,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_db_mgr_init(&guc->dbm, guc, &guc->submission_state.lock, ~0);
+	ret = xe_guc_db_mgr_init(&guc->dbm, guc, &guc->submission_state.lock, 0, ~0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index f810692ad8fa..c39c39d16c0a 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 
 #include <drm/drm_managed.h>
 
@@ -66,6 +67,7 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
 
 	bitmap_free(dbm->bitmap);
 	dbm->bitmap = NULL;
+	dbm->start = 0;
 	dbm->count = 0;
 
 	mutex_unlock(dbm_mutex(dbm));
@@ -76,10 +78,13 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
  * @dbm: the &xe_guc_db_mgr to initialize
  * @guc: the owning &xe_guc
  * @lock: mutex protecting this manager, or NULL to use an internal lock
- * @count: number of doorbells to manage
+ * @start: first doorbell ID to manage
+ * @count: number of doorbells to manage; the manager handles the range
+ *         [@start, @start + @count)
  *
- * The bare-metal or PF driver can pass ~0 as &count to indicate that all
- * doorbells supported by the hardware are available for use.
+ * The bare-metal or PF driver can pass ~0 as @count to indicate that all
+ * doorbells supported by the hardware starting from @start are available
+ * for use.
  *
  * Only VF's drivers will have to provide explicit number of doorbells IDs
  * that they can use.
@@ -87,10 +92,12 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
-		       struct mutex *lock, unsigned int count)
+		       struct mutex *lock, unsigned int start, unsigned int count)
 {
 	int ret;
 
+	dbm_assert(dbm, start < GUC_NUM_DOORBELLS);
+
 	dbm->guc = guc;
 	if (!lock) {
 		mutex_init(&dbm->internal_lock);
@@ -99,11 +106,17 @@ int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
 		dbm->lock = lock;
 	}
 
-	if (count == ~0)
-		count = GUC_NUM_DOORBELLS;
+	if (count == ~0) {
+		count = GUC_NUM_DOORBELLS - start;
+	} else {
+		unsigned int end;
+
+		if (check_add_overflow(start, count, &end) || end > GUC_NUM_DOORBELLS)
+			return -ERANGE;
+	}
 
 	dbm_assert(dbm, !dbm->bitmap);
-	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
+	dbm->start = start;
 
 	if (!count)
 		goto done;
@@ -159,12 +172,18 @@ static int dbm_reserve_chunk_locked(struct xe_guc_db_mgr *dbm,
 
 	bitmap_set(dbm->bitmap, index, count);
 
-	return index;
+	return index + dbm->start;
 }
 
 static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
-				     unsigned int start, unsigned int count)
+				     unsigned int first_id, unsigned int count)
 {
+	unsigned int bitmap_pos;
+
+	if (WARN_ON(first_id < dbm->start))
+		return;
+	bitmap_pos = first_id - dbm->start;
+
 	dbm_assert(dbm, count);
 	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
 	dbm_assert(dbm, dbm->count);
@@ -175,9 +194,9 @@ static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
 		unsigned int n;
 
 		for (n = 0; n < count; n++)
-			dbm_assert(dbm, test_bit(start + n, dbm->bitmap));
+			dbm_assert(dbm, test_bit(bitmap_pos + n, dbm->bitmap));
 	}
-	bitmap_clear(dbm->bitmap, start, count);
+	bitmap_clear(dbm->bitmap, bitmap_pos, count);
 }
 
 /**
@@ -249,6 +268,7 @@ static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, i
 	unsigned int rs, re;
 	unsigned int total;
 
+	drm_printf_indent(p, indent, "start: %u\n", dbm->start);
 	drm_printf_indent(p, indent, "count: %u\n", dbm->count);
 	if (!dbm->bitmap)
 		return;
@@ -256,7 +276,7 @@ static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, i
 	total = 0;
 	for_each_clear_bitrange(rs, re, dbm->bitmap, dbm->count) {
 		drm_printf_indent(p, indent, "available range: %u..%u (%u)\n",
-				  rs, re - 1, re - rs);
+				  rs + dbm->start, re - 1 + dbm->start, re - rs);
 		total += re - rs;
 	}
 	drm_printf_indent(p, indent, "available total: %u\n", total);
@@ -264,7 +284,7 @@ static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, i
 	total = 0;
 	for_each_set_bitrange(rs, re, dbm->bitmap, dbm->count) {
 		drm_printf_indent(p, indent, "reserved range: %u..%u (%u)\n",
-				  rs, re - 1, re - rs);
+				  rs + dbm->start, re - 1 + dbm->start, re - rs);
 		total += re - rs;
 	}
 	drm_printf_indent(p, indent, "reserved total: %u\n", total);
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index e29e318e213b..d04e989bc88a 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -12,7 +12,7 @@ struct xe_guc;
 struct xe_guc_db_mgr;
 
 int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, struct xe_guc *guc,
-		       struct mutex *lock, unsigned int count);
+		       struct mutex *lock, unsigned int start, unsigned int count);
 
 unsigned int xe_guc_db_mgr_total(struct xe_guc_db_mgr *dbm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 5fd50961d9da..4183b23bfd8e 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -31,6 +31,8 @@ struct xe_guc;
  * is initialized and used.
  */
 struct xe_guc_db_mgr {
+	/** @start: first doorbell ID managed by this instance */
+	unsigned int start;
 	/** @count: number of doorbells to manage */
 	unsigned int count;
 	/** @bitmap: bitmap to track allocated doorbells */
-- 
2.34.1

