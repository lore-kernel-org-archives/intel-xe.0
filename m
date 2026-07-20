Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A515C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 21:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5D10E1EE;
	Mon, 20 Jul 2026 21:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crw+KXUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA12210E1EE
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784583855; x=1816119855;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ORa304mOdcaSSro5KSx/EBM8n5vFVT6DABjzvLNU7Zs=;
 b=crw+KXUkPJz76SYhWW0tQxbSd73NouyMhNny/IKc4bpSVQYn9j+nDmqz
 44MM1NJzYtOGbG+blZ6Zxfo70lN8Hna+WwuBeIon/KzDENvhxbP6FFlGA
 TM+bVdYuiQ+fWDczmK8Faofvb3tpKb1/9XOwst3nM8YUnyDHWhXSaqhFh
 42B9kGJ3YxioHL8nGAHEf17scyxqVwROBLBCOx49TH3EhGY+rnQBIlQqa
 g9p+y+WCeHKu1FXeN6spTfJCIU3TE2+gQ8HLnNQTflHfr3Mv2IJmBVhmd
 lJqxHpjMOtD+8NeH4CFbb69ZAd3bnnksPrSQE/QUmQ8YP5HZusGEKCRpr A==;
X-CSE-ConnectionGUID: REqiTa41SSeLFMyr0aOJ6A==
X-CSE-MsgGUID: pnC5rOH7Q4S7G5T31kvizg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="87714554"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="87714554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 14:44:15 -0700
X-CSE-ConnectionGUID: pO0BkUz4TDuVVeKMqI8hfQ==
X-CSE-MsgGUID: SO+XjeYdRemTbpvxgPYmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="251233886"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 14:44:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 14:44:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 14:44:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.41)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 14:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmM4BG4VgcawKRMsLcBT5B5tL0TlU+11ddYZtV+1f0FtQYV01IiYtrEz7Q5zti6Qj97O7wpC22Y/cSlb9+yT4usZlKY/tKJnEuqVJ4sNbqUj9nh+p4ghxVPUBiJRt6BJVe6n4XU1+qE67R24OvfzCZke5i940cVz0w1ytSbJBimvOVRaeu0x8IsG5Z9SAtcavkP/p50NqsU9C/8d7tXU88EdQl8eqd4UGuDZ21wmrGY3W/F51WcejmbQAVUG4v3mmLP5ZMGEf2DWvJCBj9Th0UC6YUXaW2nG8jZ/uc/Xyjdh/mU61K2SJUBFwbLQMg+u1swXDQ1Hx1V3el2zVFd+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9JVnXwpfznK6AkNRt36Sq3hRNdneGLITDVhFTUMKHc=;
 b=b6fjO2XW3KkoT3/iDaGEKIyB/99gAbNIuZUcfqmyJCVitPs2o2rp/dSHzvmGt5j6MBiPocIy63UXBK+bPNzvN+JRCXQzIyiRdIMQnqvaYo5Bg+/mqAQd/RZxDN5epK1G1nWEYdT8UmOaNn/Hdgu3vZDyAGOU7hk2QfdWaT1tueYfqSMXjRQHXUAl0dw4xyqV/sUSucr//SZG31XZ0lDzrovHV5iegTRcr9WT78z+HElxX5haTHE6qASXlMEsThvVa5SFNoZfsv0BZkGxbg9WR4dUlQRnK8zJKtmRxfJYoe70kPzW9DZynSiHlXbNYnGYX00ePUA19Ygi7Asz1Uaqww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SAVPR11MB9550.namprd11.prod.outlook.com (2603:10b6:806:4e9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 21:44:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 21:44:11 +0000
Date: Mon, 20 Jul 2026 14:44:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/vf: Add drm_dev guards when detaching CCS
 read/write buffers
Message-ID: <al6WqEg1/+3ZNBBV@gsse-cloud1.jf.intel.com>
References: <20260720102604.1835784-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720102604.1835784-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SAVPR11MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e55755-0706-4f03-dbfa-08dee6a80904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: CAxOxuRaGNsbrhSXII91zcZ/mRlyHjbZKw8Q3lrWL3MXQ7XM4dHWXDAk8VV2WSk1pAdXtDHrQAz425AP4Os00rRz4J8wLWKRIKjxponO39fwPJuBlqW+hpNf0O9/He3zR5EjA9SJx4om8xaIyGgKgRP0YRFS0O5FcvoJYKxzGM9iISC8JYi8q7lgdyboepdiyjqMRw9sEF8iAyrOmvPmiqVy7qVUqn7XGRqQw9CObWUCcMMGpXzaWb09qrKt8xCTt7NN1pktMoFgwStU7T7+uowLxsSKJo/foHHSt2/7+9tSTnIlj+9JHej/AdHs18MCsmPdp6SaDb6ItfWdOtCxBoxRcnew6weNUjr5fPfO+BHKM3hlkTaZNiKKNTmXz/yZXuDlr7Gc/d8SOZ7Wt6lC/UoIeVrHOWVl4aKgUclvuP//ef4uDcgFeKufjk6OLWi9I2WQk3wyH/k4sZuEcmx5RTPUzGlcMfgU7URT67vDGROW7UlO1jEk7fjGJolrvWZw4CGU0JOE/thvVUJZc74HaM5XvnUV8wr7fMw5vPVa6IWHeICQGu432k/rVOmFOdK8pVlIYhuDfSDReEiptq6G4Xyzo2W/fxgZ+ZFjzB1IAssGUDbv2YZI9t/WQuy+hXk15gNfERMGNUyx8f06jMbqc1JT66YTSGeZNajmEd555PY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5CPF5cIhKwI6/6L+27tGeywC75d5APxi9/W6/EwXJtlj7FlwjwibHhx6Ig?=
 =?iso-8859-1?Q?BAlWJi2TSganI5bHCI1JfFLDy30ad9vQwZ9plyttU9wiVer6iOUPUolJbe?=
 =?iso-8859-1?Q?MKk9WNS7KajtnTBp649qoKn26F9P5UqCbsPVpPVUcQXHGCE3cVxMPY3vyx?=
 =?iso-8859-1?Q?j2S5PqhnYh7u6jWjfdK7wPjZz5AW31dPpgJ/7IMsVUfDd7IGm3FVHDBmyY?=
 =?iso-8859-1?Q?gxfd8rpgenGiW1vnnSllp106gADL7TyehHpU4yVNdwAI2FSAwyW1ub8ZBz?=
 =?iso-8859-1?Q?Iwgf+VBFIfgSgosqDoqjs7lC2Om3bd0knAVfW5fYqlpf+YS99JypPbQ8np?=
 =?iso-8859-1?Q?wauvaurRxhZwXJj06IWLUbX6mYcTKkhFl77a7jqYEjvhWYqYEfc0Xhps82?=
 =?iso-8859-1?Q?mUlzTgh3DOasf3u5pa5y4sHB76Y2EaO39trgWZ5ebwi9tvktY2kG4PM/Jw?=
 =?iso-8859-1?Q?RZDhRSeNeTsX/QKt2/8ReyA27mHDwtSNLpjb8zg6gmPH68YARkUMdtlV0x?=
 =?iso-8859-1?Q?MgIPJOCD+o/0L03zAUCvm5hwSstgI+ucd3SFrGG1gtQ/1EidUEv83TZhdk?=
 =?iso-8859-1?Q?4eY8ATB4HNpQQ1SuXdU/fFNMgt7ZB7/omhkpcwP1yOTD9qZWLKnjdu2av5?=
 =?iso-8859-1?Q?V8R9KiFUBcybA1bgZV8E5mlkMSELKX0YcdNKxheS2TOIPafVwTbJSeF4lL?=
 =?iso-8859-1?Q?goWE4N7JMNW1LF4XTP8Bcg/976v5gj6ThtwPZ8PZRQXLDJEf60TLQn1MKW?=
 =?iso-8859-1?Q?VKM9q5Dt5WLyhOK9UF3g/1J7wtWIMjcInMDAulXJryq+cG/9K4ssMHa+kP?=
 =?iso-8859-1?Q?SzVa9TZs9ySe2Egb5SFiLTc/HzIvfdQXnVIQiOY1F3N2DcCwnXQ27fl0YK?=
 =?iso-8859-1?Q?42OiEPmiX2x5dS2y+csnJV99S7Ng2/MoP3rM/KOkEpiRDG7N0LQo7+En6+?=
 =?iso-8859-1?Q?WxUOEQQeKdPlBh0iun8O4G10KMfxlYR7wUeyAkkHgmG7jOrTP3GSzV20Nu?=
 =?iso-8859-1?Q?8au8yNaYtHfsD5vb0tQtOpWMPZvJHMSR6EGVi2v9MuqXSS1SUgERPPJlhZ?=
 =?iso-8859-1?Q?BeT0vljR2iGerc4eylhu81A3+PCRUn5AzNmoxw7W0K0IcQG01cYUTyzgeq?=
 =?iso-8859-1?Q?dnSmoL5WVKGhLTNHf4ovvgmzjICNtxUrrh4Bp9J637ObkDQXuTsdZ7T6m0?=
 =?iso-8859-1?Q?6S8BlXUvd2fNAa6ChlelKSuMg+WiHeksF1iGw4BF4FyAuTn4D+DtlCsXlw?=
 =?iso-8859-1?Q?xkBxYFl5hCIDeKbQQiMolpy+/nkePHeQpTFkVrr14N1zZ/G8m6z5Is+7at?=
 =?iso-8859-1?Q?FtRWm36paREpRdkJw5syT5N+ohgJrTZoC81PhFMG3/bAr2lJYoDViXgPkQ?=
 =?iso-8859-1?Q?QVIVwXXuoFhO2XxfoIXcJmEJo106ggdieKgkE9hOmeReEZUJmH72C13Kbv?=
 =?iso-8859-1?Q?T/gCw44o2RtMOxelKD/+LaABNC46Kx/wVI0NYIzzawUemeDdB6Fh0WGWB0?=
 =?iso-8859-1?Q?nunD7uOFF3y2lZoheYOhREhFujIXtrXTToGExrkNww7NPOi8PyDInSovL1?=
 =?iso-8859-1?Q?zR7bV2zSNXEZ4JGj+yK+0uwdQqKGj2rrhErf2QiZ+GTDkqK1DKqB+rpvvn?=
 =?iso-8859-1?Q?DlOlGYPXLEBT3YXoMxk0bz54AIVG6DMVI+ii80iJo34gyu7n/jTkgdUEbE?=
 =?iso-8859-1?Q?dPycu1Rk5GMFyiEQNw2Tyq9GYaXqEJ9uLxAUWQHj6tuUV5hD+L05CSBInA?=
 =?iso-8859-1?Q?f1FYEgncUh5ngfHd5ICKmZsoIVb1DesWqQkQw18xMGR3AsM2cnfd4Xwt41?=
 =?iso-8859-1?Q?lTqlFoZiRsel72vTh9e+9lI9h9a2EBI=3D?=
X-Exchange-RoutingPolicyChecked: QSdb/yQbSeCDBU44NV6CANOUlqNeYT7hRS9o5pc9sZy0Z5tR8f4Q1k7FEATWCd/HNJIQWyX9+48tQpOAc80bfKIzrsmnBfp8LTKwK48ww9daZEAYjC0JJ9yfVfxeU99APEASJiqBMqw7/467VXG/etgC3ygnD6mXL4TNMJ60IFfnGwSgkJUdLKiP5OuwcW3CPfQrdRBbkfpZDDMrXzAno5bZoXLgNGZiaQOx+WxVJ6OyJQ6vO+sZpF44568Ia1ccy5Rv81t1LafleljdjNEGOh5YqUQS87EM6BDdndT/GiAh2Yu2X3q8yqaiurSnW2g5iQLOidUra9IKzzO8B1kE2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e55755-0706-4f03-dbfa-08dee6a80904
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 21:44:11.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0uDXI4Tgl7ZRH7Qds0UQOkf23W0Kyqp7Coq5t5N2pXTKQnhnGEk7E66RHO9atvjNtDCv0FWtsTUBn/WL6L77w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9550
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

On Mon, Jul 20, 2026 at 03:56:00PM +0530, Satyanarayana K V P wrote:
> CCS read/write buffers are freed during BO destruction. In some cases,
> BOs may be destroyed after the device is unbound but while the DRM
> structure remains valid, leading to NULL pointer dereferences when
> accessing device resources.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> PGD 0 P4D 0
> Oops: Oops: 0000 [#1] SMP NOPTI
> CPU: 0 UID: 0 PID: 9376 Comm: xe_pat Not tainted 7.2.0-rc2+ #1 PREEMPT(lazy)
> RIP: 0010:xe_sriov_vf_ccs_rw_update_bb_addr+0x4d/0xa0 [xe]
> RSP: 0018:ffffcf304110b9c8 EFLAGS: 00010246
> RAX: ffff8a85c38a0a00 RBX: 00000000810ef000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8a85c39c1888
> RBP: ffffcf304110b9e8 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff8a85c39c1888
> R13: 0000000000000000 R14: ffff8a85c39b4f28 R15: ffff8a85c3885000
> FS:  0000000000000000(0000) GS:ffff8a878b809000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 000000010314a002 CR4: 0000000000772ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  xe_migrate_ccs_rw_copy_clear+0x98/0x120 [xe]
>  xe_sriov_vf_ccs_detach_bo+0x2c/0x60 [xe]
>  xe_ttm_bo_delete_mem_notify+0xc8/0xe0 [xe]
>  ttm_bo_cleanup_memtype_use+0x26/0x80 [ttm]
>  ttm_bo_release+0x29e/0x2d0 [ttm]
>  ttm_bo_fini+0x39/0x70 [ttm]
>  xe_gem_object_free+0x1f/0x30 [xe]
>  drm_gem_object_free+0x1d/0x40
>  ttm_bo_vm_close+0x5f/0x90 [ttm]
>  remove_vma+0x2c/0x70
>  tear_down_vmas+0x63/0xf0
>  exit_mmap+0x20d/0x3f0
>  __mmput+0x45/0x170
>  mmput+0x31/0x40
>  do_exit+0x2ba/0xac0
>  do_group_exit+0x2d/0xb0
>  __x64_sys_exit_group+0x18/0x20
>  x64_sys_call+0x14a0/0x2390
>  do_syscall_64+0xdd/0x640
>  ? count_memcg_events+0xea/0x240
>  ? handle_mm_fault+0x1ec/0x2f0
> 
> Fixes: 864690cf4dd6 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c      | 15 +++++++++------
>  drivers/gpu/drm/xe/xe_migrate.h      |  3 ++-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 14 ++++++++++++--
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c84e14e86a82..b63a58902f21 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1301,7 +1301,8 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>   * Returns: None.
>   */
>  void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> -				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write,
> +				  bool bound)
>  {
>  	struct xe_mem_pool_node *bb = src_bo->bb_ccs[read_write];
>  	struct xe_device *xe = xe_bo_device(src_bo);
> @@ -1315,13 +1316,15 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>  	bb_pool = ctx->mem.ccs_bb_pool;
>  
>  	scoped_guard(mutex, xe_mem_pool_bo_swap_guard(bb_pool)) {
> -		xe_mem_pool_swap_shadow_locked(bb_pool);
> +		if (bound) {
> +			xe_mem_pool_swap_shadow_locked(bb_pool);
>  
> -		cs = xe_mem_pool_node_cpu_addr(bb);
> -		memset(cs, MI_NOOP, bb->sa_node.size);
> -		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +			cs = xe_mem_pool_node_cpu_addr(bb);
> +			memset(cs, MI_NOOP, bb->sa_node.size);
> +			xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>  
> -		xe_mem_pool_sync_shadow_locked(bb);
> +			xe_mem_pool_sync_shadow_locked(bb);
> +		}
>  		xe_mem_pool_free_node(bb);
>  		src_bo->bb_ccs[read_write] = NULL;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 78e5b63f3ebe..c3a268b01768 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -142,7 +142,8 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>  
>  void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> -				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write,
> +				  bool bound);
>  
>  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 6787564629c6..a8c831fbee3b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_drv.h>
> +
>  #include "instructions/xe_mi_commands.h"
>  #include "instructions/xe_gpu_commands.h"
>  #include "xe_bb.h"
> @@ -446,7 +448,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo, struct ttm_resource *new_mem)
>  	 */
>  	for_each_ccs_rw_ctx(ctx_id) {
>  		if (bo->bb_ccs[ctx_id])
> -			xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
> +			xe_migrate_ccs_rw_copy_clear(bo, ctx_id, true);
>  	}
>  	return err;
>  }
> @@ -466,19 +468,27 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>  	struct xe_mem_pool_node *bb;
> +	bool bound;
> +	int idx;
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
>  
>  	if (!xe_bo_has_valid_ccs_bb(bo))
>  		return 0;
>  
> +	bound = drm_dev_enter(&xe->drm, &idx);
> +
>  	for_each_ccs_rw_ctx(ctx_id) {
>  		bb = bo->bb_ccs[ctx_id];
>  		if (!bb)
>  			continue;
>  
> -		xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
> +		xe_migrate_ccs_rw_copy_clear(bo, ctx_id, bound);
>  	}
> +
> +	if (bound)
> +		drm_dev_exit(idx);
> +
>  	return 0;
>  }
>  
> -- 
> 2.53.0
> 
