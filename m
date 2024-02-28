Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC550C5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 16:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8C910E5C0;
	Wed, 28 Feb 2024 16:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAJ1yFMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84D010E22E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 16:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709139243; x=1740675243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bx4/LIUATuwYwUdMdYX1Fwenap/gtbkr68zLuWLer+k=;
 b=iAJ1yFMdzdffBSOcTrH7c1Ab8YpJk3I/SVKktf7QxAkSrTlbrEOXjgwN
 omdep79CDYPmxlh1mv+j1Of/MZfKqfHTT1oMo1ERfUD1jzidifxI0juwH
 1rGZMI6spPMz+3kIdIkvd1Xw2thUj9Nf/UAPAmu1cTpzxerYQ+v6bvFi6
 G711j+8Xg9VVZLFFdeOsAGkgiNpLbnLcUCDcNNem7PurLy2je/mHEOI4H
 vlSzQj2Q0TeiwPc9KR2Q4guLVenqOxQEXftApvVD/D/AYhWS3D9F/6RWA
 kYT7UP7l+2ZlN3dEpxywDOe3r5fdtUuJfL/ybXXwnBoZ4L9xIz9GID0yn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="4125341"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="4125341"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:54:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7356507"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 08:54:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 08:54:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 08:54:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 08:54:01 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 08:54:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgmRevnd8wQaMKqhwl4ZiYMv9oPKfHzDvX2hddXJtvNVmYBGMF5JPRtBYrWrBuJeWRQ9mqzf2KsHCs6FsvQ3SbHVzA7KMpX+uZ01VsRIXgl1NVEsIqLq3zLMSBvdldsG/Vmoeb2AY3YfkSdmRNoscA+2K56zl8MSs4qQvAfL3vnBZzbNGcMPeSm8OmsS2mZizcq0Xf7afAFrVKxs0Y3TO/jjySJXJv8CWY7raHKh+9eS7lvxCBN/Pp2PpJVQu+7cM0WeBAy8yC34ZK12OM/2iT3D0D1MExEN7C3081UmneJgbD+kT03t9Rqb9ILIoUgCmta5TmzXzQDOoE63LMkMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjH7nQUDoLcO+Gyb6OFf4m47/JBaOTJqKW8nWbZa9S0=;
 b=jn0m0ymu+73wQCR5Ig4CdS0H9WqNcW404JjSYoIEVmlv/SDmKTg1av19JEsS/podVgAU1E32ST+30zQKujLdxbV93q2mzM0tmlTprOyaCi+6fdkegXv/d5nLGr+scKogGFj9GNLiEd4gND7H/iXrN8GsMnwDNYhAQz38QGOHSVCHQds+v4FTE1pJTNN9aKFk+0xC4/WSLofdia/uEwmMpstsaL1v2kWCcOu59roU9cVeVprxJ+qLtIh69xr7jCXKP/wcEWrDC0wLH9Ixd/ajvR8yLdXfh29pXugDJ8nQ3ez9o+ZYKcDnMD6mANZsMmW4XcZzubwdnzerh7HGN1RprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Wed, 28 Feb
 2024 16:53:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 16:53:58 +0000
Date: Wed, 28 Feb 2024 11:53:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 19/34] drm/xe: Remove pm_runtime lockdep
Message-ID: <Zd9lIpXTTZS8fVxp@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-20-rodrigo.vivi@intel.com>
 <fc63da97-8aee-4027-a723-723ef7ac9567@intel.com>
 <Zc6UlCthcR61eI4y@intel.com>
 <d80b30a4-cdc0-467e-9f8a-6ee6fdcb056a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d80b30a4-cdc0-467e-9f8a-6ee6fdcb056a@intel.com>
X-ClientProxiedBy: SJ0PR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:332::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 006519a2-cfb4-4050-1617-08dc387ddb48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/hen4/rAw8f0ylixYTGiKmUmoDkih5Oqq53pQjmwU3rwY0CyLRAunUzuoy3rbKC6SBH1hJw3R5kuy0GvWQ2TGkEiQA1Ryktg4CJhVH91BpqDUnWh11l43nz+8jnoGoJd1kbfXh0sYKMwrEBONcoOTzpQGcbU5lhNDjMdA3Mzp0NfBRtXEvUpCvllpBY5569oaedlsmuPnj1cth/UDYudr2AO64gtIv2JjyRCRn0201LB12VEqUlwg1BQXYh4ihpQRfbBxMSk8/tIiMz9LoqMYxw3N4DTqNfbkF7hq10BywAl19YmrD6cxeaYTjEJveWzYGvIheN6TVd393qFxt5IKrsgv2IVgy+r03F1nvty2T8u119q1w9B4RpPGdY1RPY44viGkd4nXl2PrTPdPZmXmgg3OeVxzbt/1sOc6ASF2EMLjdgwp94M/s0L/P2dhkvxUGQNwilrVYKGkezZPz+YLfZ6xErRlQXMchBaoyo6idKwZF4z7HfCMNQeXLa3KE+XlxXoEzs+7R9kpsUFW7vuW1wTbmv3r3deAnBySwc0+uhygeC4/5rsOCT6BQgrA/Y/rzpaet2ffZMQU7cG1B034f338IBnSx2GjUDp7/Z7f3tDKkMhIjT2Us2LLzKEglS27eNs2p3iZr0Xk04/DxvMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mO6JcoloEAmcqOf2xtijba1NZidZHOH+Wx3RK2eFzwtcoCeBODIYcwDgkLIG?=
 =?us-ascii?Q?I00EmKnytLnP/xFySqHpsv+TEHFN1jhyPlPmB97WCoVls62uJoKBm/VmZVc4?=
 =?us-ascii?Q?300bKVtgy++qERcRKdvDVsKKdJWCiTG8XExrmI5Ii5uegSuML46aKLEmdCYL?=
 =?us-ascii?Q?3t6VzjdmdPCJySre38TdBm7jIpenF5RnwdPq4MiwZSQK6GgOzuE3+pJWNP0m?=
 =?us-ascii?Q?CAY6vtK5UN3C2RfL66ZddrjPpu4jvntZ+a7GViQducdOD+H7xivLNVLxTeEE?=
 =?us-ascii?Q?/eOEQwEtbwoC3p/1upTQJ88WtWIbzmAYYculpW9SJHTVYwTx5xK/THZ9kVzh?=
 =?us-ascii?Q?8nUpfdqx9vamHKdKYwczifPgt7dsoS/AUmfdymLa74/0SA8J6Q9Owb7ESOXN?=
 =?us-ascii?Q?5zVF+QEVPTfNe9uE590+03Sfx1xK0zTwsNmFrO9lW1nixxFZI/DDNRzgq1p/?=
 =?us-ascii?Q?aFRPyCH5khQLxSXm7pPE3hZ4VGvlfRkxaDBaSe4LwxWWxF5uNHWT2VhzzIvt?=
 =?us-ascii?Q?YnrhMTOZf7lpV3yRs2Btb3X107HDJNZ2VynscD5kKW+AcctK5hQudd0NXV5W?=
 =?us-ascii?Q?/XfkuW84Ddh9S8c3XSVvLNdjaOW0c5pIBD8RRu3MG0kBiUJZARLBlbz2KgAW?=
 =?us-ascii?Q?//96c3btdClvfZtDtygp42xJ0l8j48/218rzDEkOsYmllyaYFj6/eq0urWMP?=
 =?us-ascii?Q?S+nBI0rWo9ZOo3RgTh9srmSFgFT/XBzBWuSjhyKLeAiSMVVRFR4Z7o5pgaSf?=
 =?us-ascii?Q?c6OaaO37mX1ohWzP+SyVSmim5zrPbVEsRQr2KNmYdSPCe1bLtH8q0EWm2Ecm?=
 =?us-ascii?Q?1JqV0ymmZ19u84zOdtZ+k6GUw56uPifU1u3xT8WYskGZxG87CLEBoycUoc8O?=
 =?us-ascii?Q?QuodMZgJeuLcu0zGslihKoalrhR+qOlIT/KuQVNkNpkYnaGD/DuJNpfct/uh?=
 =?us-ascii?Q?frVneuZJB9MHGTR2osCfV2MF4aoP33Do5BgmZZQs8Iyj79e0XxA0DO3QUW5F?=
 =?us-ascii?Q?N+FyZ6lT3PFhr+VdKXx3zhvK1mUzJGhKWPzr5UNcHrN0W0mlLTXrnZCEFDPU?=
 =?us-ascii?Q?+kCpstOKWvgpt3yFrglCq4jC43XWOKQLDOaQw8KlMN5RYzfKLqkdPwDWf3em?=
 =?us-ascii?Q?4iU6g4p5M9ehn3nZO2fg+lDVWFg9zT4y//H7nXXoGhN7OVDycm62zrewPwid?=
 =?us-ascii?Q?12TWHg3VKgZFNa3KyDknIGHVV8i9VBoeySJK8VmzDRMgLGDVte0uKGJwRbWw?=
 =?us-ascii?Q?zOtlTVGurZu7F+XSpi0iMJV0O2uqpT7a6fI0nh6Wi5RtR/5eskZWMpVzl79V?=
 =?us-ascii?Q?N96FszszNXfLGCa8UjWXMFPS0Y+escLVzAZs7Iidf+hbXwVADhUBm6ZPbfBP?=
 =?us-ascii?Q?31OXS7hp7osjBFjddHVmSdulC0bvdoY78VMSyrbfshP8q2Z/iYdJAxByPM2F?=
 =?us-ascii?Q?amaEJvYCDZkZEnXC7Sr7/89eQnwmMltr3aI64UDuPornZVLhto/cqo/BLSu2?=
 =?us-ascii?Q?kec5XzLKFIwQnCH2g6Xd4oPh1J/kOyPBnQAZgnl7HD+gJdfJNGvzz4HPpsqQ?=
 =?us-ascii?Q?jn8qE9Su2n/Jn6zSH/qRIi7HjhZm/Vu5u5DbMQ5m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 006519a2-cfb4-4050-1617-08dc387ddb48
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 16:53:58.4847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AguhcxkjI/VVY+jhR8bKOaK3wxBky7t6WVc0FJhB4LjsNudm40Tg/9KnHipgvMRdyI8yfaiXUCxc20PZXZ/NAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
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

On Tue, Feb 20, 2024 at 05:48:44PM +0000, Matthew Auld wrote:
> On 15/02/2024 22:47, Rodrigo Vivi wrote:
> > On Mon, Feb 05, 2024 at 11:54:45AM +0000, Matthew Auld wrote:
> > > On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > > > This lockdep was initially designed for the mem_access,
> > > > where the mem_access needed to run the resume sync from
> > > > the innerbounds and count the references.
> > > > 
> > > > With the runtime moving to the outer bounds of the driver
> > > > and the mem_access replaced by the pure rpm get/put
> > > > references, it is no longer needed and it is in a matter
> > > 
> > > We are also calling it in workers like invalidation_fence_work_func(),
> > > xe_sched_process_msg_work() etc. It is still quite easy to deadlock with
> > > that.
> > > 
> > > > of fact just splatting may false positives as the following:
> > > 
> > > Yeah, calling invalidation_fence_work_func() directly in the callers context
> > > is a false positive since ioctl has the rpm ref. But what about calling that
> > > in the async case where invalidation_fence_work_func() is only called when
> > > the in-fence signals? We are sure that is safe? It should be simple to fix
> > > the false positive here, no? If we just delete all the annotations we get
> > > zero help from lockdep for the more complicated cases. Also IIRC lockdep
> > > doesn't show you every splat once it triggers once, so who knows what else
> > > is lurking and whether that is also false positive?
> > > 
> > > > 
> > > >                  -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> > > > [  384.778761]        xe_pm_runtime_get+0xa3/0x100 [xe]
> > > > [  384.783871]        invalidation_fence_work_func+0x7f/0x2b0 [xe]
> > > > [  384.789942]        invalidation_fence_init+0x8c2/0xce0 [xe]
> > > > [  384.795671]        __xe_pt_unbind_vma+0x4a7/0x1be0 [xe]
> > > > [  384.801050]        xe_vm_unbind+0x22f/0xc70 [xe]
> > > > [  384.805821]        __xe_vma_op_execute+0xc67/0x1af0 [xe]
> > > > [  384.811286]        xe_vm_bind_ioctl+0x3a36/0x66c0 [xe]
> > > > [  384.816579]        drm_ioctl_kernel+0x14a/0x2c0
> > > > [  384.821132]        drm_ioctl+0x4c6/0xab0
> > > > [  384.825073]        xe_drm_ioctl+0xa1/0xe0 [xe]
> > > > [  384.829651]        __x64_sys_ioctl+0x130/0x1a0
> > > > [  384.834115]        do_syscall_64+0x5c/0xe0
> > > > [  384.838232]        entry_SYSCALL_64_after_hwframe+0x6e/0x76
> > > > [  384.843829]
> > > >                  -> #0 (reservation_ww_class_mutex){+.+.}-{4:4}:
> > > > [  384.850911]        __lock_acquire+0x3261/0x6330
> > > > [  384.855462]        lock_acquire+0x19b/0x4d0
> > > > [  384.859666]        __ww_mutex_lock.constprop.0+0x1d8/0x3500
> > > > [  384.865263]        ww_mutex_lock+0x38/0x150
> > > > [  384.869465]        xe_bo_lock+0x41/0x70 [xe]
> > > > [  384.873869]        xe_bo_evict_all+0x7ad/0xa40 [xe]
> > > > [  384.878883]        xe_pm_runtime_suspend+0x297/0x340 [xe]
> > > > [  384.884431]        xe_pci_runtime_suspend+0x3b/0x1e0 [xe]
> > > > [  384.889975]        pci_pm_runtime_suspend+0x168/0x540
> > > > [  384.895052]        __rpm_callback+0xa9/0x390
> > > > [  384.899343]        rpm_callback+0x1aa/0x210
> > > > [  384.903543]        rpm_suspend+0x2ea/0x14c0
> > > > [  384.907746]        pm_runtime_work+0x133/0x170
> > > > [  384.912213]        process_one_work+0x73b/0x1230
> > > > [  384.916853]        worker_thread+0x726/0x1320
> > > > [  384.921237]        kthread+0x2ee/0x3d0
> > > > [  384.925005]        ret_from_fork+0x2d/0x70
> > > > [  384.929120]        ret_from_fork_asm+0x1b/0x30
> > > > [  384.933585]
> > > >                  other info that might help us debug this:
> > > > 
> > > > [  384.941625]  Possible unsafe locking scenario:
> > > > 
> > > > [  384.947572]        CPU0                    CPU1
> > > > [  384.952123]        ----                    ----
> > > > [  384.956676]   lock(xe_pm_runtime_lockdep_map);
> > > > [  384.961140]                                lock(reservation_ww_class_mutex);
> > > > [  384.968220]                                lock(xe_pm_runtime_lockdep_map);
> > > > [  384.975214]   lock(reservation_ww_class_mutex);
> > > > [  384.979765]
> > > >                   *** DEADLOCK ***
> > > > 
> > > > In a matter of fact, there's actually a third lock that is not
> > > > in this picture:
> > > > spin_lock_irq(&dev->power.lock);
> > > > and INIT_WORK(&dev->power.work, pm_runtime_work);
> > > > 
> > > > The pm_callback_task will ensure that there's no recursive
> > > > calls of the resume function and it will increase the
> > > > reference counter anyway.
> > > > 
> > > > Then, the pm_runtime workqueue and spin locks will avoid that
> > > > any resume and suspend operations happens in parallel with
> > > > other resume and suspend operations.
> > > > 
> > > > With that, the only thing that we are actually doing here is
> > > > to wrongly train the lockdep, basically saying that we will
> > > > acquire some locks on resume and on suspend concurrently,
> > > > entirely ignoring its serialization and protection.
> > > > 
> > > > The above scenario is simply not possible because there's
> > > > a serialization with the spin_lock_irq(&dev->power.lock)
> > > > before each operation. However we are telling the lockep
> > > > that the lock(xe_pm_runtime_lockdep_map) occurs before
> > > > the &dev->power.lock and lockdep is not capable to see
> > > > that other protection.
> > > 
> > > Can you share some more info here? AFAIK dev->power.lock is an RPM core lock
> > > that protects internal state like transitioning between ACTIVE, SUSPENDING,
> > > RESUMING etc. It is never held when calling any of our rpm callbacks, so it
> > > should never factor in to xe_pm_runtime_lockdep_map.
> > > 
> > > The overall thing should look like this:
> > > 
> > > xe_rpm_get:
> > >      lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > >      lock_map_release(&xe_pm_runtime_lockdep_map);
> > >      .....
> > >      RPM core grabs dev->power.lock
> > > 
> > > rpm resume callback: (RPM has dropped dev->power.lock)
> > 
> >                         ^ this is exactly the problem.
> > RPM doesn't drop the dev->power.lock while the callback
> > is called. it relaxes while waiting for other transaction
> > to finish, but it is hold by the time it gets to the callback.
> 
> AFAICT it is never held from the context that is calling the resume or
> suspend callback (spinlock would be very limiting otherwise), and it ofc
> can't be held while sleeping, like when "waiting for other transactions".
> Note that the "waiting for other transactions" thing is exactly what lockdep
> doesn't understand by itself (there are no annotations for waitqueue AFAIK),
> which is part of what the xe_pm annotations here help with...

hmm, you are absolutely right.
the rpm_callback gives the impression that its call is in between locked
spin locks, but if that was indeed the case our current mutex_lock
in the get function would fail badly.

Let's try to move without this patch and work on the false positives
separate.

> 
> > 
> > >      lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > >      ....do resume stuff
> > >      lock_map_release(&xe_pm_runtime_lockdep_map);
> > > 
> > > rpm suspend callback: (RPM has dropped dev->power.lock)
> > >      lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > >      .....do suspend stuff
> > >      lock_map_release(&xe_pm_runtime_lockdep_map);
> > > 
> > > > 
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_pm.c | 55 --------------------------------------
> > > >    1 file changed, 55 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 86bf225dba02..f49e449d9fb7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -67,12 +67,6 @@
> > > >     */
> > > > -#ifdef CONFIG_LOCKDEP
> > > > -struct lockdep_map xe_pm_runtime_lockdep_map = {
> > > > -	.name = "xe_pm_runtime_lockdep_map"
> > > > -};
> > > > -#endif
> > > > -
> > > >    /**
> > > >     * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
> > > >     * @xe: xe device instance
> > > > @@ -291,29 +285,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > > >    	/* Disable access_ongoing asserts and prevent recursive pm calls */
> > > >    	xe_pm_write_callback_task(xe, current);
> > > > -	/*
> > > > -	 * The actual xe_pm_runtime_put() is always async underneath, so
> > > > -	 * exactly where that is called should makes no difference to us. However
> > > > -	 * we still need to be very careful with the locks that this callback
> > > > -	 * acquires and the locks that are acquired and held by any callers of
> > > > -	 * xe_runtime_pm_get(). We already have the matching annotation
> > > > -	 * on that side, but we also need it here. For example lockdep should be
> > > > -	 * able to tell us if the following scenario is in theory possible:
> > > > -	 *
> > > > -	 * CPU0                          | CPU1 (kworker)
> > > > -	 * lock(A)                       |
> > > > -	 *                               | xe_pm_runtime_suspend()
> > > > -	 *                               |      lock(A)
> > > > -	 * xe_pm_runtime_get()           |
> > > > -	 *
> > > > -	 * This will clearly deadlock since rpm core needs to wait for
> > > > -	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
> > > > -	 * on CPU0 which prevents CPU1 making forward progress.  With the
> > > > -	 * annotation here and in xe_pm_runtime_get() lockdep will see
> > > > -	 * the potential lock inversion and give us a nice splat.
> > > > -	 */
> > > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > > -
> > > >    	/*
> > > >    	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> > > >    	 * also checks and delets bo entry from user fault list.
> > > > @@ -341,7 +312,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > > >    	if (xe->d3cold.allowed)
> > > >    		xe_display_pm_runtime_suspend(xe);
> > > >    out:
> > > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > >    	xe_pm_write_callback_task(xe, NULL);
> > > >    	return err;
> > > >    }
> > > > @@ -361,8 +331,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >    	/* Disable access_ongoing asserts and prevent recursive pm calls */
> > > >    	xe_pm_write_callback_task(xe, current);
> > > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > > -
> > > >    	/*
> > > >    	 * It can be possible that xe has allowed d3cold but other pcie devices
> > > >    	 * in gfx card soc would have blocked d3cold, therefore card has not
> > > > @@ -400,31 +368,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >    			goto out;
> > > >    	}
> > > >    out:
> > > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > >    	xe_pm_write_callback_task(xe, NULL);
> > > >    	return err;
> > > >    }
> > > > -/*
> > > > - * For places where resume is synchronous it can be quite easy to deadlock
> > > > - * if we are not careful. Also in practice it might be quite timing
> > > > - * sensitive to ever see the 0 -> 1 transition with the callers locks
> > > > - * held, so deadlocks might exist but are hard for lockdep to ever see.
> > > > - * With this in mind, help lockdep learn about the potentially scary
> > > > - * stuff that can happen inside the runtime_resume callback by acquiring
> > > > - * a dummy lock (it doesn't protect anything and gets compiled out on
> > > > - * non-debug builds).  Lockdep then only needs to see the
> > > > - * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
> > > > - * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
> > > > - * For example if the (callers_locks) are ever grabbed in the
> > > > - * runtime_resume callback, lockdep should give us a nice splat.
> > > > - */
> > > > -static void pm_runtime_lockdep_training(void)
> > > > -{
> > > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > > -}
> > > > -
> > > >    /**
> > > >     * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
> > > >     * @xe: xe device instance
> > > > @@ -436,7 +383,6 @@ void xe_pm_runtime_get(struct xe_device *xe)
> > > >    	if (xe_pm_read_callback_task(xe) == current)
> > > >    		return;
> > > > -	pm_runtime_lockdep_training();
> > > >    	pm_runtime_resume(xe->drm.dev);
> > > >    }
> > > > @@ -466,7 +412,6 @@ int xe_pm_runtime_get_sync(struct xe_device *xe)
> > > >    	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
> > > >    		return -ELOOP;
> > > > -	pm_runtime_lockdep_training();
> > > >    	return pm_runtime_get_sync(xe->drm.dev);
> > > >    }
