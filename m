Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C382C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 23:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69E610E333;
	Wed, 12 Feb 2025 23:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lfp0Lri1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB9F10E333
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 23:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739404530; x=1770940530;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=whq6iYKIgNuOSNpRyqgIwTVR5pqYELaSUKHSBWa4Syw=;
 b=Lfp0Lri1/7fozOWb8paq5nDhRBih89GyUKkAp0WyOxFFKx1eknVB1pgQ
 ndy3iIj06gsKIaG8t6IioVna3EzcSSrEUjGJJGzk/IOYGTmOSvnd+Q6dy
 z2J8klQZa9iJYoxl8BTeazkZq0DinGNmAFKU2GtlxF45/JduUGusH3iJ7
 33lxn7Gguql9/0kyzGuTxfmYMOkDO2TNjkVLs0rMfgc8f0nw03uEoVSSz
 /sW9AZsS9te0uvf9eVBCi0uAlepomsjzRKB54LBqvZtPYUKYODTKejvGq
 4qn+S1kVHnLajXicv1lpi6eQA+Wr6FPgjj7QetuAsd49zLhlrSVCZ8YvE Q==;
X-CSE-ConnectionGUID: X1sb6FrVSJK9DqpX5/kiLQ==
X-CSE-MsgGUID: cM7/VrpKQKGJVH+hJWEo3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39951847"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39951847"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 15:55:30 -0800
X-CSE-ConnectionGUID: AifA4x24QJCUuQL/R2jrpw==
X-CSE-MsgGUID: n0PhR9cERXKv+eVT9QiJmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="113496439"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 15:55:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 15:55:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 15:55:28 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 15:55:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ8XsvlUQgPK2DomHAsHuzWNGfSmRiDu7Uo7hOCLIfjPezx02UgQ63o5uHijoclvAGPppdMNJ0AzaZjOdwCtnNhy7HxkMpcAC0x0PDNR5tVz9K3C3oSorDnou9V3BmDcyBk6BebVuikggXwqkXRKCZ2/l0hdS9gkQgG1J5jzNeq18lpuKRI6ylANGmHrgC+HbbLreUv5lvDRykA8FctrkhSkKbD6+hu1xJRlLKh6bCKn1PBUnKJVUVSctYbA9jWwmeoKVQ5o3lyLDT1Q+ovoUAp0HXsbZc93RAvJ8ftt1sWdAuGVgMHW5TNs4OHyFUCczih+15gGLxUD3f81VGSBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1dDjEJOMzR4NMeXNX+I4uBuCJDiIVze/PEcTpgN4H8=;
 b=Z8VZihLjWuJO6yDI0Z99f15Z2/UbfWxy2OXlGXZZAf9yyzH7ipJqrWe27b1f+2SXU886kh2+44t/aDgk+FqU6Y3sTh1yB7O8uU+Tjy9fB3MuyqcQvDWAQSfhVQ+zKPw2xeaaRrW3VeIKUCPaDCd8BkGrCHgyrqYVwrl21tYoPo8EmrccSGpXptMoFVF9yUAgis1/bSHarufb0BJlZiBN2Im1prfLgwVUH2edPWgHtXSmLqyWZy8tEZEBfTnvgeIE45wTi8okWlXAJVU6ZyK9jeBUdutp5gHMAWgFRhbnqW9h49SBCbh+Pn+KFPOJnFoyLqZyBl/A9GUAotomW4k3Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6285.namprd11.prod.outlook.com (2603:10b6:8:a8::21) by
 DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Wed, 12 Feb 2025 23:54:44 +0000
Received: from DM4PR11MB6285.namprd11.prod.outlook.com
 ([fe80::7686:7c63:ffa8:f4f7]) by DM4PR11MB6285.namprd11.prod.outlook.com
 ([fe80::7686:7c63:ffa8:f4f7%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 23:54:44 +0000
Date: Wed, 12 Feb 2025 15:54:41 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 2/8] drm/xe/uapi: Introduce API for EU stall sampling
Message-ID: <Z600wXtGm8a1bfD2@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
 <36d701413aeb171c86d5dd2ce7272918eb4ab818.1739193510.git.harish.chegondi@intel.com>
 <85h6512ybc.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85h6512ybc.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0320.namprd03.prod.outlook.com
 (2603:10b6:303:dd::25) To DM4PR11MB6285.namprd11.prod.outlook.com
 (2603:10b6:8:a8::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6285:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: c143c5e4-203f-4771-5813-08dd4bc09f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHFwZHJaWktvS0lkUkRSTW5pdGU0WTBVTXdXeXZRZjhSSzIxdmduekhEY0hO?=
 =?utf-8?B?YnhtdFJRK0QyTkNlVVR6RHZ5Rmw2NHZxQzJmalNOTnpsSGJacFQzRmJQMy9h?=
 =?utf-8?B?RHd6VXlqODRCdFU3WkNqSVBJY3p6d0doRjBhaTZ2RVI3b0hNVFA3K3ptKzFu?=
 =?utf-8?B?Sm9udEU5T1BkOW9vWDZpMURBa08xc0FScGw0ZEo4WjlxMnVBSnowQzAyRkoz?=
 =?utf-8?B?ZVByMVErR3ZVU2I1K2EyY1BDamZIV0VJR3VXTHRlNHY3SkVwTWJscGc4bVNS?=
 =?utf-8?B?Q1NjUk5GTnNmb0pyMDdoMkZtYjZ4NmxPM1FBQit3L2YxOE5yY0tVUHBqTE1R?=
 =?utf-8?B?VUQzQkwzMTY5UUVDZEI1OG56NXExV2p0R2pBbExaOXpjc1dqL3VCNEtaNEg3?=
 =?utf-8?B?anB4L0ZtWFlrQ21NZWtKcGY2VzRFV1diOHVvWC9rZExpQmFOaXlCdlJ2Mmg3?=
 =?utf-8?B?TmVlRnhMSUFvdlNqcUdHRzlObjMwQllQNk00NzdxTjFrMzEzRWZKU2lTdEFy?=
 =?utf-8?B?R0FuZCtsb0NqSnRIOWI0VCs1WEpCWXFIdTNkWGRYTmY0bjhoU01FK1htODZh?=
 =?utf-8?B?YjNQT1p0bStwSHVxWlpuNVZSRDFIUENWRVJOcXF0UndBQkRPRVVrSW5LcGta?=
 =?utf-8?B?MDZqbEN6SnNNSVZ4dFdOS3pMMURRdkZLdnh6MWswV0JjQ0lpREdCMlZTaTRk?=
 =?utf-8?B?eUVvWUlUV3pwb0RKOE54Umx0bm9RV0Y2NTJmazU2VDhMYjNNTHZmamFGYTFF?=
 =?utf-8?B?MjdUMEt3MCtmT0h4bnNDcXhHcEFPV0VESmhKb3kxMkREQkZ2Q2ZYZ254SUo1?=
 =?utf-8?B?cHQ5aVNRSmNGdUlXR1dHNFArcXdOMzIxUzdKLzlwNFl3K3pjbWs5Mmxqb1Ax?=
 =?utf-8?B?RThyaXRUUU80ZWlSQU9CbVRCeGVYUWNKajBLS3YyNVN3ejZvS1EvRVExVzRR?=
 =?utf-8?B?TVJZdGFmK1NHMUREcEgzeVVhOG5DMUViWnVwN1RieFh3Q0dmTnZiM29rSWYz?=
 =?utf-8?B?RWhOdEFPeWlsM2xuNTBPVjNjekZHdWZ6TmxzRHhpMFZhUFJGSFora1RiZm9s?=
 =?utf-8?B?SkJhRWd2WU1NWCtvMnJpNi8wdHhGYkF6b2kxeUdueEtacjFsLzlsYXZKaWNS?=
 =?utf-8?B?c21TWTdUanhDa1Nxd1d3dHpRZlg4cGRFelRYSDhNUkdPaGpGYTlrM2VZUEVx?=
 =?utf-8?B?blVOaW9ROHk1QURqY01NSi9xOFFXY3ZySjJGeFcrcG5UZFpRbjVHMllRQ05C?=
 =?utf-8?B?M0poMTMrc0d3L0ZoTTdlTjhrKzRiY1l6VzY2bHdlNVA1YmxxYjBZOVpQdEtE?=
 =?utf-8?B?dkFHWXpRandKZC9CZisxcTVvUVBITmY4N2U5Z2hKdis1UWJYRmZGd2szSjN4?=
 =?utf-8?B?c2s0SzhZVGpCSllhZXhjK2lPbFJ3V3RUeEJCT0Z3UXdPalZneVdjdXVqOUZm?=
 =?utf-8?B?L25IUDN2MDFKRU0wbVJZVWJGb3Y0OWZpb2VMQzNaTldlWE9Eelk4cWZQWS83?=
 =?utf-8?B?MzRwVE85emRQdzZVWW0zL1N0enRRSVhQWkFqT2g3QkhiMVhrQkNTbUx6b1FQ?=
 =?utf-8?B?VU1KT2Jmc1ArS3ZmWForcEFMekk3WGlpdzNnb2JGOElxWm10OVltTFppcnBY?=
 =?utf-8?B?ZzJEUmxRNVNVYkZoUVpSVHNhOWhiQnBoSWZCUzFQcXBvNldTZVdZSzgybDJy?=
 =?utf-8?B?SkRzaGZDei8wZk92STVUMU16MUVDZkhTM0tjSTlpdTF6S1lpR2t1MktncFlz?=
 =?utf-8?B?WEI2akQ0T1FBdDRkSDFSbFVEYzVrbldEY0pPcWJrTUo0SXRuUk1EQzQ0MTRx?=
 =?utf-8?B?ck5KUWtpOFdsUEYvNi9KVk4vc0lZc3huNWJRRWlUdjVueWRXS2Vsa0VuNloz?=
 =?utf-8?Q?f84JWevZO5xHC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6285.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1Y5M1JyVDdRSnVldksyWVEzQ295ZkxOOEVSL1NoUTVFbWp0d01wUTdKcFlH?=
 =?utf-8?B?OThodVQ0anE1UnVSMlp2Mmtyc1Bnd2xBQzMraDNmV21kQUJ3N2g5WjJzV2ZK?=
 =?utf-8?B?TDJKcWhPRnVZdHgrVTJ4MHZSM0QzUUo1cFZJUU5ha21XU3VKS0l2RXg5djQz?=
 =?utf-8?B?NW5odGw0UlZ0aTNNQnNzMkNSRlZFdTdDcEw5ckxVVzVlYzJDQisvK2dWdFZ1?=
 =?utf-8?B?WUp1aFhGbDZHeDQzNnFtQlFiTjhWcTVoTHBpZUEvRTcyaHg5Q2dNS0szTHRH?=
 =?utf-8?B?SENJQmx0S0JPai9hWXVFakYyNWllYzRIWDVZU2pqWEh2UzYrL2M3d0N0Vklj?=
 =?utf-8?B?RmI1akVoaGZJUTBxdW1tTFNBSjY4b3NFUjdpY2NIeE8vME9YNFczSWJqRmhj?=
 =?utf-8?B?QU5vNGxsWHQzd1hQWlo2OEd1T0JHSy9MbGVWbldSR2JHbTkyaGo2M09hQVhF?=
 =?utf-8?B?cG01bFZsNmxMUDVxN3NlalNtcGgvK2RrZ1I1NU9PRmpNbVJoR0JOYnpwRmZK?=
 =?utf-8?B?TmpZUlBpOUxvRXhkSHdIWnJHRytqc2k0NUpLWlNrL3IyUDNqcmRqYWRiY2Rj?=
 =?utf-8?B?VnZXZUllbDZMbVhGaHBjU21hQ0g4LzllZjJpaUcxUHl0ZUx3OTRUVlFWRlRr?=
 =?utf-8?B?QWhabzNEUFUzZE03Tng3a1RleVdOamRxbFdjL1VNT3ZEMlV1Yzlhc1paeThD?=
 =?utf-8?B?WlBLWUZyczlPSWo1NG5ZSCtCQ2VScHlzMWtvMHVCeS9adzFRT0FEUEQ2SDlv?=
 =?utf-8?B?b1d4bC9CUU9ydmFjQjV1ZGhqMWhjRjBRR3hud0xQQkk3V3VsdjMvNUtIZ3Ex?=
 =?utf-8?B?YkUzNFoxMnNFUWxiTldVYlpJWit3Z1BTZlFXRmhReTgrYU5la3J5S016STB5?=
 =?utf-8?B?T29Od3dNRmROcHBFZWpRMWRaOU0rT21oZ1F3YVVSUHBXcGJpbkx2WVhBVUl2?=
 =?utf-8?B?MFlZZExoS1RjbGZ2azJIcmptWmRPQXN3NTdRUW5DenZpN2RPWldPdk52VlNR?=
 =?utf-8?B?TEVxTWMxTVZtTFpmQzE3UFZDbGRaRHcrYkliV3FQZTRYam1zYmJ3VHUrUG85?=
 =?utf-8?B?Z2g1NFhvL2pEQWt4YkRSQ3BiWUZzcWFtWU5LR25wS2ZNelNKRTFLd2FSbkxV?=
 =?utf-8?B?dTBRWlRZN2ZoTFNwUkdwbWcvVkhEOExMbVMrSjh5N3lJYVpwMHQ5eFlmSWZy?=
 =?utf-8?B?UTRFVFUzUHdIdDhYSWk0cHN1ZFBvcXJkREZhejJjLzR4V0JLRnJCSXhSOEla?=
 =?utf-8?B?S3RDUGpySVNienlLTm9TU0QxQ3NrTFJ4S2RXdUR6Q01yTS8wang3VFJFYVZB?=
 =?utf-8?B?UkRsUEQxelpTUnpnWWJKN1dxVGVTV0JCUzl0SmtCQ3BxSFVFOWlmbzVkWWNj?=
 =?utf-8?B?WXU2c3BpZy9nNjFjNjNTeUZjSlJpVlZkN2tWakpYVTc4M251UHJLOGxDNkk4?=
 =?utf-8?B?UmNQOGNBZjluWEZHRUx2R1RRWlRhMHlWVFlMaUtMdzcxLzQzQjN1ZFRWeGh2?=
 =?utf-8?B?K2pQUElQbnB5eHh6VHlDMGhzTm9sUEFwc2MvUEVNTkhGSGo1Wi9hak9hZ1BK?=
 =?utf-8?B?ODlqZUVWMlJzcmNydkdGTVVSbjBabWVBcy9NdkViQU1RMDFXR0hVQUdGK3B5?=
 =?utf-8?B?MitPemxVcnoxOWZ5bkwwQ0EwK0hUcnpwdnFqNjI4SkVRQ2xhSXcvcUFNL256?=
 =?utf-8?B?enU5azlneGxyTkdZcFRhK3Z5dlJqcE44bXhITnNQTUFTL2ZtRlJ5L1ViMEhM?=
 =?utf-8?B?WjhwTCt4a2FSK3BhNkdSdk9SVFJsS2xDMmdtY25KY0ZSZ3o0S2oxMitjcW9F?=
 =?utf-8?B?U1VNS1V6Wk5LMUM0Q04wN2k1TFFSOHorNDlaL09XdGxvNmV0dHZaRzZvSHFU?=
 =?utf-8?B?eHpsU0VvbHY2VEJUTi9XemdRano2c3cwMWx5YUZHYnNvNXcwLytkSHhKMGZt?=
 =?utf-8?B?RjZVQjUrNVM5YzVuUkdreWwrZ0lQSUJINmRxU0ZZWUIzVzg4V010UVNQbGJr?=
 =?utf-8?B?bTh0cytrTVhxZ2MvbVluRFVFS2l0bTdkOTVpLzI4aXNvZ0hNMytRUFgyZDdN?=
 =?utf-8?B?a0UvOUNoYVdCcEh5R2F3NHBmZkd2OU9pc2tmNnYvZzVxYlVuaWFrd0xxcEpL?=
 =?utf-8?B?UlY1RVlGQ2dUd1NwWG9pV0UxTWMyT2NaeHVSc1krSHFrUy80cjdWYmYvQm9v?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c143c5e4-203f-4771-5813-08dd4bc09f73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6285.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 23:54:43.9292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JEmTkAtFj0EEB7LTOZHusy8TfbJEcvP9zpQaYUDLL8CuvUrVt0fNRbl19Oej8o9ooZosYc8NElTVUvMbvMwBEVqViq7M6IQD1CQCPlgHzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
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

On Mon, Feb 10, 2025 at 03:07:51PM -0800, Dixit, Ashutosh wrote:
> On Mon, 10 Feb 2025 05:46:43 -0800, Harish Chegondi wrote:
> >
> 
Hi Ashutosh,
> Hi Harish,
> 
> > A new hardware feature first introduced in PVC gives capability to
> > periodically sample EU stall state and record counts for different stall
> > reasons, on a per IP basis, aggregate across all EUs in a subslice and
> > record the samples in a buffer in each subslice. Eventually, the aggregated
> > data is written out to a buffer in the memory. This feature is also
> > supported in XE2 and later architecture GPUs.
> >
> > Use an existing IOCTL - DRM_IOCTL_XE_OBSERVATION as the interface into the
> > driver from the user space to do initial setup and obtain a file descriptor
> > for the EU stall data stream.  Input parameter to the IOCTL is a struct
> > drm_xe_observation_param in which observation_type should be set to
> > DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
> > DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
> > drm_xe_ext_set_property structures in which each structure has a pair of
> > property and value. The EU stall sampling input properties are defined in
> > drm_xe_eu_stall_property_id enum.
> >
> > With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
> > can enable and disable EU stall sampling with the IOCTLs:
> > DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
> > User space can also call poll() to check for availability of data in the
> > buffer. The data can be read with read(). Finally, the file descriptor
> > can be closed with close().
> >
> > v9: Changed some u32 to unsigned int.
> >     Moved some code around as per review feedback from v8.
> > v8: Used div_u64 instead of / to fix 32-bit build issue.
> >     Changed copyright year in xe_eu_stall.c/h to 2025.
> > v7: Renamed input property DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT
> >     to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS to be consistent with
> >     OA. Renamed the corresponding internal variables.
> >     Fixed some commit messages based on review feedback.
> > v6: Change the input sampling rate to GPU cycles instead of
> >     GPU cycles multiplier.
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile         |   1 +
> >  drivers/gpu/drm/xe/xe_eu_stall.c    | 280 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_eu_stall.h    |  16 ++
> >  drivers/gpu/drm/xe/xe_observation.c |  14 ++
> >  include/uapi/drm/xe_drm.h           |  38 ++++
> >  5 files changed, 349 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index be73362ef334..05bcb9941c38 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
> >	xe_device_sysfs.o \
> >	xe_dma_buf.o \
> >	xe_drm_client.o \
> > +	xe_eu_stall.o \
> >	xe_exec.o \
> >	xe_exec_queue.o \
> >	xe_execlist.o \
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > new file mode 100644
> > index 000000000000..0ceb3091f81e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -0,0 +1,280 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <linux/anon_inodes.h>
> > +#include <linux/fs.h>
> > +#include <linux/poll.h>
> > +#include <linux/types.h>
> > +
> > +#include <uapi/drm/xe_drm.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_eu_stall.h"
> > +#include "xe_gt_printk.h"
> > +#include "xe_gt_topology.h"
> > +#include "xe_macros.h"
> > +#include "xe_observation.h"
> > +
> > +static size_t per_xecore_buf_size = SZ_512K;
> > +
> > +/**
> > + * struct eu_stall_open_properties - EU stall sampling properties received
> > + *				     from user space at open.
> > + * @sampling_rate_mult: EU stall sampling rate multiplier.
> > + *			HW will sample every (sampling_rate_mult x 251) cycles.
> > + * @wait_num_reports: Minimum number of EU stall data reports to unblock poll().
> > + * @gt: GT on which EU stall data will be captured.
> > + */
> > +struct eu_stall_open_properties {
> > +	unsigned int sampling_rate_mult;
> > +	unsigned int wait_num_reports;
> 
> I already said no need to be so specific. Just use int or u32 as types for
> these.
Okay, will try to change these back to u8/u32 in the next version.
> 
> > +	struct xe_gt *gt;
> > +};
> > +
> > +/**
> > + * num_data_rows - Return the number of EU stall data rows of 64B each
> > + *		   for a given data size.
> > + *
> > + * @data_size: EU stall data size
> > + */
> > +static u32 num_data_rows(u32 data_size)
> > +{
> > +	return (data_size >> 6);
> > +}
> > +
> > +static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
> > +					   struct eu_stall_open_properties *props)
> > +{
> > +	value = div_u64(value, 251);
> > +	if (value == 0 || value > 7) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->sampling_rate_mult = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_wait_num_reports(struct xe_device *xe, u64 value,
> > +					      struct eu_stall_open_properties *props)
> > +{
> > +	unsigned int max_wait_num_reports;
> > +
> > +	max_wait_num_reports = num_data_rows(per_xecore_buf_size * XE_MAX_DSS_FUSE_BITS);
> 
> This seems wrong. Instead of XE_MAX_DSS_FUSE_BITS, shouldn't we use the
> value returned by xe_gt_topology_mask_last_dss()?
Yes you are correct. But not xe_gt_topology_mask_last_dss() as it would
only return the last DSS and the DSSes can be discontiguous. We should
use the absolute number of DSSes * buffer size. I can move this
validation to xe_eu_stall_stream_init() where we can do a 
bitmap_weight(all_xecore) to find the actual number of DSSes and return
EINVAL if invalid input. I did a simple validation here as I wasn't sure
if it is worth doing the extra validation.
> 
> Note that a large value can result in the poll/read never getting
> unblocked!
> 
> To solve this issue I think num_xecore should be maintained in struct
> xe_eu_stall_gt. Though let's see what happens to 'struct xe_device *' arg
> to these functions if we do this.
Probably not required if this validation is done in
xe_eu_stall_stream_init() added in the next patch as I described above.
> 
> > +	if (value == 0 || value > max_wait_num_reports) {
> > +		drm_dbg(&xe->drm, "Invalid EU stall event report count %llu\n", value);
> > +		drm_dbg(&xe->drm, "Minimum event report count is 1, maximum is %u\n",
> > +			max_wait_num_reports);
> > +		return -EINVAL;
> > +	}
> > +	props->wait_num_reports = value;
> > +	return 0;
> > +}
> > +
> > +static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
> > +				   struct eu_stall_open_properties *props)
> > +{
> > +	if (value >= xe->info.gt_count) {
> > +		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
> > +		return -EINVAL;
> > +	}
> > +	props->gt = xe_device_get_gt(xe, value);
> > +	return 0;
> > +}
> > +
> > +typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
> > +					struct eu_stall_open_properties *props);
> > +
> > +static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
> > +	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
> > +	[DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS] = set_prop_eu_stall_wait_num_reports,
> > +	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
> > +};
> > +
> > +static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
> > +					     struct eu_stall_open_properties *props)
> > +{
> > +	u64 __user *address = u64_to_user_ptr(extension);
> > +	struct drm_xe_ext_set_property ext;
> > +	int err;
> > +	u32 idx;
> > +
> > +	err = __copy_from_user(&ext, address, sizeof(ext));
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return -EFAULT;
> > +
> > +	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
> > +	    XE_IOCTL_DBG(xe, ext.pad))
> > +		return -EINVAL;
> > +
> > +	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
> > +	return xe_set_eu_stall_property_funcs[idx](xe, ext.value, props);
> > +}
> > +
> > +typedef int (*xe_eu_stall_user_extension_fn)(struct xe_device *xe, u64 extension,
> > +					     struct eu_stall_open_properties *props);
> > +static const xe_eu_stall_user_extension_fn xe_eu_stall_user_extension_funcs[] = {
> > +	[DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY] = xe_eu_stall_user_ext_set_property,
> > +};
> > +
> > +static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
> > +				       struct eu_stall_open_properties *props)
> 
> What is the reason for not using the ext_number argument here, which is
> used in both exec_queue_user_extensions and in xe_oa_user_extensions?

When I reused this code from the OA code it didn't have the ext_number.
I will check that out and make the change.
> 
> The reason for ext_number is that the extensions can be chained in a loop,
> which can cause an infinite loop in the kernel when parsing these
> extensions. ext_number is used to break out of these potential infinite
> loops.
> 
> > +{
> > +	u64 __user *address = u64_to_user_ptr(extension);
> > +	struct drm_xe_user_extension ext;
> > +	int err;
> > +	u32 idx;
> > +
> > +	err = __copy_from_user(&ext, address, sizeof(ext));
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return -EFAULT;
> > +
> > +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> > +	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(xe_eu_stall_user_extension_funcs)))
> > +		return -EINVAL;
> > +
> > +	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_eu_stall_user_extension_funcs));
> > +	err = xe_eu_stall_user_extension_funcs[idx](xe, extension, props);
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return err;
> > +
> > +	if (ext.next_extension)
> > +		return xe_eu_stall_user_extensions(xe, ext.next_extension, props);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
> > + *
> > + * @file: An xe EU stall data stream file
> > + * @buf: destination buffer given by userspace
> > + * @count: the number of bytes userspace wants to read
> > + * @ppos: (inout) file seek position (unused)
> > + *
> > + * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
> > + * before calling read().
> 
> We can just retain these two lines of comment. See below.
> 
> > + *
> > + * Returns: The number of bytes copied or a negative error code on failure.
> > + */
> > +static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
> > +				       size_t count, loff_t *ppos)
> > +{
> > +	ssize_t ret = 0;
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
> > + *
> > + * @file: An xe EU stall data stream file
> > + * @wait: Poll table
> > + *
> > + * Returns: Bit mask of returned events.
> > + */
> > +static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
> > +{
> > +	__poll_t ret = 0;
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_ioctl - support ioctl() of a xe EU stall data stream fd.
> > + *
> > + * @file: An xe EU stall data stream file
> > + * @cmd: the ioctl request
> > + * @arg: the ioctl data
> > + *
> > + * Returns: zero on success or a negative error code.
> > + *	    -EINVAL for an unknown ioctl request.
> > + */
> > +static long xe_eu_stall_stream_ioctl(struct file *file,
> > +				     unsigned int cmd,
> > +				     unsigned long arg)
> > +{
> > +	switch (cmd) {
> > +	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> > +		return 0;
> > +	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> 
> Just return 0 or -EINVAL in this patch since you are going to add locking
> in a later patch.
You mean remove the switch statement completely and just return 0 or
EINVAL? The intention of this switch statement is to specify the two
IOCTLs that will be supported in the uAPI.
> 
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_close - handles userspace close() of a EU stall data
> > + *			      stream file.
> > + * @inode: anonymous inode associated with file
> > + * @file: An xe EU stall data stream file
> > + *
> > + * Cleans up any resources associated with an open EU stall data stream file.
> > + */
> 
> As I said before, these comments are completely redundant. These are
> standard file_operations. There are one million instances of these in the
> kernel, all of them have exactly the same arguments.
> 
> If you have anything specific to EU stall here, we can leave it. Otherwise
> I'd still say get rid of them.
> 
> Or get rid them now and send a patch later to add them, we can review that
> patch later, if you really think they add value. They were included in
> i915_perf.c, but I don't think they should be in Xe.
> 
> If you think these comments should be there, let's get a second opinion,
> from one of the maintainers.
> 
Okay, will get feedback from a maintainer and will update.
> > +static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
> > +{
> > +	return 0;
> > +}
> > +
> > +static const struct file_operations fops_eu_stall = {
> > +	.owner		= THIS_MODULE,
> > +	.llseek		= noop_llseek,
> > +	.release	= xe_eu_stall_stream_close,
> > +	.poll		= xe_eu_stall_stream_poll,
> > +	.read		= xe_eu_stall_stream_read,
> > +	.unlocked_ioctl = xe_eu_stall_stream_ioctl,
> > +	.compat_ioctl   = xe_eu_stall_stream_ioctl,
> > +};
> > +
> > +static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
> > +{
> > +	return false;
> > +}
> > +
> > +/**
> > + * xe_eu_stall_stream_open - Open a xe EU stall data stream fd
> > + *
> > + * @dev: DRM device pointer
> > + * @data: pointer to first struct @drm_xe_ext_set_property in
> > + *	  the chain of input properties from the user space.
> > + * @file: DRM file pointer
> > + *
> > + * This function opens a EU stall data stream with input properties from
> > + * the user space.
> > + *
> > + * Returns: EU stall data stream fd on success or a negative error code.
> > + */
> > +int xe_eu_stall_stream_open(struct drm_device *dev,
> > +			    u64 data,
> > +			    struct drm_file *file)
> > +{
> > +	struct xe_device *xe = to_xe_device(dev);
> > +	struct eu_stall_open_properties props = {};
> > +	int ret, stream_fd;
> > +
> > +	if (xe_observation_paranoid && !perfmon_capable()) {
> > +		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
> > +		return -EACCES;
> > +	}
> > +	if (!has_eu_stall_sampling_support(xe)) {
> > +		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
> > +		return -EPERM;
> 
> I think we are using -ENODEV for this, at least in OA.
Okay.
> 
> > +	}
> 
> Move this has_eu_stall_sampling_support at the top, this should be even
> before the perfmon_capable check.
Will move.
> 
> > +
> > +	ret = xe_eu_stall_user_extensions(xe, data, &props);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!props.gt) {
> > +		drm_dbg(&xe->drm, "GT ID not provided for EU stall sampling\n");
> > +		return -EINVAL;
> > +	}
> 
> This check is not needed. props.gt cannot be NULL the way
> set_prop_eu_stall_gt_id is implemented.
If the user doesn't pass a GT ID, it will be NULL.
> 
> If you need it, use xe_assert(props->gt) in set_prop_eu_stall_gt_id.
> 
> > +
> > +	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall, NULL, 0);
> > +	if (stream_fd < 0)
> > +		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
> > +
> > +	return stream_fd;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > new file mode 100644
> > index 000000000000..d514e78341d5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef __XE_EU_STALL_H__
> > +#define __XE_EU_STALL_H__
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_file.h>
> > +#include <linux/types.h>
> 
> Because these lines are replaced in a future patch with '#include
> "xe_gt_types.h"', just do that in this patch itself.
Okay.
> 
> Also, as I said, I am not going to focus too much on the patches, only the
> final code, but in general, if you are deleting lines in these initial
> patches, think hard about why you need delete those lines and what you
> could do differently.
> 
> > +
> > +int xe_eu_stall_stream_open(struct drm_device *dev,
> > +			    u64 data,
> > +			    struct drm_file *file);
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> > index 8ec1b84cbb9e..cca661de60ac 100644
> > --- a/drivers/gpu/drm/xe/xe_observation.c
> > +++ b/drivers/gpu/drm/xe/xe_observation.c
> > @@ -9,6 +9,7 @@
> >  #include <uapi/drm/xe_drm.h>
> >
> >  #include "xe_oa.h"
> > +#include "xe_eu_stall.h"
> >  #include "xe_observation.h"
> >
> >  u32 xe_observation_paranoid = true;
> > @@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
> >	}
> >  }
> >
> > +static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> > +			     struct drm_file *file)
> > +{
> > +	switch (arg->observation_op) {
> > +	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
> > +		return xe_eu_stall_stream_open(dev, arg->param, file);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  /**
> >   * xe_observation_ioctl - The top level observation layer ioctl
> >   * @dev: @drm_device
> > @@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
> >	switch (arg->observation_type) {
> >	case DRM_XE_OBSERVATION_TYPE_OA:
> >		return xe_oa_ioctl(dev, arg, file);
> > +	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
> > +		return xe_eu_stall_ioctl(dev, arg, file);
> >	default:
> >		return -EINVAL;
> >	}
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 892f54d3aa09..1d79621f267b 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1496,6 +1496,8 @@ struct drm_xe_wait_user_fence {
> >  enum drm_xe_observation_type {
> >	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> >	DRM_XE_OBSERVATION_TYPE_OA,
> > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> >  };
> >
> >  /**
> > @@ -1848,6 +1850,42 @@ enum drm_xe_pxp_session_type {
> >  /* ID of the protected content session managed by Xe when PXP is active */
> >  #define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
> >
> > +/**
> > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > + *
> > + * These properties are passed to the driver at open as a chain of
> > + * @drm_xe_ext_set_property structures with @property set to these
> > + * properties' enums and @value set to the corresponding values of these
> > + * properties. @drm_xe_user_extension base.name should be set to
> > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > + *
> > + * With the file descriptor obtained from open, user space must enable
> > + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> > + * calling read(). EIO errno from read() indicates HW dropped data
> > + * due to full buffer.
> > + */
> > +enum drm_xe_eu_stall_property_id {
> > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
> > +	 * EU stall data will be captured.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > +	 * in GPU cycles.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS: Minimum number of
> > +	 * EU stall data reports to be present in the kernel buffer
> > +	 * before unblocking poll or read that is blocked.
> 
> before unblocking a blocked poll or read
Okay
> 
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2.48.1
> >

Thank you
Harish.
