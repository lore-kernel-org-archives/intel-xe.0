Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5A9C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 23:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7CC10EAB2;
	Fri, 15 Dec 2023 23:04:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F41C10EAB2
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 23:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702681473; x=1734217473;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TV0R73LZF5FWRo8kaRIlXwyOWQ+EiQs8INwtzK1sIP4=;
 b=mVEM8cHsfKZ0jKY367ZiLdy4BA8LLp5QeFSMdixhMUtnLdcRqnmPd/zl
 0PziPBQeekV6sM0+JXAtKgQ4y/ttXdhO79mE0p6KL+VNHLkfb16ikIyfv
 bdS6Rg35zguVrv7HD2zS6yq+gs3PoEjboaGLATsgxwsH/tZ1Qj+QnX9V2
 CgsC5XOBDztsUMBhodLYuNcw7WN3eiCCyerHf/WX/RPd6C0l2yacNm7TU
 uqalmu6lqa8oNVh6IQODaz2HDQtGqE1iHA4p0OqD8lahBsbQvMG5xwfDA
 UtbFcYf7Ywl8BTwpRApAlQUZYomWJ/jDzYSrz0qczGofNEdUyqR2JGzTo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2514140"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2514140"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 15:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="845271916"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="845271916"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 15:04:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 15:04:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 15:04:31 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 15:04:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWgnhOhb9fcgEsBobKCtDowtf1iMj4Op+1+6gpag6lkgkboA8I6fMjScnUQjCWDiuMcLch2jh5aWmgJ2/t89H5Jujsw2QCUPAWSF7Vl8Mdhn2ozs/dKacM5YWswfp20sykfr9Nre0TuMvQgpIsfMQDaXM/JqjQy6djdydt6gQv56ILSJdbwUjZ5Z0lheG+YdtqGIwcDcJP82w4YhlBz3YxXLUBo1nQxP+wkgIsdgIrLPubtJB20eDilZmCn7dWcYt4YLBrsiWruGI7Q/389QjpfEldUamJIj2CVoAi14k2kA87AAcxT+ctN9GLKenAqW7xu5cegmASQ22M15ye+REA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7O9QgR5odx/OJLd6MEqD6vobFcb86/V/IYzMvqLLXug=;
 b=K1xkbas1uax/jkAf7v9uZW1gEXUSs+2YYqK5lwh5Kied28vrZx7vbqH6BG/NzwAKDPcMQy1Q6nlgvpaqnO+XBJ8qe8e8sn6k2J1OQyUusubdQmaimhr7VYSP0A5abTR3OWleQgB1IYqShXc4QbLDYk4mCHwnj4qOV/eM1c2/x09TxPl3FieWU0Wivq3v/AfUgTjQU61t633eGuODTHyIKohDJjdKPJOAD9NqW06qe3PZLZ/EbMcY5tddI9ehRsytfKB8TSmLDY0Qfag8pdb6WbMeC1ldKLgf2E7PiX6T9JnWOL5QLIF8C0Zb3pO+XZMCiukOzLgFMRwao443sJQMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 23:04:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 23:04:29 +0000
Date: Fri, 15 Dec 2023 17:04:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN splat in add_preempt_fences()
Message-ID: <etamtz3sxlguma3xtn2d7v3njv5qdxwwiz3ttb7czp3t4prgce@zgf7db7qv6km>
References: <20231215211245.718686-1-matthew.brost@intel.com>
 <ZXzFWbt8LTgDOHG7@intel.com>
 <ZXzZaFIlaSXO2JfM@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZXzZaFIlaSXO2JfM@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: cdee87fb-4eb3-4f0e-bb18-08dbfdc230de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13bHXJqQo9g53b6MQPrWTHOPhtMV49kf7y5IIoBogFusj8VDSkDHAF8mTgHKdTGRx6J9sKIzuuOgn5HXGgDVI50R/jagmg8t8u87prdJTt8Sgr6T77n23JZrVl6d4obTr0Tt9455KZf8Z6qc6j5TAKaRM7lL4RgG7WcGAymoLHovQcc8Z1gOW1poxpUU4zJRyDzgKfy/ToL7Z6AxFjzy7gSKXjjbmRq63tv/ZczFjiu4sJcf++3DqrDUhtnqqxd8zISOkGb0LwMDm/w6QALZuecdv1E2+wZoZOMtmeDLLVw0Kr8Z8OZIuTyIpHSjutOnT/m5zVVrqAJMHgkOxaKD77wLr2hgh47AKYd6ZdhtS3EYF5sRv3HpRr0D+SRhOgwh6Z0jvv9Wyu2C82EhdmbYns3eFqQlo97X7v4wPrcwuKkbj4YoampSTA/VmNlCFSsh8sPoqrPfmmrDYKHsXauAY+F4IdLUUVWQ1IkRWN2ONjeH7717MgpIVO67zRpcFIJ3WwxCGwmPMthf5Od5V93BpPWbZuAOZjzWpncWq5tUuLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(366004)(39860400002)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(9686003)(33716001)(6512007)(26005)(38100700002)(8676002)(4326008)(6862004)(8936002)(316002)(966005)(2906002)(6486002)(5660300002)(478600001)(6506007)(66946007)(6666004)(66476007)(66556008)(6636002)(41300700001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/kxiVJXeQd9avwKa2x7VwfxQg6Ez60jWf7Q1rLY4kIPgKG0JejhJqtZpdTLm?=
 =?us-ascii?Q?vtTy5rHrURzkPa0UxtnbdgOPpmBSx0DAS5pVfJqWYt7pOUerx9vUmrFhUhyn?=
 =?us-ascii?Q?lC2zXXBHHYxLoPblGo15mO5a84fF1t+4k0+5/b3zW6QtJIAxFfLeEkXtRWLY?=
 =?us-ascii?Q?KpxjHzW+vcNnQtmWNxYcKLQBihlNyKCpq+abkv7xSepXuy8Q8b/2Pz8+pcRt?=
 =?us-ascii?Q?a2m8X0ClT5vk5P8goHNP+qDp6tCzndFhNob40oxzIrXDlb17guOTtrYyUKm7?=
 =?us-ascii?Q?ayMYnR2YWBEbbdwIO6hx1XfSlAD32bS8Paw4+UnTHPIiQb95q8XLJ//wH7pb?=
 =?us-ascii?Q?ucsyEs57mOyfNcNYaKQRrxI53YeywoivvYdEC4iSiXJ7jlOQI/aYBycIk0PU?=
 =?us-ascii?Q?HOBi720lLbARbVViuRZPZm20j4QF5SHmiJmAMzgZd+Rej6+SnO4TKw+NEv0U?=
 =?us-ascii?Q?iv4vT2XLqZAw5kizsqx6vyEGY3FnPMnmPp0HxOWvkKBAoIF9qIIEDsEslOKK?=
 =?us-ascii?Q?C1OLYcI/0463HgPjg9ZVTpn3CRklaKB84R+lcFzgpir0cCBr481Q6rb0Aiq9?=
 =?us-ascii?Q?Y9KTmI3vXGN4c/62godbTJtspzkk6KM56fyuk+pKKFnm/Gbv3Q7sQ79pzj1F?=
 =?us-ascii?Q?kM9NjM2JKC9gFf1rnC0sxMfUYY241zM8FPJAPnKFHb0oLDfPvC8BPU/nOTDQ?=
 =?us-ascii?Q?TAiWlqA+AfwKHn2whhgbNFsebJJ/89kbzqReXsFfij8aX81LeKivnGv/4kWh?=
 =?us-ascii?Q?Cn4dMLGZPE3QwGQJkQfs5MH51mYaKUJV/S2TxIAsGmQDirjPGYyValyrKz/7?=
 =?us-ascii?Q?uZh3+UTmghSTFKXja4EN5FoSa36Lh63R1pTAT8WsiiMQBywZbAFYAVpdAMv2?=
 =?us-ascii?Q?OPLGDFkHp+magfaCYl1CbDMfBHrsMK4BijhqzRWiICGah7xtZAyNx2srq9En?=
 =?us-ascii?Q?gDGOPe4F2JEoJcHkw4Cx3D7Xtanm4n9/pWm+ntkDooc4XNLp+6HsrPIheBAC?=
 =?us-ascii?Q?Ps7yz0n5i2ozT6BlKyibRuIeJAvbbAzRJZlCPI0CiEgKwUKWE2T2iaK3XdLl?=
 =?us-ascii?Q?oCnz9qoJezev+si3GReyG0NdxwP19NONGAlZFz8eikbD+e8qziTII4x89RCI?=
 =?us-ascii?Q?y11ahjUdfBRN3HH4wUfw/ywW16I12voKGjD6WLXVg9VDdy13KGZxuQn3vnxZ?=
 =?us-ascii?Q?JPzV/lR+Y5jJj77lJFtibvt9Pl3H0qFbJsJmTzpBoIxvmK8qoFvtSo0/6UWL?=
 =?us-ascii?Q?xv1HoEKfU7yQQBfFQ1fQ8AsEOnXZhx48phMOxnuV7p/mCnjDyZdC0WL7voN1?=
 =?us-ascii?Q?A0CyNNCHjZEw6vOn4l94bGxeAe7o67YjNZV+fYBwrS4n9ndmqOL+smvyv/S1?=
 =?us-ascii?Q?rEg7eHf1VlYw6Fmzy8xpenJFhXY2dpCIvuR3tZ6JloRIhtUmwPWJiEwfKFWt?=
 =?us-ascii?Q?E6GdHWhxnGuUkwa9Jzg/vtxiIeYcuIUHWmeEoG2MWIsbzzBIOvk6D+bEsqJI?=
 =?us-ascii?Q?ST+hvOKeCYnYT6ieqSoCMFx/BgYFuRemBiwuim65q1xWFdEXWjG7tlzfk75z?=
 =?us-ascii?Q?cGibOJ8BUZHxcv05u9GpvsZzMyf1zIFZIIow2GRVrHUharbwtK3gQLqz+/lO?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdee87fb-4eb3-4f0e-bb18-08dbfdc230de
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 23:04:28.9975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d32FoUiaFlyyqYEBbvFrPi4P5LA62QSdaFeJAgttlDcZp5oF5RY1cDgxpjLVgvc4HhJwj6YDPFUemTYxYshhVwVgiEZxlrUAgRO1LYpFrrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 10:55:36PM +0000, Matthew Brost wrote:
>On Fri, Dec 15, 2023 at 04:30:01PM -0500, Rodrigo Vivi wrote:
>> On Fri, Dec 15, 2023 at 01:12:45PM -0800, Matthew Brost wrote:
>> > add_preempt_fences() calls dma_resv_reserve_fences() with num_fences ==
>> > 0 resulting in the below UBSAN splat. Short circuit add_preempt_fences()
>> > if num_fences == 0.
>> >
>> > [   58.652241] ================================================================================
>> > [   58.660736] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
>> > [   58.667281] shift exponent 64 is too large for 64-bit type 'long unsigned int'
>> > [   58.674539] CPU: 2 PID: 1170 Comm: xe_gpgpu_fill Not tainted 6.6.0-rc3-guc+ #630
>> > [   58.674545] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
>> > [   58.674547] Call Trace:
>> > [   58.674548]  <TASK>
>> > [   58.674550]  dump_stack_lvl+0x92/0xb0
>> > [   58.674555]  __ubsan_handle_shift_out_of_bounds+0x15a/0x300
>> > [   58.674559]  ? rcu_is_watching+0x12/0x60
>> > [   58.674564]  ? software_resume+0x141/0x210
>> > [   58.674575]  ? new_vma+0x44b/0x600 [xe]
>> > [   58.674606]  dma_resv_reserve_fences.cold+0x40/0x66
>> > [   58.674612]  new_vma+0x4b3/0x600 [xe]
>> > [   58.674638]  xe_vm_bind_ioctl+0xffd/0x1e00 [xe]
>> > [   58.674663]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>> > [   58.674680]  drm_ioctl_kernel+0xc1/0x170
>> > [   58.674686]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>> > [   58.674703]  drm_ioctl+0x247/0x4c0
>> > [   58.674709]  ? find_held_lock+0x2b/0x80
>> > [   58.674716]  __x64_sys_ioctl+0x8c/0xb0
>> > [   58.674720]  do_syscall_64+0x3c/0x90
>> > [   58.674723]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>> > [   58.674727] RIP: 0033:0x7fce4bd1aaff
>> > [   58.674730] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
>> > [   58.674731] RSP: 002b:00007ffc57434050 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> > [   58.674734] RAX: ffffffffffffffda RBX: 00007ffc574340e0 RCX: 00007fce4bd1aaff
>> > [   58.674736] RDX: 00007ffc574340e0 RSI: 0000000040886445 RDI: 0000000000000003
>> > [   58.674737] RBP: 0000000040886445 R08: 0000000000000002 R09: 00007ffc574341b0
>> > [   58.674739] R10: 000055de43eb3780 R11: 0000000000000246 R12: 00007ffc574340e0
>> > [   58.674740] R13: 0000000000000003 R14: 00007ffc574341b0 R15: 0000000000000001
>> > [   58.674747]  </TASK>
>> > [   58.674748] ================================================================================
>>
>> Can we pin-point which commit introduced this?
>> we need to start using more the 'Fixes:' tags.
>> (Although while we are really not in tree we still have a chance of rebasing and having to adjust
>> the tags once again)
>>
>
>Yes, so add this?
>
>Fixes: 099192666a18 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Sorry I missed saying why I reproduced this... we are trying to change
the kernel config we use in our CI to align better with what distros
set + a bunch of debugs that are useful for catching bugs.

https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/31

I merged that, but then decided to revert since we were at the brink of
switching to drm-next for our first pull request. I didn't want to
create noise thinking new issues were due to the baseline change, so
it's now reverted. But at least we now have some logs with additional
issues we can try to squash.

Being 099192666a18, I don't think we really need it.

thanks
Lucas De Marchi

>
>> >
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_vm.c | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> > index 322c1eccecca..6406370b2625 100644
>> > --- a/drivers/gpu/drm/xe/xe_vm.c
>> > +++ b/drivers/gpu/drm/xe/xe_vm.c
>> > @@ -283,6 +283,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>> >  	if (err)
>> >  		return err;
>> >
>> > +	if (!vm->preempt.num_exec_queues)
>> > +		goto out_unlock;
>> > +
>> >  	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
>> >  	if (err)
>> >  		goto out_unlock;
>> > --
>> > 2.34.1
>> >
