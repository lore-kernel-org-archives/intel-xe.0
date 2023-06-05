Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB24CC7EE23
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 17:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E9610E1CB;
	Mon,  5 Jun 2023 17:05:33 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8DE10E1CB
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685984731; x=1717520731;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Lao+AnoACYtr7XZ+5G/DV7tLTXTyL79EwTeDu+oUWiY=;
 b=LvjKhxmfDMgHQPi5oUrMdSu7ZsOSuA9MOJ1XFJZGhDQBIRCYSLUQ/y28
 fIGMvb/AC52AwvypB10F7tmU1APp2bj7HChefHKfWWJLwCGk/bbMhPASa
 63Tad01chQ3BVhUtsrNOw9fMDaa0AOfIbnCvQFb0abdEe8XjVZlzwEqAd
 xj3y9ZcX4y8CjPJ5SOVcZT0IBkoti+G7By1P7Y+Z6n1fK4HkOj/+3ZNkk
 3ZWOON+7gS1nafuLEskTlZ2YMqKRb7pWcXVGe1QxQD9wilooyyjk3MPR0
 3JPrLC7pFMn8p3CXaauCtURyIXXpjPH7s9aS6CXx0Eyvj5HIFjvZqNfdT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="442799006"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="442799006"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659161166"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="659161166"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 05 Jun 2023 10:05:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:05:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:05:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:05:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URKsqXIXf5kdoyDEf78FGvToihoUsCHOOVre4dk+2MQHOK8y1c66eBV90dvMDE4d6CH2jBDDB9tmFkQl5EEjnXk+9PA5ii7SKVVfqFq3tFhwqu8XR3cCaXI52XO5kda4QJlUNCBk8h3MJP4CyNWzxl1LVI8lukxyccQQJmNW8RlnE+e4F8N9FoW9BB+Ya9aF19vmqYWzNyp96VnQyJJFNltFPQ7cjndQHSea3DekDZpc4onq3LfgnjQU0R1xfjlg72bKjOIMYr37qpfRTjxg8tEAjoGyzteWq1Sa/oVIOpt/H2wC4BkaQdG6yn1rg+BVm/2qBcXfGXL7TXNTL6tHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEhYD/8WPU+gKSnfTCwfKlhb7Qjs9/sG12tbr8OWFXo=;
 b=YtJBeYHI7JCBE0aDCRTDuu/plOwiFKwaHzSUdNF5MNyNFrj/qg9DDw/1XxqDYh2kseaL8Wo7LeCRvDe4GVnRjjIUKGva97OA4lP0MXhoT79Xal9oesXZS8JTZZnsLa0SK/mWLeGog2xJKOifCtCp2TMwVuIoL6SIO2SBk8EIXQsTYZr2ouLQopco8awaFtjXMAVAY4xr9AFvJVGyreKLOJ1Ll1GJMkqTFmJMy7cBWKV8BU43jPHPZ58Aiu+LDxtl1HTsVqkUWfj51FBIflWb3NZRrrEHVWJ5NyO1jL/8LgmKmT3U4B6jXSKc0mmSpGpAVuvHicy38OuUWZmuvjwXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 17:05:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:05:26 +0000
Date: Mon, 5 Jun 2023 17:04:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZH4Vixiob1JtYkkQ@DUT025-TGLU.fm.intel.com>
References: <20230602180702.17380-1-niranjana.vishwanathapura@intel.com>
 <0541475d-1f16-3d17-8e2b-24885c5f4035@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0541475d-1f16-3d17-8e2b-24885c5f4035@linux.intel.com>
X-ClientProxiedBy: BYAPR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:40::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 745eea27-f8ba-41f5-7b59-08db65e70e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EHkiWvmn8V42S9ngxIyJDeWfigvqfl32n6QeMp4vd148SLEJ/nI6malU8YagNvfskXwyfVm45pG0l0/nXHnsQvgDtO1HnFJr9NAaJ/OmQ+D64wjgTq5IGuTlFxbcL9eKKbsqSmtijV38VXY8Un+vSzlU/Qw3cSFdZRfNCFcK+ZJZX6xp0YY6s6FbLh8ipIAC9lhz8Pz8Ar5IrEElpegOrvpP+tRyvPespxAixJKUp4LhBG2rIRPv/YFntW27u0ilcFt4w6xzokCh76jd4tVw4/8WqTvi2bEzjvkxmILclgG0+ie6Tt+sW53zCeykT61gbMKjsjyW5Lk66tRX61vi8hEgZGbJaqEPNpiw91DwtApDwzTlhyb6sysTNqurEF1remfRsceDfPo2bLFStCpgrTx7Tgfdo8AeCLx3/3Pi6sqQS9JFZCXeMzsSeOWYvqSnW23pwxJGFQHjL1/PYSr6aKbtie+f7KsQ4v5VYwZdJr1hhDcSdgzLc7BRTb7vwLyVxfK6aesMyQ7TTsNkpjpNrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(66476007)(66946007)(2906002)(478600001)(6916009)(316002)(4326008)(8936002)(8676002)(41300700001)(44832011)(66556008)(6666004)(5660300002)(6486002)(6512007)(53546011)(26005)(6506007)(966005)(38100700002)(82960400001)(186003)(66574015)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2RfPqDsGStuGRDlo4CRdRgXrnRElaJ0QQw7cNxnxkTMmSx+MnptWrnldje?=
 =?iso-8859-1?Q?40tRk54NQeRWQWCCWdcz+aWvOF/tj5ib/46YFc9mxYx/V/p+HC+Fw/OmA3?=
 =?iso-8859-1?Q?P6Le6+SoZkkoOiaLIqnBVvwNjxhkVRSQfRDNA9+U7Fr5xRixrvuEdc+lYS?=
 =?iso-8859-1?Q?NMpJ4/0WRTv75VD7ip2ur7f9+SoEDiojuEJf7zKc1kOrJTRkjn2d46tEt5?=
 =?iso-8859-1?Q?M7UFUxfAW8bpGWYuiLPogpuTooymDyuy4k/I49N+/mlEtp8IWUx8oH6GbE?=
 =?iso-8859-1?Q?045XSlamxbBVRdSuo0BM5TDcZxMoRnOWlyvysJq/YlDmbS5lDGPH2ePALq?=
 =?iso-8859-1?Q?wdtxvUsmt9VyS2fbGfA+2YydstykJRjmrNUgRZ5ZVncmO+cpaSLq6f8/0q?=
 =?iso-8859-1?Q?8GD9j6w6z4hpZWWRl3K0A8tgNN/CCf2hTGXOsU08aihjqKXGxhSmDMBCHx?=
 =?iso-8859-1?Q?ePr0lkwJNE/rl7KDaGIw6ycVNqj6PkEasaa7x3OOsoCGskusah/48PAjBQ?=
 =?iso-8859-1?Q?ic5UQV3BkfotAoFDzbR6YZbbhpqx3oGI3YB8BJ8j1VPotmR6MYmtgB2aOB?=
 =?iso-8859-1?Q?ztpSY0sFT+yVTKTr8qgpycw8fZZe0jf1GnlYCAHcuGrVzXRjbs5k5dru80?=
 =?iso-8859-1?Q?UrYnPYTNRBHUEdOP7OpRHYssQFgUAWMtTz1WK5syAIKpiOJroLMfL2Iupz?=
 =?iso-8859-1?Q?2jeMVf+azQEai64dL/3p+IuTNIvJWM+qj8TAidAZb0UjQr/cfWEcFwKQCv?=
 =?iso-8859-1?Q?qEo3YNiyUHS9uJhq0Abr4Wkub4EPNhsoakdqGFDplLF89CPkv8Q+h7VE43?=
 =?iso-8859-1?Q?ln1gTkZru5uqNcoRUfgyPzX+88qU6+I7sdMp3PjeLBHV+y0n2MvNTgNdSh?=
 =?iso-8859-1?Q?Ozpiz33v62htQaz/+7u2bnHMMD48EiyWWFghrUKEjUNYjg4IWT6K3iwRsy?=
 =?iso-8859-1?Q?Pb+lraD9x+u4FOLX7wWD073WDHibNjMi8nMig+SXFiILeYiWYKGKjLqKX0?=
 =?iso-8859-1?Q?9hvhju2PkyS7ZsLDznYNiTDmYqyDbD9MfgtKmn6pus8t+Ds29wXRH9wjSf?=
 =?iso-8859-1?Q?ZmtE2MKa8T89NHaCaSoFfp0zBW15dEVDZPJ2C/onmBMwyP3g+FfcY6rCtR?=
 =?iso-8859-1?Q?EoiY63qcgdAlZzrC7X4U6uMZTTe6+32EwRFs2dFEUUHJvdu5AKS8il0K+t?=
 =?iso-8859-1?Q?337qOP244+u2a4DeoVofWqnMUZEA7yREUmq21armQu4wlEGP89HWXjA1Ut?=
 =?iso-8859-1?Q?70lPRobxriKBYgm38RKBoYy3YjYWp5C9bpMwaxiP4PODPJC/73rgZ6mMvo?=
 =?iso-8859-1?Q?LEm/oR+P/aCyBSzCY4N2SChIr4SgDLcFJooDp0qB3qt1dvPgazt7mbJteJ?=
 =?iso-8859-1?Q?lsAuaAwo5KA3VJRSNqVnE2SZKifSN3bjuWANJEH/UPlPzw+lnh2x2NrXxY?=
 =?iso-8859-1?Q?XxFV5BalOunCBU99Yf8urtxy9hx1UtN0/z2P8cnv43jgBVS9V/1AASblnd?=
 =?iso-8859-1?Q?anIZL9jgGgDTi+0wkZmxqmZ4pgfQyV2CeZ+b4+czyfhbm1Eag5Q/Xqgb7q?=
 =?iso-8859-1?Q?qpMlOOh4baJxnNzon9XXR18zwwJ1qjKjCbtBNR5ToNeh1kFH1gqQfiOgVq?=
 =?iso-8859-1?Q?/uX+WpXfpV8SXcnGSyhmEC4XY7Zjg92MVT+NAxgxj71sFqhFb839lwNQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 745eea27-f8ba-41f5-7b59-08db65e70e9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:05:26.1540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xmFdAaHUTIxR2oPfbtvEwPxJcQR/sujUAofV4M+I0OkJLMXxW4m16giZQBYlFY8Ca1EYPOXeLGB+NJMKblkoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use large rings for compute contexts
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org,
 chris.p.wilson@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 10:33:29AM +0200, Thomas Hellström wrote:
> Hi, Niranjana,
> 
> On 6/2/23 20:07, Niranjana Vishwanathapura wrote:
> > Allow compute contexts to submit the maximal amount of work without
> > blocking userspace.
> > 
> > The original size for user LRC ring's (SZ_16K) was chosen to minimise
> > memory consumption, without being so small as to frequently stall in the
> > middle of workloads. With the main consumers being GL / media pipelines
> > of 2 or 3 batches per frame, we want to support ~10 requests in flight
> > to allow for the application to control throttling without stalling
> > within a frame.
> > 
> > Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> With the DRM scheduler, jobs are written to the ring from a drm scheduler
> notifier when all dependencies are satisfied and there is ring space
> available, and I believe that's the case even after Matthew Brost's changes
> to xe / drm-scheduler on how compute jobs are handled.
> 
> So this patch shouldn't be needed for xe.
> 
> /Thomas

On tip of Xe we just hold jobs in the DRM scheduler if there isn't room
the ring and write the ring in run_job once space frees up. But I guess
we can't do this because dma-fencing rules for long running jobs
(compute or fault mode VM), so after my update we return -EWOULDBLOCK in
the exec IOCTL [1]. So yes, this is needed if the user will regularly
write more than 85 jobs (16k / 192) at a time on long running VMs.

[1] https://patchwork.freedesktop.org/patch/538665/?series=118091&rev=3

> 
> > ---
> >   drivers/gpu/drm/xe/xe_engine.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index b3036c4a8ec3..47c9f119fb29 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -29,6 +29,7 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> >   {
> >   	struct xe_engine *e;
> >   	struct xe_gt *gt = hwe->gt;
> > +	u32 ring_size;
> >   	int err;
> >   	int i;
> > @@ -65,8 +66,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> >   		e->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
> >   	}
> > +	ring_size = (e->class == XE_ENGINE_CLASS_COMPUTE) ? SZ_512K : SZ_16K;

SZ_512K seems like overkill. Also we'd want to check if VM is a long
running as Thomas is correct this not needed for normal VMs.

Matt

> >   	for (i = 0; i < width; ++i) {
> > -		err = xe_lrc_init(e->lrc + i, hwe, e, vm, SZ_16K);
> > +		err = xe_lrc_init(e->lrc + i, hwe, e, vm, ring_size);
> >   		if (err)
> >   			goto err_lrc;
> >   	}
