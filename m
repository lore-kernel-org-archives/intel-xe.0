Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDBEC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8769310E8C7;
	Tue,  3 Jun 2025 19:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAN9hWNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7A10E8C7
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 19:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978915; x=1780514915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8vlwQz+YVMjKMztADxaWqkZTs0G8mqtgrVO+em/a4kQ=;
 b=iAN9hWNydtacaHDd3rvXjA8c7iTYjNaOPFlOjIYbuMC02DKjVl9oRUJQ
 wsl/DYgZubKsS3vCCnUvL5B3pt69xfDG2lZFmbWN9wy+rWLbPQPQXONGd
 nPis8JNlMWJF9Ja8YlI/newGz7edzIP8k2o83GLpOtq+cgEgFBDDoa/D7
 8CU9bB6G20nvi+BMoOd7b+L/kQsQ2UIHd2NAFDss9S3E2qeyBF9Mn809K
 Ka7gLk8/W2SDQPhqk8raRRuPhvpTnd9mP7OBv7nHtXd9M/gCfmP0uOuAG
 3WUSvgArSvhz+1HIzI4A/3y0TVvAOx42SsgrE1pImOfe9GpWps6X2hmI+ g==;
X-CSE-ConnectionGUID: carXrJNFS3uY+Ec39avLbw==
X-CSE-MsgGUID: QdqWaOOWSLKoIYuQ6ZeAYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50274676"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="50274676"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:28:16 -0700
X-CSE-ConnectionGUID: K9RdCTTaSOyWRB4QkIUZ+A==
X-CSE-MsgGUID: iVBW05AgToOUPr9hBFHw8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175897715"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:28:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:28:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 12:28:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.47)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 12:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBcBP70H4yvExOy6I/va37wPpXWCNEzzNKpbxyOkVXDYBFzOjnt3tcL+08YCsfSRfMN+q2KH9iW8bpU1eiwZwtxesNTMehfbq+8hUjC+lrMZZgqXIDU3+jGjp2K/YWVWSgp5rxpGaZNWg57Dwlm0qtob6i8ChTMbWOPWHzOfAxmJWmLznrbU8w0uPz9j0vi+SFDHfnGSYUE0bTZ2F3jvhEsDQKN/4tOytpUbGGVl0Bbtg55rCJ64jqE+pHMEBsLoRgarmUX/UxwGJSBdQCpXqGrNPgaYRS9mVlpINhay9MiwsjcSbicVQdbPMNS7bnChmeUVbPE9QbHRIfv/hjeuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yywH/eFgV9O+7LfMtFpTiBavPhRkMgs92mdtktVfuVc=;
 b=l0phLg9abtB2N+Kd3SOYdzM8PrS07EaY0Z3Ip4cdFwkwq7aK0MQ79cw1U60peNe40SAvlTNZ8dm7XpwKSWImUmmJw9OgN1bh4w7U/1jR53DvICIQVrnQt/KmN18uZ4e389vf91tO/SSchOxq1rF4vvxDNkd6z/DTESxuG8ZYzFPBDRT1QKgxY2+4SIFqy5b1tZygwUK4B2yYAAmW1E16YA6dzOtjylpn+7QCGqjIQmcoVJjFIysz6Ttv1Ji+a7wcmLeRpuOQSQXWOWBuRbKrTA8fPVdDAnaVqpJ6Ggk29XAU9hrE5ni8k4n6yhylg0OgMwkherfjfbHD8gumv4TntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Tue, 3 Jun
 2025 19:28:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 19:28:12 +0000
Date: Tue, 3 Jun 2025 12:28:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH 5/6] drm/i915: Set max cdclk for display 30.02
Message-ID: <20250603192809.GD5080@mdroper-desk1.amr.corp.intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
 <20250603182430.1016734-6-dnyaneshwar.bhadane@intel.com>
 <20250603191231.GC5080@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603191231.GC5080@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f23e49-14c9-4a7b-7ca5-08dda2d4c77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cfM7dxaDf9VjZEdmxMCHt0izoq3Zt0ldvnnUZ/MXW5BaR60aVUVd7H3Lsex/?=
 =?us-ascii?Q?yfOsjmClczdfkyH8a38KPtLs8qIu8G4XQDBCynShcXDscq4ZZeIzXIcoWVGt?=
 =?us-ascii?Q?B5gt/WBN8JgEsCF25Ypcd/1lf4YLZDAic0nm87a/mnV8xhK2WqbqRmOmLG1H?=
 =?us-ascii?Q?pYPzGh3P3OKhh2IjNdzOBcSGPndl5W/Dh71IHqjw0s37Gy4y8HgjFxsB2zPy?=
 =?us-ascii?Q?OCfHWxZNnsn6zCDxyD/4gKg8nbr04iLLghqaGiSigGreJU6TIzeDDGNocQnS?=
 =?us-ascii?Q?8KETGqMNkW2Fc8zxrbJta3cYLF5XeqRza6AFth7rb4f1eIlnvwizJwgRUF49?=
 =?us-ascii?Q?6xFpYWOFvHyQuOglL6G9IXpH/ylk1yz4/FOILYVW0LvYRgS/QYhWs9A9iadl?=
 =?us-ascii?Q?X4/SAjosOSrZhKh6Au6irCKIUXpKisSgvsQeHPQaxGOEecAsEVbKcincEpAV?=
 =?us-ascii?Q?7wnvQhFkzR82Ad1QLnI8CMLEoF4od5Mhsd0zEC+GqBQnVa3cEVqWIzguLnqp?=
 =?us-ascii?Q?Hf90A4d3Cu6V3DwhAiXkY46JMhUvxHpAT49bBi+cs63rqhZ2hRfhNHPfeTxT?=
 =?us-ascii?Q?o2cpN+SKa58OU4k09nOm2c3qeLYQx3aWUFNVR/JQ7Tthp2VU/fH3hOkHDU1Y?=
 =?us-ascii?Q?RcL49mu59pj1WasVBLibcHWkUNXYaathEP9N19JfgNyddTZacAPkGsTBytaZ?=
 =?us-ascii?Q?to84gnONd6F2FReWgCyxpkMY4Lg6mYQJoE8D8+BOUDIeq8mRBvL/FA6FgeKG?=
 =?us-ascii?Q?MWrmJL6BslXvxcp6C0PqycxkJMypT0qQBzuiAYLkxBb2ReSYgTf2T8Z3EGJB?=
 =?us-ascii?Q?eUKiaW95UQANM+QrJpOxsGNnpyLQxYAl5u51Q052LPWUA6KIAq+IOG8U7IY0?=
 =?us-ascii?Q?eETENihrKDEdI9uKZZ/x6/fhx6ScK4YZSf/Cj92C1PSkdPpErHK5qdbxESO0?=
 =?us-ascii?Q?P5EVZ5Ze+pmzth5ue+7/bZi2IlbVr0KFFsGW3s2Wfx8DWJWcDDbxRXM5KQIV?=
 =?us-ascii?Q?FCgLiOaJPBjdmsNS15gYrJrASsNkub9GN5ciHJiAYpUlMpOjrglk+2iCvIHi?=
 =?us-ascii?Q?/hPqJE8KUUee3P8ag0ZDYg6nX3bShN3gs5tQ8lX4KeJT9JzVahU9TP4pnBVO?=
 =?us-ascii?Q?xpCkvnwJLW5U/fBIpT7RTBrU7oJ+fzruNIGqcIAGvly+K8wWQ4U8nRXVGdyg?=
 =?us-ascii?Q?C3qVeu/9TV3poKIEj06izpWKKwn3jRH2JR0JZOfTQP+enUUay3hAjZZtPhLk?=
 =?us-ascii?Q?hvk3BUQkH/CO/ZKmCiVAJ8177X/hI6iEsHgaKJ+80vuj2MHSUshAk2witGdx?=
 =?us-ascii?Q?2FNBkLYzwtiw/FEV2YE0m2M2OdXic7OcacjE/TJxv8wV3mD6FbqgnD6E4SGL?=
 =?us-ascii?Q?On9k8GZ+1PPCTHLSvIdYELdv6gs/3T+JtoaSixhoomRHr0k4tkCaoBaetxay?=
 =?us-ascii?Q?dBXWqPP4Xbo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KY/WZn4U9BUWRuucdEcILo1+MivMEwETsl1o8IE3J2mvaSNyPDgQ9WrLrmol?=
 =?us-ascii?Q?m2ZIYawk9LvSOIi3A584y2hYdYXoUiUsEiUVbrrHemsx1WnzfPu/TvBPUezV?=
 =?us-ascii?Q?f652nyYKmKcnZFjRd373H+Rpu5MFx+DFe3R3R/dIjv4Mpvo4+1Zh3Wh6lera?=
 =?us-ascii?Q?r4W6TCmbjZK5LbEgg3kDAdRlybIahQP0NLT+0PHvPTLmiRwRN5OuT7xwAXps?=
 =?us-ascii?Q?vPQCikopTPNGUrtXQaZZUXmMIvc1KR2K8pf7wysB3N6HRQPSxhn73Egdkw8J?=
 =?us-ascii?Q?DyBI4pXgxYbqYYTOYcEn1BR4xhFAbTEeD1GheVNlckygsgeb05BnQTKYCqux?=
 =?us-ascii?Q?+pG2gSzWiz3XIWRl6CO6K//aQ+p1IGSfXQJWY6pZK1w+XvORxUTsTYje3859?=
 =?us-ascii?Q?Nja2JSsMcKmQt/hrwRKGu+55PhDEIIk7iwHePYkVI2csVVjtT+O1kNzmCpIg?=
 =?us-ascii?Q?E3P96mWH/nNE/WQwjIJ9u8wDs2eWPhgMDInHAc7JLNMMwwvur9fJ3u1C46R0?=
 =?us-ascii?Q?D7aewrd2RMjzLwdGrF/IruuLQCSNNzBiZM/olZYEZJ+ezdZhtptmRNftzpYf?=
 =?us-ascii?Q?O+C+7oMl3bVs6GVM1DbRsEFhE8TeuHJ0K5Msr/asjowfmyQvooBGFf8f1/P2?=
 =?us-ascii?Q?BTBdWMftSwmohVgedS3+SXr99pohuIvKHRjlEwhRikk0yuNV8YZLXh46fsNv?=
 =?us-ascii?Q?tvqefkNXZxB/sXpy5+obps1zRaFU4QyeuFkPUsw6GvrUIjNEruT+fn3RCjP/?=
 =?us-ascii?Q?lhUt8ElwHqV/Ef2LnvRaahnayBO6BdAMwRYHkS6A/sI1zpF1fstiNCEEhQdr?=
 =?us-ascii?Q?6VhgJcbMofSHH/OadPH1JdL8g6aNQf8om05Cmt7kpwxuu1lswhwRDSP+3Nmz?=
 =?us-ascii?Q?RSrHT5RVU6Hkejr9Db0q3T9AAotYWu7nlMM5OdGqyUJ8f9aG+eVKETV7P3cg?=
 =?us-ascii?Q?8egBNjG307MnwBVS2jdq9RvQGCTvFSDyZQ55QdrbYWVW6voG/0aQ//m0m5Bc?=
 =?us-ascii?Q?GVpbs4qlHG6kbwoR3IO2pUN4jEQ5KGAjA8wsMqfDfkoQ/eQ1hQxIm0ByxKGS?=
 =?us-ascii?Q?xia2RK1LcpvgfhfPetS9kFBEwLfFLDOrnnmsLpG0nrUhqbnCXdFifLI5K6mt?=
 =?us-ascii?Q?3bnjYoAKhu8hZcZGvJSD6VZvwMDqOHFE2tYJlQvtXGa3iBmZ1VRM0Q2ERJfr?=
 =?us-ascii?Q?s1gvitCrQRetBi4Ui/t10FN3RF894RqD/EAERBot7z0dRUBWy8Z0uPMuSoHC?=
 =?us-ascii?Q?RgjKv58QFZHRRg2yAnvc8cHIXRyNRkz0aB44/kyx6aNf32yxQg07isYa1t5D?=
 =?us-ascii?Q?Z5pDpALnnuPQidDU+UNTPllkhLa0hOjJlurf33O06gMMi+hKKMwXpEuqzdO0?=
 =?us-ascii?Q?i4zWFCvgMAPGWkZiqLctsuEDRlCEb2Eu/iMsNL7AFr0vwZEy75Mq01Sa4YxJ?=
 =?us-ascii?Q?vtpoMK89sqpqFblrubLdaS7uB8+0eRraDSDg+MTRrMn2Fayt8PfPCiAvUobH?=
 =?us-ascii?Q?FFeO4gpJauWW6wogRtCQYR4haVoa4RHNWjI12l/nR0Q9mz1kwdAdACn3oMB2?=
 =?us-ascii?Q?6g8X6jDY570v+sjvpZaPrtYc7WuRkad+euWxDPMHrFzH/wIb9qzS6XKeUdW1?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f23e49-14c9-4a7b-7ca5-08dda2d4c77f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:28:12.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1CdYwkio5jyPsU9bsIO5rWvOdJWlJ+Z7HlVX7bquf5HBTObp88jLeJ1Db3rduX1O3BAvaYiS4duXai1U5FEZiyruMuPtOPM/vRVD7LD9VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
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

On Tue, Jun 03, 2025 at 12:12:34PM -0700, Matt Roper wrote:
> On Tue, Jun 03, 2025 at 11:54:29PM +0530, Dnyaneshwar Bhadane wrote:
> > From: Matt Atwood <matthew.s.atwood@intel.com>
> > 
> > Display version 30.02 has a lower max cdclk rate then 30.00.

Actually one minor typo here in "then."  Aside from that, the r-b
stands.


Matt

> > 
> > Bspec: 68861
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> > ---
> >  drivers/gpu/drm/i915/display/intel_cdclk.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > index f0c673e40ce5..4625c9cea4b2 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > @@ -3385,7 +3385,9 @@ static int intel_compute_max_dotclk(struct intel_display *display)
> >   */
> >  void intel_update_max_cdclk(struct intel_display *display)
> >  {
> > -	if (DISPLAY_VER(display) >= 30) {
> > +	if (DISPLAY_VERx100(display) >= 3002) {
> > +		display->cdclk.max_cdclk_freq = 480000;
> > +	} else if (DISPLAY_VER(display) >= 30) {
> >  		display->cdclk.max_cdclk_freq = 691200;
> >  	} else if (display->platform.jasperlake || display->platform.elkhartlake) {
> >  		if (display->cdclk.hw.ref == 24000)
> > -- 
> > 2.34.1
> > 
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
