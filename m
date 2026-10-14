Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A32CC6B1F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393D810E371;
	Wed, 14 Oct 2026 10:09:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1989A10E371
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791972568; x=1823508568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xQjZsXRRtrm4p0k0QkvliC+/2tNDsZvCwuwTV9lSm0E=;
 b=lvCp0JquKrVtUofDtt+P4DjG4yctVar0Aqql2J941WJVgdeawiBX0gMp
 PlL4ZldoVedKLkSvxFVcoh1b1o8QfzBaSvjhlspaKFEhz7oi3XV4rCN99
 c+85T2sYy9AVK/D+/43jKbgLpPwaLs9AnX2a6NiPTJlYDf5KnPTKJZeKv
 z9GIPqWFP1R/eTFDXkMgvJTySyxj8+k0kF5zM3FXNj6PsBaMX6vXIc35G
 ElNDEsLzBhtnPKyq6MrcDdQiuRzZ5pCb8lk8tQYey2BcVaHFzUGJon3Bj
 W9bNQGWsN14PAq+NI3hTEigRCq2vVX6y/KT3KiL6u4LJEY5gMB4DpvWkV g==;
X-CSE-ConnectionGUID: mpwA/U/aTdWnJeYfzOvgHA==
X-CSE-MsgGUID: UTdobZUzTSOYXYOM/cooxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="722004"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="722004"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:27 -0700
X-CSE-ConnectionGUID: NOMtTd1eRu+5QK0U90I6rw==
X-CSE-MsgGUID: sRL9DqyISvS/sNaOkECqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1723106"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:09:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 03:09:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 03:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ipz9G7mrRTBjo14lRXK6b/Y3D8y3IOFIRZqawjVKmCXw031lEM5tNXDVFP0qNZvNbTFQrIP+T6pDR164FNJiDFGW3/aBV+y56p25StwZL0NrOKvr/wbRzk5t6FlHzfWr9W/aXnvScF3bIUD1qx9n1OaqYqzKc1FbYht7G7XMn2WgnZxJ7V9v1UjkZcxqodG0t9GH2ZgsJS14szl6DbIJ+TGuSelZyvTW0F9xSS9taip2lEuHH2XS1jj0nqJt0HMInJP40HbJijm67PJyeHN7EnXb9RumhIiRv7QDiTKadLSm0Ae/SyaPul49cRxVjW1LGmeckEnM7haWlCE4IBITZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yAgz61OD53iCFtEdTPiQZ+djDe/ZnLe7NXoNkbo4xg=;
 b=PeFuVN/fUNnY3eGnGaQYgQaMkXFW86YUcuYHh7nNRl89VLQQfRvW7S4cK2hnh1nL3BWApacxx903GhrmDs+Wrgv92GwV3Bbu/5fdLF2UIiooCZMpbhXdkBDCvNXPVuDBXExmHbmDpVLe/S/tiusUdhWCWGxWCTVDjrFgbPK8tWJWGggWHIF7IhpZ8THGp7MgwIb2i8bT1hKYCwSFUsitbp4Tlrl+1ZLawEuuklifNibdG0/heMr8AhA8bvntAnVOa3NX5bhkcHl3Kgh5JZBxjTZYGbNW/JpAtnqKhcGIbID7wU2PdS968+DNQTc6kFpsnCEFXiMfBttNN0DyC6H4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:09:23 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Wed, 14 Oct 2026
 10:09:23 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v7 2/4] drm/xe/kunit: Extend GuC ID manager split-pool coverage
Date: Wed, 14 Oct 2026 12:09:05 +0200
Message-ID: <20261014100907.77877-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014100907.77877-1-piotr.piorkowski@intel.com>
References: <20261014100907.77877-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::9) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 79af1ce5-274f-4cb9-7572-08df29db3892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: cC51aAcGQ1/CaMobMhBvfiSYuAz6pbpgdW8hYBSzOffA/PugcJ42TJ1ZYatgFAC7xdX2rJmNQAnryV5gBEwe48P5+kLJzcjh4ZoPbi2WJWDYhsQUL73I9j7E28zxaxZTHjMLD2oth/8i44aSXODYClrDT83eQEmXvU+0eBOiBmipvuYErxrXpBHnVTVy88FpcURxpWsFbS9FX/5VyVkwIe9/g2e1gT4PXp20Q0gnyhqlri7cgaxkULTldyfAyHffgd1JiYhJjnArzNJh5ga3kIcyve4gvD3qksgg4f3vTJ59yOQzWwfNtVO1XjfqCZJd/xtThry3TrLMzSPslful0c49/zEmyi9AqLy4PoWxVhEy5lK03fnZYK+Q20l53n/N5y4Ntd1q0F7t+XJaN/4mB/dLgOrRwRfCos9ZWysZSZA5OzFJAduEjunjMhpP7kGUjckv84UOYwuGCf79m0pzpg7KUVzfHXUY3/v4ijBuCWry8h3kjHgfhzIFgruo8sreo4wqNPLj58LClRGGLFr7Xef2DhCa9vsr8QJVp79URgLlRQzEpjtGV40hvcuJWRZwBaqOjed1joDvcCOGHRLl4ddbFPmQVE9yF1eO7rf4I8VUxg0gwAeY0oKfLUZuvrKe9Y3iYW8RbPr4gITfWJvAXLz4FjeyKFjH3LEX2ZkGdjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkpndWhUMkNkSExFWFFZWjVkSTUwTlFobzZPLy9kQnE1dG9mL3ZLR0NmWGdR?=
 =?utf-8?B?bFVwUHpReHhpejcwNGdKVHBnd2h0OEcwUnhOS2VMZDM2cXhnQ095MEZYUTV1?=
 =?utf-8?B?VnJBRnJ3eFlTNXp0U2hqSzFDTDJ4OTJaYTI1aGlxYnNYM09vRG9UV0YvNjdW?=
 =?utf-8?B?a2NTN0I1NGMzaFRLOUl0UEd0YWRpdGJVVzZLVllZaGl2USthNjRaSWtReitF?=
 =?utf-8?B?MTV6Unp1ZENib05oK1BOd0xsbmZ4MktBeHM4OUpkRElOLzlYZm5CQmJyMFRh?=
 =?utf-8?B?d2hPZ2I5TkxLNFg3NjBieUhqbGt2aDR0TTl3cUYxVEVSKzBQK0lHZ01MRU0w?=
 =?utf-8?B?aTdOODU0bXJRSE9RRXY5aktGcFhKRnhiU3hoblFQNWFtS2ZNQTB3eVpRMjBC?=
 =?utf-8?B?YkJPM1NtSWpaOUhzZzkyUUFZb0RpNGoyblBsVFFHNzJiVjh3ZkxVd05Nb2Yx?=
 =?utf-8?B?My9USWJPazRDTE5lbEVZdW10UkptUjR5V3piUWtrU3ptaG1Wc0xJV0FxYUZm?=
 =?utf-8?B?S1hFNU1jRkRuSGdFeG1lUVEzTFFOdWMwQ245Y2ZOcVpRWGgzbkx6V01BUm5Q?=
 =?utf-8?B?MGErTWw0bTlwaHpZSHk5dkFDalVKNEFvMTlWWkVxSXJPVDJYS3FMT1JzallW?=
 =?utf-8?B?ckZEWjBYZHBiR2tYdDFSOHpuVVBLSDBJb09BOXdldGVEcjFKNUNIZzJZQTRN?=
 =?utf-8?B?R0Q5cEl4c2RUSXB6WS9pZ0RzLzB3OTk5eXA3Wjl6QU5NS01GUmxweEgyRGNB?=
 =?utf-8?B?S3BLa0NFd0VLcENoRWZvNWRwNkJaKzBhdks3V0swWVBMd0lUWE9iL1ZjTmhq?=
 =?utf-8?B?dDhuNUlrTUlJZmkzME55R2dkSTNOUTFmcENzR0pqNWVqNmY4Z2ZKQitPMFFy?=
 =?utf-8?B?S1RNSi9JZi9HUEhGaStaOGlwcHFGWUN2WEFzM0IxRHVtTCtoQ1I4alJkRXFh?=
 =?utf-8?B?THZoa0g3Q0xPZjMyY0VsS2pSV1lDb1JvTWQrTldBT3N6SjJhN0hjdGsxWjcz?=
 =?utf-8?B?QlJxa29NYnRjY042OElrRGNrUGdEck4yeGpqdFBKVkdKNFJaL1lMTXdBZHR5?=
 =?utf-8?B?L0J3STBrMmtYNllXQUZQVGFMR2pwbzR5STdqSGx4QU8rMG8wRmZ4bkRNcHZ4?=
 =?utf-8?B?SEZCVDB6K0p1RDRCNW1EcXpWNEtTOEtxZ21xSWU2c2NxZ05ncDVsdWlEekdH?=
 =?utf-8?B?ZERLZXFMRERkUEsxakNkT0IyUWkySngvV1dNQ0ZDMkNHUDRFZHNaajhDVlJ3?=
 =?utf-8?B?OTlmSmtxOW1IMVhhQnl3SlVOekRKK29RTGkrZzFPMlQ3dmRHVzAra0MvWXI5?=
 =?utf-8?B?OW80TE5WYmlXc25jcTNteE0xanI4MUlHcWxjZnNrc3Iyb1ZJbUU5YklNV01t?=
 =?utf-8?B?ZE1NbjRyK1ZMSWRYTEovMmtUK3BlQUg2c3U5WTEwTkd5ck1Ic3RpS3oxaDZl?=
 =?utf-8?B?NGlMNnpmb0pHdnlVRm9TRTFTQTN1WVJVU2xGTVAwTWNWSGFHQnNESEMvU3Jt?=
 =?utf-8?B?VmxPOGRrVUZmaDVWSitQVG9UQXZrY2xxWCtwRGpKcXhidkc3ZmMrcU9PRWxG?=
 =?utf-8?B?blc0dE9Sczk3NmVNRzhuWlp4UFhsNlQ1eWhBSDVpbnc1d1RPYStZL0cwNFVw?=
 =?utf-8?B?UEdBTzZLWGpwRTF6azRUTlh1WHhJOGlrVWNhZmh5MGJwd1kwaUs5R09OMXlU?=
 =?utf-8?B?YndEajJxRWdHWlhDV3hGSzhONXlDRFB5b05GeTNia2pDaDdUN3NlYVBIOUJi?=
 =?utf-8?B?eUlaUWFDR3VvRDNhbklxM0VtMXQzajFPd0UzMVJoUGxYb0xoV05QaEpZdHN4?=
 =?utf-8?B?QVVkeUNHck1TU2FwU3NyZWhvNVRPNTVxTnhlRzRjdlRIcE1pbkNjTnhCNFlN?=
 =?utf-8?B?Q3R4ZzlucmJZL2x1Y0hsbEJLdVZvcmkwYmFTekJHbGZvcnVOMk45S09mdnAw?=
 =?utf-8?B?dkNMcTBNanFmaFF2MjhodjQyYnlWaytiNWxub1NBZGdxTVFIV0x1c2VjRjRs?=
 =?utf-8?B?MDdtVHkraDdPeEN2Skw2ZjNJdDQ5citpVjBhQ3NZOTlNZ2NibUZDTG5ZOWhi?=
 =?utf-8?B?LzVmTDhLNnhUbjJ5QnBhVzV1a3J4aGhHNFVRbDNFaFRkaUFKS0s2UW5nZGhw?=
 =?utf-8?B?SlkvNWlOUURUa2VabHBEdXp6eXhxZ01GVjJ3YVhHNHV3bFJsY0laU004S1FF?=
 =?utf-8?B?cXhLall1bXhma21GOXBIRzdXbis2Z1NsYVpCdjhNOHdlVTQxTUZtZWlDOHVC?=
 =?utf-8?B?SktnU2VSOHJhV2RxUjV1dEhZUTVteHNibmNRWXZSZ1U0bUc0cDFLcVNFYW5w?=
 =?utf-8?B?Mitvd2RWUVhRV1Q2Ky92VE9TRy84Tm05akJZV05Fc3d4b1FxS0pES2JoZVVM?=
 =?utf-8?Q?SF2FRw4AhG9A1x6s=3D?=
X-Exchange-RoutingPolicyChecked: JI529X/3H3O75DBgVXMVpAmX7IXQWIjnS92MD29NhwScpwzD/sjRJbPKQZZAGFk3EByF9MRQsPDbQ05XkWGUVIeB5NVhhKDjtuOGuxZdBi8APv39QzmFUgUOAMVgvwgcqh6dvSf8yF3jHagAul2BFE6Ow0cfiqNmICwAd3IPs8fP/j+DrD1OKedqh9E3qppPkm8wTDj9B0P+XFmu5lsEW4vldGUoN9eRsPQUjf9lEoDKbc95vK1avXGN2ex8/jzbqxyjny3N+I0G3OcdZPxZwcD8zmQ+ULXUak3YSG/Y7w4UP1yun8++x1LffxHm/JA5yoYNKNOecPou3zDK85+gGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79af1ce5-274f-4cb9-7572-08df29db3892
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:09:23.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH7u9jUHP7Wp4vjYC13kZjVDRXaw+uabSh/nLtsPFFqLimYeowtyGcZnPs/CRUjqSVh5lz1mihnxVy+iIlU1pM7FE4qy76CioyvTC1Cd3WM=
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

Expand the GuC ID manager KUnit coverage to exercise the new
usable/shareable pool model.

v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
    so the mutex is not leaked on failure (Sashiko).
v3: Guard failed ID reservations before releasing test allocations.
v4: Avoid releasing unreserved ID ranges after failed test reservations.
v5: Fix check_used() cleanup and add missing reservation guards (Sashiko).
v6: Use guard() for the ID manager lock, simplify the skip helper and
    replace magic numbers with named constants (Satya).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 632 +++++++++++++++++-
 1 file changed, 609 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 78d3de46b7572..158f9ba4ace66 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -7,13 +7,30 @@
 
 #include "xe_device.h"
 #include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+#define IDM_TEST_POOL_SIZE		8
+#define IDM_TEST_PARTIAL_POOL_SIZE	((GUC_ID_MAX / 3) * 2)
 
 static int guc_id_mgr_test_init(struct kunit *test)
 {
+	struct xe_pci_fake_data *fake;
 	struct xe_guc_id_mgr *idm;
 
+	/* Keep one logical suite: use PF fixture when IOV is enabled. */
+	fake = kunit_kzalloc(test, sizeof(*fake), GFP_KERNEL);
+	if (!fake)
+		return -ENOMEM;
+
+	*fake = (struct xe_pci_fake_data) {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	test->priv = fake;
+
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
@@ -32,11 +49,10 @@ static void no_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	mutex_lock(idm_mutex(idm));
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
-	mutex_unlock(idm_mutex(idm));
+	scoped_guard(mutex, idm_mutex(idm))
+		KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
 
-	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
+	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_shareable(idm, 1, 1));
 }
 
 static void init_fini(struct kunit *test)
@@ -51,55 +67,611 @@ static void init_fini(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
+static void require_iov_config_or_skip(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_PCI_IOV))
+		kunit_skip(test, "requires CONFIG_PCI_IOV");
+}
+
+static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm));
+}
+
 static void check_used(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
+	int id;
 
 	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 
 	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
-		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
-		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n);
+		id = xe_guc_id_mgr_reserve_usable_locked(idm, 1);
+		KUNIT_EXPECT_GE(test, id, 0);
+		if (id < 0)
+			break;
+		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
-	idm_release_chunk_locked(idm, 0, idm_total(idm));
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
-
-	mutex_unlock(idm_mutex(idm));
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
+	if (n)
+		idm_release_chunk_locked(idm, 0, n);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
 }
 
 static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int overlap = 10;
+	const unsigned int tail = 10;
+	const unsigned int usable = GUC_ID_MAX - tail;
+	const unsigned int shareable = overlap + tail;
+	const unsigned int spare = overlap + 1;
+	int usable_id, tail_id;
 
-	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
+	require_iov_config_or_skip(test);
 
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
-	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	guard(mutex)(idm_mutex(idm));
+
+	/* spare is larger than the overlap, but the PF-exclusive range is free. */
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, usable - spare);
+	KUNIT_EXPECT_GE(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+
+	tail_id = xe_guc_id_mgr_reserve_shareable_locked(idm, tail, spare);
+	KUNIT_EXPECT_EQ(test, tail_id, usable);
+	if (tail_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, usable - spare);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_reserve_shareable_locked(idm, 1, spare), -EDQUOT);
+
+	idm_release_chunk_locked(idm, usable_id, usable - spare);
+	idm_release_chunk_locked(idm, tail_id, tail);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
 }
 
 static void check_all(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
+	int id;
 
 	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 
-	for (n = 0; n < idm_total(idm); n++)
-		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
-	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++) {
+		id = xe_guc_id_mgr_reserve_usable_locked(idm, 1);
+		KUNIT_EXPECT_GE(test, id, 0);
+		if (id < 0)
+			break;
+	}
+	if (n < idm_total(idm)) {
+		if (n)
+			idm_release_chunk_locked(idm, 0, n);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
 	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
+}
+
+static void check_limits(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int usable = 10;
+	const unsigned int shareable = 20;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), usable);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), shareable);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), usable + shareable);
+}
+
+static void check_overlap(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+}
+
+static void check_overlap_alloc(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int usable_count = 2;
+	const unsigned int shareable_count = 3;
+	unsigned int total;
+	int usable_id, shareable_id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	guard(mutex)(idm_mutex(idm));
+	total = idm_total(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, usable_count);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, shareable_count, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, total - shareable_count);
+	if (shareable_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, usable_count);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), usable_count + shareable_count);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), usable_count + shareable_count);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), usable_count + shareable_count);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, usable_count), 0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_id,
+							       shareable_count), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+}
+
+static void check_overlap_release(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int count = 4;
+	unsigned int total;
+	int id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
+
+	guard(mutex)(idm_mutex(idm));
+	total = idm_total(idm);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, count);
+	KUNIT_EXPECT_EQ(test, id, 0);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, count), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, count, 0);
+	KUNIT_EXPECT_EQ(test, id, total - count);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, count), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 0, 0), -EINVAL);
+}
+
+static void check_overlap_partial_init(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int pools_size = IDM_TEST_PARTIAL_POOL_SIZE;
+	unsigned int shareable_start;
+	unsigned int rest;
+	int usable_id, shareable_id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	guard(mutex)(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	rest = idm_total(idm) - pools_size;
+
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, shareable_start, GUC_ID_MAX - pools_size);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, rest, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, pools_size);
+	if (shareable_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, pools_size);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pools_size);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pools_size);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, rest), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+}
+
+static void check_overlap_partial_shared_range_blocking(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int pools_size = IDM_TEST_PARTIAL_POOL_SIZE;
+	int usable_id, shareable_range_id, shareable_overlap_id;
+	unsigned int shareable_start;
+	unsigned int nonoverlap_size;
+	unsigned int overlap_size;
+	unsigned int total;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	guard(mutex)(idm_mutex(idm));
+
+	total = idm_total(idm);
+	shareable_start = idm_shareable_start(idm);
+	nonoverlap_size = total - pools_size;
+	overlap_size = pools_size - shareable_start;
+
+	KUNIT_EXPECT_GT(test, nonoverlap_size, 0);
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+
+	shareable_range_id = xe_guc_id_mgr_reserve_shareable_locked(idm, nonoverlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_range_id, pools_size);
+	if (shareable_range_id < 0)
+		return;
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0) {
+		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
+
+	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
+	if (shareable_overlap_id < 0) {
+		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
+		return;
+	}
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0) {
+		idm_release_chunk_locked(idm, shareable_overlap_id, overlap_size);
+		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, shareable_start),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_overlap_id,
+							       overlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_range_id,
+							       nonoverlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+}
+
+static void check_used_usable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int count = 2;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, IDM_TEST_POOL_SIZE, 0));
+
+	guard(mutex)(idm_mutex(idm));
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, count);
+	KUNIT_EXPECT_GE(test, id, 0);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), count);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), count);
+
+	idm_release_chunk_locked(idm, id, count);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+}
+
+static void check_used_shareable(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int count = 3;
+	unsigned int shareable_start;
+	int id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, IDM_TEST_POOL_SIZE, IDM_TEST_POOL_SIZE));
+
+	guard(mutex)(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, count, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), count);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), count);
+
+	idm_release_chunk_locked(idm, id, count);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+}
+
+static void check_used_mixed(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int usable_count = 2;
+	const unsigned int shareable_count = 3;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, IDM_TEST_POOL_SIZE, IDM_TEST_POOL_SIZE));
+
+	guard(mutex)(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, usable_count);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, shareable_count, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+	if (shareable_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, usable_count);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), usable_count);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shareable_count);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), usable_count + shareable_count);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, usable_id, usable_count), 0);
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_id,
+							       shareable_count), 0);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+}
+
+static void check_release_usable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int count = 4;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, IDM_TEST_POOL_SIZE, 0));
+
+	guard(mutex)(idm_mutex(idm));
+
+	id = xe_guc_id_mgr_reserve_usable_locked(idm, count);
+	KUNIT_EXPECT_EQ(test, id, 0);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_usable_locked(idm, count,
+							    IDM_TEST_POOL_SIZE - count + 1),
+			-ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, count), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
+}
+
+static void check_release_shareable_range(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int count = 4;
+	unsigned int shareable_start;
+	int id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, IDM_TEST_POOL_SIZE, IDM_TEST_POOL_SIZE));
+
+	guard(mutex)(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+	id = xe_guc_id_mgr_reserve_shareable_locked(idm, count, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_start - 1, count),
+			-ERANGE);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), count);
+
+	KUNIT_EXPECT_EQ(test,
+			xe_guc_id_mgr_release_shareable_locked(idm, shareable_start, 0),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), count);
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, count), 0);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+}
+
+static void check_split_boundaries(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int pool_size = IDM_TEST_POOL_SIZE;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pool_size, pool_size));
+
+	guard(mutex)(idm_mutex(idm));
+
+	shareable_start = idm_shareable_start(idm);
+
+	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pool_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
+
+	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, pool_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+	if (shareable_id < 0) {
+		idm_release_chunk_locked(idm, usable_id, pool_size);
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pool_size);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pool_size);
+
+	idm_release_chunk_locked(idm, usable_id, pool_size);
+	idm_release_chunk_locked(idm, shareable_id, pool_size);
+	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
+}
+
+static void check_shareable_spare(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int pools_size = IDM_TEST_PARTIAL_POOL_SIZE;
+	unsigned int shareable_start;
+	unsigned int overlap_size;
+	unsigned int shared_tail;
+	int id_tail, id_overlap, id_extra;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
+
+	guard(mutex)(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+	overlap_size = idm->usable - shareable_start;
+	shared_tail = idm_total(idm) - idm->usable;
+
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+	KUNIT_EXPECT_GT(test, shared_tail, 0);
+
+	id_tail = xe_guc_id_mgr_reserve_shareable_locked(idm, shared_tail, 1);
+	KUNIT_EXPECT_EQ(test, id_tail, idm->usable);
+	if (id_tail < 0)
+		return;
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shared_tail);
+
+	id_overlap = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size - 1, 1);
+	KUNIT_EXPECT_EQ(test, id_overlap, shareable_start + 1);
+	if (id_overlap < 0) {
+		idm_release_chunk_locked(idm, id_tail, shared_tail);
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
+
+	id_extra = xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1);
+	KUNIT_EXPECT_EQ(test, id_extra, shareable_start);
+	if (id_extra < 0) {
+		idm_release_chunk_locked(idm, id_tail, shared_tail);
+		idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable);
+
+	idm_release_chunk_locked(idm, id_tail, shared_tail);
+	idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
+	idm_release_chunk_locked(idm, id_extra, 1);
+	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
+}
+
+static void check_shareable_spare_fragmented_tail(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int overlap = 40;
+	const unsigned int tail = 50;
+	const unsigned int usable = GUC_ID_MAX - tail;
+	const unsigned int shareable = overlap + tail;
+	const unsigned int stride = 5;
+	const unsigned int count = overlap - 1;
+	const unsigned int spare = 10;
+	const unsigned int overlap_free = 30;
+	const unsigned int tail_free = 20;
+	unsigned int shareable_start;
+	unsigned int i;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
+
+	guard(mutex)(idm_mutex(idm));
+	shareable_start = idm_shareable_start(idm);
+	KUNIT_EXPECT_EQ(test, idm->usable - shareable_start, overlap);
+
+	/*
+	 * Fragmented tail cannot fit @count IDs, so the request must fall back
+	 * to the overlap, where it is limited by @spare.
+	 */
+	bitmap_fill(idm->bitmap, idm_total(idm));
+	bitmap_clear(idm->bitmap, shareable_start + 1, count);
+	for (i = idm->usable; i < idm_total(idm); i++) {
+		if ((i - idm->usable) % stride)
+			bitmap_clear(idm->bitmap, i, 1);
+	}
+
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, count, spare),
+			-EDQUOT);
+
+	bitmap_fill(idm->bitmap, idm_total(idm));
+	bitmap_clear(idm->bitmap, shareable_start, overlap_free);
+	bitmap_clear(idm->bitmap, idm_total(idm) - tail_free, tail_free);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_free, 1),
+			-EDQUOT);
 
-	mutex_unlock(idm_mutex(idm));
+	bitmap_zero(idm->bitmap, idm_total(idm));
 }
 
 static struct kunit_case guc_id_mgr_test_cases[] = {
@@ -109,6 +681,20 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
 	KUNIT_CASE_SLOW(check_all),
+	KUNIT_CASE(check_limits),
+	KUNIT_CASE(check_overlap),
+	KUNIT_CASE(check_overlap_alloc),
+	KUNIT_CASE(check_overlap_release),
+	KUNIT_CASE(check_overlap_partial_init),
+	KUNIT_CASE(check_overlap_partial_shared_range_blocking),
+	KUNIT_CASE(check_used_usable),
+	KUNIT_CASE(check_used_shareable),
+	KUNIT_CASE(check_used_mixed),
+	KUNIT_CASE(check_release_usable_range),
+	KUNIT_CASE(check_release_shareable_range),
+	KUNIT_CASE(check_split_boundaries),
+	KUNIT_CASE(check_shareable_spare),
+	KUNIT_CASE(check_shareable_spare_fragmented_tail),
 	{}
 };
 
-- 
2.34.1

