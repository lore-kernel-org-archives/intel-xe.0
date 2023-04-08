Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCA5C7619A
	for <intel-xe@archiver.kernel.org>; Sat,  8 Apr 2023 05:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46C10E0BC;
	Sat,  8 Apr 2023 05:18:54 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C467E10E0BC
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Apr 2023 05:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680931132; x=1712467132;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N029vi13Ba24lVe2OGphuQZpKEY22t+WNR3PyJtCQxs=;
 b=kPCWF7VOPz6963ooXigo7883QukBL+TT2hKrZ8CMX1YnSlvu7nFNkCf8
 pboR6PBRzBbujQqCnjvLlqljhQ3KK1dwgN8Bi21GGwJCEjDsMpUnO+zfc
 ZloEMtyRQTuZv0ZwhZlvYzb6kyRtS9WeN75PM3U6aQ7kIqKEAUzXRCeiZ
 0Faq7spbhgf+Z99IZkmChW8xmryCWDdupYghU+zFI7+jzdvbGmjXMAU3G
 DGGHhmBLGST66zDPlc9GR8zJlzxpJ3fR39pWR4LJcPQHG5Ynln4RSGxsg
 JOQCciNo+4STH665em9FCIwplZ6k52ZIAHYpLkBKSQ+rtOiaJKVYKbiCm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344894905"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="344894905"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 22:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="798900596"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="798900596"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2023 22:18:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 22:18:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 22:18:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 22:18:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 22:18:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8viXR2DZgS8sZEN98QAv4IMQ/LkWHHCNj1ihMnLCE+MPx+J5tsalLQkw19QyhTVIJEGiKHPHMyzmLidGKOWo23Y8upBluecoSIwz848D2Zumw4WoA5n1btVaCAayId3lGdmxo/11jXsGTiMHPfQrhl2XHN+LuTDjPLFnB30YVnYM9MDFC+MDJivLkAzvqqe1blI6UKVwv0e01icGq7y20MV/liRvg3enZhyH6XV+Jhy24yZmVhH1jVJOT0ikiFXept1DvmfF5t2CnIcwJluzNEcQKVSNFhr36FZeVgGnmA1BveNVVGYDz9oF8SCyP6iIaJj4gklefL7d+HBADmS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CMLOs4n2+F75Ns8SQX5vwHawrbGTgZOijVjgwV7v0Q=;
 b=ZKYNd+p28s7ZRGW5ZovHBEJFvxGlZ+umvoiBrm42lsJVDaeQjFGlKWvchwRnK5JK9tkd6kwdHZ/C1PKg7mPvZP0tmBDikgNJo26D8SZX529/yhvtxMKCOZf++kAPt9U+0aLpcxUwdIDyfOqRar/POw03DRw83XeB0WUrey/XzCJ1meIBY+1hqf+gdrg+3gu3JVYWxcmu1d3QoOV4jr4DNvK7gWlHgVbywgppJ69oF/mYPNBFVXFn61iZvGiPoweDjwhF85V25zQbhpSR+BeTpvdNL++T7SBLa2L7k7s1NDJEVY7WZ8+btoynqrvpTAm56htUiLmRdVSvRML1Xa+k9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB5352.namprd11.prod.outlook.com (2603:10b6:208:311::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Sat, 8 Apr
 2023 05:18:48 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%6]) with mapi id 15.20.6277.031; Sat, 8 Apr 2023
 05:18:48 +0000
Date: Fri, 7 Apr 2023 22:18:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZDD5NDpFmieA04mC@nvishwa1-DESK>
References: <mailman.11033.1680902204.925.intel-xe@lists.freedesktop.org>
 <CY8PR11MB69405E2F7676808F46E8E20CC3969@CY8PR11MB6940.namprd11.prod.outlook.com>
 <CY8PR11MB6940AA5317F3420E9BF23167C3969@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CY8PR11MB6940AA5317F3420E9BF23167C3969@CY8PR11MB6940.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB5352:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ff9708-f95a-4b64-9f40-08db37f0bb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IbC+dPYNUX37chF63O7WZvXlKSJqT/wwMn0qQOEWxVWU+i4RkgXNP2SHW3TP1BcQqv/oAd36LFMyrElCZMRfGDyEh7gkjkj/FapMlV+nMR4dnL3KiHayaYCUyV06q+HZjj5qKkIXlYOfaRXMlQuJ/n6sDmmTgs9WyWUZhvVFl1P2cEVdEws8BeBf95pMifmIemd7hYy4GhcCLJ3b2Flk46mKwd8eQG8/lTNwhoWXoRrR/EDg14iIqJzXr5MgN6JvzxnaECRHenhTb6TKOpHCMrkvVlHcHtwq1osOHtS0pPlaGcH7IcdV8Io//Wb4Ym9oaxrwINFO6ga6yF8InNWGj8XY6YkA9Fe52HM6cKbLK13sQOg+oPC7phhbIFB0nG+Pw4Goz1hG003/dt5IoTZ+i53w5VylzKcJmoi06UoW1Fg3Qs0y+JETThjiBV2O87FktmUzbs+Vu6athu6Gv0CJdhrEGzWR4Gey1RRgamtMybKwt+mjy0t8SILlO9/9ZUl35/juea2TkdW3zgHNU/+cZsgKwWauEeBt4F2byiCHqzmbP0hjKdcTP3ucLj6ry9IE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(6486002)(66556008)(6636002)(4326008)(66946007)(478600001)(8676002)(66476007)(54906003)(41300700001)(316002)(86362001)(83380400001)(9686003)(6512007)(26005)(6506007)(107886003)(6666004)(8936002)(2906002)(5660300002)(44832011)(6862004)(33716001)(82960400001)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vr9Ae125YX/VZotYrF+Vs10bpSqAEeGXQ7BCejzeFTq/zhBuwUyw03e/6lcw?=
 =?us-ascii?Q?aBSlpAQO2uyJyCERrWNg6b8JTsP821I2gnLNu3skmm+exeKyjt9BzghxaC3G?=
 =?us-ascii?Q?8z/HTFjJi478g+7vgvCta6w/HuctuQwqITuULljHtDoXk+ifIY4yAkBItILa?=
 =?us-ascii?Q?FvVl+qogBNe40JBBda/FSuXSiGji7RTm6r/XARmSONBpNHYqG0NG5p/Qlq+K?=
 =?us-ascii?Q?r+/2wz6uUI5aeV9KNnJL5cS90F5Ky11RnBkQv8J0b++YnUcjIWzBmg+2BbuM?=
 =?us-ascii?Q?58DwpYVb3n5kkaQM5abEel0ZwUQULuZry/o+MD8PNnF7Ggi2qkfkOH4S6NK2?=
 =?us-ascii?Q?k0ojxBGHN8IAQY+fd5v+ruubQRmjwt/KkEYpJMbZLgW7JgDghkO0xjjS3lJ1?=
 =?us-ascii?Q?+dcWj0SE0TiB8r1HJTcO6Zr52Gx62anxYJxftPsje8VnrxAez8uOcuaKhzU1?=
 =?us-ascii?Q?KzynxD6XuEXCSc3jdIA07u3IrMMhM/GzHTkXYKUydbN7Va1YxwxpVtPOAwH+?=
 =?us-ascii?Q?IFZefw1D5ZygJLn5Kq5yKzj1qEUJyqU8Etrm6BoKXDviT/Hkg/b6EJ2UMgUH?=
 =?us-ascii?Q?sd4Yg4iWBrNz8YG7wQxSyaRBlABdvVfBfVPWY/idVv2BEI/n2ByPngvVBvZl?=
 =?us-ascii?Q?joI/Mm1dy2YcKyEYs7un6IVbZlStwnSAoUOYk5aAdoLHFTz3nPbQyO6ET169?=
 =?us-ascii?Q?y7Bvd3qACFy+ZqPd/mdUd5lUU2wbP+1QjIyy0QP7Z3nvyX851DplMTyVPJ9l?=
 =?us-ascii?Q?T2TuLnLmGYSM7J5r4EiXW5xesfbS7rw9uhTTgpP/6IxIcTeSwe4rw3xy20lx?=
 =?us-ascii?Q?SXmx09NV5GtsF68gPztZZzbTtERi4xr57SppcvTX3IwO0pfP0670njl5vVx3?=
 =?us-ascii?Q?+YpVRORspjbTOAQqIzCk3Bqpcwuy/nqojrGhbPfKwOFO3jgArU3Fjtqo9A5r?=
 =?us-ascii?Q?gMIeDohOM5Wv3xZKDqDTQq9/3p9N7WMc2mUozazeYvB+CY94er4JGM9Fqls4?=
 =?us-ascii?Q?uY47c1wYGypJdiqtUKsI9lVJ5Cbg08aNmpuirPkcUHdGnmdwx2LfZKZaHTDK?=
 =?us-ascii?Q?JIj0+zdHzoemwdbzJ8RDJyB+CsJEAOMri8tNsg9vpoyhvvwIwD8VgdTD33Ov?=
 =?us-ascii?Q?/3B6jP8aq7+EExdtPfsjvh9s0OOEoz1W9Xxw2vUJpUqtQDoUXW64OlHCBVfC?=
 =?us-ascii?Q?WSZLrMYk1TpfEq0LsoH1WxPI2bpYNnSM1vJSRDq47hjEnUzsT5kVDEstxHPP?=
 =?us-ascii?Q?4EQp8dXJBqEztF8sKIkPcZXeYeGopQg5vbFI03ljdCFw/opEydx5D+ZDOuOD?=
 =?us-ascii?Q?6aULmhQvpbKIfWpIqcKF4oigd3HXFDXFw11TiZZs4bysxvci5leWqpg45bcV?=
 =?us-ascii?Q?yXBGw6lSacAnxstwkWvr0ASFHksW0Q1JY9o9X4UnP4S3AAXJv/pUMUeO40/p?=
 =?us-ascii?Q?sb4JPf9koqQmIJtTLYQenPIIAjZ4KYoLbfi9h9rKp31uwGZzQTbVMAKYiOJr?=
 =?us-ascii?Q?qSvKzeZM6NtkbQcP54k0W1t6PpNzwHFNwbsiArbBTuDjpCieaJLBqlidr69G?=
 =?us-ascii?Q?AZsudNpUc+88n++4Gu7FUlwf47kzc8aEVD02zRv0eevyrtKxktycC2If8YmX?=
 =?us-ascii?Q?xY9uIaszRI4J/OQHm1Nv3w0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ff9708-f95a-4b64-9f40-08db37f0bb45
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2023 05:18:48.0372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9NJTLRxOadgyGcwtL7zzHRJUqhqS8tvw9RRxbQcHy9Y6Er9IygfnoktxoPsBQKXY+2QylgYauCllFAIu37XACVzk5B2XGIZAyR6EeVYbVRmuZ7tRiJ6+LihqbEbCTSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5352
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] drm/xe: Fix memory use after free
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 07, 2023 at 03:36:50PM -0700, Chang, Yu bruce wrote:
>
>So, the original issue is due to the race that the sender can see the
>g2h_fence.done get set and leave the stack before the wq wake_up call.
>
>Now the wq is global, but since there is a unique condition check, the change
>looks good to me.
>
>Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>
>

Thanks, applied.
Niranjana

>> Date: Fri,  7 Apr 2023 14:12:31 -0700
>> From: Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com>
>> To: intel-xe@lists.freedesktop.org
>> Cc: matthew.brost@intel.com,	matthew.d.roper@intel.com
>> Subject: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
>> Message-ID:
>> 	<20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
>>
>> The wait_event_timeout() on g2h_fence.wq which is declared on stack
>> can return before the wake_up() gets called, resulting in a stack out
>> of bound access when wake_up() accesses the g2h_fene.wq.
>>
>> Do not declare g2h_fence related wait_queue_head_t on stack.
>>
>> Fixes the below KASAN BUG and associated kernel crashes.
>>
>> BUG: KASAN: stack-out-of-bounds in do_raw_spin_lock+0x6f/0x1e0 Read
>of
>> size 4 at addr ffff88826252f4ac by task kworker/u128:5/467
>>
>> CPU: 25 PID: 467 Comm: kworker/u128:5 Tainted: G  U 6.3.0-rc4-xe #1
>> Workqueue: events_unbound g2h_worker_func [xe] Call Trace:
>>  <TASK>
>>  dump_stack_lvl+0x64/0xb0
>>  print_report+0xc2/0x600
>>  kasan_report+0x96/0xc0
>>  do_raw_spin_lock+0x6f/0x1e0
>>  _raw_spin_lock_irqsave+0x47/0x60
>>  __wake_up_common_lock+0xc0/0x150
>>  dequeue_one_g2h+0x20f/0x6a0 [xe]
>>  g2h_worker_func+0xa9/0x180 [xe]
>>  process_one_work+0x527/0x990
>>  worker_thread+0x2d1/0x640
>>  kthread+0x174/0x1b0
>>  ret_from_fork+0x29/0x50
>>  </TASK>
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c       | 7 +++----
>>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>> b/drivers/gpu/drm/xe/xe_guc_ct.c index 5e00b75d3ca2..9055ff133a7c
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -23,7 +23,6 @@
>>
>>  /* Used when a CT send wants to block and / or receive data */
>> struct g2h_fence {
>> -	wait_queue_head_t wq;
>>  	u32 *response_buffer;
>>  	u32 seqno;
>>  	u16 response_len;
>> @@ -142,6 +141,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>  	ct->fence_context = dma_fence_context_alloc(1);
>>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>>  	init_waitqueue_head(&ct->wq);
>> +	init_waitqueue_head(&ct->g2h_fence_wq);
>>
>>  	primelockdep(ct);
>>
>> @@ -484,7 +484,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct
>> *ct, const u32 *action,
>>  			void *ptr;
>>
>>  			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
>> -			init_waitqueue_head(&g2h_fence->wq);
>>  			ptr = xa_store(&ct->fence_lookup,
>>  				       g2h_fence->seqno,
>>  				       g2h_fence, GFP_ATOMIC);
>> @@ -709,7 +708,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct,
>> const u32 *action, u32 len,
>>  		return ret;
>>  	}
>>
>> -	ret = wait_event_timeout(g2h_fence.wq, g2h_fence.done, HZ);
>> +	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>  	if (!ret) {
>>  		drm_err(&xe->drm, "Timed out wait for G2H, fence %u,
>action %04x",
>>  			g2h_fence.seqno, action[0]);
>> @@ -801,7 +800,7 @@ static int parse_g2h_response(struct xe_guc_ct
>> *ct,
>> u32 *msg, u32 len)
>>  	g2h_fence->done = true;
>>  	smp_mb();
>>
>> -	wake_up(&g2h_fence->wq);
>> +	wake_up_all(&ct->g2h_fence_wq);
>>
>>  	return 0;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> index e0f9063e9b65..fd27dacf00c5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> @@ -74,6 +74,8 @@ struct xe_guc_ct {
>>  	struct xarray fence_lookup;
>>  	/** @wq: wait queue used for reliable CT sends and freeing G2H
>> credits */
>>  	wait_queue_head_t wq;
>> +	/** @g2h_fence_wq: wait queue used for G2H fencing */
>> +	wait_queue_head_t g2h_fence_wq;
>>  #ifdef XE_GUC_CT_SELFTEST
>>  	/** @suppress_irq_handler: force flow control to sender */
>>  	bool suppress_irq_handler;
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
