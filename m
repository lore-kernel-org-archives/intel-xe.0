Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09061C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 22:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3FB10E4DE;
	Tue, 14 Nov 2023 22:28:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FC410E4DE
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 22:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700000915; x=1731536915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3PC6OXXifXPr3ZlhiRr2Y8DBy1ujArb6qguVu/2ybkg=;
 b=NmfnUi7OTVsi48YLOKb04ePKhO7vDooSjA1B1MizSKKhrcQESTfKiEv+
 pU602/8dYJAnXb4p+cCBg+VsMuPZzMNu6LFR0Bafic6vHmqlm7nzBkjc4
 TJwA9s+vJpva5p0MxU34fRnvsRgoHBqsbOWH+N5njfGZG74Tw/zmaoZeh
 dXVVp0r7rAk5UwvunCNGBWG4+m2JOQGqwKE8ITUk20ydkPmPgS/+2rrsr
 Olx5sCe744u8uDvitBxeXQgDSbgjCoTN+HA/XNnX6YtWbHK/j4/dDdfdR
 NcvG9dEfBGpNM5zUuKrAGzbNvzO2ET/3GIUUFiY9nO4pWcXELAxH1GeGA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3831617"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="3831617"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 14:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="764799354"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="764799354"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 14:28:33 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 14:28:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 14:28:32 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 14:28:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkI0pp7XZ9nWRjI+0X8YYxKKzT18Yb3hM72n73kraTwbt2m/oW5AKraiKV94VS7ogNm3dzvfrV9sLXpY2Y2Gy4wQ4oMSTHAPKo8jXhDxeM96RkZJ63SIHcyOxdhE/s9qmFBmr1/6faGREqgo3k5UOO1bBK9IeVs5dqposi64i8T96MbyFRTIJpIsqvAXFLsfCOfEHfhUruXbEVagY+9hCaRZqPA2quEpTrbXN6uUInaROLrCknvDlBU/8zpRNMaXHgA5viGqfEEUaux4W70JYYJmwD/UzJAORHeLeQFO12HnEEfk5A0IUfHfmuwZzPquN2mUfU1zwNeW65se4PEWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfwI7QoMfWZVaWPiuZzh0E7RTTwwoySpXPzNiWFMdHE=;
 b=RxufI3xD2xWEB4LxVbE+n2wiupejiLUAAeXd/L5gSgiJsGx32dzDoYp9vinn25B2kAWp3X94O0eFQk8AtfJX0/oaRqsk9rJNPoclWzxH6J8t0qB9OvlC4kvWfqNEppL4n+sN+zNzsdNzpkSWTEYLCALNI3l0xqt6CaRKMfIK5SkC9fw6lJhmx2g5PtCOzIxaY0jTuUV8MLkvvEJ8D4zL7o7IEPQF1a+aV6AiMlAEqzAAIkbc+be2u00P+qNq3WruHzQ4DB3LMv/fPDWalhDruZAbyEgOiWWgo2yBXjAhqGaB7iOE/KM2rBlvfCFo5l3Jou4NL4gB9VWjFAmmkp3JCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by IA0PR11MB7380.namprd11.prod.outlook.com (2603:10b6:208:430::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 22:28:29 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.6954.028; Tue, 14 Nov 2023
 22:28:29 +0000
Date: Tue, 14 Nov 2023 14:28:27 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Message-ID: <ZVP0i0CoEqV3eNmX@nvishwa1-DESK>
References: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
 <20231114004604.4439-3-niranjana.vishwanathapura@intel.com>
 <c54da398-bec3-4989-b26a-e22b77a2d323@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <c54da398-bec3-4989-b26a-e22b77a2d323@intel.com>
X-ClientProxiedBy: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|IA0PR11MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: abbfd483-0696-48a9-8799-08dbe56106d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjlrryLaZyeKNVeisG+CkSK9F99k02tiXQ67gU4CdeIuE/qGm/lIZNDLoCwZJfVEbXLQQUp3/eB25WXFGVfQdwicf9CMyBYz2i8bcME0LARXMLWXwSjeb5ToCjOS1gAmjPNfPL5rBXNvGR4OnT4VZr83ljADQRVddxG1M0eAUFVD3DfFU/W88qPaVQkKp7OmmWB3X/l8borNK6XbNuGHG71rH8FJteQ1dPtOIiq/439kuOtrVJz/w4mk+rYqbSwmCyio6B9JNcsoj06D4laT13d11NQJFNQzxhRzTgfr6UHR/OvGxwIgtn4s74MHE+p+AeXVIqDNsJ4P8wXepBbeyAF435CUbawwoUiGaqE5TXqEOKNGLHDKfrXfTJHm3YRwYlf3jRDQc+nNAy2OpPK8AVSPB4QmApF1mvtNZvWQFfGwmSz4YjeVNPdOaHlqj2HmiSIOE+HgxV+vsImDEejlErbssIgMeF1CkSpxNiC4mo2jGyvN6G9Fg9pZXB9W/Ynzdo9qoP7TgkkurrGkwy+kZxUVyjfld6JMffKgWbwq50c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(66946007)(316002)(6636002)(66476007)(66556008)(6486002)(478600001)(966005)(5660300002)(86362001)(41300700001)(2906002)(33716001)(4326008)(8936002)(8676002)(6862004)(44832011)(38100700002)(26005)(83380400001)(82960400001)(6506007)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dwoMGzG5l6Ji6f69Z5H681fOc9NebuoGYnrqK1pP5bHI2zL9asoMdGyAf4wZ?=
 =?us-ascii?Q?glcHq1mELDtSnWRQe+Z/HF2WgBsWi8dLlg2cB53wPKxBSl8A2wOaF2X7RkgD?=
 =?us-ascii?Q?PJ9D793ci1N6i/3ehRWgK/oJLbsnQy1TCgAL1bByNdSNr3JYQww1klb/SgB/?=
 =?us-ascii?Q?YKf5p9E2ga59xgwuDnLfIOF+x/yzbBgd87Q8+tAm9LkC+WWySNxXNgBn/Wew?=
 =?us-ascii?Q?YUgIQQ7d/5pkdvKmtbWTFyUO5oaxTCULf3W2h2SsNdTHDEgqGYEsj2fcPlQC?=
 =?us-ascii?Q?4gFsL6deve3fiVs5Cb8aSyqRt1VIpWx1mBV80ZWC1axgFREnVbrwOOIeSxzQ?=
 =?us-ascii?Q?+K8RtOagbgo7NFD51we6Lfh1dR/K0tukq6N41xKxUaaizN+5W2EO2LBFnDti?=
 =?us-ascii?Q?Wf1jqhbKHkd4RHiGYYC16NubN/R7jliDvrmEvngxuzZ7JGp/DaPC6f6L2DxW?=
 =?us-ascii?Q?GG774qvM6s1beS37b3RCqStTdAby1qVVE3e2VXnWr3zMNMQK7xoBsslKefL0?=
 =?us-ascii?Q?fobXP6XE+d1tOYF7HwhiLeZkqCw0S75/DyxOX03iiykHkIOrVVjkcPOAmjNZ?=
 =?us-ascii?Q?oZQYVBfZM/bNSOkwBOShsbnDUEbuL58fW4A4dHU0VyJlenXmJ7TZQlGJXkL2?=
 =?us-ascii?Q?frphA3C4aL6E1AB5b4qiJpEaj7CZinOxhy9Owpmct4fmFqbILAT+rK9dVlkr?=
 =?us-ascii?Q?QKo+yeGW5MK867i/h/xn7TRyRIsy6cJ7w8cRt/+abs+P9ReBYFuGV+r0DqCH?=
 =?us-ascii?Q?q9KTyVq37CoqAp+Mzi+E5wxWTgBpFT+2lxIgwFm7QBWs8TtozYmvm749PBw/?=
 =?us-ascii?Q?NZNREjBdsY96WtY3TJOmHxE6dbLhN/tWU7JJaGMwJESYvpRh8NsMTrqQEr/e?=
 =?us-ascii?Q?/sYi86akk7VVrDgjh8Um0ceKVgEVD11Wcp1DRz2LEnE7y+Fdc86NUnKGSg8f?=
 =?us-ascii?Q?JMX6NMLw0QZJvwfyP0sTDjUJfoJfl3moUpuGzq4UGcqS8DswFdTdixQW/eUA?=
 =?us-ascii?Q?pYVXExuz68qQmW+eixBUBKqCSDxLdC5tNgIZBA179olSNEt1pi6P21Fn6ixw?=
 =?us-ascii?Q?lqGYDIqKCSCHU31mJV4lyaw7cy23A2o/MoiPVHkgBxM6dJNLTui0mPfOhVq0?=
 =?us-ascii?Q?eKhwxnuq3vbAxjRUGjHRuSdO2WpNjhHZEJ6pjRiuFw4Lt3cL7MQ2ZH69JGwU?=
 =?us-ascii?Q?zE3YXYdDSd+SlvJDDfYoniim2XdzP4ITFwrCRVFMLtd1ZbwSdKPSMydGgSAy?=
 =?us-ascii?Q?WOf0+AYjqICg7oX+wHnAfbRHtQUca87QTbgH93coPdOlnB+uGDfEjQgu/3zm?=
 =?us-ascii?Q?0TcqMhJdvE4y0NGNypQIP4DdqsyoyCQt8vkVWPT1p8rGjMQeGHUYdP4ZNggq?=
 =?us-ascii?Q?tpsahCzoq8+r6I0bVvTjxQmrVWZwPs1yoyzLkf5wnnrv4KM1Wa3bbBAYuZ3m?=
 =?us-ascii?Q?acCL5NFcdFbvxX09stxpsoGPpbc6NC5SVBhutpRbf62xQW4VgbSOCcLnJCoE?=
 =?us-ascii?Q?oL3edyKYmm9XcPxOjyoyQiYH8pXvWOSoPW9mGwke7+08j1vi5y4fzRqWt+ec?=
 =?us-ascii?Q?xnvx1KjsxCAmiJtPiA1BKKomDURBidcGIHtcTBAXu48GyhKMWJ8CFF89V62I?=
 =?us-ascii?Q?G12BoLjIyEraQqmEQ+Wd0oE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abbfd483-0696-48a9-8799-08dbe56106d0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 22:28:29.2969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJiMlERkZyi53Z5rGOncjeMPPGTpRca/vPto181a0aa5WiEbUvYkhnTxByAiNLBAWItsfh3mtqUqStk4dFIYlgzuBZrIboFYLX8Vgpor3LUeNcbY94G+v/u/YoHvAFmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7380
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v3 2/2] drm/xe: Avoid any races around ccs_mode
 update
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

On Tue, Nov 14, 2023 at 12:10:23PM -0800, Welty, Brian wrote:
>
>
>On 11/13/2023 4:46 PM, Niranjana Vishwanathapura wrote:
>>Ensure that there are no drm clients when changing CCS mode.
>>Allow exec_queue creation only with enabled CCS engines.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device.c       | 9 +++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h | 9 +++++++++
>>  drivers/gpu/drm/xe/xe_gt_sysfs.c     | 9 +++++++++
>>  3 files changed, 27 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 1202f8007f79..27e6f0bf423e 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -73,6 +73,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>  	mutex_init(&xef->exec_queue.lock);
>>  	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>>+	spin_lock(&xe->ccs_mode.lock);
>>+	xe->ccs_mode.num_drm_clients++;
>>+	spin_unlock(&xe->ccs_mode.lock);
>>+
>>  	file->driver_priv = xef;
>>  	return 0;
>>  }
>>@@ -105,6 +109,10 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  	xa_destroy(&xef->vm.xa);
>>  	mutex_destroy(&xef->vm.lock);
>>+	spin_lock(&xe->ccs_mode.lock);
>>+	xe->ccs_mode.num_drm_clients--;
>>+	spin_unlock(&xe->ccs_mode.lock);
>>+
>>  	xe_drm_client_put(xef->client);
>>  	kfree(xef);
>>  }
>>@@ -228,6 +236,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  	xe->info.force_execlist = force_execlist;
>>  	spin_lock_init(&xe->irq.lock);
>>+	spin_lock_init(&xe->ccs_mode.lock);
>>  	init_waitqueue_head(&xe->ufence_wq);
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index be11cadccbd4..3382281146aa 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -297,6 +297,15 @@ struct xe_device {
>>  		struct ttm_resource_manager sys_mgr;
>>  	} mem;
>>+	/** @ccs_mode: ccs mode */
>>+	struct {
>>+		/** @lock: Ensure there are no clients while setting ccs_mode */
>>+		spinlock_t lock;
>>+
>>+		/** @num_drm_clients: number of drm clients */
>>+		u64 num_drm_clients;
>>+	} ccs_mode;
>
>I think future features also want to track drm_clients?
>Such as EU debugger: https://lists.freedesktop.org/archives/intel-xe/2023-November/017903.html
>Above proposes xarray (or linked list) of drm clients.
>

Thanks Brian. I see..

>Maybe rename above to 'clients' to match the sub-structure that EU 
>debugger will introduce later?   Then they don't miss this and they 
>can remove the num_drm_clients in favor of testing if list is empty?
>

Sure, will rename the sturct as 'clients'.

Niranjana

>-Brian
>
>
>>+
>>  	/** @usm: unified memory state */
>>  	struct {
>>  		/** @asid: convert a ASID to VM */
>>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>index e53221c2894f..c4779efd65b4 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>@@ -48,6 +48,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>  	       const char *buff, size_t count)
>>  {
>>  	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>>+	struct xe_device *xe = gt_to_xe(gt);
>>  	u32 num_engines, num_slices;
>>  	int ret;
>>@@ -66,12 +67,20 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>  		return -EINVAL;
>>  	}
>>+	spin_lock(&xe->ccs_mode.lock);
>>+	if (xe->ccs_mode.num_drm_clients) {
>>+		spin_unlock(&xe->ccs_mode.lock);
>>+		return -EBUSY;
>>+	}
>>+
>>  	if (gt->ccs.num_engines != num_engines) {
>>  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>>  		gt->ccs.num_engines = num_engines;
>>  		xe_gt_reset_async(gt);
>>  	}
>>+	spin_unlock(&xe->ccs_mode.lock);
>>+
>>  	return count;
>>  }
