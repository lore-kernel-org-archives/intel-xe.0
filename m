Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1AEC0018C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B241A10E6EB;
	Wed,  8 Nov 2023 00:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F7E10E362
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403692; x=1730939692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/d/c896RehBSqNSaIL8ElIpb/xPLsUoj1UaOd0dSyUE=;
 b=Sm1KGhPhYJ0v2ZwJtQR+pzhbIH6PX2sUJ59mZMUtCPuQBNDjX0G2XwXl
 sC4g2JekiT4cR0GpbXt2rxFTs4kuCQhA6lrsrj0s6boxWAlg/T4PJBVFc
 lXAmGVr94NGZ+UPbAMFRCoQwWfZb8FGM6Aew/1QrLhP+cyOTKBI3lWEZM
 SN3axFwKwLl0OYtP4wgAEfQ0M2HHcLsHyhzki3o3CimmUhHiYi0hCYm0q
 ZWzn7qXUoYkGi0l0Y9cG48BbA/ddcrFc5HN/l/Enqz2pCQQs2mWjMI7ZV
 cbGbL7frZekig9q1R6q0pWhrsr9seA1DD+8Wpih20RZdrMZjHyCaM3f6Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475886168"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475886168"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880019041"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="880019041"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deUF/FwMAVYlaJOWzneHyjyj5bUDyXrME4ndSlOaKYSua4373ft2wiJyhBgxs2bjK6OeI7e29028ruLaPqxgyX4VKlFts1GT8+tj2uBhcY8fPWdIgpu40punwV+O7f4wlFaH4yFpVxKKSszCxdKPKCWNXPNjQubW7x25+gEGz/72+Lx479rvIF+VxuJiRworGBnBIBBw6dDQixTYazFsoOJMUN/Enm/yQiWvePulZgWoCHLgZVo9TsnU8t/H1zeysCEBZz8k7nMdN1nto7pQ3204tM5Yh1owhP9jVJ1UjtqALOeXyO3d2CmnMNL0i2FO76XXAnah49I3wVzITJ3dIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0ISAIXnX3HGg0EnO24RrD5mHgq43+PHCyRzEBt2IA8=;
 b=jIFVkbRQ/x5s5Z6K9rsGH3T/2X8CeaVq+ZLSvbDhubGY7INf4mVz5c6r9K/J58A3BA5wNBEWCcHi9OxtKqwx5IY/ynFhShrdcmHm6v8V90b/8UJ85aMjugoGKPWPWj5th9lJXxsuF/C7bFMWKpdGeC+nKK5cNiqDytbZualakvlc/VohEIGCGQaE2pG4XqFq6Hlr7sJrlX3+mDVLB+H54KsYR/j61WZk1qatcx9OxIGHnayzABvmAqlowNjj0pQ76eYQ4csIZ9mrA5XXOMu0hWCnFmqEw69E2eS4/CgUCCyj/tS7z75Kb0ADr8GpAEk9cLcKCGnW0ghNz8F/Ezdn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:38 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:40 +0100
Message-ID: <20231108003344.1169016-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: adf235ae-f455-4163-4ea1-08dbdff27dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XS/XUmwkh3D08LuaZBG1/ZZkOm6p6k06oZwqhIA86EG5cWAhQP7mGgDTQb8+fm8jlArrRe+BhFzeBynBOawkm4nso5JQ3Tb4EZ0+uQoXef+slqhH0DCe/fORtp/tl37FStY3RLpASdH34IkihzOSLLb2RRx43WwPq/LcovwGsjPz3gW8to97KBIbyWRjNuzWsTToRj8VTNOUs2Tj2Z2KyHGIlgaRZU1BNKvwv8iGQjoBbQZ9HjR9YS7eHZZ2IGFud9KSFEY5JC3c+T+zB4b8E0DBwZKSZpEYZShIeTPRfI1lCqMy7fbXoHW0AQ9E5LgGj8sRHozeYwPAMSMeBtF2dcH9CG7NmR8nZv9uSApgTp9oF4oNuLLmNEPw5QqI61tzU5zdkaheUVUEoVyR3GRH5d5B1cG2pO96VyO8e/oXmum5HryB/tYdPEyXneguOMij3Isg+OOqRqguOBu2jPexfxqfHXBxjQTmkMEEoAK+6FHW/q+NTDDb3y76dBjiGbjuQfSEs1kHRsF7/rrqCyaCOplUOX3L36odQEyRjrxJZab7YwTv3FXOxkqAETKAz2A5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(66899024)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFZEaThKa2lqTXJ3MHZsSTE0VWFOc3JzVEpUYzkyNU1zeXZJcUlQSFAzdXY0?=
 =?utf-8?B?SW5yNVlVQk9vZ1c4U2JpTzcvYzkzRDR4ZEp3R0JqeFlKbTROMVRWL2h5dE5W?=
 =?utf-8?B?R1JrS04raGp5TFp0bXpyZGtFQStqV1N2WjNCRXZMSFdEOE1FTEcrVk5vSWxN?=
 =?utf-8?B?c2dqNXR2cCtaYjBOd0E2UU1panJEbktLVUFFWndhd01JL0ZSazZJSVgrZkFF?=
 =?utf-8?B?eTcycnc5Tmk5K0NQaHpoa2lBWi85ckdEOFYwa0hhUWQ4YndEbDVDZmVqeWdl?=
 =?utf-8?B?SkNFdVJLWWhyb1g4WjE1aE54Q0ZmakNJWDdxUzB1Z2RUdmk0Q0VrOGhQeVlU?=
 =?utf-8?B?WkNTeVhkWnNjVUNvaituTTVQbGhEcFVhcjhCU3liNXdkbUFvY252dGxQdFds?=
 =?utf-8?B?eXF0RW9HdTZWRUhIK2xDSDFKeStzOTQ0VDBySzRUWnNjNVRDR2krVkZQM2Mx?=
 =?utf-8?B?ZVFqZmFYUGxkU21qZVZxNGtvQXZVc2k1UmRzQ2N6S2t6MXM1R2YvdUh4YkVa?=
 =?utf-8?B?c3I5TThNTWN4T1k4R0ZYWUd4QXlUdlhuMVlGangyT04xcko4R000RDlZMG94?=
 =?utf-8?B?K29nQ0tUTERNbDJiOENGZTI1Sm9ON3NmUDZMU0tZWk1yT3BVb3E5bldSYmZ1?=
 =?utf-8?B?NlV1WTJGeUY0aTBiS0t6Rjk2Uk5oRENpRGt3b3BvQzRoTi9WYXZVRFY4T0t2?=
 =?utf-8?B?WHdwZU5Xc0tFa2l6MXBwZyt2Q2hlY3RmQTJZMTFxU0VEUUpuQzhONkVkcjZu?=
 =?utf-8?B?RDNHckRoeWVKM2Fsc1BwR1MwMGxEQ1ZoTnljQnZIYTc0TUFQWFRKd1N1R1JN?=
 =?utf-8?B?N0NIbTdidjJJVzBBb3VOcVplaUY2UDRXdjZISnowU1BsRnNWTExoMGdYamJx?=
 =?utf-8?B?K2lUNHhXL1dhT01EVXkwT3luaWFDZG10ZVRGcHAvZHR4YVdwSTlFTTMvLzhz?=
 =?utf-8?B?c0VoMWlSRFV2Y0RCSW13ZHdydElJTGhJQ0N3SHBQSzVFdnpnR1FyK2Q5ejlu?=
 =?utf-8?B?Qmo5WEFydXVvbkFYYkwvdDFGQjBMTlUzeHpiYXNkai90d0tyVXQxTlRjSWZo?=
 =?utf-8?B?VnRIS1hCd3R4ZUFtZTROaXR5bGJva3IyNzhxVkpHelJjOHNoN3JrVmZzZVJv?=
 =?utf-8?B?OGd6M3N2Q3BCSVlJWTI3cmxMNEhQVXJwYmNiRWhlQ2F2UHlNZ0todjIxTmVH?=
 =?utf-8?B?UUIzRU1zSVF6N0ppRzh1VDlLTUh3bUxncWppYmZiNDZUdk8xUXFFZVhSRjdG?=
 =?utf-8?B?T1JMVzZPdXFxNld6bUZOL2VmS3htaVNud2JVZnF4SGZwaThlVUlCZG81dzhR?=
 =?utf-8?B?L09FNWVVaFNwVFdsR3RzelV3ZUorb1BsdlJGNXptMHdueExRM2k1dUEwMXEy?=
 =?utf-8?B?bVZQS3FzQitpVG5oenc0ZzRXSGgrZFR2d09Ra01FU3lqcHN1eWJkdkt4K2VG?=
 =?utf-8?B?cjB1TkhCUHhQbm93dVRIcmZrSVFYanZDWEoyb3U5aUw3dmRudFhHNW5SMHVT?=
 =?utf-8?B?RWxqbmthTlRjRHRELzJmYVNEUFRjNllOSHBXYzJ3RG1HZjl5Uy9oSEgwYkpB?=
 =?utf-8?B?czV4d2NtYUxIanlINTRGK3NKVWpZblkzWXF2ZmxKNmUrRXlKejFmTkl1Mmx5?=
 =?utf-8?B?b1lWRk90em9hakxKM0N6MzU5YTg3WEkzNUo0UEt1dDJwVEdKVFZwWkdHZ2VY?=
 =?utf-8?B?cnQ1bDVadXhCM0VMVUI2cjN5NU0wdkJXQTdJSHZVcVNNRUpSN3BZWXN0M1hn?=
 =?utf-8?B?YmRFS1U3UkM4OGR6Y2hIWTMrMC9mUmIvMjR5VGNZaThtb3JSQUJvVlQzT0Vo?=
 =?utf-8?B?ZFFjdVJvV2lrVUZPdmpPaUc2eXloQzRMQU9mQUJXRGtIV1BKdytVRmNFdVJr?=
 =?utf-8?B?a1JFTVltOWY5YmxveG9iMGEwM01yeWFyYlBIbm5wOS84S0JtR3pPM28za3Qy?=
 =?utf-8?B?RGF5d1JpYlFYSzlZTDBFS2IwOHpxT1F0RUZNM1hGQy80N0VxcU1rVlFOWHZh?=
 =?utf-8?B?QVZSS0lDeUxwaDVIRjVabjZjcG5GdDZpK1RkZ1RpZENTdlA5VlhRbHFjRmNm?=
 =?utf-8?B?SEN3cnhvNzJudUk3Rm9iZjlTaTVYOWU5L0Q3ZTdRMlVYYzhqbHVzV2tyajFS?=
 =?utf-8?B?NTNTVm8zSWJBdFFTN3kwcFVvNmNZckZaR3N2K1NrMGpJV3I2RzF3N2RsbkZO?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adf235ae-f455-4163-4ea1-08dbdff27dc2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:38.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gChC8Ll/TPfm8NHky0OANT+A6UCBojXqn6Z9xgUbLRnM4KP429dcL81RDxrb4iI4V9VTlcNZQ3ONeQLJF/RHLzaM1r17YGSzx5Mj9xDwZ6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 08/12] drm/xe: Split xe_info_init
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Parts of xe_info_init are only dealing with processing driver_data.
Extract it into xe_info_init_early to be able to use it earlier duing
probe.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f6f7ac390164c..2aa74eab08232 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -531,6 +531,24 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 }
 
+static void xe_info_init_early(struct xe_device *xe,
+			       const struct xe_device_desc *desc,
+			       const struct xe_subplatform_desc *subplatform_desc)
+{
+	xe->info.platform = desc->platform;
+	xe->info.subplatform = subplatform_desc ?
+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
+
+	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
+	xe->info.has_llc = desc->has_llc;
+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
+
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
+				  enable_display &&
+				  desc->has_display;
+}
 
 static int xe_info_init(struct xe_device *xe,
 			const struct xe_device_desc *desc,
@@ -543,10 +561,6 @@ static int xe_info_init(struct xe_device *xe,
 	struct xe_gt *gt;
 	u8 id;
 
-	xe->info.platform = desc->platform;
-	xe->info.subplatform = subplatform_desc ?
-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers. desc->graphics will only
@@ -572,13 +586,8 @@ static int xe_info_init(struct xe_device *xe,
 	if (!graphics_desc)
 		return -ENODEV;
 
-	xe->info.is_dgfx = desc->is_dgfx;
-	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
-	xe->info.has_llc = desc->has_llc;
-	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
-	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
@@ -590,9 +599,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  enable_display &&
-				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
@@ -711,6 +717,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_master(pdev);
 	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
 
+	xe_info_init_early(xe, desc, subplatform_desc);
+
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
 		return err;
-- 
2.42.0

