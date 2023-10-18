Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE80FCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 11:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B96810E3D5;
	Wed, 18 Oct 2023 11:58:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC2610E3D5
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 11:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697630334; x=1729166334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xJO7YInHKl/FiJo0I4JDNBOAKC+xPnzQb1sOEI4r2pQ=;
 b=ZPgPHBh1nZ9jDFSHDOXkt1JuWIXmJfIiQtEf/dY8dzjYjA3YLptwAurM
 EGH/sW8o4epHSheuQ6rY6MGy2NEX9dudiG4ZGlIEjCTDt0ltCxrib0D60
 GbBlQP+WebCXXMmpjI7K5Uoq9L8rDiMOY0GbDRVh/04vsk+SaI67ZLVVD
 78tKjTUQ9g5AX5ZhHDeeVavAEnGYkJe83J2yLqRVsbOhP3C6UPNXLJ93u
 PYbZIFkXPgCeD+AZJeM0fsxQeGUsIXrhF6omoHcGuxpfZ1xrA5vH7UkME
 m5xPvs4pKq0QyFNw3myNpQ3QHzLTRhciu/EUVqoUxwDZ0eSY6PX0inRQK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385829979"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="385829979"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:58:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="4508953"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 04:58:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 04:58:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 04:58:53 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 04:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3nqbvqMso7jpx5CTf165R798ufMdryrYu5Yr3MWe2U1hJVY67VfySX2dOAr+HdS8+C5gO+xM6Muuw6jT3L5e0PJ7by012Ar9XCKzr7SDSz51YbA+dUIVB08wKyTDHDDiJmVBMAZspqV1ngg0OXgAvZFaEtOxF6+no3YBKscW/GjEGDtcCHvmaJArQ1/osVBdsFj9FG3qT3vTrG9qPkBa8G1yFHGm9ehV/IlyaOSYLG3Hr610NscZAgH8EtCq08Yemhv3Dx5j4OW3c4K7eVUsHC8xz33TebV7ordgI1GIE0yHhpMi3dhGrl+G2BGVeMdBCxBofSGbSIznXvJkYrjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4vWIrXiG8cdVw8I0cCqVk3SDb8DHxDChnEeLsBtTb8=;
 b=PVrCN/uaD1709UmAgMu0rbvc8hVKkO6uSgdEXbmaDR6nSgCFNxHf+F7XVJjtnfgUja+sbc+qu0LV6zOhmmmPvK30coqqIDN69T3/zmu288Pvi/3ZLSQhs4sW/5sc9JyYkZ8v2NTwyfckdH0QRQi6q0bF9dwLvkL60ycgW1PfBczlVz1sskWVZtBghkSEk0ty4gLZZ6xeXsNcShhjxUph+Pu8W/A3G9QaFI6cgYoxCGB6iLJvCdhMwsnyniTpDqOnnxuFmlB+rGEDAXVjPsu+Z5ii71OKwqNFwFH3NZktLfcqDwmwVxRb5IigzSGA4R9wwCeg02AJvVB11j+4JVXaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21; Wed, 18 Oct 2023 11:58:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::cc5d:d2c9:b39a:3de7]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::cc5d:d2c9:b39a:3de7%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 11:58:51 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 18 Oct 2023 13:58:25 +0200
Message-ID: <20231018115826.3908905-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018115826.3908905-1-michal.winiarski@intel.com>
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CYYPR11MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 831f45b6-64f6-4ce2-aa55-08dbcfd1986b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4N1qa1g2tXxXfYjD/2GB3p2YOl+hH/6rRdhh9IOj+OCQsxsHZ3lWaPZYtaLHPwHDMdoPVKuJd+MP99Ok+OVjkXOF6CKZLD138kwITJMHUvBTSgmn4sbmnsKbgcSi04291pzrqzaheI3t2UBQJ3WFwWUCGa4tH7hY2N0zGkXYd+sgcmjQf/js86V+Rs1B+sWuQJjBUv5drpeNLAETCsXCXnplXIZJkQS71J/RgRKvTkTferhWpK7gl84j62mlKYX/1gOUwdnIOpWf5AzSxVVRqTKyjS1xgsGt9IlSVjRkNcXEQ5sOCGOaQ7rp2Q41AE9U81zNzlNGExtmkNpEa1dmV3PYNaR4b8BSyMSGoMV37D1RPZJcCEJi74383qvEzB07Z65JDd6G4U1UFODyhJzWhLifyfoZAxnAHwQ0N/1jXI2aW4wpwtCegBnpGS+1rkO+Shq1Wvko6qBGQaQnzXZMRCt+CijSffyg9f2zWwBVRlq6cavqc6j+NHiIHMfZgNVZqlV++KVZuh/t8yzJfREb7i158bTNRJXjiMMOGnCpu97b3oJSY3cbItJNMmJAPiOH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(26005)(1076003)(2616005)(8936002)(6666004)(83380400001)(107886003)(478600001)(41300700001)(8676002)(5660300002)(4326008)(2906002)(6486002)(316002)(66946007)(66476007)(66556008)(38100700002)(6916009)(82960400001)(86362001)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVZxRXdIM1haeW5Oa2hjbHNTTnBzWlg5UXhXL0ZOSVpseHNsZStUcFBNMXFX?=
 =?utf-8?B?WW1oVDdOU0lqWm83aDJ6aTVMRlRBN29KQ1pMQzdTcHlSNEdMcktreUorcEtJ?=
 =?utf-8?B?UlNUTHRER0lBekJFWEpVdEIxMzRSOUl0eGNyTHJMbEFFMWNXdHA0TDJQZkZN?=
 =?utf-8?B?OHYrS0FvVUJCbFJWZlRuOEdUOVUyK1lWVUFhVGlwcXVvMElwTXl5UTd1MHVZ?=
 =?utf-8?B?eC9hZmFKZ2JFL2F6bVczUmVYZm9DUVZ3dmlQR0NZa2NWMHBnZ3U4NytMMXNL?=
 =?utf-8?B?WFFpYUwxOGlQUlphS0Urc0RWMXBVTWVrc1B0bEZOSStMUVJ2Wk5ydEcyQUVm?=
 =?utf-8?B?endHN0lLK0tzUmtmK0VLMjNDdDRSNDhpSy9VOE1rOWlQdjVoTlZMOGdaeTR6?=
 =?utf-8?B?OEEwT2MrZHNoeXV5UmtKZ2xKQk5nNEtLRW9VaDdudEUwNXVkai9XUHY0MlpK?=
 =?utf-8?B?eFVIc3hEWVBiQkJaOHV1VlA1RHhWQzdGZkJZNHJ3SE5UWkpWdWlmVG1GS3Zv?=
 =?utf-8?B?TEZBQWt1V1NjdEJsN1crMGppVUxiSzBtOEhSMlo1WTkvTll1WDRlMXhoWXlV?=
 =?utf-8?B?VjFRclQ0R1lNV2ZOc0pvdjViVVgwTUlGUG9kSXlGQ0UzYWJHaFp3ZXdRQmlk?=
 =?utf-8?B?eFZVUkgyb09VTzVONElOSWRlMkg0aG1uZkw2elZ4R2lBWnY4TDJrSCs3U3Bh?=
 =?utf-8?B?MnAwampzc3VVbUQ1SGlRR243OFgrQlFENngwNFVuWGI4QktDRkRJRG1XTkpE?=
 =?utf-8?B?L3BCK1NKU3ExVXV5VGFWNXdLMEViK1RxK1c1aWtVUFJZTGpRSkwzUWlsMG1v?=
 =?utf-8?B?YVphUkUrTEsyZjhCME5KNUNqODRpa1NoTFhZWXpGOVVsbUxXbHMvOFNlTVBB?=
 =?utf-8?B?ZFAzRk9sMGUwY294a0g2VTFJeXJRaFMyNEVjbzB5YWJJeWo5c0szRVhscUY4?=
 =?utf-8?B?YXJmVGxNZ3o0TXJLcS85amhUTXZPTC8rYUFLWUVQRkZqZVVueXVZM0pnN0lP?=
 =?utf-8?B?K1d2cUxUeFlPU1RYUUNMZEwyeXJObnpxcmJlb1Zjc3B0TVZTQ1NmcVBKOWUr?=
 =?utf-8?B?bmxFZG5TUXFEc1JhRUlyMTBEVzhML2lCNVpyVzZ3b0hHN2hUL05tZTZyL1p1?=
 =?utf-8?B?NytOY2tqWGxJZ3gyT2lWWVlWemVRY25aSzVKNXlkdC9UdDllUVdjVWxzSkR5?=
 =?utf-8?B?T1dvSzgzREptazJ1dENUT25iaXAzOEk5MzFseXFlSHFBMHk2RG9QQTBneTla?=
 =?utf-8?B?eGF4OElHZFZvUmhielRQNVdRZVhjR3hGVy85dU84NlFlN1IzcXVyb3RNbm9w?=
 =?utf-8?B?MFNlRDlLWC8xaThzRGpGMWFHVEU3TUZjNFN2a0ErMnFzRmd4cUNyK0V6WFdr?=
 =?utf-8?B?TDk3NGU4eUhLQytHdjIveU51anJ6emtUY0ZGTGZFamZ5R1A4VlNxNXgvbDF4?=
 =?utf-8?B?Rzd5VUVKaC9aMGsvQ2crZFcxSEhjOWFvWERab1REOUVMejFmMG1GcnhGRThJ?=
 =?utf-8?B?UjJiM2s4VGlIRnlWNm1PTjllZHdRcldQUytkeHY2dXVWSUIrb3NhVDMyb0VX?=
 =?utf-8?B?dWkxNnlCdVVYQ0lmaXdpS1UrZnJ5UkhyOGNXUTcrMVBiNWxjVHlWWjlxZXlQ?=
 =?utf-8?B?UmprZDYrMUVNclhVZEtUTlpJa0trb2FCbitNcURqSVRjWmpHMkt3UUt1RWFi?=
 =?utf-8?B?VmlVOEZjQk1ON25wTHM5MDBzcnNhYkp1b1ZrT3RIeU5OckZBUWpDb0tETmhQ?=
 =?utf-8?B?cE1xdWRlaDU2U0FuTW52amhLbDJjWHR2UmI3RFIxTVhiZnM5bXEyY2hIc3d5?=
 =?utf-8?B?aFo1eVBrV0xiR2FNVDgxSmFhdG5vWUlGR0c4QU0xSmlBeko5cXoyRnFCQ0x6?=
 =?utf-8?B?TXd0WXhMYkJZZ0QrUHFYc3R2M2p5QzFRZVI4UFprZ1hhLzBpU3RBdkhtVmtl?=
 =?utf-8?B?UXNVRFkzMEVtMklod09yMlEzTXlZZkI4bUo3dCtuc0Vhc2RDOVBzb29nMkFT?=
 =?utf-8?B?RFJpNjJBNVVqeWR6aC9MaEVlTzVub3dkZXpNcmw2Tm8vcVZZWVByTVJ4K1dF?=
 =?utf-8?B?L0ljUUVlZnQ3R3RpZWJpL3VYbG0ybVUxSzJKVFJsallCYURNVnRYT0VmcTNS?=
 =?utf-8?B?b2lCZlN1Y1ZMcG5XRDVkRU9lZWtidUxJUEYraEo3SnpHaStHK3VnNFF4bnln?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 831f45b6-64f6-4ce2-aa55-08dbcfd1986b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:58:51.6321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAV0vegu9RsdS1w+JoCDnTV6imRmQdKszvOHFKUsUHEXl4/j2eA8JD6m3ndplQv851duGy4Jc3heqirCLuhtDh+iCamJaWknTuG4n4OWRxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/3] drm/i915: Fix uninitialized variable warning
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

When used with Xe, "val" uses as function argument name clashes with
"val" used inside iosys_map_* macro causing the build to fail with:

drivers/gpu/drm/i915/display/intel_dsb.c:87:46: error: variable 'val' is uninitialized when used within its own initialization [-Werror,-Wuninitialized]

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 796b1b36dc598..8d89c8f700d68 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -79,12 +79,12 @@ static u32 dsb_ggtt_offset(struct intel_dsb *dsb)
 #endif
 }
 
-static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 val)
+static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 value)
 {
 #ifdef I915
-	dsb->cmd_buf[idx] = val;
+	dsb->cmd_buf[idx] = value;
 #else
-	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, val);
+	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, value);
 #endif
 }
 
@@ -97,12 +97,12 @@ static u32 dsb_read(struct intel_dsb *dsb, u32 idx)
 #endif
 }
 
-static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 val, u32 sz)
+static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 value, u32 sz)
 {
 #ifdef I915
-	memset(&dsb->cmd_buf[idx], val, sz);
+	memset(&dsb->cmd_buf[idx], value, sz);
 #else
-	iosys_map_memset(&dsb->obj->vmap, idx * 4, val, sz);
+	iosys_map_memset(&dsb->obj->vmap, idx * 4, value, sz);
 #endif
 }
 
-- 
2.42.0

