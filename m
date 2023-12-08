Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB4BC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 17:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D921010EACF;
	Fri,  8 Dec 2023 17:13:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBC210E29A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702055619; x=1733591619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/A9hYtoVKXwKuGYPCOQwZqYD9DqX1AX6kzqcxWeyLjo=;
 b=KFLEfCX8iIGeO5o2EfKva64KUDjJWDDttzxsZsgaWQm2SBM5Y/uVKjLi
 csuajkUnQV6Obb6XMEPHqB8Tab1rtdL8Qmrs1yOcbjgf12cmO4mBZczH4
 JSWQ2z+I4yFg8DPZfngWHsQ5fKUbf2pwzmcQhLwlZLXas1CosGdNipKFg
 r25rg5jCkqcmLHkdAiR+5ZZnE8eEENnRjt8xYlIOcc6dUNFESP51Ad8/C
 0UtKITQhLQi26JLqVhRPmQwmfm1lMGtsToDPtS/26Z2L8Budr0sdT4bCM
 VOd/shmHpASgazmLDe6da3YDkKEWPl99Qi7nLC3ijfCojkwPBAGHGTfEG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="379430599"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="379430599"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 09:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="772194906"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="772194906"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 09:13:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 09:13:33 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdDpqF+QOQdsRAxMyVbKOZHPPxS+4GOCnJhEL2kh6S1EMGSG2Tb1Tt6inTHKNWCjpChpmDqpTOEBFWaMRRMBG1StVM00GFcs7pqhAAi0ptnq6a9PWCFX8s4izbkF2ORHULNZwRmIJYjhL3purPbpAfrANkWZGHLsAn2P3r3IHC5VB1Zox2mCsISIjhO9M21Nt+AKSy2McAziEewBY8fL1pB2K26po7KLFe7dec8Y4HDHfak6exDD8+e9FdpQt9EoBn4HkhjCJ4OjJVuv0vugkwcmPXce1jVMFXsBvb2dM3/JCOmMD4403NiiVrneK5krQvAridc6yCNmcyym5ieNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBxR0v3fx2QDPukOxL27b8a5PF4xYULZMtm4P8xB3iU=;
 b=bq358IPSsgs6M1hcM00FPcN8clbfc2hURGKT6uT5E2+hCC2TxBIwq98MkdoWbzJo4BgefwiLDNnGqwbSphB65iAOIRdNtyB4uODDss+QZJ6I5tI3OexkKvkP2Iyv9dKeJsTkOA+vU9z0yvkNjkfZwh1ylqVd5oyCjqC4ffxSwAfh2LsmVn/aYgiBTuteC2NZPfrv8vsQuiqnJtrTKg/d1O2vsHV1k5lhoS15OCRl2TpZXZxhQJyp0ogUruvgtqvqn9zcWUFRkc36JXHh8ktqtLSFKIqLQcTT65V5ARgBkDrsUOx+JAYE4HEaiE+fOCUYvAChEqvvzVzF5uZtolxFow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 17:13:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 17:13:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <ogabbay@kernel.org>,
 <daniel.vetter@ffwll.ch>, <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 3/3] drm/xe: Add PVC's PCI device IDs
Date: Fri, 8 Dec 2023 12:11:06 -0500
Message-ID: <20231208171316.901795-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208171316.901795-1-rodrigo.vivi@intel.com>
References: <20231208171316.901795-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbe8c10-32c5-48a6-a21e-08dbf81100b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WPJ9vgSJjNYpXdR6JlYzw2kWwcK+0aDaXRgAQ1s/9sqlCZF0dnAfwDOAcOpH6UHq2u3AQ+oW31AXoBJ2IY/TMjtfV/xxJm6y9VKph2WAdTBZYmlavuzXjf5bX4yPULmQobQqQqQxapz28XyZ/eztEFihvIFkb90vXn64wCgyJZEDNUlFwp3QLnmlxzuISwaaiKgcuZdY3UUybFDb6xKakvVz4WiKwKLJ4UWliKqxvXafxIoBvpM0adg05wZa7rZOzaKbhwNUVLis3lIv5C50GMf1ZaispdeS+7sXLt5baA5bMezURJHr9dqbc4BYEQvGHYEYM1jw11uiiTKvxib89Tf6YD7h9xfKdpsrJxE2hxcMEetCUKrwSAAqwTd0hof4lbzUOv+rHRgujYZvnEoVnUNDm0162S8L15tSHxaC8MVqc1irCaqsEhDdpRaeSeMu0oCDv3G7sYyjj+hS2Mfixr88FfYnqTHnbMiaA2NJuukYTu5oe24Nxrwyc5K1LH1+U4hnSlYq7oviLuRVSdoWnwvXsEu59bqSFrxU5aFXvvdMlhnPCptiF4RbK1S7Lf+x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66574015)(1076003)(6512007)(2616005)(26005)(82960400001)(8936002)(41300700001)(4326008)(8676002)(6486002)(316002)(83380400001)(44832011)(5660300002)(66556008)(478600001)(2906002)(6506007)(66476007)(66946007)(6666004)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3lNYUpLKy95OG9xem0ySVRsZXNDTmFpT3pXcnh3Z1k2bDdFZzhna2FsKzJS?=
 =?utf-8?B?aXAwRklPdVd3cEFkcEtVbVQ3eTl4THlVdzQ0RnZYZkFORXNBNjVSa2NUWnRx?=
 =?utf-8?B?MTR5UWR6OWV0NjhqRUZVcUwyV2N3clVJYVZRUlRTeXQzVGc0bENiODU2dUp6?=
 =?utf-8?B?R25Ydms2N1NTeHVGRUVFRmh6OEZWcEt2ZW5iNVFyc0lLYWk1d1pPRUtNTElM?=
 =?utf-8?B?VHhYRkRiZlBsS3JJN1c0SDJVRnBmUGVBOVAyWDNOb1lGblArS0Vuc2VBR2hS?=
 =?utf-8?B?UG5EakVpRGlMd1lFSlAyQVdhV1JHT1VsYVpTTERpdHBqaUFQOU0rUHRWbklx?=
 =?utf-8?B?Y3dnR2FuOFltNnloeVIvc3kzdnF6aVhyNnJ5SkJFL3JTRElIYTlvbmw2VjlG?=
 =?utf-8?B?SUlNeTJiRWRiRnVkTmJQc1pmbmhiZ0ZjMGExdWhwL1hBNlNNUSt2MGpISG5P?=
 =?utf-8?B?THdPaFVKV3JWNVdTVnBmUmRmbzV0SFU0cC83SFRCcnl5TnhVR0ZiNUVSOEN5?=
 =?utf-8?B?emN0TlNTcWVCK1VVa2VlWXdvT2RySzFtMUtlUElWTE1neUpyWTYwYlo3Tjln?=
 =?utf-8?B?a3BQUzdBSU5VRnhkWUxIbldraVV5Wk1JaVpFTjVmc1hNY2sxUVVOTlQrbjBZ?=
 =?utf-8?B?MVpBVFVvNkdpSEQ0aUxQZGFDSlNxUjg1TFdXclNGK2hBNmZTZjhTL3dJRU9a?=
 =?utf-8?B?WGNRYUJvQktaTlgyMTZZU2dBdUgxdVY1SWNhSVYrQnNXT0ZkQWpJajFieEVM?=
 =?utf-8?B?VitmM0RmME02bEovTmhXVkJORzlGMzc5S1ovNEFxRmtTaEI2VThyYjJDZmRY?=
 =?utf-8?B?ZThRaUwvNlE0WGNxdU5mRG9Kanp5MzdnUTZqbjk0RXNTNzZLTWNPRHJmeHVn?=
 =?utf-8?B?azJUeG9wVDJZdTBLVzErTTFoQVNHZWxienRmVldlOXhaN2xXdWN2WDFoY28w?=
 =?utf-8?B?M29xYkxhR3duaXNVRVJaQnJqZDRXSGJkdG9kVzF4MUpwVXlzc1I0L2c4ZzRM?=
 =?utf-8?B?cHd6Wko5Ty8yYTZ5YWVXV01yMnZDaXd3WUpWdmlENXMwNFlRMmgwWk5lS3ZQ?=
 =?utf-8?B?ZnR4dis1QXpHdXlLK2VBaG9DVWlLZ3NIYTZpL0lwL1N6MXNLTVFIeFhBVld0?=
 =?utf-8?B?VmMyT0RjTys0SmFWajdTUWo2UjlGbmdxQTlpbHdPckhaamY3bFpMbHhwRXAv?=
 =?utf-8?B?STdrM2VhR1lyQ2I4S3F1V3lkdzBudTFjK2d0WEYxT0lTWmovcWxIVjl2dTFO?=
 =?utf-8?B?WVoyQWF0WGdCbWpWTzluYktTTVoxTjlwTmY4OENjM0ZZUU5udlV3N0NONEZQ?=
 =?utf-8?B?SVBPYnNPQ1MzenlDQjY5TTZUVFFvdm9jUGxhSU5XSUlQQmNCK2ZEM1F0cmpz?=
 =?utf-8?B?SklUdENPcWJ1MWNoSzZ3bnhrNEJ3dG5DcTB6U2dQYWpLS3B6NVNMeWpKTmxh?=
 =?utf-8?B?YU5TZ2FHUEUxaVhTZDZlNExEQ0w2NVVOempkQzE3YjV2MGtyM1IvOVdmbm1j?=
 =?utf-8?B?aFduTEN2ZHhBZkhNQ2JvQlgxcVRNd3RQZFF0RG9GaCtQWkVtSlFWaUNUKzhU?=
 =?utf-8?B?d05GcW5NVjZUcWRhT2N0RlQxZVhaNWFxdTc0M28wbnk5M3NKY1pnemZxc0hR?=
 =?utf-8?B?ODY1b1NqWUVmeU9kbWl3c3lPU2VYUFBXTHpPOXo5ejVTcU9aUEFnZWtlblds?=
 =?utf-8?B?dzJmRmNRU2UwOU83dTBXcDdZVVVTWGlPWmdyejZodzJCcnZheDdwYm5OZEdy?=
 =?utf-8?B?MCtNclZGUkhueEtqZWVnQkRnVXltTmJrdjZZL21aM09rLzNlcjVNdEdNdGpK?=
 =?utf-8?B?djZ2TzBhcjlNYjZiVE42TWhzeGVtdldJakRZVW5KRys2K3ZTazZheEtPK3I2?=
 =?utf-8?B?RitiT21CSEhtU0hvM3kxMDVtdjU1Q3d6eGtqZDkrRzhvYkJiYmw4ay9kY1pH?=
 =?utf-8?B?K1ZFS21tTURrZnQ0blJvd0NqYVczakVHVHVMSldheklxRkhMSk00VDBCT3FI?=
 =?utf-8?B?UTdlRk1VQ0xRL0Q5RmtyNXo3VG9XRjNITVZpNGMrbW40bkpsTW41UmJnb2pq?=
 =?utf-8?B?eUNqNVd5WGx5ZlNPdlFDVGhGTzVjanBCMTRzd29ndlNTM2RGT253eFJkQUVw?=
 =?utf-8?B?RlFEeG13OUpvUklvT0h2R28rNVZGRTFSdmdFUlN3bzhHVG9tRkhySHovdnpQ?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbe8c10-32c5-48a6-a21e-08dbf81100b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 17:13:31.4811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Uwz/6hjjQaz/a9wMS88hFK/jiEjxetNn6WsRlYGG6BH8OyVIxFV4pavKIRLNj5WT0JI01Nx+v/rQdpnKWX1xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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

This patch introduces Ponte Vecchio support in Xe driver.

Please note that besides this patch, likely the force_probe
still needs to be used in order to actually enable the
support for PVC.

This patch was separated from the rest so we can ensure
compliance with DRM uAPI rules on compute platforms.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm/xe_pciids.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index de1a344737bc..3011d99a05c5 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -182,6 +182,21 @@
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
+/* PVC */
+#define XE_PVC_IDS(MACRO__, ...)		\
+	MACRO__(0x0B69, ## __VA_ARGS__),	\
+	MACRO__(0x0B6E, ## __VA_ARGS__),	\
+	MACRO__(0x0BD5, ## __VA_ARGS__),	\
+	MACRO__(0x0BD6, ## __VA_ARGS__),	\
+	MACRO__(0x0BD7, ## __VA_ARGS__),	\
+	MACRO__(0x0BD8, ## __VA_ARGS__),	\
+	MACRO__(0x0BD9, ## __VA_ARGS__),	\
+	MACRO__(0x0BDA, ## __VA_ARGS__),	\
+	MACRO__(0x0BDB, ## __VA_ARGS__),	\
+	MACRO__(0x0BE0, ## __VA_ARGS__),	\
+	MACRO__(0x0BE1, ## __VA_ARGS__),	\
+	MACRO__(0x0BE5, ## __VA_ARGS__)
+
 #define XE_LNL_IDS(MACRO__, ...) \
 	MACRO__(0x6420, ## __VA_ARGS__), \
 	MACRO__(0x64A0, ## __VA_ARGS__), \
-- 
2.43.0

