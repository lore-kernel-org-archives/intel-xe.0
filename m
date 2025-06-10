Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF42C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 00:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D7910E455;
	Tue, 10 Jun 2025 00:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e15SzMy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC20610E455
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749515405; x=1781051405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ebm8TS+dcgxLn+JaCUFeyC+PzrcV85zNu4HS3ijaL+8=;
 b=e15SzMy0GzzUt39fT9lO/WOUSImteWgTRRvofv4UI3mr3PS1OXW33v+Y
 /hJ8ptM1Zcq5ZqI9BGOiCojrLHy03pnSFhG23jT5zD25GLu/ORTU0MpGw
 AtgfpRMfQWLCaUHKVd2GRHgHvPxVPWog24L+8+gjwqW2nKjTAWrz+m3PP
 lNtEyamRyxwBvkSzpwF4mjGoOBEM9Pr5Zw7IxiPIwTQhDJMfQnkBAu8AB
 Zfjbyvj45XqhjLM6sgYsPrjyH7hRNzjf3PaXQiBKwZXHNgPNa2oDP6E8T
 ENHYKtooWf1OmjfDV7z6Cw3Z3QvoI2ss0v1N1+Yu31Qq9p10+MXeCDaa/ g==;
X-CSE-ConnectionGUID: /tHPOuFaQLql7EipshlQ2Q==
X-CSE-MsgGUID: 9XRYhsCXSLmZmxv9NdwkkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="63013512"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="63013512"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 17:30:05 -0700
X-CSE-ConnectionGUID: MW8QZDhPQNOLjqWShCA94w==
X-CSE-MsgGUID: kTgSq95sQ1+w5VE942dUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="177599882"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 17:30:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 17:30:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 17:30:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.76)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 17:30:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVGMCCQLbYw72vNRd/Pmhg+KsD+zuy+aaLIYpDrAjs9lc0fSZbP8lg+C6jfZFrUjTI7YgOxa2sj4Jy0Cwqi0MAFg2eUzr4etgeNIxANbiceWquovUvlvoVelyWdtpCRAO7ia2FFda658u5KtEyTSKOsrXuCKbAG79CgycUIb3QuRw6g9wuO6zcaCTbu3xjJriTxu+UNUPQPMwAeJWsauBDm5R8F6224kNofj02uG8SJ8EAwD3iIwjEIZC8w45LD8H2gt9W1EG0/WSC8s4Zxtg8OU8/4SX5ogL8Bs0J+L5qOFhR/r9c36ChQCxbATpOU953WUe9tD2J60eE220OUdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqW+yMgwI+SFlLVtwr5mH8V3WTqynPH/J2VshXfmrZQ=;
 b=S46K4c7SESTwr2kdtPfBKplU4pFcSjZRKECQ/Cqd4uAwTvYYjWw7KGZE3iUXYjVSjze3ki86F9SuCq27RZUsublGO+P0ikZMpAWUFUrn31rVQcnb8YjIGnwKwPYN3os4Kh139MZ4/aUnjX+aW3syOtf4GRywVfyDr6LHpI67ahjd4wtFGPu5gpbaW957HXMw1eRWGhlRH4Zm7c5+eBFCzyUOOQLXn8n7j6SPnCKaWSn8uAz0akmbh99ijXoAr3v74bXujEJgPgNwL1u1OHck8BtUc/2Z72+s+Uei3DVsSqxbytq1Mgmc/w0/lTmXdmQZYYcIwKW+1Pno1/Hf96LWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 10 Jun
 2025 00:30:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8813.022; Tue, 10 Jun 2025
 00:30:03 +0000
Date: Mon, 9 Jun 2025 17:31:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Ilia Levi <ilia.levi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <koby.elbaz@intel.com>, <konstantin.sinyuk@intel.com>,
 <yaron.avizrat@intel.com>, <moti.haimovski@intel.com>,
 <didi.freiman@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Message-ID: <aEd86MvDFJXR+wnE@lstrano-desk.jf.intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
 <20250609215820.GR5080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250609215820.GR5080@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: dc694974-004f-4d78-0679-08dda7b5f0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fHl3MmPJrwqdkkDyhmwmHbeXSXgLUAgXtnYX9ML6g1te1wCEO3hKt2BmOSat?=
 =?us-ascii?Q?8Z1J+uYHWVYcPZLwB81V7FYOre3uSP1F5el6G+xnOcHsWT3jNOLtxgNswmBD?=
 =?us-ascii?Q?7Kr0QDXHuWJLFTgGhKbINGikDM+KPh3wZz2pvqryBM6tbvfM7Hxx/AFvSoge?=
 =?us-ascii?Q?NMBxlv/gtw3hDvsUlsfJ/RGt4XqrQrdeO2LdKYssuRhYDNUyCjWuZ1+TVR+g?=
 =?us-ascii?Q?iAY+KZ/mt8cX4xw4rlz+hPeWpGJH87o78SSp7AryMLRt+tP6xKaWCLkCcBxb?=
 =?us-ascii?Q?94aHhzW40dDbVY8rq/+A5OSDaJiYW7w+PTfYQa/XCjEANpn7tT2ewUvbVERR?=
 =?us-ascii?Q?bwFAeBenUHrU4VpzCC0MO2sTSQoZNPjos26lg0NPxaPbJDAAV4Zy7wJdorZi?=
 =?us-ascii?Q?MoDse0XFOBslPpXslJyPAg+TfZDxtgqAlfciQ72uiR18/7cxasv7wUyPCnUU?=
 =?us-ascii?Q?as8JXvdQlhEYPbdnVXuB2+aV8hKC1cuknNPUgg/bBloakwQjdnkQXLzb17A/?=
 =?us-ascii?Q?OALD6w23AJXLDNGeZC8f8yDxOaSBACGR8RIzDM8WbmE5aWfjPz+IpfqVc0aJ?=
 =?us-ascii?Q?upoCONXRp3PeX1TXhGMPvt9VOlHbCnM0aXNPKJktfX8tC/mrvga0h2FGwpE7?=
 =?us-ascii?Q?sDdMUejm8JN/Pb132JoJpXacJdOj9sZmgOeJOaDyGxgngqbGY4YqTOy7aY+D?=
 =?us-ascii?Q?VoH65zI77bqAD8PhiYykI6T/7qAB/E3lf309v1cgcxteiEZJf1Ofg/4CLMo+?=
 =?us-ascii?Q?U3d+suyTeyE7UKNybUP+BakY+T/354YHOUcoZk+adUF8pPVMp7YqKfixnLA4?=
 =?us-ascii?Q?/fOgYL9+eWQhZdiKeQI/z0IRhhb2q/D7mh2Pel5egmdxLTVGqbc5wqvwyQiJ?=
 =?us-ascii?Q?qu0V1bE/+U5IVRy0z5FHUP8TUAlCwf2aairivoUHYvqUnm9tFZVJhHPIhonr?=
 =?us-ascii?Q?fxcW6kj/UVMXgNAfWdI4kQJC2bIXPgvdqWKwOhThAbcXuMqEeIlYo8zBgIjr?=
 =?us-ascii?Q?eRX9FJIbr0kohsxrvlJCqIpINhKReVwPFLV5LNLYpup9N24NDtxJLXgEb9zz?=
 =?us-ascii?Q?/cwt/sx/7VuVTk8/xANSh+T8F7u/DyXbgFbeLcdoHpssCPhPH8Goc+ZmOWY9?=
 =?us-ascii?Q?hlWZVbuMbzdAWJTUKHjjzezrG+OdkYew4PA8Bu2wDcapwy3YvFpXee++HNCZ?=
 =?us-ascii?Q?1RQ0gf39JuMpQHFyPb+ekeghie8u+scg9me4XKFviU4MycGtqwgf4u8fBDTW?=
 =?us-ascii?Q?IsrZrINfyYLL/l8AGJIoKTW9sLQx92sfgxOC+auB+FKlPdNG9WIKWgEZipgO?=
 =?us-ascii?Q?V77l/WOS27ah87EvmgObGTKqvWWNzHkPeI1JkOLtsC69x/nAv7pVPSDT4wAt?=
 =?us-ascii?Q?4PvDMc3dcqBTlY1ZLSzgaJ04bVE3+6ey6P4cWF0XZb0kXKx8PsJ0/VyN1zIE?=
 =?us-ascii?Q?0bG7XE+vWfU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/fgPX+cIzWAaibjUAUlVGqgnhP3IOZ7ojyYfvjuDuLTfsxynqdwfOb30FkR?=
 =?us-ascii?Q?vbFLvxQpUD2JYZH75vr8ztXxNyCZyxruQwC2rFN7AJHfBH3b+ojn0CV3prk6?=
 =?us-ascii?Q?Pak0Vc6kaqF7bq27TMkGcO+FXoeEPj+XlH7vcndoHbOuPFYnfvpJCJS+cJkn?=
 =?us-ascii?Q?NCq4B37g5q3jJJRG6jytnFtmnXX03InSNNSHADdliYF7iZYreulnpepRpbKB?=
 =?us-ascii?Q?U80Fod8Vk8aSPMDNdP7vXXdNvDtuz3F0MJTWfJVRmRlJEaxNk4jKI+lCOi9x?=
 =?us-ascii?Q?mrjUYabg3EhNFL5qQqF/o8yKT6vvCstCaCEnBR6DpHi9n447BgPneJmE78+M?=
 =?us-ascii?Q?gIjhGxvQx1anQVOLtI0cW8sDOO3N3UtChTFut554EYab9Mmo5nMbvvnZnbNa?=
 =?us-ascii?Q?tkwNRSjptPxQmw0gbYvMh9GrVIa7LbVDz4/X3hWCk5O6aokwHPXY5rHdXwfM?=
 =?us-ascii?Q?7x0PQNDplo5XosRVCXSPGpGp+DWMO9w/DmCj411wzwRO3vV+WEe7q0F7gR6p?=
 =?us-ascii?Q?QxqnjLoOBaEFMZ5QD8b4voX8YLv8MrVKehXcW+YlALPinUbC6pkL68PTWWzF?=
 =?us-ascii?Q?yApoqF3HJgXIbySRPa6sTc+VYmPqPdLDiefXTo2/YkGDRQN4zaUkcVNmnt+c?=
 =?us-ascii?Q?PoFpNQMB6/wsh7GruIpqRnx1hUKjxhGdOW4N9l+gtG7Esqorop0NsLN17rhj?=
 =?us-ascii?Q?ImbtH8TayJBX1yJNoVccG7chw+DJyxf+BCRXeA3zSnN76QzcIrvBZlEh9AYu?=
 =?us-ascii?Q?anyHdFZZwv5/TtMO8P6t8+6nlKM6Jhfex8FBZJ88IFUc+bliikWsLJZyw2ON?=
 =?us-ascii?Q?pELVD1egvH5xqQHnoie/Gg02Q4ADNHz3ppdtVymBNOLqR/DwqYjxe07bDLHS?=
 =?us-ascii?Q?XD1Z23gVPPmVgcxQChreFmH1QIMNuRbOcDQY4zbL4zX20wK10MBkqtOAjEoF?=
 =?us-ascii?Q?+FJl37p+QEf1pHoFWvQFCinMcmxwkrffCwz5zfNBEXXDTm6l/H4q3AsyQS+C?=
 =?us-ascii?Q?kkIOA3Ga8m8P/14MruPte4GFOKyx/hPIg2AdLOCBRZaexy694F/nDlpXUUFb?=
 =?us-ascii?Q?yH8oJyF0lrA2GyypcLwd6oE8wL4rKOI3lDf6mOOdi6yTMGKEMznbazPPs0Kg?=
 =?us-ascii?Q?Cz9vu6m66GajLSh0P2n2pAq3fRPSzQF+gpukc4MTkDuIr/tcNv29vW+eEbDA?=
 =?us-ascii?Q?tN+T8wkP0vJkKjPkEcZGgcoWriTBO8b1cVzkT0GuMnvLgBznwxYPBzc8p+rN?=
 =?us-ascii?Q?Al49PBW0OCTfHlUQZj2NDLKnX4vCpVt4J3AnDcm6TNKy8f81AQKblIK9sGNI?=
 =?us-ascii?Q?OcfbcEnWbbMFwWRiIbIqLDhuYidBGhZK17mGd5jfUJZAv4qnYkcen/kx3Jpv?=
 =?us-ascii?Q?G+gEQSSH64l0HhJG0TGW7YqGNpWppXk5/KA2ovWUdGXil0y0qhMsvcm550+h?=
 =?us-ascii?Q?gl/9Zpfb3ryP3t2JbtC6Vz9Qk3oDaYhSK01aLfJmQdgNjsw4mWNXezj1cLGJ?=
 =?us-ascii?Q?zGv75yooL7vGabVf5rB316j5FiWo/5QY4b5y89Dx27zpzQxi9Lrt50LkDDCl?=
 =?us-ascii?Q?apwhy0aIZgQ5ZSmLZ5uHWcM0A8RiMTJ3Tf6uzj/x0himO3TeaIU4s4V1vOcC?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc694974-004f-4d78-0679-08dda7b5f0e5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 00:30:03.0912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNOBIIru+NcrA+TGsZhoqzCRaluX/M2fENUine0pqJCvksmy0TMixwBAgBtLHG5ePSEPXfGpdmti9CtW1Fyjcg==
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

On Mon, Jun 09, 2025 at 02:58:20PM -0700, Matt Roper wrote:
> On Mon, Jun 09, 2025 at 08:46:19AM -0700, Matthew Brost wrote:
> > On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
> > > Allow the driver to expose hardware register spaces to userspace
> > > through GEM objects with fake mmap offsets. This can be useful
> > > for userspace-firmware communication, debugging, etc.
> > > 
> > > v2: Minor doc fix (CI)
> > > 
> > > Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
> > >  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
> > >  3 files changed, 160 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index ac27389ccb8b..78542de0d48d 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -10,6 +10,7 @@
> > >  
> > >  #include <drm/drm_device.h>
> > >  #include <drm/drm_file.h>
> > > +#include <drm/drm_gem.h>
> > >  #include <drm/drm_pagemap.h>
> > >  #include <drm/ttm/ttm_device.h>
> > >  
> > > @@ -161,6 +162,19 @@ struct xe_mmio {
> > >  	u32 adj_offset;
> > >  };
> > >  
> > > +/**
> > > + * struct xe_mmio_gem - GEM wrapper for xe_mmio
> > > + *
> > > + * A GEM object for exposing xe_mmio instance to userspace via mmap.
> > > + */
> > > +struct xe_mmio_gem {
> > > +	/** @base: GEM object base */
> > > +	struct drm_gem_object base;
> > > +
> > > +	/** @mmio: The MMIO region to expose */
> > > +	struct xe_mmio mmio;
> > 
> > Any reason not this is not a pointer to xe_mmio?
> > 
> > > +};
> > > +
> > >  /**
> > >   * struct xe_tile - hardware tile structure
> > >   *
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index 7357458bc0d2..6bfa915a9602 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
> > >  {
> > >  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> > >  }
> > > +
> > > +/**
> > > + * DOC: Exposing MMIO regions to userspace
> > > + *
> > > + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
> > > + *
> > > + * This can be done as follows:
> > > + * 1. Define an xe_mmio instance that represents this portion.
> > > + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
> > > + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
> > > + * 4. Provide the fake offset to userspace.
> > > + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
> > > + *    must match the size of the xe_mmio instance.
> > > + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
> > > + *
> > > + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
> > > + *
> > > + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
> > > + * Make sure not to expose any sensitive registers.
> > 
> > This is no secondary issue, it is a primary one. There is no way we can
> > expose entire PCIe MMIO register space to a non-root user (a root user
> > itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
> > btw).
> > 
> > What is the requirement for this patch? I know on other PCIe devices
> > I've worked on we had similar issues where we needed to expose a subset
> > of the PCIe MMIO register space to user space for kernel bypass
> > submission - everything we needed to expose in that case was 4k aligned
> > + tied to a single process via a KMD config before mapping to user
> > space. I suspect to do anything safely here, somethine similar needs to
> > be done.
> 
> I don't think it was the original intent of Ilia's patch, but I can

Yea, I think I figured that out after I sent this - the xe_mmio
structure through me off here as this structure currently only exists in
the xe_tile, xe_gt but I'm assuming now xe_mmio_gem_create is called
with a xe_mmio that is subset of either the one of those, which I can't
say I love this as a design - I'd rather have xe_mmio_gem_create called
with a pointer + size to avoid confusion.

> think of at least one feature expected on an upcoming platform where
> there is a page or two of registers that the hardware team designed
> under the assumption that they'd get mapped directly to userspace in a
> read-only manner (i.e., information read-out only, no control of the
> hardware).  I think some of the internal discussion was considering just
> going our own direction and exposing the contents of that register block
> via an xe_query instead since the contents likely wouldn't be changing
> after boot, but if this infrastructure exists it might be a simpler and
> more natural match for the hardware design.  +Cc Shuicheng since he
> might find this interesting.
> 
> But if we're allowing this to map registers to userspace in a read/write
> manner (or map any special registers that have side effects on read)
> then we probably need a bit more scrutiny of the specific use cases to
> determine what kind of permissions are required, whether they're safe to
> access in concurrent / racing manners, etc.
> 

I think rules basically are - cannot read another processes data, cannot
issue a write that has any affect on another process. I'd assume if the
hardware is designed with mapping MMIO space to user processes in mind,
it would be designed in a way to not violate these rules.

Matt

> And of course since this is new uapi, the regular graphics upstreaming
> rules apply and we'll need an opensource userspace consumer fully
> developed and reviewed before we can merge the kernel changes.
> 
> 
> Matt
> 
> > 
> > Matt
> > 
> > > + */
> > > +
> > > +static void xe_mmio_gem_free(struct drm_gem_object *);
> > > +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> > > +
> > > +static const struct vm_operations_struct vm_ops = {
> > > +	.open = drm_gem_vm_open,
> > > +	.close = drm_gem_vm_close,
> > > +};
> > > +
> > > +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
> > > +	.free = xe_mmio_gem_free,
> > > +	.mmap = xe_mmio_gem_mmap,
> > > +	.vm_ops = &vm_ops,
> > > +};
> > > +
> > > +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
> > > +{
> > > +	return container_of(obj, struct xe_mmio_gem, base);
> > > +}
> > > +
> > > +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
> > > +{
> > > +	struct xe_device *xe = tile_to_xe(mmio->tile);
> > > +
> > > +	/*
> > > +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
> > > +	 * In the future we may want to store the physical address in struct xe_mmio.
> > > +	 */
> > > +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
> > > +		(uintptr_t)(mmio->regs - xe->mmio.regs);
> > > +}
> > > +
> > > +/**
> > > + * xe_mmio_gem_create - Expose an MMIO region to userspace
> > > + * @mmio: xe_mmio instance
> > > + * @file: DRM file descriptor
> > > + *
> > > + * This function creates a GEM object with an mmap-able fake offset that wraps
> > > + * the provided xe_mmio instance.
> > > + *
> > > + * See: "Exposing MMIO regions to userspace"
> > > + */
> > > +struct xe_mmio_gem *
> > > +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
> > > +{
> > > +	struct xe_device *xe = tile_to_xe(mmio->tile);
> > > +	size_t size = mmio->regs_size;
> > > +	struct xe_mmio_gem *obj;
> > > +	struct drm_gem_object *base;
> > > +	int err;
> > > +
> > > +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> > > +	if (!obj)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	base = &obj->base;
> > > +	base->funcs = &xe_mmio_gem_funcs;
> > > +	obj->mmio = *mmio;
> > > +
> > > +	drm_gem_private_object_init(&xe->drm, base, size);
> > > +
> > > +	err = drm_gem_create_mmap_offset(base);
> > > +	if (err)
> > > +		goto free_gem;
> > > +
> > > +	err = drm_vma_node_allow(&base->vma_node, file);
> > > +	if (err)
> > > +		goto free_gem;
> > > +
> > > +	return obj;
> > > +
> > > +free_gem:
> > > +	xe_mmio_gem_free(base);
> > > +	return ERR_PTR(err);
> > > +}
> > > +
> > > +static void xe_mmio_gem_free(struct drm_gem_object *base)
> > > +{
> > > +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> > > +
> > > +	drm_gem_object_release(base);
> > > +	kfree(obj);
> > > +}
> > > +
> > > +/**
> > > + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
> > > + * @gem: the GEM object to destroy
> > > + *
> > > + * This function releases resources associated with the GEM object created by
> > > + * xe_mmio_gem_create().
> > > + *
> > > + * See: "Exposing MMIO regions to userspace"
> > > + */
> > > +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
> > > +{
> > > +	xe_mmio_gem_free(&gem->base);
> > > +}
> > > +
> > > +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
> > > +{
> > > +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> > > +	struct xe_mmio *mmio = &obj->mmio;
> > > +
> > > +	if (vma->vm_end - vma->vm_start != base->size)
> > > +		return -EINVAL;
> > > +
> > > +	/*
> > > +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> > > +	 * whole buffer from the start.
> > > +	 */
> > > +	vma->vm_pgoff = 0;
> > > +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> > > +
> > > +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> > > +		     VM_DONTCOPY | VM_NORESERVE);
> > > +
> > > +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
> > > +			       base->size, vma->vm_page_prot);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > > index c151ba569003..2990bbcef24d 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > > @@ -8,6 +8,7 @@
> > >  
> > >  #include "xe_gt_types.h"
> > >  
> > > +struct drm_file;
> > >  struct xe_device;
> > >  struct xe_reg;
> > >  
> > > @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> > >  	return &xe->tiles[0].mmio;
> > >  }
> > >  
> > > +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
> > > +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> > > +
> > >  #endif
> > > -- 
> > > 2.43.0
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
