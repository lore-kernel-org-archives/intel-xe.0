Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55765C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 16:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C450B10E1B7;
	Wed, 12 Jun 2024 16:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQ5E3LPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD45F10E104
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718211498; x=1749747498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9IM+gv916Z37Pmaj6wV7dT5IwMCeC65csXY+N6gldPM=;
 b=ZQ5E3LPXBTQsi2ZEBtqFtx0xSzguJpjn4WJn+nuiTOXOPzyhv5O03Joh
 Ye2Rm1KREFS/XT+kkcQJr0DKhEISkDp4ENSXF0fnwWOlr2ScpQGDMLNtr
 ctWlY6r4EOIyCownAF+ZYl4FVOyltJ/Trogf5CbJHwIbhx8dY5BB6tjQC
 Vg/eE2etcbZL9JpThLGbuxFNPw3ZnoTYJfykI4D3+b3YzzyI86hWnvaq3
 TwZrmFkgdMcuN8iirXtLCb1jXnjY36+iCOwq4u2GIX1mu06sM3kAJNSXc
 W77Ds18cerkZZeKbLBuaSlos0eghQchwMZCbisF16ksuNiUcNLuBblchy g==;
X-CSE-ConnectionGUID: /nslcPvkTgWO8Ucoo1Ii8Q==
X-CSE-MsgGUID: NTSWzphsSU2anlOptx2iLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25570148"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="25570148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 09:58:18 -0700
X-CSE-ConnectionGUID: CC8spHZqRLOOqdQ/8rs0Gg==
X-CSE-MsgGUID: +An+aEvjQOSYybcfPsZLqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="44755599"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 09:58:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 09:58:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 09:58:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 09:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdrcjH9Pnjy65+FQaIfgQre5PU4jYMDp1w/JYuDN9lZUOa5nIqcv4UQGstYsVoBFp6kVX7lo0MdqgraHlR2hfSOTi3sgKo5459JY4eTkt1SUjoVvjq9dE5VHpAooFD2DNyUtPnQ4K5Xb+xswd5+9EkLJpZ/PZlEV2A0YUbn0juGyIDCtcxPWyJKUhXx4j11DSB4JmL+Tr+26fkj0+4Z0piOV9bJU/NSc2PVKdyhActcYw/j/aM1SVnXhdUp6BSX+WNMBKjLbTgkNcIS/ea1Z3w5cY0fbpN3BmHfpyfvD4r+Bph9dIXc4G7OEqsAALIxfL8qqvNERfb/wk0DEvOXJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkB/LGlla6Fz8gz/Mqs9xAa79QmllqMIzKD+rl4kZ6E=;
 b=FpQUi9Amv8v9bvDz0VRKgVNHRrzL9jW3uBWNcB9kinfDuFYeIv38s0/9Fhs35knm28AE1WfOnhBlamlh0Tb/FuR5IiWG9LRhb+1iM8UdNmMuVMF7vaTJUz3aYyiApROgtXHA5GYJHZ4WCCLbdN4/NrOMtvuRXRNLE/AdoKlUGuSmFWikQUrkdAVCE4zeJ3mHd4SChDcJ7YK4YVZk6ejFx74Oyr+W+m+p5SAEUAQLlKw2KKewZTtl2RHowgf+ycTQLK3YrTtwABrfLbV6+zSWkgox7YhyOsLgfomtxblxsk8BgWbXGrhAUBz30drIYCmNX7uw6P5mlaKyWXTWLSyjPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 16:57:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 16:57:49 +0000
Date: Wed, 12 Jun 2024 09:57:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/bmg: Add PCI IDs
Message-ID: <20240612165746.GB2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240603145430.1260817-1-balasubramani.vivekanandan@intel.com>
 <171754717157.2266114.5395479077999242508@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171754717157.2266114.5395479077999242508@8e613ede5ea5>
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 4714a208-d65d-4160-e532-08dc8b00ca62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?phAeD3SMycHtCHUpJY2fkv3wlDkgaw5FuU0qekmC9t6UWWzMUVXLUwjzi28U?=
 =?us-ascii?Q?1+kb+JDgd9zM7HhSBkDg3BL6zeVLOH9GE6u61EUuLzLnl4lq0ezl0lf8taab?=
 =?us-ascii?Q?WwYCTrSscLbISmZTjcppCOEvxbaZWWaBoNQqaHZudk5AHBK4/yqT0/Gsyszr?=
 =?us-ascii?Q?xh/0RlF/DeBLpkNsr32WXfKWBs2HAUWee+WvE/rVa4AVTCYsRqWOwT2Ef2ka?=
 =?us-ascii?Q?l9BJwBbhp3SBOXtYEosMvv3Jf0iGZ30+WcGrV4p8a9CtwXe2ik1ZYfugvMUe?=
 =?us-ascii?Q?OlrTNE+EKIio7cV33Adpz9ODopUP73t9XPeVDbcAiiZxe3BL6U45wwvlpC6a?=
 =?us-ascii?Q?RF0/1gEp/NgDH0DbJ6aY9o0+7oBdgA8IXeuYjZUWTlcqY5zvGJc21memfNo6?=
 =?us-ascii?Q?nOOr1SPeLfsCygVExLU3zsIkd/Kep8HqRIhmenr5Zl4fguw/vHAQk00n6WNL?=
 =?us-ascii?Q?TzTbuD4/I6gAkVb4jShPZG0AjLO9StUKcgBl6tCxJvymR2khO9JidexX2cHN?=
 =?us-ascii?Q?hmCFTonOgkUIQGwS/pN7UtAy+bXA/MjswLm3P7cdMywkwFKYwhtFEMWkvuY2?=
 =?us-ascii?Q?1AAp5BatWeZIcJqBnlWpIXO3Rw8ubH9qexv93V6ifwvSU0u1fDTP6/j8qVO3?=
 =?us-ascii?Q?EKuH+n+9fiooU0dn5PsBhzUhhzZRWRM+6hdZZu16XSuO4dfRwOzjLWD1gr6H?=
 =?us-ascii?Q?RzWRchISokQHBeAzsTw8ADaDsl2H5xDT1KOwcxp3Vw0mqGOAmRQ6sGfM/Hup?=
 =?us-ascii?Q?l2uztCB2ZZWsxmT4u9VbpGNiB6ImPZP2sLWVLD/u7vhJ40u7z70TUyvNzC53?=
 =?us-ascii?Q?uNM3Eo312bt17RryvG8dSTOCz8GiuKs/S+gD0Mx0xTvWnFdE9SFdz90f1G4b?=
 =?us-ascii?Q?zDHCitXFGrtHlQJVAfZcPWEJUGPrZdSj2n8ak/FrSKBUnPbiVIj1mjQS5u9g?=
 =?us-ascii?Q?Ek1p/0OxgaLlBz+wIqwi0evaPOMZkzy0otxbk2EMPqVUsELmUlj/rxWLywBZ?=
 =?us-ascii?Q?MYaAUI92SNhob6zyI7jBx6JDdIN951+ywIGOcEk7JBhG3U580U7qFh1ja1wv?=
 =?us-ascii?Q?ivAF5x0Fp4HipM8PYnibUsjiZ9msJuwF9XWtUE7Hvy3YpTHwJaCgOTDMiwrH?=
 =?us-ascii?Q?QrNb3GBAblqrAIcsuZClS9BskcX8yIypBPTlP7b2u9sQPi7j2eKpjnJbsO8q?=
 =?us-ascii?Q?Gvywgv/qe6F5c28KRSykOhS484JkORjKzG08ZEZfzbPbb4+IsBT7+gEO8Jc2?=
 =?us-ascii?Q?uOfDnRWgADhc512pmC23WS838MFGUZNjO4sulg+Jdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KFTF2MbCVl7g6vaxcQlGRxiPYcL1lLbhfUSP7zmIZLG13v4Hgz3A0v+nwN+g?=
 =?us-ascii?Q?mDgmTYAr7/PY08Wn8SRhtOkDrzzhUQxA9djzF5fw6XtYZWeKaqr6RTscF1FG?=
 =?us-ascii?Q?n4u3xciQxxAMf1S1NwjL0U5d2egFg2r5WofyQ8F8HlskFBNktYWabsajTcmd?=
 =?us-ascii?Q?nDaAu3Vr4sFTl4PO2dGr9YUaphop5gomekEQ+Qa9MwMgGzBLc5NYZYqXvrVM?=
 =?us-ascii?Q?Fy+LJXGb0v4Ko7b2Qziw7szzsqRgZOT9IiK8vIwL4RAyLoxIgBoHeIfSCEdM?=
 =?us-ascii?Q?NojadGffx/opXkJ2MXqSf9yYb44xheCulMnrM8AfSeBWGhD+7C7y5wVR7giQ?=
 =?us-ascii?Q?PywHqoU79alDUMs6k0MXhufsDFhDgvfG2Wnj1fyIilLwz1DAeYApmYb7rS/H?=
 =?us-ascii?Q?we1g/tvDTmUuiTUP0esFCKcuBmXAtn9qPnWprRW4m7A0qKtEroPxxtHauntU?=
 =?us-ascii?Q?JyFq5RHN6mcOjetTaRQmL3Vo2LfNJp317V+T5GjWjStaSGHvUa/abCN/WnJk?=
 =?us-ascii?Q?U14vKOZYZV1dqhHsylXtgviabAy05NnGKQAk7I+dvNWBqVVICy/4EhqefAse?=
 =?us-ascii?Q?uCi/6gJrn7qv2jFuqqIixDGO8lfAeUCzyKAdSuZI7tQKrHONl99gKIjTsEtj?=
 =?us-ascii?Q?A3hi0K+fX/jSFgnIQHu5essTa0CBRCX9GX+jyg7Lw+Wrptt58ThYJBLe0zTL?=
 =?us-ascii?Q?07ZYJbGUKHOqU5D5X7lMIZDhRy5IM8pTEyHfOlm/OlkYoNNZ3dQg32FdP7lx?=
 =?us-ascii?Q?roCJX9tUwHpk42sjIyg4z+AiFjCUrWXqYGMtzlnjYn9fxkbMsxuxN44K2MEj?=
 =?us-ascii?Q?CUqJTIz29FlTyG4Nb1VRYG290XnR4O5HZkG6IStRNCC4kxXnsVWyxeD7PbYM?=
 =?us-ascii?Q?/rATL35xMFbg4v85CA+xeblELbRymKlptlXnJuRAuW9BahqTvMBp+XivUeI9?=
 =?us-ascii?Q?s5m3LWiut4rltazf+fl/IK1Y9odvLhrHxFJm3yenF8xgS0vW/mz6+5Kehfy0?=
 =?us-ascii?Q?eMVnIbGg79GoWxPxwWasX/5WQML0f1fPwXd2LzByB0gWhYR+oEflm4Eix+Fe?=
 =?us-ascii?Q?k978thY1Z8B9kXu5DcPUyLab53PwLa09sDmwC21aSh33xlI5/WBmFt5OVtYC?=
 =?us-ascii?Q?ecnxGiVVgJZ6sOK4AlNjd+EPrOUnY1ALxIoFucGpJwDQHbeX346yqpc1aWSK?=
 =?us-ascii?Q?+UmsS+twUQu2dnNQ32hY1qBjvqtQvIvrZyl8lT+TJ8q6C6KC2cQRjWNqKEAi?=
 =?us-ascii?Q?PKycvECfrnTDU5Jfk2KuKBUeBQyg+RAKPfmgckRbNn/nVxS3PYUWGju1+u5+?=
 =?us-ascii?Q?0Vm/1A5oIQvXY/JCY3EJJK6eCk80vrzuJ2iov1T6Kuzyaj+kUxX6g9x3cJ4d?=
 =?us-ascii?Q?ijX/qGrdXXa4p03g5Of0e/DEAqmwl2TkBDwIEimN07PoSES6HzGl0WsQT3hL?=
 =?us-ascii?Q?WCTzFOpAmqYXPrMBD06jvJF+g0YfjXkEfVqSeiftKOBTuUAYf/p4V3EuTr2Y?=
 =?us-ascii?Q?rUQ6ucvOlKsXCIsokb/BxvXELKyzdDuz5Ku17Fu3OAIb8MlyKqoj9LwTMwxl?=
 =?us-ascii?Q?/bDCFRbKYJ9Q64tuIEC89p8qVCAPhukz9IayfM1wanmtfeNqqxeFxR7UKuVe?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4714a208-d65d-4160-e532-08dc8b00ca62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 16:57:49.3891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehaVCNnNM9/ZkN0O8CsEAxiIk4P+ouheLBx8enjbKnGxUCysPypZ6SajyZ90wrIwYY/mshXSNBGiybDT8hg8VJ4VOXVyZCcq+MR3E++nxzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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

On Wed, Jun 05, 2024 at 12:26:11AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/bmg: Add PCI IDs
> URL   : https://patchwork.freedesktop.org/series/134387/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5_full -> xe-pw-134387v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134387v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134387v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134387v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][1] +6 other tests dmesg-fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-dg2-set2:     [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@xe_gt_freq@freq_fixed_exec.html

None of these are related to the new BMG PCI IDs.

Applied to drm-xe-next.  Thanks for the review.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [INCOMPLETE][6] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-FAIL][7] +1 other test dmesg-fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][8] ([Intel XE#1195]) -> [DMESG-FAIL][9] +1 other test dmesg-fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][10] -> [DMESG-FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-adlp:         [INCOMPLETE][12] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [DMESG-FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-9/igt@xe_pm@s3-basic-exec.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-dg2-set2:     [DMESG-WARN][14] ([Intel XE#1214]) -> [DMESG-WARN][15] +1 other test dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@xe_pm@s4-mocs.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@xe_pm@s4-mocs.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][16]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - {shard-lnl}:        NOTRUN -> [DMESG-FAIL][17] +1 other test dmesg-fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - {shard-lnl}:        NOTRUN -> [FAIL][18] +1 other test fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - {shard-lnl}:        [FAIL][19] ([Intel XE#1901]) -> [DMESG-FAIL][20] +1 other test dmesg-fail
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-3/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@xe_ccs@block-multicopy-compressed:
>     - {shard-lnl}:        [PASS][21] -> [INCOMPLETE][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-4/igt@xe_ccs@block-multicopy-compressed.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-8/igt@xe_ccs@block-multicopy-compressed.html
> 
>   * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
>     - {shard-lnl}:        [FAIL][23] -> [DMESG-FAIL][24] +3 other tests dmesg-fail
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
> 
>   * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:
>     - {shard-lnl}:        [DMESG-FAIL][25] -> [FAIL][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-3/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-3/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134387v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#623])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1033] / [Intel XE#1214])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#619])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-adlp:         NOTRUN -> [FAIL][34] ([Intel XE#1874]) +1 other test fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][35] ([Intel XE#324]) +1 other test dmesg-fail
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#367])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#367])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1252])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#1252])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#306])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#306])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#307])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#308])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][52] ([Intel XE#282])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][53] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [PASS][54] -> [DMESG-WARN][55] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#323])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#323])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#776])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#702])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][62] -> [FAIL][63] ([Intel XE#1874]) +1 other test fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#651])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][67] ([Intel XE#1861])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#656]) +32 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#653])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1339])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#417])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#870])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#1211])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1122] / [Intel XE#1201])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@psr-cursor-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-8/igt@kms_psr@psr-cursor-blt.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#327])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#756])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#756])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_ccs@block-multicopy-inplace:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@xe_ccs@block-multicopy-inplace.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#1447])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1126] / [Intel XE#1201])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][88] -> [TIMEOUT][89] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-beng-small-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@xe_evict@evict-beng-small-cm.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#1600])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][93] -> [TIMEOUT][94] ([Intel XE#1473] / [Intel XE#392])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-464/igt@xe_evict@evict-threads-large.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-464/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#688])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#288])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
>     - shard-dg2-set2:     [PASS][100] -> [INCOMPLETE][101] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
> 
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1008] / [Intel XE#1201])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@xe_mmap@vram.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#979])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         NOTRUN -> [FAIL][104] ([Intel XE#1924]) +1 other test fail
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][105] ([Intel XE#1162] / [Intel XE#1214]) +4 other tests dmesg-warn
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][106] ([Intel XE#1195] / [Intel XE#1358])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-436/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#366])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - {shard-lnl}:        [FAIL][109] ([Intel XE#1659]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][111] ([Intel XE#282]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][113] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][114] +3 other tests pass
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x:
>     - {shard-lnl}:        [FAIL][115] ([Intel XE#1491]) -> [PASS][116] +1 other test pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-x.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
>     - shard-adlp:         [FAIL][117] ([Intel XE#1874]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_plane@plane-panning-bottom-right:
>     - shard-dg2-set2:     [INCOMPLETE][119] ([Intel XE#1035] / [Intel XE#1195]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right.html
> 
>   * igt@kms_plane@plane-panning-bottom-right@pipe-a:
>     - shard-dg2-set2:     [INCOMPLETE][121] ([Intel XE#1195]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right@pipe-a.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right@pipe-a.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][123] ([Intel XE#361]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_vblank@accuracy-idle:
>     - {shard-lnl}:        [FAIL][125] ([Intel XE#1523]) -> [PASS][126] +1 other test pass
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-2/igt@kms_vblank@accuracy-idle.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-7/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][127] ([Intel XE#1473]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][129] ([Intel XE#1761]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr:
>     - {shard-lnl}:        [FAIL][131] ([Intel XE#1256]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - {shard-lnl}:        [DMESG-WARN][133] ([Intel XE#1620]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [INCOMPLETE][135] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][136] +1 other test pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - {shard-lnl}:        [ABORT][137] ([Intel XE#1794]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
>     - shard-adlp:         [DMESG-WARN][139] ([Intel XE#1214]) -> [PASS][140]
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-dg2-set2:     [DMESG-WARN][141] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][142] ([Intel XE#1162])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][144] ([Intel XE#801]) +23 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#873]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#873])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][148] ([Intel XE#316]) +2 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#316]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][151] ([Intel XE#324]) -> [FAIL][152] ([Intel XE#1231])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][154] ([Intel XE#1124]) +4 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1124]) -> [SKIP][156] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][158] ([Intel XE#346])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_big_joiner@basic.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#367]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][162] ([Intel XE#787]) +48 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#787]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][166] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#314]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][172] ([Intel XE#1152]) +3 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#306]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#306])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#373]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][178] ([Intel XE#373]) +3 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][180] ([Intel XE#308])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][181] ([Intel XE#282]) -> [DMESG-WARN][182] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom:
>     - shard-dg2-set2:     [INCOMPLETE][183] ([Intel XE#1195]) -> [DMESG-WARN][184] ([Intel XE#282]) +1 other test dmesg-warn
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][185] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][186] ([Intel XE#282] / [Intel XE#910])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#455] / [Intel XE#929]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1927]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#1927])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#307]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#307])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#776]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#776]) +1 other test skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#703]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#703])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][198] ([Intel XE#1137])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-FAIL][199] -> [INCOMPLETE][200] ([Intel XE#1195] / [Intel XE#927])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         [DMESG-FAIL][201] -> [INCOMPLETE][202] ([Intel XE#1195])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][204] ([Intel XE#455]) +4 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#455]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#651]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#658]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#658])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][212] ([Intel XE#651]) +13 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][214] ([Intel XE#653]) +13 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#653]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#417]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#417])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][220] ([Intel XE#356])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-adlp:         [INCOMPLETE][221] ([Intel XE#1195]) -> [ABORT][222] ([Intel XE#1608])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#498]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#870]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#870])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1129]) -> [SKIP][230] ([Intel XE#1129] / [Intel XE#1201])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][232] ([Intel XE#1129])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][234] ([Intel XE#929]) +7 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][236] ([Intel XE#1122])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#929]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][240] ([Intel XE#1149])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1127]) -> [SKIP][242] ([Intel XE#1127] / [Intel XE#1201])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#327]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#756]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#756])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][248] ([Intel XE#1091])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][252] ([Intel XE#1126])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#944]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][256] ([Intel XE#288]) +11 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#288]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-basic:
>     - shard-dg2-set2:     [DMESG-WARN][259] ([Intel XE#358]) -> [DMESG-WARN][260] ([Intel XE#1214] / [Intel XE#358])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-basic.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-basic.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][262] ([Intel XE#560])
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-434/igt@xe_media_fill@media-fill.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#378]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#378])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@xe_module_load@force-load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         [DMESG-FAIL][265] -> [INCOMPLETE][266] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     [DMESG-WARN][267] ([Intel XE#1162] / [Intel XE#1551]) -> [DMESG-WARN][268] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1551])
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][269] ([Intel XE#1214]) -> [INCOMPLETE][270] ([Intel XE#1195])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-dg2-set2:     [DMESG-WARN][271] -> [DMESG-WARN][272] ([Intel XE#1214])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][274] ([Intel XE#944])
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-WARN][275] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][276] ([Intel XE#1214] / [Intel XE#1760])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#1927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1927
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5 -> xe-pw-134387v1
> 
>   IGT_7877: 23b8b8a0168e1b5141e29346be1f83fdbed31037 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1398-77588a3e3e58917a9b1d992aeef6f02a6b85ded5: 77588a3e3e58917a9b1d992aeef6f02a6b85ded5
>   xe-pw-134387v1: 134387v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134387v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
