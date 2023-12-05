Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE58DC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F33010E45E;
	Tue,  5 Dec 2023 01:33:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5FB10E462
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740032; x=1733276032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fhLdl08U7K1S2z6GqnLTuk+CSEUUuntE1TpyFKwUiPM=;
 b=eWOjKuZRP7wTjb6oM3EgN/N6LLdtcbfr4T1qRc+Gxb5e/7VYXb/Bc1cn
 prt3DGt4wXZLPrb9DM4U75g73mnGEev0L10KaEipY3gjZLwn05Bg9JRJQ
 WftYrF+YJVa4yUMCblZ2jUesP+XeMk4v2l9U9AP9Qv+WYIKptJzIQ1gy9
 5XFm6HFQqGYXmtMQQvU1D+iud73UOpeDXLu+SAyTl+itmFBqty/2tN8Js
 dsXYdz6ooAVRP5jpGh4gCQudAoB8Ghun4KRRV7YQq+taejMJ09f4VBe9T
 bAzZsECaLKtlUgCS6g2rlSxfQQlc/Z4eqo29x4mfThk4t20HHNGw53ERV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373268847"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="373268847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102277689"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="1102277689"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:50 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 17:33:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljHS63Eqt383zilQ4zFbQ9D42/aBPZZ6avzkoTZ5hJkQKAYaa+3f0exbsjC8ciK9TEKR9lUqPn338ArYwSPks1EeqE37XCp0PEkXQpLQBBHy3l9YlBkcklgfpIs86KYxBywHd2mbUHwpf+QoKafTLyOLU06RrVK/IRbANhvCoxYHFxRnofR+k3IwR+rySYwM/GgtDY1L/4szTTkVjOysw/pfkZim8QyRe723Fniv6QDWyqfBNexC5ur+iNBZ5uYQfM12KYpRf8t9Qdcp+PLQcUm/sKnDVaRZtNvDo83wxEzyTuOFrRjRQ6tfA+QO9/RlTLHuQjkWkuXsMThgzDrlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LVPCQjFzZCOUjUTlYN2UQnexGQGqdVcfDaTIxzF+EY=;
 b=Bwj5PvtB2X/ZH5x9wn3laOi1oKeMr2DMqMSOfbArXCZXsOMkqr1sJTi+w3KUrXluMNDAQTN7TOMwslqTsg2U6fde1CjWz+azUv6Iz7YG9ID0QQkere7EfRz85VcY0NuH31MQAurvKcuvuBjx1bM6BmBR/ztWbKnCtaxhSj0pypbgZosmRmh96Db4bK5U+SNGN0PSSFHaToCCa/CEHft4+IbV9hvLrOtEsaAVWX88sq+849YAm1GD/TzdlgvQWMm4LUpqNN9RL1U/Iz0tZQfX/IC3tn2EiFjgDqDMitbukwMjAWvEeGUDdiwsrmiyWxOruxxuFvIgWwxRsA89K+pGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:48 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:48 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:05 +0100
Message-ID: <20231205013309.1497006-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf39e74-b868-4885-a2c2-08dbf5323a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tq95Pw1GzykTjWZRo8pFyEbA/KvnL9MD2/LdHgmeCDegkU9T6kTxJtfJ7zdzeyViA5QEO3YpdluxAghDGAwI1HjYsBB6YNtdbTO1zZn2NLe6RsatVdPOk7y/KooqrS0VpZ7L+/NlBozJayx3yV14OdaJ5sxiDD9QLQSnJ59c+QNDDI9Kq3Ugy31q85hWjnffkHS1qr2UgWtizNfwdAxQmoYgp0hf3TTLH2hLvT4nXIPH3fArj4cbR4lMXF0jasCE59jf61G+yKgwXhBHSeW5Fh1jTCpFgQGYZTLMSbCSGlVAHGkS8Giuh7hWsQfapX01vnQCFSZ3VTiqXqIJ1sKFhXj5/akCv8cwDtGbcZJLl1xWal6e9fp6+wlTU7/YRYwvOXsrVchmGladK7yjBuD0Yvf/j8hkT/ZRMn7/UN0iXgjQFJxpLupbO2RZ5DUhehdw9ov0jbAYXXRPv7BIC7Q40WdNs0Xe8ilt/oTt8Z1Gf/1ZDyY/hUTeURXYFrv34YGWIRf4RCebiBwiEA1FfPP+l5Wptqi/YNFXwiHn8hdiRpB3tsc5fyRSe6p2IhlgWkJZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFrbnNmRGJDdHh1ek9yR3lKdWkrRmdYN3k0MVR5YVBlbFBQUHcwaHJjSVh6?=
 =?utf-8?B?SGkzbzY2QUg1Y3MzZjBTcVRUOE9SQ1IrOUV4MnlpZ0R6c05kTUVaejNsVUxh?=
 =?utf-8?B?S3pCUEtCcTQybHBQSk5pVjFOeEFoQ2RuZFVCSE9jY0tWRUdBRWZWdUhyQ1RH?=
 =?utf-8?B?ZDVMekgxa3J5RVIvWFJhMnpIQXlWdWQ1MXN4UnJIRDBUL2FFcXhidGpVbTFR?=
 =?utf-8?B?TTJKeWxZc1VBQ2pXQXI3aTB5amQzUVNkVUlCK2RMc3diU0N6SEo0RkZLcTMy?=
 =?utf-8?B?WWdoWm8wWE52TnpGand0dTlieHJPeVI5U0JyVmZJRHAraHY0cisrYW9vNm1l?=
 =?utf-8?B?YjYvdEZkRTl4L1ArdXRHNnN5VFlJamgySlQ0UTNHTFQ3QnVYbTYwcVUzakM2?=
 =?utf-8?B?aVpJWmd0NDVJNUtBU1E4bm80VjNnVE9WRmppN0t3ekZhUWxhVFJ5WVZBSzhR?=
 =?utf-8?B?UzF3bDFKUVJ6a2JaOFlVdjNRaU5LL25kMzlJeXNQQUo5a2k0OUxQVzZ0RnJ1?=
 =?utf-8?B?YTFUb3FVSG43bkRRT0UrcVVOcU1CbklKK1UvNGlIVU5GWTVpTnErVG4wdzcy?=
 =?utf-8?B?WURFSWFUOXhJVnM1VVlpdVZBaDRPM1o2R0lURllWUjBwWWV4UlhkVkxabGFo?=
 =?utf-8?B?d0M2K2IvdWJmUDd6Mmgvc0Zmb0daWkJqRnQ1M21Ga2U2SXp3ckVZei9PV1Zw?=
 =?utf-8?B?NEhKdmZJWUVDajBwaVBLd1BYaFhKdjZ3OWdKRUlEMDRiV1FNUDIza2JKdmQv?=
 =?utf-8?B?a3dHdlpCWi90R3RvamNOYk1IeDh5ajdYZlVaYmhheFlzUXIvRkRLd0ljR0tL?=
 =?utf-8?B?RnR6dHZkY3BndUZHeXBOejFwUmpUWDZWTE8zZXM4RzlxKytIaGFTV0VJMWdv?=
 =?utf-8?B?dHVjbXZxMVg1Z2MraW9wcUQwK0duSDV0UTVSMkdiQkErK1UxWmNPeTNoR3hl?=
 =?utf-8?B?elc4Y1NqSUc5UExTcGJ5dlNGM1N2UHErSWpJZ3JSQ2hXcUhieEp1cFJFV0ZR?=
 =?utf-8?B?RGhLdTFPcmlvcWJ3dW9XYTNFRzdISWFkOUJtN0pxQUtFU0d3eDl3UDVHU3VG?=
 =?utf-8?B?c3JTODNSVURpL3dQd3ExZkJTNmlmSjhKcmNEZ3Zqbm51Q0dJZGZ6dy9zWVRn?=
 =?utf-8?B?L2ZlbGJQSlArYzh1anBqTTYvS1d2N1QzbHluVDRHL1BCTkkrNmo4TlNONmVy?=
 =?utf-8?B?ZlQ2d2dHSzRucjJRUzh3RWlXc3RBZnUybVZZVmtZT1ZxczVDRTliSHgzQXpo?=
 =?utf-8?B?OGIyOGxDRW1UM2NIVDB0YUdsRTJUbFVjVmZtdEJTVkI3YnZMMXZvZFBGbnp5?=
 =?utf-8?B?NEpPczVGY3lpeEh2SENhb1dRM3dwRlVkTkJJR0M5MldKeDhsK0s0czM3aVh5?=
 =?utf-8?B?MnNoTVptZmk4M1R5ZVZKWHc4bnlFR290VUcwVlE4L0FRd1JqUFJOazRZWWFl?=
 =?utf-8?B?SURGeGlmQTcvMmxzSmNXekRzeHNJR2k5ajJ2WU5sSWVzVG0vY2hlRFZFcTlN?=
 =?utf-8?B?bzdaZWJlV2Z6WkxmS2ZrV1dtWmc2RlR0dlUwdnVwR2dHc1doYnlvT01qMkkw?=
 =?utf-8?B?VXRJNExTY0VRQzladFZZb0ljaklkOUxnc3JGRWJ5QVczaGlab1RIeFdQQ055?=
 =?utf-8?B?Q2UrTm9uVjNVVEUrSk83akw0VDNJb282NDd6eE92RU1uZHRSYURtdW01MmRO?=
 =?utf-8?B?enkxL05aMW9JWDJ0UjVqa0R5MStQM3VpbjN4ZzBwN2pML2ZWdTZDbXpIU21D?=
 =?utf-8?B?c2I1Y2JRbURoSTRvWnNqZFc4RHZ6NFg4RHc2SWQwY3ViMzFFMUJrcWt3ZStI?=
 =?utf-8?B?dnhCdG5tMWtvVU8vejlod21TaEdGdUVybTc0N1o1akFUZU5VYmEwRmwvLzgr?=
 =?utf-8?B?cEt4cGU4d2pnYmxVTkZVUGY0TGliaVVhWkRBQnNEcGZISnZHMFRPQUxwKzU4?=
 =?utf-8?B?VzY3OHk0QjBVeWtnQXhOWFZMdUxQazRmbjZYM2M0RE1hQnJpc0pSZFVXU3F6?=
 =?utf-8?B?WkxYTWN6Rkc4dktWZ0tqUllLelJDR1dTbEdndS9mMS9YdGovREtidlpaeG0y?=
 =?utf-8?B?MWFWYlFjSkZiSnBMbGM0TXorUG91NmdFcCthZ09pZW5xclpFV3hjamdoKzNw?=
 =?utf-8?B?REdKb0wwakFVeTJhOUhkYlBEVEk0Yi82Q0x0RElMZS9YQStCdVYwNmptQkpD?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf39e74-b868-4885-a2c2-08dbf5323a41
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:48.2218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dzCUuumhqt8AQ4mYuJO+t7wJzVBPtvty7fyiSIKgrHy9cD2bpK+TLT0EPQwSFINnjtmzxvIUtSC2zIf1vzegbmbpsd1WxBzPaTEcmq5X8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 10/13] drm/xe/uc: Split xe_uc_fw_init
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

