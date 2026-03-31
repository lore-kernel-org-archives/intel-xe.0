Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C874810F9303
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 21:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEB310EB81;
	Tue, 31 Mar 2026 21:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BP2/fFCO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB52A10EB81
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 21:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774992701; x=1806528701;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e/Z5rxqrVTWe6LczRtcJnEEseOcqMRG6qng5SMzSbIw=;
 b=BP2/fFCO9mHDOr79cNfELMA/H3piifpHXSkcFFCef4x+G3r41H6mxmyi
 MLx/V+jrTBMCAiGP5kuPChixyzakopNNnTc36+PpFixEGK0StjINTqNfi
 jpXfWgKIVhcrqQ1XY0Ypat4sflfr5lgh/pc6hB4OsyY6CKjlFN3KRof6W
 hUFAsI7qPVYQStg5pkzJwKzzh5Q35IjV0qHCRAnUQS1hgzr//QXZ5BedA
 Z6tWv4hisAK11gE4ApI+in4VzGEMYVH2YTpoQowqKlIRYngclBsR17vcJ
 YyJ8iaaoOFxPCn0hB6aTHXEADM3jIySq9uRv8WtZQcec/BeVPVHxYH4m1 A==;
X-CSE-ConnectionGUID: peHA9xxMRv+36yu4+cQ/Ag==
X-CSE-MsgGUID: p5iCF267SYuPch7Ud2Kysg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87412844"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="87412844"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 14:31:41 -0700
X-CSE-ConnectionGUID: KYjtUa+4Sge/9LMHE6QMQw==
X-CSE-MsgGUID: qia36QW2QfqZ54LiL9mGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230914417"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 14:31:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 14:31:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 14:31:39 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 14:31:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJk4/N/ieanazsK9rPNv4KJzECjt5aS4AG6/WGQnoEN40GWkRKSDgZO7b/uMK1n0BMBJegpK38H069aDPE7Bd+xjdO8d6kN7R0r8iLGHXqAWXPsFVMbwkY1f6GgMjJSV+5TWPvxRsdpvOK1fDRgIKWBocHGOtZ0saT5WWZQc1ncZntuuhYsIq2dRMxZ9T7FRv0boDNmYZFuMkCXrDgTOITYxWBnKoZHd7/cFzbL48wq2+pHEnzoLDWYUZMqYV6jbf63TGlXW13x0dVno/GL2ZlRW0M6ErraLMepRCdvRgblkbydejtZf4ommN/The3NDA4gyoMkCiRytN6juu1k3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR4kvqb1Qo2n1tgw0FqLkcFOcuRAXwRQwbStf3AFU7o=;
 b=Mlq8NdM+lGGkzkL4Xlxm7JQRuzgNVbV8oTzG3cQcSNGBy75f+v8aP2CswLz4UQPWXgBC9uBy79d2YQshczRr7o6Vl3Zxf0+wLJ9SiH9n9SbVojUNBjy/ItHqIhxCmd/PMJ68IhDJO/UPQQ6vFjYfxezZv2nRgbgWoUTGt5bt5V3t070msZ0woiPgwHHExl1I64UGy+7FPKEPvgYXLrVGSvIuBF0DnQNwuMXlXye8zvC7feJG1MIdUKpwqv7+5B7BeTOj1+yb95PVJxb1Z07Jtdv6zqoFd/bW7she+cdHXzWqyox6V9a780LHcavpGyDzf/lHUq1rsCtUPxov6ax2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7085.namprd11.prod.outlook.com (2603:10b6:806:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 21:31:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 21:31:35 +0000
Date: Tue, 31 Mar 2026 14:31:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Apply WA_14026999295 to engine (rev2)
Message-ID: <20260331213133.GN2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260327102414.780515-2-mallesh.koujalagi@intel.com>
 <177466673607.409269.16441938615995227291@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177466673607.409269.16441938615995227291@a3b018990fe9>
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: f48571c3-4a9e-4d79-5641-08de8f6ce26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: jDlk8DTGpPRUUiRNDL2/amdcPQSHcPZq1IyRIp0EVuZJkTXzuMhgJGYCjKxpvvmmthsjOhwZdHXeFwHsP11TVMIDwt/BJzQ4JJZK3J2gBKdzP5l2OQMThmKqMBpBxHCIq7Nj5FwpKTW0Tc0YZm70v74kruGrVAvKq8TOPsPxjq/uPmNFp/Jy8dG/LVJMAhbXSsya7goUoWNcd6CsWAVHED7K3nX0q2RxuAb99eT72uZw/VgFmLbqezXkj5lEuWxVGo/cH0ftqKUKb1MExGlKgad4MfjOfc6LvOpHFjMREBQNPk2lX2FDFxvGqgGZR5Z5EB4vu2bByh7iF84/QCBT9jVF4lwe5hN9O3Ak4thu4x57TEE9+tdnHY/7mdY8QjjUXSQ8pcbAipwW5hSwLVTfPuOyS1m69GD3HIYvlmbXaCwl8bOo5knIWjerR7kfiTMa5XVb6cBuNZHrGK+L+aj6pS4xsgkYyzniHfHCNF3/xz8gAnvsPfve5ESGDEhHhgoPY9uF+U7c/0DLG1Ce0tbWft2mW/QsBFphs1BVWixcXP2uugndp7ba21tgoiEYCGIdpqxSN5SvDC8Q5RyG6pwHwR2ezXhpCQqpv+TjF5Zb2zX7f8EBF7EOL5ZZZubVzcAC1ayv6kk1ETR9axlmhdthEZhgyyX15Xj+QivMtsQspM0GPmi77K/zLlmOxuL/6m6Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFgECLwVoOD7HrcFK9FC30ngdfjcyqtOBI3RLi8oH+Eis5m69lkDBnfb9DBs?=
 =?us-ascii?Q?Y8taaJyBO1BKo6zdOocXfUt41ayuw/b4oiGBtJhMPTSo3g+AwsABU+wTf6Vr?=
 =?us-ascii?Q?yZkAMjIzHI46SxiZ67t0DY6AblnM9G1kxCPxBzNxYJkvB2LcC9w55VaQY+/C?=
 =?us-ascii?Q?lw0LTU3T/tNPnjklcDoFsrNDsuTxmqBl42w1P4qai+K1dL5nhzpgsp2hG61X?=
 =?us-ascii?Q?EZkE3BEDZuZrd4KdFS648nYcQnxrpP+G2YEXuK3uW6SCcoVhDXDIUowozXiP?=
 =?us-ascii?Q?mDlmgwGwoTSLf/qhdIDNkVQDf4lP+w1ebb48lcAOK/pkPICz40iVZga3QDxO?=
 =?us-ascii?Q?WyspETCbI/TpN8j2J3+ImrgGKcAXvnRjviSxLaj/ekp4vpeJMHt7HqaZ6hJf?=
 =?us-ascii?Q?+Iyyo0aoBgMwpfieC8KdVVo8acTMtE/DPBs97aT7AeRWbbxKQlKIhwus47fZ?=
 =?us-ascii?Q?HfFdphpxqHoKXHhmL5W6iVYslhDwNXHVujuWajYVTwOdzz3oRVEFLB+HtUIu?=
 =?us-ascii?Q?bfD4MSaeFBdeG4xZnTTpoD7Y3zwJImsanFbCELfExq3uqslJgryJQ1vgpbwm?=
 =?us-ascii?Q?4pzxaQ7RLdNZHCU30ygIUjXGdYA1oi2NNnmVuyR8NBLZ2wQgRkXaZzA3/lha?=
 =?us-ascii?Q?vbThjsncsA54u6T8DLFOIPqj2AezdNxVOwjrJmlnxMQ1IQ0Davw7RrzS08Cj?=
 =?us-ascii?Q?te4CEjvX3TxvFY3kZODmYBXHERxzd92r4DeMuBLXTbXWrDgJBomkztdauJ8l?=
 =?us-ascii?Q?UWOXfRw5EUt6fdtqOcR7JEcRcD05GNqmmScCeA+579jn7KgAwalLn7XzeLcL?=
 =?us-ascii?Q?JB4tIgdaaqwsvVU0Rl5YW6Ik9mR2z7x008wwxsThaJdHck82SjNHyLGyxLFG?=
 =?us-ascii?Q?QN9TC8kiq9nWn/+vMRyIamCiQIVtm12Mgb8iypdT93L2G2aGM5UJp7cDUEgd?=
 =?us-ascii?Q?qYNSEt5Eslk43cz/8oLGzO1AA8QRG8/Fr9EsCALXRlln05zRLNTfmduM1bEd?=
 =?us-ascii?Q?DNTJAFiWWlVMBrf59GCqz/a4Daur9IZ+2Qw0GLYYOMef1uzMLIlOKH5ao+Eu?=
 =?us-ascii?Q?mef0A57K5IXLUJx8fyP/HeaRdbm0BvhCyHmIikb9WDvwNgFH03Aksgvx5EZD?=
 =?us-ascii?Q?wRESVfqfBdpUkXlC9oP6CGIQqik2CO+kChpH6gVEVpEVNXJioypS5I6oB4Lp?=
 =?us-ascii?Q?OYcBMTWfjyXpNF2y2ooV6RVkugjpFzx4HWaea//uFa5UWMaTq2Byxf4jNWtA?=
 =?us-ascii?Q?rHJXQ5doq18AIPQrUdmxsVad+TeYM6nCnLG1uJWQ2TlMAPcXCg/hdwvhSQMN?=
 =?us-ascii?Q?EK5nbjleUHCx2O9KEzGJ1cSxfJaq1Ox1ip2xkMK8jZdF1q4scE9HxQW4SLJ4?=
 =?us-ascii?Q?tY5OPec35tI7gBOyai5IDtDzfgFWF5WaLjwySG0yfKrmHgTpJjinv/vApzDT?=
 =?us-ascii?Q?kdsXAyrQYP5tNYFqAHOaFAM6kD1Mmej8ITj0BDQi4Om2RO9mDouEp6F+5iBa?=
 =?us-ascii?Q?n7vkhG3Q6HxNoRpUSVfU907fxXQoDrhRZNzEZT3ORZc6K9bskUY5yqQFGVl1?=
 =?us-ascii?Q?BCmHAAAnklN2v7EM6stIM/hDFCCuHVF2j17mlB5BS2zEviizLD/aPfa7rZg9?=
 =?us-ascii?Q?ZNWIjRvuMfL3xFl4bRVODfWCGZxeM4wUQxYOgfAJPcHb4wvQoqZG13ncYT4o?=
 =?us-ascii?Q?+2lkH8nnQ0D2Q159tn33Uu1bcf3TrvMbFYVPXbxEKW2TRRpkDDJiSmAtMooR?=
 =?us-ascii?Q?qaU/A8gNO2fThlXXzYpO1FQsmS5gNPM=3D?=
X-Exchange-RoutingPolicyChecked: Bu7k33d/+8zYbnZHYZ1gqH6wcU2Ik4+PgwFDA4uwMYEF/QKuimYA607T2dgkK0T2A0EADWFinORbAzPpA1NI/itAKc7+Qvv6l/3Hc3TSn8lJo556OFce96E+H7Ni951h27oZZEFKU1B33NOdE1zqjEJbq1BdQ5UnWc3w1RBeCO6770rsTeh5vARo/FjK0nzMy0j07L2p9aUMlIjVTKyHpQChc8DTYY0BU9Yzoct71ILa7BXKgVKxVIkR7Es1mB7/SYO4eUTw+PbzwYzjdJkIELEAwMRgxwxSXBDWkocraVBBtQOzsWJgTayk8dxBGmpmJI7yIAymdU17CggHqpk+CA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f48571c3-4a9e-4d79-5641-08de8f6ce26e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 21:31:35.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwAxOfdB1yhv4i2nBPMyqJIJF6IeqPa7xDBsm31PxPIzw3ZK35x+coZN69uSZ8Ufb2iF3T/b1/014qIkmcsIR9D8BESsZNefsYwwdnIaNeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7085
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

On Sat, Mar 28, 2026 at 02:58:56AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Apply WA_14026999295 to engine (rev2)
> URL   : https://patchwork.freedesktop.org/series/163825/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4804-a748e8ef327c92c865410957509417b30f026304_FULL -> xe-pw-163825v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-163825v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-163825v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-163825v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@many-large-execqueues-free-madvise:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4804-a748e8ef327c92c865410957509417b30f026304/shard-lnl-3/igt@xe_exec_system_allocator@many-large-execqueues-free-madvise.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163825v2/shard-lnl-7/igt@xe_exec_system_allocator@many-large-execqueues-free-madvise.html

Unexplained incomplete; no errors in log.  But unrelated to this
workaround, which is only active on CRI platforms with graphics version
35.11.  The workaround also deals with EU execution, and this IGT test
doesn't submit any work to the EUs.

> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4804-a748e8ef327c92c865410957509417b30f026304/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163825v2/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

The test seems to be failing due to some unhandled pagefaults (and
subsequent engine reset) on one of the VCS media engines.  The failure
is unrelated to this workaround (as above, a CRI workaround couldn't
impact LNL execution).


Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-4804-a748e8ef327c92c865410957509417b30f026304_FULL and xe-pw-163825v2_FULL:
> 
> ### New IGT tests (5) ###
> 
>   * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.02] s
> 
>   
> 
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4804-a748e8ef327c92c865410957509417b30f026304 -> xe-pw-163825v2
> 
>   IGT_8834: 8834
>   xe-4804-a748e8ef327c92c865410957509417b30f026304: a748e8ef327c92c865410957509417b30f026304
>   xe-pw-163825v2: 163825v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163825v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
