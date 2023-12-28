Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D36EC4706F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5DB10E25C;
	Thu, 28 Dec 2023 02:13:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C3310E25A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729616; x=1735265616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2rS5YW+kaT3Ko13nbUhta17jOvyKzkw9HqhfXfUdaDk=;
 b=OF5/S+6vlK8MeV2EpVyeaFAhpM/FJaYNBXTAriy/zAXhz80wGM/3sI0O
 TJ2csv8g9nn5r77tIu+8gC5+hwYEIR/o7NPTutfIKEafvVoSgr//yUr0r
 V4caNWYqrgA21JBP0Qn4NVchOJ43J2F7GUnZT3t1NwqOk/W7fsy4a4poO
 8E9eNE9hgG/0KST2EDYWfZ7WUVc5fioNbPbzdzw7/L/2h0t6B/T4JCcoX
 mhtV5JPaM0KCQU5GViDtVdFxWqABQcFWg6WrEJuLkSLC59K1nyhz2h6fc
 MyDSfG8BvlZYxhab92Fqu3LQ2IVWwgyZU1BjSaSfjxJd6ymCo7ZhQmAB1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="10062208"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="10062208"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="869014367"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="869014367"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkswMIhQt9bRhlNriSYdNISY2twGEmoThaKD8VXMRmwRAyG3rKKKROMiFJTdNllYOE1tvMZWdu/2GfLMThqreQggOVljT0D9yJXK9yoVol2khAzET4kmNyoN4j8oO9HWYVpoJozooppLu9q4RKy6glX/fQeY/UApuoyEuP1Vto4NyJEh0aQUt3pZCfoiApP93ce866DteZujLZoSpmmXSsnRu4QmMUEaGT1GPuwV6CTEVROqamYRewo2Wiua4M3KLOdWu3B5DyJYTvKMkjqVu6bn57Fm9NZ3tJLYUcSngdHeZPVSkS9rjomjQxSr3Ow5Jb5qNyny4tMC6meq3SUePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1fPn2VISuFa1kJ7M5Prct7fzfhw2RBPdfKT1xsKcqg=;
 b=UFuDr0WjiriBsgHdiQfYF/tlVR1dUFz0vY203grFZoFJ3zrPxDPTxU0bfqLkcyyuJiqt95QhHu6rbseD+QdFqnlYc8hNUIE+eXddsndv8ieqhybm2eSdBwqcPD+YJ1QLDtYYDPFAgGuM8sq1+wZ8bemZ/REeyAxNC0Knad+u/9dU9wfYNnR5JKIunTmN4h85ZzCQ0yLvX6h8xqA7YJDN1+ZpjYiALVmuYurWKgeu0U9Qn6k4qE5EnMxPjMXIrhDRN7vOawW/0zDVdKhXl8t0Jwu4IXZWJUPF165bCGcPrXiZVcI6HaybCXu5l6O+NWAjs5CHmoGOCkohGwSWG6Y8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 17/20] drm/xe: Removing extra mem_access protection from runtime
 pm
Date: Wed, 27 Dec 2023 21:12:29 -0500
Message-ID: <20231228021232.2366249-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3b6557-182c-44fd-b57d-08dc074a978c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Or0kuRkfhfVwn4mIuohH00mWJCWhUqQdjIwuN0rhsh4fYcmMiPTnHUC9yvuhuz/dqwumDf5XOip5hkxlDQJ203FklBvJQWg1RDbAFHNoiZ5I6o1QL6NC9DZHg0mNIikWhKdTmrH7tEWWWRgdEta4jPuNu/keO8WMw+O4PVhxcJG36o92RWHIMtvGwP5gT/HsY04Ceyfin3jAqQkFAnfkIIYvmRYjxoD2mtyUh74Db3zk6rdkEVuPBOIS8NRCd1M5RUkB597q4P/FA/TZW9jv1dI7mjloEuAizwG0ynXStUr55uGfkcti/ukMlDu5TNLb4wOC2gw/NqkwLPByaZ4ekMIl7eLvnzm0NDvUE21giM9QQr6KEBy+j2pmUq4uPwidZ2/WOOFXs0OJZJvyovTIVxodMG5Vt72CrG6+Gxm+vvfclAOzokP1f/fUgfXR428twWn2V+UZEcmFqcUSN9vsCXWXU4XK0i0DqqVHy0lKiSxHF2m9BTusS5iEAzRMni75jMSYBQ8uNWIhzrHOi+qnMNate9FanAA2Lt7Zi0ZtQRA14RiocWzhpsvp9Bpumzpt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gxPI1MLf3VSHzlEyOcuwkK53S8wErOAtJZgUdn9sfyEc+7T09ZW2oga6Pn19?=
 =?us-ascii?Q?cdNoXPgSI4aa4VKvuHvmeXoJpwFwKTgoY5WdyAdTmXvonpyu21urersXcYED?=
 =?us-ascii?Q?WdlBjsU1KcOb8Qaio/foofSGMu7EsUDkbuAczj37+OBsKjkfTsXBKFHE1AoG?=
 =?us-ascii?Q?62xfDq1lh6LMObuAKayB/3fW/UibEGvLwkevAQDfczoi9VruqXzzotImZiBu?=
 =?us-ascii?Q?Wx+QyoctZHRPSwu4dWwrd/+qdjJ/L4W27KIgVrC/194gH/OQGdyOASM4QuY1?=
 =?us-ascii?Q?TiFoAp8Yk+GwMk5RZT7lhVmJtxpz9CCXiEtVBfz8M873JYFkJtQIXvzgJ3Ie?=
 =?us-ascii?Q?9TxWhZA4NOtLcG/yD8ej3R7hUfE77dAIwHLsGRNJP55y1PNK+hqDvB4WgWOG?=
 =?us-ascii?Q?Lo2PA6gk8R0GoiOH9LeOc6UEtTTIXEhFhis8EdTv5QG7exijGS1SvTQlQF7J?=
 =?us-ascii?Q?wuSHgT1QLa6EHNPIHharIkXccLPJbnhmSVZN6SvJDWhBE2E6VecChewaKQ6c?=
 =?us-ascii?Q?33KFKDqJkUnAczzFd7vefQPveEm/HN0uto545hFBh3vhr+U7UZ00M2lA9EAu?=
 =?us-ascii?Q?7DhsdCEfYbBidwLh1mQF6eSj26X3iPr5lLeuRuNzae8lHBUwumbBjr1lDnMA?=
 =?us-ascii?Q?C8Dd+o/56MatUw12c3pRkWjjdZvwhxIvSJaIxOkPcgVu/XpbxHBI6NIP1syc?=
 =?us-ascii?Q?ovXob2mlw3QN9QpJNAVaSjvI/PoeTHk17oJsTklIlXfmIUi5si6LWfONH/9u?=
 =?us-ascii?Q?8DEgo/I/nYSifnKnDvrzxpY499przi97OlZvyXg3cPpfPwZkQOnyTKFxK2D+?=
 =?us-ascii?Q?e94hAj1iNsJeEOnTkY2568R6Q0EByzlHSytUq2KOrrB67PKqm6G97u9VTyO8?=
 =?us-ascii?Q?r0v7sNY6T83TJ0/PLA1rsLrGos43n0Mv+IOFhFcQAgcT9NjrlBCpiC0ivlPp?=
 =?us-ascii?Q?+vT1OQ7jgLqVy4D3CUJ1zhhn6Z9kC7bWzwE0ix83/geWUQ1eSOihvF6CQIEo?=
 =?us-ascii?Q?je0kaLLWuTB/R3iMQDX3Jkek7wO5pNtmE2+DP0xv0/Y5bvjVHoPDrtoaTjK/?=
 =?us-ascii?Q?WnZA3PLSNmwhfrt7r3R4fiNTzltj+wKGaO8mgpoq9WnFwScHrInmZqYa0P6k?=
 =?us-ascii?Q?WYqUidSU7vRjXwUEcIP0VyuGu/em7KUMfE8OdFjvF228WfV4vueBd89uGBi8?=
 =?us-ascii?Q?X1F+2M5ApzrLkYyIwRLHM/GpG7jI/96LrknciSLqWXQcg5kQAkci1jqUqXjD?=
 =?us-ascii?Q?7nrcDhAKX8v7Z0oBDgmgNoFvoA94pWf+d2phFONv+TPpXky9Xdf/Ww3N9kSG?=
 =?us-ascii?Q?Ipked1JBKtlvNH5u3y9fwdCK9pJJxqi7ZQ77rfm54lWN0AGitm2nO1WXgoap?=
 =?us-ascii?Q?1+RxlzjJo+STckyPmTcwCXI/8DTN+ykN+aVH/JCnTuJChVK0kPUkqhpkp1BA?=
 =?us-ascii?Q?9MHOzckInT+GUWqOFIMF4JBdW87VUXw2CCeuNSCg9HXwuRFl9qdW0m9FHX5N?=
 =?us-ascii?Q?3GaPbprkKJYbPhV1TZNLlPmMYMdgBiptDCUuhmZoEbVM67KZ9ccdOUTkcj8l?=
 =?us-ascii?Q?/FiZvosRiSNvqT73xUBCXuLyyIdliXezksNNlVfJazuLPyqw6Z01T82i8sgq?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3b6557-182c-44fd-b57d-08dc074a978c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:33.3830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ao1y8EkBORKQne+evcqIRznHP1BiQASxE4hbNGrFkFgtMSqVwwXCjgYRYmqtGEI3pP7gEKxLe/rj1pktm/ejKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is not needed any longer, now that we have all the protection
in place with the runtime pm itself.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 --------
 drivers/gpu/drm/xe/xe_device.h | 1 -
 drivers/gpu/drm/xe/xe_pm.c     | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a7bec49da49fa..c1c19264a58b4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -651,14 +651,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
-bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	if (xe_pm_read_callback_task(xe) != NULL)
-		return true;
-
-	return atomic_read(&xe->mem_access.ref);
-}
-
 /**
  * xe_device_assert_mem_access - Inspect the current runtime_pm state.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 4acf4c2973390..d5ab7c62d5f62 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -145,7 +145,6 @@ void xe_device_mem_access_get(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
-bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 3594e707606ce..e53ac5a2f4ad3 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -274,9 +274,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
-	if (xe->d3cold.allowed && xe_device_mem_access_ongoing(xe))
-		return -EBUSY;
-
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-- 
2.43.0

