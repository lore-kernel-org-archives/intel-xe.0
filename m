Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0175C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B7210E241;
	Fri, 12 May 2023 18:03:56 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0401210E241
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914634; x=1715450634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XBWnATPdeRVCTbxTtuyl6ngFZfvDmqje/GxFxDJVU5o=;
 b=ICQsar3MNLxeiX73VU9cilw3yCe/2WaO2Am6ng2IuYxbBGD7hCgIT+vK
 rn2FAG/86koFk1vV1s/Fjhw0Q7f5lYwjdMIN4aSpNwcT/JkxxL6HnQ9Tn
 MXUiKlR/3B83bq3L2evrSGl7Vz80SB/Sl4gDVuW1nD+exPhoEpfaUtAri
 SPucz2gQfRc6Bu45BBMetXIqonKVNAOHAR52svA9nvQzef73x8rh9Yj9U
 hwiJxsMJlQt6JBLfXDyo4uFBCY+0FOQaMoqgtB9TcEVuLvtxuTHqJzuWW
 iVZyWEXrWP58hoO8zGXkbQa01Q+oBSp6LrBEqXw2EWFlQ03SoR0S+oPy/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414227804"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="414227804"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="700262243"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="700262243"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 12 May 2023 11:03:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:03:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:03:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgstbGFnTCFgo20tf+WkaM8fcCdb4s99AXEjGHpqHJUsBEgvDrhz22P0Dz+EhqqZp3J605MEe1EC93vyRUhvNK+5lBNxgr+U8Sgh7+jiJY2QXGUs4DGQ+4SzHGQh8+uzEsRHum/CtMK2I2L7N/LaGKy0y1YzDuD/9Rjv2L7GfPMzqDez4RBTo03mB8sJNQv3aVa5HAD8qZwjQwLMK/f/ya+MttYP7oGXr2Yzfj94pD7uzZ1yBKPp5+Dut+p2BS618amoDfR4LbLnNywVa8JRrwLdFaCXgSTvKpkeh2aZIz6JDAivyx0/yjBLYv1gBsC/UANcgYONP1iKut/G+drZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBmCrX+4dN1dHYENBN7lH7/3m39auTnst3tiX7/nvNg=;
 b=aFdax6lRvoM6/DY8fuGjysHpNn2bU+O91ZcbyYo1H9OD736xMf6Ps6147HXH42B/94c5g9rLnHs+397tkS7JDqcFCJexsmyJ6IO1FzPZmTNFpUa+zYGhVvTq3VlLi48vY45rhOEZzJDG+Kgfkhjmhyf1KzCoh4ToKiDHBikYNaWlRvnv5m6q2TuiQ38+Xwzbl1g/gHItXhXT9rlkBT+LPcWiX+l57jdxP5yL5Lp6oorOZ8AHu0wAjdEzbm0kxo3dCLF6tc2SCrHIAmX+UVN19oRN7axdqshe5ZR4T+2akf9clU+p/m+xfThq3oHl11FB9Bprzbn1heXrOsC4CNSzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 18:03:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:03:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 12 May 2023 14:03:12 -0400
Message-ID: <20230512180313.1765011-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: fd965803-9647-4457-999a-08db53133d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2R2k7ii3KYLkTlIma6RO7iWzeHboOHNNkYSreXxmY6bGWkTutcm0ajw4ONHD68p5XLYlVZs59wUB2RFSCRZNS22xCpgU80KeDCurkHM7b2ycvjDTPa+O1Vn6raHLnEQTq/L8K2Lr96y1shO+Ob+LVJosbyMckYMW/IYhAimBD5ps9nEBaQJN7FGSFRHie1eQfGluO9Sii6StFmmQ71t9cGE6vQCeSWujfqQMOD+4aFHBact/YgvVv4L7/RCLs1Rt/DZq63Mz1CchPQ0zVXyOyF93RInSz0J9hxhqtdG9YpQqEtEHVNrPSPIIh4CgDVwV+f581RBd2Vwfm865+1L2AyxgXfNvPVfEf3q0DAqDXWFrM2pgorceJS4sdBlc8c29S4ihic9xJC7VMui+yl1Cq3gv7Ohls2dPLCwRdldo1Kz0rrqE0F9Y3DtUN3MbFtBjfBRC5v6zi0l65KGXlnXYOuUzMskL8qyknhV7bJVB7GFhC7/jWobLwxL/NCd0bYAZNcBjjNF3OAvTI8AkdvDgoz+s0KkMSh3nLQmfHpHHYsUIOp4JBJ4VAGi3ICGxH78u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6486002)(316002)(6666004)(41300700001)(36756003)(478600001)(86362001)(66556008)(6916009)(66946007)(66476007)(6512007)(1076003)(6506007)(186003)(26005)(2616005)(83380400001)(4326008)(38100700002)(82960400001)(5660300002)(8676002)(44832011)(8936002)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3F5MlNnOUM5azFHbXNNYm8xOEFHem5GUUh3MVFlbVJNdGxMR3hPZkxEdmNV?=
 =?utf-8?B?c2Z3T2NDWXg5TlBvTXhJek55UjlBL29mRjJGR09BaDk2TDI3UkZ5TjZIMGR4?=
 =?utf-8?B?RkJDYjloNTZLREpVQVBqQkFDN3RMWnp2OEo2MEVtM2htUjJQdHozSkJzdE4w?=
 =?utf-8?B?TlZIeG90Qy9aS1RJeG02dVJzRTUvS2FvMWZSdWZsWmgrZjZwd0Q3aVd0bmZw?=
 =?utf-8?B?aDlBMXRIc2RXVVJtS0FrTjdSSStoaGU2N3dod3N0RU44U2FZU3BkaXpsU1V4?=
 =?utf-8?B?eEswRGVDNVF4NTdHTWt0dE5JbGwxL2ZGZkZVb1lzNGJnZ1k4d1Q1UXpVQmZu?=
 =?utf-8?B?QTRXNHJwWG5ZWUtpK0liR0tXNkhZOTBmNU9zVnZyUzMwbVQvcHFFRGRKc1hR?=
 =?utf-8?B?Vnc0dDJjRVRGT2NGNVVCUis5VkdDMjZoYWR4WDA2Vm5KSXNCTXZ4R0lxUExR?=
 =?utf-8?B?bG4rc2hhWmd0LzVTVUpHMk9GOUpOYnhLckE2NUlSVXEySHU4dE1GMTJzZEwx?=
 =?utf-8?B?bUJLZkFaaDZCMlRhd1pkWWtCYzJkVzlrdXFHMTJvTUFOZGZYZElzZnB3T3ZS?=
 =?utf-8?B?Vy8reDRLTUc1N2dHSXdoaURibzVTVDhHTE9QME9lZ3lNMlBxTCtnLzJxcUZt?=
 =?utf-8?B?bHVLRlNFRllkYU5GY3kybitKMHFOQk1KZFJ0ejV6UG9OeCthVDIrampQQWps?=
 =?utf-8?B?bGl5V1d3ckR4N3lkczZSOHl0OEtoTHV3RllFNEJCRFNDdEUvWldORVU0UXhO?=
 =?utf-8?B?WlJnU04rdUhBVDJEcjhZQW1vRlZ1ekFFQytoM1h3TmpJZENBMVpTVHRnV1Vo?=
 =?utf-8?B?L2hBNWZLZWc2eUlXT0hRaHpIMlVjVjlYNUMrclZzejNPTHd4VzlYc013a29F?=
 =?utf-8?B?NWpCVGUzd2xnZW5pQnlCYjQza3FDbndveGJkbXpmQmt3Y1ZZcGJSaWdHVGI1?=
 =?utf-8?B?OUEzUG9GTTJuTk4wVHRhcVdxVElFdm4rRURmNnZ5NWd2ZC9kSFVCZHk4Nkdy?=
 =?utf-8?B?UDdGOTR3cGFTbGNVWUt6d0o5dlJPTkZJS2FEMFVqZ21hUFdzSUlGaHpPRjRW?=
 =?utf-8?B?VFVOUUhvWnVJYTFPSnBtdW9zM1g4bG1CSnJhUEd0MWNYdWxVZjRxd0NBV2JH?=
 =?utf-8?B?bVRvS2piam1iSUUvZjNESFV0eG41RHNCVHZldTNPdXpVT2pqQ25EenQ1bFFk?=
 =?utf-8?B?Sm1FbmhFMmdUWVBEQkZ2a1FYd2pja1hNUG5xaVRzL3NHQnI1cjM4Z3dTUFZj?=
 =?utf-8?B?cjBuSGtZZ0dWMm1PdVhnVElkdG9jN2tnd0plQTRlR2ZWNHkxaEpCcldGVG5z?=
 =?utf-8?B?V0krTDc5MFJEUDhwZkthbldWSnBCM3h4cys4aEdneFFDemtsbkp6VmRkNGpX?=
 =?utf-8?B?ZEtCNmxPcUR5ZGdOeFpDQnZVM0ZwemFRb3FiQklNclE2c0JjVkc5MlJta3lu?=
 =?utf-8?B?ZUswZDNQS2ZSSlNnSEYxMlQ3RGNpYjl5Y2VyM2V5OE9IWmdOYVhJZWkrMEVR?=
 =?utf-8?B?MlZISWRFZlRvV2ZIUlFWekhQbFIvTlFDSHFrY0I4bDNLb21DYjFhSStTaVNE?=
 =?utf-8?B?NWFENGx0WnpwbWhjcTZKSGVYcnBRbzd4ZVdHcHlGSEZLQlhKV2NxTFdyN0RX?=
 =?utf-8?B?ZzNzdHZUNGFFSmtyZmdPZkFRM3hSbldwM1FLQ2xXaGYzNzhnWVE4Y0RkU1dn?=
 =?utf-8?B?Q1RNT2RtMmxhMDJ0Zno3L21MVU9FTVZodWl4VEZ0cnA4SW9aVmJ3N0RpNTNj?=
 =?utf-8?B?YmFHMk8wbStZbmVIN0NhRDNsYVF5Z1hQOTFQVGJ2RWc4MEllK0hwNkd0cnEy?=
 =?utf-8?B?VFZORUM5bWFnWHBQdzdoRHNOTWc5bEZMRWc1NlNGZGRrWHZoamxuYWdYVmlP?=
 =?utf-8?B?ZXJtL1NROVRTektZUVBucVNudDdVUUE2Vi9mcStBVG10NWxYRENiRWFGS2JH?=
 =?utf-8?B?dXlsMmJ4bXAyUlJqNG1seVNwaGxYVDJtTW8wbUZSWk90bXZaanp0U3U4RXoy?=
 =?utf-8?B?R1YxWHhzUytsVkdwLzc4dDNtUWtFbEErLzFKa3JQVkNUK01Bcmttak1HZGNz?=
 =?utf-8?B?ZzNPNVJiWnZGa0xwWDV3akM2RUltVUJYWnpCbUcxc3FnMHVobmg5cGZmV2tQ?=
 =?utf-8?B?T2kxTEpDcWswTGdHemRmdzRTdFJLK0NxREZJUDk2YWRRWnNIckxjMXB2T2ZD?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd965803-9647-4457-999a-08db53133d32
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:03:50.1533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tP1YlQx+qrOTdqKQ9JvJuPOv8kPYg6/vrJI32iRLhfmmI3Ua4cgXn1EhJ2a0Ohsb5I3NlaYJ7mCiwwmPDvnmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 6/7] fixup! drm/i915: Remove gem and overlay
 frontbuffer tracking
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

drivers/gpu/drm/i915/display/intel_sprite.c: In function ‘intel_sprite_plane_create’:
drivers/gpu/drm/i915/display/intel_sprite.c:1630:34: error: implicit declaration of function ‘INTEL_FRONTBUFFER’; did you mean ‘SNB_FBC_FRONT_BUFFER’? [-Werror=implicit-function-declaration]
 1630 |         plane->frontbuffer_bit = INTEL_FRONTBUFFER(pipe, plane->id);
      |                                  ^~~~~~~~~~~~~~~~~
      |                                  SNB_FBC_FRONT_BUFFER
cc1: some warnings being treated as errors
make[1]: *** [scripts/Makefile.build:252: drivers/gpu/drm/i915/display/intel_sprite.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:2025: drivers/gpu/drm/i915] Error 2

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sprite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index d9713094735b..718fe026c5f7 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -46,6 +46,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
+#include "intel_frontbuffer.h"
 #include "intel_sprite.h"
 
 static void i9xx_plane_linear_gamma(u16 gamma[8])
-- 
2.39.2

