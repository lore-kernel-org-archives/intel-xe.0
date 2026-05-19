Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F34CD4F5B
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 20:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241D710E603;
	Tue, 19 May 2026 20:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjgukT1k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943C410E603
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779222396; x=1810758396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NLlIxvsl8ib3GFUzYzk3NQPVm78LopNvWfukBMAOheI=;
 b=UjgukT1kXlRsKHvT6J/tBa7xdXesVjRH99ZflHSsPU//V2voCOKnHrIE
 rDhDgOQ+3P87rWnIN+uyDsPvzFJ3wlNcrnpx+ixHWY7D2Nek5CUjrxgG+
 60YvvGRwyyWJQQZWFFzaxwG98QL8Bu6TEbNqXyoKOKsnTKOBZBCKB2Ewt
 HyS2py9AAO0wPi6ewgKOozPWgGxOFYDTX/+PZN6c+GWlNaCQ2npKqtiFS
 NAmvBR7UlOOp8AQC4tDE9AsTAjC7XgdW3Yk01QI2Yh5GQwaXAmaH3htuG
 Z5meejrL5QdRwywlKi0AsuKR5f0OIojaimWTycWLz4CAf+fAIhECNZUxF g==;
X-CSE-ConnectionGUID: 90dxBp/nRDawKmt/kY9VnQ==
X-CSE-MsgGUID: lFTJnyO0Q7yCwpa4dsYt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91219125"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91219125"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 13:26:36 -0700
X-CSE-ConnectionGUID: 2DU1FWpBTR2b7PPmKaLKLA==
X-CSE-MsgGUID: ImWIx1C6TWa6XlF9eSaVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="270232267"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 13:26:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 13:26:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 13:26:35 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.49)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 13:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKUmA1T8KGTuermzqw31zHW5QNu61xqpyF9owf314398IltPrnGiY8SKC5rgHo0KdzVtZe0UY9AdQx8ZSL7pYEB1/pEPj5AhAWvs8NIxmQQyuHbP4T57DOsvo0O89ugmaQgstA557qrZhdiIAFyeLiDrH8LVpdlKdFa6nwqL4UowRoMgpbRjXwZr1m5Fib5Z3/jpqfMdzL/nA3PzkSnlTAx+bbA8mwXCd/4Zww0qR42K0u1+41BucirwyQivNvJ/DU0dVY9EV3xu+Idc2pvAS15Dr4+okcAvNghNKrskVAWMV3VYNbOXhLVmlr9ovETOlsLGwS7gAYUsKZs5SlL1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz1B71IjnTowJbu2CNMh2DNj0nrd5cQqJ5zlBj1nOr0=;
 b=QH4pLlOusqfCLuGSjBxPYDI6PL+tsJ0PQyw8C3Zs2Yg36cuUAM7Q4vWp0Ye1ItkxNp/ZRtGeLYv+RHiEZT1eeAjlM6veqAVG8lXGRp2qdLSE5oopCjZdDpEC3xP6d7mnUawYbGUxlmt0gDTNp9kx1QVnAvF1hj2zGpH5jAI5T6gVBBxACSAVvKdAMCDY16wHzAoM0mpTdKyELbJLnlFR4rhV1ajxrf6Xkeo1cFuph9qlAeblvqpRwnp3oznB9OEy078azYXmtyWYgJ4z2DSLDv/qqrgME+TJSxjbSxu5+UVavLnjtFQS0Ac2wR3QKPr9DogdtFkiISypkYVEygfP+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPFAB693A2AC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 20:26:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 20:26:32 +0000
Date: Tue, 19 May 2026 13:26:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Message-ID: <20260519202629.GI3397116@mdroper-desk1.amr.corp.intel.com>
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
 <20260519033104.480503-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260519033104.480503-1-arun.r.murthy@intel.com>
X-ClientProxiedBy: BY5PR16CA0031.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPFAB693A2AC:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e69eeb-5908-4d3b-b6df-08deb5e4ea62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|18002099003|56012099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: LC7okMDooEaA+dG/7hmQAO54RJpKDtrNBpAwwaG32yBEaIW3e/ioOnWThMUYN+TuNUwJbxylwxN+0B4g2+LTTrQnFonpRd4pubSR4GwKbaUZVtXNa8liWsOvMtZRBkPA8mbGSmEvAHVQvmnSVWmx7zyqACUzt36dbFQEWHuCCvDdEmdYIxmSUA9vhhpkOofXHvkb+58yIiQR9EMBkW2RTQM6cEUvu6R9lCiOzSLJBb5s9gAKgQ5eMegq/oCGV4MSIxhnyjdStUU9Rn/4Tg+AQNbU7D9FFiWcB4n5N2ZMlpt8hfOn1JCOBhI8eyrSLiitZZGreppCg40xxsda01VdgTh6R7zBca6oC7oLaBUa6RPOmhcpTCv4IT3WvLsHndZ/v1dUZ1bVIdnslKAlISmKBQAXyIKJp1dX32iKoTZKeCuLmuJRTMz0r+mYC8/LnvDc8fDaw/VOq7WKOdwezdLfmDDJyIpMt1/R1AwVqD7Q5OkhidAOxFd40zDpjEFYZWC3jKWb4tHVICFJN2ocVo93bhCy5+/cwZlsR5eRiQDT219zEKRmU/ZDA8ZRFvInTgj/A03lRngsnW9nbSw8oKArzhFg2KZlsW5f7Icz873B2UtGUG7czO2iXzD3UYMDXMiDZtWWNAQkRdxjBqMAas/ijQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(18002099003)(56012099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u9Kt7SMlZ1JuDsSi4rYQDsXRr8tQj1z1J2o9NSIAhG6SlNiN4FKyUyRFnp3O?=
 =?us-ascii?Q?ZWxb7G8OszCxrwzkeCygsOvpiwGAmQUloO7+YTRrtdqRZhXB+21Wf6NFh1i+?=
 =?us-ascii?Q?SpnW7myI5gjEsrlG2j+FqGs4YjRZnC4LcRwidTjkuL0KPXVA6KPWaygkyy6r?=
 =?us-ascii?Q?HQViHfskL0rjuDOn8aRk4Fr2mCaaQQeLUuP5BeeIFsKv2mY1Jy5ICtip2B6I?=
 =?us-ascii?Q?R0FcF+TvrKWid6j61hhmVVF/Q6PazM4EK49WMaboQTMnjlfSqWJ4WfDmLI/N?=
 =?us-ascii?Q?LFRtKk/nwr+Tz8WywdS/0PBzz6dAWvi7WaAtGK6LpOuGXRe/YXTpcfkms7eT?=
 =?us-ascii?Q?IfCNomArxBzDDr7NJoW55LAR/9xd0HmmFh8rppSpXPTkegNxkMk8laFnS2AH?=
 =?us-ascii?Q?x8gbXi3mdmnTFCWauo4J3XEqDu6heuay7QP831jr1jaA48dMtjC5+c2hc92P?=
 =?us-ascii?Q?hOylaGZaDVHVEaPDiGydtyJY+vQvZClXHaHPqwh9OIwoG6O4EkWxGrgiFPRh?=
 =?us-ascii?Q?7Mm1RMmveBdTTD2j8faVublInmWa5CeGe63QPcwOJ4JuV2jonbUQdpiefQMH?=
 =?us-ascii?Q?aoPDkoXXFDr7q6V6t1JmDYhxbEjAU4LezoovJbVa8mWROQPyzLSKNFvMglxu?=
 =?us-ascii?Q?SdBbXQllgBiuq4uVSiDozl9LQ8uMnQRXmtkzq4vgfZBzgMtv2oXewHgQNlxE?=
 =?us-ascii?Q?SpS0SvRST9FDu1lPZLbdw1Z5CuxYSnRaOn82BGnq8ZPgCh3fWeofgIxInMum?=
 =?us-ascii?Q?LzWkqbXeA1LXA/yqSzwfRBDV8UJmYs44gMZDsG0gajLcuX8VFGN1MEpVeX05?=
 =?us-ascii?Q?T1tRlsM2MXUJ/YXvjW/OQX5TGU4mUZJwSF72RP2JlUcb9dfOTD8YL7oqj3FF?=
 =?us-ascii?Q?WUxuvzCFPXWpKihRgAW41zTS3R9picmMDX+DWAMeIy12TNXRJs6+4JXKtvLx?=
 =?us-ascii?Q?YmQ9r7E/4OA3wjqvjQcDbwGvLR84BdCNW1OVafBGqin9RPvXn5s6gYLfSJSm?=
 =?us-ascii?Q?zmjvihnpRpaDc/bomlfIjaDyroNBy/DX60Q+I1eaOYrwdtucAB55kwnqvYCt?=
 =?us-ascii?Q?mkIZ5Xlvx+7mw7HD0eojP0ZCOXMYhXiq+5rxd4hmwr1ygiefqZXdlZrVdwdK?=
 =?us-ascii?Q?PKT9Q7bPcOz7hCXW2BzOyKB0mJPMwekFQ85Km2AQsonR33YemEqFyq6QmF4h?=
 =?us-ascii?Q?mh4itqq+NK2upaHkHgJAbnp1KobA0MshOcP1oAxkww+sHFcjea7jC3rYPt9t?=
 =?us-ascii?Q?nSvBdrn/wD8MwTSK60djhrj1yfbFF2X7oaVx4UJ8n/wnFEe+mVOLTyxjiwfy?=
 =?us-ascii?Q?auhAE2ywmlZOc1iNE1SdjJx0v6iQznmb/DoKwJuYkebjY7St2CthXO+PYytF?=
 =?us-ascii?Q?/vBsvioCt3dn0MsGCLzG+YiiMtdxZFb1F1ZKZleuXXqmy5Kvini0He8SmOeA?=
 =?us-ascii?Q?qP/KqlgIlMmblfPL2kuhGI8sA12ls3f8Y7MV7PV74PS+p3FzuYDZSaPwQ7ef?=
 =?us-ascii?Q?iicjTWDwZWN+eTo0XS2mQWSyQWLC7iji5ex7uRuipY3Za42CvIJTGjNQwGm/?=
 =?us-ascii?Q?AwZPpgrDrlDZ0lmpQ1MFUW6hB5S8SarHcZMnC/RYajc3aO7HndzOeeaHlAwG?=
 =?us-ascii?Q?SW0bxBnbqHzQIFAsJB7R8hX4VeIklhQpZ75DU5Zc5bEQ6LaQea4HsM+pkbsx?=
 =?us-ascii?Q?t7UuKhneTcUtz7uEI+YgofXBDseAAkToes2J0WVnXnubP9llC3fTOISqHylP?=
 =?us-ascii?Q?R8nHg+9sSnMkip7T7uO3BAE8VQ8waqs=3D?=
X-Exchange-RoutingPolicyChecked: HwblAAuV0rnGXs+wo+n/9C+UH4BLm17hINe2A58VSyI/PMDCU1UYA/0HyFRFXiLyuJKLb/rAZvJ6PJuMhTIxB0dxb5pZTnBnZ+ddPqV9cOJ55F0S/DK0qfVzY3WC7ztAGc1i0Ts6H7pHWBSwBMLZLRTx885DpAYKMissjemPJ8KiyEdGUQeSR1mJkg2VMajtwDtbW0cyMpRsnuzX8xRa3uPCvNf9kcRl6Afy6PmyttllkjJa3fteChIrFSeKF8FH7FoLo6NCmXCqiM+rIPPQ3gjN+JLSlB7XygVCWYTrEP/sifXToKYSnYueaHYQzi8mH9pMfalk/nhqX0lJRCftHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e69eeb-5908-4d3b-b6df-08deb5e4ea62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 20:26:32.5709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkOw9u2rnbLvQPIdi2s0sifHx8z8tmZ/XyP+08xsXXMqpYPFTZUypROJs90L3PiXOMo3q5ns/TqE+HOVNgfC8dCDWtaCYa73iB1UqBGO518=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB693A2AC
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

On Tue, May 19, 2026 at 09:01:04AM +0530, Arun R Murthy wrote:
> After ioremap the BAR mapped address is read once as a sanity check and
> if found to be all 1s then return avoiding the driver initialization of
> a dead device.
> 
> v2: Move the sanity check to mmio_probe_early() - Michal
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 78adb303b663..d206e3720eed 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -90,6 +90,7 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	u32 sanity = 0;
>  
>  	/*
>  	 * Map the entire BAR.
> @@ -103,6 +104,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  		return -EIO;
>  	}
>  
> +	/*
> +	 * If the parent PCIe bridge failed to leave D3cold, or the device
> +	 * fell off the bus, MMIO reads return all-ones. Detect that here
> +	 * before any other subsystem (SR-IOV, GuC, pcode...) consumes a
> +	 * bogus 0xFFFFFFFF.
> +	 */
> +	sanity = readl(xe->mmio.regs);
> +	if (sanity == U32_MAX && !pci_device_is_present(pdev)) {

Was the && here intended or was that supposed to be an ||?  I think if
the device isn't "present" the read would _always_ be a failure and get
terminated with ~0?  For that matter, is this the right place to be
checking this?  I guess there can be surprise device removal at
absolultely any time, but the most common time this would come back as
false would be if the device got removed during a system suspend; the
code you're adding here only runs on probe and not on resume flows.  I
think it would be pretty rare to see pci_device_is_present() already
return false here in the probe path if we just got a successful return
from pci_enable_device()?

I don't think any platform has a register at offset 0, so if the device
is up properly, the bogus read should come back as 0 (and we can
recognize device errors via ~0 reads), but it still might be best to
read a known-extant register offset just to guarantee there's no
undocumented behavior.  Maybe GMD_ID would be a good candidate since it
should be non-zero (and non ~0) on all POR platforms, zero (and tested
as such) on the non-POR Xe1 platforms, and is a register that we need to
read early in device init anyway (so we could stash the value and save
ourselves the read later).


Matt

> +		drm_err(&xe->drm,
> +			"MMIO reads all 1s and device not present; aborting probe\n");
> +		pci_iounmap(pdev, xe->mmio.regs);
> +		xe->mmio.regs = NULL;
> +		return -ENODEV;
> +	}
> +
>  	/* Setup first tile; other tiles (if present) will be setup later. */
>  	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
