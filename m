Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02795C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 16:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75B610E03C;
	Fri, 12 Jul 2024 16:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAsc3Apl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0AF10E03C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720800651; x=1752336651;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ju2/Bg28UTZzabQmp/KGc6v9njmKHdwujWVdoV2babc=;
 b=FAsc3AplnwUxRkV4yNKjMIPp6q5HVQkQYpKJqbHA7HcP9amOC+g5nhng
 M8EMNJaxhpvqM6sEC+p9h1OFEc1BdTPunYUi0wISKk46YMFmg2yN53gpt
 TifGInzbSLt66mrxrDUmqd7Ko96Qj9DEhvsYlPmpPBit32ulqiu8GHUFq
 RjdkFLAdBLWp5BU4WzZEsEBx0vFIvnrgdSbTDtsSHB2YaHUWXC5/DCaAj
 m7Eu19xN/cd61rWQ881TfEWQsgWDAfhCB4OZKgde76TKKjuNzoNPmVHS5
 hqmZrfvP2kHeX+N0S0zeVIQjTR6FxxHGVL2+utvxK0X3fTnaWVfEZ876o w==;
X-CSE-ConnectionGUID: L9qCjq7QTYa6ssjxZoKupA==
X-CSE-MsgGUID: AVNSHD9pSlqCgz7qiU1YKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22009284"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="22009284"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 09:10:48 -0700
X-CSE-ConnectionGUID: X+/8bEk1S/Go0/rc6zUbIA==
X-CSE-MsgGUID: eJEEWJYoTUixQ2Hp+rd7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="49614371"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 09:10:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 09:10:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 09:10:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 09:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xm5c8Wyh9A8mjx4jQXl5/J/wB7EKi7FoHy7EKpMHZY83WrSQqXMDeuNAaDNghi7B1hpicRackAl8Rx/XLEZmDeSwd+zNPMSNwFXNOC5hpQspeG+dREaK2Zhw90/xd9PFc9gtH6TUnZ9H4Upcl/c0HR3nP1qpZh2/1PvowOIo2L5vh+bWHakMsG10EswY8BFgjaQ05rnDZL6KYkZ7H5Cdv0n2jq95QlR5xBp3pAIfZukyQLLAivzWb75Iy/UtqNYlHX69yCSM4Fqcss322/ur7kfGC3FCsfqLgCZgNseyYIFe3ZmCcef4HcgYAX3FNzUlEhzpLJ63XwtkJ1gDGt7v/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4859d4ZfF+e01lONKtSmxW6jZZUCXkfr/7xOGzDd6kM=;
 b=XaQdYEdGWD2gw+eQxdhExlXZp/5BriOMA8k8wVg//REUEiD6/qoT/8RD7Mvnb6M6Z1JDJOXgXUqUXTfKTrm4rn6TrW4J0BNAAFVXfmcakIHCeqDu9NgJv5OSSBi4NypAl2GW7DSRWhPaEHMxU0mujwK1E90SkNysO1fd9Gc3AeQ7lyjO2cqbuhdHNeGjOhZB6pTG0IH3Y4V2AvSlrT7kBoU0UoK8IJFxGBkizt47gRtZyBZdR02lBqg5VY1fkTHozYbEMwr45w1EXYpXRJq1pT26ly3FWwNdvY5H+oiIpj60J27PhzOqU5cnVObXCtgLtG14WSpa9eo1L7+2ZDfohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 16:10:42 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 16:10:41 +0000
Date: Fri, 12 Jul 2024 18:10:13 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <joonas.lahtinen@linux.intel.com>, <mateusz.jablonski@intel.com>
Subject: Re: [RFC PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
Message-ID: <ZpFVZT-OHmcIsm9j@fdugast-desk>
References: <20240203060534.6839-1-nirmoy.das@intel.com>
 <20240203060534.6839-2-nirmoy.das@intel.com>
 <20240216195254.GL718896@mdroper-desk1.amr.corp.intel.com>
 <f44d6246-e172-4036-9d5c-fc059a0e352f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f44d6246-e172-4036-9d5c-fc059a0e352f@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW3PR11MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: c145d0e2-f8d7-4d4b-2e58-08dca28d2d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eXJEroSYgfe4piXS6+wlqzY0fA1Wh1pf87MLQqHKYuca0eWdybhjRYpdf5?=
 =?iso-8859-1?Q?eL1gl1stxMad69JqQqsMiZE2CQz6MSs6xeYuumtB+yBTp3E1O5f890SyGt?=
 =?iso-8859-1?Q?GcNG/9II27v/9CLOMIaoJCd7iBrNsCpVQ09LvyDBYriJlBiLQcho6/+0Rc?=
 =?iso-8859-1?Q?CaMMgIjhZqNcWmDWb+KEbwNaeA2Nl7YKThsZ0TUAvLmT20/IdMts8QLrNL?=
 =?iso-8859-1?Q?E6tT8iGgxuYLC7OY0CQqDqjzRvMIAht4uBaxutu5H1nKjpW6Pe4usRczCi?=
 =?iso-8859-1?Q?PwL4bO5Diz1tviHIYSJZNmE5V013/EZNKKHY2Gu6CnRZ4vocLSdtpWK+SR?=
 =?iso-8859-1?Q?jpUNPT8lWziZwDz++c4fiUYumbVvaSPHpVCOivVotJ71YfMDg/7hOND230?=
 =?iso-8859-1?Q?BLeOEMRa3EcFFAQCMbP4RqJmyje0S/EBYGLZeztYik0Hzn+wLbvcU2k80C?=
 =?iso-8859-1?Q?dpwaUsi07mGSyPBI7Yqt9fpd5k5hgRJDRLVikmU+lrElB0W4cIzguJg43W?=
 =?iso-8859-1?Q?PRnlg8jYIEJLjePB4OSSYwStwWEiBY/tKW7fhRsx/UOiEkycUuHTwYzpoD?=
 =?iso-8859-1?Q?FihquzRmsuKX0LbrsBWhdloC8W3WU+gF6arCHsX1QuMYkhmXOdJIEJ6kDR?=
 =?iso-8859-1?Q?vEhAO+nulSlI+9BHCl3eslvHmtbRRn3WKZTMa+rChXCLxv0cTdMRk0l8Fd?=
 =?iso-8859-1?Q?gWJZ4iKRI/pNm4aL1pZ09oKHl306Tyr9Dk74Ew6m6t0j0y4fnMHpMhL1Wz?=
 =?iso-8859-1?Q?DKjmtwb9p1+9d3bFgi0HYGYy46SRl1IxAj//rUDF4rGi3KvXUjwzwQgVws?=
 =?iso-8859-1?Q?j6/8TAZR0kIxKS7+Cy1b2QrAgQgx6v7YMOQWz3PeafvL2RWnnYMj88h/9P?=
 =?iso-8859-1?Q?l+4vMUEFoXhk5g3mFqS09tEOBEsoJ7oJtllaY1u1e2CfYeyQ7lCCp9CK9E?=
 =?iso-8859-1?Q?YO4aiD7C1N1j53OVRQefeHmGDyUh7GVQibFCvPlW3uwyasVpwh7CChwwwi?=
 =?iso-8859-1?Q?9cYab7H/eCvWNg8+fHKQt8ZOYvrDo9McgiYNW6Fyi1qCD4ffnf192i0LWp?=
 =?iso-8859-1?Q?A7V/5ANYaHF4N1AZ4S2jo59xQMSHiKil+AJrveHbuTYTJ54eBciSPOjAuY?=
 =?iso-8859-1?Q?fpsuvDtNt8cS8gVsaGSx9Bpid3yabvgl1pY1g7H23t8qJrdK0x7rC6r+ij?=
 =?iso-8859-1?Q?zJBCDxB8o/p9H+dtx9FpEbTK0ronJu/58H5z/W/2BqiJi1t2Fo8/VJ2rxL?=
 =?iso-8859-1?Q?byictxIHEXMTXy4Q4gMgkUzqvml9cwIgaZqsPJSECTdmFGFYxp2dxhv7Se?=
 =?iso-8859-1?Q?nRjnHOed8mBgKzW5zxGnqd4g0HI21FXgTMVGxQoXItjPVMPOGchKyAAFJX?=
 =?iso-8859-1?Q?Yqz9FHfijI2yIE6CcwehtYg08UDLPX2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lo6uP3FIRQGWJjvFwevqfdvzw0M2DDwPFCKcaoQ8BAJpfzo8ffUORpNfrc?=
 =?iso-8859-1?Q?grDFzFVIVjqeD6uH1HnYdx91yZTghx0JQ1TUqBHl7H+OW7lt4wp5MkwHbP?=
 =?iso-8859-1?Q?ARKZ50kn05RAG178KzOssibMhA+dzT7/F8X+FCiNeU9lbc7qyl2sCiAVeZ?=
 =?iso-8859-1?Q?8Zw/3JldbUxzrjxb3PDfDESdn5rJKzfvg57AWdD9QX0RB3k0gcnTgztg5T?=
 =?iso-8859-1?Q?AXirUIUNpwafr0UDSBdT2cyoJQtG60etHde+Qj+5Vho5VCYs95oNVb0U4Z?=
 =?iso-8859-1?Q?rjt3hnje6o+DKnjU4g7iKthhLpnRKDNpfa/dPtBiAH3JREUbLJ3qyOvYih?=
 =?iso-8859-1?Q?PNipyiic9PTHNDPFLMgjKCiD+YZRt+KgHLCEPZSlPlKWLBfLli459sIRcH?=
 =?iso-8859-1?Q?myduBdXkO8Mqm5i+d95pBvDh1AtyN/iED6RBMHtthePY0BYQIwN+royuBf?=
 =?iso-8859-1?Q?7eGSSA/JYqYMWiefFljfjqeXXLZqZXlFED83YulgsAokE6rWduKZw8X4dx?=
 =?iso-8859-1?Q?VHAdOGI4yA14AOkZ4879hPHkP39jf3VfrNLACTnKIwzAs8KS1IFsBlExVy?=
 =?iso-8859-1?Q?lXF4rgQww31j7/b2fYHSPHS/swjTR4t7fF5d8+szoS83lYUiFUBN9VLlM8?=
 =?iso-8859-1?Q?LtXKAKMIzeDoa6aireL1Bg+mPXsVp3MpZkay/bT/qxr4r78GSE9+eyrIay?=
 =?iso-8859-1?Q?5V5VS8qHJMTkA+kEdVJHajyOq/4YqVElkfsKPP7pQS91CtrqpeOJFOCe40?=
 =?iso-8859-1?Q?kDd2ElAOr14e7GSM0JN6axt91OEgd1rqDdl2ljQ6U5eOTaT5c8/mJbj1lk?=
 =?iso-8859-1?Q?QIZr6MTmZTVdy+vca8XHZ+NNYuxasjFh48OYRMPfEIbo6xmpABNda4t6SM?=
 =?iso-8859-1?Q?zXAHFs01tlE7WQ0/qSUqotlXW7akZp8VmRPw8uk5RiU9daV/5i6gOJ1xiL?=
 =?iso-8859-1?Q?Jmj4rpwrBCe1xrmIHDJRPkuq2wQpsi1E5VjItb09udg486XJYp28lvP1JP?=
 =?iso-8859-1?Q?D62nWMz47ZCfLzElfTn2JH5SX4xevrjU0xWWLAVm4XssPMNFKgw+8/bc69?=
 =?iso-8859-1?Q?Jo+jYk1uBwTPiMvH8H8jooA160AeWvDY9YCTdhK55P8V1RwXC+Bb6M0kIE?=
 =?iso-8859-1?Q?2WujHS9m7RbXfZkov09zNjhFJhcNPWhkCTU3Su/hHA+HOXtyiFyHIJZ4um?=
 =?iso-8859-1?Q?wGge8cOPNQdWnJa9FJ3K/OADV5AxbT8bAS2HEOWyrwrXLBnzl7Z4T8VJH/?=
 =?iso-8859-1?Q?i86IXMXxmUrJI5qh70we8hrvXdMTli/DY31AMLXHQm8hdZOPqcRWy44r+R?=
 =?iso-8859-1?Q?HVUA7efoTaUyKL39uL8sJVGTt43QeCA5Q3w11yS9xWsJ1wZnf+Pn/CMINy?=
 =?iso-8859-1?Q?nCH95rztTZ1udXD4o3C/5VX+ci0DKhwUHWDNxZ2iAvLxRd3ZLs4WdQSuSf?=
 =?iso-8859-1?Q?NaIK3Ip637HfnU3vgHDAH0bgrTow6v0WRwuxYkaDkeBHPiNYDMhNwF2FKx?=
 =?iso-8859-1?Q?Q7ege6zznQSirONjVT+e23EYriOy1JU3+rMUHweL/w6vppftp9DceG2Hbx?=
 =?iso-8859-1?Q?YLJOA0kmbCkMF9WFYCF2/MDmp2Nf+/sw568fei1rQ0AFis9vVo4t73VlvX?=
 =?iso-8859-1?Q?sZ+wwtArYc0ZXdBi7+pPf+/jMLeFnyaKEJz7pVm6jAlUWc4EqFQe2itA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c145d0e2-f8d7-4d4b-2e58-08dca28d2d77
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 16:10:41.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKeH28FDefsyvkUUXU8LOMz2LXKZKgHai066yDinqfYw5mI1AQASK5M+Av16EDRmvzBQXUS5s8iDGYKjnZqr5x81yE8RHgzjSCWCpDCKN7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
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

Hi,

On Mon, Feb 19, 2024 at 11:09:13AM +0100, Nirmoy Das wrote:
> 
> On 2/16/2024 8:52 PM, Matt Roper wrote:
> > On Sat, Feb 03, 2024 at 07:05:34AM +0100, Nirmoy Das wrote:
> > > Add capabilities to engine struct which can be used to
> > > expose various capabilities of each engines.
> > > 
> > > Add wmtp as engine capability which is retrieve from
> > > GT info.
> > > 
> > > Take a field from the reserved for that purpose.
> > > 
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > We'll need a userspace consumer for the uapi and some simple IGT tests
> > (e.g., making sure this flag never shows up on the wrong engine types or
> > platforms), but once those are available,
> 
> Thanks Matt, I wanted to get initial feedback.  I will now sync up with UMD
> friends to create a pull request for this, and also work on  IGT tests.
> 
> 
> > 
> >          Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > 
> > 
> > Matt
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_query.c | 5 +++++
> > >   include/uapi/drm/xe_drm.h     | 6 ++++--
> > >   2 files changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 7e924faeeea0..10981b46c56f 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -215,6 +215,11 @@ static int query_engines(struct xe_device *xe,
> > >   			engines->engines[i].instance.pad = 0;
> > >   			memset(engines->engines[i].reserved, 0,
> > >   			       sizeof(engines->engines[i].reserved));
> > > +			if (gt->info.has_wmtp &&
> > > +			    (hwe->class == XE_ENGINE_CLASS_COMPUTE ||
> > > +			     hwe->class == XE_ENGINE_CLASS_RENDER))
> > > +				engines->engines[i].capabilities |=
> > > +					DRM_XE_ENGINE_CAPABILITY_WMTP;
> > >   			i++;
> > >   		}
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 50bbea0992d9..5dac079e64de 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -247,9 +247,11 @@ struct drm_xe_engine_class_instance {
> > >   struct drm_xe_engine {
> > >   	/** @instance: The @drm_xe_engine_class_instance */
> > >   	struct drm_xe_engine_class_instance instance;
> > > -
> > > +#define DRM_XE_ENGINE_CAPABILITY_WMTP		BIT(0)

Where does user space get the BIT() macro definition from? We should
probably use an explicit value for this constant, as it is done in
the rest of this header.

> > > +	/** @capabilities: Capabilities of this engine. */
> > > +	__u64 capabilities;
> > >   	/** @reserved: Reserved */
> > > -	__u64 reserved[3];
> > > +	__u64 reserved[2];
> > >   };
> > >   /**
> > > -- 
> > > 2.42.0
> > > 
