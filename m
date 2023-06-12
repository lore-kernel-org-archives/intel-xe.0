Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7C8C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 18:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5655C10E1FB;
	Mon, 12 Jun 2023 18:23:26 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8475810E1FB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 18:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686594204; x=1718130204;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZH5/K9SN089zUQBPMDkx2ykKhbMA02qbzWXcdcQoqYo=;
 b=kIDX3Lw++PcjaHi1TKv/duNprXvzfAuF+skFA087IseYcgoUz8E0GqSU
 ye0opA1dddyPaPCgFR2QS2wsbfln5e/lQecDy7WyHDkBZciQa2W7cBZrb
 x1N1Dbnpw3iBuV3+0KNX6EjSl+6FILDoBLX4hjEQdudS73+SG2izqsFNP
 HpyGp0GvceepTOIoZsl4hW6+VDdILqT98Zms0273yq1PxM5ZDWLvzF41L
 zmJYjDsAFc2eg4icO7lhr1kDFENqakGYkwslZBEdHlZFpAX79DQdJMGYx
 xrJ65RpMqWUt+m4461vqGXLBNPRVxgRBUAW8h2qIGaK9AKtJKrRuxtahp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444505210"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="444505210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 11:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="855759922"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="855759922"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2023 11:23:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:23:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 11:23:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 11:23:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BClnP5IIGwLTGInI5qc6iZ0bICj17q5PVsy+WFyfWShAACqht3EDSrn2f7HZS0LleQbGZS6SIJPaFXBLYUSk6xPPqXzbUhZ8sq/n/Yr694H/SdGKIk6bb0vL+VfWAQ5Cqx3Xj/LLpK6yK++Qt6PxetxUHBenJGyRzc9j/TKZNYMNewPJA+jMUbl8ggc/88Lt4weN6Onh9y4YnTceDLRBUa2HhHX3xK24+CzQQYsEX88G3hJoS/UEW7Per2umheRRidJa6QcZry919afhiltFrF9itbdW1mT+PxQyFGK7UfxZKzNng7PmbL/AO+nGs9GSfUQv9M+2ISO34OOa6pmZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+1CcGR73i3/RiJQaCXpAyoXN1GWLz7xszE1dovXzRI=;
 b=n/QY/qMWMeyS4uc5LiZZWTBb5xyn1JIJYUgexsU2YOe79EIdEReIe86roH97CQyBV/M9S9H/2lIq3QkraxogkcNWvAmUapFRoOtsO+B+4emSvucnr64YV1/eOZl34c77lSdUkqSvvjPHsRxS6X9vMcChRpL5mF7wYoZAMgb2GBlG07ww9vIud9HHV7VphbOsrafgTGvA/8lMrajBagZpKW1E3x3xhgkcTKWIIiKvg3lcGo+kqTcNCU+q2JBl9dywWQuje28zussl+zA/PDjWipTQCPZ29W9Dsh4SzuxC+foQaP5oq2yDRCjzH6ie9wycUARuHCKmYcC+Q9Qm4DoR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8377.namprd11.prod.outlook.com (2603:10b6:208:487::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Mon, 12 Jun
 2023 18:23:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:23:21 +0000
Date: Mon, 12 Jun 2023 18:22:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZIdibdrkepdcWikv@DUT025-TGLU.fm.intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
 <20230612171225.88689-12-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230612171225.88689-12-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7c33be-6c84-4d7a-2928-08db6b7219ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKUQRbMEXbw5B1OswBgFZo/T7iCth8UWv3IqNfiok6ImdttAHa7KpPqmLb/jfEeT5oIseQ9/70DcZXL3XFXDKRQApkHcPpE9ltFkGJRFkJwApf9TTYBnrnBPB/I4U0Ek/GDYo0tVScleLP5DgoSAn97c1wewHfDQjZ5BejEeGjo/QY/8cg8l4ym+vehdn8dxsng/9K5ql2sPIJFCYBPb8BQjNq4qkQIyhI7M1TFc8Ju7YPCFMCiUWbEZT3WV0z2H9jIo/YvmPVYouoGIu86MPfhRFJiNgZKeq8Kyff2QWSrdcmx07K7ZkVckfYqE/bOl9XGvygkA3T9SOmCN46LFyvJP3WcZ/0SqEa0jSlSgHSY6RUhmfQfcf0vM8QKwzLoncx3JxFlPtyetcx7erRO2lFmXDchSiAG2U3HccVQbHMq+22VwbWL4v+0w9o0UDztK25WZftO+4Mi9y29tLFkJJsd55aRZRqPjuZ+/6fZv7Ny0/kFM/+3jsoBMgo/0FxfIA1pRsMZb63H5KkxfK+rK7jRgfYroio+cOGYOay0R1d8yvQV5K6E2joQ9lxcI74QL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199021)(26005)(6512007)(6506007)(107886003)(44832011)(5660300002)(86362001)(83380400001)(186003)(6862004)(6636002)(8936002)(8676002)(2906002)(41300700001)(316002)(66476007)(66556008)(6666004)(4326008)(66574015)(38100700002)(82960400001)(478600001)(66946007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EiN1rLX0IwErQncVLfAJwlfTJquKuSha9EixLI0l6spq3VLOvIIJ1akph4?=
 =?iso-8859-1?Q?ZoLNBtKZDJjSOzfyanI6fCexREr0Ayijcb8QlcDhv9jt3Ytp+gzLgNRgxI?=
 =?iso-8859-1?Q?phF++GaAu1LBev0AknhbXt5XUSo+ZbK3UQL7uTS27olTgSzcWfsSgpGMSc?=
 =?iso-8859-1?Q?als0Mo0MSoxoN7DomlzsurwsuRi8m7x7qgkmdb9gME5oy74f3/WW9tecvY?=
 =?iso-8859-1?Q?ToRVQjBkxDbuj4uBxBPhl+teDm6tSnBUom9FU8ot2cXgNxZUiQpwf6fqzQ?=
 =?iso-8859-1?Q?zkjFpD3KN83CyCjqDYv4OMnoCnpWEwurfiZf7X7WqAGlt3pJMjCMjT8Tjd?=
 =?iso-8859-1?Q?5V6EJAFTHgHrzw8epZ1sJ7R9P8a4c0WHcJGlqPzpkAXOlPsqHrSDFupi2b?=
 =?iso-8859-1?Q?QGIhrp7v7X5tiiOAvFI68k7IQdM84jEXcgUWQSAgP5KOT+czjFo2e3lD2U?=
 =?iso-8859-1?Q?BnzjkHGQqR3ehdMdKRRiYiTkx/xcE4NTOKScffT8/9MujS5sNC8esdX4Ho?=
 =?iso-8859-1?Q?HsdIpvf4cEYyvdtIxSUsIejgX6XZktpZNcStkMZXjv+WexjzzEMMMK/PJM?=
 =?iso-8859-1?Q?s+SkP0jjvkJBFArQXjulM9SHKAlTo/yI2tsEMoRgqn5eHFUtXASB94Pljb?=
 =?iso-8859-1?Q?MFbonvKxGsfpKS0dbTmO0QfNobdytVSLH7gRCD6bJAssSAOf9rMyT/t6zL?=
 =?iso-8859-1?Q?2BSOwmtx1LE5NlOYkAsSEaYsMWFx5vjdVHvrzLwypwZGXmTwPtEaWDgYRK?=
 =?iso-8859-1?Q?MTVS6eFcNL+y63eJQpbOh0vTDo7OhPuY+AZRb0nhha26bN1Rkz75z+GveV?=
 =?iso-8859-1?Q?1SCxhpZMToimsxLFFCh9dc4v3CYmVFkjiRB5TWvKm5uZkdqn606QgAMew6?=
 =?iso-8859-1?Q?i/tVIz8VRNMc9SORNA+CgP7yWYO2QAd5AAxtsz421M33hDf9vtISq6byK9?=
 =?iso-8859-1?Q?4RlLjHpH5wXGk0BYZBSlrjqo5FngI1U+VghB25obCw2YyQF0BbQrVokCq3?=
 =?iso-8859-1?Q?YW5E6IUHYR7en87gV2Rw5h15uOTgBf1XztjThp4ruRhYYf1zxJbjfHLDJ1?=
 =?iso-8859-1?Q?f2ecBHVVLrmIVdGoNzAaRXKUN597NremXs4Nu4I5RRCCUDs/Az5RPJEeuj?=
 =?iso-8859-1?Q?UM7ZbqRd+gq/eCZsGl26LfWF++MdnhYEsb7CsX0zYZyw8bFzlZdRMQU78G?=
 =?iso-8859-1?Q?tj44v4PCHepdZGjrnMsvNerK50ob2O5vqyxBj5a00OfNUU1pg/R4UM0UFX?=
 =?iso-8859-1?Q?/Sln8Q0WP3c7ys5hSaWUskIf7GzBUih/wLmM1RDWpz/VonyXaHlyFXBoYi?=
 =?iso-8859-1?Q?GWe/5dvaIS4F0CfbVqOx+DNuONqunGH6Y9pMy7eTt3wORUGOKoSwdLQE76?=
 =?iso-8859-1?Q?kUYIZH67aGGZUFR1KAsKUCl5AEYu9dYN9KxYMLCNMrS1JkbWNHAqWCwaDV?=
 =?iso-8859-1?Q?WtNg0I3y7j8j1FfLyGwHAZ/vJwfmIj98aC960ZwU3n9HbFIY7knbQXKvsh?=
 =?iso-8859-1?Q?2GX7NLvrAGs4FWI1ESB7z6BOxd60Yc1TJmsRodlDNOaMrUC6UFw+xZQdwB?=
 =?iso-8859-1?Q?olKRwVM2VNA28OHRGCNFpBLAo09KxZWrR8kkD0/EbOyDVjBdwD7asg/Lxg?=
 =?iso-8859-1?Q?hJjrN0ksTuRHjN9UmQB7XpAdwahadNbJ1znutb/9IoNsBswkAQvFbjKA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7c33be-6c84-4d7a-2928-08db6b7219ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:23:21.1288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbyZrV6W69spNsD9rOmvWRCN8rN03gdoQW/Gm24nm9+ig5Q5gj37lhP0L3ximdG/CEA051M9ph7JtsEhcci6KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8377
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v11 11/12] drm/xe: drop
 xe_device_mem_access_get() from invalidation_vma
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 06:12:24PM +0100, Matthew Auld wrote:
> Lockdep gives the following splat:
> 
> [  594.158863] ffff888140da53f0 (&vm->userptr.notifier_lock){++++}-{3:3}, at: vma_userptr_invalidate+0xeb/0x330 [xe]
> [  594.158921]
>                but task is already holding lock:
> [  594.158926] ffffffff82761940
> (mmu_notifier_invalidate_range_start){+.+.}-{0:0}, at: unmap_vmas+0x0/0x1c0
> [  594.158941]
>                which lock already depends on the new lock.
> 
> [  594.158947]
>                the existing dependency chain (in reverse order) is:
> [  594.158953]
>                -> #5 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}:
> [  594.158961]        fs_reclaim_acquire+0x68/0xd0
> [  594.158969]        __kmem_cache_alloc_node+0x2c/0x1b0
> [  594.158975]        kmalloc_node_trace+0x1d/0xb0
> [  594.158983]        alloc_worker+0x18/0x50
> [  594.158989]        init_rescuer.part.0+0x13/0xa0
> [  594.158995]        workqueue_init+0xdf/0x210
> [  594.159001]        kernel_init_freeable+0x5c/0x2f0
> [  594.159009]        kernel_init+0x11/0x1a0
> [  594.159017]        ret_from_fork+0x29/0x50
> [  594.159023]
>                -> #4 (fs_reclaim){+.+.}-{0:0}:
> [  594.159031]        fs_reclaim_acquire+0xa0/0xd0
> [  594.159037]        __kmem_cache_alloc_node+0x2c/0x1b0
> [  594.159042]        kmalloc_trace+0x20/0xb0
> [  594.159048]        acpi_device_add+0x25a/0x3f0
> [  594.159056]        acpi_add_single_object+0x387/0x750
> [  594.159063]        acpi_bus_check_add+0x108/0x280
> [  594.159069]        acpi_bus_scan+0x34/0xf0
> [  594.159075]        acpi_scan_init+0xed/0x2b0
> [  594.159082]        acpi_init+0x21e/0x520
> [  594.159087]        do_one_initcall+0x53/0x260
> [  594.159092]        kernel_init_freeable+0x18a/0x2f0
> [  594.159099]        kernel_init+0x11/0x1a0
> [  594.159105]        ret_from_fork+0x29/0x50
> [  594.159110]
>                -> #3 (acpi_device_lock){+.+.}-{3:3}:
> [  594.159117]        __mutex_lock+0x95/0xd10
> [  594.159122]        acpi_enable_wakeup_device_power+0x30/0x120
> [  594.159130]        __acpi_device_wakeup_enable+0x34/0x110
> [  594.159138]        acpi_pm_set_device_wakeup+0x55/0x140
> [  594.159143]        __pci_enable_wake+0x56/0xb0
> [  594.159150]        pci_finish_runtime_suspend+0x35/0x80
> [  594.159157]        pci_pm_runtime_suspend+0xb5/0x1a0
> [  594.159162]        __rpm_callback+0x3c/0x110
> [  594.159170]        rpm_callback+0x58/0x70
> [  594.159176]        rpm_suspend+0x15c/0x6f0
> [  594.159182]        pm_runtime_work+0x9b/0xb0
> [  594.159188]        process_one_work+0x263/0x520
> [  594.159195]        worker_thread+0x4d/0x3b0
> [  594.159200]        kthread+0xeb/0x120
> [  594.159206]        ret_from_fork+0x29/0x50
> [  594.159211]
>                -> #2 (acpi_wakeup_lock){+.+.}-{3:3}:
> [  594.159218]        __mutex_lock+0x95/0xd10
> [  594.159223]        acpi_pm_set_device_wakeup+0x7a/0x140
> [  594.159228]        __pci_enable_wake+0x77/0xb0
> [  594.159234]        pci_pm_runtime_resume+0x70/0xd0
> [  594.159240]        __rpm_callback+0x3c/0x110
> [  594.159246]        rpm_callback+0x58/0x70
> [  594.159252]        rpm_resume+0x50d/0x7a0
> [  594.159258]        rpm_resume+0x267/0x7a0
> [  594.159264]        __pm_runtime_resume+0x45/0x90
> [  594.159270]        xe_pm_runtime_resume_and_get+0x12/0x50 [xe]
> [  594.159314]        xe_device_mem_access_get+0x97/0xc0 [xe]
> [  594.159346]        hw_engines+0x65/0xf0 [xe]
> [  594.159380]        seq_read_iter+0x10d/0x4b0
> [  594.159385]        seq_read+0x9e/0xd0
> [  594.159390]        full_proxy_read+0x4e/0x80
> [  594.159396]        vfs_read+0xb6/0x310
> [  594.159401]        ksys_read+0x60/0xe0
> [  594.159406]        do_syscall_64+0x38/0x90
> [  594.159413]        entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  594.159419]
>                -> #1 (&xe->mem_access.lock){+.+.}-{3:3}:
> [  594.159427]        xe_device_mem_access_get+0x43/0xc0 [xe]
> [  594.159457]        xe_gt_tlb_invalidation_vma+0x53/0x190 [xe]
> [  594.159490]        invalidation_fence_init+0x1d2/0x2c0 [xe]
> [  594.159529]        __xe_pt_unbind_vma+0x151/0x4e0 [xe]
> [  594.159564]        vm_bind_ioctl+0x48a/0xae0 [xe]
> [  594.159602]        async_op_work_func+0x20c/0x530 [xe]
> [  594.159634]        process_one_work+0x263/0x520
> [  594.159640]        worker_thread+0x4d/0x3b0
> [  594.159646]        kthread+0xeb/0x120
> [  594.159650]        ret_from_fork+0x29/0x50
> [  594.159655]
>                -> #0 (&vm->userptr.notifier_lock){++++}-{3:3}:
> [  594.159663]        __lock_acquire+0x16fa/0x2850
> [  594.159670]        lock_acquire+0xd2/0x2e0
> [  594.159676]        down_write+0x36/0xd0
> [  594.159681]        vma_userptr_invalidate+0xeb/0x330 [xe]
> [  594.159714]        __mmu_notifier_invalidate_range_start+0x239/0x2a0
> [  594.159722]        unmap_vmas+0x1ac/0x1c0
> [  594.159727]        unmap_region+0xb5/0x120
> [  594.159732]        do_vmi_align_munmap+0x2be/0x430
> [  594.159739]        do_vmi_munmap+0xea/0x120
> [  594.159744]        __vm_munmap+0x9c/0x160
> [  594.159750]        __x64_sys_munmap+0x12/0x20
> [  594.159756]        do_syscall_64+0x38/0x90
> [  594.159761]        entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  594.159768]
>                other info that might help us debug this:
> 
> [  594.159773] Chain exists of:
>                  &vm->userptr.notifier_lock --> fs_reclaim -->
> mmu_notifier_invalidate_range_start
> 
> [  594.159785]  Possible unsafe locking scenario:
> 
> [  594.159790]        CPU0                    CPU1
> [  594.159794]        ----                    ----
> [  594.159797]   lock(mmu_notifier_invalidate_range_start);
> [  594.159802]                                lock(fs_reclaim);
> [  594.159808]
> lock(mmu_notifier_invalidate_range_start);
> [  594.159814]   lock(&vm->userptr.notifier_lock);
> [  594.159819]
> 
> The VM should be holding a mem_access.ref so this looks like it should
> be a false positive and we can just drop the explicit mem_access in
> xe_gt_tlb_invalidation().  The GGTT invalidation path also takes care to
> hold mem_access.ref so should be fine there also.

Also the MMIO write to notify the GuC of the H2G should have memory
access assert.

With that.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 2fcb477604e2..19826488d3da 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -194,7 +194,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  	struct xe_device *xe = gt_to_xe(gt);
>  #define MAX_TLB_INVALIDATION_LEN	7
>  	u32 action[MAX_TLB_INVALIDATION_LEN];
> -	int len = 0, ret;
> +	int len = 0;
>  
>  	XE_BUG_ON(!vma);
>  
> @@ -248,11 +248,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>  
>  	XE_BUG_ON(len > MAX_TLB_INVALIDATION_LEN);
>  
> -	xe_device_mem_access_get(xe);
> -	ret = send_tlb_invalidation(&gt->uc.guc, fence, action, len);
> -	xe_device_mem_access_put(xe);
> -
> -	return ret;
> +	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
>  }
>  
>  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> -- 
> 2.40.1
> 
