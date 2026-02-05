Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FEDECD983
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 16:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FECE10E918;
	Thu,  5 Feb 2026 16:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMrN3w85";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6AB10E918
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770307440; x=1801843440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m1OhtyrthwfLv0odI5DveREETK575HoSZDcXZSbN17k=;
 b=EMrN3w85PzO8wGF+GnL3HkjsVz3nKicz9STAAux5MIiGbavwO8Jtej7o
 nhyoeA9FSodMdf1eelTFCrJ7uTUrNWUDD69OTzuz3XNjT/zNblDBrZmt6
 VSVJ1QlwspmvoyQDG1JRRtVeLGEsBlGUhhXo5D7w9/SETfWyh0D2EjevJ
 ntAm2zFBm2S0pnxyi95bK++t1MpqvwBPRn9KxlHwWERGmGszZTG3DrY48
 vO1IkJNI8SFioYXDlQuUitp++h1LksSwKTdrqoK/dPn0IEQ2KjrQY55l8
 fy8X7LRIcVuuYrxBg8BQPQLk0jrfXQ9MEOwLmDGWOb7fLz6cwhp5KF+jX A==;
X-CSE-ConnectionGUID: UlvrtaubQxau31Xvjq+Xqw==
X-CSE-MsgGUID: at7kIAHURfGRXpi5JV9U+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82625058"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="82625058"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:03:58 -0800
X-CSE-ConnectionGUID: mgsnHhIoTNK2rQhSuS/9/Q==
X-CSE-MsgGUID: gB6XezDxTY2LU0UIBEMoCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="233519040"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:03:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:03:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 08:03:56 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:03:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4HKlJ+Qv22Rvcph0+hiSzetktPXxF8gwY5j4ru5tn5yFbu42gKfsisqCo5XIHKqxH9wC05Lkgo54nAUao7S098w2xOFBE6xDH9DMcGJOViV6Fqz1Uy367EL8vWr96U1Ga6lkE2if33UhsWMJakhjzve17qhL/cb+8jFyJu7GgSuxEDc4p1M7cNgf21r8mGy2fzSPf6D1UH7cfpLR4+8pM9NuZr83+Gt4iRKTT5eTKEcQT2t9N6q4o8B4r3iYKUXsBQiS5Ip5FqkH4o3nkGxo2ZR+V85ah29NWsZ7fNUgrk27gboNudXbPAwz7f2Woh+q5dt2Sny32cTvHDJBiR5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvdvmhkJUEwWkWbCn1wjUV+bFigNHJgH1nfBJgB4PoY=;
 b=kBUqxUoVYCkXCWVYVtyA4un24mbsGCvKtcxm6E66T4p2AMRpqQee6TIDETd1G5hs2iRL7MTdGfpseImtapBCyTOUQ0IhN0NdBSLoD6lZ59iaOUZL799jmmO5SVPUk11evwjjLXWMTopasOZOk+/ePU+vpRwhimbfrWgDgJgqJ73Wu7jpEWi5dVinFzA5rn+CC8/RBpXzCmXMqady/52DriVqJVRXMkkoWENGMDtCFFITGVHywH4wJjM/dk6/Srj6qhTijB7d6Z2KThF+hwT4DL+GB8LuxQMsTl1RRiJnqsNZY91OMFxh+auWztT2Uav6YVsQQk9X0OjMbTzz6+tpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6390.namprd11.prod.outlook.com (2603:10b6:930:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 16:03:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 16:03:46 +0000
Date: Thu, 5 Feb 2026 11:03:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <carlos.santa@intel.com>
Subject: Re: [PATCH v2 04/22] drm/xe: Add deadline exec queue vfuncs
Message-ID: <aYS_Xl95wZP2u4ee@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
 <20260105040237.1307873-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105040237.1307873-5-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b5eb2a-9c12-47cf-f5e5-08de64d0242c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ocxX6x7n0mvo4Btr4JzcPV/3e/4f3iZZo/5txvIpFjNDkjGhei/TVYGhdmha?=
 =?us-ascii?Q?lAipVhdq6SqxM0nciXSTRP+Ta0ACvr1zWiUGSZuOrzLJgUKzidEehyepNAnJ?=
 =?us-ascii?Q?OIHoj1dDCMEGm9BA0lhI4v0yac3yPKug6kUsNPWpGm/o+uWvqCwq33efgiIH?=
 =?us-ascii?Q?aSFVRj7MrKOqLPc2aTaV42Q4Rm3CfQRFEb7ag1cgqydgDLHUjKnioMigUpVj?=
 =?us-ascii?Q?XvFqbJa6laH6UMfavDDXykE0rVzpld1UY39l0Wb/UhRL8WiecyoHSU8sf9nl?=
 =?us-ascii?Q?lRpZGHQyMXJI9PHickVQy0b4NucD1pQQe6I+j1Va8KudQRDHXFCqxwIdKrQz?=
 =?us-ascii?Q?W8ZK+WwkVDuMbvciZ1sfUDuDndpsyGSIinjzIOmfX/bhANj3D/+Kp4gD4n/c?=
 =?us-ascii?Q?zLjdfw1RZatSDZJLIVQpvk7bIcXWZUE/u9DO4oKVqUTjTAhGOOPBLHNNSjBV?=
 =?us-ascii?Q?IgdOdc7cvhQLCYI0Ia+oFKMBD3Uf3Qzeeslmj4f9oCNVQ9PyRH1MmRqErwcq?=
 =?us-ascii?Q?k/BqozI2dAknVBsZOcwcef7z3fxnBRKWM22q1R74cfVYHC4S//25E1XMpGy8?=
 =?us-ascii?Q?8Q6s0jDe9MlS3f89icBgU9Cl5DYLIIuBF/7/w7wrHy2m22m5lnUDwDBr0I42?=
 =?us-ascii?Q?mK+5KAC9QBThND477xF/lxC685rXxby3p39gPNOPtpfA91om6E7zepGanh6s?=
 =?us-ascii?Q?HCpgq97DLETLO6orTDwsardPkteF/dOJxyuL6sS92qjmzA1bb25q1RbGjFAz?=
 =?us-ascii?Q?Pn81c9NiNLa54wf28wRosaJ3tAzRmKc04Pof9Y7H5D+Tz2GGhXqMNwE2YuhV?=
 =?us-ascii?Q?sehwfqLOVhOkiJq6HC9UoCsZX2ekZrMXW7WOjJy0fnbkkxx2vXghgZAhml0C?=
 =?us-ascii?Q?yZ8kEk4cdEUQOVm5tUbRSR8OvSMpH9oic9XGhSI3r3XiiPrI3OmJJXORsdhJ?=
 =?us-ascii?Q?Z3WUQSO5YeCw4ve906tsJhOfJoLYYmLpnfMaiYq39Jg48jHIw/pZSVeYK8I9?=
 =?us-ascii?Q?PTpwWHdHo42sEUEZbWDrBrKlMetqhp1H+MBZYXDNCxkmJig0f7LHqsAaz9Ld?=
 =?us-ascii?Q?ZcKjV0qes2Wp03Gpfo3gFvBAxblDJEd8MzLgZICj8CHkvSCMPR8eA2Mwj4It?=
 =?us-ascii?Q?92O/c/oup76ly55VUBamM+/JSANBaHUBqkE2tfAMSPN6vNRgq0BC9rj3SQgR?=
 =?us-ascii?Q?OtgLqogBQMqH6uAXQk7rAPtBXQdyMr7fO1qQTZRBSF7D0IDAXmOSAdL/hBnP?=
 =?us-ascii?Q?16wI9HzRM/m2oeg1pe3yPwUGFI4qshov2UzOdwXWU7iGOoDywf1wtcKK+kpN?=
 =?us-ascii?Q?hRkcPUaVm0SfgsMS4pAG8L3C7l42XgurZuT+COIbSM0Xa9EBwbhMjg05hiXW?=
 =?us-ascii?Q?Ax4XRrM4JwWSZdnPKr/QJsFDFZZs/SBfIGPryNW3B07M+GrWWgwdTyDAR5YV?=
 =?us-ascii?Q?Sye6SO1V7sj0ET2O9cgbSHp/qf9VGLagjlQl6MCuOO/PTsQXRvLivt7mwhN/?=
 =?us-ascii?Q?twyNYhGlR7U3xLlOHpGYUL5Eq6jJAPZEFn7JQ9rmjDA0HcVIpJefwLYrf8TX?=
 =?us-ascii?Q?21W51bOmk8SipFUbiKU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eSgXMBBd2Ox+PUCZ7XZdDAul5XIJPPsyxJSIGHQaEw7tTojmg9u0FMAPnOH7?=
 =?us-ascii?Q?3eURbOtSXdCOj4gJT0p4cc9SC7XZbSzeK8+TuG5v8OLfjsD3Ci3zbtJ6/b1M?=
 =?us-ascii?Q?jw6LsrDVPtsOE0ETd8VXrZSScVHRGd87GUVZQ+AOt7++d/2Xktx32K4Ew0n/?=
 =?us-ascii?Q?/6ZyPJn1QdiMAHgOqpmgIOHUn4Vou6LqzT9mJKm3/fpPmW8H1Tkmsm0iBPNz?=
 =?us-ascii?Q?3canx/P1q4szvYEBEaz7PCU+efncz0+6+RyokoxD0aQWXvgxDz0OlXwSXcmC?=
 =?us-ascii?Q?6gxQ1SjeICi9/4XLt0Lch+WMUhuvVFqzxE+iorIhKeE+GE6/8/ecI3LM5x8Q?=
 =?us-ascii?Q?FC/X/SJLMGAHzRdhXzwhUbXYEynaFY8F1UkGKC1BxE0L7cwLCFVL5RLu+0Fy?=
 =?us-ascii?Q?PvRWHRR0SMJBaNJrk3isTCXOPmpbc9lgn3xQKvOhoI20iQ2j/muHwoU7FKqs?=
 =?us-ascii?Q?Qgm7jM/7dGtrkLf8M6pLdDeygZux1pwDa0r1QMXp9BzEyUgIdXC+HAr13h4s?=
 =?us-ascii?Q?HxcEkZNdUCUdq4dkzJdhe01vshznEvINIMr4y8e2MxQO/QfYMebH48Qc7QTk?=
 =?us-ascii?Q?sucLRrGPEUbqQ/n/v4eMGFXimkaRwvU8D3HbYmt8qOL9/QD9aofkOtEDsLfQ?=
 =?us-ascii?Q?h4FTr6f0mt+qXmXdeLgJy9KjEuqkhoEUx5NNwCOMcIpBOztC1ZrDKADT6Tt1?=
 =?us-ascii?Q?KqujG6Mo/Uo3TRy8kA3nh6Ko0HCGAdzlYHb2ZeZnCxzNX25lIaAExFMJAzAE?=
 =?us-ascii?Q?EIMmSbIRK8VQQdUoqwr5lS0rL03gNR+tjKazJvNi4d5J7xgc5YOSOtZNydyD?=
 =?us-ascii?Q?igaBc2zvEjLcIrcqSPzs7BaLfgJe1P6JaKcVNztBM8eIRpaF4UcDNTalcYmJ?=
 =?us-ascii?Q?JAxujOIfeEGjDoRVprUIcMN/4u138b2Vdy3lBRKXuQbK1PpA2/UeHZhH5VaB?=
 =?us-ascii?Q?LW3lXqIFUeE0xWg5Z+p3a5narkm6pGFIflKaLzx4EMc1CjtkI0WjLmzXv8SR?=
 =?us-ascii?Q?GGK2z85L+jDfkBr3U6p8YlIW16d3ilkupbTEIbMnuMxGsWhwGmwkj9QJsorv?=
 =?us-ascii?Q?oeXLq3pRzyvfnHsmm8juzVxa/LmBjLnT2ikXSUz6+x+HLx1A9eOp5FLMJoUk?=
 =?us-ascii?Q?Yvz4F1EemetFJv175NkK4KMLeCOsBo3IO88Bf0T3dsh4DDtqCZCLHH1z6Tly?=
 =?us-ascii?Q?O/pXWHyt2a827bnR1Mhknf1PDRn9R1UNXZOdouZe0LfTFKjwqRopG0xn9Q5R?=
 =?us-ascii?Q?I0e0g6/izOLYuX7behhZYgz/U3eplQiMDsa5SdFBH8MV9PwRTcdBWU6iVsZh?=
 =?us-ascii?Q?IHEbYr88H7yvVswtEMKEUXxw/6lPR1mRgHX9L2oeNMDz4KjmOSEW3VNlFVWD?=
 =?us-ascii?Q?PPSpuPstinfw2SjeUZyMQSaP18PzyUGY5DuLVdSiR/E74Aj5xNbyxOHoO/K6?=
 =?us-ascii?Q?POH/PnNX1sL5tpTRtjlK6PlKVuLMLCrxkej/OXI481NpSlebFLRdb+pExqrO?=
 =?us-ascii?Q?2ePRVvNfn+IQMtq80CfB9poQ2ZPEa8bejN3Yp8cgzjHVsElh8Muo+7wi10nb?=
 =?us-ascii?Q?Q68Fs0SiQwywZQExfplN6SCBJN7vsi6Z8RGYF0rqvoaKCFWAvz18+AvFEakm?=
 =?us-ascii?Q?xH6bfBjLX7pqP2nXNELADPHHzEvj1FMtius0BAvGdpLxz8RrUVlDlpsch3AS?=
 =?us-ascii?Q?QcjohwzPFUd7TIKIwVtDVgpSe+ittPLO3ev70HFSkAH3oieaDyd1oMaul2i2?=
 =?us-ascii?Q?ClUo6mf6XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b5eb2a-9c12-47cf-f5e5-08de64d0242c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:03:45.9610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8Ng9CBgcC2ccSEm2swA+J27D7GDNCMiBnc9FuoZh79R80rD+OeWEuc7tJiAnIHSWSHeEaBNJ1QnWgHdYIAlzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6390
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

On Sun, Jan 04, 2026 at 08:02:19PM -0800, Matthew Brost wrote:
> Add set_deadline and set_deadline_state exec queue vfuncs for deadline
> control.

same as previous patch... it looks it deserves a better msg, but
the code is good

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> v2:
>  - Fix kernel doc
>  - Remove exit_deadline, rather use an enum for control
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index cd7a6571f5c6..ac860f3f042e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -15,6 +15,7 @@
>  #include "xe_hw_fence_types.h"
>  #include "xe_lrc_types.h"
>  
> +enum xe_deadline_mgr_state;
>  struct drm_syncobj;
>  struct xe_execlist_exec_queue;
>  struct xe_gt;
> @@ -301,6 +302,14 @@ struct xe_exec_queue_ops {
>  	void (*resume)(struct xe_exec_queue *q);
>  	/** @reset_status: check exec queue reset status */
>  	bool (*reset_status)(struct xe_exec_queue *q);
> +	/**
> +	 * @set_deadline: Set deadline for on a queue for a fence.
> +	 */
> +	void (*set_deadline)(struct xe_exec_queue *q, struct dma_fence *fence,
> +			     ktime_t deadline);
> +	/** @set_deadline_state: Set deadline state for a queue */
> +	void (*set_deadline_state)(struct xe_exec_queue *q,
> +				   enum xe_deadline_mgr_state state);
>  };
>  
>  #endif
> -- 
> 2.34.1
> 
