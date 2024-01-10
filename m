Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BEBC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E49210E5E6;
	Wed, 10 Jan 2024 17:13:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DB910E5E6
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704906834; x=1736442834;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JVw4mMaUZwXcoxlHWQ3DlPqMHyveDkfQ/uVT4woUabQ=;
 b=VBEpM1Tx+84q3d4qYAXZ3qlbRnJxrdRXtKrjkigveSsLo1A/peT07aEQ
 ttlROaAtmyiVYknOg5sfyNb0tXhnDAI2AIauL5mWqFOn9fP4Bn39aAAiB
 dFxTA7VIPXtgzPj80ODzWhOHJTuLrzgIlO3hoIyBS6aFb5cE6Hk3d6B35
 JOCqvuCkBarGWRm5mpexJz29iQNqudYGjLjDszKqn7HhPuoAhqlgQS56Q
 vnOUfYi6V2CmatiMmdvamXCM3eS1qwQ614+3HjujynYF9VL3XpcxHFgOq
 rLZjcAu4WUwcUiNAa1vdgTmCYf6r4muNWLUIy0jJqaBWrNxlX6GBhtqAW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5669000"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5669000"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:13:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775286909"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775286909"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 09:13:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 09:13:44 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 09:13:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 09:13:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 09:13:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjwjF9B+EXd/ACO+APgUIPwY2fKCPfQ6GkHNekCQO5H/1kpOG7nYpWIko7x3snMIpIRKjpLBA17+wWFd9hN9zJQxCh83IkgSoP6FUrAg1TaMv1YjDn66hZjA4q19BFk4d0CEbzab1BfoTxgFtmtushHVMpFy7TE6vODl7qFAvyTmlVewDwCiSUuUet3DV5Shx8ngU3PmvHtcR25+xPm3NjCqUwqk0LsYP1zCFhSTmBueEjfldqQX5+nv3KC0U7Ykr4h5geVKHG3oXvmKg0vHr0fc66mlt95TrLHiWjfxyM5SZsi4FHzY+gZ+WxScMPa1fBMNIylKTN7vWr9dmPnC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5awrJe/TvBbsjED/w4mBLyhutKwWDxs1KT0zFMr3NgA=;
 b=blaYzDASrA1UGt29wIjl1nVslIToQkF4TgTw//PLv1Lk0LzK/yUV4TYz4slgS2hoeNRdo49BeCPz2t8KOk2t6qDPGxsGZ6M7gV1MyvYYb2LKcdAFnSLdkwjzsmTyy9gcHv9rUGIWOztiqM9yCy2OEzaPMtppw7M3OeBjN9lE6t+C0cb99etICecznUNHcrLuJYarxLqeYExzyCqBoeuwVVYkgHFqTjOgGTuxiC3QbXwfeqMaXJtPEaA8n6wiPy87GyXEji5W1pbwdnT+LLVRTJiYxFRPWU1xCwGlffgV9Ya3Tvdm3NV7bFbBIfz1upFtotBELoEeGmgKixY/JeKjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by BL3PR11MB6387.namprd11.prod.outlook.com (2603:10b6:208:3b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 17:13:42 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 17:13:42 +0000
Message-ID: <3eb0c49f-11d0-48e8-a7a5-029476183508@intel.com>
Date: Wed, 10 Jan 2024 09:13:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Page fault logic clean ups
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240110012439.1400618-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240110012439.1400618-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|BL3PR11MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c48cd1-26c2-4fc6-ae1e-08dc11ff7eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gmF+JQ9Yf5PHuCMQw5dRdHxnrIUiBmKGWo+4VxSDpvWCf5D7YmiCV0JCQ3mV9C6PQhGL/8DyGqpgg7ur1tG3+s/wjLEMHT6z0koheXICD+m4YvlS2WvlfI1PPJx7LSq6Dx01B/wkBIJGbgWXH6i9nHhZCaME4v1OjFh9FCnfyNxph6dbcSsUfJtY7ZxEcHwB6woF0y3uwbL9rPu2Lkqm/RrqJZKwkmDSM/nZ2RCy+YvslbDUXIxI66U2mjg3R9rxGFrygBwZyFRQJhshBPad13msuaGcz2MTG2Y6TuwoTRFBmUP6abhv2AJuDws8gQCjOJd9x2aclBTbVZe6mTqA5rYY35NGOs4NIFq3QUhk+NN963rf1mH5b+5ri3XF5Z8BG4OA1zunLvC7nyFwMSfIHJd6pCMK6CnGGa/tdm6RQ9dnmMRHfMr4OLuc1xrNWmI17v76XyS3QWSZE9NBucSlhUd9l9LGLInbXlP6sdJIakZUUN2ibRHCy6cZ2pMVYlcIHoaq+tt9imOfyvHXlZXJqc0XJQyj3Dk9y2Dkfqa+QhC/az/JRsWcIbzMYFiztx5KowpJUakixbnWxTBEMb26/DFd6i+ofyiQwAwWe91KZvH1RK1sGLO87bRtBRkqVMWVE1BeaQPfbOx+Gj8n05dskw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(5660300002)(4744005)(83380400001)(38100700002)(26005)(2616005)(31696002)(31686004)(2906002)(8676002)(8936002)(86362001)(316002)(41300700001)(82960400001)(478600001)(6512007)(36756003)(6506007)(53546011)(66946007)(66476007)(66556008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGNISE5wWjR1OVNJNkNYQ3hUVG9iMzFBU09ES0ptVXZsSUh1MHBIMFVxMENo?=
 =?utf-8?B?c3FBQnBKM1Z4OGdHYWMxYlQ1eFdmem5QbUIxRFdOTEE2ZVYyZ1R4OFZmMGRT?=
 =?utf-8?B?aGFVN0g5c1dxZDdBQ2ZzNE1nczVQVTFpNkRVaGdhM0hHK1NucWRoNDZGVlZw?=
 =?utf-8?B?ODBDVEEyQWtwNUtJcmgwVEtFNklRdWhiVm9XaVljUktEZUR6VGxTTDFuWjF6?=
 =?utf-8?B?ais0cXlKVlVpcWhPbWxIeHlsNnVWNTJwTi9ibzk2R3FUY3ZNN2s1ZVUzaTdH?=
 =?utf-8?B?ZnRIakVDc3BTdjNGZ2RxQ0FMRTc1WWlZM1lKMWMxVWVvWkxrUjRnbjVka2RO?=
 =?utf-8?B?MEswU05GcGlRZVJzU0RweHd4emlnVkh5UlQxbTN3UGF1am5LdlM3RTE4VDN3?=
 =?utf-8?B?Sy9XMG1qRlpvMXAzdFVzV01lTXdudHVXNXRGd0dEYTY5YjY4Yy9PbWVHSE1M?=
 =?utf-8?B?Q2RiOEdEWGg3R1FjbUhJNW1zUXBud0Jpa21qeElwQ1FRV3lEWFgzeW5jL21p?=
 =?utf-8?B?aHZuMXlFYlV2RUFxTU00T0E3VEVQVFZZcnZRMGZoTW1kZ3RkYUl6dGxlNGI4?=
 =?utf-8?B?aStuZGZwZ2ZoVjBQSFNCSGxnNEozUWRRNmpmN1RQT25kQytZeGs4TTlTaVQr?=
 =?utf-8?B?eStoZTJrUUJkbksza2hoaXlkWTJZVFdCZWpoa3VWNkwwOURHaHNMYThobGpN?=
 =?utf-8?B?cjNOUEV4Mm1VRXVGSHBsMWg3TDVQMHpPbktFcDd3MXN0aVVjdkxWR3krS2Zu?=
 =?utf-8?B?eWliWDlkT0crTDVtaS9WNWRhRjIwVWxmSFlRWHA4ckNSZWsxcElzKytVU3U3?=
 =?utf-8?B?RnZjNnVZNTc1b2graHl2c2RvdkxOOU82MTZhcW5MZHhRclpJandzNHYxYVpX?=
 =?utf-8?B?Q29MN3hVeEhjYmFFWTJhOHR3aUdQSGhNMmN6MkhSeWhsTEc2QWtib01td3Q0?=
 =?utf-8?B?bC9xbkJOaHhhYkpZTVpHbG02SkFGbCtxU09LeDZzQXlZUGdnOEt3ekhaWVRN?=
 =?utf-8?B?ak9mbENzeUl3aUViakQ2WnFvMTUxdjlOOVd1VGI0d0N2a0R1NHJRSXVMam1Y?=
 =?utf-8?B?NXhtcnpUdTlwaDVUUm9TdENIQU11SEV2UXA1RXk3ZGI1Q08wOWZ5dEFnbDho?=
 =?utf-8?B?VXNidHNJVm53ZmVHMXhWaGMyZnB5NVdHazR1QUlOZWdTb085OHROaVJlVWJ2?=
 =?utf-8?B?MUlieFdxTXpZeURPWTBpQ0VNZ3dLejRLVUphTXh2VUowYjIwejN3UTA1UHA3?=
 =?utf-8?B?YmI1MmVUdEkreTJwVGpWRnBINW11Wll4d2g2bFE4ck9INEowekwvc1hIU1pM?=
 =?utf-8?B?YjZYeWRzK1JwMUwzaXJGZTFsQ1BFSzVqNE0zVCtuSm9tSDgvSVFQOXJvKzRh?=
 =?utf-8?B?VUlRcmtialVNVVNXc2o2eWlua01VYVYrMW1SK3JGYzVkTEZkcVI0S3BiRXpL?=
 =?utf-8?B?WndpaUROR2ZYSWNYMldUWWwySXQrSkJNMkNqbEJmbE5hbC93YVRSWnU4dzg5?=
 =?utf-8?B?dmg1WGJQdW1yUlExQUV4YWFFNzdhc2hLREFyNWJJRm5XTm9TbU1IZDZ3OGRM?=
 =?utf-8?B?bEpBTXR1bkU5RWRaK3ZTVXlwSDBRZ0RYZnlWVVlXMGNmU2FyMWtxOFB1Mm4z?=
 =?utf-8?B?VTV3RWFmTVM2dDBmSGFnOE04VkdvVThlbVkzTVNNZnN6UElnOUNzYkxCcUdJ?=
 =?utf-8?B?eTNxNXNyWEVLcGZqQ2hOOERLWmtRaHVLaUc3T3FYTk9yZkJMdm9YUXF3dEx3?=
 =?utf-8?B?bFZlS1VqSWRSbGl0RVprZUN3Y1VjN0hvdDZzZmpVeFBRQjdYSG5TL000VU1C?=
 =?utf-8?B?S0xya0lmemFJUmdhSkdDTXhoSGtyWENtVlhEUVZ6M3NlSzYxOG1uMVg2QnR1?=
 =?utf-8?B?OTNBRE12OHFqQ2dsd3BOOFdLTFNBd2txQitHSWpSaHZVQTByc0lhenlidnRo?=
 =?utf-8?B?eGhtV0FOR2dhWG1rRWdnTE5WT0I4alpkeVpnMFhRRjNHWFkzSzdQUzMyYWpr?=
 =?utf-8?B?QjMxZEdUQVJjM1hiNzhwRk96MTZLUGYwUGZjSHFBTUZKb1FuMk1PbUtxcG5V?=
 =?utf-8?B?ZG9sQkZscW0wTnN0WkhGdjhVL21NOE03clZrbDdBclU1YkhmOS84YktkZ0cr?=
 =?utf-8?Q?dpphsXXSlqB9oEg4n0YD4ZBcV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c48cd1-26c2-4fc6-ae1e-08dc11ff7eb2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 17:13:42.1813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8RBUH2kKuTg6nmX0rpw2yb18JWbmE4wlXH369lFaBjmwGpoTIerI2YT0CdfO1UzIG32iK0DRrnSPpxOBrrYNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6387
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

For the series:
Reviewed-by: Brian Welty <brian.welty@intel.com>

On 1/9/2024 5:24 PM, Matthew Brost wrote:
> Add build bug on and fix head / tail convetion for page fault and
> access counter queues. No functional changes.
> 
> Matthew Brost (4):
>    drm/xe: Add build on bug to assert page fault queue works
>    drm/xe: Invert page fault queue head / tail
>    drm/xe: Add build on bug to assert access counter queue works
>    drm/xe: Invert access counter queue head / tail
> 
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 38 ++++++++++++++++++----------
>   drivers/gpu/drm/xe/xe_gt_types.h     | 25 +++++++++---------
>   2 files changed, 37 insertions(+), 26 deletions(-)
> 
