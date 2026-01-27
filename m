Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4A8CF65E2
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 00:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5E810E10B;
	Tue, 27 Jan 2026 00:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8NdbQPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AC210E0F4
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 00:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769472685; x=1801008685;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wVzmRrcXuxb9QtVQUIq/+sJ+jCbvb+UBfoa3YUXP4KU=;
 b=T8NdbQPlcefC+R29aNZnGb7K6cEfUpz7w85r22BFO/kXHTZG0/WHGfNW
 x0BM0hKT6DVgkwI5Zj7R80FfID0kVQ1XCwKGZsJw6hJLxaA3o11ly0Bv+
 QVdsTrD7hKxEZNCVsHrzYJ45Djt3vxOGbNxqJgOPU876xD78RjgRkmgc0
 fPexRr+xgLX6uxgxKOszPNHLt0bODGDtzyMbtTLbpc3iG24R4RwPK0OAh
 0zd5iqRN40gkHjJdpjU8MnxTw2b8c6s7hJw+4GtfD0ikOJeGR93BdMj5Y
 7H6X4zghbypwXJ30EAqT+dEwLxw47mqp3WqqDXU7P0jI0NZkXosg71iZe A==;
X-CSE-ConnectionGUID: L1GkH9JeQuKGljcZs9siKg==
X-CSE-MsgGUID: 9RQdL21xS9WDsvFNKqfTNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82088474"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="82088474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 16:11:25 -0800
X-CSE-ConnectionGUID: dZUiWgJYTlavpnQt4QJUMQ==
X-CSE-MsgGUID: tMQ/L9GvS0SCrsCWhPQZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207696163"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 16:11:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 16:11:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 16:11:23 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 16:11:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM7Fr0myY7mB3XD731RqS2gT0CG/GTtLo2nLphdY+jwMnJ6T22w2D+QVugcKDvqVoU8FxRy3E2dsgxNR0p6O6hGkgdcXZIUFsdVf9QJ0uH1hmnufDIcuXT0PnJNC3PDby8oELD/cBwSbBxehsCj8JLwADbv0nqFSySvlwxXYwn6Akl+MJAQ3IrGxOf52NwMuiPoUzFIBQ7XpvDOGDXmMauv29Lni+OtKGeG5zsNa+kWeHxl2OxrMhu8kRApwtHLHtHAqNN4IENTpu0gPX/t/G8O0hZAwazWJ5/AyahqGyRROwq/amUuUCffGbiKtNHk/T2WR4hQ6hd4nLBIU0KY3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7RduZ8rtHnLVJ0YTEtn1BcN+BcogG4sgc1i/Bi4lt8=;
 b=KPJAGNGD4VHmQjW3zGG+MdqTtU+io1+Tg0xgXDlFefijnta9tKDsqC6JW0NLQmx4CCxIeE5sMLDfd3+joXiCVtYncZ2G1ahxxJHsav59Qg3zZWWaAiUJv/6ofIb3olF8moMlCZBc3S8npPo9NnbhsFbmuXbMyx77nj41dYgnYAeG2GfCREI4ATHD3RJpf2GpipKk18PM7E6KBv3xKQyU0YlXoKGOg082CeZqHcntH3klH2TG6a2H6ogEKMNE0Lv1nXIgAwG341UiO8IPqV89UiYJlNLg1sTU7P3Q1PQPxhlm5rRVus4RtUA0Q7Cqm3WisXBqnQ+zNHhJS13sqBUKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPFE70B31BEF.namprd11.prod.outlook.com (2603:10b6:f:fc02::5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 00:11:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 00:11:21 +0000
Date: Mon, 26 Jan 2026 16:11:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Unregister drm device on probe error
Message-ID: <20260127001119.GR458797@mdroper-desk1.amr.corp.intel.com>
References: <20260109211041.2446012-2-shuicheng.lin@intel.com>
 <DM4PR11MB5456545AAD6BFCA48E25A116EA93A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456545AAD6BFCA48E25A116EA93A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPFE70B31BEF:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb55479-9558-4226-1174-08de5d3899cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3kEAsVzmFj+ygbMKPhYA15vVQT/PVjMIs7sQwwwYxtUzcbqVVeGqqQOOeTOA?=
 =?us-ascii?Q?n0dc3KWOvhqxtRr45hMT+YkHfuBXIpGC5qOxAkw9GfShVEMLaYu3F21OzcC8?=
 =?us-ascii?Q?VcE1RhiY5z85VcDuvsUgu0pYPzdnWn8iGjVit+pYSsX7jlGohdSQEOjl6Nb+?=
 =?us-ascii?Q?rJ0mTV+mPf18PLIqKr5r51e1LffI413dRSJrCtMAy5Y9Zt3u4uqV31r3z7N/?=
 =?us-ascii?Q?NRMmp0saWq9zrudGPf62FGtBtg83ttN85XfTijbDf7zsXt84VmoeBvs8iWwG?=
 =?us-ascii?Q?gVSjmucXHARuJrJ3Qwhc3W1AmGaB54d2zB2uoxbAr4BgajT/71/j1Y9ODXM/?=
 =?us-ascii?Q?lYc1ZXM3/Q3O4phyIrFuL7UZupwSskxpdvsJV1mL9j8hnm10gGb+OMvNayna?=
 =?us-ascii?Q?qPhc+GdZi+1gRrEFE4hhDrc2LFVsyl2CjI9jZ9Hkc2E+f2W8VjQi0FXf8y/c?=
 =?us-ascii?Q?sIlZ2WU4vJ2X5UMX6NQhFCTevzq/w4TnkdXB95KBx8c+oqB0BxNWQyN2ewHu?=
 =?us-ascii?Q?XQ87++BLdTuNGwjXAQ3HsMrfstCwEbKB+4ZvpuDKoQNPmz/5VwdUT4VD3fdO?=
 =?us-ascii?Q?R57+VT9EoDRoXzEwBtHwgKOYuSdJNXqA1t+dXWOhW3hlFeLvwWf9kJarXSLy?=
 =?us-ascii?Q?suwqTc68+pyhhFeQLrFGfl8jFtbk3gatyxlKwvEzPYh52/ZujfyzSYda5KGv?=
 =?us-ascii?Q?TcNDqRrikv3EF9u0L7FNydFUQPyGy4l3dGsolsAwaFgkwgrGKoxbzrKqixaS?=
 =?us-ascii?Q?nDfWOMoR+vmBWBXUxtwlK8aeRglNIH/Rziz+fbXih5GmTfPrEUbh+L2Hv4mT?=
 =?us-ascii?Q?GIp+qpY2CkX0qZSal8+pdhWBT438r7oBuKZaEsQNyqU0kZXdoRvf/MS6bN4o?=
 =?us-ascii?Q?/gmovJggbbZhjCsNTbo4j13KVA5yVGaoBrfVttsTl6oaqujE1o8cVCliIEhR?=
 =?us-ascii?Q?q4o7YbDulDZjlSeyLKMFVa4NsAJnaYP/y6wFJ8pU2DnDuIi+qc0V/F24NmYf?=
 =?us-ascii?Q?LRruaaSsLp0l/WY7WM2V9ZOuligwGpHv33Ty/rdww4Dqm1S/M3T/jhR6MzCr?=
 =?us-ascii?Q?dON5D0RO4OvXtlBbJY9PbrW2Eb+MFAVtbWhycuCnt8yCi56Dcp3yDg49rK0l?=
 =?us-ascii?Q?zOoj0ItePF4o3Cdn28oSrkMKoDA+qdvf8MpSdcfkVbWfNWLa0YT+nehqzR3z?=
 =?us-ascii?Q?8tu396lvIHtPmZu6tST0Zn8Hz18a3MjmfMYXbnEBybUoeGJKbMWcBWqn5T+i?=
 =?us-ascii?Q?hE8/ts9NQ/Z6+sM2XFdOYMqOA+KV55zl9zKc5UjeJSR+Axwhdw/r1zGtdpyk?=
 =?us-ascii?Q?4+ozw/KW0sTA1mhtlTuGFgdBIsoP8JuL3qi77bez6V7CeVFYoQe+qulrkc7X?=
 =?us-ascii?Q?Xz4JqoE8qqycVftwANk3yorTRpajfleBCWyCXU0slsRtKarQ7gCE+PrubpkL?=
 =?us-ascii?Q?npoeKOlZhfrpdADq320gbF/Yu7GmK5fnS4jkxl7HOvEGRavJuoyIAuYdKHr3?=
 =?us-ascii?Q?FewypCjFeRlbQgcoEsldFcRRb3JE6J+WyPXHxSQhUc6uChhWsMCfGMg+9/aJ?=
 =?us-ascii?Q?a9wiFnUnMzw2b4N2u5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+VJZfe9l8eOCPcyEqxDAbBghY5p7yef3Hwp+w9DLQ0ZliXpB56En61ZtIDm+?=
 =?us-ascii?Q?mu07MJEnbDTp4ArHlUrzVZo3FIbDrRdx5zwdu8u+q1xg7w+KEpyrg3EbjAqC?=
 =?us-ascii?Q?t5Hh1RJ5SFVenzDXB0MvHN3fWBIxB8M//+W+w0xw3hMLUEvtbeGFQfIi/mjD?=
 =?us-ascii?Q?9Iu6Z4Sf6P93N4gS/OsqhxM7ezzZme1x56z/FRFtOLkZ4PPTtvURADlNClOl?=
 =?us-ascii?Q?YHi2cyJX8oWQtF8MMbMBW56becWhOJg4oBKSXHcO1Y98hu6W09F8/A6mVMdB?=
 =?us-ascii?Q?XuxCO9J8s1+Vrp6eNjVFyyZ/1ccsgzyggSI9wJO0+H17UXmz36rTkGwDVT3G?=
 =?us-ascii?Q?kBKDxKKA85B/QN8Y81CFRW2AcT63pYyhGZEXneipY18ptkAy3Krx2hizKqT5?=
 =?us-ascii?Q?Ro2FdHf8MXKtCKS1VvmNnMwMhGYFXoa4B/TqI31/r+DqhaCcm+0oKqeUoolZ?=
 =?us-ascii?Q?FdvNjnL+G6Qac1HXribWBLOFWYuOz/m1pTB4AmgQwnZVGga2/Ods78w7mh+L?=
 =?us-ascii?Q?WbPoQbzX2LWkCbl6yLp299uQdeTdyHf9Y2O0NFTBX9VeB97O4vuUzMlb47RW?=
 =?us-ascii?Q?MHszEbPiM5aovGai4hEzG25cdzRjLmoDKZUWgdQKBeiK8KkG5kO/9L/iOCdK?=
 =?us-ascii?Q?pCWD0mCtfQMquMaT7Wc4jb5KMWpENXbS20AAgXKtpSEf7AcFp3D1Iv/Ji1w6?=
 =?us-ascii?Q?oAZxRR5Lu7VnstqXowrE0HU2K7+okt68CC0Mek4WvNgHSgnCy06a+3rXc3fV?=
 =?us-ascii?Q?utn072f2haDgMICxJIgigYypv5tEMvrRC1MJmJGTOMBzaJrROtdsyEhqoEZk?=
 =?us-ascii?Q?wHvXoFPZb9UJVLVtBwDE//JEe4fxYrlQM+GitSo1uzy8vqckoY7yrpqtJMpc?=
 =?us-ascii?Q?/obgc+JWVG8y0tq04mV4nz+LPc089SXJ8LKsEWWu7SNjqc7w48SwBf3NL4zZ?=
 =?us-ascii?Q?qa2F3XZwFXvmVAgBpkSsyyK6evDvXpF1GYXk0L2hDY/IFwY4Y4+DJXzr6uxB?=
 =?us-ascii?Q?JF/E8wkSqawtFg4ioiItViQJQQnMVf5YxA27HYTvGwg4+HVBA5ZTuRatY6x/?=
 =?us-ascii?Q?RHEt2U9e8qow8sEd4DqJs8Nbj4FuC6QF2CCJM576m2XAxnFWzOBD6n+1QaH1?=
 =?us-ascii?Q?Ar1KYkNUuHlWtgvHgeL0XGPxceLormy6PZCUQKepxQS2v01kFzwfXkwyXUK4?=
 =?us-ascii?Q?qgKA9FeYTt6JKaRiBoBA8oRunxn2RXdGUoJB7Hwm4LZYfmk2FaPpaU0QfI9y?=
 =?us-ascii?Q?f810SvdunOl8qgN8dmczpPwp42ldmM7fWPTnJ5U/xFG+MoetMJ0JOoAGyr3w?=
 =?us-ascii?Q?yOBH1pw/GvkdU5ZMLlEaQn8S6lJQIC7WB8jV5tfMv1mHFOLcqGd4Yn9FAakO?=
 =?us-ascii?Q?cTqqIpqGP3brOR+OxMFu8N6lzmG7Y1tY47+Jm6jtLqW6ZhtZs/P+wFET6LPv?=
 =?us-ascii?Q?Q2v/QRaH2dgISN49RuEFeutwHRj553WG4GmS7jor4V7xWfYPeCYI9SvYcrT7?=
 =?us-ascii?Q?mJgg6dF0FXJUEcKmI1sdYWBK3jw1qYwOm78I1RlCV0Gta1vn4SJ5fdRWBhkT?=
 =?us-ascii?Q?GPZ8gENtblGdlVym5njdZ7Ez/9+7zuVCodD3kFVH/NbMAIWJsLDSPEwXMmmQ?=
 =?us-ascii?Q?P2TSMwe66/7jzjPmM0H9vs2PAuH/+O6eAFsuf8Akoo2Ak140eTNlAltHkoIN?=
 =?us-ascii?Q?ZkOhVLDy3GRif7VGOmoquBUMN/NLdhIokG/H/P8ZUdk2K4AjnsiY80LdFl2V?=
 =?us-ascii?Q?wuxsoNarOuothNHudz8hLWpwQegvsKM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb55479-9558-4226-1174-08de5d3899cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 00:11:21.4637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMEVvK5HkrIZwoxaGQGcNYuyo1eJhWaLWMayDBD+ewhOikBinJtHomJ2RbxuUPRnnC2wh+GTajfAqIit8BNcsI2obRa8ytMG4AYprc5693I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE70B31BEF
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

On Mon, Jan 26, 2026 at 06:48:13PM +0000, Lin, Shuicheng wrote:
> Hi XE committers,
> It already got one R-B. Could you please help me review and merge it?
> Thanks.

Applied to drm-xe-next.  Thanks for the patch and review (and sorry for
the delay on applying).


Matt

> 
> Best Regards
> Shuicheng
> 
> On Fri, Jan 9, 2026 1:11 PM Shuicheng Lin wrote:
> > -----Original Message-----
> > From: Lin, Shuicheng <shuicheng.lin@intel.com>
> > Sent: Friday, January 9, 2026 1:11 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>
> > Subject: [PATCH] drm/xe: Unregister drm device on probe error
> > 
> > Call drm_dev_unregister() when xe_device_probe() fails after successful
> > drm_dev_register(). This ensures the DRM device is promptly unregistered
> > before returning an error, avoiding leaving it registered on the failure path.
> > Otherwise, there is warn message if xe_device_probe() is called again:
> > "
> > [  207.322365] [drm:drm_minor_register]
> > [  207.322381] debugfs: '128' already exists in 'dri'
> > [  207.322432] sysfs: cannot create duplicate filename
> > '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:0
> > 0.0/drm/renderD128'
> > [  207.322435] CPU: 5 UID: 0 PID: 10261 Comm: modprobe Tainted: G    B   W
> > 6.19.0-rc2-lgci-xe-kernel+ #223 PREEMPT(voluntary)
> > [  207.322439] Tainted: [B]=BAD_PAGE, [W]=WARN [  207.322440] Hardware
> > name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812
> > 02/24/2023 [  207.322441] Call Trace:
> > [  207.322442]  <TASK>
> > [  207.322443]  dump_stack_lvl+0xa0/0xc0 [  207.322446]
> > dump_stack+0x10/0x20 [  207.322448]  sysfs_warn_dup+0xd5/0x110
> > [  207.322451]  sysfs_create_dir_ns+0x1f6/0x280 [  207.322453]  ?
> > __pfx_sysfs_create_dir_ns+0x10/0x10
> > [  207.322455]  ? lock_acquire+0x1a4/0x2e0 [  207.322458]  ?
> > __kasan_check_read+0x11/0x20 [  207.322461]
> > kobject_add_internal+0x28d/0x8e0 [  207.322464]
> > kobject_add+0x11f/0x1f0 [  207.322465]  ? lock_acquire+0x1a4/0x2e0
> > [  207.322467]  ? __pfx_kobject_add+0x10/0x10 [  207.322469]  ?
> > __kasan_check_write+0x14/0x20 [  207.322471]  ? kobject_put+0x62/0x4a0
> > [  207.322473]  ? get_device_parent.isra.0+0x1bb/0x4c0
> > [  207.322475]  ? kobject_put+0x62/0x4a0 [  207.322477]
> > device_add+0x2d7/0x1500 [  207.322479]  ? __pfx_device_add+0x10/0x10
> > [  207.322481]  ? drm_debugfs_add_file+0xfa/0x170 [  207.322483]  ?
> > drm_debugfs_add_files+0x82/0xd0 [  207.322485]  ?
> > drm_debugfs_add_files+0x82/0xd0 [  207.322487]
> > drm_minor_register+0x10a/0x2d0 [  207.322489]
> > drm_dev_register+0x143/0x860 [  207.322491]  ?
> > xe_configfs_get_psmi_enabled+0x12/0x90 [xe] [  207.322667]
> > xe_device_probe+0x185b/0x2c40 [xe] [  207.322812]  ?
> > __pfx___drm_dev_dbg+0x10/0x10 [  207.322815]  ? add_dr+0x180/0x220
> > [  207.322818]  ? __pfx___drmm_mutex_release+0x10/0x10
> > [  207.322821]  ? __pfx_xe_device_probe+0x10/0x10 [xe] [  207.322966]  ?
> > xe_pm_init_early+0x33a/0x410 [xe] [  207.323136]
> > xe_pci_probe+0x936/0x1250 [xe] [  207.323298]  ?
> > lock_acquire+0x1a4/0x2e0 [  207.323302]  ? __pfx_xe_pci_probe+0x10/0x10
> > [xe] [  207.323464]  local_pci_probe+0xe6/0x1a0 [  207.323468]
> > pci_device_probe+0x523/0x840 [  207.323470]  ?
> > __pfx_pci_device_probe+0x10/0x10 [  207.323473]  ?
> > sysfs_do_create_link_sd.isra.0+0x8c/0x110
> > [  207.323476]  ? sysfs_create_link+0x48/0xc0 [  207.323479]
> > really_probe+0x1fd/0x8a0 ...
> > "
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index e400ad5c9f9e..329d17fd6100 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1059,6 +1059,7 @@ int xe_device_probe(struct xe_device *xe)
> > 
> >  err_unregister_display:
> >  	xe_display_unregister(xe);
> > +	drm_dev_unregister(&xe->drm);
> > 
> >  	return err;
> >  }
> > --
> > 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
