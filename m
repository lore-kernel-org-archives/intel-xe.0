Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45593C5CFF1
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 23:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F316610E0A3;
	Fri, 20 Feb 2026 23:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qgr3Wg1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445FC10E0A3
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 23:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771629087; x=1803165087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9wMympd7GlWhsqHHufNVe2WzdvjEpeNbxnNxVN4qDEw=;
 b=Qgr3Wg1r4SmoYc/qahbvbvyuTrEHS3THn+55NyMCZpK1vkURtNYYBiw1
 LD7GTA/hNKglcA2+R2PfzOD6oLXF9lLwJ2reMEgVqRAw31HAVRWKbFYEh
 J3q6JDZW2OirJPtgRPZ0uMVDymZo2msbrp82GsotbdCxeuBVLppZ6zvfg
 VIS58AZcdDAqjPVWprNcnkfJvw47BpXZIJa8Bo3MrtyYbv2kWb7FUHqWQ
 t8hpyeBKM7Ggy22FyJyFpbMAm00UD6COBFO/dx/UJ0HKZKJO9C/SLU9pD
 HDe9qdfz5xifre+1EVCYCq9SvOVPsIExwmHpbLVlupH+uKhiWfc87UPd1 w==;
X-CSE-ConnectionGUID: ndcAs7uxRJOIK3S1l+o2vg==
X-CSE-MsgGUID: M68ugESjSC+HiXjGZuhDiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72901887"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72901887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:11:27 -0800
X-CSE-ConnectionGUID: EnUlcwxwQbe4K+x7U9eJkQ==
X-CSE-MsgGUID: UWGzIa2BTreMW/QSkoofJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="219519722"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:11:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:11:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 15:11:26 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:11:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6hHRBTjKIz9vH6PLMb46tIhiC7lZAfgQIeibghwOxBc6YOGJp3UzHFAZsUBcxHzx6B2CByrD8L8mEEgAa3W2NL5WgDh7S4l74f4OPXj+DKfiiiyauFaRYrjEMtK7Iiim77/TKhGQWJ04MCuQnv9O01Lq/5pOk9CUS53GyFt9NY1EVL7/d0hMDExeBSOQyQi9shms8plW0lgpiDk7YE9UbfCsBYoXCRyjdNy3k/yj0MRwZio1uOSgycwwpxCCtRRIYBFQNqbru5K/3B4LMYruQOfNOj1EYTQrz1mCgMR7WmWBHJyEfZme1qn3jYytMD7Qw77OChEm+d2HphQo6wy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k15dQDUngJpTQcC8VInoqMsGWYskHdW1mb7WyIqwuZQ=;
 b=WyClmaKEW51EUVEZr1Xa9tw9ZkoN5Sa1jiaTxpZ5zFfbW/qBp7yDHuxCJnY8AvOJsd0+5DcVIbaOGR/2PLZYKyEBJOk5vqz9+S5IxzSZRpOR7O5MlbrEGvlT3bcrTTITDlCi0jOZ0NQDsP53QSGKgovsemh4lXrGZGr99qS5v/109ZeHnSF1hgEyRkGzt0fmnOff4w5TbwXYQyq5Y1W6HfUlIPKUgHvVZIeMwk3/HYAaLvcJZE1b6ScIlehvtYyKV/z5D4MYESJ4g/giaS4NHRgtcgFA8w9ahnwJlOFdCOVWsHRt+9AnBkuVl8Xu3DICLSsSPhQUIjUQCigueVwQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 23:11:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 23:11:17 +0000
Date: Fri, 20 Feb 2026 15:11:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pf: Don't force 2MB VRAM alignment
Message-ID: <aZjqE1O1uB42ivim@lstrano-desk.jf.intel.com>
References: <20260220201857.6113-1-michal.wajdeczko@intel.com>
 <20260220201857.6113-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260220201857.6113-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:303:b5::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: d90b1243-6b84-4812-74c8-08de70d55a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O9zgRjLhjlaWzrR3zIPoTgs/aCla+5GdjZmXYC+vMVy7fERPjrbdBzZjwCd2?=
 =?us-ascii?Q?l0CUeGnVL4rTfnG036I7KG1rQsTDOVaOboc/MM3Rpwa6IkIQ4lY7xaHVF7VG?=
 =?us-ascii?Q?rLeUFOvdp1av9Hnz4lTaH0xb51gg7dUtLQPtWjrq2oxLiD2YcryOyqmyBkdJ?=
 =?us-ascii?Q?zImtex/zi6EkzV/s/pK3a1wuwviKEAw5Yv7xv1+i8GoWBgnFTnKXBhGoy1Sg?=
 =?us-ascii?Q?zBk2xLWO+vbW1Oz58YroiuOF8EaEKtdN6HaQ6Vio2IMPQIBBqHgxnGl4TLqd?=
 =?us-ascii?Q?IePQNEoeh5q6vXR0VTME9NFNcgxFqlVcOzCXCznjJ6wSdQxFFDrHErOklFI9?=
 =?us-ascii?Q?Cnv8pJLsISxU3kSd803wLZ/zkX33nK/07OLC/uY3PzHoZTn2Q+4r/+P9pii4?=
 =?us-ascii?Q?MMd9KulcHPqym0VzbMpKwJSMqRwn7ciXRCoPFlCekTIckZRJqOjgcue50kAX?=
 =?us-ascii?Q?dAf3v8kCu3AcTmbrCmmVksAm+NsE4kdqB/BjOCqVftS0rjCJ0APEEXvt6H2C?=
 =?us-ascii?Q?THdGOWVDm4wY6if8izbTnJj37Z+Ya3KEsF1hjSiLqsKd9NJUgWJv6kGNXe9d?=
 =?us-ascii?Q?373KX3vY8WS7NEVwZWLeME9E98mYBEzMHl2KWEgXBnsFFCRfkNrKW0Tv08HJ?=
 =?us-ascii?Q?7nciS9QcsvjZ0GBGnz7DDbOwTNErO5wxbGG7m8e9pzdbJoBPCnzZ69qLgHmc?=
 =?us-ascii?Q?6X9YrYxyFzSscUPtWrkqYoAIVB1pkx/JuL2y6H6ci8jwHrkO5iyrpjpso7AR?=
 =?us-ascii?Q?7bGYU8F2DTZWk0ot+bMqBlVpb5qbdI6h+7+OMlniJ4PL5jlynsh2KQZBrLX2?=
 =?us-ascii?Q?Q9nVjcVRxNaG1KaXlFCzBWId5BPjOciY3rsWeYTVVB4fTxuO9ZlHeJRtmTWV?=
 =?us-ascii?Q?ccnOvlsIlAU9Kzs7S3DeJW9lol+7PSRE6F5sFuveAmOjA81X9vG0cWF/kU05?=
 =?us-ascii?Q?mCKCnpnqOWX1B9P6nTW7AnLNATyCwDfkwildCtF1E45P3Gb5/YaP+JTk5FEZ?=
 =?us-ascii?Q?YK5nal6jxR20HYaxycCMnaTEhPCUHJeMeU5246OBs3i2WpfIE/3OQUkPrqiQ?=
 =?us-ascii?Q?qph/tqnlQAY4z2nhfdSiXncKYHj+1c48ktnobOjd3Wlmif+8nH4NL80ip/m0?=
 =?us-ascii?Q?MmuNtERLijcFH9x+XrNibCdOtqGnp6TKPUs7lU8lr3S7Ic14hh6q48nS9So4?=
 =?us-ascii?Q?kcUY8bzxK1T4jwkALPRm2ESVQwN5x/0v11jASxrvLZW3U1MW1+vwmiCdP599?=
 =?us-ascii?Q?zM+/yFnIWGNO3vRHje5tNFsBIfNFcsl8OQ2s0ero10hVmiNqIiyj3YB/xofo?=
 =?us-ascii?Q?YlyJmo2fni+hbQlxA2ZoN+j8ssgnD/TLrm8846fBNH+0CtCCd8h11yZIr6rW?=
 =?us-ascii?Q?U/lC2VoLWosmMFSzp7zoZBw2AjNb1ZzcyxhGidrvUCMF+ReZg5L7ufLC4dwC?=
 =?us-ascii?Q?WuaACWmW+4fmKt6OE5qfJ5XtmxbcWZtUrQlpP0royIVtmj9wvSb4RSej/wai?=
 =?us-ascii?Q?PJnNZ51gtR6hK9OJzxYGKsFPelG0vHcJz8N3b4OeKm9b48TIo8wccLqr6Smt?=
 =?us-ascii?Q?w7Qw09uO3RLGgYnmjBc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xvWFifdilwHVJmyQbJrQUQcQw0j5KD/8qHo5KFriVCDMB6Mc5DsHj2vtmCBG?=
 =?us-ascii?Q?JZFRzy2AEjHw9tZb0MN3WuOLTOOTlvo1VNTmO1B90USAHVoGyc0kA3GHkAqE?=
 =?us-ascii?Q?vQQnwzV43dxrEK2JLWqEVkWdGyyGdXURJ0WBnF+f3FZEcOfTA39Hb9DAh9T/?=
 =?us-ascii?Q?JkYnK8vx1FHjXz3Hyd57BWkLg5gt//JhUEH7mlG3hMp3peiPebRB2as1kI7u?=
 =?us-ascii?Q?CRGKUX7TPUGbFtVu61uXVTw+1D5hS+/g+JvmGaY91vzxJ0evraMDsXe6ta9u?=
 =?us-ascii?Q?b+j6BS2R6ao8xA3xaUnOcZ0Fjk0J9Kz0Rj6hGFkd+YsqLuWBaYnck4zM0HvF?=
 =?us-ascii?Q?SueNO3CsReWPTSELTaj9Qmy3SM6+kI3OxdX34gzqHQzQxwzWxmb5u42Lk70T?=
 =?us-ascii?Q?Q9Bdu0POi/x2ZFjP5mUZWin35qRXkhlCilTvMJuoM8AROrGUJrOKx21tuzHm?=
 =?us-ascii?Q?KtvpboCnDq255C8nXLEJdl5A/YOOQuYZQSBFcjVpbsc5JBUgieMG6oNtnkRj?=
 =?us-ascii?Q?y2T7hpD85q1qRcakZz8W/Gy6DBfTF8fskyM0l8uY1dbinyW/2NOXclIBNC0I?=
 =?us-ascii?Q?U2jnuBVfcMY7adSHyptlGAvvxGnHv+gsPo9/Oy5wIbuKP5y3nZDXQwBnOfDH?=
 =?us-ascii?Q?oBKsqobh3vuKLFs27wFZ7HcULA39DcXd1ZdGuQrMSL9fU0TWeM3inG4K5tsc?=
 =?us-ascii?Q?GnrIpDdxHQKwiooL9/xvkzy4msw4eAMfRxXRuzDcWrEMx9GyOYyimo9IPSzG?=
 =?us-ascii?Q?wsc/iNGEC+11uYgQpM6nB1IA/kM6viV/F598oPXzkzsIi49Ng0aWZNpo/Nck?=
 =?us-ascii?Q?58pg3UR1yXkYufnShVnSNdHCMpcgm0tvSh+b3RTddv1ZN+q3WjYwYc7nSB43?=
 =?us-ascii?Q?QgEmhMVuvEIncKQZjC5+w4nNEkY5el07xjQTZy48HvcxsYXA4YxJZ6IZH1td?=
 =?us-ascii?Q?AqBmX/Xh/31n80Kh40N4KVqOa+LtlpIJ4J+0ftkSkMEE6Uxu5yMUPtgnEQf6?=
 =?us-ascii?Q?Ffe419ovKXC0azyezmQNrjzCJtxOByIJrt8Zha7mbBRFCRqG3khaEeJ3yc/F?=
 =?us-ascii?Q?UeYdcB8kMQvbHgVP/Ut3qWPWuv53qITFT3dD3b8OA/EZFkcHhQ97M99fEzU1?=
 =?us-ascii?Q?w6JfR5Fz4dJldH5thkjBh039Cdfi32hgcxVPRJoix6s/N02pBFydMfvyLBU2?=
 =?us-ascii?Q?BNf0Bqysr/x23Xo+Nzex84YQ8MaHaSJfKep1Fcy/NlagwZiLXV6gV9XhPgbT?=
 =?us-ascii?Q?dtXHiKAWaHoNysMFjrzk7EcSNBxvQnW3lz3KTaVXYmXli+dQC3MXuqtQGstu?=
 =?us-ascii?Q?dZFcPCfHjalZNauEl82Nkzzwex8ATXRcgZdIjPoagVDjDWbzTu+XQmvSiGpk?=
 =?us-ascii?Q?R6a6lPDCfxZYPocvlaFj7Ajm6Ld1vG4z9Wkir09D7y/vQgFVPkh/XTaWPsWk?=
 =?us-ascii?Q?cCYWbS0JIAUuwrrKCoeuLta2hL5Q/y9NCaQuHoh4kFMZ7a2VAtkj4W3hQn8Y?=
 =?us-ascii?Q?zvBoX1BEnPnTbRxjVq6MtgVfsqKeFbfvd98hx9hMbcddh/NmFVz3OFpYRAMo?=
 =?us-ascii?Q?sPFV+H6Snq37GJuRzlN8xlFwfBLmf76tfhP1M/OgJNfdj67OYUzWrMlftH3w?=
 =?us-ascii?Q?uN9t0uzQSurZ85cV8fT5Wlw6Dylp7j32f1DQP43NchyPAErXoPHBtvjk9ztJ?=
 =?us-ascii?Q?IA+ga3crrv1NNhauqsbP9unFsOXb9doRu4zlPbhcjtrkPh0ZoDkL1jKZQKT6?=
 =?us-ascii?Q?ZsRIXAM6pMgCxb8OHwny4sJJpwOLy/8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d90b1243-6b84-4812-74c8-08de70d55a32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:11:17.8116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: echvulAX1IcifVrwqfAb5snEoY2GcloDNj7UW7cxfezgC458snjTySlcPhWvs/ISYA+ZzoH0m2A4+NgsRTa3ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
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

On Fri, Feb 20, 2026 at 09:18:55PM +0100, Michal Wajdeczko wrote:
> There is no need to always request VRAM BO to have 2MB alignment
> as for now this is required by the LMTT only, which could be not
> present on some platforms with VRAM.
> 

Nit: This patch should be the 2nd patch in the series.

Otherwise LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 3ae83cffe925..b867203b4997 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1627,13 +1627,15 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> +	u64 alignment;
>  	int err;
>  
>  	xe_gt_assert(gt, vfid);
>  	xe_gt_assert(gt, IS_DGFX(xe));
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
> -	size = round_up(size, pf_get_lmem_alignment(gt));
> +	alignment = pf_get_lmem_alignment(gt);
> +	size = round_up(size, alignment);
>  
>  	if (config->lmem_obj) {
>  		err = pf_distribute_config_lmem(gt, vfid, 0);
> @@ -1649,12 +1651,12 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	if (!size)
>  		return 0;
>  
> -	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
> +	xe_gt_assert(gt, alignment == XE_PAGE_SIZE || alignment == SZ_2M);
>  	bo = xe_bo_create_pin_range_novm(xe, tile,
>  					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
>  					 ttm_bo_type_kernel,
>  					 XE_BO_FLAG_VRAM(tile->mem.vram) |
> -					 XE_BO_FLAG_NEEDS_2M |
> +					 (alignment == SZ_2M ? XE_BO_FLAG_NEEDS_2M : 0) |
>  					 XE_BO_FLAG_PINNED |
>  					 XE_BO_FLAG_PINNED_LATE_RESTORE |
>  					 XE_BO_FLAG_FORCE_USER_VRAM);
> -- 
> 2.47.1
> 
