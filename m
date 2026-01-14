Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268FDD38FE6
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 16:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAE210E63E;
	Wed, 14 Jan 2026 16:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3trLqLw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD42810E63E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 16:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768408165; x=1799944165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4VUU/Zb5Fxxtsi4m+NF5d16XwWemEGr/fZfk0R5YKwM=;
 b=H3trLqLws4acsJpx35xjG71ciQT5bQwySYkTyhle8mGk2cfkkeM3e1QU
 8/PhhusoVg5ncHNxaZISlLCyB19TdcoQswdIPDRt0RPamqgNLR8kyQsJS
 1YKdh8zoW0r8f8aLdE7ugbCpMVcLFAbIcfW20MYAc7x04I4jT+7t6E45F
 q1h1xqqyD0TMqU7WHtYofrqro6ZaNl6w6rNI3W36CsWXKDJ52kIFDc8M2
 jKPFW9JPTc10WJ3eaz+kv8J78QOCXaZ4E6poXwRZ9agMXsUX9Alog1bkT
 5CSQFCzmJexeB/6VBGOe3WnHlNofkwNYxDl96eXJCXVE+E423im0IpKSn g==;
X-CSE-ConnectionGUID: 6U24N4EMR8iGum6UibXKUw==
X-CSE-MsgGUID: Pes0H1WmSr+PtYKDupsxbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69446596"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69446596"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:29:24 -0800
X-CSE-ConnectionGUID: 9xl1Yx7QQguboavnkZ8BLA==
X-CSE-MsgGUID: /Wrq/55gR36H0qnPM/5hlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="203934294"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:29:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:29:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 08:29:23 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:29:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuOJ15oA59Zuu9aaiAosAsGetBnrXwgIyw4/sVAicbmyeD5kNg/UvhlKGh189G77x85VEGhPweVxJ79FUbI0K+e+LWJoEuM/XLruABIgBOdMdbLOpwyj6XZtAv9287vyfBInpH/ONYRNxguyUtVD08Ud4R3CZCwUesG5ZxJVt0OQRXktd5ihXl58ouueFAbxTKFHNgcP0slXbokUEY1kbGpXr8P2R8Gyble+tPxvV7cagreYMlqvJ6J5iluH3+aTEM2/VmG8hNw8nWmbCHgU7+QeliLZ3yiPfPQqJ9glJTPLmdOjIe3NySz+HC4iLmQZ2P0EoTbq9dX4f8z1qTiNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cBGLtaZWrGaBlhMSWpZJ7R9F2sEUn3meyiaKokkRzc=;
 b=PQr2xT4mMSwh2xBOKLlXZNefyOo9dUzIdyDjLdC5Jj5xMIB2mVBMW6zwadVgtNnznvsu7+yfnyzcCqCUvdT0b4uXIOiRg2LljrSlhLaQibq/qRENgWismo1DUye/dGZtPKIqXh3YTGy/veO0GATAf8vRiVSzmyYicp11uss2cTsfP1ppcnlqS9nPBpKvIu+Xs+roVj/sxoIexK2ZCjACxwgPchxXVUYskwl0P2JVRjCYay062IZZsi2U99uaZsxYaq5P2wUxbP60j2cDy/UOZP9VdpC4l9G9BtU+3T52/D5cXl2rafwjm5ykzYcOKNXNef3PBCWBTCLqrkwU3tpnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 16:29:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 16:29:12 +0000
Date: Wed, 14 Jan 2026 08:29:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 41/79] drm/xe: Cleanup headers in xe_i2c.c
Message-ID: <20260114162910.GG458797@mdroper-desk1.amr.corp.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <20260113230315.3081153-122-matthew.d.roper@intel.com>
 <aWcloOfxYjg-XvFQ@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWcloOfxYjg-XvFQ@black.igk.intel.com>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: c127809a-bf95-4e66-fae1-08de538a0d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ooYGqQCXVXBmJfhhBOpKhdg9B1WCS5246Oq2QwLDN/A7BJEsCKr1AS+qtQrP?=
 =?us-ascii?Q?S0VRLQ6UB26K90vs8Fav8jOAK43J/39slYvcRaJz4LTJtsRh2agEGy6PXRd7?=
 =?us-ascii?Q?26/4+unfYMRoKX1Zv4b4nmNMiqErRwqe1cVNG6Qt7DflRnX2iXEWhBJ0Fkng?=
 =?us-ascii?Q?0WpppPbxT1isdlyAAetFOzvMTeSHNSnt+mcKbhZEkGC2ocWyLKJ3Rttycddo?=
 =?us-ascii?Q?mdouynP/igjMvOvmG37FHIbN6aRNzn145lB9we7me/yjOIJKRLpRPZ1OrX6o?=
 =?us-ascii?Q?jZkEofTbHbB0eL4fOvsEQEGG9JJ/9O2E4zKK+sguaYFXLPnc7oJ8hMCIa6iS?=
 =?us-ascii?Q?iRrZUE51V0NNbKk2AOVxWFBo97IZupsCIVwUIGrjCzXWYHM+zV/ebqDjnR54?=
 =?us-ascii?Q?LE9xvrDzkKT80rYiKKW95KXTVw9W9IYp+f7wDDPmg78XeLgPwnW8c3EFwpaF?=
 =?us-ascii?Q?lJ/hAtbWpqYar5kM2M6l/5EnjmNrk8fHiLRPHJCrwswR4wN6yeh9bIsUdTft?=
 =?us-ascii?Q?L8ZA8/ptVLKEgGedQ6BDrIhI1pE9iNJElVDbrpQdR7roUrH05P619Z1qc6w3?=
 =?us-ascii?Q?CiwOEYp7R7hJptOSc6sSlJhZAcY+GfczobD1hBXkaGrNvDW16wV81g5UevmG?=
 =?us-ascii?Q?7pBm6C7NjLm5Mt5jiWfDksRWzgqf+C2D7ldWlBT+HhpejIll2apRkfkup0b4?=
 =?us-ascii?Q?KmbBISXOUxba97ckL1+nBLOlEGDqCt4s0cIeOgOaPYhg32AZd7YedckPzsEK?=
 =?us-ascii?Q?5kRRpZtxKC2/sCpWKArWcrZmZl2ST/W1G/P9VV4ftVPcfNqMLCRAEl0e8fFA?=
 =?us-ascii?Q?fLKjtc5+xBYXD41G1q8d+7hv01uNQnb2/nitGN++7xrlihWChsVYacanfoQN?=
 =?us-ascii?Q?joRiqoEPlwGhTnWaraR1y1mT5FW1VB7Z4S252tcDTbH1pdPs5Na3S/PNSao8?=
 =?us-ascii?Q?MBCBIcNVuy2sKkknyLIblWB++5ShTRXCi7wnfKOsITTj8VTdArDKzcXoA6KT?=
 =?us-ascii?Q?EQENjchS/msWoDMl/+ne9tvcomj8iP2F754fuxXVv0XYUzvd2I9jdjnqflPH?=
 =?us-ascii?Q?bKVooPtqgE41xCPmUHuEPPx84QJyuH4/CLqjoAhpnqqAOzMNtfrfedQGRT/6?=
 =?us-ascii?Q?rVlMZgi6CP8LJuZaBMsoJvKgtobnrOlycgXIRhjk6PMiyz+KVZwNEmrrsTcI?=
 =?us-ascii?Q?92mKBVWJHLrNqsj1fRP6o3DRk8z9x6gvBilxK2pbubsp+WqjrLJBE61mAe7k?=
 =?us-ascii?Q?ApCWTImwmY9PAZZAhSGjoo5RxXy3qjkcaNAZ+X/ty6u3p161BIFA+MZkM/Wk?=
 =?us-ascii?Q?ufNb8stcOoh6E8QprcG/cykUW9yjSHPcgNJrIlmGu8q4u23vS7b5OoxR0wlt?=
 =?us-ascii?Q?ltPhr8jb06NXW3yNmKSDp8FWbQ6Ckp/B+PX021+ex8PpcsmEUDWHSUU3eiQR?=
 =?us-ascii?Q?/0vKqMJTQ1YGSi8uWlh94vnBQuqCL7C1w/uZmtL1nmClgy1g0l4Fd3AQY7m2?=
 =?us-ascii?Q?4ZOTLZEHDUrzEwFpYTPyNCauVeVM1NayHl4KpltOW9z9FLNh3n5ZyVwQxpym?=
 =?us-ascii?Q?QlYtzfTKrtW4hn8vPzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JFqcCU3ZXQ0/0vhjXe4kazAuREBJI9Tzhv6Dem3YPsmSbCkbsNMrQ3kujB4a?=
 =?us-ascii?Q?NBr62WNMny3cbmhENu930x2Q7vd8oL698Q4NUO/ghXyHFYpNzu/5Rt8wOXZp?=
 =?us-ascii?Q?zkYTMMnRLUKK0tsQwysCLByrTbAjJyLJUpJ4gpB+c70868R2RIxOhMZMayoj?=
 =?us-ascii?Q?98UbJywvnucO2J6e5gv368nCYqAtR4wDD2Znm9DHLtg8uA5QuvuWDWWTDWUG?=
 =?us-ascii?Q?qgTU2QnKuBoHXMTw7Q63rrWeZ81xGIZX3L13mF0L99rdoNcAK2eGvju/5iP0?=
 =?us-ascii?Q?JzBlAV6YtFs1oxkxq6CJyBKk5nNBOphltuyqTgTZPHMBzBhuPeggImsGRE/l?=
 =?us-ascii?Q?A2YzZiXboSLSPL5h54weAZPHNkAgUHDM9lCt6pzSXEUFxd6clhR9NLaV0BBc?=
 =?us-ascii?Q?0VuSLJx7ArEKeGKRNPpXGNWBOnYx6pP5bpsxM+fAcPCiWI2y0UDunr/5xvFY?=
 =?us-ascii?Q?ew07iE5qtylLCTEb+WM+K73H9wl7+ZyBuskc7P3PlZld/Fg/rFFUgQ/NkE9C?=
 =?us-ascii?Q?1Qr2Y+sGVnR31GPYPmxRgaG/PJjoiea3ezPfb4537VXc166WbmyAiyHU4IeF?=
 =?us-ascii?Q?b5TzDlX2Jwm3vjtIeyp98wlWxZqUx/TbNKMJFsaH9GD07bFLVVAyV87Ol429?=
 =?us-ascii?Q?/8HJzYlYiBrOTLPbpJ/Vxm2gI33n/BmLL6vEUa+pPqAmASFokcF4hpvBtZJ3?=
 =?us-ascii?Q?+6fPukrzk50blLHHOjg32kehSb8JMbd6MAgP/YwPZm3eeLiVR5taB1RrblZW?=
 =?us-ascii?Q?WehAqRfHBtED+Powk9uHkiw7APmduEmXH2Dk1/f6eaCEymuSK3TmUdSXGFrA?=
 =?us-ascii?Q?hGeMTx+E2UKdhEAi5abKWVNvJnaS0WK/OWhT8b6ArVzLxhJjZw7QpmRwDSq0?=
 =?us-ascii?Q?1A1tG/w9F0ePrwMI+pp11xxk4PypF+k7YjoUsfWCmfsE0nQc3sYETkKe21yH?=
 =?us-ascii?Q?SG6xd12aYA9oz+CrTEZ6ShS2TYgA3OXEDliq9sq33wvrlV+9cCNGqKRtdJt9?=
 =?us-ascii?Q?avh2lN/g48VCIIU9AP5q1fBFF1b8Q2HrIk5CjvYVaD0OIVusAxdLNWxF97Tx?=
 =?us-ascii?Q?y+aTU1XBj5mHKOR0FKYr9wZMAMnJ+dsGRKUH9YXOwNXVIopEscL/UWO9a2gG?=
 =?us-ascii?Q?OMeAp9bdcTY7MvREKQ8ZMUX9MQUbNwE+cirRa6E7qn4XUUl+/iGTyg5CWUEP?=
 =?us-ascii?Q?R0R6eb/fbXVShrpqNhn7aBiVEQ5BJmRLFi5lN84GbPdl1NuvrcVwy8/CYnmE?=
 =?us-ascii?Q?OVXYiDrpktWaw2FI73x0nWIxzDT/1RNX/yE0UY66VGZk+HCOujJBr7Pf9Szs?=
 =?us-ascii?Q?uCaCV3mn4L5oRfyOWvTkOQia0lTTlUtVPwMdGQrRPvYm1eGahTh6aOyvFC6O?=
 =?us-ascii?Q?wsgAEWBog0HewFx+oeoS3mRxO3xgbgj2MpcXv5ZeJYXORAglTfxgjSk+Uynf?=
 =?us-ascii?Q?ONmQtyf6Y8jLRzTxkjG8c2dukQ322li7khn1gToYXD8lYQGn3hWasLahSbYR?=
 =?us-ascii?Q?minEipGkmSogSM9qeeGUjT1MArKbUeb4tis4B8lzGsi0Usxg6L91napouDGo?=
 =?us-ascii?Q?Gdtb/Z0hbVwtdSRWsdCXTDMcPXRa5uUavwOghewbEHoDLJJRO4Qra333sFM9?=
 =?us-ascii?Q?cS6DPx39y55VGlXELwASCiyeZTHzaYAWEE02mOwSENqDxFUdcEVu+qxOWK/4?=
 =?us-ascii?Q?zTHmK2iMQzH3ufFjhiKOyDBdI1D4NzFWfqaLjiKjsTeodKa+HzGM8KfTGRgX?=
 =?us-ascii?Q?K/P86T1vTxXsOPvH+95q7bgWwK6WWEA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c127809a-bf95-4e66-fae1-08de538a0d04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:29:12.3862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xguU9sxwE+kol7rY4M0LzK6ODtKEc2rdOOQeBzhmf99ZEzKUcUUvXASwcLP+vOCaqlyb1DwO/VPSla8D3nfzE0TDEUq3wDyEhUu6XeZhmpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
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

On Wed, Jan 14, 2026 at 06:12:00AM +0100, Raag Jadav wrote:
> On Tue, Jan 13, 2026 at 03:03:46PM -0800, Matt Roper wrote:
> > xe_i2c.c doesn't use anything from xe_device.h or xe_platform_types.h.
> > Drop the unnecessary includes.  However it does require xe_sriov.h which
> > was being indirectly included; add an explicit include for that.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_i2c.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index befc77e46eae..1e1fb72e49bf 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2025 Intel Corporation.
> >   */
> >  
> > +#include <drm/drm_print.h>
> >  #include <linux/array_size.h>
> >  #include <linux/container_of.h>
> >  #include <linux/device.h>
> > @@ -26,11 +27,10 @@
> >  #include "regs/xe_i2c_regs.h"
> >  #include "regs/xe_irq_regs.h"
> >  
> > -#include "xe_device.h"
> >  #include "xe_device_types.h"
> >  #include "xe_i2c.h"
> >  #include "xe_mmio.h"
> > -#include "xe_platform_types.h"
> > +#include "xe_sriov.h"
> 
> My guess is, with pci.h here you won't even need this. But I could be
> wrong.

In this case we needed xe_sriov.h for the definition of IS_SRIOV_VF()
that's used later in the file.


Matt

> 
> Raag
> 
> >  #include "xe_survivability_mode.h"
> >  
> >  /**
> > -- 
> > 2.52.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
