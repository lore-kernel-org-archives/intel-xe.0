Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0420CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 21:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDF510E70B;
	Tue,  7 Oct 2025 21:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MASRATAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07AF10E70B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759874108; x=1791410108;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O7FF73K47hbVlG1J99Uyr4pa+F753IXpf5eeQInRix4=;
 b=MASRATAtot3oEhlxCM8MmUQj8LzAjFt67ByVdTZIYEoKWpi7vCeuhDn6
 XWMtGGq6ZgJ5mFZG7ZfD79nEGz8yb+Fd8z7JbsceGO8AEsTyAZ2KtGP5V
 tuTA3z1qa+dBHBGLXo7H/a/PGrrudzJWD/jXD6iycfhQHUwUq0t2BxQUD
 V8wV9TrloXFFgP9ckCcC5lRKBjolvs5VxBGshKFL6YJ8p9y3JsWi0DVYo
 ceSZc+znX2NMNy881/Orcz4c58jvMPwyrbtFcVq437IRvbdh3IaezbQJg
 8OQxqc/22Gmf34WL6lcGHh2xOSD0IXNy29A8f95io2HVo09aZ+8ldiIU0 Q==;
X-CSE-ConnectionGUID: v8IbO99aR5Szn3OJbL1rfg==
X-CSE-MsgGUID: k1XVcEKUTECYtKXUT507ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65893176"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65893176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 14:55:08 -0700
X-CSE-ConnectionGUID: Mnw37c4sSWGqzgIo7Fpiww==
X-CSE-MsgGUID: MKNv1JSOSU+1PTYV0d7JhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="180687887"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 14:55:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 14:55:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 14:55:06 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 14:55:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGuXGKT02IwQe6I86pMDGidaAAemcxH4sY1P2Xv+C3BFs3c6hhbwdAKSzhTkCHxiR/fjIys5ZbxBqS0kxfxgInrl54rN2sMv50ePinFaJJvRk7FmfyxOloaLGlhL68IVt1j8U+OL/unhr01BV0JLw+srpPeXbMGCh12UxGesmKw1H/i7t+pIq/d/Ys+a+FDqjytiKclA21WE9tCXye2k2Yjx56V/jZJSzO0t+56zO0wGX00nln9Rt3NIEsLgdAJVZ16jUKIpXItyJl/LClTW3y5DGDFvBfPky0yaycT5kJ3fAwxmbw5k3cxxaq6AFUcqErmtSygNoVypjQJnWn8XrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQsgzNPuaLpB9Ou0TA03QOJaesQJQQCdyWcmpWHE7Tk=;
 b=q74z7wUd2pI6tdWmlkumMtF8IWnwEdQKYeN+Ce3M5JYav3vV5RyY9vRvCG4NoqaJmNkhqts4HHCOlnc6Ub8qVRrjMd4EEhwkCsi/GBphuOb8iuRCiPdnsOtwPiwwgd6ZHJyrIWvOp6Jplazw+IRrikwCfTQ0iljSiayZMjHK5S8XH2gZiHRetrH8qBT2PCp2y4CecQm+pb7ysOJNQNFUPct6BmH55W9suuIeYxMsDFYPW5VRg2E6tzSrQo6pa8p2uMFodzW7cVM5TF7x6tTJal6zKSMm8u+0+KzAPCOV+RCAHW+QC7bzZRF4apRFPeQTpE5wozq7aewmu7xyTBzmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Tue, 7 Oct 2025 21:54:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 21:54:59 +0000
Date: Tue, 7 Oct 2025 16:54:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 04/23] drm/xe: Move 'vm_max_level' flag back to
 platform descriptor
Message-ID: <xgmjl7xufunq24nmdib5wuzskumkzltmvwu4p5jgcfyasjbfaf@mwmhuvzclqcg>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-29-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251007204829.1468209-29-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f2362c-b5ef-40b0-508b-08de05ec28dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QUUHhShFFQPv1iemLan9Sun+NL/ffxGjnu4970OpIO9Fjm4WLZrZFSyjZMUP?=
 =?us-ascii?Q?ADisTu8rHIno61nWsein5fD64hqXTDYRojLonpMhhazqnEX7BzrAVD3Kdg05?=
 =?us-ascii?Q?tCIvCZIfO9e+pRDAeDW1PHdHcw3N3hlD8iXJtlkR5VV9bDrni7mfg5y1QKg9?=
 =?us-ascii?Q?IyOzwvnZ8MbZQ2swZgkha7SWDJDApisOSiTDyjcXk5j8Z7daSFgeMsEJJvWr?=
 =?us-ascii?Q?HaJI3WlrDBmNFfhpmHHQavhfe3pMbZ38DhW7iH/UkjCu/9WZhrSzoHdJW4SG?=
 =?us-ascii?Q?9qNKVglwokKhwkMgKelNX7wGj0INkM7v9TLuuhTPyw8rQrPzGah5HQ2mPnFU?=
 =?us-ascii?Q?ZCuYQEjjcnn/Fd1r0mStIw8+/dcwhALw0EEq489v+FZWW3z3YugCmauEyLp9?=
 =?us-ascii?Q?euyFWACD+Rzx0TXifXhUAf9iyF8kNFpT8gxG46nnPXwdTcy5JiEYwQ1ANNWG?=
 =?us-ascii?Q?WYI5Bk4uQ8wqW7tIkpmd+8xD99QbzppvYXLEmcw9alyyHMxnFVCq8w7PSbHw?=
 =?us-ascii?Q?ybxet+D5RGO1CrI/BRiRP2ATF7K4jVz4YaBCMGeMgJOC+yj1jvCw1oH+NE4A?=
 =?us-ascii?Q?D9EoffnO+FJFgEUsAMy0F9MIplNCy3q5YdjeqZkrZAqjmi75omtXC0XF9qvP?=
 =?us-ascii?Q?qU5F8NsjQLl0WM59NT0LjfhWEnDUSLUxxCNZDmcJ2BUlpUifH54kf5fslmLz?=
 =?us-ascii?Q?oIhT11c263eUMpCcK73y1qxRs5T57F3L0cz6tD7tpSJXMFjpJePbQtBkPOKn?=
 =?us-ascii?Q?B60JYmb2ZOGSp97EYRBNkmthGvvmJ4MVLt/DaEb4/2qwotyI8l3jDPuLu78f?=
 =?us-ascii?Q?isjaSqGMfJckI8OL4Ku1Qxvd9tQ6Mg7K6D1ftxtcPoB6t7EcNoVJZtQCn0dG?=
 =?us-ascii?Q?HpWgN2IZFg2QElJlPa9ZoJ8L3PVdH3a6oelciTlwizFTMQ0hmTZxJKt8C4HA?=
 =?us-ascii?Q?DaC4C9w791Wo4lAJjHbRiru1TXSfsYfvSH5YIb/nXt+eBobqLS8XeI8l4I6s?=
 =?us-ascii?Q?z+RWAJE97xpNeM+DHoyabLDQg8nSXFT5hs/jYo2JgzVKVz2l48eew8FwSLFz?=
 =?us-ascii?Q?StLvEfzkznxvuGsoGbS9jQjxVyWbL/hTtHtmTC3IquCBxpjIVBnxJueeTOAa?=
 =?us-ascii?Q?gbp7FI+EUzZDiIwb9aeZTncoCpuBS9H9P60OzZSPodBXn0YGxc7Msn3kZA2l?=
 =?us-ascii?Q?SyLLJhFlFMud7ao3qJ8uQLgAHg2L0EQaXxaeGobAKhwmD7Mj7EMVVP7xMnzJ?=
 =?us-ascii?Q?p9uk1kTZHDuND+5QI0fZhiWXsrLpOzoPMXTUo19wSx8jI9YZu4gs4AMVFT5N?=
 =?us-ascii?Q?lzlURzAtNkE8XosbDmNwzTla3mOUO+go7qMkelEUcTHfx3Szvdy/43+1UvG1?=
 =?us-ascii?Q?p/pDy6aQA3RCpW9MGrgV6NbcSYJi5mm0lX1kIcFw+ODuBhmR7UllYkjOOMT8?=
 =?us-ascii?Q?fxKZqqFTMnt1wTCc6nllQmFacuNNb45bY9IV0jVeZ0bt87uM3/Zlv7jRZS5B?=
 =?us-ascii?Q?pFDyCJlEOjmLJ7dPOxi2zxiaNPebrGyxebv0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pEVmWABtSVUgPk5Zjxjh97jEqFz6OY4q/6pz/bQT8d6pnXA8hoUNb3vq64qo?=
 =?us-ascii?Q?SRDDsYOkoDWF2XI9Aoy8O8t2Lm1HnehtgvE8btGVNHo7ZLhVR/ljxVrxOXk9?=
 =?us-ascii?Q?2uQg8UAcAh54vd2UWNqcl/dpwJRrYoinTLgTojopYC9VfZem4DPT3C3Z4fcA?=
 =?us-ascii?Q?rC59hXi7775QvBRqpnF/NtIbP6i4gK6WB+1m76ZMbxJHeejVkyXmribSi6Eh?=
 =?us-ascii?Q?0m/jolcMvRlgJ5Uph2SOaZaN76yAbnnQuZd3TrH5xbWX9Gjt9JD1Ac9qy3dV?=
 =?us-ascii?Q?4iLGTJQdjbxLOr6LVuzfQRMSgF73S9sfXq30Bdzotb29vnA7phUZPLkv2p9A?=
 =?us-ascii?Q?88JqsKazNwUFDj38jd19G0wzebuhZHRUnG1qRH1C3cZcvw0N2JAaVbgTTstk?=
 =?us-ascii?Q?GxCbP50f7J1Ry6CFfu9ZVknRjGz5kZwUTm8WBszX81HcchNfYENuVjDrJMK0?=
 =?us-ascii?Q?Lh4eeTG0bchyf7BEZ5i2iU9i4iq5saHgV2fWqSN/uLiNXqnHHtzAsSKKImf2?=
 =?us-ascii?Q?7WuQoTyGrq+ni9pYO2kyJryRbtvrKL5nHq4QeAbfqoFgY3iXmuYP5Vv2Vo+b?=
 =?us-ascii?Q?YZd7p4v5XtJ8YIA7RhXLg+5t2lX6cksZLW+ny16R5poaPPEY6jDz+ycZw8D6?=
 =?us-ascii?Q?A0EI0ufDIp39oVXztH0/K2W98C7zTy1Q7QJa0IfOPWPRuJWHJJ7oqpkfSiH3?=
 =?us-ascii?Q?toK2Wi1H7Vk9kf4LYT+Ve+Z4O/1yuIfcey5dGq5aGsKTetVRnZAFNpCp4n0H?=
 =?us-ascii?Q?kPZ9XxFJh0QqMQEjVxdSfk60KRpw7PmlYvoK/+Jt3qIg6o5fchO/qCYo6DJb?=
 =?us-ascii?Q?nYgTFsKbB50dQ7cxYITOJXdzwzwoolwsmLkIbntkshP/obVEQsFNxnrUdCig?=
 =?us-ascii?Q?EpBhmErAea3KWOXYyBm0xP2mbSo9BY09mJ+dppn7SkTNHUCZN0bTFJSiR+TG?=
 =?us-ascii?Q?8e1rnZLQmv8APsbbuwnQAh1DJfzvMX9vNyeqC1vfj4e8qrKLkQmHAGfUgoD5?=
 =?us-ascii?Q?OC7wNc+azluphsLbmbeKQIfZGVO52fJ8U5sGUDAxYXuJM16lBxN9nuRD1Q4C?=
 =?us-ascii?Q?PTbaZlLA4ScbwbsaYJL89eLu+Z4VfU6zQ6Ysv6JlQpHK8bYCBwUSDwjnKt26?=
 =?us-ascii?Q?9wIJKRA8wKQ7NMsURr21R8wgIo/F+ko7G0j6yGDcCsfL/+rV23TS33NiktdS?=
 =?us-ascii?Q?Ou9sO+cZXL7d7xjccknRlJYRMDB4xnTQXGsBLvlG0C8zMGv8byv8lbirCVdI?=
 =?us-ascii?Q?jxXp24AYTttgvVlqfsc0xAZj/xZwhwXZhBrvKmP0FpjsfJqf/l9H6LvgcCPE?=
 =?us-ascii?Q?9G+XTrsN6FBHRWAiECJh5gWfXxwPgZhZLbL3NOHYtFtmNn/nRvmhRAHt0qgb?=
 =?us-ascii?Q?Ctaq+YqiHa6Y7EwPJjJYLBofvWjgVvkp2Nw2G1SR4cznQraEeSXbF1q1yvWD?=
 =?us-ascii?Q?jktgTlV/FV40YOyh6Z7MopPgcwO7JBFqtrmHnh+WfnoNeVAhSwzT32xNo+Ac?=
 =?us-ascii?Q?LI+dnMHHTBdnCHg0w21ceDgPkG389BmuFbK3H5HOomplwZefccPaIV3p+0z0?=
 =?us-ascii?Q?z+jxFIL50SVVojGDgKRsmBcG84McYYo48Vi1NDKg9omqsIP8a/YPE4mhqOf5?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f2362c-b5ef-40b0-508b-08de05ec28dc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 21:54:59.1005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdeXN/zDeW6ec9gXO8vM1laftpKcsBVFRAyPyPmAACWjA9mFKCd8GFy+a6y3nbFeKYPdAUoOQ+eQGoNXAvpu+Ec1Sa41MAIKL/MsdZgnyoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
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

On Tue, Oct 07, 2025 at 01:48:34PM -0700, Matt Roper wrote:
>The number of page table levels for PPGTT virtual addresses is something
>that should be tracked at the platform level rather than the IP level.
>Even when mixing and matching various graphics, media, and display IP
>blocks, the platform as a whole has to have consistent page table
>handling.  This is also a trait that should be tied to the platform even
>if the graphics IP itself is not present (e.g., if we disable the
>primary GT via configfs).
>
>v2:
> - Drop default value of 4 and explicitly set the value in each platform
>   descriptor.  (Lucas)
>v3:
> - Drop outdated code comment and commit message paragraph about default
>   value.  (Gustavo)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
