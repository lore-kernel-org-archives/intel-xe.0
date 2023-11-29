Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1377BC10DC2
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA35010E69A;
	Wed, 29 Nov 2023 22:36:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888F710E699
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297388; x=1732833388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wmJxmJfJoNNjzZ58S2NaIuQJBQFHzlP10ZMCemhzyqQ=;
 b=h2E6G1unCjq3W7glqhJnNeyEqejGED+7cPNOIGSUne/L3uKymHj2fGaP
 2EultLbW8IvyvG//2egoRyejsqIaE/NxdWlBWoSjIPv08ud8N9Ynyd6J3
 bBI5rPYZSGkMsQ8D25rCmLDFnzkbLCYbNhGtzywjMOFOZao7ImDb01NYu
 1usYyksCmel3pw/jgT8s3IFUhKGJA1nPb3Ffp/J6etj69baM9tAlsaAnm
 L1hjWgtHRLnGihieak17q8nY5+TWx3cE482ZE98jLVgUBfOHLExBAycbw
 v8D/PyPgc5iANsQOFpj5v9lGLTLHM6MmTxlfLhnLCkZVcagT3/LwbW7iS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420221"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420221"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718892171"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718892171"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:26 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxmjzE9GUz6GOxfFEVNvty7ul68oPvLhB0MhHEUgqW98KtSb2e0+Sf84xgmv9BxccqCe5mGg5nKvDKFRRo+/B/s8VmnedB/cPNsvJt4nsjoyHCF14uwFBA5MtdoG0947T2ORzpDjIH560z+JBNKhWs28pwAi2OvxbYviRPzDJ705oe0YU9gRj5MnvIVymEMJvReGIbNCw+/u20KZYS+IGabAVHKr5aNvpmUNK05jdWnSJLi8jaNk9f/v/fSqi6GFvyoKEaO53FNulzrujseiRh82dq0qFJ8BzzMDwvaQyP2H2lO78PoTaa92KC5XdLZ/VdivByagwYS7Q99OK/GXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umiglcruyQPp1t34GiR6ekP3KWFAI2E48y/tzdk+AQY=;
 b=PV/6t1WZ2ZGwhrvrRzx/RkHDosiTcTUdWytdSZD8wwc0uUIlQ7eNrG+lnRkGQXp8cN4h3ljsrJCG//dKxHr88GwEPbgQUdkYFxFYiq0gK826E7dT98iAUPStjZvNQI6F9n1sWdHd1JqVIuxPr6bWELblZcwv+mtP8LcaKcW0/6SlxNX5DsXv0+Qc/KJNa5r2Vxeg0IrjHpKL/HAdzQU89NMXxDyn7JRSrdn1ZQrpjYnQfBulididQpxYiAruu+dsISMDTXFbnuGU3XEkJ2qiba94SEfhJVk4rMAncteG4O64CMQ7qk02JGfn/fPFV0sjya/Ca+x4RE4MG1qlWcmIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 22:36:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:22 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:02 +0100
Message-ID: <20231129223508.1189461-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 199f26b7-eda1-45a1-4eea-08dbf12b9d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3u5pYhxATcwkjuWjnaY/6WeM+jonmkJsI7IS2cK3VZWKj/5MOkKmFe4ZftEmfN/3uIAKxMvpeOgB5yxszwbzf4AGRQemw9ZX3Jpdn8CJgdEqlt3kJ9ogXgq8AbI6C9UbDNzFpCfsPzvtC8KbPPfkZVEMEORBxnuAC5YDcFBpfdMa6L3hu11CJTsXsFu7BYHD4R+JO4fQEGs8rWPuLKdFtj3mjFm/Ob/kTzZor2zkEQ6EIu2QmpD3EH0dKGGdDQwcLpPj9r2EdayXODjFixoSoZPwB8Z4gfUEOJbg8KRt+XYXEEoRT59nXbg/iTq5VdFMRrsX+IpKxIHlUrfN9SMsmDlNSBlscVmU4pSvRGIrKpTpKIZJE96rF3mYdXs7PbKfiTi/qMHMWiS2CCJiUZGhsKGDu+WkwaSQEe0ui5h0ajZIHi/qUzk4tf2n1Rw/okqczD5RXyRIZMlFXEgNPYmrMzYTQGAWF2qCVor30quYXB6/qxQoQC/s5OB2KRGMCfv2iBXB1yx38tXmtg6s1RJpQVQwBNP/U13bcycm/NYXPq63Ii3dzkMWD7Evms7hUAWft9Aw2gig6L1Oamj62NzXssvb6hknD7prNl3DTJAQRz7X3kq+/vzvWWL2nmm6fY7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66556008)(66946007)(316002)(66476007)(6486002)(54906003)(6916009)(6506007)(478600001)(6512007)(82960400001)(83380400001)(36756003)(86362001)(38100700002)(2616005)(4326008)(8676002)(1076003)(8936002)(5660300002)(6666004)(41300700001)(202311291699003)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVI5V01Fa1hiTUYweU9BZXRjYTJlQUUrOTlUVUJVSVRHOHRXdHVYeFZNSHBE?=
 =?utf-8?B?OEtja0J2SWRzYmRYeVZPMGdEMnZBY0UvWUNoVXpDeDAzSUoxOS9SOHB3YUY3?=
 =?utf-8?B?RmlzL1VXY2gzUWNUcVYzclpFZHZOdmZNVWN6eERWbTJUWXFLUFFLQkNlR3dK?=
 =?utf-8?B?c1RQNkxSQzJpamhMZlBxVUNGb054akVCTDlUM3ZxNCtBL1pFZ0lXMHp1Vkt1?=
 =?utf-8?B?RHlYOTA2NHQ3bE5SaHB2NzZ1ajZOOVArcHhoNUdoKy96cmVZYmcvdHJQeWtB?=
 =?utf-8?B?bjE1MENNeEZwQ3lNQkJKUHd4ek5XTlBjWVY1ajFEYVZYYzd1VHNaM3pVaTFw?=
 =?utf-8?B?YVg3RktzdjBRMG82NXNsbjBIdkdtWVhBSThWSXE4TlROcTZYcnJXYk1qUmIw?=
 =?utf-8?B?Vm1Fb3h5TFhlU0VpMS94WWthaGtJRjZWQTV3OVBOR1pnOERtQ1ZUZksrZTBa?=
 =?utf-8?B?eHAwSzZ5TTdWLzBGNHY5RHNXQXhpeXZrbWlBWTc4ajQ1TnBUVjZZSzFDMlNB?=
 =?utf-8?B?YU9SNjkwMFFUTnUyZmpBRTF5blRxL29qQWtpU0xPdUpoWDRuSEJIWlk5b3VR?=
 =?utf-8?B?YjVHNk50RlFmV3pwbXBuUUdyMVJKRFBORzF6TmpCcEMzbm4wSU9UYjQrdW1i?=
 =?utf-8?B?RlVGVitDcmhNZnJNM2Y0ZTR6N2N5eWxOWGUrTjhweGpjNkw0dmJxSUdTRlhI?=
 =?utf-8?B?djE3dGpTbWxYYzBkaTZIR1pmaVRHS1VQMFhhcnhqRHErdHpxR1QwODFqL0lJ?=
 =?utf-8?B?amx1NFFudFZkRE5ZdGpQeXorL0VPUHRCVk44V04rcXNmRGhoUU1HNFRzbEY3?=
 =?utf-8?B?dzJ1NXlqd0VTTU0rOFZwNDRRUEYwTEZPVTJvaUFraE5QaTBJeVcyUWZyUktm?=
 =?utf-8?B?WERTN2I4ZWZ5eFdURS9KanlEaWIzVXFoaW1uVlVWazh1TWFmS3FwcFpYTjk0?=
 =?utf-8?B?dEZnODY5bEFPOVI5YmR2ajRhZ2dPQmNlcW93SkxEOGVieFVqRjdMSXpncElH?=
 =?utf-8?B?TnV2dVg3SFV5V1ZQOHBsT04rSmVXWHBpeWdudUw1aUdUdkltdGVYdTJLSWVJ?=
 =?utf-8?B?dFRXYmJKaVhxNnJyWlBlTzVJY2RXeVVZOGZoQjFoaEVsM21WSnk0Y01CZktG?=
 =?utf-8?B?VjJ6RGoxNjFnei9CNTdXcVlORnhxMWFxbG8wOXFBdHlJUlo1YkZFTXlmbW1N?=
 =?utf-8?B?OFdtSkFRb2RsTWkvVmt2UlExdnRrb084bFNJbnlLdVkwSFY5NHc0eGRwcmJC?=
 =?utf-8?B?cUlFOUUzQm9zdHl1VW1zcU1pWTlVOHJLVHhJVzhUQ1RyY0tmQjBsdTFRT2c2?=
 =?utf-8?B?dmRRZTRZRDE0SnFkQi9LWnJpOE9ZcTFScklnZ3pBWlpzS2tXMG4zV1BwMXpX?=
 =?utf-8?B?UitpbjIybkRnNW51OHNDb3d5d3Vkc1BrR09uV2JCVXU2b2ZCZ0x5V29ZVldN?=
 =?utf-8?B?SFNwei9EZ05RcTcvQVBLZzVOa2lnalh1RHcvZzBxOGJOdFM4WVpyYUF4OWtk?=
 =?utf-8?B?VEtZbzVQVHFWbjFGdUd2QW9mRUZ4bVVKU09YaERUL2d6TWdPYVlURGVycFZU?=
 =?utf-8?B?WmJGN1hlTTkvRXA5K1JuZFF3VVd2U1o4R1R6QUVER0RVK1UzSlJQRjQzQ3ZZ?=
 =?utf-8?B?NmdhdWJhR2RYZ0piV2hVYzJKTTVycUlJWTVNd3h0dGlZN3FDQ2lYRDFnelNh?=
 =?utf-8?B?b0FYTFlyUW9QejhBOXBjMGI0V0VnUzBNV0xyVGZQWlhQSVRRYWdkalRqa0hk?=
 =?utf-8?B?RTN3VVAzQTgxeWludU1Xa01Bajg2a01leG5OOTBJL2ljZmdVWlBvNmE3WkNt?=
 =?utf-8?B?aGxIbTJxMHpoeU1ZdzRXR3o1K0JtT2N4VmRIQ1dwdllCYzVLck9iT2FqQ2I0?=
 =?utf-8?B?aUQ0TFZveTRjUmowVWwzREpyRWk3ckVHbXhrOEtucVViekxyYyszV2dNS1Vh?=
 =?utf-8?B?bFhHbEF4UDF2OXptYUtYbmFBZ25nSTUyNFZtRHY3OXVUNkhkbHQ1M0lOQ0pE?=
 =?utf-8?B?ejVNaFA2dDBNUWRFSjlmYmFOdEphSlhPeGVoREhMN1Q3dW1xYXlRYjBKOEoz?=
 =?utf-8?B?UlNWSklQVkt4WHFuM1BNVGx5Tmx6eFhZbUJOcWQxNnhBQXdrNnNSTGk5cFY0?=
 =?utf-8?B?Y2owSjVlQWVOSXgrbGE4YmFZamVFZkk4emlrWlozZjBRWitqaUxyM2VPclZs?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 199f26b7-eda1-45a1-4eea-08dbf12b9d01
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:22.4139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98iw+mVlKiN566YSKjuATrwnKBzxrTFSth0kfQ+JeQMPDK7KQaq9uPxdJ0MDzVALxN/oA9lKWNwdYOjmsE4+uGwoOuj80YAjaT+u16Dwg1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6418
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 17/23] drm/xe/uc: Extract xe_uc_sanitize_reset
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

Earlier GuC load will require more fine-grained control over reset.
Extract it outside of xe_uc_init_hw.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c |  4 ++++
 drivers/gpu/drm/xe/xe_uc.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_uc.h |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 4db94344bbde7..a9c71da985d30 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -542,6 +542,10 @@ static int do_gt_restart(struct xe_gt *gt)
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_enable_ring(hwe);
 
+	err = xe_uc_sanitize_reset(&gt->uc);
+	if (err)
+		return err;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 15dcd1f91e9c4..72a7b3c2577dd 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -80,6 +80,10 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc)
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
+	err = xe_uc_sanitize_reset(uc);
+	if (err)
+		return err;
+
 	err = xe_guc_init_post_hwconfig(&uc->guc);
 	if (err)
 		return err;
@@ -101,13 +105,13 @@ static int uc_reset(struct xe_uc *uc)
 	return 0;
 }
 
-void xe_uc_sanitize(struct xe_uc *uc)
+static void xe_uc_sanitize(struct xe_uc *uc)
 {
 	xe_huc_sanitize(&uc->huc);
 	xe_guc_sanitize(&uc->guc);
 }
 
-static int xe_uc_sanitize_reset(struct xe_uc *uc)
+int xe_uc_sanitize_reset(struct xe_uc *uc)
 {
 	xe_uc_sanitize(uc);
 
@@ -147,10 +151,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
-	ret = xe_uc_sanitize_reset(uc);
-	if (ret)
-		return ret;
-
 	ret = xe_huc_upload(&uc->huc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 4109ae7028af5..5d5110c0c834b 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -19,6 +19,6 @@ void xe_uc_stop_prepare(struct xe_uc *uc);
 int xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
-void xe_uc_sanitize(struct xe_uc *uc);
+int xe_uc_sanitize_reset(struct xe_uc *uc);
 
 #endif
-- 
2.43.0

