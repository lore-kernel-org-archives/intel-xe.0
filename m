Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3572C47DDF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8558C10FE5B;
	Fri, 26 Jan 2024 20:32:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411C10FE5A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301115; x=1737837115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ydds5isSABl0b76l6El3EbemUq1HmaFRGBI0A/r2P68=;
 b=Jeo1093AhEygL6dyRf6+f7TrP7UucWn1dDYFlC/+RKPYnSKr4KAQHGlR
 0HNhs5SfbT5MnlcjPGkelhH5KYHIgGBDmv/F3LSoPEUA+S0Ob8M7xwc2G
 emUOmyBqABgm8cWYbM/BVbe8PPhPIhZE2i0D+ERBdh0tK/k1SDvSBohez
 7F+Chvydr9Ov5rqTm4OhII0wt0t0VHZn3L1GJFLq00KsrFBgGYOZ8afOj
 CRLKZMZ54ehrfFu+UrWkm8B2UohE4cd5ke6HJazL7t1jOmBijlr3xdtNx
 yhIqFOtybjJFX13ABvkCfAbg1K/1BUs7fuAOmNgjR7VpYSksUprciYHU0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9245006"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9245006"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910434640"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="910434640"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlhrAepTUYrMcx4GVN0RSTFsbkV+snBZd91ktSfcrR5LkufWCtWsB3hHmMqNXGtztRJ+9oGGCB4r9yVJiXzo6SqD+I53FZjD7yBOHtkRwWYS6K4LhTtYOrYbPJ/3h9mHYLJghqu90DLiO4h4DKYwC4VkT3diDIWQKELs4SOf93+67R3Gx4ziJI+efvg2q6qjNbKE2cBLS+yPGYtHwH0HgTRXTQqadP8jwHqq+oUYQXPKdpfawa8Me0TztbMjbkaVbVAQsDfS4eegjlDPGEoavJ/kBBeb3BIEvwxiWKuKKcn5y4/M3yGfCZz83S7E7M3wBBgl+CtCAI/3u7W5XZgY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbsGA5TGmaGFLxXQKqgGsKQaIyji6ktnIKbrHthYDJA=;
 b=Q5QCP9vydcbtHvF7rRP3/suV2MVO9Qx8LDanf9axBswpdMtXfGfqVJowvLkDt/xbcnJF0ozO7OgQWbvGvCSZTK4cU/JBUg2s/y7gSyypyee8mA2CB3m1zmvE30mxwCaW50o2AeyWqzUeq/AEAX4Aqi3N5WHFlG8hq3nJkNj4jmGteJ0DBW13S/hyYRIaFt4ipReXpd/kq/5gZLe1l+P0eYJ1gLQxmbmTl1WDNIWVub1cIv+BbDVAxMyVfnRonSFqDp48ymRZIIZkSG1Ekr8qTCM+pOaWi54CPwaLOdEy0wP8QiQOoSnmf9T8QP4GmmKaN+kD7YBuUzVTNdzGmtTLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 16/34] drm/xe: Removing extra mem_access protection from runtime
 pm
Date: Fri, 26 Jan 2024 15:30:25 -0500
Message-ID: <20240126203044.1104705-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:180::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b71ba1-b5e6-44fc-274c-08dc1eadcb54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BXFpclo7/yB32aqISkkv0m8wc73uHH8rJl6CSXVCMnF2w2NOJgaEmRtVHx6yTL3BXHrHE/lD1njTzBis4c62zJj7ggdrANGD1bA0Eqa4X4L9dnLnuetCLzjFv8p6Pd61dgx+4eDa8VDez0KfXwgapts570LxrFC5N4KfCpFr0XHH5fj/uwPFNhahqHDYgbYp96BnYG8ir06NSAdOlCI9tJZi6Kdty65zhQAP2fWiR3sweWcTPvQ8SB2eqiJvPU9aVaZUFE5UspA3+Y3aQ6ELowdVY8LJJtGSZ4bCcpHDiNfgRyQvENvbfxjPOVuYdXFruyoLZujtWUlUYcfLNl9BC07BNRj9JuOSCCkOQAnd4TeL3DNdvfNt40+PICYYDQD05LwkVz/zRaz+WF4GoMDMDZC3jB9jWp2Bg+dyRr0OGB8CY3bjJZ0rSs9CyNfHJ9Ifu/HsTZsbFoYDbJOo+N1YGvM6QHSEsyEnbKan7o3A/yP0vMHhlUk5Kclu9x29QLcOQXzxhrmJkse8y6EATihtRv9RxpUkjT/BEr+S+wEAnBiawUUgQwaaZF9+rn5EaBYV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fw1dvHoNTty9+wicAG4pOqB92ssuZ6D57q2btMxySuPAUryCoSdqYhed4Q8d?=
 =?us-ascii?Q?xKD54jaBcU8rC3wcXUPQSPY5wjHyFtpjyT/qmDjS9UCUKLFb+d7n4fgmINFp?=
 =?us-ascii?Q?iAXMfeJ0QoYGQsMNbBtyBT5XYtrpf6NDsC3bc6UNv/SZq40+lOkXIT6JkA9V?=
 =?us-ascii?Q?9LdeoVvRn2Pcde4chmI8+EEe5vGEb9kE/xWCCPb+SaMPGLbnYuzxrZg2oZ1N?=
 =?us-ascii?Q?CE7Rx4dKs4edF6siQITYodseD3dLByo+KpNxRzS6XN1X7wwhdyxSNq0sg9lk?=
 =?us-ascii?Q?j4rmxJBZOL66oQ6X7fFk1oxYpFHgyocA0kDDAtqyhepmtQ8omauHdLhytMmj?=
 =?us-ascii?Q?lyAPXyZ6kDAZvTNRE3PC7Lq8BA5iRA7/TX8XfTzma6MogWuVHwp8j8CIkJbg?=
 =?us-ascii?Q?xWmKRQ0TLO2m7xOCBEYpDvBN9LzTi3v71foZLtNmUXZFr23rh9DbqVIu/tk/?=
 =?us-ascii?Q?Zmw4plOsBgqzC4NFZPvnYdb3ff5uFw0kvExysvPhPBKIVN29UFG0GDrG8atv?=
 =?us-ascii?Q?dNRGGjRaqmCIqsHQll4uy8Gazke2ySg6LA+OV7yWn2oRbUZRDgd6fSdFg7FY?=
 =?us-ascii?Q?mAw+dJDvMnSTOuur+QXFrN4DzcIEZVIVEu0enA4VScJCsAVNNySRm1e1bWUl?=
 =?us-ascii?Q?SVZazMKZ+BZE+P19rIHpSwMOJiaFj3p67n1uA/UCa021EBRL3lpq2BbJex10?=
 =?us-ascii?Q?X73EOpb/KTUjuGuxIEuH1HnLrcVsStapRnvsPlOr58se6UNcMS+qUqnfWqqJ?=
 =?us-ascii?Q?OmkRR0LdHILhHk9+Vt7Tv/9AmSjOqlMbF6BVZd3YjhJZKDhbtP26JSFBHfkh?=
 =?us-ascii?Q?zbaYDNsJ+X1hqBbuj18Rup737Ets+8qcrzxO7okOkXaXQII4FLzKYCiba9SD?=
 =?us-ascii?Q?w8zXlIQfC6DFfOoToO5RWquEbxXfw60m63xwnEw+jJEtOT5SO0Ie5mOndUbs?=
 =?us-ascii?Q?gWRyeWgFIqM6UgDlLtuF/NbTVht+9Q/dVwmsjVLbJ5X8um8w1Tzzj2BoR0eo?=
 =?us-ascii?Q?M8LqiuRjPQ6T7AX43Ec2Pb6U98icXpPYGGNvYrmLir1EluOQDP84XF5idrRI?=
 =?us-ascii?Q?19TVTpVVLXBM+/tDKyD+X847N7ggwGnpzW3pi/6LbJjUda81U9tv+5Rkd2fU?=
 =?us-ascii?Q?ETl915r0gcbCh+D7ivAs4v9unNCRhnsVdYDB4k4GTyhSKRvScQfNxM0nztyc?=
 =?us-ascii?Q?eIkN3N1fxdOpxBCIFTkXMZJO3IX4+9ftLkwz6nV7ljkmcWl8gGZkAsqMwTL7?=
 =?us-ascii?Q?6Xg1IoPi58GyOWfSLC3E9Ri9B/ngLpdldTSLgxn1DFTieLVoPtniacbJJDC7?=
 =?us-ascii?Q?skEoU7R7/m2yTm6NkeyGLXckJavsSbvwbJw+1lRW1poAs+oNEmiWk65IuUQW?=
 =?us-ascii?Q?RMucXByF1f96gBXQfhqVyfVMKaIEthgIK+uj7ZtFYlnuDku8i/xz89wY3AlN?=
 =?us-ascii?Q?fd+QWq+Sktp9Zb/qZqS06teE1us+HWNGhTY7QlWErfepp7Y06bX6UjdLGz0/?=
 =?us-ascii?Q?Jm0V3nroMEZtErWyD+4tFJa+LfHI12HjQzCXODE0WeLvYl8cIwS4ny5LSyLI?=
 =?us-ascii?Q?sa+80bsMXq84nQTDONQfxUD2WtmcSxgOpS84aT/LTi6hkWIc3Pq5wzSg4o4/?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b71ba1-b5e6-44fc-274c-08dc1eadcb54
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:37.0835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AScFKupT/mg+V9TAEWSToGkMz1ekRIvLD/pQ/3JVl6WAVt1p2lOkvwSTeA/qnUjjtOTsuCTlPB9rrkGJAe4mOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is not needed any longer, now that we have all the protection
in place with the runtime pm itself.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 --------
 drivers/gpu/drm/xe/xe_device.h | 1 -
 drivers/gpu/drm/xe/xe_pm.c     | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ab41202ecaf8..1711d9064ecc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -673,14 +673,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
-bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	if (xe_pm_read_callback_task(xe) != NULL)
-		return true;
-
-	return atomic_read(&xe->mem_access.ref);
-}
-
 /**
  * xe_device_assert_mem_access - Inspect the current runtime_pm state.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 270124da1e00..74074939d157 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -146,7 +146,6 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
-bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d98f4bb3ad02..967d3dc0ded5 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -281,9 +281,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
-	if (xe->d3cold.allowed && xe_device_mem_access_ongoing(xe))
-		return -EBUSY;
-
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-- 
2.43.0

