Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFF0CFC50C
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 05:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF0610E04D;
	Sat, 22 Nov 2025 05:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6H+XMPt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B238110E04D
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 05:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763788462; x=1795324462;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GKnI4+wzjbBywWh0r53FVcbP6fOuBpJZE+ZzdogNufE=;
 b=S6H+XMPtx6wvkGRSeVoTxum61oef36IR6BhPiRqW5eQih+hxyljP1oLd
 3X3pxQ6LC3rSXg2mtSC/QOoIxWGuPfcgmUnGTGMkjm/jmw4alE4KSf2Sw
 jWN9nBLDwEr0YcPAnfTRVsNak5vGjDkTioaT45VkywRay/tIbMkTmLB5r
 ltdZe+sHN69gN3lIiFbag0vhqLKikoXgElIIuPIiDnNCL2ofxpHPAaRdb
 Qwek92QYhyeXORMc71WS2CrE4gTuZW7XQnQRbi10r4SZPXWspboUn4zvH
 4Jo3+xVAQ27Lo6GHJw4X9/Svd/IGxJ2soxaiqMkk+684fayOOEGCmt8w6 w==;
X-CSE-ConnectionGUID: GV/3Il00QWaGBLajqUnevQ==
X-CSE-MsgGUID: IqsQQc8IRv+VWO9d2f4+nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69498824"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="69498824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 21:14:21 -0800
X-CSE-ConnectionGUID: j2KHRJNtS8KzW3e3beWa7g==
X-CSE-MsgGUID: 1YohGa48QGelWXFsOkzCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="222813482"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 21:14:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 21:14:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 21:14:20 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 21:14:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWbrvKJoZs0x3SMtbwq4C1Ei7zdzJ2EH5iL2CqX5SSnYYCkSEwDfEgj43PIipPXRyFg7iGMQenypplwKomo1l0HBOrq+NCZ5I1JWGuMiXM7n56oeb2PBd26EVOV8w3M2VhihTQLx3urafTK6YL4DIG97sWlwYzfMK9vVT4sX2sD2nfa7Mz/QSGlQXye/lhvKjTFKKTUzQnynWa80PcZZCVgNGz5mTifgHL3KYr/hifVcbOlTwfDOmT+e/rMzZMpUv93j6CbH0tlNllWZ8kWX4ABph+yHKDLg8ZHnAOMLQtFLGI5UnSOEgZhjwPitgQN8yF9XDI2pyVXUwmeHFWGeXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOsxRaRaeTo00Ra+y5jYM2wbtVXJYHXBBGZ0A1D55/0=;
 b=yTbGAV79wOosgCIXChKsh+AjDJICJrCMpF7pYzWFsdvtce5DLyjeRCwDNHuefM2JlSot269eYslJONfLLtWMlS6aWVaemfKyDgk73MlWptxiOBh+nnvHV5NbLBMPC0BF2gpUUOdBhiGPaxi/GlCnpH3ZVOE8UkyexB7ZGzPCO91tzBKBets8bJ4d/JOLSBT1gAAKWjajr1VaGdTrG0nLstY9gpz6YdxvJHFeqjhmWBigNQgo90J0N9FpvFns88h45qQziwSzTT9eBBf2ZUgsfG5Jwq8niS6EJgQ5e7RQaRdn608dNJ9oxnIyaMSSaNBS52iPt9fA4qZBPbkdcFkAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Sat, 22 Nov 2025 05:14:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 05:14:16 +0000
Date: Fri, 21 Nov 2025 21:14:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <mohamed.mansoor.v@intel.com>,
 <kam.nasim@intel.com>
Subject: Re: [RFC 5/5] drm/xe/sc: Add system controller component for Xe3p
 dGPU platforms
Message-ID: <aSFGpYRorkCCZ8Yl@lstrano-desk.jf.intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
 <20251122045803.3616201-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251122045803.3616201-12-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:303:8c::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 985e6320-495a-4108-6ca1-08de2985fbbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7L6JL+HoFkT2uvjdkv8lDxnaIZ9uFrGpN3s9J7Qm2fmqEF0QHIxQRnIPxI?=
 =?iso-8859-1?Q?mMwnzNprrPHqbV25WD71WXkRfuPDjyhCoqA68SV/dJbfcxVGjVnss9PcnU?=
 =?iso-8859-1?Q?M66LCaDwwmUKy44gqXMZ6HiwrS4syHTo+2d5wlHk0v6+jwR6/xBWi2QVA/?=
 =?iso-8859-1?Q?aQzE+Axbd1N7fZcV7F6MuH+o/CT8v9fjgUn4EfkPcs2GGb/MPnQwe/Y1Es?=
 =?iso-8859-1?Q?J+crzYDYKK0h4bPuyzGsCNhz8QxMwqQfztDMtlYCFy1sYJvXsT6kUDleNy?=
 =?iso-8859-1?Q?1bUgLGGXQz4YY+vslKBuasMFhw6dlJ/t5Gz9o4cHQwEzDSBL2ITggPabvc?=
 =?iso-8859-1?Q?XPWxj6vPHKIi6vy+jaaqdPRSl/E0VtjwDowYKK88shr2I7GCErJ1yY5Mv0?=
 =?iso-8859-1?Q?oQWt4HFNSbfhyKtuaDiMrSUNn7v6SRatRQH9+2qQHmy+FVuCyxWcaEM4hp?=
 =?iso-8859-1?Q?0ws7tcMfdwCaaIjBW+lfdMuXuRgEMKnMPzaWm1yTZUWdfvrDhsmAHsnsRx?=
 =?iso-8859-1?Q?U8Ewht/yLq9gSKHg0tjianQuLHEKlGH85/QrsGCN0OCmnChIgnaxoFbDf5?=
 =?iso-8859-1?Q?LkdH0mmj8vs6TEOTkhPgttbqTv9ctsN83NZ7Sx9v+Pzbm/juTw8ThyQ70k?=
 =?iso-8859-1?Q?luyh58TQ6hWtUQmPe/i/aSGlbkz4FwbJG9WH07pXO+7dlJjp21IVm/z7Ha?=
 =?iso-8859-1?Q?eWG1zeL3uTxLli3O63wRZ+UoCqGAoM2gujVBw3LPt5AszGKgO280N5cdBp?=
 =?iso-8859-1?Q?k1tWYMfHDmWTI0phqrp1WXi2jyg/pLlBpcsBV5NcvfzccbQVl6gIqvSjE7?=
 =?iso-8859-1?Q?BbQ206QviKNyCBkzwCLPgN6azEOqF3CCOfZ93f6xLBXkXqtXLo1wPYrLPG?=
 =?iso-8859-1?Q?ZXO/PnYLuAvFBWgzHYGKZ8m78mCQqKfr7VUsCLY6GgMzrxBrn0/vVJssaW?=
 =?iso-8859-1?Q?wjtJuRQvmDxSLyqKXQXt/ofPEq/y/epR6RzfDh7j4zKJ9L3fxRftSkJvd/?=
 =?iso-8859-1?Q?jsxX3gw+hK0YdPNd4NfCvD5pqSQOSupOeWw7sabONw326oHyuvCzZGuq5e?=
 =?iso-8859-1?Q?n4WsYI2rrWpZTrTXu6CL8Yx2Lyy6xgq1HktP8CvWPZQGYMuQHKo3pxqwN3?=
 =?iso-8859-1?Q?EUv56t+t3KLytdiZ40IPNc4XS8f9mDyoMMbkv5GnJDaC4Y4geGwNFTBbJo?=
 =?iso-8859-1?Q?z4uVQ2VNyKCaiM1/gorDL5wmkGkdBB6hbmWevEceUdUXVxe5h+0wYQU1RM?=
 =?iso-8859-1?Q?BP9aQLNflrsq3J0wSwOP8pE2NEjPHPHbMX3J7mvIkxCQhgW6IAtTw2lPAf?=
 =?iso-8859-1?Q?DMfhtIe1Eth/o/9HYeLdecNRKNWskn7txMPFfQcmtq0TiFcvdTPa5ok2xV?=
 =?iso-8859-1?Q?60OBf/W9NdXzNqacs4xzEcOcCEuNRjIy6kic2JZRfJiU3Nji5Xp8PLBdC6?=
 =?iso-8859-1?Q?l3Zk65BaNu+UfuTKopKU8BaSUpkwEzXOzySDYs7dXThzoNOmeZoEsNh/Ts?=
 =?iso-8859-1?Q?MzgtkjghBFzkij2OljV0Cc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Wfiwq3ch5IkQuMzDvU6Y5RuqJqblztjkMBHppnDys9YGXq6SlOs4Lh/DtF?=
 =?iso-8859-1?Q?Zg+BP9q9VT9B1wnFZ4aVhxaj2E3CbvaTmqcpHdP0nJmtmmLKofzitWXpkc?=
 =?iso-8859-1?Q?cApgNbmizo9dtGa22j90rArClNOPudTymjXcfV4pyqu2vYldD9FY5/sOAk?=
 =?iso-8859-1?Q?BmoMfbO550DfA7E5vw6TZhsnR4nnTx+TQswpyc8Rgor9MZlFttC9UIA4b6?=
 =?iso-8859-1?Q?Y2XantvDWSGj2yNy+tO2oaNPUvDsVE/JZGuriqt/fzbfhl7xS9AleOrNwV?=
 =?iso-8859-1?Q?E4mj1wpgL/RQt2D+4qI6WuAQrQDlhyBRixfRBWT6gSIja5ojpjuafr8Sb8?=
 =?iso-8859-1?Q?K1T8HcZQbSYSO+z5jg3n+IKlOzi1taaNJKM/0JiaUhS3fNXUAnaKlhl8i1?=
 =?iso-8859-1?Q?YWHC5QNv0N4fT0SwIv5++bSQ4AFBxIhbkzxyJFWUTcT8Z8ZKoUU9C4NWWf?=
 =?iso-8859-1?Q?DDDMH9rVU4hTqWcysCR7hhnyR9/3MHYJGOEK8RlUCGYz0sDnS9a+a9M7Bt?=
 =?iso-8859-1?Q?1hwHjbz3jQ/LSQUogN+uy//4hm0gVkvjCeVhn0YGT50kNKY1TW6eMXrNkq?=
 =?iso-8859-1?Q?kuTxKmQQskuroVnAt9mBcz0nf+yf4XrGzTCTN48Nj1Lun2dHetlrz3t5wZ?=
 =?iso-8859-1?Q?UjyDEr1oSd0/Ibv3RCNlzeQVWhapYypSn578+gk9Cw6QuD96pujeUMGvjb?=
 =?iso-8859-1?Q?DNgIzymuiMd0u0zfuMIpS+/Oj0t19MUxLe0zsxQzg/Qy45aG96dA0HKhRp?=
 =?iso-8859-1?Q?ix/DqhH/3jp1JsWL5eYZiYvvNDTUo34YiO23HL8O0V8Kd/Yad+jct9iqE5?=
 =?iso-8859-1?Q?A0+fbcAVltCHZpZaf5sLhm2U2zwsbwxblPavu/hTlbOnfVMBCUhqyivZrq?=
 =?iso-8859-1?Q?2DCXQ9Hh6DOqingVeZIpymJucN/eZnJ4gt7lQ6CsxnfPd6lEtJ3RhYrbBK?=
 =?iso-8859-1?Q?rBHViNwL4p6innoicnkCIGJGNP8W65QWRPj7Sm9LwNhLG6E3tbzFEXON0c?=
 =?iso-8859-1?Q?M+Zuhl7Sx1vylA+pC8UVmuCwg9sadRkcSz8bCaUDHPQUhovQpdcGiusahm?=
 =?iso-8859-1?Q?W6tKduidmdvkTUmFOUInYFaEM/k0Bg3JqRqw7J1zSxtsrtCYUbeDaMOz+0?=
 =?iso-8859-1?Q?Z/9hVY7ZoULUS5GPdsKN56WKzABUKCcRuB/Kg2PgQQr71SMlzuwu4R7lvG?=
 =?iso-8859-1?Q?J/T4adzgwIZwIwIJJquOydCrW8E6xvcQAhh+BXtJpvLhjItw/fSxSmMiQ2?=
 =?iso-8859-1?Q?bekNrhL/+fjgLXrVarV2b+0oan3MWQWhK2zdB3bwCPdcUphAVcXsZrjxYt?=
 =?iso-8859-1?Q?Ns7uvI9syLuBoBbGTHOp/WJPfSok0PSC8Sngm4ysC0ZFzs/Z4Vzr50Pcq7?=
 =?iso-8859-1?Q?6a15OV4N2Yg7PfSdd6x6bc4Ue6xwpBOigeM2Yy8SsCXS/9kZ5b9MVOrnUD?=
 =?iso-8859-1?Q?NtPWAW4mrGOzMfUgZ96naqpqSGhtJYmcx5n1iWv/I6HcRaXf6vWMzhMKG7?=
 =?iso-8859-1?Q?KXvgZK7/Y+Sl4ie52ky4vVWEm28KFIBhgRtcGGVnDK55tI6QkdRivGC1Bk?=
 =?iso-8859-1?Q?Qlzp0SqdY5ayer2HLtgIfcsnTS6R2u5ZnU10NG1qizRCiQFBn/nnluLpSS?=
 =?iso-8859-1?Q?kGj0pnVBRPkPgthsTctFLzFDRq5Gh6kWKvD3zQqid2CqSQ8LE8ipY3uQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 985e6320-495a-4108-6ca1-08de2985fbbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 05:14:16.5660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9R11V1Ziz3xAzfTqAGJ6j0Cgsd83JS+nitEXyOxr8V0y8rF6HoMDWjIbktIMBdWVG6AfJFQUyFdoRju0bn/Upw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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

On Fri, Nov 21, 2025 at 08:58:07PM -0800, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add a new system controller (SC) component for Intel Xe3p dGPU platforms.
> 
> This component provides the foundational infrastructure for communication
> with the SC firmware using the MKHI protocol over a mailbox interface.
> 
> Key features introduced:
> - Detection and initialization of the SC interface on Xe3p dGPU platforms
> - Mailbox communication with SC firmware
> - Fragmented message transfer for large command payloads
> 
> This implementation establishes the base for future SC feature
> enablement and firmware command handling.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/regs/xe_sc_regs.h |  49 ++++
>  drivers/gpu/drm/xe/xe_device.c       |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_sc.c           |  89 +++++++
>  drivers/gpu/drm/xe/xe_sc.h           |  15 ++
>  drivers/gpu/drm/xe/xe_sc_mailbox.c   | 374 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sc_mailbox.h   |  61 +++++
>  drivers/gpu/drm/xe/xe_sc_types.h     |  35 +++
>  9 files changed, 635 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sc_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sc_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7ebfbf9051bf..50e8dc86d915 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,7 +114,9 @@ xe-y += xe_bb.o \
>  	xe_ring_ops.o \
>  	xe_rtp.o \
>  	xe_sa.o \
> +	xe_sc.o \
>  	xe_sched_job.o \
> +	xe_sc_mailbox.o \
>  	xe_shrinker.o \
>  	xe_step.o \
>  	xe_survivability_mode.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_sc_regs.h b/drivers/gpu/drm/xe/regs/xe_sc_regs.h
> new file mode 100644
> index 000000000000..2b7053586197
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_sc_regs.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SC_REGS_H_
> +#define _XE_SC_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SYSCTRL_BASE_OFFSET		0xDB000
> +#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
> +#define SYSCTRL_MAILBOX_INDEX		0x03
> +#define SC_BAR_LENGTH			0x1000
> +
> +#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
> +#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
> +#define   SC_MB_CTRL_IRQ		REG_BIT(30)
> +#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
> +#define   SC_MB_CTRL_PARAM3		REG_GENMASK(28, 24)
> +#define   SC_MB_CTRL_PARAM2		REG_GENMASK(23, 16)
> +#define   SC_MB_CTRL_PARAM1		REG_GENMASK(15, 8)
> +#define   SC_MB_CTRL_COMMAND		REG_GENMASK(7, 0)
> +
> +#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
> +#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
> +#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
> +#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
> +
> +#define MKHI_FRAME_PHASE		REG_BIT(24)
> +#define MKHI_FRAME_CURRENT		REG_GENMASK(21, 16)
> +#define MKHI_FRAME_TOTAL		REG_GENMASK(13, 8)
> +#define MKHI_FRAME_COMMAND		REG_GENMASK(7, 0)
> +
> +#define MKHI_HDR_RESULT			REG_GENMASK(31, 24)
> +#define MKHI_HDR_IS_RESPONSE		REG_BIT(15)
> +#define MKHI_HDR_COMMAND		REG_GENMASK(14, 8)
> +#define MKHI_HDR_GROUP_ID		REG_GENMASK(7, 0)
> +
> +#define SC_MB_FRAME_SIZE		16
> +#define SC_MB_MAX_FRAMES		64
> +#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
> +#define SC_MKHI_COMMAND			5
> +
> +#define SC_MB_DEFAULT_TIMEOUT_MS	500
> +#define SC_MB_RETRY_TIMEOUT_MS		20
> +#define SC_MB_POLL_INTERVAL_US		100
> +
> +#endif /* _XE_SC_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f15489c100af..9fbd0b084c74 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -60,6 +60,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_sc.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_shrinker.h"
>  #include "xe_survivability_mode.h"
> @@ -963,6 +964,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> +	err = xe_sc_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3f118c64a124..86a0c83c802d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -314,6 +314,8 @@ struct xe_device {
>  		u8 has_range_tlb_inval:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
> +		/** @info.has_sysctrl: Supports System Controller */
> +		u8 has_sysctrl:1;
>  		/** @info.has_usm: Device has unified shared memory support */
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> @@ -576,6 +578,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @sc: System Controller */
> +	struct xe_sc *sc;
> +
>  	/** @nvm: discrete graphics non-volatile memory */
>  	struct intel_dg_nvm_dev *nvm;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sc.c b/drivers/gpu/drm/xe/xe_sc.c
> new file mode 100644
> index 000000000000..18448efc173f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_sc.h"
> +
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_sc_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +#include "xe_soc_remapper.h"
> +#include "xe_sc_types.h"
> +#include "xe_tile.h"
> +
> +static void xe_sc_remove(struct drm_device *drm, void *arg)
> +{
> +	struct xe_sc *sc = arg;
> +	struct xe_device *xe;
> +
> +	if (!sc)
> +		return;
> +
> +	xe = to_xe_device(drm);
> +
> +	mutex_destroy(&sc->cmd_lock);
> +
> +	xe_soc_remapper_set_sysctrl_region(xe, 0);
> +
> +	xe->sc = NULL;
> +}
> +
> +static int xe_sc_probe(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_sc *sc;
> +	int ret;
> +
> +	sc = drmm_kzalloc(&xe->drm, sizeof(*sc), GFP_KERNEL);
> +	if (!sc)
> +		return -ENOMEM;
> +
> +	sc->xe = xe;
> +	xe->sc = sc;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_sc_remove, sc);
> +	if (ret) {
> +		xe->sc = NULL;
> +		return ret;
> +	}
> +
> +	xe_soc_remapper_set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	xe_mmio_init(&sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
> +
> +	mutex_init(&sc->cmd_lock);
> +
> +	sc->phase_bit = 0;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sc_init - Initialize SC subsystem
> + * @xe: xe device instance
> + *
> + * Entry point for SC initialization, called from xe_device_probe().
> + * This function checks platform support and calls the main probe function.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_sc_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	ret = xe_sc_probe(xe);
> +	if (ret)
> +		drm_err(&xe->drm, "sysctrl: Probe failed: %d\n", ret);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sc.h b/drivers/gpu/drm/xe/xe_sc.h
> new file mode 100644
> index 000000000000..0e5c89ddc957
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_SC_H__
> +#define __XE_SC_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +int xe_sc_init(struct xe_device *xe);
> +
> +#endif /* __XE_SC_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.c b/drivers/gpu/drm/xe/xe_sc_mailbox.c
> new file mode 100644
> index 000000000000..6f2500c63a3c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_mailbox.c
> @@ -0,0 +1,374 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_sc_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_sc.h"
> +#include "xe_sc_mailbox.h"
> +#include "xe_sc_types.h"
> +
> +static bool sc_mb_wait_bit_clear(struct xe_sc *sc, u32 bit_mask,
> +				 unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	if (timeout_ms == 0) {
> +		ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +					 0, NULL, false);
> +	} else {
> +		ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +					 timeout_ms * 1000, NULL, false);
> +	}
> +
> +	return ret == 0;
> +}
> +
> +static bool sc_mb_wait_bit_set(struct xe_sc *sc, u32 bit_mask,
> +			       unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	if (timeout_ms == 0) {
> +		ret = xe_mmio_wait32(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +				     0, NULL, false);
> +	} else {
> +		ret = xe_mmio_wait32(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +				     timeout_ms * 1000, NULL, false);
> +	}
> +
> +	return ret == 0;
> +}
> +
> +static void sc_mb_write_frame(struct xe_sc *sc, const void *buffer,
> +			      size_t offset)
> +{
> +	const u32 *data = (const u32 *)((const u8 *)buffer + offset);
> +
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA0, data[0]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA1, data[1]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA2, data[2]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA3, data[3]);
> +}
> +
> +static void sc_mb_read_frame(struct xe_sc *sc, void *buffer,
> +			     size_t offset)
> +{
> +	u32 *data = (u32 *)((u8 *)buffer + offset);
> +
> +	data[0] = xe_mmio_read32(&sc->mmio, SC_MB_DATA0);
> +	data[1] = xe_mmio_read32(&sc->mmio, SC_MB_DATA1);
> +	data[2] = xe_mmio_read32(&sc->mmio, SC_MB_DATA2);
> +	data[3] = xe_mmio_read32(&sc->mmio, SC_MB_DATA3);
> +}
> +
> +static void sc_mb_clear_response(struct xe_sc *sc)
> +{
> +	xe_mmio_write32(&sc->mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT);
> +}
> +
> +static int sc_mb_prepare_command(struct xe_sc *sc,
> +				 const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +				 const void *data_in, size_t data_in_len,
> +				 u8 **cmd_buffer, size_t *cmd_size)
> +{
> +	struct xe_sc_mailbox_mkhi_msg_hdr mkhi_hdr = {0};
> +
> +	mkhi_hdr.group_id = msg_hdr->group_id;
> +	mkhi_hdr.command = msg_hdr->command & 0x7F;
> +	mkhi_hdr.is_response = 0;
> +	mkhi_hdr.reserved = 0;
> +	mkhi_hdr.result = 0;
> +
> +	*cmd_size = sizeof(struct xe_sc_mailbox_mkhi_msg_hdr) + data_in_len;
> +
> +	if (*cmd_size > SC_MB_MAX_MESSAGE_SIZE) {
> +		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (max %u)\n",
> +			*cmd_size, SC_MB_MAX_MESSAGE_SIZE);
> +		return -EINVAL;
> +	}
> +
> +	*cmd_buffer = kmalloc(*cmd_size, GFP_KERNEL);
> +	if (!*cmd_buffer)
> +		return -ENOMEM;
> +
> +	memcpy(*cmd_buffer, &mkhi_hdr, sizeof(struct xe_sc_mailbox_mkhi_msg_hdr));
> +	if (data_in && data_in_len)
> +		memcpy(*cmd_buffer + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
> +		       data_in, data_in_len);
> +
> +	drm_dbg(&sc->xe->drm, "SC: request: group=0x%02x cmd=0x%02x payload=%zu bytes\n",
> +		mkhi_hdr.group_id, mkhi_hdr.command, data_in_len);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_send_frames(struct xe_sc *sc, const u8 *cmd_buffer,
> +			     size_t cmd_size, unsigned int timeout_ms)
> +{
> +	u32 ctrl_reg, total_frames, current_frame;
> +	size_t bytes_sent, bytes_to_send;
> +
> +	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
> +	if (total_frames > SC_MB_MAX_FRAMES) {
> +		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (%u frames, max %u)\n",
> +			cmd_size, total_frames, SC_MB_MAX_FRAMES);
> +		return -EINVAL;
> +	}
> +
> +	if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +		drm_err(&sc->xe->drm, "SC: Mailbox busy (RUN_BUSY timeout)\n");
> +		return -EBUSY;
> +	}
> +
> +	sc->phase_bit ^= 1;
> +
> +	drm_dbg(&sc->xe->drm, "SC: Sending message: %zu bytes, %u frames, phase=%u\n",
> +		cmd_size, total_frames, sc->phase_bit);
> +
> +	bytes_sent = 0;
> +	for (current_frame = 0; current_frame < total_frames; current_frame++) {
> +		bytes_to_send = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
> +
> +		sc_mb_write_frame(sc, cmd_buffer, bytes_sent);
> +
> +		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
> +			   FIELD_PREP(MKHI_FRAME_CURRENT, current_frame) |
> +			   FIELD_PREP(MKHI_FRAME_TOTAL, total_frames - 1) |
> +			   FIELD_PREP(MKHI_FRAME_COMMAND, SC_MKHI_COMMAND);
> +		if (sc->phase_bit)
> +			ctrl_reg |= FIELD_PREP(MKHI_FRAME_PHASE, 1);
> +
> +		xe_mmio_write32(&sc->mmio, SC_MB_CTRL, ctrl_reg);
> +
> +		drm_dbg(&sc->xe->drm, "SC: Sent frame %u/%u\n",
> +			current_frame, total_frames - 1);
> +
> +		if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +			drm_err(&sc->xe->drm, "SC: Frame %u acknowledgment timeout\n",
> +				current_frame);
> +			return -ETIMEDOUT;
> +		}
> +
> +		bytes_sent += bytes_to_send;
> +	}
> +
> +	drm_dbg(&sc->xe->drm, "SC: All frames sent successfully (%zu bytes)\n", bytes_sent);
> +	return 0;
> +}
> +
> +static int sc_mb_validate_response_header(struct xe_sc *sc,
> +					  const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +					  const struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr)
> +{
> +	if (!resp_hdr->is_response ||
> +	    resp_hdr->group_id != msg_hdr->group_id ||
> +	    resp_hdr->command != (msg_hdr->command & 0x7F)) {
> +		drm_err(&sc->xe->drm, "SC: Invalid response header\n");
> +		return -EPROTO;
> +	}
> +
> +	if (resp_hdr->result != 0) {
> +		drm_err(&sc->xe->drm, "SC: Firmware error: result=0x%02x\n",
> +			resp_hdr->result);
> +		return -EIO;
> +	}
> +
> +	drm_dbg(&sc->xe->drm, "SC: response: group=0x%02x cmd=0x%02x\n",
> +		resp_hdr->group_id, resp_hdr->command);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_receive_frames(struct xe_sc *sc,
> +				const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +				void *data_out, size_t data_out_len,
> +				size_t *bytes_received, unsigned int timeout_ms)
> +{
> +	u32 ctrl_reg, total_frames, current_frame;
> +	size_t payload_size;
> +	int ret;
> +
> +	*bytes_received = 0;
> +
> +	do {
> +		ctrl_reg = xe_mmio_read32(&sc->mmio, SC_MB_CTRL);
> +		current_frame = FIELD_GET(MKHI_FRAME_CURRENT, ctrl_reg);
> +		total_frames = FIELD_GET(MKHI_FRAME_TOTAL, ctrl_reg) + 1;
> +
> +		drm_dbg(&sc->xe->drm, "SC: Receiving frame %u/%u\n",
> +			current_frame, total_frames - 1);
> +
> +		if (current_frame == 0) {
> +			u32 temp_frame[4];
> +			struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr;
> +
> +			sc_mb_read_frame(sc, temp_frame, 0);
> +			resp_hdr = (struct xe_sc_mailbox_mkhi_msg_hdr *)temp_frame;
> +
> +			ret = sc_mb_validate_response_header(sc, msg_hdr, resp_hdr);
> +			if (ret)
> +				return ret;
> +
> +			payload_size = SC_MB_FRAME_SIZE - sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +			if (payload_size > data_out_len) {
> +				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
> +				return -ENOSPC;
> +			}
> +
> +			memcpy(data_out,
> +			       (u8 *)temp_frame + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
> +			       payload_size);
> +			*bytes_received = payload_size;
> +		} else {
> +			size_t frame_size = SC_MB_FRAME_SIZE;
> +
> +			if (current_frame == total_frames - 1) {
> +				size_t total_response = (total_frames - 1) *
> +							SC_MB_FRAME_SIZE +
> +							sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +				size_t remaining = total_response -
> +						   *bytes_received -
> +						   sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +				frame_size = min(frame_size, remaining);
> +			}
> +
> +			if (*bytes_received + frame_size > data_out_len) {
> +				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
> +				return -ENOSPC;
> +			}
> +
> +			sc_mb_read_frame(sc, data_out, *bytes_received);
> +			*bytes_received += frame_size;
> +		}
> +
> +		sc_mb_clear_response(sc);
> +
> +		if (current_frame + 1 < total_frames &&
> +		    !sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +			drm_err(&sc->xe->drm, "SC: Response frame %u timeout\n",
> +				current_frame + 1);
> +			return -ETIMEDOUT;
> +		}
> +
> +	} while (current_frame + 1 < total_frames);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_send_command(struct xe_sc *sc,
> +			      const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +			      const u8 *cmd_buffer, size_t cmd_size,
> +			      void *data_out, size_t data_out_len,
> +			      size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	size_t bytes_received;
> +	int ret;
> +
> +	if (rdata_len)
> +		*rdata_len = 0;
> +
> +	ret = sc_mb_send_frames(sc, cmd_buffer, cmd_size, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	if (!data_out) {
> +		drm_dbg(&sc->xe->drm, "SC: Command completed (no response expected)\n");
> +		return 0;
> +	}
> +
> +	if (!sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		drm_err(&sc->xe->drm, "SC: Response timeout (RUN_BUSY_OUT not set)\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = sc_mb_receive_frames(sc, msg_hdr, data_out, data_out_len,
> +				   &bytes_received, timeout_ms);
> +	if (ret) {
> +		sc_mb_clear_response(sc);
> +		return ret;
> +	}
> +
> +	if (rdata_len)
> +		*rdata_len = bytes_received;
> +
> +	drm_dbg(&sc->xe->drm, "SC: MKHI message completed: %zu bytes payload received\n",
> +		bytes_received);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sc_mailbox_send_command - Send command to System Controller via mailbox
> + * @handle: XE device handle containing the system controller
> + * @cmd_buffer: Pointer to xe_sc_mailbox_command structure
> + * @rdata_len: Pointer to store actual response data size (can be NULL)
> + *
> + * Send a command to the System Controller using MKHI protocol. Handles
> + * command preparation, fragmentation, transmission, and response reception.
> + * Optimized to move memory allocation outside the critical section.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
> +{
> +	struct xe_device *xe = handle;
> +	struct xe_sc *sc;
> +	struct xe_sc_mailbox_command *cmd = cmd_buffer;
> +	u8 *command_buffer = NULL;
> +	size_t command_size;
> +	int ret;
> +
> +	if (!xe || !cmd)
> +		return -EINVAL;
> +
> +	sc = xe->sc;
> +	if (!sc)
> +		return -ENODEV;
> +
> +	if (!cmd->data_in && cmd->data_in_len)
> +		return -EINVAL;
> +
> +	if (!cmd->data_out && cmd->data_out_len)
> +		return -EINVAL;
> +
> +	might_sleep();
> +
> +	ret = sc_mb_prepare_command(sc, &cmd->header, cmd->data_in, cmd->data_in_len,
> +				    &command_buffer, &command_size);
> +	if (ret) {
> +		drm_err(&sc->xe->drm, "SC: Failed to prepare command: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&sc->cmd_lock);
> +
> +	xe_pm_runtime_get(xe);
> +

Quick drive by comment - xe_pm_runtime_get can wake the device taking a
bunch of locks. Because of that, the preferred deisgn to take this at
outer most point possible (i.e., not holding other locks), so I'd
suggest moving PM get / put outside of the cmd_lock.

> +	ret = sc_mb_send_command(sc, &cmd->header, command_buffer, command_size,
> +				 cmd->data_out, cmd->data_out_len, rdata_len,
> +				 SC_MB_DEFAULT_TIMEOUT_MS);
> +	if (ret)
> +		drm_err(&sc->xe->drm, "SC: Mailbox command failed: %d\n", ret);
> +
> +	xe_pm_runtime_put(xe);
> +
> +	mutex_unlock(&sc->cmd_lock);
> +
> +	kfree(command_buffer);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.h b/drivers/gpu/drm/xe/xe_sc_mailbox.h
> new file mode 100644
> index 000000000000..d5ca43c40f1a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_mailbox.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_SC_MAILBOX_H__
> +#define __XE_SC_MAILBOX_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_sc;
> +
> +/**
> + * struct xe_sc_mailbox_mkhi_msg_hdr - MKHI protocol message header
> + */
> +struct xe_sc_mailbox_mkhi_msg_hdr {
> +	/** @group_id: Message group identifier */
> +	u32 group_id    : 8;
> +	/** @command: Command identifier within the group */
> +	u32 command     : 7;
> +	/** @is_response: Response flag - 0 for request, 1 for response */
> +	u32 is_response : 1;
> +	/** @reserved: Reserved field, must be zero */
> +	u32 reserved    : 8;
> +	/** @result: Result code from firmware */
> +	u32 result      : 8;

Another quick comment - bitfields layout can based on the CPU endianess
so prefer defines + macros to set fields if this used in a wire level
protocol.

Matt

> +} __packed;
> +
> +/**
> + * struct xe_sc_mailbox_app_msg_hdr - Application message header
> + */
> +struct xe_sc_mailbox_app_msg_hdr {
> +	/** @group_id: Application group identifier */
> +	u32 group_id  : 8;
> +	/** @command: Specific command within the application group */
> +	u32 command   : 8;
> +	/** @version: Protocol version */
> +	u32 version   : 8;
> +	/** @reserved: Reserved field, must be zero */
> +	u32 reserved  : 8;
> +} __packed;
> +
> +/**
> + * struct xe_sc_mailbox_command - System Controller mailbox command structure
> + */
> +struct xe_sc_mailbox_command {
> +	/** @header: Application message header containing command information */
> +	struct xe_sc_mailbox_app_msg_hdr header;
> +	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
> +	void *data_in;
> +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
> +	size_t data_in_len;
> +	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
> +	void *data_out;
> +	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> +	size_t data_out_len;
> +};
> +
> +int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
> +
> +#endif /* __XE_SC_MAILBOX_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sc_types.h b/drivers/gpu/drm/xe/xe_sc_types.h
> new file mode 100644
> index 000000000000..5ec2126cebe4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SC_TYPES_H_
> +#define _XE_SC_TYPES_H_
> +
> +#include <linux/completion.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_sc_mailbox.h"
> +
> +struct xe_device;
> +
> +/**
> + * struct xe_sc - System Controller driver context
> + */
> +struct xe_sc {
> +	/** @xe: Back pointer to xe_device */
> +	struct xe_device *xe;
> +	/** @mmio: MMIO region for SC registers */
> +	struct xe_mmio mmio;
> +
> +	/** @cmd_lock: Mutex protecting mailbox command operations */
> +	struct mutex cmd_lock;
> +
> +	/** @phase_bit: MKHI message boundary phase toggle bit */
> +	u32 phase_bit;
> +};
> +
> +#endif /* _XE_SC_TYPES_H_ */
> -- 
> 2.43.0
> 
