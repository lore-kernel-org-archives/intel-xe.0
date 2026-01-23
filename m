Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E54D778AE
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 18:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52CE10EBB8;
	Fri, 23 Jan 2026 18:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWMgExfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281A410EBB2
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 18:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769192999; x=1800728999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R+eJVlD8MzDLog2jLEXQ3RLIWEqMfTUebxnQEmc5r/c=;
 b=SWMgExfTkPyLUrUsFYuR/LD2al2H7iTQTob1fvVFm7BJVLmceK8s7rFC
 kgALV4xAcS2jBZ05yepyJlWSNsWwPtkz4t/s2MOVeXMGwlt0ORWMgo6mE
 NX0lxWqYMG0JbiH3c70QfAGnHhj97OsY9xKHTc3Ce7pkaq8SGo1VKKPKG
 48l9QGX1+amXrUfG+jvTljz0s6b6FW6ek/jdzF7aPTwERTcdE7EPAO03n
 bbPMXK1beGMyFxkUYQEYiI1PCHyitvL9+KEVBIjEM1qa9bmWMZqaMuMwd
 xRbPHTQurh6v78+iVcpoVSelC4h0QiT3MDwVaIOp5xEj6iGru3Eq8VZM+ g==;
X-CSE-ConnectionGUID: hMLMUzxsRZGUxnMeUfqUDg==
X-CSE-MsgGUID: b1pCxIuJS5qy+ZXXmhaXiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70509963"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70509963"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:29:59 -0800
X-CSE-ConnectionGUID: ldotSyJzRNiVQElWT4GKWQ==
X-CSE-MsgGUID: KRC4+OkfSK+0IoAaUiC10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207335572"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:29:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:29:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 10:29:58 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:29:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/kfXaoXK9niuCXhSnjQNOxRGjqFDPt0um2tdFQPgv+01XJxOfqZsIMWTJ2P+Jwb7taFO7HxHk7CLdkh66Ky33lg5Wb0/idYXEjk/PQZmRd+niwZhaeRA8mn60L/njUM9x0vw5Tja8uUyO1CC8NzB71Vdw/ECeexQG1IpW69qTXOYbIvlSghKzJm8FJguu5CLnIVnEgk9/kAYiSn7/x6d0naUx0p4tuGy8fDQamZRlYGc6BsktJE61ZUVjGmUYEfrV5vN+lGJqBF0/Bpx4JPw7GHz/s+jxAmL+seKmXmDdyQU4g67tdKtd7QkTNOa6K87Ncyc4yry4z0aZSIFLvztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad69XgiTOcp2HRzeEqzUZoBJmjVaeruhLDE1BXDmpss=;
 b=wdyl0GncU7KdBw+KSNWsYWI/9X6vk0WMXwIjYtTGgHcrgxKN0kxLLvS1YERLvLBWrgFG5DUHUte1Dd3l1VltyMciO6Xx9LB7CVYXF2y8aJW3Vvbi44Y/d+kLAVfQ2EXsVE+CKoCAPzu2VrCRhxqosO4ETpJ+ijHjkx7Ds3+DA63Tf7LewtMAqjgXNXDNFsT2wyRDFRR50frljT2z/LGC2sb/+8yXP5C0Tl8Qh2L39rbgiNF06eyJvuSVpmCf1WyU0P6+n8EostThd22lYlzEAtbb1cUXpmPmmmvnlA50Kfjln0k2NZDmczn3Xine/if3ghRUCT9ZU1L9O/wbz0t7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 18:29:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 23 Jan 2026
 18:29:55 +0000
Date: Fri, 23 Jan 2026 10:29:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip address copy for sync-only execs
Message-ID: <aXO+IJgQglziQe+d@lstrano-desk.jf.intel.com>
References: <20260122214053.3189366-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260122214053.3189366-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:303:16d::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e46de76-b795-426a-f2f8-08de5aad67e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wxaswTVWJlyJQh1bUsdaS3quGZ6ZapqOEz5faZ8Qwy0ZBdHAUYS89B5GIl7P?=
 =?us-ascii?Q?1c/DIRK3+yzzwSd8dqkEoe9jAaulcvsycaQBS0FjDoqStFyBNSPcCLoA4xJG?=
 =?us-ascii?Q?BWl5VBx0yjgcJyK5vg1k9GD1VNq/KTZ0qT0MlEu+g+iKQP5Eb1l7Ob0Ko+zV?=
 =?us-ascii?Q?h2CuANHImoYVl2R5TDez/Xm+on1EdoeHa7NrN3Wsfxujz6U3eQRLJg7CpuYe?=
 =?us-ascii?Q?YC9QBdOe3iOY50rm0QFych/u0RdxxC9dBlFYqvJwSH6Txv9RyzkSL5xB6hzI?=
 =?us-ascii?Q?5nleNPz/xwiACs7Jn/TOoNiLKHowxSJX1RLsxLRCc7uesOUM+6OgaksffihN?=
 =?us-ascii?Q?vMBNVU19duuLfbV7dDLd2nUxZDZN7tEYu0ARq8ACutJnzX5F3EyQIYqJ4Tz3?=
 =?us-ascii?Q?cPzKNNVaxEfqWH11DU7Om5wbNxnxHzUiWTEtu2+0k/gWlQ02by8JiG3RHhFv?=
 =?us-ascii?Q?gevYAMidFpuXXCAyMPHP1hXX/Jm4PSwdTn7N2Uvnu4SxQwPxioLGssjk97lH?=
 =?us-ascii?Q?EOfgC5f+PyTGfg34pNwqiz4HpVZVHEAp9OclYRSbZ80DUL7ZQ+pf1KxL6NU+?=
 =?us-ascii?Q?YoWV5CU5Zah5WokW1k3DgpBUfP3BCZS+pqGE8uvLPCTsfz6CDIovBqrRuqm9?=
 =?us-ascii?Q?eqvchaeeXbpSuH9KIYe/Zid49ckYX+x8X5YPYorwB38fFu2Q5/KNY/QHunyF?=
 =?us-ascii?Q?LSDyPJDDWDaNl8M3VXYDlwVigM9h4/2VzQmAlDuX+xO5m6vgk7oCQ1Usrp5r?=
 =?us-ascii?Q?2XfDXnXD1KyycnH4u1yqTurCdqW+QH2muR6D42mYPh7hTyJ4D9ZJb61grqu5?=
 =?us-ascii?Q?NKn5xZiX+r+pQZ2KDdGLgcX4CCuvJah+e6YYuY/jtANKIiBTFCMiceuCcOyF?=
 =?us-ascii?Q?hdGpg63jOYF7bwMLmpmo4Aw67+Ih8jAYpHjTErMI4Y5D9x+FlR9LrFV60gq2?=
 =?us-ascii?Q?XQ3ibAmjvAYQMGcdwX1H/1NdyDB2+WhXglSN0A1AFgTaq4AhoDK/WrVx2SWk?=
 =?us-ascii?Q?+jr0DA8TSgPe5XBDqTqejLSfmX/iaIjc8hV4m1HPOhZ8cLdlw6D+UhEN0cnQ?=
 =?us-ascii?Q?uda7jyI7de6+JA96uYSOjsAgpbZ/RkNeo/GzkTwq/l2AOC8aq7S2C5++eLVu?=
 =?us-ascii?Q?xR1BC06I7lUfQlDSIhAArxaQs5bBXD64yArEeqw2+m/olMqJdyv83z9XKcbS?=
 =?us-ascii?Q?cJSud61aaOnMlotMf/rTczbcQqGI38XHXLl3eU8NuX45/2Cchj/vWFIbphLU?=
 =?us-ascii?Q?FGp5L3/gXOBlvn3b8Tcy5/0SZ03YQJwRXjRdVs8SlA+q3ODhfNDmM4rwuDsl?=
 =?us-ascii?Q?rIPFvHjCuMqhRjg/svAK86qGsaaBeVkwmR0yjxLm9xEWsLmUHl3lHcKJASeg?=
 =?us-ascii?Q?ZcEes2fg5nLoGOYDUyZX2mfUQx0A2OI76YmqP3ui6fdS9VeMSBu1ZkVqW/Fw?=
 =?us-ascii?Q?vPRYaUSkJ5Pap34rq97VD8cZjs9FCrXnkWGne4q7ZBCr84b44NXbarrc4I3l?=
 =?us-ascii?Q?Zksd/T+aZlbq6SS59TgFk93eEnNl52TOWILDKWhLzpUuvqeSK4fDf8Y1bmir?=
 =?us-ascii?Q?f40p/lMH0LF66byxDqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpzO85W6XLYtPhUkOoX6ft9r+cNYONO/yy7rnjStt7BFfcdLch4b6lnTco0h?=
 =?us-ascii?Q?aqfgAmiXefar8+s+aLNi/2FqTS/VUNxMPGcE7/19CuSZWOpykdDzTVA3Canu?=
 =?us-ascii?Q?5YFE9I0EHhk/Vqd3+N8Tj+UrlbJNhv0NUUubC6dTJgiA4ruqSGG0kwKcFYdD?=
 =?us-ascii?Q?IOX9zLSpMYF+c9W+X5vK+epHzbR0RB2/+RR+evoDSuIC2Su2pSeZDc6VvZDO?=
 =?us-ascii?Q?50o99UjgsNaOnrzq6jNkFpPsnoYumggF1GUeuYwV/aR3maiAAGCwm4MUy7Yl?=
 =?us-ascii?Q?bfmkWBAT6+Le1JsI8sEyX4lwca5fdU5J/3d3nnVz5wruqsfK3Vt1m9h/b1Vl?=
 =?us-ascii?Q?C5fEer2ocx3Vf/F13uhpu/CVx5VoXpSjY1mB38LBvm2z+u3p8aIEdbjRLClm?=
 =?us-ascii?Q?5xP378xtstzbEsuqhVKptGl3eCEGXE8yKATo39TJ+TPr3P8y0NTL9g+mDJs4?=
 =?us-ascii?Q?7ufsZBvXfhIEzg4H7+NTuebSC3Pxtfje6AwrOk5TpIP9rSlHjnfoS2uguzv1?=
 =?us-ascii?Q?XrJitKBYtr7s6ZoYIJTKe6gvuI3SE86yI/RYhT1O+POhdt3gkbsbDg8sAfli?=
 =?us-ascii?Q?nT6fBZSOB02xWovFyd4E0eDTrNTZKrEwer6u/OF4O6nK8DQRDAHcb5iQQQEN?=
 =?us-ascii?Q?RwENVaUTZYWevdZfJCbsga432qSxIUCoHxM50xaGsR3KHkUHEiKC/LY6tYl9?=
 =?us-ascii?Q?EzT92bXg9zvtKihIo3nFm5hteZ5Dg4aPcSlLggmNy4PrUAQntOk80komLalN?=
 =?us-ascii?Q?6mnPzy9F1eYDiZPo+4AI3/n3TJFcSCFYgDHNOgWARlYiX+E21RBJXNXnPBp5?=
 =?us-ascii?Q?Pa1q2XZPcOm5nLR4uzx+YgMKHoWSG7PsR495uK5eMgnL5TIkd/NX6SggZ6bM?=
 =?us-ascii?Q?ocrxXrN4isnd+6PmRzxJ3ket3Y6RdZC8ZKyauMRZ80yctdyLOkAevWmEGiG4?=
 =?us-ascii?Q?d7Yc7M6GMg+KABoHKrnCSDPv6BSu2Azj9XK0fGKBHFIcZa3blGqViLzvXfJm?=
 =?us-ascii?Q?1jjs3Pb4h3JUYXU4xlxucA3c+gSHPClrF9yV7YqzzJDPUTNt7dGA1VGrCXuO?=
 =?us-ascii?Q?4/Vl8dZDUe3UiCD59q4GNvLM+Xkb3b6CpOjuORyJq416g7b2vbpjUfMTFUc4?=
 =?us-ascii?Q?yI7eV8Y4ZNyWXLNILEAQANf301isY9gvc002EffW+ouEDDu0cRI0Z2bIHTKc?=
 =?us-ascii?Q?oW4jCDSUHE7ud7Y1D70rYCDautyNb+++DrWy8iUY4qXMyEabW1PmlMXyz7ns?=
 =?us-ascii?Q?dmYWC1hAOdGe2pMSAwBitof/ImUKqj329CQw1fxmgc3fdd6Db//0/bWPM3/G?=
 =?us-ascii?Q?RVL7z/3vzUicjZ5YZTu3HMQX8V92aq+tEliYLlJnlR/87rcvl+gCuapk2K8y?=
 =?us-ascii?Q?PbtlVGEthIsXDnG69noJJrUZoTEtnyDNGXrugpKNT2+ZctvAAuWRVDt599bF?=
 =?us-ascii?Q?P3Jj69ya+Xl1NOzY8zeJfUvmgPNeECzoZxzvA8nbwUtkzKp1bMvgTF6wtZMJ?=
 =?us-ascii?Q?2zWBmCEVgDY7neDeoBDReUmBjmkAM794QkuqG2DgFWxupcOJxUj8V/rUjZLi?=
 =?us-ascii?Q?fgFNza4d159cL3UUtXH/XoZ4MZMVvz3tZbXLzDeBwcmTehA1SojWspG8LTM+?=
 =?us-ascii?Q?8f+nbzrmFqLZiWo0TQIex/GyiZUSCqeBtiIY0TmZoyuJjteV8DKqYy4VCfdJ?=
 =?us-ascii?Q?L9r72K+goSWwh9bqNvVjRD1T8EJE+bAPE/Y+r8Pyoi5KNndeUAZsKkWMnWKh?=
 =?us-ascii?Q?zuL6OL5nLG/QhFXw9325XZHttmM8deE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e46de76-b795-426a-f2f8-08de5aad67e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:29:55.4085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1zmwyANT7Si9X3dx77HsBmr6bIzSYz2DDH4ghH1UVMYVzHOWSqoPZrHL4OEWooF21/W9VerbqJq/SY6/0LX1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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

On Thu, Jan 22, 2026 at 09:40:54PM +0000, Shuicheng Lin wrote:
> For parallel exec queues, xe_exec_ioctl() copied the batch buffer address
> array from userspace without checking num_batch_buffer.
> If user creates a sync-only exec that doesn't use the address field, the
> exec will fail with -EFAULT.
> Add num_batch_buffer check to skip the copy, and the exec could be executed
> successfully.
> 
> Here is the sync-only exec:
> struct drm_xe_exec exec = {
>     .extensions = 0,
>     .exec_queue_id = qid,
>     .num_syncs = 1,
>     .syncs = (uintptr_t)&sync,
>     .address = 0,            /* ignored for sync-only */
>     .num_batch_buffer = 0,   /* sync-only */
> };
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>

Good catch:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index a5485fe6e3f1..dbe6c006f1d6 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -192,9 +192,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto err_syncs;
>  	}
>  
> -	if (xe_exec_queue_is_parallel(q)) {
> -		err = copy_from_user(addresses, addresses_user, sizeof(u64) *
> -				     q->width);
> +	if (args->num_batch_buffer && xe_exec_queue_is_parallel(q)) {
> +		err = copy_from_user(addresses, addresses_user,
> +				     sizeof(u64) * q->width);
>  		if (err) {
>  			err = -EFAULT;
>  			goto err_syncs;
> -- 
> 2.50.1
> 
