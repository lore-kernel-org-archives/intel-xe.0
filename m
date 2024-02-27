Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8B2C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 18:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1028510E6E5;
	Tue, 27 Feb 2024 18:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekzAsmRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7BD10E654
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 18:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709059056; x=1740595056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Xg9SMB4Nc6h3WsLvDMoQz9mzxKqSZSOv6QyXhXqMYo8=;
 b=ekzAsmRsFgJTe2b3Q4C4qnkc8e+S4Fq+nb22RCruisO1hN6h+NxTsp2H
 wVWt6TuULROWd6HfkYmnnig3uhavnHkvxcLSNMqgT6YR7aT6e5AjDhZ2n
 Hacz2Gj/7PJf5osCKuNu6ziC6UTwjNoZKS2OldSN3rTDSLqeszW2jkn20
 tY6m59cCAcQPtEtDjf8OtcWGFi7mS+lkUxh3wXlL4atNnVBRtCwFbxzrL
 qrMYueVHbW9OFlzJq+yQQcDXhCiaEcscy2NRrkRXeu2KNwJKBPgiJkhrs
 XdFZc2Vj7DvWlX8ktBHntbWl9qnawKRX1DJ+AZ9aKLkm5pG79TdrSzpY1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3583009"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3583009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7281832"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 10:37:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:37:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 10:37:35 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:37:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8RaygaaGVNl2QgAV0Zqz+l4W2q5sfuqgTBWAgSw6AEu6J1O5tfUo6Z2tb2KLIprS9KB0kEQMp1VKqWAdG+LNIlKqXkoWoz0pBVrWFSSTbUg3iDmx06YIwo4rSHROiBE8cL8TzEWHFpIXsSHrav2LSbPo+zCYfOpEXbIkc8GR+IacsTt8DXqTYizEWeoofd9vcw5PV48pUuyRbMy/PNVdLSGdyHHAEuMX2LXthuFn8EtGwq8o0Q4y2g+UanXljbNHIf4ZMo7VA2Brt+Yhxfk4cLtrBYoJwet4bck6XcADL6BgtpIQCcUqPsan6frLYSLOl7jfBzj2wKkA6LkWIqieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MllK1ZOPceh8TAovb5dq922cQ1kXQEvJcekZtXbluBY=;
 b=muzz7Xm2MId/LcZyb6GG7OLINy0ZzSqKonaMuulks0W5u+4hXEdjpdCCzhhFiYP4Jj95aimCTFOJ7BGyu0ciLs9Mhz4UDHcoJSNrKylweOLDhzBUcM6qTnCEm5OW3QW5PmQ7el59y/q6gSVQBIwGpuT1Kx/cF5m4XBr0sQpr/WY+rVdbGSkdjDDkdfTkPM5lDTUA26pALVF7r9rSUXlGDrX1VRO99qT9WOIDPp5euj38pdchVfhwajmPc/AYgXn4CcfKx08x/Sfk6SRPeaiR4+STA1xHLLfLVfcsP6M5wZwa9FZoxTDnxFgbnUR8m0YdjbWcVjHugYU0Fub5KZoxXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 18:37:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 18:37:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH 2/3] drm/xe: Create a xe_pm_runtime_resume_and_get variant for
 display
Date: Tue, 27 Feb 2024 13:37:24 -0500
Message-ID: <20240227183725.505699-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227183725.505699-1-rodrigo.vivi@intel.com>
References: <20240227183725.505699-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c212e6e-ff3e-4f02-5dc7-08dc37c32904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMRKxKZzlL+C8OD0L+lR/LFFBg0epBZ8K6d8+PS8vcCojYramDIjTXT46wxgGICobGsHrUJO0HJNUgsNK80cXhQ3wgmR7VB3iJUyDX9yJHKY9Zc3kdIm5pJQnBCIWwDTihBhdmCyOgif+22cJJCgvbY7blOJyWXinW0ptEcuP6vcQwoZt4ehR+ggLrn4t6PgWXsAB+5y1CDzzjSUUZanJZAyLyeOj8JCxrjxLMKftxlRBptsNVP5eEKuw+nHSD3PHaU2g1/9rt+sln4zPh5aEyLIuq1lCrTLoHh2IFlSYusa9QTcqXLUZzLnDZNR7eJ48N3w6vP0jV8v7bngcL4ximqUzEF5i8kg+M9Wk1BcxsicHPHQh1HcJv5EIzIwI1/58fyEowB4UdeqRjuMzBgS5i0Fm2z/ot5rB5e/0JJ88pyM9SipVY4zT/pYyG97vQb/N+L3Es9pKN09YOzGhWp0IPrzHpvnmdp5Cx6Dp6IACqipBMeae3cIiWjQPY+GMoxCU3yuRYYmu9g7jbFVsXghyoD/yQwNki7QuZqihX39DXvo50XC464AZbqMjvJuEVXqYZwwU/HpVJYfK9WiVjbpfkbddzln57nIJHSfSctJsqWHJtQEM1zAODWy6TF/EH5vqERuuqsHtcLM9sPGENQdIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cyXaGlKs8EeBX1vpoz4Jg6qWhX2g1ZsCg8f7iM6CuLQ2GW8fvuZ+xLRo1YQI?=
 =?us-ascii?Q?an04R44G7poZYeGGYBsyx3oI1C841SuNJK8K+W34z+xGPfZIwlI88rJ5HdJ1?=
 =?us-ascii?Q?jUNaBXk11a+YgVTBLDzh2C6mtSRZRNZ/wTvz480ureIRH/heiWCeyEuhW1zC?=
 =?us-ascii?Q?x8iWW2SVBD6xISnxiKI5OyKhlQQ6utA4eZs69XCNx6ush+uz6QBD6Z1pswHl?=
 =?us-ascii?Q?ewAwVQ8akwZMUkvwRTnwxnUj3A9E2X6q4dv9GlcVz5OkSdtTUPNNl4yWFWZu?=
 =?us-ascii?Q?lC14hD6HxSW8FV5XfTcWpKUU5L6QXCH8+2bYqtg0id3xpA/5jgDXYdUg5DEv?=
 =?us-ascii?Q?fHYNaVcp4+v2BO4OPXW/Aqt9jeB7Wacas3sHPZRofJiRl00KXND6kw4b3kxx?=
 =?us-ascii?Q?LgxDV/T4RjLZYq9W4tsczEiqW5AhwPNJo/5hRpkppCAAjXty3b/fRM/hwKJ0?=
 =?us-ascii?Q?78uR3bplm9h4zTLaD58f6vQ2Q+TntaOustjkIRufeNGJYxNy2ytDtWTPFNCH?=
 =?us-ascii?Q?CjUFfIIYD/wB4YpN9/7NaXGBtPyRhV0NDp4rZTvJIFVFZGnEyOd7j0SSrqCe?=
 =?us-ascii?Q?KX5mMxBJ65ZBN/PYlJTH3LdcJO86UwBP8ApXty8pkivnbRrvWoFCYbc0qjjP?=
 =?us-ascii?Q?kHeuB6WqJojqcYULl0mli+z4+6sjRJrB47BA0iexk/ZXBI8CEXKMT+4gvPrQ?=
 =?us-ascii?Q?pEVC/XqijfWUDSvzDgclZBvZUdAn041n44ksTk/khxZ8K1K5wLoAiVIQ1/x/?=
 =?us-ascii?Q?lbY9ejngnzUNB30J1IvoTAcJn7YX3aG96pQw8NeGWoAKGFD8JmTUvCHTyih9?=
 =?us-ascii?Q?uxb50pyio56QzEllcQ/My6kX1rZMWe2aveWkqCH8WA1e38RVQTVM+4FK3Etd?=
 =?us-ascii?Q?i876vblu3zXy2ovPVVvNom1/V7WsWGkHvQ4fTWeKOVT/PsljJOUWm8OyWwwf?=
 =?us-ascii?Q?FYJk1gVwVYudRT6AcGYLqRwqfDmz/jViylkZ+r6hX7if/DRMTl/C/Pml8J7U?=
 =?us-ascii?Q?tFQ1eEETO6pW6iCErjRQkJTggGh9W1NXhvILS9JMFdYaG0h44RiCrdb6aM0h?=
 =?us-ascii?Q?TZSF0QobGmPhexD0/mk5ggFkFe5yy6R0kpWzdJvSVaEJ9M6fkPz/q9hWwhPo?=
 =?us-ascii?Q?sP0J4EjX7GKJpGz/8GqoZjW/2spB3oypbadqfH6JEFRh/LxG6nNs1x29OUZ9?=
 =?us-ascii?Q?8Is0v8ion+ocq1vgeNAYOXbCORfgWhrp6gjPj6T8cZzA6O3CaUau9UJWRv4h?=
 =?us-ascii?Q?LOoVnIiJe7wzWYUlTd81i6fzv3OIvaEHf152lMwmBF5f3D2IiYEcvsphfPE5?=
 =?us-ascii?Q?vUwVjhrSRAVksLXgCHhwhk9NclB2aWYewJ+BNOHprjIzQRIHExqbzTSpQeFp?=
 =?us-ascii?Q?VOVwVuOzQGV8yFlHm5WFV+vmfHgLW6AJZdgqBT5+RdW8Qeqm6RLCkavoigmf?=
 =?us-ascii?Q?/AcQAZmJfkXanFxpDwlmLDzZTykTp4nRX1Pe9kOXek6IUFTwJBawNtDYaK8K?=
 =?us-ascii?Q?7bTIXlidOM6DAmn6P4tMhQ9d4yhxpO9rZ2ymtl7FgncwH3jBNx6lQivTCI9R?=
 =?us-ascii?Q?BJUVxZyegUj8MyODDzvMV0XxnVCttmpEvkco+siR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c212e6e-ff3e-4f02-5dc7-08dc37c32904
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 18:37:32.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZW7inE92c0cVMO2wTStyfciEyq4c35Dntc8/TJCUdtehTIcpwXmAg2iEIsmuHDm+7wN8wCMpNxBNAcLeMzk//Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6083
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

Introduce the resume and get to fulfill the display need for checking
if the device was actually resumed (or it is awake) and the reference
was taken.

Then we can convert the remaining cases to a void function and have
individual functions for individual cases.

Also, already start this new function protected from the runtime
recursion, since runtime_pm will need to call for display functions
for a proper D3Cold flow.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  6 +-----
 drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                      |  1 +
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index ad5864d1dd74..fef969112b1d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -166,11 +166,7 @@ static inline intel_wakeref_t intel_runtime_pm_get(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
-	if (xe_pm_runtime_get(xe) < 0) {
-		xe_pm_runtime_put(xe);
-		return 0;
-	}
-	return 1;
+	return xe_pm_runtime_resume_and_get(xe);
 }
 
 static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7d7df78f3a2f..3e13a666fcc7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -474,6 +474,23 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
 }
 
+/**
+ * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
+ * @xe: xe device instance
+ *
+ * Returns: True if device is awake and the reference was taken, false otherwise.
+ */
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) == current) {
+		/* The device is awake, grab the ref and move on */
+		pm_runtime_get_noresume(xe->drm.dev);
+		return true;
+	}
+
+	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
+}
+
 /**
  * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index bb4723a98405..29c20099a3f9 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -31,6 +31,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.2

