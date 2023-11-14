Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C588EC4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 21:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A2710E4D7;
	Tue, 14 Nov 2023 21:12:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E64110E4D7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 21:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699996371; x=1731532371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MZyaCge8b3yQX6P9bSi7LhDERJbnCYJlau9cAFRToXI=;
 b=X4l8UYKUywnPNpD1PrDwMB2tI+S834kSYMOMp2tK2UFrt9Y+zpQmqFV3
 0GACpkXpSb+ncltDmAFuGSbuTWjKb9Z4nEch6Ars5H3VMTDxibJKORMWL
 eDt0E6JegeWtT2FXD9LtCawb7Q5SrCipB/Y6InRr4aNtxm6zc+cqOdgOj
 OO5iA3M2uTgpzxbVDgwJC4SnDeMuEZ120vO5b19VYScJWSdgQ0AJgT7DG
 Sh6yn2M+UzsJ5KO+NDetr9WXoxq80T5jaWC4Xp5jTxsGyseVINsCtNkjO
 TvXe3U6nBG4Tj3ARmsrIbFuIzWIK6YMXd/MVbjPOkdlQoWGSNGzDjIZ38 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421848031"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="421848031"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 13:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855430310"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="855430310"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 13:12:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 13:12:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM9AL61w4RB62qpaZcgXweASJI2gAxxeli09tMNJZtoft52NUhZhwXfTuNGIoHxonXXKMXjQbtGG4B5DGQOYt2iFMgFnldeOva8oxWjKIppz94KHjvH2buj9wnWDxO+e4v8mv9L4mqSe9tAGgOhKqJwxJFcRbc6vt/W1uKvlqH+KbW0CXO/uV+yn9mz1qT3fZMKAzPcoGxS2LNnf0N8YL826QFQ85YStNtvbIcaI+XdHs4EruHqbrYfGr6EBTPF/GMYbio4t0e9/4g1rcUPfjTCn+3iSgNZ8vtU6eUYNK9ntro91URqJsFgxD/Mi7tbSbAKOO3dvl6Kcl22xyR684g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQRNct9chSIzslN124bBe/KG74nCwtCLaqZnEPZOrsQ=;
 b=UhAGbVqSM44DLyYHO8ztj2pbsApWz+xmpjpETxSMuG6llECzXkefIl1rXySnbdow9Ad2YWgeaZdUQwMQY7TjeUCu8e0nMyICacjQnUXGKyDmC/n+y+oTAykwwFbe3M3NafKF8peJv6UwcygGS+MlQ5BhY38DB5mijGT4vgGnzaWCmWZbKgCQfNDoFe+Yrz7O6ubQTstQV+XOjsKF3IUKVfW13uUYhcWHLE+tGCMfFMLjLliHMb5O5JQfiNMZjslqiivRTDt2upEGFe4Xv0CHwppOZqI9OZlY+tHaCl4p9yZYALdZ/Rmg/AF9SI7GpVN+cQiBBZaX/LMw6kL1bamliw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 21:12:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 21:12:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 16:12:32 -0500
Message-ID: <20231114211233.498338-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114211233.498338-1-rodrigo.vivi@intel.com>
References: <20231114211233.498338-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: f813f50d-db63-49c6-a051-08dbe5567342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yC8PckIlzS0YUrdvfCj3YyI0JKtuyh4a7hecxGbA8Vfn1TpMPIEa7uCjinkzaxGFQ9TfIgdL03FZf2zkbnfqjTCTH0u8COUagmMZNwnNzA5VGJOGPNPVRHzA8Dvj2llUGfCuyevXDY7QkGb3knf36f77b4fp5BlaXIe9XQEOuOuM7gg0eqXdpzkvQ/rYZ+lftmO4TC2IbjNgrbZwIza0uXe+BWoBaG2ZsSmO3OH9zNlcilkvRRoMEZZwC1S3aNkHgJ2PXolQkL9X1sh9Bhaic2YMCJuZXRziO0UAYPdhQsLTN6bdKRxVRiGoaxUi2WhqOit/RYSbOq2FZ0kQAy3yTpkaCEnkXtl57fCeT8f6TSNtc5YGezGp9LI/RKcW9d5B9G2oS218RRlqabPj7/lYluDxL2zJQF6MbT+b4BDgpNqgNpGkyHW/AWJCqDdi6jUfv2e5u/XRipI7stG09R1DpvzVQqXtgW1DDVdGU9JKytqR7iCQ1twOMXHl/SYM0LtMCWgt6lmVFi/rpnuTY+FyQ/VdH5CoQ8gAL8U0jcflfp+DCEmQCSWGgYLRcKbufFtnaHLXIlZF4ZF2MazPGASoCMZ5AdHHXkSLOrGVkHSIPpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(6512007)(82960400001)(1076003)(107886003)(26005)(6486002)(478600001)(36756003)(44832011)(86362001)(8936002)(4326008)(8676002)(5660300002)(41300700001)(2906002)(4744005)(6916009)(66476007)(66556008)(66946007)(316002)(6506007)(6666004)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c1rAn8Fx3+aDioEL0eakKOZnMUd53rv5Vi2Yf1Fjru4OS7Wtnt51EwYLvFz/?=
 =?us-ascii?Q?x5e886QpMKAyZS/uwU/DYEnB81uXgU1ZWqvGzkLvk6e/nffFlfaviqIwv93E?=
 =?us-ascii?Q?Kz46mTKpkybd7xrS+tTG7HpTOxfwnui4XaCJf0i+i+fURCtvBma4raDZJ49z?=
 =?us-ascii?Q?7ut/F5naX/NCISpvsEA4D1tbgdxSbVKfyH5hMRNz8AiFs6lVq2DaAkBHD41r?=
 =?us-ascii?Q?TUfEsEvuQZbgxTar3aVg7OSNCiLIck0kmAlXeHXvuVbeLY9h6JtcNO4HjRUK?=
 =?us-ascii?Q?1lSFi1T4CpgXa+1S8xywvVz8PHLMaKI1zc97HgCEcHQQlz2MbGZQw7rm/7n7?=
 =?us-ascii?Q?p0Z9Bj7ZoiBnl7ELAjsRNHauSLgQNAEi/HYiI6TYabBn50uTgk2owaHYcn50?=
 =?us-ascii?Q?KBGqodB+HbyL2bd6jbdzzEPy92RRbN0Pv7Nsm4c2r3RLhxvyxWhsbKXXbwbV?=
 =?us-ascii?Q?wmc29olUtnZI+hHXimmSQfVCH3Iqh0OCV9GH9s6UhRc+fmEQ9o4J2EHhxTvV?=
 =?us-ascii?Q?k1cmikcAdYDSWMu0dfN4XKH950SvVf6vXYs1Uf74ErxJlqMxHv78Ofoat+WN?=
 =?us-ascii?Q?bW7j2R3PAPclvig4v8IqHxHj3+SXz36xVv4IH1LEzJohbTSL9blRFv33Ab6Q?=
 =?us-ascii?Q?L8iqVxckEWRmUPP16PxSU3cMOvj1dEy9MzddT9X8tZFG88K7+ZsKm3brIJIy?=
 =?us-ascii?Q?AUHHAk20STD/ws61bYhgT+tRFLA5vzMZ29XFwhvP2jfesHqylTiQjTzIfUuF?=
 =?us-ascii?Q?me0rVHjQy+KUq2o9z4RKyIiNJUrjbfDaUgwfOyCvKgmWR6ZgnTVAxtufwIgn?=
 =?us-ascii?Q?0b2bgdPvUI5475EvoZjkVg9saplfHseMPkdTa8zfcdFN/WzihhDBsSZorWy9?=
 =?us-ascii?Q?zMaIiWakqzX+/3gV//Z9ne/Ll4qxsnGA5jDeh/uQrobg9D7bhlf6K3vyK0yV?=
 =?us-ascii?Q?yn0uDCY4lLp+TzlRDP7004Se5QwZkVMMpF8bG3kM/Ut6pCMEpKhKll3GXMLh?=
 =?us-ascii?Q?BcaFAhQ2lljApRr3QMbgUEHXq4n1sGVBfZxhueW0LEnp0Nqk1vDyldZUIpjU?=
 =?us-ascii?Q?5LxMB3FPfabeMg97+whQiSCVC/JaI8ITZmKEmZ70zWMWtNFVmOk+BCIkMg5z?=
 =?us-ascii?Q?Hm70OvfpfOYcC/cv0DuuFskC34VACx82SiA6f++pkOW+bqBviNACX1T8bdS+?=
 =?us-ascii?Q?SXTGs7o3S8nn7ueh5r2QatlYfu5UqOF34vIFhCH3XnN/BFyJ+A77lNpI1Hbb?=
 =?us-ascii?Q?Z7i35CHDKybqVHQQSXEJizpSkePL8MWcRAUj6dOIsRgWhrvv0UJuXkGNCEsd?=
 =?us-ascii?Q?gjZOK1tih15C7wsfTsZbJhYj5BL7QbLdKyoiYa4/uYp6Bmvormbf+2iOgW0C?=
 =?us-ascii?Q?+U2/9Dp+bz69UaRDOv7RQnNKK2o88nq3+VWX5ZBd+F1c75G9s9xD8+0jJQLA?=
 =?us-ascii?Q?pP4eu1SfZ54yE9sKv6PeEeplaGqg6ptgyqO2bbetSFhAkKGw90sOdHrp6YGB?=
 =?us-ascii?Q?pAtdDbihWW1D6cNsTv0d+8+TNK6h8sQeJ7oEbxbUO2QOHIIgXmiyaWNDitLm?=
 =?us-ascii?Q?TuekujKKTDFmzHIwBl8ISPJWe1g1tHUMjgvUrBNw0H1GR2zRGlt9nOLShKZs?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f813f50d-db63-49c6-a051-08dbe5567342
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 21:12:46.7622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkQ3z7Sk6F0lDir9a1WuNEDGE26N+sCapnfAIG1KzbUEAAYRTm3oXAxQAfXI5kru43+oBMJN8pk48n9eJmJKKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/3] fixup! FIXME: drm/i915/display: Remaining
 changes to make xe compile
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

---
 drivers/gpu/drm/i915/display/intel_fb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index be09df7d8cec..1ce61245728a 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2227,8 +2227,9 @@ intel_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOENT);
 
 	obj = gem_to_xe_bo(gem);
-	/* Require vram exclusive objects, but allow dma-buf imports */
-	if (IS_DGFX(i915) && obj->flags & XE_BO_CREATE_SYSTEM_BIT &&
+	/* Require vram placement or dma-buf import */
+	if (IS_DGFX(i915) &&
+	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
 	    obj->ttm.type != ttm_bo_type_sg) {
 		drm_gem_object_put(gem);
 		return ERR_PTR(-EREMOTE);
-- 
2.41.0

