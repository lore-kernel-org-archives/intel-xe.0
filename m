Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54908FD9E1A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 22:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25A910E9F0;
	Thu, 26 Feb 2026 22:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIRjxqkF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128E210E9F0
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 22:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772143952; x=1803679952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eYs676RJXLVgdbwaU35MT7jIaaTS0GJS8cTBfvJIi7o=;
 b=QIRjxqkF0hIDmpMKd3WIWxavFfjUsdsVTRw87rRCLp/Rs5AD7XfSNsqJ
 x4ufOUO3ZC6c9Uq7wlgMFqblHG02SfeadX57yaIX+/eM/rcKc31OqN1aM
 ULEBIkWEWwSoSP1PcgJES2RIecUNDheSLfcVOcVjB1Vhpa7qKx6lUjg5A
 phSBE4O9yBPC6v0gEBtpx6Ey6j5gexjkR64VXYncnLBqzLCfj9A04/P56
 xUjRb4McJ/XgGpEfzoccoApMYoFEa1FRZR8rKUP0kQzSYSyleNfELUgdA
 1VdQZmp0FCnPQUL8setJBi7AeixSropTUEPVWM08RgxWLcgiDDzmmVV0a Q==;
X-CSE-ConnectionGUID: eoiyjgehQiyGJ6Qi6y8kRw==
X-CSE-MsgGUID: C3TLotTaTsqOcJ3EigutUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75826039"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="75826039"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 14:12:31 -0800
X-CSE-ConnectionGUID: T5OLc/NZSNG41F58jVSlRg==
X-CSE-MsgGUID: aeJ4wfcHQHmsVGTOiD763g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216826985"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 14:12:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 14:12:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 14:12:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 14:12:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srAh2e87elEkpw4fMr63P+HmKQN2UcfcbwBWP5OehnL+YF96KH41owVGG/S+36s3UBOQL3KhOpciN/KGxQAkdoiz2wnvOPE5XCNb0Y40WkNnlxbyIxtfTN3hfG8jvKLEHwiLrGT05Zfnii4mZ9g+riPkJYG6L9DxX9w17cGT/oGyJuxYdLO/dZq6xV5H7r8LIKPG5Asm75L9dySRAxL0tIW9RYD4Ivo/VXiDNKRlha9ey5XDdpfrzmgvwYkHXKqwjNETekIOeUQFMtBoNN4nnHKI8kxOkLAXHUVgaov1tp/jiMYzIyH+zr9JmsgzqMX8t3x7i7NbddkoZDHA1/QHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkfZo5F0UxvqyZnMNEo0OX9jGLxftq1Jgd3Uu2JWI0s=;
 b=RohHPnMiZHi6k8PvhxRWLsO4aQCpdwmleR5z+GE2Iv06U5dtbJStFtOYwrGEPggd2Q7VHkMSolBGNy6YoCwuN19t+fMIneW2QzW6g7vDQKgVmombkptV1qhXzH2cd6CN0QuXNuPYy4yUUzu0xVMf1XyDe2EWK+Q+eh6MYrW38WbEMFwVfoTSxiVhUd6C8ABOHrxOZDhuyhsKl/QqPonu4F0KObzd+2897Jft2Othiw0Kcg6nKr1VeSQipDGAs55U7EA0Ug2IsA2VqNF6K/CRJs2ucuaiiqfPAZHm553PFy2GyQ/DcMq1137oqglHWmEo4XT1EY3DU+8l77VOTTeSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 22:12:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 22:12:28 +0000
Date: Thu, 26 Feb 2026 14:12:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v1 0/6] Introduce Xe PCIe FLR
Message-ID: <20260226221225.GX4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9ef04d-c35e-4c74-d278-08de7584210a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: ZLzV2TxJ7eWZm2wHfovw0FhGPy7k48trz1/P0fkrXfh28gIn/VP9xJIqZkiIHknP8C4oxlZFheBLHlRVyH7fk7PbKHYUszM7jxId+DWL2pd5wKFmBOoEbN23zKiiy0CxcBR456sGqWlw3U6RQf1l/FxKvpI/5mMkSCxyqaOtRYjavpNAGmaYA/6UR560EDJoZtv4UTYx1vFAFhMI/RrXeAXn3uJ5fnLBBC9MXl9jR3XJuQi1ZQUI9t4neDXvTSg3f1j7SJM0zhxqrRhCXuNNrbJ7je6ItNRJf2uv6wyiSlYaUhd7IQi+h/fvitYGCuzDUJNQY5kKNMSWRNrCnxw9xf+pRQ5pz3J5HjNowkxvrFktsroLOxEdOaYjSc3LEQiYJsddqgrnak4MxEGqVH6InubLWzT+7M1nVWDNSJMakNgcebARGA44jCoq+CHwxtS5aFKhliz+Ck+3zvOFFKpQjMc2+zpLoolfc3sEY5EhUaQzVHVgDFEYC5QEt764alxzxOrUsxt2L8XWleuG2Bi1Gp635i1mWuWTgeKsH3RoT4l1DPv6+YnlQikAc6RFx+nNidcoZC7h8p/vR+N6BOwfF6DI6Gc9Sc8WUTJXji7wlEsoFzLvqACajD4MsQrtG4iqwsJZhn6F2VllhevxxwyEXbvTEegxIuOAMm83DzsHra/ngedSaF3VcDGub+NTpc4/RoT0plI4XmiKK18toDa7bNPadJtmdSM+mWRu7y64bI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VUbkN63o9H+zDCZWPuveaYEPIdAYUAaZL2P98rEnS/fZpHydjxmB4cUP3u/E?=
 =?us-ascii?Q?1cb/SWGelGGUKhMrcvy0LL8L/dwfWRcO5M6Wkdbb8F0iNEbbY+zJsYDZ1SkL?=
 =?us-ascii?Q?domxYDzWn75BRqqz92dY/znQ6cNN5qphR/6V1m0lVI14IUKsTAp57wzHbJze?=
 =?us-ascii?Q?tXGX1tadg4P+G8tpJRrerxtUEkACfA6ZW/mFlp1ZRiYT1t2XnZPT8xPuixYx?=
 =?us-ascii?Q?atB4gbASfUXTcqD3M9Vvx+1AD6mSuyDJ70li8suka7PZPSBg9hDnIc8LtwVW?=
 =?us-ascii?Q?n9jvw7ACk2cPk90aaWzNMUH/xdcVjzQjAoIEJyMlKzFHAAbhb6EdZldChSGz?=
 =?us-ascii?Q?4VARfgImUdIih9yA9QDRZ8xE8xPIcUpISBrifL9ZgybEDAhO9e/c8D2WkkHY?=
 =?us-ascii?Q?a6QrOAI4L6pfDRSdcQq1MpPcwv187Sfsw/p18pNTF0kif++B6O8+/r1ak9CK?=
 =?us-ascii?Q?TxvYLQ9ndTUZe5y7ymcN2rQvsIFjYR8vMmQNsJ1A1lYu2SdT86bs2fXfrF9T?=
 =?us-ascii?Q?DM3VV7wIx9MkuxbXHEN3Pahxa67PLt85kjF1gijuHuNNjOEO/+qJ55saU7m9?=
 =?us-ascii?Q?KiaSiqfvAXDs1ZO9gQxkpfksYv+BfR1RfttpJaoJlGJGi0Mj9jmK7Oa7Fpxr?=
 =?us-ascii?Q?h4VkHdGtJtorQ5sp9MkukhJb7eJG8BRWvfBWRb+oEvbSkxy9U7wqj2gRal1f?=
 =?us-ascii?Q?S8HsAM7ng0L7jIVuXRLKtHzEKjXM4rJ1nQvaRScjwpGWNnVLgKDrwjfkYEbK?=
 =?us-ascii?Q?3dy0t/lRw7VvAwDqOahfvTPdTHG8rZ3gi97yE1T18wzmp/8hFmGGjR1klL7R?=
 =?us-ascii?Q?RyGahEsQWSHtb8jiDLW6IoM+xbSR9+tqfW1DD4B9kK40gkBsEQAP0filonyI?=
 =?us-ascii?Q?5iYQNcMh9Ew1IJhi6KttS3rxbI3oGUxjbbAs6toy8PsnjX/fisBPRpbATbji?=
 =?us-ascii?Q?DeU/iXDh8qpJEhNjj9dHojrcQat/vnRCT/LQsrhD5KO/niubR/ibo0FcXQV4?=
 =?us-ascii?Q?lJ1E38NSaKSe67eap2qgS08RF4s7fDKNdsmXbmzgUDm0mLaMASMGJCD1uqhY?=
 =?us-ascii?Q?q4PKjZpCWHlzfa8IaTNfZFvjyoHgrBshyEoag4dLeBSB+hWPJNTHYpwORiXG?=
 =?us-ascii?Q?XzKozj+Sz8JEY98MUw7r5MnPfUE19ZdWUvPSfYxDb+ItWRiy1iPkaGqLZ/Vi?=
 =?us-ascii?Q?ElMKzpWRRqauVrdW67zm2Q4eSOW8KqJjuN9U388hijlA9MUyBv6az1xYycpM?=
 =?us-ascii?Q?LXafjqDEuMWzHLqlYYnwzg7i2wHSvTDxDP7x1DyLTC4fu01Z1nNQawx+oetX?=
 =?us-ascii?Q?rr7QYwYkGWDNU9WJb1K7jVjR9Nli7lZLue+1k2UlXrLxE6nRpl95AkGhTkQ/?=
 =?us-ascii?Q?G3eICGEBjL40CBBRxCEPYxKXC7kYUwa/nn1zBNISj8Wwq9I11h04IQ1Z3Fup?=
 =?us-ascii?Q?ZcWxg9pQd3gdioUpI1h/Nm8mYPQy4UupG3KLo10bLvw8v2TmBfQqK9tYAIV3?=
 =?us-ascii?Q?zM2OXk3AP4UCZr59XGzeF23aGRwMUtLM3iP77K9tJxrrBD+GQ0vZQo1xzWKr?=
 =?us-ascii?Q?WwxarDg5jN4710vEpECQf4hFkBFCQR6kiqYHcNohbmyVj+d3aVJn5Bsq1k3D?=
 =?us-ascii?Q?elRYdyXVqVxHi4VjW0+NdIY0trtTK7rlow+8wZYUk9+LSKlREn+g8Xvkg8CZ?=
 =?us-ascii?Q?St5Dln/l9hgQFGaC2bfdxpFH1sdSCsJxhS8BTq6LbsEO6rr4HyO4KAQulkII?=
 =?us-ascii?Q?8iNTPYEBdWk2AcpwoA3IwhZqghGR3sk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9ef04d-c35e-4c74-d278-08de7584210a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:12:28.5437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANBWy4nL6RMlO+sf/AG8TO6g60M6/xOHBQo9E16jhQtrsdHAKBLrVn6XzE/HXp+iVHX7U+8hYr793s2qgTOW9Y6QWYG2yEgMnMls4YS3Gug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
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

On Tue, Feb 24, 2026 at 03:55:13PM +0530, Raag Jadav wrote:
> Here's my humble attempt at introducing PCIe FLR support in xe driver.
> This is ofcourse a half baked implementation and only limited to reloading
> uC firmwares. This needs to be extended for a lot of different components
> which I've skipped here for my lack of competence, so feel free to join
> in and support them.
> 
> PS: This works enough to allow a single exec test run after FLR but it
> follows with a GuC crash on subsequent runs which I'm still investigating.

Probably a dumb question since FLR while the driver is bound isn't an
area I've considered:  if we do a PCI FLR, is there *anything* in the
driver state that would still be relevant and useful to carry forward
after the reset?  I believe at the hardware level vram gets wiped, all
registers in the BAR go back to power-up defaults, etc., right?  If
there's no state that we can meaningfully carry forward post-reset, then
couldn't that be handled by destroying the whole xe_device (and
releasing all of its resources), and then starting over with
xe_pci_probe() to initialize a new one from scratch?

I guess on an igpu all of our data is in smem and only the stolen memory
gets wiped, so an FLR is a bit less destructive.  But on a dgpu I'm not
sure how much continuation is really possible?


Matt

> 
> Raag Jadav (6):
>   drm/xe/uc_fw: Allow reloading firmware
>   drm/xe/uc: Introduce FLR helpers
>   drm/xe/irq: Introduce FLR helper
>   drm/xe: Introduce xe_device_assert_lmem_ready()
>   drm/xe/bo_evict: Introduce xe_bo_restore_map()
>   drm/xe/pci: Introduce PCIe FLR
> 
>  drivers/gpu/drm/xe/Makefile      |   1 +
>  drivers/gpu/drm/xe/xe_bo_evict.c |  34 +++++--
>  drivers/gpu/drm/xe/xe_bo_evict.h |   2 +
>  drivers/gpu/drm/xe/xe_device.c   |   4 +-
>  drivers/gpu/drm/xe/xe_device.h   |   1 +
>  drivers/gpu/drm/xe/xe_gsc.c      |  15 ++++
>  drivers/gpu/drm/xe/xe_gsc.h      |   1 +
>  drivers/gpu/drm/xe/xe_gt.c       |  10 +++
>  drivers/gpu/drm/xe/xe_gt.h       |   2 +
>  drivers/gpu/drm/xe/xe_guc.c      |  16 ++++
>  drivers/gpu/drm/xe/xe_guc.h      |   1 +
>  drivers/gpu/drm/xe/xe_huc.c      |  16 ++++
>  drivers/gpu/drm/xe/xe_huc.h      |   1 +
>  drivers/gpu/drm/xe/xe_irq.c      |   7 +-
>  drivers/gpu/drm/xe/xe_irq.h      |   1 +
>  drivers/gpu/drm/xe/xe_pci.c      |   1 +
>  drivers/gpu/drm/xe/xe_pci.h      |   2 +
>  drivers/gpu/drm/xe/xe_pci_err.c  | 147 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.c       |  24 +++++
>  drivers/gpu/drm/xe/xe_uc.h       |   2 +
>  drivers/gpu/drm/xe/xe_uc_fw.c    |  33 +++----
>  drivers/gpu/drm/xe/xe_uc_fw.h    |   1 +
>  22 files changed, 295 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> 
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
