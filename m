Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46C0C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 21:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6A610E155;
	Fri, 21 Feb 2025 21:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRzFFPXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31B810E155
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 21:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740173539; x=1771709539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pHqLaYvFYY2Vu2SxhSjgd6cXSLHJklz8PvYxlbbB2Qg=;
 b=SRzFFPXZToH5CDFZTXeTd3MMKfNymiysEKpkguTiXJVyxfQoUVgLt/kb
 8wQHJM7Zy1VyLslihsmdVEtzt6uSkykjy+tBn5T4q3HhnNWKnadH8f0Tz
 glqFfwlarGKqv9VBmdu4hDLocxorYpAb+x0P+jULDaBWzZ/6LirRYIKBS
 ExMKS9Yau+2CUC85pUEiBO5MC1VAbU778L3K8e/kkOiOmRfkLzb2fUurs
 Ce2l5Xz6TEf4eBpCvkFXSmJdfDG7mn2U6E1SpzBKwxeZW9eeky1rRiI58
 nj7J2WUeYv22j2hiwnjYta+ASUdkFkpeGz2bRKuprwsyyQLca/54a4+B3 g==;
X-CSE-ConnectionGUID: 2KGTS5a9T+6ncBqyiVY6AQ==
X-CSE-MsgGUID: w3t5SOF5TfudhWQT2J3zVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44655495"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="44655495"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:32:19 -0800
X-CSE-ConnectionGUID: ChPWYJqMQf6yPTRPdDo8BQ==
X-CSE-MsgGUID: cb+PBZxHTgy/D8HCXgUK1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115492296"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 13:32:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 13:32:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 13:32:17 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 13:32:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AApQnxzBjSUMxmvMti6tm2Era8EbohxwYTaLq4Ty4KMdTORBySXqLqkG8N6wPB+Ku4BUae06/gZbdy5c5vpnufrbpm8CwfY+vsjBudnjOvJzNVb7YSusYUusuoUMupZZrSLPbke0HvbM6cMkPdhl/0YK2QRk997hVk7a4kaRZs5WCW7MJzI/DBFM3XjFfMUxc6Vs1YV84N95rxxysKBdZiwzJ7hrr7EqzWVxSVBH4nf4FgF4OpdMvox8j+ZySfPLxub/Zsr7frLq31Du2luuDWZuH6XX+Sgs7+zMS0aOCGXZdu5HTYYbO74UD8szNKVdUIC3MtBKksZwl8cLaw3ebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jmkw5k7WS7QSAuzQjIBv+uZQgCxgv41Let/AYIQK8E=;
 b=Zk11X79lsS3vB922Il9me+U7EeJUTwyNDwbnXGusSTPZKQTFGscWxaLAT+rsw2eu4gWo8TpNwp/BIZxdGPwhVy9vYjCjzA8YGe2RE+aJ4lmPXg63yLuZ0JGe739S3fJkimA93DUt4E+a7Fvr3NdZlLZq/Ef87dDsl14n45NcWmTibw7GQUYTmDgbTcN8j94mJXIylL6FLYRaLyjCwdEl1l5mxKTWVC/OphycXFSnsgzJhHLOL5f6YrdL+gXfyQbFAy/CYykxCpfcRvQD6ap2ivPApAwT23NIJNbRKFNNgUcx4jWXRAhUoNJ6SsiHDeh1d6nBSZdCFVAubSUt6sEf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.14; Fri, 21 Feb 2025 21:32:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 21:32:02 +0000
Date: Fri, 21 Feb 2025 13:32:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/7] drm/xe: Re-use feature descriptors for pre-GMDID
 IPs
Message-ID: <20250221213200.GA5109@mdroper-desk1.amr.corp.intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
 <20250221-xe-unify-ip-descriptors-v2-6-5bc0c6d0c13f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-6-5bc0c6d0c13f@intel.com>
X-ClientProxiedBy: BY5PR17CA0064.namprd17.prod.outlook.com
 (2603:10b6:a03:167::41) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ae7678-337c-4a88-6311-08dd52bf2dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jbRpN6qHUqhLiBO4BPC9Qt4gAU3tWwxT3grFchYVWoNhBzVANIBMxCwHjzDT?=
 =?us-ascii?Q?9P6LrBMjp3XTf3a07I0HpzAYpElnfgqqHMmAHg7tUXBNi9xPy13PniZxOf2V?=
 =?us-ascii?Q?uG+cFEoiTX7sNqFtaEttIzrBnsvnbgY4CTVC4G1qEjTKi9+8s8OjQhRC7Yi5?=
 =?us-ascii?Q?qM+eLRNN6klU3xWwCXthm3/MT0zJWYo/1h/WiNNFOutdcWETLjIavukFo4il?=
 =?us-ascii?Q?mpnLf8qtlTv1L2AqBSjXg7Jq9uVJHcdOJm/SZl0uFAyQJkrrdsfsMpO9z8QZ?=
 =?us-ascii?Q?CQYVqhDwIW/rVsc2RVRWjbga8jI4obI3Ytidk7PrRZjgeH9p4dFbQeYfHZfZ?=
 =?us-ascii?Q?jzykm1XKvuZYPDksj3lXLs61/Nk561t2vlbQS9WLpb7aAZWITRO11ut10mbS?=
 =?us-ascii?Q?Y/Q3+M2ZwV+ahISPzc0z2EUwftTFjSkIh9YARtBSa8RxR3xpONHYWfkZF4vZ?=
 =?us-ascii?Q?mz+rd6La/cI64fao82Z/LP4SOEJg0zKI8ZsZmlkYLOo5jbIPSd11IFD9q4+Z?=
 =?us-ascii?Q?LGnZ8emTslna3D9K4aV6fOiMJyADa2jA1wrPAIxZoA1P0FNUca934hUV0Gb7?=
 =?us-ascii?Q?TSCNRTyq/ewGafCBk5uV7b9taXD3w5qWw+reWxxltRqfsjiWgrEUeK/I2aHc?=
 =?us-ascii?Q?L36HR142wKRmRiI91U/P4n6PWs1n1lJJbc/WTqPmvPiUw5mg62Juv5pwx+uj?=
 =?us-ascii?Q?WMeYDujEU4WxEhOwARp0ht5RUf7br8Q6LOzmZmHJfMOJCO4fFY7UG4y9FOOm?=
 =?us-ascii?Q?BdOBI1w2AwJHQmLM2s4EQlCZx7wvP0SbQbj6o0/ScLk8zaJ7ddRFDlip3X/T?=
 =?us-ascii?Q?Lqk82EIIFhnVtFJYB8Q/OiHHcrKIvg2ADFfWLorH5ILHSZAcXiwgZad1FrYR?=
 =?us-ascii?Q?u/rq9nTmkrGayKS6cwOp15JYsZX0vRNr4fTxSCEXsJlCaVwMoMNVSuiD/ONi?=
 =?us-ascii?Q?V66SQ44y7/krDBsQgXlfMJ/rMykvdF3171Ll8egSxKoyUNuNV2LQsZ0d7NJj?=
 =?us-ascii?Q?gZcrbLt+vo+nLtDqC5sdsvez9SwG21KO82+3v1t1lqH3TGX6eoxHl5TtqHoj?=
 =?us-ascii?Q?rXDdE1C2L99l4gEkKwRLWUBNbXR0bHSBWVV/qRpqGn/FaLTcKeyIk+0kaYZM?=
 =?us-ascii?Q?OSTPTi6zTubL4hOQM/SJTTvUHxeQgc+q6OPUBk3CvL2HDmKmkBfwosNOhAFy?=
 =?us-ascii?Q?hKu1XUjX6ZLzNbI+IHNxejb9r/YoyOeiJIGaqs+NJZ3Zo3sNbK1MYAW7wNOg?=
 =?us-ascii?Q?VgGojz8J4Gi8gLpJ5e7cUXqvzi/RJH18fINFJR7DSnfjDYLQ2Rri0sBSsIOu?=
 =?us-ascii?Q?/eoq5bzLM3dWVMngFuXWlM0jiqe6dIxe6JcPnIPLKIccntaePnlfLXPeaQJL?=
 =?us-ascii?Q?XC1nRn3q5wR/g7VrMd7LAXrFo66A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KH0nGw/52/uYjt6v+WZlMkKbAkj3YxcF8t+E9r6gKqfLahARckxd48eb7tj/?=
 =?us-ascii?Q?rjdM7RNP2jJwHXZzkJ0gtDjZrGc5a+Q3przkM6dEEsttz6WSX/vvBo3w5vLA?=
 =?us-ascii?Q?wttTk9ODMj5ttHqTnk7tEUP9/p/wzVVhW9IcEi/KOjWC3T5NkwqKJfYT3ODA?=
 =?us-ascii?Q?kdmlS5hPGWzJ+Cx3sLZ2LsJIYEVBzmwG/i6XG9s7zI4sLdLCtbSqPWJH4e+K?=
 =?us-ascii?Q?uJO9+3Bw1xyJUdHv1SqZ+BrARGI6cTkbvT0PA8nkz7GDPigqu+w/NQ86SUYw?=
 =?us-ascii?Q?CC759irmx0eMJTLaaM8K8p7GDtmHsMMJRqQ336XQWqasmUt0wuBd8HwJLxfi?=
 =?us-ascii?Q?kknynPn6bQxl68rqvfSfskUyCViwgcD3aYU9PnUUXP8mJmT3LHrXvge+KkKK?=
 =?us-ascii?Q?PEXsl7zCFbHJCmb5QE47NZElSwd7PpPKmSEaK7sYxnhKJIAmi69mcjjumaiN?=
 =?us-ascii?Q?fwbBlckMJaXLzp0VdomTPVGW6xIAYyjMY6H05ejx/nvrfeDM54z/zs0K/eYL?=
 =?us-ascii?Q?rVujUD/kgyQces0eeg6gVy5wdbgQadwzgFQ4LmMBLHQJr0mbhLC99PdwTHlM?=
 =?us-ascii?Q?KwHX527KfE4igjt6E4xiUBrv3P6XfHNcvo3zOgAOhFxjtugmIeng4dgdMS+3?=
 =?us-ascii?Q?iLrfMCVzLEtItSjBDTdVrrUUMUhkA/4aieEd+O7ub/tSnH/Gk5q02EU7+Bqs?=
 =?us-ascii?Q?H6ubOchBpf9VcJ+6EkssuNWiKhZu9hoSBFstMnmcD4uK78fWIlhJfXMZ8S8r?=
 =?us-ascii?Q?KeRn94+HjsHjpgJtT0RGnKbcj+UdHcgvpBEaYc3SbWJo9I8iqul8666FCQQe?=
 =?us-ascii?Q?TPUi/o20nXkSgsq268LSpeibQdTx38nu2Cd1VEcu0W/Arswfohs8KfoYK6pF?=
 =?us-ascii?Q?twIkRQF6QRdjaiMozIjsZ/PirtZVe76P5YOUZKnB1OgOrHm9Lfk842w88CKo?=
 =?us-ascii?Q?svLM2DtJPX311ODCs2cYiElUV6ncUP/pnxdN3NZIDzm6C8MIzv0XivYtMeXk?=
 =?us-ascii?Q?7oyyC3bzwB5tRV6eQk3IyLHDD9eBjrSwTdgqcYoEKp7axULycOagoBhJ1gzp?=
 =?us-ascii?Q?9NvpsjPgEoafe/2MpOasE+8LtV99d3p6EsboJmWc/hDi7qBB50+zJwmikPo5?=
 =?us-ascii?Q?QWVDy1FaE+KDOvwIzARhwKTdz3/WITtiOH4Bm2LE4Rs5sTHxkXIC9KmVEiHo?=
 =?us-ascii?Q?v+DEpkTXTDgl4NC4V77hIqeD8TFkLxugIdu3LJqpFqqdh7FsFDXLdkelUm9i?=
 =?us-ascii?Q?DJBEJm8/KuBrW3OVwzmecCfk5bvnN9XubRij7H8WFRkR8UknvmdZQkmmFYuS?=
 =?us-ascii?Q?w3xHNv+yoptERkLTvjPOIB5nDyxikLzMDq+e4Fmje9Di7cNvfMnjRVuBy4W5?=
 =?us-ascii?Q?+4A1L9tD7E9vXzrbcRi/WSBpxv9VU1P4gygrWl+4xp0XMX8+nPCjKcjVL5+/?=
 =?us-ascii?Q?bZuZA6THoJRI97CoR1HcT9K8If+FttEOITN+35C5C4rKtNZcdCO74SYuQ754?=
 =?us-ascii?Q?bRU/KjS+4gaoA2dttIULKCo4z4764NXseSoNoxSrTxXlroEL6UWvWsqDw4g6?=
 =?us-ascii?Q?UjtQ3hYU4rMteWl3uHj6aenKOsZ6C8tZ8AY+Uz1KMQkR9pMKV0YOqJ4iBrBS?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ae7678-337c-4a88-6311-08dd52bf2dfa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 21:32:02.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faRiljkIEV1posgBai9Ig0TqgUooC5Ztj7IqGXZbtkBrIgjLR90sajAali9f09rrXrk2o33e0qtDP/oD8x905PCntXwJb0ovYVLnqULhG3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
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

On Fri, Feb 21, 2025 at 03:51:45PM -0300, Gustavo Sousa wrote:
> Now that pre-GMDID IPs are described via struct xe_ip, it is possible to
> re-use the feature descriptors that have exact match with ones from
> previous releases. Do that.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

This takes care of my comment on the previous patch.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b533251300bd4d086618d2a98b44eae52e996847..55162296e01873681af006c3102a188ee9a9d100 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -88,13 +88,6 @@ static const struct xe_graphics_desc graphics_xelp = {
>  	.vm_max_level = 3,
>  };
>  
> -static const struct xe_graphics_desc graphics_xelpp = {
> -	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
> -
> -	.va_bits = 48,
> -	.vm_max_level = 3,
> -};
> -
>  #define XE_HP_FEATURES \
>  	.has_range_tlb_invalidation = true, \
>  	.va_bits = 48, \
> @@ -164,12 +157,6 @@ static const struct xe_media_desc media_xem = {
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>  };
>  
> -static const struct xe_media_desc media_xehpm = {
> -	.hw_engine_mask =
> -		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> -		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> -};
> -
>  static const struct xe_media_desc media_xelpmp = {
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> @@ -179,7 +166,7 @@ static const struct xe_media_desc media_xelpmp = {
>  
>  /* Pre-GMDID Graphics IPs */
>  static const struct xe_ip graphics_ip_xelp = { 1200, "Xe_LP", &graphics_xelp };
> -static const struct xe_ip graphics_ip_xelpp = { 1210, "Xe_LP+", &graphics_xelpp };
> +static const struct xe_ip graphics_ip_xelpp = { 1210, "Xe_LP+", &graphics_xelp };
>  static const struct xe_ip graphics_ip_xehpg = { 1255, "Xe_HPG", &graphics_xehpg };
>  static const struct xe_ip graphics_ip_xehpc = { 1260, "Xe_HPC", &graphics_xehpc };
>  
> @@ -196,7 +183,7 @@ static const struct xe_ip graphics_ips[] = {
>  
>  /* Pre-GMDID Media IPs */
>  static const struct xe_ip media_ip_xem = { 1200, "Xe_M", &media_xem };
> -static const struct xe_ip media_ip_xehpm = { 1255, "Xe_HPM", &media_xehpm };
> +static const struct xe_ip media_ip_xehpm = { 1255, "Xe_HPM", &media_xem };
>  
>  /* GMDID-based Media IPs */
>  static const struct xe_ip media_ips[] = {
> 
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
