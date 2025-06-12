Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120E1C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 19:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E3810E168;
	Thu, 12 Jun 2025 19:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ka+wyLK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEF410E168
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749756678; x=1781292678;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ua/pD+F2e81PzcTKEgBcBUfNjcoirheRCVj2YYWyfaM=;
 b=ka+wyLK6BjCcewqdMXbFfwJb17gP5qyFUNudlm7vMMDUVKarMr7h5b34
 eg4sm8YEy7LEJE7si5rla0iPbanuKGCe4LtDyQWr0NiTjO16DFEq48iHF
 o9Lfiuq8qXYrlav2muOZop/gPXIWelzni/+njdeSLW7sTf8BounOONH0b
 vez/YOApEKWwCtGBKq01oubLoLQiZEvD7Qyi8z/RkqQEd6s3GxrL3Ynzx
 V8m7GJ7VLqqd4VYrUEJNEj8ysIGMYoYbCyr5yrubRPBzLP95CrOXQ1nWQ
 zQyNHA6qf18Jz8t8pdaFC2LSeO5DS11UB8c79m4VM1Mhpz5bRtHX3WvwS A==;
X-CSE-ConnectionGUID: XVMwJ1lXSU2peHsINeLF0Q==
X-CSE-MsgGUID: LBgOG0odQZmvxOvc/Jj8RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52094963"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="52094963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:31:18 -0700
X-CSE-ConnectionGUID: ce06hpFmStWWSlDBjJgrDA==
X-CSE-MsgGUID: EhkxRi2/RwyHqNe5UxJ0bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147473308"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:31:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 12:31:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 12:31:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 12:31:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGhSZGK2oQTQFR7Jmcli4hCWBQWDnpibsDErEmz0Mvnd/qlwCT4dYwS/H2Jfj72DPnUOaJy2CaCEXzqS/j4gkUmtbQAeTjlE09W5g3qhQDa4g2CmveooGGy48J6RnoHa6N+1RMOZsKFrlXwUWlIoo/QIiR+Z+678ri9nFOQow3apmXlXIYMRSahIEgZTlOVWCHclbciiDYEsOB5sgm/cN6sVAzE1mpdDNWDZ/GRdfoNn/cVdW5+PrxS7csUeOFGJC2KvI7DFJIDZgT0bDQ14ENzEzXDwsSHDKbHYk0sLFDcRoC1+oa6IgBNaBmEq+AxPrDIe/P6cOzXHaeuwPS2vWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zloa2LkmOoa0PE3PdqZWcef/VAqXfLlXbooah4loLiM=;
 b=SHOI2KtcYX9A9Z+NZ8izpq94T9HN3b12kA0GVCEdmJdwTXS4jnGpnPcKma1/3ClK4RYJJ4Gb6oQ60M8MYVR2rMrZnaEjre6BebLhxoL32+pXdBKLPoUEBZ56+jjYQZDarETzr3XXQxb7EcQXOBFL0Mq/3eAThR4Vkop/D4GLBm5NHZUYXBFTKn6VMrd4R6ZrhlvaHNqJ37OFVErcnzukO8VOh+xrpLxywZ20Yhm1peBMcXOsrncI09Y0yMqrIMngVog0XiAkYHuJN+EiSYL06XslybnHHTYN+LTguK+D9z7l/sBOofwXYwaGCF8Mu+edMRZ0fCf35moedFVQBB3gag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8394.namprd11.prod.outlook.com (2603:10b6:806:37c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 19:31:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 19:31:06 +0000
Date: Thu, 12 Jun 2025 14:31:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/bmg: Update Wa_14022085890
Message-ID: <rghvmypkecku6r45fef62b2epqkcknz7lp2xim4yubx6akdap4@2skodbxg6gjs>
References: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
 <20250612-wa-14022085890-v4-3-94ba5dcc1e30@intel.com>
 <928717cd75ee2ee36dee435d31bd7bbf7ab60f0d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <928717cd75ee2ee36dee435d31bd7bbf7ab60f0d.camel@intel.com>
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: 643039a2-55ad-433d-2209-08dda9e7ad47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GlSplYdPcjrtabx37PJW5bMbwQk+GlBcN0hQ5ZPN/ckw/wfJ8WJ0N0VM70?=
 =?iso-8859-1?Q?hi+LpZV9+ualHRZVNvG/+F7UY13TVFlSXAIXvgRT0MkNBPU6cKNB+Q8xF5?=
 =?iso-8859-1?Q?82B5j27c8tt9lL1tsmtE4hJhJWFitFWXiUZDuH6FckCd9Vv7EAzvGcHFA+?=
 =?iso-8859-1?Q?OuToBoCpTDyUXWHT3mzJDqD2YdJY5i+24uBfFucChVFoiWg/hqJGcRLVQi?=
 =?iso-8859-1?Q?zjH7RMdPbgmvrMLQP+0UfWPfUmUbtPiNbkiuptc3wQzskiTdNQsY4QfS+u?=
 =?iso-8859-1?Q?6Eg4ZyS7906AUSSzCRYIZhdqZ9KeX0T4q9R2rzDzeMkozORTKTMStJ1wRF?=
 =?iso-8859-1?Q?DIC24Vj9k9EW6oJrZeG5+qFNSGZs+g5SrcPI1nWeAbOOKMGKtHsJNOqWdT?=
 =?iso-8859-1?Q?e55gfzZ2Hh93RD5VxONYDKtB3z80NYLYykB/+023X/S0wiK+0dU/H4raAb?=
 =?iso-8859-1?Q?yjWXuQbzIoqod5dpu3n4/J8jdXxZVRT93EhK4rhiU7IkGhAC3URqhHRcmX?=
 =?iso-8859-1?Q?H4VTCmpkd3YbchBpdnbtaFjC6InTLdbWNjYsIQh35dEMXDGr5ojVXVvMki?=
 =?iso-8859-1?Q?QV7fedZJC6DdoAdYnOwntx00OTkJn0kyRuyCL7hM/gnT+dT1HDpG20ljFy?=
 =?iso-8859-1?Q?QoOOTwg9Hkb4OpI5wb2Hufm4/jB2guSSnEI5bUborLIUkPg9CAtSBT0i5M?=
 =?iso-8859-1?Q?KaAevR+UGihccv2IGscBLJnEg1I2LxGH0H7/oqNmmoPYIomNVijpMWWb/P?=
 =?iso-8859-1?Q?SMrV5NSXWU73mw1q+yH1lwmu+A7448IcHgF8cipmBGYYskYagrvUFZZJFF?=
 =?iso-8859-1?Q?zYe5cWh09x0ZCUWHWaj+7keKqmLJDzGbHLucpl4axjKDKBKCIyIgM2o6cl?=
 =?iso-8859-1?Q?N9XWe0/tHGvvfQpL8071pR4sE542S4RP/5cJphxZTAhIaHLRq1ZNb8m8tn?=
 =?iso-8859-1?Q?0oQN3dWlqm/UR3FZixzH7EkqzAJA1Fon0KHH4rZ4tOHYVqaHYSTq6SmqOK?=
 =?iso-8859-1?Q?VQHOin4794JfVp5gj8mLZ+MsyLGSYiZRe8yfgNoX/GDKRRwhbPBnzi+ZL8?=
 =?iso-8859-1?Q?62HZ5pO3tK/MCSnle7C8aNfm8rzgiqGT7bpoFTYPZaa1wjX66cQtvt+vcN?=
 =?iso-8859-1?Q?hTor9543YOgy4IYkvWQQhYqcIzR0ZsmttYU52Yyf/gZMQT7EmlBBGs9XQ2?=
 =?iso-8859-1?Q?gCJRx5e2ZFxS8DBJUQcKxovYUL8O9NEvdyRKLE4oh8aL5Tc7EGx6bgzhLJ?=
 =?iso-8859-1?Q?D7PdHzylIgIS2hhOlbJcubFT7p3n5OMzwb7s5A8x2RcriM/Z/4/yr53o3O?=
 =?iso-8859-1?Q?x9kB8+3Fj7FNG45+ZOOhuPbMrkP2kXm8G5/UnVTY0ta3fJdmuPoOniE699?=
 =?iso-8859-1?Q?9lQcH9s9d938kqtTojVNYcTb2Z/RQpIeLrY+sYfKBBoEuugS5GBQJqIXFG?=
 =?iso-8859-1?Q?vb1wvpwTZTfqZlc0yQDAGuFZ9k2xxlj+tgAJ3xDBrYWaE6xpH2ehEk60f6?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WDsIeastV+Uu0n21SOFCYJ9X6CBzxZahNby7Pzimqk/5ELF3UTwkroPh0p?=
 =?iso-8859-1?Q?RQv0XqBwjzLfqnH+FqU3OWDcRTcCeE7F00CKbIlYPbHwteFpm5kV/NKxgL?=
 =?iso-8859-1?Q?j20rHs10Z+EWG4u/vhAy4SXVqgrPPu8dNYr21o45969zY2pJnPL4WC8xjL?=
 =?iso-8859-1?Q?1orhw5SxSc47HV/ul+gd9LAuOOGi+vNUPAUhPeYZ6fIlgEOzPB8HBGZ8Xc?=
 =?iso-8859-1?Q?4/w8IMwsS5gtgMTeCt9pCWhhKYUFEL5qiOSo38WGp8POQcTdh3m6f0s6GC?=
 =?iso-8859-1?Q?T0DfXeOcKeD52DTbyhxV0ShJAMw3B7Dtb1eh6AEWOxLJkHJhh6wpxIJeZn?=
 =?iso-8859-1?Q?NqAHq9QrzVTDV26RbSNfJ9yRwkQMLjz96Qu6fuLzr42bmwZzO81uWixfOT?=
 =?iso-8859-1?Q?KSJX9WOCYN75hkaSWNWPicUkgGB/0VTwfoiEsonL9xVpxynZfL49L8SfPn?=
 =?iso-8859-1?Q?w85imeUBmtp4IH67BXfjp0FTppMEjJDKlFnMcgPFJjUMNd0oY7xeWyLST1?=
 =?iso-8859-1?Q?j9yPrzrpwM08ig5Iqe1e+9x2wMdpQvPDglV9C2urGNkRG4Ma1pJSb3TW70?=
 =?iso-8859-1?Q?IY0tRfcz1Hw+gxaqlbZ0e/Uvrs0cwwysmptzB55ogvUehnNEicXBOwFl5k?=
 =?iso-8859-1?Q?fqc29wnP44X8kZrMW/ttVwd/0i0gHBNfRQOAJHgPFBOJSa0oRFNiPsOrfs?=
 =?iso-8859-1?Q?bLHq4ZHxyp57QSvp1CNbMF3d5ktVUpxTtNhJABL0RxQKTuxz4UNemyBlrE?=
 =?iso-8859-1?Q?5EvmIs6yeL6ipaJB1dVCPv01XgnpivhLSBiBLEbBhpzlMNxx6DSIpokw0B?=
 =?iso-8859-1?Q?3xJ87v06rUjc7opzHsRaZuXwMGS28Z2GlLWcEQcJpfPspYORAzwU3yUIBm?=
 =?iso-8859-1?Q?xDEARWJeedBHmwpni0q7gXycvquXhKggrnrVaVE0sRKq9OXaDWHhY17xZo?=
 =?iso-8859-1?Q?QZ2c2VDIj0Ax5F5o7Rp/Gy+4vAd+g8F8kQU6N8KNbIvgHZm3dqye2q9JJ/?=
 =?iso-8859-1?Q?HPdQMjLOz59+w6oJfRlRVO2RkEHKFZ7RcjpDm8FyDixGzD1+lzkFCICRK/?=
 =?iso-8859-1?Q?IiJ57Irbgy+sE0DOi6yQFJnLjk2edvUrb2fM0UCkHGgCVEm+dJLlmJ67HY?=
 =?iso-8859-1?Q?ZegXJ8fc/xp+fd5Yi0Q4GTDRT5o9Y4kbHudS17LF9q6fpYdmeg0pZt7/io?=
 =?iso-8859-1?Q?YtOIXJLKuSx5q7xBuVz5oNttMg9xAXQIpIwCM8WBTNioqHUcyy5JsN3s6U?=
 =?iso-8859-1?Q?igtlQfb9wmFf4JV+ty4Xpv4cTc2Beh2up2ziqLGKprwQy4A3qQfM+I5CgZ?=
 =?iso-8859-1?Q?RdEqnuw75tXR2q5zGDgH1pPoKXiGNs5Zp3m8P6xcSpoN3+RslSyB9piGtH?=
 =?iso-8859-1?Q?If78v7qMj0b4b/g++PScE4JIws+Qd4kPqBTXC1RpSrMqzxjhIuJyba+1JP?=
 =?iso-8859-1?Q?aul9AiRSaC2oGRJe2sPuGif/s8RxwHI8e7M6cmFUD54fC/8TPoLPoMcNQA?=
 =?iso-8859-1?Q?F8W149vtYriJLd7avNkchQZjhQGFaDNkjiS1QE23Q0vLoux6DDSHxYhFiT?=
 =?iso-8859-1?Q?XTXx2VldyPR2kJKhrkd4PR2aw5pUmlqORLwIQDGgcy7QbyF7vr9mN8fu6b?=
 =?iso-8859-1?Q?aPaAQTIqYPcUHcjbdKI3S2uzaKkLmUo5YKibqJY85laDyA7CNspeFz7w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 643039a2-55ad-433d-2209-08dda9e7ad47
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 19:31:06.8156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsidCe4ApCLoIKO+WDxZmflEatH9pg2oCdWHxYF2vF4+1rY+YGN+hr0SAMzYyqkDC8YQeP8l+GOUQIWKAncwxIGN7rOrO/Q9yB1H4NlQJP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8394
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

On Thu, Jun 12, 2025 at 07:15:14PM +0000, Stuart Summers wrote:
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 425cb401c2762..38b589fe9198d 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -59,3 +59,7 @@ no_media_l3   MEDIA_VERSION(3000)
>>                 MEDIA_VERSION_RANGE(1301, 3000)
>>  16026508708    GRAPHICS_VERSION_RANGE(1200, 3001)
>>                 MEDIA_VERSION_RANGE(1300, 3000)
>> +
>> +# SoC workaround - should apply to all platforms using this
>> +# graphics version in tile->primary_gt
>
>If this is an SoC specific workaround that spreads across GTs,
>shouldn't we be using the device ID rather than the GMD ID to determine
>the workaround application?

devid would be a nightmare to maintain... imagine each time we add a
devid we need to add checks in multiple places in the codebase.
We should add support for SoC WAs properly and then migrate this WA
there. No need to do that now though as that would mean a much harder
path to linux-stable and no real benefit.

The way it is now, we eventually remove it from here and add to e.g.
drivers/gpu/drm/xe/xe_soc_wa_oob.rules. Or even just keep it in the same
place and do

-14022085890    GRAPHICS_VERSION(2001)
+14022085890    SOC_VERSION(1234)

Lucas De Marchi
