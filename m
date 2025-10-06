Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E91CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 17:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584A610E18F;
	Mon,  6 Oct 2025 17:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVxztZq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FA110E18F
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 17:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759772357; x=1791308357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T6xEU9YnDTqxOKXx5iUXZFxpYp3+mDIpvlzb7ilAssQ=;
 b=FVxztZq58fKo3p0P4iGdAqdUT4TGKb8578IoBl5mPIMhhQyZgNIwKu/L
 jU785QECiRILlgRzj/N7YDPXQiLZ2kVTVj+UxeHbGmw9RKg7YT/fRWs4D
 591JFYlBeGUaWiZewyaTS3JUE8ZhcQ0Q/lR0hnLXWrA19AI704ng1AZq5
 SzOAJyMie1GLgdDQveymQR490r2jU+onJ1pfK0ahykusEliWqAzLVWDYX
 F99IoyHGIDVeO643T2gl7ITU/rkMhzz72t8gxacmwfiEs2x5CG3dTT2DZ
 54IIbFSvr6yHoK/0zAeFpcIUoUxbSg+R+qMlkBxiuI8ZQv3u0TqDDPrWr g==;
X-CSE-ConnectionGUID: cKXpIemZRLqMKAu8jR9eew==
X-CSE-MsgGUID: VNU8U1j6Tg6Xi3ssqefATQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="79601053"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="79601053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 10:39:17 -0700
X-CSE-ConnectionGUID: bjpay68FRFCK69Y72yv/Fw==
X-CSE-MsgGUID: zH7K61qMQd+cPUYQzE7lzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185215553"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 10:39:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 10:39:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 10:39:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 10:39:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKH/L/qnZyoBwK+q4PCPtYxsRkJh7zlNFE2n18sl9wJ0BjuDAMnFgMXvDxC6iKjBbOnycZgM2uWM0vWEGyBkpnwiVlTvXvws3iCEzzduX8h5QA84SudT48LAJBASyGimInitjpnr/HemR+nTU33eaIZbY+gYHnDpNTNZ6T6mzggxENYFr6egFc8BYdzwcrAhGC9um2Wqq8tQ85ZtCoWXi1NLnqgJrQmVZf5laG5icPsg/dDNSURkJtL3f7IH9yUID3qM7IGH8Qu/tCBZSFK4pR39vWzJU+PhZPcQL8ay0HxQ9dJ0ZYQEvQeneILnnDD7spDwjaAbNFNMVCjuZM1XKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bwOeuUVRjXAwunQiEcRSp0EqcA8zI+qfgEKo4otymo=;
 b=VPQ1E3clAyMJRRh9BeiMWiAa7Z+8eJa3vEtfYLYTllaDTnMnTEjwoHScuAawUEJo+vbkzQIvBqLeBEp61xcjrSuz8U1vDZIQspdxipkCOokp3gQrTLgNwMIQzaQFkvZU7Mzxtd7NNkPnICOf13b1sYyNz2za66mJrjW37VUPCHazHJBjSOuXW7TdwveFHwYmHACnVEC/xSRc1qNIXUZuNXNcYGiWTJk79/7f7vCprCT5axdo8PfnnSqnXQv7UQmJkBt/INzg7o90Ito8ggD1sFKVtf8KxLvh2gmDDMjvMJMyQZgFYsIRESnCPzQRRCTnkA1oHKHeKq3nyFAlg9wvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 17:39:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 17:39:09 +0000
Date: Mon, 6 Oct 2025 13:39:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix copyright and function naming in
 xe_ttm_vram_mgr
Message-ID: <aOP-u6m84ol6iy6k@intel.com>
References: <20251004000425.2489291-2-shuicheng.lin@intel.com>
 <IA3PR11MB89874C1D695708E22C0C525CD0E3A@IA3PR11MB8987.namprd11.prod.outlook.com>
 <aOPywRsc9aw_p3-1@intel.com>
 <DM4PR11MB54565D54961E7F19539D7B2DEAE3A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54565D54961E7F19539D7B2DEAE3A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: c55bb8ae-613a-4bca-1f17-08de04ff4189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5+wvO5p0irTpdhOl+2jzhE3uypbaitpLR+SDz0OHNCpxXWcbTqN9aKu+gM6F?=
 =?us-ascii?Q?DHcHIqbP2EV+urOjlD7e7s2fyRQm5bGuFN3+NWT0iSNdGg6lFULtq3+evc3h?=
 =?us-ascii?Q?MknyxqWsogOkEluk41SsrQomlS+XexQAUdUV466Fi0jTM7LBLfrmt7ft45V3?=
 =?us-ascii?Q?TF+lFxSnAmBfMcceT24Nmo6jGmG+GpmesLEuRtHw4NrHFiymS+vZE10XU5vD?=
 =?us-ascii?Q?gOaOQr/5yIhc9EfUvG+yivACKILqy3PZc6a4Ho/CKQOJ59n/MLV9LUMNOuma?=
 =?us-ascii?Q?5fb9ZUmG8ciy3iullmq8y+Q4dMn4lFv5h0vwyn7N0KX/5MZDeqDxs+5zXfUI?=
 =?us-ascii?Q?TDE7QBFSUdxHYK6QOlnDYKCWuXEYxVDVd61CyMQRalI+dzSJ/cSQyxp9P+OX?=
 =?us-ascii?Q?gnfOMU/vJigM43mUXeDQx877rGQ5GR7XSmooZ92j7pHBZARzf+2TwZFEgx1V?=
 =?us-ascii?Q?n38+HQ+GXRqJQqGUR8byBXrK9AmfRFFkxehRknTYqlfPnYz+MjtwHfKYNvAy?=
 =?us-ascii?Q?OLAKp/j48BZDBUe7Y0TKvcOgBmNktE0zods3p5eNo4rSZTttQxR49R46FdWx?=
 =?us-ascii?Q?ntJS9s/LrX0doIZfFRmldVcZ/RpWOklz/OPrYX0sn0qEWir37mdqx36CzAgq?=
 =?us-ascii?Q?VTJJcfNG/S0omCTRzQljZH3BvxC9OKcFqYS05ueZoNuXsYBLSWtS0JhLgLmO?=
 =?us-ascii?Q?ODA6TP8Rv5rDYJGrq6hZISqM4C8O44/RWNJgBNEJ3dMKjmfL20vQmZPGIGsT?=
 =?us-ascii?Q?eledasMrPGcO845HGJSj+rrNv9cHh4Jpy/ixF9RnK++HXlDRWqb6ljzy+I5T?=
 =?us-ascii?Q?eUakOWfzBdfeK5RTYQKd6+ZI0Eamz8pqtNqG8NXixrUyuxMoeulxNx0b5V/Y?=
 =?us-ascii?Q?eXpM2kUL0hapi78cZSbNrV29f9mzxOMtBRLINRDASxiNoVBn0KFOj/oFGWB3?=
 =?us-ascii?Q?aPuiFviYka3IaiziVR/TecQdJrlTE2ths0SiK+er0yy8at06mj9iqKy0/FNj?=
 =?us-ascii?Q?6Zqrkprmh8c55P+ra6R33FAUYVkVV/LEWWtAvFN0yYeNofLAQPxE13xdMuUY?=
 =?us-ascii?Q?o51SdLsf8WyUcLE4etV4rXvJey1oId3SZtORipumCKUDNcrKfnhrFj5vUjMB?=
 =?us-ascii?Q?kAMMV/E5AXscoFq49ETm443XyLZLVHVWf48pMak1xQAdFl5bC+hspXJfre8z?=
 =?us-ascii?Q?kwOZFd0NzUVN2e+fY2ZQT0CDi+DJlak8BJAHSJ6zIUTv+BxcK3pljjUNBApW?=
 =?us-ascii?Q?BQMonVXhEJL4amRwVXgxNEdc0LWB3afzReFO+5Sgubzoh3YTR0CPpXEgkNIU?=
 =?us-ascii?Q?BIj7BZW6Ppp8ONsuJYOZ4rSAltplIfXg51n0wrOSltZsM+CTnYybBA2KFaO1?=
 =?us-ascii?Q?soSwhQMZfVU9yfM77C4Xt5J7k1qrIDq6y0EnTbtIskFZONLrHrDNIVCHQx9p?=
 =?us-ascii?Q?dCegofaZf0JG06uclcDExBU/BfmIj/wa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fqaaWQMrd/ZcHvZ1BYPQf8WGwC/KWgleqyw0njirwOkhlIcLK3D7s6+V7Mn3?=
 =?us-ascii?Q?IcotKGojMjgwstHupoynwU21EYf7sgbz9an8GvsScKTwqvZczVSMDmIatrBg?=
 =?us-ascii?Q?rkKU7Spc+yxXov4kPL9kYPBm0MCl0xWEKLk8vAeoRkoQ46G2i6oNlvCBbBCG?=
 =?us-ascii?Q?hKFykiFQ+MCjDEoAAMpzkInse29HELc10kMmwZLfYJZxk8gTEtC1Mblibdqh?=
 =?us-ascii?Q?9GiWktCAv5gagAuyr2iDnY3fO4nxQZzi47f+W5YW/dICJqjSDCfcO7oMJs+I?=
 =?us-ascii?Q?WM9ZVWCrLpLjx/4Ny4DMb+5Nnje0Z563slFtWxKbBq8jSXMvc/CEf3NX8r+p?=
 =?us-ascii?Q?2fF42UncDewTG/UJ5s0Q+X8WQLHdoUE5s75ezs5LbjwDqJy5RHn5AHNU9IDo?=
 =?us-ascii?Q?9abYSFuAnUb2aBlkdvf/x1/ChgNETtslt7oNPF1GCaorBfItYLknU/bhGhgl?=
 =?us-ascii?Q?PK5vIYJ+oxd6hvGdII7ab1MabxsYz4/nUHEOo0v3ffpOCK+O+Cvw/+w0px3g?=
 =?us-ascii?Q?z/3tG6xmyBmAmtoNx8+JJaA2JvHxpqXgAAupZ1SzOU13R3y0SXH/FP8SzivW?=
 =?us-ascii?Q?RIzawBSDYPipIDmYhfjHFy67yvzjbK/jThd4Z0M7ET8CVNIi5UpZuDsvqff7?=
 =?us-ascii?Q?J6oDMVxAsxdvp1fRj+AqTN80vMfhnJ2izFzH/Sg3cMGQ7hJeZZGXzzE1upvo?=
 =?us-ascii?Q?Eab9zmRtAqjXmytJ0u2VCEaAEetWM50GI3bCFh2xA0ESPniVHoOqlw3oWhlp?=
 =?us-ascii?Q?TtoQplpeZ3zGakws+k7rom0ZTQsMXZV9tgOEeWP3laeGtFcYdowgH4axfhOg?=
 =?us-ascii?Q?fv8KkhdBoKVeikIBCyB9uoIq+4b37x6HUCjhVFraqCezbjWIRzrt93qlpTJ9?=
 =?us-ascii?Q?4B7kz+kUDwL2TWN75Dy1JWdkMkFyy3WPZ9LFM8Hj9vySsdHM4cx3oqT2gmCH?=
 =?us-ascii?Q?KPvusCvihnh/woCeEpf3I4XoKoN68JnYl4ox9mUCuvgu2E06FLud/CW3WnP0?=
 =?us-ascii?Q?WrkVxtj3uLS3jSl0zgXAgBr18T5yvpq9k6W1rRBr2AnLk5bGMZRcadwq6RYQ?=
 =?us-ascii?Q?NNBDxB6rKSkpZQdTd9gNGI5+u6lqac4dkiavBuy62eRiezMipZ0DkyyouVzE?=
 =?us-ascii?Q?/GZY9ae49duXbc4Uq1dW9nHusb/48If3VPSdGnt3ThHa+RDxtMcK5mcG1+Gv?=
 =?us-ascii?Q?i0aeayvH+DrhapIQ5+5kUhx+aHqYOCSa40yzt7xFToKOXkiY00xKPYwXhFbD?=
 =?us-ascii?Q?KZdvxQbiUAxMighjEwH9amL5c01cmKe+eohHjDIVFAnW8dDct/QxY/bR0+VL?=
 =?us-ascii?Q?hzOER1sBQGei29HSoz4flN0yIRON2Wwk5MdEiKMpm9cx4UtXiFabN5n593CS?=
 =?us-ascii?Q?kDpUwCXoih16RalSGW8HvbjtICAc/R593AIEkyxW29p+h4ekNnsUX/DpDV8M?=
 =?us-ascii?Q?MEAfbbUgTEbIy08uBaQYcEXsFcBCAAszQ5M6eIUjW0r+ndVOElhW74Dr8i+3?=
 =?us-ascii?Q?mivZsbkSFU/nNVqwo1u2h52eJXuESLLHNnZHmXqlhM+QvHRJpRcaXA8OzXkG?=
 =?us-ascii?Q?Kp4XfTOKWopo4c19DKgwFIHFC7lrn03hNZtMlgxdypusGCKhFYONuj3voy2b?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c55bb8ae-613a-4bca-1f17-08de04ff4189
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 17:39:09.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bfxps/gLhQyEoG3oqY3LjKBkak+qxVj1nMNybVycru+x5n4trbTkyDdpjYJqNEO1UxEESCNxujjjUZU7snoeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
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

On Mon, Oct 06, 2025 at 01:03:32PM -0400, Lin, Shuicheng wrote:
> On Mon, Oct 6, 2025 9:48 AM Rodrigo Vivi wrote:
> > On Mon, Oct 06, 2025 at 09:19:59AM +0000, Gote, Nitin R wrote:
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > > Shuicheng Lin
> > > > Sent: Saturday, October 4, 2025 5:34 AM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> > > > Subject: [PATCH] drm/xe: Fix copyright and function naming in
> > > > xe_ttm_vram_mgr
> > > >
> > > > - Correct copyright year from "2002" to "2022".
> > 
> > patch pushed to drm-xe-next. Thanks
> > 
> > apparently we still have 2 more occurrences:
> > 
> > drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c: * Copyright (C) 2021-2002 Red
> > Hat
> > drivers/gpu/drm/xe/xe_ttm_sys_mgr.c: * Copyright (C) 2021-2002 Red Hat
> > 
> 
> Thanks Rodrigo.
> Will you take care of it, or would you like me to handle it as well? Thanks.

I would appreciate if you take care of that as a follow up.

Thank you

> 
> Shuicheng
> 
> > > > - Rename ttm_vram_mgr_fini() to xe_ttm_vram_mgr_fini() to avoid
> > > >   confusion with generic TTM helpers.
> > > >
> > > > No functional changes intended.
> > > >
> > > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > index 9175b4a2214b..9f70802fce92 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > @@ -1,7 +1,7 @@
> > > >  // SPDX-License-Identifier: MIT
> > > >  /*
> > > >   * Copyright (c) 2021-2022 Intel Corporation
> > > > - * Copyright (C) 2021-2002 Red Hat
> > > > + * Copyright (C) 2021-2022 Red Hat
> > > >   */
> > > >
> > > >  #include <drm/drm_managed.h>
> > > > @@ -284,7 +284,7 @@ static const struct ttm_resource_manager_func
> > > > xe_ttm_vram_mgr_func = {
> > > >  	.debug	= xe_ttm_vram_mgr_debug
> > > >  };
> > > >
> > > > -static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> > > > +static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> > > >  {
> > > >  	struct xe_device *xe = to_xe_device(dev);
> > > >  	struct xe_ttm_vram_mgr *mgr = arg; @@ -335,7 +335,7 @@ int
> > > > __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr
> > > > *mgr,
> > > >  	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
> > > >  	ttm_resource_manager_set_used(&mgr->manager, true);
> > > >
> > > > -	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini,
> > mgr);
> > > > +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_vram_mgr_fini,
> > > > mgr);
> > >
> > > LGTM,
> > > Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
> > >
> > > Nitin
> > > >  }
> > > >
> > > >  /**
> > > > --
> > > > 2.49.0
> > >
