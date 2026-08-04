Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F790C55ABF
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 18:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B425110EB76;
	Tue,  4 Aug 2026 18:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZihoDPyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810DE10EB76
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 18:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785869564; x=1817405564;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0Jdjxed2mmh3YY1X8dXn+sp36nXCQVEco/1Qb8QW41Q=;
 b=ZihoDPyp7jCX4eRMWyj8GTKcHmLUZh9fjWbLQ9oWUyXdXn1oqBIPM+lg
 LuXeRc6qt3+s5/JefCxrj7F2E+xkfLUX6lN7uiKrLZtxE+xcHcdokkQof
 fCXkNpMaOgAtNq2D2QxoKs54VvnxxoB2bmqY7uy00ty38D2Lf39Ptpu+N
 j7O8beQntwBr++jaiE3kjI2h5pQSb+OgpaSaLMZRU3aJn9y8ORgS+aCoD
 AoGVM7Yb0ToFDhCXnU/d5ile6cQ3ITSqfdiGDZC1WT28MjsQoX+x9M4zu
 XdRsiZqJGszxyV3ZBOl26NcI8iWgHFnxOgG7050+weiQe3J27w6rE1FwR Q==;
X-CSE-ConnectionGUID: UMjO0Y/jTvSyZPwo9QLTuA==
X-CSE-MsgGUID: UEw20I9ySKqQI/0QGMMaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="96789002"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="96789002"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 11:52:43 -0700
X-CSE-ConnectionGUID: h/wXFymBQFS03eyoUzcjLg==
X-CSE-MsgGUID: 0ie7aibUS5COtYYM8oEAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="258245413"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 11:52:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 11:52:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 11:52:42 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 11:52:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frru8sYmdybjDdFzJ6b0W+AnBs6pdv6MpJbNZgxf7ECsh0QjOrWr6JOnIQKM0aEk8EMAWKLmLl0w6H2++smO3D5QyeWFW6su8W0tUFSgi8fY9iWVU4mpSbaAy3qWNGkrrYhnHvePkiCL8STiYiWKOl0LmSEdaKBHrx80zQQl82ao9ve/gQP4A1KxzmrnvI6BMj5Y8aucJFc/tK5LbC9K6PhznK8mDYOg5bociF8PIOyWXxw6am6H9Jl9SD0xOUAUgUC775AL9nBhE3X4fx67hgzMW0KLUmS2Vxj3CxYTCUmrmsHBucvVcBKOu8LT9+aq6vnERBIxIbk66GC3zRzI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzVSgX0OHa01GPFSeAbLroph3Zo3Q1BdbMz19jvh8pU=;
 b=QZd8Fj+FoGz1hTPe3f/2WqYrsffWRLCiVDN5GDWfmRY/vV4PV02J9+ZN4a6txrVdZD+u3sISFbN4LpSXfB/6+1F3PKeQf6MQvl/idmGsX2a79s6HDv9HT90BZJK1PfrqrKZ6xFBoVrWVAnyrGvEV1PgVOyGUhrM40jOmEaGttAwio0zAsKAzAe4vzGaKhhCHUP94kMzbWJBxkpNusWth43Q4AW7qol6mAhfkwR+Z/zQz4XrGY9d+uY9KSIvLAZCdOhlsVvHVLqkSTBPf2Wmbj59SFSluXHwcCjEpK09i7bjX1Ea6wIb0OTn/kMkyNRZwGRGg10Thz7sT57m3JAi9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5)
 by SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Tue, 4 Aug
 2026 18:52:38 +0000
Received: from SA2PR11MB5082.namprd11.prod.outlook.com
 ([fe80::96a1:ce7b:b3b4:6026]) by SA2PR11MB5082.namprd11.prod.outlook.com
 ([fe80::96a1:ce7b:b3b4:6026%4]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 18:52:38 +0000
Date: Tue, 4 Aug 2026 14:52:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Raag
 Jadav" <raag.jadav@intel.com>
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
Message-ID: <anI08vDXBbEIL94j@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <ef2906e3-1070-4de3-9de0-ed651fc7cc82@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef2906e3-1070-4de3-9de0-ed651fc7cc82@intel.com>
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To SA2PR11MB5082.namprd11.prod.outlook.com
 (2603:10b6:806:115::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5082:EE_|SA3PR11MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6049b9-5081-4395-6a76-08def2598dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|18002099003|22082099003|11063799006|10067099003|5023799004|6133799003|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: csHNpDnk7og3ua+FdM5MxDO+2bHwEgYy+7y2Cu+gKWezMpyMwuz10urh/ScXhpWx/RVYdRsD3KUL0og/ZD8MQlagQ8slZ7iu/i4pMVKY64Qj2hF7YqsKLGmYO8hEKC1cSMj0EnUJE14+WR7wFdYV8yFWvAyrJCzp8e1iK0FsJ0jJT4nEAbFc/hFe8NQ0deHjRHxv3+/5Z+0JerpZC0OEN4HRxhkiAWzV8ZeN6mH+48v02AkzBlWj/yo4YCjYHNdTnMRpiySGkjlfIQGLBTPpWXGbFzmo8m818gRnr62UV9xoYcBosWHP3LU+mqMaunsx7UZI2+xYyU68c53NlbLa1+6he2v5qkoMDvoQLHNaS+vcjTMZ0/bmXC1peR2klM65NNn1RNglcTj9aeg1nvR/qSVvcEF6032lAYqFtEyzY/Nd5vdNZMSxlb0/Gugb733uXRCpQLHE1dYPRkwiPJmNdMsrdp7sDgvOFkUOhgA5ZVMXK/sLeSclAzlAAGPddI7WTmRMstyLieAQ6rjm/4NvWYmSvxMYEuLHVvOK5CAkMU27eLR19U0zQ/4AnRuRNUfzEa11C+E5EdZ6bKN5wL0lvA65mmlvNaWZfWp9EQdfy3GbqOpSAEM1oVRBOJuBjlRaVYp8ao/EnQWhLErAWZKYYWaW1jyA0kD2LM+U2bjzeS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5082.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006)(10067099003)(5023799004)(6133799003)(4143699003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkUyVTdOV3lCNVRvOUZoTXRJVHRvaUx3V25mUWRvSzZVandLNUhMang4N0dY?=
 =?utf-8?B?ditMbmIySXF2ZE9lU2U5b2xWWXl5S3VlK0JmTXJJZ085ajJPSVl2VkhRWjVl?=
 =?utf-8?B?V084cVQvZlpyT1gzNWMwc29OSHBsc0h6cm5jZks2YVN6bTU2dnBWZllhQnhS?=
 =?utf-8?B?YTFZNUppM0IreHRsNERwc2dla1ZEbWE5QXFVcFdFbHJGQit6YWVJdENPZndz?=
 =?utf-8?B?QXY5Y1ZZQW5FZXJYRWNYRCs2Nk91b0VweWhqVVNjVkVOOFFXeWJ2bERNTTN3?=
 =?utf-8?B?UHBjNWZpWjJoandQb1JhRXI3aUN4aW5OTGtmejdjb29aVDlOd1I3eDRXK2Ir?=
 =?utf-8?B?S0ZmOW5FdCtTZHh2UG5CZFFXcGFBQmNWdW5nSTA3ZTVwTUFWUlRZS0g1emEv?=
 =?utf-8?B?bDFkZGJ0NUZHcU4xaGdaRFp2cVNTSVhzZEZwV3d3QzZZMk0yeHJ3REEzVnJT?=
 =?utf-8?B?MTh6cFlFNnhzR0lUOTV0M2F2SVRqY05VZWlNN2cvRWc5anR2MytnWEg4bVh6?=
 =?utf-8?B?UUp0VGVuZUVKeTZxejkzUnFLMTk1bk45UGM1ZUNhZmRhWmtRWkU1SWtTTTZa?=
 =?utf-8?B?OGNGNjAra0ZFZThnV1BYM3JQS01peEs1NGg2K2s2ZElXYXh4K1ZEZTBDbEJk?=
 =?utf-8?B?UERrcUN5bjdNWUJoa21TdS9xR0hlUlRsUDRlWHB2Y3MwY0NQU3p1cXVOWTVI?=
 =?utf-8?B?bHFBdStLN25rdzM1d210K29vN3N6NW8yTzZTWllTWjVhb1hOL0RpS215L3dp?=
 =?utf-8?B?eVY3V0FpOGp2OWNqelVocVVmZUJJOHBDaW9nbjB3Wm5tVE9abmNLV1NoeFJG?=
 =?utf-8?B?VHo4QnMvU2ZOVjZ1TVZDSDVrQ3FCd1FVd2h1Nm9XQ1RTaDJwc3g0cWNaOXRE?=
 =?utf-8?B?VSs3OHl5MWdoUDdSbHJicUt2aEVseUh2bUNXVXlLbHNsdkU4MFpRaVJtaXNi?=
 =?utf-8?B?d0Y0dWs0ZE1yY3lrMkloQWd6OWtPaXlTQWV5aWhFUkNjdUFSQjN5U25ESENP?=
 =?utf-8?B?SWh3c3lSVVViUFJpelorbElKV0lBeGkyNVR4eFRwMm9yNVkyRVJrY2RLVC8r?=
 =?utf-8?B?cHlmbHZTdzR1UmpHSi9KdyswMzBuNEp2ZnNLaEZKb2JHTFdYc3ZQaU1GL0lZ?=
 =?utf-8?B?eWZoOWs4RUVHNFFIVUJ0OEZXSUpRdTFEajlWRWY0ZjU0TUd2KzhIQ1FjRjBM?=
 =?utf-8?B?WlRFb0tQUnV3M2VSRjg4V210V2tZMUpJUnpnRTRWemNVN0NHZzM2bnh4SVhK?=
 =?utf-8?B?ai9hQXFKeVJSRWswcG5lQjFsQ2wrb2dTelZPM3dVRG9XVFNLS2Rka2xGakhF?=
 =?utf-8?B?TWM3ZitLYzcxbkxnMUtPSHk0eExvTXA0am5rbUEzRFE1b1FPNFJ0NVhYKzlz?=
 =?utf-8?B?T2dmUDVaanN0UXM0dUxPbldFeW1OQmFFakhuM3ZYdnY3WjJCdFArMjAxRmRF?=
 =?utf-8?B?YllIbUxVSHd5R3pYNDJkZlY5T2N6dnFQVlozajN2RDhLMGJ1M1NkSDJ6bjFR?=
 =?utf-8?B?dGthbzRjK3Z3Z1M0aFowTEhVMldWSzJMazFGM2FId2w1RjI2VnRkZkpzUlpr?=
 =?utf-8?B?RDlvK2xGSXJqczZnMmp3WFVJRlNBUzl4T1BJL2Q5MHpxTnBMalBtYm05MVcv?=
 =?utf-8?B?Yjh0eGxVYjVPalNBQXJUamN5bkk0VStiNzd4MDlnZUdqUnF1WFFIeHBBVEVl?=
 =?utf-8?B?S2RGWEt5TnI5UWp0amhiL2YrcmlJNDJhUHZ3MzFsRVJ5WkhHMmdybmNsQ2pn?=
 =?utf-8?B?TVppeTdVa09tWXpXTU0xemgrWFZDTzRrS0Nwa0RaV2FJc01kdmlwV1lBSlBX?=
 =?utf-8?B?OUhqZVVZN3NaQXFiYmpTY0MwaTVZYWoyaG9kUHlQbnVvL054OUZ1cTBVb2RC?=
 =?utf-8?B?VUk3WW1GRVl3S3pIcWZnY0dpaWJhOFFZd203YmYyNUtRMjJDSHhBWDBpeTBY?=
 =?utf-8?B?NXdLMVdJR0FQZ2tjeWI3ckQvRlRWcjhocDBnSzhDMWZVQVI3VmhRQ3V4MVRR?=
 =?utf-8?B?WjNBVzVua1BqS2NQaGw4MjB4dHFFVTVqd0FJWiszeUM1Q3pTUmltWUV0MzBl?=
 =?utf-8?B?ckR3aUVac3hNaXVlYkMzcDFFUU1NaEVQditqcTcvSHN1ZFdZWnpQNkpkTllT?=
 =?utf-8?B?NG9WaTlNODdkekszSUFPL2RPeWgrNUluSEFFdGxDNTFVaVllMmo3anFpVWI3?=
 =?utf-8?B?WG1Sc0I0MHJ5OTZVSTBPRjFxMklrSjdUN2szZkpqSm81TkdmVHpKMk1iWkg5?=
 =?utf-8?B?RGtkVndQaE9oQ2JDY1d4U1lzb1BPU1lzdklKcHdhTUFxa3diVFFJalpnYmxk?=
 =?utf-8?B?bHNWdVRIczlKZmlBN0xqSU1rSFVBNElSSVV0SVFvbW1LaW5RMDI4QT09?=
X-Exchange-RoutingPolicyChecked: bE1xs9NUZVxNW04bQtObeRxovGi7Zq791sz4eNc8ElA4aVX7kiuh5adiMY9ahTgy3Uq6lDe+O1CVEMLR1Cl0LOYIMfn4BAbtQ7IrBYtw6+/AINh2KOiwEvGZB79MUxTseD4rPf00MRuD4QYGARCMoHBXifhGOkIcasf2fBwPyyVPtHFxN7Ln9cA3QdYcTNhQIxGi1nw0vd3CiZMk+cE/3UJiNMiTiREp73jH9j4Gny2PBDPWopwZuXg6vTINFggVI7TMEMW/z/CpnsgTFTNZv0VB0uMSBZf/sAF7meU5u+ykMBMVn8ozU0ZUDBuUt3A7XaIhzKw08Xh7PakxTiCGig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6049b9-5081-4395-6a76-08def2598dc3
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5082.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 18:52:38.0853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70wMMZ6Df+uGqc0KnWZ+vTo/5syq1yZOIUqk2l9UEzqciKIt4GeggsUmCtc1K1NyUIiA5Y8MoymCq6PRtNUgCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
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

On Tue, Aug 04, 2026 at 08:30:47PM +0530, Tauro, Riana wrote:
> Hi Mallesh/Michal
> 
> On 30-07-2026 20:50, Michal Wajdeczko wrote:
> > From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > 
> > Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> > strings that have no stable shape. That is readable for a human, but it
> > gives fleet tooling nothing durable to match on: the wording changes
> > between releases, lines can be rate-limited or dropped under an error
> > storm, and there is no consistent way to ask "which recognised fault
> > just happened?".
> > 
> > Introduce a signature identifier (SIGID): a small, stable integer that
> > names one recognised Xe fault situation and serves as the primary handle
> > for triage. A SIGID maps, through published end-user documentation, to a
> > description and a recommended action; the driver only has to emit the
> > right SIGID next to the usual human-readable text.
> > 
> > Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > Assisted-by: Copilot:Opus-4.8
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> > Cc: Yoni Levitt <yoni.levitt@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Raag Jadav <raag.jadav@intel.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > ---
> > v2: CORRECTED is still an error (Michal)
> >      prepare to decorate dmesg with comp/loc (Michal)
> > ---
> >   Documentation/gpu/xe/index.rst        |   1 +
> >   Documentation/gpu/xe/xe_sigid.rst     |  14 ++
> >   drivers/gpu/drm/xe/Makefile           |   1 +
> >   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_log.h           |  20 +++
> >   6 files changed, 354 insertions(+)
> >   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
> >   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_log.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_log.h
> > 
> > diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> > index 665c0e93601c..0247a255f7e6 100644
> > --- a/Documentation/gpu/xe/index.rst
> > +++ b/Documentation/gpu/xe/index.rst
> > @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
> >      xe-drm-usage-stats.rst
> >      xe_configfs
> >      xe_gt_stats
> > +   xe_sigid
> > diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> > new file mode 100644
> > index 000000000000..45d84a62f185
> > --- /dev/null
> > +++ b/Documentation/gpu/xe/xe_sigid.rst
> > @@ -0,0 +1,14 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +========
> > +Xe SIGID
> > +========
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > +   :doc: Xe Error Signatures (SIGID)
> > +
> > +Signature Identifiers
> > +=====================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > +   :internal:
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 67ada1d6c2fb..7ac3954737f9 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
> >   	xe_hw_fence.o \
> >   	xe_irq.o \
> >   	xe_late_bind_fw.o \
> > +	xe_log.o \
> >   	xe_lrc.o \
> >   	xe_mem_pool.o \
> >   	xe_migrate.o \
> > diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > new file mode 100644
> > index 000000000000..99717fdf74a6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > @@ -0,0 +1,183 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _ABI_XE_SIGID_ABI_H_
> > +#define _ABI_XE_SIGID_ABI_H_
> > +
> > +/**
> > + * DOC: Xe Error Signatures (SIGID)
> > + *
> > + * What SIGID stands for
> > + * ---------------------
> > + *
> > + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
> > + * that names one *recognised Xe fault situation* -- nothing more. It is the
> > + * primary handle used for triage: a SIGID maps to a human description and a
> The SIG ID maps to a report site as mentioned in "How to pick a sigid" not a
> human description.

Indeed, perhaps with simple:
s/maps to a human description/maps to a report site/

we get some consistency?! 
> 
> > + * recommended first action. A coarse first-order action is documented in-tree
> > + * per SIGID (see "First-order action" below) so the id is actionable on its
> > + * own; published end-user documentation refines it with finer, cross-product
> > + * detail. The driver's only job is to emit the right SIGID next to the usual
> > + * human-readable text.
> > + *
> > + * Why this exists
> > + * ---------------
> > + *
> > + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
> > + * strings that have no stable shape. That is fine for a human reading dmesg,
> > + * but it gives fleet tooling nothing durable to match on: the wording changes
> > + * between releases, lines can be rate-limited or dropped under an error storm,
> > + * and there is no consistent way to ask "which recognised fault just happened?"
> > + * A SIGID answers exactly that one question, identically across driver and
> > + * firmware versions, and (eventually) across other Intel devices in a node.
> > + *
> > + * What a SIGID is (and is not)
> > + * ----------------------------
> > + *
> > + * A SIGID names *which situation* is being reported. It deliberately does not
> This should also be consistent with "report site" instead of situation.

Agree.
s/situation/report site/

> > + * encode the detailed reason or the outcome. Those are carried alongside it::
> > + *
> > + *   SIGID    -> which recognised situation is being reported
> > + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
> > + *   errno    -> the failing operation's error, shown with %pe
> > + *   message  -> free-form human-readable context
> > + *
> > + * Severity is independent of the SIGID. The same situation can be reported at
> > + * different severities depending on the instance and the recovery taken, so a
> > + * SIGID is never tied to one severity; the reporting site chooses it by calling
> > + * the matching xe_log_*() helper (see xe_log.h).
> > + *
> 
> It'd be more intuitive for readers if section "When to use SIGID logging" is
> moved before how to pick one.

It makes sense to me.

> > + * How to pick a SIGID (the uniqueness rule)
> > + * -----------------------------------------
> > + *
> > + * Pick per *report site*, not per incident. Each site emits the single most
> > + * specific recognised situation *for that site* -- so the question is never
> > + * "classify this whole failure", it is "what does this site detect?", which has
> > + * one answer. A single underlying failure therefore legitimately produces a
> > + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> > + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> > + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> > + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> > + * follow a fault from origin to final effect; it is not a duplicate.
> > + *
> > + * If a site does not match any defined situation, keep using the ordinary
> > + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> > + * or over-broad classification is harder to retire than a missing one. When a
> > + * new situation is genuinely worth triaging, add it to the list below.
> > + *
> > + * Scope: software-emitted signatures only
> > + * ---------------------------------------
> > + *
> > + * This header enumerates only the situations that the *driver itself* detects
> > + * and reports from software: probe abort, wedged, survivability, driver-
> > + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> > + * These are the only values the driver assigns.
> > + *
> > + * Signatures that *originate* in firmware or hardware are a different thing:
> > + * they are produced and identified by the firmware or the hardware itself
> > + * (e.g. via their own records or error counters), and the driver merely logs
> > + * them as they are given to us. They are deliberately *not* enumerated here --
> > + * minting a driver-side id for a firmware/hardware-reported error would only
> > + * duplicate an identifier the reporting layer already owns. The two
> > + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
> > + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> > + * observed a firmware problem, not a signature reported by the firmware.
> > + *
> > + * Numbering
> > + * ---------
> 
> This section also needs to be on the top. It can be missed if it is at the
> bottom of the document.

Also agree.

> 
> > + *
> > + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> > + * in the order the situations were introduced. Values are stable: once assigned
> > + * they are only ever appended, never renumbered or reused.
> > + *
> > + * A retired situation is deprecated in place, never re-purposed.
> > + *
> > + * First-order action (resolution buckets)
> > + * ---------------------------------------
> > + *
> > + * So that a SIGID is actionable on its own, each one is tagged with a coarse
> > + * *resolution bucket*: the first thing an operator should do on seeing it. The
> > + * bucket is a stable, driver-owned hint; external documentation may refine it,
> > + * but the in-tree value always stands on its own. Every new SIGID must pick a
> > + * bucket, which forces the question "what should someone do about this?" to be
> > + * answered up front. The buckets are::
> > + *
> > + *   COLLECT  -- capture logs and open a bug report
> > + *   RETRY    -- transient or already recovered; watch for recurrence
> > + *   UPDATE   -- a firmware update / flash is required
> > + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
> 
> 
> Do we actually need resolution buckets defined here? RECOVER or UPDATE seem
> a bit vague since states like
>  WEDGED/SURVIVABILITY have different ways to recover depending on context.
> Wouldn't detailed resolution steps in another
> document be better than in logs?

Fair enough. I would prefer we have some recommendation for a consistent
end to end story without depending on external docs and all.
However I do agree that the vagueness in some cases here can defeat the
purpose and mostly the conflict with the wedge.

Aravind was already complaining about these buckets. So, perhaps let's just
remove. But also for consistency we need to change the rest of the text above
and below:

- drop "maps to … a recommended first action … 
- Delete the whole First-order action (resolution buckets) sectio
- Strip the [TAG] from all nine enum entries.
- Drop the dmesg note "the bucket … is not printed on the dmesg line.

Michal, what are your thoughts?

Thanks,
Rodrigo.

> 
> > + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> > + *
> > + * The bucket is documentation only -- it is recorded per SIGID in the enum
> > + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
> > + *
> > + * When to use SIGID logging
> > + * -------------------------
> > + *
> > + * The xe_log_*() helpers are for these recognised fault situations only --
> > + * important, operator-relevant faults and events. They are not a replacement
> > + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
> > + * using them for ordinary logging would dilute the fault stream. Not every
> > + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
> > + * a published situation.
> > + *
> > + * dmesg vs. the machine record
> > + * ----------------------------
> > + *
> > + * The dmesg line stays close to a normal xe error message so it remains
> > + * readable for admins; the only stable, machine-matchable token on it is
> > + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
> > + * text may change freely, and lines may be dropped. The durable record for
> > + * tooling is the CPER record carrying the same SIGID (generation is a planned
> > + * follow-up).
> > + */
> > +
> > +/*
> > + * Top level Intel Error Signature Identifiers.
> > + */
> > +#define INTEL_SIGID_INVALID			0
> > +#define INTEL_SIGID_GPU_START			100
> 
> why does the sigid start from 100?
> 
> > +#define INTEL_SIGID_GPU_END			999
> > +
> > +#define INTEL_SIGID_GPU_XE_START		100
> > +#define INTEL_SIGID_GPU_XE_END			299
> > +
> > +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
> > +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
> > +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
> > +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
> > +
> > +/**
> > + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> > + * @XE_SIGID_SW: Software component failure. [COLLECT]
> > + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> > + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
> > + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
> > + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
> > + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
> 
> Pcode or sysctrl errors cannot be retried. Pcode init failures cause
> survivability mode.
> RAS sysctrl errors require a secondary bus reset. We could have other
> firmwares in future with different
> recovery.
> That is why it would be better to drop resolution buckets in logs.
> 
> @aravind thoughts?
> 
> Thanks
> Riana
> 
> > + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
> > + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
> > + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
> > + *
> > + * The situations the driver detects and reports in software. Values are
> > + * numbered sequentially, are only ever appended, and are never renumbered or
> > + * reused. The tag in brackets is the default resolution bucket (see the `Xe
> > + * Error Signatures (SIGID)`_ section).
> > + *
> > + * Firmware- and hardware-originated signatures are not listed here; they are
> > + * logged as reported by those layers.
> > + */
> > +enum xe_sigid {
> > +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> > +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> > +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> > +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> > +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> > +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> > +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> > +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> > +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> > new file mode 100644
> > index 000000000000..70a41bdf1a01
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_log.c
> > @@ -0,0 +1,135 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include "xe_log.h"
> > +#include "xe_printk.h"
> > +
> > +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> > +			  u32 component, u32 location, const void *data, size_t len,
> > +			  struct va_format *vaf)
> > +{
> > +	/* TODO */
> > +}
> > +
> > +static bool is_hw_sigid(enum xe_sigid sigid)
> > +{
> > +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> > +}
> > +
> > +static bool is_sev_error(int cper_sev)
> > +{
> > +	return cper_sev != CPER_SEV_INFORMATIONAL;
> > +}
> > +
> > +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> > +{
> > +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> > +}
> > +
> > +static const char *log_sev_prefix(int cper_sev)
> > +{
> > +	switch (cper_sev) {
> > +	case CPER_SEV_FATAL:
> > +		return "FATAL ";
> > +	case CPER_SEV_RECOVERABLE:
> > +		return "";
> > +	case CPER_SEV_CORRECTED:
> > +		return "CORRECTED ";
> > +	default:
> > +		return "";
> > +	}
> > +}
> > +
> > +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> > +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> > +
> > +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> > +{
> > +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> > +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> > +	else
> > +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> > +}
> > +
> > +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list args;
> > +
> > +	va_start(args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va = &args;
> > +
> > +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> > +
> > +	va_end(args);
> > +}
> > +
> > +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> > +			   u32 component, u32 location, const void *data, size_t len,
> > +			   struct va_format *vaf)
> > +{
> > +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> > +	const char *sev_prefix = log_sev_prefix(cper_sev);
> > +
> > +	/* TODO: add component/location details */
> > +
> > +	if (IS_ERR(data))
> > +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> > +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> > +	else if (data && len)
> > +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> > +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> > +	else
> > +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> > +				 sigid, sev_prefix, hwe_prefix, vaf);
> > +}
> > +
> > +/**
> > + * xe_log_emit() - Emit a structured SIGID log entry
> > + * @pdev: the &pci_dev device
> > + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> > + * @sigid: signature identifier, see &enum xe_sigid
> > + * @component: component identifer
> > + * @location: location details of the @component
> > + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> > + * @len: length of the @data in bytes, or 0 if not applicable
> > + * @fmt: printf-style format string
> > + * @...: format arguments
> > + *
> > + * Emits a dmesg line that includes a single stable, machine-matchable token
> > + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> > + * when @data pointer is set, either the error printed with %pe or a packed hex
> > + * dump of the @data binary blob. The dmesg line will also include printf-style
> > + * text message.
> > + *
> > + * Note that the full dmesg line, with the free text message, is only a debugging
> > + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> > + * The durable machine record is the CPER carrying the same SIGID.
> > + *
> > + * Note: generation of the CPER record is a planned follow-up.
> > + *
> > + * Examples::
> > + *
> > + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> > + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> > + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
> > + */
> > +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> > +		 u32 component, u32 location, const void *data, size_t len,
> > +		 const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list args;
> > +
> > +	va_start(args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va = &args;
> > +
> > +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> > +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> > +
> > +	va_end(args);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> > new file mode 100644
> > index 000000000000..d475e816ee0b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_log.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_LOG_H_
> > +#define _XE_LOG_H_
> > +
> > +#include <linux/cper.h>
> > +
> > +#include "abi/xe_sigid_abi.h"
> > +
> > +struct pci_dev;
> > +
> > +__printf(8, 9)
> > +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> > +		 u32 component, u32 location, const void *data, size_t len,
> > +		 const char *fmt, ...);
> > +
> > +#endif
