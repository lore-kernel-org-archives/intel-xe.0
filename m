Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BBBC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 23:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FFB112735;
	Thu,  2 May 2024 23:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ej/t3T6g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41094112735
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 23:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714691829; x=1746227829;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eRBUY9vUsHUy5ARv7HI4zHvlQQqEYTHcS/k3bkCb/a0=;
 b=Ej/t3T6gKna5RdPFbEYYMuKozNEAiDuaZXpT7lfuPGlOWmDGbdovCH31
 tTRqoBQXaOT08hbyLoEd/H+zxHFPL6DAlHD5XXV008W3nuPDh8SQEVkUp
 VE7G7i16BY6vrMIDNyRrcdlxQF0+FkfJHYohEMHzAL/w+kaThuStfFmsL
 VIPWpU1uIbwnPpYqPUY7pHhI6ARtayvZ0l4sOXZrh6LyfSKO+7gLGeGaH
 dE+5PVYxHVBeAxXOqX5k3ig6cmhQ4ggy7iTvQg+r4zlyxoFaiFyO6lIAf
 JR8VlnqnsgU1q+IdCnC9/iuSF1R/7gPZIIGQ15Xd+R2deUseDWAqlyjVe A==;
X-CSE-ConnectionGUID: ws0/DX99S+ycZd5+Z6XeDQ==
X-CSE-MsgGUID: qbr7st1HRxqztLxvGFvpQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21638280"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21638280"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 16:17:09 -0700
X-CSE-ConnectionGUID: JB7xSpibSHW4D2gpJKsF/g==
X-CSE-MsgGUID: O6sBmCYEQU+x3HW88X9OgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27305000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 16:17:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 16:17:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 16:17:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 16:17:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 16:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn0gJ7NtCaBc7IRDI6iyODAvJ5eFhFskZeGLrRsmrAfiuBRzuu5c1uRlnWB0D4u7bxOZVC9PBBtI+oqAZ6M+dqi5LC3XXrROAk0VkL5NKKRy+xxo0J+eLt42hNZQsthGG2W2qkMUqPU6fMmJoTnpNgiUHN1IYOj3gxmL4JZxIsA/93c1+kZOPMaL84bZ231BQY8G7HAg75VsJb1rVtO4EuAlk3IsEBSgcyPRcbILnhe26OXGbs/vLkrNrmQ3TVZ98ZMjltvJ9bw78En9ZRg64CLCaaZOznfouiEQS1nYD8ZtnYHn2VX6Uh/f3MyS+/9/k3NLNHBa35UHG1dMudAAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5tlAwoWSVA/fqY4jlHdM6gxujIPZA6I9msr8ixKszU=;
 b=iAsVMXtdxkEsg6IS7qWKbTmnyG/YcXMmdGfBaw+w/jCgZFiw8RycgXljSgKBZ2+F0KU7JAXLLFEU5JrWd2geych5odfAUvuVebiL1+/YgscqM+KvDP2zIJEsjAafcVMQ04T0sMUp84AWarGoXbZyvuvgL6CAp1tOhrGvJGWk2Ncvhsbkkv6XxLIHee6cA8QwJMwjvHAt4OyHM0lTMWYIer/IFaUagg3ukFxMayy5r0ZSZmDgIJuqJ3tzmE2W9M5JKTWCQ/YpfYuJDZ5TxRvrSOqbd9rvBsQ1EKYBBoWRBrP51y9Qm+DZ354dtkEZUt/ahKDDzNapxe4ywYyAa+/eGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 23:17:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Thu, 2 May 2024
 23:17:05 +0000
Date: Thu, 2 May 2024 23:16:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Perform dma_map when moving system buffer
 objects to TT
Message-ID: <ZjQe4aOIOCRAv2du@DUT025-TGLU.fm.intel.com>
References: <20240502183251.10170-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240502183251.10170-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: dff0daff-3f4c-40a4-f9ed-08dc6afdfb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hALvW/GGydDxiSVmQZhhxcXJWwR6jYJfFIFIGU50/JdI1H4uh5mIBjQ/08?=
 =?iso-8859-1?Q?HbBqIlv6l55k83DytLA2cVia/YP9CEtSu5a+5f4V0AzupW2AT2tIu7pk8E?=
 =?iso-8859-1?Q?XPLAQVvR78iGOhxzKoxqZuX5xYK5GotZ8D70AFTG6xJgGDTNLwEJmw5KeJ?=
 =?iso-8859-1?Q?3J6/42xygnsHn/s4P1Xg4N9Oee3H4x2EnWw95blHoCSTFA5K0yL4szYVLB?=
 =?iso-8859-1?Q?dDecD20ueGIT2mqfOq3zouwsQAZoeQfrGlRMUBxDzQOQhaT3wkYbaeTTwy?=
 =?iso-8859-1?Q?2ZrusQKMvc7iVoBXWaYkbBYuoPVEb4cf+Nrl3rt5A4NVBHowGwIsmblO6P?=
 =?iso-8859-1?Q?ID6ehIZ4I8fj54FqKLEC7TuZchfHz+Vbm/oTFjaL7Wjc4ahu4w3uVPjaZ9?=
 =?iso-8859-1?Q?tRm/5Q6TLH/66fszFYOoGFbBAb2Z9vsNdiY58/W88ix0scVaZPIfZj7pK5?=
 =?iso-8859-1?Q?RvX/SQVA2EIdotFeDj2qnaZcXmMNwnkBv9lnCko2rAEvg+6jrmRvhqzHHV?=
 =?iso-8859-1?Q?edI3AGZJ+FXgveQNW/O7aOK4BrPCVntcPVobBhTYR+qyKHAG2xW5mZvviW?=
 =?iso-8859-1?Q?N28/gdc9CorApJ4nvOMl3rNK/J3MhmV4Q0lxiEcyc3IdCDzg1STK35vUbF?=
 =?iso-8859-1?Q?ggD796loLF7Xa90BUMFQDd2Zce51EF6VvFoMfI3jIztBC4SHhWsogEctZ+?=
 =?iso-8859-1?Q?Apc1pv1P1U56HFIAQiZdVSiGkzPYRMBOSj7/sqwRPv586JYISWf9bayIQf?=
 =?iso-8859-1?Q?mR4/oeSdS+eHx0Nq2ENkX9rh+7farWuU3VjD5U2ykFFAoes3+jgHUg8a6T?=
 =?iso-8859-1?Q?kO1zJImZpB+stoE+dVYAePDlZXKyJXB30e+x3J1mwRZUF8zX6pGODjvKTX?=
 =?iso-8859-1?Q?AtrNO+psiDp31bobmB5aypl5qiajEDVTs7mccmWkejGED5fZdOBnSnUe96?=
 =?iso-8859-1?Q?oU4/i0nAiikdkaxb9WnVorZojfj3UafDPRaH886ePA3P+hexFvuhI2OMWD?=
 =?iso-8859-1?Q?uoZ3E1rarw2jEG/zJjHr6Z1ZwPanPos23voDcGqUpyPBsRBv5lSR2oL9i1?=
 =?iso-8859-1?Q?4QU65/dQw50gntq38UFns1WNxocuoL8N4h0RBrjDBEBIjHklwg1V4TSG+6?=
 =?iso-8859-1?Q?amdObhZDNdRcun30jKeeJ0L0is5kh/kzqrlnA5ICxiMMfyoIeQ97PMtcy/?=
 =?iso-8859-1?Q?dz1+WoWAxMQveb5lLU/BycYXuZvdloeH616/66pfqpYfHNp+u7O4iH3h3h?=
 =?iso-8859-1?Q?SN1kwDdSgZWlyx+o8qj0Gi/47Pj5++oExoJ2EcCb64ekPQwyGpmtzb+OCS?=
 =?iso-8859-1?Q?MCMJ34KHe8XKlW4sjXyIarbglg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QEF01KtWt7YNxzi9nDcbpZh6SrOcgk7CvjzTlSPOLX2w8R6uynJwsPRHv7?=
 =?iso-8859-1?Q?vE1SEhBMsLVMdFmz/PFtH3NhZ6iSDC1gxImUGtJOeocmMTX2nLIXNNRGnM?=
 =?iso-8859-1?Q?Qi75FT84Bid0+IafxO2yCMsfnxEOratS09SvvGYVJhVz4ZmDg2QSHfCgbE?=
 =?iso-8859-1?Q?30kNT4UAzXAMAiyFcw99cmT2SxOZ+XNRnEijl3EP3PWOuRZo5HB2T1Q4BX?=
 =?iso-8859-1?Q?pF2wqM+tPlJ/RFnZ6bWJx1IQUA+yYy8/dvmGNcQ85Nb4edqT59yI8+a57/?=
 =?iso-8859-1?Q?2iAvGt4sd9vNFp4SjX2kg7dNe9GwYUH+vP7RQe6nWz+gdzggzOCxAXSUWR?=
 =?iso-8859-1?Q?Ewwm069IaWi5qHJGzg+WkRVocFuMZKnSzfqI8kFFMzZQDGn3k6/9kLazWB?=
 =?iso-8859-1?Q?pEzljm98earWjHmhfVkc7HLVleWMzENhQUuI2MFH6KfP5cqUdwhiONGik6?=
 =?iso-8859-1?Q?a99w8CpZZCtxu7inTmJzIURZALqfZuPYSZtRrI5QiqDw4RcMrUlM/KyL3q?=
 =?iso-8859-1?Q?exr+k1EUZ5WLhAN7aqhYGv4Zd1X/g6eLyAAXhN8hn6xUwwCPL2TDtuCteP?=
 =?iso-8859-1?Q?wNLVMV0tgFe89Ve13uytDjrELB3gqqSMSKbaAR50bIFMx6AkSD/lRpPaMu?=
 =?iso-8859-1?Q?OZrP9nseMxTrsfXe5+fKsNmOhVxtmBkFcsW42D1UOimD6Fh0x+S2erTSrM?=
 =?iso-8859-1?Q?YM9ss3zB8UkGze4R+3LA8QU/dfeN2hLKiJX4NyU1Dq/bXmjFYvi8iqiGVc?=
 =?iso-8859-1?Q?TH6McEHAoP8v487HCbqPQP/v9ppAziuFG/Qlx74BBHX5YIVHmox47+M5na?=
 =?iso-8859-1?Q?48lh4UmVQp3TtR3qCQIqtoR1WexI0iH8iswVNF0PIQE5XRaoJVAYUA8ZTI?=
 =?iso-8859-1?Q?CnR1D1XFKWTPNHWJIvAP7AS/qK29j4a104/X0S2NFeEEoztbr13EfJQk7V?=
 =?iso-8859-1?Q?gilp7MTR7hKKnMokQ/Ashr7YGzx7pqX1QIjofCeUKZjXwfEt23LRsw3fc4?=
 =?iso-8859-1?Q?KVxT5Aqi4WzY6wStKzt/Goq+O8dM8SsC2AvggmfVTiUyFYqCoC0/nGpB8T?=
 =?iso-8859-1?Q?mzUj45HZdli1+GAbCT2gpTvWvNEWRj9UGhoM6yrSpxtYqYoq3IaVwRKzoy?=
 =?iso-8859-1?Q?HQ3C2TXQPjt97ZksjtTZ07ImFJbDok4EbNxzFIUhh8CR2hJy7nhSbDEsoX?=
 =?iso-8859-1?Q?xElhkaksBtI0MxG7/blbWwaHj3pd7LqOMYHPqG08pbM3OpID/EISzi322R?=
 =?iso-8859-1?Q?tSJAwTH7UV5dNPu221cxB0TmIAp7NB2LnGk+kYgn4MwlgfneugRCzkyUSf?=
 =?iso-8859-1?Q?IDRB9ZJdSGkZwSUeRbEWw6CVWI3lhIEKdI8OGnBIVoHdh8jb+nwB52WmXW?=
 =?iso-8859-1?Q?AqwDrR9L+S7NJtBpiYsQLMYC71UL1DdTluN8nwOzGm0d5HV/n47Y0RWenw?=
 =?iso-8859-1?Q?+C2WQnH+MDKAb+eFOii1y22ZZB2H/mnzCxmNLGHyXuUv1vJrrP1+pA3ycH?=
 =?iso-8859-1?Q?Qjk51EHZRza3D1ERwv3bhtl9QP30ytk40XvecBwdtd5XyjZj4iQsYJHWRk?=
 =?iso-8859-1?Q?eWqjPR4kP4fOLk4WS1L2ghpCyWl2hsFAPzv76+kQgcWvyyedikyP75fXwo?=
 =?iso-8859-1?Q?xyjuGqOO+PcZUuDXFLC4npfVHN3KImwmYh+IgxuVSn1n2KdTtwhCxW0A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dff0daff-3f4c-40a4-f9ed-08dc6afdfb6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 23:17:05.8322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDh7pdxcSvu+yi8fk/AVfU2hTmxzIGGFMWewoTDoWXoAczjTocSWsKFyXRA5Q8drs+tP5N0DFOwrego1NL6i0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
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

On Thu, May 02, 2024 at 08:32:51PM +0200, Thomas Hellström wrote:
> Currently we dma_map on ttm_tt population and dma_unmap when
> the pages are released in ttm_tt unpopulate.
> 
> Strictly, the dma_map is not needed until the bo is moved to the
> XE_PL_TT placement, so perform the dma_mapping on such moves
> instead, and remove the dma_mappig when moving to XE_PL_SYSTEM.
> 
> This is desired for the upcoming shrinker series where shrinking
> of a ttm_tt might fail. That would lead to an odd construct where
> we first dma_unmap, then shrink and if shrinking fails dma_map
> again. If dma_mapping instead is performed on move like this,
> shrinking does not need to care at all about dma mapping.
> 
> Finally, where a ttm_tt is destroyed while bound to a different
> memory type than XE_PL_SYSTEM, we keep the dma_unmap in
> unpopulate().
> 
> v2:
> - Don't accidently unmap the dma-buf's sgtable.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 47 ++++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index bc1f794e3e61..52a16cb4e736 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -302,6 +302,18 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>  	return 0;
>  }
>  
> +static void xe_tt_unmap_sg(struct ttm_tt *tt)
> +{
> +	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (xe_tt->sg) {
> +		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> +				  DMA_BIDIRECTIONAL, 0);
> +		sg_free_table(xe_tt->sg);
> +		xe_tt->sg = NULL;
> +	}
> +}
> +
>  struct sg_table *xe_bo_sg(struct xe_bo *bo)
>  {
>  	struct ttm_tt *tt = bo->ttm.ttm;
> @@ -377,27 +389,15 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>  	if (err)
>  		return err;
>  
> -	/* A follow up may move this xe_bo_move when BO is moved to XE_PL_TT */
> -	err = xe_tt_map_sg(tt);
> -	if (err)
> -		ttm_pool_free(&ttm_dev->pool, tt);
> -
>  	return err;
>  }
>  
>  static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>  {
> -	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> -
>  	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>  		return;
>  
> -	if (xe_tt->sg) {
> -		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> -				  DMA_BIDIRECTIONAL, 0);
> -		sg_free_table(xe_tt->sg);
> -		xe_tt->sg = NULL;
> -	}
> +	xe_tt_unmap_sg(tt);
>  
>  	return ttm_pool_free(&ttm_dev->pool, tt);
>  }
> @@ -628,17 +628,21 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>  				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>  	int ret = 0;
> +
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
> -		ttm_bo_move_null(ttm_bo, new_mem);
> -		return 0;
> +		if (new_mem->mem_type == XE_PL_TT)
> +			ret = xe_tt_map_sg(ttm);
> +		if (!ret)
> +			ttm_bo_move_null(ttm_bo, new_mem);
> +		goto out;
>  	}
>  
>  	if (ttm_bo->type == ttm_bo_type_sg) {
>  		ret = xe_bo_move_notify(bo, ctx);
>  		if (!ret)
>  			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
> -		goto out;
> +		return ret;

This is the v2 change? Make sense

For this version:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	}
>  
>  	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> @@ -650,6 +654,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>  		(!ttm && ttm_bo->type == ttm_bo_type_device);
>  
> +	if (new_mem->mem_type == XE_PL_TT) {
> +		ret = xe_tt_map_sg(ttm);
> +		if (ret)
> +			goto out;
> +	}
> +
>  	if ((move_lacks_source && !needs_clear)) {
>  		ttm_bo_move_null(ttm_bo, new_mem);
>  		goto out;
> @@ -786,8 +796,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	xe_pm_runtime_put(xe);
>  
>  out:
> -	return ret;
> +	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
> +	    ttm_bo->ttm)
> +		xe_tt_unmap_sg(ttm_bo->ttm);
>  
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.44.0
> 
