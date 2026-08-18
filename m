Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EABC5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 20:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1D910EC8A;
	Tue, 18 Aug 2026 20:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWZFUtGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7BF10E4E0
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 20:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787083644; x=1818619644;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FGNtcdRPQEZLAi9EkZ8vFgDgGqdSfhA+Br7EQeyuZfY=;
 b=ZWZFUtGBYDA8P8hUxvBmWztauN9HFJVhock4Vj3pgQtbqMu9OtFL1+S6
 DqJSUBg+8g14aqfDL1L4olJpA27XvS3/+awfHxjDH/V1d7v1dw69U56+L
 e0pN7ZYty8xZcO3htEDYvH131zY5p0Po56FyJLfo5TH+iFOiD5pMpTC1c
 b+NbaLXnt4BRvMTbmzlpc+ea8OkR6k6iym0yhKroF/2VIPznx9lFzkwNP
 4/jEP3To4YCQMlCTmnqeWvShWjdNOAMUFTAtvQmoEPcAlW+OKDnnXlFjE
 xi5WLUOgzPXT2NjKJzaST9P1IgfMvmJPjOoDKfInfmqYEPcz138/NKx4W Q==;
X-CSE-ConnectionGUID: E+kgBrMVSt6otT7+Y2qvGg==
X-CSE-MsgGUID: IxW/dzuWTMKIYBbfz1pxIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97925799"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="97925799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 13:07:23 -0700
X-CSE-ConnectionGUID: sbD0AjT6Rd67KVgNK+kZ1g==
X-CSE-MsgGUID: KwgR6/4zR6aIqEJ3S7sKyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269159332"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 13:07:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 13:07:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 13:07:22 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 13:07:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFGDx6BI07V1DhKQvYPBsG/GGlYNog07OcnE53n8wmuzBK/sA7lJmu42ZRpr7Bl6SuK/949VHjhfaCEx73q+dNIzdDsvj8lh+vTUq2Ehd3xyVrAiLXYRtXed346EiF1z7GIvrkijw0ijaYTx7Kx4res8sHBw/20wA9lUjZ26aSfL72Td9zbW3ESRy4diufGbJdrdtYeXN2JYJosHMR23CCYB0Jwd59jURKg5/ro5Rsfnmt+w5cmFkxlVa6Q0yG8qVxgiOIHixV4n+9UdprP6czPWLWM9hMnma3bCe4WA8NfwW37OVp3o3QzKfNhIX1KGBv3J7yaX608lBFSq4cx0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS5Sr1QTdDaBdVJTWtcTRvb/XDIEzzLs4lPEn6R9QAo=;
 b=haXuuE2kOj7qbUc4puUlcwZJfkb++WMa/4aPmBdq2OkIsZRQ0UzTsvB+5cBMFuD69P3/59njo5Dl4z9eGEKZ8MjHvIHY08AzbhFsjsbgZoV8tXNIXFURlIFW5m7lqAyMphNP2CwTd7jyPWaJ++/0BK1kT557TMYh3Bkrt2Un2fLKurc9i9Qyg2JLASthiVsokH4rSuP2zlXr3kSBB5o5TI3R0uSm+XcZamBNqWxe+m4cv3r4QccWm9kDNj3hdl+8OGlsdiKfmA2fkRsxahpY+9qOiR3bcrCwB05+ousVQ8VeSlypDDc5Mj7aoj09dGp6jlHH50X6ampoFtMGET0C6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by LV8PR11MB8677.namprd11.prod.outlook.com (2603:10b6:408:1fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 20:07:19 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 20:07:19 +0000
Date: Tue, 18 Aug 2026 16:07:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Add force_p2p module/configfs parameter
Message-ID: <aoS7cuG62RCP747L@intel.com>
References: <20260818154042.301638-1-nathan.d.ciobanu@linux.intel.com>
 <ad03c8234917a8b8e1d1777a0518231a650d1619.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad03c8234917a8b8e1d1777a0518231a650d1619.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|LV8PR11MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: aa16216e-db5f-4e1d-e576-08defd644e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: E31zBLTxeQwI0s/E/nrRrcYbZYDiXgkRglcqpyvsHcSbTpSC9QTWcbe0GOOXvWul1gg1vKLadDoCNVsWXCP0oocg6jPF94M9sXH5V3fzDPGFwv/gf01T0OdbNKmkPn4tXg2zaWRCBpbh7E28pF+9O9VMpwInio2vKtv4j0kgkzbcWid6bFN6dDiUEyvRJKQjQIjTukiWeKu0B1D5STKguLdYbD8z6egG5WdPjVDTpsB5fFuBOhKZK2NVQgPaAIVeMDdfyvxku9i6wD585h2fzqZ7Jh4KgwK5PUGRUmfdyyjnUSqW+edGc0Dp6DyglZ4+7fiF0E5VFvszCUgZVEwNrmX318DxtXOQW4TzmxQk49WzVYfq58NIRjfwQcLDYKgPGeu8URvW5QUbCaZkhOkl/EoDQw49wgyb/MRct17/x4TelyIVYRFojx9Pp6knFDmuFZvuho8g19AqFjv1HmbUURiQr/7kzsyEqiOz/Vfl6NdsvEEkKPxulgqkNKkN0+ZgyZmza3Dq9ZR+VxvAPUJuMReimPW6VxpLFMHm9gMrwD3zFdWxApFDqwpY8obxI8WPH9vMJsOTaUoXRw3LfUk67XONJoN/h4rNBI+nu/S8vPXAI2d1xiIxO1SLOvl1Zt1H0borOtIZtd476epVn/BYuToHr3n5iDAftaphnjPbY3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5kh9kyk6af56SRkVr6oLzIvqrB2ktTmXO1pLUOSqRd2883IYRFuPyFBBUU?=
 =?iso-8859-1?Q?sSCS22ItiExZF+wHDf3A+d6h5xxwFOD6OI2WHhuTnJ4TpOZWfpMftixstF?=
 =?iso-8859-1?Q?AumdHPIn6TabVjI5FDkxl6BPhdrb0wvA4mF+TkVSaBIJ0TVa6rg7RFo4gI?=
 =?iso-8859-1?Q?jlHLXTgka8fEzFZjHQxcXWNE1eBimkT0imuW58jtjWh+dWDwXvrDSGf+ZD?=
 =?iso-8859-1?Q?YKbJMa40NMI4OsAhlrAoRezWUjEzJTfuf6pUHdlRoWO7Fv9NziAHccXc7P?=
 =?iso-8859-1?Q?pMFFPDRw2gqnUIkFEMhDYj/5xNxAYJ1YYsPNSXVPHdNWO01sVBB8S1s/V3?=
 =?iso-8859-1?Q?E7JwfmHkZhlvRC/NN543TdF6HsgGoLLaPkCEDm7VwHTXiZltb+bwx1N+SQ?=
 =?iso-8859-1?Q?EBuUb0xuon3YX0Fxwlzsyv6BLB69wwHkRye6PAv9y7eZWqe5usmUmSfDS7?=
 =?iso-8859-1?Q?q769SHzrcZaWtC5zva8NUOIU56R4N2kOScU3i6coPdMwQeZ10A58DqQNE1?=
 =?iso-8859-1?Q?900HZZ17vF0fMsvcY7stM5WiwSBlOw5lMa5oEqJczDvUXtEDSKgqPj+GBX?=
 =?iso-8859-1?Q?MP2qe0EhGpZnG5A2YL1dDZVQn0drS9ZPYLX+4Ml2zPTxawl2lzcJXYjRlo?=
 =?iso-8859-1?Q?un5/33bvMfhxbj4uKbtn+tg351pk9KhEs8z4/HOI1sq6gcab6YZ+YA5OOc?=
 =?iso-8859-1?Q?T8If3+M5cFYoavU07tCJH3qlTucbZYVm4M8saYMDSP0rrDRGaCyyIwRerV?=
 =?iso-8859-1?Q?vObvosOZDhtnlyjNwVsa9/n7uaA1g9gzUC4E3PRBkI1gdxZAqvY7NuYpBx?=
 =?iso-8859-1?Q?5a2ovkBJBesZ2wv4sQ1rcu8A3hMlcVU2quINcdIJwuQkDHY4HrFPrMfgnY?=
 =?iso-8859-1?Q?CxcrJuoa14AoE6zmXd/tUSzABcisJvFf6uOk6UUVMjIHe77bvdTj7tBfLU?=
 =?iso-8859-1?Q?Uqd/lotXDdQkuQkXDIdmLHD+8hIZME9VH9RVNyjKM64ZiYYI/eb4ND903m?=
 =?iso-8859-1?Q?3jFK5w22b7Z2nMt2teD5gGaKdw/2MzdA3v8GVAuTMIFq9w3YRWJ84eMF+U?=
 =?iso-8859-1?Q?NB/bo38BCL3aI6/pYSIOQL2tckvgTu9K0vdBuZ3W1dvKV1dOSLlyAarpww?=
 =?iso-8859-1?Q?G5RKd34U5xSRri1eeD28/nV86ZLgXKRJbk6N30GDb79pJBLd/NqtH9aF8g?=
 =?iso-8859-1?Q?+sGSePfjVwL2RtT8zkMF0EhGbsUY9Eh3IjPOHObyNN2Zhep262P4el2uZk?=
 =?iso-8859-1?Q?vIoikedfrNRgupu6IEhqPv4N1WCxDtZeCbK9XuVdzEEnbql94tQvedoiDK?=
 =?iso-8859-1?Q?5qbYCqYxC+xLi7kic6OR5G5UXGEBlgkNtmZlFdYyq1C5Zv4kQjTAjm69FO?=
 =?iso-8859-1?Q?3AgmUjDL8WWXS/yrcijUImXK9Ej8Wic6nottZxMR+uA5RaYrhHPyMXcCVt?=
 =?iso-8859-1?Q?BOjVhJUGgzRRtlQS7MwmMj9/YeBopHaCqWKJSs9kK8K81GzH+R0d032HSl?=
 =?iso-8859-1?Q?5OWYiB4SWKH2sVZY0AzxC4zvb4JfGFGjAfEBPrbnK3uG+N/uGYN1EfUfob?=
 =?iso-8859-1?Q?9x6UHL4C5BLTXcUJ0m8eVrdc6dguZ9U5Zeis3PXIAkx0Pjeux0W2PkT3+u?=
 =?iso-8859-1?Q?t9eJehFLSpE1rMcJLud+Th52lDJRG9e4MBEkWLmW/jjj6NjSgdrJk6RuYJ?=
 =?iso-8859-1?Q?7UzL4b0Cn4olzc6sN8ou/+CXUfF6HRzlQ+P9ytNLFxdt1eNvdcGwfCyT+9?=
 =?iso-8859-1?Q?4np2xm+ObDD0U59z2r5dIOhWKeodpnlzPqvOoPnLvH+PbolytlHmrxrGbe?=
 =?iso-8859-1?Q?3tcjWw6RrA=3D=3D?=
X-Exchange-RoutingPolicyChecked: a/rqvz7aiXmtaiR8ie4CPLzmCj1C18H8nhYIpOul1mvP8cus5/88b/zF81SDeIk34JiueLCpm61L5DbwMXZyopJB83jkBdTnJcczrTCLAmC2suFpbMZ3eooSofdXUsfQV6nj0opxKHPTBmY6pUrF5AFb+ZrofD6BT/chR68voIhOQq4UkC8oYHzJPszJa6WJXN/bV/tGK+knfeiTNAwcHrAk61ZTr12hKwImw/fl4PpJApHds3r1cNG206+ezXfJ7KceZc8cmIVfyav1QNmRd3mtLjbGpBQtmRuG5v1jXnz4ijOcFHZ/IOlxTKhi2x+CLBrpyNDsE34rIdKprjn/kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa16216e-db5f-4e1d-e576-08defd644e5d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:07:18.9057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nctbW/p+nBgon0Po7ISjeKLh3y6L49sbS53s6rcqb/pkCh2Rb78lvq4v4euinZJLxfGC26cgVUGeJITrMiuayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8677
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

On Tue, Aug 18, 2026 at 07:08:51PM +0200, Thomas Hellström wrote:
> On Tue, 2026-08-18 at 08:40 -0700, Nathan Ciobanu wrote:
> > Add force_p2p module and configfs parameter to give users an option
> > to
> > allow P2P DMA between GPU cards that are connected off of the root
> > bus
> > with no switch/bridge in between, as seen in some virtual machine
> > topologies (Q35/QEMU, VMware):
> > 
> >  \-[0000:03]-+-00.0  Intel Corporation [Intel Graphics]
> >              \-01.0  Intel Corporation [Intel Graphics]
> > 
> > or
> > 
> >  -[0000:00]-+-01.6-[07]----00.0  Intel Graphics
> >             \-01.7-[08]----00.0  Intel Graphics
> > 
> > In these situations the p2pdma distance calculation API would fail
> > the
> > host-bridge case
> 
> Why does it fail. Typically there is a very good reason, like the host
> bridge is not whitelisted?
> 
> 
> >  and not give a chance to users to take advantage of P2P
> > DMA.
> > 
> > This module/config parameter should be used with caution after
> > proving
> > that the memory mapped between the two devices is not getting
> > corrupted.
> > Users need to verify that the platform's physical topology
> > allows/facilitates P2P and tests such as the IGT xe_peer2peer pass.
> > 
> > Assisted-by: Claude:claude-3.5-sonnet
> > Signed-off-by: Nathan Ciobanu <nathan.d.ciobanu@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> I don't think we should do this, but rather fix upstream the cases that
> should work (probably by whitelisting the host bridges?)

Right, this looks like a good patch to be in some downstream tree for VMWare
since they don't have ways to create the virtual bridge for the proper whitelist
handling.

Or get this case and take to the PCI core kernel folks and see if there's
anything that could be done in the whitelist for that case. For qemu this
is not an issue because they can setup the virtual bridge, so they might
just push back on that as well though ;/

For-Downstream-Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thanks,
> Thomas
> 
> 
> 
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > b/drivers/gpu/drm/xe/xe_configfs.c
> > index 052cce962161..187352a8b419 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > @@ -255,6 +255,39 @@
> >   * The created device directories can be removed using ``rmdir``::
> >   *
> >   *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
> > + *
> > + * Force P2P DMA
> > + * -------------
> > + *
> > + * This option is useful in virtual machines when the PCIe emulated
> > topology
> > + * doesn't mimic the physical one and the p2pdma API fails to
> > calculate a
> > + * distance between nodes due to whitelist checks. In such cases,
> > the user can
> > + * set the force_p2p module parameter globally or through configfs,
> > if needed,
> > + * have the option to granularly control that setting on a per-
> > device basis.
> > + *
> > + * By default, force_p2p will have the same value as the
> > xe_modparam.force_p2p
> > + * which by default is 0.
> > + *
> > + * The symptoms that point to the P2P issue that this option is
> > trying to
> > + * address is:
> > + * - dmesg errors such as "xe 0000:03:01.0: cannot be used for peer-
> > to-peer DMA
> > + *   as the client and provider (0000:03:00.0) do not share an
> > upstream bridge
> > + *   or whitelisted host bridge"
> > + * - Running the IGT xe_peer2peer tests result in skips.
> > + * - UMD libraries fail with p2p related errors.
> > + *
> > + * Use these steps if the global xe.force_p2p parameter is
> > inconvenient
> > + * for some GPU devices in your system. NOTE that this option needs
> > to be
> > + * set on both endpoints of a pair to take effect.
> > + *
> > + * 1. Unbind the driver from device:
> > + *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
> > + *
> > + * 2. Set the force_p2p option on/off:
> > + *	# echo [0|1] >
> > /sys/kernel/config/xe/0000\:03\:00.0/force_p2p
> > + *
> > + * 3. Rebind the driver to device:
> > + *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
> >   */
> >  
> >  /* Similar to struct xe_bb, but not tied to HW (yet) */
> > @@ -275,6 +308,7 @@ struct xe_config_group_device {
> >  		bool survivability_mode;
> >  		bool enable_psmi;
> >  		bool enable_multi_queue;
> > +		bool force_p2p;
> >  		struct {
> >  			unsigned int max_vfs;
> >  			bool admin_only_pf;
> > @@ -295,6 +329,7 @@ static const struct xe_config_device
> > device_defaults = {
> >  	.survivability_mode = false,
> >  	.enable_psmi = false,
> >  	.enable_multi_queue = true,
> > +	.force_p2p = XE_DEFAULT_FORCE_P2P,
> >  	.sriov = {
> >  		.max_vfs = XE_DEFAULT_MAX_VFS,
> >  		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> > @@ -304,6 +339,7 @@ static const struct xe_config_device
> > device_defaults = {
> >  static void set_device_defaults(struct xe_config_device *config)
> >  {
> >  	*config = device_defaults;
> > +	config->force_p2p = xe_modparam.force_p2p;
> >  #ifdef CONFIG_PCI_IOV
> >  	config->sriov.max_vfs = xe_modparam.max_vfs;
> >  #endif
> > @@ -563,6 +599,37 @@ static ssize_t engines_allowed_store(struct
> > config_item *item, const char *page,
> >  	return len;
> >  }
> >  
> > +static ssize_t force_p2p_show(struct config_item *item, char *page)
> > +{
> > +	struct xe_config_group_device *dev =
> > to_xe_config_group_device(item);
> > +
> > +	guard(mutex)(&dev->lock);
> > +
> > +	return sprintf(page, "%d\n", dev->config.force_p2p);
> > +}
> > +
> > +static ssize_t force_p2p_store(struct config_item *item, const char
> > *page, size_t len)
> > +{
> > +	struct xe_config_group_device *dev =
> > to_xe_config_group_device(item);
> > +	bool force_p2p;
> > +	int ret;
> > +
> > +	guard(mutex)(&dev->lock);
> > +
> > +	if (is_bound(dev))
> > +		return -EBUSY;
> > +
> > +	ret = kstrtobool(page, &force_p2p);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev->config.force_p2p = force_p2p;
> > +
> > +	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> > +
> > +	return len;
> > +}
> > +
> >  static ssize_t enable_psmi_show(struct config_item *item, char
> > *page)
> >  {
> >  	struct xe_config_device *dev = to_xe_config_device(item);
> > @@ -856,6 +923,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
> >  CONFIGFS_ATTR(, enable_multi_queue);
> >  CONFIGFS_ATTR(, enable_psmi);
> >  CONFIGFS_ATTR(, engines_allowed);
> > +CONFIGFS_ATTR(, force_p2p);
> >  CONFIGFS_ATTR(, gt_types_allowed);
> >  CONFIGFS_ATTR(, survivability_mode);
> >  
> > @@ -865,6 +933,7 @@ static struct configfs_attribute
> > *xe_config_device_attrs[] = {
> >  	&attr_enable_multi_queue,
> >  	&attr_enable_psmi,
> >  	&attr_engines_allowed,
> > +	&attr_force_p2p,
> >  	&attr_gt_types_allowed,
> >  	&attr_survivability_mode,
> >  	NULL,
> > @@ -1269,6 +1338,25 @@ bool xe_configfs_get_psmi_enabled(struct
> > pci_dev *pdev)
> >  	return ret;
> >  }
> >  
> > +/** xe_configfs_get_force_p2p - get configfs force_p2p setting
> > + * @pdev: pci device
> > + *
> > + * Return: force_p2p setting in configfs
> > + */
> > +bool xe_configfs_get_force_p2p(struct pci_dev *pdev)
> > +{
> > +	struct xe_config_group_device *dev =
> > find_xe_config_group_device(pdev);
> > +	bool ret;
> > +
> > +	if (!dev)
> > +		return xe_modparam.force_p2p;
> > +
> > +	ret = dev->config.force_p2p;
> > +
> > +	config_group_put(&dev->group);
> > +	return ret;
> > +}
> > +
> >  /**
> >   * xe_configfs_get_enable_multi_queue - get configfs
> > enable_multi_queue setting
> >   * @pdev: pci device
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> > b/drivers/gpu/drm/xe/xe_configfs.h
> > index 4fbbeafba473..45af69cb74b1 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > @@ -30,6 +30,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct
> > pci_dev *pdev,
> >  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> >  					enum xe_engine_class class,
> >  					const u32 **cs);
> > +bool xe_configfs_get_force_p2p(struct pci_dev *pdev);
> >  #ifdef CONFIG_PCI_IOV
> >  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> >  bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> > @@ -50,6 +51,7 @@ static inline u32
> > xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> >  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev
> > *pdev,
> >  						      enum
> > xe_engine_class class,
> >  						      const u32
> > **cs) { return 0; }
> > +static inline bool xe_configfs_get_force_p2p(struct pci_dev *pdev) {
> > return xe_modparam.force_p2p; }
> >  #ifdef CONFIG_PCI_IOV
> >  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev
> > *pdev)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> > b/drivers/gpu/drm/xe/xe_defaults.h
> > index 0884224ef7c7..3881e832566a 100644
> > --- a/drivers/gpu/drm/xe/xe_defaults.h
> > +++ b/drivers/gpu/drm/xe/xe_defaults.h
> > @@ -13,6 +13,7 @@
> >  #define XE_DEFAULT_GUC_LOG_LEVEL		1
> >  #endif
> >  
> > +#define XE_DEFAULT_FORCE_P2P			0
> >  #define
> > XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >  #define XE_DEFAULT_VRAM_BAR_SIZE		0
> >  #define
> > XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index bf0728838ead..bd8f8ad70bcd 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -15,6 +15,7 @@
> >  
> >  #include "tests/xe_test.h"
> >  #include "xe_bo.h"
> > +#include "xe_configfs.h"
> >  #include "xe_device.h"
> >  #include "xe_pm.h"
> >  #include "xe_ttm_vram_mgr.h"
> > @@ -26,9 +27,14 @@ static int xe_dma_buf_attach(struct dma_buf
> > *dmabuf,
> >  			     struct dma_buf_attachment *attach)
> >  {
> >  	struct drm_gem_object *obj = attach->dmabuf->priv;
> > +	struct pci_dev *a_pdev = to_pci_dev(obj->dev->dev);
> > +	struct pci_dev *b_pdev = dev_is_pci(attach->dev) ?
> > +				 to_pci_dev(attach->dev) : NULL;
> >  
> >  	if (attach->peer2peer &&
> > -	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach-
> > >dev, false) < 0)
> > +	    !(b_pdev && xe_configfs_get_force_p2p(a_pdev) &&
> > +	      xe_configfs_get_force_p2p(b_pdev)) &&
> > +	    pci_p2pdma_distance(a_pdev, attach->dev, false) < 0)
> >  		attach->peer2peer = false;
> >  
> >  	if (!attach->peer2peer &&
> > !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
> > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > b/drivers/gpu/drm/xe/xe_module.c
> > index 4bc28dfc1992..99cb2a455c6e 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -22,6 +22,7 @@
> >  #include "xe_sched_job.h"
> >  
> >  struct xe_modparam xe_modparam = {
> > +	.force_p2p =		XE_DEFAULT_FORCE_P2P,
> >  	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
> >  	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
> >  	.force_probe =		XE_DEFAULT_FORCE_PROBE,
> > @@ -38,6 +39,10 @@ module_param_named(svm_notifier_size,
> > xe_modparam.svm_notifier_size, uint, 0600)
> >  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in
> > MiB, must be power of 2 "
> >  		 "[default="
> > __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
> >  
> > +module_param_named_unsafe(force_p2p, xe_modparam.force_p2p, bool,
> > 0400);
> > +MODULE_PARM_DESC(force_p2p, "Force P2P DMA between GPUs (useful in
> > virtual machines), bypassing p2pdma checks. "
> > +		 "[default=" __stringify(XE_DEFAULT_FORCE_P2P) "]");
> > +
> >  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >  module_param_named(probe_display, xe_modparam.probe_display, bool,
> > 0444);
> >  MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's
> > left untouched "
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h
> > index 6272d9e41207..bb154c7b095a 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -12,6 +12,7 @@ struct work_struct;
> >  
> >  /* Module modprobe variables */
> >  struct xe_modparam {
> > +	bool force_p2p;
> >  	bool probe_display;
> >  	int force_vram_bar_size;
> >  	int guc_log_level;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 627a741293d5..3cd53bb166af 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -12,6 +12,7 @@
> >  
> >  #include "xe_bo.h"
> >  #include "xe_exec_queue_types.h"
> > +#include "xe_configfs.h"
> >  #include "xe_gt_stats.h"
> >  #include "xe_migrate.h"
> >  #include "xe_module.h"
> > @@ -892,6 +893,10 @@ static bool xe_has_interconnect(struct
> > drm_pagemap_peer *peer1,
> >  	if (dev1 == dev2)
> >  		return true;
> >  
> > +	if (xe_configfs_get_force_p2p(to_pci_dev(dev1)) &&
> > +	    xe_configfs_get_force_p2p(to_pci_dev(dev2)))
> > +		return true;
> > +
> >  	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >=
> > 0;
> >  }
> >  
