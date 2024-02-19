Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5579C48BF8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 13:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5424910E429;
	Mon, 19 Feb 2024 13:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajxSp8FI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D154510E420
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 13:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708347950; x=1739883950;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=kgBWekPxfy6Wds3RS7mj9mjHCA6VyHJZUDwTjEW9/KA=;
 b=ajxSp8FI5R4znUv+9og67SZUFcQB1uRECnYBJdN5Vj4X83aAsPk8Rl4z
 A3n7EonY+pugAtXgKeneqBMmM7OgL6ung2ZQFq2tAlfBYTUxfBVnu8Ouu
 XwtKtKrZw/GadSo0Zn8T9s+W+908wGZrs+3zijQ2tZcc8D0f8Vxnf3Vnz
 jA/xZ5UdyBrf18nV2xBIkdVAqnVb8uT+CGlANvn6rGM1jEXdedfMS8Q8X
 ++d37KifM3yXJRtOlgHt0hSfvDWpJg2VrbMUa7xCWaAxQpDUsfxC9S2vh
 hzocc+x+SAp617GEl2oeYC9971b6V3k5K5RP6EXPbdSQf2AZrqQBeCKfp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2571378"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2571378"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="936289627"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="936289627"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 05:05:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:48 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 05:05:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQorRf99wdkXBxjR0n1eyObU2uRvyqoUEoOMfZtdXlDfyMnsEm/InF2i3ny0vtZ1FUr7ZvSY8RLgr/uhvjqsG+QelQQKA1LH25auKN1s4dNtFs40ZJw647wtKFjN6hH2PpOv+DPfCvHr+cf0jSG9PtPaEnf0khYx26VGrN9zNdQc5F+QIvLBFwkBnIb92RovffJIHI+tFN1pEL558oKQ9d8zQ+0quNDF94ifu1wPOIYLKlNdO38jBYL8XaOjqmRAdToTdl8DY9vlMTAvTaBWVvpi/pJXqueLF51b6MeC0cXuOGFaJzQKacv8R/J1BclU+/HK1umDkILfrfgA2kvPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20mb11zukwgKNwXqJeruXodaR0oA1k5XkRl+C4kTSrY=;
 b=RAP2ffWilTeFJ9nD288CzA7g+/83Y29JTa3l7Gc9918d7NjNzM2ZRi3gcfG37PS7ltAWThgvWqY/S+Hm/QJd/10NsnEmpBKvOx/vU8EnYeyyyigtDHbYLLcN9jFMkYRPGGWLBVRgLv+7X0FR/9SMuL+MBcySgmgs9EUnpLjUeIxxuErh4N/Nz3VXjR9sVUPhwznEFWNnaDUb+dRDfrWEg2IXYoWC0pWJB0QreZE3NEymPDvkZJSWI9IVilDWgxt28PNezFqJviw33eVtG6c2kw2xl8YpAT4XC3V3tg8/SYf5OjXom5XOstcfk64944a/YbIB71TanhPZ+ADopfJopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.27; Mon, 19 Feb 2024 13:05:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5067:c1f7:e269:88c7]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5067:c1f7:e269:88c7%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 13:05:41 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 2/4] drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
Date: Mon, 19 Feb 2024 14:05:28 +0100
Message-ID: <20240219130530.1406044-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240219130530.1406044-1-michal.winiarski@intel.com>
References: <20240219130530.1406044-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: afd22b7c-ea4c-4c2d-f3e1-08dc314b7972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HmWryWeklZ6kLwm2ykSXN/8mu5oA/zSUy7RLjnodmkfxA7l4xzZPskoOBWXEMv8m/5wqIEz1UiWj3nLaZy1/NLCuKjURhxmdi9aeTVorDP8mtId2hef67v6g95U3EvhTmhWt6Eip9GqcHY2iAeKiy5nY9AFCGjoXlKhAkGh9jl8/yGlaPGPqDzCkdeCtfduc9tYg2cwvhs4rfVcPnkeYJaJhrsxKjzyU/MnWPaXL0QKyL3TUkqXFTvKlaYutJxMc9XtyediTQ8P1/GeAh7b5Hfdk4ThjS38RiPI60gDfnMbSQsfjVRMhWnJlwdn13oWhGSvbejODKtZL9G8Ys8Hjqxe0bk8U1NIkpjZ4JYavMqzVkGntPvePTIiBlc1bXv1CDVN7YGfUDcR2Knb1fEdLcOL7ovvImvsY7g9kvwGGsNqKwlZwCICmvf06zA6Fo6AktnIZ4SS9tsTnyr3QBELrenjLl6fUelWMDLbMcUvjcdxBN2dB8DIQEciEqFAPgprvrnagm3+jhEx7nIQUFnUwa+XLNoNPfcNcw0tIi9OnZOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2VueE9McXBIOWRSTDQ0WnJFb2tVNVljSTF4bWRvQkZVOVJicVA0cGNaaVZ3?=
 =?utf-8?B?NWRiT0JKdG1pMUw2UWp4RzlKdlJOQk5xTEx5YVVNb3MzMG8vTkdJbUVBZ2Ry?=
 =?utf-8?B?Z1FrNnJDazlXWHhhVVcyWlYzSUlNbXdnSjZhMkpHUXhpUTF1YUxxZ1E4VDFq?=
 =?utf-8?B?WWxkclRUTnBZZWU5dmdZTm1TS0Z5Nm02ZkZ0T0pSMGQzVGlYVmhWQWJ2QlJS?=
 =?utf-8?B?a3JUUVc1Unp1a3lwVU5IQW8xaENNQXNKdktUNHU0cW1scVlmWjA2NHptQUtI?=
 =?utf-8?B?RWgvdFR3N2tveWVsZjlZRzNNUmErQUkvVUozZGYxWGp0eDMyNTZiYVYrRGlm?=
 =?utf-8?B?MXlRMzVwakNsTTc0SS9ZUGlRTklYWERCSjJDb0ZQSGdKUVd4N2NiMWRWeTJP?=
 =?utf-8?B?TzlISVgxOU9JSXFicFBwNm9pRkViYlV4dzhyYysrM21nOE4vSWpZSjJlbElr?=
 =?utf-8?B?MkNndXJlRzVvclV1Ky9Ud2QyUE5Mb1BMamk3cWhvU2xPc1Z3M0MvWEpIZTFI?=
 =?utf-8?B?OS83OURKcDVVcGRlbXE2ZDVhZFdBQ2RNUVF3ZWUyM2VPeE9jVi9Zd2VLREl1?=
 =?utf-8?B?M3lHcUVxNlp0VmQzWTBnUlJGU3A2VnFIWUZ5NHczQXgxTjhEV1FpTFlxVVYr?=
 =?utf-8?B?VWlxY3F0NnBrTjJPdlFVeCtEcFpyQkMrMC81bGd3SFFnaEJ3SFZrdGFKeit6?=
 =?utf-8?B?SzNqL0lwdUtHTk9taWMwWFhFSEk4Y0xOVENvaFlWdWNYSWIxYk0wNERnWU0w?=
 =?utf-8?B?dFc3clFraXFoaHZLb3BTTTVVRGV2eXBzYUxScEhqY0RJUVI5TmFQMVpRZ3J3?=
 =?utf-8?B?THZrMlNOVGVCdldHSUE5YkJHdGJpa2dodllUNkQ3bjFlV0tIN25sb25xQ1Uz?=
 =?utf-8?B?T1VkV0FBRGUvT2x2REhtY3Z5bVE2TkxRR01hMWdUY0I1Sk85ZlVWc0MzYjVR?=
 =?utf-8?B?bHZHOXFjdWFWNlhMZEJkMUl6cnQ0Q2w3Rm9NQ0ZzRFB2L2xkZTNxTCtOMGw2?=
 =?utf-8?B?bmtFWmVTWjRxNkpwckQwa3ZQTkRBZW1jTTlmbWo4Tis3NHdYbDVodFMwWjYw?=
 =?utf-8?B?L0dUbmVBbTZIWU5JZThIYkxFQUpJdmRjNWYzNmNPSVNyRERXS3Z4dzFkTlBw?=
 =?utf-8?B?eFN4U2lWK0RBTmh2L1hkVXhnaXNMTnR5NVMvSFRacFFKZExhZ1F0UFdMVDhL?=
 =?utf-8?B?MkVHM1FaaFB6YUd4LzVEVUVteXA2SHVUeVV5TmR2c0pWOXhtaFd3cnFuTkFT?=
 =?utf-8?B?WmV3T25xcHM5d1NnTyt1Y0h4TzVhcEdCYXFxeEdzZE9YNUZ6SVZ4ZEw1TTNM?=
 =?utf-8?B?TElVaFcwZGJmYWlZOXl1cGUyY0RXZEhnWnltSTQyL3NTazJ6TjNubG1pTVYx?=
 =?utf-8?B?WDhidEdMSys2Tmh0aVBkeWFaRnBrc203ZFVOelkwY1RpMUlQUHBxNlZvYWdw?=
 =?utf-8?B?SnRBdGhucHBFVWkrMEwwZUZDc3BOb0d2ZVlDK2VuS1k2UDJvV3JmQmlmdnBL?=
 =?utf-8?B?QlFwaGFtRGVPZENhVFQ3SHY1NHNidkhDajNVWnlMbWdFbTcwMzZ5U1VDaHg0?=
 =?utf-8?B?aHB4NzJXMXRadit1R0dnSktwclBMZFZaVW5sZEdVZXpaazBGejUzbTcrNVZC?=
 =?utf-8?B?NVFpWFlVL24yQ2k2N3N5OUwyRVo1c1NlSVdOWnpyWjcwRTZZTi9WYW4wR1dW?=
 =?utf-8?B?VHZkajdYcmdvNnpnMGlMRXJybm8rWTVDMUZvY2lRSFdESWd4Nlo3SExSbzhz?=
 =?utf-8?B?WTA0aVpUSHdnZjlkazhvbk5uMFJoUkh1bC9Ic1BSejF3OURvZTBpbWwyZXlm?=
 =?utf-8?B?ck1HMWN0ay93d3hydEs2eDIvV0sybGZaak5pZlFTcUFSdG9HMjZTaTB5cE1Y?=
 =?utf-8?B?T3J2V1RJZUpYSzFUU2tTN2ppaUR1UC9GbXo2Y3BBL0xwQ2FSNWs2OEJCY3di?=
 =?utf-8?B?K3A4V0NKYy9kalhBdmZlNWRKNWJoNlo1YjlieW42d05nUGVTL0ptakhrenNR?=
 =?utf-8?B?Ylg2eTV1MThKZWpMbGlLZTJ6WWFHVjhYbGRXdkFzUEZMdVJyTVh2TFFRRW53?=
 =?utf-8?B?QkRvejdPM2hCc21HNTNGRnJwcGFlbXo2b0dVb29seEMzWmYxa3NrS0ZGMm13?=
 =?utf-8?B?eFVNRWNCTzcvYWFOaERrTGdhQ2xRN0NRUFBiSitCMVZIZVVaUnBjWUtxSGcy?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afd22b7c-ea4c-4c2d-f3e1-08dc314b7972
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 13:05:41.0627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcQt05G4ZB3Vpu381t07PHv37khNSHcoiYFYA4F2sW8bqyhvwL1+z/Lt4gqoAacLsj7kp5nn/A8QF2GEtNCJbwET1X7lokiQPEQncEVm09o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Similar to GuC, we're using system memory for the initial stage, and
move the image to vram when it's available for subsequent loads (e.g.
after reset).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
2.43.2

