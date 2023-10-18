Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A15DCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 11:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D9A10E3D3;
	Wed, 18 Oct 2023 11:58:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4D510E3D3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697630332; x=1729166332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Qr/yF3EqAZE6hkM9dGe+X0/VmGG2hszaRCSx7eC/KxU=;
 b=kvBwo8yMsqCgbG1/P6m9DpulQdlHYW9g5Yd2q7zGxhvTDWznes5eOsDz
 ejmMZqN3zBz5bShfwah//ftsmY+qY4WL/jg7jnkH3SXs6cgGsmfKYFWEK
 tHvXcU7dMVC68lK2gIJjuSKansLc16IOkHCEyb3w0dMEgaWQOwXFNXGIM
 TX0wJuBy0KFuX8GOIUyKqXpJ1Rg800RuaZfacxkRPTEnvVdmEF7CE58nX
 1Zqx3ZnODTwXNWe0r20u9Tm/h7i460q3D/w3uXok1Km9pHr0aJxLsPWOu
 1ShZBg7xaMv98e/Jo4sx0KXrmNgTZUIHLITh4uPly/NqYADvZsuJOQH6q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384879378"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="384879378"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:58:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="872999958"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="872999958"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 04:58:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 04:58:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 04:58:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 04:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCCOGkIXshGa3Yz/LK4ECeY2H8Sz3OUcpIzsJq9IoRlwgpxAeYrx7C/rfNJRikzw8JeEQQnQP0CQ9b25defMU/A2Tb9OrAHUQgIIC+jpil70AktEl4tN4Eibz45rlaAog1cUNGPdRAqfKa1X4Xevvn7bGeEPbfqLmUpoiI8WT02qjuP1B91raCqMeM9lgUChSrh96mkX8rXNakuAyQ7Apv+mU+jlnyEUllr/BYNKt7rFInBJ9bq1t+2QKxR3EGpE+4QluRh6TlbyW/BbKXj3/ooQe1OOk2zQNFhi3Rw0iEstKJQoNPe1QXSNWvMpxKl3Q2uggOLQEMH+sl61JlMZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=legDyudM+NKmOHyW8tjje8H2pGcP+yH9PgCFLCoV+wY=;
 b=Vywxkom1Nb1DGnnqmKR5L4BHTLO459LauXW7/9RB33Y5kUhAjbONHNAo61Yb5KYgUIoiFElHesGi9JOpBfLtXEY+OrsJOxPMnYD7fWrJW2uOW8Eph06eJEv/Z1ooGaKET/L/TVoQZDQn0j0pTwlmMIksEHX4XGmPO/uKcC5zRxZbNc9q4YQOv2OTIN8g5PhoEUF9rmv7q6C45V1mbyWw2Q2tDsojJCApyH4sIKftFJMPIJWN2uxkkbTZYkuqx8FehxJ/OafmfhEEBS28WgiUDDbbrr7TLVoSd9o78K1662uJmEA7YL9bia0XcqFRCS7NKtpXSrwFkN/FHR5zj7+2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21; Wed, 18 Oct 2023 11:58:44 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::cc5d:d2c9:b39a:3de7]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::cc5d:d2c9:b39a:3de7%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 11:58:44 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 18 Oct 2023 13:58:24 +0200
Message-ID: <20231018115826.3908905-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018115826.3908905-1-michal.winiarski@intel.com>
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CYYPR11MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 6649f065-7185-4073-2c15-08dbcfd193ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZegOtlKXYx2dEgVTe3HRm2PvkpRmKltDWCwq7HUlnyooIfu0cfwb663QA7BvelMzXSeaH/1nJ28Tz5HDh8aKHLTmI2MT7O86jACtukDpTN77JGWUoAfVww+OtI01+P27/I0bigNurTI4UnnqHy0Yq/Ws+Ex1f/6g4zvVeIoIZIpJQjp1V+G1MaBJXSdLwFCUqABloWioqZTn+BVgp4BCxaiLLGsS8p+RyvDN7w7BwwkoAQ7tESH/Xu03DHb14i/mVFQT9wY8hAMyuleWJ0hdXQpp9xqYUdtGLsz23Ej9duHFOrQCXqmAnUCMQw5cRfGHTwSr/9Wn0e1KOyEOKBiBJ9adgRoJYTyevAIR6aQ+YXYggnS36REpkA1AVYFLRtzsi89ckONhuJm2Ydq5SesgmaW4rIHBnQ6JrQA98fm62IKmyQqUVvHIAsLgPcwj0rGEfSjK8GrpJ8KmHWcIhi7KD/Aw0ir8GlliYuxndqr6hhMDbGmLDFlWve+I5nebsl195mPSNOir8nHqtV79wSSTfzBDjyl50jPqWvRgqyYVUgc68WyYicl/HAvn/r6tOSr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(26005)(1076003)(2616005)(8936002)(6666004)(83380400001)(107886003)(478600001)(41300700001)(8676002)(5660300002)(4326008)(4744005)(2906002)(6486002)(316002)(66946007)(66476007)(66556008)(38100700002)(6916009)(82960400001)(86362001)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2dRUkMwa0JMVWtZN0Z2a3NwTE1WMVM5QWltUzJmaTNFTkxRKzBVa1pXTVhH?=
 =?utf-8?B?cmNWOGRnUzRzT0lWVWlaaStSWU11QnM2NEdVLzlGNnB3QThzck91aGVGei9q?=
 =?utf-8?B?SFkvMWhNV2hERkE4cG5NSzBNY1hvYWtDMDBmY1hFamQyb0ZlK3dmQjBqSWUx?=
 =?utf-8?B?VVhnYjhRMUNTMEtkaHNvUWdnbjhMeDdVekxDbCtucmlLN3JncWZSNmc4OFUx?=
 =?utf-8?B?OWNrcUs2V2FmVFVkdGFJU25NbzZPRnRFUEJyM080MDZFN3lnSWQ0ZzhBcmlz?=
 =?utf-8?B?S1loSTQzNGJJNytQcVoyU2JoMEpjMUNRTVdkZmkrKzkxS3RKYmJnVS9EWFUx?=
 =?utf-8?B?dUlTY2ZsL2hYMnk0VHdRQmJLNGNCSTJ5MUhLZlRaUG9kNHllYTY0QjdRRy83?=
 =?utf-8?B?Y1RKMWFwSS9ZTS92S0NIc0N2UVBRaCtOMFl4Y09lamdwNDhzczhDQzBXVDlr?=
 =?utf-8?B?dGE4RFdGVDRqZGg3WU50NkVGRFVZbFhZV2lSUWpLbmNpYWVYVzBoNzQya0pn?=
 =?utf-8?B?ZlM0ZUZvM0ZUek43c2g1NFYxZWRFc2pWNTNQWm9jZ3FlNS9lU2JVeWUzNUMz?=
 =?utf-8?B?OTdycHBlaEd6SE1OaDg4Sm9IM1Q0RWRiU09yb1dEbEU1emoyQWRJak1PdWhG?=
 =?utf-8?B?NzFXQWlUWmFoMFoxa0tycVN4dE0vNEVKZTlrZlJsSVZVclVjc0V3bW54bE9T?=
 =?utf-8?B?cXkvOEsrOE5paEFpUjkyaDZqRjV4VmdkUGplb012eFppeWYvTzJxUlNIbkJj?=
 =?utf-8?B?WEk2RWZoVXlraCtHWW1xOWQzOTZXTWV4cXBRL084L25PY1dmdVlsQW5YS0pE?=
 =?utf-8?B?bmVqcFh3QWgxSXNKWjRWbGVJZFJDYXc0L2N4ZEhubXNUYnFHL0NmN2t5aSt5?=
 =?utf-8?B?V2hjMHVZQllpRHQ2Q0NqcVc4ZVQ5RW9LNUhkVFZHRUNmZTBuYzFVOHkwTFNL?=
 =?utf-8?B?MS9FTTFINlVyUWR0cUIrVmVvYUdWbDA2NzRMRUt3bGVaT2hpTTNMSjcyTUts?=
 =?utf-8?B?VFF3Rk5rM2lsZkJPMHJ4ekFKTTUwTzNpWGhXczNnaDBXbmRka2xLWnVPMGZq?=
 =?utf-8?B?a2UzT1EyNUVCZXpzcUtTVGNJcWJFWmN4NXVqN3F3ZG4wWlU5MnV4ODRhVWY2?=
 =?utf-8?B?ZUJaVTFGSktHbHdGMDdsYmZVdERNTFNGekJhRVV2SW9nVWFwMU5BT0hITGFu?=
 =?utf-8?B?aFdBLzh5ejZJbUdBbXV4Vy9naEpkcFJHMlRIVDlIUnZJLy9lNFJjellFTW9u?=
 =?utf-8?B?VkVQb3NJbjc2eVVhZzk5aG1nWlpTK3dzaS83NXRoNEE1WmZ5NzEzeXBRdWNw?=
 =?utf-8?B?bDRKejAxNWxhaFZtWXFJNmFPNGZadC93UDFRaCtKVDZ2QlRKV2p3SEsxNlVJ?=
 =?utf-8?B?TGh0ZUxQSXNEeW9OUmRnVEsxZURRMlM5c1BuTEJUdXZaUk51WG5tMW9PaHlx?=
 =?utf-8?B?d2JhMzdxenNIL2RmVDJRU2RSY1lHWkQyM2lKb1pqc1U4Qy9SZ0pOUVJvNm80?=
 =?utf-8?B?cnFwdTFpQWQyU3ZjQUIrN0NOakZKdHJIckp6bkErYk8xaGNwd0tqSC95NlFY?=
 =?utf-8?B?OWJXVldLNUhZUDJuRnVyUHlwRzZFVWNqRE9PU1NvbHk1RlBJbFpzRVFGdXBD?=
 =?utf-8?B?Uk9DaWJDVVFLcEhpQ1JMT01NVEFCYlZVd0dqQzVVRFBCYzdmaDVkb0ZabU55?=
 =?utf-8?B?R1Q2b3B5YjhOM1E1ZkZLVGpjcXZsT05GbjRMMjYrV3drbXlaV0xwYWM0VUxq?=
 =?utf-8?B?Q0RVUkZLeUhHbE1iQ1V5MUFzdmZKVW9tdHB5bXh4enhDREdqa01VMlVMWVBw?=
 =?utf-8?B?RlI1MzFiVVp4T2xhazhZb0hUVXVNdnZoeTFLTWZDZnFndHpQVXdKYkdNTTdz?=
 =?utf-8?B?bnZDc2NCUjMzT1QvaTRIM0lMRktVcE9vcVd5eTVhZDgvUnhSK3k3SDZyeWth?=
 =?utf-8?B?NzFpNnBLbEI2VHNHWUFCaTR4TnJ4YWhOSHhlS3p2dTRFN29RblNOUUFiTW1p?=
 =?utf-8?B?SXQ4VFZaTzhUUHgrTTBPNWk4dUtQRjdlZzVhT1ZHVlZsY1d3Z2lIQU9GS01u?=
 =?utf-8?B?d2ZRZUVuY05MRTlpdkswSy9nakpQa3FmYWFQM2Q2aTV2RWhsUGpBcFNHWWNy?=
 =?utf-8?B?SGxROHkyTzFoWE9VUVFoaGxrSHhDR3ZzVlNiR1dYQkFmL3lLdGRmRC9EaERw?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6649f065-7185-4073-2c15-08dbcfd193ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:58:44.2468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OGhWRRl/L9glRYw7Yk21+CmCIWjAYbaeL8F6R2xwr56IAezDZRUQaPFvnyCu3ywEgMUM/b7tt15LXTqNvdEm+1AWc5M3zmIRCTamXQBUf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Fix header guard warning
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

Additional underscore in the header guard causes the build to fail with:

drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h:6:9: error: '_XE_ENGINE_CLASS_SYSFS_H_' is used as a header guard here, followed by #define of a different macro [-Werror,-Wheader-guard]

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
index 60469fde41478..ec5ba673b314b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
@@ -4,7 +4,7 @@
  */
 
 #ifndef _XE_ENGINE_CLASS_SYSFS_H_
-#define _XE_ENGINE_CLASS_SYSFS_H__
+#define _XE_ENGINE_CLASS_SYSFS_H_
 
 #include <linux/kobject.h>
 
-- 
2.42.0

