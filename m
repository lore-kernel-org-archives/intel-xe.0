Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F286AD1BDC3
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 16:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDF210E495;
	Mon,  4 Nov 2024 16:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQjXwGnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617A410E47F
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730738372; x=1762274372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iWgsUQGvqwKBRlAbiHxSqRguhwxbu/xovobw8+T7oqI=;
 b=aQjXwGnr/j9y1dyil4Y57MKhW/o2+vrec0G0cwYktNZO3MwFmp0KvQih
 LF7ddPFMe92OzhArW4UKSKHX9IiObCpdC4rn3cNrRMa+mVXfScSQo9UJB
 ktzXbvoVApB1mGN5VfUdzXvpqHmpNdWWlDW/Nwl9j7LmoZu4Fe13RBhdC
 CWS6NGBG3m5M+qSbh9QWUk/AllYcS/pT7AoOcVDxBHGOmvwIlrv3GISqP
 rpG5Jnzbm4LuvY9mVk3/11d2rIx0J/SGFetBTSPAiFqBma+uvUnnfSook
 XjH8JO1oq6eZmcaGv2Y+e2GGrRW+RN4NL1NSKzNv4Wc4oOVuOKAP8YkyF w==;
X-CSE-ConnectionGUID: N0S6aIklT0q1P2h6FLXegg==
X-CSE-MsgGUID: x38jgJEXQfK0rTpM9AD2hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30557248"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="30557248"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 08:39:32 -0800
X-CSE-ConnectionGUID: W+/H5L0UQL6OKifsagcvCg==
X-CSE-MsgGUID: f0BnigpsTym9/t84fPBo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88282560"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 08:39:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 08:39:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 08:39:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 08:39:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzZml9qzh8NObf59WQGgTPJf5yj9Zof9ICcl6i2gaWe7ipNsTlKpspWlHxiAtR9jBlcfi+oIXuYyID0gf0MBfrj3pecemVAU1yStpwkxa8cB8rR/uLPeHcTU+RwTkban8R/m8aXe6whsQBG/wBBdgVA2/RXPTbaNJRQwW3FhZzZm7kY9t0fGY5fZ30d8NSxq6LS5EkAtEDczTbCO1kE6mSqVoIWWkppBoY075ZmrcuTOQiCQaLGH1VEznHAuW0QM/e1cVoo1BFCBoWCjMluGhFI8x8JHwbk3mCv2vfDG6WYO+YsbI26MgOLwE65UTEisGUmg9FEOOCZD6F/hcu8/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSfdYHAofgk60ufvYSE9V3Op2DaTiYDNHA27dzz9aiU=;
 b=Bi8HrkUSvZDyvPtTfUrJlohW8TpOkkU1iHeCSuz061jQTvxUaTo6XTpXqF3pcmhEE38+kspZSRUCG/gd03so/zcgR8KPZb2IU9tvpf23nJz8VHUBGf7JE7auyUPAaeZvLrZl/weFUx9qORQYj3TPg06dDQS4LjS4mwkcZAafjdDgQgkzRUJR+XK/RAIwT4j49QaWGq2ubXVzf680UWZOWnaA+OEuoBFzpUrTOnGjgfzI+9oi3UNPi0XriSyQJ3+p2crOa10xfXAzZXjafSfKd5fi+b+axDB/JpovdCETsTmX8pcMhGJnbcrw/+MqOd5iYG93xdKCtH7VPHNIDk9NLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 16:39:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 16:39:26 +0000
Date: Mon, 4 Nov 2024 10:39:23 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, <koby.elbaz@intel.com>,
 <yaron.avizrat@intel.com>
Subject: Re: [PATCH 0/3] MSI-X support
Message-ID: <npxjn63gi55ber5pj7h7t7feel5qzxhucf5iitgrbvs4csjxtf@eani57h5h3c7>
References: <445e6dd7-c204-4795-b7cf-d4929c42e6a7@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <445e6dd7-c204-4795-b7cf-d4929c42e6a7@intel.com>
X-ClientProxiedBy: MW4PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:303:b7::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 87355675-7239-47fa-c641-08dcfcef3ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vqgcRCj9qNA6oSdL1AdQsLSDyzS9mGMdYyVh+3yWBi0w0OS0uhMEnNLx8DAS?=
 =?us-ascii?Q?fv7jZakbAVElx0LRoahbbuZTScpOVysHNvH6alazE+0tmGOzto+gzwZwzOKI?=
 =?us-ascii?Q?huPgnj0NwzkBEEhOBI/KzP2AnHsERdFUUhCn4oXlRAtY3wQodgAEsyNGEXoE?=
 =?us-ascii?Q?i8KTtgBtFe7ibCyNHjtKkgHsm2YYScR92q3ncHjzRO3mSk5lRJlnfdBCPswX?=
 =?us-ascii?Q?28Dzfv/idpULWeKD8aSElhoqt09YwbhSlAzJUoS4abgCincLbUm2uFOI/cXz?=
 =?us-ascii?Q?YNtY0cA7G9ervLWaFseL4wEeZbPOykJ9XqGgUL4F8+hfIO3YGIdfGtGEi3mM?=
 =?us-ascii?Q?6J5SwZGef8O/9xSku6Avix5La7+rv4VYUL5/VS2+ZZ3xrK2YjmK8ixPCS/M4?=
 =?us-ascii?Q?bGWtazJMmKFEN2iLh7o0Sa4NH3TBkfzIfbIiP5dFQ7kio+Q84//IKwFchZif?=
 =?us-ascii?Q?SK3XDeBSb57mIngSBIuIaWBWVO8AQ2XYn6trlb/U0HSkL4V5HJCuNSor0YTN?=
 =?us-ascii?Q?YDXoeTxnBUNPj/H4QKd3hRQ/wMeN+xA8ILAo+u6tvSUP4yVRPzCrf0qDCgxv?=
 =?us-ascii?Q?R8BosCFq8WBFLrkxhWsm2U883A4pBO1a2/U5RAmcne0vNqDXrdBW7q+QZaoU?=
 =?us-ascii?Q?J2pQP9euhBPhPZIIWW6Yr2mqd1C1lCPcPWxO8p/2S24njQcYD/9VRFcmWwYj?=
 =?us-ascii?Q?S6x9kuj3oAqQZllg3wfjIw/u3CoDlox15cyXOdZMkxPwtxZxtKvG+c/AybbN?=
 =?us-ascii?Q?jNofBHXv4HkfNzO+ynuDXl8OTV/BFu+qtKa9of2N68kqrxF2Xa73FKmMQADc?=
 =?us-ascii?Q?iRwr+4qym5pspDxYD7HFHAqsAaAzXQXGAW6/RDs8ewtyzvxKVFuvSqa7ZL7L?=
 =?us-ascii?Q?+2R0qdYkuPlmJRWcAwGk75XEnHnp6xWfyi55hIG5z+vo1bMIF6qORgMpIk9F?=
 =?us-ascii?Q?sToWAD+NcOmhcdvTUJ3crAM03hqp6gSHtE/RbHuGCAupi2IkROqrvF22QkYH?=
 =?us-ascii?Q?nXoA1Ojr65jD9kMPryk/BQPN7l19fPk5PReWZ8f+zD9goBpAFyVLZViVq7hm?=
 =?us-ascii?Q?PxNv81s3ycsPp4d3lRPdg62c7jhjBQo7hv8evj8iZKRuxtqJ/Lgul+54Mmtu?=
 =?us-ascii?Q?T1084cXGzRk86NQqSER7r6F8v919tblevNZLwLrSMOz2hc77exY8ClB3i6q2?=
 =?us-ascii?Q?RzQdpAAy9YHTklTKa+xF7PaR8AmqeZ4kijrj5JCh2I2KUC6s6I8mA2hgRhxV?=
 =?us-ascii?Q?XBmIvDT7P3g/v1j3jRrL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pC0Ao2+tNEC51FPyZj8IhGxotzM8UyNWZaswXOdszifMYqDaSGqKgoWC0xn3?=
 =?us-ascii?Q?j3KB5jEX5bR96I8Qlag4hDpH0wcxA/YxbWUmDzaBjDfRi8qQzE77tURfGzHu?=
 =?us-ascii?Q?swPntLMzDiLvqjy/EBkYFEV09YR9+HmE0+A7jyl2QwuqiTFUZrJiqlKVw92A?=
 =?us-ascii?Q?9Ia+irGrZxVdejSl87MhVubxu6xqc8MgApheK7KxV0GViTF4q/Sx9V0URy3c?=
 =?us-ascii?Q?HH6QcO+BSSTU0MFFcediuICAhOqxaiV1gaTcdEIpMhrMbBzORMG4gybr88cC?=
 =?us-ascii?Q?cnfwllmyQYQeQ0TjLBYn+x5lPkH/TSMck+uyADAZDql3geUDfri2xKY2NOnX?=
 =?us-ascii?Q?SHjabRGjDfgGpe8FDBNFGmisVXGatBv1I/LF9MbP/NkIn3pK6TQeTfWjKkHb?=
 =?us-ascii?Q?cqdVdmv0MULfW2GM2TPwStaTB6a7hBNV6btA7kEYIcJ3DNmhN2AdRiQOvr50?=
 =?us-ascii?Q?R46Vf0HD8Cd3IMg7cDZr3aQ+QDiH1UIO088bIa92x1T7jZsLtekpER3NxFWy?=
 =?us-ascii?Q?nSaGKAWvTVcxOC2b5WOAOyujlqlErFV6tfD8PvACLHj/B2Onksd+MUhRVpNW?=
 =?us-ascii?Q?/FIMAbDA/zmVS/4/aRG15bNhsZ6LEvN9tJ2cmWpNgpHJe8iq5CLJFVsLp0rq?=
 =?us-ascii?Q?ZYXgmNlzsoWmuUqiUfbEEuDl6rXXC31tbigd0yjdRrK0emx9kHaipotSEEZi?=
 =?us-ascii?Q?qKcAICDu1VCSrL7YyBEU78eSsGG7UIPkDar7k6CjAluthLF/gcsSEnwCSJ+I?=
 =?us-ascii?Q?2yvTSgXvh88RQpA01uBh0Tw8vK/yr49S2gPdw7cOWIk6gcb8oJTwPuHotai9?=
 =?us-ascii?Q?LErJQ4+Va0kzcDuQzxVov3jgfXT+CF2ZggDbD0UzGMzM3TKvaRtqcK5O/p6X?=
 =?us-ascii?Q?DDiLtnAIEvxFmfeRxtGo0/F5wTlJjzEdwdlFs54SKoajVN/vWUdmMBGurUXi?=
 =?us-ascii?Q?8A+jnTYkufagaVzJx4VrMNgjrgoYAlAMRWfUGbY8TgBfV6Kfmu0t4Ts7esxj?=
 =?us-ascii?Q?1tUYYKs1RP0w/sM8+EPIzPRkLOEI+W5Qq21okRImtRcKwV8AfFp52Slgxy/g?=
 =?us-ascii?Q?qMglAnzqTwUw4pPUz8VpsQ6PZMtJvHg/GutazmPXKxRGNPUKoAwITGDKZiiO?=
 =?us-ascii?Q?UNyY3+3tL8GvcfaSj4nPTHL+FUbjaZbdRqeqZnIJKpSs4anUf30d6YsvICSC?=
 =?us-ascii?Q?UT0DnnCpvBQ8v2hCCrY2Yuhvq8ED213T5+zhliV4DZVc8uHFIJkGaCgA4ivy?=
 =?us-ascii?Q?vrxXvJKvErsghQJ8/sk/JFhbY+hhil7/ZkpUZkUmiuyiI/JlnY5ZsMTh2PTj?=
 =?us-ascii?Q?xI73Emeqeo6i9mEaGDNNkpD+aKoTTp7v5NWjOmBwD6aXoEukeQgoX3lsvUiu?=
 =?us-ascii?Q?V9eUSa0mAjgXRmyyxOpaYWcGsPpYbBO2zpRf5d+Hd0bEeR94CjiaGO4l7QZG?=
 =?us-ascii?Q?g46e7zQAF3kzMMepsTXlR08uaoKjt6F2se/4KzfXCaRBmMOnjps0/6wg99OR?=
 =?us-ascii?Q?UHqOAw9X24nHWOlN5NhkRXtwC1HaXq4E1Ew+XjLC+o4nKEvQxR3HddK6n72A?=
 =?us-ascii?Q?yDj7disbb7erqoZY4hEQI9nm6NMiac57uWNznKAcAWlG0a1NQpLd0iW4mxRn?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87355675-7239-47fa-c641-08dcfcef3ea8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 16:39:26.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrPg44YJnHkW8VwMF52zQ6Dj5IPC4OHSod5uft+Ri85Gy5CD7/+tByH/Rywd1ZZhVLyq45uTXFfOvy5OLIp9yYDDHSltJzPSODhkwRkNy0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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

On Mon, Nov 04, 2024 at 04:46:49PM +0200, Levi, Ilia wrote:
>This patch set introduces MSI-X workflow.
>This is a rework of previously published series 135422
>(https://patchwork.freedesktop.org/series/135422/).

 From email headers:

	User-Agent: Mozilla Thunderbird

It looks like you have a setup issue - each patch was sent individually
rather than providing the correct In-Reply-To, so this not a proper
series our CI understands and that can be easily applied.
It's better to use git-send-email for our email-oriented workflow.

Lucas De Marchi
