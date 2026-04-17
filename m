Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B49F99C6A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 21:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1AA10EAA1;
	Fri, 17 Apr 2026 21:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cv+UqWPt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014B10EAA1
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776461563; x=1807997563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ohHqUYkrrW6ItcJMfnwAGUCVnLEPzy56TrON6CfROj8=;
 b=Cv+UqWPtfc2ebjlMFf+2PFJwRuDhVTwhyyK6bNh5hLYoBNZsbSEjDaEh
 paG9EYQHejsFlFpH0C5FQ8p3WICPJZKIByXiQMVQ+CJGmJHfGP3ZIQd8I
 3PaeBeSIz/og7yrb9S03EiUWAFrz5/Ia3UlTVUzy0jqS0ODDKTgDu2t0q
 GC93qY5FOLcIaYAVF1fTkhiJA15A5HLNp5PQJmpmHKNoWcu4FIEoBByrC
 GdDO8bZ7Tu2nXjuDEN9j0yIP73dEftdg2Bjz4PqzhabZBjnUpzax6cjn4
 slXh/PRe/AfEc5igN2bL673fEB5R4rJuULxlYayLDZQThmzhXsdLrN6PS A==;
X-CSE-ConnectionGUID: CYV4RxHDSlOL3hGqU8EgHQ==
X-CSE-MsgGUID: qhhcpGqsQce/Vw2X9Oqdgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77554784"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="77554784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:32:42 -0700
X-CSE-ConnectionGUID: 9EI8WAR0S9yo6jxHaLI2kg==
X-CSE-MsgGUID: H/qNYM70TCW1wI5FdLMLuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208";a="226467179"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 14:32:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 14:32:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 14:32:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 14:32:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLpLU0SLnCFQYW2kIP7XNZz0cTU7m88myvXJIx03APNVuLl+iZJQrdlSjFbliQOpV7J4j1izEjhqtZOByIOX8fTxbp6eNQ52OL1s5A9m5zL5SfQevwBCvpaVQC7y5bM53w58nNgDxRJ+4+8cVTbXhQkG31aD8FFTlUl3zt5UXbaDCSnaenReFqzTigPBZn//XUVtqL9Ga9KQSe5Ajb5lPSjyuOrafXj+MigLijWKC1A5QSVw5GjDnceUhFFbghq2iaUCrBPZF1Coj8zg2FS9JRODUvtFE+Lct3ijjRZwruOfr7bRx3L0eUHMAKaXdxL5KFlHj+zzSo+B20y5pTCxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4qGEJCsmAi+KcyVzUpx+8uW/dc0VwxklZx/o2w5OH8=;
 b=UhbniyArX/RV7sIXi3XfG9HqHEJjFEPZEvp5nAViaPbCEjzMCXNOSShn992C1GNeSOY2iPhVZRk6perUq1uKdX7Uii2mzew2y0N6gbxDAumicamNvB85qSlTddY20Qb2JFw/gLB5hzf+5u91EWVnh7PeEr7lnXZHxuT6/TKigXzFqe6YtiRCMmSxuccYJ5TAy6zB/aorMhu2mkwSn9JyQc1E8vc9SlyU/E+9l2tPPKSuLujEg3fS//KdasBFW+QFJsiUl/zMrTnx+zzXpY3BmF3ObQ3IjTps+h7otfl/nxcZxCxS70lqYmsVFnbB+Kb+L6BrBJgkdEEmvnOrSndWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB9725.namprd11.prod.outlook.com (2603:10b6:510:396::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 21:32:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 21:32:37 +0000
Date: Fri, 17 Apr 2026 14:32:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH v4 06/13] drm/xe/xe_ras: Add basic structures and
 commands for uncorrectable errors
Message-ID: <20260417213235.GG7476@mdroper-desk1.amr.corp.intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-21-riana.tauro@intel.com>
 <20260417173854.GE7476@mdroper-desk1.amr.corp.intel.com>
 <SJ2PR11MB76194CE5B11F52874CA88CAB8C202@SJ2PR11MB7619.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB76194CE5B11F52874CA88CAB8C202@SJ2PR11MB7619.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: 83db2653-a604-4a38-0aa4-08de9cc8d8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: nRxJUebeDE4ES/xbcCGaI4oFZmcbVCk2NOhsYTwrwxjXt6CrdTO8ijTzyjcc5zdEnUNzezYjLlSGLPR0oo3OFTiIPQFSPYJT4HyYtdHiyVG1JCo9kSM/CVBuYRwjCRWQDrgGf4vGZF71QxkUopWG2mDYaZn2zhX69iQCeOL2As8VHxdopYLjJc4oQqFq+UOwGpMDOAGhG3p/Y/5WBfR7vbIKFHD6Ti1XonIAajefM7+pkfcIPtU2SNfdvVoRgfmWnx5uGCBl2ubsZJKDbgWmys5picgkdMVoVMYuSrveQKIYl6lV6sZLJVcnewPKGjarBFFnOkFZZjpTFxeqOTOHffUhM/Y4CaGFUY/IerWnzPDUQJNQGU2VeTtPPBiqf7ZSSPxd/IFytNL5TWKY24JrCp9hDRKxNXB4z6tXwv3WK6WAD13G/wpvfQQ+m7aqJ4go5JpQA8N+333FI6zthi5xGd18H6v1+Uw2CyvFZqYg4m0OS7lER5XouNW1kBija5VyDOiIQJsbkPBd0RKP1OtWH2RhtlD7vi4JpvrH3rvTqwoJG3qCbotyiwO5jEEoipXcKlylBBTHd4eiiUZoBkdhrP66Bc/5VKV7wfOKniJCZqMfJx8gGNiVwCwP7L7S/PByOt944Er2bxFXuoE5fUEos+UGXDF71hxQbaX/h1i4Ta8mhSVgoiimrpvsPFIAvqsHelM3UBfmOvF0txejklWtAxB34znlwMysz4RX+VT585QDISqbNQUBybWikqAliGir
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xFkYac7lEIM6/5J5LfNWak3bwrnv6MuOR+8DX1KfMJFbqRawtBu0cfvmuItT?=
 =?us-ascii?Q?x8gGqMzYkuoqnXWV5MU4YJ58bz8EWTlq9Yqh30LqXDemo3PYPrVqgelzVkMZ?=
 =?us-ascii?Q?HvQSIuiY048/lvB9JuaDY/81AzIhDlgVZ71i36Wry3xGRWZb4bzt8lx7wehw?=
 =?us-ascii?Q?dOYMEERah7QTK4tO/YxYiYCOJBe+BOaaBo6+yqFAPrusM3QEJp9MFZS7aPsP?=
 =?us-ascii?Q?pwe8PN3GpevDrJMQZYVUGsscQ/okIE+veBBeFdvFg+GGTOGzUCwj4XMwppLq?=
 =?us-ascii?Q?09vUOkopuLb39nsxXk1igVv2En4mn8uvYtgj2X9yqcsbMJNriS8AYF8pSvVB?=
 =?us-ascii?Q?SVJQpPC8COvaRs6ukTDGD8Jjf/K7RZu7us6c1ap1mcaLl0i+IOqYyJPQ47Pm?=
 =?us-ascii?Q?UZOzW2yb9XUVLcrt9hTkIp8C4kD/ySBKEAleLfgvRMWpsuZLqHKZOHYQTQwZ?=
 =?us-ascii?Q?3uYu3FWzL7zkpDpNPsbhzKPVx44eE+9B3FdvYZg13vWztiDLBx03c8rldQ+s?=
 =?us-ascii?Q?LV9vyIR53+sfmTIID6lR5nZHyzr9kr+BNgBJ042NB6KoTEEn1wc1uk6WrZB+?=
 =?us-ascii?Q?bim/8yMPV19gqbiVDc++Zwud850HsfCern4ZZstmiB8+i3l89lPP06OnQIl4?=
 =?us-ascii?Q?Q4QBJrrWlKM1BRLTEKdMV+xeILsmFK5Tqu5Vf5sjCn4SNmjnP8kDvFBzBXa3?=
 =?us-ascii?Q?5EFVatEdZZ+YJn6kM3552/KNMHQZvkwpOUO/6/hLe8tTGq6rjUYhARTYY0mI?=
 =?us-ascii?Q?nCD7CY1mUK0xLuTI49DL7bZiNX3qfv4tK/CUOSGhoIEknAcS5W0JAdAw8i/d?=
 =?us-ascii?Q?p3cpnr2AV4ZI5YvoaEtowJmVv2i75m1EYykPjUvZGu2pMmQb17MDUlj563PG?=
 =?us-ascii?Q?MssZPFZek1wRI7cnxaifQhi58pxYSXQygVNX0v9PvSnAHfo4epnUNWXuerqg?=
 =?us-ascii?Q?NWj+EvYhUBYl9bnPrAJSi6FZEcLM0Ep+2Z6jWzPAe9PIpuyIDsSQ3MOgNtpU?=
 =?us-ascii?Q?tp7RK1jht0tLVnWAb92T9eqaBOO2FiURnjAEF13zjqT+LMWiQw3B0ECdgXJy?=
 =?us-ascii?Q?vci9VCvxcFXaKnVEh8nMtShMoBmz/SF8sNt6ctwHmCJDOTn7njpEwfS0psBc?=
 =?us-ascii?Q?qR1PKxW5K1m/7lt4knoVElWX3B7GjYJnxHH0esOWPGxJLJwnxH62bCNu83+R?=
 =?us-ascii?Q?bc+FHDK1UXxRJIV7rz6BVnOCm7Nv7u3XWEeBUAWvoJnyWQmecGQmuDKpx7AT?=
 =?us-ascii?Q?YDGWj7D3ytk6TINRKDzdGMnMo/Bf/kmd4XGAUZqMI6uaitgcRmweQ9KehSvU?=
 =?us-ascii?Q?W8LEueVj7D1NMm7HGpTc38SPxu3AIavpbSwNtMekCzjzyfXycZdJ/pTEdChW?=
 =?us-ascii?Q?G/7osn0e+sydxl0+U5fnuS9GhQCNQ72OB8BikuuGirgCK94rRSuTf4vksXVk?=
 =?us-ascii?Q?67Wy2JI7nIvbmBrvKJYCpn2hjaNlYteZmUPYoW0hnBXEzsULAwIamwOhz/xN?=
 =?us-ascii?Q?QEgb6szeal0B+v3H7gpBfXeP8Sob+ygB18p2HzpDqoXAsJpJZL0mZhOoKInI?=
 =?us-ascii?Q?fw5vZ7/Nm/4tSidP3ACfaRAQR2ncl0i2mXrcYHvrhcQdZ/vvAHjSgmZe13aX?=
 =?us-ascii?Q?Bf+8iE0i/tcrQ/vSmzeaa3RAwhTofhyIR2CbQFpwYa2mJxeaLE0zEe/hhYKP?=
 =?us-ascii?Q?ONBH02xq8ewwWD7/farcXxj7zhSybIc3Tsrd4W+zxafHQmkz21KKZYMcyP/b?=
 =?us-ascii?Q?bOBI8vl97Yty7C3bp9ZhV7ejot9WzGQ=3D?=
X-Exchange-RoutingPolicyChecked: rKnTfcaaQG1PiXnS/La1PBVQwEFrMR6x19uMRRKyK4UPwsRLVOTv7auXMYKwxeKynLZ0aonoGo/FuXW3p/y6aioQ2Hi1LAAtvvWl7elR/CZcBLNJOsD8yQ1wm5EUjpSeTxMR51HfoxfVpyetmfflAwEL03pvR7gHIurtQh1SVPwz905ua90NajJJVmR7/+wNvfRIjUiK1rvl/U0vWWQHeFhkks/GGPiw02oknPJKpnfCJ+6UvXfLijkY9QbWFbK1ZSsWtGk77SyxBiWrPrYO2J1a2ikUueaBhBEgQWgfodM0Qk0dN2mGppQEsfD+u/tH5INZD+i8Kl4xHb4UQqwydQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83db2653-a604-4a38-0aa4-08de9cc8d8b3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 21:32:37.7474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3Xi15BF/MK391jepXv0mRBV7I4dRl/kQmSEL+mDB+c3g5lt/T7ZWcYkcyobfKzXl+ffHKyxN21aLZU27uPPvHIOTi+E9SRrhIySsXwvGjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9725
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

On Fri, Apr 17, 2026 at 02:25:28PM -0700, Jadav, Raag wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > On Fri, Apr 17, 2026 at 02:28:18PM +0530, Riana Tauro wrote:
> > > Add the commands and common structures for the get_soc_error
> > > sysctrl command.
> 
> ...
> 
> > > +/* Severity classification of detected errors */
> > > +enum xe_ras_severity {
> > > +	XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
> > > +	XE_RAS_SEVERITY_CORRECTABLE,
> > > +	XE_RAS_SEVERITY_UNCORRECTABLE,
> > > +	XE_RAS_SEVERITY_INFORMATIONAL,
> > > +	XE_RAS_SEVERITY_MAX
> > > +};
> > 
> > Drive-by comment:  I notice that there's a fair amount of common changes
> > between this uncorrectable series and Raag's correctable series, e.g.,
> > https://lore.kernel.org/all/20260410102744.427150-4-raag.jadav@intel.com/
> > However it seems that there have been some minor style differences
> > between the two that would be good to reconcile (e.g., this series
> > writes out the full XE_RAS_SEVERITY_*, XE_RAS_COMPONENT_*, etc.
> > whereas
> > Raag's series uses slightly shorter XE_RAS_SEV_*, XE_RAS_COMP_*, etc.
> > names).  Similar differences exist on some of the functions like
> > severity_to_string (taking both the device and the severity) here vs
> > sev_to_string (taking only the serverity) in the other series.
> > 
> > We should probably figure out which form we actually want to go with so
> > that we don't have last-minute conflicts as we start applying these
> > series.
> 
> The one's in my series are consistent with uapi, but I'm okay with
> either one. My only concern is that we don't invent overly long names
> that warrant ugly wrapping while using them in the code.

Yeah, I don't have any strong feelings one way or the other.  But if I
want to apply both your series and Riana's series to the same branch for
tracking or testing, I'm left uncertain which series I should favor on
the conflict resolutions.  It would be good if we could come to a
decision early just so the two series don't drift apart.

Are we expecting one of these series to land before the other, or do
expect both RAS sets to land together?


Matt

> 
> Raag
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
