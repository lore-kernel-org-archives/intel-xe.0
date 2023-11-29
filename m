Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B88BC07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48D510E67C;
	Wed, 29 Nov 2023 21:46:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D7610E0F2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294412; x=1732830412;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2ToMEs2ZjinK9dmUowr2tiAgw4qvDvE2wt5jT0XsGc4=;
 b=QL+j/YERcGvFyTFOT+nHbueiAjGAbCs1WWDEH/48j3XQe5Eh8Bvi209C
 /yX6ecfB25E/jnmG8VmiOIERNYd2KZVoo/bY7YfPGvv7WNzRvrlhjEagk
 3I0NjbRNmjy02Bb0l8x0MvBmh6ZU2zEzoRS5/eR5lFNq96WVvYOWq5nnp
 bgmSYbXEyRxL6Qfa+lMog+p88yv73NGx5iZulAPNaY3WYm3zYNZer0Lcl
 H89gTh8nrmV03NtIWNQlpO10w/WuNugQUQeiv0QAomnuScyl6sP9y45Dk
 j8iXYMJsfiCXX0R87xCpkeDaMaeikT52a1UUBgM9gZ0kEcxfDqcV7eIMi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397123942"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="397123942"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798063803"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="798063803"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:46:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:46:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSg1pPmY1uj/FBxSnzp8yxkn8LrGKOY2nKX6u8rxOr/HOci4xTEQB86o12j98mgMfLfKkPyB5gg31iPnpnhS6FmTGybl7KlgbFl5yZS0koCRKdyoLYItpP+rPERHwKs821Uin/GiS8jmTlDJoxBuVvAzb7Cv8LtDkhx+C2xLA5nMoWiQh9l5sw8apEjN1BMdHmeD1Mz7gz5ZV4P9w68ZKalw2Qbu52uCtG8hvnbMS35Nu0iMIhrjNoKl+2BOlXH5p+48zI+t66fLHA5NIvlkntYwlZgWAe51Ll90eVxoKDKCDrq6xTXS0LIBX6r/e1egd/FVsU1S85LE/kohJRWXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVCHyp7PGU8XypZDar7pFneQ2cpdNOPVUu+RktMteos=;
 b=XVK8zwNKFKDksheEaTJfe7jQG3GZ82ayEhGmkU+wtbjYRA/TY7dSFERKo3mw6auY5iD9kXyz+1tqFUWc0Fl6/9vFMeioWw1mTYCFbWGfHAA6CaUg13DgYO5Eq5SICl2zUYeUiMbXSeVsYYXsgbupaP6aQlVyRnW+mHsnraaxUoaqLj3cvINyWDxPHYRI0+3NixQJgcNC2Lr13F8TAXAXqDjBx/FyenNXD6HrI+H/yGI/QNsyxtnfhW3qd+ON20YIEL+5eJ0cEQpcafB17fsv6wkkfOgOhBaVSFtczFLSxeCuOgC5vdnmBgqjaTLYkxFACOz2rsL4l/vC+vWhcAZJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 21:46:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:46:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:44:56 +0100
Message-ID: <20231129214509.1174116-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0297.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e9fbe0-c1b1-4cec-45b5-08dbf124aa1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBK6MAhaPwMk7HBDKIyUwpg0oJtue9X5tJISuJGqiQXjFrX8dHlgD4/6+31Wr3JavUbAOhpBhkqjyQ+GtFepUqqX4x6UohdR3ozOPJHC83TDINW/4T984q6sOeHNBvB1H9gY4E/uf2Qate4dJSqcbvzMlt2YLeJYPbjvYI6h97sIR0JecqroR8lsA5BbHvfguk5tWXFPgcLKe2hViI3zT8woAA83dTWy6nVgmq2FKbEpPutwb8D/RFEx9+ushijhGtjiDJZMN2awyiRzybUCX9l5SfFS4pc6v0Ks6WV3LBC6/t3kOxGGvm5im3ouT1Q52LcAldRCRRw3Iwyi881rmJrIZjn8EvOGBwW+D8GkvLOrVge04qyMoGkhXyuXNTZkzfYgwDsOPyDhhEkHsP47oEUsg/vb+JzjBzSA/LQ/bru2P/NmvnO2Jix0exV9yX6s0OLZb8i0d3Rss5cNjbk5PBi9FMvfOE3sOmQAkG2IBSUo3yi3K+M4t2cJACNueDxGtdnJxIwwByweFLAlaSkg4AsQD2DlUMZewVvt9/SR5mQy8vWZFakwNFgEgFEeVwskXr/GUKFwkDp9cKs81i257ULuHnEI3ep5Te7NZwPpV5cgb54hL846SZwMQLXKTn6d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(8676002)(8936002)(6666004)(4326008)(6512007)(6506007)(6486002)(316002)(66946007)(54906003)(66556008)(6916009)(478600001)(4744005)(41300700001)(38100700002)(36756003)(1076003)(26005)(86362001)(107886003)(66476007)(202311291699003)(2616005)(83380400001)(5660300002)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2JlSVV1WU9LaHAxVXVLR2xFc21HTWIwVnp1VVpmYk1CbW9JRHRTckE0QlM1?=
 =?utf-8?B?ZkkwYjNLV29OTlFkMlhwU0wzTks2VkRaRUpCZDliWEZsZGtIM2phQmZ3NmlL?=
 =?utf-8?B?SnZWSUdOaDgxUW03L2ZTcUxMNzFwQmJqZlJ4ZTI3M2lVNmlvaWc5UVdlVC9h?=
 =?utf-8?B?eDVydmdEK1NaeVl2bnhuL3EzVEcrNHZ5VlpEL3dzcG01Zzc2QnZkKzhzcC8r?=
 =?utf-8?B?R0RMSTEyR3ZKcU4wZG9MY0V2NldxKzhxbDlpMUsvRlBDWTVzZUh2TjFuVzhW?=
 =?utf-8?B?a0NFOHZmdTQ0emV3L3JiS2lSZXRTMGxlYnVhZWtWd1FmSXRsMVRhZ1k3Qm5W?=
 =?utf-8?B?RVhuVzF3bXIrSFRReXFmUDJ3OHUvbFdGc09KQno3UnNJbE1VM0U3cjN6ejFT?=
 =?utf-8?B?K2tMNlJ1VkpzaXZvZkdSTFN3S3pxTnNIcjh6Q1E3aXlTOWxqQTFxejE3VWlT?=
 =?utf-8?B?anllanNzNGIwV0NEWjE0TXRIMkRqRXN6SFF2em9uU05YY2tXYXhpQjhxN0FJ?=
 =?utf-8?B?T0NRRjVZWVVFbTBZVjdHOVcxY2VTTHIxSjRRa3BIL3RxaDM3SEM4MCs5RGR3?=
 =?utf-8?B?QUk0WFZ1VFFua0ZFSGl4aG1tRmFNNkV1TzNaSXVnZ1NEK0RtTzlEM25uZGNQ?=
 =?utf-8?B?aDR6MnlHQlF5TVlsVmtJcFBLL2VlVk9QV2gwMFdQSGNqL2ZCNVBlVlFZN3RY?=
 =?utf-8?B?OXNobklUUzIwdDN2clcwYTdEdlhCVXhqb2h5UGNHQU5hT1c1S2F5N1NVUkRv?=
 =?utf-8?B?REVaRWVQelA1dFAwTG9VVzB5eVUxQi9iNXRIRUR5dE5MRWRqelUvbFk0Wkdp?=
 =?utf-8?B?azBuUVpCeFBLamE2K1drdTNISmxSRHpLZ1BjZ0k2VjZMMCtkV1UweHoySmNF?=
 =?utf-8?B?YzJ0Sm1VcW9zQndTWnFsWmtoSTI5WUk4UkQ2QlRLeiszZUdSeXU2cWIwN2F4?=
 =?utf-8?B?RTk5WXZad2J6ekh1dWg1UEtLcWRSQ2tIeEZrK3Fvb2tNRTFtMEl5ZEl4V0hx?=
 =?utf-8?B?dlVtVHVSd3lMTkMzckhxRTVLRmdHQXN6bHhScGw0QkRDcUhQMUdxSXVpN1c0?=
 =?utf-8?B?ZE1Sa2R2UzRtb1Fzd0RqUmthS21RQUd2c25abUdXRnhuNjlMUDBXNG9KSHJJ?=
 =?utf-8?B?eHprU0xoVmhXYXJObncyQW9JZlI1bE5GVE0zWTB4ekJGK1o3VldyWEFMTFpq?=
 =?utf-8?B?dE5CbnVVUnlvTCs2VWlkMFBxWExad3dCNUY0RUtMbmZERk9hYmMzaGFJV2dM?=
 =?utf-8?B?cFlQVDZvcnBrQ1N4WFpnZmI5ODBZaUZtVU1HRXV4T3BJYUVqWEVMdEE3WXpD?=
 =?utf-8?B?TWR6cSs5RHBEcnF0SmRxZFVvazd1RFcwYTBrZytnOXZaampHQkF5Sm9EZWpl?=
 =?utf-8?B?K3Vuc3VCWHlPSEtvRjcwL0dlaVE4MmtQTHZLSXpPaXVWMHM3dzVNRVRTTEdP?=
 =?utf-8?B?REN3WER2cXB4b0ZYR0pHd1ljeEhNbnpNcnEzdzBmY1paMHh0RUFGZlpSS1dM?=
 =?utf-8?B?bUpMWG9oSDVNaFZtWlJlcVl5UW9pRjE4akllcFNMdUwvUnVpTXZNZGJkcGxo?=
 =?utf-8?B?bWl4Q3NlSGVGL1lJaWhOOGhlWUpkY3JvWFlPNmR5aFdFZEJWNkZlTi9pdlJK?=
 =?utf-8?B?a2VnS2dXL3lGZ0tjWHFFL2V5MXhqbDNGUWtZM0o2K3c5WVhSYUFaV3hDRE9W?=
 =?utf-8?B?alYrd2VMWVVqRGxDNDZodWpxem1FVVB3QjVjTmpNUFdocVVxUWcxeFlDRDVQ?=
 =?utf-8?B?Y29NcWNKMGlhelBuZFR0clI0a1dTYjZILy9LVWM1QjNDWHpjVUgySGJRZXVl?=
 =?utf-8?B?ZmlBRUwwcXh4WDF1UzJPa2NNa3pqSEZ2OWRGSktCUUFxN2h0QTUveExrU0l3?=
 =?utf-8?B?RVp0V0d6SDh4cG5Qell0NFJmbnJSck52cldTVkR4NHNzS1VDU0x5SzhnYkNw?=
 =?utf-8?B?TFVUdG0xT3c0NFAvM2FReHEzM2doNktUKzNNYUplZysvMDRadHUva1VScGRq?=
 =?utf-8?B?aHcyWFZTK2RkODJLbjVYY1RYTXlEYVBGSGIyU28zVS9QYzlNaVRNNnI1dC8x?=
 =?utf-8?B?UWp0K0JXaXQ2TWZCaFNxZVRFOEtoSzQrRUpNblAyV3UwdVRxV2hxdEszeGhP?=
 =?utf-8?B?U2pmdTZWSXh5TGc1YVdYRUhTRVlxaDBxZjA3WXRzVGhHaHEzdllhYnR3cno4?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e9fbe0-c1b1-4cec-45b5-08dbf124aa1a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:46:37.9213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfvnMraetORUpshWH87kvWmHhqlYZKiSBSJEYIiVeGNIS2o6U7uzb+bhCgcNv71rQpOZggG4TREG8GzhMCTUiDfws9qKLnsw54Lnj2tf+qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 01/14] drm/xe: Fix header guard warning
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Additional underscore in the header guard causes the build to fail with:

drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h:6:9: error: '_XE_ENGINE_CLASS_SYSFS_H_' is used as a header guard here, followed by #define of a different macro [-Werror,-Wheader-guard]

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
2.43.0

