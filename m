Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0366C46CD4
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DE010E252;
	Thu, 28 Dec 2023 02:13:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A15A10E262
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729625; x=1735265625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eA6EcvVid5Qh1it2hkCYLN7eXOreTEQEL16/GeSwVVc=;
 b=mf/Y/rWelx9SoAOph6wbf6+kDRCSPIC69+Qosk3aIfkKHIloLihWkX06
 t9CM6vgNwqmKQmiwiQAiNiN1tOxbsgQaO+NZo8c4hgfUYs14NfGzSQZAh
 1cr3CfxPSQwOUJBTIin+j1bszHzdZw2ibIKq7orBjEQFT2E9wTm+ZDUy6
 0pFHtedY9vghye0OFC81HNJcgpKHn9FMD6Qk7KpPtW3s6G3WOGSh41VeL
 cajLadIbu0MYg/fLhp2dONOzRi41T6r3QPGe+GpOEmy8NBzJsvZbwvAnY
 PSXCYFO3BfyW63TiACHHESF8he1cIc+h2mJqZKdFRj6SUz5Q9mOeYpeTy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="10062211"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="10062211"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="869014376"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="869014376"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:44 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gutu72JDPDbb7XslUJxkLYDsSEhZ9klVJQ3oNVER1jfQ5SAEjl4JRHFFz8picfexFWzeQunUS72Z1p34Q99la+uDW2H7LM9HD6nGqI2Bx7q/0lKfFnM3ddx9s6eBS2Dye9IMuQ4VFVCHrsbAG8rbZWGd9gU5TgWAgaBMnX/2hE/ARJUa1t6uvvnkptUKt8yJWPrrpIGDyV2V3FGwLXTSu4x2iR13IlW5hokFahEBooxOs5SMOg1L0ssrKzAS3XMmlYAEKpZkTIIBWmZdX6glJlb+oyJHp5fVYXmyn4joTGZCN0DBvq/rDO/OxriArdRBlWN1hlkTN5A1yydJv+fVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dal5mFYNqfgaelA3NoHEARW1boaiqd2fGa/B99g9BWE=;
 b=cxVMoWhIqLxPw+RmUt2udCdroM0uLdzbPeeF6DCf/Cdw9wBtb+bayFozlD8nEpwDRlCQj5w+F3sYo7Ako4AL69/mPj/kB4EESuE074g6tdngL8hiK0+sVca6INtFwV1DXc4fqBfIIbnxKKIzOQJlsO91sCQSTcLX0NAFlC2dm2RHJMuQLCsLDvZNc2dX6X/3xcTOUPFToxYrSFS1pIxkd5nGk6fjuiR972ltOi/yEwV6SReUh+ow+FqzQwTztJ/UNFBP898+bIIvz+/5ssSDmU6uhZvImMv1dTtq9wUezDzYQ1jDwxjdUfCWez7Vuky6MsnydSZrwkHq8+eWSJmSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 19/20] drm/xe: Remove unused runtime pm helper
Date: Wed, 27 Dec 2023 21:12:31 -0500
Message-ID: <20231228021232.2366249-20-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:180::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 16303fad-0e41-4f25-28ac-08dc074a9ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INWca1tSEmH9yVNWyA5zDOfSHZ8c/KhVe3ptJgZ7990J+QlpUeeOBBxhNq8qoDdQJlkAhNd6BhdDYM1V9ZnU+85fptBop4EEHdEnahDVuoz8KWbl8XHpSKyHHKvKuZrMiWoMMXNnNdH9Z+s6zESntZFPsTdrzSud1D4oiO/S7tn5ARjs/REPw0zpUPxuNPYCU1oZpzqdhRPvYig/MjYwW0qTGWwpt3lfE80PvE4n7zTlwvD6ve6QcstFHmjWW9icO4Jsk1Qe2S0J70nQvlWwTQgab+mEQCkdtf7vt0nMeTN1CKSOpZDtCapzGzXpVpWZk2tg73mWsrPBgZGtei1EXApx6JsT4QeOboaCQumC+pqyEmEbiVMFBceWxR9TSlWMlImcbnO3jeCXRcjF8SMcZlkziVKja4V3xaTiGA8dvmVqbl76gd+jKpSX7irriDxD4nSgC5MFC0yMwomh2NOIGDa2FTtw4tuAC87ox9BMnAlAWrjVTmoRbDTTk20WE3WLMUYK0LP1/tCo7MvWRXNwRVnE4lwNpYeFQdrnlLcVSb3T2tvHQGoVUw/hEdETeLdw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xcPbCcwGIm4jxdyNsk+Cjpjbjr9HFTK+REn6Xmd0E3+iRB9pqCjv/KjWigNA?=
 =?us-ascii?Q?yXC9E/OJDv5xGYcFdXHI5LJItc8CUuf5nzJ0wszOp8yaX73vdx71CyIBXb/v?=
 =?us-ascii?Q?q/UnT1tQvu1rYcW1ZII5Fv8JdvS4eWvkMCxpmFThLnpaYVTsDOnLLQxNnEgi?=
 =?us-ascii?Q?u3rYQF50z9lpsCW3ukCrDKlJG3gY8ZKCeuUSBeo3u22r2/4tyhOQxj/o6gao?=
 =?us-ascii?Q?auLlXNQHaD0uM2pZV3Gm7M0/f93FDFAXpGgN9sdJqqaZFgKrj4x436fwiyji?=
 =?us-ascii?Q?CTbPRTJYSgOuZysHd1wG5YhAT5IeKBW1uILr7R1FXNPCiu8ROy8e9Tq0kIT6?=
 =?us-ascii?Q?p/iEzk525CqgGio10Td146BqssiJK0uydzr6x/6nuZV8szLoMVNV0zg4Darl?=
 =?us-ascii?Q?+TdBxK5hZ3sJsYqPsdL9Fs9oFpEr5rILt35wdioBmINgbuulC4phqdSr8tsN?=
 =?us-ascii?Q?+xtm5oBmA0iDiAlWOffYRClCR4lxjM4S5Ns6QjbqSZrwF9yQEoEEg4LmhwSn?=
 =?us-ascii?Q?sYV9bczRYWhZh/5PK3s6ifai14PAaK5AJ0y6J15t98KijQ1fajlwqXHNa8CL?=
 =?us-ascii?Q?XMiNNAUgWkjrzG0tRwzr4qlRa54pu9MQ8TC2zjjhSnYd5kq5J7Hw7F1hZbVL?=
 =?us-ascii?Q?LrURthAPEKw839o4L5u2QJrGB/BLpc/j8lKCqfxp6t7nYJsMqYiXUnkDFQKY?=
 =?us-ascii?Q?ywjzxTOVeKsYv78URUurwfzq6IDNYNDIPLENV0A1b71ZQVTjXBIiCQwaIzii?=
 =?us-ascii?Q?MGtLXCDUIxx1Se/GCbxZHB/rPbLSNeHAz/5bXn+TEL73dnE5CBjLZfGDEYBr?=
 =?us-ascii?Q?1b9y13DBXbmqphvdI3RDPu4z5FFlAT03OSgSx1zbNKvP0WatkN6mjAe9jOVs?=
 =?us-ascii?Q?o+mwRt7V2tWToIsbczrw+t+dap8sbBdex0YrfxAbxVqVTCmzRKv0b5FXvUJv?=
 =?us-ascii?Q?TE0uH4V07qbx19kCAWp035VjTbtnm4SIwoSbxnnTHRB+VTpQnoCTcx7jh/Ep?=
 =?us-ascii?Q?h9MFjOTsgqPe5Gx2keLVIu/odLoGE6vBo8enr3TQYcxBEPbHv+iY+u226ukB?=
 =?us-ascii?Q?PKawtfj/cmNOpbaJgztBrk32jFlwE8grYBH7L+u2KUGNMk7hk6OYiT4dpoub?=
 =?us-ascii?Q?ns1okAzzWrllCkp3MK92cMErlvylJbIlXX3e/lVU29iwfWZcwXAi+/gKcl1K?=
 =?us-ascii?Q?PJ6yvgehGERx3bDebzzrjAbmSLeGOYEhYRxx4pZmqjfldMsqO25RG75P/RlC?=
 =?us-ascii?Q?+qgPZlmtzWtITyOzcZs4OBO+gdxNEN0aLR7QOUvzbkuBcij56HsCOKXgvFH+?=
 =?us-ascii?Q?hBzvGgVlQquSokflNWAWshjEqB45zRvu/NU5YulqsoKgx6vlltBumbasX6eR?=
 =?us-ascii?Q?tq6OwRu+ULoE1G6Wg/Ksb9ypzJUxis+A+QZDkMtuTqualZKNdNB+7KMjyHos?=
 =?us-ascii?Q?NCQLmIBDah2wWAxU4NO6py0jqsMrnw8nIZhaIUnTQe4yl5xtiykoB9zrZoJI?=
 =?us-ascii?Q?+nnSaVxiOzsT1u5Y2TWBDS+h+I2zpTfBWBJMda/6pdtwAd+ne4CYUrgNWIpi?=
 =?us-ascii?Q?0Kjq0UBk5qKahv/fKso5exP8JHH1FQqB276eWDoNJ6wzUWfebCTrOl5JuXo1?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16303fad-0e41-4f25-28ac-08dc074a9ba8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:40.2474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hMVSAwW/SM4sBZXV33mO+1K+aLgJbN05RFurN1dFk3BBRsi5/bmM+ruD1vNFPMncdX0o4lwKHHDqIz+mIyMCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

Now that ongoing variants of mem_access is gone, this is not
needed anymore.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 12 ------------
 drivers/gpu/drm/xe/xe_pm.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index e53ac5a2f4ad3..16ead90f3cab5 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -430,18 +430,6 @@ int xe_pm_runtime_get_sync(struct xe_device *xe)
         return pm_runtime_get_sync(xe->drm.dev);
 }
 
-/**
- * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
- * @xe: xe device instance
- *
- * Returns: Any number grater than or equal to 0 for success, negative error
- * code otherwise.
- */
-int xe_pm_runtime_get_if_active(struct xe_device *xe)
-{
-	return pm_runtime_get_if_active(xe->drm.dev, true);
-}
-
 /**
  * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index fc82a1466453b..fa42a5ec89712 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -28,7 +28,6 @@ int xe_pm_runtime_resume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_sync(struct xe_device *xe);
-int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
-- 
2.43.0

