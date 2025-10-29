Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62CDCCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 18:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504DA10E21B;
	Wed, 29 Oct 2025 18:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hupif53a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5275210E21B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761763844; x=1793299844;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AEl25T3uYDK6GgYWaH2h8cg8h7+uW4W9mTZTmVdN9pA=;
 b=Hupif53a2a/KMIankseHSKuMan+RBi4inxpuJr1CMRGXn968SJtTRyBf
 F7C7D7FyKVpwHFCLtL02/Ym4rGemeeffpX3Ozywzmnu+PvRufphz7begk
 lkb6Ukne1xnA6pGdSvsILVfnFLD5onWrhdsvUUsxjMFTTBPeQxS9hxjAc
 09p7YUEXjQBWuXl0wfyLNgNARo1enmmKSVuCMh/ZkFwjjvOvi+4MCuJfl
 h/dO1+9QA0WburdWFQmja2wCCoPipSjlWh0/7Ivm9x/qshBWu04ytgKS9
 tZJb6vlwwMAhKTLsygZIEAeRoPxTzBvyRUajQQbWkETf0o2rZ13SA2nX2 g==;
X-CSE-ConnectionGUID: fqO5bOx5TGqSGBEF/uH7Bw==
X-CSE-MsgGUID: Vheir3MjS+u/puxDa1HVjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74572390"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="74572390"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 11:50:44 -0700
X-CSE-ConnectionGUID: p5SkcBNeRIaEvzQm59TLVg==
X-CSE-MsgGUID: eRrojEHrR7G3KlmLNb5/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="189815827"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 11:50:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 11:50:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 11:50:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 11:50:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc56gDIMAyyOAxrrKxFz3r+vYyCIzeJqH4mjm9h1BjyTCybA6oAtRLsfNZE3bp/hIqbiBzgprhqk/rZ7n+bNwkeXkJvFfNy9ZcTz/mO2rXutkCFP5ygasPrCvGSKlpd/8NU80tydtiNlI1FaWO7g5dBDAEYhrc3JNROneCHYTVF/OM8I/MPu1TIufTyDkekBAe8ZTUMLsebQAOs0PsDnEvRauEZH1DLy2Y3M2ukSEv+JM7Fx+2E8qY9bSstKlormvZ5vEcT7HhBJuncriRMm0LsYsiMOGwsHDydJO70jU+ecd4A2jEaVQLQOctjyznyVwjZnoziaUTt7ABkD7UU1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wNwf1vnsqpJbn/0zQ6+E4KwW7PGTt30vaZSLS82rpo=;
 b=OxYUrTFqk1q8MO4pgirNO/dEEGhmXdJ6AvQhRZFTtY6+N+oFDFUwmQQoa8PADi4SvTyB0XXm38ZUX11iU5pnqbazl4f5V/dVYa+OTd0vUVlOSF62lGEO2coAUumufKQniT+hqgQ1tzInYgrCekVpBYENzEzqNAO9xz4NQbPCP30wVoJu1Gf21CiYmfPT+09j9n9ifc8VGS14iUdpculvX2Pfz5ZKxiX+FsIbCtdGEGkdRaREb3OiQ8GpS5PiIuJytu3d+sV5pc+GvZeauM7QVVKQbDJzlrSv6xe9wNoibraCtlrFTLP88mghBZSOphAPCD0y7yRxaUom0afzMrLelQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 18:50:40 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 18:50:40 +0000
Date: Wed, 29 Oct 2025 14:50:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v1] drm/xe/pm: Enable WAKE# support
Message-ID: <aQJh_aWH5cLlWWLk@intel.com>
References: <20251024102148.3641819-1-raag.jadav@intel.com>
 <aP_c6nylO9L-swL7@intel.com> <aQBQqZvgBhHpViGR@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQBQqZvgBhHpViGR@black.igk.intel.com>
X-ClientProxiedBy: BYAPR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:a03:60::40) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: c645a1dc-9853-4151-bd65-08de171c0e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ZpbZ2tvhl/8PlvNOL2gChExEYNj1HjQnCAVqZ6ea7F1fAYUFPgzapWX1NU4?=
 =?us-ascii?Q?MKg/xDP0jp2NLboYDhBS6SPhLX4bhvrJm+Irtgo1X6rKVnd3UHkuUrdKTS6g?=
 =?us-ascii?Q?INNdOn5lxvQP3UChe+oJ6thP8OpQ6QoU+E+WzSxODv0md8EP1s0pE+fm4Jp2?=
 =?us-ascii?Q?UhmLmUTFOTqSpfhEoXe+VyWw5/+9xQEoMyx0oD8UnHlo2YdrrTGL4+u7E9nh?=
 =?us-ascii?Q?QtVWaX3sBahxzBXm35lx94b/Hz/ih8ULekE7oXb4bRlRHILI7MUt/WChLvsh?=
 =?us-ascii?Q?tGCLCJmKavU7UOddfuM21wCqQHl3VeQASZgsGbGlx4uKqb60n9gCgZo72/4s?=
 =?us-ascii?Q?VMZTtbkMLFbcHoqgPoW9P1G9B3QtInvzGP+MZdy/zeiMOhyztZN6OSQ581E/?=
 =?us-ascii?Q?6ktCWIATAhk84Qb6dxB1d5/h7RpoF0EyhJe7CiZ8zbxzsMCoHXuYQUOiPKWI?=
 =?us-ascii?Q?5tLT5t2YGSu9DHpOEhGeqOBfXruCuqpddiaLTT8CBpBLu4fcbbqajSLpJoST?=
 =?us-ascii?Q?8GyMIdy5W+HYcoCKkJ0/YhMAX5/0n17//tPdWioxEy8/dnYjD+DIjDzVIZG3?=
 =?us-ascii?Q?Ufq40xC/m1oMPusCCh5waK+vmmLY+NMklfIVALFcF8+ebpGu5HfDMTUum6ne?=
 =?us-ascii?Q?7A+sp4TZqJQfwEoa9wvVmtZ13Zc06/LnL/h+WPI5mTClXJ9TyMLbUGGDgYYX?=
 =?us-ascii?Q?n6VWQUKBjJ+2uyce+u90cLDLcgb6EIM1YV8qbVFV3LDnjAz06fJo2oDmq8RB?=
 =?us-ascii?Q?xWeXlajDq8bJ5qtYaBHDGkap0AHPOUfEINE/2jAhf0Wt2ZoKO1RVZ055DBRq?=
 =?us-ascii?Q?xcbO1AWgG42cyXIFz/0dZZzCkBqDgx3yF7gtqv8zxGE6AtfSX3BdH7319kEu?=
 =?us-ascii?Q?S3t4TiHVLbwUjoWUUoH7GJnP8sMb+fuhJHuAWKg86/VH7TZE5kQ/L+SgCbCx?=
 =?us-ascii?Q?okdcCH8+5Gu6R3iRG7y8SjSlAhbfiK6pdiS9DIYXODrpCU4MV1rJiMpNRU1m?=
 =?us-ascii?Q?j9rIJGcRgaq3ZP34L2LC7bQ5KGW2jNWATa8iaGfZUBwAc4EPsUDChURhyb8W?=
 =?us-ascii?Q?T/WsFcDpdY9dueVIn33ek+eMxwS2gRNJxpv2ijKrv8/1KRHWBHHrtpjuL1uK?=
 =?us-ascii?Q?ThCI/91fIJqu4AmhEkug4w2umdlS4mc0L1KZaWuPz8ZgVthep6xZC5Xu0Xr0?=
 =?us-ascii?Q?hlhF76JsKKx+MPccIQJ1evfPs1H1jKDqAC/W4FwXPIWCjrgLniKlFujM6NYj?=
 =?us-ascii?Q?oLxqbjv2N09gsd0vkC74cgUFxbXXjtH3G63wtsalsXFgHVyngcOGNqMMw7qP?=
 =?us-ascii?Q?Om7cWRhtRzZzlTeP4luKCIENsd3VqBG7nQBc1rQjycFGXBs48RJJGep46+LB?=
 =?us-ascii?Q?jXUCrBZHEogzf+q0bkVDLFb1fuxCGJAbSS2lyFMPli/fcDjNTuYyxFkQCYYW?=
 =?us-ascii?Q?lyhfkVKyWipxlKlun4Nsp5QhE1XpGTE+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h88T5uD0+4fI3gdZ7w03NrKfmXitbFyhxYskBed+dNNNoEgiB+2ypQzRsCtF?=
 =?us-ascii?Q?ydMUcJL/a1QvBw9ZvMtdLlZjO2+sIFYveC4QIQbfYmtsPKIvrXkyVLQIdEIk?=
 =?us-ascii?Q?WVZl0cyY2NePQtESFCHelocN8VBu/5HjuvjRk91LGbH3x0HMjjQLomMRaTyT?=
 =?us-ascii?Q?453pdLEa1LMd2EMYzrjJTC1Trg0zNNvQQ6XsxPSKLNXid6gD5UnTlL5a7l4Y?=
 =?us-ascii?Q?dss2uQglzOD4s5B2d1drvJK6zmq2v8NvfgjItzoXnySAhn3OZxuhJzh4MkV8?=
 =?us-ascii?Q?leeC+mnkoe53pi4+yFEIE/fU/v/VARoLnkY3IxiE2WN9LW9F7fZxn50Xig7Z?=
 =?us-ascii?Q?ywVotTZxj1nb0Dw9tMuHvCrju7wLd7LHQgj2NRwzyC7DBhMlPm95YidZvBNE?=
 =?us-ascii?Q?bERa14npINURcS3H4IqYtGTnDIBCyfJji3TDW3M/odrWRox9ZoG/CnXuPZxp?=
 =?us-ascii?Q?q0fHUj7P3GYdYSAV9OBFHfEyJ3M/KBfMwDhMGf7Zst2nHZUjuNGY55fPxskM?=
 =?us-ascii?Q?5EK+Pkdb3XWQjfm0V3tCEQo0ucKu2F9Hm2ckdbg0wB+Sd4EGt8/zjuPyWd0S?=
 =?us-ascii?Q?L8dQ7K9pWaQduww1jJt/LMYFMDMwla12SrXo3kIjsYpvJWXSwLALgCdJ1ull?=
 =?us-ascii?Q?Mf0G7ErTTwHuwx3tautIniS+OINi+muZrTiLNMvvD+IJO+X7BtsPraCwrfY8?=
 =?us-ascii?Q?TpIsTMzQi5i7a1NlKcE3mjNtXeKVbh+e1HsoaQh2GvLMsQ1CrW6yvmOZI+8S?=
 =?us-ascii?Q?x+NPgZoEeTOfJnBmGlFpwZ6w74abMIKG/GUwhBqnVPnMeH1V3bMIH/1I3PHx?=
 =?us-ascii?Q?n0+f5BnOCcIP6IE9TqSgmhx1aPq4E3HtYGQU2bcb+qiDJNsUNoD6xd4FdBKq?=
 =?us-ascii?Q?Xuvsfc4CIo2IQx4f7Uhrp9jxdFi3F4pBquhQrXGoGN36fPTTfz4nIISx7pHU?=
 =?us-ascii?Q?0XXfypMYXX25I9lDK1SDiA755KGIoF5043D0tnsHEFJmQPAzGAUZYldf97u9?=
 =?us-ascii?Q?tv3/59Wm2DiWDdTySvi7QCQlLFmPdZKLKTL7lGOblc1NxhQy/UZqn/lPIsF+?=
 =?us-ascii?Q?8P22K4GYbGj4e6ZvPznsuNkYJRxE0cSyHwat/ZA6hQ+7SCcVT1fzZ0JAwNKp?=
 =?us-ascii?Q?uEw+80hckmTMj7OMs4fXiGYRkIT5ANUcTt9oell5RAUcXYo7Pu4QNJkP56vj?=
 =?us-ascii?Q?kS2GCjo0jSTkV0F7hiSO226bEUirprQaEsgDZcHYowT8x0qT+ytR9Zx1uPky?=
 =?us-ascii?Q?v9QBWUygIb079ik8N0/dJlslwepW72+kyV8RBnPx0xjDgyImPejmM6jlzwCl?=
 =?us-ascii?Q?KuqOMDxMMdIZpSX7xey8Wq0bZcj4TEftbzqluLf8SlC87lMuqovByZP4gbP5?=
 =?us-ascii?Q?NVFLIN7Wh6jNc/QUyP4vxs3kp4rtQL2j5sYyzFXx5zQBqNNvZxc0BJ27Rabk?=
 =?us-ascii?Q?aF1Ej8WOaglS5q5bhNd96cTIg/4WyrTKx87gRa++nzjm8WopILyaFeKqMLcD?=
 =?us-ascii?Q?X/HstHx6ZHcF8hdlH7JSSHG+gysYgHfBqrkn8nmR3oAQoy7v5uZfBj77uVUn?=
 =?us-ascii?Q?hffy2xUPzcVhC/XtqxJrWmQCKPXPYJIJZYbNEc7j6o42UUa6w/pjd6XNZvJB?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c645a1dc-9853-4151-bd65-08de171c0e45
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:50:40.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvFFUS+fjPzJnvc9YX74XeqmibZ99gO3xZOdPar8GSQMb34vMoidjaa/St4iyvT0liJZ/tSC6YQeUc7BsFWrtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
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

On Tue, Oct 28, 2025 at 06:12:09AM +0100, Raag Jadav wrote:
> On Mon, Oct 27, 2025 at 04:58:18PM -0400, Rodrigo Vivi wrote:
> > On Fri, Oct 24, 2025 at 03:51:48PM +0530, Raag Jadav wrote:
> > > CRI supports signalling the host through WAKE# pin on smbus alerts while
> > > in D3cold. Enable/disable this feature based on device/host configuration.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h |  4 ++
> > >  drivers/gpu/drm/xe/xe_pci.c          |  4 ++
> > >  drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
> > >  drivers/gpu/drm/xe/xe_pm.c           | 72 ++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_pm.h           |  1 +
> > >  5 files changed, 86 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 8f62ee7a73ac..dae2bd06bcea 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -517,6 +517,10 @@ struct xe_device {
> > >  		 * Default threshold value is 300mb.
> > >  		 */
> > >  		u32 vram_threshold;
> > > +
> > > +		/** @d3cold.wake: Indicates WAKE# capability of device */
> > > +		u32 wake;
> > > +
> > >  		/** @d3cold.lock: protect vram_threshold */
> > >  		struct mutex lock;
> > >  	} d3cold;
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 6e59642e7820..edf63f55f345 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -1105,6 +1105,8 @@ static int xe_pci_suspend(struct device *dev)
> > >  	if (err)
> > >  		return err;
> > >  
> > > +	xe_pm_set_wake(xe, true);
> > 
> > why does it need to be here and not something static inside xe_pm itself?
> 
> The expectation is this should be done only if xe_pm_suspend() is
> successful or you can guarantee it.

so, please make sure it is the last call before the return 0 inside
that function so you don't need to make this public function in the
header, but keep that static in xe_pm...

> 
> > > +
> > >  	/*
> > >  	 * Enabling D3Cold is needed for S2Idle/S0ix.
> > >  	 * It is save to allow here since xe_pm_suspend has evicted
> > > @@ -1156,6 +1158,8 @@ static int xe_pci_runtime_suspend(struct device *dev)
> > >  	if (err)
> > >  		return err;
> > >  
> > > +	xe_pm_set_wake(xe, xe->d3cold.allowed);
> > > +
> > >  	pci_save_state(pdev);
> > >  
> > >  	if (xe->d3cold.allowed) {
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > index 92bfcba51e19..3f8d43c1b4fe 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > @@ -50,6 +50,11 @@
> > >  #define	READ_PL_FROM_FW				0x1
> > >  #define	READ_PL_FROM_PCODE			0x0
> > >  
> > > +#define   PCODE_D3COLD_WAKE			0x5A
> > > +#define     READ_MODE				0x0
> > > +#define     WRITE_MODE				0x1
> > > +#define       I2C_WAKE_ENABLE			REG_BIT(1)
> > 
> > please share the spec with me
> > 
> > > +
> > >  #define   PCODE_LATE_BINDING			0x5C
> > >  #define     GET_CAPABILITY_STATUS		0x0
> > >  #define       V1_FAN_SUPPORTED			REG_BIT(0)
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 53507e09f7bc..30e4a787b9cb 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -7,6 +7,8 @@
> > >  
> > >  #include <linux/fault-inject.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/pm_wakeup.h>
> > > +#include <linux/string_choices.h>
> > >  #include <linux/suspend.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > > @@ -22,6 +24,7 @@
> > >  #include "xe_i2c.h"
> > >  #include "xe_irq.h"
> > >  #include "xe_late_bind_fw.h"
> > > +#include "xe_pcode_api.h"
> > >  #include "xe_pcode.h"
> > >  #include "xe_pxp.h"
> > >  #include "xe_sriov_vf_ccs.h"
> > > @@ -422,6 +425,74 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
> > >  	return NOTIFY_DONE;
> > >  }
> > >  
> > > +void xe_pm_set_wake(struct xe_device *xe, bool d3cold)
> > > +{
> > > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +	struct pci_dev *root_pdev;
> > > +	bool wakeup;
> > > +	u32 val = 0;
> > > +	int ret;
> > > +
> > > +	/* WAKE# is not needed, let PME do the job. */
> > > +	if (!d3cold)
> > > +		return;
> > 
> > Please NO! check this outside and only call the function if needed instead
> > of passing the need as argument.
> 
> Sure.
> 
> > > +
> > > +	/* Currently WAKE# is supported for I2C only */
> > > +	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
> > > +		return;
> > 
> > let's perhaps make it a
> > 
> > static void i2c_set_wake(struct xe_device *xe)
> > {
> > ...
> > }
> 
> No, there are other usecases supported that we're not adding here (yet)
> and we don't want to come back revamping/duplicating code when we need them.
> Simply add a new bit and call it a day.

fair enough...

> 
> Raag
> 
> > > +
> > > +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0), &val, NULL);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	root_pdev = pcie_find_root_port(pdev);
> > > +	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
> > > +
> > > +	if (wakeup)
> > > +		val |= I2C_WAKE_ENABLE;
> > > +	else
> > > +		val &= ~I2C_WAKE_ENABLE;
> > > +
> > > +	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), val);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	drm_dbg(&xe->drm, "WAKE# %s\n", str_enabled_disabled(wakeup));
> > > +}
> > > +
> > > +static void xe_pm_wake_init(struct xe_device *xe)
> > > +{
> > > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +	struct pci_dev *root_pdev;
> > > +	int err;
> > > +
> > > +	if (xe->info.platform != XE_CRESCENTISLAND)
> > > +		return;
> > > +
> > > +	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0),
> > > +			    &xe->d3cold.wake, NULL);
> > > +	if (err || !xe->d3cold.wake) {
> > > +		drm_dbg(&xe->drm, "WAKE# not supported by device\n");
> > > +		return;
> > > +	}
> > > +
> > > +	root_pdev = pcie_find_root_port(pdev);
> > > +	if (!root_pdev || !device_can_wakeup(&root_pdev->dev)) {
> > > +		drm_dbg(&xe->drm, "WAKE# not supported by host\n");
> > > +		xe->d3cold.wake = 0;
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (!xe_i2c_present(xe))
> > > +		xe->d3cold.wake &= ~I2C_WAKE_ENABLE;
> > > +
> > > +	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
> > > +out:
> > > +	xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0), xe->d3cold.wake);
> > > +}
> > > +
> > >  /**
> > >   * xe_pm_init - Initialize Xe Power Management
> > >   * @xe: xe device instance
> > > @@ -459,6 +530,7 @@ int xe_pm_init(struct xe_device *xe)
> > >  			goto err_unregister;
> > >  	}
> > >  
> > > +	xe_pm_wake_init(xe);
> > >  	xe_pm_runtime_init(xe);
> > >  	return 0;
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > > index f7f89a18b6fc..9cedba8a7f80 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.h
> > > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > > @@ -30,6 +30,7 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe);
> > >  bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
> > >  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> > >  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> > > +void xe_pm_set_wake(struct xe_device *xe, bool d3cold);
> > >  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> > >  bool xe_rpm_reclaim_safe(const struct xe_device *xe);
> > >  struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> > > -- 
> > > 2.34.1
> > > 
