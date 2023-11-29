Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B6CC07CA9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27FF10E5E3;
	Wed, 29 Nov 2023 01:17:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D8310E5E5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220645; x=1732756645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=690v03sl8ivWXMGFvUFslloF730qgSSAu7cIwU1Chr0=;
 b=MfQJkAUIYm/d02X8wVQjk+J4OY5faEE9w0kVF/fIybsAIqZSIXyZi/f8
 8Il9W05gsvd4J6BK+PENwg3Q04NJvm8xNgSaDtMI1RpFs88JCnkFeEPnf
 ieHwx7+akeVaQX3ZZyCWQSToy9ZihdVjncUm28eCeTAoz0sPNzI9b5FBv
 pEHEojMrwgGTADvysPadyuHwTt/eT/vQ6neRVgQEvUuF8jHHJZiHZt/gp
 IpuZomLlY/8ZNOZ0gg70528BHYV6zQmtfVBILsn/sVPQwXgxEbOUcuklu
 SVLfGHpx8i3KljJFYLZXzhl5t2VaQPWO/CRD5XCNSuSpSg6srfQE3WHl+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436628"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436628"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272726"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272726"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:24 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0fSot/J3EqgzCla9JIrrVTnNixCNmt4MBaUN5qK89g33EkfaDd8Mn4sKShjifQ1OEZgpFolLYnzYsbhlPPpPsBrivN12NyprmhJJNbjVgRVdpQxg3LQuVvLr7h6SUclLcWUZNHXzZQo5Eob7/KR23wO+EfJ1QgbBWz4i8BwSLYqVXD/UGa9vdMlIwZoym6J67ep/FPDIGAqiGsmnfa+l4nXipP9nOX5eNuPtsSD/IfWXusAcxpurptr77HWqp98giEZOgZffIVP+vFWZpns3A9z/TTztzhph/CfqDJMX03S4caAkryzyxC3gjszQJluxZPPEt9SjBKk5BYUb9oaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61zoUHnUAhQ34qj/F8fKq2FRF+nTOymccqKwvjoPPMc=;
 b=WKNEN/Pu8Bjk3iATQ/bnb4+eFgn/v7VQjyBwBgYhLeKEm4z/haOnPuwjT79gUF31BZp2n1mpiOtvBUQ6d4gaZmS6Fi4RDhjWmit/VJnnb+HPmGVlTUsV03RXRJ2ym4n13DFKGanZM1rY0d2/5Z0KQ5itJkmXft1Xy1ieRMFPe43lQ3dcVuIaH9+h2yx9Lx2w1S6Ot0OkYeqaCg7rmD/siMPeMSwbFiybhgZPYT+MeEISD2SqQ1hrH+GK4HRKXDWjgxbcJMwTIsDEQYGWnwsZn0ixBNMU5EFchCP8hqw7OoEZirEhWYAQO4x1RgyHSvFaFTX6oYb+Vr8PSUuGSKkGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:21 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:21 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:16 +0100
Message-ID: <20231129011624.836843-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0256.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a361e5-3667-4565-7073-08dbf078efae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0wrPVH2hF/DQodjRApT7IPZkAuSdTq24mG2Y3JaH+yQNmWM7u7F8UGoZqOok7CmDcm329GZIJhKA/tHEAud5LEhBFK8Y/KS5HKPRQ3PsWRu7KQWyz2kLYc7ooA+9TZJYF1E215mvnmpiXfzcuOynVCDZpLrE44fh+TkwhZHjBBvqu3dIUh5A4KotzGj7rLYxztGf5+ZlZ6VPX6v6uQIzUku2I15+Daj8V3eqYEhtP7L2mn9gndM8GYlEDbd/nOcIlTaQgm5ccQpuptGPL7kqDvJZMtRAen+ljWLEBJnAixn2yOzJlMEcYMik5/sDCE/LV6LhAffF+k4dxlcp/UIBe7tpKn5sBORalXkU2YM+I/lUzlOeAQMQ/5ZrHG7BWxTRmTKXw719QfjZoAeZL8z/VYwVoczVvs3oz0SxWTdz8VqRXxhG3jTzwn+bS0hHuvU7bgNfoOH6kVbiufxR1XbQWHx8zb4IHnAJKntTx/emEUaa/Rh5RKUaXd1qLlfAAU2HgKQqTxyOhLObTxlEWRL1pTgtnJ3kf84RYouVn12I854Gux1ka0C/mfsaGUvStgA0i/bEEX7DVzJHT+o+QFbeyw3GHhaf/o/OJo+Drt+MZT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(30864003)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVQbTFpaG5COEwvTUUyNFMvRldtb3dZMWFoOWF6SXRDTEgxT0ZlaXREOGw4?=
 =?utf-8?B?c1NSNnYrTTJURDIveGxCT0dOUEFJNUU3Lzc4TTNYNm5yd2tEODFaN3dKTDRB?=
 =?utf-8?B?bEwzTTJPUTF0bG81MTUzSWpMYU93YWduZTJmL015d25DMjc0b2VsNkViTkM4?=
 =?utf-8?B?NzAvb3FHUHRCRFR6Zmd6cVlwaERHZnBEbnFkSDc1aVhTb0xyOC92RDB1MWJN?=
 =?utf-8?B?S09HeHpPVEU5aHJ6cFFrbDRWQmxqdUZXTmlPQTlBcVAvSUJ6U3ZGR2M5MnJy?=
 =?utf-8?B?dEFaN1cvdkhaL3ozNm5tV0F4ODBpNEU1MXQ2eHRKSll2Ri93R0JWcXBqSjli?=
 =?utf-8?B?OGc5bE1sdURYdy9SRkVrdkZtZXZROEg0MUJLMEpLem5WVDFMT05RbDlRZWNF?=
 =?utf-8?B?OXplVkNjU1lDcVM0VDN5SVR2S010cmJFT1ZkQ0MrdWVhazlMMlJ6STRHeC82?=
 =?utf-8?B?cjhhRHcyalVtMVR3clJHbFQvM2JtY2VhU3RLc2RwejJ6K2pkWkpwTFZwUys5?=
 =?utf-8?B?d2N1UjNYRnh0aktWYytseDR4dzQzSmEydFdYcWVDdW5zYU9CYy8zbk5MblMv?=
 =?utf-8?B?SHNKT0s0ODRNZDZKVm04MWUvdmZUOHBRSDJuOXM5dzFyVXNNb2g4L0R5TFcx?=
 =?utf-8?B?NnFNZGQ3NlhWaVZCbVNJaHIxT2ZxM3FuYzRXSDZHL2MxNW1KclBPa2V2MUdy?=
 =?utf-8?B?ZzVxWFVSTmV5OUo4NEE3MG1XZ1NEZ2RteEFFc1EyVy82a1FFdU1rQlNpemll?=
 =?utf-8?B?Wk9VVHBwYTFZV3JTZ1R6dWt1MkVFeWRRbzlZNWc0cldpclE1dmRxQ3R4VTQr?=
 =?utf-8?B?RGtvaEJ3aWxCa052bGxidTNSU3QvTjB5S2hOckFHd3FndTFlcXVGZ3JVaFRu?=
 =?utf-8?B?bFMrNEk2NjNRZFdNUnhOK3hhTWJsR1kxem5iMGk1dUpleFlibmJYRUoxWndT?=
 =?utf-8?B?anFaVEM1aHNEdnFwbUdDQktjcjFyOHB6dktKeFFBdXh3b0JOcEdwYnJHQUt6?=
 =?utf-8?B?TkoxWENCemoxeGRvMzVZRXBDRndEUWtlZkk4SjJpWGR4SURyZ2tJelFvcloy?=
 =?utf-8?B?TXFpR2lSQ1V6UG13RzdNOXo1VHF3S3hrQkY4b1c2YjRadWRKcFNrRkpYU2Rj?=
 =?utf-8?B?VWNqQ3lNbHltUGlnSVhBRlllWVBWUzRsZWxKb3pNT0pZYmxvMGNZdjVmVGJn?=
 =?utf-8?B?cXFvZ2dGK25GOXRBNC9MSjlLaEM4LzZpbUVTdlVZSU1Fb3RwajhyQUM2TDlE?=
 =?utf-8?B?YURtakF0bytVc0QzdkZOdmNpd0JueGd5QzBOdWUyUlpxcEVlMy9FQmwyaGFm?=
 =?utf-8?B?SkZnMWVKcmpZZFd3SVRZTkwyUll0dndWSVdDZENhVUp1WW1kYlRyUnlFMVpC?=
 =?utf-8?B?MHBYWWJtRFlvWi9Jc2VaSjU3NWtXMk42Ti9RZEl6aFpRZUt0WlVBcXZRamNZ?=
 =?utf-8?B?WGF5TksyWkU2MzlvWkhUTU5pbURESXAzTTRncmJlL2owOC9FcWFMZDUyL1ZN?=
 =?utf-8?B?ZjNVWmx5Nnk2bk5kQ2ZvYWFVejZraHdtUE9JZ1l6elRyYSt1Qk1XbFQzOVNS?=
 =?utf-8?B?akR5UmUvb25iaG9qU0VmTm5JNEU5dXFhZVBUemNzZ01CZjlTd2Y3bzhFclNG?=
 =?utf-8?B?SHpMN0NIWTJ3MWFUU1dTYWVQL3FCazBHQXZYN3FGbTZoL1Z1V2V6K0JuZVl3?=
 =?utf-8?B?UGVqR3VsWVZhc2pXeCs4MnhjVE02aHNLaXpKTVhhU2pMVXdrbXM4L29RMmJl?=
 =?utf-8?B?UHE4YUN3Q0FtZmZRQ05lMm1qSGdyWEtBN1Zrbi9uSms0a1Z1OWlQUVRRVUM5?=
 =?utf-8?B?Q2JTOVMvemdWdXdlZHowdlpIb1V6aHFFaWNHMFUxMTQ2VTcxUzZRcFUrVVk5?=
 =?utf-8?B?YUdIb2grZTZkY2sxZFN1bVpPK28wem11RVBjMHJhN2g3akhIVUdENTVuQUpS?=
 =?utf-8?B?MVo4NkVaTTZkYmc2TWMwQjkvamdiS2tVb2hHQkUwdktkL0ZSNEY3NHRXZGhB?=
 =?utf-8?B?VVkreGRaSGxpL2VPUFQ1SGJCcFhnaUdjcGpKWDE5N2YweTFwUDU0N255NXlO?=
 =?utf-8?B?OEk0bDUxNE5MMkpYck5CRXF3Mmk5S2VDazJFdjdrK1lKSFQwQWw0aFFUdVV3?=
 =?utf-8?B?UVZ0L3N4MWl0ei9zQ2s3MDZHbWpHbytrRk1YZmJ3Q0Q5Ull5SVEyVXJGNjVN?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a361e5-3667-4565-7073-08dbf078efae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:21.2030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+RotV9dJfgUSv3ONRdlCXdnKQ3SgrrKdJHliU0pS+KRojnaT//mq+onCh265cn6xeH/SXTaJEQidLCXEENgRpiAWDlDoPNIhYoAoVKVyd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 14/22] drm/xe: Add a helper for DRM
 device-lifetime BO create
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

A helper for managed BO allocations makes it possible to remove specific
"fini" actions and will simplify the following patches adding ability to
execute a release action for specific BO directly.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 33 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           |  4 ++++
 drivers/gpu/drm/xe/xe_ggtt.c         |  6 +----
 drivers/gpu/drm/xe/xe_guc_ads.c      | 20 +++--------------
 drivers/gpu/drm/xe/xe_guc_ct.c       |  8 +++----
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 18 +++------------
 drivers/gpu/drm/xe/xe_guc_log.c      | 19 +++-------------
 drivers/gpu/drm/xe/xe_guc_pc.c       |  9 +++-----
 drivers/gpu/drm/xe/xe_hw_engine.c    |  8 +++----
 drivers/gpu/drm/xe/xe_uc_fw.c        |  9 ++++----
 10 files changed, 60 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c5aa01c0861c7..7f5b616a7bbeb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -1493,6 +1494,38 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 	return bo;
 }
 
+static void __xe_bo_release(struct drm_device *drm, void *arg)
+{
+	xe_bo_unpin_map_no_vm(arg);
+}
+
+struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
+					   size_t size, u32 flags)
+{
+	struct xe_bo *bo;
+	int ret;
+
+	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel, flags);
+	if (IS_ERR(bo))
+		return bo;
+
+	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_release, bo);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return bo;
+}
+
+struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
+					     const void *data, size_t size, u32 flags)
+{
+	struct xe_bo *bo = xe_managed_bo_create_pin_map(xe, tile, size, flags);
+
+	xe_map_memcpy_to(xe, &bo->vmap, 0, data, size);
+
+	return bo;
+}
+
 /*
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9f373f6d25f22..2cf32713bde9e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -109,6 +109,10 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
 struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 				     const void *data, size_t size,
 				     enum ttm_bo_type type, u32 flags);
+struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
+					   size_t size, u32 flags);
+struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
+					     const void *data, size_t size, u32 flags);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index fab3cc04882da..8dc783e9120d2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -108,7 +108,6 @@ static void ggtt_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
-	xe_bo_unpin_map_no_vm(ggtt->scratch);
 	ggtt->scratch = NULL;
 }
 
@@ -225,10 +224,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	else
 		flags |= XE_BO_CREATE_VRAM_IF_DGFX(ggtt->tile);
 
-	ggtt->scratch = xe_bo_create_pin_map(xe, ggtt->tile, NULL, XE_PAGE_SIZE,
-					     ttm_bo_type_kernel,
-					     flags);
-
+	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
 	if (IS_ERR(ggtt->scratch)) {
 		err = PTR_ERR(ggtt->scratch);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 88789826e7817..2f5ff090aa6bd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -202,13 +202,6 @@ static size_t guc_ads_size(struct xe_guc_ads *ads)
 		guc_ads_private_data_size(ads);
 }
 
-static void guc_ads_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_guc_ads *ads = arg;
-
-	xe_bo_unpin_map_no_vm(ads->bo);
-}
-
 static bool needs_wa_1607983814(struct xe_device *xe)
 {
 	return GRAPHICS_VERx100(xe) < 1250;
@@ -274,25 +267,18 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	struct xe_gt *gt = ads_to_gt(ads);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
-	int err;
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
-				  MAX_GOLDEN_LRC_SIZE,
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
 	ads->bo = bo;
 
-	err = drmm_add_action_or_reset(&xe->drm, guc_ads_fini, ads);
-	if (err)
-		return err;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c44e750746958..93c886ef6fdb4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -112,7 +112,6 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 	struct xe_guc_ct *ct = arg;
 
 	xa_destroy(&ct->fence_lookup);
-	xe_bo_unpin_map_no_vm(ct->bo);
 }
 
 static void g2h_worker_func(struct work_struct *w);
@@ -146,10 +145,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	primelockdep(ct);
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 57d325ec8ce32..8e3db5d7192c3 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -47,13 +47,6 @@ static int guc_hwconfig_copy(struct xe_guc *guc)
 	return 0;
 }
 
-static void guc_hwconfig_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_guc *guc = arg;
-
-	xe_bo_unpin_map_no_vm(guc->hwconfig.bo);
-}
-
 int xe_guc_hwconfig_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -83,19 +76,14 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 	if (!size)
 		return -EINVAL;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, PAGE_ALIGN(size),
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 	guc->hwconfig.bo = bo;
 	guc->hwconfig.size = size;
 
-	err = drmm_add_action_or_reset(&xe->drm, guc_hwconfig_fini, guc);
-	if (err)
-		return err;
-
 	return guc_hwconfig_copy(guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 27c3827bfd054..bcd2f4d34081d 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -77,24 +77,15 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	}
 }
 
-static void guc_log_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_guc_log *log = arg;
-
-	xe_bo_unpin_map_no_vm(log->bo);
-}
-
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
 	struct xe_bo *bo;
-	int err;
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
+	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
@@ -102,9 +93,5 @@ int xe_guc_log_init(struct xe_guc_log *log)
 	log->bo = bo;
 	log->level = xe_modparam.guc_log_level;
 
-	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
-	if (err)
-		return err;
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e9dd6c3d750bd..f5009a7968afa 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -936,7 +936,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
-	xe_bo_unpin_map_no_vm(pc->bo);
 	mutex_destroy(&pc->freq_lock);
 }
 
@@ -955,11 +954,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	mutex_init(&pc->freq_lock);
 
-	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
-				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				  XE_BO_CREATE_GGTT_BIT);
-
+	bo = xe_managed_bo_create_pin_map(xe, tile, size,
+					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e831e63c5e485..34990f396a1a8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -238,8 +238,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 		xe_execlist_port_destroy(hwe->exl_port);
 	xe_lrc_finish(&hwe->kernel_lrc);
 
-	xe_bo_unpin_map_no_vm(hwe->hwsp);
-
 	hwe->gt = NULL;
 }
 
@@ -427,9 +425,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
 	xe_reg_sr_apply_whitelist(hwe);
 
-	hwe->hwsp = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
-					 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-					 XE_BO_CREATE_GGTT_BIT);
+	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
+						 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+						 XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(hwe->hwsp)) {
 		err = PTR_ERR(hwe->hwsp);
 		goto err_name;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 25778887d846f..5b86c51941335 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -266,7 +266,6 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
 	if (!xe_uc_fw_is_available(uc_fw))
 		return;
 
-	xe_bo_unpin_map_no_vm(uc_fw->bo);
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
 }
 
@@ -575,10 +574,9 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
-				     ttm_bo_type_kernel,
-				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
-				     XE_BO_CREATE_GGTT_BIT);
+	obj = xe_managed_bo_create_from_data(xe, tile, fw->data, fw->size,
+					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					     XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(obj)) {
 		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
 			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
@@ -609,6 +607,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
 
 	release_firmware(fw);		/* OK even if fw is NULL */
+
 	return err;
 }
 
-- 
2.43.0

