Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA53C54F52
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 20:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809D810E2D9;
	Tue, 28 Jul 2026 20:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSLmgJsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6065110E2D9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785270053; x=1816806053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cvSfrw92jlqSm6UFQsF17G4cTFQU33dETnftlLaOO/A=;
 b=JSLmgJsAtLctBDZs8/n4/nk0qofbXm8cSoJnN/kiWX7yEVsLA+igOssS
 kIEfyymolGBElABrnWwh+q4IJlg79KH9HEaSft58JzMp5/S8dsEh19epv
 2LXf8YD0ZRepEgKqnxzc7JN8tSK2wo729yI4NncX+FWhrxdexE4OgXOzX
 Cm2B9YiAV6XPfDrncw8u40iaxPFTG7XXwZ+dwMsIMPblOpXcIZr0XLuIh
 cFsvJ+xiP6e+Aglj5F6eJyrN6+4x3XIM9yaVSujpAQGTQOk6zj77N2z4d
 miwJwh3D5R89vM6oIHgchZvVs1zZfzyLN8wBxn5+/RzST9e7TKenAA0gC g==;
X-CSE-ConnectionGUID: sQq2L09GSiSOBBvplMi0sA==
X-CSE-MsgGUID: cUP/kFyRQLa2dC+9GB2yhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97241424"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="97241424"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 13:20:53 -0700
X-CSE-ConnectionGUID: u60YMk58QaOmnk1jBI4Tfg==
X-CSE-MsgGUID: FgEvsucmS0+s0a8BaVo+ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="284340755"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 13:20:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 13:20:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 13:20:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 13:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDm7hJoFQqYetWhgm0uAbM7QzxygvrlB0REF2AV6s99Y2Dy0ZzD9/lgLde+wfny/JgYBuQsNSZIj6UXBJFDZTuJ8JJdX3G6Pslyc7kB/Cq1VcOivK52K93KM6KEjDvskUKqAnEhFnx6ke3w0wGLpZxwx0JVsGIv51wLjC+4oAlyMaG3xVgH99AKP9iytGAY0HEdZuXxmBsmDeUnqraMO1qHC6L23zU/vXYAMEcTJtKsljbMCOenjlLddETUGLQbVmExGEOnEEXASJbRRLdwsdexDe6dnDXpSH1v5BCK+JiA3UUanCTNvwmlS6OyxRarGsN8NCN+vMTYavATIiCC4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaOMi6N46A7AHmAuGSsk+zbot+JaqzLA/6ZEVlz9siQ=;
 b=HnAE1gexEYy6r9g4cwWB4JcWvzG21fEnghDJr1piXn4dBM0q28V3447pwJbJZwqP6LCWzzQmpEzUCVFWaOFaaD273Kvx4i+bnypnmI+WOIrRsi+NBFhAEVQLD8Os4FQ+nyHs5w121L+gIHPLihZnKnYZAAcsExXaOfgayqj58ztn8H/C1rCEET1tzoqBycRNdFYI0CWgzUd3MG7yJzn3jxWQXtF6JvBz+qpG0D8KMYClV3SgsTIONm2UUqkfT+WhKBzPmL5woh/dthLqcFQXEk4f77Yy9fLL+/JOAA9lxpLjTK1DeQijUa2isq7R0zujxjBzx4XlUTjmE0hK/LAnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8492.namprd11.prod.outlook.com (2603:10b6:806:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 28 Jul
 2026 20:20:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 20:20:48 +0000
Date: Tue, 28 Jul 2026 13:20:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/guc: skip CLEANUP message when device is
 hot-unplugged
Message-ID: <amkPHS9Oj4Eqmbc/@gsse-cloud1.jf.intel.com>
References: <20260728152452.1129581-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260728152452.1129581-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b75caa-fcb8-4dc2-9093-08deece5b5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: jqL/qOpgK/WtxmNZQB+3RC5PEBXpRmyrRpP5IDL0IANhTqsuFrAM8+wHTs5lt3KJtqAcKRE878ltJmWq/agBJJJ4bbFYM00K+0VTjuIyhRDUZHKcTKiBIiXbnlcjaVfw5v5O/5if7N/e3Gufg4tQIsvqSrztehzdSj+50DKgcFSYtPckUT7FrR/ER8yX7vQ6hJ7hlmcFyhN57EUQzu+v8YATMnZ2Gbcgv3GoYj1HecqM5rtb2aMG3r5Qwwt9XDxghQf72tRiUmyAHSppboVMKw2SWve1/84OCoLQXwvtSZSRSYuqeSNWpKgpYl9I7xeoMg+Z6fgaJ9Lx9KKEsdtoMy4/hq4fh7ge7peQ6FcyNDvHu+AKGoVdSZnuKIFOUvi/k+kzVlX+xfB37dWeti2fLjypdbYpDSBlmZfcNd2rBJbiEcaU9t3Ff8Ife14w/AEFrqgDLRaefWInnKI6C8r+X8XbjHSddDvW9Wym9d6i26UO75Cv96UqOptIxQTRpd/lsazJJBaj4gAv9apfjR0pw0QGAm/zZvJvoQy+PZIGjcgT/r2/ADYbrPCcGDxbSGhjoJ2du9HrBlVoK40S4HeCRrhwvibVIUhbc4mpaM71B08NRXro67FIFVsZw4rAPyxB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9YHmkp/PiJ5jgXHohNtlXTyRC3zpOTy6j60bW/qzQmFTmYue0cFd3Bsbkfdx?=
 =?us-ascii?Q?L2UiIR8wAxDT/Y5CXt9Sa+hkC9KBU/h/LMbpbH07OXyJnsX2saVa9VhsBTf+?=
 =?us-ascii?Q?eSz4NwHWnzO5NRsbkc+kS4GQo2HTrGx+rkanxoyr1D0BmKUEngQErVGKdRuT?=
 =?us-ascii?Q?Bfal3k1TqLRCLAQafNHjOQd2FiKoHo2vqrnAz96mqYwgnsfPy7UvE37IoJ0+?=
 =?us-ascii?Q?nMZ7EX04I9Gk1sbsb5j9uu+OJWeDsiylh8hWII4GegWFSFFFFLtdKhSg2VCo?=
 =?us-ascii?Q?3Jb/4gPBv8syVL7VColZ4ivAYhSni+ot3tWq9zs/xCGyAteIyPq8EtmkVeCB?=
 =?us-ascii?Q?tflcFeoKJYZKQb/rO9hSSY23S1BdST0a9xvTJuS6tSIz4JGRRY6whLUqdtn6?=
 =?us-ascii?Q?Yo77HNoqh6Vbdy6AhndpacJ39WFCpnr76rg5VaiRyZ1olYz5wPBb8NC6+Fk6?=
 =?us-ascii?Q?5a7CP+8kZ24jlCBg/CcfqCpGpO6lmRJnUhMaPa7H+rM+tFqUytDMRNqFolJU?=
 =?us-ascii?Q?WUF1var6PwIpB8HvEMe8HWzHxDN878V9gb90JUOUPD4XnBKG9IQZGSaZiASZ?=
 =?us-ascii?Q?hKaFYZoMOP+qsz88sotDHkWDxtO3w3Sqrby1/WhmySgTA+SMFImLDp7OT2RB?=
 =?us-ascii?Q?LlpDq2fuJ8+2FbPrIGqJC1S4DS5i71cn3Prcn5dscJqg0yYzIF9+QUGkhOLK?=
 =?us-ascii?Q?1MkDwC7OwEKdjM40MQjttIsgHzPRt4eyiuxxM3kcZhGA85pL5AzaF2aGeY32?=
 =?us-ascii?Q?a9mXMzCrudvyR4zIXeu7/Tgobn3lnoOEbBVjYS2QATDT83cu6+Wqp6GhGHUs?=
 =?us-ascii?Q?wXYxUNAasv2XxQ5CaBcnFkg88yJZ8azO1u8wGAwpz8NsOBC9zuvq1dGjfKAc?=
 =?us-ascii?Q?2Tj4RVWcRTYGcY6HwJ5Kx86vMXNos6/fD2quuN4cam78PuGvTQHldxrCREd8?=
 =?us-ascii?Q?DDa9Mh1Mlz5AXSkAYa7HqR5iVQ13mGJh2ffHrCaBAQWyKB4/luZq2h3Zwkpj?=
 =?us-ascii?Q?lwAVzSVxKo+pXUGxR8bAHzcsnwxXxoxA5gb7nNiK3XPOFU9mEd1ZVzHQafQg?=
 =?us-ascii?Q?NJOOkkc9zKLXMcxBvWOFkK8xnwBX3aSOQMdOGgyVYQ8S6qo0mbaZQ52ah6XM?=
 =?us-ascii?Q?nY47BvV2wcb65YG4eYEgCErcjaI2xJXteKqSEGnET+fTs0RfzrSxb11oGyDs?=
 =?us-ascii?Q?3BoUOuvc+930rvDfZa3w0pYlCse2vWoAfeTHQvLXB9n20cFlRSXX0T5S+FYx?=
 =?us-ascii?Q?F1ewD/wHYwpvD7DiYN+C3mKNRynsH3ePHb36GXv2C6gGxbSLf1fH2H+5sJF0?=
 =?us-ascii?Q?+0WaZHdU2s7Pzd/EUZ5FtOBm6Jly6oXQ8iY7SuIpsz148UUqJ0YQinm/lhda?=
 =?us-ascii?Q?7rfCv3plgRo/4tUO63KJSqf6ndX6o4KSItVmCy2TE3RYGF0F9IzU8M/zAy9g?=
 =?us-ascii?Q?HaMCg0p0/D3LdySiXuI0Qk0KR/AuWX+OwICDWqNiZ2tzwU8yCFWM7LiRLKJz?=
 =?us-ascii?Q?wnwCnw/QzGElTIQWs6gSeOYJamPwTNnXPp7u6MoBxtqrSj3vhc9ZLvD74UHe?=
 =?us-ascii?Q?ahk4aLVXyBsWba80rnrO9PL/X92XX1/UG+h2VnfNvfInkuRiwlmhijggVqV4?=
 =?us-ascii?Q?ktxxNSRs9WP7Zy6aHWUgR//MORTpc3GDKM9qja0NQAWLRKJvZ475YmqKHOmZ?=
 =?us-ascii?Q?/YRyD2dTad+idtZ55d2eaW9KeRZWh7qZdjDY1nYF3/H7pMUqTQOww80XliF5?=
 =?us-ascii?Q?BdOirvxD3A=3D=3D?=
X-Exchange-RoutingPolicyChecked: a4vLfWrwvRQ2YaMNZZ5b32icAbPgtbHYjh8H9BGgmsQof/uYQ41R2aq8Vgi2JBLJLEuXD1kB/GxyM4EGGg6Lu/RX6zjwxSsl57QlfXvW1V8rGRENNh9mpghbROt+eQblB6bti0PUamrHdu5i8EJdLQ8+2h0jI+gi9UXbAvh3uXATwsADNzOkEoL/gm7qgVu4DMXBp2KuE43iwWpIXvKIRDFjXJpFFjiESMIcki6JwTPF2+pq0qoAAT8K+tmg3HcN6GC8Lu00p64vRnowKDzws7H+Ir6YRPfHyb2Jd2f21X9+em2db3q3F29NgK9L57DKcDlY9iFcyeqi9Nv34mCSUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b75caa-fcb8-4dc2-9093-08deece5b5fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:20:48.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bnaa+HYNdqBxAoXHHqD3N+bzcJINOujJSOVdsLT9O8rYPysjzLeoCN3/es5SNSz4M5hFfF3u51SXkGauNq54g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8492
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

On Tue, Jul 28, 2026 at 08:54:53PM +0530, Nitin Gote wrote:
> When a device is hot-unplugged while a DRM fd with active exec queues is
> still open, the fd close path runs during process exit and calls
> guc_exec_queue_destroy(). This queues a CLEANUP message via
> guc_exec_queue_add_msg(), which internally calls
> xe_pm_runtime_get_noresume().
> 
> After hot-unplug, pm_runtime_disable() has already been called, so
> xe_pm_runtime_get_noresume() warns with "Missing outer runtime PM
> protection".
> 
> GuC communication is no longer valid after unplug, so skip the CLEANUP
> message and destroy the exec queue locally via __guc_exec_queue_destroy().
> 
> Observed with new IGT core_hotunplug subtests:
> 
>   igt@core_hotunplug@hotreplug-with-load
>   igt@core_hotunplug@hotunplug-rescan-with-load
> 
> Link: https://patchwork.freedesktop.org/series/166744/
> Cc: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 8aaed4fd13ea..b5035c19d7b0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2131,12 +2131,15 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>  #define STATIC_MSG_RESUME	2
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
> +	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>  
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
> +	/* If the device has been hot-unplugged the GuC is already gone. */
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q) &&
> +	    !drm_dev_is_unplugged(&guc_to_xe(guc)->drm))

Isn't there a TOCTOU here - immedaitely the value of
drm_dev_is_unplugged can change after the CLEANUP message is added? 

>  		guc_exec_queue_add_msg(q, msg, CLEANUP);
>  	else
> -		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
> +		__guc_exec_queue_destroy(guc, q);

I think after merging [1] we should also aim to get rid of this bypass
teardown path and always add a CLEANUP message and within message
processing either send the H2G to initiatate teardown of the queue or
kick the worker which tears down the queue (i.e., the async worker is
the only place where final queue down can occur).

Matt

[1] https://patchwork.freedesktop.org/patch/740542/?series=168424&rev=10

>  }
>  
>  static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> -- 
> 2.50.1
> 
