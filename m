Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8DDC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A88910EAD6;
	Wed, 16 Sep 2026 13:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PReMxLrj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D1D10EAD6;
 Wed, 16 Sep 2026 13:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789565100; x=1821101100;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PeoiBlmW7xyCSVamAs+BlViGCSJzKM2JkKvCu331PeM=;
 b=PReMxLrjvkrboxBKBzx8XVuwxnCo2ClF1ljeumgsq6L4QZwGxs2QihCT
 kCmOW9qGv7XJTkycmua9P6nDqQuayhmzruVyGBsdUinL8tVIvTzKvZOKD
 DHzzAXu6XqEvTGYF5yIWJELSFyHcXwxxs+3M1wnqafURPPbiYM3aWeN3i
 VQLdX66uBYRNUurlbeDcsnk7bqRQG5Bic5cMYE026ANtni+QleOzJwJns
 tk97qIkaDujqPFqKvkNT5fYA+X5t9ehZKnswupo4U3ddZfCGOpKWxvzAi
 zQF7+31zBhMhXKEZcObBXF6GoVxueb+G3aJju9McJP+GD7AI1xbezHkxM g==;
X-CSE-ConnectionGUID: hvJ7LcZoQ/6V3DUJIC7+0A==
X-CSE-MsgGUID: GhJkQ0ozQBmb/ImBJEmA3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88877775"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88877775"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:25:00 -0700
X-CSE-ConnectionGUID: JJiNjlpoSsOJqXYBu+dYug==
X-CSE-MsgGUID: s6Q66lRORA6NdYYHBWABLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271559490"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:24:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:24:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:24:59 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBA1BrmOGEakQEOAne9Jnkkz1QBlqKd41MlcFwEqFegMewgTZb5ImHmFjGWi2F7NZemUGxq/Zvkrdr8bd5q/eIVP88MctOsNCdnd7dsRHk4Qfjzj273DU9T7OPPVYbdbyK+Igmp0xE9giuJ5lEv42wvVuaN1ePziy1w4heMFM4FEVaEO19H/sAATUgnhIDp6k3ZeWPkhnSJ3Tj6A1c+WCFiTy38R/eTVBBpeZ8U3R/UZrjcbtBNihC6Mi9Hd5R0cHfc/gDPfvmjGiJ9eVA/S+5/YqZAMUAPi1I7c6CApb/HLrvoMJZzX+62i9huwebg7F36mc24KIVfO+4P5Cv35sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irG16aKutLORfIvSVYFUCq3AvxP4N1XpPv+ptNY3BXc=;
 b=EgvqdYgr3dRVzF1Dz/VYWimJvl4JQhHAlw4H7YrsnHpb9ysavP2hA3MmVtY+k4Q/h+ms7wP/NpyLxvsQ8LmBVZGmyz7FjBGB6N+i+APRv3h7PyRuc+DHG+MODJTuk45oKUqn/kcaNzKblUESTvlMJajd8d7Np1Pbc1+Dw9791RBndzFT7MnCyVwT88x1msZ4FqmwgNPAzKLxExRrofHt4N5qn//g8sBHn6LW2KrKIe0W2o5DV4rCdfoO3X7jPyasQ17iUSm+X+QEiZikqJECT7KiXUUO07hLj1ZEKftMZOwP2FDQkUJHL6sOfI46b+HBIm/Lp/E0LDLEc8sv8Hs8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:24:56 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:24:56 +0000
Message-ID: <d2e17822-3a16-4955-9324-c0740fb6654a@intel.com>
Date: Wed, 16 Sep 2026 18:54:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] drm/i915: Use intel_dsb_supported() to determine
 'use_dsb'
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-9-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-9-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0202.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::9) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 6045d1cb-28a0-464d-26c0-08df13f5e668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: vAHve3OvHbpPC+KvENus0jOwlZK9JfsiK+DGv3eLRpbUplYOBFjFu5mWCpUGF2TOimLJPp8xTPoK7RsGD4ifcJF8Yy8ActErw3cyk+mOA9Zi3NnYNcGgZY9ykczBNcdhk3MXMzve0dW07zRRQo2WCJKLHXu5aDbcwAze4Loz//YOgBAmzX4cENH78yrxDYcsMFT64RuwrogyfO5VLrvCn9ubc1BAFGSHHgdbKHbohqZxL8R86IYI4hKJ8qzauXqlaRleAjcUSsxTtlB6aBUu5z6j+C38QTyqwirwSZUdb5mE7e9VtNCLw9NQem/m9Nx7mx0lDoVM8K/vWT9I2WAVZjJY43AK3C814fLPWaCB5QED+9T/eeyQdmDSYD//n/Sn7WxidU9OJt6ZAXSNRb0k9UDcq6NormY2bj3Xf8WVuBFQVpshnRS36zOBP2joJnOe1VDl31kHNvAuHHc2bg+trqJ5iezkW3EnEHYU038SLByWLztrI8FaF3EV52RNFlQ/NI7ANazi0iHU6FjlC+YOVg876he1Gx+l3EjwT3+XE6ySZUb4oyLQBJFnTAUfez/xOa9esQDr0CKF+MX41vafjFDSrmi+Euqk6fpFPh66dwmwAaPildlJlY2IAYijtF4iBoPJHA3Wy2CxI2vKnFD9FyQ4Z58zwPl8YwPrrjXTRYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVwTEdDK1NzWFYwcGdFd1dpUmJrR0I3emc4R2xMQS8xRWJuRWtsT0xDbENE?=
 =?utf-8?B?VU1pZ1ppc2JQOEdvUTlLUktROXVLTVAzd3laK2tUTFdxc2dXdzJqNjA0Tm9K?=
 =?utf-8?B?clRWY1FKYmZDVEFFaUdlNTZ2M1lJTnVNR3NCOWZnZEo3dUxBbE82QUlocDY5?=
 =?utf-8?B?WFpVTDZqaU53Y2FUNGwweHB0UHhvZUhaY2U4N3BwelhNeHRVdXBOWis3eDN0?=
 =?utf-8?B?TGxybXpPSzFHcHhYQ043R0xMZXB5U2hwc3h0VEVBMjJkQlZRWnFsUVV6RUhG?=
 =?utf-8?B?OS9lcFJFUmJybEZGSzRXbEFwcUQ5NVY4eTI2aVhKMWhKL1NTaS8rRTdDRGto?=
 =?utf-8?B?NUhYcS8wSmJjdEFvY3NGZFBkL3JuMVhIZlh3dFEyV01KV2tBVmdRSU4raW8w?=
 =?utf-8?B?NmdQMlZBMUhnQ2poM2NxRENSZjRiVjNyN05uejV6ajBjWENvQm1RNDM5dzZR?=
 =?utf-8?B?dXc4VkdjOEFJN1IyMDhuaW54T0dZRTkrVGU4eExkdU9Kb3UyTUpabnc5b1gr?=
 =?utf-8?B?S081V2ZzSkwyRGZoUEs3dzY0MFlGSTNuZHJHRjF1ckNycS9sZ0NFZkNCdnd0?=
 =?utf-8?B?NWo4SEtTY1BZTjh1b2hYQzBpb1B2RFh5ZnBqam5Rbkk1dWlrWWRhRG0vMHJy?=
 =?utf-8?B?Vm5rSlltU2loNXNXdWRLY09LMU9WWXZGQ3hlYTYzS1Nyc0Znc1NaMTYzdDBX?=
 =?utf-8?B?VWVzY3VWNzBaN0tpSEw5ZVBlZHUvWFBZQlJ1elZ1bkQ4V1pKUjNLa0o5VlQ1?=
 =?utf-8?B?OVlZOFYrU1p6VjBhdWZIMmlFUWI2cjNVTVF3S1BGc05hanlsUkRNaU40Ukx0?=
 =?utf-8?B?WTVUQTI3SzJBa3lGZU9ZTDh5TmxvRG9GYlk3OVJhVGMvOStNOS9uYlVtbnFN?=
 =?utf-8?B?SzZUOHQ1dlNtT3lSNGhTV3FaRFlRNTUyLy9IMElZekJxdktXRE5McTF4cDVE?=
 =?utf-8?B?R2hjdHBBeUw5U2Z1SFB6NERyRWtkZXVBR04rQ295eUhZMFBxaHZEbFVzYXRv?=
 =?utf-8?B?Z1NZeEZPUFlNK0xwNE93enJwcDl4T3lSeUtjQTRrelVPd05YWnBZSUVKREJF?=
 =?utf-8?B?MjdPOFUwSXh1dzM3RC8zcW5ZS0RaY2Q1OFhsaXAvUFQ1SmtPQU5PanAzYnNI?=
 =?utf-8?B?V1NDUFFPejVLbVo4dXdPL1RmR0N1NTMrSDBGOC85T1poMHF2b1N1cHI3NUJL?=
 =?utf-8?B?RHpnQkdickN6QTRkZFVadnpZWVhnU2hONTMzeVpzbW10Q1VsSnhXVDV6eU9k?=
 =?utf-8?B?dC83eFhjVmZCL295SzNzSmVrSGtkQ1hWaDIzVlF6YmFQemFGRncyYXRUdzEx?=
 =?utf-8?B?MUQza3kwd0YrTFJDV3hPcDVIRWllRmUvRTk3eDcxQ1NQN1dHTWpoTzJzQTlG?=
 =?utf-8?B?c3AwcmxsOWt2RmVTbEdkb3dpbjNSU0JUNG9FZDJmRXNvOEVCM2plM1QrbHFJ?=
 =?utf-8?B?ZDdmS3pQQ2hxTTk0bFRtUUpJNUlvTXo2VVYwSmIyT2FuUEhUTTQ1NlpwZ2hj?=
 =?utf-8?B?dmUzSVFndER3eHFvNEZ2OGZ2UXQ1WWFzTjc1MDYvZFl4R29sUTVDT1gyNFlv?=
 =?utf-8?B?cUgwU29TQVcvV2hMQTR6TFJEY09NVHE5ejNXMTZSZDljZExJYVR1N0g1NHRu?=
 =?utf-8?B?OTRPb1dNSEMwdDd0YnJPcnhKcVdveXJBeGFoUEkyMGMxQnM0dWxxREJ0bkx4?=
 =?utf-8?B?NldHckpTK2Z3Uk5XU2RuOG9HTmVBRGRseWQ3czJkMllRQ2Ftc09zeXRYTXY4?=
 =?utf-8?B?WkxXdEJpZ1Q0VE96aUVkbFBScmNyQkpsZzQrcFZuTElySDltdGtGTys4OGlW?=
 =?utf-8?B?Ty9NbDVNVVZPUEljQWYyWWVKbkdkQjdiZ01WdW9na2diNk0ydkQxVlA5NCtu?=
 =?utf-8?B?NTdMVXZmaWFnRUdwOUVqdk5SUXRaYTZrZ29wVlVwTGwza0VVeEkyUUVZNWp4?=
 =?utf-8?B?eXlINWVyMGxwN25OTnNSU2hXczcrTVlwTmpSbG9KS1RDZUUzNWJvaGo5ZWpx?=
 =?utf-8?B?RFdxUHZWdE9DMEFrd0xMb1E3TlJNbVNxRlJpOVZCYzdGY1ZseFBzN1dudTQ4?=
 =?utf-8?B?TFg0MFladnREdWgzWHlDSlpiS2dBNG5nbkFGVHpVSG1xbTlXeVl3ZEEyZGZB?=
 =?utf-8?B?UkczU2hrT05IMUQ2QXA0UnpoMEp5Q0F0Y1g1S2IyVU5UdERFSy9zNUhKQ0Fk?=
 =?utf-8?B?R1EyNE9KNGszdWNEcURxYzRaM1dxRTZUc3ZlS09peHEyOVRhYm1LeDlXL3RN?=
 =?utf-8?B?MFFPZ3JUQ2xEUTM1dGVtdStqM2hCUVByQjNlanliTC9nSVZWcnZaTmE5NVEy?=
 =?utf-8?B?bmtjYnFsTEp0SlM5RVNwTXd1SGw3Mm5KUTYyR0U2YitWTjFwa21JRlhNaDlt?=
 =?utf-8?Q?NxmuPZGkiugJMW+E=3D?=
X-Exchange-RoutingPolicyChecked: zifRhNn59PBBTuE+lIqDbMJVyg5whUETFEs4vAakI2S4+cPyLbYWJ8o/xtsaUBVpIwIrDxYBtSt7h7L750kV157mPrbK4uVblexTHLXz5MK5HbbPBNhxAvAuXGNBAg+n+Sotf4i9qt/fqzNabK8LOtzek0cpkCekILab1aE6ovvnHS71nqjwOs0fyw6mAECTr6GEichL9/T6tkk3gUD+JK47MaodBKk7/wXvSDIFrqp7h0DtJ5i0evaj/zI5RCd4ClIVv5yNZAu0KG1zleTTOCujp/9ri5CR7AAU+c6wkQyX5ItfiJjO36y2PUv17yYW7/4CyHrnPlmcJd5Ss8zrNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6045d1cb-28a0-464d-26c0-08df13f5e668
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:24:56.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNS0gDp3IbqNyLNtXExkq0Dd1wgZfkqH89rkSdFg2+1LbVcyajGUrdj0Rw46gbX9v3qX6lml1WcXVO+G5EiIOYno38JH3+gzic2YVj/NUwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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
> Currently we calculate crtc_state->use_dsb by simply assuming
> that DSB is available, and then falling back to MMIO when the
> actual DSB buffer allocation fails.
> 
> This is somewhat confusing, and doesn't match how the flip queue
> counterpart (use_flipq) is calculated.  Check whether DSB is
> available ahead of time, just like we in the flip queue case.

typo: we do

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index fc30a455bed3..7741f1395375 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7392,6 +7392,7 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
>   		!intel_crtc_needs_color_update(new_crtc_state);
>   
>   	new_crtc_state->use_dsb =
> +		intel_dsb_supported(display) &&
>   		!new_crtc_state->use_flipq &&
>   		!new_crtc_state->do_async_flip &&
>   		(DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr) &&

