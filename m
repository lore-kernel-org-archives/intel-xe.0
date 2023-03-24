Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A56C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 16:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F8A10E558;
	Fri, 24 Mar 2023 16:25:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABA910E558
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679675128; x=1711211128;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cQO3kKS6tybF0wPr4hcL7oAhGVWA52z++N/ytZ5nIWk=;
 b=Aqo/kpKDtVqM4WZE+MH7lCXjJIGXAnAUVnwhTvu6xda7tzyQ+TOYrp7U
 UxoqgiL3qQflUTF0NKSP7YJqo0fS2yxlLVZpN1w3YQXADVbJAhhTtS2dV
 APiq5mgF66c3caXzMUpZgjSnx6RFerQQEczT67OjfzCViuM3p3R/Igkko
 4sLhx2OsPL6nltbshOqKEhS6ZQWQAazoLHMH1SiOUM4hwqP2xJ6EX2XFo
 Ig+bBtwXNP5jLvMFeHoCApL/R3YhNP1UoxPas9p/qkM9jwV1E8S7u8U76
 oaQU1scfLjJVEgGPYSUGkVXkKq/AmygFf2Xn3s8rrLzF7xjnFCwc6qHHi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="328242917"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="328242917"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="682745810"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="682745810"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 24 Mar 2023 09:25:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 09:25:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 09:25:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 09:25:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 09:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CE0/CTNd3cisB68ZTMEy7Jc1Zv14+u6akuyT7kvsrUJ7pC8GzPlGTUvLiKzqn2MbEGwqhnOPcxg+9vaVPVVCJgua3OwNdXWZaHaRkcaTPtCu49WzeP2D1ESBtQhW3R6DOjVy7Ts8UFUE8o0oWYyopNqc+UVprQUfvhb65V/2vERh2B7SQFKsCVDZ+e1CooxZPEEDq2lrhpFZhOt1cVOVQXDYJyv2GS7U+KStYH/jER3N7wyvnUzvVh87BEIxw/fejjwPNb9Oxa7SpPwGZGJplFD9HKJcNZU3mG0PLC/HHXb141NkJXK9gS8VTCAaDNO6XY/zKI7zh6CJQUdb+Kqzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfHtq4ODzvz5rNDrMXiyME2BnMZwG3+krBwSB+lDz/c=;
 b=k7Aovy/nNHHZ7u4EKcMrLCjDtMdJjn6mMmJYdFAbJj9hLaEWUIRsdmXI5LRGzUxJ4cCruQ8u4ueP5pI8fREu/JGp9Ts0kroJy27C+8ckaiS1JwKdpshpHHbBbvIe+bB5IqLXzkoGReEZrF52l+M1oJAi2Dx30livngKqsYPEHVTMEZH/T1S1jJ57j2w7fHib2CNORfEzp2NxFcvkZ/rbUl8LxMmUEhxifBexiwn9HqUM5aCn2jmk4C43Gy8w4wCgisWZlMOJ1uzQu7BlYj8ozCRYvAKX2v3xdPPXScD5Q7xps1QBmH+swYMlfmiWy+X0i+3vttyhO3rrDOXr7dC3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 16:25:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 16:25:25 +0000
Date: Fri, 24 Mar 2023 16:24:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZB3OzmD1Y9zfKCwl@DUT025-TGLU.fm.intel.com>
References: <20230321234217.692726-1-matthew.brost@intel.com>
 <20230321234217.692726-3-matthew.brost@intel.com>
 <ZB0+yQ4RbWJkwwOZ@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZB0+yQ4RbWJkwwOZ@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:a03:40::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: c2bb5402-7082-4cc0-82a4-08db2c845f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSs5TaDaIv4LGgJBKHDDX194fRxRDRkJNS9oLBinnej9/s6enyjwcyzW7/EHZ/9mEz4xHaAnc+m3+fSesFncz6Iu7HXZkUm5u0kawG6b6IFF0jgKnhC17zqW5p+MFOLtX0WWMiO9B1Rc22ZQl60FpN2/wNH7WBS3mgPrP2MEpD30m08d6Z2DvzZzzJSllPCCQvZCk/T6gaT54aY2GiMQO8Hl2i1H14Kj2I1tjDg9FE0RMSsBozrOhSUkYftamEW8JeJEt6/ixWq/ENAyZrUwtlDXP1zIhYR5YaVE4MqsPBX5SIxn5y7vU/x16kVGueZA8jvZGNeYMXrPJ8A//lBFJsCEPQuMqDmFT6u6G6p0YafmWyWqRbz/q5eW0JOlAujY7u1VqQnYIGwYCocbTsCWIIiTrwZHgtGELnmJzfhHmSUnwnLRXibujg1A52vukmVtVdA5ssg+py6BrOnql7DzsWF7YVrNWiB/3YM1CkRB/jNCByRlxw+EwGsl2ntKDyl0o2MtCjzUxNHRAUlXfmy0MWrODgjQ6/5ShS+UwcYQ/jDzJxGmHttXo7Uoipfn7/8RukDzjytuPKPMC0E4M36agHvIrCPr1sVBngnVqfg6P77Z9BphkNiOtf/TbgGsgV/vfuiCXVrr0X7jbj16M+q59Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199018)(6666004)(6636002)(2906002)(316002)(38100700002)(478600001)(86362001)(8676002)(66476007)(4326008)(44832011)(66556008)(6862004)(8936002)(66946007)(5660300002)(41300700001)(82960400001)(6486002)(186003)(83380400001)(26005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9zIcNiQWCWl4PiA/v3wb9odZ3emgtGKFGNdIg177PlC0q3CwLO6erSHrCoae?=
 =?us-ascii?Q?89QqXE2YCcovAteemcpHnbLQnrYWcAVz27Si6NGkDWrlKiAKp56He13n+OUn?=
 =?us-ascii?Q?z2JdXsFbVOuCLrDI+16CXyL+ONiBwGYohnkRi4NXTdeGV0PhQVEsur1YXqvF?=
 =?us-ascii?Q?SQawhSl5jBQ0ILdpSVds0Vv2IZXkB+NngY/9t5E1SqcvI/lP4CVk7M/uz7Ei?=
 =?us-ascii?Q?8FnEesIH+DeGymNie5G85+9M/HrGkXehsIWOyMk7SIXkG5GbMQOxYLB/jIEW?=
 =?us-ascii?Q?/ULcHhNweiBx47XF6L35sFa3PHk67wtYM3w4MKTnay5wPyCY3XcDsjUxacQL?=
 =?us-ascii?Q?NZrHYhylVzznIZ2oTXG4iQ0qe5ZhGs30cplsmWRhx0ttGjpoBoh7Op/Wloqg?=
 =?us-ascii?Q?KZ1C5/JNekycNmFF+83+js8T/MSZa0lPvcNJ5hODzjWRWlaBIKAng1/Tf9sV?=
 =?us-ascii?Q?OD3dJTzeLTx3sssHoFFRvlxTUsJKSsD2v/BiRw9uYOyYz2IIEeUdvPb2ehVU?=
 =?us-ascii?Q?iIv9ro++2uan5k4LIv+DG+FK/WW+WovY+P4KG9elMGpz6iakqUobXINZytGD?=
 =?us-ascii?Q?8+eDWh5k1JunikFMt/dWFuK0tCludiSwif0ydZcRRD6UrUJS3wCj4eLi2jBj?=
 =?us-ascii?Q?r5jvnURhRnwPGy67Oq6Or5iXMoPBietnz2/30w5tNP4dbanAT7MXtaQprq5B?=
 =?us-ascii?Q?YBvLe8UBSDY3uG97cmvUKdVqxWDrTraucapH7OShV2OBNga9qA0BMLm9C2np?=
 =?us-ascii?Q?HhHCAHaqE4Toq68pTVj3u4JOm1BQQUBp2da7eIO6SRxUTnya4Q4b28FoX1Xw?=
 =?us-ascii?Q?M7wC09/j1zB10a2+3+BuMOGRpmFGXo1pyZ/KpJGAeZ8ghfBzM4Bgdo7duQk6?=
 =?us-ascii?Q?2NRXHC5ZNWlGBurc+qIXavxDx7GkdUrt8cpNE8aXA/HRaMqVWa9rNY+j08Eg?=
 =?us-ascii?Q?E6T+qEdJjFyvPDIvQ4C8l44gzNfRTQ/BeNgmHlt2Lu8HA6JqZbBWxDGzRCtW?=
 =?us-ascii?Q?zpNCGBYy+MdLMZm0TVyZHXqoqHB9lEkCRLAZ6mdmv9w9rrMqKQ2gWJi+Dbux?=
 =?us-ascii?Q?yN0WfSA+Gx/PtUGkVi2ir36uk/tDFVQZNrmXvtT8P7LThgNmUkmPL976HHXA?=
 =?us-ascii?Q?TwilS6rTPOG9+VMQCky/dOLaloP4Zrr8/cb5UwGvTdvpZ+/XTie01SF4Lt6a?=
 =?us-ascii?Q?Y7AF1vrbO8uhIfC7WBdGGVKR4GgGRe2eFGaMX/Rq8SL5GsUhK5xI8oiN6mDW?=
 =?us-ascii?Q?GAZiIDfGFZxedH+KU5E7GI/L+7cOc1yZsKIzyAxJRv3HSnSe8teXjhVZgEUS?=
 =?us-ascii?Q?HM1HuK/F1oknfS9QI6nTgzVzgjBFsXvUPp4Uvhc5JEEca8ieiN/wBUCyDfBM?=
 =?us-ascii?Q?K5nL+bB8+ABrH3RjC+RRE+DsdquckSwzSz4IjLNbhuuV1tAT++kZ2owU9p6j?=
 =?us-ascii?Q?h823XKo8t8GkSkQnChF2cTccfGBuylzDCLQXfisCRISVA9oMvCl/dl5WAStv?=
 =?us-ascii?Q?OBHEz/jDZPOWVtuERzHN66/7obUbalqa56tfGC2T95MtQpdiiVZI2kRQHLu3?=
 =?us-ascii?Q?ebxkuZndfdb2GIEC9ogogkvl7jI2mXGX3zpSsAyhrD7x3AtzFj9kzHCscxTD?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bb5402-7082-4cc0-82a4-08db2c845f84
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 16:25:25.4912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkoIfqZLkTujub+TGFv7B9XAWKhfPKGgYu6TYaMh9NVdQZOmir3J1Y36Tr8f7h7m9zM8jD4PYoxUwFMHquqTcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Move in fault mode / non-fault
 mode check to xe_vm_create
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

On Thu, Mar 23, 2023 at 11:10:17PM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Mar 21, 2023 at 04:42:17PM -0700, Matthew Brost wrote:
> > The check for fault mode / non-fault mode was in the VM create IOCTL
> > before VM creation and not under a lock. The increment was after VM
> > creation under the lock. This is racey. Move both the check and
> > increment to xe_vm_create before actual creation and have the lock for
> > both of these steps.
> > 
> > Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_vm.c | 45 ++++++++++++++++++++++++--------------
> > 1 file changed, 28 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e7674612a57e..965cad81b02a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1060,9 +1060,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > 	struct xe_gt *gt;
> > 	u8 id;
> > 
> > +	err = mutex_lock_interruptible(&xe->usm.lock);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +	if (XE_IOCTL_ERR(xe, flags & XE_VM_FLAG_FAULT_MODE &&
> > +			 xe_device_in_non_fault_mode(xe)) ||
> > +	    XE_IOCTL_ERR(xe, !(flags & XE_VM_FLAG_MIGRATION) &&
> > +			 xe_device_in_fault_mode(xe))) {
> 
> NIT...is below simplification any better?
> 
> bool fault_mode = !!(flags & XE_VM_FLAG_FAULT_MODE);
> if (XE_IOCTL_ERR(xe, fault_mode != xe_device_in_fault_mode(xe))
> 

I thought about this and this isn't the same logic, so no this doesn't work.

Matt

> > +		mutex_unlock(&xe->usm.lock);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +	if (flags & XE_VM_FLAG_FAULT_MODE)
> > +		xe->usm.num_vm_in_fault_mode++;
> > +	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > +		xe->usm.num_vm_in_non_fault_mode++;
> > +	mutex_unlock(&xe->usm.lock);
> > +
> > 	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
> > -	if (!vm)
> > -		return ERR_PTR(-ENOMEM);
> > +	if (!vm) {
> > +		err = -ENOMEM;
> > +		goto err_usm;
> > +	}
> > 
> > 	vm->xe = xe;
> > 	kref_init(&vm->refcount);
> > @@ -1182,13 +1200,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > 	if (number_gts > 1)
> > 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
> > 
> > -	mutex_lock(&xe->usm.lock);
> > -	if (flags & XE_VM_FLAG_FAULT_MODE)
> > -		xe->usm.num_vm_in_fault_mode++;
> > -	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > -		xe->usm.num_vm_in_non_fault_mode++;
> > -	mutex_unlock(&xe->usm.lock);
> > -
> > 	trace_xe_vm_create(vm);
> > 
> > 	return vm;
> > @@ -1220,6 +1231,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > 		xe_device_mem_access_put(xe);
> > 		xe_pm_runtime_put(xe);
> > 	}
> > +err_usm:
> > +	mutex_lock(&xe->usm.lock);
> > +	if (flags & XE_VM_FLAG_FAULT_MODE)
> > +		xe->usm.num_vm_in_fault_mode--;
> > +	else if (!(flags & XE_VM_FLAG_MIGRATION))
> > +		xe->usm.num_vm_in_non_fault_mode--;
> > +	mutex_unlock(&xe->usm.lock);
> > +
> 
> Perhaps put these counts increment/decrement blocks into functions
> instead of duplicating them?
> 
> Niranjana
> 
> > 	return ERR_PTR(err);
> > }
> > 
> > @@ -1843,14 +1862,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> > 		return -EINVAL;
> > 
> > -	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> > -			 xe_device_in_non_fault_mode(xe)))
> > -		return -EINVAL;
> > -
> > -	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
> > -			 xe_device_in_fault_mode(xe)))
> > -		return -EINVAL;
> > -
> > 	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> > 			 !xe->info.supports_usm))
> > 		return -EINVAL;
> > -- 
> > 2.34.1
> > 
