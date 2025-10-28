Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C12CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 14:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBEA10E403;
	Tue, 28 Oct 2025 14:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Im2HyvJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F184A10E403
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761660175; x=1793196175;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ee1RxSh0p0DmGV10ei4lyUl4N+X4qGClt+RlwwJhTKc=;
 b=Im2HyvJ7WNXevr0AGFekkJVzH0Am8SNsMdXUoPtgAO8uV3tDW7sSOYXE
 pNDrcPW5CO6NO0uSu0Rlnw+5hlTRqp8L5SxStY+FKQKjwkqQIi7FGZBua
 jDTs5lFO/pvvcIRY7nYUtoQz8PO9XNtBI1G3r8KRNzzQ7iZTNbbo65RC0
 95r8JV8vo8XkU1rvv/3/auM0EwgbKkyy9PZ6fysGou3oxw/N0gR4JJPb+
 MjtvTJ4Q7JwMYst+Iz1I1NRpfjlvqmJlCJcnd9an97qL0qyCzGRS6Z5Wt
 abu8eaMP8AFV3JT2baW607uWjMcutX+sECKG5pnchU36oQDQE1nbqekA4 g==;
X-CSE-ConnectionGUID: 9/to7ftaQNC1/HVoj/w+zQ==
X-CSE-MsgGUID: xrVNnmyUSH2QtPRxFnmHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62789562"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62789562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:02:55 -0700
X-CSE-ConnectionGUID: LHfu7NcqShGPSbi20eH1Aw==
X-CSE-MsgGUID: H6uZjKrCS+SQrseL3qUOSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="186102696"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:02:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 07:02:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 07:02:54 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 07:02:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikstUrzKHM8INv2UkFkytQP2mdVmTq585w/tUk7GQBTCWEOFG7Ki9EYYiYuh9/11T345jGvI1iAh5B892iuGLsf0THRE0snlvDs2/l5qp+Z+ckjslJFxNXj6vmHijY5PYTkJWDJuFopjj+DFK/ayFbAzyV0fl1+Er93JUNQrwz9cjUY4Oz/lZRAkTHXIofrAfHZyNZVgemASO9TedTbP3IkDr9LuLc+Ldgo7PnSgmhMgj8vrra8rxvVEW6odDp0nqgT4gxDv6FS5SsKJnBKQiNmfvpx3lFffe5kUQON7vFjz5GXSWNJNo7wohycT4Oi0PA54vX7QKk7BgrCQrEEeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tc6BDYfAw5xBe54zGqzJAdp6VAD5vvVyPnnLqPMpcBQ=;
 b=fNKcUMaeeWhhI66fNtbDG7RncRQn2vSGiTNHZLK5NpUN3VEXpdmCBkYselB2yAO2/9jnQ39OuMy4sRTnHds21buIRRIbZ9CNtOztfgkon9znvLlp3zKuTl226mxFtwL7cVwh9BERSzR1ydJUYJyRBo6WxYmDTR/N8zD6qIC28zPzb7ZJMMimjAAqBLmJFs6n7B8YbRUmB71X15RdSAh3Pj/7ZT60pOZUa6MXYr6Soz3CTGsfYgKSe2txT85kf0AYMa8qcV450xnbl0aO6f1ZcsKfvLyJ3qSkePxLTXoakCqwK0UnAWWvGDAeu9uAvb7NuojlscATLJylbXymorKeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 14:02:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 14:02:50 +0000
Date: Tue, 28 Oct 2025 10:02:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQDNBR28h6o1hM4O@intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: b823933a-eef4-4e8a-ae4c-08de162aae7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GI1rxgCeyuI9uKunb5NI/7Yh09ih+bAsyEAEdpatRUGT/z8p735gDJByATWV?=
 =?us-ascii?Q?uYRbKEdVX5MOKdM4GLhbU+aSYgJj0dIHWfWODv/3qkX3OWADMMz9s2yl+Ky7?=
 =?us-ascii?Q?4zbLJ6wz2VWgmD/SBCzzgoiPLJWehuOBwac+zIvRAwIJ8HYWQ9IxiwMV+/L/?=
 =?us-ascii?Q?9UIdzym6GQlcvu8r6PIZtyCIfHoNuFfO4RT8RCM0XyK4YRqv2QxS8SO2ES4Y?=
 =?us-ascii?Q?AxIM2JopI7Can69TZKh8SZShnjtQVgqCGRKDlJWBvR0ecHeoRprN9rDZ+rC8?=
 =?us-ascii?Q?L4mAtCy6/WMAkCYUQEp9W70dg2RnDibjzYyzgnSWYl++ZscrHP0VeSJADbyz?=
 =?us-ascii?Q?JiR732mEqYlRHzWc/pVeu6d3VlMyxPLSpcJlE/h/ITsdXrJRcr76KDiM7me8?=
 =?us-ascii?Q?646pPl7IWoUaTMsP3HlXJreAPsV62A5Cd1CsI+eW+C/lPOrfRf55erYa8Bt8?=
 =?us-ascii?Q?CkSHY3XCoJhZ3J604lZIs28MPJV5eohNsfz7Ok1b4UXN092ppSZLwUOc97dh?=
 =?us-ascii?Q?aZTjcOgf1tyujDmwv/4paaQExzwnbNEgeOTgCAUubUb2fDCQ2AeUt/TksYF2?=
 =?us-ascii?Q?QJaBko+VORZd5k4JXQ3kRAM6AlDVpJpLB9JQ3OESV6MMn3Te8wYxPn0Qatyw?=
 =?us-ascii?Q?FLYtD1QkW1QPddQEQwvMLYKkwr0Qi0gGD0fmfYnIL4k/xfqDLIw1QhN+UL3Y?=
 =?us-ascii?Q?woliCmgCXaUOXOEZ9+1wr9rE8cMJ5qUtLjb2WYzi+HBK1eAxA7ZbbCWcr5JO?=
 =?us-ascii?Q?4DDfhFKO0ZKc103Iia+BRHeGeHsKgMN2G/L8ewXLk6rh8ryXJihhPkaHU2WK?=
 =?us-ascii?Q?Ql6BWiNNBCV6y30efTcY4uSL0gYB3nFOmlfz/a/ohWur2L8xVegbnJM60h8W?=
 =?us-ascii?Q?F/BQnqxXoDS37eIalOQ2P4yXlD5lY+sNUZ0Feaxy3x0HL9Z+x9Uj2mftbQv0?=
 =?us-ascii?Q?DtJ3e0Qh0Q3/87fAaVBfszo0q6NjR8cd4Bn4LvmWdmpHMs/2elWeoLGD1C3z?=
 =?us-ascii?Q?WTXgJ/QafFarrQ59H2a2GzsewpFFSJAMB6YT8apjoK45xzFOOJmn6VTZfYM9?=
 =?us-ascii?Q?KbgHlYeQKSCB2iAW3y6Iw9TBBlqxiUdBL1VrRc4JAg6BYn+ol3jQHp1FVKcW?=
 =?us-ascii?Q?3/d+L6cW+7jLWptEQAi1DN06ymtfEV0Rb6XyFL2ScWhC+oIHFEtZv6azwMi8?=
 =?us-ascii?Q?Oa+Ao+ZmxJAoV1fVkI7r2BIP0yL7SwXSeTxAnpawj4WIR62JQbVrsk/6mlCX?=
 =?us-ascii?Q?9tkKDYopof81+ITHR3wYO+b/+BcRwRMYhkgvSm6L8/LNqG6EBWekhexCxrWz?=
 =?us-ascii?Q?LhSNTttWR93zYwMNo2SGFo8+nRSHYm9kLKiGGbSSFI+eCjUvD8wVGV0xBlSi?=
 =?us-ascii?Q?17Os6J5VsZqH5pkKI7Orb+Lh/f8NUkxUq3lPxQuIcQltvXm46pNAujw+GvIj?=
 =?us-ascii?Q?H9tPEdjL3IR8Nh3XQdqZm2QbIVb6nUNgnKHdFpQh1lXoVZ6axXKSfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UsgXUSwCRCzWFCttszHROjpOsy3WDpwHxU6Tb9n2VQA8YGPtUvtdg2+lG7JU?=
 =?us-ascii?Q?4aDxUkAMQW+h/IKAkbggU8ORCyPWsAX1Ny/T+zqcLz8wUYHpKxEhJI83ZNMC?=
 =?us-ascii?Q?6teMYSnXeGPoI0xVhU1+3fBz9BbhfWvYtym915vGL+X37VIkJM9DxnJ/XwlC?=
 =?us-ascii?Q?i63VedglXB7yVMRQ6WhQUY7dugL13oaj9KvGkO7WqhdQUppmAQrKM7hFLuMX?=
 =?us-ascii?Q?JpSPvEos8VZHHFm+DMIeJZ2KToTRb2EMYkL7HeLHuI48M73ebJ8VGaAyofHJ?=
 =?us-ascii?Q?tNAkHai+tk5W4Xh1zwXQiI72U5myNpyH4Y/k1WVDyFWrYaAk+J8MPQkN4uEt?=
 =?us-ascii?Q?ybzlB1PK8AZFgOEP+YXxjx1oXCoeOxl9Ei1bVlyY8A+eDbEn3F6ofmGFwcTa?=
 =?us-ascii?Q?UzBfCSFZEe9f6zHxFiI1oMmWQvYEVQFMREX8lHhJnYS3j/htU2suTQhOFqDl?=
 =?us-ascii?Q?Mixte+jI2R2mo8CEmjCqKwcafBrSNS7GBSZRGhZFVtrCgPYpyqoVpwtSc+Vm?=
 =?us-ascii?Q?2nN8L29w0zNr2Xxy4anatZ48eA4kzO6WFVJM620+DKXTkPy7WWsI06l94ZLP?=
 =?us-ascii?Q?QzGAGTF1wehc0hBC7iTY/RnhK1oMCqKM2Yt8GUlwHjqvGzeQrRgpGBwthvNO?=
 =?us-ascii?Q?tl86O80sYBdbG03rRv4ewGGrhqFuzJpZb6FKZ2CNhek5UqpMHsUbn+zAnzBd?=
 =?us-ascii?Q?C/q7UmjDTgXGuVqyteJpJOJusPdzRkJvFqdRXuEbp3ihhjBbLJEy4Whc25Ml?=
 =?us-ascii?Q?rC5LzlEpJ2hgg9HkP0eCdCUl5vQahmV7XowQ/XzeQgbnTy8LwtPgnQOqZzKV?=
 =?us-ascii?Q?6rU2bFif7CrCEjDC5J9bWyiQLb39iZ6pjq+ccBhUh6+mcbhCNFpHV9HxWntU?=
 =?us-ascii?Q?vTgKkUy3fppHzqiNnpnN28LW2/aNoYXwhcoVEUgZwZHX2AjiAuzP1T3aPx5U?=
 =?us-ascii?Q?iV9onGcfCq9mM14rOQowRykSv9bk3WGiuPrPhcFofYzgp/Ee8F71D6iazE9b?=
 =?us-ascii?Q?uNP4d7C5smbSPvYfcsqXCyAO6phjnR4XWY3J/fumBqBsfojn/TwPhxFwK72P?=
 =?us-ascii?Q?yH8rayYqWFb3me1hU/at8Vdk55Aw6l71HPkFVBfrRv/Rt+ZTxAzdVno4oNL+?=
 =?us-ascii?Q?Bfqc9vxQmkiP51fgo7dqo+o+GmfsofVtYetq4U2khfGABeTYoa+7HfhyLAj0?=
 =?us-ascii?Q?1qKEcC5DI5OKx+EjAQz3y2BLtkdoERkyo/Cx56CehXyMYx1Wxsnbj6iik+KK?=
 =?us-ascii?Q?YIqh8AkHlO3MiVPH6XIN3HbnxvHpSYInP8NNyN12QnwrSuhLkz3kvdrYlhXf?=
 =?us-ascii?Q?e4oyoPLIHt6SWHDj92cR+UxI4MoNK8/Y4NCh58WQ77FNir2B5F7pRXnfC1fM?=
 =?us-ascii?Q?8uc2MPnWTz/xTQbX1SdHh/3o8kxwx5rbrPiiIWsrWaejgF9uCKGsx/AQ6GaH?=
 =?us-ascii?Q?2eAhmLjN4UVa1YbZTHWNMez8PMAqQoujw9nK7h0yD++Cey7D8vX4LjJDDJ3h?=
 =?us-ascii?Q?H1rhsSliL964sENMwHLISZVLu+CumVJCKVZAYcos73Ps4cyoJLAUuZfvF+gH?=
 =?us-ascii?Q?geRvvP6ct4+IIiICO12Sar8jASg/+z2ppTxYYGWp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b823933a-eef4-4e8a-ae4c-08de162aae7f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:02:50.7671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5QrMuu7iFTqxlIPDfKWlCIeC4UeAH7S3Nbwt4HJRCvlsU8XKBl3n6SfVW8NNiEBTOubMbCeyJSPRKsQ8mj5+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
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

On Sun, Oct 26, 2025 at 10:57:20PM -0700, Lucas De Marchi wrote:
> It's currently not possible to safely monitor if there's throttling
> happening and what are the reasons. The approach of reading the status
> and then reading the reasons is not reliable as by the time sysadmin
> reads the reason, the throttling could not be happening anymore.
> 
> Previous tentative to fix that[1] was breaking the ABI and potentially
> sysadmin's scripts. This takes a different approach of adding and
> documenting the additional attribute. It's still valuable, though
> redundant, to provide the simpler 0/1 interface.
> 
> In order to avoid userspace knowledge on the bitmask meaning and to be
> able to maintain the kernel side in sync with possible changes in
> future, just walk the attribute group and check what are the masks that
> match the value read.
> 
> [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> 
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_throttle.c | 46 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index fa7068aac3344..fd2988dacbbb6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -22,9 +22,15 @@
>   * Their availability depend on the platform and some may not be visible if that
>   * reason is not available.
>   *
> + * The ``status_reasons`` attribute can be used by sysadmin monitoring all
> + * possible reasons for throttling and reporting them. It's preferred over
> + * monitoring ``status`` and then reading the reason both for simplicity and to
> + * avoid TOCTOU.

Perhaps add something like: TOCTOU (time-of-check to time-of-use).

> + *
>   * The following attributes are available on Crescent Island platform:
>   *
> - * - ``status``: Overall throttle status
> + * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
> + * - ``status_reasons``: All reasons causing throttling separated by newline.
>   * - ``reason_pl1``: package PL1
>   * - ``reason_pl2``: package PL2
>   * - ``reason_pl4``: package PL4
> @@ -43,7 +49,8 @@
>   *
>   * Other platforms support the following reasons:
>   *
> - * - ``status``: Overall status
> + * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
> + * - ``status_reasons``: All reasons causing throttling separated by newline.
>   * - ``reason_pl1``: package PL1
>   * - ``reason_pl2``: package PL2
>   * - ``reason_pl4``: package PL4, Iccmax etc.
> @@ -111,12 +118,45 @@ static ssize_t reason_show(struct kobject *kobj,
>  	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ta->mask));
>  }
>  
> +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
> +
> +static ssize_t status_reasons_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buff)
> +{
> +	struct xe_gt *gt = throttle_to_gt(kobj);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const struct attribute_group *group;
> +	struct attribute **pother;
> +	ssize_t ret = 0;
> +	u32 reasons;
> +
> +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> +	group = get_platform_throttle_group(xe);
> +
> +	for (pother = group->attrs; *pother; pother++) {
> +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> +
> +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> +			ret += sysfs_emit_at(buff, ret, "%s\n", (*pother)->name);

perhaps a space instead of the \n to keep only a single line?

> +	}
> +
> +	return ret;
> +}
> +
>  #define THROTTLE_ATTR_RO(name, _mask)				\
>  	struct throttle_attribute attr_##name =	{		\
>  		.attr = __ATTR(name, 0444, reason_show, NULL),	\
>  		.mask = _mask,					\
>  	}
>  
> +#define THROTTLE_ATTR_RO_FUNC(name, _mask, _show)		\
> +	struct throttle_attribute attr_##name =	{		\
> +		.attr = __ATTR(name, 0444, _show, NULL),	\
> +		.mask = _mask,					\
> +	}
> +
> +static THROTTLE_ATTR_RO_FUNC(status_reasons, 0, status_reasons_show);
>  static THROTTLE_ATTR_RO(status, U32_MAX);
>  static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
>  static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
> @@ -128,6 +168,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
>  static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
>  
>  static struct attribute *throttle_attrs[] = {
> +	&attr_status_reasons.attr.attr,
>  	&attr_status.attr.attr,
>  	&attr_reason_pl1.attr.attr,
>  	&attr_reason_pl2.attr.attr,
> @@ -153,6 +194,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
>  
>  static struct attribute *cri_throttle_attrs[] = {
>  	/* Common */
> +	&attr_status_reasons.attr.attr,
>  	&attr_status.attr.attr,
>  	&attr_reason_pl1.attr.attr,
>  	&attr_reason_pl2.attr.attr,
> 
> -- 
> 2.51.0
> 
