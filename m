Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763D7C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4600710EAD3;
	Fri, 15 Dec 2023 22:55:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B91510EAD3
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702680921; x=1734216921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cgUJXZvmvNBHLcQi1ryP1i9bwrH3kX5YgDeQn4SUG2s=;
 b=N7yGcwbzBCDj5QgyxldkBbwR0Y4l1Kw6fbbQ4bPEbuWn1qGS6w1ZYGfO
 /pl4FZH3tH4Bllo60iN83yZgR9bDskfuQe5Gm0cTkINO124EuYZCskjnx
 7dTPKIjQFyGJZWOWqKO+zft6GNFziLovWejEQX9WUqaIM2Tj3b1GEaYM2
 XRd/F4hVhoD/5QokrkIWKLq/h1tCssbNArhB9eeGkstIDTIgRsNH24KAO
 Up6drPpy9bBKnVP+swW+UTErkgQrca+Yy5wpUa61s/Q8dFoRrVikpu5Iw
 yX0G7lvhAX61mFbPuCEzYMWraxej2qKEHFrnMg1bRjsxDstYqHhpnet3y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="459663260"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="459663260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:55:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="840810754"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="840810754"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:55:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:55:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:55:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:55:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8LKO03DbTLLMdNO2GiCNJfJzqlY38KFrubXAplIMH8hrT6jfaaQ/Zr9U/4K2UC1BAwCCVhNCPjvDZlprEPxBdfE86Tm8AMbnHbCsdtKfsSJXC4pJG7WLTKM2UrZAtDWC9mXjzwQReUSHEBe5WSmW+Y2pTXSCtidt7PpZr0MPVUyAwFEqivVsv0FUPBfmJgShLwnYartNrF7+u1YSwtM04G7s2HAukWp3CVEcsFtIEZTd0fyYMuiyKmzVrGpGxarw8wWi/bebsOVkTytfmBrkTX0/HPPbRF042X3RgsAkDOGtktSdEyms2ktTEMIbucflGwLU6etAzUajmbATgVlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVRMqDTWl8tLeaZ4F8YHLzWrlVsS71YV30CCsQGqlbk=;
 b=AUgS17+qEtQPLxJY2rPBnSXAf+SANSV+WjDkwyqVAMjpvPY6xjTWrYk+kv5lzI+uf+H4Icicb3Vh8zz2GUw1qYVEe6YU7Fy7TCbnrdg2h+XMmWoeo/3MQUdhgq6czkIwLvGEmFAmwZ/6eORsEj0xk6mPnLSR/dhdztxRScINjakkV5SCAV5upNi7jrzWRtxYM0ckAvqkE7auVGdCufiNEvCLgUsyVpMuvXnmmzr506qSnFdpU1txsTerFcWlufbxUNkCXIxPw5THYDdb/l3fI9eg/Ktmcu6XRwa67d3wJ2MuiGW3XHo/sb2v1MG14WyoAnZ9Ri5toPEj55eK+gtJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB6003.namprd11.prod.outlook.com (2603:10b6:208:387::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 22:55:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 22:55:16 +0000
Date: Fri, 15 Dec 2023 16:55:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN splat in add_preempt_fences()
Message-ID: <5wtlosry243oidyjh2jvhqax5ti3dnrn6xooi3ivhcxe5wxadp@lkfyjh474nif>
References: <20231215211245.718686-1-matthew.brost@intel.com>
 <t3be4vndhfhtc453ftbv2ru3mqrgg6tpdwksmlipe5mvxhhzhs@ogfrvotddgzq>
 <ZXzYUOKz3rgmZq7I@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZXzYUOKz3rgmZq7I@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 2883b771-534d-46ce-f365-08dbfdc0e79d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GoIQSUSBbvlo6SrUAlnxlip0CIZGDomYe5x1imGvvfI6xwMsSvERgjM3+34iI4VV/r7c0jx7KPalnRnfhqWP8A01oyOk0TQeD8ZFRFD1UhOgwZ49I3tVpfNaqNPITHssXg64BLbYk8NNnX9mSiHbZ+VUqj9TKGnHHnr8y1J0SHqJx4fC2hwT6w/iLJKtF6L2X39+jEUgDF9pGhRsieHTsef1IWwYs3Ad0tNFxI3jpTPvYuAMYUyW9RB7effaFf4LhH7Mz7jTuaKeaZySYgC4OQQp9yZZBBCMLczBznpf3W/tAdJzuvi6lyHy6aoVJ1jXYP6Iq3Q6n7pXYKhCyCjTo3/D1mu4NKb2XajYqNPp2olcFBXsPAQNoq6CPmoqWOqkk84O32g7TPuPwaRmGtrp4ibsnQPQm0mKNGmOsbPjY5KCQTgnWSdrjnSigxUcdBZybMeR6d+xGqbHdDpiSAMHYQX2RpHtn2lK7WiHz4bHRHMzhBOsg4S+gO6ykKP8uJ2BQCtIes22hdB8KF76blMHZD5IRa/IVq+jw1pQFsXwUcAPFKfGpNL+7RtjmuBx82pi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(82960400001)(2906002)(38100700002)(33716001)(41300700001)(86362001)(4326008)(6862004)(8676002)(8936002)(6512007)(9686003)(6486002)(478600001)(83380400001)(66476007)(66556008)(6636002)(316002)(66946007)(5660300002)(6506007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBT3pxrr01BhTDw75YEsENq5splmbBSjjqGmfD1NgJ//x9JuAizei1/ivtZi?=
 =?us-ascii?Q?5p4NDElrtNoIzIqbwqI15uKT5o90herN2xLKfq+vNB1/1TW5jiEuPbrTcnSk?=
 =?us-ascii?Q?aJ6t/EyVMR0ENs8enVBurdn5YslZjtoVujTp2EwE/EwO7t+rvbniN6T7NiwE?=
 =?us-ascii?Q?7zTPW2X1byvgfn1F+uvuE6KQo2BEMy540+FIUWmq9J6ByeQusKVj8PjUtqys?=
 =?us-ascii?Q?99JcQP7AVCADFOt/6exkEjKaSShecGDR2dF2DhpGZmF3hc/LqqjmcwT8lWJz?=
 =?us-ascii?Q?bRpWBribH0NvTSl4uFSq1/Q70S/eUSuNe7j4Lu93E0ak3lI9VxRH967PGMwk?=
 =?us-ascii?Q?s701BTgV6b1A6FnBYRBnguo5ZHetuawAHnmErKCbWi94RghydCCbH8k/tNPX?=
 =?us-ascii?Q?6/+HXSjmN4D+wLcKvJwxYHcKlHy/r8DfT+aV7RY8FoaqPcdSHwI57WeahX18?=
 =?us-ascii?Q?MPtrgjsrPJAu7NqwPfpxToVv7X9heUBvBn/ZEtyTi1UIA2D8LT8eKc5SRhrX?=
 =?us-ascii?Q?/7qZFZFWfXGi4McLIA1rxnDzPJRixRMcVKVKKCGE31e9QPWwX0WLaUleT4wD?=
 =?us-ascii?Q?R+5vfR+ulIjNhwx2mSYkF/ZmJd41ClNcZ0V+7B5BFNPdmQ/MkLHUGPeLkJC0?=
 =?us-ascii?Q?bVpUnX72IKrKzN7Ec/S2fZU0xnS7ZZ9RJ2rLeA0FhIFUvHOGS1VE5Xx1OJBD?=
 =?us-ascii?Q?VYKIVsd0wfB15KKivT/PNoTHCbBRu7J97IL5u8+Ow9drcEd10KhgXgSPJg2R?=
 =?us-ascii?Q?BlgSLN9mxTLqpbg4dPn92wN/0t/5kN/NggOwZ7VIq1lY3HOhm2r8vWf0YpsQ?=
 =?us-ascii?Q?jRnEzm92Mn379HQ9GlQiMp9QbqcWY0S8ixAivNYhgoSY6XNmtVqizADQ5vFR?=
 =?us-ascii?Q?YeQyLTgHyHkFQOFwtcrU6AsIxalsKk/3c+U7fW6+ZHsvczOFYb0HqGfUufoz?=
 =?us-ascii?Q?lE9V2iFct3fmBajCCHUnCg91SKH4U1UG57S8JKt3xgjsiSHuvvykzN3Vt3c6?=
 =?us-ascii?Q?qRkC+si6PcaT5F8Whs2jGTLvYtD2+BacIqFWUawN1O+IHdM8tMmWv9R+CJXF?=
 =?us-ascii?Q?bdLMj4FhnYrnwoaAgE79U3azZfLj1RKZ4DlIBpawXiW5bk0bzYmACaj2mpGa?=
 =?us-ascii?Q?M3CqNOT525QRqHpFfCTqpgMyptGqk0uFlj8zF6ag3KAMk134u3+DtHyWHno8?=
 =?us-ascii?Q?l24D/T3R0Oz4HMA7UItNEtaC8sXJpOkiQmYMg0KJmJ3n00jlkbppSercdLha?=
 =?us-ascii?Q?PvmZ0tICUdonRpA8I/roErAFclNXPwNIDKyLcxGVCO2IqxHwmvUFYZGcCw49?=
 =?us-ascii?Q?NsFxcEFSSe6ur6PM8pl1xdd/pcFQG3f1v0m00ysI1EpZKnecDLP9U1Iw1f/l?=
 =?us-ascii?Q?BoqDX6bnrmZwpfasbtJzkARkFYnafzHp0Ye+dXUkME2eNWRn1ahYX7yryEf6?=
 =?us-ascii?Q?sp3axu2hrPLEAdtzq80erAKcO7o/4RmbpJsHoWs0Fy4l7BKMLcs8biBzLhfF?=
 =?us-ascii?Q?dAKGnpLCzrsmnTIUmIO+CUdeFq+EuM7D+9AOuy0QWQYybBSFK04BcOl3KnI8?=
 =?us-ascii?Q?WBcAZKLEL19gMfpOvQ3fzTLyuH/jSvnIghmjtlZOhCsq1qEzOK5ACOIWuZB8?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2883b771-534d-46ce-f365-08dbfdc0e79d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:55:16.6596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTSHTVZVH9QmowGNywYaxViIK88GFc44BWN8xM8AQl1HquOPEHwrhhMDA3h5PWP1Eyv/+wteu0Sq2k07gHrsgFSB3Q2+GmD/80iUciy9zfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6003
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 10:50:56PM +0000, Matthew Brost wrote:
>On Fri, Dec 15, 2023 at 03:27:39PM -0600, Lucas De Marchi wrote:
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
>> >
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_vm.c | 3 +++
>> > 1 file changed, 3 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> > index 322c1eccecca..6406370b2625 100644
>> > --- a/drivers/gpu/drm/xe/xe_vm.c
>> > +++ b/drivers/gpu/drm/xe/xe_vm.c
>> > @@ -283,6 +283,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>> > 	if (err)
>> > 		return err;
>> >
>> > +	if (!vm->preempt.num_exec_queues)
>> > +		goto out_unlock;
>>
>> any reason to lock/unlock bo if we are going to return 0 without looking
>> into the bo?
>>
>
>Realized this could be moved after sending this patch out, will adjust in next rev.

with that, feel free to add my

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>Matt
>
>> Lucas De Marchi
>>
>> > +
>> > 	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
>> > 	if (err)
>> > 		goto out_unlock;
>> > --
>> > 2.34.1
>> >
