Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33D8C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AD610E460;
	Tue,  5 Dec 2023 01:33:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB37110E462
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740024; x=1733276024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JLNiQeq4A/HtVKuJRSzkCZSyn1wHvqLT8dr1oLeSbmM=;
 b=NYsmo4wufIYHwAIZXwFIItbwxibX+8AGKpZ/15ZnWBGI+w6NORP4e8jN
 r0toTrdsoeKOyX7IyjTrVGF1ol6/Pkq+b0Jz0hn5BdsPeTUfN3OF1t1U3
 jUwnHWgFbNWrjfZ9LwDEImW2ov15YODUFeQ+ikpeqawYERdfSPLzb6/l9
 Vd65p7VGDu8XZpm5FCWhEpOvLbGljtUn3aUCv2TBePgYv4jC0UvHrPeT9
 JODXfFrLIAb6GEfQcd/iq/qeg36oD2ylsQlq0nGgCqSOh+ryg+MEaQGJJ
 WtRvfBbTUnOuXM4FFH6RbuUauLqbfQlLiimVMZunblYC+wiD0d0PsbL09 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="397723607"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="397723607"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747035927"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="747035927"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlxzfEKr0e7u+qPyx+4KATMUvc0oSkuESNUHwuVyUxRZO+xl9nngAlWKw4xEHbWwsaHZcFQOdPLgI5ptX/SfIzNfGf0ZTZfbUqPmljgqvuHlaBjlnVOU9CMyxc+RGClWjuuln1TZgAPNOztqWMbkNOsMmum8A21fCh0238Kzhl4dqRptvTmVCvzrR2gbMlca0QDdlLS7MCJz+KHlh1GCB3gUub5P8UrgThrLg/W8iyfip8azpMTI7lg0oDK5XygZWe5z6IGvroQ2ZLb0Qp2xyyyrSmvhFsoaUNog/QeApCVrs7rmv6RevB8uzuEMpO2tjob2EMNM+Lfm0nabJ7lhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/QXnRwFfAEFJy/sHSNdlm3p8v08ls6kX5HwdUEhpH4=;
 b=bJ4EwBILiHYx6TLTizp/hXX9xcFEJ41qcRP19szHeOoLw16ex07LhG8opBW55FySMPlpmRZT654H44Z4iR9PKqCubaODGD0AE5pUBKGCFg0JP127eiS9gB7CTsMMveQyH7EUI3AhA4YQ6NB6EETQcfGnZ077Cb9+thSCL3S6MSTrdt7gqe/ShFMMcmYlvteB6ukj5rFA5+SeFeuDfZIFfrnzmB6fN7v0BiYTcMYTslC4egdKevgth5VxB+BoMTHE+vHuMlQ7P67ZmN6hUQTTlkUjnUBGwVS6xWnCUMC5Y8/3ITdAdZRmMrxNsEc+nxp6SaWR74Wmex9CnSlgkz0bqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:41 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:33:03 +0100
Message-ID: <20231205013309.1497006-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f60ab96-ab26-4b00-860b-08dbf5323666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGxbc2h6Yan0ub2VNTjYxwKmVF/wHMYQREoyfryIIhY9EV1w4RKJaYZRNB/NzKM328SlGVYVWtS8uii1ud/fW4+GZRc8+MDoY1WiYVKpS2hYNznVmnNm9OXsWg3WtLG7StUfEg43BGP6ZgGmu5trIcpjphYp0AiqJerp8uEC8xHiyRZIW7A0GT6STk6njpb6+VTts0PMb7BOdQTvyx6qCVW4gnvMYhoBmLDVoXyoSYRYqQwU5n2unDJeRkyT2ObXiafDsNCiPOHoWGpgv5d9P4hSeDa1ASWMT75eTnNQNiyJmvo8kh9sUpukfJP+X0fiIOXmPNfOB7idg/tQ1telGmTnj8dFr+eQ5CuvjTs7UIiiKLyqIbccXuwX2MZiOrBaTBVquw3/T+MgFXch3DiwVbAsnH3Kn3xyQ2Lv55cz80CieuCP1JHLxNv5TEWFfl0OLHqq348NeOhUHsdvQzTRoYiNvvSNZd+3s7wvy0gUL9S4OVUHVyjeA/BaxU0OZdIIudWr3KLUBSCA1tGHwTT6mIq3SthaAadLpUuDiIqcN2dxS1y+ba+hEUjdEyENn2Vw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW13dGVyZk9ROFlXUTYzNjdFTWFLbm8wNkhwU2RwL041MWtWVUFXa3NtOUNt?=
 =?utf-8?B?UkNLVStjK1FoOVIzYTVSQXdkKzh3TVZZc1BpSlVHN0xsT1ZsamhrMmcvVnVN?=
 =?utf-8?B?cU9HNkFPMms4ZVAwZmRHS25Kb0NxSUpZQzdUWFBWaWZNeGtoN1RLZ0kxRUtQ?=
 =?utf-8?B?NS9lb2N6N29uR0N6ck5oSy9jRmExZnh4emNJTzVOcWkzcERqNG9VZDZYRWRk?=
 =?utf-8?B?cDA2TDJxYy9sNlF3YXJhZklBMzFDUFMwY0VURDN0OWpUVVBJSWc0NjIzZXRQ?=
 =?utf-8?B?cFk5ZmtMdm1Uc3F2TDRNQUcrc2F0OG5nRlN4V3B3SFBKcGxvcXpZU0xGNHFr?=
 =?utf-8?B?OVN5MEo4TEp6QUhuVUhYWE9mOVRtdk9xYkhLV1o1cVU3Y3pyOVJTZ3FXTU54?=
 =?utf-8?B?cXZGSDd0cmp3Q3ZMaXBYOFhZdFQ3c28zdzQwMnpxSnlJYzdrdSs5SjNyMUtH?=
 =?utf-8?B?YUxMUVZpQTIxeWpQSUdwQ3NoWTBtS0VQUVM4bXd4WW5qYnVvYm9tRlo1L3By?=
 =?utf-8?B?d1lqSElNVTlIeFlmMXMrTDFzTlpST2RIN3piVTFCQjlYQk95VzVxUXFxaHll?=
 =?utf-8?B?VmNXc2tPRG9iOVBlNE9tSU1wRHpKTWk2dVJRQVc5SHhydGNTV1RlUEJzejRS?=
 =?utf-8?B?dC9hUHV5ZFVSeXdadHpXUGxzVWRhSFA5cVhHV3RTV0Q5dFNsZytyOGdlNHJz?=
 =?utf-8?B?RnJzenpmM1JlZGs1c3JoSmF6R3VBM3Zlb0pBUjRvY3B6czduYXc2Nm1zVEpT?=
 =?utf-8?B?SExaSitsUHlnbVBsb0tWb3BEYTM2MGUxL01rVnFKT0Nnb1dYNUE1RzBQanNP?=
 =?utf-8?B?ZTlDQzQ2T1BHSUFmNHFuMEFZVHQwbi9oVkhRV2lxTG0yVlRESE5XNGRDTXJh?=
 =?utf-8?B?Q3NYTXZwTXRGNHNqQktyTk9maUFFUzdQd3ZBZWd3eTFuRFc3dFNIaUplL284?=
 =?utf-8?B?SjJ1Rk1yS3o0bU5kL2dlem5Fdm5NcW5jSEs5TCsxSWEzUitvNlJJVmEvNlBX?=
 =?utf-8?B?V2VkTk1GeUlpaDRCQjAxaU9UbElPNGd5dndaa3UzU0lqZ3VqbnBzOU5TVXVo?=
 =?utf-8?B?QktCTTlCSVpmcTlwK0N5NnBEV21ZczliNFRaOFIyTHBYS0J4ckF1OXoybUFF?=
 =?utf-8?B?ZDFHOWxXNVQ4NHVKMVNyTzcyRVoxdGRIYjBTRXBTM2ZyWnphcllOcDZkekFV?=
 =?utf-8?B?a25JSXd6NC9XM3NIWGswME85cXpsYnJkeVNVVjJSSlV2YU1VRW53d2lIQUdU?=
 =?utf-8?B?TnN3VTZMZThaeFBBblY1cDljOFZ1YS9ZOXFKaEFYSTl5enRMOUVzUGRQTWYw?=
 =?utf-8?B?TFhkTlNYOUlhQ2hCN28xVzg2cVVDKzdMMHhhR25OaVhsTEJadDJMZ3B0ZjZy?=
 =?utf-8?B?U2gvbjZNL3ZJc1JvSXNkNWhpSlp5bUQ2RG9RVjQwMWUwQ0RhSzJ0YU5ZRVlC?=
 =?utf-8?B?a1ZHTHRQSjdZQWFTUDc0Vk5vcHZ5aDgwWFJyaE5HUWgyZE91RjJKV3BDY3R3?=
 =?utf-8?B?MU1oYml0dEVscXpJQUxuZzUrTWhyZ09zZWcxM0FYeUwxK2syc2tDVWNWZWpy?=
 =?utf-8?B?d0JxT3F4ZXFXNi84emZzVlA2R3VkVStaeE1zVmJ0SWdCQmMvTTJMZWxnemIr?=
 =?utf-8?B?TnZCcWMvNUNvSytsWkFPc0RFZmRNVEtoYVVFQS9RSkdzb1lEcHNKV0VWNHRH?=
 =?utf-8?B?WjFLTjUvanZTRFY5R003aXljMXlObTNoKy9LbWdvaUZ6U0l3KzdJeGZUNFlk?=
 =?utf-8?B?QjRZU3ZVNlJiTXBybUJXUUt2a0NnUE1Ec3pEWmMybkQzVXB2ZU1SZ3JUWUFJ?=
 =?utf-8?B?N1ZJcDZnMkQ3Q3YrSGllRUg1NlY4bkVVUHFGU215TlY1b1BGd1dCTkZlQ0RM?=
 =?utf-8?B?RUIxdm5nVUtVVVJjd2VqZ2F6bWt4SU0vSWpWSlltMDNLODRTWEw3R3IwY3hz?=
 =?utf-8?B?dEl0cGcvSXdBTVZyK0hJb1RQWm41Rmx3V3FuSFB1amVhMTBhVkdZMHM0N2ZG?=
 =?utf-8?B?S1ZwWElxM1F0M2ZMeXBLeVE2dkpFS2ExMzRPdkRvd081MCtCUllhajRydXNZ?=
 =?utf-8?B?a3crTlV3ZUxZNmtYazNwQXFlaUN1Q0p2YkdFRTNxem4wZHZ3ZWVTYlV1TCtO?=
 =?utf-8?B?cFdNb05tYktBZkZPd2YzK1E2VDRDQlY4MjJpcEpBbkJlTmp3b2tjQTQ2N1dY?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f60ab96-ab26-4b00-860b-08dbf5323666
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:41.3869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sp+ftsIzVqAmrgHxAT4TQvqqMH0b8jZJR+EsA75c2nT/LxK66rq1azll8z9iLSwZhRf51gf2lXoBwAl36qzBQ96HCMMNIQMy3u8Zp0HQKHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 08/13] drm/xe: Reorder GGTT init to earlier point in
 probe
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

GuC will need to be loaded earlier during probe. Having functional GGTT
is one of the prerequisites.
Also rename xe_ggtt_init_noalloc to xe_ggtt_init_early to match the new
call site.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  7 +++++++
 drivers/gpu/drm/xe/xe_ggtt.c   | 22 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h   |  2 +-
 drivers/gpu/drm/xe/xe_tile.c   |  4 ----
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bcc10b7f23ab7..65e9aa5e6c31e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -24,6 +24,7 @@
 #include "xe_drv.h"
 #include "xe_exec_queue.h"
 #include "xe_exec.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_irq.h"
 #include "xe_mmio.h"
@@ -418,6 +419,12 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_force_wake_init_gt(gt, gt_to_fw(gt));
 
+	for_each_tile(tile, xe, id) {
+		err = xe_ggtt_init_early(tile->mem.ggtt);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0e2a41837f169..f8bdbd6010f7f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -96,14 +96,20 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
-static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
+static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
+}
+
+static void ggtt_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_ggtt *ggtt = arg;
 
 	xe_bo_unpin_map_no_vm(ggtt->scratch);
+	ggtt->scratch = NULL;
 }
 
 static void primelockdep(struct xe_ggtt *ggtt)
@@ -124,7 +130,14 @@ static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
 };
 
-int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
+/*
+ * Early GGTT initialization, which allows to create new mappings usable by the
+ * GuC.
+ * Mappings are not usable by the HW engines, as it doesn't have scratch /
+ * initial clear done to it yet. That will happen in the regular, non-early
+ * GGTT init.
+ */
+int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -178,7 +191,7 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 	mutex_init(&ggtt->lock);
 	primelockdep(ggtt);
 
-	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_noalloc, ggtt);
+	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 }
 
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
@@ -226,7 +239,8 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, ggtt->scratch->size);
 
 	xe_ggtt_initial_clear(ggtt);
-	return 0;
+
+	return drmm_add_action_or_reset(&xe->drm, ggtt_fini, ggtt);
 err:
 	ggtt->scratch = NULL;
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 3faa3c6d0375f..a09c166dff701 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -12,7 +12,7 @@ struct drm_printer;
 
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
-int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt);
+int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index c74a4f840d846..044c20881de7e 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -166,10 +166,6 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	if (err)
 		goto err_mem_access;
 
-	err = xe_ggtt_init_noalloc(tile->mem.ggtt);
-	if (err)
-		goto err_mem_access;
-
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
 	if (IS_ERR(tile->mem.kernel_bb_pool))
 		err = PTR_ERR(tile->mem.kernel_bb_pool);
-- 
2.43.0

