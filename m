Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B984C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5A910EB2D;
	Fri,  8 Dec 2023 20:43:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6A310EB2D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702068183; x=1733604183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8sw1M9C/HnDid6n2GhCvXUN0IcydQPohkmgXwehrmNk=;
 b=YCbnR3Mcvfp6xM8Rm9t8T/0X4hNTqPwlo+OmXBaLsuRGXr3kd8S4D+Kl
 uKshDtwqkOh+LvY9cGjKHLSoEDQjq/Vv/vTEaJ6rZoufGC3/cwqT+/WCD
 NJIU9Qw+DNjvlREHTUWD8zH4ajLo7qskaG5I+aTeB1tf33sp8iX6PqY+C
 4tBhib5S7p8fkXAeGV55BG9agBpmprxrTTLXtgBLJhxPXbVyEMZHDJrNk
 Z/0pIxNiYUjxg5y2/uKY7s1iY1jpjfeQebkxF3IlYnP+qd631k+g4kmvX
 NngV52JPsYh9pxIV+/CIkfxsXVQWKYGYRcW9S+Pu1+FEb/JdJBvzZnCq3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1280994"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1280994"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="806522323"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="806522323"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:42:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:42:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:42:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:42:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EV34HMMcyX3r/SeCmPWw5q0usXkKScVy1xevxVdk1nubryNaiqTsD0omOpUSEkGSF4zVk/62LDcRGiWvSbQYFPjvtaylKzSIhNFt4u7CBRMYm2QdbbuJxBbQIi+owfqI/KLDRMkDvlG9zUnvjQXXLTCUdcsxaioa4jSMQukprEorfLX/OQ3EU+iozNp0MtMufMDQTQBkXihKZL6luFkqFXXyQY5UGnWxTD8B0WpmXv6JSXnULyPzorhx9jJIF7AbuvP8Ds5uSjFEuMDbApkFCziN4TycGHVXy5MpuIyoT+slLjA7rjTXfW9qiN0820EEx1Ep/BjEiWA7p7rT8sp9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxSRuEYLt4FYZVRp5ovbaFJNTIU1TiYJ1Urafc4oCjg=;
 b=oDGH90lQGA7YARgtd2KkX7l5R0U/rkOdKntPABgTH2E3SuL1z58d2gIZrREDaAapoWFF90mpdiGXsZ6Wt+pGhTRW1TjGWjewFSeHDRS7MkHQ/nJ5RH/z2nh9HYclywy0uLxNiEeUXzty0OYuIUG8KqYOS6+NuC3U2XBJxjucMUW7mNz8QHMK+f3uIc/PzTUNTe7+16tOpqHp58t0qn/MWZHKTdyzH92MkGvAGksouNjTA4qKqiOTdRrxAlJ1fhQCqfQmTk/wd2NnoK1MXhbNUwiNuL7lifXka9t4+2V9Vl3K9bhF7JwxYKLmM154QJLSXTallJ5lCFqmsFNvyZqbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 20:42:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:42:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 2/2] fixup! drm/xe/display: Implement display support
Date: Fri, 8 Dec 2023 15:42:46 -0500
Message-ID: <20231208204246.958662-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208204246.958662-1-rodrigo.vivi@intel.com>
References: <20231208204246.958662-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0068.namprd08.prod.outlook.com
 (2603:10b6:a03:117::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fe8a44-f7b3-426e-dae6-08dbf82e40b2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 84xYEhIgx5z73ePsL5QcsFe/JsqlvsQG/srch7XP8ZZ6LM+TEw4dhrwZkQaaBkn8fQ7cc2gflNajdtyM8ecfyeGThXWMtWRMC+39tfcxviM7AnvxVVhcpTSIxBxtx+jpsY9sR4Xc4wNlGiV6K9eJ5MOL0ziY60zfVco/4l0IGLRZRP3GNB7JY8JzauCoxUiZPPh3GsfiE5J3JdOGUhdyXqBLUbIUlocbZHcF39mNf7GnFSndiUgkXrXsgLwXnmtLN2omxmOBq75LM0edJ9/5h29woJPAUTFE2k0cOqLQQBxwubK8XrG1XBa06mEwoSDk9TmehBUMdV33tayF0jOVM/7/+uiezTCbJzQITwLZU+4eSF1WLLWKeLBJRIK4B9Zv3ipWx54omhrWZmTf0gbOKB05zV7dsiRdwNtUtrmo2E9+PUu/V/Go4PvNAsr9SgDaC8KT2YqPL5iEoi/FeD+LfycMLGJmTrcbTRTVQarPBUYRPh69kYBcDCdUmuplF1+J9V23Qh0DHCv5q6mkzaYUZVXC+Ae4e3pYwafv3jR8aRGo+aVXYXSatl3olih3dMMA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(107886003)(2616005)(1076003)(6666004)(6512007)(82960400001)(36756003)(38100700002)(6506007)(86362001)(5660300002)(83380400001)(44832011)(8936002)(66946007)(66556008)(66476007)(6916009)(6486002)(316002)(8676002)(54906003)(4326008)(41300700001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBwvnuPnwsifIXS3hQm1u/jvlZhgLDFAJlnHT3Ku68DN1jU/u5OnE7I+5j7I?=
 =?us-ascii?Q?iOWJ28uFypQenuZ3hlTsNK29rYyYwPxKJZNnWinNyCgrrlkg2BPIVfGrJnoc?=
 =?us-ascii?Q?on6k34j6s7nhLjNr4tqG8YXoGHvixK0bFQ9rdeZ31Ukm2G9mk/5DKyMUL0Ua?=
 =?us-ascii?Q?FlHIzaJ2+YQqP5Ony8gG+MCRxtRLtCV82nViNEIHCUGVQXUKH1A+dKVYCoLl?=
 =?us-ascii?Q?y2tdiKpWaXuM/Lk0M7Vk9Z/L/cVPP8BGmq7LGcpokx6UXMlPHBNry9+OLGl3?=
 =?us-ascii?Q?Pqw3j7Ej/sX0G69QPdyuh4HTx4wZFiApiSuozKAO7/tbAgeiKBnrTxjDhgVx?=
 =?us-ascii?Q?KYYwaBL2TxYnAaRr1Fpshxs7UjHqKHhE4kv8ZgRVBLVWuwphU/slJUNgpwFi?=
 =?us-ascii?Q?4OhubNGiLglOyD4Rij4zADmhqA6zVItjJjazP44H5/4Qtz155JD9UTuTL0dN?=
 =?us-ascii?Q?LcMdsd6u5LWhE4ETBYdFbSoA0g904oOm27nKmBYOcbi5Z/Bdry5EEX2xLsy1?=
 =?us-ascii?Q?E4zVMuhm6wlZ45bw7vDhXbq4ILhH5QE374JRSNT64oQfNlMYruShp6rNUFku?=
 =?us-ascii?Q?eOmHa+38oIy0ptm9nyew/raLfdUc6t7U+RYSIekwLuNBWZTEDIaHuq835CxX?=
 =?us-ascii?Q?GJ0mYxGOth5/sOxu6YMR31CHKIXMraJiKUl/n09xeOMXYILcieSiB+cnJjJP?=
 =?us-ascii?Q?heaAlcegMQfvSiW3IyXHgx5WxCFxS5HDQwiz5J/Atesp0IyCa/74M/zhV3OO?=
 =?us-ascii?Q?tINKTdNozXoT6lthqPLmaRbN5W2j/WzGiAESXQC8PTQXq5vLXXCqHncCJ05O?=
 =?us-ascii?Q?Cc27ufPtuH4VL7INWIyrHXW/74QRFNQK2XRRVYRB1DIDAiUG2sWaIByndJp2?=
 =?us-ascii?Q?zxPSpQzHqgs9JBZ+8G8kAfoc5SQa8MbClzL1zNwWHFbl9mx9xkUPWMwB658j?=
 =?us-ascii?Q?Z3XSf/xRhhA+d/KQvkIE9YzCCOMjlUktzW19BoS83X88ATvQ2JaALPW+HSRF?=
 =?us-ascii?Q?rW/aNU7/eovcGlSw9XJQG/WFb4Pwd5kxlL1GYePg+UHFtRYzc7fTs/BBtpbB?=
 =?us-ascii?Q?rBTaEVPfLj1dTT6BF7irUPea57DHXNMX0gsDH6l+fZTfC41w6hwZ6FnJExbv?=
 =?us-ascii?Q?4D0gO+7Ul7pNq3xU8XNOZ+/XifVwbF258tAXcNGjKAQNwRSy2Sh0GU4JrI9N?=
 =?us-ascii?Q?7UTKW8RoqsX1K7b3TuWp6jlQAGe/SlpbfXbNNIcBEcqtLtGDGToNb1IGDLw0?=
 =?us-ascii?Q?tDWl6iGn7UJGioEx+DLkpUSppZdJLZGdVh7EW/IkJhMUw6f6uo6T7siNNf5H?=
 =?us-ascii?Q?nSwboy2Do9tiDABSTJyQeuLLsKCGA/QZSutJ2ul4jICt5tVB+fY/ojAlL7U5?=
 =?us-ascii?Q?RrHJVkJQQfB6HfO0lVIy3hXQ00biL9IiFd8kRHUrLTBSQdEqZbwTf4I6pH8W?=
 =?us-ascii?Q?qT13fkSv1+aKyW2a44mBhpLKVEkY5ddUh3siGJO8/DuJAMVrBspHbR26l+k0?=
 =?us-ascii?Q?b3fdlAZBJIqgOnNT3Au+7ZzqVbMlgATAWKQNVAs01Z8eLF0PUm+IeATPXnfE?=
 =?us-ascii?Q?hkeI0xgQiLcU0Mnxf/X1abQdvsyEp9J6Lz8A6TglmD+wJZPL0c+kPvCjznoM?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fe8a44-f7b3-426e-dae6-08dbf82e40b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:42:54.2889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOhHQvkcr2vyM+ITW61MFOOuk6JANbFJx++D/6/MShITp4OTIGxln/7bHHZPMTpB5BqtUYYsyhNJz8KApayUfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adjust to display changes that already landed on drm-next for a smooth
rebase.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 8e67f38e98fd..5d2a77b52db4 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -98,11 +98,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
 
 #define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
-#define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
-#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
-				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
 
-#define IS_DISPLAY_VER(xe, first, last) ((DISPLAY_VER(xe) >= first && DISPLAY_VER(xe) <= last))
 #define IS_GRAPHICS_VER(xe, first, last) \
 	((xe)->info.graphics_verx100 >= first * 100 && \
 	 (xe)->info.graphics_verx100 <= (last*100 + 99))
@@ -220,9 +216,6 @@ struct i915_sched_attr {
 #define pdev_to_i915 pdev_to_xe_device
 #define RUNTIME_INFO(xe)		(&(xe)->info.i915_runtime)
 
-#define DISPLAY_INFO(xe)		((xe)->display.info.__device_info)
-#define DISPLAY_RUNTIME_INFO(xe)	(&(xe)->display.info.__runtime_info)
-
 #define FORCEWAKE_ALL XE_FORCEWAKE_ALL
 #define HPD_STORM_DEFAULT_THRESHOLD 50
 
-- 
2.43.0

