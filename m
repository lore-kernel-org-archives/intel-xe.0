Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A268C71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 00:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00C810E586;
	Tue,  8 Jul 2025 00:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giKyeza9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F30710E10D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 00:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751936383; x=1783472383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2RqzCaRQaZeVflXNxb8B4cT3exRoB43gHcEGWyVCb/A=;
 b=giKyeza9bvNFtADN95grXFe911GgTJxogqE493r7vSSwMGCUYFEoTwSM
 ecxjyZshyaUlj/N0nHv665I3gZy2S5M7O8Pmo5tyG9FZPkln+oZqCNWg+
 QNOnlwPMMaxj8I9UK7Ez3XA94kPinnkC2WWE2b47U6Ws4Z9BWgHcqCcsP
 3EMJqZB/ST4msma9llHAbm/uLX9va6jkHoEkUNqdDh9wSsL5UDsSx+UhD
 PV+DFe/hLuVT8ehhGS/jZz8kn/3+W15XWjz1LTbCYlg2vrKo6ql1N6M9p
 XHXorf5XI/j4x0F12Y3pf/yYTBf9laUcjRXIm4SFXpX2/b3iXs4eltZOY A==;
X-CSE-ConnectionGUID: nKqQTKNQRlKwoTlKUOwe6A==
X-CSE-MsgGUID: chxKxeOkTvS/2NB3PLduAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41789574"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="41789574"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 17:59:43 -0700
X-CSE-ConnectionGUID: fhdl75VARlmYql5mUvzcaA==
X-CSE-MsgGUID: v873BMZNT0eViROEBkhp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="155480768"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 17:59:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 17:59:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 17:59:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 17:59:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhujXAT4N3OZWg8Ot+G4DEhwwmwJTAFCYHVYPPGydewjiBNE+TYLCeGJa34LIL37Vx1yoKu+OoyQVtiwhEtgDQFWNItOc1dAcHHqqGBwLwsvOMeqG3FiBinWoJsSkA9Yu/XQnyRjGbS6UGxDCSft6YJ9lIELnKuLREZuwam3SXnoooO90uuTJLQSQPwzuas7phh2yV2H/N7x3PoHoR5DFrVyBvU0yrvYNoJtHLnd8CXzmuNTi/Zd0HMasMC4ieEcRhfAN5roeMEJBH9ANf3CgvzhatGJHLSQkge2XGsqSeEqYa/tqOg+AK/2aKmq0N/HBjcBul4FSdS8xon45+LFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko7lgU7Oa9AgBF3/tbn4zIofj5HyEG/apFR3GlPgheA=;
 b=PhWJqcGjUZFSpOVasoRMJ7FRkc1QDag0zDs5uqEHJtBPOpqUTrKwYxUQC/N7Zf+qmsW8SiVZ0TQaPe3QX/vl0Wz0E9EuZoty/lrMSdm5AmXpdNeYSdcA8SMzfFRZ25vY9++qtg4eyCcd6eJcj0eCXDzwxga7ZdAGFE20+ZCS6J9SURQ+MsHksniDxjwBcdPYPMBSbk0gIFZMiBDY3UhkQR/Gu9Q+3CW4KUaiPL5jwx4j/2/kFR49Xl8o0ywQQwRU3HP4KXq5xkNB1K+dZ+qVGW6b3feEDFlCvz5tLTL+CxnyP80RMYeNiuZ8tEL2HgEIb28YlvuqBlmWOx/ikVGn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 00:59:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 00:59:40 +0000
Date: Mon, 7 Jul 2025 19:59:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 3/7] drm/xe/gt: Extract emit_job_sync()
Message-ID: <ahp3qg7t3h3jcvccx5vnxv2nrojca66hs5tvmcoajsedrv4odz@mwxoyhqknhoh>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-3-6aa22f174041@intel.com>
 <b1ed4d6b-5970-4ea2-8c46-7593cfc627e3@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b1ed4d6b-5970-4ea2-8c46-7593cfc627e3@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 62977d39-968e-433b-629c-08ddbdbab7ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H9H0TdXpF971eShTHiTU/75h+eATVYbFT2M9NJiEZrkAMx0wXTFml+t4BP3P?=
 =?us-ascii?Q?jRxvYOXDaySHraZFniOa0ttA0IoEf6m4IM0ldT2JaDaS6m/AW07QQluyrUvE?=
 =?us-ascii?Q?KJ8VKxTSnNKTjwOn89RWrEBLTXf3yvnH0z1DvF9D7tnet/9mUEtnQyKzZ6sz?=
 =?us-ascii?Q?9GaX043oEHTYkvBzxXgk+8sT0InUuls2d/fBQqTBTBOKShqTfjOWa7skWkJS?=
 =?us-ascii?Q?7oEJXCBYoopbunrae4//H9q9WvrTzltWUH+SCmBhI8k1g6a3JyRBd0xoONFa?=
 =?us-ascii?Q?1JW5ZS/Xm2X5PVMldwQzz/dBbXXgeqaS0iOgGM1YrVW8QQRjhOepVCF/gcnT?=
 =?us-ascii?Q?zXpU5AmjPbSLFzYgAzU9mTVFUGKfrg71xYc2+yWA0GKPtLiKOfVPb58kxGbC?=
 =?us-ascii?Q?Ovgo/lzev7U7Wm8LGWjHd+pNRwyLknjYvl+2gryCDpV/45XF4Yiw+W8GVbJl?=
 =?us-ascii?Q?MLWHXVHPO0jVCNZkg8Y97KPC7380S5YaIt527XoW1MVzDLHElHxqYWvSfnZO?=
 =?us-ascii?Q?oeFCO3mD1s2oEUhh42sjnffjtET7ZNjHzrsnsn3eShcf4jNVQGutCHKe+25P?=
 =?us-ascii?Q?93TbEu9ljjF8zZIh12Z8YwY0UmsU3VwD0Ovy28XS1V+8hD+ZE2W+alILLv9P?=
 =?us-ascii?Q?FkyQlHfLMApRevzXVjRXOxA7dIsqFqZMKWyvLmlCT424K5G6y8iVZ1XYYXcd?=
 =?us-ascii?Q?VNBqpsALf30n2vQqWj+6IXLlY4rIHS6RZKG0gymJGK/vgO6MJK9obBlbSjsJ?=
 =?us-ascii?Q?ZFkNpkabVsYmve5Bqa95NL5VTWrhVQW4v1DBEOFZ7W5I0VyPJpBw/KiEHs4a?=
 =?us-ascii?Q?Q7Fct1kfl2qMHpOZ/E6rY3CfzVLPDyrpA/8eypXP40/T96uks9VPK6AZCmd8?=
 =?us-ascii?Q?IoIgvwzAAUR5VpTWTeqHkq8O8ANFbBaOo8ja6Nn8kl0lfvNLPLb0o3XvbXX5?=
 =?us-ascii?Q?ilsaLzongqbIjTvOe7aGRlBM0JTAUpvCKEE2PwdK6H3n82sTYL4Dqb0tHI/q?=
 =?us-ascii?Q?kc4Ovs2Rx+qyzZR5rsn9yXlfdiGnvukZOxyjsYHWiKJnLrnL5nWBzMYDAG/9?=
 =?us-ascii?Q?1uJe2j88RQag5somraH5ZmUrZQoEl3282lE+G6U4g024zQ3im4vhH2HTKakl?=
 =?us-ascii?Q?HuBKSKxhDuyHWIouywy54E+hGFqu+aVMtqwwYtB+YPQyA5v7G/BT4y3f4Go2?=
 =?us-ascii?Q?5XKAFNfosXTpWHJyzWV2+X7QsPGDRuKA/wj76iURUBcTBsyH0uw9mZfeOyLX?=
 =?us-ascii?Q?tez8zNikuGYXs9W0/FL9nWJc4ptPNm7JPHWG/I6HTmpImtWT7qwJkqfBh4eo?=
 =?us-ascii?Q?Ci/pCMOJajL+8VdWST17uFgS9ONV2TTblMHptaL1QDAefvqP3F2tkSgdhKLi?=
 =?us-ascii?Q?rX6rVPzvg4Owov9WWI1diviRyzhgb24h/MjRbidTyK3nAzSxr6PRScfyDvtF?=
 =?us-ascii?Q?2l/NCYfM4YVIbPQnht6o/+AqsLkx5eaKbI97rTkzrnAC5M/ZhTPx9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0yIM8030XbvpvB9SXq+E6zrnxNgQNfHhdAj7Zqy6tq89E7P7msKZV1XceGcd?=
 =?us-ascii?Q?IlSTErsj2K+qw+ydlVcKOpR2iN0bD9aTC1PeSujfxcFQQVZE4GsQGKl4Wq2/?=
 =?us-ascii?Q?5tOeBg83wE5goOUd5OMId9PXjxtvgbtsy7K8tO60MpAMI+FK/+1jEJTWz0R6?=
 =?us-ascii?Q?mxmMx7ln/wcnB3s+M05tRu38OJw4E3R8aWt5tG9yfXP60b5U37dLCYbZjwep?=
 =?us-ascii?Q?CeDTTMlpnm0zboEhaO11haDm8zvKE0crVrHQATxxXBea/An9PB2UohGCIFwR?=
 =?us-ascii?Q?rrZkFJBBZw8xAqe8js4fnFQ7TWK/wXzZXniPhpt7+otXrVDntvNNm8ocGEXN?=
 =?us-ascii?Q?Gg4Fg8KlFfjNNg4ysDUFRc25OPazpxNwZ9dxsynKJDKjemID0kf+vTxkkBbu?=
 =?us-ascii?Q?jwka0yF0601yh/hRVpgZhjwcZHgluGsA9zI7MyN+m3Rq/uPji+HwgU+0yakE?=
 =?us-ascii?Q?+3VRQJcZJOF8HNDHoE7nAi5g1Im+Q9StjhWdx9ugvBr4vvvo9IDX2L3VV3Ij?=
 =?us-ascii?Q?4AhkoHabKEFGYHXfcMUiX3BtHqplsmzG5pj5354jVYw1UdiEJF8fqkEHeW5m?=
 =?us-ascii?Q?b/NJvN24RgikPP/ogu3GVlZK6MgwBI0MvIwKCOo+RYaF4dWCzs17bpqACPPb?=
 =?us-ascii?Q?VypOQVRN01IqI7DVa6tB2IbNhRFtwEeMoQZkENTZ4nF8DjgX2xnic+spbTsI?=
 =?us-ascii?Q?VgnsampdHcU6qJsp+DuvELUAerhYi7C1RjgB+9Bbxxx734jCpj7PSaa1Xbjm?=
 =?us-ascii?Q?GE/1sfRAT24AqHjymhv+X60vagB3aSzOoU6Qjf79uE99XIHAWbKCo3kgq6XF?=
 =?us-ascii?Q?Sch/qwMaGFgXCOQP0rDdkocYMMjBmvogReymhCnRmtb/h6MI6zTrsBbVQPBL?=
 =?us-ascii?Q?XEcp4sh4qIsjgbbxCsbtqmMS+VyJ/UWwweoDdbakMizkwEfdOppnehudJXr3?=
 =?us-ascii?Q?Z1DYx+u991/vTk2zidDzgPu0llpiSHUdc1aRxMD7MVYHjYXwtBr3esy7mumj?=
 =?us-ascii?Q?pkS65yI1ARwl3Pea/EiwCM9+10H0kMpokos4vQC3zFZoBpjtvwuO2hmhHXLu?=
 =?us-ascii?Q?IPhjk9PEgnPDqmFC1pho7aKZkHjUwT6/nykNoMBg1XKebgYkjOGpII5gjOZU?=
 =?us-ascii?Q?RqoezQmSDCEKY5bDXiQ9XBOaurip28e/VXL2pG7nIlM39v7q2Cy8hlw/VUb9?=
 =?us-ascii?Q?9kwwxZ0TNlZ7KviokBLa9wh9gu9IkKS1LGa9mWFm0PkGsCFFaMiK3Vc8uyba?=
 =?us-ascii?Q?7+ofh4sRM4RirxTwjq9ZN3rlL8VGk39QTHa4B7GTbdHgEbeLWthNaqkp+Vlv?=
 =?us-ascii?Q?ShQV8GzAV1YcaTqolE4Lxh2brI11meVs8xpaDJPLM9lZGE4opo4XJgmnhlEu?=
 =?us-ascii?Q?X037EFJsyIOYSH6R9rTH8KigQUZ/cKv1rMJuNGNzAAnv77jFVyga7SbM0s5/?=
 =?us-ascii?Q?76nnc6wlSoOl7gQM5XizLXC7sZBw24WtE5AGY7DYFyQ3zBSyujT2Vr8eMdV4?=
 =?us-ascii?Q?d/hIH2FtGRKOeUiM3Ep0xqyWe23SUrb97WH8sbiWAZ3EU39D1AHACJjrG3Rt?=
 =?us-ascii?Q?/ffIkRjAGRWgzEDyq9yJEBRp7Zs9CFkm3UsCkM6OsflMkpLYCgit3zL4DQof?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62977d39-968e-433b-629c-08ddbdbab7ba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 00:59:40.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZ8/4t7dXiK7M1qmX/NNkxAXI36SIhTH2us4sMGn28Ca+p9irIbkoXrszytq/BtHEWIVeEdb4kOLrmLMotQv0i7jZHPCk8HdUxR28n4FdqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
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

On Fri, Jul 04, 2025 at 11:35:02AM +0100, Tvrtko Ursulin wrote:
>
>On 03/07/2025 23:41, Lucas De Marchi wrote:
>>Both the nop and wa jobs are going through the same boiler plate calls
>>to emit the job with a timeout and handling error for both bb and job.
>>Extract emit_job_sync() so those functions create the bb, handling
>>possible errors and delegate the part about really emitting the job
>>and waiting for its completion.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_gt.c | 59 +++++++++++++++++++---------------------------
>>  1 file changed, 24 insertions(+), 35 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index a926f560f2e36..67425e37c2187 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -146,30 +146,23 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>>  static void gt_reset_worker(struct work_struct *w);
>>-static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>+static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
>>+			 long timeout_jiffies)
>>  {
>>  	struct xe_sched_job *job;
>>-	struct xe_bb *bb;
>>  	struct dma_fence *fence;
>>  	long timeout;
>>-	bb = xe_bb_new(gt, 4, false);
>>-	if (IS_ERR(bb))
>>-		return PTR_ERR(bb);
>>-
>>  	job = xe_bb_create_job(q, bb);
>>-	if (IS_ERR(job)) {
>>-		xe_bb_free(bb, NULL);
>>+	if (IS_ERR(job))
>>  		return PTR_ERR(job);
>>-	}
>>  	xe_sched_job_arm(job);
>>  	fence = dma_fence_get(&job->drm.s_fence->finished);
>>  	xe_sched_job_push(job);
>>-	timeout = dma_fence_wait_timeout(fence, false, HZ);
>>+	timeout = dma_fence_wait_timeout(fence, false, timeout_jiffies);
>>  	dma_fence_put(fence);
>>-	xe_bb_free(bb, NULL);
>>  	if (timeout < 0)
>>  		return timeout;
>>  	else if (!timeout)
>>@@ -178,17 +171,28 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  	return 0;
>>  }
>>+static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>+{
>>+	struct xe_bb *bb;
>>+	int ret;
>>+
>>+	bb = xe_bb_new(gt, 4, false);
>>+	if (IS_ERR(bb))
>>+		return PTR_ERR(bb);
>>+
>>+	ret = emit_job_sync(q, bb, HZ);
>>+	xe_bb_free(bb, NULL);
>>+
>>+	return ret;
>>+}
>>+
>>  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  {
>>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>>  	struct xe_reg_sr_entry *entry;
>>+	int count_rmw = 0, count = 0, ret;
>
>Nit - might as well width sort the declarations while touching. Up to you.

it's for very few chars, and  would separate the related
xe_reg_sr{,_entry} variables.... so in this case I'd rather leave it
like that.

>
>>  	unsigned long idx;
>>-	struct xe_sched_job *job;
>>  	struct xe_bb *bb;
>>-	struct dma_fence *fence;
>>-	long timeout;
>>-	int count_rmw = 0;
>>-	int count = 0;
>>  	size_t bb_len;
>>  	/* count RMW registers as those will be handled separately */
>>@@ -199,9 +203,6 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  			++count_rmw;
>>  	}
>>-	if (count || count_rmw)
>>-		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>>-
>>  	bb_len = count * 2;
>>  	if (count_rmw)
>>  		bb_len += count_rmw * 20 + 7;
>>@@ -292,25 +293,13 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>  	xe_lrc_emit_hwe_state_instructions(q, bb);
>>-	job = xe_bb_create_job(q, bb);
>>-	if (IS_ERR(job)) {
>>-		xe_bb_free(bb, NULL);
>>-		return PTR_ERR(job);
>>-	}
>>+	if (bb->len)
>>+		xe_gt_dbg(gt, "LRC WA %s save-restore batch: %u dw", sr->name, bb->len);
>>-	xe_sched_job_arm(job);
>>-	fence = dma_fence_get(&job->drm.s_fence->finished);
>>-	xe_sched_job_push(job);
>>-
>>-	timeout = dma_fence_wait_timeout(fence, false, HZ);
>>-	dma_fence_put(fence);
>>+	ret = emit_job_sync(q, bb, HZ);
>>  	xe_bb_free(bb, NULL);
>>-	if (timeout < 0)
>>-		return timeout;
>>-	else if (!timeout)
>>-		return -ETIME;
>>-	return 0;
>>+	return ret;
>>  }
>>  int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>
>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
