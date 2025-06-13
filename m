Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5E0C71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 23:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811DB10E99E;
	Fri, 13 Jun 2025 23:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVjr9cJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBE910E99E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 23:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749856677; x=1781392677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aKDIpy6JAoqYMxl9supRzn9LiI+VuMDwh+VLH3e6YLQ=;
 b=nVjr9cJCjBzs2sedLOFeoC3Vna/sNKcgvGj1owrCS4MWWHAWoMr8Uvov
 6JP8WK0fBsJFNfre7/38SmOYb3GnYmHDGq850SALodCMnQ03WQB5yRg2+
 VrbH4139Z7rN40Ja4LcsqEOWnaidVx8P2+3KHu37joqMHogebNxwuheOy
 WCtnnzo0EVho6qPZiIipS1FyP2BOeuQCEFyn2jRc92eBOUa+BF0lzm//Z
 mUsIiTGI2LUrsIkIVu5rVLRCF+qp05CODjrIiAP8RHKnxWnooteVz3fEe
 heG4NMVyQlDKUAm6PKk1nsOTABAzojUZvhF6LueS6Lv9XGoQbWq1mssss w==;
X-CSE-ConnectionGUID: U1Xk12SrRJSlCCG4BYzhZQ==
X-CSE-MsgGUID: 9T/9PbkKQAWHTH/QpxcaUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63435392"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="63435392"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 16:17:57 -0700
X-CSE-ConnectionGUID: hrmDAu/cQjiihcoW+vuG6A==
X-CSE-MsgGUID: GAWEFlEtRQWzuDaNs17big==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="148412658"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 16:17:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 16:17:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 16:17:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 16:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTWAAFLa6qi0bxTvn8ik4Ncq+9drIjDHHb61vF4ItLRwYkvG4I4iElRbgiRqlEdCYdyB1YLuWXLoEcPtcLlmshTgoS/2qUuNvszTs78fc0MLKQF0PFUIs4UGLU0gD4POFcsiqEZ3XcOY26aRG19RrX2WrwLgshEUjSqJlmWTrvZH098/ZnumlLq/P9/+lHrx1m1zb0K/OHn1luRGGurW5BUF7k+8iW3xsht/jG33llvvGv/aOgCRRK85DS8CCIkf82Ajo06h4MZC22m98Ebcms/syECiJr0QbUqJ0FG2zEUBXQNMrAfd/TY9AKsPs788bM1hOBfpUOkbg8LewPDlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIDVzetW8jKr63mtoHYFFdQhNpFOp2KmKeQ5Qi8HsjA=;
 b=TgY8KU4pxsoEVfl0oWqFGlLa9NG0pOtAyMHQppJUwltijiYlTYpKVpoh4IDwJ2sTANCxYVuicpADkoHA3Homk8uN3DTsyl1XcUoIMsgq1uWbQZJZCWaHVWgurT751youhwDFmg50IEENBijyVjvPNl+IOAN2fzs595UtsBXzVBth5WZaotD50FkzbSlKAHcHKfRHi1CgJfrJ0xfSVg93w5KI0bpb9rKybqZXu8Z0l7cuiaiUDcJlUHJeDirjrFom4lGDvL8WblfBSVdYUaPAgzh8eLWHP/X+r+zz9e4JFID2KCOd+iDXgxU7F7JX7W+47M1pLWi6hjOwOXbZxXkNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7542.namprd11.prod.outlook.com (2603:10b6:510:28b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 23:17:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 23:17:47 +0000
Date: Fri, 13 Jun 2025 16:17:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Extend WA 14018094691 to BMG
Message-ID: <20250613231744.GY5080@mdroper-desk1.amr.corp.intel.com>
References: <20250613231128.1261815-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613231128.1261815-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 45770c97-0ebf-4566-7b79-08ddaad08248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ppo8pM9emfAE/ats2boHwIWGd1qIkJNDZdM5qIRWXL/GGYQcaceGOSfx9TMp?=
 =?us-ascii?Q?7AFYUZTWQp3nbUI4pH0igHFJ3M6sYkC0pspTTjTECroByRG0pLSfEXOgTC8o?=
 =?us-ascii?Q?MTfstVBEjkV1V9jpInXcRyTnz5yLBmCiY7uq13d95rl1hfyUfxUD7Hr7HcbH?=
 =?us-ascii?Q?EEanCDLfpcAa43huTGpEBZFWgpb4NLIRvu76WiDRM4tuScV7tZRr+KNZzbbV?=
 =?us-ascii?Q?K6GKNihsDYpti++lIR3DY/BZgH1NNbPO0ymL5/bhXpc8UAZ7estfoIiKFMKA?=
 =?us-ascii?Q?3NoF2R/6/cOCV7TVY5gUJs46cLeD4XjlYd2PcZoxCHrTLCS/FheddxZRl9/H?=
 =?us-ascii?Q?jEr7tPpWCp+h1GXkzQtIqkFVE4dSOIDMn+i6k1RRmo27E96CspuT0j66/d+t?=
 =?us-ascii?Q?jqYt2By//noAC9xEw9Rf+OwRiTEmdKiP30FLzMOElQHCpRZn1lYWMY5vkIjd?=
 =?us-ascii?Q?IM5yB84BoxkODlYQCVnGGHm4p/kx+06zIdTMWrxHSreGwdwrfV70/tlrTmRP?=
 =?us-ascii?Q?PT4xilWcF17T4PRWeWHc5j+Upra1cVQGhKsb/Xoh0GZt2iz4zYRIOmK5/7Hd?=
 =?us-ascii?Q?z/j0e68uYtMFF3h+Um9bpcjIMKODFjb40e4ua4PhGg9NwsoGuQ1KHUZp5dYW?=
 =?us-ascii?Q?vBEEUMtqJ8hNLCo27pb3/7lTKPOtRf2PNlU1E34N92JxCtWJdyKkSQnBPGeO?=
 =?us-ascii?Q?YvakZbRRO8UISOyJFAsqQocFGKtmmxKyrWzqNVtfwMvoyy2kJgMkQ9JYB7pr?=
 =?us-ascii?Q?pXbGYdFVmIyjPPYfb880cCnUlHFPE4//WMbuFqshae7KqNfV611vi10bTD9m?=
 =?us-ascii?Q?Rel0qv424waHU/yxd6rI6GCl8n6Qvh3d7p6GmI7/ORaKvWwJ79zDXCMQdlGa?=
 =?us-ascii?Q?oq754xziz2iBZ59jjpANJk7x5UA2JenMtsE2Ow8xaO+Ik4Q8TUpkYJEtgVoW?=
 =?us-ascii?Q?/dc6ip/DaFTDDSXp8Gz4aWUpz+auBzk/pYbRvJRgNmBZ1lMlEEgJGEQu8ngA?=
 =?us-ascii?Q?LI8ykHdtqul/8yP3SgZ/qfb3LCkTDz9sCLWiwL+ftwYVZnslccXCURMsuyv8?=
 =?us-ascii?Q?82DTRMKHTP66BgHPf/bufXu1DlwigZSKiivLaujNZ5gh2/cqnZSXTG7YcPn4?=
 =?us-ascii?Q?m/PFgSoKPH4FFTl+ZPc0DrNpMLDTCnug+UqlrrkQwhh++bbcD0NRN2t9Af0J?=
 =?us-ascii?Q?+HFzvFvcmHvOmMuOmLVGxhSIyx69mSB9k7G1QKcrRAoDywsmThxAJOm1TNU4?=
 =?us-ascii?Q?8ENHffnyn88c+00aT+0BfALzsFHx0Z7ULcuUug0aWYXkjsFpA4rjRw+z9vkp?=
 =?us-ascii?Q?7wbREpCLt0uZKeApYzjrcqxWoGX9ceNz7rPORY54Vew/U9LsGvmgmF9ziI4o?=
 =?us-ascii?Q?g49/MeT4gQf0rmuD0s/OEk/xzWjgEOz+XjWwuy7X+SXpynH9Gw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IunLfgEK8Raos9d2EDrA/qNP8t8KdTVvqUiHCQ/kLWmRvwdakPtYMVazV1Zi?=
 =?us-ascii?Q?IvJV9uz/HU6LSq0nerS7mZe/hhjKV5AuH4QO8jco7oazNjFYt8R+xbG3KVPt?=
 =?us-ascii?Q?075x6ob6fmYyjG/o17PyV88T/SpaQNiJuh4+TzZCwMIToakArcBt6uAFrhwi?=
 =?us-ascii?Q?bKbxD3RGQTaA6NVvAVHglPQrQ0QIotYi//FDqjpJtKgWrc48ONtpkzWYwiLl?=
 =?us-ascii?Q?Iq+f5m/MWyf3rit+YMJgw+heKxuG8HcQIvdzipddl6BlOA7f0KArDiF7QRSa?=
 =?us-ascii?Q?kXWXktfHpfoBiDpWO/97QGDicentS3z3T5furlcw38kHBvpRF8BZA3R4oDF+?=
 =?us-ascii?Q?ZUpN2VcPVwYoVb/ZHRPSTbUpq61Kn8ePwNI49YBZGX6yYD0OR7f6a1IqRICo?=
 =?us-ascii?Q?MGzF3NvdnCNv7jBzw3koE/CqMHTKpdp4qwyGHERxKMudQGa2ztWuqdgYSj2L?=
 =?us-ascii?Q?x7bl+hey71WG7muQOJwuZun1K997b3+DcPUO71gjX6kJpTZPsQhjF80BlKIE?=
 =?us-ascii?Q?iN3iZNjgaV3WzNM8mOLWoh3Fu8H1o/4QptnikYn3Dl4q5hQ9mJ6kg2tqMuSe?=
 =?us-ascii?Q?T9GDJ4QB2lxp3gwfDw5Ms5UuTVl/IxGLJJyhLHwXYBClm3j0RzgFMgfdCUtX?=
 =?us-ascii?Q?WvS3MDKV7B4xeMQm8PLN7Tm/x2NOo54kzbsBG2rN5gUiTH4ReSx52HsLkbrN?=
 =?us-ascii?Q?3jVNAZyt9WsuWmSFu+4NWnwE6Pd+f/EytLHsNuYBw/i/6AqThIzK98swIKpc?=
 =?us-ascii?Q?1mpp7IeH0rM5ObJ1mpSMU+blhVlDVgk34fa3dZEENcYAPZ4PlYnzfbqWKvnF?=
 =?us-ascii?Q?yF7YLI4+wCnT9jx7ERm1Fk0QglalFVC8BYZbXnon9nBYg8UKAvbwYD07hQ2N?=
 =?us-ascii?Q?JKvfEWlmP3iHh9j7sQtzkFWUbZw+VgXTODevVyh5b/uhVIAluIDWefoE528c?=
 =?us-ascii?Q?kCZhajhfqlDDcmOxPcKmUxs1OTLUu7EgxVdBEYqVUPeehPpAM3B6uBnh9tbm?=
 =?us-ascii?Q?G+/s19zmuCyNo73QBDlqlrWDWTsTkae6BtK7UPbcbWkrvUdFtIFYs7wcF5dO?=
 =?us-ascii?Q?vs0Pn6hK6e+yVk5PFCMQfEb7rB+84xldg0Fx9T0JtnDxjn/l1hMMtv56g2RY?=
 =?us-ascii?Q?MPG6Y85Sossgx/9lAVYyjSR6IKjPh38JGqweWKkgfHtC5dDad4cF62XaIKly?=
 =?us-ascii?Q?PGjWzajItgp0Vi9cTZQjWE9xef6+QWfIsNAp0hXevs8ch50VPzpIbLZ0Xk1r?=
 =?us-ascii?Q?hNWXDLHIKZz1VgZZC9URNXC8POdN6QcdA8kXldhfF+ya5f/hoch4UfC6wvgg?=
 =?us-ascii?Q?mpXb/OajarZtsSEIj2ECe2BAB8tzV4TuPHdFDiheMUZ6KL1Nkse7fyEFFRXe?=
 =?us-ascii?Q?PBmOo+HzXfuw4yA7Mwp/lT7B/oum1HmI/LkXpYRBAqnPC+gQT6p6wG7QULTX?=
 =?us-ascii?Q?A3ZC4hZ+sCnFzUJCmV1hR3/gE9gqN4mjZEKntvD09pYDHSuXiGdUr5INN6JR?=
 =?us-ascii?Q?UiByw+Z/bFx7cZhVSM2QSSy8j3IuC1TadZkzodWC9IYAvCHO5garWIf9Cw/c?=
 =?us-ascii?Q?lngMBQbNKKVK52oLDtoDZufmCRaU/NsCTniSFUqczArUp0IXNT+J1Od4WrvA?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45770c97-0ebf-4566-7b79-08ddaad08248
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 23:17:47.3502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwdcvFvRPU71agKMZjLjszmtelxLA6kgz4TVIXx1yntijuVNgBkfiQQibXg+mYYD4o9vsvDThjOiWjsMSzdMUaBfScQpX3eKVJZ7A3/K0fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7542
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

On Fri, Jun 13, 2025 at 04:11:29PM -0700, Daniele Ceraolo Spurio wrote:
> This WA is applicable to BMG as well.
> 
> Note that this is a GSC WA and we don't load the GSC on BMG, so
> extending the WA to BMG won't do anything right now. However, it helps
> future-proof the driver so that if we ever turn the GSC on we won't have
> to remember to extend this WA.
> 
> v2: don't use VERSION_RANGE from 2001 to 2004 (Matt)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 425cb401c276..63b3fa7fbc6f 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -21,7 +21,8 @@
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  		MEDIA_VERSION(1300)
>  		PLATFORM(DG2)
> -14018094691	GRAPHICS_VERSION(2004)
> +14018094691	GRAPHICS_VERSION_RANGE(2001, 2002)
> +		GRAPHICS_VERSION(2004)
>  14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>  18024947630	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
