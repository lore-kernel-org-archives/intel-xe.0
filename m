Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D47C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 05:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312F010E4BB;
	Fri,  8 Aug 2025 05:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMp2roMt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0654110E4BB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 05:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754632059; x=1786168059;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o+cGZfvay6hIseS50JbvbW2wFm7SFySlab/cAx/vihQ=;
 b=WMp2roMtzS2IfzQmBR+WFj0y554UcRyfRhU9t1JPefdkuTszZQEd6VfU
 A7eqajWxJYxodqemMRYJZ7HoLyLThPO0/2Rv1pWVoz80m3mHOfdAT85+A
 r2q4SGxJyJ7eh3/C8xLAwm4x8fOgaMXst+uHKZ5L8sPrlxae8yy1GfbBU
 orqEbPxz3J29IdirFmrNOKQyEWdkBRbznAsnx/o4PHyr2wBBWf9da+PQK
 EmFU8Y/mv7Li/ySjJlj4hyv5U09JdNOpd2de8bmjTMessIzIiQNSjOm1F
 7DW5x2q4XsjuqZGQ/1iFBjtCJCI/TEtKLoXHnNrDZ4np+LyFEOnigxjwo A==;
X-CSE-ConnectionGUID: ilvh0HS1TZmqlwCW7L5wGg==
X-CSE-MsgGUID: lpa5Pb5+SqeIPNtyyDoykg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56898384"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56898384"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:47:33 -0700
X-CSE-ConnectionGUID: ITPPPaWmSUG7zXy+GUyvag==
X-CSE-MsgGUID: C0c2RRX/T3+Z8MF3DrHIzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165148370"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:47:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:47:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:47:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:47:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVx6PfXRst9rRfDJ+Ho28o5RnR4lnDE7WQeHnH/I3OH63qyzk4iuvuUy2emlc1OAVpET15OKvKUjGBXDCdamhHAUFy3HQ4ILFGZUrKg3OWyLxg6MhTiy7aJMYAAtipiUnfObusUvD2ns0GlEE7t0F30Ryaye8UjMNDoclMks9zxgqt7pJOb3J4ShGjl8HkAwCc9gTo5BeWGVPOUTcGfhxaIA+JlaB7XH3FUXu2mVngzoOeSDZ70gjwABFRbmL5tKSbaCiSpRwDrx/cEE2fYvXlPpeKD6BrI6iqCtA/hN1zlOaBgz+vmW5b/Tcjq3Ne97BVjyTv3z0ZYYxb9C8rKX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9+pG/icJBwD5cZtN+LGsT/kK5ZfrxeguahFz0TFCqM=;
 b=eonBp3/fWIk3wbdt1H6xzHJRMJJMMzpJtK6AdIe0aZEiHju9cp8GhUhyKAPlDng9DMDvDGz746hKvyCgl3/3FThN7b8SyXFWiHHbvnFGIywcDwogVB7tFr1BLZ9Qr41h5rG20ljfZGcb9raDsgqASRbm1k125dD2T4XXAQIawedyjsv9pCbgkv7Ci6TD0zgxUSOxjMU3Vsu9Vjt41G2SWDTxQ9HEOKkC8MksIyJtqShHdvIw/bXHEjPDmaIlhpsfxiy4BIq0vuJYItAO/NJ0XrbrYrXslwRKV9FZ4uREUiWrn1ggVrXZqwAwoKELCSUgk84HEDJMUxzog4zljLexbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 8 Aug
 2025 05:47:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 05:47:31 +0000
Date: Thu, 7 Aug 2025 22:47:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 16/26] drm/xe/pat: Add helper for compression mode of
 pat index
Message-ID: <aJWPcA2q+URfmKIk@lstrano-desk.jf.intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-17-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807164338.1832254-17-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0326.namprd04.prod.outlook.com
 (2603:10b6:303:82::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: d63dcb05-c162-4acc-ed16-08ddd63f10c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?35W5xOkhNA16emf8WqiUaUWP1zOAiT60D26ExaEQ5hD4lIaBgwZpsPSGJhpJ?=
 =?us-ascii?Q?qpS47NwI18odjtcH3RSH52crEYofJ0Ug6OK/Nt15LDHeewZKwddOPZgPrc+x?=
 =?us-ascii?Q?/PcYTRm0FdMAipf+7XApxdgACaAUc5V8XkYNbO9BLwhEOj8GOKlsOt4Dbb2i?=
 =?us-ascii?Q?MEtwAolNru+GiyY2D2eAVYLppiP5sA1JptuCGu9KDNlDVhaa66b6uppZ4c4s?=
 =?us-ascii?Q?jny8WFMVrpa8D0bnPNL2aRyqRhQjZ+MQX6cGEIxadzlBnbc+wdoDB2Ne53jU?=
 =?us-ascii?Q?1cc8kr1rMLVAdMuM+uC8lea1mHrs46iQHX3na8zYKFCqgsA/F+kSeUGBuD6S?=
 =?us-ascii?Q?NbvzUKIxQnBfMxgyp35Vl6AFNcwcV7gvEF+l9UgDEIl/XwElCS+hCeZFQ5pF?=
 =?us-ascii?Q?Jtt5JqpFFF3C1qyigepjIKzv50l1T89eR6c4/NGknxv2AedolqSyv628L3oH?=
 =?us-ascii?Q?vXFqRL4y+BbyjIPv3x/tl/fk3BDpYpGbLC7suAze9HDM9Sbm/hMb0Iyo5t0H?=
 =?us-ascii?Q?+jjHQBrI3AqF8yHu44UIEqzHe9o3lVSZCAsFJHleeTbx6WqtGo5AhY2+oyDD?=
 =?us-ascii?Q?+sKJvm7QSwoO5AiUt3ZBGimayR+0tjsRCxDvDLfWoW8QKIWwek2J9NJp1OxC?=
 =?us-ascii?Q?zW0Qxp2xGEPodo4fmq8O4X1IPSFi+P3OJByLQgZ9aVY4K+Q3rgb9ReAGoF27?=
 =?us-ascii?Q?TgDR60b1jQqjA7V44afEEfPkuPWjrRqJviN5JhpcCAz+lh09nit1THBxqjDz?=
 =?us-ascii?Q?SWvwOqUohYHidf8Kwadzuo3duGaGrpFXk4TxXVFa2fxtKEbmGDlibGxU7T6C?=
 =?us-ascii?Q?/k7OjxhKpF1CJyU7N+Zgi5EywNNx4hEwCz5CBUV4sxgWskIkD2p08636Q8NV?=
 =?us-ascii?Q?olHnm9o51W1v+fvyW320h69sghyVLVaQxuzUtnpTeM9+LyGjFNeus8hTKl0c?=
 =?us-ascii?Q?sqABIVVpAD7h6cEqG2FMTvyF/f8snRHBC9A+P7KAloOAqiwyWu5rczrAbx+D?=
 =?us-ascii?Q?o8QbiFI1KCLL/8lzlCp/MvvovjyE663TJpCaZ6f313p3RBsHNgD7uv08068/?=
 =?us-ascii?Q?aezd9kpf9fh7ZA43RMwiKTJ+Cm/+35iudhp13NPMV3+kqgrIbiEKo2rn1FiB?=
 =?us-ascii?Q?//Ht40lLgXrYi4U65Ech6CWRFCeuiegn+Ah61St9ZNT21v6oBI7tnyVh/diz?=
 =?us-ascii?Q?juFpz5CHPVaGbJt3EFfo4tsn+Rv6gWevUpP2lexe4db2Ru6r7LStQUamdvt6?=
 =?us-ascii?Q?v7C7M1c/nq/vdCf8sl7aktdzJJfI2ZhLNpyJ2J6WYXixv0VeSj7ZLihGt8Oj?=
 =?us-ascii?Q?SiO13TDGTO69RkXnvy7Q+DqYrlPAq1cJPn9tLLIVobQnTUmAf9KvVKyGGrLA?=
 =?us-ascii?Q?9rvJEEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XlXA7U7FmRSdK+ILtQ3xijlYtBWfApcQP4ENP/zrU21FGIbyCzt8bzyM3T1K?=
 =?us-ascii?Q?V0SLHYXIUkWYVuSU5clbDK9lfcr4zvgzC/UQrQ43cNfGYITKlDwxlEfceYae?=
 =?us-ascii?Q?8zSlpk7FVzUnGCCVNCvhRhdWx9T8rgHUbXal5XW2rIPM4KI+AscQqiILvr4V?=
 =?us-ascii?Q?hu3GNlQXtNk3jr/OIi50Ias+8vtZC4nHQLMRfPX9QtE9KgeJrLGirzKATgDp?=
 =?us-ascii?Q?ZpoVg6J+yhspI962rR+S/LOZXX4rDLikjsbH004MDDFm7xVApp6weLHhh9RE?=
 =?us-ascii?Q?2nawM318nuyeeMj2wGOmkXrzuOe4ly4zmHQMotjqX0svQfHAUP5PAS3QxsH0?=
 =?us-ascii?Q?mP8857pCBvVIqd3CCoxhUL4ZCvZM+MY3JwVAA3qpFfJDii39F8jt95u4meFr?=
 =?us-ascii?Q?5RwRfHOU91erAfOUuOnsckB015MMHUHdfqo+umJOAiO0ghODj24Sp9kBlZqj?=
 =?us-ascii?Q?tAuwrWq713EiKFOS+i9SgOmuEdEQ6cZHLPpannV8E9YOIzxX3oFYPwhhds+t?=
 =?us-ascii?Q?8Mkx54OXMunVdw2NXDZVdnOKBRVwYhxDfsvzKkb/jeJlwv4lgU6g3XnwDSGm?=
 =?us-ascii?Q?uf8w0O/ghhqLQUBc2+tShGmdwLpfWPB1bZijh0G1Bg90wOk9+gBeg96IwFHL?=
 =?us-ascii?Q?vIjaO9IIleZOHMjcTWwK1ASxzrL39DhNMYFD3IRRjKBVJ09koQCA5zgjyZbM?=
 =?us-ascii?Q?ZBD2/lPB+mU0UrVSjsjchnm1/Cq9g9RfChx1i9id/6/1a/Tdlpve46wGyKHO?=
 =?us-ascii?Q?OVT5V2lx2uwZDRWaJJ0s9XJNt/SEr0LPVEOq6ICd17N0FNjJdnvpauspTR9m?=
 =?us-ascii?Q?e0oEIU2P8oOTZqI4IN4xG5oHNr8O/o/PfWtRIsnj9LKgnQj6Bmh0FPDX3zDH?=
 =?us-ascii?Q?1ZeQHKD4s6FRFn/j76Ll2dQdbLo6IPHCpAPr9uLoPdYqTlnv8GE9YNDGUT2z?=
 =?us-ascii?Q?nmOJJrtBUn0FPyK+8WBv1YZ6bqQuauUx+wncogcUlG2O4cOShWIR7TvWAxVg?=
 =?us-ascii?Q?ag4yL/MxfaGQjC1AXevZGTCgLgH2DoTezzqmdgJKdr4oMWz4CQ+Ok6BCR4rp?=
 =?us-ascii?Q?vkU8pedYl8wwHn1/kOwoL8xLrUcdKdkaJOhN0E2pZA5G3MXzMsMMEFWrTkCa?=
 =?us-ascii?Q?67qqf2JANSGM4f/+iNVObP682r8FAjnbZAMsRtM0vCL8r4Fl73Lxqx23fRGI?=
 =?us-ascii?Q?59RAVfcCGJKjz1X1SHWMRSTww+E9sQwXoVLPbWPA6QJjzdCy0ru9L9NafRRn?=
 =?us-ascii?Q?wIYtkaOyvSp/qf0GP+C/WbqM/A/9ngq6bGWJO7ewLrBbfYeIFwuQgteOFupX?=
 =?us-ascii?Q?/Pbedpyh5ETFtW4q+cxjFhlbX5OLeX7ieoT53OGF2ldjCVL7uH0Tg4i+HSfR?=
 =?us-ascii?Q?EqyyIZD5rX5KSOLCEquREmMqQUXX26T+2rNnAZRIrIFyH/QvgBNiSvRbyqLz?=
 =?us-ascii?Q?harncbPdaGuu8ou9e6VNbVwmRLJbOJOfN7IQXxWK/G39O2xvp/t8HFckXBAU?=
 =?us-ascii?Q?c46eylsfmTmDCOTSHQIMwFQB/XB6ByA2xJ7xad0ccZ+NYBRgcN5AfSXtYfKz?=
 =?us-ascii?Q?IqB6BvKyyjxAkL2Nq8jkYJFovCupqKIo/JS0pZoMDv4jYdUUF0XewKgvdQpc?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d63dcb05-c162-4acc-ed16-08ddd63f10c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 05:47:31.0641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOnlYpgvc4y52nVQ9R/sc0UTNQrgZM/q6b0Q3qZ4v0Q35WL2RYdA8qZ2eIATQnOPeRrHoC7CntePdYj23KYC6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

On Thu, Aug 07, 2025 at 10:13:28PM +0530, Himal Prasad Ghimiray wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Add `xe_pat_index_get_comp_mode()` to extract compression mode from a
> PAT index.
> 

I'ed say just leave this one out, the initial patch [1] to disable this at
the bind IOCTL is still under review and we haven't landed on COH mode
issues or if we just nack the IOCTL for invalidate pat_index quite yet.

We have ~5 weeks until the 6.17 PR and close a on solution, so I'd say
let's get this series in with the same functional as bind IOCTLs for
now.

Matt

[1] https://patchwork.freedesktop.org/series/152547/

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 2e7cb99ae87a..ac1767c812aa 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -154,6 +154,16 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
>  static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
>  static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
>  
> +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +
> +	if (xe->pat.table != xe2_pat_table)
> +		return false;
> +
> +	return xe->pat.table[pat_index].value & XE2_COMP_EN;
> +}
> +
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  {
>  	WARN_ON(pat_index >= xe->pat.n_entries);
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index fa0dfbe525cd..8be2856a73af 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>   */
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>  
> +/**
> + * xe_pat_index_get_comp_mode() = Extract the compression mode for the given
> + * pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: True if pat_index is compressed, False otherwise
> + */
> +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index);
> +
>  #endif
> -- 
> 2.34.1
> 
