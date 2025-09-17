Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89560CAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 16:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3139310E061;
	Wed, 17 Sep 2025 16:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fET7TgF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D7210E061
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758128220; x=1789664220;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MY2WkPIk2Ne8CC8AVOK/YQEsCcFN5WJrX43Fu88K8BM=;
 b=fET7TgF9ZW9H7nnmo2e8z1TSIj9Ns5O0EnJoBNZaEmth988iSVpdPjID
 WZIFSulldQ6L2F2fjG77TMUK2NU8V/9fTYJYX0yxIy6vu0tKOgC7BdqHA
 yZBZkfz3WkrWLl9SsIX6rgRHCxiIArk2xCcVUpZz2AlvjsxWae0mbdQF2
 UdvzBlrTX1oLO/H43kHtTsIGAutzme9E7W429gRmxkdYd0QkAtq0fF4MC
 s2QK/v0nqr8c2NosMDbtqHqhAXO3iCyPEiiXWm9PQH40+zXoV8MJ83Bvb
 k3ILSDq8sRQMbgqfAmUaOfRE146YUrXdOYDLX6ln4HyBJopoLsU8DtlZG g==;
X-CSE-ConnectionGUID: KAw+qdnERE6ywPxCehwRfg==
X-CSE-MsgGUID: yKFWRTdXQwunkU3+gU+s4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60510361"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="60510361"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:56:53 -0700
X-CSE-ConnectionGUID: IldVB7vMR2eZWeQDVX1lIQ==
X-CSE-MsgGUID: /3JFP7nnSZ6QoNQahXCPnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="176068088"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:56:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 09:56:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 09:56:52 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 09:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBLBFvq4QkMCxhjK+gV0zNHZKQJ9fYWNitpJiaHdlzfWjLdLCdn0n9Xb4VNTh0IMOah3+bm2L/p586knit0sBpxO5dVlyBOymzhbpveK+T95zwFKlnaEShKCboFhxNWoLXaBSRCYDtNFceTcFjEyAXocQlKY10FOVhYoYM1v+g5tNdtT1TZc98q6zE0TgIRfzVtuaR3NKriJMBBb9hLxO6IJOQMMeW42xQyTGC7UGZRmBmREUOpEYHFn2NOksbEGURcI/KqTiaRkopwkmChU+eTafx/J2fm5A+Jj966wI4QNkV+ooaDpkTLjvdkHed7veBc75ciwUycJQMdOmaXOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdSwb8jqA2Pk4Ca1ybBtqu5zZMYt+QVOlToYJLCJSaU=;
 b=dh78wyYtfCjI4/TZtTG24H0dqX4DCs5k+hkgEO6Oai+n5D19HnCnXNOSVKkQ2yWREmV7RJaF2rJjqxgys9qsY5ixPeAKKmn1ZWludpmFaQFfBVKY2tbvoX5w3vWdFvzA+qvdCSHVpV13oHD+6iyP3immEdjW9TLozf6AcVExiN/UQPufk0siCnWkRzecemXVR48Ad2I+kNvDZYA9T8Dk/3gMLyz4RVVAj4ttJ56ccDtlSFuiqdU9K/e5xf8Xoryb5OB18R+8ASH2dxKqeGNeGwVNdxmYLiizM+MNIgaM2EYnSnoEs99b+abqWqPIiQ0wlt76UALk65Raaw5BK2k9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8858.namprd11.prod.outlook.com (2603:10b6:806:46a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 16:52:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 16:52:40 +0000
Date: Wed, 17 Sep 2025 09:52:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= success for
 drm/xe: Misc refine for svm (rev4)
Message-ID: <20250917165238.GA10167@mdroper-desk1.amr.corp.intel.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
 <175758579190.325116.14605576310148201498@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175758579190.325116.14605576310148201498@1538d3639d33>
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: f04d1f0a-b347-4d7f-080f-08ddf60a9d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qg4VamjtsAEHBcxypHAA+0j8s7C8iWPxSS8Mn9xCBsaalqL9KqWxsi/yPPmW?=
 =?us-ascii?Q?7YUgTYt7kyL9b/egw26qniH0gv+A4mZ83UB/F4q8hRbmvEu3FxFga8CJkjF5?=
 =?us-ascii?Q?Opi7sd6z0A+vv7oXSlX5AnI55UdgTb/6hcCC9HmrlIfeKrjXxEfoeYUiWMzT?=
 =?us-ascii?Q?qhKCVuun5PcIcN6U2FX24FLoQK+PEUv4Upg68sw4aaDaRcb4vWc9M38Ccz6I?=
 =?us-ascii?Q?ESrkAAOU4MI6N8OMor3qdwJrVLOaEQdFlFy+sDknM9I676UD2j7L+kYDqUY2?=
 =?us-ascii?Q?AlhtuQ2fdqdx46PbMW5RbCupETJbjAG831L70IzahBCyIhiupGB5QdIJMXG5?=
 =?us-ascii?Q?4FaEAUtlnTTdyLyKERxspmKMNtsUy37l3izm9JLbKHCGuasz8rzsfaseMg0B?=
 =?us-ascii?Q?UrIewdGexjgyjLZlqym1WCmL4lEy6n6MixYsQstAEG0HjaqxSk8GDEtGvVTF?=
 =?us-ascii?Q?YYc0EgdDLs3aS2vbqdbsjN5npaAnB97d6S9p7rMomnzomFoWEd9VrOS/pMIu?=
 =?us-ascii?Q?l/Ra4FSlDvfFkIhSS4A5oT0yLR4NdbDbPs5VNBu6rofqO+UOK1j6N7upw8ZH?=
 =?us-ascii?Q?aG6hLaNKuR90jLBau30IjGnfBoltZXrn2YOpKcqZ0+qB0qZ5AixFUGUx0l4V?=
 =?us-ascii?Q?N52nT+lrx1yDyZC5vk7j0rmUgvHrFEtfRWDKMpQq+xB2Y1bK6c6W0VA8nRk3?=
 =?us-ascii?Q?WFcWgqQaj+J9jKNo2I2WrTkLCRzAh08cNVLFj2IQBYglppZ36hl5SVo6Nnms?=
 =?us-ascii?Q?zzHmV4KORjXCweMhhrE9sxZARQ70wXc+ny/vWrlJ8DG4N6yTmhAvpLL2Kj7x?=
 =?us-ascii?Q?43mM3izUTM6Vn5A/9BsVv23CsinunHYm5STqlbcgnxC5ekZ0jV2OF+gLfBM0?=
 =?us-ascii?Q?zWojfVqGy3HBPUkp8agEDiLQzvvtayRG82Wlpho89aCSVeZd7L/cPPZK6U85?=
 =?us-ascii?Q?oONp1RLDo4xXN4CJWg1e+VdHYXd9AUySNyFCVfG5g6wZm3Cb/SNEng2bIOdo?=
 =?us-ascii?Q?1wNHvkHRvsT5b4+L5cMgXzTuGysue7/V5Z0+TNOyie9a0I3FzuED67qJBGo3?=
 =?us-ascii?Q?ikij4AFvtyLzRFWv6K4cej91tici+x8UQ/1KUDE+GSOs/6Hh0+K3flLWygE3?=
 =?us-ascii?Q?4t6xnKgPlBa8mUX76eSNf97T6ENPHy6t+jIeV2S7PlhJJnee2hHL4Gvdk0J+?=
 =?us-ascii?Q?3WLgCQd/vWnC/z4NE1DOLrO1s902CZbPTrYzmwujEfGGMjycrx6kimV+6dyF?=
 =?us-ascii?Q?c1XId9in7YQ8IhaXeqQ4lM5X+GsEbjhvPPwj+WD0ecYOLuJSPAXgy0ejpp58?=
 =?us-ascii?Q?soFrbmlC3OEu4ZIqNA2IOTDW431pBRop9cdsltDHLjmSVXL4h09YuiqUsTIQ?=
 =?us-ascii?Q?xYaMAgo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JaOzQ3UFZnHJKL8M28czDF/MYkcPJU7/Gk3m2NbsrtGHkxpZL1WHM1I63dhv?=
 =?us-ascii?Q?64EzrHBRMxl06FxFHDRjY75nCK34XRrFG/2aETuqmCCBmytsgWiEpJLTLhGh?=
 =?us-ascii?Q?kVsN5fM54im6Q85MpZwQb5cU01FFJT9bIYCuTlE42iU4c3lbYps6+TLhmvKY?=
 =?us-ascii?Q?3r2ktQXK7b/hEuuJkGAmB/hMRhqHt9Hb3UoBIlKwIA1Ekn+fhLm3Ycg6IgQH?=
 =?us-ascii?Q?aTHo5nOh3EElJOsij1VOwiqlYR0S8MwkwliXIxXqGDdeh1tu082P/zxIPelv?=
 =?us-ascii?Q?T8YcrgaXiOTcxYrVMNbaUy1L5PemlHQlCioYgIBsK5x5SvU+WHNtZxnj5gGD?=
 =?us-ascii?Q?ErpSNNiSKiuQWK0yQHi+nVvhktJaD35Z8A+AL6qk9u09QpO/XxGzuH0XpwnV?=
 =?us-ascii?Q?+Q+hDT5QnzH+253qZUOD+1+lE/0q5pI0M9gYfS6gy2JhAnZNoSPsWmb8PkGg?=
 =?us-ascii?Q?ObREDAsHURByrg6tV2B2NotAPg4nvMeAh6odyfTcpIrZsCkMcXO/9srwGaqo?=
 =?us-ascii?Q?Yhl0ghoYyXs2nw7rFy+K0pspRIbvh4tvaInEWWp8dzXESNJ8AGqdQUg4G2B2?=
 =?us-ascii?Q?pDxBT7Cas3PE7J6ZkgsHCKcC/Lbu3+ansqdFwAGPY+FzDJ0cEwUWqe5bVhHB?=
 =?us-ascii?Q?e5KJqJLEcCXMHztoJVCkNshkiLSDfOaAJgpay/gzTMeab0c7TYDRM9sUgzdp?=
 =?us-ascii?Q?754elBD5rd5+4bddjtQpeETXlq2WhPPcZV5eTHDgoKKEyTeFzx6/HdWJskXp?=
 =?us-ascii?Q?JC3YAURGt1GsAiOyA218ylL+vUyKWuySAvuWCZ/iqANzg4zMYRwkxoVWLXgr?=
 =?us-ascii?Q?WwR/14NcfOWOWwXvBbiDxnxs8YOhOIw3I5qFUnClwoKdX4wDnh0i5cvjcwAn?=
 =?us-ascii?Q?q36Zd6f+8fgVhbVERkOm0E++kfGJ6Wm/6JQDY+Z9NPf+vHaS2xNrt6jBv66M?=
 =?us-ascii?Q?5kqBSrtyVLfFwD5n1I7DbPtQVv5suiHUk7agJBlou0weUJB6D4Ww84eCOiiR?=
 =?us-ascii?Q?+A4qZLR8UJTrf5NPS7vkaJQFkuV3LwaMYgKpsWOnuu15O6GrPWPOcvjqxymG?=
 =?us-ascii?Q?/weTP7dUipJbwqzKSfN4YtrhqaqNYCcm4j6Wi092cZu49K3s5Q/af8mCaysg?=
 =?us-ascii?Q?zOf5LegHCoKj6wDud3RL+WhHY3fNvX0Eh9IiU8x98gexaA+nJLUbD8I3lk2A?=
 =?us-ascii?Q?PSLb0VzN7emF86FNQYgiODKA4np1qy4rXFbvcJXRzJ1P21+9RlAN2D9Mn31D?=
 =?us-ascii?Q?fxIMp5FEukIYyJsudLC+4T9i0V3it8LfBeN/MBf9Vbr00JnUr4Gr9UOLvnnb?=
 =?us-ascii?Q?uCfq4+hj4iumRfgblN4Pz44QnJp04OhY03FaTSHf8CW/3eVu9I9Q5GLxHKwx?=
 =?us-ascii?Q?usclTc4sPIXvnwhFma2vmX3xD6OyPUokBesfzZRFKrij78M1C3DCOgwV/mAh?=
 =?us-ascii?Q?RI6F/YACJuYgG1dZG3fCUMM7nKRHmVEhIKAztyOM5XYl/l+EDyofiMa4ZY7W?=
 =?us-ascii?Q?AZvQgKpWJvRm13RVDuOWJpYNKaPyXPQMC19Jyg6l64qgITqN/WeUCm75ekY6?=
 =?us-ascii?Q?JLtnfPBOJecMhIOX4W7M9slkh9I5DwZnG2tN2T4W+fUlUKFNVo+zlAmDds5y?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f04d1f0a-b347-4d7f-080f-08ddf60a9d17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 16:52:40.4909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3IURfxIlVrIxg/6hapkhokqR1d5cTujexpHDwcgore8JTR355GVcx98I/TSbjyJIQrvUTrHGAftjKE4tmDPXpc3Td+k6dRaPmC3oByI8qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8858
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

On Thu, Sep 11, 2025 at 10:16:31AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Misc refine for svm (rev4)
> URL   : https://patchwork.freedesktop.org/series/151842/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225_FULL -> xe-pw-151842v4_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-151842v4_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@read:
>     - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#2134]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@fbdev@read.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@fbdev@read.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
>     - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-adlp-6/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-adlp-2/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#455]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][6] -> [DMESG-FAIL][7] ([Intel XE#4543])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#2191])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#787]) +146 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#3862]) +1 other test incomplete
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4522])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#373])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#3304])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#308])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2291]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#4494])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1137])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2316]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#301])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [PASS][28] -> [DMESG-WARN][29] ([Intel XE#4543]) +2 other tests dmesg-warn
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>     - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#2351] / [Intel XE#4208]) +17 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#651]) +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#653]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#455])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#4596])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1406] / [Intel XE#4208])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_setmode@basic:
>     - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#2883]) +6 other tests fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-8/igt@kms_setmode@basic.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-4/igt@kms_setmode@basic.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#4227]) +1 other test fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-lnl-7/igt@kms_vrr@max-min.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-lnl-8/igt@kms_vrr@max-min.html
> 
>   * igt@xe_eu_stall@blocking-re-enable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#5626])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@xe_eu_stall@blocking-re-enable.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4837])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>     - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#1392]) +5 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#288]) +5 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4915]) +31 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@xe_exec_system_allocator@process-many-execqueues-free-race.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#2229])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#4208]) +1 other test fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-464/igt@xe_module_load@many-reload.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#6032])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_oa@non-privileged-map-oa-buffer:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#3573])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#4208]) +64 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
>     - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#4208]) +456 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][61] ([Intel XE#3884]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][63] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][65] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][67] ([Intel XE#2291]) -> [PASS][68] +2 other tests pass
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [SKIP][69] ([Intel XE#4294]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-bmg:          [SKIP][71] ([Intel XE#2316]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][73] ([Intel XE#301]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][75] ([Intel XE#4543]) -> [PASS][76] +3 other tests pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-dg2-set2:     [SKIP][77] ([Intel XE#1392]) -> [PASS][78] +3 other tests pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][79] ([Intel XE#316]) -> [SKIP][80] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][81] ([Intel XE#316]) -> [SKIP][82] ([Intel XE#4208])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][83] ([Intel XE#1124]) -> [SKIP][84] ([Intel XE#4208]) +15 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][85] ([Intel XE#1124]) -> [SKIP][86] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][87] ([Intel XE#619]) -> [SKIP][88] ([Intel XE#2351] / [Intel XE#4208])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][89] ([Intel XE#2191]) -> [SKIP][90] ([Intel XE#4208])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#367]) -> [SKIP][92] ([Intel XE#4208]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][93] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][94] ([Intel XE#4208]) +15 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#2907]) -> [SKIP][96] ([Intel XE#4208]) +3 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][98] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#3442]) -> [SKIP][100] ([Intel XE#4208])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][101] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [SKIP][102] ([Intel XE#4208])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [ABORT][103] ([Intel XE#1727]) -> [INCOMPLETE][104] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][105] ([Intel XE#306]) -> [SKIP][106] ([Intel XE#4208]) +3 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_chamelium_color@gamma.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][107] ([Intel XE#373]) -> [SKIP][108] ([Intel XE#4208]) +14 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     [FAIL][109] ([Intel XE#1178]) -> [SKIP][110] ([Intel XE#4208]) +2 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_content_protection@legacy.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     [FAIL][111] ([Intel XE#1188]) -> [SKIP][112] ([Intel XE#4208])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_content_protection@uevent.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#308]) -> [SKIP][114] ([Intel XE#4208])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][115] ([Intel XE#4633]) -> [FAIL][116] ([Intel XE#5299])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#323]) -> [SKIP][118] ([Intel XE#4208]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#4356]) -> [SKIP][120] ([Intel XE#4208])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@kms_dp_link_training@uhbr-mst.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#4422]) -> [SKIP][122] ([Intel XE#4208]) +1 other test skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#776]) -> [SKIP][124] ([Intel XE#4208])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-464/igt@kms_fbcon_fbt@psr.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][125] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][126] ([Intel XE#4543]) +1 other test dmesg-warn
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#455]) -> [SKIP][128] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][129] ([Intel XE#2311]) -> [SKIP][130] ([Intel XE#2312]) +5 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][131] ([Intel XE#2312]) -> [SKIP][132] ([Intel XE#2311]) +5 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#651]) -> [SKIP][134] ([Intel XE#2351] / [Intel XE#4208]) +15 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][135] ([Intel XE#2312]) -> [SKIP][136] ([Intel XE#5390]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][137] ([Intel XE#5390]) -> [SKIP][138] ([Intel XE#2312]) +5 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#658]) -> [SKIP][140] ([Intel XE#2351] / [Intel XE#4208])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#651]) -> [SKIP][142] ([Intel XE#4208]) +31 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#653]) -> [SKIP][144] ([Intel XE#4208]) +34 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][145] ([Intel XE#2313]) -> [SKIP][146] ([Intel XE#2312]) +7 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][147] ([Intel XE#2312]) -> [SKIP][148] ([Intel XE#2313]) +6 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#653]) -> [SKIP][150] ([Intel XE#2351] / [Intel XE#4208]) +13 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][151] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][152] ([Intel XE#3544])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#4298]) -> [SKIP][154] ([Intel XE#4208])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@kms_joiner@basic-max-non-joiner.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#2927]) -> [SKIP][156] ([Intel XE#4208])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#5020]) -> [SKIP][158] ([Intel XE#4208]) +1 other test skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#2938]) -> [SKIP][160] ([Intel XE#4208])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#908]) -> [SKIP][162] ([Intel XE#2351] / [Intel XE#4208])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][164] ([Intel XE#1406] / [Intel XE#4208]) +12 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1122] / [Intel XE#1406]) -> [SKIP][166] ([Intel XE#1406] / [Intel XE#4208]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][168] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_psr@pr-primary-page-flip.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][170] ([Intel XE#1406] / [Intel XE#4208]) +12 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_psr@psr2-basic.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#3414]) -> [SKIP][172] ([Intel XE#4208]) +1 other test skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1127]) -> [SKIP][174] ([Intel XE#4208])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][175] ([Intel XE#2509]) -> [SKIP][176] ([Intel XE#2426])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#455]) -> [SKIP][178] ([Intel XE#4208]) +17 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@kms_vrr@flip-dpms.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@kms_vrr@flip-dpms.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1123]) -> [SKIP][180] ([Intel XE#4208])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_eu_stall@invalid-event-report-count:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#5626]) -> [SKIP][182] ([Intel XE#4208]) +2 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@xe_eu_stall@invalid-event-report-count.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html
> 
>   * igt@xe_eudebug@basic-close:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#4837]) -> [SKIP][184] ([Intel XE#4208]) +18 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@xe_eudebug@basic-close.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_eudebug@basic-close.html
> 
>   * igt@xe_eudebug_sriov@deny-eudebug:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#4518]) -> [SKIP][186] ([Intel XE#4208]) +1 other test skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@xe_eudebug_sriov@deny-eudebug.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>   * igt@xe_exec_basic@multigpu-once-null:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1392]) -> [SKIP][188] ([Intel XE#4208]) +1 other test skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#288]) -> [SKIP][190] ([Intel XE#4208]) +38 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#4915]) -> [SKIP][192] ([Intel XE#4208]) +398 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#3573]) -> [SKIP][194] ([Intel XE#4208]) +11 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [FAIL][195] ([Intel XE#1173]) -> [SKIP][196] ([Intel XE#1061] / [Intel XE#4208]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@xe_peer2peer@read.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][198] ([Intel XE#4208]) +2 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#4650]) -> [SKIP][200] ([Intel XE#4208]) +1 other test skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@xe_pmu@all-fn-engine-activity-load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#4733]) -> [SKIP][202] ([Intel XE#4208]) +3 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#944]) -> [SKIP][204] ([Intel XE#4208]) +4 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_render_copy@render-stress-2-copies:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#4814]) -> [SKIP][206] ([Intel XE#4208])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@xe_render_copy@render-stress-2-copies.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#4821]) -> [SKIP][208] ([Intel XE#4208])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#4130]) -> [SKIP][210] ([Intel XE#4208])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#4351]) -> [SKIP][212] ([Intel XE#4208])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225/shard-dg2-435/igt@xe_sriov_scheduling@equal-throughput.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/shard-dg2-434/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225 -> xe-pw-151842v4
> 
>   IGT_8532: 3b9f234d6efe0529a233b81bb0d5ffee5adddb01 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3721-e925396dbb0b8094e00ca3d47a375538d429b225: e925396dbb0b8094e00ca3d47a375538d429b225
>   xe-pw-151842v4: 151842v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151842v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
