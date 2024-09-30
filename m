Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C59CEB2CD
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 23:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF4010E2BC;
	Mon, 30 Sep 2024 23:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ndm89+tY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3D910E2BC
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 23:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727738829; x=1759274829;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GCPDsV2HMWpl0Ez26Ao4rz7f5ll58UgpIwpSifVjc04=;
 b=Ndm89+tY/LRvbzvFyoYIW4pLCAURD+oDVwjmom6aI/yqT82oGVc45ECw
 bYt/zKfVCJ4fIH9jbnsXz99ZQFC5RmnpQ7UnncsBbDdrOlX8xit8L/jp6
 1OH6isXJDD/5l5TzvKqu9IxUjcLphzGPrnm9Zdxkwxn7trCDA+CKCKZCV
 7HOGRfEolfc11dsbDCNDx4EksBOc+HNpSBUd8Lwf9BWZ2Rxf5P6AVeYa3
 T17TsLx81FfmwlukihVTrL5F6mBHcQ2kBjvkgJH2vsEsPa5EkHbABQp0/
 vzIGU8iyWmd6yeR21F4xfJRmTOkFmycTTsSZqP3KJT4V1pTchoGVTDJp7 Q==;
X-CSE-ConnectionGUID: WdbMFRqwQQ+yqNFMtmAA2w==
X-CSE-MsgGUID: JQPHxKzvT2m3zsMr9rDSaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26310611"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26310611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 16:27:01 -0700
X-CSE-ConnectionGUID: 6u6aK3xISOWalkM08ByIfA==
X-CSE-MsgGUID: X7goLzCVSTKEX0kK2s1v0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73508804"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 16:27:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 16:26:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 16:26:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 16:26:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 16:26:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 16:26:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwLL6+BAlbb5FiePjBrVU5At1dpsJ/B7ZWWKHxh7DQPy6F/9iBrxHhsBd3ebwlJc1I5rSDDHwuIiRoF8gvzqUDcim1m82y+SPxShVp1uqsMtwLdddXyxoaqJ8bHUTs/H+VTYXNbH9fHXEsbogQ7IOPNh5WG/thPPki5/Ju1a+O3l3q1MCAlxHKy2SoS2HWOGvoed/q7OZU48uMSN92GILJNChQC6V8FCzffH5I89hVmNf2F1aur1n665lFZBekm3PLnQh6z546oiQH4fmvTocfjzYJrbkxo43mZGXsAgnK7Ft2hjwk5EkZCGtrH872MjjvbyF8lV2idpN+qtdsuZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eLiR1lYBJonyleVppn/PGfZNlB4MyUK18ceUuty81c=;
 b=csktH+eOzXCOvm05djhOu2sRSWOJTwYxbZJd39NMCslEBaEokbBOKtYN9KTloVhz7QyI10+L4SWAEOq7tIS0EW7Ns2MEuPIgv91iSGSKvzCxDwTpIt3JTm4Y8dYyrVUG2GDLE/8tfJ7acx9qPS6UylzqTqhG7rXPbr9vLRX1nX+QweF/yYZllHTiE38JGj9hv300pvY1Uc/TsjZegUkER0u8aW4udH8uePL5+sTWtzkQlEJGonJvTTNeBzv/vz/hS8m8FFcaDtg0PSTunTpDoDov7Mzb8QgaM25hCVnIJSTCZGTKx2qSxFnz1ygUfGhXWFh/iIBW7LoIf1xnbF+a1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 23:26:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 23:26:56 +0000
Date: Mon, 30 Sep 2024 16:26:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout
 to display/
Message-ID: <20240930232652.GF5725@mdroper-desk1.amr.corp.intel.com>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
 <87jzfad88n.fsf@intel.com>
 <rgsiho6xglvsrbgrc5ik3ylw3xhln7zlmfllsjhubdr2czyxk5@big4bvtcxtfg>
 <87cyl09d5p.fsf@intel.com> <ZuwGsRmKpY4u7b8A@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuwGsRmKpY4u7b8A@intel.com>
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3c88ce-9449-4e3a-3298-08dce1a76004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DqasEKCqCPTuYVcjvJcx5OQc2YJ0Oya3oWC8VmDtLTxEZwysqXrpcw8cEJ?=
 =?iso-8859-1?Q?VVOhCjm1ibENbd/FZEZIMaxJz/uYTPogyJZv123SaIbWV4/vF5/WZkWAUa?=
 =?iso-8859-1?Q?pRAV9EWpyUS4u3rCSf1f0CVJu9sBWRCrBPJxWCcVyzgYu8MeDx1ooMa0RG?=
 =?iso-8859-1?Q?bA0b1LfL5XjHXboWYgg0MkBkjQzbGVN8kc1dWNrTUCurKkACpPgwKRRqu8?=
 =?iso-8859-1?Q?dC2MoXuSLTHw/KZSuy0pxKzS3+XDVt4SWdLaEwzRvqU3D6bED1lBV7U4WY?=
 =?iso-8859-1?Q?D7gC2lZ+VDgclrEKfrWwNiGBWVNTAD50d/2SxWD2H4l0zP8V1rt5L5bIEL?=
 =?iso-8859-1?Q?UuzaxKYMtwOsF/JZ8dKW/zAOI20v5EJ+h04TRKsvyfo0C7D7aLOz+E0iOs?=
 =?iso-8859-1?Q?etRUSvK1Bjj7lT77uEm6Jc8Sppm3Y7fDznZsA+POrFvJS0WT0zYPnSCxCM?=
 =?iso-8859-1?Q?Qdzxq+222laZTuscp8KilWIwUGqtJOD8Kfzbs9uMyyHB2LkXThNXoR+sAN?=
 =?iso-8859-1?Q?2ADNtgpBxC9692E+Oq/FA+U//+F0fSl9xUCzZN+jJpPE38Q8KmqxPn7WCs?=
 =?iso-8859-1?Q?aVFpqCg+dvG783MjMCTj5ceEXv1a1sznYwped+69yrMUDxDd2JqsBT+G1f?=
 =?iso-8859-1?Q?9MG9/hKtClg9nW1xJxOpDlstBZ4EoYi/2Hmj/xknzSDL6Hhvjx3g3VTxWv?=
 =?iso-8859-1?Q?gV0A4taM1pd9DVDov6xjR10GL9xjwWqclgPEb3vTLOf4PwJ6pmQWArX+Y8?=
 =?iso-8859-1?Q?dP63BD78cqQr8P7jGHnElnS2cw2F/WAvTMQgT5tXJiUUh4iROMrjPXePJJ?=
 =?iso-8859-1?Q?g6B5qmup0NfwdhClLTI8wolY9Ly1mdrxQ1jUJFtja9ZI7/aG3cMDD18Glk?=
 =?iso-8859-1?Q?ht8aUxynenRfuibOo7YRn1fkQIHRkkZGWwAhNtG0vkMEUaLIgMMZ5qz8ve?=
 =?iso-8859-1?Q?FBY96nJR0RrFHWAPENXDa5GTu09Yce8M2RDj5cnZA4yPRkXTu5gD1Gxvsn?=
 =?iso-8859-1?Q?OejEWNFPqvp93sM0BeudE03Vv6VE1ULWzrQ824z1lzwuX8pFQCOIjgqLOG?=
 =?iso-8859-1?Q?riY82qkosW7vbtR/aVmKTGvSh1jHjPZ1vYT5Ys9VjkiBOj02ZfGTV25tV8?=
 =?iso-8859-1?Q?TqGl/aoWj5r9k3uJ55Du0eSqclmgZAFHH/mfEprPXznqbSOhhjBEgEpb6D?=
 =?iso-8859-1?Q?bFOZP8UbRmJ2DqVdaYoZhi/xey/jRAd/ek9seuH4yXIcvwp0/S855kR8AJ?=
 =?iso-8859-1?Q?3PwUoX1UWXu6OIvlu8Xnn0+7HmAJoeCRai95gktTteY1++TFTRFT2RhNqG?=
 =?iso-8859-1?Q?pbm2cA3nXu6o1stn6/81pzsRKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KXTb6zUV9Sf5lZLoizc6S+50rJAxHNWHUd085gNIC1j4FbviO4TGTM1Vdw?=
 =?iso-8859-1?Q?QreaF29F/4LuUJFirDNehkNRtBUaFsFJMaNs+8ehU2ouRe6LQqhEmkjMkj?=
 =?iso-8859-1?Q?0C0o9pVuuUWygYo2Zzuxa7DNoXH7n764SYKwHDgkR6oSosrrwn8IXcyrBB?=
 =?iso-8859-1?Q?3/w8uYbQRuz+GvdSr+oMeKqna5SRylAqS2yCKBJhIqbXpgJBpFayIaPDRf?=
 =?iso-8859-1?Q?CGCtmh6z6TWb7Q69wiOoAWFxkL7sBGLHqU7OwAarBUuZ7PRd9t1JWD7XTW?=
 =?iso-8859-1?Q?2o7ezSxMQ8K+Fp5ybQI/l9m4E0XcbvEUo5m3FPQXniJqS30LIuRjmAMj9V?=
 =?iso-8859-1?Q?m9TmvLZvyKNIMD1jo8S8W/pM0ac+WpmkwliYBqq6TGHHsL6Ug0jVsMbIg8?=
 =?iso-8859-1?Q?8fDoPPEsXCO9uE38v215324emmuHSyWeZUi0n3B2l5qgLnv0piF3cuZ7c6?=
 =?iso-8859-1?Q?I9WN36aEtkGfO9Cc0sdZr+5K2XXN+7ZYLnOEjKJBQZIXIXJ7xjj6ZypMzS?=
 =?iso-8859-1?Q?lmqC8jR1/G4vAMDPwyorSIVU5mGJOQpBpBiGPQlQvza3hrV6igQ8g6u52S?=
 =?iso-8859-1?Q?s7Y25a4E+6pJKL4r4A/wRZZyTp1YXkLuSwBb4J/wHQ5J7CcVz1cIaJtZfS?=
 =?iso-8859-1?Q?0ZB7Eu8aEO87TeNzkgfWTyHzw/YmHD5TVWI8DcjrI3Yth+imgRB4lZDty/?=
 =?iso-8859-1?Q?cXbz5S9PBGvhoeRADyBQ55XvjhFWnRYiop5kLKRPWqpJAm3cYbYFTYoNON?=
 =?iso-8859-1?Q?e3NZtArSlWvrHKPydqFiyZafAkO430m5kbEJDHDRmGZg5QyvekBmKDl9Ov?=
 =?iso-8859-1?Q?eF9t+9gprNTzmScRdaByy246G+WEc7XBQto0ATPyGyrwyBIH9Yu14U+cAj?=
 =?iso-8859-1?Q?W1O9hc8turmVRZuO2efGQBeLaGH1J8UizkTk7gPb9r4VmWP1P4IwghpKi9?=
 =?iso-8859-1?Q?yLtWAavbvL0CEwiT4FCIFEak+HaXox3heqk9gbayG1EHC8zqyAJiAd30bE?=
 =?iso-8859-1?Q?EgCtUyMocJq9Qqv691vRzgTAMwuCnvya2O3CM5/tSsptRdlZg0ngfjqBiC?=
 =?iso-8859-1?Q?QSf6yisq+uqJPLQeMl1D7nevV0CbaAcheBcuzpluyJuLhN5HXY8g1Der5J?=
 =?iso-8859-1?Q?p4R5Ss0Qci4STRNn/d6pvSEWEIcsywHGjETj7K7sx2OqABtJiRsOOnmNfn?=
 =?iso-8859-1?Q?VoZO0uWAQSIVHbOA2yCvsQVVkkK24AO7/j3Hl6sIf61kWJMn9gKw8gTSmk?=
 =?iso-8859-1?Q?l+eNMH5R0gXMUdgAaMH8JEH8+ROGGTp6MnnOaUjGDWSe8AL8IDNdIN8Ujy?=
 =?iso-8859-1?Q?CKsJXkD1hshuEGgSZxA9GL0DhStkuWszmZmqQbW9cnFPchUkFtKlmGM/4x?=
 =?iso-8859-1?Q?NCq3sxEHD7OkkZ5zUp9I30D+9n+2Tg4csCPNbDrUp8f29zr3fTQSyMO2eH?=
 =?iso-8859-1?Q?rLi0anAIVNy5Ub3VQrMZBa71p/ycyp/g+08U834xLyR7ExxCsGQ9ct0kcI?=
 =?iso-8859-1?Q?PZ2GVehQ7dRTI7peXRvtap+owrA/Ic9R4IxgS40Fhf0oiZI3xTEbBESJCt?=
 =?iso-8859-1?Q?VRJMlncPZGFcJaKsfLEk4W8mZwRNCQcWrj2Yvp0PRDBy27pHOpqMw6MWx9?=
 =?iso-8859-1?Q?I2X0GVZSG0tBGbyD9dwBLApUfDEWdSfrfqbUNNUPfBOAoBOa2DrAIRHg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3c88ce-9449-4e3a-3298-08dce1a76004
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 23:26:56.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVpmC0Wo7kO3yPHelXvJPnB150zItBM7FQhsGiNd2iHGMM7QrQmFPIaDKOUIg8KVguB0PrVnVd2cPnVJ1312yAXpskIMorkw55IdwuDVuF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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

On Thu, Sep 19, 2024 at 02:10:41PM +0300, Ville Syrjälä wrote:
> On Thu, Sep 19, 2024 at 01:00:02PM +0300, Jani Nikula wrote:
> > On Wed, 18 Sep 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > > On Tue, Sep 17, 2024 at 10:55:52AM GMT, Jani Nikula wrote:
> > >>On Fri, 13 Sep 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
> > >>> It's quite unusual to read display registers as part of GT
> > >>> initialization, but use of the display reference timestamp is one
> > >>> approach to calculating the GT clock frequency on older platforms.
> > >>> Rename the function that does this readout and move it to display/ to
> > >>> make it more clear what's actually happening when this route is taken.
> > >>> Also add an assert that we've probed display before calling this
> > >>> function since we never expect this to be the route taken on platforms
> > >>> that lack display.
> > >>>
> > >>> In the future we may want to move to an intel_display implementation
> > >>> that can be shared with i915, but we'll leave that for later.
> > >>>
> > >>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > >>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > >>
> > >>Mixed feelings about this. On the one hand moving to display seems
> > >>appropriate, but adding any new stuff to xe_display.c means more stuff
> > >>to clean up for later.
> > >>
> > >>As you know, i915 does this as well in i915 core. The next logical step
> > >>is then to have this in i915/display, and share the code between i915
> > >>and xe. Adding another interface for i915/display.
> > >
> > > humn... but what would be the alternative? Move the i915 one to
> > > i915/display and then make both xe-core and i915-core use that?
> > > If we move it to display/ here then we can land this and finish the
> > > cleanup later.
> > 
> > The alternative would be to keep it outside of display/ in both drivers,
> > because display doesn't appear to need it. The annoying part in that is,
> > obviously, that display should take care of display stuff.
> 
> This whole code seems rather dodgy. I see Windows has similar code
> so I presume that's where it came from. But does anyone know what
> this "Broadwell divider mode" actually does?

+Lionel, since you wrote the original code for this in commit
dab91783338b ("drm/i915: expose command stream timestamp frequency to
userspace") do you happen to remember if there was any other
documentation on the CTC_MODE setting?  I.e., what "Broadwell divider
mode" (the description in the bspec) actually means and how we should
know to use a display reference clock in that case?


Matt

> 
> If we assume that it means the display refclk is also used to
> generate the CS timestamps (I'm really suprised to learn that
> maybe there are systems with different refclks for display vs.
> GT) and that TIMESTAMP_CTR is always generated from the display
> refclk then display already reads that out from 
> DSSM, no need to read out the TIMESTAMP_OVERRIDE.
> 
> Also the current code that reads TIMESTAMP_OVERRIDE doesn't
> even seem to check whether the override is actually enabled.
> IIRC I saw bit 30==enable at least on some platforms...
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
