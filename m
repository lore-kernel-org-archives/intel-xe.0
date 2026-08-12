Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC74C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA9110EF9B;
	Wed, 12 Aug 2026 12:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8b1++Ow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B6C10EF9B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786537654; x=1818073654;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7/TPrkRlWJW67Sb6UkHDIXJQVJcYtAamMXe3lYuScoI=;
 b=c8b1++OwCX4uBHDmyLiqcyWTh9GY0GlU+0+BoXEx0IHZIrpp9UyOCnUN
 0mwKFj0ZJ9PRnpv46QjLhE44ricF8t3wyV/lX/nKKCyO7eW9J2hGh+m24
 ccT7XqmKoiB/TwVmLnGsA+tX1r/jvv9cyup0a8IL72ilGDz6j9tsSx68N
 pCtdUN7VGgxAROFdn8v3v+hVldopojoTUGyOM9yoSJD6GO3Ue0jS53UTR
 A6hvO4Bs0entoGUWmLRzMcmUODo5TMrJSCvEj6+/tCbveoVvB5hRuU+l9
 AHcpIY1eu+MFoFaxhFROAq3biiKAm95oTih0JnTMHZ14t7rZxeU3IlXIw Q==;
X-CSE-ConnectionGUID: pGG7OtUASMio+vslgbwIwA==
X-CSE-MsgGUID: PTycnUPaReirPSJ64LRpQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90965425"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="90965425"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:27:27 -0700
X-CSE-ConnectionGUID: 09mvpogYRYy2GG+lxvXGbQ==
X-CSE-MsgGUID: ij5yd+jER7GrfIgr0qq0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="259379233"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:27:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:27:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 05:27:24 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:27:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtjixShx2PlA3VgaNZA0+WJ8KRe9REgDJwZwnRKcQhA6iElexcutCB6EBp4Ly8ifRIRj+rttXHV86SL82viTIHLcwiEXLYiJBIOFTXufyzwabPaFiXUGy0ZlLIzXZrh565pUmPBKVbtpFSD6nrPq/g/jcz+v9S9y+pq6Q5fWcwqr3OerEal4Qnh7wFul6JPgOXvxr6j7nIVYwUlYpemtG7aTI25mZjM2ZTJTl2M56EWShz9L+KYnoEDgkqdXOqsah3erbmzVzJKlgtNhauj4+CoaM5wZf/5yvrXTvKizBxBd0OtvIUJvE2fxmzaiAgm7UUvyprOB7AmRfJYM6Y4xzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLBj3zfg3g8MgwbQ6xpwIVcqEeQRG1vlsBPhSHbnOu4=;
 b=M3cl8uxhpiPPRBPmDWurImHWHFla6HdWKqdSYS3yLcrP3r9moSr4wlrUc43ep0k57dditPxVdZpMc5eq/KdcM9bPPO6vN0ZeVCyTbzQkpD0O9as21yTR61Oop4L69LGe/rIGBpyufuJ7m/RJSfLTDSfqzuX9s1NfsKZOhziDmMwQWioKqlSM6zT/+DSu3axD/klxI+5OLlVwDFwdDK4X0NIp0UlclK+ItGBNPVTcl3n50BRbBDQuOEoMJZMDHSiPqzMZB/BIrUBJjd0R3iADAISP4toCw+C/qpUWK7QGOavpDjoMmm1ZoeXyeWMvp8OEpDHW+I5QixBH/b5Cugbczg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by LV2PR11MB6048.namprd11.prod.outlook.com
 (2603:10b6:408:178::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 12:27:20 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Wed, 12 Aug 2026
 12:27:20 +0000
Message-ID: <4b127841-ac30-4920-b624-7b04f75e173b@intel.com>
Date: Wed, 12 Aug 2026 17:57:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 12/14] drm/xe: Add sysfs interface for bad gpu vram
 pages
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-28-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-28-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 3577389f-2114-425a-5d2b-08def86d0dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|5023799004|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: qEQvkITCHEy/w4va4GbzEeIVD7KUKtgel1qPlnTlEwS0vfriUO3wW3KuFmScYb4mUxa+okuFLos+YjMJez0+JbQ2N3H1Y0g+g31tzvahFBO2WT5ylGhTuC8lTU60QSQPi2hKbCvALtO/5YLPTOTg1dP2H7cjjjUiLOOIBnOSW81HSAMniXo0yqshUwvK4GvRBRupzp8CVlNDStgFYmNDx1pYp0EGkRtCw/L3STG1kFnkJ5kRPigHJwlVHS4LDBeK8RFoYLrPyXWoMVsK0dYG6eJ51rjJbfXhRF7k7aVI0i1tzxuMUh+hgKcBiWFIYlLUqTmuzHlf0YXeArSX4fu7va2CvNcu5XwcVGiUTfIbBWWyJvp1mGXrPglQn7UBhAAsbpZCO2wd2lRgNddqyxc3d6vZbKgzz/YnZSMUzLy0mL/nC8QZuvGZWWLcAkMWe+xDWZsxpXzEVRYkqtBWav9VqC02GawWvWgYrTT05XoFkfplCQkIsahaIv9ooc9UGZd/6n9NbWRvZZMiMInL0qdWkbM9ONMb/QmM4zvHccD79cBVAXaLOC8U26Xvaf4A+NE8xo935NEB7g/hyNhMt5FByR3KUJQMr+VHCdEdxKa1tUSCqC8bq173fI0hDdIsxLWkeV1aG9nbgCA2HMaek+T0YE9UPsRLBJsfmc5xs7AtwP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJTWkhDUWpLZVk2RS9JQmtDTU1UUkZ2ZkwvYXpPM2daWElFTnU1bml1Vnc1?=
 =?utf-8?B?dHZhcjd4SnFkd0U5L3U2TU5valFwOHhqTS9aa2RLQWRwa0VOWnRHS1VqcHFL?=
 =?utf-8?B?VmtXc3gxYTZmblFLVUZmeXdNTHQxeld5QjRaUk4rZUZhelE2aHBSYXVJT2pR?=
 =?utf-8?B?YkdObVQ1aXhUQUpMOEErNUFJbmcrdGdaaWtNd0tHdnpZeE5hRzlCYTFTZkVJ?=
 =?utf-8?B?WThWZjFsNy9wcG9BKzhUcnJqUVpkdjNHWElwenZJWW9mMlgwbjBOZnBCR1hz?=
 =?utf-8?B?Q1hHaWxxaEgrN0xWWStqZnpSL2N1amQzcURZMGcyWVdGcjdlZmo5UzRZSk5v?=
 =?utf-8?B?SXI2R0JiK2JSMGd0Mzh4QU9MdHRXL1hQcTN6UlpQODlETWR0L1VySURLTHNI?=
 =?utf-8?B?N2xmQWpGNGR2WTZVT3lKa05MMFBEV09CTXhCTDFYMThwb2oyaENMUUJEVU9s?=
 =?utf-8?B?UW0yZ1kvaldZYmFEaVVFR2xKUUwyZjVHNEdQUmkvUU5FU3dFZlBrRC9ISEZJ?=
 =?utf-8?B?SWVIUXpqdUNldFRRQ2pYTk8wMlNwNGQ1UDV6OWU5LzVBUURMS1BPRURNdUJW?=
 =?utf-8?B?Z0RlZllYQW9vMnVXYWNUamZPWU1OMXM3ZFFwOU1ocHpkQWZueE9QMGEwWk4r?=
 =?utf-8?B?ODkzdHd0VGcvWVFLd1BlVCt0R2ZuNHhJbDAzZEYyMWNvZU00ZWxvNW1XeW5Q?=
 =?utf-8?B?WG9WUFV6dHdpL3dKb1hxekJSV085Vm9sWjYraEVoV2VnSjFJUTR0RGxjQ2NO?=
 =?utf-8?B?NzFNdkRXYUpnWHNxQzROYXh6cVgzKzRFSzdKR0txM2lMQ0w0YlJuWUdlMmZT?=
 =?utf-8?B?OEwxWjJlQzBSY2d0MUhPaEh5U1dtTHplelJpeGlVKzNuY0I1MEc1djFSamdQ?=
 =?utf-8?B?a09XNklTN3M2ZTF2alVxVThlbkI5ZFJ2K0hHMHJ5R0pBR0I1dzdmOUpDemx1?=
 =?utf-8?B?TDZXUGJYZS9HeElkK0lqQmJNdmg0dEx1WTNOZnVPRVpPRFVCMmh5UGxiYWtZ?=
 =?utf-8?B?WGl5ejlzUU9LRGJJOVgySHNlR0xQaXpzamlmelhqcDlISkh3V01QYlNva0tF?=
 =?utf-8?B?ZUxJQjh3bWZGamtmODZjV28rL0c1cVRSV2M4bUxYWWhZUFd6UHBCY2E1OHRH?=
 =?utf-8?B?QS85M1dRekRhcTJSU3RvcVhSQi84anQ3a2c3WmNKOGZzekF6WWNDa25BLzNa?=
 =?utf-8?B?REtGNWJZaXFxalhwSG81NGJVZGYvTHBIVG5Vd2MzZFNYTFN0WHhpQllEYm1F?=
 =?utf-8?B?RzBlOWlscW8xWGYycE51MTBHUGVEd2ZtRTYwWnordXhSVlpxQlBaOHNzT0NH?=
 =?utf-8?B?OUJBL2RYYjJJUWNzZnFJdGk4RDNiQTNFOVN0ckVQNTQ2ZElIMzVQbXhvQ2Zl?=
 =?utf-8?B?YnVTdWwzazFEWWhtVFJGMXN0L1hNY3Foc3QrdUhjS0xtNDFqdWJrd3ErVmtN?=
 =?utf-8?B?YkwxMTMyRUxQNnpYcEdHeDNVVEJ5dkdzeHUzVCtQM29DUUQvaHVINFowSkt0?=
 =?utf-8?B?Y3JJS2RVRzNWWmVDZ0tDQnE0b2tMUExYWEtCWEVpd1hoaEdwYURJQUpVdlFI?=
 =?utf-8?B?UG9MQzJ2a2pWMkc0eVUxVFNXeXN0OHQ1eHc3T2pOWlF2clhpdTRUQUplWUQy?=
 =?utf-8?B?bVVTcWFqWVhNZnVmMEl2RGl1OTdFRmRWMFUxM1o2bGlzZHNxZzFjQ3ZPcC85?=
 =?utf-8?B?MldqSS9VT0NrekFBMGxQdTJNT0h1bmc4TWlFcWc4U1puSjJ4OCtPZWZpVldl?=
 =?utf-8?B?WXhFMXhCejY3bm1HQlR2RXVyNCszTkR4MVdWaklSZnJjZCtqSEM1aWVwTTMz?=
 =?utf-8?B?d2tkZWNYcHhKT3JjNUFGZmE4Vm5IeXpBMitJQlFVMHpEL2RMbW1MeUJsRW5K?=
 =?utf-8?B?aWU2dUFJd1Boa21QZnFZTWJ2VnZCK0RDMUJabC9VeWVTL3dZdTloUDhUQlVJ?=
 =?utf-8?B?b2tXNjUxRVpvc2ljbU96alQ0VkQ0d0pmNUI1aGlPRCs3eEErRWJGK012K0xE?=
 =?utf-8?B?NlZkSklYNUJ5R3FYTVk1eGZ6K1I2MVcwcCs5ZkJvU0VHWktNV0VjakVOc1ZR?=
 =?utf-8?B?K0dKVHkzeWNQdkhUWTNDY2Y5bzRDbjdrNzJnRUJOdFN2YWJ2N2xibHRPWnF0?=
 =?utf-8?B?OWxjN25aaXpkelJlM2g5V3N3YzVGdlJnaWI3amtuNjB3VFYxQ0d2b2dtY00z?=
 =?utf-8?B?N0hjMzBWeTRwR0tXa2dOZUc4ODJjV3V6WEpTWUU1RWV5SmtIcmVOU0R2clBR?=
 =?utf-8?B?ZlJjd3NXK2hBMHBNZG85VzBWbTNkWmNEcjlwK0lnaVRUcm8va3IwSGhxUFlh?=
 =?utf-8?B?S0U5NjU3Zng3WVVTdldkekZobFpPY09aL3lVUUxzcmg4Z1NhR0M1K1h0TGdX?=
 =?utf-8?Q?MpvHQR8JOfeljefo=3D?=
X-Exchange-RoutingPolicyChecked: PvsXXNgA+ktzZae/2YcK0RuwCP/YOTa4dm+MQb6VhF2Kg4PpK822iFQWPUW9g0Uaybu15g+9xPoHRmlJRyo8bcuzGyE28BEzSXR2p8wbMogA3aZSi8r/Sm0wA8snzPgrGiVEi7L7ivIYoseZvHJiXtHPyJnl7t+bUGm64WaK0KFHZIXasCC3Teq1Ud8p3KoVXLt6PTm7RV/hOAnb1xkMXtZbGZ0WCQOarKqoEtSib+x9zYl8PnzEc3IYJWEAn6UXkISxG5Gxlr+9ebUly/ySAsmCUN0D/zfsvYfIKbhKaqlNWjpqdrHJE8cRS1Rbmhp9g1kOHqJvtzbKM1IgEM7dRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3577389f-2114-425a-5d2b-08def86d0dd0
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:27:20.4308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0J+XCVZLwuCVc/We80xYa8KzWOH8Fia0ODJTUzJdagJUZOc4eS8NQf+3zvClNTmL0GNAx37S9lvppRTpVzlPMO+g0l9X03xYao4e4NIcU0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> Include a sysfs interface designed to expose information about bad
> VRAM pages — those identified as having hardware faults (e.g., ECC
> errors). This interface allows userspace tools and administrators to
> monitor the health of the GPU's local memory and track the status of
> page retirement. Details on bad gpu vram pages can be found under
> /sys/bus/pci/devices/<bdf>/vram_bad_pages.
> 
> The format is: pfn : gpu_page_size : flags
> 
> flags:
>    R: reserved, this gpu page is reserved.
>    P: pending for reserve, this gpu page is marked as bad, will be
>       reserved in next window of page_reserve.
>    F: unable to reserve, this gpu page can't be reserved due to some
>       reasons.
> 
> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
>    max_pages : 10000
>    0x0000000000000000 : 0x0000000000001000 : R
>    0x0000000000001234 : 0x0000000000001000 : P
> 
> The sysfs binary attribute is created under the PCI device kobject
> when the platform supports it and the configfs bad_page_reservation
> policy is enabled. Uses RCU-protected list traversal so reads never
> block normal VRAM allocation operations.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 7 +++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h | 1 +
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..47c5be4180fe 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -8,12 +8,14 @@
>   #include <linux/pci.h>
>   #include <linux/sysfs.h>
>   
> +#include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_device_sysfs.h"
>   #include "xe_mmio.h"
>   #include "xe_pcode_api.h"
>   #include "xe_pcode.h"
>   #include "xe_pm.h"
> +#include "xe_ttm_vram_mgr.h"
>   
>   /**
>    * DOC: Xe device sysfs
> @@ -267,6 +269,7 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>   int xe_device_sysfs_init(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
> +	bool policy;
>   	int ret;
>   
>   	if (xe->d3cold.capable) {
> @@ -285,5 +288,9 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   			return ret;
>   	}
>   
> +	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(dev));
> +	if (xe->info.platform == XE_CRESCENTISLAND && policy)
> +		xe_ttm_vram_sysfs_init(xe);
> +
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index d5392beff30c..eb55b0f74ef3 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
>   
>   int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +int xe_ttm_vram_sysfs_init(struct xe_device *xe);

Move implementation to this patch.

>   static inline struct xe_ttm_vram_mgr_resource *
>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>   {

