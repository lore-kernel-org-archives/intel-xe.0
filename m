Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C6BEE0211
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FDB10E114;
	Wed, 13 Sep 2023 22:37:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF6610E114
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 22:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644661; x=1726180661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+VwcTIt9ROTXNgPgaRLJ1KMZ5i+R2KlIFUfxTNZfEdM=;
 b=FJuwRZqyw3UJvviyyR/2dBSFpDmPJx/4Ys2BJZXeb8NhFeNzmEcF8dYJ
 RvTaqXMq5E4tqsOMty/NbfLKaZCFj6WOrE4wAbBqE+Azx0Qhptba1ke6o
 dqn/0hp6L40vkc0589JV2A0w4mkUQwC+CkIKdxiBN35ptLKhd3mtEBXCf
 w4VlfyRhHLHQqaLTu3iHlfA2ELzbGW74R7lZyT6vDr3LWRKTxcCJZhnpb
 gw7P2eQMuGGnxJQqYQf/ZTlgfAKwcWyxNladZpvIVuv8tWPWA8ORFVGhe
 lSiP6EiNyyhpimGp2EZHNEQEek2yhSn8NElbWLnzu0Mzu2hs/vtK5QkWB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="381483863"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="381483863"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773651324"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773651324"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 15:37:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 15:37:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 15:37:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 15:37:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CECBzol0Mc+xY3W+BsF3p4Rz0Ql6y9eurZoYt7PU2EMJc8MjV/N2GHu0q/iLstsEoqZ6IW7CGN1aNRAcHc7ok8lXaJEgKnl6fEjWnHdJZ1B9pnBVQgOjuhoP645Cb/VNZew+wXQBwCqn4piIbiM9F54teLx7MNQTDALkmMskhDPskBML60YCHUBXMyi3lCopMkEDa8pYVavEnlY4Agv0y/5bumZaQNnL53cVWgR71wPfRBvrPg2nzjs0u63Z1EAkHoSEkO6r8B0bFBZoGpRino+T9fozUPXHo/n+VrX72TyS/7RGUft6Z2hMxb2fgdePmeEEkRxCR5bQYG16Srj/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoZUmJHMDIU5bVMMVnSW6tDMvxOC0eLALJRL7x5Jsvs=;
 b=P1C0+mTbPZc0sVmTFfv/znYeao4WOrk+5taz1gXTwAqzbyFfJNfjox73X0FOB++wA1IhbVmflRYmGNokqUirZDUIrWpR2AdzCXtvF1EuJ5iXurBEZmjOnFXGkEyEvN5ogxOScQMZPRK/8BPeAKcL33Kl9ScggjU9FDTv12am2NZdgxY6NFGJxqZzaYCSooLMtoqfCxYsVRkRJvhMx6psTYLnXsxXsMByURy6wHIGELqlIjCvEUukK9u0Vaph/Wir0HTGwvWPDQO7xCa6ZbZr/wu7DZk5v4z3asdtw2+39sAMVpIgItDIc8lV2KiMYJl+QAQ9alADnHSLmR1Xo8oXSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 22:37:38 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 22:37:38 +0000
Date: Wed, 13 Sep 2023 15:37:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQI5rvPF6hZb9jOs@nvishwa1-DESK>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
 <20230912235159.2111118-3-matthew.brost@intel.com>
 <ZQIrrP+qYHEDR1+0@nvishwa1-DESK>
 <ZQIyz5d9PpVYtbXP@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZQIyz5d9PpVYtbXP@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::30) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL3PR11MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: ed500c57-4c23-4617-a41f-08dbb4aa084a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1A2085+IJ0tOdc1y8g/lormfIbVkznNSisj10ZP3vGCnnDkyrY2N5vJMdjM0jYZtCupTSh5UkiS+Pfl70W532874lwOdD556zwP5LvZy2HQy02+RTp8ucQqtfbthgIJniZ7ky5MeHhkccAwuGkQhWo1P8FgN9h3wDCUvMF5lS8YFbfVYeEitUwh56o4Obbho5Vhro2sFLBrO4lny85LbFVfBaFDIEkn8spZhmFcfa3Ey3ZqvcLfrtVOK/v3jSBI5sdNpOL5We5mocKrX4McprmARchIfFpRlzkqby74CpGAoc/XYDULdCQIZg4uyw9HUZw4M+9J1ccVOvYjZFpxzu8eb7UNBUfl5nRfZ1Y4aJdHdgj8lkegQk5jbrsyzkjkgtNqE+W9y05shoHI9wrvmcgNFuwotlDr18unlD2ko5ZbUbKeC6+bc/HD3CpRxj+52H9+wKRoPI8/l7+VT6KERsHtYI0OCxl4q5/3z1b6NyVDeXVSCeiHV2P6xMqaYV2yguQO5INUK8K/cEQBDy6V5e7Vt0ZpMF7Ud8X24ai6DPPRF+5DQpHy1Xm4W8cPHBq4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199024)(186009)(1800799009)(6512007)(83380400001)(9686003)(86362001)(38100700002)(82960400001)(6506007)(6486002)(26005)(478600001)(6666004)(2906002)(8936002)(316002)(66476007)(8676002)(4326008)(44832011)(41300700001)(66946007)(6636002)(5660300002)(66556008)(6862004)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AyT+lqQMGJwyYTprsGMEsY5yt4cy7ZHAAVHXpvfYFxPXIKgIpdvQdTJ84K8e?=
 =?us-ascii?Q?cOu5szp0/qqI8v0hO9JhneGespd7ZTm61CvxosvnldzF4URbPr/qDoaHWWjX?=
 =?us-ascii?Q?gFQQkQe6HAzA/lJYOaOJPbVw6HTDCC6zf2lXGD62GFb4jHpQ15fl+A/gf2by?=
 =?us-ascii?Q?TIB2sEgc35rfCJeWZBQbItp8pMhMFqBNrhV6r+kQu/cIAxe73P8tRWOX119H?=
 =?us-ascii?Q?3wj0whuu2gUSmmji4j/5Bnc6OMar//VnJyJiZzA4KamD7gy07O5RLFOME+ps?=
 =?us-ascii?Q?cAgY4XFBSwv7TG625dbLJglBv4CtYk4D65CE7pseQZn9EAFgq8qkwQnIpvkO?=
 =?us-ascii?Q?eHQ/IVDtledoOLnpYOcI94aMacY66qqZFgAsCy3lwPcEUVSb3APZyLR40Gab?=
 =?us-ascii?Q?0SwF+y86J7BwT55U7XVHF2YwKkTypY/5X3tBsfJRnr/qNTMtsufWG1THf2HN?=
 =?us-ascii?Q?ZuNrj3DXJ3rZeeYmjwfJirG/0mpJEwwRlybdxPlaGADCo8V9UuGTm0GUjFxT?=
 =?us-ascii?Q?fxZOIu/C8EOYBE5JT/cvXSv8oRlbsYYUEG/VMW7wf31Jg6xbMlYZh5cWA+cF?=
 =?us-ascii?Q?a+51LkCpGTzUMd2icbmrWKXWlbRZUw5UUR+Q2/Po6mPQnFQ2JQ+VOL3wH9Pw?=
 =?us-ascii?Q?dZraaZjpjmVjyhicnhfiILvklXLfquGWOx2uDMYtcICDjGsar0/31xDPEygk?=
 =?us-ascii?Q?zN/UXba18ZPzpe0ndcjaxnNMxexkYu6aDFi7ZMf4zGGmdupicnYAVu2XS+um?=
 =?us-ascii?Q?Mu+YTY0sojgibPlhGJNqQ2skgmab1qcpuounW/rbhAzMN0W/CarGxV61dFzB?=
 =?us-ascii?Q?GczVTmXnXsyncf4QvjHjCwLE2uozuoXqBEVp3TJC5WD3BSwIQVQlqmc4ZV6u?=
 =?us-ascii?Q?6QX/QqKq4V/X/dfGjuUS22J0g3TFDYr/zQtKYKrnDfIo+Livltr399x+VRrk?=
 =?us-ascii?Q?uCJIEkRPZK3K9RYLXy0LQCblpFQ3Kxs6+xU3YhezaU5qWPOAKECOxaDgXYXi?=
 =?us-ascii?Q?TqRBo8j3mwZuXhIMVOKZbfjgm1FqFVBaz7Tu87XP/mXEt9K1CRzGwxSeghgE?=
 =?us-ascii?Q?Xm+aVzIPLt5ezGYv/7PdlhaFZdlRCx1UOFKTj/KuiuHAT4l7zZqs2HoyO4vX?=
 =?us-ascii?Q?70h0gpyseePbDKVU17tT8agnRYtp3LGr1BQ5ixuQ1M0vFmUc6r9cZOxAQIdu?=
 =?us-ascii?Q?+FtEf03JKovjOrBFa5DjHjIe3gecg/YRVTJV2gLgQl13Tq1EFujFvQD4TaX0?=
 =?us-ascii?Q?S5+79mJmar+KTSDKhLSg3Rvq52kRRCtocpix5aGOIgCUID6VWDBXNd4dUyBx?=
 =?us-ascii?Q?PNK/Bw+VV16AmFKjA33HcE0Zwg2rA7960+JCfj4BgzNmZdxtaJX+ghA1/Nhb?=
 =?us-ascii?Q?ipV3TTK7nb3lDfQMBYjFnI5s8ItcUY9z863bego1YMiig6VerirTogRHiNsM?=
 =?us-ascii?Q?tOJaeThztXgSQGrqDDAYM35aL0+en0rXAaMv0ANiManGZFq5V9gNj2BkBT71?=
 =?us-ascii?Q?BIgzJ2sw7ETpuLpAmrsiZa/9S1rNbml2vU/HNuAw64denKmou8pcqvkEy1sL?=
 =?us-ascii?Q?4bcNkwcpmFCWaNuQ+h8uDZqL6r0DeYhW6xpKg1TjQbCqps3mKL9ub+APPuQJ?=
 =?us-ascii?Q?+ZCZpxyFTfw2g7cjheiHJDo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed500c57-4c23-4617-a41f-08dbb4aa084a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:37:38.0754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpwo5m7/tkY+3SA8gQWQWvw7r+le6r9UY1VhciSjsJNBZZ++Bjyh/2HHW8UhXEvqRuLqV0TqHMI9yx15/I/Vk3WzwOUxQ6GiCd0Fkt10BQorpZ/NvpXGMb8BguaSW10K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
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

On Wed, Sep 13, 2023 at 10:08:15PM +0000, Matthew Brost wrote:
>On Wed, Sep 13, 2023 at 02:37:48PM -0700, Niranjana Vishwanathapura wrote:
>> On Tue, Sep 12, 2023 at 04:51:59PM -0700, Matthew Brost wrote:
>> > Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE deprecate in
>> > previous patch, drop from uAPI.
>>
>> Probably should mention why it is being done.
>>
>
>Will do.
>

With that,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
>> > include/uapi/drm/xe_drm.h          | 19 ++++++-------------
>> > 2 files changed, 6 insertions(+), 20 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > index ac392bcf7bc8..c0c0e799b278 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > @@ -320,12 +320,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>> > 	return q->ops->set_preempt_timeout(q, value);
>> > }
>> >
>> > -static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
>> > -				       u64 value, bool create)
>> > -{
>> > -	return 0;
>> > -}
>> > -
>> > static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
>> > 				      u64 value, bool create)
>> > {
>> > @@ -411,7 +405,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>> > 	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>> > 	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>> > 	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
>> > -	[XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE] = exec_queue_set_compute_mode,
>> > 	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
>> > 	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
>> > 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
>> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > index 00d5cb4ef85e..8b05573cecfd 100644
>> > --- a/include/uapi/drm/xe_drm.h
>> > +++ b/include/uapi/drm/xe_drm.h
>> > @@ -707,21 +707,14 @@ struct drm_xe_exec_queue_set_property {
>> > 	/** @exec_queue_id: Exec queue ID */
>> > 	__u32 exec_queue_id;
>> >
>> > -#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
>> > +#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>> > #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>> > #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>> > -	/*
>> > -	 * Long running or ULLS engine mode. DMA fences not allowed in this
>> > -	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
>> > -	 * as a sanity check the UMD knows what it is doing. Can only be set at
>> > -	 * engine create time.
>> > -	 */
>> > -#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
>> > -#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
>> > -#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
>> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
>> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
>> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
>> > +#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
>> > +#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
>> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
>> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
>> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
>>
>> I know the driver is not in upstream kernel yet, but wondering
>> whether we should add some kind of abi versioning here until then?
>>
>
>This is going upstream fairly soon, not sure this is worth the effort.
>

Ok,
Niranjana

>Matt
>
>> Niranjana
>>
>> > 	/** @property: property to set */
>> > 	__u32 property;
>> >
>> > --
>> > 2.34.1
>> >
