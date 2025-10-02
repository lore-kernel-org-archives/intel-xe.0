Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DBECAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49BA10E1BB;
	Thu,  2 Oct 2025 14:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRL7qsDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D70810E1BB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759416165; x=1790952165;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=adD/Zuwa/qGQwGfu7EoGBCWyPzEmJ5hDU0hvwRX734M=;
 b=NRL7qsDjzZ/ZMXm6JwZ8QiBT+WZZvu3nEYCXNAY8PioAUKCYNjxb6jyI
 K2J2+1SK9AWQtmeOjxj0PA+hdap9a+wpLqjQksLKyGuhWnmd+ecnAo1Dw
 0JPsS9CoBGZP7RoUM1rETX+HjltjMBTTe7LXXtvA01/o6BOYSucNoMS06
 h5R5HfTxZ6z8Ozmgj4lW9Mvynp4qTcTv61R2lti6e0QxXsl5k+nEOosEm
 IEJ7R8+YSVuvJ/7nEcmvpS9qfTrBe/ITE+09ZORchpLDilEFcxrbIgnKd
 D40oMuitcP57zS5hS5y39TemvHlibuZFiDLMt3ogVZi1NsW6BzBlmW3rc g==;
X-CSE-ConnectionGUID: /EzEGgWgRiWkqAUpymFRFQ==
X-CSE-MsgGUID: 171vDKPkSVe7p0s+nnlgGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61801875"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61801875"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:42:45 -0700
X-CSE-ConnectionGUID: rdaiiXL4S9yRDwakK6sPSg==
X-CSE-MsgGUID: QZQBHRHQQWWhYfdPkeH7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="179074930"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:42:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:42:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 07:42:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHeECg6oqcHhiXcoHeafbwSJpCF7thCLTg5wHMuw6WfUWhVp7NVfrCI52qowkV99goZuuzKjUcie2GtpiHp2MO4Pt79GL9KKwzwG7tg9lFE1rkjAmYfNQ7ZPIstUzOU4yMBbLtRUbAf93BHncs/Un3E8GJHsOe5/C4uu2g3HLzGKZ1AwuUEYFZ9hB6X1AV0GDDr1StiR8c6fN6gvMPOeBN0SBZ07863IBMoPbH0+udsYi7+Y/WG4c7dRiuNZFn/ysk1wUYMgEIvXcaveVGKQCrLicpN9T7xEMjjSF4rpTA2yOefkX36L+IjKceou3YHo8+QZjWbq3w17Nx7QTKrqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nU18paj6UItAtKIu/DxirE4FAV35gDugeFhBF9z+Kks=;
 b=tdePhlopAmJIu2/25mvPljggaHVzTk7ZwACXtVyerzgL3aJfg6fhUogzmTSL41op0Bc7rnEx5gm0cTzPst5BwpSBl8NctukyRn3v9HWUd/zUWbHBV3/Az5lg0i80Cde1EX19PToqdfwxD6hOcR8ETvoET5lu9f6FMdCtFUwujr3M9vENsdMlXHzMdqtJAcnSvuaCxkGtgUlW3EhmLLMZ8l+HOVW6IPCGjWEKSI6SAmP8D4fFI3LcwQ9hai5GwAnj8ZVffehMv4gAORWCY+frvZqN4znYdKo8CktH/JCH8456JcWX94nfkS2kFVCseop1knxK0HNTJ4pM5rjTeVQI5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 14:42:37 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Thu, 2 Oct 2025
 14:42:37 +0000
Date: Thu, 2 Oct 2025 10:42:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <matthew.brost@intel.com>, <carlos.santa@intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH v4 3/9] drm/xe: Add a trace point for GPU work period
Message-ID: <aN6PWaJWCMz2lFsv@intel.com>
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
 <20250926104521.1815428-4-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926104521.1815428-4-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 572fd939-a292-4af4-709c-08de01c1ee29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?77ezynQo6RmCoi/D/hzl98KM06GjBlorg75y2wWRsgZe1dQuhaluGxNwPM?=
 =?iso-8859-1?Q?h2L3O5wg1KKMQRLkb/FpTF8h2aEB3PNKSUV0AJDqJ2L0fn4Fkvun2TuX7x?=
 =?iso-8859-1?Q?hR0PfmL9rx4Duq83OtA6JTsoc4cOZXSsE4wRdLKmgoLuJIjCUaIE9tQ4+B?=
 =?iso-8859-1?Q?oBbanlVA3Cu2sXsN2DxRHpIg7VGLcjkOV0SdEeX5jc7fTybZwAXrgxWFjP?=
 =?iso-8859-1?Q?ivNTPWZoS40WlSEKc/uVzmLRDF6LoR16YouXJ8ClXbJVXfSJ7U9dOMtUBp?=
 =?iso-8859-1?Q?fKmGAtsu0J5BYthX20meQ/hld9mDBeDxjTrZGk2rcHhbGUnByCpokqe2/L?=
 =?iso-8859-1?Q?sOCDWpow+NCqGxEy5V+jbcoDNr+M8ekpu227WMSOAqYM8xM74Bd92f5nlB?=
 =?iso-8859-1?Q?FgaEorYzetH6cEoxPvlMTaVB3/8ZOEusrah1Jk7V43EoPgZe6wut4qJAOT?=
 =?iso-8859-1?Q?RR6eXewBYT2ztyyx8imIKHCQavaeMGGnEwRBRDCYFkHfd6m2NYkmErImF8?=
 =?iso-8859-1?Q?F0rXK1KrsyhhGqpS1+jDp4H3qjOIp5Dm+i9fj3jnog/J6wlHB5kULwysTV?=
 =?iso-8859-1?Q?UK17UQoas/ZI7gt314yyN+uztVbWULQtfW29icZODdT1QY82hCNc5sQXvG?=
 =?iso-8859-1?Q?21iCULv4Uy4oFsFKNmA4KjCGe6644m2LMGT2PMhrm6pz02KS/c9CxK3x9H?=
 =?iso-8859-1?Q?gBv9e6RLFkCZoPGFIyMRV0ss46PHKYa1O8O5dUPO1JwoebCAzK/8zCmAXz?=
 =?iso-8859-1?Q?5ADRQziPLIGTBAo5MxMLXGHbpCKnoHlqPF69D2075y4RPNuDrQDX3btztc?=
 =?iso-8859-1?Q?EDxRpmqWnW+2PHoazgVDBiPkwHmdryoXq6cYv6MzMOz+sD9kbKg0bJ3LYy?=
 =?iso-8859-1?Q?OfBiuWJraAPYYSAHdzs2XuoyVR8gkUCxv34m80HYHCLwZbbnYA1POL9Gww?=
 =?iso-8859-1?Q?+kLjufU3VyZx0Zvivxjh2yhuOxB8Hh3N13XubBg7wXyqJxyMPtob+u2VbI?=
 =?iso-8859-1?Q?b0g6qX4sUSakAhOM7VkCqq/RKg9gv1PtJHnhD6l4qoCSG9NAiJ3aa9SyMi?=
 =?iso-8859-1?Q?etxT+KpZVsbx8W4LzWSd82dlo/k7r0lnDBDKm0XVxGZvtzDPZuPufmU16Q?=
 =?iso-8859-1?Q?gIPKQyIJiUJDKflD6m/dtBS2od8+ENolesUcySGnwTsPWsphe9nqJf3Siq?=
 =?iso-8859-1?Q?dWzSulCvCSds1XX5KrCiN/EALeWD4t3tapU6wxlEKDdhkKeAKzUaGll2ZV?=
 =?iso-8859-1?Q?aIMNCy/mKOond514wVJ9n+pD3d6tXqOEPeNqSaEw3KeC1xy+ls6gDoVpml?=
 =?iso-8859-1?Q?qxGP1WZJCoaZPhNBi1oJ1NnI6Zrnj8bU4ZZHL9LMMXHIZ2QaUNurpODoGm?=
 =?iso-8859-1?Q?zlvAOUtsoDDMPHULmtxBg9WJs9gaAjPpYQN3/ZjJB+B9IHdtYVBiDCDNsl?=
 =?iso-8859-1?Q?gZEd+Ul8vk4HrKHrwpeH+unyfF/vGSyckHIHDi4wP3tjM+f7Re4i2UGoDB?=
 =?iso-8859-1?Q?peNYsaUBW0JPyYIGRQwgkC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hN5KLrlFs7jjahfaKLrPk9t2E3l9u0R64nqnYLf6wZaoOQ4+72E93b9PtV?=
 =?iso-8859-1?Q?KRZBmpp9QocxjOr6g2zgKAw4p+NYtp27f/QDIpo09cmBFZGIlzto0VjfqX?=
 =?iso-8859-1?Q?6ZL26e+J6ZXQlNqaIkR8FBNVNQXMBT46nOYIyYBEWZ+31XXRqI0au5hZmE?=
 =?iso-8859-1?Q?sqznlHhKlJKx6FIwQZqmylw7GU3QlPEl415Otq0kj79wQyc1EWRbOFdLtA?=
 =?iso-8859-1?Q?p7+3jstsetm/rRC5IA7dcFEwHGO7JFKmpfv2MIxtju837Ij+56PKel+8xC?=
 =?iso-8859-1?Q?I/A9uU8KNs0qoOsWQpEED/C8xo9YO9lz+vwaMVHSmBsfO4kpDTEpixgKse?=
 =?iso-8859-1?Q?QAfFU4icUB/NEAjODfKlY+jT2B1Iul+5KceCi5GeT8f4SuF8CKjIJwbMqU?=
 =?iso-8859-1?Q?gS1jWlgqWoknE0zhziwdwSMFUqDcS+MeheLMTvoNBjBA5ccxOp2KAJoYgj?=
 =?iso-8859-1?Q?SOP+0i27KDHB0yq+0ftLZFb20z6Dj796xfe/eW99GN4Ilde/XvZ1cHAesZ?=
 =?iso-8859-1?Q?KDSzSBr/+E/OmkX+PCXP4ds/rY5rvexfukUv80JCr2A/Xadayk0UztYG9Y?=
 =?iso-8859-1?Q?4CnyNSYqltIfQJVfPp7pjQC7JAAxOsTf1pd2DSegssoU8uOXnXO4ZxA1OY?=
 =?iso-8859-1?Q?DhyWJSN1nFOqaH/1QsO+7SjdFc8KLU7B3bUOHfZme/hZXn57+DPtXUR/9Q?=
 =?iso-8859-1?Q?Xf5m7xfVGly+QA58lY7A/LrrWN/euxg3gDs9nypwrqxr15eJj8yzF3x0Sx?=
 =?iso-8859-1?Q?YLcL+OsfIbcn5GvMEZn/zMcGTsg/wRxJ0LUtp/6dRSz3+BJh9aGiVuToB1?=
 =?iso-8859-1?Q?29FgpPfvI2OR/ziKcWgWRbpKtE60Pb5WMRUWNOFQp5+uD+g+vKajOnomtF?=
 =?iso-8859-1?Q?RqYC1denS+/jhFYPCYsjl9oLJ8v7qESDolRk4YnC9tATLenA7a0dbSPHs1?=
 =?iso-8859-1?Q?1dOqwM+3vBhZSSJGTLO0mfZG0Ek4o7G+2KYt43NEsd/UzPaWN0n6vz2Kmk?=
 =?iso-8859-1?Q?9pimCivj920np+55rRp6baXxk9OhJ2Tq1WPWx62ofxn2NnozlYhc6ttTQX?=
 =?iso-8859-1?Q?wtpkbIaRxOC+mH0HAAiNGjGUysEX0QQLPJG2AWw1XJWvykUevb/vTKC2f0?=
 =?iso-8859-1?Q?RIDtjnxtwSsNJ6Lt4iB7grQAitclfW9vKuKSwnycU9BsiZCRaXItyjGgrh?=
 =?iso-8859-1?Q?81ekZNr2u8UJNGkXHqka2xEF/uvNe3ZDhfQcAvhZVFgIXxoSSApt8UFVnV?=
 =?iso-8859-1?Q?bZZqjC/Nn7uJTSuPkP5P5moIHaW0+xcijBDQW9mPUPpB89uAIKLeqBL8f3?=
 =?iso-8859-1?Q?zQK2lW901yLN2DEicA6oBL8qPepES0pgy/y4A4c7mLEu/aRvkoqCl9iHrw?=
 =?iso-8859-1?Q?Bma2Ti2PF9gYxPK9X4rn1GkM+2bODKmUc+le44rhgjtGER9Z7xsUQm3Wwr?=
 =?iso-8859-1?Q?DWjCRQHHaCN5BBHdSRIzWt8uFp3aF3JbAkPHqi9NOQzAZgzE7zByFGElha?=
 =?iso-8859-1?Q?Yap1gLIKSfD70XAVxb3ZqWk+iPbBGB2Jg9xZY2+evtYstpCxyfvkOPiwyH?=
 =?iso-8859-1?Q?gqfRHlcSN+Rk/+/Pg/SVCAzl6wkVRSmfC+wyPF4dBsATZb7yfOhPXoCVuf?=
 =?iso-8859-1?Q?GYoUWdhoaSBAOc/sAGWUd1nQV9YzPU5SOvuz27cLSGkcdhSo/5N4i6dQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 572fd939-a292-4af4-709c-08de01c1ee29
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:42:37.1544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePvz5Ikh5D53a6UevqidxZ4TLPRS1J4UbK4QsoEQUQGZvioUwrTq5yrd813zi12JBPWIy3H4rmlMrOGqDXhk7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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

On Fri, Sep 26, 2025 at 10:45:14AM +0000, Aakash Deep Sarkar wrote:
> The GPU work period event is required to have the following format:
> 
> Defines the structure of the kernel tracepoint:
> /sys/kernel/tracing/events/power/gpu_work_period
> 
> A value that uniquely identifies the GPU within the system.
>   uint32_t gpu_id;
> 
> The UID of the application (i.e. persistent, unique ID of the Android
> app) that submitted work to the GPU.
>   uint32_t uid;
> 
> The start time of the period in nanoseconds. The clock must be
> CLOCK_MONOTONIC_RAW, as returned by the ktime_get_raw_ns(void) function.
>   uint64_t start_time_ns;
> 
> The end time of the period in nanoseconds. The clock must be
> CLOCK_MONOTONIC_RAW, as returned by the ktime_get_raw_ns(void) function.
>   uint64_t end_time_ns;
> 
> The amount of time the GPU was running GPU work for |uid| during the
> period, in nanoseconds, without double-counting parallel GPU work for the
> same |uid|. For example, this might include the amount of time the GPU
> spent performing shader work (vertex work, fragment work, etc.) for
> |uid|.
>   uint64_t total_active_duration_ns;
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  include/trace/gpu_work_period.h | 59 +++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 include/trace/gpu_work_period.h
> 
> diff --git a/include/trace/gpu_work_period.h b/include/trace/gpu_work_period.h
> new file mode 100644
> index 000000000000..e06467625705
> --- /dev/null
> +++ b/include/trace/gpu_work_period.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +
> +#if !defined(_TRACE_GPU_WORK_PERIOD_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_GPU_WORK_PERIOD_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(gpu_work_period,

oh! not again please!
Stop trying to brute force this.

If it is a xe trace you need to add 'xe_' prefix.

If you really need the 'gpu_' prefix because of Android, this
needs to go through the drm layer, not a driver specific.

> +
> +	TP_PROTO(
> +		u32 gpu_id,
> +		u32 uid,
> +		u64 start_time_ns,
> +		u64 end_time_ns,
> +		u64 total_active_duration_ns
> +	),
> +
> +	TP_ARGS(gpu_id, uid, start_time_ns, end_time_ns, total_active_duration_ns),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, gpu_id)
> +		__field(u32, uid)
> +		__field(u64, start_time_ns)
> +		__field(u64, end_time_ns)
> +		__field(u64, total_active_duration_ns)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->gpu_id = gpu_id;
> +		__entry->uid = uid;
> +		__entry->start_time_ns = start_time_ns;
> +		__entry->end_time_ns = end_time_ns;
> +		__entry->total_active_duration_ns = total_active_duration_ns;
> +	),
> +
> +	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
> +		__entry->gpu_id,
> +		__entry->uid,
> +		__entry->start_time_ns,
> +		__entry->end_time_ns,
> +		__entry->total_active_duration_ns)
> +);
> +
> +#endif /* _TRACE_GPU_WORK_PERIOD_H */
> +
> +/* This part must be outside protection */
> +
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE gpu_work_period
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +
> +#include <trace/define_trace.h>
> -- 
> 2.49.0
> 
