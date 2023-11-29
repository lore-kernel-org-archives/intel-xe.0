Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A8FC07CA9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E01010E5DC;
	Wed, 29 Nov 2023 01:17:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F8D10E5E5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220637; x=1732756637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Wup/SocQBelGsmnLdSOr+lTRrJ9iVqQghyxkNHM3wes=;
 b=Fds/lbjlCw7IHG6vkW4hJkVsIwnVw3YIRqqe/TZKl2INawTuO4Vtgpt9
 RcC5f765VB6XUnsIkXQB+CUnYIg2Jp7kqYlksauDoZtkS51l51KK9+n9b
 9XBtMNU0aDRpp5vgpUbog4dyVu4+zgJA5k1ELQKMV0cST74Fr7qOkYCbr
 2xsCCSWWR02VN2E0ZgR4tfnHNoLEdsoGAMN9UkNzzBUTb0++RUNEXo1hA
 4DhCH3yrugJAYGIeBI/6SxDH5r24J3XHhVuVkNfrBw9tHSy892Tj8HfmD
 ube7bhEjTlhzYqeQnyfHGUFxy8kLGTDs1tACXV1opyzxQdeL6GEEyCKYS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391930176"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="391930176"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="745086333"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="745086333"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrzPkIIn+ardqcLfRawfdR/WMYc/qx7HpAouM/wENp831n1hSieyJLBmTX/5Q9v7agfAys8Lwg63QsV7OdmuqxbsByUyDlHJ56Z0PDhw945nahsIiXZJsPXH1fbOQ3JvToRoYUAcozm6W39VxmbLs3+ULWg4cb4MarXCSlc7OA31p0iXPtjaBdR/MK/sseGsKvoVE1eHk0K0b2XY8yTo9mTP+fj3iTYmUHHJ0fuCJLpXaZDCL5tI1uv6278ujaMK1lLGLmR/1d491d1/EnoSD/rWpQ/vmWri4FdBVjuAoJnoGdjEMrbbA9H8h4Xwm5O7GZS08bl4pTQGE5nuz/M3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1FH5lPQCxrSM3Y64osluVm2eTNUtmDghK/HI7w7MOo=;
 b=NCd2F8HE10z3r+hog8Qky6Xg1N0p7TpMhBBjkYRy7U17vj/HGcqzIyRiIHvCK9YZkNqKyNG9aYgPXKkmbEJNqQFCcrz/lL5XtkdzGwAwL4xodn4O+qlNKB6yi7TyBDiwrhtDp3ETg+vvlF5BaGIjh4oFsCespimBXRmd2mU6+9jF9ycn9Q7/w48llttJ6WPa64Zi92WToZ8rQyTigKjd07zDVA18dWHOobq7mtqw+4f6fLDJSY0mSxRmSQ5qUnzRO4ERhZXfl9l0WRh9+e3fRSobi/NRfrc5pJHuni9u61ONV1hmEELeoqHJIzC0gU6YGJ9OellP7SWeKQdkRU8SjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:09 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:13 +0100
Message-ID: <20231129011624.836843-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfbbd87-99c1-44f2-a362-08dbf078e8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jGPDWQaMQQ2jvzRdZd8tEIQF/iSFyPUItSqiiQ0w+Rg8r1QfuZCcpR96oJ4UZck0/7F8eCYEFvuK5iqoF62iZX1sgPh6TPVWhECgsXHHOmi15nkHRFc8VJ/kL59tbk49n40p+djCC//8AAIKXdkPhTak4CYgiiaL+E9312BqxCga2tMfmPqbNlF2KdKYgEnwbuBukyHPoNYQeJ3JWZP76eP8LwJKcvuW3XE+F8iaAJFLCOq557cnFAMzYrnyfALKs9VW+S8fOyMl0lU7tBVwRiv/5//ClzLb1prVLkmeUrQ1xeMH+Rlb6K9AqHVDcMde0ENcPpO7fHk0J3NBJvhgZOKwDGcaRc6kH89sahqvNjbEDUaKLf8apubXn+rRdqr2OpqTjtQO7yT+IZnQzlmLEgeJcr5EBbpsoZsJ0O+Ix//r6syECNNtwbC7hBcrJr4uop8sYnYMnLN3Sc6HnJd5d9kwvTFuBOoJLqxbW+Dec6uF+Ve0CIv/Yz8ozsf7twRXpx1JWP4a9LgoydS1zaK7jiCD64jcl8V389gecUm/s6U/X/WZgoGqgabGQWQSu9IJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(4744005)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VyttQUJsa3RyZnl5VmtTSk9zMnNYZk42dHpjbWZERVVVcjZsZ2ZHOUtsbi9l?=
 =?utf-8?B?NnlTZVFnRjJjMlZkQ0JxazNDZ3hJcGd6dDZzblRIY3ZFQmhSNWNVUXhnUHVY?=
 =?utf-8?B?ekc3bWRKcHFRVk82enQwbmZlTjJqcjFzV2VEUHpXTWpvYkk3THNmYWFZQ0hj?=
 =?utf-8?B?SXlLazhQdGY2SkVZUERZaU5vcEVlc1ZuWFBpOEVRMHVYL0pCZUlCYkY3STVa?=
 =?utf-8?B?cGFkemtwV296bHE3RThDeVUwNXNnbE92L0J6VHcrRkQwd2FmVTd0RnhUa2Ez?=
 =?utf-8?B?WS94aWY3aDBxVEhaUG5VeDNHUWtkU2FJQnFzUXdWYWtwLzFXVElmMWxRbnNM?=
 =?utf-8?B?eU5kYWJ5WFRmWUZRcUN0Y1JRSFJwTTZNQ0RYT2FkdHppbERGUmNZa0l4NThI?=
 =?utf-8?B?NHhJTTR0YXJqOEVmL3lSMitwSmc4d1JBYzRBc05NTTNIZ3FXc21GK3NLb3BV?=
 =?utf-8?B?dkY5S21taTZ3MFp6SFptQnVndmwycDl2UEtEN0tjY3E3TGZMdkNDUGsrTUFX?=
 =?utf-8?B?WllnT3dzMVJrUHh6MXlXYkdNejdoRzZnbzBCbHNsSi9OeC9rZWg3N3h5YmJO?=
 =?utf-8?B?QUw4dHFEQytncG85TGpMbkpaVVpHMDMzbnRlZjdNNGdyc1ZMdUhxNzhXcGRY?=
 =?utf-8?B?d0tmbnhTMUhFS1hNTUFhUnl1NFhDOG02WDhDeFBYOENjd2Z0RjVWS2dqTGFE?=
 =?utf-8?B?eTl3eDVVMVJFdWtrY1BsVzh3WUZHdEZPRHdNK0pRZEZWeHBvZGpFbDNYYTFN?=
 =?utf-8?B?S3EyUnUrRmhHYUlzeVJ0L0gvc2VSVkl0aHNQaWZwckU0SmxEL3RjaCtLOS9r?=
 =?utf-8?B?NXV4eUYrdlV0ZTE5ZVBWREZSV2t3MnpiSUZoM3NlSjRvc2o5QWdJWDQzN3Ju?=
 =?utf-8?B?UXBxQndhMEh3RjF4a24wVjd1VkorYmxCTU9oOUJpazhjekxjOWNTbHhGVno0?=
 =?utf-8?B?NGJPOU5GSDc5alp6cVhLVXdiaTVZeXdHSUhlVU5XVHFLdnFoTHVhZ2l5S0JG?=
 =?utf-8?B?dnVVYWpPcTZFL2lXR05sNU55T1JxNUZwWE5GbFhSQ2xNZ3ZBR2JIWFQ0R0or?=
 =?utf-8?B?KzM0VTN4a21SRGE3NWlCN00wb2RWeXBEdzlQRjZVZGg5SUliQXZQc09CVnlD?=
 =?utf-8?B?OWp1eklUbmVMTCtKQ3FFOXpXME94aURVcSsyc0dvejJaQ2pFcXk1cFZKNVBD?=
 =?utf-8?B?Ylh0bHRhcWdoZTRvZWlUUnpOZUNLQmFwZHZEcDBIT29JMHEyaVl5MU5qdXFu?=
 =?utf-8?B?aUcyQ2VjMFpLRlBZUjg4cWgwbVc1UFZUSjh4TTZxckE1VFNER2ZyYyt0K0J2?=
 =?utf-8?B?VFd4UEZkZU4zUnhhYitCTmlEbEkzcmZqeStkT3lQY1RzcTEvbll1dGNTR2d4?=
 =?utf-8?B?eUpiQzhTQWJ6ajNqNjdGSitYOGt2Wm43Y1hhczR4TWlLaWRpaVBFNlRhMWw0?=
 =?utf-8?B?RVAzL2I2ZjZyclJ5elR1NUNPekg1Q1ljOTY0NEtjVEFhK0grblEvUEhZS2tZ?=
 =?utf-8?B?UmZkcEhHRFNvdXEwa29RZmNCOHEwWERmMFZtZWxJdEhzY0tqSFh2eEpsUHht?=
 =?utf-8?B?endXNXAvMjlJMHhjRUhZRE44ME9Zd28yZEN5OHFCa21pTWlzUWlPaUVHdnRU?=
 =?utf-8?B?L0x6bkRuMnJJdi8zaFY2QnRBdi9LYUVSUm1Wb3Q3MGs5Y200U2p4bkdEVEF1?=
 =?utf-8?B?RkU0Z2MxVWVhenBiUkRGaGxuOVNjN1hVWHByUHFNQ2R5aU1rck05ZFB4VGEw?=
 =?utf-8?B?TnBaTHpSYlc3UG9MYkFuS2dQeTBZNW1VK2JOTmFRWjFkajROdmplMHVwYzhJ?=
 =?utf-8?B?elhhaHJnejlMaWk0TldrZkx1QzA1Mm5IUndBYjRYdHlwN2xOZGNIYzZVa3VD?=
 =?utf-8?B?cjZOM2FvbGpkZ21ncjVoSUlvY3pPdk5kL1ZTaHpGRW5aNjA2WnlncUtJYk9k?=
 =?utf-8?B?ZkVrN3QrVUlVRmpMUFJOYkU0RWx6SThXZWVhMVd1eElMY1Z1OXAweW9JeWtm?=
 =?utf-8?B?UkVMVmdvbytCL3B5MXdlUUI4bVFIbnVjVjNKNnhKSi9zWFBNMDd1eW80d002?=
 =?utf-8?B?V3ZqMWx6SDgwMDJnODJhbmE5c2tjdEFIUHBLOFNqOE1scU1sekZmNHkvOU1O?=
 =?utf-8?B?ZTN0OEhnYkNVaXJ3MWxSQlVUNVhxdmVnVnR6N1loNDVBVDhVTVJDU29aQkhC?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfbbd87-99c1-44f2-a362-08dbf078e8ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:09.6727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CIuHEMn94U1VLV9FyjVnd9B65oUvudLMuMWV1q4kXciSTGGoeiYGuDGwmr1IzKxWVn+BCuMPVLhFHjZnngBGLkiRIVqUysHCEMGHdgELAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 11/22] drm/xe: Move system memory management
 init to earlier point in probe
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
GuC, we will need the ability to create system memory allocations.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f4be4b13a506e..dd56a8c3f80d4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -413,6 +413,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_mmio_probe_tiles(xe);
 
+	xe_ttm_sys_mgr_init(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
@@ -441,8 +443,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
-	xe_ttm_sys_mgr_init(xe);
-
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
-- 
2.43.0

