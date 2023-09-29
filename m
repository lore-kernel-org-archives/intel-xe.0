Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFAFE71D33
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 21:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77610E13D;
	Fri, 29 Sep 2023 21:00:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4EC10E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 21:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696021253; x=1727557253;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=8ziBfwWdCO7xgxnoSxxDsBNpFIfD3Om57YXtj2lZbxE=;
 b=iMT06fd4pA2cDRe5hAa46s3JA0OYo6fTwoZDU/EP9QGHNK1Wn8BqB+Ix
 58f7q5ZUh3VtvEiljpHzunuCiwFaAJx6tPKaQutfVmCUC1F+ZfwjquTG7
 o7jll6eEEaAdSFll1PrPRFwmw7L1fLSGopfalh1nWJkHYRsgyKmxY1oX4
 1qQw2hjG8lYwzUQT6mwk6W2QIMPtSA1p1JIj1nSjf9+ee5woKzOO3HNeO
 v1HxBc/tpdhlhT0osz0796VtosfLiyEI+SVk4Q0AlFklA4f8TS3OKTkLf
 GVh6P6wmWNKwkFbOKJJ+gMsKk/9AEJBuvDlnhE0uwgUOIOmmqPFQHht4k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367435213"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367435213"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="779382849"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="779382849"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 14:00:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 14:00:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 14:00:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 14:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnS/smuB8LCrpRkSYT1ZTPkKALqIhOi03PSjgiQq+AGcfbVGsTJqs/AMUizVHJKu9j3oE5hCojNL6LHFiCbCpT2VF17/8cp76mkPGsu9LQvfLsNznX79nuZxHNlUSeT+0kFnWij8lvmhphXQM9pBxUvwvQGOV5KdvON/QQxuZFQmlI2LF1I95IH7SGlAbDcmTy3D7t/Z2iNx5BMxEoUVwNj/0mKLKTw8REapaLG0sOa/1/igFGjivy6ca5J6V3X4BhfYozAnJMJOqKGZuHqobmq3NZPObsmmbPeaWYYz1MwFGO1lBt6OyW2xMarLkqNVwwCospc7pjDp/F+c7xAnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/gba2PtMiHZKBgDHGCBNlDXgSUhqjaAk16STuIet/Y=;
 b=Wozc+KheTLJ8Iqm7hAMVRxm7kuN+aFuzsoEkbkvvzhj35mR90W4/8rYmfiItHWzq0VoAq+hBb6DnVVh9D8w2b4QQrr5i/8aO2MZznc2fEQZIfmNzDMPHiX2uHFWgJmCfDKQMKS1UVQ0Dy89xzPwIPC0ElmZSs2NZFTpAMSImeCyVo8jRW4bZpgiQKQqz1uFu8NtAhjVUl+Dyuk8MG01ZihW9f64ckAT2Nw5wLEXOPVB3hPQ6p7Go/752uuFwZkuxkmrsd0qcqEZXhnpp6GYJAZf3bvYh17Wv+nYC2cBqUmFdmw+6MIcRC6kWbnS4VGdE1uSRWpdBnPc3ixkNRmiNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Fri, 29 Sep
 2023 21:00:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 21:00:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <jani.nikula@intel.com>,
 <uma.shankar@intel.com>
Date: Fri, 29 Sep 2023 17:00:45 -0400
Message-ID: <20230929210045.1202987-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 310ff529-1717-45f6-ad5c-08dbc12f2969
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FtpX4n8fjuG1M5C51Tz4EVH9M67fdl1WZekPKmI2cONmq3Rv0pl8loPvNzsYooMol+EFUFKoMBe9YJF6PxIAp0WXRE1WLD8amUApGDfXJRxTsA1OSC3uVV+veey2Fsbcr9OIkUUyzcgxhlvgYennwrafzro02l429ZFFspZQkHtHz+tWFABBrGzPFyzfnfBRtP0EyedqEjtLkzBF3gxjkuxMqUtxhcAX0Ye+kL2TkMpy5vkEw1tJY4H//TYKKTescC3H1kKLtRg4aNQK4Hw9NQaoBPWfVsaRvWYPESlnEUy+nRUVn2bsnGywiygFaX+4kdOGtUt76Yw3VZbCGEHoCVl7kfSE99XWWgKfm4wN/sdoB3qp8gI8IgiTHglpU+U74pj5SjAQIujpoiV4KdnasVj0Wq2LzCegNTmlreqV8R9g2gPm/uoBLe1i3vgiTlJQHwKos7ShmnppCxYTetWIFeeKVF+UEgzTAoe9I0+RfZMI02MGlyqqBGoTxYZsBXs2CCa79jiElZl/qxXV0KSLpQkavDa2N5iN/Qw5lnPPgBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(83380400001)(2616005)(6512007)(26005)(6506007)(478600001)(82960400001)(6486002)(8676002)(316002)(6666004)(44832011)(2906002)(107886003)(966005)(8936002)(66556008)(6636002)(66476007)(66946007)(41300700001)(5660300002)(38100700002)(4326008)(1076003)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TDc2cGcQAziASJyE/251M1WdSd1kKeSQM46IuC817/r1D80JXNELmImpWdON?=
 =?us-ascii?Q?+I7Y+PBsd/eX7nbvkLECvCXxIBSCNgQr6S/QgGM+kk4IXag/T7TmrvYkMGF/?=
 =?us-ascii?Q?kH74Hryl0UAmKwr6A1flJyeYcbYoDovfSPIGsriHOsC9vNuvb848opZOfDoM?=
 =?us-ascii?Q?69IAq51wsRFV8MV33zSOZJUZIcChUWQ28BtpXP8a8+oadWeSJUbL3WJ7vePx?=
 =?us-ascii?Q?xGYsGCcIVrx79+0/c1t9qp0G9YhzYrAAX+B6qM4kSj/cKbplIK1C/TD/FRMv?=
 =?us-ascii?Q?dyWoRXvReHxApL1W3uOA1HaoOiDzlABIhx1k9PRwi0QhSpw82OvVPszIvCza?=
 =?us-ascii?Q?FV19TEFk7HOkkWruQpjdc44OTPG6A0JV6imlong/XW/3rM701Y7q0uPgEEXv?=
 =?us-ascii?Q?AsvHIEbl76xxmBfnRQ+mCkQr1IDRPDO0FUdXrbkgWIQ84fQ0E1hThQ2l9oub?=
 =?us-ascii?Q?Aq42mCZuhbskCHtt3An/x3HkFb3E6TQtBrXKwudjDVTq2RdIP2/KDzQ1vnVq?=
 =?us-ascii?Q?umKrh3vHmXv9EujgUyHcCymqdGO/rH6BG7q+b05JlWv5nOnS3ki2475QBHux?=
 =?us-ascii?Q?i2gYVMeJZ22cnuJSS/hBsUFrbNqtrGlOikzyNNYcqYoGMV758I0UCzhyEp1E?=
 =?us-ascii?Q?Bod2xu1bjEplKQ+epLySlEUrR8Cg1ajUYCmifCi1bWUjvD4tWoccsR2hicnf?=
 =?us-ascii?Q?+Zn3lCSZoEqyrsapjox7KUkDkgT/3FTE05gClcn/+iUZdrzxsAwAMHDZrhOj?=
 =?us-ascii?Q?0ggescAcX1oNFb4ccEhx5wNlu1TBNcEjBmqmBl/7jDommApzVnVpu1HYI7Lt?=
 =?us-ascii?Q?6doAc9qwkwhEbt1jA8Tvi2NYEb5SB78zun+MWEuMC98qqnyrg1AxSYP/WI1J?=
 =?us-ascii?Q?fva5foLbYZeAILbN//iGKZw9UpFI3fa0uC/gFXoj45S96/wrL2BbaTSNjDSA?=
 =?us-ascii?Q?hq/EkhB22Acfs/dZoW/AqMVYlSHySQha5mNOzIpHioTfICkS3P0WPzbJL4rc?=
 =?us-ascii?Q?HRNOa0inH2a0zkL+stl+K4dwCvVNBLcHD6L1DkXCSSpYyUL3jFxAj/gvl3Sb?=
 =?us-ascii?Q?HXr3ucdFOiop/uSSWQedNlUKKoWIhsNZ/2eX8ztug5fM/4ZmNaYz/3i0w9vR?=
 =?us-ascii?Q?VH2hagCGInC0/3HoWLVxT33cvJ2X4GyMkg3jLJ5UnwnPQlCrYF+INjtlYAkw?=
 =?us-ascii?Q?i7MZojwIKbUz0ra+CisqZRdZ4nunCfkM8k0e0BqWeVKzLpiW+7bmo2G+LQs6?=
 =?us-ascii?Q?mKChhQexh/+rc34/ptuz62f5NfNDPpDbJyZv/M9TUM6uPBYmH52FA9okD4LG?=
 =?us-ascii?Q?G1YQLIbVpye1czPyJsfRICO7fwHe4oLOwt7KyHq0YB8oDJER51HzHWW0DQDK?=
 =?us-ascii?Q?eVAGHRu3nMT7KMVc6eOkvfwVtsOwKMXHYxirVmKkh9FsgfuxqIPZSxuigtbF?=
 =?us-ascii?Q?SS5gX+2ZaAMBm8mOT3yu+u14dCjdxCSS1IseAYiPX7dtLavv/AJ8mD3GGkMq?=
 =?us-ascii?Q?USPsluYERSJxDNqG1CAmvyloKKQ/dYiGwfmiWPBscZ5dprlbh/FvxonnKG6G?=
 =?us-ascii?Q?a/2iI3TsEK4VXvSqpON7i8/IcHiK4MPWhudVHOlH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 310ff529-1717-45f6-ad5c-08dbc12f2969
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:00:50.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yg3ioeli8b4Pkgs/qDegHg3d7QGxKuoQdhJNIH+EzOku1LwQ+cfSiDGQmJf7AvAmNpejivFp/WWja82euvwqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] FIXME: drm/i915: More display ugly wa needed
 after rebase
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

This is an information on a new FIXME hack that is getting into
the tree after we complete the rebase on drm-tip.

Also this patch is needeed:
("drm/i915: Abstract display info away during probe")
https://patchwork.freedesktop.org/series/124474/

As well as a local fixup to:
75:  f1e2775bd1c4 ! 551:  ed3617c0414c FIXME: drm/i915: xe dpt integration
    @@ drivers/gpu/drm/i915/display/intel_fb.c: int intel_framebuffer_init(struct intel
                        }
                }
      
    --          fb->obj[i] = &obj->base;
    ++#ifdef I915
    +           fb->obj[i] = &obj->base;
    ++#else
     +          fb->obj[i] = &obj->ttm.base;
    ++#endif
        }

Thanks,
Rodrigo.

 drivers/gpu/drm/i915/display/intel_fb.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 8492a2be5b1a..b7ca195ffa65 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1939,6 +1939,7 @@ struct frontbuffer_fence_cb {
 	struct intel_frontbuffer *front;
 };
 
+#ifdef I915
 static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
 					      struct dma_fence_cb *data)
 {
@@ -1949,7 +1950,6 @@ static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
 	dma_fence_put(dma);
 }
 
-#ifdef I915
 static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_file *file,
 					unsigned int flags, unsigned int color,
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index a76e562e24b8..4c28b663ec04 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -208,7 +208,9 @@ static void intel_frontbuffer_flush_work(struct work_struct *work)
 	struct intel_frontbuffer *front =
 		container_of(work, struct intel_frontbuffer, flush_work);
 
+#ifdef I915
 	i915_gem_object_flush_if_display(front->obj);
+#endif
 	intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
 	intel_frontbuffer_put(front);
 }
-- 
2.41.0

