Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF12AEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 23:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0B810E6A7;
	Fri, 16 Jun 2023 23:32:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C94F10E6A7
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 23:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686958371; x=1718494371;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2Q7YIck0ShzTbUqg+rnZroi5HWCTC+lAbXm39m/peB8=;
 b=ZYcJuC6LmGsMfuxgH+qhjhYT8xbvTrlDuj28RIza74hm/yW4rKLeEH3O
 hnHlGtnRLyWnaYbshLCirBQAVUCSfEWJC5tpEk3IWVJp7Jspcpb+m46U5
 00QP01I3AjlOkXdfJO07OewLZ4OZtNF6G9wpRQj/TSHDulTbddvxGJlCq
 YDtgnuiR/xg6I8qxp3e5CA53xBWGjQjz8zu4w9CHTtEPXSlA+CuC+RTza
 ljfIwk/RPH1ZBW0F8WzgkVNHW/O7pR3XhWL1S5uLypVGbRFb6usw2g980
 WbxLIqz/QyRnnC9GltJ6jib4PbECd1Of5D5vhAwjYUwVtbDKlptRrGJJI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="339668816"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; d="scan'208";a="339668816"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 16:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="783105578"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; d="scan'208";a="783105578"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 16:32:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 16:32:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 16:32:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 16:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzXBc1B9H0PpeSg8JKmEIYPMSAqbrwqqo6TGRmyoaSwHsI0uZqb6UcyOdDDVjC6iCXEJOywbCfONjoqVrvsL8MYLa7Dh+RvbVKBTQ/fXbJBj/z1ujWFTqWWutFOufB3+cTBecMH337LV6/YJNQc7kF2TZUPTpq4+vQE/YzOrGzM0TX99nYJrNiYULM++bHaTuteAhkq4ExyUR9V/jQMVyXOIR/fiAJIV7cdIJQufNKAO0/sS2K96BCQhEqqgbJ1ijQ9xN103I4E3u86XbQ4Fy8yUV7ew8iMQeFiWZ3W/2E3RTDarrVK3s40PS/YUQOWwNGQzyprKyeKZfrwcgA/YeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eI0yo8EoUejc4lZzP+TYlFqS7kezbv1qEc4GEZ1hs/8=;
 b=UpdBCuUdTtoi8SaLvkPJGtus6nvBDoi96eyPI13jy5wyvMzAvRFykrql3UrMeblbonTWagZIagj8KoYavpv8IiNunQs/7/hWC+3jzoKobCGGj1v086DHyyNsHJBrVBLiIOX+L7etWfWmDjxPEVTnqSLtwWrEDusP8gZd+RIFJ9pWWK5aXuN99NrYpnpC7c88xGujPCe01YmjknlyC7KTkOpxu9m0xe44evDUNZuyJV+8rKZvTRI4K5SOiTbRtpsDHDdXnS3RCyNxmy3HuDikAAFyavQOFjnIoG55s89cDZ9sL/4E5cEP5OSSgAMV9vj2j2/HZnt6P3KoBmO0smCcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 23:32:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 23:32:41 +0000
Date: Fri, 16 Jun 2023 16:32:38 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZIzxFo15jjCUSi/M@nvishwa1-DESK>
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-4-matthew.brost@intel.com>
 <ZIkqo4Mx6RkuJ5Nd@nvishwa1-DESK>
 <ZItR6zHJ0HJhW1Fx@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZItR6zHJ0HJhW1Fx@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: fb604208-f6dd-4a36-ea92-08db6ec1fa5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uDNAw0XzD+MxtaIiLNTEdCTCRQhv3s3VNiRnMBjVWqmzSVcSZIS71yXllVPXPqDnN29+RtuVGbc7gTboITQEhXEbLjFMZ5aMIDiXrfdfUEMMVcmJuJeikeNVmXB6Jj5ADJZBPqK1OF4q3CN5K9cLbln4KADt4nI0gVbxx4ZhbpRLo3UzT8FRMCqLns2GcciZ25a++l3uVbSALfDm56izMDslpzritStuxu5vPU/mzNwHekiGq/BVTd0U4H8heaHSIH5YlRSTBRBmsvKR+m+Jx9NPHvs19iaSj7gpnb9yTjPzF16fxxTXrQ9bNAZHeAjNu95yHFIDbe/YvqSHHEBx6KcGzzh+63tH3iyPS9uThLHkY1M7mOqOKlRvKbqvxSDtugww5Yj75lW0pzxXgHQHJavXNmppmQNIz+GrbPjiry5JJT+qOpAqCau4JQnenR+OIAxtpM3AH6YurZ5b0G5EvQmTf6q/6UxCzXonEoK+NYlnMNMthDf9qXCTACqPAWp3kRvwNssQDDwKfrqBC+erxcVZ5FVdtrqu+gmuvwOTJjcfzOYraBGhz+LOlUwGSnGp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(478600001)(6666004)(6486002)(8936002)(5660300002)(44832011)(8676002)(82960400001)(41300700001)(2906002)(86362001)(6862004)(33716001)(38100700002)(66476007)(316002)(66556008)(66946007)(6636002)(4326008)(107886003)(26005)(9686003)(6512007)(6506007)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NxHUEy3qD7iL47ikjuIKEQBJfyjKWjGrT1LHJxAxpjvpMPRhzmtrhVTEU5QB?=
 =?us-ascii?Q?FrZ2HlDP6nHTtABJSsoOyE4NN9ypeCG/7Lr0iORBf66v5SlDQejLGFff1116?=
 =?us-ascii?Q?vkRdzsZ+fibxHYgIi+JPUTSphBDVMq6TSETOclTvfHgqts2SRyrJ288QuFiq?=
 =?us-ascii?Q?kOY2QoxpLErXBlfhKIKEkaktMvzRO6Bhr0hhwTb1vF9oi5lYLfZRo2uKg5FS?=
 =?us-ascii?Q?ojYjgrfCpvSsVI/IRVrLM0zjoyS97xWFy4RChxiXK/YLAPcnVEBU9m5XHKJY?=
 =?us-ascii?Q?jbtz3oLFD542yzExBB/j5tf88HZ0u5NDG/QQpH+7mkVcCGZ6zYNRrnmQvzRX?=
 =?us-ascii?Q?Y7sBVFgVRuTCs8PfqULvJBbPwG9VKWvKHGJ6aTcO7afM7qLiyix4//kk1QAl?=
 =?us-ascii?Q?yWnDtQmHvPd7P/wnPgeOWhIMNrJJiS3gHrR7qbTATyq84kR90FkdauKUJ5WB?=
 =?us-ascii?Q?dd1H/CWSO4dJr11pIbF4BNA4308en+kNU802QA9ehDrwptWlUNO/ydss1XAv?=
 =?us-ascii?Q?9Nxz9mlNj5pwalqsz45S3SEENkENSrmG+iExsmjtjlwqv1zLhf3j/fD3/Vo/?=
 =?us-ascii?Q?6A1MPAWaRCO9rxlBqNe2ljDTL5PqlFv1E120a+9qW9KqXRujxR/yClQWVJ5F?=
 =?us-ascii?Q?tIQsyW7RvM8/t5tuPC2AFBe1NXzCrr/KSSwK0p3oIWLjd1B7+5QsVF89Dmry?=
 =?us-ascii?Q?7qVCT84VsCj1LbM2IWp+Udy6reg5sUb6EIKYjXzamtYfO5mRdl+tmksk6QV/?=
 =?us-ascii?Q?uievrYrYyJqSlcVdCsXxzmhweq7/vrjGvHF3uO9QZiRUxJtH9uima5VwkLcx?=
 =?us-ascii?Q?/2hyuVxoczbVaFbhFgIraclOAbYz4jO9CdegXf5N1a84uv4TSc9+UX558gst?=
 =?us-ascii?Q?QNFKMOFd2zPetyCqms2f3BClr78TAHyyfuNrHTX730eSEEUeSHC75UVBU+3O?=
 =?us-ascii?Q?96RMsj5C5dh5kTxQ/PYcyWISEpZ/9WMVYnbJYWRR0pua1VtNw8hEGo/XjGfC?=
 =?us-ascii?Q?Dq/5a37hkEQ94GL7/lrhBHdl3XjFJJf+Xe8Rx8imcN9dwLFXS0kHdm4cD2QH?=
 =?us-ascii?Q?eHB/kh7Kz5fvGcXp9msYElj+e6Ue2T7w2lBi3WW589KWs2761bJ8cGRhPnWI?=
 =?us-ascii?Q?rns/uQTDlPMf9c7JEm6BI59oFn3hFhdEmmzNDhpUAE2wt8Ci8ZtOuSIptw7T?=
 =?us-ascii?Q?IMf6xReT7K//5HpeeHSc6otp173OX37+Yq04cnn4SYjA20BdQtXEML+BVP+W?=
 =?us-ascii?Q?RvjmjaTPhLYhQrTBu5qVgauWJqXIqliH3FDN79ep1sBx3fBwjktR85NNOazr?=
 =?us-ascii?Q?ibYzYqCiJODQNnwc8y2rtfc1c2D91YizKaxuFJTozP4GynPFPg77+9Puz6RT?=
 =?us-ascii?Q?2PVz3himcSE+yEYFMSOAsEkTxux9l3aXsk5rMCmSUhaOIT+NuCABSVdwUC3U?=
 =?us-ascii?Q?tagEA9hOC1FIp7L6hiu0aWej2aAdorEJyHRr8MAIKZVlP87PryfPyX7UwTD9?=
 =?us-ascii?Q?bZImbTDo31lEL9GFY3vF+oPMIweTOu0ohRI8QfUcDLsf1kbbzOsCrmH/WHfQ?=
 =?us-ascii?Q?k30kk6ysV2WebJJUnFVNNzcRmg+jNjo/ucFI6Ym1oiTvmtSMKwhtp1HykPRc?=
 =?us-ascii?Q?EhX2mPexlILm63an+mPCCio=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb604208-f6dd-4a36-ea92-08db6ec1fa5f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 23:32:41.2687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seYgUNaoddLvAwr7rzKZ54+fc1EPgygZczAcgEjvoPHNBtWmAcmIJZEkIrGc7YOp1CxUoh6JLJPjc+w3/D8es0eOjnunLCgKAWBN18xV9i7L16bar4Dm7V/ZDZp4TiZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: NULL binding implementation
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

On Thu, Jun 15, 2023 at 06:01:15PM +0000, Matthew Brost wrote:
>On Tue, Jun 13, 2023 at 07:49:07PM -0700, Niranjana Vishwanathapura wrote:
>> On Wed, Jun 07, 2023 at 10:03:33PM -0700, Matthew Brost wrote:
>> > Add uAPI and implementation for NULL bindings. A NULL binding is defined
>> > as writes dropped and read zero. A single bit in the uAPI has been added
>> > which results in a single bit in the PTEs being set.
>> >
>> > NULL bindings are indended to be used to implement VK sparse bindings,
>> > in particular residencyNonResidentStrict property.
>> >
>> > Suggested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_bo.h           |  1 +
>> > drivers/gpu/drm/xe/xe_exec.c         |  2 +
>> > drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 +-
>> > drivers/gpu/drm/xe/xe_pt.c           | 71 +++++++++++++++------
>> > drivers/gpu/drm/xe/xe_vm.c           | 95 ++++++++++++++++++----------
>> > drivers/gpu/drm/xe/xe_vm.h           | 12 +++-
>> > drivers/gpu/drm/xe/xe_vm_types.h     |  1 +
>> > include/uapi/drm/xe_drm.h            |  8 +++
>> > 8 files changed, 138 insertions(+), 56 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> > index dd3d448fee0b..3a148cc6e811 100644
>> > --- a/drivers/gpu/drm/xe/xe_bo.h
>> > +++ b/drivers/gpu/drm/xe/xe_bo.h
>> > @@ -61,6 +61,7 @@
>> > #define XE_PPGTT_PTE_LM			BIT_ULL(11)
>> > #define XE_PDE_64K			BIT_ULL(6)
>> > #define XE_PTE_PS64			BIT_ULL(8)
>> > +#define XE_PTE_NULL			BIT_ULL(9)
>> >
>> > #define XE_PAGE_PRESENT			BIT_ULL(0)
>> > #define XE_PAGE_RW			BIT_ULL(1)
>> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> > index e44076ee2e11..4f7694a29348 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec.c
>> > +++ b/drivers/gpu/drm/xe/xe_exec.c
>> > @@ -120,6 +120,8 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>> > 	 * to a location where the GPU can access it).
>> > 	 */
>> > 	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
>> > +		XE_WARN_ON(xe_vma_is_null(vma));
>> > +
>>
>> Also return error here?
>>
>
>No, just make clear NULL bindings should never be rebound.
>

But in such case, this function further down will reference vma->bo which
will be NULL and hence runs into NULL pointer exception?

>> > 		if (xe_vma_is_userptr(vma))
>> > 			continue;
>> >

<snip>

>> > @@ -3389,6 +3411,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>> > 	int ret;
>> >
>> > 	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
>> > +	XE_WARN_ON(xe_vma_is_null(vma));
>>
>> return error?
>>
>
>No, again just make it clear you can't invalidate a NULL binding.
>

Same here.

Niranjana

>> > 	trace_xe_vma_usm_invalidate(vma);
>> >
>> > 	/* Check that we don't race with page-table updates */
