Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0808FE8FDC6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 02:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFB810E0B9;
	Wed,  4 Oct 2023 02:23:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7483C10E0B9
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 02:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696386211; x=1727922211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lf7WksDMkGPKAuDI7JL3grFJOB5fJ9YfAMwYyz4gaBI=;
 b=H7lJTr3UsR/erbdPTIeza1AJDupsfKq2EaSXoU7gC2alr8sJ7idtWurd
 No2WEHPAQoc1XIGRyPyxI3nVGATPPPyzQreIqY+sWIoBzi945RBViLOVt
 +oSBAgADg/SlXhKg9X5sX96TRSdsv7OaT7zqunME14P6vbwOcF+/z2Qs3
 832LCl4zg4fkgo6/TIYr/4/PvqVdzVmHZW0flyJKAz2j3iF39MwF7XjgS
 VUMKg5GzbZ+so/eHJ6wLoT3ssMIylw1CzuvuWEhgyygp1fBbC4EqhAspD
 yoG8yazucC0J72Y7nFQsGuRcxMEsK0aFFlsn8epvC8K34kyIxRnB3iu2h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449526155"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="449526155"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 19:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="867128621"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="867128621"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 19:23:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:23:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:23:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 19:23:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 19:23:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKb2YVWROowem1RXYg4J1vurfTdhBZcUcuVz0Od5+bXdjJmS0EffHSS3QjGHBXgC2zCel666snYtZR9QNxL4WQyG8cWMF+nBosvfqlasOiYLAQERP6dxyITYSgkJIH4xU7rPOFq1eo0V5DC70HfIUMRED8a+udsiesoKXXonp2EkWkAnn2OaG+T7CBM8UcgtVrFp4Nczyp0fw058l/PuqL398FAHRjHdR7ts91tJmnukOvp4QxTjg6dJDryfXQbkHC7aUIHYUtR/awC5TjxRDmaBXkZDLWV4wZVEUF5Dy5G4FY6goW5LzHoee+t1OfmH6Bljg6xt/JTAfxu2Ei+60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnNuLDAcxoxCuY45VRsNkEzFDC58PrCubiIuuCKwmTQ=;
 b=LXZDgSG1C6GTzJxARGtIFz+u8cwSKL46LyY4sOh3xD0MQ9PBAiFJNgNLDR49zckzbCqHTf3pWRf1h9lrhTMZD/smjcgVe3h0fREGCP0XDw8MSbZyvs21Num0NXXxTZMjpPA5JhyH+rvoHOUn8tj8CgYu7pkCqyB1C+MkwijsHXUg4hz1axqztRPjyc1HsSzyT8NwUwnol0MyzBW93TgiFi5F5dCLEkBTmu+woEgLdS8ZUghUcdzgrWOf80JkJCCa+nDw22vq2JPRAgWQL0rVu+K1/UBttkeYXw/sIAhJLNDEy5PW0ZCwWtvEIGU0jU7L/6VoU2jg8S86EbbOWJmHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.34; Wed, 4 Oct 2023 02:23:28 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 02:23:28 +0000
Date: Tue, 3 Oct 2023 19:23:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZRzMnBMYSDWdjd3Z@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-14-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-14-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9435c6-41fc-4014-b757-08dbc480e44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cLW5OiJqCGgnTv0GX5T3OzHDJeARN7lJ4JmiKHyJGk+vB57vWbuGUT5hfIiofb7K4TU6whQ/xladduhtHalDZeazKNyqnXkyy9oZTsHhNEu7Cli+n1oq7Vj4n0Ulw0LmAfm3Jbg1gemN/kNUMx4EWk1l7j0I5/SZNKbem/cSnf9qVvf/j41JKU3wDE7xl2j0Gwvjedq9UgsMrLslDO/emjh2ziEUAjTFyptGdBK2dHjO0/i/zk+4QAqw+kxTGeMG6xaAJXeYyi9tfNIwRYzP1mBnlsPkDQ6ztuC90YwuoQ4afpEDEtfTl81C7H7eckxtfrS2Frgl+qcrJLxenwZneMBuH8F6YfJxmn0fntCeHruL7tedtelQeIMD5aXoi844USPQRumsMDKij7i/8vGIOtw4Hspt+J1GL9K5iK94D3AzEteGH3K3pDBF2Q2APkpK0ptGKL9JVARxZIr60J1wQqqk7wZ3P4CtY7q5M6aUiXr4Lja/+t68wc0yLcFfUh6ggPaMnzX0QKMFEycgO7AVSJ4CZ1ZkOIK4Af/GeCVgvO3x4MgBZzrjkfX7uMj5bYEj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(83380400001)(5660300002)(2906002)(66899024)(38100700002)(6666004)(6506007)(9686003)(6512007)(82960400001)(478600001)(86362001)(6486002)(33716001)(26005)(8676002)(6862004)(8936002)(4326008)(66946007)(316002)(6636002)(66556008)(66476007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEdENzhJMHJNTlhkRHFwZnkzbERMbFpwRnJoblM1OXpDMFVYZlYrSUEzTEls?=
 =?utf-8?B?eEFISHpwYzVub0hVb082c05yVG41Y2V1bmZKTnpuRTZKVmVDWWhCamhoSWZv?=
 =?utf-8?B?VHNMcU4rS29oYnNyUGNJQkVTMEgyend2T215WnN4UzZnSFN3SmNBNU9EcGdh?=
 =?utf-8?B?U3M3bTd4aVAyUm56TGMwRG42MnhLWWJYN2JnV2NVL1IxbGFYdm95aVFORnJa?=
 =?utf-8?B?ZUNwR0tRYVlSSjFoRUx2a2JkWDQrQURBTHg3a2VHZjZSQmpxb3hXTno1Z0lI?=
 =?utf-8?B?cFVHR2ZPN2Vob293bWNZK09JZlpZYlNwQzVxS2x3UEo1azY2bU96TkFlMCtP?=
 =?utf-8?B?bGE3NDVUYUNWaDcrRGo1SlVKM05uVlp2ZVFCZVZuYlpYQVpCTnJVU0FYclBq?=
 =?utf-8?B?STIrc1YrVUJ1eVI3dnBKZ3FUK2x0dElnV1BBM2lWNDFOUXVYTmxHTVliVUw2?=
 =?utf-8?B?dXJVZmhxNjlwRHNieXpWczlWYmpVOWd6dExLamdoSUhKdGdwZGFva2l0eFd3?=
 =?utf-8?B?YTEveFNYK0pnWnlydXdzMnBnMUQyUnk1TW5KSFJBN1h2a3lZTWVkWmI2dFQ4?=
 =?utf-8?B?T2ZjTTJwZnNsMnpRamRsU0dNaUNHaDlBamp2QndqVjl3MjA5OG43V29taWZw?=
 =?utf-8?B?ZHJqd0tDTlFaT3dRRHBVZG9GWnkxQ05jQ1RuRUV4TGM4Uklkc0R5N3JadTVt?=
 =?utf-8?B?bFRRMkcwOFl1SDBNWFZLT2JSYXIxUGxObnFWbmNlS2JkZTFlQTFLTGsrWE5C?=
 =?utf-8?B?NnhqOTdaUmpVZElzM1ZIQ2FwTVF3ZnJyemY2R200bTcwVnVTNXpCZWpJNTRI?=
 =?utf-8?B?OTRXV2RIWmRUWHhSU2c5eHV2VXFFQTVDMmxGZEJ4V3hMc2tCMHk0T2M3VVk1?=
 =?utf-8?B?bndQNGNLVVlTNTFtTXdzcldpTEwrVXAzMFFXMFNYSUZVczJXc1NmSVVhd01j?=
 =?utf-8?B?dFZGdE1zYmZONFd3VlUzZlNDWWVidHZnR29WTTBXVGJuYkpsUUljYWN6ODI1?=
 =?utf-8?B?STJRTG1UYjZxQ3BnRm56bGhLeEdEcGRyL240dkY0YjZLVFU4M3ErNXZUWlpi?=
 =?utf-8?B?UVJVbHdveEVqaFZhZXJ4YlZxZTc1STQ0UkxBTGxzUjFvMlBicUdVSUIvK0ZY?=
 =?utf-8?B?dWhCemJ0YzB1dXZydFV0UzI2TUJMd2gzMU8zWXhEOTBWZ25JWEcwVEJ0UXZK?=
 =?utf-8?B?RSt5b21uaGJhNW9EUXcyOUdQdmdBYk1IVElvQjZZaU9zZk1qRzQvVlJEeXdp?=
 =?utf-8?B?YWx5RW9tQjlValUyM2NsV2F0ei84OS9sZGRQbzhTYmNKUGsrVU11TTh1dmE0?=
 =?utf-8?B?T3Z0M0dwdjZlS0QrRjJPMVNKcmx4b3FzY3YxUUpBQlU4VWFVSGt1Um5BTlNR?=
 =?utf-8?B?TE00TVkyQUNIVHZjOVlGekRlUnJBUHV6WnluZ2d2WWdORmlnKzY3S2lJLy9G?=
 =?utf-8?B?RzQ2NXcrWkxPckVtMnJWM1dXT3VaS2oyWWJqK2xJUHo3K1hZYWRFY0lQSlcy?=
 =?utf-8?B?NkdTMDNoUDNCL2ZtQXppVE81RGJlUmJrNjYwRVlUTmovQjV3V0MzYytDRG5U?=
 =?utf-8?B?VUpMc1FXS2tTRzBCdzdrL1liNENvVTYzYm40NEYyanVHZlVLVFdEVmlRQkE0?=
 =?utf-8?B?R3E3SVUxK28vKzBIRUp6SXRKbExPWDBTU3FTeUN6MjAxcjk3YUxGblJRS1FM?=
 =?utf-8?B?c0FiOGZKYy9UcXZaVTAzTFlkTDVGU1pqWGlwS1VubHIvVGtoNkdZeHZiZ3Bq?=
 =?utf-8?B?VmZhWmNIbzI4djlJbGdQV21ZcmRPNlNPQ09OaWIxYmx0elZRc1Y1d3RsekVL?=
 =?utf-8?B?QmVDSGlIVVB6azk2czFvQU1NU2J0ZTN4YWRHNU5QVkxWRXkrRnhQb3czdHEx?=
 =?utf-8?B?UnZLcG5TVmVkdlE1ZGc1S25DSmFLZS92NW42eUN1VWYvUTgyTDVQUVdGY0Jh?=
 =?utf-8?B?blhBdkd3c1dsOEZGRjI4MEhFNkR0dEtVSVh2UFU1Q09NZGNaTHFscERDN2w0?=
 =?utf-8?B?enk0QjVINVJlWDVXRVh2a1NSclUxZ1ZHcUdDeEZscElzL3NDckIwWGl1dXdV?=
 =?utf-8?B?aTd5UVEvb0p2NHh1ek1WN05RdzBOay9oRFBNWDR6R210aWxVMjhaTGFPOGdK?=
 =?utf-8?B?VDdPeGhvRGhudktIY1NmdU9wTTZ3d3B1QVJDY1BHTVI4a1M3MnhOSGpXZFNF?=
 =?utf-8?Q?Ri5ENVdpdh7BTz3nE3b7sP4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9435c6-41fc-4014-b757-08dbc480e44f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 02:23:27.4604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbjOH8fJreL8evcWfo61hrAzBLuh8HaEH6T4h69dPL8xMFre9lRGVtNVUOLhwDybZaQzpvEQ9XDmahk7o+RPjAsncUDScfWVDnda/ffLO0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/21] drm/xe/uapi: Multiplex PERF ops
 through a single PERF ioctl
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

On Tue, Sep 19, 2023 at 09:10:41AM -0700, Ashutosh Dixit wrote:
>Since we are already mulitplexing multiple perf counter stream types
>through the PERF layer, it seems odd to retain separate ioctls for perf
>op's (add/remove config). In fact it seems logical to also multiplex these
>ops through a single PERF ioctl. This also affords greater flexibility to
>add stream specific ops if needed for different perf stream types.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c |  5 +----
> drivers/gpu/drm/xe/xe_perf.c   | 32 ++++++++------------------------
> drivers/gpu/drm/xe/xe_perf.h   |  4 +---
> include/uapi/drm/xe_drm.h      | 16 ++++++++++------
> 4 files changed, 20 insertions(+), 37 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 770b9fe6e65df..24018a0801788 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -115,10 +115,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>
>-	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
>-	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
>-	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
>-
>+	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
> };
>
> static const struct file_operations xe_driver_fops = {
>diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>index 0f747af59f245..f8d7eae8fffe0 100644
>--- a/drivers/gpu/drm/xe/xe_perf.c
>+++ b/drivers/gpu/drm/xe/xe_perf.c
>@@ -6,37 +6,21 @@
> #include "xe_oa.h"
> #include "xe_perf.h"
>
>-int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>+int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg, struct drm_file *file)
> {
>-	struct drm_xe_perf_param *arg = data;
>-
>-	if (arg->extensions)
>-		return -EINVAL;
>-
>-	switch (arg->perf_type) {
>-	case XE_PERF_TYPE_OA:
>+	switch (arg->perf_op) {
>+	case XE_PERF_STREAM_OPEN:
> 		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);

It's a nice idea to reduce the ioctls, but if your struct 
drm_xe_perf_param *arg is overloaded based on the PERF_OP passed, then I 
would recommend validating that the right arg is passed for the 
corresponding OP. Ideally I wouldn't go that route since that would 
require some sort of signature in the arg which would identify it as the 
correct param. Instead I would be okay with retaining separate ioctls 
for the 3 operations.

Umesh
