Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F931C0218B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 16:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473EC10E1B0;
	Tue, 21 Jan 2025 16:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtJ/KfTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2038110E605
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737477591; x=1769013591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zao+/L8sVWbbt5vF/fe/Gb3lnLWlou+1kP2HPagME8g=;
 b=CtJ/KfTv1toRSJW/JZRDVQAZ8YLs7HsRcQqEJ3GXoJlma0E+yt4T/9To
 zjTf8UzZOJ2DLWkugj6qjtwnjJcIsp4753Jw5cpZDqyhY5igzKyhXxWQt
 t4Om9slYVqlrhfvwog63ypqGeta3h8fcT8FAkojHEBqDCGOKdWK+Pahq+
 asS5rh30nkyeqTDOAspdHCxmKSJyGyEz76kfU+jkdpjACc4iAYHUsgg8k
 1wZ3zPhzNFhmYOd2vb1jY0UacioLuWfRV91ODhjvy+bwGg1ekVN8MIzgo
 3QKEzwivOn/I8jG5pob7TaamziI8tsqp7aGgTpGTjxmd5R0jHJnL1BN5+ w==;
X-CSE-ConnectionGUID: 2dj8ld6yQpOsHCvWl3otKQ==
X-CSE-MsgGUID: dR7eC+KUSuiO2w399Z4zng==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="63260982"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="63260982"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 08:39:50 -0800
X-CSE-ConnectionGUID: joQwDrNdTUe53oDuJHykCw==
X-CSE-MsgGUID: mgHi0doDQvuKslKwQvHgtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106778687"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 08:39:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 08:39:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 08:39:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 08:39:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbp6lYW4QfXXQw1WQZeeYKRyUCUcdomXLK58uTZwJh9Ehwh0dFEmx3BUE1ux1MCeZf8o3DEePuiMfDLNx8A8KefnYqZn8Fat3fjVXFtEDE9XaDQ8WtlAexmH7QqODtqNVRYzD/uR2DNIlmisl89OBtxIG/fiWwt1VHDNmUNanSZIXGw9Qes1kKGIUHoBu1VGz1CLIklVt39myzfqUVKhW0eaXKgkVmWTwvTwutjO26h8Zzlu1RNG7S3e66A0nENSq43RadlzVatZ0O9OBvJMyVAiCcRU0JphZUDUOaxS1NiNdxStazu/uxgcmyocDcgqR12mvi/IYcoQFaHAqMlw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf/Nt/xmYqHvuPhkyBiaeV08UUTY3BIMf3OZ+pTLQGk=;
 b=y2XXONiGewVaEBYh1EHtuKZKh8K6uQz7A8YqxpjdGZday7JHbA9rB7voGbPbvEmCOOA8mVX0xfLH17dXeATnyQqBl5qqfx0W7DiQl0z4TqaHFN1evA3KEgt1KTNklKHAjq4bYcPRCl+rTrerqme4vA5ql6n1fTcwsFbJuZAtUO4rd28hNZ5SJAev0qKPbUxSeWDQUKHFhZXcVZks7WqaqwKWbqwATRFdDeYL+1lpo6wUeV+OcPvETTKITrm2Kmm/Vw9Xne8m1Z8DXywdEsrrktenM9bf3cb2kN7SnudtOsgOD2dxnmlYDkAkS5ednvVK/0hgLOFVDejGm4AupetISQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 16:39:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 16:39:44 +0000
Date: Tue, 21 Jan 2025 08:39:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Koby Elbaz
 <kelbaz@habana.ai>
Subject: Re: [PATCH] drm/xe: Remove unused "mmio_ext" code
Message-ID: <20250121163942.GD4460@mdroper-desk1.amr.corp.intel.com>
References: <20250106234312.2986065-2-matthew.d.roper@intel.com>
 <55e647fd-08b0-4395-8fb0-ad53ac3f9be7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55e647fd-08b0-4395-8fb0-ad53ac3f9be7@intel.com>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 300dc8de-20fd-4477-89ef-08dd3a3a35ef
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d8zJrQ3art7qfI65i/GX9Rs+QJLyQkjL1dLrNS2pd+WkEkVW44hvHt/m94BX?=
 =?us-ascii?Q?+GnDcdBBK+CyjO6yxhO5LwnGkwpGHpyOhTUMIYeDx6woh/WBr9x10ti6cDCc?=
 =?us-ascii?Q?8/EDKVzaWJP8xm6VUAl9GpctdwW4C4Auvywd9uazbZY+yIv/NtTVjvsYJsEH?=
 =?us-ascii?Q?L7nGoF+INirX7kyZ8gwu14sZ56P8lTSmBl2L3CIU/Ic/az00ZOncRxlN+hGD?=
 =?us-ascii?Q?Xfd0cZHds9MZxlNnYDR5wFiKcidgvSLC5+bJ1RBrgsTgH6g706eZj08fF1Tv?=
 =?us-ascii?Q?QaTetMIbc6zJHoFPJLt4OjDzg9KR98CxxKE+RyK4DQ2+ssDZJHezaNBKCFOk?=
 =?us-ascii?Q?N9J0qvxIo5LsWmzyTAyGctgqrVrCzH8Ty0On+UdAEIDA8IDMNfr0rPIOJieP?=
 =?us-ascii?Q?IGvHRmDuRO/GLb4udE3xzbgX/7Eo/DaNLG1Y8jjkVwMiH0uoGitYWmF1fsAt?=
 =?us-ascii?Q?feAK0Esuh6vm3y8bL8EAB9hee3GcSTgqcdBanJTJ4FML4lydVQ0D5aP/qt04?=
 =?us-ascii?Q?FT9hCpqkb7Tfx83X3uJAANz1YUGoI1/apqFIHM6vGxRUKzRRcWpUXHrkxtlo?=
 =?us-ascii?Q?6nD/Ex5qRg4NnTQlrWrqReYvwSoHiGJJ7mAcIk3qLKfrGlS8D3yrMalV886F?=
 =?us-ascii?Q?W2YA15ByAsZXPOwA4TTI1Dt8NfKJfhOeMbU5MkVJ4toTPH7wd6H/PSb/XKA7?=
 =?us-ascii?Q?8yIvKJArWqtnU5UYi/9Y4tYeHhQQyf83Z4Eh5R9lUVaqEM/Mg9CIG1Lbz7W7?=
 =?us-ascii?Q?PBwnRIJ414iw9tnw7vE5rWfKw9zidBeWWtG8s1KqXAAhQ/6LGr94Xtr3OU1Q?=
 =?us-ascii?Q?BXf2HXQwJEtUDW/GN3ULZOQWjqf+barBXrJ3+13sI3px0XwYn7tRNMRJJN2I?=
 =?us-ascii?Q?POQBh7UQTG+wQaoOZJsO5lkL5ZUNDau3fqPbF9h05imeAPyK4nPy9ceM1Qyo?=
 =?us-ascii?Q?/DqXz0eAagg2dUGHkTIc9tWY1BXUGykBi3aH226z3Rr7+5Df2L63i/G1a+cO?=
 =?us-ascii?Q?17LzxK8R1kcVMxtX5k1OHTF751+6R88+evv8ZQ3lnHC0eBd1Q/qIkjb8au53?=
 =?us-ascii?Q?M0P57SMRm5L3sd9rIkQUBi3whidogkcV4sOnlyBwgUrZiiTTp6PwUxSfJ5a9?=
 =?us-ascii?Q?snWbX8pTvHlJIxVdw3TTPUpr8+9d4qasm2zPyGpOsvm8zjDDmvcP0BjNEs6B?=
 =?us-ascii?Q?YqgyaFsfabayAEmaAiqKo3/Rc64NMnEklq2qVgqCc8YfKudeC3zNnpImxxB7?=
 =?us-ascii?Q?cLBAI+tI5SZdihD9gLnw2MsN+I19Rftyn40rx99CE9ZSKAol3dExXLUQwDid?=
 =?us-ascii?Q?rrP815sU2a6RfgSNItryRRTSailCsrNqv4F5D5uO+/F10sPvyTDrXQ0YE6rd?=
 =?us-ascii?Q?tKTYh99ZQjdGuqKksN1M68i50aLz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5iDLHrGp8ttdClflpdQZi1L7QpySYPPsYYJou5r0jXevdA9ihV4AIGVIlc9i?=
 =?us-ascii?Q?glVmE/1ltKLWww4NX3n9A1DxkUDzD8hFUha9+xq0lOMXXyhh9bCZNeVBaVTa?=
 =?us-ascii?Q?nz2lAaEbqODvl008sUEGWVH7ADuZiJW6Jlnza7Fbs2MIGc5vQ+sbjONrqKYV?=
 =?us-ascii?Q?TzHOjiGeT1n3ezxZrFRat1OIWFbG4Vo2C/zQO/qx7UjieR6NccrNAyZItWA7?=
 =?us-ascii?Q?4PolcVxkWGxlQBp5/8LJ9ay/R8efrrMOopDqSzclklCysixAUFYpgLmZpAmc?=
 =?us-ascii?Q?DmY4BAcImrQwlLAOFWLhrfGcsG3rMks01KHIK5O2/+CHIiBafSvHt4oUf+yV?=
 =?us-ascii?Q?uZl/W15XMQl+3D+RYU4obKiOGbBP6WqAILbNZadN0IWvMtZ1W3O8tpW/mBdt?=
 =?us-ascii?Q?jhVtF5QzWd7wZWd48A06T7a78fhFla73kj0cppFkeLRwpfKYx06YZHVqyluP?=
 =?us-ascii?Q?I4sqBPT+v6T+l1g4wzRQzC581zoKLHwPiRH0p+Sx5ouqFF3ToiFDFtSylkDV?=
 =?us-ascii?Q?WgHPfmQH/0vdEKx+PgQEzJ7RZiOBI6mRpGDDmF2HyD/iQ+GgBjkO7L4hIvX4?=
 =?us-ascii?Q?JvvZxmttsvB2MXpstitUW6Cb4NIoOzCbhIIc1dGwtnJY6fPrtgpQmiMDafBF?=
 =?us-ascii?Q?RquBMNmoS56JA64fS+32U0955pijAvXJ/DqHJC+VKbtA6roeEDz1G8+RMDi1?=
 =?us-ascii?Q?wqF/EaTHPzOYVPTn4xBaQeQ5vuWz4dKS9ZTn5kdBD1BoYKY5wT2n0ZWAYz4N?=
 =?us-ascii?Q?5d0cL4nFeJ90ZpKSY8uMadXGnm5kdzoSI1vWrYgezLEIBexFpzK9XxTVPfqX?=
 =?us-ascii?Q?yISax1YqZcxCvuB0uY6NrfjhmBlfw51Ml+TZWKMi4wKMY+KI9wtlfWQFRiqG?=
 =?us-ascii?Q?TtU3S3A61SnO5v8UG7dM9xTOunH7tjadyVmtfzs5PoiIX887MCj+/J7XiNYx?=
 =?us-ascii?Q?KM5/JfjbgzprP0H332SRd/+TlPT47gFLKwT5NFpQrNt5aWEo/LmV6wC3AHLf?=
 =?us-ascii?Q?fz6M1ob4Y5k+6KW8rDUnFSvqw4gvyCIi9eu+XSvjPEBryFyJLycOoSH6YMIp?=
 =?us-ascii?Q?QcCV2E0CjyTJZZ6a2UMP4s601CJTzkWWfWpQd+p+83K/xDO+lXRgvSmYeHg7?=
 =?us-ascii?Q?auRjxJvwW32ej/NNjKTk26jm2CqOl93LfrlLbiIT6Gp3GBHD/zv8i3YLa8a5?=
 =?us-ascii?Q?1RaxHABblBprIAm0nBnU0enGnBoO5GbuZ5FvQJjQ5orvRw7D33ma17RL6PR1?=
 =?us-ascii?Q?nl/139A8ZTbqk8cr1KqauDCZzBl5RRpF/Wa2nTThx7iQXBuTtG5YzQm4LLz0?=
 =?us-ascii?Q?asYnS2sCAN154L0Yc+H/vT0FRbvT6ORglTITovSNBhVLCTLKthAYxoatayHu?=
 =?us-ascii?Q?ScJ5cwsHmvcgwayeLBC2prl1W9EG98g3J7+JVuRrdC4Rf+vnZv7nbTZNY75F?=
 =?us-ascii?Q?OXJG6h6r+WFdLqQ0Yl1PqKqrDl5pIh7qkA9YU2UElYuHCY3AIN8h8zf0Xwjh?=
 =?us-ascii?Q?wjh47f8bhMT/OSDTa6iyMEe9C/MwEWEnWjKx2GKB13/cET7EpqUXk8ruv7lE?=
 =?us-ascii?Q?zNnaLlXrue2ZQllT/ZhQ+u6+GNr3bOXcvRxUBUazsFKDlaQyPaxAo5+PpNKu?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 300dc8de-20fd-4477-89ef-08dd3a3a35ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 16:39:44.5964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltFNQ00Q5lO7417ohwG/6vshW4YyczIOMbG1XvNQoUCA2W8vheadHme392MeFICWQtn7JfbQ5DNSo9QmPe2AJWIe19lyUXifCArywUemAUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
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

On Wed, Jan 15, 2025 at 11:46:10AM +0200, Levi, Ilia wrote:
> On 07/01/2025 1:43, Matt Roper wrote:
> > The "mmio_ext" and 'REG_EXT" code is currently unused on any existing
> > platform.  Going forward, this also isn't the design we want to use for
> > any future platforms/features either, so we should just go ahead and
> > remove the dead code to avoid confusion.
> >
> > mmio_ext was originally added in an attempt to hack around the early
> > (mis)design of the Xe driver, which used xe_gt as the target for all
> > register MMIO access, even those completely unrelated to the GT subunit
> > of the hardware.  With the introduction of commit 34953ee349dd ("drm/xe:
> > Create dedicated xe_mmio structure") and its follow-up patches, that
> > misdesign has been corrected and access to register MMIO regions
> > specific to hardware units is now done through xe_mmio structures which
> > encapsulate an iomap, region size, and some other metadata.
> >
> > Although all of the registers used by the driver today happen to fall
> > within one specific PCI BAR region, and thus re-use a single device-wide
> > iomap, there's no requirement that this stay true for future platforms
> > or features.  I.e., if a future platform adds a new 'foo' hardware unit
> > that exists at a different area in the BAR, or even in a completely
> > different BAR, then that would be handled by doing a separate iomap of
> > that unit's register region and wrapping it in its own 'struct xe_mmio
> > foo_regs' structure.  The pointer to the new 'foo_regs' could be placed
> > within the xe_device, xe_tile, xe_gt, etc., according to where the new
> > hardware unit falls within the current hardware hierarchy.
> So this approach suggests that each instance of struct xe_mmio should be
> initialized with its own iomap() call? If so, I think there's more work

No, using a separate iomap is an option rather than a requirement; it
really comes down to what makes the most sense.  For example we already
have gt->mmio which shares an iomap with tile->mmio since the prior is a
subset of the latter, and they share the same natural offsets in the
bspec (i.e., the register offsets are from the beginning of GTTMMADR).

If you have a new hardware unit that is truly self-contained and has its
own register offset scheme (i.e., offsets are expressed as values from
the beginning of some other base rather than the GTTMMADR) then it makes
a lot more sense to use a separate iomap and use the natural offsets for
that hardware unit.

> to be done here, something like:
> 1. get rid of xe->mmio
> 2. refactor mmio_multi_tile_setup (each tile has its own xe_mmio)

Yeah, at the moment each of our tiles is sharing an iomap for historical
reasons.  It probably does make sense to split that up now (since each
tile has its own unique offsets) and there's no specific reason to keep
the old unified iomap around.  I'll send some patches for that in a bit.

> 
> - Ilia
> >
> > This effectively reverts the following commits, although parts of these
> > commits had already vanished or changed with the earlier xe_mmio
> > refactor work:
> >
> >  - commit 399a13323f0d ("drm/xe: add 28-bit address support in struct
> >    xe_reg")
> >  - commit fdef72e02e20 ("drm/xe: add a flag to bypass multi-tile config
> >    from MTCFG reg")
> >  - commit 866b2b176434 ("drm/xe: add MMIO extension support flags")
> >  - commit ef29b390c734 ("drm/xe: map MMIO BAR according to the num of
> >    tiles in device desc")
> >  - commit a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support
> >    MMIO extension")
> >
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Koby Elbaz <kelbaz@habana.ai>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +----------
> >  drivers/gpu/drm/xe/xe_device_types.h  | 11 --------
> >  drivers/gpu/drm/xe/xe_mmio.c          | 39 ---------------------------
> >  drivers/gpu/drm/xe/xe_pci.c           |  3 ---
> >  drivers/gpu/drm/xe/xe_pci_types.h     |  2 --
> >  5 files changed, 1 insertion(+), 70 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> > index 51fd40ffafcb..0234d1e84139 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> > @@ -21,7 +21,7 @@ struct xe_reg {
> >  	union {
> >  		struct {
> >  			/** @addr: address */
> > -			u32 addr:28;
> > +			u32 addr:22;
> This will limit the xe_mmio read/write operations up to 8MiB offset across
> all xe_mmio instances. It is enough for now, but we might want to leave it
> as is for future platforms. Also, this means that setting regs_size in

We can always raise the size again if/when an actual user shows up.
That way it will be more obvious what's going on and we can review the
changes together.  But adding an assertion sounds like a good idea.


Matt

> xe_mmio struct to anything bigger is meaningless and probably a bug.
> Maybe it's worth to add an initializer to xe_mmio struct that asserts this?
> 
> - Ilia
> >  			/**
> >  			 * @masked: register is "masked", with upper 16bits used
> >  			 * to identify the bits that are updated on the lower
> > @@ -41,10 +41,6 @@ struct xe_reg {
> >  			 * @vf: register is accessible from the Virtual Function.
> >  			 */
> >  			u32 vf:1;
> > -			/**
> > -			 * @ext: access MMIO extension space for current register.
> > -			 */
> > -			u32 ext:1;
> >  		};
> >  		/** @raw: Raw value with both address and options */
> >  		u32 raw;
> > @@ -111,16 +107,6 @@ struct xe_reg_mcr {
> >   */
> >  #define XE_REG(r_, ...)		((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
> >  
> > -/**
> > - * XE_REG_EXT - Create a struct xe_reg from extension offset and additional
> > - * flags
> > - * @r_: Register extension offset
> > - * @...: Additional options like access mode. See struct xe_reg for available
> > - *       options.
> > - */
> > -#define XE_REG_EXT(r_, ...)	\
> > -	((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__, .ext = 1))
> > -
> >  /**
> >   * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
> >   * @r_: Register offset
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 8a7b15972413..16ebb2859877 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -186,13 +186,6 @@ struct xe_tile {
> >  	 */
> >  	struct xe_mmio mmio;
> >  
> > -	/**
> > -	 * @mmio_ext: MMIO-extension info for a tile.
> > -	 *
> > -	 * Each tile has its own additional 256MB (28-bit) MMIO-extension space.
> > -	 */
> > -	struct xe_mmio mmio_ext;
> > -
> >  	/** @mem: memory management info for tile */
> >  	struct {
> >  		/**
> > @@ -263,8 +256,6 @@ struct xe_device {
> >  		const char *graphics_name;
> >  		/** @info.media_name: media IP name */
> >  		const char *media_name;
> > -		/** @info.tile_mmio_ext_size: size of MMIO extension space, per-tile */
> > -		u32 tile_mmio_ext_size;
> >  		/** @info.graphics_verx100: graphics IP version */
> >  		u32 graphics_verx100;
> >  		/** @info.media_verx100: media IP version */
> > @@ -314,8 +305,6 @@ struct xe_device {
> >  		u8 has_heci_gscfi:1;
> >  		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
> >  		u8 has_llc:1;
> > -		/** @info.has_mmio_ext: Device has extra MMIO address range */
> > -		u8 has_mmio_ext:1;
> >  		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
> >  		u8 has_range_tlb_invalidation:1;
> >  		/** @info.has_sriov: Supports SR-IOV */
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index a48f239cad1c..d321a21aacf0 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -103,50 +103,11 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> >  	}
> >  }
> >  
> > -/*
> > - * On top of all the multi-tile MMIO space there can be a platform-dependent
> > - * extension for each tile, resulting in a layout like below:
> > - *
> > - * .----------------------. <- ext_base + tile_count * tile_mmio_ext_size
> > - * |         ....         |
> > - * |----------------------| <- ext_base + 2 * tile_mmio_ext_size
> > - * | tile1->mmio_ext.regs |
> > - * |----------------------| <- ext_base + 1 * tile_mmio_ext_size
> > - * | tile0->mmio_ext.regs |
> > - * |======================| <- ext_base = tile_count * tile_mmio_size
> > - * |                      |
> > - * |       mmio.regs      |
> > - * |                      |
> > - * '----------------------' <- 0MB
> > - *
> > - * Set up the tile[]->mmio_ext pointers/sizes.
> > - */
> > -static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
> > -				 size_t tile_mmio_ext_size)
> > -{
> > -	struct xe_tile *tile;
> > -	void __iomem *regs;
> > -	u8 id;
> > -
> > -	if (!xe->info.has_mmio_ext)
> > -		return;
> > -
> > -	regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
> > -	for_each_tile(tile, xe, id) {
> > -		tile->mmio_ext.regs_size = tile_mmio_ext_size;
> > -		tile->mmio_ext.regs = regs;
> > -		tile->mmio_ext.tile = tile;
> > -		regs += tile_mmio_ext_size;
> > -	}
> > -}
> > -
> >  int xe_mmio_probe_tiles(struct xe_device *xe)
> >  {
> >  	size_t tile_mmio_size = SZ_16M;
> > -	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> >  
> >  	mmio_multi_tile_setup(xe, tile_mmio_size);
> > -	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
> >  
> >  	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 7d146e3e8e21..90fcfafd362f 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -61,7 +61,6 @@ struct xe_device_desc {
> >  	u8 has_heci_gscfi:1;
> >  	u8 has_heci_cscfi:1;
> >  	u8 has_llc:1;
> > -	u8 has_mmio_ext:1;
> >  	u8 has_sriov:1;
> >  	u8 skip_guc_pc:1;
> >  	u8 skip_mtcfg:1;
> > @@ -622,7 +621,6 @@ static int xe_info_init_early(struct xe_device *xe,
> >  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> >  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> >  	xe->info.has_llc = desc->has_llc;
> > -	xe->info.has_mmio_ext = desc->has_mmio_ext;
> >  	xe->info.has_sriov = desc->has_sriov;
> >  	xe->info.skip_guc_pc = desc->skip_guc_pc;
> >  	xe->info.skip_mtcfg = desc->skip_mtcfg;
> > @@ -682,7 +680,6 @@ static int xe_info_init(struct xe_device *xe,
> >  
> >  	xe->info.graphics_name = graphics_desc->name;
> >  	xe->info.media_name = media_desc ? media_desc->name : "none";
> > -	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
> >  
> >  	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
> >  	xe->info.vram_flags = graphics_desc->vram_flags;
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 79b0f80376a4..873efec5cdee 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -20,8 +20,6 @@ struct xe_graphics_desc {
> >  
> >  	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
> >  
> > -	u32 tile_mmio_ext_size; /* size of MMIO extension space, per-tile */
> > -
> >  	u8 max_remote_tiles:2;
> >  
> >  	u8 has_asid:1;
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
