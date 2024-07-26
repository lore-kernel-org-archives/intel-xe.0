Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C015DC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 21:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718DE10E052;
	Fri, 26 Jul 2024 21:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5A1rxUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE0C10E052
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 21:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722029205; x=1753565205;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mt7oN0ZqkyNWxaNL2fVmPekb1QhBg2LIMvLyb+qR3rQ=;
 b=c5A1rxUW4XlTUx1A6XIrjacI8DdEXFkjuldYqqDJlMMFpu4gwDc71m7v
 TiPX+BySKqoG7oIQrgN+Jafl3NjhEgrmRRmDAWvEEMLd7oLsBFaT/lzY7
 V66ehqtWpMZmehG4u1fw4ULCF60noC1eduDe/fJKJyPT0iewDHM6jRClA
 rJwI5FIVWrY4vCrKKREjbVvPcOnrfswhnjMV+yZ5mMv1UAqwlUCFXr9Ry
 7k5e1Lvh/0j6j5GV9dzL4A7qjiCMKnAi1z+8LP4XEK9YLLs8eyMPV1W6U
 RPZFhs3qTAvcYHR2nicuih0wahRD+MM6TxOY0AT6dqrXYjNfiNZWlD32B w==;
X-CSE-ConnectionGUID: 4Cwpz14LRey3AXr/XpAZPQ==
X-CSE-MsgGUID: QYXxvjDHSBmUnWDg4TcZaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19718026"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19718026"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 14:26:35 -0700
X-CSE-ConnectionGUID: xJG+/iarTsuj2TFDVqZqDw==
X-CSE-MsgGUID: W5fOHNSoQAyaFN+2NJ8+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53058179"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 14:26:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 14:26:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 14:26:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 14:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEgkxJaiivmiWsDiGAeQ5V36wq0Url0VXve9aAdoZ+mOQOQVr/efxYKS2CW28FOy4UQKZQGqFodFH2JRdxadbJlWJlf5QxiVH43la8eqJD2BcH885icRonz9onAPcek7X68X/xJrLnnZcUEVBYwNN+3KbPTLoDKp/5ahJn4khyBuotCgP0e14b0Q4+cXSf4Ub8vMYNj9mGoi1rimPebvp2hT+wIjrgOMzgWd5oCY4M55huzhTBfOt7F2Ry1l7bB2QxG1xuxuDMOpKXiVBQBF4BS0/SwE2vw92Zmh9F/WfBUdxPu4MHImi7ZtCkhiOmA8Nc2s4rfYcUNY2z5FRf6tEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fF+PnU9wEYAj9uR4obPZ5HgZ5BesSrJEcKahEB/aKNk=;
 b=r79/oHWxqQn3p0brO7p0uyUW53LIBr5c6JJNAPZau7OSJpCjuSxXL2K5a4VDLXc6ev8RDpEDzj6bpYnV3ED9P1CC+WtyTAI2oCKxCZeQBrsGG6kWhdr0terBVKxJ+rMYtMLDfXIbS7TG1EDuUsFfCuW6vhr7IC7TnszKgpz3XPUVxJ8BGpFSQQa8VWDIRZqeAwnyvKxMrpW1o4b6fiCptV/f7JWx1lj0s8PSQcJEswX6KV9baPQuWH/Fg90GXztL8werhyxqU0AIJA9scw9S20r7xV84ASY8WRoaY9W4USpscNJMo4Gn8NBNn8qDCnkzDXndC4wpwXcea3s+XbOAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 26 Jul
 2024 21:26:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 21:26:32 +0000
Date: Fri, 26 Jul 2024 21:25:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 17/21] drm/xe: Attach debug metadata to vma
Message-ID: <ZqQUVPz7JQ44/Rjj@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-18-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-18-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:a03:80::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: f3659cfc-17bd-4e5e-7c25-08dcadb99e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lQI0DCl4HLPVEKKEriEzngvjCfsuXXeeEGmZro+zd9l2+sEnMOnNut0UZuhB?=
 =?us-ascii?Q?3Wt9Et6soMdb5ajVdz1piXqQcnE0I4Xuu/chVcZ9w0EvXoa0V3i/geHLXXFj?=
 =?us-ascii?Q?ISvG1tdQ6XAsTEdIRTf/QFreSa4Qo1+G2/Q6vyjaKzP5GGqJsfRx9UI+eo5W?=
 =?us-ascii?Q?wLYFPcnwiNwvHi8Ce8MyXOKS60xtGz6uXEkXNN+cnaBOu7JP4wL6coGfWR9E?=
 =?us-ascii?Q?uURiO9eJHWbOdYlK0E0bYzonv8HpZoD+wVoleAPdRH6eosJZtC3Io8A5ZpKK?=
 =?us-ascii?Q?3PN+TAvStOdU6KgPqWN4Q+VDrsEIqzEK2UxnIXnkQ2PrTwF1xeHVAgRgjjS+?=
 =?us-ascii?Q?WFsr6NvFXSbetim3HvZ/sQRt6PA23arOcqzj9X4FE4Eo36C79Foqin+IUGuU?=
 =?us-ascii?Q?wQLQdKk7QwKwC52jMmUzqtAOUo/z602d5wWAnTNCYMKuVkz96jx8KrhTJUt0?=
 =?us-ascii?Q?Bvx4Kih2bIyD4JYYDyKbmb61KFSGwMFnOzdGrbaVs2l6Q7ZtT+EioA2A2gdk?=
 =?us-ascii?Q?YqlgCVvotJ8Xcuw0HzTuZ7F7FkDvX5IDraagc94H3ZesNVCvahw1uKcMsrAy?=
 =?us-ascii?Q?j0bPSaUvyaoapm1JLD33WuCqXyOw+EDi7r7Jm0+VBwK0hbT165XRYja22okP?=
 =?us-ascii?Q?e+W3Z0CYHvvDs6GUB7FB23tYQXu4l8b9AOvuDB/AQuZS0v9YLe29E3R8dQS/?=
 =?us-ascii?Q?II8+MYbVSX6C9h5juTNdlidmy6QMz6+c1epQh8hPL9LfujYLhLN93VRusphh?=
 =?us-ascii?Q?aab6RPo5ABu1/U5ur/u+m9O2fvSt54H102BfVgbuYGFhE3zhXduDMB2iQJCr?=
 =?us-ascii?Q?IPEknTb/STbnp/JH0PmZkzUCxvrAZqAY+ZwBSyU+m81FOop02lDUic8mb/ZG?=
 =?us-ascii?Q?dJVIDlUQXv0st86oqqJmhrWnaR+zrr3udQjYIjdbb7FnDGLuBg5+Q6pplGUs?=
 =?us-ascii?Q?BMGIMTkOYZjTCscCYmb4xNm49KFSdKEWpURkbVXaHuqtFLTd09XDhM9Erkcb?=
 =?us-ascii?Q?J23bvSHRNxWZRfnrlnOd2T70CtFkKdxD+otQOLrB+Q9WmJaUMB+9oVV0dkLP?=
 =?us-ascii?Q?cLCROH21fHXZi8mv+O34I5OYsKX9UdFDcvS9FhkoMRa/LseJuWwYl+fiP4J0?=
 =?us-ascii?Q?Jlqcw0arnyyrMBqjH8cLcAIt8W/T5TXNEsJodKqIKf4/Fa5S1YV5CHaRBz8I?=
 =?us-ascii?Q?Vu5B5lAzDXms/SYoGwmaxjoEdGjbb/eq7bALSObeV+5c6JocIfYMnFDJ/Vrf?=
 =?us-ascii?Q?Ww8cAEeogYF17EveWTShTBDpBSCTtwJqv78up4I04fJ7ECnS6liZKfa4ph+A?=
 =?us-ascii?Q?AfQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gk6L5kuJkorhe93FLyVkFt4szKUS11KtH8szZFkXtGZ55yyT4i9p9o159+bR?=
 =?us-ascii?Q?oZbX9cDVKX56fAg61zMvqL2VcqU9JtJSpN3peDxaKfgkDNsf6bmj+rmGrMUm?=
 =?us-ascii?Q?B+rIHx0FlC7jYlrjCPVBjNr697GeHgUtAA5hbEpbvJOGPTHihiKMma0hJFRI?=
 =?us-ascii?Q?oPAkMeb/eDn+w7JMYzD0d9Qhgjtxlb6urblPU/bEPuLthOUVl7JrT2Z1jTWY?=
 =?us-ascii?Q?JmzZasHLhmENKVMdlny2S23k26or8WZ0aWKzBJnBMIyX+JxYZerpr1GfEGpQ?=
 =?us-ascii?Q?NHl1EG6XcJyAJvfEYJPTAUS3A5LsDO8vitjE6iZoLmEoPycMx5+VbQ5xuX4I?=
 =?us-ascii?Q?VvUCtah038F4717fESayM+wTEJM9NlRU8SvykeEJpOt5NKTbwCzYuzQIjxM0?=
 =?us-ascii?Q?QTeN/nAPJ/uXklIUPB0Axw8tbMBxIvwabXrxbBW4Dhe6Y3QFJaQ+Y5DO9irR?=
 =?us-ascii?Q?XuSbCpPsJ5FqOP3Ihy/XFYbXBOlB/lEy8O/CcZ0/9Md5bjU1XbAxzkRuP4ZO?=
 =?us-ascii?Q?pvQhnO/n1qS8jw0L2mdLVSyeDO5A0Wj5/SjtuUCBQ8LRs+bE/RnLIlv1sJEa?=
 =?us-ascii?Q?mJ/iCbv5zxtt2E5wnmss8yyyABmmNEY5hHbNagaX5pro3hUCmaA2zMBG+UcF?=
 =?us-ascii?Q?lpRt/U0SxnLgLLsbZgco4KhM042vvgzXugBmmXf+AfpIjQ17cCLcbgfLutre?=
 =?us-ascii?Q?t5XG6NUaQJnA7o/b0ir8WtQf2giNGI6GAHuctdMYPT/PesfeFEo38+uDVF8V?=
 =?us-ascii?Q?Wnfh7KSiUdnn4SEWwbcYQ/bdjf/zigAy/loJrRF1jRscBzwfJ8MtGS4tZJeg?=
 =?us-ascii?Q?N3MA/Q4A8rC3SHqxuJeYNzU+tk9wGlhlml6OoaoU5B8Je2WQRCYHX16DaTHb?=
 =?us-ascii?Q?gRcifIn8vuTwDB6u62vPmHsY8HMjpbF16l3CEhq/AkcfZnECn5wGsfPvov/T?=
 =?us-ascii?Q?khfkEhvBUjZo+esPu6C2kAw8TnlIYS5Y0YZdxFnT++gBLY8zWIMDNGKyjPob?=
 =?us-ascii?Q?6pjalAoj4Z3q7XpKT6diWl8eK7O51i1j2yHxFkdOp/kKIY15MhpoZul5TEpm?=
 =?us-ascii?Q?CsYvpHMzepFZqsCKNF5rh7KOK+srJmHQXe2mf0IJ2i+gUpOpXP2FOGO+6W66?=
 =?us-ascii?Q?7Zm4hAy1rapYneX0Yyqt9y9w5Qvi9IrCTqaiYjX0gOycaHB854tFnMmTz2WT?=
 =?us-ascii?Q?YtqK1T+AO2qkZI2vLn11MraAjKJX4O6uX//KyqaxoVFtW+rCFrsCY/tzcl54?=
 =?us-ascii?Q?vBuQ0kBW8rUYbXQBpfXFIz841gc+C3Lpzzofi3iLOlZYTG58SzBK/+33ABiY?=
 =?us-ascii?Q?cCO55P8vG0O7/FCgxYTOKaaAo0J20bVaQHwB97UiJLjhdbaboRSdWSex3TsF?=
 =?us-ascii?Q?huqeb/O6SbK71os15IxTdzeLIxU+r8PL0+7Z5I7a4Uu79Tt+WIp6ovxyyBqF?=
 =?us-ascii?Q?2sSKQJ3RJKTkwZd2fOIskjBCckwfaMkIiaIh1pWgIninEgcGdOk86CXYTC4/?=
 =?us-ascii?Q?RfltZ4QZhHS3IltWhXTcHxad30B5fyZBDcLuBS9f9F9k9Ls+bvJl66LlP0fu?=
 =?us-ascii?Q?MDP4yZgKuuvVwVxJOuufd7b0BcBoQXtUsVQfakkjlojJDjKPj1SNKWk7KrcY?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3659cfc-17bd-4e5e-7c25-08dcadb99e7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 21:26:32.0592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBUewf9xd+h0tKRLsiYz3wseF1cpneISZWqJDuaiHNcVtOJXSCACxiBB4wn8+jwIQUwNygcaewA/hn3FfYzq5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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

On Fri, Jul 26, 2024 at 05:08:14PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Introduces a vm_bind_op extension, enabling users to attach metadata objects
> to each [OP_MAP|OP_MAP_USERPTR] operation. This interface will be utilized
> by the EU debugger to relay information about the contents of specified
> VMAs from the debugee to the debugger process.
> 

Not a complete, review just more comments about layering related to this
comment [1].

[1] https://patchwork.freedesktop.org/patch/606049/?series=136572&rev=1#comment_1101330

> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debug_metadata.c |  13 ++
>  drivers/gpu/drm/xe/xe_debug_metadata.h |   2 +
>  drivers/gpu/drm/xe/xe_vm.c             | 198 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm_types.h       |  15 ++
>  include/uapi/drm/xe_drm.h              |  19 +++
>  5 files changed, 243 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.c b/drivers/gpu/drm/xe/xe_debug_metadata.c
> index 8d99170d3591..daffc13c58d6 100644
> --- a/drivers/gpu/drm/xe/xe_debug_metadata.c
> +++ b/drivers/gpu/drm/xe/xe_debug_metadata.c
> @@ -24,6 +24,19 @@ void xe_debug_metadata_put(struct xe_debug_metadata *mdata)
>  	kref_put(&mdata->refcount, xe_debug_metadata_release);
>  }
>  
> +struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id)
> +{
> +	struct xe_debug_metadata *mdata;
> +
> +	mutex_lock(&xef->debug_metadata.lock);
> +	mdata = xa_load(&xef->debug_metadata.xa, id);
> +	if (mdata)
> +		kref_get(&mdata->refcount);
> +	mutex_unlock(&xef->debug_metadata.lock);
> +
> +	return mdata;
> +}
> +
>  int xe_debug_metadata_create_ioctl(struct drm_device *dev,
>  				   void *data,
>  				   struct drm_file *file)
> diff --git a/drivers/gpu/drm/xe/xe_debug_metadata.h b/drivers/gpu/drm/xe/xe_debug_metadata.h
> index abaea076c12d..deca24fa2cba 100644
> --- a/drivers/gpu/drm/xe/xe_debug_metadata.h
> +++ b/drivers/gpu/drm/xe/xe_debug_metadata.h
> @@ -10,7 +10,9 @@
>  
>  struct drm_device;
>  struct drm_file;
> +struct xe_file;
>  
> +struct xe_debug_metadata *xe_debug_metadata_get(struct xe_file *xef, u32 id);
>  void xe_debug_metadata_put(struct xe_debug_metadata *mdata);
>  
>  int xe_debug_metadata_create_ioctl(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b117a892e386..9e27ae9d64e6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -24,6 +24,7 @@
>  #include "regs/xe_gtt_defs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> +#include "xe_debug_metadata.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> @@ -940,6 +941,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  			vma->gpuva.gem.obj = &bo->ttm.base;
>  	}
>  
> +	INIT_LIST_HEAD(&vma->debug_metadata);
> +
>  	INIT_LIST_HEAD(&vma->combined_links.rebind);
>  
>  	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
> @@ -1003,6 +1006,48 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	return vma;
>  }
>  
> +static void vma_free_debug_metadata(struct list_head *debug_metadata)
> +{

So this should be in the eudebug layer. If you don't want to add to
xe_eudebug.c you could create a new file xe_eudebug_vm.c or something.

This comment applies to all EU debug code in Xe common code, call into a
EU debug layer.

Xe isn't the best at layering, a lot of that is my fault but when adding
new code we should ensure proper layering. SRIOV is good example of how
to do this.

> +	struct xe_vma_debug_metadata *vmad, *tmp;
> +
> +	list_for_each_entry_safe(vmad, tmp, debug_metadata, link) {
> +		list_del(&vmad->link);
> +		kfree(vmad);
> +	}
> +}
> +
> +static struct xe_vma_debug_metadata *
> +vma_new_debug_metadata(u32 metadata_id, u64 cookie)
> +{
> +	struct xe_vma_debug_metadata *vmad;
> +
> +	vmad = kzalloc(sizeof(*vmad), GFP_KERNEL);
> +	if (!vmad)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&vmad->link);
> +
> +	vmad->metadata_id = metadata_id;
> +	vmad->cookie = cookie;
> +
> +	return vmad;
> +}
> +
> +static int vma_debug_metadata_copy(struct xe_vma *from,
> +				   struct xe_vma *to)
> +{
> +	struct xe_vma_debug_metadata *vmad, *vma;
> +
> +	list_for_each_entry(vmad, &from->debug_metadata, link) {
> +		vma = vma_new_debug_metadata(vmad->metadata_id, vmad->cookie);
> +		if (IS_ERR(vma))
> +			return PTR_ERR(vma);
> +
> +		list_add_tail(&vmad->link, &to->debug_metadata);
> +	}
> +	return 0;
> +}
> +
>  static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -1032,6 +1077,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  		xe_bo_put(xe_vma_bo(vma));
>  	}
>  
> +	vma_free_debug_metadata(&vma->debug_metadata);
>  	xe_vma_free(vma);
>  }
>  
> @@ -2005,6 +2051,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index = pat_index;
> +
> +			INIT_LIST_HEAD(&op->map.debug_metadata);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
>  		}
> @@ -2195,11 +2243,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			flags |= op->map.dumpable ?
>  				VMA_CREATE_FLAG_DUMPABLE : 0;
>  
> -			vma = new_vma(vm, &op->base.map, op->map.pat_index,
> -				      flags);
> +			vma = new_vma(vm, &op->base.map, op->map.pat_index, flags);
>  			if (IS_ERR(vma))
>  				return PTR_ERR(vma);
>  
> +			list_splice_tail_init(&op->map.debug_metadata, &vma->debug_metadata);
>  			op->map.vma = vma;
>  			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
>  				xe_vma_ops_incr_pt_update_ops(vops,
> @@ -2230,6 +2278,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> +				list_splice_tail_init(&old->debug_metadata, &vma->debug_metadata);
> +
>  				op->remap.prev = vma;
>  
>  				/*
> @@ -2269,6 +2319,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> +				if (op->base.remap.prev) {
> +					err = vma_debug_metadata_copy(op->remap.prev,
> +								      vma);
> +					if (err)
> +						return err;
> +				} else {
> +					list_splice_tail_init(&old->debug_metadata,
> +							      &vma->debug_metadata);
> +				}
> +
>  				op->remap.next = vma;
>  
>  				/*
> @@ -2319,6 +2379,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
>  		if (op->map.vma) {
> +			vma_free_debug_metadata(&op->map.debug_metadata);
>  			prep_vma_destroy(vm, op->map.vma, post_commit);
>  			xe_vma_destroy_unlocked(op->map.vma);
>  		}
> @@ -2557,6 +2618,120 @@ static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
>  	}
>  
>  	return number_tiles;
> +};
> +
> +static int vma_new_debug_metadata_op(struct xe_vma_op *op,
> +				     u32 metadata_id, u64 cookie,
> +				     u64 flags)
> +{
> +	struct xe_vma_debug_metadata *vmad;
> +
> +	vmad = vma_new_debug_metadata(metadata_id, cookie);
> +	if (IS_ERR(vmad))
> +		return PTR_ERR(vmad);
> +
> +	list_add_tail(&vmad->link, &op->map.debug_metadata);
> +	return 0;
> +}
> +
> +typedef int (*xe_vm_bind_op_user_extension_fn)(struct xe_device *xe,
> +					       struct xe_file *xef,
> +					       struct drm_gpuva_ops *ops,
> +					       u32 operation, u64 extension);
> +
> +static int vm_bind_op_ext_attach_debug(struct xe_device *xe,
> +				       struct xe_file *xef,
> +				       struct drm_gpuva_ops *ops,
> +				       u32 operation, u64 extension)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_vm_bind_op_ext_attach_debug ext;
> +	struct xe_debug_metadata *mdata;
> +	struct drm_gpuva_op *__op;
> +	int err;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe,
> +			 operation != DRM_XE_VM_BIND_OP_MAP_USERPTR &&
> +			 operation != DRM_XE_VM_BIND_OP_MAP))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, ext.flags))
> +		return -EINVAL;
> +

Relates to comment here [2]. Ensure VM is LR mode as I don't think we
can use dma-fences with the EU debugger.

[2] https://patchwork.freedesktop.org/patch/606059/?series=136572&rev=1#comment_1101319

> +	mdata = xe_debug_metadata_get(xef, (u32)ext.metadata_id);
> +	if (XE_IOCTL_DBG(xe, !mdata))
> +		return -ENOENT;
> +
> +	/* care about metadata existence only on the time of attach */
> +	xe_debug_metadata_put(mdata);
> +
> +	if (!ops)
> +		return 0;
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		if (op->base.op == DRM_GPUVA_OP_MAP) {
> +			err = vma_new_debug_metadata_op(op,
> +							ext.metadata_id,
> +							ext.cookie,
> +							ext.flags);
> +			if (err)
> +				return err;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static const xe_vm_bind_op_user_extension_fn vm_bind_op_extension_funcs[] = {
> +	[XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG] = vm_bind_op_ext_attach_debug,
> +};
> +
> +#define MAX_USER_EXTENSIONS	16
> +static int vm_bind_op_user_extensions(struct xe_device *xe,
> +				      struct xe_file *xef,
> +				      struct drm_gpuva_ops *ops,
> +				      u32 operation,
> +				      u64 extensions, int ext_number)
> +{
> +	u64 __user *address = u64_to_user_ptr(extensions);
> +	struct drm_xe_user_extension ext;
> +	int err;
> +
> +	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
> +		return -E2BIG;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> +	    XE_IOCTL_DBG(xe, ext.name >=
> +			 ARRAY_SIZE(vm_bind_op_extension_funcs)))
> +		return -EINVAL;
> +
> +	err = vm_bind_op_extension_funcs[ext.name](xe, xef, ops,
> +						   operation, extensions);
> +	if (XE_IOCTL_DBG(xe, err))
> +		return err;
> +
> +	if (ext.next_extension)
> +		return vm_bind_op_user_extensions(xe, xef, ops,
> +						  operation, ext.next_extension,
> +						  ++ext_number);
> +
> +	return 0;
> +}
> +
> +static int vm_bind_op_user_extensions_check(struct xe_device *xe,
> +					    struct xe_file *xef,
> +					    u32 operation, u64 extensions)
> +{
> +	return vm_bind_op_user_extensions(xe, xef, NULL, operation, extensions, 0);
>  }
>  
>  static struct dma_fence *ops_execute(struct xe_vm *vm,
> @@ -2753,6 +2928,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>  
>  static int vm_bind_ioctl_check_args(struct xe_device *xe,
> +				    struct xe_file *xef,
>  				    struct drm_xe_vm_bind *args,
>  				    struct drm_xe_vm_bind_op **bind_ops)
>  {
> @@ -2796,6 +2972,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  		u64 obj_offset = (*bind_ops)[i].obj_offset;
>  		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
>  		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> +		u64 extensions = (*bind_ops)[i].extensions;
>  		u16 pat_index = (*bind_ops)[i].pat_index;
>  		u16 coh_mode;
>  
> @@ -2856,6 +3033,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
> +
> +		if (extensions) {
> +			err = vm_bind_op_user_extensions_check(xe, xef, op, extensions);
> +			if (err)
> +				goto free_bind_ops;
> +		}
> +
>  	}
>  
>  	return 0;
> @@ -2958,7 +3142,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	int err;
>  	int i;
>  
> -	err = vm_bind_ioctl_check_args(xe, args, &bind_ops);
> +	err = vm_bind_ioctl_check_args(xe, xef, args, &bind_ops);
>  	if (err)
>  		return err;
>  
> @@ -3086,11 +3270,17 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 obj_offset = bind_ops[i].obj_offset;
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
> +		u64 extensions = bind_ops[i].extensions;
>  
>  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
> -		if (IS_ERR(ops[i])) {
> +		if (!IS_ERR(ops[i]) && extensions) {
> +			err = vm_bind_op_user_extensions(xe, xef, ops[i],
> +							 op, extensions, 0);
> +			if (err)
> +				goto unwind_ops;
> +		} else if (IS_ERR(ops[i])) {
>  			err = PTR_ERR(ops[i]);
>  			ops[i] = NULL;
>  			goto unwind_ops;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index da9d7ef6ab8f..fe64ce6ed1d9 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -121,6 +121,9 @@ struct xe_vma {
>  	 * Needs to be signalled before UNMAP can be processed.
>  	 */
>  	struct xe_user_fence *ufence;
> +
> +	/** @debug_metadata: List of vma debug metadata */
> +	struct list_head debug_metadata;

Make this a substruct, e.g.

struct {
	struct list_head metadata;
} eudebug;

Use the 'eudebug' sub-struct in any other common Xe structures too. This
gives us scope knowing this belonging to the eudebug layer.

With my comment about about layering, only the eudebug layer should
touch these (i.e. xe_vm.c never directly touches these fields).

Matt

>  };
>  
>  /**
> @@ -309,6 +312,8 @@ struct xe_vma_op_map {
>  	bool dumpable;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
> +	/** @debug_metadata: List of attached debug metadata */
> +	struct list_head debug_metadata;
>  };
>  
>  /** struct xe_vma_op_remap - VMA remap operation */
> @@ -386,4 +391,14 @@ struct xe_vma_ops {
>  #endif
>  };
>  
> +struct xe_vma_debug_metadata {
> +	/** @debug.metadata: id of attached xe_debug_metadata */
> +	u32 metadata_id;
> +	/** @debug.cookie: user defined cookie */
> +	u64 cookie;
> +
> +	/** @link: list of metadata attached to vma */
> +	struct list_head link;
> +};
> +
>  #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index cddc36c9be02..eab503754735 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -886,6 +886,23 @@ struct drm_xe_vm_destroy {
>  	__u64 reserved[2];
>  };
>  
> +struct drm_xe_vm_bind_op_ext_attach_debug {
> +	/** @base: base user extension */
> +	struct drm_xe_user_extension base;
> +
> +	/** @id: Debug object id from create metadata */
> +	__u64 metadata_id;
> +
> +	/** @flags: Flags */
> +	__u64 flags;
> +
> +	/** @cookie: Cookie */
> +	__u64 cookie;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved;
> +};
> +
>  /**
>   * struct drm_xe_vm_bind_op - run bind operations
>   *
> @@ -910,7 +927,9 @@ struct drm_xe_vm_destroy {
>   *    handle MBZ, and the BO offset MBZ. This flag is intended to
>   *    implement VK sparse bindings.
>   */
> +
>  struct drm_xe_vm_bind_op {
> +#define XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG 0
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.34.1
> 
