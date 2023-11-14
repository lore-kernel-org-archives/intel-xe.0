Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74F4C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CECF10E440;
	Tue, 14 Nov 2023 11:45:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25B610E440
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962357; x=1731498357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=c4rbseYvg4yas3Gp1tyCzZZUXD9eR8JPRlQs9all9cA=;
 b=ewyte12UoLIszEVMiQvHg+y5XV4OnJXAB8VHW+Ql+oZh1LgmRW9F9YOU
 pB55ylOWUev58n6yJldP/BKs2cA0EK9H/zdgIex4xMHJW+H2kneny7zFJ
 AyjnAH736ub3guy0cRYk2HPsomZ21+fJU3MOeX9KSpY1gRIa6HjmBBnQC
 hs+16ufblt3sP2JiWiGuLSKyP3URqJoOrI8+sfaMlOH5EA3H1EInj40Uq
 uxlnhzo8+boyQz8fEWKsDMIMp+XnYIZhHt56goRO9XF9SbRssAeLCjyUD
 ZP/p7Bgak5ao2xmhB+MNySKonpAH8pkWJy4c9rq24S7/Z5WOnsN7olumc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9276917"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9276917"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011888230"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="1011888230"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMd7Z2tv1gxP9azRKmmtjpkPaE7llLbltFwemA93+aP2XXIil4I9wCCyHD+VXVpgric54OXfXZSgW50r3Kk3HKnY/f8QGe8xUja7R9WbHVBPj2pvpWoZQLo7pdqyynh3ntDkIhj1DxT3nqqkBoYMT79tnb132dBKv6p4lyv2StY7HW4gSZyFeti9o4NkogzcxXwCHhM7Q2KWOczvlvD5CCUCelXmwQe/0AwSYvBO2h/eXWVfXErpxXuFqJEl8h+Po1IErS3AcCPlQfmKLfXjPZsohw26RwzUPuZz2vh8GMN4Kw1BpvHMCHXbf5b0IFTQp4c4MDi3NEuVbW1lYLmnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=306hIttgX9HP0Zy04aNg6j/D0+fVGlacFmn6/O0QQiw=;
 b=ixFWZvvTi1GCk8Ec7lJRcAZyCLYhe/0sH6DXaZPHg81b6fqK8yl4hHfU0ULtP8T6d9HJE3XSvV6SUWtE2Fvicu9Qb42xjzxT2AgdHdxfEKrUu0RFDU2/RirdV0hlSXJ3JqrxR6H3pdmwIyd7pUJ9VitiOlvTnDozKmi0JNGC0FMhG/77SsB9KAzCAvwXDlzBuXWhnl46SHQrL6tnr7RrTeEpOxdY/sem2LlGPtD9olTyBU3ZIaxgJ7IEhD/TLP4JN4f2Z3mmwd4oYVEaYb+KpYNsk3ZLXiudd2dLx9sbLHh9opUg+Dc1AmC4P3UqYaFHwn5bGyy5Q42Loaq7oD/1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5563.namprd11.prod.outlook.com (2603:10b6:610:d6::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.17; Tue, 14 Nov 2023 11:45:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:53 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:44:03 +0100
Message-ID: <20231114114405.2207747-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH0PR11MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e98fcae-636c-4d72-2463-08dbe50741dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CLJgVKw12dJxUpnJ+i9GLm7QRmdQ5Wm/WGRRpD2yiK4GCuXAOBp3MjoDLGeYAbkgCRFPwwA5jfSduLwGWVFOGZ7K9cIenD1MqUITtWoywdxvGyoUuLtLc1zZ++MJMnIWHzO8pxtxQ3gnurY+ZK3qj7tY386GbD9zw66docD3XmtID4DJhzoDq5z+Fk4L5DJ9T6U2swCGul0G6hX7yL3zqIb+RifteF8b3+SQy5n8rh0b78QJcL0hH0HszqXw8R4qbtMfkuGQEMNgsM2oBBb86DzxR4978C51kded/tWDnXR2DxvlbOpMC+z+mrmBevXrLIOtTlsAud0DxrYK6snaNTBPzCm6qKXxEQTscAGaZA9q7BFkf7RVyz1rPaI4tZgWtfh60r8T1L84n7k434YKcBQ+1TG32lBE+hfZknpSKh7AdfnLH/T5+j19ozqJYF0UDcYN9tZY1LYGiclLdzoOTRTQnWcG0EzfnrTfBsAk79j50hMhwcJYycqBo6v7i9vyyb7DAgS8hI+V58PCihMpADe7CI7zzJX6nJhxpuvbHVhrSWqw+S5/nwkmOzLMSk2p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(1076003)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(86362001)(36756003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW1zbFNaM3Q2SCs3RUhLWDZhbGRFYlZJdlptTHhzckp4ZnkyVGFRYXNKUEtV?=
 =?utf-8?B?bkpTQ0IwSzA1RGVycUZicTc0YmgyQ2xiV1llZWlpSld1Y0ZiczNpRWtTaXps?=
 =?utf-8?B?RXlOQXhWT212NzRwQ0F1VmdrMjJ4aU1TU1p4SmhFQjNwbXk0eFhrWDl1elBh?=
 =?utf-8?B?YTR2aTBhNFpISFRaZzg1cXROMG1Sb21jWTFQTythVjZNZFdIQ25UOUtxRmhQ?=
 =?utf-8?B?QW9VTTBZVUViSysrU2NoT0NsdGErNFcxMzFoNHhFa0V1Qlc3MGNuNmdMclVo?=
 =?utf-8?B?OE83QUM3NkJkNU1MZ2RHRy9uajRTcU90eDZzaVJkRE9lREhzWUFTeE1jQlBE?=
 =?utf-8?B?aFB4QVBtMmxjbTFDMVhnODd0SVhaTEgvQmFkRnplOGR0SElBTGVlKy9oaUpn?=
 =?utf-8?B?SURUbG4wWlAza1RDc2RkcjE5SFJoM0tjVUljMHJuZGlWV2o2MFdrbXBUSFBx?=
 =?utf-8?B?b1R4YldsN2h5dVJZWEU4cm5ZcFduZ052dUtmSzZHWVZwNUhiMi82c1dJNi8z?=
 =?utf-8?B?UStlZEM0a2tDekJDUnVwOVg2bnQ3VmlENStrclBwOGJPMlN3RTFlTVVObjlH?=
 =?utf-8?B?ajNZSnBOVi8xT205NEVuYklqZ3UvdHpMSTlhTGliTGxDbWtHL1BwdGE2cVpD?=
 =?utf-8?B?MEdMbmQ5bzRxUzBFUVFrM0RGTG03V2hmRXFpYWptSytUclUyNE54aDVVUjdj?=
 =?utf-8?B?SGQzM29HbmdPOWE2OUlISjdUWVNVZHFneWNwclR2Yi9ydUloSzhydjV6UzEr?=
 =?utf-8?B?WGtBSnptVE5JUTVCc3FYOG5KYnlMc1JmajZLZEdudHFUWVVhU2N1dituRVZY?=
 =?utf-8?B?d1JMcnVvQUt3STFoc2t4bEVDUURMei9NUDEyekRoRW9WSVZkc2ErVzB1RHlM?=
 =?utf-8?B?YUF6Sk1rSW1yRWtPS29pZTNnUTdGRVliR1pTWnpIaVQ5TzBuTzEvYjhrWEx6?=
 =?utf-8?B?TzljZ1hvWE9zM0czVWcycUVwTkFCR09NYm5OZk8wTHdIOCszbm9Bc0tHQlp2?=
 =?utf-8?B?cEpRVWIwVit0Z2NvM1lGTklqaVUya2NmczhhMTBxVzVEWWozS2wxbHlsbmV0?=
 =?utf-8?B?R3pxSmJTUFU0YW4vekpSdXZHdWJrL0R1Y2NDVTR3QjJxVVByZHZUOFJHZTE4?=
 =?utf-8?B?TnQvVDV1ODlsL012QTBMK0xYN0Q4bnA2OTYzWmVNbEMzcFdZMy96OXQ5SnBD?=
 =?utf-8?B?cWJ1SHJWMW9ob3lBL0N3TklodWVha1pjckxSQ3RVV1N5bDJnemtTMjRZcWFJ?=
 =?utf-8?B?YUNKWG50SC94cythMW5JUklLR0ZxSENIUjBXM1NScmdjdklEQThzWWRGNUdJ?=
 =?utf-8?B?MnFKVmlNdUlzZ3p4eFluQlBhWG9DdFZIVjJwVEo3V3dzUEt4OVNDVGFJdUNE?=
 =?utf-8?B?V3V5RWxNam9ZVFlYQ2JpZEdialRaKzhRTjQ0NkNSdmhhWWJSaWdVdStwOE1t?=
 =?utf-8?B?bDNKbXl3TmhDS0RMNjBvcldXMEhmV2lHZC9oR3M2aEoyKzVJMHpsTGQ2VWxN?=
 =?utf-8?B?RGlHUW9ObE13UHJEeS96akRpb1FaRnNxQi9RSFZFUWN1QitpTEFOOTBMc3Y1?=
 =?utf-8?B?b3VScnJNNGk1RFZBRkVGUXpJTDI1ekJhVFVhQk9QSkNRV2ord2dSaHpsOWZp?=
 =?utf-8?B?VStOaGt4UW12Q3R1SGZ2Q2o2UzVjMC9rckc0M1JOZGtZSS8wbkVTNGFUMTJW?=
 =?utf-8?B?QUJUVEdMOE9BUlBMWEtySEdkOTYzLzJOOStNT2Rxb1hCbkVybEZvVTVWSGNK?=
 =?utf-8?B?T3ZKM1VwM1lrcXZZMjRjdTZEK2dQV3BpOW1oV2RhLzZoZjZuOEJpajhyNVBN?=
 =?utf-8?B?MmlWRXA0YkZ3N01OTXJTWm5qVUVrNXV1RUhaWTRZdk9YOUJza1YySkxvOE05?=
 =?utf-8?B?SU5VdEZqeE1SWm9SQXlJRmt4MURRYlhaZk16VXMzVlF4cXVlNEhOM1dQUDlD?=
 =?utf-8?B?c1htaXBxcTNJOWlHa3lERVMxdkRhVUxiMjRGTUJlZTNFZzlYTnFla0JQYndo?=
 =?utf-8?B?QVNNeFVrYWhiejRuTUZNOXhoZWFIRjlFYVZCOTkwWGIvZmZWMUNhUmw2aEZU?=
 =?utf-8?B?MVRONGRqanpydmhsdS9vekxYZ0VYNERmOWJrdXhRTXBONDBmanFzaG5EcXFn?=
 =?utf-8?B?aThtR1JRY0tBamFKcnpwK2hvM0xjNTFGVU1ReHJEbGRuMDlKd04yZHBXenRX?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e98fcae-636c-4d72-2463-08dbe50741dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:53.6714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrAEkQy6YJJ+0b2nGZzV7Ur8hn6NxMItlhwNOlz8i8d3XXSBSM5VgXWXKyEdEr0NGZRsqLvSn5lhf9sQOFgGX9QRPAXtzI5t5VcT5h7xQk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5563
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 18/20] drm/xe/guc: Allocate GuC data
 structures in system memory for initial load
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

GuC load will need to happen at an earlier point in probe, where local
memory is not yet available. Use system memory for GuC data structures
used for initial "hwconfig" load, and realloc at a later,
"post-hwconfig" load, when local memory is available.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c     | 45 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c  |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
 4 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d1181ddf4bdae..3f430d5bc1051 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -251,6 +251,45 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
 
+static int __guc_bo_reinit(struct xe_guc *guc, struct xe_bo **src)
+{
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_bo *bo;
+
+	bo = xe_bo_create_from_data(xe, tile, &(*src)->vmap.vaddr, (*src)->size, ttm_bo_type_kernel,
+				    XE_BO_CREATE_VRAM_IF_DGFX(tile));
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	xchg(src, bo);
+	xe_bo_unpin_map_no_vm(bo);
+
+	return 0;
+}
+
+static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
+{
+	int ret;
+
+	if (!IS_DGFX(guc_to_xe(guc)))
+		return 0;
+
+	ret = __guc_bo_reinit(guc, &guc->log.bo);
+	if (ret)
+		return ret;
+
+	ret = __guc_bo_reinit(guc, &guc->ads.bo);
+	if (ret)
+		return ret;
+
+	ret = __guc_bo_reinit(guc, &guc->ct.bo);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -309,6 +348,12 @@ int xe_guc_init(struct xe_guc *guc)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	int ret;
+
+	ret = xe_guc_realloc_post_hwconfig(guc);
+	if (ret)
+		return ret;
+
 	guc_init_params_post_hwconfig(guc);
 
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 88789826e7817..88514d09303d0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -282,7 +282,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
 				  MAX_GOLDEN_LRC_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+				  XE_BO_CREATE_SYSTEM_BIT |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a84e111bb36ad..8f190cc0e5527 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -148,7 +148,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+				  XE_BO_CREATE_SYSTEM_BIT |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 45c60a9c631c3..6334311a56e63 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -93,7 +93,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+				  XE_BO_CREATE_SYSTEM_BIT |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
-- 
2.42.1

