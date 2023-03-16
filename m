Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ADBC7618A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 20:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D158210E36C;
	Thu, 16 Mar 2023 20:54:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B7510E36C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679000047; x=1710536047;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ObqTz46VRgUiq+rYg7UXBhh0qe1XOSU6zagEuMvT55A=;
 b=fnozxbFzZffuP/da093VRwxh2Ww6pA9HvL0P/ZtK02cH5Q++K0/07wlT
 I+DU52KfIiXU/0PStpPtIttqz7H7tjFIGBwWd43qoGH2f3TZ/sB7qaPDc
 lbw5qCL8DNfmD9GH+/S9Q42EneUkteQ9KytlNswznWIJgnusYTf6iakQx
 GhbjAc8MDSjR+j7OOd1kPrlQsusOgRzI97Po/P/Iwm5obmrVXo1glvJ4a
 iB00wZKC2MHmMW8HYC8qt0JtnwfPvAEf87vVKpmgf5yqxPbJeVh3I/QzR
 zXMSgauFJMjK0vVtH5CSkPHmedGPgVWDc968c4LdrWjCAErQsgrVlxJpr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335595777"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="335595777"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 13:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="630047235"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="630047235"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 16 Mar 2023 13:54:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 13:54:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 13:54:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 13:54:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 13:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZnMLTsEJAjWkY22lalW/XFaE9em73t3A3I83woVPU9jSGI1zTNZq/JXAlwUVaGLmZrFO5sm/Tc0fpUW7FsiSq4c/oLKG0YK/PvdtXyi5ZhY5xhN+aIazMUymVMk19tEJcYH3CQ2ZjMGpTtix2clUD9KzqdGsTkS6gfnpJUQGdkdrGedyrUk7H+W0PzAnLd5n0vMMFOVruAlTjR2jbEcrGHGh+r2YWY/achruxjeqAIXlTJVJq+dX+o32tiApenQCCMcuZ2Mmp9fcBxCh2lXYoV07FL3CBwhwZqQhpFQWTrfevJB2nZ9neTySsUfv++sxRKUDZoOAyIGLzfsr4My7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDkc5IxdLAEiLhnG92C0oBM2CoNL7d83tkDyDSRslmk=;
 b=Txh4Xtm4Zos/lIgqyLFKEqs/pHZhndh3WZH76BqfcMx4zuCxOg1EaBeheoILTvOtK83KAJqk0uvX8JiTU9kOwa+3Sn+nUDoIrPasoQ1MiHtiBPFK5T+uXNI5iveHTjqnRWxMKduoVOUTpG/jDwonM8vYg1IPLsMaMB7CiEDLn9c0cEByWlnplmgvaoge6LtrB4tMus4Q0FZc1LJod1zim3teKuhRogyS7265bRFgdSDNiAHSEjHerNJ3TqN//KaLIQsrRxvs1z8jcrhS6OhvS19K6yFG5qgZ8u1Z9FQUSzB0M3t1elu+C7mLKtDIvbBhlEj3w1A1Gh+OS8wvEZQivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB6003.namprd11.prod.outlook.com (2603:10b6:208:387::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 20:54:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 16 Mar 2023
 20:54:02 +0000
Date: Thu, 16 Mar 2023 13:53:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230316205358.yc6oikittowumo7o@ldmartin-desk2.jf.intel.com>
References: <20230316182951.3441696-1-lucas.demarchi@intel.com>
 <167899158625.19096.3337716618141797617@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <167899158625.19096.3337716618141797617@emeril.freedesktop.org>
X-ClientProxiedBy: MW4PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:303:dc::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ed7ff7-d5db-4556-f4bc-08db2660923c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T36yZWu+UbqYQg2/+N4MrJTrUESS8yV/R/663uwP7a6VOXYjQIeq9nH34RIirY6L31KXl3D6MjSDYNM2gpKslPnPodfmapn4HdshWdIrLUB2lWQEJoEqtKQMWV3ep1eRbxz7T4SXBN2Deg81FBXExLyFooX7g7UR75sOvkSPX2RblcQdpM46QegBCdIexTBi6LmknWHS23r06vgKTpBp9WY2oJtOQJx184btf0yHstX1sqIEwBIAnRAwoFkHF3FzmfCuWkay6kM6Ie5BPucWzN7KSUbuaEBz6czJ/EPYRMdnYJIuu/jGU4DzbPF6WgfVAEVwDvr9FNrmdS54GksQASN/+DW3/S4o8LzzX1iTYPXBUqBj/z5OHZWARq/+W6uTozICAGQoCb3N8XxYjUdjRlUqsONyEjmmzlrgAEuityhddWLndtCFgLoGX8BQnQ20uX/gOwiz9+GAFpGQCJz7WmIC3pIQCh6OVoZLLXx0vSvbuFp7elx/pfMFzIupq3yz2vWkzMudIokKzaZhGxTiOgy7kC9tIxp0gcroMstYO4Oz7z2Qc7c5O+9f6/QmlZOZchhDDIsSYazGVa60C8MBC6LgUy1MntZweV+tTsYMkgOnEj5DcLgKRQjWQfl+aOUk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199018)(8936002)(5660300002)(41300700001)(6916009)(86362001)(38100700002)(2906002)(82960400001)(186003)(83380400001)(478600001)(6666004)(966005)(6486002)(1076003)(6512007)(26005)(6506007)(66556008)(316002)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6HmvGwoaDJ6rICrZCfipw0PmedybST0JSCaUNacqYUEYCwiT/hYnoQViwgs?=
 =?us-ascii?Q?kLbLGxsftL9X9VpBYkR8bid9ganJqrtvs4QnPxbDxoqGGeXDFNnCC534Z274?=
 =?us-ascii?Q?ycE8zlA3iGTG9BU16wp0ZFgRHPM4sBgUB7NJldXp3RRyjja+SHCvOwen/Dpd?=
 =?us-ascii?Q?WtZLHAndzYUmuVFNkQgy60D+7MWGylbdw7ijSjVW1lI6Ws2G5Fa3r0495Jup?=
 =?us-ascii?Q?3/JBzs5sZpk9g5JEvMlEZJyffzE8TN8O4nGayI5tCdV2d9WAc304QJ1sGLJ8?=
 =?us-ascii?Q?985Pd/DoRi2pp1hCw+VNrJs3YBtZXwyyWPGz7UACvth1kZqUtlqXP6ToZiZq?=
 =?us-ascii?Q?U5HWGh91EC3hIgfgcFasRipUNaxzf7XAQrfEYrMZ8XwfxSDLUcS5L3orUgq0?=
 =?us-ascii?Q?VOY+pYod4qQadPS/gcW7uKy1DBDv9f4Wt9AzgXyelHhvBu2gAZbw9oSD42hM?=
 =?us-ascii?Q?LGkIvxN5OQ5Txxt2l/8WSsZ9M+2k2aD10frYbDWCjB0kC90qQ6epRZxW2p/1?=
 =?us-ascii?Q?Ea48nkPZ718y+uXBrnLNQnmqZv9bV46Y9zOFrGS40A5dttf0CaLRTbwR1VlF?=
 =?us-ascii?Q?/Og10vsjFSOutjxHMJbWu0dP4/uvOSS6JVzNLRe731HxpvfsAoEKLX4hMSHN?=
 =?us-ascii?Q?ctTfKGyfc86KWur6QSXdCjOkn+0500JrP997mQNXcpTqkRcGlEqkAl7liXbI?=
 =?us-ascii?Q?aQLc7WA7DkLYIDP3CzFhhN2akdZOHiuonlBBC2PqG0LU5Ft+5vHlvkXiG6NT?=
 =?us-ascii?Q?M0VHnMfTodxDIN7nb/Azl7j0E7iQcrip8zi4bIaGUbVCZ+RFiERxf04zK/dn?=
 =?us-ascii?Q?I+sinoJ91e9o5SXi25xmzKZLKbp5owx+aig2vYLlZXgq99SwI56Y9HUClKgL?=
 =?us-ascii?Q?pS0nom6cInBM+anC0DWRKPpoZvFwvHb/DwrLyYgorFWrFleyGkmh3cOrcBk/?=
 =?us-ascii?Q?piyltCcjLNU1mva5gPN/jwSG25mBr30zUyURHJQ0jSH1EhAxCLm0Wvpi7DgN?=
 =?us-ascii?Q?gJfQ9a0PUUA0QKF9cGKGbaX0SCh3V+OY3eXgWltRR1PttHU1T66SvQ2aQn7D?=
 =?us-ascii?Q?Pepo1pl6F86K1UfQpDSnnwXuwOORgWat8vNFGPOUF3EA+unh761F6A6S8w8R?=
 =?us-ascii?Q?p+cDkmd1IwI0AwnazUKfy52YIxd5QDnjA4oML92CgVXrB1ByO7EDc/VrB/xn?=
 =?us-ascii?Q?gFyTMuEbLEpKDeYi3NjLqQ8MgLXrcsQAmJ/+TB6pRce/UMoQwopcEfk7rvlE?=
 =?us-ascii?Q?0X6XMsNPWqSl9uflTYEwSeHCuS9InD64C9y6h+bS5RYCE48ashggA+lFEbd1?=
 =?us-ascii?Q?qPLPa7cmEwbMlpNkE1YUiRPERNC6EnDHmdnKyjgsD062hCs7YMNxY3TgpV5K?=
 =?us-ascii?Q?h/5+TCFwLMcqExnR0yUOP5NWmBo0Q7a+GGUYd+X/yUm4/0rv9Cu3AWjsaEXG?=
 =?us-ascii?Q?FBcfd4S/ygHG6OJCR0b/6UxDyGpt6O5IbbXLTMsFlz4ELviEcVPDvZLziocY?=
 =?us-ascii?Q?9VHkd64dVLNN59gxV4UAS9JtMmofMnhomquInfF2PJrBWECUHNhN7BrT/FQn?=
 =?us-ascii?Q?c76+KwJDh0zM/0r7WRx0HpVRMTBdsSJ4Af617sYRASdSvUsqyn+i8FNl5oQ9?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ed7ff7-d5db-4556-f4bc-08db2660923c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 20:54:01.7897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CKsrKfe3EGLPM3TgvyPJ/Fnvp4Km7qP76tatYNwVJ3dN0168KVjUlfFjp8hy4xXA7wSyM3FbalNbAhXMln1hvFsRNCeGVP2yFksOc+3W78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6003
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_fixup!_?=
 =?utf-8?q?drm/xe=3A_Introduce_a_new_DRM_driver_for_Intel_GPUs?=
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

On Thu, Mar 16, 2023 at 06:33:06PM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
>URL   : https://patchwork.freedesktop.org/series/115290/
>State : failure
>
>== Summary ==
>
>+ trap cleanup EXIT
>+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
>ERROR:root:`.exit.text' referenced in section `.uml.exitcall.exit' of arch/um/drivers/virtio_uml.o: defined in discarded section `.exit.text' of arch/um/drivers/virtio_uml.o
>collect2: error: ld returned 1 exit status
>make[2]: *** [../scripts/Makefile.vmlinux:35: vmlinux] Error 1
>make[1]: *** [/kernel/Makefile:1264: vmlinux] Error 2
>make: *** [Makefile:242: __sub-make] Error 2

passes for me... it seems to be because of the toolchain currently used:

https://lore.kernel.org/all/20230207164156.537378-1-masahiroy@kernel.org/

it's on 6.3-rc1 and 6.2.7

Lucas De Marchi

>
>[18:32:38] Configuring KUnit Kernel ...
>Generating .config ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>[18:32:42] Building KUnit Kernel ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>Building with:
>$ make ARCH=um O=.kunit --jobs=48
>+ cleanup
>++ stat -c %u:%g /kernel
>+ chown -R 1003:1003 /kernel
>
>
