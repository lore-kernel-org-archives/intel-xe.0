Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565FCC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCF61131CC;
	Wed,  8 May 2024 20:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KM+XfLsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921431126FA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 20:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715198851; x=1746734851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BKwA4AGzEl0/AkpGlNHE79+2h5K0TKBlpulUKyo9hQ8=;
 b=KM+XfLsCqykrn3KFPSrHOxN+boLtlVlLd4NjDLnJKwvFmQsMOrx97AcU
 vL9PgIG4qdbjW7q09Jf0JnfZvHb0kzTmmc1pqHsKiueuw+J54swlS1i/t
 9O6SzXH56Zdg1t03ORnCe9hJ6HbYhsIDyHmPEicG0bAavBskZCm+pOjgF
 nfyRVzRq5FEXPSfbjhsliFA6EXWMzAHyYBV3zu5F22Ut7X5QdMgMYdPkW
 KpPd2Jt1hqEoUyNzwsJJ5Slqt3bReFmKs9rxk1BcRZcv+Zb+oYoeo94AJ
 9+nSmK7s9gMOABr+pcRnl5p9mYeunDBaOIIc7iM5oeF4XGh2JXfRuJ2c+ Q==;
X-CSE-ConnectionGUID: qakCeic+SUSA7Jk0yx/EBg==
X-CSE-MsgGUID: eVkS87zpQ2Sng+3Oe7aaTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36466735"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="36466735"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 13:07:31 -0700
X-CSE-ConnectionGUID: QtryWMflQOOABHPJls8R8Q==
X-CSE-MsgGUID: DNEqG3WrRzi3Fw6Urkiljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33515557"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 13:07:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 13:07:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 13:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtZr87blJT/dOKN06gC3MupEgmFfDar+ZImow6o1xLAPRNBUilvcXiVKqUGI9DySa55hEROZBov/79jIWXloGDjg1ATxgCvAKsPdLpF2b6JiOTVib23gROf+/M87QXKfdb4kV1/oKRdICTRviTu5iFS5Tc6Zw1rwxkLNVKXOQ4aB3ZJ4Q1fFSl/TFM815QZHn9sbnMNgyHx7iaDPJYQ3vtdZUlQboKNTaJkOnIrO5W+k/E/CCKb1SnTNAl3O6ubv6sr65/SfhZRa728j4XdsYfSLNlkIKvKQx10vV+Hv+RVYGqPtxsYCHdumAj7ufCdn1yElx0+v7UlIWPim6Kj4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5muoJG61hLhLLlZ4n3CVwYPrWD+H7p/gKmEarrzCAK4=;
 b=PPqrvtnQ8uqEXm2TfrOnzZcGshOKWuNWfk3CmtMLFGkJ1XnJB7Vv3ZSS+3whXOLbA5r1BLV4gkYUZfUggEJcokCgzz9IZ5PUSuJGDzff4x3MiXCjFES3AqIv37fyssRH3vgXQMwLvz6JafAS0ZpwK3fgLH7FNdeQZEXiclJOdL0Cxbul+Lr/7B2KlRzPthgJwOQ9JcZn5qY+9WpQj6H3BFz3Y26FFa14wHaS11WlQlOzXlfn8mfCvEpV57ZGYrBL8Cpci5Xrrih0LaFo2vMf4nyVqF5Ed7GFfMs4e7mKzDNQi8OWX4eC9Zg5OWILRaJHzWWMMhwufIWjWpbUKHnJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Wed, 8 May
 2024 20:07:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:07:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH 6/7] drm/xe: Stop checking for power_lost on D3Cold
Date: Wed, 8 May 2024 16:07:06 -0400
Message-ID: <20240508200707.375414-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508200707.375414-1-rodrigo.vivi@intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bd1f47-9fd8-438a-9c7b-08dc6f9a7c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I03YC9CQCx7acT4KLxfj4FPMCKMrBgkg8xq2dM4yZrJu6SHFn4HOS7v7yQf4?=
 =?us-ascii?Q?ezpj8ya7qoDoZhI+up7T0Tth7RKpm/2pd7+rYp1yzRCDCzk/LTSQwSVYVsmH?=
 =?us-ascii?Q?zpaAr2Cvb/Q5kyeyv+bi7HFwVDmobwxZXbgYpPnRJSjlHQFfcWJzfuRtQXvU?=
 =?us-ascii?Q?cwyh7OLdyXwzGVQnMJqsEQBvtf5FQzFcThYdqh3C3ISmzoQfYp+3VAmOClm2?=
 =?us-ascii?Q?YjGC2mz93FFM43q7y5M+hSD1IWJ6y9yirLCYwaAOgyijQJq+mu4iXCdavxE6?=
 =?us-ascii?Q?1YLUxYlHC3dEd0NBFRz2wbgmnm20BDAsSjbfwh1qTefHRX2yOan55j0zhQ2i?=
 =?us-ascii?Q?x9uOlmsqzj7GBxLPkIB1I4AkP/eOKl+wzp7KyWo3/ChRFYfX1VCb0CpWSNvK?=
 =?us-ascii?Q?gO6+DskIMzMJitlSUFbBaGYcu7478ddumdUw6BoZy0pQLfHXbQpJ3tqU1UeP?=
 =?us-ascii?Q?wiAw75KCBtMeQIX8vw/YbmFJBvlx3xd69+zgakZynuTzfwLoBVPmMxv2r5Al?=
 =?us-ascii?Q?IkxvVFRHUengff3fBwHDdmyUy4RnpNncA8aJ+FvcXXxtGzfPIo+PSr1OYNx3?=
 =?us-ascii?Q?lgW4rYay135NxyCjVo0n1ejrRzFShEM5tX2H0nQzL6gXHIasy7yI6TeaMnZs?=
 =?us-ascii?Q?8uJ38wnEUvuQm5xksFDIK33wC/Q4GjQSEvBycAxX2dLHdDmEATk3mxvzzPws?=
 =?us-ascii?Q?cuFe7c0suH2sUaIae6l81el5Mge5iAdKY4BskIwkoaEaIKg0WzeORa5VKtrL?=
 =?us-ascii?Q?4SRPHBNIvySorl0ndJ9jLkH7MIyPaJQ0oYj57k/bsKWm3lnWufkBqHXk4S80?=
 =?us-ascii?Q?i4cxljeypXj7NcjzHKxphI1fRfHFrAZaNRt7waN36y4ZKy9h6gK87PI8Xk4E?=
 =?us-ascii?Q?ub9dsQP7HAGCF0AFxHEZYJu1XrSNgydfISL15rpyDF1+EC8+DfwIoXBdnGDf?=
 =?us-ascii?Q?bUBitCB9k1n5ZDk1o5Gge7t66LmI16arorTkjKwHoDb2Kui0tzELFDx8GVrz?=
 =?us-ascii?Q?Io2Zq3K90noOD3akZHGODjSntpoVSKMIFxqw3Irc2Zc6/h1S0eBqjKEoLw3A?=
 =?us-ascii?Q?6vuhE3zM3wyIQJkOnq9GE3gvokw/mDv7YxjGVCkmVRQ6C6eAWBzSY9HEkVBo?=
 =?us-ascii?Q?+VT870bI+kLW4t3q0uRt8K+clgD8F8IBweFiSrHAD0FjJ1kUXCTBplGkwK94?=
 =?us-ascii?Q?LYLwEyWs7HldUdGIXEYo6LI7D8fx73RyUaTnJ991bYhXNhC2TSWIMCt+hdDN?=
 =?us-ascii?Q?A4JHla0Eon8nU7XBhgVo1uCB0mZK+uY0WTIwfeoEuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oMbTiknogCkI7nYT1o3XytHnQF706QEedhYwPY//EUdwALXmBN3EUu9Pvste?=
 =?us-ascii?Q?pxevKhFUUVBDcWVI+/4/PiCodAxLQeh7wCNMEIRUZyA6Sl+R7GT1w+lUUt50?=
 =?us-ascii?Q?NZ9p7Bz7Jkl6sPFJeqEGBky1PAB6zveyNx67pvNtFP0I4UMNLEhsgT0u+bOd?=
 =?us-ascii?Q?BsAICGyefjht0mpryCnrcxW/GQUu2dLW1kyapaJ7mYA9i9SYmVv0paYtoHDu?=
 =?us-ascii?Q?6LwZZJszDsdQxcF6PRjRAb0bRAfquK+CeoXFfEJVNFwavB6w03LrcLN2D/7V?=
 =?us-ascii?Q?qvJu3/E5mBMhfD7VuFdxZggibiWR9O0i6689gKqMh3QA5Dv9/Fxa9WDUFVYq?=
 =?us-ascii?Q?nfsPcAaBcFKSmK/Ll/cpZtWxDNRjbuUsvd0bWQwPFKRUtOBVMkRoIrmV/D9Z?=
 =?us-ascii?Q?bHyw8CKMVsGoktmQYVFsla0akGUqEYZsdNjjNfuTPoLZlqzO0ol8k25Yd/JW?=
 =?us-ascii?Q?UtSi+/QOLWnBs/JDU6uYaWPdqIIk0+Vthf0b161KljEY3mBnphM1QUFs0nbG?=
 =?us-ascii?Q?gUiKqpMonA4fgufvCf4QZT5AklKQz7MJY2tBB0kkrF7MjjjlflfFdBOGLw9c?=
 =?us-ascii?Q?fzGFEdgYCz/qbxvMT+KVWwgOxjhbZCi85LZ0h8wx39d1pur0XpY0ail/UYJH?=
 =?us-ascii?Q?vpZtvHEjDrPS3sn/nppoPIgYSTC5CGFQ450kJzTSRMLVwsYtxdE/NrpWw5X5?=
 =?us-ascii?Q?pSRzWBa2DFoIMC54bPEIvM9LUnahARgxUYQMmp+3SVsEK5bfhJlcUI1aYACU?=
 =?us-ascii?Q?lu3Gd1k+fJhM1p5xGya02Rn8rC1PHUn1BEFqJo+z+n2u6+DXC95FFVFq0z+O?=
 =?us-ascii?Q?OnDDZZxh459BgYMFlnm1wCZzjnb1fu/cZ4+5JGoZSn19FcHv+VM9obYpjYaQ?=
 =?us-ascii?Q?OvpDn5wHF2glGeXFTQGC6H2wrEihkzCXgz6aZ7VFx6hA5K49ooOYmu9e52cf?=
 =?us-ascii?Q?mJK2TucNE0WLkywFYKHLcJlRGx4FAFUdVUSRHFus9mHowf0r3C7emofgx9T9?=
 =?us-ascii?Q?DFQmXN7BhzLIlBJ5ppPzlo2JM+acVyXARl90taEnhYYvyuEOOqkm59Zrt0ip?=
 =?us-ascii?Q?VzKtBOGpGgczKX3cxBIj6Ts4ZwyOOWtTq0mMLmW966gM2wkDeYsP2sT5rtHP?=
 =?us-ascii?Q?pLPUD94fPcjTLp3bnvYa/nZ7eIF9PCJ+KajOgoKobX+ZmPj44+rWkM6Hecdu?=
 =?us-ascii?Q?6Ew3rFg6MStJoxocmWoeX+p7uLJm6Y/CzY0z65/OjHC5S1q3v2EtFlPm+LDU?=
 =?us-ascii?Q?sxUlH7E843OEk3A10xbEzEaQdse5C7TafzdtCEcmHpB8MZfgGnYk+9ut8/YF?=
 =?us-ascii?Q?LHWT0ogSJ/7K/bqC7Q9Gh11IvOU9GQjptgaRIhtcoJ0EtP6SDiquY+NrQhI6?=
 =?us-ascii?Q?Xl4+KEOalYgetT47oCFrf8dhn1WTnAe2ksiZyHRgK4IYMwQQRZ9i2RJ887Qo?=
 =?us-ascii?Q?kDL34J2fFStJ/PL3q14vxSmaL8/087uLrF8hwIePR5R7R6+VB5kH4WFJWwlz?=
 =?us-ascii?Q?sa8UMyKqCPiKEzAQBp9C2Rh6aKxTq+oRWuPpNUrNpMN2i9cHwl0deV+FFXMa?=
 =?us-ascii?Q?Xym6/33SBuZY62ent5Tf2xaFXdbcmkwlxCT5jaiLl/P9ZHwdhmfpusA9IVDr?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bd1f47-9fd8-438a-9c7b-08dc6f9a7c6e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:07:28.5966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeBg/YGu/u3kHXmfFgqiTg7891ovKcBslU1N3D5f0VhzNUSrhN9IkFgbxRNCv7KDnRplXYNH0JkaBn3UYV5DDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

GuC reset status is not reliable for this purpose and it is
once in a while ending up in a situation of D3Cold, where
power_reset is false and without the proper memory restoration
the GuC reload and Display will fail to come back from D3Cold.

So, let's do a full restoration of everything if we have a risk
of losing power, without further optimizations.

v2: also remove the gut_in_reset function (Anshuman)

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ---
 drivers/gpu/drm/xe/xe_guc.c          | 27 ---------------------------
 drivers/gpu/drm/xe/xe_guc.h          |  1 -
 drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
 4 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 906b98fb973b..471c848b2638 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -431,9 +431,6 @@ struct xe_device {
 		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
-		/** @d3cold.power_lost: Indicates if card has really lost power. */
-		bool power_lost;
-
 		/**
 		 * @d3cold.vram_threshold:
 		 *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0c9938e0ab8c..7860b720a99c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -938,30 +938,3 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
-
-/**
- * xe_guc_in_reset() - Detect if GuC MIA is in reset.
- * @guc: The GuC object
- *
- * This function detects runtime resume from d3cold by leveraging
- * GUC_STATUS, GUC doesn't get reset during d3hot,
- * it strictly to be called from RPM resume handler.
- *
- * Return: true if failed to get forcewake or GuC MIA is in Reset,
- * otherwise false.
- */
-bool xe_guc_in_reset(struct xe_guc *guc)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-	u32 status;
-	int err;
-
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return true;
-
-	status = xe_mmio_read32(gt, GUC_STATUS);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-
-	return  status & GS_MIA_IN_RESET;
-}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index a3c92b74a3d5..af59c9545753 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -37,7 +37,6 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
-bool xe_guc_in_reset(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a2f5a1b11cbf..de3b5df65e48 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -404,15 +404,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
-	/*
-	 * It can be possible that xe has allowed d3cold but other pcie devices
-	 * in gfx card soc would have blocked d3cold, therefore card has not
-	 * really lost power. Detecting primary Gt power is sufficient.
-	 */
-	gt = xe_device_get_gt(xe, 0);
-	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
-
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		err = xe_pcode_ready(xe, true);
 		if (err)
 			goto out;
@@ -433,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
-- 
2.44.0

