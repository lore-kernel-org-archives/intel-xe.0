Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CF8C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 14:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B3D10E95A;
	Thu, 11 Jan 2024 14:19:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E99B10E95A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704982758; x=1736518758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mn0QzdpdVQgLYMr6kkjpW+H7djaN5Ub707/tUcviOu8=;
 b=Iz5I6monLd44guDhaI0knhwmdQvCBnNMdyizNYrG5YG7xunBwWW8KNVM
 BZpR3C33ZDLJ8pprlAjN0MuVtEuBuBtuusiyp1GNCh5yB8lyH/lEgvwru
 SMeUN+d3Mef5u2EPRJ8No5mxYezVbKIjrKAYabXse1Qh2Arrs1rmoZJbC
 wtevzZ+zEju1NRcDaS+ANioS0KDkGm0t+l3tAwbChWpkP+M5y0q14CEAk
 JaYVKxlv/yxE/AT3ZKb5wVFNG6se/5JhoCmxHlBtS9ZDIKESaBizZV3Lv
 yyVtH1cKkKoi5ozft6TX/LGd8bXrZnJfWGA4uDwHGf7M+avOlQbRMZzOl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12348146"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="12348146"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 06:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="905963371"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="905963371"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 06:19:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 06:19:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 06:19:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 06:19:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 06:19:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAZZT+ArJa6jv9K4sj1inmbaBiXgpvCNzBbsrCg9Fj39ZbFTh5d9XgRtDEokeXqmf5pgmp6EUUWPuARTYDiM4lpDfylBYDjWows1twhrGMLP+s6DaXdjUOHvWRwekf6Jm7C4oAO1JmS3GGaXocCk6+H/1JZXvTBjg7QRCPpC/VOgwM2bkyyGL4ZopcORsxI8f2XsPE9NqY7XzDM2ZelljRNu9AH3/Z6l0hlqHEEqM3ngZ/wOfxLTiiddpYUMrAItANDzw7EigfIOqeoZLTHvbZVdfWBx39Vu8RcdSHY1RFV9X43BUabHecOp9oYuVOTlSFSMxESTKWOkLGi4NI9Mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYIrl8d5ixHLPjuCGfz3oyIWT2bSY2GlTAw4gtpWx4I=;
 b=Cy34UYE3WVwO4j38QsFf1PjVVM1o53WNpPxF7NMA8S7Zb6lx6ZARPspHVj9UHQI10VukGzvNdlbBuS/rdT/WcsMsKyewcXfQSloYne2MnwvMpdmuHQKIrOFN/TexkgiIsdu7fTtnEEcuQxnIoWH5bV/kLO2wYz5syzd+8GlrC9K6d0vLEfdJD12y9TBITs2qtBaApqH/5WTEEamTtWFVb4CS+S2y22Ef6CLP5z8uim8CDgfVGhk6AVStth52H8zPS0wFHsDprqKIa+9QKtzfN1xgw5HlEng9/gboWz9Y7mUPH2MbaH1W5CAWBytt5/hrR5Ylkq4BC4dfuzX6/2aE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 14:19:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 14:19:11 +0000
Date: Thu, 11 Jan 2024 14:17:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC 16/20] drm/xe: Remove mem_access calls from migration
Message-ID: <ZZ/4k+uxYwWQN66m@DUT025-TGLU.fm.intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-17-rodrigo.vivi@intel.com>
 <0c1b0948-0a00-4881-af37-e47573687c0e@intel.com>
 <ZZ2JW1NQVVkNMsAw@intel.com>
 <062c816f-b825-4b8c-aacf-2e4221398455@intel.com>
 <ZZ3LU889odBd3mrh@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZZ3LU889odBd3mrh@intel.com>
X-ClientProxiedBy: SJ0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ecc20b9-5293-4008-a05d-08dc12b04850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7p+pXu9mMMHMXKPad6C0OCRjgnNsXZokywmlgQtgEkHeDrkld5Jqad5y46txfkGa2NUKCfO1eJIN1rA6/aAHtL23b44pg6/tdy91Kriy4oet/P+d6AitfvLVDMF8M93emL0GKKXFRM+q0f3TEsT6R5in8MTRk0YK3rLvIBSPD6JV1T1XKsxRoXdcps0JbdJdq9EgG/WlkXXz1kTJpidsmgMvTSiND5UmSn5zjj8cL3j8X0eCJpuLKUaQYbS6zJqc+r2/EuKEOzUmNhx4rz11JlckYIXj2jZb1mF8M606WB+BYOZFmRhLHuIBgVS5HTXACnPI81788MFHr8y4UjpZ1/Y9jU1VTnJo0c78+qWhynbIOtJl/lUS3tST5J2+9QQ2GcfWrUwv6zyRm7yPbdMNiQ5yd9o68aAryXSufTP+UJY4yz+U7JJXWgNCXAqv3zRQDz/EgRVgIFKflumtchbx83n60as4CO6QhTCZLYdOVuIDcNbZ2Pmaoww7P/95yRmIaMYzna8YJdN2uLt1ZfsxpY+6CJmy7IHKmBXAsUAXco=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(44832011)(8676002)(6506007)(82960400001)(478600001)(38100700002)(966005)(6486002)(83380400001)(86362001)(26005)(6512007)(8936002)(316002)(6666004)(4326008)(6862004)(53546011)(41300700001)(66946007)(66476007)(66556008)(6636002)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xx411o8iQTN9XcvmWj83GMCoasPRrd2abgeJ7orAdt+/z8JGSV6x9TkyPzYO?=
 =?us-ascii?Q?4SAUSk54nOAyN26yjePzaNCU1vy5NQK9ICLEHj7vGUhMoBqZRC92NIxOY68t?=
 =?us-ascii?Q?98ZaOio2kdpAWGH9U4Bo663r69diEa0rIhxpOT7W0yBUh7TrAsPvGTM/e9qA?=
 =?us-ascii?Q?r5tu08BcGcDnzovF8hKlvDufVEQLhwBOFtFk+Kmv8dM7J2Cb8xrakW9b91Sb?=
 =?us-ascii?Q?ME7ADjmzMW74CDBuEZtSGHP07brzEr/5Or2ygqNfNsScmTyPeplIjcQUo9EM?=
 =?us-ascii?Q?0nGWtm42PTa1Te3m+YpBDsb8tPpJYuZu6EmQitSNsG12VJU0rhjCP2SWBiCX?=
 =?us-ascii?Q?9NdHa0eUFS7lYh7FVe1rQLHs3ng4GI7o+xxXNhNP+z/68UsJJcuQu0BcVGSc?=
 =?us-ascii?Q?oxioy2RxJHjYHjIJKmz6yMxzvV0ajTKoIbCzM+dLBWUv/3c+onGodAIj44BD?=
 =?us-ascii?Q?h7r5IJHF0B9GUjb7xIN5Mo6hscpfezCif6QB7/xBR7RT3MeyjgkUo+H81XU0?=
 =?us-ascii?Q?CWnVwqM7SADNwtn3lS9oGSK9BRmQ/mZBonQXdbUXrRrnMrT2X1HXT7HEUyu1?=
 =?us-ascii?Q?W020GG6nX6ESv/mHaa/v23tJmTploZrJ32psaZtOyKljzOXI7rlUD6BAfFJg?=
 =?us-ascii?Q?c8CXL29wnbMJc7qnv3tcAkYmmYuHcKGG++5Ce22UNfvDBXyaesSvAFn66pzI?=
 =?us-ascii?Q?3ay0C4iRQ69F8XB/j+Q0Q6dPPzRmB87Lg+DZCoNk4Oq0npCfp/TZDQdt/r6G?=
 =?us-ascii?Q?mKCMzHLBVivqzBPqmoERGv+qbWQcrqe9G91Bu08dV0fuk7azMXUUFqNpTdTj?=
 =?us-ascii?Q?dNG+EuyBO+9BUcCRiG0WmDujDpirvpCC2WTe4rrEompSJnlEF2OoGf15hiR+?=
 =?us-ascii?Q?HWQkI0PXVDIpm0M3esvUH/+ryfhBShHOBxDWfzjyKR3PyXi/ck3NShMckUYj?=
 =?us-ascii?Q?ptZM1+riKrALxAU3Id7I44115mpdvPav+HEY7d/w6ZV9EiN7woDdBMWrK27D?=
 =?us-ascii?Q?oHoZgM5NJJ0JCvfPVgKPlfixhcP3xAF3SPc/nBIjxw6tuHtRgRgvThY926sK?=
 =?us-ascii?Q?/xcTXixqolyYv57MnWnKPJgexUVvpPayP/gVe2tRGz4LWAf5aypOkHnzEgHj?=
 =?us-ascii?Q?4N+sfy0X5R/YjFydvuApzL66HYibpTzgnGM35vuWvjBC38ETM5C4F3R5p1j9?=
 =?us-ascii?Q?03KzHnyJREheR+ARdztEtVx7lj5vpBy5E/+Ie1zvTIxMzfVo4oPMJ4Y9PvFm?=
 =?us-ascii?Q?HnLT7jvXpqmIZ1QIdD2ZfgLXMhugxIp5/4SjEswGARleuV1D0H6sMdwA8ZpP?=
 =?us-ascii?Q?USJWo9EcyOQtVJiiUfFzIMH0V2WglQdEwM4z1dKkjNVx7QzydHTc4QMHVAto?=
 =?us-ascii?Q?hqgoPRdGKDIyT6mGYT6v7LiELafwqndwPlz+cJqTiOosFxOKutya/tTUvGz2?=
 =?us-ascii?Q?wjmEk4v/W0DMcCjGiVTqTAWO2eNybz0R9ZImBwjI+H+gTchpJNzBV3Na3GA7?=
 =?us-ascii?Q?/IOlgTWbXqpBcytVfSbigMbm4z3mRdUGt5elZZoKh6RjgsWq3ICqH3drXFGE?=
 =?us-ascii?Q?MnyiXGT+adCqg+L3wDHM0YZ6CMaiRdATFDBLOqNoScDrftwfXQJnY24rZFT3?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecc20b9-5293-4008-a05d-08dc12b04850
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 14:19:11.7873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCo6Tk7g5qNKv7BXw6jMnRihmfzFBHGun8eECWW/2Qn3/Sg/T11GqHXeJs1xfLi5EyIzTh4eY770aCJT2zHbeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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

On Tue, Jan 09, 2024 at 05:40:19PM -0500, Rodrigo Vivi wrote:
> On Tue, Jan 09, 2024 at 06:49:47PM +0000, Matthew Auld wrote:
> > On 09/01/2024 17:58, Rodrigo Vivi wrote:
> > > On Tue, Jan 09, 2024 at 12:33:25PM +0000, Matthew Auld wrote:
> > > > On 28/12/2023 02:12, Rodrigo Vivi wrote:
> > > > > The sched jobs runtime pm calls already protects every execution,
> > > > > including these migration ones.
> > > > 
> > > > Is job really enough here? I assume queue is only destroyed once it has no
> > > > more jobs and the final queue ref is dropped. And destroying the queue might
> > > > involve stuff like de-register the context with GuC etc. which needs to use
> > > > CT which will need rpm ref. What is holding the rpm if not the vm or queue?
> > > 
> > > The exec queue is holding to the end.
> > 
> > Can you share some more details? AFAIK the queue destruction is async, and
> > previously the vm underneath is holding the rpm or in the case of migration
> > vm, if was the queue itself. But for the migration vm case that is removed
> > below. I guess I'm missing something here.
> 
> Cc: Matthew Brost
> 
> I had understood that every vm case would use the exec_queue and the destroy
> would cover them all. But if there's more VM operation happening beyond the
> exec_queue destroy, then we need something else?
> 
> Brost, any suggestion on an outer bound case here that we would be safe,
> but without entirely killing the RPM?
> 

Matthew Auld is correct and this issue #2 is my response to the cover
letter.

The code snippet I sent to the list [1] covers this with an outer bound
grabbing the PM ref in guc_exec_queue_process_msg with the CT layer
(__g2h_reserve_space) safely increasing the PM ref further down in the
call stack.

Matt

[1] https://patchwork.freedesktop.org/patch/573939/?series=128434&rev=1

> > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/tests/xe_migrate.c |  2 --
> > > > >    drivers/gpu/drm/xe/xe_device.c        | 17 -----------------
> > > > >    drivers/gpu/drm/xe/xe_device.h        |  1 -
> > > > >    drivers/gpu/drm/xe/xe_exec_queue.c    | 18 ------------------
> > > > >    4 files changed, 38 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > > > index 7a32faa2f6888..2257f0a28435b 100644
> > > > > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > > > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > > > @@ -428,9 +428,7 @@ static int migrate_test_run_device(struct xe_device *xe)
> > > > >    		kunit_info(test, "Testing tile id %d.\n", id);
> > > > >    		xe_vm_lock(m->q->vm, true);
> > > > > -		xe_device_mem_access_get(xe);
> > > > >    		xe_migrate_sanity_test(m, test);
> > > > > -		xe_device_mem_access_put(xe);
> > > > >    		xe_vm_unlock(m->q->vm);
> > > > >    	}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > > index ee9b6612eec43..a7bec49da49fa 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > @@ -675,23 +675,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
> > > > >    	XE_WARN_ON(xe_pm_runtime_suspended(xe));
> > > > >    }
> > > > > -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> > > > > -{
> > > > > -	bool active;
> > > > > -
> > > > > -	if (xe_pm_read_callback_task(xe) == current)
> > > > > -		return true;
> > > > > -
> > > > > -	active = xe_pm_runtime_get_if_active(xe);
> > > > > -	if (active) {
> > > > > -		int ref = atomic_inc_return(&xe->mem_access.ref);
> > > > > -
> > > > > -		xe_assert(xe, ref != S32_MAX);
> > > > > -	}
> > > > > -
> > > > > -	return active;
> > > > > -}
> > > > > -
> > > > >    void xe_device_mem_access_get(struct xe_device *xe)
> > > > >    {
> > > > >    	int ref;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > > index af8ac2e9e2709..4acf4c2973390 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > > @@ -142,7 +142,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> > > > >    }
> > > > >    void xe_device_mem_access_get(struct xe_device *xe);
> > > > > -bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
> > > > >    void xe_device_mem_access_put(struct xe_device *xe);
> > > > >    void xe_device_assert_mem_access(struct xe_device *xe);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > index 44fe8097b7cda..d3a8d2d8caaaf 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > @@ -87,17 +87,6 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> > > > >    	if (err)
> > > > >    		goto err_lrc;
> > > > > -	/*
> > > > > -	 * Normally the user vm holds an rpm ref to keep the device
> > > > > -	 * awake, and the context holds a ref for the vm, however for
> > > > > -	 * some engines we use the kernels migrate vm underneath which offers no
> > > > > -	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
> > > > > -	 * can perform GuC CT actions when needed. Caller is expected to have
> > > > > -	 * already grabbed the rpm ref outside any sensitive locks.
> > > > > -	 */
> > > > > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
> > > > > -		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> > > > > -
> > > > >    	return q;
> > > > >    err_lrc:
> > > > > @@ -172,8 +161,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
> > > > >    	for (i = 0; i < q->width; ++i)
> > > > >    		xe_lrc_finish(q->lrc + i);
> > > > > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> > > > > -		xe_device_mem_access_put(gt_to_xe(q->gt));
> > > > >    	if (q->vm)
> > > > >    		xe_vm_put(q->vm);
> > > > > @@ -643,9 +630,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > > >    			if (XE_IOCTL_DBG(xe, !hwe))
> > > > >    				return -EINVAL;
> > > > > -			/* The migration vm doesn't hold rpm ref */
> > > > > -			xe_device_mem_access_get(xe);
> > > > > -
> > > > >    			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> > > > >    			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
> > > > >    						   args->width, hwe,
> > > > > @@ -655,8 +639,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > > >    						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> > > > >    						    0));
> > > > > -			xe_device_mem_access_put(xe); /* now held by engine */
> > > > > -
> > > > >    			xe_vm_put(migrate_vm);
> > > > >    			if (IS_ERR(new)) {
> > > > >    				err = PTR_ERR(new);
