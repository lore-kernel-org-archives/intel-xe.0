Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F9C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 15:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB89610E0A0;
	Fri,  5 May 2023 15:10:12 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D400E10E0A0
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683299409; x=1714835409;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vz6Cux6gqq0FXEcxqxWuwBqCT/EBHiWaP6h4V+IQtdM=;
 b=P/jbXrczkaQi7jhKCSy3QRuVaQnC/ZjuyboeYdifq9SAhgmK7NzfnPM8
 kHlfoncDSEHq0+HwX3YbDnkXu58mJ3enH+30AlLSE/p2hqMESQ3oseQ5t
 43Ll3BKF0uEAoXJ5kZVuq+q8jofdj2jEAsqpc1yf+AGmW5aAlBF9ZijLN
 uWEpo4LuEcmPeIW/az0EDXC248sYF8D8KC4n4K6YH5BNpfgyt7yQNBdga
 6AHiM8uUPjPJoObGWsyZBfuPEVA+AkM0WJ/zYXYiV01dzPAM2iXXwLT3B
 JCA+QL6MJbDoyTM/kqiFiSeAPp+2OxbQ2FT5jbT1OR9QHhbW4amNFNrv2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="333650780"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="333650780"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697628184"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="697628184"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2023 08:10:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 08:10:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 08:10:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 08:10:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrjgT62pZ6QfBfiJJyAMODJDHyKUd+VVeF1DY7Uft1XyLUZH7z8NBmZmk+Pwr9bI5i9fZTH/Hl4hA07fs/1/DTj2J42NLemzOp+AFqJOzmhV0BdUHIt9ugGQ7wARoudF0NQzV5c5Zh2PMes5zcRal2/Fj3rgHftKWcbqwMc5bfTqVMkKSXTcmYYUrKj80EBZKwDJGEmn4SAsAWlNKHKE5hbSX5AWw+QlQYdVfYbKK/0qOKy+t0Q3DelsSr51YdeQOF7w+Hn7wSJHrXfwSZOuvs1VAKIk237s32rCYHuJhUXO4/XKT6ZDTGs5V2Q56JJRWVO8eUp40MhcnFFm1ucm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbTaMAfrusgY/+t3SpNc5GnDempHlj0f7Yss96lKV/c=;
 b=oR4TIvltwlXViGtbKGwSpWuvt/U0ZLnDBT6o+wF3d8x/641tOyMJ6bfQGb5QIAoVb8wv8vRCRdKZLd32qC80zqsAhOLSgIxShEc08MVhS7gMgmq51n0y49A+iSsYR44JBwBD9ZjMb7vAiXSQgcqJgABbIBQykURugMYKPIfCkJlto9AVzwLTAcqxwbw+oH+VSUtCCBktj/Zv4ynnctdc/5NYmwxI7DeWfbr9giymVlNlErRojPKtm/e78x0gy+6h11tQCU/reAzWqEvZVSQhvNkLOkKXEkVLc6s618J3bACk5p1mSbxVXf1VRC5DdXmp/pHWq5LEN34V2V/IcDhsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 15:10:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 15:10:05 +0000
Date: Fri, 5 May 2023 08:10:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Message-ID: <20230505151002.GI6250@mdroper-desk1.amr.corp.intel.com>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <20230406092631.2820028-3-himal.prasad.ghimiray@intel.com>
 <20230425002256.GK10045@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB7056F4BB0BE08B3A9772A8C1B36B9@MW4PR11MB7056.namprd11.prod.outlook.com>
 <20230504000253.GN10045@mdroper-desk1.amr.corp.intel.com>
 <1075c790-86bd-bc5a-3b3b-6b823ff7b205@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1075c790-86bd-bc5a-3b3b-6b823ff7b205@intel.com>
X-ClientProxiedBy: BYAPR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:40::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c4752d-8195-4a83-00b1-08db4d7acea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8L+hBM6njBZPYG3MyXhXvNANdiknFnhQ12z0slvzmpjMNgEYwRYbwOcadDytNwj6rURybPskHC4yOfcs6wnpGz/TTKan2f8XShFRbZqIjNcLrua61KtxMIFmyfo3JwDWQ//TZGlg+0jjkqiaDI77KEOEU/J+SKJcDfYm0CLx2cUK3H/pbryAiYfNXABaBdXvVID9GmJ7t4uh1IARO/KlghY3kj6tE/sdsJ0jXSoEuI6C4qMwUv2J60m2+tp+C1vmsBRmOlM428Su89Dbmb6Sb/4qCZhAmnwI2sgBMRPUHWS5opKavrjGFCMHaIezvLlf/HKwsR7HemBQDGIX9YFoftaQgXjersatIdN8x+LpZgQ+8KZuY+7CnENWjYPCnvE2lvYw+pu6iVl7qf10fy1AxQnhZFwrSY5MYtQRmC7Nk5bOYXWxkgjy63PSjJwqObHhFql+5miDN7SmYgT6gpCyyVSqiRM/xwOS1MN8NusNWsUQPqCbj5jktGNByBEy0HUu+XUUyJapgCVOdu40NlBDBA/uMs/X8hewCVIQ9ozRCFD8YhY7BId42TYFw2XsWfjRMx8DqRs+n5hxeF+cIAI84A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(30864003)(41300700001)(2906002)(66946007)(5660300002)(6636002)(66476007)(4326008)(66556008)(316002)(8936002)(54906003)(8676002)(6862004)(478600001)(6486002)(6666004)(966005)(1076003)(26005)(53546011)(186003)(33656002)(6512007)(6506007)(83380400001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZFDzxG8skgToncwDF5e9x9em2fpxmg9ses/ixGkpXXMu1qKL78MLwKoCRi6?=
 =?us-ascii?Q?264/TSlk5Bbz7m0WuHO+fzCaY14vTGsTOluVJdo2T4jAe3qAeKCRhX1aTfeI?=
 =?us-ascii?Q?PuMuXCsC9dWHnZgkI7TNTvEGzHCFUxDS4eufCY7FUVjpl1NiZnZi+in9fJo5?=
 =?us-ascii?Q?SkfTf2Q/TAACyB4GCMjKqwubfbVjbhuJ65241fyBu4L/5nqbwkotBSkldxsc?=
 =?us-ascii?Q?2Sw2VrvG4b8yboS00zADe8NXZywzwOWxJAo9okPIz8zPOMcF7njyT0Aed1bf?=
 =?us-ascii?Q?8CC2LLLDR2W6SXUuPAg9eieWA8uV459fRublABURFd9BLD0KHcT5tWcjlP0n?=
 =?us-ascii?Q?mpbvGKaYwRTe0BpGzMxdxoyw7Lk0GKXlcjUxjqSfIzpnl0I6JG2MsN+a1Loi?=
 =?us-ascii?Q?C2FXYT0DkvjPxWWPry6xDhAsnLSVwfFGwGvJvwXmNWnYNkm9eJB3LEwT6vy1?=
 =?us-ascii?Q?2HgQ+xrkgQxI8edPm11zgUJFYAXUqIHKVrl8gusKJl/8BmQQRL17CEyzHRWi?=
 =?us-ascii?Q?4pIHKrjqbLd5wJ9FlHNiB5xAFsYDp5fpUvLXsu62VBnQRruwmzvDrCy5/OOa?=
 =?us-ascii?Q?13YI9j4/L8/6QfWuRQJELGjg190itX677J98QoUCw5+XxZDulhNVOt2jsVPH?=
 =?us-ascii?Q?gl3w/d6rVXkHYvuoSQHZ0xtC7BIIGmDItD4Z7+c+3dvKenH/iHzHa/wFFG1C?=
 =?us-ascii?Q?j+vD7didE6WYW31x9Yql5sMlZ8TbhbyJWiUNvrkX7AFkh5Nme3ExW1OmbeiL?=
 =?us-ascii?Q?yu8kYQZgX0wjBPlJusRNr+BM5JCYxpTtvpXIJUBehNmMzvfT75pQRUD9y6yF?=
 =?us-ascii?Q?sA6+LvTNgxMjIYFpLzgZoUqe7Cq8nZ4+dpe10zL5Xjqo8gEZ6Fd/JjKmiz7y?=
 =?us-ascii?Q?YbKnebxcdhpp0joWQ30m6SsJLVTvfjANrEGGzQYX5jSGJNjd+bMDkAIVF3DH?=
 =?us-ascii?Q?yKOyQySCr21GVmbtryPuOmffEsNJyOlqBYdMX4PsBq6cyJeUYw7/K3VN9ud5?=
 =?us-ascii?Q?+bLSwVdehT6GDMwQYtWNqm5mSwvvb8cxNpfgH6ON6QIhyP+qhtA2iA4CkDjB?=
 =?us-ascii?Q?+pdcYKeBxCKJ2BgKIXKsB3iix3xJwJLEbdrCs9iJ8DoWP8v7Dtd3Lr+amAxs?=
 =?us-ascii?Q?h31RMMHOThy76ERCP84OLi5Jl5Jpx7vopaOROthzNCWG1j86mV/wCmyI2bPV?=
 =?us-ascii?Q?QyZlye16fOY5R0khdoD+gnQaTJE1xKHlLuSIfTMvA7QjYRE35VGq6kgRgkB+?=
 =?us-ascii?Q?qDxiet82tWjNH/xvvRDjnQSpWj5V0PhXrXuJ9TfuLlFwSA0Tp5dJHKfA44yC?=
 =?us-ascii?Q?oTOmGAoNKIchqh+4YInRBdrUsM1BuM2wv9SQQJererTk63KxTxk1hc3ae9RT?=
 =?us-ascii?Q?XOCNs4Q6nI/i9mn68mdjyX4+xHj3BPHovf18vf9dKBNMhfH8QTZVXRjRBWI/?=
 =?us-ascii?Q?7ISCrMXzZIPHKTclT4RVLLt2jEQQZIIN3Lji6FjMm2EB9Sm7hRN/mtyR/16j?=
 =?us-ascii?Q?X3MH3oj6qNeKKOgaKGxm5iTQMR5VDw9DgObkB02BnB5Q2m3SwSnZIJHqV0uq?=
 =?us-ascii?Q?nI+vT6OoKSLEYRekWeezfmF2NaXHTC/ERCvxaXHaGPEwhqYIFIiOeTueRuKR?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c4752d-8195-4a83-00b1-08db4d7acea7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 15:10:05.3698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVSGjj959mMxU10Ady34E3DHfTnpyg7xMIzcx3KL2uSWK5EW/fZDNC5+bgoJLPqdZEl3XiKR8dQ0NTGhvPE9ZzhHaNjeWgnWhonb2IyMLIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/ras: Log the GT hw errors.
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

On Fri, May 05, 2023 at 12:54:20PM +0530, Iddamsetty, Aravind wrote:
> 
> 
> On 04-05-2023 05:32, Matt Roper wrote:
> > On Fri, Apr 28, 2023 at 01:00:04AM -0700, Ghimiray, Himal Prasad wrote:
> > ...
> >>> All of this new infrastructure seems pretty questionable at the moment.
> >>> We're doing extra work to count up errors, but then never doing anything
> >>> with the counts.  You mention in the cover letter that these will be exposed
> >>> to userspace eventually, but what's the benefit of that?  Which userspace
> >>> component is going to actually use this information?  What do you expect
> >>> userspace to do if it finds out there's been a fatal or correctable error in
> >>> some low-level hardware unit?  Generally userspace shouldn't even need to
> >>> care about the really low-level hardware details; if something has truly gone
> >>> fatally wrong, it's game over for userspace and it probably doesn't matter
> >>> exactly where in the hardware things are actually busted.
> >>>
> >>> Without some extra justification from the userspace point of view, it feels
> >>> like we're just adding a bunch of code that doesn't have a real-world
> >>> purpose.
> >> The error counters  exposed by KMD will be used by sysman 
> >> They will be categorized to specific category of error in sysman:
> >>  https://spec.oneapi.io/level-zero/latest/sysman/api.html#ras
> > 
> > L0 sysman looks sort of like a complicated libdrm replacement.  I.e.,
> > it's just a wrapper library over various uapi interfaces, but isn't
> > really a "consumer" of that uapi itself.  We need to understand the
> > whole top-to-bottom stack to make sure that whatever interfaces and
> > representation are selected (both at the Xe and Sysman levels) actually
> > makes sense and satisfies the full stack needs.
> > 
> > Is the actual reporting of these errors going to be done via the
> > standard Linux RAS/EDAC interfaces?  I.e., what's documented at
> > https://www.kernel.org/doc/html/v6.3/admin-guide/ras.html ?  If so, then
> > there's already a bunch of real userspace tools that work with that, so
> > that would probably help justify the work here, and make it clear that
> > we're not just reinventing the wheel.  If we're not tying into that,
> > then we probably need to justify clearly why it can't be used.
> 
> I don't think we can use EDAC, IIUC it expects errors to be reported via
> MCA(Machine Check Architecute)/MCE and our HW doesn't do that. the
> correctable and non fatal errors are reported via MSI and fatal as a
> PCI_ERR message.

My impression from skimming the EDAC stuff was that this is under our
control.  I.e., our driver can receive the errors any way it wants (such
as MSI), but we'd use the edac_device framework to manage the counts and
to handle reporting it out to userspace through standard sysfs
mechanisms.  Is that not the case?  I see some of the other drivers
receiving their errors as interrupts and then using
edac_device_handle_ce() / edac_device_handle_ue() to manage and report
the errors.


Matt

> 
> Thanks,
> Aravind.
> > 
> >>>
> >>>> +			    const enum xe_gt_driver_errors error,
> >>>> +			    const char *fmt, ...)
> >>>> +{
> >>>> +	struct va_format vaf;
> >>>> +	va_list args;
> >>>> +
> >>>> +	va_start(args, fmt);
> >>>> +	vaf.fmt = fmt;
> >>>> +	vaf.va = &args;
> >>>> +
> >>>> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_driver_errors_to_str) !=
> >>>> +		     INTEL_GT_DRIVER_ERROR_COUNT);
> >>>> +
> >>>> +	WARN_ON_ONCE(error >= INTEL_GT_DRIVER_ERROR_COUNT);
> >>>> +
> >>>> +	gt->errors.driver[error]++;
> >>>> +
> >>>> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
> >>>> +			    gt->info.id,
> >>>> +			    xe_gt_driver_errors_to_str[error],
> >>>> +			    &vaf);
> >>>> +	va_end(args);
> >>>> +}
> >>>> +
> >>>>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)  {
> >>>>  	struct xe_gt *search;
> >>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> >>>> b/drivers/gpu/drm/xe/xe_gt_types.h
> >>>> index 8f29aba455e0..9580a40c0142 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> >>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> >>>> @@ -33,6 +33,43 @@ enum xe_gt_type {
> >>>>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 *
> >>>> XE_MAX_DSS_FUSE_REGS)];  typedef unsigned long
> >>>> xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> >>>>
> >>>> +/* Count of GT Correctable and FATAL HW ERRORS */ enum
> >>>> +intel_gt_hw_errors {
> >>>> +	INTEL_GT_HW_ERROR_COR_SUBSLICE = 0,
> >>>> +	INTEL_GT_HW_ERROR_COR_L3BANK,
> >>>> +	INTEL_GT_HW_ERROR_COR_L3_SNG,
> >>>> +	INTEL_GT_HW_ERROR_COR_GUC,
> >>>> +	INTEL_GT_HW_ERROR_COR_SAMPLER,
> >>>> +	INTEL_GT_HW_ERROR_COR_SLM,
> >>>> +	INTEL_GT_HW_ERROR_COR_EU_IC,
> >>>> +	INTEL_GT_HW_ERROR_COR_EU_GRF,
> >>>> +	INTEL_GT_HW_ERROR_FAT_SUBSLICE,
> >>>> +	INTEL_GT_HW_ERROR_FAT_L3BANK,
> >>>> +	INTEL_GT_HW_ERROR_FAT_ARR_BIST,
> >>>> +	INTEL_GT_HW_ERROR_FAT_FPU,
> >>>> +	INTEL_GT_HW_ERROR_FAT_L3_DOUB,
> >>>> +	INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
> >>>> +	INTEL_GT_HW_ERROR_FAT_GUC,
> >>>> +	INTEL_GT_HW_ERROR_FAT_IDI_PAR,
> >>>> +	INTEL_GT_HW_ERROR_FAT_SQIDI,
> >>>> +	INTEL_GT_HW_ERROR_FAT_SAMPLER,
> >>>> +	INTEL_GT_HW_ERROR_FAT_SLM,
> >>>> +	INTEL_GT_HW_ERROR_FAT_EU_IC,
> >>>> +	INTEL_GT_HW_ERROR_FAT_EU_GRF,
> >>>> +	INTEL_GT_HW_ERROR_FAT_TLB,
> >>>> +	INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
> >>>> +	INTEL_GT_HW_ERROR_COUNT
> >>>> +};
> >>>> +
> >>>> +enum xe_gt_driver_errors {
> >>>> +	INTEL_GT_DRIVER_ERROR_INTERRUPT = 0,
> >>>> +	INTEL_GT_DRIVER_ERROR_COUNT
> >>>> +};
> >>>> +
> >>>> +void xe_gt_log_driver_error(struct xe_gt *gt,
> >>>> +			    const enum xe_gt_driver_errors error,
> >>>> +			    const char *fmt, ...);
> >>>> +
> >>>>  struct xe_mmio_range {
> >>>>  	u32 start;
> >>>>  	u32 end;
> >>>> @@ -357,6 +394,12 @@ struct xe_gt {
> >>>>  	 *    of a steered operation
> >>>>  	 */
> >>>>  	spinlock_t mcr_lock;
> >>>> +
> >>>> +	struct intel_hw_errors {
> >>>> +		unsigned long hw[INTEL_GT_HW_ERROR_COUNT];
> >>>> +		unsigned long driver[INTEL_GT_DRIVER_ERROR_COUNT];
> >>>> +	} errors;
> >>>> +
> >>>>  };
> >>>>
> >>>>  #endif
> >>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >>>> index 6b922332bff1..4626f7280aaf 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_irq.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
> >>>> @@ -19,6 +19,7 @@
> >>>>  #include "xe_hw_engine.h"
> >>>>  #include "xe_mmio.h"
> >>>>
> >>>> +#define HAS_GT_ERROR_VECTORS(xe) ((xe)->info.has_gt_error_vectors)
> >>>>  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
> >>>> {
> >>>>  	u32 val = xe_mmio_read32(gt, reg.reg); @@ -359,44 +360,281 @@
> >>>> hardware_error_type_to_str(const enum hardware_error hw_err)
> >>>>  	}
> >>>>  }
> >>>>
> >>>> +#define xe_gt_hw_err(gt, fmt, ...) \
> >>>> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected "
> >>> fmt, \
> >>>> +			(gt)->info.id, ##__VA_ARGS__)
> >>>
> >>> As on the previous patch, it looks like we're printing error-level kernel
> >>> messages for correctable errors (i.e., things the hardware caught and fixed
> >>> internally like ECC).  Generally those kind of things shouldn't be putting
> >>> errors in the kernel log because there's no actual problem from the end user
> >>> perspective.
> >> Agreed. Should we use warning for correctable errors ?
> > 
> > Presumably we shouldn't be reporting them in dmesg at all by default.
> > It looks like the EDAC subsystem has its own ways of controlling if/when 
> > stuff shows up in dmesg.
> > 
> >>>
> >>>> +
> >>>>  static void
> >>>> -xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error
> >>>> hw_err)
> >>>> +xe_gt_correctable_hw_error_stats_update(struct xe_gt  *gt, unsigned
> >>>> +long errstat)
> >>>>  {
> >>>> -	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> >>>> -	u32 other_errors = ~(EU_GRF_ERROR | EU_IC_ERROR);
> >>>> -	u32 errstat;
> >>>> +	u32 errbit, cnt;
> >>>>
> >>>> -	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> >>>> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> >>>> +		return;
> >>>>
> >>>> -	errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> >>>> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> >>>> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) &
> >>> PVC_COR_ERR_MASK)) {
> >>>> +			xe_gt_log_driver_error(gt,
> >>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> >>>> +					       "UNKNOWN CORRECTABLE
> >>> error\n");
> >>>> +			continue;
> >>>> +		}
> >>>>
> >>>> -	if (unlikely(!errstat)) {
> >>>> -		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n",
> >>> hw_err_str);
> >>>> -		return;
> >>>> +	switch (errbit) {
> >>>> +	case L3_SNG_COR_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_L3_SNG]++;
> >>>> +		xe_gt_hw_err(gt, "L3 SINGLE CORRECTABLE error\n");
> >>>> +		break;
> >>>> +	case GUC_COR_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_GUC]++;
> >>>> +		xe_gt_hw_err(gt, "SINGLE BIT GUC SRAM CORRECTABLE
> >>> error\n");
> >>>> +		break;
> >>>> +	case SAMPLER_COR_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SAMPLER]++;
> >>>> +		xe_gt_hw_err(gt, "SINGLE BIT SAMPLER CORRECTABLE
> >>> error\n");
> >>>> +		break;
> >>>> +	case SLM_COR_ERR:
> >>>> +		cnt = xe_mmio_read32(gt,
> >>> SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_CORRECTABLE).reg);
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SLM] = cnt;
> >>>> +		xe_gt_hw_err(gt, "%u SINGLE BIT SLM CORRECTABLE
> >>> error\n", cnt);
> >>>> +		break;
> >>>> +	case EU_IC_COR_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_IC]++;
> >>>> +		xe_gt_hw_err(gt, "SINGLE BIT EU IC CORRECTABLE error\n");
> >>>> +		break;
> >>>> +	case EU_GRF_COR_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_GRF]++;
> >>>> +		xe_gt_hw_err(gt, "SINGLE BIT EU GRF CORRECTABLE
> >>> error\n");
> >>>> +		break;
> >>>> +	default:
> >>>> +		xe_gt_log_driver_error(gt,
> >>> INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN CORRECTABLE error\n");
> >>>> +		break;
> >>>> +	}
> >>>>  	}
> >>>> +}
> >>>>
> >>>> -	/*
> >>>> -	 * TODO: The GT Non Fatal Error Status Register
> >>>> -	 * only has reserved bitfields defined.
> >>>> -	 * Remove once there is something to service.
> >>>> -	 */
> >>>> -	if (hw_err == HARDWARE_ERROR_NONFATAL) {
> >>>> -		DRM_ERROR("detected Non-Fatal error\n");
> >>>> -		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> >>> errstat);
> >>>> +static void xe_gt_fatal_hw_error_stats_update(struct xe_gt *gt,
> >>>> +unsigned long errstat) {
> >>>> +	u32 errbit, cnt;
> >>>> +
> >>>> +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> >>>>  		return;
> >>>> +
> >>>> +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> >>>> +		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) &
> >>> PVC_FAT_ERR_MASK)) {
> >>>> +			xe_gt_log_driver_error(gt,
> >>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> >>>> +					       "UNKNOWN FATAL error\n");
> >>>> +			continue;
> >>>> +		}
> >>>> +
> >>>> +	switch (errbit) {
> >>>> +	case ARRAY_BIST_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_ARR_BIST]++;
> >>>> +		xe_gt_hw_err(gt, "Array BIST FATAL error\n");
> >>>> +		break;
> >>>> +	case FPU_UNCORR_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_FPU]++;
> >>>> +		xe_gt_hw_err(gt, "FPU FATAL error\n");
> >>>> +		break;
> >>>> +	case L3_DOUBLE_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_DOUB]++;
> >>>> +		xe_gt_hw_err(gt, "L3 Double FATAL error\n");
> >>>> +		break;
> >>>> +	case L3_ECC_CHK_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK]++;
> >>>> +		xe_gt_hw_err(gt, "L3 ECC Checker FATAL error\n");
> >>>> +		break;
> >>>> +	case GUC_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_GUC]++;
> >>>> +		xe_gt_hw_err(gt, "GUC SRAM FATAL error\n");
> >>>> +		break;
> >>>> +	case IDI_PAR_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_IDI_PAR]++;
> >>>> +		xe_gt_hw_err(gt, "IDI PARITY FATAL error\n");
> >>>> +		break;
> >>>> +	case SQIDI_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SQIDI]++;
> >>>> +		xe_gt_hw_err(gt, "SQIDI FATAL error\n");
> >>>> +		break;
> >>>> +	case SAMPLER_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SAMPLER]++;
> >>>> +		xe_gt_hw_err(gt, "SAMPLER FATAL error\n");
> >>>> +		break;
> >>>> +	case SLM_FAT_ERR:
> >>>> +		cnt = xe_mmio_read32(gt,
> >>> SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_FATAL).reg);
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SLM] = cnt;
> >>>> +		xe_gt_hw_err(gt, "%u SLM FATAL error\n", cnt);
> >>>> +		break;
> >>>> +	case EU_IC_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_IC]++;
> >>>> +		xe_gt_hw_err(gt, "EU IC FATAL error\n");
> >>>> +		break;
> >>>> +	case EU_GRF_FAT_ERR:
> >>>> +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_GRF]++;
> >>>> +		xe_gt_hw_err(gt, "EU GRF FATAL error\n");
> >>>> +		break;
> >>>> +	default:
> >>>> +		xe_gt_log_driver_error(gt,
> >>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> >>>> +				       "UNKNOWN FATAL error\n");
> >>>> +		break;
> >>>> +	}
> >>>>  	}
> >>>> +}
> >>>>
> >>>> -	/*
> >>>> -	 * TODO: The remaining GT errors don't have a
> >>>> -	 * need for targeted logging at the moment. We
> >>>> -	 * still want to log detection of these errors, but
> >>>> -	 * let's aggregate them until someone has a need for them.
> >>>> -	 */
> >>>> -	if (errstat & other_errors)
> >>>> -		DRM_ERROR("detected hardware error(s) in
> >>> ERR_STAT_GT_REG_%s: 0x%08x\n",
> >>>> -			  hw_err_str, errstat & other_errors);
> >>>> +static void
> >>>> +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error
> >>>> +hw_err) {
> >>>> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> >>>> +	unsigned long errstat;
> >>>> +
> >>>> +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> >>>>
> >>>> -	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> >>>> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> >>>> +		errstat = xe_mmio_read32(gt,
> >>> ERR_STAT_GT_REG(hw_err).reg);
> >>>> +		if (unlikely(!errstat)) {
> >>>> +			xe_gt_log_driver_error(gt,
> >>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> >>>> +					       "ERR_STAT_GT_REG_%s
> >>> blank!\n", hw_err_str);
> >>>> +			return;
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	switch (hw_err) {
> >>>> +	case HARDWARE_ERROR_CORRECTABLE:
> >>>> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> >>>> +			bool error = false;
> >>>> +			int i;
> >>>> +
> >>>> +			errstat = 0;
> >>>> +			for (i = 0; i < ERR_STAT_GT_COR_VCTR_LEN; i++) {
> >>>> +				u32 err_type =
> >>> ERR_STAT_GT_COR_VCTR_LEN;
> >>>> +				unsigned long vctr;
> >>>> +				const char *name;
> >>>> +
> >>>> +				vctr = xe_mmio_read32(gt,
> >>> ERR_STAT_GT_COR_VCTR_REG(i).reg);
> >>>> +				if (!vctr)
> >>>> +					continue;
> >>>> +
> >>>> +				switch (i) {
> >>>> +				case ERR_STAT_GT_VCTR0:
> >>>> +				case ERR_STAT_GT_VCTR1:
> >>>> +					err_type =
> >>> INTEL_GT_HW_ERROR_COR_SUBSLICE;
> >>>> +					gt->errors.hw[err_type] +=
> >>> hweight32(vctr);
> >>>> +					name = "SUBSLICE";
> >>>> +
> >>>> +					/* Avoid second read/write to error
> >>> status register*/
> >>>> +					if (errstat)
> >>>> +						break;
> >>>> +
> >>>> +					errstat = xe_mmio_read32(gt,
> >>> ERR_STAT_GT_REG(hw_err).reg);
> >>>> +					xe_gt_hw_err(gt,
> >>> "ERR_STAT_GT_CORRECTABLE:0x%08lx\n",
> >>>> +						     errstat);
> >>>> +
> >>> 	xe_gt_correctable_hw_error_stats_update(gt, errstat);
> >>>> +					if (errstat)
> >>>> +						xe_mmio_write32(gt,
> >>> ERR_STAT_GT_REG(hw_err).reg,
> >>>> +								errstat);
> >>>> +					break;
> >>>> +
> >>>> +				case ERR_STAT_GT_VCTR2:
> >>>> +				case ERR_STAT_GT_VCTR3:
> >>>> +					err_type =
> >>> INTEL_GT_HW_ERROR_COR_L3BANK;
> >>>> +					gt->errors.hw[err_type] +=
> >>> hweight32(vctr);
> >>>> +					name = "L3 BANK";
> >>>> +					break;
> >>>> +				default:
> >>>> +					name = "UNKNOWN";
> >>>> +					break;
> >>>> +				}
> >>>> +				xe_mmio_write32(gt,
> >>> ERR_STAT_GT_COR_VCTR_REG(i).reg, vctr);
> >>>> +				xe_gt_hw_err(gt, "%s CORRECTABLE error,
> >>> ERR_VECT_GT_CORRECTABLE_%d:0x%08lx\n",
> >>>> +					     name, i, vctr);
> >>>> +				error = true;
> >>>> +			}
> >>>> +
> >>>> +			if (!error)
> >>>> +				xe_gt_hw_err(gt, "UNKNOWN CORRECTABLE
> >>> error\n");
> >>>> +		} else {
> >>>> +			xe_gt_correctable_hw_error_stats_update(gt,
> >>> errstat);
> >>>> +			xe_gt_hw_err(gt,
> >>> "ERR_STAT_GT_CORRECTABLE:0x%08lx\n", errstat);
> >>>> +		}
> >>>> +		break;
> >>>> +	case HARDWARE_ERROR_NONFATAL:
> >>>> +	      /*
> >>>> +	       * TODO: The GT Non Fatal Error Status Register
> >>>> +	       * only has reserved bitfields defined.
> >>>> +	       * Remove once there is something to service.
> >>>> +	       */
> >>>> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "detected
> >>> Non-Fatal error\n");
> >>>> +		break;
> >>>> +	case HARDWARE_ERROR_FATAL:
> >>>> +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> >>>> +			bool error = false;
> >>>> +			int i;
> >>>> +
> >>>> +			errstat = 0;
> >>>> +			for (i = 0; i < ERR_STAT_GT_FATAL_VCTR_LEN; i++) {
> >>>> +				u32 err_type =
> >>> ERR_STAT_GT_FATAL_VCTR_LEN;
> >>>> +				unsigned long vctr;
> >>>> +				const char *name;
> >>>> +
> >>>> +				vctr = xe_mmio_read32(gt,
> >>> ERR_STAT_GT_FATAL_VCTR_REG(i).reg);
> >>>> +				if (!vctr)
> >>>> +					continue;
> >>>> +
> >>>> +				/* i represents the vector register index */
> >>>> +				switch (i) {
> >>>> +				case ERR_STAT_GT_VCTR0:
> >>>> +				case ERR_STAT_GT_VCTR1:
> >>>> +					err_type =
> >>> INTEL_GT_HW_ERROR_FAT_SUBSLICE;
> >>>> +					gt->errors.hw[err_type] +=
> >>> hweight32(vctr);
> >>>> +					name = "SUBSLICE";
> >>>> +
> >>>> +					/*Avoid second read/write to error
> >>> status register.*/
> >>>> +					if (errstat)
> >>>> +						break;
> >>>> +
> >>>> +					errstat = xe_mmio_read32(gt,
> >>> ERR_STAT_GT_REG(hw_err).reg);
> >>>> +					xe_gt_hw_err(gt,
> >>> "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
> >>>> +
> >>> 	xe_gt_fatal_hw_error_stats_update(gt, errstat);
> >>>> +					if (errstat)
> >>>> +						xe_mmio_write32(gt,
> >>> ERR_STAT_GT_REG(hw_err).reg,
> >>>> +								errstat);
> >>>> +					break;
> >>>> +
> >>>> +				case ERR_STAT_GT_VCTR2:
> >>>> +				case ERR_STAT_GT_VCTR3:
> >>>> +					err_type =
> >>> INTEL_GT_HW_ERROR_FAT_L3BANK;
> >>>> +					gt->errors.hw[err_type] +=
> >>> hweight32(vctr);
> >>>> +					name = "L3 BANK";
> >>>> +					break;
> >>>> +				case ERR_STAT_GT_VCTR6:
> >>>> +					gt-
> >>>> errors.hw[INTEL_GT_HW_ERROR_FAT_TLB] += hweight16(vctr);
> >>>> +					name = "TLB";
> >>>> +					break;
> >>>> +				case ERR_STAT_GT_VCTR7:
> >>>> +					gt-
> >>>> errors.hw[INTEL_GT_HW_ERROR_FAT_L3_FABRIC] += hweight8(vctr);
> >>>> +					name = "L3 FABRIC";
> >>>> +					break;
> >>>> +				default:
> >>>> +					name = "UNKNOWN";
> >>>> +					break;
> >>>> +				}
> >>>> +				xe_mmio_write32(gt,
> >>> ERR_STAT_GT_FATAL_VCTR_REG(i).reg, vctr);
> >>>> +				xe_gt_hw_err(gt, "%s FATAL error,
> >>> ERR_VECT_GT_FATAL_%d:0x%08lx\n",
> >>>> +					     name, i, vctr);
> >>>> +				error = true;
> >>>> +			}
> >>>> +			if (!error)
> >>>> +				xe_gt_hw_err(gt, "UNKNOWN FATAL
> >>> error\n");
> >>>> +		} else {
> >>>> +			xe_gt_fatal_hw_error_stats_update(gt, errstat);
> >>>> +			xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n",
> >>> errstat);
> >>>> +		}
> >>>> +		break;
> >>>> +	default:
> >>>> +		break;
> >>>> +	}
> >>>> +
> >>>> +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> >>>> +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> >>> errstat);
> >>>>  }
> >>>>
> >>>>  static void
> >>>> @@ -409,7 +647,8 @@ xe_hw_error_source_handler(struct xe_gt *gt,
> >>> const enum hardware_error hw_err)
> >>>>  	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
> >>>>  	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
> >>>>  	if (unlikely(!errsrc)) {
> >>>> -		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n",
> >>> hw_err_str);
> >>>> +		xe_gt_log_driver_error(gt,
> >>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> >>>> +				       "DEV_ERR_STAT_REG_%s blank!\n",
> >>> hw_err_str);
> >>>>  		goto out_unlock;
> >>>>  	}
> >>>>
> >>>> @@ -417,8 +656,9 @@ xe_hw_error_source_handler(struct xe_gt *gt,
> >>> const enum hardware_error hw_err)
> >>>>  		xe_gt_hw_error_handler(gt, hw_err);
> >>>>
> >>>>  	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
> >>>> -		DRM_ERROR("non-GT hardware error(s) in
> >>> DEV_ERR_STAT_REG_%s: 0x%08x\n",
> >>>> -			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
> >>>> +		xe_gt_log_driver_error(gt,
> >>> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> >>>> +				       "non-GT hardware error(s) in
> >>> DEV_ERR_STAT_REG_%s: 0x%08x\n",
> >>>> +				       hw_err_str, errsrc &
> >>> ~DEV_ERR_STAT_GT_ERROR);
> >>>>
> >>>>  	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
> >>>>
> >>>> @@ -634,12 +874,44 @@ static void irq_uninstall(struct drm_device *drm,
> >>> void *arg)
> >>>>  		pci_disable_msi(pdev);
> >>>>  }
> >>>>
> >>>> +/**
> >>>> + * process_hw_errors - checks for the occurrence of HW errors
> >>>> + *
> >>>> + * This checks for the HW Errors including FATAL error that might
> >>>> + * have occurred in the previous boot of the driver which will
> >>>> + * initiate PCIe FLR reset of the device and cause the
> >>>> + * driver to reload.
> >>>
> >>> Is this saying that there's already been a PCIe FLR and you're trying to read
> >>> the registers after that reset has happened?  The bspec indicates that these
> >>> registers have 'DEV' style reset, so they wouldn't be able to preserve their
> >>> values across a reset.
> >> Registers preserve the value across reset.
> >> BSPEC: 50875
> >>>
> >>>> + */
> >>>> +static void process_hw_errors(struct xe_device *xe) {
> >>>> +	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
> >>>> +	u32 dev_pcieerr_status, master_ctl;
> >>>> +	struct xe_gt *gt;
> >>>> +	int i;
> >>>> +
> >>>> +	dev_pcieerr_status = xe_mmio_read32(gt0,
> >>> DEV_PCIEERR_STATUS.reg);
> >>>> +
> >>>> +	for_each_gt(gt, xe, i) {
> >>>> +		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
> >>>> +			xe_hw_error_source_handler(gt,
> >>> HARDWARE_ERROR_FATAL);
> >>>> +
> >>>> +		master_ctl = xe_mmio_read32(gt,
> >>> GEN11_GFX_MSTR_IRQ.reg);
> >>>> +		xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg,
> >>> master_ctl);
> >>>> +		xe_hw_error_irq_handler(gt, master_ctl);
> >>>> +	}
> >>>> +	if (dev_pcieerr_status)
> >>>> +		xe_mmio_write32(gt, DEV_PCIEERR_STATUS.reg,
> >>> dev_pcieerr_status); }
> >>>> +
> >>>>  int xe_irq_install(struct xe_device *xe)  {
> >>>>  	int irq = to_pci_dev(xe->drm.dev)->irq;
> >>>>  	irq_handler_t irq_handler;
> >>>>  	int err;
> >>>>
> >>>> +	if (IS_DGFX(xe))
> >>>> +		process_hw_errors(xe);
> >>>
> >>> Why is this conditional on DGFX?  From what I can see this also applies to
> >>> integrated platforms like MTL too.
> >> From RAS perspective report of error is required on DGFX only.
> >> sysman don't use these counters from IGFX
> > 
> > I don't think we should add artificial limitations to the kernel driver
> > just because one wrapper library (which probably won't even get used by
> > most users) has them.  If the hardware can report errors, and if users
> > can bypass sysman and just use EDAC stuff, then I don't see a reason to
> > hide the errors on integrated platforms?
> > 
> > 
> > Matt
> > 
> >>>
> >>>
> >>> Matt
> >>>
> >>>> +
> >>>>  	irq_handler = xe_irq_handler(xe);
> >>>>  	if (!irq_handler) {
> >>>>  		drm_err(&xe->drm, "No supported interrupt handler"); diff --
> >>> git
> >>>> a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c index
> >>>> 1844cff8fba8..69098194cef8 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_pci.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >>>> @@ -73,6 +73,7 @@ struct xe_device_desc {
> >>>>  	bool has_range_tlb_invalidation;
> >>>>  	bool has_asid;
> >>>>  	bool has_link_copy_engine;
> >>>> +	bool has_gt_error_vectors;
> >>>>  };
> >>>>
> >>>>  __diag_push();
> >>>> @@ -232,6 +233,7 @@ static const struct xe_device_desc pvc_desc = {
> >>>>  	.supports_usm = true,
> >>>>  	.has_asid = true,
> >>>>  	.has_link_copy_engine = true,
> >>>> +	.has_gt_error_vectors = true,
> >>>>  };
> >>>>
> >>>>  #define MTL_MEDIA_ENGINES \
> >>>> @@ -418,6 +420,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const
> >>> struct pci_device_id *ent)
> >>>>  	xe->info.vm_max_level = desc->vm_max_level;
> >>>>  	xe->info.supports_usm = desc->supports_usm;
> >>>>  	xe->info.has_asid = desc->has_asid;
> >>>> +	xe->info.has_gt_error_vectors = desc->has_gt_error_vectors;
> >>>>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
> >>>>  	xe->info.has_4tile = desc->has_4tile;
> >>>>  	xe->info.has_range_tlb_invalidation =
> >>>> desc->has_range_tlb_invalidation;
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>> --
> >>> Matt Roper
> >>> Graphics Software Engineer
> >>> Linux GPU Platform Enablement
> >>> Intel Corporation
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
