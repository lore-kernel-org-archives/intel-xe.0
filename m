Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2607C2BB3F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 03:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C97310E056;
	Thu, 16 Nov 2023 03:31:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138FB10E056
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 03:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700105508; x=1731641508;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3asFdQJ/XNAjXo2u0aAS2zFUJ7PMo0Inf6PcQmV7Qko=;
 b=d4B+KtSifJODurY8z7CSUf0ViQyJng+1WttMsL3xkl1E50N7QESGJQgX
 DtrAvEjvmm582AdfxE5j5p8TLK0ry1fsIJhcVPH8cGl642G5PvOtofz80
 6BFbAXjzwWgbho9s0SULkRxZzveqYBgmbGf934sTqOpke2Nalc6FF1NYn
 uhHE4JuGMBbPCAAtZmuKERz88mWGtebCCB8sEQoAy+qlOnqliO8tYE85T
 S05tIfNAk7XCRvK6yros7jppItleoqLpFR158kjQW41abkYVOsjotRf0H
 atrDMFfIUkSkQxfZDD3BpODUQlAvi/SgjoPDlnL/oNyjFCu2vzBhK/W+C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4133059"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="4133059"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765181515"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="765181515"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 19:31:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 19:31:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 19:31:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 19:31:46 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 19:31:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+edjUlmfIkgTekIUSpis1ww3isDzqcs9N5IfZG5+q429YikJcOdediph73qDbVh5NQ7y1LmDYpSbUK3mhx3KWoj4MrOAUwLBqWP9V4AQWbbkUVQKUZhihbx1YWQketi5phjBleFFmj21DBM8VL8DDMxFFKOuRDYmdfxMjX8AxzpDM2s6E1ar8nXqD+xHsSUkab0wCLgnisJFmabR7HHWM0SQKdho+upzbwmAAovkQxFbzBCQNCQAR33BXChl+mFGXejkW01W5XbWUueIj5IFTdnL1QxKixapOvlVSw07nG0aDkMH4jhZZ8kSxohy7EMISk8A3OkH75x5UtlknVKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdA47YoWfR8Mkcsg6ml/2B2JQ/6WaUPrzHyUrso2uxQ=;
 b=Q1ru3gewpVk32sPGaiFc9eYx04RTvC2Ixoljd8siZFt8d2MfqjQQ5a3ISBF3R/CvlBYiUpkBPtcKF1Z0iJKN+D/KVvlcsIuPovTo89slh6RDosoA/bnCwxyz753pI3pyIwMWakM0AAk2a1gS0IeVFxeHvAzr7ajgv/ULuTJnEWdzLTjeO9VZ9jrbJ611CLN2TIoIA6bSE128h+fwsNBRCjQxw2sd8o6gb/GRhhgA9ItY4cIzZgLdjnP3q25neObR4buPt4P1ZjDCCmpqLi41eAfHeL8O7WoFOOo9MmjGArh1+OMferSM7gwUEqg21HBz318c0D8N8dPxgWgMXrk9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 03:31:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Thu, 16 Nov 2023
 03:31:44 +0000
Date: Wed, 15 Nov 2023 22:31:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZVWNHfCG37RR+OAl@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-35-francois.dugast@intel.com>
 <0ed7636f3caa90a01cb1128bf106d9da899f8939.camel@intel.com>
 <b5252d2f0873bcaebf0ecd1fcd4579020f7821f7.camel@intel.com>
 <ZU0o6z5MtoaG8fuZ@intel.com>
 <d6889593ffacce61174f109832537176b5f2d28c.camel@intel.com>
 <ZU1JYWbHgWF3lain@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZU1JYWbHgWF3lain@intel.com>
X-ClientProxiedBy: SJ0PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:a03:338::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: e834dc6e-f58b-49d1-82f8-08dbe6548e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51GYDaYec5blBGadDDDn1iQrqD6G9ZzrAdwiszVbjp3dKUZ0MesLYxa3/kl0k/T9KcE6iYHEozSiaYGQDwkrMhu8sx5Dmmv1YoruKr5EuK+jVScHtqkCcpcARBFbvD2Q8zkaSj129+qvtOEadL4n30mmpG0tP8GqEnz6v64byAQFSl4MoAu/8CEYhot30KG//by9hoytNuBtaVfvEmT9k/+MNWJQVoE0hUD4SomXxZCebB1kvvkN4gaM5l/q1lAbTPtbdx1qR0UzsgNVOk1tCX46QiM7QdK+Vyj0x0/GiRrFr3ArsrXIeyBJFt3VTkllZ8GSTWrvV1DhpOSm+nsfyKEjnQOaoiDnVEdXfzwV3IGdA8VL0whnIiXo05RxIQ6c6hppM2yKDMLQqQDxLj5aKffiTcme1NXmH4AvVXiEMmipXA84xYhW829xtcCrw9slGD9jgUjYNe6mrn4+pj3G/l+LmKYg7BPRTj4+a3/gqwoQ895+o2r3NzbsOtYDJF9zhcnXdDr7+nrV71nHzZAg1PSpj06TBLOQ3SlQ3dT+fXzL8yddVeoFtjT2UF8ZtYo25fPJjI1MsHBq279c5GLfKi6d6CD95cL5wELcXHokfdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(66556008)(6666004)(6506007)(2616005)(83380400001)(6512007)(6636002)(44832011)(8936002)(5660300002)(41300700001)(6862004)(4326008)(8676002)(2906002)(316002)(6486002)(66946007)(86362001)(66476007)(38100700002)(54906003)(36756003)(478600001)(37006003)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aCehaKjnea/iYwqUyQVDqES2XUcRnw0OKMWJKwWSlSc3QZqvWo/yJSt+I3?=
 =?iso-8859-1?Q?NzYjGM6PVr3abM7M/f9b8LR2Ei/E5a8b7+bqzRT+KXoTXoEn2c05XDsPfB?=
 =?iso-8859-1?Q?c7m/K4HT/RkuT+88ixiBjK5UW0iAUL0+snq8CYVHTdEZZ+GgrMgLSuN7cA?=
 =?iso-8859-1?Q?NT3dZJwuqGIkJpsIp61Cfm9baDV/rilM8F4+lVNdvLYquUTInR2VPw8hBl?=
 =?iso-8859-1?Q?2oQEZ/agiQXhSTzQ4HkosjDyJ+9F9EI0cltmtDDlh/zSD6Xdz3xLWkSKwZ?=
 =?iso-8859-1?Q?VcmgH3oXkpH7wcD41DqlVV5ZrYTb7P1VBdksoohO8yby1kALksG9fajhm0?=
 =?iso-8859-1?Q?HSeTRUSSlltC2VeDtKBi5BCLlm0SqXPDZXBrRWl5+IQ5r9zD+27vn+Nmcw?=
 =?iso-8859-1?Q?u9esqX8rknEYjfl/d5tVG/G7An+tyFhsh0Pjz5Fxdgn6BnvXKvfVA3lCNM?=
 =?iso-8859-1?Q?cAnNX3FQLEp8wv77aG7wMpRx4iMGClJ817s7p3T9IoGijPrS3ZICqh+qlz?=
 =?iso-8859-1?Q?kDo2FVYV9aOlwGp0WYaGN+yB6fs2QOSGrzUnQBVNGny0FBDzuey4Z7W71s?=
 =?iso-8859-1?Q?EGLn4j7R4681VZyAycgMyRX9I5Z/aQHI5496mfCae0uhp/3IpHQ/I7uFDB?=
 =?iso-8859-1?Q?7jyLtXQnkZFRtL98MzXlWJrbg19WhF9mVLM26KqEMqU21CGkxCc0TnC89U?=
 =?iso-8859-1?Q?4/+BRxHuQGFN+y4pbaHuGVzEHY47bj6Xaf6ZkSI4siSSfw0dnjGq4fabAB?=
 =?iso-8859-1?Q?GzWomF5fr1xPA0i7P6kyrzXlI1lPoONCGFOEs63IRTAucO0L8zK3nAvJap?=
 =?iso-8859-1?Q?1Er9bzHbzBVj6LljSQltRGAkzPhnC9rDD56T80ZjopLk/on1NLzXWzi7Kk?=
 =?iso-8859-1?Q?CQZr/QArXZ50UFl6eWVJNlTahGBwhNZ+Eq+2uknmzR1TRF0+gd3QrLhFyJ?=
 =?iso-8859-1?Q?Sd2sqcps88ljR38g8Ft7gUJ64zNKf7ciJaBtYE8A/nV67IgXBbVjUR0blt?=
 =?iso-8859-1?Q?ufk/B41E96qUNJKTkm7x69Bc0jB074iojAmqUgHIXYnB9v7sTi6If7ObGO?=
 =?iso-8859-1?Q?F7SVZo9KdLeZjmlWdYnEaThTQiOGbheRDHW5Klm221L8lenx0BjuD5+zYg?=
 =?iso-8859-1?Q?vZ5rPOfJlhj4LLwm8tgzsJd6ybgUSEoOZMO6DzXwmrgXrBXG9BjejCJ30y?=
 =?iso-8859-1?Q?FhUd6lxvR4gWWB1dpTth7rj5cIxVigT+Vy9wwSY9mfwSkAx+Ey0/L/G3X2?=
 =?iso-8859-1?Q?S1CxE5+dGCaPpR9QqnSsm9AhDUJ1+3gULJg+8/OoTqDx11C7faGvzQzr0J?=
 =?iso-8859-1?Q?y99aQNEQwlgZYEHJCIn7bjobZ4exs+DtIKGPHovF5QiZfadjC/FJ0t0uDM?=
 =?iso-8859-1?Q?8xKb0lDVuLrpHsyxrMPTJ4Cf8Ch8umZvpT2FDL6cwwUILwwE5+Bl5nUcic?=
 =?iso-8859-1?Q?v/GvjkwqzwpF8bz0MCbAKrHVkVKCUNtlD4Zu56ULq+4ss/ytukKUed2lau?=
 =?iso-8859-1?Q?tLE/otcj5gu+mRZcwcNn7QyljdagyldPfe1lsNVGFXYUNsLg3cfAop2Jy5?=
 =?iso-8859-1?Q?GdCZ0mGwqxEKcwele/IBLbuHmuRnYJK5F/ugtD58KWkD1fvvmuNoQGm/Vp?=
 =?iso-8859-1?Q?gRe+ZP/KN8FwoJFSrBfReR8Hms/GbHvJQA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e834dc6e-f58b-49d1-82f8-08dbe6548e3a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 03:31:44.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfsyBYIjfS85K0IL4OdMkoYuF322qcMcPKZRYL13GpV2xAvjk0bw/sgAXe5bPl0Bg52chWxchODU1RSJUUQwPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 34/50] drm/xe/uapi: Move memory_region
 masks from GT to engine
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 04:04:33PM -0500, Rodrigo Vivi wrote:
> On Thu, Nov 09, 2023 at 02:50:04PM -0500, Souza, Jose wrote:
> > On Thu, 2023-11-09 at 13:46 -0500, Rodrigo Vivi wrote:
> > > On Thu, Nov 09, 2023 at 04:35:19PM +0000, Souza, Jose wrote:
> > > > On Thu, 2023-11-09 at 08:29 -0800, José Roberto de Souza wrote:
> > > > > On Fri, 2023-11-03 at 14:34 +0000, Francois Dugast wrote:
> > > > > > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > 
> > > > > > In the Tiled platforms, the memory is more tied to the Tile
> > > > > > than to the GT.
> > > > > > The distance (near vs far) makes more sense from the Engine
> > > > > > perspective than from the GT perspective.
> > > > > 
> > > > > why not add a uAPI to query tile information?
> > > > > this is duplicating a tile information onto every engine of that tile.
> > > > > we could leave reserved fields in the tile uAPI to include additional information that might be relevant in future.
> > > 
> > > This is not necessarily a tile information. In PVC, truly the mem_region is tied to the tile,
> > > but we don't want to fix the uapi in only one platform.
> > > Like in the previous, the mem_region was per GT. who knows the future?!
> > 
> > Older platforms had one gt and one tile, MTL has 1 tile and 2 gts and in both cases it matches with having a tile query.
> 
> but we can have a platform with multiple tiles and no memory on any tile directly.
> but adding the api there you are limiting your future. or sentenced to have a
> version 2 of the uapi.
> 
> > 
> > > 
> > > But the engine needs the information on which mem_region could be better,
> > > regardless of if it lives along the same gt, or the same tile, or outside.
> > > So, near and far sounded the most generic and future proof way.
> > 
> > Memory regions are also used here in drm_xe_vm_bind_op.tile_mask/pt_placement_hint.
> > To me it looks odd that I need to go trough all engines to know what are available tiles.
> 
> that won't be the case. we are going to change that to the sched_group_mask.
> 
> > 
> > Other way to make it future prof is keep this information in gt query, each engine will always belong to one GT and each GT will always belong to one
> > tile.
> > This way it do not matters if the memory_region is tile specific information or a GT specific information the uAPI will be consistent with less
> > duplication than putting it in hw engine.
> 
> Okay, with this I can agree. Although it might not be necessarily the most future
> proof one, but since all engines live in the GT and the 'distance' to any memory
> would likely be the same for every engine, then we could have this way.
> 
> Oh, I though about that. that was another reason why I kept the 2 patches separated ;)
> So we can drop the second and keep the renaming.
> It would be okay by me.

Jose, I was trying to drop this, but then it waterfalls to the next patches in
a very bad way.

I was planning to have engine info as the informational part of the engine:
tile, gt, memory "distance", and convert the eci's gt_id to a generic number
called sched_group.

In the current platforms and schema sched_group == gt_id, but I didn't want
to make that a hard tie.

Sched groups could be a group of engines that can be used in parallel execution
or virtual balance and it is a number 0..n regardless the tile where it lives.

gt_id could be per tile and not global for instance. Or even we could have
sched_groups that goes across different GTs.

So, I kept the patch that adds tile_id and gt_id to the info and
convert eci's gt_id to sched_group. However the IGT patch is becoming an
ugly monster with places using engine_info and other places using the eci
and even mixed cases.

IF we drop this patch here, I believe it is good to also drop the sched_group
one, but then the engine_info starts to not make sense at all anymore and
I would also drop that ad simply add all the information to inside eci.

What are your thoughts on this, since you were the first to envision the
engine_info anyway.

Thanks,
Rodrigo.

> 
> > 
> > > 
> > > > 
> > > > other issue here and in other patches of this huge patch series.
> > > > 
> > > > a previous patch in this series renamed near_mem_regions, then this one moves it to other struct... please drop the first patch and rename and move it
> > > > into a single patch.
> > > 
> > > okay, rename and move in the same patch kind of makes sense. and patches
> > > could be squashed together. But when doing the IGT on the side, I felt
> > > that small changes were better, so renames goes with sed commands and
> > > the patch was small and clear. But I don't mind if they get squashed in
> > > the end.
> > > 
> > > > 
> > > > a series as big as this one will cause reviews in KMD and UMD to take a while...
> > > 
> > > that's unfortunate indeed. But big patches also don't help much to speed up reviews.
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > So, let's move this out from the GT and into the engine info.
> > > > > > 
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_query.c | 14 +++++++-------
> > > > > >  include/uapi/drm/xe_drm.h     | 27 ++++++++++++++-------------
> > > > > >  2 files changed, 21 insertions(+), 20 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > > > > index aa5743e2e4d0..49a9b36f1193 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > > > @@ -217,6 +217,13 @@ static int query_engines(struct xe_device *xe,
> > > > > >  				hwe->logical_instance;
> > > > > >  			hw_engine_info[i].instance.gt_id = gt->info.id;
> > > > > >  			hw_engine_info[i].instance.pad = 0;
> > > > > > +			if (!IS_DGFX(xe))
> > > > > > +				hw_engine_info[i].near_mem_regions = 0x1;
> > > > > > +			else
> > > > > > +				hw_engine_info[i].near_mem_regions =
> > > > > > +					BIT(gt_to_tile(gt)->id) << 1;
> > > > > > +			hw_engine_info[i].far_mem_regions = xe->info.mem_region_mask ^
> > > > > > +				hw_engine_info[i].near_mem_regions;
> > > > > >  			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
> > > > > >  
> > > > > >  			i++;
> > > > > > @@ -377,13 +384,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> > > > > >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
> > > > > >  		gt_list->gt_list[id].gt_id = gt->info.id;
> > > > > >  		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
> > > > > > -		if (!IS_DGFX(xe))
> > > > > > -			gt_list->gt_list[id].near_mem_regions = 0x1;
> > > > > > -		else
> > > > > > -			gt_list->gt_list[id].near_mem_regions =
> > > > > > -				BIT(gt_to_tile(gt)->id) << 1;
> > > > > > -		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
> > > > > > -			gt_list->gt_list[id].near_mem_regions;
> > > > > >  	}
> > > > > >  
> > > > > >  	if (copy_to_user(query_ptr, gt_list, size)) {
> > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > > index 5164ed150a2e..8e84ef6fd46e 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -228,6 +228,20 @@ struct drm_xe_query_engine_info {
> > > > > >  	/** @instance: The @drm_xe_engine_class_instance */
> > > > > >  	struct drm_xe_engine_class_instance instance;
> > > > > >  
> > > > > > +	/**
> > > > > > +	 * @near_mem_regions: Bit mask of instances from
> > > > > > +	 * drm_xe_query_mem_regions that is near this engine.
> > > > > > +	 */
> > > > > > +	__u64 near_mem_regions;
> > > > > > +	/**
> > > > > > +	 * @far_mem_regions: Bit mask of instances from
> > > > > > +	 * drm_xe_query_mem_regions that is far from this engine.
> > > > > > +	 * In general, it has extra indirections when compared to the
> > > > > > +	 * @near_mem_regions. For a discrete device this could mean system
> > > > > > +	 * memory and memory living in a different Tile.
> > > > > > +	 */
> > > > > > +	__u64 far_mem_regions;
> > > > > > +
> > > > > >  	/** @reserved: Reserved */
> > > > > >  	__u64 reserved[3];
> > > > > >  };
> > > > > > @@ -401,19 +415,6 @@ struct drm_xe_query_gt {
> > > > > >  	__u16 gt_id;
> > > > > >  	/** @clock_freq: A clock frequency for timestamp */
> > > > > >  	__u32 clock_freq;
> > > > > > -	/**
> > > > > > -	 * @near_mem_regions: Bit mask of instances from
> > > > > > -	 * drm_xe_query_mem_regions that is near the current engines of this GT.
> > > > > > -	 */
> > > > > > -	__u64 near_mem_regions;
> > > > > > -	/**
> > > > > > -	 * @far_mem_regions: Bit mask of instances from
> > > > > > -	 * drm_xe_query_mem_regions that is far from the engines of this GT.
> > > > > > -	 * In general, it has extra indirections when compared to the
> > > > > > -	 * @near_mem_regions. For a discrete device this could mean system
> > > > > > -	 * memory and memory living in a different Tile.
> > > > > > -	 */
> > > > > > -	__u64 far_mem_regions;
> > > > > >  	/** @reserved: Reserved */
> > > > > >  	__u64 reserved[8];
> > > > > >  };
> > > > > 
> > > > 
> > 
