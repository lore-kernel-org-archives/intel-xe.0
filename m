Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8B8C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 17:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E83910E182;
	Tue, 28 Nov 2023 17:45:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0472210E182
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701193543; x=1732729543;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PqqhZn02mbOhLzst7Z08KNZ2M+y94rlRoaITQyEEQpc=;
 b=IRiJG9JdmflfZ45RZPyGPaXu/NdHpNuy2a3NIFgt3nXPAFIpZChb2xP5
 pLBpASJ2rEQ+PoD0ggQuUHUWoc3N2ypPXwBkfkf5LKnrtYSj+d/U1ZVXl
 xzybsO73bpFWGdTyESbgdImgrZ1SwANqxYQe0REK4OHFAeozWEBZvYNB3
 vor0Gmtm3C6EatW14wH4+NvEBqVIk+Mn7K805Sl9MFaSxp8YldpC/kC4C
 WzeJrojCTMU9TLFsyRX5T7IUYvwik/Qm8/8jNZv6yN19QPCC79WrLy6Hf
 8g8mlnI6aJO/G2I7bn+UPqiTh21GvYdGAbSzkhHE4HMrdNbKSUByqlgWG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372351349"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372351349"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797648466"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="797648466"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 09:45:42 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 09:45:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 09:45:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 09:45:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8RS6VftdXsXcvGcXCBH1vI5/SVJKIpsOymcOtqzzfW9KsVmBXzjLL6Vodb4ZsFqmuMfQAFqbGyJ/vBLm19fbq/MpJRbiAhRPKOAfvQ2ym2wMwjg9YBB9EdglUgCRhFVBUqTjCL69baQFgtvhM87Mx4hYLD+l8eJasuU+inIIQYqD63IoKnK/YvTMdp6EPeTzWCx+3KwhBlXxLq8IaInkfihlovLMFxtMtgWcke5gCJ0Uac8Ob9BZ6HrjR41Lv/vMx9TOfZ9BTQII5cytj/VYAjZTvcI4L+8HInacG5quGnz6HziwwjR6Milr/uVYpcryzKHHNSUL2BPtN1NtDZfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqkyZ43E78Ek9LFusr+43ThmLefuFFsS5UWYEVgurRI=;
 b=mQEPSaUy6g9Tma6hwrfVnR9oeDrOb8q98BmFH4+QP87ZDEe79fHZBzvFUuxS70EQG023m7hO/8CC3BmuHlmOADghjxh7JFTbwpliuUQTwHcEdD3E+zjryQtMY+NYLKqIr2wiCohca0+Euq6l2M/AITvWXVyWQoLbPmmuKpZFKhZswUfSmlS05iCixJSJjryDvwWymPpOSi3kKystkLvsfCUU0KlkvT4KmNaDP2SQaRF6yim8bU7IFKRBO/7ikbErSZ5keVI2q3tkhG++XuuHcs6Zhs2ZxI1cuDhvNmT6d5pW/LwcGta8tvIcxzLfXl6BCtrkM0fvlBSza5aeTBMt1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 17:45:39 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e%4]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 17:45:39 +0000
Date: Tue, 28 Nov 2023 11:45:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <mcx6k5c6cx3okqszgpw45ew7yqwty7tprojkjnwv56yj3ulpqz@h5fehhchgjbk>
References: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
 <ykymzzr23ixp3owtn6tdeieb6eyxpnzeypvwajx66mqkkxobzx@eu26ntxgx6fr>
 <ZWWpP99Wzh5U0qwB@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZWWpP99Wzh5U0qwB@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW5PR11MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: d92b2c39-9b71-4752-238a-08dbf039d5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKUvqXv87uLoFbaG+tFYflGlLksI9lef7Ev9et+6QInzQBKhZgz+CFdp5t1anOW2o2uo2iL3kwPL56tf6RkK29whMuF/GOiAHIhBDzCpsRUltQX4U62DNu+ARtqMRVEkg2vOJijXeGRQgAsZZOoty0XtlEgDx/1PgpVL5IRSlxdN0kypPo/+SfI9vE6nnFpypNhR+1HqvkmPZab+3kf1rtCOtjp2mfOC+ugeqFyZwXXUmpSGr0rE/fwzTLnV0J5grD4moICEEvbTiTCsKxsTh1B/MenCpH7XksphyHCxR8H614cBpF4oPs+TON44mOqVc+skSemPKQXneB7aNTRp+3XMsiCbiFk0Umd6XKcLJaTKiYMY899/zRicueF0XiVfxZX5TA4LTvqlmGb6IZuPeGAaIU/tLoWNuXsht2BBorR4r+DExxlPyNnp7tIkzFA3gbabB96O6ZRz0aUF5O9G96LWZCwV1vdDtbN+RkWpikVlL+H41gvaV6vDmD/CcO4PZAKEePhm3YzOe0UZ1wZ2V5V1wnibvPWBIG4dKR4x6Q3ZcYs67ISpbp35mhEYyKfSNfKo0g0JZ7CbUp5UFye+ZY6Ahw8ivVDXXhInZKP+tYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(9686003)(6512007)(66476007)(6506007)(83380400001)(2906002)(66556008)(41300700001)(33716001)(478600001)(6486002)(8676002)(6862004)(4326008)(66946007)(6636002)(316002)(8936002)(5660300002)(82960400001)(38100700002)(86362001)(6666004)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ly3TuG0iOEXJ4H61INdfWKk38tT023z3vGgxgZXW2rZfyNE1bjBuIaB6wsQ?=
 =?us-ascii?Q?feVNrOoGnr0pQ3eVgm4T+35Cf6lVuMEylLIA5XPrgYVdfUn5WyyKubVJ6Erf?=
 =?us-ascii?Q?pnrWjcvN4X0e+lIwaDSYpkHh3mlPK8E36/iEOFyzQz91TsrJjpXJ1VyFOOTC?=
 =?us-ascii?Q?lQub7trrpMaFU7ss0Z4lritMc63B/XEahbgjHs85cDT7NAkfc1h8UVQVwV9j?=
 =?us-ascii?Q?P8GOwyNp3GG8UxTlFGQV9pggS7l4HQHVpajY/38ugkxR+SXbqnDeeUvT0Go5?=
 =?us-ascii?Q?2QmfLuY3Hr0wJaepn2S1jCh2/ybLvahfv/Xi2QQck/aLtQ5+cRC4aMMRJEdw?=
 =?us-ascii?Q?ag1fHl5ijqeplZRtZNde9DWW9YXdbw5gMB9fowuU3UeTvjYbHrkn6qETT54Z?=
 =?us-ascii?Q?v6oQ4d9hrlgYp2uXOZmbFOc5CggT81khtoBcn7t0p0AGjaIK9Lvnz0PeO6cW?=
 =?us-ascii?Q?fxax2/7GLHYE+xhphv2x4Q3ndaCZ7+wg8cycZHiLr74nRZivE22XMN+0Jq66?=
 =?us-ascii?Q?AQe6IeV56uHqLaDjsD2setZgQD+Xsj2cbtA3McKIb6FxRSje/kKmkNgKAoCM?=
 =?us-ascii?Q?6BJ8RxLly4/j55LICaLC5IDWQN8g3S0ISnbAAY1zo+wkm71rsvebSj3RDMkC?=
 =?us-ascii?Q?vRmv7f+crByamQSisAwfe9YOcFwM4x6WET3C60KEqQ03tIIsU90ckFpDrIJT?=
 =?us-ascii?Q?Siswu+P53yu7Qbc3S5/JSjdbh7e14C/MWAoxQOZD9SGIg09jT5qMnMOx/cZ0?=
 =?us-ascii?Q?4UDIv9kebTBEXvHRECl6BrSMLeBKAPuIW/pQTTBEkxpd8d+dpPxrxbQpXEMd?=
 =?us-ascii?Q?1WhoRjJ4MRvPvA1T3L8AvMCu71/JuVL6uzJZNiAvmq1Ik5E4wDVAZpC7LlQZ?=
 =?us-ascii?Q?6r9x69JHxJ1yjvXBmkewJXmVpeProZM/aJSLJcgDSw34oeFDAO6Knsop5NS2?=
 =?us-ascii?Q?L+GMqF+H/F1jN5Qf0nGuFsBdqhkRlkCQovAIpdgDvb/N0oVAMAt05HyiVa9M?=
 =?us-ascii?Q?JMoxskME7ZFezCWEgjdcR55D23Z8Rq20lQpfJLNoVXcuZFZhdvnvicEZseub?=
 =?us-ascii?Q?dQSKPWksCztV3A4zUXr/Q1SaqW2ooOMyoN5mbVdEEkr/t9mJ5VVZw6FOEmv3?=
 =?us-ascii?Q?QH6Y21dWozK3aXE0DBH1xlCj7xXBaxLsWJG/ysCzm8n/PKtqHu2vuz2KZCkA?=
 =?us-ascii?Q?Mi+Bq7YaHjjN9Wb36H20NUx3bLxAfmDe122fkKRudmaDFe51c4L3wAvJsLgy?=
 =?us-ascii?Q?XwYXx1FHxTOLP7MEZM7fn7uHtUp5mp4Q9hV32pxdIlTXRX2NEda1JmpjOK6+?=
 =?us-ascii?Q?Yr7iehRbWqmLH7TutTkqavPUVQxb3Lh6QEHtei+/CLJ6khh2TKI9vilqONmU?=
 =?us-ascii?Q?FWGqkYM1H+j5FSllFrkXHJ10M1WyPN3RY1z32cDaQ1hm78mkCSIYq1rwrbYB?=
 =?us-ascii?Q?87aSOLc1Rwpdno3laEBpWHjzY3/iB7/Ldu/pmTy8mhjS7u5AuSsamKBG9ff0?=
 =?us-ascii?Q?IJPhdW+qCrlbgaeAAwFBpPANF9zxmXiZgzX346cOos6AWFsUsAPO1BwwysNF?=
 =?us-ascii?Q?U2C9z78eC6QkBac5UV2vPpTI0s8nL5xhm09IURYNSch9xGbTGMxrgEEx0Lo6?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d92b2c39-9b71-4752-238a-08dbf039d5cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:45:39.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Of6mXAKfepwnx3lZxYO08jrU0DFVwdMp8w+o1uoXJxyQ7TCfrM0CyauWC9yiW1/pLP9ZSSQCe+idD18BW5/T2gqCDFjjdbAdkJ9oHya/4fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move wa processing to gt_init
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

On Tue, Nov 28, 2023 at 08:47:59AM +0000, Matthew Brost wrote:
>On Tue, Nov 21, 2023 at 08:48:47AM -0600, Lucas De Marchi wrote:
>> On Tue, Nov 21, 2023 at 04:55:55PM +0530, Tejas Upadhyay wrote:
>> > Currently WA processing for gt is happening in early init API.
>> > It also includes processing of WAs which needs filter based on
>> > hardware engine by looping over number of hardware engines in gt.
>> >
>> > However at early init stage hardware engines are not associated
>> > with gt in software which skips processing such WAs.
>> >
>> > Example WAs which will be fixed to apply after this change,
>> > "14011060649",
>> > "16010515920",
>> > "16021867713"
>> >
>> > Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_gt.c | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index 0dddb751c6a4..3d0f7b6f952c 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -311,7 +311,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>> > 	if (err)
>> > 		return err;
>> >
>> > -	xe_wa_process_gt(gt);
>> > 	xe_wa_process_oob(gt);
>> > 	xe_tuning_process_gt(gt);
>> >
>> > @@ -495,6 +494,7 @@ int xe_gt_init(struct xe_gt *gt)
>> > 	if (err)
>> > 		return err;
>> >
>> > +	xe_wa_process_gt(gt);
>>
>> the problem with that is that if we need to touch any register already
>> touched until this point, the workarounds would not had been applied.
>> Digging the git history, I had added this commit exactly to be able to
>> initialize the gt workarounds as soon as possible:
>>
>> 	4eb2e8d25ab4 ("drm/xe: Add xe_hw_engines_init_early()")
>>
>> And then
>>
>> 	816d37907ac6 ("drm/xe: Plug gt WAs to gt init/reset")
>>
>> Note that these commits are in the xe branch, not drm-xe-next.
>> So, it was:
>>
>> 	xe_hw_engines_init_early(gt);
>
>xe_hw_engines_init_early has be called after xe_uc_init_hwconfig after

did you mean "has to be" or "has been"?

>the idea is gt->info.engine_mask would be set by reading the hwconfig
>table from the GuC rather than from a hardcoded table in the driver.

like I said, the problem with postponing that is we could have hard to
debug issues because we will think we have all the workarounds coded,
not realizing it isn't applied to the early stages of hw initialization.

I think we should go back push back on the idea of initializing the hw
engines array after loading guc... it doesn't make much sense from the
engine initialization pov and we are *not* doing that.

static int gt_fw_domain_init(struct xe_gt *gt)
{
	...
	err = xe_uc_init_hwconfig(&gt->uc);                                   
	if (err)                                                              
		goto err_force_wake;                                          

	xe_gt_idle_sysfs_init(&gt->gtidle);                                   

	/* XXX: Fake that we pull the engine mask from hwconfig blob */       
	gt->info.engine_mask = gt->info.__engine_mask;                        

	...
}

The engines available are not hardcoded in the driver. We read the fuses
to know the avilable ones. That is sufficient already to loop through all
of them. Note that since it's *engine* WAs, we need to pass those to GuC
via the ads since it's GuC itself that does the save and restore.

>Likewise for_each_hw_engine should only be called after
>xe_hw_engines_init_early is called. With that, I think this patch is
>correct. Does that make sense?

as per above, no. I think we are overcomplicating it for no real
benefit.

>
>I suggested to Tejas that we add an assert to for_each_hw_engine to
>enforce this is called after xe_hw_engines_init_early to catch issues
>like this too.

I think that is already clear. Not sure it deserves an assert. The
assert would for instance trigger right now in calculate_regset_size(),
but that is harmless. Also we'd have it spread through the driver.

Lucas De Marchi

>
>> 	...
>> 	xe_wa_process_gt();
>>
>> That gt_fw_domain_init() seems a very poor place to initialize these
>> things now. It started with commit b892e30c6cd7 ("drm/xe: Move load of
>> minimal GuC and hwconfig read much earlier") and then people end up
>> adding random stuff in that function :(
>>
>> So I think we need to get back to the original idea of _early()
>> initializing what's needed. Then we'd probably need a few cleanups in
>> the initialization sequence so the function names at least partially
>> matches what's being initialized.
>>
>
>I agree on that the naming of all of this could be better...
>
>Matt
>
>> Lucas De Marchi
>>
>> > 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>> >
>> > 	err = all_fw_domain_init(gt);
>> > --
>> > 2.25.1
>> >
