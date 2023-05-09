Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7B3C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 15:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758210E391;
	Tue,  9 May 2023 15:10:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC92F10E113
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683645017; x=1715181017;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=bNsNNCgcUKeMKenYCJz1bYzxyHv9p5zQ2AkvGHH8kv8=;
 b=UHM/IWcQO6EX9n6f1hNXDkZs84/sa1k0tD1koAEnJTXTBGhhzIBYTxR6
 7vlcLKEmY2E76gVhLqRe15CSagOmGRT0wgmHVwO/yiPMyH8nbjpErZ/4b
 2Iq0VW2kKYxfjciWKVzozzqYewU9AHCnDlMFtQpGm6ZISIl6BWSksN0P/
 6yLAgkUB34I54sXnedD/6hk7A5aqZdr3Vqa2Dme1gyqCv+We2IcqFIs26
 +xHLbG3mB0K4FHZbwlcgsY1qv5ypAmdesv6uO4uWrvSIxpetx4tqHD4hZ
 BdjDJL6wyf+S1C28/9x4q8fAa2rn2eaB3pKUKrnb+PmMzHC9RITVIvYMA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353019554"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="353019554"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 08:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="810726088"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="810726088"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 09 May 2023 08:10:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 08:10:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 08:10:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 08:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1of5zFnZT02BKoGUkeWoX8xhTW+3Z9KRt/YPrQe/zxOkd0fVJwhkwQE0lJNQ9+SrDv/qMAPF0SO/IQTrOVumzS94jmwvdCXyWUPjCvfAgsNbFizbYILFqdvipbOkB5Huk5UYFpSdwKfnMV12m8uwWxWTI9KxqClJ9K8MXc2HrxMTa4vEK7BLzpsXRKHTmTMZP9S6hSb0xSh2JptDs2Al0b33JYJb73OD7UHb+o/zYeN+874lFRO0cIXfb/dhpFU4XH4fRSWyqDZLywD3i15Tutf4M0Y058bLs4GmVVSb92qfyfDpRsIvoIaouBFnt1SZ4bW0zUDQkPcq3+Bv9zy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvZsLqAkZlsnDseJBzosvryIuDEuUIcKjijcG0upvOc=;
 b=X93tghxyiPkBxgx8wekMV0TcZIoipIFCzIyfOnKJP+0Q34kQ1LW8nLzEC8dVecdqJVvXRE6tvJ5EHZ3ukI1bBd+Go3NwJzk8ShiuCu/fdJS5aSDOm0SO7wvYS0NM9OLIrYtQPP/WpCedKTbLzduDo9iOajm3lfbm8B98t9dLfYBViWXftQN1xj8aX9gswlS9tZ+m8QtEY18RYYJy1ciYCJG9Txrx716qeKMhVa8+HPQXWYcTNx6aNbkjh04IaG3ui8gBBkzXfVonK+KExkHwRg1nGSTe2Rh9eYpfHIbb6eAYiBxqBz4O6XkCpDGyf8DRRSNbN1J2z0ER9pswZ1HdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 15:10:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 15:10:15 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 9 May 2023 11:10:08 -0400
Message-ID: <20230509151008.1434683-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a4cec0-83ef-4731-93f0-08db509f7e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b91zrCvNEKPcVc6kV/ArbeGN+hHjMHhQR4Gqw3gaOL7/iLSQv529eWqRLk41v1jrAT8tyLvT70CFtYQ3H64txGdG7KKGiXHZOI35izb7sQPzBAY66HvpTsj0nwb1VAewTbKDU/L+Q6+eyqRVmLlKynegE3jjLacYborlBCjps+DYNeEXrDuhEsE/HfzqQ8gQ6vH5TQIhMluVlrbd/4/7l0Kc11vC7h6cScwew/iMFhmRJ8KEKpYgS9QmXTn3CZc5YYMPMFgyJgT5xROpscdWapMAQBMD3nTNoFD2Rb0o0KkomXGNmnAWjVBhI+jrnge+0lTc1RJrCcIfQ34REGgsoP/183+IsAHwDw8H4KxGajamf6yQHxXaHhFYZVzt/faPrN2HCdFHtoVlUM3zLqaTNYsVwZKsIpYZ6GbK5YqEID2lCFm9IID8wcICqsVyVClAKi0EgulYkltkrw3S0YycpPvq6hVN8uGisNVUG8BZWGg8VFr0bzsbTkRgBzX2SBBZ6P6YRoofCLCg4MRi8IY041z5vMmU1LBhBjCwP3397ANJR9yr1MBIuBKZKDBk0Q9N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(186003)(2616005)(2906002)(36756003)(38100700002)(86362001)(82960400001)(6486002)(8676002)(8936002)(316002)(6666004)(41300700001)(5660300002)(478600001)(54906003)(66946007)(6916009)(4326008)(66556008)(66476007)(26005)(6512007)(6506007)(1076003)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3lMa2JPSVVyU0Q5dENoMlVpQ2IvMFdWN1Bxc1F3bGQ1RjlveklmVlJSZktp?=
 =?utf-8?B?Umh6eitvZXNLS0U0Mm9LREd6eHI2YzRGMWJzNU1qbTRYOEtUNDQxWWxndXk5?=
 =?utf-8?B?NmM4V0FIS0hUby9ubVpBWWkrd3ROcnFEVW9JaklHZE5UVWR1cWxvbjNhSnJr?=
 =?utf-8?B?SGtZR0ZOK1BSc1p6NHhFRU4rUS9DeE1mWEJLbUpYajBVcnVMSWxzZU45cFZq?=
 =?utf-8?B?Q0lUNk54WGp5L1h1eE01S0tIbjMvYkh5VE5uTUhXeHlqWHNENENLOCsvLys4?=
 =?utf-8?B?TTRyOVJkNFNDRUhwaXZtbWFhVktaVzhNM3FGSzZSMTBlUCtqeE9LZjZjV3I3?=
 =?utf-8?B?c0o2QzZMeFBHNGJwTTVReFdQLzNIZDAzQWhreVBDeWZzU09wRWpIU292bnVI?=
 =?utf-8?B?aTdBMm5SdkpnM1E3N1liczJVN0pWTHJEMHlNM1c0ZVRvOXVxNmVjenNzY0xt?=
 =?utf-8?B?QmJoTmRBSG1UQlFFZ1pidVQ1aHFYU3NoT3FWQ2t1MWtyYlJtcmZWSWdZd1gw?=
 =?utf-8?B?N1o4cy9MWTYyMy93QXJma3AxMnRxbVlMR2RhaVJSRFF3NS9JbzV4aDJNS2J2?=
 =?utf-8?B?NDc4UXIwRFJxb0ZBSHlQUFVjZEdWV2kzM2VUZmZGSFV3dzBwd1AyeFE2Q3dt?=
 =?utf-8?B?VURWdUdBVkJhbmZUWDBod3djVnkyTjVFY2tNTlBHTEN6M2ZaK05oUVV5dGVY?=
 =?utf-8?B?R3M3UVQ1eENCb21POTBjdTZ2QkgrZHFaeWNCWkhKQUphenBKUWliTGs0S2pr?=
 =?utf-8?B?cnRkYVJFaUwrbmtLaTh4RHRleS96MzFGdUgxZTdqQnFmVDB2WldMZWVaUmZo?=
 =?utf-8?B?dUxtOElEakdNV1ZmOTkyc3ZCL0JTaERnQjloNHdDdExUYit2Q1RtWE0wUklK?=
 =?utf-8?B?a2psMmVFWGQvYmE0T2hleGZkdDllck5ORkxHUW9OUFhkVGpHMHJVbnJmVzdV?=
 =?utf-8?B?dTRpL2RRaVJtMjFmTGV1MUJFdmNDYnlRL2tvb2xTTlFJZnQ0SjBCYjZvYlc1?=
 =?utf-8?B?a0RxWWw4bHI3eUZ6TjJONGhDWm5GV0NXRTZlZkFUN3F4a21HRGYzV1VraVd6?=
 =?utf-8?B?WGhxUGU1dW1GZTJVMTg3bExkUG1hOG9EV093aU1BZzgyUm1DVG1vdXhiMDhD?=
 =?utf-8?B?N2FzZzY4RHhLK1N0blhmN29oelZBcTVvalI4SEdZSFBqcVFFZEROeUlHbENl?=
 =?utf-8?B?VjV1RUlhdTNmQkdoRHFSdlAvaE9LUFRDelR0SFVhZFl3MDdVNG9XR3ZQamtU?=
 =?utf-8?B?QlpTVmVTU1ljTXIxdkY3Z0FLWE9zMFRYcTJEa0ZqNFNra3U0V01RUUJQeGpk?=
 =?utf-8?B?OFVNQUF6anZYa1BXVWptaFJCZnJ6cXByZHMrVHl2WlNLN05wMW5kbWxJT1Ex?=
 =?utf-8?B?eHVGNXlBaXVXTE9PdHMrSXNLTW90QTBTZXlTTGc1QlFxTU5RWGtJL3BiN0g2?=
 =?utf-8?B?MnZFN0F0KzhoU2lGbWpuRUI0K0FMRE15b3NFdStQbnNnRktJOUNFOUdCU1J0?=
 =?utf-8?B?OVJBV21iVktNUmk5TW5KQklDU0JpRGFNYkEyVDBoWm1JZlZEQWF3VmxoYWFi?=
 =?utf-8?B?bVpRQmhBejBvMmlPZ0VhT05LaFBKYkw3WWpYWGE4QUVRVHVwZHkzL2R3MmFG?=
 =?utf-8?B?ZUs1MDhDUVpjbW50VzJtZ2VGbE00R29VTEkwMU9FazEvaEwzT21MdFozMWNQ?=
 =?utf-8?B?OUp5dnZtcWpBYW8rVWp2aG4vanZ6Q1NNdk1hejRtRFR4VWl5cXl0MEdzQ1ZM?=
 =?utf-8?B?TzJsOTkxV3BMRXloUWI5bHppMmVRVTFNSkNyNGpJcnA5Z2xwRUI1L1pBSTJU?=
 =?utf-8?B?M2NST2I4aWV4VExRSlhIQjFmcTYzbHBSZFI0YU5CUWNXR2Vzd0hIWktHODkv?=
 =?utf-8?B?bEpsY2Z3ZlhkMUpqT09wOWRCUUFmTFZRVlliNU80QkVZNzNnY2NicmMyd0NH?=
 =?utf-8?B?d3JVUmxwVkpHbHA0UzZscGtNTHo4Ym03d2lhYk5KRkNwWkxyZG9HdjlMYlRQ?=
 =?utf-8?B?MzFLbWxMWEJicUhQdjMvYkY4eEpTVkNVenllOU1NejZoYlc2SlUybGVNMEFF?=
 =?utf-8?B?NDdjd0lpMUNZYnp4UDRRcXdUemhRTm1QelJwKzhIYm8xanBSNmJRN3RkSGFq?=
 =?utf-8?B?SUhWL2VmcFh1Z0w0aFNaYVFHUy9OY3A2K0IyNTBWcjlCR2ZITHpabEU5ZHYw?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a4cec0-83ef-4731-93f0-08db509f7e25
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 15:10:15.1560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OHDwaed/Br6ywPmOds8wCBgobrrNA0ziVCDmQDbxvLCrqhr6lRyaYw+/gdrYpOiR4ZaLmrrKdjRmDf17hP+uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Make xe build dependent on STAGING.
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
Cc: Maciej Ramotowski <maciej.ramotowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Radoslaw
 Szwichtenberg <radoslaw.szwichtenberg@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As documented in drivers/staging/Kconfig:

STAGING means "that these drivers are under heavy development" and
"may contain userspace interfaces that most likely will be changed
in the near future."

As explained in Documentation/gpu/rfc/xe.rst:

"
Xe driver will be protected with both STAGING Kconfig and force_probe.
Changes in the uAPI are expected while the driver is behind these
protections. STAGING will be removed when the driver uAPI gets to a
mature state where we can guarantee the ‘no regression’ rule.
Then force_probe will be lifted only for future platforms that will be
productized with Xe driver, but not with i915.
"

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Radoslaw Szwichtenberg <radoslaw.szwichtenberg@intel.com>
Cc: Maciej Ramotowski <maciej.ramotowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f6f3b491d162..1a410edd38e4 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -2,6 +2,7 @@
 config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on DRM && PCI && MMU
+	depends on STAGING
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
-- 
2.39.2

