Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126C2C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 20:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07F810E28B;
	Wed, 12 Feb 2025 20:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBPVmaqD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC33510E28B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739390483; x=1770926483;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wXqOTDooD+raBjWnqsXgjYHQ3fdlTd3gJ/RoLpvEqYk=;
 b=MBPVmaqDWkWQ8Kz2gUzmlHmJFdGzP2RnGvFD8kmfAD69jLKLKypnbThc
 RG5BQ6Y77zd6RIGuMZiNzp9Bb0EIme0oTml7g6UeIGbBe5EXH9JgIVFq+
 8bzedxnN6LQUlwAPISvLheczSgUSJOW5vyWZ2VO/j6mJg5htSkC57/st8
 8uh4aIFXQIcHdbXgTpfeWJiunffB/aEA9kmcYV7mPk9d/yfx+9LRaFYKd
 jdwM9RFj+ov41kh56Gewk7b8sBu7s6vjtncP8NeJBWAVp9w/UgMkYeaSb
 +BkZbKz5pxSVQ6v9SQt/7jQ1PTH81mJupoy2BVTFxdOeyCSRLlEO/SCe2 w==;
X-CSE-ConnectionGUID: FP7tis9bTF6ICD7++Pk/lg==
X-CSE-MsgGUID: wO/BV+D0SDWFeX1BPAYWJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="27663166"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="27663166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:01:22 -0800
X-CSE-ConnectionGUID: wTeISQI0RJW/mxM8lK6y8A==
X-CSE-MsgGUID: H7jDw4+yTi+S1tegtBrXhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117547540"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 12:01:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 12:01:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 12:01:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 12:01:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPUaNfi8Khh0Ua72OkLpfY23Hg49ubju5FLZVM7iGLRu2/m9clXIRUw6QJfOLWvradDR346m3fVHrqhp++PKrdSZh3J+La3g6ZNRv8k9b+YUkXZNoH7/kdNAPUXN5lTtgPIqR/MateM5mUp4uKElGo/p9/0a06+RIYri/oxy8i5uy+q2wDOVRzRtzBEF4UTbIXuXf6VFoa/NWsGkvLJIKjQtYNWwOGL/n36tR2Rb5HBSR2910U8cV7BHfNUbqnGyllcWJwjGGKSSaR+MiKFkIz570Ct9Ozes5LiABHgR1epbWzHzn1e06jP4CfMtciW1eP11Mf6gk79vkavZqAbNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/aP1HXCS7UHqJR3yyUZUNS/AZapRnrquqDaovVcDGg=;
 b=LqGOWBSLfpZ2BSEI+U3I6AccAj3lCzPDILzMcaLDvGHrpprJRuutY1RSwahuTwFscqtl9bcvy3M7vIEp3Sv20upGtYWYA3vCPuyIbtmTpVVh6l5d6xUyo+KBCqWVLSmbdz1cnefGtTSjIWHurp7x/Sc88bZKC3ijiJTcDo9iHngRqV29RLlhzQlQjDYBrTwbgK5CNCBCuxM2TLMUcIu1v/7HDs1U4oCRQpAXAKgCMV7FsL+TCYr5lun6k6SteYanPy/D2CmEjRsUbFJaKIb+jjGkD22D0BMztOEfTaXv39MoEO3jSHongPL76ge8NkH3W53fSMNvc4FjTooPyoVeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 20:01:17 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 20:01:16 +0000
Date: Wed, 12 Feb 2025 15:01:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 01/13] drm/xe: Add callback support for driver remove
Message-ID: <Z6z-CHRbTtO137d7@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
 <20250212193600.475089-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212193600.475089-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b428451-7562-463b-1f42-08dd4ba0024e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jVFoK06XWzBuorgz/O2DAvMhrjtAVBYyON9dpwmifPXFfCgmZvHiLRHzAS?=
 =?iso-8859-1?Q?/xszkGWs3weuARmcymkBIBePTPDHLzhYEHetc/XdsGky/K3MPwlZZBg7/o?=
 =?iso-8859-1?Q?V63hVwreZshvq/NTHnoK2GB09dHEXXelViNSZx7Q0y9EI/eEVR6W1WNJ1w?=
 =?iso-8859-1?Q?PXpFSvLpxGIoWxnMiCzcK6I7CC5JAktoEYIGWly/a5GytfMzkCKhAWeUDm?=
 =?iso-8859-1?Q?XeQzyfBcomVs3tw+CfE9lSb6TSR0OZc1zvZ397/srAzpsyzXnNfoLE+VhG?=
 =?iso-8859-1?Q?OeEGwm7nPly+Z5QfwujAbASlzb+iELhWPxbOCx0NTTgkby6KNJCIDR+AkW?=
 =?iso-8859-1?Q?x33xfb/n8eEUYpEpgpQbV1wKQFE92f5a/7ab7Cu4hYHpxc4wRC6xMvSp3u?=
 =?iso-8859-1?Q?u3SUMPU8EsuzZH7QOSCfCYF/EJW4pD2vbBTbonMNgn3Vvy42Wh5582hul6?=
 =?iso-8859-1?Q?jE8jClqytcSrcqktiKrqwk9b5TV/8/eTNm648VCw/s7peYdeAjkER1TwCB?=
 =?iso-8859-1?Q?8o+w+1egX9fxXIPWZ2sBqu9U1p7d0WAas5Ef+HEIPfMMvyUOd0zUpfOCzy?=
 =?iso-8859-1?Q?BNPypXOa10EDU4E4WLzjKrbdDyntp6I7q7XuABCM4ksYQOw9uFXFot9e3q?=
 =?iso-8859-1?Q?UX4LqdNB7uu7Bbiyk/vdrmtTbvQi8xuZ15xphawhrqrUoDl8gFd/S4l14p?=
 =?iso-8859-1?Q?CpuuvuyQk4pVAZSvnT8oDxI2ltRBx8KVRQBccFSOgWQfDbPcj5vCgtINlh?=
 =?iso-8859-1?Q?7vBJNagtcmhmYPQnZ8sF4uL3jNi8ii3oTE3+bUd5d8Kzj51jNKJqGP2w8j?=
 =?iso-8859-1?Q?QdsZ0/6G5QibqlQiYwimE+7s7S1mMrly1MgJU+NKh+UISp+YfwtxgSNDxg?=
 =?iso-8859-1?Q?y9kXtQGlgx64gEIl/PdtP7Ddz1t54eoBf52YuZROyULp7j9rsY8C0KD+4+?=
 =?iso-8859-1?Q?Ee4WQEgsRyNQj35Ot1CsYK9hkESFZLWIRVXCdolNNIZ6xUlGozgV11y05d?=
 =?iso-8859-1?Q?rST1UaV/IYZJ/PJ3lPJ0h4Bf861OpWGyLb3j7LdUPSmwl6Z/SY5rKg3KNg?=
 =?iso-8859-1?Q?HCwZeksOqvYz7Nh3PXewUPx82cp31wdoIvMmrE/AQj1NV1GKLQEIkfWsO+?=
 =?iso-8859-1?Q?JEcc6J6BxcFQcbH4eIoVIr3ix3PsgF0tGEsmSWhKMgjdQq90etvu/57vBH?=
 =?iso-8859-1?Q?ZEO0MZJbrLjy+0Un/RnYsnmEX6sd7D3dEBJE7TUKZByMUXsYRF9R8+4t8/?=
 =?iso-8859-1?Q?djIeWnNbr8uhRImT1jinna4CK8UMr2lvF55b7Kg0UhHBAyVNQHjagyY/Oz?=
 =?iso-8859-1?Q?uPPAFfl4kTObLsuqry2Id7LRqrUr7zcm00ZhcyC4PWFE9Hj1NLbL0USZ29?=
 =?iso-8859-1?Q?94vzBxOG80c84NFoZW1fS5cW0Tf/YPOHFwquadAjZVt5UZoGP7UlS5WmYj?=
 =?iso-8859-1?Q?XSE5NSs4BqGvhHse?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2+92NsG2lYQmSCmiPaFVUJYV7lPX4cx35xSRScvPO4SWE0QUEFuEPZnYFV?=
 =?iso-8859-1?Q?JhC5OM6cWgFr5NFlYF56Xcl/vRiTBBVpXucb9Mh4Eh8hL90mhkjPEG9EIl?=
 =?iso-8859-1?Q?fFhJ/LxIEwJeHvIPDd6Ly9VwDdPRREj57+ENVmnL75Fiy2hu4JBySs4tfQ?=
 =?iso-8859-1?Q?eiHSYqOeP0VowqJ59qhMClhOlDnquyQaTvlvknmkeYD7/9JdXBM6t/1CQ3?=
 =?iso-8859-1?Q?+bf8J8gxrYxesFU+QWR/W9TkDVao+gyLpRivW4BcltyY5e4gtn8r/cGEZk?=
 =?iso-8859-1?Q?IDgu9QNV4tFI4iNheNCshKGeko2tCtLZW7Ola/25TMNqVmu1jwdJMHHA7H?=
 =?iso-8859-1?Q?dNwGtNzs4oXNJ4NEEPVl/X+Fa8OuUgGcnufzshM1Jaj/v5wFvpQig5Jyr7?=
 =?iso-8859-1?Q?SQaktQ42md8NvlIgchBos8MbDNToFhbuSMLWJSsy5PEfkv7JrrKea6ZtIK?=
 =?iso-8859-1?Q?+XmBA7v7OmmV6Gfs2xmMMzKDiYToPHa2EzlmNvOKin6hXyDXqbQqsejzrA?=
 =?iso-8859-1?Q?KWbBTdQQTbD1svGY/MSEYBoBl8wkpiW9mw3Aacq5nLPlI6M+KfAxJLpP5j?=
 =?iso-8859-1?Q?Bg+EvAGhCAlzcGIi1jop58Ed7YMw0FZ7cyh/A8T5e4LTwzFls5eTR6lOHw?=
 =?iso-8859-1?Q?6F5C8RcVpb/Yi37emSCZsPN3khIyDiTzKFqN2AQPcfkIdLUPv+y7cP56By?=
 =?iso-8859-1?Q?Z4UchUxygqE32QVRzKrCqNLYGYZPLUMvvoPyCeBqCi2BJ2vf+9pMluZxcu?=
 =?iso-8859-1?Q?V0CmcjHWHdREUyUTCMFp5VBrqi7oM011kaUQLgLTc+EfhUuDZWRy+iu8OZ?=
 =?iso-8859-1?Q?EaK4bSUZvkJBnRtLlQCwNe/2jpznRtOBKc9qP/v1C0r+Inv5ealFfL36EC?=
 =?iso-8859-1?Q?vcWAo/OmmXFQd9AeOCw+BHsGdi764Ou+McASESTkC2ZHUJYXm3zmfvb9bI?=
 =?iso-8859-1?Q?Gj0zNiv1CgQ/fg39icjFpqr75p4K9XWY/KXogHS5eU6OnG9fFrpyGUrUuc?=
 =?iso-8859-1?Q?1GzrBo4JoF1dGLuXbbhaokZAyxWrNYJcIlUWSwxk8RaLQ4Pcg/7gGF3Ves?=
 =?iso-8859-1?Q?SMOkWzl7svVZSKjnryyiUnFQMDXJfGfupBN62YLOgV/+ZTvZYu2CA3I6vW?=
 =?iso-8859-1?Q?5L9+dhQ9VSSi7nPmPn51t+HfYgWI46eFufhmS6Blr2pHXzP+CHicq6i/Hu?=
 =?iso-8859-1?Q?27vnMG83BDjLjWEc3O4dvdPbWPHqe32cNIPt+Ajz6DbeoAaZeyCKsTn04o?=
 =?iso-8859-1?Q?9+W0xx+rbVpvJUpl+weKIwzDUU6XNMySiln1mq7jaqQGldW/GAA0lx5Eq5?=
 =?iso-8859-1?Q?jjC5rxmcejzAoXz/xxqRx1kUk/YlPV/v72yT17wmzHxmB/a6aslM48LsfO?=
 =?iso-8859-1?Q?BBmIuyj55qcxCLH4cEpzKdEKgyE487uf+ZQFMGMlbl5P9slndQJhe3ImZ0?=
 =?iso-8859-1?Q?DamTFQmXzaeTu4OblpKIK2gCgdjee+Q94/SHT6fLn8gLm8LOyTwDmfmqAK?=
 =?iso-8859-1?Q?GiZLWIHAwVTYUeGaSfPTrCf94sierjmZiQrU731Z7DT/AT1VZynnlsZHln?=
 =?iso-8859-1?Q?Lq1b81z02hHSSZTkUOKHZth8gJIaiGhTY410D6IVr1cX0kyZvly2qOHqut?=
 =?iso-8859-1?Q?o6QnGeWilQjqy4OpGl43zsQ0+jzGow4nTz+MA7w1WWAuwB9RjpiCwjew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b428451-7562-463b-1f42-08dd4ba0024e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 20:01:16.6403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+YNR/HfOQ0xBPPTZmVcSsyJE8mudU/EBRSxXsxsjmzfm6WJK3+LEKhFwkuvG0DJCvS95WhrMFLHOLGQrq44nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6919
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

On Wed, Feb 12, 2025 at 11:35:48AM -0800, Lucas De Marchi wrote:
> xe device probe uses devm cleanup in most places. However there are a
> few cases where this is not possible: when the driver interacts with
> component add/del. In that case, the resource group would be cleanup
> while the entire device resources are in the process of cleanup.  One
> example is the xe_gsc_proxy and display using that to interact with mei
> and audio.
> 
> Add a callback-based remove so the exception doesn't make the probe
> use multiple error handling styles.
> 
> v2: Change internal API to mimic the devm API. This will make it easier
>     to migrate in future when devm can be used.
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 79 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h       |  4 ++
>  drivers/gpu/drm/xe/xe_device_types.h | 17 ++++++
>  drivers/gpu/drm/xe/xe_pci.c          |  4 +-
>  4 files changed, 103 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 36d7ffb3b4d90..69bde506ee87e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -65,6 +65,12 @@
>  
>  #include <generated/xe_wa_oob.h>
>  
> +struct xe_device_remove_action {
> +	struct list_head node;
> +	xe_device_remove_action_t remove;
> +	void *data;
> +};
> +
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -746,6 +752,9 @@ int xe_device_probe(struct xe_device *xe)
>  	u8 last_gt;
>  	u8 id;
>  
> +	xe->probing = true;
> +	INIT_LIST_HEAD(&xe->remove_action_list);
> +
>  	xe_pat_init_early(xe);
>  
>  	err = xe_sriov_init(xe);
> @@ -886,6 +895,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	xe->probing = false;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> @@ -907,6 +918,72 @@ int xe_device_probe(struct xe_device *xe)
>  	return err;
>  }
>  
> +/**
> + * xe_device_call_remove_actions - Call the remove actions
> + * @xe: xe device instance
> + *
> + * This is only to be used by xe_pci and xe_device to call the remove actions
> + * while removing the driver or handling probe failures.
> + */
> +void xe_device_call_remove_actions(struct xe_device *xe)
> +{
> +	struct xe_device_remove_action *ra, *tmp;
> +
> +	list_for_each_entry_safe(ra, tmp, &xe->remove_action_list, node) {
> +		ra->remove(xe, ra->data);
> +		list_del(&ra->node);
> +		kfree(ra);
> +	}
> +
> +	xe->probing = false;
> +}
> +
> +/**
> + * xe_device_add_action_or_reset - Add an action to run on driver removal
> + * @xe: xe device instance
> + * @ra: pointer to the object embedded into the object to cleanup
> + * @remove: function to execute. The @ra is passed as argument
> + *
> + * Example:
> + *
> + * .. code-block:: c
> + *
> + *	static void foo_remove(struct xe_device_remove_action *ra)
> + *	{
> + *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
> + *		...
> + *	}
> + *
> + *	int xe_foo_init(struct xe_foo *foo)
> + *	{
> + *		...
> + *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
> + *		...
> + *		return 0;
> + *	};

I still believe we should add here a note here to highlight this is the
exception and that devm should be preferred. But up to you, the
explanation in the commit message makes more sense now and the patch
is right. I hope we can get some devm solution to handle this component
case. But let's move on:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> + */
> +int xe_device_add_action_or_reset(struct xe_device *xe,
> +				  xe_device_remove_action_t action,
> +				  void *data)
> +{
> +	struct xe_device_remove_action *ra;
> +
> +	drm_WARN_ON(&xe->drm, !xe->probing);
> +
> +	ra = kmalloc(sizeof(*ra), GFP_KERNEL);
> +	if (!ra) {
> +		action(xe, data);
> +		return -ENOMEM;
> +	}
> +
> +	INIT_LIST_HEAD(&ra->node);
> +	ra->remove = action;
> +	ra->data = data;
> +	list_add(&ra->node, &xe->remove_action_list);
> +
> +	return 0;
> +}
> +
>  static void xe_device_remove_display(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
> @@ -932,6 +1009,8 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_remove(gt);
> +
> +	xe_device_call_remove_actions(xe);
>  }
>  
>  void xe_device_shutdown(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e68030..a6fedf1ef3c7b 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -45,6 +45,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
>  int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
> +int xe_device_add_action_or_reset(struct xe_device *xe,
> +				  xe_device_remove_action_t action,
> +				  void *data);
> +void xe_device_call_remove_actions(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  void xe_device_shutdown(struct xe_device *xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 833c29fed3a37..b322d49c83c77 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,7 @@
>  #include "intel_display_device.h"
>  #endif
>  
> +struct xe_device;
>  struct xe_ggtt;
>  struct xe_pat_ops;
>  struct xe_pxp;
> @@ -70,6 +71,8 @@ struct xe_pxp;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> +typedef void (*xe_device_remove_action_t)(struct xe_device *xe, void *data);
> +
>  /**
>   * struct xe_vram_region - memory region structure
>   * This is used to describe a memory region in xe
> @@ -428,6 +431,20 @@ struct xe_device {
>  	/** @tiles: device tiles */
>  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>  
> +	/**
> +	 * @remove_action_list: list of actions to execute on device remove.
> +	 * Use xe_device_add_remove_action() for that. Actions can only be added
> +	 * during probe and are executed during the call from PCI subsystem to
> +	 * remove the driver from the device.
> +	 */
> +	struct list_head remove_action_list;
> +
> +	/**
> +	 * @probing: cover the section in which @remove_action_list can be used
> +	 * to post cleaning actions
> +	 */
> +	bool probing;
> +
>  	/**
>  	 * @mem_access: keep track of memory access in the device, possibly
>  	 * triggering additional actions when they occur.
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6a8e82aff3853..70b697fde5b96 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -905,8 +905,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  
>  	err = xe_device_probe(xe);
> -	if (err)
> +	if (err) {
> +		xe_device_call_remove_actions(xe);
>  		return err;
> +	}
>  
>  	err = xe_pm_init(xe);
>  	if (err)
> -- 
> 2.48.1
> 
