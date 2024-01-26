Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F27C48285
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F9F10FE6C;
	Fri, 26 Jan 2024 20:32:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C7610FE64
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301155; x=1737837155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jhQzYZb5aj9tA57Vm4niDpN4DkeZEc6Fg7VF/y8Z/T4=;
 b=ciBzajUsw3tpSUqAxKerdDxo0Ie2LvN+YfSsV6a1PpbulPBsBmnfkkCY
 A9/gQ5y7+bzleilBK8SqVl5Pb/DvK61Ub4Aa61VRCEq+GKLaivJLi1+nH
 o5iBptJsbNxHUf1PW4Ha/40+jqvsy5PfB2X4W/ouuMVALZTPiw7JJGCtb
 Urk1vYJR3egjnSFBSDJVtOHiv+NkDgLMQJxt51+8jL6VYSKHpc1Ohi28t
 6YGW+0aNubQkPDSbLMSOdUl2bYrJ0be+jsFxRT7tkj93T9gUUFxJyu3Y8
 o4tjKZlXJJpCnIwRLN7MQXCjEjjzA7xv1vYResMIabpYsDXBpPCi93eeK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1494812"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1494812"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821245455"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821245455"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:34 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2L6DtwkNg3dGbFAmYFHlVGh52b2zU0pAEsZn+tD6Hm2kS4y3dKe7HZlObHpcqBhtgpv/9xIOcf+K2MNEuFqoybqAOfL/TpE0fHnIcLu2fnkYyBo8oE45pNWVoPfrB+qO0Ak9ONIsvDUrJr9mbNE5ok7Q/lrZ05tFgvVWu3EKVyubYBu5mZawaNlQgxSZ5m5Av1d42Vq0choNtL4xf5OxaPrX8N7AnTag2E1MU5Lru2Xh/ulSTcmkO5UJVuhbhNJoIOWO1Dm8UFegzvjXVJgTQDq1+84w5CsiuoX7c3pb+krQRv/ftQpNcIp9gRuGsMWYXomEOtOx1Q+uYbFqV++bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn7u/szaAvCb2PywvZAKNNK++ChtZF85LDvIDOMOtKc=;
 b=lZgtp/zwvUF0m+Ibi8kGT5ebAAWZVw5EUCa6kDtx6vBO9IZHELq0EPxrSsfVU+otL/TIRLV9sAKu4Wa7MKozhjUDqXO0DErULojMpUwLs9E5mc5m+cSCKoI+fyUwL7IKUilDkPh/5WQ0KFmUzweB67W0M3o2h8LoJs6bck98e+SaLEjug/NRKxenQq+rX5HmDjlU04uvQ9d3/zFW2Jxmw9AMHOFYugYdPbyK6TUtAoxjAN6Xs+NtThFw5zfvdWbMVyH/K1VThzxxP1tT3ZqTU1vjF8lORkS/G6M3GrqlOXgkRmcKs99G8uL70EXe8OifxsKOOoyd0ojQ4SKHoLQfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 33/34] drm/xe: Remove unused runtime pm helper
Date: Fri, 26 Jan 2024 15:30:42 -0500
Message-ID: <20240126203044.1104705-34-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ed8d89-c67b-4fd6-e04a-08dc1eadec48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n4sig+d1eg9A5D3efkZ6PtKypZioWFN5CQl/rMT2LfLUpcLj5cdvTsIfkLTEmaLg1s5H9WWA5U1wQKxJKO99wObePTZYBeMEjA+BLdXMIGel8lP88dnX03/XU6jJ+wSTzrfO7iTJqX6Vfvg+Q/rSquEMGj6wvfUOral+ohPBKq2DI/IPHKYE3SmNZtyLIRftnRJSgeSbgvaMWwcErfDfHNpArSnMexadHKZpvR3H59Ah66B5Apq/10JcUG8FFwr/g7ZbKd46bgbeP1ZlLw5cJIuOc+tLkH/OffUKbeNpjMHFuyoN8Ke/3h4ME8RH6NaDZEk4MdeV3ga8KDoh+RIuCOrcWpgK3c6aBztrE2pN86QmUOORJIApS3ppW0efE1io5xd25HiQHKfyniKjLif9VLdzHKQbWO28vcRvHaB9UPS9kuxq5f+bQV1yCcOAUlIaOpQM6OidT1qAdbIo1w5th7bTUPutd9FFOfOi5v2cdXNJN30g5bgBF5a9/p2QlaELhR35SbvZukbs38u/HvWNwXoeS1ONNR/0MUbJ8UEeDjuht6anuKPcoJsEr+mCT0o9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kHKJcBNQ06u97Oo6ViuIBH6Qy1q5xPzZoanqIvIEhCeHoZHSn4vjKvyAP6oz?=
 =?us-ascii?Q?nrDl1DjlMVxEf81z+xt5IRPGDYts1VMiEU4rwLpe/dqdQIRCxAKB5g6GAik2?=
 =?us-ascii?Q?LR9F90goSqBU6ZY8AYTvydRdd+X7Ryo348zt6Ssfz1357oOAuK0QpEjO8xSZ?=
 =?us-ascii?Q?FgdQTa0bZ5KRwokJxoQN5bsLsFo76WCDmMr+Lybmv6xfA5GbvAIEu2tBJvBA?=
 =?us-ascii?Q?RjU0Xj8Cp6XciKuhc9VECCtYCnR9cBSdJEunHgr/jSWMTTqgR0c1hkYn3HM+?=
 =?us-ascii?Q?aA95SblZEDo1Fpub+dnLezi22LmHqZMJkYJN2Di2sxFdAFmV3jm760m7Nhpv?=
 =?us-ascii?Q?QBJcPtZkN0W2itEv4CkR/EXVrVM9Ek3xqPzQRkNugxHZAO2vsLCirPwtu2bW?=
 =?us-ascii?Q?xpvXSHa0S6o4gIU9Kv75vgiq8V6RKYgFKWTO9Mho7s0qvNLjHxGu3V3sje1u?=
 =?us-ascii?Q?6dUGSjQPo54aWZ0vPi8hhSFumBcO4DFFpqaT9pMXMeVWMfiX7RgYmGTo2Hp4?=
 =?us-ascii?Q?kzc/I6R9G+BQXOY4tR4ykrzWDMp8x4G6JS0K3kIcgqtK1XLGO0mDSlxIwLSw?=
 =?us-ascii?Q?wF9fGL7hm8FSDGZp3AQhwNa1tIssnLpIzThrydDyS17YP1HIoRqFjNosNZIQ?=
 =?us-ascii?Q?AEcq4bplb2qQ6jxSZ2UzpElVtZwS9xWaIB9dKd2jvYeRyxOURF6ZSPhoTlu7?=
 =?us-ascii?Q?YRUOpth8PlU3WNbNijnlOGp5dTsF3nnhD1HFr7cHWW+jHBq5womF+amhwr+3?=
 =?us-ascii?Q?XqSEAct2VA1p386YlJH2NypI9VyFQw2LLteIHN0XQLd8yE4lKNySuxfCxbv6?=
 =?us-ascii?Q?SkXrkPp+iF74+vhASZTZoVmT1q+wRBAlBeqchRsGLX+C2CqQTMpu7KKbUYOG?=
 =?us-ascii?Q?eIK1Om2FDSp+Wkcm0RbQlew5J7U8PDiAxALx0BN33c6bINaijBX89zQx3S9X?=
 =?us-ascii?Q?e1G/JX1e2O4unHfsYe0W1Wa4z84iNhHogqdFMVrKx0lQ5qVa5GVsdIUeO7e2?=
 =?us-ascii?Q?fWumdy0xEz+wNPdbRohvJBjsFfeJ/4/JpRM6VvQJVsfp/X8rShXjCAE2DkrE?=
 =?us-ascii?Q?/GxcSJWWdxAK+hrtdsIuLtgWHMkOM5jM8rAVQ5cc92xeToes16XmGqV79Uhf?=
 =?us-ascii?Q?z2Avx7vFSOraQf7+0o+CwwMDLZypW0HT03NZPCOztRrEYtcNdkEgqmOzK66K?=
 =?us-ascii?Q?YJhAf9C1H8icU/wzt+jgm+yVTDDXlB1iyMBGD5AL+riLGFPY/kEAk9XJjnok?=
 =?us-ascii?Q?FUmjvMnGQm1EohkcrLdinbZn9Ko2J5TSHlJPmMdZHK0IBVbGBUbAz9D7wQf3?=
 =?us-ascii?Q?gcs+f3Eld8edOjqfpsjeUtz3DKlplF8ev44hsA/LER746/5Nxu0cxCDkLDoG?=
 =?us-ascii?Q?KJUlKCOySmKRXNEmLSAzrrV3LP5ciohjlW65AMqNBMjzOWvOEqOeDB2uKz6q?=
 =?us-ascii?Q?tlVOCRfHLYwSvqbSOlBILdj6qYi5yZnRlbgUgatLkEg139fIaw+9XnBjFg/b?=
 =?us-ascii?Q?fnMmncd28PH85ZL180lU5RwZMuyuFDyzVTq/eFzSfP178blOXrq5YuzEHeiv?=
 =?us-ascii?Q?sYAM5UfOSD/UVdaTPQdCFtr+xeWcNGRR6mkABiASk0Uyw30RpyzXYrdxQ1zW?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ed8d89-c67b-4fd6-e04a-08dc1eadec48
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:32.3834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOtDsE9c/jMDgF+4/7p4Zh/RW6DNpo3yb8b28rhcOWL5KJ9XgG4DrA+oDHc35HxUs2wCeMZRs6dzEdF6nrqfZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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
index 8bec1f175c9d..e5b0455d2922 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -407,18 +407,6 @@ int xe_pm_runtime_get_sync(struct xe_device *xe)
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
index 7d8cf87b95d2..0ae4f6a60c6d 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -29,7 +29,6 @@ int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_sync(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
-int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
-- 
2.43.0

