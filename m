Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C653C4167D
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7706410E8C4;
	Thu,  9 Nov 2023 14:58:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081FB10E8C7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541934; x=1731077934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=G+Mc9+wkkrjhn6dNwNITY6+SV1QZ2WC7foHPI76X8Cc=;
 b=PggVn21fLaAH7J2PgCqC4rgt+KiKWBMk5GqsTmY9Riv49vUc5vy2FrH/
 RmXno0zN0vog3T4X7obwyPqpLnuWhiyG7ZxchhLgl+XFWlSTtSL7Pda6f
 UK58HXgJBgb0cAagyr1gy3gN+Ff0uxa8NseCaTQjat9mHy/sdVLEF9MrO
 eRF/EUIwXP9o8F4pi01TUhm/WcUBWpVN92WiqYMwXXa2JVPj3kZ0Hsv4y
 AKW+xWD1XXbov0pwWqanAbSboOra3zjBZby1FT/4uRfEW1YtrAzz+IIz9
 sSc172cEpDhBQiNyJBIyeCxXMRh6AOQyqLTdnGQ2KyjYzNyJ1dOxLNe+/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300305"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300305"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="756897381"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="756897381"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g71Gs3OUM+e5xhcQcOBpN8lcWCWqlCZ2Dg7c50OzuciHaiOsnso70S9BDp+dc84SCS0n+iJAy5ocbpKAbi1lWMnUlcZrGtOGtBVpjlQzYQTcjFYfI8jWE/ltyDlEQ8dvwjm3BNveSQjziOoDnVMy+wB/0UPCzPgkDSFgiokwn9ZFRgJfhn0mPJhL4Ugxceq8zYNJ3Pjk1srklA3GZiYsUxSdwez32QIP3jlZrkEs/ggATokGrIbA8Yn6pHjwWC0kaaKDM5v5+uZNco0j6xoGhTQepZwblI37E9uDdpVTchyqEl0uWmXxljXS6QWCtCC/losMJuXeMVnVHUFYvfphNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ra5dLFAgZmXFIgql0st6PzK3MxOu014EoXf0ao9dn1I=;
 b=Hs029QpFNI8uV82jGu4li+zHlMBn7YZSLQLVlsUauj0OHP8KaFPrr+ZLtG62FFjORblw66IwQw1oQzAWmWFsRqJtzyFWqjBW/I6OMWFOnB4lbmh09SNns65UEm5DAUOQRb0L8iFsZL/mnmmFhSAH0V9iC1tozlXLemKzBwMa+Y3dAU2uytLdtPQM57DcRIFgKBK1OzXrzu6XbHhJPzEazJ9Hy9Kk97pee5guxDhnCZR3iTXvCbix7kbcedikUynneqLKzHh5FgbGt8WqzLhMadSFFCUDCsJro0OI1lDpcBjUQzoT3u49Xv16lA3h9NxLycTg8lfEelGMIBM//5NtKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:28 -0500
Message-ID: <20231109145347.345120-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:303:8e::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6795d24e-35ac-49b2-a892-08dbe133c865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: niBoM7j1ozvRm5Kgwe0QFLW/bp19T3HIBttPcyJZmv8C/xTab4LTS5ys+pQWpRlrmUf57th0ZfiKYlSYmC4eUSFMDD6tfhHM3WRpyeKsM+fS9cRMwUkWvVtKSQz3wbHbcZk5aRoixvd2yuzBd74W9Nqsd1SLaWnKhCnDZpYNkHM9pOdhjhi4gXO4D4BWiGR11BAhAt4SrEvZg97BZj9+4+kGWQcnKFTA8/Of3O+7aWf7FRtbwGlyRN+Ups8V6geOTYUjoMYS+jETNKRexZ3H215fp/z9kNKzUVfmfsfLOcZCOg4++Fd1iBWthhrB/cW2a+4PFPP5k+nKhY85cCnnosPhdtDbiS2ejpDgi/CzNGy5EKMuMSVZSM3SSazMRne6bpy3XVEx1Gic9eJplcdXcw2tou//OXGwowpuTzd6HdJ6d1YG/llEJ8md1PnY5hfWZq4YQYI0oxwKF0VLeRMTNCwT3QCOhOwNCka+hfV18xqSPoyvVu7qye7CZJLVbS7Wh5cK4i1pk3OKJ5gxD2s/OqhaxlXQPy56ZMxeMLwQmOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(966005)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(54906003)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clpMbFZGWVJnaWJsaExRVzFrU0lYNDVsdWxqUThzbE1GMGdocTJlZCtpdWFB?=
 =?utf-8?B?YU1VUERtQ0M5Wmt5alp6NWlTVVg2ZEUvdXZHWmJ1ZjMyWGhGR2VlOWZudjFx?=
 =?utf-8?B?MDduSXY2dXFZWkdPWTRNTGRjeWR1aWRvNE9UZGFtYkJYVCsrbTNWNXF5ckZ5?=
 =?utf-8?B?WUVseXZnMHBPeENuMnIrY0pUeDJyQXhTOGtad1Y0NzM5SGkrdzNDYnRkSnlY?=
 =?utf-8?B?S2toYk1Vcmo4OG9lOHZGK0YzYldSNm1jU0Q2cDQ2NlM5Q21vamo4aFFIR2lj?=
 =?utf-8?B?c2tpU3NaaEV0eUk2SnpTM2ROQTYwRytUaEtmbVdwOVdqVUswVWdCb1FYWk9F?=
 =?utf-8?B?Ulg2TTVUWXlJWjBrR1djak9Sc3BEM2E2ZzJLMU43WjZXQjM3ZmR3M1FWQVVU?=
 =?utf-8?B?amlmcWw4bXM4T3JjSkpmTCtzNm45V0hDdkE0dTh2a2JoYzJ4c2liWWY0My9l?=
 =?utf-8?B?c3R4ZFNZYzRUQ0loRWRhVVArdkhIR2puaHN4RzR3aXpjUlBBM2hBTEROS2JP?=
 =?utf-8?B?RnJYUzNNU3JDUG5hVjU3bVcxWWFuS1V4SUJiSTZWWW9CMCs3V05BT0k2UmVP?=
 =?utf-8?B?ZStYV3pqejVnYmZtaDJwTk9KRkFqOHU2SVlmZkduTEZQd0F1WXptVXpJeTM1?=
 =?utf-8?B?WmxxZVpiekM3RklFR1lxQmZVMDJjTXUvWEdIanBsTUZ5OUYvMzVwMjF4YW5P?=
 =?utf-8?B?TkNNdHYwNFo1d3d3OU1peHorMUQ2WHd1N0VhYzZwVG9QSEwwY0kyMFhpVWM0?=
 =?utf-8?B?dmpxakt6VG96OGV1eGdiMHN2ZGpId1ZBU0VYVGJiVGRDd2ZXNGU4RXJXSHph?=
 =?utf-8?B?VEVucXJ4SHd6eEo0OXI2MGZ5OCtHZmdubEZGT1IzUERVZ3NhbDNnNHN2OVR0?=
 =?utf-8?B?QjRyL0pHTWg3dU0yYld5Qk5UbC9ub3RtMTMyMFQ2UVhCNWZzbTVNYkVqMm1h?=
 =?utf-8?B?aW5RR3ptTlprRlVvUEFOTFZ4M3A4SmpvUWNDb2lKL0xyYjczai9XSWM2dXpY?=
 =?utf-8?B?aUp0SXN0dXBYU3pVVnlpenJ0STNWcmZiSXJsS1pjTnQzeFFHejkrZTVUZndD?=
 =?utf-8?B?WFYzOHl6UFJlYnY0N3ppODJMWUlrV3BHdERaY1UrNnJCeHR1blZ2cmVUeHJJ?=
 =?utf-8?B?L21zWjNGOUFUUTUvV0d0bThQNXFTZUJyeSs0dUE1dEs0R3M2Vms3VHg0WGtp?=
 =?utf-8?B?WWFBclF1ZlUvQUlZNk9qeDFtMmd4c3hkQlRwbWNlSm42ajNqZVpzalNuVjMy?=
 =?utf-8?B?czBNeWRwK3BUdjRSV2FEOFZwY2FCRExTRTJEeUdFVkxNN1V5aUN3dGdmYWlM?=
 =?utf-8?B?S1I5ZHk5OFFkWk1OaThDbisyT1NXRDljWlhSRXlDUSs3UHIwNzY1bS9mWk9B?=
 =?utf-8?B?R2JvWUpqeDR5UmcxRDg4bmRFNW55a0JJZzIzUGpVRzZNcXdqQ2ErMmdQaGUw?=
 =?utf-8?B?L0o1cnJaMmowYWx4STd6TXFPUGlZSXh2WnVCUE54dHlndFB0ZG5XRG5RVUF5?=
 =?utf-8?B?eFlkL0V6S2pxY2ErSEg3WkI1SzBJTmFDempmOE5CY3FoVTlkVnJrZlY1ZEs4?=
 =?utf-8?B?ZnhvWUQxa1V0akRWNENSRnhPZklYS1E3bWdZTk9pZkRyK0xDcWd2MVdTbnJJ?=
 =?utf-8?B?MkFGaW9STFAwcWEyby9XZ1hWcWdadGQ1U21NNXZvWVRid1JwSHB3UXU4SFRM?=
 =?utf-8?B?OFNyNk1EZ3MzQURIR3FNbFI3dXB2aTZzaXM0R0JvOGtndmVpMFBqUGZ1eU42?=
 =?utf-8?B?aUtydXgxNFJIV3ZPazJBOUthRHdwOHVtVEhwNzhwdldrM01YT3JHSG5ndHIv?=
 =?utf-8?B?d3pXczZEZklmYzZmQ2MyaTlOaDlvb0R5bXBzRW11a3oxbldMTk1RRWtaanpC?=
 =?utf-8?B?emxLdTFlZnMxVTZ0RTNmVFpxcEFHY2tQYUVRWTM0N3JoOGkvek9BUjFIV05T?=
 =?utf-8?B?OVV4b2luM2dFdERvZElEM0pNTGZuaHVWelBUWis3K3l5ZGlLZGFHRk9RMENQ?=
 =?utf-8?B?cWZ3MDFCUEJjdnl0STlmcktzd0dXK3dtR2IxTWRJRCtPMWwyRXpEb0F4WHEx?=
 =?utf-8?B?UEJVSHpwakFla3N6THppWWdwUnArMm1iV0RXczFEU3RjU3paMkNBWW41QzJz?=
 =?utf-8?B?MTNMUGxVVWFjMDBJc0p2OUVrYTRsMHZlSXk3K0I0dmtWSDIwSHFpajBnQnhn?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6795d24e-35ac-49b2-a892-08dbe133c865
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:32.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY2fDSHwZ2v23K0vRa3i/rHzYdn9pM+aWZ26vvYJpI1vAaudcVOIpJzOTMIVmqsnfC4o1hjA7CF+kEenITF3IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 10/20] gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

Eliminate DRM_SCHED_PRIORITY_UNSET, value of -2, whose only user was
amdgpu. Furthermore, eliminate an index bug, in that when amdgpu boots, it
calls drm_sched_entity_init() with DRM_SCHED_PRIORITY_UNSET, which uses it to
index sched->sched_rq[].

Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Acked-by: Alex Deucher <Alexander.Deucher@amd.com>
Link: https://lore.kernel.org/r/20231017035656.8211-2-luben.tuikov@amd.com
(cherry picked from commit fa8391ad68c16716e2c06ada397e99ceed2fb647)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 3 ++-
 include/drm/gpu_scheduler.h             | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 0dc9c655c4fb..fb050345b9f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -64,7 +64,8 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
 {
 	switch (ctx_prio) {
 	case AMDGPU_CTX_PRIORITY_UNSET:
-		return DRM_SCHED_PRIORITY_UNSET;
+		pr_warn_once("AMD-->DRM context priority value UNSET-->NORMAL");
+		return DRM_SCHED_PRIORITY_NORMAL;
 
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
 		return DRM_SCHED_PRIORITY_MIN;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f9544d9b670d..ac65f0626cfc 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -68,8 +68,7 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
 
-	DRM_SCHED_PRIORITY_COUNT,
-	DRM_SCHED_PRIORITY_UNSET = -2
+	DRM_SCHED_PRIORITY_COUNT
 };
 
 /* Used to chose between FIFO and RR jobs scheduling */
-- 
2.41.0

