Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B15C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 16:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649C310E27E;
	Mon, 19 May 2025 16:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCS5p0CG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6DF10E2BE
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747672497; x=1779208497;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3HZ38pCUYWifVd+o6OQz1bJNlJ/2e9IUY51S8zcvWpE=;
 b=jCS5p0CGqw9LHu75rCFNr3c1spYc6/vhFc3f6f4W2kpJPXuKVcWbN2vs
 6Ru8hiEBwws39NAUaOdIY1vjJ1NialGoLBzFIiH/+4vQNmq4ejdR1FksM
 dCCQEyNdqcUicVDfjU7N4XbbtZgDkHPole054OEGSJSBIflejMwX8OrCg
 6+603sVqAYDyGAnCmBufiu0Xq9OmxpMngMHbBpk7jQZ/TIdUhl6BdRQMu
 4q4/MnYkg3dAykIP5OkhpsVjGeVR4xqyrzH7IkNkK6d+cpIgkJaqkGJ21
 0lvNexRi29Id4jcu6FoZjv5Fx8VKeRR9q6U/UhYcp8XqSMWPzc7JG4i7l g==;
X-CSE-ConnectionGUID: zmnwhQkvTeaAgj9c5grgXQ==
X-CSE-MsgGUID: /bxoWXexTrKqE14u0Bp1xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53379135"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="53379135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 09:34:56 -0700
X-CSE-ConnectionGUID: Dzq0treFR5Ot0DzyA/Q8AQ==
X-CSE-MsgGUID: IiFghyVgTn63YBV8TEjUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139162130"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 09:34:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 09:34:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 09:34:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 09:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaLClZ1Mw1mpkijG6n6o83F5qFvpn/30bVNz43S6M+3R0X8SnVbfglktBjpxGsPrSSTlXCMq2tFya7DjNHAkEkWxLsxTeZwd9W4DegkR0eEDPHfBHpIXlBINnq87A8ioK/88LZVoc1KlP54JxTeVpDGs32tpnstOFTESZh7B1SR5EXMcXrg5hcgEm19+ehfUyz1hLZ+B07m0wPKo9ScLd3V9W1dON3Rdid5TQr3rnc5mQ2M9Wvqc6gNWXdOY8S4nEuRxCm0Rz7oJmtAu/fX1feBbDPVD642rfZElHQUkFfAi43arSzntZoFefdlfUoQ2wO+EhHHic+p/837PDwlzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8IzpLIWMayec39i5rI0ArK7njmUrY7A8CTbU6hIGrU=;
 b=Dv7AUiE6RuKeFg9aPkCHWO66+Q2i4dZP2hM3ewbbdnOMvgIwVDI1+PjLH1WlE13DWxBLfCyBZ0RNUaErVwtesIS/DB3in2RDQiCT/gCZaLQO9hOwPOUUh0rIpb50z3REYuwpKygp7oft2PZDDjJn40DzTNG7dJtdpUG/s2uxLKpPE/zOnVwejizus4etkqLgrZheGFMKxjH8pQ3u9ripKFSUFCDBDXb01zN7uA1/znhDDuiexhaZU+/2o0EJXGdyPwTr8J/D/e6z7ckc3p0cn4xU/Ew1D8NrtwaERbSId+nMmKtwiuvaO1W9sG8dCyqHJtLb7hKlV1i6JXkYcZ9Qpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 16:34:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 16:34:38 +0000
Date: Mon, 19 May 2025 09:34:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?= =?utf-8?Q?ss_fo?=
 =?utf-8?Q?r?= drm/xe: Default auto_link_downgrade status to false (rev2)
Message-ID: <20250519163436.GQ5080@mdroper-desk1.amr.corp.intel.com>
References: <20250516124355.4872-1-aradhya.bhatia@intel.com>
 <174747513881.90963.12862941237366051590@c664b1dc75d1>
 <fc864a7f-4446-4a03-9266-38e975373118@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fc864a7f-4446-4a03-9266-38e975373118@intel.com>
X-ClientProxiedBy: BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6a2dd4-a18e-4802-6968-08dd96f30c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IBEmbxJImSUkes3gY0h/3ge7hvY6BE7HIC1rE/46pGMAl3h9jVBHQczveGwt?=
 =?us-ascii?Q?pQWNg7Hpr1Bqrtv/Fa3wpSLVYRthyw8KESADXYBdnVbSc/OoxrBBsEf+FREk?=
 =?us-ascii?Q?s2Lz++DgVgvOMBJq67ULVZXGPRnfRc5sUvFYYeN4UV5hNT5iOvq85ZDve2+I?=
 =?us-ascii?Q?7iNX14RkTPzAm6EdNCXAfOL73RU8qUiI31g4MfPTk1amnhomJgWfYNex7R+K?=
 =?us-ascii?Q?ULHo9x/a6wcLDU1+fd1u0s5LsQbjS8A9EMM1hDfXlsPgXQEr8oac4vjxzh2C?=
 =?us-ascii?Q?PyTVMrEGGv40hliQ4vDTKA3nNuGMvxoYS+gJGHvaWlHu4q2uMRZV/DHvKElp?=
 =?us-ascii?Q?dB5HQqb6KesulROHrcz0iARf/TNdYUBMJ0wfQ5ewkogsW1NvfzXlXCsWr+V0?=
 =?us-ascii?Q?3PHspu1ABpKM+Ccx76gN58C8CqUW8i09y0TS+wOx6EDGmgRQjNp8HKeC5Gv1?=
 =?us-ascii?Q?A+IAMbrGrpYSDXaAs9V7K/8FewrT0F0/0ndzLSZPmS/x/jk3nZOKlvgFD9mZ?=
 =?us-ascii?Q?DscBvZfxj6M5RGsdebQUhFV8hcOi/Z1JJB1Q6Sgmb2nyzCM5hYXYt5ghgKKW?=
 =?us-ascii?Q?Rve48RvtMWn9On7WjUczMKRXo0FiG4/uzkq/12wfLMbZjq3t2393hKcOK4wR?=
 =?us-ascii?Q?5cIiDtYmr3QYgP7xjeH2t5TkRDkbIPbJCwkHpSAG0wBVpp+E6+NXAYfZPtWa?=
 =?us-ascii?Q?aAecscwclrjZwtYhdOVv0d5DjFFKKluZAGEJOjD2/LCfDI7n3VvmiMAvopY4?=
 =?us-ascii?Q?YvEtS8I05YZ67ARwLW/oYJPVaqEJLl8KoI3aPI/XdUMYV8rvYu8c8GEsDJbS?=
 =?us-ascii?Q?ZDu4dQEndR/h6xPV6v9GazjgAkTY4NnNmWGIsDw3vn/obk4dnJY2JvyQtIzk?=
 =?us-ascii?Q?CAuoweevbB7Zax4MLCyNkoF/Sv64VNwHh7ig9clAwvtLZd1WaFu90uAbS3vP?=
 =?us-ascii?Q?Mm6sWQlUPUy4acRY1x+bgxM6MHHYQ73Ux99blcokkWJbNOQONq6e1NCmma4R?=
 =?us-ascii?Q?8RVRvUgoMSaWNo1t47mYXa1Xk8ADgwxLl8wSw94UevRlI9+3dzeNMtn86IXg?=
 =?us-ascii?Q?MNkCZZZXEeCwk/DBQKyuvKWMKhaqHq//GLJDkHFXavDWcD8dbIiXTTGaKteJ?=
 =?us-ascii?Q?XKhJKXJe/D7PvZZmL4EaJdazl223CTa56zrOyO6Tqw0wPAc67TWlA79qJNM6?=
 =?us-ascii?Q?DL0BV6rKRYaOiIByUdpMALuDauW0DBKaiXHHNoTny5B5mLjHtO4wkUf74tu5?=
 =?us-ascii?Q?lRCLZHRP3mgGABlJ//TGcjEo/BqXmUGqHtrSq8bnxvTOYPHBOQUlHX0fd6BF?=
 =?us-ascii?Q?NAPGPCRTn8heMQ/CeJNXRPNrpgtagO9tI4+aZ+7MMccTuXSeHpRlY1VL7eGm?=
 =?us-ascii?Q?Vndje2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z6D6fYDmoYwx06LOP1ZQzLKJH90jTUktAU6yK9DNZAQP6Mu2z0YP3c11MxuY?=
 =?us-ascii?Q?H/27pXk6+HOSVcpiQTvVGPVwVwrBctICmsyVVXXUH3vXA8R7i1SPYycLNXqx?=
 =?us-ascii?Q?hoqokkaX9csfKt5lKNQuNfnvWW99mmMiVlBKGWsKweOn1JpkMzd+useKScZl?=
 =?us-ascii?Q?+7CPKpnauMqXTthHzVAVMXFrfg7WXDkH8TelwWJ4KTKVgaiVZ7beW9tF5eUx?=
 =?us-ascii?Q?W+bGelXelGARAXSyeViYvqG2D1xQ85GEwA6nkt93A6AJdTTL6Mtgj+yD+qZq?=
 =?us-ascii?Q?wlk3O5M/CRmrRJ934TS+oWPKc+nBUenP1yfMltG+Gd4UWc2GyBxKyGjdt/E5?=
 =?us-ascii?Q?u9pmcvIPOXf8LU/fssFmm0wDV3F4QLymXtyoIjRm4RFSMAGU7R4LACsjRiWb?=
 =?us-ascii?Q?0YtPgoS1JUsursOWAiT+AJaYaral9eW964wU6Qvfg9BWYG2jjmZA7agv2weV?=
 =?us-ascii?Q?g+9F7stLEVpvFnKVNMPKK1syFR6JjXM0SxVTQPnQHp1oNgTq8o4yz989MOqx?=
 =?us-ascii?Q?09lqVfO4u6z+h9GsfGw84Ch10YXn3iZeZculfyOqhDH1e2JKB4qdxR4abgdJ?=
 =?us-ascii?Q?3FBm6/KmwX9viJGi90ZHKTIY+WW2qN3Mo47L7/OcclTaIvJ31fT+8Pn7PiaO?=
 =?us-ascii?Q?2hy3uFzQK6YO7jI3naJL0cbuOKwAOsjQyBwCBzKmnFIPVa8TIRNKOmiyTWyD?=
 =?us-ascii?Q?jIerYDMwgpg9J17gC0tSwXhiAE7H1fZXsSdrudCl54la87l7IeOIEhqMX30m?=
 =?us-ascii?Q?veuUpxO9Vw4PgEd5nVZg3GJ6ay1wwBhyZzz9i2hlC2xk4L6lGXH4yKO1L0l9?=
 =?us-ascii?Q?Rb52qXZwAaqSV02lSALoCnWGrEZ+hFOjg5cXmQZcKOEQTlxRVFQFjYXHn/PK?=
 =?us-ascii?Q?iW9AQp86HZRVoX3o93RhNUryh/eCzuhFOPHYmmJSgOyDMLibb4MU+Vyb1ga+?=
 =?us-ascii?Q?cABKXGghZMGRHbj+ADi7kMJFG7ZuemHMslc3KtjtS/DzAGE/I6L1v4qPAjgZ?=
 =?us-ascii?Q?AnZV53ejUTR3tJt9akSuWy0acDEzII/QZEj0senJhz/h49i5P3UUPGCurx1z?=
 =?us-ascii?Q?Gm0JibfO5rnbiGxzjCC77bW+QrMuBlJIfeZDS7k/s7tcYPoXUWtea+Yp2oTc?=
 =?us-ascii?Q?Jnyomp5isC5CTI7fRTWUhkMzIW7Z1vNNalKVH3mwyY+OKzi7gqvuNedMJqS2?=
 =?us-ascii?Q?OAsZbaghp3zEEY0ejN7300sFg5LkTBKYIIaeMRSV79HeogiAk+2M7/SCAAWR?=
 =?us-ascii?Q?6mwrdN95580s+DurS2Vo3hvgoCuahPAfa68ByU89213Pvr/anpoatzm6TGDB?=
 =?us-ascii?Q?HasdPdmVLNAZ0jbONc/sCJcHLteshvcLsXyDxnx0XuJXrEMqcJIgpGOF4psu?=
 =?us-ascii?Q?+Pw5mzhAx/c3DfKbFqAh2vqNm8/7Oo16lHrAy73+CFHobIVe9voGXM1DFrf9?=
 =?us-ascii?Q?kTtkgWuVSw3I3HjwseXQsZs7/4IYeCZHfbVk4iNIUbu6DYRZGSa5UFlJQl1c?=
 =?us-ascii?Q?lPPCbbVGBy58/00HIyRLcNoQUOvVBJsZG4+K9ZOqOB4ZQPQSgGLSM0ynw0Va?=
 =?us-ascii?Q?GbFLhwUJNKPZl0bOHn832mG7lsod4mADLk9MVPxNuPwChdsYERBSiIkm+Se6?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6a2dd4-a18e-4802-6968-08dd96f30c64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 16:34:38.7614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpII9gaTBWKFRZqrn11uMF2mcxRCCp5CbtbznSiiALDJUL/36ZDQqovpgZY44Coku/hpkypuUm92lDe+iS/fotT0qGwz9/TkDpjd+ybJbuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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

On Mon, May 19, 2025 at 11:26:14AM +0530, Aradhya Bhatia wrote:
> Hi,
> 
> On 17-05-2025 15:15, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: drm/xe: Default auto_link_downgrade status to false (rev2)
> > URL   : https://patchwork.freedesktop.org/series/149101/
> > State : success
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2_FULL -> xe-pw-149101v2_FULL
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **SUCCESS**
> > 
> >   No regressions found.
> > 
> 
> No issues/possible regressions were found with this patch.
> 

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> Regards
> Aradhya
> 
> >   
> > 
> > Participating hosts (3 -> 3)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-149101v2_FULL that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> >     - shard-adlp:         [PASS][1] -> [FAIL][2] ([Intel XE#3908]) +1 other test fail
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> > 
> >   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +2 other tests skip
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +4 other tests skip
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> >     - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543]) +1 other test dmesg-fail
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> > 
> >   * igt@kms_big_fb@yf-tiled-addfb:
> >     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328])
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> > 
> >   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> > 
> >   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> >     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +9 other tests skip
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> >     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> >     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#3432])
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> > 
> >   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> > 
> >   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +181 other tests skip
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> >     - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
> >     - shard-dg2-set2:     [PASS][17] -> [INCOMPLETE][18] ([Intel XE#3124])
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
> >     - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1727] / [Intel XE#3113])
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][21] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> > 
> >   * igt@kms_chamelium_color@ctm-green-to-red:
> >     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325])
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html
> > 
> >   * igt@kms_chamelium_edid@dp-edid-resolution-list:
> >     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +3 other tests skip
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> > 
> >   * igt@kms_content_protection@dp-mst-type-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2390])
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html
> > 
> >   * igt@kms_content_protection@legacy@pipe-a-dp-2:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#1178])
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
> >     - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178])
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@kms_content_protection@legacy@pipe-a-dp-2.html
> > 
> >   * igt@kms_cursor_crc@cursor-sliding-32x32:
> >     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2320])
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-32x32.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> >     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2291]) +2 other tests skip
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
> >     - shard-bmg:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#3428])
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
> > 
> >   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> >     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2286])
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> >     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1508])
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> > 
> >   * igt@kms_fbcon_fbt@fbc-suspend:
> >     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4156])
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
> > 
> >   * igt@kms_feature_discovery@display-3x:
> >     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2373])
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
> > 
> >   * igt@kms_feature_discovery@display-4x:
> >     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1138])
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
> >     - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#3321]) +3 other tests fail
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#301]) +3 other tests fail
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2.html
> > 
> >   * igt@kms_flip@2x-flip-vs-panning-interruptible:
> >     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2316]) +1 other test skip
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> > 
> >   * igt@kms_flip@2x-nonexisting-fb:
> >     - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2316]) +2 other tests skip
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
> >     - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#301] / [Intel XE#3321])
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
> >     - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#301]) +2 other tests fail
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
> >     - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#3321]) +1 other test fail
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
> > 
> >   * igt@kms_flip@plain-flip-ts-check-interruptible:
> >     - shard-dg2-set2:     [PASS][48] -> [FAIL][49] ([Intel XE#2882])
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html
> > 
> >   * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#886]) +1 other test fail
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html
> > 
> >   * igt@kms_flip@wf_vblank-ts-check:
> >     - shard-dg2-set2:     [PASS][51] -> [FAIL][52] ([Intel XE#886])
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-435/igt@kms_flip@wf_vblank-ts-check.html
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check.html
> > 
> >   * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:
> >     - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#2882]) +1 other test fail
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> >     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> >     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293]) +1 other test skip
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2311]) +13 other tests skip
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
> >     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#656])
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> >     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4141]) +6 other tests skip
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2312]) +9 other tests skip
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> >     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +11 other tests skip
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> > 
> >   * igt@kms_plane_multiple@tiling-y:
> >     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#5020])
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
> >     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2763]) +4 other tests skip
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
> > 
> >   * igt@kms_pm_backlight@fade:
> >     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#870])
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_pm_backlight@fade.html
> > 
> >   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> >     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1489]) +2 other tests skip
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> > 
> >   * igt@kms_psr2_su@page_flip-xrgb8888:
> >     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2387])
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html
> > 
> >   * igt@kms_psr@psr2-sprite-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2330])
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> > 
> >   * igt@kms_setmode@basic:
> >     - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#2883]) +2 other tests fail
> >    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-3/igt@kms_setmode@basic.html
> >    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-4/igt@kms_setmode@basic.html
> > 
> >   * igt@kms_vrr@seamless-rr-switch-vrr:
> >     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1499])
> >    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html
> > 
> >   * igt@xe_eudebug@basic-client-th:
> >     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837]) +6 other tests skip
> >    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_eudebug@basic-client-th.html
> > 
> >   * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
> >     - shard-adlp:         [PASS][73] -> [DMESG-WARN][74] ([Intel XE#4173]) +9 other tests dmesg-warn
> >    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-8/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
> >    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-1/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
> >     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2322]) +3 other tests skip
> >    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
> >     - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#1392]) +9 other tests skip
> >    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> >    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> > 
> >   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:
> >     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4943]) +10 other tests skip
> >    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge.html
> > 
> >   * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
> >     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#4915]) +4 other tests skip
> >    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset.html
> > 
> >   * igt@xe_oa@non-sampling-read-error:
> >     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
> >    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@xe_oa@non-sampling-read-error.html
> > 
> >   * igt@xe_peer2peer@write:
> >     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2427])
> >    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-5/igt@xe_peer2peer@write.html
> > 
> >   * igt@xe_pm@s2idle-d3cold-basic-exec:
> >     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2284]) +1 other test skip
> >    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html
> > 
> >   * igt@xe_pmu@gt-frequency:
> >     - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#4817]) +1 other test fail
> >    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@xe_pmu@gt-frequency.html
> >    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@xe_pmu@gt-frequency.html
> > 
> >   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> >     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4733])
> >    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> > 
> >   * igt@xe_query@multigpu-query-invalid-cs-cycles:
> >     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#944]) +1 other test skip
> >    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> > 
> >   * igt@xe_sriov_flr@flr-vfs-parallel:
> >     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4273])
> >    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
> >     - shard-adlp:         [DMESG-WARN][88] ([Intel XE#4173]) -> [PASS][89]
> >    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
> >    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
> >     - shard-adlp:         [FAIL][90] ([Intel XE#827]) -> [PASS][91] +1 other test pass
> >    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
> >    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> >     - shard-adlp:         [FAIL][92] ([Intel XE#3908]) -> [PASS][93] +1 other test pass
> >    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> >    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> >     - shard-adlp:         [DMESG-FAIL][94] ([Intel XE#4543]) -> [PASS][95]
> >    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> >    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> > 
> >   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> >     - shard-bmg:          [SKIP][96] ([Intel XE#2291]) -> [PASS][97] +2 other tests pass
> >    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> >    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> > 
> >   * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
> >     - shard-bmg:          [FAIL][98] ([Intel XE#2188]) -> [PASS][99]
> >    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
> >    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> >     - shard-bmg:          [FAIL][100] ([Intel XE#3321]) -> [PASS][101]
> >    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> >    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2:
> >     - shard-dg2-set2:     [FAIL][102] ([Intel XE#301]) -> [PASS][103]
> >    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2.html
> >    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2.html
> > 
> >   * igt@kms_flip@2x-plain-flip-fb-recreate:
> >     - shard-bmg:          [SKIP][104] ([Intel XE#2316]) -> [PASS][105] +4 other tests pass
> >    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> >    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
> > 
> >   * igt@kms_flip@2x-wf_vblank-ts-check:
> >     - shard-dg2-set2:     [FAIL][106] ([Intel XE#886]) -> [PASS][107]
> >    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check.html
> >    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check.html
> > 
> >   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
> >     - shard-bmg:          [FAIL][108] ([Intel XE#886]) -> [PASS][109]
> >    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> >    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3:
> >     - shard-bmg:          [FAIL][110] -> [PASS][111] +1 other test pass
> >    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3.html
> >    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3.html
> > 
> >   * igt@kms_flip@flip-vs-suspend:
> >     - shard-adlp:         [DMESG-WARN][112] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][113] +2 other tests pass
> >    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
> >    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
> > 
> >   * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
> >     - shard-bmg:          [FAIL][114] ([Intel XE#2882]) -> [PASS][115] +3 other tests pass
> >    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
> >    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
> > 
> >   * igt@kms_plane_multiple@2x-tiling-4:
> >     - shard-bmg:          [SKIP][116] ([Intel XE#4596]) -> [PASS][117]
> >    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
> >    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
> > 
> >   * igt@kms_setmode@invalid-clone-single-crtc:
> >     - shard-bmg:          [SKIP][118] ([Intel XE#1435]) -> [PASS][119]
> >    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
> >    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html
> > 
> >   * igt@kms_vblank@ts-continuation-dpms-suspend:
> >     - shard-bmg:          [ABORT][120] ([Intel XE#4979]) -> [PASS][121] +1 other test pass
> >    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
> >    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
> > 
> >   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2:
> >     - shard-bmg:          [DMESG-WARN][122] ([Intel XE#3428]) -> [PASS][123]
> >    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html
> >    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html
> > 
> >   * igt@xe_exec_basic@multigpu-once-null:
> >     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1392]) -> [PASS][125] +3 other tests pass
> >    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
> >    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null.html
> > 
> >   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
> >     - shard-bmg:          [ABORT][126] -> [PASS][127]
> >    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
> >    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
> > 
> >   * igt@xe_module_load@many-reload:
> >     - shard-bmg:          [INCOMPLETE][128] -> [PASS][129]
> >    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-1/igt@xe_module_load@many-reload.html
> >    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@xe_module_load@many-reload.html
> > 
> >   * igt@xe_pm@s3-vm-bind-prefetch:
> >     - shard-bmg:          [DMESG-WARN][130] ([Intel XE#3428] / [Intel XE#569]) -> [PASS][131]
> >    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html
> >    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html
> > 
> >   * igt@xe_pm@s4-mocs:
> >     - shard-adlp:         [ABORT][132] ([Intel XE#1794]) -> [PASS][133]
> >    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-9/igt@xe_pm@s4-mocs.html
> >    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@xe_pm@s4-mocs.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> >     - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][135] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
> >    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> >    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> > 
> >   * igt@kms_content_protection@legacy:
> >     - shard-bmg:          [SKIP][136] ([Intel XE#2341]) -> [FAIL][137] ([Intel XE#1178])
> >    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_content_protection@legacy.html
> >    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@kms_content_protection@legacy.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
> >     - shard-bmg:          [SKIP][138] ([Intel XE#2312]) -> [SKIP][139] ([Intel XE#2311]) +7 other tests skip
> >    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
> >    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
> >     - shard-bmg:          [SKIP][140] ([Intel XE#4141]) -> [SKIP][141] ([Intel XE#2312])
> >    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
> >    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
> >     - shard-bmg:          [SKIP][142] ([Intel XE#2312]) -> [SKIP][143] ([Intel XE#4141]) +4 other tests skip
> >    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
> >    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
> >     - shard-bmg:          [SKIP][144] ([Intel XE#2311]) -> [SKIP][145] ([Intel XE#2312]) +8 other tests skip
> >    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
> >    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
> >     - shard-bmg:          [SKIP][146] ([Intel XE#2312]) -> [SKIP][147] ([Intel XE#2313]) +5 other tests skip
> >    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
> >    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
> >     - shard-bmg:          [SKIP][148] ([Intel XE#2313]) -> [SKIP][149] ([Intel XE#2312]) +7 other tests skip
> >    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> >    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> >   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> >   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> >   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> >   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> >   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> >   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> >   [Intel XE#2188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2188
> >   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> >   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> >   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> >   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> >   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> >   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> >   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
> >   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> >   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> >   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> >   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> >   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> >   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
> >   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
> >   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> >   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> >   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> >   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> >   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> >   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> >   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> >   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
> >   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> >   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> >   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> >   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
> >   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> >   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> >   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
> >   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> >   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> >   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
> >   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> >   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> >   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> >   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> >   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> >   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> >   [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
> >   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> >   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> >   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> >   [Intel XE#4979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4979
> >   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
> >   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
> >   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> >   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> >   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
> >   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> >   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * Linux: xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2 -> xe-pw-149101v2
> > 
> >   IGT_8365: 8365
> >   xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2: 6d2dd85ba4eb3df89dc816c03b5bf81a470865b2
> >   xe-pw-149101v2: 149101v2
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/index.html
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
