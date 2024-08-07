Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0BFC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 23:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E071910E60C;
	Wed,  7 Aug 2024 23:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIbnmYji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D99D10E60C
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 23:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723075024; x=1754611024;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n1I1SNIaFjYjaFlKSpOn/HC3jM2gR8M3Je3E3p67ANQ=;
 b=hIbnmYji779UXDKiRC8vAKQMLmjQyjL+9px3lUREias6TuIVz1svE4J7
 VAHVMt8kMkTVE7Es0BAl36CgU3C9SwTCDo7c/D0YuGDabaLCMMENu1g06
 Zqx+siIe+bGl+gjvmdJkLlnevEplwHEl6r/QFSGtgN63kPlIM/uzPDZ9q
 blF+8gOa9/3NmNEIlIy318goZl7UKMW/i8QQsfogPv3h400iZaDzUapZ1
 60liErnzrt/DzDue6N5l4rLVsQVuLFDxoBvttKrUpfzih7PefSCExHc0k
 8gM8UqQ4bUT5V5fDodGwnBr5L5F4CLiV4QsiTrlhr/K52snL43FP3gKHC g==;
X-CSE-ConnectionGUID: 97O1EpUOSjeu8uJebWoJXg==
X-CSE-MsgGUID: Hgd/AGWlSL6NIsM8gw7ZSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31847849"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31847849"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:57:03 -0700
X-CSE-ConnectionGUID: OAAOvlViSNWI+zeqOyS45w==
X-CSE-MsgGUID: oLnsv/paRGm408h168kD/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="56978696"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 16:57:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 16:57:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 16:57:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 16:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdUQGw5EZvACzqe4++HvEtPgVdSN3Bo+DDr10cO/vYP2mnoaWEuN7tvRY8EDsukSYJpk4sjc9ozHgorkzi5Nt1M/fQ6crcWMpwt2WoosLknJIrT2EryeMvwBdzV3OasOWb0PQGEsciRd6891iXvcUK3K3Og4OkbB+llfdlGA+U2ziOKcgN6KwPZ0ccOjyHhLPqD8gcaNk4eaQeIxGTgffjWcinGM80p779I4Ik3PkZozyuLAPdmYWsz7ExbAkEPmBFYZ4fwiTEmNaYxzwKeiGxEBRZlHDwkdWi1G/0iQfo1Kh8CMd4BQAVKmSqOBgd2hYL/JM4CM2zzD6fM5nPhXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTAc3eeX84Y+PFtYph2qG1l2vgfyiPSD5ePr1rssnCQ=;
 b=r/ZRUj9mXhbgk4yXKm0hneyVQcuqe05uBU7053Wky02NLVLRj+X4kx6KJJdb4COXd0rMwPr/iayiIjDHY58DHRAUa1fU3TYhH5qjIbxFeXTjKqAmaoPaJwq1p0ek1xSoFB5WfPXDGXUIG8a8uzZN5LwFhs/FpBDrt8/E5XAHqmBsuojrbe/w3sKZ3bjKia1yoJDT4Isn9UhpjSXlEOPmpIYoeckrhGK3pyqqz7+ILwtRT5rUMGzdqN3GC4NBSvtNzGE0g/pfE5Ko6HemL/ZPY68UgKeY7il4P2BGzpkIADz+1fHWZIClcyy7+o/EF6ZUfK5TDXbKzclbOph/U+VQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Wed, 7 Aug
 2024 23:57:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 23:57:00 +0000
Date: Wed, 7 Aug 2024 16:56:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/bmg: extend WA 14018094691 to BMG
Message-ID: <20240807235647.GE5774@mdroper-desk1.amr.corp.intel.com>
References: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
 <20240807235333.1370915-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807235333.1370915-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e259310-417d-4b39-1ed0-08dcb73c9ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f1NILSyvDQR8pItwCx403MYCMERxbtt0gFBAej/MuI8nc1Fh03dniYk5CXNx?=
 =?us-ascii?Q?JQ+9Szp6icj+gEfyDLXwD7OMjXm2d5VG7smQpo537p9O7l3hMm6xj8/29Tqj?=
 =?us-ascii?Q?bLoVtYidJdcOdDkPvMCcInsUWLAdruacStZlhk7kBFGoJ7OpOTqPzwiRd37r?=
 =?us-ascii?Q?1XHo8Lg2+7jHpnP9wE4SlLKIWE/geMonn9ygkc6AkfVJovs2WI8ttCDGY4sZ?=
 =?us-ascii?Q?ZRfW3m/1NAJ0KodAo5XZvCHCTOsu9VzhMmDhQHlg9doGfJgYH+lPPyHi0PbS?=
 =?us-ascii?Q?y1hENxBhzGwbjWEEM0UP4G5hHl4Wp9NnU2Oo8+wQH8X9taSSdOzrTSMr9kVd?=
 =?us-ascii?Q?y9bf5DXlcHRXRgZVZozn71VyQ1r7yWKHFQH7y82R8daVSE5H1BoBEZEsrDIx?=
 =?us-ascii?Q?ENBPxXr/bX2Y7bgUw/xin5A1OVcVEFcZOXlungaviGxSqgHyt5VnFMDRYYuH?=
 =?us-ascii?Q?iSPzh9betf1g/p4fdiEKq+UdH0vTEYNXE35B0Ti5sB3DsQFIjrDpjSqqXbTX?=
 =?us-ascii?Q?XwW57PIemxwcAcvMP16ejyqzIkORYY40d8wfWs01Tzb2wN3gBXtW6xJe7wrB?=
 =?us-ascii?Q?no6f13rGgY8wqeaHolg8rD6lPROVrz7/1F125m/EimoIgJ0m8A1Qo5WN3FFa?=
 =?us-ascii?Q?QOq848dGF7mcWzG3SV6mBW9CcSyyk5ScSvYDO5LqYoSMuSYYdOWhAWAUwGRT?=
 =?us-ascii?Q?jMlv42uYT0x/yOFdmzC2eDBO+gyyEGtIvxrL+r3ic4+zuj0loxn1u4iutUZZ?=
 =?us-ascii?Q?uXfOXylOL/bS+8TjCTmERsctBLkMNJLVdEDXiquHv3OKMqj7Q/yYL35Z8RUB?=
 =?us-ascii?Q?GDKqdtJkoDbPxgD/4/KYsKIXEZwaEtdFlsMyl7XIccv0RtoYgI+xq4v18C3U?=
 =?us-ascii?Q?BjITVb7+qQMUtT8oyGafwUt6w5aUesw+1ZL0OUWg/SNNa8mL3vPbYF9iN0N/?=
 =?us-ascii?Q?tLyDKMrVeYU7IVm258zmMUeTtHPWOjlJ0STetRGAyKlnCKMcmWUm1taHI/nv?=
 =?us-ascii?Q?qtCy8C3xL0CizqxQupv9ObBGyP+HlrRHTBn3VUx3dQpmRvrTCHpgLtfoItSp?=
 =?us-ascii?Q?2veGtk5m/fwkz4ky5NXA2mrEG1pipa/WtH5oQRMqS6YJ1bDhZd+6BELEtc1I?=
 =?us-ascii?Q?9adu1SCiG9u1jKa4eMHtnSqLCxTNwG7hmk+gwnJyYgiUVS74xY/DJwD4QiFt?=
 =?us-ascii?Q?m6DG5NIXtsJ5WKoT15UL0sM/3SFas5TbrLZekRvNeTPKg9GfCxgeOv4fkwsU?=
 =?us-ascii?Q?Aq9IrjOPqIjAqHtJRGZwZVRgtmVGdb2HBLZfRMZKPr0FyBWMEa89B1EO2yqj?=
 =?us-ascii?Q?hN9WMerBslYM5tmW33L8Oae/QB1QZTnoCIPyZ1oh43/M7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p5Z3DwI6eMnXvWSlkXQoLzUgpUxZSRLliWUVuRS2zGtygpUWyWScLOkbVY7y?=
 =?us-ascii?Q?j6rBpDZ2kV6ecorOl5Wge3gTjmsVcmEwv++GG79K49ks+6erYhMBmbVxyLQU?=
 =?us-ascii?Q?ajRPbljieO66noIvc8c/INKVaUnPKn8tJRnlHsMCxg6qR7HGMNpoJxiayGmn?=
 =?us-ascii?Q?itc63WnYM8A/pOHRnmBbsgwhsu2BRFgDHp8XqOYJAFR8G2FVXG59B9vN3Ylq?=
 =?us-ascii?Q?jUldrpkELS93JP3PU+74AvksHdPNV4Q+zIFeFTGM+Rxye2nRz3K3ngGzpuki?=
 =?us-ascii?Q?aAESZnLNQFMwhgaey7Us2u+kxFPUOsfinjoc3EGt0d7qoDZQz+JDH9HfsR6o?=
 =?us-ascii?Q?wWaZVfxgrVXRNCt2UsffTQ0jIEtik0OXm18eW20Ly0myMmOiuaQRAGHW7exB?=
 =?us-ascii?Q?dwghN42JE7Dr51txKvVgCd8wE0RVuTNu67lGmjtfFlRiafnBkxtzz0I2HFUi?=
 =?us-ascii?Q?I4VsdDeQjQAAMV8yNeJREKFoEtjqjILToZQ0cB5zoB4V5n5PrqLEsP8QHI/A?=
 =?us-ascii?Q?00c+kavNoqAiGItc3KroPgo3THnjb0G9hcKt5mL6mS9TQtC2IzNnbE/h/NE9?=
 =?us-ascii?Q?RKuoRRrq1Xm3rzdmlB5BaX+jhXhG7uKo6WETy39V8eOLaFyIMuJL/ljSMFqp?=
 =?us-ascii?Q?Bb6hC/hly0Pgrd7Li1+nCtvu+t2xgpopiGfBNqGf2SuE8UUSi723GR47hfM7?=
 =?us-ascii?Q?CblQRTyou23ZG2QD2llwwIZDqpC8S9KQzZAS8rHQZ8eDWbShkDiPs+dLDzRO?=
 =?us-ascii?Q?WbSRV2Z/bate2kWV6kS1kzemK4PnNzioaG00TrRZBhITctACB9Rtz7TKYaBV?=
 =?us-ascii?Q?ySv+8FeOvXWzRrYAkvmaaN1eWuhZr5sdvtBg432mdl6M7rVKAu/d1xg52e02?=
 =?us-ascii?Q?FhDxSwcZ3bKfe1jXypBoXnRE+doXBskm5OQOPuDvftdAsvCokRMUPVDE3b3m?=
 =?us-ascii?Q?ZWohHmL7gydE4nt/SkKKr+dBIrOsvMe+Zs9kRKEOLyQOoJkiFNflyZ0IUmlo?=
 =?us-ascii?Q?RDsahWFtw2zYNBbLY0qwZGz9YfzNrzOtMP7xPjO9Wc0iu0Iee8UiPciC/qGC?=
 =?us-ascii?Q?a3A5HhemNcNMtTYfgr5NbmIu8Ujvf0ei6/DBq57gRs8WFC93nEgG0NQK3hqn?=
 =?us-ascii?Q?FLCa1GMPrsf41TvhjijdR1183IjO1R/tBoVor2kM+RbVDXbUO5BgAIIchLqV?=
 =?us-ascii?Q?QeJcTYiig7BUzQwVff6F/ABpmHkSoct2upuBfrOg5pZbCqDf3uOiDk5uh5Hb?=
 =?us-ascii?Q?7KbCSUhnCzBnR7NaRoJ2q/DEdlUABuni15ftQZ3n5itSjnudfpxoRuYQ5LQZ?=
 =?us-ascii?Q?quxpI6zTsEffi/vDIeAYnRGnKKZYpNPylCazhVt8n3BSvZPV4gLTyn0dLLLG?=
 =?us-ascii?Q?i5adJLKmIdBOCn5YwXAi+XUhVoNO1DqS4re4a2oaf/9ocp1pot1r5BTaD9ND?=
 =?us-ascii?Q?5LAoSupW8wz+JN/N92/SgII0c6avIvO81tWukj/v3u+pCQFZsDkO1U2Urd/S?=
 =?us-ascii?Q?YMpLumNAqXXZ+jzlUWSCIT20lzLb8p01mkgfVexYAfLeRfys7xe4lHyVfKaF?=
 =?us-ascii?Q?gUfXfB6dmDocbY6HbYyuyQkuoDY8s4rwMyMcXvfmzWDC9gRFtkA7NZiSO8Zm?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e259310-417d-4b39-1ed0-08dcb73c9ae6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 23:56:50.5501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLTsW2N5GHGilSz7hAb0m9YAM8ije2MYEF0LaXMqSAEMXPkx+kuZr/LQCQG2+zA/ail+XyuwwU2hVTb1lO4gDaGyNdA3NlPkTcVS/oHHZPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

On Wed, Aug 07, 2024 at 04:53:33PM -0700, Daniele Ceraolo Spurio wrote:
> The WA applies to BMG as well, with no changes compared to LNL
> 
> v2: rebase on use of GRAPHICS_VERSION() instead of PLATFORM()
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 540d38603f32..f62cf6a4f6af 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -19,7 +19,8 @@
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  		MEDIA_VERSION(1300)
>  		PLATFORM(DG2)
> -14018094691	GRAPHICS_VERSION(2004)
> +14018094691	GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2004)
>  14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>  18024947630	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
