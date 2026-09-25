Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CDCC9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 11:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC4310E214;
	Fri, 25 Sep 2026 11:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ac5/D9Q5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C57410E214
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790335394; x=1821871394;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ydZyTz7VBLet5Uw0FhvA7B1SMPQrLLAC9lpqretIw3Y=;
 b=ac5/D9Q5Lh5TCQXhq7V0H2aqGoAl0PafOzcgwcXvtrKuUXtv9/KvuwQk
 sbZxxqf4ydMhfrKfT2nQUxLwkm1wnVd595kdpf0k2u+443YYhO716W//9
 VrAfTfmk0JFKfmH2nlMKhj50xPLKK5cAev+PWCC+ZgM5lIFYN4dLEmt1m
 SbKlJc1vjvLp5wdWnc0fbogF67ZFSPJizDwXePtZ1qgfRMvlpi0+mfGiP
 let2mHSj+L4AkRsBVKKqwFgHZBrO/PI4QXv+ZN5toLt8lGpy8lxOyOUES
 6W3ZgUnemHWCNvueKYsW+eq/tgyRHFwU1Qzks4zpIWjhuQZU+0+v1YBnb g==;
X-CSE-ConnectionGUID: xB8/2oRpTJyarw6qL6vgAQ==
X-CSE-MsgGUID: n/xyCtlwQ4G+0jgZuH21Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="107500888"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="107500888"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:23:12 -0700
X-CSE-ConnectionGUID: skP3OPliRKCZA8x/zfjBhw==
X-CSE-MsgGUID: Hplpv2piQ8CwHv7cZV/TMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="273405781"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:23:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:23:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 04:23:11 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/Pfnx1+nRyJKlEocTSr7Wf4LmKwgBxjwVD5b8Z6Nj3yMltLg0M80lj+6+HciZHi3UMhLSHQeMiGSW6+A/arPLz+FStEk6VfdrEFWXUx1buntbUU0OyPLzn/jsM6LVrw0NCsA09zev0A/Dm4TIZKGDwIkB4Ndy7D6GLBCPRHytPHyHIMUtQTbU27zYWMEsjJ5AkUErDguuFXXVtoQntJLHHWX9Ajr9MryeRDC2ISonR3JtvY6K57e1hVRK/eWbUGghJFk0c9U99n9SKocszaD3HnNMcgRCvqdPMBAktcxOQ+Y3Q1o886QklCZ9a2S81VdXDgHGLj5lz/gfc6xafvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdV3/y/pZtUD2DQ0Ycleab8eK0OMZkQpi1O/CG51JNc=;
 b=R8dSytwUOn8OCciZyYXhm78aK0fV6QzhSraZdRU8EvfSF9rKrN0XgZngQ3V/uiwSvuKvmjV4ZS43AzVRc2OdFPbaJ+Z52EfLmoc8YJW/AgrIOnyBT8VNQpV+VCDSGmeJps85UFPHS48d52gCtjso/ZsTq5RB2Vzgp/rfjwvRzvCUIpJ5pzNnHcTBVxBTzgVQoJjhb9jGJ978HdTDrGrWV4DA9Aws1PHm9oz/Fst5CbXhBEJ/yZRZrqHQeFV8jEnu+Ka2veJy+6rOkMN2K/FM+t1nMGZT7SFcXuxVXhIKXrymkKqugIb8OMHnetE81snMd+nG/Z33Q1c0GJ1hK/qfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by SA1PR11MB8596.namprd11.prod.outlook.com (2603:10b6:806:3b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:23:09 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:23:09 +0000
Date: Fri, 25 Sep 2026 13:23:04 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 07/24] drm/xe: Update scheduler job layer to support
 PT jobs
Message-ID: <arZZmA7yciooz3g6@fdugast-desk>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925045320.1325860-8-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:10:234::15) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|SA1PR11MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: ba306b73-4c2b-4a8f-d6cc-08df1af760ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 7ffXqkp+1Jro+TE3bEBrmne5NqIaQe2quPEj7b9Zqq8i3so3yZc1GurhvBnBuvi381k7RLmrXIIdgzlw0VfsW0jtNqpdqVMez0nlnyD4mkS8qm1HUdmUq1DvBmzyJc5ScjE0zr86r6lBXFplh0dZa1HTkGN2x3y0xZ9c8m4ih5p0vMmA9++yqrztUjjfbuH3vByAKlL2HzawWJrNKJOrM58X6gh3xb5CfVSkOPZNOl/SPzlK7RvKiegfW61GpJiwqnavViSz7Kp0xGI5JndK0uKiRpWO838uIqcd3T1iO00JLrBfXj1I/cO/VXDGg/TjtGqclXXRnHddcNon9kyW2BgSOKwr02ftzlpBjMbCx6VFlS8ahUngcfxfrhT/INjAlm9ovQPtSR46sFFiXmJRhS8+O0VJx7GPCYEDPp30TG2Pd33M0g04KOVRXLQshqH5rYY+JcfHzggg1QWjqESkWno0lJ/FDiPyyv01/8gmE5CGoghgPDSlRd2mpuQCUTuML+ki7Uvryp+uGX3oJjGYOTP8CDnjqj7F+oAlIUZ9Chftuusghg7Uy5kv6G6vjFIPdEO8/5Vm2qnNoy41KwbuoG/EwrqqYxIEfLyBNOIkA+fAyB01ICtvOAu4LMC+4tVnhQk9xHiGcPjUp2ecFwkBgR+naJvQBKa0LIRL1xBisW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDhabWNOb1psR0wyNVB4K2x0YlFURW1ZSnpidThTRFlTbVFMZmhleEhLL1hH?=
 =?utf-8?B?ZWNQcVEvanI0NU43ZzVQbWhBQ09WSWlCb3ExZGhsUTdpZXhQOUR6K0locjQ4?=
 =?utf-8?B?bDVFYUhBY2JReFpSTWgrNHI4WFFVT1dVWER6QS92cDNscXJJZkhrbGFRaUdk?=
 =?utf-8?B?WENoc050TzV4WTZRU0JJc2xCeE1JRTRDQjhtcVgzT3VSMytRU3g0bzZ5UndT?=
 =?utf-8?B?T09DU0JPRU1hVjY0NjJET2VvTDkxdTV1V2wwS1M4RENGWUhlNkVPaEJPSGly?=
 =?utf-8?B?SnN0c2dHSUV4VGw1U3FQNGpCUHpZaFdGRkZFNkdBRGhJc2ZaOVpBYlFrZzNp?=
 =?utf-8?B?UXBrMHc3RXFyTUVNL3E3azRGSUJHUTlSdG1jTGR0cUJSZEdkdmd1ZnB0Yjkx?=
 =?utf-8?B?cFB6NHZBWit1QTdHSDBPaEhYZThPRGlwdXpDbTJRZ1dkZ1RubCt6UDdzejhK?=
 =?utf-8?B?USt4ZXJBMnJvQXUyYXhrRmUwY1dmeTl6UGVnR3J4cUJ0Nlc2eDA5d0xNQUJE?=
 =?utf-8?B?aDAvdUdiM0xpd3QyOTRIM2JJelFLTThFMXdrV3p1bS9MdVZHSkU2QjdEVS9v?=
 =?utf-8?B?ZXJvcjdFdlpvTTNGUUtWV04vR2Z0Mnh5ZWNBcFBnNFF6dTFab1dnT2locGtJ?=
 =?utf-8?B?MDhVZFJINE14ekJIalRucUpBWGYrdGp3dnZQZktXQk9nYWtzU2dlbzI3eUIx?=
 =?utf-8?B?RXJYWE9YaDBjcEswUXRtQ2xDZndpY0kvVWU5MEhnQ0FMSERpVWE3RGo4VzdY?=
 =?utf-8?B?TkZSclhnb0tBOHdqTUprM3lBYlZZUWZ4WEx3RzlNUHM1cVJ5bVJtdjZGNU1p?=
 =?utf-8?B?YjU0b1ZKdDhuUkt3RG1DZU9Zc0JBY1NIbmxicTJoQUJ4c0h1U1FmdWZjUm83?=
 =?utf-8?B?VTVKRmFqWHEwVjRuR2FmTlZiUjlBdTlTSEdnSHRWM0tqcTNJN2ozallpc3Zk?=
 =?utf-8?B?WWk3TWNOS2JyczhOTVdDZDludDlWalM0dkQ4dVQ1bEZKTW5iQ3FEMjdXOTZj?=
 =?utf-8?B?Z0dPSFVTeE94QTM3ZnhEeWFFV0dMUXdKOWVpa0Y3a0pBWTBHMTVGUEJ4Q0wx?=
 =?utf-8?B?d1hYN0VmbUNKMFlkZ283TXF2eHBCUUx4dkN5R01iWC9iN2ZKK1pPbnNKbmJk?=
 =?utf-8?B?Z3FrVDE5MHoveFY5cDRuSTAvMU9RLzBDT1UrYm1yc01kWVFZbXB4VGxzT1dq?=
 =?utf-8?B?dDlzWWdGekRWSDNpZlRVSitodGNzYWkrOW1TL05kQnowMm5rY2FSS0hwV2wz?=
 =?utf-8?B?aW9pcldzM0hBUXVob29FQnhuRUUyeDBVYzZNajdWbXRHM1hTR0grZVozandr?=
 =?utf-8?B?MEhGNk9zUi9yWjhWbG1iOTc5UklhRHlnbWRPL0ZaeWhOVjVzMTlMN3lNT3Fn?=
 =?utf-8?B?czNralJ5RnJPODZRanl4S3V4L1pMeGJ4aklUUmJTUmVmWjRPTVVzUHVzbXEy?=
 =?utf-8?B?MCtYcm44RmVOajE2NWtOaTBqQ0hLcmp0RTVLTGRkZ2pORGRKd2RLaE9SSDZ2?=
 =?utf-8?B?L1dObGo5SGo3L0NPQTBWcU11SkhsV3BsZVZmdm8zaVBGbCtjUE1BVExLZnVJ?=
 =?utf-8?B?cHBodEU1ZjlJcE9zV25rcFBrWGhkbjZPdjJXN1RFVzVTY0ZXQTArSDBPL2JW?=
 =?utf-8?B?NHNvSE9zb21EUFZGTXdiL1FDNUd2TFkyaFBla3pHT1ZkOUJ4SXRaU09ZUWVO?=
 =?utf-8?B?ZGcxZkZjNnlaSXhwblJzMlR6N3ZyZllBaTZ4RHRBMm1LYUtGSm5PM2lzS09p?=
 =?utf-8?B?RFFVVTFUazRkSk14c3RBa04wZ3l4ZmlhQm9nK1hXR2Q1K0lpZ0JGQncwU0tU?=
 =?utf-8?B?OE1EOXY1Z3d1QjQwbnZudURTaVA4Y3FweitkTFR6Sk5haW93b1crcWluSFV3?=
 =?utf-8?B?VnRsRnRVMzdIMU1UWXd2Q0FQK3hjMWpyTURnQkZaUDdlQ29DVWV6WFBaWWVI?=
 =?utf-8?B?YXAzT0wrTk1mdG9hN05LdktOcTZ4MnJ0RVh6aWxacy8ySld3YTkxSWxmZm5D?=
 =?utf-8?B?VkpuSGR5UlZLL0QrVkp2UDZuemxtejFjVFBSdklPRytRYVBrNmI5RUVlYkRY?=
 =?utf-8?B?MTByRUlLNWg5cjUvTldZaWlZdVFheVBtOGFwUWVhYTQrUTlSbGFCTnpjNGdo?=
 =?utf-8?B?cjhLNU9RVlJCZGc2Wm1aWUxvY05iTGJadlplMi9Hd3VFNHA3SGVRY29oTmw4?=
 =?utf-8?B?VUtxeGpHN3VSSFQrREYvd1I0QUNyN1lxb1JOK0gydVhYdi9jbEZqblBCK011?=
 =?utf-8?B?SVpiSng2Q2JneUpkZmNnY3FIV284ZVp2UDJNbXVuaTYrK3orcWtCNkpmZm1l?=
 =?utf-8?B?MDR6amdhd080dkkvNGRzN2lnbFBmMWRlaFk2QjBRdXhvN2dFWHphR3FXdnlt?=
 =?utf-8?Q?Q+HnEmAtRVPd9DGY=3D?=
X-Exchange-RoutingPolicyChecked: YHCvC4QLbOkzVCzUnU4TkAHF8OivS/+A9NASJDMe+GXqAomLfd5sDrlY1Ru3vKMjpcrT+qNurD9R9Zfd3yabzlzPeb80/ZpSkreRjHnA1byFCEk236daALkO1yf33WY90DHlhv6FUgON+DWsLWZRxfitg0Iu+JlNlHhrUjb7LHnO0ZbPkLi332oHmoYDQXOdlSc9vS2kfXmuiTHRzMH4WWrWCpAoMpwxPgqeWoaYme8Q8isz0yXbpEiGN85mVAj2Mt1D6bO/Vh93XHJWOYh0Z1JYA0CsKT1WvA4kig5gdIEuQeapIx5kLPrNv9vvpuLghoeNmGNGWST4vVw+AMvvEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba306b73-4c2b-4a8f-d6cc-08df1af760ca
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:23:09.4009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYuGDzJF0fvtwQ1JRZ6oEKJF1xALwg7r08l5j4LUORk+SKB+BMp+VEZ1QwZAMwmn0AnLifCGmHPfME60oiTT1mJDr3ATQehZB3jwO2ukza4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8596
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

On Thu, Sep 24, 2026 at 09:53:03PM -0700, Matthew Brost wrote:
> Update the scheduler job layer to support PT jobs. PT jobs are executed
> entirely on the CPU and do not require LRC fences or a batch address.
> Repurpose the LRC fence storage to hold PT‑job arguments and update the
> scheduler job layer to distinguish between PT jobs and jobs that require
> an LRC.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> ---
> v7:
>  - Move is_pt_job goto above seqno/tlb flush code (Sashiko, Francois)
> ---
>  drivers/gpu/drm/xe/xe_sched_job.c       | 95 ++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_sched_job_types.h | 31 +++++++-
>  drivers/gpu/drm/xe/xe_trace.h           |  2 +-
>  3 files changed, 92 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index a4fa00632a30..20992ea816e6 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -26,19 +26,22 @@ static struct kmem_cache *xe_sched_job_parallel_slab;
>  
>  int __init xe_sched_job_module_init(void)
>  {
> +	struct xe_sched_job *job;
> +	size_t size;
> +
> +	size = struct_size(job, ptrs, 1);
>  	xe_sched_job_slab =
> -		kmem_cache_create("xe_sched_job",
> -				  sizeof(struct xe_sched_job) +
> -				  sizeof(struct xe_job_ptrs), 0,
> +		kmem_cache_create("xe_sched_job", size, 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_slab)
>  		return -ENOMEM;
>  
> +	size = max_t(size_t,
> +		     struct_size(job, ptrs,
> +				 XE_HW_ENGINE_MAX_INSTANCE),
> +		     struct_size(job, pt_update, 1));
>  	xe_sched_job_parallel_slab =
> -		kmem_cache_create("xe_sched_job_parallel",
> -				  sizeof(struct xe_sched_job) +
> -				  sizeof(struct xe_job_ptrs) *
> -				  XE_HW_ENGINE_MAX_INSTANCE, 0,
> +		kmem_cache_create("xe_sched_job_parallel", size, 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_parallel_slab) {
>  		kmem_cache_destroy(xe_sched_job_slab);
> @@ -84,6 +87,9 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
>  {
>  	int i;
>  
> +	if (job->is_pt_job)
> +		return;
> +
>  	for (i = 0; i < job->q->width; ++i) {
>  		struct xe_job_ptrs *ptrs = &job->ptrs[i];
>  
> @@ -93,10 +99,23 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
>  	}
>  }
>  
> +/**
> + * xe_sched_job_create() - Create a scheduler job
> + * @q: exec queue to create the scheduler job for
> + * @batch_addr: array of batch addresses for the job; must match the width of
> + * @q, or NULL to indicate a PT job that does not require a batch address
> + *
> + * Create a scheduler job for submission.
> + *
> + * Context: Reclaim
> + *
> + * Return: a &xe_sched_job object on success, or an ERR_PTR on failure.
> + */
>  struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  					 u64 *batch_addr)
>  {
>  	bool is_migration = xe_sched_job_is_migration(q);
> +	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_sched_job *job;
>  	int err;
>  	int i;
> @@ -105,6 +124,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	/* only a kernel context can submit a vm-less job */
>  	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
>  
> +	xe_assert(xe, batch_addr ||
> +		  q->flags & (EXEC_QUEUE_FLAG_VM | EXEC_QUEUE_FLAG_MIGRATE));
> +
>  	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
>  	if (!job)
>  		return ERR_PTR(-ENOMEM);
> @@ -119,34 +141,39 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	if (err)
>  		goto err_free;
>  
> -	for (i = 0; i < q->width; ++i) {
> -		struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> -		struct dma_fence_chain *chain;
> -
> -		if (IS_ERR(fence)) {
> -			err = PTR_ERR(fence);
> -			goto err_sched_job;
> +	if (!batch_addr) {
> +		job->fence = dma_fence_get_stub();
> +		job->is_pt_job = true;
> +	} else {
> +		for (i = 0; i < q->width; ++i) {
> +			struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> +			struct dma_fence_chain *chain;
> +
> +			if (IS_ERR(fence)) {
> +				err = PTR_ERR(fence);
> +				goto err_sched_job;
> +			}
> +			job->ptrs[i].lrc_fence = fence;
> +
> +			if (i + 1 == q->width)
> +				continue;
> +
> +			chain = dma_fence_chain_alloc();
> +			if (!chain) {
> +				err = -ENOMEM;
> +				goto err_sched_job;
> +			}
> +			job->ptrs[i].chain_fence = chain;
>  		}
> -		job->ptrs[i].lrc_fence = fence;
>  
> -		if (i + 1 == q->width)
> -			continue;
> +		width = q->width;
> +		if (is_migration)
> +			width = 2;
>  
> -		chain = dma_fence_chain_alloc();
> -		if (!chain) {
> -			err = -ENOMEM;
> -			goto err_sched_job;
> -		}
> -		job->ptrs[i].chain_fence = chain;
> +		for (i = 0; i < width; ++i)
> +			job->ptrs[i].batch_addr = batch_addr[i];
>  	}
>  
> -	width = q->width;
> -	if (is_migration)
> -		width = 2;
> -
> -	for (i = 0; i < width; ++i)
> -		job->ptrs[i].batch_addr = batch_addr[i];
> -
>  	atomic_inc(&q->job_cnt);
>  	xe_pm_runtime_get_noresume(job_to_xe(job));
>  	trace_xe_sched_job_create(job);
> @@ -246,7 +273,7 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  void xe_sched_job_arm(struct xe_sched_job *job)
>  {
>  	struct xe_exec_queue *q = job->q;
> -	struct dma_fence *fence, *prev;
> +	struct dma_fence *fence = job->fence, *prev;
>  	struct xe_vm *vm = q->vm;
>  	u64 seqno = 0;
>  	int i;
> @@ -259,6 +286,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  			xe_vm_assert_held(q->vm);
>  	}
>  
> +	if (job->is_pt_job)
> +		goto arm;
> +
>  	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
>  	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
>  		xe_vm_assert_held(vm);
> @@ -286,6 +316,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  		fence = &chain->base;
>  	}
>  
> +arm:
>  	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
>  	drm_sched_job_arm(&job->drm);
>  }
> @@ -329,7 +360,7 @@ xe_sched_job_snapshot_capture(struct xe_sched_job *job)
>  
>  	snapshot->batch_addr_len = q->width;
>  	for (i = 0; i < q->width; i++)
> -		snapshot->batch_addr[i] =
> +		snapshot->batch_addr[i] = job->is_pt_job ? 0 :
>  			xe_device_uncanonicalize_addr(xe, job->ptrs[i].batch_addr);
>  
>  	return snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 0490b1247a6e..5e1824c36c74 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -10,10 +10,29 @@
>  
>  #include <drm/gpu_scheduler.h>
>  
> -struct xe_exec_queue;
>  struct dma_fence;
>  struct dma_fence_chain;
>  
> +struct xe_exec_queue;
> +struct xe_migrate_pt_update_ops;
> +struct xe_pt_job_ops;
> +struct xe_tile;
> +struct xe_vm;
> +
> +/**
> + * struct xe_pt_update_args - PT update arguments
> + */
> +struct xe_pt_update_args {
> +	/** @vm: VM which is being bound */
> +	struct xe_vm *vm;
> +	/** @tile: Tile which page tables belong to */
> +	struct xe_tile *tile;
> +	/** @ops: Migrate PT update ops */
> +	const struct xe_migrate_pt_update_ops *ops;
> +	/** @pt_job_ops: PT job ops state */
> +	struct xe_pt_job_ops *pt_job_ops;
> +};
> +
>  /**
>   * struct xe_job_ptrs - Per hw engine instance data
>   */
> @@ -71,8 +90,14 @@ struct xe_sched_job {
>  	bool restore_replay;
>  	/** @last_replay: last job being replayed */
>  	bool last_replay;
> -	/** @ptrs: per instance pointers. */
> -	struct xe_job_ptrs ptrs[];
> +	/** @is_pt_job: is a PT job */
> +	bool is_pt_job;
> +	union {
> +		/** @ptrs: per instance pointers. */
> +		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
> +		/** @pt_update: PT update arguments */
> +		DECLARE_FLEX_ARRAY(struct xe_pt_update_args, pt_update);
> +	};
>  };
>  
>  struct xe_sched_job_snapshot {
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 2fe8f89a1e34..d4e9d91f6f7f 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -261,7 +261,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			   __entry->flags = job->q->flags;
>  			   __entry->error = job->fence ? job->fence->error : 0;
>  			   __entry->fence = job->fence;
> -			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
> +			   __entry->batch_addr = job->is_pt_job ? 0 : (u64)job->ptrs[0].batch_addr;
>  			   ),
>  
>  		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, gt=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> -- 
> 2.34.1
> 
