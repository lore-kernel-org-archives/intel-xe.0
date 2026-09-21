Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D34C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 17:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877F610E2B6;
	Mon, 21 Sep 2026 17:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2VwvM9w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CDF10E3DE
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790010293; x=1821546293;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8uYo4z4GWbMKCHPpgSBmabDCYbXJunIaE9WvBIWVReg=;
 b=S2VwvM9w9e3ReQJG/sCvW8qwyWvMuz+uLA9JhBvy62BZKTH0JJZXpNeX
 bxecfnUAKT2f+NRXzIhA46Qp/o0qiGFPm2piDZ2dVrIUAlh520LmLzDPt
 HBPCtnqyN9xXiMHxR9CjX6rLOl19LDKs89SmRzvRZM1y5U9R9AKb5eAJ8
 m99mXrBVwpYondC4XqA18uoeU2HeuPI88/WBaBGBb2joJxZpI0BM3qrmD
 KgE/43tiJwbexppPHFDzmDj6FvCWoeuoVqbB2N0GTzfBZDwtCWsgS8bQ1
 OeQ/F0cLCuA2vzJPOBoO/IKzweWRj+zoxGNpvmFOCHGhrRowyr5L4O35r A==;
X-CSE-ConnectionGUID: czly6fsUTBKBu22/I4SSvw==
X-CSE-MsgGUID: m2GRtpSGTbW5nxsKjI19jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90414945"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="90414945"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 10:03:04 -0700
X-CSE-ConnectionGUID: BurkXFxGSgSMTEToRilE/w==
X-CSE-MsgGUID: 8N1TZ3axQFKI0NT2YgT+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="298973403"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 10:03:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 10:03:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 10:03:03 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 10:03:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgcBruy/O4IgSBst4hYCWa2/IBtE5X8L8WZRfQ3NEK3GT4KaejMU4lf5FR1d2i/gBe7N9uL8eXFrqXjXyoRJmCFu4TVFy4vfQ+VgGLCsXSh6hxAbHf/gM15vu67vlw8t6dxSknkseGQKAlgtcLOs7dBVZ/dp5X1LZjfAWmaTfgCer37AvHwoHtrUNtlXQ6fAQszzP4lFGqkM/O1QBuSbLC1wNYhGzOV1HDKpEtGhF78wBLBUQuyOpq6Pscw15Lt0XyY2eP19FHF06jkcIXbNk4qX/njUbiyXJGh9kyQxBPb6RUQ0lVtGWdXNyQ/mUdvSxBMKNLYmORJuuMFNPSHmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft5j9t4WAfvnyHirZNT0HO3+KLpwfpcUb/D55vuaqgc=;
 b=fwaP9deb5/9hD+IVlKo+0Ry5eM2xVXPPmUCXGB7F/SdGloMH5v4yppzhHCEctnU3kg5kk7crzROh3sQzFV/KtdAcTB1bF5Mghotce/ms2kA/X/Il1ZUC20tLNSsU12pEZHfmN2kDCc7bKWpHrQYzoAQm0mCxFkwuAgeHlU8zyvVr3IV3m+l7oSvgnhbU/wv1+dMpVAxCE6TD5FSifR0cvCdN61qqiP3s0ScfHsmmWhNV/hRoi6dbSsTmxYM9BzZNTUwW7X/1/tH2MJULwmQP5njH37pxE3THiZgiKxBNnPQI6ibJLC9kjKOQ86gRV071xl8j0HJpCjE9AhR7bk0SEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CO1PR11MB4803.namprd11.prod.outlook.com
 (2603:10b6:303:95::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:02:59 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 17:02:59 +0000
Message-ID: <60cf5ca7-3c3d-4f31-a11d-0151c1c7bb58@intel.com>
Date: Mon, 21 Sep 2026 22:32:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-18-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-18-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: a73ba833-1b5f-4ed0-0097-08df1802307c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: N2OBHUW0CEb4DyMU5EbOSNTEcoA8FPe6pPqHWWvocKsMDACOJiainCHl4flyDs/omTfBOYQVZr44dFtwK0KQo6thwq0a+JdArBOZqc2GoHQf/TwVTWp9tjJeZrBN8x7+HctHREC279U/crZ1mkagyUMs7TiBackayDwsXqhNpfRkqbZ9qITGMilPydJsTTVQhNN3j63VIdhnCWrcb26Q0WW61Z5lTrmbPx2oBoBAIwBzcrHpkAiNWYH/21zvzkbnJHGELsNYoe/B1txsBV/FStkqrACXPkM5yTDZfxWQYmu4rOSeH6AouFP0aAaS4h2lmrra31+hudKuzLMq1MpJFYErXo6ifqXnTPBOzJk/H4DvzjZrm0sxr+w6DTfwhdRQt2/Uag74TZt6WJpfnLhH2j34iaO8ZVQ/oWgx+BdyqWUqN7CUYIumKMMHq0Axyd9nSfPvTmE+RNP3Or5rYkgLGz3muWgcX1X3EiNkRrb02ZtyGA0gi+usmd8IdfLIjO4i79nU93HRFWnORDBD0YJNpBMTwy43jxWMdkXRSSxW6mO1soatj7mrJW/UQhWELTzUruWxHaKYVCWuvv2VOX+1h7TCiiR1w5oBmqf/In6/gBtJUgXXGYbIJTg2U8Y+cRuS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dENydVJIOEM4c09MVXZCUlQrR2FXL2hzeGNBaHlHazNGU2Q0VldaZjkrdGZK?=
 =?utf-8?B?aUxFdkNIM29QZThPUEFKZm9QeTkrNDdkMkxJRGdSRmNPdjZHbDA2VGZWeXcx?=
 =?utf-8?B?dlExY1NNVE4raEdzMlRGcXFKaHp0RzFwVHptbk9tcWtmVkV1UXhIdlBXandZ?=
 =?utf-8?B?Y1pIMHk3S0pqOTVEZ3FIeFFwUS9taElNMVNaSnV5RXVGRElkNEwzWnM4b3ow?=
 =?utf-8?B?ZXhWRWZpWElKU2ZsMHZJbzI4NUxKcVVKWjJIeWtiN2NIV2lETFBOSXJjVWh0?=
 =?utf-8?B?YVQ2eEgxRTdjcC9RblQ3R1RMdVVSSTV3NGdodWVUeWxzSlA3YmxjcDVSZjZD?=
 =?utf-8?B?c1VLYnB3T0hYbG50QVJERnh0SnE3OFdPVE9ZTWRsTklWY29jWkNoTnprSDY0?=
 =?utf-8?B?d2VXRWhwVE01THBtS3ZmVk9sK3FDektudXN0ZXE1TUhuT29JR3RsQ0RYeEc4?=
 =?utf-8?B?bFJGcFEydDd1UTdtUTZzNzhqV1pqZmgyV21IcWVpN0M0b3JjWkpqS1l3ZjJT?=
 =?utf-8?B?RU5JTFVWSjdhdlVNYnRiaEFlQjJYNHc2V2ZXMjNaWVB0QVFyYjVVUGZtcjJZ?=
 =?utf-8?B?amQ4aFY0ZDF0ZEx3ZmhwYmJTZ1ZRZ1hRZkd3cWoweEFTbEdzRnd6bldmVjZ5?=
 =?utf-8?B?YXdnc2NMSnJzVDV2S0lCN3gyYjJKOVRJOXN3cGJYNHZkd2JFc01ick5qL21n?=
 =?utf-8?B?bUI4L3M5ZWJkcHpXakFObXJGSFVFT1Zpd1EyWG9TQUpSeWhEOFh5OWorOFA5?=
 =?utf-8?B?UmdwWmdUWE9aOUh3cHpHb0NNUGhUK2xERVpVakY0YlpDU0ZaR0Nab3RhdHll?=
 =?utf-8?B?MFVTNUxxRitJTm85MGRVc1lVbDNaNnRvM3hPbU9IWHpzRzM1MmhscU95KzJT?=
 =?utf-8?B?SktmVWdsbm5VSFBOeWpoY3M3L0IvMy9MU2ZGZVhCUk5iNDNzTVkxQjRnR3Fn?=
 =?utf-8?B?dW9aWVhjcW0veXBDajZrVFM4dmJDZnBwQmNTbUdtSm5hUWVkbllQVHBpaGh4?=
 =?utf-8?B?bVBDcGZrWDZUTkkzVHdUVnlsQ1p3UGpUQ21HSTZKb09nM1FzWHNvUFdVQjFO?=
 =?utf-8?B?OFdMZVZrYTZQTnc4NUpLTmEvUVh3ek5CRHNUU0UvLzhBSUJGYllyS3JGVmJD?=
 =?utf-8?B?MWNWejNOUmhQeXpzY2dkVms1Mk10cEdHaXo2WXZIOERlbGc2cHNUbEtRaFJH?=
 =?utf-8?B?Y2JUdTRUdTllb0o3bGNEdlZ5aFJWa3A2eFFUQk9DdzFFejg3YzNzNE5xb0t1?=
 =?utf-8?B?QmNVV0EzRXZCeWgzUHM0RHNpL3cvY0p6M0ZKckRhd21ibS81RmRCSWRXS2ZW?=
 =?utf-8?B?TjZibFBqbmlvb2d6MjJSMEh1bWo1MzBRem5WWXhPVWhtZThnWFNmMjNzRkpE?=
 =?utf-8?B?RURNNmtjSVNCUms2dXNON2xWbEZDcU8wZjFEMmJtWk1kVGd0di9NYVFMWFZN?=
 =?utf-8?B?WDY0dVFkR0N0RUkyYkpqLzBvVllrSUl1U0FwU3NqSTI5RnNWVW9ra281Yy9C?=
 =?utf-8?B?bi9ESVhnS0UxYi9kYk5CNVNYWGFGSTJBSFdsNlpqL3N4TlRTM09CcElZT1RQ?=
 =?utf-8?B?Rmhnb29FMmpweU5zRTE1dXN3WWpzZUZxMzU2UW0rN3R3cmpva2FOQ3I0WldS?=
 =?utf-8?B?eFR6T1hoTlo3dGFjREpud0xDMXhBTVJid01hUENrcStGNXRJWFdtZTJHQzc4?=
 =?utf-8?B?RW9oNzd6bkxmOFhnY2pJYkE4MU8rbzNETU5CaWRXaWNwSTRiSTU4OFJIUTF2?=
 =?utf-8?B?YTE3UGl2amIxZzN0cW1PREpxWkZFZUh5SGJBSWJUL1ovb3hrQlowV1g3NUI2?=
 =?utf-8?B?YnhNL0xXSWhpY1Y4Q2REYTNQNGN6VnRmYlVpSDhPQTNmdjFkelBSZHpiNG00?=
 =?utf-8?B?VUV1WjBNdno5bEVRZ3Fkc0E4VG1YR0pROWtzb0t2RXIrUEU5Y0JuNWh4d0JR?=
 =?utf-8?B?eFRHNUNuQzhpTUJQbU51MXdCdkxKcEQwc1gvTUp4eU1BUk4zTnhHWWtWc2FN?=
 =?utf-8?B?L1htc3RGcWtVSldsOFV0SnM0OXlpUVppd1E0WDl1SmVsVWxkMmhwMHJORVYw?=
 =?utf-8?B?YVc0MllhbU1Wcm4xNUtyVlpDalpweFg2Z1R5Z05Cd0RiRXZHMlV6UG1icEcv?=
 =?utf-8?B?akNOUE53Y0I2VG9zWHNoaDUrUmV3U09xNXo5WjgvWFVCU0MyNFhkU2VadUtU?=
 =?utf-8?B?b1ljVkNFazloZGhtb29KY2FzeVNoeWpzNWdIZlJZaE1HVTJwMitQai9PanR4?=
 =?utf-8?B?eVBxM1JHVnI2N0s1QzlLQngxZEF6QnVYUFZSVW91Qk9DQjFhLzI2WmlkbE85?=
 =?utf-8?B?SUhHengycmZQd05qcnF3WVBGY3dtWDBzYnNZR2labDNFbXc0WnB0andWOXJ4?=
 =?utf-8?Q?S6XMi8ZvkJmXBc7I=3D?=
X-Exchange-RoutingPolicyChecked: oxYlGgYAjz9R0uSGc2RLbSQAowwTCoGljmRhHcvS1j4wtNZYxBhAROOtn0wECwBnFdLqpw/y+c4RLznn6VNKSsL7omv1gZx3Z7d3abDVgr6h5pWLMTpJLx2+dSjPm5Gy58L5g4IogC6BvM7pL5HuAKLi1B9aQYAWfeG7sxv2mQBDDVuDJWoHERtC0IiXaiorwgbMb3a8sqcuGeeIoHONuLlNoZjjTV7XNRGQw/UKfqEsiFhy8j6+4zFYhILc1iH3qjPVPAwX4lUox18mhuWA8HJrqCs67HWCaGxcLUs9ZtOuosGb8IQ7fxmuWcYRHZf+rx1OyT+8HDJReDcbkj5uLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a73ba833-1b5f-4ed0-0097-08df1802307c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:02:59.5455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfDuJmO8HrEtGXP/Jk2FPpRfBCQVREXKrp3azI+mNXwt4AXmaZhba2S2MKseld4c6k+otyCvnCYrT7d4Z/+yWtupMN7i0QCMtuXf2nXfiwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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



On 05-09-2026 02:46, Matthew Brost wrote:
> Some multi-tile devices may want to mirror page tables across tiles for
> memory-bandwidth reasons, while others may not. Add a device flag that
> allows enabling or disabling page-table mirroring across tiles.
> 
> Setting the flag to true (the existing behavior) on PVC, but both modes
> have been tested and are working on PVC.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_migrate.c      |  5 ++--
>   drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>   drivers/gpu/drm/xe/xe_pci_types.h    |  3 ++-
>   drivers/gpu/drm/xe/xe_pt.c           | 36 +++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_vm.c           | 37 +++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_vm.h           |  3 +++
>   7 files changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bc60833c39a7..997ac82fd571 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -224,6 +224,8 @@ struct xe_device {
>   		u8 has_usm:1;
>   		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>   		u8 has_64bit_timestamp:1;
> +		/** @info.has_pt_mirror: Device has PT mirroring across tiles */
> +		u8 has_pt_mirror:1;
>   		/** @info.is_dgfx: is discrete device */
>   		u8 is_dgfx:1;
>   		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f7e1a81434b2..471ae5741836 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -246,7 +246,8 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   	struct xe_device *xe = tile_to_xe(tile);
>   	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
>   	u8 id = tile->id;
> -	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> +	u32 num_entries = NUM_PT_SLOTS, num_level =
> +		xe_vm_pt_root(vm, id)->level;
>   #define VRAM_IDENTITY_MAP_PT_COUNT	4
>   	u32 num_setup = num_level + VRAM_IDENTITY_MAP_PT_COUNT;
>   #undef VRAM_IDENTITY_MAP_PT_COUNT
> @@ -258,7 +259,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   	u64 l1_pt_ofs = xe_bo_size(bo) - 5 * XE_PAGE_SIZE;
>   
>   	entry = vm->pt_ops->pde_encode_bo(bo, l1_pt_ofs);
> -	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> +	xe_pt_write(xe, &xe_vm_pt_root(vm, id)->bo->vmap, 0, entry);
>   
>   	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ab4da1d9a9f1..d9030cb4f1ad 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -371,6 +371,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>   	.has_display = false,
>   	.has_drm_ras = true,
>   	.has_gsc_nvm = 1,
> +	.has_pt_mirror = 1,
>   	.has_heci_gscfi = 1,
>   	.max_gt_per_tile = 1,
>   	.max_remote_tiles = 1,
> @@ -808,6 +809,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_mert = desc->has_mert;
>   	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
>   	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
> +	xe->info.has_pt_mirror = desc->has_pt_mirror;
>   	xe->info.has_pxp = desc->has_pxp;
>   	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
>   	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index fed509ff601e..71068cdb3558 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -52,8 +52,9 @@ struct xe_device_desc {
>   	u8 has_mbx_power_limits:1;
>   	u8 has_mbx_thermal_info:1;
>   	u8 has_mert:1;
> -	u8 has_pre_prod_wa:1;
>   	u8 has_page_reclaim_hw_assist:1;
> +	u8 has_pre_prod_wa:1;
> +	u8 has_pt_mirror:1;
>   	u8 has_pxp:1;
>   	u8 has_soc_remapper_sysctrl:1;
>   	u8 has_soc_remapper_telem:1;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 05bbac6c2632..7e42067c79e4 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -812,7 +812,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		.wupd.entries = entries,
>   		.clear_pt = clear_pt,
>   	};
> -	struct xe_pt *pt = vm->pt_root[tile->id];
> +	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
>   	int ret;
>   	bool is_purged = false;
>   
> @@ -1005,6 +1005,11 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>   	return 0;
>   }
>   
> +static bool pt_mirroring_disabled_for_tile(struct xe_vm *vm, u8 tile_id)
> +{
> +	return xe_vm_pt_root(vm, tile_id) != vm->pt_root[tile_id];

How about return !vm->xe->info.has_pt_mirror && tile_id ?

> +}
> +
>   static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
>   	.pt_entry = xe_pt_zap_ptes_entry,
>   };
> @@ -1046,6 +1051,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
>   	if (!(pt_mask & BIT(tile->id)))
>   		return false;
>   
> +	if (pt_mirroring_disabled_for_tile(xe_vma_vm(vma), tile->id))
> +		return true;
> +
>   	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
>   				xe_vma_end(vma), &xe_walk.base);
>   
> @@ -1098,6 +1106,9 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>   	if (!(pt_mask & BIT(tile->id)))
>   		return false;
>   
> +	if (pt_mirroring_disabled_for_tile(vm, tile->id))
> +		return true;
> +
>   	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
>   				xe_svm_range_end(range), &xe_walk.base);
>   
> @@ -1988,7 +1999,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>   		.wupd.entries = entries,
>   		.prl = pt_update_op->prl,
>   	};
> -	struct xe_pt *pt = vm->pt_root[tile->id];
> +	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
>   
>   	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
>   				&xe_walk.base);
> @@ -2541,9 +2552,21 @@ int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
>   	int id, err;
>   
>   	for_each_tile(tile, xe, id) {
> +		struct xe_vm_pgtable_update_ops *pt_update_ops =
> +			&vops->pt_update_ops[id];
> +
>   		if (!vops->pt_update_ops[id].num_ops)
>   			continue;
>   
> +		if (pt_mirroring_disabled_for_tile(vops->vm, id)) {
> +			struct xe_page_reclaim_list *prl = &pt_update_ops->prl;
> +
> +			/* Transfer root PT update ops PRL to current */
> +			*prl = vops->pt_update_ops[0].prl;
> +			xe_page_reclaim_entries_get(prl->entries);
> +			continue;
> +		}
> +
>   		err = __xe_pt_update_ops_prepare(tile, vops);
>   		if (err)
>   			return err;
> @@ -2835,6 +2858,12 @@ xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
>   		struct xe_vm_pgtable_update_ops *pt_update_ops =
>   			&vops->pt_update_ops[j];
>   
> +		if (pt_mirroring_disabled_for_tile(vm, j)) {
> +			xe_tile_assert(tile, !get_current_op(pt_update_ops));
> +			tile_mask |= BIT(tile->id);
> +			continue;
> +		}
> +
>   		for (i = 0; i < get_current_op(pt_update_ops); ++i) {
>   			struct xe_vm_pgtable_update_op *pt_op =
>   				to_pt_op(pt_update_ops, i);
> @@ -2948,6 +2977,9 @@ void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops)
>   			&vops->pt_update_ops[id];
>   		int i;
>   
> +		if (pt_mirroring_disabled_for_tile(vops->vm, id))
> +			continue;
> +
>   		for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
>   			struct xe_vm_pgtable_update_op *pt_op =
>   				to_pt_op(pt_update_ops, i);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index fbfc42afef8b..795d0ebb1004 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -845,6 +845,14 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>   	return err;
>   }
>   
> +static u8 adjust_rebind_tile_mask(struct xe_vm *vm, u8 tile_mask)
> +{
> +	if (vm->xe->info.has_pt_mirror)
> +		return tile_mask;
> +
> +	return (0x1 << vm->xe->info.tile_count) - 1;
> +}
> +
>   struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_mask)
>   {
>   	struct dma_fence *fence = NULL;
> @@ -861,7 +869,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
>   	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
>   		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
>   
> -	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
> +	err = xe_vm_ops_add_rebind(&vops, vma,
> +				   adjust_rebind_tile_mask(vm, tile_mask));
>   	if (err)
>   		return ERR_PTR(err);
>   
> @@ -948,7 +957,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>   	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
>   		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
>   
> -	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
> +	err = xe_vm_ops_add_range_rebind(&vops, vma, range,
> +					 adjust_rebind_tile_mask(vm, tile_mask));
>   	if (err)
>   		return ERR_PTR(err);
>   
> @@ -1738,7 +1748,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>   
>   		for_each_tile(tile, xe, id) {
>   			if (flags & XE_VM_FLAG_MIGRATION &&
> -			    tile->id != XE_VM_FLAG_TILE_ID(flags))
> +			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
> +			    (vm->xe->info.has_pt_mirror || id))
>   				continue;
>   
>   			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
> @@ -2047,7 +2058,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>   
>   u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
>   {
> -	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0);
> +	return vm->pt_ops->pde_encode_bo(xe_vm_pt_root(vm, tile->id)->bo, 0);
>   }
>   
>   static struct xe_exec_queue *
> @@ -5072,3 +5083,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>   	}
>   	up_write(&vm->exec_queues.lock);
>   }
> +
> +/**
> + * xe_vm_pt_root() - Retrieve VM page-table root
> + * @vm: The VM.
> + * @tile_id: Tile ID
> + *
> + * Retrieve VM page-table root for a tile ID, used to abstract if PT mirroring is
> + * enabled across tiles.
> + *
> + * Return: VM page-table root for a tile ID
> + */
> +struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id)
> +{
> +	if (vm->xe->info.has_pt_mirror)
> +		return vm->pt_root[tile_id];
> +
> +	return vm->pt_root[0];
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c5b900f38ded..89c4f95984a2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -436,4 +436,7 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>   	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>   
>   void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
> +
> +struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id);
> +
>   #endif

