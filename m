Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3457EE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 19:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7688810E8E2;
	Wed, 11 Sep 2024 19:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxVhZVGJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5B310E0BF
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 19:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726084102; x=1757620102;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=L19ysR0HVrAh+kDNSNhORW449PzBfj/jkFyVty6haPY=;
 b=PxVhZVGJ+goEIV5Mip8Wf2lZl1SyP4KkxOI6WFFf7zj3H0B1qmsSDBEK
 uQuWZ6Z36JPOtnE1rwIEMQidn9Vhtz479tuO+8QxtlYueMOpwCioXS9d6
 ETdvSurIJ0pJCoY0egDCzWXQaOayWzo1a+ciPQewNFVGERfVa87Ofr59K
 JtY9lPukyGyj6hrtlrzVkKmEUokSHrF3uYx5oCiZQ6/kWMVAestRFGJ4Q
 RFCWtRTd/pBXHDfn6GVCOkBZ4QjsOILTtP9iC95S93qrbHPcEWkV/0jts
 jIubPPhrvyqmb+yIaPEs5Gmj3plo0uvdqUxikTlUYFcfXc7lLG/c65G1C A==;
X-CSE-ConnectionGUID: 0pWXPsgoTKOvMaw7VVCRlA==
X-CSE-MsgGUID: 7hODgOtNSSm7tNPEs4upQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="50322380"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="50322380"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 12:48:21 -0700
X-CSE-ConnectionGUID: xy1XQjQ6TUmEC0Q64MDDYQ==
X-CSE-MsgGUID: nfNc60hlTtuX6RUxRz1Wzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="72244253"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 12:48:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:48:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:48:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 12:48:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 12:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAWpGB9EUnlb4pG/8LjDFeV70YEwvook1UadOVE68gmvnEKf1QaDnCqj+5Hia8fanfDQhxQGI9dhiyJajm/RXBU6YVRXTWmnt7pN6LnhI4A4GJAVwGlKjOV4mTzvSZF5SbKn+DMJDD0hBJXDXT9UUHVh0hE6gUvPG8QwlKO/IJZcnB6VhVElKwcPWD1MsqIz4ArlO3vfAip9JZv54TJHNjbW2CAt2bnCCC4qKhq5spaB3ydclxid3sXxSx+1qiLNkNNLeMBCgyGjET9+jjT55oz9GB78bVh0lPhuotq/zRsWcgmFf9Q1OtvyqHUGsYhIoM6PwjAiFeQRdbykIjIfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RycUJZzpv9in1avS16L2DuN77bN59F0N+jHrS8VB8Q=;
 b=Xy2ZYG+Sepj6mGXWyh0DR/pdupTXhp3G9TXq1EyAQ9a4CME2bpl/LVMPaOfw1VouToPRe7zSgs70LSss8669BPBc7Fyct13dgidkItv4x7/3jmMH0Wqrgpx2mRRUVsPCufIyen9UmLwIhM8BCdoCPYjaiwjKGGL8T9zOcQ0TH05PJsg1sYNIEFdfkQ2zU4TF70ayNFf3a4KSCltvZIAscyRAYhd9ZHpLpiAA8MjMSV3u+BkR748seGe56t76eeJeHE5i0lZb0OWirtOyDNp16Dygb2mxENyq1UOqp54hM/BckaFg0z0rWHknubS4/d63it5xHRSOVJEZymwhjT2erQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 19:48:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 19:48:05 +0000
Date: Wed, 11 Sep 2024 12:48:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for Stop
 using xe_gt as a register MMIO target (rev3)
Message-ID: <20240911194800.GG5774@mdroper-desk1.amr.corp.intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
 <172601614058.983252.17663411475515295131@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172601614058.983252.17663411475515295131@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:74::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7991d3-8f99-4884-c53e-08dcd29aa636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?578sj3gh5CYZJGInxuzQ2UPhJvocLZOxew3j586icSZgloAx65uYdIYg+p4R?=
 =?us-ascii?Q?ZMV71ndOaGQUGU9iBpAMMEPISycYqrlcEemg8hie6Qx+joSTlyiWjy9hz81y?=
 =?us-ascii?Q?6jAXLTF+W4hRGlyLgv6UQCXOzCMqu3IChCds3bgTTOIsjCuQjxWv7scs51Zd?=
 =?us-ascii?Q?56+mVxvUpxGF90DleRDKES1BxegrC55K+fjr7+b/PN3jeCYZPnWv4Vp7/cd7?=
 =?us-ascii?Q?6CdyqU7xWADqu40ssaiMoE4eCmbs2s2aNh9aK/sshl4A1UBR3oCpDbQONysk?=
 =?us-ascii?Q?H+nbBTevgu94goRV29C64544BG0PPRh9bXQi6q9UsFO9DaKmtG2cSJeuZyKY?=
 =?us-ascii?Q?rpTjsdF5A+SWk2HByRnNnKNCEKLdWSZyNJ1qoqdnztwlsBVwlxPc6AtZUJvy?=
 =?us-ascii?Q?i7M1A1Kf8j4z2tr39xwqTXN6a3FA5YvXtIyqRUtOGqXsEO4dppJ7qRsVK8CL?=
 =?us-ascii?Q?OrF6VVt9Z/IQJXqEUQ0QAo3my0qdDvHqaUhIIvLZIA+ArTNSiZD105x0U8ET?=
 =?us-ascii?Q?cbuCT0VjFi3MjNLCv0HiCQNWlkabxN8P70N4V8k3yPPdn6SXDCxVG9ZbLJJm?=
 =?us-ascii?Q?4fylKRrNcHfB/w3jZT6iJmc/cPNQu69mAvfrOYIn0KgVZJyCSust8IDCH26R?=
 =?us-ascii?Q?Pr7FgoHLfJGTOoQM2URSKedd+DLBJbzaMaOtECn8kqqJmfwz/cH2XFHlsT8d?=
 =?us-ascii?Q?AnpqlrLSANRlhA63Qw9a8l1XFE9crlOR3sEBkxq8HMz/8xrg0PnrIgbr2hsW?=
 =?us-ascii?Q?IrCr+FVAQxj7AgKGyig5jG6P8XcrxrIWGlwlrgdRj2L53+LBWOKrBfq71uPx?=
 =?us-ascii?Q?y5ffMF2g9iJexlURrWazReW8ch2RUXIRqMDokP3r0PJ9D0loP9ccj5wYPjA+?=
 =?us-ascii?Q?cr4WxW+1rVudz8s1zZNSFc0etd46ZrZR/SkolNmQyFZDjSWySk1VdWnUdUrE?=
 =?us-ascii?Q?yy3/OHrpkolCVHnBj0n5/YP1veY+hKIn++AAgfuWC/GVEeywCXruKLXrlV+B?=
 =?us-ascii?Q?pnIdWfYxqHhDhpxaclHJcJUurX1mxr192WJ9ljmCmjD0F11dlhV1lL2rvlPn?=
 =?us-ascii?Q?OkkQw44KIDOrzAo0RA9keqEGomQ1tmNOQvcSiBGxHemvvvrEJ+di0HnSUC/L?=
 =?us-ascii?Q?jCGQXbovBgkPjIhwWbxMJtxpdNWgO62Pndy5Bx1NqhdeKYXqPU5uRBnYdmfV?=
 =?us-ascii?Q?th1pOCkeUGzU79d6CZIcVXcuYZL6gpK/7UIlXxiWiwJNqqmbayYgj45wsg8O?=
 =?us-ascii?Q?WeIzOJ+j6R5L3oC7/IUV1VMAv7K0WCqM537rwx9da4roNtWSqQJuhJtxaCPY?=
 =?us-ascii?Q?5go=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9dFe2X5UBetrt8tb7TnGNgkWnyCF0ApErVkfOs40lc0T9cr3gGzwUDyTxyOE?=
 =?us-ascii?Q?n4YAk1baFLhYXWFG8m0Tl0nnoYK8eOYijjbjz2H1hN9+eceEsNn0q9Iobudw?=
 =?us-ascii?Q?IcCqTsYaBAtvnRtB+JHJ7c/pLHwLkxK+exOxExFG5MyV62B8phm2+C9u4hZe?=
 =?us-ascii?Q?vc4r6J3fusPZg+zVrFWmzl8Y45kOXBCgtzvZIjFV+3fvKSzWge2HHXHe23CV?=
 =?us-ascii?Q?0fdZ5QqWgsCBSMYzYcjVhFWU2SamGSjldtfiNl5t61hlkNZ87XNDTCZn+gx0?=
 =?us-ascii?Q?1D0ONOctdmVPx2NPbbki/ccBNJIYj3oVzmJA5BVGpbh7Nij5RBO7b9R6OgKR?=
 =?us-ascii?Q?eoSvk7Pc4ScbJL4zoMmKgYu0Td5/qlnYOAXoIfWnvDU28C6xhHK3wxod35XA?=
 =?us-ascii?Q?WwY5LCxVZ1iTFycpdbsHTWOYbFwov/mwDOml7MbIc5bDkrS+nIpNauvzRbdG?=
 =?us-ascii?Q?RsCqJ+ac02AdGQZZgRsYoxyzPSheD2Pdo1+9AxNxAnP2UHbpK0jaFP7NZ9Lt?=
 =?us-ascii?Q?/0dHAVTofivjmx6JqRfz8drRjmANJqPO29y3e76bvScMzuIJumF94kdkHIpc?=
 =?us-ascii?Q?nQElZF05LoCDP4m14ez9xwh0SZ0DdMOy9VZvKwWstMz7GnevJJQ3jMayyPzf?=
 =?us-ascii?Q?C/SNYH+GmJWvugHRNZMrnCYKQ3aWeq+bokkptmu1f5c0Oz/GAxS2vabQp9rm?=
 =?us-ascii?Q?OUPx/Q+VCi1P5oTnpN2Ac9gm9J0owDXpwvlnRz1OVZacCRJDbkoYn0N8wu0s?=
 =?us-ascii?Q?gwF7/EJhbMWTx0nm7Ww87Y5jTtWtFkxNckVMPwuc6Ypiv8GkPNJja+Ro+MaX?=
 =?us-ascii?Q?eHPEy96DS1vLJnmhLT1glwsDfdG50xcCFG27q0T9ez/VFVG9gLtgDI70GVPq?=
 =?us-ascii?Q?KMqh8no+fVDNfXQSHIW3gHxY7wVZRrLV+MDpaK71t+/sMB+ji5TcIiE4u+sP?=
 =?us-ascii?Q?9HnpjEm6+igLUt/zQhfJajB+HkGlyRSyzaGVoSspc5w2CtTqp7IjjEpe/oOI?=
 =?us-ascii?Q?/LslSzgCTQkRy99eKbMrilfJwzLuEYVHfV7FxrM/Tuq1k3DY17vFewMEtV2R?=
 =?us-ascii?Q?Z1iSg5sHY1pjO2a+9ECmDNANt6SeSNdCs8xS2YqSOoaLg+jqWb5y6dpRsJrg?=
 =?us-ascii?Q?QadfVJAsCA8bi0Ub8zVNul2J3C3Ib+Oixwf6i8Zl7svvPGqODGpGL7d2CqkI?=
 =?us-ascii?Q?5867EdqS/5DvthgheE5w194OW/j9tspKm6IhdvZXzgh7AUIFQoBlIaeKfUVY?=
 =?us-ascii?Q?iEKHarUw5jtyLZuSEw7P+RZV8we83Kwu0jQA1pfH+g8ez0FYgU1eCau33Mb3?=
 =?us-ascii?Q?OrK/1sji0uVCB14hp/j2rStgYbXxwHJAgtSkK8bZ1L9Ifa/lQUeshbrbwrGi?=
 =?us-ascii?Q?ckmCGbntsJ80mt0cz/ZFwToyWv0fuMAAQggFg8yUjYMWzI0TAkCCYdISohLd?=
 =?us-ascii?Q?L14dAyikmg2m3RiVZx6EWxDanVqypZmj2E/KPOqYseE4tmwZqzgqknI/UYmv?=
 =?us-ascii?Q?I99x1ajCspKR/8zobDxeUB/4CDnctz6MBLuBTiLaVtFmftd1tynKJvO6Cd2j?=
 =?us-ascii?Q?salYz5uKVVY41uycRGpcPbWdj/iKtbPwgnadhAF8NVKt+6hw6KfteUtlKjzj?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7991d3-8f99-4884-c53e-08dcd29aa636
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:48:04.6282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /56m30OqhBwsfKY5EFjei23U5e7kxqoONYRZnYIWJvpmlAbN9TZI5Bqks07NR0iq8/Kb3JoEw3Za686dCKL76HkOCoCsUfDq7Jx2HnSxIm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
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

On Wed, Sep 11, 2024 at 12:55:40AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Stop using xe_gt as a register MMIO target (rev3)
> URL   : https://patchwork.freedesktop.org/series/138168/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3_BAT -> xe-pw-138168v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138168v3_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138168v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-138168v3_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
>     - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1.html

<3> [874.926504] [drm:drm_crtc_add_crc_entry [drm]] *ERROR* Overflow of CRC buffer, userspace reads too slow.

Already tracked at https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2055


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138168v3_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc:
>     - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2055])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [FAIL][5] ([Intel XE#1861]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3 -> xe-pw-138168v3
> 
>   IGT_8012: 8012
>   xe-1924-f3eded4f8a05d73a0b94f27e05737ea3427450b3: f3eded4f8a05d73a0b94f27e05737ea3427450b3
>   xe-pw-138168v3: 138168v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138168v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
