Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1663AC48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 19:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC00110E041;
	Wed, 21 Feb 2024 19:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0XbKMTr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AB310E041
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708542040; x=1740078040;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F6bgvQkt5xGfsuGIrh3dQqlNy8L0vnXRWgWO95/UAiU=;
 b=Y0XbKMTrgUJfFzXPlDaHTkEU6PlMzPDBVZISq+MYvCMe53tX0PXgn3qs
 H/2ax1uYAdxyY5Kgd5E/SgIDwCDlsR9xS9SsCIDOrJHZSnrbs94rLkJrE
 nn6wExXiB2sWemYmG4r9bYYtrMIUcrUuhXShCiCrfitLgEcwL51AXEZvn
 wzWPAfmC3Xl8lypzfZz87fNgXoz8d6Bcjw+Bap2y9xkmYYy7fAqVZUlA3
 290hIeFkAUTRiV8O9MFtad5zcShHGDbbi5ODmMR1njGm4PrqfrCVY0DRJ
 p2RMli5QezliOcDVw95jBd5GTAazL0fuLyK23RU9kaZyL8lClKWTrS0zV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2608468"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2608468"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 11:00:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5588790"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 11:00:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 11:00:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 11:00:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 11:00:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 11:00:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mReO31hFVa/CTdGYIcega91Ha3dsOkfCjYlzrYq5SXoT3tsa9++zhIj03oBambCTNHfW+zNRRmPmEFIPK//qwBmd4I98nHWcLOSamHC9kCL+gUozop+jCzi0DBJ5jcblUmwKAR/wBSeG8BpxQWlApWgECcOKNPPYbX71RlR6KSLR/nr7+4trLCtxooLrvYMngZa+iuzfRa6t9ntpZTNczRzu4ckx+HMl2jqxNHUqzStSDyFVz0KMiMsuCP4Ds8iDYTtywuGuOMlI106C9/1VDIdurqntcEUobsOlFaRmwUTMoR1CYuVNZj0aVqZHue1N9TUOVPDchWD29B4Z7c2A2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O663bLvD1i5y80/xDTj55x35Ef4AqLa1S+DCl6nycfA=;
 b=gXuCIhovvrMdRUmjmwy9Z+Wwt7dvDhICVVPCJ6yR/ya2qupegE/3E7hm7b00BON9D4/9z4vfvOJ7an7xonVdmirrW6Nj7b1FB2nOrW35Ejk4SKuxmD+FU74aisFguMRH4IMlSE1WaoIoUkX/W6iR9mUFf47k40PjbteB8/01AVrOoZ7bZTDmUf2sgyrwHZmMZv1Bv8E2MrmukVdwjaLMkBAl6sYcq6BllCdhmuEe3AhpQfGTIiRhDkj0mih1ZL/kaYdAJ8g3X9z4QkhZl3zn/z1iA0fwCJ9MPg0jxwGIMzr5GgdVsUj1O8KucsHojLHwAyM4XLgogwJvkgIkaMbFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6858.namprd11.prod.outlook.com (2603:10b6:510:1ee::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 19:00:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 19:00:34 +0000
Date: Wed, 21 Feb 2024 14:00:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 01/14] drm/xe: Document Xe PM component
Message-ID: <ZdZITR3RSUNqDDHW@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
 <ZdXngrtmc58-Zyfj@fdugast-desk.home>
 <CY5PR11MB621115DF0A46D62420E2859B95572@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB621115DF0A46D62420E2859B95572@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: e25e36cf-73be-4db3-d43f-08dc330f621a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7aXFfTF9NNmNFzKVKpWc/cajhxaYKA2auP7cWoq3iIX4OiO8m8lTPW2tWmUkobqD7UdqjEFLd7SlVufkaOb+sUfO95As7NVSNGllChuQPs8EIICZPnDTb5FgIPfN78gvXIymEKdwXEmHsPLMenIcvSJf1SLZXzuMKw7zPcpr32cvz8RwFHvjFV26J5sIYwQKP+X5dc1kokszeDir1GnVbixC/biX2IgdyUHEqfm33zgjcSe+BFth1y+5b4wVCLyxeSOWZ6ckSWylMlmV0fcW2ilSkF/LQbtIh48MKwusX2wVUvyG/H+ILeSEztqhr9tECDCdHyFZIzEj7lVsAbtx/EBEZdLO8GIxSYt+tZQaILz9vWBmOahPRaagwfFnc90Ui3hiwoYdZbbmHgshqEuBsEI6kNfQc1mUt34vV3wKr4HI2RoBzv5+yCMBoFIR0MIM0AwbfJWCVhXdCq287TYeayYi7xOZGW9GKTeYSJgrIV75xG2DGa9dOYuGB60kjD+SEoYWZ0skUwxrB6dm+IZv6q8JKx8EpUWyxeUQ2ybaFLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R+1JHtmdedGwaae6jaj60tm/fg1mX3zXU8ds9IAl3uhDBii44Z7JkDR7tdPu?=
 =?us-ascii?Q?HiYyO43g9v02g+Mc6VE42RcnMDVR6JsOPwFLM7YS14CK+yAof+sU6snNZiLf?=
 =?us-ascii?Q?080QaVPH4pRMdLyK+eCD0s/kLlTegL1T81mC8UDWxgjrFWbJUxZWWoyYUyoN?=
 =?us-ascii?Q?/kC46yP+k8LqmUJgxOnxBihLuCOChFRPaUkVJk5/bO/kyO4Xqgsr+rcFVLfV?=
 =?us-ascii?Q?rj3hPAbQ6qI8mO7HR3USgcG61MqzodG5FOcoksu5B4Xkjpm99hu5utRhqhLy?=
 =?us-ascii?Q?IVooKMTf01lzUrmn5RmZOkgeuVxrO8zECPEc3kdSja2s1uXKpFtW1ChTcot1?=
 =?us-ascii?Q?f3zFaO9h86RYWv18O3Hb6FP1ARqNymZ/prSDgjYHhylvZNvel04vPKdrMT3W?=
 =?us-ascii?Q?TvIutdWNuN3G3v4AQkoauCARmBRlj5vYZ/5MnlE9SNJO4gZMx5ZeMA+YMhC1?=
 =?us-ascii?Q?7fEBJKQOuaUFNgMClXjj8SSzoBn0B4fCsx+Fo9SsfxwWYxKg8ZCilmIMf9bl?=
 =?us-ascii?Q?D1IBzOxdI8kUYAxLUwNHpw9xBbEkdor0SMcqmVT6tvttdDCIysZ/dEFR/sJz?=
 =?us-ascii?Q?5lpUlvST0mApUwHUvIM1S6jh7zfdx9ugbAqha3rKsDPvc9qK3/YezTSD1YUX?=
 =?us-ascii?Q?CythJa3uiI2OL0xVfn4ewbqAaIWG5zUztizgvEurqYJAVV/K81QO3ZozfeIT?=
 =?us-ascii?Q?f5bJuKFlvNYe83h7un4483tAM7079DKTS9mD7Bgb0dr6F0pN3ODYc4rU70T1?=
 =?us-ascii?Q?Kc9rldLlEytUqhnv8jqeuqB6EdiievAD5SzxMSlecVj8yzcgIP7BufGNlqPK?=
 =?us-ascii?Q?patlZeg5PpbCytmoGoH8rwpzahy4zpH58kBD+WOuo7hs38YPBlcowcgsNPm4?=
 =?us-ascii?Q?zqbbSeLd/+ZdhCje3Vg+cHDpbn7fOIqo64TIp7GKVkB55cqt/EGq5LQqa677?=
 =?us-ascii?Q?Qj8tAWxuVncTflrto3CrtqVPocWZJISzADwEsgmJujvKbsMvDYDuLiJdVkJs?=
 =?us-ascii?Q?sH1z+WrBYrrxIu7g0VqX0zoCxV0M37xkC2A7/ZdgNwRgqtbwshWbku38yYXK?=
 =?us-ascii?Q?kBpjJj6NwnorRMkOmL18XzAZxMIzaNz3mgaeAwy4QhlJEADQ/WVhJ3tIBg/Q?=
 =?us-ascii?Q?KNEoYl+zPnlw0M6jaWXW8HP9v+AHS/hrWdqToPX0ElcP/4jNdUJsokwF/mtL?=
 =?us-ascii?Q?4Ul/vDwI9OE29YVyatOqTlOyzrFS7TbU7O+CNN904jW0ItzNU2pEa/GrRuxZ?=
 =?us-ascii?Q?Lf9pDVN3VJ/as1lYJmUzcoX/wa3wGZEHsEitlzUZ96gorMLC/vIB0tTBgVW6?=
 =?us-ascii?Q?kIUsLJTC5lxrwtEIE3HABkPk6uupxB15qzFVI5i6vP9TJhcTprzqWF7xTgRr?=
 =?us-ascii?Q?uRuG7i7ALvuhEi7eEPhiF7k2MD834pWEEIsQn2s+dRJF0t3sx00IU/EAPYY0?=
 =?us-ascii?Q?8b3zc4Lva2fg2xd7nxtZ+GJna+2ouysg39PK5eb/ETni6xcr3wUBwtbI0jQm?=
 =?us-ascii?Q?JeMALfhXcO7e5a/1hYNYTy2P6d/D1+S5cvhiXUyc7wgoBNWFIrTIeXkEGS7q?=
 =?us-ascii?Q?sFZQ0KAPYJ5y8MI9Cuz+lVZRkTFI0LK4TUCQnFZaMQ8cVt0jwSrTrHYghhLo?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e25e36cf-73be-4db3-d43f-08dc330f621a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 19:00:34.6440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CH5GoH2z512dsE1KPR86cH6M7ZKBqBrYgQnk3pybUYENQRHoQ64An2aKs360MZMjk5k+JTyOGs6lvlnP8CmB8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6858
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

On Wed, Feb 21, 2024 at 09:41:44AM -0500, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Dugast, Francois <francois.dugast@intel.com>
> > Sent: Wednesday, February 21, 2024 5:38 PM
> > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>;
> > Gupta, Anshuman <anshuman.gupta@intel.com>
> > Subject: Re: [PATCH 01/14] drm/xe: Document Xe PM component
> > 
> > On Thu, Feb 15, 2024 at 02:34:17PM -0500, Rodrigo Vivi wrote:
> > > Replace outdated information with a proper PM documentation.
> > > Already establish the rules for the runtime PM get and put that Xe
> > > needs to follow.
> > >
> > > Also add missing function documentation to all the "exported" functions.
> > >
> > > v2: updated after Francois' feedback.
> > >     s/grater/greater (Matt)
> > >
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Acked-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pm.c | 108
> > > +++++++++++++++++++++++++++++++++----
> > >  1 file changed, 97 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index ab283e9a8b4e..64ffb9a35448 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -25,21 +25,46 @@
> > >  /**
> > >   * DOC: Xe Power Management
> > >   *
> > > - * Xe PM shall be guided by the simplicity.
> > > - * Use the simplest hook options whenever possible.
> > > - * Let's not reinvent the runtime_pm references and hooks.
> > > - * Shall have a clear separation of display and gt underneath this component.
> > > + * Xe PM implements the main routines for both system level suspend
> > > + states and
> > > + * for the opportunistic runtime suspend states.
> > >   *
> > > - * What's next:
> > > + * System Level Suspend (S-States) - In general this is OS initiated
> > > + suspend
> > > + * driven by ACPI for achieving S0ix (a.k.a. S2idle, freeze), S3
> > > + (suspend to ram),
> > > + * S4 (disk). The main functions here are `xe_pm_suspend` and
> > > + `xe_pm_resume`. They
> > > + * are the main point for the suspend to and resume from these states.
> > >   *
> > > - * For now s2idle and s3 are only working in integrated devices. The
> > > next step
> > > - * is to iterate through all VRAM's BO backing them up into the
> > > system memory
> > > - * before allowing the system suspend.
> > > + * Runtime Suspend (D-States) - This is the opportunistic PCIe device
> > > + low power
> > > + * state D3. Xe PM component provides `xe_pm_runtime_suspend` and
> > > + * `xe_pm_runtime_resume` systems that PCI subsystem will call before
> > > + transition
> > > + * to D3. Also, Xe PM provides get and put functions that Xe driver
> > > + will use to
> > > + * indicate activity. In order to avoid locking complications with
> > > + the memory
> > > + * management, whenever possible, these get and put functions needs
> > > + to be called
> > > + * from the higher/outer levels.
> > >   *
> > > - * Also runtime_pm needs to be here from the beginning.
> > > + * The main cases that need to be protected from the outer levels
> > > + are: IOCTL,
> > > + * sysfs, debugfs, dma-buf sharing, GPU execution.
> > >   *
> > > - * RC6/RPS are also critical PM features. Let's start with GuCRC and
> > > GuC SLPC
> > > - * and no wait boost. Frequency optimizations should come on a next stage.
> > > + * PCI D3 is special and can mean D3hot, where Vcc power is on for
> > > + keeping memory
> > > + * alive and quicker low latency resume or D3Cold where Vcc power is
> > > + off for
> > > + * better power savings.
> > > + * The Vcc control of PCI hierarchy can only be controlled at the PCI
> > > + root port
> > > + * level, while the device driver can be behind multiple
> > > + bridges/switches and
> > > + * paired with other devices. For this reason, the PCI subsystem
> > > + cannot perform
> > > + * the transition towards D3Cold. The lowest runtime PM possible from
> > > + the PCI
> > > + * subsystem is D3hot. Then, if all these paired devices in the same
> > > + root port
> > > + * are in D3hot, ACPI will assist here and run its own methods (_PR3
> > > + and _OFF)
> > > + * to perform the transition from D3hot to D3cold. Xe may disallow
> > > + this
> > > + * transition by calling pci_d3cold_disable(root_pdev) before going
> > > + to runtime
> > > + * suspend. It will be based on runtime conditions such as VRAM usage
> > > + for a
> > > + * quick and low latency resume for instance.
> > > + *
> > > + * Intel systems are capable of taking the system to S0ix when
> > > + devices are on
> > > + * D3hot through the runtime PM. This is also called as 'opportunistic-S0iX'.
> > > + * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be
> > > + called for
> > > + * S0ix.
> Hi Rodrigo,
> Sorry of late review comment, was busy with other stuff.

no worries. Thank you so much for jumping in. Really appreciated.

> we do need modify the doc slightly.

indeed... I also realized that to avoid confusion we need to detach the D3.
In our integrated devices it is power important for the package-C states then
for 'D3' itself. One might look at our PCI config for integrated and see D3hot- and
get confused.

> For integrated graphics D3hot is not necessary to achieve for the host s0ix, like with PSR panel
> PCI device will be in D0 state as KMS CRTC will be active and will  held a device wakeref.

Then let's also detach the opportunistic s0ix from the runtime_pm with this PSR
case in mind.

> 
> AFAIK for discrete card perspective, host s0ix requires PCIe link to be in low power state.

yeap, but that's outside of our scope so let's minimize the doc to the calls
around the functions that we are implementing here.

So, what do you think of this diff between what I had here in this patch and
what I'm seending soon on a v2:

--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -33,17 +33,9 @@
  * S4 (disk). The main functions here are `xe_pm_suspend` and `xe_pm_resume`. They
  * are the main point for the suspend to and resume from these states.
  *
- * Runtime Suspend (D-States) - This is the opportunistic PCIe device low power
- * state D3. Xe PM component provides `xe_pm_runtime_suspend` and
- * `xe_pm_runtime_resume` systems that PCI subsystem will call before transition
- * to D3. Also, Xe PM provides get and put functions that Xe driver will use to
- * indicate activity. In order to avoid locking complications with the memory
- * management, whenever possible, these get and put functions needs to be called
- * from the higher/outer levels.
- *
- * The main cases that need to be protected from the outer levels are: IOCTL,
- * sysfs, debugfs, dma-buf sharing, GPU execution.
- *
+ * PCI Device Suspend (D-States) - This is the opportunistic PCIe device low power
+ * state D3, controlled by the PCI subsystem and ACPI with the help from the
+ * runtime_pm infrastructure.
  * PCI D3 is special and can mean D3hot, where Vcc power is on for keeping memory
  * alive and quicker low latency resume or D3Cold where Vcc power is off for
  * better power savings.
@@ -58,12 +50,28 @@
  * suspend. It will be based on runtime conditions such as VRAM usage for a
  * quick and low latency resume for instance.
  *
- * Intel systems are capable of taking the system to S0ix when devices are on
- * D3hot through the runtime PM. This is also called as 'opportunistic-S0iX'.
- * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be called for
- * S0ix.
+ * Runtime PM - This infrastructure provided by the Linux kernel allows the
+ * device drivers to indicate when the can be runtime suspended, so the device
+ * could be put at D3 (if supported), or allow deeper package sleep states
+ * (PC-states), and/or other low level power states. Xe PM component provides
+ * `xe_pm_runtime_suspend` and `xe_pm_runtime_resume` functions that PCI
+ * subsystem will call before transition to/from runtime suspend.
+ *
+ * Also, Xe PM provides get and put functions that Xe driver will use to
+ * indicate activity. In order to avoid locking complications with the memory
+ * management, whenever possible, these get and put functions needs to be called
+ * from the higher/outer levels.
+ * The main cases that need to be protected from the outer levels are: IOCTL,
+ * sysfs, debugfs, dma-buf sharing, GPU execution.
+ *
+ * Intel systems are capable of taking the system to S0ix when all certain
+ * conditions are met. This is also called as 'opportunistic-S0iX'.
+ * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be called
+ * for S0ix. In certain cases, like when Display Panel Self-Refresh (eDP PSR) is
+ * active, not even `xe_pm_runtime_suspend` and `xe_pm_runtime_resume` will be
+ * called.
  *
- * This component is no responsible for GT idleness (RC6) nor GT frequency
+ * This component is not responsible for GT idleness (RC6) nor GT frequency
  * management (RPS).
  */

> Thanks,
> Anshuman Gupta.
> > > + *
> > > + * This component is no responsible for GT idleness (RC6) nor GT
> > > + frequency
> > 
> > Isn't it s/no/not/? Or s/no/neither/ + s/nor/nor for/? In any case:
> > 
> > Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> > 
> > Francois
> > 
> > > + * management (RPS).
> > >   */
> > >
> > >  /**
> > > @@ -178,6 +203,12 @@ void xe_pm_init_early(struct xe_device *xe)
> > >  	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> > >  }
> > >
> > > +/**
> > > + * xe_pm_init - Initialize Xe Power Management
> > > + * @xe: xe device instance
> > > + *
> > > + * This component is responsible for System and Device sleep states.
> > > + */
> > >  void xe_pm_init(struct xe_device *xe)  {
> > >  	/* For now suspend/resume is only allowed with GuC */ @@ -196,6
> > > +227,10 @@ void xe_pm_init(struct xe_device *xe)
> > >  	xe_pm_runtime_init(xe);
> > >  }
> > >
> > > +/**
> > > + * xe_pm_runtime_fini - Finalize Runtime PM
> > > + * @xe: xe device instance
> > > + */
> > >  void xe_pm_runtime_fini(struct xe_device *xe)  {
> > >  	struct device *dev = xe->drm.dev;
> > > @@ -225,6 +260,12 @@ struct task_struct *xe_pm_read_callback_task(struct
> > xe_device *xe)
> > >  	return READ_ONCE(xe->pm_callback_task);  }
> > >
> > > +/**
> > > + * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
> > > + * @xe: xe device instance
> > > + *
> > > + * Returns 0 for success, negative error code otherwise.
> > > + */
> > >  int xe_pm_runtime_suspend(struct xe_device *xe)  {
> > >  	struct xe_bo *bo, *on;
> > > @@ -290,6 +331,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > >  	return err;
> > >  }
> > >
> > > +/**
> > > + * xe_pm_runtime_resume - Waking up from D3hot/D3Cold
> > > + * @xe: xe device instance
> > > + *
> > > + * Returns 0 for success, negative error code otherwise.
> > > + */
> > >  int xe_pm_runtime_resume(struct xe_device *xe)  {
> > >  	struct xe_gt *gt;
> > > @@ -341,22 +388,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >  	return err;
> > >  }
> > >
> > > +/**
> > > + * xe_pm_runtime_get - Get a runtime_pm reference and resume
> > > +synchronously
> > > + * @xe: xe device instance
> > > + *
> > > + * Returns: Any number greater than or equal to 0 for success,
> > > +negative error
> > > + * code otherwise.
> > > + */
> > >  int xe_pm_runtime_get(struct xe_device *xe)  {
> > >  	return pm_runtime_get_sync(xe->drm.dev);  }
> > >
> > > +/**
> > > + * xe_pm_runtime_put - Put the runtime_pm reference back and mark as
> > > +idle
> > > + * @xe: xe device instance
> > > + *
> > > + * Returns: Any number greater than or equal to 0 for success,
> > > +negative error
> > > + * code otherwise.
> > > + */
> > >  int xe_pm_runtime_put(struct xe_device *xe)  {
> > >  	pm_runtime_mark_last_busy(xe->drm.dev);
> > >  	return pm_runtime_put(xe->drm.dev);
> > >  }
> > >
> > > +/**
> > > + * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device
> > > +active
> > > + * @xe: xe device instance
> > > + *
> > > + * Returns: Any number greater than or equal to 0 for success,
> > > +negative error
> > > + * code otherwise.
> > > + */
> > >  int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
> > >  	return pm_runtime_get_if_active(xe->drm.dev, true);  }
> > >
> > > +/**
> > > + * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie
> > > +parent bridge
> > > + * @xe: xe device instance
> > > + */
> > >  void xe_pm_assert_unbounded_bridge(struct xe_device *xe)  {
> > >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev); @@ -371,6 +443,13
> > @@
> > > void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
> > >  	}
> > >  }
> > >
> > > +/**
> > > + * xe_pm_set_vram_threshold - Set a vram threshold for
> > > +allowing/blocking D3Cold
> > > + * @xe: xe device instance
> > > + * @threshold: VRAM size in bites for the D3cold threshold
> > > + *
> > > + * Returns 0 for success, negative error code otherwise.
> > > + */
> > >  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)  {
> > >  	struct ttm_resource_manager *man;
> > > @@ -395,6 +474,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe,
> > u32 threshold)
> > >  	return 0;
> > >  }
> > >
> > > +/**
> > > + * xe_pm_d3cold_allowed_toggle - Check conditions to toggle
> > > +d3cold.allowed
> > > + * @xe: xe device instance
> > > + *
> > > + * To be called during runtime_pm idle callback.
> > > + * Check for all the D3Cold conditions ahead of runtime suspend.
> > > + */
> > >  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)  {
> > >  	struct ttm_resource_manager *man;
> > > --
> > > 2.43.0
> > >
