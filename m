Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC43DE6BF32
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 18:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257C710E1AF;
	Fri, 30 Jan 2026 18:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ks+vxnaC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8C610E1AF
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769797700; x=1801333700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zygMeSff7a/IuWmT08XYzDReQeq8FCL79BDJxiKfPLY=;
 b=Ks+vxnaC6Y4FXwabuT6H8+eOvKHjGIAeS/lwXRQdmFjojeIeVW15mVT5
 IpxwHZCwSCwwdkzwnRVMJeeleQiXuH6ajosZi/QVfuOGV1Ki62zStpF77
 7kp/8/O5hEE+Rvw1uk1NK5U/JwpP6icEcQL6xFEXaSeqEbQlS4zTImruA
 VxqwVFnMa065sJhZbXIQZGCqXSDTLkNo4SDkLOJ3+gg+H7yETxtTMjLR4
 hR+IC8dQlnv3khtp3CzNXRWrorCy/oa87HXRIzuC+Tio5/RDiasADPbTD
 D3NLE34eJhPI0oOYhPXyba/oCmayATp0AVfppb4OdRlb7xfxdXUOknFqD w==;
X-CSE-ConnectionGUID: pFoj4mjtQeWAPh72aJ5hYw==
X-CSE-MsgGUID: ljyPJOD/QlOwrAiw4KGchQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73654835"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="73654835"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:28:20 -0800
X-CSE-ConnectionGUID: lkAfeqCXReax6WSV3/7/VA==
X-CSE-MsgGUID: LNNBDWAyTpyQi6DgbzYAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208495816"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:28:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:28:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 10:28:19 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:28:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU7t/DNZOgEHnrYnKjkuBDej/1LSBRfb/tH/17CSNmj49xdVrE6w9CtF55O8EOLeHLRq1YXVrG21EEVbG+7x0NbZ4jQg/YVc5G3Iwch5n4FFtgtjDZwXdoCZqbXRGuWgYXZzprkhlgeatmzvhyLhXsoQxD7i8rYAbrsF7sB6wRB4hrajUl7Gqn6H10Rs3OBfrgb0UbIejQpfBW6Q1ncvtKowDpv9N9/EQbOkidkW240pKGbKu6kMUCSA8jjxmd+BgF7hDLeEjP9dHxgne7IK1yxgdGEhxrbF1OoC6uoX/HDMs+brp2nga29JqvKqCgILIrwzX7QijLTovmaAEfGS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn4zsFKJJC2amrxYS3egid8sr3yI2W049JeU/w/rH2A=;
 b=KWr96me/OIrQ+WvCN/zDDp37zDjl2i/NByWnXyRWMBN/N3rWyi6zPfzN9NpcIVDMCkGY1vFEHLGlLG/G0I6gWti3/zMgcQLvHe/Q5GxbbREE2i5I+eBHB+Ebh+10vEO5vlf2+UDvJCxqvWGuNTvyI2F+00qtyjekbIa3xL1wCc88WOfuRYKDD6wJYWb9pZq6f/TjcLHi4PYwffcKG8v2TmyAuVRj9gufu6wFciMP0upToET3S+jdg7SwJsBQIhAyHcXwRp8m4ecu75otWKb3WakHxe8BIDd1eMyRnnGTD2Myphs9Z0cDEWLHUzM4qn2ATyH7qlaxNkZ9wYumRUyXxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 18:28:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 18:28:17 +0000
Date: Fri, 30 Jan 2026 10:28:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Message-ID: <20260130182814.GB458797@mdroper-desk1.amr.corp.intel.com>
References: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
 <20260127205004.GA2174980@mdroper-desk1.amr.corp.intel.com>
 <aXv_7mzwHdpYVGY0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aXv_7mzwHdpYVGY0@intel.com>
X-ClientProxiedBy: BYAPR07CA0107.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1aa736-cc04-42d2-7731-08de602d564e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gU2jXoQAKYLeUBGNOBlKy54tfIKYns2dH+JFz9saFU/Vfa9XV43iwIEHNi8i?=
 =?us-ascii?Q?A2JDGQvx35udk4nc5mVgArseE2On1Z8vWx8eHvU/FXYCeviovBFOwHAlDEwc?=
 =?us-ascii?Q?U6n7u3F4/7l5KmrRzX2lzyKtJJp1jsQfHylgE21JyXVabrkkOVRA6rDIeefB?=
 =?us-ascii?Q?7hb/mKtTJPi5hxd7iQzvFJmXzQjN3pJ/EjpdarmMw6tKfEWO1Kweb090ZBth?=
 =?us-ascii?Q?MTCN4vc8Sk14iGzJaYUSTVCXdBV8WgC3lkuLBcTMiW86KMcYD4FoZF4ImsqP?=
 =?us-ascii?Q?dxy6DTnmDfs+5c19CqExXpBKPaJd3bxv4EmKJmGzToYYhQKsRsBGO1VhjEbo?=
 =?us-ascii?Q?BBHluRdr6vbVzJw9X98+hKrbY54dnBVQpOwdZuvSZw+pBtK8YdcZ5LbdQjyw?=
 =?us-ascii?Q?VVRFZwEdOwjtayWHuLVos8LXc4jbRynDrCV63VnHqgt6i8j1T4Sdde+vIZuh?=
 =?us-ascii?Q?d+24eaWBMBkmXXNYQ98idLqAgV864m/Pe6fgHE2jt1qet0sLnRtKreC9Y+QT?=
 =?us-ascii?Q?vrfhLEflkxSqdJgGOk1PXcL+37eRa9xpKYXi25DLJJv51qDTfLJ3RX4CAP9a?=
 =?us-ascii?Q?ZeRGh++C6nHCiom3HvHbYmFxzVh4NKt41vGbRI9fxkcClMTbeOsI8WCUwpZ5?=
 =?us-ascii?Q?zS1HoGpkhNrJWo3tjubZ5RUzT03QwtXKeLKa+lCgRUllM/fEfg841G1yfvMH?=
 =?us-ascii?Q?pIK8AP8gSSFNw2xgnKIJxBx9LswJqdGvjf7QAhcJGpLKiO+aCXko2GS/73R9?=
 =?us-ascii?Q?f/Fwb8Yyw2YkPd1unhdpe0Rc+FqbP///W9cIEJ5E3uGkD00vLkLYXPn2fO1y?=
 =?us-ascii?Q?qood3lE92vhkAK+waMprnBhxDNPdfKCVmnJD16j790gA3/WLmSg21Sm73MOd?=
 =?us-ascii?Q?W9yPwdQBawybuDgXzZrbYHq2FzEbf0DTryd4ienU6XJACET51RNATg/spbBQ?=
 =?us-ascii?Q?8nOKiDkxU3rn6W55SVNmAzl3zlzHHIJcVk3vpq78axhReLn5xn2dtzZBuPZf?=
 =?us-ascii?Q?bGx0VQ+yS2W2apP/hpR0+z4q1gkfv3QVo6qIOdZ1J9zHHiaZ3YhjlSoj/FKc?=
 =?us-ascii?Q?7TCjnnXFXQM+Jj0WdCAWpJmC4PekaUq8QlC/oHxJdXGhgQlreI3DWQy1sx3T?=
 =?us-ascii?Q?esqSQDwNwlwWKVBR0NYshENoGzHXdYaqKnuQ0s5NEJ3NolUD9MXMs6bhA0sf?=
 =?us-ascii?Q?PKbOnsR0bXebeSnhER+0PL9IvFnJUteaIWEoNfvQ+8NjE4lX6PcJOOEad0sL?=
 =?us-ascii?Q?Ckpp4YSXCR/4vrvGj/XXWySwINN6JWDvb5v6XyKo8cIZ1uUZxfy2dhxPleb/?=
 =?us-ascii?Q?6InNWFqmAojaEtHm8a8H/kSUFF1T4mqWQuqw/IPFIvQnoKz0RvO5CI4Sywlw?=
 =?us-ascii?Q?h0OhPmU9jL1VdR5aJLNrCyY8C1DMlhfku3SMEGC+HyS/0CGop10RRDE0OkJu?=
 =?us-ascii?Q?g2O+9Ju5zzAY8AEOTf6TDTAOnq7XZ14Jz/vEw2DmvXxUtPRN7uqCpBHUKwh0?=
 =?us-ascii?Q?9uT8UM7oHU8cfTBYubmySNwV9MlPgigQ45tW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZ17F8M5bSqQfMpQZYCUmnO8psTdvv3XbOh5KkJ277JiFiJlhxR+F1YqQRM4?=
 =?us-ascii?Q?e904pJ2zGC/dE3iflE7387nwQ/kctYevVXpzzwzg7OnG5RAXgpX0VWOjrrMR?=
 =?us-ascii?Q?IXrQshdqzqFukGd0TE33dsn6rief+8vhXH977gSSXLRZig7lpzQ1JXxQaL3G?=
 =?us-ascii?Q?F738MNcKPoM/o0gXQBhhHHv1+KWBxupS75IjrcMuQ3GZ/dwzqinUgAYzi3iN?=
 =?us-ascii?Q?awh9fKmYZMv3Ald9bn7grZmwfGHgIqO2kT30J27e7mK5T29FV6MexODXs4Uf?=
 =?us-ascii?Q?o1I/c8evWg0RwGTkOgOGbyrjm+PVIgbjjY3HWV5GGI5sjcNUNJtoNDEn4teC?=
 =?us-ascii?Q?vhzXM2s9EcwegfVjdynCB8JV/DEST9MRLvGuCXDkSfOw+hkm5AgAyU1x3Hnr?=
 =?us-ascii?Q?HCz3x5O/PRunKuzBddR4hn+3tr9jXy69MkAvuasxKpUeTO9CNPvbWB20E4yA?=
 =?us-ascii?Q?yEr4kBbLNyPvOsYBX9dzXRk/e7awSfrVh3WoOGZBs6OOZ2R1G92BwE1q4oYP?=
 =?us-ascii?Q?1N85d2iqxfE2XJ9UqxveX6RIRX7RcQILNzINX0r5nl99DDmO6gdE80W8mD0w?=
 =?us-ascii?Q?mJfNGDF3iN5IaFSXsJ+sqfvAU+0aDu21QZR/jzv75O4v+sIUNtHgMfSdM00U?=
 =?us-ascii?Q?XK3pKQLXHm8hCBPAkIXzbE28PBQjB6Tu5j2+W9sE6AZ5nvprr6N1sLpbD7Kv?=
 =?us-ascii?Q?IYiCxWWLikbnKM/ZSXKtcVSvXlYlD4gcrCfbTNuQnN4CBfnDXZwzMTJVY9Ar?=
 =?us-ascii?Q?ZBWSiHKEeT5AmWKNdka4fJGLrqhsggzrz8NcTDh1YTBEFd34ZBqaEzU5et+K?=
 =?us-ascii?Q?nES61ayWmhnVVQPfI/jIKuKXI3oDXCi5GbQOz5e9KGbYICVMvgs9BvqqeKfP?=
 =?us-ascii?Q?RFlCPoC2ZcIobNH7unVrJEiSzI4Hz+mFQv5sb3VRCW4Wo9/z44t06//5DrZP?=
 =?us-ascii?Q?kpzenwHz0jO36GSh1UCgVc57lgi3sMi2aolu8op2O9ayD+h73yhTHSivMgVw?=
 =?us-ascii?Q?IEM4IRnMu1rmwYIHuhBj4+n7skAqQmHigQ3s+bI11Qy5thMkmIN+/+gGRSON?=
 =?us-ascii?Q?YmARG2NfP9UcyRXX7ICO5M3SWaYMJuSQhnTD9VZY3ehE70EurJWzF/NTGEfc?=
 =?us-ascii?Q?rEo206sV1em7XErvgS2rvrtsgrtxz57m4S4qwpgOLSdfMPlVBt8SPCx6qot9?=
 =?us-ascii?Q?p5UMXEGLeyT58hKgFg1FW322RW7PVHLRFb07XQ1HDlg8LIGqVz1gq/fIMRr0?=
 =?us-ascii?Q?Wiay4wuox+UPJOQbO87dTpdtH3E98v5XUtOxHJR+xKo34WvUG5GFgeVUcI1c?=
 =?us-ascii?Q?ehgnbXonGJZwvzO5gAG4FNyIZBp5VRCVRJuhv6skSXyphhkC9bj/I9f3gCQp?=
 =?us-ascii?Q?jnGxdWGYFHOPJoNdj18+ebtKGgkjUk15+/CLdxwYKxUKWulAcGAArRoBkdb8?=
 =?us-ascii?Q?5YCfpGS7wwXLDMFUffMfs1Kn+y7maX7ZT+fkwszbW/nMf3LVmz+fKX8Ssrp4?=
 =?us-ascii?Q?fEdmdV2KQtSgpCIgrDulv3KuqLHJeXMXvzpMrAbyNK7Fs6EdS5/OHpZdUvvE?=
 =?us-ascii?Q?g4l7LAEI2CaLCX30gPrjae7jIozIlGAvaRmDjaxTmMyl47Tk5LEN6Q9alzrO?=
 =?us-ascii?Q?WSXOjZQVvvAhsh/oUjRpVNabG0C/dFd55Qu/v4Q4hDvLgQasIBFvZ1bNjFQk?=
 =?us-ascii?Q?2KeZxB4B3V+wPgb17COrtQA2a5t9u/aJ1kDzxPFS8fqVo3GSajgoQ8hJnVcf?=
 =?us-ascii?Q?lEnOMsvINzwVKB9B8egI4eeTmmZsaBY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1aa736-cc04-42d2-7731-08de602d564e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:28:17.2373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TolCHafMyy6sRBZyqMW0c5HK057n/7wTQ5+us00IhYWNU4H5WJTzZdh2E88XC7mE7O6t16rDcmZ2SKGygKu0A2CeRh4p/02j/SrLHN6V8fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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

On Thu, Jan 29, 2026 at 04:48:46PM -0800, Harish Chegondi wrote:
> On Tue, Jan 27, 2026 at 12:50:04PM -0800, Matt Roper wrote:
> > On Mon, Jan 26, 2026 at 11:49:50PM -0800, Harish Chegondi wrote:
> > > Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.
> > > 
> > > Bspec: 56024
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index a991ee2b8781..1153a7363cff 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -535,6 +535,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> > >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> > >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> > >  	},
> > > +	{ XE_RTP_NAME("18041344222"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > > +		       FUNC(xe_rtp_match_first_render_or_compute),
> > > +		       FUNC(xe_rtp_match_not_sriov_vf),
> > 
> > We don't need this; nothing on the engine_was[] list applied to SRIOV
> > VFs so we never apply any of them.  This RTP match function is intended
> > for OOB functions (and possibly LRC workarounds).
> 
> I submitted a patch series https://patchwork.freedesktop.org/series/160865/
> to remove the RTP match function xe_rtp_match_not_sriov_vf() from the
> earlier WA patches and the SRIOV IGT tests are failing.
> 
> Michal mentioned that with the below patch, WAs are applied for VFs
> 92a5bd302458a1663 (drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs)

It looks like that failure is coming from the 'process' stage because of
the logic in your xe_rtp_match_gt_has_discontiguous_dss_groups()
function, not because we're actually trying to apply the workaround.
Adding the 'FUNC(xe_rtp_match_not_sriov_vf)' rule happens to avoid the
crash because of short-circuiting, but you'd still be getting the crash
if you'd put that after your custom FUNC() rule instead.


There are two steps for workarounds/tuning programming:
 - Step 1:  process the RTP table that describes all workarounds to
   identify the subset that are relevant to the current device, and
   compile a reg_sr list containing that subset
 - Step 2:  apply the contents of the reg_sr list to the hardware by
   writing the registers

Of the three main classes of workarounds we have (GT, engine, and LRC),
only the LRC workarounds are relevant to SRIOV VFs; VFs don't have
access to read or update the registers in GT and engine workarounds.
So the commit Michal referenced allowed Step #1 to go forward because
VFs do legitimately need to process one of the workaround tables (the
LRC table).  However there's also commit c19e705ec981 ("drm/xe/vf: Stop
applying save-restore MMIOs if VF") that blocks Step 2 for SRIOV VFs for
the GT and engine workarounds (LRC workarounds are applied in a
different way and not affected by that).

So the result of those two commits is that we'll process the RTP tables
for all three types of workarounds and generate reg_sr lists of
workarounds that we initially thing we need for the current device.  For
the SRIOV VF case, the reg_sr list that gets generated for GT/engine is
bogus (since we _don't_ actually want or need the workarounds it
identified), but it mostly doesn't really matter since we effectively
throw the list away and never apply it.

This mostly works, but there are a couple hitches:

 - Even if we'll never apply the workarounds for GT/engine in an
   SRIOV-VF, we still spend the time processing their RTP tables to
   needlessly generate a reg_sr.  This is a waste of time, but usually
   harmless.

 - If any of the RULE conditions in an RTP entry try to read a register
   that an SRIOV_VF doesn't have access to, it will get back a value of
   zero.  On its own this is harmless, but if the logic in the rule
   fails to account for 0 as a possible value, you can wind up with
   things like divide-by-zero errors, which is happening with your
   specific workaround.

 - Even though we never apply the register programming in the driver, we
   still report all the engine workarounds' registers to the GuC as part
   of the ADS regset, which will cause the GuC to attempt to
   save/restore them around resets.  This is probably harmless since the
   VF GuC won't be able to read/write these registers, so nothing will
   happen (and the PF's KMD+GuC are probably already handling these
   appropriately on its own save/restore list anyway).  But it's still a
   bit misleading/confusing.

 - I think (haven't checked) that since we filled out a reg_sr with a
   bunch of workarounds that we're not actually going to apply, some of
   the debugfs entries like 'register-save-restore' and 'workarounds'
   probably report misleading/incorrect information when run in a VF.
   Not a huge problem since it's a developer-only debug interface, but
   it could cause confusion.


So maybe what we really want to do is block the processing of RTP => SR
at the GT and engine callsites (but not the LRC callsite) for SRIOV VF.
Then we won't waste time processing the rules when we already know they
won't be applied, we won't run into problems with FUNC() rules that
can't cope with SRIOV VF environments, and we won't report misleading
information to the GuC and debugfs.


Matt

> 
> Thank You
> Harish.
> 
> > 
> > 
> > Matt
> > 
> > > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> > > +	},
> > >  
> > >  	/* Xe2_HPG */
> > >  
> > > -- 
> > > 2.43.0
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
