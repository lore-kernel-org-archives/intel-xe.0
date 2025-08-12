Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5C4CA0EDB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 20:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED40110E0D4;
	Tue, 12 Aug 2025 20:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHX1Hnti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FC910E0D4
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 20:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755029772; x=1786565772;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t1S6SiFosojciSqI6E0OGFnXbZ8UazcDKb8fA4irhq0=;
 b=QHX1HntiS1d+yHiL/nuAG4kYvRTcF5lMpqWHNOgRMMGEpi6Srs6JYarq
 R/DMhA0GuxPHX7MjJa2ObWG0imQj7o8RvrKPnPjzxRXscLkRtq6I2mDNJ
 LJ4SWj/fTWvTFcaL88yoIbtJ57azuIeUIqFehfHApKFIniZr0Nie89+BJ
 exPT26Q9U2FD7uZRobwFLSVDyt/Pk0N+4YFmbvI9cxlbjiDjupfj7iSud
 xgnwEHRoSi03xk7/ivuDbfxTzuFVYVX1jHH1daRS48Q/uOZWe3SL4OfUz
 fNpXaaWStXbV8dt3VfM/h5O2/9FPTnW248WkjLNWKMF0tgMFdqrqr9YcW g==;
X-CSE-ConnectionGUID: odt52ZLCRMOiaMPmcgbBdA==
X-CSE-MsgGUID: N2EpaZ/oQaKUjiMeefrmJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56342982"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="56342982"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 13:16:11 -0700
X-CSE-ConnectionGUID: 8gdZSiSzTvSn1sE0zTNbpw==
X-CSE-MsgGUID: yFHP1Xc3RIWJ8uxhFQ7Utw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="165915299"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 13:16:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 13:16:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 13:16:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 13:16:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoK6a9OpezYT9a4XAfG/PeFkSQB0PlKFI6+0psoW+6fJmUwXf/oTdjN1pyeqLZdTOcHuDtDE628DMoaT8Jf56YfaIOZYjCA3opxjonPrzAbbGtmC9LQtUB1/HoYZby0tm7OkP0hh6HS+e3EOjypcuYa9ZtthqrH8jyNDDxfc+YyKL8V19yPFZfMjYnNSL7t1snbSPayrK4+PfeGwC6pJEldugxnHvHj57h7PFg8Z+2UFc9sRaXZIaMCGMM3v7DtPvRlVSkGERBSVaOgfTGU64vQ9AOoEHuLwm5loXDc+LybW3+wuEZIVWqIsAIcmb/1eDzpF4fuwQTnkvj78vRpBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1fgs7SDAeywFzmOtOCb7gmDwofxPrXnJ8wqFeo7IKQ=;
 b=i9oHn+yBR6Y16U00A8W9YKExEQW6IbKjZKj7TEmhubN8s+nXSd8vuQa2Hki1YcTOcIHZ/lxE75FDQo57GuBpXbylMJ2F1Oz2SiBiI4B9XRHPsIhIo/kCAUxsgX6KSdZ+H7gWlbk8a32Kk9u0QP1NR8Gi9D3aQrXCUgcPGbyzvROcN3DfvAkfEaGSuPl3TNxGX5xH+N7xID88HxXeSTZY2MEt1bbi50mu25nIZE0M6hVaUcQSbEdC8xxVDhygV/Nk0G8sAe9ic/Id+Wsjy1wQgfEnLhlpNN9DYaobMGcFpiddn+4d5PIOX95N5V05PKUs47GUIU6yhk+rS2AfVaH9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Tue, 12 Aug
 2025 20:16:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 20:16:07 +0000
Date: Tue, 12 Aug 2025 13:16:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Untangle vm_bind_ioctl cleanup order and fix
 double free bug
Message-ID: <aJuhBHks6FWf60Wh@lstrano-desk.jf.intel.com>
References: <20250812131728.42314-1-christoph.manszewski@intel.com>
 <20250812131728.42314-2-christoph.manszewski@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250812131728.42314-2-christoph.manszewski@intel.com>
X-ClientProxiedBy: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: dca9463b-cb88-4ed7-d407-08ddd9dd1248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KODKsgn41mwDSfCwRN0U2PjV3jboUXAgA8uF+driDDXSv507HMxv2ECZeK2O?=
 =?us-ascii?Q?0m3BGJHQPmWRzEbDHTfc54u1aUu5SuDrq0F5IsW/pjfr+97SanE8WSpRLveO?=
 =?us-ascii?Q?pySySmiczc+sH5dKX8Sl57ovNMwX8wLGodSXEeQblNVC8Zy7i2UjZTdGH4vT?=
 =?us-ascii?Q?vCrExnRaM4wFWptF+8e8S/MiZAki8+o5NJ+umUq6mGW1f1qt/0dLX3e/EhiC?=
 =?us-ascii?Q?blqsEUdkx7+7b47CVVUFP/bft3zJ3UaNUyRk5DInb4vWgIQgZGajOKK5O0Jj?=
 =?us-ascii?Q?AklTaHeqg9+4zq7GaMG9QXWi1QnEuEW6mTm8/IoZRWM+8op4IF+COIJStdZb?=
 =?us-ascii?Q?yoxr/mapzKKFr7+VuN1eP95U8toEfn4l8imJqWC56ovbi1fAfAZMxZQbtBgJ?=
 =?us-ascii?Q?gY/5hf2MqRaETovnpsgTVrmxWG3IYIcuDKL3cSHdJGWbcMKd9qKPkwrW0tpS?=
 =?us-ascii?Q?hU2aNt0J0KMlSuY7QT9jf+CCGehQZ+CyUJQdQ3Ne23Ds8jVyR5f9bTPP5r22?=
 =?us-ascii?Q?3AM6xW81E+XrvKicN/Mp4LrUpz8x5ku/Flw/PFcW642jjwACBpLdSwuw2FjS?=
 =?us-ascii?Q?eqx/+RZnRU8cNSY7Mqw/kwXOAecQ42DPYuc8CTWxUaovPk70/sfnMclCAYI/?=
 =?us-ascii?Q?RSm+SJCUsBKe5lddek/zoBepYNYiihtSUUN/E4cce9fTTCNM9C4rTJ5alAuz?=
 =?us-ascii?Q?G4dzklm7aKWsBvuVtJjbvloseh1FCV5ky0OOIPj25EcendejgkIzGrs1hvfh?=
 =?us-ascii?Q?/ouEJFcJ1aENX3JUfA1i2xueJb7X2rbGzy2l2s6RE9h6iakbwuDjUL2chZf3?=
 =?us-ascii?Q?7Xx0atTfbnywIEbV00IJYh6lEliwYDrpXAZKMif0vk/+j2MCkYOgqBzyF8k0?=
 =?us-ascii?Q?NE50OsiiWh83fBDXJo6meJuqVz/46AoatMVIstqgR1f8JduF2j/8QMu/Fyuo?=
 =?us-ascii?Q?9gEUNcLiIhQ3pjMF8Q10l7PecvI+rxkRHlrSeAkJAvx6FGAVSXUoQ5SsGhOx?=
 =?us-ascii?Q?FMuGBq+/MISWoykulb9DZMz9ED8y2CtDkN02iDHt4IqlhCMyn+LUXxwzKPGW?=
 =?us-ascii?Q?9vNxRkYCui1X00SlFMPBTjTnJlv5xolldrkWLBB9bQjATPZGzPvUx0OzT3Ut?=
 =?us-ascii?Q?kmuC64FoGsPNcGNAiKupNDfT+W6JL++B6AaqVlfE4j+tS4U8LCLGyJ8GJDc0?=
 =?us-ascii?Q?sNtzbwV4UmkFvn5wCuVm4Nt1BouzWO8bjqw/5zO9IK2X57CmiPY2byt4gAVB?=
 =?us-ascii?Q?lSj6iReouyrUDlmdIsxBpveon3yMCPogA7v72FI5+LH5GezjscX12uS4+k0U?=
 =?us-ascii?Q?vKdHUYFnN22AQzSbpCvy+tCMbrEm+bYTodkizLscLEPyWbBsCEQfFa4o5i1v?=
 =?us-ascii?Q?M+L6EYaOsvqKzFU8xZpX3JGbkok0cxvobLbAfvoYdm9iA8IJ+gPaxSCQYrvD?=
 =?us-ascii?Q?vtv/evAARI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b6aJOBHpfZD3QpgpcE3ZimgBFWqCMo7LowG7ajgdqgzRE+NiYtSR/b28txhp?=
 =?us-ascii?Q?qcQelKb9mLxQiDN+RV1/AXNdmM1s62suNxDif6BlYcZKIO5SssvYa1/79mGY?=
 =?us-ascii?Q?gwHCIhNYTYfefBwCSkxvm+ePmC96o0Ms8nXjoJx5lpyzlNGuYdv7iQnQSN6x?=
 =?us-ascii?Q?vJrYwLyXBiFEmPhV6jJF3wS2wS2HX5dRSGqPrbLvG4JHE3CWCJ8C81EmlyCs?=
 =?us-ascii?Q?/+9BWBBGEnTHVlXBmQ6nuTDrwx4muDlYR0lxJoCjhj4xa6cCXK7GbcEfWtA5?=
 =?us-ascii?Q?P3SrRNrwLoyi9LJMtKm5N1qULKqh5fUysiggBfBUVec+bAbNXnfiMp1gTmRQ?=
 =?us-ascii?Q?11q1fBmZ/sn70rXIV1CCXXbVZHizvZ6Rzj5p9Crvor662gl4cVYV3vXtd6En?=
 =?us-ascii?Q?RxDmDP82+ADsRVMEtMYCfX8Hm6nWHFe+KuP8Z9CURsGoPUe38Ywi2JNOzaSp?=
 =?us-ascii?Q?J3QlzBEFxt/Fv81UdXveaAeNT4AHjQqGvXcitxwSHhJIVe5qAdIPy1QHbVTw?=
 =?us-ascii?Q?2IH0Z7mWY4MveilUawZKJthp3lWuP0NYl0G109XrXjJqQ09I4YJFE3o61kN0?=
 =?us-ascii?Q?8aCvhz7RRX83068/FaFheDGzy0faOwko0fGxi8YnhW6DF4jKKjvnuHMbXpop?=
 =?us-ascii?Q?VjitLQt/AzMO7SQxCs35MMps+A09ZRrKqW2g3s1igxqUtKjTDZ62/4BsLd3a?=
 =?us-ascii?Q?IG0aDhOuRDK/vBck0inW6ZaPPg9pdeaL9ylpXz7IN7Qddsf5suY0SzZaee3H?=
 =?us-ascii?Q?Qt6JvpOatWuX3JLQlhzeoMdbCdLiVI4XD2MTDt1mKyNeHd90S6LpOGU54pbO?=
 =?us-ascii?Q?r1nagZS+bh0CvYnoGvJwkwdbJGtL7TRoiGRTMIOzluXb9UxrXTJLT8rYEbT2?=
 =?us-ascii?Q?+V1wbtR1L6bxNQZY3anD3iIvExGhB0dt78MJsl1b1oKCrFZSsICLa46/+B4f?=
 =?us-ascii?Q?OejURTwUUEI9p4FOVJ9+dn8/tLkiFH7DH/XDfD5/OTQAINslrQoywDH7heK6?=
 =?us-ascii?Q?H/ANrEvgqeMQ590m0CkT41ICT6QCV46YqJ5zVuNUIhc45TZadY4kckFrukhZ?=
 =?us-ascii?Q?sbxCJK1St7MQGNXcgFgEEn+6ECYGyXbGn0pMjZufSa8Brz6MhcetifSgbVsK?=
 =?us-ascii?Q?QaeihwWiIvTvkIyK91gVjst5P1j/dol56f5A8zpcDbgl3aJ/0kVLFI5yWr9H?=
 =?us-ascii?Q?tegAXt/bte193FUExT44GHKsXDuDBzhSES4jU+33CvYIb/fn/3sThhEbsZFr?=
 =?us-ascii?Q?1WPkNkB7nOS/UuN5YFuvKYu9Z4TCBUIi0QJ8IFSex+GZdZbmlPMC7hPyUbUa?=
 =?us-ascii?Q?xYQC58tYxMeTUllUJ9sACr+iCnxTVLlZWG/TwKPOJynFggXQ03mDLnxsW3ZY?=
 =?us-ascii?Q?ENyRey3xxTHFKIIfUAD7oY1YuHjjeZmbRTN4J0gJ7mEX0zPqBST/dImNiD6L?=
 =?us-ascii?Q?nB/gQ4ogE1ZJVQFSSVuHQThcVJrhggINiu9zy0BC6DR1Y24df+kq83/FLCwj?=
 =?us-ascii?Q?7bLwrqHY8NrYj5dqWpZ9YqxSp/HiA/hM/gfZz6dODOLJNlfKdnWvZFwcz77K?=
 =?us-ascii?Q?1Vm4KZjwZV+0y9DxmT/WfGs4lCwPyX2GvaWHE/wYNfsoWYcGnOGGAEdUXF19?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dca9463b-cb88-4ed7-d407-08ddd9dd1248
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 20:16:07.5582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9c0Exck+zTi+LtyiUrdSUw2S6kuC+7nj5qOIFUoJDsC8FBAow54Bqrq6O83t2aoM5tptnGng3KfCcA1aA0o6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
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

On Tue, Aug 12, 2025 at 03:17:28PM +0200, Christoph Manszewski wrote:
> If the argument check during an array bind fails, the bind_ops are freed
> twice as seen in [1]. While at it, fix the ordering of resource cleanup
> to align with reverse allocation order.
> 
> [1]:
> ==================================================================
> BUG: KASAN: double-free in xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
> Free of addr ffff88813bb9b800 by task xe_vm/14198
> 
> CPU: 5 UID: 0 PID: 14198 Comm: xe_vm Not tainted 6.16.0-xe-eudebug-cmanszew+ #520 PREEMPT(full)
> Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2411.A02.2110081023 10/08/2021
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x82/0xd0
>  print_report+0xcb/0x610
>  ? __virt_addr_valid+0x19a/0x300
>  ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  kasan_report_invalid_free+0xc8/0xf0
>  ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  check_slab_allocation+0x102/0x130
>  kfree+0x10d/0x440
>  ? should_fail_ex+0x57/0x2f0
>  ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
>  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>  ? __lock_acquire+0xab9/0x27f0
>  ? lock_acquire+0x165/0x300
>  ? drm_dev_enter+0x53/0xe0 [drm]
>  ? find_held_lock+0x2b/0x80
>  ? drm_dev_exit+0x30/0x50 [drm]
>  ? drm_ioctl_kernel+0x128/0x1c0 [drm]
>  drm_ioctl_kernel+0x128/0x1c0 [drm]
>  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>  ? find_held_lock+0x2b/0x80
>  ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
>  ? should_fail_ex+0x57/0x2f0
>  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>  drm_ioctl+0x352/0x620 [drm]
>  ? __pfx_drm_ioctl+0x10/0x10 [drm]
>  ? __pfx_rpm_resume+0x10/0x10
>  ? do_raw_spin_lock+0x11a/0x1b0
>  ? find_held_lock+0x2b/0x80
>  ? __pm_runtime_resume+0x61/0xc0
>  ? rcu_is_watching+0x20/0x50
>  ? trace_irq_enable.constprop.0+0xac/0xe0
>  xe_drm_ioctl+0x91/0xc0 [xe]
>  __x64_sys_ioctl+0xb2/0x100
>  ? rcu_is_watching+0x20/0x50
>  do_syscall_64+0x68/0x2e0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7fa9acb24ded
> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> RSP: 002b:00007fff189e1370 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: ffffffffffffff68 RCX: 00007fa9acb24ded
> RDX: 00007fff189e19f0 RSI: 0000000040886445 RDI: 0000000000000003
> RBP: 00007fff189e13c0 R08: 0000000000000000 R09: 00005561d3fb47d0
> R10: 00007fa9ace29be0 R11: 0000000000000246 R12: 00007fff189e19f0
> R13: 0000000040886445 R14: 0000000000000003 R15: 0000000000000003
>  </TASK>
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d40d2d43c041..0bfc32fd8399 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3442,6 +3442,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  free_bind_ops:
>  	if (args->num_binds > 1)
>  		kvfree(*bind_ops);
> +	bind_ops = NULL;

This should be *bind_ops = NULL, right?

Or we could just simply delete the kvfree here are let's there be a
single free at the caller too. I'd slightly leanr towards this option.

>  	return err;
>  }
>  
> @@ -3548,7 +3549,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_exec_queue *q = NULL;
>  	u32 num_syncs, num_ufence = 0;
>  	struct xe_sync_entry *syncs = NULL;
> -	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_vm_bind_op *bind_ops = NULL;
>  	struct xe_vma_ops vops;
>  	struct dma_fence *fence;
>  	int err;
> @@ -3566,7 +3567,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>  		if (XE_IOCTL_DBG(xe, !q)) {
>  			err = -ENOENT;

All of the following changes are not strickly required, given kvfree is
NULL safe? Rather this is just a preferred style cleanup. Since this is
a fixes patch we'd want to backport, I'd split this patch into 2 distink
patches - one which fixes the double free, one which cleans up the
style.

Matt

> -			goto put_vm;
> +			goto free_bind_ops;
>  		}
>  
>  		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
> @@ -3612,7 +3613,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			       __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>  		if (!ops) {
>  			err = -ENOMEM;
> -			goto release_vm_lock;
> +			goto free_bos;
>  		}
>  	}
>  
> @@ -3746,17 +3747,20 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  put_obj:
>  	for (i = 0; i < args->num_binds; ++i)
>  		xe_bo_put(bos[i]);
> +
> +	kvfree(ops);
> +free_bos:
> +	kvfree(bos);
>  release_vm_lock:
>  	up_write(&vm->lock);
>  put_exec_queue:
>  	if (q)
>  		xe_exec_queue_put(q);
> -put_vm:
> -	xe_vm_put(vm);
> -	kvfree(bos);
> -	kvfree(ops);
> +free_bind_ops:
>  	if (args->num_binds > 1)
>  		kvfree(bind_ops);
> +put_vm:
> +	xe_vm_put(vm);
>  	return err;
>  }
>  
> -- 
> 2.47.1
> 
