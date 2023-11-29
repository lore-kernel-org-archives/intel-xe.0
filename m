Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CA3C10DC1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EE010E69B;
	Wed, 29 Nov 2023 22:36:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C6710E699
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297389; x=1732833389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zjukaVqO8Xg4O1/vU9xtr+d0MYY8fFCUL5ADLIqqgEw=;
 b=Zipp56csXK6GIDpRp3PujM8Q+ARa8fNAqIjWz/phvnIdGMb7OjQzjrVz
 aT+qZ1Px5jzQLmFFyt4acnDBy4Pn9Bubk3zO2wM4oJl/SBIwj4cj5QKA2
 2jGvEqok+8yc10VnTP/WDjn7eNW9UkUNsyrIr6Qbx1NG1fVMVq/C25rwH
 ju550uoLOkxi9msIKNNgNsK8JN3boSA77rlSUJS8HP/XcxWpqqRUCe9tn
 prvZYG5CP0ysA9s4QEPrijnlMgeI9a4T3R+JL6NmaWg3iCxv54VpfGuWo
 j4RNh8e+1OsRlRuSUAGSbs2RDxgzcEnGMjosAGjg2IsVFBjYiL/Nik4Fu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420224"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420224"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718892177"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718892177"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:28 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hySxgK9bYHSPM3kkqlVxpK8DvxFxbJuWsBZZc1zflRnjD10QVOalyRy4jEyntWy6v8CEmv7XkXMCl4po9hDF+/bSvnGo3PVMakW81GXl8qmmo1yhGQ4MHyrzIA8l/wzeaQJsUPpwt1pIJ8hoZP8xEtLTd1TG0il1X7oLkv8bqNBxEaszfXiahYvV0NwbIkvc1EHqdjCKFmVevHUrlUPCn1kRNrhsO6WdTHPcUyRVrVKRrMYZsR30wu0KSlgpJsIH/ATwUcz4pBe/GECxjeeYcn5VrrK0og/TMQpuaz8A3VD2200bURYOit++Xlvs8+uA9CqT6hXqFQAZSsGjlMgSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zybGhNN6AX0yrIbvJJ377YqRk2iEWUp7Nqv5P7L/Zpg=;
 b=SJy+iUzI3+ZJgd5v6DWz5JedH1PYfeUhCxeYI6dZ7eoQ3JLPi8UBNrEfyMOG4UzROhX8IcBkL/MK/yMGkzJ40ZIy4cDto3V7JgDv0bLuJH3QutJk7ByR+0yBvAEcZyB62wrZfWVCa5eF9qizbek252v6XvvK9ZUFxcs8riDXFXiksrMcBVFDF4XNdPrbajYz3XAR7llIsja5PE8NJ64v8yFnvG3Mc1z/+GmH+U+lODtEFbGIBWdck+yqiev41QRmA4fVtDjX72W+I5ENu4WriLo8O5T4Rc7KuWMJlSemsvwslWAIH9+mCXWVqDKcP1kM1zRHzFdCozldxw3zsINZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 22:36:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:25 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:03 +0100
Message-ID: <20231129223508.1189461-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 796db90f-6e10-4d68-505a-08dbf12b9ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TSIZimwtVVwPOfUMW2Jksa9imNyP44ZJ0fszQBAAeFT2X/SddXkmdOXRLjIXbnlytqPEKfgr0UY0eR0tntoAk6ugXvWtLk0oULE9qFsU+q9VkJIzZCK3R6suazr5n6omZnvF/PVaWxgjbBoLoHkizs4ntU8dHnXLL8GQvz14RqH0GoM3+LkHjPXVvguR2SeYCHu8b8O6P/ex9EvhegyXaqM13ySDgFmOO1dJwbzGYwE688HN8u/hiHUmiJBEwWeKi08CFUhWBiSr6sGPcMHHMGm86GkV9ZNeZjDhN+nC219JlCJfaKkZd7OuJ0J0t8/FMEVWr91Q3t3deun6QZ7u59I7Dzj9N2z8OYMn0C8a05eSqZk1qFXNgYx4yl0wV0TetqxpRzJ/2J1XIT79ZJSMdedVyjCMLGhf91H9lifw3y24jFghzrfyqnF0TzAOiYY9e/Ek38RyF/w1l32HhP2g1RxhzG1NQaqEoAesrFTJ0K49dq93uSzr/Co8jN4DToBmUjRGYgl8mOGYrP7AjhCdLeh1UjT1894A1dfvIssXaLukr9rxMolopxKE7/iga23fcy/uYR6oKV6IQlXAU2VH8wz5MmedZR/VvmaMXBgFxK8xBYl6a9mIjjyN70f1MZtA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66556008)(66946007)(316002)(66476007)(6486002)(54906003)(6916009)(6506007)(478600001)(6512007)(82960400001)(36756003)(86362001)(38100700002)(2616005)(4326008)(8676002)(1076003)(8936002)(5660300002)(6666004)(41300700001)(202311291699003)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVJBNXZoajhpenhucElNSytmOGFWSWxUS2Q3R1p3MjhmaXNQdjFIdFIrZHFm?=
 =?utf-8?B?MGMwajNCcm1KcHk5L2YzN3NhczBwUnY1R1RjbGQyUDBPNGgvdUZseU8ySjVU?=
 =?utf-8?B?THpGZnhrZ1JuMExudXJGMmlwWTIzNHU1VDVQamR4RFQ0UEJRYTV0MEtSejNB?=
 =?utf-8?B?cmxXajV6L1dOMENKaHRkYWlHRmhQUU4ya1JQaVNQVHEzVWx2ckRjbmh1a0ww?=
 =?utf-8?B?dUd6dElLUDJyUzUzM1E0eWZzUmloR2NiTytySFhTa1NDbnI1ZW9lMVl6eFdo?=
 =?utf-8?B?WjNBdXlZUEN4MlJaSlZOT2JZWUJ4YnIySWd6UHZUYkJpSUtEaEd4bzIyZW9L?=
 =?utf-8?B?THErak5XeVlDTUFWMDc1OWRzZitpejhkcVZJYkRGSndQOTFERkhUWW1id2c3?=
 =?utf-8?B?NmF1bW1CbTl1RXgzR0o2dzFWWTY0NlNWSHJsb1BEcUtqaVNkWVFES3JQdU05?=
 =?utf-8?B?eFNFbnpFdWdOaS82U1dvY3h6YTFobmQ5ZGpSNWR1M2tvY21VeWcyYU9PRmxh?=
 =?utf-8?B?YjRmb2sra20rVHdHdUR4M1FVeDB4cUNMeTRhbURjTzMyMWNaSmZnVU5lUG1T?=
 =?utf-8?B?YTltVFJKK2Jpd0FsRTE3amVlRklUVnZMZkhPU2VmL2dRV1hBSlJBWEVpVmVs?=
 =?utf-8?B?SUJTKzBwSkRFbE81ejI2SXNsWm9oalMwU3haUEl1YmJheEtCWlBGL3d5UytY?=
 =?utf-8?B?Ky9wSEVFT29XWlBQYkZ0bDBESDlvTXVWMUdyaWRXRk9FNXF1d2FNeXk3Z0NH?=
 =?utf-8?B?RDgzUnk4NDQwZzA4UERPMDFSNkVJdU5BVDFoeDhlWThCU1JOQ3kwYkZTOVV5?=
 =?utf-8?B?Mmp5eGdyRjAwRE9Qc1lUK2ZVNzdQMk9qOUFrSnliUDd0cWpaYm5YaGduQmVE?=
 =?utf-8?B?N0lDcGZybng1eHFLdjhSUElwazJ6M1NrV2hTdUZKSHg2T3VRRFNONFUzSDAw?=
 =?utf-8?B?M0ZERy9BekRtbHNaOWdRK1lQVElyYzZUT1lXdUpxcTdhN1dhd3JsdmRYWGN5?=
 =?utf-8?B?N09MTElWVkRJRlhnSENKOFpYbFFHdk40MHFDajMrNkUvVTlPY3NTcWF4bkJU?=
 =?utf-8?B?azBtSk5SQmloQVJkdXFqZThHSGd4VllpRDcwV2IwQmg0TFNPTWpKN0FFa2cw?=
 =?utf-8?B?RlZXNks0YWxoWWEzamNySXdNem5BcWNtQ29Rb1RkMjhWWDE2TTRIWjFmQlkr?=
 =?utf-8?B?UHBIT1hiYkcvc08yT3BzQk9QODJJQUZSNXdURUt3eGlXMzFxQ0UyVXF3VnR3?=
 =?utf-8?B?NVZJOEpWVnRQZmppV3ZPUkI4U3BmK3QyUUp5a1dBQWg1RGUxd1ZtZHpYQ241?=
 =?utf-8?B?QkEvSzZJa2NPb2diK2FKdTRzT0VBKzlqWTZ6WVZPY1l6TitjOU96ZXZGWWZJ?=
 =?utf-8?B?eHVHL2tjb0xsYXpDK0NaSnlPRERMNkhtUDl0K09oVk03MnV4enQ3d3NtZnhi?=
 =?utf-8?B?WXhoTkJzTWcySzRrRlY0ekVtYWlTVXU5dlBIT2dZUGJNeFpwUDRJYXo1Qnhq?=
 =?utf-8?B?LzB5b3VGa3QrTGRJUStDeTNrRHl2MjkrNzNkYjlxQ0pCb0xSbUhYVG9IWlM2?=
 =?utf-8?B?YjQ0QkMwckFjMndZdWtibnhEaFJadjdYQlEvTW0veXdVckJyZ0ZMS3BTbk1C?=
 =?utf-8?B?NnNORlAxL0Y4cWNROVdxV0VhaXRiWVBVN3p5S1lnVVpOYWIxNkdiOHl3UzIw?=
 =?utf-8?B?Y1lxQU9VMUU2RzM2dVMwbVFUdlNzdG8rMWtRL2QyZ01aYmJmZXFyc1ZuckE0?=
 =?utf-8?B?alFTSlBlRy9uSjFmL1phU0xKSDg3ZEd3K3hPYUZCd2dRRi9UNmZpYWt5VjBQ?=
 =?utf-8?B?WFZkRlF1K01QbnlLWVZpSzlUWEdpck5leWxXaGo0YVZtOGthaG9vNEU1T1B3?=
 =?utf-8?B?UWdzczg2d0cvUmpWTHYzczhYeDlLM0wyWHE1YmpnOWkyV1ROb2tHeW10dW1v?=
 =?utf-8?B?Rm95V3RZZW04ZStlQ0dmRWEybW1GNDNtSUFJU0tSWGprNU5HVnZERk4ySC94?=
 =?utf-8?B?amJzZWRBK1ord1NvYXJxZDdaN3VodndocnB0UDQyVXRyMEJUUnlLRHBJbXRS?=
 =?utf-8?B?ZWF5NmlFWW1ZeEJUOFRQYS9JNFNrR0VEME5FeStHQWZSR3NJSE1uemE0Um9l?=
 =?utf-8?B?UC9sWmFqdEJuVWFUaUZhNEMvYVpZVzR4UHhLQVhLWTBoS3VrWjhmMktzSGd1?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 796db90f-6e10-4d68-505a-08dbf12b9ed2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:25.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPYINxnA/2OL3nclUjV3uKgVvCOUboElv1QplM85AtWTSKIK29/QLlY0cNLKgTOxQvMfLsP7/JHrdGPG4cr3q5a3ZOo/YaA3j0vwRVpPVUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6418
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 18/23] drm/xe/guc: Split GuC params used for
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move params that are not used for initial "hwconfig" load to
"post-hwconfig" phase.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e6f680efb29ef..482cb0df9f15b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -182,6 +182,26 @@ static void guc_init_params(struct xe_guc *guc)
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
@@ -279,6 +299,8 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	guc_init_params_post_hwconfig(guc);
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
-- 
2.43.0

