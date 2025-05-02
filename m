Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F8FC3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 22:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E2B10E969;
	Fri,  2 May 2025 22:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFD6O6Z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C112910E969
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 22:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746223264; x=1777759264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fJIgMjMrj4BqCKUWxqWTKeD8/4wHl29TwFmJmGGgh3o=;
 b=EFD6O6Z+hhnYmKnOJXuYkJShuqmaIbQRZ0hvVMzAjf5hdxB3ayuDRAcY
 x6326gM8DnCaRxOwYjTF9SOgQiTyaPkHOOZxWuggyDeA8eoEiKsP39i2w
 zclvVnAOb0vZxL7OHrVkxmj+vilfuVLtizWyYxeSMFMqIGtjEvzuhuB2v
 KAzxPgvciiZ23qVf4ER2eMLx/cM6KjAY0wsxwWPiecqDF0jyO/9yH95KS
 gekIXFIRIa90ymHMNv10SNyaI0kEtmrb8BX+SoeeFXCJZyMhxBqZFR/KZ
 ki11f/jAtCGFGmsawKVZ34n3Gq77bJWLIo2JRsQ32ULF9SOg32/iKGJLc A==;
X-CSE-ConnectionGUID: SiJFtIc+QIWc67AFhntg1Q==
X-CSE-MsgGUID: CA9X/x2jQaOPFndZlSR50g==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="35530834"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="35530834"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 15:01:02 -0700
X-CSE-ConnectionGUID: 1BJfgpCcSe2Y3h9GHgjOFw==
X-CSE-MsgGUID: spsynUURTEOfqoU/FBX6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="157966888"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 15:01:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 15:01:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 15:01:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 15:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqhXz7syQ+fSCXseOLEhHEcDni5lqc6+ldvfrGKB2BcTs3zATw/gk3UStZYkU66ZIvfqJ5A7ZH/lgbz7WHx/4/+obosAwAAcbYq9KBdKX1xR3yYKSEiJuOoQ0xpIN+2+v+sJ+IGamhozGz7GfvsUV8ydHxBLZR9BgvvTUZp384tErguibsO2ewa2MLP5ttjgB/fsTDbmQahqDoocNK9wob/4TEdqhZPNJL5fPJsiPKLuwlXKUbM4FqLmFMYQYs4aiZDJUYz7v6A+i95Lsdq6IlSC9ktbAgdlGzRKaVDjynijxBtwXVKOyd7H5BegcyLkxriwa2y2Fw9zGJwoJQir6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUs8+Zv45Syiafcr3yD0acydIO8ah8nFgvs71H/RtLU=;
 b=VAiZYdehOercGgP/UBiZxAIXm2g5avckHVJmUTcEJ4PcCT4/ESUqmp45i58ql6GyBcgmFXgYxJnXs8Voijlj2QJTsZEnn+mj2Nal5UGFBZiFH94DhLseO+AS6AYyoKgZdReWYnOjrTGSHgJvU9J1sVseU92NafNHdZvy0Oyfiz9eg/whOxt/VFOoFnDCdCxCBfSy1gPTsHF24gj6Jm+yNIeQheo8k3VuZLpJC7NSbme4iccbg/jTufZenECGVqRdyiIfBEv0cCEDZ+bCDVUY0X7NxA+Rn/CKVmZs9U8LemcWJoDmnpAxu89daA4sD5ux+RnWh277x3S/LnFJcMkzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 22:00:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Fri, 2 May 2025
 22:00:58 +0000
Date: Fri, 2 May 2025 17:00:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
Message-ID: <4keegjzampto67kcdasnztjnv4pdli2zwfztey5mo26akzvw6v@tnxf5z6keokk>
References: <20250502183739.3308069-1-raag.jadav@intel.com>
 <20250502183739.3308069-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250502183739.3308069-2-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 4769cdf2-8065-4bef-df47-08dd89c4d19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2hFFkDJ81y9WH9H6QHu4Lhcxrp2PxIJbLQPM1CCQvOxhKQLRkSF4wdAu+dYS?=
 =?us-ascii?Q?cwmEDK0JHJp0J9A8syEaxNrC/zWPrR8J364BFNg+c7kdoGThZ7qmxtR78Gps?=
 =?us-ascii?Q?ZldYJ5Ms3QwezzThwerTBDFZNo/EE/T9t61HW4rW0mdpg9rilluQ3KzC8UKG?=
 =?us-ascii?Q?CY3ylUaV06vjxBYSZQyZqcL1D8NrINzheFmtFPHlZ40h/Nbk/rGn/cbrNrf8?=
 =?us-ascii?Q?oKREEmR9pCAw+lT4/m9qYpwNzw5ayUxLE1PntIAB6LF0/RAVmIo1KPiQV8jf?=
 =?us-ascii?Q?GwicFkYlqBw6F6eMOHo2OoaVDfU5OHGh21mseYh/Ax1C1zPNjUQwwWFVaFtH?=
 =?us-ascii?Q?4X7O9cDS5nxE+asBY2fLrcVjr/g84miIOa3Ftx4Cw1Ztlea44Bwi+JvLNuHI?=
 =?us-ascii?Q?yg4pC0Jo4lPEcpxuoO1P8pavLy2J+/bvJaCAabtPJ3Mqe543OMBFnxsvowWX?=
 =?us-ascii?Q?AQZuuf0z0QA2j6hhxEJwGnNRYRKHq5Ug5Nl9TbVynXuvfNI6n0/nDiQRUf2m?=
 =?us-ascii?Q?O9LkS/ueyPBCFfqUrmqytLT2AiiBVMitt0IzFE93Ay9l3llL2aEbIG3WTzL9?=
 =?us-ascii?Q?D6sGtDhIohvZ9zgkqHke3VRBwhEW+kO/6oT+qiMfb1ekKxd59KZhaySMLVBU?=
 =?us-ascii?Q?/djLivONOOjfGo3ZtNSryzkrOMwHpJH2PyS1Rcs0BdMrr0I2ImBXkMOMAXHT?=
 =?us-ascii?Q?djSdjc+oqaTszrLKwNfB0jKDvIgdcZAG5D4B7CMFVaZ5fa+eoBAx9h73lWof?=
 =?us-ascii?Q?hplSoWbEGCfJqmqT2QJLIHvYjr8Y2nsjaDhCc5N2lcDYt3/ZISDEB2WIHkNK?=
 =?us-ascii?Q?RjMV7l0aS9cKM5eIObJz1VDnUulQmkgUquR+O1BdYd9WyWmB3v3brI0BoNak?=
 =?us-ascii?Q?rxUOmZJwDMSAF50qj4YiT5cLfwTKh8HNLrM4UJpuRy8cOQBTFiCKK0S3KrIa?=
 =?us-ascii?Q?U2M5pfU+duP7FCeMGiSHk6XBO+WVqw4yQq+7qgBDWZhfwG+EYE0WqpmGNNsP?=
 =?us-ascii?Q?HTV0En3n0l1F1bMuasw6bElAf76md6BqXhVD3KNmgvJNmuMWDJvc6Mbc4Kjc?=
 =?us-ascii?Q?a+IHaQ/qxwVVO4BCjapanF5lHYb3tY+Xbz8bwp/iwUaI5f/VXPb1p6MayeAr?=
 =?us-ascii?Q?phNJn8x8tQKbruoJ4+ojepZfRYB400Me15p2tCB971wiq8IJ7//UatN7qTiU?=
 =?us-ascii?Q?wjmTslfEzxb+BJlNgdygZ41csV81z/acKeC9FMjnFVTfUqvHolGrsHSP5f6J?=
 =?us-ascii?Q?Jrmx9l6QCS6cs9Oa5s+DSDcoYea5HHKLS/JbDLDcsti3tR0nVApOh4hNHiN1?=
 =?us-ascii?Q?Cy+x2vObytDF0MPFVr0SY+KuCPTI/+6cg7gdEwlpgoW4nqRXS1/hVNCqxhFI?=
 =?us-ascii?Q?KC7tHMxgmRvM2Mt2EvYVGXr/X3rLrSWiyr0Hh6nXbT5658jgcE66CFgHGTWp?=
 =?us-ascii?Q?f/Tekew9Hgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sWPGrFvEBMSTe+bftgKgh4bIo2vVBebmYrrVhckX+Gvbd/ge8ow8hY2quzJj?=
 =?us-ascii?Q?wCmQho9czc86qeFTtDIicOLNijVeeSLtucZSMGceW21s/WMoD7gsfAX3XwFc?=
 =?us-ascii?Q?pOPW940Fl/XVAvWYYkEqVWmPNsjgbCki1aYk4+vw5S695i7ahwzEb7Dg43du?=
 =?us-ascii?Q?Xs9+STbdbBQxoWslB4fSia0gsZfdYqNIF2tLIrIpgd/VGGHsXz6P3gbxwG1a?=
 =?us-ascii?Q?1YVEli/9sz0pZZD5Ellkm9CYPqGCxvbNQD0E4Bt1xFb05+vO5PqsY/P35WmB?=
 =?us-ascii?Q?jvQwuBHdJAXA6VXjbWCK45usl0jmWWThwR+Q59xKhz6hxE/27fKOEFdA4XT2?=
 =?us-ascii?Q?fckCW794cKFLV84uhiARjH67jCwKhUaqTLqVpAYh78RWdvgcCfVFJjMgw2pH?=
 =?us-ascii?Q?rxqX9Cl32aTtvQZSX8v51q8Wh71A2Pzz8WRdCFN1/i32uK9zYi6IRlGOKuB8?=
 =?us-ascii?Q?6J19ckXWn3LtFFLKJChdeh35cKf/Bn+EFH7jaio34aFfcHidMwzvl7aBFHQZ?=
 =?us-ascii?Q?nJypxuUh4LOkKGgisVwJNRsMrweHlO8/Xs8/+og6WVXvMwqJzl8SMJYGg+VR?=
 =?us-ascii?Q?+0i8ZUXUZxsRU0YuZux0yUJ17zirjCUCvnkdjETueWURPDIBn8cofGVX3dIe?=
 =?us-ascii?Q?N4tg/66kYDh8X+vbQd1DDRv5RQzad8kyOaUEklQxjV+DBbA2FM9gV2bVYGMG?=
 =?us-ascii?Q?dBZQKQk8or9PwN1AwqBwZT1SMp9OZbfxqf2GkjjSuxw3E+UKlzC5kLn3suRe?=
 =?us-ascii?Q?5Gk1zTms4BIpOy4Q4SqRyCuFnKmjDdAfyZQPwJFF4jyGH5LZRVuAObKDBe1O?=
 =?us-ascii?Q?pTrapfvHSab5PK0MLdGAyHoV4hrSvo7SU+TkMQvCVAKTL5BAdUo/3j+BAXKs?=
 =?us-ascii?Q?6xu2PseAWtzlD8xMLnCsVLRldO7CNNdqWKsPOZFinHX429i7zRtg4H7exD2v?=
 =?us-ascii?Q?Dlbb6LGHCptQia7SYgewNUwRWrtNpgzXFdFsidVcl90suzmo5BnM+vSfiFP3?=
 =?us-ascii?Q?9LP1SlDQ6a4v8QF3lcvRMlvkp1VQDtZ1tQ//VJzhhtifvAgPwctpDV0jquDR?=
 =?us-ascii?Q?cwxKCF0tYPeuq2Cjgn5jQS6/2RUAOVdX7tiIXn4t35x9QIKnNNymQsQa93/N?=
 =?us-ascii?Q?UlpYWnZlW6uH+ds4ctWswpfIw+ewOw7Seg8D4FeEirdR97TvMbFR6rP6b5zS?=
 =?us-ascii?Q?DMmA8oplZA6wLvXx08bKt3iIYW7TCpeKu7L1JOgeoSJdFYs4TANxUMOODpU/?=
 =?us-ascii?Q?gqGnxYm4ZLCm4OFK0sz6czaJAMvng2/P8lmMDip/U3pCdGc/caqZEpzwCM8C?=
 =?us-ascii?Q?FOPW1s94FN9HalaAIJGOcHIebAuvPQWRTIhZuzHgayWGsDdduM/lUR16hVtf?=
 =?us-ascii?Q?S5jthAAi2POuytwcb8wvR9Y2oHnKQD8wzpuzJvcpav7fSpNX+ZYlKfL+qGiQ?=
 =?us-ascii?Q?kRnFetp/sov0azNp9d0+Cq+CfLkParFhKQL5cT1spdewoGgEL1LeIDt2j3eH?=
 =?us-ascii?Q?7U/7RsHucvv9vM0uca8qqeRC6Df+cEuMDEAuLjhtvD+/h3AivAWEGxjcu8zN?=
 =?us-ascii?Q?JO8GntgMfnnivRU39uBr8xDTZ2BEyr23zhW2TBYv+GClcTbinvv+YguKLt68?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4769cdf2-8065-4bef-df47-08dd89c4d19f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 22:00:58.2812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAGF1MPyxSMUYQpJGbTYuwqADllKOiWWGW3Wa3jBaNAUVFuaMxaoEiLXKwbeaeZHnqQ58T/fUKl+FB5rCJldoz7F1o9QTBnBX59gHBRyCKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
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

On Sat, May 03, 2025 at 12:07:37AM +0530, Raag Jadav wrote:
>Attributes being exposed in xe_pm_init() are PM specific and should
>follow its naming.
>
>Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_sysfs.c | 6 +++---
> drivers/gpu/drm/xe/xe_device_sysfs.h | 2 +-
> drivers/gpu/drm/xe/xe_pm.c           | 2 +-
> 3 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>index 7efbd4c52791..2d25e5b5d4bf 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>@@ -63,14 +63,14 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>
> static DEVICE_ATTR_RW(vram_d3cold_threshold);
>
>-static void xe_device_sysfs_fini(void *arg)
>+static void xe_pm_sysfs_fini(void *arg)
> {
> 	struct xe_device *xe = arg;
>
> 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> }
>
>-int xe_device_sysfs_init(struct xe_device *xe)
>+int xe_pm_sysfs_init(struct xe_device *xe)
> {
> 	struct device *dev = xe->drm.dev;
> 	int ret;
>@@ -79,5 +79,5 @@ int xe_device_sysfs_init(struct xe_device *xe)
> 	if (ret)
> 		return ret;
>
>-	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>+	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
> }
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
>index f9e83d8bd2c7..2c1fabdba9e4 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
>@@ -8,6 +8,6 @@
>
> struct xe_device;
>
>-int xe_device_sysfs_init(struct xe_device *xe);
>+int xe_pm_sysfs_init(struct xe_device *xe);

you can do it on top, but I don't see it in this series. If you are
naming this xe_pm_* since it's pm specific, then please make sure
it is in xe_pm.c

Lucas De Marchi

>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 38514cef817e..183813e43b29 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -347,7 +347,7 @@ int xe_pm_init(struct xe_device *xe)
> 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>
> 	if (xe->d3cold.capable) {
>-		err = xe_device_sysfs_init(xe);
>+		err = xe_pm_sysfs_init(xe);
> 		if (err)
> 			goto err_unregister;
>
>-- 
>2.34.1
>
