Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8161CCD184
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9A910E1DC;
	Sat, 18 Oct 2025 02:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7iSfvGJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D50010E2E9
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755536; x=1792291536;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WKZfnJTlYoA1h4VzwbAVeG148wBsc093Huc9mXdQHi8=;
 b=k7iSfvGJNGQje8zvcsPQR8aTv+zPehixgMg7qx82Ie2KNVmyXGoFq9LH
 Jw+UCC3EG6lCsLL2xRI6LtGKUw58yJ7ZIufGiDsy7qf5vrDd7OWzXmore
 ZIF0jtMPFOQ1yEKresOYRyVViMRr2jUEaH182+9AHf7YnbNIjzRhzjHIs
 eTkjfjqb974S7zyewKvoKyj8p6xGdHdS0BHuhTMplxhczL92u7hc1Oh96
 0tqoRlx6+eooO/70SCtW8U8O7L8Gl7vUuaVhK5ix0JX8OqNdcO7wR9Y6L
 LC72AYTk3bmCcx60eY6M7cD3vX3UPYpMdz4k//a2dddOTpT342hp7P4as g==;
X-CSE-ConnectionGUID: xRFWUbNGQ7W3oNYSZDmdZw==
X-CSE-MsgGUID: HwIK0hIURp+cbeAAnRKe+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73571272"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="73571272"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:45:36 -0700
X-CSE-ConnectionGUID: HyLKN60oTreHNfhwqMYLrQ==
X-CSE-MsgGUID: Q5FxHRaORAqFF+SaCvbiFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="182569678"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:44:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 13:33:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 13:33:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 13:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dq6Pn+PvFxegY/uzeiNuJ4HECbuZHldH4tWJ5nMwqmwjqsbdCAKSSrTENsNZ+AgoRkaleGF5hacmAK4L2Uh9iLt6Um7uYe+fLoVJMh4MttUNIJzweJSntUf3nhtCkxiQLMZxfRq52fXO0zCiFXVr8rLI1YKNLrTE7jkqspS5eDRefFQGBAMbKWvfG05WkAj77bS+TewHAz/gk0UsTuT4/ainArqLHwrI5nAXekeAf9SrbKhGep6PjKaqB1YZaXBJRqi2x2rob3LGNdLfyaIZBgY0/KhVPJ41XCWCyi+c5wez5cDPmW+ya2Ci9TSy4QV75d6LlfJD9SeIned/VYqm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfPOjGSXZSq51x0/G7/+PJ5XKd3Rb0yn4R8xUY6u238=;
 b=fQa7xFxy0RymruJW5qtoW372oHqyxQxRDAwOYkjSuD+WqkZR2l8cbLDGNc2q+lKsnFDYRMOsuD2hjO0dbhUizCbCzMG8CHBIlDJIOAnb0M74OcNJMsRoA8ZzE1u+2xojzrt/VLA9U00rdrGsqdBgh8zcxB7zZSLNuuaQg6lAIoMAm4fvZ9nGcUZPqsMmEjuh/xr/vgvY/164EXFP8EzDbBAtR97gqM1fIrNV2BsAj4+g5vI6n55QbXBr1MrucOcvKqeZ8IEDUzlv8YJnPnNnTWczMIQMNm61WDP3rBRNLHqb3gblxBGytTdS3YyQKmlvm8fS/NIHxewz1XySAIG3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 20:33:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 20:33:03 +0000
Date: Fri, 17 Oct 2025 13:33:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 23/24] drm/xe/xe3p_xpc: Setup PAT table
Message-ID: <20251017203301.GX1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-23-3dd173a3097a@intel.com>
 <aPIjEfXpEQKjewIS@intel.com>
 <20251017171811.GV5409@mdroper-desk1.amr.corp.intel.com>
 <aPKGXgfglFFi6uog@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPKGXgfglFFi6uog@intel.com>
X-ClientProxiedBy: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9c5ad0-27c2-447f-3069-08de0dbc5f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VLp78QyzfXvhiNHMU6AHNRmBiP8fnU8PZgqfjUdDgrzzjHvwL4la5yT8Az?=
 =?iso-8859-1?Q?RdSwzj5WrfIxwTFiiLhshXkHu8R3keDLvccAb+4jDXAnyiffRaMxrimdnI?=
 =?iso-8859-1?Q?k95jL9yQ/T3iFwmorkFrwZXaSigIaEmlR1obNtZQAvBl1ivgxepbYJlDQF?=
 =?iso-8859-1?Q?cXWEtCmaeBxzcRHBPMmXTWN7qeDXafvZSnWzeqcEkMrIxbe6agF7OFzCty?=
 =?iso-8859-1?Q?v+dJgV9TDKVJSGe4JsE3iRga2Iv6bvGzsZO8g//Xapb2eyrunUQKcqS9Fz?=
 =?iso-8859-1?Q?qsk67LQ8Y5PTKixECJUStDs8Y8on5Na3sNBjqrTVJutrKTMKLgnHdgLPxo?=
 =?iso-8859-1?Q?MrzMC12TqT9TKCzd+gakjf1bcDOCXr7pC4YN842kfjTnYOOzdICcDudL+y?=
 =?iso-8859-1?Q?KZfLjK8k2VkY6iYmtFgVD6TRrcNBlzXah6jqu/K2pY7RvNZeFOlif3SPOS?=
 =?iso-8859-1?Q?xcy4gLPIsog2pL47p2IHab6x3BrXRrHxddG6st7e+5Yb5ud48bPe0A48Vh?=
 =?iso-8859-1?Q?iJofR5JMkVLFEN6QDrWTOSz5YvUnZUu/VozZ4YLhCF3UI733J4cErc+ox1?=
 =?iso-8859-1?Q?+hYMMN6AYPK4s6ujBneVH/opr8RiSOnGZcPvMLjVwSfiUe6eJ3KtCXOO6k?=
 =?iso-8859-1?Q?cVmid7S+0icTe5sXMvuY/1uTA5ssGfw5otfx3OJeMX/+t6UrfUURkC2MuO?=
 =?iso-8859-1?Q?LGPbwR1pSkPWxP/8HziCUkwZtvEseI/2Ua5jVpL6Y4KpjemwEZYYsWX2xB?=
 =?iso-8859-1?Q?5aQyyA3vrBadjDT4gviJwYp7HATsw2AzSUEERelO5V0EsiO4UrwSCTd+Mu?=
 =?iso-8859-1?Q?qmV9QHQ6jcvZNiZV5HQ5VwrOzUVzRwhNCWuuTDDYbDxMqdYoX6W7E2z/mL?=
 =?iso-8859-1?Q?6dVXdpSYrmdX4su/B85AsAtLPaK/QjHEwSdH9gMhJq16ezJ22z4P6EbYAe?=
 =?iso-8859-1?Q?5XqfbVwv+4nbE8V1X/lEp2gtt+jtJZDmAslK50bb8kp6FVVbFVTqktHX+G?=
 =?iso-8859-1?Q?eQ1kbzCxTneAPZaEbXvcPwDTjwu30ZPrbb7fXyzAWxkh9cDGj7AMpbaZhC?=
 =?iso-8859-1?Q?9plkWqu+mIKw9wc5HVirkjCQlYuJnbcj9bxcglv689SftsnEmSszAuEqxe?=
 =?iso-8859-1?Q?5HGnKe3Uf9ZH2HtLzcJ3ZzeFHOiQLjEL5QVGzbIeAouTreWf2IUiAssgNy?=
 =?iso-8859-1?Q?wBO0j+qXzXxAmqIwAJuEaptv7Qj2WnJ8wvWc8TtGYta9HxiuWyr03/AvJc?=
 =?iso-8859-1?Q?CoODHZZdovQGYtdMQykz+HrMi+jBKv518/u3dZ7VNMFYaZdMmj++NGkOGT?=
 =?iso-8859-1?Q?o24p/WJys49CEHKVVQsMJu3k7rV9NfxnUOrN+NdyAXrIvBI00gjKavdGzw?=
 =?iso-8859-1?Q?rUY3v3bwogoZA9W8Jo40MKAlSJ3n21699EEHX6mqHCg5oHOfZIS3Z+sz47?=
 =?iso-8859-1?Q?XYPJqYpjT5ihY7agl/QGBaR3gZmCd5WLNDXJOkXYRSq1T8FQPDKcndpDCg?=
 =?iso-8859-1?Q?9Q9G6BLn/WCJ/35zSxQ/vN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eCz7s5r6Xl73i8r1s8JZqZRl4fBIVIg2optl6vfz4uFcPvhQCSlNcRgWp4?=
 =?iso-8859-1?Q?YFgmtB7d/JWOrhqm9FBRPpGdLFjcYu+05PC4vWpchnFgj4J5b/4nXfwyxT?=
 =?iso-8859-1?Q?ohWiqwfq8VUpqfaAkBUWUgyoJ7awxgDp2WtjFgKY+U5jM+C1+15PQepdEL?=
 =?iso-8859-1?Q?UL28z8RD65AEns+0SvN4/db+gOOKLIaIsoSNy6lfJSqEsLVI4aYrOtL1vC?=
 =?iso-8859-1?Q?L+pyoekLkPYdKinMG4QVdOegJC2ju6XOykQ6ZjoszGMfqelSmSzmnua+EY?=
 =?iso-8859-1?Q?UGhrl4R7vReyP0rAoRjMKT2tCeVEemNm208lcpjOYjE/DysJR1WsNmEq/l?=
 =?iso-8859-1?Q?+7UHcc1emiL7cLe1Ci2Gg6gkZXNpntwrzNwD53lgXaDVOqwMScbJPo/QRk?=
 =?iso-8859-1?Q?SpPB2SDJJVCaUPEfxJRvE8GFrTZqUULJnPWHXm8BTUx1y2KMd8y9ZHbEmC?=
 =?iso-8859-1?Q?Hi0GxeIXx9bYML9OjRQ9szm4ho/kjRQKMtbDO6/miZ7XVRSTEwkWXKvFKU?=
 =?iso-8859-1?Q?/26Cs1S8B0+byPHP90xHMpjntKIEcRBalbrQSLmI4mH189xPQnAjRawaS9?=
 =?iso-8859-1?Q?E4PRMfmRnQxxUKfmc/G5j+894qu719hV0FUoAtL+v0pt4tbLTIUDuT3aej?=
 =?iso-8859-1?Q?sy7OiVbRPyohvtLC6B+cA/8d/dVsnkNbXjV3w5G24WksaTpqRpdKQ3E4GF?=
 =?iso-8859-1?Q?GB6f3NCYy3kk1TTt5rCL+OA2JjY0TqDrAe+Jnd4fguGqJ59JfPs/DG5DTR?=
 =?iso-8859-1?Q?Ttn8X2JCWZT7DRq3jFvjrRzRIXieghJPWrul5LjlPqYTQR/5vu44oG+vng?=
 =?iso-8859-1?Q?OEbvCDBb60YcYRJxJSf0jLR1JH7zD11OFYC8uJiLIFteWAgqd55VrV6k3H?=
 =?iso-8859-1?Q?1yNNj+dIge9ynPLQGG+6GTIctW+JCpagWMBydWgyf1BHbdijylrfr2rT9d?=
 =?iso-8859-1?Q?WFgZaK14mhiRUHcgSEFnbhQZg5ttIu/2br93EpKMQHi3GjxxI0NeVjQ1oF?=
 =?iso-8859-1?Q?h8pVvexoP1WKaDR7Rx3I8nL3yvzuWZXsPDJWHmQe2AKThctY7V0GA534ud?=
 =?iso-8859-1?Q?5lM/yyXXeVboAodjeztvmS/syATZ4X6Slgqvj13Uw0S4h2UT5pi84gFleh?=
 =?iso-8859-1?Q?vqCJzoapAsYiwUZ/EqWqohN6keKN8bZtKioEfiDUuI1DUy6yTuTGK+cUjY?=
 =?iso-8859-1?Q?Qsi5W+iP60C12DJa83MgcKCPLPyFV70vTC8i6EJv32M714si+NPS/rpx2g?=
 =?iso-8859-1?Q?QCclUrlW0bwjbxMNgRqei/urHHmyxldi+zkgUve5B+amd9AmE7ktnXQmP9?=
 =?iso-8859-1?Q?LIVxg2hRIpT8Ry1Cnq2xUeOhXRHMmt/zhmnYyHFdBwSbm4oDPwVEbcmG6d?=
 =?iso-8859-1?Q?utFM5eHdV2q2oV566pAldrev71Ui7BY0K3TC/mtwo7cc7n0T8QcY7cbDYl?=
 =?iso-8859-1?Q?K7zh4C5CPfLH/mXfJGwn1pqWjt9kej8l4I8zTAU9ZtUcvwyDwv+V9c+4X2?=
 =?iso-8859-1?Q?gFsi16qSqXGXeX4FQA+xJA1hT4NNVOHVYzATJ7McMX/ooo6H/5eLokXgjX?=
 =?iso-8859-1?Q?7wfjMcA5E5pp/C4dI0+30OJ4/3Og+MGaTALeabpyoJP4zdy1o4fPQlZMVV?=
 =?iso-8859-1?Q?mm4+t5Mcae3cdUs4o6J4Ri3gU3BQeIvo0md5c2mD2V1PkYHBtsvBvopA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9c5ad0-27c2-447f-3069-08de0dbc5f29
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 20:33:03.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qn3Pcpvy0qykUAvjZ8V5nInebR1coBQo6IcVSuaY9MUC4S1TOaYXTlX/SSZ0oZx6evGGRRmww5lDB0NfwhyQwD4eLgxfsUutpv4tFJ85JJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
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

On Fri, Oct 17, 2025 at 09:09:34PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 17, 2025 at 10:18:11AM -0700, Matt Roper wrote:
> > On Fri, Oct 17, 2025 at 02:05:53PM +0300, Ville Syrjälä wrote:
> > > On Thu, Oct 16, 2025 at 07:26:42PM -0700, Lucas De Marchi wrote:
> > > > From: Matt Roper <matthew.d.roper@intel.com>
> > > > 
> > > > Xe3p_XPC IP requires a new PAT table; note that this table has one fewer
> > > > column than the Xe2/Xe3 tables since compression is not supported.
> > > > There's also no "WT" entry (which we wouldn't have used on a platform
> > > > without display anyway).
> > > > 
> > > > Bspec: 71582
> > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 95 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > > > index 6e48ff84ad0a0..7649b554942aa 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > > @@ -154,6 +154,41 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
> > > >  static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
> > > >  static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
> > > >  
> > > > +/*
> > > > + * Xe3p_XPC PAT table uses the same layout as Xe2/Xe3, except that there's no
> > > > + * option for compression.  Also note that the "L3" and "L4" register fields
> > > > + * actually control L2 and L3 cache respectively on this platform.
> > > > + */
> > > > +#define XE3P_XPC_PAT(no_promote, l3clos, l3_policy, l4_policy, __coh_mode) \
> > > > +	XE2_PAT(no_promote, 0, l3clos, l3_policy, l4_policy, __coh_mode)
> > > > +
> > > > +static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );
> > > > +static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );
> > > > +
> > > > +static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
> > > > +	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),
> > > > +	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),
> > > > +	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),
> > > > +	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),
> > > > +	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),
> > > > +	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),
> > > > +	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),
> > > > +	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),
> > > > +	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),
> > > > +	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),
> > > > +	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),
> > > > +	/* 11..22 are reserved; leave set to all 0's */
> > > > +	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),
> > > > +	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),
> > > > +	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),
> > > > +	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),
> > > > +	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),
> > > > +	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),
> > > > +	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),
> > > > +	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),
> > > > +	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),
> > > 
> > > Why did we go from human readable names to raw magic numbers?
> > > This is now completely illegible.
> > 
> > For Xe2/Xe3 I think it's actually a lot easier to read since we have a
> > kerneldoc right above the tables explaining exactly what each column
> > represents:
> > 
> >  """
> >  * The Xe2 table is getting large/complicated so it's easier to review if
> >  * provided in a form that exactly matches the bspec's formatting.  The meaning
> >  * of the fields here are:
> >  *   - no_promote:  0=promotable, 1=no promote
> >  *   - comp_en:     0=disable, 1=enable
> >  *   - l3clos:      L3 class of service (0-3)
> >  *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"), 3=UC
> >  *   - l4_policy:   0=WB, 1=WT, 3=UC
> >  *   - coh_mode:    0=no snoop, 2=1-way coherent, 3=2-way coherent
> >  """
> 
> I don't like counting colums by hand. I would just like to look
> at a row and understand what it means. With this thing that is
> not possible without taking notes.

I don't know, personally I disagree here.  The preferred reference is
always the bspec itself (or the PRMs once they eventually get released
for the platform), and looking up / understanding PAT settings there has
always been very quick and easy.  I think the most important thing is to
keep the code in exactly the same presentation format at the spec itself
so that it's easy to confirm that our code table actually matches the
bspec and doesn't accidentally deviate.  If someone doesn't want to fire
up their web browser to look at the authoritative data in the bspec/prm,
the necessary information is still easily available here.

If we want to make it even more readable in the code itself, then I'd
rather add comments at the end of the line, similar to the "use" column
in the bspec, rather than trying to change the numbers into ugly macro
names.  E.g.,

   ...
   [28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),  /* CLOS2: L2 + L3 (2-way coh) */
   [29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),  /* CLOS3: L2 + L3 */
   ...

> 
> > 
> > Trying to write out symbolic names like we did on i915 became pretty
> > illegible due to the long/wrapping lines since we have so many fields
> > now.
> 
> If wrapping is making a mess then don't wrap. I think people have big
> enough screens that we can tolerate longs lines for something like this.
> 
> > It also became a nightmare to maintain since it was easy to make
> > mistakes (and also easy to overlook them in code review).  This approach
> > gives us something that exactly matches the presentation of the table in
> > the bspec (so easier to add/modify without making mistakes, easier to
> > review for correctness),
> 
> Except when the tables in the bspec are wrong you have to actually
> debug this, like I did recently wrt. the CCS AUX screwups. 

I think the i915 stuff you're referring to was with MOCS rather than
PAT, right?  That's slightly different since there are/were a lot of
places where the hardware itself implicitly uses some fixed MOCS index
to control certain types of operations (and sometimes that usage isn't
documented).  So in those cases if a documented MOCS entry suggests
values that don't work properly with the way hardware is implicitly
trying to use the entry it can cause problems.  I think that kind of
problem has been becoming less common with MOCS over time since there's
been a clear effort by the hardware guys to start adding explicit "mocs
index" values into the various instructions and registers where things
used to pick some special index implicitly; Xe_LP platforms were bad,
Xe_HP got better, Xe_HPC/Xe_LPG got better still, etc.

For PAT, I don't believe there's ever that kind of undocumented usage or
an entry.  With the exception of the "PAT_ATS" and "PTA_MODE" special
cases that control the behavior for Address Translation Services and
PPGTT page tables themselves, the regular 0..31 PAT entries are only
used when the index is referenced from a PTE.  That also means that
aside from PAT_ATS and PTA_MODE, there isn't really anything we can
consider absolutely "right" or "wrong" --- problems just arise if
software binds a buffer with a PAT index that has incompatible settings
with the buffer's usage, or if some piece of software tried to implement
its own PAT settings table that doesn't match the one from the bspec
that all the other software components are using.


Matt

> 
> Though even i915 wasn't fully using human reaadable names (eg.
> some 0 values were basically just omitted). I have patch to 
> also give those proper names, which I should probably clean
> up and send out.
> 
> > and a key in the comments that makes it really
> > easy to quickly understand the specific characteristics that relate to
> > each row.
> > 
> > For Xe3p_XPC, we should probably duplicate that comment block (minus the
> > "comp_en" field that's not relevant here) since we lost a field compared
> > to the Xe2/Xe3 tables.
> 
> I think the only way the comment would actually help if it would
> be directly above the table, and the comments would line up
> properly with the colums of the table. Now the comment is too
> far away (it's documenting the macro, not the table). And the
> comment is using rows rather than the columns the actual table
> is using, so there is a 90 degree rotation you have to perform
> in your head all the time which is a pain.
> 
> Though even with the comments lining up with the colums you'd still
> have to jump through extra hoops to figure out what eg. a magic '3'
> means in a specific column. So still not the best solution IMO.
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
