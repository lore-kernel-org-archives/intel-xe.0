Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93053C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F1B10E584;
	Thu, 27 Jul 2023 13:58:28 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1964A10E58D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690466305; x=1722002305;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2ccjwSyu7fJoqNz3F1/saRg1lJ6upjuGLiE/Wu/AGV8=;
 b=hmO/YJadSfXOGFuLboem3u7M11dAQupyeJ/yYPPiEbGqNlIeApNOn6Ko
 w/ukwWagRL/gNWScO2gZoeiQDxmKaLmhxjjYvjkVui7SYF1oCAE5s5jW9
 komYASSZNtXKLvDGksLKT0hivkFQU9ZUuTFG/tI2eHdh+DrKTlrS4aAro
 kIrWXzQsHgQx7n31dM1mRW37EN7zcCnE5Z4qGL13jSwntia2NRNZkvcxz
 g5DbgWIJjkQNcWs4vUWgtexiYSmbVEr0IpNW6Tp3HBu1jRlCH+vwQQ7HG
 M3ITVr/eC0lGZMR5fDts977LfNu9BHJD3VFqvcIRi9NY+/NjDUKVyKU40 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353227492"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="353227492"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="720888294"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="720888294"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 06:58:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 06:53:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 06:53:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 06:53:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiXgVefaRM1m/Xgz6Qix7n/g+cpEi0XCmqc9OQZBcz9Wk5m8ZqfQr61X0G1rs5GKGhTDbSiEWBgLpFYKo6g7HDCo5rIuMD4x+y52rzjsfG7FRDcRV0rDreVBkzH3horAR62Cc07WG4HA5tJIPz4GwKU/5kbWcHgX1DIqhOGxENS9OpouS3a+1CojCUPeAjds/qX8Q+GMYkyPl4rpYfCBrMv5VqtTT/ycQ0RO98VuTsVzuEwYsXWpn78Tn26syJANHsbIkJ3AOBdA90ciVE8Ou9Y1CeU6hmY6H/niStQXN9gz2AcafNXeqegWom3QFCge6TthFqoGKhGhPstUIPi3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8I3oF0w1GKzpe0cOwtPJZ1T96dsYp7j9GRRnCvkAaaE=;
 b=D8SijZkLI5FitcY5YahnPSwcmBBDAFHrrD+9ZnzGysNjEFC1V/CcD+A6a0nCU2TNVPNDdt2YUuYjVmRSrk8Fe3mCH7tS4weDfcU9NG96vRFQVWwrA1x9dSi1LWud4EDp9ZgPkNp2I1sGzrQbcCHtEYoIW+EwH3XH3UUDj6Mrx3+i+jVFIoRIoW51+zw+JM24/uHHdiAHGhUKau8v7Zo85KsiHk6qdt+NP8OycS/azFu7PPIZDn821IaK/bCrI2wi47Z3ZgTxnp/OcDeNUoiVOkpeLADrn1gldQTjvO/l78aAvGcn1WXNmO85FSw3a3mtRowg7zWun1Bbr14t8WMp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 13:53:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 13:53:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 09:53:34 -0400
Message-ID: <20230727135334.403255-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb5dc40-f178-4c7e-e6fd-08db8ea8e1f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdkCflLEEOyDj02dMUselHEQgWmsTUqykTgjSg6nIpl56FwAcKDvzEIzB5Q+fu+QZKG6vsXu/uyQaFOQjvhPgDQ4CqiihFA7yufu5VjHwmd53GVAiutiTQ5gEs3I+eVQXerGV2C4n07ABTaba0fUnveEle9kSVJyaPQUZZLuiMpVb6zbqCZDLUoUYfZuohgME0WMS1r8dmSrPqQb7LedVXq1KUaEXftz/p2rfpmwXlqtnoVhk5idQuufMQGGAB18hYbv4/FhL6UEIiRat6JrFcvpVpp+oGUw9Vf0tSRWbOfRCzxMPwIJNOP5f4/3aXOi6TICp+BTYKef/EgI4Hi+8yXEgxhdO407LkSNwvp0EP/BRUT1YksV4my69BjN20fOlpnJgkL3NVhPfaepgd08CCzchaYj0LoOLUCewJW0ZsId7GChwxGBrWEVITX5qUV+TuRKBpoENRBfafnk0c8lmQ/pxQG7/uBFD9/79ZLkg6Spi5KWvbQ5TCwSofUseuYFChc/JS9VZrJQIdSdZP7BSYV5en1T+AvHEwGcNI4kYZbwJAeWTQMXCLqNtPjSH8x9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(1076003)(316002)(26005)(6506007)(8936002)(41300700001)(8676002)(107886003)(66556008)(54906003)(82960400001)(66476007)(4326008)(6916009)(66946007)(6512007)(478600001)(6666004)(6486002)(38100700002)(36756003)(2616005)(2906002)(86362001)(83380400001)(44832011)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PsMp5oA9OXkpjg8f2S8cB8bTV/TthgGVXm7ewYuqLHHqfJJSBXnYvzOXpxSt?=
 =?us-ascii?Q?jP3595+URSn35i8VzzeLLHdc/jTibfaufzzUgIxBqzRkQKoGMPzpTQibLZQV?=
 =?us-ascii?Q?07IcTP5SfLc/HVlTOXSQlF//3zmq+qSsAieiHHF8xoiYwao1OevXp1VZRjSf?=
 =?us-ascii?Q?jzFlBUv2dh9m07mS5xhsw93YKChFyDKVKTZjea1AWa2aUDDDN/wrtUZMWeUa?=
 =?us-ascii?Q?RmR43ygUqicbnwqpO6nydSU4W1XwKZKdYbYDc4HrfuG+L60GBlMBgYFzlX4r?=
 =?us-ascii?Q?uhIYjCssV1YTQKNpJZXdsm62UY/QkBgyD9CEqhsatoqp/ppBcrCSsLaXB33w?=
 =?us-ascii?Q?JnrUVYVp5MlIT0L0xZhtSQ08G5lAz4xqV1gGo0HSv3Ss7gzOJrFHGUwMvJfF?=
 =?us-ascii?Q?3UptmKHot5fWtQZWwNmuGAe7aPiVma2mraXD7XVTD56Y7MPW+su2ntXcGmoZ?=
 =?us-ascii?Q?4VS7aA7xo8o18k12AhFMzdZHgcTR/ih+SMTXdXiAt8HE2fnRt9Jyikm16hqj?=
 =?us-ascii?Q?j3v9rn0tkm3ar2KK+Qj/erElGd1jPf6KbuehiWIVXW8jO+MSBbbVol4qzSKY?=
 =?us-ascii?Q?GNecLIpthTb2tUgwaaAxCddE1vdBEXv9mRYJm+wisWUHHgqsUXSf6tF+ORAI?=
 =?us-ascii?Q?FkkA8jSm+MCjVdfmRSi0WaqghCOughRsVBzeCiDbhoOKM6jULsx/ToV3WS7l?=
 =?us-ascii?Q?xIm2YO6lo2oPfDxXt+BLPZ2OsRGkUY3QOOiW0JgDxKf9AjjHN1+ExNtwrO4h?=
 =?us-ascii?Q?uqTdFCMl0rMZV9jMRuXSzwe3MkchxumrHqItvZFwu0vlbeDfFfUJDwbOOJ72?=
 =?us-ascii?Q?bFIzvbijHnJgfjllr5aTyLTH/aL9SyCkHR5arjh+H9Quo0gDslw7QzqxmyHs?=
 =?us-ascii?Q?lUUW+asexteXmHusyb3HE7oGQeRUFqYxwQ4Hg0OcS38x6sVOH6WtKhdyDq01?=
 =?us-ascii?Q?dNY2eGEDTvHBh34Jv5GFGVqu7oWY2ddipDdu3NuBxTPXJGVYV7cBYT4RpD3H?=
 =?us-ascii?Q?8gDhLj3F5raRvT4Z4SP3fe0wx47IoG1oCRtMFgsYoR3g4PLweGkjwTzhCEEq?=
 =?us-ascii?Q?Rq5jpCTWfRlDuXzEJEAYl7NP/bkRTdcQsLZEyeCoIHKHQveWHTfvvKMf3p9B?=
 =?us-ascii?Q?ekvbz8ZRuh7ATZ7qJfyW05J51y9erZInG7uUcGGW9Mv1ulMAS1FkJ+h3UuLL?=
 =?us-ascii?Q?PYLM8tqbwHFl18vme+cEH7JXIgRFobg6BUNVElUDQ0gftuntMRGfK1l3hgEP?=
 =?us-ascii?Q?OrD5/aFz4SCjP5aEMKn3T7qHn0B+yChSnHGFvEMgHYcWPtW6BUFSvKLvF2Ng?=
 =?us-ascii?Q?OlgNNM+m4AYvCF5oaJrMUWhgsMMPrFgjgnXx+qLOxrYpiDJ9e2rd7Jkfj+/9?=
 =?us-ascii?Q?0TDtInT6op1WKretvlz6tHpDSoe7XFMhVA+Ca9Uo2mA2C49G4dCzT42barPj?=
 =?us-ascii?Q?XIZT2P+lMo1u5gy47XjNL7R4/fKKmgy67EnhLvQfk59gip7eC1tQ+z44w8/1?=
 =?us-ascii?Q?92AmCtT7NwkwJR5DMOOI88PrL+Iqf5awhfqOOEkEQQpfI/f6DZwZLl3YTkEG?=
 =?us-ascii?Q?K8qgLbf/uupufjUNGyGLWWD3kYnofUGQvE9onYjW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb5dc40-f178-4c7e-e6fd-08db8ea8e1f9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 13:53:40.2155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUUcL+6uoOBAG7lM0/lS2Wc4+WINRF5RkRjIggXYVcQSO70n9r3toyoMGGqMMsc+YJPVWpk1SpEHKRaGzBZe0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Invert mask and val in xe_mmio_wait32.
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

The order: 'offset, mask, val'; is more common in other
drivers and in special in i915, where any dev could copy
a sequence and end up with unexpected behavior.

Done with coccinelle:
@rule1@
expression gt, reg, val, mask, timeout, out, atomic;
@@
- xe_mmio_wait32(gt, reg, val, mask, timeout, out, atomic)
+ xe_mmio_wait32(gt, reg, mask, val, timeout, out, atomic)

spatch -sp_file mmio.cocci *.c *.h compat-i915-headers/intel_uncore.h \
       --in-place

v2: Rebased after changes on xe_guc_mcr usage of xe_mmio_wait32.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h |  6 ++---
 drivers/gpu/drm/xe/xe_force_wake.c            |  2 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  3 +--
 drivers/gpu/drm/xe/xe_guc.c                   | 25 ++++++++-----------
 drivers/gpu/drm/xe/xe_huc.c                   |  3 +--
 drivers/gpu/drm/xe/xe_mmio.h                  |  4 +--
 drivers/gpu/drm/xe/xe_pcode.c                 |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  2 +-
 8 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index ec2d4885bff0..cd26ddc0f69e 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -90,7 +90,7 @@ static inline int intel_wait_for_register(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
 			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
@@ -100,7 +100,7 @@ static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
 			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
@@ -111,7 +111,7 @@ __intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
 			      fast_timeout_us + 1000 * slow_timeout_ms,
 			      out_value, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 7403673d532d..aba0784b608e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -120,7 +120,7 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 static int domain_sleep_wait(struct xe_gt *gt,
 			     struct xe_force_wake_domain *domain)
 {
-	return xe_mmio_wait32(gt, domain->reg_ack, 0, domain->val,
+	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
 			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			      NULL, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..bb7794cf2c1a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -456,8 +456,7 @@ static int do_gt_reset(struct xe_gt *gt)
 	int err;
 
 	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
-	err = xe_mmio_wait32(gt, GDRST, 0, GRDOM_FULL, 5000,
-			     NULL, false);
+	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
 		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
 			  ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8ae026838702..2530b6243661 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -290,8 +290,7 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	xe_mmio_write32(gt, GDRST, GRDOM_GUC);
 
-	ret = xe_mmio_wait32(gt, GDRST, 0, GRDOM_GUC, 5000,
-			     &gdrst, false);
+	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
 	if (ret) {
 		drm_err(&xe->drm, "GuC reset timed out, GEN6_GDRST=0x%8x\n",
 			gdrst);
@@ -386,10 +385,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	 * 200ms. Even at slowest clock, this should be sufficient. And
 	 * in the working case, a larger timeout makes no difference.
 	 */
-	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS,
-			     FIELD_PREP(GS_UKERNEL_MASK,
-					XE_GUC_LOAD_STATUS_READY),
-			     GS_UKERNEL_MASK, 200000, &status, false);
+	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
+			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
+			     200000, &status, false);
 
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
@@ -639,10 +637,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	xe_guc_notify(guc);
 
-	ret = xe_mmio_wait32(gt, reply_reg,
-			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
-					GUC_HXG_ORIGIN_GUC),
-			     GUC_HXG_MSG_0_ORIGIN, 50000, &reply, false);
+	ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_ORIGIN,
+			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
+			     50000, &reply, false);
 	if (ret) {
 timeout:
 		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
@@ -654,11 +651,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
 	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
 
-		ret = xe_mmio_wait32(gt, reply_reg,
-				     FIELD_PREP(GUC_HXG_MSG_0_TYPE,
-						GUC_HXG_TYPE_RESPONSE_SUCCESS),
-				     GUC_HXG_MSG_0_TYPE, 1000000, &header,
-				     false);
+		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
+				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
+				     1000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
 			     GUC_HXG_ORIGIN_GUC))
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 373a65c77946..dc1708b4e94a 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -85,8 +85,7 @@ int xe_huc_auth(struct xe_huc *huc)
 		goto fail;
 	}
 
-	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO,
-			     HUC_LOAD_SUCCESSFUL,
+	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO, HUC_LOAD_SUCCESSFUL,
 			     HUC_LOAD_SUCCESSFUL, 100000, NULL, false);
 	if (ret) {
 		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 4953a9a3f1fb..d24badca8677 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -107,8 +107,8 @@ static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
 	return (reg_val & mask) != eval ? -EINVAL : 0;
 }
 
-static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val,
-				 u32 mask, u32 timeout_us, u32 *out_val,
+static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
+				 u32 val, u32 timeout_us, u32 *out_val,
 				 bool atomic)
 {
 	ktime_t cur = ktime_get_raw();
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index e3ab1d3a367f..7f1bf2297f51 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -68,7 +68,7 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 	xe_mmio_write32(gt, PCODE_DATA1, data1 ? *data1 : 0);
 	xe_mmio_write32(gt, PCODE_MAILBOX, PCODE_READY | mbox);
 
-	err = xe_mmio_wait32(gt, PCODE_MAILBOX, 0, PCODE_READY,
+	err = xe_mmio_wait32(gt, PCODE_MAILBOX, PCODE_READY, 0,
 			     timeout_ms * 1000, NULL, atomic);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index def19e64f2c1..a65ddae6808c 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -484,7 +484,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 			_MASKED_BIT_ENABLE(dma_flags | START_DMA));
 
 	/* Wait for DMA to finish */
-	ret = xe_mmio_wait32(gt, DMA_CTRL, 0, START_DMA, 100000, &dma_ctrl,
+	ret = xe_mmio_wait32(gt, DMA_CTRL, START_DMA, 0, 100000, &dma_ctrl,
 			     false);
 	if (ret)
 		drm_err(&xe->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
-- 
2.41.0

