Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877F8C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBA010E0E5;
	Tue, 14 Nov 2023 13:04:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EB810E0E5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967076; x=1731503076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Kd3J2jHr9ph69GaqiKtMdxSIRfyE/AWauB9QZjOVRJI=;
 b=h1W1KoyfIwLJgnVsGHHfsfYV8bioKbKffhHuiiJ433ngMDpRn9F0eZRm
 Ug/RD8yn3Zl7f9GRgx1KmLN8CYOgaI2MmsEXRyhorVukGfFO9w8lcPpfI
 Do9guAbmiXKaFsELWF7wcNa4bD9Fzoq6vUP96xM6gHgIjo1L2cvNQFVY+
 9hzV7lnz21/TOV8x+kXAuiHiSXo7Dg9AoAW92BtGLXenO1O2Z2OWPU0PH
 RJr3LCm1ZinMQfNSWcUHGTIyrPABlmRNRQeJCmV1NTBDp9rrU7L9hJ1lS
 ue0eez64EAnehbZjQWgIZ5rpA1x5BEN981qKy99e/86OrBK8q/b+T3aA9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="12195345"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="12195345"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908354240"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="908354240"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD4lKMVBiLYy7zgHIXOsP7d5gWnFuzirvj2K5Z8aVQs4noETDrE4dUjG7yhtft8sZuYd0aIvlcTr/jTTzgXYYhJTduz+5/rJVZcs2LEBMuMkimyf1KfmxVCcLj4Mv5ogiSaIiHthUsfEExyo1HkScyduynwVgmiEnuHMSM/Y9WmqrXCMpWO+su0B1EJUKl8uZPiNGMm+iOEWjHAr51DzFtNGg+Kgf/vHFTmIIXYBXphu/YRvP88GMiGJGlq1ne/dCICBEYjAc9AJEA06TM6aEshmnstjIyBCedj3coLv/gqMlrEmZbGmoH6RkfcqyDpk7CD0Z0DcCMRLem0AAkAw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xwbvU9qwh9uOkcCkiXiYtflH8Fegu1zGGXnxQbYMT8=;
 b=X5MZa4w2w+FdKV353FtdB2mZsCZWF6jURJt+VHTIHrNGnPhxM/cgG7P+MMmBg4Hco8LIDeTSP98AeNR5J55rl0y1zakn9aJOqLR3OMSI2wFMKWWKpogYV/c/VKygDcQcYgUCveUiS9//aZ3qEgwZcGdvkSeC4/vinsnluj0LftuAp/6dbybdMI2JGgT4MOczM9nJTzZgQWV3EoZmEmmjvFIzEqHnSmpw3au3gdqNEHmjfczRFs98jnCbLKtX7HW/GejxJjuYLvYwqzze6gFvO92lRYVcN4H7rfA6Ngi4JAcsREQd8GBaXXJFv4VWdLSjs7v/gNUzXriDsp/esfHtkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:04:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:04:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:31 +0100
Message-ID: <20231114130231.2299661-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de0e85f-64bc-4e39-b23d-08dbe5123e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFbebIQJT1g3s5Q7UJUZqFEnAZAUUSpnm5fCPRLDnjtuw/7r0yIv0rjCNjITpq7OwGgwlaBGGMiDmFV2eldYHGnk2iwTnmeu9LG5a5hL/vTAKm7tELSGM3kYCslB5XDzSgjYny5m6U+MFVAFBDRu5naU5XjnsELZadALD7rJv47Xwm578x5vsHmSt/F5yOjXXx3th0bcoQhND8attfZIGR9MMKK1iy1nVpCV7wmKQR6XjUvMT3OEUfu47IKDbAyUxzoOC/uya7U14Iv/B9eeikU1tjJRq8kjF2+dp6kZtUSaGcnPtufzz5vwSpPKoq/2YiM6zXQwvJIDSEX1N8HCoIm7fbUgD9JVl1+qExX5jxLwhotbBKn1tLUlDjcHt/gnOMWlM6fxUZThjXY7KnRn1eyIdJadFm0mWjhziDY59vNEmAf6JJAVA7zYd43lsm2SN+ebeIy363yapZHdqqpu3h1H6LNdoF3OYWWSw0Vnt7ocpGV3P/3BeN/jJ5jMWiwIzJSCq+dPiuBUtrOS1CjvFMIYsSP7SE0NhFYB62KVNmZ6lOI75Dx66zoBhGd4KF+pnRL3fkBE2ec2rf6cLIbgIu74Kbk9QfhqOLflhWGZXs4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(2616005)(6512007)(6506007)(478600001)(6486002)(36756003)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(41300700001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEMvVlVkNnlQRVlqUElvZWJXNlRwQ01wM1puc2QydmpOVGxlWFZ6eGk2V2xm?=
 =?utf-8?B?MUkwYmNoQ2tCd2taeS9MbGtETkdBbllnM0NJek9WWG1kV0taanllc1BsbkVn?=
 =?utf-8?B?VDVpOWsvVThTUnNhakRIYnBUWURxREFmVktGY3RmNlQ3Q21LWGNlc2FKaXJl?=
 =?utf-8?B?NXVWODM4cGpiek1nWGVmU2FkT1pGQXFEZWxhZnhKanhnTTJYSE0yYVM4TGdt?=
 =?utf-8?B?MWVBdk9qNUE4M2F3VFkxTXlMY1Y5dzd6TUQ3THliWk5wem94M0cwK1ZNb0N6?=
 =?utf-8?B?QkhzU2dGNkt1NnFxYmNCQXJXS2oyZ2tMSGNMOGJmVUdZWi95bmxlSmo3c045?=
 =?utf-8?B?ckptQS9BejJEcit6L3NrREtCWjlzbzZYWWhadmxOL3FRZkhMNlFxeERUaVcx?=
 =?utf-8?B?cDFpL2VDUDFySTQxVzRndnh5Ny8rL1YyMkExckZDTm0zdnBjc0p4bjN5NmNt?=
 =?utf-8?B?bTlURVhFK25MaURoUFFsZGpZRHY2RytEaXNpbm5OdndRbVUzMGhhMWZ3VWxT?=
 =?utf-8?B?RHp5WmNTcGZIdjN6dXFFRXVmQ0gyNHRXN1gxb0pGU1NxTTFiSVZQeCt4L3lS?=
 =?utf-8?B?TGp0a2FyY0VMbDNCYk02YnppVkQ2bUExZVN5U251aURMbDdHWmNuZWN3Z1l4?=
 =?utf-8?B?NGsxcDEyUW9JVXY2Q3E5MWt0M2RpUVpaN0srY29kOTV6emQ2V2VBRzJrMHhw?=
 =?utf-8?B?aUJqSGtZNFA5VkxKcitGQnFzSERodVp5c2EvY0dKTjdFaUFtV1lacWdBOUZF?=
 =?utf-8?B?S3Z0ei81VzE0ZEY2MWFiN09raytvNXlYYTdYdS9wcDh3NkFPdzBpN0pCS3g4?=
 =?utf-8?B?NUEvd3pZaVl2MXB5WktrRFZNdzI3R0hIRVlCVERDanZOVmNNWEdxeEVac290?=
 =?utf-8?B?WDdkaVhMdFFraStMam5HbWF6Vnc5S1RDcmJlQTNwS0N2VkIrUWRyWkJ2MkpK?=
 =?utf-8?B?NmJyakkvc3pFNk5odTlZQ3JTMnF4VW1kdXNWdGhpa2VyaEdyVDF2UWlLM21T?=
 =?utf-8?B?QUJYUW01V2pkejJ1T0x5TkpnbDdMVmZNZ1lHK0tjWGdLaFEvTHNISW1rblZL?=
 =?utf-8?B?YVh1bXhpbWtKU29VNFplOVVZVm5lN1V1MFRCZ3JLL2Z2TGRjMk1RbHBhMnBV?=
 =?utf-8?B?N29kQitpV2xtQ1pmU3dndFBCQkZLT1hRanI4Y3dpQzE4ZlU4Kzc2UDZNa3Ar?=
 =?utf-8?B?b2Z4MFR3Yk9NcnJuQW5LYWsrZGVCc3lGM21EVlVQcEdkL0llZzF4RS90OHhr?=
 =?utf-8?B?SnhUWUxteTFxdHMxbGxpai8vWFlMbGJsS3c3N1VwRUJlY0pWZWNDbWxtdnBI?=
 =?utf-8?B?VmtUbDdwU2FVNWl5RzJ2WUVUYll4QUJIcVhqOFFwdHFYWjV1QXErSEFRREE5?=
 =?utf-8?B?dkZ6RUpEenRSckYrVHpDK3VaQmFPYmNGSWJzMnFzSndpM0JIVVBwTWFnZVVy?=
 =?utf-8?B?TEZZdHdURzlwNDFIR1pQdldOblZTdTU3c2p4WHBBSFliRmpMRk1BeWpxYzU3?=
 =?utf-8?B?Vi9RWHhZZ09US3hKQWZIdzU5bkdoRklKdjVYTkgzUGFOZUV0eDVSWW1uNjJt?=
 =?utf-8?B?b3IwdFQ4V04wR3ZZWXFyQ3hKN1RnL09RQ1BPUWk3QkRTT1YvREdhL3JBUXcy?=
 =?utf-8?B?dDVBNWZRdU5oUzUxZWEzTGhPazJUNHA5dDhzK09ZTE9tYjNES3d2WWR4eURp?=
 =?utf-8?B?MGdFVklYSXdDZElIOWNuK2NXVU8yditrd1U0NjAxcEJUek5mTFIzN1FJbmY1?=
 =?utf-8?B?dk4xVHdkSEwzTy9nWHlkU2czL2hFeGN5eG9XaVEzbzJpVit1cXpTSnRuMkxp?=
 =?utf-8?B?N3VCUTdLT1cxQytCb25zNkR0TGcrcmNJbzRBdW9pcGx1K3lKQnVWOFZQNDNq?=
 =?utf-8?B?dlNSakJtbEkvcGJ5TldacUorWUNmREdTcmRxZVlkU3djaVVxMnNPNERwd1lD?=
 =?utf-8?B?YTE1eVVBWW4vMDVxUmJENVBkRXpQcXprZm9ENTREa2NEVDM5SE1zekJpaWF0?=
 =?utf-8?B?NWQ5aXZDVzcwc1k5N0RlWnJSQ0doajN5YVZtZ01HMFdFeGVFcTBXYzV1cmxn?=
 =?utf-8?B?SEF6ODRnTjZySDU4aHhUVEJkY1Z0TGRQTTc5SUxMTDM2SDQvKzhtY3V4Y3Jl?=
 =?utf-8?B?eFcrUEc4N21zK1pWeEdsK1haUnE5ZjFYaEFqK25PRkk4b0paTDNhcnlvZGJT?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de0e85f-64bc-4e39-b23d-08dbe5123e7b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:04:32.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ER1gvJib48O/buN0Ku/BkwmqDe+wwj5X2xy2dkWXXTBfECiOUOo7p730grkC06ILjVey6D342brQZFSgm3WwOC9PQpCwkikr/8kA8zUmHsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 20/20] drm/xe: Initialize GuC earlier during
 probe
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

SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
to access a curated subset that is needed to initialize the driver by
communicating with SR-IOV PF using GuC CT.
Initialize GuC earlier in order to keep the unified probe ordering
between VF and PF modes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt.c     | 16 ++++------------
 drivers/gpu/drm/xe/xe_guc.c    | 15 ++++++++++-----
 drivers/gpu/drm/xe/xe_uc.c     | 35 ++++++++++++++++++++++++++--------
 4 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 531aca74e8eb4..ecbf1effecc41 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -32,6 +32,7 @@
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_uc.h"
 #include "xe_query.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -414,6 +415,16 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_uc_init(&gt->uc);
+		if (err)
+			return err;
+
+		err = xe_uc_init_hwconfig(&gt->uc);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 73665e4e66f22..bee661e1f164a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -344,14 +344,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			goto err_force_wake;
 	}
 
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	xe_gt_idle_sysfs_init(&gt->gtidle);
 
 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
@@ -415,10 +407,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	if (!xe_gt_is_media_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
@@ -442,6 +430,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e04b04be32b7d..895bcc24ae2c8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -572,26 +572,31 @@ static int __xe_guc_upload(struct xe_guc *guc)
  */
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		return ret;
+
 	/* Raise GT freq to speed up HuC/GuC load */
 	xe_guc_pc_init_early(&guc->pc);
 
 	ret = __xe_guc_upload(guc);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = xe_guc_hwconfig_init(guc);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = xe_guc_enable_communication(guc);
-	if (ret)
-		return ret;
+out:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
-	return 0;
+	return ret;
 }
 
 int xe_guc_upload(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 13e76e6805ca1..069207a7f2f21 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -29,8 +29,16 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
+	struct xe_gt *gt = uc_to_gt(uc);
 	int ret;
 
+	xe_device_mem_access_get(xe);
+
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		goto err;
+
 	/*
 	 * We call the GuC/HuC init functions even if GuC submission is off to
 	 * correctly move our tracking of the FW state to "disabled".
@@ -38,26 +46,36 @@ int xe_uc_init(struct xe_uc *uc)
 
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
-		goto err;
+		goto err_fw;
 
 	ret = xe_huc_init(&uc->huc);
 	if (ret)
-		goto err;
+		goto err_fw;
 
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+		goto out;
+
 
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
-		goto err;
+		goto err_fw;
 
 	ret = xe_guc_submit_init(&uc->guc);
 	if (ret)
-		goto err;
+		goto err_fw;
+
+out:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	xe_device_mem_access_put(xe);
 
 	return 0;
 
+err_fw:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err:
+	xe_device_mem_access_put(xe);
+
 	return ret;
 }
 
@@ -117,17 +135,18 @@ int xe_uc_sanitize_reset(struct xe_uc *uc)
  */
 int xe_uc_init_hwconfig(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
+	xe_device_mem_access_get(xe);
 	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
-	if (ret)
-		return ret;
+	xe_device_mem_access_put(xe);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.42.1

