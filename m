Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419DFC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 22:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37D310EA52;
	Thu, 15 Feb 2024 22:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVVJz+16";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521E010EA52
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 22:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708037277; x=1739573277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l9XFaGoJKco2NdFVOSI31sPDXMj34aMIA1mW1QlZKXA=;
 b=GVVJz+16kxBQv5y4Eo6iDgeqShUHk5MiY3zyn4etGtZ7F0iIkw1bTpIA
 1wibX1gfGpjeu31gKymJ25iR1h07PwdqpmQ4JlSzNBG0cGIVdG1bhauGG
 KrMSJOtijMLMOFhxj3Cv1ct7Q879T8F59DVvrw3ZKVN+q6iNS3vpk4uuh
 Uhat1jsF1IrHIbmEHmaoMWrN2/aROUr1sLW8RFdW4U1mcZc4PrcrOXgmt
 jxyk9dvJsnzOAsu+gxjdDJ9gTStiIy3GtDvSm4u+gZmIVyovv+uNSfnx5
 eCNoEunrgQDdzBH+AbncduKdh/5+djJCsu/vL68+C25gLXVhG6iay/IsP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2012200"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2012200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 14:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3597926"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 14:47:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 14:47:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 14:47:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 14:47:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 14:47:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9np0m2MM489wh/kUnuHS25OsC9YXkq/66rPChY5hLHzE6/yCHM3ZpULUSmDoIkWiwVf9lvQCWfPmxhjLEvS58pIEZui92Fl+baLT6Jce/Gf+MCRVFqunLE4/tQptvJrG44I0RY9I+hBPKcXBDm+dIBvbCAXOGs2R3jJiw3mh2eqJhOVizuh1W2V7Toj+s65MdTAUQ6D5ph4VZRq+pD1I6icMYo04rLQlJE0ePiRwx0PmWyXLxZQuGfRSYsC0gzSZpspmykeQ/fNjueyLWdH0LHtvod9vuH3NEx+wJFiT9EEKGl12WADSM/8B9Bydixe/De1wsL4PEfgSOq9pdtosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnJd674iBH8PJovzxmsF0qIa/vyzug8HafSj2OqLw/s=;
 b=CoRGIOJ3t7rWjJgWUShNDF4rkn8vc926vRDEitUdlDTW1sXGj7Mhm9hoo/Va/+zYoyc6ngh4is9IqBf1GxhO31ejKBWnh1gD2dsbOyG0sW5ZLpTwE/UglSH523RYkrt+oUWBw3YPUTfpz5jQcCS8bd7vfQUJR5PcmP142eXyqYHxOtfmNOZ8BQmn88tYxa2A+UzpanH7rmsTdKkrnCrIQbLds3F8UmhhdWXWVBX88upZwKzliID5RZZcb3kT5bYTjb3YSRuA28XOMIVbjrFldgVGKEvcb3VXJ2G8IeIaMp2WdcTFxxZJI1T1KkKLH425W0XYuTZuVZZZ1JRxjDOMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 22:47:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 22:47:50 +0000
Date: Thu, 15 Feb 2024 17:47:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 19/34] drm/xe: Remove pm_runtime lockdep
Message-ID: <Zc6UlCthcR61eI4y@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-20-rodrigo.vivi@intel.com>
 <fc63da97-8aee-4027-a723-723ef7ac9567@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fc63da97-8aee-4027-a723-723ef7ac9567@intel.com>
X-ClientProxiedBy: BYAPR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:74::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c876782-2551-4f43-8247-08dc2e78237e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sb0jqoDmPwpQGlhggXTV9Pcv/oVibgqDzbksR3ZaoI/uN+3PKUQQFDbEUu7zG4g/Lei6rV5vGfcWjskUAFXefyEC+69YzMpsr+Zc7UgEND65+S/YJ4kzwdq9mMmmCwWQw6q5tKpLYZr099XwpR3eoOMUo5TPeoWGPIbtvMMQQuKXfU2O4/8w8wiUKNY3ak+J/Tn47qVlFGXoCQwCq8uLrqAbtGtlTRh6XsAX9x2IrnJxFaXjxHJYAhc5H0Q/NPZeegvGVU1pkP0dHMkg+BEnc5Wwb1MZamikj+MLuFZC2gJH5xrI4w3cP3LJ//Gv6jDerAckdV0m9vqfe+seWDPcrSfRMaQ1E9s/7wbqPmrEZDdFOMBo3YuCJr0ThiLmWxSvfJyOucj2L6raecJlD4bxPWJsl2X8xxf8/bfFR0JGDJ+uyZm1AC4eTgknQX6WTlCiKALnXGjqPZEi4wHky/9qoafORk7FjxkBVJ4wIoLycrPbg7lB8hT9sPxmI5mlIMx7rNzMi4LCHcJZXaV/vnKnmuZXYQpVEweeoicV67ShTxMRcPZ7hT0/1+5dQJ2HjifX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(39860400002)(366004)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(30864003)(6512007)(8936002)(6506007)(53546011)(36756003)(6486002)(478600001)(26005)(38100700002)(82960400001)(2616005)(83380400001)(44832011)(86362001)(8676002)(4326008)(66946007)(66476007)(66556008)(6862004)(5660300002)(6636002)(316002)(37006003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ubyHRcgMPpX6H89PBNDCSQxx5xdAPIsZLgC4zCBRrlFiAQToJ1LDb1tapiMP?=
 =?us-ascii?Q?I7eIcshI/W1WhGWJmCGxjBJOqtH8wOFJl+lRMYy8Nka8dsvXdHbnuMdPzZBW?=
 =?us-ascii?Q?xEHSAmfCMBWE4CKkXSyaw6Xp4jW9HMke6Nx3V3rsKJSJUIy3t+yQ6WnINOgm?=
 =?us-ascii?Q?5a19hEMdP2O8hXM5TsvEggKelVkdf5nqmoYWQYysYG+Qf9E8OGLy6lFagsAA?=
 =?us-ascii?Q?h8vOBVyrnMzPEyBLfkXCCWubw6ZHsfN3e/geuDE3sDfR58LhpHjy0UR3kbcE?=
 =?us-ascii?Q?6pd3Utq9ELtsHKUrSiUstP44+9HRLi+M3SZmVT939bSivaPKUXdBAjDx60YA?=
 =?us-ascii?Q?HuShkl5hG7LpdMIAq8xXjBAAVOnCQCWWFZhIkaNZF8RnJD4ZuTPj/mkvgXJs?=
 =?us-ascii?Q?T6dWzxhkvaXlauWtO30kCtUmcwVj9/exeu6nKb4SZBF4CKxpmRHLOTg74XjX?=
 =?us-ascii?Q?/WKyExzM27vqBsSQmZNX4Js/17aRbxr1INa0AOg8Q7K15O+QSSarICULvhtb?=
 =?us-ascii?Q?lgA94bMypWIAAcMXnwlcjieK0FnnV+GXMZ/Y4dIA01JDaMptuefzTXzjpPTs?=
 =?us-ascii?Q?VZ1gLIQdSfv1F6byckQphRIWP0k8SmUIV7R48VRHsLDXjKH02PioCtY2O0Ja?=
 =?us-ascii?Q?EFcbZNhqNpfiM9Ux0awwhC9cl4q7waa2EBJSxZuUmxV4crWwLktxp/n02dRS?=
 =?us-ascii?Q?+qf/1oZQfSa5T4pfU8YxsT8F+DDRuynn3riOi8QXN0M3rVY1w/vZuUa/ZiQi?=
 =?us-ascii?Q?9txlnZRrL42gJdEcfGFVZi+W/S6d+9zSRZ4WjXifrhc0ddZufK5Dmz/8FyDn?=
 =?us-ascii?Q?4+/h8BYFie6PHtcj06PNdU+MeybXjzHxHMiqIQCOoczRNFy1o6BuHWEL009A?=
 =?us-ascii?Q?9FlRpiwOax4hivMmDnyaWI2kaLw4UIX0HU0ejYkRsHh5RfG7eufG2jM2OtJN?=
 =?us-ascii?Q?MDYTZEtLixARXU+I4Sj6EWaLIfCFCPHkIpkcVPE8zdWnNltih9ciYC7livoR?=
 =?us-ascii?Q?SSuiYUr2rOMVatfWXqEcSx9OL252EgDelb8dWOCguKnIYsXMZzBvhMMfxbZZ?=
 =?us-ascii?Q?0NH5J7roJbd5LjpEK6WI86kO1Jt63kzHobBqyZrCSevmcDqeGtaEP9QUhpSZ?=
 =?us-ascii?Q?hj0BrJ14qFpHLVe9E5g0wMyk428f0gl1unhfnpTg/fGa8fTdZBVTy/gbkXC7?=
 =?us-ascii?Q?pwhna2diN/RXB1xhHDFHVCHfIo53kStApvxd31Z+hgzJH5qK1hVZ024oDOlb?=
 =?us-ascii?Q?ktxJt40eEcVCo0DdAz6zUNOlUJXOc4jkURvCa7ZxmzBx78e3MmgJyLsjmpAt?=
 =?us-ascii?Q?IuRSOfTedlj3RBImmN0FyLLaXEZmbGXI20E52xPC2OEVoQQX68+CvbajElU7?=
 =?us-ascii?Q?vcHgjSAY0OkzBXxSYFxsxTcUua5K/h2MvWxz2TLOzDku2a5gKNqt2MJVXZzs?=
 =?us-ascii?Q?BeVaeYf7QixE6jRdQ7FevS67u6IazyWG8m5rdq/mJ5RhF8geAijdC35EU2cm?=
 =?us-ascii?Q?ZSTIN6jUnazBiGcdP5IhMFpp/DIKO+tYtH6OmPcM8vFug6Ozjl9ZSjXCIpoS?=
 =?us-ascii?Q?6JoklHSibbYsFchq+HLcscObGt/hnNQg5AOaUgi4AWdPHBfBlkrpEDPwRnZc?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c876782-2551-4f43-8247-08dc2e78237e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 22:47:50.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5D9DvK1l+rkx6AA+hMbPM7nRHd249/hjwGsu7YWcwA4dA3fi7EU0yC+wDoltAEydc6KG/aN5qOUHvEPFJW2H1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

On Mon, Feb 05, 2024 at 11:54:45AM +0000, Matthew Auld wrote:
> On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > This lockdep was initially designed for the mem_access,
> > where the mem_access needed to run the resume sync from
> > the innerbounds and count the references.
> > 
> > With the runtime moving to the outer bounds of the driver
> > and the mem_access replaced by the pure rpm get/put
> > references, it is no longer needed and it is in a matter
> 
> We are also calling it in workers like invalidation_fence_work_func(),
> xe_sched_process_msg_work() etc. It is still quite easy to deadlock with
> that.
> 
> > of fact just splatting may false positives as the following:
> 
> Yeah, calling invalidation_fence_work_func() directly in the callers context
> is a false positive since ioctl has the rpm ref. But what about calling that
> in the async case where invalidation_fence_work_func() is only called when
> the in-fence signals? We are sure that is safe? It should be simple to fix
> the false positive here, no? If we just delete all the annotations we get
> zero help from lockdep for the more complicated cases. Also IIRC lockdep
> doesn't show you every splat once it triggers once, so who knows what else
> is lurking and whether that is also false positive?
> 
> > 
> >                 -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> > [  384.778761]        xe_pm_runtime_get+0xa3/0x100 [xe]
> > [  384.783871]        invalidation_fence_work_func+0x7f/0x2b0 [xe]
> > [  384.789942]        invalidation_fence_init+0x8c2/0xce0 [xe]
> > [  384.795671]        __xe_pt_unbind_vma+0x4a7/0x1be0 [xe]
> > [  384.801050]        xe_vm_unbind+0x22f/0xc70 [xe]
> > [  384.805821]        __xe_vma_op_execute+0xc67/0x1af0 [xe]
> > [  384.811286]        xe_vm_bind_ioctl+0x3a36/0x66c0 [xe]
> > [  384.816579]        drm_ioctl_kernel+0x14a/0x2c0
> > [  384.821132]        drm_ioctl+0x4c6/0xab0
> > [  384.825073]        xe_drm_ioctl+0xa1/0xe0 [xe]
> > [  384.829651]        __x64_sys_ioctl+0x130/0x1a0
> > [  384.834115]        do_syscall_64+0x5c/0xe0
> > [  384.838232]        entry_SYSCALL_64_after_hwframe+0x6e/0x76
> > [  384.843829]
> >                 -> #0 (reservation_ww_class_mutex){+.+.}-{4:4}:
> > [  384.850911]        __lock_acquire+0x3261/0x6330
> > [  384.855462]        lock_acquire+0x19b/0x4d0
> > [  384.859666]        __ww_mutex_lock.constprop.0+0x1d8/0x3500
> > [  384.865263]        ww_mutex_lock+0x38/0x150
> > [  384.869465]        xe_bo_lock+0x41/0x70 [xe]
> > [  384.873869]        xe_bo_evict_all+0x7ad/0xa40 [xe]
> > [  384.878883]        xe_pm_runtime_suspend+0x297/0x340 [xe]
> > [  384.884431]        xe_pci_runtime_suspend+0x3b/0x1e0 [xe]
> > [  384.889975]        pci_pm_runtime_suspend+0x168/0x540
> > [  384.895052]        __rpm_callback+0xa9/0x390
> > [  384.899343]        rpm_callback+0x1aa/0x210
> > [  384.903543]        rpm_suspend+0x2ea/0x14c0
> > [  384.907746]        pm_runtime_work+0x133/0x170
> > [  384.912213]        process_one_work+0x73b/0x1230
> > [  384.916853]        worker_thread+0x726/0x1320
> > [  384.921237]        kthread+0x2ee/0x3d0
> > [  384.925005]        ret_from_fork+0x2d/0x70
> > [  384.929120]        ret_from_fork_asm+0x1b/0x30
> > [  384.933585]
> >                 other info that might help us debug this:
> > 
> > [  384.941625]  Possible unsafe locking scenario:
> > 
> > [  384.947572]        CPU0                    CPU1
> > [  384.952123]        ----                    ----
> > [  384.956676]   lock(xe_pm_runtime_lockdep_map);
> > [  384.961140]                                lock(reservation_ww_class_mutex);
> > [  384.968220]                                lock(xe_pm_runtime_lockdep_map);
> > [  384.975214]   lock(reservation_ww_class_mutex);
> > [  384.979765]
> >                  *** DEADLOCK ***
> > 
> > In a matter of fact, there's actually a third lock that is not
> > in this picture:
> > spin_lock_irq(&dev->power.lock);
> > and INIT_WORK(&dev->power.work, pm_runtime_work);
> > 
> > The pm_callback_task will ensure that there's no recursive
> > calls of the resume function and it will increase the
> > reference counter anyway.
> > 
> > Then, the pm_runtime workqueue and spin locks will avoid that
> > any resume and suspend operations happens in parallel with
> > other resume and suspend operations.
> > 
> > With that, the only thing that we are actually doing here is
> > to wrongly train the lockdep, basically saying that we will
> > acquire some locks on resume and on suspend concurrently,
> > entirely ignoring its serialization and protection.
> > 
> > The above scenario is simply not possible because there's
> > a serialization with the spin_lock_irq(&dev->power.lock)
> > before each operation. However we are telling the lockep
> > that the lock(xe_pm_runtime_lockdep_map) occurs before
> > the &dev->power.lock and lockdep is not capable to see
> > that other protection.
> 
> Can you share some more info here? AFAIK dev->power.lock is an RPM core lock
> that protects internal state like transitioning between ACTIVE, SUSPENDING,
> RESUMING etc. It is never held when calling any of our rpm callbacks, so it
> should never factor in to xe_pm_runtime_lockdep_map.
> 
> The overall thing should look like this:
> 
> xe_rpm_get:
>     lock_map_acquire(&xe_pm_runtime_lockdep_map);
>     lock_map_release(&xe_pm_runtime_lockdep_map);
>     .....
>     RPM core grabs dev->power.lock
> 
> rpm resume callback: (RPM has dropped dev->power.lock)

                       ^ this is exactly the problem.
RPM doesn't drop the dev->power.lock while the callback
is called. it relaxes while waiting for other transaction
to finish, but it is hold by the time it gets to the callback.

>     lock_map_acquire(&xe_pm_runtime_lockdep_map);
>     ....do resume stuff
>     lock_map_release(&xe_pm_runtime_lockdep_map);
> 
> rpm suspend callback: (RPM has dropped dev->power.lock)
>     lock_map_acquire(&xe_pm_runtime_lockdep_map);
>     .....do suspend stuff
>     lock_map_release(&xe_pm_runtime_lockdep_map);
> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 55 --------------------------------------
> >   1 file changed, 55 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 86bf225dba02..f49e449d9fb7 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -67,12 +67,6 @@
> >    */
> > -#ifdef CONFIG_LOCKDEP
> > -struct lockdep_map xe_pm_runtime_lockdep_map = {
> > -	.name = "xe_pm_runtime_lockdep_map"
> > -};
> > -#endif
> > -
> >   /**
> >    * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
> >    * @xe: xe device instance
> > @@ -291,29 +285,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >   	/* Disable access_ongoing asserts and prevent recursive pm calls */
> >   	xe_pm_write_callback_task(xe, current);
> > -	/*
> > -	 * The actual xe_pm_runtime_put() is always async underneath, so
> > -	 * exactly where that is called should makes no difference to us. However
> > -	 * we still need to be very careful with the locks that this callback
> > -	 * acquires and the locks that are acquired and held by any callers of
> > -	 * xe_runtime_pm_get(). We already have the matching annotation
> > -	 * on that side, but we also need it here. For example lockdep should be
> > -	 * able to tell us if the following scenario is in theory possible:
> > -	 *
> > -	 * CPU0                          | CPU1 (kworker)
> > -	 * lock(A)                       |
> > -	 *                               | xe_pm_runtime_suspend()
> > -	 *                               |      lock(A)
> > -	 * xe_pm_runtime_get()           |
> > -	 *
> > -	 * This will clearly deadlock since rpm core needs to wait for
> > -	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
> > -	 * on CPU0 which prevents CPU1 making forward progress.  With the
> > -	 * annotation here and in xe_pm_runtime_get() lockdep will see
> > -	 * the potential lock inversion and give us a nice splat.
> > -	 */
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > -
> >   	/*
> >   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> >   	 * also checks and delets bo entry from user fault list.
> > @@ -341,7 +312,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >   	if (xe->d3cold.allowed)
> >   		xe_display_pm_runtime_suspend(xe);
> >   out:
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> >   	xe_pm_write_callback_task(xe, NULL);
> >   	return err;
> >   }
> > @@ -361,8 +331,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   	/* Disable access_ongoing asserts and prevent recursive pm calls */
> >   	xe_pm_write_callback_task(xe, current);
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > -
> >   	/*
> >   	 * It can be possible that xe has allowed d3cold but other pcie devices
> >   	 * in gfx card soc would have blocked d3cold, therefore card has not
> > @@ -400,31 +368,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   			goto out;
> >   	}
> >   out:
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> >   	xe_pm_write_callback_task(xe, NULL);
> >   	return err;
> >   }
> > -/*
> > - * For places where resume is synchronous it can be quite easy to deadlock
> > - * if we are not careful. Also in practice it might be quite timing
> > - * sensitive to ever see the 0 -> 1 transition with the callers locks
> > - * held, so deadlocks might exist but are hard for lockdep to ever see.
> > - * With this in mind, help lockdep learn about the potentially scary
> > - * stuff that can happen inside the runtime_resume callback by acquiring
> > - * a dummy lock (it doesn't protect anything and gets compiled out on
> > - * non-debug builds).  Lockdep then only needs to see the
> > - * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
> > - * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
> > - * For example if the (callers_locks) are ever grabbed in the
> > - * runtime_resume callback, lockdep should give us a nice splat.
> > - */
> > -static void pm_runtime_lockdep_training(void)
> > -{
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > -}
> > -
> >   /**
> >    * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
> >    * @xe: xe device instance
> > @@ -436,7 +383,6 @@ void xe_pm_runtime_get(struct xe_device *xe)
> >   	if (xe_pm_read_callback_task(xe) == current)
> >   		return;
> > -	pm_runtime_lockdep_training();
> >   	pm_runtime_resume(xe->drm.dev);
> >   }
> > @@ -466,7 +412,6 @@ int xe_pm_runtime_get_sync(struct xe_device *xe)
> >   	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
> >   		return -ELOOP;
> > -	pm_runtime_lockdep_training();
> >   	return pm_runtime_get_sync(xe->drm.dev);
> >   }
