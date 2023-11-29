Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2956C10DC3
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D4710E69E;
	Wed, 29 Nov 2023 22:36:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2869C10E699
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297381; x=1732833381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fhLdl08U7K1S2z6GqnLTuk+CSEUUuntE1TpyFKwUiPM=;
 b=J+N1LMtuvdu3D3t74fI4EAXz2EzyfpjewpaKoWBu4gpRrjAvFurNC1Rv
 uaYlU1Unj3mcbhvvArvAAutsy91b4TxA7KtdFPMk2CsHBSe67mv25jbmz
 l3rNIWePflPDi5IDO3IRFlhdilIQq7F0fl/Ifx9P1Q39C8ZB+Kj7NJDzs
 Ode90sWwQx/SNl8untp+BzNCMtPc5X9rNoPWQBDs3ZSHZYbVOyHw6kdHi
 gQ4unanPENklPENC8BChCVqZt5I3l/xWExjZjVumdtPTBI1uyIENWTNPC
 zGuZqHhD1OJFCMx5JSgB8Ox52fPapgBjkh+tNj1A5eZHUU0snLMV0sF9c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420202"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420202"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718892118"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718892118"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcxJGYI+zRjV/RBFsyEhJATV0+d7tNy7lDyRlvuO5i5nvUVUSo0dbZDW7/PmiP+uf2UzN5QEkihc0FEuiAyeqOWuVcbuo56Ij3091X+3ru/DM5jCYUMVdq4VuO05o9HYhNK1u4WqbFU6Dh71J6aXxAddZJHPd8k36JP7Dq83jydw6h3er1QHm+cRqzs8mJUU8aCZP3C8l57MBvCx03mEYHtv30Vf3irJWfoxqm0/J0q0Fnh9Pps3F/XrYzo84BC5X3nvm5ThDOQWKu3ZuHYkboPKFbOdYMkUTN8imL5YXgS3UP6sUB2S7JtgCURLpBJ9fQY0cSWjaMmaT8Tzt/voqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LVPCQjFzZCOUjUTlYN2UQnexGQGqdVcfDaTIxzF+EY=;
 b=LA7Aqyc5Xv90WjDiHSKDTk0on/V2ceDFvTyKjjayY+AOihv4WlP4Us9wCB2XTtv36rvnLFydGBHTFQTWr6P/8QQoUK2EtDTc/RZNDDDBqPrsQVfLRuTXgry2DTMoA/Su4paDbAdw/ZCF5rwdbHjXWJkTV9A8Dp0d2IjWGm9v93fInKN54kqBuhRTmw+MGQzcXk11zFW0FkYIMAEAKDxDhxOfM7zMa66uydbikG3IAK0Fj31AdCFQxbGSpgT95rGLDNsdl4E5NhdTpPuT8Jf+OyIPKmxfrTiFbAGf27BpLxI96zSB80CLRzfGl56z/lvJmDHqoNM3CHRSnMb2432PQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:36:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:16 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:00 +0100
Message-ID: <20231129223508.1189461-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 754984ea-f64c-4611-17a5-08dbf12b9989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SoBivHiCsJvsVh9pBAnCMPP+gmxZMyAuKWKxvwz0tTpNvmXVSk3SNDB2EoM34Y2iJiRUrm/6EcQ48zJ6ljpkLNEdynEpRj8+ZFuqmVAvUtobPwmSYVR/oruDdRyTKsUNXGYdStB8+DmhWJfLp6GmMB7GpA1Tg6VM1w0gDHmbTKx3Mw44/b1z0PsJHqQYU4JgLAIUf7K1sAspVdyrT2RAWGoufeg8vmiehsbKdFJHEf/4bgWrsnEbc5UNZj2grnnxwqwao+HCaSCXVVFLYqAIy78kQtqLDJGfKWhefgybqZC2FT9lkkEhrEKD60JbKGvZZdWzxERgA7rbfjoOXB5pNVGg8HrVDT8e6Xvjs0Uxw6/flq5U4FJ+nPo+XaPFkz2vSW5xGm2zfCUZYLDJauIRonicjBNN/PAHwo3Uk34Ne7OKvVJ9+duxwAzqyWH2hE7lDGaCFgqsl+2PttU36FPAQa0Z+GtkYCkjSU2/vdzXkJsfFt4jeAXMN0oYCuAi9NfElo4QsHKh/jSbn6MzbNjv71HFi9K5Tg/YwI6YY+DpAVQN6NRIl2qtdzSvQLYwMshV6+xAuh+PCE73Md6LjI+rOgy5iihepGjVGXYedKXrt1PnfWd0r6JRGQaosvGVCuc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(2616005)(26005)(6486002)(1076003)(6666004)(6512007)(6506007)(82960400001)(38100700002)(202311291699003)(36756003)(86362001)(5660300002)(54906003)(66946007)(66556008)(66476007)(6916009)(41300700001)(2906002)(83380400001)(8676002)(4326008)(8936002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wnkya1lhaVl6MHEraDBEbWFPUjhhblo1amxDTzlMV08zdzZLaFI5bzVQYmpR?=
 =?utf-8?B?ZzRjRzRBRDdUWG1VejBpdFVFN1hXNklmUmxnZ09IN213UFFMd3lrUitmLzZq?=
 =?utf-8?B?em9XTVJvYzdoZnFjVFUzZnY2cjRMZmVXUGE2K0dCemFWZzJGME01bFZkVXpH?=
 =?utf-8?B?VlhiaXNNSHBpaDJPZ0xvTi9GU2xQUUk2bVo1dUxBS2JDMzloNjgzM2RTUkJk?=
 =?utf-8?B?VExPRDJyUDJVQnc2S1RueGU4RW5TbTNMN1pFc0RnTzZLeEZ0dnRYS2V5TCtR?=
 =?utf-8?B?SnE4ODR5UmlEckxHdlZoMjAzN20yaWVTVkU1bzJKM2JYV2cvOU1kQ1FGdkh2?=
 =?utf-8?B?UGFLWUJodDJidkNGZ3RySkdZSWNsZVJCQzdZZk5ad1ltR1lQZG5aenJ4bFhj?=
 =?utf-8?B?VHhDQkNzZlduR1dBYzZ5c3ZPSnR4N01lbkRQVHR5T1dZNVZlRU1FUGxMRDBC?=
 =?utf-8?B?VmtiZVZsNjJvWjBxbFV0MHZDWEpwNVVjdEdRZFJDVTBPU3Q4a05RRzRWMXJR?=
 =?utf-8?B?R2pockRFaEE1MzJQQjROTUtYNlBvb242a3NYd0lFR1ZSem1FTkNpdm14Y1Zj?=
 =?utf-8?B?WEpUMW4xTjBGOG1ZWTArRG5JVzRxRFFGcWpJZUc0aTFXTk9tODdnOU9MenJ6?=
 =?utf-8?B?aG5yWHVrTG1DMHUzTGVqdTYvWWFtZmxaR0lSR2ZJdG5abHRJYVRFek8zb1Iz?=
 =?utf-8?B?Nk5BVS9tMVQ1RHV2SXRnSzgzbXFDY3luaHV0OTJqYUtacFdhREkxZmpEVEtv?=
 =?utf-8?B?QVdiSTQ2M1NYckk1QVFob3NqK2ZWRzJQNXBoTHFndytFOGFNTmptaGQ1Qk5h?=
 =?utf-8?B?aDRaOVZaSUxTT3hBNk5NSWNBaGtmanQ0ZGZRc1NmOTMrR2oxWW02L2UrT2Iw?=
 =?utf-8?B?Slo4ZVUrUFduSFE2SEloN2hiVXZ2aHdZVVJRUzFENnViU2YrWDh2YmxORDVu?=
 =?utf-8?B?WXBXVm91YXF1anJJK0Rlblp6QStrVkhiMHJVSWRMWUNOZzZOSDFIOW5IMm5W?=
 =?utf-8?B?OVRTNmh1SjdXRWtNdGp6WEJ4Rm1UYmZkaTRWQ0p1WDFUNmRsNldrUzBrdzU4?=
 =?utf-8?B?L0k4cDhRUTUwTHk2YXFxcTJXRFFFclZrWjY1M0hZSVdMVllHdGJGTWRHdlp6?=
 =?utf-8?B?VGpYTWlDRm1LdVozdzQrTTVQVjhQaDRORjlpbUpycnprR2pKL3pvL2lBL2hp?=
 =?utf-8?B?S2VBeVNmaXpCWWZFUnJ6ZWlkSDFBc1R4S2QzaitSNHFEOCtLY2QyQmE1cTEx?=
 =?utf-8?B?OURDdlljSFl4YzJZdTNhZjRNTkpERW1QeWpiNUMvMzdUblM3MGhlMWxHcnBE?=
 =?utf-8?B?M0JXRE9ZdFQyelZ0Nkg3dWNpN2VnYURpd0RIaXNnSW13Ymd6OUhveWtYSUda?=
 =?utf-8?B?VU55RnFHdVpNUEt3VGJVajYvQWx3R3hqM01EWkcrSlkzdXlyL09GOURxRlUv?=
 =?utf-8?B?eTg0UDlYejBSVHNvT2ErRXBFTkZlSjNoUHd0MkpxWnFXNGxKN1FpdnpucVlG?=
 =?utf-8?B?NzQveGRaVFVrMVhYZ3NtcVRMODdYVHJRaitySkdoMVZsMGtTZmd5a0wwaTV5?=
 =?utf-8?B?azBEbks0d1pLdlFPSjlieU40QUR2Y1BGeloxMkpGeHExMmV6TDFmU0tXd21k?=
 =?utf-8?B?cDNhaHJnL3pBalR6U0NHZGZhcGlONENyYnUvYjJBWWNoQlVXY2dZRlF4RzBM?=
 =?utf-8?B?bjc0M1dvR1QyR29yMTM3K081c0gvNkQwdm95VkZ3Tm1tWHNBRVFSN0lWdU5h?=
 =?utf-8?B?NzFSS2xJcTZPTHo4cGJ4Y0o1MTZHYkdqNW1MTi81YW90eW9mN09vYnpySzhI?=
 =?utf-8?B?dFNrZ1JDVVVPdDF6SEJBMExvdGF2QS9HMXZtZUFiZ3pjRExqTEcwUTJFRnVy?=
 =?utf-8?B?TnRmWlpZei9qZFkwampYYzlxQW4zeGVwOGRRRDYzOUJIbitHRDNpb3pYbzRN?=
 =?utf-8?B?eG9PSHpielhhcExYM2EzUlNENThITXdqZzFCQkNTaU0yS1pzQ1FKZWc0UHVF?=
 =?utf-8?B?NW5leHJ6ZEc5bEYwQlhLTGU2ajJ5bG13dGNGMDhaZC8vMlhORG11ZUFxazBN?=
 =?utf-8?B?Wndrb1hoOU0ySHZsOHc3TFU3VldybDVYRlpjbGZRRTArMFAwNkxuTGNpUTJL?=
 =?utf-8?B?a1RiS28wSGd4U3JlbTVIVTY5Q1dVa1dPaFBZbTJKSCtOOUJUOXlvNkErMzZG?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 754984ea-f64c-4611-17a5-08dbf12b9989
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:16.5923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqWM7oU7gcytEUHSi1YTflWCUDK1/V3X95jZPJObUOn30wDONAUGzPpQ+psKQHl51jJYrhmX7FOrcu/zvAxryjQ4YOcTw3OGXWbW5ELyEIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 15/23] drm/xe/uc: Split xe_uc_fw_init
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

The function does a driver specific "request firmware" step that
includes validating the input, followed by wrapping the firmware binary
into a buffer object. Split it into smaller parts.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 80 ++++++++++++++++++++++++++---------
 1 file changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 8ad4bcabb8b5e..f258eb44fe31c 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -635,15 +635,12 @@ do { \
 			  ver_->major, ver_->minor, ver_->patch); \
 } while (0)
 
-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
-	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	struct xe_tile *tile = gt_to_tile(gt);
 	struct device *dev = xe->drm.dev;
 	struct drm_printer p = drm_info_printer(dev);
 	const struct firmware *fw = NULL;
-	struct xe_bo *obj;
 	int err;
 
 	/*
@@ -691,9 +688,39 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 			goto fail;
 	}
 
-	obj = xe_managed_bo_create_from_data(xe, tile, fw->data, fw->size,
-					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					     XE_BO_CREATE_GGTT_BIT);
+	*firmware_p = fw;
+
+	return 0;
+
+fail:
+	xe_uc_fw_change_status(uc_fw, err == -ENOENT ?
+			       XE_UC_FIRMWARE_MISSING :
+			       XE_UC_FIRMWARE_ERROR);
+
+	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
+		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
+	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
+		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
+
+	release_firmware(fw);		/* OK even if fw is NULL */
+
+	return err;
+}
+
+static void uc_fw_release(const struct firmware *fw)
+{
+	release_firmware(fw);
+}
+
+static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32 flags)
+{
+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_bo *obj;
+	int err;
+
+	obj = xe_managed_bo_create_from_data(xe, tile, data, size, flags);
 	if (IS_ERR(obj)) {
 		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
 			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
@@ -702,28 +729,43 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	}
 
 	uc_fw->bo = obj;
-	uc_fw->size = fw->size;
-	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_AVAILABLE);
+	uc_fw->size = size;
 
-	release_firmware(fw);
+	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_AVAILABLE);
 
 	err = drmm_add_action_or_reset(&xe->drm, uc_fw_fini, uc_fw);
 	if (err)
-		return err;
+		goto fail;
 
 	return 0;
 
 fail:
-	xe_uc_fw_change_status(uc_fw, err == -ENOENT ?
-			       XE_UC_FIRMWARE_MISSING :
-			       XE_UC_FIRMWARE_ERROR);
-
-	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
+	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_ERROR);
+	drm_notice(&xe->drm, "%s firmware %s: copy failed with error %d\n",
 		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
-	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
-		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
 
-	release_firmware(fw);		/* OK even if fw is NULL */
+	return err;
+}
+
+int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+{
+	const struct firmware *fw = NULL;
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_tile *tile = gt_to_tile(gt);
+	int err;
+
+	err = uc_fw_request(uc_fw, &fw);
+	if (err)
+		return err;
+
+	/* no error and no firmware means nothing to copy */
+	if (!fw)
+		return 0;
+
+	err = uc_fw_copy(uc_fw, fw->data, fw->size,
+			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
+
+	uc_fw_release(fw);
 
 	return err;
 }
-- 
2.43.0

