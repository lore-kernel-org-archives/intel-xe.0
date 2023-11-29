Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D64C10DC2
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AFA10E6A7;
	Wed, 29 Nov 2023 22:36:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020D310E69B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297405; x=1732833405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VCUqrEvbOgfljmKuVyn/aVdpbVNBQYXk9viQlZIVKtk=;
 b=C9Jxx0oeNxEGWBXtaZmdUf0u07Nff8P6UhY1rgQLQh0LsfQSnPCt/z8M
 BMxS0g4OSqm6GBm28YoB0M1EbdYfH5uwXQZ1iPIb5lewe1xhWsUKXt/zN
 o/bsb5tXFqEKnLz0K1OnlozK0YDr6a2dnha/oEvcYdZYaouagqyOnMVjk
 7bCEYwysum9FJRWlpfZZURD19hUw5C/wyu5VfstrATjOE/am2vt62vTZm
 4BaV1wkz12sjYvFH9TV5a9x1u4SNM/BVhTkMtGEhHaOAJKriTVKE6mdzj
 aGVNbuyxEWWWINXdTGOYlOuPCz4KgENAiTYDYJvvBplFD0g5ofNPJBEFC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420268"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420268"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718892242"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718892242"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwkYRrf3ebo1JDWybgqhTBF97DIG9h+HnscJoav2RpXxmkLKUyTTSQG9FgLEXU48YHQ4iYmIamZG9Ydn40Ic2QMoyR83DHfC2ZXyMuzG2FKL6LL4FBEy7Nqs2RSHIRwq2+PQ96HRw2qoKHSJBN0TBvkX79rTx5X2P4wUDenirZHiAw/Smym1XesBllFuGcpbk5mrb13TsHYJrqEcDNw64HG8iIgnXNKBGy3I8RHPTtGaEipwEmFRg/F937DrGVoY9JV+eH/d7BVXgEb3ZgNWB9LvarjP9GKXcmL7BKzexuncjsYyfOj+S6A3qW04F9wNRE+yZ9PXwh1APP80NsVd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ea9DDKEx/y8I1Qv/Zpuy1E6FoPnW639S31vVs4kxS6s=;
 b=Bc1A1xgoIvvZhIXnX3YkObJ+vbCsoyNVhwF7M3GAvDgo4Rgg4Ge+m5OIQsFgNE+8t+VDz2y8we6tWplwdp1MCy/dFtDnM7RJaqSsh32+bSc9lP/iC2Z7In+lBbLvTXsjx89IRbIZmxqXzFQ/jJpjerOWQgOSiiriqiNzVV/9QwGH0R6L4XZnyW7G8zGrZx9yCFS1+4e/kkMl1WThe0eIXR5g+6K07BxmT6MrZYF/pnQgPfN64vsuq8l1EGsFZdFvC8KXXqCrfWxoxTwRzOIgJigWIh5koorU/7NnGyVu82YSf60ytmwALYvzZJcRzf3kvifmcT+4DaUQ13qFhcJ8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB6791.namprd11.prod.outlook.com (2603:10b6:a03:484::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:36:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:34 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:05 +0100
Message-ID: <20231129223508.1189461-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbb0650-2621-4c41-3182-08dbf12ba42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dd7G3+t+dy+WARzxGj/Zuin4zmkLDlGUTzxP02l8jIkIYKMSaRrB4wo8MLf7vGdWyC4flh01i8iFhENGEBa+xsBbpzglkqnQk/G0BSWwvyG2qlfbVFiRH9ipxJdsDPXJ7/AZvfoMUBlWGp/r82yvBCS2rZyVTAti+rb/VLbtXZca0b5mCOweFJ1XaN66ImYWK2urEwZ16t9+gjsFEqosBD04S02QDrwbu83de3fH819WbhNGz/Q2TgoEzmyju+hnuApx1UjwG16lOdK0bmYAnglz303nOW4o/sTYahc4MUUsvtWP3QCX++XvC+ukomkdDa5BvDx7TDnzvdUZ+NdKLOSUYZFpnq1e68UT0jlbXDzpzIXLbJ9u2JLelsdLK794A9c3X4TkkHMBNJ9lPZuDomHR+Oo7BkYlBH6UTNfxXkyXBsOS8lDsR+r49B4Iyuk70IywBFoJPfN0G+awcpGq1VGfxul+kJZX967N9AJssFIBzeleNtbjOpTTsw91rXkxsObXuyTSnP+PRXW+3n/zwZm8cNoFWoPdOro0D85Awbz4uMe29gyqQ+P5nSwDJew2P3QQK1v+etocdh3AC/ZX+k8fAsRrXAhpR2CvCdxemwDZnKV/UAmPjzzlE4UEDL3V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(2616005)(478600001)(6512007)(6506007)(26005)(6486002)(1076003)(6666004)(2906002)(83380400001)(54906003)(5660300002)(41300700001)(66946007)(66556008)(6916009)(66476007)(8936002)(8676002)(316002)(4326008)(38100700002)(82960400001)(36756003)(86362001)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlFtVnlLWkVnRW5WTlZCcmVMOWNFeThsL2xDdHpXR01qS0FDajNscWU0ZnJK?=
 =?utf-8?B?cjFmYVp4enJGZHVxVk05WWdEV1BjZU1QWHZrU3VDRnBZNzlMUUE1TDMzQ2ZL?=
 =?utf-8?B?K3k5WWlvWFFraGdlYldlVHpTT2VKTW5rQ3dTMVFFUUliVTR6UlFrYVVEOUE3?=
 =?utf-8?B?ZzVidnpWdGpqZlJ6ZjVUMDdRZVRQWG1zelhXcmdZTDVpdWcwby9uRlNyQ1pr?=
 =?utf-8?B?TzZjSlE0RXM4d3NwTTlBSkd6UHg0bnlLY3BUWXh3NWtjTHI4YllhOVFqbURw?=
 =?utf-8?B?azZYdjExekhtRTlKK2tjdSthOXNGYlNrZlVONWFmQS9iYlRweC8zVjBwUDht?=
 =?utf-8?B?bEtGaHpqN3Biby9ZRFVSblNtMFhLT05wdmxaeHlha2xWVGx3dlRNQUZjOUtV?=
 =?utf-8?B?dy9LeEE4WEpvcEFEUmRhajdQTXVOclY4UlpTQVREWTJnNDZBdnJIWVl3Nmxn?=
 =?utf-8?B?ZlNrWE4rRHN6bnNSNXplbWg0Uk02Q1ZKMkJQZkt0bnBOU3lkb3pSVTRsSGwy?=
 =?utf-8?B?OGptZDV2UW5ud3Y4M2ViZVdvY0poT2x4REpDMjhaR2ZzYkZJMEM2WFVZNzFG?=
 =?utf-8?B?L0NJSE1mcmpLNjAvTUpYUm5ER3kzUFhSbC9GcldWb29NWDNUcEE1MWhpUjll?=
 =?utf-8?B?NCtUSGxnTmFLY3o2TmkwUVVOMXRXVzM0NHlrQXQ2QzRIS3FWMDFHdkI1a2Jm?=
 =?utf-8?B?dU9XRHFTOGJwZVJ2aUFNTkpENUdtbWtWTURGdDJ0Q0t1dHRyVjBnMEtsMGRo?=
 =?utf-8?B?M1h1ZEVjdytvNDVReXh4azF6Q2xwaC85T0tJTlEvNEE5bWVQMmtqVVh1bXAw?=
 =?utf-8?B?MVZpZ21wQVRteUQzNmdnY2x0RVYvc2IvVmJlbXdVcWhmbFRBMkQ3VmlVYW53?=
 =?utf-8?B?OEFXTUVzdnZ4RXhYZTV2S1VnR3hBWnVyOEEwNDlhYVFuMHJhNE5tNHEzVmNh?=
 =?utf-8?B?ZEF4YVMwVEtlSS9Ed2o4MW01MFAxM0NhMmFMZnFKNGJBMmViN3QySEdFTzU4?=
 =?utf-8?B?UTB4YjBGU1FiNUlIVEFGandVOG1jNGtINUlWSHBSNjdXN3dTdkpyV0JBOFJE?=
 =?utf-8?B?SHRFZ1BpcmNEelB1L1JORUpIcWZkVDRPT0ZYQ0hXWmNNcW92TTVjengwNVdW?=
 =?utf-8?B?RHQycklSUWMxcFNYL2FkUitlNGcxOWdRU0oxTGJ2SFcxVzBwYzJTdEJqOW9T?=
 =?utf-8?B?cnRuWVU2Ykw0OXozRTY1RnJ6YTFVTkhVdDF2SmVxVjV0WUp5dmozSjM0ekF4?=
 =?utf-8?B?MllPMmxXR3hpTWIyOElYSGhjTDJzREdrWU0veGVSR1FxTGdXR25uZzUyQmpm?=
 =?utf-8?B?bnJWMnkxZnR2aWpnK1lLQ2drUDJqYmVqamRCWGNtenQ3VVBsTWRIbjhxRU5W?=
 =?utf-8?B?d2hmcGNYN3FLM2VIZXo5dmpvdGJWU3o5QzdqcVBtSEo3QWh4SVFkdm5qbXhD?=
 =?utf-8?B?Yk4wWlYzbmcvaGsxVnhxS1lWN3NqMmcvUHBWcDVNV3RzYU1ubzBXWitsdFAy?=
 =?utf-8?B?aXBYSEVzck9WK3BYMExEZDZ0Zndibmc3bHZLYWhIUkJBblpndlg2U0FaeWFI?=
 =?utf-8?B?Vm85L0xpcWFZQVM0STVqRXVjdmxwR3RranpIaGtCcEdneVZBQmswaW5iOVEz?=
 =?utf-8?B?cU9oOS85aHAydXJzc0oxbEpRTTdVSkx6NCs3SUI3eUMwQUpaNFVxNTU4amI4?=
 =?utf-8?B?YU5mbFZzcVZESlF5K2dkQ3gxOEpKNFhIZGFhYXRwdXQ4R2tMQXpzbXJERDZ2?=
 =?utf-8?B?QitvdFk3UnJ1Z3Q3THcwN3BzZXh3K1FlOTFOZ053MGhJVWhnSzg1SFExT2kr?=
 =?utf-8?B?TXlZcXMyK2R1cHlVN2hFdUFwM3pBeWVMVGoveVRmbnlxaUd3REZMeWJDd1I2?=
 =?utf-8?B?dXk0S2dsc3dJZkRUUU5iaUJvU3RhbllycDYvOFRBN2JTaFJpVmxTTVdkaFU5?=
 =?utf-8?B?SE1aZnBySzk4L0tvSEh6TVZ5SUlpS2gybGQ5NjU3Vlkxak0wYTVIYWhPS0tq?=
 =?utf-8?B?ZHVyU2FpMGZoK1Z1RXBGaitzQysxdHhxNzN4MStqcWQ5eUo1U0V3ZitUQU1V?=
 =?utf-8?B?WVFqN21GNmgyaTJHV25MUzU3MUYvdGU0YjdZNU1weC8yTjBBUE1pbDZWckc3?=
 =?utf-8?B?NTZQbEc5azE3UEJMVUxJU0pxcjFYWkhBWVoxVTRXbWdvWG53bkdMbzlzOGVY?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbb0650-2621-4c41-3182-08dbf12ba42d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:34.4541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjWqppUf3h/TEefTuU1IQfWDBDbEtBG2dycLNTIu4v+v8pMpNKMyhXImzdu2sLslrWROrp58+RUIViRwF2rKetRwsjcv+s7HXIq5/2kwNFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6791
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 20/23] drm/tests: managed: Add a simple test
 for drmm_managed_release
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a simple test that checks whether the action is indeed called right
away and that it is not called on the final drm_dev_put().

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 65 ++++++++++++++++++------
 1 file changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 1652dca11d30c..a645ea42aee56 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -12,6 +12,8 @@
 #define TEST_TIMEOUT_MS	100
 
 struct managed_test_priv {
+	struct drm_device *drm;
+	struct device *dev;
 	bool action_done;
 	wait_queue_head_t action_wq;
 };
@@ -26,42 +28,75 @@ static void drm_action(struct drm_device *drm, void *ptr)
 
 static void drm_test_managed_run_action(struct kunit *test)
 {
-	struct managed_test_priv *priv;
-	struct drm_device *drm;
-	struct device *dev;
+	struct managed_test_priv *priv = test->priv;
 	int ret;
 
-	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
-	init_waitqueue_head(&priv->action_wq);
+	ret = drmm_add_action_or_reset(priv->drm, drm_action, priv);
+	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	dev = drm_kunit_helper_alloc_device(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	ret = drm_dev_register(priv->drm, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_dev_unregister(priv->drm);
+	drm_kunit_helper_free_device(test, priv->dev);
 
-	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
+					       msecs_to_jiffies(TEST_TIMEOUT_MS));
+	KUNIT_EXPECT_GT(test, ret, 0);
+}
 
-	ret = drmm_add_action_or_reset(drm, drm_action, priv);
+static void drm_test_managed_release_action(struct kunit *test)
+{
+	struct managed_test_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_add_action_or_reset(priv->drm, drm_action, priv);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	ret = drm_dev_register(drm, 0);
+	ret = drm_dev_register(priv->drm, 0);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	drm_dev_unregister(drm);
-	drm_kunit_helper_free_device(test, dev);
+	drmm_release_action(priv->drm, drm_action, priv);
+	KUNIT_EXPECT_TRUE(test, priv->action_done);
+	priv->action_done = false;
+
+	drm_dev_unregister(priv->drm);
+	drm_kunit_helper_free_device(test, priv->dev);
 
 	ret = wait_event_interruptible_timeout(priv->action_wq, priv->action_done,
 					       msecs_to_jiffies(TEST_TIMEOUT_MS));
-	KUNIT_EXPECT_GT(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static int drm_managed_test_init(struct kunit *test)
+{
+	struct managed_test_priv *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+	init_waitqueue_head(&priv->action_wq);
+
+	priv->dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
+
+	priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev, sizeof(*priv->drm),
+							0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
+
+	test->priv = priv;
+
+	return 0;
 }
 
 static struct kunit_case drm_managed_tests[] = {
 	KUNIT_CASE(drm_test_managed_run_action),
+	KUNIT_CASE(drm_test_managed_release_action),
 	{}
 };
 
 static struct kunit_suite drm_managed_test_suite = {
 	.name = "drm-test-managed",
+	.init = drm_managed_test_init,
 	.test_cases = drm_managed_tests
 };
 
-- 
2.43.0

