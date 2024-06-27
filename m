Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE221C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E9210EB2A;
	Thu, 27 Jun 2024 20:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmgqqQ5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E4110EB2A
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 20:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719521147; x=1751057147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7SdqPrkPNV+gwr/Px3stwItRhFPmnTGy2Usgkti3j94=;
 b=kmgqqQ5DQaDGY1eZBzAAHlYTaVTtWo7z05sxaKaY0SctXvqvL+3Q0a9U
 jIRsmNdWVAgndVAh9imJ6uXnHFYk4bmG1KS1DhUng70zNGfcM2mfvazSW
 UhT22/SVMkipbF5kWR1v/33FERfApRRz2PyV3XN1qvCaVx1JSUrWhhsXu
 2cyNNOJh26qDL6e6kRO+4eVUevvSDlJH4kTyJ97LgtgX6e4KsRiVBEbm+
 CazH4sFQdhm1gmL9WiV9mNJABhUdvWjBa3/pLxk0Ql/wYb0+TpuDB/w6P
 SQYYXhrEOvrrofDS0KoG3Vl7bJHKPlRIrMMgETUZme/bNGIQP5fBOdSxx Q==;
X-CSE-ConnectionGUID: fVDtHzIjSYevFTZAgSpDEQ==
X-CSE-MsgGUID: lb0uP58iQkatnQgBvMQXiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16362140"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="16362140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:45:43 -0700
X-CSE-ConnectionGUID: k7qk4NHQTTSNnclpg+loqA==
X-CSE-MsgGUID: NljWVvavTUGIxHs9lNDMRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44626619"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 13:45:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:45:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 13:45:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 13:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrMU5RmuH70DUGf66vm6yoDUrwPvTfdKqyX5itNoZ2uTD3d7s7tyIWZXVotiiJRMTq+5GoHV6IgI+Ddklxtbr6pY9iyvnoL8b5zYkTvU87itjM1egBVEaE1thKm1Fnyv1rQWDzMylUQQBAEJ/CtSh1Lcgad3xI6Gtv3XaUWJqx8o6aYRvoFSMJ86q9FUAX9E2XqBfBnBAygpzcVohq6qkmHCleMhdMQD2CIYR7G7Fw2CWFaVJ6fYuH4PH+Tuyt8IbuEhOAsYmOAWa2ME+DH6F4QrZCUSiFg4bmOaRcb/IsYykkLKm0moTe5yIKchoZc/suWk+H9NvtuTVcWXaV4KgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ApE3++WWBjsVxJegfKeVaL/LFsGU/lbSdICJlxBnSQ=;
 b=PhnNxXiNIkeO6bI+kgru8iEcEpZmnYzz9lHaAEw6TxDIc04gvks59fWDdBSGArXNlD774+9D+kyoOPw6nuREcBoza33i7k5u6+tUJRA/dJnQnHEZ9MOc+VnQEwB8XnwS3fKN8TMkDBkrnK2d/F2/WTaww74Od1uzsNPXZlNpByRHU3ECeR4ZZtN57JLMiN60/3YkgLs9gpu8kcE0rWvFX+P7Qvjvt/bKsGQwptbm4WAkW2KbygXwEciFRUFcmCXjrRG8tE/k0Nq+pJ8A2HvQDYAJghm3td6RMmY1B/tq5R7XowM9jOp6FrfB+1vj/YeFSOFgPGwd7WFKgL4Vl15RSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 20:45:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 20:45:39 +0000
Date: Thu, 27 Jun 2024 15:45:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Record utilization before destroying the
 exec queue
Message-ID: <njp45qravphq77h6epasmnixv43vnkilmnfudihq4fdcoyr5hz@wvdxxdqb63al>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
 <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
 <Znr9Mk8r1e2gvUja@DUT025-TGLU.fm.intel.com>
 <ZnsBLb8x/Ma+JIxl@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnsBLb8x/Ma+JIxl@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: 8235a0af-3c29-4be3-2f23-08dc96ea1ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T6y9lA/8J9+EYBkHklPbL6mxGuqHKRs3tdME7VyyLLtpEoB/keRr06/W9h32?=
 =?us-ascii?Q?75trpdc/ABUjusLJgGdHKtJZTMhqXX7KVsF9mWxXA6L7glxrW40lrJiAwYb1?=
 =?us-ascii?Q?v4jKa5lBhFel2qOfO4B9UKFrDgwyeX3EhWauHPMIMqZY2ihTkRUAeM+jZCl3?=
 =?us-ascii?Q?b2ZZtR7tyPZ7LGL25ylHg6DJox2O5s54UFVZqbDapXwajaAwKHnesozv4HDV?=
 =?us-ascii?Q?PtjBju79jZ+8JnB1MaF+mGB3Ga6Wqmr8vt5/LOcj4rvVw/Sm0ydN5uqB0MsC?=
 =?us-ascii?Q?Wy0Hrqe+ijG1J+A6IREvlDZ01U6BvMw5ZoxWOE5O1qq6LWhys9OxdBtP3gwI?=
 =?us-ascii?Q?GSpTDk70zJ88/eBBSfzvgwxHv/PJmfxtUHmLRBsNMcPqemzmcCpcglwWA/VP?=
 =?us-ascii?Q?3hVKVpc3cbHPkcZFJM9TWlcIGjJEre8cpi8BQtmzou06Vqc2t9YClwGVKIEC?=
 =?us-ascii?Q?TwBBLeWC/hN25fCQjIl/oRl8reULVFqZzfk5M24P6U9mjnTgbtGNLPLcd42L?=
 =?us-ascii?Q?aAZbgAL/1N0tgjoFC0psvJNpaaiZ7O8AulatnOim9NTFuim5LvOpMVJB0g3G?=
 =?us-ascii?Q?luAzcoq5WwYmk9S13pCEhcvuQk1bnl6S0Q8OayQd8PYlyJ482RFQvoKJx9uD?=
 =?us-ascii?Q?06OikA6PonOI3oLGwdt5o5cI6rxUZaRNaS0mylReMaBf5hWSqv7yDMroljoU?=
 =?us-ascii?Q?qXaLQwfNmIxT3xeewrnang6IhOVRZUXHcs2nc2KWYk5yYYoKI0r9AWEDZX32?=
 =?us-ascii?Q?D+wfAiev1hcU7ShWYWK+ygnvPnz4MompqNm5UBCn6YOdrst6il0LO7ptLBxU?=
 =?us-ascii?Q?gfGi2ZsdUIVpsbqXrqEyLZ9T+k8k20pu7/wROQe5FCX0B88yddD/Qk5VGAfG?=
 =?us-ascii?Q?7qp2aHuhoaIjeADWwWItnBze6q5S5ptwr3SLG7NlW992Xu1XEXavC7IsP55y?=
 =?us-ascii?Q?CkL3Db38c9fBsmDs4EBlrlZX6SPCWKXsWMhovlOLC0BaGBUk8xsDbtXzPETu?=
 =?us-ascii?Q?ioLQPFpQibgmF1/Ylz7s7/8a0pWUb5jku1TAEBJHVumEVa0gG56mqLFn8aAb?=
 =?us-ascii?Q?+R/dZF8vvbfMCEjsGz6ST3hsnv+jc1M07eLerW/+A16KYbezjZC3XOCSxg4I?=
 =?us-ascii?Q?kr0CTDKVqC9oW+v0WbrQ7h43lsazVjj2knEkFH6657AYK9E2PBb5CtDalwsy?=
 =?us-ascii?Q?0myaLfOWJHUncha2R4rf9vi60LS5U7PKVf0EwGaggFEw5QxVSfE2NGSye8Wi?=
 =?us-ascii?Q?IHqVcO2wJDucmkDZ+Z/8B8p8PfTlw5XAIZr70lH1vY+yAHbiiegy0OEQ1NfV?=
 =?us-ascii?Q?7GRXOWbdj4RqP77MvWPFGKbuVusAE+4dSTINMc0CNLoJJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GtXpYlU8UY8pI4MFqmqmrwDL7IQx+APN1Wh9OwUytlZCsv1TSokdQ7fFmYa7?=
 =?us-ascii?Q?U+0bR7EmWPRTGEpsdqwqRiZEljn2TtlPJ/amPpKRnMyWZcOkJqzQr22QedN5?=
 =?us-ascii?Q?jK1LsinbLY8JuYYsfUNuyD+3RrLixC2xJqeh28EEhAnbjvqft+RihKn8UW6Y?=
 =?us-ascii?Q?1JlBGlMRS1vzBY9sTttQIGV1YhTtSvb/rA2cerb4n2uvPzn1hexvPm3rLmo4?=
 =?us-ascii?Q?gzGJN/lq8aeiyvLIRpNaetmle60C9binlgxGXMhmr0hBkOqM0mRoXhiV5q+/?=
 =?us-ascii?Q?950owEC4WWrPUkehAMWGTWlgRrg8Sqb/hBt02Zc4a/j/TgtmRrHQEM3RMDk2?=
 =?us-ascii?Q?dU3CAHWRX/l/w81gWmz/2vB2vCCWzpQF40RcIld8n0GZZJ1wkgsfJGLgy4t6?=
 =?us-ascii?Q?gM8N1vsWKWE89Z0BPMEcJ27sRLKr5RuOKSuj7VnShSOJYtJ8j5AW4pTzcK7p?=
 =?us-ascii?Q?fyXVjWowCDAc9etW9lZPEQN+sJ/8P4CzNHLSfycs1oTUBOoJzh+JxkYtm6H/?=
 =?us-ascii?Q?6P1hovPtYF4D9LyZcmOJEKH4SIrgi6uq+X1fPcU5qAYPgo/COAa8uaGlUmfl?=
 =?us-ascii?Q?hm519+BUGqSuZrCq4C6WZge4GUaBvlBhWr7LCzGZEHtBSZb1GM+a+e4qKvn+?=
 =?us-ascii?Q?Y6Te7KDmRYpUb6P/zduqDWEh8EG2bWobDVMsokix6jSHKznxcuYKnCfhncTe?=
 =?us-ascii?Q?HdCEbf6mEuTeHWl1qd8lLOfa5FZhNWl+z0VnajJYBNvwYkCyEetudrg2D08q?=
 =?us-ascii?Q?HsTUcZ76GVvPXVjTb4T9sclHxMPXtERLOK36axeW9xcGdV9Il2cc7EkAvSuB?=
 =?us-ascii?Q?yMZIVIBfEdqbfdE52T8AA8zIhAZh2ZaxihPPgbLgSHvnl1dQAd591ijq+431?=
 =?us-ascii?Q?8w0YBqNg5G+/K7pAZ0K6lFK9I4JO1Sfoi21elcZ94tp2S4/M8Yjju48MbSmW?=
 =?us-ascii?Q?l1JPYiy3eWNEsZ2RjdCPDDmna0TVttYlZ5LAHbNu68kZ0+MYRit/pxDW8bx9?=
 =?us-ascii?Q?CsuAtyE8MwXZGG/iMWEgEZzdPVJRXmb5ETNkaJh5KyWtew3W4hPFtiyE7UtP?=
 =?us-ascii?Q?+QUvcyNNmBFB87GwkAxFQs0wvdaNvozHmgqbTEMFl13k2P9gjVd78Wp4dYR7?=
 =?us-ascii?Q?YrudNA8wbyua3Q0PVjJc/1jenWDhs91gh+8Tb8TQMKA9SyvNTLDp8Rf15J7K?=
 =?us-ascii?Q?TeqGcRusCLaPDuPuERvlbpMbmf/gE5wbbmGrMOCw1BvQ3eobrOuBNZdzobyQ?=
 =?us-ascii?Q?Jsrpfai6qaswQXApGO2Hz8KYrYqvhnh7rqtlWyXrAfeXCFgele8LGDifM8TE?=
 =?us-ascii?Q?jAbNpPqZqshX8PftpGAZL3036Y/3fjiRJ/jtkv4lBIF4/m/ha/3PyPww3nU0?=
 =?us-ascii?Q?uJZ/gGMwjQXlOj/PJPbqhx/XHF65sdPqqHSzN0A0hCb9oeoEHTVNaAQMF6WN?=
 =?us-ascii?Q?/CYiz0f5Pol3dFzGDGpUcNglXYjYE/ZOS2+J7QCfYY2r211fzMcb6KbSiDHM?=
 =?us-ascii?Q?q6I4PEY1LDrYZvmq+Jxbj8MVyCUQezU8yzSWLziF8R5h1BhPNiUY/tcaiTkM?=
 =?us-ascii?Q?gf0Qn9B1KYqviygG6amaaqYwWv/AKQWW5Cla6pv0OOhjK4J3iWf+CQxylcSU?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8235a0af-3c29-4be3-2f23-08dc96ea1ab5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 20:45:39.5996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYkLSjLBGiYUUW6dYEYaAT/zUKe4/rA5+l3CAUtbDnKhJjEbEq5NqZjxgqX5YLxy9Zv37wbVkwE5eugzMrdbizB13yi/2zz+ffaysU4hDow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
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

On Tue, Jun 25, 2024 at 05:41:01PM GMT, Matthew Brost wrote:
>On Tue, Jun 25, 2024 at 05:24:02PM +0000, Matthew Brost wrote:
>> On Wed, Jun 26, 2024 at 12:58:12AM +0800, Umesh Nerlige Ramappa wrote:
>> > Current code captures utilization at the exec queue level whenever a job
>> > is completed and then accumulates it into the xe file stats whenever the
>> > user queries for per client engine utilization. There is a case where
>> > utilization may be lost if the exec queue is destroyed before the user
>> > queries the utilization. To overcome that, record the utlization when
>> > the exec queue is destroyed.
>> >
>> > To do so
>> >
>> > 1) Wait for release of all other references to the exec queue. The wait
>> >    uses the same timeout as the job scheduling timeout. On timeout, only
>> >    a debug message is printed out since this is just a best effort to
>> >    capture the utilization prior to destroying the queue.
>> > 2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
>> >    record the utilization in the xe file stats.
>> >
>> > Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 +++++++++++
>> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>> >  2 files changed, 13 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > index 4d90a16745d2..f1028eaf2d7f 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > @@ -69,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>> >  	q->ops = gt->exec_queue_ops;
>> >  	INIT_LIST_HEAD(&q->lr.link);
>> >  	INIT_LIST_HEAD(&q->multi_gt_link);
>> > +	init_waitqueue_head(&q->wq);
>> >
>> >  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>> >  	q->sched_props.preempt_timeout_us =
>> > @@ -825,6 +826,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> >  	struct xe_file *xef = to_xe_file(file);
>> >  	struct drm_xe_exec_queue_destroy *args = data;
>> >  	struct xe_exec_queue *q;
>> > +	int ret;
>> >
>> >  	if (XE_IOCTL_DBG(xe, args->pad) ||
>> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>> > @@ -838,6 +840,15 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> >
>> >  	xe_exec_queue_kill(q);
>> >
>> > +	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
>> > +			(q->sched_props.job_timeout_ms/1000) * HZ);
>> > +	if (!ret)
>> > +		drm_dbg(&xe->drm, "Timedout waiting for exec queue run ticks update\n");
>> > +
>>
>> I can't say I love adding a wait to destroy IOCTL just to accurately
>> report some stats. If we can't preempt this exec queue, the kill flow
>> can take nearly .7s which would be pretty bad to block in the IOCTL.
>
>Opps, my timing calculation is wrong here as I forget that we reduce to
>the preemption timeoot to 1ms upon kill. But my point still stands from
>an arch perspective blocking in an IOCTL to collect stats doesn't seem
>right to me. Maybe others have a different opinion?

totally agree. Waiting for kref to be a specific value is always a code
smell (outside of the core check for == 0). There may be races, there
may be other krefs in other code paths as you mentioned below, etc.

If we were just preventing it to be destroyed then we'd increment it
before waiting on a *separate* event, not on the value of kref_read() -
example: we could wait on a q->dead flag.

But as you said, waiting on destroy just because of updating this stat
doesn't sound good. I'd rather prefer we go back to storing it in xef
with just taking an extra xef ref as needed to prevent it to go boom.

Lucas De Marchi

>
>> Even the common case isn't great either...
>>
>> Beyond that, this code breaks if the assumption of
>> kref_read(&q->refcount) == 1 meaning all jobs are done. e.g. The wedging
>> code == 2 takes an extra ref to the exec queue, so this IOCTL will hang
>> forever even we wedge the device.
>
>s/even we/if we/
>
>Matt
>
>>
>> Could this be added to exec queue backend code which adjusts on the
>> final destroy? e.g. Add it to __guc_exec_queue_fini_async via
>> xe_exec_queue_fini? Or does that not work because we don't have the xef?
>>
>> Regardless if my suggestion works or not, surely we can do something to
>> avoid waiting in this IOCTL. I suggest exploring another solution.
>>
>> Matt
>>
>> > +	mutex_lock(&xef->exec_queue.lock);
>> > +	xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
>> > +	mutex_unlock(&xef->exec_queue.lock);
>> > +
>> >  	trace_xe_exec_queue_close(q);
>> >  	xe_exec_queue_put(q);
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > index 201588ec33c3..2ae4221d2f61 100644
>> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > @@ -143,6 +143,8 @@ struct xe_exec_queue {
>> >  	u64 old_run_ticks;
>> >  	/** @run_ticks: hw engine class run time in ticks for this exec queue */
>> >  	u64 run_ticks;
>> > +	/** @wq: wait queue to wait for cleanup */
>> > +	wait_queue_head_t wq;
>> >  	/** @lrc: logical ring context for this exec queue */
>> >  	struct xe_lrc *lrc[];
>> >  };
>> > --
>> > 2.34.1
>> >
