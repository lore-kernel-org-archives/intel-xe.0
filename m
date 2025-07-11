Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3058AC8303C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 03:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B6810E252;
	Fri, 11 Jul 2025 03:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVpRUWH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE1B10E252
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 03:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752204546; x=1783740546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gsXj5ZAv8orhaPloOFfx4MP+aqcTQDXZfw/S9tBqMh0=;
 b=SVpRUWH+rvt6vuKQaSrz95rOI/zQ/xpMh4wQGVQq7y6ot44RH6qbfcAq
 trqoHF+ADCyI5BTsl6mw/kyRFWLiZbCokxQ3cFg/sntpbm7BXG4pn/rIO
 Tuh2lon3j5HGUA/9xlG82x52gyppG6XBNEjs/jE7+piWCBp2wLfSoooWz
 OTul0RbicgCqrf9mt1lyk02ghlXir/gPOE9SXEY/aVbhlVUPQ4YCrNSny
 /7P9uLlzqUcZCdA5NA8U4f6Nf2XsSLlvi9xC5S1tMPQW91ZXIbpGdQbzO
 +c//yTRPPwbaG7GE1lYVxasmLbKiUO6P1K7GQHgQF4JjNNAmK7MvUBW+i A==;
X-CSE-ConnectionGUID: aGzRksnESbWUUv0VK1xdwQ==
X-CSE-MsgGUID: fnBT5JNfQWeCa+eN8mED+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54375103"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54375103"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:29:05 -0700
X-CSE-ConnectionGUID: XddRClOOSRKhtPMKveaHvA==
X-CSE-MsgGUID: GwgNSR+FS+m0jHp0jACNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="179959416"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:29:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:29:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 20:29:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:29:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGRyDCdKmkd2IjY/tbD23eZ2n33NaX6GHnaS8x4fAYT+XIewjvF6NpyvnTUAeORzkNyTF7/q7nVXjkm+DDtwJtzkvBe5vtVDUkATFFFIUiqofoTf+tmTxZN6mjRfjxZeOvXyMJMEW2vGQ1J+5jsMVaPnMWMmPd90qQLuKd4XewHEsn7cj5h2ad0002m5LvviXrHyB+GK6ZONY7GLt3V+XbnPy5EWNW5XyPJxkXRYXahy0BEK98O9+HkOH7/9lBsOrkfpqHeURPmN3jn8KhyrjeFjLJvgd5z0+j78HHyIyK0T08mLYOzpq6+XFMKsHiFRwhNgQdhqrKkYzcWBivweZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BndTnbfcu7JwyWQIj7roZZ/RMBOaGtiPvb5hs3FKu0g=;
 b=ayVygjAz2oDABJF3gdGUkUV6JSDCKXjRhaEzMNdS3pkDb6yYKh4l3a108WLY200M4sYrefzg67EHifn/84tjVZMh0xEVEGvqcC4ImCmwuumM7g70pHp4Zp78XVbJSyZ/slGTedmdY07ShIPEjG/DE96pnm2hWEyujAYWt6OFzUbQFl/TJpGu3snGg7sEWDyRvAJytasSSJc0p2d16dhOySC5f2ctq7hlAHR5Xi0lDTi3FMAyCt05Ul9RClIjZ36RZxaCV2qyn+X5nDnmcDEugbS+Q1a/gVRHJ1FuXHdVV7MPG2OIGLAgXIRK30OKZc74LEHnn/wismCFTu8GpzuR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Fri, 11 Jul 2025 03:29:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 03:29:01 +0000
Date: Thu, 10 Jul 2025 22:28:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v9 6/8] drm/xe: Add plumbing for indirect context
 workarounds
Message-ID: <5phafmc3kzrkabsjpbmjqzkpjj2flt67dbsvabev2hzkiih5jh@krldjartaish>
References: <20250709105455.93902-1-tvrtko.ursulin@igalia.com>
 <20250709105455.93902-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250709105455.93902-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9b0458-8088-4979-1cc6-08ddc02b13eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vBDnvJJyDpx488QkGGUACuweGu6/ZCmftnmDaAvde8VAX+HU6+5kdj7FtuWY?=
 =?us-ascii?Q?25wDUQA4ZSZdrFTa5E7GmTU5dXfYlgcvTpFaBAWVJGEVSlvbkGdon8Et45+Y?=
 =?us-ascii?Q?ZjdktN+qGKjbYvTI1yq0QvW7Yn9EUzEqhbhoExBO9kgPlCVzIuhfLrQ2IiTT?=
 =?us-ascii?Q?6nIxHbmQqe/Df7Sgx6XXznHPsFOT1M2ehmHpXwvJaPN5CjNcMO2kQWJ0FPEc?=
 =?us-ascii?Q?1o9jKzHIpTAm/qYLue7Q1G8CNhudUvkmqpx6asi/KIIkFjiUulE9WfxUH4TC?=
 =?us-ascii?Q?If1eVjVHjYfsAarluT3g7eiTmoc4ze8SIoQ1fYQ5Q+NHE8Go7Rqe+PfKDZZz?=
 =?us-ascii?Q?mMXp4g8vqUm70U0yEl0/o3vxR/vpxeYg/oroXHdrDi2a2Tes8q5GYWY6mrLJ?=
 =?us-ascii?Q?pdiEcZUe2zdtnFxwjPQdV+kFidz2PJvd7WnsbS/SwTGiq7doUnyEitv2v8xW?=
 =?us-ascii?Q?CXrh1fTHv0hHr2xjjpazLkB4/KNpqY1wUdXRh+CaJVIumh0YD8QT6572XHdA?=
 =?us-ascii?Q?0Z+wG0NneS1DYnNMzSA0OdrlZo9raJtxMUyCuYxxLAhtPtxeqXVYfZy37K9J?=
 =?us-ascii?Q?QtW2/KLZmxGAP8Sf5QpZ7yrhk8Ufmt/lfxmczvJAHbbnApppR49EGU217Yql?=
 =?us-ascii?Q?eJthwzszz6Bx9No7w5gU/sa3ypgKKQyjKmp/1zT+//OHc10XnJENDOIA3Q/2?=
 =?us-ascii?Q?TCl4Yccqov6GYuJd5TufuDZMj/7BK5SMb0vrVGPP3HAsnKe97RKNkLnDI8xw?=
 =?us-ascii?Q?GhwYoLuBAE5YACV3qZyqjRfwqRzfYbwQWiNAJzHi7yCJPidOZnmmajKDZF1S?=
 =?us-ascii?Q?apMOTadqJDcXPFtdFX03FhmoaiVfWLOdBZEE6WzX6uRg4XNLA/EdusLwzb9j?=
 =?us-ascii?Q?CmcdgeoZIIbUFafwf3XgtjufXOfJi7fCOYwDYQ+e8Dm1OypcJsIbeqFO1W7c?=
 =?us-ascii?Q?lCr5DXZQYiSF1pO9ai3QzpzpG/pMHYQiMobEt50Lcrd81jOSXHwqfwuvfkSY?=
 =?us-ascii?Q?ZPmnxQ+al+agtm+DKcNvMSEhelcjdWBP5bEV3utVfzqSZ2tiwbYaUEMTo+My?=
 =?us-ascii?Q?Kwt4p4XB1twrpF7oW4+Eg430rZx/J850nzzB9rKzcQXG2QH72gbD/6bfo/Cw?=
 =?us-ascii?Q?iNa83gHS2XrzjUu8ygRUKqdpICPUdLubnfQyAtgE6Cx+SjVnQnCX4Bf5GU6E?=
 =?us-ascii?Q?3Us18oOM0SIxXouN1EsLbDVA5A++WzE+yKYT99wWxC4/w1+cCnBBxa2FjXYJ?=
 =?us-ascii?Q?+kUcFerp82zNLO5bJWjedbGSQ+DK/Y/LmluSiiHzs5FgJbKEYBJdWfdYCKBl?=
 =?us-ascii?Q?JGXE1YuXccWINQxh6779RnE8sCuaB3p1NyaBegIdiTMDchSkQlPYwUM1SpSO?=
 =?us-ascii?Q?zgi4U7cjSDQ07KVMKNygHP8gK43ZPfkqAb5DuZc2mjQKqtDlBl9eim5RNZZG?=
 =?us-ascii?Q?HgpoVLDs6QE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r7Q/88dTKSKcPj9z3ZBLECLZ+gtQ3LO2vfMsizAB7tr8JTdXWBDGm1aj5OrC?=
 =?us-ascii?Q?Lo/7ABaFWFst1ReLUYYTIOlyCDGuXSJjPzRI3OENste1E6sofxNg4ZBeOBNq?=
 =?us-ascii?Q?J/VZeAjuTSxvivUHPBWMLA0o2S4Uh5R4Em7F1nG1PACh99RTvKvXdWJBFD3X?=
 =?us-ascii?Q?PJlQ6KhAf6oXKvHh6jQtghn8L1hLbomLvcKPgskNSnqs3TxoHKf0HDlZQx5Q?=
 =?us-ascii?Q?/6Ga4ZG2GBz272YoxwsGdfKWz+fGFig2EXU3Qr+tFRQ1DkiDT6DneKGkvUou?=
 =?us-ascii?Q?Yj5k75xEhSurjNMmNDk8TLspljdzzM6AHobYimPBC1MYQbsPpInHiev1vwe6?=
 =?us-ascii?Q?nGU9kaxPGmkkAISE55ZDAqxIvBzWcnzQzuTE3NUW7NO9kuCol563sfEPYaOb?=
 =?us-ascii?Q?AoDUe7/1lo3li436pddylFRzuluV5AKiwawk22pmvhwPeZG+zmCaa5yAdTZb?=
 =?us-ascii?Q?3yUEhBs/4OyhD3q7Ck9hY1EQIEiHlZoVfUoo2G79YzrQwNFxm1TWv+f6zcnR?=
 =?us-ascii?Q?NnWOkblTDcLD4KNTKRMq0i/mnKA44mlU09ABwEEWB7ta4kP+WKooXUz/W/2L?=
 =?us-ascii?Q?lt/Z30JmhN2XiOgdUfYma6z/jjt+fsCDFX1FiAUI0s9Lu+tTtUKmeHiJrGxd?=
 =?us-ascii?Q?qaBy1bzMkIx6W/8Lh/CjDERA28tCDZtmYakqP7AHX7GRYUQm8wK9Z0HFLzR5?=
 =?us-ascii?Q?qSh7XgTXFdVL1FSIkJmyXfceTV2EQNRe6T6w0JZl71luHbsSVoDhetbk6N8y?=
 =?us-ascii?Q?rL4weNizoeMyCd9hrU4efjLDcqq6tHLAS7jJmAi0wYK/0ohhb83u5LC76zAs?=
 =?us-ascii?Q?s6bK1GbraMQp29f2I7K7y6DREFr4WYv/DNJjI39CvDDvHIMEGHAzxOQA5n/T?=
 =?us-ascii?Q?wMMVWOmtdDK35+MxC9UnZJflkYyMwI5H4TeMReVUfgcsFFnfU5PnAcUSDlAd?=
 =?us-ascii?Q?QIAX1mINJQdziXqmI/Rbv3Ms5kSRr3fLcHvzmbxup79qsFnmoyZl8zE7i5xf?=
 =?us-ascii?Q?GAY2k/gCfwbUQJp3SSoOHdn3WGTcy4GEIj0DvO9Rzq7E8uOsJFmOIA8xb4pM?=
 =?us-ascii?Q?q2zL4NUXewF/CEcjqRttdeZ9r402gOKItLSQXyreZEyRyxVbW1RdZdUKyK83?=
 =?us-ascii?Q?S76HA/x/t6XjW6emolxiFShjkzljXGrhRbyVJkIwUlcIiHYFJerstqghibdA?=
 =?us-ascii?Q?wDY6r1KKyoWixJImd0+kxXLMM8i/QqUi/mQLcaUo3WleaL1uCDb3jXRxva7M?=
 =?us-ascii?Q?jPv7sV+GTIeXUCR+ooalGZHyygU8Z7t6B7Ja5LAW0epITfnpjoDmUIs2i32G?=
 =?us-ascii?Q?RJt95UhEQMydHXJWgahXkFXLxsZXdXzHmom30wncL3S4z9SdfMoTD9Att8yI?=
 =?us-ascii?Q?211Ffbt45fZgwMDil4Ulh0D+gckqL9XZp7EhnWgTNkSBD6vwt/bzzJG3vVtJ?=
 =?us-ascii?Q?whPLAJp87mCsOuhsh19bRMsBQwJoZrxdy3r715/wP/LZHrJwW2/gZP63B9/W?=
 =?us-ascii?Q?7y4khmDyhPpjS6FMzi0F2wvNtSJA5a270n9XYiomd7ZNyR3bAszmWMc5PSDZ?=
 =?us-ascii?Q?rMXTuNiTx8dKMzXHyslLWC2cbRTXYUDH3t/UqsshlelyZBs7y5W6SQARu/ph?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9b0458-8088-4979-1cc6-08ddc02b13eb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:29:00.9191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vGvCs13CHu3eOMvu2npNqYvP5oC9Iio5ppdlGRWlggmgRP1jNoumcvXj6HpETeyfLHarscCpNk8jCDV0c6Vbr8bJniLzibku+IujYOZ2z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

On Wed, Jul 09, 2025 at 11:54:53AM +0100, Tvrtko Ursulin wrote:
>Some upcoming workarounds need to be emitted from the indirect workaround
>context so lets add some plumbing where they will be able to easily slot
>in.
>
>No functional changes for now since everything is still deactivated.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  5 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 86 ++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +-
> 3 files changed, 91 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 994af591a2e8..e0437d0454e6 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -12,6 +12,8 @@
> #define CTX_RING_START			(0x08 + 1)
> #define CTX_RING_CTL			(0x0a + 1)
> #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>+#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
>+#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
> #define CTX_TIMESTAMP			(0x22 + 1)
> #define CTX_TIMESTAMP_UDW		(0x24 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>@@ -36,4 +38,7 @@
> #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
> #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
>
>+#define CTX_INDIRECT_OFFSET_MASK	REG_GENMASK(15, 6)
>+#define CTX_INDIRECT_CTX_OFFSET_DEFAULT	REG_FIELD_PREP(CTX_INDIRECT_OFFSET_MASK, 0xd)
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 768cb9de48d6..508bf032e06e 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -39,6 +39,8 @@
> #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
>
> #define LRC_PPHWSP_SIZE				SZ_4K
>+#define LRC_INDIRECT_CTX_SIZE			(63 * 64) /* bspec 45954: 63 cachelines */
>+#define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
> #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
> #define LRC_WA_BB_SIZE				SZ_4K
>
>@@ -48,6 +50,12 @@ lrc_to_xe(struct xe_lrc *lrc)
> 	return gt_to_xe(lrc->fence_ctx.gt);
> }
>
>+static bool
>+gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>+{
>+	return false;
>+}
>+
> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -717,7 +725,18 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
>-	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
>+	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>+		     LRC_INDIRECT_RING_STATE_SIZE;
>+
>+	if (lrc->flags & XE_LRC_FLAG_INDIRECT_CTX)
>+		offset -= LRC_INDIRECT_CTX_BO_SIZE;
>+
>+	return offset;
>+}
>+
>+static inline u32 __xe_lrc_indirect_ctx_offset(struct xe_lrc *lrc)
>+{
>+	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_CTX_BO_SIZE;
> }
>
> static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>@@ -1077,6 +1096,59 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	return 0;
> }
>
>+static int
>+setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>+{
>+	static struct bo_setup rcs_funcs[] = {
>+	};
>+	struct bo_setup_state state = {
>+		.lrc = lrc,
>+		.hwe = hwe,
>+		.max_size = LRC_INDIRECT_CTX_SIZE,

instead of the define, I'd just do
LRC_INDIRECT_CTX_SIZE - 64, then the comment here... Because it may be
tempting to use the wrong macro in other places, but this is the only
one where it makes sense.

>+		.reserve_dw = 15,

we don't need reserve dwords... we only need to make sure we write N
cache lines, because we are passing to HW the size in terms of cache
lines.

without much refactoring I think it's sufficient to just pass
reserve_dw = 0 and then in this function you just continue
aligning it as you are doing. But then it probably means we don't even
need reserve_dw (previous commit)... just hardcoding the 1 would be ok
for simplicity.

Lucas De Marchi

>+		.offset = __xe_lrc_indirect_ctx_offset(lrc),
>+	};
>+	int ret;
>+
>+	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
>+		return 0;
>+
>+	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
>+	    hwe->class == XE_ENGINE_CLASS_COMPUTE) {
>+		state.funcs = rcs_funcs;
>+		state.num_funcs = ARRAY_SIZE(rcs_funcs);
>+	}
>+
>+	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
>+		return 0;
>+
>+	ret = setup_bo(&state);
>+	if (ret)
>+		return ret;
>+
>+	/*
>+	 * Align to 64B cacheline so there's no garbage at the end for CS to
>+	 * execute: size for indirect ctx must be a multiple of 64.
>+	 */
>+	while (state.written & 0xf) {
>+		*state.ptr++ = MI_NOOP;
>+		state.written++;
>+	}
>+
>+	finish_bo(&state);
>+
>+	xe_lrc_write_ctx_reg(lrc,
>+			     CTX_CS_INDIRECT_CTX,
>+			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
>+			     /* Size in CLs. */
>+			     (state.written * sizeof(u32) / 64));
>+	xe_lrc_write_ctx_reg(lrc,
>+			     CTX_CS_INDIRECT_CTX_OFFSET,
>+			     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
>+
>+	return 0;
>+}
>+
> #define PVC_CTX_ASID		(0x2e + 1)
> #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>
>@@ -1086,7 +1158,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> {
> 	struct xe_gt *gt = hwe->gt;
> 	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>-	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>+	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct iosys_map map;
>@@ -1101,6 +1173,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	lrc->flags = 0;
> 	lrc->ring.size = ring_size;
> 	lrc->ring.tail = 0;
>+
>+	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
>+		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
>+		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
>+	}
>+
> 	if (xe_gt_has_indirect_ring_state(gt))
> 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>
>@@ -1225,6 +1303,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (err)
> 		goto err_lrc_finish;
>
>+	err = setup_indirect_ctx(lrc, hwe);
>+	if (err)
>+		goto err_lrc_finish;
>+
> 	return 0;
>
> err_lrc_finish:
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 2c7c81079801..e9883706e004 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -29,7 +29,8 @@ struct xe_lrc {
> 	struct xe_gt *gt;
>
> 	/** @flags: LRC flags */
>-#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>+#define XE_LRC_FLAG_INDIRECT_CTX		0x1
>+#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
> 	u32 flags;
>
> 	/** @refcount: ref count of this lrc */
>-- 
>2.48.0
>
