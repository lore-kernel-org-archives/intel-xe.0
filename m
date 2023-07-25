Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94557EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E3310E400;
	Tue, 25 Jul 2023 20:56:50 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD59E10E180;
 Tue, 25 Jul 2023 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690318607; x=1721854607;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Hh+2dow6oOcHUw1g6ESR3YTAu/D7eGqJcVdhHUUimas=;
 b=LZk4xudCjVSNndCSrwRUU7WTveZmeme9MUE23qxaojCX148857qizroZ
 PzZR7dXc1Nm1trpf+KOqKsO8DRqwEc4UpvjTk5SOfxO2yj/ata1QqENBA
 toweNsxj2xIl49dat1LTaxJxiXVNeMUFeS+SaqsdWQS0LW/TD6fMZos+4
 0gbn6jZSRoijkTqIzCXJx+h82wYq4pt27zw92skLHlXsz2RKRTzyEp3w7
 EHA+UtqCCaUEUEAb7XN4yQmfvZEjeiUXLqs4oHND3rA13sOkZvg3M6xgN
 2AhqMAXQid/BRnA8EufsBfeyHRYAB6r6Uv+5brKdmKJ5V0GeK1vPrS2iH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431649943"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="431649943"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="839982336"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="839982336"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2023 13:56:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:56:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:56:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 13:56:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 13:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WI9CEhMdOKLQjMMVelOSyqDluZRD94ec2guDILPMqKz9SdpYXqdF/QGSolxdp6QFQBSDD3nNUOgh7Ds7omImF7PH5r1bGpO3TSUpeTeMS4kzigOTqBqc9C+TLLyzr/LD4ZQtPSvfh9MNvQgYeRUOnJFO2ff6HK2Tcww+JAC3rCOJwf6S6974YgNrzN7ZkNqb1X8whW3DIsxfoMO1MoairIA1eZZTistCe8dvFrUCBufSP3MWrcpIkntB/JswiGItvulwT4Cfm+ynDyk165u97UxFB5T6AHrf/3lR7GIWGw22lGgeeRpf5YPELaeYGW6Q9YUbWPeJtWMxLeJjP/jyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy6S2YFJYaoaq2059dJ8m3wYURucPZGQw4bm9XvfHhM=;
 b=hcQQINeKdR/g2W/XeCgQhd18NuwVsLi8CLiUadik3hoZHI/eZze8dSGqY+kL5eL8FrGyUwyZUPfAdNTj1H0Mdm/1yaiQYiz4GbHqXjPakA8qRc6sCnmvzfHQ+58Cb0nOgnHqoJrVsHMXewe+G9uIxic3t1ToQZjUJfwEElzpCfQDe/6XR0MyETaXE3jHm4tk1wyelOSmdvyJiTmI53WmVqvm+K6qMl0kYaAirw/fIUMcZaTsWOl0lc5eynpgXgUsCI0cYsPKeT9WF5Q4HLu62Yx8BChaSA0dCZ3EwZ8KpkcVie7t4Xs8W7/pDXpHoqT0hJEEmBy4SfvM1Vrn/WDdlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 20:56:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 20:56:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 16:56:24 -0400
Message-ID: <20230725205626.346256-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b02887-b6d0-4b1a-47d3-08db8d519f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VbHAM4Qe1LQQy3axeQZaDS81G5+FWai7iI82onQcyIheEifRwtBtRi4RG/s0o1LxtA7rx4JxbaYPU0lUXTILYwaEX400dpALXIYW0WsCoCf1V9svGp6RtwfcZ04xwQ2+SYEQG0/nZNNA3B0R2VS+5Ew7cAwrHavJaNjVfoTSkzLpWd0lTOuml7sRwT77neHuebDnG9B7eTJBTQmMqbYmBrk9c9cNC0pnlGU5NSI5TYpv8I8KCABT82y+srumMjMQ1RyPESE+/JlOu8UJOo7jWEYJMizmQuY+HirqF73z9cycyWZvDs4gPiSGJvEgu5V1qTMvl7ZsIJ+5dALPRSCZE4jNXFITtt9CM6aN+yMEX4ghZhzTJSMigq7PjXqwWUaAwh2v0dMgaA0kZ7faVwiAB553JY2xLDzAdQjkZIR8LdKYKtoTGnzUWD/laIM3ipKmkkT+zzc/UcS/lHk+p32Jsha1i2h89FzZy92eFmZrNvCsCw2FhveDIi11umUcJ0WhG8xOlp1EjZnZSeVj0MDypNSYhmHHiO+KWp1Be7WL4VjmCVVLOWTE82mMXCy1w9Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199021)(6486002)(450100002)(6512007)(6666004)(478600001)(186003)(1076003)(6506007)(2616005)(107886003)(2906002)(44832011)(26005)(41300700001)(8936002)(6916009)(66946007)(38100700002)(5660300002)(4326008)(66476007)(8676002)(66556008)(82960400001)(316002)(86362001)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlFaclU0Y1pBOWxUMlFGUnY0MTg2YXhyTFBJQUxJeGJiQmJEa0Y0U2RlK3F4?=
 =?utf-8?B?QkVBWldyMlU4V1U5V2hSTWE5M3hFSDZBcEpFck5UdldRQ2QrN1ZRdlNXTjN5?=
 =?utf-8?B?U1V1Q0s4Ti9NTDFJNXh1R1BsU2NIdzN2TW80emtBZVlibUg3enl3ZkUraHdH?=
 =?utf-8?B?YVFOd0k5K3RhR0QxZDNzd3lnZzFScnR6UUpWQU5NWGVvY1ZueXhlMVVJckhG?=
 =?utf-8?B?azdValN4b3hGZ2h2Z2p4dVg0UldxTytSMG8yemhpNzBrWDFiZklwbVU1RUZq?=
 =?utf-8?B?ZjNrbGFxZnNGam9sWGpCelB5ZG9YSXF2MlVwb0luMjN5OFhQTjMyQ3o2M3V2?=
 =?utf-8?B?MTlWUlhnT0NtRW1WQXNpMjg5dndMZGRmUHp0RXQwR05nLzNGSVR6c0t4RVZp?=
 =?utf-8?B?ekFwYllva2dhZFBpODZaS0pnUVNrdURDTjlxRWc1YjA5V05JNlBoRW1ZWW91?=
 =?utf-8?B?Lzk5L050UElIREpIaGxIS2FMaG9zZUtkT0thdE5laG9ZMzc5ZlFpY3ZrMm5X?=
 =?utf-8?B?aVNBT0FnTTIrdUtzczF6ZXErRWZlMkFwdE1RbXhxUzlaOTUvVjNVZkVpQ21W?=
 =?utf-8?B?OUNlQ0haSjhYcnVmdkV6dHpGb3pOOHNKd1JJWGhPUThhL04vZlNMdnFXRWho?=
 =?utf-8?B?cGVEdmkzT0FESG1mU3dEak1rK0hDSEo1dTFBS1JjbzRyc015ZERydHIzczlz?=
 =?utf-8?B?TmpaTGlvcFQ5WXJ6SG0ySmRVYnF2Z0V5WHlIQ1JKWHo3UTR1MmNrY2tSZEdV?=
 =?utf-8?B?bnNwZ0RQRkF2QXlXZiswRUN1UVRkUitHNis3T3pDWUN0bWNxUS9xOUFVSlha?=
 =?utf-8?B?OE1OcjZRMVZoOGJ3TGlxVHc0ZXdtN2RkZHNCcFc0VHRqNUFjN0RlYTE1YzRW?=
 =?utf-8?B?UTFTUzdVdSt5Z1Z5aFBPUkdmZjR1Q1Fyb3lzOFZabFZINjRFWWFUYkt3RkZ3?=
 =?utf-8?B?eGFuNTFtZEtWbEp4dFBVdyt3UnduU29KK2s3ZU00YkpTVW1CTW5RcmZ5YTY3?=
 =?utf-8?B?SXU0cFdpdWIxaHpQMzN0Zjh5bnhRL1lqdFBTV3RWWjQySUJ6LzE3SDN2eU50?=
 =?utf-8?B?ZnpzaEd3NTFWSzZSRUkyQ0FlUThaaWRXbm5EbmVHVjJoZnhreDR0d0pFakVV?=
 =?utf-8?B?TW53cWN0MFNsWEpBdDl1N21jbHJDRzVvYUN0U05SU0pUYXVPN1lDbW4yQXV1?=
 =?utf-8?B?RmpYL3lhZy9BVUJ3V3NxOTRvcUlOVEczV0N6YTFzQU5Sb3dWbGtWMVlWaHRv?=
 =?utf-8?B?WTR0S1NvT1hVek1tbG9lTk1LNzdkOWVGdC9BS1lTdisvM2d6TW10NE5qdlFl?=
 =?utf-8?B?bStPcXU1ZlBIQnBmUXhJblE2UUp2K3dxSlRqM0JRVHpFZ0JCV0hCMENxSVhV?=
 =?utf-8?B?VEhPeStrSkpwZGpQeGk2UkovdU12U0laVWlwZjRqWkxVYnN5K2hKcXZKUWM4?=
 =?utf-8?B?SFptRmxBUWRQbHlnUW05RVZ2K25aTkQrVUlJU2hqV0VPdysxRVZmNGhkTUFE?=
 =?utf-8?B?SG5iYzVxeE5HOHZaM3VPbzFLM2NDUVVmbUtKbDBmc1lVYWtad2N0b3lBcFV3?=
 =?utf-8?B?bDRocmJncDk3bDBYSGUzbXQyOS9VOGgwR2ZsOUlVbFlvTUNYcVV0S0Z0Q1Ey?=
 =?utf-8?B?RkNlYmJiT1RBY281dndMSG9PNktiM0hqYnR1UzJ0UE83UklDUHdmbEVodjFx?=
 =?utf-8?B?K2JBZlNZaFphTnVFdWdaUDlTYXR1WktUSUN6UlR1aGRqRHZiZkxPTWdpZGxh?=
 =?utf-8?B?OXpPTzBkOGdLc3ZKQ2tNMUN2MmVWVU9CSytWYkdHVjQ4dzAxYjM1UkRTdXQ4?=
 =?utf-8?B?eEgveVBFUzAyUThHVmxDaUJFbGhBZXc1eXBqVkRHeEtKcnlncGYxanZUSm5Z?=
 =?utf-8?B?SXdqL0xmbDJSTnA4RFpTb3VST0Q4SjFmQ3lrcSsrWXJpeGxzbkEybGI1Vi8r?=
 =?utf-8?B?MkxlREFWMlBBS3hyMmo0djF0RmpIUjd1enovZGdMa0xZS3ozS0EvUEZsR2ln?=
 =?utf-8?B?TDlNWVowUjhTRlV4WWdwbmduam9kUlZwT01tYUdZTlExZGMrTGkxbndVWEpX?=
 =?utf-8?B?UDIxRmZac2pGbVl6T3BvcXhRTWpDTVk4bDk2UHRIRi9SejVUMUlvK1hkVzcr?=
 =?utf-8?Q?jd7D+S/sxT/6+thdNQeyfVP3/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b02887-b6d0-4b1a-47d3-08db8d519f1a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 20:56:30.7150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgbQcU4m9m6f8OJCEixG78tVwvjGmvRaY3eV7Sti632S7szqrZY6VRDsZkGeGOtfpm52L0rZwAWvEXZZtG7F+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 1/2] xe: Align uapi after removal of
 XE_QUERY_CONFIG_FLAGS_USE_GUC
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drm-xe-next commit ("drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC")

Also this is the header generated with:
make -j21 headers_install  INSTALL_HDR_PATH=.
,as it should,
what explains some other unrelated changes that are appearing
in the diff below.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 9 ++++-----
 tests/xe/xe_query.c       | 3 ---
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 02419c1d5..1ea453737 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _UAPI_XE_DRM_H_
-#define _UAPI_XE_DRM_H_
+#ifndef _XE_DRM_H_
+#define _XE_DRM_H_
 
 #include "drm.h"
 
@@ -180,7 +180,7 @@ struct drm_xe_query_mem_region {
 	 * zero.
 	 */
 	__u64 used;
-	/*
+	/**
 	 * @cpu_visible_size: How much of this region can be CPU
 	 * accessed, in bytes.
 	 *
@@ -246,7 +246,6 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
-	#define XE_QUERY_CONFIG_FLAGS_USE_GUC		(0x1 << 1)
 #define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
@@ -1051,4 +1050,4 @@ struct drm_xe_vm_madvise {
 }
 #endif
 
-#endif /* _UAPI_XE_DRM_H_ */
+#endif /* _XE_DRM_H_ */
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 47aa98a8f..a4e40afdd 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -371,9 +371,6 @@ test_query_config(int fd)
 	igt_info("  XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
 		config->info[XE_QUERY_CONFIG_FLAGS] &
 		XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
-	igt_info("  XE_QUERY_CONFIG_FLAGS_USE_GUC\t\t%s\n",
-		config->info[XE_QUERY_CONFIG_FLAGS] &
-		XE_QUERY_CONFIG_FLAGS_USE_GUC ? "ON":"OFF");
 	igt_info("XE_QUERY_CONFIG_MIN_ALIGNEMENT\t\t%#llx\n",
 		config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT]);
 	igt_info("XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
-- 
2.41.0

