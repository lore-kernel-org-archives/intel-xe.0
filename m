Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CE9C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE84C10E203;
	Tue, 14 Nov 2023 11:46:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE8410E203
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962359; x=1731498359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O9zfUC/z/9kuNjiRxdcL5r9bdh+3+JEU1+DYyaaM0rU=;
 b=lmg+04YuULTSBMsJajQNkt4Bx8Rs5kRcRJirkDaItr0Jtsmo5h8OlMNv
 qzOMTiAtvmMsPrscZE7atwm6qfvSO65xked2Ulv1nbo2yJ9Z97FbeTIP6
 VlJlR26Ke5CyJQM+JppPBcJD2GCJCITu1VxETWPnyOwAMBplyTwwKv2Aj
 O5G6qRzS6X2XZZUfkRgOxaT/jXIazi/dwbFMuhojR4uBMxSSyxFXn5SwV
 yNyPJYu6uDH/yvO/TBdtDujb/y8VzHHDjZoDElizn7bGtCl2O7/YD6fL1
 6Z11WCP6Fm8us0HdGScHAxli3s+mE/G3rdoNHnzoXFLoTmx+fPRqRdyfb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9276927"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9276927"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011888238"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="1011888238"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9PaFMFXfvnZGM80VROrU+CBzlSUnMqPrn+7GMkDLlx/6CiesyXRfFUZaUs7yYU4XuAaiD4Xq9xuz6kttTAUrbwTdP+2DbCZg1b+r6r6qRkeD82GSSblBMA0YYqnWyYSmTSaKo2iNui3sw9ABPvdTz/gECgE8Tk8N5Z3o99Thu3KlxSGExI0acPWRqMa18dYQBOCsSn3UujB7v/dlZw4ASQXWvpGGJWcbabKFC063+ahgjfpEHrXml0Tv7JhXMPlE9261CaiyhRjHkL9Dy8uFgEtN4s9oj3UCkOACisvx2DTqkihTVB30SxGoHagm/6XGDJN0nXdC+anO3LTkvCdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWcl+v+5vOxSIiZjew51ryupr9XhUX1YqrMXX9jCnFI=;
 b=AEoLxWAy5UGNdB378PzgjLnbyc3xpIMZdlsyqMuHFEKSS/bJ3e+4MLZw4vUJDBXR+Nwu9PenaqFK3NBOaBhQcmHX1SnB8GS59HlplEsG76igokaMvjpZhQIAQiEZkhraS1c4qxjcXHvLGt0193HDkVDKFH3LuhqRmywe7TG0ssJ9PugIcGvi7EAKFVBHz/0WyJ0hW2QueEAQDBN0iNKq50yU89UNNmygjXj0CU3B6LThan+9Qzht8UUhHwSBHSJolm6QQWNZGLTlgriXMjm3es5LUyB1mTKtInmTPBkMFC8JOMVFuHQzbp5XAWXiXqzlwxRlpgkvLvjvH3WyJagOlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5563.namprd11.prod.outlook.com (2603:10b6:610:d6::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.17; Tue, 14 Nov 2023 11:45:57 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:57 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:44:04 +0100
Message-ID: <20231114114405.2207747-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH0PR11MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 3484e54d-c1fd-419e-c72c-08dbe50743dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YD4+EcQd/RMVKEC4+V8HdC68IgMZR0woJiJL+8V1PwHzMHukaepUSM+RCObZVVHo1mfla9whUovmcZj1Q46pnZvt9/zoY2iVfUs7/4bC7BZ5QSln1dJNGI9uydiJl4yLPcecbr41xEK5n2J7m9vCargWAYWTT5rJnCRJG1HOQfJBRAIkR0iWtIXHTyz+x/IKsTeCu8Os9210E8MH4FDeRCs6IWUdY9JFnZ3wJF6a8DyJAD81spxvbScUCM4mUo7GvUtfTYJObBladYwy3uFfNMQdpdrIezB67d2tgUkSIMo+4ni5GDBQqAHg1jUsju2f8GmzSKxuBo/iBWem0A3uDZ/ew6tzH62KokCMnUZHWaGxYNyqVGTVVKwuj3+WaL1aSn4jRCp7xwFp1IEjoCHLm7tOkqODsX7q55AdfwHpoolB/jtRkHaJsWFELvq2MCBt4dJBw3VjMwcuAHW6ECC0pxRnEcBhBabtuzEgR0vDdzgIKJIFPWAqiOMjzn/suokfdbxr6ovtBz0td2NS1UJe1C+H2F9yW+t1vZq+z2kUWmB8XczaN+jjv8K8Px/eeAi8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(1076003)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(86362001)(36756003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V05MQmZyejhiYXRYa3FvL0pnaWJwR0toOFNRQUlCNTNLd3k5eGREREJZZ2Zu?=
 =?utf-8?B?dVRmZmV1L2sydDJiR0ZpN2tuakMrQnk4NWZpTE5hTnpwYXluQ3JBNFdQZDdS?=
 =?utf-8?B?VlF6ZzVOOXdqZzRqdE9SWEM0NFMxMmZJQWhJVFdaY2paSXpzcXZMdzlGakpD?=
 =?utf-8?B?UlM3WXZVVU1hUTc0VEk3UXBxdVhHNFRNSXhidWdDUS9wQ0F6aDdDYjVJaHov?=
 =?utf-8?B?Rm5WNFRrMGJQMWxBaEErN1V1Q09ZQ1ZacVhaV2FFSkZmSzlKamJLcUNsK0FR?=
 =?utf-8?B?VDcvVXJWK25KRkdCaXYweCs4cjdmcUFWUUZMK2F1d05nU2p2d3JFM3FMaEtO?=
 =?utf-8?B?a0lnZ0ZLc3V2N2hZeWE0S2E4YldxTFNRNkowUGF4ay84dXhweVQyZjhJbUlr?=
 =?utf-8?B?d0hMeVpnYjFtNFdZKzgxUWFlOXZsSnk1bzVVcFAxZmg3dXBpYWlHUzJhMjUw?=
 =?utf-8?B?aldvbnpOOTR0NUtiRUhTMk8yMDZKY0MrL1hVdmdPWGUxZ28wTE9PcnJDSVVx?=
 =?utf-8?B?NFpRMXFjUjBXRXdWSGZxYjdLbU1iRldjdUpOYU9MQTAzaHBjOHdIK3g3V3lu?=
 =?utf-8?B?UE9QYkk1S2UvY0gxSlpNMGpVZDhiYmtCVi9uZlBSNnNEbDEwem9DUTF3Y3Vj?=
 =?utf-8?B?bVVvRkVHWmNyRWhVZm1yQmpKS0JTU0tLN0RyTzR1NVBYQUdwNEZOK2JTSUNC?=
 =?utf-8?B?QU1MQ1VhcDhlcDk4Mm5aZlhpbXg0clMrQVF1cXFJdi96dzVPRjczNlNWRGpn?=
 =?utf-8?B?R3FLa2pDb1VFQ1FEeWhCZzZ3cXVkNnM1azJOcDZqbHhHYkNNTkRtK01uaDlX?=
 =?utf-8?B?cE5keE9Bei94M3lBQUlvb0dxRkZDSVh5N0h3ZXhYVnZOb2F0VXZJWXY4ZFdF?=
 =?utf-8?B?TTFFdHllTDA1aGx3NlhhMEYwYkY5ekJQbThiNjJMQTFQZFduYkJ6Sy9RVDNm?=
 =?utf-8?B?N0drcFMrOFFpb0dGMWs4QXYvWTA3U3NrZ2Y5d3k4dzgybi85Sjh1WFUzdlhH?=
 =?utf-8?B?UTA3alVoakN2TFhVaWFCR2ZoazI0SVhPb2E1dUZUMnZWSTNieGNOZ2dwVVVt?=
 =?utf-8?B?VnMvbzRCNWFKVjRmQVY0WVBmZVMzMkVkMExEQmthamlCU3ZWWjJuRHp0eVpj?=
 =?utf-8?B?a0NOUTlUcnpoUUMrYjkwSy9TNWVLWi9rL3phUGEzdWNqVmxlaVRxcitqQ0ZV?=
 =?utf-8?B?ZFFoUVdwc1BPZTVJeTVFRW9FdWY2YWN5aGpVV0QrMlFWcTgzRU1zbm1SL29J?=
 =?utf-8?B?VDNjazN2VDNuZ3RSTG4ydlVCRkJtRDhGZ1VRWXUxV0ZvZkNyRGFZWktsSDJq?=
 =?utf-8?B?TXRCWkROYkx2TkVNcml3anZvMUhFQ3N2bGRuT3laUG5MWW9RalhaV3hic2tV?=
 =?utf-8?B?ZmxKVmVTc3lVenRqYVMwRENKN1h1d0UyOWF4WTVYZ3NLUm5mcE9jNW1VOUpK?=
 =?utf-8?B?cVpsYXE4eUhmYTV1SVJzUWZhc2o1Yk00SFgwOEc4bG9CbCtmb2M5Ty82RVBN?=
 =?utf-8?B?TGdjNXkrdjBqVk8vTFE2ZFZHVDRtQVZTVVVETzZFdDJNeFpENkx1aGJqUlN0?=
 =?utf-8?B?NGdVZklzMW4vSjM1UzhuTEs3ck5OUDZqazlVcG9qNmVkdjBHem1SOFF3K1Ry?=
 =?utf-8?B?NEFTbUpMOUR5a1ZRQ0ZBVU5zTElmQjBENk1URVRiUTRiSFBKUHd2L2pyZ3dR?=
 =?utf-8?B?eTNRMlZWdGNKYnFYY0FwNHl6aVFZSGFlVG1QVWN6cTBYYkJRbHFCa21VMzc2?=
 =?utf-8?B?OTJJQmtCRHArWWRNY2ptMDd2RFlQUWF4eGhFTDUzZ1N4L2hUT2h6ODNjdE45?=
 =?utf-8?B?Q21kNDZDSk9CQm05MmZ6MndMaHVwV1ZLNjZySU0rRGcxVjRFODN5QXZ6aWVh?=
 =?utf-8?B?WkFaeS9pUVNtc1V3M3NReTBwY3dKcC9pRmd5WDZaeXg2UnhtTzhYWExPc3dx?=
 =?utf-8?B?VHZlMlB2cGxjN3ZtWmVhUWV4YVAwd1pkdllxYW1vNEhBQ3Fra1BTcFd3SjRV?=
 =?utf-8?B?TWo4c1FmV3Vib2ZrVkJNM2RadU82V3lJUWtqeHJLOEJPRjU0UUxhSXJvRzV3?=
 =?utf-8?B?cmd3NEFqQ1hGa1VaMHFzQkNxSUZzNEt5WWEyMnByZTdjUjJ5bFU3bUFkU1l1?=
 =?utf-8?B?SElTc1VCbGVmdkd4eVdmeHVjWkhsNFFEWloyaXAzMmhub0J5RHF1ZzZIZFJ0?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3484e54d-c1fd-419e-c72c-08dbe50743dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:57.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhvwGsDAJKw/gQQGmhyfrPvEVVpaJYVQIF4FyJ/zbt2etgjCcsYTyWLzJAedoVTkCVTdaHhTEOFo2acVubPmr2PwBia5GehC7aHWdSzM9d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5563
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 19/20] drm/xe/guc: Move GuC power control init
 to "post-hwconfig"
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

SLPC is not used at "hwconfig" stage. Move the initialization of data
structures used for SLPC to a later point in probe.
Also - move the xe_guc_pc_init_early to happen just prior to initial
"hwconfig" load.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c  |  3 ---
 drivers/gpu/drm/xe/xe_guc.c | 25 +++++++++++++++++++------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d0962e0cc27e9..73665e4e66f22 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -348,9 +348,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	/* Raise GT freq to speed up HuC/GuC load */
-	xe_guc_pc_init_early(&gt->uc.guc.pc);
-
 	err = xe_uc_init_hwconfig(&gt->uc);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3f430d5bc1051..e04b04be32b7d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -246,11 +246,19 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	struct xe_guc *guc = arg;
 
 	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-	xe_guc_pc_fini(&guc->pc);
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
 
+static void guc_fini_post_hwconfig(struct drm_device *drm, void *arg)
+{
+	struct xe_guc *guc = arg;
+
+	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+	xe_guc_pc_fini(&guc->pc);
+	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+}
+
 static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
 {
 	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
@@ -316,11 +324,7 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = xe_guc_pc_init(&guc->pc);
-	if (ret)
-		goto out;
-
-	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
+	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
 	if (ret)
 		goto out;
 
@@ -348,6 +352,7 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
 	ret = xe_guc_realloc_post_hwconfig(guc);
@@ -356,6 +361,11 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
+	ret = xe_guc_pc_init(&guc->pc);
+	if (ret)
+		return ret;
+	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini_post_hwconfig, guc);
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
@@ -566,6 +576,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_init_early(&guc->pc);
+
 	ret = __xe_guc_upload(guc);
 	if (ret)
 		return ret;
-- 
2.42.1

