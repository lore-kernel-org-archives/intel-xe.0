Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B144EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 03:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3BB10E101;
	Fri, 14 Jul 2023 03:54:36 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E55510E101
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 03:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689306873; x=1720842873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cAHKvOPmhWXpLLmRdoFJsIb60Uhw5atul49HWuj9Ygo=;
 b=EtKFSyNQQzeQ+qt9UbnD1caW8OoeBv4U1ZsTXjWj0nSKzkKIoqyNSxSp
 bww8Vk5OcvZGtg6gI0RNmlodoJt0GXKx47T06cgSD9f/ZhPBdxVBIltid
 taEyFMAM0cJrugCvUUfnpTFWib4PUPLcFpNsTnmo+ULPmeqdIU44rVkIe
 t6hfZtgUcnhIG1ZgLu9Fe9S7S55YgY41Dx1+5qaSXmvlI/EqJPD9DOjl/
 FBKatBWySgqk3tM74I3oyBT/rgWF8Hx1AJtif/oE01h/fFkRHZ13a+xoR
 m0vP47yeBJI+yUoOkmL31B/nE7ybsKLFNTKxwlRkBdzV3t9WeM/xOEGym g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451746996"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="451746996"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 20:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792303383"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="792303383"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 20:54:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:54:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 20:54:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 20:54:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 20:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgkbiquUifJQvgHVorBE2/xnGsxF50ll2ykHKYwRsFcR27e/TUsVJ5ZBCnesWpuestUb9DJ3wuCrLxH/UCtYdN0ZxsZEqWEpTdmcQuz5duNjuBofhhTeZpUY28IEaJxQcJUQ6cCRE+kPIjxL8+9J/OQq2Y04gmpeOtt3IgwEVKXMxFhXvLCyKqGpgNe6hpaHJ/IbIlUi36qriubsYp4WwPqezU10rWK5wyPDdiHQncLKv7Ad7Mm1TRdFqXWiQPnkyvXoe6Sgpz3890x90CeUFKpZmlpx5RR+gn/pfcqM+UFHuo3OfqK+iK98xXlSwugGGjw+DKBtSrFxPzu6Id7JJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2CLcXH5wffXTB2vY9lPHHWzma5fr+yTgfPV6Dsi8E0=;
 b=RA6r9n4Nf1Vjn21OL5IiogEJYPuVJPSmNb+MPKRT45sDrOfhfYfrPqZVdgOJNZiqHvIE9s0AHmp6yn4Sa9RpmZGUgrpvO8clM7UwaGeGC/iYB1NXCt/+T4CKN5eaRWT08s9Zq0S0MgIxxIOaNw9tF3AoIZEi5Fwx3t+oM4S7kbjDeCwHVztnFMmUsr2Gr+f00F+P2g6MkVDlwrscnW/BYRoXK73/0WuEWgaSVUV7ku7PAD4u+Tpu9Tr3vnNtYTTGTwWgiZfZ26W/njImSoau1ehHBNdt5454Za0CJRVmQ9AMmOQra6p9aUAFrQ/GwoB2s91RbfdY7J6A1LFQOEm7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8736.namprd11.prod.outlook.com (2603:10b6:0:47::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.27; Fri, 14 Jul 2023 03:54:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 03:54:28 +0000
Date: Fri, 14 Jul 2023 03:53:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZLDGxJsRmdEKrCnZ@DUT025-TGLU>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-5-matthew.brost@intel.com>
 <ZLBdT866TPKU2quC@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLBdT866TPKU2quC@intel.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 49992cf8-2ef1-45cc-76d7-08db841e05b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YH2Z5qGwIk9+QPr3O4QS7W6yXk0glHs+T/WKibS6RmmIxjuetAKL67PXyqOb+7rSmDpfGuO5edm5E3FHtjse8KgwbCmouEbmM0ZmDeKwQfV8Vi+WlTUe/O03XPephm0I0+vMXdzym52vF1bgij6z19+Ue0WN+nqk5cmDRU3VjYOBuTwVFwqoCkoVFp9Kfm0ozaMkkHV/o52NsDH6J3JgX8Q0pzzovxUR3U0hqkGjt5xCpICVNJC9YlyZ1AgPttQ2p6mdQtulxo8ak9iDktZ46trI7Dp+5mbPPG5j+gJtBiC39ND6aWVDg4wiCOg0MJWbOxdjMv10S4Ysi5jc2Ot7E7JS3kr+NHhqYRyCf7vynhmDgKi9yKwgUUR5otwW3DshSbx3Q2Y+AFT3CSxjYGxJLIn7dtNiDnJV3VGN7fsW8Pn7vUpubzcYQWCNgisI7YY7wyldeQ7aUtyixmdyv0RpUufgnvgcT2TgiSGDIr0wouoHhbGCKW9+khS/muNSlzOfHect7Vhafw7HBZFMSh+Yi1Z3lahO/6TdgWKPd0CU5hIvVzqEGQi6juJAVvuKyW8z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(6512007)(6486002)(6666004)(83380400001)(186003)(38100700002)(33716001)(86362001)(82960400001)(26005)(9686003)(6506007)(66476007)(4326008)(66946007)(66556008)(6636002)(44832011)(41300700001)(5660300002)(6862004)(316002)(8936002)(8676002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qNOo1tV19AoIYSKaG12xYDwiFw1X0XqOX+8OCgnOJuu+2IXxVgEWglhTf9GK?=
 =?us-ascii?Q?tqlG8ETcWSVfDUuVImJKrZl4jsp+H/PUzxgY7Sm1TTxIiN7ubpxUJrrea/Pn?=
 =?us-ascii?Q?6DQTr98untTJT8CC1CCT/g5pmKeW+bscNkOPZgxTyd3zgTf0AhYAIM2tcxyA?=
 =?us-ascii?Q?rG+tuM4pFQF1wmaxiIpJYOzvlqrYzg95V2hvt2OVaIhIbCgYM+x5Wf8w93kN?=
 =?us-ascii?Q?M7jRCe16t/G6yP6CcpL4MGIpqavlRoxxCbQdHaAFNpzJA53Em+OSwPCfcsU2?=
 =?us-ascii?Q?UeGp42lq+CBa/L/JmMRR6KPS+d46PzPBzwyielSPA8ozBpepyp34ZepLlIyl?=
 =?us-ascii?Q?v6Zvh0Q/C9Hq1HYWlZZ1sQ04xIf83HRIRIoyJVEA2+p1oRZGcp6otJmSipkI?=
 =?us-ascii?Q?114SqvRytMKI4R8oPbgziVjvqyx0Ekx2W4v655bfTDoXdbbBTlMWAq+osDmd?=
 =?us-ascii?Q?hwlBFaSsqQV6Q9+lgYUwrteOq1/iC/uv3t5sP5qMoDoKDJZ4qI+umWrc35p8?=
 =?us-ascii?Q?vq9ub1TVYXAOl6ZTWArgUzqDOVW2J0wp+mmspEd3pQKBnVod6j8lmK7SgaFA?=
 =?us-ascii?Q?smcDlAdHiLoFnOY+WXxgX1qe0Pu5Ne/P/SRU6g3sQq2TjQS76ROP/F7jzegb?=
 =?us-ascii?Q?3LeWHUgs0vrkP+o047ZyxLR65TBtbvSJKTBJccN7TQnDtfKv/2kVUhjAZLED?=
 =?us-ascii?Q?SwDbCzGFf3dkPsJelnR7j02EuKsRA1r23tTIXTrW9CmBj9GaqZ54K5RDmDZu?=
 =?us-ascii?Q?hvUaizDXFM6fDgJyZIpMm2zGrJFux1PsnHTsd2mgB2S4rQNCcHutFBtDyWhy?=
 =?us-ascii?Q?m+dbMnYzsZkAnXj4R5JqFG/HMJ/oHxmHGSSztJndeaI7DSbrYYK2zVSOPCz/?=
 =?us-ascii?Q?bpROYPlvjvKZPvKMAW3ty7qo3w7N9DYalvto+xZb6/8CIKgx9x0dGLWuwoRe?=
 =?us-ascii?Q?nClNMA9/ynmeE0KIETUPSfNrLa8ZQQSg+y+JAeniUv/PoQNFEQ8P/s+cvQgv?=
 =?us-ascii?Q?kB8qQo2OJP6xLydwPdtt7QBB6sSlSN2e2o4M9SbyGGdJSYu1uBj7TZXYBCUC?=
 =?us-ascii?Q?i5HZddQPbyyzh0u6Y/jvEi0DmqjaDcjWaSDToRoHWkTBrbjyV/piVZB2vlOj?=
 =?us-ascii?Q?s+VO2H8AIbeKSQ0xsRMjPFtJA23SqxDfc/v6MNoDS7V97x/PRjzOAutCsZHe?=
 =?us-ascii?Q?/E11F3D9+emhXpv3poaVAte5Zuuf5Y7neUlD3jt1xrPYh4DSBTzwWL6fdWH5?=
 =?us-ascii?Q?G1s9Pz+6cKTx7a9VEq6ktCcjAFkvaQcTmV641Z1CRbnr8AH8MEL8oFdKFpJE?=
 =?us-ascii?Q?2WmraNsO0PpP7cHiLL0WZxh2iTpDrowd7tgL5fHNBpHR2iKiw8YSW336m1mS?=
 =?us-ascii?Q?umQy/Y+OGXqs6m3Q67u7tmU3wWTSb3GrcM+wZyRs7bjd/5iwLuMc3LL4NLYj?=
 =?us-ascii?Q?F0C68fsn8jpUG00Qru/r5kJFqNJcA+tWWa8RijQV3HM5Yp2gOgZAqpP9vTlv?=
 =?us-ascii?Q?W7LF0VP0u2IVwsVaCnsfHwXmhw+cjqGNEPjlvoFZwP8/pZmf0jdbDB3uPIeB?=
 =?us-ascii?Q?pkHw0vG7YL1R+1AMAtsWF2xrbE9VwykhQgOS9GSnMrRxTjEDhI+JCK3BbbRF?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49992cf8-2ef1-45cc-76d7-08db841e05b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 03:54:28.4152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywDaMpKSJAW3iNmsPWS99XsK7BEP1RQ2hOHgkeEFf5N3OkauF8IcZqrbQroNcC8CePqVxK31aN6mWZ4ESFgwDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8736
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] drm/xe: Combine destroy_cb and
 destroy_work in xe_vma into union
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

On Thu, Jul 13, 2023 at 04:23:43PM -0400, Rodrigo Vivi wrote:
> On Tue, Jul 11, 2023 at 02:27:47PM -0700, Matthew Brost wrote:
> > The callback kicks the worker thus mutually exclusive execution,
> > combining saves a bit of space in xe_vma.
> 
> could you please open up a bit on why they are multually exclusive?!
> 

Not sure how else to word this. The callback function (below) queues the
worker, the callback argument at this point is safe to clobber.

1047 static void vma_destroy_cb(struct dma_fence *fence,
1048                            struct dma_fence_cb *cb)
1049 {
1050         struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
1051
1052         INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
1053         queue_work(system_unbound_wq, &vma->destroy_work);
1054 }

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 2a8691a48c55..30beae541aca 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -51,11 +51,12 @@ struct xe_vma {
> >  		struct list_head destroy;
> >  	} combined_links;
> >  
> > -	/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > -	struct dma_fence_cb destroy_cb;
> > -
> > -	/** @destroy_work: worker to destroy this BO */
> > -	struct work_struct destroy_work;
> > +	union {
> > +		/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > +		struct dma_fence_cb destroy_cb;
> > +		/** @destroy_work: worker to destroy this BO */
> > +		struct work_struct destroy_work;
> > +	};
> >  
> >  	/** @userptr: user pointer state */
> >  	struct {
> > -- 
> > 2.34.1
> > 
