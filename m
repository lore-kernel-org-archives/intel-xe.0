Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF97CD5B154
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 20:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B666510E57A;
	Mon, 28 Oct 2024 20:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DP2ysnF2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D463410E57A
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730148506; x=1761684506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jpile71JGoYxWOUEedHsV0l2vzYOGzIo8he/H45FqvU=;
 b=DP2ysnF2z1J8amP1tvOHnoPAKAq0ldM4xBvotKgCovPa+ReCLrdjlsPA
 UNZQK5sFGHScX2pX/HWNEVRgGqfSnZiuuzqBhVgTifGNWe6iDU8NPYbWU
 5u1JrLVt5kJf/u67TJBnfYEKLKoBpYWIKJz9GXiXFGilzhuZsa8yjTUs5
 GQl2lO4H+w85GQajOyI1x+JULop6TB3L7r0YQ2/yZ7gq94eGQNaFwHZNu
 ann84UFp/HpnCOZSKpWdh2N72c1DHP/LjZ+54OgUnSvLq8PFwSGaho0NY
 Nqh8zBle7O5MA/hcnv33RBDJzuk1OgyKn6x5QRLBd/qGttAV10a8MZY4C w==;
X-CSE-ConnectionGUID: HlnP90hkQ1Sv7CDqkdGc4A==
X-CSE-MsgGUID: Ngmh+nhRSNShMkI4r5Gpcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29667537"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="29667537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 13:48:25 -0700
X-CSE-ConnectionGUID: HMOmQ38rSFSF89NibGME5Q==
X-CSE-MsgGUID: 32/GiNoSQZSgdmht44EE2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="86348884"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 13:48:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 13:48:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 13:48:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 13:48:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH+TEjMAhyiiYg95f33iImW3UjGEDt7x8z7ZypaHC3npVjh/wjaOKgowvWR2PT18QINaL7tOqi1DgJkFHRIyvtRdzh2PKfWqm1I/FxmSvbH80Xm2GnhxMTTb0iPiqP49+pk8aekMRhZifNd+hcJxhtLv0xV6Lsz9cM4Gh3UEe2wdZkZhsj/4Cq1myohBSX1oHc+3thgqzFfNYkHzCkI3PJIoHtQmbuo5YE9IJ4zdU1YDWIsVgPFyfDAgPS7X/Amd2fvPkoSdQZuioCSHpS/xtBX8DKkJ4jUdsRU1JWuJ5IU2PA2xqnfugDZ6R57nRPrDG17loZhqxTencxYEGqBzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqCWDyorKyT1S/u3dBpEgMgkCCRBYvT65LuEz5sUzGI=;
 b=wn04jQVxpN2JoRXAt7or26mPjCR7I4c+Rgd69owIVjNVDFFjuRlq3sdqgpZZ1rlN+wfnmjtxnNvcDp+EurR/XhaIqlnWYOHWexmSQ8XmwlqC/htUKBNRdKA9xAmUyQoIGHeTxXO0ZtAk/xMF5bUcL9wkE1uETuS7HrwEDNy5ueRASfNMggqTN+LkHNfAR1Gf5tIoL8zQkMrbdcpE7J0ZclU2//b2LYqQe/FA6AqB7B+uL/Isx4Go+yND3N8rqZCmXtyS+32nT265rORTz0Y3avSlWCHUbWgjAZTDBGJnXMCCK3lczZDu1WI9dDijsBEhjU6wdqVzkTJrgCX5MQ039g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 20:48:21 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 20:48:21 +0000
Date: Mon, 28 Oct 2024 16:48:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 <John.C.Harrison@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, Sujaritha Sundaresan
 <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH v1] drm/xe: Rework throttle ABI
Message-ID: <Zx_4j_k840pIvNnX@intel.com>
References: <20241025092238.167042-1-raag.jadav@intel.com>
 <20241025170341.GQ5725@mdroper-desk1.amr.corp.intel.com>
 <Zxvrri2LSkodxC-g@black.fi.intel.com>
 <20241025204534.GS5725@mdroper-desk1.amr.corp.intel.com>
 <xzllrcfttsfafxxgdn7ov6rmckhlwj43i6phbnabxnjbj474mo@ml43i733c5bn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xzllrcfttsfafxxgdn7ov6rmckhlwj43i6phbnabxnjbj474mo@ml43i733c5bn>
X-ClientProxiedBy: MW4PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:303:b9::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ2PR11MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: e4837b67-996e-4311-ebb7-08dcf791dbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g6Wrm/28qIMllHyIihINJ8ZRdfo6uS06Ynr3Rkb3tKRqXWDBV7avaXiN80mo?=
 =?us-ascii?Q?ppLNM1IMB2R8cN4EwtBiBDf4Bl/LP7fmEWvwKoa3K02+aS26SbL72XENs9W0?=
 =?us-ascii?Q?VqwDEZt74VobPwkI86FZA8hTMgeaJuV1Nz2LIkvsI9FRSFNR/WnUNUIm9U4u?=
 =?us-ascii?Q?4GWEBhnmEH6vdm55oc+FQXEukDGEY6GdhiqKvEiYlxUVNGZ+RwT5g0o62Uw5?=
 =?us-ascii?Q?S0sx5wyhh+xSm/5J3qyeVPIxNDbiWd4tviRGnzXanZb6u4U2pW6p8vjLr756?=
 =?us-ascii?Q?ifgcfGFFSwI/UhRu71frjJvQJI6jOrCEufdvUHCxutW2q/r5aT2ZnGETlVee?=
 =?us-ascii?Q?sFQWpZ469w/8O+XGQL8wUWzem1xvOCegTc4sfmTuvtQCHWhZru5QDOZzq8G9?=
 =?us-ascii?Q?Uhy5hAXiYDzP1OkogU8ZHpWc8ohECJn90gxMbU/Bfes9X3K5as6G0Et5IiqI?=
 =?us-ascii?Q?cWiSlMgNEz0J9IXca12ylVw2nhKqZmCLbmXnhibbkCS/Q25mDFSF6EWz+jcQ?=
 =?us-ascii?Q?oliUw/lHQqDrL5kmDVfIhgFOjiwBvfkKIpRrHDD89Pi9dRer+swnPn+DzpWS?=
 =?us-ascii?Q?HpxyXVIaauk3nrEUYdMzYhtb9c2L2YoBvHwbwjLLdTUinEwPC3ZShg32SCyi?=
 =?us-ascii?Q?/045izYdcTd0sgHvUEMNdaw+0Tkwf4gxBR/u6s/vdiiJ2kjf6RzRRDIuF3d2?=
 =?us-ascii?Q?C92P7ifhkdyUF8u7/Txow3JNXcTwK90If+cylbBAjSu14p4lvhgfx3PdR7Ez?=
 =?us-ascii?Q?wjXkQHEZCTS2OL5XzfPPPIgmUBQwzBnFokc61uOZysAw/2XmOgmEr4XRjE6H?=
 =?us-ascii?Q?8D7/IkwvTqarzgEBuq0u21tGEvr067gkuuNmxWSJwgPyxTrhJuQntyMgAS9T?=
 =?us-ascii?Q?yddnjqMul7r+ljk8oW6Rduk39yTbnfYbGvYC0ifd9K7Gac6nerSwlzyGzmK/?=
 =?us-ascii?Q?K63t2a9O2a0EwqLroxLQDTyU1ZPv6FT5DzuXqohXG7m57DpB5TvFbBOgTzMO?=
 =?us-ascii?Q?Pj49kQzIKqfIVQAztPr+4ixOTziTbDAiLzzAzFwvFCU89yPjTUv18UbArFBh?=
 =?us-ascii?Q?ICMrPotWC88xxCGNXvioczLB3JJFffcGS37bJRxf2YML9rpWvUNJQXpFC0Lv?=
 =?us-ascii?Q?5thu1bpKf1BCHmIWx1N1Uaf+mOymbCUF1nkCpsGfNhRkE7WNtt6kaJpf2LHo?=
 =?us-ascii?Q?SJZT5wNn9b+mJGFCXb3H9lspWggcwkctVbscuQIp8pltbQAkcXNXZfhacOo3?=
 =?us-ascii?Q?mS1bmPnsMujE0Ty+sTXzF078drVIKI6LeJP///ueuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KAmBkb6wHFh4beYd+Ki62PpUJQzBUbQ8a0ZIABC7upPMk9hXr5CnicZ3NaV9?=
 =?us-ascii?Q?2KG5XDFXSAqLFXoOqMtqg/z4QpgkpeizpDZ4UrE/7VOIUAZCyZCji4tQDyja?=
 =?us-ascii?Q?FbMaiOF6l993PtecOV8DPMqSucwvqm+cpouK0FJXQWLTneHajw1/0BiZVTj5?=
 =?us-ascii?Q?/kA+nw+ESTZ6QmM/SmAjlsZUaUB0rf8XHNUQSrP1/vCFPymZgpm6w9ng7jlv?=
 =?us-ascii?Q?l72jwrx3BmJAVaYqKZ6RPN187TyTVH//pXXrwr/0BfD7hETpfQQIZorRzOTl?=
 =?us-ascii?Q?T7dU+voy977WqPPyyE1kHGmEGZp7W6Ol7czNaw5yQSqzJKM4cio9N7YqJCBc?=
 =?us-ascii?Q?08Z0OJsjFDwgcWJyHaSfSQo8LWZ1HdTYMOpPH6TZjLMqNuWPzZB9iX2njMFW?=
 =?us-ascii?Q?dQ71Cn3IlP2Ko5LwA9mnfpPfmENo7qpHoZ789aCOgfh3M7t9nHWbZ7xgE+85?=
 =?us-ascii?Q?LWEk3lcnJI78sevmVT9DYWBYR6z69PcS7qpWyxTCCvF8MBAGu4fXcuVGrOz9?=
 =?us-ascii?Q?HWRw7BkD9lKgg3VXWek6hLCRFnVz10aPLsO4he9O29TKqjMhNCIT2mK53rrE?=
 =?us-ascii?Q?udwlBwfm3PUD3JgyE/kLW97M6gpc+btdoNa1SSmXtfvA3nZ5YQMdeUifAEnQ?=
 =?us-ascii?Q?rW6AAizfE9SHF+X0S4G5z1O6Iyey+iLK+ouagUIqBL93DTcifxHnJi7m6/1e?=
 =?us-ascii?Q?ijkr5LALUIBbIOr48eWGYnmoNR2uP/mt6Oh4SRSwv91Z9zuJ/e/oJ6qnDXpD?=
 =?us-ascii?Q?UIkYcUrGfX4WEocxOf1Oj5NaPpX/oSDXrYbzAEwsfTbnHY3Ta5Y5aY2Az4ep?=
 =?us-ascii?Q?6uddIdDIOjkU1cm3BVfEWVn0UI2vUQ0ED3guaVkQZphVKzCGxYeexpbltQhl?=
 =?us-ascii?Q?GnhlhXWf5z4W4IwpcyZ6uOKIekbYp01jvxKdQ61SZ5PnHUSXRAw2o1J+Yf2u?=
 =?us-ascii?Q?QQEdGudIZrpB3DZSGZy/CFBBUdlX8OrBS0j4sNCkngBgk1drvJy8uUQva/wE?=
 =?us-ascii?Q?5tru8IP3pRmh0gIQvx+SmCsXfOMW0cQ4642YZLeloGyyd5cPRVjxHSSVCssP?=
 =?us-ascii?Q?lPMC2zjprGmf0vaWdVLsh6x3o0irV3AsPOtu3xYoPNPdRwDOWvXFuN/oQT94?=
 =?us-ascii?Q?hqijCA0YvAUlUcHF6byEW7Vt0Ug5cIkaIxlZe9LOIHh5UjmtNYMRnBRTcC5M?=
 =?us-ascii?Q?JKgbcecbt0ikn0g1bmtbgAh6H65/llPsxQFlCNp+ND4763IzYoxZtcQr4B5K?=
 =?us-ascii?Q?bcsmXi49r+xKs+k5qeRZrz1AqiY7b6Sd6+TaUGMRHiufHKY80wuN8AL4Wffd?=
 =?us-ascii?Q?ukAq9yKz0oSvEdCiTMgJyUD8HuvqN5ALHaU4l6FHGPaVG0PD2BInkUoSfjEm?=
 =?us-ascii?Q?m60Fb/rRlfiZ6Z+cIHEyWtweXmRGPgW0V02Ph/k5QjEGNLhaadOYc9J7/9n9?=
 =?us-ascii?Q?yVAaUYO8zectGfUqF1kr0u+Qp8l5j5DpQd/9ifCBR7TKBNIK3hvurMBURMsd?=
 =?us-ascii?Q?tETMihbwVxUp4CMz/39e1G/TCfaQsqA37y5qWMJ8j/ZWtM4516ujUlZGz6Io?=
 =?us-ascii?Q?oqJizXDO/Nv+/8nd+9oatANpelwR/oJFgYjcam3zCyHj4Y6OEIKeCu5p7a+i?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4837b67-996e-4311-ebb7-08dcf791dbe3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 20:48:21.4400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HkTYUb9Hq15oYkLwEJJgaum+MLwkcu2po8NtYr8JVrwEV4DGYVwrlOWrTrJuYwFK7bl5upGbG4BqFEauTsS5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7648
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

On Fri, Oct 25, 2024 at 06:07:40PM -0500, Lucas De Marchi wrote:
> +Sujaritha
> 
> Rodrigo was already Cc'ed, but please take a look below.
> 
> On Fri, Oct 25, 2024 at 01:45:34PM -0700, Matt Roper wrote:
> > On Fri, Oct 25, 2024 at 10:04:14PM +0300, Raag Jadav wrote:
> > > On Fri, Oct 25, 2024 at 10:03:41AM -0700, Matt Roper wrote:
> > > > On Fri, Oct 25, 2024 at 02:52:38PM +0530, Raag Jadav wrote:
> > > > > Current implementation adds multiple sysfs entries for getting GT
> > > > > throttle status and its reasons, which forces the user to read multiple
> > > > > entries for evaluating the result. Since output of each entry is based
> > > > > on the same underlying hardware register and considering the access type
> > > > > of this register is RO/v, the value of this register can change at any
> > > > > given point, even between subsequent sysfs reads. This makes current
> > > > > implementation fundamentally flawed which can produce inconsistent results.
> > > > >
> > > > > Rework throttle ABI and introduce throttle_status attribute which will
> > > > > provide throttle status through a oneshot register read, making it
> > > > > relatively less error prone. The new ABI will provide throttle reasons
> > > > > in a string based list based on the respective bits which are set in the
> > > > > hardware. Empty output means no bits are set and hence no throttling.
> > > >
> > > > But the old ABI is already released, and we have platforms with
> > > > force_probe lifted already.  Presumably userspace software is already
> > > > using the existing interface (otherwise it never would have been allowed
> > > > to land upstream), so that means we can't change it in incompatible ways
> > > > anymore; we're locked into supporting the current interface forever on
> > > > these platforms.
> > > >
> > > > We can change the ABI for _future_ platforms if it makes sense, but it's
> > > > too late to make compatibility-breaking changes for LNL and BMG.
> > > 
> > > It landed upstream pretty recently AFAICT, atleast in xe.
> > 
> > It landed upstream about 10 months ago:
> > 
> >        commit 1c8e9019033728093c04608f44c6e87fec6822e1
> >        Author:     Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> >        AuthorDate: Fri Dec 8 00:11:52 2023 -0500
> >        Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
> >        CommitDate: Thu Dec 21 11:45:28 2023 -0500
> > 
> >            drm/xe: Add frequency throttle reasons sysfs attributes
> > 
> > and has been part of the 6.8 kernel onward.  So this isn't a case where
> > something just recently landed in drm-tip and hasn't made its way into a
> > formal kernel.org release yet.
> > 
> > > So maybe worth reconsidering.
> > 
> > It's not really a decision that we get to make.  One of the absolute
> > rules of Linux kernel development is that we cannot break
> > kernel<->userspace ABI that's being used.  A user must always be able to
> > safely upgrade their kernel without updating any other software on the
> > system without suffering breakage/regressions (with slight exceptions
> > for special security-related cases).  In this case, if you remove the
> > existing sysfs APIs and try to replace them with something different,
> > then it will immediately break existing tools that were using the old
> > interface.  That's simply not allowed by Linux kernel rules.
> > 
> > > 
> > > > >
> > > > > $ cat /sys/devices/.../tile0/gt0/freq0/throttle_status
> > > > > prochot
> > > > > thermal
> > > > > ratl
> > > > > thermalert
> > > > > tdc
> > > > > pl4
> > > > > pl1
> > > > > pl2
> > > > >
> > > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
> > > >
> > > > I'm not sure what this ticket is about, but it was already closed
> > > > several weeks ago due to no longer reproducing.
> > > 
> > > I'm sure we all have our "it works on my machine" moment :D
> > 
> > The point is that we can't point at a non-active issue as justification
> > here.  If the failure reported in that issue is still relevant, the
> > ticket should be re-opened and a proper analysis should be posted there.
> > But changing the ABI like this wouldn't help anyway since it would just
> > guarantee that the test breaks (because none of the interfaces it tries
> > to check would exist anymore).  This patch wouldn't actually fix or
> > close that ticket.
> > 
> > Besides, the failure in that ticket likely isn't a KMD issue at all,
> > just a bug in the test.  By design, these sysfs interfaces represent the
> > "right now" status of the hardware.  If you read several sysfs entries
> > then the status could change as that's happening.  It's just a flaw in
> > the test that it overlooked this and incorrectly assumed the status
> > would never change while the test is running.
> > 
> > > 
> > > > The ABI change here doesn't seem to be directly related to this ticket.
> > > 
> > > We can always create new tickets, and that's not the point.
> > > The point is we're stuck with unreliable ABI.
> > 
> > Unreliable how?  We don't let new userspace interfaces into the kernel
> > unless there's real (not IGT) userspace software lined up to use them,
> > and the userspace developers have already signed off on the design and
> > semantics of the interfaces.  Presumably the current users are happy
> > with the current semantics and understand that the status provided is
> > live rather than sticky.
> 
> I was looking at that commit and noticed that it actually doesn't point
> to any real userspace user though. Ugh. Kernel doesn't break userspace
> interface. That's true, but it's not the same as "the ABI never
> changes". It's always risky and a decision not taken lightly because
> there's a *potential* for breakage.  However you are not breaking
> userspace if the usersapce doesn't exist.  It seems the uapi was mainly
> a copy & paste from i915.
> 
> So, a couple questions here:
> 
> 1) are there userspace tools consuming this UAPI?
> 
> Rodrigo, I've heard you were integrating it in a top-like app. Would
> that be the first user? grepping around I couldn't find anything
> actually using these sysfs files with xe. The only references I found
> were in

Regardless the tool that it is using. It is an info for any admin.

We have used that in scripts without any tool. And it is a pretty useful
information when debugging power & performance issues.

> 
> a) https://github.com/intel/compute-runtime
> 
> but that is not in the interface with xe AFAICS... it's in the
> os_frequency_imp_prelim.cpp
> 
> b) https://github.com/geopm/geopm

Indeed, this very nice tool geopm used throttle reasons in files like
this and never complained and never had an issue with separate files.

> 
> not very familiar with that, but it's possible it's actually used,
> although I don't know if it's just an i915 interface or not.
> 
> 
> 2) Unreliable how?  Just as Matt asked, if it's unreliable you need to
> provide a proper justification for it. From the commit message:
> 
> 	Current implementation adds multiple sysfs entries for getting GT
> 	throttle status and its reasons, which forces the user to read multiple
> 	entries for evaluating the result. Since output of each entry is based
> 	on the same underlying hardware register and considering the access type
> 	of this register is RO/v, the value of this register can change at any
> 	given point, even between subsequent sysfs reads. This makes current
> 	implementation fundamentally flawed which can produce inconsistent results.
> 
> so what? the error would be in the user thinking that he could read
> multiple sysfs files atomically. What if user is interested in just 1
> of them?

yeap! exactly!

Also, the name in the file gets pretty clear and straighforward, instead
of having to have a bitmask and document that.

Please let's not change that.

A big NACK from my side on this patch.

> 
> It seems like adding a new file that guarantees this atomicity, is
> documented as such and *points to an actual userspace consumer*
> would be much better, with no potential for breakage. If then we find
> out there are no users of the old interface, we may think about
> deprecating/removing it.
> 
> Lucas De Marchi
> 
> > 
> > Sometimes we realize down the road that we did overlook something
> > important in an interface.  It's unfortunate when that happens, but the
> > path forward then is that we create a new, alternate API on the side and
> > let existing userspace migrate over or not as it sees fit (e.g., stuff
> > like the DRM "addfb2" ioctl being added as a more expressive alternative
> > to "addfb" usage).  We still need to support the old interface though;
> > we can generally only sunset it for future platforms where there's no
> > pre-existing software already using the old interface.
> > 
> > 
> > Matt
> > 
> > > 
> > > Side note: The logs in the ticket may help connect the dots with commit message.
> > > 
> > > Raag
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
