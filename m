Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9D8C7618E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 13:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070DB10E980;
	Wed, 26 Apr 2023 13:12:52 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3EF10E980
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682514769; x=1714050769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7EC3J2KiN4AEjEF7Hc+qp/nez2hJZlQmCR//Pl9mobI=;
 b=Mle58cQ/Buyxx10jnaarSSzlIJPx4fIZvJHgYs32YFpOtJvDb8bFNqEb
 QKalu/VcS1GKD1cMQu6uiffVmY5IK0dYv/mIFQxlC+8MxsLNBQecjhIbi
 6mL7ytJz2xloBENRjmC5HasjlM0agPdIrFEseWmuh9tJjfDnQv2LmKoU5
 KjKLvVErveHItLLK0PxvJfghVzg3MqW7CREb56Yh9R/OeQ4Tr4WVr503M
 ghaXGGb8y3o0hoBb238Llg56EQS3JlTbPteXZcveY/jIOLBg07/5hqx22
 2ASTdqS/MuisIET3aWTpzVkvEos7zwlh4JkCeA5cTw67UW14mesv8TnvN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="347124727"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="347124727"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 06:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="805495547"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="805495547"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 06:12:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 06:12:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 06:12:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 06:12:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBtth4G9StoOnHhyj5tzzuWGEYeGexH4fNbgL8Hcc/DHo+EeWCxHKITEsmEicyekhTiYBtyG6XMHtP/iHfrNiiHGfyqXwzg3wpZAKO20G6g0Ckz5CYSYVnXDUhGCIcoST9bdwjV3VndZFwbUk6GY/kQ5vxuhKgGkTeQpHMzvhk5xE008ftkSZspbL2n2Jv2TOlngJ/N11ZmNLP5IgDE7NWkcoLi2gmv7t17JtkFnJ2sPH60rUZLsysoLMVJRG7HfM6xPcsa10ZYBVxpdXC4I3UwXlJvMfxfi5JP1Ge7yhOziD+//ae1whpCQvKJY+SGqyH16oG2SRSE/9fJeAV41SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNyCg/nbjzvQrOJf01/po8tonQbCZAUQgsZjh6Jkcb4=;
 b=Fyt+3g+9I/utG405B28CuLMRxtcfy3OyXntk9lqAgEKdleVix8eyT2hxmaBxMs1XXoHL0RXI0SSydSfk/LR3w+EzmvUianlVb4xZPVtxUvZGPStfLs7IOxEqgyIC8LRYjALLkb8J8WXkMJRbhFePjzuaY5rE6AHn/OSYW//x1JzQLbeVHd1KT6nCYiURbvH8slRGHgqYRN7Vls4BlkWiSkAuKp0dZ61obqydweNH6chCUYqLgxxrNc0Ve2TrN7nsAqoRhBCGfBUoWm+qNeBvucXRsbMRsrFyZVd578yAVMHVVoMJJ//VvEmvsjcAoum0ezCdu3gKWqJAMY+1rdhRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Wed, 26 Apr
 2023 13:12:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 13:12:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Apr 2023 09:12:34 -0400
Message-ID: <20230426131234.482201-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426131234.482201-1-rodrigo.vivi@intel.com>
References: <20230426131234.482201-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: f71ba9d6-a2c4-4ff4-a257-08db4657eccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kxfk2sr3o/xfH2CH2q7HBjhXQHfZz0laYgbZc4Yv6ric620VYSr1nC+hPmG/tnIuEB55DL4obZQ997JnhPZr1OyiWMl56FVGzfOSdwfjM2lLvfHyL4BtcKvnVgVSA4jXmQPkkNjHYuqCSEXwEy4OoXklXy25y1EoBbu2l6sRCB5AM0CEmjpBNWu7gKPfKobnwmBMNvtCKvYc4Y9n28eEqM4ZuJGdQjX29/9SBiLB0GbKGh9dpTSBBxnKiKObaeMlw7jBnRi3pj0A6Ps7WlLBInZha/MWOJEzY2YEaEP0aMFEVu+xXv36cczcwy/pJ75AaOitI455oP9jdSIZL8I0idQ/fYnKy6B7DfqwoqgQhM+iFchI4/9uKTZyrSjfcpC0BAicEoytfA9HTs8nMsAT8ia8Pe2HNkAcaavpkJHIcJZFkRzuo/CTwUTQxgfuH8l9YgyUXn3azbLQ9ibFNQyf/TzzWTntKnoBARgbS8itxvVpmGRwhY2+s9qZpooIlOUgVRC2H6veKacZrPlmF7RdG1FU8pDVdXHXSMjfJkI8SGs3rxMOPdETNt3lHzZZlR50Vqnz2UjCaYGwjpWL63hFJBTjlEm5L6L75tjorwm3dpFpiFlZzR4Rnv7vVqYRhYr9EojaAX3aeXKgvrsoYN40WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(66946007)(44832011)(83380400001)(2906002)(26005)(6512007)(1076003)(316002)(82960400001)(66556008)(6666004)(66476007)(4326008)(6916009)(6506007)(66574015)(2616005)(8676002)(41300700001)(15650500001)(38100700002)(8936002)(5660300002)(54906003)(86362001)(478600001)(36756003)(6486002)(186003)(42413004)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0FVV1NHbGxrRitSbVpqNVI2aXREUTRBZHI3OVh0VGpGS1kwUjV6TFNEYWFE?=
 =?utf-8?B?YkdqWDFVeEhQK3o2SkcycTNlYmplbWR4WktpZHZoSUtxeUhCdzR1VlhWUkc0?=
 =?utf-8?B?Nlh2VXV2NzRUMkxxNU90Q0pteGYxeDV2UnNMZXhneVdBenROL0hiQ2IvKzEx?=
 =?utf-8?B?WEpVckh0MlVyZDFyZENKaDZBTzNnM0lDaGIveVY4aXB2RlpLVGtEdlRUZlNJ?=
 =?utf-8?B?bzFITzdTclVXRDZJRGdNdmhEcURIcXQ2YVI0NmFsVEpWTjJ3U0xiQk4zaHFt?=
 =?utf-8?B?MUNjaysyTk90YlprbFQ0QmRORWwrdWlTUEJIZnZ1QWpFT3loUW9UeDRDa1By?=
 =?utf-8?B?TjRmNDVTb3dIV2ZFMnpnand1M2tYNUFWaHZoSFJxL1I5RUZzSFllZ3doSVgz?=
 =?utf-8?B?Y1NwMnFqTGFFS2pKSzZnY0RoZlBwWkNOYjU3bHp3WVMyOVFTL1FWZk9SZCtk?=
 =?utf-8?B?b2RpZFBsT2tpQm1zWUFVTmNRMThoYWZyR2RNamdFRWQ0Vld5VVZxU0paZXZL?=
 =?utf-8?B?dTlEd1VDQWVYQnEweHhqVi9CTHVCajhnUlBqZE5DdkZPRE9YdXBIcStoampt?=
 =?utf-8?B?eERQczFOVWVXK1VacElGenJzTUlIMEw2aXNGU3Y0V0VQODl5S3F2NXFCVmlm?=
 =?utf-8?B?UXkwMk5wcG45eFBnMnY5dXZxWUlNWGdKR2Q1TFp6QzZVcG9jTDZuTHpVSC9X?=
 =?utf-8?B?bGdOU3Z5US9yQXA5eEd0OWJyOUY5MkdWcWNJbUd4WmR4eTdTcjBOUHJuL1VC?=
 =?utf-8?B?UUdBb2xKT0NzSHZZTkhDVUVTa2tkUFgyeitzSEpQNjhMRGF1L09nRU52bkQy?=
 =?utf-8?B?SEVmRjUvQ1Z4dlNFUXY2M0NLV2FDMXVqdnRETjQxdmQrUmpnd3FxYkJtVjRh?=
 =?utf-8?B?bmNQejgwSnNwQ1Z3Z0tnc0RsMTRmQnNtRGdXcTl5TkdpeDZzRGFhcDBtdFFS?=
 =?utf-8?B?S01QUlRxamVaNEUzWUJscGN6S1BwN2haZStnMjBmdk53cGpJY3JMQng2c2Ri?=
 =?utf-8?B?MEV0SkdMSFFQQ1BhRVE0R0lXRGxRUC9JREVOdkw1SHFTSmFweEViOW5lSlBk?=
 =?utf-8?B?RGYzNnkyR2RXQW9xcUZGQ3pXNEljWGVmdFl3b2c4ck1EdS9OQnFmL09xbVNj?=
 =?utf-8?B?TGVSVXBRWFRyL1JiTklPUCtCNmxQbE5neVJod3o1cXYyQ1kyOE9ZL2gybmZY?=
 =?utf-8?B?ZkxTQlBhTE9rM05kR01zOER1VG5QZ3NGTGhaV3hVZ0pTZS9ndy9abytnSGoz?=
 =?utf-8?B?Qm8raHVrQWtUTVM5L2hJendHMlBLTk9ENUtnNnFoSUhDOTkvek0rVFVYN0RF?=
 =?utf-8?B?enFVdjFCRURBSE9jVXlBcUdBK0NUdnpYM2F3VklSaHlGV0EyVjJsK1ZEME9u?=
 =?utf-8?B?QXRtTmNpOTljanJ4UHNtdG1qc0FIV21xc1puUnkzWmd4R21CRmg5SVlLYkph?=
 =?utf-8?B?UGUxTVZLclZDNUVBdDVkV0JFQUthQ3Q0WThWZHBXME1kWnJ0KzkxS1lSbGh3?=
 =?utf-8?B?VktDRlFNaEhZY1ZGSForcHY5WVBrS1NBN1RjSE1HTjg0OWlNelhWVC9mb3dT?=
 =?utf-8?B?aEg2WHJNcjZxRU9hK3BzRjBkUlpmb0ZadWwzQnpmcHBjbjFjMlMyeUZnWDk0?=
 =?utf-8?B?YlFGTEJlRkhuZkgzVmtLM1pRblpqVTc5MkNrakplTzZ6SnR5U3hXMFp5WWQr?=
 =?utf-8?B?MFBPdHdJa2t6WE5JZjVYNnJGMGxqanB1U0dGVThpbm96ZkxRTEpwQkFtS1Bs?=
 =?utf-8?B?cUwwS0dTa1dlb01MbGNnR040WVZvVE9KSm9qait5d3hKMWhZMFJudlZkT0xT?=
 =?utf-8?B?Tk1EQVRUT3pJRTRENG9IRnh3ejRUZmd5M3V3M281ejFkM0ZiZlRWN3l2OHBx?=
 =?utf-8?B?TWRuOThVa25SL3FnWGVpZDRsUE8rZEdJQWk1djhUcnQyNVYvaEZsYVE1QzJv?=
 =?utf-8?B?SGd3T3JtQUlvcHgweGZUS3JYYStQMVlFdElCOGFuVnl6ZHlwV3VtUGhsUURk?=
 =?utf-8?B?VE9IVGRwQWg4WENLcFh2SGYwVTV3MWRES05jdXFERmxMU2JZdVdZRVg2YmM4?=
 =?utf-8?B?Wmd0NFhRRUtvd2M2UUE4bTBHeHJuQmpmYTVBMVBNeXhNMWtCd1dJcmQ3YkVK?=
 =?utf-8?Q?f+4JUD2V/2VHRtPtPndz1aT7+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f71ba9d6-a2c4-4ff4-a257-08db4657eccb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 13:12:45.4614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxanvEX1WxIdXk0xitiLpgRXdrnBCsTCf/gwfq7GC+UxygxlGVIda11mivkGZHnK5BjKvSpThaW6gmGUpwXOSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Update comment on why d3cold is
 still blocked.
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The main issue with buddy allocator was fixed, but then
we ended up on other issues, so we need to step back and rethink
our strategy with D3cold. So, let's update the comment with a
todo list so we don't get tempted in removing it before we are
really ready.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9324aed8a821..f587bd9706af 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -763,10 +763,15 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	/*
-	 * FIXME: d3cold should be allowed (true) if
+	 * TODO: d3cold should be allowed (true) if
 	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
-	 * however the change to the buddy allocator broke the
-	 * xe_bo_restore_kernel when the pci device is disabled
+	 * but maybe include some other conditions. So, before
+	 * we can re-enable the D3cold, we need to:
+	 * 1. rewrite the VRAM save / restore to avoid buffer object locks
+	 * 2. block D3cold if we have a big amount of device memory in use
+	 *    in order to reduce the latency.
+	 * 3. at resume, detect if we really lost power and avoid memory
+	 *    restoration if we were only up to d3cold
 	 */
 	 xe->d3cold_allowed = false;
 
-- 
2.39.2

