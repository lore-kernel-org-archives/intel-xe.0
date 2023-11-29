Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E34FC07CB1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3D010E681;
	Wed, 29 Nov 2023 21:46:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977B210E0F2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294412; x=1732830412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=clYf8tnt3Wt5C567t3LU+1AvPOISz9orWXRCOrhrKrE=;
 b=cn1MwFVYj1d2r72RmfWvmXys/sDE5x/7v6BOy6QlsYtPp1irY5wyk7v0
 hpjIvuikSP5hiszOZBVtOAFbbkzkbNgXVxc8K1wfwDwxeS0jMHe4NbYFk
 /AqkKFp4te7C4PR9d8YLIOYaLWc5LYPoQvzfDkLAq5Pm4Sxqjq7rqFhLI
 RExoR85goyK2eATht5K6IOxPo8ybayQwiFzd0lkGMhHtuqxLJPS5z5IUl
 SwqVXkTghunVKQYtfOGMOMJ3Ur32KednL7Sx0osV2TL8V4SO+oFYTIlab
 x/LzH2djBtbwEsIalk1saJsz1aoFPN42GeZYfc2c/kCJB8oTxgiQSd8Ww Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397123946"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="397123946"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:46:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798063808"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798063808"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:46:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:46:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKNC+ptjYXZ5g2jpZbdB3nl+YuAr6L1lV97XOpbw0vWlKkIauFkpQBGENKiNAO4pVrMcrl84qTT9ukhLu+xxjSESe19Vd5FDhqbdhg9isDBvj3YDJAEIB2lbIvNQMIIgUKoK0CNpD0M8wMov3tX756piv+XPj9RM1yMT7R35Fabkje9ffGW+ATvN5PW058bsOYOo/uwfBkLZZR8ncZNR+zDzh7pRevFvVcouf2jTm8Cz6hlrk/CedlULGPc+IHMldr+ECCr4Pax839CbQh7c4F40+7qdir+vkoHjH/8pzzDdfRckawpCV8xFivr6ijsVZAdkdkx9PUwLqBdt2vNo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncd9musTs4l/DHD6fJkX5iR0v+KjxvOhGH0jpuBvINA=;
 b=Sq3W3KQwiU0QDIem1J1p9SvtH27H23VjOxqQgoce/mI4bHyotkrMPZxxXbZxdlnmqWoWPhskEB2DfGrEK2vrtCgKM/s/jZqiZk+2BiaZLKV5tIu9A37Mg0vb03U+XN6nQqmttx+NIGmV3FrblDr6yUGq6rPBU2aA75nZ2a8lubitSygYmgrXc5371An3qEFwo5A1bFc+fuZufWmNT9SOS0xyDs1OIGTHVH6oipT0TD+mYq62oyp+k60K8UnH5hbE+3gzyu0Jt+pusauxZOvyOiYpzKHnXFo72+HgjMG+YLTt60QAFvwf0gM08y3KIq1WgBXhlk2mZemDYedgDPBuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 21:46:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:46:41 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:44:57 +0100
Message-ID: <20231129214509.1174116-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c6baed-5bb6-439f-0af8-08dbf124ac0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pESrJCEWay49l8kc1fSPWBMtRsvkXN20lFWwAI9G4/ZYV0efVXubQndtNH8BwFj1vC52RKtClCYhRPnIuhI03+9heEnvqZ+HeC9ToMpM1aZCBozeIlNH2PaseIA1u+VsZBgM7U+E+CXfYHd4ZghDHcVGjQGGTQ0qThZmSGPDb9YoWhM1xK48ehUKTQQ3taE02APjtPS2byiqRLNn3YT/HtWlM6V+vymJuAtd6oB4SHgO1FELlhbXQrlzx7IkiVpNAzzwZqfIh6qxWhbbtT8kOoldeL1rCDgZkTcrGdsn1dtAlnGkvX+7T+vU1B4/qZr0BWeoeZI3/lAF8XGycTOGauEcUFGeiSzaEb419WymeGnX6HFdgvWrh9U27UDFhzePMEoNDBncZqPLgjGZHQ6bmU+VPxgVkmN1LC9EKdwtvsqe0RO5Iifq7wjzvon0kLQw1R/0dSEdZo6D6GEH/UhPHvXoM7aTO/+wxjOQhdbApNNPaQjwyYylzTvt6YxaZ9RyHZOFlgjFctg7Ki2VmduIki+jt0DA/0UlSM2VbGkncqzJVnhMPEeAfh+r7U1KulGi3hOKRTXh5+JEX/dpyYcb4sZ70C5o70A0NOzoX9NESE9VgK11xu0fzGLQ5W+YZPa9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(8676002)(8936002)(6666004)(4326008)(6512007)(6506007)(6486002)(316002)(66946007)(54906003)(66556008)(6916009)(478600001)(41300700001)(38100700002)(36756003)(1076003)(26005)(86362001)(107886003)(66476007)(202311291699003)(2616005)(83380400001)(5660300002)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEUreC9KVXhFa3Rhano0TkcydkhiV0VTUmY3YVpvQWI5UWVaYVhkZ2c5MWdT?=
 =?utf-8?B?SDgrK3FVenhqTVBRc21wbU9ZK0xtYmoybXFUZ1R1L2QwOGpkT2oxNEJad2E2?=
 =?utf-8?B?bG8yalQ2b2VBazcwcW9rTWhqMUtYNFMzcWlQOUZpeE5Ebm9hVlZzckwzTVpJ?=
 =?utf-8?B?ZmlvWkZSaXRTM0JBdW9GVzRWMExBR00vTFAwVU91NzNTUXNMaVdtM1NVUVlB?=
 =?utf-8?B?cFpXdk1ud1BheTM1djBXVjg5NFo2NzhmVjd2YWdqMEVscGlEQ09FOUd3L0tE?=
 =?utf-8?B?RVV1bm04ZWNoSDRFL2MzanNiWFp3TlY5SmptOXF2L2ZOL3U4ZDBSYjA1aGpR?=
 =?utf-8?B?R3FTUUsva08yK1J6dEZUSDYrTVhIeGtRVWluZGpMdjUwaU5CcS9ySGYwRkFa?=
 =?utf-8?B?V1BQeGJYd1FWTElHdHRvOW0ydVFOUlNXNHl0YmUzYlNqS1duTHNESUZhWGli?=
 =?utf-8?B?ZTJ1WmlPeXY2Uk80d0hodVdmVXV3aWxFaVNyMkRWdjVrVXhBTTllYUxEbnJa?=
 =?utf-8?B?SU1nSGEzU0JGNXlpRnRUSE1JRFYwUjNLMWJ2dzVhT3lQcEYyc1Yvd2NpRnJt?=
 =?utf-8?B?Y01MZTA2RGNLdHpQWTVldGNZUUhWcTc2L1pFdVlOaWtIczhRZWZ2K3ovdGRS?=
 =?utf-8?B?b2RaSDZFSjdTQzk0UFBENVI1eUxCVk5TMWhHeHlab0ZnWHphTVlhdGQ5S1JE?=
 =?utf-8?B?enZQMi90WDBtek80WVBFK3MvZFFwZ2VhaGNvcjZZL1ZXYjFVbFo2T1lVYTYx?=
 =?utf-8?B?UGRXZHhjN1VoaE1SNncrMkxRa1FSWE5WM01naUxrZkZLV2ptM3MvODk5WHdO?=
 =?utf-8?B?SHhVYlBISFlKQ3ZuTlhtMUIzcFdWaEgyeFF2UG1mWlNIR0lKdVdXakdlRm53?=
 =?utf-8?B?c0U5WXpjMXRpMmM3dUR6TFhzM0E0dHBiUmIvelQ2K0tCdFpGNTc1c1dVcjZv?=
 =?utf-8?B?L0c5c3QyUnE3ZWRwWmtoQmh1WGlWbExSYTFJYi8ya1BteldmWlJnNXlsVHY0?=
 =?utf-8?B?SVA2bG9OZjI3R2RwUWtpSTR1Zk9PMVAzY01zZ1VDNStteXRyU05WUXpVTGdQ?=
 =?utf-8?B?Myt0cS9HdzJvNWs2OGszYTFwMDZqeExOeDN1cVpNWWNhRnR1a0hZZERZcUU4?=
 =?utf-8?B?TXRQVnh6SjJiMXhpc3JGQTVLanlQREh6ZTJJMG9MR1MrSG9hSkZ3a0ltNmdT?=
 =?utf-8?B?dEp2R2RzNDJndnowYVlCc0ZOUFBXMy9oZlZOZ0diTGp1eGtsTEZOOTFqRHA5?=
 =?utf-8?B?cWRTbXpRTE9MelMxMVlqODBBdU5rVWt5QUl3RjI5WjZXZ1pRczVDM3JLNkYx?=
 =?utf-8?B?c3lLd0xkUmpVTklrVVR4MU9qRG1ZNGRBUVBTelpRRUtSL3puVU1TbGg3ZUpH?=
 =?utf-8?B?UWhYaTIwajc1QUxzL0gxTFk4M0JNUEgxaXNncTN2MkFPYmJOZURWNDNtOUNs?=
 =?utf-8?B?SVpxemg5NlVTdVJkMGdGZXpCYkIrUmFra1ZJWjNlck9yNXdUMkVxSzhSSFhG?=
 =?utf-8?B?TWpmYXBUVlJqUkIvM3hoM0NEci9Za2FIYmlnd0hNZVJQcmZwVitkdXdxdXcv?=
 =?utf-8?B?TWladXBPcUljeWd1Qy9mcnhsTDZKZDNTL0U0QnF1M0N1aWVGZThyQ3FRSFdh?=
 =?utf-8?B?N1JrdWFQazJqY3Frdnd3Q2hWa0N2QzlHVHZEVzZMTzdSd2hid3A0UURRcG93?=
 =?utf-8?B?TGtHcVluSE1tRElVc2x5UzJLRTd0ZFROVXFzaStwWStmZ1lwcDBRWWtDWmwx?=
 =?utf-8?B?bmNDSUxnMGhTOFV0d0hBdE9xNG9pQ2FqTmlyTjR2aExVMmJ6ckI4L3lxeDhy?=
 =?utf-8?B?N3Y1UmM4cjhUS20wRk9IQm5FU1dnMUJsSkRzSzRoOEdEK2RSYWI3Sk9MWGdF?=
 =?utf-8?B?eThvWHpHbDl5bit4RXlOWU8yanNWRzM2dm1rakNaSUtTcGNkcGZDNHB3enZD?=
 =?utf-8?B?dDlpbGU5TzlBRU0yMXJtT0lGUktYTVVZK2M4UUU5MTU0bzFzdG9Ib0NrK0t5?=
 =?utf-8?B?bS9IdzRwYk82MkZqbWg5djYySU5lc0FoUlI1WGxPbWhZR2M5NkRJVmlsT0dR?=
 =?utf-8?B?RG1IWjU3ZXQ1YVhaQlFIT2NPNisxc3NPSnJoZEZ5NzVqZmVjYmdWTkNZdDZQ?=
 =?utf-8?B?ODh6cS9BMzBoNVVPcjVmZnFJRGZQUkU1eFBSUzFUeEU2bkR4RmtxcVNpcjhU?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c6baed-5bb6-439f-0af8-08dbf124ac0a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:46:41.2959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ty6QFyzHBxVeBScmoCYZa/O6ook0GHyPBMXzuDawYMsUdjrXLw20gw/BYlwlKow9mTxpULqAq7+/T/jhYaD6bFNfoGC6UxrPy1UHuW74Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 02/14] drm/xe: Skip calling drm_dev_put on probe
 error
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DRM device used by Xe is managed, which means that final ref will be
dropped on driver detach.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 +++++-------
 drivers/gpu/drm/xe/xe_pci.c    |  5 +----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 54202623e2553..296260f142dcb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -215,11 +215,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, false, false);
 	if (WARN_ON(err))
-		goto err_put;
+		goto err;
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
-		goto err_put;
+		goto err;
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
@@ -258,18 +258,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (!xe->ordered_wq || !xe->unordered_wq) {
 		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
 		err = -ENOMEM;
-		goto err_put;
+		goto err;
 	}
 
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
-		goto err_put;
+		goto err;
 
 	return xe;
 
-err_put:
-	drm_dev_put(&xe->drm);
-
+err:
 	return ERR_PTR(err);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 270826fdb5ae0..08cb726c2847d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -705,7 +705,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, xe);
 	err = pci_enable_device(pdev);
 	if (err)
-		goto err_drm_put;
+		return err;
 
 	pci_set_master(pdev);
 
@@ -753,9 +753,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_pci_disable:
 	pci_disable_device(pdev);
 
-err_drm_put:
-	drm_dev_put(&xe->drm);
-
 	return err;
 }
 
-- 
2.43.0

