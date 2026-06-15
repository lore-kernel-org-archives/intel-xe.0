Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4532ECD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 06:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0615010E1DB;
	Mon, 15 Jun 2026 06:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhslZ2gO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CF910E1DB
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 06:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781504772; x=1813040772;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=/N599M+ifBQ4Z9bzm3h+JkDSfCPU1M7a1gL2PwNtBWE=;
 b=dhslZ2gOOZzCZZR+EOEN+E43TXpfSMYmz3TuvxWE9MSsgDiaqmssfuLi
 ZDH0sd15h0xgFELAaR/WqTuqhJD+4zVx7+VqOPfSP8GCYkJcBfz+rBaCL
 sJSvXxGdQsXJztmOTJA0R7UYixIF0duJBk2Vc09mco+arvE92x0/G5omx
 e3aXWTHLjt82HcnmAXkXigxzeRUUshp3k1pzWxKwvkRjV/Mz2f1aCC66h
 K8Y+7oweT3C8Lympcw4nn7mWWZVMBmVcuGjKDjIhOVtJK+wak3T2vgEuH
 2+pl6xeGODjwroTp6lWEPZ04+3QdpJi+HBz0Sjibheb85NSRoMgKhvBr/ g==;
X-CSE-ConnectionGUID: ml+5W1DLTl2GEvNPEX0ATA==
X-CSE-MsgGUID: 8WMYP8epSMiVEH72KjVLzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="104907751"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
 d="scan'208,217";a="104907751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 23:26:11 -0700
X-CSE-ConnectionGUID: aBxTYkHnTGKo+a13XhowYg==
X-CSE-MsgGUID: hR1GmdI1RkOfPaURdZVkHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
 d="scan'208,217";a="244984934"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 23:26:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 23:26:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 23:26:10 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 23:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vp+IoXNmR/onhxYyYhg1uMGyynQn+aZHWfGqizx2HD4G1VqATe8E7FqjSUkmA93MU/YBrCb6a62cOUBEuro7xMt8F9q52all8f4+IS81oqIcsGUekyhS17M9/4wcjpu1Tg7JIUJT3cA3+TPrJ8z8pSp29UG0O2t01EIqXGXQhx0GcdlLyvsxOkg5/erB0tlYLQIhnZy8ZZOzy9WF5ybgPMZJT6yflYtDC+c2ryo7Lce/miBLeiq5MFPcSoCjKH8B2IsQNsRQcnXOLEVw0+FWsimzdZtAnc55bUG6ztX0sUDKAp0jdAUXvX5RR2VvHLL5ZwGInEu9XAqOJsFy1KHOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsVxIsz/bWBVyNMKnbkU+gBFM822lZpeew8xSAsGKqs=;
 b=yF+E77IXJuKhNRtXP2PMSmLccqc4AghdOBQq6hnBSIXJOmuf1oqtlUW13y8Gjgxdxn/2PAxVAlIyHLertKNesS/fn9/r4uVgHsjkoVXddFNbv3PsLUTA2YkAZnDn3eva8XOWkjn63e/qbaARrJT4AVt+5SY1Vo+yMJTjZ9UxHZ2ClW4CviiPoLW1vDH6rsKg088TtfB5uyypU4jfDHNqqYOx2ULb02jSfABlBRCOxu3zw6ntZ4IuHg2tQiGM/aaRIFG8TwwuAOvZfozCL9BtEwT3znwrMjtjubhQo0RekLAPOtXes6QmeAFTWi4t/tc0KhQ85s6xhYP1wTlmm1l3Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 06:26:07 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:26:07 +0000
Content-Type: multipart/alternative;
 boundary="------------0O9BnMMRZJXnR637TpfNB3z0"
Message-ID: <9b64410c-3cbb-4f68-83f7-cb8e80c18a07@intel.com>
Date: Mon, 15 Jun 2026 11:55:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: handle CRI+ power interval encoding
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20260605093527.2257977-1-karthik.poosa@intel.com>
 <b6e5dd3b-8890-4bc0-bf38-b399e5cff586@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <b6e5dd3b-8890-4bc0-bf38-b399e5cff586@intel.com>
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 330ca2e4-2a6b-4944-4c1c-08decaa6fbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|8096899003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DC83UZsIMCNva589C+SsIKc7akT5PLLI1m6dzefpR0CIOv1Z2CO5kTQ1clTta4b00aIXw9lWmHTjqEo8wUgVRln9qZ9cXPsx/t1ev1qwsE2gWZq5GZvpGp5+Hs0qxFEi9tWp3KarnDo6pi2g41r7mZQj+oUjQSkZPciH0FKU3k/qCZNf6eQILoHr+lPbfEZKmcspAKXqDXkW99AMqsK03X3Ig1GTwh28+hlfF84FaYRvbnNLqTlC5RpDoLE98gv9GWVM5sXKLRqnyW2pJWurSjchU93gl5RJEyZrWZ+35f/JX3ngV1StfdNEOm1WOymwqeLgOQYQpngy2Osqeo4IK0aGPbSTl4qiwcerDeRcoD8H39noXuUC7BcePvtFSwby/5VZaABfzeOu7zbRXf6n5ohIz91qvM0BxPWqMLJ7k14l11uRtt+Th62+iqoKoWbPpf3nSSOrrP26YFOhipcA0eY3sT58POPUTTNnQPER/HJlReLGJ7i3F31ZZ0AB0RYNMcM130il2QKjKOKqPLESv4j+vyvj7hJ0nTVWMFy+p2D3tDCAPmx0F6cnpwnXwc+vLfHdRojwr/kEQkpfCtUH5hCSgryPML96m7jQVcfzcSETWfpmpx3XE2VWfQslPm1qD+1878vju575wqbvTc89SNQplQAr4kiDX/XWbMLBtNh6HQcQ03QY6Ba6BNRZTmt1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(8096899003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anFMcFVla3J0WXRFbzFtekRUdm5vSHRnekMrYVVZMGJHNW44bFp6UGZ1RFdj?=
 =?utf-8?B?OUEwbmFyaTRRT1R5NDkvbVplOTlpRlpnNzlGd0tWWk5QNk0wUDRWTUZZckk1?=
 =?utf-8?B?RWRJb0NJRHhhbDJlMXhEa1VKRHVycnlNcnZkcStFZjV0UUNJZkhQSmN0UnJl?=
 =?utf-8?B?ZXRSWE14dUU0N0I5QzdpMml1MHpZQ0QzTUtJRDdlL0hFTWs1MDFyZ285STNK?=
 =?utf-8?B?dHRRRmVpSC80Z3hJcmM0STcrZUdpeGpiNFFtM0V4c2xYWmpjV2dKaDh0dGtX?=
 =?utf-8?B?RkFsVWd6bDFrcHVNN0ZSOTcxV3RYTlNrdkZONjdDT0xIems0aHJrSlFnTXB4?=
 =?utf-8?B?Y1JuUk45SmlNNXFrQ0FYSFBTRXhCckxEaHZTOTUzYUxGL2dOZlo5SnJwOHhm?=
 =?utf-8?B?N1liRFRaTHRIRkh2dG5vL3NUUlVhbDU2LzBJbkNGSXk1MjlwaFdSc1ZKVmpn?=
 =?utf-8?B?MTdCcllwNWNMOVNLMVpIY011V1hra3d6WTJhSWJ1bWhYVkhTSWNhd2tjUUpD?=
 =?utf-8?B?YUpveXV3alI4M2tONzZ1NUQrN3dUZDErWVlBOFcxMzVFLzRKWFJMbG55Qytv?=
 =?utf-8?B?WVBZNHJxUzlsMW96eEVUaUg0L3BJYVpWejZMeGk0SWI5VHNaVFNIdUJLaFZX?=
 =?utf-8?B?Qm9FSTZoRUdqYzU0UEc3RDhBL2tXSFYzLzRMNm5EZmU3RnkrZTBtY2s0VU1y?=
 =?utf-8?B?Ry9RbkRZMWdWa3o3dVhENktaMEI2dHpld2lYMDZXbi9oSzY5bmk4WkZlejZG?=
 =?utf-8?B?a2xRUTNpRjN3MmlqOFVNMUN3WEQ0TWQ0YllYSXQ0UTBTcCtnVVFRaHY3Z2xW?=
 =?utf-8?B?M1dlOStlMkMrQzZ1YkF5azZEd2MxaGxOQk5wcVZMSWlEaTV3UFlVV25OeFhy?=
 =?utf-8?B?N0NGRHROU2dTNVg0Zy9mT2phYUpVMXdiQjJpUytmbmcrdlZtdzJkZ21iWjZN?=
 =?utf-8?B?Nit1amI0Qmg3YmgxWkpVU1doTXhxUTJkeko5Q1JtN09OZ3BhT3ZGQVczcTdn?=
 =?utf-8?B?NS9Wbk1heVc1Um9sK0krWGYxaEVaREY5SityWGd0aVBVbmp1dmZlM1J1Wk9L?=
 =?utf-8?B?QnR3SWNFNzNTa1RYRjloN3hOTm14M2xSbmY2a2lsVXBpQXRJZHUrZUJxT2U4?=
 =?utf-8?B?WVhHS2V5VmhYVXJXeTBpMVdVN2lWRDZ3SkV4QUpxT2dCcnBrL09HWmdpWDZH?=
 =?utf-8?B?MDBwY2xrMWl1dG8wL0V0TDh3TGNkRUNoNUt5U1o0VVZ0RFNBQ3crZDYzbzVo?=
 =?utf-8?B?c0ZacS8xNTAwbWlnenpiR01taGtCUFgwMFJqVlhsTzFzVnZLUUY5cXpWTTcr?=
 =?utf-8?B?azdEbldYYWxYdTMvR0Z1L0Q5TkpYMWR5K0JPSzJCa0kzVWJQQ2tuRThqVXNO?=
 =?utf-8?B?SDRFVVdNcW9oQXB2RUE1dTZBZE11SnI3VWlrN0hncUlKTFhxVlVXK3JTbWVS?=
 =?utf-8?B?Z1dweUh4ellqR2N2SDZ1eWl6NUM3M0ZaSTZmdjNGU1JPNFVnSWJqWldDRUxJ?=
 =?utf-8?B?WG1rdDl6Nzg2Z1h6SHFMbTUzdG5tODg1TzJvcU9BdjZkZXJWQStjQ0kwU1ZN?=
 =?utf-8?B?amcxQkRTa2FQampERm02cWFobXZFSFRkK04reC9UbUtUQkJUV244eDZLVmky?=
 =?utf-8?B?NThrS1M1WWZ0M1FJMm5FRzJlQXBmbDFlZUNQMTdMcEF5eGVqVXliMUNwVmpX?=
 =?utf-8?B?d0ovSUd4T0pES2JLSVhlRlgrWVBvZjZ6Q3dTaWFYYW14TWlrWnpSSFdOUU1J?=
 =?utf-8?B?SEh5WUhEUmZqSG43L0pvUHYrMEVhS0Z0MTl6M0lKcmRZTm1TNDVkblc0SDEz?=
 =?utf-8?B?c0JRNEZETHlkQzVncEtHYjhoelJleUFnYU9jalRkdURRQW1JeWlrVVY0RzV2?=
 =?utf-8?B?eU5JeXNySWF6aEZhakN1VjJLdm9McTJLdXBUWHJDTE9xZ2ZYYVRTOVAyN1hO?=
 =?utf-8?B?Tm9qSHliYkZlMGZ4dm52RHZ2SzBrZ1lGSGt3Z0VRU2c0VndMU3YrcWYzQ0s4?=
 =?utf-8?B?SzVsbUQvenFLaC9DWUhFVmlsMWVrV2pZOUhaTTlBOW50NCtMT3ZYYTJtSHNj?=
 =?utf-8?B?U2p2VlVjL05ld0d6alFuaDhqb3AySnBkTDBuOWdQRTAwWW5ObGtnT2R4TG9P?=
 =?utf-8?B?b2JmSkJoQXJMVTNUd3kwdFRKV1QwYUIycnY5c1c3VUdNKzJMOTY4TXpST0hQ?=
 =?utf-8?B?aTBzN2JFYlRBeFpYcGUwcnY3azM5WWZvRUFTdFdBc0pVcngrMEJhZHBVR3l3?=
 =?utf-8?B?VWV5ZWt3MTRpQ2lOdXNVWHVVRktTT0N1M0NPdDlSRjJCVHB2Mk1FWWNHQzRh?=
 =?utf-8?B?MlN1bnJ3dDFWVjJMMThHTVBJVVpUWk1jc0ZnMnhQb0pUaDdhcS9pdz09?=
X-Exchange-RoutingPolicyChecked: Ae5Jx1BhEUAc7/F+E0ao9Xn8+fnEzVImQKaHR/QFubQ1FGcRue2iMo1WnIkRMPpjezHYgYDI36+QAzIPI1r1gArzHR9uT6Msv5fwhZOlv5MTf8eYR/pW6URQgplzWOBMI89q/AMI9Vvu3T5JHbideft839AmIGFOtHZagQ/YDaAHt5tAHx845ZmEI+8lQ8t2TcurQ3uFgam3t3nc/RbCoAn6wkWNNKSwqCG2rrmfqpTJl3G3vZoJ4KW6Lkg2DG5srmCCZd2JiqqQjGswb3qS9TuXbe1OUlBa33BA5Tsdm6O+6AqJRlRyRVNpNxaPVEsz0qbqqsAQU7Lp0ucjk3uSzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 330ca2e4-2a6b-4944-4c1c-08decaa6fbc9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:26:07.4202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAZCn6tV8Hvh2Z8qut96PKr2dWEnxWNKKZLKxVB2pdt2x/Q6yrXPw5R+rubvGtk5Ra6ZUeK3I1j49e/UItJicg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
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

--------------0O9BnMMRZJXnR637TpfNB3z0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 15-06-2026 11:49, Nilawar, Badal wrote:
>
>
> On 05-06-2026 15:05, Karthik Poosa wrote:
>> On CRI and newer platforms, the power-limit interval encoding is changed
>> from the legacy 1.x * 2^y format to a U5.2 value in milliseconds.
>> Update the interval calculation accordingly for CRI and future platforms.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 84 ++++++++++++++++++++++-------------
>>   1 file changed, 53 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index de3f2aeffc3f..4038e1da2e71 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -575,23 +575,34 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>>   
>>   	mutex_unlock(&hwmon->hwmon_lock);
>>   
>> -	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
>> -	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
>> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
>> +		/**
>> +		 * On CRI and newer platforms, the interval encoding changed.
>> +		 * The value is now stored directly in milliseconds as U5.2,
>> +		 * replacing the older 1.x * 2^y representation.
>> +		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,
>> +		 * so convert to milliseconds by shifting the field right by 2.
>> +		 */
>> +		out = (u64)(REG_FIELD_GET(PWR_LIM_TIME, reg_val) >> 2);
> This truncates the fractional part (u5.2). Is that intentional?
This was unintentional—I’ll update the patch to account for 
sub-millisecond values as well.
>
> Thanks,
> Badal
>> +	} else {
>> +		x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
>> +		y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
>>   
>> -	/*
>> -	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
>> -	 *     = (4 | x) << (y - 2)
>> -	 *
>> -	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
>> -	 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
>> -	 *
>> -	 * As y can be < 2, we compute tau4 = (4 | x) << y
>> -	 * and then add 2 when doing the final right shift to account for units
>> -	 */
>> -	tau4 = (u64)((1 << x_w) | x) << y;
>> +		/*
>> +		 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
>> +		 *     = (4 | x) << (y - 2)
>> +		 *
>> +		 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
>> +		 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
>> +		 *
>> +		 * As y can be < 2, we compute tau4 = (4 | x) << y
>> +		 * and then add 2 when doing the final right shift to account for units
>> +		 */
>> +		tau4 = (u64)((1 << x_w) | x) << y;
>>   
>> -	/* val in hwmon interface units (millisec) */
>> -	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>> +		/* val in hwmon interface units (millisec) */
>> +		out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>> +	}
>>   
>>   	return sysfs_emit(buf, "%llu\n", out);
>>   }
>> @@ -637,24 +648,35 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   	if (val > max_win)
>>   		return -EINVAL;
>>   
>> -	/* val in hw units */
>> -	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
>> -
>> -	/*
>> -	 * Convert val to 1.x * power(2,y)
>> -	 * y = ilog2(val)
>> -	 * x = (val - (1 << y)) >> (y - 2)
>> -	 */
>> -	if (!val) {
>> -		y = 0;
>> -		x = 0;
>> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
>> +		/**
>> +		 * On CRI and newer platforms, the interval encoding changed.
>> +		 * The value is now stored directly in milliseconds as U5.2,
>> +		 * replacing the older 1.x * 2^y representation.
>> +		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,so
>> +		 * convert from milliseconds by shifting the value left by 2 to fit into the field.
>> +		 */
>> +		rxy = REG_FIELD_PREP(PWR_LIM_TIME, (val << 2));
>>   	} else {
>> -		y = ilog2(val);
>> -		x = (val - (1ul << y)) << x_w >> y;
>> -	}
>> +		/* val in hw units */
>> +		val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
>> +
>> +		/*
>> +		 * Convert val to 1.x * power(2,y)
>> +		 * y = ilog2(val)
>> +		 * x = (val - (1 << y)) >> (y - 2)
>> +		 */
>> +		if (!val) {
>> +			y = 0;
>> +			x = 0;
>> +		} else {
>> +			y = ilog2(val);
>> +			x = (val - (1ul << y)) << x_w >> y;
>> +		}
>>   
>> -	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
>> -			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
>> +		rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
>> +				       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
>> +	}
>>   
>>   	guard(xe_pm_runtime)(hwmon->xe);
>>   
--------------0O9BnMMRZJXnR637TpfNB3z0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-06-2026 11:49, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b6e5dd3b-8890-4bc0-bf38-b399e5cff586@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 05-06-2026 15:05, Karthik Poosa
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260605093527.2257977-1-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">On CRI and newer platforms, the power-limit interval encoding is changed
from the legacy 1.x * 2^y format to a U5.2 value in milliseconds.
Update the interval calculation accordingly for CRI and future platforms.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com" moz-do-not-send="true">&lt;karthik.poosa@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 84 ++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..4038e1da2e71 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -575,23 +575,34 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
 
-	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
-	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
+	if (hwmon-&gt;xe-&gt;info.platform &gt;= XE_CRESCENTISLAND) {
+		/**
+		 * On CRI and newer platforms, the interval encoding changed.
+		 * The value is now stored directly in milliseconds as U5.2,
+		 * replacing the older 1.x * 2^y representation.
+		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,
+		 * so convert to milliseconds by shifting the field right by 2.
+		 */
+		out = (u64)(REG_FIELD_GET(PWR_LIM_TIME, reg_val) &gt;&gt; 2);</pre>
      </blockquote>
      <style>@scope { a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} }</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">This
        truncates the fractional part (u5.2). Is that intentional?<br>
      </div>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">This
      was unintentional—I’ll update the patch to account for
      sub-millisecond values as well.</div>
    <blockquote type="cite" cite="mid:b6e5dd3b-8890-4bc0-bf38-b399e5cff586@intel.com">
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
      </div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Thanks,<br>
        Badal</div>
      <blockquote type="cite" cite="mid:20260605093527.2257977-1-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+	} else {
+		x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
+		y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
 
-	/*
-	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
-	 *     = (4 | x) &lt;&lt; (y - 2)
-	 *
-	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
-	 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
-	 *
-	 * As y can be &lt; 2, we compute tau4 = (4 | x) &lt;&lt; y
-	 * and then add 2 when doing the final right shift to account for units
-	 */
-	tau4 = (u64)((1 &lt;&lt; x_w) | x) &lt;&lt; y;
+		/*
+		 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
+		 *     = (4 | x) &lt;&lt; (y - 2)
+		 *
+		 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
+		 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
+		 *
+		 * As y can be &lt; 2, we compute tau4 = (4 | x) &lt;&lt; y
+		 * and then add 2 when doing the final right shift to account for units
+		 */
+		tau4 = (u64)((1 &lt;&lt; x_w) | x) &lt;&lt; y;
 
-	/* val in hwmon interface units (millisec) */
-	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon-&gt;scl_shift_time + x_w);
+		/* val in hwmon interface units (millisec) */
+		out = mul_u64_u32_shr(tau4, SF_TIME, hwmon-&gt;scl_shift_time + x_w);
+	}
 
 	return sysfs_emit(buf, &quot;%llu\n&quot;, out);
 }
@@ -637,24 +648,35 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	if (val &gt; max_win)
 		return -EINVAL;
 
-	/* val in hw units */
-	val = DIV_ROUND_CLOSEST_ULL((u64)val &lt;&lt; hwmon-&gt;scl_shift_time, SF_TIME) + 1;
-
-	/*
-	 * Convert val to 1.x * power(2,y)
-	 * y = ilog2(val)
-	 * x = (val - (1 &lt;&lt; y)) &gt;&gt; (y - 2)
-	 */
-	if (!val) {
-		y = 0;
-		x = 0;
+	if (hwmon-&gt;xe-&gt;info.platform &gt;= XE_CRESCENTISLAND) {
+		/**
+		 * On CRI and newer platforms, the interval encoding changed.
+		 * The value is now stored directly in milliseconds as U5.2,
+		 * replacing the older 1.x * 2^y representation.
+		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,so
+		 * convert from milliseconds by shifting the value left by 2 to fit into the field.
+		 */
+		rxy = REG_FIELD_PREP(PWR_LIM_TIME, (val &lt;&lt; 2));
 	} else {
-		y = ilog2(val);
-		x = (val - (1ul &lt;&lt; y)) &lt;&lt; x_w &gt;&gt; y;
-	}
+		/* val in hw units */
+		val = DIV_ROUND_CLOSEST_ULL((u64)val &lt;&lt; hwmon-&gt;scl_shift_time, SF_TIME) + 1;
+
+		/*
+		 * Convert val to 1.x * power(2,y)
+		 * y = ilog2(val)
+		 * x = (val - (1 &lt;&lt; y)) &gt;&gt; (y - 2)
+		 */
+		if (!val) {
+			y = 0;
+			x = 0;
+		} else {
+			y = ilog2(val);
+			x = (val - (1ul &lt;&lt; y)) &lt;&lt; x_w &gt;&gt; y;
+		}
 
-	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
-			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
+		rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
+				       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
+	}
 
 	guard(xe_pm_runtime)(hwmon-&gt;xe);
 
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0O9BnMMRZJXnR637TpfNB3z0--
