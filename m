Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E34EE6B46
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866F288784;
	Fri,  6 Feb 2026 18:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHdUKhnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3169B88784
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 18:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770401527; x=1801937527;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/JZcJjlOzT3TGt3ZmyeWkzAHg2IvlnPNwYmgllk6OCg=;
 b=FHdUKhnMXhaVf1PepS8Xks+07TwD+QRZUXzKEUfsAzRHHu9QkNe2tFxi
 Qn1DhpTUyBH1chNLpQH75cZbh55wcsmln1+AQcrdzlsrvaSLt4pQF23Gh
 e/F7pM5aX2uhJ/PyLMn7HX5v9TuH8/vVEdp/OSlIq6XFIKeww6Glo/ks8
 Zw3qvhcZzseBETq4QJ5woQ0xzQfOz6R037PZzsDt8jI2F1CEcqJS+EfGb
 RPDFu3fCoMxhGfMPD4CjT3QZvT20q4z3cf3gosbJbEtf/F7EKbCNwagzR
 I8rzJsFKeUYhfn2wpIKV2Tc1PgVY+M5PRv+wyQ2k3fQ/tYvlY1huxc9Cj Q==;
X-CSE-ConnectionGUID: ceA3gxsfTe2oAdiyenuXUg==
X-CSE-MsgGUID: c6XMxOC7T4Sj/wRy53qbHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70628386"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70628386"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:12:07 -0800
X-CSE-ConnectionGUID: CIgxHtuNRNi8sK1FHAA48Q==
X-CSE-MsgGUID: 3Q5QVQPRRRu2OcAIoG+m7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210981191"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:12:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 10:12:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 10:12:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 10:12:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvP3Ev5YvgH5mv8zYu+NNGZEIBcggkJ6DzvJxwrI/VCOG4cEdiJ8+/JSubGeTT74Wrqurp+iZ9QKS7YURAJx5dwJiofmk978kaQx5fZbnTgfZomcRWZdHJuS4cSM4Sm8+SPPOrbhn814VWlo29Ujosn+rXwGYgKRLLxyIQIFk8Be7g8NsAXTbtcPJsZKOnQm2mkSLJz7LM3zV+baHGZRKjA/M6fiSwIbFgzdy1XEdqjKilt1zhSQATSXhNDmkUVXUC90eBFFM9CiX4H4QzzYo++u/G3q0iiCypqB7lA3FTPUVwwTsX0IwTfmsc3664VV7pZmO9ivdNjCeP6R0S+8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxZxIsJiLr831r2zNiekrqrqFblQ2Z2GE7aqpy5r7lw=;
 b=Vb60zlIc48TAhVXHX7ijhrjRx6SXAh2Mz1R+HzeXu3/WpCnBI2GjqTZJ7vPxzrjCuv7jvWMfDz4qWHUDFEHPySSKm+eOffOaVFg39Ce63v0zpB1u5gqAj7f/G7hSS3EsVO1uN7sVTiqNquMHI5Iug+YvHD6UoT/tXYt8PAcOj1kRGrlI4QmbqiktLnaVd6WJkwBD4cYLjwelRoDeYVy7cmZQ8QxMlqX+JK0U/4bXkGTg0Uzm1RdNIr3XKc1BXQFvhbFfPOfINGY1eHZXyJsWi9b+ggvvv+lNmq9mhoXL0n7VMWRu2RXTkwgx4hscWp/RhftqXGJsSmHV28JkXuMesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6181.namprd11.prod.outlook.com (2603:10b6:208:3c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 18:12:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:12:02 +0000
Date: Fri, 6 Feb 2026 10:11:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v1 3/4] drm/xe/vf: Wait for default LRCs fixups before
 using
Message-ID: <aYYu7wFpES1UXoWm@lstrano-desk.jf.intel.com>
References: <20260206145334.674679-1-tomasz.lis@intel.com>
 <20260206145334.674679-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206145334.674679-4-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4PR04CA0341.namprd04.prod.outlook.com
 (2603:10b6:303:8a::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fd4988-690e-40f0-b5eb-08de65ab3a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWpoYnBoVXFuZEsvQmJKSnEvSVd3bGdsWGdXS0lqUS9HTUVXRjd1MFFxZVJQ?=
 =?utf-8?B?YkFYNmVIUDFmK1hjVTJnS1VzSjQ4TldJQ2dBRUNGaHFtbjMyRVZHU282RGE1?=
 =?utf-8?B?WUpQRy9nWDJiTWYyTmt1WUVKQ3JLSCtIbVphblZwMzNXRlhQM1ZwU3lONmdi?=
 =?utf-8?B?UVR6YVF1V0pxeHh5QTc1eFEycndsdTB1b2VSZWk5WVF3K3NkcTRRbzJhUnhm?=
 =?utf-8?B?eG9hTVU5bWxucTRtYy9nQTd3My95VEpheVdJYy9SU3U2L0U1UnJPcWNCQVMy?=
 =?utf-8?B?UHYxU1F1TVBtSHA1TzRmRXl5c0dYVVhleCtyZDVVV2p2OU9aenVURXRzZVZH?=
 =?utf-8?B?b2tpd0t4Ynd4RkVVSE5zSitBQm4xcDZoUkNBNDFZZEhNY0xyUjM0MTcxaWNi?=
 =?utf-8?B?M1NsdDJxaDNtdmJJTkVxTlBlN0ZmMTFhT3cyUDh0Yzg4WWNDVVIyQTFGZFQy?=
 =?utf-8?B?NzRFcTBkN3FINk9qdjg4L0ZoeVJpRk4vT0NxOUVyVThxVDZkQnhGUmZONFo2?=
 =?utf-8?B?NisxdHZ2a04wYVpWYnhpRGN2UDVJTkNXblBEZG9uSGJUYkJpOG9DQ2JjSmdt?=
 =?utf-8?B?eDZCRHdhMVhCSzBQNnhHb0YyNTBQZDhuS0VVU1UwcWlyMTZBWjVzUXRSYWxQ?=
 =?utf-8?B?TTUraUdHc3c0Zk42TTlKT3RIUExqRkFCbkdFL1YwcFovRTZuT2p1RS9aKzNJ?=
 =?utf-8?B?N0k0RnltaHltcmFaQmwyQmJMaU1NdFRHY2hINmJhNExUM1BYeER4WFRjcXlF?=
 =?utf-8?B?L0VMekNneGszbnFEZkNLSEJ0SkJHOTh3aWJUQVQwNEZscmpUNWFHZURUOW5p?=
 =?utf-8?B?YzdzZVo1aVJCRHlqS3IxUnV0S0NWenlTdDc4QzBaWmtvWHM2ekJ1UW5sQVUw?=
 =?utf-8?B?OFlVbFpsRHpoVmZ5bVlIcUd3aEhyOWtuTDNWM3dNR3R1bzRuOUIraW01YXNM?=
 =?utf-8?B?Y3I1WWN6N0dJbjNNaXoxRy9rcWwxTEhSOWd4Ky93S1ZvL0VQYTdFN1RhZGJq?=
 =?utf-8?B?eWgvcjZISEpMRVNxcFJ4L2d3MWZ4dnNKQWdCVnkyeU1sR3J1ZUFVVFhEdHJV?=
 =?utf-8?B?SHJIbDRFTVBUczBlYkxwTTRicm9GMzNqV3NBcUJqMFQ2TjIwWDk1VEhubjc0?=
 =?utf-8?B?WU84am4ySlFMRmNaQUd0aVIxRTdzWU1WMkFHdjNXbGtvNWVJVjNoeVR1ODVl?=
 =?utf-8?B?b1NwWEhiY2pjL3paVWt4T1pYWnRFQkp2YUY4cmxtTDN6VHg2M1BRWlowSnFz?=
 =?utf-8?B?QTZ2S20wZkFVNjNqcGVPRmdPcy9UWlNCams4Uk5zcS9NbC9zelppbXJyM3p0?=
 =?utf-8?B?YWN0TTV0OEljS2UwZzloSU9WZ3Q0RjhhbmcxanlaL2hETHBnRjk1NS9aejlp?=
 =?utf-8?B?YWVCbUNUeGVHdk5aTVNFblpia3J4cENHZjI2UWNWV1I3dGRDZ21LbXRMM2gv?=
 =?utf-8?B?WlhVTWNQR2Mxd0d4VHA5QmlPZ3lzUmZlTTM0MndkdUxCdFU5cWNXQjh5R0FK?=
 =?utf-8?B?UW9LNTlZQkhlUmZWNWZacEtSWS9aenV6ZldJTkJleVNjZlVZZ1hmWStnc0Fm?=
 =?utf-8?B?dDZwOHdXMHBOWk9qWnBEUk9JQ0NOWWNTakYrUVZwT3pTVWpTWmlyYytCZHlE?=
 =?utf-8?B?TWFrLzVWZkIwaDZQZ3VJcTJyd3EzZnFGZGNMVWVncnV1TGVXak1NWEMzRkVh?=
 =?utf-8?B?akVCNjJSSmZuNEdwSGlyOUx2aUo2c3orVHNWQ28wZTk5L1lvajNBejY1N3JG?=
 =?utf-8?B?MlV3Y2diSDQzdm5ramQ4U092TTNNQ1dzNEFmK2owN0ppUm5qQ1JLYzhqMVdi?=
 =?utf-8?B?TFlONEpyaWM4VGxDYkpNWmpzUGNoeCt3Q2RPQ0xOcFB2c0VOS2JUYkcwWHEx?=
 =?utf-8?B?ZnhaZkM5V29TU3ZQK0NXU1lEcFZEbjdQMDRmSFNHeVNhblNvME1GZlpHckNm?=
 =?utf-8?B?eWhLZk5UTGt1bm1XVVZ2ZUY2aW1FOWFuSER3Z3BaVnMvTjk4VjFCVnE5WS8x?=
 =?utf-8?B?SytnNEVaV1BpY1BZS2daL2lyL1FGYkR4WFJiTCtiVlpBSDB2Y3pFdmFZTFYz?=
 =?utf-8?B?RFZFRlpOSktrVlgzYlF5c085WXNmMmd0OWREaUFRdEc4RmFsZzZQMERGaG1y?=
 =?utf-8?Q?dhY4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXJTNUF2eUhUQ2Zyc3hoWTBhQzRLOS92Yi9taFh5aEpHS2s5V1RWVVdFeUNM?=
 =?utf-8?B?VWk2QTBSTWtuVVllbnkxRERxU0dQM2Y0M3NWYjF4dFpadS84TmJsNlRPZHdw?=
 =?utf-8?B?UXcvSlpKYlJaQitpSW40a3Z5T2FxU1ZMbE9pdjlpa3FZY01Xb0tuSnM2MHhw?=
 =?utf-8?B?NzI0T25uVnlkUmVKREhoWFBpNlduQ0FPWGhYYzMxTzZNTG1ZVG5YczgyU3c5?=
 =?utf-8?B?M2ZjMzRUcGxXVUZNZXhKdGN4WlBmS0hhaUxMeXlORm1ZOWRGVUI4SkR5eGhy?=
 =?utf-8?B?YzFocmJvMlI2eUZYUy82aVltWEZMTkFzRWNnb0FSSXBZZ21ES0dlYVNSLzlk?=
 =?utf-8?B?M1l4ejhiNjViZnJCU0hGc1VIN3hBbW51QUlUeDFVQ3dFeEtHUzdHTUQrMkQz?=
 =?utf-8?B?YUZqdnJhdGk0clpRRVBHeGl5cUxlczViUVhGL0RaOGNBWHlJTTNzcXNGdmNz?=
 =?utf-8?B?cXRRK1lhWHFWSGw3SGVKTG9JMDBZaytzczJPNFo5NDh0R1NXU2pkNXdxTVlq?=
 =?utf-8?B?SHZWQXpJekZKWXVHeTltc2tzWHRneDlFQURUSk5PNHh5ZjJ0M3AwQjBtYnRm?=
 =?utf-8?B?cjMyUzVYeDFHZzZjWkNyeXlhWW40YWxqT2h4OGViZzduRkF4cCtBL0hFUW0w?=
 =?utf-8?B?RWxjK2FZdHhDQTlFSWR2MjdIUittRGZYSGJhaWh5eGtObmZqeG9lMksyajVj?=
 =?utf-8?B?c2s4MTVqOHJURDdlZUZnMDA1S3ZnWndRQ3V3TkE5RHIvVGx0cHZxMlpNZ0Ju?=
 =?utf-8?B?aUpLUW1BZTZ0UnJhL2RLbSs2eE41cnphM2NaclNMM3R5Wjl4cjNmMGRzYkVn?=
 =?utf-8?B?SXd3NEY1YkdwQVFvSVlPZ0I3NjhQOWpjaEhhRGNPNmJRckgrSHpLZlZuaFMv?=
 =?utf-8?B?MDM4Q1lyM1RhbnBwL0lvQTVpOFRyNys4R1RxREtuVGp0QTdjTlM0RitQZC9h?=
 =?utf-8?B?MktLbE5QbW10U0toSkxHSko5aDV5bVE4anJRdGdzclN3SG0zTmJlZzQwTFcx?=
 =?utf-8?B?eVVBWUhjandiUWxsb09WUTB3bkNOQ3MrcFpYQ3JtTzNuOVQyOHA4bWJyRkVo?=
 =?utf-8?B?RDAyTUdmR2U0akJFdzFOUFppZEM4TWR4b3k5anZ2SEx2MXdKbGcrVE9rL0Ey?=
 =?utf-8?B?VmNQcnlHYU9UWTNpUm8rcTJrL2l2QnNQZEdYZC9BcG9YM1RiNWU4UnVNMVI3?=
 =?utf-8?B?ejZFQmtKc1FXNGJQZkRVTDZEbU5WcStFL0p6czczT1lrN21zWVk0b3hQTzJO?=
 =?utf-8?B?QUlCN21JUml3UlcwUURXYzh4aFU2czNFUk5JWThOMnhGWi9LOVlHbmd0VHh5?=
 =?utf-8?B?TmFXSi9yQXNIRHY3ZVpJR0M0QjJxMWYxY2p4allzVFRKVDNUcldLQmNGUUZo?=
 =?utf-8?B?QlJoaTZGZHMxNkJ5T0VTVWd2WUp4K0ljZ3VBclpSTkxJTXAxYkVQSEUvY1Nl?=
 =?utf-8?B?TXQ0OHA4ak4zVkZJMXErMmxBZUNuVEhUYzROZ1l4MERQZGQvUWN1eXMzVFZ2?=
 =?utf-8?B?eXROblhVL3BiSVMxa3JHWVd3RjlzT1NSU1phaG9hT002OXc4NVBBZjhzcVda?=
 =?utf-8?B?VWVlRDdOVmdEd2VPbmlpelRpTmQ1UjdzaFFyNWZzYkpETFJ2ZXlucWFjanVX?=
 =?utf-8?B?aUtnL2RXZkR2K0k5TDZTZXc1V0cwYmZ0MXBRM3BoOVg1a2pZcUFNdWRnOTAx?=
 =?utf-8?B?YklIY0E1Rzd3WTdRYjE2aXdyYk9OeEJJOTZERVRTRjJnZ0J0SDJ5UXNJM0F1?=
 =?utf-8?B?Sk1pUHJtWWJ0bXdNc0ZEbjJxRGFnVWEveDcyOXF3dVcxNXp5cUxIZnJMWTJ6?=
 =?utf-8?B?VDhIeVZ1ZkdrOGRwMzNTWjZyRGpKMUszWHNiMm5yUWhZNWxMdmdJKy9CSDhl?=
 =?utf-8?B?UFQ3MzBNSW05dmc5WURGUkNXVG1LYjJMYnc3ZHkxRTJuQTYxeEthTVZTLyto?=
 =?utf-8?B?dDlLc1M0a2tjeFZFMHJ6Tnc5Z3AwZUhvK2dLc3U5ZHBuaWtUcDMwUk5YWlhI?=
 =?utf-8?B?VW84Nit5MDlPOUp0c3AxeXRNTXVEbnp2eHczSzJnUHgwaGVOV2diR1ZDOTl1?=
 =?utf-8?B?YmJIK21YcmlPcGY2Qno3N0xtYWVZYzExS01kWEFHQlUxWHFTY01qSkxFQW1U?=
 =?utf-8?B?L2gxZU0wdWpRMHE4dllXRHZ2cEtTdlhBYkRDdHZBNlVDK0Y5Y21HZGxrOW9v?=
 =?utf-8?B?MVVGQ2cxanhCeFFtMzJETFV3VVJPRnpiYXRmZjFBS3lOZllkR1lUb3hpeDR2?=
 =?utf-8?B?ZmY2QlBZbzVGbXVTTEl1RXE4bkFvdnpLd3dxakNkOVlaNXhyRGh3d2hSQ0cx?=
 =?utf-8?B?WGI0dTlORjNWRkUweCtGRnJPQmlSSFJLZGl6enNIUVFhR2NqNmxEUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fd4988-690e-40f0-b5eb-08de65ab3a38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:12:02.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUlRvq0ODQdTppMKwiCkhCvdRw51TnAJwlSy+y+6AvH/2CGffr4/4iSfWkJMOcof0XfkJsrx1q6nQl54DSZkVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6181
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

On Fri, Feb 06, 2026 at 03:53:33PM +0100, Tomasz Lis wrote:
> When a context is being created during save/restore, the LRC creation
> needs to wait for GGTT address space to be shifted. But it also needs
> to have fixed default LRCs. This is mandatory to avoid the situation
> where LRC will be created based on data from before the fixups, but
> reference within exec queue will be set too late for fixups.
> 
> This fixes an issue where contexts created during save/restore have
> a large chance of having one unfixed LRC, due to the xe_lrc_create()
> being synced for equal start to race with default LRC fixups.
> 

This indeed looks like a potential problem.

This whole flow is a bit weak (my fault — I meant to fix this but lost
track of it). Maybe we should make this a bit more robust and ordered by
the GuC backend.

Roughly:

- In guc_exec_queue_unpause_prepare, if at least one job has been
  submitted, we fix the LRCs on the queue. This would happen prior to
  emit_job. I believe the 'at least one job has been submited check' is
  exec_queue_registered.

- In guc_exec_queue_run_job, upon running the first job (hook in
  register_exec_queue) and if VF migration is enabled, we fix the LRC.

What do you think? I believe this would work, provide stronger ordering
guarantees, and let us drop the READ_ONCE/WRITE_ONCE and wait‑queue
semantics, which are questionable at best. We could probably revert the
flipping of q->ops->init and the LRC creation order back to the original
flow as well.

Matt

> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c        |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 24 +++++++++++------------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++--
>  4 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e9396ad3390a..6eb561086e1c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -309,7 +309,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	for (i = 0; i < q->width; ++i) {
>  		struct xe_lrc *lrc;
>  
> -		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> +		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
>  		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>  				    xe_lrc_ring_size(), q->msix_vec, flags);
>  		if (IS_ERR(lrc)) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 30e8c2cf5f09..1edccee84c76 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -529,12 +529,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
>  	}
>  
> -	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> -		smp_wmb();	/* Ensure above write visible before wake */
> -		wake_up_all(&gt->sriov.vf.migration.wq);
> -	}
> -
>  	return 0;
>  }
>  
> @@ -837,6 +831,10 @@ static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>  
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_default_lrc_update_memirq_regs_with_address(hwe);
> +
> +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
> +	smp_wmb();	/* Ensure above write visible before wake */
> +	wake_up_all(&gt->sriov.vf.migration.wq);
>  }
>  
>  static void vf_start_migration_recovery(struct xe_gt *gt)
> @@ -851,7 +849,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  	    !gt->sriov.vf.migration.recovery_teardown) {
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> +		WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, true);
>  		smp_wmb();	/* Ensure above writes visible before wake */
>  
>  		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
> @@ -1296,7 +1294,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  {
>  	spin_lock_irq(&gt->sriov.vf.migration.lock);
>  	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> -	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
>  	wake_up_all(&gt->sriov.vf.migration.wq);
> @@ -1492,7 +1490,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
>  	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>  }
>  
> -static bool vf_valid_ggtt(struct xe_gt *gt)
> +static bool vf_valid_default_lrc(struct xe_gt *gt)
>  {
>  	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
>  	bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
> @@ -1500,17 +1498,17 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> +	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes))
>  		return false;
>  
>  	return true;
>  }
>  
>  /**
> - * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> + * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT refs in default LRCs
>   * @gt: the &xe_gt
>   */
> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt)
>  {
>  	int ret;
>  
> @@ -1519,7 +1517,7 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  		return;
>  
>  	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> -					       vf_valid_ggtt(gt),
> +					       vf_valid_default_lrc(gt),
>  					       HZ * 5);
>  	xe_gt_WARN_ON(gt, !ret);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 7d97189c2d3d..70232dc38f9a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -39,6 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>  
> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 4ef881b9b662..8be181bf3cf3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -73,8 +73,8 @@ struct xe_gt_sriov_vf_migration {
>  	bool recovery_queued;
>  	/** @recovery_inprogress: VF post migration recovery in progress */
>  	bool recovery_inprogress;
> -	/** @ggtt_need_fixes: VF GGTT needs fixes */
> -	bool ggtt_need_fixes;
> +	/** @default_lrcs_need_fixes: GGTT refs within default LRCs need fixes */
> +	bool default_lrcs_need_fixes;
>  };
>  
>  /**
> -- 
> 2.25.1
> 
