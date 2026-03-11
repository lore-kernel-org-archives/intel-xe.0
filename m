Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AD91125811
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 18:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F4E10E118;
	Wed, 11 Mar 2026 18:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CW3rXVtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA24110E118;
 Wed, 11 Mar 2026 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773252094; x=1804788094;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i4t5KdmyMp5vigyDOwfVWc/e2OGWuk/F6S2Ejg+1XUI=;
 b=CW3rXVtt8C8VRnwEmWRtDumeweNtKlInxIPaz8xmeDuRnwZipas/wis6
 u0AXUSRoabPKbzMp3iRH284fOytSfOBDDM0pbMMecOL9udX29hlBNfwp/
 LGJO2XoGKzl+WFUCGCG8V2kg0MeuM1B8zhjGfsYuXPnvoU0LNdCIcH0d0
 qPgN1nRmDMF7SCnu8AZjcLa68rxtFdzPlwbCS6cc251xlhy7jHoUo/bDF
 xwQlCyifEkCGJklzVWrCS9tF6I/HDQOsxbCILsKvhptTwmpYkuGjqiUK/
 W+Ceh8ar3nLtThoLxYOw0d7GJyvsfIh/3ynGvtJoFx8+tCjWdQ2faEDJU Q==;
X-CSE-ConnectionGUID: ZixRVHBcRduAGjI9b4a9Kw==
X-CSE-MsgGUID: OGmb7QBGQFa099/Ghw/mUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74209119"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74209119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:01:33 -0700
X-CSE-ConnectionGUID: VtwrKn/OQB6i0bYF2p9xEQ==
X-CSE-MsgGUID: +F2nRFpCSLG+3DY1gDyx7w==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:01:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:01:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 11:01:31 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:01:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPuQG/sow6fJTO/iVuHqYM2Xd6Iz24pFw1vTA37hOwRPKEj/az1i43saoozngxzkOjThZMAC0sJPz3hEqkj6WoU6RwzYzAyuwLP+cALCNjRrdI9KOPJPt9EMZBbej85zICpUMB1fbah5AYT0gB1T/f+Wn8EcbBQwe3pyn4WA69Ga56kcBVab1thBLU9v7+bT1mC6DHOuaKrqT8Zbt6crp+86uKq7hvWUV57VUV3RJ35LLNL+1U2CYLYtOPix+XoddZWoku2uUWNsUsVscZVp/9WuF1AvnQEvQPqEbGEXhsmY7VQga5WQFgFMvj8rzU4lY8Uz787b/rOCJXWRw7YhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/F1j+WVjLrTI/q4EQHo/Cq5eG/Iyv5o7Vo8x0lb2Cw=;
 b=RaSOScD2mXhi411vSIIKq+JPULwHgKV/0w5TMWTcwMwDF1PiSqD/w0o+VZr3bRQQ3hSpnjpOCyDRqX8POHKsHdH3eH2KgeRRRigskzIK3XE11UY9qvZuNYfcLomtTnaL29NZRKG8+Zc0MXfnjEY+qFRJQsGDeuJfVZOHV9QuT0d/k3JvPIlvXtndhycaBcA0Q4TwUNs5a6hJIvtk9W2ZUk6AePBEqMdKkTNRiymYKaACL+oRfjoYgBu0CfdfM+G1UvgB2d1HAsJqbX33uxTMFVFi92xNhU8MwMhDwucbSkJIgXRyGD2i3iohuEwlRy3pH+y881mEfhfhajZxu8e4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN6PR11MB8218.namprd11.prod.outlook.com (2603:10b6:208:47c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 18:01:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 18:01:26 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/xe/pat:
 Extract gt_pta_entry() (rev2)
In-Reply-To: <177287222087.329859.4994921296171540649@a3b018990fe9>
References: <20260303-pat-gt_pta_entry-v1-1-0dee8e1e7bd9@intel.com>
 <177287222087.329859.4994921296171540649@a3b018990fe9>
Date: Wed, 11 Mar 2026 15:01:21 -0300
Message-ID: <87pl5a5jpq.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN6PR11MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b10d2bf-fb7e-433b-2bdd-08de7f983665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7aVpzjKERrMb3xQ6zGHZeKVaTIOgnAp5R9+KVB1JwZ6ZXAIb5a1K1JNe7EyczayKpCaojJHBKWMplje+Fj5Ef7XkeVRbmd7wH4RrFEvaXDCfo+N5K3S5p9ZHbSLKkzaap197/WLtGcyN175U1yziGHO9zbU3BuHM38dEjjhbVez9CZhRJYA3qnKhrfaZtQon/0Ah41HIsVqkSJKFytlwClSe40r4sgBqQHbmB8qYXZ1ZNztIEBgrUiTCn3Be3gg7RdJNj8PUBNeGyB+zmAtDG7zLxVE55ynxMaGgwFUAVSQadIOUPJV1c2JhlDx1s0dtouc7Jd+j6UDiERRLN1X8Pi5c6R8EVsAMcIxaWOVx6T+H6378VZNUz5T7xbg62JbNuhWl2ByYd22XUV5f5oIRCwSP2N+XMQcK6gMlj2IuDDtmTyovMyLDpiyV2tsV1omjS6JAa1szabQQ9knj5rrazTYfMp+Igvm0A/DvSYxA0MfwnsD9fVkn31gq9AmwpUEPQAaI3Alyh/ic+IIoLcuNg20ZkW4fW0gu1Czz6Jl/juIgYbrwyA4nH+A0mbghQuuw2t7etS0djWZl8X7aUCIo85wmGGrTamwPLDDtJvDzt+iLvAsmvqz5FgYzldtxItHWHI3x78Iv+GDaMfzxE1+XQCYkJnBzhKI4xSfHgS3o2MzVKGhATpuXgpW2FLycVToh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XMuXoEW/mAyuDRcK9muPBnBn6UczmwrDbCxwmuVDOh8pVulbblgZm+q6m9JY?=
 =?us-ascii?Q?gq4ZJn5UGn3px5AtKHZY0znFVATWgg6jwFh0ew8/v1w8dCCxKPRhyNXeL4U6?=
 =?us-ascii?Q?BKXc5cD9P62xmEzZBNN4PP84JRo224J+2Rp77JDuYlRYZlV2UYfU0Ti9ITdU?=
 =?us-ascii?Q?EtiQPoZ6ZKRpcFwIKNT4Bs9TVZYpflo4xO34ijyuz/P7qFjFJcNF5dSNHxen?=
 =?us-ascii?Q?2zJuplYs7GClkJIY06CmKImUTcKX8llYk0q3m5JrpROzEdzKvfiDUgc+QOCc?=
 =?us-ascii?Q?J8F/s9oxBPZGPSeEI38hXE7jSpfD9YmKQM4QzCGqAs8ozcDdLeBYNfk8iioa?=
 =?us-ascii?Q?qeuUpoJmZC+5+1NHHwO59n9FrqZDAl8hky5uJx1go6PQ5xrzo29Biy6BIb8p?=
 =?us-ascii?Q?23kbQCxoFck6B6G3zdO2/DxVl4HdqHnIUZGHqjqolO8Gvcf6Miwm2EGSa4pF?=
 =?us-ascii?Q?8xWWNDUrQ/7DWV2RGdoZ10M47MqFdYN0l6W1pPQ4RcFwpyXSt2dFB/H+ehBT?=
 =?us-ascii?Q?HUm/iBDqODO5nnXkVs0JXT7I7pBnhzspbaSrsuqoKh4gG/bVNscEqgb5Bkjw?=
 =?us-ascii?Q?Y9ChsFSXUp60e2eKfLMpIs8Trdy+ebqXlSaJuTFTboYfYo7HDJw6nxxHHrnA?=
 =?us-ascii?Q?dIXSHw+Fq9AoHfg7Jamk89ezl+OLc/O28/1nbXaJUNNgtCMBq2j4zINysNRn?=
 =?us-ascii?Q?2QPn8UKSrcVFJji2AmShaIoMmgIvHs+YdcUVmFMMya/vI7Ho1Q/PYYKwf4Xs?=
 =?us-ascii?Q?zTVmTQrJlvBxW82broZs6TItWQO5NohTfVHKrPyqmWP5AtN5O8k1EoSHF8lh?=
 =?us-ascii?Q?GVC2pOWtZg1iXid2X49dvJtwVdaOnEvwumNokWFyyLPQ6FnrjXKiETdz0hxE?=
 =?us-ascii?Q?GNBXtF+KD1vBeZ1F0YRQMOzxP8jf3Ag4yo/bNHczRs+QyXMqoEw36lTF5Wvd?=
 =?us-ascii?Q?Ab2YGuin295/rDFQPbSZ1Qs5byVhzHQrnJjEbsHTN0o1bu4qp9sjeGXknBV4?=
 =?us-ascii?Q?QBRBRibf/b1lYiBmj4rMnKDTG+pR1n9MvZDf0DgHCxjPIO6G2V/HHZN6eGZP?=
 =?us-ascii?Q?ybbRvxBmY+oWNwOnU+UxcZWERo7MMlNgqh+9vEikkEsJGeE1ghAli2qjrwxo?=
 =?us-ascii?Q?InTImLQTgnt5uOjyBxxLUj2gTMl3hmHogPwnVf4rN+snbal0wJp/c4n4gGMQ?=
 =?us-ascii?Q?DWPjHey3lthxh8YwMOgrtXQlxO4M2d/nFeLZvoSQ4cARBlINm3adl74TwfXv?=
 =?us-ascii?Q?xuG7+WgBW/NaCBjM3IxNthsD4xK/+MREx29hXSzcCH4ouRpIqNoEq1g2AocQ?=
 =?us-ascii?Q?SDRgeXbC4m/6X0NPYkG1paqCTCPf48dpNhbeVGBQQDqdPC7ZXF517zjTqNc9?=
 =?us-ascii?Q?1KNlRZWz2cLHdi6DuA6vGdz+ZRiZFqW4XfgX3MlVr0260OOa/J6DQeRwCshr?=
 =?us-ascii?Q?NJ+iVd2dduR7XRnc2TZLbjibKM9TQjPcT7uNcethTRedl99XQrvzpn0U8TSe?=
 =?us-ascii?Q?KexZF9kp/5MqcqawSKWahKsVjvPzOOT1vW7A6A9i5TLXduP8jAlQUhsxv7nl?=
 =?us-ascii?Q?zQnBZjdX6E/YnOsELSE7Ifj53hdPZmgJ49p3pm7oezknrKU+52jHFPwu8Q0j?=
 =?us-ascii?Q?B5BAeXlUa++Z2t1w65rzyLyc4FyZLWRKM31+ZQYyo5466prpfim4hizBXu//?=
 =?us-ascii?Q?cCa76cyQbkob22D7Wq8qXkeEQwfDqTYDLm8YGybZdlFt/efQKA7CQX+QwOjk?=
 =?us-ascii?Q?uav/y9ajlw=3D=3D?=
X-Exchange-RoutingPolicyChecked: kt/0JbEZw1e0RjYLvP9uqLN7xJuZO0vNSqj7EZvX3v076EfyzyzFEshJpxZRVc6hQHgF8I74pZ5JumuejhiCP4bWWNilE9Shhjj29NeD/eekYDbrv1RRxxSBBceoQQ+g6nefJ0UOeVI3dEFTj4/Z9rV8ryQfQx+tFdy9sl3UrJi3iN3dgWWhQTLPe3kB4fYXIXgqaf8c8PCpNXIZi/w5fCOOwN5wB7QtwbPTtLBqIp6kqCc58JasrL2UN4NfOZS24EEzql7LFsvJnUL9PutvFB8a0D1cOLxydDV2IcRJkytzDKnAoc3PxIqcVgbJ/+iwvUTSUpeFSj98elDY3aG5GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b10d2bf-fb7e-433b-2bdd-08de7f983665
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:01:25.9612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21xFFEqu2SiZXOCJCCdrWa1NT0GJ5XZwqm5xOElzfNmAuPYM6KE1uXYOkQAlYPKw5Z0l5m66rkkvndht6F6KHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8218
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

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: drm/xe/pat: Extract gt_pta_entry() (rev2)
> URL   : https://patchwork.freedesktop.org/series/162522/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9_FULL -> xe-pw-162522v2_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-162522v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-162522v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-162522v2_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162522v2/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

Possibly related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7475.

>
>   * igt@xe_exec_system_allocator@many-stride-malloc-fork-read:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162522v2/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-fork-read.html

There has been a recent incomplete on a different subtest of
xe_exec_system_allocator:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7597.

>
>   * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
>     - shard-bmg:          [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162522v2/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

Related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7578

As we are not changing BMG's PTA_MODE in this patch and the above
failures were already observed in previous runs, they are unrelated to
this patch.

--
Gustavo Sousa
