Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC5AC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369B510E16C;
	Fri,  3 Nov 2023 15:20:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5289310E16C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699024853; x=1730560853;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zOgGrmEKifi3xyy/MECLLooxwzTtHfIi5zhpm2aQGLM=;
 b=cEyVfUXztVluFMBdgtSFjCAsD7STczduEMUOWqm9EzNwJbNWJaJvZoAO
 LFATMfBBNs0o60fXJR/xlprhkyF1hxpfBLdIezmv1s9cQQ/pFzLgEH8pB
 pn2jrbUOIygZ9MRPBleaRAg/rZ9O68021eMmogacf4IF4fbmjr3Bue3oU
 N+WX4lPKg7p/RiWYugqC4kE1yE5dN93ak6sdCy1zDF6I3TQoLMAaCFnG9
 o3J/KiuVCIoy7BW3c5NjOoXIjr/tPZBElH4HFCVXplo7Qrpx2HhfRbnRr
 BJkuVro7lnHnv6xBooqGnA9zKgyugoAbOIcg8nmbLxRTsKVx/U//e+Xo5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10497587"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="10497587"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="761645686"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="761645686"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 08:20:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 08:20:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 08:20:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 08:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQV3ILqL5ZYmju4Sq3NN5FXOyNwwsG4oOzOn2o2Smw98bmayr54oteTeXeCL36LJ3QFwJNZaFuKxmpH9c5/QeL9lABlPRqk6jIQMauOwYpLsQEvslNr/VxqOo9Sjgl5aJ0T7owRoDqoPV8pWaXrqJg7pwQUyxYqGqQIYy6/E+NkiLhRKdh2WJGs7WRBSuIjpb87DUcZOzCd/ei+jhaxt93KJ6nq4dtLE0D0BLnXTThiohRQxw3JlzvD2AoGj2KTh0joqzVFgg1UrArBw+fKJ2QBp4Thhxi33w8YbLjHHqr/1It5rn1bnTLjzXdzT/RnAdZatltY/i/NSTaRrWMl9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/Y2rM3VkP3VnDp74wiMTzm8m9HtlpcEKPe23yvPAXM=;
 b=jAqNwBJYaZ0lXeBigojkt64/qPOM0RSpEbGGMt3sjKc9FlH0KD34qiQt51ffvRIRXbBoq8X6UqwwtVE2BWs61wEmbkmDrh4Bt/9mgXfYnMZHNCj0qMhdhAVwLtziIM1jH0Z76RTrrdd72l8Y/toz7X3/4lXS9LEZY75vkIiVWWRyCZB5vruH9olfoIuQQH/1b6N6X9xXp3qwCBVRbuXAt7lwy9ApZa7qtOiRsHECTk44VPcanzQqT9h3uEdNp20hj0ktWgvmJteBJh1YiCYovDXY9FZymTOKK1tL/A8M/wkc84wqEHedHiedV26ahP2iFOqEvAHcNxlPzDD5m/0fvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Fri, 3 Nov
 2023 15:20:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 15:20:49 +0000
Date: Fri, 3 Nov 2023 15:20:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Message-ID: <ZUUPy7DtDds0d7Ih@DUT025-TGLU.fm.intel.com>
References: <20231103014309.13927-1-brian.welty@intel.com>
 <SA1PR11MB6991A3545369C82321D3F06592A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <bf600a6ec499ed6b8367759340f546c51d744686.camel@intel.com>
 <SA1PR11MB6991A29876A71CE58F2105B592A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB6991A29876A71CE58F2105B592A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1a20c1-1c1e-455e-fb73-08dbdc807583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lWlpact6gsMKvtt/WaYYfuD4axgqooFyxmm5eZOuYRFNDKuhHsgKVDFMQJjqaD5PBwqBoTA62gn/6N1SzmqwVP4iMQ/TxAqvJyl2eKAPKxWn4ymDMO08dOlXzC4Pz1c8/yJ6n0OH4HwBxE04b2R0eVJkn64XQJ2MJsm1rW3hGNopWhSjMIYh3zaoX8AIER/L5Nd8zmsN2MWwt0t1HpfeUF5Yy/aEJO/5gis5URuJWFjPU9swHLyRyBmVx2KgB1s0UEt2m+vQSYMNSUstR1Gjnc+c6zsFlrhiSqiGdMtyp9IcbB9JGjWKk81tgEfJhgrDK828HOFkz56xiEs1+VOWGJbVSRrKC0BmMgOvFLTmBAKIqFkR++yTAKW61ilt6cxDCd4RKnbZtElLnIgQp0m3fRgbpFJoAzO7XXhWT7OP5ZtWEcu42pWRMSvBUVa+8WwTzt3s+VQSx7zdj+dMhIywf9rahbKQ+tZbiGo2qUhepR36VmYxS9wvEsFEwx1NC4Ceuvgt1nM5afEDhPBKMQzPD9kNEe9ftTksNO/V0FtQLslsBynbShF0Cn6Z3L5appcw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6506007)(66556008)(66476007)(54906003)(316002)(6636002)(478600001)(6486002)(6512007)(53546011)(107886003)(26005)(66946007)(6666004)(6862004)(4326008)(8676002)(8936002)(41300700001)(83380400001)(44832011)(5660300002)(86362001)(2906002)(30864003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?G2YC4TgP8G3IQCujDsLS9rWfd+N0ia503U51Rj9q1/+Y4IwMDukF2NMGjM?=
 =?iso-8859-1?Q?yulvxvDUaPQeSiusRJseCJisVpDYvbwm2wtx8mQksl8I5lAtIcxIBSdyAQ?=
 =?iso-8859-1?Q?Btmz6SPIQFFD3y3vwug2XoicF7PjwvN57MTSylqEoBNENelf6ZwEfYskD/?=
 =?iso-8859-1?Q?esLZFB4uxAN8J8H/AIlP9Zzf6rZiBeEb06hEWd+Z+QqPjpMTQBVpRGWOrq?=
 =?iso-8859-1?Q?JcL71sgP9hH/DcGNDGl+/zQgzvPFQHzT/b6P5L1x4uw6Aj7mDnjX5GFIm1?=
 =?iso-8859-1?Q?vJv4eGyt4pFCuePBaqPWJUeBQO1cLRfdB3f75r4EsZ22GmfVz7NTi+JOsj?=
 =?iso-8859-1?Q?6xYFlvbvb2hdBk0v9XQPmBfy4zx3bO48lQW/nvloEwhaqoFPRA0LYU+8jo?=
 =?iso-8859-1?Q?/qbPO87F5qDrU5EJsIplXVHYfrzO8utC79sLM8fUOebrkZ1pVLYMHowsXF?=
 =?iso-8859-1?Q?U6mwTFw3Ril+Ni/2U/tWMpUHVXlRvDscavH3QUD+5cudII3H3xXS+2GWpT?=
 =?iso-8859-1?Q?BAoFr3YGydwjbgw42tQ4IK2fPPcqBWw9UsGar6HO/sDYhhXzFZuMFUyCqc?=
 =?iso-8859-1?Q?3prQJqFnSnI48bZ9Gc7qNYdWuz4tGPT64VsJUabugBeWC2rKdAN7U4u/b7?=
 =?iso-8859-1?Q?/tvhgb+uC9zLmiHKlTilcAJuhbsg0Yk85rb5MHDfSwoJSokpi1tEHUlUas?=
 =?iso-8859-1?Q?3b6ftTiFJ1JIt6eWEh8596Zpmn3OsNcyBvq/DHQ3+KuZzsnDUn1F1tkToN?=
 =?iso-8859-1?Q?a1FlE0tvXYH8AL+ZuRgSzbC5MKQbNl6lqvwIlDbPBVb4hktUbgjbhAzBE2?=
 =?iso-8859-1?Q?MoXja6/Cs30fVMyxjtcuJ17pBP1Er51rvPvXaSACuEYD7QNxCT2XARzC2G?=
 =?iso-8859-1?Q?mLUDPke9hWNIaJMmPb0nIgymDxjIOi2MAvdt8E7dj2i42t/q4DE0Rv71jE?=
 =?iso-8859-1?Q?4h+EE59Kj+flK+2D3cAHZKwbxmU9y+Hifin/kxzGxyOySf7QnJ1a5LSOul?=
 =?iso-8859-1?Q?DxVYSY3aVYG9vre6cb4tTQhuDo5kC50ghsx2sI2s5MXPuYf9RPNZ3AJmXd?=
 =?iso-8859-1?Q?ke/34XFAq7d8qM9Tkw3m1Zpzo5HH0DGsx9g7aXtFwov0zO/WfpHOFzlinM?=
 =?iso-8859-1?Q?9Gq+vy5W1J6zkLDVGmUv+eCiXClIQCnc7k5OelhBGLq+sdwfFW3rYaQZvM?=
 =?iso-8859-1?Q?I6Ez4xm2e2uDGcH9fAcHEKeCHer6Tj6yn1omlepkHf0M9LLxVTtMHuQy7p?=
 =?iso-8859-1?Q?LjXU8Xp37STKmYDUOlaSq3jDByLccGhkvsXFNqlIZEmGXr2Ci/pqBIecij?=
 =?iso-8859-1?Q?W1zhqwqAJMDDdbkYg3sqMmnHTTa9+P11mVRHOaQ9xvNwa57qiA0GmzNZ54?=
 =?iso-8859-1?Q?yuGbvj96DFYLBjBiB539m9pzt3NyKOIAuZes6O0N5lRQTo/ccetYEeExMD?=
 =?iso-8859-1?Q?aFK1yHJP6dVqV7PNJdnUw8DR5zZMeA48UnNU+V7arl4eM58FqHOOuC8Nns?=
 =?iso-8859-1?Q?M/zTXtlHqoazvDHdkieN01tt3KMefrkW+LWOd3HFAxPXgMTT/8pXpcSkqu?=
 =?iso-8859-1?Q?H/jOWu9mwQ9SfkWTcbxBwlosjukX2wT7cIDOPGUAUNKPIc0EFTaJSacq+1?=
 =?iso-8859-1?Q?m7BnfRk1FQFBQqTTUgJCAEWHfsHIn1+0wYn22L8hwF3G22kJRbZhrhiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1a20c1-1c1e-455e-fb73-08dbdc807583
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 15:20:49.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aD7pOw49HE5cRZsmM8yVOfI/XAr7nuY0Gc4OwJUgW5ZmMRYfYzf0Tb2JNZeT6l9eJuBG8teDznvTgkyg3Ut5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
 worker functions
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 03, 2023 at 03:08:41PM +0000, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Summers, Stuart <stuart.summers@intel.com>
> > Sent: Friday, November 3, 2023 10:51 AM
> > To: intel-xe@lists.freedesktop.org; Welty, Brian <brian.welty@intel.com>; Zeng,
> > Oak <oak.zeng@intel.com>
> > Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
> > worker functions
> > 
> > On Fri, 2023-11-03 at 02:46 +0000, Zeng, Oak wrote:
> > > Hi,
> > >
> > > Can someone explain why we introduced an circular buffer for page
> > > fault handling in xekmd?
> > >
> > > I915 page fault is also handled in a work queue/worker way. Whenever
> > > we have a guc2host request, we queue_work to process the incoming
> > > request. No circular buffer. We didn't have a problem there.
> > 
> > i915 also uses a circular buffer:
> 
> By circular buffer, I meant the struct pf_queue::data. Xekmd copy the page fault request to this buffer and process it in a worker. This buffer is a xekmd internal thing.
> 
> While in below code i915 handle request directly in a loop. The request circular buffer is co-maintained by kmd and guc.  No above intermediate buffer.
> 

In Xe we have a dedicated worker / queue to sink page faults into
(pf_queue::data). This is needed as faults cannot be directly processed
in the CT handler as this in the dma-fence signaling path (no memomry
allocations allowed) as this will deadlock if the CT can't independently
make forward progress. Fault are pushed this worker / queue from the CT
handler. As we can't allocate memory in the CT this worker / queue is a
preallocated circular buffer. I hope this clears this up.

Matt

> > static noinline void ct_incoming_request_worker_func(struct work_struct
> > *w)
> > {
> >         struct intel_guc_ct *ct =
> >                 container_of(w, struct intel_guc_ct, requests.worker);
> >         bool done;
> > 
> >         do {
> >                 done = ct_process_incoming_requests(ct, &ct-
> > >requests.incoming);
> >         } while (!done);
> > }
> > 
> > The issue with Xe here is the queue_work function is used to queue each
> > incoming fault. If we get too many concurrent faults though, there's a
> > chance we could queue something while a prior fault is in the process
> > of being launched. In that case the queue_work() function will return
> > false and we miss the fault handling.
> > 
> > In the i915 case (see above), we do handle this in a worker, but we
> > continue to handle requests from the GuC until nothing is left to
> > handle - circular buffer. In that case, the worker queue processing
> > those incoming CT requests shouldn't ever hit that corner case of
> > queue_work() returning false.
> 
> So isn't i915 way better?
> 
> Oak
> > 
> > Thanks,
> > Stuart
> > 
> > >
> > > Thanks,
> > > Oak
> > >
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
> > > > Of Brian Welty
> > > > Sent: Thursday, November 2, 2023 9:43 PM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Subject: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access
> > > > counter worker
> > > > functions
> > > >
> > > > When processing G2H messages for pagefault or access counters, we
> > > > queue a
> > > > work item and call queue_work(). This fails if the worker thread is
> > > > already
> > > > queued to run.
> > > > The expectation is that the worker function will do more than
> > > > process a
> > > > single item and return. It needs to either process all pending
> > > > items or
> > > > requeue itself if items are pending. But requeuing will add latency
> > > > and
> > > > potential context switch can occur.
> > > >
> > > > We don't want to add unnecessary latency and so the worker should
> > > > process
> > > > as many faults as it can within a reasonable duration of time.
> > > > We also do not want to hog the cpu core, so here we execute in a
> > > > loop
> > > > and requeue if still running after more than 20 ms.
> > > > This seems reasonable framework and easy to tune this further if
> > > > needed.
> > > >
> > > > This resolves issues seen with several igt@xe_exec_fault_mode
> > > > subtests
> > > > where the GPU will hang when KMD ignores a pending pagefault.
> > > >
> > > > v2: requeue the worker instead of having an internal processing
> > > > loop.
> > > > v3: implement hybrid model of v1 and v2
> > > >     now, run for 20 msec before we will requeue if still running
> > > >
> > > > Signed-off-by: Brian Welty <brian.welty@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 ++++++++++++++++--------
> > > > ----
> > > >  1 file changed, 46 insertions(+), 34 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index ab6daebbd77c..c99af751d1fb 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -276,10 +276,10 @@ static void print_pagefault(struct xe_device
> > > > *xe, struct
> > > > pagefault *pf)
> > > >
> > > >  #define PF_MSG_LEN_DW  4
> > > >
> > > > -static int get_pagefault(struct pf_queue *pf_queue, struct
> > > > pagefault *pf)
> > > > +static bool get_pagefault(struct pf_queue *pf_queue, struct
> > > > pagefault *pf)
> > > >  {
> > > >         const struct xe_guc_pagefault_desc *desc;
> > > > -       int ret = 0;
> > > > +       bool ret = false;
> > > >
> > > >         spin_lock_irq(&pf_queue->lock);
> > > >         if (pf_queue->head != pf_queue->tail) {
> > > > @@ -303,8 +303,7 @@ static int get_pagefault(struct pf_queue
> > > > *pf_queue, struct
> > > > pagefault *pf)
> > > >
> > > >                 pf_queue->head = (pf_queue->head + PF_MSG_LEN_DW) %
> > > >                         PF_QUEUE_NUM_DW;
> > > > -       } else {
> > > > -               ret = -1;
> > > > +               ret = true;
> > > >         }
> > > >         spin_unlock_irq(&pf_queue->lock);
> > > >
> > > > @@ -348,6 +347,8 @@ int xe_guc_pagefault_handler(struct xe_guc
> > > > *guc, u32 *msg,
> > > > u32 len)
> > > >         return full ? -ENOSPC : 0;
> > > >  }
> > > >
> > > > +#define USM_QUEUE_MAX_RUNTIME_MS       20
> > > > +
> > > >  static void pf_queue_work_func(struct work_struct *w)
> > > >  {
> > > >         struct pf_queue *pf_queue = container_of(w, struct
> > > > pf_queue, worker);
> > > > @@ -355,31 +356,37 @@ static void pf_queue_work_func(struct
> > > > work_struct *w)
> > > >         struct xe_device *xe = gt_to_xe(gt);
> > > >         struct xe_guc_pagefault_reply reply = {};
> > > >         struct pagefault pf = {};
> > > > +       unsigned long threshold;
> > > >         int ret;
> > > >
> > > > -       ret = get_pagefault(pf_queue, &pf);
> > > > -       if (ret)
> > > > -               return;
> > > > +       threshold = jiffies +
> > > > msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > > >
> > > > -       ret = handle_pagefault(gt, &pf);
> > > > -       if (unlikely(ret)) {
> > > > -               print_pagefault(xe, &pf);
> > > > -               pf.fault_unsuccessful = 1;
> > > > -               drm_dbg(&xe->drm, "Fault response: Unsuccessful
> > > > %d\n", ret);
> > > > -       }
> > > > +       while (get_pagefault(pf_queue, &pf)) {
> > > > +               ret = handle_pagefault(gt, &pf);
> > > > +               if (unlikely(ret)) {
> > > > +                       print_pagefault(xe, &pf);
> > > > +                       pf.fault_unsuccessful = 1;
> > > > +                       drm_dbg(&xe->drm, "Fault response:
> > > > Unsuccessful %d\n",
> > > > ret);
> > > > +               }
> > > > +
> > > > +               reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
> > > > +                       FIELD_PREP(PFR_SUCCESS,
> > > > pf.fault_unsuccessful) |
> > > > +                       FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> > > > +                       FIELD_PREP(PFR_DESC_TYPE,
> > > > FAULT_RESPONSE_DESC) |
> > > > +                       FIELD_PREP(PFR_ASID, pf.asid);
> > > >
> > > > -       reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
> > > > -               FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
> > > > -               FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> > > > -               FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> > > > -               FIELD_PREP(PFR_ASID, pf.asid);
> > > > +               reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
> > > > +                       FIELD_PREP(PFR_ENG_INSTANCE,
> > > > pf.engine_instance) |
> > > > +                       FIELD_PREP(PFR_ENG_CLASS, pf.engine_class)
> > > > |
> > > > +                       FIELD_PREP(PFR_PDATA, pf.pdata);
> > > >
> > > > -       reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
> > > > -               FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
> > > > -               FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
> > > > -               FIELD_PREP(PFR_PDATA, pf.pdata);
> > > > +               send_pagefault_reply(&gt->uc.guc, &reply);
> > > >
> > > > -       send_pagefault_reply(&gt->uc.guc, &reply);
> > > > +               if (time_after(jiffies, threshold)) {
> > > > +                       queue_work(gt->usm.pf_wq, w);
> > > > +                       break;
> > > > +               }
> > > > +       }
> > > >  }
> > > >
> > > >  static void acc_queue_work_func(struct work_struct *w);
> > > > @@ -544,10 +551,10 @@ static int handle_acc(struct xe_gt *gt,
> > > > struct acc *acc)
> > > >
> > > >  #define ACC_MSG_LEN_DW        4
> > > >
> > > > -static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
> > > > +static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
> > > >  {
> > > >         const struct xe_guc_acc_desc *desc;
> > > > -       int ret = 0;
> > > > +       bool ret = false;
> > > >
> > > >         spin_lock(&acc_queue->lock);
> > > >         if (acc_queue->head != acc_queue->tail) {
> > > > @@ -567,8 +574,7 @@ static int get_acc(struct acc_queue *acc_queue,
> > > > struct acc
> > > > *acc)
> > > >
> > > >                 acc_queue->head = (acc_queue->head +
> > > > ACC_MSG_LEN_DW) %
> > > >                                   ACC_QUEUE_NUM_DW;
> > > > -       } else {
> > > > -               ret = -1;
> > > > +               ret = true;
> > > >         }
> > > >         spin_unlock(&acc_queue->lock);
> > > >
> > > > @@ -581,16 +587,22 @@ static void acc_queue_work_func(struct
> > > > work_struct *w)
> > > >         struct xe_gt *gt = acc_queue->gt;
> > > >         struct xe_device *xe = gt_to_xe(gt);
> > > >         struct acc acc = {};
> > > > +       unsigned long threshold;
> > > >         int ret;
> > > >
> > > > -       ret = get_acc(acc_queue, &acc);
> > > > -       if (ret)
> > > > -               return;
> > > > +       threshold = jiffies +
> > > > msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > > >
> > > > -       ret = handle_acc(gt, &acc);
> > > > -       if (unlikely(ret)) {
> > > > -               print_acc(xe, &acc);
> > > > -               drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
> > > > +       while (get_acc(acc_queue, &acc)) {
> > > > +               ret = handle_acc(gt, &acc);
> > > > +               if (unlikely(ret)) {
> > > > +                       print_acc(xe, &acc);
> > > > +                       drm_warn(&xe->drm, "ACC: Unsuccessful
> > > > %d\n", ret);
> > > > +               }
> > > > +
> > > > +               if (time_after(jiffies, threshold)) {
> > > > +                       queue_work(gt->usm.acc_wq, w);
> > > > +                       break;
> > > > +               }
> > > >         }
> > > >  }
> > > >
> > > > --
> > > > 2.38.0
> > >
> 
