Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617DDC83F14
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 21:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3668110E604;
	Wed, 30 Aug 2023 21:47:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBC710E604
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 21:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693432051; x=1724968051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=adiVK9ZNbhdA8J2+nbjsmUk6QqUBSfA7AKnn/JuNULo=;
 b=F+9OerUGRzYR0MXVLHWGCnpJGlT6I6c792+bkfKip4UrHCOz4tc+TubW
 PTL969xgyN7Z0JxDLp55p3dzjnbaKF3XBfqSRRlwGYDDHyneMP/1QNyWS
 pblYnPZrgO2Brh80r1Ha+cAjEdwArEjBaOJln8zo6NiNIw2C6q2OvdouK
 qnZjXDEbN5Ha+KOuVwlYbQyCPoPwhMG9tn2CeBNzriuu4E7u2wtia0SEs
 zX/YXXox30lvr77LJlKkKeNTtaTOvBSQa61RMCnP24iQWc66Awj8sYWAf
 NyeqHwtvmN/8U0M9+2VUrqT4UrVluBpR0YNHrUS27EJOfZu52QDlzH0ya A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="406748796"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="406748796"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 14:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768553694"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="768553694"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 14:47:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 14:47:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBVFcO8iqOM5C42UGn5oYP/uOsgppQpozQdn1vh+vs49wtqAk4TmityXHgfotjlhsl4jMrK+NCegyMggbG/1PAvxNGiGDdtudw8Hw0w8WqfXHx2LogvdM21zIAOYyOOFnk05XuGvKABHqPnu7kBIbHhsztWPuao2Rr4FKZ1V6pX0MDidLUm126OWOWnzfPc3pHcF0c+KW1in5v5lidF/AemrWaHYSlf1o8+GAuXaN1Y0YhQ4roaur5k4qTEtefrlnr8VQiXgYbSvyXl/aU9rluNCb9krfyhGKJEGsol2JvuOgxgjdGMDWBENB51l2JpXBhXsTHZ3rGX4vGOp64Qqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcQRWGRUIrh7FEEF4OCe2T19xeb75b/z+XhyBQrtOI4=;
 b=CffZF0RIHaUOMwj+ULBR+oKdnJhEyO+xGkCxkU5mq3OoSqEGF461pcJpKKE9/Ix8GWQmKMqJWYpFUKVSXab8CtqzZNN69ItveGZ2dzgC0bFp2D3VTVzSV3Qg6Xfw/WJr4bfBMmQ5geiApVORJJ6rMjmTdUiaacFHuzC6TIWJcPGGTRcUT7015DnB5Z4X3rPwYkUwyedfvTjcsymhjN4UOSNzBH7Jz7eFIaxpMMWlPkt+lGDIAa8q0e71p0Y8vpgl4kNyPmyCXolGU8T4dvaNtqqYOsvi/PyjjZWW5LK709GZGQjZQ5rH9LKf9CoMJLf5LE6up4gkg0oVlOJuegJVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 21:47:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 21:47:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 30 Aug 2023 17:47:15 -0400
Message-ID: <20230830214715.113435-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830214715.113435-1-rodrigo.vivi@intel.com>
References: <20230830214715.113435-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: 14145f25-756f-4805-dc32-08dba9a2b306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MkWQcGNNuuHoIaBi9gLygFP60HHTWk5C6nKw1CvlVhAn8ehOBH/Hns1jY8Wc8hR05Of7DqqI/LPaq4X9FmBHXW5vOHgiHHufQ8k2Yyc39WIzeMFa6MdSyOX3QeiTmovllKazxRq8vIN3pAtBnoXmPwYaqoArh8hpqCuyHdpxYIOV4ROijILp3mnj1LcspFdmg/acpaNbBjye4tl2mzSIXF56F16hGzvaOFdMSRTqkv2T6zYoGijMPGduVNffXm2B8CTNBJAcr9G//He5RxvYDi9fcEhCdW+KfDeqV+/EnMjh23uqqTVt6QjvukrKEIVwgWmXIP+TQiHMKGjUPWG+VUiLMmJcvS6pmgOjKBYCyux63mB8R/CZnnDowFJ+kPl/1AeEx13qA6npxSdsFt45cxv2PVYshsZAMUApliLgsavMtCoF5HcQhy3vHoxDlgzu3E7wzeA03rRALrUnHcHcDqTStf/UL34vNiX4CmuPiyYCLR+AlKiqa3UzObmYU07/9YumW/xmV6xSyc+r04+lyepPGAqR6BGhsDWoSUptYzsWV4e53T1l1gOKoQh0Ntz6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(186009)(451199024)(1800799009)(36756003)(83380400001)(4326008)(44832011)(41300700001)(86362001)(5660300002)(8936002)(8676002)(1076003)(26005)(6506007)(6666004)(6486002)(2616005)(6512007)(478600001)(38100700002)(66946007)(66556008)(66476007)(54906003)(82960400001)(6916009)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW9oRjhKRWYvSTV1NXkwS2ZWZGN0YkozQnExc0xmcW05aHVaZnptWDF0M09P?=
 =?utf-8?B?YUtaRVpYWGQ3cFp6ZW9PbFpoc3pGeGJueVBLMVp3MVREdnI5MTE1TnZ6L3FH?=
 =?utf-8?B?N2FHNXladnoyT1pBTndSaU96ODFZb0hPK0QrN29YTW9pQzBiWWdGVkZ3cCts?=
 =?utf-8?B?eVh2LzE0Wm9tQUdUb01XK25SYW1FelpEeFlua1RTcnRzU0hjcEpPV3MyK04z?=
 =?utf-8?B?akx0NzE3eTN2MmhnYjhmSzdWUWxVa2hXOUsyUUVjdTJ2MTRUalFpQjZ0UFJq?=
 =?utf-8?B?UWNVRk9uU1YwaFpiQ08yV2U3YmlTRmJnSTFtLytUY1Z4eERJc0hxcE1nZm1I?=
 =?utf-8?B?cFV0bFZlMVhuT0xmZkJGdTYvOTdzR0cxZU40WEI0QlpDczJGcUNRa1ZlM29M?=
 =?utf-8?B?NjB2UTBOTGRkMkszWE5WK01weEN1ZFpLTHFOTFg3aHg0VG1SYWdQcFh1dThB?=
 =?utf-8?B?ajRqYTVPMk5laDBTTTlONDFsanlqTDhvRGQ4eWFqR2dOcVlPV2kyQWJBRmRH?=
 =?utf-8?B?R3BmQ1VCZVFRcXNLZHZhRlMzdHFWaDVLRkY2bHEwY2dRNVdKZGZ0K254TjZC?=
 =?utf-8?B?SHdvOUd1elIyOHlpN1FabGZBSEYxRVBkeWFRY0hoTXhaRFhBV012ZVhqVmRT?=
 =?utf-8?B?cTUwZkhid2JVZ1laWnNIb0J1T2U2RkxWYm5wSkVZNElNQzBYanhXRlIycFRh?=
 =?utf-8?B?NU1HK3N0NEJyZHdKbE05ZmNtaXBLcGp1cFp2dmVkWUhFMEdibWUwQ0hMSndF?=
 =?utf-8?B?ZkQ0bmNMbXFlaENwNlZmTnpPV0lvUDdTRU5qc0tLM0o0YWFueXJZSUU0M2VU?=
 =?utf-8?B?c3VwcmFya0RSQmtFMUhvSGFyakExSlplYTVZK3k4bDlPMmoxY2NLL29zWHdW?=
 =?utf-8?B?QW9KS0dMekpVNG91YjFXbGVmWGYyRjRRVkd2UitCbEJ0bjRCT1hid242OHY2?=
 =?utf-8?B?dTBydVFzR1hiZVZyaWs4R1BWakc0U05BR2RMakFadjhia3dxTFFyNlpESnJj?=
 =?utf-8?B?NEZQdFlVUGxUREhrTWdoRU0waEdwSVpjODlRNGpTOFlURS9YRkhGenljU1Bk?=
 =?utf-8?B?NTVHYTIxZ3RLbisvQ1V4NGxzVlU4K2lIV2JkM3VGRzlvUStZYThxNTRuSmQx?=
 =?utf-8?B?SzZXeVlSTGZycE1XQ2RXek1TSTJOemRiSzNzdFZUQ0tzRTU4Wkp0dWRFT0Jv?=
 =?utf-8?B?d1NiV01zcHV0V3ViUFhmU2YxNGpwUzBMSlR3cHVqdWZsYTJ2SXA0aTVOcVFm?=
 =?utf-8?B?cnM0eE9qdEs5bUdvaTRleWNhN1l4bEt1aGdrTnIwdDAxRFRQUGNRRHdGUCt4?=
 =?utf-8?B?NjE0dDdPb2VLcktWQ1lPeG9ObTVpb3ROcFNDd09YTzFWcHY4VllvaXlaekdJ?=
 =?utf-8?B?Z1IyWGUxUjVSS1hzK2gzbVVEN25hR21PNjFibDEwVnhXMmFMUE9PSE1UQkVn?=
 =?utf-8?B?S2hJMCtjakVVbXBGY3FlRlZEWHB5bCtXU3NnR0RBUTdGT3Zla1FFMjVVOHZi?=
 =?utf-8?B?N1lQdHpKN2pBVXFBS0NDRFFOT0tsQ2lRVm5EM3N5TGwwU2M3THJyTHhhUlR1?=
 =?utf-8?B?dHE2K3dPV1FocHN1ZWRJcjBUS3A4QnNHbVdKaWROaWlUQWlqTGpwT2hpQjJK?=
 =?utf-8?B?eFgvZXpzTldGL1VsendhNklMalI5SXNUTHVIbnhwZ1VvM2x5SENFbDhMNzBR?=
 =?utf-8?B?TXcyemJGNk1OWVRKa1cvL252MVB0d0paK1p6OGhpbTk5bzNncmdRaHZVeDNS?=
 =?utf-8?B?SWtGTjE0TDg2NlFWTWhBck4rVXZUUytqQi9hSVFpZjBtdXg3MFhuRjZHSS9l?=
 =?utf-8?B?VTlsU1lKL2JmdjVrYlJZTTNGYVhDMytNa3Q2TzgvMUg4VTN2d3VKeTJSTnVr?=
 =?utf-8?B?WHRweFJubE00WjFyNDBWMjN3MWx4NlJlaWZqUzVDdjNLblFjOUNZc1Vla0NW?=
 =?utf-8?B?eVFWeG9LcllMbU55Q2NNcGw4emdiNVU3YWxsd3VYQllleGpXU2N2Tk12N3l6?=
 =?utf-8?B?TElZUFE1ek5oMXpzWVJxNU5HR2VWTENwdVRhOWZmbCt2THFVYjI5cTB2UnRR?=
 =?utf-8?B?bktSSitEbkdUZHlkWXRQeUJJbVBZVTZsRnJza3gyMEJjZ0xkbTRHVEIzNUYx?=
 =?utf-8?B?MzdLQ1JiZld0SUpXYlRIUEtkNER2dEw1a0lXQlRuOHNUMlhKS1cvdGdHQlN1?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14145f25-756f-4805-dc32-08dba9a2b306
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 21:47:25.8703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eh35HcZH2YyGE11nSY7iB5pei/vVsaFvef3si1zcwqrv5nm0LfRwS+Yc5dFhNVooFSnRSOurpz1CXInuRi8IeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/2] drm/xe/uapi: Remove useless max_page_size
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

The min_page_size is useful information to ensure alignment and it is
an API actually in use. However max_page_size doesn't bring any useful
information to the userspace hence being not used at all.

So, let's remove and only bring it back if that ever gets used.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 3 ---
 include/uapi/drm/xe_drm.h     | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c3d396904c7b..a951205100fe 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -127,7 +127,6 @@ static int query_memory_usage(struct xe_device *xe,
 	usage->regions[0].mem_class = XE_MEM_REGION_CLASS_SYSMEM;
 	usage->regions[0].instance = 0;
 	usage->regions[0].min_page_size = PAGE_SIZE;
-	usage->regions[0].max_page_size = PAGE_SIZE;
 	usage->regions[0].total_size = man->size << PAGE_SHIFT;
 	if (perfmon_capable())
 		usage->regions[0].used = ttm_resource_manager_usage(man);
@@ -143,8 +142,6 @@ static int query_memory_usage(struct xe_device *xe,
 			usage->regions[usage->num_regions].min_page_size =
 				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
 				SZ_64K : PAGE_SIZE;
-			usage->regions[usage->num_regions].max_page_size =
-				SZ_1G;
 			usage->regions[usage->num_regions].total_size =
 				man->size;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7c08bedbeeaf..0722dc634cb5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -174,10 +174,6 @@ struct drm_xe_query_mem_region {
 	 * kernel.
 	 */
 	__u32 min_page_size;
-	/**
-	 * @max_page_size: Max page-size in bytes for this region.
-	 */
-	__u32 max_page_size;
 	/**
 	 * @total_size: The usable size in bytes for this region.
 	 */
-- 
2.41.0

