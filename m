Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F4DC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 11:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA7310E3E7;
	Thu, 27 Aug 2026 11:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7jJL909";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47FE10E3E7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828512; x=1819364512;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0N8sL5gQzoKbxGIA035ZFp6O1Qbr5EvWi4WgJaQUBHM=;
 b=N7jJL909oP6wej13mcTYGAzPx6LJR04R9ZKrqrieMLRRFp59KOsEGan1
 3O3o1q03FJox1tBQmNzo31Nmt6nJjXyEK5sJSZQxYcXkLfTEAql1yHC9m
 jnD+ZFiHgbovSomkJ3+l87tTrnWOiXFNgvKpE5lYwrR+GdNJY7MFaxzVF
 ljW7P3F7GVArShsvY4G/s34yH0Dr4MDH0z4fefCh+r85zupm1LCPnBqz/
 t85pi34VWWbzNBL/zxVXZtPbq1vUT8TPChYHBeXnXHlw+ufu2wEwXGA/X
 fvOdaQ2rrjyqRk0KJFZp5bYJwxl3G8AH1X47AoQmiFVFY/30rGv5NtZX+ Q==;
X-CSE-ConnectionGUID: dz+DiiNmQs+jz90QLZfloA==
X-CSE-MsgGUID: siGlAYqMRraXkzz7GrwYVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98992003"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98992003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 04:01:52 -0700
X-CSE-ConnectionGUID: X6g7UITSTZadHbZuQ+XN9Q==
X-CSE-MsgGUID: kX81MicOTvC4x8PsNI130Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="268410551"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 04:01:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 04:01:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 04:01:50 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 04:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyVmADdOlNJWDj/i8xQbOq+Pjz+JO0hInKwgmM18vBDbp6yk70PNRRi91W4kV06x/b8QazomSPlET53Na0CPmfIBZ/4d3FbIdlDmxOUQniuIcJuuADZL1E0GgxMxlq85qWPdtz2DLPrm9XocdpPy9Hm+y8/TlBatYr5kXyYFlOX+9J1yZ3n9DlllDgQ5j9BBWg0AoBIFoYsFVgVbCJet38T62Fiu+LkuDtsx4WSMi5yZtJLE1ct7/94maPYq11XKVGy8p8TEZm5Yhvm5Pyv3YdxELw+csMjb4Ghpma/Jg7eVPQUfRYoXY/IdbFPSFfVPcG7VrtgBQ3TD0ywLZrOWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqeY+oHrPJAgY7sjRc9HtAQ7rwkeypSpYicHsy0kzTo=;
 b=N0ZLfxffk+tmqdbKW6k5N4zevT6fLKy9kQ63dB32Rpmtq5wcUYzsIUBMqEI2FPhrmFD2RkCWhhZppW/7XGi5dioq90abyybfu2WSgTnBDYU0Jdm4bwWfrxXO+VLIIPHVeDnwmCTJkSiH4gLCJ9RUss59w7sK5fWHUHn3O8/ZjsOVGK8IuDvKMEz82Uy+RbJfolsdp18bM0kzON+qB8pm8CZxP7iomMlz/yIfmXI61maGUIaZ6fwSMaAa2y3nxJ5YUKppgkvGUK/wEv7JjwJkd9qv3bjimDIdw3gtAoqHQdJs0QdbAc04Wx1TAdNfIN7jv97dCe44ds90eYIvGII66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8593.namprd11.prod.outlook.com (2603:10b6:806:3ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 11:01:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 11:01:42 +0000
Message-ID: <501ed58a-2f5a-4d78-bcba-e7624b507170@intel.com>
Date: Thu, 27 Aug 2026 13:01:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] drm/xe/sysctrl: Log group and command ID on
 mailbox failure
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-15-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260825110542.1359776-15-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: e7077cca-e564-494b-03bb-08df042a93d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IKHE/wXsCiY77JU4V+Jj35OlkWC+729aHzLwM5dJUFmv12qJHwU3IJvCu7bH3jCKCEXk5ZetC7b3M1iGuot1ob5RZ1+etBeVadHy4myz56XT6i79c5AzH1HCvjuvTRaKPtvy+bdwuuFcqYJ4OmIcfK+mbo6lQQKdZYHst6OXnVJuqv2RDyTDtH8rT6rSxS7Tot5/cuwhuT8xjduiLSuqVxCWjq90emC1YBm8DvWZrPB+EyJNBSBEv9v60be+hSX1YSzwtdqDtu9ttEfwN8Clvh0y4QDaegkxtZU1YuFrG5TzlQW1MUJtSiKqXFR4HhRA4ixIHek9xXtKpehPX+yNl1ZzAAYHA4A7SRncda7ocyUTePp3s6/zmD/iUl2MhBT5ZTQKoUirIG+dx6YrsLZlVYsmE5MIm4PnOkpwW6wc7qiIF8RBDnG1lKdiic5N4/JJqM8FY752MQGzYKpPyvgTqajRCbyvPqZxtEOQqymBscGMCUqvT1Ryp8i0Bkotuv+FzPJdIZvA0OmMR0R2Ub6ZOo2WjvTbLgeAVoAYyweoLAj57ZUhtcBNgmxreiThbCXkQm88CDVUDPJ8XhP5HKbn02wp50Zk0i5IxlFFUp5xN0/tHntR0RVWNYaTr/8I18CAi7bH73hSylX20FrAuWo5zlwQj0MHVbz98u8FqX8O/Fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnlWRnYxMTdmeVpaRTZKblVKTEw1TnpCNEVPSXZKNzkwaVIrYmNyZGNxL3Fm?=
 =?utf-8?B?NlRSUWJyVHdTS0drdnBMSHU1Z3lMV0dIcnMrN1JKM1Y5WEhrdEpFTm0vUGtC?=
 =?utf-8?B?bm1ZQUhtb1c1eURZYUMrT1lqOUtYMkQxZENJMzE0NnliWVpkR0RFWEE0aWtK?=
 =?utf-8?B?WFE5aDVVU2wraDRXU2VCT1VRcFl0YVAyTFJsbGtPUWxYdktBZUVrZkVmbmhl?=
 =?utf-8?B?dkFFaGt2ZGdEUXEvN0ZkMzkxazNxUlRObDRrZDhlajFRbi9yZmpEQzNtVzBB?=
 =?utf-8?B?eXdSWXRjZ0txUFdUTytRZGUrbFhDeDN6T0dDaEVpUi9SaWhSUk9ZaXZ5MmRl?=
 =?utf-8?B?Q2hqdzNSSWdndVRGcDlaL3RkdFFpQVRUcWhTSXY2VXo4Z3hBUWp4ZjI4TldD?=
 =?utf-8?B?L0JHSVZpQ3EzWTV5YzJUYVZFZXNoblU4SFpwT3V1VW5IbDFlNmY0bytkbWgx?=
 =?utf-8?B?NW5md2xmbWlVS0g2djU4dUVpdmVOUFlUREYrRVhKYW5xS2kvVGJwWlR5VWRx?=
 =?utf-8?B?ckt1aE9weTJ6SncwVnZDV1gxREt3M3pJN1VnZE1FWFQwUXovWUtUVk5pTmd6?=
 =?utf-8?B?TkNXK2xvckhTNjkrcFdkdjZTQlE5Zi83ZnVyMnJBdm9ySTBVZU1MdDNzekE3?=
 =?utf-8?B?T2Faci80NmZlci80SGZCOGdqUUVkVkFhWEV3bGFxcWI1Q2pkQWtVNE8xWkU0?=
 =?utf-8?B?TW1PUUlZaC95YTYyL3lNclFKdVpwSExNdlZ4OEo4MUF4bFczMGhsZ0toUWlX?=
 =?utf-8?B?L0k5eFFrVWkxM3NPb3pnVDR2cU4zVFp2NUc4V2JWOHlzekxHKzVKMGFpUGxD?=
 =?utf-8?B?b0gwQWY0NUNxdnp1dFJxVHpKa1ZJbzRNdUpOcEc4OW1peXlmcVVxSU1DVzEx?=
 =?utf-8?B?SlIzNmZVeDZCbmsxdlRaemZZRjJQVnBrOHB6U1htd2QyRmFmK1RJWStzck9E?=
 =?utf-8?B?R3VTZTB3Nk9qWGZPYzRmZmlRTllnYU91YkVuejBleHM2WnNCQkE1dEJ5RkxX?=
 =?utf-8?B?a1NtWnNQaG8xUzFKUWt2d3doazdlRmZoY0FoS0s4Tjh4WmtDczVQNWx5RmRX?=
 =?utf-8?B?LzcvdDNsa3NhbU4rRkZrRmlPbEVGSmRlVHdidU0ra2dVQzB3ZUxOellzTWg5?=
 =?utf-8?B?aDRkT0JsejRQY0k5SDhsQ0Z6V25oRy9nZENCdi9WUHFzcHgzMmNBVHFicDNI?=
 =?utf-8?B?TlNva3dFdEZka0NMemFGN2FJQzExZUVTSXIyZXNDYlNzZk1vT0JUYTZlQU5z?=
 =?utf-8?B?ZW1QZFhOWTVxdHE4ZUp3djNJSVJ2Ykx2SXZvcGlUK1ZEd0tIcGdwYXRLUTcx?=
 =?utf-8?B?WWtHNHV1NmdwV1FFYlRlTldsK1JQQTVjV1RUSmU5YmVDenA2SFd5UnJNdkkw?=
 =?utf-8?B?b3ZFTUp0U0tFQTlVQWZ5Mkc1c1RvOUdpY1ZjN0VoVzAyNjBnekVRQWN6T21i?=
 =?utf-8?B?a2U3dFcyTGIvTzA2UWNrNnE1N2ZpcmUvRld0U1RUZDR2eTBWWWtMQ0MrR0NO?=
 =?utf-8?B?a3ZjNTdPR1hCeWVSa0JHWnNNWS9UR3IvMGdpc2Fmb09ibkt5WCtVR0pxSUNP?=
 =?utf-8?B?OUNNNlRFRk9jUDB0RUd2MzZIOW5GZXNYcHcrVzVGbmMxS0dYRkpmNW1EL0ZY?=
 =?utf-8?B?T3Vyem5YNUViME9WUDVDT0laeStDM2dabWxtUmNWYUd1Q2JNT3RJMlJyL0VT?=
 =?utf-8?B?VnB6YWw4eTJQRFppN3cxT1hYMmZEeEdJTXg4MEtscW1JTml5aFo5Zy9JY2Zl?=
 =?utf-8?B?MW5uSWdWSVJTa21VMnZIWXhYWnRmNmM5UVZLTDdEK2JwVXRDQ3IxdjlsOXZt?=
 =?utf-8?B?YUVmR1hZM0RYZ29LTjNpYnU2TzFtWWZqbVFWVHdYUXhaaWVhYjhoVGtxbDZj?=
 =?utf-8?B?NmFTWE5xcW12QnRWRTNhUkp4blphMGFDYmJHcnloLzNWa0U3NzVYK3VFakNE?=
 =?utf-8?B?bnJwakJObWZyOTBVelByd2E1T1MwVzhOUGd6SjZtQTdyNjNmcS9IVjExL3RM?=
 =?utf-8?B?U21iS3JxUjlaaEszeGd4aDcxbTV3TUZka1lMSm5QZTBtOGMwUWpPa3JWdjE4?=
 =?utf-8?B?UzlVeG15Wm14cyszdVd3SEZ5c1hBNUNuSWZZTStlOWRuQnNyczFQVVpXQUNN?=
 =?utf-8?B?SFBNcmw2dWd0d0t4T3lhQ0NsTDVmUHEwRXNab0pFeEZNeUxYbllCTlJYV0Zl?=
 =?utf-8?B?ZnhkcnJjcUFYV3lBMWtKTC9kVDZqYjJ4azVSTisyREp1bmRCTDAvYndhamV2?=
 =?utf-8?B?cXJGdzllUWJJQVlESnZPRWhrcitjN3dQMnFQUmo5aG9EWUQvb3RTbWhhL0d2?=
 =?utf-8?B?ZXI4alJXQzJTVmZOZmVJYXFkY0tJc2FxUGhWdWhJckZFSzJzR295MEhVWUli?=
 =?utf-8?Q?quX+7cJGe5E+5l0U=3D?=
X-Exchange-RoutingPolicyChecked: tEQKxyeFxlWVRwbc8MiqMUlzTPsjMfP+UUsltK2YpdgjJrZG49/vMXpWabmZ/qhhKPYA9UlDuos07QInamQVaDboBT0tJGzcN+fBL4qCkSYfCAL4hpDIsEuJBXWIm3kVOP9s6rVqguTRtGorVUGi99A1cpBObiQUT2fUc+1jLYTZf03wWn4py/LomFMrmZTtb7B/toR89tyvpbFq+JwzOXTNbBPwCIBtBVM28GXZY9bNCLc8C6kZH2YA5p7M26HTmx6hw1EOzZw6j2QAqUgk1F53J5mdx1hEI/IzzHXIpIrtTuTl/+r9P3sY0QoL4EsP51JmBBfwl5rL9a7H8eBybQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7077cca-e564-494b-03bb-08df042a93d3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:01:42.6393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSsV/hj3wUJKDyM92UmPw8UgT0BQDME6+nKGF63l8TU9FfXTQ8x/NRg7dUNfm7u8LM/L966CTW6R9DBFThdda0fOYfSYp9v57gyqRUjfUfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8593
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



On 8/25/2026 1:05 PM, Mallesh Koujalagi wrote:
> Include the mailbox group ID and command code in error logs
> for command preparation and execution failures.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v5:
> - Use REG_FIELD_GET instead of FIELD_GET. (Michal)
> - Modify logging message.
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 6 ++++--
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.h | 6 +++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 5032d766b314..f55f72fce994 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -373,7 +373,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				      cmd->data_in, cmd->data_in_len,
>  				      &mbox_cmd, &cmd_size);
>  	if (ret) {
> -		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
> +			   group_id, command_code);
>  		return ret;
>  	}
>  
> @@ -383,7 +384,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				   cmd->data_out, cmd->data_out_len, rdata_len,
>  				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>  	if (ret)
> -		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret, "Mailbox command %#x.%#x error\n",
> +			   group_id, command_code);

nit: maybe to make this msg similar to the previous one:

	"Failed to send command %#x.%#x\n"

>  
>  	kfree(mbox_cmd);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index fb434cc165b2..df7dfe3b39e2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>  struct xe_sysctrl_mailbox_command;
>  
>  #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
> +	REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>  
>  #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
> -	FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
> +	REG_FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>  
>  #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> -	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
> +	REG_FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)

nit: we should likely mention that change in the commit msg

but anyway,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>  
>  void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
>  			       void *request, size_t request_len, void *response,

