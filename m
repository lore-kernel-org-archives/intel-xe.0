Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0110DC47422
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 13:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B738310F744;
	Mon, 29 Jan 2024 13:03:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C095A10F744
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533426; x=1738069426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XYAmRoDotjTw0Rwf4fiFkRs8xtdVbE4QHnXrRoVrX2E=;
 b=OcQXTTT5V94dUuqT3SJspT1W8Nx9p0sawSQMj1yVzMh5WbP5sib2mvRH
 oB7UxUbtJZt4VNqJUqcVKWV4uaTZEQEkK5O2M4X8PEjvcuAMTrSOHQVfJ
 H8oDdT7Pez5lKqXIfFHutzLQ1igbGKRxYJHAygwSyFItIFcKTM1m419Mz
 BeFiPW7lzZtJzWTaYuW+Fi7NtGYaMnDsCn0MDLGlucNDYV+IPvTJdcn7i
 cqS5YCebOIjh1d0bnMETlwc/FMrcMnGiNZF8DAOagSt6FByoZ+gp2FomM
 ywXxFuWSpMn+mEXu7e+jXhauFbB0BILpHmeL34hc8HW2KVi/cSCdQ+8c8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10326443"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10326443"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="858091489"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="858091489"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 05:03:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 05:03:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSXTkGcLwFWDJNNxO/t6zBZX6of/urIROtWs5WbwQuuV1OZFbWZ1Ig3ZFs4dZk9D3MstACogUj8VjlER774vVgUV8M9WJdezJt82ng02kfuGZELSCe99tVG9bts2oiRzibez5LRkKdQeepmio591CQukmhi0K9ykD0pdBacBWk08hxdnX6SgxUXV3suov1sO/4ghkySYmNil1SplV2tgNhsK75laaMWy0LQsQXXw2Il62LFMlLKTHE33NWZ4lsjSY1UcZ59s2Tt6J1r7Sk7OCt7mF7tf9isnQvGZ3rHnIRtA/DXRxHHW0R+HaFaZ866/HMaFgpgg/co5VZoiWzmsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1hQZAKQjeRj1AdnTM48mFMD7mSPjDFCLxhg+dsLLbk=;
 b=oO6qUaEpWks6/v4uwpP06q25Z4XLKFk3WFoAI4UIrjxd6JWFBvD8al5bqIUQjt3kVAcfpnE9o0T22aAgYjLGbJrJu4JnO2xR0xQlSn1ul7R5TZV3Ha8I4xo64y+/jg3muEseVhCkSeMG6EVZUCTzt6PTDkDpjko7qu5BAJNWKFzfZZQl8hxnXVsZuFvG3BDlPOEF4aPavmrIZ4p5WMb3cWrmsYQkdIN+qlscVuKUTDLx0tSSTOb91vrfXoWooWGLfNvWdBBRdNbOAoizYfX0BA8Bh7vTPA4Ct3MfRDlBOC/3qB276CfR20CeluICrDTAgvwF1wAvKe4mSVZIZ6bAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 13:03:33 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 13:03:33 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
Date: Mon, 29 Jan 2024 14:03:06 +0100
Message-ID: <20240129130308.3544466-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129130308.3544466-1-michal.winiarski@intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 801d5e25-ad3a-4d0a-1186-08dc20cab2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBZrHQxga1x8Ksk7IE0SoMUy8z07WJ7mkcOfWtC6nuqYETrZPffLET3sGANFBaT+5qDMgprQAu0on9eN/9+IKzl9fg6OEcRNhxaJ28bo74erwWPXW0qRYuDpEo0G6Xr7Yup5sNxFspv11qNW20OP3MSzWYQICGHGarQ+bSN7YycjEg8xy+0fzAzAa+PX8SCuYGkvioxOQuEaDUXsQfXj4D6n9tiUCPT+SeAs8WYwFIOcJb9A3vCxGc9pvU593U+Ahyc5aRco+68buiflPORW4R/B3Lq/Tf5/gFqOs3mtQr64SricR8iM9O+AUT5bVJ8+AeUIlSbmJLCf/Jrtemn2NtVtQBo2GPKrGQmo1bfPGuHMCxPQSAsCtmCd051AFqL1FfnIb5oNzNaRD8wxwgyjZZdpyZaERwiFeZYVn/EHgkfgGqxw0yBV8TITlulm8fircMxPDaiP4c8kostRsdjK3oE9zyXNnc1mmmOSdbyMCVo79TtqEWSIA3w5WBV8RNaxsT+gS8GEenk7nz0gQUYPq9Hzit0arAq2Mwn7D4zxxwU/0QSfbtUsjcY+7qZHBd07
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(136003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(1076003)(83380400001)(6512007)(6666004)(6506007)(36756003)(86362001)(82960400001)(5660300002)(8676002)(41300700001)(8936002)(4326008)(2616005)(38100700002)(66946007)(66476007)(6916009)(54906003)(66556008)(6486002)(478600001)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WURjWkcwajdCM1N0YXhDS0tPVHFTY3R1UC9YQmtoNG9oOTBwakxYUVRBS3kr?=
 =?utf-8?B?UFJvTTNkdnMyQUtydllaZVFsdWljN1NxcGRhZm9SUmQxdGxVMGRWUmN6TU5h?=
 =?utf-8?B?Qy82VFlONjdPOWRBMk9rVEVzTm5vNm1Wb1lNU0poNHBwOXpXUlZlRHpwYm5v?=
 =?utf-8?B?ZEJmVG5xdk1WbDFsU3Uwem94VXBGbFM1RmpQdmpoTVBmMmg5MjFKUW05Y2Mv?=
 =?utf-8?B?U0ZBWmdvTCtOc25YRk1sSmlwM3VXeTIrNDkrY1A5TGRybEZiMHBTQ3NwMDRn?=
 =?utf-8?B?VHVONjIwQlR2YU1lTEwwaXQ3K2hSYUhzWFpWS1pGNzZWck9CMHkyZllZQUpG?=
 =?utf-8?B?MTI5ZU56WGtXWEVzd2xKcGVzcjJyRWMwTVhvRFQ3aE1GdkZHYk9VdGZYeGFG?=
 =?utf-8?B?cDkxZ0QyUXRDa3N0MkhUQzlpS3F3OXA0M2o3ODFsbFZVaFJVUEhoNDR4aDFL?=
 =?utf-8?B?cXlPZVRnN1I5SzFiS2JlN211aURKdkF3eHNVcGtOMU1DSmVHK3YrUitPSjRU?=
 =?utf-8?B?eVZuUzlOOHNyL3ZYRGNLc0cxdWZvUHRMamlxVmJxcnpHME5VS3ZRZzZIQWND?=
 =?utf-8?B?Y0ZKQXpvVEsxMUJIU0pnS0d6d1dEY2VjcjNLOFllVVhJcnlqR2RKc0dVaW93?=
 =?utf-8?B?YzB5NlVjRitVZE1jRUhuRXNVcmM2b0NScTN6UGFzb0pwbUhPaHh2VEdxSTZZ?=
 =?utf-8?B?aXM1Nk53WS95TVpXSml1ZitOYkg5SmVnTXdCNDhkZkY5dFI2UXRmNUw1TmFi?=
 =?utf-8?B?ZG9BSjFyUlpvdVhQSDNuS013dFJFdEcyNXdtWXdsdTJiR2YzRmIwWFpqVUF6?=
 =?utf-8?B?R2NFaUZ2UXpSUEpIOFNvcWZ5V2NZWXZGdUdrY0hCL3Z3MUpNakdVanZ3TjNH?=
 =?utf-8?B?RWcwTnZpekdEaEFpODJvNVptQ1dwU1R2bjJHRzZQcXlpalhYZnBoTlg4TnZN?=
 =?utf-8?B?TkpqQW1pK05NcHF1Q3BacFI4bldFQnhWZDFFbnp0VHRjN244S2xFNjE3ZUpz?=
 =?utf-8?B?eTU3TWdNWVdFR0pUOTVaczgweS9uK0F2UU16ai82NXZoRjlVZzBXWW91QkZk?=
 =?utf-8?B?dVF1Lzk3TlRiVFNLelZaVU1lblFZTTBuREtMRjFad0w1WXRmZDBGU21NbHFU?=
 =?utf-8?B?dlZDbUNKb2g4UXBwZEwxeTQ5VjdBSXNrQm9RRGN2VEpzK2pOYWdiemgzS0JQ?=
 =?utf-8?B?cXhZeS9sZE05TUVhRUd3MCtnaVFYcFBCZjlBUE5neFlkcU9obXhNdFNxWXMv?=
 =?utf-8?B?NUtlbjZKQngvdVZVRmlIU3FuZ3lGRDQxaTZiNUhnNzBHeGVMaDJvYnVPNHht?=
 =?utf-8?B?R1RXdDJMdlI2Kyt4R01GcFl2YVVtYVJGckRZUnZ1UE1aNmMyRkxoc1ozem4x?=
 =?utf-8?B?Ukxkc0VzbUwxTnhmVy9UOFBsL0V0cE1HdFlWbHQ4SUh5alpraVZkNmJGelhC?=
 =?utf-8?B?NFdBUHZ4YjBQRUlwQ0xaRU1aOHdDVFN0alpuRElMZkxpZ3pLdExWWitTcjZD?=
 =?utf-8?B?clgxZTZUUnlHYXh0UUlvWS9YeFd2WkJySC9TaXc5V1NQdkRha0ltRkEzTFo5?=
 =?utf-8?B?aWs3Y2FSMEhvWEsvTVNxQU9sMjZJc0UxK1Q1eWJTNnlxejdPaWFCS2hlTUVt?=
 =?utf-8?B?L1ptc3g4cUhsS2FFWHJhSXhJZnArLzFvblhWTCs0bGxYRyt0TFVmWDBXRmFk?=
 =?utf-8?B?YVVlZG41bmc3aSsvd1I3RWdxWlRaOW0vanBCTUlxdHRCbWZJbEg1bGw3SC9F?=
 =?utf-8?B?MVlTZEljWnpzd2JDVjh4QzE0S0Z1M1ZiL0NzSEhidUZDRGhIaHJ6MkNVamhs?=
 =?utf-8?B?R1FRaXZRSkIvRVg0YmNxYXY2ay9MQUozY0JjUGJOL3hPSjNuZFdwVkxiNVFC?=
 =?utf-8?B?Qnd5V0hYUmQxSDRzNlJVY005clFKT3lTOUdPWnNpZUV4OXA2SlhnUmE2czhI?=
 =?utf-8?B?eVhiSDUxT2dBakxUWHFBUC9iYnM1SHNNQytwVVN4S3VJZ080TE5GQU5sczlr?=
 =?utf-8?B?eWlJS3k5alptOHJaWkRVZml3RU04NllqTVQybFRpeXU2clBqOFRySU1MT2k1?=
 =?utf-8?B?R0ZXT0pKMmQzengxTit3NmhLYlNZcURkODZQWEhIWWwzSXM0RFdyVjh0RHBz?=
 =?utf-8?B?dlRocXNaeG1RK2daK3ozamgvMnhLUU94c0JadXpUTmc3L0tiV091Wjh1Q1dE?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 801d5e25-ad3a-4d0a-1186-08dc20cab2b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:03:33.5082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7gIJkrbPTrYG/BvRmDDkk0ztvgBX2PyVTNwkapfmWDpluyZLsXJFASUFGcMNMROUjWEdBBuG5BJeGUIORP5fCnROhY/FRldFFvdRD+XVRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
X-OriginatorOrg: intel.com
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

Similar to GuC, we're using system memory for the initial stage, and
move the image to vram when it's available for subsequent loads (e.g.
after reset).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_huc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c  |  4 ++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index eca109791c6ae..b545f850087cd 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -112,6 +112,25 @@ int xe_huc_init(struct xe_huc *huc)
 	return ret;
 }
 
+int xe_huc_init_post_hwconfig(struct xe_huc *huc)
+{
+	struct xe_tile *tile = gt_to_tile(huc_to_gt(huc));
+	struct xe_device *xe = huc_to_xe(huc);
+	int ret;
+
+	if (!IS_DGFX(huc_to_xe(huc)))
+		return 0;
+
+	if (!xe_uc_fw_is_loadable(&huc->fw))
+		return 0;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &huc->fw.bo);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 int xe_huc_upload(struct xe_huc *huc)
 {
 	if (!xe_uc_fw_is_loadable(&huc->fw))
diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index 532017230287f..3ab56cc14b00a 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -17,6 +17,7 @@ enum xe_huc_auth_types {
 };
 
 int xe_huc_init(struct xe_huc *huc);
+int xe_huc_init_post_hwconfig(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
 int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
 bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 8f37a809525fb..d62137306d280 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -94,6 +94,10 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc)
 	if (err)
 		return err;
 
+	err = xe_huc_init_post_hwconfig(&uc->huc);
+	if (err)
+		return err;
+
 	return xe_gsc_init_post_hwconfig(&uc->gsc);
 }
 
-- 
2.43.0

