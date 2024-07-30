Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908EFC3DA7F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 20:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941C10E58E;
	Tue, 30 Jul 2024 20:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmKzeNKg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3141410E58E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722371949; x=1753907949;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fGjyqnWIVdnSrZW71A2EG92yu4bdoDrTE7yPY1QG3Qw=;
 b=mmKzeNKgB1nT6Mji1YeoiM+5CZ9I8vzdsBn8RoCOiJKn2g5XFZlzrZ6q
 q2Pf2ksgkG8d5VC25kaYSVVlzGqZI0IDoqXj9kwy0ingHi6Vvmn/O07jw
 IuPaEHEwh5/9/2mZFkvnBAwfV88W9k2/b7CU689DKiZUkI/6heCmu2hHs
 9cprB66cxczJQmKbEtJA6i0fC7hjr5ZeyZ4Vq6K2rgNgNZ7asus6D+1Z4
 V9X7kaaDktx0iRh7APis2yM88Gb3+SFAU+vYiLQNz1uUjaahKFs/VaSmS
 b/boQeGBTg4F2EkkMg482k/KSg7MdMboC0vDFrzynjm5d6STNJBUf7qVX Q==;
X-CSE-ConnectionGUID: Tl95t3oERDK2Xen100O7tQ==
X-CSE-MsgGUID: OdCK4gpPSJq9aEu9Vj4kMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37731888"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37731888"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 13:39:08 -0700
X-CSE-ConnectionGUID: Fl2pzHsGS8uwJ7GFitrntw==
X-CSE-MsgGUID: rstu8mcOTnmfaieuCIz6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54372888"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 13:39:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 13:39:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 13:39:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 13:39:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 13:39:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+gsnGFiUGRzA4qahfRfOm2l4V8Ad/NPqvK8ycJlA+2QA6aqLHTgygRadOPF8hO2p4JlRWfVqaYO+6wPw68pm7nlbQQimLcWsGowPkwt72BF9Df7i8IZtvQFuN41eyWTqsKQLQk/Xr3WWtGus4Af4/onrkiynfv09Q00D3EYgSXkZMDMEgcZmDbbgO0fNq5lyiJW0gEfWOeXKnPbSyaSSjabeSmSy1aik6XmiR/yG206jUEJlUXlFcJXnyza0Paxp0DeU9Nl4KikSDUGkWQ415RrfSyM0rXf9RV+HHz2sBOsAWeJCmphfTIlzTI+OOha+UAXd24fR5jAa3t+juMWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KehUB3nl/ZZ00mvDvWAE2UpnnLOEmBP/kwy19Ek4Yhs=;
 b=w3GJI177Wdu+cRxddO8ZqCW7obdGjm7R9uxrIJQ1gkkke7ogxwvmEneob3i2JQmXT44E3LylV+wzRmJrI1L+A8dRVh9fK40YYGtASj1a5Q0qVn5UOUdWuj2R2JFoNugAFBMItgQsGqkHS+yCEOo7PdTIdtGAB9s0r320HHm+/3MeEEnXlw1rQjUBDoTj4EcSs6l3dCkyCeTHR/4HSi9L6sNUAClEK+HIY2fRmSdgNYnJ36wWTbKvU8JPlf1nDejWpO4d4h+lPaSey5mJYkkuqiDlqqyo1jqgPPwriYxVHJftOomKt7DnyVbR7bOU2nEx5YOgiFYAo1PVCUSf83o8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 20:39:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 20:39:04 +0000
Date: Tue, 30 Jul 2024 13:39:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
Message-ID: <20240730203900.GF2906448@mdroper-desk1.amr.corp.intel.com>
References: <cover.1722060742.git.akshata.jahagirdar@intel.com>
 <ca8c3c9a5dc3c822d403d8fcce3861ffdc47fb3f.1722060742.git.akshata.jahagirdar@intel.com>
 <SJ1PR11MB6204B4A759AAD5A4B4EA5D3481B72@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20240729193031.GB2685051@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240729193031.GB2685051@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a9853e-3f96-44e3-1668-08dcb0d7a6c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+oSiWwej2J4o2XWZg3FO1hBLeRHTio/xYMnNx6dVoITRpktSdmFYPW1GATL5?=
 =?us-ascii?Q?tozWVQYXX6IAIVS23ecNm8mvk2s9LUD0l6b5isT9XpjMVLJi2blpwmOgdLBS?=
 =?us-ascii?Q?VVkuOln4HOr2yTBKc/XQBLCobs+VvNEeEvq2ZPbnBeXoymZYMR9JgXb453sJ?=
 =?us-ascii?Q?AhCe3/STPCd7Upml8d+IiFgROnMaJMMMPL8mMHIIfXNMJ1kf/pUbG3hnTi4A?=
 =?us-ascii?Q?7YMco3FqCwqRcqQxv2Gha86qx2mJrxhcqDMpqQcy9ZNrD54fdtxcX7h2doq+?=
 =?us-ascii?Q?mEDEXPElpAZg3MIMtAHrv2SiAZuJ3Y7Xn1+BNxVj5ap4rVdLwmzXFKmRqp+3?=
 =?us-ascii?Q?aCyIESUBh5IayaSgzyeKCsSLsmTf5kg3mUnGjx0ZHIpIAnWl03WX1AdHQYdW?=
 =?us-ascii?Q?oDPs1KBjdEZHAuLyJLSQTVIM17m75n4iqlXUXxqoU5nIyDdDNy0JUJvTtned?=
 =?us-ascii?Q?1lTflAOStRWTP799yXk4DMRh3ndaE1wB/vHrZ6KEhTAKFMN4CwsMtXf8vbvK?=
 =?us-ascii?Q?xol8QXk3mUTd5lxHNHqCutaVwTKmHhy8RxIQE4f4HOR5FpFkDQ/Pl5Zk7rwz?=
 =?us-ascii?Q?dWEjPEsVlfyrOEa9zPgTIYQzX9uUJEk9LU5fDLWiOnuyy7eTvtS+FiGJvDQk?=
 =?us-ascii?Q?uMDxC40L/ghynR63h7jeK2iHSHRAEzFvW80Ovgatnthu3p6ySTtFnlbqgFCK?=
 =?us-ascii?Q?TtlPdpCaiZWkLwjmF1fdZaDgKvXRTkSCcrn8AKm7Npe1z5IGNcXbnubK/fLQ?=
 =?us-ascii?Q?9A3duwWJ51Et+hYNvZ+msiihwYKzTNr4UJHM8GVwFOmTtzaWqFkGYAqOskdS?=
 =?us-ascii?Q?Ybpg1Rje9kcNYdmzZS+0IypW4tb7QE8hgHx+jBULyCXPTPEv83pfhQWDPJRd?=
 =?us-ascii?Q?5SLiLFxHWfMr5CgQiVvoz3a0SpGNcR06wbc37V9LFNBsH7bE9dTcnPEeze6I?=
 =?us-ascii?Q?GFx0l3oGV8g/XCDX81hZnUOLYlzjYpzpLwc126SdsjEG+MaKGhtHnuyfOE94?=
 =?us-ascii?Q?J/GvynA7luGR2cXGc0jWQ+9iTJQaDCMLCw2zR+F/7LUTvsr+tWU+JoycutHB?=
 =?us-ascii?Q?9UeX2O1LropxdwAFPT6/UqiG1X0gQVSPXM9qK162cSe1zmB6FDa4n33eKbC/?=
 =?us-ascii?Q?+4Uqf2PnSfNFDdKy/hOZFNfrrBPAzNXr9/8K8VqQBqHHkCCumKATTWMBkH+w?=
 =?us-ascii?Q?mQgdeplcYeaIngi4rEkZJ6/449P3WNmQ1QhIuWSjeLtdUV2CTPCp6YcBsx/E?=
 =?us-ascii?Q?FaEBpgKYXuxi4lbiG56Vin8MDh5NwANrTLNtLkjL4a0qjkygQCp3w+j7P9+m?=
 =?us-ascii?Q?gPhcyI1tN8vRFTzYxHwT1JI/W0KkQgO71CqTe1k0JE1ITg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E6FJc5M6uujvnEUX2W1I7vlJYfHA1UfQjMlZydg/kc0QYSml4fBX1tD4W/Nu?=
 =?us-ascii?Q?A8cGVwWKtRq8QYoMIyJaeiQd9VOiIkspYzP9l3XQKfmlKHIEmrr1+4t2TznZ?=
 =?us-ascii?Q?p1rzhOE5n8IgrsWzj3DIixFHw/i0T1TtEJx0iYOiRIOTv4fAgc8BmysLtlf7?=
 =?us-ascii?Q?sXwyQP3O+hIxNjTuCul7l3xfwz9jROTDJ04agmQ0Ex2mmEYHBfDOZfNMY8yt?=
 =?us-ascii?Q?TFq29xTCSto/s/oeI3E2NGUNeoZnvVVNGnMNSEFLNzAZTML1rM8/KNI2UFyv?=
 =?us-ascii?Q?Sf4arH0oNDCyDD99Tle6Wnq/w8jrBPnAuoXqKB4wW3iy+jD9j+UvBF4bBfWK?=
 =?us-ascii?Q?U5l3Ou+YDoMolnAvm1ZMJz2iKnIep8BEDeSHe7YVxABTJ5smG4suPSy8fmlG?=
 =?us-ascii?Q?lISE5Dr5qf2GVA3yOgb5ysA53VFEfp113/2Uk8qmOlDUW/Si5FcTx0upz5Zg?=
 =?us-ascii?Q?/KBw2f+Vo5yVA29uYRlpnVawJQ4g2Ju28buUrk0DhaTXI6R7Ee8hfSOnA1MO?=
 =?us-ascii?Q?UrTUDn1m3Ul07murHr8nJSe84B86Dc2fkOfTvE3GoO5sc97NaOqReC9YjWhG?=
 =?us-ascii?Q?TXBocg6V/xzMUntRlIY1xT5kdFjYPlPPtlleB8OsmS2kl0BOZaa87g8Ol7+S?=
 =?us-ascii?Q?MS20n7dXupQPXm+Rw2hFvMv3xPYpylGTCIFWyL2pE0CXYh5FjDpMzOl0PSQs?=
 =?us-ascii?Q?zXBEHIpM0rfAwliTnyfUodobd8P/shPfreFfEblwzrdw1JtVcE3iMU/1mt4m?=
 =?us-ascii?Q?VZerDvEzRqahaWswKJPnHcR6v1sefEoFw6X7SMiBM5Tvi8wsBl+jbcVBBcuI?=
 =?us-ascii?Q?Uq9mZlTBDjzolJPd77rUhyyzvUbNcbKzHPlUffRNkUHCFqrdSoIiaDdMBnDJ?=
 =?us-ascii?Q?mxh6HArL+FCrOUzD8FKHaAxtLNJnyS818bmuz4mRmCiPB/mr/kQ5J4kCJmLh?=
 =?us-ascii?Q?1FJUy7ju9ipbc04gnef0QAHsYQ1+m5pZrpYp7GSTAFSocrtrZzmhTRvMzwZp?=
 =?us-ascii?Q?fdJSKZ5oGF4o+rj69AbTB106Imkf/ts3idLb1/6C7XxB3HinEDdlJb0DZYgg?=
 =?us-ascii?Q?7nvDffkUmF8jCJoFoypolu+ZkiIul4jPPjcW9k5u+OzLhaIxpdjFzZ1dGtxL?=
 =?us-ascii?Q?yD5OaLf5cMqRExIWk7id2IZvBiJqVKQYZZkgv6gGa3SKYJSvvFynD/8cSLSj?=
 =?us-ascii?Q?AnDvF8SGARYekLsZzI+8+pYIYsvW+0bBBkOoWXvieZqt2rwagq/DixyNU+gm?=
 =?us-ascii?Q?TiqKkD/sY1goyShiK7h6hqCKOH8sudx4UCBV8fB2/RmclIenVdiit7MGpSWB?=
 =?us-ascii?Q?81CHIhbFzVvFGiG45hidEoN0iXhAtrpcs1rhfhcIpzOxfI36wcq2aOMpX3UG?=
 =?us-ascii?Q?d7VeXvemjbCRTkMZY5pp1ShXEY3McSsltN24eEszKjgY2pAR9iStnHIrk7ei?=
 =?us-ascii?Q?tlKQ7WoE8ONDITECxlmkRDVGSIM7ybC6/qo9RF9vA0yyXzuHK3c2DCqeTAVg?=
 =?us-ascii?Q?zmlG/qGbvFDgXboGueZu9b3/ZSx2fHMqVJxp3ZuTh2KQPVMA3tDQ59R+KJr+?=
 =?us-ascii?Q?aXE08zkiVfDrC14Lk/3B4cuOd4oULAwi2I90svmjGygiCYV6nATDD9O6fqdq?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a9853e-3f96-44e3-1668-08dcb0d7a6c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 20:39:04.3313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wPvqFBgsb6UNRxlZ/mcRWsHsXTBPuAo+tpNHZzgNOM5IOB3Kx+6qD8cPUyATGDCgb6wEwyJNmt6PKyIP9V/2OSdde4Mrfxt7huhQgFUbck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
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

On Mon, Jul 29, 2024 at 12:30:31PM -0700, Matt Roper wrote:
> On Mon, Jul 29, 2024 at 05:25:47AM -0700, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Akshata
> > > Jahagirdar
> > > Sent: Saturday, July 27, 2024 11:50 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Jahagirdar, Akshata
> > > <akshata.jahagirdar@intel.com>
> > > Subject: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
> > > 
> > > Add Compression Performance Improvement Changes in Xe2
> > > 
> > > Bspec: 70559, 59928, 59927, 59251
> 
> The bspec line should generally be down with the other trailers (e.g.,
> immediately before your s-o-b trailer), not floating up here on its own.
> Also, the main bspec reference we really want on a patch like this is
> page 72161, since that's where the official performance settings are
> documented and that's the reference we use for driver changes.
> 
> > > 
> > > v2: Rebase
> > > 
> > > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 10 ++++++++++
> > >  drivers/gpu/drm/xe/xe_tuning.c       | 13 +++++++++++++
> > >  2 files changed, 23 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 8a94a94d2267..28f13362a3df 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -80,6 +80,9 @@
> > >  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
> > >  #define   LE_CACHEABILITY(value)
> > > 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
> > > 
> > > +#define STATELESS_COMPRESSION_CTRL
> > > 	XE_REG_MCR(0x4148)
> > > +#define UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
> > > +
> > >  #define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
> > >  #define   CG_DIS_CNTLBUS			REG_BIT(6)
> > > 
> > > @@ -192,6 +195,7 @@
> > >  #define GSCPSMI_BASE				XE_REG(0x880c)
> > > 
> > >  #define CCCHKNREG1				XE_REG_MCR(0x8828)
> > > +#define COMPOVFDIS				REG_BIT(25)
> > 
> > Is this present on BMG? I could not see. Please help if I am missing something.
> > 
> > >  #define   ENCOMPPERFFIX				REG_BIT(18)
> > > 
> > >  /* Fuse readout registers for GT */
> > > @@ -366,6 +370,12 @@
> > >  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
> > >  #define   XEHP_LNESPARE				REG_BIT(19)
> > > 
> > > +#define L3SQCREG2				XE_REG_MCR(0xb104)
> > > +#define MEMRDNONCOMPOVRFETCHDIS			REG_BIT(26)
> > > +#define COMPMEMRD256BOVRFETCHEN			REG_BIT(20)
> > > +#define MEMRDOVRFETCHDIS			REG_BIT(17)
> > > +#define	MEMRD256BOVRFETCHEN			REG_BIT(14)
> > > +
> > 
> > Please check if indentation is correct here.
> 
> As Tejas noted, the indication is off here, and also in a few other
> places.  Defines of register names have a single space between the
> "#define" and the register name.  Defines of fields/bits inside a
> register should have two extra (three total) spaces between the
> "#define" and the field name.
> 
> > 
> > >  #define L3SQCREG3				XE_REG_MCR(0xb108)
> > >  #define   COMPPWOVERFETCHEN			REG_BIT(28)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > > index d4e6fa918942..f338be24f859 100644
> > > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > > @@ -45,6 +45,19 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> > > XE_RTP_END_VERSION_UNDEFINED)),
> > >  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
> > >  	},
> > > +	{ XE_RTP_NAME("Tuning: Change Stateless Compression Control
> > > register default to R8 (0x0)"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> > > XE_RTP_END_VERSION_UNDEFINED)),
> > > +	  XE_RTP_ACTIONS(CLR(STATELESS_COMPRESSION_CTRL,
> > > UNIFIED_COMPRESSION_FORMAT))
> > > +	},
> 
> This setting isn't documented in the bspec.  We should hold off on this
> one until/unless it becomes part of the documented recommendations in
> the spec.  You might want to ping the internal ticket where these
> settings were first mentioned, to see whether this setting was
> intentionally skipped in the bspec update that just landed, or whether
> this was an oversight.
> 
> > > +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> > > XE_RTP_END_VERSION_UNDEFINED)),
> > > +	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> > > COMPMEMRD256BOVRFETCHEN),
> > > +			 CLR(L3SQCREG2,
> > > +			     MEMRD256BOVRFETCHEN |

It looks like they just updated the bspec again to flip the
recommendation for this bit (should be set to 1 now instead of 0).


Matt

> > > +			     MEMRDOVRFETCHDIS |
> > > +			     MEMRDNONCOMPOVRFETCHDIS),
> 
> We generally don't bother (re-)setting bits that already have the proper
> hardware default value.  In this case, bits 17 and 26 are already
> initialized to 0 by the hardware, so it isn't really necessary to
> forcefully clear them again.
> 
> > > +			 CLR(CCCHKNREG1, COMPOVFDIS))
> 
> Same here; this bit is already 0 so we don't really need to reprogram
> it.
> 
> 
> Matt
> 
> > > +	},
> > >  	{}
> > >  };
> > > 
> > > --
> > > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
