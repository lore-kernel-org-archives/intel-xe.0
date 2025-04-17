Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24729C369CB
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B675D10E3C2;
	Thu, 17 Apr 2025 20:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bp9BCYXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7708C10E3C2
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744921922; x=1776457922;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YgKPJ6Lf3XxMsfkvb7aSx2q+0n0rGzowLkN/Eg6C0Ew=;
 b=Bp9BCYXpXLi65hQcz4pEy2OuU64N/5bBspc6X5rEsjX2Ulu1wEK+Ven5
 mGZerrd1pGiczGrB/OhTGd/noaCNOWIAdudPuCh72tDENe1b7VEjykMAj
 A547GbKMgxL7z1/skeL3liRE34P30+cTPE1+ymyjcL7gU6Pc0NCKxCj+N
 k34cIQhIk/zSdoxt9/ARGmgd5Q1ig3x03pUfpKvyr9ZBDFN08bbMthTyN
 fZsTdBdvggzo9FRET7VRHJsjtE7N2iY9lfqeLzV+n41nIQ8Xml+B8jUuV
 YQnFeGGAOQrjwQ5KbqhkF0l1glM6BBUVOA9p85XVOKxjrauCoXloxh1XS Q==;
X-CSE-ConnectionGUID: vJDra0YtTJqMBUkTmjIhQA==
X-CSE-MsgGUID: ZpngUMJjTm21vlb+5DsdHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="63952482"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="63952482"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:31:57 -0700
X-CSE-ConnectionGUID: Pvn9BK7EQbiBhEUwjwlExg==
X-CSE-MsgGUID: nRrlGyUZQx6s2IN/en4U5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="135772521"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:31:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 13:31:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 13:31:56 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 13:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXLde6+RlzQ2lY6Fr1XCVWdihBmKC5qBnZYTO5UHrr1y4SHmRa9+g+bbWCjdwnl21moH093U1wzc3Az5xtaHsmrAff3WfUumXdcf7OkDrNWZ9xQXFGwPbYndUrWWiwfO1wk67kIvx3N0AomzBPZJYnCYh7udOtm6aK6UiNU+KV5FzoL7xq2cV9w7NC9JnVBzL8yTGC8gypVcKypjr3h20qOTlqMuRuNkpQH4K+rKTPDaISJ3n61MWoo69wAyyL3Ll+a+ro1gw7AxmoHJB81Jh2EGyU7NCYwSXeg3rOQdsGaAntFnPxrrhWJwzdnwu6oQ7hYLZCKScZYK4pKAvbJWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhOLBVht4oxyvaTqxXWiuc3CLv19oto/DX/UsmWbemk=;
 b=kPMyljFdUhS+4yG+lhXSrdLrZoTlW0sAfR77pFPOOxWErI8voNOfyA/ctcQyroo+o6HgvU5BfTLVDrvHrUp1+28g7Z3mbLMF9dlOu+nkOFGf50dDW60y/UQRdpdIHPIlU/nI/w+7zBMXz7rmrpO/MgV5Bqpnp/fQzJyVLPuT2J3+Tg1P1v1XWfblzkj74rZPbzfxTe+bIoVA+NHYxOfEcaU8RN7EpEJEVBbBMyG/Xdc1bFnGciMXM0uloaxR+1kZ5+iRSRR/+yuQbcUEs46bE0HrtmWqHagRSaCSpwxxO2tceXY0u1E1Sj0mK6sbMUlTjByoarjwQ3F/8AIv3Mi28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 20:31:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 20:31:51 +0000
Date: Thu, 17 Apr 2025 13:31:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/guc: Cache DSS info when creating capture
 register list
Message-ID: <20250417203149.GE6239@mdroper-desk1.amr.corp.intel.com>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
 <20250417195215.3002210-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250417195215.3002210-4-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d67fe4-a5ce-42e8-77b4-08dd7deee284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/astJXe3CTMmibCU10dzwaLSoWS9Pe9MCdecGUIO5BR5QYa0/UUxOYdzRHGU?=
 =?us-ascii?Q?rlCWA8E0BghhdkCWVz7tub1MJYJmXxxqbJhj7wJccBMlrVzprqWTpZgrh+6P?=
 =?us-ascii?Q?x8oL/v3+V81vSPs/zNmwA2nC7kXDCPx5zPgtGtXaKFcmEOHe8zFNkvRoL7Tc?=
 =?us-ascii?Q?McAkbNWIxayjHAYG6bhwDFHsDOZqYHufDjJIdkM/kOKp6B5neguV7VFrxjY6?=
 =?us-ascii?Q?miOp6E3+Y1qCPa5jJBgqQaAHUIRGEMb8ukA2dpO5gEzu08Jwl2J4ZbDi/OBc?=
 =?us-ascii?Q?4qEnHEjdosV7HakpNI94ijvKArHiqvNoUI9aqyxH1wk5BPrARBUG46Two5vG?=
 =?us-ascii?Q?rU6/6WJDDVD/u3VM/r1scWY4N6JplZ/JE9/a0w8n/7NUfIutWx/eyRO8QDqT?=
 =?us-ascii?Q?6dYrmcQrb0+5AhDtHxxkn1vieHgNEY2OBnq20vHSITv5xXNuVsMOnaHrEDTS?=
 =?us-ascii?Q?kmHyrPBZ3CVmw2UtauQxxNw1EPUYKw3UxoEJ0OaRH5HVo/qpavczacrOS1m5?=
 =?us-ascii?Q?StqGXBHxEkqyMAFsRrKIqd0OHBi3EgjBfJhZeagsbhEb2Iej2VDArA2UhKGX?=
 =?us-ascii?Q?AOqResOlDYnMswLDM4mzmeCKqABuDKxtXR9w2Qi3Xa+m2cIoDe/R2sbSigbv?=
 =?us-ascii?Q?/Q21HtxanwrxBogrklMVEp8cAuOf/Q8+8QIeFrsSZBvMXQlsloCeAQ9BWr4Y?=
 =?us-ascii?Q?ln3Se74SgzwE1wmNqLaQq2uHyJWh7qmx0hBLb0mIFy5JR9bMDwb6+tsss70m?=
 =?us-ascii?Q?raJrQ4UgD6o9hzHcT8+N6NGzf7hRx5j83YnE9anwThFrdE82ifyKuAHg8D0C?=
 =?us-ascii?Q?ZEc+IDt4g9Of6J3E1+taIPVBa+uV2i1gddA70NnV8TPM0y9KNihzk2jTnilj?=
 =?us-ascii?Q?w7KjtJWtYz3iB/93AEndl9aNxAfnf09y5IiW9rZceiZ0FSsSrva1tp6UK0T8?=
 =?us-ascii?Q?601Dyu6TtlHDyBCrsz9iTx2lglB4iJKrSn6HmREjyljnRtm+2M8tzmUfN+dB?=
 =?us-ascii?Q?Iluj2MwpJsqkQ51ADfAoKzvP5R7VMb41KQ4K82ejS+fsTkTWZ6SRlw/mO3YN?=
 =?us-ascii?Q?oj2+oyJqSmmus5IPR4WAHc1ZlnXPxCo5TsGbfKyeucvwhC6fmtzTjA6K1Uou?=
 =?us-ascii?Q?XGuO+bhdx0cGX6NLoCOdcYhIGsaIdNrFowb3z4LFn1eTsEK6OyM+7wcjP6Xb?=
 =?us-ascii?Q?80lzVaxDCEkTXmFfp01AdamPHxvAZg9c7jvxG2LdZozAd1610AIOm7J91wui?=
 =?us-ascii?Q?3D/81Iee4pHWb7juTyo4E7XhWtyv2Fs4EHkRIRQJleOUWDsDXR6oJ6DK+yin?=
 =?us-ascii?Q?So+pMDbQjzgHofDKKlM6q22MmuwZCZE5C4WDW1jEznVDDt9vtnWQubnbYR5b?=
 =?us-ascii?Q?1IdaX0T2MxEyn4mbB3ZZ+JgTjHeUOHJqzkFiHRspmpmnb1gpaCoxgfSFyMj1?=
 =?us-ascii?Q?YlfigMJJP0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71y7QR8KxBTmo5E2m8skcpVx5juj4tXjh7VQch4XcCA+nOKKYeu6QzSVzKFC?=
 =?us-ascii?Q?EQzp0bTwogi40fP1ezeu677KSrYIYZiY/P9SHSy16Ufbp4mbkGyBk5F7SnsA?=
 =?us-ascii?Q?nAdX5pkVklUbD0uMje+ZI7ANfkLoWF5zreQHS2D69l0i0WewgHeFuztpZTvw?=
 =?us-ascii?Q?RxS5kyzFIUru/m06SdbrQS/+oDVbyc0R/I4f6FpbXJGHYfnsWOZAPE8xYqPf?=
 =?us-ascii?Q?DpxJ3iPDztn6Bs3S/WQ7e9Z09Nz4TJU1KwdoMwPsYbAmgl1mvTmxX6neYjv+?=
 =?us-ascii?Q?HUNoCgL7lwFWX6rY9xQLHjY1dbmQkW4uKvBnEMKJrOa2wADHzDuRSvCgDXSv?=
 =?us-ascii?Q?nj9cp7daeV48mx8dbcl8DRORzdPqtAJx+zHQX9UaPTe/UOz3q3XFmB1rdzSh?=
 =?us-ascii?Q?XuYRn+WhtvAvSBMhoEZFPCD5ZyhWA6wuLAxU6aL3bwjwcFfWSs+B1oZWCx3X?=
 =?us-ascii?Q?YkTJlTGo9demjTFovx3aMrBfiHOHsS5weMBVG79L4t8owRIE0ZTGhMYzvOxK?=
 =?us-ascii?Q?x7sOoav4PJehKjfl/ftz71ZSa21KJzm4VVtpLDcYy7p0c12LVy7RPiQvbc0T?=
 =?us-ascii?Q?spvfaLfMN+IIM4gwVBo4V8vPyOE0/rh3xTEErqFqfM1k3cAd9GHPGpZdmNkI?=
 =?us-ascii?Q?T0yRnFiTr5rAHPpEjc9Y1xb5v9p+0fBUG9x1Kb9xgqrIMnni3lU9Jrm+ulrC?=
 =?us-ascii?Q?ibJMVxujYGR7B6SXSPtepYzKuuyDz2VuH5k2FgeEijLtNY50KtsLF99U41BI?=
 =?us-ascii?Q?33wioYKchrG9mQ1Sz7NQbJ90fNTJ4FvQ7Day1r5/DaNcI0iiCglbmrDXneac?=
 =?us-ascii?Q?KIZ/oR9tADBUn5BfvjPCGP1xKQonTTA35mGFe+F1x0tYeAimOaFpOMMqgLID?=
 =?us-ascii?Q?OCiaSC31FK1HIYopCrztFjKqcz5D8Va8GB9gshUk+/Cp8CbEnQakqKSWU9el?=
 =?us-ascii?Q?OtdhWoM6PUUF4KOlRVLpg2jYcRlBdXm6SGS3fzKcGO28v7bMZxhXD82hpMhB?=
 =?us-ascii?Q?Ebk6YIVWSeo3bw9Qr+5o4y4PiVUarJ7t9t28x9AVBpwrNRPIhptRZieyLeDT?=
 =?us-ascii?Q?LkRQlTYaE/TpowNu4DXXzaQ8tNcZH1DWRRGDbeFiycqIRfVVyYd8bTTkiQHT?=
 =?us-ascii?Q?MFuv7YSWLlja7aAPqvtZet+noZdCh0Cq0YG0JNgg6JYN5t7bJsmTbXVcB6jr?=
 =?us-ascii?Q?egXbYu8vJDCa3NA3IY/5IbDZ9WQntlW0malwgXPza7XyNYcl4DG6EbrycWyJ?=
 =?us-ascii?Q?oSvyUVilUbGWMN8LDMaZQJ+tVFhIo6mbBQAo+pKjR9T62mJAgkL68q13om1z?=
 =?us-ascii?Q?7t0t8VSjvKUxddWND+CthKPmE2LTK5UP+hoyOhZTDF/WkzPxFZEayo17ak4L?=
 =?us-ascii?Q?+V7FPXL47fDdOfmq10jJZmChRjgDE+JSR0czwPQM5Mh/VGVZjSTwErc7+q0Y?=
 =?us-ascii?Q?YUUNoJeTgMC5W932PpKy7dN7LrKVl0q9+JcYddi6gOlIp7mfDiaD24KCY58+?=
 =?us-ascii?Q?BURtLrSd++X7Pwne8zViiwFf33DUfHni/llqgKUBYFTCW7dXXuQ0/pkW55ak?=
 =?us-ascii?Q?q7UMJYp7FFt1u9ppcQb7wOR84HjS0cO6BZThbBex0+sQ9i2owReg1E/S0Ai3?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d67fe4-a5ce-42e8-77b4-08dd7deee284
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:31:51.3670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKPgyCMytMc6f9266MwSH2p5sVaG7e6TG5ACN3HxryWj6ole6YV1oyWrP7Hhh87aJNX6n2XN2spzTlr0VAWijmQyZVV2qQMb14vaG2xxOm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
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

On Thu, Apr 17, 2025 at 12:52:14PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Calculating the DSS id (index of a steered register) currently
> requires reading state from the hwconfig table and that currently
> requires dynamically allocating memory. The GuC based register capture
> (for dev core dumps) includes this index as part of the register name
> in the dump. However, it was calculating said index at the time of the
> dump for every dump. That is wasteful. It also breaks anyone trying to
> do the dump at a time when memory allocations are not allowed.
> 
> So rather than calculating on every print, just calculate at start of
> day when creating the register list in the first place.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c       | 92 +++++++++++------------
>  drivers/gpu/drm/xe/xe_guc_capture_types.h |  2 +
>  2 files changed, 46 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f4b08136e472..139e4e3bcc32 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -105,49 +105,49 @@ struct __guc_capture_parsed_output {
>   *     3. Incorrect order will trigger XE_WARN.
>   */
>  #define COMMON_XELP_BASE_GLOBAL \
> -	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	"FORCEWAKE_GT"}
> +	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	0,	"FORCEWAKE_GT"}
>  
>  #define COMMON_BASE_ENGINE_INSTANCE \
> -	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	"HWSTAM"}, \
> -	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	"RING_HWS_PGA"}, \
> -	{ RING_HEAD(0),			REG_32BIT,	0,	0,	"RING_HEAD"}, \
> -	{ RING_TAIL(0),			REG_32BIT,	0,	0,	"RING_TAIL"}, \
> -	{ RING_CTL(0),			REG_32BIT,	0,	0,	"RING_CTL"}, \
> -	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	"RING_MI_MODE"}, \
> -	{ RING_MODE(0),			REG_32BIT,	0,	0,	"RING_MODE"}, \
> -	{ RING_ESR(0),			REG_32BIT,	0,	0,	"RING_ESR"}, \
> -	{ RING_EMR(0),			REG_32BIT,	0,	0,	"RING_EMR"}, \
> -	{ RING_EIR(0),			REG_32BIT,	0,	0,	"RING_EIR"}, \
> -	{ RING_IMR(0),			REG_32BIT,	0,	0,	"RING_IMR"}, \
> -	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	"IPEHR"}, \
> -	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	"RING_INSTDONE"}, \
> -	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	"INDIRECT_RING_STATE"}, \
> -	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"ACTHD"}, \
> -	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_BBADDR"}, \
> -	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_START"}, \
> -	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_DMA_FADD"}, \
> -	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_STATUS"}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
> +	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	0,	"HWSTAM"}, \
> +	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	0,	"RING_HWS_PGA"}, \
> +	{ RING_HEAD(0),			REG_32BIT,	0,	0,	0,	"RING_HEAD"}, \
> +	{ RING_TAIL(0),			REG_32BIT,	0,	0,	0,	"RING_TAIL"}, \
> +	{ RING_CTL(0),			REG_32BIT,	0,	0,	0,	"RING_CTL"}, \
> +	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	0,	"RING_MI_MODE"}, \
> +	{ RING_MODE(0),			REG_32BIT,	0,	0,	0,	"RING_MODE"}, \
> +	{ RING_ESR(0),			REG_32BIT,	0,	0,	0,	"RING_ESR"}, \
> +	{ RING_EMR(0),			REG_32BIT,	0,	0,	0,	"RING_EMR"}, \
> +	{ RING_EIR(0),			REG_32BIT,	0,	0,	0,	"RING_EIR"}, \
> +	{ RING_IMR(0),			REG_32BIT,	0,	0,	0,	"RING_IMR"}, \
> +	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
> +	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
> +	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
> +	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
> +	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_BBADDR"}, \
> +	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_START"}, \
> +	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_DMA_FADD"}, \
> +	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_STATUS"}, \
> +	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
>  
>  #define COMMON_XELP_RC_CLASS \
> -	{ RCU_MODE,			REG_32BIT,	0,	0,	"RCU_MODE"}
> +	{ RCU_MODE,			REG_32BIT,	0,	0,	0,	"RCU_MODE"}
>  
>  #define COMMON_XELP_RC_CLASS_INSTDONE \
> -	{ SC_INSTDONE,			REG_32BIT,	0,	0,	"SC_INSTDONE"}, \
> -	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA"}, \
> -	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA2"}
> +	{ SC_INSTDONE,			REG_32BIT,	0,	0,	0,	"SC_INSTDONE"}, \
> +	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA"}, \
> +	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA2"}
>  
>  #define XELP_VEC_CLASS_REGS \
> -	{ SFC_DONE(0),			0,	0,	0,	"SFC_DONE[0]"}, \
> -	{ SFC_DONE(1),			0,	0,	0,	"SFC_DONE[1]"}, \
> -	{ SFC_DONE(2),			0,	0,	0,	"SFC_DONE[2]"}, \
> -	{ SFC_DONE(3),			0,	0,	0,	"SFC_DONE[3]"}
> +	{ SFC_DONE(0),			0,	0,	0,	0,	"SFC_DONE[0]"}, \
> +	{ SFC_DONE(1),			0,	0,	0,	0,	"SFC_DONE[1]"}, \
> +	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
> +	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
>  
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
> @@ -350,7 +350,7 @@ static const struct __ext_steer_reg xehpg_extregs[] = {
>  	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT}
>  };
>  
> -static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
> +static void __fill_ext_reg(struct xe_gt *gt, struct __guc_mmio_reg_descr *ext,
>  			   const struct __ext_steer_reg *extlist,
>  			   int slice_id, int subslice_id)
>  {
> @@ -361,6 +361,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
>  	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_NEEDED, 1);
>  	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
>  	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
> +	ext->dss_id = xe_gt_mcr_steering_info_to_dss_id(gt, slice_id, subslice_id);

This seems a bit roundabout... for_each_dss_steering() converts the DSS
ID into group/instance values for steering.  And then we're converting
those steering values back into the original ID (which we already know)
here.  Can't we just pass 'iter' from the for_each_dss_steering() loop
as a parameter and avoid the extra hwconfig lookups?


Matt

>  	ext->regname = extlist->name;
>  }
>  
> @@ -456,13 +457,13 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
>  	extarray = (struct __guc_mmio_reg_descr *)extlists[0].list;
>  	for_each_dss_steering(iter, gt, slice, subslice) {
>  		for (i = 0; i < ARRAY_SIZE(xe_extregs); ++i) {
> -			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
> +			__fill_ext_reg(gt, extarray, &xe_extregs[i], slice, subslice);
>  			++extarray;
>  		}
>  
>  		if (has_xehpg_extregs)
>  			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
> -				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
> +				__fill_ext_reg(gt, extarray, &xehpg_extregs[i], slice, subslice);
>  				++extarray;
>  			}
>  	}
> @@ -1747,17 +1748,12 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  			 */
>  			XE_WARN_ON(low32_ready);
>  
> -			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags)) {
> -				int dss, group, instance;
> -
> -				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
> -				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
> -				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
> -
> -				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
> -			} else {
> +			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags))
> +				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname,
> +					   reg_desc->dss_id, value);
> +			else
>  				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
> -			}
> +
>  			break;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
> index ca2d390ccbee..6cb439115597 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
> @@ -39,6 +39,8 @@ struct __guc_mmio_reg_descr {
>  	u32 flags;
>  	/** @mask: The mask to apply */
>  	u32 mask;
> +	/** @dss_id: Cached index for steered registers */
> +	u32 dss_id;
>  	/** @regname: Name of the register */
>  	const char *regname;
>  };
> -- 
> 2.49.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
