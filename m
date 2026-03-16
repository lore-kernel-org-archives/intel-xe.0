Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160C3F53D74
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 16:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D0510E29A;
	Mon, 16 Mar 2026 16:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgmfIIIa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6668B10E2DD
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773679496; x=1805215496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=riT6nfvifMEiLCPhVrtsvCxSPxELWSPwZfkuF9vaMg8=;
 b=bgmfIIIa6c4eNE0zErIpFs5RjgCt32kokSGaAA59EL7U3lk2kYJpewQj
 WC3VnLrERKUsggn+p9/oimqzfh8S3+op7Ufr8m8uZyRWkD0iiUQS/5PNd
 WoYkrJE4qAk3RQhutqUerWbkyeMUEf06TrKl8X0QVv4deZoh3khvBWY18
 iurKQnuNZHVVjCpVoDaYFyWU0yfTI9ezNWC5zNcNN5JpffwKieyxQnSW/
 ScZ+ENx0pAEBuGHoDOVzHvHvZTQQI8MFVSuHZWrCoIQCtTk4rL3d2fRjN
 iMA6O3rOVX0xWWAU9cOp32e6UbP54Wb4Buo+qN6eejhs5zGgLS5w3jm+j Q==;
X-CSE-ConnectionGUID: CmAi3Yo/T7apitQ3C3b1mA==
X-CSE-MsgGUID: McAVtq3kQa6oOAvgKlQ2hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74589712"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74589712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:44:53 -0700
X-CSE-ConnectionGUID: 6a//6p6gRbqVXDg993oT8A==
X-CSE-MsgGUID: +tWnAU3sQKWMLVNapnlJTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="217779400"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:44:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 09:44:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 09:44:52 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 09:44:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n24TWaEKvI8GaAiMsdSVS+enAGfLwmfvO7DmmxfMc6vx4p84ZzzcFZcw4klZnVuyh/PtxNYS+sdlKpTDu0w7HJOGMe8T4TxXF7gVuz/viTNnxrvHFw0mPG+DFpgUfIuIi1blpUivgNus8gR5rcqmMZrkVp/+ny/cvhLvIasLIX2ZWUxalEp41sXR17Qch4G1PkDo6Z/0jLoaUpfdg2OnkHUFLjwlfMxJx+YZGRcMaRXV+uZsmXW98UMyTpo4XrQy/SwJWWRJALB+ZTBT2k5UTGt3JFxwgzd14E8sH2Zmu7/523jlbvHU+yr1CqeensPVt1Bdzn1zS9etNcSooZWJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPe0rzaSiKYgmmUVLXAr3df5YkqVqhM/uVAExeXknBg=;
 b=WiPhdhYbppx5Sk2VuJ7LyULee/DCu8PPNGi0EUUli+ZLuVEA8mFcPv3bO3axCHCT2fg4dXzCrhvefjPo3z1jvr/JcOFymqn3yV6B47bVE3VmmH13J8R+A33Vh0O6i3L3RK5KR8Gi01vm/UP2YCdvM//F6YGaYq7WNgp+O7PeWhQSwcP6/RP5v4chNzZ3m0Ug0Dy/PmO5tKquWqkd7VlBzZpaGp/mU5AmkVa1pRRa6wrbTk/iV0PctTZ7fBGUotm4iAQe4A8Gu0JAXs0NRF0+ViEgVJotkK//rOcIZXns0cP5TH1JzMYRUH5CvjgwGcIKp8GXgDXM1J3qxw7o1nuFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 16:44:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 16:44:49 +0000
Date: Mon, 16 Mar 2026 09:44:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Nguyen, Brian" <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Page Reclamation Fixes (rev5)
Message-ID: <20260316164447.GG52346@mdroper-desk1.amr.corp.intel.com>
References: <20260305171546.67691-5-brian3.nguyen@intel.com>
 <177294802851.330502.4629589411295974014@a3b018990fe9>
 <47c69b98-f6ec-4fae-a6e7-16fe7fdd1ef2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <47c69b98-f6ec-4fae-a6e7-16fe7fdd1ef2@intel.com>
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e145007-f09a-4e9b-7ac1-08de837b56f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 8hICUJ/LCWdHknJuh6SACP+LevsiXxSUtrrzb5M9xjg4SCTGXoBrtdR/V+adErKIbMbRbEuZ9HzSqYxrsfDHCBB7S224QFSmdCodz4ZobbiBPfnUqv/ZrONUNtHnj33ChZ6MeEvZunk4iOelD8OT5mBb/BbFanPz9l0pUFlzuMNoxpVCRZAQTc568jY9ayGlJssTeNiN/Zu6/xNDe4bmrfyGypsK11uaEjYiLIY3Fe6Z3BICYlnn6g4D7Rf1cpYq0PotYeT2BT81Ba39dAzwNX6GGy2r35Aza1D6BzmV32A/VWSXSwjA/g/pMZmHFUtlPLaOq07YTgkRR0m8cftHJBKTAXa4HcLTvJCeWv6HnUrd9Ea6yy296gL4+Dbp1trNZt20rgpgSR92n7tvShGV0W9qETK0ZAuupeG8N56zltOoTep0v0KNw5XeiUd53D4pvHZMvBdSGq4eRK38XKwpuKfoQfBw6DV7kg5APYT59ee0Qm7NX/7u2vHfppRtuUG7TZPsn1BIxQRL9QMHMhar1UveDNEDTJdyLpJ1lQIHmGi/S+6sGAvTcoiYMAk7o1o7AulJ2spYZJ11tKmthP6pQXzCG5Kn9xvHW4qQV7E+HrVkiS2hdk8RP01zUi4Q4flDd57NULSqwJ713pot74NbCp35CT3ehwl1OJ7zO0XGtpkptSjUZGUIVLDqOuInC8JO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gC3euuum0WtzkhE1Dip+pvTzcZAf3a6uQfZT1dKPsQHlqtlttHTO2jo6UJIF?=
 =?us-ascii?Q?G+UT77KGBixWR2L4vPhyonE3hAMCgRjLNFyk5or1AEcntNjAG/fgLsJcDlti?=
 =?us-ascii?Q?4AYD0IX3k+b7b38FA2SccNQdBkD0h2vdDX8y3OpxHaaieWUbQdMovWDRVokE?=
 =?us-ascii?Q?kCXABmHiA0yH1wslyGvNIkcxML5xUWlAvDTawi7vOMV3gCyeB3G0V5h4Vxo8?=
 =?us-ascii?Q?P1ZJ0k6jmRuPy6IuLt4mC7RjEQKQKSEPC8dAIehg+yEuZ97UfGpccVYqz6JN?=
 =?us-ascii?Q?59EoPaB2bvVZvM3QzfzD2KHxD/dGc8Dc7klgSUm5U0K1B0+4aJlqb804T8Hr?=
 =?us-ascii?Q?A+/DG9ETXFXYkIxr1ZiQZ1mqgdygb/2z+HSDV16i7V+lJtNS5xKtrNKxbg8+?=
 =?us-ascii?Q?DjdIL/SxEpR6shrQvmQ6hLZqsAVRpcTaJ0IDFBF0P8OYZyz44iMZnqXx3EAU?=
 =?us-ascii?Q?wvkNwjQT5PHpqW6pH24pYquXOGbY2UeB7J2v3sCqo5/FnO8Qt4lIwCY7j9XS?=
 =?us-ascii?Q?8Y+4f0Rx5iY0+u/eDgtqnPFUAQsh/tKEnJ+oJ/5IvNbDsHXAzH2miMl0/ET+?=
 =?us-ascii?Q?o+Hb4MeSeFEbxKxMG6mU3byzinJzx3kUebgj79nv2F2KAXe4xkQozMTLJwqw?=
 =?us-ascii?Q?NcD7kFJggpZ/0OBS9k/Fd7xDta78NAP6/ZjqdUSitb49sGTbOitMijp1qkZn?=
 =?us-ascii?Q?To8K/inLfRi2/kjGR6x2QrSFW4x3tRflN+q5u+PsO3qsTeOdcmkAoAj8IWAZ?=
 =?us-ascii?Q?UofpIEcji1lT7kitITBRyUlSnGx+pWRiVMBFsz8rWlRb5Qw9slipYPK8zGGk?=
 =?us-ascii?Q?Vm16m/nPd+lDgrgRYtFfiHeSTwCtCSEtGO89yNY7TU4y5RQUC+7Yc7hMA6he?=
 =?us-ascii?Q?WoPyOO0+x8oO0WbiBwdockCVaL9D4b1MLiKiABnriIPngv7eiMJIUu41uY0+?=
 =?us-ascii?Q?lyDAHkYqFYH3XFNxm1s4tTW60V0X/YZlM7sAAQEGcGm5HMcICicHIDrcXlaG?=
 =?us-ascii?Q?a9liv9WPJbrua5f7lxq2A5ZC3CFUdsaoSzIRZFMpEl8Io1WDEhzGrbKbhZNK?=
 =?us-ascii?Q?VE+JmdF0ok4zcdt1KnBCdZUSIk8jwPBjuA3DIUk/apg3qTALQLtbIxVJIoYj?=
 =?us-ascii?Q?Y1ffXCIgYDQ6mQR/InqC5ZzTfvjwW3KsJHlhbqK1PjJ2+x3cpzsOCFeOBEyH?=
 =?us-ascii?Q?iUBSfuXBIuqx61bk0zgxP9CphPcAesBeY3H1iuyw1l7IIkpJQAquuiA53KYq?=
 =?us-ascii?Q?8o7f9GGIrdaTfYZKsTPnBjZTyHabLFRjg4xhuWQyHdlt6KuIfJtL1MQ09HVP?=
 =?us-ascii?Q?8G4UPg7ZIwLe3OXoeUvX5DAqenQZdRH0EleAzbJk8JA7O4POiLPzfnFWqZ3/?=
 =?us-ascii?Q?ll1Y0glUwIZB481inXS9Czb37axJWOBWrOkNC7VEJhTVIREZVT542ME/8jm5?=
 =?us-ascii?Q?+GaEUFGzCQxXbTjEnS1ZjJZCNz/x8DcPC1kELbhUYaSNE+H2849U685Na6+C?=
 =?us-ascii?Q?gsOxoHscDobUsKn2JJ52jvS36Z2IGCZsjdNY0WFp3HJJQFoeJEXD6mDh+vUx?=
 =?us-ascii?Q?qPDXR488gAuqTOdUG2rMH0qiqNjUyXcrBT0y86jX1o7t4ojNRg1B4RgViK4w?=
 =?us-ascii?Q?YIECApFc6ItL+89MPpZM4YdKQqSTMtSENykyKUM6NFP/xslgQjNIwh7HcRkR?=
 =?us-ascii?Q?Gfz/UdZZ0idwUQ4xWHLNRlJ8hNXO7hl6IZ/Q8phM9EKZsRYVXjAN6LIW+5B3?=
 =?us-ascii?Q?FlDFlJAz+ArUpNJFsvkgQ8La0enedj4=3D?=
X-Exchange-RoutingPolicyChecked: raInK+JFj4aB3Lhbql7CivktgcWWxk3uWNj+z0DZuAnDjjdJO2yaR7CdbRmZRYiJwePJW8tSvTOF7+qMKPIwQy925vHtpPw3SmBiNBGgQNAYURDalJ4tQ2O1ur8o8R1C1B1SXxWDfSthbcJLD9RboEX3+g11CVyz78Wrq8atAYJet69uoOVBGG6Po0XO6CHPSSLtiTE7sh7B+/HDcc2Sgj2rN07uOnDydxvW8f9wEkn32d6VHiyEpJaU9mqhSuKvyMlKmiodqFGJocIoQG2wdkjKFuUyA1ctL6xaa/bjVDODOi7OPJ0IRp3pSreYHQGjbfeGb2rAXOV9lG8OHebxmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e145007-f09a-4e9b-7ac1-08de837b56f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:44:49.8347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFV0Zk/2iG/LNLQM8TG1llBOdVEAxC0HuRzzCi+4EnMD6/v4aXm9/1ykt0j5NUECwz3XPMG4rlYnDxpSLxWSz8kvlaJnCA/Re4HVZ1Ls4oI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
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

On Wed, Mar 11, 2026 at 11:14:37AM -0700, Nguyen, Brian wrote:
> 
> On 3/7/2026 9:33 PM, Patchwork wrote:
> > Project List - Patchwork *Patch Details*
> > *Series:* 	Page Reclamation Fixes (rev5)
> > *URL:* 	https://patchwork.freedesktop.org/series/162258/
> > *State:* 	failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v5/index.html
> > 
> > 
> >   CI Bug Log - changes from
> >   xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_FULL ->
> >   xe-pw-162258v5_FULL
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with xe-pw-162258v5_FULL absolutely need
> > to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-162258v5_FULL, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in
> > CI.
> > 
> > 
> >     Participating hosts (2 -> 2)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in
> > xe-pw-162258v5_FULL:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   * igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2:
> >       o shard-bmg: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-5/igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2.html>
> >         -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v5/shard-bmg-1/igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2.html>
> >         +1 other test incomplete
> > 
> Failure is unrelated to the patch series changes. CI looks healthy for this
> patch series.

Applied to drm-xe-next.  Thanks for the patches and reviews.


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
