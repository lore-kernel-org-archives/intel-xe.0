Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166BCC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 16:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283710E130;
	Fri,  4 Sep 2026 16:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mb82+AiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BF710E130
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788537751; x=1820073751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PB4sNX3w7cdpRtQXvIF+efGfX7ifV4jxtMZj30vrCxA=;
 b=mb82+AiD7R3muuYUJ0EV/GozxfIbIXHXmkLOrhnlB9v97wRJfiuRdkzI
 WJVAeLOngM0R6S4uAv2D3nta6zMiF4Kftnutm9rcp6jF91FIs4r+AbQqQ
 GkM1DsYHrH/c2yqF9fMB4ikfLij0Acid3BmNr5UHrijJB+9NtGH9Eprhj
 X+rpztVtrQa2wfA5nAS9xV/+RKqjtSJlWvb2THKtpPt5FYN7YyPN6XVRi
 GzehbU4lKA2FGNKH9esI/hTo49dfX7ebsTqwr3K3kJlbm1EWTpIN3TctG
 tPO2/EF+jsGk7+12+zuPuc+S9VLHPM8OBzXjUCXOgz/Y6waqaepeHZWlg A==;
X-CSE-ConnectionGUID: 8MXidpkVRxKWFYDrM7N5bA==
X-CSE-MsgGUID: VT2OCNjnRCmiyVX5haJJzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89076330"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89076330"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 09:02:30 -0700
X-CSE-ConnectionGUID: T5gD9+phTXy7nIvp7uAiCQ==
X-CSE-MsgGUID: nOMRXYSuTnWfA9jseLSrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267495361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 09:02:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:02:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 09:02:27 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:02:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWzUMAUzY0QIsbEJkuklXE9kVyzFjWu70fNdsBC1kuAuywX94hZTV4U9MCxMbIdrZrQVyM+scQu4QiVg8LpZl5F/+F1yPmxJgzZWba7miLdmVoWJ+hgl9+zmE/WhIMY3HAL2Hd8g6eYxQQ03NYrdXx1zC3xkLlnLijOd2wi0NMjmaOY1fOou5vTclViIKTtMjcl3K2GMamD3QTXy5zKgaLbufadivQp74kPN5OoIaI5INbmDIDqB705qv3XXqcnbdEejhTemhGPfuLDCev8glxf7AFzWgUmnT4dk406d+wwwx2qszMuaJRGV2Z0d3Rlv8qFwPzz3jjJ/ohEZ10iHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McvBpVx4tnkfSLk13+JE0pnTQj9yrw404uFDyH89IXQ=;
 b=sEXU3aF9YuE6XJYR/0k9ckPsUemx7Ts2jj3EVG4T1gaQ/iw47ee+DbKR/EOo0D/CDzDMUBF7fP8P+11boy2LFbOjgOpgtb9Uu9tQKthKnumkfhHW7wnHPvY7KN4jcYrYGSGEFoM/Lf43jvisAGKo1AACaX3tzMOHEL2nJaLYSbla+LOhRN1zzqWSP8NDOwQP05rC9AKdDqG3mUmq6MY5gUfE0YWVEhohvU6rruKjrWPGVxIbrRDLvVC+5Ty5Mw313quAZj9nCEKqD8NXGcMqiD8rSxfDxMkh9T4OAbwL9/uPLtTvktUKnnbpgzEOHV0EMkFz6hekUj0nBoSW6yBdFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by DS7PR11MB7834.namprd11.prod.outlook.com (2603:10b6:8:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 16:02:23 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 16:02:22 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Koujalagi,
 Mallesh" <mallesh.koujalagi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "heikki.krogerus@linux.intel.com"
 <heikki.krogerus@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
Thread-Topic: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
Thread-Index: AQHdPIT7NfP7k0uM+0qpL/qfAPOz3La+kt+Q
Date: Fri, 4 Sep 2026 16:02:22 +0000
Message-ID: <BN9PR11MB5242B7F8CD1B4D204742E97495B52@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
In-Reply-To: <20260904160608.2004174-6-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|DS7PR11MB7834:EE_
x-ms-office365-filtering-correlation-id: 2630a090-22da-4473-7284-08df0a9de80d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|6133799003|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: F5XvAYYjgYteZ7ly6aPE3R/wJaQu1QtrB/UnSqn/laDJORTWy5YdVkBs3dAADzXeHzavtgVMJufP1bGxkc681qgVwoxHaQM0uZwTYCIqcsSw5uDI7GG3iBmMxjUw7P/5ntbaMVf/iZbTIPZWcn9LesXvPj+GXj1YnUajkigqv/I5Fub7v2qC8TJnGz/F3jBsDxtIoOqUariXtPwXRGwxWy2mTXDB9uWmkPF3gFZy5OIWVJXXm+HFCgXg+PP8qdkWSNL3oHjD8Gb+oP9QXddNlJMRon1wL13poWNSBcBm0vkni0+UEfnXqhYoluINabCdashFftCNKDZUfeOQTsszMLoXgwq5oQd2vDVkkYB7NuFjwUnNpMYHPxBQknZaP+9NZIUhI56wo5e7jwLUVjOtY09CdPS7goZI0YHUnam75bZjyrfT/URoKvEPxyiNbK+x6bOhydr7jqZRrH+Nz9N8giqpLBkBU74zqF000mL4BHoJo2b7Sqo9TOxcLjhW3sqExS1RtRNDLywxhz3xkHwqR1RH0QAkmt91gLLPhsRg4SZlkrDYeWHs+77I2Br9knWcuPFKRF0zJKsZUa/fCO+p5Lqt/Kmn/t2XybmFI3kU1oLVBSc/iljS0f/RQ9C4LyNvco7OoZP83b+jUG9/lliAX0WcymXi8Chjtgrf6F9dSU65bq2SNdcTETImYU5CHROI23EYXEEgecTkmsJefmJ1U2/wNeUkbRFdylwketHqU/w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+o0oyKF1MRdI/xTbeCAfLRnyhLwcwMJTbGlM9WROCWpnK/RWqrt+q1E4MvNY?=
 =?us-ascii?Q?TPNmVkPaPhx6Qvx+T/4sCBkhDDSn6Fuj3308rx3B4EoQ4pvkNZ6EjAemH1gb?=
 =?us-ascii?Q?w2kuq52pALkTzJW2e0Q0vliY2dj89Xz31uaQ3QPDYFI4UYhjKBp+GJZO8XA6?=
 =?us-ascii?Q?tx2t887MHpje1gm8jbKsrtsGg3pVngGHwy59sLw4satJIwUu9JMWlTkihHUr?=
 =?us-ascii?Q?mK3jUVU7t+ibIyR34hzi4RaFfnEU+OkmOCgKCQXsPcsnBluC69pZyHBa4Uvz?=
 =?us-ascii?Q?Yn9kfVdISqZpOG68E4R3RKSJ0BXRcPWM35Tf4P1K8qqrkddK8p/UqrqN3VjS?=
 =?us-ascii?Q?595lp62THv57iNC6s5cuJu5LWucLGdkrOYOxxDVsFnpkig4lZziTop6x6rdp?=
 =?us-ascii?Q?NVfrMhCJFcliNScRBD7uyRWGti0n/mRVbcuKZtIrSyV2aWYZnimQs7+Pp8tR?=
 =?us-ascii?Q?brzyJGPQ8IksqRMdzF023E7JHr6zFMl/QkXleoucj+En8nkLcWcBIwXUNfHp?=
 =?us-ascii?Q?s3H8VwEnR2RiM4lVd3VEXlPGQ0uZRe8anRqBrcVjdSiet2qnxOGwQzGEVS5U?=
 =?us-ascii?Q?u5aewWuOAwWDRmTaLt1iXMr9PikUbJwh/V/UVlYvROAWfwAImMUdkBraHcl7?=
 =?us-ascii?Q?Hsh/fCFGyI+MOirC6WXEO/x6qM3bwMSXf/BVXXfX3ongGqHyt+0tfsveIjZr?=
 =?us-ascii?Q?YhUFqQp7G982gV89jJHZxzjqfbSnZT4wJaHO+TgtMSDcuCxniw1WL44rWo1X?=
 =?us-ascii?Q?qUNla6R0WXLcI4391uiv1B07T/BV7t+tyyvkuw1vF56CLkYucuLjWXerWZXd?=
 =?us-ascii?Q?5wwI6/sBUUWoAgpZEXAfg65/BcfMkTtvmDOS0qOcga7pE44p0z9iYjsxyrwk?=
 =?us-ascii?Q?uJrfJcJjzACeoEQz01DOxYzlKDcnHkcm39Pr+18OK3acffxTE3ZF65LbZA7a?=
 =?us-ascii?Q?b55LXM+Cd26/WjSwlFVAoOgCOHGwIkxC6+aElQ1qkHZf7y1L5LUv1kqnjqJM?=
 =?us-ascii?Q?Tt0tZxZWGEgbEa/TUejG692jWe2F4+N/pCsmcamkHE5CtDGlxqOlPR1h6LiV?=
 =?us-ascii?Q?utyEmxLjUpvMugqSV5GCR0Yn6qFXJegD2z+NeHxDfKl6hGYCxlvurBeuWBog?=
 =?us-ascii?Q?ZcUDLSh4J59QGncRL3E3puqRrmgG/n8B6jgUDymv6ehAN8JjrUl+sDadNOVm?=
 =?us-ascii?Q?UqbGczjl/x+RNFipEGaWlLfR5yj5IGtvbElVf+j2UEws1e2zgD4yd+SGAWGH?=
 =?us-ascii?Q?C7h9vqfD965+765eo/spN1BC428MBXW4/E/FEoVXaivWeTgtjfv5wiB191UW?=
 =?us-ascii?Q?ZbSCYf51FZIJnlXdDGdInI9mfai2UNLh49Z+lSiY5Yn7NnJXr5a+YotY6/tT?=
 =?us-ascii?Q?CPGmmBzWV5UhpGRO3RMxX5/jscbPt9oicoVZmPkHY3gO0WDFuKeau+3Isb1y?=
 =?us-ascii?Q?BL+ISliywAX2WZ6DG1ciR4KahBDgFbD6ZJiGDVaXfoDAroTit/sMEzwnliWP?=
 =?us-ascii?Q?AH79wBMTGTjkyS/XALj8y7MBEKI0scz7Yg1meGuASSG0KB10TRsJFQ8IcM6g?=
 =?us-ascii?Q?kT7yvaRTYoYomEVTMjb19ydGXoe+CoCd5n0t3WsCAuFOEW3EgzHRHEl8BLib?=
 =?us-ascii?Q?ZWtTdF/oC3T9uTKo9OyMKn9NEZoHPRoYRI9HaTJBUKyhyUV7h76Ui9zkawea?=
 =?us-ascii?Q?+muEk5Kq0Dn3M75lwaignjvsBG1kSRMXWqF3aXepbqejuRmW2H4YraildJtB?=
 =?us-ascii?Q?zLhcEo4ClA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WrUQMZRM9lOjDrzIyoO3cXFQAr1S/cf4mQWm44WDCrOoO2nuKbcFRAl72hBe5bUj8kbqVyM3V79IAdf3qNwTphDHugVGv84uJFzrN9A6TfLicklyl9Dsn0HUD4RKP52p8iynJyylc5BPfz/ZC9VOF0dyT0Kpij4XbLeM+TN2J8kujMp3uFcu+vwB63rGI4o4OTje16v0Fu3HJzsKb4xP+3kELDc/OyAnd8gujrQJCfbldGcgzNIvLtUXrcE8CNcF7wGB9uAreUqRfXMU03tzL/yyrowoXXlTQNPAXjTAwFZnVXwupAuxlobCSLSzrYW8bV+QrGiw4NKW/MO8SiNVmA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2630a090-22da-4473-7284-08df0a9de80d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 16:02:22.8646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgLDVfs1uN4kRNjujg1HwqsP0ntPWinDQPkX08Oming+Age63RoFL+2GBjclHrTD1PrLrsxROPn3Sh6t898Vid13EV+q76NXaFTOcQdGTOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7834
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



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Friday, September 4, 2026 9:36 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Tauro, Rian=
a
> <riana.tauro@intel.com>; Koujalagi, Mallesh <mallesh.koujalagi@intel.com>=
;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>;
> heikki.krogerus@linux.intel.com; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
>=20
> Expose a read-only sysfs attribute, device_uuid, that reports the GPU's
> unique hardware identifier.
>=20
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>  drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>  drivers/gpu/drm/xe/xe_device.c                |  3 ++
>  drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |  3 ++
>  5 files changed, 54 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> new file mode 100644
> index 000000000000..1a4bdfbad8d7
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/pci/drivers/xe/.../device_uuid
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Unique 64-bit identifier of the device instance, read f=
rom
> +		the device's CRI_DEVICE_UUID register and printed as a
> +		zero-padded 16-digit hexadecimal string.
> +
> +		This sysfs file is present only on Intel Xe platforms that
> +		provide a device UUID. It is available to all users.
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ef4746b7b5d3..68226fe0b659 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -30,6 +30,8 @@
>  #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>  #define   TILE_COUNT				REG_GENMASK(15, 8)
>=20
> +#define CRI_DEVICE_UUID				XE_REG(0x102008)
> +
>  #define GGC					XE_REG(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c index 8583b2e9ecf4..e8db8871990b
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		vf_update_device_info(xe);
>=20
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND)
> +		xe->device_uuid =3D
> xe_mmio_read64_2x32(xe_root_tile_mmio(xe),
> +CRI_DEVICE_UUID);
> +
>  	/*
>  	 * Check for pcode uncore_init status to confirm if the SoC
>  	 * initialization is complete. Until done, any MMIO or lmem access
> from diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..a4d326159dce 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -8,6 +8,7 @@
>  #include <linux/pci.h>
>  #include <linux/sysfs.h>
>=20
> +#include "regs/xe_regs.h"
>  #include "xe_device.h"
>  #include "xe_device_sysfs.h"
>  #include "xe_mmio.h"
> @@ -264,6 +265,35 @@ static const struct attribute_group
> auto_link_downgrade_attr_group =3D {
>  	.attrs =3D auto_link_downgrade_attrs,
>  };
>=20
> +/**
> + * DOC: device_uuid
> + *
> + * Each Xe device exposes a 64-bit UUID that uniquely identifies the SoC=
.
AFAIU it is card not xe device!
> + * The value is read from the CRI_DEVICE_UUID register and can be
> + * read back through the ``device_uuid`` sysfs entry.
> + *
> + *    $ cat /sys/bus/pci/devices/<bdf>/device_uuid
> + */
> +
> +static ssize_t
> +device_uuid_show(struct device *dev, struct device_attribute *attr,
> +char *buf) {
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +
> +	return sysfs_emit(buf, "%016llx\n", xe->device_uuid); } static
> +DEVICE_ATTR_RO(device_uuid);
> +
> +static struct attribute *device_uuid_attrs[] =3D {
> +	&dev_attr_device_uuid.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group device_uuid_attr_group =3D {
> +	.attrs =3D device_uuid_attrs,
> +};
> +
>  int xe_device_sysfs_init(struct xe_device *xe)  {
>  	struct device *dev =3D xe->drm.dev;
> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  			return ret;
>  	}
>=20
> +	if (xe->info.platform =3D=3D XE_CRESCENTISLAND) {
I think having xe->info.has_soc_uuid flag would make sense and on future pl=
atform this flag should be false when pcie serial number will be exposed!
Having info flag will also make sure we don't create this sysfs for VF.
Thanks,
Anshuman
> +		ret =3D devm_device_add_group(dev,
> &device_uuid_attr_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..6fdd16eac906 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -257,6 +257,9 @@ struct xe_device {
>  		bool oob_initialized;
>  	} wa_active;
>=20
> +	/** @device_uuid: unique 64-bit identifier read from
> CRI_DEVICE_UUID */
> +	u64 device_uuid;
> +
>  	/** @survivability: survivability information for device */
>  	struct xe_survivability survivability;
>=20
> --
> 2.54.0

