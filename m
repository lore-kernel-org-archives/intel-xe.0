Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC39606A320
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TaLZON5e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7C610E07D;
	Wed, 11 Nov 2026 05:50:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458B210E07D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 05:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794376212; x=1825912212;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GW3wwWNJ+Gwzj9Y9JuhtcBF1z2RNAbNiVZtvESZO7zM=;
 b=TaLZON5eBi0SvtPuZO2c9BieT3ZMiuiykx/xUaqC2kF/oOgnKUzaTKaG
 TYC5ltUn8jQgo2ZQQpA75Fj8BgGoJy+JHxFUEvD7EsO5KLmJlmEiWNLGW
 3HZRdeRZDoAnP9tSo5GbtuDuPyH6nQz6ZW2xA5v5ZEKor/lSiMn2eNGF3
 W4ON7kDnVsapfooz4BrVIxlzs/hCZDMlCC1/504msr1A923ktC7zf58FG
 Iw2yADS/371qIEzlG7c11DNlDgV/gPO6Q7o/UVQdvp1WdRN+byt208bWf
 JViJYBsuLL/SbQJ7vE52mDbWlw6ZQgWPyqOSbXOIly/OiLULZKUJL5yNZ g==;
X-CSE-ConnectionGUID: 0DaHxl7zQDi40CSU/kYiNA==
X-CSE-MsgGUID: ZwBtwnfLQCuEzWMr4uFQLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3146939"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3146939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:50:12 -0800
X-CSE-ConnectionGUID: rEHVWdRtQrSpuP20IRKXkw==
X-CSE-MsgGUID: ovUxZWLeTZadBK3wrKZXPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8379782"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:50:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 21:50:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 21:50:11 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 21:50:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGBvF605WfxVsoW7CT5KjgV49CFfkS8cmSKiiR4al/XquQQX9cVjtxKoKklPL1CmVS5uN7111UrkpYS1gbA2jItJmmcFLwfa5dTht1Lzvn+gMHVplADmTgNsQYxXPDYYIl3ZYLmGWLoFJGvllahEC8D5T5gtfaNiBFf3NIorBvjnU5xYR8libz2UcEOjzs6dwLZMDflyZxwM9lr16gzUKo2mpU+MwBb4NWEYjzXpYOwH//enNheRdJEZ3mjrytjUfcfBOYHiE/Ls5kNUmQbaI09Vxm2u1ubp9Qbe3fpL4hKl5Cc8bC+fgIaqUibFSDA6kdjinZJBNLgPnlJqasEXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJzhgJ5HZrZ+gYz/TXQQBrM+F7JjvM4IMsvNPgBMFnI=;
 b=uMkILgIbebfPIi1bexsl6UJ5kbRokxWmxoPzyGMmaJ/QpSmEgrj2NrcvuhCCwcGUIioHXmk8jw3EGfi+H6HYNAkiF8lBConu8tlffMSL4wHsWcuuIuREV6ZE/Wqsfcbh9rpmXR1ZTpvzTtz6YEL66a+7Gn6D8jkx4TnjPVcWsxrp9XStyJTLHsKI29CP+MXw964NbB0HKHzpqdI3CsvYguYqngsQFoEhBvxNG742dJOL35kESLuFiFEPUw7Fg3RdvYNWypdr2rc49lw/ngiS+LPwOIXqzu/4+6OxbTbfRBVm6dEyQoBCaAuKdnUlOG71w7jFkBP2HASowVAsg5340w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS6PR11MB9917.namprd11.prod.outlook.com (2603:10b6:8:461::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Wed, 11 Nov 2026 05:50:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 05:50:08 +0000
Message-ID: <524ae4f5-d484-4af4-a7ac-68bdaef970c5@intel.com>
Date: Wed, 11 Nov 2026 11:20:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/survivability: Guard runtime survivability
 enable against unbind
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-13-riana.tauro@intel.com>
 <avMTTzrY0kPJRChS@black.igk.intel.com>
 <02e5f319-4d40-4ec2-9d50-a15b4102b21c@intel.com>
 <avP_gtHbb-taK6DK@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avP_gtHbb-taK6DK@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0275.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS6PR11MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5b7856-d43b-4b21-8bf1-08df3fb7a47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|261022075727099003|10067099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: NJeFxYYovsC5ES0gFU5lkg08Oq3cIYD7tryUwDIcxmxw8NR8SqEEakpTd35Tvi/ZosHdonegP88+1AV0qo232+CJXpdQVTnJ2GHoihJD27ZumaKIFojBNNDJjRY8Iit8X/j42eB822pBy+pW3Km+3/XxgRENnEvwnUhn77oobONFFWSK7AQT13kc2m+Hu0VpMwI8NTozW1EVpB29fzNMmgNv5iy1QdhO3ZRY92ZCIJirbNuTznaIUcfzPS7h3gwEToILmGsZmudHfyEvXnv2g19b10UcHmFpyCPEl+hz0GgbTGMbga5CwyukqO0u+67Zyq7SqKG+kDFDvcnSyn1jhhP2h2gapaEdCKPhEzTjBbKMuhr3PuPOykZlLgbM+cKRhxcaKcfvMr6JSnbdhkvG1HAlGD78a29G8sgpuV7nCQ87IVU4+gG/ENH0Ib9eCOXfi/i0AgSVRveERP4VZY1byutoCXsGvc6oOXwZmaXhZOcmHAkFYWvR6ZsbJUfItmmUYS9kWkmZWZfXU9CNGpMp0fVNcnT6TjOwEj9Rt5LAvSvTFmkJ4aspTUnCxkvAjCBmKQ6l8cJrdvu8zIZMO6NnMFsz9SP48YqbYIhlbj9V2RtfTY4mmsOjrImV1hC5ADWI2CSD3LPHw56I8sllR0ABTaPjHCrDlbGkt1w867PybGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(10067099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGs5Vjc4TnZ6T3RDSWt5Y2FqZ3NSM1ZwSFJ2WUpKY1EwT2cwdmhmWEdFWEFz?=
 =?utf-8?B?aUN1dU5TZkNTKzFoTjd5aWxUaGpXckdYSlVEM3BzYnVsek4ybW9Ycy8vaDJk?=
 =?utf-8?B?TFJmeUhiVXdTS0ROOXRXeXJrUkRjeitURlA2aGVnU0w5bkJBcXZlVEVzQXU3?=
 =?utf-8?B?TklhVkZwaG1KN0NJRnNwS08xVmdTMXZoZFVZUmNhUlVXMitEMzBjUStxblUv?=
 =?utf-8?B?WkJ1SEluZkZ5ZGhCKzR4UUdTN3piUDM5cEhjK3R1a3pHMEtaWGp4YkN1TTlm?=
 =?utf-8?B?Qi82RGxBWjRJTHdZSE9aMGFGQWE5TERpV21ZOFdBeDNnajZGblFOTUtIcG9s?=
 =?utf-8?B?RmhzN0FwT0hSYU9OUjNHVzN1VDEzcEpCN3lvbUFkbkc3ck1LaEFNWkdqWm81?=
 =?utf-8?B?c2JkVW94cjEzcHVlK3Z0Zk5OMENVYUdZblF3WWc2UXIwYUFDcTgydHoxSWc2?=
 =?utf-8?B?OXVGemJUYU5ReFFNaEVzRGNZNmM5RWR6YWJiOHZDT2xGNVQvMk1xU2JmWU1r?=
 =?utf-8?B?Mkp2ZUZuSVhXZjY1YTNhK0h1K3NnYVY2d2pCemhuTzY1Y1gxd3pwdTduUFRI?=
 =?utf-8?B?UjQvZHdwVzJNNGFWSEtVOEJZUmVvTktuNDladlErTkhFVHRocEErNFF3NjFY?=
 =?utf-8?B?V0lldU40OUFIb1YzaFlMbDNNL1R5ZnpRNGl4L0Z6dWE0VmdVZlNhb05HQWFZ?=
 =?utf-8?B?U2tHY0RqWWQ4UnVkNkVSeEJCT2k4WXc4akhiU1dhQjU2d2RVbm9xdU1KSVZY?=
 =?utf-8?B?Q0VLK1EvbDNiR3oxcktvU2RmSUkvUXM4clBYU0xUVlorLzMxYnRkK0lJQ1RP?=
 =?utf-8?B?VEM1WHQ3T2FDRGJHR04rVmRXNU5aRU4xR0lsUjk3TE5pZitxZnh6YUY4azhj?=
 =?utf-8?B?aFdsSW5Rc1lOMlozUVk1Z0djUUI3NWdKQm1QNmRwS1VwQW9rTTV2a3J4MFg4?=
 =?utf-8?B?RjBFRzlSYlpDK2M5Y1hkc0czeVBZNWRMK1F4M0hEMGgxVjA1dW1vU0xKUE9Z?=
 =?utf-8?B?NmV0akJzYTZBM3VYNzZ4NVVmT0ppcGFYbWpyOHFUZ2E5U3BONUg1K1VNcXFK?=
 =?utf-8?B?ekIzZHhJZkVrR0hnc050cUFoM0NWbWhwV3FjZHl5T3MxeWgraHZlZEsxT2xu?=
 =?utf-8?B?cjZVWEdLeHF3UFM2K05Kb3RRU0RLNG8zU2htU0hPNm9wbkxlRGF2QlBBMUdG?=
 =?utf-8?B?ak9kL0dIbDdQTUdITHVFMXNjYTYwc3ZsZXQ4V2lvcHBEMmxrU0JZdTY2VGRY?=
 =?utf-8?B?a3V4bStobkJnTXR0d3N4VmNLWEJkaFB2U25idVZ5R2pPaVA2SmhhNjdSSHlK?=
 =?utf-8?B?d05CZFZMRGdIanNpTmdxQzdYa2FTLzRtRDRIY0pvUkNnNklPNlprdXh5WURO?=
 =?utf-8?B?QS94Y2FRZnhiS0YyWmdVN2h0bEhWRGxCQXhjQllMQ0g1dThrQnh0SVFHNmpL?=
 =?utf-8?B?TnBpQ3pBcFQ2UDMrdE9VcXBaY0MzM3NvVlBuRnBkeEUxM1dsZ3d5anhYc1hF?=
 =?utf-8?B?MTZrdmRLaTN4Z3lkelhzTjNGSG5jNjIyR1RWd2R6aVozUmsyZkdlSUV2d0Zq?=
 =?utf-8?B?eDYwTHhxaEl5Smh5Sk9za245Vk40cGRDelRnTnRTdFpGQ01JdnE4YUxxYU1F?=
 =?utf-8?B?bHV0S2VCUnh0MWVnR2VZWWN5RTNianpxVXRYcmRtYXNDLzVzRG5sdmxzNTJa?=
 =?utf-8?B?OTBmYXQwaUNoVnR4V1dEMkhnS01oeFdTV1llTFQ5QmNCa1I5RG1RclNSeVZS?=
 =?utf-8?B?OWgyeGtFYlZYTXBMN0VLazVPOWVGWDNWK2tYOWRjUGpJSFdJb1VmcUFzR0cz?=
 =?utf-8?B?NStjalZNRmlJRzJNN2dZYkdHc1ZqNnZmcUs1WVZmamk1Nk9LanpLaDFVUldk?=
 =?utf-8?B?TUt3ei9ZT3U0bjgzZ1JvQWQ5emkrQzhRd0VaTmxGTWFhNlpVa1ZYRklhbnpa?=
 =?utf-8?B?OFVTYWVOZDhRa0JiVFFpWUJSb3c1YUExVEdhSjd0cmVWTTYzaWVTS0Vocm5w?=
 =?utf-8?B?d0JsZy93eFJwSUNHVTJla3dyc29ubjZtQUhqQllYck94eUIvaHdOVEpaS2FR?=
 =?utf-8?B?VE9rV0xGWEw2NHpBbXoybGcyRnJCdXpTeUdYak80bGx0cW15N1lpSnl6UWJ0?=
 =?utf-8?B?dk94d0haZTZhaHFyRC83VTVhME1OMk9YdzJLTHE4MXlGbUl5UEpoOHJvOURn?=
 =?utf-8?B?RE1iTTM1N3JUSVZ5MWUrUmNjUWhkWnpNcEFJbGRqRVExdVhGYTlXZnFlRUlU?=
 =?utf-8?B?cURUQjhCTGVJblBkTXVEbkVFMUtiblpwZ1VLMXlpdVRTNHRxM3drYVhGbWxx?=
 =?utf-8?B?SWluUElXdGx4TlllMFBUWExQOUN4T2pLU3NITS9zaGZmVk5LcWVOUT09?=
X-Exchange-RoutingPolicyChecked: ftJvThCyVzMf+vMpf1Qfw2x1zcuk4/GSLslGKS5c4zfKw8I2A14MHKC8/BI4ZYcnOmy4GWdB9mMdKIsta9+9TstR79PkLXG+vlObd3eMS3i/mpM8L/5QBYemcZkBPvFdxAdvIG04F7SwUUaCsFhEUniH3u9JMuuEPtfwEq5NJ6h8J9pZe4+5twAvS6QeCFLRINWXJQquzET3TqcuJJu7uHXMiZs7b8ZgXHKfRckevqJVQ5LuzbhGuj6Oi+s81hWiFrCHjsxc5cKmk6TLGK95SZQZQ0SJcNDX5kCTfxP5QNNd1/yHKqdTD/GcnNKuQ+J0WTgE9d00SzVZ0Z1WfRI++g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5b7856-d43b-4b21-8bf1-08df3fb7a47b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:50:08.6185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VD03yjuwmerDBaCecPSaHEqNUcEjcB+HUBmdkSGXph+lnwhF45lv+76l1NKnryWTjoLrEhh7AgMv5QlDdVSCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9917
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11-11-2026 11:09, Raag Jadav wrote:
> On Wed, Nov 11, 2026 at 10:13:44AM +0530, Tauro, Riana wrote:
>> On 10-11-2026 18:21, Raag Jadav wrote:
>>> On Fri, Nov 06, 2026 at 12:49:48PM +0530, Riana Tauro wrote:
>>>> Runtime surivability mode creates sysfs and declares the device as
>>>> wedged in a worker thread. This can race with unbind.
>>>>
>>>> During unbind, devres actions such as disabling the worker run as part of
>>>> teardown. A runtime survivability enable that is still in flight or gets
>>>> scheduled in that window can create the survivability sysfs entries while
>>>> the device is being removed. This is incorrect, as runtime survivability mode
>>>> must not be entered once during devres teardown.
>>>>
>>>> Use the DRM device enter/exit protection so that the enable path
>>>> synchronizes with device unplug and returns early if the device is
>>>> already being unbound.
>>> I'm a bit lost here. Doesn't disable_work_sync() already guarantee this?
>> If the worker is already queued and there is a unbind in progress. The
>> disable work sync from devm
>> action waits for the worker to complete. This causes the device to enter
>> survivability mode during unbind
>> which is not intended.
> Wouldn't the survivability stuff still land on devres and get cleaned
> up anyway?

devres_release_all running as part of unbind copies all the devres nodes 
into a todo list and then
releases them. If during release, we add a new devres that will not be 
cleared during unbind
which can cause stale sysfs.

Riana

>
> Raag
