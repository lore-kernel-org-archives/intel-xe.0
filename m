Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2E0C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 16:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73F510E3AA;
	Fri, 25 Sep 2026 16:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYrvzp1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BB110E3AA
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790352259; x=1821888259;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=3kaZPXc4GsMDf18r/0rT66z+f4FW9FPZbMP0k15VWjI=;
 b=YYrvzp1FeZ+SNqrxtkTrpnT5UYKj5iTMRiLPU+PAuLLvDAV4JSQKXcJo
 3cVa/DNPYjxBQ+2dsXp2Go6Fns5wMOej4YBgau04WZs/tBS7lbQPfMVeK
 l52nLWBg30bMPFamfTDtEayQM9huDVMsYjNbE9VIwCpiDzWpz5QnxOe9z
 5OFX9NwEU1wTJtpeihPfThyn9/Nve+pHp67SA5Cxgfb17kj+sKISmiNS+
 vwtYA/BtwHrQqnaQcyJRqhtwkWw4lBPf3rWXgTUosxS9rvN2drrmu4Jp8
 u6ECDGp/FcTq1gPu9nomqD8SWoZfWzCCQBxjo/Pq09W+WTqa0zU/W620v w==;
X-CSE-ConnectionGUID: zKFn5jjjRT6J25xxfiBJ6w==
X-CSE-MsgGUID: 8utbX4LTR4WoK2/0NyqMaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="108631965"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="108631965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 09:04:19 -0700
X-CSE-ConnectionGUID: KczahnD1T56NqG5l7cw6Qw==
X-CSE-MsgGUID: Jp9PM8uYTL+/ckEa94bhuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="273877838"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 09:04:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 09:02:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 09:02:56 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 09:02:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lH5LE6J1ZnwGHeZ9jIeHXboWzquGOtN+pT10EozIZP3BIFYmpmu13b+Xjdo8h/hKUbF6NqcEyb8n6deJZIyytJTzXknuorr2VI7CrIk7TWdDhemeZlJILYxT7bcdRPcsSefgV0TA9Wlz6/HXn3sRJYo87NhxAAQWlVh/FVXIWGcrlOVfTvbg8NyDZgRbrXyTniR39gBFkJHO54Ms9Fc9GzAhOQRdIPeCKxAzG8+/qTaAL1tQFDw1si+1w98c5HzzAT61yCgdP7dSfK1eKxXxpmTqDwOnH25WN/wDcl4uHTR/cKWu8e/s+iHltbcNOPrJfEJQpLj3UIxOu8dRyQ9jEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTxMH2U4SEF8mxYqDq//pW92T/+RziLMfhVfi15i0mc=;
 b=TpZe9bI3IjAFJa6gz8txMo7Plp+XoUcyBBAASM3kY4rlYPk+dRUmrgWSj6GlF7wtalIfMRphPFxS+qFAug6cA6W0ugUWBCKT8BXGtpBPrGszGvHQ5nhFFXp7fr+1KM9sySQy1jboaMYp1vEaV801DhpcTUQsLa9y5q+VsUHO8Rha65uHH+3n/ed929vgzH4/yfbM6bq88UXII1nZVAksJZiTN9WKfo8WBUAJC/4UNbZUHKdLRzx3C7Z4RTdW0pphCpz+D1ljtTzKWP+OKZF+/IVyzfIX15BNfdgVJuBZtNoedxW3Yzpwe1Q6BvCSUZFnMalxfF+06rcvFu3uCRMRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 16:02:01 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 16:02:00 +0000
Date: Fri, 25 Sep 2026 09:01:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for CPU
 binds and ULLS on migration queue (rev9)
Message-ID: <araa9swzCHrxyPQu@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <179034870755.208168.12875541037441074423@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179034870755.208168.12875541037441074423@61270ab9df2a>
X-ClientProxiedBy: SJ2P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::11) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 775fcca3-e883-4e85-69a6-08df1b1e5575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|5023799004|56012099006|4143699003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yC3Xz2owSGUKesOk79fd/kYc9Aw5CezmoZX/BSSS8X5Ax/rqoYdiopvxz0DT2IezBZ61tu2RIW0EjrKf3bn62o7/Qxx4cPH4Q94xjgqtOR/HuGWyGMbrzouawniFkdTpFK5GegIJfOMKd/AIDymnMwsi8nw7lLaWDojII++jqPZzxt3MokMgsGby4h2VuzwavSJnzxhWuPn4Ja+UiC0c2nDvXtkRIDjqN8JfvzpYvyFLoXaINYEYdvweFN3RhauiBmLIsd6o12+pWmm1PXVtQEw+XgPNEq3SMhBjYBcwaLgfx9e9LWiw4dVaJ6ThGx9lxSIxWgOM7iQJNjO4xo9sJ/VBt+0Yb7CuG9uWFMJBXwlwd9dAJgGLoJtNUm+h9mLYu0+3WUqKPtsZy4MBLaY5xKMPjvvUC2S8SLSE+Zj56wBSFG1Xf9Q7dTSuyreY3nZcgCGT0w6t4EXUpf5q3u3BNLvNOMOX23qIQbK163gne3ZF3ofKsET2fwqub44TA6BcgPO9GlWgL3GMQtZi2G5UPNMTSyZ8Zhvl5Asc2UfjrxWLO9yUypqMSCMaw+/Ll9pO+KegLUic+5lqlxJzlg6tHIjBoAeBY77HCTLgmCsE+b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ZLLHdo2a8i88vYO7Kn5kURUOCFUbiFo7yJ1uWGCnxWve6V9/L52aiqSiKeF?=
 =?us-ascii?Q?5RaJ15SJC59AgDJ57Fx72pciaeq0KcH8OF5/7pW9gp/la85mmVYT5G2qseoe?=
 =?us-ascii?Q?Uq0w2U4lymcXQEf5M1/8Y9V5rxaWwui5VWNNEusGjmGQKSaAqbeI9JiMXqas?=
 =?us-ascii?Q?KV0gBFf2EGsgmAKARPImve+fNFHNB1rQPefvtGh68voZofQHkSlq1jj4QpRD?=
 =?us-ascii?Q?+pHFELR+1zgXJX6xZNwDtPK3Ivg6W72jo/Iud1H8Wy0Sh4X7CcwlrCag9X6+?=
 =?us-ascii?Q?B7eTcZXmzva8Kk7tP5I3RH5Od/9n0I7uMjdsP3MwN6d5pfvrHs8VPwPtZa4r?=
 =?us-ascii?Q?rnlM9ODMUQdnrt+VSmHJ7lgabxTB87KbdgPFv8Q5WmvSxQqlt4tt17EpVFzA?=
 =?us-ascii?Q?3x/ut9V8PhSH9k0x4ms1AXxMPZVYhVwK+RNTKJ0mWuSRqRmiCk9cH+9FFUWg?=
 =?us-ascii?Q?XJ2+IvzXgLReRtEpr24vrHjayeGXSDQcMvbWqf02+Xn4hXSNr61qqwwoQY8h?=
 =?us-ascii?Q?JspPq4k6e3j1VvDP45TPg8cFQLqjR+U1XLF1q7hz82odcGukBoNgqovj/hGv?=
 =?us-ascii?Q?KKopaCHZx2LTywQTW5g99i8Ib9/xcIn8gcw8jWrE08wiPm4F2WilPEkziVfO?=
 =?us-ascii?Q?AHku5fa+ZVQXI4HUwwe+VV5SwwfPFcHxXQGiQIlmG5RQa7xTXOvWMozIN9Ok?=
 =?us-ascii?Q?7qfyTChu9u+RLflwzdQv8lTYB1lGbbY7IqdLvt422wcLK9o22kVSrKw/Dl40?=
 =?us-ascii?Q?JVFHrBHvHWPTipg6++m0rmOORNKGavCf7lthkElH0Mr8gd6hrFET6aFieAMd?=
 =?us-ascii?Q?3ooEOpSjOy92Vg4DKgLYeIYuveF59Nhz+EftWuN4OUkVxkbKMas/u8Q/GqAp?=
 =?us-ascii?Q?LxVoUvu3wXpisJt3TaR+D7zwDabte4xWlZI1drNcPyZVp7Z+f8nQNMysq21t?=
 =?us-ascii?Q?uH4/6LWXfYVTGLDaK58F6AqAjKGx4JOSCDIb1AVb5wu+InVZBeMl/v61Iaap?=
 =?us-ascii?Q?Wson/7HkZIwz35FFAHYagKpZI8Dg//zcKsMV9tZhKjuyBqUjKJtnI+S9SCbc?=
 =?us-ascii?Q?9zie8FQmMM3Ox0uJPS3mVJCe6xyXnT21fIVTREL1sjXT91LUHZNiNoOFIemm?=
 =?us-ascii?Q?SEy7QXXUEtU30KDPhV8HU4VXy5rUYYCmZhFl8MarJQCtAqJbjaXcC5zHngiP?=
 =?us-ascii?Q?VEUmf6u0TqrmNkNEYXt/le59M9Ffj5z0OpmDKaLznbG0ndmRSRLpCbEwTWnw?=
 =?us-ascii?Q?n4YIHiawBz2Mo/YVzkYrpXq/6N46FEmpen1oShE/AvKI10NWM93LUfD10+bJ?=
 =?us-ascii?Q?TAAwzYvih7GQSI7c9l3ZXqrjjYunHuzDPKHqcbOzLJuD+jWBz5npS/JHhY3C?=
 =?us-ascii?Q?CRit/HRh7vaoACoqFtT5+77LZA1WZB+6gC9J1D0uA8iNnePEe0epEMO3PomH?=
 =?us-ascii?Q?Q2I5H/8CurXZco52BA6l5Eqi84k8Ah+GZdGQLUftkDm1RuRs6hSzJV0tDibR?=
 =?us-ascii?Q?sxi2sXVTY11cmX1VSA6HBo+13KwG8M2Z6/ASb1Te6smTvGQ2poBzwHQGlrq3?=
 =?us-ascii?Q?i7KG5JBfiESHv5Hhw7ZZn2v/Y/lsmz3HAEbeQ46EZ7iGRJTzUpSUd+J/5sT0?=
 =?us-ascii?Q?+ONtUw8fOTMPCWtZwRodFrjS0DyYe2qzsPXhC9X9T8SQ4W1wQfbSHklye45h?=
 =?us-ascii?Q?GZrU+epXNPGBJ1KSxIwln/jnCYynPdOw1glMhV2p/FJ3IKuAgi/qScY1kP+I?=
 =?us-ascii?Q?5330+7CxN/5m4IWWZ8Ond6f2JM8EKOk=3D?=
X-Exchange-RoutingPolicyChecked: CrF8ltaqLK93c5xZbucrYtWiCZVMnNSLB8ni1qnUX3LCZVia7HV2NSzwyi+3ZtbplK8tfGaxnyuzNg3oemFcRBkxARvvsAz6lAQSLHgjS23IU0yndEljObw/iZ3k4G8DQwUvDQ4meGfwZC26KhBrKsvUqZgxwAANnE19BVdCT1GGg/90vi98iSCc7tkvm1fUD/gGP6oy9ZcgQJ99xcXc7cOaVV0pue1JaFEu+iE4IoM691Jh/TCr397yWmuZUaTgUfcp/vy6KRnBIPYkktt47M+lHTBmm6RB833CQG+2lgcUZwTQYhf2JqaANLX0jWTDmVWaIZ1OmPLyGx6cLO4w6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 775fcca3-e883-4e85-69a6-08df1b1e5575
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 16:02:00.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJvPuFy2vFVsfiw3dTC6atx3YXfUqqD1/eR/v0r0I9JLoNmaxDBsZ6pyJjmj+Tv4YmlzgbhLJcFCzT5VhUVjaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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

On Fri, Sep 25, 2026 at 03:05:07PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: CPU binds and ULLS on migration queue (rev9)
> URL   : https://patchwork.freedesktop.org/series/149888/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5824-999838292166407bbe911a41dee23112c49e9d44_FULL -> xe-pw-149888v9_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-149888v9_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-149888v9_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-149888v9_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_vm@bind-array-enobufs:

This test is invalidated by CPU binds as we no longer on dependent the
migration layer BB pool which results in -enobufs if a VM bind overflows
it. I'll delete this test when merging this series.

Matt

>     - shard-ptl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-5/igt@xe_vm@bind-array-enobufs.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-1/igt@xe_vm@bind-array-enobufs.html
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-lnl-1/igt@xe_vm@bind-array-enobufs.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-4/igt@xe_vm@bind-array-enobufs.html
>     - shard-bmg:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-2/igt@xe_vm@bind-array-enobufs.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-5/igt@xe_vm@bind-array-enobufs.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-149888v9_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#3718] / [Intel XE#6078])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
>     - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#6078])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
>     - shard-ptl:          [PASS][11] -> [ABORT][12] ([Intel XE#9387])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2327]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2328] / [Intel XE#7367])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5808]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
>     - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#7679])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7679])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7679])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
>     - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5822]) +4 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>     - shard-bmg:          [PASS][24] -> [ABORT][25] ([Intel XE#9362])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][26] ([Intel XE#7084] / [Intel XE#8150])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:
>     - shard-ptl:          NOTRUN -> [ABORT][27] ([Intel XE#9367] / [Intel XE#9375]) +1 other test abort
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3432])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +7 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5824])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_chamelium_color@ctm-max.html
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#306] / [Intel XE#7358])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7358]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>     - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#2252])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>   * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-0:
>     - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#9333]) +9 other tests fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-b-plane-0.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
>     - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#6969]) +20 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#6969]) +13 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#7642])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_content_protection@legacy.html
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7642])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1424])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2320])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2321] / [Intel XE#7355])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2321] / [Intel XE#7355])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5900]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:
>     - shard-ptl:          NOTRUN -> [ABORT][49] ([Intel XE#9375])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#6035])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#323] / [Intel XE#6035])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8265])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5907])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_dsc@dsc-with-output-formats.html
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#8265])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4156] / [Intel XE#7425])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2373] / [Intel XE#7448])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1421]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#2316]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@basic-plain-flip@d-hdmi-a3:
>     - shard-bmg:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#1727] / [Intel XE#6819]) +1 other test dmesg-warn
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-6/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-3/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#7178]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7178] / [Intel XE#7351])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#5800] / [Intel XE#6312]) +4 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#7061]) +3 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4141]) +6 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#7061] / [Intel XE#7356])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#6312]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#6312]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2311]) +24 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +24 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7061]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7061]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#5812]) +18 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7905]) +7 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7865]) +6 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#7865]) +4 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4298] / [Intel XE#5873])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7283])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-ptl:          [PASS][87] -> [ABORT][88] ([Intel XE#9362]) +6 other tests abort
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_dc@dc5-pageflip-negative:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6927] / [Intel XE#8854])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#5810])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1489]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#7304])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2893] / [Intel XE#7304])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2387] / [Intel XE#7429])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@pr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2234] / [Intel XE#2850])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@kms_psr@pr-basic.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1406])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#1406])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
>     - shard-lnl:          [PASS][100] -> [ABORT][101] ([Intel XE#9396]) +1 other test abort
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-lnl-4/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-2/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - shard-ptl:          [PASS][102] -> [FAIL][103] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-threads-large-multi-vm:
>     - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#5764]) +3 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#7482]) +2 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_balancer@twice-virtual-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][107] ([Intel XE#7482]) +5 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@xe_exec_balancer@twice-virtual-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1392]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#8374]) +6 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#8374])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_exec_fault_mode@once-multi-queue-userptr.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue:
>     - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#8374]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@xe_exec_fault_mode@twice-multi-queue.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd:
>     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#8364]) +12 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-close-fd.html
> 
>   * igt@xe_exec_multi_queue@one-queue-close-fd-smem:
>     - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#8364]) +7 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-close-fd-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#8364]) +12 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_exec_multi_queue@two-queues-close-fd-smem.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
>     - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#8369])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#9096])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-10/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-4/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#8378]) +3 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#8378])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue:
>     - shard-bmg:          [PASS][122] -> [ABORT][123] ([Intel XE#8007])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue.html
> 
>   * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#6964]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
>     - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#6964])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html
>     - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#6964])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html
> 
>   * igt@xe_page_reclaim@binds-large-split:
>     - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#7793])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@xe_page_reclaim@binds-large-split.html
> 
>   * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
>     - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#7590] / [Intel XE#7772])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2284] / [Intel XE#7370])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#6867])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@xe_pm@s3-basic-exec.html
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#584] / [Intel XE#7369])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-bmg:          [PASS][132] -> [ABORT][133] ([Intel XE#9399])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-7/igt@xe_pm@s4-basic-exec.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pmu@engine-activity-suspend:
>     - shard-ptl:          NOTRUN -> [ABORT][134] ([Intel XE#9362])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@xe_pmu@engine-activity-suspend.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault-svm:
>     - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#7599])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@xe_prefetch_fault@prefetch-fault-svm.html
>     - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#7599])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_prefetch_fault@prefetch-fault-svm.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-rpm:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4733] / [Intel XE#7417])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#944])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput-low-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#8339])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@xe_sriov_scheduling@equal-throughput-low-priority.html
> 
>   * igt@xe_sriov_vfio@region-info:
>     - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#7724])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_sriov_vfio@region-info.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-ptl:          NOTRUN -> [DMESG-WARN][141] ([Intel XE#8963])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-6/igt@xe_wedged@basic-wedged.html
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][142] ([Intel XE#8963])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-8/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>     - shard-bmg:          [INCOMPLETE][143] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-ptl:          [ABORT][145] ([Intel XE#9362]) -> [PASS][146] +3 other tests pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [ABORT][147] -> [PASS][148] +1 other test pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_vblank@accuracy-idle:
>     - shard-ptl:          [FAIL][149] -> [PASS][150] +1 other test pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/igt@kms_vblank@accuracy-idle.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-3/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-ptl:          [ABORT][151] ([Intel XE#9375]) -> [PASS][152] +1 other test pass
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-8/igt@kms_vblank@ts-continuation-suspend.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-5/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
>     - shard-ptl:          [FAIL][153] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][154] +3 other tests pass
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-7/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-2/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][155] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_system_allocator@partial-atomic-middle-remap-cpu-fault:
>     - shard-bmg:          [FAIL][157] ([Intel XE#9115]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-middle-remap-cpu-fault.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-6/igt@xe_exec_system_allocator@partial-atomic-middle-remap-cpu-fault.html
> 
>   * igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset:
>     - shard-bmg:          [ABORT][159] ([Intel XE#6652]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-free-nomemset.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-bmg:          [ABORT][161] ([Intel XE#8007]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [ABORT][163] ([Intel XE#9362]) -> [PASS][164] +1 other test pass
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-lnl-5/igt@xe_pm@s4-basic.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-lnl-3/igt@xe_pm@s4-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-ptl:          [ABORT][165] ([Intel XE#9362]) -> [ABORT][166] ([Intel XE#9387])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-1/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][167] ([Intel XE#7084] / [Intel XE#8150]) -> [ABORT][168] ([Intel XE#9362])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-ptl:          [ABORT][169] ([Intel XE#9362]) -> [ABORT][170] ([Intel XE#9375])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/igt@kms_cursor_crc@cursor-suspend.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][171] ([Intel XE#3544]) -> [SKIP][172] ([Intel XE#3374] / [Intel XE#3544])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][173] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][174] ([Intel XE#2509] / [Intel XE#7437])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_pat@pat-sw-hw-suspend:
>     - shard-bmg:          [ABORT][175] ([Intel XE#9362]) -> [FAIL][176] ([Intel XE#7695])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-8/igt@xe_pat@pat-sw-hw-suspend.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5810]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5810
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
>   [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
>   [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
>   [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
>   [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
>   [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
>   [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
>   [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
>   [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9367
>   [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
>   [Intel XE#9387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387
>   [Intel XE#9396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9396
>   [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5824-999838292166407bbe911a41dee23112c49e9d44 -> xe-pw-149888v9
> 
>   IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5824-999838292166407bbe911a41dee23112c49e9d44: 999838292166407bbe911a41dee23112c49e9d44
>   xe-pw-149888v9: 149888v9
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v9/index.html
