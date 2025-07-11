Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E895C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5064A10EA92;
	Fri, 11 Jul 2025 16:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAoNf3aK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EA110EA92
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752253023; x=1783789023;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5t7/uo4EyKC3cuNnxfTYNuuBoOXNR2Fc32ec+XJITSE=;
 b=VAoNf3aKQzodsPQYa8obF0OtI3Xh7efZcqP5QzzH4y4b2Tqckh2BrfGM
 nGpqXh+DDiSXXoFj58zidwVT9K+mCN1LsV60JJ22QUuWIczdVSGBKqscJ
 R7KRbMGtLc5hgR3Gb1juKLg2sX9r7cGaK2Z0lMLfyr31NmYZzi305RZ4V
 yiOFtyneL4rP17/U4YDPIZnY1SNIOGFsOEV46JLPaFGxyGLHSQCcFaTml
 1gq+5l7yaKHab6lAF5/onfdefkf19c//n9HKru8tPvl0dnl8w7vjABoAC
 oKBuyIzmWllxDsHMPGJhlRfV9pvf+Qu58V+TBbUpqVCWR9S6p921vDxsN w==;
X-CSE-ConnectionGUID: FWwIm9cxQCWKLiw9MTmaSw==
X-CSE-MsgGUID: 82K8A6s+RT60wX0xRhTm8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54685855"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54685855"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:57:03 -0700
X-CSE-ConnectionGUID: SaP06V31TmWOeyJS50WDAw==
X-CSE-MsgGUID: NUGl1vrYSPqCvxRRM4EI9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="156972208"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:57:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:57:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 09:57:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vzgs0TgVkA06jx1oYHFcDZjaCqoPFuyyUYk9jmqe2UfCESaJqwe1n61ph2qApgiH+WTR5kPbo1EKqTW1lw2j8qeUbuiD00gRZA8klBh9xNQ+FBFDiXf41y9eoHMzP9qXPTOvMY0nbX/ZG+t27C3Ws+MwJt3NSfQdMDfXkLe8PoaqpkrMA9v4Uw6VNk7t+XA9gp4U58K5nMXGdYDTRVHIL1vW7v83W6mccPnKKZwMvt0TyzwVCoILHckIVTfYFqL+9CR3QvI0aon15VDsHBW80SQ7+TSvLiXz1zHfcCSVlaPp0jlpjuwZxK+YvdMP6gED0J+PScxTmM5a/yn2DULdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7q+MdvkKCehQwi32Bgmn/Wlw6FG4IFKwZxr57XPJaM=;
 b=TxgFiSoSIJnMTaEdNeKG3KinfXYKLUJd7ZowGn6iAnZetda1AVb8Jc3d55JfbDyZ0Jg5LIuEtMP/Dp/EzrmAH5dAmR1itwRAuKXuhMbIg42B+bYhpD/Av3tGZTDFChVR7yAvmFl0CCvb79HZaLcMOfLSrIIeWyx9DCetDB86/wYq7uFYyEds8LUAj4T3OTiwo8j2vYKE5JvNsaMT9uQd5/WWuYrKN/Xn/JFBePv1f//8mrVHIozkzObahPmmU6FfrIZeFAf5KyoraYmChixpmNor6zILpMe/gWLbWIO9mbGPFrtjLJHGiHgJm4qxVkmmfj1TBwJ7rdzn4V/MACRCaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF7A88A980A.namprd11.prod.outlook.com (2603:10b6:518:1::d32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Fri, 11 Jul
 2025 16:56:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 16:56:31 +0000
Date: Fri, 11 Jul 2025 09:58:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move page fault init after topology init
Message-ID: <aHFCp0zFPBVVRZoR@lstrano-desk.jf.intel.com>
References: <20250710191208.1040215-1-matthew.brost@intel.com>
 <25add0bffd0a1a561aef4e32074c93b73ef6fd01.camel@intel.com>
 <aHE7BHmgZSRpcxr+@lstrano-desk.jf.intel.com>
 <ae1477a49443fc4c5c9c80e8935d259d7be8141d.camel@intel.com>
 <0197b86d80323ffdf6501ffc1329d2736b7bfbd7.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0197b86d80323ffdf6501ffc1329d2736b7bfbd7.camel@intel.com>
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF7A88A980A:EE_
X-MS-Office365-Filtering-Correlation-Id: b78915e1-3eef-4632-69ce-08ddc09be2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?13/bWNjTOw6p0Tfw3l6vjnSKHRnM13dZ3IvMDmERUDhtesG9ah7w/YYK7w?=
 =?iso-8859-1?Q?T2R6SzWDXSVIlxYNy9DnHrsHudzrkohCtZfmfikSdhXavOTKrG84CUTYh2?=
 =?iso-8859-1?Q?fUZIfocN3CUum1L9mlpELcoX4hayQ3rKFrlJuN4uE5XDX86fOSLh6L31DJ?=
 =?iso-8859-1?Q?Heobt/YMdM0uUpj+Ah8T6e7bsuVRyGzWThFHLghMECRNqaOPPlEFdg2xD4?=
 =?iso-8859-1?Q?BvCMyIXZZNBxZmwIdw16uiwmnCOFO6VdoyX8zeIvGxgD7y9IPxDOZOdlrq?=
 =?iso-8859-1?Q?TgACohhsbe4yDmsUN7cg0dweI66HnVxTpYYdRqbowcOEle/bimrOTwHWcN?=
 =?iso-8859-1?Q?/Lt2SKKkazYvXU1a+DMCFZKjQzkcd+IOQXDd3LwxLIvIJ+H5ZRLLnDemeQ?=
 =?iso-8859-1?Q?QUogKdCo2rZfBzwo13iFSj4/26AwJfBQ+hv1PKu0PfTdI/pp1+2uvNnBcD?=
 =?iso-8859-1?Q?IHriVpWr232sp0HPdTJIMoyLhPNHncSkinu/yaUeL/rl0amLrqeOXGSPYJ?=
 =?iso-8859-1?Q?3/QH8bOi6adk5E+p+YQm3qH8CCOMe2HBqL1syxcIlB45/+O+Letcc3VrSa?=
 =?iso-8859-1?Q?DjwE88Pv9V9uloThxeC/LRkK1pmEoUMPIxCZloj4QfuVh6xUPSdSLOHbHx?=
 =?iso-8859-1?Q?MK0qTvv74ddwdSdhK+Ejoh6hLZZhVB7yVehV1Z2AdUe5lvrl1IJAxjDLc3?=
 =?iso-8859-1?Q?fg0wQftz900UnAapzpxoG/u4X4IDNpAf3wa+C8C+9LAKMo+yPP58Wyy3ui?=
 =?iso-8859-1?Q?vSpidixIHjeOCzjDV32P/+sNjpMXr64Dow87rJ5fk8dhko2Jj8b/Fqv7gt?=
 =?iso-8859-1?Q?07S8yq51wih5yPXTMxG7+mbiNiI7uCURXlXI7SDMBcg0wiWK6OwQXzfyyx?=
 =?iso-8859-1?Q?tzbeQKL3CimGZR2ybMJpj1UuD5IKZg8LDSGkDqM6/ncAZdXwQyCwDH4XAF?=
 =?iso-8859-1?Q?UN7nKYKR6pjafdAB9bivxR4En7u+4pb1b+ba653UHcANezVB5mWET8Qdtv?=
 =?iso-8859-1?Q?ngvd2uMoClSdvmdjlF8nSNffjTZ9mxcBGiauc/Whp9jky2jnmCpuTgl2fN?=
 =?iso-8859-1?Q?yQhyY6tBddFHENDOP0IY+hTK2+hy7FhhcIslS9ITczk+c9yrl9tNzmw1WT?=
 =?iso-8859-1?Q?tDXCxkCcqJn+vbCXVXnvziRL//7BJMVWcCLiruRRBZn3qfVqT4E3c29CXq?=
 =?iso-8859-1?Q?moahEa28aqmqm5gIP271OHoZmvwFTqonLEfwIY26JDrAP++EEpgqWQiTGV?=
 =?iso-8859-1?Q?tY3XAwgzWv3AfAP2vmILNDbXmZ7/y0ijjQ7N4S1APIAPEX4GsFbR3gAeX8?=
 =?iso-8859-1?Q?l+NwJKqYALZXFws6B1bC5RkI8kOvU1uod5OUI1joYnbaS3cnphkWP5otOH?=
 =?iso-8859-1?Q?TSJOheNQwamkZxpdBo6J/MYOiTRT9+sACHpsv91H/8Z0keQW3gRQzhARHN?=
 =?iso-8859-1?Q?QsvLS4J6MhHXG2chJwVLnKF9UnuGZKvsMBhywgLDY5bGMtFKMlYPErlXMu?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mFIUAFhPpf+ZJJL3avr23nGg3srQEwjL/67JkM93pA2vxpQJkYnqBN8eFw?=
 =?iso-8859-1?Q?X/V4oddz0zP0buHXQMHOK8opVoMfIHdBv0NCJK4J+38FrT3m6XUojsdXi8?=
 =?iso-8859-1?Q?26mvUKFbKEhzIH28MAUrgmgxjERfzJisK2fYg0wtWmJ4wZ6v0B2d32kNbV?=
 =?iso-8859-1?Q?E4v2BVLU2w75lR07rbJLPVic172I66rCNpsn9HSprypwmy4gs6Wo/RKywB?=
 =?iso-8859-1?Q?X0ThL5ymGk7Rr7kIw75WmvQoYiu9aQ+UN1HXQUKDeThG+SzSOEiibQXRBR?=
 =?iso-8859-1?Q?1iQJv/5p171vbFJK1ztrCCj4R9sIpBzCKS2UMQz3JID2SW3DqQdyXMK/CI?=
 =?iso-8859-1?Q?Ka+mlDbmO0pR5X0GAGtiEW3rCKjJE+URGn3/ITU9Z/tGHCcwjqL+WMVO4X?=
 =?iso-8859-1?Q?f0BzjSfUA5hoUpASki42gdL+cSADLFaQS24xHF4AlCpjde+AUwQeGY2ilZ?=
 =?iso-8859-1?Q?uv0Jlwn5Nn3gGu24++i1OfN/T51SQVqOYIrsH3n6vS+u0WmH0VP8suZn6p?=
 =?iso-8859-1?Q?YUuwmfyunVsRTWoVQxzGOJwkNc64wm/phhvKxNEOvAu4nRXW0nkFy5UbHI?=
 =?iso-8859-1?Q?IJ0JvNwlBm6qSdgQQEJ8o4IYfYUPpVVbf0Pp2c3GfmPwJoVh2LmMzt6nI3?=
 =?iso-8859-1?Q?Tez3Q7TrVHmTxhv3k/bvcHBG9TQ/wwAeTZdgqXMoEVX3HFwyFAHrnmkMrX?=
 =?iso-8859-1?Q?vNBdXGEFj+X5mFKWcQTU1XZ+Htis1HWc/NCRi36pkRnV2pH9CHVdsn/4UT?=
 =?iso-8859-1?Q?Nk4kPOG/sVXzhX0McbkAFf0+1HCQ8NS0ckXPSegEEDUREd+zIQrsJoghtl?=
 =?iso-8859-1?Q?mT+ZoEl9abQUrP/KSiRjYNE26FxthIP1Tc6kDKzF9ac1LqJJqJm7zdsjBC?=
 =?iso-8859-1?Q?N+wGLUHgK5E2ANrX9LEvduunGDEhCLN9iou8Rmea9embl8cv4gPyVHz4E5?=
 =?iso-8859-1?Q?8QwEnDTywUsFbKabT9TiZ/FewgMTMnExOXacPXQM4dK9K48n8RTg9MgQ0X?=
 =?iso-8859-1?Q?wyW7KY8zl4UGZAZhILF8+nmpVmfBLmil7Bg8TNRzhh+4zZyNJ1f0d4R/O8?=
 =?iso-8859-1?Q?dwYnlvbTMFsTgr2dJ0LtIQ5GHp8CotEvBHJK+3QJKSYClGVUiIsytPoLc8?=
 =?iso-8859-1?Q?ThMipxAWS+mVKZtqK9RTKD9FvOZyGSG5UiHwEX0PzG4Z2fhWUVbbTMP+l2?=
 =?iso-8859-1?Q?KlH1B6ooh7k9Mbhq315SvmRmyrh5FOxuyBnZv/3iS6LwdXkEIGHId6Qpxu?=
 =?iso-8859-1?Q?2WWtKTqOvEEjCM6pdPKECrWWUHA1UM1DtpeF1r2c9sqfCPfWhvlYJvI8mr?=
 =?iso-8859-1?Q?xIQPr71aunOn8u+lwjm43P9HK/ouOOc/Qtf/uuZD9425wiQoDbXqFQPCHt?=
 =?iso-8859-1?Q?B4OHJBDWDD3L/lPFzzk5PAWuCy372gc9xClOwDzwkY5x+ktsexQFfQ069F?=
 =?iso-8859-1?Q?WOUFj+k8HV8Vcln/1DwQ3+pUpkgOyaca5PAg6Z1Xq2dG0eWwog2rwrS4Qw?=
 =?iso-8859-1?Q?5m7/vkX3PWgLLxMRRWiLoTNUyDVyuE+TKbzATwpL6i1PgE+K14Yh8Slqz7?=
 =?iso-8859-1?Q?7imNKlgc1ONyBUIj0K6g+5iLZ+ixYq4qNfsMw8OniUzfCWomGMXZPc9QtH?=
 =?iso-8859-1?Q?h1+7d/DwNXke2LhE2t915CrLfcyjYTSoJWvsri62G9OAdKBRmA3brXhw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b78915e1-3eef-4632-69ce-08ddc09be2ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 16:56:31.3382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiqiqQUHBYgETa6RaCy6K1lce9/JSfzDybT+a3BOZXOKARTgVJwbsxvQW9ad5t3EZIOaRJQKsYImB6FKPvWtcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7A88A980A
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

On Fri, Jul 11, 2025 at 10:50:44AM -0600, Summers, Stuart wrote:
> On Fri, 2025-07-11 at 16:29 +0000, Summers, Stuart wrote:
> > On Fri, 2025-07-11 at 09:25 -0700, Matthew Brost wrote:
> > > On Fri, Jul 11, 2025 at 09:08:55AM -0600, Summers, Stuart wrote:
> > > > On Thu, 2025-07-10 at 12:12 -0700, Matthew Brost wrote:
> > > > > We need the topology to determine GT page fault queue size,
> > > > > move
> > > > > page
> > > > > fault init after topology init.
> > > > > 
> > > > > Cc: stable@vger.kernel.org
> > > > > Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page
> > > > > fault
> > > > > queue size")
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > Yep, good catch and thanks!
> > > > 
> > > 
> > > Thanks, I feel like this worked at one point in time though. Maybe
> > > something in xe_gt_init got re-ordered recently. Will check on that
> > > ahead of merging to make I have the fixes tag correct.
> > 
> > You know it could have been a problem all along too...
> > 
> > (num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
> > 
> > We do have a non-zero calculation here even when num_eus is 0. That
> > might also explain why we needed that extra multiplier, even if we
> > aren't covering the full pathological case here - I still need to get
> > those pow-of-2 fixes in to that pathological patch and get that
> > merged
> > :(
> 
> You know it also wouldn't hurt to print this calculated value out
> during driver load or something so we can more easily catch
> miscalculations like this instead of just relying on the compliance
> test results. Of course not needed here in this patch...
> 

Indeed. I'm looking at a page fault layer refactor (similar to the TLB
invalidation layer refactor) and have some local patches. I've added an
assertion that the number of EUs calculated is non-zero, along with a
debug print statement to catch a bug like this. I could just post those
changes I suppose.

Matt

> Thanks,
> Stuart
> 
> > 
> > Thanks,
> > Stuart
> > 
> > > 
> > > Matt
> > > 
> > > > Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> > > > 
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gt.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > b/drivers/gpu/drm/xe/xe_gt.c
> > > > > index d397df056e4c..af03e19ef9be 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > @@ -628,15 +628,15 @@ int xe_gt_init(struct xe_gt *gt)
> > > > >         if (err)
> > > > >                 return err;
> > > > >  
> > > > > -       err = xe_gt_pagefault_init(gt);
> > > > > +       err = xe_gt_sysfs_init(gt);
> > > > >         if (err)
> > > > >                 return err;
> > > > >  
> > > > > -       err = xe_gt_sysfs_init(gt);
> > > > > +       err = gt_init_with_gt_forcewake(gt);
> > > > >         if (err)
> > > > >                 return err;
> > > > >  
> > > > > -       err = gt_init_with_gt_forcewake(gt);
> > > > > +       err = xe_gt_pagefault_init(gt);
> > > > >         if (err)
> > > > >                 return err;
> > > > >  
> > > > 
> > 
> 
