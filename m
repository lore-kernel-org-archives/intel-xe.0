Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1266DC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A5310EB17;
	Thu, 11 Jul 2024 17:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ik/4PXRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E140C10EB1E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717941; x=1752253941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Yu9uGTTFx9FZWRUppRLuBIMKI/ySqJDkB77z0ITZ9Yk=;
 b=ik/4PXRWug+IAzS2d/2Q7MMCAvuBir99LTPoJoE5ZvrfC10HAlS+dKwD
 V1QxsB2Z3zhci4H6wE/Kjq+I1adJBVmmJAE59+crVXQ9wIovS6XzpyZEV
 o1j8h0wvn8HJI2pm9VUMYq8ZvY6uzBWVwSCZdfBwbxwmklwMFPj2T9+um
 YYcJ0l0vomRaTuZF194zrGDHuafvC8xotSeu1Gbu7td3dTD1nTp2xKeko
 xNxWCs3X54b2svor63ntG4aTGVGWYnhkrNLzV9RD/RdOINopu6fhqifON
 UecM6izw5gN5FQBHFxBSxxsG45q4LqeMeS/tg6Ccik/IOemrI+SlodNc1 Q==;
X-CSE-ConnectionGUID: 9DWYSiDPQNOhSB1yuUyxJw==
X-CSE-MsgGUID: MKhy2XiLSUa2IGp7dyerKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18238374"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18238374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:18 -0700
X-CSE-ConnectionGUID: T+0pwGSkQLGApKuXdX5g8g==
X-CSE-MsgGUID: X5sgD+9XQxye5b3yYJYkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48534264"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:16 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yi5BYBvkA0PcRGK9Km6OL9M/dhPkldUTjKZItJvEEtOOLLg4WxIFlN5kQwzlZSBqGAdCOc657GfCVfmpE6JbDWe3r/25qzZv2tRZH4T68++cxlvA2T7vW4Rp+rUFRV4gGBWg8kIeeMG/v+r6llv2oBFXeOJt0YXX91Np4vzU9+gQVGoFj3nLrEOy3UdA4vIdPo4tIUCQcnC0NZCP94JWHV/kBMEiIBRUiOW3diD6ctIkQgG7P4SOslyRN9oTcYSNouilQwhYmuLo7gky/wTGNFdAb0kLkc0YPV5+kfFGd9L9KzndSzGGWcF8A4Koz9QSo0DA6sGCgyjzSScnSWaSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHo+jmVjF+x5453r1chWN5LAAxsHrbxgHpy6l6WHcoA=;
 b=fUb1+hyfyGkCKkFeuV3BUI6BUQL7iMYiejMnzp3BJ0ZRUIlg60lVfodQTde9udiw7WzFDLNyl485MULLphTrri4BIwc8YUIrdoRWRYvPJiJO8PmRgg4FVoMXJt7F2CyoEJCXUosec/5+f4RVT3QAqtxT0QeyRnAoo6F7/Z6IK6ioL8hyN/3T0ydj0Xi99kIFs8ZLOHNGHFwrDTfm42NIA3mdzl4xHhP5MLdOixvKYPc8N0PUVy8sgu8wdu5LbEndVoBvzi/R+2sITM8tyMOsgjdaKG3vjs9jwA+oB8LV/c0UToGefB6XHx9oxf2Xg7saljkVagirjBZuJwnKLFtI7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Thu, 11 Jul 2024 17:12:14 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>
Subject: [PATCH 04/12] drm/{i915,
 xe}: Avoid direct inspection of dpt_vma from outside dpt
Date: Thu, 11 Jul 2024 13:11:47 -0400
Message-ID: <20240711171155.173717-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::9) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 39bebe4e-296b-4807-7a1a-08dca1cc9bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2qEypTlNUUZ5RNAxF8fBDk5/yYYGjY+A38mOi5lIS6gH/DEI69iEK89T4X26?=
 =?us-ascii?Q?KNTVt00V9BNcHXZ9pZ8GUduwkAzLET141GxrS1lMuUFACAktAygSaIcVoJmj?=
 =?us-ascii?Q?PhYyQAqwiqaDCRkUelZQmsqq2NxU53hyCzkHQjcg951vQ13vnq+X1ZbErrua?=
 =?us-ascii?Q?R2XA9DnjCwA7f4pSEAs7opwUVxhR73xBKE3Fuvf/95OoXXzdbdSYFRSDuXXg?=
 =?us-ascii?Q?JOKWinzya+2//92HGjJ3d07zABeykn1DqP1PxhPiXVZZJ6DGKG76iH1cOQcc?=
 =?us-ascii?Q?FgwDDZpzY61+LmE6YHGnLLEaawTrr8Tpt0+xb/2PLxEZlj5LKYeq4XvMnQDW?=
 =?us-ascii?Q?Kry5ze4xsfO5GkOHyOWOO31m+b5fgZBKZXf/WSMj7S3lEBNwVmCpIhvtenQr?=
 =?us-ascii?Q?yl70di0avsabGzHftTfqiYWZs/oyjUWFX9Y1FhGzgoNEPT4ro26CmWGGBN4n?=
 =?us-ascii?Q?42gb3mttIEf5Yx5LAZlypDeOQSp1a2sA6Nmr1RdXTYwS6zJwwOj7omkIRO1Z?=
 =?us-ascii?Q?N4XwrWA0a+ECcO3k3am1x4F5Jyme1YeO00Rqt5kSoYhNf45v1aYqeulQSnIT?=
 =?us-ascii?Q?5VNN8xQSxyH0e8ws+mXjqOFa8U/+yDDy4CXJ56SK25Yrod/HtAvhJYmlyt5n?=
 =?us-ascii?Q?HN2/t3N9xYZ20sJD1jg0DJxD3imIzDodIDelO3NpFeSGyhmXom/MvFrconE8?=
 =?us-ascii?Q?rD6L8aRIfGVL80cVKAhXG/u/we4fUvUivfwsepaZJ/tyIiJtIOfzikOCTQVN?=
 =?us-ascii?Q?sYLLZ93vhTQEcBpypakn+dX0giaDEaIhgUcxM3lsrcX5efpuarbrOzmpD2+/?=
 =?us-ascii?Q?l14ntpOpzcHgL6T3CAL92waNS2ggUhSqeB2mWrtLpgFl5g1vSsTCDSh9COY4?=
 =?us-ascii?Q?sTtCJ7BSe4c9OWvYAkoWuGeodu0YPhOHDQmNcdN9RZh2zTS/Zfpsc8fnl2xE?=
 =?us-ascii?Q?ZwFNPqFaCFQmX6Bl0UY2gK3RwBys7NQPgjhSq3xy/lhRgj2eqXkIFcpkzPCY?=
 =?us-ascii?Q?ndwyPYwngV0gEPBK9/S7/DJZS59tX9YimI5hiGHNbHGvSYAqB6uHvCobl30k?=
 =?us-ascii?Q?0lOS/gyMtBG+zMN/T6L3pcTvHpg6id+N2P5r7WKtISDY1tR5M+8mIGWcpbPT?=
 =?us-ascii?Q?mRTS2GMQtyIvJSY8ld9sLIV5piDA3Wme/d+fE7LQp06XHLuInBJ4bMHFvoab?=
 =?us-ascii?Q?A7ACrbzttPRxDiddq6vcPKnMI5oHNkHNibTlkskjzC1cIlttb5DtwMkBvkCF?=
 =?us-ascii?Q?oaU8hjtvN+zt8s6PCmsk/n4pfkuwiDeMcMkt6GQPQ8pirr+Rc7q8MQ+VN5i4?=
 =?us-ascii?Q?q+iyO3QR/bw/iHb7NWTRBFM2McTVAtK2Cd1XnmdEEonmEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+khct5AGMvvNk6hzPBL4e2JJJvMe5HX0PVLFpmCaZ2KVc9JxHULWVWRjzwK?=
 =?us-ascii?Q?J5ELB+SrzRSJjq/vxtUvf9P8RXC+3sNtUo6IFTJntcsynP9la3prjitpzNOX?=
 =?us-ascii?Q?VG5fx0tYpnfIjxg5SrrMpZrciCdK14zTAtQg4VVKXoOj6PkWkNTT/kgPGHfq?=
 =?us-ascii?Q?achBbZ/WO+tMljE5KyBIUMSd3JYA4NyXL5ljmt4RkqPxcthvHUyrkitI5sih?=
 =?us-ascii?Q?KflHZo8zRleGfI3v+qkflzvyHhMbqqKhAj2O5mHade9fsAf4YRmMoyOUzXnX?=
 =?us-ascii?Q?k94bXb3GNZzjY78nTG2SNfZQUTfqRuoTiJR+Q2Z2aTwiQNHnhQEh8Hq0fAKF?=
 =?us-ascii?Q?tO6HcopOwYoRJY3qvTWKnv9ym8x007MnaIB0KEjXOBRTpXpxjg+VN4Z30btH?=
 =?us-ascii?Q?41nQIWeQfkacV0a1Af1SAUoZutQlSN4UgKWBHsXLzW0KfNNo2Cfa6McopVN+?=
 =?us-ascii?Q?zHbghxkdGdHmXCk2qsRNRVAT0V6nT2qW0upN+xaC6C1g05IoyhvpsILzC4T5?=
 =?us-ascii?Q?kEmUEhXbPdIj0CAN2esRJ+mH7m/NLzlzPqPSHstBx9FiAHUfhsYY+MwK+YDG?=
 =?us-ascii?Q?Ve4J6+BDqJ+XOCPU1lXyn4+iUIsfzteoWMdVF9retVkQJZXDIDBSUr3It4LZ?=
 =?us-ascii?Q?Ny/tuAaHFpQ+V1UJWACSiNH7PqC3Dj/0xQMbz9CzEQpL78mdCwp2YRW4rZ/+?=
 =?us-ascii?Q?dljOROrSQFVbtL4AneZs1i9lId6Rd3Tb+Dgrc/jWVtwWXNtEcE782/aUiq1R?=
 =?us-ascii?Q?3NFG3zbvQ1Ri54jOENkOvSGYDD3oI7uV70xn7Zd/W/md1P14mC0Q+6bqGlOO?=
 =?us-ascii?Q?Tjr9s/mrdR9cjVPkkbsgyAFcpDV+CELxeVbpbQ1A8o6oaVghNZMexnOOfL4I?=
 =?us-ascii?Q?Y2Ncc03DXnNNq4gaDfTnMRSu5P0ZoYpnb0gFoYfOqwVPr2hl5OCA9qe0J+ui?=
 =?us-ascii?Q?euZ9iZa1v+uyCLSSRdARNwmcKu4CGLv9NaII2JJjXhvMzAuST3nZ+pfOzIuD?=
 =?us-ascii?Q?Uq6WBqKOicoyWT8VHYIxOXjuU/lJLuLdNrOjzsFiKA+umkWKq80iaKl5LtQB?=
 =?us-ascii?Q?ySnK+cRqkvYi8fKy6gCnNnZFnxbsgWbEwjyeKHQPzzs+mHUWhhSjVqah582B?=
 =?us-ascii?Q?y274yohyxiRR7IPe+YTjNryZoY00rAANiYIRQgd1S7+Jks8vxGnZxprzNiHk?=
 =?us-ascii?Q?qltBaQznZ07bN4TKGOLyP8gmdU2KEXGDVCN1UOrpprYp5q+RK9gr1h4XMVTm?=
 =?us-ascii?Q?zguxAsiiUJr8tozfZ3ijTHNmTKe08+jLHlz7NkU7X0CUcFaATlAImvlfAmTM?=
 =?us-ascii?Q?k0FJp51+U0egLLpTFgjCGqKvK0SpVCA313EjQjgApIdyvDKtK5WctEymXuBz?=
 =?us-ascii?Q?4tMi/QUoMnkJpI2opCtL/+I5O0aS5dRcBdpC9sLe8nhNesab8X3gemBWg6c/?=
 =?us-ascii?Q?HA90xFHoOxdQbVca8vi3hX6DHkFuI4LMTyKPO5KCmef5eA3ju1jQkhdJCeeI?=
 =?us-ascii?Q?pLjyv3fK95alyh/8VsiQTi+Kx86HLEyUFsyoYAFhkaTuFJLtX71YoCJavk9V?=
 =?us-ascii?Q?aP+FWGHTjwNm8603bB8MblZsfKYqx5pYEB5XXbKsPuHV+iuswgdMptcn8KAv?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bebe4e-296b-4807-7a1a-08dca1cc9bce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:14.0694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDCwDif1u42n0673qiwazcYeY/vPzTMtFovtXNQfZjNnjKnEvJIc+7/d/AY6M47NmcMrl49mgUC2fiWiSSyYdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DPT code is so dependent on i915 vma implementation and it is not
ported yet to Xe.

This patch limits inspection to DPT's VMA struct to intel_dpt
component only, so the Xe GGTT code can evolve.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
 drivers/gpu/drm/i915/display/intel_dpt.h           | 1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 73a1918e2537..3a6d99044828 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return dpt_vma->node.start;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index ff18a525bfbe..7336e905142d 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -20,5 +20,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
+u64 intel_dpt_offset(struct i915_vma *dpt_vma);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5a628b4757..1cf1d5c8b9dc 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -14,6 +14,7 @@
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
+#include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
@@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * within the DPT is always 0.
 		 */
 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
-			    plane_state->dpt_vma->node.start);
+			    intel_dpt_offset(plane_state->dpt_vma));
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d7db44e79eaf..42d431ff14e7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -377,8 +377,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 }
 
 /*
- * For Xe introduce dummy intel_dpt_create which just return NULL and
- * intel_dpt_destroy which does nothing.
+ * For Xe introduce dummy intel_dpt_create which just return NULL,
+ * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset returning 0;
  */
 struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 {
@@ -389,3 +389,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
 }
+
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return 0;
+}
-- 
2.45.2

