Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5C3CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 14:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA7210EA2D;
	Wed, 17 Jun 2026 14:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQMwEyJr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ACB10F00B
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781705188; x=1813241188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5s9ok8UChzC7jsIH9q581NLopyoKK/WU2xqPoxhdTu0=;
 b=NQMwEyJrD9nwWniU5RxEYQl3Pl3Vg7xGSjt8+1POvdBPkN/2McgCfrIq
 v/RQL0Jb/ccd7MppdBWRFj/+8lWE5A7Xi4uN48vUjqW7xjnn7unDXDmpH
 HtEnCAAn/kEo2Hi4qts0giqye2VgpspHoJ/bXKveBoQ5sJ6GnXp08bU4h
 rys3Q91FmLIb2pjvyce199+DU/fHuuEM/zjgCiwW11fi42JZPvI9xdYac
 lBljXoqyuZYyr8kB5OVYfe3Eo4dm+kYdVJCiVEWA42APC82wThtyTrdQp
 zFLFXQpkuz/dW/mjPdC98O/l/EK2lZhf0/re3cgNXKqMQCaKKqNrQZ3ph w==;
X-CSE-ConnectionGUID: +wa+Tnx8TGS3VefnJH7MVg==
X-CSE-MsgGUID: Jj+JdeCNQzCpoI4tyAoftA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="107970751"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="107970751"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 07:06:27 -0700
X-CSE-ConnectionGUID: KCBNZAuRTi2J09UcFNXsvw==
X-CSE-MsgGUID: O2qEqEAMQx6IT7ZQtWKSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="253035313"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 07:06:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 07:06:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 07:06:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 07:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUldnnZ3cd/u2Yq1EI9l/nJs0I+GVYVIL3e9f6bukk57SkAhFHT4Zi3SyoTa1mFNmlZjqOI131IpjB0qMJvR+UD1gHX3QX208blQDEcdOZWe/h7Mcub+Yuy0Cx0wEgCfl4Kg6Sg6fL0esoedxXuWkpO/GMnHii5Q6Za96zwcBkcRJCHDic7z8DChHxFju3ryvs7pC86Q90aIH3gruVRNwsjGW7tnoGH5DM75JvNjYd1Glhi9718jbcWNUNu2I6Ns4Vgpt3wsYbpEvoCCKTLY5N+2NP6w69LSr6QTWcRfhpiYRBefKOiOQkpkutZJ4ptGvjAa19Xkme21TfLoSaeskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA52J7xl5aNltvrkwSY2HhBbm6YfwXcrTygauDyqroo=;
 b=q0gUuPv+VXVAGhkx2xQ8ehnWwg/1ePGcT1GlqHjVrNvg2U9a2xGxbGTRpl/pIhVTWtoZTZjETp+ZKPQgnd3o3JNxsizHThZWw1GZRkMXqJts8/RSdBoAFfOtulsP2W10XD2R1YT/A1mOI82fWys2QNXP/gQ1Tt2L/He6eH11H6CGwmBi9UDNOQJdffO9ymRcm1GMHiZp6hACtKi4JEIDCokmuUO8L06vgGWosnm1zEAhJzpL3h2Pj6ab+Hu9ktmAtWYS4gslKAEC4ersFdjUnHdYjxh7uAUyi18C+XhQx2iKXDCXeNwlIqbI8UpI6P/psAvod8APWCgvl0de/kgxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DM4PR11MB6408.namprd11.prod.outlook.com (2603:10b6:8:b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 14:06:22 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 14:06:22 +0000
Date: Wed, 17 Jun 2026 10:06:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v1] drm/xe: Improve wedged state management
Message-ID: <ajKp2t9kdlAQ1NdJ@intel.com>
References: <20260617120542.96444-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260617120542.96444-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::12) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DM4PR11MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a05ce7a-5951-4f87-13b2-08decc799c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: VD+w4+nyEWbZNunhBTCYwmPtejbydTWS/cAGiOb8z8Bmmkpml4rEHtRtMY4VYR9MHqbQepOmOP7UULOra2le6h6BGBtz7lEkMvFawdpwnCyPvNQ9+ikro27f2Nk6iHU5HUbj8wsCVPYkcpT32Pbj+sVPpKiXAtNEn4kU2NbSsWQB+Ny/lQ5di68Hqrmou3wW2jISLcf4e7NmMd3F4Y5ubxuBJOb3IHsGovjrCVRrQ3kPlO8vco8g+07wzxWt4it51cqIOAyBl7ieG8+wutDudvGSKwpO3rUASXDHE1LAQTHep0ZN1HFVQloOh688pco4PxK0fC7tkTqig6Oqf4IG9++V68/ERvIHu00IRxqGGByKTNCl9nZ8YTUY9FFDgMUGWsA6thEfJeKo1HAlZB4wM+ATurgw+a94Lg6cTlFv3Gz53BE0qjIutwGlNPR7ObY+V7kToEeIomWaiycYppzjHZMTTIZ/oDGfcMHJGXQmOXwyCLrubWxKgTJtGA32GxCssvkzyEitqWGN48l23+oy6HoEVAbd69aJAf1EiPO4to0ZspvjQVK0kjEyBcA0euKiXfbxrOsuQtc8MLLlLYln43UsI1Ll88jXv3NEDCz9+B+vfAdaDEHla9w03eZCtebPauX7j7YKdo5gEFcq/R1RCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PY8RwUwgrcsphaLjpM5I+zsTZ2UB4woFwqqOE/e7dnOUmX17JMY+FN/m1yI+?=
 =?us-ascii?Q?SUjKsrJQ2BFRbE4a7f5/0SVGQJqf+SGxAePLpW27qOeCA59i3X5a8m1mKnIQ?=
 =?us-ascii?Q?49/ywpgmJiTcq9BRQYlInk06LE1b2I+L4SSE5dg/oMxl7GoA0EBmjqJVXnTJ?=
 =?us-ascii?Q?nKOd8YKW0h97L8W25evHk2RtONbVWClwBJX/f9fVriK/j7PxDGGTV3KlPwt6?=
 =?us-ascii?Q?ACZqypR0qo2idvdLqNqGcsNzbm48RCx7Ic+5uGHDUFBZ6cibEQM98ujrgf5t?=
 =?us-ascii?Q?ymGq0UhPhRrr8HdIZokJ9XGTNabu9lLUawE/pg5N+lDGOnRYlz6ZZgZbs4aR?=
 =?us-ascii?Q?3G4UcgaVUPiDKuzaUO/lj6GQ/DOm1w0UvyAU49+urlBQeYH4y6mMPavgKegP?=
 =?us-ascii?Q?wYc7zaEYKY5u0yC4B9ErPvMqQ7QUabW7+QIyqVA3GtwCKJ1Ao9o/sfKmCj1Q?=
 =?us-ascii?Q?WmKgS3TH53uE+HrFAgyfTs+rrga0+9meyNGkxRFsLUHfEbyJByii5htYDcPf?=
 =?us-ascii?Q?RnVtkNCIlPrtDCqU0SDzzEiNJ+fSM47c4wGETa5n2gM5qMEyep28SdDVL+Q2?=
 =?us-ascii?Q?8SHlzj3XTvti2Smmf0vKNN88kh6Yn/adNgRi+hyBh+Ua/am7a/3j7Ir8Xrn4?=
 =?us-ascii?Q?kSZjExvgck7YQOhsjkJ3Q9/D25/U9xHg0X9osq/HuTGlDoaK/YJT8bLH3CkJ?=
 =?us-ascii?Q?VQP4eQSUsrNMQDfYU52B8Fft60Lv4h2rjPNEuch5U/CaIiLWKgDor/Fs1ugT?=
 =?us-ascii?Q?oHgmU7hmZxggQrNDjXlaRMVtDWuNnkDcbe7IWQW9MyloMC5jJQuXGloOBvsG?=
 =?us-ascii?Q?b0mbp506ezH6LXlnd3L2o4Q3csuq7qnErrxD22fasLjMRgTKV0vC+NF1LUaf?=
 =?us-ascii?Q?Cn9nSz2N6FSFP5VnyV++7zpyZGLwX61/crxCZ/EH78VoAh/kSVnG1OjoQQ70?=
 =?us-ascii?Q?u4R1Fjb0DAqgXOtqXue8kskyfrkypIB/RxYJef/zWMTiE/8gKbpJUgU4de+B?=
 =?us-ascii?Q?TvAx0oSsWc8lY5KJKyeyInF2K1BUdl60srWq5gH6LA9UQ5hK9hsXeOA8x84F?=
 =?us-ascii?Q?zvNUtfO68iG/7U9fO9YfVYhWu7a8U2Y8XAQGzqRu8RHjfBNvgTP8awOFCCfY?=
 =?us-ascii?Q?UyXQq+iR7T5w6qcr62OHy2zGnBCEWNent5MZntT2KFIT2K97fWQ/1gFjqV+g?=
 =?us-ascii?Q?2A8uiBPoamhjYCSvYahxJ79qjisVK7kS8ZyMS2I3rztQaDassKuC8UjAwAB1?=
 =?us-ascii?Q?Tzw0bP4h9ph0b/CtVXnT3aif0qRL2hmjMxD/u3E1/sLHKzukl3GVM2hmDk3C?=
 =?us-ascii?Q?iDLB9Gva6FTdP5GNQhUDMRDIL++m1YGqyTCIkdABFfKrm71E8w+Kq6idb2mu?=
 =?us-ascii?Q?B0EV5nM7GFL2vxvm5f4eRBeKhvRRcw7Lxe2/jnL3CsHhXiYO1+QCHDBSAgxV?=
 =?us-ascii?Q?usJl/QDaH3GK7tGYXuYpzjhDdbY/JGljVYyrH42RuBeKo5v+dXNjRp3ffIAj?=
 =?us-ascii?Q?3e/ehiu4a0roZcWfKOLV86Fliu8UqLA+q2qpbEL0w/ixcHcvFcJW8UVbfA0r?=
 =?us-ascii?Q?xv8YtmmzELTXMjR1g+BhJvZ0XGI4h4/Mhb7UpOH73s3WbL6OuP+HPyNl52cL?=
 =?us-ascii?Q?KHRGEor1KP08pe9q59Fi9dHgDDHaIHItM1PLPl9PCmUmu37tEGokxnVVO5rF?=
 =?us-ascii?Q?fShwLqygtb0ReVW5arUPnJem/vwBi1dtYIfjFYQUSk/wNa9MfWw/aMSi8XVd?=
 =?us-ascii?Q?mKX5QU3zhw=3D=3D?=
X-Exchange-RoutingPolicyChecked: S/O5ocXXDLS8pZV37T2JvNUGz9VJnBxS6XZVwOXd5df5fwqDdGZvDxjDD9v+sHfMyiq/3OTIuOzxbXn5xZmMaPFCSdshBk2bGLpfHoEjSSPd/3aQYPonKzlQFecbFzsytg9fFoIS3ZAH5/acK5oOkdWeYn0nyDQ2fiogC+eWtmmPWUcdpfCCtT26z+GTI3GBHMIOfy5IhvloOCXnx0ps+EMqcnkesaIoRtwlBXV0TGRjviDF5HIz6/20/jpVQMjgR9leGi35SJNJyymyEX1TJNotEjsAdtPD7PsZheqbrRA+6M8Ma3y7BHS0y8VzY1jIE6YuGZMGnLxZ3uuyJ7PmxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a05ce7a-5951-4f87-13b2-08decc799c34
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:06:21.9139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1s22czVULkQh7ZmERB8WJIiZycwd5EEUNK4S3Xse/qj7XDXMob5uY/fwpiWDLoH6GEpAwgjymR23idzrezY3Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6408
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

On Wed, Jun 17, 2026 at 05:33:45PM +0530, Raag Jadav wrote:
> Currently, wedged state is serving a single usecase where the device is
> permanently declared wedged, but this doesn't allow any wedged state
> management for runtime usecases. In preparation of usecases which require
> to facilitate temporary device wedging, convert wedged.flag to wedged.ref
> which serves as a driver internal refcount for wedged state and blocks
> critical path execution during device lifetime. While at it, introduce
> wedged.perm which signifies permanent device wedging and operates
> independent of the refcount allowing relevant cleanup action on unwind
> path.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Split from FLR series[1].
> 
> [1] https://lore.kernel.org/intel-xe/20260603101814.916948-9-raag.jadav@intel.com/
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  5 +++--
>  drivers/gpu/drm/xe/xe_device.h       | 18 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
>  3 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ef730f2bdf32..00ade433a23b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -916,7 +916,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
> -	if (atomic_read(&xe->wedged.flag))
> +	if (atomic_read(&xe->wedged.perm))
>  		xe_pm_runtime_put(xe);
>  }
>  
> @@ -1421,7 +1421,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> +	if (!atomic_xchg(&xe->wedged.perm, 1)) {

Sashiko doesn't like this change. Specially like a standalone patch.

https://sashiko.dev/#/patchset/20260617120542.96444-1-raag.jadav%40intel.com

Opus-4.8 is trying to convince me here that although this race does exist it
is not problematic.

I'm wondering if we should go first with increasing the refcount and having
an aux function to get_permanent() or something like that to differentiate
the cases. Opus believe it is not necessary.

Anyway, let's hold this patch for now.... Please, at least think about this case
when you are refreshing the whole series and let's merge together with the
series.

If you decide to go with this patch as is you still have my reviewed-by
and my ack to ignore Sashiko.

Thanks,
Rodrigo.

> +		xe_device_wedged_get(xe);
>  		xe->needs_flr_on_fini = true;
>  		xe_pm_runtime_get_noresume(xe);
>  		drm_err(&xe->drm,
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 975768a6a9c8..1aea83e3517c 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -192,9 +192,25 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
>  void xe_device_l2_flush(struct xe_device *xe);
>  
> +static inline void xe_device_wedged_get(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	ref = atomic_inc_return(&xe->wedged.ref);
> +	xe_assert(xe, ref > 0);
> +}
> +
> +static inline void xe_device_wedged_put(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	ref = atomic_dec_return(&xe->wedged.ref);
> +	xe_assert(xe, ref >= 0);
> +}
> +
>  static inline bool xe_device_wedged(struct xe_device *xe)
>  {
> -	return atomic_read(&xe->wedged.flag);
> +	return atomic_read(&xe->wedged.ref);
>  }
>  
>  void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32dd2ffbc796..f13e0fb2f18e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -485,8 +485,10 @@ struct xe_device {
>  
>  	/** @wedged: Struct to control Wedged States and mode */
>  	struct {
> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> -		atomic_t flag;
> +		/** @wedged.perm: Permanently wedged, needs cleanup on fini */
> +		atomic_t perm;
> +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
> +		atomic_t ref;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>  		enum xe_wedged_mode mode;
>  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> -- 
> 2.43.0
> 
