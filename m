Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37972CF9C7A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 18:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1F010E7C8;
	Thu, 20 Nov 2025 18:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Do6w7h/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6E210E7C8
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763663793; x=1795199793;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zr7fCl/ryXxXaax7tuZTdv2sMzrns+qbOWXhM0XF5hc=;
 b=Do6w7h/6Bam//LI9+dnk8WBQ1XYfCAwNUuXPmDQVeSPPVSPyeoqkx7Q5
 HXcYE1S08JAUzCy933c5pU1PMcEfwNkgRlWKecQH9ITPWDVUmt/pgDAvz
 RRWvrUbozhCWHjYEiTZph7tmY4p4/LmwNqzc2CqqH8eZTm8xA+p020bCL
 8U751+GeUESSSmEnb3x3ajpB7kS+ddaZsAqtQz5bY3KrhjEPlzIvyCe3i
 SaTIrDjaLsEVsV5H7fcJeGZBONrdez9edS0yWnFIuvv/m0kqP5Hp9wDUC
 CwcxxLFMFOlHj0KG6Nuvd0bssR6/2su/alOCLrxaE9Q/LTX0zaKwrRHiQ w==;
X-CSE-ConnectionGUID: nqAAFij8Smindfi/lV9tyg==
X-CSE-MsgGUID: 8bqUQQDkSPiOI4HXPl0cLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65784601"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65784601"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 10:36:33 -0800
X-CSE-ConnectionGUID: V9hxtlWsQci30x+EwlM1Ww==
X-CSE-MsgGUID: 6F0bh9IlSd6OU5nD3alO6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191556188"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 10:36:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 10:36:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 10:36:26 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 10:36:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxAf1pL9YwuVw/s6/Qyasa3XMblL58qd6LEPGO08eZXuWTbkt6l3EbRRp5/Oan/kegM4dDahcj1mIQ+9APRLk+QcsbpHyz+0VfCch/6UrYzFv0qFTxay788wGywsImUuioc9FmB4UYt7HUdUnnNaA+5hy8TzUkxZvrC50iiDLY2vsqvCzUIzM7O/ro9F4aZOHd034Gr1KqYbkb2sT6G+NmpexFr9PlJO+Sa5P7sMPrxNTqP9bH2J8JLLdnR/4QU+3SB7JpXGu/AMPter8ZZKHz8yzqxXzxoj7tcEA6zFujI2kK4tfXZuHPW4XDWMC8mtKETxhBo/8bT/6axNxGvmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VO9mm2ZnZ6rPuHuEJodXW2J+bwfVZme7WXD7eTeAqDk=;
 b=W5Q7OYGwfo9N4Il+Es4woeHD2yHrvrW4w5GC53+NK1Ruud17OfPHAZ1W+4JYGz/i35wuu5Jj9DvDYrRW1OJf/+aOaPXI85XQ6R+tCoEnIBBFdkxToVznrZgeKEzO1z2VLGzucJd5/S0mJ0uE7d6zbz1Pb77DU5Gc5JTZwAEbEjx/EBHZH5TB/U11BdvbwdxiojblLm1htPjj3wOcu856QUIVSfYXzML5LiU5SxoVghN7gTO2540X0Toxf0jFmlEE6KWlmw6l4xjex9kZszwDg16M0rV6r22PpR76PGDMWlkArhaBrgbkXM+DpgcQNRd32oR70G/qGrACvLHLqJ2oRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 18:36:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 18:36:02 +0000
Date: Thu, 20 Nov 2025 10:35:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Track pre-production workaround support
Message-ID: <20251120183559.GC3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251119220459.3997343-3-matthew.d.roper@intel.com>
 <3zguwnf7qbdsiy6n7vvndbbvtidvmp3q2nzxdz6xi5bkifgtgv@rzmfr7eo3a4n>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3zguwnf7qbdsiy6n7vvndbbvtidvmp3q2nzxdz6xi5bkifgtgv@rzmfr7eo3a4n>
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 007c5f56-560e-4bb3-c480-08de2863a813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DtoSAvbhs6ia9lD03mjgRJQNHC+2N7uURNY1pwMUDKMPbaUbwo08/D+xgRUw?=
 =?us-ascii?Q?VkNhfiliRKN8q6GQLeh6+TxdrEDP0IxjQ1DX7akM8FdGmlWpeDrScb6WqyuD?=
 =?us-ascii?Q?QOpfa2RpYAYkOgtl9jsNvRVOMu6KRistygCT5/MNvfr70ZzKfI/ap5NVf7r2?=
 =?us-ascii?Q?oUG1xluV2yKSuKAzo/iLjumkBcvULYUU2YMVT6G2p20z/EOF0YKmylosF2vk?=
 =?us-ascii?Q?DfkURcqkOFNUucoIlriR+m/qo1FXM39SzbtbpiscVfzgw931E1DJezbJ1UAm?=
 =?us-ascii?Q?ZH4bka9CRNrNwlE8UOblc3cDc9sXpV3cBs15J8SyesQJeX2FgD8zECE9y424?=
 =?us-ascii?Q?Q9EfKTaRW28LC84G6yhpCnYOTfQpoW6Nrlf3nrmfg8FQtZJkdBzl5zkDDErV?=
 =?us-ascii?Q?lhQc3ik1Ro1ykHLE+Ae9I8WVk5n+glHosy2kZro8krELmTNtceItg/eZ9iht?=
 =?us-ascii?Q?nUkxxOM6+8DQFAFW6in1a2QbRyjAoCXiD4W/kvElmgQZ8jmI7jpLYThisr7o?=
 =?us-ascii?Q?86MoliMfpqOOHz2zyR9wneZAMKfyGYdRYbmqwVrAC7GJBtC07AjkI0vSPbUm?=
 =?us-ascii?Q?Fa3umzFV7Rl56Shb6/Qmz/8jJfE45N1GBgRyiI/NIPdmQUOjs6HYa/19ufBd?=
 =?us-ascii?Q?H86gpbX2eHrt3uN2wG0eG2Ppvkbqz2bCSZ+OCXYglAs4VKekIYVvOdNAxFZG?=
 =?us-ascii?Q?rY+TsHfU89r0j5ct7kPEDRNwzR6S+0V3yTZTBSR+nobS2+V5KVYi8jsJwXPK?=
 =?us-ascii?Q?dwokgPNtFldILw7Nmm/F1DR8PXsWmWF3mzo/RtU6XoSZkmZfVjIeeOr9/W5x?=
 =?us-ascii?Q?An6dkI0sjvvNJOekodB6v/AuX6PZw+2mhYt6xg09ZkgQCN4Dvz+ZXLxoy5qu?=
 =?us-ascii?Q?LxRXj09jyhtBAvfvF0rc3WZ6LaV9/swpnR8sb6TFdgvxOwq/edBHCfyxL1Zx?=
 =?us-ascii?Q?XvEJL+eS5hzj/JuUy/STaQAWxTEz/XalHG77Dqd4U5obAryGYEL12EVFyNEj?=
 =?us-ascii?Q?LeMfFYbs36U+W4/btvL5pIbn5taBT7d4/OtSMF6cm3YzErC+2POqSGg77xMW?=
 =?us-ascii?Q?xntCwmshu3TAhVQt6gsLX92NpRB3DVcA3y/J/SOLa4iGemADt2M8SKYEG2MM?=
 =?us-ascii?Q?UcbiDDZxCNnqGyPKsgN9MKzFBOvk+6RL3DYagDYW2E/q/nAHrd1tqh0q28UV?=
 =?us-ascii?Q?M8nlD7lVLpNhq2Jt5Uo8rt3rqbSIsi4/4h2ApxDXK9v8GXWWMywTExlnTYbc?=
 =?us-ascii?Q?9CPAW4lf5UTL16U5qf3IWw6sDl9EjKKo9oHnY1d6RSeYxqKDja5ZlOQZFeKY?=
 =?us-ascii?Q?aggszUP2Ft/pnxqyXwOgRb+Ju7dpyteaXTO2FpEOaxTBUE/gS6RSkDLpYNH8?=
 =?us-ascii?Q?Gj9epStlQgWO4QVbjRHMytSKs+uV471e4nwHIqhrkAZqabk12u4UgKVJGzw2?=
 =?us-ascii?Q?mFXWYtoYfvQ6Qqc7MRNL50s6n8SeWxwf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?toDW32v1041bEprdltEucHELtEsJXVhIP/LYD+xWAdwotsJgfvr4bvP7lvD8?=
 =?us-ascii?Q?GklMHB/2EMWKtVUcKAc29D3ihfb0r2Ayvxi2kKWc4ufTPb7jP8phWM93yHy8?=
 =?us-ascii?Q?60QxEG5Jjc+R815iR6GTRZqKM0BeFT8GeRXP3E1RYcRsmc7tTp7bLei6vKwh?=
 =?us-ascii?Q?qzOOnIdL+pl8/Kmxh3PLZD9URmMmdlnp5RBUTE81Z72EgqBCOH8QwLcbTDzp?=
 =?us-ascii?Q?e+xsJjuveitSSrJmuEPmxs0YpLJCOF4Od2EA04E4aDdtcMXjFtyXTrmHUpIR?=
 =?us-ascii?Q?znKrEVVTMe+bfrHGeMK13gpCfWR+Uw5eaIHq+q3vZj8cW+2+kKFxJtWRm3dR?=
 =?us-ascii?Q?Yj1bBrUDvbmnWmhEWQVI5YNkAK29YZAnLB4c45FD5FkHyx0APNB6uyXbAfPi?=
 =?us-ascii?Q?2EgMX/v6UeAKKr1ER1fde5DYg19LgG84c27H0N4tKNM+WCSj+x9vwGlaZ8QA?=
 =?us-ascii?Q?chiPdavHIn0k+HzxG2Ya7d7XUMI6GG91trSs5Ir8Q2rlHuX8/Pyf9AU4oEUF?=
 =?us-ascii?Q?ZTOjMfXd+DDhpg0leyAsJPjByptpETVWlRRRRLCXim8euZwGdZi0ItrHwt3t?=
 =?us-ascii?Q?8dPvlm4wVtrzFGx2vdknys/gU9X2Rm1LyJ31QN0wceD2hVV1Rg1PDU5wpbwE?=
 =?us-ascii?Q?mzub2QJ1LRZBMLu3G4bjPwIKcoARuhazvj9Yrv3X6cvk6JpyPbuTzGCWfAPi?=
 =?us-ascii?Q?Q9rfYaHtS1He9+sxkLhvl196RUvr4pE7KN9boCd3DYl6x+6tH3eue9EIUsvC?=
 =?us-ascii?Q?QwLX48wrhP6eJspZ5lJ5sd0RJeoxi+zn4e35qrQyYqEk1zaKbvd92G5zhUbU?=
 =?us-ascii?Q?tIrG3Lj37Zo8Nn5SzUj40g7gRT4bi5BT/NGk0nuVU0ilSOonYdUK6bVnhipy?=
 =?us-ascii?Q?4r8GEhsEKCBKVQUwYmcBgm0e7k04EymIEOwtC5iFugjGdPr0K5E5/A5l7S0N?=
 =?us-ascii?Q?khD2PTnrrWcLnDXF4IB36otBuDuQ4VvoKFo46oncEFUTSVJRcP6kdjDVz8Q9?=
 =?us-ascii?Q?fuidGqwdQ1FBJYpmlXBAE9vxzLE8PLH7moAWmalgWiUaWfVIUCN7nbb9ptNJ?=
 =?us-ascii?Q?0UwwPQd+C5C9CgCyEmR701SSb0hyYY5sYRPTFx4QmSW7QwRmD2KXOcHAHkaA?=
 =?us-ascii?Q?HqgdU1EGLXHUmo0HZtw7IeLkx5Q7TzhJy8PYG9Ao0BPH27PQpFuWIjPBjzvD?=
 =?us-ascii?Q?NQb1jVWqsf2Jx4C4dlJJ2egySgqoi9AsOPhhwZ+s7WHTR5U9Gwar4prJg6w7?=
 =?us-ascii?Q?qsNIivDTi8UO+P/ouY7wL1/KAF5bMkQh5LLjkwcq8dbXydokx6H/rEx2SPB0?=
 =?us-ascii?Q?MMhcwsqeer7UirRC0BQ3akXOtx3Rkn70q02+HWj1Adt0zDMe5OI9jfhL31kp?=
 =?us-ascii?Q?gRAjy3BidTYc2J3yphA9aZnLhfnfQyJuGUD4IiqdkT1tqJk43Rq/vSdHv2dR?=
 =?us-ascii?Q?6K6tM7H+fKPUOURpZK3YuSIXdhvj5ks2iZ9aDfDCOmL3aqoudYcqfpbQ6N4P?=
 =?us-ascii?Q?bmV+rPkcG2v49qBuqO5tpH54WPRqWRP3vkpY+2+3732kBi7kzqP/8PRtu2xt?=
 =?us-ascii?Q?phfJg18cvf/BcDh5CWZ5MGfgIwBPpJHc2cELJdnqyADBU4KXuqnsiptlMhmY?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 007c5f56-560e-4bb3-c480-08de2863a813
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 18:36:02.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYaPrT+4i+LC3Xo9pspJUxHTPS4vrHqr345IP8SgU8Ct+Rdc1QQ+JZ3bSd2nYqXLlY+GX5lUFl9Aq8RdTaH5QGo0eo3MhdYH0DP7VIU1bpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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

On Thu, Nov 20, 2025 at 12:07:45PM -0600, Lucas De Marchi wrote:
> On Wed, Nov 19, 2025 at 02:05:00PM -0800, Matt Roper wrote:
> > When we're initially enabling driver support for a new platform/IP, we
> > usually implement all workarounds documented in the WA database in the
> > driver.  Many of those workarounds are restricted to early steppings
> > that only showed up in pre-production hardware (i.e., internal test
> > chips that are not available to the general public).  Since the
> > workarounds for early, pre-production steppings tend to be some of the
> > ugliest and most complicated workarounds, we generally want to eliminate
> > them and simplify the code once the platform has launched and our
> > internal usage of those pre-production parts have been phased out.
> > 
> > Let's add a flag to the device info that tracks which platforms we've
> > removed pre-production workarounds for so that we can print a warning
> > and taint if someone tries to load the driver on a pre-production part.
> > This will help our internal users understand the likely problems they'll
> > encounter if they try to load the driver on an old pre-production
> > device.
> > 
> > The Xe behavior here is similar to what we've done for many years on
> > i915 (see intel_detect_preproduction_hw()), except that instead of
> > manually coding up ranges of device steppings that we believe to be
> > pre-production hardware, Xe will use the hardware's own production vs
> > pre-production fusing status, which we can read from the FUSE2 register.
> > This fuse didn't exist on older Intel hardware, but should be present on
> > all platforms supported by the Xe driver.
> 
> another difference it seems is that intel_detect_preproduction_hw() is
> executed for any platform, there isn't a flag... but maybe that's
> because the platform/revid check is only added on the flag day.
> 
> > Going forward, let's set the expectation that we'll start looking into
> > removing pre-production workarounds for a platform around the time that
> > platforms of the next major IP stepping are having their force_probe
> > requirement lifted.  This timing is just a rough guideline; there may be
> > cases where some instances of pre-production parts are still being
> > actively used in CI farms, internal device pools, etc. and we'll need to
> > wait a bit longer for those to be swapped out.
> > 
> > Bspec: 78271, 52544
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
> > drivers/gpu/drm/xe/xe_device.c       | 48 ++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > drivers/gpu/drm/xe/xe_pci.c          |  1 +
> > drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> > 5 files changed, 55 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 917a088c28f2..93643da57428 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -227,6 +227,9 @@
> > 
> > #define MIRROR_FUSE1				XE_REG(0x911c)
> > 
> > +#define FUSE2					XE_REG(0x9120)
> > +#define   PRODUCTION_HW				REG_BIT(2)
> > +
> > #define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
> > #define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 1197f914ef77..ed758888cfa1 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -797,6 +797,52 @@ static int probe_has_flat_ccs(struct xe_device *xe)
> > 	return 0;
> > }
> > 
> > +/*
> > + * Detect if the driver is being run on pre-production hardware.  We don't
> > + * keep workarounds for pre-production hardware long term, so print an
> > + * error and add taint if we're being loaded on a pre-production platform
> > + * for which the pre-prod workarounds have already been removed.
> > + *
> > + * The general policy is that we'll remove any workarounds that only apply to
> > + * pre-production hardware around the time force_probe restrictions are lifted
> > + * for a platform of the next major IP generation (for example, Xe2 pre-prod
> > + * workarounds should be removed around the time the first Xe3 platforms have
> > + * force_probe lifted).
> > + */
> > +static void detect_preproduction_hw(struct xe_device *xe)
> > +{
> > +	struct xe_gt *gt;
> > +	int id;
> > +
> > +	/*
> > +	 * The "SW_CAP" fuse contains a bit indicating whether the device is a
> > +	 * production or pre-production device.  This fuse is reflected through
> > +	 * the GT "FUSE2" register, even though the contents of the fuse are
> > +	 * not GT-specific.  Every GT's reflection of this fuse should show the
> > +	 * same value, so we'll just use the first available GT for lookup.
> > +	 */
> > +	for_each_gt(gt, xe, id)
> > +		break;
> > +
> > +	if (!gt)
> > +		return;
> > +
> > +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> > +	if (xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT)) {
> > +		xe_gt_err(gt, "Forcewake failure; cannot determine production/pre-production hw status.\n");
> > +		return;
> > +	}
> > +
> > +	if (xe_mmio_read32(&gt->mmio, FUSE2) & PRODUCTION_HW)
> > +		return;
> > +
> > +	xe_info(xe, "Pre-production hardware detected.\n");
> > +	if (xe->info.has_prod_wa_only) {
> 
> should we annotate the WA themselves? I was thinking sometime ago that
> we could have a configfs to force WAs in/out, so we have a quick path to
> test  a) dropping the WAs when they are not needed; and b) extending the
> WA, with the same action, to a new platform.

I think the main problem here is that during early development when
we're first implementing the workarounds and sending them upstream we
don't know yet which steppings are going to be production vs
pre-production.  Some (rare) platforms wind up having production parts
using A0, others have several steppings before being used in production.
The decision and documentation that "all production parts will have XX
stepping or later" is something that comes a bit too late for us.

We could go back and annotate them later once the information about
production steppings does get documented, but at that point we're
usually around the point where we're just ready to drop them anyway so
I'm not sure it's really worth it.

> 
> This patch itself lgtm and if we decided to extend, it can be done on
> top.
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Jani suggested that I invert the device flag to indicate that a platform
*does* still has pre-prod workarounds, and then we drop the flag later.
What are your thoughts on that suggestion?


Matt

> 
> thanks
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
