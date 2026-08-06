Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A362C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 14:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC3810E332;
	Thu,  6 Aug 2026 14:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0l73nw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9685D10E332
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 14:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786025824; x=1817561824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Zp+CT9NrFwPpzj3xIrSm1t3xnSGHKhT3ouIQpcHky+o=;
 b=m0l73nw61ZHCCbxzw8s4IFqPEFcHox+PVoo7100YbuLp1V6kO7xfug6E
 yEXcNQ2kTF0Uuh5Lsi99c+QQd6n0rNqDBkLZHFX/orncPO9/WgRCzPYPA
 VpD0nSpE7hHcfi0JtJWo/iP8vtoKDWTxELg/y/t2nhKccy9xO2lZkHYF2
 P50CGJdbN85jhc1wwBH8m+Qr41eexcrh0SYpQjCTYJ31Ob+y7BpsMIdkn
 /nMtMwr8WIvPOU9IZz6pRHc2W8FdDTxVAlrSCjWgvjRxP5lrdHcLVzW69
 izw/YML8y2Wo3vjC1rHF0G1WSbwTUe8OgvWjgc1NvhDBrzg8ruNeOwOaA A==;
X-CSE-ConnectionGUID: uMXjniYzTWmSoxElJvIe/Q==
X-CSE-MsgGUID: fHa3QzRATe+exY7iwK2X2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90439240"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="90439240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:17:04 -0700
X-CSE-ConnectionGUID: gSfmXXZaTJyJ4kPOVLeKLg==
X-CSE-MsgGUID: dt6u0RqwTquHLq2+LZvZLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="262195656"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:17:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:17:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 07:17:03 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mK+BvYjEivmV0udO07SBMjJFsI88MIQw9BMU0payZcZZwFrs2DykB7TXF6VYzgeSGMhx3jtwMizCh9oEfX+k0aSzbTo+L0ZdEP8gxFygEZjBzjR1YyBR12HEq4yGpkPqUvpY8tQZhYEMYE+6MQSYzulkWZ4C0DSTYU1q/GufAWvLOEWG/j6hCE1FZ6SO7v2CSG8yYApKBiwjYW95o/iHUR5mK+lex8oSW3XbtZfQL0uehnHlgtA+yTNNF7RMS2Jlfs2+rwRzkygJf9xbuOcmQREzm0OCxMQQghcyOypk2qXp7GcXeJ9Ignvlrfiw3ztSRVCokWrEEkzBq4fI/MU0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z179JBBhpy7jjy7PKRtpqCqLJk4dsRpHURnzZob3C2k=;
 b=HcvQenyzf7N5tDqjoBrH8yWJsmoqs0DwTV1qKuTTht/emgqKy2JA7h3MB2gx9+kHX3qDEGrTWm4AP/Ty80+GIoEN/DiGiNNvmKhV6h6cpaaI7bU2nOpQwYjftmQbOtd99yCOVseDC6siiS08/E58hy0XthLEwuWyqFyl94cKHNnfUDYkN6zck4oKeo5YRZtZ+v6jOEiOVOFnzaezaEGlyWrf0oGqWDLmHMlRRgbzpdNu0aW5EkelMA+0DEI9lnnLtFecXo1BJMZEq6Kkc5AZovzrqD7JVckuiSbIQ5BNOOt7jr4XLrEIF6Gbr1xkRHx8014dOsdukzU8iUTrPzerYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 14:17:00 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 14:17:00 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 1/3] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Thu, 6 Aug 2026 16:16:38 +0200
Message-ID: <20260806141640.186830-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806141640.186830-1-piotr.piorkowski@intel.com>
References: <20260806141640.186830-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0180.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d202409-fb47-477c-9f5c-08def3c5617f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: c09NwMx8/mpb5raaWiS6ZCodGNIn48yfbwLDgIclMhQx5eMPskjRxdSJt8n4BDINpu+S5Ea6jAqO5Wm+4CHJPp5TX7QXZztbC7wdVkYGpTyPfC0001Kny1plUqm3Di1d03dOvM0lxAZ238+drv1tUXAfBfMU23JiqKow2OxbY8yKOHk0cpmbqn4Ce58WaCJFFuBoRlE7trkn8D08lbcgtM19BpXpS7YkcIP4uZK6hBapSiMQ/gNekuszjrP1gdrxxf86On5KhmSd9XfBzNjS4ZtaKwLGXlO6l82ZYA5hR6raEEXspzjRYhxRPnb0sxT1f61zyRz8QNfth8JVih4180UVEG5XjTeCc9sURShqP8mjCGmYH8usZUPfTFbdlyCjsCePaleG0PdRib1a/P+kDRQbXEm1F4camWGNmtcsUy4C69L1M3b20VlcQvRNvquZiUDQXIaW5wD4XxLPlBLkdP0W+/DuIwea/WxgvoFFLNRDx4sX2Dd6IFnky6oI9+1qxu+hBwZTisGAL26IYXivdFfx2GMnhiNnKD3/9WXXVjoPnQf+WA2+IFtUoNtQ1fFvciJMQXrdWg8MzPYgKpKkneENNf4Fo3QmgRFnkctbqDRDamGKo8djpkD1xtlrz6JFwW3L636kAvcRKco0MOui9m6wIoAuvEC2DQ/x/xGd1RM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZjNzRZRGJYYVprWWlxQld4ekJqaHoyMzVObHNJdkZ6b005NWswVW1Qa1Yy?=
 =?utf-8?B?NlNWU0svVGZZd2t4TXJKbjhvOGczR0JMREdqTTlmZVFHa0pNRHpzdWd3TVBM?=
 =?utf-8?B?TDBkSGlvYzF5a2M5Y0diZXRhRUdLVUxPRlZ4SVMzc3czeXEwdExUNVYvNHBZ?=
 =?utf-8?B?Q3ZGZGsveldhNnZSZm8wY2x5eFBNYWZnRmpmZEpwRVk3cURNOC8ycGkzd1kz?=
 =?utf-8?B?RXE0bmZYTys5dHl0WHhuRzB6WGIva01naFQxcGF4WkN1b1JKV0FrNnlubHF4?=
 =?utf-8?B?c05LVlMzMkZoV20yZlJzU0RUVE9rQnpqbTFWalNVRmRoWXJlNmJzZDcxd1hY?=
 =?utf-8?B?U3RzYWo3ek4rQjMwQVFkRlZpZ1hhYjJDT0FDazJ2TG1rSUdlMWVORG52U2Ny?=
 =?utf-8?B?aDF4WmgxYzVOMlhLRm5iUU93bjZhaFUzL1ZZSHIxSHNwZmtQbmJWRmFBdUY4?=
 =?utf-8?B?UmsrTytUSHByaG5mREl1Z0FoMks0VGpzWWhVcGM3Nm1VTlpzVi9ING01M3JL?=
 =?utf-8?B?Z0NmNlYyTDl5dXFsRS9yaHhabHVOdjBid1dJZndxc21WdVQxS3BYb2Z0UHBG?=
 =?utf-8?B?a2luZHEwR2lPMDRxRm9BeUtOL1k3cThwWmJTcGJWT0NBQlhacWtCSS9DTnE5?=
 =?utf-8?B?dFdwY1BlbEdKc3dITDZwRFRaZG93V3p0aDVBLzhBMVJpNTFSblB6TVFmVFgv?=
 =?utf-8?B?L2RrMHZTekF0Mm83aC9LSDdxTGpMbXFWbGEvOHFqWXJpNXBSOUczMzNvdi8w?=
 =?utf-8?B?Y0JYN092eHpQZno0VnNBMDEybHRXRkNsTEdEV0V3SURGZFpWOGM2SFZNaHpt?=
 =?utf-8?B?R3BLckdnZndRbjE3aXdXdUErUXNLN002RzlHQTN2eCtJUTZ3eUpQRS9XdTJ0?=
 =?utf-8?B?dGZ5YVJSS3RNamRGb0M4dEt2eFMwcFJadmNDcjcwU25qL0diZGorZGlOdjVi?=
 =?utf-8?B?SlZzUDdOdk5WZEpzR2FmSTVzZGpzb2NldTNaRlRSbUlOZGhCejFBYzBmMnZI?=
 =?utf-8?B?Y0ZWdzNEN0NjRDIxbnZUSGRIUW5HQ0UzV3ZpMTl1TjVxUHV6ejhUend0UDQv?=
 =?utf-8?B?OHNVV1RWakFEK0pjZUQvYW50WGVhRE1lNHptM2JDUk1NTXpxV21KQ2lMaWNh?=
 =?utf-8?B?VDZxSncyckFnb1RxV1Y1dlFKNlZrMUFUampOeFN1THFiRFpndGVUQ01qdzlx?=
 =?utf-8?B?aHc0cTRpZmNwZDQxY0dkeHQxN2Z2aTVMYjR3VDNPTytES3dYUVFYMlh6dUpz?=
 =?utf-8?B?Z1FYUTJsZU5rUG96QmpwMlVEOVlVOC9zY0RnOHViSjNndU1HbHl0TmZKSDVr?=
 =?utf-8?B?VU5DOTJndWo2NGNTVFYydlZrYnFjRDhmY2dlUklNWFFZUzZUZFYrZXJhOGJL?=
 =?utf-8?B?RTh5U0FudXVhcjRDUERVQ2lNNHhpamxyZmo0RWFia09VZzhtYi85MU1rTzJH?=
 =?utf-8?B?K1h4RWNNNjlUNzFaQVprWG1zL3B2VVlYVHAwUnR2ZTR1VlpFMURrdDVEVTk3?=
 =?utf-8?B?NmNxekdQSFpnSmpHTUdac3MvRXQ0ckZBKzZJb3RFcUgvZERKRzVGaGdobVU0?=
 =?utf-8?B?aVkzYVgyQ3NhaC93VDBBbVczdlZZa0V2WFF2MCsrVTBpYUo3U0pRTVF2Wk00?=
 =?utf-8?B?alBQUXAyZHhRWEVNTlNiMnE3UVZoNXo3K1lsZURBdTdxUUgvamJNa2UvNEds?=
 =?utf-8?B?RGUrc2JIQWJmRXRveENJTUlwWDRYSXoyMkd5ZnhlRmo2Q0JjczY5VzA2VDl5?=
 =?utf-8?B?TDllSGF6YVRKaWNWN0xsRzBSSytoTXV0aEtMVFYwSXNmdm4xZ1RnWGQwOE1j?=
 =?utf-8?B?ZkQzTWlnQVdtcXhJZVhNNGMvZ3kzZjdlSHR3aVloampYVVVJWWhMcThtWU5G?=
 =?utf-8?B?NWVuK3lnOUlRa3BOWVZrWms0bGVRb01JbGt2eC9zbHY3Q3B5M0M3S0w5NmxR?=
 =?utf-8?B?WWNUTHVoTzFXclJnRWNuZkpTQXhHUW5mL1Y0UGdseWtOKzlmalZwY3VDelZ1?=
 =?utf-8?B?WDU2d2FVV2xQZGoyb1FSQ2ZZcExrTC9QN2FvMk1BUCs4SEdOQjBRM3grK0lE?=
 =?utf-8?B?b29lOS94eDNhdzN1SEJyTnlRZ24vdTBOTDRoSXFFR3JSSk0yeVVmQUhQOTZz?=
 =?utf-8?B?ZzE4M3Q1N3JuTkhIMkVnYlVEU09raGF4ekNrc290NFBXQnkwbUE4V2dCblRk?=
 =?utf-8?B?UThWUTFxTWNsZGlzaSt6bTZuOTI1WUlZSzNod2gybUVVS3NKYTdPK3BJc2U4?=
 =?utf-8?B?R0Z6VXpJMU51Z1RPZ3V3VmpWNHVyNGhKT2YwcHkrOHc5VXNaS3VXU3lQRCsw?=
 =?utf-8?B?aFg0YmtBMUZHT2lWbTBtRzJXQWxLMkxDck9IYWVKZzZtTHI4SDhjcUVCUlZm?=
 =?utf-8?Q?eKHLMFyz76WDKOQE=3D?=
X-Exchange-RoutingPolicyChecked: TF5YHKAMGMnwMxo/MhPW9DoEoPuWxcNJlR8r+t3D7ACWz/P2zgDyWG7MdvcpxM3AUY6l7RO/PdyZczhUOl8/rMxbKvySL/rsHB9Dozk26vCxmjJpS25oAvsBa/uJvMgcH55+RfN5AnxSPnHmBU9BWCnLIIrUSbIOu3IC2MjLbB5rqrnsa43UfSIoJpQlVxseszPFa6fEqAFgyYh0+SJwDNGngFhza4Fx24NYOZaKnb0iqAQO6QrHYCiv8i5BJlFN+5jwo1+OolhwOztBTymYmw7J6eGBlp77Um16P5Wumu1ABATzcUof1YO0GhIbmOR80zMhJUvjQO8/uGGimaCn1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d202409-fb47-477c-9f5c-08def3c5617f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:17:00.5968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6Ku2I0XmvFxrpUcdnAO9glPyHYA+ryuys3QM50XVDGXvkhcH+zhGogXXPFOPHPzp38AhxvznIDY0KdkF0kZBPToPscnchqVmlpHPdE+Nj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
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

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools, together
with shareable hole-reporting helpers used by SR-IOV PF provisioning.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 193 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
 3 files changed, 184 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..a4a8d34f0f82 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -113,8 +113,8 @@ struct xe_ggtt {
 	struct xe_tile *tile;
 	/** @start: Start offset of GGTT */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
-	u64 size;
+	/** @size_usable: Size of the usable allocation range */
+	u64 size_usable;
 	/**
 	 * @flags: Flags for this GGTT.
 	 * Acceptable flags:
@@ -141,6 +141,15 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable: Shareable range within GGTT */
+	struct {
+		/** @start: Shareable range start relative to @mm start */
+		u64 start;
+		/** @size: Shareable range size */
+		u64 size;
+	} shareable;
+#endif
 };
 
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
@@ -232,13 +241,13 @@ u64 xe_ggtt_start(struct xe_ggtt *ggtt)
  */
 u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 {
-	return ggtt->size;
+	return ggtt->size_usable;
 }
 
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size_usable);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -252,7 +261,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size_usable);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -354,16 +363,46 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static u64 ggtt_accessible_size(struct xe_ggtt *ggtt)
+{
+	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(ggtt->tile));
+}
+
+static u64 ggtt_total_size(struct xe_ggtt *ggtt)
+{
+	u64 total_size = ggtt->size_usable;
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable.size > 0)
+		total_size = max(total_size, ggtt->shareable.start + ggtt->shareable.size);
+#endif
+	return total_size;
+}
+
+static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
+				 u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+	u64 accessible_size = ggtt_accessible_size(ggtt);
+
+	xe_gt_assert(gt, usable_size);
+	xe_gt_assert(gt, usable_size <= accessible_size);
+
 	ggtt->start = start;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->size_usable = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	xe_gt_assert(gt, shareable_size <= accessible_size);
+
+	ggtt->shareable.start = accessible_size - shareable_size;
+	ggtt->shareable.size = shareable_size;
+	xe_gt_assert(gt, ggtt->shareable.start + ggtt->shareable.size <= accessible_size);
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt_total_size(ggtt));
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	__xe_ggtt_init_early(ggtt, start, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -438,7 +477,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -609,17 +648,49 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 	guard(mutex)(&ggtt->lock);
 
 	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
-	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+	xe_tile_assert(ggtt->tile, new_start + ggtt->size_usable <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable.size == 0);
+#endif
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
-				      u32 size, u32 align, u32 mm_flags)
+static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					    u32 align, u64 range_start,
+					    u64 range_size, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 range_end = range_start + range_size;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!range_size || range_end <= range_start)
+		return -EINVAL;
+
+	if (range_end > ggtt_total_size(ggtt))
+		return -ERANGE;
+
+	if (size > range_size)
+		return -ENOSPC;
+
+	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
+					  range_start, range_end, mm_flags);
+}
+
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+	u32 mm_flags = DRM_MM_INSERT_HIGH;
+
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable.size > 0)
+		mm_flags = DRM_MM_INSERT_LOW;
+#endif
+
+	return ggtt_insert_node_in_range_locked(node, size, align, 0,
+						ggtt->size_usable, mm_flags);
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -635,13 +706,41 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
 	return node;
 }
 
+static struct xe_ggtt_node *ggtt_insert_node_in_range(struct xe_ggtt *ggtt, u32 size,
+						      u32 align, u64 range_start, u64 range_size,
+						      u32 mm_flags)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align, range_start,
+					       range_size, mm_flags);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
+}
+
 /**
  * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt into which the node should be inserted.
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Inserts a node into the usable GGTT range.
+ * When a shareable range exists, allocations start from the bottom
+ * (DRM_MM_INSERT_LOW) to leave space at the top. Otherwise allocations
+ * start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an error on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -653,8 +752,8 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -663,6 +762,30 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 	return node;
 }
 
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_ggtt_insert_node_shareable - Insert a &xe_ggtt_node into shareable range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Inserts a node into the shareable GGTT range.
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an error on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	if (!ggtt->shareable.size)
+		return ERR_PTR(-ENOSPC);
+
+	return ggtt_insert_node_in_range(ggtt, size, align,
+					 ggtt->shareable.start,
+					 ggtt->shareable.size,
+					 DRM_MM_INSERT_HIGH);
+}
+#endif
+
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
  * @node: the &xe_ggtt_node
@@ -745,6 +868,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -765,7 +889,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -906,24 +1030,30 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
+#ifdef CONFIG_PCI_IOV
 /**
- * xe_ggtt_largest_hole - Largest GGTT hole
+ * xe_ggtt_largest_shareable_hole - Largest hole within the shareable range
  * @ggtt: the &xe_ggtt that will be inspected
  * @alignment: minimum alignment
  * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
  *
- * Return: size of the largest continuous GGTT region
+ * Only holes within the shareable range are considered.
+ *
+ * Return: size of the largest continuous shareable GGTT region
  */
-u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
+u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 hole_start, hole_end, hole_size;
+	u64 shareable_start = ggtt->shareable.start;
+	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
 	u64 max_hole = 0;
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, ggtt->start);
+		hole_start = max(hole_start, shareable_start);
+		hole_end = min(hole_end, shareable_end);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -939,7 +1069,6 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 	return max_hole;
 }
 
-#ifdef CONFIG_PCI_IOV
 static u64 xe_encode_vfid_pte(u16 vfid)
 {
 	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
@@ -1078,27 +1207,32 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 	return err;
 }
 
+#ifdef CONFIG_PCI_IOV
 /**
- * xe_ggtt_print_holes - Print holes
+ * xe_ggtt_print_shareable_holes - Print holes within the shareable range
  * @ggtt: the &xe_ggtt to be inspected
  * @alignment: min alignment
  * @p: the &drm_printer
  *
- * Print GGTT ranges that are available and return total size available.
+ * Print GGTT ranges that are available within the shareable range and return
+ * total size available.
  *
- * Return: Total available size.
+ * Return: Total available shareable size.
  */
-u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
+u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 hole_start, hole_end, hole_size;
+	u64 shareable_start = ggtt->shareable.start;
+	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
 	u64 total = 0;
 	char buf[10];
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, ggtt->start);
+		hole_start = max(hole_start, shareable_start);
+		hole_end = min(hole_end, shareable_end);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -1115,6 +1249,7 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+#endif
 
 /**
  * xe_ggtt_encode_pte_flags - Get PTE encoding flags for BO
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a69..c441e39fdd47 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,16 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#else
+static inline struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
@@ -36,12 +46,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *e
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end, struct drm_exec *exec);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
-u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
+u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
+u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
 int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
 int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2c9b85b84b1b..baed91d2bfd8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -531,9 +531,13 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	node = xe_ggtt_insert_node(ggtt, size, alignment);
-	if (IS_ERR(node))
+	node = xe_ggtt_insert_node_shareable(ggtt, size, alignment);
+	if (IS_ERR(node)) {
+		xe_gt_sriov_dbg_verbose(gt,
+					"VF%u GGTT provisioning failed: no shareable range\n",
+					vfid);
 		return PTR_ERR(node);
+	}
 
 	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
@@ -711,7 +715,7 @@ static u64 pf_get_max_ggtt(struct xe_gt *gt)
 	u64 spare = pf_get_spare_ggtt(gt);
 	u64 max_hole;
 
-	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
+	max_hole = xe_ggtt_largest_shareable_hole(ggtt, alignment, &spare);
 
 	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
 				max_hole / SZ_1K, spare / SZ_1K);
@@ -3498,7 +3502,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 
 	spare = pf_get_spare_ggtt(gt);
-	total = xe_ggtt_print_holes(ggtt, alignment, p);
+	total = xe_ggtt_print_shareable_holes(ggtt, alignment, p);
 
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
-- 
2.34.1

