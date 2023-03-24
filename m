Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DE4C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 06:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD0810E4A7;
	Fri, 24 Mar 2023 06:18:14 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC0210E4A7
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 06:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679638691; x=1711174691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RNmHL+BNaZjntYkuV/KC7xxNZceggMGkACiHJhm97AA=;
 b=lVE+bTIzAnwbDfjbDtwJ4PBcw0pvGpdkzPg+BGUHNwAlNBdrIR0imqlT
 pFlBJGKUsG2p6Bow4ijE9lyPi84OLt++l+IiUWvhT+iHCuqWBFb2Ix2ma
 HUdo/zmyVIFEnlQEQol82woWQ0O5MgVnEf/kYitqsJ7xyHq/90bhRJZkz
 MPWVR7ze1L4WrOL40U+VMytkoT3mYaUPgA1BLPpgC1QIsqPyuB8eSQ1Cb
 QMyHqVQEbXc+NkUcMzQdg5b7UIdSxQNCZsQ9/OjIFXjlBdi+AcbukEpXs
 k3IZRMxyVB/9Lwx0VvJtB0y+T3WBmeu2/JxL4e4QgxwrWgPkyhaFN08wo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="425979908"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="425979908"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 23:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="747028560"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="747028560"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 23:18:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 23:18:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 23:18:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 23:18:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 23:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfQF7RL8V6cPb0N3rg1NTq586X+Yvw380a8lB8e2In2+a6p77IPLPLfcE1JmKIYVDOdD4w3ixeAwBT0qeID0yCtBlDk/yAGZv0Qg4NH8ba0bKNdxrr/5JoPH5PU5wfQpHw0Nn66m8qQecdNgCv+RSzW1IXzCP7CzWdlyain6NbJ7KvAkbLJaL2LwipMTaTqi0HPSza7hyO07M2aSHKdoEFtOQvBBNQQG2U2ds5rPzyP+nnHkJthlUDLnvl80+AK7y81hu6MOzJI3OlrdtGJzDLLJEPTnRYxw/H1ULutgGW9K8pO6Nf3hVH+grXn7EweWB5iSK3Q+jayk/ufd/hNU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgvQz6yy57ksSSz7S1mD/q0VcoQJhVp4pE9pE/qz7IE=;
 b=C6FBmArzuVrG2yI+3hqmzTtcJ7cytVsdZd9sSggotA/yRgFufDkTMTLf4wITL6iufBQebErEWuCGumPqBG/1sY0R+BIfy3BIaptcCGalmrvm2FxXZCvKQsi8/iBCRSmpCHUcsb6X5G791tLSk1k0MMWaOFl1qahlCRoVpsilolK2t7O1uaRjNEDJ+C8dlNWy81akB0/2+O/ZCPqsjmx1LiMFTm7op/Y1LKmftr6vdZYKEzq0aa8KiLlnJdllspVC2zZldpvy5jTNYHwUDAyGeT5xIGicSWdUCQoghHaCZHsslBMCx3L5oRyTCZWbroM7W9mE+eUXUFIOEe1c1ztI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 06:18:02 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::2c5a:9a41:c5e2:185f]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::2c5a:9a41:c5e2:185f%8]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 06:18:02 +0000
Date: Thu, 23 Mar 2023 23:17:59 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZB1Al4yra5UhxEGC@nvishwa1-DESK>
References: <20230321234217.692726-1-matthew.brost@intel.com>
 <20230321234217.692726-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230321234217.692726-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR08CA0066.namprd08.prod.outlook.com
 (2603:10b6:a03:117::43) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MN2PR11MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2334bb-5939-40fd-96a2-08db2c2f8563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qwaeDSBXn9qpW8uagC8D/DbF3bvuPS5D6Q0H1GtY1mR98KJUHKrJA2kpthKYb7Nu2VWHqAPIkji7q0CaRBvOu3gLZJDBlI57EbHosBG0J+HqGjKf7NRvvMKBkCHVh6N8rvQTkMfbMqzfEgeR/BdX/4hKG0vfaqYUF+82rP8T9aQ3uGqYZIwBZXw4+x5rRiI0DiGirhBSNtTqtk+f/u39wIfCblYIPMl9EOs5zh4dARaaKt7IKxrQroMBl23puBLRI7AKYG8avv1RlbqPFrV3JwKzGjOxTmLp4aQDmemxD8ShE6/WIPtP3iQJZxYyU/8nZNpdl8Idym9s54dhxmWhVLYoYX+BvF1quO4cHv0OgV2ozfeMnV0zPNectBVfikJ1sSOxWG6W0VetQdofRgq2lQXP/s4rNDLASUs6cjM6mc2ZkL5RhuydL/Zi01NvK2IfMqKOaoS805i0T9oMhVRdqeU9y1nPugBxl+BcQSH6AovXmP1q83eCU/Abb3LcJ4enXvFelvWL4/czouqjoj912zZ4eucdKF4ZMf1nnQ3aN+SQdGPlBHEoZKn5PdO6I9BMTIe0EtA5ItqYuOVgOj9y2yoIfRIgsyjfBwNgSrl8uMJ/kg5gJPeqfQgUpuucGuCIFWxACSq18wxYzcg/9xFyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199018)(38100700002)(4326008)(86362001)(8676002)(41300700001)(66946007)(66556008)(8936002)(6862004)(66476007)(6486002)(316002)(6636002)(33716001)(478600001)(2906002)(44832011)(5660300002)(82960400001)(26005)(9686003)(6506007)(6512007)(186003)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hhpJxR2JW+HmKQepOe2qAE6niiRp/csNijz7MoN8fOqzWBX6kItvSq15hDTO?=
 =?us-ascii?Q?bQtlnR1MM22QdWDbhzABhoYdFEc3jWeCKOmnD3rJ79ljNET+tXJT3iLyLnph?=
 =?us-ascii?Q?mqJsYYM90Yw7s+cipQ3bPmDHquPSvf5CUATvjIG+y8xGjAZqoePAyFLnuF46?=
 =?us-ascii?Q?oLP8PK7jM63I6wbymskxrj5RdKsRYWxiZUq7WwMOzZsdrMjrwQpvRBXse/nR?=
 =?us-ascii?Q?QAyUpFyF8Hy5GtGf7j2iy9A8D7lIgkzUt89HJ+GAV6UIOlz+NizL5aGrdKcL?=
 =?us-ascii?Q?BHd+yjkuqq2zIEEmDY/b4hKOKvJUOFusQ0iXaYszrMA0RZzK6rCciq9k26H7?=
 =?us-ascii?Q?JRrY/f/ZRlDBryDhzHzDD7LVke5BpIVKVUXeglMyOn1TvrExw3QCyHWvB0iz?=
 =?us-ascii?Q?dfsGhHfXs2lSE08ZGoSPpCnRNFnoohTaT/FxabZ4dRz7Tq0OW09GO4E1e1uF?=
 =?us-ascii?Q?gP2PjqK0DzV1ses1DOdS3H/2XWuv80tpSERjltr0JXXC7esO/JjaIyJ+iO5J?=
 =?us-ascii?Q?qbow2sUftZdwr040H6u8SYn/MZEca5QW7hWLKGBzCVimdFwsqDI7dmhXgI+S?=
 =?us-ascii?Q?82qDn0Gb55EuPe41zINLifNHLQNVVngYwqq6a9YbwOCx9ra6Meu+sGdxI8Yh?=
 =?us-ascii?Q?H7CDYYLU6k1oHigYDteHlCAf7fk6NJ5l99JE8KiAGBeHLDALqOa4Uk0nHec0?=
 =?us-ascii?Q?+5ZqsRvjCtBsJv2kT7OfjVBlaEuqEeTKulj3oJ/cTeQ89gOLKHisELfyDWPr?=
 =?us-ascii?Q?MiTUFXmuC6+N/TUnQoNsD9FqTOoEPxjE27E6+UyMieiU9yCSJ9BJ4bbW2j/E?=
 =?us-ascii?Q?r/omI4leM7d8WdAiW1G5kW53z6GYkRuuui82+6smDrPBk0vzs7O6HNcRpkQY?=
 =?us-ascii?Q?NXq5NBgscCWqdjM4lDxd+65Y3Qx/61UaOGWEhn6Lb87IDA64TPiiyTRD08UQ?=
 =?us-ascii?Q?4HNF6N1RB6VaGz5+Nr3le3UHwMzFCakSAupg9CusiptToTUT89xXH1Wy6ERj?=
 =?us-ascii?Q?1dL9D0iL0Wr2mNsD/lv65IVbK6G0AiTgkxmr8K0C5+u/YPydulQxYaJygGLQ?=
 =?us-ascii?Q?3tP/d5wynG12R5TVSnADNmr7A8f0MKBGIGpuMnoVtKkKcNaCdOwy5hyBPPTi?=
 =?us-ascii?Q?RpIw8XvRS/wJH0R/owpbWN8Z54w838ixf9nQm8HNaDBUNjDJJ78viGdaKNMH?=
 =?us-ascii?Q?Df2De3DszPDUvr2dC9ebzJq2NiVia4PD77dKkZrGPBt0oUayLDI2C91gkaIN?=
 =?us-ascii?Q?1Ci1G6g+OJTMnzW3hkxldgCN+qFFMJywBsoKeFa2vd/eEY7cUc1AwCuOuTHN?=
 =?us-ascii?Q?pQOQoe4sr0Q0Dc7v66byNPy/j7R1F/86XQXbFSUAoCTRBD7i9+ujf8YIlP0N?=
 =?us-ascii?Q?/U8+YohzYiL/j8xdqrOFP+BsgOSdXT+cM4VhajNHM1EQzBXi/rI2GKnEiQeV?=
 =?us-ascii?Q?5NcJ1ljFwZm9a9cW0zarjwZtLBZts7n2xktDUsK5BfCbzXoUWJlcjildnR6Z?=
 =?us-ascii?Q?WIujrCe9ZQLIi1QYZXct7DdCMD21qrf1vAtOGXkAGgpiz8DxU3mBzIt+2EGx?=
 =?us-ascii?Q?kwP3WaLseAhr7AAq5e59GG0Zbw88gwz97o6PuqEczidWu3H2/b1dUGuS9Fhm?=
 =?us-ascii?Q?P8MuqvwhhrUSRn+uallf/Kc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2334bb-5939-40fd-96a2-08db2c2f8563
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 06:18:01.6820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTbY0tDp651thLSD1H+FT7NcxwSF//0Asa2XySarB6tsv2DMtnk7FUmHtMZEFR5oy8eh70P1ypZ1pLba9afr9BhD+isbMbuPNb4PXzMkiRxgUXd0AkOerzKUxLQgKDUI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drn/xe: Drop usm lock around ASID xarray
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

On Tue, Mar 21, 2023 at 04:42:16PM -0700, Matthew Brost wrote:
>Xarray's have their own locking, usm lock not needed.
>
>Fixes lockdep splat on PVC:
>[ 4204.407687] ======================================================
>[ 4204.413872] WARNING: possible circular locking dependency detected
>[ 4204.420053] 6.1.0-xe+ #78 Not tainted
>[ 4204.423723] ------------------------------------------------------
>[ 4204.429894] xe_exec_basic/1790 is trying to acquire lock:
>[ 4204.435294] ffffffff8255d760 (fs_reclaim){+.+.}-{0:0}, at: xe_vm_create_ioctl+0x1c5/0x260 [xe]
>[ 4204.443932]
>               but task is already holding lock:
>[ 4204.449758] ffff888147c31e70 (lock#8){+.+.}-{3:3}, at: xe_vm_create_ioctl+0x1bb/0x260 [xe]
>[ 4204.458032]
>               which lock already depends on the new lock.
>
>[ 4204.466195]
>               the existing dependency chain (in reverse order) is:
>[ 4204.473665]
>               -> #2 (lock#8){+.+.}-{3:3}:
>[ 4204.478977]        __mutex_lock+0x9e/0x9d0
>[ 4204.483078]        xe_device_mem_access_get+0x1f/0xa0 [xe]
>[ 4204.488572]        guc_ct_send_locked+0x143/0x700 [xe]
>[ 4204.493719]        xe_guc_ct_send+0x3e/0x80 [xe]
>[ 4204.498347]        __register_engine+0x64/0x90 [xe]
>[ 4204.503233]        guc_engine_run_job+0x822/0x940 [xe]
>[ 4204.508380]        drm_sched_main+0x220/0x6e0 [gpu_sched]
>[ 4204.513780]        process_one_work+0x263/0x580
>[ 4204.518312]        worker_thread+0x4d/0x3b0
>[ 4204.522489]        kthread+0xeb/0x120
>[ 4204.526153]        ret_from_fork+0x1f/0x30
>[ 4204.530263]
>               -> #1 (&ct->lock){+.+.}-{3:3}:
>[ 4204.535835]        xe_guc_ct_init+0x14c/0x1f0 [xe]
>[ 4204.540634]        xe_guc_init+0x59/0x350 [xe]
>[ 4204.545089]        xe_uc_init+0x20/0x70 [xe]
>[ 4204.549371]        xe_gt_init+0x161/0x3b0 [xe]
>[ 4204.553826]        xe_device_probe+0x1ea/0x250 [xe]
>[ 4204.558712]        xe_pci_probe+0x354/0x470 [xe]
>[ 4204.563340]        pci_device_probe+0xa2/0x150
>[ 4204.567785]        really_probe+0xd9/0x390
>[ 4204.571884]        __driver_probe_device+0x73/0x170
>[ 4204.576755]        driver_probe_device+0x19/0x90
>[ 4204.581372]        __driver_attach+0x9a/0x1f0
>[ 4204.585724]        bus_for_each_dev+0x73/0xc0
>[ 4204.590084]        bus_add_driver+0x1a7/0x200
>[ 4204.594441]        driver_register+0x8a/0xf0
>[ 4204.598704]        do_one_initcall+0x53/0x2f0
>[ 4204.603056]        do_init_module+0x46/0x1c0
>[ 4204.607328]        __do_sys_finit_module+0xb4/0x130
>[ 4204.612207]        do_syscall_64+0x38/0x90
>[ 4204.616305]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
>[ 4204.621878]
>               -> #0 (fs_reclaim){+.+.}-{0:0}:
>[ 4204.627538]        __lock_acquire+0x1538/0x26e0
>[ 4204.632070]        lock_acquire+0xd2/0x310
>[ 4204.636169]        fs_reclaim_acquire+0xa0/0xd0
>[ 4204.640701]        xe_vm_create_ioctl+0x1c5/0x260 [xe]
>[ 4204.645849]        drm_ioctl_kernel+0xb0/0x140
>[ 4204.650293]        drm_ioctl+0x200/0x3d0
>[ 4204.654212]        __x64_sys_ioctl+0x85/0xb0
>[ 4204.658482]        do_syscall_64+0x38/0x90
>[ 4204.662573]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
>[ 4204.668146]
>               other info that might help us debug this:
>
>[ 4204.676145] Chain exists of:
>                 fs_reclaim --> &ct->lock --> lock#8
>
>[ 4204.685182]  Possible unsafe locking scenario:
>
>[ 4204.691094]        CPU0                    CPU1
>[ 4204.695623]        ----                    ----
>[ 4204.700147]   lock(lock#8);
>[ 4204.702939]                                lock(&ct->lock);
>[ 4204.708501]                                lock(lock#8);
>[ 4204.713805]   lock(fs_reclaim);
>[ 4204.716943]
>                *** DEADLOCK ***
>
>[ 4204.722852] 1 lock held by xe_exec_basic/1790:
>[ 4204.727288]  #0: ffff888147c31e70 (lock#8){+.+.}-{3:3}, at: xe_vm_create_ioctl+0x1bb/0x260 [xe]
>[ 4204.735988]
>               stack backtrace:
>[ 4204.740341] CPU: 8 PID: 1790 Comm: xe_exec_basic Not tainted 6.1.0-xe+ #78
>[ 4204.747214] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0021.P16.2105280638 05/28/2021
>[ 4204.757733] Call Trace:
>[ 4204.760176]  <TASK>
>[ 4204.762273]  dump_stack_lvl+0x57/0x81
>[ 4204.765931]  check_noncircular+0x131/0x150
>[ 4204.770030]  __lock_acquire+0x1538/0x26e0
>[ 4204.774034]  lock_acquire+0xd2/0x310
>[ 4204.777612]  ? xe_vm_create_ioctl+0x1c5/0x260 [xe]
>[ 4204.782414]  ? xe_vm_create_ioctl+0x1bb/0x260 [xe]
>[ 4204.787214]  fs_reclaim_acquire+0xa0/0xd0
>[ 4204.791216]  ? xe_vm_create_ioctl+0x1c5/0x260 [xe]
>[ 4204.796018]  xe_vm_create_ioctl+0x1c5/0x260 [xe]
>[ 4204.800648]  ? xe_vm_create+0xab0/0xab0 [xe]
>[ 4204.804926]  drm_ioctl_kernel+0xb0/0x140
>[ 4204.808843]  drm_ioctl+0x200/0x3d0
>[ 4204.812240]  ? xe_vm_create+0xab0/0xab0 [xe]
>[ 4204.816523]  ? find_held_lock+0x2b/0x80
>[ 4204.820362]  __x64_sys_ioctl+0x85/0xb0
>[ 4204.824114]  do_syscall_64+0x38/0x90
>[ 4204.827692]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>[ 4204.832745] RIP: 0033:0x7fd2ad5f950b
>[ 4204.836325] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
>[ 4204.855066] RSP: 002b:00007fff4e3099b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>[ 4204.862623] RAX: ffffffffffffffda RBX: 00007fff4e3099f0 RCX: 00007fd2ad5f950b
>[ 4204.869746] RDX: 00007fff4e3099f0 RSI: 00000000c0206443 RDI: 0000000000000003
>[ 4204.876872] RBP: 00000000c0206443 R08: 0000000000000001 R09: 0000000000000000
>[ 4204.883994] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fff4e309b14
>[ 4204.891117] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000000
>[ 4204.898243]  </TASK>
>

Are we sure this patch fixes the above splat?
I am not seeing the above splat after the below fix.
'drm/xe: Use atomic instead of mutex for xe_device_mem_access_ongoing'

>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_pagefault.c | 4 ----
> drivers/gpu/drm/xe/xe_vm.c           | 4 ----
> 2 files changed, 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index d7bf6b0a0697..76ec40567a78 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -119,11 +119,9 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> 	bool atomic;
>
> 	/* ASID to VM */
>-	mutex_lock(&xe->usm.lock);
> 	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> 	if (vm)
> 		xe_vm_get(vm);
>-	mutex_unlock(&xe->usm.lock);

I am seeing there are other xarrays like xref->engine.xa and xref->vm.xa
which do use locking around them. Perhaps we need make this a separate
patch and address them as well?

Niranjana

> 	if (!vm || !xe_vm_in_fault_mode(vm))
> 		return -EINVAL;
>
>@@ -507,11 +505,9 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> 		return -EINVAL;
>
> 	/* ASID to VM */
>-	mutex_lock(&xe->usm.lock);
> 	vm = xa_load(&xe->usm.asid_to_vm, acc->asid);
> 	if (vm)
> 		xe_vm_get(vm);
>-	mutex_unlock(&xe->usm.lock);
> 	if (!vm || !xe_vm_in_fault_mode(vm))
> 		return -EINVAL;
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index ab036a51d17e..e7674612a57e 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1377,10 +1377,8 @@ static void vm_destroy_work_func(struct work_struct *w)
> 		xe_pm_runtime_put(xe);
>
> 		if (xe->info.has_asid) {
>-			mutex_lock(&xe->usm.lock);
> 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
> 			XE_WARN_ON(lookup != vm);
>-			mutex_unlock(&xe->usm.lock);
> 		}
> 	}
>
>@@ -1887,11 +1885,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> 	}
>
> 	if (xe->info.has_asid) {
>-		mutex_lock(&xe->usm.lock);
> 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
> 				      XA_LIMIT(0, XE_MAX_ASID - 1),
> 				      &xe->usm.next_asid, GFP_KERNEL);
>-		mutex_unlock(&xe->usm.lock);
> 		if (err) {
> 			xe_vm_close_and_put(vm);
> 			return err;
>-- 
>2.34.1
>
