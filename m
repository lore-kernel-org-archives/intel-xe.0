Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1103E732EA
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 16:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D0410E697;
	Thu, 28 Sep 2023 16:38:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E6E10E697
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 16:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695919126; x=1727455126;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ycFSiq7LvihbNMz8xs+/EzVcD1tUVvZvAgq8/v3jH0M=;
 b=n9vqxdb/OUfUwkbtMupTm/kzPm+9TYcAc/5W1Nb7ulaDPPQy4ijQYHbt
 4GSZlE45hM11k9rYTIPSyaNM78/41KhlwAuDcN/oo/w0StiFaQ0qw0Pas
 5F1oBOdAiwfibkjD3DUq9FUxi+yHRiqthPE1hWIXMfNPU7o0ivWbAeUTZ
 ySESAfsNNEMTzTWfYc1RT9ack+YZ3XYJZX9ncEGeMg9YA/uxRxVfrkwzB
 2+USlkQ1XsrD9ZsPbXyqiWsvysFwnWD9PZvbgJlNVQ1t1zsD+G6vRCsTf
 4wQobRaxoWLmIcWyIi5ZTmt7J3iCNBkiJThIc//sDCPqWhp5ouPn34sNi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="380993457"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="380993457"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 09:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="819923791"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="819923791"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 09:38:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 09:38:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 09:38:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 09:38:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOeKjh8BFNrnY/hEmavKiNv7bSGYjxdiXTcYO8Pi0s0ONx6JUNgKVWscUIrb9/xtIp+WKjTemYbYGKmw6Wutp6OC0jJcnBD2hKDrXXK0fvGDW0e+nVWMRsmk0G2iways4bhGV1ijyUaCdZqYehlaKgFglHzIT13iclbjGCxpJ4h2n45554lOhu4coc0HgWlwsV+rorIVvlvqFVkKHQkb34fAd47XN3u+8uvAFdTG2tzQJdGzS3U+PvcMwCrOAUtiuHv5BCKmmPhxggFzOTfB+iIHxxsiH3HpGsQO4GqDdPHNUZsuKrH+V3TbqNR/cQtWE0b0ZDVWXWUp17eJEcLKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YISZ1F2p80PV4jY03caqR+oXm9RrDEighv0mvrV/bs=;
 b=KHVXKqKeKxB2Kep/yEl+RWt2kcPHGLzd7EWTPAKvNVu2d2/YhG6OY7xeL5IzoMMV0frIRHsBsi4odNo/iXTRKFotOSv62PQ3xrsWf+0EsROyuv0wNOYLXNejXsN5uIDCmJqtgWCSDgSMKFf1s2PZ/MCzZJqxTlZ9JE1bpct54+YYVTJ/Qm6qWb8Xo9yGjnnOIewgcHZ/zSoLInoOGnu3JeDPcbgQ2wKQ3M+depxw85auWaUPGgJBWv0AYKsnfxZOopj2fvZxFllPKu/qwKQDuPP1h/+pifr2jD9vDGHkYgBaOSkVXMoBC1yj6LdCSJlHq6Trg6KkS2jEE75ADp8uUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB8300.namprd11.prod.outlook.com (2603:10b6:a03:548::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 16:38:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 16:38:42 +0000
Date: Thu, 28 Sep 2023 09:38:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230928163839.GH2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230928100537.392675-7-matthew.auld@intel.com>
 <20230928100537.392675-8-matthew.auld@intel.com>
 <dbemahqf4yya7icjhcv47v34fqbfgl76rlyeordmno4dupfom2@66sdmkd6duor>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dbemahqf4yya7icjhcv47v34fqbfgl76rlyeordmno4dupfom2@66sdmkd6duor>
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c476dbc-4f55-4aae-a8ea-08dbc0416021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2/idJtST0uzhyV9uQuFF99T8re7asJ/zgoA/x9LX0SriIF1S05VgG5ogmAjD8AY8pVj+lgi/XPQsTMKmIcu+xs30jqcweudAY9dJeQGjov0FhMMWDytU4WVgOWJpzABaRRex7apHJsUSSpugpDimhUXY0wRk8JBbruh68sNYGOxd0CDEEEl+2ffJhz3+SzZlU/SwvuaPVeq8I+5Y27yAr/x78v1LFlFd7ETcKHGnV67KIeahtMq7SCKtw1Gj+ZrMq8NYyvH2FOw/ScTXJUyrsuZXV9HfPjBKRndXONv2FBT67cmhvn2dXK5gWscraTEp7IueFwFh8AAY+Ih5CfUi4Qiyx68lShXGjjAs0PouFkWS6j/joztqmjU0xu/QuuJJ2UWXbjtxBuJJCM+m/m1VQFGIiKMBTe03fJJW6bGSr0ek9PdzosNdyiRYtBpJRXk/qa6E2CcHA9iZQn8F+/7z4Sp6lfW0/bMmHL/jTy8rHrm57KZVYYWML6CRKXlj1WxrzlpMdpFCpUjaUzMQjY/jzPiUA6GAI9KSBm1QmlfmoP3iu1Ij3MGqWMQhpza0g+9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(83380400001)(26005)(1076003)(86362001)(82960400001)(38100700002)(33656002)(6486002)(6636002)(8936002)(316002)(8676002)(4326008)(66946007)(66556008)(2906002)(66476007)(6862004)(5660300002)(6512007)(41300700001)(6506007)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ar5rbIc2zjE9V+d2Su5e2VU8LJvEzOTuSj8J8+po0tWmA//yFOKx7KD08u2T?=
 =?us-ascii?Q?ElGtnn91MPBk6+DEgFHGoDbWJLdL+SY7Pgh/an+49PFK0kmHlbOe+DwEGirk?=
 =?us-ascii?Q?P5QsCT7nfWlOrFgW4WdF5WdThJRWepXGpFI26iLMUS4j1EeJooMcsEl8DHLg?=
 =?us-ascii?Q?KcPYzZwgvaB2kIAOKwvPgmIk2R3cuTtDTFnvslB9xutFQg/on8x4OaNgmI8u?=
 =?us-ascii?Q?cM+PuUNTbjQ3Dyw3JajvQF0GIVLpwLLvAOAqXciASQWju41vPZJtiDr+IQfZ?=
 =?us-ascii?Q?cwjBgzJLMUHCh+MH2bOdKFFbnU5cJ3ypb6AXMM/GNLod9H3ZXRxFy47teZkf?=
 =?us-ascii?Q?AHkcUvnOYdivxX2OP7DJXQCwp7P/2k+lGuyHzeuxNEPzlQKb9D8hS7tXSrk3?=
 =?us-ascii?Q?R+bXBm36wDPiIjiwo2NFdVUeNWopyspMHYW/eeSIP8p+fdtKr/Bn1GvVEXmi?=
 =?us-ascii?Q?5sdx+EREtiDlFL5E7qDL9HNfzLPH7FaXWNXmGXrFphncluoQWeOhMk9PJiUA?=
 =?us-ascii?Q?l0oAP+V6nkVtCdGxOoYGhITR6zO2KCsFWSsdwka9QOHWr+qR2nzm4vhUSLw4?=
 =?us-ascii?Q?RVOkONLWH4ReHC9snT+OA1ImlR/kbGu6+a7BXtAa2YJru6oR+n46xIsfr9Dj?=
 =?us-ascii?Q?Ux9FUq5/2HBBkS2SbRe6iPMDVejuiOF0uBjbH9L5aC85HecbNJKFHx2n2oui?=
 =?us-ascii?Q?ZF7G1FgUA/4KiYDsBkWW5zlx5K4Sv4y7YviVyfdrR1a6OQbCgv1cC7QRyPWl?=
 =?us-ascii?Q?5Ai6yohzdB6FD0FA38QAyS+TzMUs/CJ/QGCsfLvDn86dQE9R3IqvuXWw/OkK?=
 =?us-ascii?Q?kkP/N9jsbG4L1jdHtwWWCEX29u36FdZGx61+pTmsiDyv2rwqwO/GW5v7OIPC?=
 =?us-ascii?Q?49qdSk0Sx12NXWzHTT71a70r9num9G4kAkytTqXLxIKelWRhdVaFEyHXDL7O?=
 =?us-ascii?Q?2F3LlIN8qtbsJWxAR5jSWlAPbVxIor/+bGnjCCxP2VJOCtNj5bpaag4gmqfZ?=
 =?us-ascii?Q?o3Z0BAJrpbp6j8gsr4mfYBX0DtG7Cmfp9wQ0v0fponmebEkeYNnKSCsf/Own?=
 =?us-ascii?Q?bmO8zcWml6xBtvLNV85QYFnQ11Nqz6XOzPn7e0C9Hwf19DJU/VHsGCrErDwn?=
 =?us-ascii?Q?E4WEj4uVVb13xG5iUr0xYl5YshvztXgDyvwI+/g0PrQba7mv5+tcleBIrGJp?=
 =?us-ascii?Q?ltrc6WwlZF9D2slhymtnY46cx7LBE/vd+4Q5x2/DJC7v4yeuEpaJ1YCG5WJq?=
 =?us-ascii?Q?1KTdzHbgLiWZyCGxRHXu+BQw1fWsVPqwbaYr87L0HkLsuEBaUIJ0cm+Pm1jA?=
 =?us-ascii?Q?9MUACu2O+fCERHlFXRVjCyqV6HtzHZpXT1XKU/eU2KPzohAPK6afBQgCIr1c?=
 =?us-ascii?Q?As1vvgPrZ/hB2W+lS25VJs3Bme+iO26IYJqa1yyXdSY3OaBR3GIO74eGCiea?=
 =?us-ascii?Q?A0kyVK/tJCHyMEDWpw/iyH0/fuPDDJX5S8WriHL3h65XoYr4MZS9FIha0L8V?=
 =?us-ascii?Q?9BGRIqjCVGW1jUo26KshGSTM0SxU++RVC/QZ64sCUycyr5nBuOFTjnCojQu2?=
 =?us-ascii?Q?WlnYq8E68KzGIsn46x1jcDkifjYfX4VPHPyMXCqgNgCzG71PbIGHjYVNmWR2?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c476dbc-4f55-4aae-a8ea-08dbc0416021
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 16:38:42.2622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uC8QwDgUVyl+bPorEuBqFWcd1p0m4WWu4SAcDRkS+LCy8/svJ5MinHYFWdnyV39n5EJuiQ0nMksy4dkS037W6qHiTvNtV9zIBw0q7d+bzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8300
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 1/5] drm/xe/pat: trim the xelp PAT table
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
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 08:04:18AM -0500, Lucas De Marchi wrote:
> On Thu, Sep 28, 2023 at 11:05:39AM +0100, Matthew Auld wrote:
> > We don't seem to use the 4-7 pat indexes, even though they are defined
> > by the HW. In the next patch userspace will be able to directly set the
> > pat_index as part of vm_bind and we don't want to allow setting 4-7.
> > Simplest is to just ignore them here.
> 
> But why do we want to leave them in un-programmed state? Wouldn't it be
> more future-proof we we program them to something like UC?

By reducing the table here, we prevent these indices from being used by
the uapi, so it's impossible for userspace to ask for them.  PAT only
gets used through the uapi and can't be specified inside instructions
like MOCS can. 

Also, even if we did think there was some way for userspace to get
around us and accidentally utilize these, the hardware defaults are
already set the way we want (maximal caching).  Maximal caching is also
the strategy we use for uninitialized MOCS entries because the
expectation is that userspace is a bit less likely to see a regression
if unused entries become used in the future and switch from more cached
to less cached than they are if they change in the other direction.


Matt

> 
> Lucas De Marchi
> 
> > 
> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pat.c | 4 ----
> > 1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index 869aee64641f..36b79d675e54 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -42,10 +42,6 @@ static const u32 xelp_pat_table[] = {
> > 	[1] = XELP_PAT_WC,
> > 	[2] = XELP_PAT_WT,
> > 	[3] = XELP_PAT_UC,
> > -	[4] = XELP_PAT_WB,
> > -	[5] = XELP_PAT_WB,
> > -	[6] = XELP_PAT_WB,
> > -	[7] = XELP_PAT_WB,
> > };
> > 
> > static const u32 xehpc_pat_table[] = {
> > -- 
> > 2.41.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
