Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F30C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 22:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578A210E133;
	Wed, 27 Dec 2023 22:23:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462F210E133
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703715810; x=1735251810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=my6W1RmMfZ42WIUNo9Ip7qELh6sQMKGQ+zfb1qPREDk=;
 b=fVu6S5hpJNaP6D2T48jL2E9WfwEzOSJwev5zE6GLeLmoFclHJlojFrgT
 2Xfzrzt+TdGxEIlVHmw7x13mHkYMtjMtvZt/vMdDuIREujgqfP4DJzObH
 p74sZ9NvXWZA/INKH12OdpFJoGiRaE9f8F7K8+KRnzOry0DYOzPShGn0B
 hxegjfZV1DJF5N0FWOE/32yWeS81APdbp2OUrer6A1jQdQX9qfn/844KK
 0lNgG79u/7ASMeV8XJceR69HnaRF90lPjqNFTjlzxOiXK1l2auqJcYIL6
 qx4J3A4GpSIuSWWixnvJ5DoIEhWVBdwKb9DoV/gQzwPN5sa0Yj3BfPO/E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="400299456"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="400299456"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 14:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754570606"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754570606"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 14:23:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 14:23:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 14:23:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 14:23:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 14:23:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLgNeGGpLGnnYGRY3GN04Lm1geEX7li4tbzEQHwV7tNG4KJn9X5tqIP+Lbh8POgYPi4KSqrNds+W1wmKQwMs7LgF5u3cQBnH/E4kp1EO7HBnmCf4FFVUHeR32YXlCxggVh23gX/2iAkerYm6Uh9a9sYHd5ym+aAD0Z4JZrH+KG6czcEFlplLQOPWsnTVkcraRO1M7rumrpV+PWMSgZuwF7bHKVbofg+7Ex/eo3uxagdId7pDXZxUwmqnkhJEEUm7mju/4Zjb07s+0CG1rkVlK3etBkpyqI6F22ejQJnYG0hv175LzL9XI+EWyodN/VkCGS4LRdmb/t7loMmkH+6L6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uW4ky4Hz2Tn31W5MxW0BveZ33y9kjjdcZewll9l3OI=;
 b=E75qFmBHGSrMCL/4SR+Xds3XS961GNNI8XcB1NtyiFy4vnm+umf2476ruOb9Ew28zzpE7IKwqp6c8UuzJAwTECXYdbCqu6bAFwtPu7/D5upIHFwkqkTaPrO3/Ngej2YMA/AgTF28Qpu96XBXAbDVaH8Iaw9bIC9jYMjxJ88MLGmUjyqYfORBdlUeoeGrsqoMhdu6jOxvGMi/SfuvrcPbgE+aJRKLZplzD5kxGjYMim7N+ml5YuecoiU3nf74jpDN3qZVw/6FPaJMPlCQMzQbDQnz57KiKZbK5hqmi73QuYg66OAy6z2VVBRnEo/nB5vXOro0dw5Hupd2aMjv/o3OXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7690.namprd11.prod.outlook.com (2603:10b6:8:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 22:23:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7113.026; Wed, 27 Dec 2023
 22:23:14 +0000
Date: Wed, 27 Dec 2023 22:21:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
Message-ID: <ZYyjgzGsYNwab9Wi@DUT025-TGLU.fm.intel.com>
References: <20231219172824.832873-1-matthew.brost@intel.com>
 <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
 <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
 <ZYUkIzf+R/JSJPIc@DUT025-TGLU.fm.intel.com>
 <8932513b-5aa9-40f1-b172-d271a9a08b92@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8932513b-5aa9-40f1-b172-d271a9a08b92@intel.com>
X-ClientProxiedBy: BYAPR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:74::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 52bc05e1-05a5-4921-3bdc-08dc072a6b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjHZ/A2YtsMnbeUXUbzHx6C8RmxxHNhvOkmw/lU95sASr7Bsep+5oQwg/pw4RTdWAYdsERdFoe5WStZF4qMeAO7ZMVPEdexmNCmLw6EhogsMzk93M5rq3Vz1C9CLgt8ulhmB/jMzGflYuPAXHoWODFWTfKZba2CgC3H7RLyEwh0IhPVWKFqOeVObrmJypnkB8fC8vb3k4x64lWrVN3hQ3FmqYW2Yj2SaTkwkMsY+kBVg/GJWTHKB5/DAqH1TW2VU7786L89nrj89jPrQwDAcNUqgnNGaqigDnB6By11NxhEMvGbmN/6BFR9W1PXBnvCHKmqrEbf4fjVef+FLszuRuN4gZo10a/10Ed8A5geaXRSiC1lG9o6+7oTiGLUic0Uw/lcOA3urA1QuV1+/2xIbRdXr+2WiEdBds8Vif+vyeDgiVMX1YfMKDhGLcfEBIvLegKiu/y8ZJvKsgSwYOhlIpU4ifmVElf3yzuyoM/rlEqXYRnU3sA8Gk/omVmCvxnnYXWIwkIhEuJWXbDR7OzS32qM0mHuZBf/Tp1pt1MW21Hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6506007)(26005)(53546011)(6666004)(30864003)(6512007)(4326008)(6862004)(44832011)(5660300002)(8676002)(83380400001)(2906002)(6486002)(8936002)(66946007)(478600001)(66556008)(966005)(6636002)(41300700001)(316002)(66476007)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GeVfEVlxXbT89CsoMD0uoff8JL+MxWSYAh+gK+XI/0P2WPvVCw6sUHjTuqyy?=
 =?us-ascii?Q?BG5GcjPRfeQeQiXJaCrRl2e9JAhE7c2oJ/O7jwDbxShQjoKjssLlXow9KOJ9?=
 =?us-ascii?Q?JD8P0sOd89skp+qQ5wSO+70hRnxCEldC42T6y0iHH+jmbVHUMMsJY692+19i?=
 =?us-ascii?Q?lmVaw7aCh9Gxt99YoEpHNLA8g/lbsSh95m+Xgc8xqw79G9W/OVycBBhAApRP?=
 =?us-ascii?Q?DOJrjPhXU+oHawAObWTw2Gctiw5PK1cgx7jHMcWi7X+JVx1cmKSeG4WpzGlj?=
 =?us-ascii?Q?sPzyzvNFlT96Q6dyNMNhq9EtoeQyImrpVxC9gdNqk1hMuKN19mkPMbGosJg2?=
 =?us-ascii?Q?D4m63LkQBQk1kCoNZoWWjYEiYg/SXqlpNIGf9RmNnYCOhpvRQmavQmt4nLkq?=
 =?us-ascii?Q?WtNjftLLykvgs2qwsHR+mCJfluVz10Se3RQQOUI+dyHnNHFesQ/5J8R/hCVz?=
 =?us-ascii?Q?iREbhVNMwSeJbiqzbrNVKjrlPlRwjX3B7EQxFbwQVMzU7OyqwpJFQc4k6/2B?=
 =?us-ascii?Q?Xcn5kHZWZPJMT+gOIilcyCVMAaf/EffZg6kARAgNTID+yDeLUZln3NtE1jXW?=
 =?us-ascii?Q?4JkGpYvs+L1at+4jCPWomKUSvTCquoxUBMJ+NFPk3fgul41vkrDJHaG5NDwj?=
 =?us-ascii?Q?ESxGMXdoUaWlMWc0jokqQWvqT7iTlDf3O+xbQtUc2b2geL4IuNwydVewFtf6?=
 =?us-ascii?Q?32IyMj8aZIA9+uAm57nrAaHdeSkglyNOXEBplVMarFOdkMvZF72ErbiIEN/L?=
 =?us-ascii?Q?e9yf6d60mtsT+zOSIj7TpsLqGNJ4ibqhho1WnrzN9tHayWadacRu0ErkvVZs?=
 =?us-ascii?Q?YUNlwANdXWNqZP1K6wQ3D3cazsUsvQDueBZ8J8xjjw6bxPimYfntsEatvKUH?=
 =?us-ascii?Q?2C7pKlIV6zbziD670HcYFbu6w30FX2p2sXx+orHzELO1nhhK+EEYg+fS50CC?=
 =?us-ascii?Q?P5jBUnD2fWvTE+YcmWIK3IhNi24/L1eiZ53JOW2wOcHXAYpwYq2AdZhk8mIz?=
 =?us-ascii?Q?RLkAe7Nju+TZgWbiJV9yNvlj9rlEwnVg0cXxSGflMWD+JNjEh+IaPXfM1UlU?=
 =?us-ascii?Q?np+gkwdCMtDrkaYS2tJ585S0eGMX4ooxj9VZaTijT2p0CFPJBfv1F+u/Q/qA?=
 =?us-ascii?Q?f6JflYInUVAYu2m3jWI5eKSUli6PtQ/W/Jtt9Ey+7FDYMgwvviF9D+oiQpWL?=
 =?us-ascii?Q?V+q57MGPa1bmxr2gp1S51OuOEjkqDAXBoc8Am2/AExYWw+ZrH/Po6amU2bGK?=
 =?us-ascii?Q?GQwXP6AphE3WRnArpuLgRayod7aleDPYDY/umsRUa2NjMM7swSF0xYVJsU0v?=
 =?us-ascii?Q?55Km82uFq6OXOo2t/ewO9kAs3EdIjocg7wQCP0CGle+0T+ccoJyUR2s5ka0I?=
 =?us-ascii?Q?KWjA6XLkWLOAYdi89LxcRn9utXQi4T5ddMEM9eitZY+btolH3GUq6PP78ZlA?=
 =?us-ascii?Q?XxWvaqXah9QH+r/qJoeET744DrH8EjcONO03SEwIDaQBXanl/qfkdenURgo/?=
 =?us-ascii?Q?99rc25CAqNvq8TxWWUmi2yP54asEjQqZt2+9InntNzqlY3jjjlBed7gAICvL?=
 =?us-ascii?Q?cw1AhK0I++SxtVmpXUm5zJmxb5EC72wrrDxk4t4SRXcaKCUwr5sMur2BrC5Q?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bc05e1-05a5-4921-3bdc-08dc072a6b23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 22:23:14.8463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQ98J6TPiG99iFOATt4Azv8KxUhxNZxUKNOLTKog1dkVg5P+vzK410CjwQVdFrDVIvFLqicwT+2jGXeaSXIfYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7690
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

On Wed, Dec 27, 2023 at 12:22:07PM +0530, Riana Tauro wrote:
> 
> 
> On 12/22/2023 11:22 AM, Matthew Brost wrote:
> > On Fri, Dec 22, 2023 at 05:47:17AM +0000, Matthew Brost wrote:
> > > On Thu, Dec 21, 2023 at 01:56:33PM -0800, Daniele Ceraolo Spurio wrote:
> > > > 
> > > > 
> > > > On 12/19/2023 9:28 AM, Matthew Brost wrote:
> > > > > The Guc CT has more than enabled / disables states rather it has 4. The
> > > > > 4 states are not initialized, disabled, drop messages, and enabled.
> > > > > Change the code to reflect this. These states will enable proper return
> > > > > codes from functions and therefore enable proper error messages.
> > > > 
> > > > Can you explain a bit more in which situation we expect to drop messages and
> > > > handle it? AFAICS not all callers waiting for a G2H reply can cope with the
> > > 
> > > Anything that requires a G2H reply must be able to cope with it getting
> > > dropped as the GuC can hang at any moment. Certainly all of submission
> > > is designed this way, so is TLB invalidations. More on that below. With
> > > everything being able to cope with lost G2H their is not a point to
> > > continue to process G2H once a reset has started (or send H2G either).
> > > 
> > > > reply not coming; e.g. it looks like xe_gt_tlb_invalidation_wait() will
> > > 
> > > During a GT reset xe_gt_tlb_invalidation_reset() is called which will
> > > signal all waiters for invalidations avoiding timeouts.
> > > 
> > > So the flow roughly is:
> > > 
> > > Set CT channel to drop messages
> > > Stop all submissions
> > > Do reset
> > > Signal TLB invalidation waiters.
> > > 
> > 
> > Ah, forgot a key detail here. Setting CT channel to drop message before
> > do the reset is key here - we don't want a G2H being processed to race
> > with cleaning up lost G2H in there reset step.
> > 
> > Matt
> > 
> > > > timeout and throw an error (which IMO is already an issue, because the reply
> > > > might be lost due to reset). I know that currently in all cases in which we
> > > > stop communication we do a reset, so the situation ends up ok, but there is
> > > > a pending series to remove the reset in the runtime suspend/resume scenario
> > > > (https://patchwork.freedesktop.org/series/122772/) in which case IMO we
> > > 
> > > This path we would want to put the GuC communication into a state where
> > > if messages send / recv this triggers an error. (-ENODEV).  We don't
> > > expect to suspend the device and then send / recv messages. That is the
> > > point of this patch - it is fine drop messages during a reset, not if
> > > during suspend or if CT has not yet been initialized.
> 
> Hi Matthew
> 
> During D3hot->D0 , currently GuC is reloaded during resume. This pending
> patch https://patchwork.freedesktop.org/series/122772/ only suspends/resumes
> CTB communication instead of reload .
> 
> Which states should be used in this case?
> 

I addressed this in my reply to Daniele, see '3. Runtime suspend'.

Matt

> Thanks
> Riana
> > > 
> > > Proper error messages will added based on these new states.
> > > 
> > > > don't want to drop messages but do a flush instead.
> > > > 
> > > 
> > > See above. Also unsure what you mean by flush here? Do you mean the G2H
> > > worker? I think that creates some dma-fencing (or lockdep) nightmares if
> > > we do that.
> > > 
> > > Matt
> > > 
> > > > Daniele
> > > > 
> > > > > 
> > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_guc.c          |  4 +-
> > > > >    drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
> > > > >    drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
> > > > >    drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
> > > > >    4 files changed, 64 insertions(+), 21 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > > index 482cb0df9f15..9b0fa8b1eb48 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > > @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> > > > >    	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> > > > > -	xe_assert(xe, !guc->ct.enabled);
> > > > > +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> > > > >    	xe_assert(xe, len);
> > > > >    	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> > > > >    	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> > > > > @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
> > > > >    {
> > > > >    	int ret;
> > > > > -	xe_guc_ct_disable(&guc->ct);
> > > > > +	xe_guc_ct_drop_messages(&guc->ct);
> > > > >    	ret = xe_guc_submit_stop(guc);
> > > > >    	if (ret)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > index 24a33fa36496..22d655a8bf9a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > @@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
> > > > >    	return ret > 0 ? -EPROTO : ret;
> > > > >    }
> > > > > +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> > > > > +				enum xe_guc_ct_state state)
> > > > > +{
> > > > > +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> > > > > +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> > > > > +
> > > > > +	ct->g2h_outstanding = 0;
> > > > > +	ct->state = state;
> > > > > +
> > > > > +	spin_unlock_irq(&ct->fast_lock);
> > > > > +	mutex_unlock(&ct->lock);
> > > > > +}
> > > > > +
> > > > >    int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > > >    {
> > > > >    	struct xe_device *xe = ct_to_xe(ct);
> > > > >    	int err;
> > > > > -	xe_assert(xe, !ct->enabled);
> > > > > +	xe_assert(xe, !xe_guc_ct_enabled(ct));
> > > > >    	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > > > >    	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > > > > @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > > >    	if (err)
> > > > >    		goto err_out;
> > > > > -	mutex_lock(&ct->lock);
> > > > > -	spin_lock_irq(&ct->fast_lock);
> > > > > -	ct->g2h_outstanding = 0;
> > > > > -	ct->enabled = true;
> > > > > -	spin_unlock_irq(&ct->fast_lock);
> > > > > -	mutex_unlock(&ct->lock);
> > > > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > > > >    	smp_mb();
> > > > >    	wake_up_all(&ct->wq);
> > > > > @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > > > >    void xe_guc_ct_disable(struct xe_guc_ct *ct)
> > > > >    {
> > > > > -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> > > > > -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> > > > > -	ct->enabled = false; /* Finally disable CT communication */
> > > > > -	spin_unlock_irq(&ct->fast_lock);
> > > > > -	mutex_unlock(&ct->lock);
> > > > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> > > > > +}
> > > > > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
> > > > > +{
> > > > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
> > > > >    	xa_destroy(&ct->fence_lookup);
> > > > >    }
> > > > > @@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> > > > >    		goto out;
> > > > >    	}
> > > > > -	if (unlikely(!ct->enabled)) {
> > > > > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > > > > +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
> > > > >    		ret = -ENODEV;
> > > > >    		goto out;
> > > > >    	}
> > > > > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
> > > > > +		ret = -ECANCELED;
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > > > > +
> > > > >    	if (g2h_fence) {
> > > > >    		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> > > > >    		num_g2h = 1;
> > > > > @@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
> > > > >    		return false;
> > > > >    #define ct_alive(ct)	\
> > > > > -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> > > > > +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > > > > +	 !ct->ctbs.g2h.info.broken)
> > > > >    	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
> > > > >    		return false;
> > > > >    #undef ct_alive
> > > > > @@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> > > > >    	lockdep_assert_held(&ct->fast_lock);
> > > > > -	if (!ct->enabled)
> > > > > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > > > > +	    ct->state == XE_GUC_CT_STATE_DISABLED)
> > > > >    		return -ENODEV;
> > > > > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
> > > > > +		return -ECANCELED;
> > > > > +
> > > > >    	if (g2h->info.broken)
> > > > >    		return -EPIPE;
> > > > > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > > > > +
> > > > >    	/* Calculate DW available to read */
> > > > >    	tail = desc_read(xe, g2h, tail);
> > > > >    	avail = tail - g2h->info.head;
> > > > > @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > > > >    		return NULL;
> > > > >    	}
> > > > > -	if (ct->enabled) {
> > > > > +	if (xe_guc_ct_enabled(ct)) {
> > > > >    		snapshot->ct_enabled = true;
> > > > >    		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
> > > > >    		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > index f15f8a4857e0..214a6a357519 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > @@ -13,6 +13,7 @@ struct drm_printer;
> > > > >    int xe_guc_ct_init(struct xe_guc_ct *ct);
> > > > >    int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > > > >    void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > > > > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
> > > > >    void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > > > >    struct xe_guc_ct_snapshot *
> > > > > @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > > > >    void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> > > > >    void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> > > > > +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > > > > +{
> > > > > +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > > > > +}
> > > > > +
> > > > >    static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > > > >    {
> > > > >    	wake_up_all(&ct->wq);
> > > > > -	if (ct->enabled)
> > > > > +	if (xe_guc_ct_enabled(ct))
> > > > >    		queue_work(system_unbound_wq, &ct->g2h_worker);
> > > > >    	xe_guc_ct_fast_path(ct);
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > > index d814d4ee3fc6..e36c7029dffe 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > > > @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
> > > > >    	struct guc_ctb_snapshot h2g;
> > > > >    };
> > > > > +/**
> > > > > + * enum xe_guc_ct_state - CT state
> > > > > + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
> > > > > + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> > > > > + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
> > > > > + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
> > > > > + */
> > > > > +enum xe_guc_ct_state {
> > > > > +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> > > > > +	XE_GUC_CT_STATE_DISABLED,
> > > > > +	XE_GUC_CT_STATE_DROP_MESSAGES,
> > > > > +	XE_GUC_CT_STATE_ENABLED,
> > > > > +};
> > > > > +
> > > > >    /**
> > > > >     * struct xe_guc_ct - GuC command transport (CT) layer
> > > > >     *
> > > > > @@ -96,8 +110,8 @@ struct xe_guc_ct {
> > > > >    	u32 g2h_outstanding;
> > > > >    	/** @g2h_worker: worker to process G2H messages */
> > > > >    	struct work_struct g2h_worker;
> > > > > -	/** @enabled: CT enabled */
> > > > > -	bool enabled;
> > > > > +	/** @state: CT state */
> > > > > +	enum xe_guc_ct_state state;;
> > > > >    	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> > > > >    	u32 fence_seqno;
> > > > >    	/** @fence_lookup: G2H fence lookup */
> > > > 
