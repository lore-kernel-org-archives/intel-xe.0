Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4ACD597A2
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3821610E236;
	Tue, 12 Nov 2024 20:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="masHc/07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C2110E236
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731443414; x=1762979414;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9WcopCkUMXl+kKcVE8FDITh8ijQY0toLR2FgbczO3Do=;
 b=masHc/07u58CFQwo3O9zUp7ssoVAtw1sv9qhDJyh73Wv38sfmSP4hV+H
 q5RcfB5rJpKUodVhj8CeKGM8V6vqbHR+XXnIkrWhC2J9ihWXDZCuO0qTj
 3Nq31/jpzg6X4yvkJDNbDPUJiSBN/BsYTHx42X7wWPdFeRYkEN+GZuRWl
 22hqNXg7JE2iVwff42qI9IdCwQHuUTbG1m/xtBxOQw9amvcW6rjWMEiGC
 C0e9IibictWjBAXq+DTpdcHXnOxVV8yB+Xzgfx/eC2M9PvkFQldf4owI3
 BzOgBM6nIw8xzQpg1cMIB0Lex9vKo9xwzlG/rqFGKyGIP0wz62LdD3gei g==;
X-CSE-ConnectionGUID: 14XWzUFyRgOTC9X8Z/JdLw==
X-CSE-MsgGUID: A870NLfCTlGJDVJcmeTI+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48813244"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="48813244"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:30:13 -0800
X-CSE-ConnectionGUID: EiHKHQO4QVO0XK+AbtnO1Q==
X-CSE-MsgGUID: IJKP/bimTHeeJt4iPHFB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88456036"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:30:13 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:30:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:30:12 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:30:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2Pe/cyOWZqt6CGZhoz284fBGXgPydPsO30gSvvU440qkPZIHzikrL35Eg3cG0KVux0zM+984P9GQ9likhmcSwo6PM8rVM/qojO9lPi/VXzrErXaOwyUtPXbnlJdpFlupAV+WQhPVfvFXhJ3cX7vmQfXseyb/brmF+WrAzjwhmq0Ao3JCl6Ne5WmYT+sIvv/D9Knk9FPiH2rggh+STU2FeO53W0q5NAKgRDPKEXcx1BBJYg16rTCLQvmcLGuAs+pfy1IzmtKWWl4D4GENwyBcTBhCJfegqmGqHQcIO7yucF27im6W+SRPwMVcaAp2KE19Ktgc4EUfOiByAGQfne2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iTEYui+QFImAC7eij/FThly2zmmMsJvtSPkKxh3VdU=;
 b=r57QYbFX74CXSOIjy9gHeMP/u8wgo/h/zMk/jJIe+c9yBXC3VXniXxHRtktGPYsWlEUqmofHUh55HNmzjr9HKsdwwtxUBchf7uPT/qMGQmXOTItZllUDhVAm+DKOVzoy+Y8rnFxaZePc+KTIXM1fp+l5HvyZNsHW3YFMEXSE3W3KxYxtyVSZrio2RTiJKhsS0LSJ9Q3b1Q2jlguVBil5DakPfdG9hnuPwNVIOz8TdWkboUAkETq2YncYdbhOzdIBpTN54jELtFMbFBpkd27X9XzYAoDMTP6H3fEKnqnlxHENGbDKGU/LFh4iylSYtERZpqqg38izJ7PTKfVBhc0JcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 20:30:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 20:30:09 +0000
Date: Tue, 12 Nov 2024 12:30:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Message-ID: <20241112203006.GJ5725@mdroper-desk1.amr.corp.intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9d829b21-4327-4cbf-ad72-b3e47d57fa74@intel.com>
 <ZzOb3FtRFAMAQzt3@lstrano-desk.jf.intel.com>
 <CH0PR11MB544468E5716752CB21F19C2AE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB544468E5716752CB21F19C2AE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 25477f30-025f-495e-0d5f-08dd0358cd0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?THB/MuJpYv16CCSb/Tnpfhm0gkxKqYaui/UvHNWTpwVOMXw6u8emQwbZtbmk?=
 =?us-ascii?Q?4bRYU5/m9iYo10W3XvkDPOIzqza/MNb/x3lUqFSecJiVM0VYyND/vq4LGGM1?=
 =?us-ascii?Q?H8b8nvUdxz/qxJi4is98ldYt6Q+wOjElTL1TpX19OEABoZw+UR0wMY9/JNTo?=
 =?us-ascii?Q?hIOymkdh+xWft1sJjYOynyVB5SlVA2R+jqQCZKqU43MVgdjvpHqnD3Sdo12n?=
 =?us-ascii?Q?XSr4t32gwlkNVft7pljysMwiJ9RjZyCVgbzGVS/W6P91UN/9HgUfxKyHMeHN?=
 =?us-ascii?Q?OCRYu+J+dOXmvwtDNLeT6cso688iik+4957jfdozbtaPcJMTzeXX8ocTYYkf?=
 =?us-ascii?Q?22G9WFU3EoTu244Nf6233jUJweSnh/VQxRnKlSd0i50Dj7c7K7BW6SM/qYzK?=
 =?us-ascii?Q?PRU3LRM5DA6p+N07qCoG3anK/sYLZzf0yWXbOruv3phCkNoB6nLo5WxbjAdC?=
 =?us-ascii?Q?1oZvc86RRssQYK+0xguSgwsXv5fIWRrNJFrOcOWSV5vcHpWJRGoMNW97vIxQ?=
 =?us-ascii?Q?KG1bzxlye4bszVDaZ0/oK2ldnfBz8c+32ccofuA8jdsP/U/EhY8UxTbVE1Ls?=
 =?us-ascii?Q?hONuvaemeikAqRCE7jRpPBzJrs2g95NuR0KE1DywjTG+fnIOIj/GCMDdsMgW?=
 =?us-ascii?Q?Fn3ShOHNFsECrgaxbhqkyC8QGnU9RXBIREdm4KJ3salqCV46r4yoUyPj78Oy?=
 =?us-ascii?Q?o6kr9n9PkZ3J3jEGf+fIww3F8V3wvv36EIHpzdcMtl+CaXTvdoMTWAzYn84M?=
 =?us-ascii?Q?ENMiu+bSUy7OssZwIaS4X2rH7j3emaSHtpUigEhh7yzsFSVCVZbMHUxgn/ac?=
 =?us-ascii?Q?W2vRJOcGr3SiiQdZoLeiHaCn7tajNqcfcY2SbcN3rbnN3PK2yae85xTehDu/?=
 =?us-ascii?Q?lJjxoDlqbUONHCvATBS1avPKaeBf4I0WQjS9SPVYoHmtcimEuPXekp0KgLjy?=
 =?us-ascii?Q?fOT2dMZPVT2H4k4dmR/QCjio9jNDhQNMZketIEhb8rJyUS5JfP2+KsNs2FUW?=
 =?us-ascii?Q?lxBBiJN5fHDeynhNV9FsSQ7eG6jBccN1kKGQ5/oVV0jobcmFo+Lia3x4tuZ5?=
 =?us-ascii?Q?7g47vS23YX2U1qb8yo8yZyTcUpwG/u25biWo3RNbvzfQqZEAEI1GmQtaxhfL?=
 =?us-ascii?Q?NZILDmGJGJ+cHf7S9MUGJY2O/Hi855v6TWxe7oyoP0+a4oeBxBJb467gTajb?=
 =?us-ascii?Q?GnrCtTacRxX3c8tjqHQttMfzYd6uYXWM5WNXGd3w8jkPYl/H1cW/AkdLqWLG?=
 =?us-ascii?Q?uxcKvr2mzsXBhYon5gz1CBTt2gMLnx62SMA2bkZ8t0YsBdIGuBfWjoE13cgd?=
 =?us-ascii?Q?mrU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?td0TIYjd3tmhmE1l4XPVjJ0B4sfLpCaELJceQ+0/kh5cYb5jmZafOe8wQ5Gp?=
 =?us-ascii?Q?eiTBNOGXmmeEwGsmJHzZYM/J/+qhF7PJKCiDIfrpjeAWU+764A84O3r5j30m?=
 =?us-ascii?Q?luq5f2wW9qf0TjAJO2+CJkxjXeQ4Hkk+uzNelDxUfsQVJD3k/n0u6NbDiKe2?=
 =?us-ascii?Q?tXnr2DXvdGgkU49p6FJgM5uWesyd6bGVSlst8ADn1ONn8YdDQpV4b7ZdL5jN?=
 =?us-ascii?Q?GQIVfMU2Ik8Fps271Od9xpsQg1NYmPue6UCzUualStn1WVIHacmb5Z/5aO0R?=
 =?us-ascii?Q?dHZjy+IKWb+WrRJ4Raz61LIc1BBev65Xpvz469NWNlshk+b841oO3y9ytg+v?=
 =?us-ascii?Q?q8Bo2iPGgepa9tcn9orEZi0vjxZaXPTlzhBS5PdQQuKJpmR2rfx0UN1LZGhi?=
 =?us-ascii?Q?dJ66r9lk3jjDSVEez9icYhud92hIYxUEs/XHGR5b+PzvZ7N23yd0lmGIXWWm?=
 =?us-ascii?Q?LStAZt/UzsHshbpikKCqsa/iiAQpf5J6LBwi7jfMXjGXHKQGFgTyLGvnL9MY?=
 =?us-ascii?Q?DyNmyWXl9gS9GSwFdyJX1EMaAsOXbcBizTA0D+VKynoc7KoLWZkQW7WJbRxW?=
 =?us-ascii?Q?BMDVHWdRIqpEjreCnAi6q/yxmPelfnmSK+HTXUsnb/Rfagp1/qfUi9ekAFEf?=
 =?us-ascii?Q?kBzQUejqRakEhld36FwUDEBwE2qz4otgldBguRsM1ksMc5heqse0pLiOvZBv?=
 =?us-ascii?Q?l44SzLkXF3mbti1/KL2un3JDdhe6lkQF/T5FxPV3dPIpr5fCqr99bXwHnAyF?=
 =?us-ascii?Q?1lpqi5hSCXgNkSw2Ad73AgUK4HJb3eEHBPqK4WjOSe/vzaHvtfYaBkxl2nBK?=
 =?us-ascii?Q?YbJXKCthOFZTVO/ovGqkt0oAYS3HuC2SIv49AFSCvh9bHKvz4X6Da9/i9sc/?=
 =?us-ascii?Q?BUwx7G4SjA2SyLGnWRjF5rZibxf3jvkcwyPkc7cU/fZo3ixN6Cq6u3DeUUmK?=
 =?us-ascii?Q?bkNTbuA4EGqZd8mZw/N0gADVooXLonQJuC9dj/ANV1B+kncdLJySrtDshCfg?=
 =?us-ascii?Q?JwcmJAOTAi0JT73M/f7E/E9UMCSUmJIvU2DVPOh95jEAWNjTVhSwbeawjSZ/?=
 =?us-ascii?Q?K4hcJG9ctvMN1Q202c06VPbSGWitzzbCU4XA2NIxq9ox0Vof3U5yudQIs6kM?=
 =?us-ascii?Q?5J/AqivsW01h7KGkqVPxbr2sW7uH+wP3lpHjq9OtFx/HoB3CXvETWoRRpQLd?=
 =?us-ascii?Q?LP5/CoiAmH5XGrgw0Ol1etN5V3dZmEx9TIs1GmtyFiORymOxS4txVoxGuNN6?=
 =?us-ascii?Q?heIwBTuLfu4dhqdfYG7dKoSl/fak6kSHKF1Dl/QllV/6IgKckB8CN5j8RSd1?=
 =?us-ascii?Q?Dj1b4y3+rSMs3QTfDu7qy0nMa4FGJQH5513K3hbhmUK7CAuZOoezlqoJF2bL?=
 =?us-ascii?Q?eLiC1DOgpBxSu0ri+6gAJuSQSo4V4WshlygiL3OYz7xsOctHoGpwOq3HeQK4?=
 =?us-ascii?Q?6JicbuE5R2MMtKH2+bhms39aJ3tA+rCIyTRFNmswbbYIC6vbj9sW9u66uW+V?=
 =?us-ascii?Q?nVZpG3GPLOlUIGKdt3O53kFny6J70r+tJIPxZOcPeEhVSaahOjv20ZxWSY90?=
 =?us-ascii?Q?xXTuVAlXiUIEk3r/vUhxj2+G+lp3n9zaZrSRTlYjLlTxZcQ9gvXnEmT4sJwA?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25477f30-025f-495e-0d5f-08dd0358cd0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:30:09.0377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4LaD67eRW4AA4Az8noXM2QU0TbBhYDnalFe0pHWygba89Xby/n3OEd8on4eHIZd/4GW29MEJRi3Rkn2gHD1eb80C8zX40ZFR5aput8ZmZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

On Tue, Nov 12, 2024 at 12:16:46PM -0800, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com> 
> Sent: Tuesday, November 12, 2024 10:18 AM
> To: Harrison, John C <john.c.harrison@intel.com>
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > 
> > On Tue, Nov 12, 2024 at 09:59:16AM -0800, John Harrison wrote:
> > > On 11/8/2024 15:34, Cavitt, Jonathan wrote:
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Friday, November 8, 2024 3:10 PM
> > > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wrote:
> > > > > > -----Original Message-----
> > > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > > > > > Sent: Friday, November 8, 2024 9:43 AM
> > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > > Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > > > The ring is currently in LRC BO but this may change going forward.
> > > > > > > Include the ring address in the snapshot protecting again any future
> > > > > > > changes.
> > > > > > > 
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > LGTM, though the terminology we're using to describe the various ggtt addresses
> > > > > > as "descriptors" is a bit confusing, even if it's consistent.  I wonder where that
> > > > > > terminology came from?
> > > > > > This is just a rhetorical question.  I'm not suggesting it be changed.
> > > > > > 
> > > > > LRC descriptors is name copied over from i915 and may even be in the bspec.
> > > > > 
> > > > > But yea, indirect_state_desc and ring_desc are bad names. Will change to
> > > > > 'ring_addr' here.
> > > > IMO it would probably be better to leave it as "ring_desc" for now as it's
> > > > consistent with surrounding struct members.  We can do a pass of the full
> > > > XE kernel for inaccurate uses of the "desc" qualifier in the near future and
> > > > fix the naming scheme here as a part of that fixup.
> > > I strongly disagree. Just because A is broken doesn't mean we should add a
> > > broken B and C! It makes no sense to add a name we know is bad just so that
> > > we can change it later. Anything new should be done properly from the start.
> > > 
> > 
> > I agree with John here.
> 
> Okay, I submitted a patch to change the name from context_desc to context_addr,
> and it was rejected because context_desc is actually correct.  But if context_desc
> is correct, then would ring_desc *also* be correct?
> 
> Pinging @Roper, Matthew D
> -Jonathan Cavitt

As I mentioned on the other thread, "context descriptor" is a formal
hardware term that has a very specific meaning --- it's the 64-bit value
that gets programmed into the ELSP.  The context descriptor contains the
various things inside of it, including the LRCA.  It's documented at
bspec 60419.

The problem today is that the capture code is using "context descriptor"
as a name for something else.  We need to decide what the capture code
should really be doing.  If we want to capture the true descriptor, as
used by the hardware, then we should fix the capture code to record and
dump the proper value.  If we only want to capture something else (e.g.,
the LRCA), then we should rename the fields for what they actually
contain.  But we definitely don't want patches making statements like
"context descriptor is a legacy i915 term" since that's just not true
and will confuse people who read this in the git history for years to
come.


Matt

> 
> > 
> > Matt
> > 
> > > John.
> > > 
> > > > 
> > > > My RB still stands either way.
> > > > -Jonathan Cavitt
> > > > 
> > > > > Matt
> > > > > 
> > > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > -Jonathan Cavitt
> > > > > > 
> > > > > > > ---
> > > > > > >   drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> > > > > > >   drivers/gpu/drm/xe/xe_lrc.h | 1 +
> > > > > > >   2 files changed, 4 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > index e219657535cf..afb0f4f44748 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> > > > > > >   		xe_vm_get(lrc->bo->vm);
> > > > > > >   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> > > > > > > +	snapshot->ring_desc = __xe_lrc_ring_ggtt_addr(lrc);
> > > > > > >   	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> > > > > > >   	snapshot->head = xe_lrc_ring_head(lrc);
> > > > > > >   	snapshot->tail.internal = lrc->ring.tail;
> > > > > > > @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> > > > > > >   		return;
> > > > > > >   	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> > > > > > > +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> > > > > > > +		   snapshot->ring_desc);
> > > > > > >   	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> > > > > > >   		   snapshot->indirect_context_desc);
> > > > > > >   	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > index 9d64cedc4d14..a2058a501353 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
> > > > > > >   	unsigned long lrc_size, lrc_offset;
> > > > > > >   	u32 context_desc;
> > > > > > > +	u32 ring_desc;
> > > > > > >   	u32 indirect_context_desc;
> > > > > > >   	u32 head;
> > > > > > >   	struct {
> > > > > > > -- 
> > > > > > > 2.34.1
> > > > > > > 
> > > > > > > 
> > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
