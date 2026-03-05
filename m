Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37528F47CD4
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 21:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EA510E2C6;
	Thu,  5 Mar 2026 21:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lS0oN2rE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B29C10E2C6
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 21:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772745816; x=1804281816;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NBWsfNNN8AerEi9XzqL71nOPzD8iPyPrhpNbxzZqvtU=;
 b=lS0oN2rErCicYiw27wwfxj0fs7iIHEiU3iYGGmeGjArdsISHvk68PNpi
 EW/J7GTwbuBSBqyhL4HdbbYhafNLLpcaFcm+JAw2n+6WxLaqW/Ae/l3jz
 QnFt7d3UNQdd4VUpEGHNByDVC4nYBlDy5OcRgH3WXKFwj9lj5Wbade4uQ
 OobG5ymV6hLqWZqwkNWaNrWMmcruYjxhL0eIhOwCjjATUBIM1Keyi8U9R
 xOE/U/0iv4V+B81IkRVIEfcg63+K4+1hxpwO5s3tNLcEDASMJyWtzlej4
 OVdK5Q8yjg9Z9MmJiAfAf4lA1TdsMSFs+SWeh1s+aTM0rm5MdNC+0IEGf w==;
X-CSE-ConnectionGUID: 9Bj6kAwwRsK5KWnlrw76TQ==
X-CSE-MsgGUID: 0EykIyvGSHC1CoehTtKk3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91423017"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="91423017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 13:23:34 -0800
X-CSE-ConnectionGUID: tGadM/m6TFKzhtLYnbhF7w==
X-CSE-MsgGUID: r73Dx3hPQmiiweO2+pZjlg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 13:23:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 13:23:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 13:23:33 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 13:23:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YixNPALxqpO7e5ElV+pnrZcM3y8c6T+YOcf91RosHRY6zSk7trMllWU3QHqutrOF9nLnXjvOJso7ZCKBXkORqvJvchyRMkaff+zUtHlis8vasrDb5Jp/pQaQ6xFeb40RPbPh1AILx1Qli82FAdYPbGST0SqcrOz6l4xuWhKcNKeRnMCVL3QyY2XAqyZAAYicbZUjde78S1Uq4/OyAv820kkaBC7NwMHQsC6VA6jOCetMI/5mvdrF6hBX4IIz3ocH54A95+rOw/jvPES4hum/yA58OZeOpRahxKzH9zsSqYRjrWRdXNjcwzcxDsqezakGToXTdr1J/m0RWrqL+Pi0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJIlpV1mVldjOV/JpQL3R3sALDj3amD3vNWwdRF0ZSc=;
 b=F3w2gC5r3LYcyRB4cFUwLYjUaH429CW1z5CBDamUdrW1ZboSa7G/+aAa/O5qPK/V0pbAWbUh58Wso8Y1YeDd9oriO1bc2tDb4OFLfSnxm3hdvudCSP8WNDlTx7IKQuEkKGKAoU90e+BiwXEP+NzTI3zjNSnvji+xRNIfK9f3oH5om5HrKoKg/767nKuZdQR/PYgTjdmMVVAmaV3NftSad2BrP6NXL9pl7vibToaaImtZVXOdjAu51T1f1xdmRP8mm9uuR+lxE1jY9R8dM4TcJzK5CYiiZNEOqqLn+YVIe1juj2JSN8uFotBw/Rm3l4zlgfZx+ffsBICbagFg8Zlovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 21:23:31 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 21:23:31 +0000
Date: Thu, 5 Mar 2026 13:23:28 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix exec queue unwind on hw engine group add
 failure
Message-ID: <aan0UAPxjnKT4gHY@nvishwa1-desk>
References: <20260303235219.1035961-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260303235219.1035961-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c4697c-924b-46b8-9c57-08de7afd732f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 0eFehMJcvaW89N4k401SQC9f0syZuwtl7Ouv9zU5QfeU5Wu2Wi9WMFL0lRKldi/ga7RWRRbmWldXqhg6FLnD01xqDS50Fs+XmSzzYqVKeRrpOBEvf/F1E1hw9ba02gxo256cSIGPPAr9i9R3+Bh1Tz06WpOzc98gRdd8GEFPkX9uFLMzWy+aL89uJOkRGpBRi6tOKvO9FOGOoh7/ovOOsHc3JZopQqG52wo2R81riTvXgnahWFp4wp2VhqnJPhW8VoUJZXkcuO7W31tmDWBqkAyQw69v39czL0rXyM//t/OpqxPEJdJFE8Yw2ADHOTTZlMwxk9ohNTOdkrWFVBoxwLhD6cQeroYPhWt4yjk4MSQcPv80ccYs3k3Qht499rucdTY1jSPpvfa5IAoQVGq5HCJiYphGoeook6iZibhi302u8QTZy9ot4E9DrtRpS29ootdg/jm3hAmt8HSIW9XS8zDyk+um3WGEzT93WRbi/HCmbaM3+vN2A9RjZTze7w0WlhPdd/M3mcP4ImLlyjdq6dLWZVWZPu10xP6Cm57ROVGl8pWWhxAYo5y6DKmuzA9WnMPFYlehYgUJZ7fz6rUK7fVEtCeVbBVRGkGOC+i0ai2Qf6b6IpI4IPmjQFQE6WrA4+sNjnZl3SdUaZS1RlFA5gNZsG7B92tk+mMb7qRkemexRmXfH0URzR8UeCJSOIJypqW/VzDtVY4z+EExehTG+OF9GCo4LdC3ZcK4RPF6vMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?onWtmwOKiAviswB7vpGAWZClxEiXKYFL3xH3hAuIIOH5KK3123gLdxCXU0sV?=
 =?us-ascii?Q?vhuMRIUznfBwTLeYBNUBxCx7DHExsOxlo+IcnmELJ5WUvfH0+rfRjx+kQKjs?=
 =?us-ascii?Q?gWwuMkfKkkZFs8CXqqpW3JpEuwiTFOFvtBJCU+Bg3HKAYXJDg/XwJkBrj4HP?=
 =?us-ascii?Q?rD3k/XH9EM0jiWhdI+C/7itkUSHiMLTaaOfnArQmxc3ntNlzopojKPuIa8JX?=
 =?us-ascii?Q?RK3IlfMSPmHnuZUm3YL2D0LMC5VQq6ioWOl7suia4ipe4q+nDQQ0QaUTdl08?=
 =?us-ascii?Q?T59bnc2ZK3ZaSlLuwT7ZWEaGf0gud+ROVaegdNoUBlHQ0DnvJUztYKcaO17N?=
 =?us-ascii?Q?cXwbYK47Fxzktpc7ARShkq2xRCtFAftla1PQseeSsGfgnU86bW3fdtPP4ra8?=
 =?us-ascii?Q?DXyD5cP4UT1AsIvbAAeweFKpi+NycUnqzrsBi5fbNh+KeLbJpWOW2U4N9krZ?=
 =?us-ascii?Q?vqR66hQbuPQPBlQgQLKSGZDt8qG3OVCa9I2or9BHpEXZE2ZrHa4+9prvo1y+?=
 =?us-ascii?Q?qyVs0DBO4+Mec5Zh44XECH6keIUjPoWIhG0WMxd2CDaUfceUdkhAYv3C0Wwo?=
 =?us-ascii?Q?3qG2WUlCwc4/9mhcJextAtICFdTVauo+4JeM8ZyWalyOE1FrFr3BwezYJNRo?=
 =?us-ascii?Q?G9/gYpMRLTzQHwErWr9bh1iNAbdcpoj1pZSQaeetgX8Fa219OucHoZIPBnsi?=
 =?us-ascii?Q?BShUlMGXrD6JwSMDwuMMrv4Ufcqo4LJLTuYIqD85jNt7W42tZBScZb6K7Dpk?=
 =?us-ascii?Q?wlap/acy8ShWRWO9yjl8IKoQbHRAJe88QwQ4nVU7u969eOb+trXVUBqJOWYu?=
 =?us-ascii?Q?GUwLsUr9bOcOOFTakPo/b2IwOqzFrb4+kkVw8sBIDBsK+3HuMZOKiCSO/iUX?=
 =?us-ascii?Q?szulO6GTxfUl7oTgYQ29obR/zDJ8kOVbAYD4Voby8N7kJbsNDfQuNFkxeOZm?=
 =?us-ascii?Q?ggb4h1uFFHIb3zCT7LHqx2jl27lsfx7mQW6e4i0C5LPfZh0nx2zm7jmjLVaw?=
 =?us-ascii?Q?hM8O9Dts/+yOZVAQ6Qx9F6LpgSkdmI/W7qWTe7jJyWnTlweWlByCe11fp+pP?=
 =?us-ascii?Q?Vt8HeSqLIWMNbgjVJAwceeiYY4M7g+J5rRbC/AmcsgW26o8RhoJbu6l7kCHN?=
 =?us-ascii?Q?f/SwoJq3T9m49s3wX/lB5lSFu4Qb5BXEoBM+sclzF3GOcEQGgFDJduyg8kF8?=
 =?us-ascii?Q?aGcgsEu124WDuNGe6rk42gHomscgHf2+iDI2ZYXK+ridSCxRBcwk16feHJ7p?=
 =?us-ascii?Q?1lm3CW8VQ2nuv5YLaJmgr7KjEc7Zlmqo2S4ThfaopDs8hc1dnlCyvjT3QPRB?=
 =?us-ascii?Q?RAa4za6NYnnOyYtSoBpj9fUqoHq71jJdP2hqZYCin6/1Mz+uYQLRJ/RNq9Rw?=
 =?us-ascii?Q?CEKS28sLxaJ7IDUPIzevnjrrdAmko71dEbPn7+nQO5HxYj/oDn/+P38Omp/5?=
 =?us-ascii?Q?spW03veK33ztCjnXuUVVnkYi4PqxqSSLdfTMZf8X4tGepSzWfjefsYveb/3M?=
 =?us-ascii?Q?4v2hpqsSz0Zh+fTb+6YysROHS2BOCq1Zr5qsSVolvcsbZALrTfCN7cSjrr9g?=
 =?us-ascii?Q?CkRR3JlpjHaGJk1ZD0oviVXmnWqYT2+p70wYIVcD8DAK4aXXklXB3mchUazG?=
 =?us-ascii?Q?TkXFsjFQPhyW5EuNZF8vxJzbrkbn32+B/vf3KPlHGJ3Sp57iuDHOAnroyBFI?=
 =?us-ascii?Q?1b9+z5D654rVurRk9dbL1JvBZirAcwyI3ufxVJEfP1T2CjGS2BqyUyAX4TWr?=
 =?us-ascii?Q?JqzmI9TVRyddbXY0+yYLKQ+DHUQlOpE0hAr2flKKk12cn+ETWu+G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c4697c-924b-46b8-9c57-08de7afd732f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 21:23:31.4523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjkT7K88gwsPjqED3McrvPnNhzfi0WkIs3D6fWbQXfkgWA7QD8CgZjU4fLLK71GP9yrmvCOEs4L+s9s313CVa/Haqc/0gGmg6Wy4nJXo5xNtXvVSxskPR2cpCfIhqA8N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
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

On Tue, Mar 03, 2026 at 11:52:20PM +0000, Shuicheng Lin wrote:
>When xe_hw_engine_group_add_exec_queue() fails in
>xe_exec_queue_create_ioctl(), to undo xe_exec_queue_group_add()
>and xe_vm_add_compute_exec_queue(), the code should unwind through
>kill_exec_queue rather than directly dropping the queue reference.
>
>Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi queue support")
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>
>---
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>
>v2: correct the jump label from delete_queue_group to kill_exec_queue (Matt)
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index bb273ca02d28..4dc59f448f2e 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -1297,7 +1297,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 		if (q->vm && q->hwe->hw_engine_group) {
> 			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> 			if (err)
>-				goto put_exec_queue;
>+				goto kill_exec_queue;
> 		}
> 	}

This looks good. But it makes me think if we should call
xe_hw_engine_group_del_exec_queue() if the xa_alloc() below fails.

Niranjana

>
>-- 
>2.50.1
>
