Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EC3CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 19:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BF710E164;
	Fri,  3 Oct 2025 19:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtrVd1s1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D31710E164
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 19:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759520343; x=1791056343;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AvKN1UgQz9IEreQCiESaybrg6AmT1r8NdeM14sariJ0=;
 b=UtrVd1s1Bw8L46HtuBGtx8fU8R4/G6h69c2Ge1jCTRlMJ0oo4fqP+Mkq
 0lyLte9OvxezpQx2nZOj3cd0cF35kQZaCHoFt46Xvu/tHnUrCjrEzeSZt
 HcG0TAO71nXK7aly0VwXF37WE6VBaxRjvob+lc3rbgEpbuPs+XCunU1ey
 ppg7snlMXBI8sXsACqRbCEaD3pSb6kN2M7PwMi+kmz0rNI0+Bur64m0bi
 bNvx7ybaTXmRAMNH+ml9ja/y2xMej6ra+MdC1LwK/WLjtZTrsU38DCEdW
 lRYiiro3NdCEDbr71KpEquYz2sgk5LzZjt4LnYWUxXwg0z8IeJY0N+qnV w==;
X-CSE-ConnectionGUID: 7WY967P5T6qeIsXW2pcN6A==
X-CSE-MsgGUID: 3IeHuZZyRDeVxbgBPGT82g==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72425045"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="72425045"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:39:03 -0700
X-CSE-ConnectionGUID: YsOSSP2kQdGUtCX2YY/piQ==
X-CSE-MsgGUID: myeGRUGhTNC6ICGMnKuHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178489308"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:39:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 12:39:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 12:39:01 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 12:39:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2DoHXf5Qwfke0kjNHOAFXqNaV+whiK/s1dBA34/Mn4ygnF+YYp7R/zFLaskGAGTgC90lYGInEn/ZBa71Kg047GB5NiSEbmsCvso5slxMwVQAXQPh06Nt+O2cMK4Z/VdKg9bzRNHb99CeC9Cuo8xtVPShlWf42m8Qf7rZEDMkS/UfD3zpvYLXelInz8NR/nRgqOR1DWYFAfL7YynUNEplUP0NPog8Z06x6gDKds7YIMTa8enVj4m6BvIiDYp4TzrXTJNFXhIGCKLhbIArNTQ//U7Xf1kraEHV82tYDRooNPq2gz5nyWCfl4/F0Dvz5vmfpTkTkJLpWm0SI4FVNUG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vb31+Otp2nxefo1l/jxrr0KZbyAuB9i6c+rTw77ftv0=;
 b=JuFNEMxGlIvOaOqDdRKELxO2sfxTN1ynZwPmcxN47eJBTPXmHINso36J0vuoCowDQuA/JiBrMLV053Ae/GhFjwMYiaqIF9TwCYE8HjN5/vxugnkXo5M4t37EJ3nQ5S+SR+tGNnBLriem9UBtAPRg6BW1x4yFx5UAaqgnpn5INYOpz4A4FEl6Fuan72Fn+x+APCFLdn1tbiRuAOyE7soXutl9fR2ykiAJZnBt5dzzRDQGz9/2uv+LHp1CLSXYtmfTFvoNjD0eGZxGSw+DYCqyRMmCZx9kMOG+KfulGvKn0LW/Gvx7T53AXi1kOrHMN8GyD1eh7eivuFl0Pf2owKxV5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 19:38:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 19:38:55 +0000
Date: Fri, 3 Oct 2025 12:38:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Message-ID: <aOAmTW76SjtPpS73@lstrano-desk.jf.intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-8-stuart.summers@intel.com>
 <aOAb0JnFULgND3ad@lstrano-desk.jf.intel.com>
 <65030659cc8fb5da4eaf4f28aa822bb149e0453f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65030659cc8fb5da4eaf4f28aa822bb149e0453f.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0264.namprd04.prod.outlook.com
 (2603:10b6:303:88::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe43e42-6253-4077-3fca-08de02b47d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SL3UUMCmq1FgV9enejmGNHEB6n5VWLG5+ueczxvVfzMfPnpo6nlUSH0pTA?=
 =?iso-8859-1?Q?ASUoz5bCCdMjEQGCSknwc/73du+3b3bIW1LKeRcoS5DtbzGZQD+iPsaRA7?=
 =?iso-8859-1?Q?ZdAe7oV2rmL09IYBVRhWwO9/sRErqntzM85/QoGH9vV5dHjLlsHW7kVn+V?=
 =?iso-8859-1?Q?zKjClETmWwgUtJnDwJ0H+1ch+RymKr1zJC9WY5MIbTk1jpNZj7FSdpKXcG?=
 =?iso-8859-1?Q?sMFK31NcA4Qk2jp0KHONBwH9+pgk+4dMfn11pB7P44rrrPV86re/JhAfEk?=
 =?iso-8859-1?Q?B1AnIQs/cxSPllKn3lESXvoczNxKdhRI6Kv8UevZONTzVY3pHVOgoGsA68?=
 =?iso-8859-1?Q?UNdRgmIAmle0SGTjAa1FZoWu83/I+9Vji42LftLBhvPQS2yxJx5NN/ZGXK?=
 =?iso-8859-1?Q?V9GsNYL49S17k+1nfVyjlasqxCRMjJKHxonQQuqemthx/w89uu3xX7AP08?=
 =?iso-8859-1?Q?WNuilatdHC/UkNw9y8eIXT0VRdRQpk3uv7/9isFCRCilsyIEtGht4Afmre?=
 =?iso-8859-1?Q?NzBLPMI6T/Ez2p9Qnkv67BGZP+nocd8l+i3BJl2Lmx6k1GQ8GxoJHP9TNB?=
 =?iso-8859-1?Q?KVyTI+JgAUqCTGnCCF4K8PiAqaK0znjfsrAopX7hwy/v/eIpcWDSYOfEre?=
 =?iso-8859-1?Q?9YxUZrgUrkWa5SKyTKE86MRbq80pLic5uHgdHt4vTdxPmz4t+JcjVnzHhZ?=
 =?iso-8859-1?Q?kStblPeLEy2e5F4tsS2Kq7b6GsBfKSjq/q3KbV6s7fnfWlHgsbBFPGd+OW?=
 =?iso-8859-1?Q?YJdAyiTq6PUMLhi10ngWfwzI969I/GudGDmqU+wZ4g32fVxb9qT9Tp0JDr?=
 =?iso-8859-1?Q?ALg2yROPT5Z2c5sspFcX3ur25OZpnlSGbzf1qMJ/5tn+26lBWGrFNh+yJD?=
 =?iso-8859-1?Q?34y19DQvJ7afnY+URRTptoI9hCZSRmXDi+tKvJlnDldXpsL+jzmaSmYPfO?=
 =?iso-8859-1?Q?07tTS48dePFbVEyEDhqHN2VYa1hZ17A9G4S/SwiFpSFIkmnEE2QuN1jLEf?=
 =?iso-8859-1?Q?WFlhDWznrY52BYqeamb+rUuovpipL8VWUHMTssN81nheqoa4ty0lfCeGyx?=
 =?iso-8859-1?Q?lILafHt6jFQPjsDzVxxDLl4gtBdZ8fqUmviKKHpYUXUqgB0F3VlsSYjU9w?=
 =?iso-8859-1?Q?IQJnOW/gKH7pER7YDA6pKyhJuLEWJkjlxg2AUsMxyhjWQwKmWTl0LFhAMU?=
 =?iso-8859-1?Q?liTCwrax3LQwAKixfOb5r1MJOodL6i6XJnLDMVCv2E/mwWRCDS0FCZbW6o?=
 =?iso-8859-1?Q?wl0alloNnxkjuSvCwc6P1645PhiF1QG+04zDYoJlQAB3xZd3yAJw1pbfJI?=
 =?iso-8859-1?Q?OATTRPXEmUDlOI9ePPLa7MNv2W8Ldds5MJiDc1osdHgiVRzZMNfMNosXCH?=
 =?iso-8859-1?Q?fLOgpS4h1xMWkYKZAtDHHuH3ofwtJvE7GhlBXBlrp+8tbzMFaq4j3x0T50?=
 =?iso-8859-1?Q?Q7PWfSLPhrRXFyZPndZDdqMgXQ2zMlOmL7EY8fB6dIRzTADYuoaKcMHJwk?=
 =?iso-8859-1?Q?JtGh78RoFIam7Pfl+GC9Kb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TbW7WbMpxE6IenvcPeuqEYabi9Lkv0n/quqPFSnK6lAIN4gClQB3R8cpk1?=
 =?iso-8859-1?Q?G2ubYFQ4NovBsJCOuG23+8hZncFekeh2c6X/CFqSGk+NxnhGoZbn5jVkpP?=
 =?iso-8859-1?Q?Qbsa5ebW4CJVHWHVxZA2LO+BRycZhQS3O7YYkN4WZ4cC94/v2cF41wsZ2g?=
 =?iso-8859-1?Q?wW6ug42QQfzuWTUf9dsaqq9My4qtF9P6CYVkfKreW4QZ2lrlMhrrJ4jQ+p?=
 =?iso-8859-1?Q?FNFs+uuhOjcE1JnZgWuW9lateGmHeleENFqt7z3lyhPTe3WIMItqmHIB1N?=
 =?iso-8859-1?Q?r2dpRSUgtn2PtFnD3+ix1NuxoQLpSNP11OtdBa3LMxWIJWIvD5q++3mu3u?=
 =?iso-8859-1?Q?0OOI1QEmcGNdizOL5/HPxnyM+RxkBV6V9r+jXSKZYVjsqRw9E9eYxrFiN6?=
 =?iso-8859-1?Q?cEaOF2vqRFM/rsidOjQevJemh+m6dOaTMqwaCwMMUHTveQbBvDHnOJLi/t?=
 =?iso-8859-1?Q?Onxt/c8Lvu2Stp/XHzMUZ94Zwn0O7OfI7POx99ZQMeTk2sa5jlrDThpjtf?=
 =?iso-8859-1?Q?nB66AYF247ZSI1hHDs9ph3Yq89+BwlMRFGRB+YIqLbDef8hFAzlwBUE+uT?=
 =?iso-8859-1?Q?s1dBgGDG7XUbe8TP/lgOPboU4ZG4B84uC3YY6a7mauXTQAjGDUmfzqxgxg?=
 =?iso-8859-1?Q?ykV3gyldEUITBv7epSvcd5FATqY7SLO8RfD91+cXDTkcsynWoZNrmiJQEn?=
 =?iso-8859-1?Q?Bob1hPo7bALyB7rz7fRHVKUQ1EDQfZBsa5fJyDefH5DGZ0lza/cgLy5Wnl?=
 =?iso-8859-1?Q?DRFNHVDrJuXGjv35FillPTg3Z18Q6aMEGogGfHfs9yrNm4AGLgs97x/F4L?=
 =?iso-8859-1?Q?eYU12KrR/Rc1JJNtcdcnNcoFEKt/AHl54b8AlfAgqKSnu5Vwg1EkpEh1z+?=
 =?iso-8859-1?Q?v7IrTpw2IRSgUqrA0c6UnD7c8K5s9wB1vvrB5YLJayPY7hdfG7110OaYZf?=
 =?iso-8859-1?Q?Q9fEzVUviRu7Pbs3NGYj/L7H9qjnWkmflhD851CDKPrcp3TlT83Y3YInOw?=
 =?iso-8859-1?Q?j7iexQ6dPWg4FekMkprsJzPbANQzZElQj4SvMlRDbVnvjFwf03XjkJslTP?=
 =?iso-8859-1?Q?tzxO8SDFtMZRulsP3uu6x6FMISB77gBCBDB5b8iQrHE8hnBME5WjYjxG62?=
 =?iso-8859-1?Q?pah44jkz7ul7ayj6z9wcH9gXwRq3AoTPz9QRFovA2qVgXFjhyWNOuIOhve?=
 =?iso-8859-1?Q?rkMe7Lr1MrBGoVn8hz+Y1E4YpmOA9aUGa4gfsiwHnycAZJnfCWUo7x8/du?=
 =?iso-8859-1?Q?deCWCTTywuHplhoIcbIiCJUJIlghFNeW7CF9VBTXpNj61bMI9dB8TzIF0U?=
 =?iso-8859-1?Q?dmXf/lsrbGTeIxPTQEdUqz/XxsdBFnhBOXe4Y5zGKpUS7RfaI7v6ReLGZM?=
 =?iso-8859-1?Q?6QOCXp6urZ4UUXhDVuBfnrrbAQHYahOC9Bg5swEsDg4Ka+66TJoz/uQJlk?=
 =?iso-8859-1?Q?rrHyKZtniWjQfXqumFKUbDRrGzERPxsrgSBHM+o8dgGNViXNKvb2Zfsas3?=
 =?iso-8859-1?Q?LEa+yZXQbIEqSPQrQfloPeds5Itt7OEf8DDtxWZa7yco88QSWHVhS0Zd4K?=
 =?iso-8859-1?Q?AkFIYv7Ya4qyjUwhA0XyVyuMpiXb78P8fsSm1yQ8QnPYTCqbPdiNhg4mWt?=
 =?iso-8859-1?Q?pHnRNkdJIH9ZVUpBulSGc6ZFpnSVimqrLN/IznYLJ5XVsCvoZQXgnbzA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe43e42-6253-4077-3fca-08de02b47d7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 19:38:55.7505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMWFvIZTWhSUDWG6+QrdXZPAm1aYDEs1cMtPXSW5kQH47t0JOhOnVqrXRlCXtLiwbM4peRVCQ7H3uQVFCFccrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
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

On Fri, Oct 03, 2025 at 12:58:37PM -0600, Summers, Stuart wrote:
> On Fri, 2025-10-03 at 11:54 -0700, Matthew Brost wrote:
> > On Thu, Oct 02, 2025 at 11:04:44PM +0000, Stuart Summers wrote:
> > > In the event the GuC becomes unresponsive during a scheduling
> > > disable event, we still want the driver to be able to recover.
> > > This patch follows the same methodology we already have in place
> > > for TLB invalidation requests, where we send a request to GuC
> > > and wait for that invalidation done response. If the response
> > > doesn't come back in time we then at least print a message
> > > indicating the invalidation failed for some reason.
> > > 
> > > In this case, we send the schedule disable and the expectation
> > > is that GuC will respond with a schedule done response. The KMD
> > > then catches that response and in turn sends a context
> > > deregistration
> > > response. So in the event GuC becomes unresponsive after we send
> > > the schedule disable, we actually have two g2h responses that
> > > have been reserved but never received.
> > > 
> > > To handle this, make sure the pending disable event in the
> > > exec queue gets cleared (i.e. we received that response from
> > > GuC). If it doesn't in a reasonable amount of time, assume
> > > GuC is dead: ban the exec queue, queue up a GT reset, and
> > > manually call the schedule done handler. Then in the schedule
> > > done handler, in turn, check whether the context had been
> > > banned. If so, manually call the deregistration done handler
> > > to ensure all resources related to that exec queue get
> > > cleaned up properly. Without this, if the device becomes
> > > wedged after an exec queue has been created, the attached
> > > resources like the LRC will not get feed properly resulting
> > > in a memory leak.
> > > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++++++-
> > >  1 file changed, 22 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 45b72bebfc63..a177d87c8524 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -939,6 +939,9 @@ int xe_guc_read_stopped(struct xe_guc *guc)
> > >                 GUC_CONTEXT_##enable_disable,                      
> > >      \
> > >         }
> > >  
> > > +static void handle_sched_done(struct xe_guc *guc, struct
> > > xe_exec_queue *q,
> > > +                             u32 runnable_state);
> > > +
> > >  static void disable_scheduling_deregister(struct xe_guc *guc,
> > >                                           struct xe_exec_queue *q)
> > >  {
> > > @@ -974,6 +977,17 @@ static void
> > > disable_scheduling_deregister(struct xe_guc *guc,
> > >         xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > >                        G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> > >                        G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> > > +
> > > +       ret = wait_event_timeout(guc->ct.wq,
> > > +                                !exec_queue_pending_disable(q) ||
> > > +                                xe_guc_read_stopped(guc),
> > > +                                HZ * 5);
> > 
> > This doesn't look right. Deregister is designed to be fully async. If
> > this flow stops working for whatever reason the GuC is dead and
> > eventually somewhere in driver will detect this and trigger a GT
> > reset
> > which is cleanup all lost H2G.
> > 
> > > +       if (!ret || xe_guc_read_stopped(guc)) {
> > > +               xe_gt_warn(guc_to_gt(guc), "Schedule disable failed
> > > to respond");
> > > +               set_exec_queue_banned(q);
> > > +               handle_sched_done(guc, q, 0);
> > > +               xe_gt_reset_async(q->gt);
> > > +       }
> > >  }
> > >  
> > >  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue
> > > *q)
> > > @@ -2117,6 +2131,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32
> > > guc_id)
> > >         return q;
> > >  }
> > >  
> > > +static void handle_deregister_done(struct xe_guc *guc, struct
> > > xe_exec_queue *q);
> > > +
> > >  static void deregister_exec_queue(struct xe_guc *guc, struct
> > > xe_exec_queue *q)
> > >  {
> > >         u32 action[] = {
> > > @@ -2131,7 +2147,12 @@ static void deregister_exec_queue(struct
> > > xe_guc *guc, struct xe_exec_queue *q)
> > >  
> > >         trace_xe_exec_queue_deregister(q);
> > >  
> > > -       xe_guc_ct_send_g2h_handler(&guc->ct, action,
> > > ARRAY_SIZE(action));
> > > +       if (exec_queue_banned(q)) {
> > > +               handle_deregister_done(guc, q);
> > 
> > This would leave the GuC with reference to guc_id and subsequent
> > reuse
> > of the guc_id (i.e., next register) will fall.
> 
> But again, in this case the GuC is dead and we should be getting that
> reset event you had mentioned above. The issue I'm having is

Banned is a per thing queue and more than likely we wont be doing a GT
reset, thus we still need remove references to the queue from the GuC.

> specifically around wedge events. Without a GT wedge, we will normally
> go through the GT reset flow and recover like you mentioned. But in the

No. See above.

> case of a wedge, we don't redo the software part of the reset (i.e. we
> don't reset contexts, etc) per gt_reset():
> static int gt_reset(struct xe_gt *gt)
> {
>         unsigned int fw_ref;
>         int err;
> 
>         if (xe_device_wedged(gt_to_xe(gt)))
>                 return -ECANCELED;
> 
> Maybe instead of banned I can check for banned and wedged here? Or
> maybe we should rethink the software reset flow in the event of a
> wedge?

The idea with wedged is we leave all hardward state, including the GuC,
intacted for inspection. So I think a xe_device_wedged checked here
makes sense. This would cover the case where start a queue teardown via
a CLEANUP message and mid-flow we wedge the device.

Matt

> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > +       } else {
> > > +               xe_guc_ct_send_g2h_handler(&guc->ct, action,
> > > +                                          ARRAY_SIZE(action));
> > > +       }
> > >  }
> > >  
> > >  static void handle_sched_done(struct xe_guc *guc, struct
> > > xe_exec_queue *q,
> > > -- 
> > > 2.34.1
> > > 
> 
