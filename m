Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B93C87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 07:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD0910E3B2;
	Wed,  6 Aug 2025 07:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQiyqo6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB35310E3B2
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 07:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754464487; x=1786000487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P3aTwyu9/ICDohkbdAJDtqFiA9Kda0DtgOzuV7PyFxg=;
 b=hQiyqo6tO7Qe1ScLySn+wIKcakT3gNtWRfG6daI/WGfk0/V85pRu7Yzw
 us7rG8svsdILSOMlblY0Z14Rm9FQ8bO3K5IZlJ8Cddz8/JVcRuC4OX+an
 1co7dh1sZpef91quQSd99dBLKYeWvzOi1YnP+ybToW1CNf0Oxk1bb/r9X
 de6HtG3ZK/OvjoWzBPK9DnQY7WBVj3fq6H3uSdfCfMv64Tmx9cgYJz9xo
 s37iL8FB4Vn7L2G3IaBFR0jJ2ISnMCphg52cdlkNe45A3Y7hYF8JsT0h/
 m55RWJ8t2QuXpQ4SXuu9VqA9rIz7vlnNvjt0Om50KpTn9HeC8kfiQQZE0 A==;
X-CSE-ConnectionGUID: wdEOOj0eTMOdzA8U/2oPig==
X-CSE-MsgGUID: /JWv8EzTQQ+gs8I4aw5OBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74351695"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="74351695"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 00:14:46 -0700
X-CSE-ConnectionGUID: ITLOBU26QhGOqP1yDTvNDA==
X-CSE-MsgGUID: C1zzMEo0Ty2OJ9nGgRHWkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="165042098"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 00:14:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 00:14:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 00:14:45 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.68)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 00:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHaxt3zCLvpS0stSn4Tcbo+RYD09AkjUzEqzftnEKkRRq5dlezVy2SCMYC3q65r82M2+LziLR7+Pl+ShfdFBFaDWDssS7xZjP7ycQDY3l55uzz4a8ouIYl4N5Rfki7YFy6vK0rR+miBk9Iw8F+PeJdW+9MBQ+hMDCwOHKua7e0o4OoL4NbuMUbK7W9ZadkqQvMFiUsiPWZVvGm1a8i3XNwPV7IhvpLAzbfM/GAyl2a1NrZpOgpV2kzfNFEwOoLePWBajHTbXao95odf6XRNQZK3ciNnW7HO7nkCzK/Wn99FKRC9Xd0PxcE6UXr3GNI1e8MHOTe0O/JKeCIvX25graA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q40e5mFP4Rwu59uT/gCjptwy9WML8DhvBjavQK5kfM0=;
 b=IJ8yZqMjPVVXatgfK7+AOc59mjhd8IJBP50qB8I/40mLjrFK90ISuD5cxyFt9e/f+rTkmYijMug+YoLWATZY8uabEwIO/OQufIKiDv3SSAxfvLBpiDGSbh4rmVS2BhygeInOY/sRAZddJiqBbKlZ5uDd4Vy/zxzf4fY4o1/uMZKGMYcFQqQxh8mevYRfHamZYn/O378eSZW858IL9FYVM/NpIkJpj29U6MVgm7/7tFaPcqL3mEqhnLtPfTs+T9JeZDnFoH/4VEhRSWTsm2tiF8j+mcXZVb5+gOBvzbh0Damvp67jWTqrc+nfTePMhB4auWRYXG6mtAXZpohZQpJQ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7875.namprd11.prod.outlook.com (2603:10b6:930:6c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 07:14:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 07:14:43 +0000
Date: Wed, 6 Aug 2025 00:14:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe: Disable compression on SVM
Message-ID: <aJMA4K69I1JQRbXo@lstrano-desk.jf.intel.com>
References: <20250805220653.745400-1-matthew.brost@intel.com>
 <20250805220653.745400-2-matthew.brost@intel.com>
 <c16fe880-f8ba-4ded-892e-8b40e07e29f5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c16fe880-f8ba-4ded-892e-8b40e07e29f5@intel.com>
X-ClientProxiedBy: MW4PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:303:8c::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 135b2486-9321-40a7-0b19-08ddd4b8eab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oE15UYuv6vDoF8bV5gBHPxg66t+vdgVBHS8kpLgMFV8E/VxmnW+F1QWGsRnm?=
 =?us-ascii?Q?eNx6rIutgN+AmhV7ma4TV0kgLOLGskyN0mtbEFZEb28xhzmFFGb0vRHClEmc?=
 =?us-ascii?Q?acSqAbedSN/SKT/ahptecM4Xtw+YLD2JYcAUljVAdJ3Jm87ql5aMR7kYKCqH?=
 =?us-ascii?Q?9CG9oNiqD+PpOY1buELCj3TPZ5lKo9ONI9u+3KpbZfBv6sEvQCkj4XbVZdmC?=
 =?us-ascii?Q?3JXtiiB6o3BfHdeKoYq6wKWyzzDfevFhFMoN+yKCGYeMw2F07uduueAz0EUt?=
 =?us-ascii?Q?HRXJTlbN182m57OD0e/jGRlq5MfcoICmsmXmluTRLneJBnHN3HI+Pbxv9l4b?=
 =?us-ascii?Q?Plxe73Eh2clQNEwdMxIqSNQcuqyPmtEDAGh53w+7Czb8P4m0rDTqkE+eFprQ?=
 =?us-ascii?Q?lUrg62QXCpBVa546Y+OieWiA6Qiz43X3yCU47YJ2hjIFXcgkN1jJYxLkZ9CS?=
 =?us-ascii?Q?jsmM+E/oMWA5R0ydWSz4RSBxikXgvxJzeZDvOLNCbwVbISO5UWSod5JLpp7/?=
 =?us-ascii?Q?dJx+0y8l0UPxbqbRF9fIYqLMVtkD2UZofu2DlgUwJmw/+Tu877mtfqVhAyuP?=
 =?us-ascii?Q?iVqUgrAovUBAnknF7IPFJYWgG15/LvT+Bds7CHwCjVJQvUG0jtCj7EI4g2H5?=
 =?us-ascii?Q?K+VY6LEVaazf+KGyRMNMhOXbzHv03jHSeNr/nd6ln6WuCYoNX2NIe3OMJLNc?=
 =?us-ascii?Q?c9VT1TsmLvlZnH92RhRiHZ3faDruiLxJ1L7iW+mKALq3Dj8LQfBwyNCt4iHM?=
 =?us-ascii?Q?Ge9DiTXQ+6YiASsvbFLLB321ZglbarnOtqYSPx/K5jT0LpKUM5ooy8RqJMB9?=
 =?us-ascii?Q?Bs3jloqSPlcIHRWWYdfaKK+1XIqAdRWsDPA8b6k73r+WBngWLvE2iOrpEtuV?=
 =?us-ascii?Q?MM6jkYpax8WaTYLMUELNxnwEgHw5mrxg1baJTFKx6mE+SNm98lr2X/VCkOEz?=
 =?us-ascii?Q?xbw02GuoFPm82Q2S/9l/UgOtmH19rhOVQda58jC0dwUY3Sr5yBS0UgL4m+a0?=
 =?us-ascii?Q?H5EvwYN0Jli4eCcY1f4TKBviQ3JzzVtz0+/k1G9XA02nMdMTCAKr/JNZXuDY?=
 =?us-ascii?Q?iQLVGO+yo/e06kJkOEyxuzQqjm/DNtfAHwTPJHC6uXrcHnAGhdjJ4mWsEbG1?=
 =?us-ascii?Q?WGe316rDu5V8QT6FH+4BTbWUKtTZ5ODnSNgdG3KrvYOIryEuVhzjK4FT0C70?=
 =?us-ascii?Q?TcULSTlaagumIXl+7ZtFfGXO5IrU5SFh9nKAYuz3nHn9jKP2IWSxGSXAYIVj?=
 =?us-ascii?Q?sJd8z594UDyhcT4jM1aY1AQEjElPV+MuaV5+hDiBGqt+8NWDjdFT7AdCLN5w?=
 =?us-ascii?Q?zB7bvDrM15AgSBvswfKOAKZcC3K+CnkoUq0e3w21im2FT8tm7TSrk/TjXKc4?=
 =?us-ascii?Q?fKhd4XoV6/GHHxEPsld+HU4bRaWRjOK9aNS9juvgZD7jWbeH+O6zOj6jYGO6?=
 =?us-ascii?Q?pcArZXAs/dA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P2X00w9d//OcHgbajBfmufTi/EOnwio745Gzeq0SbcbGesTLqJclhRVpof2M?=
 =?us-ascii?Q?fl3o25f6aCLhoulZ0UoLNPBsH7OROStMwARfd7vlm/5jy/2yIqCPJko22zxR?=
 =?us-ascii?Q?C7bFfkrAVRTfxTDsRi9JJWEH4XyuIGjEg0jfN8JDSNScWfAVhRLZcOCa1MTA?=
 =?us-ascii?Q?RPuYoTKHCQuIoasx5pVW0M5Vlkddfys8viIweyH9IaInRwIocWv4fkRMUzCI?=
 =?us-ascii?Q?BF9utdFTqhjUas1xNwPrBdJ3KhNrXKsbKpryprMjReOAoOFpwvpbTvHtUex5?=
 =?us-ascii?Q?KVLkAbfsQ7e8I0h2ZZhdg4SPBlZwmsRsAuzB/IrhMGNaIfhT4ZOijJCxl6ts?=
 =?us-ascii?Q?OMtUsRYvohBV+UVFE+o4Iev0Vms6jgiMvHhz86Q3U64ceGySsqdIIVn9NhWl?=
 =?us-ascii?Q?HUrS5jvu/JZP76G7/VwMSlMD8jGE8VIuPpYSJhu9xFmnYJmOKhYlhw0ZCunJ?=
 =?us-ascii?Q?fVO2pqPBA57W3exWsH8OWWrNUhstbGskQcYvhiZGPUNXyx++5tPZRDh3xdXV?=
 =?us-ascii?Q?niPQXN3XrH+PBo8BH2RGOs9fCf+VJ0C1WW/gMrBw0RgenExX2YuKJm1fRYhT?=
 =?us-ascii?Q?eqBiEM2PAE0rYWo6byGkGImpGTIND0SGqeZ9p8fNMRiDjUlyiKKH/qAvAxDl?=
 =?us-ascii?Q?cytQqU1cZL2i6QrSg3jSMxKDvrhWkazNVb9V5V5/AI/Ir8g33ClmYLhSRygt?=
 =?us-ascii?Q?hnn4tQlliY286HHZPRp8qEVhqu5lx/GWPpj9CtD6UBUCwjW4c8KStmR5kEvn?=
 =?us-ascii?Q?VtUr9M+vSEpFQ6uW361AMwynidDjY8BLHIeNlIAOjDmznig3upL0iUDIqpuG?=
 =?us-ascii?Q?xRP0V9TJHoDblfWxqw/11nGGM0BG79fYkbxtW0d1z2oVUQMeuHIH7u3QG/UE?=
 =?us-ascii?Q?r4JV9AkOk9D4LAxA+5QBCKif8o29ClTicGqETLDkFmIz1Y70W2KhzFh/ZiFP?=
 =?us-ascii?Q?Nl+8aOhE/3Q5jwfiPa5K7TySc/nguUUqPZwWZJKJJZK6GrYeZ3VQ3nUrbOr0?=
 =?us-ascii?Q?dBP5t0S8bC3+TNDDp2LBN+Z5ZOzLXKv1jbWPWyUzYxi4voIYl8SWWIYCQjys?=
 =?us-ascii?Q?pJBf/Ypea5E09tAgWFnKgr3bJBDmuZT8ZGBos4kZAJya/zN6zb7ugdtKEMYH?=
 =?us-ascii?Q?Qu6E+MbaP83E8yvVecD6lzYE+BKlZ/t6GrDiAizdKqsPQdYpTa2Qhk+keBU/?=
 =?us-ascii?Q?3UecCoZYs79IQ6fxG4I7j4mHHRzlMRtZ16i2DbPlP9R3Y34yrnOs4gLORYqv?=
 =?us-ascii?Q?JPWO+MFIjtXuiaYDdvX3Q3kiyUJpWdHQnAHw24NlyYMSrioZVNJCXFu/7EF0?=
 =?us-ascii?Q?4UDlgrx9G7FGVZsHAw+U1CTt8WgBG1IKLtCCnrr15n0uHFq3bOCERI38qgH4?=
 =?us-ascii?Q?RGcPEptrHmWUidM/hRz7CbZdBdLNYehqDBoujbpkuOxE5U/9xLanqFX3q3nJ?=
 =?us-ascii?Q?40C487l7zbJdIK7RRhOGvECGcLjeaWbmUZycKXonsktLlqQGDb4gwLgZKLtJ?=
 =?us-ascii?Q?7J7jkJiXIYKJBYS4pT0cZxI3Kzuc0XrPXSSgg8L/NWE9NYyQqYZJIkoME18z?=
 =?us-ascii?Q?lpAaVC7Da6nqNBp6G010tSrkPuTW8mnBA0UGAEZ1Q55hZnpUmSjrEZTxnAUh?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 135b2486-9321-40a7-0b19-08ddd4b8eab5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 07:14:43.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUbSLCfFEqUw0CmWPXCbAc/B1nH5U206ZSSOB2OxKXtryCUnpeNSoJ6sfYo1dlYY44mVpUYopIebJMEU0zWIpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7875
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

On Wed, Aug 06, 2025 at 12:25:03PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-08-2025 03:36, Matthew Brost wrote:
> > This is not yet supported, forcefully disable by setting pat_index to
> > zero for CPU address mirror VMAs.
> > 
> > v2:
> >   - Use XE_CACHE_WB (Auld)
> >   - Only modify pat_index if compressed (Himal)
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pat.c | 10 ++++++++++
> >   drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
> >   drivers/gpu/drm/xe/xe_vm.c  |  7 ++++++-
> >   3 files changed, 26 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index 2e7cb99ae87a..ac1767c812aa 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -154,6 +154,16 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
> >   static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
> >   static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
> > +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index)
> > +{
> > +	WARN_ON(pat_index >= xe->pat.n_entries);
> > +
> > +	if (xe->pat.table != xe2_pat_table)
> > +		return false;
> > +
> > +	return xe->pat.table[pat_index].value & XE2_COMP_EN;
> > +}
> > +
> >   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
> >   {
> >   	WARN_ON(pat_index >= xe->pat.n_entries);
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > index fa0dfbe525cd..8be2856a73af 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -58,4 +58,14 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> >    */
> >   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
> > +/**
> > + * xe_pat_index_get_comp_mode() = Extract the compression mode for the given
> > + * pat_index.
> > + * @xe: xe device
> > + * @pat_index: The pat_index to query
> > + *
> > + * Return: True if pat_index is compressed, False otherwise
> > + */
> > +bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index);
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 432ea325677d..83f507ea7f30 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2362,7 +2362,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >   			op->map.is_cpu_addr_mirror = flags &
> >   				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> >   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > -			op->map.pat_index = pat_index;
> > +			/* XXX: We don't support SVM + compression yet */
> > +			if (op->map.is_cpu_addr_mirror &&
> > +			    xe_pat_index_get_comp_mode(vm->xe, pat_index))
> > +				op->map.pat_index = vm->xe->pat.idx[XE_CACHE_WB];
> > +			else
> > +				op->map.pat_index = pat_index;
> 
> A warn to let user now compression pat is not supported for
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR and kernel is sanitizing it ?
> 

Or do we just nack this at the IOCTL? We have already upstreamed this
uAPI so unsure if that is possible or if that is desired considering we
will likely enable this support at some point. Let's see the maintainers
think? If the code is left as is, I agree a debug/warning message would
be a good idea.

Matt

> >   			op->map.invalidate_on_bind =
> >   				__xe_vm_needs_clear_scratch_pages(vm, flags);
> >   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> 
