Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3360E71D56
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 21:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715A310E13D;
	Fri, 29 Sep 2023 21:02:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF3310E4FE
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696021348; x=1727557348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MYdU0V8ilh7gjmQc8h7+DJmyMceIhxw1/Z8kLLgf9dg=;
 b=ERqyxp21zFtvDSstCcxW1hbQPaw7cgc6kxyJW0Pde1zxluyxRBCy9LML
 DxEma6CwXqlemLNCsRbAK8gCVXJw3fr8xwUuRC4BFL6DoI1C6DKxhuUzt
 NOtTl89ZIg72S2i4KwjUVek8qXnbLcF2OenPmX5FJE6RIYsjQIUKJcuKp
 LW7P5r2u+S1pcaStCRqpePriyBrLJGpHynwGCtaBYMm8Ex6OIP7BJeYbM
 V16Gqre6L/UGih/0THCfEyjDIJu0HpLZPU35DaCxuv2w/JEy1/F0X+j+B
 0xtec95a0uGo+YqT0lMp8lesEJRBnolIgx8jWnFtT1GY/ec8qcKw6DEKr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="385200401"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="385200401"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="779383260"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="779383260"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 14:02:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 14:02:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 14:02:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 14:02:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 14:01:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxFNgZPONO6085hRhlRQbje1B9re6oU1W+bqhUPJcebXQJBSYkU3p91MBSsAd2XLNXTglVQYUb2DbqtQ1dELnFspAor6Y3EYJWeVOsZqDs+ZWDRIqGZ4y0ReavR7f6QZm8mtsWWZuvIV9O2xaTwPuNb/0aYUzzmWeFBY6ENl0wxd9wCuqEzcdAlHTl3NzXzmUv0fy3GI8z9GWYyb7/bGHT17fYgxqDv+GSxUnO3zj88jPM/4I/Coej9bDOvjYEXZkntcUhMQQvhsVZsaljAm/AlR8vC2eQY95FauFEj6THnOcVA5hYT7drWj5wi/syVjtpJ4sb70IpEogEDV7eAt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uo4BqPp8tTWSBtHUCRkWSP1dpOHrUEuNEya2UMQ9PKA=;
 b=fvDpn5xUl/ssskVUSZi09Nzvz08cHT/IUnrvQwqNdJdrcCpDWulThCCAk20htPM4RND5+T02yC2u22iYOlHj/wZWHqKtjsBd7Br2WO9TxYLBgs/h25QwAWmZqxOci4vgPj+tO6GQU94VXWgl41oGlfbRmsiV/rNVwonlKKn+MK8P0YmimI7qpEwO8VbDBq9XqVEAbQMMYpETZZjvOI3GAqLrUAZkISYgNlib6kjr32s176iLoC/Gf0yReEZRpnIEhK8tXUWpn56VqBGTSDlvolYNRwwy3GznJwqv827NxGuvWXnWlBWdxer2DnMg4lv2fc8vtr6xX/gq6I/0OFMjpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 29 Sep
 2023 21:01:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 21:01:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 29 Sep 2023 17:01:27 -0400
Message-ID: <20230929210130.1203203-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
References: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 091a944d-2cfa-4c8e-cc88-08dbc12f45ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URADxKMl8RQNeYlnAmHYDErTKRO/gCxT4fw4P/Ru8lXS7L8JW6v7QSBrZeDWjQ1SdcQr0ON/xyFjwLcu76J1ypwaLma1x9CGWCiLVeDM1kQUOMNTrEKg72+1JwIKfwgR7R3lMXuIgg+b0UM+tTt2NVEAlWbo+v/tuhLKTCQlJ/BJWD0U5UXG1pEDKqu2FvHV8C0YHsLe7ON/OwkaZG6DpzXL02dUFBQrth7wzbn+exvHKoxLqoa/yl+9oN+Dq7Lj99Q+ExnKHooYeG5jAhiD+Vq9wZmna2E/TPcg8GjtgvFiC3vhC1bgI4nQEBoCNQNywLLGSRHpMsPd20MzHCG4Y1+jCXLvt2WtxM05zjPpLJDROVI3jUVFsdWSp9V2E7y0TTsDDlwJnRs6csrZb3/5Km9j/QjPy36s5BrCqyBa1vpXCvX5IGkKZ+taV+VApNRfJSEUf2I8x/8CCWMfioYZK2pwjrqft4s8kqJHIxPGwfgWmS8D3hZmpCWU+b7y3svKu5B5eCh34Zxjm7xIQcX9CIrmPZbf7DTh+UZT8SjDrTwiOmv3Pbbn+xlWEWDux693
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(1076003)(6666004)(5660300002)(38100700002)(36756003)(6486002)(6506007)(6512007)(6916009)(107886003)(2616005)(41300700001)(26005)(66476007)(82960400001)(66556008)(66946007)(4326008)(8936002)(316002)(86362001)(8676002)(83380400001)(478600001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlAydGRoYkVZVWZkZ0h0VENnejVKWDdGbm5aMjVGOHJrcTZ1RTQ3bzl6Skdl?=
 =?utf-8?B?a1IxRWZ0dVg3M2RiM043YVZHVWdEeUxhSmZyd2lmYm9UbllHTGpVekQ3K3BC?=
 =?utf-8?B?WndEWWFxSng5MEV3MG5sYzJEbG9BQkZYZjhQU245YmYzNE0wRmN0MzNmTFVx?=
 =?utf-8?B?SmQyY0QzSGN1Q3BWTkxMU0FNR21RZ0VSQTVoWndCbG9iV3hWaThsNkNFTTdT?=
 =?utf-8?B?VTRmNDA4ZHBBU3ZPVXRpN3VKQ3o0eVh3WU5HMlMxQW1BcDNaOU40QXZmQUNu?=
 =?utf-8?B?SjE3VTI0THhNcmJnZGhObmc5aUxrTU54UnNneUdhejFYR29FUlpsN21YYWZ3?=
 =?utf-8?B?SXFUY2ZlaVQzTWZQUVEwdnNhblY0a0ZZRlJydFBodHNYQjVqbTlhTVc1TFNJ?=
 =?utf-8?B?VEdDR0p2WlBmQldLMVNCMHRKVG1nSEZRbnBjd2ZVMmpKaDFBbU80SDBITkYx?=
 =?utf-8?B?SytEd0krM2lYOTgreVJ0MnB1cEhZN0htWVRsTnRvblBRczdvbFBvcC9wZXpa?=
 =?utf-8?B?TmhldlV2azk3TWxxdG45Y0Uydmx0aFZuK1dzb1ZNeDkzdmloQnRUeHZKOC9s?=
 =?utf-8?B?d3NNdHNDNzlxMll5Um95UDR2SzN1SE9sUEJQeVhaQzBEMTJIbkpJZU5EOUN3?=
 =?utf-8?B?MmZJTWJkb2xGV05IWXhCQ25NTTU1VWFQQlJKSmlPTks0c2x3bTNYdHFxcDJ2?=
 =?utf-8?B?RGZXMHAwUk1MSGE4MHFmekFlYnVlUjZOTVhyRnRzVUFRcnRKZDdVeWo4LzRC?=
 =?utf-8?B?bkgxL2JGYmJrd2dxelVXS1E5bEptS3U5S3FBcDZJR3dHSU1RdklCY29Kc2ls?=
 =?utf-8?B?WDlBL0RSR0Z5OHpIRmVVbnMrdEdBSWhoYnk0KzhCVFRhTlFVTzVZekpLckkv?=
 =?utf-8?B?dWc0NEdRbkYzUmVIR1NXeE1SL2pYejF2SldBcnJFazg4MFFqdlBjNVhyWTNm?=
 =?utf-8?B?SVpQbldYUnJDSHlkVUQ1WWhLY2h6QUt3b24yOWk4Q3JPS2NNeXJFckdpckFw?=
 =?utf-8?B?ZGtXbXZTVkQxY1VaYVd1S0U0c28zQ2wxT0tmdUVkWU9NL0NzTktwdHoxMWcv?=
 =?utf-8?B?UlM4QlRlYjNvYW84OFB5WDkzdFNVRi92azRpYTZjVVYrVDdqQURTUnZSSW4v?=
 =?utf-8?B?S3gwKzQxMlpUd3REYUZlTzhyQnhhQXpQUkZwQ0N0MGROSExtdW5mZXZocWJk?=
 =?utf-8?B?TUpBV3JGcEp6cjUvSFFWamducHNhVENWQytKdVBxREhsdml4RUI2UW9QbFBw?=
 =?utf-8?B?enYyQTlKNkZCSVdoSTBtWnFJL3k3b2lxWnl6UEZESlFVeU9WbE4zdmtiN1Vt?=
 =?utf-8?B?OHVSaTR1TDRsbUYxSS9EaGRGTkdDcG83ZnZFcHR5YW8yem5uL3BBeWtIc01Q?=
 =?utf-8?B?ck8yVEx2bkhkbnNwRnNqMFpZV1hLMkJUamtSU1dGbmxEK09YaEtIY29uNGJH?=
 =?utf-8?B?S2JGNkVEenlvQjRST2E2cXcxQzV2VkYvK1haTWhEdGYrakQxZ3ltR2pFQXkz?=
 =?utf-8?B?RmlOSzU1QllZNWpVclMvckozL0Q2L25penRZRzRJUGdNQmpxSDNQWnF4VW1S?=
 =?utf-8?B?b2FOM1phVXZ2YmFueUovdUlkY21PY1lpcjZ4TXRUcWpOK21sTUFmOTRTRGxn?=
 =?utf-8?B?MGZZaUJQVTNOdm9ld2JGTk1vQUNJaW1OdHNRY0RQNy9CcWlKVTBGeGRkd3dm?=
 =?utf-8?B?R3pBeXFpaHJCdjBVaTh5c0FZZ0hXK0dOMzZiNUNUcTdvYVhnTktxa1JXS09r?=
 =?utf-8?B?MVQycitRN1pRMFRxbURua0I1OW15dWhrN2YvQ2NLRTd1cDA3UUt5OVpzUEpZ?=
 =?utf-8?B?UEdqQldCdW5yY0lrV0N0QUN5dTFxY2l4MkZkS1dDWnE1c20zSSthQ3Uwc1pX?=
 =?utf-8?B?aUJMb1RvUEM5NTBSeTQ1d2NjT2dDVXVpZEhxYVE0dGFPL0RmSHNXV2VyWnJl?=
 =?utf-8?B?anlRSE5mS21RTE1IYVBkVGtPUEo2RXdVM0dCNENjVWowNkNubDVlZTdEU0d5?=
 =?utf-8?B?NlozUnUzNkxMMVd0SU95L2huRVZSTnp3VHRHQVVDRWhoeUZBUmJYcWMrZGYy?=
 =?utf-8?B?QnhGdGE0QnNZOVZDbjlJZEV1aDNOUkQ2QzdwK2V3cVVOK21SbnJ1djVpZDdl?=
 =?utf-8?B?QTJ2eGZKNzByVnFYMjNPb2N0SG9tOTBUOGw4V3lJZThjU3Btc29VMlltNm5j?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 091a944d-2cfa-4c8e-cc88-08dbc12f45ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:01:38.6821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83rjHceWsl6iYOp6SLydYcw3ScmneZA09G3YnlZKloPI8q1ofHFvPDOktFSs8UuOM0iKiwbwkDp7vzMJGEMfvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Kill xe_migrate_doc.h
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Keep the documentation inside the code.
No update to the documentation itself at this time.
Let's first ensure that the entire documentation is closer
to the relevant code, otherwise it will get very easily outdated.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_migrate.rst |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c     | 79 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate_doc.h | 88 -----------------------------
 3 files changed, 80 insertions(+), 89 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_migrate_doc.h

diff --git a/Documentation/gpu/xe/xe_migrate.rst b/Documentation/gpu/xe/xe_migrate.rst
index f92faec0ac94..e7f8f74609a0 100644
--- a/Documentation/gpu/xe/xe_migrate.rst
+++ b/Documentation/gpu/xe/xe_migrate.rst
@@ -4,5 +4,5 @@
 Migrate Layer
 =============
 
-.. kernel-doc:: drivers/gpu/drm/xe/xe_migrate_doc.h
+.. kernel-doc:: drivers/gpu/drm/xe/xe_migrate.c
    :doc: Migrate Layer
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cd2e00008aab..853e707d8d8c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -33,6 +33,85 @@
 #include "xe_vm.h"
 #include "xe_wa.h"
 
+/**
+ * DOC: Migrate Layer
+ *
+ * The XE migrate layer is used generate jobs which can copy memory (eviction),
+ * clear memory, or program tables (binds). This layer exists in every GT, has
+ * a migrate engine, and uses a special VM for all generated jobs.
+ *
+ * Special VM details
+ * ==================
+ *
+ * The special VM is configured with a page structure where we can dynamically
+ * map BOs which need to be copied and cleared, dynamically map other VM's page
+ * table BOs for updates, and identity map the entire device's VRAM with 1 GB
+ * pages.
+ *
+ * Currently the page structure consists of 32 physical pages with 16 being
+ * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
+ * several pages are needed to setup the identity mappings (exact number based
+ * on how many bits of address space the device has), and the rest are reserved
+ * user bind operations.
+ *
+ * TODO: Diagram of layout
+ *
+ * Bind jobs
+ * =========
+ *
+ * A bind job consist of two batches and runs either on the migrate engine
+ * (kernel binds) or the bind engine passed in (user binds). In both cases the
+ * VM of the engine is the migrate VM.
+ *
+ * The first batch is used to update the migration VM page structure to point to
+ * the bind VM page table BOs which need to be updated. A physical page is
+ * required for this. If it is a user bind, the page is allocated from pool of
+ * pages reserved user bind operations with drm_suballoc managing this pool. If
+ * it is a kernel bind, the page reserved for kernel binds is used.
+ *
+ * The first batch is only required for devices without VRAM as when the device
+ * has VRAM the bind VM page table BOs are in VRAM and the identity mapping can
+ * be used.
+ *
+ * The second batch is used to program page table updated in the bind VM. Why
+ * not just one batch? Well the TLBs need to be invalidated between these two
+ * batches and that only can be done from the ring.
+ *
+ * When the bind job complete, the page allocated is returned the pool of pages
+ * reserved for user bind operations if a user bind. No need do this for kernel
+ * binds as the reserved kernel page is serially used by each job.
+ *
+ * Copy / clear jobs
+ * =================
+ *
+ * A copy or clear job consist of two batches and runs on the migrate engine.
+ *
+ * Like binds, the first batch is used update the migration VM page structure.
+ * In copy jobs, we need to map the source and destination of the BO into page
+ * the structure. In clear jobs, we just need to add 1 mapping of BO into the
+ * page structure. We use the 16 reserved pages in migration VM for mappings,
+ * this gives us a maximum copy size of 16 MB and maximum clear size of 32 MB.
+ *
+ * The second batch is used do either do the copy or clear. Again similar to
+ * binds, two batches are required as the TLBs need to be invalidated from the
+ * ring between the batches.
+ *
+ * More than one job will be generated if the BO is larger than maximum copy /
+ * clear size.
+ *
+ * Future work
+ * ===========
+ *
+ * Update copy and clear code to use identity mapped VRAM.
+ *
+ * Can we rework the use of the pages async binds to use all the entries in each
+ * page?
+ *
+ * Using large pages for sysmem mappings.
+ *
+ * Is it possible to identity map the sysmem? We should explore this.
+ */
+
 /**
  * struct xe_migrate - migrate context.
  */
diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
deleted file mode 100644
index 63c7d67b5b62..000000000000
--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
+++ /dev/null
@@ -1,88 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#ifndef _XE_MIGRATE_DOC_H_
-#define _XE_MIGRATE_DOC_H_
-
-/**
- * DOC: Migrate Layer
- *
- * The XE migrate layer is used generate jobs which can copy memory (eviction),
- * clear memory, or program tables (binds). This layer exists in every GT, has
- * a migrate engine, and uses a special VM for all generated jobs.
- *
- * Special VM details
- * ==================
- *
- * The special VM is configured with a page structure where we can dynamically
- * map BOs which need to be copied and cleared, dynamically map other VM's page
- * table BOs for updates, and identity map the entire device's VRAM with 1 GB
- * pages.
- *
- * Currently the page structure consists of 32 physical pages with 16 being
- * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
- * several pages are needed to setup the identity mappings (exact number based
- * on how many bits of address space the device has), and the rest are reserved
- * user bind operations.
- *
- * TODO: Diagram of layout
- *
- * Bind jobs
- * =========
- *
- * A bind job consist of two batches and runs either on the migrate engine
- * (kernel binds) or the bind engine passed in (user binds). In both cases the
- * VM of the engine is the migrate VM.
- *
- * The first batch is used to update the migration VM page structure to point to
- * the bind VM page table BOs which need to be updated. A physical page is
- * required for this. If it is a user bind, the page is allocated from pool of
- * pages reserved user bind operations with drm_suballoc managing this pool. If
- * it is a kernel bind, the page reserved for kernel binds is used.
- *
- * The first batch is only required for devices without VRAM as when the device
- * has VRAM the bind VM page table BOs are in VRAM and the identity mapping can
- * be used.
- *
- * The second batch is used to program page table updated in the bind VM. Why
- * not just one batch? Well the TLBs need to be invalidated between these two
- * batches and that only can be done from the ring.
- *
- * When the bind job complete, the page allocated is returned the pool of pages
- * reserved for user bind operations if a user bind. No need do this for kernel
- * binds as the reserved kernel page is serially used by each job.
- *
- * Copy / clear jobs
- * =================
- *
- * A copy or clear job consist of two batches and runs on the migrate engine.
- *
- * Like binds, the first batch is used update the migration VM page structure.
- * In copy jobs, we need to map the source and destination of the BO into page
- * the structure. In clear jobs, we just need to add 1 mapping of BO into the
- * page structure. We use the 16 reserved pages in migration VM for mappings,
- * this gives us a maximum copy size of 16 MB and maximum clear size of 32 MB.
- *
- * The second batch is used do either do the copy or clear. Again similar to
- * binds, two batches are required as the TLBs need to be invalidated from the
- * ring between the batches.
- *
- * More than one job will be generated if the BO is larger than maximum copy /
- * clear size.
- *
- * Future work
- * ===========
- *
- * Update copy and clear code to use identity mapped VRAM.
- *
- * Can we rework the use of the pages async binds to use all the entries in each
- * page?
- *
- * Using large pages for sysmem mappings.
- *
- * Is it possible to identity map the sysmem? We should explore this.
- */
-
-#endif
-- 
2.41.0

