Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9526EC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 20:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003E910E4C7;
	Wed, 29 May 2024 20:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBN+tpGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5607E10E4C7
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 20:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717013008; x=1748549008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jiD7Dj7noKeJVtFdULbsOy2Xtrz163SGEAvWjuZJ7vo=;
 b=BBN+tpGjJwuYcbc1LQ65TVXneLsi07PJbSvySR61Vgjzm4NPxtmGueBh
 YjTboryh9Ts3F+cSgvzVasaIYlYx7pj9JnXi/3X91oDCq5mWPrQ3YLZSe
 9URo8aWGMKMDWa5sJ6E2FSRgAzIDtEDSMt1FmjVcHlrjutOtpSg/63jjJ
 vcBm4wF2ghugcT3g/My/UAjzDHBhx/o9sXm0OxAcG01Crg2CyqrJZ5rxX
 FFtrLIN5Go6Q2WYiCUwILCLj/UoZCpCd1fNVADhdiTavtm9K6YWcViu5y
 SnHmjfDvwtCCi6Trknxpt6o2x4MoboiPX/pAdlsEjfQTKLljiX43WEvxa A==;
X-CSE-ConnectionGUID: qCJ/6VsGQluGbd8o7JyQ2w==
X-CSE-MsgGUID: 4EzgqJ+DTwOAc5dOY4u2mQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13320658"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13320658"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 13:03:14 -0700
X-CSE-ConnectionGUID: uMmFIjUFTBCY8gAq4XzLaA==
X-CSE-MsgGUID: dhbO+BSAQQWNF/ShEMZ63g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="35637676"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 13:03:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 13:03:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 13:03:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 13:03:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 13:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGy2YFk6MLaMvSH/7lWrjAT3zLsj0WqydLpNuUF+1Ls6muQhhPRJ0GnK57hKVZAOh11l8NT097kfN/rbwz9+hDzCLlYQD1LTYrrejjbE5yAG1N9my2LIxndVIrgykGHJ9BtkpemG6/0fy3nlXoTdTiKKwwLGT/efrIcMT6jd/GoeW+UTOoo/qrRCi8FHSWGPrIDSxm03sOgidmv802pNrzQZ0TQjETDifFHu2I+8ZqgY88IDm6RnDwsqWs+Giih2UoYcsCYMk1M0KmCjUzEluvlPom0177LLDblaANVCnLFb1fDb0m+gaHWbUWZko1xjt8X9F6gkRMojIYC9/pjCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCapdDQoa/HPB17j1it2FOePxBW4DpvcRQdxroaNUIU=;
 b=Ig8VKDtCMXxnpxAF3rT7ho3yzRb9w2gLPF+Kivher6fkNSgiAKBdfGENYleK9h+AJ39r1muo4wGv99yUJR6ysWyZHtmd9y4t92t2cKS8ioVEWjfGvCbiCCCCfBEAbanGvEyqYrpHxm68jvizotP1E1kU6lGR5ISeKpU/GVxCGpV76c+e/pBYV9gFITz+10/X8cqAF1Dj1HsxyB4gB+BZhFSnMczzpwz7AtNQ90Kp9VyIMqrMisIZ3wZ0SAxngNSkzviqFydyymKBDN+x4cK9Mj5GMS6UFry9jO/j98qr7Otx137dK+b+ovWYZ9SwcIz4OfVYyNvqzIixw8LqH7xMjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.31; Wed, 29 May
 2024 20:03:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 20:03:07 +0000
Date: Wed, 29 May 2024 13:03:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Message-ID: <20240529200304.GO4990@mdroper-desk1.amr.corp.intel.com>
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
 <20240528230331.GK4990@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB620437AE652A03AC1C7827D881F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620437AE652A03AC1C7827D881F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: f115b8a9-733a-4251-379b-08dc801a5b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RPoFgH4sqLSAX9tsLlK8F9I14A88q3/FZkbnlk2jXXjtjJezvKm0Ll8Qk+yg?=
 =?us-ascii?Q?9qZJ7NbB8e2MdKXDGhkyMiqNLrXHZY9ZSfVs2zaCcH9L4PQ+3ZqrEuzlhRAu?=
 =?us-ascii?Q?YU6xRTUaYcaJEEL49n/+CWuS5fjfvhQ3+r1UVoMdB9389cBL6CGGJPiC0PuO?=
 =?us-ascii?Q?+Bab0u7r+Wp2Lw8K+ZD3Or1deewVtn2blsE7/36AjtErqJyJYt6uO/JD+kxA?=
 =?us-ascii?Q?umpmgsFZIcbFVyOSd3/kbut4mixO9rWrXSJzWwrO5E1O+Ux2NWHSW7KcTQRX?=
 =?us-ascii?Q?5x697c//jGaFgSG4YpFGna5S2En4kxT3C36dm174nLrsnJXvFFAn3lUfEHMU?=
 =?us-ascii?Q?ObU12bVWaN0i0kjRy6LwVyWFI+XGlhMHkSFX2A871EqjPBF3UD8u5wOE9KpE?=
 =?us-ascii?Q?VnLLKO6Pd98P1IO58zK0lyCDYyP2jVluwdakuu07ZzPzjRKKpHNh/zYYFtNg?=
 =?us-ascii?Q?3HJUzulkoCpvnEsOU21G8AI/2HKGEjtJufZoVWvOxpfmty+NE1pzRJ8Lnr1N?=
 =?us-ascii?Q?xqT0MX13C/DbfvHBk1FiB9zCDvSSfahUrrOBl/y/49fmzxz0DOi2/cYGms1r?=
 =?us-ascii?Q?I5l9/HmKTjAV0QXd1jwRH5JZqEZBDp/0GNMkL+aevz8WAhNvRJ+ce2gOkC+n?=
 =?us-ascii?Q?IA/RjI+N7RwsViXR8VRufIyxz9yip3/QyvYr0YqZVWqKioluKZD+kTq5fv1J?=
 =?us-ascii?Q?Zqa53VU0hgF5A6+Tx5tv8Rt4P9cLGds3tRfFkpcQJXrC/Hs9OSeXRohgAZzr?=
 =?us-ascii?Q?1N1CYW4rufoKnKLjilpvmrWHUOoM49tz/kBg6wZE+tOdBHohOg9Zo25cXyIz?=
 =?us-ascii?Q?SmGoyV2Rlxr1Fk5dwUGqEJdEGFgxMeHdvIuX0j3mIIrCTw3mNuifby3H0722?=
 =?us-ascii?Q?oXDA5jqu2CLoyKZb06xaeEReOcqfRB14BVCN+L9oOnLq/gWCGtul9BXKCdhw?=
 =?us-ascii?Q?8PQnopGHdRA/Afr/j5XnvGsUOvJ0vwpiF4bMTTqXN8RpZftc+fcmkAjyvTvJ?=
 =?us-ascii?Q?jxY274BU5r5YIF/OjpwLwKw89MLeV2uqaahVpGU/4Q88ier5dANazBGnICIo?=
 =?us-ascii?Q?jXe8r8h+LLzqX2VDVo8cXKAf6K9rZt99Mbv4bXzk+B2DsbUh4cLlncKVm3zF?=
 =?us-ascii?Q?c6pJIeOO2mwldAflQaRyLADax2TUjlTAT8YUhhCll+16sikU5aq5c4Ggl6eQ?=
 =?us-ascii?Q?MpuPzCc4mDXwRYhZxTBg80o38jtV2J0fRqdMuv2m9pFf+mmCxisOKy5FyntP?=
 =?us-ascii?Q?HauH61WPbGPsoo2uu2xm7ZtFtCCAMk/Mm01ZzIDp9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6DdYwY4jqE0UUGNdZwTzUG711Z2xSM2aGkLoxOhicEa1wO/uAAbTdDLyY9is?=
 =?us-ascii?Q?dguP5XVfeZIEIPeMyb7ZRU0We6/9nQHKXUr+0yEFaUDOS6mLhfvwh0fw5iHf?=
 =?us-ascii?Q?fWm4F88/1GD+HHt4WK9ntjKniAfHjU3a9FkgckvHsFpWqAkMzHzJGIahOPTL?=
 =?us-ascii?Q?2nWmV4WjDt6HQmqvsaNZnB+ril2Llp6VvNTXKCTTw5Kbx/wt52o13HVAjFoa?=
 =?us-ascii?Q?OT6avQDpdr1uQHc36OFujug1DiAbWP/e0N5EDrYmZ0gQ39s67JCYlSSFErdz?=
 =?us-ascii?Q?fgwawPn3c+x7FtuunzxmpyRCTsUA9SRa1R6GT8lV/jjLkKXEVm0FBX4uYQfg?=
 =?us-ascii?Q?RLXk+injCX8/mtDyjAlPPzc+6voihx3BfXUeU9kZi8KmC3VmFCq5VzIHDgYN?=
 =?us-ascii?Q?bVuloCOxbKTYfUmfuKSw9yy0JEoSBlQRzAZlAZMqp2xxN4YmEjTpNxaO/6U3?=
 =?us-ascii?Q?2mwI89A/ZOwmSEeI4vmlOyHe+Otrp/VsZ6B5veh8SMaYEoDQkjYILXZ9xDyF?=
 =?us-ascii?Q?2beqpcSzlwuRddeVo3rKJrhT8Khf2Bim3OeOpOdk4MfDfwRv+amwO2ETWwdr?=
 =?us-ascii?Q?PCZUhzeONlMkX2RZZqq3lbn68+CbZN8fVMKWRy3NZJfX48GTCThY65Vu+e9y?=
 =?us-ascii?Q?cNJ64BH5faRLdou58LNA2VV0I9jZwHK9ZqoHNOCQclUK0FwAGmiDaF20bsrC?=
 =?us-ascii?Q?QfDs2UDd5SBB9MTWe7ajJcaJEOWFy7Sx1m/jdhpOiG1WXyMOwMevi2lKSSh8?=
 =?us-ascii?Q?LJ5ntTWEVTtsAC3cFOw9qKLQoy77Er9s5Ltw42FguKmFkXe5zrEh2feo3529?=
 =?us-ascii?Q?GsTjLUrZE3OjhDhNi6LCiu/mDrhmnBtr+QaVapMENfqXQGSFRyXD65yGKf+p?=
 =?us-ascii?Q?geQG886woQgrpnFTkzSw3Ka7jQ7DheDRzVF3ry23OajF5ygPS7m2id6d0Ocw?=
 =?us-ascii?Q?erRlpiZmapW1Csk1zZsYUGEJqrtHriILWyhDUNyFcfMqrpPazeTcuOXLYryB?=
 =?us-ascii?Q?SWj8RosN+bvte68JvRgR3oJtyoy39/hmibKc2I4xlmhf6lD+zHyz9Cgi4QO8?=
 =?us-ascii?Q?v4Vw81coXrMXLVfrEPhskDummhxQtQJg6vsX4cgDDcIu3D/E3TFEQSQJMQV8?=
 =?us-ascii?Q?CMv2QembeUJ6b1M8gFkO5a+IItSqrR+qQfWkLBX/uABod7ppnPCFIorHRb35?=
 =?us-ascii?Q?veweeC51uxYqc/lDUZzxoJdmhFTPN2rjw1wlQmBSODGsN8iWABveqtUIrjWp?=
 =?us-ascii?Q?wjcQwDHWurk3AAg8hINvfgddl1ikQW4+zK8MK+7yXn4fnbX27NF4tupfIeZT?=
 =?us-ascii?Q?MGRuQrlZnrH4jGRS46OmH5Z6uT2NALHeDGk0aMVkDkdEC+8vWA3VLBiWF0Wq?=
 =?us-ascii?Q?enux+a24Nejltoqp4SKLPelrOFfp0uoSNiU5t4tzs49G0PfyyQfpz6NlrMCG?=
 =?us-ascii?Q?529WKjDPvkOF6D13AyoC/MeaEDcMS5WGPZAYGb+vMx412s93LeyuUutJewaS?=
 =?us-ascii?Q?vRywppbH9o+dg2o7UfmFw/IHfOspR8qM3MsfRm6KZm7MfsmmgD4CWKGdRIvS?=
 =?us-ascii?Q?BjFC/n3waeDDdOEu5LCTznPzfJDgGhq/5371ZaJ9tnJlYvXCrDf8lRDOc/1b?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f115b8a9-733a-4251-379b-08dc801a5b5e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 20:03:07.1877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zilIxcuc0701Ae29tgmgVnlStfP5KBvk+UXMwhr68WbkQuAG65zpxvDI9Ja68zBlYnrvv/Se38WvkhYsY1wNsY2UvhWTO1tQHZoyL2joNG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
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

On Tue, May 28, 2024 at 11:39:09PM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Wednesday, May 29, 2024 4:34 AM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
> > 
> > On Fri, May 24, 2024 at 12:02:28PM +0530, Tejas Upadhyay wrote:
> > > Wa_15015404425 applies to xe2_lpm all steppings
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
> > >  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
> > >  2 files changed, 19 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > index 722fb6dbb72e..07c8a23bd7c2 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > @@ -42,6 +42,7 @@
> > >  #define STOLEN_RESERVED				XE_REG(0x1082c0)
> > >  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9,
> > 7)
> > >
> > > +#define MEDIA_DUMMY_REG
> > 	XE_REG(0x138000)
> > 
> > The workaround description recommended using 0x130030 as the target
> > offset.  Is there a reason you're using 0x138000 (which is a real RP_STATE_CAP
> > register that you'll probably be clobbering if you write to it)?
> 
> Yes, I missed it, while solving checkpatch erros. I will add correct address back. 
> 
> > 
> > >  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
> > >
> > >  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > b/drivers/gpu/drm/xe/xe_mmio.c index ff7a7cf99530..e1dc87078387
> > 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
> > >  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);  }
> > >
> > > +static void mmio_flush_pending_writes(struct xe_gt *gt) {
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +
> > > +	if (!(xe->info.platform == XE_LUNARLAKE))
> > > +		return;
> > 
> > This workaround is a bit strange; it's tagged as only applying to Xe2_LPM, but
> > the description indicates that it actually lies within the SoC fabric.  Our usual
> > graphics/media workaround database doesn't always capture SoC
> > workarounds very well...have you confirmed that this applies to all SoC
> > steppings (which is different from the graphics/media steppings)?
> > 
> > > +
> > > +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) == 20) {
> > 
> > The description also notes that we need to apply this workaround before
> > issuing a "read to Gfx GTTMMADR BAR."  So even though this is tagged as
> > Xe2_LPM (probably because they didn't have a good way to express SoC
> > details in our usual workaround database), it sounds like this workaround is
> > probably needed for any reads through the PCI BAR, not just the ones
> > targetting media offsets.  In fact from the description it sounds like it would
> > also probably apply to any reads of the GSM through the GTTMMADR BAR as
> > well, not just the registers.
> 
> Details suggests "These dummy writes are not needed for PCI CFG space
> access (those are always NP). ". Also by the way we apply it in all

PCI CFG space is the kind of stuff you see when you run lspci.  Anything
that's inside a BAR (i.e., either registers or GGTT entries if we're
talking about BAR0) isn't considered part of the config space.

> reads which are 32bit, its just that we check here media version 2000
> is present on SoC. As per my understanding we don't need this WA if
> media 2000 is not present. Should we correct this understanding?

I think we should probably confirm directly with the hardware team.  The
workaround database that we look at for 99% of the stuff in our driver
is really specific to graphics/media issues.  In cases where there are
issues outside the graphics/media itself (e.g., in the SoC) that happen
to impact the operation of graphics/media, the handling and tracking of
those can be a bit inconsistent so it's best to double check offline as
to exactly what the scope and limits of the workaround need to be.  It
might turn out to be something like "any media stepping can be impacted,
but only if the SoC stepping is in the range [X, Y)."  And since the
text refers to BAR access (and doesn't seem to actually be specific to
media), it seems like the fact that this is only marked as Xe2_LPM might
be a mistake.  Definitely good to double check.

> 
> > 
> > > +		int itr = 4;
> > > +		/* 4 dummy writes */
> > > +		while (itr--)
> > > +			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
> > > +	}
> > > +}
> > > +
> > >  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)  {
> > >  	struct xe_tile *tile = gt_to_tile(gt); @@ -479,6 +494,9 @@ u32
> > > xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > >  	struct xe_tile *tile = gt_to_tile(gt);
> > >  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> > >
> > > +	/* Wa_15015404425 */
> > > +	mmio_flush_pending_writes(gt);
> > 
> > There aren't a whole lot of them, but technically 8-bit and 16-bit reads
> > probably need this workaround as well.
> 
> Ok, I will double check this. I noted this, but I thought it will not be right thing to write32 inside read8 and read16, isn't it?

It sounds like the goal of this workaround is to flush through any
previous PCI writes by performing additional dummy writes before a read
happens.  In that case, I don't think the size of the read 8/16/32
really matters.

Although I do wonder if we'll need to perform some synchronization to
handle cases where multiple threads are performing MMIO access at the
same time.  i915 had an 'uncore lock' that prevented concurrent access,
but Xe doesn't have anything like that, so is it going to cause a
problem if we have a situation like this after implementing the
workaround?

        Thread 1        Thread 2
        ========        ========
        Dummy Write 1
        Dummy Write 2
        Dummy Write 3
                        Real Write
        Dummy Write 4
        Real Read

I.e., do we need to make sure the sequence of dummy writes and its
following read are uninterrupted by other threads?


Matt

> 
> Thanks,
> Tejas
> > 
> > 
> > Matt
> > 
> > > +
> > >  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +
> > > addr);  }
> > >
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
