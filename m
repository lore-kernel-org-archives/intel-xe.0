Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B32C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 03:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB7B10E252;
	Fri, 11 Jul 2025 03:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvvdaAGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908CD10E252
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 03:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752205916; x=1783741916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FpQnIlo+LRBEehQ3zw09HPohqFMYK2wg3+m4QK1bmAM=;
 b=bvvdaAGpmksUmnBIHWVizwXJb79jofTGElxCTzgLQA1COPh/+4/oAjh/
 16bukWwcacou4KfkhOa4JtdtQk8UI6Sbccimr6IXW9Xz5age6YuBrWYyY
 ge9ptei/naaSBurzdB3iWtT9PCcq/RusfkBIHlydg3o4m/tf3mkiKIOQa
 AMC2V4RQQ9sVLjqXniYw+eJVV/Cucfe5w3tbqNLM80SjZpdLS3Wo6CX0A
 7o3wXHbQUlhsn4bZ69pwd6OSLHnInf+240XXNIDf0qdtQos2PhU0TdAd7
 XNxNgxyovsXmhT6QJc3Qk5SuXrq46fu5t/8e45nYS/P2ejyIcMAEhtV5m A==;
X-CSE-ConnectionGUID: byZsbH9XSg2fb8vbaKS4Fw==
X-CSE-MsgGUID: FD7zYICeRPeCuLatU9Dz3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="58263567"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="58263567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:51:55 -0700
X-CSE-ConnectionGUID: XSCpPvUhSiSIB9uUDvPIVA==
X-CSE-MsgGUID: ZeUrh8FwSu2MaTujOnT4FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="160281569"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:51:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:51:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 20:51:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:51:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7UwdhmYQDvDcH6zp6bONuEk6prvZdUNuCpJu3fvUYQOFpUnIRcBnl8b8xsL0OYKRgZGHKGIV0sku1n8l8tiBIKd9lXiyLVhro2/ZVLj3dKO/Llgf7C/l8WMlfOBzGLcW067daTFLcyC3eshSLv1RoV26kSHt+Z5f5EaATfhXjjWcp1Cfdup5qhGHNyAI406vm1e6FBzrTylUFbnEhpBt/8LUIRUtXZFhSTsDdNupbDWmtprsbZAJn9l0nA8MMvDTEkNkO+u1IkPAREb8vJh77/EQSYUUgOMg4/g3KwjNkEk/yM2wjm9PKDkIB30d9q4khshSIDRyVDmoECaKL4sQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuAzFkqE217KM3m5bo8lvmiUC+MvSGnQK5WBfhqzT/c=;
 b=lExnhClX5u+zD1hVekn4rzn17471wpZ2sAwFqWhO4759R9HHcojWWIZD+7xpjhPF5eX3gFsqKP8Ww1haTlnrXus9FVKAJ3m1cDQHB1QlgswfxAYn2Q44cgIEXR5Dc16TV8gOGc9KRKxeiUdJc1Ye98qNks9VFwqTR8ChgKEY68AevQobgvfzsdFOFDeD1CCA6H8Qe9vYUkoo5RpWqnL16VaqvTLLe/aYAem43/Wj+eE5PKdXCk1FXTssNDjug2GFw8orngx048UFmdPDBQiPTvERgkQicIPPfs7/DK7F/8S3Ez9lakSUR54g62DzdjZ6s16HK3F+OvUFJyQkS9Z7/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7495.namprd11.prod.outlook.com (2603:10b6:510:289::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 11 Jul
 2025 03:51:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 03:51:30 +0000
Date: Thu, 10 Jul 2025 22:51:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
Message-ID: <aaepdqcgr43bh4qe4glxrt5xl7qibhb755dnl57h5ek4a5o2op@bkv2rtqpwkz2>
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
 <20250710103040.375610-3-jakub1.kolakowski@intel.com>
 <IA3PR11MB93048A26541D42075C6B2D37AC48A@IA3PR11MB9304.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <IA3PR11MB93048A26541D42075C6B2D37AC48A@IA3PR11MB9304.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd589c8-86c4-4a73-e4b6-08ddc02e386a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DsRLkeiItcrvb8RD2F9AoBwcPlGI7vPMRCngB2bmgvBFWVuLeXVFmjg4218O?=
 =?us-ascii?Q?y7zNvnrjg9XQp55SKfC54vEBoXaMZCGjUd1rNEo4KFq6w6VmAT473qmCcRW9?=
 =?us-ascii?Q?ZN0IPxIyAu/jSkChnlyUyzK+QBNAuVZsTMtpESkXQNjXSM0csI4IahtX/GCI?=
 =?us-ascii?Q?924ZmoRs7dzAoZ8Ri2sUTpfD4z0qYfeG9/+rnxWjVzVGsifFzPgpWU+yQnxK?=
 =?us-ascii?Q?3+3SpE6f9NvGgP8y7b9tfxtJS7Ok6dp1xgdutRB1VBg7ztBFac2EbfidR9Gc?=
 =?us-ascii?Q?YAHULsnabVOkEGpZrutA6AOYqov0ohXtLJNbnyzNV5S6RfJciokoMiQAYidm?=
 =?us-ascii?Q?esgSD1oE87xnQV9gx/s3Jb3+XG9gfy/yhV/J/RcQsIdNSyoUGW+tXNwhei2c?=
 =?us-ascii?Q?JV5cjWfFvupADoSNIT3+iWLRiwttCAjIJXh3GqW4V4DcMhqIFJ7pmFsYilso?=
 =?us-ascii?Q?YogTVWXI/AsMiI+fokqFJ6+PtyagM+3YkpbrTGp76uO5cN49xoxjMSNXFCPt?=
 =?us-ascii?Q?7NuhACyxKfRCJwimNBto7xxtVX17PEyp172MjTalCU1pkzSY9b7bIDJ2avcC?=
 =?us-ascii?Q?lpquUSKj3KqsFJaVul6cfxBjVNhgtksb5I+ghiE8XsYKniLTBvj1q4AKDtmJ?=
 =?us-ascii?Q?7Zi7UXeHnORpwMDHHiyHb1hXBbwMwbvE6NT1LwB6XpRDwG4f4hFWtevz0Tt6?=
 =?us-ascii?Q?bvy4Y5QXyMSUWNeNXg4nQnapwjeCkHlBfmwQDdIe+xCCGdWKxUaIdCFoORa3?=
 =?us-ascii?Q?iAgrJpFWrpqjmfkJrSohJ70cswCy19IukDvPX7uqS5EiYLod1LPEleWkT1x+?=
 =?us-ascii?Q?91DbiN9gmxIjTq1y4A58NRsrx0/sPLtlym2ritOG4vNr2NiywxuGzus9cSKD?=
 =?us-ascii?Q?3LLI+cbEn5Qo8sqO+ePSOR2aFGyOXPcP9Gf7ZcO5D2TsZzoXEw2ga8uql5Qq?=
 =?us-ascii?Q?QAsOsz/emp8S4QP1y+QTcNiGRN7O9x2aXNhvq6GiWfnirNWc9MZRxG0UQ66C?=
 =?us-ascii?Q?ttUDWmyxmXJeX+Bz7LdyTq/ny6eR1QkvvdqyXmX6ejXRwNkFPmLJBmxYgQhP?=
 =?us-ascii?Q?jRYNPTa2Hmo3/pLdzh2zjZahxza/ag6/ynfZf8SfHvL8+btgEKxe4JbX5aMP?=
 =?us-ascii?Q?zUjpjS+O2zpWR24NvFFdh3/2FXgZxYU1ZMWiVN0RH5A152wwlwj/l7gzO7iE?=
 =?us-ascii?Q?peyBGAYnrY3YeARrmDoVYr9zjBvTCVKTqkyAtcGX6G9u/2Cf5h1+P0cuXlVP?=
 =?us-ascii?Q?/H+rCmVRgxEFnarDC/T+D0f3zlsHNY7S4lOMs2EeADybVACqH9UebqXkmXYP?=
 =?us-ascii?Q?bsFUzaA6Ctdi3C48focVOpLnWFEeFcmceEhGmSedRkceKOJY3WofbZ9Avou+?=
 =?us-ascii?Q?a49RW06K1fM7WE1PtlvmLKhPKs/XM6Pwz8jssPh1lvRUZE0rG59hw7C4rUFD?=
 =?us-ascii?Q?6MK0vRNayes=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oumYHnN2/cxg7KUZct4QAXH/nsrJtpWBdO/vwmj8EQL5VUoHJmUNxpj1DZj2?=
 =?us-ascii?Q?ORiGAKlCKv7sBh8dumLes5MuOjXXNko9AQIBDqwYfaeKJ66ID3hvwBGWkRly?=
 =?us-ascii?Q?BUK72lHnwSu71CIf/ReACTYD1IxEUJHBq5xNUDBhNNb2Yg5i82xWl+f+vldU?=
 =?us-ascii?Q?ASOAjEXJCnyOsMAql5sinJldVTpssMHbUUouSYTvn7OgpebZkjQPnxRSQqqI?=
 =?us-ascii?Q?l+/m7ivo5j90gmlnDQRYe6OIKRA32qV7e7w9CuFM0IX/OiVhBjwUcGXeEKBr?=
 =?us-ascii?Q?AjV4W+STm5eAgLTGO8UkhsPjTnKF04Y9Df0RwxtQ49JYAvtLhkJanel1iAl9?=
 =?us-ascii?Q?JloYtTaUQiwbERi8UgLaVahr+KWa3hsRF6/IRWdJwWgMf9OtwdEhLz8GYPoZ?=
 =?us-ascii?Q?Qbwkpnpc3UzMpnSzD66tjSqN97KsyWbOGyM3ZMUtywR8yh729n/fqODj2iNV?=
 =?us-ascii?Q?Px34jZwuV3jkxA6QQ58yxuwAbr8vKO9bySfphWw5SIeTCZGE0h/ALOWqj8ex?=
 =?us-ascii?Q?j5s0dzLKQLavHrhr0Glgw9fYD9SQxbqYN8qncfQEI4Zqg8714NA335bDJa8c?=
 =?us-ascii?Q?DBWbK1m0FxBvCgGuNAMPLstdCdjtT7NJZmWyAEf3K+ClMsPU4+LhsPffv8wO?=
 =?us-ascii?Q?mbL2yfRVvCWwZA9h0lT82q9FqMEdVRHMq2ZssV6ZZ+gpme37dLYvf0QyaoHL?=
 =?us-ascii?Q?DGdizrg4cRd6aUhvZmuYuw+1SoPHQQ5IQBjYkd8+Ly/CJ2pUWkhb373GdyUx?=
 =?us-ascii?Q?5qr4UxLsfxtziUuQzCGmteFjUitk0Ul+1lJg8Z9TsrRfFVpG/Rq7D0ffYsTq?=
 =?us-ascii?Q?5lBmJsoUInxjv0NR11KsMZWwa+Mhy+O5vlc+AYOdqG+uCf01G/IZpF2sAwrU?=
 =?us-ascii?Q?O5hMMj8XPsSEPQbKW5DC85jHLxXwqeTXvr1WyzpA8Y2gCaLlzUvIcluuw4P0?=
 =?us-ascii?Q?f8YmnrkFWG5V0IPQPnCuk/A2wPwB5oyuh1ebTBrOTTkeNq86uuY7Mqt6xyBH?=
 =?us-ascii?Q?4dYJra8MWCWMxnHB0i9TvGDpygLyEnwgldzmnL24F0cadG5hdlowU9Ph2Ioh?=
 =?us-ascii?Q?aQf8VKrNaTfaCxodpDUc1HeLJMXSucAXstTbn7p4XCOM9rhUnxU+Nop+KZO1?=
 =?us-ascii?Q?bZXL/+HGSN2yEfamnsyJYWsBF7GD2psYqDG9YG5Fiksnw7M83BVAhhb5QY0j?=
 =?us-ascii?Q?n9EQuPoXnmCN8Cp9rdR5wWQKbvHKofxcrZsoLqDzEnrLFuTXdw+G7I4EglAm?=
 =?us-ascii?Q?GampKSZDGan34JxRaxxMmIUBS7s/pzIXkeFv5zgJMUmd/Nna5MQ3+wtBthJT?=
 =?us-ascii?Q?tSsm9Jd3nFPfFuc1CjJOWjEoR5R8DwPI9CzaWwc614BkPlQ9ltihvVrhWn+/?=
 =?us-ascii?Q?5TmvgHl+gnppoRHDcRkzzSOk+jwG/BcCAGOqmkMXK8XpyCvTGQImMkkLd5Lo?=
 =?us-ascii?Q?C96snzoGZP6c0CcivEqdOI2TXmc4G6Sqb4NiPbGuv2sgUJwFFSABVS8cz4Ns?=
 =?us-ascii?Q?y6WmBCxuIyBw5vMdN1Vww/Xmow6doKF+Mjx50emWfu8oW9HRgDAZ/krEUj4C?=
 =?us-ascii?Q?IEkE4fK8MVlWq4j0mqM0ksQcGZkG6e6BKxjJC/8S9RkxIG35riyx32+whNvb?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd589c8-86c4-4a73-e4b6-08ddc02e386a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:30.5974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPYlV00DTtTTEk/oLscndBffcRvEn+ZLN9bGLynorWHRkEwl2paZMuql+mPluVqIT9aS80NLW9weyxtIJlMuqqX5AVDon+qp2pqHfrZ2/68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7495
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

On Thu, Jul 10, 2025 at 03:52:31PM +0000, Kolakowski, Jakub1 wrote:
>Adding my 'signed off by' tag and additional two lines to commit message

this doesn't really work, you shouldn't edit an email like that

>
>-----Original Message-----

the below is not really the "Original"

>From: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>
>Sent: Thursday, July 10, 2025 12:31 PM
>To: intel-xe@lists.freedesktop.org
>Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
>Subject: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
>
>From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
>Enable SRIOV support for BMG platforms.
>For SRIOV to work on BMG also correct, SRIOV-enabled IFWI must be
>flashed on the BMG card.

When I try to apply this patch, it won't add this additional sentence.
Anyway, I'm rewording it a little bit differently and applying to
drm-xe-next:

[2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
       commit: 908d9d56c8264536b9e10d682c08781a54527d7b

thanks
Lucas De Marchi
