Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5BE606A327
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DT+hK4Mf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A9E10E134;
	Mon,  2 Nov 2026 21:26:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833F410E134;
 Mon,  2 Nov 2026 21:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793654811; x=1825190811;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z4YUCrVbW5jUoIjBPj+24L6PLbrtvQdp9cmsUWLXdFs=;
 b=DT+hK4Mfs58GRyMeC4mDTh+LfNTt9VigdW1hv5e+B4SV/uwAZKw2DLeW
 QA8cSvuHYTY6j80Ev7ST0IKs8cW0u/Rbz+4UpYVuKp3L4sNU1+maxJtI6
 hicqvljo9yVc0BdgmsFpirEU4YSUnSvyR5sIrUMyk8svfJ6ejzDvWFGCV
 WnWzIHqsx130NzoKy86s/JT39GEMDT3q9QLr/ce/OKcFOvOohbXAw4TZB
 AadQHDZLubB5lpC25soyNmoFr+2b1R5UVTk/NARoKuqQqLbb/YvXCxi8I
 +5e6mnjfkLAhxNB2PKMQ3Mb5A4sjnSDccEoU8/jO0nELjfVuuLfhb0HhU Q==;
X-CSE-ConnectionGUID: FSHYHhQkQiGPmfyoTBI0yQ==
X-CSE-MsgGUID: ICshftQzQrWf1Y2wdGwMSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2243250"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2243250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:26:51 -0800
X-CSE-ConnectionGUID: vGX5rKCxRLePcIA0JVcyAQ==
X-CSE-MsgGUID: P/vsv6xTQbqQhJ79aJ27ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6550882"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:26:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:26:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:26:49 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:26:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n06IE1ymVKDW60xSl2rQNS5/4QUx+yoKN9/vPKey5Xn51k8n3wc6ELJXfJA3VdHMQNc9oWn7tZ3JcymDBmhVghirRrTS48sAyKtxpXr+h5Ci6rHKtvN/WXLsS2dtwsT/a1W1qL1Y8QWqr26QxUXjrU1uAGM9yhVOeMr5GdUP81aIyyff3RUjEydWx9OrHJW5ZftoX78h8xpWQ5tGE8ebWY7+1yfa9WuNTJc0Ghi4wW/MaoMDOsXwGMf7X9w0Xm2GkF0D6ui5XQVJQsdKVC6hg5jttcn/JyH2xRHmrEmYwfIk7Pz+SPbut62f8YX1o6VVRW8YBlgpf6+dlE4TEGIyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5Z+f04KPcn7yHj0klKuIhOSGfWTBYTMLeCavM1TnmE=;
 b=Lmu7Y/jr6g/oiks/NgfpGiFmBr+bl4M6GsXaRcriOWbnSpJFncYzfgacWPHy38q27EHnoFoEnwb/3htytPOXEkt3X3vr23epJz6mQOTQKfKI+fCPSR9pyw71X3ZFuht4kTpwmlm4f9ZntNTUAZTnT41ptJ2YX4QdR060gVLEKUABbGewylCdWszXFrGTsQo0kZpRzEyLmtdaY6bCsBnCW9RhyQnZD5S7Yt91MIkhY2JVH7NkjeTfOpc44LiXIsLfyv0sFfRT2jQSGnQSBjCD/0wuheL3Sx8ab1yyM19SaMm6Ihht4cH+PKeXaPF0Q5GyWRFsWbaPN0OW7vUpKGjRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:26:46 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:26:46 +0000
Date: Mon, 2 Nov 2026 13:26:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <jani.saarinen@intel.com>
Subject: Re: [drm-intel/topic/core-for-CI] Revert "io_uring/sqpoll: don't
 attach to a thread that is canceling"
Message-ID: <20261102212644.GF6078@mdroper-desk1>
References: <20261102200603.2605130-2-umesh.nerlige.ramappa@intel.com>
 <aujvwWHLJnbJ7ddT@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aujvwWHLJnbJ7ddT@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BYAPR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:a03:114::17) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e7bd27-0b40-4957-dc18-08df3927ff8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|261102123227099003|56012099006|4143699003|11063799006|261009223027099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022113327099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: vQK/cUdUem7z+irgmXBPUqsO+uvs5u6Le54d2bKrSFu3nDNRCyDhsED2owzpedHp+/2XnQBdl51sKASscQo9HgP6czmOy9W534bbv9WI0wzSxI5PSgEHTOCz2VmdnEKLzhMtX4dPA8Ctft/I7d60C5KcRKcH0JP0gEMLBuUjc1i/Pj8f5MEORh5/NCZRaGAEfan1kLuREcqVX4+D2i+gZ1WgnId9Qa0URzXIk7zxSLsbPCf/uLPYn3ehPBdWdY2N5R/k9yzTMyD3iuLslOiJz3pPXOl/VYdfAlyaTpFStR8JdgSb3IQRVk7unYzar985Z6W+gNpXmLpTmzqLdcKJHwcAsktrM/x5ff4JmbDpvte8KkGmqHOoS7XiRpOYOnJqy9S8n/Adf//aPvvtYNIMMlC58+NLWaEvmDo5mBpsjHN7feDJtcvDrjzL5Nrr46bYoxRx2Ewf3CXCTjHZ146xFx1oOv5Rpra1+QriCb18X1wkxN6cBHsDxJDpt5j9KZdUWfSyhJDUCqExWkQsjQ2M0yuXZZogVn0SslfQgFqliT8mFF9SAOY2rQvzVpNzxt68uAjpkWdDjVqvsfatFWeAevO86zV/KoJDcudw5XuofT3PcG050ib0EMxiAlmoU6bE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(261102123227099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022113327099003)(261026121527099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MUgnGugGN+aXgvrUPWvoKHRAqqhGDOjSXwaXoVPKmQTJ8HS/JtkGT4VnUCGN?=
 =?us-ascii?Q?HGEnH0F1uws9NmY22WAKU+phrWJIbaDQJY19P3fnzT3BJ524Ek3ucpGKiM9M?=
 =?us-ascii?Q?7XUKVR96CTZ5RtOsQdDbVOo3bLOPkWRRx9IkHTWab4nver0VuSLm3a+r7OML?=
 =?us-ascii?Q?7p/Fm5hlzz8wKec2c3e7fqVtzgAykQDWyVMXuMgEQlOx3AUXUePumbb3HBfz?=
 =?us-ascii?Q?sRMUHHh0m9unuHs/C7h2qVOn9FJhvWGuFbm0TJ0IMtkEr3A6VSJrb/QOxWY2?=
 =?us-ascii?Q?GDEkxNJSvYM6Qa3MUUyEHB4YoHuEa1VQpYWqWJOxG7gWzWbrpvR5yJvhxpL/?=
 =?us-ascii?Q?ApZwhtiHPYAs+vAev8Gh+dEk40e1+IU11fV7VIPjJO7P4uBlQ7QztdIsaZU7?=
 =?us-ascii?Q?dIfhxav9Tnmt4PGGW9FgGU0FsqMbfWoaDq26xmVA0Nkwg45rkk/tkJoSeV/T?=
 =?us-ascii?Q?bICozGBLIq0SDOmrXNdCa0LKLTyHKlGTJb8ua0DKJs0u0BqipPPcwt3k9DO5?=
 =?us-ascii?Q?XZg1/jNeKp2Ic4zx8NkJQ/GW9ALU2vZFuVCPhN0jQ3rk79wLNCdruhBfNrqJ?=
 =?us-ascii?Q?GPha2Kx4BQEnoPybPooT11mTgNJyfAVLk5pRjSHly1xuVS5eF/onCCmMDFKB?=
 =?us-ascii?Q?ft1vh/JZnoDO+8kHwcB8ZF3D0YwgjlCnVA+vh8a2/938a3AumJ3B9SxZykxn?=
 =?us-ascii?Q?lSx1lUHlWJnmi/3UfHTIOcK6VFhCxLOlxHrHCbk7+Q00eYjv/KW/Puf35Ugu?=
 =?us-ascii?Q?lTC7hMpbEXhBFgSUfL0eVypsFmlbwp7SFHDFlOwKsG492WbYVW4DbBvkSOk1?=
 =?us-ascii?Q?PeF1mtn8YJ8+k3eNL68sdxi3X2tFVzmk1/Euq57aXEpyG8XqxtjdlAGjDYIS?=
 =?us-ascii?Q?7IQJ0X6IKIySCi35KOOEFULEykUyJDsSGpbG/4NxLfFHBs30u9pteIdahd1e?=
 =?us-ascii?Q?rxIrJWPjxx6cMZwJM2lNio9TL0jOdAItMRtHJ2ojeHXmgRlOQgHzJt8DcBjJ?=
 =?us-ascii?Q?JwHJO8zKpVKSngeyXtUEIj5DCXYV1VPiHU48/lXCIHKdroVq4wUkh4XZKCmK?=
 =?us-ascii?Q?zTfNJ0KDU3ZORYjbKpsl5IbaH8+svpxG9qAJ0j6PLGf0nKixRf84Cvq045+I?=
 =?us-ascii?Q?yt1Dng1ETo5ottDHTnfrbl3L2/Hr+1FH2Ik3Uc4U0HBAzXpzZ4VFTf+nhs2n?=
 =?us-ascii?Q?xjZfPz2H78wmIv/uzgOxIFmHIRaWtVQpHW/U9tMcY+5b+aiCqolU4sYZDUEJ?=
 =?us-ascii?Q?yKSEVsr8PVw13GdmhROQMb4DgyOGH6ChJLT3IPdDHYHjQ49ezkE4cZVmWB3t?=
 =?us-ascii?Q?DrQhTeDW/UjLU5ioF7K/i3k6hHlUqYnqBLsDOQGbb0aGZvU/ynQwCjhsTLH7?=
 =?us-ascii?Q?x8oxJiiOB6c3uRAMF0YJ6FXPB9r4PeGJFYeIgSUWVto0frjO0o5YwDxFU9Bx?=
 =?us-ascii?Q?aJLhNQWIamKoPwF5I8qWBdNmVAUfGk87J81UtHJXXQAiDnb/5GWIaqRLwOfv?=
 =?us-ascii?Q?y5OtOH4RXa1OgpmirmdacfqtmfjgfFnlit/nf76WxOiKaotZxhx6Vt2LBSDW?=
 =?us-ascii?Q?lXZPx3lLHJ193OrZEb0NjzbtoLEwyNxX8UYUbC7YrRKP2zJfN5AV5r6QPJgE?=
 =?us-ascii?Q?LPE3adpQK/4QYlkSDQkpFXED0Q29UUa/l0nWjRmO72HeGfoJatsqDXrUBhL2?=
 =?us-ascii?Q?EO7Gp8lDPx/2lIlPU2G2yKjZI3TO7kdLYHjbkWgJc2ih70UDfarB2vrJm+TR?=
 =?us-ascii?Q?rK+bqe0lQFi2JqihYmCcg88Wx7xbDV4=3D?=
X-Exchange-RoutingPolicyChecked: PpjXvyAu4Wj5ZnilaZCvRmCglx2btFP5MVGGGcc26llJOK4uwUqVAUJSV5xgKX1SMhPPSVmyHWzP6skFlfHSvWg5B3BjbJnQbFDgvLUFgy0bH0gJEJ6dKkYmPDEs/b5i9fAPF09ysgxUxGQFJU7EcMLv0R4r4f+oikj7SNQuZmOM1lt9GETqpJHQPjWtfla6Yyyr+7BGSgqJLzgBhS+IDdKZAtIWkyBUocUnAbrEJIg99EvUkWH2gRb/Vl1InoVce2gsyF8gp8Pp4RNIfJuEhFOhmca7xWLl6gMytt5tJyw2rl+J2UD7dMnaebkuJ/hptbpvoEk2YF4KmJeVP7/0lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e7bd27-0b40-4957-dc18-08df3927ff8d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:26:46.5074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNXtZBPdNObOTAAQsAB/yFif7HBdUNzu+PDgFM54+ktsQypk2h/vM8P2gLfLDqvZqqPt9sQ0jxodfMYMlv/R3EfauCx/KcMYbrWEAXW76RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:17:05PM -0800, Umesh Nerlige Ramappa wrote:
> On Mon, Nov 02, 2026 at 12:06:04PM -0800, Umesh Nerlige Ramappa wrote:
> > This reverts commit 22d9db9fd64a493525d692b32c556875b7254665.
> > 
> > This is resulting in igt@runner@aborted on Xe and i915 runs, so
> > reverting the patch. The actual fix is still in flight on the kernel ML:
> > 
> > [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit
> > 
> > Until that lands, revert this one.
> > 
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17747
> 
> Not sure I got the references right here. I ended up adding the i915 failure
> instance of the gitlab issue.
> 
> Instead should I create a gitlab item to track actual fix and then drop this
> commit?

Yeah, the issue you linked here is going to here will be "fixed" by the
revert you're providing and closed.  We need a separate ticket to track
the future work of removing this commit from the for-CI branch once a
proper fix exists in the baseline kernel.

BTW, if the actual fix on lkml that you mention is looking like it's in
good shape, applying a copy of that patch in topic/core-for-CI rather
than reverting the bad patch is another alternative.


Matt

> 
> Thanks,
> Umesh
> 
> > ---
> > io_uring/sqpoll.c | 11 +----------
> > 1 file changed, 1 insertion(+), 10 deletions(-)
> > 
> > diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
> > index c833e776320d..49c52284ecdd 100644
> > --- a/io_uring/sqpoll.c
> > +++ b/io_uring/sqpoll.c
> > @@ -433,12 +433,6 @@ static int io_sq_thread(void *data)
> > 	if (io_sq_tw_pending())
> > 		io_sq_tw(UINT_MAX);
> > 
> > -	/*
> > -	 * Cancelation drops sqd->lock while it waits, and a ring could attach
> > -	 * to a thread that is on its way out. A fatal signal doesn't set the
> > -	 * bit, so set it here for io_sq_offload_create() to see.
> > -	 */
> > -	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
> > 	io_uring_cancel_generic(true, sqd);
> > 	rcu_assign_pointer(sqd->thread, NULL);
> > 	put_task_struct(current);
> > @@ -508,10 +502,7 @@ __cold int io_sq_offload_create(struct io_ring_ctx *ctx,
> > 		list_add(&ctx->sqd_list, &sqd->ctx_list);
> > 		io_sqd_update_thread_idle(sqd);
> > 		/* don't attach to a dying SQPOLL thread, would be racy */
> > -		ret = 0;
> > -		if (attached && (!sqd->thread ||
> > -		    test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)))
> > -			ret = -ENXIO;
> > +		ret = (attached && !sqd->thread) ? -ENXIO : 0;
> > 		io_sq_thread_unpark(sqd);
> > 
> > 		if (ret < 0)
> > -- 
> > 2.55.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
