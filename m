Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D160BD31A09
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 03:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C9F10E002;
	Wed, 14 Jan 2026 03:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgZMlVeK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6CF10E002
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 03:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768362384; x=1799898384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eakvefajLCOhH3bYyjPuX9G3h+tXH36xV4D+jWuIEPI=;
 b=IgZMlVeKF+46eOP0FQdGA4/T2NK1+3o6YSp+GjC0NuHRKfDB3E9tCkfH
 pRuFdlcpXI8IPEwsOLuVTjX3KeiBHfeaO7d1Xy0hGqRSzq+1NHij390Ec
 Buf/YY82sUwAi+eS3KtpXbvz2obi5pzBOjSaRFAW2TeVcbCHQh2+Jn6Zc
 RNO9i+f9kS4dxDLzivE+ZaliIXpu58F3rYrjWNY9m6Gr20DYo72jGyO9k
 l/FTjZR1m/KXBDdTMYbatNgtAokjg8yJgA224jEtumnHCRG/Oxzv0ANaQ
 JsHAfh95XkIWAAkpj7DlOIABLTv21ahZyJLILkXp7BWkmFHYKGrzv+Nzb Q==;
X-CSE-ConnectionGUID: AcWggS31TzOJeQhNZSM+JA==
X-CSE-MsgGUID: 2HBTTay0TuCS5D/CBI8A8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87240425"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="87240425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:46:24 -0800
X-CSE-ConnectionGUID: dZVM2ZdJQgeyyJEscTBWdQ==
X-CSE-MsgGUID: 0dwpjHXcTTCI9VHXmyKvww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="203781734"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:46:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 19:46:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 19:46:23 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 19:46:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRsURKm75WNLowhthsVapowQh5iMAphbjmZh0nlNDQewSFCyW1cgzspwaLg/Jw/n4fXDgIAmpKF6ZxT90XktFKk0sNKezYYRA5e76Z3gkQR63/aCt2+o/1NdKkt9LNZZMlnsKHDAV41t21+mSjrs/TrnlfyDKFOMCpY8ejz0xj9EaJK0xCNUrG51OfN9Wwlzg4fX0IuZq2w6Ba3Zy1gupNMQqED2ViglJ4rBdp7hGx82W8eWE7/UnoV6JNH8lTa2GecYLdApEgFim7kIy05Z/5v2YS1GoURFpfPBqkt3z6nkdIxOl+TSyxUtcV11Acuax4AzlDhQDrpdmFrEfffi/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIS7mjds60JZvx3mFjsmHSXrBXMus/OpOqKs+5cL9lI=;
 b=f1OhHs/niZ/dU4N/ew63lOYjUd6hMcqJU3Ij6I/1JnrGR9WuVKqR9WC4ilXxxGhFhmSFq66U8TooB+4Of3VeUf1IT4ShQwLSD6Cyk0y/o4wxUh4GKYOxp25oasGXn/ws2dbmhdDpbdO1GNDZYWnhfZYMN98puWEBnnI2+T2i77zgaruqdMW7mifpoT0dxT5zcXpBfmy9SOrggIbJo4KCTybTHu5zDBSlpmw3ry3Bn5DXshi5CnrcMdChy9nuE3YguaQkvlXgHPgQF4RrpQwrpSiaLXXWXTiZBiOXPkZOeJt7UWWIJoZ5xRhtblEJud5VmabqGvjwuvPA1KZzRN/+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 03:46:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 03:46:21 +0000
Date: Tue, 13 Jan 2026 19:46:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/79] Cleanup unused headers reported by clangd
Message-ID: <aWcRi7SOBeZYQB/r@lstrano-desk.jf.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <aWbe/6D9Fvmg9rzi@lstrano-desk.jf.intel.com>
 <20260114003608.GF458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260114003608.GF458797@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9db011-1dc0-428a-45ca-08de531f7b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UWTaaLyJ5u6IRJvgndhUM5H+jzTMo6RKGwgSPPzvGU7nwQaKqYKQuuznDgbq?=
 =?us-ascii?Q?1lSMC+I39B7KRMKHK5n7fxa1hT4DB/LJo4KQmN+F1FOMo8zT7yKZs1+ZnfeU?=
 =?us-ascii?Q?lr/qot/cuUpN/nDyNSJps0jcOUQIUviUOiFKhsm0NAR5BJT5ucOYkgSdPz7w?=
 =?us-ascii?Q?wfs7y98Hmk1zapO/bOVo3KWmTmwyVbfqMnRaaGY3yMKyONNb3TeB0YuCwExn?=
 =?us-ascii?Q?BeKKPOPD+1UzycG5DjM9Jr/yOATzHMxcel8zCatm70n9H4cLsdKQmC6YhobO?=
 =?us-ascii?Q?C9F+DMhH1egxCHupyXIP7oAxW2yedeyjZLh2jAW3Fgzj/0nnXh/Y+GtdwMDq?=
 =?us-ascii?Q?J1a130+YGP9DR90PWuAUNldZZ0excodlABxX42MSCUcj9nJndyWCsDdF9ezA?=
 =?us-ascii?Q?ktKKdNuxEkMYI3Wc6ppIbPIxCKyzn7Y193hIAeypRCtMbYtD7YuhD5NDJVFP?=
 =?us-ascii?Q?TgZRGVWiEPwz8Yvx6lcleYzrge5NsRVYmYQF6S4efUBl9Jsl7iQsdrDICYAC?=
 =?us-ascii?Q?ivm8/l2HYSf4yH+6m7qweZnN+RXqNTBxcUf5koMG8bnuFqLBIBGKQoMiMfXn?=
 =?us-ascii?Q?NetLcUjgwmAiGNu97Xttt9zYjl6flTmPTVzu8EDGhXncw1De4VbxgDTthw8h?=
 =?us-ascii?Q?Qx/37BVbiZL43ianQTCv+wKZGvFkhm0a87Zzs0By+m/rKcKTknIZ4TdoH/a1?=
 =?us-ascii?Q?hYvMNj2ILEqVKOV4zfS3ojRZyxwmxHpo/IVmDck2v+YO2XBNvmUCJ3k7lteT?=
 =?us-ascii?Q?fCnyd+tlYEehbqRwBv/ui5vNQACbXTR1c8jReenOvAslofXi3TKU6oXV1ANT?=
 =?us-ascii?Q?K3Enpx0bjblSG+6+MVJJ6XQb3iLmcEkhm8xTh/0Vq5SZ4dhpdgfQpmnOsPgN?=
 =?us-ascii?Q?g3XN1G2ybqvExsGEa0U23ccjXLpZoROGPuLW+XJtoLox/q8O+e+x8o7wP3P+?=
 =?us-ascii?Q?hVwBEKkqVZbNX07fy0UWPH6ndy0ApnoqWkw40SRg2pBeJsxR3DgtcOYubwL6?=
 =?us-ascii?Q?rzOV1C/36b0UOAliiRR9VADTUmN7bPNUQ+45mQZOIaFZ9/14WHnH/urGXUHK?=
 =?us-ascii?Q?PnEhhjPItP3pmiDDFayx0k06wL/8zIErGK29zoU6q8ENx8KmQmG+muW9dwVh?=
 =?us-ascii?Q?RWH/syTs7kuEgWMMC2+C7v355MkiAb5gi4hLsJbwP+NM7l+hka1eVMM8aLjX?=
 =?us-ascii?Q?lafC8oLrdY5Ce2oQXMnFNIYp4s93MKCAPRTVU3qCPUBuyjfglVQB4oTR//Du?=
 =?us-ascii?Q?OYmQMZj3D/0MuRRS17WsqQDc2wIwot2JCiFJhhsjckErn+5DNnDKUTl8y7i3?=
 =?us-ascii?Q?dom3Oo55kP9Wt6uITUKKhM7E23d6kvlAgTTBshVTx40VpB7Qjz0nq/BiICR0?=
 =?us-ascii?Q?ikbf8HJLKxkYDhdHNXYdisyDYHhCrDKGdXAei087zBQtyvsSbg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HKib1dIdaTkz0vgJfoNXlx7r4vcCAa5ZlcdZv7iPt8+ZpuJEeKVhHIKrlES9?=
 =?us-ascii?Q?wWiIGnJeiiGiCUtmTyKdOzbmnQzChmENjQU9F0REC99JU4eyMXeRWIv9A/qo?=
 =?us-ascii?Q?KxbBJl+Mu5TLWtHEx6hrqCvgahOhKwUtIi4mKXEiEcl2nj/7BLeANEjg+/3l?=
 =?us-ascii?Q?EaqwCq5I1nRyE8lpTt8YYP4aFN2zxF+gH5rpwAxQODxmVfjlrmbpbVxxzLiu?=
 =?us-ascii?Q?/MMzjoPFfarTFwDbRvbyFtMLQbtR9HE4vn1k0S6DKlw+F2x5vQMqAb3hCLGR?=
 =?us-ascii?Q?P8RM2aX8KFcjL2SwznIP0ILWJXK26GaLw5rtApdsyRVTE2gKSXuIIqFMV7+T?=
 =?us-ascii?Q?WqdJzYqQOAA3x+Q8c3ilsuRwFKcBSFVdzyy5B7fqu8L1620Xgl0pX1VQy1hf?=
 =?us-ascii?Q?CS7D1pg138Jdsbok3Yb5ByZ5Wi36QBiyYclzFgiuCigmDAkyZ/JWaHZz/P8L?=
 =?us-ascii?Q?tTNQctv+UQ2zw8cBZic79AKGnPy64dOXdReaS6ZThlobxgXMLCKnCmBwrBGQ?=
 =?us-ascii?Q?oPI2LEXj4qMcJ/XchL4xfYWtI3s1DFU4ybLhqfa50+2ir1sbGqJJkdJA7WuB?=
 =?us-ascii?Q?DyY3h3+iARqong1Tpvx9hF8SGYAmq2HlTxo9giljBug3C47sOB+VuGP/6HaK?=
 =?us-ascii?Q?YvrnBiGHyRxKWBqEGos6xrKbR2ds7S2xkqRxbd2rrndfFDuxg1JVdWZ17SHm?=
 =?us-ascii?Q?2urCJmvkou1RU4Kz0ann5gIjQEjnj57riZ60mrLcG/DdLO3MpAqcGxjOgsi6?=
 =?us-ascii?Q?m/+LacdLwyZt/G74yv58/yHEIv8Me7draRDm9WA6nYHYLulmtR//6HGx3HRl?=
 =?us-ascii?Q?fVKp2XOOKCQJwrASq+kVbuQkt1LUQRqXMNUSNV+bkth+YUl2T/8JnmYMCZAG?=
 =?us-ascii?Q?gADbmIvG5m0XX+bDmxilYw7SYodEIycuuy/QKdV5+RX5HZU25jQGuPivIM69?=
 =?us-ascii?Q?8IpHZap3oaEIENgCGomkx1WKgHSCBu+sHiJJKmnMeGkcMDJQHzXgCr9xUbRQ?=
 =?us-ascii?Q?qjXf6WL/FEnbTU9R7vFiG94IHQMpGMXnU/3J1HB+ZxSxD2xmb10KRdGSeWoJ?=
 =?us-ascii?Q?/w+aDKFmIbjYrLA38j3khzqPljGB2GRtP1BdFuaAD2N9iqcfnQQdTsWPq8+d?=
 =?us-ascii?Q?cpEwR+i+eM3Zgw2AgZvHpoDvkzV3Wsl3Zy/UL3RZuy6b/4K+gThu7O2shArx?=
 =?us-ascii?Q?YJ+lJ1biKuQuAfgRMtAlk66BPYZYoe224j66FLH87eULmjpzGy0rdYo2a86g?=
 =?us-ascii?Q?o3rYq5f0H+YGIYdu/cfntAl+Sd2MRh6iA/1Fv12apfHdj7RhEa4AQ/Dznf00?=
 =?us-ascii?Q?kN3c1qXatxz+ysnFFXjMnls0lU3ua9jB3jyw5d9wuPxHVQ66ZR26gmpyWTTg?=
 =?us-ascii?Q?2kOKY0lZ3fyxDD5Ar/3XFPq1JYnV7f+7839/p1jK1IXN8F08D25JNPnUe2JJ?=
 =?us-ascii?Q?FxgdCOqzhndm0xRGF94pbn4ga4rQZtvcUwtyyCGskmzK0gtjl0D0LBHzvY24?=
 =?us-ascii?Q?gNAfEnjtLcdwR2Lig2+NngetpHcgZ4+yITBpx8GuqLCh2tN0nSinmNQa/BnP?=
 =?us-ascii?Q?wPBFOXkincoxOU4d/9sTflaI3L4PSTUDxN+Bh7+mlk+bOYdA9QHcgTv0af8K?=
 =?us-ascii?Q?OEGYrw3txUsxPZWJPqsHr4BnB+oSUega9URdLqi9yZr46wYd4hJWzBx1uao2?=
 =?us-ascii?Q?/Ua3XWe2Bzf5MG0lEg8Kcrh0vHHWz00jsWm1vFpxGv+9lMMpTAFNiXkpSR0/?=
 =?us-ascii?Q?Qdr+XjxbmM2mT+i2mPNH9u0IcBr5d/w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9db011-1dc0-428a-45ca-08de531f7b77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 03:46:21.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QB1R+7IaMVVP07+RGEakizlJH7zbiLWJ9YZTlIORARGIR1nN+wEa2RubQMFiU/J3E4rJMCij4DaRnRYMo4MuyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
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

On Tue, Jan 13, 2026 at 04:36:08PM -0800, Matt Roper wrote:
> On Tue, Jan 13, 2026 at 04:10:39PM -0800, Matthew Brost wrote:
> > On Tue, Jan 13, 2026 at 03:03:05PM -0800, Matt Roper wrote:
> > > clangd[1] helpfully flags #include's of headers that aren't being
> > > directly used by the file including them.  In most cases we can either
> > > drop those #include statements or replace them with a more targeted
> > > include (such as xe_gt.h to xe_gt_types.h).  Let's drop/simplify a bunch
> > > of the unnecessary includes in our driver's .c files; this may help
> > > speed up partial rebuilds for developers since the build system won't
> > > see as many false dependencies.
> > > 
> > 
> > Yes, header situation isn't great.
> > 
> > > There's more header-related cleanup that could be done (e.g., some of
> > > our headers incorrectly include other headers they don't need), but that
> > > can wait for a follow-up series; this one is already long enough.
> > > 
> > > 
> > > [1] https://clangd.llvm.org/
> > > 
> > 
> > Once we get the headers into better shape can we get clangd in CI?
> > Without that a year from we will need another huge series of fixes to
> > undo all the mistakes we've made in the last year.
> 
> clangd is a language server intended to talk to plugins in editors
> (e.g., I just set it up in neovim); I don't think clangd specifically
> can be used in a CI-like setup.  However clang-tidy is a standalone lint
> tool that I think could be configured to print out the same kinds of
> warnings (the "misc-include-cleaner" check seems to be the one for this
> case), although I haven't tried it myself.
> 

Ok - for the series:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I'd personaly prefer this squashed into one patch as 79 patches is a
lot, maybe Rodrigo, Thomas, Dave, and Sima have a different preference?

Matt

> 
> Matt
> 
> > 
> > Matt 
> > 
> > > Matt Roper (79):
> > >   drm/xe: Cleanup headers in xe_bb.c
> > >   drm/xe: Drop unused header in xe_bo.c
> > >   drm/xe: Cleanup headers in xe_devcoredump.c
> > >   drm/xe: Drop unused header in xe_device.c
> > >   drm/xe: Drop unused header in xe_exec.c
> > >   drm/xe: Cleanup headers in xe_execlist.c
> > >   drm/xe: Drop unused headers in xe_exec_queue.c
> > >   drm/xe: Simplify headers in xe_ggtt.c
> > >   drm/xe: Cleanup headers in xe_gsc_debugfs.c
> > >   drm/xe: Simplify header in xe_gsc_proxy.c
> > >   drm/xe: Drop unused headers in xe_gsc_submit.c
> > >   drm/xe: Drop unused headers in xe_gt.c
> > >   drm/xe: Cleanup headers in xe_gt_clock.c
> > >   drm/xe: Drop unused header in xe_gt_debugfs.c
> > >   drm/xe: Drop unused header in xe_gt_idle.c
> > >   drm/xe: Drop unused header in xe_gt_mcr.c
> > >   drm/xe: Drop unused headers in xe_gt_sriov_pf_config.c
> > >   drm/xe: Drop unused header in xe_gt_sriov_pf_debugfs.c
> > >   drm/xe: Simplify header in xe_gt_sriov_pf_migration.c
> > >   drm/xe: Drop unused header in xe_gt_sriov_pf_policy.c
> > >   drm/xe: Cleanup headers in xe_gt_sriov_pf_service.c
> > >   drm/xe: Drop unused header in xe_gt_sriov_vf.c
> > >   drm/xe: Simplify header in xe_gt_stats.c
> > >   drm/xe: Simplify header in xe_gt_sysfs.c
> > >   drm/xe: Simplify header in xe_gt_throttle.c
> > >   drm/xe: Drop unused headers in xe_guc_ads.c
> > >   drm/xe: Drop unused header in xe_guc_buf.c
> > >   drm/xe: Cleanup headers in xe_guc_capture.c
> > >   drm/xe: Cleanup headers in xe_guc_debugfs.c
> > >   drm/xe: Simplify headers in xe_guc_hwconfig.c
> > >   drm/xe: Simplify header in xe_guc_log.c
> > >   drm/xe: Cleanup headers in xe_guc_relay.c
> > >   drm/xe: Drop unused headers in xe_guc_submit.c
> > >   drm/xe: Drop unused header in xe_heci_gsc.c
> > >   drm/xe: Drop unused header in xe_huc.c
> > >   drm/xe: Clean up headers in xe_huc_debugfs.c
> > >   drm/xe: Drop unused header in xe_hw_engine.c
> > >   drm/xe: Simplify include in xe_hw_engine_class_sysfs.c
> > >   drm/xe: Simplify include in xe_hw_engine_group.c
> > >   drm/xe: Cleanup headers in xe_hw_fence.c
> > >   drm/xe: Cleanup headers in xe_i2c.c
> > >   drm/xe: Drop unused header in xe_irq.c
> > >   drm/xe: Drop unused headers in xe_memirq.c
> > >   drm/xe: Drop unused headers in xe_mmio.c
> > >   drm/xe: Drop unused headers in xe_mocs.c
> > >   drm/xe: Simplify include in xe_module.c
> > >   drm/xe: Drop unused header in xe_nvm.c
> > >   drm/xe: Drop unused headers in xe_page_reclaim.c
> > >   drm/xe: Drop unused header in xe_pci.c
> > >   drm/xe: Simplify include in xe_psmi.c
> > >   drm/xe: Drop unused header in xe_pxp.c
> > >   drm/xe: Simplify header in xe_pxp_debugfs.c
> > >   drm/xe: Cleanup headers in xe_reg_sr.c
> > >   drm/xe: Drop unused headers in xe_reg_whitelist.c
> > >   drm/xe: Cleanup headers in xe_ring_ops.c
> > >   drm/xe: Drop unused header in xe_rtp.c
> > >   drm/xe: Simplify header in xe_sa.c
> > >   drm/xe: Simplify header in xe_sched_job.c
> > >   drm/xe: Drop unused header in xe_sriov_packet.c
> > >   drm/xe: Drop unused header in xe_sriov_pf_debugfs.c
> > >   drm/xe: Drop unused header in xe_sriov_vf.c
> > >   drm/xe: Cleanup headers in xe_step.c
> > >   drm/xe: Drop unused header in xe_survivability_mode.c
> > >   drm/xe: Cleanup headers in xe_tile.c
> > >   drm/xe: Cleanup headers in xe_tlb_inval.c
> > >   drm/xe: Drop unused header in xe_ttm_stolen_mgr.c
> > >   drm/xe: Drop unused header in xe_ttm_sys_mgr.c
> > >   drm/xe: Drop unused header in xe_ttm_vram_mgr.c
> > >   drm/xe: Drop unused headers in xe_uc.c
> > >   drm/xe: Cleanup headers in xe_uc_debugfs.c
> > >   drm/xe: Simplify header in xe_uc_fw.c
> > >   drm/xe: Drop unused header in xe_validation.c
> > >   drm/xe: Drop unused header in xe_vm.c
> > >   drm/xe: Drop unused headers in xe_vram.c
> > >   drm/xe: Drop unused header in xe_vram_freq.c
> > >   drm/xe: Drop unused header in xe_vsec.c
> > >   drm/xe: Simplify header in xe_wa.c
> > >   drm/xe: Drop unused header in xe_wait_user_fence.c
> > >   drm/xe: Simplify header in xe_wopcm.c
> > > 
> > >  drivers/gpu/drm/xe/tests/xe_bo.c              | 1 +
> > >  drivers/gpu/drm/xe/xe_bb.c                    | 3 +--
> > >  drivers/gpu/drm/xe/xe_bo.c                    | 1 -
> > >  drivers/gpu/drm/xe/xe_devcoredump.c           | 3 +--
> > >  drivers/gpu/drm/xe/xe_device.c                | 1 -
> > >  drivers/gpu/drm/xe/xe_exec.c                  | 1 -
> > >  drivers/gpu/drm/xe/xe_exec_queue.c            | 2 --
> > >  drivers/gpu/drm/xe/xe_execlist.c              | 3 +--
> > >  drivers/gpu/drm/xe/xe_ggtt.c                  | 3 +--
> > >  drivers/gpu/drm/xe/xe_gsc_debugfs.c           | 5 ++---
> > >  drivers/gpu/drm/xe/xe_gsc_proxy.c             | 2 +-
> > >  drivers/gpu/drm/xe/xe_gsc_submit.c            | 2 --
> > >  drivers/gpu/drm/xe/xe_gt.c                    | 2 --
> > >  drivers/gpu/drm/xe/xe_gt_clock.c              | 6 +-----
> > >  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 1 -
> > >  drivers/gpu/drm/xe/xe_gt_idle.c               | 1 -
> > >  drivers/gpu/drm/xe/xe_gt_mcr.c                | 1 -
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 2 --
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 1 -
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 1 -
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 5 ++---
> > >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 1 -
> > >  drivers/gpu/drm/xe/xe_gt_stats.c              | 2 +-
> > >  drivers/gpu/drm/xe/xe_gt_sysfs.c              | 2 +-
> > >  drivers/gpu/drm/xe/xe_gt_throttle.c           | 2 +-
> > >  drivers/gpu/drm/xe/xe_guc_ads.c               | 2 --
> > >  drivers/gpu/drm/xe/xe_guc_buf.c               | 1 -
> > >  drivers/gpu/drm/xe/xe_guc_capture.c           | 5 +----
> > >  drivers/gpu/drm/xe/xe_guc_debugfs.c           | 5 ++---
> > >  drivers/gpu/drm/xe/xe_guc_hwconfig.c          | 4 ++--
> > >  drivers/gpu/drm/xe/xe_guc_log.c               | 2 +-
> > >  drivers/gpu/drm/xe/xe_guc_relay.c             | 3 +--
> > >  drivers/gpu/drm/xe/xe_guc_submit.c            | 2 --
> > >  drivers/gpu/drm/xe/xe_heci_gsc.c              | 1 -
> > >  drivers/gpu/drm/xe/xe_huc.c                   | 1 -
> > >  drivers/gpu/drm/xe/xe_huc_debugfs.c           | 5 ++---
> > >  drivers/gpu/drm/xe/xe_hw_engine.c             | 1 -
> > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
> > >  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 2 +-
> > >  drivers/gpu/drm/xe/xe_hw_fence.c              | 4 +---
> > >  drivers/gpu/drm/xe/xe_i2c.c                   | 4 ++--
> > >  drivers/gpu/drm/xe/xe_irq.c                   | 1 -
> > >  drivers/gpu/drm/xe/xe_memirq.c                | 2 --
> > >  drivers/gpu/drm/xe/xe_mmio.c                  | 4 ----
> > >  drivers/gpu/drm/xe/xe_mocs.c                  | 2 --
> > >  drivers/gpu/drm/xe/xe_module.c                | 2 +-
> > >  drivers/gpu/drm/xe/xe_nvm.c                   | 1 -
> > >  drivers/gpu/drm/xe/xe_page_reclaim.c          | 4 ----
> > >  drivers/gpu/drm/xe/xe_pci.c                   | 1 -
> > >  drivers/gpu/drm/xe/xe_psmi.c                  | 2 +-
> > >  drivers/gpu/drm/xe/xe_pxp.c                   | 1 -
> > >  drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 2 +-
> > >  drivers/gpu/drm/xe/xe_reg_sr.c                | 5 +----
> > >  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 1 -
> > >  drivers/gpu/drm/xe/xe_ring_ops.c              | 4 +---
> > >  drivers/gpu/drm/xe/xe_rtp.c                   | 1 -
> > >  drivers/gpu/drm/xe/xe_sa.c                    | 2 +-
> > >  drivers/gpu/drm/xe/xe_sched_job.c             | 2 +-
> > >  drivers/gpu/drm/xe/xe_sriov_packet.c          | 1 -
> > >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 1 -
> > >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 1 -
> > >  drivers/gpu/drm/xe/xe_step.c                  | 3 ++-
> > >  drivers/gpu/drm/xe/xe_survivability_mode.c    | 1 -
> > >  drivers/gpu/drm/xe/xe_tile.c                  | 3 +--
> > >  drivers/gpu/drm/xe/xe_tlb_inval.c             | 7 ++-----
> > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 1 -
> > >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           | 1 -
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 1 -
> > >  drivers/gpu/drm/xe/xe_uc.c                    | 2 --
> > >  drivers/gpu/drm/xe/xe_uc_debugfs.c            | 2 +-
> > >  drivers/gpu/drm/xe/xe_uc_fw.c                 | 2 +-
> > >  drivers/gpu/drm/xe/xe_validation.c            | 1 -
> > >  drivers/gpu/drm/xe/xe_vm.c                    | 1 -
> > >  drivers/gpu/drm/xe/xe_vram.c                  | 2 --
> > >  drivers/gpu/drm/xe/xe_vram_freq.c             | 1 -
> > >  drivers/gpu/drm/xe/xe_vsec.c                  | 1 -
> > >  drivers/gpu/drm/xe/xe_wa.c                    | 2 +-
> > >  drivers/gpu/drm/xe/xe_wait_user_fence.c       | 1 -
> > >  drivers/gpu/drm/xe/xe_wopcm.c                 | 2 +-
> > >  80 files changed, 45 insertions(+), 129 deletions(-)
> > > 
> > > -- 
> > > 2.52.0
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
