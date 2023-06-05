Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A915EC7EE23
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 17:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6888410E1CB;
	Mon,  5 Jun 2023 17:04:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF4B10E2FD
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685984694; x=1717520694;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E1+E8LkAj9cQfvKsJdY8qVF4AL/0BQ7ksUifrbjvIfg=;
 b=YvHI+NW0cQeaowZ91jl6mRHB8DYSy11PKpRRxMcVtspWat6/810dTq6D
 eBoisev8QFfGmnBCciBrUh//bdXoXQ2aUZkvQxKKOOUxLo9qQBhu6JLBb
 GKGwFyB+gAaLHs1D2dEzZqJ1ZrgNBf+sxc3yLMSBetbBvpHpAB0/JRefU
 Sk8JdnmoQopRvZ+7B8K6c3NUMi2O04gReZ9xn015472g7Lk23heQOLqYe
 F7CXfMweW9PrD3aFAfFViQHhfdYjHT+MGV4PsJPs6KA5+NoZHfLHkEyvi
 3NiJibH8HNXfu6Jsf7n+KwkOYS18HAxdGX5N8ObefEmPislaxs/Wb0weO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358873983"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="358873983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738428115"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="738428115"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 10:04:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:04:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:04:36 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:04:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxxlLKJNMqvDEtmkT9Ewvc3/09eGmvgB64q2h82NIyJMTqZOf3cDoAu+Afa5hb1dlPGbcrgq4hlk9osHzVpbaYZGjNBt+jnH6R6unSw/Lt8HfeuOncNHVMI3VvsftOF8rmIk67en3T0j5LgTGpnO+WgB292+nd0rJpG9yHAudO6e8LMUMHkROCo86jEz3TeCvPnGjTEV7PezJiEnGmvlkOVGVDQc4zEcnTJfTeVsQXoI3eSlPXw9LcL+5otiVSGrhANcwg1wbhWrF2W9W7J/JaXuDZXTfda2MYj05DwbnnzXrZOmt9a+vxNWuiCR0FTIDtRSwYnOBul56L+EZ9sX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v91kNDxNar1OKEzRPneHPzoQa5MJAWG8VxYB12zod04=;
 b=hALO6eoI8QXhzQVjN+u6J5KmY/NzA+bUI6KMfE0+4fbxQ3JJkyyI7YesAeV0tHla4iIyGx8arEJeUAR01WteyP9mEVw39JxkOLWFoZXasU3QN+d/AzOMLlbg/C1mDR/hPgGhCVbv4IE99ug3unbrL4KkRPStQaTgEI/R8nW+f+azImw+w2yEGDQR0tQAUBI+JHK2Y/iCy+U5V/V9NTgTr8dbWBblkYfpnxCZiQCMyKHECwCDzvotaJrJJipIkoWAOCMhqNrM2KJK1juyIOWLnvVcglQFKOiwlAcUkZFKO9bWSHcIjbORKmow4Mhe/+f66rBYEpRVUc1nxtioHk1NFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6476.namprd11.prod.outlook.com (2603:10b6:510:1f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 17:04:34 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:04:34 +0000
Date: Mon, 5 Jun 2023 10:04:31 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZH4VnzI76yMAt7Ba@nvishwa1-DESK>
References: <20230602180702.17380-1-niranjana.vishwanathapura@intel.com>
 <0541475d-1f16-3d17-8e2b-24885c5f4035@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0541475d-1f16-3d17-8e2b-24885c5f4035@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:332::28) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9cd7a5-0c4b-4b3d-98cf-08db65e6ef83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5JUj4bfFMy5UQXSnwmJ7rcyDixPeseKr5CQK1PJJYEOU39Lej/Ufn9sBzRA2BfwBBcV1S2O0F8ChHrO00C2kgeNrh5Plqb0tkCkeAHDxmX20T/WYDffo81Gh04+juOzyZBX9UPneUNSh2yEtIpIRIldzknBc3SMEr6r/0bSRqw+2nZnAyVp1t0mkCOIoGoGLCrSD+PRNgzHrswku3ajnqi+hYl32XkyRfCpkh9I1BJZhWmq1Ec51j9aF4so188H8q1A1NvLGhmCBxwHLPn7ym6RhsZE+g4rxwRXUXrKRCIPyTnXJRm/ZZF4AbCcpli7bcpFeT8O92ErKr7QhFaTvYEtF0iBWzADBtjsF6ePhsZVGI0sb41lQ/vR5S3Ql6CvcCNIkHRNKpZpLdGPXfJW2DzPHCC7oy0VvYsQIpQHSbhdF9Zx1lbXs1vWncnlVvlt1gLZxF/nXGsycfMMkwyzux2m3XiyzakExHdxhXyVVnZSsuyZMGzdmYRSSnVqhl8Cx9g2fTK1+mglViMvhgnkUquItbTD7Ig5JqAOV7i9a+jnlwcEb49oevApbvCkk1Rr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(8676002)(66556008)(6916009)(4326008)(66476007)(8936002)(66946007)(5660300002)(316002)(41300700001)(44832011)(2906002)(478600001)(38100700002)(82960400001)(33716001)(9686003)(6512007)(6506007)(26005)(86362001)(186003)(6486002)(66574015)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qE53tRMmR3rOKErc0AAMhpFETEK9U6v3KUwZsPr8LvNXGVMie6FR5u7Kto?=
 =?iso-8859-1?Q?FD8FL8jmmy2DiCa06+fauwweTTgtjJ/EJlX0Z1+zun6yyUncQRNhhuHnwc?=
 =?iso-8859-1?Q?3HCcaHnui02fdjG1LJ0uh76jCA1XFmtCK+m9En3CEGcra7ZRLcKB0CInVd?=
 =?iso-8859-1?Q?ywy4BQR3NzhXUEdlb8OROMVb/FF82LqpyRttgWB2i6Y/ABt9cWw628xQIC?=
 =?iso-8859-1?Q?fH3OHG1UNIxJ3npTn8rwg2y2uQ6EDcXdsEBumb/FySfNDZryWuhY8/p4sR?=
 =?iso-8859-1?Q?qrmEsD+1AMw43UCW4Fdj3LSazOEempleHPuiBlbedePLSsaZ5tcQVUL26R?=
 =?iso-8859-1?Q?bAJ6IVa42kKZ0btUC94VxPYd+YnCJgB6l2ddh6yaJfzxPlbCZzpOL1ezrD?=
 =?iso-8859-1?Q?vZUr1h8MCrXMD2+i9yTKyIqJZbK67AQjuuP1GcabedX2M32YKtAVqZzIuv?=
 =?iso-8859-1?Q?tugOaaGcKumacsCBTzMcCR5hoFeU9tk7BNihh7AIJ7Fg+fWiO38NJq6xyI?=
 =?iso-8859-1?Q?tnIzvj8btaCTruoKuAEQB8UWCi9k7rimS0A6noISj2aJbDujRH56ru9DNS?=
 =?iso-8859-1?Q?8L5RjRyvcISbMKAeDmcXUyRlqElUEeIxSS/Xw3IXIM1p+x9DZCx9s93b80?=
 =?iso-8859-1?Q?FwkpIYcql7L0H7miXzBnhNVYho7kFRsDPdhWsk7tM/5+mX/ZnxvSQY9rlV?=
 =?iso-8859-1?Q?1j3hyOCEsB6tcu48pZWf3Uo2LUpTawBxjGG3B/NBaN78EWlWSTytOTXePp?=
 =?iso-8859-1?Q?SRD/2rBpK2PyPUBzBSOVZmnXLQFVlPDlABPRB+YX9dCfbh3Dow7bmH4rjY?=
 =?iso-8859-1?Q?8HgfU/hUCuJ28xymE2uvUwfILCZUqPaMrzc9BBVSMqTkexR/wwOvyHcj9c?=
 =?iso-8859-1?Q?MZ6MBOhBz/ECAQ6q/INWDxlmcx4DZ4jLYpPKatavf16CMgqAt6+Xl9cO/n?=
 =?iso-8859-1?Q?0PpAh9ibt3pyPZBLLUXK9ybjHh8mdMYF+DQ4sk5fLlxXE7SYMoCUODKlrQ?=
 =?iso-8859-1?Q?MEacEUbN+/0hWwRDsZAl9xt4Pn8n3IqTyO5m6kz3/FuDqOoSiZ2oVG7qBQ?=
 =?iso-8859-1?Q?rFoqt6aUVrzkDKFWO6fw5j5LCl+csDaqLM0HKta/S2HFl9sHUlepfbAcTu?=
 =?iso-8859-1?Q?6UDwUZO/2JL5vThHJMph1wN7OrMLrsVA3C8Kupole5gJ6L3KxpuMGKZaEs?=
 =?iso-8859-1?Q?NYWamvV1Bknt/tnaVwIYOUOYGMi5PFaTw8DmzEEuwIB3TnixIUznu5GXRg?=
 =?iso-8859-1?Q?gvEexvdD5fkWyWny5gbbtDlPeYu1Z2eetTvNp71KaSK4drAvP5B1SLtOg7?=
 =?iso-8859-1?Q?RM1fNh25w5crJMmibuIu7I7dUUojfzB3J2Xs7DBU4KGnzQw8dwWHoCQUeD?=
 =?iso-8859-1?Q?rPe7Dfg+o3W8znrJqM/Sc82D4SL1+2YpicuZvcM+FwvUhw6qfWDmKb4ZUB?=
 =?iso-8859-1?Q?95SnKzWn7NAULR1nE7OWvOEw1VgTJcsjid1UifMjn8cptGZM9ekwRxgyrm?=
 =?iso-8859-1?Q?ltvDXlUU+w62TuLylGA5XCtH2D/RnjDZ/IPbP16DI7HQmNOAcmzYs+4gJg?=
 =?iso-8859-1?Q?mS2s+uI4pSt5hpPv6m1hp5WY49Hvo2u3eiU1P43SlkqjPIsocqpxx2UlU3?=
 =?iso-8859-1?Q?HCgWX4y/wLBIQP3cY/B4tvDRl4P9cIBBRTDSkGrRZ95WIQDxkZSxY4dz4u?=
 =?iso-8859-1?Q?qsAZnC2typpc3vWruTU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9cd7a5-0c4b-4b3d-98cf-08db65e6ef83
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:04:33.9949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cfTUh9zeVeecvSpp+IeTAFZRrDVPR/zKps6RiP3C1ZRz1Et3asoY/dUkRjzp1ux8SWoD0tITYWiT5QGU6VSgbMIdR6NGXc7EFJIkBieUflJgM0CQ9G0360vtEthBqVK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6476
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
>Hi, Niranjana,
>
>On 6/2/23 20:07, Niranjana Vishwanathapura wrote:
>>Allow compute contexts to submit the maximal amount of work without
>>blocking userspace.
>>
>>The original size for user LRC ring's (SZ_16K) was chosen to minimise
>>memory consumption, without being so small as to frequently stall in the
>>middle of workloads. With the main consumers being GL / media pipelines
>>of 2 or 3 batches per frame, we want to support ~10 requests in flight
>>to allow for the application to control throttling without stalling
>>within a frame.
>>
>>Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
>>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>With the DRM scheduler, jobs are written to the ring from a drm 
>scheduler notifier when all dependencies are satisfied and there is 
>ring space available, and I believe that's the case even after Matthew 
>Brost's changes to xe / drm-scheduler on how compute jobs are handled.
>
>So this patch shouldn't be needed for xe.
>

Ok, got it, thanks.

Niranjana

>/Thomas
>
>>---
>>  drivers/gpu/drm/xe/xe_engine.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>>index b3036c4a8ec3..47c9f119fb29 100644
>>--- a/drivers/gpu/drm/xe/xe_engine.c
>>+++ b/drivers/gpu/drm/xe/xe_engine.c
>>@@ -29,6 +29,7 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>>  {
>>  	struct xe_engine *e;
>>  	struct xe_gt *gt = hwe->gt;
>>+	u32 ring_size;
>>  	int err;
>>  	int i;
>>@@ -65,8 +66,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>>  		e->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
>>  	}
>>+	ring_size = (e->class == XE_ENGINE_CLASS_COMPUTE) ? SZ_512K : SZ_16K;
>>  	for (i = 0; i < width; ++i) {
>>-		err = xe_lrc_init(e->lrc + i, hwe, e, vm, SZ_16K);
>>+		err = xe_lrc_init(e->lrc + i, hwe, e, vm, ring_size);
>>  		if (err)
>>  			goto err_lrc;
>>  	}
