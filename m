Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DB8C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6768410E441;
	Tue, 14 Nov 2023 13:05:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6753A10E0E5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967104; x=1731503104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O9zfUC/z/9kuNjiRxdcL5r9bdh+3+JEU1+DYyaaM0rU=;
 b=jOFSo7fS2kScL5pz/nAzYibZz0J3FA+9SUKfM6Fq37QgSBCJrCor7/uF
 T1F6CYzg1ce/pPWQeF/5ISH6PwP4MPIKGKuvimIVaCw8g7PMSIKjcahhI
 znf8bnjStsRBljfuYLeV393jCMyhqAmqvmFa+aalF9/9xY6JOeluaL23P
 FBrUJwUevcsQu5Dl76UhTypgNGnLUsLAYCV2mxafkBxx4aoR8lgiQ+Wbt
 82tAgGryLF1Fe7BS9SweBns5+eS1I4AUNq3OMPuGtzKQaLMN75zYjCFIW
 +YoX/ohBJPFX1XlO1GOogeDa3oHipRgk8Cs+H0bNSNaIvGLDi7vzXQ96R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369993364"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369993364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="758168658"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="758168658"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:34 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTPIsiaxkjdJAk9C9KsbLHvO9C5/ZhrU1Iqsu1Mh9Xbre9WgMM9B1CYCx47ELc86sfy3YpgnDOq8rMxctAztBlCllXx3Z7G3JWl31o8+V2WHMLWXkQvVCXx4Pvfp54dj00rJYzfvIVlBklP9GKVc7/5WoX0JWfSnXQ51Bn03cLD8GtMzqUxHLOXbAht96YV6r0E09H0UcFm9CxrDnpA6PbdkJl57lHybQi6B6Xog0ef/Xz02US0t5RiliQCRJ6ZCiXlPQ71ppzdYnMYJ41vYn8+V5EldCLyYHW0ajIBuepfmPeCx7wyXorvCuRybRRxXYCViymC29/VfblsuXvbowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWcl+v+5vOxSIiZjew51ryupr9XhUX1YqrMXX9jCnFI=;
 b=WS+3bfasP0cGzYLuEfZ0NeTHMTFHyh5MaGZIdBW0IEttxpDWtoVQwF8kb+ue9uEKKuz5c9jLWdB0zbuWFXnI0/F4I1Lk1694SwAPNOx2H7N8n+MuneCLDXwh/fV6a3tTXJsNHw4bfKu9R+OeYI96UINxzQu7tlJpQmVTN2DD2gleHC30HE9sN2StqSChfkYwEqgI5YWRspn0HEPRYlUSV7N97YA+uhRvC1F2rJC2n6+Tf+X+ye35KD6guziQdPsqmFoZDxeCol82dX63bwmKRuxCGFg7QAvAy4yyz3zKLKL68yipIydrzxesghOSTMxFLRNm9FRLgCIjTxckdqm0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:04:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:04:27 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:30 +0100
Message-ID: <20231114130231.2299661-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: a252fd67-1eb0-45ca-7837-08dbe5123b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VouocVyRG0rAWHO5auFjSHzZyDS+1pN9mpkW71Vcp+nep334kqTpjvp2JDwXTFqm1UPhKSYShxclM+gplS+i9wdxlOkj2UlA95chldTa86cnvc74ibvpG+/jZs2Fm2acEz2f9IXpEjrD/oiMUu4iJSw6EGvzkiNwwSEpl7fvm+8Z+vaPnrh47vdLyrXu9ri5MTzVHhtG6FRWAqB+Bzzb4fbaRXOL3DSQfYY5Q8sCpip9yAAMR5KLHp6qQRgY0IYn+O+ZEr4X7XzBJMdA5Mlayogf+MLX4B+6DbuTe7T1C/q/SxYOOKgEdyVxERJ3qEesmFyjUG1Js1PHvHwmsX8mcn4yKn4q3ja5hgT/3X48O2tRNmOiNR6kta5lhyLOPiRsoRafydUUVYyVAsaCbSpc6GyJh2Mfvlg+Pb3dnwE/gAmnlLU4LFFzF8yxWDIPosiirh7vgYEcqCay/y9cR2do3MfzVqSxIs7F0iZNbnwecJQJVqavGJuQyhozVCX1BFpAkorcwIum6XybzLLCurFSzhuQLpaVWnUbSxCoOMFuPFmY8y47Krwa892QLxtFdlPw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(2616005)(6512007)(6506007)(478600001)(6486002)(36756003)(6666004)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VldmcDM4K0Q4L3lwNkVLay9BUk1yNzZtei91V0hzMUQ2WFNYT2tVUTY3bE96?=
 =?utf-8?B?QVpacXBmSTRvN041OSsvSUE4ZnFLcU9vdVlVdXRiUUh4c2YvcDJQOTNLaXNr?=
 =?utf-8?B?Smphb1lSTUlBdmlTTFJoYlhZTDYrQ3NTYkFiRXNUbTdEbkJmTHF5dXh3RDlq?=
 =?utf-8?B?NGR6d3dDQVY2eVg5dVV0MFBZMlJKVk9ibWV2Umh3RVhZQ2dPUktyU3ZRTmtk?=
 =?utf-8?B?a3dnK3ZOZ2ZkMmtLVzJFZkJBWHl2bVhPb1U1WWhOU2FpUzRIU0VTRTZxOVk3?=
 =?utf-8?B?bmE5SDBDMUZKWWNrc3ZTYnZtcVRkQlM1b0U1cWhzSEIrcG94MHFhOUNUcTZH?=
 =?utf-8?B?MmQyNGtqeVZYTDRLdFlXTzRGc2NqZEJUMk92bm9tU3BuNktSU3NxTjBTRzVp?=
 =?utf-8?B?Sjg2YUFZLzlEcjFaS2hoOXBKZkRWTThPOWcxeEtuRk9MS1c5R3lBUGtsQjlU?=
 =?utf-8?B?Uk5KRFB5Wk9wQzduMm5oTnVlZUJ6cmVuSWY2MnZuMXNkTFg3WmVVbWUzVzgx?=
 =?utf-8?B?czZSWDhvNWlPb28wZGFRc2hyNko3VUx1WmtQaUlYdms1akZFODRVMDRrVzN2?=
 =?utf-8?B?ZnlWVS9DQWpXRDhtbUNpWHlITG5SWnhHZmt5NVhMcHJOcHZrR1ZCUkdmYWdG?=
 =?utf-8?B?UHFOcjFIL1NZOFFFQXRqYjBnZGQ3b2ZaOGlzZ09sc2kwVkJkNzh4OUVXOEFH?=
 =?utf-8?B?d21WZnR6eU5PbUxCSGZjakdzam9YRFBiNCtPT3BjOVNaVnlTT09hKzFvbWxR?=
 =?utf-8?B?czB0SmRiSldhS2pqQTlQcHBuK20vR3FZUUN2U1ZtcWd5SktOVUxheE5TQnpU?=
 =?utf-8?B?eUdiQU1VYnNDdFBIZEE4N0Q3Ui8yekRsQlZiN0tCY0FmZTJtN0hDeTJjTjd4?=
 =?utf-8?B?UmxObVpnM1FWTEZjVC9mSE8wMGgwSktIWnQxZXNERy9EVnZ0QUVhR1JJN1k1?=
 =?utf-8?B?clA4cjRsTkFSd004UEh3eUQzM3FmdDNVM3pUWE5wS3dZRTlnK3ZvRE5SQmp2?=
 =?utf-8?B?bU9QYlJaY1pMV2xsMmFWWlozV0R3b3VPMlMwVVFROHN0QkVteUNUQXR1MmR2?=
 =?utf-8?B?Rm1NdVl1TDQzRmRsTFF3dzdQanpiQitJbnViWTB2RWFsMStmWURiT2E1bDRP?=
 =?utf-8?B?SmZZMkRsVlJNUjhrUDUxaTIxNk1wSVFaL00rbFJCK1NyOEI3eDRUQk95Wm1O?=
 =?utf-8?B?YXZzazBBZlB2NWswR3pzZnZmYWFWNTZUU2NkYlJHL01hN0dZY0VjcWpFYk96?=
 =?utf-8?B?WTdSbERTL2lOMEFKckpxWStZSVhpWXhONXpFbzd5cFhXR1dQb1Zlbys4ekV3?=
 =?utf-8?B?enZPblN1ekxoSHhDdTdlWmNVZ1RIVkI0NzVHS3gzL2NpMlNBSG4rZktmQlk4?=
 =?utf-8?B?Qm5UOWJuZ0pVUStBcHM2Rk1IbTltWlBCZ3lKL20zdW1yeng0Qk1TUXE1Y3E2?=
 =?utf-8?B?amNabUp6TGdleXBYWURudjZrUU9iVkprNXJZNFk3NnpCT25Id0txZDdZQVRP?=
 =?utf-8?B?T3ZQSGdkeGVYVXA1clgwWjg1YVJ5ODcvYXU5MjIzclJGOHRkQWFTOGFFT2tE?=
 =?utf-8?B?aGhRWlhjM2pZNHZYdmZoRTZmWkdPRDZMT3FzOW5ZTWJXSWV1QjdlZW1XQTNl?=
 =?utf-8?B?aDZmRlF0MjhBQUU5cjBVak1mVGUwZzJGbVRIcDV1b3dCSmRNeU04NVU3Nmtv?=
 =?utf-8?B?TndBU3U2QS9yOU4wZHNFVHBEdndSV2x3UXlFQU5KSW1ieE9mTW9FWXNiY0ZW?=
 =?utf-8?B?ZWN6ZWlOZXQ2a3FuZEJ6WW5CakVzVHhXYjV3UW1ySCtlKy9paWNteEZJT211?=
 =?utf-8?B?VjdURGM2RXJ2dXZKbVNNSFljNm5icEM3TnBRSUxQUit1aEVLYm9Mb2F0OFZW?=
 =?utf-8?B?TzdBeENnU3RZMUhDT0lyVHFvWU1TMnhiVGFUN2x0d3ZFNitXcnB0WmpNRmJk?=
 =?utf-8?B?L25uTXBHWjczWjNpcTV0ZXMwajJMTkpDRklDY0N3L1F1TVVWemQxKzVtdVVj?=
 =?utf-8?B?Z3lxaHUrNVN5N296VCtGcldrT3p5RmdTQVM3SDIxd2Q4QWthMVorengxRnZ6?=
 =?utf-8?B?bmVRNkpUeURoSVBFZEphYnc3bjVHNHE4NDlTU3l3cm5aME9XWjJCZ0RQWmVs?=
 =?utf-8?B?NGVMcXJFUmpMcE05VFN4SENNMFhmbzRNM29lSEgwYjZSdTh3bTY0cmVtMTVT?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a252fd67-1eb0-45ca-7837-08dbe5123b85
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:04:27.6112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhFIfxV5NOe6C3YZTnxkgSqa5B3JtEfj/0TKHLv19ZUhHpwv6+Zkl4MVd/uQ8St3/BdM2E5M3J2LrQKLr+yNoHQzVKHaZqgUOMuke0kDESE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 19/20] drm/xe/guc: Move GuC power control init
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

