Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C6EC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9214010EAF1;
	Wed, 16 Sep 2026 13:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAd7y7e0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1A810EAF0;
 Wed, 16 Sep 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789565138; x=1821101138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gTrmbgCEW1CtZvaNI3gVlifVNCkqN0Y9IAgdO/S/b/w=;
 b=BAd7y7e0FRLHIl4fiC4VX/TytC0Nmi0a+uZTBth2Xo4vdUGrMSdH3H+N
 vEsguVN+60ETLPPzj0QRm20tCavkhJBvz10iT9++aiRa4IlJW//Y1Evms
 2/sia458KqasAAGkKyTFC1bcQBsJbgDrGYtqvLAWSnyhDCqeNxl/HYVJ4
 i5+vc7PRnCQQjlfLYFlDXd9IAfNA1eIIp4/Dv2n4NECzotT7wfcAFarnv
 4qqvHQB7nmicFR6zaCjCxo58EcD8N/ToL1cCUP6X6uc/QNY0TqZ6lF/2j
 MbNdoke/5vWI7846qKrCSndPVnN6ggIAagAKbG5EuZcJq+bfQ8Xhtf4GQ g==;
X-CSE-ConnectionGUID: RKu+io1KTwyNQhdZuWbyAg==
X-CSE-MsgGUID: D1BLwD1VSc22DreW8eOykg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="449461"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="449461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:25:37 -0700
X-CSE-ConnectionGUID: UoaBNEoBQqaXtHyxf7grcg==
X-CSE-MsgGUID: RS+3LHcfT7uDKEM3/Oo80g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298408496"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:25:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:25:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:25:37 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHVxShq6p/sDZXTokTB8f6Xt/r86TcPMyu0Ts5mLsQGAW6k3UkRi1rtVi37WntM1B6lnTuVNax3AX20HI3jxzbgapE6A2RXFTakOUTj9+2I/3rPlKbcR2/BWTlz7KRlv3erqfNXz1Ps7Hu1zB8kBHac/PmxcOgFqyScV7GoCbJ5M3aSYc5IWEOdb9fsEKHfS+mvxOP9wvg57YsWOMYI0z6rTCr+62UrzkEoUUYhCq36MM1Qm8d3kh/5Ur5pncpsygS7E3Uh91FNsUI2/1Pb3/kZBK3wAGhHjYgofD4oIrxaSDlyxTFRQKmJTdZKEQ6dCvFS+TaII4rFi6LW+PU4WKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOXjrVyXIFzQWjtmJXwXFmsyu6040o+vCQzl9XsNatw=;
 b=xcD3WNdfgV8xsyzcnKANfuIIKDu4mvx9cUECWM+uW5WeQ673k6DByJI8GA4Fl2ZTxVx6HDhu+H7hay8nyZIl0OWHEqGi4cB1iRmV5UO5CRJmKL1TxDqURv/X+RGuekk5CFnzKM/9f2RBj0F/z2PrZjR1ROkacT14V3e2KJ3uN47TJ4ATvuFWfxrsyrKi+3jpzqN8UUbXA3+FwJtwL+03zapfQV7PH3Gm3ZD3fGDTOgotIEbvIPdUkZb40590HbxelNLPbcfD+A1CjVX58gvabqfQN1/X2xqS7dNC8QVoPQn3YPGvhX38WVfkqfQeGyuQN8soX6uV1GVpctnXsBwLJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 13:25:26 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:25:26 +0000
Message-ID: <75c80054-20c5-4cbd-9243-46a8a05ef80e@intel.com>
Date: Wed, 16 Sep 2026 18:55:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] drm/i915/dsb: Add tracepoints for DSB commit
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-13-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-13-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|CH3PR11MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: a519d77b-2623-448c-eb3f-08df13f5f84f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: bJjwX5mk7spsH9efj9yEAVRuJR4kxvTzgIjGxMTqnJF34AvSkzLlx9Yu6sG8vKsu1BZd5ziE2/7eomcJfRLJjtsd5FmDvIhbXKLkOP4sAF+DKZrgphRp3Hq5CSuUE4rbqgRfr8RQCIKw9sKyAqfOXQOZR0VaPoXlQFDMTEevLpmEFkvqhjXRosnp9CZaLgFx8wWsRpjhRPAlAGfOaVVkf1etW6XWis2kOGqGZbl9JSeTOHF8vwH21yBwoikyDNEBmWXkDkTtiC+b1SfCnStGgAc4MSGTl96HHVCbLD1WgXjPHxmlnxdcKg4oYNSHGdO9VI23p2FK/94YZTdaVQwQuJ4Zk9PCBFDMbhqmR6FL/RjaY6nbavyaRXF24el3dQLA+OTbplU82vtpd5hM1P/2/KK0WGJTh2RnOJQdGT9/fv9MIPjheOW9GKiDDplyxmwUrvkXqpBxz02YYeL+JzkXaOtH+8yW23K0NpKd/Oc5XYCSmCOpe7tCq5nNQtWYW+sGzROwett9REceRROo9JIFK23H8FiIFdlqmXpciv/LC5LydD0YlrRz+GihKwHxNzqWgOU3g8CbyO5I37mEZuoEZW4tT8ZSnEl0bG4221y5tNoEqO/Kep06c8KJaT3Kl9kbsPB8bKDU6UUnipjvexnMBjKCep7Ho5afoOqDUGsMEts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmsveFJOaWxscWpzOW95cUViT1lxOUR0Z2UvWjlKTWlQdXY4dkdMTm5XQ0Yy?=
 =?utf-8?B?S1B1Y2FLallJL3YxeWo5Tm9HV2ZNeTVnMitaRmlnQ01EN2ZsalZGTGhmbE1F?=
 =?utf-8?B?U0hwekZqcmZUZGh2SDhqWG1mUU1KbE1nTGZwaVVydXRtWmRJdkFMWkNIRXEr?=
 =?utf-8?B?bVNZWXdjRXo5cVpITkhMbEMwVHdDdE1UeE51RjlQU2h4eDdjdVRiYUtkN1p2?=
 =?utf-8?B?VlMwY25BZEpFMjVVMFlSOUJZYzFFRk1zK2x2OEZGUFZKWDFwR3JkNndOTjgy?=
 =?utf-8?B?MndlVkVrc2NaU2FaK0QybW9RL3ZLZCs1Q1gzaUQ5WHNsVU9Na1g4eUlBYnZI?=
 =?utf-8?B?M3RlbWNidEh6ZjB3K2h4NEUvaDBucGxlcWlRNC9YTWtxM1FmY3YzL3NxOVR2?=
 =?utf-8?B?bGFyS2QxNzBENnFzZHZyMXJvRmtxZTdKb0x4OFBETEVBQlRjZ1FqV0JHQ25v?=
 =?utf-8?B?aHVQTU9SRktzWFhWc1I4T3BhVU5neDZ1Ry9PT29KYTlPNHlITDJFVHg5UjZi?=
 =?utf-8?B?MVNwQ29MUEM5N3Q5am1PS3BOOGtoQSt0elJJT2NaRTBCS3UwQUpJL0lFTmVa?=
 =?utf-8?B?eVFWZ0NwWGJFaWJJVDlLSE1iMjdpSzZNQXp3eGZTc0xZQ0pZd3kxZ1JtMm5k?=
 =?utf-8?B?c04xL1BkdWlzMjlkREpIZHBYM3VKVVVielZzK1E4QUQ5Wm4rRDdYOVpsSEJt?=
 =?utf-8?B?R3hXMGhaNy94NVhPUy9JOHZxcmFFRlRHdWVRR2h6dU5ibStKR1g3SkI3dkNL?=
 =?utf-8?B?M0p4enY0Y3E5N2FDZDVEZTBpTjR5YzV1bEU1SytnNXZpZUlhTk5uYUg3YWVJ?=
 =?utf-8?B?ZHlHcUJSOThZUkVSSFZYL1kxUzQ2bVcrcFJKZ2ptNDc2aXluR0dJcmxtNDBI?=
 =?utf-8?B?bUVqRjdZVjZzYnVDOWxXd1k0ME9Xd2NHU0FrU3hDT2pJL2ZNVUZ0ZVdqRUZ6?=
 =?utf-8?B?ejBmOGNsSExHNFVhYkswbCt4NURuTHk1MENFN2dUQXhTOEx5b0l6bDVyYkFy?=
 =?utf-8?B?cnpQTVJ2bW5mV3FNMG8vOFR2S3dFbXp5dnZOUHNJQXN2dWNXd3lrRmhyMmZZ?=
 =?utf-8?B?QzBpcGVjdHhtNlkxUU9iaWJIVG5BQnY4Y2RGTVFhRklGV2ZhcUR6ekJFVUU1?=
 =?utf-8?B?MG9NR1VMMElhYUFwb3UyMElFc1Z6VTcyTnJPTVNONlcwa2NWcHFDV0ZNTWdi?=
 =?utf-8?B?R0tZV1NJaHJVV3p0cUZYbGVKN3hTUU13a3p5QTRkUk1lMjFIdXB3TmcySStL?=
 =?utf-8?B?Mnk2aHQ0STFrNGU1ZTBLVERUSFlmRzdMMjBYSi9lUGpyNUJQVjJRaU1RWi9T?=
 =?utf-8?B?NnkyUEFFRGFkeGJDeFU0d1NnNktCL3lqdGxyb3VPZHQ3YzN6NjNBN1BsZ2Zu?=
 =?utf-8?B?NkVmbFp3UzBJSjl4bHdxRWE1cVlQU1RScHlQOWlrZlZNaUJMcU9DQ0lNTWR3?=
 =?utf-8?B?ZmFYa1FqUC85RlN6Q21TZjhUbml4NHhnNFRlY21hSjZqSHNQN0YvNjJPQ1A5?=
 =?utf-8?B?by9WTS95OUtjV0pydlpuRzNpOW9WdTlwc2hCZTA2TnJmNWNBTmRjMzBaS1Zv?=
 =?utf-8?B?a2p6aWVDUjB4V2ZHRFBuOHcwdGsybjFPSk92MDA1LytpbGNvSzFRQUtFL1VP?=
 =?utf-8?B?bFhEWWdaL3B5aUh4TnQ5d0JXVUt0MXJaaU0xMVczTW5PQmozcXJ2bVR5V3B3?=
 =?utf-8?B?QzdGYmQyck1WL2YwMTZYYldZZTMweUMxV1p5ak5FN3VwMVBldCtYVnJSbmJ3?=
 =?utf-8?B?THE1d3ZNUEZ0Vmo5ZWt6eW5qczBhTTBUSXdVWDQvV3hnK3ppbWJicUtTakVU?=
 =?utf-8?B?RmdqYURyTHhpdk4xZFFSNlJmSklHRUhnR2R6WElsVk1ZU29Ed2pkbThKMVVR?=
 =?utf-8?B?aXd3ZEZtT0lvUWdXTTVHa2tjTlJRclRqK1dVeUx5QmFyODhsTmVSdjRHOTU1?=
 =?utf-8?B?SlM1aUpPL01oMVVaOHJ1MXBLQTkzejNQT0FHNzBBV2lVMW83bWc3Y0xGWjlt?=
 =?utf-8?B?NVFNQktETkd4RTRlblZoOU1UL1hqRFYzeXN2ZjkyR0tTSERHN3N3b2hOaVJm?=
 =?utf-8?B?NWhRZHI1MjBiWVdsQ0poblppdWtWcmtHVUFia2JnZGozOURDSkF1OS9nMnlM?=
 =?utf-8?B?MXdxcTB1OXNKeDQ4MkovRldDdEduMUVRZzJINi8yREI3dll0dXVqaXVHZnVk?=
 =?utf-8?B?alUrL1hVR1IvZDFqK1Y0Nmt6NVdzdlMyeTZUcWRLaDJ3MFlUNlY3dTdNc0JB?=
 =?utf-8?B?TEpDcjV5b2xidGF2MlkzTURRUWdmOURHc2ZlYVZkNlBzRG5ZK3Q0ZlJ6eG05?=
 =?utf-8?B?MnlVaWMySThhV1RPMmkxTUVBRGZqalczS1VKRksyVFZNeG5YRkdLNjhLU2Rr?=
 =?utf-8?Q?TKfowmQDut/tZViM=3D?=
X-Exchange-RoutingPolicyChecked: EvKAjiBWT+L7Ff06jvQDuZp8Y5cO9Beg+JgdNUP/DurSShg9wb84x4Pl9nldTU/SFMVKuut7Ssm9MkjkW7xQrN1iZM4apG6lLqoNl5HBeHeyh9LrmZ1671DZgg6+rJFzHJpIFVXsBgWyO0ZJKVCOxEGxaZ/vU73cZviLAQMfQxyolxlO9+X1dIoLSog61Vbh92oPEGMMBunmJoZsfQ7WAD8ff9zttC+SiueXGWKH/uGFa8xE/LM5Xufg/DBFgLDqgJJzn4/VHGo4TItcz4eg50mHD5Xn7iInP2JM8P95UR0qQkXUrb8H8mniJ8oh3ikto5zLKZTtUgAxU3s6sVDLiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a519d77b-2623-448c-eb3f-08df13f5f84f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:25:26.6640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 747zGA22OFMQ4MCV+oeTS0Grfkid55s94rlXutCnjgcqZyoovhLTNOw61vsGZw4OLlhgv76T34U50O+h92klVGu9mfhrl5yapwY4VOevBAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Currently DSB based commits don't leave any breadcrumbs via
> tracepoints. Add new intel_dsb_commit and intel_dsb_done
> tracepoints that at least indicates when the DSB does something.
> 
> We might want to improve this later somehow to have a slightly
> better idea what the DSB might end up doing. But at least this
> now shows that *something* is happening on the hardware.
> 

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   .../drm/i915/display/intel_display_trace.h    | 51 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_dsb.c      |  5 ++
>   2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
> index 504d105935bc..06cf662931fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
> @@ -22,6 +22,7 @@
>   #include "intel_display_core.h"
>   #include "intel_display_limits.h"
>   #include "intel_display_types.h"
> +#include "intel_dsb.h"
>   #include "intel_vblank.h"
>   
>   #define __dev_name_display(display) dev_name((display)->drm->dev)
> @@ -681,6 +682,56 @@ TRACE_EVENT(intel_fbc_nuke,
>   		      __entry->frame, __entry->scanline)
>   );
>   
> +TRACE_EVENT(intel_dsb_commit,
> +	    TP_PROTO(struct intel_crtc *crtc, enum intel_dsb_id dsb_id),
> +	    TP_ARGS(crtc, dsb_id),
> +
> +	    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_kms(crtc))
> +			     __field(char, pipe_name)
> +			     __field(u32, dsb_id)
> +			     __field(u32, frame)
> +			     __field(u32, scanline)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->pipe_name = pipe_name(crtc->pipe);
> +			   __entry->dsb_id = dsb_id;
> +			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
> +			   __entry->scanline = intel_get_crtc_scanline(crtc);
> +			   ),
> +
> +	    TP_printk("dev %s, pipe %c, DSB %d, frame=%u, scanline=%u",
> +		      __get_str(dev), __entry->pipe_name, __entry->dsb_id,
> +		      __entry->frame, __entry->scanline)
> +);
> +
> +TRACE_EVENT(intel_dsb_done,
> +	    TP_PROTO(struct intel_crtc *crtc, enum intel_dsb_id dsb_id),
> +	    TP_ARGS(crtc, dsb_id),
> +
> +	    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_kms(crtc))
> +			     __field(char, pipe_name)
> +			     __field(u32, dsb_id)
> +			     __field(u32, frame)
> +			     __field(u32, scanline)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->pipe_name = pipe_name(crtc->pipe);
> +			   __entry->dsb_id = dsb_id;
> +			   __entry->frame = intel_crtc_get_vblank_counter(crtc);
> +			   __entry->scanline = intel_get_crtc_scanline(crtc);
> +			   ),
> +
> +	    TP_printk("dev %s, pipe %c, DSB %d, frame=%u, scanline=%u",
> +		      __get_str(dev), __entry->pipe_name, __entry->dsb_id,
> +		      __entry->frame, __entry->scanline)
> +);
> +
>   TRACE_EVENT(intel_crtc_vblank_work_start,
>   	    TP_PROTO(struct intel_crtc *crtc),
>   	    TP_ARGS(crtc),
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 8e01e1eed291..299d778520a2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -14,6 +14,7 @@
>   #include "intel_de.h"
>   #include "intel_display_regs.h"
>   #include "intel_display_rpm.h"
> +#include "intel_display_trace.h"
>   #include "intel_display_types.h"
>   #include "intel_dsb.h"
>   #include "intel_dsb_regs.h"
> @@ -982,6 +983,8 @@ void intel_dsb_commit(struct intel_dsb *dsb)
>   	intel_de_write_fw(display, DSB_HEAD(pipe, dsb->id),
>   			  intel_dsb_head(dsb));
>   
> +	trace_intel_dsb_commit(crtc, dsb->id);
> +
>   	intel_de_write_fw(display, DSB_TAIL(pipe, dsb->id),
>   			  intel_dsb_tail(dsb));
>   }
> @@ -1124,6 +1127,8 @@ void intel_dsb_irq_handler(struct intel_display *display,
>   		spin_lock(&display->drm->event_lock);
>   
>   		if (crtc->dsb_event) {
> +			trace_intel_dsb_done(crtc, dsb_id);
> +
>   			/*
>   			 * Update vblank counter/timestamp in case it
>   			 * hasn't been done yet for this frame.

