Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DAEC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 17:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC71710E0E4;
	Tue,  9 Jan 2024 17:50:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183FD10E0E4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704822652; x=1736358652;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Da8/jSX0uQBrn7sNSekwcJiLKIlrRs8naJoo207lMKI=;
 b=N0xIm1WTfpwIU14absKAVNB5Xa8MRE10Grvf7eF4VAWO1pVtFUde6fML
 8QRth6XWyJP7BKeAFJzxplcCA8tMVZU8cLE/CuH/DmRXvsp8qA+bPcxkg
 FnS8NHkRDPy3vlNqNf3tJmaAiG0vke7DcLCVEmpWe3YOnesF6RC41++FH
 V0mBauL5Amol01+PD8jTALI6FHxtF7cTTxsyU6zYzfUSPIY581q6iF+Hh
 6VaVRKSfUyGDjoiQOUGWnBz4FRreH5JxQK25JdnEcUHE1+LqmFEUZtIen
 /Ihe7MjA+sHIN3CxK4e2Y+8ccvIRy7DUrlqj6i9YBxht5F5EHtmqhlm7k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484457806"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="484457806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="30277040"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 09:50:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 09:50:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 09:50:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 09:50:49 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 09:50:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxIzEc9cYEpvU748YQNxU+yr54q5kPOwyjLxZcQOM7XFmpjev+Uu1NzC/KIeZHWJKKPlM+QbMOTGtdh4gofqgrUtFLZ2It+MoCLsWy+Lmb18+emi2nDVTKe7LU6TnuW85zIdrkfgl3zbBjiEzdddj7yOUvkYbhHg0B3lDAi1neo/ML9ymHAmh+J717QQ0zd9oChwmxgZ1SRbLoLLAacieOalTtXDwgmnm5Urb4kLh5OfPjq08IiQCOOvjwruI5Nq6O+0DseAqIbJUtHUp2apYkUuJoAIbPQgq+qMUgIVajxBk7rxe+Syw2Jm3EA8qnkcWlx5GYCHWLKCR7qf6ADgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KOaLbTxK42cBEGRzWXL2+w81tEg/9lCBNK1EoOmLBA=;
 b=c/6T3rm3e7v5mW6SQQxN7cgOBBP8grHWuze67FGP7ocoztBhNW4YOi80mBSfPo38+cQCAnT7EsweLS2xXkqyw022U8UgSvzMN/05skRzuvsgQTSRmtbVkRk7cfRWF0ub2NGQu7J8bc/X36uDcmSqGZlnh3Xi9/E7x0dY56F7IxnQgYzDLnGUOAx4Owa6e38BbzP9stV+gXoRRA6xGGLptHZUCHqzDJyWovFt9cI74ErmQI37VIURl0GfMnB5DwsSz2JupPe2GgoqJkS44HcP84BHYetxsRdH1z1xnOdpgsq3il6JvNJnqW+E7zadBftfbgY0dkH8M1u+vsOx8NZGNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25; Tue, 9 Jan
 2024 17:50:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 17:50:47 +0000
Date: Tue, 9 Jan 2024 12:50:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [RFC 06/20] drm/xe: Convert mem_access assertion towards the
 runtime_pm state
Message-ID: <ZZ2HcwA_Yx2ecBJV@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-7-rodrigo.vivi@intel.com>
 <1fdd8cef-3fe0-496e-9f0e-51fe5ea2a397@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1fdd8cef-3fe0-496e-9f0e-51fe5ea2a397@intel.com>
X-ClientProxiedBy: SJ0PR05CA0118.namprd05.prod.outlook.com
 (2603:10b6:a03:334::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fdd2d50-d07d-4dc5-65c6-08dc113b8251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ofBMCd6REiH75KYfZJyF3jSCgkgHWtCPkvbJCEAGw3qi+hsvhfVA3EqLR1gQW1Z/1JoD4OeofBGnjg3HwoJYJ3OTfLdves8R5Z+8+NuYgel3u3evGODoU1m90muYZH2uNWyiKegFd/A5Lz9bLbttoHSM0l8vr2R5g9m72uXT0ocrp6oktNzvhQ0/1OGyUXdEqMIti+Ra9zTcQUHNy0//TOvbe6kXl2RUBBXRjVPJVyANKoy3mMP20m5vG5UWHqZFLLkzIllYFEFI8Ee1OlWU01Y5COCNqzikwLcrcyoyHKYLnCR5Yd4FrqFV93r2VWarZSeC8mnJZ5gwxuW765XNAA4qnGZej1SzGLrkol4PZmjUfbTJr+YPjjLfSPNQDmcL8//eXRvat3s5y3u4xMZRU/wBaUFa2lQ5IfIAs90pDUCOlS5mVQOkI/yGTjGP8J22DeczUsB1YjYdpqPXtL6x7LRgNsv+THrEVAGOIVeEzVDA8338LVJ3z12ejTjj7Dli2xo92aZ/fgUmD5Nw5zsPA2V8Pexqod/+MJvzhxp9riah4+jzUL+ZIXtmliedp1bE598kWIcpSahSWUvsUZ2XBM+SCwVMaUSOOckReTn6rl3Ve5rKIoRsmaZT5WsDZqC01U399XmaG9ZEOxZn2Se7YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(2906002)(478600001)(5660300002)(6666004)(6862004)(4326008)(44832011)(41300700001)(8936002)(316002)(66476007)(66946007)(66556008)(36756003)(6636002)(37006003)(38100700002)(82960400001)(6486002)(8676002)(6512007)(2616005)(6506007)(53546011)(86362001)(26005)(83380400001)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Y5nueWmD8yRKWqBVbN1ILV1frQa/3OsmvMYT0O2pTGORKEBkmeAcX450cEm?=
 =?us-ascii?Q?VnlvkpqPM3bkHfPwKzcdRcZLqjI6ZeSTDksXUqoqOK0IFn+JQVfG42EnJTPg?=
 =?us-ascii?Q?UXbeWd2Ly4TVb0J1/9bxRoOv86Smf2L9XP4aUHnnud56fSzeA1C2BlL1vNbE?=
 =?us-ascii?Q?rQMza3QLIPf+PNLcdWy5I97oKmxFgtlzfkqgh8WENtatbfCSMW1pN31ZqyjN?=
 =?us-ascii?Q?rK2z6KeDcpRmxQjGLsQRY4NTgexFbaJqoZBY2wV05kufuYhD7mMzxkVBSqIu?=
 =?us-ascii?Q?LTG9CDtMhcCifMbphHkIX2eLJcda287RvqN4lnouzaAkdf7OGTEuZ5VUVwFz?=
 =?us-ascii?Q?EPaqwohbJkUc2mikSHx4TlascKHjtYpibz89Zawxmir7xCGr7rw9d5XGw6dQ?=
 =?us-ascii?Q?e9Ywf+7ykXT7FhDkEv2lzc6JM2vFSQdBZOzt5/DKNTZfIsjz5ZLpgCNlFRd8?=
 =?us-ascii?Q?IF58RgPdDOuO1jUQRytaZdypVb96ErSaX/l4tcqVDAEjnIIA94iXtQxQw272?=
 =?us-ascii?Q?XiLnb/Hc4OYoZ4wVh2iz06VVBYJFooxsosvGJBR2blEgp0YiIzvM9p/psVCO?=
 =?us-ascii?Q?7OSt4FkFnD4+cV2xAO2F8WyoeZKKKSfPFN0SN09f4ca7dQHtezYComkcE+X5?=
 =?us-ascii?Q?dPckEea6uIal5cyf9cRsWNAk1mSVpzpmUn12UmLUVKjODzr+dcfelDzslF75?=
 =?us-ascii?Q?3hZUcyNbCTa4bnOn/Svf5LFmgYaczH2sxFXDrWhO0/dBpUo6MKLQGU9TLgCf?=
 =?us-ascii?Q?uJtyUX0kyPLJAInzQSeIfKogNxTjA7hmg9MffcLVZFepWSEhkMuMB1CALlma?=
 =?us-ascii?Q?Qos2RdlXas6atZrGWKzVE37/86gDscLBsFLkS3s0vI4fYRw9G2cmAyMrOo49?=
 =?us-ascii?Q?LjaikTlu0+hHnIeOlVygmlFS4iK9egfuK9e7DN5ZD+bHZgcVbV98zMlbuR3q?=
 =?us-ascii?Q?7ZyU+cRlRX1a8QmmAKeQtc0mMKArUCLjFUUBIRnXcSe8/bNc1MTZGz8DfJIH?=
 =?us-ascii?Q?9QXZjWn5DbTWj4ClMzhmCNNPI6PeE4Ty6EQBcwnTJmo3t9z8DtT6ud+jp1Id?=
 =?us-ascii?Q?p3aRJMU7kl07hR0VBaVPjnUdjmJOr/xrF6A3WvwXKXhrehQmqztm2G75IzKm?=
 =?us-ascii?Q?GWzvgXnPx8j0bMIusMfWjcyjnwsJqkmNkpKkSa4RAE0puWMvaY3ZBFYJAM6i?=
 =?us-ascii?Q?GQcverQbYR5t1xLgvdUmMF4FGON1O3z8ovPU1T++TJjiVOrotU5nOFoiJshl?=
 =?us-ascii?Q?Ya7ARinA7+vOYInRdeP5eZu4oToDVr7bJAD8GsKabEblG4na8+6aCJWs5QbN?=
 =?us-ascii?Q?IyZAAuxvwcM4JQ9w6kdurd9SSNmHQk946ShZBXLY8BiapOtq4crU8JlF2ZG6?=
 =?us-ascii?Q?IgkxHzZKmpN41AZ6Wrb8E+2hgcACEFx2kgzPVHGGiDZ922k+B7sEjpfqvnW5?=
 =?us-ascii?Q?B/mdDL0UaNuXh0eMV8uUDUSlkyvqUunwDAJ3fOF6D+/g3X6WqvBzitXuF7+w?=
 =?us-ascii?Q?OChRQOmW02RSq4euhh3zv9srs3LbVtKuKwIZc2q3srheYoQw+rSvdv4Ej2y1?=
 =?us-ascii?Q?QO+QRK8AIXBPg6JmuhTDbC4l0Na+KYQ7wdmmXKeW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdd2d50-d07d-4dc5-65c6-08dc113b8251
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 17:50:46.9494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0449ag8CYAoAw58CVR+1uOd41olteejeUUN0KeqjfbFVCMSMCcUVWoM2GDZBhgtdpZfiR/3cUKfGtvoUE1SwGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
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

On Tue, Jan 09, 2024 at 11:06:19AM +0000, Matthew Auld wrote:
> On 28/12/2023 02:12, Rodrigo Vivi wrote:
> > The mem_access helpers are going away and getting replaced by
> > direct calls of the xe_pm_runtime_{get,put} functions. However, an
> > assertion with a warning splat is desired when we hit the worst
> > case of a memory access with the device really in the 'suspended'
> > state.
> > 
> > Also, this needs to be the first step. Otherwise, the upcoming
> > conversion would be really noise with warn splats of missing mem_access
> > gets.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c | 13 ++++++++++++-
> >   drivers/gpu/drm/xe/xe_pm.c     | 16 ++++++++++++++++
> >   drivers/gpu/drm/xe/xe_pm.h     |  1 +
> >   3 files changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 86867d42d5329..dc3721bb37b1e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -631,9 +631,20 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
> >   	return atomic_read(&xe->mem_access.ref);
> >   }
> > +/**
> > + * xe_device_assert_mem_access - Inspect the current runtime_pm state.
> > + * @xe: xe device instance
> > + *
> > + * To be used before any kind of memory access. It will splat a debug warning
> > + * if the device is currently sleeping. But it doesn't guarantee in any way
> > + * that the device is going to continue awake. Xe PM runtime get and put
> > + * functions might be added to the outer bound of the memory access, while
> > + * this check is intended for inner usage to splat some warning if the worst
> > + * case has just happened.
> > + */
> >   void xe_device_assert_mem_access(struct xe_device *xe)
> >   {
> > -	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> > +	XE_WARN_ON(xe_pm_runtime_suspended(xe));
> >   }
> >   bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index cabed94a21873..45114e4e76a5a 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -246,6 +246,22 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
> >   	return READ_ONCE(xe->pm_callback_task);
> >   }
> > +/**
> > + * xe_pm_runtime_suspended - Inspect the current runtime_pm state.
> > + * @xe: xe device instance
> > + *
> > + * This does not provide any guarantee that the device is going to continue
> > + * suspended as it might be racing with the runtime state transitions.
> > + * It can be used only as a non-reliable assertion, to ensure that we are not in
> > + * the sleep state while trying to access some memory for instance.
> > + *
> > + * Returns true if PCI device is suspended, false otherwise.
> > + */
> > +bool xe_pm_runtime_suspended(struct xe_device *xe)
> > +{
> > +	return pm_runtime_suspended(xe->drm.dev);
> 
> Would it not be better to check for active instead? That way we can check
> for !active above and create a bigger net with SUSPENDING and RESUMING
> states also being invalid i.e another task is about to suspend or hasn't
> fully resumed yet. We might also need to also check the callback task
> though.

In both transition cases, the device is anyway awake. And this check will
be called from places that we know that we are in the transition, like
eviction/restore. So we could convert to active, but then we would need
to check if the task is not current as well. And also have the risk with
calls from workqueues that doesn't come from the same task.

Since this pm_runtime var cannot be trusted anyway because we can not
hold the dev power lock, this will be unreliable it doesn't matter
how you put. So I decided for the quick single shot only to ensure
that we get some clue if we hit the worst case that is device for
sure in the sleep state while accessing some memory.

> 
> > +}
> > +
> >   /**
> >    * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
> >    * @xe: xe device instance
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index 069f41c61505b..67a9bf3dd379b 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -22,6 +22,7 @@ int xe_pm_resume(struct xe_device *xe);
> >   void xe_pm_init(struct xe_device *xe);
> >   void xe_pm_runtime_fini(struct xe_device *xe);
> > +bool xe_pm_runtime_suspended(struct xe_device *xe);
> >   int xe_pm_runtime_suspend(struct xe_device *xe);
> >   int xe_pm_runtime_resume(struct xe_device *xe);
> >   void xe_pm_runtime_get(struct xe_device *xe);
