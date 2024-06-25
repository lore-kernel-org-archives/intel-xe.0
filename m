Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B1DC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 05:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A1010E1C8;
	Tue, 25 Jun 2024 05:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTUJL7JO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D805810E1C8
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 05:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719293971; x=1750829971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dlLCuLk0UKIXF6ejLyPnqjL0S1mJQn9FKCKQm1Ln/CA=;
 b=NTUJL7JO9F6jXwySNnSWjwXI0QLVjAbuGLZij8U+FswZN3rZ/es7dbaV
 sL2CJhGXvpWryzxlkxOVmzHu6TRv/PWzKekCsabKtWrI3gMc4IkNFC+EI
 5gz+kTS/8MZJRPjZneUZKX1xa1y7D9QA8CmfhjDrGypS4d5quOxLh5pVk
 S20l3Q8dGZkHcuH3GYIY1+bGodMvZ1tKXfyfUJi56T/MK0KOSAyRqCky+
 /WBVQtQIMvFOO1XfWRQs4l3hmkVzcYJjhFCMd5jIrogSX7q5JLzlIxtkV
 E1yvozglSD5auuffs6ZZSwOQ2yf3QipRaB4w5CU5r6QUIlqW57XSHc6Hr A==;
X-CSE-ConnectionGUID: qKdKec3pTDaPx6ByCgDIcA==
X-CSE-MsgGUID: R+etWxz2TmytkcivvrITZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33828215"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="33828215"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 22:39:30 -0700
X-CSE-ConnectionGUID: TJd9gI34QtuE/kIHE6Bwbw==
X-CSE-MsgGUID: 0JmrR4ouTEq+uJCgPJb5DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43964124"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 22:39:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 22:39:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 22:39:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 22:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2uWKyFD1Bi88GRXnlLoSvXOOJxnsGffBDLIH8NCUe+dVHo6yHncpA/RUjSe6y9su32ukJg5POeQcjK2lDhAf4f0uEX79851Q7GDWMuy5QvAFN7UOKZb404MiFbImfCoX8ALZ8DJ45V9jfOfMhLqKee+eB6wBfy1quqi4NYnWcOx0tFI8BwreBrtXwNkbiX95RC2teYiATfnSaxqn2QF0W/T812AK4K/FMQdTrM0AtxT/Ye/ANZ3WVLkzXbGp7bYfFNJT+f3PtwNi0NhiSJ55Q1MduKJvX2Ui5HSIqVhxdr/jrA1tgh8K85loyBuuKZwNl9XDc/1eId37eT7sQVYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2CUjEc5Mn7lc5B+esxk9sltT1i2dymkIZcAfaemDNc=;
 b=GZgPQNFK5rE/djAsiGylslVpw2Ob35nBRNwR3uCAjNfiPWSw5r51F6RWYC/O1xXqxysCqBz628YYY+Sl0Mmq+upQwbA8PqEZmsFO9ntUGxNguSFOmmsmrgoAWIZtDu3Io/NgqWDO/SaH2BXcftWJcV+9oM5d08pmS3HPWBm5wt2eHWvcnaomrMekJv/c4QohH+9hqhUHPC01sqdP5b0C4SAyLcAdBsukvPvG/yw6BaQWUi5X3lXyJI97kn8QmKJJvBgHs4IVvIMK7ewie4AY89xwPdEHYRJ3MEInOwgdr+Ppap+kXYtfOGsZpDg+gZWgdhR1dTFR9H/Xr5HpcIMwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 05:39:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 05:39:26 +0000
Date: Tue, 25 Jun 2024 05:38:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add timeout to preempt fences
Message-ID: <ZnpX6knjpYx6FRSY@DUT025-TGLU.fm.intel.com>
References: <20240624224844.3950026-1-matthew.brost@intel.com>
 <ZnpSpcRuM0dUgu3S@nvishwa1-DESK>
 <ZnpT2M4SH5TWzqTS@DUT025-TGLU.fm.intel.com>
 <ZnpXDhyB3fi+SnZG@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnpXDhyB3fi+SnZG@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR05CA0138.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c3269a-5218-40a1-9b6b-08dc94d92ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3LgrkY6BYno3yRsUZtMNVMKrrCXwvchchK1hm1koXkUX2nKlww2Yu8H4qy7h?=
 =?us-ascii?Q?hR7acxcN9Ad0O2d6FsiD/0SKM6o58n+YDr8FdoN5WzxW/dVQ0rtXrz6Jwr66?=
 =?us-ascii?Q?HydqtUkiwYQIA4aVXMNreabubofBsMJeuqv3EZ3dAitdN7Ca3R3uQH9XDIJ5?=
 =?us-ascii?Q?cLggmt7giqacdu/mPKbk5obBZO3mR7NmGTpOPoOvS6i2Xhbh8/q7xYAhYYKz?=
 =?us-ascii?Q?RsrqQNmEMl0CAHw/l1ZCnGvLMt+Vb7EHUdDSsf1ICy/9gmc7UyFodn8FHE62?=
 =?us-ascii?Q?od2AWYRT3rUcrdPhJTqKCfKF0ZvVYclC80uPMiXS5YMjOW/tsp8n4B8zkBWb?=
 =?us-ascii?Q?orzV7kbH5fGXXA6mQ0M1k69h/ZfnHpAcvJe9ZLXV4RryQQigW3JVJ91pQwlP?=
 =?us-ascii?Q?Sh1vNuTXw5kiggXjsu/RA+8SBC6k/SWYpWgoElW0MOgdaKjtxNhjqTlHZQ6T?=
 =?us-ascii?Q?u9rDEut+Pk+LnFsaBlr0WRr3AEkb29OLC7Aefpbddumxy1G+PZU34plgazHi?=
 =?us-ascii?Q?44KvWztiIsF9UtoO0Qu7wP+hNuH9hXAz/rRSCMNdUFyXUv1vVd7iSf2QW/Jp?=
 =?us-ascii?Q?kYbbD8GRDFX/XA0+M+OmCQVhv0Znr+2Z/zGClp0hGmU/6K4LpvZG3BxNU8St?=
 =?us-ascii?Q?+vXB/LhQzshHtf1aFk1bH/lhpSAznsR8OI2k2f9n1IepQvWdM28HPQTnqsJM?=
 =?us-ascii?Q?mkvrVjyOnjeV3zjthTFriK/Sw9DM8Z1tZ50FvsBGCfBSE5oR/qp3+9GzS5jn?=
 =?us-ascii?Q?BURs5WvzRYCh1Wx9jh+epucDSlkeMGUy7w+OsVd6x9oVkaOrDYACa7Rlk6lD?=
 =?us-ascii?Q?woB12Q2M0BCLDrU0uwlOdfCH7vThU4EkC6YeseVLWCCcFTndLIKvR3ZXj8Em?=
 =?us-ascii?Q?ohTRT7K5zy29NBFSz/qNm3tlNRPoMLFk+Aq+uXtT9EFy8qXBq9aq2SiKylqK?=
 =?us-ascii?Q?Lodh1WnMDhYmLBR8rZaft00ovHJOKNMzGRqqAOv0Ta8eplqYKvyClIC6qb8I?=
 =?us-ascii?Q?1josmGO2DUC/s+neZW4/ck4O2bjeq7MHYRUQcxlnTEOGvnb3EY8e9Iz/iKBg?=
 =?us-ascii?Q?nTqA29Z4gc06PzVBvZXyDLt0Q2grqWGVEXvOM3smBQsohggOiReCnExo4z72?=
 =?us-ascii?Q?dk468PvUoGFUPYToANSMJzJTzHG07/hbDPXJK/YD1W0C/sr4gH4njbQ7ghnP?=
 =?us-ascii?Q?OQYqG3TAtBZ4LMnstxE9Zf++kl/6RGhALL1to1K2MyRgrkkLlaQQ+opVwfSj?=
 =?us-ascii?Q?bFmGqAS0yVoplkGYmkjr1Fwdd/n2iZwgW4fjBLmQ2HnR5UIAVp5QitGythCz?=
 =?us-ascii?Q?07E5s75NicbOmnNmWxBf8DHK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4X1f+89f2GIMK09vqLNhQLha+4Ru1sbsTNxa7qkLuJ83CzTdrQPQffdedkmt?=
 =?us-ascii?Q?sH/Bz2N+eixCUsFIgxD/JR2/XFzCwNfK1peFK6alozC0Bm3b9Xj+Fo3UssQ8?=
 =?us-ascii?Q?aL6OLPvAC0gEPQMMDAKdEf3ylkKcBOJSXJ5NkK7oFk6rjwVDHU4I3XkleGNe?=
 =?us-ascii?Q?bSYghyFDpUCseo08xP9hBkd5LPF+1sht4B4RUfk7zJtyXwyk1LMIikm3tPby?=
 =?us-ascii?Q?581kXXajFk+jpRimzglcgA/9ZdQkEnfLOgAjVKk+XikiP9zoe+wJXcbu5Wj5?=
 =?us-ascii?Q?nvHwrcKpwXPzFMSze4T4Q1LYCjQ7BSTcQzi/WtMwWrkYDA6RM2FwCbX7oevp?=
 =?us-ascii?Q?yb1THmaBgGX8HZuOhNdHRO8rsF4ORdP9D5COhuKrvD6X8cNUptgaUohTw2IU?=
 =?us-ascii?Q?xidUq+U9DaxX/fY5z0hnepykr3LAwZ49nCLuzmX2AwoTOjAon1x8yoX5RHtZ?=
 =?us-ascii?Q?SdYnXdTOQtpiuZVVc0KGTqSVyJmzu6i5cx1hJOwHgADzHA98rd1eQ5kQ5/9J?=
 =?us-ascii?Q?rNp15unmb7jVyfN1UMeq1SSTgLgh0gTJ51OWvvWnyYndG89g+C4KlFae7sun?=
 =?us-ascii?Q?+wvDzXjwFBjhz8j+cFFVxuwzQkZ1ua6dRvw/JCvzNNjciVmi9PKG0XeAjrFE?=
 =?us-ascii?Q?ZbY/bsFSSxAX+EMrTuBhuyv5Db9RqbHY/UJA0E25MDBC8SvFz8m/dFOJ1uhm?=
 =?us-ascii?Q?uoWiksXQj1oiM35LVj61sYTXzD/BiTGZkPPhIAGni6hAdSdcUpPAIuPHFDr7?=
 =?us-ascii?Q?1iuSSiKhgxL5uHFS1nQKH3FdQarfxCgBDYyBHR1jrICc46GeNI9ncDfkWC4D?=
 =?us-ascii?Q?WQIKawLPkw/oTO5xJ594Xn3EuHn9LGMkhwjETTvq2vBRVvyPXNRj2kigEws/?=
 =?us-ascii?Q?jxY6C87sKGUultJayHeabM/LvUeQLxk7AQleSA4k4uU8Fg5QLSbcwrBK5UOt?=
 =?us-ascii?Q?md4RQzSQPspB3Zvkc/9UkHq5KiC9MMOhU5MdUuvFKN1reBp6LqJqAAMB1Z5t?=
 =?us-ascii?Q?Vr/nBzUNd461SnbmyP8k/as3uCBO2qPSfNxK8/6wYJg7hxKUKFZ1Mqy2PANX?=
 =?us-ascii?Q?Ne6uWdxaqj9JWQSUgUa9M27KfcV/UA5yJL6AAtTa4l5jpYPr76LNkHHxnMnj?=
 =?us-ascii?Q?VQeC16HYqtYYdewfwBg/lspqsH2PUVVGXFBcdiWX9J20lkO2NSL/ZzHYOj1Q?=
 =?us-ascii?Q?jG9LLs2ZUHMSciGhxyruxwqxH+FNw164xGCaM2jy4F+mDIKMmcbRVyTFGt62?=
 =?us-ascii?Q?FCFSC/7O2R9Onsh3knvrBksdVy0RiNhWjDztTdNtz7V9O+Jq7S372tMtVZHu?=
 =?us-ascii?Q?mHjrdzesCLpbB9XhF749winwUMIK/Et9/7Bgz+FazDxScmNP65flta4rLITK?=
 =?us-ascii?Q?WVtvf4FdtCotZTgZrWcw0QnM1P6Snwj6Ee6PBhyNrG5VKp5HKble/MOUSAse?=
 =?us-ascii?Q?osoQv3Yz8rXgPZ7GFc42/Cg1Zfz0+TWB3aXrgD3qpA8EaD3E/9Nea2OnIq1k?=
 =?us-ascii?Q?70DCQLnYAXi1QSFZfCx3lrE2oxc0QFi5ge1uQJ4isXp3RcWbbzy9s6OqGquA?=
 =?us-ascii?Q?dDBRxlRbukwtyhATQhMRX1wh30ed05tBBOqXQCH010raVswKGnuPkJrgtkOl?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c3269a-5218-40a1-9b6b-08dc94d92ce5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 05:39:26.2813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HunQmQp3ktcQeWS1fR3KV34gDFyPBsJzkKHh3MBpvgEEJ3941HF4MMYboSSm8vGZTZihFjJaUXo6NXyXHzlYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 24, 2024 at 10:35:10PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Jun 25, 2024 at 05:21:28AM +0000, Matthew Brost wrote:
> > On Mon, Jun 24, 2024 at 10:16:21PM -0700, Niranjana Vishwanathapura wrote:
> > > On Mon, Jun 24, 2024 at 03:48:44PM -0700, Matthew Brost wrote:
> > > > To adhere to dma fencing rules that fences must signal within a
> > > > reasonable amount of time, add a 5 second timeout to preempt fences. If
> > > > this timeout occurs, kill the associated VM as this fatal to the VM.
> > > >
> > > > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
> > > > drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
> > > > drivers/gpu/drm/xe/xe_guc_submit.c       | 35 ++++++++++++++++++++----
> > > > drivers/gpu/drm/xe/xe_preempt_fence.c    | 14 +++++++++-
> > > > drivers/gpu/drm/xe/xe_vm.c               | 10 ++++++-
> > > > drivers/gpu/drm/xe/xe_vm.h               |  2 ++
> > > > 6 files changed, 59 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index 201588ec33c3..1e51c978db7a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
> > > > 	int (*suspend)(struct xe_exec_queue *q);
> > > > 	/**
> > > > 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
> > > > -	 * call after suspend.
> > > > +	 * call after suspend. In dma-fencing path thus must return within a
> > > > +	 * reasonable amount of time. A non-zero return shall indicate an error
> > > > +	 * waiting for suspend.
> > > > 	 */
> > > > -	void (*suspend_wait)(struct xe_exec_queue *q);
> > > > +	int (*suspend_wait)(struct xe_exec_queue *q);
> > > > 	/**
> > > > 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
> > > > 	 * state and dma fence returned from most recent suspend call must be
> > > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > > > index db906117db6d..7502e3486eaf 100644
> > > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > > @@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> > > > 	return 0;
> > > > }
> > > >
> > > > -static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > > > +static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > > >
> > > > {
> > > > 	/* NIY */
> > > > +	return 0;
> > > > }
> > > >
> > > > static void execlist_exec_queue_resume(struct xe_exec_queue *q)
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 373447758a60..56e7a340696e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1301,6 +1301,16 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> > > > 	kfree(msg);
> > > > }
> > > >
> > > > +static void __suspend_fence_signal(struct xe_exec_queue *q)
> > > > +{
> > > > +	if (!q->guc->suspend_pending)
> > > > +		return;
> > > > +
> > > > +	q->guc->suspend_pending = false;
> > > > +	smp_wmb();
> > > > +	wake_up(&q->guc->suspend_wait);
> > > > +}
> > > > +
> > > > static void suspend_fence_signal(struct xe_exec_queue *q)
> > > > {
> > > > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > @@ -1310,9 +1320,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
> > > > 		  guc_read_stopped(guc));
> > > > 	xe_assert(xe, q->guc->suspend_pending);
> > > >
> > > > -	q->guc->suspend_pending = false;
> > > > -	smp_wmb();
> > > > -	wake_up(&q->guc->suspend_wait);
> > > > +	__suspend_fence_signal(q);
> > > > }
> > > >
> > > > static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > > > @@ -1465,6 +1473,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > > > {
> > > > 	trace_xe_exec_queue_kill(q);
> > > > 	set_exec_queue_killed(q);
> > > > +	__suspend_fence_signal(q);
> > > > 	xe_guc_exec_queue_trigger_cleanup(q);
> > > > }
> > > >
> > > > @@ -1561,12 +1570,26 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > > > 	return 0;
> > > > }
> > > >
> > > > -static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > > > +static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > > > {
> > > > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > +	int ret;
> > > > +
> > > > +	ret = wait_event_timeout(q->guc->suspend_wait,
> > > > +				 !q->guc->suspend_pending ||
> > > > +				 exec_queue_killed(q) ||
> > > > +				 guc_read_stopped(guc),
> > > > +				 HZ * 5);
> > > 
> > > Do we need exec_queue_killed(q) here as we are anyway checking
> > > for '!q->guc->suspend_pending'?
> > > 
> > 
> > Probably not? There might be a goofy race where suspend_pending is set
> > after exec queue is killed though, I'd have to really think about this.
> > For safety I'd rather keep it as is.
> > 
> 
> Seems fine to keep.

I'll probably add comment before merging stating this too. Also I typo
the kernel doc which I'll fix too.

Matt 

> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> > Matt
> > 
> > > Other than that, the change looks fine to me.
> > > 
> > > Niranjana
> > > 
> > > >
> > > > -	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
> > > > -		   guc_read_stopped(guc));
> > > > +	if (!ret) {
> > > > +		xe_gt_warn(guc_to_gt(guc),
> > > > +			   "Suspend fence, guc_id=%d, failed to respond",
> > > > +			   q->guc->id);
> > > > +		/* XXX: Trigger GT reset? */
> > > > +		return -ETIME;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > }
> > > >
> > > > static void guc_exec_queue_resume(struct xe_exec_queue *q)
> > > > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > > index e8b8ae5c6485..8356d9798206 100644
> > > > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > > @@ -16,11 +16,23 @@ static void preempt_fence_work_func(struct work_struct *w)
> > > > 	struct xe_preempt_fence *pfence =
> > > > 		container_of(w, typeof(*pfence), preempt_work);
> > > > 	struct xe_exec_queue *q = pfence->q;
> > > > +	int err = 0;
> > > >
> > > > 	if (pfence->error)
> > > > 		dma_fence_set_error(&pfence->base, pfence->error);
> > > > +	else if (!q->ops->reset_status(q))
> > > > +		err = q->ops->suspend_wait(q);
> > > > 	else
> > > > -		q->ops->suspend_wait(q);
> > > > +		dma_fence_set_error(&pfence->base, -ENOENT);
> > > > +
> > > > +	if (err) {
> > > > +		dma_fence_set_error(&pfence->base, err);
> > > > +
> > > > +		down_write(&q->vm->lock);
> > > > +		xe_vm_kill(q->vm, false);
> > > > +		up_write(&q->vm->lock);
> > > > +	}
> > > > +
> > > >
> > > > 	dma_fence_signal(&pfence->base);
> > > > 	/*
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 5b166fa03684..6b8ff13f0aff 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -311,7 +311,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> > > >
> > > > #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > > >
> > > > -static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > > > +/**
> > > > + * xe_vm_kill() - VM Kill
> > > > + * @vm: The VM.
> > > > + * @unlocked: Flag indicates the VM's dma-resv is not held
> > > > + *
> > > > + * Kill the VM by setting banned flag indicated VM is no longer available for
> > > > + * use. If in preempt fence mode, also kill all exec queue unlocked with the VM.
> > > > + */
> > > > +void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > > > {
> > > > 	struct xe_exec_queue *q;
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > > index b481608b12f1..c864dba35e1d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > > @@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
> > > > 	return drm_gpuvm_resv(&vm->gpuvm);
> > > > }
> > > >
> > > > +void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> > > > +
> > > > /**
> > > >  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
> > > >  * @vm: The vm
> > > > --
> > > > 2.34.1
> > > >
