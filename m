Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0367C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846FB10E013;
	Tue,  5 Aug 2025 03:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbKQvTv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF71F10E013
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754364043; x=1785900043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fnmMpja9f7tQ4eNpWAaovRk8Ry0wX91EskhyqtqGEAY=;
 b=cbKQvTv34PiWx5yUWoH6oNBF7lgwv2k9mFzu/pzAhs5HPLXYwILRjLTt
 0KHX8QQ30fR9iDU+lPS3EkB7oO0Esp7lr8Y5TXQIM+UmxU4+/IQXKqVEh
 48j+xi6NagafZcOOI9G8K1S3LhlKXrOQKzs+90Rtm1xlGiPPPzRLvXtC4
 +2OngRbGHytNv1PorjGzxDJuB2fh6VrAvk+uZW9+GVo9QzOOyHO25wypu
 P3VW02CpNbvr9Z6jOINfv6tVATPpVRp8lHezAZH3W4PhrlKjfvfL2CJLl
 hyGmH9/Ls8UR2C/rLeiM5M31i6HMtywrHHuhr8ybiO7stc3Oh4G2xGwEK A==;
X-CSE-ConnectionGUID: vYcsLtisTvyC6DQCsQK0iA==
X-CSE-MsgGUID: yCtD+QoQSw6E7y3Elw2TTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56560678"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56560678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:20:41 -0700
X-CSE-ConnectionGUID: LJs589RfSAKq/0A8VyKZHA==
X-CSE-MsgGUID: JASg7SjRRTW7FpvnJMohCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="165134091"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:20:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:20:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:20:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:20:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2xOAGKxWoTDwlzeyqQ3exXkXQhbxi6fHoEntSkrFHaeZ0qR/GVzG/1mzJ9NYy7BSYVlgEwAQmlILP8Jbamf2E6CRhZjT0nipU2kU4l/76xDLACigmG51LUnXkxGq8dGhjD0UiWjZyOX9TPmTZVm7xAZDFzg6OZevEWLAOd/fpJtYCWM+nCgzZqFVUsN3BLePnpeUL3/h5iYpNNDNSJxNZHluQr464Gy3hRuG8lSe4Eq9EtjBABRG/fw/rBKN2BPL9mOkqu2rXE6z8hYDLtycxEvQuD5y/SH4Mvz/+I4jAaK0nmSED8t90ed8z+wv8/ue4xbQGzL0jVLFIjY3gavpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hl0SG6ZdzehQ/lcSzb9r8UmiIX8dzdngEANlVF80pc=;
 b=LhvWWt4H14wFWDsc6vaddqGC14eRwbSYLWkqrj6oVNUYnyLXPVOPxIAyYplJGd8/0vzzrNjy1GGJ9tjLAJVr0kktW0NA8YVFeMzhWLKzQpDgXenn2EvqQL+bqZsDj2g5/ib9IkCVw+Op5hNdIRdGKt2bMs+R78YWSr5as2mIHpEfsLJHNZwv7bfAOX1JXjNpuEX8rbCLpUk78+DJH0dgQoIIzW/dzH3TRHy0REslZQIySv7wHMumfs0Evz55ZCpmbCGQ1CIZgZMsgmr4qk+/Cws3ssS0w6GP0fYm9L124UTglElzRFBE7eTdNenihAqtNMqzZskpQ/pvdKmYuyyl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Tue, 5 Aug 2025 03:19:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:19:57 +0000
Date: Mon, 4 Aug 2025 20:19:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/6] drm/xe/svm: Migrate folios when possible
Message-ID: <aJF4WW4LsM3u0hZ5@lstrano-desk.jf.intel.com>
References: <20250730142357.3851167-1-francois.dugast@intel.com>
 <20250730142357.3851167-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730142357.3851167-7-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 773046c7-8b66-42d7-2fe0-08ddd3cef3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wdffOe5CgGKI8+Mh66faRkaYyPTL1dEF/7uVVbwQw1/1TU+O4bKJsPqorm1S?=
 =?us-ascii?Q?YQDVOvZ+bpXCi03Gd5PAtCH7wwVIFHpkaXpqdJ4ha0VWh2D6ex3+xahukG0N?=
 =?us-ascii?Q?WEG6s1nL2v1mwINCLn/Y4S+6GzIuIat80RVWpOBsgvo9HHDLT4AAR80bN2Op?=
 =?us-ascii?Q?q/lgdeV+nXmniEpFmqrXFyBcoVx7mfYoaYVS/QsK6tp0DcJ8zbueDZzGsULB?=
 =?us-ascii?Q?Pi5mD49Ugnbp9v33Z0dONkPx4HWCaPegMqZepXsPRlIFI7PheEZy7fGiFYj/?=
 =?us-ascii?Q?yKxbOEazUqwQsgmoO+qhDVLUBu/wukw05NoOHVUukM8cV3Ym/MGh5dIdOo1Z?=
 =?us-ascii?Q?YIXYp4LaqkZsWAst+gZVdH9xU3/IAT1Q36ah2+eK7mIaW+hyE4fptmV1xH4O?=
 =?us-ascii?Q?/CofLN/m0bO0JDdwo7t1ihatTFb6VH/0JJ8mgJDsn+1s2as/SNc1GgBXhlBV?=
 =?us-ascii?Q?lk9roF31WlWMJmZiwHO6q8mbZwvP1W6bnRu0Ss46Qt2oGDXwooa95jjcsvnN?=
 =?us-ascii?Q?gft37uTI0WVz6XDsA+yvmOjbBE1w9VH61P0Pt8tKSP5P/Vp74M7/mUuBTtSQ?=
 =?us-ascii?Q?xrfzsdfDs/RDBaaFR1tdDPaKVpV9+2OPDRwVwz8ri1wONn3ALtA0zctIbMzw?=
 =?us-ascii?Q?XTBtI9cWWsPyMhUMWMEJsFc65EEsMDJ09iRDbVflWcm/k0FBrzBHyPoFTuug?=
 =?us-ascii?Q?cRfFE1B/yOKbgT2kPSplBUAs5Hmq6+nFCyQZP4uj4aDhU+Oy/3tqHQf6/KCt?=
 =?us-ascii?Q?/eI7tMEzlQbJEt4F1wiTYjNGomXxToFPaaI+c7Nv6+kcGK1BZ6MPHmtqjLv9?=
 =?us-ascii?Q?a+6ki2YOoM3GUb//JxFA//nDWtU1YlYY8p254BOJB4H+7PntINcfESiDqphb?=
 =?us-ascii?Q?Yl3jNA64+dYBa9HIXsF9pcx+96wHg89UO54lmN6ZHBJMJQ1AUVm2j4eV4R4a?=
 =?us-ascii?Q?1TtUSG9cBGTeuacR3HxgxyjbXkIomgOW5ICDMBibsvvkQWcJbrJqM5/JanBZ?=
 =?us-ascii?Q?ORicKvZaDxKAdss/AhHJeJ9ODaTJ5F45VjnMQ1RjJ4FnCg8oIQKViuLzvBet?=
 =?us-ascii?Q?FPOXDX/jqcforzPq7p0duCqOot2g1k3HogLapMzfsLAkAj0NqqqHySo5ErKL?=
 =?us-ascii?Q?TajZa9Nk9ZEybUiv+s02YD6ZsESqNBTEzfTpo6bjal5qcNu1XULrBBq/253F?=
 =?us-ascii?Q?c22hRxaGzTUVryVMguRzxwn2QUIylhbtsIBhNp53or1w3+6mE7wVGjUXU0Y1?=
 =?us-ascii?Q?JAH48PCTx/lXiTm27AGWhbkX0NCFDWpGjTBryDcoP9f48mMZ62MQt9x+509i?=
 =?us-ascii?Q?2XX+Qg/Fm0KWNGGBnvBKRsG1p6y+dEph8JvhfPLW7n/PXuxajw6Mer8C770E?=
 =?us-ascii?Q?szCZuvoA5zY+M50MWN1Mv7aytJzSO/DClRs4u8Y3Sg+TVQfIzcHEwl7dII3b?=
 =?us-ascii?Q?pG+1xQSlLy8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QOJxRS1YmDSvf/02Sg79GOV4baPeuBZgSnI0W6d4UGOyOcz31xNZoUXohg8a?=
 =?us-ascii?Q?6YdupFKy20+t14ucqsR0nDz1Ls439mqwU3HaTyvhUd5TeBZhUbJzkKzfmuFG?=
 =?us-ascii?Q?+tk66ZQKs/GYbnA6FKl8ncjgjT6uScQtIZJXmTcbNbCfHV9PKRTsYfSGse01?=
 =?us-ascii?Q?ha+nC/zKXsV/C5opp98FEyR+iNuTJJ8iL2E1ZX5zjTC1R0IM5LLVtudpd0sS?=
 =?us-ascii?Q?kVvhMvVnV89R9XO2IjpQiw7ZIEYv7oOGE2RmWdreohSmzM2ud9ntpyjO33UN?=
 =?us-ascii?Q?tflC/h8kRzAHE2PWYJ/gQ/lA0ZH5/EvbIfwsyBlIzn38o3JoQxf0z+I4XxDR?=
 =?us-ascii?Q?x7fv5KQYSdgHicL0ZHE+xapncJDh7HnmDKnfhEIMRZJK073CTk9HdiYNPVKi?=
 =?us-ascii?Q?cO5FMJDKvrMZR/pQI+HAFJ9+RIApzdos1cuKEJCUjPBBzCBQTIHMZq1luU1G?=
 =?us-ascii?Q?sNhx6ygxMTCkjGbfPoKORPtiKuQR4ekdRX8z+Q2U+w4J2FFoZwFnVHctDeAl?=
 =?us-ascii?Q?6QoaMqwajmqGk0/Dw3kXnmHGi92qvydOz4SRJxK49Gv5SUH32WNXvpCeS0p/?=
 =?us-ascii?Q?A5G9fHkrUU7syKzWW5pW5kFOzHSDKutAjYjRpEHjjkerk1yCbgEILY9X+f1w?=
 =?us-ascii?Q?IWYGEH8IiGszABQfghHorXSTNCFZenHexl8S5jzAx0/8GjZnFYNtTfkFFpEX?=
 =?us-ascii?Q?l1UaYJ06Sn/HEVvLisICB9KvQ6k4hb8xCepdQVxQZJ21FBPA0pKiF5qJOz/m?=
 =?us-ascii?Q?hf6JgvOrXhwj10fpFzw3vlPrc+zkSsgtTETIdLpZpqC9+KFPjfV/tDCQ5Ei5?=
 =?us-ascii?Q?piNLkAG23jpSyBzQEIaKntvwY4jq8NO70E4wmdBjL95hLT5J8rDf4ItaZhCU?=
 =?us-ascii?Q?MK8vb78V69yytAwXVE2DITtVVENh0RTMl6GZBqEb3lo4zsSwwmIpniNgS0oS?=
 =?us-ascii?Q?n4QPnjhADukRo5wh2uQL6YRhYUVjP1ieIVmE7gsFyc1wvMnpiPQUnuzn0vLh?=
 =?us-ascii?Q?UG/52mcOKtl6U3m2O/lidem5SpJmBaX5dcZMdim5mVxuB+zItP7s8QHLvIxa?=
 =?us-ascii?Q?ojPpofRygGEdXwCseHvKytJklS6rcpROIQnsj1ZfStDoHDeZpN942xHtShxe?=
 =?us-ascii?Q?uvb4VZ4toTUXswk50iyCZbuP/J3YGriJbFHSQSsOk323+snzrbTK2hbPVGu5?=
 =?us-ascii?Q?HfM6vQrqrutT5K1u71Tt0ZRwLbeqLF89A3IsMmdXZwwl/rxG2RACuijiePn6?=
 =?us-ascii?Q?9mN/hKtVA0z37Kb0pY0b2Q9e2m4WtvCAxEIG8xhfY/1XAYv/akZKPy3KZ2a8?=
 =?us-ascii?Q?CeQn3M6hfhdbMQm08u1TJgg65Ij395xBirPCiwndYis08T8Fg3v4FscF9FGR?=
 =?us-ascii?Q?XlgNiwyXNNla9PNr9W1iJZgV24gJq/hXc4dgzbphoAoLYk1baLn0CmZReLoe?=
 =?us-ascii?Q?E7b3y/44Tbh6bpTfrF0g/Zw0Eyvwq3xmCfAf1gG9mbpCSiJDDsNuHUrQuL6t?=
 =?us-ascii?Q?R8SPGijISkBYp5JqeYsbC/ZQhkysVoDLX4LIkbIdehuIn5KDWRnC5CAzc+h9?=
 =?us-ascii?Q?gyrZpKWWX4p/Z7S6TsVQ0CJiTPP7cWv5ctD/sx2la7WLn48B9U2tlPDRtFuP?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 773046c7-8b66-42d7-2fe0-08ddd3cef3fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:19:57.3122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6YVz+HYaR1B26DkZrfoapnjQkWiSQWTnCujhvzmY917OY+tdXPQU//YJfoRuHgYgvgcTESCnbM0BT2eWv1EUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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

On Wed, Jul 30, 2025 at 04:22:51PM +0200, Francois Dugast wrote:
> The DMA mapping can now correspond to a folio (order > 0), so move
> the iterator by the number of pages in the folio in order to migrate
> all pages at once.
> 
> This requires forcing contiguous memory for SVM BOs, which greatly
> simplifies the code and enables 2MB device page support, allowing a
> major performance improvement. Negative effects like extra eviction
> are unlikely as SVM BOs have a maximal size of 2MB.
> 
> v2:
> - Improve commit message (Matthew Brost)
> - Fix increment, chunk, assert match (Matthew Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c  | 2 ++
>  drivers/gpu/drm/xe/xe_svm.c | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ffca1cea5585..59994a978a8c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -200,6 +200,8 @@ static bool force_contiguous(u32 bo_flags)
>  	else if (bo_flags & XE_BO_FLAG_PINNED &&
>  		 !(bo_flags & XE_BO_FLAG_PINNED_LATE_RESTORE))
>  		return true; /* needs vmap */
> +	else if (bo_flags & XE_BO_FLAG_CPU_ADDR_MIRROR)
> +		return true;
>  
>  	/*
>  	 * For eviction / restore on suspend / resume objects pinned in VRAM
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 1d097e76aabc..e35c6d4def20 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -383,6 +383,14 @@ static int xe_svm_copy(struct page **pages,
>  			}
>  
>  			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
> +			/* Expected with contiguous memory */
> +			xe_assert(vr->xe, match);
> +
> +			if (pagemap_addr[i].order) {
> +				i += NR_PAGES(pagemap_addr[i].order) - 1;
> +				chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
> +				last = (i + 1) == npages;
> +			}
>  		}
>  
>  		/*
> -- 
> 2.43.0
> 
