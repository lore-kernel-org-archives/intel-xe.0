Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C61C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 14:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188A510E35B;
	Mon, 24 Mar 2025 14:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2VqOSut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4456510E35B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742826720; x=1774362720;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zD5JGnLfdnkN7IdlFCU+JmprQkvVN+KlmHgkLg67QC0=;
 b=g2VqOSut7VNCsYKfrRwoYfoq2NunYSpEbxTvAAKbDulXexdbNtcBq0+Y
 153ENrQczdegGKExXp0chXMlVr26L2LP0+sdt+Iln5UFsCXt2iPa3EZLw
 C/VK7bj0ZVOh4PJusXOUQXLNvYNYzdVkUDf3LCZnMtrPS1CUz6NNO8HOo
 Ouj1ZdIKydZt93uNTZ7CvY6TKy/Z/SFNe9lge1bIArlsUn2Gg2qxZ++q3
 aSYCqOiAgebKZvm2i/IuJVRp6hNY5kQE0eC8W/d2ngqyT+Gesu2rJmZyZ
 +UK6YPBKmnFta7a7kL7mM8SNj2YIsvl7MjBIXSPYCaI6W3MeE+tVOTiEV A==;
X-CSE-ConnectionGUID: FeaQaJGeTIeKiguoputfEg==
X-CSE-MsgGUID: aV/fQW96Ts6PACZNymzpSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44222482"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="44222482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:32:00 -0700
X-CSE-ConnectionGUID: bhnbRdx0SsqW2b2aRIvBTA==
X-CSE-MsgGUID: +LFIS8nuS9SmGao8vu5Fmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124847203"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Mar 2025 07:32:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Mar 2025 07:31:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Mar 2025 07:31:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 07:31:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSmkROn6T5xKN83r2pCp8BAN4+EjsSpmztjs3w450GBH8fs5VpIWZuLKh+tkBAMUtv8qSQcp6ASgSCHq8aXG00yz11YxZPimpYQ9o1QosAdotLzVWQiPAy5b5Qyzvo5R1vGxSqf+8uNhrsHwGBJTNgElrYL0QQjGm/bn6ahhKaTdaqiAwwR7tHet8fy68nbwYFLp+vHZNFJ0E5JmO3sSJnpYRjQ3OgWBbr328FL7yaAyGKcb2B14s6BFDPkDvxS1cTOa0CotX9sx6CxO9Tmev8UHZzudk9JKSjlWL8oQd7dGgn/ATM3pBZBaYhEju4/i3JEEhvNkQQX3livdUUlLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMrkFDnQdj3ippx8a0IdAORrD5Lo/Ep8fmKvA0d46zE=;
 b=bGWx20ePpnLd/c6udh8yzLxaV3fAiD81nBwT7rrcrqSgPDHnVKygUWvO+2DI9FRZlvSsLw3bcRm2EDYDaqn9I3tYXC4mYA9Ib/NVoYipcoBgB6zNPna3mOebGpz2l7ZlM6VBU3KRNHHEa237kgJnfk4Ou5d8ATdWXrTdmdUssxcZPdOahpPLc2M8zG0hdFomOfJivBFMpddy9Ovurw6mKrfnTLugBvM6qG2k9YoA2QxgyTyrRAFm6iJIskGLB0s0wiy0s68lpLLOQkMb7e343OtpemnWLDNh30TlLfcNZJjNqPEtrlV6peVmEKAYmxcb1oR+GzIAZH5fDYkpqDWOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 14:31:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 14:31:53 +0000
Date: Mon, 24 Mar 2025 10:31:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 2/2] drm/xe/pm: Re-enable D3Cold by default on BMG
Message-ID: <Z-Fs1cIB9pW0WykB@intel.com>
References: <20250308005636.1475420-1-rodrigo.vivi@intel.com>
 <20250308005636.1475420-2-rodrigo.vivi@intel.com>
 <ke7ywxzt4agbdnhvonfewvzpwserzy5if4kwf3fofjtn3yifim@fd2dkpxoihnv>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ke7ywxzt4agbdnhvonfewvzpwserzy5if4kwf3fofjtn3yifim@fd2dkpxoihnv>
X-ClientProxiedBy: MW4PR04CA0072.namprd04.prod.outlook.com
 (2603:10b6:303:6b::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PR11MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 285d196d-2f9b-4f83-33f4-08dd6ae09f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3unp0pn3vSIu5tzow+yjXhydCdJBz6BSspDcAo0RXgQMELtyYMdFW+ppZ/hQ?=
 =?us-ascii?Q?6r0dkb3rqN2N+xOQVKu/feat3/kVosp0si37/Mu19jn5rtFSjpwu5dvgPu/4?=
 =?us-ascii?Q?rWuRnc9gRDoXi2h34MNTLvSaNSu7/D0tMDCWJ3HUv6ZnVxZrFcn698MOY9qh?=
 =?us-ascii?Q?UNuHSTwKZjwmANDPbmkV5EPJgjaLbHC8WRqKvCiJbd3AVmuww9wQFE8wEA6y?=
 =?us-ascii?Q?vD5cwsJKPpInGOjIVVUhwbNABWXVWd8iLSHJAfvLXFsRYSs7pGdUxz3aViye?=
 =?us-ascii?Q?uAwLoRJ0Vbf8KnbcfeDxxpqp7h1/IwKTFNrD35r6wlv7twLFMCwgDtSit3kg?=
 =?us-ascii?Q?dLr1XPq3aoDhWN5HlDN7qKjp9hRFhmNgRSMKjTuwEALclBlbJCgIlra8FJpM?=
 =?us-ascii?Q?lJgQxHodRZsuNJd+U0kSkzK5aMbW4Ut9DHMdyWzlsWoa+g2j9iyKI6RU/WK/?=
 =?us-ascii?Q?mLIBjeyMRWEm3LRQ88hgRLUr1CGySGyEvgisl8uqIlfeSOuBGe3yQhg2TrA/?=
 =?us-ascii?Q?d0gpkwhi6QreJG1XmzZzSEYwiU2HqJhd46pxh1JJmLZ5e2dXaBUperwfeOQ7?=
 =?us-ascii?Q?HY86hQ1puJx2Re3WyuKSra0tmaumAzGLTBY6UDoGtCMzbgGDFuKajSTlwUZN?=
 =?us-ascii?Q?vk1nruGByQL8Xk+fiBFPw15Bfuzg0BPdVf7ooO/VUdrXExZlRkPAHGiAPOrl?=
 =?us-ascii?Q?JV8N2UlNkrjesWVLFWLLuNFS+3cfrvKbpbJeagPe0Yze2pfL4Q2co3RhcCta?=
 =?us-ascii?Q?jahb52Eo/IGaSO6xqtmocwLrs2wjkodY3fGWU37T/zMCdwzq+SVkEGLsCk2H?=
 =?us-ascii?Q?VR4daiHMODgVcu9b/uw0IxUD3XaNGBUXlrwJZq2hLRLUolQK8IjRP6bjfvb7?=
 =?us-ascii?Q?bTQtraKxb1EqVyw+Jo7e4MDW5m+x+Utq8zU1uDuxp2z3FNfBM+NAbKv+RXhe?=
 =?us-ascii?Q?KPE+sY/ptRKVwg1ltYLVUEbSke+3+/zS2WccbQW2Xj94xxACtJE2jKKEjh+9?=
 =?us-ascii?Q?nVF90euV3zuYXrhdqArwEePyiYHK54YFCYI7R03a0qd1kP1nJ1joA6Ytfj8S?=
 =?us-ascii?Q?uzaOiLUm2r2WU/RPApPnBC+41asquIrbfdbA+SaQ/VdKIWnS4Osyg7p81zBa?=
 =?us-ascii?Q?4tnQgvqy6Ba3qk55rQqsT89BvseFq9a7OF+cn8F8vTfjBqbvdnDJgErRZvjP?=
 =?us-ascii?Q?GaXlEBoK3JP3JFeyasnTQcIqaLATQpfwAyyRBomxng1aKUJFsVecjWX/Ogxk?=
 =?us-ascii?Q?BR/XHr61ah43sIv5CBPDQLETJ7EmOXVMqtEraG5ubaFzOl6PthtzPtTlI80E?=
 =?us-ascii?Q?5yV5eXWfYPqeIiVGKZDKJHb8/QD+hfh7CEJX5d4+p/0tFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IZGNe1HNKuh6TFA/bvhByUeCcbg/ehQWB78wcIhQquGjT6ayf1WZ/aeDF39/?=
 =?us-ascii?Q?0ReYUriY9s8ufSzT96mbwdRBDgvgcO+C4yIO3FJvgeQtdVucQjQuoT0/1vIp?=
 =?us-ascii?Q?0MtySqtb2qArCiGeGpx3SM2eZ8b/f4epy3d7GmgkKjd6BJnQX0B5jjRGQsjj?=
 =?us-ascii?Q?K0oAaMPJhdOT3PDl+ft72FN48BdtwLbv1wERv2O49q/Yiqw2iPL1tXEg6XaR?=
 =?us-ascii?Q?3hWMQIvoj3XqwOIzLZ0LrseSkf6gByAJ2oc9Tnuco6y0uhfhhPYyjUW99U0Y?=
 =?us-ascii?Q?6sHZPZeg3+lnL8xChfihP1wZZipFJz2RnQU44y0UEP/TRBq3LV7iKukQVXN8?=
 =?us-ascii?Q?8m6HS2L86a+r/7pDOpAJZq73wyD/v93Vosxtc7bY+fvAWQYm3P5Ct6HoCJIl?=
 =?us-ascii?Q?ipl4qqX7D9EYc4WHG4ebVACJmAgQxtXxhBCcx2UVKQGxZy7Wh5sgDNaiOGvQ?=
 =?us-ascii?Q?zJWaEXkPk63mK1LjWlYzK5bjZb6o0PEEX/Szdagb/vsFxlktrJJeMVHEcmFj?=
 =?us-ascii?Q?rkue2IeYH0Qfen3aQ3vkeAqcB+ZQkRrYOg47rvgtSLQdU0frvtFSdGt2zQ/l?=
 =?us-ascii?Q?aiqVLvTRclyx5S7sc3688rDtBo1jHlSsW+lLvdNBx85g2ma3+RLWJ1dSkj22?=
 =?us-ascii?Q?Xy8kZuvxZFWXv0kt5YYr0xNtyrKV/M30DC2p/Mk0vb5TJ9knD65M3ieSOQu/?=
 =?us-ascii?Q?QmnmebhYDoVl7sFUpMmkDL9oQUrw7h5ch57dpgvtNGkwpUHzaHK5xohmTBY3?=
 =?us-ascii?Q?8/vtZim7HvRbOGk8kPmTdIDDRNaq1WkOR2AsOXXKXEevVFDUHvO3XmI7XUnE?=
 =?us-ascii?Q?x616W06QpifBtWAiXzqfSjfzFqh5/h7i+UH0Mawq7EWzS8iuRXfzRHyHRevj?=
 =?us-ascii?Q?AAqRf6s0Flx0nBh+GC2bXZ4DcwEJF5G7aP/uE3xNCP4+I24pJvOhgfVJLy6b?=
 =?us-ascii?Q?tbasHr2JLbigem169Oop+0pF9nfNbFd4ErAg04E8/0pJ7sC8nmtgWOlUCVRI?=
 =?us-ascii?Q?nb0uBWVe8QF0494dTY3p00orXzRhYDtK/fTyK/wa7gWWIZDOdogBn2RYsCqF?=
 =?us-ascii?Q?6h456LlN6DM9vAS8wBsBYluFHImZC2yeJqAeaLXhXSHE7pwCmNZeeCDmXVtL?=
 =?us-ascii?Q?b0WEau6Bw8IsLBHiJxCTR/M8D4aPRxPcHj3eBhJiZgttEtLnDTECi+W1NWea?=
 =?us-ascii?Q?fp15AjoNm9CxbGa6KQ+Jti4riBPEcpt4fU/nAj2INRuddqu09fNcCVJdWRXT?=
 =?us-ascii?Q?MzHf8FIoiRTSb1z6OtGGSOnOow9saYBeOJ1aMZM0at8i1FMfcawZ42SuREXu?=
 =?us-ascii?Q?1Lct7VXTUXKexVMaHnzLGISbNh4g+++VdKGptX5N57Dy19qvhBWmHFS3bt1c?=
 =?us-ascii?Q?5ttkVPHT455pZDE8oBzeApi7gMMGjya5pYkALIMYz9OWf+VzNhc2bQtyxwNj?=
 =?us-ascii?Q?K3RdQuTkE6/naaG74jzET3bc/7FbPt9/OFIrlsh1UuTI/+B8qC5Fx9hiP7jG?=
 =?us-ascii?Q?/YFE4n/TW7/1mYlJ0y+iUjZFQnC93gTJdcaKcbvizTESPxlDmDcsUV9Kr3Ya?=
 =?us-ascii?Q?soWXXPU8/jmAgvCUWU0urPM/c32DyWupRVM6T6bY3jXPrSBbgSU8WoEZINwG?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 285d196d-2f9b-4f83-33f4-08dd6ae09f4b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 14:31:53.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Su8rAXpvx1pPnTd7w7xCBbzdt8wUZhgoVyS1BKrLLeG7X2PcLAPK+HXu/i1n2EtGY27Te4lRqyXmM9kSIdgShQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
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

On Fri, Mar 21, 2025 at 01:23:25PM -0500, Lucas De Marchi wrote:
> On Fri, Mar 07, 2025 at 07:56:36PM -0500, Rodrigo Vivi wrote:
> > This patch re-enables D3Cold by default on BMG.
> > 
> > If issues on runtime_pm resume are seen and the D3cold->D0 transition
> > is suspected to block the device or cause memory corruptions, D3cold
> > can be disabled for confirmation with either:
> > 
> > 1. at runtime:
> >   echo 0 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold
> > 
> > 2. at boot:
> >   pcie_port_pm=off
> > 
> > Upon confirmation of D3Cold related bug, please file a bug to the
> > link below.
> > 
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> weren't you supposed to apply this patch to topic/xe-for-CI? I was
> rebasing that branch to be able to tweak the firmware definitions[1] and
> noticed there's only the first patch in that branch, but not this one.
> Did you forget to push?

Doh! that might be the case... pushed now.
Thank you so much for catching this.

> 
> $ cat src/integration-manifest  | grep xe-for-CI
> drm-xe topic/xe-for-CI 4868f2aad04f639490d35b90e1f9f73919078ffd
> 
> $ git log --oneline drm-xe/drm-xe-next..4868f2aad04f639490d35b90e1f9f73919078ffd
> 4868f2aad04f6 (drm-xe/topic/xe-for-CI) drm/xe/pm: Temporarily disable D3Cold on BMG
> 6ea369b34748e drm/xe/ptl: Define HuC FW version for PTL
> 9a67bf39ece1c drm/xe/ptl: Add GuC firmware definition
> 413e37a14b3b5 drm/xe/pvc: Add GuC firmware definition
> 57fbbc317bba7 drm/xe: Add PVC's PCI device IDs
> d8cfdbde9e7bf drm/xe: Enable SR-IOV for ADL/ATSM
> 
> Lucas De Marchi
> 
> [1] https://lore.kernel.org/intel-xe/20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com/
