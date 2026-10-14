Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B9CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F37E10E7B7;
	Wed, 14 Oct 2026 10:09:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B2210E7B7
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791972575; x=1823508575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+6ZgdSLDxBc0rp5F/lRxMgENktI4F9ARt4G2BIm14hg=;
 b=RM4eVhjkjvTGP/cZijBgeF1kG6Eu2M7Yoq1ShW1WL0yGNVmy0tCp+t3l
 OWC2kYUC1oKPDIik21+S89SEpRhhO+TjQsQ/t8U3dRBDpogap7ePU4QBK
 IbD6Nb9IigdkbKk24n9lrYzsVjSfMfNdECkyt9aUh2bJfh85eIGKKvXUA
 IFUDNI1cAbhkVdfCheUrcSJvKLC09XyFZ/Kjm8taw6agUJUjEGTelnE3v
 gH+h1WkmomB7tAv8IyxT5ZOH7TJliZzZhueEp1xz5lO6Fc8KK4tmXF4ew
 gdydQU3bWBTpIXAQRIITJCxFAkXYe2f++KWFaPDJmGLg42P1YCkj0i6Vj w==;
X-CSE-ConnectionGUID: UpsVZjm8QSiAQbxQf3y8mw==
X-CSE-MsgGUID: NP9UBeLKR4GuxnFe3zp7OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="717392"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="717392"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:34 -0700
X-CSE-ConnectionGUID: 9wQ4ZqR1RaKcCfnrLAJT/g==
X-CSE-MsgGUID: LQQ0+lMORpSlOafZTpTnig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1406876"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:09:34 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da5tauHCtJmWohLS6Lu/av96xaTL3YwuQ7sKRAglITIRctKM5UYPJC3L3klAvOYTh+DKODjEOKegOP0fHkJVsg2yXCH6z3yuEO8F40C7UprtXmR30VjwY998Km5uGeh/yRJUvv8u6A7wSokAIjGfKxqhOo/j5EcVdMKjTGYp2KfBfGkrpI6hgVaaB8B8q0jbEaCZ7zPAuA/8fKQyAA4tbCFQ4MIg59R5ifwJgvCl2RB5lupJTVX18CEPyUPKYaGg7dVSqbA+6+U4bcsfJxDamcjzuYf6XTFpuqdPp/R1wOeKTfO+uVD4wDDorX+lzYARJ8f5MFSFGUCzX+XXJ/cZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9+sJJW+tJW38hNJxhWv7eEUK+yOJTpfAWqtwOFK5+A=;
 b=IEQ/Kg/xLxWneLcAO7/6z7IEoeYk6IG1c26hbJQaViqJSRZgt0TSzIKJPwbsFfJ1PcfNtDSk2fCA4IIZpV6frFv7P2qEvaJfhNB6T+qj8tQZGNsWpGqYc6GwPSBZJ86Dh8An18LvUYj4YP0F5PB++/5A/ZLeM00dQROS2P2E1L7zUT0z8PnXepwT04SBojarajlxS7PFZa/6Wx2hGRPp5KBI48BRl6OO0Ff7k6mRPqEfyJi8VN1T7wYsFf9GmS2Kq8s/YP7GZTKEjBBsQGJTIrJR4H5uuezc3jPmMtJ8oKGo/4BQYXLJBdL/8QXL/OWpRd5bN7cx06IFJGLq7Z6PeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:09:32 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Wed, 14 Oct 2026
 10:09:31 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for VFs
 provisioning
Date: Wed, 14 Oct 2026 12:09:07 +0200
Message-ID: <20261014100907.77877-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014100907.77877-1-piotr.piorkowski@intel.com>
References: <20261014100907.77877-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0169.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: facf8559-48c5-4d4d-65f3-08df29db3d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: xoTqW3V1PMBGP/+9RsQrDe1JsWiuZ6lrsrKI7Q9UwlkzPmmT4AhM+gwDknsqVWpato5IG+0H0kChf6Kg+ADuJFeg2UoUC91v94bw95aQ69rpe04DBe1LrmMg5YGmkExaLXacRRCiUfZd1L0xUenpV5k6bwfG2NPEbNR5lDtUG/CwPVUfeMrsnOGPBi1ZRnwjV9bL88k1pTDeYP5cnzvKRDt9CNO5Lpv11p74dUUo2Zd5dVZZKppCWxQbkfWnhJMAeQy76r7KsGQw+bXPzrKQAwIF089FHQg8AHZe4UIeK8kpQZDQCj/gvokxHVBehugmc+q5Pbjyf0uXwOp9vBNmSs3AJozxt/h9M/L/yWRu18Tj7Jvap9NeRk6EGxOEjtiNXbQXIlPfULEHWQ2C0BttHu2L0WdRE5i3Pc9EG6H9ervMLAlmfp5/VFW5n6ZZQ44CninJfHpPHK1KUhTj3wS22pqk0zkf+E1C1JAYFivSzsxcRg7CyKBc8gf/CEiJ2HfIrRVDMa7n40GojaBQNUgDyCkiV7AIlHNrtjFH/AtqzE50wxd/Q5M496mnDiyGm95yhMJAnwiZ045AwQ6J+2M3bDmEAaHEipOYqz4GbLl15DvERezd17OfG9vtxPvruGQ2jqClahCNt4yG4qHDXiFzJ0moPqLyyG4bsx/zSRXVwK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z21JWGdTTXA4UmJQeGhPa2ExVVdiN1F0Mkh0OHdibGMweGxOZ0FnSHhWeU95?=
 =?utf-8?B?NWhhRG9UV3JzYkNLT0Z3N09JeU9USVN1VGR3SHFUTE9Tcy9NZlRLV2hUSU9I?=
 =?utf-8?B?YWtsZ1RtVHo4QkdpMUtwQkJ4MUVjWUFhRzk2OHNuOWlUUU52ZVA2eU44ZWV3?=
 =?utf-8?B?ZTNwa05Nd2kySWIvSnMvOVd1Q2UzRzJZd1BHQzBNVnlMWGlDSlFCR3pPUDRE?=
 =?utf-8?B?QzUvOXNxTGVneFJtYmNldEl5dXJTbVgxcWpoVDg0ektibXpWS3VITGFTQ3Rr?=
 =?utf-8?B?QUxpVnlZRG5ockFPL2JWMDZybE1TUjc5RzlQZzJHZVRnaHk3amkzMXFiZnhm?=
 =?utf-8?B?d0dLV2N1aVNhWkl0NFRSVUlvT2ttbkJtUVZQZ3pROGhnbE9pS1R2RVMxYTN2?=
 =?utf-8?B?bHBSZW1BSldaaG15SmJIRkl5Zkh1SXhXdDBYalhCdVNvc0xac2llTHJYM09r?=
 =?utf-8?B?KzUzYzFsMlM1NWpQR0U2THlrb2JKUWZHRmNaZXM3MVozM3F0MnBvWm5DSmxM?=
 =?utf-8?B?WmNBYWk3MHdqRktIRWhUUmdVcFRXRm9Gek03MnJLclNSTFMvWFp0R1NNVTI5?=
 =?utf-8?B?VHdHam5QVlNFcndPMTBYT0dZeHY3T3RoRDY1ckRjc3k3bUtoWHQ5WmFORnBW?=
 =?utf-8?B?Q2oxRG9lckRGYXJZTGEzeUNuUFBnc3F5eXYrRUhQNldraFdWRmh1aHhXeHFh?=
 =?utf-8?B?ZUxOWTAyVFlpMXR2U1ZRZFkrMzFkaDF3OWRzV1pKenJiaUNRcjN4d3ZYeDlG?=
 =?utf-8?B?L1F4RGQvdERPV3Q1d2lENG5TdkRGK3VQTlRmMkIvcHZGU2srd1FHN1NGMy9B?=
 =?utf-8?B?Z2FMdS9oMkxGVWJ5VTlUT1JsWkdqRWt0UVJ1WUJhdUw0aDdNdkl1M3Mvelhy?=
 =?utf-8?B?bGZqUGJIOGl2Mm1GK2VLRHU4RjNneFBZT21vMzErZVpMbWRRN0lYaUtSeldj?=
 =?utf-8?B?ZTgxVXlmN1VxWDVFclIyc2F4R21jQ1UxWUJoUXVSZ0thbllTRzRpVHVxMGcv?=
 =?utf-8?B?ZXdqSytUTDdTcmpsdmhtYXh1d0RidmttRHVlRE1LT1FqQ0hLV0twR09JQmFT?=
 =?utf-8?B?Q0Q2S003SXY5WVBMdkt1QVdTYlc3RWlONXlDMzZucVh1QWVOYjJPMVBtUDNy?=
 =?utf-8?B?WWV0NzNncVVQRXBsMm1HdnZiZFIrUlJPTjhFRzY3MG5kZndHZVhTUE9KdEdL?=
 =?utf-8?B?aE9MOEVUZS9lTUZtOTdwSUZYdU5uREYzTGI2TmJLTmVyaUhjaTFBL0lEUTcv?=
 =?utf-8?B?ckhFTXBzeFUvRFhuQzBsTjNxemJoRW5uRExmNCtIRHlrNGd0S0VUOTdWQXhI?=
 =?utf-8?B?ZGFnaXdsVGQrYzV3Rm9FQTE3c0pIN0VTOWE2LzB3RVd0aVNQM1g0Y2gxNTc2?=
 =?utf-8?B?eWgwelJsZk5jTmRBVHQyUDJtV0lMUFFYelNraWxLTVdpTW9MZGRDNW41NUND?=
 =?utf-8?B?VkY4TEpob1FPbzBMZ3k5ckVKQ0NwZm1CQzVTamROM2lTNkdWc1pWeEFFdVBs?=
 =?utf-8?B?VzNldlltOXJ4YjZqSEJRcXZnQitHaDBXSDV6Z2xRTkdhVFBUcEpPTXFtQVFS?=
 =?utf-8?B?czErT0JHUDVSenBwaEtBc01NRGhRbmRDc2F0SEJnaFRpQkNmZVFXOUhaZDYx?=
 =?utf-8?B?M1BqaU5Mdkdvcy9SWTFPZjJTeGRKYmZCaEJXV2FteGg5V3h4SlVZK2ZyR01Q?=
 =?utf-8?B?TCtVNUQ3aGY3dDZpR05tOHA1RGRZS29wdSt2MXcrTzZ2SEdYcStMUk0zdnpV?=
 =?utf-8?B?WEY4N2NxeGI3QmZReGdsNExEV1hTelVWSlN2dUVzdWJ5bVM4b3M0Y01aRkZG?=
 =?utf-8?B?K3hRUitnN2ZBWkNvU1dxUXVlOHZFN1dYVnk4QXh4eEdaK3pHbENiYTA2OEJl?=
 =?utf-8?B?QTY1b2dJWDFDaWJIMERlYUZMOERERzk4S3dGR1owZ0lDNUJacHI1NXNHMlla?=
 =?utf-8?B?eW5RS2cvVFRiREhrOUM1c3l2Z2ZocHpYOE11amRsNmtrVk9pWm0zTEtFQ1Y0?=
 =?utf-8?B?MGxVNVE0RWlxZTN3K0VsbFYyUitheE4rek05ZytTblUxeUZFZXg4NlhnSkZK?=
 =?utf-8?B?dkJJaHdjZHZ6R3pla1FOdkxUWHY5MXlEUVlYYlhRODdodmUxVU1VS3JzYVY0?=
 =?utf-8?B?a2hadllxcnlPOEZja1pIYXpqbWNkVFRZVXRYUWdPYXMzRjJlTytRRUlkTFkw?=
 =?utf-8?B?OHdnZHFQcitOT1JYNGFLaDBLbytidndZSDRqdE53MlR6M3NhSCt0VGdERldv?=
 =?utf-8?B?MWdwaTJpcVlvdzBGeFhjVUZMZjRXQmxIbmQyVkVaWlNsUzMyY1hWN3NVdkJL?=
 =?utf-8?B?MmdsdHVmMGV6QkZ0VUVSOUhQdHNMTmswbFFEMTN2T04xTGljT200ekRmRy85?=
 =?utf-8?Q?s48vJHCYx6E24r74=3D?=
X-Exchange-RoutingPolicyChecked: JC7z/7035C1Qya4DZJsbJFXC8U2jpUYRIeinaRAtJ5d2c0umLhadjSfL9Y6mY3o7hHaIszOhb1l+mwPg6AIRsOeaVAnezfxpvchm3XdratBte9VDbqXL/khRU2eTXyY9hDFm/RdVKtLhbbjxmD3mqltBBbMlqFEs5sAo4J76KPeKkdd78eDxFkj3jHI9tamS4OAGYAfvAcq0/1cZnHHmbuvfAc2hHDT/daF46LIYsNXLCw6hviAB8fihB0y96MlHtlThXQfjIlNvOk/gDCG1EmyPNm83+i8f6OCVpUp4beltFFxh8biqYT8x7NU8Q60a/VhwFb/NPscjMweOFuhisw==
X-MS-Exchange-CrossTenant-Network-Message-Id: facf8559-48c5-4d4d-65f3-08df29db3d23
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:09:31.1221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xCGF9p1ljuDIDnOdKe8SkyfJUQsnfich0Om/n0MJRfspkBhWrs5F85JaFQ683ekBrlNtN2iF6qZsKcKZJt1/N+aBfKP+4I3QLXHwYa0HqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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

Switch PF VF-context provisioning to explicitly allocate IDs from
the dedicated shareable ID pool.
Also, lets remove the legacy GuC ID reservation API now that all VFs
provisioning paths use the shareable allocation helpers.

v2: Use local variable for max shareable GuC IDs in fair profile (Satya)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 21 ++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 57 ++-----------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
 4 files changed, 24 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30f..4d72411cd570c 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 		.graphics_verx100 = 2001,
 	};
 	struct xe_vram_region *vram;
+	struct xe_guc_id_mgr *idm;
 	struct xe_device *xe;
 	struct xe_gt *gt;
 
@@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
+	idm = &gt->uc.guc.submission_state.idm;
+	mutex_init(&gt->uc.guc.submission_state.lock);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
 	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index de1ac58e31412..0a47458e5bf20 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_ID_MAX)
+	if (spare > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_ctxs(gt))
@@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	unsigned int spare = pf_get_spare_ctxs(gt);
 
-	return xe_guc_id_mgr_reserve(idm, num, spare);
+	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
 }
 
 static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
@@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_ctxs > GUC_ID_MAX)
+	if (num_ctxs > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (config->num_ctxs) {
@@ -1170,23 +1170,30 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
 
 static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
+	u32 max_shareable = xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm);
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
 
 	if (admin_only_pf && num_vfs == 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(max_shareable, SZ_1K);
 
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(max_shareable / num_vfs);
 }
 
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
+	u32 max_shareable = xe_guc_id_mgr_max_shareable(idm);
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
+	u32 fair;
 	int ret;
 
+	if (max_shareable <= spare)
+		return 0;
+
+	fair = (max_shareable - spare) / num_vfs;
+
 	for (; fair; --fair) {
-		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
+		ret = xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
 		if (ret < 0)
 			continue;
 		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 9bf9f0e5b7c28..7c7f5aaecfa06 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -120,9 +120,13 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
+ * xe_guc_id_mgr_init() - Initialize GuC ID manager for native.
  * @idm: the &xe_guc_id_mgr to initialize
  *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * No GuC context IDs will be reserved for sharing with VFs.
+ *
  * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -284,38 +288,6 @@ static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigne
 	return id;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
-				    unsigned int retain)
-{
-	unsigned int total = idm_total(idm);
-	int id;
-
-	idm_assert(idm, count);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (!total)
-		return -ENODATA;
-
-	if (retain) {
-		int err;
-
-		err = idm_check_quota(bitmap_weight(idm->bitmap, total), count, retain, total);
-		if (err)
-			return err;
-
-		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
-	} else {
-		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
-	}
-
-	if (id >= total)
-		return -ENOSPC;
-
-	bitmap_set(idm->bitmap, id, count);
-
-	return id;
-}
-
 static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
@@ -473,25 +445,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
-{
-	return idm_reserve_chunk_locked(idm, count, 0);
-}
-
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
-			  unsigned int retain)
-{
-	int ret;
-
-	idm_assert(idm, count);
-	idm_assert(idm, retain);
-
-	guard(mutex)(idm_mutex(idm));
-	ret = idm_reserve_chunk_locked(idm, count, retain);
-
-	return ret;
-}
-
 /**
  * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index ed9970829a939..844d68440b0af 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -31,8 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 					unsigned int count);
-- 
2.34.1

