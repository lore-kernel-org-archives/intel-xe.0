Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1902606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H1x5OcOR;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Jems7Cnp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943E81123DE;
	Thu, 26 Nov 2026 13:23:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618B01123F0;
 Thu, 26 Nov 2026 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795699398; x=1827235398;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6ZJOie/zQZt7GeCRU67cN4AVjUnUDIT3h5dxg+bDBQI=;
 b=H1x5OcOR4FbBAOhVbRelPjxTeQzRxZMmeskC+3kWYtWSLGOdwmM3O/q9
 U+BcQqp6lKriNnQRCpGxs6kTw6wkGBcl74lcPRqXsXYFbOCYOTAPUWP1d
 9AK+Q9dwy9I78x6SmlR3WMP0ow4MwIfJbqD2rav/hS4NHO2Q13wCKr/ZJ
 5UHdyEmzk1JytpmKdlLTYJXQNjgnFB9C9cz/1XVfrG6QeUCizWCGlHz3m
 QYkcy3q3a6gIB/xdFdonsfY3mSMc98zaRj3jC0LEEMGu7tdXKmfH1zFTV
 wH4a1gMRbX/LuSyLvxJ+sSmQFs2lspYLQ5va4i54AN/b3QQmyQDWYRQZE g==;
X-CSE-ConnectionGUID: U/55QaEFQWiL3UMnPuQtEg==
X-CSE-MsgGUID: z1UVvcrXRn6ynh88pQ/OoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4499261"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4499261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:23:18 -0800
X-CSE-ConnectionGUID: /vDceSFlSB6EjqnHutEkSA==
X-CSE-MsgGUID: w4rlo1YyRhCRlk1jyAv8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12327091"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:23:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:23:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:23:16 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:23:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWhZM0VrzjpDI9C+tmaI5BWHT+13BRDgzSg22Zsm/xag/C5z4bU4DiTIM1K6tgIKvxbByU+yG6cr2Ykgy5rNkACajep3mnbinIcCmUl7fJ4sqYMmxbLRkZXeu+ZKLvvtiMNio0mIHFBiFp286i8iY2LWJGTx1LFvZ9TOj3jr3Mmn4HVL4hPV1Qn+k2R45MVuDL3SCbDV4m3eTqQbtBlPEdmdrvdYwp8JSzNdeuSwyW4jSePJprkGy5YB+t42R3cAPTcs285d2Q549MHZtpsIlBGtwM0Df/BEO95gGUlhwGSLmgs5+MaZwC9nJlw+ZMaBxxE/wuj5dnMuOrHyN45rDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0nFWbj2rK0Bkdon6XPUr4bqjR/dDn+qIK8D5Erv9D8=;
 b=jZZQqrSl/NBxbZ7JQEgsSndyT1RlHBVB//ZqOvFauSANxTdGFyY8Oqv+05IDSxDdcH3923IcVMKltwbi0mUr4yjsahVVMkyIX2rHKyA5o+YjUMHfOLbml3XT2FARFf3Od0PwxboBOYkul/NY+e/7GzWq7MNgoFvFLa+GAXicFPm4YBAHAr3LOYxQCesmlhoCOokeT7NlPBxLSNJOcoKU2LDmP6v32z+P2t7jH6Va1bMWdGu1wwkNK+KwNtRhLaXQFsrXx6BrfLqbggniWKrb3icvsl7KwNvlGBt0EO3+Mwd9CE9FtEbyZvebRxM0e3yJEsuymvIVbyRmF9tuuEnt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0nFWbj2rK0Bkdon6XPUr4bqjR/dDn+qIK8D5Erv9D8=;
 b=Jems7CnpnHhjagiylOubZsq41FbfK4vVuO5kyqhE/2BeLBH/YIE42X/HbuCuLkuiUHv9cH5iAA2/IISB3Jvaa0tBmNFAkzP9oE+0a3i2b6IgNGO2kKIpUtfV3tAEKNQvxT0ecRF8XNl1mCvfDDd6VUCqIdbMbcrvxf7WHXK/BTs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA4PR11MB830535.namprd11.prod.outlook.com
 (2603:10b6:207:13f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:23:08 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:23:08 +0000
Message-ID: <246d5f55-5f03-4e44-8b0e-ada5acae3428@intel.com>
Date: Thu, 26 Nov 2026 18:53:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/i915/display: don't be cute about printing
 enabling/disabling
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
References: <cover.1795607055.git.jani.nikula@intel.com>
 <b2083460376976a93772d0c06a933c27d910d157.1795607055.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <b2083460376976a93772d0c06a933c27d910d157.1795607055.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA4PR11MB830535:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c6a1a8-71b1-4c23-02c9-08df4bc0694e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|261009223027099003|22082099003|18002099003|10067099003|11063799006|56012099006|261102123227099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: aWaEZBdcL71M2x/17G3CJXyaO1tKZ7EU7BqJ3KTA8gJ2Vq3UC4OrIleSc07FAoCCTFNsBH2tc0vk8NHqAqwRq0PZ/mNXaaUHiyCik+8QFcEHDDiaaCydMKZmBb2UlJKYEF6mqLL4bPurjBVdbCbBB1FgkJnNAMnI5XNXlGeS4MEqblwFjhD+l8Ql2s0LLbKmWO2cmWnCGCrrdaFpXDipFNSuBppJpz5VcaLrbBw70nk1aYFbuExAeietAy5R2egc1yDSnTh1t1bmMuSEg6Um10ZOSysitWJMOuXPmbnoGcd2+2/XhEI26v+vBhnK2HNsqCcmhTfqwErm4giwVd9Uy1SKy2HjmYKlmtIoWPTwK27B+6OUeYcKYrsIT3AWzIBLmC36+IuGP3piJzkG9fCBa5ZC4qoOCxtuoO1KsRl6uy9dG8mKS7Z/KalIz2bTqtbIpxXYZdwyI0c1pqkV4oZAU3HelwJWUX/3M9U59G/mjaDrcRVdIo+sowI5D01rTg/k63yMf/Qg5x6XyohWqDTiCe7AfeUCPQeIg76wY2LpkGTDL4OLV/cQhjj6t4mAgf1LrIOPwck2BPWZbyUWL+5vEMmJMD9isEpk14Kv6cvI13mx7aJ9yB/CdAqG42Uh9uPksBJsX1zQFgZsMdCj0e7/lp3ZpxQwPf7ElGD6HCIqMEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3FNRDA3Z3Z6MkdzRGFzbHpyNS9LOHdhMVZUeE1tczkwLzd2S3d1UGtzWnE0?=
 =?utf-8?B?cnd2SnU5Y2M5Qkl3VlFPdjJMMFQrVkN4WjMvRWpsNzJCU2pOMzM1VHQvK0d2?=
 =?utf-8?B?OTk1dDJZSDhNTVhWeWZSNU1nZC84YUZaTURhek1Tb01JQndJY1E4SGhSU2Yz?=
 =?utf-8?B?SmtVVTdleTRSQlhHOU4yeENmUVRJd2VWWTZNVFVYc1lKU2RsUzRxQ0pHc1VK?=
 =?utf-8?B?VGdKbk1XTGFCaTB5dC9yanNmRkJMQWhraDRPN3BUb1NKWE1FTkxROUs0YWtL?=
 =?utf-8?B?OGVORTgyc21EWncvMHFScWNwT21VQkdtMjV0VzgrVGJCODZQT2c2dm12bGZk?=
 =?utf-8?B?NHRNWGVVRUxNc1BSOTRYVXluMVRza2tycHFwQVVjcE9Zb1dDOVorQXV1Si9Q?=
 =?utf-8?B?ZHFmNjBBUnFpZklBbyszai9BZDR2WjJIR2V2R3VuM0w4dExRdmNLNTl5MEkr?=
 =?utf-8?B?RlUrVDY2NmF2YUlzUlh6TnlLdVZiVjJZUnowaVd3WERCRWNwcWQvU2oxYU9O?=
 =?utf-8?B?VEJBazFIOUlDcFRlemRyZ042WUw2WC8yZ0FaNlRoYytjQW4vclY3czQrMlI5?=
 =?utf-8?B?bzdlOEpCY0QzQWdUNWhnWjJDcmRBTGVaNUxVaGVhcUZzaHo4cm55ZWduVEFU?=
 =?utf-8?B?Rmk4UjYrZHZuYXdlS1ZOMWcvZnQ2WFBCWmw4NktZMmtSNk92em5lMjIrSTNt?=
 =?utf-8?B?Wk5ubUZ4MysxdGNxeE80OFpiNVNuV05WUVNrVG9RTktXNkNEbkdjZXdYTDFN?=
 =?utf-8?B?OU1IVzNPWm5qVGlEN3psOFp5d01hVzJ3VHNTUHJTZ1RVaGpWQWpGbDdyTDRO?=
 =?utf-8?B?VUpudGRScHlIREVPOW1pVFVSeW5IMXFNZlZJMkRqSGsyZ0Y3bmcvRXQ2NmRp?=
 =?utf-8?B?cmI4bXhHdkljUWpLcjNmRmVRSG9WYXhuOGVLKzFNQ3d2L1JBMm1qOVQzY3NX?=
 =?utf-8?B?VHd4Z2E1MWpWYjByTFNXMGFLMk52c1V5YWY1dlFlM1V1NWQrek5tOVJSbE5y?=
 =?utf-8?B?RTZaTjZNNWhFWVBic3N6L3ZSYzNMcjVaWjZPd3RmeUdBaW01Q09zK3Bpenp5?=
 =?utf-8?B?TUxRbDh3eVo1VmlIa2x1RVM1SjMvWC9PRHQ3WXphUkdQNTNLS3g3Q1RteXVD?=
 =?utf-8?B?bVJDNCtHaTAvSUV4dm1QUkFybGJWVGJoN0J0bHhHWTRKVEtsL2dWLy9vcWRs?=
 =?utf-8?B?VGFIMjVEc2p5TXhPdVd0ejg2bkJIMnY3SVc4ekJFanpYVnI2c1F2RUpqTGVo?=
 =?utf-8?B?YlRTM1hvVXd3YVJ0VG10eEozS1JJdUhSR3RiR1Uxd1d4S1UyZkNzUy8rREM5?=
 =?utf-8?B?S09CZzFnSEwzbGx4SDdoamoyN0Z3SFMrR2ptZ0hyTFd1clhMYnJ5ZUxna1c0?=
 =?utf-8?B?SDh2cjg0MCt5d0w3QkJGZDdRb2NNaVpQNVlOblZPZHJVQ0hqeGJYR04raVVn?=
 =?utf-8?B?dWlLa0h2QjhWcjYrUFNaZTFzMWY1N0JTaFZkdGlaZVdUSVVPMFJnNGF1UDdN?=
 =?utf-8?B?UUwrdVlYcnNqYlhhRHNMY0FTdThHMmNldWVhQUhWSkJpL0FUTU5OLzhKR0x5?=
 =?utf-8?B?UUN2WlNKMDhMT3JWbkRXZUFuR0VkdW1hNjIwM3F1SkVWZWg2bEIrc0pDaWlK?=
 =?utf-8?B?Z0dIdWlwU3pJN0wyczRJZkdNTDZJNnVSWU53OWxGM2lJdGd4VTlNWXUzTXZG?=
 =?utf-8?B?aE1JQm4yTXNjWkUxZnhnakFlSHh0T0hVOStQdmVGbkZDa2xLdlNMUlM4d1V1?=
 =?utf-8?B?VW9tRWRQZTJYSU4wd2NObHRpdmtRYVdCSUMvRVlKUExGVVBhaXU1N2Vhbm9w?=
 =?utf-8?B?VkhpY3hWWUtTTDJDSUxtZVluVGVqNkZqckUyY1krejhaY25HOFhRd0lQTWxU?=
 =?utf-8?B?Y2FreTREVS9hakZLNE5LamtlR1NjQVNPRzZzaTV1ZC9XYTE4VTJJby9sa2tG?=
 =?utf-8?B?ZzRsanY3Vm5EaFl4L3NJd1hHVnFxblltS1FaK1pyYnJhY3pEWS93VEFxR0JO?=
 =?utf-8?B?RnJ0cDNGWm9NK3FacGNSdFRrTnhxYjNtWGhxejhHekoyM2RVZ2JzVGVXY2d0?=
 =?utf-8?B?R3haRzdNWlh3UlVRcGQ2SWM1WGZVeElBcGZ3cDlKWHBRZkt3YWE1MjV2dlZT?=
 =?utf-8?B?WHV6cDJwa1pFR1JiejlSZmdKNTBTTE8zT29valNrY21hUEtwbnpWSjRKbFdz?=
 =?utf-8?B?dU5WeE03OEpYV2QxdUFLT3NXRy9wWVlSVXNwd1J3b3cvblVvd1RPai9QS2pk?=
 =?utf-8?B?RXBTMGl1RHQ3aHkyd0FCQVpxYURSdzc5SlVpRk0wUWJLMDV6eWtJeGlqaGZV?=
 =?utf-8?B?S0hXWEw5QWZjdWJtQ0JFTmxxa2FJQ3VsalFaTkR4N1ZKbVJlcTAyOVlxckNE?=
 =?utf-8?Q?L0iWSWonUXc9v11E=3D?=
X-Exchange-RoutingPolicyChecked: dHQNRqQARpv1LQMCGgn6BPmO+JWQHbtCwzgoasX/IIMVCIYCLBAgTEckl5y7W3KjtPgQL6AefQ3HYRej3ylQfglbubzZ5zepDUKlfXLNqwtkyhZUI1rCwJc/mTJ7T4MzmJ4FxeUtM+QiCB/r0pd1feOnkJmpyB8qeSgTMZMmSkugVcxGj00l08JKl/IZSoEqF0q7MdTg992IEpse8P9/whZiv0dMLn0sLupTA+AMrR5aFy18j3Yu+sHdAL6E4ODky/rbpjNUsboFGvidOvthxoL8pw1Y1h83mxBlj9iH1cTyBIMbygJuPmNMzgosUhZyJ0XfyAjQ53xl4Yndp4vbUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c6a1a8-71b1-4c23-02c9-08df4bc0694e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:23:08.5200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/nb+GD4QAkO9fxGFRTq1ADDJIAQj/IC9sG8+kG1X3S25kWFVPi7lv2/rE+hUiIXJBAej4BMnJCbVaUjsEUErBhReWURG48kxfP7QJpBFag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB830535
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/25/2026 5:16 PM, Jani Nikula wrote:
> Convert "%sabling", enable ? "en" : "dis" patterns to use
> str_enable_disable(). The imperative is just fine here.
>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_fdi.c     | 3 +--
>   drivers/gpu/drm/i915/display/intel_gmbus.c   | 5 ++---
>   drivers/gpu/drm/i915/display/intel_hotplug.c | 4 ++--
>   3 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
> index c170d3104e4c..8f83762c1031 100644
> --- a/drivers/gpu/drm/i915/display/intel_fdi.c
> +++ b/drivers/gpu/drm/i915/display/intel_fdi.c
> @@ -404,8 +404,7 @@ static void cpt_set_fdi_bc_bifurcation(struct intel_display *display, bool enabl
>   	if (enable)
>   		temp |= FDI_BC_BIFURCATION_SELECT;
>   
> -	drm_dbg_kms(display->drm, "%sabling fdi C rx\n",
> -		    enable ? "en" : "dis");
> +	drm_dbg_kms(display->drm, "%s FDI C RX\n", str_enable_disable(enable));
>   	intel_de_write(display, SOUTH_CHICKEN1, temp);
>   	intel_de_posting_read(display, SOUTH_CHICKEN1);
>   }
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 0c3037ef0dcb..990e5cd14863 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -1023,9 +1023,8 @@ static void intel_gmbus_force_bit_unlocked(struct i2c_adapter *adapter, bool for
>   	lockdep_assert_held(&display->gmbus.mutex);
>   
>   	bus->force_bit += force_bit ? 1 : -1;
> -	drm_dbg_kms(display->drm,
> -		    "%sabling bit-banging on %s. force bit now %d\n",
> -		    force_bit ? "en" : "dis", adapter->name,
> +	drm_dbg_kms(display->drm, "%s bit-banging on %s. force bit now %d\n",
> +		    str_enable_disable(force_bit), adapter->name,
>   		    bus->force_bit);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
> index d095eb13dc06..09f34c9a8643 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> @@ -1309,8 +1309,8 @@ static ssize_t i915_hpd_short_storm_ctl_write(struct file *file,
>   	else if (kstrtobool(tmp, &new_state) != 0)
>   		return -EINVAL;
>   
> -	drm_dbg_kms(display->drm, "%sabling HPD short storm detection\n",
> -		    new_state ? "En" : "Dis");
> +	drm_dbg_kms(display->drm, "%s HPD short storm detection\n",
> +		    str_enable_disable(new_state));
>   
>   	spin_lock_irq(&display->irq.lock);
>   	hotplug->hpd_short_storm_enabled = new_state;
