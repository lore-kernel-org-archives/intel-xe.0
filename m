Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B26E6BF2F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 18:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BF710E1AF;
	Fri, 30 Jan 2026 18:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qh4yJrV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6DB10E1AF
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 18:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769797839; x=1801333839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kmtTsvhuuLhhtdf9uQojK3woWLVe9qFKI0eNW8VFess=;
 b=Qh4yJrV4yxST6hJQZRK3buBG8NvsRo166LiLjUx8CUaqe0zSnI12k7OD
 mzhMeTyTogovCJ9quNFqIRAl4cD4v3mySfWrE6sSNerEo6vNUTq3QuP34
 lbXhriBwB/hPdqhxCLXzW0ZYNfltsdmQHmMblfGrjpI/IZ51FmErhfL5n
 GcdQtVel2JZyL2voyKDNPytiorGVWG9U0IiMaNt6yjanQF0NX7rTyppGm
 s+TX0R5cslhiAwDGsGlwxpfIYmckt02i+NWc7vkG/8d71pnL2N3jIZWCU
 t8HfBbE37Ruwms+8eEevHu6nYan+iOggYJLGxvLW66RUciDugUnnnhiXv g==;
X-CSE-ConnectionGUID: DUkr28bbRYavzpNcZonWSw==
X-CSE-MsgGUID: TmfwadqnSyKlueRH5RUfzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71137561"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71137561"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:30:38 -0800
X-CSE-ConnectionGUID: m5fKFouRTJKTXXw6z8spTA==
X-CSE-MsgGUID: PjyLKhXUQtSg0e+yVQgQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="239643371"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:30:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:30:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 10:30:37 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:30:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIDkXq2ra5sDFMoYrDyPNbgJ+BiX0pQq1jiYcVP/3c2qQKf10boqBpDnCwsQfN3xaI0nNRxx8YHiwmoq6G3PzSvaxNqH5dhfpl7f/fG+Hc8AAkDdhYEoIqelsvcv7IWLaBxCMYthPCFfyLjOg9+IYWz4Bcsz61iJk4iEkcZZMd8O1a8/BqjW4E4X94KfnvPXQTJ6OHuGqTK3opPOlV1nXAAgd518S7WcprbsZ1v1Kqkb8bRs9XRZRpY0vWOXEnTfZG4MOK3ijW8VusTy6Ip0s1jNvc8RSbSY+EImufKMTR1GLu/+U6expoQAa1CAzKaS3HHw4K22AKX9SagLFL6nXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTvd45GNirkd8u4B3gWC42cxkeSXazIa9PZ/GVzOwRE=;
 b=tvG8r8n8PB1FrwT3NDDVtmfSSQIGhrdaBRg7Ts9iq5uidylzvoEegshuMdFy7zLtwtNyhHG78IL9iwrdBXnIBxmcNhBritJok/53SmBWtHLbIq5wIMPeE3MWHXjS3HBzmonCrQaux5N8txJOTWXv3/R/PjaGUcaPAUa8nP20Fge7zGJNFrLvK7tKvPj93HRuOT8AGcNcT1zK57bHdEnuaTbklQa6N6N8pbUFCHrtQByVJewKC1IwknV/cOsTTNPVVvJnKJFTDFhaiPlH3iffL7yPpUKgNLjP6wJD743S1Tg3DOl5ZoZYuE+0a4uvbChOFiIUkDfz/DFB4RpquYpIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 18:30:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 18:30:35 +0000
Date: Fri, 30 Jan 2026 10:30:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Brian Nguyen <brian3.nguyen@intel.com>
Subject: Re: [PATCH v4] drm/xe: use entry_dump callbacks for xe2+ PAT dumps
Message-ID: <20260130183032.GC458797@mdroper-desk1.amr.corp.intel.com>
References: <20260130175349.2249033-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260130175349.2249033-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f8f24b-5746-40b1-18da-08de602da86b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sd1cRraSUV52OLS4fwnN2KGt0LZ/1uelYMam2ohWhY1hLz39hDFkLGzmHehi?=
 =?us-ascii?Q?CFeYnJ2T1KdjEDQaZR8EP1MMDTECph2C/YBAhlJgnZkYRjs7SKMAq1jDsTII?=
 =?us-ascii?Q?3iQgdtUTLs9xXkLdVpf1PoNSPlBy3NNGkrO3L+0nToGtiHoWPbfYDdje0nx3?=
 =?us-ascii?Q?CdjdFbfNQcLCVqx3hel5KmjGBwN7+cwiefr55CgMhmS39JCtVt0tROkpeR8l?=
 =?us-ascii?Q?piv/BjDGJcv4jn5FC0a9HLikEeHxtGpVdjt5OImBe4lIXbfv8PKzWkl9wogD?=
 =?us-ascii?Q?hbAZNHbtYWxcukCWoZdcn7i/9iu4FcvKaRbRuaVQM8ulV2wyl0vruVWqACgp?=
 =?us-ascii?Q?zv3FFHL1wTKYwxPcoOsRQ38xKbi+aRDxyMySjrLo7hyC0ehsa0lCCZFLcA63?=
 =?us-ascii?Q?dXQmTO385GYJKHpLJduHLF9Mu0u4qrDzQ5LJULfgKstL0lXzInpKBCptmTSi?=
 =?us-ascii?Q?9uiCSjPLJ8s0mn1R6pwrMbGXEKGlNXSyt/DpKmAOkgMhWtlhFvHKhiquXAlv?=
 =?us-ascii?Q?2755ANmfnEYuHerySeEgHZMTMZFnwF6HecX3BdH7OaTqyuVdy+C9ksfXgzE0?=
 =?us-ascii?Q?ElQP+Q5zOSEm1kcKuOuOxBXteAiQwxHZ6VlByb059jpwHk1wpRc4OgPeI2qs?=
 =?us-ascii?Q?ikaYXj41d5wexPNUlsWwO2js4NYbnJ0Fs2ukkw5RPottDJLyTobnBkdLOKhT?=
 =?us-ascii?Q?unGwKuSw4IlQls2bfwfMs0ik479SfqqpaGMyKVmJpNvIsKdhqBXm0GVX1FcL?=
 =?us-ascii?Q?Ha4Bv3/DClXn484PEzOAIIaqMA1hnPlKM6cC8sqomcYbHmDS8bEBic48/7w1?=
 =?us-ascii?Q?pmVLO3/v+1t+X6khKjlcBZZBewGp37W2l0Kdvd2nSubmtdaJTjdQAMwPCdWn?=
 =?us-ascii?Q?dgWOla80itSGDA11tq39OMkYE4CuDW3BqozRWbduyjp6lB/Tilg9X/lLzF06?=
 =?us-ascii?Q?selTew4oevgefDMWvDrhjr/WbXEvarPJFMa+W3WNE2xL872gVInSOPXvSV7+?=
 =?us-ascii?Q?I12Tpml9kdJtEHjew82usoU70GOabit7z4mwsB1/PG52hXXc/G5uT+h7Dm5a?=
 =?us-ascii?Q?xuzxoSxmvt88vDd3+YKNoXjrgYVHjKN9FI9eEkhQWMGNqJXKsAmdiGkbJDTt?=
 =?us-ascii?Q?e2F7L4K7E/8c2QxVS1oeFSPQp8Oy5R33GGMci7UCA9bK1kjod4tYiLLobZtX?=
 =?us-ascii?Q?9OoJhsZ2W96MWtvN69c4MSwpoYcsZIwHaDCN2II7UllhG+BZQghQ4O6pyGP/?=
 =?us-ascii?Q?0Vj6d9ZLKo9sX0/zEMrFANjdA4YAA3gLyMAQOI+v2e3zMq6Dd6jwwei4A2w5?=
 =?us-ascii?Q?mG4sYDaBrmzsKXwOFRIbxkaUtkcArXhpvkq8iJJ/p3q9f1JnLF1g3mgq4JbI?=
 =?us-ascii?Q?xOT4ZUZurCSw/NuUVkisobg0kAB9s0h08m8iHgTzHD38s1Q4NwfPfL9Yd03V?=
 =?us-ascii?Q?5pgJ6mdJCQLEdSMwLBGUpOB1IdpqsKW2tIC8o4+64hlHspHpkkkPecfpzSzw?=
 =?us-ascii?Q?uyYbsDwlzRdQPpCLZnP0k/TLJuVZUMdgSMfB9/xuJYbM6xhK4LgZVJCeizR6?=
 =?us-ascii?Q?Rodjdk67rhwE0PcpHHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?APlaBXQoG43ykpTGPwX/CSqXagFUSST3c0NrRx7JfSseTZbUX4N5FgDS3J3T?=
 =?us-ascii?Q?jCYELj+/kvsH9xjfWbXicucoPvTd1oUy7neLvhWYU3anr3wlHMle8M6ludJo?=
 =?us-ascii?Q?21DuPyDZo6kb7THv3t5WEOuDmTRJq6AcOOAdIicsNGEeso0c12K/Ebz+j12V?=
 =?us-ascii?Q?i4v9YjOsmsgC0ctFYxtrIMmvkFjyMpxOTDL4xa8KfalTWIo4UdXSziFCee5C?=
 =?us-ascii?Q?xh/OY96XQEqb8YmQ7DBOS3XPBTGgBlW9LijyWH3GQ1+f1pqIU9QsCiRMrZ5g?=
 =?us-ascii?Q?OdxL47WthvGG8tJefTbCHoZHmUfSVABqee8nHfXbmGgXW16LRcAEVmF0pgnJ?=
 =?us-ascii?Q?FnMjwyeQeghn570nul90fk5JaMcgFEROs1rQm5hjWFo5um9SZ47Y0Zkp7KOZ?=
 =?us-ascii?Q?vZWXxDu8LqryRCVu7w3pDZBAwOGxDsE6imAYik8G9Y2BPxYU9DVw/MjBifcP?=
 =?us-ascii?Q?WtzJ3JhpUFvD8xzOr9/YQtqSq4Cusd5sZac+P1bTZGIa3L6F7WDM0x3pBEyi?=
 =?us-ascii?Q?868/U+QpWwNU6t5rsCHW7gV/rIr8UZNK1pDFbv0TbdpNLnjNkAt2v4+FQrFN?=
 =?us-ascii?Q?n8wwFWBooiNgfvJ2e/vE+j1Rn7wd9dVrb1O6rwohTTfashDAcfFm3zsuBoA8?=
 =?us-ascii?Q?d0RM/h3ZF8fwze//4gXDWmdze1LvAusEIpIDRh+FCLDKRun1VfbDRnlddD8e?=
 =?us-ascii?Q?tKUJS3fTZs5QwArMyn8sJub2JbgdsGOnyT3EddwPe92jAfrcWCp7S9E04YC5?=
 =?us-ascii?Q?ni3frZZCbmmxaELGIFe4lOUAPVnu3wGejdRpJsdzYDJ5Vg2blXQnFVBG42X3?=
 =?us-ascii?Q?wq2YuIIOALtYG2mp6q5C2L6OoMJUPdvzTxZxl/eNj+k/T4YNDMUajLDHbIEM?=
 =?us-ascii?Q?rm9leNSkPbBVYbsnpkhfHdTX8QHAns6QqqVtVbREYKnSIFnUrDABFAWK9foZ?=
 =?us-ascii?Q?N2kQRmH4matUMnuQ+eOnK+40vJ+ut7N5epGBdAAHeoKvSfOVs/HBoh0Xna4A?=
 =?us-ascii?Q?nzivGT1hxr+tSwsmGuvcGNMF3M+U0B3SgyJEL3lPiS8Os4zbXVX35ekuPpAK?=
 =?us-ascii?Q?7NBhCREIzLJC4LY6kQfFEqbtOnRAeftQDKFVzLzIj8hNu16alcEc9j3R4Le4?=
 =?us-ascii?Q?1ot0p+HS00dYPuyBXPKLy0y2jTkQYS7Aqxf3u7PQfQLU0eU57upwczcKYfQm?=
 =?us-ascii?Q?i/Nv0jJsPQfHGIbfYy0LWx/ALJfLfuci/DrpswjtVSHtnVWfl8sZLpeRAdHr?=
 =?us-ascii?Q?lH9b0BBjR3TrmNe6wqJcr/uxJSlOfte8LbCswkm3KUGVjIX3DuTReVhb7ws8?=
 =?us-ascii?Q?e+BwD3NctyHglkVTgYyIlg9nwFSQyOM5GJ2Pyz5jPo4G8PmFLUvw7slnpxpF?=
 =?us-ascii?Q?Y0LzbHs7UKOxEIXuXy9+mZIv1MwErX9Kp+JLW2YiBY48AK48XQ1gubiPCOvo?=
 =?us-ascii?Q?obNBFGZiPkq/+g3j6gdlnzzrLBTJyVdUmk03L/yV7kG04nGxvQLCvdL6H8jX?=
 =?us-ascii?Q?FQiwGiDbGO+Wue3zXj45mstQBo54XLo0e71TxtPUWZcq+JnjT/ghlApWpIPv?=
 =?us-ascii?Q?d+F0pHFsaJc+R2tDhGYCPJcQ5SbmBOY7B5uJdWEXMZ7REdzjNduBayPKXDxQ?=
 =?us-ascii?Q?4/Hj0TJreJn3i5augrdp+aNMpkW/L0RsrwtbcI65QEuNI+lpBebS6EdPtoFD?=
 =?us-ascii?Q?GN/zz6nVZGf13icWUWxdxjcvuM2RdkCAROuLgmRlim3u1m2wU+W0lAFE4ff2?=
 =?us-ascii?Q?/r/Txhpiq0y08WRW+IT5BMYEyCyN6Eg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f8f24b-5746-40b1-18da-08de602da86b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:30:35.0245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKTmxer5FVvY+lK9V4RuW7iTWQjPVwPZ2wGx5jONF3lEx7fK3/jxPAqKUYgAUZeQMztdp0Irgj8KiPu/ZlvloZsXYdHP75SJ1/KZHTrRYN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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

On Fri, Jan 30, 2026 at 05:53:49PM +0000, Xin Wang wrote:
> Move xe2+ PAT entry printing into the entry_dump op so platform
> specific logic stays localized, simplifying future maintenance.
> 
> v2:
>  - Do not null xe->pat.ops for VFs.
>  - Skip PAT init and dump on VFs (-EOPNOTSUPP), avoiding NULL ops use.
> 
> v3:
>  - fixed typo
> 
> v4: (Matt)
>  - Switch xe2_dump() to use the new ops->entry_dump() vfunc.
>  - Remove xe3p_xpc_dump() and reuse the common xe2_dump() for Xe3p XPC.
>  - This also fixes Xe3p_HPM media PAT dumping by using the proper
> non-MCR access for the PAT register range (bspec 76445).
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 67 +++++++++----------------------------
>  1 file changed, 16 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 14d0dce5190a..2cd3fd1c3953 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -88,6 +88,7 @@ struct xe_pat_ops {
>  	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>  			      int n_entries);
>  	int (*dump)(struct xe_gt *gt, struct drm_printer *p);
> +	void (*entry_dump)(struct drm_printer *p, const char *label, u32 pat, bool rsvd);
>  };
>  
>  static const struct xe_pat_table_entry xelp_pat_table[] = {
> @@ -458,7 +459,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>  
>  		xe_pat_index_label(label, sizeof(label), i);
> -		xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +		xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
>  	}
>  
>  	/*
> @@ -471,7 +472,7 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>  
>  	drm_printf(p, "Page Table Access:\n");
> -	xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
> +	xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>  
>  	return 0;
>  }
> @@ -480,44 +481,14 @@ static const struct xe_pat_ops xe2_pat_ops = {
>  	.program_graphics = program_pat_mcr,
>  	.program_media = program_pat,
>  	.dump = xe2_dump,
> +	.entry_dump = xe2_pat_entry_dump,
>  };
>  
> -static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> -	u32 pat;
> -	int i;
> -	char label[PAT_LABEL_LEN];
> -
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> -	if (!fw_ref.domains)
> -		return -ETIMEDOUT;
> -
> -	drm_printf(p, "PAT table: (* = reserved entry)\n");
> -
> -	for (i = 0; i < xe->pat.n_entries; i++) {
> -		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> -
> -		xe_pat_index_label(label, sizeof(label), i);
> -		xe3p_xpc_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> -	}
> -
> -	/*
> -	 * Also print PTA_MODE, which describes how the hardware accesses
> -	 * PPGTT entries.
> -	 */
> -	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
> -
> -	drm_printf(p, "Page Table Access:\n");
> -	xe3p_xpc_pat_entry_dump(p, "PTA_MODE", pat, false);
> -
> -	return 0;
> -}
> -
>  static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>  	.program_graphics = program_pat_mcr,
>  	.program_media = program_pat,
> -	.dump = xe3p_xpc_dump,
> +	.dump = xe2_dump,
> +	.entry_dump = xe3p_xpc_pat_entry_dump,
>  };
>  
>  void xe_pat_init_early(struct xe_device *xe)
> @@ -600,20 +571,17 @@ void xe_pat_init_early(struct xe_device *xe)
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
>  
> -	/* VFs can't program nor dump PAT settings */
> -	if (IS_SRIOV_VF(xe))
> -		xe->pat.ops = NULL;
> -
> -	xe_assert(xe, !xe->pat.ops || xe->pat.ops->dump);
> -	xe_assert(xe, !xe->pat.ops || xe->pat.ops->program_graphics);
> -	xe_assert(xe, !xe->pat.ops || MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
> +	xe_assert(xe, xe->pat.ops->dump);
> +	xe_assert(xe, xe->pat.ops->program_graphics);
> +	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
> +	xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
>  }
>  
>  void xe_pat_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (!xe->pat.ops)
> +	if (IS_SRIOV_VF(xe))
>  		return;
>  
>  	if (xe_gt_is_media_type(gt))
> @@ -633,7 +601,7 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (!xe->pat.ops)
> +	if (IS_SRIOV_VF(xe))
>  		return -EOPNOTSUPP;
>  
>  	return xe->pat.ops->dump(gt, p);
> @@ -658,12 +626,9 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  	for (u32 i = 0; i < xe->pat.n_entries; i++) {
>  		u32 pat = xe->pat.table[i].value;
>  
> -		if (GRAPHICS_VERx100(xe) == 3511) {
> -			xe_pat_index_label(label, sizeof(label), i);
> -			xe3p_xpc_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> -		} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
> +		if (GRAPHICS_VER(xe) >= 20) {
>  			xe_pat_index_label(label, sizeof(label), i);
> -			xe2_pat_entry_dump(p, label, pat, !xe->pat.table[i].valid);
> +			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
>  		} else if (xe->info.platform == XE_METEORLAKE) {
>  			xelpg_pat_entry_dump(p, i, pat);
>  		} else if (xe->info.platform == XE_PVC) {
> @@ -679,14 +644,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  		u32 pat = xe->pat.pat_pta->value;
>  
>  		drm_printf(p, "Page Table Access:\n");
> -		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);
> +		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>  	}
>  
>  	if (xe->pat.pat_ats) {
>  		u32 pat = xe->pat.pat_ats->value;
>  
>  		drm_printf(p, "PCIe ATS/PASID:\n");
> -		xe2_pat_entry_dump(p, "PAT_ATS ", pat, false);
> +		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>  	}
>  
>  	drm_printf(p, "Cache Level:\n");
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
