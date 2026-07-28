Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B572C53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 06:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC3310E527;
	Tue, 28 Jul 2026 06:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvxXveH8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EFF10E527
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 06:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218810; x=1816754810;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NMcPQ5bQ9yJ3VJBrNdCjIzjKJG5seHg27XP0KRida08=;
 b=ZvxXveH8YwtCX0q900ej2AJSp0WEmO5KPrDFcToGqpw9d8DVmohEg/PA
 ST85rVOk/2KIkez71nh3ivpog0wNlZVjiu3RvQ5th675aGf9seqfiCF+p
 aBRWqoJPbh1S3fHn2xdMyZxJV+x0dLXTwSwfM1qPC+yCxkuRNigPSZEgF
 Cri3J7KeJ53nmOPyEMgVZJgPa1U5jUvvLp9fg/AHjkrsnoOJxgeKIytl6
 c2K+e+X116rKnlFNqjER+VoCHsb2V6Caq159NWrGpgLRxZaJeps0d1yW0
 /a0+O8RhCr1kcyMYN8T3EIx/dC5t8tJDKQq/Uj6s+uGE+NhrxO+ORSyLm A==;
X-CSE-ConnectionGUID: pnSc+cljTIW+hQnhs7fWtA==
X-CSE-MsgGUID: sKokfzLZSxWLLJjJTxIIdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96949215"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="96949215"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:06:50 -0700
X-CSE-ConnectionGUID: MJutFtJ5QnOxAME/Cn6poA==
X-CSE-MsgGUID: LdZeF1SGQxWMA7hNgzENqA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:06:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:06:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 23:06:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:06:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVlUGk/kvnJY36pKpHBciOBpjGp2NKedgVc1AqQQcKYwKv9lmBEOqvliZOU4zMpHnclEpmYiV1TTCkEn03Bb4JYMVjvTbQY8cgHjjWmRMBvg6Qog3ewdixgOD3ZchAOsFeZ38hv55iUI07fyOKZujdLDN0Ssbu8ymVDJ4+3OWjs3O6T1ca/X1E3/uxlY35Q3+fGlYGbAKeEBoijxvVD01j2SnpX0BkutznG5MiK3Ff58Z2tgSnW34XwtJHRSWYqiF/sKBtaJYOO4BiuEYXp/j0Xesniz05mwf5DDS6tA7vFSs8ejaDcmlCLIJrO1Ox4VIrDgOBAI+xylm6XHshvruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG8Cf0ZyOzhdeS8/XMQo8yiYGGdmsQzDWGyxLYI6wew=;
 b=xnNb8GyPgzEZWUdMq+eWSJmNkJ86S3ThhbQVCMYooHq2kD8K6UWaWnp0F86UNFZ4soOxYkitdquyHm47gsaxuSxkGmfenimSdWyyo2MW/cVxDRW/Q8dAyyuYxJsAMdEd7cDUXPhz0xXSSKwH1JdRDzkzJ8jS7Q7zJM0GbJMZARCeraVThw8hGnyEmOk9pQB4vE4igpwL0XmLwtccwHdXfKzTkwzu9Mng4h3xTMXIETWiW/QiQfhWpykw9BUOT8qUBFlpR6ljdUN9xp6VLkFuak81eUZeAhp+sVGwikeQl+/TWnQLnwsB5xoEONppGxy7aQj96/I0YbXCV3/efPpqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH8PR11MB6973.namprd11.prod.outlook.com
 (2603:10b6:510:226::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:06:41 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:06:41 +0000
Message-ID: <17e887de-faea-4020-b5b6-31309f24e043@intel.com>
Date: Tue, 28 Jul 2026 11:36:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] drm/xe/debugfs: add page-size allocation mode knob
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260728060132.4067990-1-naresh.kumar.g@intel.com>
 <20260728060132.4067990-3-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260728060132.4067990-3-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH8PR11MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: e47e315f-8fd0-485d-dc32-08deec6e64c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|4143699003|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sOzQIDNqA1eETqgMtKUxa2yK/1UZSkhMMmFrxJXj398LSeB053EL4Qa/SX/7k6zDtGtEAUN1PmPCfdA78WOPVQecsdPxQvVBXIMd0yBcogOT+LhdsHZm1jQchoSTcSsfRYHeEDzRW+KZ8scUmNK33G2KIh6sAwWhZ88eWzO+IRCf23jvhMO/OzNbjkBY/HsCU8xwTdw6sNuMfmSNOSgmRcZ8SmS+RilboBVIjQOTe6VU3myd5A9FK75z1EvjAiItKv1qgZO7rJO+97g+NMrCESSeYGUJR3z0BvBioUfmw40vuSd01OW6WtBCvuiFDeAMiWMm9/FAhyohSKUO3br9KOI117uS71qP2JCAWjfPmej3bc0XhT+n0K/y0xJsi6Sap2Tll/4wDpCt7rubEd/H5jVLC5+NMhuXh2rwvPtTbH5iBIcU73KqS1US5LQgyJ2kM8bmSemis+uFu6CmG8utGiZjAyUMkihrjU8+N0/c1E05ZwscvUU4rtmCFBX8q5o8CmF1WAy/RDaF9Kap4uOi3FPul1EtjIH4/LmmZhJa7z90XB8UYibK4xm6YIcDt1AvaXFtoh3ekQ0ecG5QX+1SsjcVXZFgA03Q/4fXSxLi7BqOvgDADi6OIpxjI0LlGoJlb5S/g8b4HNJVasEJKuD1HwAHuYeAzJcIJMxONRRo9c8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ai9sQS9yWTlzZWViSnduaGRIS05iOFlDd0dKU2VYS0FHWGhDM1JMYnFVMFRa?=
 =?utf-8?B?RDJrT01pb0VHcmd3Rm56NHBVM1BXQnlJMWFkSWNBWUVHTm9JMGFISnEvS2NF?=
 =?utf-8?B?WXVkWEpmTDFFT29wdC9nVWFlK1ZNWllVaG4waTM1TE5zQzdYTUdROHNYUytW?=
 =?utf-8?B?ODFYTnRhQ3ZReVc5VENqUWQydDR0SmVjemp4clBFU1pYMDRPcmt4QkdQeHVP?=
 =?utf-8?B?dGlsSmpySEhVcGpLV1VtQWRKN2VxR3ZTcktxNFpCUjBPTmUyclVqd1FWU0w4?=
 =?utf-8?B?eFBVcG1vY3dIdzVaNVNZSE1zTzBPbUZBalczUEJVanhXbTdhb1VVZmtUVVVH?=
 =?utf-8?B?cjcxUThpenVoVUUxNkhYdTd0Zng5VXJSNWx4REJFYTQxVkc0Wjh3dFg4ZTBk?=
 =?utf-8?B?Vy91US8wZ2cra2hYbnZYTXRIby90SVZYdDdwQlZIUmUwS25wYTFnSVo4UzRP?=
 =?utf-8?B?ZGtSVXAraGJiOHpZRXdLQ1IzOTZUV3Z6dkpVdnhSTEg1L2puZm8yaHc1aHVx?=
 =?utf-8?B?RGxaaFVtY1g0VFkrcHBhcnlpOWYwMUU1b1NEZ1VrcUdPcHNFT1hoWnNHV3do?=
 =?utf-8?B?KytBLy83T0R2VmVaSElGQmtrUTgvNkIwS29oYWFqaUZFNUt6aDR3UiswWnYx?=
 =?utf-8?B?SkNYcG15SGlpVFJhcGNmTGZ1R3RLQzVBZzM0ZUp3b2N5YWZRNUFXcW84WEFx?=
 =?utf-8?B?dzRXZHBJN2ZuQzlqcldmNTBVTkJRR1MrTkFXMVAzZzM2M1FsMDVyOFoxbCtT?=
 =?utf-8?B?TFVXNEdqQi9ad1ZpTTJlcVl5UUpBS3JwS2FjYnVMVDlZd3ZrTFZmeUVZUHRz?=
 =?utf-8?B?b29yZEJhcmZNVXg1L3BFTkhqaXhIazk3WHEyR2VieTU0M1hhL2dVWWNxdXNn?=
 =?utf-8?B?elpoY1FXUkJoeFRjUWJ0a1VKR0hETkhPOExqR2Rib3VOV0hkbEVSY0pRV1RO?=
 =?utf-8?B?SUdHMEhYMXNEaGZKbFFaYmtCY1A5WUZ3Sjdna0dUV2FEVHdiV0VFV3JSYmdn?=
 =?utf-8?B?dXIrTEZkWjlJYkpEVzRtL3JYTERzRFp3dlFrVnVDSlRrZnFOQUhSWm5LV2Y2?=
 =?utf-8?B?MzBKSmRmL0d6a1pJbTY0OXVBaVJDR0FpTXJldnhVR3loOTN6SEV3akxyelhu?=
 =?utf-8?B?ZEZ5RytmWVdjM0VqVmJWTklmdklVRHRRellnSHhlQU1ySkFpYk85K1dITndQ?=
 =?utf-8?B?RE5GRHVCOC9JajRYaC9VZEp0M2tKSGFRejJFZWlYUmVBSDRvYmxmRWpFL0hl?=
 =?utf-8?B?MStaSDROZHpOUHdseGl1eFJiamdRK3FOeklEUXcvSW5hajR6VGJDNS80bE5k?=
 =?utf-8?B?ckh0YWZWMkp0b2NUVVZvZWRFSU1lcXRoM05rWC9ma2hoWHd2L28rZ01yd1Jk?=
 =?utf-8?B?WG1iNDdiUjF6UzBSbnhHN2ErUHpzNHBWSnRxVjNyUGtkSUQ5Z0dSZWdvSzln?=
 =?utf-8?B?MmxzTDRMT3ZVOUlPNjl3cmtyR1ZQNzNLdXp4UDJuS1FNT2wyZEN2NStJMUNV?=
 =?utf-8?B?b0JtNFpIS2RWWG9nME9Ic0tNOGt1RE1CWHBRbk84aDczblN4WDdkODFYbzR6?=
 =?utf-8?B?ckVNWVR4U2oybEkvbWpFeUpmUG5oNm1YZU9nYURzcU9sOGZJZ2RRWFpmblNt?=
 =?utf-8?B?Rzcyb0FTbEhOdFQ3anV4NmIwdCsxMkpJT2NKM3ZhQ0FZQlpUMWJJUEFtQzUy?=
 =?utf-8?B?VXdIbVJrQ3BJMHdGK1AzZUtxT1d0dzVPdXJYRUxIT2g5LzRITDhFNVN4elEz?=
 =?utf-8?B?NlV3OHZ0NUE5aUxSVTZOdlJVQzBmWktsYnhkeGpkTE94c0xleVYrbXFVanlY?=
 =?utf-8?B?RzJxRTdTb002T2dUV21hWVBRZGhyMll3a0F4WFBYdGdNL0NhbjZpM2J6c0VR?=
 =?utf-8?B?aitDUE9JMnYrcjZObGx4TDlxb002TG11T0hqd0hZL1dQY2VaQWJFY0lJUDZO?=
 =?utf-8?B?TzFIbzJxWEwyaDNiWWFGK3RmM202Q0lLc1RObk5PYnN5QkdpRG9zMEUxMXRB?=
 =?utf-8?B?MWJzSFhGdGJJbERsQk85b253QWVSMkxRQkdGUGhVUHppQlZoS2Y3MGEvTHVJ?=
 =?utf-8?B?b2dhWGNKeGFMeDZTcFhQUXJualNQNklSalQ5QWlnVVluVk1RbTV6MFdxbzB5?=
 =?utf-8?B?dzhpL0pVVml0aFlBL1NvdWt5OHd1RGxYektnN2Q5dUlvS3doZGMrWDZRRUhv?=
 =?utf-8?B?cnFQVG5idjJxeS9lR2hUZ1ZtczQ5WHhNUGlsT25LZ2g3VHJpZDRlRFZ6eVc0?=
 =?utf-8?B?T0VXVTVyYkFhcjB3TTYyYnhPNXJCRVZ0UHdQSGErQTlVRDcrRlpCWGlPeHpE?=
 =?utf-8?B?cHBSM2podHJWelk2Tnk2OEJjVzVmSkpieVFLQUlDMFg2OW1lN2hZRktSdUFs?=
 =?utf-8?Q?FtrMEQ7HOiaO+EY8=3D?=
X-Exchange-RoutingPolicyChecked: qtCPeu49oJPtaaL/skK7SA7jPzbUfC7ZXrFMui0JAF+u0sYpTn7Pvl0lR8mNVm0quisigYihufybsBwaTOV9+R/EF5wCm57gaXWhuYCDmbfF8UEEbuwIA3003RJxfWuk4R8VFSYSs3ZkLyYnvdlEU6lWZg02dOMgl6lASKZmMKmciBVnUWh0xVvAekiaS1CbpF585cnF2eNgtITgwrCb5dC0OfgDUnLBaD9qUcBtDjT4MTCl+zl16oRnEd8TPBjyjmNfnAzCx78PPhSiBO1mOfnAXlr1dbSZolefIkW19l5YdbxlRR2Kqo+7bC4rS7Fyo7GatnlYv7+dNjxkgOdBbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e47e315f-8fd0-485d-dc32-08deec6e64c8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:06:41.7782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ldzy3QSg/jSAlq/MUgwrGB/DbRRAjig5JT2er7bKwKIG+c/+qCZ98jcOSBNuEzfzv63jMY7TqPYiGphesczyqRww/5mVUDfZYInodDMCOY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
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



On 28-07-2026 11:31, Nareshkumar Gollakoti wrote:
> Expose a debugfs control to override the page-size allocation mode used
> for user BOs.
> 
> The interface allows switching between the default allocation policy,
> forced 2M, forced 1G, and mixed allocation modes at runtime. This
> provides a simple way to validate behavior and debug page-size-dependent
> allocation flows.
> 
> The debugfs entry is built only when CONFIG_DRM_XE_DEBUG_PAGE_SIZE is
> enabled.
> 
> v2
> - update changelog to match mutex-based cur_index handling
> - reset cur_index when switching to mixed mode (sashiko)
> 
> v3
> - add CONFIG guard for page-size allocation debugfs support (Himal)
> - create debugfs entry under CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> 
> v4
> - reorderd this patch with kconfig patch to ensure patch builds
> - Gurding this debug knob for only discrete graphics
> 
> v5(Himal)
> - Guard all page size calls with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> 
> v8(Himal)
> - For read/show used READ_ONCE instead lock
> - to match Reader used WRITE_ONCE under lock protection
> - change modes to string format to read/writer for debugfs
> 
> v9(Himal)
> - Add an OOB guard for mode in page_size_alloc_mode_show().
>    This check makes the function display "unknown" if mode has been
>    maliciously altered by KMD, preventing out-of-bounds access.
>    Under normal operation, values set through debugfs are validated,
>    so OOB values should not occur.
> - simplify mode-to-string lookup using page_size_alloc_mode_names[]
> - use sysfs_match_string() to parse page_size_alloc_mode writes
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 78 +++++++++++++++++++++++++++++++++
>   1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 5a3877fcb0f0..8de78cd0aa03 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -614,6 +614,72 @@ static const struct file_operations disable_late_binding_fops = {
>   	.write = disable_late_binding_set,
>   };
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static const char * const page_size_alloc_mode_names[] = {
> +	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE]    = "none",
> +	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M] = "only_2m",
> +	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G] = "only_1g",
> +	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED]   = "mixed",
> +};
> +
> +static ssize_t page_size_alloc_mode_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len;
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +
> +	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
> +	if (mode >= ARRAY_SIZE(page_size_alloc_mode_names) ||
> +	    !page_size_alloc_mode_names[mode])
> +		len = scnprintf(buf, sizeof(buf), "unknown\n");
> +	else
> +		len = scnprintf(buf, sizeof(buf), "%s\n",
> +				page_size_alloc_mode_names[mode]);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t page_size_alloc_mode_set(struct file *f, const char __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	int ret;
> +	char buf[32];
> +	int mode;
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	if (size > sizeof(buf) - 1)
> +		return -EINVAL;
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, ubuf, size);
> +	if (ret < 0)
> +		return ret;
> +	buf[ret] = '\0';
> +
> +	mode = sysfs_match_string(page_size_alloc_mode_names, buf);
> +	if (mode < 0)
> +		return mode;
> +
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
> +		xe->page_size_alloc_ctrl.cur_index = 0;
> +	WRITE_ONCE(xe->page_size_alloc_ctrl.mode,
> +		   (enum xe_page_size_alloc_ctrl_mode)mode);
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +
> +	return size;
> +}
> +
> +static const struct file_operations page_size_alloc_mode_fops = {
> +	.owner = THIS_MODULE,
> +	.read = page_size_alloc_mode_show,
> +	.write = page_size_alloc_mode_set,
> +};
> +#endif
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -665,6 +731,18 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("disable_late_binding", 0600, root, xe,
>   			    &disable_late_binding_fops);
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	/*
> +	 * Expose a debugfs knob to control user BO page-size allocation:
> +	 * "none"    - default behavior
> +	 * "only_2m" - force 2M page allocations
> +	 * "only_1g" - force 1G page allocations
> +	 * "mixed"   - select 4K, 64K, 2M, and 1G in round-robin order
> +	 */
> +	if (xe_debug_page_size_supported(xe))
> +		debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
> +				    &page_size_alloc_mode_fops);
> +#endif
>   	/*
>   	 * Don't expose page reclaim configuration file if not supported by the
>   	 * hardware initially.

