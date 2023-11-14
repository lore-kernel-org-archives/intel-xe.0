Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A959C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F8510E214;
	Tue, 14 Nov 2023 11:44:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5217C10E203
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962292; x=1731498292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=p+L/3ou37J7L8OA3ooSYNsbY0L5NNJVF2efIrn5bXKE=;
 b=MXUJRDr5BeYoFutlHEN/1eIP9zWSgkqMZO6WnB6+tJUBBzvMBomkvFLC
 ZMG88xX1T+VLqBRhIkdPlys/80UTBVJ2RP40CKO8LzCGT7BV4W5YvugcF
 pf4hJGpM42EWfmh8jj9YCGx360kuMVP5cBIdI+O1ySMeI5Tm0gEOUSt7i
 gIsgrc3NoKjJoGO/3u5qEgyKR7cs7+XTJiVIdcYPze6vc6R5q2gmMya/8
 Uo2ALtH7suhkBd5700cnWtm9XnR+kFrQBFAJe5R/kDVBSLKmsjXA6H0S0
 maBO6vncRix+Xj6Yj9dtVxKcjBHK386EkbUgSELiADvEecwwZP4UqbYoX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3743492"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="3743492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:44:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938055383"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="938055383"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:44:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:44:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:44:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hngRyCq9KGPDSvArfejGHuvDk3GF4MY4FmUP4GxVw0foblrWEtwIEpEJOpvDqfREFjGMC3BM4126v5zz8Dg+wjRZgKBf1ADaS44PRclhpppa/t3PmoNUhmkq1KkAculLHFJoBJdSVyHjJc8zmo1y7shXBJqn0D8T23LCGunnxqy91FHI96djfs9iKweOhqiPZguMlI6fPd21rC1f93Ah/izEzk+z6KJ5lDIB4IENfRWjnPncdlAdYfbb/BrQzVIZYNwl3G1Chs5VFZpUVBm5kdhtCkk6tdrxJJPbZH9rOxr5VDel9c0Z38qAaMB00qLB0gbKysxSgodE3zamoeyIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeLFOXrM+3UX3Vqz+qXiOkwhosho8UTpjos5vD6AuH8=;
 b=oGCEycJ2vUYYoSzJcEbAmejqrzAAIWuj2ktW2/KXDyVza0f7jdWIt1dKdTEbEJGXk6BynBYUVlFcXhXwsFzBVPLBOVjJ9GC3OFlFanYoqsWZAYCTFf32XnIS/C0xFSSg+YwoKIgbYGg1U7nPYXtf4o8S0x67IElKKLr6oMW8KkaafJZdhq53XBIe5q05EyK49D62nT6VTPw6Nog7pqsY30kVaZNaYYKHOgJIyicKIBUtiHNeIqOVVRqXiwC3d3HoupqfXy2ELKo003N3GEptef+QuoaxgXi6G20PSnweDwX9aQdWJ49PpQMPFFsAmFefH/h+ccnRi0+FFBsMhwPOiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:44:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:44:47 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:46 +0100
Message-ID: <20231114114405.2207747-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6706d8-2fe1-44aa-7a39-08dbe5071a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9GxY9StvhdE/CRQsUwzsFSafUTQqdYOs9b/NO5BptZQ/O502HEUu2ub/QZHtGuNsLqZg/V4dIo3eCYx2J0H+e6r/LnDzS08OoHiikP0DNwgzr3x6BUCfTZXcSsLmUXhaL7cNttbB3fqXG695O4nC+DmulP3vmPEjy6bzch1u+X5y2cJlCrTr6FGHGESEB0ZLjssef9elDCsqZGbkJUFygT8cY5nx+PvXOvUrtieEq1eYkzLV/kSYMyThNRdR8cgtyREWsTMHURuRjYLEq65C9UK+sisakuirDZi68NoueWnkPcTRcFIPTNJy94Xxol890ioRRAXKMTDgy7oUe+xlFaLNEQTJWBon/RaeuK8CJAhFn/vKcmP8k9CxBHl2719Jw5zs0trcBckhgWdXSdATpu4Ld5fAEKe4/7wqE6CIShhO4w3x7z6c0aQcQt0dMkzQ5h5u2FOa0niCVq/tmJHmDtj/LsKN0ozYpUiQN2UVaoArFli4teOoefcDARFG+rQUd3Uw9uJUi1sziqYL1XdtkIOQBXwil/s9ASP2FWBqGeB1JdndceHaEFOe80F5OAVZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzk3OUxlc01ZUlgvNXU0UTlMWC9UZkpocG5CNjNmd01QWGNoN3ZWQ0t6ZVhM?=
 =?utf-8?B?bGZsdmZuc3dnbzNMT0JPY3FWUVVDVUY4dlduL09WNjcwVkprcTZadmVkUGxu?=
 =?utf-8?B?TG9NNDBHdXFmc3F3QlVxak9Ob0YzR1gxcG9iZ2VyMGVleGUwdEo1K3N1VHo4?=
 =?utf-8?B?amxNZUNGUk1tSGZMbFdtMWN2N0d6Unh4WlJNSm1oMWs1ZGZ0dTVqRllleGlR?=
 =?utf-8?B?RUZMZ2dYSEhVYW1vUGFodUZocGNpa1BNVGpGUkNlZ2pteCtMKzJhUDhrVGlj?=
 =?utf-8?B?K2gvakJNdkZzN1FrcUpZWTQrZ01SMkJMc1RGdEUwUkQ4UGxodUFZbHgvMm9R?=
 =?utf-8?B?OUFsM0pTYm0wOEVCaGZZZmlrL1JvZksvUmhCR1F1MURPaytaTFBONG1UamVC?=
 =?utf-8?B?MDdyZFRYeWdNN3BDa3ZXNmszYTAwQUVJdWRHVEk3Um5BVmgvT2dUNDlTYW82?=
 =?utf-8?B?ajBxUjNjYkp5cTdaR1RCRlVIYjBLQUV6bno5MmhuYjU3ZXpCbHBFL2ZvKzlW?=
 =?utf-8?B?RVZveTZkVi9FSFFZYm1YbXd0YmdRQVNPV1Q4TXdWTUdPWTVDdFBaTHRDbEF6?=
 =?utf-8?B?MEE2ZzdPUjVlR3ZLRi9WR3VqQ1gyNWY0bzJsU1lrZkxDTnFQYjVSWi9DU1cz?=
 =?utf-8?B?Tlh5LzZrSi9pOUt6ak0yaVB6NE5YRGFIQkdjdkQxbXF1cjZ6Rno1T3pUWVZl?=
 =?utf-8?B?WjFzV2xxejRObkhwTHZpNGlYL2V6THpZc2ZTek1oWFlSOVVLUWN5VXFrcEVX?=
 =?utf-8?B?SU5ReG00TEhxRHZEaXU2ZjM3RFpSM0I0NGFFQXMwUWRwMnllTHEwN29iMnox?=
 =?utf-8?B?dTVGZVhPZEZmTnd4bDFKV2YzMW5wNHBwbGM0Z1BTV2cwQXNwdktER3ZaN2VP?=
 =?utf-8?B?bkNpVzU3TUg4bUp3K2szYXJ3V3prelB1MHltV0g5eCtja05FQlk0ZzA5ckUw?=
 =?utf-8?B?OUhKYy90b1U0bWltQTF0bytmdWNxWHF0WHo0eVc0eEhhTnpueXNlSkdQWmdi?=
 =?utf-8?B?VG5kMm0zL1huWTUzU0R1SmloYnFtcERGd0hldG1PYVRtdnhuT1hVeXFETHVi?=
 =?utf-8?B?eERpc0wyV1VFSktCdDUwY1pzOUswZU9iTjl4SlF6VXE2V1BXRkMxWVh2M3JI?=
 =?utf-8?B?OE5QSSs0WUljbFVxQzJ1QU94MzU5ZkVNaFArb0RiTzdEK1JlTStGVXRnMTRw?=
 =?utf-8?B?V3g0VWIyMldMZ20xeGFMMEVtSDdMRWZ0K2M3N1EyM0lNOXlZUW0vZG83ZHYv?=
 =?utf-8?B?WFJ2Ui83bUdGTlpRY2gwMno1NjBnSC9lZmlhclRnbXo1SXZLNkVRMUhRbStE?=
 =?utf-8?B?QkpZRk5vUVBOc1czamI4VldKM2lEQ3JoSUxrZlNsYlBHNmtYNDNYb2x5N1NR?=
 =?utf-8?B?VEtDUmN2eVRDN2wrcjhqQnYwTTBsVU41QllpQ2JGN1dKdXNPcFN2Q0VkVjA1?=
 =?utf-8?B?by82TnhTWCs4VDRNUmhxTFNEa3BRWGR5b0YxdDBQdzkvV1VvN2d0dmtxU0hn?=
 =?utf-8?B?Nm9mVkNkMFhhck8yTDhsbDNhNXRwdmlBbkh2aDRYdDdhQWdjbHo3L1NkdUtn?=
 =?utf-8?B?ME5qeUtzWTVkdE5pdTlleVFpQ21Cbkh6TWRRb0ZCVXdRL2JFT2RsVnR0OW1h?=
 =?utf-8?B?b3pLd3NzN1JhL1FZNkY0RXU5ZnRQMHFGZzV5Tm9UQWxoYk1sMHRDbTZVQndO?=
 =?utf-8?B?NnMwWTlmYlZtbStLQUdyVldENDJZY2Zqejh3ZE0vamp0eVVIdVRnUk5sVC9h?=
 =?utf-8?B?WXRDMlF5ZnBBZ3dXUzFCUDAvYTdOdy9ZV0YvVUtnTlh1ZVhEbGpUSDNvZjNP?=
 =?utf-8?B?UFFHaVNtSll0dk1NQlltYTNuZ1dZZ3ZoallBZEZRL2RtS091djZGckhaZEc3?=
 =?utf-8?B?WGd4V1h0a000eWpCT1BOdFh4cmljMGIvbkV4VkIrK0hUSGg2Y3dPWGpVd0Vk?=
 =?utf-8?B?WllJemRCUWFJaVJWTWNRLzhJeXlrMTBWbVYvU2x1OTdhU25PemV0V0RzNGJI?=
 =?utf-8?B?TlpKSjRIb2xiK0F2ZGQ0cDJJTjdVN2NpVDFBSkJVdWdac1QrWGh2eWVLQytO?=
 =?utf-8?B?ZnlJeU5SZnkvNThpNThOZHpZS0JQcUpSWWcvSXlhSXJiZE5DbTlCWGRxVFQ0?=
 =?utf-8?B?ekhFQTU2TjMwYm41blFnZUNTcjNRNVplRnpKNlRUWlQ0VkpwODBTa1ZnMTh1?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6706d8-2fe1-44aa-7a39-08dbe5071a5e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:44:47.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuDL6dwtQTARdmqkdlnEj8ho4n7rim6125VE7GZtrrqIUjjLcn6AGaJLdIAYTE69AQVxN3qmqxcZM5ePoG9D9bAkuJzxpvrpi4ojPpG/bUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 01/20] drm/xe: Skip calling drm_dev_put on
 probe error
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

DRM device used by Xe is managed, which means that final ref will be
dropped on driver detach.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 +++++-------
 drivers/gpu/drm/xe/xe_pci.c    |  5 +----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1202f8007f795..af0abe56c24b7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -217,11 +217,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
@@ -247,18 +247,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index 682ba188e456b..de986aaee3bb2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -701,7 +701,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, xe);
 	err = pci_enable_device(pdev);
 	if (err)
-		goto err_drm_put;
+		return err;
 
 	pci_set_master(pdev);
 
@@ -743,9 +743,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_pci_disable:
 	pci_disable_device(pdev);
 
-err_drm_put:
-	drm_dev_put(&xe->drm);
-
 	return err;
 }
 
-- 
2.42.1

