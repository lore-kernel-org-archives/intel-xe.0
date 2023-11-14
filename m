Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ED9C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ABD10E0E5;
	Tue, 14 Nov 2023 13:04:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8400910E1B5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967062; x=1731503062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pXaTziMeON+JOB3K2LYqkkDfzbLW0eAL8ZODDW1IkG4=;
 b=HNpqd89SQ63SmE/pvcU7LX6ebtrWPlx+fFAoy/vcuqZ0muMKPetxDXt3
 SvvRu1IeWovX8PqLTg5GVoDJz+tMkggZbtHX1UhSnVDCR78I/1A64tgxY
 7UHYBJWvk+QxEM1zVx8h9flo2C0yRAdgPL/pkNsG6bsYtVYsYzhivT4B2
 GIRUtchml3sDgUVTQKKmNx8F/S9H+k0Ezr8xmp0gmnZp26e/exC4mQKG6
 1N2PBa4YicI9Egy4dWk25h1jlUNID/ensv+e0JwhMdeUVIT/Fv34PsnHP
 Y34pAcmGHXp8adUNXexYre8u/NckRTbv2ESxesSaIDzGuFOZba6Iok8Z0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="389507636"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="389507636"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="768239971"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="768239971"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:21 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaacKKqXfDrUADgjPEGd81GT2zA1QA/ppStyhXC8I3E2k4XDBV7Zpo9L73USdzowQHEqddiSFCRb8ScEL5wnEw9j2zLRNIAEB5xwFB7QiRJLZdXx904wFveHkcxAJBPJ3Juj0NIsfHcg01SMeyVHDzyg2k8vw+r0/KB1f9AgBDVP1Zr5PZLTu5ww+YSXdh8fH7UfdQOYfN9wftUI4xfQwkOC29JAiXlXQ/EyL6HOX1qiT4ZOIBb3DZoUekY51j85qOSzFmiXS7JZ+yZSSgQ9QH3qMvcS/9jX9uz/7vxmIqKprBOH1beVAN+Gd9j97CxWX9unKlNNQLlBq5zmCHSPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI77XWZV29r6RPLZKOmW+rCm18XXYp6I8+YQvkK8AKo=;
 b=leN+Fy+Kj42UlyEdY97h7LAxYAgaE1U7eIglIC8lkelT+xqW0g9TySVQXJ7ITj+cZIYDv2X4e7QQ6pTuOBQXFaShFBDklNXMSXUYAIkW/ke3osG3Jn9ND/mG5eGwKgaFbJxjrmq/DsD7KnZqwJeIUcO3fuvFLdPlX/RZYu7va4zYecv4maRFtiGKzZi5yu0vxOcmktTa8wu7kIACf/QuPubfUcDxsWQQ5St9BV8juvYMD6cMlMF4XFJoIxw3+eqaF7trGR8ovlNkkdWwAncG1kQHRIHyP5SozSYAcNZbwHQ0DimdAH9oPSPk85DfM19DtLbvOILlYjChcVQiJkXbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:04:19 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:04:18 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:28 +0100
Message-ID: <20231114130231.2299661-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: e4289cfe-1932-4feb-2669-08dbe512365a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ec8rD33L3l8GM+8ZzRaaPnnr0N3fJAsJx4RRLwefHygKMOwgWLLWMFxeNPgCMiBhWkXKQwo7LBZ2myLqOwOnc1/7Y9KELP54OWVFotB56AZxcjnVnx7nTIzEzQouQ2bNWfByz8HWUG17J4IpMYVnZ4k8JmJiJspU4rnaq6E+yAc6f2+M6asCUxcliXD7exbDoY+DkM6aBTBo+Y588k9+RcUS/nrLzJgMEa6IPfat7MHIB5IsKv0m2CVG+02wfdf2GCxek5HKm6jX+stO01Ldu1afbZ1B21HNkyH2cDKXK9HgTep5rwO1eSa/98qhDBKzAvSG74GhmpX8BPfulV3rW/SLgDoy85nu1q0TkWYRbASHego99OThO7+mcxTunNIXf9xbG1UEGRMVieRiPyvZj36/OmY1R6E4map/+rtP3EPtekridzdpWOp5VHri+aKsziVptQYQm35uLfDFazZ1KBzIu50S4FxnmOR8z+vsfqHjlVR+2a3zb5LY1d20cm9degwZabQanyxmxD5aIPvUbrO0T8kZPgXdNd+Uv5xZOHDdmXPpE5FCwUASXcTkiVaY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(82960400001)(38100700002)(86362001)(5660300002)(2616005)(6512007)(6506007)(478600001)(6486002)(36756003)(6666004)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VExveTVzNUhpdTNWdzVJRGxlU2hER1RkZzVlTi8vS0NkVDBhUkxaY2wxUEtW?=
 =?utf-8?B?YUVWNUhteEp6RG5DTmRVNktMOUZKQk81VWVPZVlUNnFrQ3NoSU0yQlcwVGs0?=
 =?utf-8?B?cFdzcGEzUE5TME9NZVdKNXJ2TmdjbGxveDJ3M2lIK1dlZlJCSUc0SjJQdTVL?=
 =?utf-8?B?MDdzRE1Wb3VYN0tZa0pUTWozb2hGN1owN3NZWTdib0lkQzNKY0V4c2ZnbG11?=
 =?utf-8?B?c0lVL3N6VDhHSEc3YlY3WHArcis1aHBzMlpCQjlZaU5EMVc5blBrWGdOWXhB?=
 =?utf-8?B?YWhwSjNNNWQyTmhaa05aS1lpNk5kOTYxd0lVUFJWUUlTaklFb2lReStaUXhO?=
 =?utf-8?B?OEE2NEFQSkhGeTg0TS9GZkhKZW4vdlB2YWR0a0FkaWQzeGFDeFpoMFJIMjRa?=
 =?utf-8?B?Y3N1S2RVeEVITGZCeVQ2U3FUcjNvVWR5bUExNUN0OTJVRHpydXVxUVlZdjcr?=
 =?utf-8?B?YUd2MUY3Z0NHZSt3RkxZckxwZnQxaUdtenNOaHFyeTFmK3VReTZSbkhJbmJx?=
 =?utf-8?B?MU1GT2NaNmFUNGkybzl4YTlZTkowT0twWHhyYUNIcDFGdFNndml4SjhJRHRR?=
 =?utf-8?B?Z2VobExzeDZPeHBsd2JvQmpIYXVycHN6S3NsYWd1VjQ0YVpkck44Z2ZyeTlD?=
 =?utf-8?B?RWt3NWZRTnZWWHlLWE9ucW9KY3BkUFNqSmxMVTkyYk9seDdDVWFyWXlMOHhu?=
 =?utf-8?B?TFRwdmcwTHRDS0NHcEtwWXh0eGNvS1dMMHhGc2NWNEw2bS9iK2VpdXVuM2sv?=
 =?utf-8?B?TjdXTVUxWjVGdlo4ek5FaWcySG1sby9hRUhPYmk1NEZ3UHF5YzI5RE5UWG1Z?=
 =?utf-8?B?SXBHdkV0K3d6TXZ5STYwdTZCMCtNTWlUa0xrSk5kK0lid2VEN244ajNpbjJw?=
 =?utf-8?B?Y1piQUtVOXRMZ25IQVY0NEFCVUJPNHpMcUJCWFhZbnIwN04yRDZjQnN2OWhz?=
 =?utf-8?B?NHBvbDhMQXAvVHM5SG5LSExYcFp3QzJoZnhPRnBKeFZzUnlzMS93TFFNeFRq?=
 =?utf-8?B?enFjK0V3aUxPV2swUFFTQWU2MGVNS0RtMWtHR01BUzJ5anRBSTRQb1ZvM0Y0?=
 =?utf-8?B?N0dkaXdBVlV1cXV4MHAzYmxtN3VaVDl4RHBpYzFzQ3YwTVNrdkszQmNGTVlP?=
 =?utf-8?B?b0M1K2pyZ01NWWdLZUExYlphWUExSFREQklha1o0Rk1PU0hQUEVVK0c3aDJF?=
 =?utf-8?B?WjROY09KcVlnMzIxVG02MGt4K2ZQNzZFTnkwbkoyMUphdW1saGtrZnZiTEdw?=
 =?utf-8?B?TURBaHRnQWRmMHR0RWV6K3hqU2FZSFdubXUvVkkxekxWTUNFa3UvV3ZYekZJ?=
 =?utf-8?B?RmxIL3daUFRvN0l0RkdRekdXN2VZYURyTmtqZWhaL2ZiTzBtSU9SUnltSnFK?=
 =?utf-8?B?YkNxM3VTclFYWVo5UzdWZ0FqUzFCY3JFTzJLeTdzdzRTVHhsYStEU0dJZytQ?=
 =?utf-8?B?R1lKMkVOcEVLOEF4cnhFeUtSS3pBUE8xb1oxOUhQSnZPbndONUhaOTR2eEQ3?=
 =?utf-8?B?SElMVWFHL1ZhS0JxL21hY3Rpd1UzaithWGltT0lFSWZBVTI4UzF2Q0xhTjJl?=
 =?utf-8?B?V0ovbVZKbXdlRmhWNCt6bjZlNUFRZG9HZXJRUTJ2TVYxaHYxZHoxZVgyTWxh?=
 =?utf-8?B?b1lpdlA3R0hpZERjNTNpQXJwWEpWR3RoN1dkM28vM1VscE84WS9Ua0xXclp5?=
 =?utf-8?B?UnJjWjhWTHA5enRWaWxLZlZKck9teXdaV3A4QStJWnBvZ1NMNDF2QUpOR0Q0?=
 =?utf-8?B?NXk5NUlnN2I5czNjLzlPUTgvbS9Yd1dwQmhtdXNYYjkybHhhbk43RVhkOEUz?=
 =?utf-8?B?SDZXWE9lcE9YbXVQNEw2VEUxVlV2STVJL1ZST2ptNDMrR0I1Y0wzZ1MyYWkw?=
 =?utf-8?B?M2tRVkErWXhkSTErekpMeGJleEtQQWNMQ1REVGNQU3JtNXB0WllJc01HSHZz?=
 =?utf-8?B?STJ2d0hBVHdpNklXVk5YRFJ4MGliczVxWDhGOTVuOHlMV3Job3I3WG1JbEll?=
 =?utf-8?B?Z1AxWGxQblU0RkhTRkV6T3VVQjh1anNMT1ovdXg4cmNYWnhWYmZ4OFRRdlVs?=
 =?utf-8?B?cFdMWUtWUDZQVUNYMzJiY0Mvbk5yTmJrV3ZWQ0lqbFI0Q1RpZjlKaXV6Vm1U?=
 =?utf-8?B?SXBveW9aZS9SeHBUTzY4VytMUEFpWWVrZi9yL3ZYOHRZNERjY01FVXd2Y1I0?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4289cfe-1932-4feb-2669-08dbe512365a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:04:18.8344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45p78JQYvzvR6HZJ9OeRWjSU2BxIwx91jpiF8dBFMHM0+TAj2CvsbPc3Wn730/xnb7fQiDElfriCkt/FpTEdVBTseCBSwwaP+Te9WDJqLKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 17/20] drm/xe/guc: Split GuC params used for
 "hwconfig" and "post-hwconfig"
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

Move params that are not used for initial "hwconfig" load to
"post-hwconfig" phase.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783b..d1181ddf4bdae 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -192,6 +192,26 @@ static void guc_init_params(struct xe_guc *guc)
 	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
 	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
 
+	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
+	params[GUC_CTL_FEATURE] = 0;
+	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
+	params[GUC_CTL_ADS] = guc_ctl_ads_flags(guc);
+	params[GUC_CTL_WA] = 0;
+	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
+
+	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
+		drm_dbg(&xe->drm, "GuC param[%2d] = 0x%08x\n", i, params[i]);
+}
+
+static void guc_init_params_post_hwconfig(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	u32 *params = guc->params;
+	int i;
+
+	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
+	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
+
 	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
 	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
 	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
@@ -289,6 +309,8 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	guc_init_params_post_hwconfig(guc);
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
-- 
2.42.1

