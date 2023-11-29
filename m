Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9554C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF6610E699;
	Wed, 29 Nov 2023 22:36:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A43B10E69A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297381; x=1732833381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kT36BftrIu+p3LaKRd4MqL0s64LKHYEXnP8KLDKaan0=;
 b=OS/TENQxI787c5v4i2l3RvcYPyH0DlBRS745zdaMgXbihu6aXx2zx3bm
 Daw9HFQYVNGG3DRr3xaLNpA8GzK/kR8xrsAo3Ci/KrZRe2yxmVQ28dk2N
 2e3xsSHr9LyiSsviiAWCz9idcI58lmY8ua6pvcnvCSotoemNBBxU/HYwK
 wfMAjJT+NwDR8E1BZkHYUW0yco6ohH/voOAqqejBEhM0sdh22UzZvXYnG
 Pf75xKYFFXbbfrhPhdI8vHaL0V1DbjZBswtQoUWBJ8i8U8sEiXJ7xsHgF
 7KNBGBDW646xBYXF6DJKMYRBck1q1OclaTYoZ99snIlyQcWjGt8OrAUcr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219773"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219773"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418227"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418227"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:20 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:20 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3Ov97pDyc0Cg3HKdi0jzUg9tBHrTlsvzn+46/xoOJjye4j+tMOVfFdbe7BqU52X+1Ma0jFP6u62x/a+nxWohA8uWv9XNib0FBBAlcaOtHgJgsrE6JAbgct1gKqvR81YVEEnKqZHAWJYTFed5qQMjdoMhcsxUnZVYCH8I/LcWToEvzrgy5YnOconmu/93DLzF/8pePPPbvQY4wql4FSd+KZiqQP2RjNGEDsIxhhjW0m0vRE9DgoX+5XW71JMx/ptubN9X52KLjyOiIU0zY4WZISvarPG1LHrEB/RRryOpVGjU5gtnlxU7U41MV4hY5uxnXeeB0eqnAoaxPuY6K45pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJ0NH2HPQRWJr+2bfYFN3DsoN0UAP/OAHQY+F7OGR2w=;
 b=W6PRrJm2bQ/Qp6LzTlNMX80sPgfc0svqndh2fUOMDSQeQJOB6Qy3fogDXNh1hcd4MCS4Fh5HeY2m0dhOWC2ayKh54SnE8ZutMVXJBgl3LPgYP3vhlnDsUDKCN+KcQ7rrUCcIMR+8Qz0HBSIAIhnayPFSOYH2CXQBBsbWG1tHpCHgAhIXCtDCo+w5pHerq+3CbfrY68zgO8WKV8/ITk4CoB02YN+9Gwf7Y5LYJ/z7NgSaJYrlsO4xqjCtBXO6Iesc43zwrxfyszdip7KLCTuFRlIjnrgZ1x9nJl0BcB8x6I2c1zxBwdBL3ViLiEgxkhFGCyRfisNAHMKxt6apScNucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:36:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:13 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:59 +0100
Message-ID: <20231129223508.1189461-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 843d65a2-f676-41ff-d3c7-08dbf12b9768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjjLPjMcq9EyzOokfhvkcIG/S13PWGiicT/WxXl2Cz/VFvtvkOhmRudIIGf7H42e8rv4LP3lg94MzqhpHfw4mhFzukuMxFIn64yRBIYgvjUiOqjt3lEATsBdUJeCDcjF21+44FLh48hAq1PRImMcYPKzQGnN198p5lEUlfZQ6OZ1TOI8b1bhMOIUCm+k6LlA2Nakqbjk3tw8qDFK0ck0bVlYHKWvzlpetRN8CcDCvp7wSc9P1R5dt709Bmc/3QIysTlvs7dp3gd6rBLqw9CeGjFD7bpn3J5F7WsnBAJ4iA5jcY69wFgTX8YRhp1EsGMdueQbeu1MwlO+UD1qcANdr/FuDsJn2MNDssrS2rAekaj0LE+qTpu7cSAGaPSLsiDNpbnKhUJzPGpGBb0ndhQ3LPhY40x6Mjn+zx2PRGt55+r9wFcoutI6wf/ipKufzHLABItQTWjLpmc3iBIILCWLlc5cLMq8KqPh2Ve3rrjg0EC0DxYj4tcm4+dzRTrfy2VG8TDRWDy9YKMT7jq0BlYLYv7+3mcqk0hLrauAcn7Wwad9BASmzCdT7UU8Nmhju2Hg9iRGc/k6FfN0NoxFhv1Hqn2sWKrfUMYJU+75qrQH7BBu7By74wjSr1jfrbMrbxVeQFD2wEMN50Iw/qsnAcjaqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(2616005)(1076003)(66556008)(54906003)(66946007)(316002)(6916009)(2906002)(30864003)(5660300002)(4326008)(8676002)(8936002)(86362001)(66476007)(6506007)(41300700001)(36756003)(6666004)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTRlTDY5WGNnSFdmQlRNSm02YkkzNE4zRnZFMUJoVmExYi84UEV2ZlJkTVEz?=
 =?utf-8?B?aTN3a2txZnp5b2xrLzV4eFN0ejBwTk9raFdjNUh3TTB6d2h3ckRhQks2c3BX?=
 =?utf-8?B?MGUyam5kTkZ4aTZiMWJ6T3AydVpoSmVlWlcxVmRhMFJyUDFJRGRNdHhpQmdZ?=
 =?utf-8?B?WlNBdksrK0oxM0orZTMvRTFBdE5PUElUQ1YzUG1Ob2hSU01pdlkzQXUybjJO?=
 =?utf-8?B?a3hCSVFhSllCM3p4NUlPVndIZ3ZsK1RsVnZvUFZRM3JJeHBFQ3lWc0kxZGh5?=
 =?utf-8?B?QW5RQWlHeUZiRjhPQzR1N2tjTzVhd21lWmJSMkE3dTFVVmRVb0wyZ084SnN6?=
 =?utf-8?B?bkNFbkdQaWhOY2V5QUloVTRmS3BPTFMyUW1hL3ZHREZxc1FFVEoyandzMW5Y?=
 =?utf-8?B?akNKL29JSTFVR0dJUmtJRUVjSlNmUzFhWkd2cWFDN0I3R2Z3ZEpQSmNtQWdm?=
 =?utf-8?B?NlRiNXl6Q25CRi9lekR2RFdOeWpoZFo3SDFxb1hHb3cyK1FkNXo4YkpOY3RS?=
 =?utf-8?B?TThIMEtwaFhYMTFUbGxhdEZvazIxQkt0aUV3bzJZVDVmVFM0S3JTWEQ5Q0hz?=
 =?utf-8?B?eVJBVGJEYW9KMThnYkxkVjIwUkl0OXNxSHV4TXpCbWl2cndhMzF0OGxXNUZu?=
 =?utf-8?B?aWowc091UXUxMVlnL3g0RmlkWGg2MElXZDkxMlZpMkJtL2dsVDRKZUE0bUJn?=
 =?utf-8?B?YmlUT005S3ovUFY5YXZsdFAyeXBWYWQ2Q0FXWnk1Wm4vcDdFMjF6QnllNmxQ?=
 =?utf-8?B?eWFLck5sYjNUaG1WK3J0NkpKS2l6dEUraXJVbktHMXFsRUdOTEFGOFVtbmpl?=
 =?utf-8?B?NkVadXFoMmdPSXVyNFRSNDJrVFpIM0xFM1prL3JzZ2FaWW5vOEJBMDQ0TzFj?=
 =?utf-8?B?VXZFTFI3blZTYlZPbk1VODFtZ3E5VWozT1NlRzJqclRpRUk2TURLRW5RS3R1?=
 =?utf-8?B?K2lzQlVtUGl3aGU5aXJHelY2U1RLZ0Z6YVF0YThuVjRkL0hVNDhVRW43N05y?=
 =?utf-8?B?RVkzQUtPZVVScVprQVBWdDI2RUhOVHdpcGVsYURKRElkR05wanZVQjhkaXh2?=
 =?utf-8?B?TTEralNUOTRsZCtlcXNzalBvdDJSR3JzbUhGV1FVQWFUYi9vUlF2L3JaV3lP?=
 =?utf-8?B?ZExrZ0FPYzI2U2kyaU1VYjlpR3AwS1E2SG44Q0Yvek1wb25SODBGRzdjZEMr?=
 =?utf-8?B?VFRBUXJrdnp6bjBvdFlwUVVweU9XRnAxY0RXU2hkUGZBUGxsQWtKeHJTQjBa?=
 =?utf-8?B?ZU0zWlhldC82WWtIdk5Fa0xXQ0FORkZ0NUpCWG4wWURWMlNvVWlSc0dYRURY?=
 =?utf-8?B?WDZnQndFZkRQWktrWnMvNlBYdUZ2eG52Ry96Ky83ZjhvanczZjBrYnc5emtZ?=
 =?utf-8?B?b0lpRmlSdkY3WUkyVHRXSEZ1b2tMam80VGVhU2w1K1dJQ3dQUEhrbUZtdDRn?=
 =?utf-8?B?K2xONFlvVWQxTWlQbUR1Q1VKVWZaOENaZkdTTTkyUW1zeXBZRjQ2MHAwSTVu?=
 =?utf-8?B?ZDQzYUhlL2NZTy9JWHU3dVRyWlcwTThtMXVJU2lNRUdKL2gzKzVaa251dXIw?=
 =?utf-8?B?aEkxR2JDSzU4aGtjNHpVUXJ0elJJK1p5WUQ0MlprNFdKazVNYmx3cThLeE1R?=
 =?utf-8?B?ZXVHdVQrakIwWW9IeDRiREt5SkZtdGoxdFZPajZ2UW9jMjJ5K3pEcDBvbFZp?=
 =?utf-8?B?RytwLzdNZ21uRElLUVdpNnpsRU95VGxWd2JsNFZPak1QNU9lbEVoM0tsN2pU?=
 =?utf-8?B?ZzhNcDRMU001SnFmSXNGemk1bmNyV2JvbFdXS3NZMjYveHRqNENzM29LVWFt?=
 =?utf-8?B?RndBZFhKOG1KNk03WlVrdG9WVFdDSCt1dlBMNCttc2ZPNG1pMHdxWDlVb3BC?=
 =?utf-8?B?RUlhZGVCN3dtbHY5L2dheXlLOFl4T2t0QkpnU3U0M1Q3K0NYOFI2OENtZUFP?=
 =?utf-8?B?VVlQSERzNlZHenpxQzlDbUtrYTJBdTE4NDl4R0hIaU9rcnhqRkJJc3Y1UFlS?=
 =?utf-8?B?aEFRM3gvNzhKbTJOUVNxYXlHQXBvV0hMYnowN3JhVzBrOU1qeGxnTDhQVzFi?=
 =?utf-8?B?VFF0R1dQZTZjK0sxanpMb3VFS0E0QU1POXA5b1Z1c1g2bGdwczI3bHlTV3U4?=
 =?utf-8?B?bkhsczB6QmNRMUlDYzRwbTBVZmdiaDFULzF3c2cyeWdiSjlaUyttVlhnc1lt?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 843d65a2-f676-41ff-d3c7-08dbf12b9768
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:13.0331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /anjH2dM/cpBCDN+Xm2pck21T4cFttnpkWzOeU4znYkBADN6sUpInenn7KITspPhwPIFn+uzBmPYJUkcKjHFVXe7+h1LKpX2jfQVm/afgsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 14/23] drm/xe: Add a helper for DRM
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A helper for managed BO allocations makes it possible to remove specific
"fini" actions and will simplify the following patches adding ability to
execute a release action for specific BO directly.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
v4 -> v5:
- Check for error in managed create from data (Michał Wajdeczko)

 drivers/gpu/drm/xe/xe_bo.c           | 36 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           |  4 ++++
 drivers/gpu/drm/xe/xe_ggtt.c         |  6 +----
 drivers/gpu/drm/xe/xe_guc_ads.c      | 20 +++-------------
 drivers/gpu/drm/xe/xe_guc_ct.c       |  8 +++----
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 18 +++-----------
 drivers/gpu/drm/xe/xe_guc_log.c      | 19 +++------------
 drivers/gpu/drm/xe/xe_guc_pc.c       |  9 +++----
 drivers/gpu/drm/xe/xe_hw_engine.c    |  8 +++----
 drivers/gpu/drm/xe/xe_uc_fw.c        |  9 ++++---
 10 files changed, 63 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d59501ffc22ae..1a7fe62de8122 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -1530,6 +1531,41 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
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
+	if (IS_ERR(bo))
+		return bo;
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
index 77e723dd9102c..098ccab7fa1e8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -115,6 +115,10 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
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
index 6295d916e39f6..24a33fa36496a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -114,7 +114,6 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 	struct xe_guc_ct *ct = arg;
 
 	xa_destroy(&ct->fence_lookup);
-	xe_bo_unpin_map_no_vm(ct->bo);
 }
 
 static void g2h_worker_func(struct work_struct *w);
@@ -148,10 +147,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
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
index 98bb9bb307051..2a13a00917f8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -48,13 +48,6 @@ static int guc_hwconfig_copy(struct xe_guc *guc)
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
@@ -84,19 +77,14 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
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
index 1943893a3fd7d..d2605a684b1c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -964,7 +964,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
-	xe_bo_unpin_map_no_vm(pc->bo);
 	mutex_destroy(&pc->freq_lock);
 }
 
@@ -986,11 +985,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
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
index c52c26c395a7d..108ecbfe593ee 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -239,8 +239,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 		xe_execlist_port_destroy(hwe->exl_port);
 	xe_lrc_finish(&hwe->kernel_lrc);
 
-	xe_bo_unpin_map_no_vm(hwe->hwsp);
-
 	hwe->gt = NULL;
 }
 
@@ -428,9 +426,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
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
index e806e7b6ae424..8ad4bcabb8b5e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -292,7 +292,6 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
 	if (!xe_uc_fw_is_available(uc_fw))
 		return;
 
-	xe_bo_unpin_map_no_vm(uc_fw->bo);
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
 }
 
@@ -692,10 +691,9 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 			goto fail;
 	}
 
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
@@ -726,6 +724,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
 
 	release_firmware(fw);		/* OK even if fw is NULL */
+
 	return err;
 }
 
-- 
2.43.0

