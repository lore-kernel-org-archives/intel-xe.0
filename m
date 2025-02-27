Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0336C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 23:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790AF10EBB9;
	Thu, 27 Feb 2025 23:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C81eUo+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262EF10EBB9
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 23:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740700075; x=1772236075;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LOu4SVag2JbRiBEhgVehckmlmR+TJ5i3RpbFgznlOWY=;
 b=C81eUo+EPQzsBOwjTzPblzfn95FuWWdWJqPik4vZEVHnKEL2p2fAXhZZ
 mTH7685BkBGVPcP4kKOgCTKOk9lsZWAqVaJmQv7CW/XIF7pwRjEg4d9/+
 NVzk03ghg59trIFZdehwyOHIwpMrEMdoqyfb5na7vGcoSqCZBuLpVIRuh
 t3QDZjoXaFa1LScfhv/lzmm5B0/WuWDuU+Oq3dBA20Um8VeJcXCOMpx6M
 Q9nE22MY685hOPc9LX8pv91DPcLbN/F0/167NE3brC/eyMLM4TS/irXPN
 lfRlc3j6Uqw3E6ndn78/FeRsNpZRGWL571n0gCBNUqRYitdEwgoS6P6AK w==;
X-CSE-ConnectionGUID: 70CisavmS6ma5tjL3yeXEw==
X-CSE-MsgGUID: O9ixfzMMQt+R//r78lJIYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40860597"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="40860597"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:47:55 -0800
X-CSE-ConnectionGUID: nKAaZ+LSTNGxtjmtawx7Uw==
X-CSE-MsgGUID: YEr6RwDgTkaD45xQOCJvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121298098"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:47:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 15:47:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 15:47:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 15:47:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mev+90mwHnaFkU903uIL5wQeqtaiBqENs5Zg9qfvInDhVgcAKj6ycaWAopNsE2evrDr7ZNv3e3BywCM6KowkP5ZTeDxSnhYpmbTAk/L+KtSHUilQdvYZQqM2xYrTb+1oR1GCpY1l9ejRVHbEt5J2PfeQACYW7873OVKZU5UilUUl+zOCogjoQBEawOjrlCCtHYjIDXWlHocqSTXIHRJTmvrs/8vLw5YLHxE938g6inXWUDZtGtqNAMBoEmeCo9p0EV0eUO7u6+WAc8t6ywYKfapcVPL6yxRjdG1vPJkKlaukJkWLNtAnUk/rwKFNbst+BPHAPOkUjeuPo0qzyxlt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBKaU7EFYTM8CKS18Gw7gyWafkiRFHxX3Wz068zyK5U=;
 b=mXw9Yv8PDN0sDABbl2TYJLSL3N220NMkL6VLw3jI/nL3IZjMcEdKBazF76NkLL9YuUu1gQFIy0cIOFnVW0+d89aBrN787DC/eXSmEdy7r2imtLYpWrvm9TP/XO90NgqTw2eZQsxTWXXVMMPAEvWxEVW+BW7TXjndEW0cQV+xaapPnYz2gAWGyiA9eKPSKeu6UqPIz6NGPyEaEpRYUybUROhVLvV95sM/c/DboLt8r43oyAxt1fuRy440UIIt2zYRqnVkDx45eON1Qt+fLOSJOJpFc0ugj9Ib2y8H9RHwWG1PuR961zBD4/0cO6JNmfwAyYxYtOqIfZkaAgfzpabCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 23:47:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 23:47:37 +0000
Date: Thu, 27 Feb 2025 15:47:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 03/12] drm/xe: Pass flags directly to emit_flush_imm_ggtt
Message-ID: <20250227234735.GM5109@mdroper-desk1.amr.corp.intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221101736.78986-4-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6b76ec-0acf-4ea7-4820-08dd57891d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nLr581fUORDiKXwtl20jOa4vJOCkIckcTaFlF1g45H13vHOnmvum7ziV/l6z?=
 =?us-ascii?Q?dZOmdBKzQepDDPCMMJd0CNaL1+XN8EFO9Tfvq78rIcqxc9NXlczNyvlAaEyA?=
 =?us-ascii?Q?expRYurwJcv9J7FkAz7FLHi4AV/aTQxYJT0WVsE8Z2OUfwP8EsIJnmQOvLP8?=
 =?us-ascii?Q?KCIRL9GcT7MkSzpTai61D3yYF2bCBTlgTIOcmr5lgMmL30AwhYCnOiyKfNfu?=
 =?us-ascii?Q?TZJuw0Pi/RSZivT69NUdtv6LCMRQZeU978alu4HlzOFquJAlIGvItLEOs/UJ?=
 =?us-ascii?Q?Rsxgod+dZFBjCAkegy6TWBt/nXnXCf6tdxWHS0EiCEgluCrSax7h60SpfMf7?=
 =?us-ascii?Q?mkIQYAd2COwvtMrTvt89kw/4eqN3XOgCiXnG4+vFyiMpbBcGG/uqUtVK7RLj?=
 =?us-ascii?Q?PUsDwuR578E4PCR/sn/eyseOoPDqSzPXWNKqM8rowpwIha8RXd/rjtjZe6Cr?=
 =?us-ascii?Q?K5T9IoOp9BBgX3GGX5HPf9C6vZbLnl7vHLh7Q8oHUjPIk1Z8LR8VHsMkFuwk?=
 =?us-ascii?Q?AFk6BTmfMLVNEctzKVMiuuK0l4skob4KVNdD/vxegG+MSZZRyriyx9BGqlag?=
 =?us-ascii?Q?t0b0krBQN6PqvRm5Cv1TahkslxSFDq+RL5NyPFUKaqukFo3porpbedXQIhjQ?=
 =?us-ascii?Q?yQWjyf8fvai5Oe27cdc32sXMpajvOgw3ZzeU2EZbfibXBD0acArttHwVBzzJ?=
 =?us-ascii?Q?f0jman+Qtn0pNOdLsQqWyJn3iAGK3ufESc33A/SkB5mjUc0TPpjL1ZgytyE9?=
 =?us-ascii?Q?Qj5Tqye+l1T3eerSmXXGtQ5iBJC4j9N3ZScmCkxiKGXfO1/NxERoy4tdWmsy?=
 =?us-ascii?Q?2Y5f7SblfFRKoAwMpk08S8ZWVqD5PxE6frqQwVXdWAF4ot46UHhija3qX0+l?=
 =?us-ascii?Q?zkii6+g7jZE5mooqQsVjRV1u6C2WDBXS5aQOPpy/IBx33Nik8221XssfnEMP?=
 =?us-ascii?Q?3bfMBuZmxuBVDFs0Q5gu9d605m5r2jsSZNMzUpjAiQ2uPAkZ+sdOBAdksg0h?=
 =?us-ascii?Q?q+5YejSUt5Vw2UGL3v4kdCyH40j5DI2eHJN7Fk3NS4VMPuuyVE4IyBSGOaFW?=
 =?us-ascii?Q?Xc/1FG9/+javQIg9sgEWmXfZVTw4cSdVtVTLaZEAOKwkBLmyyjymI1EZk+/g?=
 =?us-ascii?Q?3b2MoCEKCuTgxZ8f9ke46Vx6zP1BJhpJZN7OxAwHNylihazYG9cTq36EOzTV?=
 =?us-ascii?Q?sVf+LfPkcwJGgjD+apcsr0fTO2ZOFPPJefjkzp6/qFav3h3u3LjvX5N1P0/q?=
 =?us-ascii?Q?MrjPOk33USphhZfjnvEpSupFXI3baPIA728XqbgfPN+XCLXNAx3FFZp1AEqN?=
 =?us-ascii?Q?sjFaUEFrZN/aiqgwtpXDjXUnBTNKfYDA7uxSL5JMZ9xIKcRrRYC6QcD6Jq+G?=
 =?us-ascii?Q?1/hx4uaIDWBxNL56FZ3ae4Rs6xF7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y/L02ohU2IpG94ITYKiC6XZdPwnqMLqEmaXNWTXC+WvyiftBR4Yc/BXQrR1K?=
 =?us-ascii?Q?Cq03BWBQgFH3NHe4iG8lgtsZxUbX7HqYR7TCag641iVkGp/3jtkcx5JrkCrl?=
 =?us-ascii?Q?CPDQG9AhMln7TTqNfHyJY4z7EqdCdoXrJvDHHp2Z5bZZYtv/erlA3HhHjxLV?=
 =?us-ascii?Q?8rCQ33/kyhb+MTEO26O4AnKdq7pYxpJCADaPirhgc3qZr0OaBxmPivn6BG+P?=
 =?us-ascii?Q?vlHo6lRjojbkEG1wSaiLZdUisDZP4jChdUQhiikw12ehzg7cBD1d+1ZEDnBW?=
 =?us-ascii?Q?6oKSow3SCOOm/4AsWwc23V4gL0VON29RkqvYkjHogQDEjn5ADSMcgU3ijgKJ?=
 =?us-ascii?Q?pmlRWsq2fv7jXd/c+lJy9npEV1VprBWj5YiQ2tpillQxP7azAgOVdI/ScLf8?=
 =?us-ascii?Q?DyscasriQ7QMcb8OTymulFQVQgia0FE9XYMnjWb0aFVSEUZk7OHkC9cT891m?=
 =?us-ascii?Q?RUoW90d+m3A9YSnPybhEXjZZ7yIkhK1FODUk6GQ5f+MqTi8FeVR6hlMx3Ay4?=
 =?us-ascii?Q?v8mxQYfLPaqiQ9Q2sQp8nRMDU029aIZ2mTOl+b502Hx20fW9mDW5s+2PulEU?=
 =?us-ascii?Q?cyCtyqaNzySTwOe4Ii3Tht9mJm79SHcx8DQHxmE6xxZfnR4k+WYn4l3ikXPO?=
 =?us-ascii?Q?hlr6C2vz22xyxszvARGfwF9x+1Po+xEeVW72nz2XhHh50EmyQfFIrq+x9ywB?=
 =?us-ascii?Q?wxFOYZnRQPOq/PJQkeabsqlHkagw8gCWkQlXhzKqEg1UblvlLN+CPz5TKQYH?=
 =?us-ascii?Q?V6mC6cm1pHZthWxpgnR50W8FCtXRyA4e5eVCNCuXRUXFzjmjnBKjq/ppm7R+?=
 =?us-ascii?Q?UMLKUNxmFvNCoZVpEL2XRFFDYJT1gzvzZJCKJlhmnsvoPyYM4xZJVkJosnmj?=
 =?us-ascii?Q?PF0r9Ne1RPcB5V8c5F2QW6eV1PWuyG+iLMJPvMnfZXHFXI83C71IBEwLDxWq?=
 =?us-ascii?Q?W5KK9Wmn+PmVxmFh3PYXl94revMf2kCQJ6JQLyQLJCQp0X3oRNUOItBxVwCY?=
 =?us-ascii?Q?1P7G06QdD+FEZTCtfPmST9vWB1zCK0PpPlBWvtQUWTQzfJmgPe/V1OJ2XDJ3?=
 =?us-ascii?Q?ZcVWGisbIZ9YnQ+FygImxN0pTdnz9oXhhDse1M8Clz6JlvVJgwubWuvqqewx?=
 =?us-ascii?Q?7F2PIIeWyLrjWqTnZFZTMw+8xPrbxEgfI2MddHIKdG3gb4ZT+ZB3VkFLw+C+?=
 =?us-ascii?Q?XLpdC6XgVUGLSGQMaIWfeSDnHoMPu2mywy3CLzLhmoLV1o7fa4QrhLqms3ku?=
 =?us-ascii?Q?XgciFuzTes/XUIPyrM+wwBF/eSOK2RhbvuopIhNNxD/xki/K89VefGftCM7x?=
 =?us-ascii?Q?g8iYt5IQobGoj59isp7F3wX7oAuFLN/Xs1PjNEwxOQam3mCxkhfErdmdv3pw?=
 =?us-ascii?Q?aO86PSV1J7gOExOW+98HyJMJr2mJxfN5Fe9tVgjBa361Tf39HWUWV6yZCFkX?=
 =?us-ascii?Q?ERxIwESkUkf0KXmXdayqByqpEZlrhSSO/jWeucM4LFXaqTH+SRNSkHeoah7d?=
 =?us-ascii?Q?ypVKCTOKNv6KbsGIRkl2G2JdyoIAuNdjq3i1DK9wTHdyzpiyVUMlbWPKA7cg?=
 =?us-ascii?Q?N12ULDovWeMQl8rgLuuWGYXyqH7vTI23EGEX5QO9s3rnv5Fi5bHaX+67fJi9?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6b76ec-0acf-4ea7-4820-08dd57891d9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 23:47:37.7557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFlqR6HRPT/DUveR9k3manB0m0qmaU5y/3TNebXQMnqtAVKt3uOSIplwnZ9bm2t4GzjsI2BmM9LFtRE6SSMQmRZpokRdpdA6cAiPKp+Am6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
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

On Fri, Feb 21, 2025 at 10:17:22AM +0000, Tvrtko Ursulin wrote:
> This is more readable than the nameless booleans and will also come handy
> later.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a2d1fb8f0adf..21520ff97599 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -90,11 +90,10 @@ static int emit_flush_dw(u32 *dw, int i)
>  	return i;
>  }
>  
> -static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
> -			       u32 *dw, int i)
> +static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 flags, u32 *dw, int i)
>  {
>  	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
> -		(invalidate_tlb ? MI_INVALIDATE_TLB : 0);
> +		  flags;
>  	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
>  	dw[i++] = 0;
>  	dw[i++] = value;
> @@ -250,7 +249,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>  	if (job->ring_ops_flush_tlb) {
>  		dw[i++] = preparser_disable(true);
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno, true, dw, i);
> +					seqno, MI_INVALIDATE_TLB, dw, i);
>  		dw[i++] = preparser_disable(false);
>  	} else {
>  		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> @@ -266,7 +265,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>  						dw, i);
>  	}
>  
> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
>  
>  	i = emit_user_interrupt(dw, i);
>  
> @@ -312,7 +311,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  
>  	if (job->ring_ops_flush_tlb)
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno, true, dw, i);
> +					seqno, MI_INVALIDATE_TLB, dw, i);
>  
>  	dw[i++] = preparser_disable(false);
>  
> @@ -329,7 +328,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  						dw, i);
>  	}
>  
> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
