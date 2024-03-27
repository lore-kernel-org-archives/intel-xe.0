Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05ADC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 22:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E023F10E27B;
	Wed, 27 Mar 2024 22:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOnXuL48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EAD11213D
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 22:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711580239; x=1743116239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d/XywT/9lfVo0eHqWGN6ClUd/aKIwWW+bJq9CBxijSo=;
 b=AOnXuL48qF79qpW6uuifoebNCLjcwu2/GeQMCl18K6C29i4SWYIY1xdq
 7/I1Nw2TSCTwdmhqUiTViehNNIlc3LcVxlt7t+a/MwABLi6ngA1NfGa8f
 2UPM2oNJzxLFta7un75xzSeCAHl/r+2aF9xsknZwku0iG+xWeqTbARc8/
 FYoighg0mUDDpE7RrQg5mGXED2ExQ6PTjpXFhNqpuVmrZn0RbYbImZ9fu
 cPKprtg37yy06u1FM+hSWS1PWz+uOZL3RY//spap/NAqw4/yurVSkqMJ+
 QSb+0SNeBEw6UGDMH7F+ecxfug+OwJ/8RyEgPLevWCxxgo17L/H4N/UF+ A==;
X-CSE-ConnectionGUID: CuagdMINQQOH5ouEgGN6hg==
X-CSE-MsgGUID: LVcZ5FxgSQaQLPJ4yf7U/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6575191"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6575191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 15:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="21102765"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 15:57:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 15:57:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 15:57:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 15:57:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 15:57:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMdS9wYThHpVZy6CgoZzmWuGkMJVyfyhyCvLyhtvP7jL9mwS8zppgaF/ksKK1QlzSHVuSuyg95FrdHoViCxQ/dATyAS46ivkcMIryZlAlrhX/YsrPXP83HtihXvTlvrim+SwaM1QTvQO364lN+IYi69C7EmBHdmwlk7AN2+Zzowjys/7pefs7Nbkar+qW2bJl5jCwZo32xwllqz1/zKo/UQmtPb7I7jkgBLNNVIjEqrVOc+xiLqCBvdQC3aZ5HwSE9hc+WdRsyb9ZWK2D+5iLfyfflqNWaWmzexlWaM37C1S6OaQ7Q/aMKpv/N+uvxbT1GMU5epo/yDaqFvVgIDQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCl5kUXH46zgfN/j2K7BHLu/Ty6UW4tzN4QZ0eby7qs=;
 b=FU1/AARDhUNRYxC/alhCAe53hwe5RBJOLEO4SBkXwG+X/5oExM2xx5TRVceKEg3Ui2EM6aKdMBV8A2rd65IO1Uu1cAWB7v7aUaP3OLFILCBO1aded8Uck0vTpQveQtnEedhr5IVEOlV/HB91Yhe2Ny5TurfpzsCjWTIrLHs6xtyQ3+Bb84L/38eoyyyeZdWnFN3l17wNAz/hiSLAq/gfw9IgdQ97fkHXlSmd8QI5BOWvsc5MzJlxTH84osJXPKje/IQ0lAmw86ZUQOCQv6sJxCG/aN/2L0JL7UwGBnMMdBdxdNia4gSqp9pwQuOtXcZr5E+pGbvB9uYQ5YkAyTEZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 22:57:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 22:57:15 +0000
Date: Wed, 27 Mar 2024 15:57:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Move SR-IOV probe to xe_device_probe_early()
Message-ID: <20240327225710.GD1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
 <20240327182740.407-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240327182740.407-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd6ca80-3eb0-4c14-1e1b-08dc4eb13f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIjrMkPeX6NyF+uB1TT/u9FKhxpA/X60aBIoleYtC38YZEj/cnM2puk0Vrzz/4hYqFxPdhg/y7hdqIFDQQ3KMRcg14irU27YdvUxKtMB3G6cvCJ2nzzc4C1aBIiQpWJxOveylf2qJ/Klq9jucAw5jep54xx3l2Lkbh1WMEUf8oEfMp+GOlKxosE2ZiDYs8IDkguY+wU6ZdDES1ZKRz63xC7e+LIfBhzFomOUmX6/V/7IBP6P7m1VV99knyJ4frSLAetE6YA++oCBMRgbWEWgvrv6GOrK91p5Y43vjk35DbRjUFHt/KKlHB3fFR4nExXv/tZRtX1AJYiiU2UepZnfU6ExuLwweVq3Tyvjdx951bFrr/CPuBF2JsTb3YHk+StcGtjMYcoO5X6f9QVwZhHkxaxNGNbPZL6uePTAt+FHnM0SOCJo4OTfhKDko9MIErbMjreoB44EcvKtugS/i3qozo/gJj3liPTe+YRfl8S9Pd8Q7RafUacQkdkSgqPSqOGaIb+MqSIMGJrYsPd2KDkPlGtlaxFly97cWolGxfW9sKKktlOfPye14+uZrrij/fJ5viZp9jakY5SnVABzyQfvHFw2cxUtfVf3diZKYKlh9EUCGnsKpbubDuFjgO5nD7l2pa80G7WQ2MJaBIvTaaQTmQ0LSnGy5sKzY0dx6Sh+iZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KNVbOY0ixnWWuQiMWQJEe5BYWe4ANWFI/onWW6js1KHVzKp/Kj5X3FI9XRF9?=
 =?us-ascii?Q?D1SC8vXLrzfEtmNZQWN4l5B/+5UeqgeMQbFzY94WQBzogFKg5aByWkid6wGV?=
 =?us-ascii?Q?WcC7oUQt8MuDQPG7PKZ/gm6xXHNoQwu25eWjmke0Kj2cNvljEuVM1hgMuTO4?=
 =?us-ascii?Q?cO1BeVTheAdA4jmJAJ+e1fXtUAp9mWn9EsCQRCLu59yDpnyVoE7OS5QFfjnf?=
 =?us-ascii?Q?hxykSQDzDWc269pyPk9MvR8Abnr8yMjL7a4aaHf+QYzCiAFkGLCRetMAWVOn?=
 =?us-ascii?Q?CPsaxxKTYId1F+g4T+oz/gk1I/0leNRvE3HfPj1ri6BB5uOWxL2zAT3+CZce?=
 =?us-ascii?Q?kwLtpK0rM9Pp8ABhl4efY7YyGgWbK7LvK0pMWHKbXeutOxQrKGCXM2Wu1vUL?=
 =?us-ascii?Q?t1oeK5XsfOnJklXaDC1IN14tqQqPcxUinsxmmIcISG5bbG2ptl1RoXR7xTKq?=
 =?us-ascii?Q?maF4IWq37gswObhhiQ6dp4Rc1Z3C5YxLy48DhdVlRo67+MCNIFe2OKEzmoHL?=
 =?us-ascii?Q?htzHOiFKaN+cbDOu6wLmAS/6IWsLFgmdlv5lzjribb8TxKiRE7BSL/zhUZ/I?=
 =?us-ascii?Q?yUHcAztfhpU5t+hRNFVR1vOrDHu5aoTYdmmepI1e7YMLoBSWvEM5jmSL0QAE?=
 =?us-ascii?Q?/MoNPttibsGBNmdUsK71h49SuhKl+87HLffYtS+rKn9NlfUUapX7b0xzEkbw?=
 =?us-ascii?Q?WOXSvOKG+ifvAEKNl7Ei4TuKibc/tJomKRcFCVYAOti0Wjxc8izN/Zjm0akM?=
 =?us-ascii?Q?6BSQl9zhzdTFsTLexAdTEwwSyRfE5i7ewvmq17K5z02v7jt+Mb5f8BWU3V75?=
 =?us-ascii?Q?pvV8ipTNMfxypjwbPi/8QnoXGFZlzU93EAZUcfe+X6BUUaSoJqxxXbOrLsoS?=
 =?us-ascii?Q?njjisricnAAgVwGZloD6F/ohQuMxhWhgIhSdAJvXpffiUI9wWq47EuSlbnny?=
 =?us-ascii?Q?FsPhg+YdMG2/aoO1U7zF6tsx052v/iMjb2BYo8zRc35wpJn0jSDAfXIGaYBo?=
 =?us-ascii?Q?OdHMrJVZ2IlJvk1kgoUzTRxxTjLK/gF50PyAtsqBJrViPGL3NjkVl3THklK+?=
 =?us-ascii?Q?tZMaiY6fHdW6EZgEylL63hwonWtj0FhyHbH6M4/2ucNPiSIfh3JGFmidI8kP?=
 =?us-ascii?Q?GRCythjmrcAp9aYjOvNpTsF2RJ3w85zflFHuYCzqvpqIEj85Db6DhFvWegxI?=
 =?us-ascii?Q?Nacop9YQlHpaRmGd3tafuYSjuQCVabdjagUcdTMYNQ+xeOJUF93yKe7N4pmr?=
 =?us-ascii?Q?oTlX7CNM16/uKhQsUYs8avI4W0ohyZDruvq/1YiftqciGz2XB8YL6pFcS2bQ?=
 =?us-ascii?Q?CljVZERvFVv8Or25u+NCC6guARCuWwxywR0LWNg19wuliFFP2KPXsal2LBYc?=
 =?us-ascii?Q?AH1h29xM0K/EfcCVbu68iFSPrRp01+j+EX2faz6H4DHRjvRtR7FwgBYPCXKU?=
 =?us-ascii?Q?l2b1khBsDmhsv4dz7QC8kAc7nMIetk8x+/hu79g4rNqJMjOsPrgwLBw1luDs?=
 =?us-ascii?Q?7tRuJHPLt3GFgSCf+48lo+cCKgj2PxnmEIrOAiZgsAexPYYhYGfmHt4s7UaM?=
 =?us-ascii?Q?1heip7oud/hEfBSbisZ2b9qqlj1VMYA4GlItDKE6gx9o5PIFwHY6G9qq2jPN?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd6ca80-3eb0-4c14-1e1b-08dc4eb13f2c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 22:57:15.6687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDhprwmO2snMzyT4q5eFTYNOQg79XKvpuGQnz7Eq3ANmU2Ow8PouPEib/0NxyEE/FVeoiWPUi1ndHXAM1z1o55w17mQrThKjd5Yv0UCHFLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

On Wed, Mar 27, 2024 at 07:27:39PM +0100, Michal Wajdeczko wrote:
> SR-IOV mode detection requires access to the MMIO register and
> this can be done now in xe_device_probe_early().
> 
> We can also drop explicit has_sriov parameter as this flag is now
> already available from xe->info.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c    | 2 --
>  drivers/gpu/drm/xe/xe_sriov.c  | 4 ++--
>  drivers/gpu/drm/xe/xe_sriov.h  | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 286ebccc3fc8..01bd5ccf05ca 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -424,6 +424,8 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe_sriov_probe_early(xe);
> +
>  	err = xe_mmio_verify_vram(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3c94154051a8..c47ab4b67467 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -740,8 +740,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> -	xe_sriov_probe_early(xe, desc->has_sriov);
> -
>  	err = xe_device_probe_early(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index f295d91886b1..2bcef998c8a9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -31,7 +31,6 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
>  /**
>   * xe_sriov_probe_early - Probe a SR-IOV mode.
>   * @xe: the &xe_device to probe mode on
> - * @has_sriov: flag indicating hardware support for SR-IOV
>   *
>   * This function should be called only once and as soon as possible during
>   * driver probe to detect whether we are running a SR-IOV Physical Function
> @@ -40,9 +39,10 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
>   * SR-IOV PF mode detection is based on PCI @dev_is_pf() function.
>   * SR-IOV VF mode detection is based on dedicated MMIO register read.
>   */
> -void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov)
> +void xe_sriov_probe_early(struct xe_device *xe)
>  {
>  	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
> +	bool has_sriov = xe->info.has_sriov;
>  
>  	/* TODO: replace with proper mode detection */
>  	xe_assert(xe, !has_sriov);
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 1545552162c9..9e3f58874e98 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -12,7 +12,7 @@
>  
>  const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
>  
> -void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov);
> +void xe_sriov_probe_early(struct xe_device *xe);
>  int xe_sriov_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
> -- 
> 2.43.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
