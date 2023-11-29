Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84BDC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E4410E0F2;
	Wed, 29 Nov 2023 21:47:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A4810E683
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294445; x=1732830445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xCBR9MihB+DQcsl/sHyYUd+bLpwC3aBPJQaRvo3CZPc=;
 b=Sid+BSSCtmMC3maX/rINjXRY+zODFIkEnDMNcUtphjUdIK4T9e44kebn
 8lyTSQkRX7WRYnxO+KrFRm1aCZTyJRWJare2TBv5lma9MWMWC1yJ/ITFA
 Un4BpqZbfRI7a8upJAd2mMm1EzxyO56e4lfjPSZ0Ma8K13+qiavz6ZRYw
 VvBXidx2xy9aYA9qP0OjZcg1D+sqf2FRGG9LM5f5t3uIpReBjcE85HoNS
 X+nietefXjbXp7V0HVO06WvIN/jOcLu/Zl3xuo+UE7gY03vtRK7Hw/HAt
 p76njeAu0Vn2LTWCSyhsP33jdvgcOzTR1mpv/iEtu2h9ERIJedaA5LZ02 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383628120"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="383628120"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="769061782"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="769061782"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:47:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkFzGph8xLNl5BXpv2dir/PYGSnJebMiodVKY4i3FkuynvCu4KYVgKLm620Z7V/MgpOH5mHcTO0hrxkAjBJ6NjEhdQrwkDxB/JYTpxPXaXY7KuabefmBxrdptrGjrbMFV8iDrwjjFL+wjwYJLyzoAjuQTZWRXSt3AuHnSQT5XJ/pwtYoSlNLwgWitI4khKdQHeHhQriRloYILGCzIfcdKCjwSQymW899VFVnzXypw4jT0Sq8orhQpZ1v0rNHAEluDRrcS4Zulam2focfo1JOK7CRvjv3XaKQTwfMnqT+PMXMYHtlnI5LRfM/SNy73AiUeoSen0pe8hM1HIJDs2gxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MImZgGQxxdSSzODEFOs2mtNLTROZpv1XHz7X1lYMpNM=;
 b=iRNg0LSPfe6Ute+HGjf13vXizmFqx/GrdVPnRELh6q8jLJJPH60eoK8tgRhJSyTmhwplcddi3RKqzr4a9KtQPs6nTbptc4U+O+An1M4w0Q5Psy7gFeIyCmmVmyyjjfnpKol9KV2BCLaIYCjjcr/+xpvoG8kH9aWnVHNbS59tp0a8RGR2VChNDmXh2pNpuX+1P3mKGhOpPUfokDDj13mHlPaB0iVqsWDR3ol7ovIIwmm0s9voMDIQEbiFxqHNnifLfZlAn4Jj2gMLVT/7tF8UpW0naWbhMA58MOYIw25TKuF/EqHPZhynqxudIeWapjMlDNYZK+zxOr/DHzEPNk2jHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 21:47:21 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:47:21 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:08 +0100
Message-ID: <20231129214509.1174116-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: dd40cc68-94ec-443c-4a23-08dbf124c3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vF3Al8usWnumyFoNb4pmmAiyWFLqhpvHsrY8YZ1CjYdw+gCUS2pWTKhy+CLOr1cCxZu4dkUjIm5BkAK8FSCoJUV1sPNAFFMT/n6iOIF4NhqAvcguyltFYUTzM0Btq57HpmqKPoMCr54MkJLvrPcBxRoxeWU/u6pfYO3/IOvFCTsQhPMZPESQmQMv8QW9pBeij4atWeY3aX3a04o3iF+Y4Caf/323EAzvX8xOUptDaAeQo3gSUg1dEdLYAeFjeKwsK4Xd8nigPoM4zds9lXNilD5hxBwC2nUDPUlrVt91pee/Igb2ZjjG9z35vPCym4mhIg/cyqa3+5NmDX0I7MFXMyY+kiZ56N2fEB2IRUj/O33FjpYfN5V2U/QkbVdyqIWjSoSwwSh8KdcXpszyoX76d46m4kMPje7VMJVCq5WEUTqqC3L1s8RLv3e3cQt+MsiPpmK7+SsMlpnybNFAfcUXK44oeJ9t0JGoBbPRm3opTDT654T8TW8SI3RfyUEmmlCMedoXyOBa+W+pJyRpqB+l5+TlYWTuIlIrHABBEIcUs8g3S9CmeJKwh4e81NnuDgD80YAljE+XRHJTDD9fkgvUEkOtX/BUsKU4pZuJ2HmwFa3Zn+/sDJx/TaKs6FMOGNy2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(2616005)(1076003)(6512007)(107886003)(82960400001)(36756003)(86362001)(202311291699003)(38100700002)(83380400001)(5660300002)(2906002)(478600001)(6666004)(8936002)(54906003)(66476007)(4326008)(316002)(6506007)(6916009)(8676002)(41300700001)(6486002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y211bE9DZXMyYTV4MmxaWjhEWXNHUitONnhJTTVGa3NsRUY5YThiKzJyNG1C?=
 =?utf-8?B?b1hWT01KRE5PY2JqdTBpaW56NGpzaGdRWU8wd0NTSHVqYVlXb1lSSlRzTFNu?=
 =?utf-8?B?dTcvUmwyczB3N0NtcVc1MlMra2xYYzBYOU96eTZweHVmaW5EK1dtQk9SWFNj?=
 =?utf-8?B?RGpIK3ZwdmxuOWJiTS82d0FMMkErYlBKSmtjNmxHQkFUS3ZGMjFlcFVZOXNa?=
 =?utf-8?B?TmxqV1VJOEZqSVlwcTZqeUtNY1pIekt6QmpXYmgveWk1NmxpaG85K2ZUY3ZH?=
 =?utf-8?B?a1J2dDVEZmg1ekQvLzBZbFc4alZ4WjVsR2R0V1BRRmtVZ1hPWWloaWV1NmND?=
 =?utf-8?B?a1h2cUMzMzV4OVhpM2cwMTViM21rUlUzRXB2R2QzYXl2emQzd0ZkSDJMZjVV?=
 =?utf-8?B?dFU0RER5bFlLV1JDM0pJcnNSYnVXNVh3WEFqSU4vSHFlUEpCa05HSFhmR24r?=
 =?utf-8?B?cExqZGlzOTREYjhSZ25LcTF5RXBvaHUxZVYyRFZuOWozaktTSURGd3pseHpl?=
 =?utf-8?B?dVNsWEg2bFJLSG01ck9USE42ZHJvRzM1OHc1MXlLOXdOd1haTFZsRUxnczJ2?=
 =?utf-8?B?T1NKbXRveVRFTnBETGJRb0FVWDAxK2RoRXpRQXFLMG5TeGZwanFGcFZMMEVR?=
 =?utf-8?B?NldCRFV4NXl0T3g3OWdWdWwrQnFvVjNSVGhrUkh0Vm1MZ3RHRVVGMG1mdmRZ?=
 =?utf-8?B?bWNGQ2pmQ05GUGltdmNZbXpsZElpNkVEVjJxSzFGVjBIZXBxbEVOL2tlejFx?=
 =?utf-8?B?bWNscUJXTndLQ2RFaVZreXZTRTk3SHczMHdhaGxESW1RaFY2a0huS21JU1Bu?=
 =?utf-8?B?bUwxa1N5V3lyLzZCbmlvaUZhTy9HUkYrbkR3VjdrYVU3cmtNRUV2Wk5zRTNQ?=
 =?utf-8?B?L3gwV2VEcmVYKzBnY09tSGx4d2o0d0oyNS9YN2xqa1FUYmdtcVl0RkdaT2lx?=
 =?utf-8?B?N0J0eDhNTm5uNmNSSG9GQ25GL3I1MnJXam1MRktaZ2NQdGtPL2JhSHk2NVBv?=
 =?utf-8?B?UEI4b2NiMXE1R3IrSi9YbUhEYnpha3JtRDVodC9UTjZndUQ3WVYzZkg3YzhJ?=
 =?utf-8?B?bS83ZDdHTURsa0xRVWRPVkpYQTd2aUJpUHlOVDYxT0JsWTZvcmtVRTdkdUFq?=
 =?utf-8?B?YTdHU0pOaEk0bzAvRkRQVG84bUVBQXZwc1IrTGRTWWdGM2d0Z3ROTGNoUFBj?=
 =?utf-8?B?WUpVVWovdk1Rb3ZaaGFwKzlYTFVRQVo0WkR1NDA5WnVqOC83ZUIySnZ3cGk3?=
 =?utf-8?B?REI3dWJJaGw3c2pJV0c1TFA5MUxkUUdqMWRQWkM3azVkZWdXQXZ6M0tzczBT?=
 =?utf-8?B?U29FSVpRbHA1R1hCTXcvOVhSYWc1bVFWYmVOamxJZFpUTThGRTRDeURMOFNk?=
 =?utf-8?B?alU3d2VlemVpbysreGJRLzgwOFlidHJwNzdwNHR5QzN3MkFsbmIwclowaEJm?=
 =?utf-8?B?d0JiakhOV1JpSSsvSGI4Z0dDNURMdkZuc3Nvem9jZVF0T0cwUXhhWVByVGxN?=
 =?utf-8?B?aTA4eXRobWxmSEliczlacTBha3dwZCtNSnNYK1hHRFg3Q2xra21oUXl0ZW95?=
 =?utf-8?B?czhOM1FVSU5vZi8rTDBwYXpGMFQ0NVJVMU1Qekx3akkrZC9IQWovam1NMmtL?=
 =?utf-8?B?YzZEanNTRFVPUjZiSUNmRS9pbHc4ckhvVUdBbGFQSEVFNWNrRkNzeGZwVnhJ?=
 =?utf-8?B?dS85bUlVVDFaaGF0cW1FdnRzaWFEdjVVZ0c3blFwc0tPTFFWdm1KRW9kUHh5?=
 =?utf-8?B?UGxKc1llR2tybW9aVmV1SHIxUGFkWDhjSklpT1ZKKys1TXBQcDE0MUI2ZWtJ?=
 =?utf-8?B?LzFFLzFndFRBcEZSUkEvVFdraDd6Q213eUNOemVRdVZhc2YweXRFa3pCNEVY?=
 =?utf-8?B?ejJ3SmpKbmtwUkQ4YjE2SjlSRnpWd3pOeE1YWnBNWGkzRDhpdkhGeThxT011?=
 =?utf-8?B?eXBMTWd3Q1ZrM2hOTmhnZ1pyeEtFTTdSUk9Ud2tzUDRqWGZmZDFQNFY2OVZy?=
 =?utf-8?B?Q3VvWFBSMVR0RHQ2MUxUd0tydUlYU2JSdWZYT1Nsb2puYmNpQUI2d3ZzM0dC?=
 =?utf-8?B?aE5rQTBkV1U2a0dBd0l1U1RiZ0VLcFZqU3hZaGx1WHRGZlBwbytyQ1BJTTNB?=
 =?utf-8?B?cU1jWUFVaVlsTEJzaW5JdWFrbWgvT2ZYMXVFdlJyeW5YckZNN0ZJbzIzVkVD?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd40cc68-94ec-443c-4a23-08dbf124c3cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:47:20.9895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kk6x4U4nVsf0Z8uFQLDlOBQ5u36LIetIvR2nyqY/YDFkHair/KuuuQpu9MMglj1ofAEa+66gvLmuYXtJn0mzI/Pm5D3Eagbec4Y8Ulc7myw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 13/14] drm/xe: Move force_wake init to earlier point
 in probe
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
GuC, being able to take the forcewake is going to be needed.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +++
 drivers/gpu/drm/xe/xe_gt.c     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index dd56a8c3f80d4..bcc10b7f23ab7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -415,6 +415,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id)
+		xe_force_wake_init_gt(gt, gt_to_fw(gt));
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8a6fb9641cd69..4db94344bbde7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -293,8 +293,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
 
-	xe_force_wake_init_gt(gt, gt_to_fw(gt));
-
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
-- 
2.43.0

