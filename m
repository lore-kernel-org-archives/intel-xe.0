Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D43FCE068
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF9810E915;
	Thu, 26 Feb 2026 12:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZU+HAkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256210E915
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772109230; x=1803645230;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fp2pYZfg8EqfCXHCAFlMXOmMH+EkJvmBJLJV2UG+oG4=;
 b=WZU+HAkDzNG+59pv70fvo1jceP/DDmGlnt2+wPezoC5UFl1JJP0Gf86L
 oCMa1bDWJrGnl8OvK13vQr+StWQKmNO0nKRHfbkh5cTK4LvDE447dVfAp
 pghV1u7gZSWobAhJ0lIaiwsmMiQ/Zi0YWfM3GH57o8kpzBtSeNH3XQJ/c
 tqbNLIg3+x6yVhTqL357E2KN50LZcG7pBhHSSPWJGPbpVi6ag14iYjmtI
 icmDREfAjyaEQqtATvpm+ORe7J6b3O4k6UZ4xYxPSware6lzVwEZn02Yi
 u7YmoV8rJQSHDL8dCrR/hULd1ZJXolpWkXUXfQRpIKgUfN/LKdxF9JWRR A==;
X-CSE-ConnectionGUID: QMJki0N0QTm0o5HBwZuGTA==
X-CSE-MsgGUID: fG3xeHFrROKKoF+Nc9Ivlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72202240"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72202240"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:33:50 -0800
X-CSE-ConnectionGUID: 1QjbqByGRe6ypVis9kcGxg==
X-CSE-MsgGUID: mPV6MOXUQGiRkj6/vtNN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221545229"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:33:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:33:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 04:33:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:33:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxE+ykPxQkvlNDL6RW9pMZNFVR1j7rQyx0JffFcV8hXafRr7pT1a/C2qAjB+gp/61mzmxyDBY16Od6LT6d9QgaBwtUvwvn/V9DePUTRqEjhCOruQlW8V/G+fix8tzR+CsWJo//quP8FhzXHbMdaSW8oqxrmmaosJB+9abRavTmV+B2J83twWJ3sYqw5TbWT98iclGy4eTTkO+gerwnHfnIIAdz0gwRVLxIZcB7Yu/sFoMvPsdTI//Rpty6wZNLrlWw/bqk5dVPK6kG/izk0E60hryoTgSNkjhXRPeGhhZ5hNacWAtwy6H3UYeLpPXwS/07zyv5HnNC2joe+0gq/3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8x54ZjslwMAme4MWHFrJXLlbDldU1QsWuE/B5+3SJc=;
 b=yoXRoR5e9LA/DP05AzGkNYS4JJs3UmkneQ3Q8EXS+12+oscNOVlFVNX3omWS108/FkO6xftTD//k7KgFdeph3oOefDrtGdl8YqvV75IN2nn0Rr/b+QMdjlVSpvdwFqLdAbTugOtXfgSG+x4kqtamZLSyX4tQ6/YNDzjkj1qhoQGsqEkq3doQlYUumRnE/NQObCdA56mLMAzYO9EilknDckFWSuPdv8Tl42akH5J36pLnggY+2DZaeq5/BcEwPB3hA9+5ZbQ0X7vPoEwoBHQpE3afUlyadrvxSFPaj3plyGPBLCLvqPYwxWEBKQG3Mn2439+/Qq/LB9WVWJo/XSuF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 12:33:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 12:33:40 +0000
Message-ID: <334a019a-06dc-4979-9c68-78c9d4a007b7@intel.com>
Date: Thu, 26 Feb 2026 13:33:37 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IERv?=
 =?UTF-8?Q?n=27t_expose_display_modparam_if_no_display_support?=
To: <intel-xe@lists.freedesktop.org>
References: <20260216183240.1308-1-michal.wajdeczko@intel.com>
 <177128382240.256994.8303814739819454363@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177128382240.256994.8303814739819454363@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0077.eurprd03.prod.outlook.com
 (2603:10a6:803:50::48) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL1PR11MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 306ccdb6-1171-4b77-4ac0-08de753345c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: GZeBa1LOsZlTWImLaYlFO7Yy87dkZArQ1/fKCg6x6BmM07SUyBPtu0rgAx+j7BbpDT5rXBtxcZjzJt4xfZalnV4W59jsJC7MoDKkLpiz0LBMBaE9wJzi/tXQdIbA8ZD6MduwZPOX7RALXjm8Llr6VaX7UGaVvLmw822RRy0sTBkwpliJObV8KU/S0Mwm/4/sbDm7KpDSyaa0rItVxVnBaMjro/qHXm34WJffITkupCkMTPaPEvFAeSiCFyQLkFuApMzSxfiwyIzC28yAp9GNERdth/+10JNdc/m6W1BQ+mv+aQbe1WhxMjjZOTUSVa16kcx5rtRs+Q7AOMb6+H2McMJu2kTWjymjUbqfmDV5yyIfQqr2On8lJf0tkIm5J8CMaxhx4HdxmRl9UW/s94Ts4D49rPxYAYG/nO7WjSyWJVoPMSRX8sy0OlNkck5/nUZEobQPiLZSgQDCrDAi3WFkjwLqsb/XGUnduR+qJP3RJyShatAEjMza6OQBSY0sWH8U+SgtBtZc3QgpP9VxdBp5/2KLmm7ZBmmjv/HSd/WAKBY4IkD2RfMkufcdeXlXJ9r6zF74xWW0n8FwySIXWv0I7aYzfdnxShGyb74XxbC3yzqDyOP7D/z+j04px7X1/3YBdhwBUHq6T2ax8T8Id/Ume6mGmQCwupkNIBO8IHAXJsQYWRgIReWe0ry40eD+xKtP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkF0U3UycUlSR0RwUFZKYTZwbzR4ZlF4SmhNYWJMQ2F0V1B2QzFkaG5HMEN3?=
 =?utf-8?B?WStaZnVOWjhVWnc2K3VhUW9wQzBJdGxSL0o2aGRoYnIzdm5UUlB5NkJldVhL?=
 =?utf-8?B?K1kwVTRCOTkwVUNZSWdyZGd3WU1NZTIvZFoyQ3diMHFpT09aRzNkVkNpWnB5?=
 =?utf-8?B?QldFNEQzTXdHMzdaMzh1UjVoRktvandUUHBZcmpySTJHRUh6d0NVZklVVkp0?=
 =?utf-8?B?dzJxUWZsdmRTbUhiUk0xQTF3WjFzLzN4dVJJQXVveVRDejdoNzN2a1RKZ2pK?=
 =?utf-8?B?bHkrTmFlTUFpbUUxWURVY2haMlp3Q251S2Q3Tk9TSUdXQUVtMERaMkpjUWVX?=
 =?utf-8?B?TVRrVVlleFUyRGdvVDU3TFNMaC9DbzRwWWd0eWNQMHRCOE5rSGMyUWV2MDhQ?=
 =?utf-8?B?U3FzcmJkV0YxeDdOc2tMWWhReU9VWFRJME5WcE1GeUF2TWswdmpmSnlwcHRU?=
 =?utf-8?B?Q1g3ZzRmdCs2MzZtNjhQb2tVeXhHRWdWa1VFenpmQkY0aSsrWVFUMFdBTEhj?=
 =?utf-8?B?T0c1VXRrWUpJd0htSEE2VXRRZWYvRGlEZWdhNzNBc2F0dEVvZDFWL1lHVnA3?=
 =?utf-8?B?NFNHZUtxckc2d0RTZXptYjhkZC93MkNQSTNvNjk1d1NDdWlPVGdvZXI2TkpD?=
 =?utf-8?B?blBhcXZBR1MzR0FyWXZHNWkrNDdya05UUWpBamFjVzJQOEREc2cxY1Znd0Mw?=
 =?utf-8?B?WlZyMUtnN0dFVFZOSWgwZ2cxaEVLZHZjVW8zYUFYamFiaWV4UHRDOENHNFpD?=
 =?utf-8?B?eGhENjltM0VjKzVzaGlkTFJyK1hSd3E1eGRlTzFHbHViUTNiZkFzR0Z5eVpr?=
 =?utf-8?B?cVgyRnlQb3JPTjRyWDBHZDhrK3o0MVVwRWtRdGd3NkRNVW91dW9YRVZmSXNj?=
 =?utf-8?B?aWZHSGVuc2dKQlJIMzRnTUtFTEFGQnNmZjZBRktvVnp3L3JpdWk5RkRoeitT?=
 =?utf-8?B?RGRPcFZodTFucWlZcXFWQUdrckhtWnJwanhIOVhnQTZib0RLWUJxWlFTTVNC?=
 =?utf-8?B?UTMzRm9CdGVKdzNkMk1CUmU1dmFyenB2RWs1L3pJTDR2bmxaRElpMjhsVk90?=
 =?utf-8?B?RnFpR3RGSFVSK3NZL2VleFdJcU1tOUVERHJTb0hwYUhNMGs5ZHR1bjZxWUNG?=
 =?utf-8?B?dkxLU3A1bUYvRk9HUmdJVmpoYTZETzRyWFRrNVlFeThMN01kblc3VmRTVEJS?=
 =?utf-8?B?UndibHdBdkV1cUJiSVJ1TFd3K0k5TmtlQXVHcjNITE40Rk12bDRpZldRcEV6?=
 =?utf-8?B?aGVIVkcxdUlrQUVHcHVIb2hja3dMOTZJS2lmNjlMT0JlREJVSG9pOFFVcXNl?=
 =?utf-8?B?YllGMGl1ejBWd2YrbW85VEFhd1I2ZHhLbTNFS0pmT1llaDA0VCtkNFBPYXoy?=
 =?utf-8?B?RjNLbVZsWkVLdkVaWE41aTZTNFNDUVRYYnFtdzc3OUU0ekIwVFV2QXh2YWxY?=
 =?utf-8?B?Q1diemU2eThqeVNyc1JXdW9EckVPSWduNFVSMlo3ay9lYk9tVkx1bC96c1l4?=
 =?utf-8?B?YVFXZzYvWGIxVzlnZGNab01aNHVNU2hkTzhuYThTQjVnc0JSTks1N1Z1UHhB?=
 =?utf-8?B?UnZ0ZHBrd3NxVis2aVE3VjAxODNXTUFXTElHSEtYYXIwdEZpaEltWmtRVm05?=
 =?utf-8?B?eEI1d1dYeVlNeEk1Ni83UUQxVUsydDVSK0hLV2wzSHhtQXhjM1V4WVJOL0pH?=
 =?utf-8?B?YkNEQldWdk1WRWh1TzVMSFpvM1hjek1ZS05ldXBlTDh4L2NzalVjeHNkdEFI?=
 =?utf-8?B?QW92Tittb3JpZVVVOC9xTVRhY0FEQmY0TXVUL20xZmxuRk0wMnFmS3RDTi9o?=
 =?utf-8?B?ZFpSTjAvKzYyT09LYWtra0hYa2l3QWJkVUhtUHYvdUhwbnljS3JzVU9CTkh6?=
 =?utf-8?B?T3ViRDdKekhTMEhCS3VjV2JCSWQrbDF1WitoYU1yME5kMUNIdmlURURVS3lw?=
 =?utf-8?B?QzRVSzZ3eHRWY1pKUjlSVWtnNHRrcy9PV2Q1N2Z3UkUvbjg3dm5yK2pyMmcr?=
 =?utf-8?B?L3NsV0pnejhhdGwwdWxHZ1pYMUsvNVRnWnNUeFIxY0RGVXBjOHo0Skc5STR3?=
 =?utf-8?B?d2dDc2tML0ZxSmVzN0U5a3NYYjY1SmZVUDFqb3ZJdHJkUFI1Q1A4eENOdXNn?=
 =?utf-8?B?NFNaNmd1dCtnM214cHAwU2JZR1grdVpVcXN1eUJscG9CWlR0WVVxWlh2KzN3?=
 =?utf-8?B?SU1Pc1ZjcDJpaVZpSkVGYTc1R21UV1pvenI4bzVScU16aTRacXVuSHFkVlN1?=
 =?utf-8?B?bHQwblJRSWRuTnpPbXRRaHcyL3dGTmRJRk1QVXFxNTJBMEZmQkxlazFFSHdM?=
 =?utf-8?B?QmppUms2YmRZcFBUa0VYZHZzWktWc0s2OS8xdXY4T1dadmYrL0cvQlBGSlNN?=
 =?utf-8?Q?KRuyTIYvTlS88Smc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 306ccdb6-1171-4b77-4ac0-08de753345c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 12:33:40.9090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SoIRgiAPYgQODrnDJAYE5Nes/7NztCvfgz4WFGGw/8OmcLM5eToTmrttKRLBkCV5GGpj6Ke9SB2na2ZhHMIWua6HK0AvVqnGn0JPHgaPpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
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



On 2/17/2026 12:17 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Don't expose display modparam if no display support
> *URL:*	https://patchwork.freedesktop.org/series/161666/ <https://patchwork.freedesktop.org/series/161666/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161666v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161666v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c_FULL -> xe-pw-161666v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-161666v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-161666v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-161666v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

unrelated

> 
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161666v1/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html> +1 other test incomplete

no errors in dmesg, looks like a CI glitch

Starting subtest: cursor-suspend
Starting dynamic subtest: pipe-A-DP-2
Dynamic subtest pipe-A-DP-2: SUCCESS (3.621s)
Starting dynamic subtest: pipe-D-DP-2


>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161666v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html>

<3> [517.609394] xe 0000:03:00.0: [drm] *ERROR* Failed to bring PHY F to idle.
<4> [517.735648] xe 0000:03:00.0: [drm] energy read from pmt failed, ret -19


>   *
> 
>     igt@xe_pmu@gt-frequency:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4563-483cf2d774a08fdf83f0e4c7a6ab671a53656d3c/shard-lnl-1/igt@xe_pmu@gt-frequency.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161666v1/shard-lnl-7/igt@xe_pmu@gt-frequency.html> +1 other test fail

(xe_pmu:4993) CRITICAL: Test assertion failure function test_gt_frequency, file ../tests/intel/xe_pmu.c:961:
(xe_pmu:4993) CRITICAL: Failed assertion: current_min == orig_min || current_min == orig_rpe
Dynamic subtest gt0 failed.


