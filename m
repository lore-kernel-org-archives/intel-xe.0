Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BAEC3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 14:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAECC10E802;
	Wed, 10 Jul 2024 14:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCFYJJ7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9024910E803
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720623211; x=1752159211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oPdQFKEK/dwOzcmkzR4Eg3ozr74F4dzaDpUrWAQnhGY=;
 b=JCFYJJ7NjeQ7Mm7dcE7r1koB0O9jTNGOFc0siRsqBnPGnVVjerJ3rayt
 3OrWHl+bw+U4BxHIPkzBsVXsteSfrbgG/YY7Do0nDjOLYAv/lRYzkOu8t
 CejEmcDGolhVh5ZrI9t1G1Bxq2eAV8gFkfYpBsFwalwIv8FQmLrLpQAM1
 ZK7DBKV6w/gyjJY2N5zmacFzTJmWps1txOndixBNJr0QG4X3nU6WawYbd
 jjexx9ME40nbjkVtMRi/IUaQEFUzbSS2k5UcLpQ5yLCEn4WWukRsP6ihl
 Od4oDbsoEPO3NeRg2kclzKELFW8/UH5ngCmOwJb9ICOLeFMZgomdBjlwl A==;
X-CSE-ConnectionGUID: R3mFn7rXSHWi82cN0Ysdyg==
X-CSE-MsgGUID: Smmv7U7rRcOQRXUH2XNBzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35484646"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="35484646"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 07:52:46 -0700
X-CSE-ConnectionGUID: Et2/igZLTmqHQqREGESilg==
X-CSE-MsgGUID: Vnowz/6/TXOdAL/hHzaZlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="47989787"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 07:52:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 07:52:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 07:52:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 07:52:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQNvVnFGD9Uah1FSyS6MmtFgbBbnHVYYzfx3HU+IoatvTkdUZ551dkTxr7iMFyLQyAM3UvC0n0XUyY4WoUI5OO7Xqk1BaaMxYN4CGayWyE0dMR1wIiOE/LdSp9JdLWSiCXdfBOF3y5mHk0t7ds1D0YC8/emz5Gi1sfCVa3i75erp0akpgmdaEx1eu38LF7sDoww57LPrEvzsIQoTt1p3lebJ+Nf08vCCCYaNzKFYbAD/eN4OgnkkOl1NA49nA5JicgOyLs8wYkJuxJuMOfIwBth5k3peJ1lxhokXPPhucbwYexDHjMM6KFrFUEesL7d76rHfBeZ+uvgLa8kbzIWeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+xUWup5MIDF+PQnOOnNjxg151qUNy+oiFfoBEFjLdM=;
 b=jKnVM1WQJ1ZPdGXoXu22OS/u5/uE57s5egecs1pvRFtmLurQ/1yKEFmly9Uhb0dIL8ga1yv9GfxBzynMdRJjDJ/+TtQXAUV95iVrf4KxIE7f5i2NfSiV6Ayc09LEHj1/6yeOYPsXkZX9zjYVqICY77ZfdzSuey992ifbt0ItHXnByzV6DlROOJ3gO0FZB1DYT4sP8WkkC81AwaJt5URBgw+Me7z4Mjj57BJB7VaryNziX44dKbVKBzXCzak/J2u94llvCnGHk/nF0h/KnBDzOG+LigMTI4Gb4EJSG4Pw/dain46sax4D0geKh2hRRscd5EW2gEsqJtW00RhXSbZZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Wed, 10 Jul
 2024 14:52:41 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 14:52:41 +0000
Date: Wed, 10 Jul 2024 07:52:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <fei.yang@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Expose EU width via topology query
Message-ID: <20240710145238.GD2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240710055440.1985620-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240710055440.1985620-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CY8PR11MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: fddc78d6-f3d2-48d8-07bc-08dca0eff323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UXInTeLWkCIcTBoS1KxxpBsvr1iM3Qle2uYzvC8yX+w/g1yAY4xexJvo/qHS?=
 =?us-ascii?Q?z/RRHUcSOnmSbzks2CJ9qluVITQ5ESMKRypMlrBoDtV6ifxqFw5x3qnJEIzC?=
 =?us-ascii?Q?7896TXrOTQTkc+l/iWA4un7VbxAin6eNWSf7h8csmGQUSZlkEC8Ic5KyUuXs?=
 =?us-ascii?Q?FdTv0oBRxiLZROsLR4CxYbxYyynoYYYokAxcWtAUL18sHY4JEAIWZCRLi7Dv?=
 =?us-ascii?Q?pVygXbkWmS5gl49gXJeiNJ3lMXy5CXb+sNJizFlGM1bL4B7P/qROurH+XeLt?=
 =?us-ascii?Q?Fv5SGkRIrbnxAAzvZJ0C1CVsE0NEMcs1MQbEG+qCc5qOjoa27wPujc6L4Ix8?=
 =?us-ascii?Q?JH6Ddn9dE+gNk6NeekqjYc3D8Jgxe+n0rHmxlJxVOZMFn4R83Kc9nAPHRNRS?=
 =?us-ascii?Q?tHDe9C8k9RQSDSg+TrGxxBEbGWgMCpLLDGI9ScRnCNsoRa9aNzAg+P7NIUo7?=
 =?us-ascii?Q?5ace753vYXq1cJDQMs2qT9RMsnvVLAU9q+mhJOnhOYifE4tDyi9ErnpeKdrz?=
 =?us-ascii?Q?e4ihf4qbIC16JoarR6uqC+ABOZPJNN1BpvQR2sHzuDmU44If7CXQuYUz4Z4o?=
 =?us-ascii?Q?ONs9m3CxBx0RiH2ga6oqUyRPU54uuu/9eCIDo8JQnHDao0zA1q/E+xdGe06m?=
 =?us-ascii?Q?i1bGn89GlQv4R9Dhauio7VZ0V+9QDSdXXxpy/q1eyXITousUoCJg5eCXjaBm?=
 =?us-ascii?Q?nLRGvCMltOBrGLW/alhFjoCKaYdq3PtVmpFO+P5zaJ6xU83zvKrNTGtE4yrm?=
 =?us-ascii?Q?dXrrH+gQ64DmOaQJx6jiPS+dV6q4oCUEBX37cEegEQ2ef1xyUCZwzyjgE9IW?=
 =?us-ascii?Q?the7I1U3K/3OcVaFrSDYDaqh07IXwEjD+tiGzmTF6Mh/nBkuInn0gX0D37x2?=
 =?us-ascii?Q?uDUl1lIhk8VOg57tkC2F3W59X+wPQvRGvle8jYfRspX9K20aeRUtzmHvPbur?=
 =?us-ascii?Q?vCh7oDG0zNFytr21fr+M+QyKo93ndB7mvES+nNULYXEbN4RBcKaZFFYTYcPP?=
 =?us-ascii?Q?G76XGBy+c3N5TPru+JVwqaLV/dc7W5OR4NkVUQRHelXTja1k4OcsZqlYvJDM?=
 =?us-ascii?Q?PU5aSBfvohDm2+3nWWKiMT398kW72OaTtuSDCsxs+Z35910Zhwl8GTPu16Jc?=
 =?us-ascii?Q?UNCh73HwSUUqRWHGv4P776ne4gPXZ4iLGPtxcS752emvXlZuWFcW6qdIFCY9?=
 =?us-ascii?Q?s9CTI2KfQr8rb2lwzDcJIADOGUGVJFepKM/6+q2kL9lu9MyiZsDYuii+4RtD?=
 =?us-ascii?Q?DNpPefdzbhosgxkX56GPBIEmCTrPf23/04ayOt9GtLm0tS52eQUKXqnbJNmB?=
 =?us-ascii?Q?lD0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yt0hjt0kIZikzwHFlntzepxi6b3gbRbdPLsH3q2IXasMe/yEKflUuyIp6Ki3?=
 =?us-ascii?Q?VLY4rA6FlDaUDDEXZMwTslEE9w2C1J/scqwigRlRxV7Rc++kSz9HtCdGMyJK?=
 =?us-ascii?Q?SMbSw3B7igPUOb2X4HOvLBTGabvI7/h3t6sgfmkXP2XJwxZ5xu7ztKVmcATf?=
 =?us-ascii?Q?zJK31jhQE/N1x+T5oU/JdCNk6UQND7DApdGXOddUxZ3PAQrpyPtGIniyzkI6?=
 =?us-ascii?Q?a8RsX6AZVo7JNevvQWNgwloO3n0sJh6Ot0XIhC4JnWQu4hIfLwW0Mk4M1pz2?=
 =?us-ascii?Q?94rFbEBQ7gwo1Bfi+8y9c+kH81duLOhXySY3vhc0xx8uqDAv55rS6BcS1VCG?=
 =?us-ascii?Q?r4wOlcDcdhk0SQbNS91hfwtG4uYlYXjlY7celd99oPc6KSzQd+D/OWmOWW/p?=
 =?us-ascii?Q?uiCyANMYkqscxJ++SMLnkaAuRzypIhiIS0JQsOQcJvQ28NvE2UtR7EMF0t5W?=
 =?us-ascii?Q?c/p9OwLOnYeaDoKfm+ixEsYadVC0Gfx6BCLvKV5+YrkPEsKYs1cTAh6MXvfL?=
 =?us-ascii?Q?0oRZ51Mwrx+0kizIzz/3HeTj2zNl5lx2/NGbVKoo4Pg7WEDXbtdoDMHDCepv?=
 =?us-ascii?Q?0KZPNh0gNgTbodqHdeWpP1caCWYkfKjgbJst6sDR+iglhJ/yWEjtPdS1aY0A?=
 =?us-ascii?Q?3RhcqWclDE559VJQn0ZWjcsvpShjIEXMqyusYfAEvCP5199dvbSqzhOs349s?=
 =?us-ascii?Q?zx/ah9FpfuTw8RKauUdcD4xxSvH3XY/eHWBbB7jg/Y1hqlTmxjovwCPpoJ/8?=
 =?us-ascii?Q?lTKmFjnKLwNvF1QKI+95GsRViyj2YTXfAVp9P9nbkXpMqvwhraZ5tGWc0abo?=
 =?us-ascii?Q?DoU3MX6GFQvJpLZFQFGjw+/vht9w7X4TeQE8yPiAUKFJyR/DdkcGQQWUvA8M?=
 =?us-ascii?Q?t4Ovd5pxv4QfiNWI35t2obEsQyIRVto78zeHB8JkXYmvzTe0C2VJ9juEWHJZ?=
 =?us-ascii?Q?XkxMiQXtPrPEzqKiD9QLirUTU0zq9pNedvzzOEsRBjSkRVeu4ToFSvQut+3N?=
 =?us-ascii?Q?P8IDvmIXd/UQ411gpqDoK73jf1wOsajrXQ/PCiO/NhvUvE4cja1I6AaztqDZ?=
 =?us-ascii?Q?PBfJBXVnGV3lWL1A25baGYn+QFt/hwnT/umtIBymVyHbk83j8BZdh0dRqIhs?=
 =?us-ascii?Q?tgLeprQK1pt84ecrLceB7hOLmAmJZ7iPG+7yPqauJjzkkkYkZI65sEGH9XzJ?=
 =?us-ascii?Q?ro56I+hp+UWPEaBVmPqqwlW1JVYnDiYV3D8ugyaJa8oAxgxGMBOqm7cktoKW?=
 =?us-ascii?Q?1y7fxOLKfU64TndWxcujYKitmdEp/jhT6qqyFFsiBmmUQpj86ctNvlJhqlPw?=
 =?us-ascii?Q?SfBrFmr7IovJb0IImMmrJbHcycnE9j2TJns04fpFBjNIrcs6AP10pASO/Lt9?=
 =?us-ascii?Q?T+k6FuLanFgSnj52qMn8xthXQswjMmnAIvgtCWWHSi7Y/Akree17bSuulQ8e?=
 =?us-ascii?Q?isueQHfgvX+wU9t6tXzIQ7W3QzzsGc46BRcfMjIdeZZGw853v8Ka9AFpSKPD?=
 =?us-ascii?Q?MWiRvR4kkKrDcp/yUxF/H3DycWoRslZvd7AX95anoQ+oo/dsXiqK0934bxki?=
 =?us-ascii?Q?DRipsh6kAFPYyX7SAIJZoNXplnQt+UCfvWolI2RKlPUXku4FRsMmzmzxlB8u?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fddc78d6-f3d2-48d8-07bc-08dca0eff323
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 14:52:41.7893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqiN6uP4HHDhZyvZQ7h0m93SCaAzio95ahh/98Kf4aE9Oqa3A+98V3GlBw051+JD1kFoF9elUrLneq6tXmJmasucmp5Zff/4Cs6zyglJbLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
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

On Tue, Jul 09, 2024 at 10:53:54PM -0700, Lucas De Marchi wrote:
> PVC, Xe2 and later platforms have a 16 wide EU. We were implicitly
> reporting for PVC the number of 16-wide EUs without giving userspace any
> hint that they were different than for other platforms. Xe2 and later
> also have 16-wide, but in those case the reported number would
> correspond to the 8-wide count.
> 
> Add a new item to the topology that aims to clarify what the EU_PER_DSS
> mask means. This new item uses mask[] as a single u8 value. Xe2 and
> later platforms start returning the number of SIMD16 EUs.

So it looks like your patch is adding a new standalone "EU type" item to
the list of masks returned by the query.  I.e.,

        - DRM_XE_TOPO_DSS_GEOMETRY = ...
        - DRM_XE_TOPO_DSS_COMPUTE = ...
        - DRM_XE_TOPO_DSS_EU_PER_DSS = ...
        - DRM_XE_TOPO_EU_WIDTH = {0, 1}

I think it would be more natural if we just didn't include
DRM_XE_TOPO_DSS_EU_PER_DSS in the list of masks returned on new
platforms, but instead added a new type of mask that would be returned
on the newer platforms.  I.e.,

   Old Xe1 platforms receive from query:
        - DRM_XE_TOPO_DSS_GEOMETRY = ...
        - DRM_XE_TOPO_DSS_COMPUTE = ...
        - DRM_XE_TOPO_DSS_EU_PER_DSS = ...

   New Xe2 platforms receive from query:
        - DRM_XE_TOPO_DSS_GEOMETRY = ...
        - DRM_XE_TOPO_DSS_COMPUTE = ...
        - DRM_XE_TOPO_DSS_SIMD16_EU_PER_DSS = ...


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Tested on TGL and LNL to check the behavior in dmesg, debugfs and ioctl.
> Test-with: https://lore.kernel.org/igt-dev/20240710054446.1985069-1-lucas.demarchi@intel.com/
> 
>  drivers/gpu/drm/xe/xe_gt_topology.c | 13 ++++++++-----
>  drivers/gpu/drm/xe/xe_gt_types.h    |  6 ++++++
>  drivers/gpu/drm/xe/xe_query.c       | 12 ++++++++++--
>  include/uapi/drm/xe_drm.h           | 20 ++++++++++++++++++++
>  4 files changed, 44 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 25ff03ab8448..55ae1c79048f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -31,7 +31,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  }
>  
>  static void
> -load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> +load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, u8 *eu_width)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
> @@ -47,11 +47,13 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	if (GRAPHICS_VERx100(xe) < 1250)
>  		reg_val = ~reg_val & XELP_EU_MASK;
>  
> -	/* On PVC, one bit = one EU */
> -	if (GRAPHICS_VERx100(xe) == 1260) {
> +	if (GRAPHICS_VERx100(xe) == 1260 || GRAPHICS_VER(xe) >= 20) {
> +		/* SIMD16 EUs, one bit = one EU */
> +		*eu_width = DRM_XE_TOPO_EU_WIDTH_SIMD16;
>  		val = reg_val;
>  	} else {
> -		/* All other platforms, one bit = 2 EU */
> +		/* SIMD8 EUs, one bit = 2 EU */
> +		*eu_width = DRM_XE_TOPO_EU_WIDTH_SIMD8;
>  		for (i = 0; i < fls(reg_val); i++)
>  			if (reg_val & BIT(i))
>  				val |= 0x3 << 2 * i;
> @@ -213,7 +215,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XEHP_GT_COMPUTE_DSS_ENABLE,
>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		      XE2_GT_COMPUTE_DSS_2);
> -	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_width);
>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>  
>  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
> @@ -231,6 +233,7 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>  		   gt->fuse_topo.eu_mask_per_dss);
> +	drm_printf(p, "EU width:            %u\n", gt->fuse_topo.eu_width);
>  
>  	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
>  		   gt->fuse_topo.l3_bank_mask);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6b5e0b45efb0..71b4834080f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -343,6 +343,12 @@ struct xe_gt {
>  
>  		/** @fuse_topo.l3_bank_mask: L3 bank mask */
>  		xe_l3_bank_mask_t l3_bank_mask;
> +
> +		/**
> +		 * @fuse_topo.eu_width: EU width - SIMD8, SIMD16, etc. See
> +		 * enum drm_xe_topo_eu_width.
> +		 */
> +		u8 eu_width;
>  	} fuse_topo;
>  
>  	/** @steering: register steering for individual HW units */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4e01df6b1b7a..82c966b73302 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -455,11 +455,12 @@ static int query_hwconfig(struct xe_device *xe,
>  static size_t calc_topo_query_size(struct xe_device *xe)
>  {
>  	return xe->info.gt_count *
> -		(4 * sizeof(struct drm_xe_query_topology_mask) +
> +		(5 * sizeof(struct drm_xe_query_topology_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> +		 sizeof_field(struct xe_gt, fuse_topo.eu_width));
>  }
>  
>  static int copy_mask(void __user **ptr,
> @@ -524,6 +525,13 @@ static int query_gt_topology(struct xe_device *xe,
>  				sizeof(gt->fuse_topo.eu_mask_per_dss));
>  		if (err)
>  			return err;
> +
> +		topo.type = DRM_XE_TOPO_EU_WIDTH;
> +		err = copy_mask(&query_ptr, &topo,
> +				&gt->fuse_topo.eu_width,
> +				sizeof(gt->fuse_topo.eu_width));
> +		if (err)
> +			return err;
>  	}
>  
>  	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 19619d4952a8..6114a9064849 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -491,6 +491,19 @@ struct drm_xe_query_gt_list {
>  	struct drm_xe_gt gt_list[];
>  };
>  
> +enum drm_xe_topo_eu_width {
> +	/**
> +	 * @DRM_XE_TOPO_EU_WIDTH_SIMD8 - EUs reported with
> +	 * DRM_XE_TOPO_EU_PER_DSS have SIMD8 width
> +	 */
> +	DRM_XE_TOPO_EU_WIDTH_SIMD8 = 0,
> +	/**
> +	 * @DRM_XE_TOPO_EU_WIDTH_SIMD16 - EUs reported with
> +	 * DRM_XE_TOPO_EU_PER_DSS have SIMD16 width
> +	 */
> +	DRM_XE_TOPO_EU_WIDTH_SIMD16,
> +};
> +
>  /**
>   * struct drm_xe_query_topology_mask - describe the topology mask of a GT
>   *
> @@ -518,6 +531,12 @@ struct drm_xe_query_gt_list {
>   *    containing the following in mask:
>   *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
>   *    means each DSS has 16 EU.
> + *  - %DRM_XE_TOPO_EU_WIDTH - To query the width of EUs as per
> + *    enum drm_xe_topo_eu_width. It always has num_bytes == 1 and the only byte
> + *    in the mask being the value. For example, a query response containing the
> + *    following in mask:
> + *    ``EU_WIDTH    00``
> + *    means the EUs are SIMD8.
>   */
>  struct drm_xe_query_topology_mask {
>  	/** @gt_id: GT ID the mask is associated with */
> @@ -527,6 +546,7 @@ struct drm_xe_query_topology_mask {
>  #define DRM_XE_TOPO_DSS_COMPUTE		2
>  #define DRM_XE_TOPO_L3_BANK		3
>  #define DRM_XE_TOPO_EU_PER_DSS		4
> +#define DRM_XE_TOPO_EU_WIDTH		5
>  	/** @type: type of mask */
>  	__u16 type;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
