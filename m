Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1827CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECE310E129;
	Mon, 12 Oct 2026 14:25:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8E510E129;
 Mon, 12 Oct 2026 14:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791815136; x=1823351136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+0Dag9W1fy91qCy9l7Dm4go+xQWdVN9c9usWnzeAVRE=;
 b=Vc/0TW54d3Xvvgini54CaHcOl4x6wJ6s5VKcqhlK2HHg6GTctdXwQlSp
 HobKwweZO/mU1vyoWPcGfCJRtG408vmQZEnpSBLHPW9e46Wkt7AcJ8W10
 P+OnGECi5NGsxFdobUaLPcDH5l56X7fWp/Ah8s37xOzNm5piUsegK7JJg
 vmhj8E28ymhhMhT/ZEkkpYaQXvII+bpkYGpkJE42btfHnK0CAxd6Ih1fD
 StWboJfMYjBuWCX4QA3zT2mMYeY+uDO0PqoT1qI5SH/6qLEiFfZwa0DJr
 1u2XK6iK3qsXMpL+uCz8EcrM6EOcGj9AJ9Jn2d/JKtg9vxVsO8JdscS+m g==;
X-CSE-ConnectionGUID: +/I9eMbBTgiNwFjGDYGc2g==
X-CSE-MsgGUID: OoCyzTckTlWLm5JZed84Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="419885"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="419885"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:25:36 -0700
X-CSE-ConnectionGUID: 0KzWErbERKeE4gKE7sHWZg==
X-CSE-MsgGUID: BPdhZN2yTcyoYNvstMb9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2761507"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:25:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:25:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 07:25:35 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIc7IWWNkGXYHeu5kkXRlQZ5qld0CwppSqe/UNshV8SR/bWk6rrCf6xM00FrMSIEbYWAy/m1r8QLoUEmW9jrsgbW6Be+kK4BEev3z2oAP76vJhbJOp7zQOIUDyD7EGKv5ZYjpFCviXG7ccUS16h0pR5v1RJM3RHTLox1ct/9HirrFNniZsXe8/KqWApGUPlw6CdX4uXU/e8ZGpuJB/QsW1wwJMq3c0GUNZCVWiSQjGDxMsB/oa8VVOv+VmIs0WxYg8pBwh+8q4KwhI4ar/M1+dGWS1tE1eO+WewESm5kKy5LsLG+6yKQLb2JxZS1MfSTTy+Oj6bGbyDkF8Jcc7urbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvLziYlNT97FM7vzHW/tik1a0HJjQ2OzPzcKmdUb1ZM=;
 b=S0BFTwP3xanoTpU2XTFuXF6L/XvOc5eBv8LK12JWVCVRAON//c3uQPpzPU4TdiEpDGQBk41CbYcTmtBUN7zsYPQUpWgwu5yxVoZtg1u0zsj/xl92wxJVDBhmriq/zGoThAm1hyEgAJS+iBeghqU/6tR8sfr/0Lc61GZP9U7LUXeV+LI369pw+6CHlvQ3YBhRYv7/3jgs9S+RGRfoQ9ei2DvPmZn7V/+U6vjx86ePKtkAIy4KpnivR8F0BHgzKSUNt1EwSw8tPZHoG25wm2+hRnNfFFdZOuz6vhLn0ESBpcae8myijDDS/Fl1ra9hz4aeBy2md76j6G41jA1PJQuiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by SA7PR11MB9542.namprd11.prod.outlook.com
 (2603:10b6:806:4d0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 14:25:33 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 14:25:33 +0000
Message-ID: <e376276f-568a-4c6d-8e58-7082d06b5f0d@intel.com>
Date: Mon, 12 Oct 2026 19:55:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/i915/gmbus: Fix i2c bit banging for PTL+
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Naladala Ramanaidu
 <ramanaidu.naladala@intel.com>
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
 <20261007222314.5714-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261007222314.5714-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::8) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|SA7PR11MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: 0430fb3e-d533-4cac-a369-08df286cad0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|18002099003|22082099003|260925022911599003|260925021311599003|260925021911599003|261009223027099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 62OeUpi3WL2JrkaLl4XblQDkqz8BActj1UJp5UOpC3n5bbT8Dn9gBOR29RkVWyFkcGeVVMkA8R8wGxZRfhSSAZIrPvV8af5yN4Q7xjya3k4CH3ZdghR6DQKZLlotUSnk9wVQw/70JqSOAuWUxLmgi2mSbQTAzJR2Tkm4OCODqDT0mI8uoIFNbMbwhuEAy/oQUi6RDvZLJ9dWzypkcxXEwO6ICfCSHZKZCRPOvvLQkXnx9kWp8UJcdHZKuduIw81fQLNhklStQ9/q+Z/vjVmNrcZprG74IOkV4JNmw9BE1uyMlQxNVZX5cwcHKCk5RB+bf+WYyqC4D4NGf9ztSAZipZktb7S0ym3+TqJH7934IrL8gjRDggIEGYAGXRcGjilrODkPe5Hg9ovp7/IDhsDKCTZ9k95GTbCPvhedp86PFX9EKvLIfhD4r3nIyOGZR8RPLw2D8QULIWq4xpk4krrRzHmjXWp3qN+ZfJdn/ynk+FdsJlLpZf7ghPLXSnUdMsZlIyq50pqVjrR57iDXWw/O12rY/x0V8WLEgcL9kLvKhDV9FJyN+kpjmtyoQVP5aFjUbu2XZguaSsUmfimeCPF8ohz1xTuZFqVXMLcbGzFXpmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXI2RmpqS0xWVWpMK2ZqbUtTdEg0Z2N0S1hhSUhhNWdpRDhteGl3NWNVRmp1?=
 =?utf-8?B?SldKdVR3UXpnWmtvZTBRSzdXdmdFcldoR2RkeURybmJsSVpDeDJkK3N4NGM4?=
 =?utf-8?B?c1JsWmVSb1FkYytwYjlUc1YwQ2w5L0ZLTVM3MXRjb0M3M2xUcnRlL2NXOVZa?=
 =?utf-8?B?OEVadnhKS1NQa1BQMjRON2F1cWc4UWFWS3VmYno5c2hsZmN6ekw3QUVlUlNa?=
 =?utf-8?B?aGUwdVp1QUx1aVQ4L0FXR3Q2MnUvampwR1hsWjV5RUcxUS9lYktPUnQwNFpX?=
 =?utf-8?B?eG4zNXN5WE01NXV3ZXNsZFNNaHMxS0REcE9FeEpZaXRMNmVPd1J2a3NjS2xD?=
 =?utf-8?B?TEQ2SEppTlFNRGxrUEc1eld3ZVpLa1N3OG50VE9uQVRHMEREQ1FOU05EYmlr?=
 =?utf-8?B?MDQxWXh4NE80R2dJaDZlaHBaOC95RzJvK09zOHQ5cVNUWklyVCt6NUNtZ3Ew?=
 =?utf-8?B?S2V1cEkwSUJ4K0M3T3VabFk2NnZRRkN4bXZ3ajB2ckVCdWEwMERvRTNDa0VF?=
 =?utf-8?B?T0pkU2J6WTF3VDkzTFN6VExOSXhJUnpHb09hRkRqbXkxQjY2MTlQMklaeDk2?=
 =?utf-8?B?MWpoQTVIbW5JMkdxRWF5Nkk0enVpb0hYYUJsUW5UelpYaGY5eGhnY2twUjRR?=
 =?utf-8?B?TGg5WE9vM3BkMVZSdU8vZkdOQ1hEZ253K0ZzSUhPaCtNak9TdUZXTG9nVm9K?=
 =?utf-8?B?M0hwTy9QdWVVZFZGU2k1RmpDbjVlL3MvZ1A1MlM2eW1MU0ZxSVZQTUFtSlhT?=
 =?utf-8?B?UlY1ZTJBUmlKR3hzeUR2eVc2S3RzSXIrL2VuMVFITXVOZldNWGxpWDRLaHpP?=
 =?utf-8?B?czJCWXplQkovNHA1UGNXT2NNak5XUVBLL2tWWG4wejZJTXZLNVhJSEJMcUFt?=
 =?utf-8?B?QjhnQzhoalNiYjNLcElObzliWXR0UDU5ZGs3TEw0OVU0cFMySHVBcm1tWDhm?=
 =?utf-8?B?TTB4V0dSWlJxWDVxUyt5TEpWN2pRbmFWYXFXZGZkNkdTOWZpSWZjOXFWOWxm?=
 =?utf-8?B?VDhZVFZpQ3JUZDliWnp4c3orcGtqblhybHVya0xUYmFoRU9xVVhlaGgzandj?=
 =?utf-8?B?a3FIYWF6REVIcEhwVzZpdEZNQzB5VDhKWXhqRFJOalFNM3VIUWtTVyt6U1Ro?=
 =?utf-8?B?SktLb01sZ3hVcW80elI2eFUwMUJsVDVYdHpWMDRTSFpsRzY5RzhnUEt6ZkM5?=
 =?utf-8?B?cjlUbFZNYXZRekZaQWxuNm1KcFNoaS9uaHNjZjRlalFlMUpmQUsyYS9sSmdZ?=
 =?utf-8?B?RWtJZHlwZFA3aWl1RGNkZ21pUWFyQ2JZSVp1SFVWSGkzZU4yU3ZpMjZzaFpB?=
 =?utf-8?B?OXZWSHZmcnVGQU9ySzloZnYrSHEzRDZkSkI3aDdHdS9lTEhjUy91OWhMT1Vp?=
 =?utf-8?B?SWE4dVZiUnI2NnU5M1JkNVhUSk5nKy81S3V1UU5CZnhXRU4zTUpOS2RjcXEy?=
 =?utf-8?B?eGxBR1NtUi9Ga0g3eGRxM2ZnbFVIOGRUWnVTejdsZjU4ZkxMcE81c2tmQ1k0?=
 =?utf-8?B?RHZveVpSYXRxWk0wKzQzVE81Q3dwOWxVcHExc2U2UlI2Z2tWYVZiS3JvdWc0?=
 =?utf-8?B?aW42eGVXTkZZQlc0MVU1ay9UK2xBbGdsYk9HbU9NZGlhNlhyNGxuWG1teHZZ?=
 =?utf-8?B?YW5Uc3Q0SHczWUhDMy84YXhKL2RJS28yTjRGa2VMcnRhZEVMSWNYZlptMmJ3?=
 =?utf-8?B?NXM0cWY3K29wZWRMUXlMUFFOeWlvTDg5RkI5RndIeUwzS0t2aHdicGtSUUFX?=
 =?utf-8?B?SW5UQzdDUU1sRTlVNnFKTFo0V3VmdkVaSW42N2E5UCtFOGE5bmFDc203b09T?=
 =?utf-8?B?L3BSUll0ejlvN1loZjBENDFDbE9KTzlDL2YxWWRwaHFOODA5WFE0RjZQRWRh?=
 =?utf-8?B?dUtHcUx2SjZTeTZ0TGkxRjRuakp5azBGWE5iU05GbVgxb2grRW9TTVo3UzB2?=
 =?utf-8?B?NmdGNUJFNVpLQVBTekZTY0IrVEpTcms3Y3diTWVrL1c1amd5ajRXRUxnWG1o?=
 =?utf-8?B?MDMzc1hxQktNL05wbGJoaG1GaDhVeWQ5RXNLTWgwc2cvbkJOUHpaRVl2dnJZ?=
 =?utf-8?B?eWFJT2R4UHpuc2RGaDJ3blpvSUk3RjlvcTcvbWxIak1EMEtEUkpaSGFTeXdl?=
 =?utf-8?B?K2ErS043cHlpbEM4a0tKK0FBNld5RDFJTUh6cjFpRFZlOFRjUjdqLzQrSlox?=
 =?utf-8?B?d2NvV01zallHRU9qMWVyM0c2RzJnMVgwVzEvdithcUdsbGllL2luWUh5bGVo?=
 =?utf-8?B?RmVIanErL0srM01PTnBzc3ZaKzRtSlNiL1I1VzBiY29XUTlhY0FrQWdMdmFS?=
 =?utf-8?B?cmJKZzR1OTlITUhWY1lrcEZWZDNid09hTE05eHAvZmtHTGlJR0Vzc1MrZVA2?=
 =?utf-8?Q?T64JoeeND51EHS/k=3D?=
X-Exchange-RoutingPolicyChecked: kC8fLna8LtmywVJlX03sT+TtX2VseD1UCVW0CfrRCFbskRAAhBteLeGctusGdOiXooDuhEooJbcbhmSjISkdmeoOZ9D8nPFn3/JIY8jlLcijQ4v+JXPTgxYOWD5JwFrgmmLj2oQuS95rpfO+wGvLUNM2JPxSwNgik2/rCv4KVt++jouMTN5yTeYxD1azGbpc+Pj4JXOrRJzDHxihEFV0+PDMF3zmK2DPrNxffZjwaslxQMJMWEffWNiTF8YhGLnOjCI83OE5kJXfAZhmq0jXkQnm+jDi6VmGoNZWyroyflStoubPAYu+tiA3W6VYg26sgIyRoAAACUbg/rGFks1jAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0430fb3e-d533-4cac-a369-08df286cad0c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:25:33.5441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPzVx3bxSg6e3MyDJ8L4gnGizOb0e+mQ3rXYtvLl0dYnmzrv5iDzXI9M70wrrbQ9lzBOYWtXMd8nGlkJ+9JkS7/WoxUdZHtZqq80pvKe1Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9542
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

On 10/8/2026 3:53 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The current implementation of w/a 16025573575 does not actually work.

Thanks Ville for catching this and fixing it.

I want to acknowledge my mistake in the original WA. I mistook DIR_MASK 
and VAL_MASK for bits like any other and tried to preserve them, when 
they are actually write-only commit bits.

I later realized this wasn't working when I forced HDMI to read the EDID 
using bit-banging, and started looking into how to fix it properly, so 
this patch is very welcome.

We are also working on a debugfs hook to force bit-banging on a given 
connector, and an IGT test to actually check it (I still need to review 
the IGT though) [1] [2].

Perhaps that will be useful to catch issues like this again in the 
future. Thanks to Ramanaidu for implementing it.

If it makes sense, we can get that in early to test this across all 
available platforms. Or perhaps we can send both series separately to 
trybot and use test-with to test with the given IGT.

However, I don't want that to be a blocker for this series.


[1] debugfs patch: https://patchwork.freedesktop.org/series/175123/

[2] IGT: https://patchwork.freedesktop.org/series/175249/



> The GPIO register mask bits are write only, and thus he read-modify-write

nitpick: s/he/the


> cycles we do will not preserve them. Furthermore the implementation makes
> no effort to preserve the actual direction/output value bits, which is
> a must if all the mask bits were actually set all the time.
>
> Rewrite the whole thing so that we always set all the mask bits,
> and correctly preserve the previous state of the direction/output value
> bits. And do that on all platforms so that we only have a single codepath
> to worry about. As a bonus this approach will also make the code
> work on upcoming platforms where the mask bits no longer even exist.
> Smoke tested on alm,cl,tgl,lnl,ptl.
>
> Fixes: 7565fd5dcb0b ("drm/i915/gmbus: Add Wa_16025573575 for PTL/WCL for bit-bashing")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_gmbus.c | 98 ++++++++++++++--------
>   1 file changed, 61 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 854f439ac5ba..b6c63a466233 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -246,25 +246,45 @@ static void bxt_gmbus_clock_gating(struct intel_display *display,
>   		     !enable ? BXT_GMBUS_GATING_DIS : 0);
>   }
>   
> -static u32 get_reserved(struct intel_gmbus *bus)
> +static u32 gpio_mask_bits(struct intel_display *display)
>   {
> -	struct intel_display *display = bus->display;
> -	u32 preserve_bits = 0;
> +	return GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
> +		GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
> +}
> +
> +static u32 gpio_preserved_bits(struct intel_display *display)
> +{
> +	u32 val = GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_VAL_OUT |
> +		GPIO_DATA_DIR_OUT | GPIO_DATA_VAL_OUT;
>   
>   	/*
>   	 * On gen2/3 these are either internal pullup disables, or
>   	 * documented as reserved bits that need to be preserved.
>   	 */
>   	if (DISPLAY_VER(display) < 4)
> -		preserve_bits |= GPIO_DATA_PULLUP_DISABLE |
> +		val |= GPIO_DATA_PULLUP_DISABLE |
>   			GPIO_CLOCK_PULLUP_DISABLE;
>   
> -	/* Wa_16025573575: the masks bits need to be preserved through out */
> -	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
> -		preserve_bits |= GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
> -				 GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
> +	return val;
> +}
>   
> -	return intel_de_read_fw(display, bus->gpio_reg) & preserve_bits;
> +static u32 gpio_read_reg(struct intel_gmbus *bus)
> +{
> +	struct intel_display *display = bus->display;
> +	u32 val;
> +
> +	val = intel_de_read_fw(display, bus->gpio_reg);
> +
> +	val &= gpio_preserved_bits(display);
> +
> +	/*
> +	 * Wa_16025573575:
> +	 * The (write only!) masks bits need to be kept set through out
> +	 * on PTL. Do it always to keep the code uniform for all platforms.
> +	 */
> +	val |= gpio_mask_bits(display);
> +
> +	return val;
>   }
>   
>   static int get_clock(void *data)
> @@ -287,16 +307,16 @@ static void set_clock(void *data, int state_high)
>   {
>   	struct intel_gmbus *bus = data;
>   	struct intel_display *display = bus->display;
> -	u32 reserved = get_reserved(bus);
> -	u32 clock_bits;
> +	u32 val;
>   
> -	if (state_high)
> -		clock_bits = GPIO_CLOCK_DIR_IN | GPIO_CLOCK_DIR_MASK;
> -	else
> -		clock_bits = GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_DIR_MASK |
> -			     GPIO_CLOCK_VAL_MASK;
> +	val = gpio_read_reg(bus);
>   
> -	intel_de_write_fw(display, bus->gpio_reg, reserved | clock_bits);
> +	val &= ~(GPIO_CLOCK_DIR_OUT | GPIO_CLOCK_VAL_OUT);
> +
> +	if (!state_high)
> +		val |= GPIO_CLOCK_DIR_OUT;
> +
> +	intel_de_write_fw(display, bus->gpio_reg, val);
>   	intel_de_posting_read_fw(display, bus->gpio_reg);
>   }
>   
> @@ -304,32 +324,36 @@ static void set_data(void *data, int state_high)
>   {
>   	struct intel_gmbus *bus = data;
>   	struct intel_display *display = bus->display;
> -	u32 reserved = get_reserved(bus);
> -	u32 data_bits;
> +	u32 val;
>   
> -	if (state_high)
> -		data_bits = GPIO_DATA_DIR_IN | GPIO_DATA_DIR_MASK;
> -	else
> -		data_bits = GPIO_DATA_DIR_OUT | GPIO_DATA_DIR_MASK |
> -			GPIO_DATA_VAL_MASK;
> +	val = gpio_read_reg(bus);
>   
> -	intel_de_write_fw(display, bus->gpio_reg, reserved | data_bits);
> +	val &= ~(GPIO_DATA_DIR_OUT | GPIO_DATA_VAL_OUT);
> +
> +	if (!state_high)
> +		val |= GPIO_DATA_DIR_OUT;
> +
> +	intel_de_write_fw(display, bus->gpio_reg, val);
>   	intel_de_posting_read_fw(display, bus->gpio_reg);
>   }

This is now very clear.

Though at the risk of being premature optimization, there does seem to 
be an opportunity for factoring out common code:

since set_clock() and set_data() end up doing the same thing with 
different register fields, would it make sense to factor the common part 
into something like

set_gpio_line(bus, state_high, GPIO_DATA_DIR_OUT, GPIO_DATA_VAL_OUT);
set_gpio_line(bus, state_high, GPIO_CLOCK_DIR_OUT, GPIO_CLOCK_VAL_OUT);

In any case, I agree with the patch and the series as a whole.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

>   
>   static void
> -ptl_handle_mask_bits(struct intel_gmbus *bus, bool set)
> +gpio_set_mask(struct intel_gmbus *bus, bool enable)
>   {
>   	struct intel_display *display = bus->display;
> -	u32 reg_val = intel_de_read_fw(display, bus->gpio_reg);
> -	u32 mask_bits = GPIO_CLOCK_DIR_MASK | GPIO_CLOCK_VAL_MASK |
> -			GPIO_DATA_DIR_MASK | GPIO_DATA_VAL_MASK;
> -	if (set)
> -		reg_val |= mask_bits;
> +	u32 val;
> +
> +	val = gpio_read_reg(bus);
> +
> +	val &= ~(GPIO_DATA_DIR_OUT | GPIO_CLOCK_DIR_OUT |
> +		 GPIO_DATA_VAL_OUT | GPIO_CLOCK_VAL_OUT);
> +
> +	if (enable)
> +		val |= gpio_mask_bits(display);
>   	else
> -		reg_val &= ~mask_bits;
> +		val &= ~gpio_mask_bits(display);
>   
> -	intel_de_write_fw(display, bus->gpio_reg, reg_val);
> +	intel_de_write_fw(display, bus->gpio_reg, val);
>   	intel_de_posting_read_fw(display, bus->gpio_reg);
>   }
>   
> @@ -344,8 +368,8 @@ intel_gpio_pre_xfer(struct i2c_adapter *adapter)
>   
>   	intel_gmbus_reset(display);
>   
> -	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
> -		ptl_handle_mask_bits(bus, true);
> +	if (gpio_mask_bits(display))
> +		gpio_set_mask(bus, true);
>   
>   	set_data(bus, 1);
>   	set_clock(bus, 1);
> @@ -362,8 +386,8 @@ intel_gpio_post_xfer(struct i2c_adapter *adapter)
>   	set_data(bus, 1);
>   	set_clock(bus, 1);
>   
> -	if (intel_display_wa(display, INTEL_DISPLAY_WA_16025573575))
> -		ptl_handle_mask_bits(bus, false);
> +	if (gpio_mask_bits(display))
> +		gpio_set_mask(bus, false);
>   
>   	if (display->platform.pineview)
>   		pnv_gmbus_clock_gating(display, true);
