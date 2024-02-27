Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D686C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 17:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C25F10E976;
	Tue, 27 Feb 2024 17:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ijk3mlEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4BE10E153
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709055390; x=1740591390;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QRsdfmlTmV8bTfmcKeiTWBLWURC7Xe1SZXKaADYEqtA=;
 b=Ijk3mlEmRtBnTzqjBwd+jx/TfeRSCxtgISW+Gd5XE0H0W6q0ZsZvM3aa
 S4lfR77yYdh4OQ5htKwDMZnchXIl0E9KwKZ/7i5fZCpijKp479ABeA/22
 Q/DRpzT48kRQUITgLMLSGY2jC7H7UZVwIt0ZHOil/qFGojPeVctPAZfpp
 e5QO/xo9OGy576YLSrd8QGGhaPBmGNLm0qmJDMWLQVNaRc+/iutabmCBl
 lg+ieZjTijXOSF0id9t0GWe4BP/PSZppPbFATQEkTJyUaEOJ0CNeFMJs1
 UXLI9YXmjnf9DceXzEnyglVVL7T4sjLmawdAnn8/HujU6BVHiHp7E+KnP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3272728"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3272728"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 09:36:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="11716871"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 09:36:29 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 09:36:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 09:36:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 09:36:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWi7jTW1DtGyvExu7W9MeGzZ+Gn/ESgp0FJOyY2OhzqRhx2JKy939LATha9X9FuXSkijmlsNVr24xfRXOH9JRB42FRlZ4/2gDMcvlZo2bo2jVixsOI8aHiAx7WHRfrlSAf1mWDEjLMf3ISle5cHirFN/2z7M0jKXT5gxT6XzFTL0+IfatUHuVxEHveC4JM1k+gCdVisQnTCKL+dHWaUiaq/SjOLuasbnMtqM9ShHiB67lm9NQCedpawwTbiGb5cj+Js7M6tKj2mJSl8Rio5rXNz4gLSUjZKtcjH96dxZDWBj7TRVR0Pq13rwFUioQKi1/D9GnhLeXnyLwMxYzKHPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB7A4LW+ImgHY8H4/m+yNJrG4gvtfUwu6qcUd0oVSH8=;
 b=GRCQe445NF+ZPvrMqhJTgFwiI3bAA7XVsS+jIFfG0GCF64QHlox8zzKZr0phIiDnygcqIecaMTaN2TCUGDmhqPVfbcIN6oaDpDdw6IWM2mExFNLXdOFoxKbAzM+0ren0R8tXDfX6XCvdex1C+19Tf1dRj5E4qo5UHaNq3lL/7XqtUe4QWB4GGE0pbiuDHP9jQ7XJ5wjLYOl5hTLT6EvnTCnI6HaVh+tzJLlmwq0RQqusJ0wTK48ICGLafKW4K8MQpjG/U6UWgXm6hHLhAhGOmxQRktU2JYKFMu7GKdtd0RbVi1zukS5MTrgQNKSgWbXkaj3c/roM9XQ8Rvl8gxKXIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Tue, 27 Feb
 2024 17:36:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Tue, 27 Feb 2024
 17:36:26 +0000
Date: Tue, 27 Feb 2024 17:36:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 2/3] drm/xe/bo: Allow eviction of unbound local bos
Message-ID: <Zd4dsxAU9ECRx9Hi@DUT025-TGLU.fm.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
 <20240226164455.10179-3-thomas.hellstrom@linux.intel.com>
 <Zd0F0J5nPVQjmxIv@DUT025-TGLU.fm.intel.com>
 <e0bea21694f710c79653d37d46831d1d4d8ded7b.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0bea21694f710c79653d37d46831d1d4d8ded7b.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f95afa-a004-4d25-d3c8-08dc37ba9f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73vbPjVs3d+T0Bl6PiC8fV0olnYegiUw0HVpB2xpLBvNkDv8F3BjkypftEujjrSaV2dk3ny8b9E+eFiXCZw1SBd0/sSjIzBj/IIxCH9v4grbQW71QdFiTQIpszaeWq0TbLpYPE+COTztG2u3yVX6fbXevWMmfHCLdgufkhPh7v9Ufr3knL3NtjQqj/hLz+lVNGhka5xiNwWui9HQ74H4d/Aaezbgt7cmGeFYmN9k3HLSRWjjm8PYnnNBTjYCKMLHAhge1dpW7uyDY5Lchq0PA8GhhcU772DaLSVermNRofRHwqq4tbeoUh1ofjRRgIcx362+8dqxruJPm6SWZXNgJRiYc52o86hx4J1KTnlhOGFMzIh7WVU8q/zmm7NkSdhLw3kcnRTesw7Qlm/ncRZCtdIZa46kAnLYo9+VutXYTzJrnhiyIzqjordY9PlOYaVChpzxEdtTV8ah1RT6r5nByTIQYJT/qtKOSHQdCbNwum+ktp4ApTmsovULVdv+JAH78WHz/PgHnPqW40G/D9bORcA4zoAtwXTvNMHYuil97BNkhJ8Ch/DabTM0Qf3rTUNka+9Q6TAj1xnybmKfkqOV75pTi/MKQFbVDuTABpFqPV4a8DIre8JQkNpnv53mEV5FT76eAAAzY7aI/wPkB4zSji7fHSGCAmTO9Bl5+ZmnMjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VA0IzIBapNNAMR8pkqqX0k3zWbYCgapO4qiiUaU+NQHu3YSJdI6RvlsKAm?=
 =?iso-8859-1?Q?6OpnUoVX4xYAYmPOmGpDQqqaKrvHOqCoQ4UD13/sHa8W2GLkjpYeTHPoP8?=
 =?iso-8859-1?Q?oa/ls3N3bCKbHs39NjNUkUddBWb5+Q72Gw+oTwWH9ejxMV4/xbKTd2meiV?=
 =?iso-8859-1?Q?Ewv81PKaSx45iMW6kFtbPIR1ChwjdG6lkvNxb65kOCd0kL2wmo+VS/UKwk?=
 =?iso-8859-1?Q?nE0NsOuDCX+SxO67HMdh7Q7JvIfrMS3b0G4y8IG/bhjzHKKlNgVMs+fIyH?=
 =?iso-8859-1?Q?oQsyCgqkQjK3H3dq03QkmM47x0uIdcsSXGEk5uREYnihRAi8/XlaunLgpw?=
 =?iso-8859-1?Q?mcWKKoH5HY1JWuKeYSeXEiImFPkCKQSe9QDANOWrfq6vIoTFOMDxm9ADUS?=
 =?iso-8859-1?Q?2pLUI+9iv+WoKnLB+cTkxsyAbK96r5lHmUqwManPQ774qbmQuyAqlNQbID?=
 =?iso-8859-1?Q?mYrz0SMsyLrcMyFsFYXauT1Yu9mUAKeaXUSWoogKfWGx+JHKVxoHv8tx+B?=
 =?iso-8859-1?Q?HMhNl6nSfn/y2D3lQyZLynoJVnMApcWtfiZrqdUAYd53cJSM3ldtePDCOf?=
 =?iso-8859-1?Q?frUFKffRAS+93s3Sd/HM1yEp188UvEPYv0bY2hxAvPB3MeUNSYrpcbEG73?=
 =?iso-8859-1?Q?Fw/Ty+CccvhCYHHq2hk2MlaRbxOqtDsWHG9RnOUjFxHS8y4geo25qqMsP3?=
 =?iso-8859-1?Q?Wfs18w7IfNYRXMpVRyvc4Xms0sbPr1rPPuF07KJauYb+GwTbIRjYjbxv7y?=
 =?iso-8859-1?Q?npiVKefkO9HCZJ1hQEmvPGtrIkaf0ijBi9kYrRyLxykSQhZD2du1inm0wd?=
 =?iso-8859-1?Q?Lx4nHxIaWeWQ6kDDxzkwnxM9TejRc9RHn6kvvEUb9xAesnqG1A9K7zx1Gi?=
 =?iso-8859-1?Q?egVrygv06Rho0OI8LYyiucy7rFKxuHQag6vPjr33u8rInKa7sa3p7Oiroe?=
 =?iso-8859-1?Q?miKm8m/O9uMokH8T7XcM2jj9OUbA1Q5+xiTE/4cVeXZPa3DPMx4H6Fp0AG?=
 =?iso-8859-1?Q?H5fcRYyWXkVAiuu8QJLcMfcc3joLhObBzSQ/wqYb1JwCIIgbkPgwl591Wo?=
 =?iso-8859-1?Q?7ocqwfilzGzYztUgWqYd4gVdSIgWP+END7Ewxwz7imZZdbxquUyz5TWw/f?=
 =?iso-8859-1?Q?sIFky5gD80tE9c2/l2R8S9dtinpwF0m+vfBqhuXOcBA2CcQEGPp+X99NmQ?=
 =?iso-8859-1?Q?TOQJlrnd/+pO25DU0SQW0yL1qs2CrXjwHnAqSp2jT8UuUUo6Al0j7SLWgR?=
 =?iso-8859-1?Q?yYxtzkHZfVeTTvd8UILl9JUjrtJmaY78jVvMKNcTqrvAquINNS/jfvFDTj?=
 =?iso-8859-1?Q?UECIA7/7iOl5/CFD6auQF5op/L+XB36jppTh/kWEoPxL8LRn6ReMIToAgp?=
 =?iso-8859-1?Q?6uU6vJP37v7Kq9AmwvRMiC6W3/JlkRq0BgEQo22GNy7RlrCO9Rnz1KdBEt?=
 =?iso-8859-1?Q?KBd8fRBOSQo5R/kEhuA7Atsh01qubOnSZ1WqqlTXbjqiN5vKz79Gemh/ig?=
 =?iso-8859-1?Q?fsxGxFdOAodLrXGkHY32KqAvbDFdFW9TgCaY3M7zNV2zsLQZ3FVWw/Rypn?=
 =?iso-8859-1?Q?WhtrzeQ5D6YrHbrddtdwYsMPX6tdvUJsYmglD5W9h6BgvGjPQs9q671fN1?=
 =?iso-8859-1?Q?NRpM+INo/dCXeS2Psp7Cfhhzljvm2xSeAiJHKYi3TNhTCH8utecqvqaQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f95afa-a004-4d25-d3c8-08dc37ba9f79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 17:36:25.9701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFtfpHTfS/WIyY7bkS89K6JMkx93mx0FRFoJ9Q5Qfq6hrTfq4UeyA5ZdCHBv5YPNbZMtph5rZeRK/xWebVPJ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
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

On Tue, Feb 27, 2024 at 12:54:43PM +0100, Thomas Hellström wrote:
> On Mon, 2024-02-26 at 21:42 +0000, Matthew Brost wrote:
> > On Mon, Feb 26, 2024 at 05:44:54PM +0100, Thomas Hellström wrote:
> > > Local bos that don't have any gpu_vmas set up are allowed
> > > to be evicted. Support that.
> > > 
> > > Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external-
> > > and evicted objects")
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 143d93632253..2931b9030503 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1057,10 +1057,15 @@ static bool xe_bo_eviction_valuable(struct
> > > ttm_buffer_object *ttm_bo,
> > >  		struct xe_vm *vm = xe_bo->vm;
> > >  
> > >  		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm,
> > > &ttm_bo->base) &&
> > > -		    vm->is_validating)
> > > +		    vm->is_validating) {
> > > +			/* Not bound to the vm? */
> > > +			if (list_empty(&ttm_bo->base.gpuva.list))
> > 
> > Do we not need a lock here? Maybe add drm_gem_gpuva_assert_lock_held
> > to
> > make that clear?
> 
> Good point. I'll add an assert here. The lock is needed to
> read vm->is_validating as well.
> 

With that fixed:
Reviewed-by: Matthew Brost <matthew.brot@intel.com>

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > +				goto allow;
> > >  			return false;
> > > +		}
> > >  	}
> > >  
> > > +allow:
> > >  	return ttm_bo_eviction_valuable(ttm_bo, place);
> > >  }
> > >  
> > > -- 
> > > 2.43.0
> > > 
> 
