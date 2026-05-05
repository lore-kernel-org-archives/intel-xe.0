Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60266FF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 17:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0910E13B;
	Tue,  5 May 2026 17:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyDu6jYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B74A10E13B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778003460; x=1809539460;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jx3K6t/R4mCG9fLbX5f/6gAPbw7TZgOFhm+AoimqtKQ=;
 b=XyDu6jYNWq4aTU3WP/gjbI5mERwve5gZjL2bR839shLPzoVBKp1OTIc7
 KfJFSIsaRv46KU6xcKuMJiC4std46utnYat8lEQ1t3YVQrwJxu4m2FyhD
 v6Y6ixxaX3/j6JbQEvzt73yV/MJRr+d5Veg1+T0xdN0/CkRas6upKAVsT
 TetJdWVOnEfjTuGgWVMIKfXSmbZChynGLGN4Z4mbLwSTb0lJPHKXSl5Gb
 tte25AIFgVCcZ2tu5dxh2izjRNexYpd0x2ojIZoB1l0zX/bGF9EW4qdbB
 5pWW9y3tjo1v8urZN9Coc4PadWKudwC8xHHBTQ3sBQBufMY2ZpiD9rCkX A==;
X-CSE-ConnectionGUID: GDlDttFWRxyUw5pVkHvv0g==
X-CSE-MsgGUID: vXZYgmLMTtyNfrcam7JitQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82735177"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="82735177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 10:50:59 -0700
X-CSE-ConnectionGUID: GlUcx9Y4TQCJFfxq20IOOw==
X-CSE-MsgGUID: D86myBpbRMaCm10OYKwltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="240872790"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 10:50:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 10:50:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 10:50:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 10:50:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5/r/Bvd+jt8zbGFAeiPc6Ql+3lzTtReLGGunLq3LY5XObYtWfoufP77BvSvV9Vv67fldgdjg9wk8uveaT4E91/znFE1exve6Lsiky7CJV5cDqRJpbeKZwY+dcfJwfbTMZQIpWZAOgU6Q5+ypcpbre0fGTYPIs3p8wISXji5qekZaHWPsjOqyV5HY2miSadz6j7fGO4vsE4BxicOTRSxP2FewiCR/Xz+PD4bw72zkVc7OSgIusQc0FtkoSbFtQaO7pq23yfKxH3c7zTaz4by9q6RDPDS57YmSZdKU00Ts6ZxncLwHwTmb6Wo7SHt7R/+m47jXcBHWKjTbxClTqGmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHHJngxvH0heFG2HkFx99BpQmN3RkZ4YG7qweQgQ244=;
 b=iHVhSO5mUvRCF+Ts4seAm05QY9zJFxNYxdRAlhqKG1gt3raSovlwpfS/IVx69FF8l6T88b1bZCd4BSosPgU4M8eWvZtKUHGoAmPUg9BKzoUr4XY5kDTPYdB39JxWY0Nbh02V3EdToBpbsXECObsXGEX65olWQdyCT/6LVMAqi0ia9TeZ/76nJaDLXYrD6htMJQcvxG8d++yMInZLYfrU1NQVASIDs4+h1bqqSkJBwJjPo0vyQ96DqbO1DCya8c5YPS8LQooo0JW9pOk9fEFeD6MjngOXhanGQpZv7j9daAIQWW4pHppkIkaZI86D4bmAEkAPtlOnbadX1bIqjVqtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 17:50:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 17:50:48 +0000
Date: Tue, 5 May 2026 10:50:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for
 drm/xe/hw_error: Cleanup array map
Message-ID: <20260505175045.GL2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260502180143.1450266-1-raag.jadav@intel.com>
 <177775217245.33192.14351989741275976103@5ab824fced77>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177775217245.33192.14351989741275976103@5ab824fced77>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f74fc1-76ba-418a-cd0d-08deaaced6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: gCTSs7yGxHuS/lD5wzGrNRccJvsTgFrvT94Fz89caRtRPddnPiJgmnUXW+TyPJD4/5YdVs55+aCng9d+pSZFi/djLkjzUZ8nGo6cs70Jit3NVE8Th+ydBImPBXN65cd3OOQstshWsrkA0WOB5MymrtyNfwD6VhJjnHp6aFVeDEPgfc4Eta7FvvBf9Rnkl7SFPB480VfEskc5nlhRFDOr28wYJWphLuOnJz02e9roTYKNsbCLb78mfzwakTBL4X2imWPHQnDLc+bmeirfDrrzUPL0s4gKb6bzDJx2s4DKwEwcdhTWgCUrvFHiTucRSmA2/GNEr0vhUB2WUJu0DrnruD0mNR+a6ZaYdxLbGh38isodXQQTcXH8ZdgjTgW/ekeBSNEgvomG5fTVXmBBoOelIFGNsPOdLo67J8JaeN0vwQ2oEcyIOmLjgZ0dtFyjL5DD7z+33ZrYASR5TXvP/M4AW9XXhGnewDZeLO2zDfEwA16+2WCOVyWpc5TjJ8JK8rLbTNqYrjqBPuNIkaPaAr5a7r0FavSKJfY5qCEn5qxBzwRmlbHJ++QpO2x2J0fBPGE77qDKHzKGRQ/Jh6T1l3/5BzYoSaGHGmbDrMrSie6Jy5/glUlH7xaUYNTRFNHsNAsa6ApjU8MgXjoRA0Cx3WyYag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dWTV41sb5AJrgkXz1Inhdb6ZKokxB0XYaCNYZgi4f3XpXcBsJiA7PAqkACtz?=
 =?us-ascii?Q?cJykOjg10d1hkaQ26jGLWH7yS9PQm8+iLeq38Ojfc4ufkdh3ohLjhm/WDusS?=
 =?us-ascii?Q?rjt0+pqJqZb6l61fCbcwaOiivbfUEH7Aj6+JnL2pnv5YSNDax8daXev/0+k4?=
 =?us-ascii?Q?kxivIaXc4BPB62Q8yzuTo/8eOXt/JCHoErs+ttzYpyqE+G9RHGEviYbRwWwS?=
 =?us-ascii?Q?VpHpAMr3lylakg8q4+dFFbYyOJE6MIfVj5LZGj0pOIqKJFFto/w6dKWIAT+i?=
 =?us-ascii?Q?nVONVVgMCFRHvlPwjVZEmqc3zYF/naEor2CEsaHazOzP/e2yfj2+oY3sYAcS?=
 =?us-ascii?Q?4+wHYHZ2jQHPP5OZOyiebnkXk0xnwx2HVCudXKkgt3qB9FCTSCK9nGha23RP?=
 =?us-ascii?Q?UDbiCIa07eibNp+YuzwVCtkdoP5rIBGm2TNoQy06ikfyTPpUybzWA989q8lz?=
 =?us-ascii?Q?/K9J+KaAss8P8/lieD8eivhe+WtVMcu0CV0AO6lYcp6iV2cLCAppCkZO+yj8?=
 =?us-ascii?Q?nmzcXyEQhqMZI8ZozqhSQ17684ZL6DeRp5KOkPcHT5iewNE3oQdzTeS/FJ7m?=
 =?us-ascii?Q?1A5yCLUaj5r1Rv/fOxt9gcyhkmc4X5JRb+ssNfB36VZ8xy4vONDYtB0d2FWq?=
 =?us-ascii?Q?7jVPIL6Vnq99ZNPvSHW2NtUoBIsAbtrKXdmXQd9Z4k81TBPJLkwym/V/Jv3j?=
 =?us-ascii?Q?7gc6m5A5hYCqsY7abHOZwlLTGhCFQG48OdkBWxLhH1filAl8no2wiL0HAi/m?=
 =?us-ascii?Q?Od6468LCASvgSqpD1vZ8ei+jZeVQgGvBdj84F+ajZYYfMnm0fXNSPsBmrUbx?=
 =?us-ascii?Q?5+QIPXhbsFw50uMNf1/etf548xNDUu13BzBoEphw0oGm0j0Jt2xzi76yuIvk?=
 =?us-ascii?Q?5lQUDOi5F0AmgBi+RRYjxpxsBC29Lppje++Sr29hiGPn/JtMYK0+f6iLnXKN?=
 =?us-ascii?Q?oRia4mY13eMJlxjHhZucSHUi5ZBQE77bk5wS2qrGoe4723EBGUGaDlij0h0Z?=
 =?us-ascii?Q?bPkRr80dY2ijAZqa0RhE6q+rLVCXw+uqzyW9YBocRV9RGvQuJ8dVBDUxvJtk?=
 =?us-ascii?Q?1tsTpGvigdJfV6G+ogctKBK/BMtqZJyneCYV+dBBIfvrMiIhUrrhYKwkxhRF?=
 =?us-ascii?Q?WmitRNnc8QEv/mefZNvW4LBp51MKz5kvE/isgsByfWhgYQ5Arn/cW98/huhl?=
 =?us-ascii?Q?4LHr2UtuDgmYvVo7IbbBZywJCUe+VRMd3wxbXgDDMh5Yw0mBQlQVC5negeSx?=
 =?us-ascii?Q?Ag+fDM/3yUX3r0jDd3lngJiGIuJ1GFrUBls56Xg9rTTLEPyC7cbprRL3+FVE?=
 =?us-ascii?Q?KrT+0BW/TeEFeSIkuUB62uhnqwYqu+8WNfC0uMho4JLHWK8UKxFNe2a10S41?=
 =?us-ascii?Q?FJbFIm8WWrWKRqkdVPWAknqwEHIdQQwRnUaNQk6hstaZP0oaj4fSb/m/ycVm?=
 =?us-ascii?Q?gGkTXuQdonK8qtuB15sis0aBJ+9Wha27c8DKtXMxpisC9/geNk5TJTa4WxZ1?=
 =?us-ascii?Q?fRDHZ+0XZ7F8mOjY7HCLCGWxlxxmI7pskMJ9h3vP47IblFiz8POYvqkaITJj?=
 =?us-ascii?Q?SrdE6C6qXRZdk6kFIOi8VApGVrzgKApu9BrsYwPVFBGB0gz+j3HYJokd/5TQ?=
 =?us-ascii?Q?Fs6Dwpr8CMDBUY/3+nGe3Ree70LMpa/kJzezHkdAqqmoFPETkams5HGPImNX?=
 =?us-ascii?Q?6mISj6a266+NzBy7ZmChiv5DsDL3Rp1Kc4rmXRZPB6scWRP/av5sj/V6jVWT?=
 =?us-ascii?Q?8UApYkgR26Rej4y6jcAimTn5vQTeQFg=3D?=
X-Exchange-RoutingPolicyChecked: A6v1ecBpLKPger7Nc6P6nchY+rjvusIuKGDABoXAV7EsHug5w6A7Tla4xac+hzKdVb8nEzm0hB0j9n0k6Hhj4mqrNrsSzS7SzCWqaz7i/nqJF4go7VVOC48WjIXSRQhpA8OTCjxKHFxLAUVZJ42UsjU5ZEOsIz6tbJDNRVjj6y6LLaoHEGXIkv0hJ3OMh7dId2s59ihDuHM8r0uJr/EhZnFFbRwN9UepLrwj6q0629C5PwFnBOb56nwpM8lJdlXrvV9xRzfAtgyVXlVyaQ3bT9nwdpJZBfrxpDAy8yzVYxgLDY6340uobUYNRYj+yQfXg85HpJtwEuF/ljK2g+ELMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f74fc1-76ba-418a-cd0d-08deaaced6e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 17:50:48.3555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCwLuTRrlG6cDJStaxqvmqCZHyCX2AtwuvTgyHalbSsS/38RvnVbjBdKMOzWChkzI9auJNukYj0qxkl5s2Q+OTzmyP0aMHGtHzqLPmgrcDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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

On Sat, May 02, 2026 at 08:02:52PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/hw_error: Cleanup array map
> URL   : https://patchwork.freedesktop.org/series/165871/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad_FULL -> xe-pw-165871v1_FULL
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
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad_FULL and xe-pw-165871v1_FULL:
> 
> ### New IGT tests (20) ###
> 
>   * igt@xe_gpgpu_fill@basic:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@add-remove-objects:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@bb-with-allocator:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@xe_intel_bb@blit-reloc:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@blit-simple:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@create-in-region:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@create-in-region@region-system:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@delta-check:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@destroy-bb:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@intel-bb-blit-none:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@xe_intel_bb@intel-bb-blit-x:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.11, 0.13] s
> 
>   * igt@xe_intel_bb@intel-bb-blit-y:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.11, 0.15] s
> 
>   * igt@xe_intel_bb@lot-of-buffers:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.08, 0.09] s
> 
>   * igt@xe_intel_bb@offset-control:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_intel_bb@purge-bb:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@xe_intel_bb@render:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.04, 0.06] s
> 
>   * igt@xe_intel_bb@reset-bb:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@xe_intel_bb@simple-bb:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@xe_intel_bb@simple-bb-ctx:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@xe_query@query-invalid-extension:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-165871v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1466])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-bmg:          [PASS][2] -> [DMESG-FAIL][3] ([Intel XE#5545]) +1 other test dmesg-fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-180:
>     - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-180.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1467] / [Intel XE#7367])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +4 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +4 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#306] / [Intel XE#7358])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7642])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#7642])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1424])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#7809])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#4302])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2244])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#301]) +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check:
>     - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#6703]) +146 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_flip@wf_vblank-ts-check.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4141])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061] / [Intel XE#7356])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2311]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#5812] / [Intel XE#656]) +8 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7061] / [Intel XE#7356])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#1503])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7283]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7283])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#599] / [Intel XE#7382]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1489])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2893] / [Intel XE#7304])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1128] / [Intel XE#7413])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1406] / [Intel XE#7345])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-blt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#4609])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html
> 
>   * igt@kms_psr@pr-sprite-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_psr@pr-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1499])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_vrr@flipline.html
> 
>   * igt@xe_ccs@vm-bind-decompress:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7644])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_ccs@vm-bind-decompress.html
> 
>   * igt@xe_configfs@survivability-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#6010] / [Intel XE#7317] / [Intel XE#7455])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_configfs@survivability-mode.html
> 
>   * igt@xe_eudebug@basic-close:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7636]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_eudebug@basic-close.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7636])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#6321])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_evict@evict-beng-threads-small.html
> 
>   * igt@xe_evict@evict-small-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7140])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-cm.html
> 
>   * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7482]) +4 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2322] / [Intel XE#7372])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1392])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-null.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7136])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#6874]) +6 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr.html
> 
>   * igt@xe_exec_multi_queue@two-queues-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6874]) +2 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-close-fd-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7138]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7138])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html
> 
>   * igt@xe_mmap@vram:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1416])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_mmap@vram.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6964])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#6964])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html
> 
>   * igt@xe_page_reclaim@prl-max-entries:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7793])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_page_reclaim@prl-max-entries.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#944])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7174])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-up:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-lnl-1/igt@xe_sriov_vram@vf-access-after-resize-up.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          [FAIL][76] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][77] +2 other tests pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
>     - shard-bmg:          [FAIL][78] ([Intel XE#6078]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
>     - shard-bmg:          [ABORT][80] ([Intel XE#5545]) -> [PASS][81] +1 other test pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-bmg:          [DMESG-WARN][82] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-2/igt@xe_survivability@runtime-survivability.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          [SKIP][84] ([Intel XE#2370]) -> [SKIP][85] ([Intel XE#6703])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-bmg:          [SKIP][86] ([Intel XE#2327]) -> [SKIP][87] ([Intel XE#6703])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-bmg:          [SKIP][88] ([Intel XE#1124]) -> [SKIP][89] ([Intel XE#6703])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          [SKIP][90] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][91] ([Intel XE#6703]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
>     - shard-bmg:          [SKIP][92] ([Intel XE#367]) -> [SKIP][93] ([Intel XE#6703])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          [SKIP][94] ([Intel XE#2887]) -> [SKIP][95] ([Intel XE#6703]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-bmg:          [SKIP][96] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][97] ([Intel XE#6703])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_chamelium_color@ctm-limited-range.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-bmg:          [SKIP][98] ([Intel XE#2252]) -> [SKIP][99] ([Intel XE#6703])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-bmg:          [SKIP][100] ([Intel XE#7642]) -> [SKIP][101] ([Intel XE#6703])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_content_protection@mei-interface.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-bmg:          [SKIP][102] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][103] ([Intel XE#6703])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-bmg:          [SKIP][104] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][105] ([Intel XE#6557] / [Intel XE#6703])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          [SKIP][106] ([Intel XE#4141]) -> [SKIP][107] ([Intel XE#6557] / [Intel XE#6703])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>     - shard-bmg:          [SKIP][108] ([Intel XE#4141]) -> [SKIP][109] ([Intel XE#6703]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][110] ([Intel XE#2311]) -> [SKIP][111] ([Intel XE#6703]) +5 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-bmg:          [SKIP][112] ([Intel XE#2313]) -> [SKIP][113] ([Intel XE#6703]) +4 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
>     - shard-bmg:          [SKIP][114] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][115] ([Intel XE#6703])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          [SKIP][116] ([Intel XE#6911] / [Intel XE#7378]) -> [SKIP][117] ([Intel XE#6703])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          [SKIP][118] ([Intel XE#2486]) -> [SKIP][119] ([Intel XE#6703])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_panel_fitting@atomic-fastset.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          [SKIP][120] ([Intel XE#7283]) -> [SKIP][121] ([Intel XE#6703])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          [SKIP][122] ([Intel XE#7794]) -> [SKIP][123] ([Intel XE#6703])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_pm_dc@dc6-psr.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-bmg:          [SKIP][124] ([Intel XE#1489]) -> [SKIP][125] ([Intel XE#6703]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@pr-suspend:
>     - shard-bmg:          [SKIP][126] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][127] ([Intel XE#6703]) +2 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_psr@pr-suspend.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_psr@pr-suspend.html
> 
>   * igt@kms_sharpness_filter@filter-rotations:
>     - shard-bmg:          [SKIP][128] ([Intel XE#6503]) -> [SKIP][129] ([Intel XE#6703])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@kms_sharpness_filter@filter-rotations.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@kms_sharpness_filter@filter-rotations.html
> 
>   * igt@xe_eudebug@basic-vm-bind-vm-destroy:
>     - shard-bmg:          [SKIP][130] ([Intel XE#7636]) -> [SKIP][131] ([Intel XE#6703]) +2 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][132] ([Intel XE#6321]) -> [SKIP][133] ([Intel XE#6703])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
>     - shard-bmg:          [SKIP][134] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][135] ([Intel XE#6703]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
>     - shard-bmg:          [SKIP][136] ([Intel XE#7136]) -> [SKIP][137] ([Intel XE#6703]) +3 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>     - shard-bmg:          [SKIP][138] ([Intel XE#6874]) -> [SKIP][139] ([Intel XE#6703]) +7 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
>     - shard-bmg:          [SKIP][140] ([Intel XE#7138]) -> [SKIP][141] ([Intel XE#6703]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          [SKIP][142] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][143] ([Intel XE#6703])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_pm@d3cold-mmap-system.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          [SKIP][144] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][145] ([Intel XE#6703])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-bmg:          [SKIP][146] ([Intel XE#944]) -> [SKIP][147] ([Intel XE#6703])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad/shard-bmg-10/igt@xe_query@multigpu-query-engines.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/shard-bmg-2/igt@xe_query@multigpu-query-engines.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7317
>   [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
>   [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
>   [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
>   [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
>   [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
>   [Intel XE#7455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7455
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
>   [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad -> xe-pw-165871v1
> 
>   IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad: 03712864f7a8ffcdd43fe3adc4cfe687f77e93ad
>   xe-pw-165871v1: 165871v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
