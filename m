Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF46C5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E699D10E3F3;
	Mon, 17 Aug 2026 09:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXakyxtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF62810E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786957844; x=1818493844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=20prR0FhRgpj0fWdoQZMttMlA5yyh2bKA0t9zcN3ce0=;
 b=jXakyxtZVhHgfqLIsusOgazclro+7K9+oqGckWg/ETl4eEV6+c78DzXr
 eRQWU9cK5isO9VFqN+EoneVeLKOc9wLMf6H/shsTP+sSo/4wA0anuqelB
 ubEVeEh7S5jjeL5nT7xyntMxnTt+qb/+Z/XCU3VRwxrhw0sxfaYuXu0ny
 MBEPhYzPrxUiB2pYPLkMmpC4Hz7fvsVLbuqTrcSn33apFUk3dTrF9308c
 NJohkUtH0SpJXv6PW8EILTwwS7wPxHHi5L+5fpPrSAmxYM+yN3bOoRAjD
 5uPHMNLDadexG8W6jsLYikRBL1Pxm5VFJdFF82ZsKJRbwjlrpe/gu48lS w==;
X-CSE-ConnectionGUID: QBooU6i3Qp+hw2Zn2uEVIg==
X-CSE-MsgGUID: 1pLIQGhXQ4qTrmodOBi64Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104962868"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="104962868"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:43 -0700
X-CSE-ConnectionGUID: mIbnHPLZSUGBthid/uJX2w==
X-CSE-MsgGUID: dFfZxojcTa6MlZ7oW6LCIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268703710"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:10:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 02:10:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yw8RtB3KKLdcd5CGXRsK1GGyLmnM8g6SSE186b6/6JLutx+zwQLYXoMvtrOO2l8fhiWoCJf6+cLq0+vsVFqesw8NTwuyVT/JkIX45chcES5WpbC7coAaGv2KUOxOE0W26/ach5YAYyVw/dx0kVWCloUEj+pdMt5U0NRPIQmEr5gLaX5NdAeYVr/edy6mxvzRPHq6Ri+cQDDXR0FpyFDk+ZER69dlb7Tt5xU3GtG5sFkIyRQghkTAVORTC+EVzzvP2FTTgHAvRDR5+cwrb4vYHX8NsdBV00K0peK124NZyxuMXIIlMXEccY5lFz35TaviW3yYD/2IW6RDRgd+rKJvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBvMfRQR8QP/ddVn+dV2lpZd8lTqh528bWXUnkM4Ov8=;
 b=ySwVwNX6NOznHlu9iPu7KqBLvJTnrxhlkr5zPGzJVj5U969+6Hm1JYvaIBnEC421xKQsfLCz/BqHfzeSRydhXJodNmQmHUwS/xhkJPZIy9y0FTtmS0Z3Hppaxy5pHrLkAr0HUgXjuclYsz6J/RzYNtoZqHvpABoAuWRUnpo8F1MZJ3DqIVFhJu+OJT0/Ay4ecjqWRnYOGgPW1zwttyyKpoU4EMrrUeQ/OkVRGrgkM4VsXuGQZvB1mE+YMQXG64r1cxg6xiqZhpxjYRcwuw2ELocHBtP86/2uakTMJ591U445OrsBEXeCG9RfSf1xRznr2jgJMTwnHRDn74WnL3hL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:10:39 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 09:10:39 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/4] drm/xe/guc: Start use explicitly usable GuC IDs for
 for submission
Date: Mon, 17 Aug 2026 11:10:12 +0200
Message-ID: <20260817091013.280173-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817091013.280173-1-piotr.piorkowski@intel.com>
References: <20260817091013.280173-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: d91218d7-aa42-4255-02f6-08defc3f67c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: pwTsxkgDF9OnHKXvDfXTL1jx4tg4EcSdVk1zP2gbEFWpfbfwzlWV2LTJfEZwkgUlc+P+f47Gmii+wRY6DAA++z0LD+de0QSxq4/sHrjQBthc4NIg09dutuTsgB+705DTMznICpvufOB1sQVvM8c6d18hCnXtdwT7N3oZUZk8z2APScqsqzN0Gq7JhsU5DAS7JamT042zB2Yd2VEkHKcnIo7N6/2A0lZtm8Fz60XqKXH0MkDMVZuwuffSQjSX2xhmvM4HfYDj68S8WEXijdIhz50dB5lIGgdMId6diSXzyzmD/eJaHfSYFf3xya2nbjpUN1INch597SD8uyxqovMiMdULVk4QMAgdFu1VztN4FNWh9sZJOTXleBBc2VbTnLCDVRiZqKJZCJw1ufzkYjisefTnlk9GH79C8NpR4Mnk9DmCERLs5JCAK4Bmy6dQxKRFewTGP/89le3kovlIknQ4vWco1AxlR5GzIXhFCowNltZrsQjOsrof+TsCvDeKGaOjtu3DZNmuyZy4YINTpxG99bzgvhVEv8IQKvvDCI+zlJupayjaS7xm38u4R3Buf7a07T1OJaRNN89EmKN+tz1nZjrtW91fL27kJQEq2GZ1GCsmYzNp+8J6l2SK+lWXD94aPlQr58Gmf5Git2F3idnRdEQuDZKcuCsrKCd8Gb9VnP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2lQcHlNN2lmOGtIYTIvMEUyN3NUOXo1dGgxY0JOSFNUUkQ2M0U3cHIzeUZQ?=
 =?utf-8?B?M2d5N1VBdlh5V1BVUWViMVpsQTVIeTc0T1NXSmY1M25CM2xyZkdnb2dCQm5F?=
 =?utf-8?B?b2JBUzVSdU1Qd0hWdlFqdWdaK0IvdGhVY0ZOTWI3MThMTkdFMEhPVmxlYkZP?=
 =?utf-8?B?R0Mxb0ppRG1UV3YrcjlhMC9Jd3dReVVUM2JGUWVTQU5xdm1tMmZvZzhhNW4z?=
 =?utf-8?B?MTFUWnNkdDZhTzRmemtuR3VQeFpkMzZIMjJWeDJkNmM1eitBbUQ4N3Z1QmJR?=
 =?utf-8?B?K1pZYTdQVE9QKzZQaFlPT3pTUHZyT1pBbDBJVTlYejkwTGEyVkdVemFDTVU2?=
 =?utf-8?B?QmlHQVhiMHdLYnRSZ1BCY1NNVktPZkthMWF6RmNUek5YSHdQcGpmODNlamVR?=
 =?utf-8?B?VU1jU29wU2pQYzdHOFVMOXpFNk10UmVKMlpXdXhDZ1lpYkJCRXVIenZuQU1T?=
 =?utf-8?B?dW9wT1phMjdUNU9nT1R4QzNNYkl6RFg1QzAvSUFqQmx2bmg1bmp6NHNGcXAw?=
 =?utf-8?B?QTBhTG5qd1BNVE11dkJyNUM5OXdmSGg5SjJOa0g3UGFGTnJNV0xRa2M1YWg3?=
 =?utf-8?B?L3E0alFncnBKck1uaXF3TXdwWUlMYzZiSGpxR2lrVDk4eW1zN2tqR2pPSzFB?=
 =?utf-8?B?L0MyUmtGbG9BdHpiN1EyRGJuamVLSzdtK2lxUEdBelUyNUR0bWxBT2E1YWpR?=
 =?utf-8?B?RnBZRzRDMjlodFFQR0tzb1Z6V3ZaWnhpbHlDaDFER2NKV0tteW10ZGYwUVZU?=
 =?utf-8?B?a3JieFNyNTRyQ3BWRi85SThud2JwVnE4WmZMSjJKaFAvSDZBaFFQWXVSUzNX?=
 =?utf-8?B?OGlGbzdydXVHdUJiKzlFTG1SamxWcEN2MkkzdVRrbWtwUUdWYk5PS3JVM1lv?=
 =?utf-8?B?M24vUHZMYUJiRE0rYUNmR0FoT1pOSk0zYy9LMDJ4Znlid0lQWExtN0cxTFpl?=
 =?utf-8?B?YWZYWjNUenpxZGpsTkVSNjJ6MjJCRVRoNmhzd0plZm0wc0NmOVlSNWx5UTAy?=
 =?utf-8?B?N2o1emw3SDVqRTcwbXNpWnFKemsxRklORGZpdGplNWs0Q3duNHpTM2h6Snpl?=
 =?utf-8?B?UE54YWdLdEg3akhNMFc3OUdCblF1SXBnS1ZieGh1MVZJeU12c0Y3SnJqUUNJ?=
 =?utf-8?B?dzl1eFQrVUJJNWhZWi82L3d0VnRwRndob1BIZGxETU5QYWp2ci90WU9VYUgx?=
 =?utf-8?B?a1JPem1MeisrQnJzNzlNajJsT3N5OS9lOUpmR25zWlpaWmFZVmV0eDVRdFRU?=
 =?utf-8?B?M2hqRHZWd1J5aUpkRWtIWGp1WUVTc1ZPMW5UZitBZ3FNNVU0VlA1dmhuYVhs?=
 =?utf-8?B?aDhZcHFlZ1JtYytpdUZ4LzV4RU5LZmt6ZjNUNHlrMFBxNklHT1lQeUR6Z1Jj?=
 =?utf-8?B?djV3bE9NU21SSGFiYmgyTVY3U2YwRUdxdVhiTlBhVVQ0TVR1RXRDQ0JqUVV1?=
 =?utf-8?B?STQvQ2tBNXhiekVqUFI4ZlNhR3llNWN4ZWZIbzl3QXpQT1EwTnlUZ0lQZTc5?=
 =?utf-8?B?dGd6ZXY0WTNtZUFCUDVYK3BkZkJyY2dJYlpZdmtWUjRLQjdPYWFNTHE0Q3l6?=
 =?utf-8?B?WTFjZk9RUjlOTmZxak1Hdm5pQmdmMUpKRkRSTFRpTGNUVnZLell6KzA5eDZG?=
 =?utf-8?B?S2cyTG80MllrT1A4OFZpdnNGNzBGUDlua015QklaZlAwcXlMMENzMkl2MVRr?=
 =?utf-8?B?cDlrSzYxK1dPRTN0S2o3czVjM2o3TlErbGRFSmV4S2FtSFlqOXZNOUU1blJL?=
 =?utf-8?B?K3V2bkJCVFdBU2pGeVJqOGFWV0w0TG0yUnEvK3JkTWdManJONEw1K1JYQUg1?=
 =?utf-8?B?L1diZ1hNQXBGUGpsbGRXbG9lWXBTa3BDNXE0a3plL1FkSlFlUnhMdXVBRkNw?=
 =?utf-8?B?NVl0WUh3RW5PTGN2SzZUUUpnNThkbVNmeWxsK0xDdEdLZjBaRnpuc0dYcGNl?=
 =?utf-8?B?YjZzQ2FLOFh5ZmJpdnhWamFpR01YR3ZaL0tZZmpXQ3JVamwyYVMxWSs0bXVD?=
 =?utf-8?B?R1ExcGN1SGlWTEx5SWJUV3N1Yi9YajArNGF0eWZwZ09QeUdLSWdMekJDbzlV?=
 =?utf-8?B?dktrYmxMYlkzczZMcG1xYXdVdlFLd2lLREgvM2g3MTBVMjFJM05CY0VTR1Q3?=
 =?utf-8?B?U1V5aGUvVjlMc29mOWJxMlJaWVFPdUR5NmsxeUltcEM2bDFocUUxeGFzZjdi?=
 =?utf-8?B?ZDdGcnJLT292WUFuZlJDYzdRTENmMG02NGZCZndwOW1TNEVCQ0o4VW1zd0RW?=
 =?utf-8?B?UTMyTXgzY1dtZjFvbW50MjFuRHhyUG9VcmZDbmloOW5jS240YXc3ZEhrb2hX?=
 =?utf-8?B?YkFhcHhLaHgwK1pxNWw0aHdIZ2JJUFdhOUFBeTZ1Y09GUWk0dXIxdXNsc0Q5?=
 =?utf-8?Q?sNe16NuU7EpbEWlI=3D?=
X-Exchange-RoutingPolicyChecked: MUMyAZAwszxonuA8bAkrEwWz1Xsyrj8/AydEiEaJWdJWH33oT6zM62kcwOAKVtibA+P/FG6YGqz0M0VN5xKq4n9cp5i22T94DqTorpONac4DbO3FJcc/nI0UctNGQnCFU9lQEpJFvIJz7oXm+5Sj2a1WY3lJBMDmHa5wRzgu725hsHfoMFcmddOQ1VmAWR3pL8NMXJyMTt08mHKjKT2a6j3DfF0xdYwL8luHPSTZiMhdKbTKx5li8fCkpSkA7y00MCzgNrI0JRke2jddpRY5luvmrxkPZPo3hJA5mlWqwPpHKHQJssz4Nhy+x5q/xl5pvT4WzJ6Wyorvm1r5KkB3WA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d91218d7-aa42-4255-02f6-08defc3f67c1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:10:39.0555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fd50qXl3iKfBCaIIOlIE8x9miaGvRhN4c7g+Nx0gAwPPT2uf00f+qlc/V28tus62IKNFgUcdXow9A+c+T3gsuc3xFsczRrdsYMFJ5mkFSbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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

Switch GuC submission to explicitly allocate IDs from the usable
ID pool.
Also lets configure the GuC ID manager according to the device operating
mode during submission initialization. Use dedicated initialization
paths for native, PF and VF modes to expose the appropriate usable and
shareable GuC ID ranges.

v2: Use xe_root_mmio_gt() to get the primary GT so no NULL check is
    needed (Sashiko).

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 106 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            |  73 +++++++-----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  14 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 6 files changed, 178 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 295c17dbc21f..f21d3341b503 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -7,19 +7,42 @@
 
 #include "xe_device.h"
 #include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
 
 static int guc_id_mgr_test_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
 	return 0;
 }
 
+#ifdef CONFIG_PCI_IOV
+static int guc_id_mgr_pf_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	struct xe_guc_id_mgr *idm;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(test->priv));
+
+	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
+	mutex_init(idm_mutex(idm));
+	test->priv = idm;
+
+	return 0;
+}
+#endif
+
 static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
@@ -33,7 +56,7 @@ static void no_init(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 
 	mutex_lock(idm_mutex(idm));
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
 	mutex_unlock(idm_mutex(idm));
 
 	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
@@ -51,6 +74,59 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static void check_init_native(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 1), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable(idm, 1, 0), -ENODATA);
+}
+
+static void check_init_small(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	unsigned int count = 8;
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_small(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), count);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, count), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, count), 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+static void check_init_shared(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	int usable_id, shareable_id;
+
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(idm_to_xe(idm)));
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+
+	usable_id = xe_guc_id_mgr_reserve_usable(idm, 1);
+	KUNIT_ASSERT_GE(test, usable_id, 0);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable(idm, 1, 0);
+	KUNIT_ASSERT_GE(test, shareable_id, 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, usable_id, 1), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable(idm, shareable_id, 1), 0);
+}
+#endif
+
 static void check_used(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
@@ -63,7 +139,7 @@ static void check_used(struct kunit *test)
 	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
 		KUNIT_EXPECT_EQ(test, idm_used_total(idm), n);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
 		KUNIT_EXPECT_EQ(test, idm_used_total(idm), n + 1);
 	}
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
@@ -97,7 +173,6 @@ static void check_quota(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
 	idm_release_chunk_locked(idm, 0, idm_total(idm));
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), 0);
-
 	mutex_unlock(idm_mutex(idm));
 }
 
@@ -111,7 +186,7 @@ static void check_all(struct kunit *test)
 	mutex_lock(idm_mutex(idm));
 
 	for (n = 0; n < idm_total(idm); n++)
-		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
 	KUNIT_EXPECT_EQ(test, idm_used_total(idm), idm_total(idm));
 	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
@@ -493,6 +568,8 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(bad_init),
 	KUNIT_CASE(no_init),
 	KUNIT_CASE(init_fini),
+	KUNIT_CASE(check_init_native),
+	KUNIT_CASE(check_init_small),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE(check_limits),
@@ -520,4 +597,23 @@ static struct kunit_suite guc_id_mgr_suite = {
 	.exit = NULL,
 };
 
+#ifdef CONFIG_PCI_IOV
+static struct kunit_case guc_id_mgr_pf_test_cases[] = {
+	KUNIT_CASE(check_init_shared),
+	{}
+};
+
+static struct kunit_suite guc_id_mgr_pf_suite = {
+	.name = "guc_idm_pf",
+	.test_cases = guc_id_mgr_pf_test_cases,
+
+	.init = guc_id_mgr_pf_test_init,
+	.exit = NULL,
+};
+#endif
+
+#ifdef CONFIG_PCI_IOV
+kunit_test_suites(&guc_id_mgr_suite, &guc_id_mgr_pf_suite);
+#else
 kunit_test_suites(&guc_id_mgr_suite);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..f1c802d53987 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -853,7 +853,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
-	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;
 
@@ -897,7 +897,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc, ~0);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 08e72af2735f..31425011a311 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -131,29 +131,63 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
+ * xe_guc_id_mgr_init() - Initialize GuC ID manager for native.
  * @idm: the &xe_guc_id_mgr to initialize
- * @limit: number of IDs to manage
  *
- * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX) for use by the GuC submission code.
+ * No GuC context IDs will be reserved for sharing with VFs.
+ *
+ * Can only be called when the device is not in SR-IOV mode.
  *
  * Only VF drivers will have to provide explicit number of context IDs
  * that they can use.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm)
 {
-	if (limit == ~0)
-		limit = GUC_ID_MAX;
-	else if (limit > GUC_ID_MAX)
-		return -ERANGE;
-	else if (!limit)
-		return -EINVAL;
 
-	return idm_init(idm, limit, IS_SRIOV_PF(idm_to_xe(idm)) ? limit : 0);
+	xe_gt_assert(idm_to_gt(idm), !IS_SRIOV(idm_to_xe(idm)));
+
+	return idm_init(idm, GUC_ID_MAX, 0);
+}
+
+/**
+ * xe_guc_id_mgr_init_small() - Initialize GuC ID manager for small count.
+ * @idm: the &xe_guc_id_mgr to initialize
+ * @count: the number of usable GuC context IDs
+ *
+ * This function initializes the GuC ID manager to manage a small number of
+ * GuC context IDs (0..count-1) for use by the GuC submission code.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_init(idm, count, 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_guc_id_mgr_init_shared() - Initialize GuC ID manager for PF.
+ * @idm: the &xe_guc_id_mgr to initialize
+ *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX) for use by the GuC submission code.
+ * All GuC context IDs will be shareable with VFs.
+ *
+ * Can only be called when the device is in SR-IOV PF mode.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	xe_gt_assert(idm_to_gt(idm), IS_SRIOV_PF(idm_to_xe(idm)));
+
+	return idm_init(idm, GUC_ID_MAX, GUC_ID_MAX);
 }
+#endif /* CONFIG_PCI_IOV */
 
 /**
  * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
@@ -381,21 +415,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
-/**
- * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
- * @idm: the &xe_guc_id_mgr
- * @count: number of IDs to allocate (can't be 0)
- *
- * This function is dedicated for the use by the GuC submission code,
- * where submission lock is already taken.
- *
- * Return: ID of allocated GuC context or a negative error code on failure.
- */
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
-{
-	return idm_reserve_chunk_locked(idm, count, 0);
-}
-
 /**
  * xe_guc_id_mgr_release_locked() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index b2b4c1212a8c..f7ab753070da 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -6,10 +6,21 @@
 #ifndef _XE_GUC_ID_MGR_H_
 #define _XE_GUC_ID_MGR_H_
 
+#include <linux/errno.h>
+
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm);
+int xe_guc_id_mgr_init_small(struct xe_guc_id_mgr *idm, unsigned int count);
+#ifdef CONFIG_PCI_IOV
+int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm);
+#else
+static inline int xe_guc_id_mgr_init_shared(struct xe_guc_id_mgr *idm)
+{
+	return -ENODEV;
+}
+#endif
 
 unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
 unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
@@ -20,7 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
 int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9036f89dff7d..36dd5dfd51cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -282,20 +282,26 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
+static int guc_id_mgr_init(struct xe_guc *guc)
+{
+	if (IS_SRIOV_PF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_shared(&guc->submission_state.idm);
+	else if (IS_SRIOV_VF(guc_to_xe(guc)))
+		return xe_guc_id_mgr_init_small(&guc->submission_state.idm,
+						xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
+	else
+		return xe_guc_id_mgr_init(&guc->submission_state.idm);
+}
+
 /**
  * xe_guc_submit_init() - Initialize GuC submission.
  * @guc: the &xe_guc to initialize
- * @num_ids: number of GuC context IDs to use
- *
- * The bare-metal or PF driver can pass ~0 as &num_ids to indicate that all
- * GuC context IDs supported by the GuC firmware should be used for submission.
  *
- * Only VF drivers will have to provide explicit number of GuC context IDs
- * that they can use for submission.
+ * This function initializes the GuC submission state.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
+int xe_guc_submit_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -305,7 +311,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
+	err = guc_id_mgr_init(guc);
 	if (err)
 		return err;
 
@@ -411,8 +417,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	int ret, i;
 
 	mutex_lock(&guc->submission_state.lock);
-	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
-					   q->width);
+	ret = xe_guc_id_mgr_reserve_usable_locked(&guc->submission_state.idm, q->width);
 	mutex_unlock(&guc->submission_state.lock);
 	if (ret < 0)
 		return ret;
@@ -3170,7 +3175,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_exec_queue *q;
 
-	if (unlikely(guc_id >= GUC_ID_MAX)) {
+	if (unlikely(guc_id >= xe_guc_id_mgr_max_usable(&guc->submission_state.idm))) {
 		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index ccade320dc69..07682f174aa8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -12,7 +12,7 @@ struct drm_printer;
 struct xe_exec_queue;
 struct xe_guc;
 
-int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
+int xe_guc_submit_init(struct xe_guc *guc);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
 
-- 
2.34.1

