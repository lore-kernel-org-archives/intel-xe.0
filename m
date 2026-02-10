Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1265BEB2711
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 21:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C1910E070;
	Tue, 10 Feb 2026 21:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DV0WfLOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2889610E070
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 21:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770757532; x=1802293532;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QhytOAPTuO/fZSj0/ZWD6IjXk8o3gVTwcrirmdtMunk=;
 b=DV0WfLODLJKmMo9JB+IK3lH2n8df399WFxG22tgmef2Fc0M/AaJwf98/
 QKfuHvoeTtOTGKsfm+j+D3X74+D9ND3cn9rPdMxu76Msccvd14Wk6VH//
 JUvGpU064JfkzVrYcWo8nO6IJZlWmUTDzaqj07Mx2OL0iu0p7esOIQtba
 /+tHHru6D0Z8DWgCMoHvyL8n8QddeMClsvCXqq8IxbFO/mISnudZV1UhG
 PsYtMmkYeHWclu1mJ9dTE9I4G4grkSSCNTAS3mWyfXrO0rfTNEBuk/PmR
 mNfEy9EFePteFcQzBr0QuO4GavRqR2bsLnekYgT8XQUlTvy6C9HghCGdg A==;
X-CSE-ConnectionGUID: akAHY6bkQtaW/WqMuZZQWg==
X-CSE-MsgGUID: Upu2YMBeRRCLYUdoKiwOeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71107500"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71107500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:05:32 -0800
X-CSE-ConnectionGUID: eTMNq4uNQ9aAT8Vy3aVx4Q==
X-CSE-MsgGUID: l1gwhjgvQP2eIA743Er3lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211865538"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:05:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 13:05:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 13:05:31 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 13:05:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vs1crU6TvCX6YGuh0qQiYB5ZgySCb8tudt0vdQOrWt9lAyCQQc1zgalE7vIjYdbWhpg+vNZ2g4F6zImZcc5hzKzdIyOdJ83G5+07fgoUcgtFt0IXejajXkTD/WnqVaLqWjwcWmkrP91SYoGOPlplaGYpv1r8NjgM8jvuWVELkroVhgWyX+veQIAIv5eHvI4RO/8e7mUEZXCehD583ql87CWP/IK2rA+Vu5hQXCoVO48qmIeoc9OUrcAi/ufJ0rx3E5+htMjlOr2pqByUiD3mAJNonZmvEoJF46/Z+kmaNMvu/SINs2QYBWBGw+J9fCpKeynDci0PNw5QJbnVmZd/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI//HnuW3SGJGofkmta5KnZKic+USys6pQx6kB+KKz8=;
 b=YLKTKQmIILQ5qbXHu9OVndrW8ygT3hRDr9RRVt8W85OXWL/ex3EkvuZlfwRTOby/F4u3Y6k5o/vJbM7OxUV6UJ/kqEyKLwVi54aM7GfkECOJYvJfjjtLftAYOi56CY7HZhGbOFQG11wYFFYcPjqQhYE+q8WUoqz6RhQLNt0MbVxftTxeumUSfg4fcloAgRZ078cFef4NScNvAr2lPtpZqYIDQSgzSxliucRLn+NlEiursyoKD7t7YAzQmeeNX9rLzp2/WggUOG6jObXqX27Vte/32FxmnxEYSZuiNHaDc3xecU/uQW2DA1pcsOsnXkXcXpw+30etK6wBZDadybF+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8497.namprd11.prod.outlook.com (2603:10b6:a03:57b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:05:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 21:05:28 +0000
Date: Tue, 10 Feb 2026 13:05:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
Message-ID: <20260210210525.GC4694@mdroper-desk1.amr.corp.intel.com>
References: <20260210125120.1329411-5-tejas.upadhyay@intel.com>
 <20260210125120.1329411-6-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260210125120.1329411-6-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a040ccf-e91f-449c-c70c-08de68e81df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUYycUxBeGNlOVRmWFhDdXlSb2JiVVhMU3Q1cEtJUENDNFIxSE9xZTVCWnRh?=
 =?utf-8?B?RU5NaHhCcmZRdm5mUTRNamRzb085MkVTdzkzckZ2VzR4NHZLYjkxV3JGSHc4?=
 =?utf-8?B?cjBnN0tXQk96NWFnY0xFZnZwUDhVRUJaR2xyYloyMWdhYVNuNUhXK2VmMU5u?=
 =?utf-8?B?dTd6ZHZtMklXRjJkZDdlNFhZOEFiZkwxdWMyd2dUSytEUGE1QmNySXpERFkw?=
 =?utf-8?B?TERqUDNVNEp4V2tTYlM1WlpoeWFvbmZXRUMvQnlqam1WWkthc3ZYcjgwNzZv?=
 =?utf-8?B?Ty8zOVlXSmZrcDNoTnZyYzZncnk3a1FGQmZPa0Q5d3NmSnU5SGEvcENrSVpP?=
 =?utf-8?B?bVpXcnJMTFNTbUN2ZlhzYWtESzVueitXNnpHT25QdEtJY3lDRFdULzJLRmQz?=
 =?utf-8?B?Q2pucXZFRGZZNVNjekFuWEZQWTUrYjQ2S3ZETVhFVER6M2RnS1d4ZEg0dnhv?=
 =?utf-8?B?bUVTRkhFbkMzNXI2eDVjRGFTNm02UjB5ZGtBTFJwZ2RLRDBjRXRiclM3OE53?=
 =?utf-8?B?WnJnSUxmNDE1NzY1YlV6RkpEbmJ0cEZCMitUNi9HdnRHVk1jcGlBeiszWUNR?=
 =?utf-8?B?S0VDMTFuTExEU2J6SjFoQWV3UURsMTNqc2d5UUZFQWhXbkRLbE15Zndoa0h3?=
 =?utf-8?B?bEF2UWNobVpoSFgvdTViaXhIdFBtS0kwL1dGNnVBTDNoU1d5VEY0UzJMVTlJ?=
 =?utf-8?B?QzRpeG1KOUZxZWIwbk04SWVhTGIwdzlwR3pEZkVMWlhjcjkycWttYWxjWVNa?=
 =?utf-8?B?L1Rqdzl0bERsMWo0K0dXT2s4VUtEUDVybGMzZG9YOTRMeG5XcEdDYk45ZW1Y?=
 =?utf-8?B?ejVRdGduUCtnMXloV0o3dEdoczNNd3JlMUNvY0tydnRDR3JsZ0NzK2ViRFJ6?=
 =?utf-8?B?eHJldlpIN1phSFZpNEsvTFprc1JMWW1Hd2hwK0MyU25FR1JBOHNZOXg2UzFI?=
 =?utf-8?B?bmJRdUdIeXpCOU45U3lKQzJka0FNb01veUNaMXRENU1GTFU1cXkreGRGSkor?=
 =?utf-8?B?VU5tWklXM05JNmhnMG5CYVpQS3BjZjFHSTlERFVta2VXSTJNNG44QzdHUjhK?=
 =?utf-8?B?T3MvV0J6cVQ3RVFURDJ1TlZJaGFXbWFRampxMmpKSm5wOWpqUTFWbFVkWnp3?=
 =?utf-8?B?T09MOGFRVEhidDVSamprUmtkT1RtTUI3K3g2Vk1QdUExSno3SXVQZFZ3Z2Ju?=
 =?utf-8?B?aUNCV0FZdDRoTXB6Rk56WUFnbXBldk9IanljdndMK1NkUTFvREtFVC96VzVK?=
 =?utf-8?B?c3BnU0pQUmxvUHJIOUNRL3I4TXJBT0lyMHNJY29rWVFia3ZnQXV6M1UxajVP?=
 =?utf-8?B?b0tYRnRFQis2R0xWcDg1aXFPayt2ZDdMVDA0R08rUG85T1daZjNQZTJ1bjE3?=
 =?utf-8?B?VzI2WG9CUk96dDdQaTNLNGpndEVMVEhCMmk0MGRRdjNQOUxJV3NTcFpiZGpv?=
 =?utf-8?B?T3g5SzIySUd1UG01bm91UW1ibitDY0s3VjAzek5oK0kyZHNtVEs5K0x3OUJj?=
 =?utf-8?B?aDA0ZkJyVzZyNGI5NTZJbm9hbkVhd2xYVi95dU05Zm4wYnFxdnNKYSt0N0pp?=
 =?utf-8?B?WTNGKzArRTV0aHlRT01MajF3ZDI1SGZNb081eDRmRVkydlBBVWZWemU3NGpC?=
 =?utf-8?B?b3VnWkNSd0FWekUvN1hHUWErZ2dmd1lwd2lmNitIYStlUW1JeUllQ0cxWVB3?=
 =?utf-8?B?L1ZvVFlIZVoyUW5jajROT3VGdkh4NWpjdXdWVXByUzE2ZVJ0SkFHMTBKMnhI?=
 =?utf-8?B?VmVKNVpWVE40YzA4K0REK1dsaldqMCtCZTZEZklSV05pZ09QSEFkdHBjd050?=
 =?utf-8?B?aDdlNWtwUjdud1hFeDdteVN4enowQlBQQWZ0YUpHdjJLaWx6eVU0Mit4WjdY?=
 =?utf-8?B?aGttU1IyTHVGV2pFMXo2WWZSOFd1RDJhdUNBVE5yS29qdkR4MXRQU1pLWW9Y?=
 =?utf-8?B?aTR6Mm92Nlk3dER5K00yaW1HTzN2VFdMYnJaU2xUSkdxNUNkNmRDZ0E3OS9H?=
 =?utf-8?B?VFVkbGdHVjk3Q0xxSkRadWEybXo2RzNkSGRTNnpScnAvRUZ5SkM2L3E3bXJu?=
 =?utf-8?B?NTRwUklCS0pkRWFVN0JvUG1pWk5WeXVtcHY2aVUyQ2wyQmROeThyVmFyRFg3?=
 =?utf-8?Q?jjEU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1E3dldnNzZ0S1Y2TmRuSmVnQU1URS8vdDBQWW1NeCtTMmtyQ3ZvNnNKZito?=
 =?utf-8?B?MVZiSjBGZWdlQ3FmanN6Mk1oZWUrUlZESitoME9PTDRFOEVSbGwrenBBcUUr?=
 =?utf-8?B?S3VSTGRlbktkVG9RcVl0Vmp1U1VXWUpjaDBkaXJBVGhEc2orRVFxMVZxd2xw?=
 =?utf-8?B?OTRvbzhTb2wxWi9wRlNYTVRtWjhZVkQzVjdXbkh1UEs3bzV3WWpLcTA1WG1W?=
 =?utf-8?B?a3ZtUGp5MDNrUWRkMEd1cnlEZzV4amtYMGdnMWdmNks2Wno5SmxZYkp4eDlV?=
 =?utf-8?B?T0xiQnJiMngyNTlEaGhFUDlYemt2Mko0cko2dUd2cjRhVXVxcmd6T0ZwT2dY?=
 =?utf-8?B?M245RnN5a0kvYU5BamNnNXplNmdiTTZUUmtmajVnbjVFeHZmc1NZR2c4SXdB?=
 =?utf-8?B?cHFhMmJ5T3FKWnUvN2UrUHhIOVRYanAxK2RPMlpzWHpDNFJnNGpodlpJaElV?=
 =?utf-8?B?VlV3ek5GaWJXNWlab0hmRk9hd1luNTlrcWpwVTRGUHVHT2tybEQyQ2NSSWtF?=
 =?utf-8?B?YXlFK2hPbEsrTlM0cEdFNFphOEhQQTV5eUIzVDhDQlBucG5IYkQyaWV4YUFh?=
 =?utf-8?B?WGRhVTkyOW52cHFzU1J0TXk5cngwRFYvbW5PRWtOUnh4SFk3NVd4Qmp0UnRu?=
 =?utf-8?B?S0FUSUhOdXRRYVMyUlBpWjJhRmxYZm5oRjZkZVBHcFd6WGtoYXVPTC9HWFpS?=
 =?utf-8?B?NUwrSm52V3ZXUlR6SHhOM0ZaMXQ5Q3AveXQ1Q1hCQnp5UTQ2WHhzd09lS3lv?=
 =?utf-8?B?VUlEQnRVSjF5NTRkVDVJaGxEZHgrWmZEblY3UWdBM0kxU2xFcTcvMFA0WGdC?=
 =?utf-8?B?Y3gxdmE1b0ZjTjVlbEs4eTQ4TVV3M3NwVTkzT3dLcDFjMkJ3Si9UU01nRWd5?=
 =?utf-8?B?ZDZOdHBhOXh6enBjYXRJb3JNSGJsblFJNzRrbzhocnQ2eWRTRmpvRXlFZ0Na?=
 =?utf-8?B?ZXlSOUk0YkhaUjgwUWR6bEVtTEhsR3FoSDlBU1NCRmFuYkdXenpGZk9XM1lB?=
 =?utf-8?B?aTduNlNQQ29zblFNSHN6RzR3K2lLUXFDNDY4N3lsbHlaODRCRmozNEpjb0ZV?=
 =?utf-8?B?ck9xcFNGYitmVVVUYXBMRG1KbmF2RVh3blpkUTI4SXBXNm9yUEdXTXdDUVM4?=
 =?utf-8?B?THhsYWdsSG5QeVVoTjlQa2k5QnlJcUhTZnd2ZXM1dkdkTlh3ZnJ0SzVSTXFr?=
 =?utf-8?B?NUpFbTZhNy9DTGdPNUZRVDRGT1NWZ3U0RGFESU9ucnVyZStlWVJyTGV6YlIz?=
 =?utf-8?B?bDJWd0lVT1QwaW1iS0c5KzZYY1BZVVA3TGpZclhucDNsWFVUWjdOS0RwMmc2?=
 =?utf-8?B?VTFwQVdmTlhRM3N2bkJmblpWWEhjYUx0Q0dLSndqT2M4azZZSDVVU2EvSUtZ?=
 =?utf-8?B?dmlmM2thVno4cklIYzc0b0RrK1c1TkNCMUlYUStVVlhnOFl5NHM4YWhYNTlG?=
 =?utf-8?B?Vzlrbmh4OXh1TUhQcmhQVjAwbldwa3kwZTVnWU5kaUdjQnFsRUNIaGp5Vmtl?=
 =?utf-8?B?bjZYQ1IrSjQ3dW5ZSkJOWkhGWFRvc0hnMElPQ2hCbDAyYmxTZ2FkTkJCSjNn?=
 =?utf-8?B?dzhmUmNYeWhlelV4L3FvM2hCVzlZOU5KbjRYMUVSRDlZYW55VFg3S0M2V3dZ?=
 =?utf-8?B?eHlhM3Y4QTcyZ1o0RVhEdGpsdlU2cWpDYnJKN09vQjhGdEVBenhQL2RJUlRL?=
 =?utf-8?B?a3oxT0hiMlVobGFERTNoZlVVRGlhUjhTU3FqRWtVSnlHbW5xMU9kNXhPUllp?=
 =?utf-8?B?bDVIVnlvTDFmTmdmVVhJKzlKaWlHTVpPMDhKZmZuV0U4VmxHWEtpQnpQUGNq?=
 =?utf-8?B?NVREMDZqaEJjdmVPb1J0Y1N2cXpkaEV6bS9XN0x2TDdLeG1Ia3Z4dnpsYStu?=
 =?utf-8?B?RW5WL3VwWTByTjVsRnI3Tjl4cFBKaFEvc2hxVjNia3J5K0hORVUvdmNRTUQy?=
 =?utf-8?B?NzNUSm9wSE10UFZBNHBFVmQwY3ZRa2d3bkZwb1A4U2ZuRFJHVFFJNkc1N1Bh?=
 =?utf-8?B?SG5WNWt3Ym41LzRUK0tjSzRzdG5MWmlsYnFybnNqdkhzTVdSZm1GdXUrN2c1?=
 =?utf-8?B?b3ArOTZSSktvUE1McmxDLy93dU41SzdScDFJV1NKMmltckdhS1NlbVlMT3dV?=
 =?utf-8?B?dVN3ZEJXZFdMdVdwcU5iSlpXNldralU4SU5RRG9pM2N4NzJPb3hkWTAzd3Vo?=
 =?utf-8?B?RkovSFFUbU91WXJWT1U1dnVEK2M1RnNtTjR3UXY3aXdyTXBxQXhHU1BCU0NU?=
 =?utf-8?B?LzA4a0kzblF3UW1LYVJUZ05GQUQyS0VWMjJTSWZBUG5ORURYbHUyN3g1TmdW?=
 =?utf-8?B?VTNsNnJsalJsVlphak1yaDYxc2JxUllBdXlHb2xaSEt6Z0tWb2Y1d2QwcU5l?=
 =?utf-8?Q?Yi/Atc5NdE/FxQoE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a040ccf-e91f-449c-c70c-08de68e81df4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:05:28.0148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B70+hcrBQG5mjJBrn7hVcoEAlkQLzAW6+UAKupxNfIAX2irvrmRtTJaeiJg7BjvICG/Xv6pjtBsDjuNqObaWcvGcg6Ro+RuZDcBFG5IrWiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8497
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

On Tue, Feb 10, 2026 at 06:21:22PM +0530, Tejas Upadhyay wrote:
> "eXtended Architecture" (XA) tagged memory—memory shared between the CPU and GPU

I'm pretty sure this expansion of "XA" is wrong; where are you seeing
this definition?  Everything in the bspec indicates that XA means "wb -
transient app" (similar to how "XD" is 'wb - transient display").  I'm
not sure why exactly they picked "X" to refer to transient in both of
these cases, but I've never seen any documentation that refers to it as
"extended."

> is treated differently from other GPU memory when the Media engine is power-gated.
> 
> XA is *always* flushed, like at the end-of-submssion (and maybe other

I assume you're referring to the fact that the driver performs flushes
at the end of submission (via PIPE_CONTROL or MI_FLUSH_DW), and that
depending on other state/optimizations in the system, those flushes may
flush the entire device cache, or may only flush the subset of cache
data that is not marked as transient.  The way you worded this was
confusing since it makes it sound like cache flushes happen
automatically somewhere in hardware/firmware.

> places), just that internally as an optimisation hw doesn't need to make
> that a full flush (which will also include XA) when Media is
> off/powergated, since it doesn't need to worry about GT caches vs Media
> coherency, and only CPU vs GPU coherency, so can make that flush a
> targeted XA flush, since stuff tagged with XA now means it's shared with
> the CPU. The main implication is that we now need to somehow flush non-XA before
> freeing system memory pages, otherwise dirty cachelines could be flushed after the free
> (like if Media suddenly turns on and does a full flush)

This description seems really confusing.  My understanding is that
marking something as wb-transient-app indicates that it might be
accessed by something other than our graphics/media IP (i.e., accessed
from the CPU, exported to another device, etc.), so transient data truly
does need to be flushed at the points in the driver where a flush
typically happens.

However when something is _not_ transient, then either:
 - it's "private" to the GPU and only our graphics/media IP will be
   accessing it
 - it's bound with a coherent PAT index so that outside observers like
   the CPU can snoop the device cache, even when the cache hasn't been
   flushed

If media is not active, then there's really no need to include
non-transient data when an device cache flush happens since there's no
real need for the data to get to RAM.  So that enables an optimization
(which comes in your next patch), that allows flushes to only operate on
the subset of the device cache tagged as "transient" if media is idle.

As you said, we eventually do want to force a flush of the non-transient
data as well once we're freeing the underlying pages.  So how do we do
that?  It's not clear to me how the changes below are accomplishing
that.  Is there a way to explicitly request a full device cache flush
(ignoring the transient vs non-transient tagging)?  Since the GuC
handles the optimization in the next patch (toggling whether flushes are
full flushes vs non-transient flushes depending on whether media is
active), I thought there might be some kind of GuC interface to request
"please do one full flush now, even if media is idle."


Matt

> 
> V2(MattA): Expand commit description
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
>  drivers/gpu/drm/xe/xe_device.c  | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h  |  1 +
>  drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
>  4 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e9180b01a4e4..4455886b211e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  
>  		if (!xe_vm_in_fault_mode(vm)) {
>  			drm_gpuvm_bo_evict(vm_bo, true);
> -			continue;
> +			if (!xe_device_needs_cache_flush(xe))
> +				continue;
>  		}
>  
>  		if (!idle) {
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 743c18e0c580..da2abed94bc0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1097,6 +1097,29 @@ static void tdf_request_sync(struct xe_device *xe)
>  	}
>  }
>  
> +/**
> + * xe_device_needs_cache_flush - Whether the cache needs to be flushed
> + * @xe: The device to check.
> + *
> + * Return: true if the device needs cache flush, false otherwise.
> + */
> +bool xe_device_needs_cache_flush(struct xe_device *xe)
> +{
> +	/* XA is *always* flushed, like at the end-of-submssion (and maybe other
> +	 * places), just that internally as an optimisation hw doesn't need to make
> +	 * that a full flush (which will also include XA) when Media is
> +	 * off/powergated, since it doesn't need to worry about GT caches vs Media
> +	 * coherency, and only CPU vs GPU coherency, so can make that flush a
> +	 * targeted XA flush, since stuff tagged with XA now means it's shared with
> +	 * the CPU. The main implication is that we now need to somehow flush non-XA before
> +	 * freeing system memory pages, otherwise dirty cachelines could be flushed after the free
> +	 * (like if Media suddenly turns on and does a full flush)
> +	 */
> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe))
> +		return true;
> +	return false;
> +}
> +
>  void xe_device_l2_flush(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 39464650533b..baf386e0e037 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -184,6 +184,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>  
> +bool xe_device_needs_cache_flush(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
>  void xe_device_l2_flush(struct xe_device *xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index e120323c43bc..b435ea7f9b66 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>  				    false, MAX_SCHEDULE_TIMEOUT);
>  	XE_WARN_ON(err <= 0);
>  
> -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +	if ((xe_vm_in_fault_mode(vm) || xe_device_needs_cache_flush(vm->xe)) &&
> +	    userptr->initial_bind) {
>  		err = xe_vm_invalidate_vma(vma);
>  		XE_WARN_ON(err);
>  	}
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
