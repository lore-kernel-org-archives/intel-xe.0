Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82941C3ABDD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 16:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D0B10E46C;
	Mon, 19 May 2025 16:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNlLhB18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450D910E3A2
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 16:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747672388; x=1779208388;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=faPbWnie1g8pd4R/l50C+u8qjhSZcqkVjmo8+QEMJWA=;
 b=fNlLhB18XBI9GIcS7czFfS1dFRWf9D2xBdX4D4iwWxvsVYsnFCjonDpH
 VcnDwIIiiVMhA0MiWz0tx3UjYVdriQ9GvK0ZzcTSwfqs2sZRdYmYhV8jv
 6WeRkU1FfBZEAGEVcco8lgX/SiebFVzH1c6TE9XOpQaaYV6/EvtxNzNCC
 QJ/BPNkYOjOYSC5JRVDfTOR2HeCQcfC/uUYV4oehqooSQRVPdpBW5gDUz
 n0UWF60/JVunPSyQrByltLID4DQ5uRx4xOVQDQ2Mh6o/6DdswDr3dBQyE
 xaWeVLtRmZLAQQdz0dW1zKGhu2XZNM51wQIuxd8Q6gnpj2OBZVBE4xdBR Q==;
X-CSE-ConnectionGUID: WuRDq1urQVuJO6ESaXo2xw==
X-CSE-MsgGUID: 6IpLFe/KQcKBpg0JbiFaMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60921827"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="60921827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 09:33:07 -0700
X-CSE-ConnectionGUID: uQYf8+QxTjS4DO789iJz5A==
X-CSE-MsgGUID: 8sTAuHZbQcOjU/1fna5G/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139259523"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 09:33:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 09:33:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 09:33:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 09:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4u5EF2qVnpI2ScdrxXTPefUnaPXd+MJI3y/UjchZvM2jdmFNkmDDHvVYF6vZpPcYudhHcgVpTQzFGSCpSMSi+oIwOruKRhFUHetrxh5KzNB//XSWVrnL67PFu3htBYxPP0PzMi1KOeKS6zuuG1VFKiEBQOzSpm5zBik/bRxjhgJ//264EHWcR34Szk5T7qL8eZkGn4yXj6ZjDN/0G18vAUs5xFlug87YRCdfC11QQKdWfPk42wVTVCIRDv0FqAbXhUovHF5XLHJIPi8DmZpW2GlMj8pzwO+27cCVEzqdC9nb7YBhjm70rRSXBfEeZrmC47NE28WYKkN4MXfh51NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC0pumR32i8zBV0LWP97zn7ElzUGboUZUnvJ4hl3GA4=;
 b=ClPQ0pqtdXLNrYeqzrp58uqf1nygOM7Zf0iT6clteUEsnCUeb8WT3FGtKt6xNT7XTTfX3mEnKt+w6QA9G1SchtRPdllZZhIPNenk+w6jGIBHT2E1bQzwt5Vz11HtZ9itzxagUptWkK3aUt5kJiJmNYp6QTeAdhJl0W4/QTWt7xxRfazAYHdnUyT0S+vH+0JL0D63FZNg+i/gUzxFM1Rjf3tV/nxQjQVE80u5kE+GV7XidQKoBHy3GKl5faaL9isvOD7Jl4s3xhg1LswRGLCQoKoTELYTnalcOntgDvXe2qg241xklI3Pwy2rXEAlGyqIDe/ZncLZumBL7M2iev1XAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 16:33:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 16:33:02 +0000
Date: Mon, 19 May 2025 09:32:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=2Fguc?= =?utf-8?Q?=3A?= Make creation of SLPC
 debugfs files conditional (rev2)
Message-ID: <20250519163259.GP5080@mdroper-desk1.amr.corp.intel.com>
References: <20250516141902.5614-1-aradhya.bhatia@intel.com>
 <174748395513.91026.17642620075252686675@c664b1dc75d1>
 <3e90c5c9-f0a6-4a0f-888d-c2da95f7b791@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3e90c5c9-f0a6-4a0f-888d-c2da95f7b791@intel.com>
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ae2a4b-3abf-4c85-e0ef-08dd96f2d2b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9XgP8uGfToYxejciNm1IP26qXvMhRhfWqn4xU/pDxaMrom4h4hUYmsAvUUZZ?=
 =?us-ascii?Q?UxHIGVp8GjnRsmpNJJq70Q/eSiNWjLYXv+SM+e/1Y2J57qNnCowrcixzQaxh?=
 =?us-ascii?Q?IWYIIDw/XHHI/9/dJ3leKBtXmDhDiL4sKnOyY0vv/x99CCk/qKKAwrI617ut?=
 =?us-ascii?Q?xNinbFTHgs4ZkMD6n0NH9TtslFYRpDD4DA12yRkiRWn75x26z2cfLHIRUy/6?=
 =?us-ascii?Q?JigXNkR4YJ04DEvli49SG8Zp37tDPPe05XDqdk4sRlavCT265qfzjZYydgAP?=
 =?us-ascii?Q?tJF3g+FgHlep3igryO8Xp+Jx5q8WiEpgGl7OzX/a2VXCVmSccI77umc1KNdC?=
 =?us-ascii?Q?IPmjOXo9MFc6t7rQOibh8jtyD/Wre82j3ly66TRPCyDqN/VQmYjCF3WY/uAE?=
 =?us-ascii?Q?wD8iMBcchUB5YDqFw3AGA9V1kEdiOKu/ydStOs3A/3WFtLdsVdNdSJcIxuL3?=
 =?us-ascii?Q?VxdY7W9LbuxrZTGel/bpjh+OMCPsJ3GX1Cev4O1MhDFYLig5KZlxIGmgMqUK?=
 =?us-ascii?Q?MEFf+oA9Bxd8mY+PV0o7Em979yA951Z7lkE7GoIriEvyWeC8o+DgZ8MxCgbO?=
 =?us-ascii?Q?jY/RoLfeR9wEFZeGTn2k5PTImr+lZk6b/9ktYpPcywmQZBlgGsiv0DrcKCQ6?=
 =?us-ascii?Q?lorqKHwI2YXBQFnqS0IzlkjzowSRFTNDDHkc2I6bnE74J4VS+FxJpcnxIX+Y?=
 =?us-ascii?Q?SXtnixc4XCMpYWktVKh+HdNmYgPXVR7nxWp3ke/uF+4JaJmlVxv8Azr5q1WX?=
 =?us-ascii?Q?o8gzM9j8M1/79S+RfLQlQP7azcgaXTlU4qg95AQPSglH1JWOfh0dqsUjVoCB?=
 =?us-ascii?Q?Y3dONQ8dC3Tz0sRKSC2pO1ywkrExJ76XoTUD3cgXKshXtKlQ609kk1T+rEt7?=
 =?us-ascii?Q?qwGbJsWrLaQgkHxcyioa8X6DMye3VnFiDkoWwSVbWN5eWkc5zFEO000LtPp8?=
 =?us-ascii?Q?ILSrUP1iNdeCaEKmvMAn8ePvTbmptCUMQnz8dITFBajutrFiJyMdtG4k/Ct/?=
 =?us-ascii?Q?4CzFj5HQdf9DjGXP2Q5s8DTuxBNDgm+SnZewjCPMnfVCx+Tc4U9NLz3Vvg9U?=
 =?us-ascii?Q?WvV8DMTn+zoE0qikULlpVYPEpFlE+Lxn3awwXki5eyxPJG+7U36CYFj0ogzE?=
 =?us-ascii?Q?PTKFEMgIyySV46qTuvL4Ofi01nsWmwGxnN1jngX11lwh11fiKT7nkTdZ396L?=
 =?us-ascii?Q?cosOkfCzPQyJWoZykZc+fadg4wlOtuCb6PKgCaCHkY1YOTqWqrh/M3VN6unV?=
 =?us-ascii?Q?ZFu9l/qOgnUBLvxOU1FBeNzdwvUQfPpbf7G/hydkeSC2EtC0oLOcD+1zcFP/?=
 =?us-ascii?Q?hVzJrVGYppEsevxSgc6rOSqRT921AkZsgI+2cHyTS5DcUxAem4sydEAWL0M6?=
 =?us-ascii?Q?131Su5k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ikLq31+HC3myWQvMemY16wlwny2mba8o3h2+mtKTPhq+5/LUzLMRwlU7+K+v?=
 =?us-ascii?Q?2PmWDVnZ8T6uSbGFQh6ifqGhCYHKkIpxx0BDg8fOSPXbDPsqRBVTt2m0UF/C?=
 =?us-ascii?Q?SbdOkN8i0svvvBhBlLjkhhJoS/2JkUULIga6jmDjI/E8HAS8i2+FJqB6wO3/?=
 =?us-ascii?Q?iymIeMljHKye30SHFJV5dStkpRhm3r/F5W5IKTdTnSUj5065urZuq+mCLng7?=
 =?us-ascii?Q?J4szWrYjtJsq5U7W/5u97KfW+p4BelZ1bfHBUfC/YunIXKC8FWZ0tgrw4XlK?=
 =?us-ascii?Q?ZGVHOilg+Y+ufQFzRKTX7tIjY6R+oFPedO5gk5Ai8OPYO4HWmyFjCDyVkIzL?=
 =?us-ascii?Q?4Gv3ketM/oVdIMR2PrOfU1W7tON6Zhz2fQTgxZVbVWtm7734T4NGXt0piKNJ?=
 =?us-ascii?Q?6vSFmiTF1FZBOQY9hJt8obWRLCbzaqQ32z+TB1hoTR0kwahP5kzIQoaYfi3V?=
 =?us-ascii?Q?EnyGkTgF7GlqGBOT50fA2HeD0mDJHL20ygcqEcuS16vyMpiuy1ubPkRHSpNd?=
 =?us-ascii?Q?74QYQE3p4HHfG3Ca5YjhPWNE1cmOQzVDB1TNT14NKvbVg3d/bAsJL/FfUZ03?=
 =?us-ascii?Q?Vfd5FTnXuSA8dNiWVq1c2bI6Grm7vqMUDFLrjhypWBxAmmBBtk/9Z91vW5iS?=
 =?us-ascii?Q?F3emUgN5lu7XThXvWnQ/1ImaLovKMNUapILHqamoVTBniJXNpY4P/2aqGl/u?=
 =?us-ascii?Q?4CdPy8qbzo/wWbR6nj5p9/e10Sh4NBJiIEcP3nZfZ3FSoC2VSRAUc+Ql4I0v?=
 =?us-ascii?Q?uC0cqyxdlXeUD4GtKLqjGTQdFCFuo1QR68Ihho9XHZ2Lp8NTAOt6xz4Jpsoh?=
 =?us-ascii?Q?YYyUx1C8QWKQyZUtbTWo0jmyPwlzpzrLqwxC6bf0hjEwK/mGi5Vkcf5uaepy?=
 =?us-ascii?Q?akSQq8eqfplGf8FQMYJt47kS9LkKArXEKN7MX3QkiwpC2g6jR5GbM63x4ZpZ?=
 =?us-ascii?Q?OWsBwh3QrCRRFR8o/Ka/ymQ+wnlZnIsJXzYlyuF3ddlv1dco6Xw3hjqCKO4r?=
 =?us-ascii?Q?esdDQJ43L1GvJ6Gh1A7ly/yDmSqqGMNkWHI9V7GcpBkvOnq8bKEbrudwmz78?=
 =?us-ascii?Q?RzGDl6XqoXjUD2yvX1jMr+QumwZroEGyTm+4jzqzFdqLJ7vyuEI82Q33YD36?=
 =?us-ascii?Q?fu/eLierkmLqXCqfqNQ9QIPGXTio5npssrfOCaJLRJxiHReIt8fRNgZhgA/j?=
 =?us-ascii?Q?NJ3Lkv/nb5a6eQbE2mp3MNEvI9reDy54ZboEfdP+XQLc8Yzc2d+RBu8CFK+L?=
 =?us-ascii?Q?bn2Jr3SeyeghxCgYnpU2D/HsxKWTWFaX6r8jK1q0JOc3gPTM0wDXPuxn4tUo?=
 =?us-ascii?Q?Ar/05+OoNH7VsC36nXJAycB4sW89ISSKFt4McMWCBR45oRylGVCz2VeiOItI?=
 =?us-ascii?Q?lLsr7rYgx3SYeXNmtq5EnWkTxGBmsM4GzIMv1eAKzUyYbzLyWfI+lUySvnbz?=
 =?us-ascii?Q?TXKNVV+Fwab/NxBQLoNaxen55u+vxapvZ+naYB9EkD8lIX4GXs6wia3KdZEn?=
 =?us-ascii?Q?R6m2ZO/yefr+gHq8j+xnsa2IJ0sat8n5WVA9aMIY2y1UZ3O4zBey0AI7Fcw4?=
 =?us-ascii?Q?ATljOtRVC9Jq6q/jipUojO7k8ujG7nk/hz+OanqPYX08ww+HJpYCH4uW0lZe?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ae2a4b-3abf-4c85-e0ef-08dd96f2d2b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 16:33:02.1511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZrSO0F1i4iTffWlx3gD0B1n7Os67O3evykN3QsjqBQPDV+nWAOqXKV/UXJjJoSnmti8xjT+IBuS90sBf80Imtb+z3PP5rTtYGXnm/bzrMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

On Mon, May 19, 2025 at 11:27:08AM +0530, Aradhya Bhatia wrote:
> Hi,
> 
> On 17-05-2025 17:42, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: drm/xe/guc: Make creation of SLPC debugfs files conditional (rev2)
> > URL   : https://patchwork.freedesktop.org/series/149064/
> > State : success
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2_FULL -> xe-pw-149064v2_FULL
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **SUCCESS**
> > 
> >   No regressions found.
> > 
> >   
> 
> No issues/possible regressions were found with this patch.

Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt

> 
> 
> Regards
> Aradhya
> 
> > 
> > Participating hosts (3 -> 3)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-149064v2_FULL that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@fbdev@eof:
> >     - shard-adlp:         [PASS][1] -> [SKIP][2] ([Intel XE#2134])
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@fbdev@eof.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@fbdev@eof.html
> > 
> >   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +2 other tests skip
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +4 other tests skip
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> >     - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543]) +1 other test dmesg-fail
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> > 
> >   * igt@kms_big_fb@yf-tiled-addfb:
> >     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328])
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> >     - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> > 
> >   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367])
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> > 
> >   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> >     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +6 other tests skip
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> >     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> >     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +230 other tests skip
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> > 
> >   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +32 other tests skip
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> >     - shard-dg2-set2:     [PASS][17] -> [INCOMPLETE][18] ([Intel XE#2705] / [Intel XE#4212])
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> >     - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#4212])
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> > 
> >   * igt@kms_chamelium_color@ctm-green-to-red:
> >     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325])
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html
> > 
> >   * igt@kms_chamelium_edid@dp-edid-resolution-list:
> >     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252]) +3 other tests skip
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> > 
> >   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
> >     - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178]) +1 other test fail
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> > 
> >   * igt@kms_content_protection@dp-mst-type-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2390])
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html
> > 
> >   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#1178]) +1 other test fail
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> > 
> >   * igt@kms_content_protection@uevent@pipe-a-dp-2:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][26] ([Intel XE#1188])
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> > 
> >   * igt@kms_cursor_crc@cursor-sliding-32x32:
> >     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2320])
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-32x32.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> >     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2291]) +4 other tests skip
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> >     - shard-bmg:          [PASS][30] -> [FAIL][31] ([Intel XE#4633])
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> >     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2286])
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> >     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1508])
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> > 
> >   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#4494])
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> > 
> >   * igt@kms_dp_linktrain_fallback@dp-fallback:
> >     - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#4294])
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> > 
> >   * igt@kms_fbcon_fbt@fbc-suspend:
> >     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4156])
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html
> > 
> >   * igt@kms_feature_discovery@display-3x:
> >     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2373])
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_feature_discovery@display-3x.html
> > 
> >   * igt@kms_feature_discovery@display-4x:
> >     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1138])
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-7/igt@kms_feature_discovery@display-4x.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
> >     - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#3321]) +2 other tests fail
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
> >     - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#301]) +1 other test fail
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
> > 
> >   * igt@kms_flip@2x-flip-vs-panning-interruptible:
> >     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2316]) +1 other test skip
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> > 
> >   * igt@kms_flip@2x-nonexisting-fb:
> >     - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2316]) +4 other tests skip
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#301]) +5 other tests fail
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
> > 
> >   * igt@kms_flip@flip-vs-suspend-interruptible:
> >     - shard-bmg:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
> > 
> >   * igt@kms_flip@nonexisting-fb:
> >     - shard-adlp:         [PASS][49] -> [SKIP][50] ([Intel XE#4996]) +15 other tests skip
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_flip@nonexisting-fb.html
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_flip@nonexisting-fb.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> >     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> >     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2293]) +1 other test skip
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +13 other tests skip
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4141] / [Intel XE#5042])
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4141]) +6 other tests skip
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
> >     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#656])
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2313] / [Intel XE#5042])
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2313]) +11 other tests skip
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2312]) +1 other test skip
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_hdr@static-swap:
> >     - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#1503])
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_hdr@static-swap.html
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-4/igt@kms_hdr@static-swap.html
> > 
> >   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#616]) +2 other tests fail
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> > 
> >   * igt@kms_plane_multiple@tiling-y:
> >     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#5020])
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
> >     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2763]) +4 other tests skip
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
> > 
> >   * igt@kms_pm_backlight@fade:
> >     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#870])
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_pm_backlight@fade.html
> > 
> >   * igt@kms_properties@crtc-properties-atomic:
> >     - shard-adlp:         [PASS][66] -> [SKIP][67] ([Intel XE#4950]) +1 other test skip
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_properties@crtc-properties-atomic.html
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_properties@crtc-properties-atomic.html
> > 
> >   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> >     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1489]) +2 other tests skip
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> > 
> >   * igt@kms_psr2_su@page_flip-xrgb8888:
> >     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2387])
> >    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html
> > 
> >   * igt@kms_psr@psr2-sprite-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
> >    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> >     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2330])
> >    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> > 
> >   * igt@kms_setmode@basic:
> >     - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#2883]) +2 other tests fail
> >    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-3/igt@kms_setmode@basic.html
> >    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-3/igt@kms_setmode@basic.html
> >     - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#2883])
> >    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_setmode@basic.html
> >    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-435/igt@kms_setmode@basic.html
> > 
> >   * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][76] ([Intel XE#2883]) +4 other tests fail
> >    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
> > 
> >   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> >     - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#1435])
> >    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> >    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> > 
> >   * igt@kms_vrr@seamless-rr-switch-vrr:
> >     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1499])
> >    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html
> > 
> >   * igt@xe_ccs@suspend-resume:
> >     - shard-dg2-set2:     [PASS][80] -> [INCOMPLETE][81] ([Intel XE#4358]) +1 other test incomplete
> >    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@xe_ccs@suspend-resume.html
> >    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-433/igt@xe_ccs@suspend-resume.html
> > 
> >   * igt@xe_eudebug@basic-client-th:
> >     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#4837]) +6 other tests skip
> >    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@xe_eudebug@basic-client-th.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
> >     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2322]) +2 other tests skip
> >    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
> >     - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#1392]) +13 other tests skip
> >    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> >    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> > 
> >   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:
> >     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4943]) +10 other tests skip
> >    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge.html
> > 
> >   * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
> >     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#4915]) +4 other tests skip
> >    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset.html
> > 
> >   * igt@xe_exec_threads@threads-mixed-fd-rebind:
> >     - shard-adlp:         [PASS][88] -> [SKIP][89] ([Intel XE#4945] / [Intel XE#4996]) +4 other tests skip
> >    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_exec_threads@threads-mixed-fd-rebind.html
> >    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_exec_threads@threads-mixed-fd-rebind.html
> > 
> >   * igt@xe_oa@non-sampling-read-error:
> >     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
> >    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-8/igt@xe_oa@non-sampling-read-error.html
> > 
> >   * igt@xe_pm@s2idle-d3cold-basic-exec:
> >     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2284]) +1 other test skip
> >    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html
> > 
> >   * igt@xe_pm@s4-basic:
> >     - shard-adlp:         [PASS][92] -> [ABORT][93] ([Intel XE#1794])
> >    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-4/igt@xe_pm@s4-basic.html
> >    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-9/igt@xe_pm@s4-basic.html
> > 
> >   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> >     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4733])
> >    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> > 
> >   * igt@xe_query@multigpu-query-invalid-cs-cycles:
> >     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#944]) +1 other test skip
> >    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> > 
> >   * igt@xe_sriov_flr@flr-vfs-parallel:
> >     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4273])
> >    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html
> > 
> >   * igt@xe_vm@munmap-style-unbind-many-all:
> >     - shard-adlp:         [PASS][97] -> [SKIP][98] ([Intel XE#4945]) +22 other tests skip
> >    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_vm@munmap-style-unbind-many-all.html
> >    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_vm@munmap-style-unbind-many-all.html
> > 
> >   * igt@xe_wedged@wedged-at-any-timeout:
> >     - shard-bmg:          NOTRUN -> [DMESG-WARN][99] ([Intel XE#3428]) +6 other tests dmesg-warn
> >    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
> >     - shard-adlp:         [DMESG-WARN][100] ([Intel XE#4173]) -> [PASS][101]
> >    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
> >    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-6/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
> >     - shard-adlp:         [FAIL][102] ([Intel XE#827]) -> [PASS][103] +1 other test pass
> >    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
> >    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> >     - shard-adlp:         [FAIL][104] ([Intel XE#3908]) -> [PASS][105] +1 other test pass
> >    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> >    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> >     - shard-adlp:         [DMESG-FAIL][106] ([Intel XE#4543]) -> [PASS][107]
> >    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> >    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> > 
> >   * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
> >     - shard-bmg:          [FAIL][108] ([Intel XE#2188]) -> [PASS][109]
> >    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
> >    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> >     - shard-bmg:          [SKIP][110] ([Intel XE#2291]) -> [PASS][111] +6 other tests pass
> >    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> >    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> > 
> >   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> >     - shard-bmg:          [FAIL][112] ([Intel XE#4667]) -> [PASS][113]
> >    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> >    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> >     - shard-bmg:          [FAIL][114] ([Intel XE#3321]) -> [PASS][115]
> >    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> >    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-plain-flip-fb-recreate:
> >     - shard-bmg:          [SKIP][116] ([Intel XE#2316]) -> [PASS][117] +4 other tests pass
> >    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> >    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
> > 
> >   * igt@kms_flip@2x-wf_vblank-ts-check:
> >     - shard-dg2-set2:     [FAIL][118] ([Intel XE#886]) -> [PASS][119]
> >    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check.html
> >    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check.html
> > 
> >   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
> >     - shard-bmg:          [FAIL][120] ([Intel XE#886]) -> [PASS][121]
> >    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> >    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3:
> >     - shard-bmg:          [FAIL][122] -> [PASS][123] +1 other test pass
> >    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3.html
> >    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-5/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3.html
> > 
> >   * igt@kms_flip@flip-vs-suspend:
> >     - shard-adlp:         [DMESG-WARN][124] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][125] +2 other tests pass
> >    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
> >    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
> > 
> >   * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
> >     - shard-bmg:          [FAIL][126] ([Intel XE#2882]) -> [PASS][127] +1 other test pass
> >    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
> >    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
> > 
> >   * igt@kms_plane_multiple@2x-tiling-4:
> >     - shard-bmg:          [SKIP][128] ([Intel XE#4596]) -> [PASS][129]
> >    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
> >    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
> > 
> >   * igt@kms_setmode@clone-exclusive-crtc:
> >     - shard-bmg:          [SKIP][130] ([Intel XE#1435]) -> [PASS][131] +1 other test pass
> >    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
> >    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
> > 
> >   * igt@kms_vblank@ts-continuation-dpms-suspend:
> >     - shard-bmg:          [ABORT][132] ([Intel XE#4979]) -> [PASS][133] +1 other test pass
> >    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
> >    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
> > 
> >   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2:
> >     - shard-bmg:          [DMESG-WARN][134] ([Intel XE#3428]) -> [PASS][135]
> >    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html
> >    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html
> > 
> >   * igt@xe_exec_basic@multigpu-once-null:
> >     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1392]) -> [PASS][137] +9 other tests pass
> >    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
> >    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null.html
> > 
> >   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
> >     - shard-bmg:          [ABORT][138] -> [PASS][139]
> >    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
> >    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
> > 
> >   * igt@xe_module_load@many-reload:
> >     - shard-bmg:          [INCOMPLETE][140] -> [PASS][141]
> >    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-1/igt@xe_module_load@many-reload.html
> >    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-7/igt@xe_module_load@many-reload.html
> > 
> >   * igt@xe_pm@s3-vm-bind-prefetch:
> >     - shard-bmg:          [DMESG-WARN][142] ([Intel XE#3428] / [Intel XE#569]) -> [PASS][143]
> >    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html
> >    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-8/igt@xe_pm@s3-vm-bind-prefetch.html
> > 
> >   * igt@xe_pm@s4-mocs:
> >     - shard-adlp:         [ABORT][144] ([Intel XE#1794]) -> [PASS][145]
> >    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-9/igt@xe_pm@s4-mocs.html
> >    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-8/igt@xe_pm@s4-mocs.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> >     - shard-adlp:         [SKIP][146] ([Intel XE#1124]) -> [SKIP][147] ([Intel XE#4996]) +2 other tests skip
> >    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> >    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> > 
> >   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> >     - shard-adlp:         [SKIP][148] ([Intel XE#316]) -> [SKIP][149] ([Intel XE#4996]) +1 other test skip
> >    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> >    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> > 
> >   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> >     - shard-adlp:         [SKIP][150] ([Intel XE#367]) -> [SKIP][151] ([Intel XE#4996])
> >    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> >    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> > 
> >   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
> >     - shard-adlp:         [SKIP][152] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][153] ([Intel XE#4996]) +1 other test skip
> >    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
> >    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
> >     - shard-adlp:         [SKIP][154] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][155] ([Intel XE#2351] / [Intel XE#4996]) +2 other tests skip
> >    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
> >    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
> > 
> >   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
> >     - shard-adlp:         [SKIP][156] ([Intel XE#373]) -> [SKIP][157] ([Intel XE#4996])
> >    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> >    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> > 
> >   * igt@kms_content_protection@legacy:
> >     - shard-bmg:          [SKIP][158] ([Intel XE#2341]) -> [FAIL][159] ([Intel XE#1178]) +1 other test fail
> >    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_content_protection@legacy.html
> >    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-8/igt@kms_content_protection@legacy.html
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> >     - shard-adlp:         [SKIP][160] ([Intel XE#455]) -> [SKIP][161] ([Intel XE#4996]) +4 other tests skip
> >    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> >    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> > 
> >   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> >     - shard-adlp:         [SKIP][162] ([Intel XE#309]) -> [SKIP][163] ([Intel XE#4950] / [Intel XE#4996])
> >    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> >    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> > 
> >   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> >     - shard-adlp:         [SKIP][164] ([Intel XE#323]) -> [SKIP][165] ([Intel XE#4996])
> >    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> >    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> >     - shard-adlp:         [SKIP][166] ([Intel XE#309]) -> [SKIP][167] ([Intel XE#4996])
> >    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> >    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> > 
> >   * igt@kms_dp_link_training@uhbr-sst:
> >     - shard-adlp:         [SKIP][168] ([Intel XE#4356]) -> [SKIP][169] ([Intel XE#4996])
> >    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_dp_link_training@uhbr-sst.html
> >    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_dp_link_training@uhbr-sst.html
> > 
> >   * igt@kms_feature_discovery@display-2x:
> >     - shard-adlp:         [SKIP][170] ([Intel XE#702]) -> [SKIP][171] ([Intel XE#4996])
> >    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_feature_discovery@display-2x.html
> >    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_feature_discovery@display-2x.html
> > 
> >   * igt@kms_flip@2x-nonexisting-fb-interruptible:
> >     - shard-adlp:         [SKIP][172] ([Intel XE#310]) -> [SKIP][173] ([Intel XE#4996]) +1 other test skip
> >    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> >    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> > 
> >   * igt@kms_flip@2x-wf_vblank-ts-check:
> >     - shard-bmg:          [FAIL][174] ([Intel XE#2882]) -> [SKIP][175] ([Intel XE#2316])
> >    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
> >    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> >     - shard-adlp:         [SKIP][176] ([Intel XE#455]) -> [SKIP][177] ([Intel XE#2351])
> >    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> >    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
> >     - shard-adlp:         [SKIP][178] ([Intel XE#651]) -> [SKIP][179] ([Intel XE#2351])
> >    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
> >    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> >     - shard-adlp:         [SKIP][180] ([Intel XE#656]) -> [SKIP][181] ([Intel XE#4996]) +5 other tests skip
> >    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> >    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][182] ([Intel XE#2312]) -> [SKIP][183] ([Intel XE#2311]) +15 other tests skip
> >    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> >    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
> >     - shard-bmg:          [SKIP][184] ([Intel XE#2312]) -> [SKIP][185] ([Intel XE#4141]) +6 other tests skip
> >    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
> >    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
> >     - shard-bmg:          [SKIP][186] ([Intel XE#4141]) -> [SKIP][187] ([Intel XE#2312]) +2 other tests skip
> >    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> >    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
> >     - shard-adlp:         [SKIP][188] ([Intel XE#651]) -> [SKIP][189] ([Intel XE#4996])
> >    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> >    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
> >     - shard-bmg:          [SKIP][190] ([Intel XE#2311]) -> [SKIP][191] ([Intel XE#2312]) +14 other tests skip
> >    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
> >    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> >     - shard-adlp:         [SKIP][192] ([Intel XE#653]) -> [SKIP][193] ([Intel XE#4996])
> >    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> >    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> >     - shard-bmg:          [SKIP][194] ([Intel XE#2312]) -> [SKIP][195] ([Intel XE#2313]) +12 other tests skip
> >    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
> >    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
> >     - shard-adlp:         [SKIP][196] ([Intel XE#656]) -> [SKIP][197] ([Intel XE#4947]) +1 other test skip
> >    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
> >    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
> >     - shard-bmg:          [SKIP][198] ([Intel XE#2313]) -> [SKIP][199] ([Intel XE#2312]) +17 other tests skip
> >    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
> >    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
> > 
> >   * igt@kms_hdr@brightness-with-hdr:
> >     - shard-bmg:          [SKIP][200] ([Intel XE#3544]) -> [SKIP][201] ([Intel XE#3374] / [Intel XE#3544])
> >    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> >    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
> > 
> >   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
> >     - shard-adlp:         [SKIP][202] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][203] ([Intel XE#4996])
> >    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> >    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> > 
> >   * igt@kms_pm_dc@deep-pkgc:
> >     - shard-adlp:         [SKIP][204] ([Intel XE#2007]) -> [SKIP][205] ([Intel XE#4996])
> >    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html
> >    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_pm_dc@deep-pkgc.html
> > 
> >   * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> >     - shard-adlp:         [SKIP][206] ([Intel XE#1489]) -> [SKIP][207] ([Intel XE#4947])
> >    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> >    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_su@page_flip-nv12:
> >     - shard-adlp:         [SKIP][208] ([Intel XE#1122]) -> [SKIP][209] ([Intel XE#4996])
> >    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.html
> >    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_psr2_su@page_flip-nv12.html
> > 
> >   * igt@kms_psr@fbc-psr-sprite-render:
> >     - shard-adlp:         [SKIP][210] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][211] ([Intel XE#4996])
> >    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_psr@fbc-psr-sprite-render.html
> >    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_psr@fbc-psr-sprite-render.html
> > 
> >   * igt@kms_psr@fbc-psr2-primary-blt:
> >     - shard-adlp:         [SKIP][212] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][213] ([Intel XE#4947])
> >    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_psr@fbc-psr2-primary-blt.html
> >    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_psr@fbc-psr2-primary-blt.html
> > 
> >   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> >     - shard-adlp:         [SKIP][214] ([Intel XE#2939]) -> [SKIP][215] ([Intel XE#4996])
> >    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> >    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> >     - shard-adlp:         [SKIP][216] ([Intel XE#3414]) -> [SKIP][217] ([Intel XE#4996])
> >    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> >    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> > 
> >   * igt@kms_rotation_crc@sprite-rotation-90:
> >     - shard-adlp:         [SKIP][218] ([Intel XE#3414]) -> [SKIP][219] ([Intel XE#4950] / [Intel XE#4996])
> >    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html
> >    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html
> > 
> >   * igt@xe_ccs@block-multicopy-compressed:
> >     - shard-adlp:         [SKIP][220] ([Intel XE#455] / [Intel XE#488]) -> [SKIP][221] ([Intel XE#4945] / [Intel XE#4996])
> >    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_ccs@block-multicopy-compressed.html
> >    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html
> > 
> >   * igt@xe_eudebug@basic-vms:
> >     - shard-adlp:         [SKIP][222] ([Intel XE#4837]) -> [SKIP][223] ([Intel XE#4945]) +2 other tests skip
> >    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_eudebug@basic-vms.html
> >    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_eudebug@basic-vms.html
> > 
> >   * igt@xe_evict@evict-beng-large-external-cm:
> >     - shard-adlp:         [SKIP][224] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][225] ([Intel XE#4945])
> >    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html
> >    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html
> > 
> >   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
> >     - shard-adlp:         [SKIP][226] ([Intel XE#1392]) -> [SKIP][227] ([Intel XE#4945]) +1 other test skip
> >    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> >    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> > 
> >   * igt@xe_exec_fault_mode@many-basic:
> >     - shard-adlp:         [SKIP][228] ([Intel XE#288]) -> [SKIP][229] ([Intel XE#4945] / [Intel XE#4996])
> >    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_exec_fault_mode@many-basic.html
> >    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_exec_fault_mode@many-basic.html
> > 
> >   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
> >     - shard-adlp:         [SKIP][230] ([Intel XE#288]) -> [SKIP][231] ([Intel XE#4945]) +4 other tests skip
> >    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
> >    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
> > 
> >   * igt@xe_exec_system_allocator@once-mmap-file:
> >     - shard-adlp:         [SKIP][232] ([Intel XE#4915]) -> [SKIP][233] ([Intel XE#4945] / [Intel XE#4996]) +34 other tests skip
> >    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_exec_system_allocator@once-mmap-file.html
> >    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_exec_system_allocator@once-mmap-file.html
> > 
> >   * igt@xe_oa@invalid-oa-metric-set-id:
> >     - shard-adlp:         [SKIP][234] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][235] ([Intel XE#4945])
> >    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_oa@invalid-oa-metric-set-id.html
> >    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_oa@invalid-oa-metric-set-id.html
> > 
> >   * igt@xe_oa@syncs-ufence-wait:
> >     - shard-adlp:         [SKIP][236] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][237] ([Intel XE#4945])
> >    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_oa@syncs-ufence-wait.html
> >    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_oa@syncs-ufence-wait.html
> > 
> >   * igt@xe_pm@vram-d3cold-threshold:
> >     - shard-adlp:         [SKIP][238] ([Intel XE#579]) -> [SKIP][239] ([Intel XE#4945])
> >    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-1/igt@xe_pm@vram-d3cold-threshold.html
> >    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> >   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> >   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> >   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> >   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> >   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> >   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> >   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> >   [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
> >   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> >   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
> >   [Intel XE#2188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2188
> >   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> >   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> >   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> >   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> >   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> >   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> >   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
> >   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> >   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> >   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> >   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> >   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> >   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> >   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
> >   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> >   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> >   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> >   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> >   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> >   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> >   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> >   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
> >   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> >   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> >   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> >   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> >   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> >   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> >   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> >   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
> >   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> >   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> >   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> >   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> >   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> >   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
> >   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> >   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> >   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
> >   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> >   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> >   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
> >   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
> >   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
> >   [Intel XE#4358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4358
> >   [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
> >   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
> >   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> >   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> >   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> >   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
> >   [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
> >   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> >   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> >   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> >   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> >   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> >   [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
> >   [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
> >   [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
> >   [Intel XE#4979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4979
> >   [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
> >   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
> >   [Intel XE#5042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042
> >   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
> >   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> >   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> >   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> >   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> >   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> >   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> >   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
> >   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> >   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
> >   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> >   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> >   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * Linux: xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2 -> xe-pw-149064v2
> > 
> >   IGT_8365: 8365
> >   xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2: 6d2dd85ba4eb3df89dc816c03b5bf81a470865b2
> >   xe-pw-149064v2: 149064v2
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149064v2/index.html
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
