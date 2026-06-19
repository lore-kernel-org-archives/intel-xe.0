Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD48CD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 20:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3B210E0ED;
	Fri, 19 Jun 2026 20:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eT2Ngfco";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F77110E0ED
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781900993; x=1813436993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=l9eFXRO43aPGFqrmjRoWcG2+sUKIMFRsY78/6frYatA=;
 b=eT2NgfcoRGKpdPtXYzJDOJQiU29FXxtXKeyIkHrsGuhPlA36y6gnpZ4b
 692uifnHN6X0dsRHmqMng4c/+vy0e5M4lmBTncKjpWfICLvzSiXmAKsJ6
 FcSznFTpf4XG3QVpTlnZB1HYuAWr1iv6+UYLzh/Na9MPBlYjYIE/NJ1U9
 Aygg5UrMDUf8CBXobyXuBJmgZPVgweYjqHunIEFi6vKaGfaDzKm/AVwND
 +S2OoRlOOK3Cjm5BEVou21oWU6vwS0rzaUd9XY0dW9L9enZw87CUDhRS3
 Y9IbMWhJ+bl2+XHPoAQWltktHRhq2K/wupgIGfUD9riLED7WHFEmaOW99 A==;
X-CSE-ConnectionGUID: LCkmJOgjRoWkX7AfclWs0Q==
X-CSE-MsgGUID: RPbJ1e+RQX2DmUqvk724bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82837384"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="82837384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:29:53 -0700
X-CSE-ConnectionGUID: Jqy0cUHBRCexCcVjwAn+vQ==
X-CSE-MsgGUID: It8G69dsQmmMZcXaINwjyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="248764090"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:29:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:29:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 13:29:52 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LE8U6a3a/zWg2Z09DmiGLFj4YbEzb9lNnbU8c9F6BG8Nqkeyetcr5BEVv5P5PJ//iICvBy3B8dxRLKSlX+WfeS0lvVYcR51NLJtmhtDU5TXO/2KGk4Y11ocflY7PFXa0y+zLqWxXTeRt/pYk7ALXaXaXJRi2HxnkjNLrbPN1cJxj/feGW3YJecMLnw9YalyUaHWAbbtUSR3gJcQ0k2eobooS6wIBJY12Gn/ARFAR6N4NJTGq7IeRQ4kSiy8hik/Gdk2jjL+gmtkLumaZSCviPtWWoW3HfqFGvpVuiKOfYdhvD7G/jITs25CCz8/A5r6u2oTP4KFAdLiY50f8luizyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1k3PUT/JA+YBRN6d8R7Szxz1dxJrnudibar8AM+OYg=;
 b=boTPkxuhZhb+mMk+4POvgSfG67qkL6zRo6TWbt/Vs7+B5jtUwUpqDbcIyAHWgRf30EsCIA0zpSuuL02k7IiElpGf2/NuxVF7OHyphhX2tMtnbImeucS/QA7o/sSOHUMFj+Uv3IU7WjrQL9fSohi6wYfo4lK1EmN4ouI5KLLIQ4+W+jyXwqdYBvBQEOX77BcbtabnpB7qj7F5EfzQFhkhHWYRD+/FRIGqr78nS8pO1azwhEjD8cFgODMSKqWtszVrnw6UrPfYLaXpzYVQhLp6yquI7d3IDbPTU7qr4J09ca4CkHKZPGteu4KNS07BKnW/mYqF1s07rcWbg3SSLXuLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 19 Jun
 2026 20:29:49 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:29:49 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/7] drm/xe/guc: Use DB manager to get total number of
 doorbells
Date: Fri, 19 Jun 2026 22:29:30 +0200
Message-ID: <20260619202935.2701499-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c96474c-4fe5-41c0-4f06-08dece418277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: nDZNqDcYw6S98rP+dzgorn1yaOf5k3pCNLoqYNK5Izjuv20GwtJgVIuobhcAadoH3kcBxoNsbhbPHySRHHNDPVDD4E0r03VxweTPp9c0mTxg1jDFTFFqU1FLVI+hi0JJ0/rvaCn/w5MRrNuHVi7KTQRQ6gwflKmVmIJKuFpiWLWM3Axu+4Moedy+9AIr3Hxz5mWO9If3GMGiBS9svH0h8MpYlWzs/b5BNeZOW3DUK9+mpXrfjeE90vgWcq3t1PNzGu1sLaUCks1Np787h27uPAsjWNs6uL63zNpzzuHz4nWzlIgnOqEU1K6hG7nB1m2aBfuccG3HfxNQu6Urw/TJ+jvgX7aSKgZl1BLvJ2ZhpHuMCNmr8Zl1mWTwaPUUZFSTLMcLLAX3FR/QL329dU8etgzf5Gj/PnhrED+Zd4NYcsUzzOFqpLh37TDNVFwe/yZWNEB2BGC1Z0fkwhdZY1K7nuNQw9DwARwyKTo3cj9NFdQjBl2jQVX3Bbfui3uwQ2kwnjRYHsu4zDo/1ucgeYXF7hzwEMP/VBUg/rKAF4vM9exlh5rLzqrPY0oJ+Vpjjl1ILMUQbasg0AH/ar0bxabKvRIX/PYNSYxpznmQ92gy64EygETvu7z1zH/AahRWyzcuxtiRzxaEx7dAlW0DVHtlP0eJDms/jNJRXjT7N25vZMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(11063799006)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjhpSFp2K1JaOUtNZnkvSG4xb2Fzcy8vOGg4QmVaY01Qa3MwVGZQWFRXc0dT?=
 =?utf-8?B?YzJPTHBDNkkzMTZ3SlFWUkZPZmYyQk5uRDRTRDQ4MWxaR2FndVRHWFpZM3FL?=
 =?utf-8?B?LzFSYlh2TVpiSGI1SFJUaUNidUpZSm1aR2hYcTV4RlJ2UERjbEpFYktUYlNm?=
 =?utf-8?B?NEsyUkJOd3JsVVZZcmNpVytXK3ExamZHTVlTZ2xBa0pyTm1QT1hYZ2F1eTJS?=
 =?utf-8?B?VlRROUhyK2t6bWVZUlN5bE8yQnFyMVUyNXpDTHBNMEhjdStoQVNqQkp5UnI3?=
 =?utf-8?B?Z3UxRGlQWk1ROWVQVVp4MVdBL3Bjd1NUQUxZY2RmdDNmUzErdEtjOG9OZ0xB?=
 =?utf-8?B?WUtIZ1Z0K2VwVVZqTzRvV1Z0WDF5MlJWZEw3OTZMMEgyakhZdHMrQVhaUUU2?=
 =?utf-8?B?MkNSVTNadDd3bTgxaEZINThNUmoxWUVXY1k0WGFpdVNxUmJ3bkZZTGxiRHJr?=
 =?utf-8?B?WitCckZuQzB2RXkzb1BSRTNVaEFzZldvdjhBVmZEMDVqQmtENzhqVUxpUVFC?=
 =?utf-8?B?QlhiTklhOU91UnNlUVJZVUZOYytRMXZsc1Bzd1NFRDdPVGRrdFRlMitLWk11?=
 =?utf-8?B?ZUcyK1ZMaVNueGUvQ1VPQkN5TU5qN0dpUE9keUtmKzh3SW4rd2JGQUZNQXdW?=
 =?utf-8?B?dENveVBTUGlNakEvOXlrRmtyZ093NE4ydTBsc1ZuZ05VRm40VnZaM3kvUlhJ?=
 =?utf-8?B?Q216NFJ0Si82VVpEbDNXWUZPVFp3TTZvMzR4endrUU1tdGJyUThNeVBkc21h?=
 =?utf-8?B?b1JTUjh0NlhtMzZ3V2RQc1JOcVIrWjNyZm55RnByMmZ6TjdVcDByaERXcVJa?=
 =?utf-8?B?L3hza0xoWG5JN2ZQOWV0VllFa3h0Z2Z0TEFScDJWWWMwTUFpaVE3akNwWUFG?=
 =?utf-8?B?T3BmemFpZzVSMnJES09tbHFBcmxNRklpaW5vWk1wMkEyaU83bWpMVU54OHN2?=
 =?utf-8?B?czlXODVuSjJsTmtCYlhkT3NjY2RQVFJEVWJCTzNSMVp5bFdtWVJTM1BhTWdL?=
 =?utf-8?B?VDRKN3FnTGs0VmR1TW00N0puK0NWRFQrTTBJSksvZ3Z0Y0tuUktVa2F5UXhM?=
 =?utf-8?B?VTdwVVo0THhXQWhFS2JReGFnS2MxeTFmOW4wYUVheEErUHNnRkZYZ1Z0dkEy?=
 =?utf-8?B?dmpvZXhETGdyUDdod25CKzVuTkg3d0lyTHMrdUxkSnEzazRpNkJzSnIwcldh?=
 =?utf-8?B?bFROaWlSV3Bsc0Y1V1F4cGoxTVhUbmNwT0YwOGFJRHo2b3UzVlBPTXYzejVT?=
 =?utf-8?B?c1kySHloWTc1VEZqWTc0L1MzWWMxUmtxbk5WZWkvVkdxV0ZIOVZRaEFvQWNw?=
 =?utf-8?B?V3Qrb0FYVS8ySGkzUDFDVmx0amsxSjRoK0I2YkluNUEyemV5U1MwcGtHRmZG?=
 =?utf-8?B?bVJBTXZNaG9rMmo5QjdGYmZSUkhIemJSelhCUWFuRWpTTGdreER5STBsSlhn?=
 =?utf-8?B?NGdUUDA4c200N1NqWUtYckl2M05qV3lZdjN6d1h6MndGR3RkMnFiVHJzcVg3?=
 =?utf-8?B?T1J6a2VzUSt4WDczaHBXTkR0UnRQQWd6MGZDMDQzQ3lRVktDZ1hEYVkxUmZa?=
 =?utf-8?B?Ty9DcDZLQjdOYWZkeDVQQm5FYndhTW5kRXNiSWxrT1IzN29oZG0wdWpnZ0lq?=
 =?utf-8?B?QTJIbjJRbWV0MWtuZGNUcnBjT1h4MndtaXphYnBGdDYyM3U0cHE1UVRVajJ0?=
 =?utf-8?B?OFR6QU85S1JQZmFzb0x2Z2VRazUvaWJwVHNndWJET1MxT1l5V0pmTUhBcEVQ?=
 =?utf-8?B?Szc1VDFUTmtSYXBHbVVBWWU0Y05KeUs2REkwdXFxRTRKT0pYbmdVVld5Ym11?=
 =?utf-8?B?U2k0Q1ExdnF2S2pyV2hwZTRmUzNsVHhOV3o0clhaQzJjRVFRVHdWbytjcFJC?=
 =?utf-8?B?a0NlL3l4cVpEOHFzeTNPcklSZ1FxZFl1ZGxWaVhlVlVnNFRqS2ZSL0R1eFBB?=
 =?utf-8?B?VFgyd2MvZXZVMzh5TitGQzQzUkRreHIxM0JRUENrd3luS0krcitSYUJ4U3dT?=
 =?utf-8?B?RkF4dGpPSDVhMmVHKzZmLzVMbEhhSnZGVi9tcmE5bzBzQUJBa29iZzNaRmVN?=
 =?utf-8?B?RC9jSjFUZ1hqdmxTRFlaYWcvQzZJTzB4STFOQU9MOVBCckcrWW5IVWZOVTJC?=
 =?utf-8?B?V0VYZVpZKzRkOGRoRWVOaXM5REJsajhmZ1M5Q1pqK2U1VjdxQVc5SWlObXBk?=
 =?utf-8?B?dXVMVzdUVysxUUdvU1g2UVYrSmJkY3pyVDB0djRLQ2ZtMGl3R3oyQjd1aTZ4?=
 =?utf-8?B?WDAyZWRTbVpNR04vZmhGUFY5VGRJeklHZmRTbDJabDB4dEtCVFIvaTBMeHFO?=
 =?utf-8?B?dktpSFdGVjVTNW52TnE4U0J2OHdoVXVaMnVtTUZEOWRVRDR1VHBUcDl5VUZR?=
 =?utf-8?Q?UwHrCE0J7zMMlxUk=3D?=
X-Exchange-RoutingPolicyChecked: Vx6X2axiQlICUL2NUMSxSNaR2wtA50Xw0frDwVwjikC4L1vpN0o4y8txeQgvZ8qoPmFOIB2XIQUAfNUn2Ie8YSiKBiD5kQfur3lIjnJM/XJzdEJWXSfFE2JSnff6HHjdquAWlaUK2jbQ68Y7x7iG0w/KXMk1hSCidGj1H/BN0rFgqeY2JbnVCRy+FfYrx+1Ue4N+aVERQHkWRLRwFY1Li119azS/dieMxpSTMtdCVvTad2W0Ay+KH8TAUIe0nkjv1rzW63J3r5cjzHNroYuWtkekAoid3ZeizOYH2UXMwCW3QbYY5F5Z332zS2UpdYGUy7KBotvNk4UeIPywQ8rrrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c96474c-4fe5-41c0-4f06-08dece418277
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:29:49.1737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zl85gjJPCPyOMi+QAlCH/Hc4ulud5FE+Guh6GdI/NtPqA4i2xpx1aoa+tNT7UAhqLrqY4uf1k/POltWZRmougatBJpK+oIZPUMDXbvhJWks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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

Add a helper to return the total number of GuC doorbells
managed by the DB manager and use it instead of the fixed
GUC_NUM_DOORBELLS constant.
Update code to use the actual number of available doorbells
from the DB manager instead of relying on a hardcoded limit.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c    |  3 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c            | 10 +++++-----
 drivers/gpu/drm/xe/xe_guc_db_mgr.c                    | 11 +++++++++++
 drivers/gpu/drm/xe/xe_guc_db_mgr.h                    |  2 ++
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index debe4b7bdb03..dba6e69335d8 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -7,6 +7,7 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 
+#include "xe_guc_db_mgr.h"
 #include "xe_guc_id_mgr.h"
 #include "xe_kunit_helpers.h"
 #include "xe_pci_test.h"
@@ -104,6 +105,8 @@ static int pf_gt_config_test_init(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 	KUNIT_ASSERT_EQ(test,
 			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm, ~0), 0);
+	KUNIT_ASSERT_EQ(test,
+			xe_guc_db_mgr_init(&gt->uc.guc.dbm, ~0), 0);
 
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index aa77bd4cbca3..7292d86a9e8c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1221,7 +1221,7 @@ static int pf_set_spare_dbs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_NUM_DOORBELLS)
+	if (spare > xe_guc_db_mgr_total(&gt->uc.guc.dbm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_dbs(gt))
@@ -1264,7 +1264,7 @@ static int pf_provision_vf_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs)
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_dbs > GUC_NUM_DOORBELLS)
+	if (num_dbs > xe_guc_db_mgr_total(&gt->uc.guc.dbm))
 		return -EINVAL;
 
 	if (config->num_dbs) {
@@ -1404,16 +1404,16 @@ static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 
 	/* XXX: preliminary */
 	if (admin_only_pf && num_vfs == 1)
-		return GUC_NUM_DOORBELLS - SZ_16;
+		return xe_guc_db_mgr_total(&gt->uc.guc.dbm) - SZ_16;
 
-	return rounddown_pow_of_two(GUC_NUM_DOORBELLS / (num_vfs + 1));
+	return rounddown_pow_of_two(xe_guc_db_mgr_total(&gt->uc.guc.dbm) / (num_vfs + 1));
 }
 
 static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
 	u32 spare = pf_get_spare_dbs(gt);
-	u32 fair = (GUC_NUM_DOORBELLS - spare) / num_vfs;
+	u32 fair = (xe_guc_db_mgr_total(&gt->uc.guc.dbm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 6767e8076e6b..697bf8684ebf 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -111,6 +111,17 @@ int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
 	return 0;
 }
 
+/**
+ * xe_guc_db_mgr_total() - Get total number of GuC Doorbells for @dbm instance.
+ * @dbm: the &xe_guc_db_mgr
+ *
+ * Return: total number of GuC Doorbells for @dbm instance.
+ */
+unsigned int xe_guc_db_mgr_total(struct xe_guc_db_mgr *dbm)
+{
+	return dbm->count;
+}
+
 static int dbm_reserve_chunk_locked(struct xe_guc_db_mgr *dbm,
 				    unsigned int count, unsigned int spare)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index c250fa0ca9d6..cbe163fe7ece 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -11,6 +11,8 @@ struct xe_guc_db_mgr;
 
 int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count);
 
+unsigned int xe_guc_db_mgr_total(struct xe_guc_db_mgr *dbm);
+
 int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm);
 void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id);
 
-- 
2.34.1

