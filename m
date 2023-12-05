Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA49C10DCE
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C76D10E461;
	Tue,  5 Dec 2023 01:33:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E0D10E461
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740021; x=1733276021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Wup/SocQBelGsmnLdSOr+lTRrJ9iVqQghyxkNHM3wes=;
 b=jg8HNfV8iCCX9pLWLX7JBQWFTYvx5K7lwm9zGW0FYMwQTtVg7iqkjqNW
 Zd+HngwoWsaZvH57MGXEqZ/w/PMdF2YtUGAqnNkWpcrRxmRKDHLIzXJjW
 nycORzT5okPYiihfj+hq6KcpJ4J2btD7hWxW4o4p7XEvKGGU9pkbmiuXg
 PW3aT5zmES5Gp0R9aHzTFQArDZbo8Tr4C2IwyWakzRxXf9RJof0rMrfxK
 VwR9E23anGjhj8Nc1W6T66UVyjHlHkqmGC51Snk4Yyd2oEu34+WbHw2JO
 QjlbL/8QyGPR3D4ZiS2qxka3yYFTx16dPPWtdnmmjIuJH+1RA+D6Mlast Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="397723581"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="397723581"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747035892"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="747035892"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:38 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEETKizfGMJkn1/OEWHy406IKbdSqVWtbuhal/2Y2MlpR8hELYMpZJA7kqf55MszbOBfrAJr4HJy4BDY26taYWaiSnVlq0AIFg+wh/K9j5EV0sz9TQeedh968VhjqZi1f/I9wsyxvmkPTt0gyS3MfdHZbTnSmNCQpF6EAKRjbHn6rm0woZQsvRS7kXdP9ePQqFn48bTAzLikoX5aKdZkTWwuNElkvj56PjMC6hI7whF3ByBCqUFiWwggSy/GnrQ0jBb+3QKmFUvtAyYO72Uw3Lb0wf7YrpVbbDx8vN0BzA0SLheUsQMngTJQJjAdXaRf6eNKtpz1SRohTXGfZki9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1FH5lPQCxrSM3Y64osluVm2eTNUtmDghK/HI7w7MOo=;
 b=jjD9rWVhuFW3Qwo8FO3vMTZpsbwGWs2zG5Dfj/KcYcO5DtSfQQjFel2Oh60Ap+Fh9IXxqALqGkCYvU7kr/k4mAAPCh07RQrjwQKDpVnmqoYZaKycHV7+a1xMxXY4qriENsvbRKpT+/hgBsT5zmzEVJlDwEayUibPPH2lAPaubV4nsqfsx9TPxC5JtYSxyiIy8q5uMKLA2w351rsl9cZW+Z0lTIadSxEEsqg3/8Er/bsbMNRSqZQG8TmKoIxrJevAqua2+37LdCPNJqPBYID9a/Sz+nF6a7U3/tbluLZanAEihi4/2dL9vsvJkPK2Dm25BLtgzeTOzJgxs6KDJo3Ajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:33 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:01 +0100
Message-ID: <20231205013309.1497006-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 45494d7a-22e4-43cb-2d39-08dbf53231f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kv5WEt/KsMImdrGbInpLwedpelPRKZZHqE6JZcalFamwtQWswEZqf6Tgsl1bojUUzTGK6/YSOiJvD0zF4w/M22abkK8g0sHhXwhbHh2hEE26vA1gafIX6wZnb3d4/plDrOW4rydhdy4jAUY/EerFCg7afMnbVzA+Qnq3hfI+3eL9YgJmNIb2aoeoJOj9qXcHXmv47V/6zeOXQDrub7xYdsuGYRUQsDg9OKu1RWobJZB6mzqt8D0zgi+ANWy1df5crepCC1WcTCC7p+7ZjV4GSX+B/tdzuipQ08PFU+mZuCrF+HFwRq6ZXjtePdW8BgqUGixHgEByr/etZpp6mlAk90opjo6x9SbAkqUiUBJOu0E6c2JYLAGKlxhbQoocs6uB6YE2+P10uWYa+sWZ00sqzzvHy01Fj9azn8TCns27x6Op2EWArMaVdHQnrah1VGTOVgS3ZmbEFAfdTf5Wz2ot57HxSAD9KB9z4ktmnOirpBZ8XFw6xl2WeU6P9G0vXRESFlC1qxxI3w+0sFOvA7SlpgwUeJA08PpJWgbgQpZJEsQ5vIm01viBh5w0mIx/giNW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(4744005)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clBYOU9yVktLMjFuM2FHbUlyaG5SOHRtOFB1YlBkcnJJT2ZNQ0s0REVvS3BI?=
 =?utf-8?B?NDFWSXNtNlV0ZWMyOEh1bTBHN0VmY3Fidy9lTTNuUUJuREpGUjRDRXNneEJ2?=
 =?utf-8?B?OFpMVGhxZlE2TTEvOXNOcWR4bFdLajJvOVpsbmpaZms1aEF2VmpoNmFQVnVi?=
 =?utf-8?B?c1hXMnZwdkt0dmNmckFrekZ5YkhXZHVERjQvd2w2Y2JLOEh2a0FhQWVNb3hv?=
 =?utf-8?B?dklTdXJ1Mi9ZQXlPWDFtRWJQNHY0QVFDWENpdUU2cVBrK1lhV0pvaThuNUVX?=
 =?utf-8?B?SDVkQXZYb0RTdUh5anBrdEluKzlwc243ZHJHTW5Vbzh4dUhUOTRXb2o1bjQ0?=
 =?utf-8?B?NEJrMzFDVDJkbHJ4M2YzdmNIbGIzc2xPMXZPbHptTWpOMnhCUmFPUzVNdHZX?=
 =?utf-8?B?bDVhU211MWhBcDR1WTVXcWp2Yi8yK0oyYlF4bVpmVmFCTndnY2tDbmg3M3Bx?=
 =?utf-8?B?bzZsTVlkWkhSZ29KQ2duNEpWdFdaUnhtVjd6VGN5T2ZYalBRUUEvaUFoem9U?=
 =?utf-8?B?Z1ZtVmF5em5MN2lKT3c2UDNhUFFKOXRMRmZ6L01xRmhNbURobGNMbGlZNmJO?=
 =?utf-8?B?YWJ0WXpUNUxOMHByMkVHUkVmTWZoM0hxTjBSU2k2TWhwL01rV1FKelQ1TDVW?=
 =?utf-8?B?OGRNODJMaC9KcXNwVmNreWFHSHEvQjV3a0FlMGVodjVvc0dDczUvN0swN3JL?=
 =?utf-8?B?c0pWSjQ4VXMzVTQ0S1hjeHhPYTZIc3hzbXcrY2k4aEJELzMxOFlwRmttRklm?=
 =?utf-8?B?Sm1uaFVBc2w4ZmFzTXdlZ0tzOHhUekJzRGk1Vi8xcnJRRzZvNXNFYjBTNlNO?=
 =?utf-8?B?TVhyaE1CeWlqN3h0U3RvRTBYQWNzQzVSN1hFMWlUSmlVTEdXRk5hWXNFYjhK?=
 =?utf-8?B?WmtkdGpZYWx6c3l3UjMrNlhHQVVmeDdubmxvUnM0Z3NxMDZZZnBiV3A5N0My?=
 =?utf-8?B?ZUdYR1JGRi9uL0lXM0ZHc1hnei82TDh6Z3pXbTJCb0RvNVBvK0l4SUZEMVo5?=
 =?utf-8?B?V1NxQ1FJdVBwUVNnd0IyekZaZytkbnFDMVFwcXpDdlM1TU1Uc3kzclNJYTJU?=
 =?utf-8?B?cFBzZlJKbktqUVdwTmRCOUNHLzRLdnFuY296OWJTYWhkZElUcy9JcElHMTJI?=
 =?utf-8?B?THVWeUwvNDVTK2NFa0NwWHNMZ2NKSnhnM0haak9vNmNuRHRXVXBFMXdENWxG?=
 =?utf-8?B?clBRTU11blkzSUhaQ3BPb284clM1bVlTYTE0V2kwYnR0aEhHYk81TkNTeTRx?=
 =?utf-8?B?V1h5NHdUTy91ZUVFMk5sck5NSUpVanZ1d05OMXRGSU82Qm9qK2dHOXM4L1ZC?=
 =?utf-8?B?Nk1qYXhSUXNDaWo1b2hEeGs5T3pwNWQ1bHFOQmNTVjBEZmRnR2dVdEVQRjR1?=
 =?utf-8?B?cGlSYlRvZkxZRHZwUVhXOTZqbFBzRUFVWE5Zb1RiT2RaVE1IY29SN3A4U0M2?=
 =?utf-8?B?eU1aVnI5T2ZxY3RnaU83SkFNczdkWWtMc1o0VVI1YUh5RXRKRnczNFhpWDZt?=
 =?utf-8?B?T05wZ00valRmQmdGeG9PdmxRMDJ6UHNlQ3Y2WHlDOS9GenlhUFI3ajZzd2ho?=
 =?utf-8?B?TlIwcWw0MDRSMGpNRmxYajdNVnN4MFVkMGtSZFF0NXlpK2N6UDRVOTJNdDZj?=
 =?utf-8?B?dEozY2ZyeGVSS3NYVlVrUEh4azVlWUVKYnh3MWh2cGNyaU9XcFNwbG9UZjRj?=
 =?utf-8?B?V2FSdHlCL01CNEdPOFFEZmxRajNWUklKV2hLb0xHS0xGeUNOZU1zdThHM2ZF?=
 =?utf-8?B?TzM5Tmw0cW1mZ20vQ01YdFdxNG9URno2UHRTRGJwQ2JTeVdhWXF5b01RMWFH?=
 =?utf-8?B?ckU5Q1BvQWlmLzNXeCswWnhLaStGeUhaa0RERkVQc08zVW9vVjU1aG84NGMv?=
 =?utf-8?B?b1N5WVFqVnhvS2Z4M0Jldk1EdnhLdEY1cTJhcG1ON0ZtWExxWVBCckNCWTc1?=
 =?utf-8?B?VkpqQUlweG1VMlliV3RXdmdMZ2JFRXZYRVFkK2ltYkxYWVphaU93Q3RuTXJi?=
 =?utf-8?B?SktzQjEvbkJqYjBFbk1KdVdXQnBqdUlsMjgxdFdrVCtUUlVuT3pJODdIaTZr?=
 =?utf-8?B?TW5LUGFNMjh4ZWRPd1FvM1dyMWpWWmVUeWlWWm9QS2ErS1FnOCtLejV2Vzho?=
 =?utf-8?B?UmVkV0pGclNXOHR3TjNVY2xyTHN0RjVuU2ZXZ2dDY013cVdsMTlzQUtQbGpk?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45494d7a-22e4-43cb-2d39-08dbf53231f5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:33.9329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JNfkMLAMJ5jqdhSgWMYvUwkcAhn+r//vh2ZMaMbVn94jwFN5S+uzXQYmrbCiCYVAqjNhQV8bLJ8kIHAVnk18t2uXhCUVK/u0DDv8nIxTZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 06/13] drm/xe: Move system memory management init to
 earlier point in probe
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC will need to be loaded earlier during probe. And in order to load
GuC, we will need the ability to create system memory allocations.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f4be4b13a506e..dd56a8c3f80d4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -413,6 +413,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_mmio_probe_tiles(xe);
 
+	xe_ttm_sys_mgr_init(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
@@ -441,8 +443,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
-	xe_ttm_sys_mgr_init(xe);
-
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
-- 
2.43.0

