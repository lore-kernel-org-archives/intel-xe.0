Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3719AEBFD03
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 06:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E163B10E330;
	Mon, 13 Apr 2026 06:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpIFWljj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B5E10E32B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 06:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776062876; x=1807598876;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=5t/2mdEu3TSj1R1jRJc5zH4pOLKUltdKRnWRnpO8YUY=;
 b=hpIFWljjaygbtBI+NomMtj8l75OWY6hEof2g9/6PR5dkqXpSxmOc1URB
 5BEn+gy7jW5pe6O/Idg1mSnPcsKHEgSn6cuzFKcxjm/bcbJkPBd2tQvxG
 /HQLRZz3fv5u4Eu7OjOZ+Pj+b2zfMXR0hqLUJTjIYlOV22r/clsBB6TX9
 n/s1+3X0lOuT73t63XvhumOM2CQoS0hGYNLpZsjmS3lXPeaZaxAMnKgt3
 4YxJdIi1knM7PJnysNnOt4lvuLR/iDOEEIrbBQl9ffjUjv9LEosepu9mB
 Jtejvjhdg8FI5KTh28fAdxR6U+S6BjstuSddr8bZhD5Fcod9akKYm6ehC Q==;
X-CSE-ConnectionGUID: aEhhURcCS82beDTGJ5XbRQ==
X-CSE-MsgGUID: 6hs0ett4SNqslgwq4uo0gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="99634177"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208,217";a="99634177"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 23:47:56 -0700
X-CSE-ConnectionGUID: KGNH6s+oTLq5FYmAA+uxgQ==
X-CSE-MsgGUID: GdxBY9UhT7+IZ32AbY9BPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
 d="scan'208,217";a="231424238"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 23:47:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 23:47:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 23:47:54 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 23:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfSiazlhmBPvHls4bwE/xj6uyVUtv3TovXePpEz16i3yWk6pKcYh3EocQ6XQutGfsSzOVfHCCyBLSnfOGQOFgmovbOsKfDbdFzEm0ZEfw8HkVC2Ud2zZLUzbO5rls4P/4Q1NFWPjZcyZXzvlRGuX/h9mVKzFkgTtcFSuliccZSEdspAHyKJak2VXNZXriqOfV7J/+KyGoU6dyq6owyEEu4fU586JfBxzcfSON/+gPng2vMFYuMMjkovkRq+9hK9xVSIIMAW5PW7V/Nve49OC4K4yFJ88ZedbjA22KWd28wsHZfw3MmqQb1WLxj3yJFOvfeU9g23HnytSYDF/o+Adng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FC1/lAv9sNc9lVmYJcFUmJj3sfAoEXMcpNbRJ6Hg3Q8=;
 b=QkB/JFVIIeTaeKPZz9YXSE7JDVb0t6KipzaCxSctwOV4B/lbVwlCch6GE4vLldbXem49YfMO7G60nLrtGlII9SpjsFVUPP+d4FYtTsZdt/RVU7LxHviR0L0FAG679UUqiAdh9F/rkAFn599/TWwOntXEIUxhu8SICup/K6qR8hmqp/03Xr1XRe7Cv7qJjwhBG4CBuazbcavutk8Q3Xk3NVI41Lh7zGiPnrPfUi/Vz5xxAKe18nSVq6q1f3yaoNcewj/+3o9Hc4e/zBKmi5sVHAD7mMzEJ60MWrAlLwWLAAt+02i7dVRHFi9MVarv5vczjV41dHoJTn+vXvsKnFZhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 06:47:50 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%3]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 06:47:50 +0000
Content-Type: multipart/alternative;
 boundary="------------uAJ9tNM6OD0H7ZfNKvgLz0WB"
Message-ID: <8c5a1396-1b4c-45ea-9eef-bb5bf0b61959@intel.com>
Date: Mon, 13 Apr 2026 12:17:43 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_USE_drm_mm_?=
 =?UTF-8?Q?instead_of_drm_SA_for_CCS_read/write_=28rev5=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
 <177582745121.449994.14673189284167295656@a3b018990fe9>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <177582745121.449994.14673189284167295656@a3b018990fe9>
X-ClientProxiedBy: MA5P287CA0055.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::8) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 3867cc29-0030-4dfe-386b-08de9928944c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|22082099003|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: V1/XQul/L787WbGGvRsuGfwTotgnr+ueR5vrKf2YXzxUSYMEDMNQ11N9wf1OUwQpc2ipnM7OMl6ZkD1msZr9oB/6uKo+J0HfB1d1TBWUAPXaAbHnSbQYQG/5QfywDRyso7njtRDTI1f9ld1O3rXyO/vbYcQhihbs7FyMTkXLP9TK5RRrcIdU5jR2kVvMVsUne/NsTv6DMBE68G0KSn7kF4iYV171LRY+bFMrQ1i5/8HG5WiTKAQa1lDHE8HA7yFeKdqNw8RsQxoOsc+QqoAgxspQV4dlybpB6kdDf+foiV+s8xBZbn5Ml/RerBba2TYoDTkipU7DZyissrQVMTN8O7tZOugvXxql1ebvPW3hIFMhmzJghHF8Urbi1yOX6H0W2tf+2npFHv81ghcJHZCRC3iWu1Jr8yvL7mkcnQu79CyjDI/GoL91Us137DcFh0H5AZxQrANkUE5fI5uQjKuEH5yOFDw68s9IN3JLl804s3XzqXRh+EMAAjL2bGvtxBrAKQ7lAIlRDFHdeS6y2wi6Xz88kP9Y+XJlgGcpYIe3eF/rfMlLIgWoIE5TBcTad7PB+2L7C0Vn9jN00pCs0u+rjfdMxk8T2PRjWsKikiLpFRmK+etM/lCUQ8pzmpZDZqSIjSa+rA4LySZIsv+KKxlSilLQgzUy5HHo9BzKNT//HRQOGc0+8YR30ByBzUGOQWyb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(22082099003)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFZPMDcya2FPYmdJQ1Vuc3hETEY2RUVxUUduaHduK0lHZm9pY3RuKzdYRzJ4?=
 =?utf-8?B?TEQrUUErTnppOE42MStrSHhZdEordFlSZGx2dlBaczVkRUZObUFBMDRIT3o0?=
 =?utf-8?B?dytwU2dRNE9XbXAwd0picjNYYmZlMmpub0xaK3VWRmpXMHBLUlJsVWNCN3l6?=
 =?utf-8?B?WXFReXpFeE9pa1lDQUlaMWUvczJrelBrVkNjMUdXdFNWQU1kbmdmNnFNUklk?=
 =?utf-8?B?ZGZIcGF3T1lnYmkwL2tJMjlVVmkvZ1ZIQnFmYWFNaDA3TjBycGVWVHNWelZR?=
 =?utf-8?B?ckJOVnh0djh4N2dEeUI0NkM1WjQ1YU9MamlrelR4am1nV0ZXUElCeHR4VkMr?=
 =?utf-8?B?dU1menUvNENqU2Q1SFZ4N1U5U0J5TjRpVnhFM0FGcmc3ZHFlN29KWXJ6MEgx?=
 =?utf-8?B?TFVGaHl6NmcvdTVqNjBZV1IxNGxhZ0hzOWU3Zzloc2FycXJTMnY0YlhVaEFF?=
 =?utf-8?B?UFMyblpSUituWVlnRXJiNmxxMWRYL1JQVEk2VXRaY0xXRng1MEd6MlB0R01j?=
 =?utf-8?B?MzlCRnRsc2Zha0VJWjJvWHBBRWNVYzFoWVFrNEw1dkNGK0FBdHlrS1BrYnFY?=
 =?utf-8?B?L0NJQklKMUllMitLM3lYc0s1RFJzVXNTZ1FaVkRlOWZpY3BmVzFlVzl5bmlv?=
 =?utf-8?B?QVVyTEJ0WDJDNU9QcXYyU1pSVTN5alozcnprdTZOdG1aR2dxdGV6VG04SGND?=
 =?utf-8?B?d0lzMHd5Q1ErR2NCaTZaMEpQUWVBMVl4b1RQQ1JuNVRQZTNzdm1tQU9tcFNL?=
 =?utf-8?B?b05BK3dNTnMxTkwzTjVNanBRVXExRDhlNGxFcWFjTTlDemYxZDhqaXlYVllo?=
 =?utf-8?B?WVMxWm9qc2RsS0JhQS9CSjRDRmhsREFZdFJydmZGcFFhRmtRL291SExKS1Fl?=
 =?utf-8?B?clZEaElRZTE0RTVpUmcwdEJBdWxBKzdmWGEvV0toOHM1SGllV0c2SXFqbzRF?=
 =?utf-8?B?MnFjWEdzSmRIUDRJWnUycTNyQXBxUXdiRzFFZU1CQVVyTVNlUkN3cFZpT3cw?=
 =?utf-8?B?cmFxK1B6bk1qNlc1ZGFDSnByVCtjMkNIZ2ZwRE1KVXVteEFZVXB4S0VWWVBB?=
 =?utf-8?B?TUZEb1dxY2VIRnJUWjNaWmZmZU5qVW1LM3NTMWZ0WVZnK3o0dVhyVEVQbTJP?=
 =?utf-8?B?MmtKVWV1Z29QNDl6dEJRWldaaXQ0eGc3WjZWV29MR1VnaC9FcitUNDY2OGpT?=
 =?utf-8?B?bkx1RDlUY1JiMnJCQVJFUDZoZ0tTOGordnMycHIwRE1rbldVUUVpV3Z6UUx1?=
 =?utf-8?B?Z1B3MEg2RDIrR2FCdFRxcUNzdUcrTUFOZ09qM1IrWDRBYXNtOUpBNGhvOWY4?=
 =?utf-8?B?RkVJNHhmS1F2bnRhaTVrRzZSQW9DU0lTWW84U0lYLzZWTDN3R000WEcrdTcv?=
 =?utf-8?B?cmNjeEhGNnBBaUQvd1F0eHdWSTNWS1lpNGpzc1gvZWhQYlFsRzlSTUdXc09J?=
 =?utf-8?B?M083ZGoveGIrQUxTU1Q2c3FmaFFiOGF0QXZVVlEya0pocE1lYWovbzZidU1m?=
 =?utf-8?B?VldjNmZJNjNWNEREeVYyQTE1MTJxdm8zUnlzMGNQeFA3SjlhbUdBdTZ4QVZC?=
 =?utf-8?B?M2t2d2N0a3NhN0plVnNaUDc1Lzg2Y0t0SG1PMGczaUlyQlpxQ2RJckVpKzU0?=
 =?utf-8?B?MDA0ME80a2tlTHdNMTRyYnB3SmZLYzlwZEIxVWQ2YlRoYUdxVE84ZjJVc3NT?=
 =?utf-8?B?SUlsemhWV0pjRG9vT0xBeVA3MnhJbEl3SkhLSGFGZlB6VzJBajJ0ejhxMEJZ?=
 =?utf-8?B?QzdpeHN5Y0V0Ui85NzUvQXhNOXZYSy82OGJnTElncnlrOS9RSlVEZzFlYTNv?=
 =?utf-8?B?NllCSmZ5cGxCV00vYUJseEFLQkhsYThPRk0ybFh2TlRETk5YOUovRkg2bC9m?=
 =?utf-8?B?eWFKSnpGa1Y5ZHBpaDM3TVdOUVJzYXN2Q1pTQThiVUVvMG04OWUrNlAzL25u?=
 =?utf-8?B?UngvR3RwVkxVY2pzMUozUm5rKzd5QmZMckd3VVZWMlJXMHFKT1FOM05sZHhk?=
 =?utf-8?B?M0YyTHVtNHYzSmFWbXJTc3VXUStzdWZFQkwvTkE3M25xSllZaVZIRVFENi9j?=
 =?utf-8?B?SFRWa0lTMDZCYU82Q2JRb0F6YkJqZ3plSHY3bFJ5ZUJZUGJXbVhWbGdVV002?=
 =?utf-8?B?clByakdWSGRkdlZhWEhtc0xMNFlId1d1M1RMRmxwZC9EZHRpSG9YL1VMOHh3?=
 =?utf-8?B?MTVTd2xnOEdlR095VW5lZW5JWXg4QVFKeUtqT2FoUDhDMHRsNDMyRTd2SXFL?=
 =?utf-8?B?enBaVWJ4RmNvbVpSTTF4aU5yQmRTUFBYSjg3VGpTRWFBNkNrMk5iaGlPdzU3?=
 =?utf-8?B?NHhsWmhlRHIxVnN4RURvU3lNV0RsQXdYL0pXNnBuVE1jWFhHMEJlWmU4RUNp?=
 =?utf-8?Q?V01IjhO4LH4YQ6Ng=3D?=
X-Exchange-RoutingPolicyChecked: jy45ACKvsNiNxSjn1HySQZrbs54tYcpfJW8CXv0gx68QVoPp6y/ixBF0p16eYeZgWRzfS9NY+zXT0zfuyJpltI2gizx3p9AkSHqEcnovcokXiCHFewNrOG+XBlKgJ+cBRBwe8DNQb3pm4EUaBrCMW4CssC4lFyY6WK+wMjLr/wGXA/DHZM3LjWxL5jprLaAZ72TV/GhNBvxdTjTgLDSj+zK9IUodiPSiZXdbzpWTn1NT4SqtDyGGNRR1tZTdv5/ers3RGw1d3iRdXi/aXMQBIdRIWMvbWxgPhX+z6OJVqwki+/rfwyHrc2YUf0VErQmFWwJShe2ybJsGvC3aTxuTHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3867cc29-0030-4dfe-386b-08de9928944c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 06:47:50.4723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLDl9WyTJPRkZPsIEq+ERXIsY4Ciu+d+OEjeR8D3tvT5u4o20MurmLN4gc8c8KLHPMlJtyQ0zMk3jkO1/A93uwvfGHJckqTIHcn4n/mwg1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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

--------------uAJ9tNM6OD0H7ZfNKvgLz0WB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10-Apr-26 6:54 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	USE drm mm instead of drm SA for CCS read/write (rev5)
> *URL:* 	https://patchwork.freedesktop.org/series/163588/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html
>
>
>   CI Bug Log - changes from
>   xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1_FULL ->
>   xe-pw-163588v5_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-163588v5_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-163588v5_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-163588v5_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>  *
>
>     igt@xe_exec_balancer@many-virtual-basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-6/igt@xe_exec_balancer@many-virtual-basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-6/igt@xe_exec_balancer@many-virtual-basic.html>
>
I have verified both these test cases on BMG and they work fine. I do 
not see any failure on my machine.

And changes from this series are not applicable to BMG.

- Satya.

>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-163588v5_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#7059
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059> /
>         Intel XE#7085
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#7621
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367> /
>         Intel XE#7354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354>)
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> /
>         Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286> /
>         Intel XE#6035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422> /
>         Intel XE#7442
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +7
>         other tests skip
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#6901
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901>)
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-modifier:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>  *
>
>     igt@kms_plane_cursor@primary:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-5/igt@kms_plane_cursor@primary.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-2/igt@kms_plane_cursor@primary.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545> /
>         Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652> /
>         Intel XE#7200
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200>) +1
>         other test abort
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#7340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#7402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_psr@fbc-psr-sprite-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +1
>         other test skip
>  *
>
>     igt@kms_sharpness_filter@filter-strength:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-3/igt@kms_vrr@flip-basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-2/igt@kms_vrr@flip-basic.html>
>         (Intel XE#4227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227> /
>         Intel XE#7397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397>) +1
>         other test fail
>  *
>
>     igt@xe_eudebug_online@single-step-one:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +2
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>  *
>
>     igt@xe_evict@evict-small-multi-queue-cm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-cm.html>
>         (Intel XE#7140
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>)
>  *
>
>     igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +2
>         other tests skip
>  *
>
>     igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>  *
>
>     igt@xe_query@multigpu-query-cs-cycles:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         (Intel XE#3718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718> /
>         Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         +1 other test pass
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545> /
>         Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652> /
>         Intel XE#7200
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html>
>
>
>         Warnings
>
>   * igt@kms_tiled_display@basic-test-pattern:
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729> /
>         Intel XE#7424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>
>
>     Build changes
>
>   * Linux: xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1 ->
>     xe-pw-163588v5
>
> IGT_8852: 8852
> xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1: 
> b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1
> xe-pw-163588v5: 163588v5
>
--------------uAJ9tNM6OD0H7ZfNKvgLz0WB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10-Apr-26 6:54 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177582745121.449994.14673189284167295656@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>USE drm mm instead of drm SA for CCS read/write (rev5)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/163588/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/163588/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1_FULL -&gt;
        xe-pw-163588v5_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-163588v5_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-163588v5_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-163588v5_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-virtual-basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-6/igt@xe_exec_balancer@many-virtual-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-6/igt@xe_exec_balancer@many-virtual-basic.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>I have verified both these test cases on BMG and they work fine.
      I do not see any failure on my machine.</p>
    <p>And changes from this series are not applicable to BMG.</p>
    <p>- Satya.</p>
    <blockquote type="cite" cite="mid:177582745121.449994.14673189284167295656@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-163588v5_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059" moz-do-not-send="true">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085" moz-do-not-send="true">Intel XE#7085</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621" moz-do-not-send="true">Intel XE#7621</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354" moz-do-not-send="true">Intel XE#7354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_content_protection@atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" moz-do-not-send="true">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374" moz-do-not-send="true">Intel XE#7374</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send="true">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035" moz-do-not-send="true">Intel XE#6035</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-send="true">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442" moz-do-not-send="true">Intel XE#7442</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356" moz-do-not-send="true">Intel XE#7356</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901" moz-do-not-send="true">Intel XE#6901</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send="true">Intel XE#7283</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-5/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-2/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545" moz-do-not-send="true">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652" moz-do-not-send="true">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200" moz-do-not-send="true">Intel XE#7200</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340" moz-do-not-send="true">Intel XE#7340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402" moz-do-not-send="true">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836" moz-do-not-send="true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_psr@fbc-psr-sprite-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-strength:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-3/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-2/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227" moz-do-not-send="true">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397" moz-do-not-send="true">Intel XE#7397</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step-one:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636" moz-do-not-send="true">Intel XE#7636</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send="true">Intel XE#6321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-multi-queue-cm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140" moz-do-not-send="true">Intel XE#7140</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372" moz-do-not-send="true">Intel XE#7372</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send="true">Intel XE#7136</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625" moz-do-not-send="true">Intel XE#5625</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-send="true">Intel XE#7138</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send="true">Intel XE#6964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-system:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370" moz-do-not-send="true">Intel XE#7370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-cs-cycles:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718" moz-do-not-send="true">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078" moz-do-not-send="true">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545" moz-do-not-send="true">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652" moz-do-not-send="true">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200" moz-do-not-send="true">Intel XE#7200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_tiled_display@basic-test-pattern:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send="true">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424" moz-do-not-send="true">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848" moz-do-not-send="true">Intel XE#5848</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1
          -&gt; xe-pw-163588v5</li>
      </ul>
      <p>IGT_8852: 8852<br>
        xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1:
        b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1<br>
        xe-pw-163588v5: 163588v5</p>
    </blockquote>
  </body>
</html>

--------------uAJ9tNM6OD0H7ZfNKvgLz0WB--
