Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064ACEE0204
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 21:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F5410E114;
	Wed, 13 Sep 2023 21:34:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B1B10E0FB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 21:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694640875; x=1726176875;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jOqWsmlPmcfGNLeQXMJXpxj0oY759ZEVAmzpw5KtBZ4=;
 b=iSsjsdrwZe4rmE5TaiViiFWMo+mSJTBv1aFx4YZEp44+ZF46DXma+vj/
 SgHdBEwOpgVm2/lXtb9zUuyHJqB89dL4KR7TWSgi796OhFufpcolMgbyf
 GFt8PwC/l7wYug75hNH6HX0jMmByRP54oMzN0O8EAcv3iF+z8yJk7KMUI
 ZVI+NEYPpOkRopibEoba3IcLH3ye4JH9a/co9Nt0TTU0hLRgwGXDkWkbr
 vP24EIX7JkOL3VzEQajuQM0p1DfxBGMl1IlrUaq6t5fX703EhUvu9NBxN
 ec/XTjPd9APuJHubQxazGEgzFf7UwAxrXzXznBrVmYaxzXAGBvl8Ck7G0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442815551"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="442815551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 14:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779373264"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="779373264"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 14:34:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:34:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 14:34:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 14:34:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 14:34:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmwGE+DRlFkPFDhwJCYZwF1/jD12JbTIGhtfeZOm8LyMeMLVDJ8jf2sp4gGLHycKArUIWjwi43oVvIq4oDOK8hTXAPESotz2ZtYXHQmkIU39OFIlqoaC9GJ2kaXqE0v76xB5VIsnpT2lxuZWZpjroHb+wlWi4nuquuQD55AvI7R+UdTT64A9FIDSoZe7zORxI3+7rALFs7VINvTD9GAgaEVaEMNESW0B0RFAd6X1TnW9aTIl9lMlTeCuoFk1vvSijtaKn2Qk/2FlXvIIlUTJUop7NsA7ALpmJIBb0XHTFzhYT+IddsALHKXaaO5g/UzZU6Qw2GbubY64Gcd/5W96mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw6X7aiOUnvkeFSSI5h2Bbzu+q+Pehga1UdIpqrYmf0=;
 b=IzHWRycFDswDaikpqrj4rF+K2EJJGjNexmh/dpMq5qQeLHwlDnxXh89bzI0of0tP71wZdrnNx3gzLSWew8errj/nXjSCXviVRPtPAc32twGmJ0h2CuRTVlj45dyZkbeoinW2EUrwa5EX1L7inQoAeD2mi9k+9nCOissfr2VOBkN0z/N/wQ6xEpdkybbThxibF4dpCb8wCWKC7N+M0oSqSe0QE5ERBVaFFgG3oRg1aynK9IcnIcrz6uhZ2+PKAwsHCt5cnUj3jA/ZiJULhv8iIdEhJ+TPwtuHy681VZdg41HVNrk31s26SxDr/bH4UrDwdJtjwUYB8qXXw34MmS+Bcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB5178.namprd11.prod.outlook.com (2603:10b6:806:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 21:34:15 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 21:34:15 +0000
Date: Wed, 13 Sep 2023 14:34:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQIqzAEKoSPTuDeU@nvishwa1-DESK>
References: <20230912235159.2111118-1-matthew.brost@intel.com>
 <20230912235159.2111118-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230912235159.2111118-2-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB5178:EE_
X-MS-Office365-Filtering-Correlation-Id: e117df4c-bd6b-471a-dc87-08dbb4a12d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQdTXN3LXue2GQkDvF+wk/VQ2DGwEBrFo4oMn4uN5Inacy1c9+J1ZyU6pcZu1wHajbmKbZuNDoMTBB1nRhr9XQgbRNiv2urFsXxghxKFealqxZ3k3Ca1nLvyPFnblxDy4T/j12b1A/sWST8sk6Tz+f+UBbifwFfuxiyVD8u6MvmzFX8sfHA2fbSimRgl3YBr3McJfL/qh767IXieIB/oYajGsPfjxdt4GAcrBb2fpc0nhBJyXPl6vtwJaDvNnGnX1ROhs9bmnB6mhDCKdBUN+ojOZq0Z8XtMmc8A6oFEL5neofrfqUIwFu3H7el4toZksuxArHkiDcKpM+jm+wo9egZwStFgXm+E1hTBV+rNM+0c3D8OQZAyA315SFWw0n73+hOQm/lqCZPztvoTx203I+uNQ+LDoPErjbEzwztbSy7nz0KeGHXTiH4+uG/9ZFp8HsvsF4sX5gnhshkG5QnphLVvAAB6KvoEsNdHd+PSVRFF7/Fh2Kf+wviXHnDOLruzcQ9aDwdcmcQPRbhGR0+sGbiqJJBDXNz5v5ELCnf4A1XSvdPebE0z9C+H7Kcc0YAS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199024)(186009)(1800799009)(26005)(83380400001)(2906002)(8936002)(38100700002)(6666004)(86362001)(478600001)(82960400001)(41300700001)(44832011)(5660300002)(8676002)(6862004)(4326008)(316002)(66556008)(66946007)(6636002)(66476007)(9686003)(6512007)(33716001)(6486002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GmEPRIgTjzkSsA8cmEhhBO6SiL6o45Ie8LeVqrQT0BhlbiVYOWB93IS3sHMN?=
 =?us-ascii?Q?zQh21kZtSXtzCGJ/OdCuOjhz3LSfOn0MSn/AoNksExncx+u+axc4+t6U0zVt?=
 =?us-ascii?Q?ZtSM5JW3dqATWbMjNGh6GtaGNyN1OX+Eptcni/y8b2ni8AEjY541AGc8u4my?=
 =?us-ascii?Q?MIMBKhbb480mgEIbWnFlYdAPX3pDJnM4e84Y9jkfJQPqzr2OinLUTgX1SrWm?=
 =?us-ascii?Q?btl9onpdNdH+6+Wv0VZmgd3O8R2S6c/zSOl3roRitovETvSQjtPZn8iylYKn?=
 =?us-ascii?Q?NhLWhzYdw8XdPiL1L42bYak6pJPcm+9QAzQ7sUKnYBQpopc5CahB1Pgionmr?=
 =?us-ascii?Q?ohXeYNX+9J1aWC98oXmB0+2dUrC0N8tMP0kE7c9Lm+4aHXawJeDxWYPpjA8A?=
 =?us-ascii?Q?BKHkTnTXEDt6TpqPnWKCHK95ltNNyxrbcbOlyovkqS8ptlWFhKGgkSi7/q/3?=
 =?us-ascii?Q?BPetqY0926dFZ4V8GvJPhffRDd9sj4k9f7h9iPAPYQ43Ft4LPWqGxbgd/0tR?=
 =?us-ascii?Q?BQ2UeuVvCGFsos2TzRCGbChaRGX+D9Y1csLvgsk0utLbBpg5xlWntGU5hluk?=
 =?us-ascii?Q?G0h2tMdtS+SQWSRyhBrbq17mtZ+MQQrzjVr3izvoNgMin2Be/rjHInxhMuyR?=
 =?us-ascii?Q?6K/sGJ3qJcof10ixC0Zjbh7kCyG/yObglyqmE0oCG5PeQWLROmdColARtQei?=
 =?us-ascii?Q?ShXl/JMOiUrV8hEbxGIeO8jsh0PgdFeBe3NfWfYGp3cV00pu+J2u98y+S+rO?=
 =?us-ascii?Q?xGEiiQqvNMLfQvywRpgMdbUez6WBSYmUTkxWSdz4QPUYNV6dc6R1EoJ/PPOf?=
 =?us-ascii?Q?IC9IMJ7bmLu9oaptrVzyPrDXgP1gbIBENv5rcprKMZqG/gbdK0/Cejl77H2N?=
 =?us-ascii?Q?9wqc1JcgpzdQF7IxLpP4M+IHClaRgQsG+VMXJLtG9vdh91Vu58cJHMh7Mc4m?=
 =?us-ascii?Q?Rj5mWq9FD1zbMG6CvP89QfFjIkhbHj2nevW9hi3lfrvybchd4WhpQKZ4HkGu?=
 =?us-ascii?Q?/Xh/wlAlHcb1egzyyKQdQbvobpQIKRDmHM9xKa1JzY9168bJ5p3+qFgdB92q?=
 =?us-ascii?Q?qdZ0RJWGOB6OB0kZEzF+bahkTcCUQbJeA0AuaOQhO3PYrq+jADowH4cgfVyj?=
 =?us-ascii?Q?iAMSyGFMWWdPa2ypvbciDGH97h0sbG4if3NWoAGW4lL0QHdXmTJ2RZHZzBIX?=
 =?us-ascii?Q?cVO/fOYlSmjx500hj0aDiFuvkCaaRrgV7nAAy4YkjF2L5XplDlzZeCpck2h/?=
 =?us-ascii?Q?aWMvgjHVkp8FPS1duQwATjM/0V8bbwxqnJUBO9z0vHpFqrwLc7+48mz1I3Mx?=
 =?us-ascii?Q?MQyz4sK44HhMO6zmidsdzJXBbMi78aKHUo+MQwmLOkiaEDQdVgX191h0REU8?=
 =?us-ascii?Q?+jf3GSTaD9IE/uFfm3T7c2foQHoOsYfHi95AzAdEKOXOgoLpACltL9l/GgOA?=
 =?us-ascii?Q?cmPLQk/aheJXgjQyUdnemVF+l9pfJ6t++//bzI+Gwb4N72Z4sDmh/Q1WUP6P?=
 =?us-ascii?Q?5LzqBdJ3zVas/4gV7OlSCChVFe076XRzNp1WjNCIn2uNJvGAvfbVR74kd2tZ?=
 =?us-ascii?Q?XWxCBebQKRfRbzXwgMqU2iFAIRPYk6GmMp/bXo71oZBrYMZY1F10CoPxJ3zP?=
 =?us-ascii?Q?eXlhVz059v89dIa5S4627Lo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e117df4c-bd6b-471a-dc87-08dbb4a12d6f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 21:34:14.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHpnl1QyouaS54Ft7GpdGZu8zb/cbySFV1ahEkgTZau6/JzgyV5YKU7i/bopwCBvyhbAbE4Sn/ZqIZjVbK1H+QzHKQ9xjG7GKbf8Yc70QTGrY1Tx+t7Agj4bRIjAlMKD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5178
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Deprecate
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
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

On Tue, Sep 12, 2023 at 04:51:58PM -0700, Matthew Brost wrote:
>We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
>uAPI, deprecate the implementation first by making
>XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP.
>

So, only make it creation time parameter, right?
May be mention that in the commit text here?

>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
> 2 files changed, 16 insertions(+), 47 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 6725157d8c1d..ac392bcf7bc8 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
> 				       u64 value, bool create)
> {
>-	if (XE_IOCTL_DBG(xe, !create))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>-		return -EINVAL;
>-
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
>-		return -EINVAL;
>-
>-	if (value) {
>-		struct xe_vm *vm = q->vm;
>-		int err;
>-
>-		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
>-			return -EOPNOTSUPP;
>-
>-		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
>-			return -EOPNOTSUPP;
>-
>-		if (XE_IOCTL_DBG(xe, q->width != 1))
>-			return -EINVAL;
>-
>-		q->compute.context = dma_fence_context_alloc(1);
>-		spin_lock_init(&q->compute.lock);
>-
>-		err = xe_vm_add_compute_exec_queue(vm, q);
>-		if (XE_IOCTL_DBG(xe, err))
>-			return err;
>-
>-		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
>-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
>-	}
>-
> 	return 0;
> }
>
>@@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
> 	if (XE_IOCTL_DBG(xe, !create))
> 		return -EINVAL;
>
>-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
>+	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
> 		return -EINVAL;
>
> 	if (value)
>@@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		xe_vm_put(vm);
> 		if (IS_ERR(q))
> 			return PTR_ERR(q);
>+
>+		if (xe_vm_in_compute_mode(vm)) {
>+			q->compute.context = dma_fence_context_alloc(1);
>+			spin_lock_init(&q->compute.lock);
>+
>+			err = xe_vm_add_compute_exec_queue(vm, q);
>+			if (XE_IOCTL_DBG(xe, err))
>+				goto put_exec_queue;

Don't we need the below checks here?

if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
        return -EOPNOTSUPP;

if (XE_IOCTL_DBG(xe, q->width != 1))
        return -EINVAL;

>+		}
> 	}
>
> 	if (args->extensions) {
> 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
> 		if (XE_IOCTL_DBG(xe, err))
>-			goto put_exec_queue;
>-	}
>-
>-	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
>-			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
>-		err = -EOPNOTSUPP;
>-		goto put_exec_queue;
>+			goto kill_exec_queue;
> 	}
>
> 	q->persistent.xef = xef;
>@@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
> 	mutex_unlock(&xef->exec_queue.lock);
> 	if (err)
>-		goto put_exec_queue;
>+		goto kill_exec_queue;
>
> 	args->exec_queue_id = id;
>
> 	return 0;
>
>-put_exec_queue:
>+kill_exec_queue:
> 	xe_exec_queue_kill(q);
>+put_exec_queue:
> 	xe_exec_queue_put(q);

Not directly related to this patch, but now that I am looking at it, probably
the function exec_queue_kill_compute() should be renamed to
xe_vm_remove_compute_exec_queue() and move it to xe_vm.c?

Niranjana

> 	return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 347d28442701..f73b9e80b25a 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -60,12 +60,10 @@ struct xe_exec_queue {
> #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> /* queue keeps running pending jobs after destroy ioctl */
> #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
>-/* queue for use with compute VMs */
>-#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
> /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
>-#define EXEC_QUEUE_FLAG_VM			BIT(5)
>+#define EXEC_QUEUE_FLAG_VM			BIT(4)
> /* child of VM queue for multi-tile VM jobs */
>-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
>+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>
> 	/**
> 	 * @flags: flags for this exec queue, should statically setup aside from ban
>-- 
>2.34.1
>
