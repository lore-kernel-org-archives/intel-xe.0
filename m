Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EB3C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 21:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C309F10E045;
	Thu, 10 Aug 2023 21:55:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF61A10E045
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691704547; x=1723240547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B/QGH6Qe26WP3ovHm7u5EsEOpTB1kt4nQhqPcaQ1SB0=;
 b=J7E+/qdXj7tE2v7fQhYoCbMYu5tmiYxFqTu/8NxZmIcB/U4xvIph4Skn
 bGSQzdqCt5huA15x3o2F2gBCcvp0mGr7XyMMEH0AKagvP0+zELwTY+2Ju
 ku+H5gQJKEW0LY1XIce/cQTB0ZfpflT+s67XdfpfVJZqTW2RmPciKWeup
 n93xwg/UhVdTHa92wlYfYu8JSBJgAg/1dtwDaEBepu6p2EN1B4X4PFMDK
 6IYwSFOT5plsf9+nWaFtSgZvCpO9fltg+jFcWjBoIrXMGfSKkwbtX18WN
 K74xfRphfKIaxDFqD39w3ivgZe00z8Mtip/1RHw//Ja+qCIcWiPbvqOY/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351137871"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="351137871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 14:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="682268962"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="682268962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 10 Aug 2023 14:55:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 14:55:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 14:55:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 14:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWj1clZtU2I3udmaPmWYV7MJgtG1LcnNyLerAz7zEqb0lSEsnCNvGat9OnarzMOYJwpIHRQ07O8CQvRhiSW44Sho3DIPQefMjrYSv+u6ShrxMjb12oTMdL+iCzgJFYcj30qUzm+a3s/F+j0YeExqDKzpuU/34XvLB/Ie6aZ4fVMQuN8l1ar7qrWMA2ORNb3GHdKQrL4Xay+KhIszHpljtXlYJEz/VNjx35zmPQzhrlaMC0LN7Q2xUE9rJ2q+2o97kHxuMOx3RACFX/DxcnqVHS3Pu/UD+GLhSrnxUygEbQFELQL02oZHwYMVdUm9n/aEuCq5wwz374+wFHCB5q9bGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7uJ830TAPWfKFP1LJS8SC/8U+OD1j/Um7ISioyTBbY=;
 b=gyyO/dFpSyPteSgPoM6LjYgvWSc8tL/MoyzskvsugfraF9232gUQ+x6M6PUBnGkF+yQtWTV367ztC1YLpBix0V3Rwx6k5wS/S7lqrZVSSPafB0TFqBNBS1VtKvdGT4VXXwqfhxO+B4vT2YKbxCLkomkaVbifll605xpz5wPP5GIRn55OITdVZ6HhXcC+LaV7fkiy82f6MqDrtUZ4Ml1CgltwSss9UVaQn4FQNGmX2oQKpAPYpk9AWoiMyFd2MtY2V3+7rg8kaXSz1ZBKAE2GK/Xhk1wKeTPNcKdu0rDD06hltjVCrjha0M1R4vrT+Hg60sKAIws8hZOWEbtz4ZibSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5540.namprd11.prod.outlook.com (2603:10b6:610:d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 21:55:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 21:55:45 +0000
Date: Thu, 10 Aug 2023 17:55:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Message-ID: <ZNVc3WlzODiKP/j+@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
 <95750d7f-df24-a9c5-ab39-86db69767bac@intel.com>
 <b9496a4b-bea2-fa15-6ae1-5810baf70260@intel.com>
 <cec5ddd7-e79f-c848-653f-81e21240f29a@intel.com>
 <87msyz39iv.wl-ashutosh.dixit@intel.com>
 <badff12b-ac9f-b0ea-9ed2-147b426dfaad@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <badff12b-ac9f-b0ea-9ed2-147b426dfaad@intel.com>
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4b2b11-84eb-4cbe-26fd-08db99ec8c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 06g+/gEy3xSibbX4/gK4GA13+YTusnCL/cK9Rn+gMdy7onRWPvAKp2grbNFtJYg2iftww0zWde0aEEelySURqfh0bKn8MIYONj1Eh5HNMNUY6jyxwYJnEVHTKULutXX0D9FoBjhl8Xl56xD9Wn1kjTm4FYSVCzwE5DOMkWI08ZXHj3vaBlKgQ5/4pHuog3LLiEXWb70EPZri687zw1YB7ZxpyO55wOPwTy/7onWsm/bDKzwhk6wttSIXaXLZ6N4+UlHXJ2ZbJmKmOdAJaBSGAdKr5VMDbLMXjD5HOaJKggl9jPVg8QFWdBQ6RihbjsBvoY2jswPk5K7CtqKSoHmvDRmaFlTUORRki+zBYxoEoVBgXUl3y7+1HN7O/SBoenU7ITmwhh7WGrXPa3+Kg44G1TkVxmQ/PE5gAuq27DjH25ucUGxVJuUnVKWuB0l0oJzVXmNAOpSOkVulhr/uPmr2r+LwWyQ3pf2iZzs/v/2X7zx3jlV4z8IwWenxlanMqIH5HAApAUhH4LFR2x9Ujx50A2A2Sw82L6Le3E4rMFEDqW9sNT/z7zEIYZ+0uo2+SdTy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(186006)(1800799006)(451199021)(37006003)(54906003)(478600001)(86362001)(8936002)(316002)(8676002)(66556008)(36756003)(6636002)(5660300002)(6862004)(66476007)(2616005)(41300700001)(6486002)(6512007)(66946007)(6666004)(2906002)(6506007)(26005)(38100700002)(4326008)(44832011)(107886003)(83380400001)(82960400001)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6vtvmcwqyq6eZn+4OQrNMYmF3QOzozzxLbDvO40yOh0IOIlBIHWiaRA/AHV?=
 =?us-ascii?Q?RGOCDW6EwpYH1Rb7+ROk7yPYGkUQUOLSMNqqtF5Wl67pvWkBVoWnyz7w5NLn?=
 =?us-ascii?Q?7IEw4FEJC0obbwzkRGDKoGNCHfh188ohABL00XnT3pomSGop/yN8Dr/EQsp2?=
 =?us-ascii?Q?yFhz94LjTIVmtGsWGSHNDjya40dhpOPo/zAOqG7El7oPhJsM31uFUrve3dfg?=
 =?us-ascii?Q?rlzmaUT9EQ7axvMNiDenJotEEyxEPtJ+eqUANPA0mv2eyp4rogvWJMyeDMER?=
 =?us-ascii?Q?9jouTo9H4PbltDjxSE6hc78ZoySCLP34AIdNHaDGisDBlBuR/cSDBkpBRhyS?=
 =?us-ascii?Q?8z7Tbo6iOBsq0j/ho4AcR2EOE+saRQWTbcIJT2YgjmNPbC3beKqwC1M/+qVu?=
 =?us-ascii?Q?NK3TXV2Jj52AHl6tHbqDy7H+XgnJUCBJYNDD4jeHJryGYBWSUCzlI6717uob?=
 =?us-ascii?Q?IsWHmFBFx+n5Qe62HXCf2i4ikC+VjK89dZWNTuKfuPNVHs1ctO6dVWXe97qz?=
 =?us-ascii?Q?lz0XNkggHp4dv+b4Ndxh6E5Zadqmi6s28xhrwmwtCsLy6VQCnir7Tkk1jtFA?=
 =?us-ascii?Q?QeaPlUBU4jJCpeIY257UL7ofpZNRqahJRFl6bxtZhmgzgfqVzgVFyTpZpW48?=
 =?us-ascii?Q?xrZycVDL6BEk9Ykmiht372djmTsb5X+3lvZSjYrhatLcnG/MYep+rmtoChPp?=
 =?us-ascii?Q?FgCgS34hSM5b5DCKJNpCMgaeSs//l7nxj3Rlxet0UhA6oIuraCNUmdV4Ty+X?=
 =?us-ascii?Q?6Z9R7AUMuu9ktNDveO78YeJOfZqN5WYLJKauWlmdAp7/94M4zqRzm04rQcR2?=
 =?us-ascii?Q?1yshkAxelmEF4ftFSuruXsdxjtXuNtciYVFdsUoVDb6rwuzGikQK2dTgrYKb?=
 =?us-ascii?Q?yapw6Osa89m37Jsm+R2M3UCY5jJi6D76tp/50824aRNIoR/bd1GIKfOJCpUO?=
 =?us-ascii?Q?HjgSXexYgszD/sDasYuZfpBMr86+70HJWbZvIx31PsL64xsz1n03zKux6cym?=
 =?us-ascii?Q?D+wWqz5+ey5fnVKHX576mFhroTCJ7cDsWkOfqY5FS2P8cyfoSjNj04L49M5v?=
 =?us-ascii?Q?ekFrjFnaD8PiN+dkxP1sF4nvPSl8UqQOlKP5McCWq7i7zqCcMj0ND4R8Iboz?=
 =?us-ascii?Q?xASWP5OR8uFDnUxVvPIpQQlUh/5bZ/bQXTXuvxpMmDeEpZmCxptKyUl5EW4e?=
 =?us-ascii?Q?3296e5wjTg1tipcbZHKo45DOpAjNcseDjRgUiWh0aNTCCHYa3r2lFPZI+DQB?=
 =?us-ascii?Q?tPY0Oe/9RHcNkdJzPW7gnQEhtyGHxvBNDYkMIhkADCR+ZGRRJqadlRPV+z4S?=
 =?us-ascii?Q?oJgeNhDW4hehpHkkclFY+UyY2TBx+KKYM1VbDXSkRUh/KHG94mRnHVZTqFuz?=
 =?us-ascii?Q?iTriTtBMG9A8D1DmS7kwd3GKedNHlswG4vDR7C5Q9EQO1Akpx0dT91E4HiXr?=
 =?us-ascii?Q?5lsJbQelgh8HgmblW6pKbALyJwT7DkK5I8EKQQ2/cFi+kV2VuhDcSayJHLIc?=
 =?us-ascii?Q?vnP41ele9Wwz+k5RPb8Gl7Vfr+zDKMQQ2VO/9Emvz601RKMwvGixYS3pACQR?=
 =?us-ascii?Q?IHMLWt9cynsLxIaHHJqxdxBgHhgjul1qCj/2HEeY0wsm/ya5jy/pmQ4LlJjW?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4b2b11-84eb-4cbe-26fd-08db99ec8c46
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 21:55:45.1324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvG3e8asCKQJfXey80IQaDsuRa2aI3eRNYoXELFGWcyeJAA4NzFroO1QCTAWeyXXWiJdEa/ENyN/lLtRqp1dig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5540
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 01:40:16PM +0530, Iddamsetty, Aravind wrote:
> 
> 
> On 10-08-2023 08:10, Dixit, Ashutosh wrote:
> 
> Hi Ashutosh,
> 
> > On Wed, 09 Aug 2023 06:11:48 -0700, Iddamsetty, Aravind wrote:
> > 
> > Hi Aravind,
> > 
> >> On 09-08-2023 17:27, Iddamsetty, Aravind wrote:
> >>> On 09-08-2023 15:25, Iddamsetty, Aravind wrote:
> >>>> On 09-08-2023 12:58, Dixit, Ashutosh wrote:
> >>>>> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
> >>>>>
> >>>>> Spotted a few remaining things. See if it's possible to fix these up and
> >>>>> send another version.
> >>>>>
> >>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..9637f8283641
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> >>>>>> @@ -0,0 +1,673 @@
> >>>>
> >>>> <snip>
> >>>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
> >>>>>> +{
> >>>>>> +	u64 val = 0;
> >>>>>> +
> >>>>>
> >>>>> What is the forcewake domain for these registers? Don't we need to get
> >>>>> forcewake before reading these. Something like:
> >>>>>
> >>>>>         XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> >>>>
> >>>> based on  BSPEC:67609 these belong to GT power domain, so acquiring that
> >>>> should be sufficient.
> >>>
> >>> But if i understand correctly taking forcewake is not allowed here as it
> >>> is an atomic context and forcewake can sleep and that is what I'm seeing
> >>> as well, might also be the reason why i915 didn't do that as well.
> >>>
> >>> [  899.114316] BUG: sleeping function called from invalid context at
> >>> kernel/locking/mutex.c:580
> >>> [  899.115768] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
> >>> 290, name: kworker/27:1
> >>
> >> that is the reason why in i915 we were doing similar thing of storing
> >> the counter as we enter rc6, not sure how do we do that in xe.
> > 
> > Just to check, which code path(s) is/are aotmic context:
> > 
> > a. xe_pm_suspend
> > b. xe_pm_runtime_suspend
> > c. xe_pmu_event_read
> 
> pmu_event_read and runtime_suspend are atomic contexts.

what about doing this at xe_pci_runtime_idle() ?

This will run after the autosuspend time elapses,
but before calling any suspend. Also, there's no requirement of
that function to be in atomic context. So you could forcewake_get/put
and stash your registers before we go runtime_suspend.

> 
> > 
> > Now I am wondering if GuC should provide these counters too along with
> > other busyness values it provides, since GuC is what control RC6
> > entry/exit. But let's try to understand the issue some more first.
> 
> do you mean GuC reading these registers and presenting us in a way, will
> need to think over how does it fit in the PMU.
> 
> Thanks,
> Aravind.
> 
> > 
> > Thanks.
> > --
> > Ashutosh
> > 
> > 
> >>>>>
> >>>>>> +	switch (sample_type) {
> >>>>>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
> >>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
> >>>>>> +		break;
> >>>>>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
> >>>>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
> >>>>>> +		break;
> >>>>>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
> >>>>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
> >>>>>> +		break;
> >>>>>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
> >>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
> >>>>>> +		break;
> >>>>>> +	default:
> >>>>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> >>>>>> +	}
> >>>>>
> >>>>> And similarly here:
> >>>>>
> >>>>>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
