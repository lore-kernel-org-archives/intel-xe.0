Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEF0C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA2B10E34A;
	Thu, 30 May 2024 00:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AC5Q6bvj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073C10E34A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717030241; x=1748566241;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FFjS+jsPsNuf5wbvgK4vqLgsgVmOiSkQOnnE3IB5OdY=;
 b=AC5Q6bvjHbhKJWtpqsoctBAuim6hgkTTHm/rjPBSSYf7MC+k/f9bY8BH
 fJ38AkwflwBtOQc+oV60umtO+S/7obOM7+WlHBUlKS3Dr6hKdlD8AvGgN
 Eo9yoVRS2tJwQ48c/Cd6WmHBu6ktxJHSsMyXpFEJHGmazeCmbbQidKo0T
 kYcyhpJkUa7RD9wCDzKGo044UaWUb7t6p9naxPHyoTz2hHYmzulkuf0C1
 12mAlqRqqv8XvcH44SD7X8OcySpQld2ir9C2XEOysSVQ4sYBulJSJ5gX9
 pqVBNDlWqg+t40h4YG7eLcQ8muhI5kbvbV1NWVtMML+k37GPZN7KPTZjP g==;
X-CSE-ConnectionGUID: 9pCwCcd9QmO8XGcxhqujeQ==
X-CSE-MsgGUID: HmGK3itJS06ylgsiXIMqww==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13352438"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13352438"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:50:41 -0700
X-CSE-ConnectionGUID: QLr0X/MxQuGMFegXq6ZLIQ==
X-CSE-MsgGUID: +JiuB8gcQNOqjS3Ro0/pkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40161527"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 17:50:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 17:50:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 17:50:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 17:50:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 17:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cc5doLZYKqPfzzxOgeOdft3IVZvl7Z09bzHCG0DQpvg1W2YC6rDtd8UKirDePMYVOVLKTKjxcaJ638lcA6J0bvVevqUu8jKYFuM2ZjF72deBKg+sahgvs8yNHeRjnqyME9q0aq4WsAFN0xp01A4GEJGPleZTqUHtoIcDXSn9Rat2YLamXH6e5pvL7MYH7xmW9lBlZfxxSR30YlOpSxyzeiNPalRvUVpie/xzeeGFwq4IOKfid2QL+O7Xe3oS4f5MX1DLyagdoYHhfPSiPgrI2hCdW9GdWCgEMOgi9V2/zUFqRtN93q133A/NG9WUbBCmeuZyk38/SkSDIEtKoIPWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xMFnGLky3twOn6hkwqnNuVFMZtfS4Tdg5FPkIHvNo4=;
 b=ieKm66ivHnvoaprVFZjgYZSqfM/+OCKRCDewQdpKNmoBlqRyDXEcsAq8VxJ+FCEmt1Q1bG8Z19ytMpmbXdMeSf7J5ArpfJBiElRi45laRi95lKU9QwHbeYbiqsPIZoNZ5YQ8wtJJ1CWqu8tolCkI5VVXl2KkYCdBfxflABUY3Oojy8csUEmiy0NmgP88dFmTNEW8vH5U3S6FOKNQPFChsv13RBmEXSDfqaUmT4yipnNd3FlKxT6zKA0tbshRphJmiLHHvBq/0eBbhmIXpKlctLwrdzTeEkOE9Y3t112foO0QngBjZn1Yzwea22XHgOgQHLiPSTmLV0PEwsGm3jpomQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by BL1PR11MB5318.namprd11.prod.outlook.com (2603:10b6:208:312::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 00:50:37 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 00:50:37 +0000
Date: Thu, 30 May 2024 00:49:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zeng, 
 Oak" <oak.zeng@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe: Convert multiple bind ops into single job
Message-ID: <ZlfNLV4XxPfY/9bU@DUT025-TGLU.fm.intel.com>
References: <20240529183148.1713695-1-matthew.brost@intel.com>
 <20240529183148.1713695-4-matthew.brost@intel.com>
 <ff4c4590de0714b72278fee242460c3a2982d2fd.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff4c4590de0714b72278fee242460c3a2982d2fd.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|BL1PR11MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: 07676e35-5347-4593-6dc5-08dc80428502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Wi5FWOY2+mVq49pOnpZpklJF1ICt+xeCfAYn0UEy+IY0gCq2vwpZSqlxZU?=
 =?iso-8859-1?Q?KasidWhq2Gk08c53FAAkXupf28zmCOGP8a5fcYrBvpnNqmVAW1Lyeewhhh?=
 =?iso-8859-1?Q?lx1Nk+WoFMMuYfai7GhfZkrxmJhvSY2HW5hbUiZCLyv2iwJSk7P5kCdKA1?=
 =?iso-8859-1?Q?/ketra5TjgZ9H6M3lEJX+nRq9+ESxFYeiYhE2I4DZewhiDGuEQCdT70Q2n?=
 =?iso-8859-1?Q?uEqI+sMvawaRM1rPTBuunrP8lIhA83GCAZZbVk67ydtqm1H7cFVlLEYlZr?=
 =?iso-8859-1?Q?N1oGJkc8A+fqV4q8hkU5/8rvtIu/XU56jSpzjxDDZC/dVfRdIkUbDqtFH5?=
 =?iso-8859-1?Q?yN2DnsDY1MrsLXJ5sxkVpRk+wWTxQHRUwbJu3MQHCLJwjlMXSubVfjA0bD?=
 =?iso-8859-1?Q?1wR/RFqpKx7lmxN/sXlt1WuDgqAam6nKdpwYn+X0XREMWQihf5qS4KY66L?=
 =?iso-8859-1?Q?mw/N1PsZT6HAdDAsfaCiv3bwuoS18pGTOBUeDug+rmyAHBPlvR/yjW6NpX?=
 =?iso-8859-1?Q?MIBilgxdz8g4sldXTp5Msy8XlteIu3Kw0UfG93AjoP/EhrMtqer8W1I9De?=
 =?iso-8859-1?Q?H81eSkBFjyg9hP7QFUZ5Who4qO9FrpDUqTh8dNlkik87Af/+HsL3TS071H?=
 =?iso-8859-1?Q?gjYNZfQJ1fLNBkgOjnwjUP+31E38Ydk5oJwD8INwu+JZ9A7aez85FR0Lr7?=
 =?iso-8859-1?Q?7SigRuWCwQQrSTA8D8kiKO0PozL+JminKASU1Yg0QCXjVgNn/sVb15Q2UV?=
 =?iso-8859-1?Q?KNaWHTSsZsG31QRjaH+HZ0XLIkDJ8riyQjdHHmrzHDPAA4hC5gzN0D6GoP?=
 =?iso-8859-1?Q?ySbKKVme0BDYkUCpwO5wbjRE1L8/5k6vMkDajwsVdOoH7QvBIJbDiw1voL?=
 =?iso-8859-1?Q?WgwyagdKeNhEEVPAqxYVSE9cM/Hrxmatx4/1DFuF8TgmAXFzHCJN/p7eRn?=
 =?iso-8859-1?Q?BWPz2ti2Pn7fWlHmov0X+RQuogUq9N3DU6LEPC/PGaYxE4UaBPuBD5CClz?=
 =?iso-8859-1?Q?L2QycyjkFIjeQk78HoOxuCtnofDQLrhuaLr844awtQkqvcAzcM+8OH77nE?=
 =?iso-8859-1?Q?0vsvQRo3PH2nQOrl9TCsewzaUWMWEYbwmwG7jwQsT0qaeUQbeaYK71240s?=
 =?iso-8859-1?Q?Giwv0okcYrlBlhTnfvhvDpisFD8Q0ei0uptb+8nsldIQhN7AlcnGBQ0vpu?=
 =?iso-8859-1?Q?FpBoICPbziFCrpx/8ZOoC3Q393Xf8W5MS5KWJnpGTkkNTpQ2hCfsCHxC8g?=
 =?iso-8859-1?Q?Q/F3pDGdQzpRb0eup3KtZjQeMHlgmRief11aqwg+1atsxTYq4h0/PUty8z?=
 =?iso-8859-1?Q?kc3cLXxDQs8FMUBXNqWWT9vCIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VTZlE1yvnhbxlLMbMOp+f2K05me88FeYy7qO4Q/OahdgAfAaPj/hP7zBlT?=
 =?iso-8859-1?Q?z62G06TnKWRhc7g/ANfVD1K7U0A1EUnRxmxUu3AgdpP+iJNSCfzSs17via?=
 =?iso-8859-1?Q?JEH7KgXBrB9aPeZrw/vs3gfC+3VVmrRZbeEiXdermSnMTe2qXpPzcBM/yw?=
 =?iso-8859-1?Q?gfSqochd06bnDhzKZDX7uOVkT0Dek6gGp8dJgqIjhtJ7KrK/y3Mgyi3tf3?=
 =?iso-8859-1?Q?PeVgfRqnpLa5FXlef3+ZgywjRpSwPNwxEfSANSYG+mt7myqE7rOLlC5bYk?=
 =?iso-8859-1?Q?OQEHXioL0z7miiu+hdwEuDUphO3EYwXWUKD7piqHQ5y6KF1hdoiGOQwtpC?=
 =?iso-8859-1?Q?8TlluxOX6Hmlo2ISXEPuez3ylZXP9XVjcQyk5IsA2LNBXXBnk2WGO8fH7N?=
 =?iso-8859-1?Q?jvwH1Ia0QnqDYbmVh6ChtPmTwDipxrWEKQVO5VZcp5jrfLaeE2L4pRyXn1?=
 =?iso-8859-1?Q?0uOhCjncAOM0n18G32NzLMiJMRROdQ0amCfmqgQiRSYm85hJHurydVVDcH?=
 =?iso-8859-1?Q?xJto6OYiKnRvCk4eyEOR00UtwU5d0L9OkVB8A4TO7Cuv44j489xdQ68aXf?=
 =?iso-8859-1?Q?xmOjMCX0w7+fIGFSJeE1VtdI5X/1OVAmStvNh+5sw7VdJylpECSeFVsnLK?=
 =?iso-8859-1?Q?VginqQhG9fUr1+OlJUkej1Ow6RU5Q1e3sIUjnV0QedWGJfqnTFnksRDqBs?=
 =?iso-8859-1?Q?ul4yzlGv90VLHvDpLTIcq2aKwuP657UoWYvY0kblwvBmaCu8wKLC7wg4R5?=
 =?iso-8859-1?Q?YE0OHIdWUlhD8ZGG11MM+dzUInIISAmMpbdBDO6GJ7+6CcplFeFrEKap8Z?=
 =?iso-8859-1?Q?GJz1xurgH99bW16BaUG2vrl5cecAoX6LxneA2Mfww1umKeRk7Tb7p8gq6L?=
 =?iso-8859-1?Q?7oDs2VecpGm+LCdbNkFXr4mJHGYZK+qEG261AGgvXf6YWoGOEHBXtrGHIX?=
 =?iso-8859-1?Q?FwV+gi+wCJBGaZ9Gi2HglRUTv2LmUuQ0clJI45h2av/8QJMV5pzoVyI9Df?=
 =?iso-8859-1?Q?27P+BG0sCj9Xuln1sKi7xcbhUgLJpKaV+IKEvklz/hfraoLJUjFglIwwqL?=
 =?iso-8859-1?Q?qULq2Jq+OKNuVgYQofFv8k6RS5SNSIIzb/077NFXgHyQPDQG9jYKICc09k?=
 =?iso-8859-1?Q?ck7JXLMcnmwU/5Dk1qWPXI15ledHC7pj/CrpVtDJ+kRs2X0OEqi3L4SVUn?=
 =?iso-8859-1?Q?/k255wkogaBQUG+wVVfWCQS029n8iGf5CYFeLaSDILg1IC7APXiQPBDK2n?=
 =?iso-8859-1?Q?GwjMrZsy3LE/c+5qTjQRAH0Bm1uFYWLZNRI4IXMC6QE6GIM1sEV2wYyW7Z?=
 =?iso-8859-1?Q?A+hujQNwx93s3be8QYaMfRQmJG4dyh0piRcY8NCJnuAVi/+uKjnr8Svueg?=
 =?iso-8859-1?Q?s5KgV144cXzTCgsm6MRjRCclvAjPeXlM53sxGG6+0A4LKzaPPdYWRWZrmK?=
 =?iso-8859-1?Q?9n4jcdjmhJX0cBQJ+RPlqhrEIP4ZbleyDkUDTaeRHEjLAgwgfjLJjp4Gzw?=
 =?iso-8859-1?Q?VdvBFQ0TcWQOuGNr5Y1FFuSADwK1NM990z0RHWVULuh3384hcuVFQbd+KT?=
 =?iso-8859-1?Q?5faADzs8tjNX2kI74lqkIjJ1nTkY7jyI26WAkTmhUFHbKk0LSonA/Rof4v?=
 =?iso-8859-1?Q?HY0SClbDYxLAr4+9C1VqldB54UCFGlNowjRyjlsq9+SbZFad76Meh5fg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07676e35-5347-4593-6dc5-08dc80428502
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 00:50:36.9024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jh43DhV8HafjPheTjfnsafbXsorIx5Q9+onSsX3Q9hjqw0q8V25hK55MpVlFNH4hT5QaHuE69lrLHpJhLAM4CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5318
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

On Wed, May 29, 2024 at 06:32:12PM -0600, Zanoni, Paulo R wrote:
> On Wed, 2024-05-29 at 11:31 -0700, Matthew Brost wrote:
> > This aligns with the uAPI of an array of binds or single bind that
> > results in multiple GPUVA ops to be considered a single atomic
> > operations.
> > 
> > The implemenation is roughly:
> > - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> > - each xe_vma_op resolves to 0-3 PT ops
> > - xe_vma_ops creates a single job
> > - if at any point during binding a failure occurs, xe_vma_ops contains
> >   the information necessary unwind the PT and VMA (GPUVA) state
> > 
> > v2:
> >  - add missing dma-resv slot reservation (CI, testing)
> > 
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo_types.h |    2 +
> >  drivers/gpu/drm/xe/xe_migrate.c  |  296 ++++----
> >  drivers/gpu/drm/xe/xe_migrate.h  |   32 +-
> >  drivers/gpu/drm/xe/xe_pt.c       | 1108 +++++++++++++++++++-----------
> >  drivers/gpu/drm/xe/xe_pt.h       |   14 +-
> >  drivers/gpu/drm/xe/xe_pt_types.h |   36 +
> >  drivers/gpu/drm/xe/xe_vm.c       |  519 +++-----------
> >  drivers/gpu/drm/xe/xe_vm.h       |    2 +
> >  drivers/gpu/drm/xe/xe_vm_types.h |   45 +-
> >  9 files changed, 1032 insertions(+), 1022 deletions(-)
> > 
> 
> (snip)
> 
> > 
> > -/**
> > - * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
> > - * address range.
> > - * @tile: The tile to bind for.
> > - * @vma: The vma to bind.
> > - * @q: The exec_queue with which to do pipelined page-table updates.
> > - * @syncs: Entries to sync on before binding the built tree to the live vm tree.
> > - * @num_syncs: Number of @sync entries.
> > - * @rebind: Whether we're rebinding this vma to the same address range without
> > - * an unbind in-between.
> > - *
> > - * This function builds a page-table tree (see xe_pt_stage_bind() for more
> > - * information on page-table building), and the xe_vm_pgtable_update entries
> > - * abstracting the operations needed to attach it to the main vm tree. It
> > - * then takes the relevant locks and updates the metadata side of the main
> > - * vm tree and submits the operations for pipelined attachment of the
> > - * gpu page-table to the vm main tree, (which can be done either by the
> > - * cpu and the GPU).
> > - *
> > - * Return: A valid dma-fence representing the pipelined attachment operation
> > - * on success, an error pointer on error.
> > - */
> > -struct dma_fence *
> > -__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
> > -		 struct xe_sync_entry *syncs, u32 num_syncs,
> > -		 bool rebind)
> > -{
> > -	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> > -	struct xe_pt_migrate_pt_update bind_pt_update = {
> > -		.base = {
> > -			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
> > -			.vma = vma,
> > -			.tile_id = tile->id,
> > -		},
> > -		.bind = true,
> > -	};
> > -	struct xe_vm *vm = xe_vma_vm(vma);
> > -	u32 num_entries;
> > -	struct dma_fence *fence;
> > -	struct invalidation_fence *ifence = NULL;
> > -	struct xe_range_fence *rfence;
> > -	int err;
> > -
> > -	bind_pt_update.locked = false;
> > -	xe_bo_assert_held(xe_vma_bo(vma));
> > -	xe_vm_assert_held(vm);
> > -
> > -	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > -	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
> > -	       xe_vma_start(vma), xe_vma_end(vma), q);
> > -
> > -	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
> > -	if (err)
> > -		goto err;
> > -
> > -	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> > -	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > -		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
> > -	if (err)
> > -		goto err;
> > -
> > -	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
> > -
> > -	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> > -	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
> > -				   num_entries);
> > -
> > -	/*
> > -	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
> > -	 * cached PTEs point to freed memory. on LR vms this is done
> > -	 * automatically when the context is re-enabled by the rebind worker,
> > -	 * or in fault mode it was invalidated on PTE zapping.
> > -	 *
> > -	 * If !rebind, and scratch enabled VMs, there is a chance the scratch
> > -	 * PTE is already cached in the TLB so it needs to be invalidated.
> > -	 * on !LR VMs this is done in the ring ops preceding a batch, but on
> > -	 * non-faulting LR, in particular on user-space batch buffer chaining,
> > -	 * it needs to be done here.
> > -	 */
> > -	if ((!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
> > -		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > -		if (!ifence)
> > -			return ERR_PTR(-ENOMEM);
> > -	} else if (rebind && !xe_vm_in_lr_mode(vm)) {
> > -		/* We bump also if batch_invalidate_tlb is true */
> > -		vm->tlb_flush_seqno++;
> 
> This was the only thing actually setting a value of "tlb_flush_seqno"
> to anything in the driver. Now the only thing that remains setting any
> value to tlb_flush_seqno is xe_sched_job_arm() where we have:
> 
> q->tlb_flush_seqno = vm->tlb_flush_seqno;
> 
> (but there seems to be no line ever initializing vm->tlb_flush_seqno)
> 

This is initialized to zero on the zalloc of the xe_vm structure.

> Something may be wrong here. We're not setting initial values but we're
> copying values and checking them in an "if" statement.
> 
> The following compiles:
>

Sure but this doesn't correctly set job->ring_ops_flush_tlb now. The
idea here is if we can defer the TLB flush to next job rather than a GuC
command after we change the page tables we do that. Roughly, on binds in
dma-fence mode we can always defer, in some bind cases in LR mode we can
defer, and on unbinds we always use the GuC.

This patch broke this in the rebase. The fix in bind_op_prepare should
look like:

                /*
                 * If rebind, we have to invalidate TLB on !LR vms to invalidate
                 * cached PTEs point to freed memory. on LR vms this is done
-                * automatically when the context is re-enabled by the rebind
-                * worker, or in fault mode it was invalidated on PTE zapping.
+                * automatically when the context is re-enabled by the rebind worker,
+                * or in fault mode it was invalidated on PTE zapping.
                 *
-                * If !rebind, and scratch enabled VMs, there is a chance the
-                * scratch PTE is already cached in the TLB so it needs to be
-                * invalidated. on !LR VMs this is done in the ring ops
-                * preceding a batch, but on non-faulting LR, in particular on
-                * user-space batch buffer chaining, it needs to be done here.
+                * If !rebind, and scratch enabled VMs, there is a chance the scratch
+                * PTE is already cached in the TLB so it needs to be invalidated.
+                * on !LR VMs this is done in the ring ops preceding a batch, but on
+                * non-faulting LR, in particular on user-space batch buffer chaining,
+                * it needs to be done here.
                 */
-               pt_update_ops->needs_invalidation |=
-                       (pt_op->rebind && !xe_vm_in_lr_mode(vm) &&
-                       !vm->batch_invalidate_tlb) ||
-                       (!pt_op->rebind && vm->scratch_pt[tile->id] &&
-                        xe_vm_in_preempt_fence_mode(vm));
+               if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
+                    xe_vm_in_preempt_fence_mode(vm)))
+                       pt_update_ops->needs_invalidation = true;
+               else if (rebind && !xe_vm_in_lr_mode(vm))
+                       /* We bump also if batch_invalidate_tlb is true */
+                       vm->tlb_flush_seqno++;

Will fix in next rev.

Matt
 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index e81704c7c030a..dd51b59e4433f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -136,11 +136,6 @@ struct xe_exec_queue {
>         const struct xe_ring_ops *ring_ops;
>         /** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
>         struct drm_sched_entity *entity;
> -       /**
> -        * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
> -        * Protected by @vm's resv. Unused if @vm == NULL.
> -        */
> -       u64 tlb_flush_seqno;
>         /** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
>         u64 old_run_ticks;
>         /** @run_ticks: hw engine class run time in ticks for this exec queue */
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 29f3201d7dfac..6c3cb7e295ac7 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -254,9 +254,8 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>         }
>  
>         if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
> -           (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
> +           vm->batch_invalidate_tlb) {
>                 xe_vm_assert_held(vm);
> -               q->tlb_flush_seqno = vm->tlb_flush_seqno;
>                 job->ring_ops_flush_tlb = true;
>         }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 27d651093d307..03e839efb234e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -263,11 +263,6 @@ struct xe_vm {
>                 bool capture_once;
>         } error_capture;
>  
> -       /**
> -        * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
> -        * protected by the vm resv.
> -        */
> -       u64 tlb_flush_seqno;
>         /** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>         bool batch_invalidate_tlb;
>         /** @xef: XE file handle for tracking this VM's drm client */
> 
> 
> 
