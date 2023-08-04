Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA5EC001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 21:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF7410E009;
	Fri,  4 Aug 2023 21:48:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D5E10E009
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691185699; x=1722721699;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=C/H+5wHsbzZWcW9QB4Xzm7UIU3MCOX69Tvh+MFiia54=;
 b=UjQHMoqceFxlcC8VqeIAo4pXPF4tnVycakGmyncsC+S+olGZDM0wJqf/
 NVbq6ePBYGHlAyoUcWvnUHH7Kc/wRL0eYUJTO1OjLpYYefKaEykmH9pkF
 aBpWnG6wUyZKAFsUKBvbe0OwWQ1fmbrmeut54dDCJV1x55pF1ZricT59f
 s3gVhbRZRrBOiO8MF8bw3DnRvIRuYB8S8f+O7oLvzO1y3+Ztm+aJY9jK9
 rS6PBHTeOwpizAG8LYuNZH91MQosF/1zIakvdAL6neSqS3Sj94PAAOXoc
 L7AL324bn3n7BHPAYbrbJLTlJxc8cMgyLVJdiJVfZR3vWUa+tPGY/HM+q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456633070"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="456633070"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="904037485"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="904037485"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 04 Aug 2023 14:48:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 14:48:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 14:48:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 14:48:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 14:48:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxuzkX4qG4vIXtAdlIacYKLgV+2AoBRVO8/O/AGyrMbotCDQAH7zNVmwFcBFQxD3l8rTx1kq/MmqLkHl8AKc1UFvEqT7p9T9tNvNicQknPtroWUGXMo0N0ruxBleamS+XaNvur5BTjstCuUm2k7iS4FC1jQHUlb2ip59zCNzvdXFnRN43p5w1OZ23WAk3/43axYQ4RaqI8hFRZzoPKVsf7BO+9s0l5v21BhZrmA/y5prX2t2azpfRsrpqiJ64NfJMACaUSdS3R3tqE+1q1sI7s9F4bbrgS2zgXfSVhfXw8ffR3iREwx+S+EQag1cRH536xFJVad+pqwZTJr08k9xaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YAXV75eH6bxV+y+ZdUBKPwGO3ZqQyyTu1XErFazC5k=;
 b=gj96xmoRiwlwoH192zUKsZ0x9esxplLDaKWhW/6dUVsWPLU5P8PxnZWmnGlVdhmfSSIXYCDekf7FYPjwuK+vKQ0N6pCXikhrSZ4Rh9ZYCizBtRa3IH970HDjRfdCw461WRTrJ+HzErjKV3siYgyxg5c37RWFaLc6ZamOIG2q4iNEUBFLF6WRCzGj3INlsj1snhPPsZZ+69WwAu382nhx4ENMgU+jqhG2f2VPAKTcaa8JUnVHAEA4AJXBfMyn8VCzHfdakul7lnFq2aD92SVylcoGA3TCaVqqO1YVydlaSnTptpZyHTKEVIiQw59XfKpLZWSJm8bScUJ9FtQ5konwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47; Fri, 4 Aug 2023 21:48:05 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 21:48:05 +0000
Date: Fri, 4 Aug 2023 14:47:59 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <jose.souza@intel.com>, Lionel G Landwerlin
 <lionel.g.landwerlin@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZM1yD7udZeX7lg1l@orsosgc001.jf.intel.com>
References: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
 <20230804213253.2381705-4-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230804213253.2381705-4-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: b087e6b4-3650-44be-8cd0-08db95347bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAd4GWNBp4lxjjNPgSe/1RmJERza7szJLAArM6wjRUrFeM1EY70fWC04EQ707WOIMLCpPRI0EDnpF6fGktaklKmkWLGrApLOc1WoQO6rgBSGHsD/6hFX4On6nL3m9/826XYku13NtQF/VA67REmpwh6g2yVTk1LQHw6g/eoUrA9R61QLmiSGwv5xupT2vTFbUVeFmxOcvDSCUhgc/TtidtkohD4Owo5wMJDSP8Tjoce9LOWtGRdIpa+2/BIp/W3MCNPdk+gtHwsv+PwtolRN8Xp5iEJ0ihj/Z56smml2LCzVfd6xFxT4n1t0i405uwmscYyht39xp+/R6jSCrlcU9xz3BVbQLO204NZkyc4cdyREQ82AG8B3+iJO2fEXUkKd7sg0/7xmm5u5ds25lucnmPqTfHstzQIdyYRw8ub1H1JQrNckcrV8zLBOw3NK7QggAf5xbvGJynHnJ94l+e3Jmf3hQK/ozqvfhdiZnp5Cz5XpMFn9+JZ6ZBa3TIaMaOWZSihMe3OPPeXbaHW5O3IAMGMdXa0ZbLUltTVzfTzhj9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(136003)(346002)(39860400002)(186006)(1800799003)(451199021)(2906002)(8936002)(30864003)(86362001)(8676002)(83380400001)(6506007)(26005)(6486002)(6666004)(6512007)(966005)(41300700001)(316002)(478600001)(5660300002)(66476007)(38100700002)(82960400001)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTd3dFlabmlxSVBxTVJxYkg1Z3gybDBONmk4T0tjYm54YVlnQVJoZHpvUWp4?=
 =?utf-8?B?NlhRK3NnOG5GaVRtUm5Ha0twRk1KRUFMUGhBbXh0TVlVT0dPSXlxQ1RueE9R?=
 =?utf-8?B?UUNGVWtDVGlLTGltc1Z1Uy83UTQ5eU1ielJtWFlvVnpubGZTcUpCU2gvdFVJ?=
 =?utf-8?B?c0lLcDFqakpqUGI0U1VJck9FUmdhSGxvano4Yll3Z2dONUlRMjdWanl4YTNH?=
 =?utf-8?B?R0xxZzFFT2o5b0dLdmxtbEltTW42N2tnK1FrNjZ2M0IxVXJLeWtITk5ScVNx?=
 =?utf-8?B?N0ZGL2d5Uk9GcDgzQ2RzQjhaTUk5eHRNWElDNUdEb0ZlUmpWeUtYTEhiZDVI?=
 =?utf-8?B?bEpVQkZLaW40V0dJeGZSanhudUtMUDkvRmhPY0NPVFF4WFl4b3RLQS9zcGhG?=
 =?utf-8?B?b1pteGt2MDN2Wmh0Z25wZzVaRXBTcWRDYXMrOE1YckRDOTEvM3hlb2p2bUx6?=
 =?utf-8?B?NGxUZHlxNTR2emd5akxRQUJGQ3dvZUZkK0NzQVYxVTArM2NiYldQN09QcG1n?=
 =?utf-8?B?TnJFNkIyY0pXOTZOWTZ3K0FlS0xYN3M5UmJWVHZVcFE2R1Y0MDFRUjFoYWxl?=
 =?utf-8?B?YzNSWWd2ZFMrS1crNHNxR2hnSU1hckJQZk9VV0ZycS9qSlNPWkFIWWxtcmFF?=
 =?utf-8?B?MUZWSnBOYzQ0SzBWQkZBelRMMjE3TS9WRUZkeE4rOCtWaDZYSnpYdW1jTzlW?=
 =?utf-8?B?T2FlVGZaYUhpY3djakhJaEMyQjhkOWhBVzdJNEIyZFhXbi9WVlU3Z2R6NVNk?=
 =?utf-8?B?T2RkQmZGaVAyekF2OEdBRmZJcVplZStya2RXT3BqN3l3YjhldVJoVTZlRGtu?=
 =?utf-8?B?djVjbXkxQmdZaWJLdGlocW44K1h2Y2dRelZtU3J6Zk9zbWMvaTNoVk1qWHBI?=
 =?utf-8?B?VWpvTGZTMHFYSCt4S3NXU3ZYd2YzemkzUEI4SEUzMWFHRWoxTUVEOE44OEo5?=
 =?utf-8?B?WGtyRThVRyt5Tmk3WlR6Snp6ZFZ6bVkwYnczL2MyTms1NzhzeTg0U25TWnBU?=
 =?utf-8?B?QTM5TllmTEpmbERrRVdPYTZMMVVJU1RFZFFiaEJ4c25kODB4OWJJeUxOYTJy?=
 =?utf-8?B?MW9yUjJ4WkpoQUIxUnRtNVkvMjNvaG1TUStrL3JwRXQrMitlcGZTUmpVMlFa?=
 =?utf-8?B?Y1prNzU2T0l6UUpoSzZlREhqQWxKeHB5MHpYT0lSSllPcTdnY1ljL0tPczZt?=
 =?utf-8?B?Y0pnVFNhVXR2Z05lM0N6S3dwSlQzSk91OXk0bnk3Y08yKzdNVkJqcFRzZk41?=
 =?utf-8?B?TTN5WVBuaDIyVUFhMk5ocFZiN1owMkxHazRZSGNYMGtUdzNmRk5oVGFVdFlk?=
 =?utf-8?B?NzN6ZVZtQ0hCTEloc3dFRXBiZFJMWVNNUWpVNGQrZDBxcFRTTlZWQytVMUo3?=
 =?utf-8?B?aUZTUlQ4SHhrSC9jamlsa1ZxWlJmMzBBUVE2Z0xJK2I2aE1teEFlQkdwbmg3?=
 =?utf-8?B?c0NKWUxMZnhSMG9oKy95UkZHU1owc0lFejg3S2NUZEMxSldoR09KbnA5dTU3?=
 =?utf-8?B?Y1VlQmc0WEhFT1ora2hPZTY3ODl1aGpEVXRjS0NDczUxVkVHM2dhT3VKQTBB?=
 =?utf-8?B?bVB1d0dnclE5TnM5aGYwK1ZUSTZIM3NIQnFLWTZDc1drT3NaN0JDTzhCZCtY?=
 =?utf-8?B?QTErb04vNTZ0L3NYT1VacVcrakFFeFhxNFZRUHlobTRTa01NOHFPQmZkc1FO?=
 =?utf-8?B?Qm9HUlhLZFhaZ201MTJkQ1g1aUtPVzlSZytEazJGaG0ybW4zbUZLOUtqVkIr?=
 =?utf-8?B?K1NSZmdqaVN1TEFYTlBVM2dzK1FvdkFYdkRrZDlYcmFzRFpqaDloRkM2Undi?=
 =?utf-8?B?eTVOZk9qTnJKa2UrL1lEbUVYTWF1NHZhb2dhMGNkMEJQTjNUL2hVWi8zcHhl?=
 =?utf-8?B?c3VFMmxmK0tENWtJZlh4Zkw3dGtuclRaejJ5aC9PcmZmNjFlZDhCZUFFK3BM?=
 =?utf-8?B?Z2JOeklBL2dqYS96djVkVHlGbXJqQmR1dzU1cEh4VDBUNjFSQWRESGFBcVZK?=
 =?utf-8?B?T0o4NUtFL1FxT2p3c1JBL083bjJ6MnZHaGhGaitMSVN3endaRUJyMlN2WXNT?=
 =?utf-8?B?SloyY2ptZFpqVldkeVFaNHRWQVh5QWYyOWVnbEVjazNkZm82MjNNRUtLU2w5?=
 =?utf-8?B?SHZyR2ZkR0FLMkFwWStrd21IQzVJekVjQTgwVk0vTngzMVlTYXM1MHBudTRY?=
 =?utf-8?Q?Jxxu4ol3oJSDrW1AEjBRbZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b087e6b4-3650-44be-8cd0-08db95347bc0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 21:48:05.2471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nm8DE6cMV35xjgL44C2oZagjsqwurjIm1/9s7atJjX3N5pIugWucJcBFh+zEevSwA6aouC0YpH0FKMwi6r5CCWrTs+lYBmlCHIwb19+MO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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

On Fri, Aug 04, 2023 at 02:32:53PM -0700, Umesh Nerlige Ramappa wrote:
>Perf measurements rely on CPU and engine timestamps to correlate
>events of interest across these time domains. Current mechanisms get
>these timestamps separately and the calculated delta between these
>timestamps lack enough accuracy.
>
>To improve the accuracy of these time measurements to within a few us,
>add a query that returns the engine and cpu timestamps captured as
>close to each other as possible.
>
>Prior work: https://patchwork.freedesktop.org/series/87552/
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 141 ++++++++++++++++++++++++++++++++++
> include/uapi/drm/xe_drm.h     |  95 ++++++++++++++++++-----
> 2 files changed, 218 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 99a4800c7c53..ae1e810267a7 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -6,10 +6,12 @@
> #include "xe_query.h"
>
> #include <linux/nospec.h>
>+#include <linux/sched/clock.h>
>
> #include <drm/ttm/ttm_placement.h>
> #include <drm/xe_drm.h>
>
>+#include "regs/xe_engine_regs.h"
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_exec_queue.h"
>@@ -17,6 +19,7 @@
> #include "xe_gt.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_macros.h"
>+#include "xe_mmio.h"
> #include "xe_ttm_vram_mgr.h"
>
> static const u16 xe_to_user_engine_class[] = {
>@@ -27,6 +30,14 @@ static const u16 xe_to_user_engine_class[] = {
> 	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> };
>
>+static const enum xe_engine_class user_to_xe_engine_class[] = {
>+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>+};
>+
> static size_t calc_hw_engine_info_size(struct xe_device *xe)
> {
> 	struct xe_hw_engine *hwe;
>@@ -45,6 +56,135 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
> 	return i * sizeof(struct drm_xe_engine_class_instance);
> }
>
>+typedef u64 (*__ktime_func_t)(void);
>+static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>+{
>+	/*
>+	 * Use logic same as the perf subsystem to allow user to select the
>+	 * reference clock id to be used for timestamps.
>+	 */
>+	switch (clk_id) {
>+	case CLOCK_MONOTONIC:
>+		return &ktime_get_ns;
>+	case CLOCK_MONOTONIC_RAW:
>+		return &ktime_get_raw_ns;
>+	case CLOCK_REALTIME:
>+		return &ktime_get_real_ns;
>+	case CLOCK_BOOTTIME:
>+		return &ktime_get_boottime_ns;
>+	case CLOCK_TAI:
>+		return &ktime_get_clocktai_ns;
>+	default:
>+		return NULL;
>+	}
>+}
>+
>+static void
>+__read_timestamps(struct xe_gt *gt,
>+		  struct xe_reg lower_reg,
>+		  struct xe_reg upper_reg,
>+		  u64 *cs_ts,
>+		  u64 *cpu_ts,
>+		  u64 *cpu_delta,
>+		  __ktime_func_t cpu_clock)
>+{
>+	u32 upper, lower, old_upper, loop = 0;
>+
>+	upper = xe_mmio_read32(gt, upper_reg);
>+	do {
>+		*cpu_delta = local_clock();
>+		*cpu_ts = cpu_clock();
>+		lower = xe_mmio_read32(gt, lower_reg);
>+		*cpu_delta = local_clock() - *cpu_delta;
>+		old_upper = upper;
>+		upper = xe_mmio_read32(gt, upper_reg);
>+	} while (upper != old_upper && loop++ < 2);
>+
>+	*cs_ts = (u64)upper << 32 | lower;
>+}
>+
>+static int
>+query_cs_cycles(struct xe_device *xe,
>+		struct drm_xe_device_query *query)
>+{
>+	struct drm_xe_query_cs_cycles __user *query_ptr;
>+	struct drm_xe_engine_class_instance *eci;
>+	struct drm_xe_query_cs_cycles resp;
>+	size_t size = sizeof(resp);
>+	__ktime_func_t cpu_clock;
>+	struct xe_hw_engine *hwe;
>+	struct xe_gt *gt;
>+
>+	if (query->size == 0) {
>+		query->size = size;
>+		return 0;
>+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>+		return -EINVAL;
>+	}
>+
>+	query_ptr = u64_to_user_ptr(query->data);
>+	if (copy_from_user(&resp, query_ptr, size))
>+		return -EFAULT;
>+
>+	if (resp.rsvd)
>+		return -EINVAL;
>+
>+	cpu_clock = __clock_id_to_func(resp.clockid);
>+	if (!cpu_clock)
>+		return -EINVAL;
>+
>+	eci = &resp.eci;
>+	if (eci->gt_id > XE_MAX_GT_PER_TILE)
>+		return -EINVAL;
>+
>+	gt = xe_device_get_gt(xe, eci->gt_id);
>+	if (!gt)
>+		return -EINVAL;
>+
>+	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>+		return -EINVAL;
>+
>+	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>+			      eci->engine_instance, true);
>+	if (!hwe)
>+		return -EINVAL;
>+
>+	resp.cs_frequency = gt->info.clock_freq;
>+
>+	xe_device_mem_access_get(xe);
>+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+
>+	__read_timestamps(gt,
>+			  RING_TIMESTAMP(hwe->mmio_base),
>+			  RING_TIMESTAMP_UDW(hwe->mmio_base),
>+			  &resp.cs_cycles,
>+			  &resp.cpu_timestamp,
>+			  &resp.cpu_delta,
>+			  cpu_clock);
>+
>+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+	xe_device_mem_access_put(xe);
>+	resp.width = 36;
>+
>+	/* Only write to the output fields of user query */
>+	if (put_user(resp.cs_frequency, &query_ptr->cs_frequency))
>+		return -EFAULT;
>+
>+	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
>+		return -EFAULT;
>+
>+	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
>+		return -EFAULT;
>+
>+	if (put_user(resp.cs_cycles, &query_ptr->cs_cycles))
>+		return -EFAULT;
>+
>+	if (put_user(resp.width, &query_ptr->width))
>+		return -EFAULT;
>+
>+	return 0;
>+}
>+
> static int query_engines(struct xe_device *xe,
> 			 struct drm_xe_device_query *query)
> {
>@@ -373,6 +513,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
> 	query_gts,
> 	query_hwconfig,
> 	query_gt_topology,
>+	query_cs_cycles,
> };
>
> int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 86f16d50e9cc..a5a5a02253f2 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -128,6 +128,24 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>
>+/** struct drm_xe_engine_class_instance - instance of an engine class */
>+struct drm_xe_engine_class_instance {
>+#define DRM_XE_ENGINE_CLASS_RENDER		0
>+#define DRM_XE_ENGINE_CLASS_COPY		1
>+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>+	/*
>+	 * Kernel only class (not actual hardware engine class). Used for
>+	 * creating ordered queues of VM bind operations.
>+	 */
>+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>+	__u16 engine_class;
>+
>+	__u16 engine_instance;
>+	__u16 gt_id;
>+};
>+
> /**
>  * enum drm_xe_memory_class - Supported memory classes.
>  */
>@@ -223,6 +241,64 @@ struct drm_xe_query_mem_region {
> 	__u64 reserved[6];
> };
>
>+/**
>+ * struct drm_xe_query_cs_cycles - correlate CPU and GPU timestamps
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_QUERY_CS_CYCLES, then the reply uses
>+ * struct drm_xe_query_cs_cycles in .data.
>+ *
>+ * struct drm_xe_query_cs_cycles is allocated by the user and .data points to
>+ * this allocated structure. The user must pass .eci and .clockid as inputs to
>+ * this query. eci determines the engine and tile info required to fetch the
>+ * relevant GPU timestamp. clockid is used to return the specific CPU
>+ * timestamp.
>+ *
>+ * The query returns the command streamer cycles and the frequency that can
>+ * be used to calculate the command streamer timestamp. In addition the
>+ * query returns a set of cpu timestamps that indicate when the command
>+ * streamer cycle count was captured.
>+ */
>+struct drm_xe_query_cs_cycles {
>+	/** Engine for which command streamer cycles is queried. */
>+	struct drm_xe_engine_class_instance eci;
>+
>+	/** MBZ (pad eci to 64 bit) */
>+	__u16 rsvd;

I need some inputs on the rsvd field here. Looks like struct 
drm_xe_engine_class_instance may need padding (64 bit aligned) if used 
this way.  Is this the right way to pad it? Should the padding be moved 
to struct drm_xe_engine_class_instance? OR should struct 
drm_xe_engine_class_instance be packed?

Thanks,
Umesh

>+
>+	/**
>+	 * Command streamer cycles as read from the command streamer
>+	 * register at 0x358 offset.
>+	 */
>+	__u64 cs_cycles;
>+
>+	/** Frequency of the cs cycles in Hz. */
>+	__u64 cs_frequency;
>+
>+	/**
>+	 * CPU timestamp in ns. The timestamp is captured before reading the
>+	 * cs_cycles register using the reference clockid set by the user.
>+	 */
>+	__u64 cpu_timestamp;
>+
>+	/**
>+	 * Time delta in ns captured around reading the lower dword of the
>+	 * cs_cycles register.
>+	 */
>+	__u64 cpu_delta;
>+
>+	/**
>+	 * Reference clock id for CPU timestamp. For definition, see
>+	 * clock_gettime(2) and perf_event_open(2). Supported clock ids are
>+	 * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
>+	 * CLOCK_TAI.
>+	 */
>+	__s32 clockid;
>+
>+	/** Width of the cs cycle counter in bits. */
>+	__u32 width;
>+};
>+
> /**
>  * struct drm_xe_query_mem_usage - describe memory regions and usage
>  *
>@@ -395,6 +471,7 @@ struct drm_xe_device_query {
> #define DRM_XE_DEVICE_QUERY_GTS		3
> #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>+#define DRM_XE_QUERY_CS_CYCLES		6
> 	/** @query: The type of data to query */
> 	__u32 query;
>
>@@ -737,24 +814,6 @@ struct drm_xe_exec_queue_set_property {
> 	__u64 reserved[2];
> };
>
>-/** struct drm_xe_engine_class_instance - instance of an engine class */
>-struct drm_xe_engine_class_instance {
>-#define DRM_XE_ENGINE_CLASS_RENDER		0
>-#define DRM_XE_ENGINE_CLASS_COPY		1
>-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>-	/*
>-	 * Kernel only class (not actual hardware engine class). Used for
>-	 * creating ordered queues of VM bind operations.
>-	 */
>-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>-	__u16 engine_class;
>-
>-	__u16 engine_instance;
>-	__u16 gt_id;
>-};
>-
> struct drm_xe_exec_queue_create {
> #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
> 	/** @extensions: Pointer to the first extension struct, if any */
>-- 
>2.38.1
>
