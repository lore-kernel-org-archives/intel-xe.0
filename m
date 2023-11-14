Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C06C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C45C10E206;
	Tue, 14 Nov 2023 13:04:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2B510E214
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967068; x=1731503068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=c4rbseYvg4yas3Gp1tyCzZZUXD9eR8JPRlQs9all9cA=;
 b=H9pr/Ogq6HplCfZXdz6D99FeCgm8T3MbRsWS4az2gnz0/qbNAdGE2jzh
 p76Wu2nkCIFRiCGxi2KnRrqxZEdaA9cBiVPUI8S/XYrJyF/ekGNv6MHaL
 Jhey0YJuUu1AT0l39lFZ6ClP0yWTFC4kop7zeWo1YMn75hJia9k6zcPfY
 DSh9MpANbczhfyy/lywgnh99jPCO6eS4/CG2L1qlTmhRfkmosuLDNKzLa
 03DEBuMIJ+oskn+14ZLBRaVdVL2dHvIIaHZnqDoE93HjHu4a43+AlLPs/
 zY8obAccDitqQKAlu8CLH1TmhvXLbTHh7v9CXh9IY70SiDA1Iu2BP5T3D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692217"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692217"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799518564"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="799518564"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:27 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwe2pRUhq6kquMSZZQ2H+4u2A+rUaMcQ10eeqcUdiI6a6O1JXee2Ddr8XuHvDMnrrQYmYlfyRv2pFcg5Gp1AD+r6AlMUQ9XVKLRA9d2Ri43kDIzEzWWXkzgb+uzg6zOxYyXyj7Kv/xFcrJ1f/n6Ld2sQ5D6dX6PYvNWAHAduUJHLlH9fNNNcJR+wpxud84nSsviWcxWUdxfHwZMHz5YKqxtraid7R12eVxHUzEyVvV2kVcNKU7hpzS15+heVxa/mqOQBh4OYh5dvGqPTbTVLh+ryPINgcamG149FpgHyVHSh4iin6upfm4QX2tLRP40B0yB0kN7EyDRDZdY3aLmu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=306hIttgX9HP0Zy04aNg6j/D0+fVGlacFmn6/O0QQiw=;
 b=gYRu4pFkc5Thd6MzDVpeqCqpmVd0JBzv7i3lMMLfo1jdtbdstPsd+vbZjPnGTVP6lJYgl3jbS4pPnavR+UEtqgBYmD1m1zc/OM4o0u7VJ3klbhyLHRbimbwAV7AegkZW29askXKjoStcmw9SmMH2SxC4aRrJECEwjvGpWEKUQObsIUvKTuLe0DUIv/Z/bIhdjLSRI9EeWRjNDMo4Ml8P7mMy7yx/QBKMlmNBphNqlOY2uoKObzIK5n4nJwa1KEt7Kdj2o8Y7FFp5hnDxOKi2QYBodZiz5+d6mjalT0B818NhsjrXchPw0OfoV7RrTxs97yYLR0xnpAvTTiUNIOLqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:04:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:04:24 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:29 +0100
Message-ID: <20231114130231.2299661-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0395.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 4326696b-c015-410b-d504-08dbe5123984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+WDAAcG1ERZFXyOMG11MZEkb5/To6Vwlkd+PVDP3QRW0stHzekSgaa2O+MPXAPpS3KetNpSmvVWxzJDmfoLASoEp9kx6O3DZF+rOwlwUZOrsHM8mVRRBaNfexgG4xqVtao9Z07wfJJcA1Y9GkTgrW0UunwoQHouh+Rc4lb4Gv05O4rmniZOJd1fU3NhJH8eVcgZT4/jpaysuhT8vbr1Pnfzveiq959Qs3yVV4WZa2yEXaCsshBb8IvVa0vs0sp7zL1Tnd3Jrr0UAiXdA8q315aujoWQEiJvCGtCWkTnLdHMs56bWoaZa+zTslN1vy3MVZCjd4hPNkvf5LYLwcZE1sMPgQvUQ1IvxeI1fr3jZoKj777zOqpZ2pJSewby/GXjFUustfRTYCmhqlb9vy1Ob7zHxEuI3bBDZGFeJvNrGNaJmoXw88qNUc4ogY+SURAg1kXPDVzRIMBHFGDYWJWXJBe0uCKATn/35YyRF34LX6+d7LxLpjV7HrLyUiGMh+qcwcExTpYh2pUdKDVrXkSLUzcs14bcG1iXUy0G/cOHJ5ZTBIhgN+QkEvPBhg4i1Joi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(2616005)(6512007)(6506007)(478600001)(6486002)(36756003)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVIxaW9FT1FsZTJIczBmMjdCdXowMW1MYjhzc2s2N0g1MEZCakVUYkE1WEhl?=
 =?utf-8?B?RGZTWW5oNTZXWTJXV2xBdGFXTHR4cmFnRFlodWdMTytVSGU1bHF5djVQd3V4?=
 =?utf-8?B?ejVsYkxvMGFwcE9Neko0bUcrUEoxT2hwdElONVljZHJhUmlqcHJ1NlJmTzl4?=
 =?utf-8?B?dzk4VmhqV1BEQmFrRG5NcXhyN1BOcFB5Y1FydnFITUNLUkJPUTNvcnI5T1Jp?=
 =?utf-8?B?eCtJaWZIc3N5Z2JEdEtqdHlmTmE5T0xLNXVwaE1KalF5emNkdEYyZHdDOHJC?=
 =?utf-8?B?czBORUhsTFdXSXEwYytrOTlJY2ltbWwwM3IwemxUSmprRUJFa2cySDdlQVpi?=
 =?utf-8?B?SC90bnRkQzRzM2p6ekptYzRFQmZoWkVjNHI4cDRCQ1NZeGtCL3lDa3EyY2FS?=
 =?utf-8?B?Tlc0b1REdlljOWpxNy9XbWR4SXJzcjZpcW4wK1RLRUFoRG16aVJxSWJiQi92?=
 =?utf-8?B?bk9JL0RTUTJieWJxNkUyK3MvY3o3M0hCS21wSnp2Z0hmUWtBVlFkQXgrRDVz?=
 =?utf-8?B?a1ZnZTZDU0E3bFc3NmY0dEJyU2ZEci9wQlRobGY0U2RrRk1LZmJ0WWluRFNq?=
 =?utf-8?B?c1ZQbnJPd0dpaXdldXRod0xVVHFsRXdkUjJtZVhySnljenFlSzlpSHk0dGND?=
 =?utf-8?B?T3JSUlVqYWRKV05WK0o3QW9PakZneVEyZXdheC9YRWltWEg3Z0gvZ0RkWDhN?=
 =?utf-8?B?MElrNXJrS0FldDhLM0YvUkNwczhrK2IrREZrQjNqTHRCZitOczltZGtGWVNu?=
 =?utf-8?B?OUdFUW5nc1grb0xiNy9wTkRDeFJXOVBFWVFlSDNieGFyUU9KRUhYc3hnRGYw?=
 =?utf-8?B?V0ZycnM5MWhuS3RXMGRNV2xWbHlncXFtSXUvUC9pckRqYWhiTWZWK213b1Fx?=
 =?utf-8?B?bktGOXloS3BWU204ekVaaHhCQ2p1WVZKTGZwdTVkWDhrVFlHbVY3QjNQWlhh?=
 =?utf-8?B?Mkd3MkdTbDA4T3ZUOTZvOXVrNXN4Ymxzblh3NnlQaWs4bFcxWGR2TGtUaW5l?=
 =?utf-8?B?NDIvZFdWMHVNZTNWRlNDMUNpVVc1U3Y5REpWc2VxSW5GRWtLazk2QVRYTVh6?=
 =?utf-8?B?aXVVK0VraDJYZWt1Z2hRMG5tZ2VaWWhteTIwSHhVUHExQjNwN2JjY29DRE5k?=
 =?utf-8?B?OWJKR3ZQdmtYcHl4Um90ZW5ueVlSWmQ3Mjlpc25hWktvVm0vd1NMR3Fablln?=
 =?utf-8?B?WWdkM1BBYUhpeHI3dndwTGVsN21WNkpDTWdveDF1MjNzNGdDZy9ZSzFaTGJj?=
 =?utf-8?B?MW1QNUFzYVNHMTV0b2h0bHZCZlk5MVJWeW5LMDF3ZEtzMlM4dVFia09BN29i?=
 =?utf-8?B?R3lPZkd6bVR4SlhnMC8vYTFLRERBQmx2UGNnNXRUNXV4N2pRZ1FNaDZjV2pI?=
 =?utf-8?B?dklMRmtaSHdwZjlMeGJLaGQwUUN4TFJTQUM2cmNBM0MrMjBqY2lhQUVVTWpB?=
 =?utf-8?B?c2RJYTZoT2xxQStQTTdKRnpxVTBlTGlzQXM1L1RNL0h5MEtNUHdUcUJmZ1NO?=
 =?utf-8?B?ZHZSK1pRVTlncXNQOWVXRUpuTDdwdG4xTHNCRmJhN2VhTlFrc0FIMGpobHc5?=
 =?utf-8?B?bjJBaFZGcGRGdEtCanEvWU40clptcjh6VWk2Rm92QXBvSmdwKzJJUDRYV0lw?=
 =?utf-8?B?eTNQK3pndVFXR0JKZUNvNG1xWXFWemZMNzFRcVdDNVpTMXc1b2JZcU5NbDYx?=
 =?utf-8?B?ZHIxMlRYTy9haXRvSUd4M0N2K0VGZ1BlWXhLRzdQRnE4dkxaeUIrdlh2UnZR?=
 =?utf-8?B?Z1FUWHNDcm9TUG5wR1VKY0Q4L1FKcXRjOHpHeTcyMmhua0VoZTExRmxRMWVS?=
 =?utf-8?B?aCtFejFUZ1NmVzBWTXBrV29ueEthRi80Zy9xRGJLNUE3Y2pIS1ZuNlhIa1Ba?=
 =?utf-8?B?VjRRZnJRNzBSNndJS3RNbDZPb0M2MWN1Z0FBMnJoOTRMbGM0U1p3SUNoQ3A1?=
 =?utf-8?B?dThVUTBpcCtpMmpZNzlvaFl6WlBobFEwdWNRUlRqaUZQRzVBNERJTmtKQ2Yz?=
 =?utf-8?B?dU5uVFhibWJyblpOSGxUd2NkTmtTZDVpNjN1ZWRLRDQvaHJaVUxVUUw5RWxR?=
 =?utf-8?B?Qk1sZXFsUnhNcHQxSVpnVWh2cDVwQzJZa29Fejh0TVdYUzBnZlY0NzNUbXJh?=
 =?utf-8?B?Z1d2dlo4ZVcvNFZJS2cwdzIyZjd1eXBBMnBpOVh6YmxqR3dmU2NFS1dpbzJw?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4326696b-c015-410b-d504-08dbe5123984
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:04:24.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoiclKYoxyML5JDR28r1VLxM8oN6r5bf5DAAaID//04jn3ZEG3AQwk9H2r0wHKLoTbP2roTWgCE8LHRevaaIOL8NfRXLcFAkfOGZ7bSUV1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 18/20] drm/xe/guc: Allocate GuC data
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

