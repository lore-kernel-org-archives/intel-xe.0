Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244FDC46CD2
	for <intel-xe@archiver.kernel.org>; Sat, 23 Dec 2023 02:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C1310E023;
	Sat, 23 Dec 2023 02:41:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D636B10E023
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Dec 2023 02:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703299265; x=1734835265;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gnmIYPjBp/48w+KH1kFjSSiAbNQ98VzM8QOqy1MX0Ss=;
 b=VNi8RMDbhU7PpjQA1LKEkAlr3TXUtpfrv8gK14EtXCEeerz9guWseIQe
 RYup+3hmKPxHRQpGGxR6HFeQL9oakCqiWhc8F8yK+qn1JTyzdtFHfWw0d
 o5QEXpNzBNmlxCjXVGBYGqKAUkQBpNl7CZAilR9IgY8kcyFr+3SnhtEsP
 kpBzjlGEQWYquI8BlydxyWeBKFWGMuHyYR9TWAMTaf7umPbbsvXlOgg+x
 usBkC6JhWTyVfebEHepVvsfXr4gTMO886RZpnOrkrmOlkZtDhnY7AYxHU
 gbdIL5TOy2z4qOu4MIJ2RzHtVSpeWpmFrtBj6H6ugN8jSJUJYCU/R3eya g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="9576813"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="9576813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 18:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; d="scan'208";a="11715091"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 18:39:29 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 18:39:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 18:39:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 18:39:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 18:39:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV85CESm1uYKicOsoL0NwKcgF69uPfFIUlMXCGpzHYvwQ3cqB9XhtEsClmWf+0JBqDDA7109cA4K4jtVUioUsbkzIccThe3Ia0QbhQxl79ErLsdXUuaIA3sGcDeeGwsiIW/1o8wTq2CvRa5y6MSgoRuI7d36fCeshm4+xhYSjGlYeSsRYJbqhKtd7OjWNgTaxht2TsB6QS1uVYYpQqc6C0CyYXJ79jUxHhAkic+axfC9f7E1+x1RI1ezM8hUPt8DfVhj846AbxmI9NunmHdLul4uLvIp9IlWXW3YLQ9DohTUeeKjXUVQ4AHZyo3xev3HWfPprPaUK0IOAVZnq1aGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxFhrnv/JE80+fLDCXiTXxJOQEFrYiF74haja11+xTs=;
 b=hr3aowbHzlJSwoN9SDxFpsx0aOUWrFHqqxwlTtnGWfuYUw+L6j+2dS9kKh6H5sirY++sLUCVQQ7hqFf4KqdyCyd7AIqoNZin5QGfKothwO2hBfy9Vkzc9TBmBO9NYfN802GKOi/O4cF75qQVaUqBrxEPC7FD4kOwTijLN1eIF5wJoWVvLb4VihICLSJoV+YVjMthn3CoyJt21JG3eYu9+sL3Bh3+74FpooMAx7H9L/DAAcKi5fHNxHv/xM8oKHEQXINzKDGKEomS+dFzJmmK39Y6GOrmWL+voWUBGyzLTyqIVkXH6VeEvyqVYcIVsxHGVjazSD+DOktOIj5bw8B3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Sat, 23 Dec
 2023 02:39:24 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.022; Sat, 23 Dec 2023
 02:39:24 +0000
Date: Fri, 22 Dec 2023 18:39:14 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 15/17] drm/xe/oa/uapi: OA buffer mmap
Message-ID: <ZYZIUsd5Mf2BgfyY@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-16-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-16-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:303:dd::24) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ0PR11MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: 116e25a5-020d-4eea-aef3-08dc03605f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e7wKSeg8mDyxuMIPyqr4N9C5YkkG5UNssLO2WbHLjwbDlK6GzR5j+5Y9TcGbdt0CTHbnqh/eYkTV2Qy2fKN9IJ75WML6/+WLNL65saFORqQC/lgw2+PHWB2gLgA5VSpMF9pO/64A6L9UMDcg2/jJfcnQRer+JDVlk+WU6fXfWhuFUOWoK/aAR1gtthAUdNTbk4kDThxTHJYqVtI6zxZ3j30s5qFJG7+j29ga7Eqbv+nM4SvGPCozXJs65DU2TJBzK74p4pxfRU3t0XtQ5Ie4p1ZBJj0Y4yRlngpyCCgY+sX/nMseBrtrVvjdhTujZw4ODV+6Qo/c5UMAoK8gwtNF+AftU/exTFJMCDRE1FGYt6IEI5WYAYPOP+X064S4zaboIUVo32MpGlvRpijgZsr/bP02magbJeMnZy//XArAg1aihkHRdbJzbBhATduNb3/KArDeEnKZQcC4es0ta0kvNkjkAzD4MDU2hbbzA6p7PTyaVCo/TLHGmml6DYzZuMV6B2s78cB2l2MbjJtkGQlG4OaTo3oT6h8SoSHUA/SPHb1nAcLPbfdKZoqbgrNOw6Ia
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(9686003)(6512007)(6506007)(4326008)(6636002)(8936002)(478600001)(66556008)(316002)(8676002)(6862004)(6666004)(66946007)(26005)(66476007)(2906002)(41300700001)(38100700002)(6486002)(82960400001)(83380400001)(5660300002)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkxwaG9kamQxdUUwWmwzc3RWY3pDZnk5OUNXK1RFbjVHNWZjRzVUcEZjVWV6?=
 =?utf-8?B?QmYxRmZpMWpqQlh3OVpjOTE2d2JGVk1iOVM5c2s1UitVQlhmZ0hYTXFVNkNl?=
 =?utf-8?B?d1JOTjBhSXdBcGxuSjZkdm5rWkhpbWlSOU1QUmNsTVFhU0dxZVZuYnI0dW5C?=
 =?utf-8?B?bW9KbXVEVG53ODFpaDgwRlRIb0pmMHdyZ3pYZjhZMDRCaGhyaFBQRC82N2ZJ?=
 =?utf-8?B?RzNXQWM5dVhBQ3Q3MXBKWmxabThPVG5UekNmd2kxRVUvVDZJQmI4Vmoyekg0?=
 =?utf-8?B?U1JPU1lSeVZjOVJ0STlFYmthaEs1N0Y1VkQyWEFqTUEzd0w5YkdNN0JsVjl2?=
 =?utf-8?B?b2xPZE5SL2hPT09HaThpQnlDcU4xVmVyQmNSQTZaWnIzMmpaNmhHdFpCZit1?=
 =?utf-8?B?K2N3NHdIYWZDNkFIRzhYRWNwWkdvTkVDUFU3VnlFU0tUdUUvTDNreFNrdGs4?=
 =?utf-8?B?MFNrazRGNUdkN3BlYzEzTGw5SlRwaXBPd1JMRzdHZHVFRXhmK05SOXA2Qm9O?=
 =?utf-8?B?YkYwU1AxQXJSNjNtc29VVjM3ZE1BbmtpLzF3TStLOWFyZUtheEI1a1llSFdD?=
 =?utf-8?B?WUYvR3hsSGF6RFE4bmVQSVF1cTN2aUV1emNlbTBqTjFLUmtYK1NQZlY4RVA1?=
 =?utf-8?B?QVRvNU5pU0lLQ2Q0UlBMNDBoa0JjYjNIODM5d2hpVmU3U0Z3M0k5d2tqS3Mw?=
 =?utf-8?B?dTZwWTFEZ0I1cTFwQzNuWEJ2VVRYVWpRN0JOMmJ6WkgyU0dtUUpLQmJ3MGE2?=
 =?utf-8?B?RCt0cEpNQ3BNZFEyRjlOVTNrL2xSdWtTNzAwZllOWnExQWgrUFVndTBtcnIx?=
 =?utf-8?B?VG1KTWNQOTF3TGNuUnVxYWE2N296TENiREd3QkFOc09VWlZKeDFoUXVqcndk?=
 =?utf-8?B?MG5ZL3FyZVFpK0lkVWdtZkY1dGc1SUVXUmZlMWNvYytwNy9MNTBIYmFHdHRq?=
 =?utf-8?B?SlA0MGUrNXRtNmZzaFNhR3JQVmI1OFVnREtIajlyYTZKa1lNSUc2R1duRG5I?=
 =?utf-8?B?dnBhalBwZFYybURTbTMxRDJWdlc0ZTBZR0U2MmtiWFc2Z3JUMTNKanczWUM3?=
 =?utf-8?B?MGU5SDFuT2xMcGkySG9NUnRTaTVXUFllbGhqU3FmZU5qdTBDRW5xV014Q2ty?=
 =?utf-8?B?LzZ4ZzBadUJWa1JQbG1lTVg1TzlTOEgxTFdFWnY2MVNYS25tV2RkM0FaZ0pN?=
 =?utf-8?B?RjByWVlGcGE0c3NEVGFJaU5UYWRvalk1YUpURnNaUkdSd0lvN0xpWVVKSnpE?=
 =?utf-8?B?RGtxdkF0VmxJWjJFbUtQY3ZPZjMwYnY3Zmd1eEw5R0ZrM3p5RVlyM1JkOEZn?=
 =?utf-8?B?L0U5cEEvek02akZMekZocEtGdFVCZnBEeUVwT3U2SkxxN29DWmdsTFJGRXQw?=
 =?utf-8?B?NDJXeTcrR0xweHYrWlVIN0o4V1V6RHlrNWEzZ2ozRUxwNjErWWZ6NU56YXc5?=
 =?utf-8?B?ck5FRWErSGtqdllSQ09DN0RSN0o0QU5EalZXTjc0TFJkQ3RITlJFeWZVcG13?=
 =?utf-8?B?V284RlRzRjlEQmhSR29VNkZONmV3UzRJaXJIc1dXZFpxNjdjSTdpMW5Ra2dp?=
 =?utf-8?B?NjdXUnc1S0dGQ1djSXJFZUNyUXNrV1NuZ1E2U3Q0ZnNpbWhPQmR0Tm8xcnUw?=
 =?utf-8?B?Wlcwbmo3bFZXaWpVYzJQU0F6dmZTOXdyYXJyWmlvaXJORGpibnFpcW5rb1Y1?=
 =?utf-8?B?S3JTSGdhcGpuMWg5QXBPNForQURxV3BpLzhIL1V3K0ZrZUUvUFpRc2p1Vndm?=
 =?utf-8?B?cm9wTi9TVTVjckZUdS96Qm9McWk4ZTZ4clI3ckc1LzJmd2d1YmlBUUdQOFFl?=
 =?utf-8?B?cUo5VmNUSStaNlArK1E2dzJkbEY3bjRndU1mWnRqOWpXZWNwaVJ6aFp1MEZH?=
 =?utf-8?B?WjNCcDhLblhiWmFFMU45RlFUdEtubjYrWmZuRDhFVkh5QUR5aGhOUStVWE1a?=
 =?utf-8?B?MEgvS1lzMHpSbmRtd2xFdjZCMHBJR2puWDJndVpvWlhCeDlsbDNDYm9vSCsw?=
 =?utf-8?B?YzhTVmJRMTJ2aHA1V0h3Q1pCVVQ1dHYvSUdyaVpxQzY0ZUs3OGdHcEtaQm12?=
 =?utf-8?B?d2FNK0xRVERFbHcvRU9MdkplSkVrUUdldU1GUmFoKzZwa3E0RVFFa0hEYWN2?=
 =?utf-8?B?dEEzWCtBNHptMCtXdHIzTzBMdjBpTjZ0Um52aUxkNTFzREhFczh5SFJzYTZw?=
 =?utf-8?Q?rCFwSZkmyqEPGHZFkt8X1cI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 116e25a5-020d-4eea-aef3-08dc03605f38
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2023 02:39:23.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXeFRaUVbNaiauTf5vc1pBKM3te24naE2nQ6zi+XXEzWFJcl0iyh4Sb+6tqOOv5F+LDSrJroQTFPXAhlTmlt5Vqxy2V2ZgVpt3anpHRZG2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5037
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 10:43:27PM -0800, Ashutosh Dixit wrote:
>Allow the OA buffer to be mmap'd to userspace. This is needed for the MMIO
>trigger use case. Even otherwise, with whitelisted OA head/tail ptr
>registers, userspace can receive/interpret OA data from the mmap'd buffer
>without issuing read()'s on the OA stream fd.
>
>Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 53 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 53 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 42f32d4359f2c..97779cbb83ee8 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -898,6 +898,8 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
> 		return PTR_ERR(bo);
>
> 	stream->oa_buffer.bo = bo;
>+	/* mmap implementation requires OA buffer to be in system memory */
>+	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
> 	stream->oa_buffer.vaddr = bo->vmap.vaddr;
> 	return 0;
> }
>@@ -1174,6 +1176,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
> 	struct xe_oa_stream *stream = file->private_data;
> 	struct xe_gt *gt = stream->gt;
>
>+	/* Zap mmap's */
>+	unmap_mapping_range(file->f_mapping, 0, -1, 1);
>+
> 	mutex_lock(&gt->oa.gt_lock);
> 	xe_oa_destroy_locked(stream);
> 	mutex_unlock(&gt->oa.gt_lock);
>@@ -1184,6 +1189,53 @@ static int xe_oa_release(struct inode *inode, struct file *file)
> 	return 0;
> }
>
>+static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>+{
>+	struct xe_oa_stream *stream = file->private_data;
>+	struct xe_bo *bo = stream->oa_buffer.bo;
>+	unsigned long start = vma->vm_start;
>+	int i, ret;
>+
>+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
>+		return -EACCES;
>+	}
>+
>+	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
>+	if (vma->vm_end - vma->vm_start != XE_OA_BUFFER_SIZE) {
>+		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
>+		return -EINVAL;
>+	}
>+
>+	/* Only support VM_READ, enforce MAP_PRIVATE by checking for VM_MAYSHARE */
>+	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
>+		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
>+		return -EINVAL;
>+	}
>+
>+	vm_flags_clear(vma, VM_MAYWRITE | VM_MAYEXEC);
>+
>+	/*
>+	 * If the privileged parent forks and child drops root privilege, we do not want
>+	 * the child to retain access to the mapped OA buffer. Explicitly set VM_DONTCOPY
>+	 * to avoid such cases.
>+	 */
>+	vm_flags_set(vma, vma->vm_flags | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY);

Would help to just use the vm_flags_mod where you can specify both set 
and clear flags.

And then just to be paranoid about it, maybe add an assert to check that 
the flags applied correctly.

Assuming you ran the existing mmap tests for this. I think we should 
also add an mremap case. I think that should fail with EINVAL since this 
is a private mapping.

>+
>+	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
>+		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
>+	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
>+		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
>+				      PAGE_SIZE, vma->vm_page_prot);

vma->vm_page_prot is set to the state of vm_flags that existed at the 
mmap_region() level. We have modified those flags here and we must 
update the vma_page_prot with vm_get_page_prot(vma->vm_flags).

Thanks,
Umesh

>+		if (ret)
>+			break;
>+
>+		start += PAGE_SIZE;
>+	}
>+
>+	return ret;
>+}
>+
> static const struct file_operations xe_oa_fops = {
> 	.owner		= THIS_MODULE,
> 	.llseek		= no_llseek,
>@@ -1191,6 +1243,7 @@ static const struct file_operations xe_oa_fops = {
> 	.poll		= xe_oa_poll,
> 	.read		= xe_oa_read,
> 	.unlocked_ioctl	= xe_oa_ioctl,
>+	.mmap		= xe_oa_mmap,
> };
>
> static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
>-- 
>2.41.0
>
