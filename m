Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621BBC46CA3
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF2810E5DD;
	Wed, 29 Nov 2023 01:17:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E4510E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220640; x=1732756640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eLU+pbtEXwztM5ZDI8M2bTL8cSgAEABLy4bG2f27emU=;
 b=HhFmrDexw3W4CMcluxWY1peWF5XbWc0P+V1nQHiFl5b8LLSQBQxMC6tv
 ZECLjFelT0xqCeXO3xSR4riCjqmLCzGmYpRZy9HnsLqv7vohiUq7W9SG2
 MQtx5BJx8pOuiZL1XRuB6gb0ZCoWRiYXH91mq5Q0QNSE0EWQjoZvx/GZk
 NbK8PR3bNZZrmWyyklLzPfs9bQQnZbL3/cywZNw/T0HhT08hceBZcWKzO
 kWuM2dulL1rFsgr/cN8vBD0x3gF7YD1egRyYrNgIYhhLg4SLNWblt3epD
 pk0q7s9wmE1yaEXcrblNV9GEXFgKkO5Soq8tMlBPeB0WR/ticBetz19Ml w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436614"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436614"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272713"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272713"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:18 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONq7ZIKuVMhKwWauvm4wf3GHKqPTEw9ycuEKKxOkCaILloBcOiZLSUI3G+mcUJ4qfqXhnMuZtSuz/z1pdQkrqQK6b4GmXlg2LRm3lSxuzkQocUF8wIpwgI6V12HTUSYjw2zwNMFxz5+TTuFzJnEuE3iHMaKDd+oK2C2Jcn9MEhE8zGdFljYG787DDKLWD8L16FBB4KJ3QEkk2uO/6YU87XNHkcJme0IAQ9JydpmSYD5rUog23y1PUExoNzQ+PBNQQT5Ue19DgFIK3/JGnn0AQfxVYo7/enoMlHgodH1IgzeyRUERv3EWxuC6uTo8fPbtmNQDZfJuntm+b8XS7BURgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRdHlUPZnYcY6znOxq1ZucSoGyQSVzesLz4wAVuL8Dw=;
 b=ULKuTpR12L/R+pDzXkvlT5d07ayneDZJAnZfH4ZYD9sKD9aFwqAuJx63YbCai+3oqKLdi4mn+xKtQ+cAstp5Ygnkc1RxO/PsW1RcKoCWFoJXxNRt2CClx7MOj7cp2FrG1WRCI9o1QYdqXj2E5jwiMdzEVV9drOduuCwvms9klQFq46FyBrQ03QcieyX161zJ/uhe06arNpyYHfhLiQG4VGDebmt6tIRdeOUCjF9/y0qTDNq8/1Oz0+BnFXg2ccFdQ3Sx6lHdqSLPmVNg+GBaC6qzqe26jDPwnH1z/kT6T8v/QxpyVih68+guKicpCfYWetdKUv1hu9pFzbt+zZmibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:12 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:14 +0100
Message-ID: <20231129011624.836843-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1dcfc4-b43f-4b7d-daa7-08dbf078ea94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mzVVr2JXbS7Pw9sr0TQDBOxS037QLR7qyfLWTMqagxb5OaYhI3DPY+vtk/K4AoGNRKUtx9mu2Eb29vg5ILu7fXHMdaUZwspXj2kNNcUvImKpXYUok6W1oUQkaJ39sFEeL0Npn2VZYLNYae4x9KlryZypBJa+6R0qKMOlHBeii1Hl5pLTmj2R57SJhwIEbOT1Hcv+evoz7KvN3MwQw3xBv5MdqaBpUBgOsE9tZOHMEUxsokWcGBrJEeVAJZVIeeEvXmebhhrp2b7yh4hqAYqfHinrR4Wgb39eV3uZqOJ5vXUBRXhG2QcY/DuoK9omgGTacskr9hfOPkzFsjt5LfHhkQrpXh/jxjTH8dWbD6ZLSBVuKJYECE01bODAQlci7TXc6AgjBHDZ72wU48tXx77UyWpqvmkgl2pkQ68IdMh8YO5nf0PLHtWdaVIKgPhDmynPZCv2irTTrBAbGFAajXCV+q8AKDWl74xbuPsCKDdnnVyQRY8ldz6f3MJ0b41YB6BkYbSK/dwePDaKgwVTWKNUAb+hsIzndcgIwd/zvvaTZw3HwUU9vsURtZgYH6bjUMaF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE9OWmZHU0E3YnMvWjE2Q0dOQ2VWV0duOE1FbkpVK2EzVkdlUVhiKzUrWDRN?=
 =?utf-8?B?QkFiNy9VcnZFTkE4eE1kWllFV3huMDZzdU1LeXpPTE1tNXUzN3dlMm5GNzQ5?=
 =?utf-8?B?VUxBL0RBR3VnaENsbCt0cU1UYzFRRFFkVFo0N3BMUElqKzB4UVNEaWhjMlpE?=
 =?utf-8?B?SXVkeEJUSmltREZvS3V5RVNQWVA3MVFYRncybnVORWVNT0lDNzNkdEF3NHpm?=
 =?utf-8?B?NklXNFZHa2IzbUY3RjE5MWVBdEhaRXdpeUo4ZmpvRnd0KzlmMXVpMytwWXVx?=
 =?utf-8?B?MXIvT2o2ZGVFYjVwbVN6T2NqU0FBUDU0T21PaWw2UnN3VEJRQTBScFpxWVhl?=
 =?utf-8?B?MjRyKzZtWFp6TlJrdFh5TTEzQmRuRzFCNmV5bDBlZ0xZSHVvNnJmUHcyT2FX?=
 =?utf-8?B?cGowK21uNmRvR2krSjJzaUFXMHZSb0J4bWV1aTJkTHdZU3BKeHN2M3BuT3dU?=
 =?utf-8?B?Q1JmamJqY0FvOEZCdUdCVnpGWG0wVWtvQWwzZHJOcEJkTUg2MUtKZDRwTDRo?=
 =?utf-8?B?N2l1MXdObTY3SUZ1Ni95TFRwMnBLeXNDNlZQa2NrQzEwTHZGaE0rMGRKUEVy?=
 =?utf-8?B?bkovLzRQV1g5REJ1blppWHEwdUNjWHdsaEdDSnRCMTN2T3NZU09zcjR1U1c0?=
 =?utf-8?B?VGk1aDNMd0RjWmgxcm5ZRDU4Q2xRNEZZUE4zSHZ4YTJMWWpac3lUcEF4NnZr?=
 =?utf-8?B?Q3ZlelhiRW9YSmovWm1Ya0dFcUxIWjBSWEM5U0hnMzBLSThYOHF3cnVjMHk5?=
 =?utf-8?B?TGdscm85b3FxYXVnL0pqdEp3SFVCWFZBcjF5d2RpWHpDc2JIOTVRZHlnaGtp?=
 =?utf-8?B?ZTBQTW5xYm9MclFHcmIxWHR6U3haVTNuT01QNFVkZDNwdGhKeEV0QWRBaThL?=
 =?utf-8?B?dGJPM0NTajlaeG9UTnczdkNGcUdBN25oN2NrbjJtUzcwNzl3VG96THZ0b1l4?=
 =?utf-8?B?N2w2WHBRNW41OEVMMTlTeUc2cGt5VXh3QmZoZ21jYVZod2VyZmxVRVFOZ042?=
 =?utf-8?B?WFFCSTA3emt0YlNXSFc5Q1g5QXZDcnN0QUF5OHlLaGhZcjNUUnZYTVBtSU5L?=
 =?utf-8?B?dUFkSWtVTlJvMElockViaXA0WVhrTVFZUmY3bmZPREd5azBQK3RmSW56cjFL?=
 =?utf-8?B?dGlFM2doZWhRek0vWVZWT0xWL1F3VmhtQ3FzVkROQ1c3RWxEUFM2d2Z6cmJF?=
 =?utf-8?B?RUpibEJEelR2L3BmNitIOHJuZWgrODhWM09NMTFEK1NnUTVac1NNUVhmWDZ3?=
 =?utf-8?B?aWdHYmVTS2dPem5OMGJUbkljTUZsZXZNMGhHRndRNkJ3TXhsS3BlKy9qWEdX?=
 =?utf-8?B?VVUyMXZzTnBEWEwxbEpGeWE3TStYSWt4clpaWkEwV3FVSDBBRWNnaFVLaWpp?=
 =?utf-8?B?SFJOaFdCakwvRm55L1hob3dsb0xUTGJ4ZHY5V0xTVnNUdjF1VUFaaE9semEw?=
 =?utf-8?B?OW9aaWRidVVYMEVncFp5TFNWRmQ1bnU5YTQwQ2JHekhCdEorZ3lQZ1o0YTdH?=
 =?utf-8?B?NXcxUXZXN2xaOWVpNGdpQ3ExODJJd1p4TGI3ZGtMbSt2d2xtUUloRXZZclN1?=
 =?utf-8?B?U0VmSXBtcmV0Qjhqb3BGMC9BNE9yRzIrRUd3NHNqUll0YjJFajI3K09oY2l3?=
 =?utf-8?B?Tm43L2FsS1FYU3RzQ3FPTGtqTVM0MEgrQ1huRWdTVERKZ3NqU3QwTGwvQ1NY?=
 =?utf-8?B?WVd2dXczNS9hNFFkQkZNL0hYbk9IMHpxVXhkSGpsMnBuYmxMdkJhaWNVbFFt?=
 =?utf-8?B?Q0ZMS3hiNk9wNnBXNzllZGNzVnB2aFhiZmxzUGlkRHdxYkk3M1FiZ3lJYjk5?=
 =?utf-8?B?TkxyeEdCNWs2d1hVWk9XZWYyZ09vMDlrR1hDem84c2JLVUVaNmRvVWlzaS9Y?=
 =?utf-8?B?dGxZeEJwS29nMlkvYXJ4ZGdhRXBSbUJMdVpLYkp1THRvQVIwVXZJelh1b3VL?=
 =?utf-8?B?VVpCL2hiTDRlWkUvZHV2WFF1ZFg5SVcxemxrMWhFdTN2Z2ZiUm9OcjdaVStY?=
 =?utf-8?B?aTRXUkcvcVlTMG5hcjdremZJbG9ZRVBVcG5zaVVlTFFTRWJXNUJVcEVFb1Nl?=
 =?utf-8?B?bW9zd3c4Rm9aZitmM3orKzNBUUJsUndINU9OWG53VE9Pcm9NQTh6U2hhV0ti?=
 =?utf-8?B?eWJQWFBYYm9HY0R1Y09WTDBvL3lQaGxGNjlrbFVMOEdLOXV6T1hTbnZGdFdJ?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1dcfc4-b43f-4b7d-daa7-08dbf078ea94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:12.6594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fgNIAXdWqE45N6hWReXj/SedHuMezhncd7khtSCkLQeMjkIX6UuneB1ScZ8oI9MA/wSp2FtK3nsiZWq8ta1SVI67ISku8vfKYd9lIxDANc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 12/22] drm/xe: Move force_wake init to earlier
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +++
 drivers/gpu/drm/xe/xe_gt.c     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index dd56a8c3f80d4..bcc10b7f23ab7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -415,6 +415,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id)
+		xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0dddb751c6a48..7f26899bbb1b6 100644
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
2.43.0

