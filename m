Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD1BC982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 14:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A1B10E2FB;
	Mon, 21 Sep 2026 14:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNqTcHPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB05A10E2FB
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789999405; x=1821535405;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SR1zChjozJ+K61hyQ++muOuygiJamTxTkTHf/bNqGOM=;
 b=SNqTcHPHnHNqDD2zQYx1hF9gJoXOahAKkZLsGXUX5lNj99ryw4ROPt6p
 S7kUwF1AjUz6dgWLRJZRUMtnpOU+dcQFavawdb9zvtSfLsqLzf+OXcoIU
 ycoBJsNB8nKfwJ7aDU5gWFsHJISiqX+tPpHewrqA/XGfGUTIl/22iQrnK
 XFkkN1jH5spQ//6TmBqgftABw58e3m8oliIYFT9wlNLAnu+grGUsK+yws
 9wrKc1n00oJebk3W3o+cXKV5ZrSUxbre1AWJ2DyDmqNU0FdEaQPGjN2vQ
 ONnq0gU0DQblFtpT6n/Y5nI51jhikoSk5O7LigmwiF2JhG7rWRWAlomHn w==;
X-CSE-ConnectionGUID: 9I9cu0ShQbSBPrL5jqjY6g==
X-CSE-MsgGUID: H/P/lCn0Qtq/PdZjTzseTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89438869"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89438869"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:03:24 -0700
X-CSE-ConnectionGUID: HP34h7XYQ02ViZ9eWYHfJg==
X-CSE-MsgGUID: ZujnHYyFS9m62UqMwM/c4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271846339"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:03:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:03:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 07:03:24 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:03:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cggbIrwWGMy5unhZZdMcU7c/Go+ClijMa0A66hIozofmeoyXnlB2KhOTAQCdwo+6aijIgC3N7x0csYSYzQjDJOyBXcviWX6vsHASBaLj1lr93i/2x/CkIIRNJOANTvTYZBYQ3YtO6G9myTbkJ0vg+zqXnKISqo6XyO+x5Jp1cY2RVSvE1Wlj0prZ1VF2b2lkck3jgRX1xFHWKczI5ipwi5rhB9zuRVUgO8hkQv/GFHIIM0+3pbH0+1sQsehQLoWRE0VUQQOJen7k4/ErlOOyz8lu6Xn6fNF7BK0lr+XkVZP3nzm/+hhxxjj6yXjlj7+CVPcQiVOIipKgaBOAtTMLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka/y+rolN34t2LIjsXCzQkkrU/NLk9204xPI69o7Y8s=;
 b=se5IRQwNjXEt/0brsfAmfeEmVj54jQIlBZrnnhow/iQ8zJZtB7dJmRCG+rVCEIqiuwdiFnotoGXrHTkfveC1hLArJ+inDo8L0AKfNjj/xhAOMmh/j95FbhcXUMO9/CFuGJgaYIMA4INev9SMGh3+LHBNV4skxGnljk3b74rvQVZnfZYvSzzessn0SpC1D4wICqaV7f9Ro79jeiSNmGNG6FpKxpEE05SG3VBpWUDiqVLJqHLGmFO4b1u4jMlmXUlwbjjVmaXHLEHEx2Iv8CynOdwzuI1QRpcZSMOU1OolJFLsOZdNVkDyb11/8wz3jen4IML6nFgWvzHv3AZ3+X8a4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:03:21 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0428.009; Mon, 21 Sep 2026
 14:03:21 +0000
Message-ID: <4faf44b6-c321-4ce3-a88f-01fa442f58bd@intel.com>
Date: Mon, 21 Sep 2026 16:03:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/10] drm/xe/ggtt: Avoid integer overflow when
 validating VF GGTT range
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Sashiko <sashiko-bot@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <dev@lankhorst.se>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
 <20260921092101.1243989-17-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260921092101.1243989-17-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008A9.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::649) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d251ee-7500-4b1c-b521-08df17e91868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 8R8E4/koTZSh551szVTjiqqU3sCuLhJdpJIza/4bJG5Xt/ybDKfouIduvtATXZ/JLLnBPLNktSnAxKnFkSChHTGL548EMHt73qQl9paKdOS0NtVz2BlOKXhqM2EefTG7uEg6QIftYObb2KvWGnZZhYRUnI4CwjCRGbTmsFHq1QicKauEU5KaBsYSZOi86bkB+kW40cVJMsxJ9+8O3qoEPsUACf7QgCb+YL0N6VaJ6Vvaghaab7LMIObx1NMl6q/pP0qohhUOebJByiw2qi5WbUsPYVv9P1ihtUU1vBBb4qwmieyZEHqqMV87+RPrfVO0GYFHdb0cTCpl4KcaL2gQ9KvDBiySa7WIvXEJui60mPxzXz8hXx9MYcGyvzj0cSTjhOMG86NzqfdWlLKCqSjRy5dvP0IXke7wjHb+3k0v5IJcMRcRV7IG8dMxqK3dMmAVTxkq3Pno6Xvs77RP+tyz17AuUOxkNTA+x4tw9aiqaNK71dL0jyGsSqIxC1lWQd3AOe8ohnyVwxjRDsiFeYTX0VDoXDmTSs0sn3iFsl/iEWZd3YEbFsG3prVl/cchh85nevTT27uLHrH51L+qd9aiOC32KJMBXcHspIcBaIP4oes=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNZbCtsUGZxTml3dnhUemNadmtBT1E3UXkySWtPM1JtTmJiTVlXVGgvUCtO?=
 =?utf-8?B?ZUtzSHd4cXkwVmRRZkpjeWtkdytqd1l3VFR4VzYybUhIQkNCamFKamlmb0tF?=
 =?utf-8?B?NmF5Z2wzdGNIdUlVUU54SjQzeFROZW9TY1JvWEM0eFozbk0yNFB3Wnc2RkZQ?=
 =?utf-8?B?K1MxMTFiSDd5RXd5MnNXRjk5OXJMU084cmRsWG9iakwrWlRBZUZlb0J4d2Nu?=
 =?utf-8?B?ZVcvY2FNNHpUUllycFg5SGx3aHhMcmhhNm1aN1Z0RHUzUnI3bC9YRUt1Z3gz?=
 =?utf-8?B?bUtsWGtna002SXpDU3VVZjVNa3VBSmNZMitBOXBvek1DbFZNaSs1bzhGNHNC?=
 =?utf-8?B?OTBOcTJWbm1yZjRnTFRFZFpUTmZqNi9zdStid3BHNmdSRVQ4Ti92cVd3a1BY?=
 =?utf-8?B?RDg3THhsVllqUDZJYWRsMFdBbGc1aWE2UEE5Z2dxYllGVDI1RExhaUZCWXZN?=
 =?utf-8?B?N2dFSWduMk9XK01JRDFkSHVXL0ZiNHFEMWlsZ2ZFanFqRjlRckdjVm5TbzQ0?=
 =?utf-8?B?a0xFZFo2Unh0QUtnd1RjU0FPVGkvT1FMbmVBV3BXVjhqZGNibDJZeTd1ellI?=
 =?utf-8?B?eW5aU25OeTByQnJNWkpKT056NHJJcXpzVTZUNGc0UWNxRHdjRWRUcjdCK05u?=
 =?utf-8?B?Q3RndlVEaWVQY25ZKzlDcFZsamVuU3I4bHVRT3BtUkd4UHA2c0c4NWJIalBQ?=
 =?utf-8?B?dXdlVnVUeXBpUEsrMFBEUDR0a0tCTlFEcFdic3VhZ3pVVjUydkJaTmZmcDMw?=
 =?utf-8?B?NnpFcEd0MC9sODNNUW1FSmFaVk4wWmFnTGNCcDEranFVdTFaMHlTNjZJdW5L?=
 =?utf-8?B?U2ROUTVNZlRLWS9YWUluVGFPbFZvYVdiVjBVNHdiWnovNmlXR0tqakUyVVpx?=
 =?utf-8?B?QVlua3JxZndvWHpacWlCQ05RMWRUZ0NzQWxVV2NQa0pIVDgwMTdkQ2RoV0dW?=
 =?utf-8?B?clR2YUFVdmhpVDJHL2libVVqc1EybldOdHRZYzZVb1A4dk9KV3JueHJIOHlO?=
 =?utf-8?B?dDB3YXE4bTBRTHFpSzFPSzFhK0NjRW1kOGFvNHhRclZkT3djcU5IbVlHcGt0?=
 =?utf-8?B?aHdka3k4VHd3aXdWelhSY2ZJYm52THI1ZldKY2FKZG9WQW9FUy9laGE5MXpv?=
 =?utf-8?B?a3ZKOHV2azBlUFlmeWxDc01HRXc4K3dqMmZxOU9uSWE3QlNYTDZON0hVektr?=
 =?utf-8?B?WkhESm9QUHVleTcrMGs0SnIvdm5STlJtaU51eWNpbFdEd2JBVWJRbnQ3OUxL?=
 =?utf-8?B?UHlpQldKRnJLS2tNVUE3Z1g3K2Z3aEt5UVNIV3FuUzAwQkIvZ1hMYnFpdkF1?=
 =?utf-8?B?QUFhY2JIU01SaHJNZzYra3h6VDRvamVhYnFGNVMwcVRZWWZjaVpxYXlVemh0?=
 =?utf-8?B?elQ3QWRvdCtJdXJmc0tUODdrajdoS2x4L3R5U2lETnRJVmlWMlVrVjlHUWFD?=
 =?utf-8?B?dU5zampXU3dZcEhHQlQ2VUFrZm5TZ0xqWFcvV0ZhM1ZLRFN0RWVmRkJJV3ZC?=
 =?utf-8?B?bFhlNEFtcEpEaENtcjB3WkVlancwUVJ1MXdQTWxIbm1nNUFSdGs1N1ZBQUhn?=
 =?utf-8?B?SHdSZ0NhN3B6NG56dnV6YWY3VGpzZ0dFZ1VDdGkvaFVMc3lpS1NLcHVmVUJ3?=
 =?utf-8?B?MDF2QmMzbWIrUVhpRi9JYmE0bCs1RDhiUlBCN0c2MWFINFcwdXJ2bVFmeTUr?=
 =?utf-8?B?T2tPaGhRNnpSVTdFOVM3WFlYNXBMd0Y4UjNvcHU5elFROUFzOGdBWWFxT1VR?=
 =?utf-8?B?MUlJdkRPMHBuQnpvMER5dzJlT2Jjdk5BeEg5UFRvT3ZZNDltNklweUkveGI4?=
 =?utf-8?B?K3ZZdldGRDJEY1hieTBkVmk3TjBMdFhSd09BWTFQOUJ3TWxqT1RqeUhkemxW?=
 =?utf-8?B?QXBNS1pGWlMxem5FbCtQNkVUR0ZhZ21zK1NTRGk1RmRuMnFlaGpKU3ppV01I?=
 =?utf-8?B?S1FzQ1pYblNBTU1PczV4aFhSdUdrTDFsbER1ZXFJOG01VUNhdFc2T0xnQVdv?=
 =?utf-8?B?KzFlS2ViTkFTSFMzd0UrL3BqZlBpSURnYlNoL2NPTW1PRkdPekF0bENEQWtj?=
 =?utf-8?B?WSt0SWxUaDRGQkNzY2J4L2oxcmhHamhlTTI2TmRPdGR2Z3Y4TFJ4N3dUeTkv?=
 =?utf-8?B?bUNiY1VLV0ZpdnYrQ2lETmFiQU9QVnE4NnU4SzZUdEpyNGVDVEo4djhDdnl4?=
 =?utf-8?B?YU5VNVhlTmhxKzg4eENJbThSVTFrVWhYM1E3QXRhTEZqT2FUdmxRKzJJRy9h?=
 =?utf-8?B?Umo3K3YxMnJOaUpzNTh5WFFSekhSU2R2ZjdnQ21UK2hWNDFQK0hObC9Ya0lu?=
 =?utf-8?B?aGtBZnBUbXBxd1FBUlM4UUFEUzg1RklNOUdOeDQrcHpLUjd0RVQrU25yNGFh?=
 =?utf-8?Q?t0ikJVzvw7u5aD+4=3D?=
X-Exchange-RoutingPolicyChecked: pABeDjTD/8lrqyMYQ1wG9fH4TOU81DyJJRAQQXho3ADZdqmdT/fWT/wAyKmITh6O7j5YgzRpDdaDfO8TYD8607xfVt6VP4jX3qXjMDaBX79+1sKVZ1v+K7v4l7LT+R+WXBA3GxxzF7wXFtCtonV9c8j056rSrrkPz0pDrd6tjVKDrFfqFWoa3tLzSc+SmqSvnD6SBaeI8fCVtuFpvSUXSojzbkIGilYNOmT96X2erV3Qb1viVEP79ZS+ewm51b/l50pZlnjNNj7GpelE8sT9lk55Fq0UiCdqjun6lcLHhgiDxhMTjwnGyjnd4BmmtWdHe4dUvbGNN58YQuMmWQ1BNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d251ee-7500-4b1c-b521-08df17e91868
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:03:21.5277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1cuDJOXE1Lqles74tuDKTrsSEjhMouMSYtbu/TqWEBK/fmXC+zMXTMqN87qW3TL+c4ZgzTw09PlILvQPnyrggb/TdaRvWvKdgs7ZC5vhyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
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



On 9/21/2026 11:21 AM, Satyanarayana K V P wrote:
> Use check_add_overflow() for the VF range check, and rearrange the
> subsequent clamping into the subtraction form so the expression
> does not overflow.
> 
> Fixes: e904c56ba6e0 ("drm/xe: Rewrite GGTT VF initialization")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260728095026.2197333-6-satyanarayana.k.v.p%40intel.com
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
> V9 -> V10:
> - Cleanup old stale code added in the previous revision.
> 
> V8 -> V9:
> - Fixed review comments (Michal W).
> - Used check_add_overflow() for range checks (Michal W).
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7cac01cef1ee..2557e51bb7cc 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -8,6 +8,7 @@
>  #include <kunit/visibility.h>
>  #include <linux/fault-inject.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/overflow.h>
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_drv.h>
> @@ -393,8 +394,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	u64 ggtt_start, ggtt_size, ggtt_end;
> +	u64 wopcm = xe_wopcm_size(xe);
>  	unsigned int gsm_size;
> -	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
>  	int err;
>  
>  	if (!IS_SRIOV_VF(xe)) {
> @@ -408,14 +410,21 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		}
>  		ggtt_start = wopcm;
>  		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;

nit: if we are paranoid, shouldn't we use check_mul_overflow() too?
nit: one day, we should change this magic 8 into sizeof(u64)
nit: shouldn't we check/assert that GSM covers more than just WOPCM?

then:

		if (check_mul_overflow(gsm_size / sizeof(u64),
					XE_PAGE_SIZE, &ggtt_end) ||
		    ggtt_end > GUC_GGTT_TOP) {
			ggtt_end = GUC_GGTT_TOP;
		} else if (ggtt_end < wopcm) {
			xe_tile_err(tile, "Hardware reported too small GGTT %llu\n", ..
			return -ENOSPC;
		}

  		ggtt_start = wopcm;
		ggtt_size = ggtt_end - ggtt_start;

or

	u64 gsm_to_ggtt_size(unsigned int gsm_size)
	{
		u64 ggtt_size;

		if (WARN_ONCE(check_mul_overflow(gsm_size / sizeof(u64),
						 XE_PAGE_SIZE, &ggtt_size)))
			return SZ_4G;
		return ggtt_size;
	}


		ggtt_end = min(GUC_GGTT_TOP, gsm_to_ggtt_size(gsm_size));
		if (ggtt_end < wopcm) {
			xe_tile_err(tile, "Hardware reported too small GGTT %llu\n", ..
			return -ENOSPC;
		}

  		ggtt_start = wopcm;
		ggtt_size = ggtt_end - ggtt_start;


> +
> +		if (check_add_overflow(ggtt_start, ggtt_size, &ggtt_end) ||
> +		    ggtt_end > GUC_GGTT_TOP)
> +			ggtt_size = GUC_GGTT_TOP - ggtt_start;
> +
>  	} else {
>  		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
>  		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
>  
>  		if (ggtt_start < wopcm ||
> -		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
> -			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
> -				    ggtt_start, ggtt_start + ggtt_size - 1);
> +		    check_add_overflow(ggtt_start, ggtt_size, &ggtt_end) ||
> +		    ggtt_end > GUC_GGTT_TOP) {
> +			xe_tile_err(ggtt->tile,
> +				    "Invalid GGTT configuration: base %#llx, size %#llx\n",
> +				    ggtt_start, ggtt_size);
>  			return -ERANGE;
>  		}
>  	}
> @@ -424,9 +433,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (xe_vram_needs_64k(xe))
>  		ggtt->flags |= XE_GGTT_FLAGS_64K;
>  
> -	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
> -		ggtt_size = GUC_GGTT_TOP - ggtt_start;
> -
>  	if (GRAPHICS_VERx100(xe) >= 1270)
>  		ggtt->pt_ops =
>  			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||

