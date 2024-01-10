Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C145EC47073
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC3D10E678;
	Wed, 10 Jan 2024 20:34:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E26210E685
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704918862; x=1736454862;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OqxeFKBeHDOUgeGkxKd52xyCgEHc172x3pBqyJDbZ8I=;
 b=IyWUF45EzeuR+oUHLzbWsklavXkF4ypXVz0ODBFOOqmOvfFMJ34XsYt7
 eWRat8Y6ySmrqt5dJ4reG+jAsyovD/7rkAHRRR7IChLrdkXmsQAMLxYy3
 VehR/KT12GNovzYgSsuWgHFkYGVRPoZn75HOVd/R3qF3Ue624fpQVEUDp
 ABEEw5gyMP7LGDJdazOKRFPvDq8MHcIXVmPsKGOO9k/ZvNkI0Qdz8876Z
 bFrM+fvb0Q/dDijSkV7fCbe4U3r+pgnngQSUNTlCV+xQQrxcyR8aXsZ/D
 MlxKh9p4hoYCPkj61xOXAOB4kDrs7tp3uzxLuxa9Kr0Rpec9Xv4FUizL0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="484826017"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="484826017"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:34:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="785732564"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="785732564"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 12:34:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:34:21 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:34:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 12:34:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 12:34:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atT75Y824x9arDWHCmESFdCjvS6+dzpfO90QvYdB5pZXb1Yi+aE0h4Zz8vPQDSDM+N69pu7/J8aKrhnD+hm1n12nNaccl2IdDmoQCexmyIFoVcuVF2S7/cCVE+wtEk1DypgtVUY1gzjfggP5IVM57tC70m1ru4caZGfpTvWVLo8PcjfH4196bBqjBb9xbtjKwwpE0I/qMdDZbYqka1A6/DzvD+PrsO/yVvg65mGLE3CdhrEsf+DfI2slNyAwIjkVzZsfnsloXw5e8ox9H22VbIjIFkNbH8AhXXLyRCEFfb/T8V31xy7KFaXex4FV8Mod/s0gPBkgIlOSzsKkCW7Vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdrxJyj5Op1EjrWU+nVoVvVahNK6B0HbzBjE+maCzKQ=;
 b=Lxisyei69pUsI8Fqxlfe1tdzCfOKw2BrRnlMYNL+9w2oQZ4fFdf33vQiLqNbMrcDsMtEsOXLCexvSEWtCW87/AG8dS6fQqtMWNTJEakqPnrDTGwKROKLrQEB55FvVX0HITBYbuIf43nPt3/iQFq4oe/sqZc+8Ozxf/DcrwXJAW0WUBZzRi+WA72ovR1W8TwG9cL+OJaSpZiMqsDpnVUkzi9crdtrpcPhUb/Cxt77GEhEjntr26rS0Mgn563/W5YBNXg4FwhblSxvkQ+i5jO7s/4+3Kc+Mj9lz7U+YHLcZacNKAASJ/wH5ixrOmGejwFMRiWc74pw28LKQChxuDPQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5555.namprd11.prod.outlook.com (2603:10b6:208:317::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Wed, 10 Jan
 2024 20:34:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:34:19 +0000
Date: Wed, 10 Jan 2024 14:34:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe: Invert access counter queue head / tail
Message-ID: <vgzzd3i53acyj67jad24cp24v4smpxbwvai6euh6pb3mjpzzqq@4kymzb4cyxuy>
References: <20240110012439.1400618-1-matthew.brost@intel.com>
 <20240110012439.1400618-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240110012439.1400618-5-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: 249e19be-d069-482e-1d4b-08dc121b857c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ihUwoR98QA3FvnTjIQBEclI/ACDoLMInmYRUG1z6dzlNjKsMkxp9cOylXkt7xNYUOfe7n3QgR3ow0Sz5/vMU2vQBDlHoXkJh2anWhCLtqHsW7g1Xk40wM/CEp3LHym0rH9xEabrnkYr4izCf3hxN5PIlwktj2UYnLGHSgewYXMhZWc06TwjLz3dqOxPdwos8/SREwBcdBFF2iYkMttIA8NHyJBf6+WBn9XT39bQG/6R9PZnXOA9HtXlcO9JUpiZFhDSDzYDoBls/WKSz4TfBNasyaGGlSxEvCrkwqpUfPa1nE1J+f7zZ9RcGvZozxclqGO5OQWYcpvoXnfM4LapqQiXng55OzWGJYkLfyhTPbnTfpp0o4UxQahEnNBgTKbnYarw2LXDAHES0P4AbhdmSyYRKSOqM/eyL6FAS6jHoVwZBeSvUTuRdMQF2jreyn1t3UfIsDrrrlfU+buiZkczgCoMsrgTI6DVSc2JRC34d4/zaqk17vsE2LU2c+C7tWDJrNB1eYbaMpUTxL7DyPoHy8hWv0B1bV0kbC1EO4zOhp5Lf16x5MFO9ZltP+XsI5dvM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(478600001)(5660300002)(6486002)(6512007)(82960400001)(86362001)(33716001)(6506007)(9686003)(8676002)(66556008)(66946007)(316002)(66476007)(8936002)(41300700001)(6636002)(38100700002)(26005)(83380400001)(6862004)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WxrK63frFc6spH0Q0QRtsxmFasAi1kixsIB8cBF/Ws1knfIXXYIhswsQXVde?=
 =?us-ascii?Q?pUBexHrCukKDLI9tAzfb+P7HSAtVBaI4PI1ruoqFIObCWhpNl7OqYCSikcUG?=
 =?us-ascii?Q?Q8kOKkKY8NuF7QpCHQk5ye3QkwdzF1F3YMsIQpTQc259NnDBm0iSeW30t98f?=
 =?us-ascii?Q?auWQ555mt36d5Hn4sj5D2snL/jiitVXppKSejwAPL3c8nMC74m6OBFRGmsjE?=
 =?us-ascii?Q?e6L0Jzhfv+Dzoj9WD+pr0himQuTD9ooXTig86QlcOdZihZy7k2Je68Qi3cyT?=
 =?us-ascii?Q?qysF/ynCLDfdjNu6zSkIeNdGTI2e/EQSSm05/lx5UfsC29fyI1qeTMWqrfNL?=
 =?us-ascii?Q?RoeFV9WwCI5idsLRPfG59m5cZBB9Zqz8IQvz9ZO9r9FM/IJiDrbodXUNU2sZ?=
 =?us-ascii?Q?eC3kEoc12/xk3f/e2G09C0ISQGhg9iYPajS0oxXGLyZVhbTnD6TnMlE+R1QR?=
 =?us-ascii?Q?p3gajPZv1xMdS1XVNiaLoOfwQNv007yLgeWITBwc6dd48jwK15H2Ene0iJjP?=
 =?us-ascii?Q?HQkp4B4R0DecgKsTIvE7dM+bduxMqvtsI4sNDQsVi1CP8oni6V+pq/7VVPjh?=
 =?us-ascii?Q?F6yNMSKsAMAz3RVindDowE9gxKsENfrINZupHUzAJmRTag8WEKeY80O2Vs2a?=
 =?us-ascii?Q?pUjIg1633hMj38fycl+Nxke9FrJF/JThf0kaOCm8qUnUwhPndEnHvYidd6Kk?=
 =?us-ascii?Q?TVE1ke0hCSnabiQfW94MTS7V69vK4/jJV+Nu64GedoStVzbFqyWg5TejLnWN?=
 =?us-ascii?Q?i+Fb6OovmSShjA4PsPUQwfwYK2cv97cjjQhh4xtcfBoYSb0j6rwWlIXqaYMK?=
 =?us-ascii?Q?5dET2sE6tNdorbls4+li3u48Dq9GeR1NtvC0KD4uKQtCePLHyyBZuxNSw0Ko?=
 =?us-ascii?Q?gK7vubYlcOGLSMhIVgSZvIwDpbWshaVtY4pLnBmmX87ccstVhyunxovLkqiB?=
 =?us-ascii?Q?WV72G0fb7qoRWFddDmYmlwFt4cmr32bNU2YHnOTWE9Ikji3gdWkNG/S4i+Rh?=
 =?us-ascii?Q?///Qob72yYjIprXZ7GpJ6l/CeaNwGQbsiJZ8gCmBGECjZf6SSoqkCd//ufxw?=
 =?us-ascii?Q?XvqBMWG/ztYbqDhHEE5Hb8r6VdpsXX2qMagptOgt5BV52KehoxWY/vezlK28?=
 =?us-ascii?Q?XRpnooHOjWLellsuciZMCOMbtXqV/KTTyQYvAlxoIjoAecjA0pqrcvRtOTpT?=
 =?us-ascii?Q?qqUdXhXJXMnzyiUJ6SAdtTUWgYgdaLeL1tCEtQJ+InT9YjEFBCaMf8tBTOJ1?=
 =?us-ascii?Q?hCPIo0p8MS0OrdKlTSOExvc4hZ9g9xlL/Ib1ekzlPU1DehT9pn+Z/Hci+p0W?=
 =?us-ascii?Q?6OTAl6uNxu03qVoYd2GUXRNsqT9IdTeqP+va8sDxdpto78TlSvCXSQQBYI3x?=
 =?us-ascii?Q?03iMc7T8JAZnbCWL5Wosf2R0UB/uzXLBsOBRr/y7GHyyigyxFuPr0IqGITes?=
 =?us-ascii?Q?QmN6rAdUF6K1Hrt+mOfz05+4j0xJZrgkhM32IBaqDPxvdzPmBd9sL7raKPZM?=
 =?us-ascii?Q?b0Ah4oTaSlmvTTN8W/izY4MWudBJi8LGJthAIVJVmQhSr9As42ZXSHzks193?=
 =?us-ascii?Q?to+4hsVHYt7XUnuN7FrvPneov6+9Rq3kgb7kvWIxkJbfdnyPXM45LURZgeJp?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 249e19be-d069-482e-1d4b-08dc121b857c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:34:19.4479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDeDWW1a3y0zNxnm/l/ic7tmBpo2W/FDgtw8q5Yf5ZHQP1xLduTbxKOGq16hUKLMCxIKlvJh/3zDOl/+OT4aMXmaERB6ekMeBSj4/fF++1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5555
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

On Tue, Jan 09, 2024 at 05:24:39PM -0800, Matthew Brost wrote:
>Convention for queues in Linux is the producer moves the head and
>consumer moves the tail. Fix the access counter queue to conform to
>this convention.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

same comment as in patch #2... I checked the objdump output and with the
extra hunk in xe_gt_pagefault_reset(), they match.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 +++++++-------
> drivers/gpu/drm/xe/xe_gt_types.h     | 13 +++++++------
> 2 files changed, 14 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index 13183088401f..5c2603075af9 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -564,9 +564,9 @@ static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
> 	bool ret = false;
>
> 	spin_lock(&acc_queue->lock);
>-	if (acc_queue->head != acc_queue->tail) {
>+	if (acc_queue->tail != acc_queue->head) {
> 		desc = (const struct xe_guc_acc_desc *)
>-			(acc_queue->data + acc_queue->head);
>+			(acc_queue->data + acc_queue->tail);
>
> 		acc->granularity = FIELD_GET(ACC_GRANULARITY, desc->dw2);
> 		acc->sub_granularity = FIELD_GET(ACC_SUBG_HI, desc->dw1) << 31 |
>@@ -579,7 +579,7 @@ static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
> 		acc->va_range_base = make_u64(desc->dw3 & ACC_VIRTUAL_ADDR_RANGE_HI,
> 					      desc->dw2 & ACC_VIRTUAL_ADDR_RANGE_LO);
>
>-		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
>+		acc_queue->tail = (acc_queue->tail + ACC_MSG_LEN_DW) %
> 				  ACC_QUEUE_NUM_DW;
> 		ret = true;
> 	}
>@@ -607,7 +607,7 @@ static void acc_queue_work_func(struct work_struct *w)
> 		}
>
> 		if (time_after(jiffies, threshold) &&
>-		    acc_queue->head != acc_queue->tail) {
>+		    acc_queue->tail != acc_queue->head) {
> 			queue_work(gt->usm.acc_wq, w);
> 			break;
> 		}
>@@ -618,7 +618,7 @@ static bool acc_queue_full(struct acc_queue *acc_queue)
> {
> 	lockdep_assert_held(&acc_queue->lock);
>
>-	return CIRC_SPACE(acc_queue->tail, acc_queue->head, ACC_QUEUE_NUM_DW) <=
>+	return CIRC_SPACE(acc_queue->head, acc_queue->tail, ACC_QUEUE_NUM_DW) <=
> 		ACC_MSG_LEN_DW;
> }
>
>@@ -643,9 +643,9 @@ int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 	spin_lock(&acc_queue->lock);
> 	full = acc_queue_full(acc_queue);
> 	if (!full) {
>-		memcpy(acc_queue->data + acc_queue->tail, msg,
>+		memcpy(acc_queue->data + acc_queue->head, msg,
> 		       len * sizeof(u32));
>-		acc_queue->tail = (acc_queue->tail + len) % ACC_QUEUE_NUM_DW;
>+		acc_queue->head = (acc_queue->head + len) % ACC_QUEUE_NUM_DW;
> 		queue_work(gt->usm.acc_wq, &acc_queue->worker);
> 	} else {
> 		drm_warn(&gt_to_xe(gt)->drm, "ACC Queue full, dropping ACC");
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index b15503dabba4..047cde6cda10 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -252,15 +252,16 @@ struct xe_gt {
> 			/** @data: data in the page fault queue */
> 			u32 data[ACC_QUEUE_NUM_DW];
> 			/**
>-			 * @head: head pointer in DWs for page fault queue,
>-			 * moved by worker which processes faults.
>+			 * @tail: tail pointer in DWs for access counter queue,
>+			 * moved by worker which processes counters
>+			 * (consumer).
> 			 */
>-			u16 head;
>+			u16 tail;
> 			/**
>-			 * @tail: tail pointer in DWs for page fault queue,
>-			 * moved by G2H handler.
>+			 * @head: head pointer in DWs for access counter queue,
>+			 * moved by G2H handler (producer).
> 			 */
>-			u16 tail;
>+			u16 head;
> 			/** @lock: protects page fault queue */
> 			spinlock_t lock;
> 			/** @worker: to process access counters */
>-- 
>2.34.1
>
