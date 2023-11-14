Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C502C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F08810E441;
	Tue, 14 Nov 2023 11:45:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF1F10E444
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962338; x=1731498338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lEen2gKPlEML9nlEJdileNaua9H/x6Dw0eavP3oXk/g=;
 b=OKHK9D/J3iKH/UgXbmmCuFwBpKk7T0YCjbkBqnJAcgcqd+rbcVpS4rAH
 Eqv1XanJ2axYcwLYKxb4xNACK39eX7ycG9fhmwCmwYD2iq5Ng0AuQT+YT
 v2cwWajY6zN1gHD09jBgG7ZGlmkH50Rqa0V5DOlz9t3A34HMdZgKz+8cW
 O20RuxXg4pEKajqd/EwZU8E/O95W+u/PGYf2cUNcl+NvIgZv4GwnoTq2h
 zRLgqjm1pWlAUfSMCn67t91ZhPvTcKt7SsGx11ycW0rmABqDF5rTFalwQ
 qRqug1FlX7C0ruRwSbrklsQ1iZFcmxHtD4s98ZeTOEMb9cZGmRrYggh1p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476849800"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476849800"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741070944"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="741070944"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+eVPxUfmyUMJUST07Cfa85LOoOszAP9/zT50Z9dvnqtuPGb/5WD32TMzWVHEbdXnoImtBkzKtfINjEafZ7rPwWhXBhsZCTNb6VpHMAQLejFzgeWBOOGmbuIcKdddIprapLTPjGjFIouOPiYnMRpFAq0YI4L6/ljmWvJhXhI/Q7fi+2B/nNMFdjy/0XfQiyHalHxbbp8tzpczCf0aeP2gvmCAuZSAbX1uFw7lk1hy+MjOwQidd7seQT+SpKmTqVNI444a8dzB03Llut9VTHh8l+0D+hD/riZieqqRvyza32uVRQ0fHnbXpUB6GDNbjGJcjrHtOSLweY1OOCS/8rywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MO8QaeYHui0+H5pvqOPliSIrvOq+xpBAuo09J/Lc6nU=;
 b=ARVgLAQ0umiczlWZUWtAzlGvu/LJrOipaE2uVfm7xS2qaQgXjVx6NOzsJbdhSitxffxvk6TGSv/d1RBr3fTrQWDHgz/w4qv7+5Ah4sR33O9uxgF5Xw4AVbhr1CvZV7uwMPaK7Jj/JZ2kMsp17KBA7rGBqTsTNDpHYxjmuSMAsdV/UWrMn8OODWJYnZdcy5V6CmzvVbE/OdYCwPYQq3VnqEvI3Y/FTatBfmO2YpWFJ4ud0bXBRo852EWe/uVuzcq/fvMOmzMC4LBaBaBwuqE1P4Gf1piM9rrJa62mQxbgMOQXf+1p7eZqtVxOOOSn4MlXEwbslb+3jvpMGZLwwqxkGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:57 +0100
Message-ID: <20231114114405.2207747-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3fba24-ed9a-4cb6-9ddd-08dbe50733a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuLcm1de3QxwX8MUZILf9fWKUYlwrdYZoc31r0e1E4Eatn+7rhEf29XG/yq/TAPICgpl0nhDwNX2OmrD1Tf/8KVfHpmZkEqPgPM47k+REyhFNvejoY53RkwCWO38HNY/p3HHJo6aZbGU4WVhA2BIrRSdfMm7MA270NFB99mq0BOTNV0ncR4WFUgGJ0p9Ip7anDBihYWA6B4CU4giNfQ7SMocWqILmoQSDOEceSlrZMzMBfxTgZahZM/5pfJDb6e1LbjsOgLF3H2YkoDLD1Z24ef+TNkKzhJj8xPyFmTPyjLGL81OZqmrwGd1zrtPUovOilW8O9IiRrJfVE0rulhsxUTLnyrllSJZNXjBlybdz2sOgNpck5ljBvpyjXqMELHr27V+Od5XjGmyIp1dHv+FCfR2fgh3Swj1UdZvkqrhwQgw3wqC2cFzvgAfSfnvuRQgClPUMnB+OZ1eKeJBjpApdNqL/Q8RnrJxmIvRy3rJZapkPRUen4GKzx0ukYFxh6Ol8Ofz7b/bz4sHzfNQ4vz3I/URJTtPNOPS0N3arZ3QdUaJzRgUFeYDd5T/RwfvMcg3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anZYd0M2N2paWGdhM0kxWUlUdkJYKzgzY3dFR0VKRDFMWVMvY001WkJNQ2kv?=
 =?utf-8?B?NWp3SUdsT1ZQaTUyTnZrcldmZE9tdzhxWFpOTHV4cEZ2ZG9Ib09mUThIVHph?=
 =?utf-8?B?WmZvUUdMeG55Yy8wUi9QdE1SbUh3U2IwU3E2SHdPUzJFTXFSRzdoMGd3a0Jo?=
 =?utf-8?B?RnV0SWtoUWFRalNVUmozZ3NHTjNLRmg2UkpGMEdMRElUMTNVZmYvVkcwUGhI?=
 =?utf-8?B?N00zRU8zVlBmWVNCS09RZjQwbXduQWJ4M0QrOTlVU0g0R0MzUGlxMklYeEdS?=
 =?utf-8?B?d2J3QVczOG5NN2NpZWNZZDd2U09kaXkxbTBzcHNTNFdBcVZRZ29nZXlETy9D?=
 =?utf-8?B?SHZxaGVrZTBjYnA0WlNFcWNtQVJVcDNEZnFxMjlxRUFQcWlZNHB1cEpiUVhm?=
 =?utf-8?B?TlpTb1FXdElpaFRzSCtvSEFWMjI0S3ptWG1MK21zeTFWMWhSbVJxSHFKUXBp?=
 =?utf-8?B?dDJIdzVlY2l6NmtheUNLWGovVi9COXRjY1U5NEpCNDgxbXE5NVZFWjBHcEpk?=
 =?utf-8?B?ZzRHd3krc1RpdjFLdU1McStzYXNCTWxUOXJaaS9JRzBvRUtNSG9kRGE5RWRX?=
 =?utf-8?B?N3AwUEIyQUIvYmJadEJKMi9aaS8xOVZpYVhXYkNvVzB4NlJ5TUxDYzhvWnda?=
 =?utf-8?B?blg5YTJ2Qit0ck5FU3hhRXRGVnkyQ2NVZTVpeFR5OEVrZWVOOENwRzlMMEpo?=
 =?utf-8?B?QTBqTEpva3pQUTRvOVM3QVdXNERvUUFJZFk2bE50Nkp6WTdOem9wYVprTzhq?=
 =?utf-8?B?ME4wck9ldlIvcm9UbjlqWG1FclR6MngwelZkdHFJZER3cGY4ZU82ZW94a1hn?=
 =?utf-8?B?cjJhc2orWUhRUlk4TXpUYmMwR2EzcTExWkRJeHhGL1NieEdIczRJejh0dEJx?=
 =?utf-8?B?RU0wZkNCYWFha1BueFVvYWxXcnlGTDh4d1B5ek9zTnNyTDlDZ0UyL1dIbUhF?=
 =?utf-8?B?OFN4R1h6OGU0MEpCNjdpdHhpcHUvTkovL1ZoMU4rNGl4SERTRXVYQjErL29h?=
 =?utf-8?B?THdDZDdPT0prQ1RhRllkRThXYXhMZWMvd1hXRE92OFlQNVBzVmlqV2d3MGg4?=
 =?utf-8?B?RFY2QXRsandKcDc3UXhZTjZLZ28rNFhBWUEzaGs3emI1YzZZMHZnc0FUYmJn?=
 =?utf-8?B?ZlkrRFBGSE0xVFpJc3F0VGVDaFpBVWw2NUE3K0xvZm9nU1UxdjcyWVhuNXcw?=
 =?utf-8?B?T2U1MWhwcllQb1FkMngrbW1iODRPMm13Sk1mak5QR29JRWFBVDJoSkp0VWtG?=
 =?utf-8?B?a1lRdFNMR1gxQTNCdWJHeFRuNFNjaWFhdS9malhvQ2ZwMDVVd0ZtZjBMbXFr?=
 =?utf-8?B?ZUFDenVPQnJpL09ERktOZEpsMUQ5aGhFb1VRV2xEaDVsZnUxbW1ESE93amRT?=
 =?utf-8?B?MWtYQUJlUDcrUUM4dlVVaU1VK2EzeVBoR3JHNGg3NEtxZjI2NnFyV0VpMDBJ?=
 =?utf-8?B?d1FKKzROcXMxejZwcHVSSWVaNHI2ZFF1dC9QdngxL1p1RzAvUjZnZnNUOGZF?=
 =?utf-8?B?a1BkalhZcnMxNWZ2Q2JBYmdlZklFZ25FZ1V6c2VCN0o1a1JUQ1BHWHpHV2lZ?=
 =?utf-8?B?QmxVN1pySXpHTzJwVG94RTY1L08rdFRrajRXakx5ZFNUWHVycVJld08yQWt0?=
 =?utf-8?B?bGI3QVRUYXZnOFVnVWp1ZFNJVXg5Mi9ERFV0YkFrdEoveFhNSW4vUlErclpM?=
 =?utf-8?B?QXQ3T0xaSFRBSkc5VEZqRGRrbDFGTXJYNUd3TmZIOVNlWDF4M1k3YXU4dVFi?=
 =?utf-8?B?RU80VnZsK3pwOTB5ZWpmbENzNi9VbjdqVEY5N09qbm8yNFA4V3k3QWRtTjkv?=
 =?utf-8?B?dlZ0WXlmYlkxalA1Y3lhSHQvbEloMFVVT0M3VGpQcnJ1eEphSmJIbWM1Wi9M?=
 =?utf-8?B?UGtSWUNvbXNobDVhZW9vTkdoS1U0SWRtb1hBdkw5bUtIU3FCbXdBak96UEYv?=
 =?utf-8?B?VkZCMEhNYjZPYnlPby9uNzFObHVyUk1XQ2c4RUYyY0h4aGtWMFdnbmwxV2ZR?=
 =?utf-8?B?eTUxcWNZa1k5SUV1Y3FLUXNQWHA0QnpZMnRpTFM3TUdBc2lqTklwQ09uZ01V?=
 =?utf-8?B?WkxZZE52WElSZXE1QUpaWnpyc0hvb3dOY3dNSFZ5NExqa01lK2xieU1MU21i?=
 =?utf-8?B?ZzhXVEFSSVh1QjU1UlpxQ0s2Nmc2T2YwR25CMUlWRWkwSFNoM3FOUzV6Ti9C?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3fba24-ed9a-4cb6-9ddd-08dbe50733a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:29.8355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /49rbBrYwfTcNPLtdB3DQQsQu+zwQxBuoZtKA9fkfOxEuO00zwVpLBtESO4N/Ey/3+T5M4Yo6XZuBDgkq/+sNq4eo8Zh1rFjHRJ5fisxVr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 12/20] drm/xe: Move force_wake init to earlier
 point in probe
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC will need to be loaded earlier during probe. And in order to load
GuC, being able to take the forcewake is going to be needed.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +++
 drivers/gpu/drm/xe/xe_gt.c     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a89b5a32c093d..fde597fe0b513 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -404,6 +404,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id)
+		xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6c885dde5d59c..c8e2689873c37 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -292,8 +292,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
 
-	xe_force_wake_init_gt(gt, gt_to_fw(gt));
-
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
-- 
2.42.1

