Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B651099B30
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 20:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D3210EB1B;
	Fri, 20 Mar 2026 20:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvRB6lIw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F0410EB1B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 20:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774040364; x=1805576364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jw6ZtUwZMLiNsVvshJPeuHEqyLdAVh9swVUVog7v630=;
 b=JvRB6lIwshE81Zh/OjQtKh5bNillWPKU+8QwlpTlXGuWYXhuuToBSIUm
 5JihDal1EX+dwFMgz7mjE7CFNiIK0eZEc0sDKB+Gl6Blu34GUFQcl+qAD
 xGDGt5R+mOWIzQOZ+/Ls7huQQq1gpXRsAq8uapR5dD9cJmU54KmWLIgKs
 k+SQF/xzHBjdfiDD2OZvyl2CUj/AUvEp8RPyiqEWsoK76WRpMHO6pDFkM
 w7TIcIhFweGbfMzh1TQEiTcfT3ieuAHrSnhbJR6EQEZWKyoNrkr1UqO63
 EXqxiNuTVge5aYKmMxzvFxFCO54w6ngO3sMXaPdXkY74+z3pUEmdNKGmd w==;
X-CSE-ConnectionGUID: 4rX9fxzVQyuUJpBYzGc9zw==
X-CSE-MsgGUID: Ix4N3K7lTVOivRBGVpqdIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="79041753"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="79041753"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 13:59:24 -0700
X-CSE-ConnectionGUID: vS1Iz3WAT56LUfvgvB+NZQ==
X-CSE-MsgGUID: vTXCBuWgRQ6xcXdG9P31GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="225286516"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 13:59:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 13:59:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 13:59:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 13:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBLhdXDrcnbedmKYyx02iPa/1t/HVwBOg/9jRRsdTPTWxbEHvozgghsoJfiFcTtFsrUGN2svFUnMK3wrbi8CX7k1md0n2YcNUgxDX06cU0rCyllL81qZl3/2C84vfE8Bh++3J5AzurliwNCeCnOc4eFqYSj0cHmv6omg4IrF6tJfOThopX3BrvgSxx5CInOWIxNhG+H+P6RoZmfXKWkrsmXMcf1wJ2ASM47ZAxtNZR72cXVGuCmMg0NOvDu0YLQ4Vkoho4s2iN0r+6MPP+x+J1PS9etyeT28bvvHeYuCi5kvjd2pO5GbpuwplbaoBaYy9jFk1zxpmw9t77zeVbpLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feObOK7o3hMmya/e42lmGPB2sEq4x/1iM1+faqzeHXk=;
 b=Z2u5ksxEj7KofsxGZ969G173NxsWgjT+urrNjCFaa1iYjfHSBaUySsaUoLxCib4Hlm8N1Ba65ER7sncLyS8z2GjPcmmRZBHc495hO+jdhAct/qAP1ZUzFUYLKtLtt1s2eFjikGsDdeoeLS3b2NOiqLXDX9UDHCpTZxQTs5emUj2hOTS+4bkS++UTmO2Up6hgdT4GARrgpbJB1NLUO8bq87+fPFKO9le/nJBga1veb0PTmg/KiEFMKgUKPrJYsxSyO95DNkKkT57jW6iVUd3J/yxc6sUzWibkoD+XcujCnI4rkFtnOaBdper1kucujuX6AH0K9W05DetDEe21FJqrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::853) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Fri, 20 Mar
 2026 20:59:22 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 20:59:21 +0000
Date: Fri, 20 Mar 2026 13:59:18 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <felix.j.degrood@intel.com>,
 <matias.a.cabral@intel.com>, <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU
 stall registers get reset
Message-ID: <ab21JvEQ9nQJzZ2A@intel.com>
References: <52d991cc7e8bec514bb582717a1c42033672d4a5.1773683739.git.harish.chegondi@intel.com>
 <87se9xpqub.wl-ashutosh.dixit@intel.com>
 <absZXhGMwjcNb-gn@intel.com>
 <878qboqxq9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <878qboqxq9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ff5935-aaf6-47c6-e016-08de86c38f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: qg9agSc1voKb0dBxyuh+pGrRg9v8x/ZIji1aQq03L1VpLLBsB8Ma0Ms0KF1YD40Ay/0hHfNNNA0XmhuVm2hgmA0d4/q2RyMJlEca91EDkTk+8+isCamdjD4IwVd9SP6CmkQHWf7FDGVPw+jbDRogS5Cbw9npXMbEAqq6rOzo+yaGyCp8wOaq/l4gBmj7GPu4hdAiAZah9LCBIx3ee/7tt82mdMcw8+utyx+N+Icd90hWbQmzxwGL7wR18sOuwKfXhAMaWr84oNRzMs/PUO1s9seygirKa3dj3egPz3EtcbcW2uqicivdy1cV7jOMKjVvHpGFO14VekpQP6rVOJlo36MyzXaf7TIQ18CMwEudT5IzcEhxbImw1KWrVyzlLPx0oIoDist4z91BbuXJrZQ4rJMM4Dw0YbrdFn4W3b6skp19DyVLbdfjcYhi+l2ILz3fRN4gUjb25zKKmj0DSKBV+eYpKmXWS+bKrWCbHGXiJSAGROXRq0dzbzBTeIxdtvHQJ6aUeOSfM9b5HABYcU9eOMPf2vSgT7MLL3Ns8AeLZQeJvBuJWNhTskgESzNiBwPkzXO0lGTflcgAb9sa0RTjebHwB4Se5QlDlb8rqm48nw2590fziNDwdSDHgDentolnby61/6rmtvHwxmnihEr3FxdX+KTJuOHp/djKaTsizlKLzb90PiKRHvzC6gTvjEmSpFRH77aZpueLftrWnKoqnRWe6H6ZOk9Rw3iTi7A+lXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk9rSmxlbWdGS011a2hRenNtdGRFd2UwbjVjc2RBOWZ1d0VSMlNiYlUwa2J0?=
 =?utf-8?B?ZDFhUVJwTDhKUnR5SGNSS1JUWmJTbEt2K1ZYSGxmOUVOeEs5RzlNNEtPU0xK?=
 =?utf-8?B?eW9EbDJyYzV6Wm9vMTFaYjVSNTdUNE5pMlg5enNta2ViSEtRNzBpbnlqYmJW?=
 =?utf-8?B?dGZQVWRzVFh5VFk1OFkyblNRV0ZUMWFjRHJDaXRqWis3U3E4b2lMcjdmVFI0?=
 =?utf-8?B?VW5KcFg0eWIrVFpyMDRjY2tRMzd3L1p5RENKMmM0VWtZV2pkeDhkWUFlYVRK?=
 =?utf-8?B?UjBZd2Q5ZG55T0pyM0Vkd1hzbDNaZEJwRUYvUGpGYUY0WjQvTmFiN3p0L3JO?=
 =?utf-8?B?VFNVUlVXWENnK1VrK1FOVkNBbVlHSEE4aGdXUkJWdzRMbnZTNjRITWFNYkF6?=
 =?utf-8?B?K0MzSGdsVlUrM3pORGRXdysxZWNGM21JVGd3d1JLTXlOdlpScXdqdTlMb05o?=
 =?utf-8?B?Vnp4RlpDR1dyb041UzFFQUxNK3ViZzRNRklYaDJJQ3BRTFZzc3N0VzVkbVZp?=
 =?utf-8?B?cVI3TFFtWDhVS005M211bFM3dVpYWUwweXlTbnAvamtHeThtVlVycDNsb3pJ?=
 =?utf-8?B?L29yWjZiSU5tMnVIZ0p4cGlLdFZ5eVlKQTlDSGlXU1ltVDF2V0RsdG82dFNK?=
 =?utf-8?B?czdvbVlTRXE3aEpuaUwvL21jYjJ1ZVByUjBVbC9vTnJvWnprM3ByMllRSFFT?=
 =?utf-8?B?K1NuQXFxSlpIeTBnSnVMTlFPdWthS0NwSlZmTElpVW5xbGlSOHZmcGYwbWtT?=
 =?utf-8?B?V0loNnBsa1pWOHNIbENjWUYzaTNJb05Na1JRUkRBNU9JZzFVeURWZjJYaEEy?=
 =?utf-8?B?ZFdmUkIrMSs0VWFtYjdpTzVtU3lkbzJsNkc1NDVtZ3F4cFVIZUlyL3NaYTJS?=
 =?utf-8?B?ZE95SlZzekhGZTdQK0VsZlpxblZWcmxwUWU1dDZIdSt3ai96ME1iTHpXZFZr?=
 =?utf-8?B?NXBacjNMNGltd3pZUVhJdUJXcXBqT0d6U2VrZnZYcGdiTVRCMVpZZWFXeFFp?=
 =?utf-8?B?RTFLN2o1T0IwTmowNFVvME9XVjhNbW5GQ1JMcTJFRnp4cFhGanVxQlRxclkz?=
 =?utf-8?B?bjh5MFlWTDVxdThaMk5Lb2xLRmR1dXpRN3VzeHhpZENUQjlrUW54UTBIWC9q?=
 =?utf-8?B?Y2R3ZndmUUZkSTJSZy9aVU8xN2xmdFBJTDU0MDVXd3pFa2thQVNhd2ZXQ2hq?=
 =?utf-8?B?ZlZvS0VVQ2RrcGdHNWRFT0pUZDVsMGlxbDNuaHBRUCs5SFRPTGpYc1dNalph?=
 =?utf-8?B?MHN4ZXVxTlVyMDlhb2w4eFMrOFY4czhsaU9RL0xwSThObjJrMlJBVFJJa1Vv?=
 =?utf-8?B?dzljVTBseXJKZ3hOSEN6aDlNcDZmcXU3c1M3SVowSHpKbmQ3bEVpdENFN1Nz?=
 =?utf-8?B?clpFVWdqdTFOOG53NnBZYnQxTHE5YlBoMWt0M2pidkNIMWRCSFBIejVpcHRs?=
 =?utf-8?B?QVp4TmFkYXFWSy9VOE5KWitPajh3dy9KbWFIbmxGOGRqQVFDN0tSQkFVQkQx?=
 =?utf-8?B?N2Z2SlZNajVFT1J2aXZockNXak9LTDRadFoxZEFEOGRQWm5SNDQrOTlBSGhI?=
 =?utf-8?B?OTNMOUVYbzhUWUx0Y25lYkJ5cXVPU2Q0Y3h1Ulo4WnFQMStMRS83NHpYRWYw?=
 =?utf-8?B?NzNhVHh4SDRXcityOVBCMmFOUFdmSWpoV0orTHFvVW50Q21QQm9pa2JZN0ZI?=
 =?utf-8?B?NlJYRzVEc3FkeTFQUHdUQXdsUC85NVUzai9zdW1JbFZDMHpjTnRUczhGdHNE?=
 =?utf-8?B?dVdrdC9Qa0lWQXRTMXlRdXpNUEJzazFLWGNWZGhyU3BZMjJiWWZxUllYSUZk?=
 =?utf-8?B?SXBRRlYzRDBtMjU2b3o0bkdzNjQ1Sk90U3ljQjQwYmZtTFZZd1k2SVhYejJU?=
 =?utf-8?B?a0ozYm5GK2FENFFjZTB0TXdxSktoMnNUNGJ3dWdTL1VPTGRwd0d2aExGVG9q?=
 =?utf-8?B?OTV5Y2JKN0VlWWxHZFBiODFpTTBVZFdwYnpXanRUc216Nng4am93bTRabmZa?=
 =?utf-8?B?NzBLeWhsbTZWTmViNytnaTV4OFNJVEdIa3Zia2hkaVlUQXlUSE1lZThLbjlu?=
 =?utf-8?B?bzNDTDRyZWtBUGlFMHB5VTQ4SXdqMU5iU0FzajQrbS9KTmRxV0svV1R3SWwv?=
 =?utf-8?B?QVpQRmZmQUZ2UWhDZ044Y3ZvQzdrazNuNGdFT3J0TkxsbXJzMW1MZU9LR1kr?=
 =?utf-8?B?ODRaRm9zUWNtRDA0UEZwc1RYV1ZWZ2lqdXk1a2tqdWtYUW9hekY3ZUcvUjY0?=
 =?utf-8?B?eWJUVGlXYVdXalNXUUlOWWRYcDY2aWZOSXhFcE9DdUhWaVYxa2VqM0l1VjZT?=
 =?utf-8?B?eXNORFpMZ28rd3hIVXpoWXJCdTZ2bFVGR3NqbnpMTUZ2SWJ0bTNzd2wyQTlw?=
 =?utf-8?Q?kAwLNl1k8ZkNXtXE=3D?=
X-Exchange-RoutingPolicyChecked: Xg4SbvN88amm2sCskqHleHNeNBPyp3Nj98fy1ksRM/SlIcnkY5CxXZSRJ1v3iG4zYaf64KbnGJQEuVxJ36gAtleA6j2W/OYkc2Nn7Cd3FeA2IMqfFFQil5l/2wYWviWkarF38QRBRx1dCWCv7z+AcNpSSK7kdAz59jSuVPgfl6AGV6nGaLUScfmMmieghkmNw8eUFxRyYFuAfEPi2EGTJIPldinkL075vVnYwD2jbmKmus6gd3Of6XYJM00NP3uZBjGXI3EZG6CdSZLHzIRjLfAkFsN3cYbtjQ0+s1J4/J0X27C10vvIt3293okb09vYwXD5hRi8TEPAzOsadTniPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ff5935-aaf6-47c6-e016-08de86c38f4e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 20:59:21.6009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXVnVos6Z2IEZJpXiAVL9RF3NEP6C1oyqAzzFMJMpuTvfd5YdeH3FfqMtZokSks3WkzFrb+hIlh8snEJeo148iKJJJLwRUsfTDZ5nTc2dQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
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

On Wed, Mar 18, 2026 at 08:55:42PM -0700, Dixit, Ashutosh wrote:
> On Wed, 18 Mar 2026 14:30:06 -0700, Harish Chegondi wrote:
> >
> > On Tue, Mar 17, 2026 at 11:57:32PM -0700, Dixit, Ashutosh wrote:
> > > On Mon, 16 Mar 2026 10:58:56 -0700, Harish Chegondi wrote:
> > > >
> > > > If a reset (GT or engine) happens during EU stall data sampling, all the
> > > > EU stall registers can get reset to 0. This will result in EU stall data
> > > > buffers' read and write pointer register values to be out of sync with
> > > > the cached values. This will result in read() returning invalid data. To
> > > > prevent this, check the value of a EU stall base register. If it is zero,
> > > > it indicates a reset may have happened that wiped the register to zero.
> > > > If this happens, return EBADFD from read() upon which the user space
> > > > should close the fd and open a new fd for a new EU stall data
> > > > collection session.
> > > >
> > > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > > v2: Move base register check from read to the poll function
> > > >
> > > >  drivers/gpu/drm/xe/xe_eu_stall.c | 24 +++++++++++++++++++++++-
> > > >  1 file changed, 23 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > index c34408cfd292..7e14de73a2c9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > > > @@ -44,6 +44,7 @@ struct per_xecore_buf {
> > > >  struct xe_eu_stall_data_stream {
> > > >	bool pollin;
> > > >	bool enabled;
> > > > +	bool reset_detected;
> > > >	int wait_num_reports;
> > > >	int sampling_rate_mult;
> > > >	wait_queue_head_t poll_wq;
> > > > @@ -428,6 +429,17 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
> > > >			set_bit(xecore, stream->data_drop.mask);
> > > >		xecore_buf->write = write_ptr;
> > > >	}
> > > > +	/* If a GT or engine reset happens during EU stall sampling,
> > > > +	 * all EU stall registers get reset to 0 and the cached values of
> > > > +	 * the EU stall data buffers' read pointers are out of sync with
> > > > +	 * the register values. This causes invalid data to be returned
> > > > +	 * from read(). To prevent this, check the value of a EU stall base
> > > > +	 * register. If it is zero, there has been a reset.
> > > > +	 */
> > >
> > > As previously discussed, the best way would have been to not have to do
> > > this. We would just plug into the handler for the reset message from GuC,
> > > rather than to implement a reset detection here (and in other places such
> > > as OA). But looks like if we do that, because of the way EUSS registers are
> > > reset, we can return bad EUSS data. So looks like there is no way around
> > > doing this "reset detection" here and a solution with the GuC reset handler
> > > would always be racy. Just for the record.
> >
> > Thanks for the summary of the previous discussion. Yes, hooking into the
> > GUc reset notification handler will be racy and bad EUSS data will be
> > returned to the user space if read() happens after the reset but before
> > the GuC reset notification message is processed. That's the reason for
> > not taking that approach.
> >
> > >
> > > > +	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE))) {
> > > > +		stream->reset_detected = true;
> > > > +		min_data_present = true;
> > >
> > > I don't believe we need to set 'min_data_present = true' if we are setting
> > > 'stream->reset_detected = true', correct? See if statement at the bottom.
> >
> > Agree. The only difference is that the if statement at the bottom will
> > evaluate true in the current execution of eu_stall_data_buf_poll_work_fn
> > if min_data_present is set to true. If min_data_present is not set to
> > true, the if statement will evaluate to true in the subsequent execution
> > of eu_stall_data_buf_poll_work_fn() which is still okay. So, yes, we
> > don't have to set min_data_present to true here. Will fix in the next
> > version.
> 
> Just switch the order of the two OR operands and you don't have that issue?
But switching the order of the two OR operands would cause the function
eu_stall_data_buf_poll() to be unnecessarily called even after a reset
is detected.
> 
> > >
> > > Also, since the write pointer itself gets reset during reset, didn't we
> > > want to do this register read only when the write pointer is 0 (to avoid an
> > > extra register read every 5 ms)?
> >
> > Good point. I have thought about reducing the number of this register
> > reads. The poll function reads the write pointers of all the xecores.
> > A reset can happen anytime the poll function is reading the write
> > pointers of the xecores. If the reset happens before the poll function
> > started reading the write pointers, all write pointers are zeros.
> > If the reset happens during the poll function, several write pointers
> > read so far can be non-zero while the rest of the pointers after reset
> > are all zeros. The if reset happens right after the poll function, the
> > write pointers can be a mix of zeros and non-zeros.
> > I think the only time this register read can be skipped is if the
> > LAST write pointer read is non-zero which means a reset did not happen
> > before or during the poll function. Do you agree? I thought of adding a
> > check to the if statement to check if the last write pointer is
> > non-zero, but to keep the code clean, I didn't. Also, if there are
> > n xecores, there will be n write pointer register reads plus one
> > additional base register read, which isn't too bad? Also, hoping the use
> > of unlikely macro would not impact the performance too much.
> 
> OK, leave this as is I think. Otherwise we'll need to read the base
> register each time we see a zero write pointer. So it's ok, leave as is.
> 
> > >
> > > > +	}
> > > >	mutex_unlock(&stream->xecore_buf_lock);
> > > >
> > > >	return min_data_present;
> > > > @@ -554,6 +566,15 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
> > > >		}
> > > >		stream->data_drop.reported_to_user = false;
> > > >	}
> > > > +	/* If EU stall registers got reset due to a GT/engine reset,
> > > > +	 * continuing with the read() will return invalid data to
> > > > +	 * the user space. Just return -EBADFD instead.
> > > > +	 */
> > > > +	if (unlikely(stream->reset_detected)) {
> > > > +		xe_gt_dbg(gt, "EU stall base register has been reset\n");
> > > > +		mutex_unlock(&stream->xecore_buf_lock);
> > > > +		return -EBADFD;
> > >
> > > The other option is to return -EIO here and implement
> > > DRM_XE_OBSERVATION_IOCTL_STATUS and return status from that. Let me think
> > > some more about this.
> >
> > I think EBADFD is more appropriate errno than EIO in this case since the
> > fd is in a corrupted state and user has to close and re-open the fd.
> > Currently, the -EIO is used to indicate drop data in which case, the
> > user space can continue to read the data (faster) without closing the fd.
> 
> OK, we can go with -EBADFD, though still thinking about it.
> 
> > >
> > > > +	}
> > > >
> > > >	for_each_dss_steering(xecore, gt, group, instance) {
> > > >		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
> > > > @@ -692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> > > >		xecore_buf->write = write_ptr;
> > > >		xecore_buf->read = write_ptr;
> > > >	}
> > > > +	stream->reset_detected = false;
> > >
> > > So after reset, if a stream is disabled and re-enabled, we expect things to
> > > work again and EUSS data to be correct (without re-opening a new
> > > stream)?
> >
> > Technically, yes, since the EU stall registers programming is done in
> > enable, things will work again if the stream is disabled and re-enabled.
> > But if the EUSS registers programming is moved into open() in the
> > future, things may not work by disabling and re-enabling the stream. So,
> > I think we suggest to the UMDs to close the stream and open a new
> > stream.
> 
> No we don't suggest anything to UMD's. We decide what we want to do,
> implement and enforce it that way and then maintain that uapi.
> 
> OK, then let us make sure after disable/enable, the reset_detected flag
> remains set.
Okay, I will make sure the reset_detected flag remains set even after a
disable and an enable.

Thank you
Harish.
> 
> > >
> > > >	stream->data_drop.reported_to_user = false;
> > > >	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
> > > >
> > > > @@ -717,7 +739,7 @@ static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> > > >		container_of(work, typeof(*stream), buf_poll_work.work);
> > > >	struct xe_gt *gt = stream->gt;
> > > >
> > > > -	if (eu_stall_data_buf_poll(stream)) {
> > > > +	if (stream->reset_detected || eu_stall_data_buf_poll(stream)) {
> > > >		stream->pollin = true;
> > > >		wake_up(&stream->poll_wq);
> > > >	}
> > > > --
> > > > 2.43.0
> > > >
