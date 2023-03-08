Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994F1C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 17:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F2610E6BA;
	Wed,  8 Mar 2023 17:06:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1293410E0AB
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678295204; x=1709831204;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6qTuQliw7+e01joHSCAwxPUvLdG/SbFOdc1yFurXneQ=;
 b=OEb3KyBSbfWsuJMGP92RyXFaGhhyHkgG/RB97rz763BxEYrR8TI9d+EX
 HuJoG2BKMu8r4TwKcupm1wiFZXTHC6ttn+Ymu/l3FhWtXh48JEyAQRkvI
 J2QkmH8o/UpMmgyMp0huxDcB5ZUhK6akAolatnIxS4H0yItlUdsDV/T5O
 Af5fMjlZpZSco9tN8p7Ebrb7lFDacULtq69/ZXdQJp14Y/Kbn54D+RpN8
 l+/Ztz2YEPaxRW99SuyFr2T80ujHyNRbBzsTdFod9ZAvHwxXOftyF7N4R
 dmQBzEZXk6GhMrkWlo+NZwUYtMk/bsumDqnP+EKIEogUAS4LGR5Yipxis w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="338542820"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="338542820"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 09:03:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="800833416"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="800833416"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 09:03:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 09:03:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 09:03:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 09:03:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 09:02:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cc5TLOJhQr0wwPmbKFViuCXjoZxLelbGXWGEA/KVFyUIt8FbCA3Jjew18PZSu8Bny34aPyQIDjd7890o/ysyLCqPpiib1VJSnk6JYVOtJUp7dfSeygt3vt3EftqHpLJyZq62QNPwVGIT0NglRvwTyARijP6juExm/UxYrX/+qx4jfGPed/hEW+CIBkBmAAzKXDYNHDUAe/a+ZkpHZjGDf3wbZ637OdIELO+TOCrDACRjdTqwEfO0nQC8tE1Ehv60zShXm5NPS/AMl5x9IXlN3c++WeCQbCNOfVrTdKhF3fKeiG7BZNiTlxaQCP7O0sLhoAZGWZGkgMq6++uUyC3hww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koSRO9+cmW8liFAPa8rZ/LWhmDVh/Stk3VWvqiB8c9w=;
 b=i1cNcridodvHxRcDvOhvm3F8MNJzW6pHt224RxKTbqvmhDZrK0jVw+i7W1XgGB9ALxNqPsSl64Iy93KyxqPE7R1D/Yy6jmkw/GeRw4XAhF30ta1lVy4H26NwyPKzg39ul9v3lwCSwuNbrJIyGgIj1ynUj5YgkizuSwkpVr0i0nxyXKjv58Vd5JKTBaXjwwJAoiaxFtLha6c7oTkC6sue9nmem7DeZBMjIr8lGhy5bgLtgULhNdffrHeSQC6fttdgf06REqcPA692EZV/WnaKM+5zUmfPXG1vHbGc9H7yilAA3m1Whly2Qi6KV+dgdBbP0gLXoBM7RQ9pw6qM9p9bmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 17:02:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 17:02:52 +0000
Date: Wed, 8 Mar 2023 09:02:50 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308170250.f2hnmlb7nse3g7qk@ldmartin-desk2.lan>
References: <20230308005509.2975663-1-matthew.d.roper@intel.com>
 <20230308005509.2975663-2-matthew.d.roper@intel.com>
 <20230308011909.7hl2ob27tbr6q6vb@ldmartin-desk2.lan>
 <20230308161519.GT1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308161519.GT1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c74672-e383-46c5-e248-08db1ff6f458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eoN46JRk/xqz9BUyl6pmDd3Lrz9KUFZsKjzSeI+RuZftvNyM8Glir3S9GaBAPEa75ZE00kznjDtVN2Zdsz8+JrZglfjeRSeRYLEiXQlGNNk2+TiA6hSRmp0CbGZggU6OP2Kqp1duqZuyyukJoHbMxgguMzmQ5a6qVdKAQumZxc7MgwR8LeO8eplUbEeojCKGfE01Pd5m+Ni4PCtrFdDHDSHuYihFLnjwKHqCX5Q+dC/yBnEJ6X42VN25fRKVgQc6E68B8zof6hYae/SKsP2alKoCUG7b4kK1uJjqSzxFKBlPBcVbVINcMFobXmKLnvmjPW/zP7ZxzH1WVmv7wPUL2YQ5zPK9t3n3gQhNIGgZfBUWz7Ci/YDzrx+r+y/v2l6l9P10EuHN8uui8yXxv29fw+3V2ZobvCCl8MpGRT46hsNjT1OzfcuEgq/lsPLfi9q6aM3okr81VdibqmwPaBBzf4pmJEvl6hbXX07V5UQYzzY4+qGOP+YnjDxXr6eGh6bryVOu0SQaZ7gGgBxN2/uYUuVG+yDkI98e1CbtONEExirF8etJ6Im3zGVN37bBChD0BEff1nz1+UnRebH0nPs897wp4eS1Ikab5MP6ZSvWrI3I0obFnRR6bgtepw2chnUMzocjcvJMmZnNULDLCz1Ybg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199018)(82960400001)(66574015)(83380400001)(36756003)(478600001)(6636002)(45080400002)(38100700002)(316002)(6486002)(6512007)(6506007)(1076003)(41300700001)(186003)(9686003)(26005)(5660300002)(8936002)(66946007)(6862004)(66476007)(86362001)(2906002)(4326008)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QXOwJxrMVfxO1rY2s5iK4+csEGF1+1LPDfzGGq3zjvT/e8U7HwH1SRUllZ?=
 =?iso-8859-1?Q?oONaiE6lzZTBSylSkOTVtPjlUCYkbQ5A96LErycSorbmaaghtvz8mPY9q1?=
 =?iso-8859-1?Q?DQK6SpixDeUpJW+mc0FnXQNAzWYknQHGFRQ2x9JmVyg8SmKOdgjU2YdfsM?=
 =?iso-8859-1?Q?akN4XvXwc7TwRDBdcRFqPDxJKej1EUuozo2uXnVX8p8PgKXunFZlVxrDvi?=
 =?iso-8859-1?Q?WOFsCH/l7Yrd4hwAr3rAl6u/xlkmkuxp0lkZKU3qJJ6UGO3xP/gzvg6Tnu?=
 =?iso-8859-1?Q?yCQ/AZqfhxGdWpFeqVUjXtRR+wc3IiPildTZOZ+/Qu6dFbJPdG/YuuxygY?=
 =?iso-8859-1?Q?N2Yhh37nYBDcEG8aitoK4DRiZGXsmTaN/jR1ptuC8n86Frxmog2gJZMgM+?=
 =?iso-8859-1?Q?NGbmtNzYSC+0FyC3OVoYKykXWs5ClkW4gTbvcAD2+ECaJa4aMws1YxrThM?=
 =?iso-8859-1?Q?ztUgccBtADJbSk/zIGc3G03XYxNb0umcS3bRamtkwqqG+DEMphA9DBbSzl?=
 =?iso-8859-1?Q?hiXPl2GiEMqbVRu1kb+9CvJi7cd0HTUoSDYBuvgXFKBD+scqs/2t44FZrZ?=
 =?iso-8859-1?Q?rmKG0QcnNIq5BiLYlYJ70kXVBt0SIBvd4fbDNrkmml3cm7sK/PriVxsr/M?=
 =?iso-8859-1?Q?uiIWu4E6pNCcWhPI6/5aX8Q0Dz16kMa3+3rGHlJ+COt5u/pJuoWtxC8IN8?=
 =?iso-8859-1?Q?2GfMoVO7Ez+E8qid9qBUnwuBtBuwjZF9JRo/qYWohdS6lKMmD9lgUyxBws?=
 =?iso-8859-1?Q?M7QFkty3KwJBfGR6/ONIHlEjVtrZizbYTMD+/dKuV4oau0BAdzwt4HrzkQ?=
 =?iso-8859-1?Q?6W0PlA4eeqze+sH78blfHO2pSAecUlo99YY+1UFL6JWRu6ig2WrN0ZmKsG?=
 =?iso-8859-1?Q?daYGFiRq3DeCnVBLikBVzqX3hxawa/fj2EQ53/QO6vo9BhVIgvPrjmD4VR?=
 =?iso-8859-1?Q?tynSSVrpnIaHuydeVMR8/a7ZsP3s9Jo+Y5hjAfLDqdFYk/sXi7g+f3szO6?=
 =?iso-8859-1?Q?PturwpP+EvzQUV1hojUQ/EGvuzTDRyhJlknJ57Z2hDNuiwAv4d17QuzVNF?=
 =?iso-8859-1?Q?bZYjGwLaqqpvmNYBo6FxyBO59Ltjsc0oi/kkoe6RK+RPkbke24mCotXkye?=
 =?iso-8859-1?Q?bMSqVtUAr3lCpF0V2F3aDHay2jrisJ/nMYOtHmik2OVxYixpRS/1oNRKnc?=
 =?iso-8859-1?Q?Y8hOfZIaXUMjwbTWGo1xXXxsWQF/luso0RgVD0ndqpSHlPk9Xia0gLUF7q?=
 =?iso-8859-1?Q?e3O2vKEWezurkniTcfOhBLA222ZIXVSYBmPOTznnY+p79NtUh+s4EFSGG6?=
 =?iso-8859-1?Q?s+Zpp9YzrQGaEFjj2w0JQNrsuPKMHzwt2P9NaW44S0Fm6rK1F/7xGZ5Rwr?=
 =?iso-8859-1?Q?daiyv5b75GghMZU7wqTdbqMOlw7CPNMH5DtaPcvlHE87WtHqYYaeCRu3T0?=
 =?iso-8859-1?Q?6RHHgwM39HIBFlCWHXsw+ZVmLZW8Vhf67jExmwGFNLdQOYFW8Odo/mhLBS?=
 =?iso-8859-1?Q?G+mDnuTH7ZfpvtP/bCnZev819sBRWIlriAOAi+mdlbrzm+KrmDQuCLxPzl?=
 =?iso-8859-1?Q?M+FY4BrhC2YytK8zezatsdyIJhZ5YBmxGdufdQD8A8pb3/rvWeocbImXnJ?=
 =?iso-8859-1?Q?80uEb8+ou5ErVkKb6RskFrwE3VkYVV4nodO1reTD8ioKcyQO8j98UKzw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c74672-e383-46c5-e248-08db1ff6f458
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 17:02:52.7907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUK26oYuWT0bY1ktZUNFFH01fL1m3MR6OfvnnHwiFHfAY3RTEK+hpjM/MlAhuOh3UCqtKpgzHm/LDiSzgyGv/+ZCeQsUGNBLHug9tU5lxaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Allocate regset space for
 Wa_1607983814 unconditionally
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 08:15:19AM -0800, Matt Roper wrote:
>On Tue, Mar 07, 2023 at 05:19:09PM -0800, Lucas De Marchi wrote:
>> On Tue, Mar 07, 2023 at 04:55:09PM -0800, Matt Roper wrote:
>> > As part of commit 6f2c0e92587b ("drm/xe/mocs: LNCF MOCS settings only
>> > need to be restored on pre-Xe_HP"), the regset allocation was slimmed
>> > down to not unnecessarily include extra LNCFMOCS space in the regset
>> > area for the platforms and engines that don't need to save/restore those
>> > registers.  Unfortunately this change is causing a driver load
>> > regression on Xe_LP platforms:
>>
>> s/Xe_LP/some Xe_LP/. I have been loading xe in a TGL without such issue.
>> Report was on DG1
>
>It happens on TGL as well, although far less often.  Loading/unloading
>in a loop will eventually trigger it for me on TGL, whereas it
>reproduced nearly every time on DG1.  I haven't actually tried on RKL or
>ADL yet, but given that both DG1 and TGL show the problem, I assume they
>probably will as well.

ok, let's keep the wording then. My r-b below still applies.

thanks
Lucas De Marchi

>
>
>Matt
>
>>
>>
>> >
>> >  ------------[ cut here ]------------
>> >  WARNING: CPU: 4 PID: 1677 at drivers/gpu/drm/xe/xe_hw_fence.c:91 xe_hw_fence_irq_finish+0x35/0x120 [xe]
>> >  Modules linked in: xe(+) drm_ttm_helper drm_suballoc_helper gpu_sched
>> >  drm_buddy video drm_display_helper drm_kms_helper syscopyarea
>> >  sysfillrect sysimgblt ttm fuse x86_pkg_temp_thermal coretemp
>> >  kvm_intel mei_pxp mei_hdcp kvm irqbypass wmi_bmof mei_me mei
>> >  crct10dif_pcl mul crc32_pclmul e1000e ghash_clmulni_intel ptp
>> >  i2c_i801 i2c_smbus pps_core intel_lpss_pci wmi [last unloaded: ttm]
>> >  CPU: 4 PID: 1677 Comm: modprobe Not tainted 6.1.0-CI_DRM_12746-g6ce36b596fa7+ #474
>> >  Hardware name: Intel Corporation CoffeeLake Client Platform/CoffeeLake S UDIMM RVP, BIOS CNLSFWR1.D00.X212.B00.190824175
>> >
>> >  RIP: 0010:xe_hw_fence_irq_finish+0x35/0x120 [xe]
>> >  Code: 54 4c 8d 67 60 55 53 48 83 ec 10 48 8b 47 60 49 39 c4 75 13 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc
>> > f9 37 e1 48 89 ef 88 44 24 07 e8 78 ea 77 e1 48 8b 55
>> >  RSP: 0018:ffffc90001967bc8 EFLAGS: 00010206
>> >  RAX: ffff88811058f698 RBX: 00000000ffffffc2 RCX: ffff88810c8289a8
>> >  RDX: 0000000000000000 RSI: ffffffff822868c2 RDI: ffff888115524a98
>> >  RBP: ffff888115524a98 R08: 000000000000011f R09: 00000000ffffffff
>> >  R10: 0000000000000000 R11: 000000006243100e R12: ffff888115524af8
>> >  R13: ffff888115524b10 R14: ffff888115523c38 R15: ffffffffa04ecfbe
>> >  FS:  00007f6ca9483740(0000) GS:ffff88844dc00000(0000) knlGS:0000000000000000
>> >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> >  CR2: 0000557fefd93020 CR3: 00000001157ea004 CR4: 00000000003706e0
>> >  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> >  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> >  Call Trace:
>> >   <TASK>
>> >   xe_gt_init+0x343/0x390 [xe]
>> >   xe_device_probe+0x233/0x2a0 [xe]
>> >   xe_pci_probe+0x351/0x480 [xe]
>> >
>> > The reason for this failure hasn't been identified yet (the smaller
>> > regset allocation is still more than large enough to hold all of the
>> > registers; it isn't an overflow problem) so let's revert the problematic
>> > optimization to restore proper behavior while we investigate further.
>> >
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Lucas De Marchi
>>
>> > ---
>> > drivers/gpu/drm/xe/xe_guc_ads.c | 5 +----
>> > 1 file changed, 1 insertion(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > index fd9911ffeae4..304a9501b447 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > @@ -224,10 +224,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>> > 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>> > 			count++;
>> >
>> > -	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>> > -
>> > -	if (needs_wa_1607983814(gt_to_xe(gt)))
>> > -		count += LNCFCMOCS_REG_COUNT;
>> > +	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
>> >
>> > 	return count * sizeof(struct guc_mmio_reg);
>> > }
>> > --
>> > 2.39.2
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
