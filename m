Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89BDEE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBBE10EA84;
	Wed, 11 Sep 2024 20:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHI0LMWN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE7910EA84
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726085494; x=1757621494;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5RJ8csHjjszDnExTUZvEX8lFdGenbdDKr67NBNrUrVQ=;
 b=UHI0LMWNq78jC+jSThdOAs4qqA6hSdwl+VQNNDdhysYk8JL0Ie4/vGF1
 yB0eeBxW8sfwQsxj4xWVjhdCrijqpK0yRBwXxl5zSkfKNM/BmaKSgOdkI
 7WSl1f8uxRoPaQgcMkW4UwGalqy6O+F3jyw1rujEmjnTpPwYTTlDiQmYR
 MW5cTzhlh47c2KuuvQsy6HzPoOmMUxY+OgBhqrSfFOGErT+yQ5vKBqGb/
 A2fnEZlTqo6OjYTtC2hAnCHNxBRxYG/6eXCn2DDKCC2Ro+si0MV8nJ+zZ
 rULuz1jUi9H+O3vwyyMxCChUvgFRqGlxeQcASbXcRGUXkPiEQNcDemBUV Q==;
X-CSE-ConnectionGUID: YmJCDM9ZQ0u+VPjRr0RXHA==
X-CSE-MsgGUID: VrKtTt2ZS7KulY8Fy4hebQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24448890"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24448890"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:11:33 -0700
X-CSE-ConnectionGUID: idfppMu0Q0iNATZ6FNveFQ==
X-CSE-MsgGUID: rKhnbWKlQrKWhYTlRUVWRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67783051"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:11:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:11:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:11:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:11:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:11:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4V7VQCeJeQ4sY0KXAI05zzxokAb/mYxrcMOWsjjao02otEI0DeZJAhl6Q7KQ3sU+FQCfHmCikXWUXqHa8xVbfkb0D4kYsgS5j43etTO5N9Cfu2f6UUs2F+fHySwObX/RW1oCXTx3P529SVBhzzcvzg2mSxjosQSUexqeZPx0pUQxxF1ofTDsS5m4tO7Drzz2gqellVcZ0ORFagXQyKDJoR3WCpQ79QeESegrrCCWyTaJERxG3923vixlsmmQwJrTr+x+riFmfuLJYVx8uAPIm7f9ObXgzU/VcVPN8lOcHCL2jeNtMIdFd1zIclcKSVPax820tt0swB1y+U6o+bLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqUvodVkvwUJ4xvdXSVZI8Jp0RIHfUZY+xclGVvUzd8=;
 b=IHoLhZ2ofGvBBV3qKsBTjSp5QqVUmi/y9b0KkCDwAxGujz/6tWENFhiXKWrocWbkRBTqyqVR4UGax1G2fh/hZ+EXaUEG7XlOit+vS17uA5Gt6N76Vd38tUxg1I0du6+plJsDep1oT8hoXEaA5wDzWVgsmECguJfPLC0TeU6w6BajLgfMnM+z5RlwvXgUowxbUwYv9lBsZCfB0EfH847P+SqWFdlSSy3q+F18Bs/ylBx7srUpNJZhvPjMgNW17tqACscDrup/ClAtDiTiJa2pKkbpiJQS2LfMcXbnS4C9QvpZNbF9gJ34q8ZyD86CSLoFAEcmyehhZDRhYFeOFBHwHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 11 Sep
 2024 20:11:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 20:11:09 +0000
Date: Wed, 11 Sep 2024 16:11:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Fix build by setting the correct parameter
 to intel_dmc_suspend()
Message-ID: <ZuH5WkDeQKwDA-7F@intel.com>
References: <20240911200218.130219-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911200218.130219-1-jose.souza@intel.com>
X-ClientProxiedBy: MW4PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:303:b6::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV8PR11MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: a83d27df-4175-4228-bb67-08dcd29de012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tmkGjnfZtUBtokgN5ml6hoiCRMzQXflDV4eDcwqHwylRvV0GGk3qF/nhrI?=
 =?iso-8859-1?Q?Vtoz2TtFwLF0yD4UrOvMHbEKTxbEnscgtOATjFxMsT7m1/r0NDDmd0nWSo?=
 =?iso-8859-1?Q?n58ap7pMQQh82s27hsfyWwQ2OYoTy2a5jul11pmTTzKr4gKpg9C0X6Klgl?=
 =?iso-8859-1?Q?r37Vm8FIDd3jFNlzBrf+AVUF0DrJSH1J6ZS301e25sxbRuLNL6MxG1i/61?=
 =?iso-8859-1?Q?s7HeOgfXy+EWiqxYViaiWNDZENnlRCl9MYX666fCZUZb4wAEYaosbc0eMz?=
 =?iso-8859-1?Q?DhLjc25URZ6EuW+J1c8hfLtgoZdVm+JfR8K6Yn4VHnv2Z1pOPDf7RwUUym?=
 =?iso-8859-1?Q?umMThF+EU6vGIylinjhe4W2rJe0tHi0m/89YhM7hkF2VahFvk94Tv9NaeA?=
 =?iso-8859-1?Q?I8I/O3+eBabjHcZdkVpYT1L31s7BZ3WnjraoU9ZecJN4wLM/nxuTp6xKK4?=
 =?iso-8859-1?Q?Cq8zIroPom3OMa1vbcKtoI14SG+M1YaAL6weRXJ/7sQO5pWIr4cD5IMGlr?=
 =?iso-8859-1?Q?975scuUuHdijuInAFxVwDKyvazypxcrP1E7vKL3lQYAciGmuwgVgsx4JQE?=
 =?iso-8859-1?Q?MqFcBE+tIBptWOLJZM7w5B1q7FVnss04jn9P48Wj6E3ys9F2vf3vfyl1El?=
 =?iso-8859-1?Q?Xdb4nbSf+imQMIMExixzaRwwNi3khxBhopvDlGrARhCcYHySn73lqFMJBA?=
 =?iso-8859-1?Q?lf3ZlGGOpWOHqRjOY1chvjhQiTJ+LxB749KyvYWi+lxVrfAYjCMo+lOaUI?=
 =?iso-8859-1?Q?LfML1PqcR5uH6moPqxlIF4aLMeTNAc4dkTKIqk1MWDrG4Yu8fHWsv0kP7O?=
 =?iso-8859-1?Q?pRe/yIcmVZWsYNkRk/FQqXwYv+P86KNzHo9f72Pl80Bk4LfDVWq/ZQ4Kjb?=
 =?iso-8859-1?Q?hFnx7A4v/0GMa/AD4EKOZfh2Px5T14hzhYWglsEeMoS6r8RGdoCdsY1x69?=
 =?iso-8859-1?Q?oF6NQKb1ebSNDAGQbAL4gW+WmgbIV7Aw9iA8THQPvdpBfGIeCvX9Y0CoDX?=
 =?iso-8859-1?Q?AdlPtBAkKSZTSsOHuVGaGnuXtFHtuJ9yDJhaiFvRUMevQg2snEeoRInynC?=
 =?iso-8859-1?Q?P0XErM4iHJnuLQv3hWTqYtkR9e2YwztGHr3wThjMMIW0zwQ1Dy0OWAleQW?=
 =?iso-8859-1?Q?sdAD7Iab6VygGLTtyRtcHTk4A39PSsgZ+rIEUPuJpbQlU8ixI2pHVxakut?=
 =?iso-8859-1?Q?3zy6Qarkr1UnbsvexLpK6ifQDqxScYmMTb29P8Tl8eJOjM71HZyXAbAn2n?=
 =?iso-8859-1?Q?ZVW3yNPeCxiaL+5i/Rb6ZZ07DjmydBIde7if3L8vdY/Dat/Uttdy7uc/Xj?=
 =?iso-8859-1?Q?/X/5ZH/matyuO+PFmTAbQIGdeqw3BbRbUG8BR7GwsHTS1IE6rYwKsxjRPw?=
 =?iso-8859-1?Q?UK1PkFWbvPMlPJH2Wx99wKsqbrE8zDvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TDBL4PISBs2LH4YHA4BA3pU2aY6NYGgeyjkxHrq+EeQxLfZtY3/QFSyB9K?=
 =?iso-8859-1?Q?XhW/ObhOX9uJzaJ5O59y9GlaOqwzl8dD5D2zriRyuTxAw3BoLEwDsRESot?=
 =?iso-8859-1?Q?p3WKRzLQImE9y+JWs+0dIbimX6XZrl+BL9vEDJKy1ObeU4Plrr28AHRtS3?=
 =?iso-8859-1?Q?bll2a2gSfNybjJlxlcGKLRDyw1rStiXFvuyvX/GhhA4RdKFKq26FQqHSV9?=
 =?iso-8859-1?Q?d/isKK3OgDtok44pqSwc7/EYSfj/SACC5j6SIimYL3Gjmm6H1SvG5LNrH7?=
 =?iso-8859-1?Q?UWbCwRnACmRm7B4xX7xFBoLFRlJIfdVHu6le1/PrD0ev11imh9ST3o+Y0A?=
 =?iso-8859-1?Q?kQ+es+Q9U651kSKLv8Nzne0oT0PZWujqcgjNc9O2gf2SD9QUFRXkuIvRps?=
 =?iso-8859-1?Q?WNdaKFeI86QLVJTc+1IClqIYa9IrhnA9aywj6RDEyp0w0CXMzRPiJv3OAT?=
 =?iso-8859-1?Q?T5zmhH7TBmIizZoB2n2tXGHuaaSWpcUy6V5AQdMpM/aiTIJkk4h1JjiZxA?=
 =?iso-8859-1?Q?0pmRFu/ZRZhBQJpT4gdsGnr7IOSlOFUioBUYcVoDNvGXXMC6Yzly1msWKC?=
 =?iso-8859-1?Q?SZnVrBLmtP4y7/A5qpaGeik/AhIIqKw1ZO51SThJTBpdymwc2YS9IkqFgb?=
 =?iso-8859-1?Q?SHIQdNj8f+tTWlTE0CpPaBj7rfJBOLRS+psiSJJ92K8PuywNABh+Xlhl6X?=
 =?iso-8859-1?Q?988OQ7FLpJQLB/9lfxDkGIlM6ZQi31MXYX55z3I4TZGikZtMVsriz4K5a+?=
 =?iso-8859-1?Q?E72xImWE9D5VU3bJQhHZwZM3TtvNsenpUmrMYFXbN81ILDipA95uhVFXZQ?=
 =?iso-8859-1?Q?C5wWvO7FNRjGkTjiVTcpyI24/Poud0N8MdognNKFI/bjcdNMmAAv8ZCYkR?=
 =?iso-8859-1?Q?0JifjEpjk7xScTUkZFWiiGy49T8KHyBDy+0zjvVxamkl+B8IJzSPmnfbiS?=
 =?iso-8859-1?Q?OxeQMbM4l9Fwhlbvtu41s1WvAJcgX5FsdG4OrRONXm0CnshWKrgrk6O/OP?=
 =?iso-8859-1?Q?D2Ri5QoX1IgOPjj7j9iCAed3z+CZEudsKggy1eibI+FhPzbB/ojuAbcw3M?=
 =?iso-8859-1?Q?BLN/AL6CpDBnjtiuKgXVDX+ftOsY1jgPPwOxgs8+Q9pnMyxaZEcsufbo/n?=
 =?iso-8859-1?Q?Fumzxaz4HJz3t9Sbgfpl+hA/BYjYSzmK8dppuTkwztNqec2e8PjZF78uuJ?=
 =?iso-8859-1?Q?A2bAxqXoud7DWbBCx4L367PsDOwZp7KjuGbY3VLmIhYXOdGPvYi1gdJPO8?=
 =?iso-8859-1?Q?qSaHiWIlgQCrOw8gd2mOPG02K9lyokyi1y3urBWC/qlTCxTdlGNx1piCmB?=
 =?iso-8859-1?Q?HLzqW5PTlRLcHQXwsTfUvd5XTYJzi5/i50CckLo27W0x2Goo0/fSf23+EG?=
 =?iso-8859-1?Q?16GV8yTI4l9jgWA6Xodd/3SRF0afAH3tfzXAkoBBFu5VBgdwgxGnV5MvsL?=
 =?iso-8859-1?Q?sH6pJAbt1vMdK+0gCBy1zw3jrGNB5lBtnssMIfiL1gZY76dw35jmX5zhHc?=
 =?iso-8859-1?Q?0D9tvG3nnxXgQIWifAtk5gFQK5JBNP+UQgIDJ12HE/RskNODLouSOwhMFD?=
 =?iso-8859-1?Q?rzaWOCYNeAK+JWMYUT+eI7E3KMdZNeNKQfmDOMHGB0nPK9fP7MqLyaO0PZ?=
 =?iso-8859-1?Q?0McnRiWVo40cePkbhCyiueGyps8ITjquAWDN5BKHnULQjJKSQjuqN6tQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a83d27df-4175-4228-bb67-08dcd29de012
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:11:09.4291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xas3ouEH8NrEOcMvHjIliHGxK11ub3XkjUH/g0Om9SSppNvrtMCsxTfxsqi9UVacqN+lixNXIKPGpBrE7sTjvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
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

On Wed, Sep 11, 2024 at 01:02:16PM -0700, José Roberto de Souza wrote:
> intel_dmc_suspend() was a intel_display no a xe_device.
> 
> Fixes: 501d799a47e2 ("drm/xe: Wire up device shutdown handler")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 3551a9c8eb755..e65e7d70f9890 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -377,7 +377,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>  
>  	intel_opregion_suspend(display, PCI_D3cold);
>  
> -	intel_dmc_suspend(xe);
> +	intel_dmc_suspend(display);

It's a drm-build conflict that needs to be solved at drm-tip rebuild...

I'm looking into it right now... Thanks for the heads up

>  }
>  
>  void xe_display_pm_runtime_suspend(struct xe_device *xe)
> -- 
> 2.46.0
> 
