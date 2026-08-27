Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0723FC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4F810EDB2;
	Thu, 27 Aug 2026 10:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJL7lqj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD2510EDB2
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828293; x=1819364293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=doyPXK+RuAG1DKX51zjxemk1RjUVV1KsYjk10HVEpGQ=;
 b=HJL7lqj+gmZEFfPOPfZ42Cbw6AkJ9M0nIKLmEs9memmF2HjsoMbMhOIf
 sBcNwkbJXdwaRI3DI3ArZKyEM/TSiyY5yTN2KwEQU6klik86brJoQUP7Y
 q7KqEo5svWFSvKO0HtzLyo2MbLBSg18A2s+xEIJDbleoEdRzneTMS709X
 YgNHz7t0kggyels40Py4NDwmoyC/4Job9wICDVf1wTDvGR9XwYsmJzf77
 gLcT0CrwsneE9Fpow01hfSCe15EVoFFVLlI87HR2Yor0MzvJ63k+4P3WX
 2H+8YjIrmB9R0AsLGQyUhKLSxtJDrj7u5/J5KLCkMIWkuS5ACq0igBhjy A==;
X-CSE-ConnectionGUID: 95YaTB2HQf25YsXxDhAfAg==
X-CSE-MsgGUID: 2OVfTK34TceHE8Yrj5UyJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98659971"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98659971"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:12 -0700
X-CSE-ConnectionGUID: mys7bznYTY6Y/0nLRnQn0g==
X-CSE-MsgGUID: QpPd+upHTDKVbvIv8VLKkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="273099200"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:58:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:58:11 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7tubUj3uIgQ2VKw9341nvkb5LiZ7GkbSP0BUXVqvEdI+CmE/wUp1ozJgJ/E+Zhbnzc/OSVBYUJaLiDuVuzoROEzyNwd/R6Aivw/7vk3f89WoXuWkQgTPvSTApwQoMoWT4bL6upIoXUZOMsFuWOrruk8exWOPg5UnUEtDvOTid284W/0bJkDMKVU2T0ft9r7lSwFNIggih91XtlYoJpdRgfipw98sSUjhOu1pNoO/Ze0lWQ8XaeMSX2bMkRY65HIiS/VH7bf70R/iXEBI3uzJh1PvlTgSAcy9tnyWzQWxvdEiBozCu78xYwbwfUDKXcbpp9QZ2g0Z5V1GHWxyd0pyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lUjTv9KwirXmAqQLuX79cNarwGF3AnN4A4RkuqoNss=;
 b=Yd1DdcqP9hqSvoPNp/9o5dVRLAY6Bg0mBpPhuSgajOBrbHf/I/fIdiDPPnpj10yEjMDusMlwtaTl2PaX+IjYW+g1TfZh3zKeS3+Bb6ErrTjtwFzDPqrUWnUKHa1ukCg4nWyd4tdASTA7CrpD9TtPVcd2iLigueBXZIumZ8AMwA3G4xEWNFtskSN5b3x6NZe3Q6NELcRS0cGrShf7K+YSLjqNHTtVOSOAK6pUirWTo5gRIFAzL54+6G5zzcbKv9aVhxlOnvJDHm5gQ0WadEpIg7ranIVT1KrIsp0Vl7+ZNrod/eEIdLYgfx1JRxQ5uEZwLstPaI5x04bWLWEZJQGCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Thu, 27 Aug
 2026 10:58:03 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:58:03 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v4 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
Date: Thu, 27 Aug 2026 12:57:47 +0200
Message-ID: <20260827105750.1248792-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
References: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: ed098047-0154-49f5-6d1b-08df042a1135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|10067099003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yMYYXar97HMCaxgmg/GPWfhD3L8AOre3fZRbcyGV7qgaJtN9ZxqBRQLnK9JY8VvZ+50/8tSdC7WoxERyDKeAKmazoul4ZQ8ks8zLsrU50hllzHAg90r/iNfd0swa8DVyuSbGWSMkqTMgma2/8tLpfbI4HEIQ7quR4jq6jm4ZBCweDf/XPV3CqFGb9Pz2/kTcu37DDN0aSctLGv48Ne4ByoXswyN48/kxky8N5DM+ocwuwpbLqjV5JnoNqr2PTpvq8C/etvVNYVPB9lpkXqWFr6bDaGao1CS7mXqXoRyeicBm64un4ztbGCmEzSKdX9XoE54xSdOV1MivXGfGolk6m8b7Jxh1AbcSIawF2OhMt4NIPlVCCiBAKVCKaF1FIvRNT9BevcA1zZbqMmjv5JcaM+SSWQD2T7jx0d3L5FZQjP7bQIoCa34aFGgiNNYcQMDyTVGbJz9wPqrsan1lJYdBDdg+fi9s9ny3dKx0x948v7Bu6ez2YKSBzSZ3bczAaUUgbQFNNTGBKavtqzSrb+ObXgEF9E+e0ynVy9zaIBqn9uWJKwjdkm/+cE+88emAcF6angorN+cxYrT6s0DkZudiIHkvVY1uuDvJQWbzs3D3wDglMRwg0NecxTmg9HUMbH2Ybjt7s8shNBM2+8yBXKQED16wff4hFDeXe119T80F0bw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1pPNEljVDJuWGYxcjBMWVdFdlUrdnN1djI4bWlzaTF5T29Rc1NpQVBwbXZh?=
 =?utf-8?B?d256V0NncnVZWmMrVndFeElmYmh2cElaZFNram5LSXlJL0dHTW05b1pLZGpL?=
 =?utf-8?B?K3laRTlrSkN4UW9XYUhmSHZ0MXJ0d3VLVEMyY1krcVBZUzVTbDVxRWR4Q0M2?=
 =?utf-8?B?MzU0RThBQlJUclZLRW5BUVc3T0lENG5nTThHTFkzSFhNZnhvWXBhQXBjS2V4?=
 =?utf-8?B?VUJqVVkwODF4QXJsd2o3akYxdk0zbXNXTFcxRmpJY2NNemwrZ3RmLzk5amRw?=
 =?utf-8?B?WEdEeXpsTWZMZzh2anFxaWdoTDBSZ2tOY29ndy9DT0M5NlU4Qm5BbFVqWk9t?=
 =?utf-8?B?Y2FYVXROeTduTFAxUjlGaTcwdlV6Q2svWFRTR1hibllMOGpBTWlQSm5uVXFx?=
 =?utf-8?B?R3BTZ0lldjJEQnRyekdLeU5zcHhqb1BRT1ovRWhkUnY3NWl6RVZxMVorOXoz?=
 =?utf-8?B?djhpcFdBOTNkRnhhT09JNXo4ZldtVUdSZ3FuMndJallOcUx3MSswSi9wbGlT?=
 =?utf-8?B?aS8yK09qSTRhMGRFdllPbWdMK1J6MkF0V2JCYzdQY1QvaDA5aDVKcnJacnhl?=
 =?utf-8?B?YUtLd1JNeTdlbTM2TUNvRmFidXNMSUxQSXE2WTJzTWxoNzk3ZjBleUNXU0ZJ?=
 =?utf-8?B?bHVpa0NmemY3ZzZxOFQ3dGRtYktTM3RTSDBZUlJMbWtQNi9LV1VXMjVGcW1i?=
 =?utf-8?B?VnM4cnViSy9MVElXMHVPZ3R0R0w4NTdCSUVZbUNzSVlIc3ZpeUdxRTRrZDc5?=
 =?utf-8?B?d1pSQ01ORFdaWlhQMUE2K00ySDIrVmpYZDljYVk1UzJ0K1FtS2VydW5MZFpK?=
 =?utf-8?B?VUNBbEpBemU4cDRCZXppUGptaHZlcnp1Q3JhcXdIV0JSZ2VUcjRqaTg5TEI5?=
 =?utf-8?B?cWN6NkZaTkw1aldyNFVUTEpGL25ObXMvZFhJdzQ3bmpWQzRxZm1lamk5anJX?=
 =?utf-8?B?TXpGMGhPVlRDZ0JaaXd2MnA4MmVHUW1QN3U0NVM1VGV3UmhxK3VHTE1KZU92?=
 =?utf-8?B?WHdaZ2ZDTUJRMERzQnhWZGZnYXBOM2NMYm1oWlFidzZWOG8zejkvNmxKdVNC?=
 =?utf-8?B?dGxJd3NUTkxiQkgrSUNXbWtDNm4waVdvK005UVlTV0FUeHgwZzFyN2gwZVZB?=
 =?utf-8?B?bk1aRmF2aVdwSUM4SVozS0c4T29tYUEyNEE1RnZITjJTVkpvTkl6bThwYUpx?=
 =?utf-8?B?azEyakRFd1FtWms4eWZkeUJ0aVovTDNiamxkMzRqNFNkL2JXTnlQRmFjS3N1?=
 =?utf-8?B?U2s5Tmp5VjBZNkVOT2s4ZzZqZWs3bWtySWFIeVo0QnVJc216dVBYdWNOQTVT?=
 =?utf-8?B?czNLQmJ2bWU2TlZSNE8raWRhekw0eGEzSlQ3cHFDWmd1RmdJR1hYMmhNY2hS?=
 =?utf-8?B?YWxIZmJiRzNaUlcwdjdWWDNhZDNtNkZ4djZiUytjcnRmdm1hZmxuV0Q4blhI?=
 =?utf-8?B?dVdaQWpkdER5Mmhva2pDcHBPenNFbFJEWFAzYTRybXh6M2hVTlFZM1c3cjdL?=
 =?utf-8?B?dDB4MDlaTm1TejludDl5ME9KcnhoUTRWdUliandkbjVwYVpUZWcrY3o4WXpz?=
 =?utf-8?B?K2dWbmV4YlhIVjE1Ti9nTENNZ0UrNWYxRGdxajhQZW4ybXM1Z09FTGRuMTNk?=
 =?utf-8?B?WkhidVN4dHFnbjY4YmpRZXpVNXZOV2xSV2Z4aGg3dzFsRnBNVHFwZ3Bqb1du?=
 =?utf-8?B?VEdiZndWNURkZlVoYVMwWVpZc1hDcyt6emFmMllRN1ZIeTRGbXk3dnhCRkhU?=
 =?utf-8?B?ZkxUc3kxVm84a2pIclEvbHRid09WYVFCaENYUE94VmdZbUNXdjZRN0ZPQ1E4?=
 =?utf-8?B?b0w4Q0VhNVBhazZnRUxoYW9VcVhzYU5BTFlERWQ4ekJPYkVaTWI5V1pHcUVz?=
 =?utf-8?B?Vm9zc2NyQ203ajNRWjZENzYrTlV2NHM4cS9scDQwNFJacUJ6MGE2a1RpOFFO?=
 =?utf-8?B?cFNFbzYwTUFOYndrREk0LzAvNGVvTC9vcTZaalVTazNGNnhlRHVVSjI4bzFH?=
 =?utf-8?B?WS9CNDd3WEE2L1E3Z3NPUnZCdmhmWlV1UXR0cStPVDg5ZXhTY2J1cUxEc1JW?=
 =?utf-8?B?UU9hQ3BIL1ZURDMzYUZXVnhLUlRuSjNwd0d5ekRNcXpSSkYyZWErWDFKUlhL?=
 =?utf-8?B?SGY0OXp5Y0c3alZybXlwbWtSUUxrZ01XV08wRVFjc2ozUk85SmhmbEJONndp?=
 =?utf-8?B?TjNwYXNBQ054ait5L2w0MnRURlVJZ0QvcGY4SmwyNmVBYzdVVDU2SWtzS0lz?=
 =?utf-8?B?a0FaTUNwTVA0aGxPTjdVcXVqV0t1UWs4NzR4YVpNZjBtVUMxMG52eEJCc1FJ?=
 =?utf-8?B?RFlCYkxkOU5NK1luUFdoK1dhaDFiSlhKZlQwdGpZZGdnL3E2WDhMU2dpUm5T?=
 =?utf-8?Q?ykN1WgLDvLsQRMrE=3D?=
X-Exchange-RoutingPolicyChecked: eUt7YqfVNC1lcNIuxtjwDv6tywFGOc5zP07+3ea30A4/2jxy7WuxF1t/an6M7vn96+01gT/jb9AcR+j6SJgZ9RZYHJLwKNWzSjLinW4+5XCgCL7m0OHtYgQypX+PkBvsLh4SEinKETP37tbXWMZhyi5lKSPV5sxUOKoIRydkXFbks/ppAVk7lcAuobB6YP8K8+VGUV902UsTf0tshlbcE0w/IRqlD38FlulqLuUfnUCyb2MG06fOOs4RCIqmd35dybYi8cLlTs6+/61M8kCdz2QXlQjYo1cxYOHzfJx/uRg6ilyCYXUTPFTcmqfrHOGGw8v5vNJX/pTmWRSY5d8H+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed098047-0154-49f5-6d1b-08df042a1135
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:58:03.6619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qps0t+Tyf7QZTjwENs+NeqjdY+f457FS1X+mW0ZFHFvFiyTr4ng0jbcJuvaHbI6mO3qA/loYtyhKTdWMyoNvqg9RcYeW9XxKcewrdoernj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
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

Modify the GuC identifier manager so that it distinguishes between
usable GuC IDs allocated for GuC submissions, and shareable those that
can be shared with VFs. Both pools are represented as a single bitmap
and may overlap.
Let's Replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, and update
debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same GuC ID space. This prepares the ID manager for separate
management of submission IDs and VF allocations in following changes.

v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)

v3: Fix shareable spare quota accounting to include
    PF-exclusive usable IDs.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 445 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 5 files changed, 410 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..78d3de46b757 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
 }
 
 static void no_init(struct kunit *test)
@@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
 	__fini_idm(NULL, idm);
 	KUNIT_EXPECT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
 static void check_used(struct kunit *test)
@@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++) {
+	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm->used, n);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
-		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->used);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,25 +76,12 @@ static void check_used(struct kunit *test)
 static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
-	unsigned int n;
-
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
 
-	mutex_lock(idm_mutex(idm));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
-	for (n = 0; n < idm->total - 1; n++) {
-		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
-	}
-	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->total);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
-
-	mutex_unlock(idm_mutex(idm));
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
 }
 
 static void check_all(struct kunit *test)
@@ -102,14 +89,14 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++)
-		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	for (n = 0; n < idm->total; n++)
+	for (n = 0; n < idm_total(idm); n++)
+		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index be0a413ee17c..9445e5f32fe8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670b..2c181d280552 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -34,6 +34,34 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
+static unsigned int idm_total(struct xe_guc_id_mgr *idm)
+{
+	if (idm->usable > GUC_ID_MAX - idm->shareable)
+		return GUC_ID_MAX;
+
+	return idm->usable + idm->shareable;
+}
+
+static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
+{
+	return idm_total(idm) - idm->shareable;
+}
+
+static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm->usable);
+}
+
+static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm)) -
+	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
+}
+
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -41,25 +69,60 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 	mutex_lock(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
+		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
 
 		if (weight) {
 			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
 
 			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
-				  weight, idm->total);
+				  weight, idm_total(idm));
 			idm_print_locked(idm, &p, 1);
 		}
 	}
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
-	idm->total = 0;
-	idm->used = 0;
+	idm->usable = 0;
+	idm->shareable = 0;
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
+{
+	bool overlap = usable > GUC_ID_MAX - shareable;
+	unsigned int total;
+	int ret;
+
+	if (!usable)
+		return -EINVAL;
+	if (usable > GUC_ID_MAX)
+		return -ERANGE;
+	if (shareable > GUC_ID_MAX)
+		return -ERANGE;
+
+	idm_assert(idm, !idm->bitmap);
+	idm_assert(idm, usable <= GUC_ID_MAX);
+	idm_assert(idm, shareable <= GUC_ID_MAX);
+	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
+	total = overlap ? GUC_ID_MAX : usable + shareable;
+
+	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
+	if (!idm->bitmap)
+		return -ENOMEM;
+
+	idm->usable = usable;
+	idm->shareable = shareable;
+
+	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
+	if (ret)
+		return ret;
+
+	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
+		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
+	return 0;
+}
+
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
@@ -68,19 +131,10 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
  * context IDs supported by the GuC firmware are available for use.
  *
- * Only VF drivers will have to provide explicit number of context IDs
- * that they can use.
- *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 {
-	int ret;
-
-	idm_assert(idm, !idm->bitmap);
-	idm_assert(idm, !idm->total);
-	idm_assert(idm, !idm->used);
-
 	if (limit == ~0)
 		limit = GUC_ID_MAX;
 	else if (limit > GUC_ID_MAX)
@@ -88,70 +142,149 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 	else if (!limit)
 		return -EINVAL;
 
-	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
-	if (!idm->bitmap)
-		return -ENOMEM;
-	idm->total = limit;
+	return idm_init(idm, limit, 0);
+}
 
-	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
-	if (ret)
-		return ret;
+/**
+ * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
+ */
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
+{
+	return idm->usable;
+}
 
-	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
-		  idm->total, str_plural(idm->total));
-	return 0;
+/**
+ * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be shared with VFs.
+ */
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
+{
+	return idm->shareable;
 }
 
-static unsigned int find_last_zero_area(unsigned long *bitmap,
-					unsigned int total,
-					unsigned int count)
+static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->usable)
+		return -ENODATA;
+
+	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
+	if (id >= idm->usable)
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
+						     unsigned int range_start,
+						     unsigned int range_end,
+						     unsigned int count)
 {
-	unsigned int found = total;
-	unsigned int rs, re, range;
+	unsigned int found = range_end;
+	unsigned int rs, re;
+
+	for_each_clear_bitrange(rs, re, bitmap, range_end) {
+		unsigned int start = max(rs, range_start);
+		unsigned int end = min(re, range_end);
+		unsigned int range;
 
-	for_each_clear_bitrange(rs, re, bitmap, total) {
-		range = re - rs;
+		if (start >= end)
+			continue;
+
+		range = end - start;
 		if (range < count)
 			continue;
-		found = rs + (range - count);
+
+		found = start + (range - count);
 	}
+
 	return found;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
-				    unsigned int count, unsigned int retain)
+static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					      unsigned int spare)
 {
+	unsigned int shareable_start = idm_shareable_start(idm);
+	unsigned int total = idm_total(idm);
 	int id;
 
 	idm_assert(idm, count);
 	lockdep_assert_held(idm_mutex(idm));
 
-	if (!idm->total)
+	if (!idm->shareable)
 		return -ENODATA;
 
-	if (retain) {
+	if (shareable_start < idm->usable) {
 		/*
-		 * For IDs reservations (used on PF for VFs) we want to make
-		 * sure there will be at least 'retain' available for the PF
+		 * Spare is meaningful only for IDs that are shared between usable and
+		 * shareable pools. For non-overlapping pools, shareable reservations do
+		 * not reduce PF usable capacity, so there is nothing to retain.
 		 */
-		if (idm->used + count + retain > idm->total)
+		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
+		if (id >= total)
+			return -ENOSPC;
+
+		if (spare) {
+			unsigned int used_usable = bitmap_weight(idm->bitmap, idm->usable);
+			unsigned int overlap_start = max_t(int, id, shareable_start);
+			unsigned int overlap_end = min(id + count, idm->usable);
+			unsigned int need_overlap = overlap_end > overlap_start ?
+						    overlap_end - overlap_start : 0;
+
+			if (used_usable + need_overlap + spare > idm->usable)
+				return -EDQUOT;
+		}
+	} else {
+		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
+		if (id + count > total)
+			return -ENOSPC;
+		if (id < shareable_start)
+			return -ENOSPC;
+	}
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int retain)
+{
+	unsigned int total = idm_total(idm);
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!total)
+		return -ENODATA;
+
+	if (retain) {
+		unsigned int used = bitmap_weight(idm->bitmap, total);
+
+		if (used + count + retain > total)
 			return -EDQUOT;
-		/*
-		 * ... and we want to reserve highest IDs close to the end.
-		 */
-		id = find_last_zero_area(idm->bitmap, idm->total, count);
+
+		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
 	} else {
-		/*
-		 * For regular IDs reservations (used by submission code)
-		 * we start searching from the lower range of IDs.
-		 */
-		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
+		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
 	}
-	if (id >= idm->total)
+
+	if (id >= total)
 		return -ENOSPC;
 
 	bitmap_set(idm->bitmap, id, count);
-	idm->used += count;
 
 	return id;
 }
@@ -160,9 +293,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
 	idm_assert(idm, count);
-	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
+	idm_assert(idm, start < idm_total(idm));
+	idm_assert(idm, start + count - 1 < idm_total(idm));
 	lockdep_assert_held(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -172,22 +304,61 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 			idm_assert(idm, test_bit(start + n, idm->bitmap));
 	}
 	bitmap_clear(idm->bitmap, start, count);
-	idm->used -= count;
+}
+
+static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
+					     unsigned int start,
+					     unsigned int count,
+					     unsigned int range_start,
+					     unsigned int range_end)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!count)
+		return -EINVAL;
+
+	if (start < range_start || start >= range_end)
+		return -ERANGE;
+
+	if (count > range_end - start)
+		return -ERANGE;
+
+	idm_release_chunk_locked(idm, start, count);
+
+	return 0;
 }
 
 /**
- * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
+ * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of IDs to allocate (can't be 0)
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
  *
- * This function is dedicated for the use by the GuC submission code,
- * where submission lock is already taken.
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
  * Return: ID of allocated GuC context or a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
 {
-	return idm_reserve_chunk_locked(idm, count, 0);
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous. The function expects that the
+ * caller has already taken the lock.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare)
+{
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
 /**
@@ -206,60 +377,175 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 }
 
 /**
- * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
+ * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
- * This function is dedicated for the use by the PF driver which expects that
- * reserved range of IDs will be contiguous and that there will be at least
- * &retain IDs still available for the PF after this reservation.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable_locked() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count,
+						 idm_shareable_start(idm), idm_total(idm));
+}
+
+/**
+ * xe_guc_id_mgr_reserve_usable() - Reserve one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable() - Reserve one or more shareable GuC context IDs for VFs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous.
  *
  * Return: starting ID of the allocated GuC context ID range or
  *         a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
-			  unsigned int count, unsigned int retain)
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
+}
+
+int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_reserve_chunk_locked(idm, count, 0);
+}
+
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
+			  unsigned int retain)
 {
 	int ret;
 
 	idm_assert(idm, count);
 	idm_assert(idm, retain);
 
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	ret = idm_reserve_chunk_locked(idm, count, retain);
-	mutex_unlock(idm_mutex(idm));
 
 	return ret;
 }
 
 /**
- * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
+ * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @start: the starting ID of GuC context range to release
+ * @start: the first GuC context ID to release
  * @count: number of GuC context IDs to release
  */
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
 			   unsigned int start, unsigned int count)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
+
 	idm_release_chunk_locked(idm, start, count);
-	mutex_unlock(idm_mutex(idm));
 }
 
-static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+/**
+ * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
+}
+
+static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
+				   struct drm_printer *p,
+				   int indent,
+				   const char *name,
+				   unsigned int range_start,
+				   unsigned int range_end,
+				   unsigned int used)
 {
 	unsigned int rs, re;
 
 	lockdep_assert_held(idm_mutex(idm));
 
-	drm_printf_indent(p, indent, "total %u\n", idm->total);
+	drm_printf_indent(p, indent, "%s used %u\n", name, used);
+	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
+		rs = max(rs, range_start);
+		re = min(re, range_end);
+
+		if (rs < re)
+			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
+					  name, rs, re - 1, re - rs);
+	}
+}
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
 	if (!idm->bitmap)
 		return;
 
-	drm_printf_indent(p, indent, "used %u\n", idm->used);
-	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
+			       idm_used_usable(idm));
+	idm_print_range_locked(idm, p, indent, "shareable",
+			       idm_shareable_start(idm), idm_total(idm),
+			       idm_used_shareable(idm));
 }
 
 /**
@@ -270,9 +556,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
  */
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	idm_print_locked(idm, p, indent);
-	mutex_unlock(idm_mutex(idm));
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7..209f99831f1b 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -9,13 +9,29 @@
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
 
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
+
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare);
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare);
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count);
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count);
 
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count);
 
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 3dbcb1331690..6da43691e54c 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
-	/** @total: total number of IDs being managed */
-	unsigned int total;
-	/** @used: number of IDs currently in use */
-	unsigned int used;
+	/** @usable: number of IDs being managed for GuC submission */
+	unsigned int usable;
+	/** @shareable: number of IDs that can be shared with VFs */
+	unsigned int shareable;
 };
 
 /**
-- 
2.34.1

