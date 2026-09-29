Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4278DCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF50D10E45E;
	Tue, 29 Sep 2026 18:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlPTsIgm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44A810E45E
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790706269; x=1822242269;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PcvRKzdqJ/P2RhH3UjeS0rPPRC5c+7NF6Rz94W1w5pY=;
 b=jlPTsIgm7hPssZlkU9JAEnHU7RHkHszK/s46EshlQGgcIvuudW4NgG0f
 0h5QFKwwQwCStYily7AjxM3FapXYb+wpxYtblWRzAJEtQgflRdlliBhBX
 8pdpt6stxb2SMxaegVIa68Cjg9FepS22cL+HSY+g4o5AFRZrtZbOVyHxy
 ohjGdbj/q8O9uzgOTdNlEOWDvKGjFsBUWQ6rASxO6lx4wFqmus7JciUjW
 mxPmG4SZqaG7zojT7BxwKG9eVBTJlhRqnndhbdyulN1rt1E+hh6SCbind
 9PLDyQu8QahwIJfE6AiYq0B2MBPCs/rC+jx87MaclkPq2rPkq8r92Z7yy w==;
X-CSE-ConnectionGUID: M+nGj+uZQgO23/0uLfo0MA==
X-CSE-MsgGUID: 9zQMGfjrRXymVglSnL+VKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95248577"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="95248577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:24:27 -0700
X-CSE-ConnectionGUID: euW2ohQhRpapyPJtwvR69g==
X-CSE-MsgGUID: bBUykGpPS+mVWjPxQM7j5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="304953842"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:24:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:24:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:24:26 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:24:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBRmGzRXUlCsceheM5t8Ti39sa1QPXWw17ClbwOXuuuibRVzctYszkYhG+t99a9/mrUm4UZcS9h1Ed12ce56VL2yvNP9BgVwjp1e2XMbt2Hu4PCyBVBfSI3KWvLH2xxyfN3JNitr/xeLsi5vrglSVPU1n6GTdZ050SD9I61GPAiECOkqY8WJTQYdCSb2czj1oYI4IJ6ExPNhtezhCfy96w7GVNAQlwpeC/xKzLsX2Hbhn/rxzBVpvF1rT6zl3Niox9ws6rR9z63bnZuXEmPbB2xOU9Sjv6OzMYqJbn7eI6C38I+N8DtoLFN7M5kSfdQwb6uZctF8Ywp1G+L6h0GgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCi2OiQ4TH8LkTgohIaCR9YX7Wfvf9wAJf4aSV7Ql3k=;
 b=iTfmggQk4eHRHYAcVjU4HK7N0Y5kAZRtkyFKv1qevbLwQBSZiLsXEthKo74XPS6yBYtkrBlw/3JXtixluKnRnzQZbgBXvpschcAKJ7k4Rb4cbYI9pLVFsKrUz/hppzXe5YxFyY4TqJE4QxKnczJNoKCb+BqHUmjzGu2TRGxmrdX+T7NhIm6629QG24Q7tzaZVZ+ZnC/tj58xY2CGVL0GkluiQlY/wZPekE1+gUWOugpUYvu/IBJKe3A9kUlrBWoY3gNfcTOpDWP2KbrK/V5FZBPKfFz3XW7jVJdTQLNkn7UuW9kFXCh8LD9GXGDJgEIYUZrWQMg+kaPc1PEvu4z9rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB6977.namprd11.prod.outlook.com (2603:10b6:510:205::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 18:24:22 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:24:21 +0000
Date: Tue, 29 Sep 2026 14:24:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 11/13] drm/xe/hwmon: Decode CRI temperature registers
 as IEEE-754
Message-ID: <arwCRg8uwLITy7Oj@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-12-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924205429.2846256-12-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: d1630e4b-8ecd-4b87-a83b-08df1e56e189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: o3DXyXm9buYw5gwQXcihiiBasj+fNYkmlEncyphDLhwPPAbqr/5J2gUGp9eEGCmxUeC/O66hOM7BooB1QxE3zgVBNc1EVdvDz86UWSIerbaOewumPoPkyMeFhzkzuFR3fkTXWZuuwGCoGr0N5McWxDdBizNiVCLfvOh8cLTAdDIUO8tONY75rxztWDBHb4I3J/vGBrUZieOq1PSyrxo1Z6RunXgjGUsL0I1/azFlPjzXv5UMLa7QBOHDjWnYh/DPilniCcDIODEPUkX7uJQ313OwzYnK3ZBHr7BTxZSndjHhdrxJ89c9mNhIj2v4CmrPnkNSfmSJQg4/ZkwCIKFy52JDXRbMmyJ2bd20BiIJW+Rm3nXEyYVGjmNBMwwY4AEw0sT0aIl4e0Oi3f7M8YRFqsy9bQqY0bj9VUjcCpLhUyeFPsHfxDLso5JHSEILrjJam5z3b7F9/y1Ix8w++q4fsw3rdVMgndYz4pk2Z+Ck3guf3N/HFEzac1l8zysY8JSS/Iziuhrj0o8L43uJEj/BIeBfnEiLyFr/nrPDlEUg0vcqVPMkSThlspoBNs9+xP5HSeEG0nqQC+7u7jZqNMl1gQwO+LXGkxgjEpbCRalQamagXj0nQOk3avXmNfjtv78cEEbqCSwYPbUDSLv58Xybr1PGZBIrlWowZRH3XTwdZSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NtOiqWWDvc/wi7JsYKfHfqjl+bU+iwdf/EZC1MeeeCS4WC3cRgaFpeoKRA?=
 =?iso-8859-1?Q?Q0yg7jP9cboTOL6nkByco39BxdRTo/42f9vBEELBYrHi0uUXUwLgovqEnB?=
 =?iso-8859-1?Q?wFqhlz/OUQhqjVhGBvK1U4xSxT6pFf+FWNYifUJtBGLYrCHm2ibmmqT5kF?=
 =?iso-8859-1?Q?V2Q+jYXJ7ECIoSzQNFXKgfpG2rRKA3afQtSV1vmVJrhdtLkcJKoeKyLBDn?=
 =?iso-8859-1?Q?0CteDA0Obp85Fh0MMBd0zg+B5frfOP5y6RI+njcKpNrTIBnWA5SQt2PBFj?=
 =?iso-8859-1?Q?I4VFTU9KFzIrHF3uCQlBH7Go7gEldpRGDISaaKV62gdmsE7IHu9pgf6Hsd?=
 =?iso-8859-1?Q?5RbKWNp+KFTs19BkLF0gxCCOIvKvjp1Xf93JjxMRpIhAmLBSG9F0ZGAI1Z?=
 =?iso-8859-1?Q?fAozBFDdgHT0UYRxTRY4WVOpCYgIfo2muS7YIeA4AMka/RjKqVgGM1Kwd8?=
 =?iso-8859-1?Q?cQARmf8i6BHl5g/NtCy/SDmc+5pJw8q3aV+QHjqcelhcthGPnlefIqBUJb?=
 =?iso-8859-1?Q?2X0Y1zUY7NKSICMBe7L/p9CLMVhDW+eysWKpTUWreVJzPrrqMSCeEVb4Fh?=
 =?iso-8859-1?Q?nxNmX3eG5aXpWYwRXy/qyFh/kw0ZH5TPubCKnqne19vTYvFRpFh2L/wT9e?=
 =?iso-8859-1?Q?lA/jyz0nrPGFsufMZMbeXOIN8wo/m+p3jg4T7ncyWX5m4EWhRMTt0jKKMK?=
 =?iso-8859-1?Q?s0Al/vGLAskYjhvkili+y/Vhfh9n/ex8mpoWzq9qwEGBsQZXI/igsotWh/?=
 =?iso-8859-1?Q?cYQ+MM7iBq1vv1+c75LrwuunDLsjgcSd/C/e63KPgoDEI2ixJPvbynwPm9?=
 =?iso-8859-1?Q?9JDtM8S6Gvk2Acn7ZCJ3luSPEmdFO3shsAe2cp31jsAW/H7NmP+oOm6rbW?=
 =?iso-8859-1?Q?ZcYjpxPa63pv+PwYBlAWDEK9H7Zc/eWwXtcOCorMYjQJczVOUkejlse3WA?=
 =?iso-8859-1?Q?yfFykeFBpXmkTBhGv52G0qeiHHIEeNMVEKaKUs58cnX9rGUk8o0oNIgNzi?=
 =?iso-8859-1?Q?sSIUe2vGmvas/sBaQfIdr9n7neK17fxjS8jxgDmffrFn/JCyAPsDyHcMFo?=
 =?iso-8859-1?Q?2iqktN8LGb9DLsgjzyLjYIhMholXUBLHsjqms4sujIHc6r1UWQtk3nZkS1?=
 =?iso-8859-1?Q?OSc2j3MLrp/Px2snGGrO3+/BObjKdC/OfUarN87in2idFwLUs6RNzKCs5f?=
 =?iso-8859-1?Q?+qMvjtK4V2IscQR/064NgO/3uZptZLK8EQyshvf3GZMTtZGU2s7ryk2RUk?=
 =?iso-8859-1?Q?OcX9hBdCzmJVB1+842FTtqJb7Gqt/ECYssr896e2mQai6Uu6m8To4Bl2w9?=
 =?iso-8859-1?Q?tTFq81ipNkRqofTwaC5lJAv4Zq/48/6yyHaQzY0hQIULkVbtcLJEdRL3l9?=
 =?iso-8859-1?Q?aeMPGcUVTmIB3Jwq7MiMLNAbzhQTx0dLvDQfMGz1PR9r6Wb3RgNyW6rRbC?=
 =?iso-8859-1?Q?R4KBLTIz+DQNdLvVoun9ibQ8iMX/nkRMCWZaut2cr2JEzRxZ7v9dBfswcC?=
 =?iso-8859-1?Q?oowIgWSzO6RAYxQiHxWOu5wd+rHzHKNuKKi8uEax+AbsoidkXrXN5eiya+?=
 =?iso-8859-1?Q?RbnKk3fU0WsW9W2Lkq8+OfirRcn3UkJL/0Yx9R759fjjMGS82OZgWRQWtz?=
 =?iso-8859-1?Q?t+lfxNi9On298fpB8yqEQaLO/r6iBFKIeLOKAMEarguhVT8wTQXPlQThW0?=
 =?iso-8859-1?Q?Xagk7yl/Fl09C6QOXN/wRRZKs3sRinzPGcg38kWLqCxbEsM7VCP2G3JX9O?=
 =?iso-8859-1?Q?e4cmmrCjDByNVyv5oGb9DmUivaH2qv/GezQPeSUfSeM//Qsz+vUwBozxSA?=
 =?iso-8859-1?Q?Y49baFkDn8z19dOfjEdYK33nzJAao2I=3D?=
X-Exchange-RoutingPolicyChecked: K+o1BCqccv3pgLjmnmhfqJhIAjSTgaidnAU9XYNiQTPVA3qAIOjre29ZRnyodTl/TE5GlzQ9lndPh3750qvX5NPK+EwMCIEAfY1OapHdTNcoBlwREL2HUHzSNWYRbKyAyw7MCkBzTcmuzeNz80HXcSZlD1mcvH1S2KfjyVhkbNLU9RBCtxxCP4YYmdDhTJrI1PRkH09kogR5XQQ4yyIMI8fIGW9IaATp2xqJANHAATjWuEImurkQRaPKN1TLg5f8LCBFRQznQqioaH54/VtiEC/s0cL1qEfD+QblC8OvPqyITRXpHT5jg+cbA6xXiWnCwZKnKl37jd3wN0X+v73t1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1630e4b-8ecd-4b87-a83b-08df1e56e189
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:24:21.5996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7s2Ex/vk0h6rhEjkMW6T5aCo6ZQfYgXhxu9NQ+Jzif6+YGk5MSDhY5/WEr7g+kFfzUIjze+Ey2m7oOX0WdG4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6977
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

On Fri, Sep 25, 2026 at 02:24:27AM +0530, Karthik Poosa wrote:
> CRI temperature registers encode package and VRAM temperatures as
> IEEE-754 floating-point values. Decode these values before exposing
> them through hwmon.
>  
> Use integer-based IEEE-754 decoding since kernel code does not use
> floating-point operations and hwmon reports integer temperatures.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> v2: Reject temperatures that overflow long on 32-bit.
> 
> v3: Replace magic numbers in xe_hwmon_temperature_decode() with named
>     REG_GENMASK()/REG_BIT() defines and use REG_FIELD_GET() for
>     extraction. (Rodrigo)
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 92 +++++++++++++++++++++++++++++------
>  1 file changed, 78 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0422db647d11..76251d949b11 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1239,6 +1239,69 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	}
>  }
>  
> +#define IEEE754_SIGN		REG_BIT(31)
> +#define IEEE754_EXP_MASK	REG_GENMASK(30, 23)
> +#define IEEE754_MANTISSA_MASK	REG_GENMASK(22, 0)
> +#define IEEE754_EXP_BIAS	127 /* Exponent bias to obtain the actual exponent */
> +#define IEEE754_MANTISSA_BITS	23 /* Mantissa width and implicit leading-1 bit position */
> +#define IEEE754_EXP_SPECIAL	0xff /* reserved exponent value encoding infinity or NaN */
> +
> +/**
> + * xe_hwmon_temperature_decode - Decode an IEEE-754 temperature register value
> + * @reg_val: The raw register value to decode
> + *
> + * IEEE-754 single-precision format:
> + *
> + *  31 30                         23 22                         0
> + * +--+-----------------------------+----------------------------+
> + * | S|          exponent           |          fraction          |
> + * +--+-----------------------------+----------------------------+
> + *
> + * value = (-1)^S * 1.fraction * 2^(exponent - 127)
> + *
> + * Return: 0 on success or an error if @reg_val is non-finite or cannot be
> + * represented in millidegrees Celsius.
> + */
> +static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
> +{
> +	u32 exponent = REG_FIELD_GET(IEEE754_EXP_MASK, reg_val);
> +	u32 mantissa = REG_FIELD_GET(IEEE754_MANTISSA_MASK, reg_val);
> +	s64 value;
> +	int shift;
> +
> +	/* Exponent 0xff encodes infinity or NaN. */
> +	if (exponent == IEEE754_EXP_SPECIAL)
> +		return -EINVAL;
> +
> +	/* Subnormal values are smaller than one millidegree Celsius. */
> +	if (!exponent) {
> +		*temperature = 0;
> +		return 0;
> +	}
> +
> +	value = (s64)(mantissa | BIT(IEEE754_MANTISSA_BITS)) * MILLIDEGREE_PER_DEGREE;
> +	shift = exponent - (IEEE754_EXP_BIAS + IEEE754_MANTISSA_BITS);
> +	if (shift >= 0) {
> +		if (shift >= BITS_PER_LONG || value > (LONG_MAX >> shift))
> +			return -ERANGE;
> +		value <<= shift;
> +	} else if (shift > -64) {
> +		value >>= -shift;
> +	} else {
> +		value = 0;
> +	}
> +
> +	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
> +	if (value > LONG_MAX)
> +		return -ERANGE;
> +
> +	if (reg_val & IEEE754_SIGN)
> +		value = -value;
> +
> +	*temperature = value;
> +	return 0;
> +}
> +
>  static int
>  xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  {
> @@ -1248,26 +1311,27 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	switch (attr) {
>  	case hwmon_temp_input:
>  		switch (channel) {
> -		case CHANNEL_PKG:
> -		case CHANNEL_VRAM:
> -			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> -
> -			/* HW register value is in degrees Celsius, convert to millidegrees. */
> -			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> -			return 0;
>  		case CHANNEL_MCTRL:
>  			return get_mc_temp(hwmon, val);
>  		case CHANNEL_PCIE:
>  			return get_pcie_temp(hwmon, val);
> +		case CHANNEL_PKG:
> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> -			/*
> -			 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> -			 * [7:0] fraction.
> -			 */
> -			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
> -				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> -				 MILLIDEGREE_PER_DEGREE;
> +			if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +				return xe_hwmon_temperature_decode((u32)reg_val, val);
> +			} else if (channel >= CHANNEL_VRAM_N) {
> +				/*
> +				 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> +				 * [7:0] fraction for platforms before CRI.
> +				 */
> +				*val = (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
> +					(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> +					MILLIDEGREE_PER_DEGREE;
> +			} else {
> +				*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +			}
>  			return 0;
>  		default:
>  			return -EOPNOTSUPP;
> -- 
> 2.25.1
> 
