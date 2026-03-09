Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4466FCA191
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 22:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A65810E5D8;
	Mon,  9 Mar 2026 22:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJMKDmNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E1310E5D8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 22:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773095074; x=1804631074;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YAybT0Yl2w999sK51S3IQ4SDyzE0oBZayQVnubG+EHw=;
 b=UJMKDmNjspLmHZqNvExSXBoWvk7VUJDKdLmNxRa2LwqVVkOpZoDML3VI
 4lOZdPrifI1PXCYWwXK4DaQTiy8nj3JyihdI1d8F00mdTfFJh96SHDgCl
 MRHiNxNwQ2Om7VTyauV7xzlwHZqWoH0bvO+9dZ8rcT3LH1nehMsNgS/UC
 LDbxz6Ep2dI5rdaYlcwuoejU3NULZjG+KGsD2gMO372/qwi03kMXxychA
 kL8XD48IJOPPMrcDXAO2gm4xgMjuv7UmXhScSq+5FnDTEi9F6lapDvPOf
 S3I/FbnCWRwdNUG5MzBsC8Af82vSZF9M3XQsv4tjAyp17AHwSxPnumrZv A==;
X-CSE-ConnectionGUID: Uwh6Y+NZQTCK+OrRRylprA==
X-CSE-MsgGUID: T53GFOymSZaQ3edHjnhQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73831582"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="73831582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 15:24:33 -0700
X-CSE-ConnectionGUID: yjZ2pJc7R5WLeAFIG/d9oA==
X-CSE-MsgGUID: mIxdHZXEQnitBVFyAuLYiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="250365657"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 15:24:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 15:24:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 15:24:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 15:24:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrL19Yf+fWHSOawSWBOSefq/FcuSTHluoEgxZ0trC42IVNZ68T7ClGgGlXAMBHLOVtbZmgll2JfLbXA6aUKBn55sXx5xXQp2p+G9NHs1tJSgZmgVZQ4OvxfKP+w67bO6ORxqB/bPC8yJ6CZuO5uWepZy696D127RTMTF1WiFUvUrqQu9FDZ5J/c4lL4P5qMa4uHeO7pColhbZwfMrfaBciuk+tQKN37Jx9iHw0t3z6VhapmtrkLvo1L4qQcZeZOBOAmBDZMnQf1YeMFNso06eb15YZPLRmfsjRzKh3D+1sdfH0XynfYyQvavLwA+xFsrsFKSEzKaUNYpAHGVimKEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuIc8nuwH722PC3SNXwdXYi2wHaiArF7inMx27NFK8Y=;
 b=SgSZ31LdCIBQz5RmNrtD51Ywb5whxLVKVZfRoI7fAIXylXNO01pZNrmRWb55Gk/xCSO2ekTUaDFHKym1N6WSePkp8s8zfwJ0Vw8e2rmXMC3Yo1FTuwR0ZiWWANLfX+Nx62n7/Zlno7rSoBpNPWduYPqkaEdLju0qExGMSG+Yw89nH5Ty0PgsdMk4gHfL5Nu/lZhQ4qin3fvUdSotpe0GY4YANvtk5ED6uWTpNMYcefSAxk9wM26YVBDJQ0mA7mZiAM6gMasBGKx9vSbQWAb+qrnZS6QUDsTbDxRF6KWGgqx/AFClJE9dKaI8oAuIzQbpqxL+/C8Cpaq8aw0ofC+/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 22:24:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 22:24:27 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.BAT: failure for Extra enabling
 patches for NVL-P (rev3)
In-Reply-To: <20260309220848.GC52346@mdroper-desk1.amr.corp.intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
 <177309013042.335367.3672549934691530510@a3b018990fe9>
 <87ms0gacfd.fsf@intel.com>
 <20260309220848.GC52346@mdroper-desk1.amr.corp.intel.com>
Date: Mon, 9 Mar 2026 19:24:23 -0300
Message-ID: <87jyvkabfs.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 53213609-82e5-46ac-0534-08de7e2aa056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: loVc4uc2woax0i3vGKDzvMPSi9TYJlMa9hoLZt1sB9jDYHQ/Z4KMdlEGdCKn/Ydzre1Et4WmzyGhSLNJq+v65Kg2a0pWr91i+Ya0In6THY56ePWi8FkZVGBT6cLw8yv5Nd6vw4QPMx5AHHNlodBN7r0Z3MW8kAu/8mj5SDqzuqrH4o2P+92RwtHFA9VHqRAufN1GjxjC31ZMOW3kf4cr1nysk9XF4o/kjeTIwN9/g35n2VwNF6+cA9AF66bIVTcn77d0bRYDB1bUl2EiYi/6Zm4AT4xAWgwfIqm9zXXWutsqDf/Gzzteymm3a5Zk4Fh0CTOAypm8dPXdtyOGVNWXaKB6uieY7zT3uvOckgnYyRtPKHuTWS1SKNSZRnTerBdA3UV/PeHthCPUCSp8Mol3/vuP0bbJpyFooIWJOjeE7aQGjMWyLrwYnkmsk0w4gc/JBzEIwPuKAribLvEOjMkcTBJbKMiITUQsoK32RLGYiKH1JUHhzy1aNCxDTpVecYN4pSAviWptggfeVCbOp2JXO0OywUs/3QSUsESBAtqWnPZsNY1qoKZ9njlun/ad7Q7ZfLhRtPH3hfzk9d0vLUA8EuYdmgPZ1ctE2B7NFdoJFRaAs9EeCIdrtANx+F/6yJqlRk4S4g+ht48JuPPasrSoDVCJLPDeSqBHVN3JO4X7hvWmKNs9iaa9tzaC4hIX8ShP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3KsFK/Kkdcu3ERouQ7ayowoX+1A0DgDw0vItwuhCEmCONYzOK8ZnhjMsPTLm?=
 =?us-ascii?Q?7+hBeqhdZcbDGM2SZH/dOnWEthFz2v61BDU0leBVnj+xFmw/Zy5WEDunHw0H?=
 =?us-ascii?Q?P/z9L105lKeVkhUEhxzHT0ZL0pdntNhdkkoROqJ6HWIGvSHdBtVi6xDgL31A?=
 =?us-ascii?Q?CJR8e0gv0PR4sopJELi0YuryvxwbTJhRqgC5Sr9J9njmSdX1g16UnNioTX2x?=
 =?us-ascii?Q?FJfRuhuFyU5rWoodDMd/8XY7YgUfELECFqHH1FEmQfrbpbUVKtZZqc6DJowa?=
 =?us-ascii?Q?yZbEsp+GxxfQTX+pKLOjy44IgWNUu1zj6ft+nAZlSh/rmzvw4XidDEUzsuqJ?=
 =?us-ascii?Q?munPPKKRbuahT5SLl70pBNJs50mp+fTvyjRheys+bvBaVKG0I/LEzBKAmfvd?=
 =?us-ascii?Q?/ON4d9/0ivkQnKs0yyMmw6ok5PioxpGp9p8uu01Q/TyqG5Vri0R34z5FVbUz?=
 =?us-ascii?Q?0X8YxQobwWYzd/gLG5beWGJk1jxhur2evQQIhvgYl69+VX7w/wyqCVwWhzQU?=
 =?us-ascii?Q?wnaRWT5KZtKeqQ1YOLOlEKHWIHUzu1SdZzAouh/ELVlaVH6synuLkaTaSjLi?=
 =?us-ascii?Q?XcDqrceIxAJBRc7deB9u5+Aryl0MXA8G1u3p1e+I6Z3qfVEAzlHdoNkTSDmr?=
 =?us-ascii?Q?19n1bYH06DYNO+YCiWxY0WDjJuvq5hmORYY9TEh2wJEZWdbwFitBA0B6oQhP?=
 =?us-ascii?Q?QVZxe8HaWhYwB86HPsQgqFlVMsrWdRXuRUlAiaQ9399CDRaHEES1ACuFJCK0?=
 =?us-ascii?Q?Tugf4WB36HcQAK69yhj+SqTVZz7xFyDgeOQRRjCofFLg24rbT9HtrtBvgBtM?=
 =?us-ascii?Q?SyJ0HcOYwOH/MbtMPmXRUWVJz/U619EXSYF0HuwJTwOOwzRqUHRyHVwy8mDF?=
 =?us-ascii?Q?5dDKtYvSAHRbTtvfaWB1e5MHKF+Cx+c6N93wzmgT68UQ1KkLBFybWSrEnubv?=
 =?us-ascii?Q?Gfpe5yel8PJyujsePrZAZJBjBQ5trzY8+GQN4U8Pu+8PEdZslsW6R5EdHf3d?=
 =?us-ascii?Q?4EJ+YXQUJjbb3Cza5xjVP7+/vQwv7ZmhZG2+XXGBERtwMDE0wBAsdutoKMXm?=
 =?us-ascii?Q?xODF+bniQB8o/HhyCV0XT2jqwu7BUsQ4xidDlZEjjcORM/DQVlg8UpHx97tV?=
 =?us-ascii?Q?7nlyOFkmNyuV1D4UyOs47tvpZZCrISt5pAcM8P2ClfwbpI2E/IHRWHPIBFR2?=
 =?us-ascii?Q?M9qhpPg3SabCoIC0fPoJmeN3P1VhPEAQ9/FpOyovckZj0Q6qMVq3eYIB4vZ8?=
 =?us-ascii?Q?v3WA3Tp6DmuDQ3A1W6mm9jKpG2r82ELVQVzz9RWhh8RGoraQ4f7Dcgi8Od7A?=
 =?us-ascii?Q?FpqmdG39ohkyof7bzdru9yo5TpgwSYqMY0fA9ES2ZQybyQfT5VYrpQp1nHZ2?=
 =?us-ascii?Q?hQR419EVbg5ZmZIvozGk1BZK1uFE83iWSmbNFMGPPWd4D59WWFeU/7iDekIq?=
 =?us-ascii?Q?Bwr0S0KEuNGnWG17zdf7tcLwlK8J+vpgHjgcHpJFjT7sS5s7BVDMMge6ylCe?=
 =?us-ascii?Q?SsCR/s63VivqvHlEDVWtPS74R15dZ6UvXo8yCM3z7Nhh6feW2v6H1CB71YEh?=
 =?us-ascii?Q?EDUzEHbNT2gjCK4DrrC5mP20zZ30I3GKU7Omge8MX++Hz4TIkrJbKmLl8q8Z?=
 =?us-ascii?Q?XsM+rPr5mQyEJrsXaZvs2mqwKnbboCysyKn4fFEan2L1grwY9byGvGW6szku?=
 =?us-ascii?Q?FXbz4suDyoKj8V8xUZoEhnWzAqUlVak/HwmC8rrcq7KtXYj5eG872fgcHaxJ?=
 =?us-ascii?Q?/Xosml6Jig=3D=3D?=
X-Exchange-RoutingPolicyChecked: qKm683fv4Sdf2aKBtD+3vuD8HXoR6FrLaZzP1w5IA9OmKHMYu1bumfSH/VvygCymQ5svzVO9WU1ik+PLqF0KeMqmXSarTJroSNubo7blyMabATnIfdHo5/tbMnPLsQPuU1BmO6sZCTjoeIyWTyn9YkY10dzWBWpXdTk9J424abYD5KmkktV+snwhsoZrBhX8v0S13mREbceuHoVLvb3vT7J0ukKaVsjSIywZvLFBE63s0d37CW1sfHUKTgNyIfW1QjKipEdUBUBKl8k1Sv/YD60oywFNnN7A0hI3spbis2PD0NlhOQKPYRaCAj/i2pZTaSqwq69hESr82mwt6TDkAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53213609-82e5-46ac-0534-08de7e2aa056
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 22:24:27.8299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh/JVbRwLIFbO8xh7oSGtcXvx9ue7JiJMZOTCCXAan1PH+Hp5InbIK1aRLJp8Ut7QAoqLtfZkxkF6vbAqWO/DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Mon, Mar 09, 2026 at 07:03:02PM -0300, Gustavo Sousa wrote:
>> Patchwork <patchwork@emeril.freedesktop.org> writes:
>> 
>> > == Series Details ==
>> >
>> > Series: Extra enabling patches for NVL-P (rev3)
>> > URL   : https://patchwork.freedesktop.org/series/162666/
>> > State : failure
>> >
>> > == Summary ==
>> >
>> > CI Bug Log - changes from xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c_BAT -> xe-pw-162666v3_BAT
>> > ====================================================
>> >
>> > Summary
>> > -------
>> >
>> >   **FAILURE**
>> >
>> >   Serious unknown changes coming with xe-pw-162666v3_BAT absolutely need to be
>> >   verified manually.
>> >   
>> >   If you think the reported changes have nothing to do with the changes
>> >   introduced in xe-pw-162666v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>> >   to document this new failure mode, which will reduce false positives in CI.
>> >
>> >   
>> >
>> > Participating hosts (14 -> 12)
>> > ------------------------------
>> >
>> >   Missing    (2): bat-adlp-vm bat-ptl-vm 
>> >
>> > Possible new issues
>> > -------------------
>> >
>> >   Here are the unknown changes that may have been introduced in xe-pw-162666v3_BAT:
>> >
>> > ### IGT changes ###
>> >
>> > #### Possible regressions ####
>> >
>> >   * igt@xe_module_load@load:
>> >     - bat-ptl-2:          [PASS][1] -> [ABORT][2]
>> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-ptl-2/igt@xe_module_load@load.html
>> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-ptl-2/igt@xe_module_load@load.html
>> >     - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
>> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-dg2-oem2/igt@xe_module_load@load.html
>> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-dg2-oem2/igt@xe_module_load@load.html
>> >     - bat-atsm-2:         [PASS][5] -> [ABORT][6]
>> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-atsm-2/igt@xe_module_load@load.html
>> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-atsm-2/igt@xe_module_load@load.html
>> >     - bat-wcl-1:          [PASS][7] -> [ABORT][8]
>> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-wcl-1/igt@xe_module_load@load.html
>> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-wcl-1/igt@xe_module_load@load.html
>> >     - bat-ptl-1:          [PASS][9] -> [ABORT][10]
>> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-ptl-1/igt@xe_module_load@load.html
>> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-ptl-1/igt@xe_module_load@load.html
>> >     - bat-wcl-2:          [PASS][11] -> [ABORT][12]
>> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-wcl-2/igt@xe_module_load@load.html
>> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-wcl-2/igt@xe_module_load@load.html
>> >     - bat-bmg-2:          [PASS][13] -> [ABORT][14]
>> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-2/igt@xe_module_load@load.html
>> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-2/igt@xe_module_load@load.html
>> >     - bat-bmg-3:          [PASS][15] -> [ABORT][16]
>> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-3/igt@xe_module_load@load.html
>> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-3/igt@xe_module_load@load.html
>> >     - bat-bmg-1:          [PASS][17] -> [ABORT][18]
>> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-1/igt@xe_module_load@load.html
>> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-1/igt@xe_module_load@load.html
>> >     - bat-adlp-7:         [PASS][19] -> [ABORT][20]
>> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-adlp-7/igt@xe_module_load@load.html
>> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-adlp-7/igt@xe_module_load@load.html
>> 
>> Oops. It appears we've hit a chicken-and-egg situation here. MMIO
>> functions depend on device workarounds to be already initialized; device
>> workarounds initialization depend on xe_sriov_probe_early(); which, in
>> turn, needs to use MMIO functions.
>
> Ah, we do still have that early MMIO device workaround in
> mmio_flush_pending_writes().  I looked for that before but missed it
> while grep'ing.
>
> A quick fix would be to drop the FUNC(xe_rtp_match_not_sriov_vf) rule
> from the device workaround and add it as an extra condition in the
> function itself.  Then we wouldn't need to change the current placement
> of device WA initialization.  Then longer term we can look into allowing
> device workarounds with additional rule capabilities at varying levels
> of device/GT initialization.

Yep, this sounds good.  I'll do that and add a FIXME comment on top as a
reminder that it needs to be put back into the workaround's rules.

--
Gustavo Sousa
