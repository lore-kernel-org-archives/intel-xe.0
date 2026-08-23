Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296F8C5DF8C
	for <intel-xe@archiver.kernel.org>; Sun, 23 Aug 2026 12:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF8D10E4B0;
	Sun, 23 Aug 2026 12:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9a0f9gm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BC510E4B0
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Aug 2026 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787487417; x=1819023417;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=1SowlgmUgd39tpYfN9whNPiNxFcMT73l4Xiu10yGwYk=;
 b=Y9a0f9gmdhzBdJ8Rg7WpFPShQhojAeGcQB8kFz/OQHnSLs0OYtXRFAww
 51E3E/OfBovxd240uECCdgN5mD5ff8482qXd0Q4gT1Ebi8E0pGnPSPaxy
 M2GkKxUUPQh5Cd/v1Cioh4LBsTl+qCSVna46Hu22o6gGsMQDzkmiyl3CJ
 Ocq3QIedJfe+m0FZolTtd6zhTVBsTqxbvmqi57pkWu54OoHoWEouWm3ni
 xH0HVd2KJ8Ij+Sj7m51P0+cSwncAzTxWaGl4YpyuKlF+NQo2CxZbY7TIM
 +gYXUh0aCWGsC5XeGCx1cDvHqn/Yln3xjR7DaenifxHuXbBMazoV/8Y9k g==;
X-CSE-ConnectionGUID: 5po+NkUrTsWoB/wa0JJFBA==
X-CSE-MsgGUID: breOaeIoSgGiJcUvbPmyuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88089137"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; d="scan'208";a="88089137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 05:16:54 -0700
X-CSE-ConnectionGUID: Twn3qZelRzO1T8PsHDcuEw==
X-CSE-MsgGUID: xl7yULYFQumtxQA3k6r/rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; d="scan'208";a="264991938"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 05:16:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:16:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:16:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:16:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k14iGS97xTpGfCuvIAwgalXrr3iES3803ofpK7A3T6JrRNKUXZ3BUezGr+LnNq96NG3CePrCAahdu+jvZ0tVKp/8LaIredLS2CS00RW2FnD5e5GxAFaJ+C8TFDZR8cqBhTMApDySoYFHQKB82YU9BMfYUMN8Y+t46YoHnpLV36eFSWLOKKJgEwaPZwimqRNjwBbWDYKJ9YDyeA8FCpD9JvqR920tim/Bqx+uarSjtlfywqj4TLFdTMMfd44udbapDTPUZX+RD5UMbf7WfGzhJTvQqVz7Uo3WxRiON2BxDH34jH7i5d6x7bAj+snaWATPXa7sThOF92qVolr8pfOF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ClH7ERzpWJW0B+nqjVJtBmWew0KUZEeqNuCkgU6hEc=;
 b=HzYpfQEmRWCGIB855RuQs5ZyDZ/qZCHp30Y6ASnt/wUElnPV/T4WOXWkC7PQVg+6WiufyL3ptH+8m66ADthdhXJEXUpolTFThyl7h/8w+VEp0dmawA9+uIOtZ9Y5ZQ7q0Y83hxffxg93N5DPmoGw/xHuHSfqjYHTpXSikBtFvCZYB5k4SB58Qf0EoIu6QvPJaWEQRQAufFp27piWFmtIGz5H+TUYgS0fIHcV+/lW8hhBuj/VLNp16PZu3IDoUYnn36vNUS3UPxMWWcc3pInVPq/BIw0PREFupYhUt0piiQeoYo/u9HzaSpNahUNLcY+KzzxhKic4qs8MCDdlaZr/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:16:50 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:16:50 +0000
Date: Sun, 23 Aug 2026 20:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: [drm-xe:drm-xe-next-fixes] BUILD SUCCESS
 13087ad7817e6e5f210064518bfc4d6d58a9c2f3
Message-ID: <202608230528.rClER2QW-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:820:d::7) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d0e606-cf40-4580-981c-08df011068cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: cw7oJ6gaJU/rK2XY7Vx1GH+TBz4rZMrz3rO8j5w4+h146Wtl0iDcTOzMczgRuGTlwEe6WAqcSkQry0FKzTO8un36qC1eGGSHHzvz7Aa7YQvndS3F1qKsyWo1dbS/+kCVWopuS7XY/z8JEO2UqlSu9uHNZUaFoGUso9dzDQwgVbqwsGYQKLBXC8wuPN/uZvPP1TsD1tRID0ez3zNmUG5mdz5i/cRVYwc1hfeBtuvbtiNnFH5+f0foUOwfIScm5zi2Lib2yHPGDYQNh3DktczllbX4kDZ7yZucMssavPXQzBv5DzWkJYGB0QqUYdlP2ZUM7BsU7BZuNhP5GRhaM6BlG4j+Me3brr47ysZemF/FBBWxZH4/5hcpCci70/sym0ZbdmBsrRVqnqqSvz/zvzII9fHZ63RCseuVsN2gV4kw90NDaUCKAqRHRAB09zm4i6dFi1uEOx9h9Ur0qYU8lGku5J4ifP5wHPqdxCPDGgw/Ctyb51Gli+eWaPo1sWOVyPxoCXqu10FFWA6ZMwqAZ4a8KAd9OIBSD9M3dFfnpd+lkX4wlCoPrl+bxIYoJ2S09DIG/wS4nLrAaod1ctFdlQYQ9LJfzn7qyzMa2br+NMYEA3TCnPWLFR0+iC3lhbh+hsNR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wxMBzGj8iLT86RPWYbWf0/VGbVgstS2ADbzsVLVa99O0tw555l2+DgeFkrEl?=
 =?us-ascii?Q?X0md06T2+lMAtnjo98msN0d22G4x7TrGnSoJMcsikvdqTpIZajOeDNoPdCfo?=
 =?us-ascii?Q?VIN5R9zLzy4Mb/qS18C8TBAe87Qjjzg8irJ013yhuaVDSioseE426XDGCgHI?=
 =?us-ascii?Q?LlTxXLaFpYwvmpKqHyWq+9FFBhdhfNXu1niOmto0BISJJFG/pCfJAMGt/F4f?=
 =?us-ascii?Q?0HQATHttT4bK4rd9m725Amlr6tpamVghMILdScpxiOTtqxXPZQvNrmLQQCbK?=
 =?us-ascii?Q?kxdNZZ1EpU8inqKiZk+gsTn8tLd1sLP/i5sawL/S04bnYxrIRdX+vJUrnAYV?=
 =?us-ascii?Q?nUm5Wvz5YcsUbHNWVXzz9cbSusJBVNFLBb/AMrRTNtnNlG74Tzt1fM4QlqV5?=
 =?us-ascii?Q?qF90B+w1mGpLguwKSXuuLayrpACYIQkyU0sJPrSR0X4jtVDlT33d78lSFff1?=
 =?us-ascii?Q?gIQQVL65z5k6AWUBN3S/wE6mKFWJx6LWzdPEMQc+SCBbl2KVAuYpZe1Jxnl1?=
 =?us-ascii?Q?vJNL8GJ+vuPlONSn7sBdjGCR/rgIFebJ6QW/buaLviy8O4z0yTMucwnLBjVf?=
 =?us-ascii?Q?CSMwn5qjNndU1Ark4kiAVyMc+b+Mv6awatGpMBuS3RwctRjaN8h4wokM93EN?=
 =?us-ascii?Q?NVrdrpugrAk2THaLitgcP6ND1E0h5sP4SWjmMH8TC3yebvr7MbUm5GU+RwJB?=
 =?us-ascii?Q?uFLl8Z6vDa4CqmzT/Jjj8YVNDriZfInKhtT3S3rDY2hWxUHGUP1ic/0MF4iT?=
 =?us-ascii?Q?awOM5t9rQyKbveoqTl7pWA3TvRimJJ6T+O3HGD4MAtYHnx3vklQq8tckaw1/?=
 =?us-ascii?Q?vZIPw1JuIabV6qQQP/32rxaMR5OkiwTnh4WuuQFK+hl9Mc0o/1/4N83M+zj/?=
 =?us-ascii?Q?MJwOSO2HIuf0Bj+TiA5LfQjzvf0vjl7U1y829667RSmHxIyLPKIMbA/Wsg5E?=
 =?us-ascii?Q?JExoksstcUOtr8my7oEsfKo82W6TO07F2VYGgu1w/Jnb0I1yIC55gQzolpwE?=
 =?us-ascii?Q?8D1KXfpnF5uXxUpnxw27hFKR+XerEmjT/l+Z6cshKxpBr8lR/MSC6lT+UlEq?=
 =?us-ascii?Q?4Ehw7nCjM4RHr+xN8TlWiK+2XvQhJSkwTGcfRGK+OmIcDiJTvAvcsXUYycbI?=
 =?us-ascii?Q?PxImcf1F2H726L+gX6Aj4tpgiUP5BGb+UHmiBPZLVY5ZSp38qnSv8NP/9IMk?=
 =?us-ascii?Q?GRaOMkxDq/ToDwFdj6IUAKwgJmUcF783/dZztPOtUjOBk/lNzgizAFPxcCp+?=
 =?us-ascii?Q?K87bUSebsEY+yMy7CYPYe3PnUCfmi5/QjmpGxaWe5zzY7uWWejVZaZkaQRnd?=
 =?us-ascii?Q?mbMJyHxkMtxkIeXY49vfOlVqYnPn6nSIQw5UnoCxzjuBORBgJBbWZesa3Svj?=
 =?us-ascii?Q?FxpWsaw/9mVkgu3GYV5Eb84JvOyVNu5WqN1BW2qS3jBT4myoxTKFRYQ0BKBs?=
 =?us-ascii?Q?W8u3aKY5W/OQ+66e131DfuCRM4xYm8UtZXVywRVTPlnioQxKu6U1swzHfB+4?=
 =?us-ascii?Q?PIZKBQX2j0FnCrd6odoaUINs3nDVSdTVhBwGKvkXrAtlh+Owj40J2G3z6RDt?=
 =?us-ascii?Q?K3rkZCVH+bGj0EhQWWwH0p+qof5+RePUYIn/ipTJYnAXcCHTKOK44oMRJjd4?=
 =?us-ascii?Q?zyb0mgVeJOxlmNXqZX+rNu87uQ8BrvJLZlARVkHBZ7dioUrkYushrF0eX0xw?=
 =?us-ascii?Q?hWttroGenTfnZDcVFRv0AKa84TybelAH1PfLGygy0q+KCQUuPGL3N8lf7tot?=
 =?us-ascii?Q?xTM6cswYyw=3D=3D?=
X-Exchange-RoutingPolicyChecked: fd6tSMfiwNp4Sd6dbYXS39Kfglf4WbEKOgpZkVV99pI5dmNpP0q/H6i58Ui1j3v18RtlKffkN9T7UR/9ipRYxQP/aXIcyVOSnD+7bIEVZnnaYiIybhuK3z8SqE0SfBZ6MN4CjnZ0SE3Rmro0h+U00Xtc0phWldB5uz3JcT9lQKFj9MjZrwYrIPDp/QXAlhGOMGvIhmA2VyPhm526SGTIQn9HlUunQnGOIp3IND73x6MNeu0ws4nOXdvBFijWj7286l1be2uWk2Y7zO2sZ7y0HEWBal1BQRTXHuJHLh3MDTwBiPbcBxE9q2J7YV9nbod5kP0632+K+wuaN7hliiZUiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d0e606-cf40-4580-981c-08df011068cf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:16:50.0630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUF4jtj5Hf0AG4mJXWDKVUyzwov/4HfZj9vbkk1xwydzWzPqmbsGOzwgZ9zFvm7Vr2LDcu8tKz4o6/Mcd/o3Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
branch HEAD: 13087ad7817e6e5f210064518bfc4d6d58a9c2f3  drm/xe: don't WARN on kernel job timeout when device already wedged

elapsed time: 2161m

configs tested: 185
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260822    gcc-10.5.0
arc                  randconfig-001-20260822    gcc-14.3.0
arc                  randconfig-001-20260823    clang-24
arc                  randconfig-002-20260822    gcc-10.5.0
arc                  randconfig-002-20260822    gcc-16.1.0
arc                  randconfig-002-20260823    clang-24
arm                  randconfig-001-20260822    gcc-10.5.0
arm                  randconfig-001-20260822    gcc-16.1.0
arm                  randconfig-001-20260823    clang-24
arm                  randconfig-002-20260822    gcc-10.5.0
arm                  randconfig-002-20260823    clang-24
arm                  randconfig-003-20260822    gcc-10.5.0
arm                  randconfig-003-20260822    gcc-12.5.0
arm                  randconfig-003-20260823    clang-24
arm                  randconfig-004-20260822    clang-24
arm                  randconfig-004-20260822    gcc-10.5.0
arm                  randconfig-004-20260823    clang-24
arm                        vf610m4_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260822    gcc-10.5.0
arm64                randconfig-001-20260822    gcc-14.3.0
arm64                randconfig-002-20260822    gcc-12.5.0
arm64                randconfig-002-20260822    gcc-14.3.0
arm64                randconfig-003-20260822    clang-24
arm64                randconfig-003-20260822    gcc-14.3.0
arm64                randconfig-004-20260822    gcc-12.5.0
arm64                randconfig-004-20260822    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260822    gcc-12.5.0
csky                 randconfig-001-20260822    gcc-14.3.0
csky                 randconfig-002-20260822    gcc-14.3.0
hexagon              randconfig-001-20260822    clang-24
hexagon              randconfig-001-20260822    gcc-16.1.0
hexagon              randconfig-002-20260822    clang-24
hexagon              randconfig-002-20260822    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260822    clang-22
i386       buildonly-randconfig-002-20260822    clang-22
i386       buildonly-randconfig-003-20260822    clang-22
i386       buildonly-randconfig-004-20260822    clang-22
i386       buildonly-randconfig-004-20260822    gcc-14
i386       buildonly-randconfig-005-20260822    clang-22
i386       buildonly-randconfig-006-20260822    clang-22
i386                 randconfig-001-20260822    clang-22
i386                 randconfig-001-20260822    gcc-14
i386                 randconfig-002-20260822    clang-22
i386                 randconfig-003-20260822    clang-22
i386                 randconfig-004-20260822    clang-22
i386                 randconfig-004-20260822    gcc-14
i386                 randconfig-005-20260822    clang-22
i386                 randconfig-006-20260822    clang-22
i386                 randconfig-007-20260822    clang-22
i386                 randconfig-011-20260822    gcc-14
i386                 randconfig-012-20260822    clang-22
i386                 randconfig-012-20260822    gcc-14
i386                 randconfig-013-20260822    gcc-14
i386                 randconfig-014-20260822    gcc-14
i386                 randconfig-015-20260822    clang-22
i386                 randconfig-015-20260822    gcc-14
i386                 randconfig-016-20260822    gcc-14
i386                 randconfig-017-20260822    gcc-12
i386                 randconfig-017-20260822    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260822    gcc-16.1.0
loongarch            randconfig-002-20260822    gcc-16.1.0
mips                         eyeq5_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260822    gcc-11.5.0
nios2                randconfig-001-20260822    gcc-16.1.0
nios2                randconfig-002-20260822    gcc-11.5.0
nios2                randconfig-002-20260822    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-15.2.0
parisc               randconfig-001-20260822    gcc-15.2.0
parisc               randconfig-001-20260823    gcc-10.5.0
parisc               randconfig-002-20260822    gcc-15.2.0
parisc               randconfig-002-20260822    gcc-9.5.0
parisc               randconfig-002-20260823    gcc-10.5.0
powerpc              randconfig-001-20260822    gcc-15.2.0
powerpc              randconfig-001-20260822    gcc-8.5.0
powerpc              randconfig-001-20260823    gcc-10.5.0
powerpc              randconfig-002-20260822    clang-24
powerpc              randconfig-002-20260822    gcc-15.2.0
powerpc              randconfig-002-20260823    gcc-10.5.0
powerpc                    tqm8560_defconfig    gcc-16.1.0
powerpc64            randconfig-001-20260822    clang-24
powerpc64            randconfig-001-20260822    gcc-15.2.0
powerpc64            randconfig-001-20260823    gcc-10.5.0
powerpc64            randconfig-002-20260822    gcc-12.5.0
powerpc64            randconfig-002-20260822    gcc-15.2.0
powerpc64            randconfig-002-20260823    gcc-10.5.0
riscv                         randconfig-001    clang-24
riscv                randconfig-001-20260822    clang-17
riscv                randconfig-001-20260823    clang-24
riscv                randconfig-002-20260822    clang-17
riscv                randconfig-002-20260822    gcc-12.5.0
riscv                randconfig-002-20260823    clang-24
s390                 randconfig-001-20260822    clang-17
s390                 randconfig-001-20260822    clang-24
s390                 randconfig-001-20260823    clang-24
s390                 randconfig-002-20260822    clang-17
s390                 randconfig-002-20260823    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260822    clang-17
sh                   randconfig-001-20260822    gcc-16.1.0
sh                   randconfig-001-20260823    clang-24
sh                   randconfig-002-20260822    clang-17
sh                   randconfig-002-20260822    gcc-14.3.0
sh                   randconfig-002-20260823    clang-24
sh                          se7751_defconfig    gcc-16.1.0
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260822    gcc-13.4.0
sparc                randconfig-001-20260822    gcc-8.5.0
sparc                randconfig-002-20260822    gcc-15.2.0
sparc                randconfig-002-20260822    gcc-8.5.0
sparc64              randconfig-001-20260822    gcc-8.5.0
sparc64              randconfig-002-20260822    clang-24
sparc64              randconfig-002-20260822    gcc-8.5.0
um                   randconfig-001-20260822    gcc-13
um                   randconfig-001-20260822    gcc-8.5.0
um                   randconfig-002-20260822    clang-24
um                   randconfig-002-20260822    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260822    clang-22
x86_64     buildonly-randconfig-002-20260822    clang-22
x86_64     buildonly-randconfig-003-20260822    clang-22
x86_64     buildonly-randconfig-003-20260822    gcc-14
x86_64     buildonly-randconfig-004-20260822    clang-22
x86_64     buildonly-randconfig-004-20260822    gcc-14
x86_64     buildonly-randconfig-005-20260822    clang-22
x86_64     buildonly-randconfig-005-20260822    gcc-14
x86_64     buildonly-randconfig-006-20260822    clang-22
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260822    clang-22
x86_64               randconfig-001-20260822    gcc-12
x86_64               randconfig-001-20260822    gcc-14
x86_64               randconfig-002-20260822    clang-22
x86_64               randconfig-002-20260822    gcc-12
x86_64               randconfig-002-20260822    gcc-14
x86_64               randconfig-003-20260822    clang-22
x86_64               randconfig-003-20260822    gcc-12
x86_64               randconfig-003-20260822    gcc-14
x86_64               randconfig-004-20260822    clang-22
x86_64               randconfig-004-20260822    gcc-12
x86_64               randconfig-004-20260822    gcc-14
x86_64               randconfig-005-20260822    gcc-12
x86_64               randconfig-005-20260822    gcc-14
x86_64               randconfig-006-20260822    gcc-12
x86_64               randconfig-006-20260822    gcc-14
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260822    clang-22
x86_64               randconfig-011-20260822    gcc-14
x86_64               randconfig-012-20260822    clang-22
x86_64               randconfig-013-20260822    clang-22
x86_64               randconfig-013-20260822    gcc-14
x86_64               randconfig-014-20260822    clang-22
x86_64               randconfig-015-20260822    clang-22
x86_64               randconfig-016-20260822    clang-22
x86_64               randconfig-016-20260822    gcc-14
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260822    clang-22
x86_64               randconfig-071-20260822    gcc-14
x86_64               randconfig-072-20260822    clang-22
x86_64               randconfig-072-20260822    gcc-14
x86_64               randconfig-073-20260822    clang-22
x86_64               randconfig-073-20260822    gcc-13
x86_64               randconfig-073-20260822    gcc-14
x86_64               randconfig-074-20260822    clang-22
x86_64               randconfig-074-20260822    gcc-14
x86_64               randconfig-075-20260822    clang-22
x86_64               randconfig-075-20260822    gcc-14
x86_64               randconfig-076-20260822    clang-22
x86_64               randconfig-076-20260822    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260822    gcc-8.5.0
xtensa               randconfig-001-20260822    gcc-9.5.0
xtensa               randconfig-002-20260822    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
