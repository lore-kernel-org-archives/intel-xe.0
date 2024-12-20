Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC219E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 14:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B8510E396;
	Fri, 20 Dec 2024 14:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnZ1TH/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986A710E396
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734706512; x=1766242512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7lhsgzCGtCX+qeDCaI+Avz+nLJNDWnNqEA4nmB+B4aI=;
 b=EnZ1TH/nKijx1wYMM0IofuWKUpPxVrdhtTLpDBHM0h7arIXqK1BRnycj
 wjrS8QKLhidqpUsZjCC3Q3sjboXsrJcuYmBx8lnhEUVc6qnNOhKhC47FQ
 U20ewt6LwNuwasHoMIc7nCSu1TIm2lgN+DVSpHBGB2qa1MT6K+yTPbkCx
 Yfhb1DsVJ37z+GSMFfVYTmFeQPYXtCrdg+rOJ39LSJ0PhWim62FtZWjEn
 fbdrfhY/HBTdvoUjmCUoRrXfR41x/R743ahTvM5CoW7jG90/fa0R8X+j5
 LX+4PHtc+AyWjtrSoPg9fucRgr2UgSqe2bUsY0KVU3HSEZp3uzQ7LTNsp A==;
X-CSE-ConnectionGUID: z2GBMl0fR+Wedr01Oe68IA==
X-CSE-MsgGUID: nPU8CEuxTFaRV3SwcdFrow==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35474407"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35474407"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 06:55:11 -0800
X-CSE-ConnectionGUID: JA0jr2DSQFOAtZWFF7f/4A==
X-CSE-MsgGUID: 96gM91StQ8Sw50r+opJMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98364865"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 06:55:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 06:55:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 06:55:10 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 06:55:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYBn6lZmYRKmR06vwSi6cRHIhBb6dSqPm9VBkVJ6xox6+8GSHbNWC2UV28cDN6hjOJJcx63u0xV4vYAPYH4w5g/4pv9HqWRtRkBAhB3MUClo+er3MzgatB0d7TswdD46Y24Skr49QLhTJmtdPBM5XQXnbXjZsFobE+rUK6ibmyDVG7DcYOLt5wRTSSUp6z3Bq/KndOy2HEIkFc4rcOWb6FEwnulkq06SlcdR7CnVwJR+Tf+bfr2Va5InGbsMxX9Ir+yv71Z9/nA38JyB0y/gZ8gBbmGtzqJEwV36hr5iXXEtw3EE0TsT2iEzpSToXIIB/xqErV/RnCIjkknJbShAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aows22lKG3AwGi0H+sCZLYiPYxlrAsp/vjDfesOqeKg=;
 b=mav9jY3upwhK4UcIxjqDqR2TIaJYjsGEgCD/PavKZN7CxIhaiQKPPyMLP7xZ1zdWUI9S9tRUrsthHMDdl9a94xl5rxT1vJ75GJdl/9UajckNHHrTUumG1ygAzbDpyHIW7VJlG9rU5HIuX3+c7uMHQ66ZCeKyXLIIinuqcJyZei4GlzbDZddL2Eyj0ppaJjT+cXMem5VL1U25Vk6VQz1lEW+lM9xd4ffUn3O913MvfxUyhUsMqeTLK4Bv6NXUAEex2yCrL6HiZcjOlQGK8Y7SZXpkwPmgEI1DBM1gBrE2WkVLMPtF5UwOlzj9sbSgh7Jz5bDD7kbi9cjlLGOqPEKKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 20 Dec
 2024 14:55:07 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 14:55:07 +0000
Date: Fri, 20 Dec 2024 09:55:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pm: Also avoid missing outer rpm warning on
 system suspend
Message-ID: <Z2WFSGR0ejBA4yTp@intel.com>
References: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
 <Z2LdJSyhpJoSNQ-Q@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z2LdJSyhpJoSNQ-Q@ideak-desk.fi.intel.com>
X-ClientProxiedBy: MW2PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:907:1::39) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d546621-7243-4d2d-d208-08dd21064b27
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sXxZNTZ9u08ROgUZB1QKkou69l8vGXbP3qqSEj86cn/3J3M4PKSl2+A2XM+N?=
 =?us-ascii?Q?yp+g4GrPRqx8U1kPoFeyaCxjN0f+Or1mlL/KNrs9sp/IDAQ9GeigIueSiDhd?=
 =?us-ascii?Q?gDQFfY7PtmjwDu8p5ALb+bRTIhnG6yB8qFhppHT4m4jbpU5yILcWwxkufyxo?=
 =?us-ascii?Q?QCFdr8NfE2CDpDgPFok+U6mJ3cdM3m7xGcWfdz/d36mqSUJxUqM98vujKwYz?=
 =?us-ascii?Q?s8+e8d+MvYw/voDNmdImLvRbFqE8YgotG/i/X3dMrUKU7clcf32mXcg+b4sB?=
 =?us-ascii?Q?5M/co1QuLW1wm7i2hN9rIzg8KL5LW/KKq5/uobrcWKTxM7U3QPouNjYwlk+j?=
 =?us-ascii?Q?H0eRnsAa8TzZnJxDT8qe/VfJsSTDrlXGSBfIhDuH8w7OW8qHKt6Ip59LCUm1?=
 =?us-ascii?Q?cTAF6TVLjpUAw06KbQaAEL5gFg6n/ezMvsQ0ktQPK0VcxcVlm3kM5F7RoEar?=
 =?us-ascii?Q?y9URR3YeEz31ah6i4+heSTNXcUTd/NUpf9vozJ8oES/Svxr33Ng3BUEjjnrA?=
 =?us-ascii?Q?VgRNh2ImVskqCS/GxBSVjUFy/LYsUzAjWQ6tVJfAZOe1/zoleXDvV6PmY1Yr?=
 =?us-ascii?Q?gHDGqfOOcvJIAKY0rB2muv8FkQ32/jj2GqnTD+X8oaY+mlZ4RMim23Ls91s1?=
 =?us-ascii?Q?zDwBxZI9VNiODUIwyc8tP4MStnEAKRrCjA/vYgBloERw82NubMgShZHCRVwl?=
 =?us-ascii?Q?L6kltl2DJaxznnYrVUEFFeuyW70FYf14aDoxoHs8HEzr7fjz08i9Np+rSvdv?=
 =?us-ascii?Q?W5PNbo4DeDFMi0HUCyMc+rXCdIHgc0TXlEE1HaVAtjpp1xvTVPwGZtH16S2Y?=
 =?us-ascii?Q?OgKSA3khWPFhOAgnq+SbXLUDXb6UUnpUt4y6441L34ntU+lNIB/psmsKxfZz?=
 =?us-ascii?Q?TrfjvkB8LsxhRz5PwqIDHobNOetN1UwhPEZFI+ZNdsUfNeLYrceTr/dWIxOl?=
 =?us-ascii?Q?Ichai7HX+n9iPG7N3AO2ye/48KAmdm22qLAls9J5SQ6EPkpk+hx+geGYXhgg?=
 =?us-ascii?Q?K5336KZZTJ5lgbBc+4hS977QhkB/P2gqU2sPMxXg84nWnMQwMVjiKJxaMXC0?=
 =?us-ascii?Q?ts6tvMWBxktPCJgy0g8wmOnYd0E069h6Sy781IQ4b3vNQ3QVtS5zPpm1Jjm/?=
 =?us-ascii?Q?iD0Vut1u3icAF9eLVw0LzZQJ7oezce394r1RIeojoqGn73leET2WOvNdHa4J?=
 =?us-ascii?Q?Eiudb7Ai1JeacWAYPqddqWbgDDlxousrSKqkBQZQiCyPlMydxZG+lfddL5Hb?=
 =?us-ascii?Q?Yp86j8shCJRQUb8BueDsw8+sZiQognswClVyQqX7G2qzpgAf+S2TJLzMndUu?=
 =?us-ascii?Q?Y4nyDoQd6L6nnC8JglNS8UWd6Hl50CkQdq2HfELThF4b3ibaBveeMkwFtr7s?=
 =?us-ascii?Q?l8d9rzMkrleWtrWr7jV4FiMNQQUN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?geJUH9U0b3Ppj13WrjILcnZS34Hud7TfhBE4+QAvqhBC2CfmmciWMkQjVmhj?=
 =?us-ascii?Q?IdnxqtQy4OXHiTEuINO7LTn7lOPXUq8+cNpqEsx0vYD+bgacdwC/7FeLIa8L?=
 =?us-ascii?Q?Ao0CM/ws+YnHXj6NcGwAl7hR8bdOtQCOQl/ieKr9MrYS5kyCfUM9fW3F6V0J?=
 =?us-ascii?Q?hcJZGkyaiC6azkGEN9joZbXg9Qn1dmDrWk/pqk8A2mdGo2ZkNw8edSlncQxG?=
 =?us-ascii?Q?vsbC07W6mOS1XDPbANXBd5oUK01mFS6L96xfcfc2n7IjcnRkCaNGQB6zxX95?=
 =?us-ascii?Q?wd5R8l7v5y1sHbEXBgwH+czJZyg/fOMC0i/Nst0wScJCSyZ4FoYvQvZDOJ/A?=
 =?us-ascii?Q?crQRYlBaqKvNku/3dQf9ug4ftzsA8T/DNR6RgKP8eYPfKGDp8p46Q87zHOho?=
 =?us-ascii?Q?JYolROw4aezlPhx5XX/Mesph+4SjCkeLsjG5TbGLofm3PlxkbFLL4ZnEzZMD?=
 =?us-ascii?Q?kMVtKfmH9O/ynsTxbdZlIzaeh4rnu8VZiY3QAQzhMQzAHkdNBUmzSTovYgvM?=
 =?us-ascii?Q?9IlpUkri010l3L5jVH3NOzu2yWb22N9IcHm0VMgbO4Q3iBdW/oNCAiiMtWmK?=
 =?us-ascii?Q?4TRp41o28UjFZX2L5cPAnIyrvxT+r9snTYEM1TffHUFTLtFXcNfGi8crMJuf?=
 =?us-ascii?Q?bvr/Qfw0LHue876SrQvsTnLQJduT5gQ01RmXH5qUJr678trmYLAU58YnbtnO?=
 =?us-ascii?Q?RV+p+KR+EIOSwMwTa8vbyL2yL3X+stq46PXCQIw9dRBzv0JDQFavBHGpZk+d?=
 =?us-ascii?Q?hc9aHDmWaRoCuUfJ0SyUFySy0QguF854Tl25iLqnN9/p0B7N3TTosjxvER9n?=
 =?us-ascii?Q?cBmxlBuJOMs6jId4+CmHBfzKVkaRW8XfweIw/j3A6psvl2yoMuZ9mg/IfgjA?=
 =?us-ascii?Q?RkfakjdfbZ5VQO2wfdMMbnvSz6R9teyHlsWi+Vdr5GCoCumXDYx/joMPBShR?=
 =?us-ascii?Q?dF5qAGhRoOegnvGUDWjhHC26LMcvle3W7oCAMg4+b1qlatGS6NpPiNhvVNuw?=
 =?us-ascii?Q?BHFBa3evRtRwM0Jl+bIjE7A7Qe/UXPPxfVxdOSUEkdfPEAwGchw1y7Q1Iz8u?=
 =?us-ascii?Q?hVINCmeRE/qcCW0wzR36X+/0K+tsQCUdVpBIMfT/Nsq6zumHSMq2wOL0PU51?=
 =?us-ascii?Q?4AiEtNOIUR7249m3c+roWK5WAGz53osnSXWJhGCZIPQtRv0P9dS2Kc5Tr5DU?=
 =?us-ascii?Q?synYbp0VIcWU8SgXVcavB3c7HyluoLze4r3A/uqmBvKC4nf8OlhFuGJSHJAr?=
 =?us-ascii?Q?nw48niCaMEa2QVWBMzU+o5yYhc1AjWZ6RjecjQ/YZ3q3HEb4lZ274Yd1Nr7L?=
 =?us-ascii?Q?VkP/cTxg4vx1dGWi+Eacxa4Y3QtcZb5qwaJs4Og30BUWn0WY88NApPnbsb8h?=
 =?us-ascii?Q?XfY++32FmHmC0lnp8y5vsXehyYICLoeFGN6FOhXlK1Xv/DWhQhDE34irDJjj?=
 =?us-ascii?Q?bGfO6YC+Skr7H59J7v9JPLNNkylatrxWwzAPhXpSVcv4Cs2xdg/MHzEiFbLV?=
 =?us-ascii?Q?MXfJUOZe5b8Sdlxk4yGLwf5XomQuWt51TmHJ5Q+vP/iUdfG+QPiEq1J79WXJ?=
 =?us-ascii?Q?BZRtGMCvR92lQxXCuz4E6LUDhsSvI9nS9DmmCUkiPxZwrtuHO0VE0bk1SXF+?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d546621-7243-4d2d-d208-08dd21064b27
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 14:55:07.3221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b8gAUtCP6WYlOb27qfw0yigG5m4blZj2K5/Aq02MaiQdogHUOSCoekuWmtAx3ZNNvzpgmJ80yjtcmw2EM+d9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
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

On Wed, Dec 18, 2024 at 04:33:09PM +0200, Imre Deak wrote:
> On Tue, Dec 17, 2024 at 06:05:47PM -0500, Rodrigo Vivi wrote:
> > We have some cases where display is releasing power domains at
> > release_async_put_domains() where intel_runtime_pm_get_noresume()
> > is called, but no outer protection. In Xe this will trigger our
> > traditional warning.
> 
> I suppose by outer protection you mean an RPM reference that is
> guaranteed to be held at the point (that is right before)
> release_async_put_domains() calls intel_runtime_pm_get_noresume(). This
> is guaranteed, i.e. such an RPM reference is held by definition (by the
> power domain reference that is being put).

not actually.
The outer rpm reference needs to be a reference on the outer bounds
that ensures the device is awake. _noresume calls should only be used
in inner places where you know there's something already ensuring
that the device is awake but you don't want to take the risk of that
reference being lost while you are in the middle of your sequence,
so you call the 'noresume' as an extra thing to ensure that you can
go to the end without device getting suspended because the other
reference got dropped.

> 
> Instead, the actual reason for triggering the warn - IIUC - is that
> intel_runtime_pm_get_if_in_use() called from
> xe_pm_runtime_get_noresume() (probably for the exact reason to check if
> an outer RPM is held) fails if it is called while system suspending /
> resuming. This is the same scenario as when
> intel_runtime_pm_get_if_in_use() would fail if called during runtime
> suspending / resuming and - worked around earlier I assume - by
> suppressing the warning in this case using xe_pm_suspending_or_resuming().

The get_if_in_use is only the choice inside our _noresume so we can
properly check if the device was really awake and warn that we have
an unprotected case that we need to handle properly. If we were sure
to have all the outer protections in place already, we could safely
just use the _noresume option from the rpm directly.

> 
> So in this fix the above workaround to suppress the warning is just
> extended to the system suspend/resume case.
> 
> > However, this case should be safe because it is triggered from the
> > system suspend path, where we certainly won't be transitioning to rpm
> > suspend.
> > 
> > This wouldn't happen if the display pm sequences, including
> > all irq flow was in sync between i915 and xe. So, while we
> > don't get there, let's not raise warnings when we are in this
> > system suspend path.
> 
> I think the issue fixed in this patch is just a consequence of how the
> outer RPM check works using xe_pm_suspending_or_resuming() and wouldn't
> change even after the IRQ related issues are fixed.

If there's other cases where this release_async_put_domains is called
out of the suspend path, this warning here is showing that we do
need an extra runtime_pm_get right at the beginning of the workqueue.
And this patch here would only be masking this warning in this case
here, while leaving the release_async_put_domains unprotected.

> 
> > Suggested-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> With the above understanding:
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index a6761cb769b2..c6e57af0144c 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include <linux/fault-inject.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/suspend.h>
> >  
> >  #include <drm/drm_managed.h>
> >  #include <drm/ttm/ttm_placement.h>
> > @@ -607,7 +608,8 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
> >  	struct device *dev = xe->drm.dev;
> >  
> >  	return dev->power.runtime_status == RPM_SUSPENDING ||
> > -		dev->power.runtime_status == RPM_RESUMING;
> > +		dev->power.runtime_status == RPM_RESUMING ||
> > +		pm_suspend_target_state != PM_SUSPEND_ON;
> >  #else
> >  	return false;
> >  #endif
> > -- 
> > 2.47.1
> > 
