Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E5C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAE810E09C;
	Fri,  3 Feb 2023 20:24:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D108310E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455865; x=1706991865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ed5IYhb/fJbZzVgI7i3nOOUUT0EvfPOwFvy0IpwJpKM=;
 b=V54MEd+P0r2GxmOrrNrZFPPhHXn+ie87HXOH9OmrfnGAgXQVU4vdq+mT
 roE90Sjloe7PyL1Tp5MfSGi09kXyf/8wexVuAmpYVchi6smwoE1u9GVdP
 YEAh+RTtyrV3WZzvWFdz8dZNi+H6R4EUrOS7HOB+S00jmuD7cMn9kqzgZ
 fbOzG08ilQkZwNrzsmPALLDC52TWFd4Ki987lrESJ9OBJiJQLpGIYmWkP
 GDphtdFxfB/dD9tcGCdwE/o/doeDjQbxKSc0BIMxKlZzARPI+M9gTnqMm
 2Rrdb1oJuOTU/VBilFXlJ2nYQe/r15DiaxPjT6lCagGlkCMZ1uQ2S67Ie g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330975700"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330975700"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729376752"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="729376752"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 12:24:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATcoIsP9Y3DoVdIBcgbtHV4Ojc1kD3awks0bHMuSoDdYORyjS1LbseVH3ISrke3W12NMYfRMKpoDrREHViVUJO0qb4+DnbACiWsHMoPXYChI/bJie+XfXZZjOBnj6YDvqeUSKHhIGWMnIuVJawR8hPOwsFRyBvwnf6vbxAVKQeJSadHVkVIxi+IlZa+oOqJQ1GQtw7SnQM8VHqLB3/E6+6WemEAgn4Ut2psZ3SyzoKY6o2IrlVngWKgFSSbpi3eUcqf4oYt+g34QNWGy/N9A9O7St2nLIWFg3cYQ20SmiUHSVSs/g9C72rBVGMiPsoK7WI5W+dCVvcNXr38cOeHjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g3BcDY1BloNLmRQhC3jI0h8lYf/HmQWWwWYbj8f5MM=;
 b=RrppHbJ6spYsp37GCxDaKohYoMu+VExNC3gXGxKlmdL0Uov0xIrJzXN4y2pqdE2OUeIfpRf/rpidmntXuPNyc2As4kjphFDspGMi5FkuYjEttfzsJrifQ42/+2j6nZkctPrzL/jogxUyknpVE6n1cTqOSBgz3n/TWSlrWKuXBVp8WFCFT7bOjesW4VgUWrN1hvyHdn8QrWoEaAxXwMh1bwsUV01O+zEl2Vf+U5d9nqze7Q+qmMAHZmbgMe9yGnqQ4m4iNFm/f+PaGJdg2UyTMib7rcM2pnrPEg2T3lG9Tko7cKSOMFh1vdTZJqIpJtdAWkz8AGzGQyl+baHHGZ6Ovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:49 -0500
Message-ID: <20230203202409.577032-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: a30f115b-12d8-4e8f-3f04-08db0624a238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUYe5kB5d1Dm2dhxYxSuf6msD3ww9n7mmAZ+sgjRHVo9bvcdnNzBEbQPDdfXD6nlfNt4sWCU1nZf5Ur9AgSeFPt6kQmh87IMSrySUuAJ+wBf6RWKp3bYXIvFzGa7nw6Y0W9NsVVZls3jZ8cxTawU9aIOAixWEmcNDb7qaQwLdxuiECfG8U8v9EN24QqF06uGJD4iuXZSMdrkznWUnrxSM44eCDNvPLB0feixGfBFqZsk5RdTi8yCzOEosLrAlBFCIwTwoaR2oMIO1qhmDG1xPMXvofao3Ng8Kcp6pxvhoLPakmJ3xQa4GRwFP32Ep2zAnK4+/nis166h4aXWyLsSl7Edrjw6gyrDWP9FHlgO/OP1ccI/2Hr5XJHj5EdlMKpJFFRBh5VoYaPP4tvXcB/+MpbJaOYiae/krlDsScIh10q6VO0Xxf+HLnAXy5p5Jawlvja0NNUFMdygGOJf8rndAaR++2UgFDCPVvdrKUN1v/S//FUhrHJTjLqjmNIu/XyUhK1vyrepvKZQU4lJ1g7QMp/xRxYGx1El/M6CpAu9NuYgQqs38uhQ9eZKSjU3V9MUiB+H96S59gIUE1SNUPPeZhMwkGUgB06fslnmBxYL+akGHMAqy6x18f7X8y0mIc9xE4o/OziUDoVPTdqEyRsQ1KUFlkKeP3tWbY20Q3HuFBxqxY+O5OKP1TRJoKpMO5sd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(30864003)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBIeWNYNzhVV3ZmNzNGVy9Sd0JlUlgwL014Q3NlTUpGQ1pPM1dvQUJlUmpi?=
 =?utf-8?B?ZlB0dVprZW02M0FQT0Q5MnlsZmU3V3dTRkNGejVzbXh6S0UrYU0yQmZFbHAr?=
 =?utf-8?B?TjlXcDh4RlFKWElVYnNsYXhaVUhlSFdTdTRrOHNVSlhJMVQ0SlpTQXJ2Ukoy?=
 =?utf-8?B?WUhvQ1k0Sk40K2NCWTdDRXdDRjVPbHZzZmZjMjhVQ2ltd0MyVE91ako4aVIv?=
 =?utf-8?B?dWRjZjlkOW5VNGh6MWhTVmUzNGNUb0w5bTFEQ1M0eVRwYXFPdEI4OW14ZHor?=
 =?utf-8?B?Y1dBSUgrSGdvcU9xT1NXb1ZBTkk3ek5vZko1YUpUdGFwMWFVZStMclZjdnNJ?=
 =?utf-8?B?OXc1aEh5SmpPNlVZWXI1bXZuNW5lZGU5cHNzTGc2SlBOd3plNnBTeDR1bDFN?=
 =?utf-8?B?SFVJb0E3NnVtcjV1emJzay9IYzVwbW1yNFFGQ3pZMzltQldPcWpFSXdVL3h5?=
 =?utf-8?B?UW9kaWRqazU0elFwZkl1d2dKTkpBQURZL0kwMERYTkxkMm40OUNuRm5BL2RR?=
 =?utf-8?B?OEovRzVjUkdkL3pkU01pSENFNi9zSlgvSTdYQXpxQ1doNk1iVnBMdmdxQjU2?=
 =?utf-8?B?ZHdvWDJCdXdnNFYvY2VTR0FYTjQ3dTVFeitkV01oRG4yN1FuSHE0RDB1SUFj?=
 =?utf-8?B?VnExTU10U0RtT01Rdm5DZWVwZndiSjdhbXIxUWFBak1SakpabVRDQnhoY1pZ?=
 =?utf-8?B?VXczbnhFS0htcVNJZm45cURiUTd3UGkwSndxSlh2aVU1NERuZmpUeU1DNzRZ?=
 =?utf-8?B?UWtvUmU4bjVFUUJrbmZKUXJSWXZsSmc5TjNJc0theG5LRVdTWGJvQVk0VE1h?=
 =?utf-8?B?Qk5Pell1aDMwUUFTOVdSeVphQVF4bk5qNEEzUjd4Z1hjYWY4SXQ1RXFjNENt?=
 =?utf-8?B?YTd0dHl1UnFYWU5SWWZ1RXpiTEZ2ZVFHRXRDTmdlZG9RQjJvcFJjWWhoWkpV?=
 =?utf-8?B?T3VTdWkxRjJtcUMzQlpabzdPcG9sdkdhZkwvZU1jWmVWYjBSSjE3MVZ0NFlS?=
 =?utf-8?B?TUlTY29ackdTeURablJTVGNTcnZaM2F3Rk9NeHJ0cnhQWllVSzJaeEhXWXJj?=
 =?utf-8?B?eTVQcXpVRG9OdTJaaHY3YUsyNE4zeWZGMmtGdlZpT3BQdnErelJvZFZ2SnVX?=
 =?utf-8?B?R0Y1aXNHN1o2T3lmMlluRHhXcVROY3pNKzJVb2x4RmplbWR5NnpnRlg3TUp6?=
 =?utf-8?B?OTJVS3dpc2hkcTVORStsdHVheFNVSEFtdFpkSTAzQ3c0MjNlNUxMdHNVY2R3?=
 =?utf-8?B?TnNQS0ZqbVd2aDBOSDFVWS9SVGhPZTRLQm8vNTBVN3pBYkJNUmpndFVtRkZZ?=
 =?utf-8?B?L0tzTy9QcU9oK0VuTzJsbExWZmlZdWRxZ0R5ZzA3UkJMSG9YSCtJVW9wOXlL?=
 =?utf-8?B?NlVSWXZNYUI4Lzhmbk1tbFp1amZyeEFVcGJTTlB0aStJNUxVdnM0Zy9mTVQx?=
 =?utf-8?B?N2FXaFZFb01ETVZEL244WEJNY0t0ZEpKSURQWWN4WU9qNEpMUDArZnhNOTBq?=
 =?utf-8?B?Nzhic1V3ZlN0bXJCSjRETFVPbnhob1NWYWF6cTZLUGxVN1ZyUFQ3cGQ5Qk45?=
 =?utf-8?B?M1orTldPdHJLOGFJMUVCcktGUy8vbU5ieVh1TXFZNy9NTW93YzBCKzQwcmhE?=
 =?utf-8?B?eU5ZaGcrTEY0WW5Od2I1blo4ZzF6cDdkZmtCWktDSGRVcTcvU0FMSVAxNDRF?=
 =?utf-8?B?UDBGL2hQbm1EOGNzM0I3TmJlREUzNTdZR09yR0duNi9KUFpXanRPRXFxSlRh?=
 =?utf-8?B?UXFCd3Ava2FGN2l4RDVtamU5SzJaQWJZM3E1Z0ZqUCt5RHFXWU1ES3RtK2VN?=
 =?utf-8?B?cGwvQzdRMmllbUZrMnQ4L2JhSmt5QU9tRDdJZnlsdExhSGV0c3VnUk53SHV2?=
 =?utf-8?B?ajNlVTFtcTk2cVBzcksyK2dJVXNGY1dEL1Bva0EyWEU1cGFoT3B6WDRtZ0FW?=
 =?utf-8?B?Z3kyMkxhb0YwOGMyd2JTV0ozRE9GQnQrSklCcGJ6Vy9CRlNldFdsK3RhUm1X?=
 =?utf-8?B?WURtRVNmeThVaUd2T2ZKWkNiRnFHT1hXb2RsQnJreUI0Mi95S2RFSTlrR0Vl?=
 =?utf-8?B?MWh0eE4xOGdvdVFobGFaY3drd2dsY1BMd0w2a2tkYTc0ZlZFZlpqanB6WTVK?=
 =?utf-8?B?SzJmOGVmNkprZ2YwQ3hzRm8vM0pXb0hZdkZ6b1hHZUM0OXNwcE14RkpaeThx?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a30f115b-12d8-4e8f-3f04-08db0624a238
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:21.6053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YlfqdRJT4vnTzM4yk3glC8xii36sg/jo21FoRhZpnQk/iqMdZjpXTv73d6k279aS0OyK5mjZqMiT/79mNGl/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 02/22] drm/xe: Break of TLB invalidation into its
 own file
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

TLB invalidation is used by more than USM (page faults) so break this
code out into its own file.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_gt.c                  |   5 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  99 +----------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h        |   3 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 115 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  19 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c              |   1 +
 drivers/gpu/drm/xe/xe_vm.c                  |   1 +
 8 files changed, 145 insertions(+), 99 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 74fa741b1937..d36d0b12f6ff 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -56,6 +56,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
+	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8a26b01e7d9b..1eb280c4f5f4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -19,6 +19,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_sysfs.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
@@ -571,6 +572,10 @@ int xe_gt_init(struct xe_gt *gt)
 		xe_hw_fence_irq_init(&gt->fence_irq[i]);
 	}
 
+	err = xe_gt_tlb_invalidation_init(gt);
+	if (err)
+		return err;
+
 	err = xe_gt_pagefault_init(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 7125113b7390..93a8efe5d0a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -10,9 +10,10 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_pagefault.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
-#include "xe_gt_pagefault.h"
 #include "xe_migrate.h"
 #include "xe_pt.h"
 #include "xe_trace.h"
@@ -61,40 +62,6 @@ guc_to_gt(struct xe_guc *guc)
 	return container_of(guc, struct xe_gt, uc.guc);
 }
 
-static int send_tlb_invalidation(struct xe_guc *guc)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-	u32 action[] = {
-		XE_GUC_ACTION_TLB_INVALIDATION,
-		0,
-		XE_GUC_TLB_INVAL_FULL << XE_GUC_TLB_INVAL_TYPE_SHIFT |
-		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT |
-		XE_GUC_TLB_INVAL_FLUSH_CACHE,
-	};
-	int seqno;
-	int ret;
-
-	/*
-	 * XXX: The seqno algorithm relies on TLB invalidation being processed
-	 * in order which they currently are, if that changes the algorithm will
-	 * need to be updated.
-	 */
-	mutex_lock(&guc->ct.lock);
-	seqno = gt->usm.tlb_invalidation_seqno;
-	action[1] = seqno;
-	gt->usm.tlb_invalidation_seqno = (gt->usm.tlb_invalidation_seqno + 1) %
-		TLB_INVALIDATION_SEQNO_MAX;
-	if (!gt->usm.tlb_invalidation_seqno)
-		gt->usm.tlb_invalidation_seqno = 1;
-	ret = xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
-				    G2H_LEN_DW_TLB_INVALIDATE, 1);
-	if (!ret)
-		ret = seqno;
-	mutex_unlock(&guc->ct.lock);
-
-	return ret;
-}
-
 static bool access_is_atomic(enum access_type access_type)
 {
 	return access_type == ACCESS_TYPE_ATOMIC;
@@ -278,7 +245,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		 * defer TLB invalidate + fault response to a callback of fence
 		 * too
 		 */
-		ret = send_tlb_invalidation(&gt->uc.guc);
+		ret = xe_gt_tlb_invalidation(gt);
 		if (ret >= 0)
 			ret = 0;
 	}
@@ -433,7 +400,6 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 	if (!xe->info.supports_usm)
 		return 0;
 
-	gt->usm.tlb_invalidation_seqno = 1;
 	for (i = 0; i < NUM_PF_QUEUE; ++i) {
 		gt->usm.pf_queue[i].gt = gt;
 		spin_lock_init(&gt->usm.pf_queue[i].lock);
@@ -482,65 +448,6 @@ void xe_gt_pagefault_reset(struct xe_gt *gt)
 	}
 }
 
-int xe_gt_tlb_invalidation(struct xe_gt *gt)
-{
-	return send_tlb_invalidation(&gt->uc.guc);
-}
-
-static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
-{
-	if (gt->usm.tlb_invalidation_seqno_recv >= seqno)
-		return true;
-
-	if (seqno - gt->usm.tlb_invalidation_seqno_recv >
-	    (TLB_INVALIDATION_SEQNO_MAX / 2))
-		return true;
-
-	return false;
-}
-
-int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_guc *guc = &gt->uc.guc;
-	int ret;
-
-	/*
-	 * XXX: See above, this algorithm only works if seqno are always in
-	 * order
-	 */
-	ret = wait_event_timeout(guc->ct.wq,
-				 tlb_invalidation_seqno_past(gt, seqno),
-				 HZ / 5);
-	if (!ret) {
-		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			seqno, gt->usm.tlb_invalidation_seqno_recv);
-		return -ETIME;
-	}
-
-	return 0;
-}
-
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-	int expected_seqno;
-
-	if (unlikely(len != 1))
-		return -EPROTO;
-
-	/* Sanity check on seqno */
-	expected_seqno = (gt->usm.tlb_invalidation_seqno_recv + 1) %
-		TLB_INVALIDATION_SEQNO_MAX;
-	XE_WARN_ON(expected_seqno != msg[0]);
-
-	gt->usm.tlb_invalidation_seqno_recv = msg[0];
-	smp_wmb();
-	wake_up_all(&guc->ct.wq);
-
-	return 0;
-}
-
 static int granularity_in_byte(int val)
 {
 	switch (val) {
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
index 35f68027cc9c..839c065a5e4c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -13,10 +13,7 @@ struct xe_guc;
 
 int xe_gt_pagefault_init(struct xe_gt *gt);
 void xe_gt_pagefault_reset(struct xe_gt *gt);
-int xe_gt_tlb_invalidation(struct xe_gt *gt);
-int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 #endif	/* _XE_GT_PAGEFAULT_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
new file mode 100644
index 000000000000..fea7a557d213
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_gt.h"
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_guc.h"
+#include "xe_guc_ct.h"
+
+static struct xe_gt *
+guc_to_gt(struct xe_guc *guc)
+{
+	return container_of(guc, struct xe_gt, uc.guc);
+}
+
+int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
+{
+	gt->usm.tlb_invalidation_seqno = 1;
+
+	return 0;
+}
+
+static int send_tlb_invalidation(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 action[] = {
+		XE_GUC_ACTION_TLB_INVALIDATION,
+		0,
+		XE_GUC_TLB_INVAL_FULL << XE_GUC_TLB_INVAL_TYPE_SHIFT |
+		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT |
+		XE_GUC_TLB_INVAL_FLUSH_CACHE,
+	};
+	int seqno;
+	int ret;
+
+	/*
+	 * XXX: The seqno algorithm relies on TLB invalidation being processed
+	 * in order which they currently are, if that changes the algorithm will
+	 * need to be updated.
+	 */
+	mutex_lock(&guc->ct.lock);
+	seqno = gt->usm.tlb_invalidation_seqno;
+	action[1] = seqno;
+	gt->usm.tlb_invalidation_seqno = (gt->usm.tlb_invalidation_seqno + 1) %
+		TLB_INVALIDATION_SEQNO_MAX;
+	if (!gt->usm.tlb_invalidation_seqno)
+		gt->usm.tlb_invalidation_seqno = 1;
+	ret = xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
+				    G2H_LEN_DW_TLB_INVALIDATE, 1);
+	if (!ret)
+		ret = seqno;
+	mutex_unlock(&guc->ct.lock);
+
+	return ret;
+}
+
+int xe_gt_tlb_invalidation(struct xe_gt *gt)
+{
+	return send_tlb_invalidation(&gt->uc.guc);
+}
+
+static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
+{
+	if (gt->usm.tlb_invalidation_seqno_recv >= seqno)
+		return true;
+
+	if (seqno - gt->usm.tlb_invalidation_seqno_recv >
+	    (TLB_INVALIDATION_SEQNO_MAX / 2))
+		return true;
+
+	return false;
+}
+
+int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc *guc = &gt->uc.guc;
+	int ret;
+
+	/*
+	 * XXX: See above, this algorithm only works if seqno are always in
+	 * order
+	 */
+	ret = wait_event_timeout(guc->ct.wq,
+				 tlb_invalidation_seqno_past(gt, seqno),
+				 HZ / 5);
+	if (!ret) {
+		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
+			seqno, gt->usm.tlb_invalidation_seqno_recv);
+		return -ETIME;
+	}
+
+	return 0;
+}
+
+int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	int expected_seqno;
+
+	if (unlikely(len != 1))
+		return -EPROTO;
+
+	/* Sanity check on seqno */
+	expected_seqno = (gt->usm.tlb_invalidation_seqno_recv + 1) %
+		TLB_INVALIDATION_SEQNO_MAX;
+	XE_WARN_ON(expected_seqno != msg[0]);
+
+	gt->usm.tlb_invalidation_seqno_recv = msg[0];
+	smp_wmb();
+	wake_up_all(&guc->ct.wq);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
new file mode 100644
index 000000000000..f1c3b34b1993
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_TLB_INVALIDATION_H_
+#define _XE_GT_TLB_INVALIDATION_H_
+
+#include <linux/types.h>
+
+struct xe_gt;
+struct xe_guc;
+
+int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
+int xe_gt_tlb_invalidation(struct xe_gt *gt);
+int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
+int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+#endif	/* _XE_GT_TLB_INVALIDATION_ */
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 6e25c1d5d43e..84d4302d4e72 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -15,6 +15,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_gt_pagefault.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_guc_submit.h"
 #include "xe_map.h"
 #include "xe_trace.h"
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e999b3aafb09..92ecc7fc55b6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -19,6 +19,7 @@
 #include "xe_engine.h"
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
-- 
2.39.1

