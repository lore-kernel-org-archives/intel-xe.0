Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF92D597A5
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FC010E0BA;
	Tue, 12 Nov 2024 20:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNoGxa8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000BF10E0BA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731444380; x=1762980380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HBR1k/d4L6g5OXuP8NZWwZN//4D7BXehZkWP/M47OwE=;
 b=PNoGxa8AnQjZKVojRLZ6i7++JDuy+cRMqip/YgpAcmhUdlnp0IBZu9KI
 YkTsThrOGR0eFG/X0YI8z0Clp0pp2XHfpFWTu4qLkjhM0z16SqLHFTaSO
 p8Wu9k3zqZ6F+s6TFLiET3xA+SQgLckq6iGSl3fDzWiFWHAu8tve3lM0b
 CDm65FZHEyMAsfzvkdqroFbkVFdriCWyO7C9nB2q/PcRh9K4GmsmY4Q5F
 KD0XeW5FnCKuMYqY4Xujg7CijTgia6JpPdyohyv4TjUAy/8L/fygBp/V6
 BvpuFFuElrB0/AOL2USXLLUE57jtEXDgMHa3eJBXXu/9JAgCU4CYthOYA w==;
X-CSE-ConnectionGUID: lYpZLZM3S86MUqaH0JWLyg==
X-CSE-MsgGUID: 3oUI3wwGR4uKgrdQTBvt6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31535018"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31535018"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:46:19 -0800
X-CSE-ConnectionGUID: 1+Yq85FJQpiL6OKW6C5aSw==
X-CSE-MsgGUID: EAkFFfTFQwanyaS4fOQycA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87618233"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:46:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:46:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:46:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:46:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGqn2ddtgunq8QLDVr6a2CHvOXWj9y0QvCpITELZwYSrS8D6pNU62bcNpj9QW1RDPZoy53ZnE6+GgqZ5mg2sUYX9ZXDEaGCKQxbcHgbsvsd1qJzZ39VPflRQXSBHTwSmNCky1GD+QaWIS5kebvFV0SqeclcEB7y76cBuPI2wmj9Dgw4ipg3txX/rGmtRMEfatr4THEnBjPSjOr+sDbT6ai2l7Th7vyVtCGNR/jAjmXAPZxA/1j+SDSuJveaFAvKdFZs9LlldtYv69IIdu/0HAZj3byvPV8l0DBtVTHo12x1ILPIEONTtkJHqkA4b9WZ+l2YCYWLY/F0tHMeMx9SU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U2R+6D3DzLC6L2YIWNbGTmQwtiNuLDVYckT4xulGxk=;
 b=Q3Xo/lOIwDVXhJRuWW0kx3JDt35dz1KStwBXDnbihvVJ0y7RJEvCODKI2R554kdlAa8+ZiIPmaXDO+BW2CL/A+xJNQP3k0nPaoXe1JBFukRB/53BFaRxyuja2mKaCbK6bqM1CwVnWXmxSZVFPEqihN6hT6PxJLI+ktCcM6gMB4v3eNtQO3lI8p+7+Ta2iupm1jH/e9e9P8KzFcpqFFebxIwEByGPfO4QJiD1/u0xqa6/UUAQ5dx37C8AEwU4+33Ew5ASh5ypv6wg0ckjCYYi/Eh9TTQlkJU+0MTlKKRIdanxV5Az41vGLLFShcxepzcfPBnQCzQDkBlZCQ9cL2B5qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 20:46:13 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Tue, 12 Nov 2024
 20:46:13 +0000
Date: Tue, 12 Nov 2024 15:46:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Message-ID: <ZzO-kV7niWsIOiHC@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9d829b21-4327-4cbf-ad72-b3e47d57fa74@intel.com>
 <ZzOb3FtRFAMAQzt3@lstrano-desk.jf.intel.com>
 <CH0PR11MB544468E5716752CB21F19C2AE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
 <20241112203006.GJ5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241112203006.GJ5725@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:303:8d::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: 3729dc71-5a88-4b5b-53a6-08dd035b0bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FjWLkurqe+VaBXv1HgJ7vCWt21Prd7hhRJ3ajT8nn1xD55e7imOjQBPtRE7q?=
 =?us-ascii?Q?3luZzg71NrJ2qjDPvuQBVUGYrh4I1/s/X0kG7SyMKcSGTeujctoCSzaG5tUy?=
 =?us-ascii?Q?bfHRP/0gIFQrAXrgZmqPm10e+oPFzLy156z2vLOHw/pA52JonA2/NViLwJnj?=
 =?us-ascii?Q?t2Y67E9Sx5jBeyfN/D5b+cto81CFt8uY2I732RdI/PvYkZSUA52oWOWNl6Cm?=
 =?us-ascii?Q?5rOzLCTjfn59toL9UqZspFGvDv/Cdc0RUuAe1E1UWbDUXQmMCXqGX8/rg9ZT?=
 =?us-ascii?Q?5CsRvGTCEfnIpFo1AXN2FEttDPmROUrKvfUgbUuFie8EZWBCwhB5JTy26YCp?=
 =?us-ascii?Q?Oo7DaxiP3Y0mrCZ/8AatHZiKT4e+wquCtLH6GIrwRNrG3eU44KHGJ3wJuto9?=
 =?us-ascii?Q?+hZiq5EVqO54Htkg4hCi7cRZ2Khr2IZAPxURMvw9nw8z+Z5y6LVDPoLKFMOO?=
 =?us-ascii?Q?2udPSgrSLLRzMYoFP+T5iqh4+8BF8snjXdIsJagheqveYy3410NQkyZ8LCSs?=
 =?us-ascii?Q?TCNSizPCg+4p9qqfh/NlhmGNCNnWm2Oxuhe6DWo97+GZmOZRzk0FMqzj2lYp?=
 =?us-ascii?Q?eBPGsRl88eu7VBAtN9lFpC6BGbxapE3j/lrtmUruKDVC1Rd8DLM53v+tRNqs?=
 =?us-ascii?Q?4UaF3VKjwSioWyhvZl/XnQFS2b+tFW9BKSq+uQepqUg10ntxN1KAIfIcByl8?=
 =?us-ascii?Q?AAe138NzKBGTHkt2WHi9wLGSJoUoad2NhrjThc2Lkw7V3tBcE1nn+PA1YjMk?=
 =?us-ascii?Q?iNLTDifTxQOHzULu+t4Vt+7sHTAAcWXPnZAZtcIxGitZPV7vx9f9SUSZw9nl?=
 =?us-ascii?Q?TW6oCuDwuIS1h7XjUxYLPvEm3SIU0cM3HQ4z4vA+VIGCVN5j/SQWkLFOqzCp?=
 =?us-ascii?Q?j3x26i8ElO5/HbMApTlTxtjKivYQMKh8g7TpL2ANQ+0HG9GVAvMmY5VC08zs?=
 =?us-ascii?Q?tZx1av5VdtmAwW38//4e88w65vkuFj6q+RNQntMXnMyjjGSSfBnJmxlj54b9?=
 =?us-ascii?Q?DkHqDz/PudE9HLbaB89JvFmLlVxqtf76Z5xfPJYsseRkk4NDdE9pg2v0s+m/?=
 =?us-ascii?Q?KedO7mwXZwbPnajiQk4+uAWqJZkrPtSMyuE03eZkuVjaSzK6y+NtBTIiWgKJ?=
 =?us-ascii?Q?QF4c5C72ZcRZD4vclxEyggI9fxeUjzTCsMS3k40uiYB2i1bwo/iIISiGSGqx?=
 =?us-ascii?Q?MGuRkAiRBqOJzaTpEzHrXzVHDHenBwO3IE0QsuuWuohd5p8qtua/q2XhjY20?=
 =?us-ascii?Q?5vJBtuBxWFla6TYn0HmMvLK2vjtW0Doq6Tpnofaj+dxDgy50Lo3aUq7KNyy4?=
 =?us-ascii?Q?Hag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/0guL4QLIPd7XcE276AZlMr55P+JfOuHnhJnMEgv3Pe67ggAQV6+8Px8ytvk?=
 =?us-ascii?Q?YsQYE45hopQsc63ca9amdv4XAE6ptOP94YZQJtWVL1c/MIHFOwVNPyBaY0XJ?=
 =?us-ascii?Q?d1VOOu8G6P4Rno8dBXCko5l1Ocxbluq/KI8YojvX9YUIPgMlPBeHkc020aTz?=
 =?us-ascii?Q?DEkVIs680b+CnumWbEgzu6oX6eFIx7yYKAOthCXVkNCgSXLPgIIxgsqi+gQs?=
 =?us-ascii?Q?NlYKSMec2fe43nYmgUim2cwCDFCTKOHBDMfeYZGrWatXPurtnJnk+LwzoUdQ?=
 =?us-ascii?Q?XtRE5xjNEiZqsRSobP4Y0aqHozWQNQWzxZpKHlyTzTcYMZ+9fxpz8FGvwlYK?=
 =?us-ascii?Q?xIdgkXrtCSiu4Hyj1Hkn5siTosR/heXpsNNX2sc6CD+eFtGHayqYyoYTGuD/?=
 =?us-ascii?Q?oGAlv6TZedrycB4II0VYkOo15+mkLXORDY/2jNLOKCEjHVk62WYq1LklnT7x?=
 =?us-ascii?Q?b+MoaAZVIVCcuTwMYq+mf5r/RuTZLtLjC0N+/zpGBpH34LJX8ANiKse1QzSc?=
 =?us-ascii?Q?s8UoXRfaqN/Y/u0y4UHLmMx8UxpsG6zSkhwtHromRY/LB0p3ijdxMo/C5ks4?=
 =?us-ascii?Q?5Oi33DOzhBm/lgKsL+cC2lBnA1UQ18EKNudrlfX24rHML5FMZ3CzFiLs3ElC?=
 =?us-ascii?Q?k0cfwOzcLpSPPHEMqw1FONOIqY+4yvAxcwlz4yaHXjZ9bTUs5i2FRuTCg7aU?=
 =?us-ascii?Q?J7P1QdkxhnGzcPsK0sGpqP+pBeU8qzFGZRuu8zE4iUyihd7MANxffs2LuXTl?=
 =?us-ascii?Q?5wRZBtaoQcwJDs2/3pwCt1hdDT7hSvE2tJI+5I2m2Xv7ZsQ6lVWPkfaxAvC8?=
 =?us-ascii?Q?YmsjNH3i8ZGcRFs1ZycUJopMZM0vk1M6ajfEeFzzEatIotPJj4sTiLFTk4Dz?=
 =?us-ascii?Q?TrsXZfKE9pWnaUbRKrShf+G/Vw/r2EtCVhWqLIqNU5+4RQWRyN0gVySk91hI?=
 =?us-ascii?Q?EPnirrPpotujrW8y8zZuh5ooSFWAroHSb9pcxYjAxyFsc5gScEmQieHiZe98?=
 =?us-ascii?Q?lbXJplePDzj6tWio0N7AZRz+382dSGNxA/oQaEdA9C3nLuYIBSybQZHbskpx?=
 =?us-ascii?Q?V+5AjCd+N9r8i9Qw6EwdfWgADLYphGcKbG+hJSOQxXg+slZFczy7eiyZ0pLZ?=
 =?us-ascii?Q?mKPiSN0UjJ/hWl5FzmFLpG+u/uIpgTQaQo1aMSBNwysmMyfh/AA2bBqe7Q3c?=
 =?us-ascii?Q?nv9jFxmjus+lGeQGMaN91uxLZxzo855CgwcRQRHEuWz/D3STcUaZ8jAJIA5T?=
 =?us-ascii?Q?aKTgI9gclw9sNXIzKb4P+aMtQgKLlzc181zpc2N9Q9LC2M+LZ4ty1KPjsC7/?=
 =?us-ascii?Q?G71QpJaYyGeN9ihfTcs/Jvs0yaVZSifK5IxJFDGndhzD2bB8M5TPIRDadlKk?=
 =?us-ascii?Q?MP7QhsOHMxZh7g0CWOzf58DGe9TaCJon1cfQppy2lIV/TO7IzVpNlOwp1Rir?=
 =?us-ascii?Q?FxyXw/8AaKDvWz7acDKLtCKjEz/efPLMBjGiuwE62sJnEKS/MV8JyaHfIGuz?=
 =?us-ascii?Q?WCShWaMHiMffThuU7TlQGfQJVOrkSPIgIr8LJPtdirYT7wBY7C+JSPie6Ti5?=
 =?us-ascii?Q?tyibJMZHS34LzKeFc4T41HuGo4rfAjggLaM1p89q2YiUxHugGb0EwgUrzVgL?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3729dc71-5a88-4b5b-53a6-08dd035b0bce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:46:13.4084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gmp/KhMqw3fZbZTEZKrMFiUPjcKKbmx3k5RuAjI7yqIL1h6ZYUduyIFcItNwnfO7Wz2RwWKTqNSflClPJy7r8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8434
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

On Tue, Nov 12, 2024 at 12:30:06PM -0800, Matt Roper wrote:
> On Tue, Nov 12, 2024 at 12:16:46PM -0800, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com> 
> > Sent: Tuesday, November 12, 2024 10:18 AM
> > To: Harrison, John C <john.c.harrison@intel.com>
> > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > 
> > > On Tue, Nov 12, 2024 at 09:59:16AM -0800, John Harrison wrote:
> > > > On 11/8/2024 15:34, Cavitt, Jonathan wrote:
> > > > > -----Original Message-----
> > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > Sent: Friday, November 8, 2024 3:10 PM
> > > > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > > > Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > > On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > > > > > > Sent: Friday, November 8, 2024 9:43 AM
> > > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > > Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > > > Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > > > > The ring is currently in LRC BO but this may change going forward.
> > > > > > > > Include the ring address in the snapshot protecting again any future
> > > > > > > > changes.
> > > > > > > > 
> > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > LGTM, though the terminology we're using to describe the various ggtt addresses
> > > > > > > as "descriptors" is a bit confusing, even if it's consistent.  I wonder where that
> > > > > > > terminology came from?
> > > > > > > This is just a rhetorical question.  I'm not suggesting it be changed.
> > > > > > > 
> > > > > > LRC descriptors is name copied over from i915 and may even be in the bspec.
> > > > > > 
> > > > > > But yea, indirect_state_desc and ring_desc are bad names. Will change to
> > > > > > 'ring_addr' here.
> > > > > IMO it would probably be better to leave it as "ring_desc" for now as it's
> > > > > consistent with surrounding struct members.  We can do a pass of the full
> > > > > XE kernel for inaccurate uses of the "desc" qualifier in the near future and
> > > > > fix the naming scheme here as a part of that fixup.
> > > > I strongly disagree. Just because A is broken doesn't mean we should add a
> > > > broken B and C! It makes no sense to add a name we know is bad just so that
> > > > we can change it later. Anything new should be done properly from the start.
> > > > 
> > > 
> > > I agree with John here.
> > 
> > Okay, I submitted a patch to change the name from context_desc to context_addr,
> > and it was rejected because context_desc is actually correct.  But if context_desc
> > is correct, then would ring_desc *also* be correct?
> > 
> > Pinging @Roper, Matthew D
> > -Jonathan Cavitt
> 
> As I mentioned on the other thread, "context descriptor" is a formal
> hardware term that has a very specific meaning --- it's the 64-bit value
> that gets programmed into the ELSP.  The context descriptor contains the
> various things inside of it, including the LRCA.  It's documented at
> bspec 60419.
> 
> The problem today is that the capture code is using "context descriptor"
> as a name for something else.  We need to decide what the capture code
> should really be doing.  If we want to capture the true descriptor, as
> used by the hardware, then we should fix the capture code to record and
> dump the proper value.  If we only want to capture something else (e.g.,
> the LRCA), then we should rename the fields for what they actually
> contain.  But we definitely don't want patches making statements like
> "context descriptor is a legacy i915 term" since that's just not true
> and will confuse people who read this in the git history for years to
> come.

I liked the variables named after address better. But I totally agree
with Matt Roper here. Plus we cannot break userspace. There are tools
out there already parsing 'Desc'.

> 
> 
> Matt
> 
> > 
> > > 
> > > Matt
> > > 
> > > > John.
> > > > 
> > > > > 
> > > > > My RB still stands either way.
> > > > > -Jonathan Cavitt
> > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > > -Jonathan Cavitt
> > > > > > > 
> > > > > > > > ---
> > > > > > > >   drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> > > > > > > >   drivers/gpu/drm/xe/xe_lrc.h | 1 +
> > > > > > > >   2 files changed, 4 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > > index e219657535cf..afb0f4f44748 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > > @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> > > > > > > >   		xe_vm_get(lrc->bo->vm);
> > > > > > > >   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> > > > > > > > +	snapshot->ring_desc = __xe_lrc_ring_ggtt_addr(lrc);
> > > > > > > >   	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> > > > > > > >   	snapshot->head = xe_lrc_ring_head(lrc);
> > > > > > > >   	snapshot->tail.internal = lrc->ring.tail;
> > > > > > > > @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> > > > > > > >   		return;
> > > > > > > >   	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> > > > > > > > +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> > > > > > > > +		   snapshot->ring_desc);
> > > > > > > >   	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> > > > > > > >   		   snapshot->indirect_context_desc);
> > > > > > > >   	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > > index 9d64cedc4d14..a2058a501353 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > > @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
> > > > > > > >   	unsigned long lrc_size, lrc_offset;
> > > > > > > >   	u32 context_desc;
> > > > > > > > +	u32 ring_desc;
> > > > > > > >   	u32 indirect_context_desc;
> > > > > > > >   	u32 head;
> > > > > > > >   	struct {
> > > > > > > > -- 
> > > > > > > > 2.34.1
> > > > > > > > 
> > > > > > > > 
> > > > 
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
