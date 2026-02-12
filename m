Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907EFEE36B0
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 17:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C41D10E0CC;
	Thu, 12 Feb 2026 17:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYlTsCPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD7210E0CC
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770917901; x=1802453901;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=81GNsp4ocdSuYs6XOI/IEAXVE8gsrmOWENkUPevtiWA=;
 b=hYlTsCPZTi3ALvPHK2AVVMTxJznBHXyEDK+UFXik1NuKjQgbeQDvRjGh
 u02WTJo1svOARtw9aLDHfdm3guDhp+P1VDXOr87GHEgO3VEHGmSP5kUz1
 3UriEwo4cIzRgFBEC/kRpH7q/Iv+ZcN9xmQXOx2dO9324lu141mvuTloB
 5tE4IngPEpFHiSQPtZUS6wtv5WHvDE/zUJ6qmEBIrDOzGIAe3ZA0/MG9s
 z1W3q3teGsBg2ZH4Qv3DYDuoCXReYd/8OkzyFLf+/E5cWNxy4bvfVbFfO
 z/V2W8JFvL+eDlCwqqi7g0Zl2da5z+SkufKd+JTldDPD5QeRKk+rhJQVp Q==;
X-CSE-ConnectionGUID: adMs+989QzuZ0rdlKi/M6Q==
X-CSE-MsgGUID: ZmkfITBHQhaYDQEJU2CKMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94737835"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="94737835"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:38:20 -0800
X-CSE-ConnectionGUID: 3Gqyr7YwQBWieekGelLiNw==
X-CSE-MsgGUID: aiF5lPVeSEqS2fW1MUmGuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="235653873"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:38:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 09:38:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 09:38:18 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 09:38:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePGaA8GCNWptbIL1Vb5yOjd3ssaCncYmOFCDdki78i19xwVTm99THp7wdc0KdbazgayjhJSMsmzApWzAnBBAKgojd+fxoiVTh0EXOZ83GlSftzD8E5FdMmKnAYRiKXh5KrGm4z7xK02p3Lf3gsCkROVRhdH6KPX8baaCbVu2as+1p3sn5+Xl6OCqeDC0q8uZikdyJk0trg/TzDgi7G7eyNFXb3+aSRyUTPiAjzlDojjESmEbxhLnF6+3mcPGbS+vnjwz0KU9o8JEo9w4CAWkS8LWNPWq/r/QHg+6AEdQ19ySsq6W4GIVW36oIXlNOWplz7VKhhcPwTsIZT67UGendA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ik+0dAXb10SfYpo4yU4R5x7R8RMBzw7BX5KGSxtcM3A=;
 b=A9go2PdNk06Cg+zjwawOE6C2WO+vZYmbtoqtNJjSYTjPTNoZHhpPCW0RJq2I9oYHkkqTymoHXkiN/02DWSrJoMUod3HOQaupWgzR0opsUYZvOW6JxSid1rTzVXJv2k3oC6pMfxWkJzCxMUS9AMHG72ya7L6eyJt768lP7A7oTTOuTkAbnkvKRIbV3Dp98MadCocOvrEFB8UIBCgh6vGGGB07mwUqi2x2VIWgMUOfhuOOpixFfsQQHEZAkRZAJxDoRutMcQqmr8cEk3qSdQqyEngGDlEytdKYF5TjdZayQd9HRQhz030fHdI0zLTu55WjdPei0oQPebQfb5kEggFOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 17:38:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 17:38:16 +0000
Date: Thu, 12 Feb 2026 09:38:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe: Force EXEC_QUEUE_FLAG_KERNEL for kernel
 internal VMs
Message-ID: <aY4QBWnR/dKHKzZT@lstrano-desk.jf.intel.com>
References: <20260211171441.3246686-1-piotr.piorkowski@intel.com>
 <aYzAAT1XLIpPyxBx@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYzAAT1XLIpPyxBx@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c269a15-04e2-4395-fa9a-08de6a5d80af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dB09hXIndVQ+aMwcIOsvooiSbwJmN0OEK8CRtNdJfsazM25bYc+r4YB6QF?=
 =?iso-8859-1?Q?PMLBEWE8cVMf4dSNO00MMQisaB0S+LLRFoPfCHhWbScpdSnDuM2y8bk6jz?=
 =?iso-8859-1?Q?lUbCUb+9gXvfiw62GM1CCRpkMVsf/E9MIwSuyxMYmglj7iE9fY5833mBvo?=
 =?iso-8859-1?Q?txDzzkieTS71RycyiMc3OlmMOrYUrxa9qBYk9FX8lND19kSKwEYSXE4J0j?=
 =?iso-8859-1?Q?sB3kbAsnsTw1AGYenoAXBB3knCawoULQyqJx2n2g5nA6WT4zdnDfSUd4b5?=
 =?iso-8859-1?Q?xKEx8ve1df/uW2brP0afDm+Sorol2SV0u8JBSxIdDyw4Vq5prDGlX4kbVH?=
 =?iso-8859-1?Q?GzDeFq2PKIx/40weGNpKZzAIQvsWPHUTSndRQBKkHf11/9J+kLyJ7QFOKN?=
 =?iso-8859-1?Q?YlHKJmm7StKBrj1sV5gv9m7mF61VMr4IS75yNqME+7B12L0ga2OqG3xXJ4?=
 =?iso-8859-1?Q?7ItDVYpV6bH066L1cd5Y/j7d+5dNj4HVuL4K1JFOQS9nZjobAoLTYMvYPB?=
 =?iso-8859-1?Q?rdvOqp/mzOdmIpn/qe4AjZzEkvNfJRDqAwQKRZXLZTJt+AGjLlEpGAtDYF?=
 =?iso-8859-1?Q?dMzp0Qy+3vdk6Fe/Q3JnEBAeIB7xXIvLc0rVNnW5jNDtchMMCvdjnXxL3L?=
 =?iso-8859-1?Q?3fTrK6d2veBRAANaW/BdV9hGLa8OsuybHqyeREN0HqdLk8LBhQrLziqUsk?=
 =?iso-8859-1?Q?o1Aey8uNrzEBwUF3/+xriEC4W/4uZGxqo8fYz37Irvzdfhlm/6Yo9K43CJ?=
 =?iso-8859-1?Q?VWoaWs2MaO3UHPoUuv54aT22W1sQRNnKG/FvSQNE/a+qCLdgPpdTArMRKo?=
 =?iso-8859-1?Q?7LilXNT2crbnHwaLOySm7WFbbvsyM754mSvP1po6pCZiufE1Z4HWPaBlta?=
 =?iso-8859-1?Q?L6dWTafgDNmzJKPkzqwL8FGWp2M5/YhKr4gi/YxOD5GXeHwvIEpTcGGvh+?=
 =?iso-8859-1?Q?E94S/YSS+GkG0m7A48wUnGiVURu4jxu/ZE1GRpQgkkG2+7YIPYUR6ZGMJG?=
 =?iso-8859-1?Q?gN0rKL2iOHa7B7pJQj24U0LXJYJc7x5yV8rxbHMjk3v2kT/qnuYzcQveKM?=
 =?iso-8859-1?Q?4SZzTnLjrGXchTUXdnNj5Aw2x5nT9Pi/isUUDgorSidmM6qx6Ak6FFLORk?=
 =?iso-8859-1?Q?A1MPZFlMpPq9Z/dCm0RQAQsnQwt/O7yy+MtFv8l0WHMHHVTS+7EJkk/1xN?=
 =?iso-8859-1?Q?w4RRwQZl4jWJ3mOvG1XaFiWYf8nbd9Jx6Xu36tqOJdeDIz1oQQoV9TDZyP?=
 =?iso-8859-1?Q?Aimc9QAtGrWidKbGWVb6/1dDWLxexX6z8fjOMUEOn6/hCkNDo3SJteidq/?=
 =?iso-8859-1?Q?24bGjZ5Xav5vYsUOhFpzXDesynk+/SW7FmZuutWXFRI8hXkcpOrd8+8GAB?=
 =?iso-8859-1?Q?45Ypxls2f2UWhtx1dKZeBBlY8h/7ebZnAjE85RcrbJg7Dy4pQyBYr185DE?=
 =?iso-8859-1?Q?H9zjRAB32t8g8lFeobVEwU0YxnJ+HmwikNJRtp9hpyaLnHiKMAHyUeclxE?=
 =?iso-8859-1?Q?EeL1DbhTw3jhtwu3HScTVPMX2WGpMp9e/KIeWeVUdILu5Ao7Ch/IY4rtUz?=
 =?iso-8859-1?Q?zfAfCUpE+LM4Byf7lrigC8EpIIgdUeFpk2LcjwUW9YCHIan1UlPgQlQ+0+?=
 =?iso-8859-1?Q?KPgTtRqbWKxRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4MYOZkD2TyIufbnF4TRGBFTJawHtEtlQHufYlSyDORT83wYHY5817yoSYp?=
 =?iso-8859-1?Q?14LtJssgkxJTxXrPo+PNNdzNiRU9nXcPwvkQKtib26oIkeP9KxEvTKULk3?=
 =?iso-8859-1?Q?F/ik8hM7kPgQYMsBsF7M0arar+Kbh9znX7K0DdcJLGL1mob9iyIHa8JSat?=
 =?iso-8859-1?Q?geYLn72On3LkflUoX3aWNlKOSd/4ALWMi04Q00iMovYDhe1Wrm+j3nrhyy?=
 =?iso-8859-1?Q?m1fdlLH4KMw6tQDNmTxDsg4DktlxaAZrWjCk8MEVzJhtfFloj0C+3G2+BL?=
 =?iso-8859-1?Q?hbJV9smXOFDHAyTP0+kF8NLDx55M9QLi/RRXq+dYXF+81MXSPkJFLNbzhl?=
 =?iso-8859-1?Q?4TFalKXnEKNo9m95tl6DPG8SaIcU/zhfpb+2mqKWSoQf2vTqNATUi+PAEs?=
 =?iso-8859-1?Q?GnPyn87yC5ICU92LlJCG4PKrEzaTdby7Z+utrxMAWJwB5s3PEs31pt5pcE?=
 =?iso-8859-1?Q?fIZLjzn67X47931stMUFho65FyEr9kreuE2ITspuNi/I/rzvAu9CUERMqp?=
 =?iso-8859-1?Q?3aQnTpkwENn+T31bthuBeGkKqGyGgzLbl25MKB76KnglgcdXCUbLk4OAg8?=
 =?iso-8859-1?Q?XpO+bQOSU7di7nRBB+22Tfe2ihJi1O+onrFxpows3oapaFxRN41H3HUpQF?=
 =?iso-8859-1?Q?IXYCTitGP2x+z/QN40dkkeNAR2kyaxo4Bk/XtOwI4spnW56MNWR10XEkpC?=
 =?iso-8859-1?Q?zA+FW8bikv3NDcfT4V3t/q93swb81gid8jw+Tg96fYUBem+51HtXsc/Y1K?=
 =?iso-8859-1?Q?5STqAiNVfMdjtvaHaGmevxbt87uqgGUBAjUZ1rCWLpMSVuIgmN9mtCu5f9?=
 =?iso-8859-1?Q?FeNzVXypZ70oyPHsO7gqMBgYW21IEuvH6x2wL9r87rmACEC0pY4R7gvaOB?=
 =?iso-8859-1?Q?NtwE/RQJgEGiZUUkLWmmtVKeXIaKRZ3ZQXfleddDrpEWYz5CkQSRbFAp5z?=
 =?iso-8859-1?Q?6/iUc/a1EGR0oroBbVTd5A3b1oQ+rIT3C2IIX/6GBJSz/5moAxwegDglsW?=
 =?iso-8859-1?Q?viqZnQMSvbRH6PtyTv8XUv1FLY20Jig/nN8BORbjIH0fIcHT1ds+OpcONq?=
 =?iso-8859-1?Q?cQXrsXxiozUIWPzut51EtGSXb09+ssjM4dCJuiaH7CTxeV5BI8Ghz5tkiC?=
 =?iso-8859-1?Q?gg/WbI+18ljbuSeDzwwLynuXTxDXGVlkqcKqPS/31F7ymYDEKhLfTuB+i3?=
 =?iso-8859-1?Q?iic9sbqQ+4ZN9k33CFd4FyMscsylfpXerRUJdTX2po6eGAkRlT9HD6s5jr?=
 =?iso-8859-1?Q?1TgeBWBVGP0xTdYViZBEvq2UJ0n8lj8jGO6/LPxSCD65G+3sa8P/1Os1cZ?=
 =?iso-8859-1?Q?e4uO5A6wJsbFIeBY0rOCxm/QCCiOWhC02p8orfXlDkVyaLG6pW+LAkhbIg?=
 =?iso-8859-1?Q?wUaz1QEOlcwyFMU0/DUkBf9Ctg04+f+WEioCtzxr3qw7S2elZfOinG9YNi?=
 =?iso-8859-1?Q?hpZGXUunOXWo2qMd029vmCnIlapS9NuBFQvCXUk/ShEe4jK5YcbrSRy/cC?=
 =?iso-8859-1?Q?2JxOlH47Bj8wnjvkDxynVLAFEgWcMWKo7ivWUUPdb3mHMwbqNgcqBskb0T?=
 =?iso-8859-1?Q?gK94QWRnVlWTevNtg+eRNfDGjQG/CraoJe52zfI4QVHDPVDQUD5x/tMd+F?=
 =?iso-8859-1?Q?HcF/v7+sRaG50yBcFKKb+yIyrgmmb7DUwzMC8KaO6gXjBFcJmKVFrN0Bn3?=
 =?iso-8859-1?Q?keLMKP76M0ou8AxzxnGXhKOSbzYeks3iex0uPi79OMfg2gyw6183uWTKh9?=
 =?iso-8859-1?Q?GWVVKaAGj9cKQNtwdI9Y+2fU5icwW/0rK7Sa6G8PPNLSx3A96WGY25lW5l?=
 =?iso-8859-1?Q?a5p+bYfuMFNj8wpdDAUhMLeiBr+C7Ek=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c269a15-04e2-4395-fa9a-08de6a5d80af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:38:15.9263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lgs6txDcY2d8OOmGMvvWTQdxyLUSOV/wm/7WayV2tuZquTX2X5fmwnH+cXQ+Ucc7YgPnLOr93ER38TsYnFcEBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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

On Wed, Feb 11, 2026 at 09:44:33AM -0800, Matthew Brost wrote:
> On Wed, Feb 11, 2026 at 06:14:41PM +0100, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > VMs created without an associated xe_file originate from kernel
> > contexts and should use kernel exec queues. Ensure such VMs
> > create bind exec queues with EXEC_QUEUE_FLAG_KERNEL set.
> > Let's ensure bind exec queues created for kernel VMs are always
> > marked with EXEC_QUEUE_FLAG_KERNEL.
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8fe54a998385..708e8c7becf8 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1657,6 +1657,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
> >  			if (!vm->pt_root[id])
> >  				continue;
> >  
> > +			if (!xef) /* Not from userspace */
> > +				create_flags |= EXEC_QUEUE_FLAG_KERNEL;
> 
> This LGTM, but for completness we should probably remove setting
> EXEC_QUEUE_FLAG_KERNEL at all callers too.

I misread this patch moving a little to fast... I was thinking this was
a test in exec_queue create on xef not a test xe_vm_create.

This patch is correct as is. With that: 

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Matt
> 
> > +
> >  			q = xe_exec_queue_create_bind(xe, tile, vm, create_flags, 0);
> >  			if (IS_ERR(q)) {
> >  				err = PTR_ERR(q);
> > -- 
> > 2.34.1
> > 
