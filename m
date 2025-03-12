Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7043C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 20:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFE510E7A2;
	Wed, 12 Mar 2025 20:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUptc5r/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C455210E69D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741810345; x=1773346345;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kmJYk0d29Y6zGr+0OtTTxDNxVHv7g5ET5m53Aucl7eQ=;
 b=nUptc5r/Lk0r+03l8GjYU3sg9hx22mNf8392q+pGyEMgKZ/zS+Nzjlnz
 TeMRbsHecediLE2/S2yBoc5Zqv5AplknEm5eOVb9tMcG5Vi1XkckDrMF5
 wcU0HivHzFR9HO/BwWGooAkuN8wYBX4+hWsEMHCGotk66z4TPgEm53eqb
 TIa8hQdhQsqwipFJ8A+Cd6V1GabSIQMyQBwOndG+kI2+aP/AYRxmMA6bx
 axBcoVYCCH+a16ROHzvoQFX4nsw1MWyEAzkvTr/lflcBBg6edS+R1qtjb
 7XD/LsYHMQdqpw8puS9Iqnih/1hSPRmxV3aV2MndgabMVzKTVf1UptquR A==;
X-CSE-ConnectionGUID: 0LyO7TJuTwGwFWUqqEbGpQ==
X-CSE-MsgGUID: ZjXK5mFqRU2xrr1iW+ytQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53538637"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="53538637"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 13:12:25 -0700
X-CSE-ConnectionGUID: kp+0T2PySRiZf3LQ0c1IdA==
X-CSE-MsgGUID: 4E1hRlbgRf+ybXz9tS2hHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="124901908"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 13:12:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 13:12:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Mar 2025 13:12:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 13:12:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQGNfHC8jpOkEpQ9+KLC/9r0Q3O6WecM8D9Ss+OU8AHBqitqXU6xz1qoDhdywvhzDuqClQHHqUrgfyQd0pAQTpvvPPkYZI40Y1pUOIY7ugAVk+JAZAuTVytCPFf4zrhU1bT7dwhL8tI2m+5oH9eUk6qheSf+LRVtakorVCdKGxW4Nf6IBdrIYJK4scIKECHK8TjRxsZ2KhMGV8+lTIMD1kyNNXVMS00lnaJPg0DFwoyf1vFjVCzzDHr+e2camL3CcjptUcIfwo9WSnJ19GfwQI5JqCjYKgi6tvPKLqsxEfXsWGOMt4mqRTMarEG41+6ZYMUt9HIx3WbpUVTS1Pl/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIAdRKuc6vuzPRNuhxd6kzrPx+NksFmJ+/tmLyJBSBE=;
 b=d5iXaA3CPJZAy0E4rQM9EbuyTEDgN3cJJyk+w+AZqpJvvNZGIW1BpSVqVdNR3RNuPJnlP5sIOexsSUhqs4uW/ywmYIaEPmp0dq6G7MS5IGntDa0bbclvwKkLDz9U3PsCSqOoi3wEdFXispSAvZizKMFRZxIaNekmDEyABvFuZ7EUBq+ltSl3nEU3u0QhAhMElvIcB+TM/Xya8+a6Oeac1G9jHWInFXvWGXkD1JP+Oy2ZAtKu8eQNx5F3/2o8Co69ukiaW3plOoYwRDbaNdEvMTVSBuKxmVe5CiAACsbkohvuL/+S5fWMRPcY0UXqtGZpDhV54YDkRH7Y7n/SPphANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 20:12:21 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 20:12:21 +0000
Date: Wed, 12 Mar 2025 16:12:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: intel-xe <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Move survivability back to xe
Message-ID: <Z9HqoTBhvwscVxOE@intel.com>
References: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
 <20250311-fix-survivability-v2-1-729ce081155e@intel.com>
 <Z9CjNDYFg40wqT5l@intel.com>
 <d5o2j2fff2ntlmzq43marpyx3r3uec3cyarxjhlq72e64xxydl@gmudrfgn7xhm>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5o2j2fff2ntlmzq43marpyx3r3uec3cyarxjhlq72e64xxydl@gmudrfgn7xhm>
X-ClientProxiedBy: MW4PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:303:8c::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: c68f8895-e6ef-4291-d0fb-08dd61a23237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wrebbLiMv9TeMy7+h/+1YAIk3hbaHO/XDmse3XFuxdu2gU5Dbto4XwtHuZoz?=
 =?us-ascii?Q?n5HkDyGEoLyV9MLX7tp7nUwjAnJjJl01B2wCyF2rSadpbjF6XLv6R9Bgjm4k?=
 =?us-ascii?Q?P+Y9h19dy+FqSfMeJkvx2G97aPLBgidyluNnlxgJgB6Tb8TIEKbkMZW8Bjh3?=
 =?us-ascii?Q?SIu1H0drIaw6/0VGaf1pbS5AR4ErgusCl2cNw3et2Pg8zhIxUgh6tchnSeMf?=
 =?us-ascii?Q?qipwH16qMbPKl2rhk9PzDCB7eUzBTxiW5tHHIFkFyM+5NplQMvsOGy9yOwVD?=
 =?us-ascii?Q?QCdiPP8BjkY9hqVhCtq2jlplcnkswlEiLtC2/5i1EaK/euDqUdLQQWq3rl1B?=
 =?us-ascii?Q?JjUvpD0nn+sJCdYf+WKrjF38BiQjgtu04K+OzWekajxRPAOQxZznhZQt/eO8?=
 =?us-ascii?Q?v5j8rR74ox/nBs0r5C09naORr2MDS/wG01RbRl99VE2q60SGqJ+6xIMAIQAM?=
 =?us-ascii?Q?SkcFe1AvyBgLg5FKW/C6AfBBDWDGRra+0JxjFRMUZxJCuuEHqDKTwkhwfncW?=
 =?us-ascii?Q?x96eMhL3ktuRN0bRLnfUoTcAhdCvgaEu5cPlz0CZW6LzEw732nmPTxwbHKY4?=
 =?us-ascii?Q?pla2fbxpuE1+wGzH0L67V6xl3H46vmgrASItyzYaJFWTjDK4Xd1qyyJzUu7+?=
 =?us-ascii?Q?iQ1/VPLA3sv5qxHx5aixg2cL3yzF8sDPuFCsCPqBDX+knpHIxTSJPsrPBImf?=
 =?us-ascii?Q?YtpuDrnW/taByUlF8cBAZqLPZHc145HpBsq4eJR7Lv5DLvaZtr3hcLhqgusk?=
 =?us-ascii?Q?HIA/TaR03TVY4vhW3ocOz5P95llR2VSECcB1VQgUcTRHvhqZlfhvFbd+I6aN?=
 =?us-ascii?Q?eTIYIyX5arEbkSu9FFTr1mBdf+5ZdBvCmoVJL/D2WG0O8eORKALA7tAUvT/2?=
 =?us-ascii?Q?+R0n+fqa62urSuZgEep8l0KbKkHNRQ4dpXJrsfvm560tgpRv9zfSg0+FM3O5?=
 =?us-ascii?Q?QYUD9iWKa3/Vj7mDvqA5ZFLZ8A+bfxF+I1gl1FKoBN7MCFM+oe0PB3uEJqYA?=
 =?us-ascii?Q?P7hDiZ/bDbx8OC59n9UHBfecERNMjCQyzeo4NRGdOoAFGLEI91S0OlT//FnA?=
 =?us-ascii?Q?7swlAPCuqQgFK12IqUg371MviGmPzoSPIrXEl/EkqqcZBrfVn4ZQrHaxVYrT?=
 =?us-ascii?Q?/4hkrKkgISCBFgi3hu1Z1uO8DP7KP1k1lbysEKq3xXRAarOfe+iQO2BSChxq?=
 =?us-ascii?Q?R6o7/u/uXIM8Jxe1teyPgidxA71rpSVDdc01u7QrHBEvc1MEQ8V6C3Ww32Fd?=
 =?us-ascii?Q?RstWbpEISUSb4wJoWbR5JpdsxLaiT2z6rtfpIrHG67eGf86NuQXjvN9KNMAR?=
 =?us-ascii?Q?/51Ia+STsYu2f3gB9hmT41qRChzQ5UR/eBYM3ttplp0YGOSQpl75YdN12LK1?=
 =?us-ascii?Q?ICKJfsW2HHUn2oMnFceFT102qECk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jmwBVze1YdETeN1aOznHW3FA7G2opRXRSTGr0KUGcxEieF7F+oNUyaDr236P?=
 =?us-ascii?Q?9Up+e2Sf4aoy8a8CljEjuCr9+AmDwcigBP26zpLWAAXsWYWRBoeWvJ7cgab7?=
 =?us-ascii?Q?uW4AYg9KArOGFv9gzZyHzqjRxOk8z0b1x0qOILRSumd/CZ72HJ1L7cN8u5Mf?=
 =?us-ascii?Q?ZJaG2uBC+ZZBjr7kDYcmQcZchld3SAKAcYLZeXrZz36/94VftQ+SfTLI5dTu?=
 =?us-ascii?Q?TvJnyREpUE6WzwJuVyEcWygJN3FhnCWHbmNk+6jRwFb+2efvw1UmIxNy6z/a?=
 =?us-ascii?Q?a+YKsSZXVoq0aQLj5IlaB8mHY7A4gmaMY4rnqyfGMnabzG5v0exAjmY+h8fT?=
 =?us-ascii?Q?XEKwg9vKqOHgFGPlmneN76tW/iPn6azmkSRdf6pOtFYsBCYvx4FjatAmjACV?=
 =?us-ascii?Q?2w9EbGSZE5vLoQdsPfN7R+hM1kqjXJnO8sH9NsE87tXdkGIzWGOIlAGNZ4XY?=
 =?us-ascii?Q?uiGfyYIZrWR9g0OA2bPC7sTWbEENLFR/vNN5S5SC5JFv8ns2VIO2vC5FSld2?=
 =?us-ascii?Q?k9gwqEe68qRoVJQl1etgmeusIRidcW62Cno17sttaky9jKi/PDt5YdmM4zsJ?=
 =?us-ascii?Q?X6wPaPHvib+h/ay5+xiRsgyYUvs/KjHmzqpZLJ8Q6J9IQvsbS+cqscassEXR?=
 =?us-ascii?Q?FQGLQe9hgHgdmKSr+5tRMVWpFwLQ2dyWWgv5JB+8bElDBKi6u8T995enQweY?=
 =?us-ascii?Q?WfQMWYQv5qEqtbWYkFUW7wCAL3w0KFy6bMLegXahUn0z2F9J4X0gEw1ikWI6?=
 =?us-ascii?Q?2RQLCYU4Y7DocsGZtd0+9s1zM2is6rc6QyCTv+PD0nQo2M6PFl9OhA/ynkMX?=
 =?us-ascii?Q?Fi5iFvpZyo2A6nD3ELdmXy2ODp8YIif/T9+Yxd48SiW8aWMLt/3ANwCGkShT?=
 =?us-ascii?Q?CdqcOzSCu1hiW6IqOU3tlvVxuS93RB13c5MsECr4OEqRyldjN2vVLtBy3XEt?=
 =?us-ascii?Q?HJ/EjPqfDknT9g8eQm9LLfR7xf2goTQnMRfzcw90xF7mKvnh6jWaR3l0yzMU?=
 =?us-ascii?Q?EIgK+tmRROLnWrUQemOq14MySEhEYKVPBkArHOZfT/LShOCsEmdtmHUo1AKP?=
 =?us-ascii?Q?um5Vi8GW+aqo9C3v/xn6V80cM/qVR7A11xFamH5srsfAO+n/vIcm6Oq1z1Wm?=
 =?us-ascii?Q?UtyGCWuage0eWKECbr83fVrdGqE8kHKaj1V7QXNngg6PMUMi0T2CPrJVbCvN?=
 =?us-ascii?Q?FOixHYJAZXb4ou5JiyKwUhL7Qy2OJZeZ8UpKDSCG7el7QZVWVTHNXuZWG/ea?=
 =?us-ascii?Q?yl/dcYe8m+9sjWsKli2e3CKbzu6RMNfD9lIwnNoepnaeIuHH31ZrAgRHdWTz?=
 =?us-ascii?Q?9GB0OJXKKcDfR1YAqyslVOf904IOnxMu3303CyxrsB0y+7dn0c4ceTW/saq4?=
 =?us-ascii?Q?nv1fIXQ1yPWNbDMSyUkKrj14zq3wtV1nsDw5h+3QUuMcg5y3R1Q8l4qDugYI?=
 =?us-ascii?Q?8375fLdYu1Mm+Hg+FTaAcQucRFN9lw0Mm3+Lli6rU/jlhSYtJYIBSaMMUUha?=
 =?us-ascii?Q?MpPINid84TCXtl/O+u6cpJFk8UcOtEoh2T8osJIGUfa4JKRCNF5IzOdsRQ0j?=
 =?us-ascii?Q?TpynTF+1v0Ldv8/0nYCwFqGgDZ+yyXhSs4idV6DoBxMkq5aGUF0LDHsY2uYy?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c68f8895-e6ef-4291-d0fb-08dd61a23237
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 20:12:21.3647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wznr7MtXbU0T88fv48nN+eyipC/AabIJFd3+YWv+tCavRZ+SQovxPVOtPtv5BzsyueurOeTYyjw8f0K9TWhmiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
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

On Tue, Mar 11, 2025 at 04:09:44PM -0500, Lucas De Marchi wrote:
> On Tue, Mar 11, 2025 at 04:55:16PM -0400, Rodrigo Vivi wrote:
> > On Tue, Mar 11, 2025 at 11:34:55AM -0700, Lucas De Marchi wrote:
> > > Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> > > moved the survivability handling to be done entirely in the xe_pci
> > > layer. However there are some issues with that approach:
> > > 
> > > 1) Survivability mode needs at least the mmio initialized, otherwise it
> > >    can't really read a register to decide if it should enter that state
> > > 2) SR-IOV mode should be initialized, otherwise it's not possible to
> > >    check if it's VF
> > > 
> > > Besides, as pointed by Riana the check for
> > > xe_survivability_mode_enable() was wrong in xe_pci_probe() since it's
> > > not a bool return.
> > > 
> > > Fix that by moving the initialization to be entirely in the xe_device
> > > layer, with the correct dependencies handled. The xe_pci now only checks
> > > for "is it enabled?", like it's doing in
> > > xe_pci_suspend()/xe_pci_remove(), etc.
> > > 
> > > Cc: Riana Tauro <riana.tauro@intel.com>
> > > Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c             | 14 +++++++++++++-
> > >  drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
> > >  drivers/gpu/drm/xe/xe_survivability_mode.c | 14 +++++++++-----
> > >  3 files changed, 29 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 5d79b439dd625..023290e5be392 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -53,6 +53,7 @@
> > >  #include "xe_pxp.h"
> > >  #include "xe_query.h"
> > >  #include "xe_shrinker.h"
> > > +#include "xe_survivability_mode.h"
> > >  #include "xe_sriov.h"
> > >  #include "xe_tile.h"
> > >  #include "xe_ttm_stolen_mgr.h"
> > > @@ -705,8 +706,19 @@ int xe_device_probe_early(struct xe_device *xe)
> > >  	sriov_update_device_info(xe);
> > > 
> > >  	err = xe_pcode_probe_early(xe);
> > > -	if (err)
> > > +	if (err) {
> > > +		int save_err = err;
> > > +
> > > +		/*
> > > +		 * Try to leave device in survivability mode if device is
> > > +		 * capable
> > > +		 */
> > > +		err = xe_survivability_mode_enable(xe);
> > > +		if (!err || err == -ENOTRECOVERABLE)
> > > +			return save_err;
> > > +
> > >  		return err;
> > > +	}
> > > 
> > >  	err = wait_for_lmem_ready(xe);
> > 
> > I'm not 100% sure if we can skip this...
> > Before this patch if lmem_ready failed we would also check for the
> > survivability bit...
> 
> which was not the case before the breakage in
> commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci").
> This restores that behavior, without the odd split of "init in the inner
> layer (xe_device) / enable in the outer layer (xe_pci)".

hmm... okay. perhaps we should just mention in the commit message then...

> 
> > 
> > >  	if (err)
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 4d982a5a4ffd9..6fea3091e2348 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -808,16 +808,14 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  		return err;
> > > 
> > >  	err = xe_device_probe_early(xe);
> > > -
> > > -	/*
> > > -	 * In Boot Survivability mode, no drm card is exposed and driver is
> > > -	 * loaded with bare minimum to allow for firmware to be flashed through
> > > -	 * mei. If early probe fails, check if survivability mode is flagged by
> > > -	 * HW to be enabled. In that case enable it and return success.
> > > -	 */
> > >  	if (err) {
> > > -		if (xe_survivability_mode_required(xe) &&
> > > -		    xe_survivability_mode_enable(xe))
> > > +		/*
> > > +		 * In Boot Survivability mode, no drm card is exposed and driver
> > > +		 * is loaded with bare minimum to allow for firmware to be
> > > +		 * flashed through mei. If early probe failed, but it managed to
> > > +		 * enable survivability mode, return success.
> > > +		 */
> > > +		if (xe_survivability_mode_is_enabled(xe))
> > >  			return 0;
> > > 
> > >  		return err;
> > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > index d939ce70e6fa8..153b8d598a270 100644
> > > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > @@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
> > >  	return xe->survivability.mode;
> > >  }
> > > 
> > > -/**
> > > - * xe_survivability_mode_required - checks if survivability mode is required
> > > +/*
> > > + * xe_survivability_mode_capable - checks if it's possible to enable
> > > + * survivability mode
> > 
> > that bit doesn't indicate capabitility, but if mode is required by FW
> > after identifying if something went wrong like done checks and lmem
> > link trainings...
> 
> You are saying the HW **requires** to enter survivability mode and yet
> there are multiple checks for "is the HW even capable of doing that" by
> means of platform and IP version.  Combining all of them to me means
> more a capability: platform supports it, and during initialization it
> **signaled that capability** rather than required anything.
> 
> maybe neither capable() nor required()... but requested()?

+1 on 'requested'!

> 
> > 
> > >   * @xe: xe device instance
> > >   *
> > > - * This function reads the boot status from Pcode
> > > + * This function reads the boot status from Pcode.
> > >   *
> > > - * Return: true if boot status indicates failure, false otherwise
> > > + * Return: true if boot status indicates failure, false otherwise.
> > >   */
> > > -bool xe_survivability_mode_required(struct xe_device *xe)
> > > +static bool xe_survivability_mode_capable(struct xe_device *xe)
> > >  {
> > >  	struct xe_survivability *survivability = &xe->survivability;
> > >  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > @@ -216,6 +217,9 @@ int xe_survivability_mode_enable(struct xe_device *xe)
> > >  	struct xe_survivability_info *info;
> > >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > 
> > > +	if (!xe_survivability_mode_capable(xe))
> > > +		return -ENOTRECOVERABLE;
> > 
> > We might want to enter survivability regardless of that bit as well.
> > With that configfs work that Riana is doing for instance, you set
> > that, but you disregard if that was requested by PCODE in that
> > 'required' bit.
> 
> we'd add the check inside xe_survivability_mode_capable() to account for
> that, still checking for platform. For my tests I was just doing a
> 
> 	return .... || true;
> 
> in that function, to be replaced by the configfs check.

ah okay then!

> 
> Lucas De Marchi
> 
> > 
> > > +
> > >  	survivability->size = MAX_SCRATCH_MMIO;
> > > 
> > >  	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> > > 
> > > --
> > > 2.48.1
> > > 
