Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEF4C54FDF
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 08:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797EA10EE49;
	Thu, 30 Jul 2026 08:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KuMA29jk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E340E10EE49;
 Thu, 30 Jul 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785401726; x=1816937726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=37UmIjzGl27h5pnfZeFOy3y4BKqbzpyzDb9P0pkJQrc=;
 b=KuMA29jkdxaim6Cy4uieql8JfGiwW+VHlM74d86D/U44pNPFFU3uiIxe
 EQV11Aj2ghrQvAT7vz/SToQZbv4yd29tEVmEwthgeuXW4xab1wXjXVDJG
 R88LLb8UCX8xmWAjmZNBwuRbHb3fvNmqY7XEEBCFFDxITf8Nw4N1ig0ZO
 70b8NJnn+Ua+WYdwqW7Qz21lV5epa32K1yzE9vB//ZCCTzlqmonTfPjts
 biIDgv1ZsjMEfhpq7ZTKuRsG7xaN1jzM6swe9nOaSQjR9mQ3hfjRLDlrM
 pa2dfXSa26JqY+Mf5JbggfesJ9N1SFaOT/7TSS7/cGJnXn6hAlWjvN5Sf A==;
X-CSE-ConnectionGUID: 3QLZklNlTR+U1lInCahh+g==
X-CSE-MsgGUID: zQ3fHhzASeiajaSefCnkGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85870873"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="85870873"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:55:25 -0700
X-CSE-ConnectionGUID: /ILUJuRfQQuUCGCev24Z5Q==
X-CSE-MsgGUID: av4pqNIrQQeXbfzrN5FpRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="258468368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:55:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:55:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 01:55:24 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK53pqqHW1NWY6rxDF0Onj7yHgMs3caqpKPe4leKCtprJF1S/s2y61K+cWEqBaLUFzRrghOgvnAzY/P00fZIZXTAQcKrd/QdduSNMOjlrmcsMAZUEK4sE0oewPuU/aU6T6rVqa6MxN636AbB/0jHr9iNMU2PLlTSLVUF8SPlVG2xdeXWPBIJ48h6M9V8LRIVE+PZ97YtMFI/FmTyqxLpiKn1vije7XBqinv10QJG/24dsp+kfwhQIbkoWteTEtJiMPerarL2XNu/+8PDWKhSq+WmHfD6XFm5VerbMS9LmtKnp7LlOEKppUMUMlIdBmazGu4/4kyHW4s9IDPsCSLGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESmb3K8XcC0k/IFajTQk2EwoYZqMvzChjS5rxrZHoJs=;
 b=Kj+GvhT5Zm3VoIKPBGBlfGHE9KwMxw0leOvyuZQWOfDfINTv4h6fgEFvnJy0wUfic1jqMvo+l/mdSBQ9UDZqVIEHbjZ1Xm/XTwRRH8RNCPPQjCDL9KqKbBAPYqn/hBC1o9lsUTc2y8jab6tvkxWhMmlhJSfDzw/ovsnJVdXDijDtC4lFTTjPvfxzv7vP1R7anJHWF0Lsou5IRdq/Dr5r4TXAV7SvjSDhhXWDkbBEeGLS5Wpg8avJaB4rfIkcZBLLNt8sy0P/XxOv18bmx9C8hlBKsFoL/JWBs2dlqqAWcM5+x6Hkh45+MjLfpQbGK1vBdGCHj+y5QbP+kpkZQVNjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS4PPF2F49754B6.namprd11.prod.outlook.com (2603:10b6:f:fc02::1a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 08:55:20 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 08:55:20 +0000
Message-ID: <a3b2c33f-f2c6-4508-831c-31e3cf2eb048@intel.com>
Date: Thu, 30 Jul 2026 14:25:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/10] drm/i915/vrr: Program CMRR enable/disable from
 transcoder timings
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260728145943.3848704-9-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260728145943.3848704-9-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0265.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS4PPF2F49754B6:EE_
X-MS-Office365-Filtering-Correlation-Id: 726e3d11-4ed3-4c6f-4276-08deee1848ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: thr8FsAPnsyuwzGq48pF2olMN1Hq0iq8YA1SUuICcbTU+3uX4CnvzRg/FzRwO+cS0p8hGe8V71+TS0hD0M0qFvMSJGtWrkghbU0is4exCpKcLWhiLQEJUz2A5H9WXQUfDb2jF5WDf6ALLo0pCWI4CdmInBNJ+Ndd1Oxb2ZOSYCGGaghrHVmrOSkknzICakIxTFIMfNBtWwVF2wm49dkJ6S1cyXpG3KhfWg3VWEctnZQAvSnT4JnkGWeInSPoqxANitNVA8go/K/ChHYQmgzm4aBgR3U7EnyNomLNTNKn89S1WrLfBgbj4HqHU9JNpz8dt74ICajoTXWxrUYUss+8i2DujoBd3Fkcq1lnU2gjJPmYkpBTTpCPCoERxY06tcnxsFDgHXeoIrMFEOWWwT9mGWABPZQHJvjAf/eE66nwVsVVNLj3PjV5+IRvh8/tzoTCHyfN0MKdbNYEsuKgs4jTSoeAwk/2Wbocbt3l78E1jogh2AYTuFIT6QPTY3bW+WWtkfcjp1p9L5wrN3u44DeEAOePBmhgKnBHvzrnS4jz0Rvpnqa5SDIq+EncZWJwaWJyfte1Vli5BxjLn3mmOAPC3+uGtjd08b3zi+AMlFPMIG9zIVfm/E/9ph9S4FTkac+clBSqzE9QW6BprnD2ecZSp+iwDes2XQMsFefj/XVfr3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEU1YjlpY2hpbnJSVmZ1WnRWalJOU2JDT1N1cUpta25BYWtBNkdvSGZtQTI5?=
 =?utf-8?B?RjVOdE9OdWMwNlVpZUppbG01anpCTzFKQkR2cjRBTmYwWENxNFdKanFqdlc0?=
 =?utf-8?B?NVVtcWdzRjBVUjhMUEVJbXZ6QUNHMnFTL1FyR3NsRS9xdE1yaFZ0Z3czazVI?=
 =?utf-8?B?ZEgwQWdBQTVqUW96QjMvRmJlQ21ycjJuSjJMQmJMVzM0NGFHMlpWMnBJYWxH?=
 =?utf-8?B?NGk4U1U4VGJWR0ZxQk1CY2dnL0U1UU4yMFBzYWRSVXQ2STI3Vm01RFBOVVFu?=
 =?utf-8?B?VTNwa01LU2Z5UEhTZjNYUzBDT2lVdzAweUkwcGpXbmcyQXg2c0dGZDk0N1Rk?=
 =?utf-8?B?T29XVTVDM2NBOUc0dDNxbk9xZUZtK0ZISjJyWmM4Y216akJ0NE15a1RQRXBo?=
 =?utf-8?B?bDNyMVN5MkRxMDhPemN2RTkxaHVNQnZnTjF5OEhVZ0xXSFpZTXJab09aOGli?=
 =?utf-8?B?UnVzd1BEOTR5V3NUUm5ERGNDTXhWM0U2RHBSWnhXUXUvUVBvYjByMHZnaWhz?=
 =?utf-8?B?RVZOR2ZDRFBmSnMwNlN2TEY1U3ZwaDdZY0R3MDZMVklWRWVtUVBsUnhTRktr?=
 =?utf-8?B?T05jUHMraHdicFNqSVFjU1EwQTRlMWMvaElxejYrajhpMy95bmJBRGl5Z0Iv?=
 =?utf-8?B?K0FrTEsxZmZvWUo2N2tMeTc0TVBYZ2dIaHgxc3ltMWU2WWFXcHFZSVVPdHJi?=
 =?utf-8?B?MnJjNEVONjN2VzZDK3FsM2hrTzUzWmQxQS9ldm1PVmYrMG43MUZHWVV5andt?=
 =?utf-8?B?L21KRklBdWRtaE9QOStTZlVJb3ZxbG9iM29TOTB2dStnbzhsTGsvbGs4dmhQ?=
 =?utf-8?B?U3BkWmgxMTBPb0Q0bzBaTzNmWjZ1SzBjaEhzZ0x4MU1DTU9Ybys5ZGJ5bC9Q?=
 =?utf-8?B?d3JtV3lMaE40bmUxMDBHL3NZR0NqQmFITnZEMVBwNkxkY0dqWm5VRzdqZkM3?=
 =?utf-8?B?NnpZRkp4VWVmNTMvYWNLQ3NCUWo3ZG90SkZPMUJOT3ZDaTVtNElOaENDbVRW?=
 =?utf-8?B?L0pmNHVzdHVXdnJHbGVhbXRqVkRUWEVsY1lRZmxKODZSb1didVBHM2tsL0RV?=
 =?utf-8?B?bkdzMTl6U3VrYTd3NVhzQVh6MzRoYkFWT0RXREx0S3hpa2R1UmhaUjFrV1hv?=
 =?utf-8?B?UFBKZ3kwTVZLMi9CbkQ2NHdGenBuSktQYWk0Um52WnlSWlJDVDlESGtuenhH?=
 =?utf-8?B?T0c2OG10bVVXY0NqKzlaUEVKb2ZseW5TUXk1cnNoNXV3OSs2Q3hFNXZOUXNS?=
 =?utf-8?B?SjJyK3RscVZaK1Z3emoxUmxraDF5QXdCT2ZZNk1HUEdDNTNjMVBWZTNmZmk4?=
 =?utf-8?B?eVRmT2c5QU9DSUJOZUdKZUcwcytaM1hvOXV3MFFkQW0xUWhSYmd6NHkxbjBv?=
 =?utf-8?B?TXVWdEFlQVVIclRSZHJ5emFKWForL29DNjlUQnpGekN0d3BRdkl5MUYxcjdx?=
 =?utf-8?B?NGtWNmQ0ck1Hb2tmVUxhUnJtbnVQUW5JTC9XVkJ4d0RUMFJUcTdWdjlPWkR6?=
 =?utf-8?B?Nmd1d1p5WXVKRU0wYWVYM3FDR2ZjOVRiUTVvQ3NNazdhRlRjTWo5eEExaGZH?=
 =?utf-8?B?NEsreUswZklFSGlzenpaVElhNFdQb0xmQXkxOGpHMHRJdWhSc2dxQ2pwSU1Z?=
 =?utf-8?B?UE0ycXFZWHU4dUVrSUVNVTdWV2pjMTVnbzhUT1dKOUp5NEg0OVVseWJFd2gy?=
 =?utf-8?B?bkpyZ0NmZytPa04vMFRUVEhtc2hvME9MYWN0Wit4aW1RZnRacmlWc2FpMlVL?=
 =?utf-8?B?U01hM21VVEcxQjVsQm1XN0thdjg4YisxYzIreDl1NlBjMEI4WGtKdGFzTVlm?=
 =?utf-8?B?cWd5b3JYY2tXNFVXcTFzQXd3T2FlNzEwQ0NWcEJSTmUwZWsxczVBZHc1SEVV?=
 =?utf-8?B?SWdNS3UrQUpBTUZCcW9BbHhzbW4rY2pWM28vTEp3YTkyVEhrZU1wK1pxMTNR?=
 =?utf-8?B?S0w2UU1FQ29Wbk5XSkxlYS9DeVNqbGc3WElJcG1Bb0JlRzJrb1d5QU5FaWVa?=
 =?utf-8?B?Y2ZxZjRCVk4rSFlldGpXZUdNcmpvT295aEdiNi9PWFlQUHoyWE1DZitpVVJE?=
 =?utf-8?B?UTd5U2d5dEpENnRMSEZQQ09waWtGV2Flb2hTVnF6VWVRQU85dVRNQmFiWWRC?=
 =?utf-8?B?V3FtQzN3VHV4d1JyempPcE9QL0pKWTZ5anQrZnZyM0tsbmNKN3hqMWpFNS9N?=
 =?utf-8?B?cVZHN0lIUS84V0NkdmNHMHRmZ0ZSWGVaRklza1JnU1VEZTUvVEFCUUhRdjlX?=
 =?utf-8?B?TU9wbEFtMTFTMldOVEJ6aVFpeGNMRXJySFpFcG9pMTNBb3RFUkdHTXBJN0dw?=
 =?utf-8?B?Zmh4NkZJQUVxeWlQa25LTnZiTlJRYnJSOXRwcVJheWNGV3lPWGk3RFlhVkFk?=
 =?utf-8?Q?fmE8gLWbb7vo+S7JgF/qY8ILBOY/Ae8wD3p/J?=
X-Exchange-RoutingPolicyChecked: Lccol9uBnRNSnQI06UyOi8G51IB+Ndttvze60Kl51wM9txKlphcuxBp/LpjFbw56/t/8uwLqnrUDFCeHABU9L5A3mG1MhykE8aVqe4jiByhCMrrgj4gua8BSNtFA2tVIf9d6HiXft+0r92A3HTV8V5dleHACFrNpSpU6/8f8MXw9nNV8IabHlZYfJaIjCJyWoTq2jKzPH399Hrv5A9qKazoDUxUwuJt7lUh1TY7znnnc2TcLFieGMBYUVXrIdObNgrZwr+wh5fegJpEEYUDRaSy+PqGYBx78nY9UpoUAnv8nGQBfhT+tdDRWe1NUN2iX7lVWaVOdVQZoJ8RozpK51g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 726e3d11-4ed3-4c6f-4276-08deee1848ff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:55:20.5321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ylo6iKVo3Ak3C2rW2CkDAe/lHB5core0m6+WOKDK//prGNSmBiqQXcQISQzWzDRlJeUjSP2Wq0+rcgXCMu1WLK2z/8vA5icy2MYOJtKrhVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2F49754B6
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



On 7/28/2026 8:29 PM, Mitul Golani wrote:
> Split the CMRR M/N register programming into intel_vrr_enable_cmrr()
> and intel_vrr_disable_cmrr(), and drive them from
> intel_vrr_set_fixed_rr_timings() based on crtc_state->vrr.cmrr.enable.
> 

stale commit messageg

> VRR_CTL_CMRR_ENABLE is not set explicitly, writing TRANS_CMRR_N_HI
> arms CMRR in hardware. Drop the now-unused cmrr_enable
> argument to intel_vrr_tg_enable().
> 
> No functional change intended for non-CMRR configurations.
> 
> --v2:
> - Commit message changes.
> - Added Simplified enable/disable sequence. (Chaitanya)
> 
> --v3:
> - Guard CMRR enable condition (Chaitanya)
> - Comment changes updated (Chaitanya)
> - Squash register write commits together and
> avoid double writing issue. (Chaitanya)
> 
> --v4:
> - Guard CMRR enable/disable with platform check
> 
> --v5:
> - Update CMRR in enable/disable path
> 
> --v6:
> - Simplify enable/disable calls (Chaitanya)
> - Make function usable for common cmtg and cpu transcoder
> (Chaitanya)
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 59 ++++++++++++++++--------
>   1 file changed, 40 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 056d513ab637..8d871aa58cab 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -352,6 +352,36 @@ int intel_vrr_fixed_rr_hw_flipline(const struct intel_crtc_state *crtc_state)
>   	return intel_vrr_fixed_rr_hw_vtotal(crtc_state);
>   }
>   
> +static void
> +intel_vrr_set_cmrr_timings(const struct intel_crtc_state *crtc_state,
> +			   enum transcoder transcoder)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	if (!intel_vrr_cmrr_possible(crtc_state))
> +		return;
> +
> +	intel_de_write(display, TRANS_CMRR_M_HI(display, transcoder),
> +		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
> +	intel_de_write(display, TRANS_CMRR_M_LO(display, transcoder),
> +		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
> +	intel_de_write(display, TRANS_CMRR_N_LO(display, transcoder),
> +		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
> +	intel_de_write(display, TRANS_CMRR_N_HI(display, transcoder),
> +		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
> +
> +	/*
> +	 * On always-VRR-TG platforms the fastset path does not rewrite the
> +	 * whole TRANS_VRR_CTL, so RMW only the CMRR enable bit here. On a
> +	 * modeset the authoritative writes (intel_vrr_tg_enable(),
> +	 * intel_cmtg_set_vrr_ctl()) carry the same bit, so this stays
> +	 * consistent.
> +	 */
> +	intel_de_rmw(display, TRANS_VRR_CTL(display, transcoder),
> +		     VRR_CTL_CMRR_ENABLE,
> +		     crtc_state->vrr.cmrr.enable ? VRR_CTL_CMRR_ENABLE : 0);
> +}
> +
>   void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
>   				    enum transcoder transcoder)
>   {
> @@ -360,6 +390,8 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
>   	if (!intel_vrr_possible(crtc_state))
>   		return;
>   
> +	intel_vrr_set_cmrr_timings(crtc_state, transcoder);
> +
>   	intel_de_write(display, TRANS_VRR_VMIN(display, transcoder),
>   		       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
>   	intel_de_write(display, TRANS_VRR_VMAX(display, transcoder),
> @@ -671,17 +703,6 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   		return;
>   	}
>   
> -	if (crtc_state->vrr.cmrr.enable) {
> -		intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
> -			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
> -		intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
> -			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
> -		intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
> -			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
> -		intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
> -			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
> -	}
> -
>   	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
>   	intel_cmtg_set_vrr_timings(crtc_state);
>   
> @@ -947,8 +968,7 @@ intel_vrr_disable_dc_balancing(const struct intel_crtc_state *old_crtc_state)
>   	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
>   }
>   
> -static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
> -				bool cmrr_enable)
> +static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> @@ -960,11 +980,12 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
>   	vrr_ctl = VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
>   
>   	/*
> -	 * FIXME this might be broken as bspec seems to imply that
> -	 * even VRR_CTL_CMRR_ENABLE is armed by TRANS_CMRR_N_HI
> -	 * when enabling CMRR (but not when disabling CMRR?).

Please add the reasoning for removal of this comment in the commit 
message. The comment below is not a direct replacement. I think the 
experiments show that writing VRR_CTL_CMRR_ENABLE after TRANS_CMRR_N_HI 
works so the comment is not valid anymore.

Other than that, LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +	 * This full TRANS_VRR_CTL write is the authoritative one, so it must
> +	 * carry VRR_CTL_CMRR_ENABLE when CMRR is in use. Writing TRANS_CMRR_N_HI
> +	 * arms the bit in hardware, but this later write would otherwise clear
> +	 * it again.
>   	 */
> -	if (cmrr_enable)
> +	if (crtc_state->vrr.cmrr.enable)
>   		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
>   
>   	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
> @@ -1000,7 +1021,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
>   	intel_vrr_enable_dc_balancing(crtc_state);
>   
>   	if (!intel_vrr_always_use_vrr_tg(display))
> -		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
> +		intel_vrr_tg_enable(crtc_state);
>   }
>   
>   void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
> @@ -1027,7 +1048,7 @@ void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state)
>   		return;
>   
>   	if (intel_vrr_always_use_vrr_tg(display))
> -		intel_vrr_tg_enable(crtc_state, false);
> +		intel_vrr_tg_enable(crtc_state);
>   }
>   
>   void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)

