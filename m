Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBD8C10DC2
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980A910E6A1;
	Wed, 29 Nov 2023 22:36:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456F710E69B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297411; x=1732833411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ter6usnSz1t7v/aq6X4VUn+5pKZ2ajbMb67lVgwHzqQ=;
 b=Q4wFrEPkE5WBQAmLiyiJzW+4Tn18SUK/Njslo+TDtHQJfReKemcEM5a8
 R7U3DbnlSr7DvMjW6zhRKPwsqcIXBDAMNhlJCwOWRNY1FRORDALZbsDTr
 PU4aL8wbt/3vmsmW0B8bQQ+0zHw+ko80Kx5iqM/BfUmnrU9P5W4+BZMig
 IzJv+eR/sTvj2nzX3zlAfrx/e27uFZcC+/kJN83F+JCHxTLVXqFmEMZrM
 /PxxOQMr6M7gk6FrI9jtWhJ3mrA3ST+maEhAkthxxMFV2D2s034VxMfdA
 cpkR+gyV2hHr8H+AcS08dPny0KKyNtFtQUM2N9nEPD7ifxwU8jdriK6/9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219853"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219853"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418383"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418383"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:50 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elknpqTMorCvicizJh4A3a7rXMhBR3GeTMpYCWmocNcEeesrgvyoq5taZ0uVDVdOCJwwuysaXnL1pWf8oa2Rih0SOY7c9+Q8fxNipyRDnBnDbxR5wQjOtXoXlk07jX2U8CwX2qBcBzqGiOxs41SodisSD2np4+YCM50FvlbrSJRzhys+DPBxxMS+D3mRreAd1bEa//egmUboRZMlBU10HGUI77EpYYBdgT7rRNlZ9Rfl9xO0AATHXULpvRBdmC0yywdJZen104si/TEE1oqtx8NPcIeeAgdED5w9qf9Ypw+xqnG8nxTSdCuPAAXPVdly6p0mnB0JFTxECypABJDNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAml/F++pk8kMe2MYGNUqI7w5WzQf8CTmYbS3Vhd9t0=;
 b=D2MQIIMIsHCu+qgqpApgSWPzQpQ2fIlHxYLpMT3XgaGugJtmhHBCGQY5V0sqd+8JU4grDqUwZVTvoXDEUQsz/daoGjSEYnnvON21V6aeH3Ra51K81gL9AW4qQKGhXTKQhAtSFgTtmDrkb4bPoYNja4Mx+vM6nFAUtJQVTMCcPe3tbWJ6NrgAaO9aFONxksHYIKf9xX/bV3ZTlxLoEkms7eR3dRg5Av1KP2VztRhs1Lrpva/jUBP3Btw7SS5RFM7GRFK6+vk4DiS2Abba9uuur6FzksksqQYyBEUZcoqBd1fnHDEJMclXXIbK94JnIK8Nnqv113dEje2v2WxkfuVmug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 22:36:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:46 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:35:08 +0100
Message-ID: <20231129223508.1189461-24-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 679dd3ce-f966-4d9d-6ef8-08dbf12bab43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fFlV3WT4JT/nmhJSmY5FhTX+FzctI/0OWsy5h36D6Po6m1mElgcNnc+Ky/D1T4EJ+5qEAx6Sj4+UFIn07Vjih+gUqwaQumtlxGO7Iv4m9PIHIOPZMfJdUrt0FriA15qWuPSflg9bc8RpGJuutRkCV7fGUNNzYWfdqAkl3FjIyBwZGCZ4A+Ygbaga2otHI2aPEyPURGfxv5vEVTQUKr+SgpwSk0CCtStp8ACE8pcsFhzyw5BkenxQGWDGnp6EwLxhU2RG0fvdtqJAbMiIqWJ7jRmhEvrwtCfibplX61O/Jeu3Vh7aidewZ3mzxv2eoEcJYIUZ/4D7ZCv20b6DhRM9v/KQOgloJ1lYp0Lu82J6zxe32QXWkzZSOkp1cyeCWTcrqW6arMN8HxfLm/08lPUb4Jbs2GTO25YWzS281SQmBjpiPdYuuJUrQT2hcWLkZYEfWzQtox9SIvlmP7Sfbi1npudXerqc1OEcXACxmYLm1V7TL5ThQaVPUwLSiMjH/OemQodeP0e9WMnwKKOjfiz2oxPIq6K3Rt9FSk8Ey0NnGl95CLBCcQAlUyqHADIb53h61o9UHUx//sJ4JSOtGYNNCUF4gA7FM4mv5HmjBZscDLJ5d6mjdscqAK2YLgHwesI58DQeXhiqajx1l6iP4f0Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(86362001)(2906002)(6666004)(5660300002)(1076003)(316002)(6506007)(26005)(2616005)(66476007)(6486002)(4326008)(54906003)(66946007)(6916009)(8936002)(36756003)(6512007)(66556008)(478600001)(38100700002)(82960400001)(83380400001)(8676002)(202311291699003)(41300700001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUVTQWJIOUIyT1RCQmw2bDdCczZmd2k2SW9UT0c1OFF4S2MvM1ZSYlhkTmhM?=
 =?utf-8?B?S01YMlFBM0h2cVJlbitSMHI3SFRJWlp6MTJkRDNSYTczR1Q4KzVlTkxJRngz?=
 =?utf-8?B?QXNKWFpiUmF6OTJJSG96RGliY01KUmJKOG96TkI5OFg1TlZ5UVlNaGR4ank4?=
 =?utf-8?B?eDh2UjFlZzlvOTNOV0E0V3BZNEQwZ2VuVUoyZ2lhTW1jUTZwM0hBOE5WbEEr?=
 =?utf-8?B?aWExKzJySDhuY1RISlJ6eHBLcGNzcGFHbGU4cUx6aFNKTHhKMEtGUFc0dHFj?=
 =?utf-8?B?UmVNdktrMGpjbXRneUJ3anM3OStwZTlRN3pwZ1lWZWVqNzZDWFcrU09iaHNG?=
 =?utf-8?B?cWZKRGs5dEcwWExpMDEwY1graDA4SFdQT1Rna1ltcjBkVitTNGEzZE1ISTd5?=
 =?utf-8?B?YUdDdHBCMkxoSWM4L3d1QXEvSEZJT1F6YTNWTVg1dkQ5Wnd1Y1RTTmc0MFJC?=
 =?utf-8?B?bDROMDk3NkZQK3VNU2p3L250T1hnbG5FOE0raVlLMTR2NjA2UXJBc2I5Vjhw?=
 =?utf-8?B?dGYzNktVdEpCN1NRaE9rR1Uyb0hMTndjcFh3cTRGQWNwSjRLc1NiR0tjcUdn?=
 =?utf-8?B?aFhYMkdmaDFoVHFkV2tWYzZQK3hSaHQ3S3lrVVl4Snk3YXVLVFlQR1NKV1Vk?=
 =?utf-8?B?YkZqZ0M1U0hjOHlpbVpoMzBYWE9meFc5d3hzOE5yb3lRb25tZ3kzelhxVUpV?=
 =?utf-8?B?RjI3ek9jaEZHRkhvN0xHOG9MOUNzcldEL1kxSUJ0TTVwM3VrcFo3U1RWVG1F?=
 =?utf-8?B?YkVFdW1jWnBqMjc1MFZkVENTa1drM0g4YVdabVZHSTF0T2UrdUt2dkVXNUR5?=
 =?utf-8?B?aFdlUHA5c1hFSHpZVm1vZVRyTytDWEd3TStPZGhIMk5ZNityeStoZXJmRndr?=
 =?utf-8?B?RVZrRFRqYkN4c2cyVGZiWGZQcDkyL0pKb3JMTVlNNHY3eUVDZHhnanJ0SGJM?=
 =?utf-8?B?ek8zOW9LS2w0TTFUTmRjWnlTNmpxYVpETFNyWi9NRGUxTGYvb25vdXl5STN0?=
 =?utf-8?B?V1BlUGJnVzAzOFBZR0NkYm10TFJSY3Nnb2VTeGdBZG0zSlI3VEdGR28wTVdq?=
 =?utf-8?B?bktWaHpZTWJOS0hrYlh5SVM3OWxzdy9FNFJFbVAyK0R0eFU0TDdvTnNuR25l?=
 =?utf-8?B?YnlJUUdmZEwzOXh4RFV1SlZVQ0dSRS93Z0RJeTRtcW5LcU5sUTFwYzBuZU04?=
 =?utf-8?B?RDRuWEZBa2lvc0NoMEJQdTZMcWx3Nzd4SEZRNDVTZVk4UHFWMGtGQWtYcWxT?=
 =?utf-8?B?TU45SmcwRlpRaHJhQkc0VEs3V3NTelVoblc5ckNjOXBYclQxczJySDcvNzd5?=
 =?utf-8?B?ME9GK0t1VEUzZXNGbnVpZ0dGcXlHM2hKRVRmclNydnJzYXFId2tmQmtSVVZs?=
 =?utf-8?B?dWVwemhLKzRSaVA3bkppdU9CVlZnZTZnWWx6NHV0UEZrRnBoOENVd2dxcHpR?=
 =?utf-8?B?SmQ2ZmJtby9UcHBoYTJtQ09kK28wUnJ5VTNjMGQ5b3gxUVVkMW1ON1Fod0tw?=
 =?utf-8?B?Q2t2Y3R4VGc0Ymsxam5tdnM0WUFxaytoN2tqRU5xSVU1MHB3TklzZzV4clVv?=
 =?utf-8?B?VVFIYWJHNzU3NDE2WkVDcjU0eWg5b2VDYytQZk01bWROT2IxY2h3bXFBRStP?=
 =?utf-8?B?VmFrUzZiQ2ozRExiWldTbWJBVVVzYVZWV0Y3SXBROVJnUFdDbmZqZnVuSmJz?=
 =?utf-8?B?MlJUR3YydGx2UGhYT2VrQzVwT0w3a3h2ZzI4Ui82eldUNnZzYkJqTGlxcjVW?=
 =?utf-8?B?d1djWDluNEx4QkJLM01qQ3B2MFNRMm9JY2dlekFoV3JtUVFodHl0T1hKVnQ4?=
 =?utf-8?B?eUwyZkpvbmVUQ0ltRjZxNjVIWmtnYmxLdzhCaGt0NEpxaUpRbU5ydkl4ejQ0?=
 =?utf-8?B?aHdUcDErcXhCMnFqNjJBV3BsNFFVcEZTdEliQldKWWdqRk02SUxjRDRQRU9S?=
 =?utf-8?B?aGNvQVNGeHlFY0FzOHo0ckxoeXhucEM5Sll2WHVOSURHMzRsOXRhaHVtZFVK?=
 =?utf-8?B?dXd1T05xMWdnQWJrVFk5QWlQRy95T0pnWlhZa2FYemIwTVF3a0ZTUjgvMkxa?=
 =?utf-8?B?N01SUEJhU1J6VHdXR2dieXpyVjZXZGpPMitZRHVNVGx0WndzalFPYnJ0c2Vr?=
 =?utf-8?B?dTNGbDArQjFpV3BHRTFhOVlORGphMVJHdkduQkR4SlEyaWQxLzJZK2lmZGJm?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 679dd3ce-f966-4d9d-6ef8-08dbf12bab43
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:46.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYgrqkg7dD/4Ezk25ERi35CgLDd6twbFFR0G9TmWKBFWngpF88qP4qlmaUWa+SAGLmbzaPvR8NWGgQlj6ZJUh7HUnLYT2plA92xdebQDkLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 23/23] drm/xe: Initialize GuC earlier during
 probe
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
to access a curated subset that is needed to initialize the driver by
communicating with SR-IOV PF using GuC CT.
Initialize GuC earlier in order to keep the unified probe ordering
between VF and PF modes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v3 -> v4:
- Introduce xe_gt_init_hwconfig (Matt Brost)
- Init PAT before loading GuC
v4 -> v5:
- Move the comment (+ engine mask assignment) about using engine mask
  from hwconfig blob into xe_gt_init_hwconfig() (Brian Welty)

 drivers/gpu/drm/xe/xe_device.c |  6 ++++
 drivers/gpu/drm/xe/xe_gt.c     | 57 +++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_uc.c     | 11 +++++--
 4 files changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 65e9aa5e6c31e..a236c36cdae3c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -425,6 +425,12 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_hwconfig(gt);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 7498d36a97e44..8be800d0d8752 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -298,7 +298,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 		return err;
 
 	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	if (err)
@@ -337,27 +336,14 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_hw_fence_irq;
 
-	xe_pat_init(gt);
-
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
 			goto err_force_wake;
 	}
 
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	xe_gt_idle_sysfs_init(&gt->gtidle);
 
-	/* XXX: Fake that we pull the engine mask from hwconfig blob */
-	gt->info.engine_mask = gt->info.__engine_mask;
-
 	/* Enable per hw engine IRQs */
 	xe_irq_enable_hwe(gt);
 
@@ -416,10 +402,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	if (!xe_gt_is_media_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
@@ -443,6 +425,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
@@ -463,6 +449,41 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
+/*
+ * Initialize enough GT to be able to load GuC in order to obtain hwconfig and enable CTB
+ * communication.
+ */
+int xe_gt_init_hwconfig(struct xe_gt *gt)
+{
+	int err;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto out;
+
+	xe_gt_mcr_init(gt);
+	xe_pat_init(gt);
+
+	err = xe_uc_init(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	err = xe_uc_init_hwconfig(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	/* XXX: Fake that we pull the engine mask from hwconfig blob */
+	gt->info.engine_mask = gt->info.__engine_mask;
+
+out_fw:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
+
+	return err;
+}
+
 int xe_gt_init(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a03..e9d6aeceb56af 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -31,6 +31,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 #endif
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
+int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 72a7b3c2577dd..cb50ea630a098 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -30,13 +30,15 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
+	xe_device_mem_access_get(xe);
+
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
 	 */
-
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
 		goto err;
@@ -50,7 +52,7 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+		goto out;
 
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
@@ -60,9 +62,14 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
+out:
+	xe_device_mem_access_put(xe);
+
 	return 0;
 
 err:
+	xe_device_mem_access_put(xe);
+
 	return ret;
 }
 
-- 
2.43.0

