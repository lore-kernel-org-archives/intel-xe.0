Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFB0CA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6700C10E49A;
	Wed,  7 Oct 2026 18:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0YBLuBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B458D10E49A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791398474; x=1822934474;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lz9+szUoeFsbJ9T370bM9wZA1CkcZuJNxPsTbxrzlsQ=;
 b=l0YBLuBAta+cBfQOz7lhbaZjbJc1n9hvHNbgrJdzJLAsMKWdHfTT3kiZ
 fWBoQHDRlkINrr3fMgwgKrzZI1tpcWn5KztlX92SQELB5ddj4sCG6l5L2
 NHRfH0wuIpjvOVjwFRzQQfT71q32tb29vmhmVbnMIYuhbKeKBGb4CyYnD
 cNq6hmzg9ShJUi8CBzLh0Sxe9yI03SZNlCs1rWIwVgd/6TVdzyx/j/0vj
 xIky7IPkKsIoNjnlddgRtLXHLJAy6m8UJsKDY8298Ce5lGjYwwvDYeQhj
 K9YQVQmc/30pL5p7Qt2F+3KySrklpCQnlhjg3AMVCCPlGguL5W1h8D9lx A==;
X-CSE-ConnectionGUID: sy2Jc1BIQVOS9meG8Sws/w==
X-CSE-MsgGUID: SOpd4wOKQXuxVGY7Jg5uSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="71617"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="71617"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:41:13 -0700
X-CSE-ConnectionGUID: 0k3dHyDaT1mp8ZU4T/qqJw==
X-CSE-MsgGUID: XPYn00acTuqWSO7yEuPr1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1618887"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:41:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:41:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 11:41:12 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VV67woJvc7dB/5fhfPWTAzPWQyvutS1anbbNQBMpTcgENTfpG6zNPsHXEf+Kzqr/Gpfaw1uK7do8Kf/EXTnHyB+ytKOVnfZM9MS0FnH+g1tUR+3mOpCvOVYZ/GA6qoZ+OUM/3JqeKgaxKv8oFvG5fXYvfyyKl1Gfmzs06m8gSWVC8SM9QQUR321CZU3ZMZExX/i8D3kx0wdXi7oH63JBsaP0Pc7pz+5UuJC3vYA5X6ydXYXQXwxmI3KPIUSRTLlDi7h8aCtTw2dCugTyHwAH7JWIknnv1fDyHOlB0rNiANpuLHI05K2UVVYX1M7Eb1QUGFzBkDffXFEd/iEOrBv0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPKSFOctIEEoiH69jxtZIKJzUXrNWHrGtmTz3OVvka4=;
 b=ORI04sJa4rcg3M1Uxk5JTSm8L8C5CcS2/dMXX71v09GqRu17r2bux3NgPCiq0/GgX7EohYy6XGn60duiYngZurUwbk1t0YTMudzjCv2a2HZe8EEHtWD03JvP/vtYN9uXM22qVqjcnWO/rwd58NudUKwTqpvOIzveQRjZ5IxulgRJbOQCywwrAS1LCJb5H9G28uPh5VXFxlTOG1o7+vqkYrVtN23alBTkPs3REcKmqg114e//yV1Zn4PUz7u/B5WraQP1oJ1ipfCEq8blCQaibedy3xODweV8t5V96XCr8APJ3whx34xydXLJREgBB9rN4w3GSrmZ5XUmsVB9LVCjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Wed, 7 Oct
 2026 18:41:10 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 18:41:10 +0000
Message-ID: <4ae3b310-bb73-4cc5-b4d4-ed0aa38ed045@intel.com>
Date: Thu, 8 Oct 2026 00:11:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/15] drm/xe/hwmon: Add CRI PCIe temperature sensor
 offset
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-15-karthik.poosa@intel.com>
 <asaO9L1vpnNXmAIV@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <asaO9L1vpnNXmAIV@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: a73825c6-f108-479f-153a-08df24a28e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7gT0JI7SLP9OpMaYCitExOY8yevue3G9dtHq/acwpIg9MXqQBGzk8UeeD8fRVbGFZMa7vrFTywWt9TfSQiOw9kpcp3XbVYP0cZISJFVYgiLIJyB8mZkjl7WvGkwl0z0bmuhkhTPxUQzrdi7QGQNJvdhZDqw/UfBhlp1JUlFAVu++cyC4GZ4Ld/OOfQRyEY4yJ/PwMIBW7m3uDGBUG0CwEEoH7bunz+WltYRTJjJ3HtwsXIV7Fq8HtwKCPVEC7mKFd/SmnaAf+xDL4L35fcoONPn0l/Y5IborCDVp9SrqSx1e9NAao6ok+s7N2YZtHZyJdAN6lR/akZmH7ml8Vuxp6frzVOxUjFKOFGPEEHfdu7Mb/WHhDo5Crgfbwj4fMnWm3nkq2sOBjHYF+1xwQCuyOh+Vc366kKZk9vOogTuz/MK6+KaucnoGCHqx+iB+cLwFVukzMiYKf6O53r6e4Jy7fzyGnf5I0Sb4GtVTT3tJZKM0rT3XpqGjvjArsTIi+R1it7Cj5RP5uJyf0mrG8th4VUu44eK5MxhfnCRfBNL21443DhjXjghrVEdyEUndVpoDWUbmTM5hhHTsoi14dHpRnCis4DnIfhog91ScE/jPLIfmXXE7kpeSifH/P4QkqUSAeoxV3LIsyBudhrd9Xy4n963yBj13ZSb2N6sTyOMqdEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hIRSt6MVFLbmM4V3VmUHk4SFhWb2dRdUVuZnlGdGxFb3pHZFlTY0plTUxL?=
 =?utf-8?B?OXQycjZMdjY2cGZtbkVEbnVQdWpuRkUxeUQrQnh6UERyaUI1azR6MExDNFBh?=
 =?utf-8?B?eW1SQ3FES2paVGxKNytlYzlQWGw0VURwajdBQm1RUXdqZ0UrU2tKVm9DWVE4?=
 =?utf-8?B?T21SQ2tLYVQybmZMcS9pdXVHd1FIUmpNa2ZqeWN4T2dpcFdWQkZWeUYrVCsx?=
 =?utf-8?B?V1dPYkhkTTlUK2Q3UUtkR0NFbjlHeEsyVm5YZk5IRFlDSlJpMStBRE1HbjN3?=
 =?utf-8?B?UFpnVDcydWJRTTkydWgwSmVDL3NrTWJjMTFFYzUxR1RYTlF5dkduMU5tRGRI?=
 =?utf-8?B?RzJ2OWpVQlhFcy8xQ3lBa2pnbS9LMnp0TXNEQTFuS1pIWmNibDJGTHZ1MFlx?=
 =?utf-8?B?RC83UFRHYno3MWJ6SFlmaU1odVpsQkhDcFU4WnpCT2VOV3drNWJVWmFrUnc3?=
 =?utf-8?B?T080UXF1bS8zN01tWWU3RTkrZEZRMm9QWklqRmN6OU52MHZRZ3NrN3FZaHNP?=
 =?utf-8?B?SEkvT2NCYkxQUk8raUdUUDlCY0V4dFFCZko0TXFWOVBhdVlVUTh2OERkaTR0?=
 =?utf-8?B?cFVGWmRlTkYvZEVZWjJ6ZldjZFJHWEhPVllQaWJlSi83Q2JRQWlhcXNpVjFL?=
 =?utf-8?B?blNLYlVna3ZKZUFDMlRmSUxkOStrQ3h3a1Q5bDJXdTh3QUhXYXZGbk5GOFpH?=
 =?utf-8?B?L09kOTFKbE43emU4UVc4Tyt0b2NsZVdLME0xbFFXMEtURGtzTUhudlNSRkVh?=
 =?utf-8?B?VVFHbUVTVXJyWEFjR3BaREs2enVLTTFLZXcwZ2U5SWtZdjRJZThnL3pEY3pl?=
 =?utf-8?B?djcvNjdNV1QvSExpOWlZZWlDQmdSUHdRQ3c2cXZNSTZMNTdkaWN2SXhOZDNU?=
 =?utf-8?B?MkF4L2dYdjc5RHNFalVHQ1MwU3JhWHVrUkcyYVNzNWpmdW9KWmswNnNyYnNI?=
 =?utf-8?B?ZjZsZUtyRGpTRWUxV1grOXNNaXRSc1JxRjNrZU95L1ZjU2EwZzgxMGlsMko3?=
 =?utf-8?B?dDIzNkFhQWtvV2V2R1hyb0VzSUs1WHkrN09FWmVRcGpHQzlKVlBRdUJlNHpu?=
 =?utf-8?B?MjVUU2ZTbVh1K1MxM21IVzZZTExsVjRrUjRDZ0Z5ZzlQUmw0anYrdzJ2d0hy?=
 =?utf-8?B?bTBIcmx6RkZ0aCs4ZCtaU0tyWm9XalFFdUJuT25IS0pHMXJGb3pab1ZBb2ZF?=
 =?utf-8?B?NWdQbFFFL1R4S1A5WUlETzVMWWZ3SStFY1U2ZUlvdWs0YkhmUXlobWFhOUJo?=
 =?utf-8?B?NjYwbjYzODByOEJ1SlNReUxNYzBzKzY5dmJMR0NqbnRCcFhyOEhrbTFRTWph?=
 =?utf-8?B?cHZ4cHlKTVN2U3F2VE02UHZrL2hSTnRMNWlPa3gvVlQ0SjJOcUpzVHRIZFVi?=
 =?utf-8?B?Z0VvTS9tdmhaQ0JVQmtSU0lTTE42NTZmMk9MV1hDSmJKTTFmQ2hHa1VZaDRn?=
 =?utf-8?B?L21leHlOSk5tWlhzMEtoajBoMUo3emxiVlhCOS9tUDBMNFRNOVYyWE5UZGQw?=
 =?utf-8?B?Z3BkUGUzUkg0aFF1Mnd5TVAzUk91enkyRzJRbG44VzJ6MlpuRTM4NkZ2eCt4?=
 =?utf-8?B?U1hnejBoVGpYUDdUWmNqTUFScEhYRlZ0TDJSdk9HVjNaV0xPaW0wZXdMSTBn?=
 =?utf-8?B?S3hvc2JWUVZXL0wxZ2RETVh3VTI4eVE0b0k2b1ZKemlLT0pJeU5KbmNJeTdu?=
 =?utf-8?B?bjhPaGtyOGF1cFVPQkdWL0lUbEhISG9hZktBRm1zK0FiOFFSRzRVby9OR2sv?=
 =?utf-8?B?TDNsdzJjejlhUXRDdGdiU2lDZ1hGZ1M4bzRjdEtHcThaeUFoeWZzMkw0SWFj?=
 =?utf-8?B?YzI4ckZQN2oySXg1OVVEa2hVZFpMU0JDcUJXRzVyeXRsZTFUOUNIc3lQUUhH?=
 =?utf-8?B?dGl6Q0RucWNxaVIyYTd1UEhOQUFJN3FsdGVvNVd5elJCTFRnS2pkQ2Q1d2J4?=
 =?utf-8?B?VlNuOHREaFN3OXI0UUhhYXV2ekZldFV1UTI1WnpWZEhSU0xCZ0tqRUlvYmpH?=
 =?utf-8?B?bDJPb0d4bVE0ZDEycFpYR29EcElvWnhDNENQR2M2WDhZZWt4MkdNWWxvZHJO?=
 =?utf-8?B?TEJMMnJWbXNGSEdONytGQWxmUFl2bnBsUDdWOHlhcTZKTFd2eWtVREoyUkFt?=
 =?utf-8?B?Z1BVbTYwSG9ZdW53T0lZTWg1cU0vVE43Y0JkSm1veHRacVQ3Ry8zeTROZHEv?=
 =?utf-8?B?T1NuMWF1TU5RZ0RJUXNrN0JRSFJuR3NrTmhHSGY4eUVSd2xVeGdPc0prTnB3?=
 =?utf-8?B?ZHpSdW9jNjhua3FZM1JTREJlYlVRU0twcTdEczlUd0tFdllmSUhCT21QYjNT?=
 =?utf-8?B?Wm5vamlhbnc5V2FTNUNvN2F0b1d0Sy96cWZ4VXpNRDZ1V2tqdXBBdz09?=
X-Exchange-RoutingPolicyChecked: XnseHIEQYnUYmYakxZZcec22Cod2wXhoJsqq2olNf7pJt1L6TPIHvByfMqpkTHK6nzadZQA4QRR1ZNMGJbSvtXOcZJOrhHOKRG57+tYHkj+zxaPHSpj+sSnkB5FvgB64HwrhM3qd+j65gz0EawRwKT1ff3oQDAKbSaGwYTiQBlsNrPCcJFocWYvkZXoqeSa/AKb+GFDotEo6MN+KciXV/VblbFrMScmI/womXUpVR8/nxm4Zyw5NaSsYKCr78MJ4AciUbudvjdn524XiBqPfwDay3yd7gJKowJdW6Rs4n5vK+ItO/osGgMtbUz2SzmuSjw0PC7Q0dNl4ed6DRCzVeQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a73825c6-f108-479f-153a-08df24a28e0c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:41:10.0565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRrOoHpJPu/oe6mJohEHZ5q40IgrmDR55pz4L2jgwg1xEeyfpYc982s9HDL0ocUYFjxaVJuz7bt4MbJHVLjtnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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


On 07-10-2026 23:57, Rodrigo Vivi wrote:
> On Tue, Oct 06, 2026 at 09:05:33AM +0530, Karthik Poosa wrote:
>> Describe the Crescent Island PCIe temperature sensor at byte offset 20 in
>> READ_THERMAL_DATA.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1cbd49933b2c..c7ab7b1abd25 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -482,6 +482,7 @@ static const struct xe_device_desc cri_desc = {
>>   	.has_i2c = true,
>>   	.has_mbx_power_limits = true,
>>   	.has_mbx_thermal_info = true,
>> +	.pcie_temp_sensor_offset = 20,
> wrong place and bad name and it should be squashed to the previous patch.
by wrong place you mean, order here in the list alphabetically ?
>
> But also, please disregard the rv-b that I gave there... seeing this again
> this is a bad naming... I'm also bad with naming, but pcie_ as a prefix
> seems something related to the pci spec itself, what is not the case,
> so we need something different....
how about .mbx_pcie_sensor_offset ?
>
>>   	.has_mert = true,
>>   	.has_pre_prod_wa = 1,
>>   	.has_soc_remapper_sysctrl = true,
>> -- 
>> 2.25.1
>>
