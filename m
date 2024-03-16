Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ED3C54E67
	for <intel-xe@archiver.kernel.org>; Sat, 16 Mar 2024 01:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25893112888;
	Sat, 16 Mar 2024 01:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSqh8WYc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D40112888
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Mar 2024 01:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710552926; x=1742088926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FLxKt8BwxFbjCM7WvuZxIJjbgaSUAjFQzl11fi+oP0g=;
 b=BSqh8WYcIJr8WQfpm5SJm5RYpSy2l0wIlkwNQzC+olleeG1gm5D+QylL
 ONmmuBbDiC7Bmnsi2v9szLy6Af4/5xKmatyxjCCPXFyJSkhQLIJzKx9RO
 Ak+VYrodbq4YeQjpHz9ff1/aAjg9vzVmbpU5ayM6eQdYImcXwT6dtPN7O
 qav6rlPgfg+xH2zMn+bO2WbGDPj8/YqkkdykSgOfVR1NxQ+uLRS7r+U4z
 fiUzCYlMS3eFSDoF/pjoAdSSROLSJqlSz10HEP7MZlIpxqq+2FiZhRzai
 6f2Wivln+IySaBb1/kDeyk16JMagxZ0gq3mXAfYqcQLTBoxDwNGOztdoG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5573134"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5573134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 18:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="17560516"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 18:35:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 18:35:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 18:35:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 18:35:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 18:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ+2lkJvmRzG69kCliCLFZimnfOVbYOpeDHKLhgPjhI7ADRrxM0am0vzkE1X8lVlxwWA8xdKwgyzzLMOvepiyHmKXOPOyDP+lL8MRZUrwyZbKrtUGipJhaoZjUliObgseXMLdnxfHSo+JliLzDdCSPBjaIZK+SHsSARJGU3orAvt/JNROx90HGLg4Ougv0LajcJBxM9YFOglrmb2Vw8UmOj3+x5NIMQVF/0mw04nOapnoVmEJ9/ghbrcBWqXs3o0hnEMED7iQsf7Wb5L2jvEtg7Cli+ndebMXzChNe2OvNO9HeWWPLkL6h2g57XsIJPLXFfPxE6uiA70BKgl/QMf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEhQf79D8nwjzmMQ2lwYZrd9RcBVprwKcyQnRLLOvxA=;
 b=gB8xPy365zJLqlSR1V2Na5igfnPGGJXrOmw7hbLiNjcYz+SlWK3NRVqyImkorgjKqCCmzxoX9YbLidUNuiZDh16DgSY71e5Pqel/MrDaG3oiK7M6ZQQGMyTXpTr32KN2avW78pYHiYVGKd22u+54+LnaZCX4vG1FQTSdDIznpKaN1XDyBFMeM5TA/PoOXnqMKpXL0dTnRhzkdHZlC1yMp6IfLBEbrqIzqPjXuMZED8rcTWb70tcyqW7zxjudLwj+9KEDDZEhvz5QXcaN7AM5cHut1+1BnpREYEHLoY7vRFLNX3F5SMgmTUKh0HGpsEkl17MpuQaPTKGnz+42Ey2ZJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Sat, 16 Mar
 2024 01:35:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Sat, 16 Mar 2024
 01:35:21 +0000
Date: Sat, 16 Mar 2024 01:33:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Message-ID: <ZfT2841h44bVO85l@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-4-oak.zeng@intel.com>
 <ZfM2OYmQ8/XiT7/D@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69912484F35F776FD70B692C92282@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69912484F35F776FD70B692C92282@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3b3e59-0917-4c32-20ce-08dc45595847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6raOFbiwR5ZvC152XtiZ/X1l0Nr9gaKoHPvhsHHwfVftqeBiLmoZ7HHdYHUYM5Flq9AXcfxfSsa2hS3N6wIPkpKHCguM7h2b69iqP10q8LQVxS66Mk2m8oj8MNY3rdrvzizUQtWceTRv458yXJpZbmQwt9O+MmJm1+U+8kq8oW7To6wlrKRpTO3L2Apr4Qqzj4O3yi+EMfMAnW9e/usRELYtRha8/kLac/2ST8EUQq/Er8uku/xqJtzZW7JUEUMnew2rQfDxFzJh8/lFf6WbFVFP8sSnVnPFCrqjKeNlrZbt0jYLB6AbzJeheYgTWak4xCsgw+BpGD92O5Su/yLWe+4UUd5GRdCBkaf3hwveHibADindRsj/j+Y14iNR0r0Dk+/Fjcs1Fdf3Uzpvg5g2aglwgkDEvNkbHHStVainBqkiQugB2DVJqwjQMaABT78X/XLeirsRtwTzrrml07kVRup5H4jIBO5Z263M/FLap9gow7VGU1Yf3xjd1mflZeaWF5p+bK86UIYL8VVDxk7LZV3gTTYAcolYJR+In216N7MBZk4bXsD22Kz0lIzEz9CiNhalOzsPltMN43Btrn58qUv+BRAZruFvjIp3mDlKVvBb46dX681IaRXeq2aSaLNTS7sacu9kcpU4uTF/LQh3CaPV5n7JNBSRYZTucrtMh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wQHfw7+uhkVf++WUDFlCi5p8MfYQSJhxkTPRi1OGmGevjab+OC73jifOWp3R?=
 =?us-ascii?Q?P/iXE2zxv/FmboettcqgjsJN3/aBKc94+Y2iodc2vIgu6wJHPgDzEhn0AG5u?=
 =?us-ascii?Q?R7j8UIH3nSfiwi/lA/FA3vYN7Svv4eFcQ0EyewmzACxsQu/KjwQg7mhvYiI6?=
 =?us-ascii?Q?xRpbfR+1y0rngedYr0Nrx06GMzQqNjtsAvoB/xXNS/XEtbC0fiz88rkir3pT?=
 =?us-ascii?Q?bKJ9D6D3rwnzlog3500hj+dSM5DelMs4ViP5N94+l+W9+x0bcrOKVk2KCFLk?=
 =?us-ascii?Q?E7GhJBwzWGToU37jJh6+6pLN/fspz4IM/Ul0ZRDh6ku8ODwFOGEpPWZ2eH1D?=
 =?us-ascii?Q?LB/CGgZnBVKrheJWTf7+AEsxfhBeeneh0NgOVbEK6g2maejRonYgSMcFPbIH?=
 =?us-ascii?Q?n6mblidhM79kg2XlKK0lfMsLfHhxoOx2eAzxx0SXPkET2fCUtkSLVbvm1c7k?=
 =?us-ascii?Q?UhYNm35tvLxVlbmL1qZvbeXMfhOjlcOhdQiAADhGZfZ9vN1QMT1G7rMRi419?=
 =?us-ascii?Q?l8ulBiiSrEG4jZlrRx1S5wIEKkrWmha7UzOW0Nnl4RW8Z3ABLrvVl6NVtnNz?=
 =?us-ascii?Q?C/Tvnv9FRq+O9CtvXptYEZKl2rZnXXURLN/UExnyGysob1aj3GpMrosESCBv?=
 =?us-ascii?Q?dZD40pdyfxyUnLPBHSXhvJWBpd2X7euSvTermP7U0DslnfEetL05jw/JPker?=
 =?us-ascii?Q?GvDnOK9gi0tlAI4HlskeI8TPy/EC8Aniu7x1IVAOtNIi/ADdtaTRgKpk98r+?=
 =?us-ascii?Q?VnyNT5UU8Luy46j7SJMkWd3sxZpRgWvWKjlv3W452lwWgkTAJZ8afetrin46?=
 =?us-ascii?Q?yKZGzoxr7eGjxwP1s88FNI0c3MEWOGcAO9Gcf3WBdteyJs9j1xQDGmTe0ffU?=
 =?us-ascii?Q?68nppGPwZUb8KrnjvZeih6AQvma9c4lIlUEYd8hABqtoXS2EvlnHDfIDt1xR?=
 =?us-ascii?Q?xJOb29aJgAknn+rvP6gihfclHCGKA2/HqJ8NzoQrO1v48F/CeXKQIl9fiwNx?=
 =?us-ascii?Q?84VA/xhQlov2xsY9vsmqvoE5mOTDmz8vpvE3ciIHLehe64q+YparyD/+Cjb2?=
 =?us-ascii?Q?IFuTtoP0jzbTMTbQ/lPcQQLxdDNV+kPmFIW8pqOLXP3vN24Mn98BAgqO/+a9?=
 =?us-ascii?Q?X1fjOwcyNY5j0P1ptjjLGl+qjLUvXfH41Voz+l+BxVKt6dNFpO20Hh5ZQ1fJ?=
 =?us-ascii?Q?FjM+Ly0hOh4Zk+ncsfYLDHdJlvLYrTeyGqJ/QKVR1ELor4rhZgt5FhCsNcJf?=
 =?us-ascii?Q?ekI21dI+UpAMAT3ATNm7M3q9SZfeo2B/M1l9Q8ovVsg50B2J5D9/f7CxTxC+?=
 =?us-ascii?Q?RRHH6qG5HhErA0To3GZen9iuVuSeQTEL8TIevvrDBdYe3JImSAimwTiE4yuu?=
 =?us-ascii?Q?Y/05aM6xEgMT5r7WI8+c6h9UsNIRdRj/WngnPXP3OedItSnbYQrxS9Ix4Twu?=
 =?us-ascii?Q?4Anwf6g6CWl4GOzvP2D7ReoKmWUGpw8cJQJyF9TLKpMDBo+l5Qye21Sxi1Vy?=
 =?us-ascii?Q?OwL4RaID9NlV/ZNCiq7qlHs2BU4+VjcEY+8mV+u+zJgB7sAA18SL1r6NGsSA?=
 =?us-ascii?Q?E3bVcWm88cDnCupGD1zgH5xhQTygOivPvxDQ/9D9Ou7orDG9g9mvTTHza32m?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3b3e59-0917-4c32-20ce-08dc45595847
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 01:35:21.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0537BY61OaRoyNGF23fzVIpE8C/ToAEpkj1OSyr1qqQ3+clmqkhZYwCft/9tGanbLZmPPHmWoBVe+cH5uYhCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

On Fri, Mar 15, 2024 at 11:29:33AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, March 14, 2024 1:39 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
> > 
> > On Wed, Mar 13, 2024 at 11:35:51PM -0400, Oak Zeng wrote:
> > > Since we now create struct page backing for each vram page,
> > > each vram page now also has a pfn, just like system memory.
> > > This allow us to calcuate device physical address from pfn.
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index bbea40b57e84..bf349321f037 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -576,4 +576,12 @@ static inline struct xe_tile *mem_region_to_tile(struct
> > xe_mem_region *mr)
> > >  	return container_of(mr, struct xe_tile, mem.vram);
> > >  }
> > >
> > > +static inline u64 vram_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
> > > +{
> > > +	u64 dpa;
> > > +	u64 offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
> > 
> > Can't this be negative?
> > 
> > e.g. if pfn == 0, offset == -mr->hpa_base.
> > 
> > Or is the assumption (pfn << PAGE_SHIFT) is always > mr->hpa_base?
> > 
> > If so can we an assert or something to ensure we using this function correctly.
> 
> Yes we can assert it. The hpa_base is the host physical base address for this memory region, while pfn should point to a page inside this memory region.
> 
> I will add an assertion.
> 
> 
> > 
> > > +	dpa = mr->dpa_base + offset;
> > > +	return dpa;
> > > +}
> > 
> > Same as previous patch, should be *.h not a *_types.h file.
> 
> Yes will fix.
> > 
> > Also as this is xe_mem_region not explictly vram. Maybe:
> > 
> > s/vram_pfn_to_dpa/xe_mem_region_pfn_to_dpa/
> 
> Xe_mem_region can only represent vram, right? I mean it can't represent system memory. Copied the definition below:
> 
> /**
>  * struct xe_mem_region - memory region structure
>  * This is used to describe a memory region in xe
>  * device, such as HBM memory or CXL extension memory.
>  */
> 

Ah yes but still as the first argument is xe_mem_region I think the
function name should reflect that.

Matt

> Oak
> 
> > 
> > Matt
> > 
> > > +
> > >  #endif
> > > --
> > > 2.26.3
> > >
