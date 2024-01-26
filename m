Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A845C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F31910FE5B;
	Fri, 26 Jan 2024 20:30:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF75E10FE60
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301054; x=1737837054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=x9GUtw1XTCa5H2r03hZ2HsUITEalu43iHS5my9ajuHA=;
 b=VTVvtYMJo0mPwd9W58/uTr2YflQZlcZdQLEJwvQpJdDIdWT6VvXdMoqy
 8P+IAGoStd3hjfxqd4ayg6TsTP844IFvIfo17cfpYQez+LPuzpriiPI4H
 XBFHU75EeBwH31WxSHPtKzLWgDoidi/+n2jxn/GmRmHjOGsy5uwv0ulbC
 ysvuAbpTSBjLoDczq1MjdxBUz0tdQlz6lXpgpraYn3wRiWZV1l5qIlm+D
 CqJM+iWKnleRieWL4uWVmCJD5/1RVsCWtz2BmwKW/2qpIec0dISt1wobR
 Cin4w+EMZQcvWiacn7hX/JWI86VF4rxaAMTWyts8P62IJ88gefFgTHqi7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9244858"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9244858"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910434215"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="910434215"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:30:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:30:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTut37cc3wy/lyTD8WyKqQkOOHqx6LYGQfhJQO+9z/BSXIbWWMhTsENAmCICQsbRgPsD1PhHvzGPjUINF9ECAAGDB6viibki1BCuGwaISB3x/WqIikUXaoKeZR+69VnKNWs/bjINQv/mYkXF2kQRnXp2DEGwsNRg/cGcxjdktJmAY2QirTYa/4bHmzpIljr3Mxqvo5xN+S9RHUfDpIZBYgiBTWomlzJYIBNzmuss/ItxKRgvfizbGKYQUQT8W+744yRsXMHz+ucMC2jK8Z/ygZr7qY6rDlOlo2lhX6ALk2TlOcKr3T1B1QTk6bUMSWMBOtgdh6W7Yea8KEBWn3qglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q6ZjIRUaIux/RDgRHVEyGJZh7XxOZQo+vJdo07lpu8=;
 b=lmuMGRzf0hxVTzyrXj91D4rP7n2BnD8ErF2ALtuqRhVoSyedEM4dZz9ykzDdon715Pr28dllYjMC7k5CG2nF5OlrXfrPKsjM4CBnEGc4JYs+qt8Emoy+U6cS2X4ioC2mP9qg0ZHlryyf40+YJx6olwPZn9RV58xSfpLKQgq3cVSIUgpZVCwFabeCPeeXiEBur5aeN3TUjITpqpi+K9ibShoyu3ByqJBGdDUTykgmYntPLlkRPQzdO8q5HZ4BqI/19qGWJay8KV8TJwa9bjNhnfYiRXmamASOG54rNneO9GFCEmY8qhj/OKB3RotNCpVvx7tbXCrMSBvQaDGbBEcJzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:30:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:30:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 01/34] Revert "drm/xe/uc: Store firmware binary in system-memory
 backed BO"
Date: Fri, 26 Jan 2024 15:30:10 -0500
Message-ID: <20240126203044.1104705-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ba45d5-ea5f-41cd-fe34-08dc1eadaec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scUPhsjLMlV5ajS2eeFjIvIzAJ15OHxZpZE009gmiZ3qQPy38aiIkPlDNU8b2zpbnKyr5yzwU4aZAW/8iyTHz0KU5DupP41fzdXnh6dNjFznr3w0HyT8YFbHxHb5K6BbbTEYvXY+pFE5sOTTNqCF0u5Us/ZbMffAInJyX/V6lOyzAhEzPFktGf15kAsHG81MyIkbtlR++dCvfckQ4W6bvLW8uZ744UvvqB1tkR1rlxJ2Z6OGIYn0HvmbMKtiU2dVZ1ERgqydzrpbkXvsQDzxa+rzls/NWLmfOmVLNFUJkamZ7sd7cVcNA8kG4K4mx4gV6T7r9sUjMNVoPzIN/eVPCsyMmDgZYGy4yz4Pxk4HB4B5eWfiRfjL9lkmF/GhifTHK8b+j9ux5vD4n+uXJJiYFqJizvXl97qp713cb8wpGUwkq6Mhail329Mk5Mis8z2w8UAlel8P28a5+5LKFDXG5rDARbYar6d67vhkH3OHmt19BkuGbmPFpqjRXWRWn6Y2vj7o1n/scIxLoHAvtMpjVAru4Zpy9Kr/hp9VB986SHlXbq6aMsmyF9TpEV56bWnh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(54906003)(66556008)(8676002)(66476007)(6666004)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkJBVU9OdTBIWmkyeE5vbUViWWNNVitvc2o2dmlaWlUzZXBXZ3RCeUc5Mk1a?=
 =?utf-8?B?N1gvYW9QWkFGeHJHOFR1dkg0YllZejZRbFZDVEdsL2NFdkcrQmNKVklhR2M0?=
 =?utf-8?B?YU1iMXhyUGZGMFIzZHVXbUJGZitkZmN6TXFreFR0dDJmSlhIOUJQcXh2Vmh0?=
 =?utf-8?B?Ukl2NXlYdmFRSytjMlZXUGdqMDhURVJqM3A5dktZdWVuQkFFNm81aDhoUDI5?=
 =?utf-8?B?OGp0b2szbHJtOEpVWEpGUVlVTEk2N2U3eTNwRUpWZCswM2J3UEF5WjBBOUFE?=
 =?utf-8?B?cFJHRGRBb2p5YktXTmxjQ0dWOTd4NlJHMG9WSDVWLzZvZTBMOTU1Q0pxTHVP?=
 =?utf-8?B?Vi8wd1d5cmp6ZUVQNm9NWVBJY0RPVVlmejZrUXhWUVJac05CanVvZ3hhc01T?=
 =?utf-8?B?NFc2LzUwZU5NdDZybkJMSFFDZlk4Um8renRSc0lMWGhiK2FZRDFOR2VSbi96?=
 =?utf-8?B?R1Y0MlBCVGU3THNmTjRSVFFtT1gzS3hHLzVObVRVd3JqSGV4SXFjbnpjbzZz?=
 =?utf-8?B?V3puMytibmEyend0WWx6eGpzWm40b3ZNUitxU3lmbk50c1ZlUnpBMHR6cksr?=
 =?utf-8?B?TFV2YmxBZk9ONUxISUpCYTNHT0cwSjRzejBXVThUbTVXaXB2ejBsT1UyQ3o5?=
 =?utf-8?B?U085bGVoVHB3UTZmWVFhemNVd3lqclpsR2tRdFlDcVVIMERHbERDYmtMRkFa?=
 =?utf-8?B?aXFqdjRLQzRQMDc1WDh4TXYyQVduNG9EOEZhSUl1VWRyNGwrbS94dGpZWTZT?=
 =?utf-8?B?aGpOWHlOVDY5cXByNTZ2ekdmQ0ZDUmR5bVlqY1Vzc0dhRjd0a3k5YVZiazQ0?=
 =?utf-8?B?bncxaW9oWkxXRXJBUVdlQ0FPaitpSmhldUI4NFc3RmtQTU10elp1N1pJbHhB?=
 =?utf-8?B?V0dVYnhFamZ2WWRPQzdVeVppVDh5OCtrQndqamh5bGY0TTNCMkhsREpIUnBI?=
 =?utf-8?B?dktVUU1jY0NCSkVNTGJEemFlQnN5UkJaa2VVb0trcWhnU1FTNEJST2tmTXZF?=
 =?utf-8?B?UmNIWUpueG5aMHRMa0ZJK29Vdm9abVRaVld1Q0QyaDh6VjRFNVczR1pCRUQ2?=
 =?utf-8?B?ZFFYQmN2bDJubDhlbzlUc25CN1EwcmsyVjdGT09uL2Q3VWw3c1k3WkNTSHN3?=
 =?utf-8?B?OGFrUStpcHRmNjM4Mk01aFQ0YUhFbktoTHoxQTJrbmN1bmhuZFNNdytnSTdV?=
 =?utf-8?B?MW1TVlIyM2NYMnp1MTFPUHR5SlBqZVBWOW5FVm5OK3crMG5DaU5WVWlwelh6?=
 =?utf-8?B?SG9EMHZwZ080V2ZvcURKOWo2aG1xc2NXRTA3MjZJdzZIbXlWSFNiT1RxenQ5?=
 =?utf-8?B?RWd5OStJOGNZTnRPZEV1NWJpZ2twcm02ZE9kRExnaVA1Y0xiaUgzdzVVZmpQ?=
 =?utf-8?B?NmtIZjM3eklKbHJIa0orY2k5RjVFWVVzcU9vb01RZExzR2djUTNKKzNEb2lj?=
 =?utf-8?B?K1JDWXA1WkxLeHkxaTZ0VXNsR0h1MnVrL1J6aXUvYzBBRkRVcGdzNWR3K2ZM?=
 =?utf-8?B?c0RHTDhmZ2hBMWlqQUxJdXhsUXdJV1M0OGYrWmI2RDNNS29WYWVlYjRuYXVi?=
 =?utf-8?B?VXZzbzY5WnhxUGFYajA2S05VODNERG9kOHRqZ0FFcTJiakZOOVcyTVFNdC9i?=
 =?utf-8?B?U08yYnBCMWwvWlozRG15ZFVyWnp2MGorMFR5TzdvbEpxOXFGZ3Q5YjR1QlY4?=
 =?utf-8?B?dDFQRk5CcEd1Z1l4bzVWaFJ5YXZKRERzaUV3akVQV2FDVlVsbnBtT01nWlZH?=
 =?utf-8?B?T1o1bFpLM1Q5MVR5ZG1CYWNVNzhtckkzMHZqaUw1Z1dxUkNyU2pvYlVXeHJH?=
 =?utf-8?B?T25kV0ZmbU82M3VoSVRkVVgvWWJZSGp0TGRySHltbmQ2UldHbHJSbWkxOFd1?=
 =?utf-8?B?dTBVaURWVUhialNJUGV2a21XcGQzOUEvSFZHZ2Uxd2NBVEVaZ2xqblJubzVp?=
 =?utf-8?B?aUdnTTBmQjJHV1VJNmMvTTBlTFRNYWRuTGpacXd2SjBRbGJFa3NZMzlaUm9i?=
 =?utf-8?B?M0toQWZhNjBSekdndUdOdHpQT3d1ZmlOZFRJcWQ1ZWt1UGZ1ZHY3N040NmxJ?=
 =?utf-8?B?alAwNlI0RGtRb1d6R3VvWXlMOHRqaCtlQWQ3STdCaHdISy9tc2dJTkJzeFMz?=
 =?utf-8?Q?STUvgEp3K8XRYDFWm69EkZx/6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ba45d5-ea5f-41cd-fe34-08dc1eadaec4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:30:49.3093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8vk71lzlQJEatcREzWTLEz/JanCNYrRPhctEoFSp3gC2ankclNKhCeLwgDtDXfY4N23/lXoh/Jv2+Yd7XW+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 48cd5ebcb645ac1bd48480cf11dced902108d306.

This is breaking the GuC load after suspend cycles where the
power was lost such as s3 and d3cold on DGFX.

xe 0000:03:00.0: [drm] GuC load failed: status = 0x400000A0
xe 0000:03:00.0: [drm] GuC load failed: status: Reset = 0,
   BootROM = 0x50, UKernel = 0x00, MIA = 0x00, Auth = 0x01

Currently our suspend/resume flows only evict and restore the BOs
living in the VRAM itself since the system memory power won't be
lost. However, it seems that we might lose the PTEs for those
entries. While we don't have that in place, let's ensure that we
keep uc images in VRAM if possible.

Also another concern is the impact in the resume latency of
this case. So I wonder that if we end up moving this
uc_fw_copy to an earlier stage where LMEM is really not yet
available, maybe we need to later switch the uc_fw->bo to
a VRAM for the final access and better resume times.

Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 73d6938c921d..2c77322f103e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -752,6 +752,8 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
 	err = uc_fw_request(uc_fw, &fw);
@@ -763,7 +765,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		return 0;
 
 	err = uc_fw_copy(uc_fw, fw->data, fw->size,
-			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
+			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
 
 	uc_fw_release(fw);
 
-- 
2.43.0

