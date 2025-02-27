Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FECCC197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 21:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A3910E0AB;
	Thu, 27 Feb 2025 21:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpMVXULX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79CC10E0AB
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 21:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740690861; x=1772226861;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ifDArmPV1bfO3uTocc+xo9wLi+wbHhQVy6JspNyhzZ8=;
 b=HpMVXULXSpV5g+usjpLhdS5Tnn4EvH5XixJc319MJKtgWJBvOamED3+j
 7ZDXPCaZX/el4DvNMcAmNgnnvNzMogQwhFvS2UDhG9GJEj/dkPtBxeiLK
 izQ2SHhsJIBxGUoi8IH0cCO9jYHUORVeW0lt8aJ0sQv/sMfo74cirfrNI
 VKtKLC2qmJyxxEDtvNs92X/YsVDELAdKScLi6sCaOwFsmNr3/vMLPvg6n
 Wwv97abA36ZSU7WjhemXWr57ITgSW16SDc3Cm8KYkuxzGqndKhAigL4DW
 LEf0FGp+KcS1P8ja4BplG8tKHLWpmhpVEvx3v8KoW/SE666ew9GvT2nf2 g==;
X-CSE-ConnectionGUID: ZwUo0e72S1WQ6S3UmdhFgw==
X-CSE-MsgGUID: oDO8kiatQAywWZtwsNpwIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45252285"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="45252285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 13:14:18 -0800
X-CSE-ConnectionGUID: oj4oz1wSTAeyuomV1BSYsw==
X-CSE-MsgGUID: ecJtys7FS2iHGYouCFfDgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="122091975"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 13:14:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 13:14:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 13:14:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 13:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7afzj2SPQ+VfP0prSewuLxC+9KGg7/cTJbmsaqw5236Y+2ibqv4pkF00zDN1pTiuRxjD9h5FEoP4pi+kLVc5vUgA8wc1wBsm6GdRTblTGQlfi33vNdH5t5MNtaEE7NhFyjaYNl4euSd0HpQNPjjpP9pI8ASFphYSX1HSFB+crgZfZ5A+5gyZIWSODKxQf1/Mw8XhDWmS04PM5TYWDfA+ZO6pFKjGlifatmVreJAvLhCNLTUfFI1oHQy/JnhkM8ZaKv0GR5UrvysOMJf7Nbr5+Xv37Amha7vwpGXtenLdbIE9bb/41aNLyByTxAKGn5wv6iw4ghY5CDJe0kXb5o9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CSX/61CbvXcLKjTCPKfhdawf7rZM4M+DPY2a3Z0+C8=;
 b=w8MrY4gxnG0QrW+ZzFcKxL29vWMmeih2sXlL1+ase0YVy1SkGFKhvKNj49+frROtXxRzj6pIcrNT0p9Q2fkEfGzKRvqVt3gg6zo/PolL1DOvuaylVdX+C1UjQ1vyaKiDrLjc2LGUJJbbKRtaH1aQK1coz18+uMgCSu0aOi68NHnEPz4VcDao7WjIOvMxK5r1Dq0g/yAnM1QmjPpSDQM6hHHTjARKmzJPgRAlEn768L6CAOg7O1iFk3q4VoFAbn9feVkC8TQQL7tZznTCLtVGSMcvBxvSLcydaAj4cGY7Ld/QYS/rOyWLIRej7wOHIUim+29mBDQRVUcNF4zRUxG9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 21:13:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 21:13:47 +0000
Date: Thu, 27 Feb 2025 15:13:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/xelp: Add Wa_1604555607
Message-ID: <gmruxd3rho45hymzrgljyvn2cpsq5spyochk77tb2o3xxwlz3k@naruv545gzth>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250227101304.46660-4-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7ab968-1cad-4d4f-3883-08dd5773a00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wF9B7AQ9wtlUPSQFQIsK1Ge//T/CEhGKJR7AMBmb1SGnGkosy2DtdNHPq9qj?=
 =?us-ascii?Q?E0HpwFOXUuHxRt79DMvhBcQ5zFAhy8aNQpHi5tYPc+tErqdOoBNDUHlP/W6k?=
 =?us-ascii?Q?lfLAyVdbIDhM/nYFaRdZxf8Tq4zSkk9204gQOUzP64/4cBpruILpDVnyQDwO?=
 =?us-ascii?Q?1XO0k2H3pjue/TbUrNRLwo2cMsHhSA2DRvacoxlXX1pqkLoxKqLAXCpLE2FT?=
 =?us-ascii?Q?5YN796v1CZ94iu5W1ZE+8hF49dUSGPVsp7sK/lyF5udxV/RLlM02MJPHO0ht?=
 =?us-ascii?Q?p+J6mFnPOowyiHqAtIKZZErYUTCR2lKzgkKIqqFMzaduM3wO/KghaLYJOVij?=
 =?us-ascii?Q?Sxgdt3VlifJ9APSid+lwu2/gG2fpaT/G+tkCGDUJ17hU2gngG+3wUV7g5JAS?=
 =?us-ascii?Q?b3raRmxfnXSFxXd0VG7pFcHwgb8DD4d30C3kNBQ19At6CQMb1ydlzbwRnCcG?=
 =?us-ascii?Q?c02219ADztajjI87P3coeEnFDcB42V42fOOC5EJkqeU1PQWMjfxI8qSSLNpV?=
 =?us-ascii?Q?JbyxdE9ZlWmI8BAMkCaq5898wlWUAU3MC+hN7t3YK8T7ED/at6u98s5ARbSj?=
 =?us-ascii?Q?FX3AajNKdo1sHxwPSBFMXzsh+CIoO+Ae8cDB/6faF3KsW2GDLCXBrAyMDS11?=
 =?us-ascii?Q?rsJ/OlfHY001SeLRvebUc7WBdNmle6pKtut1IqRxn1d6c+p2HELi9T48k4yg?=
 =?us-ascii?Q?foAWMaQ3M/z6Evfi+7r6QASpOOLFYNWAetP7heKdxAUtKuWPx+MFFxYGB9LX?=
 =?us-ascii?Q?WC0kmRL6pazG0y1nYt3fovz7tiuwJ29ujC0y7+Pbh/SWrx7Qi7/B8Z0P/hNJ?=
 =?us-ascii?Q?mkLR3huO6qz8wAIEcUKkDDb7x26vNEiM5ju+5/dllhECXBYZDUeZWNN9saV6?=
 =?us-ascii?Q?3DfTXz43VLZ+mJgzrUpY6Y6QZZdnRbh+c+ObS+JGy2WlxsW9mVIX+TdUOpF2?=
 =?us-ascii?Q?cIXe509WyQdxQmGuf3olvSxVdzKhsEPnNfXLPNRA7VP2MiPX696BZ/VWwd8X?=
 =?us-ascii?Q?R0whfD0tpphp0TT1WefLAy3kuZ9DDhnSdZTG3Bca5oMKLYa9qeVmo2BPcMxp?=
 =?us-ascii?Q?Or6+luRghFDO0vJLTQOJUPFY6AebldR/7NkIeJySl9WSCHrUQfyr7zHfCA7J?=
 =?us-ascii?Q?KjgtBdA0bE7Uzdb+ja5kTRU2fAypEhTcj3eZf/jPNYyCJpW+p/bEUeuR8jW0?=
 =?us-ascii?Q?o99+6RJC+YySlcjEtWc122+Y6kiCH/yVE4MYe31NP/OFtuuXv4keA0zxV+PL?=
 =?us-ascii?Q?dECEZ5ba5dV/Od8v45nb8vyPOcZNZJ5vU2/kabF1WDEqX1jYoNIdX1oCZBS4?=
 =?us-ascii?Q?SYYZiGKLIRWAUezsXo0ods7dhmd4+rn+P/o1jCVWNN+Ttgb4ozILPucfic6C?=
 =?us-ascii?Q?2gEqhrDisZH36Q1yr1eYSgFfdoW8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?peDJMQFKIERciGP6+eDi9TtnbmRHmN61L82zhKFmddXtj896RkXCOtGY+dfO?=
 =?us-ascii?Q?VsyditoiB5Ee1vfJcFVnST0kRpjxa/xDHgGnWGiPyG5o2lJhw3j6JtqeorvD?=
 =?us-ascii?Q?LevP91HO7L8bjjFx/X06HQCh5gfin3Jx+S8JqMzMl+Ugo6nJTASMW0qdlJ5v?=
 =?us-ascii?Q?Y6Giq+X7Vjgj1RHONeIj/K7o8N7VMEjXUqd5qmG7FfKlubnKXiL/JAsYF4mh?=
 =?us-ascii?Q?00Kf5QUAmCEEs22iuqLwZCGplrx3A8pLkRcM3NP3zXRZrzDroKWUu54gm5yK?=
 =?us-ascii?Q?SYL6Z3ftbLfh1lSnIuwG9VtCI3cqAKG2JRB/yCEqZEajBDjELkb1xku2ZMFw?=
 =?us-ascii?Q?HH4h/5BjSfVQ7zxYz0P8nhIiICyO9V3QurO1p7w/BsoqRyIO6yV0CVWTV7dJ?=
 =?us-ascii?Q?nqb3x5Hxu/wmSu66EaZm5bP5oQfjwFFpweMLhmhbknee4Xb2ee9U+CMEluIF?=
 =?us-ascii?Q?xZ7AGsTaJiBXHXO3a0Rc7Fu7n0SkZ2jQn4mt0i8ft+lTeTaDsGxF92QLThvh?=
 =?us-ascii?Q?wWZJF02RUc2fl/BFNm4Qvk1tssXVnbguEV+14xoLOxMgsEQS5fk2eBPF4j1t?=
 =?us-ascii?Q?w5Y88HwhRIX4tHbXJNuDf4Fh45ZBr0bLxhzsxkgGuyUL4ATKuj4eXvhBY1Lp?=
 =?us-ascii?Q?ZUMeNrWqr8Iuq9Zpl5EJmr7YS94DE8FEConNLyKQJhowkwjzKflyEKEYzHM3?=
 =?us-ascii?Q?CFX33pOSsIraiVkthiG0nO4ufmdeCBH9GEXGs4mBLFG3pzgUsBNsy3caZCbl?=
 =?us-ascii?Q?HwywXAQoj7kBZWC2IcciYDk0XLv5xJEQb6FdZdvlOqxl9U49BJcfk4dfvCx2?=
 =?us-ascii?Q?yWqtvnSnX9GDCl2porHLq2z8zCgV7OuPpSQQLeX4MRG+M8TLiVuaNnLSrj6x?=
 =?us-ascii?Q?6Bv9e0P/HXTg3hQSRrc2UbU4cGSm+vcmSIRbjvshWgmeQZN0QBMESE4+cf69?=
 =?us-ascii?Q?vZOok79969LU0Wgzla4voQdaUgRKU1QFEh7CFYdVm6C86wjGshCytvwdpkEa?=
 =?us-ascii?Q?lcBfsdTIIwBi1k0bPXcSqYX1LEvF5DKn8pcED8FMqcTyvnE/0P4hEBJQIvt7?=
 =?us-ascii?Q?rD2WjAuDhlk1DOvCveIKOWNOd5KjhThA9wrhKSpgCFruQvQPLD5l5eGCldrJ?=
 =?us-ascii?Q?rh6mWBdcbKEHcJA93JCIJsr5dsH6a+L8NepaRhP6MvnW9OR+gLdjO78OeDPf?=
 =?us-ascii?Q?dqDXEtWsHVcAIj8XI9vs68VkFPR5MW6cwXX38KxeiANzEzMNBfOqlmpYQVWl?=
 =?us-ascii?Q?Fg6tucRy0xGBRxXleGxRxoXlhdTgFhB7rnw7vQD6aOUQTpPnDxpxBC6s7c2F?=
 =?us-ascii?Q?H51BSsvJVaiGn56+ZRmINjj8Lz/YMOADFv4+Ac69L5DSto+AwytNf8MnhetV?=
 =?us-ascii?Q?tYf0HVheAXL98tRI+T7ufdgj35ixWtMyNjYhpVAxMKIwELWbUxnNcAKiJPdI?=
 =?us-ascii?Q?pIIx1pMh8nUR4gr1xfB9jF3ECMQ4SDFyZmsaaC5r3TlBaQjO5AlqixMzULvc?=
 =?us-ascii?Q?0yXDyHyHGFzpHLuQSEaVgQTrWFYEiHmRdm22KVgvp2ahQmDn146kAMW6QWVY?=
 =?us-ascii?Q?+Wimziz6OGzuCzzmjps6OZEKybo0bDMwn5OsFamJ+xP1/DURRB6ycHIv99zZ?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7ab968-1cad-4d4f-3883-08dd5773a00e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 21:13:47.7246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvnS6OZFTyKj+xSrZuUjSKHjFK3lcVTclp/XWtYXT2RWKLke0AqK9/B/6R6LpfpuXxil3bCL4H4sSPH1uHutsXIddgW/sDYWgjNGwuNfxlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
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

On Thu, Feb 27, 2025 at 10:13:02AM +0000, Tvrtko Ursulin wrote:
>According to the i915 code base and as confirmed in the workaround
>database, apart from setting the GS timer, all XeLP platforms should also
>set the TDS timer.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>References: 2b5298b0aa09 ("drm/i915/gen12: Add recommended hardware tuning value")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index e446bde3a52b..398bfd0984c2 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -631,6 +631,13 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> 						FF_MODE2_GS_TIMER_MASK,
> 						FF_MODE2_GS_TIMER_224))
> 	},
>+	{ XE_RTP_NAME("1604555607"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>+	  /* read verification is ignored due to 1608008084. */
>+	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>+						FF_MODE2_TDS_TIMER_MASK,
>+						FF_MODE2_TDS_TIMER_128))
>+	},
> 	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
>-- 
>2.48.0
>
