Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F61CCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3390B10E4AC;
	Mon,  3 Nov 2025 17:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edktj04S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37D810E4B5
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762191785; x=1793727785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+iV3IquItMk6EjUMy5co1ZDnxU5pHlYgDd/4/GYikG4=;
 b=edktj04SDYHQ4BULPa9Ku23TwOedx586bnC1lOSAY3SHDDioMSWpXyjI
 ZoWzeeN9+E+fMQoPKzAvK3fRqUUOtMEG+rujudQu9pM6F4DacrDyL6xXf
 ahJ03suZYZfEbs4ZrRiNXiXYwe+Tk2ciATFkhnVJQttECNmssFKN0w6e5
 OW2eHkLwr2l032n51O6hZPcw1slg2TbOSXAwMrRwQbkfHchdmjaUop90Q
 hYZ2qWe8OtG9520eP8jYGLJv0GG5rftDkT/RNnoDiOQD6JsypgRp94O0Z
 Ksaf8D1H1bpkQDM2YHVRKaCvNx8oxHMbHq0GdK8vRf/5z/kgINEeZFXsK w==;
X-CSE-ConnectionGUID: Dn3FsYlKT821vO6OfEl/rw==
X-CSE-MsgGUID: t86tD2J2Qpqtp/PXxlSYAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74877104"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="74877104"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:43:04 -0800
X-CSE-ConnectionGUID: xM7kZvpwSOu0OuehNrGUdw==
X-CSE-MsgGUID: uGOI0lBpQ6yJHKs9DMQ4pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="191019113"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:43:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:43:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 09:43:03 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:43:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otnb1xPrckOhgp98rAm3d8157loU4im9/fFGucrVC7lMzvtV84u2qTBHDjQJ41i5D8qQpYqb+pSyg69S4mfq8GCdunYGNowHSgx4VEolqJSQR62MdKtfQJ5LpSktfNeyUe0F2E67/Bnq4A1lIFxhnWEz0hq8x43cAURQhI9wPXdgv4BseN8aZTVLX9zTsZzW0iNadtOKipT8ygpjrap+ZoaAg4v+elnsuojis2NIeXfMmMWk2kDhPWzK19Yiwwjf45db6SbNS9OAUK1SxtmqIUtTVIeaVhMQ0c7N1xgfcIzZW8Z7oOkD5oZJhskbCmKiV0GIqQdSAdjm2KWAkFaliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41XjfN96/3kChJQ1YGY8TkosQQDixfHytQHfKPZiDBA=;
 b=FtZzPnVdoytBFE4evh6rm8YO071Qfjd+yBk2kFvVyXktF7uY2IkpS0zz6RMcBTZP+x9C77J9WC3dV6z0EhmV253KaMAK/0h/QzQmUMFLvPnd+d28H4LafWyGrYTuagpJVKNaoScQI0vuzDxWYtCNj5KpsyFEw/e7CDyva0P2+qS3IqWN0LdY82a180pvnTHO4IGqa9SW3uAEWnGcvNehu+Y9OCypFeajdZ/bbJHcZIROAkRktJ445HNI2lH5Mxffm29XZX1+2LlHZO4Vpb/bU4yZKxFsiQQOCaMG2Bsp1TfVHdJGVaWbtTiWUyLOpdpnDe07znd7LksBu8acmHzCkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 17:43:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 17:43:01 +0000
Date: Mon, 3 Nov 2025 09:42:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v8 3/4] drm/xe/pm: Assert on runtime suspend if VFs are
 enabled
Message-ID: <aQjpojCP1jK7WsbV@lstrano-desk.jf.intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
 <20251030122357.128825-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030122357.128825-4-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: f06a1599-b1be-4afe-36ee-08de1b006f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nB5pipke2r1ifF2gSUIO9UWTDtPd/QAizBxrDYd2iqXitaUVcHMQMxFAB5Bn?=
 =?us-ascii?Q?98JWqX1Ln2VC9/FoSJT1Yb0yUHQvrshKZfwExatMVyKjcJaAlOGskUA/u46/?=
 =?us-ascii?Q?eOz9obagoNyxHOAOE0PEq7pQAgxfKGnxdxDTcSxEW2vq5NyJ8cm5A5adVA1X?=
 =?us-ascii?Q?+QQFX5nn5qOz1526npO4V0EriObFPBdtG1hBHrRXpct9tOvWwv4Ja1MipQHx?=
 =?us-ascii?Q?YmUuEKY6ZqP7abiIPR3TRhnPw0hZRuXzSahinuazNw17ixCwEAr3S13vm6ZJ?=
 =?us-ascii?Q?RT/0pqEgBCfzpOTIGqc+dzezxOl+InlB4nmKfrCf46+zpWGC1gvxQKfOYX2U?=
 =?us-ascii?Q?HdPLUGqcTq9PZbQZEyJ9pndsND19UgjxYBXWSjJGPPMR3M2CuDMZkkyNgKW0?=
 =?us-ascii?Q?HH0rNWU1eBwNF+fHW2iT2bLiJibzthd3kz7WgdZferWoKorEqSc6Ckm8eUb8?=
 =?us-ascii?Q?ipxWAAV/RQXE+cUZ/GwjSnkgilwZkqPedgBX2Af9qLH+O0Tu12VO91QUT8JO?=
 =?us-ascii?Q?JhRdlrPUx/u6wQotIIlN1wKQEyGzuVryOC6obtdrFT7MMnr8WKcdR2p2NzUx?=
 =?us-ascii?Q?xxaV8op+DLzjEMsPKpow0N5fJ8Ek9KKGbdxb3IG6jIbPuGSj00U+Kngz8HYD?=
 =?us-ascii?Q?2oYYG0oGuO1Qb+oluFPOJQZXRt64GY2rA7khBCOWJigbbsWsqDKrG1onooD4?=
 =?us-ascii?Q?CpBeSr5NYQ1KLI6nN+iDpOzBqkJFYVbxgbSsBCy4Wa7DnnyS7xWEmUvbWTYS?=
 =?us-ascii?Q?x2I4zyA5DJyH+udlWTcUFxd0hvoALpzzdXAnUl0p1yqXjvJPM9Q5+0KY1aiY?=
 =?us-ascii?Q?SAzpOM7a2sf6CR83c18KZ0ryiBigLRFhYnH6+0awtuyEWSQbaivroTiTQO+/?=
 =?us-ascii?Q?IzkRWoVuN0Yba+iLVPWfQZbe6B4PRtvQ5sjUEggFKTO22lBL+uD76tGt+pfB?=
 =?us-ascii?Q?u4f/phvLAftbJFt0ovVdjHqSRayhUOhHqN7VNe3L91pv0BhT2jqfbnA3zpBt?=
 =?us-ascii?Q?Tf2VPzRBYf7oAcfc3I07LkMpVattqeOXDhYQFvGFRB8ma8/rJrz+X3cnNlnn?=
 =?us-ascii?Q?2dsIEkUQRXLz+nqwNXSskpPxoTcFU7dKlrB7EkmLq7VbSn0j6eBwmU5bq2rR?=
 =?us-ascii?Q?iCryhLqsbWU/aR173p57tlndhxNxxEVTexO4237laHXb30AfmhVzNxvVYrsn?=
 =?us-ascii?Q?UAmu1suU03meicOxFEsubHGEwSDhp/PjS2toTdCA3MeQOzvXFki0y/SkRpB1?=
 =?us-ascii?Q?iJW/z3qeEZvnpJtxgZFmX+LtuKy+TeN7fNKmOIWHCYiUxutNmLxp6MCnnyDH?=
 =?us-ascii?Q?e+cRLkJ00UtQPcwm7Y2iHfnjd+OhcVMu3PrazVwxhjF4wmuqCPmQSa+SOLYp?=
 =?us-ascii?Q?rtdgoJCGcxW64EPoyaC9TrXWYHLIMT6/hPa3I4VU+IEFx33MKcqOq38mKXWK?=
 =?us-ascii?Q?e4yWDhEU49meq+lXQPpIY/wd3J02o3vm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0H0YGmEpcXpyLQNUYND4165teLuHoc0LMw+aTLjBRASXnsIOhvcJyyN0bArA?=
 =?us-ascii?Q?LP7MPXTNUZs7vjYxUz8L7T0jksjL/HF1PzOASYGLBPwjxTRt8Sfmgc9yTpiA?=
 =?us-ascii?Q?2DDpxBgh4zD0vLbIRSkwAi6LyaEYEZLqQFcKX6s6E3fVL++ZcbkKyXc7xcLh?=
 =?us-ascii?Q?3dUdixiYx8584W0gGZLFTvlf3Qn5y3UibHMdypCdEz2aNVWB4arz6W1MYhlM?=
 =?us-ascii?Q?ltyGHHKW6FxIqzQBGhgDbAf8jnGFOLChfNW5vQcDGzji185lAWv3Q50ZxgXR?=
 =?us-ascii?Q?7WITH9TSbnL8I1roZYI9C2P7J/X1aBUtoD8NZfIKJDIkmb2hzNjCeAN1HtwX?=
 =?us-ascii?Q?NYDUHZswUDgYvMFZHRCnkp6z+PHHq+wAPgfqgVNPevvFxt4d2ny9EmxS5AzH?=
 =?us-ascii?Q?qN42Z04KjeCg3IWsblm2WXSxFjVEefFBse4A0Pr5/pXlAc7OehfF3sfGHxAC?=
 =?us-ascii?Q?35oy2GxtCblFpdU7KPsWK+pv9iQlgoDKKI9UN2QdK/fZiUqHIA7KczqKHTKL?=
 =?us-ascii?Q?e8IXAH/gTeLDxW+VfzAWgaPxUnq4gPHMAgq+ChWfXIM6prOTbX2jCPsT2OyO?=
 =?us-ascii?Q?QlPtWOlvtHxb3kOLzP1txJhmv2qcvWiU9OD7Rfo+ZUzx31YKpNOe5uoNO7hr?=
 =?us-ascii?Q?v71pxA7saZ2yDVwCbxKLJL3wbyj8ImTVWPbzjifl59OVj7Us3sRpY+0V560b?=
 =?us-ascii?Q?TjeQhhh0JDmZiSUvgINAuXKSPI4mlzw2RZQ+X4QieWSCqb3xwS8mAf3Ngyes?=
 =?us-ascii?Q?VuKN56RwEtr4qf4vdcVeys6IoMeJqEsV7tZnZAyZWdAA9NL7j0OsQQDwSZFv?=
 =?us-ascii?Q?4lzATBzy5Z6shzb4bVtDtrPeP/Djt37u/rBrGuvOir4r8RREviyNWOmzv4Zi?=
 =?us-ascii?Q?aK8z9fiy/AiAsYOmBc8pu41LNURYg6xd0LyHni4sgu2SGGxDIQFX5cY5qndF?=
 =?us-ascii?Q?3xWtWV5HVyTg3OwfyTT9l39jhIsw+7FhY0sPx113+SYXIPsf8whaVcdSQIij?=
 =?us-ascii?Q?tQkFz/0Cau/u6J72dhgzsJObJ36Kz+jiuA1N3QKdZKsNffb+ZfTXRGIN4mew?=
 =?us-ascii?Q?iBWAehj7/0e9mQ2PNRiLlT25Gb+zWWjKK1Xs4R8smlZowaR5Tq/s28Lr/NSK?=
 =?us-ascii?Q?1udAHnSC3DuDnu3cONDjF2Gyc6yoa/DC1S3TrLF+SzOLgCVXM6IDNnWk3Grm?=
 =?us-ascii?Q?R/oqfn8TysLjtrBg2EsGD+ys1pLaYODgx1Xf7x3U4snOC30PBM5T8uHlQ9n3?=
 =?us-ascii?Q?Iq6mYjzyco5O8hcYPhfoDleRX7T0H1SWDPVwaBUp5JGz6LPy1AsAe6GRMHZf?=
 =?us-ascii?Q?k3MsT/BOSEe5RCgS2zGW/nKL/19uieUJaidpz4IX5//1AK/xzUsBNel0fnTH?=
 =?us-ascii?Q?NhvcxoSbjwoJ7gL3Q54yWiIj8ulmy+MNE13sEMRKPcQrtAfHbsnQ5q2AXnLX?=
 =?us-ascii?Q?PItSwIvC8kQFVp2nhT5zPdDZh9vrG2tOQ2NxtZojn8rowGuq07iX2wKhpmCZ?=
 =?us-ascii?Q?Y7+Z5jU6eoC9rmC5wZ24K5F73m8zIuXGRKjufM0AHX02G2UqecjqhozKV9U3?=
 =?us-ascii?Q?/obWPCRreDogJIOSkzh9w3+QsFWjt3O+749/4W4twi5khorsSaCzRvZjipVV?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f06a1599-b1be-4afe-36ee-08de1b006f05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:43:01.1707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwTSH8btVk4eIhW7B2DUVAAgwNdjoxjtVNc0xhmn5m5iJDbSjhKmynYOZEEv9xwZED7r9Ttck5SkFy1hF1t0gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
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

On Thu, Oct 30, 2025 at 05:53:56PM +0530, Raag Jadav wrote:
> We hold an additional reference to the runtime PM to keep PF in D0
> during VFs lifetime, as our VFs do not implement the PM capability.
> This means we should never be runtime suspending as long as VFs are
> enabled.
> 
> v8: Add !IS_SRIOV_VF() assert (Matthew Brost)
> 

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6e59642e7820..1c37f4d91047 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1152,6 +1152,15 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	int err;
>  
> +	/*
> +	 * We hold an additional reference to the runtime PM to keep PF in D0
> +	 * during VFs lifetime, as our VFs do not implement the PM capability.
> +	 * This means we should never be runtime suspending as long as VFs are
> +	 * enabled.
> +	 */
> +	xe_assert(xe, !IS_SRIOV_VF(xe));
> +	xe_assert(xe, !pci_num_vf(pdev));
> +
>  	err = xe_pm_runtime_suspend(xe);
>  	if (err)
>  		return err;
> -- 
> 2.34.1
> 
