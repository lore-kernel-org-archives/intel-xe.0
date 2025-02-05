Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5A0C02198
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 19:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1881010E3B3;
	Wed,  5 Feb 2025 19:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWpcJ7ZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF4410E3B3
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738782206; x=1770318206;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A7nzzJmW/Fm3rrW+O9UQ/joUMeuY5IwcBvfnAhbhsRY=;
 b=eWpcJ7ZN+2xgdnBt3U6UTyYitOAEP3dxIXAk1FAPfOQ996g7i5z/pNaL
 sd4KWBgufIROJPQmTndsYIp7VGRo95VmGrfD/6nMqXe66rbbao0gXLf/I
 y73I4L9sGHyBGI7q2S51VbFgCJ3NWVVDvvIt2PX69Ea1E2wgueYq3+l/V
 aLA9kORD5PN0u6JDWqSQrN3lY3r0NDoHuYAMoOHLjceLuLmpAcGREvrvU
 60btKklSRYXyMAiJ5zydfX4hf8Rg7KofZoulnS5sIRzoCLuoPeswhNHTQ
 sjAJFOOtwCmPvbRpp2RXgOm+5usisxKiatNnM1LmYicRDvkfyXUc8kjVZ w==;
X-CSE-ConnectionGUID: c4u+7QOXRQaeeS3qkFYtwg==
X-CSE-MsgGUID: MdQ2K3pOSz+lIBKQALMclQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26967379"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="26967379"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 11:03:26 -0800
X-CSE-ConnectionGUID: 6toacun8RzaXktUxSDNM4g==
X-CSE-MsgGUID: 6A2hskXPS6KND1FIPpqjhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141886963"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 11:03:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 11:03:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 11:03:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 11:03:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erAtPTGnNKsDJ+Hi3ICz3jlySjRba4Vk6xwNNfLo532+yZ80KwpX4Yp1+2q76Pl8hqfAzzdx/rHv6gVXn0ocl61ayZlJBmScaL/kNp2Krn2nl32qEUk7xnzsfj1RLackdQhgDXknN2rFn/lybkuDNDUOHFMR0tYNd0CCJpRR9Y3IamimkMW0LvF2dVtYV3YCqtxiIuEJsXylXVB4vu6SBUkqglOygpo1i6A4rRGPSPmDXJ8piKSOXIUjdK7yaMvh9yikSC5DE9oYB8GgYDVwFzhnuiCYn1VxhrvkEUvZqsK2IBodwFOtUv/cKil7wqQ3vXCkzgsay57icy4/mlbcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMm9EoRz81CdZSyNACR+mNPSXIkJTv2rg3XhfCVpr00=;
 b=cGmRt92gEiQMKQ6NFUGcRAqN7CbvG1ZIN3gsuQ7XKHXnaQnzyd3AdZZrOfWzs/dA/i37UTWWYjDtBlcugS5MpRflbCesVcFpQXrYlsE+bDn1XOOFiSxCEX3utlE98DHg3dLMwKrucJ2n48jOaqGjuUM/uUHdD8mIq1fRYOhXehcnMzSDa+Or5hlInoS1fbCqNs3Hob14+UeYspTsJhOSqtKJuRDGO4tNesCEdy2cs5GnlNHfpDZBtme4nikkzwieQKOzdG7wMMOQVZo4JU5+TOYJ+HkUScHHXDGmzBMF2rOSROr3kM4ea4I9X7P/JwLrPzR+neOBa+j9BLB0Sd0rjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7446.namprd11.prod.outlook.com (2603:10b6:510:26d::5)
 by DS0PR11MB7957.namprd11.prod.outlook.com (2603:10b6:8:f8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Wed, 5 Feb 2025 19:03:06 +0000
Received: from PH0PR11MB7446.namprd11.prod.outlook.com
 ([fe80::ee69:297e:231d:4d3a]) by PH0PR11MB7446.namprd11.prod.outlook.com
 ([fe80::ee69:297e:231d:4d3a%3]) with mapi id 15.20.8377.009; Wed, 5 Feb 2025
 19:03:06 +0000
Date: Wed, 5 Feb 2025 13:03:00 -0600
From: "Olson, Matthew" <matthew.olson@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Harish Chegondi <harish.chegondi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 5/7] drm/xe/eustall: Add EU stall sampling support for
 Xe2
Message-ID: <Z6O15FCR1YikuG0I@bolson-desk>
References: <cover.1736970203.git.harish.chegondi@intel.com>
 <b192bec80378c3a7532fad983d910b896846fc3a.1736970203.git.harish.chegondi@intel.com>
 <855xlwgasx.wl-ashutosh.dixit@intel.com>
 <Z6K70DoXZyfTN_eD@bolson-desk>
 <85msf1dugy.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85msf1dugy.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To PH0PR11MB7446.namprd11.prod.outlook.com
 (2603:10b6:510:26d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7446:EE_|DS0PR11MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc5cf59-38d4-4aa9-1406-08dd4617b951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SqMzajQNPGIPHGfMN/KxF+Mt+KqhWrrt4IZvXTWurl51mUQ/wgBd26exSW5L?=
 =?us-ascii?Q?hCfz50aoZCxxzYguOBUvT245iSmIsd/zEJtCNhpMkNUmWHIzW5oDCFlNa/PC?=
 =?us-ascii?Q?kLBewzX0Lux9nnwsFjZSddFNWdJH5r5oinyNr7Y63ROA8ALUPPF/QSBsb5IW?=
 =?us-ascii?Q?02g3XjdQGPUV4Y+qcjVoaTxZXqG3V+y9mr5Ho+ttl83c9jhDxZuYnzaCrzKL?=
 =?us-ascii?Q?NPIPuaRvvmiYPgaVg/a5DhTVDl5ScFoQn2SQGRGTpCdWi1+YKQ3IENcfmEl4?=
 =?us-ascii?Q?hePTyJjmCDoQF4LXSJFSG4zGE+OK/Xaj90IOdMnHBZZ40yQZhRD7/Yt3kguP?=
 =?us-ascii?Q?2QDvaB1FuUMucI8l65Ux7RTn86tRsRSa5duM8L0pxuY7PuwKXtyDqIhcJPiw?=
 =?us-ascii?Q?KeMiTT1lNfmGAWFYGj8MAh3pla7OzDjWtBGLE44QpTIPRn+ATrkVca9xZ70e?=
 =?us-ascii?Q?4Nq6LV+oaH3ZWZl+lPtaHpsh9zYJneLbCvqZ4rBlfkOy+dxOVIEmIaFwp5vN?=
 =?us-ascii?Q?JUDajaL27WeWg0sqyCQaoG+Pj451DWzNLY8FOAY6MLcx13m3ZAwH4Wfo7wRb?=
 =?us-ascii?Q?UA88bsY6u1fr0Pzi2rrX5gYdwrZLZ59+bJs/XvPhWwpot5tb0hObGf7aylnn?=
 =?us-ascii?Q?UnZ1XjWZecFSYAaTTU/DuEMChqzLOJwLf8XXzoZq2s6JUOoLia9PduEvppSa?=
 =?us-ascii?Q?weVTj7xIBs6K0tG3/MRu3bdGXR8qub7ajRplvD648A/K++tWzYkjiYf/wCYZ?=
 =?us-ascii?Q?xVi/cpFxxjFJOx/XnUnAI1WLPyfzc/J3G9GT8VQSoLSuirUiLvdT7eQL07si?=
 =?us-ascii?Q?Owh0eXSpF6QJtW+xZHRrFIeebxRTSOukoPD8m4jR4iHPUKz8kRGgofh7QHe7?=
 =?us-ascii?Q?ninx6zKcwkmhY9Yf+rEAIJ/gjs7Zqa5pB6ctJvv1MBVPC51A4D7Vp5/Oihu7?=
 =?us-ascii?Q?ejw1s1KsPn4InXblonNuSeWC3y3bcw6S0W+9o2p6H7ofRLHEuqOcS3KW/Eq8?=
 =?us-ascii?Q?7RwWcEUlw4edpw7AoQN+wnPUahJSl/FppNSOWvnz0MSElrnmEb3169ZtuqV2?=
 =?us-ascii?Q?T7CWWS43KnA/JMKJ8/gWBSkkuY6fIh1yEanmAoGGNLcsoJxz8sNTB0bXZcBX?=
 =?us-ascii?Q?YJT3HAYEpZNyOYVzkZFg/Iv0IJPQCaTYKVr6E6n/smyeuBWUHaujJgucLMPR?=
 =?us-ascii?Q?nNDV9rK8DRXUNXyNd9vrtc3tqeE982fXaKQbT2EY5snbzLL4Wh0bKybfeTDx?=
 =?us-ascii?Q?DyXYgvScDp7P9zU6IXjxv3P1zfOYuP4owwWtkv74ece2x6LTkjSOECXPfNoN?=
 =?us-ascii?Q?+MkSq5WOcs36WI6fup9Fnomfa6JEfOxIglnACr0e0OEfFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7446.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+OOTFx4aNi8xMeaFRkBIxWOn7CYu6wIOUtJlVuo/ZuNDLnWYPHF1+QUXBuji?=
 =?us-ascii?Q?ug8CPxNeUUbWJiAC8wqvNBXU/AXFWSuKtrSp/PLFFDyTprJDRq090JF0f9tb?=
 =?us-ascii?Q?BXEx3YzS5Hqf96CignkPKmcECOysAEEwcfJSpOQLl3rIWhpNhvAFCmgt/6za?=
 =?us-ascii?Q?0tjulQDd+z4936yc3jHYZMCJayRgbgJnyXRpXuyih/HguBJBiwFpuyJ1qv3y?=
 =?us-ascii?Q?YMN2m2BUr7EvZnUPvfXl1E5yqvk7bttXhuw1dBlA6JhwIZliKfoEhwsIOaA4?=
 =?us-ascii?Q?BhqcntQWHpi3I0j07ZAyPkjP+fpcFQxRlPMITSTi19czEqkTuWUxX4KXaTGm?=
 =?us-ascii?Q?rLVSk+ejfLTkSD4XQXXd0YArOMRiJKEmAkUoCeaSNmBDwttrn4eLEQpLShN7?=
 =?us-ascii?Q?2tVcQ9iL3GN/thWvedUoeJm2DPP4qtYIYVUJ5SkkxeqH3xDhD3KpN2qLCDiQ?=
 =?us-ascii?Q?/VVpHrGVdaS0rHCrT0IuAX3XJZZuLiu37GeVMlkDVF037OKmRG67bizitm4I?=
 =?us-ascii?Q?Yum3CIy6Q06Yv3n6Cb3gISw5OnZY04N8kZ+eHK6Tk0GdA3AhbXqgcfaQGRF3?=
 =?us-ascii?Q?uAoW16RjGBl4pCJ54COzB8qukGOhHsMNWE8JI3F8gTbNZRDK7QNvCvw8WbJK?=
 =?us-ascii?Q?1ZtQX+pi1uYxSkxgbXhj6e5Dp12VCHS7PwATYw3aATY+3lfMS6SW98IGiCdX?=
 =?us-ascii?Q?bpiCB+KY7spPZqLY/PgT936Fw6l/ZY68K702iizWABQ0vngDgedS5Hv7l5sT?=
 =?us-ascii?Q?uzIQ0K7pmlzdnfcAA22aTheT2fxBliJ4HEDtCoV84DW5wFRHt7kgpRpivqGT?=
 =?us-ascii?Q?ZDECSJML170+liQqkrtUYOeox/nAXW/TG8TieZR4PSDrdGDqF43YAPPD+RVs?=
 =?us-ascii?Q?w4FlJx/t84U+AFucjjE4WAZrf+o4dCF6ORjMlCXAnmeUnSiS/u7yCnf4mGwS?=
 =?us-ascii?Q?NwKklWMIUcXlVJ6WhFfR955a0mIc3Wo4KRnzwza5aZ9e16XDDa4t6rNraL8r?=
 =?us-ascii?Q?4w5to8wNnTXDwNEYgsOTmPIQfeLf6edd+welzr4YxDjt0nV79MmpCJu8jVDz?=
 =?us-ascii?Q?VSHBpUXEYipehY6YSXjzj1iq4EP9n1FFXlgLUb/K/HHANrwCCZV5IiaK6tVV?=
 =?us-ascii?Q?aGgucOPoikvfz4xRGdKeN9HpyCUsgItFav1HSQqpx8mnj9YaFGdpy8iv2iSz?=
 =?us-ascii?Q?pAnwOSESBeHZHXlfyhaE7+bsDYHQ0YOyEtlllNetha1zmi082Is8RMNRzWFM?=
 =?us-ascii?Q?XsO5Pt+hbu3velGtTtdXIWa4eeerRgolMle4m8yg6Rpqzi/s64zTyhK6XJ/n?=
 =?us-ascii?Q?s9JoYUpQq8oZCithJzC4i8j0ODoqTeUKfZtbPTqSq5QY8HHipuyEpp8+X94P?=
 =?us-ascii?Q?m64VQWg/UWufPExUspPGcJWs2GzFJSfbyUO7sOgeSEJKvK1rBIxJJ++KaVqK?=
 =?us-ascii?Q?S1ByiMNP76pWetU25J63n3uSW/9JRanDi0t41tBjC9DOAFsZTa3RNRBa1a70?=
 =?us-ascii?Q?Ur1FSfQ/jqwSDPzcYZyp4VgnIPnHQLfqpXc7zu1EKaIBpFOSS3gLse4el+Ri?=
 =?us-ascii?Q?jKdMlkQmLjLd1f/vx657gj/E4o6JarHtjJDMwKEf3ZbO6hkEa+rn9OIB5/Qr?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc5cf59-38d4-4aa9-1406-08dd4617b951
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7446.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 19:03:06.6235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uARuo51+9TD4MlcR/9ihJJvCIMKK/QIFxjzHWf6w/2SGH90BxTaDPYc5R3Nwv9MNgM0aiA3z9TH0bxwfJfwWIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7957
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

On Tue, Feb 04, 2025 at 05:57:17PM -0800, Dixit, Ashutosh wrote:
> On Tue, 04 Feb 2025 17:16:00 -0800, Olson, Matthew wrote:
> >
> 
> Hi Matt,
> 
> > On Wed, Jan 29, 2025 at 08:55:42PM -0800, Dixit, Ashutosh wrote:
> > > On Wed, 15 Jan 2025 12:02:11 -0800, Harish Chegondi wrote:
> > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > index 437782f8433c..d72f80a9dfe4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > @@ -73,6 +73,42 @@ struct xe_eu_stall_data_pvc {
> > > >	__u64 unused[6];
> > > >  } __packed;
> > > >
> > > > +/**
> > > > + * struct xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
> > > > + *
> > > > + * Bits		Field
> > > > + * 0  to 28	IP (addr)
> > > > + * 29 to 36	Tdr count
> > > > + * 37 to 44	other count
> > > > + * 45 to 52	control count
> > > > + * 53 to 60	pipestall count
> > > > + * 61 to 68	send count
> > > > + * 69 to 76	dist_acc count
> > > > + * 77 to 84	sbid count
> > > > + * 85 to 92	sync count
> > > > + * 93 to 100	inst_fetch count
> > > > + * 101 to 108	Active count
> > > > + * 109 to 111	Exid
> > > > + * 112		EndFlag (is always 1)
> > > > + */
> > > > +struct xe_eu_stall_data_xe2 {
> > > > +	__u64 ip_addr:29;
> > > > +	__u64 tdr_count:8;
> > > > +	__u64 other_count:8;
> > > > +	__u64 control_count:8;
> > > > +	__u64 pipestall_count:8;
> > > > +	__u64 send_count:8;
> > > > +	__u64 dist_acc_count:8;
> > > > +	__u64 sbid_count:8;
> > > > +	__u64 sync_count:8;
> > > > +	__u64 inst_fetch_count:8;
> > > > +	__u64 active_count:8;
> > > > +	__u64 ex_id:3;
> > > > +	__u64 end_flag:1;
> > > > +	__u64 unused_bits:15;
> > > > +	__u64 unused[6];
> > > > +} __packed;
> > >
> > > Same question about whether or not to retain this struct. Retain it if we
> > > want to document this information otherwise drop it and just keep sizeof.
> >
> > I'd prefer to keep them, as I've personally found it convenient to refer
> > to them while while writing the userspace reader of these samples. I'm not
> > aware of any other particular place that they can be found, other than
> > maybe some other public repo that uses the i915 version of this interface
> > (IGT, maybe?). I'd venture to guess that others trying to call this
> > code are also going to be searching for these definitions in
> > `drivers/gpu/drm/xe` as well.
> 
> Yes, they are present in the IGT's too:
> 
> https://patchwork.freedesktop.org/patch/630656/?series=143030&rev=1
> 
> Would that work for you, or you prefer them in the kernel? Just trying to
> get an idea right now, not deciding one way or another.

I think it'd be more convenient to have them in the Xe driver itself, since most
userspace users are going to already be looking there. They'd have to really
Google around to find those definitions in IGT. I understand that it cleans up
the code a bit to remove them (since we're only using their size), but keeping
them makes this code more self-documenting.

> 
> Thanks.
> --
> Ashutosh
> 
> 
> 
> >
> > >
> > > > +
> > > >  static u64 per_xecore_buf_size = SZ_512K;
> > > >
> > > >  static unsigned long
> > > > @@ -83,6 +119,8 @@ xe_eu_stall_data_record_size(struct xe_device *xe)
> > > >
> > > >	if (platform == XE_PVC)
> > > >		record_size = sizeof(struct xe_eu_stall_data_pvc);
> > > > +	else if ((platform == XE_LUNARLAKE) || (platform == XE_BATTLEMAGE))
> > >
> > > 'else if (GRAPHICS_VER(xe) >= 20)' so that we don't have to keep adding
> > > each individual platform.
> > >
> > > > +		record_size = sizeof(struct xe_eu_stall_data_xe2);
> > > >
> > > >	return record_size;
> > > >  }
> > > > @@ -311,10 +349,16 @@ eu_stall_data_buf_check(struct xe_eu_stall_data_stream *stream)
> > > >  static void
> > > >  clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
> > > >  {
> > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > >	u32 write_ptr_reg;
> > > >
> > > > -	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
> > > > -	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > > > +	/* On PVC, the overflow bit has to be cleared by writing 1 to it.
> > > > +	 * On other GPUs, the bit has to be cleared by writing 0 to it.
> > > > +	 */
> > > > +	if (GRAPHICS_VER(xe) >= 20)
> > > > +		write_ptr_reg = _MASKED_BIT_DISABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > > > +	else
> > > > +		write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
> > > >
> > > >	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
> > > >  }
> > > > @@ -882,7 +926,9 @@ static const struct file_operations fops_eu_stall = {
> > > >
> > > >  static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
> > > >  {
> > > > -	return ((xe->info.platform == XE_PVC) ? true : false);
> > > > +	return ((xe->info.platform == XE_PVC ||
> > > > +		 xe->info.platform == XE_LUNARLAKE ||
> > > > +		 xe->info.platform == XE_BATTLEMAGE) ? true : false);
> > >
> > > Same here, use (GRAPHICS_VER(xe) >= 20).
> > >
> > > >  }
> > > >
> > > >  /**
> > > > --
> > > > 2.47.1
> > > >
