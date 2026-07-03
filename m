Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B345C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 11:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2832210E5B8;
	Fri,  3 Jul 2026 11:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUBhBzh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB3D10E5B8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 11:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783077856; x=1814613856;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TIsSgAEe2aY4CLxswpGA92H2eUR3betQJOGARzFrBNc=;
 b=iUBhBzh12WlSKVrA24DAPSXZu2ekkSwzUlYTa6x7Y/RIGCNQLmJx21jZ
 lsJ6a7Gd4VWFXG57+dBbeNgsDRP5zNkR9V+CtcRzWKJxk+hvJ1pmXPsHX
 DfjaFO91WECWXeiQCOZ+bjo9bom4hKm9IVF/d4EC1DOLm2FNqvzxXIoOb
 CnJtnPOmQcRkhglhMmRrnMTqhxbqm7t1FYMt3yatfOAIiBh8H11OR0JBV
 hFOs0D6rmG6Uh9HQIr4CDQ2Dyr+ITALvpp2RLC3d/bgCLdzdVmVke6Z85
 HvX7AGZboKbWbM+oT4z1K1h0R8Zc9DxiL8A+OD01eo72ggO6OO0Z64klg Q==;
X-CSE-ConnectionGUID: Y50Ce4HMSi6EBn0rpF71TQ==
X-CSE-MsgGUID: z6nHzYO4Svyx2gJwRq4jkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86380092"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="86380092"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 04:24:15 -0700
X-CSE-ConnectionGUID: JuULF0DARRuKXXLzrZdM5g==
X-CSE-MsgGUID: 5sMHWwrQQaS4FSJ0WC3lgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="291234107"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 04:24:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 04:24:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 04:24:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 04:24:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ro9KiZGvnHOBqGN21x9jt8rzp8l7L/AHPgn9TxTJBJHzTz4a4tap3oUM/ImDmnCTqks48uREGDeD08FaTkVUILSM6FKW6h/sXDcEl6e8ecSlC0UZj4oVJv9/NMGAqxeDdVH814BMeZ0cFBjIckoCXLQduyMG+L1bNUmddb84qtNX8PeIWaUeKIHEG0ypRvF1VBEEjeDz982Rz/GGdg+xgTfjXCT4uLobtUOMjdYPa+UVFnTo+KzmgrZw9DSQ7iQ4hccZWl0KoPa0hAyZtpVyRN/tbJrDF3PthRuBLrtItMn68qZmLFXGXMxZZPn9FJX+CjAYbkEjj8Dujmv8jbltfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V6yd9HrXXWdn8g54bI1C1Awo/oEWfM41Q4Bq5MTX6s=;
 b=U5qMs2eZLkmvlA/orOYA7xSw7faM0aB37IzLLOHIwzGr6Q4ANpDT7An2Z6fy8MF/jNEZp0s6ujCfZvDmzAk4b7TP0n/jd2jSYdpAR3JloGrScjnxPQ6rX8Q48bxM49AHF9mWoRuLcssyA6x/dA1MYNUlup1p9Lu+Zlk5M1L0OXmS9D3d0lcBbCvurFUS7n6hwnktcoUPzu5Q3lmmCKiGNbUpkfD7cCx4HiGsPC4lgiErKfDqR8Wu5GVBpKiitbW/iwUypsRy2+la+xd4lHq0xD0Fle69j8dW+qa8XDqwctaPgSABc3tNB/ST9C09Thx9UMiJt3XdZZau/mIRmW5ncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Fri, 3 Jul 2026 11:24:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 11:24:10 +0000
Message-ID: <b56bf4f4-cc03-406b-99c8-7899c284d84e@intel.com>
Date: Fri, 3 Jul 2026 16:53:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] drm/xe: Add RAS logging helpers
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-7-mallesh.koujalagi@intel.com>
 <6a1dbfd1-9fce-4f02-85bd-7d6038f41ff8@intel.com>
 <0ddec0f7-4230-4548-b20d-4128b15c9a4e@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <0ddec0f7-4230-4548-b20d-4128b15c9a4e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: b4718e3d-d3c4-4f1c-7088-08ded8f59a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|6133799003|11063799006|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: 7QyJgZR+Q/CDLdfUOPC2G1lmGesSL+KeY/fNKUQRGWAv+zqVhDsM1/VhHwi1JjKRMvvKNQZkuiqxXbDXmIjlhlpEmTkNJKQyYbhbx6BmUNlJ1eI6orFO6MZ5RUMY2U+1JOlCz3EC/asC5yqFxVOyfPzwTsf+Ck8wpc/0tsxJ3Fxd/FRGMuUamd44dNsCMwVZBCHE+Up65uIjPjaH4nyAwtYrRGp9azd23pmwBrT9JiVBmsOYqrUsdBoH12x9vXv2UletBy3uQoDFXKPeemNoJq2r5ZrxBE4F1zhyLsbcfjNpohRwuCTrFhgcadZrBtb0GYRx3UrQfEydJmweOPnVS84NC3bKoz4/IV7H9Yc12/LHX4/6d8V+yNinNDdGP0fbaOh3/v/73WpIhStTSQUgAXC9xXdzSWb8197woQcRmxOjS5SHgKiThdLXWKuYSZEGg8f9eCdJNn6hk4KJquDo221ESvKjZOTGygefIgKV+AM+FXzxsKeolCSjKEY629ORx6B7yY4/2MUqzSQwieqkC6rUn0vCR1BkVm+qLAboVYu8/Po9FZxtPuj6vN1KOVJammM22oeiEPsv8yhjeEGPqrKGBfj0fdUMf7FwMfobdw2LvjF6C3T8y6kLqOwRBkJhP3XRNAiydXN7VwA/m7TxqvDhHXsNc0JlWNz/l2385wA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(4143699003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1NsV0ErZXBYUlZLMjJFN0NYUWh4elpMbkNzT2dQYXBjb0F4OWx4VlZlL3Ju?=
 =?utf-8?B?OWRzSHdDQVRYczlPUmk0VWxub0I5Z3JaMGNsNjNtMGw0eEtwdWhkWi9PM3pS?=
 =?utf-8?B?WWxDL0pGcDY1Yzc1bzB0Zi9RUUd0T2lBc0J5ZHJTeXdrWE03MTZMQjhzaFVv?=
 =?utf-8?B?YjlGME4vT09ua2hPZ2hzSVBkZTlVZS9tWkFuMFEyd0FTb0JxNENJK3JhNWVi?=
 =?utf-8?B?b2E2QnFCckw5cWpTbk43SVNiajZLZ0g5dWkzZjRuSmxiTUg2enprVGNQRnBY?=
 =?utf-8?B?akFMS013TkN3SFBFQjdDWjNEV005VWppVm8yeFZrWmxUT2o4TVYzbm5jbEpp?=
 =?utf-8?B?cXJyWmxKU2JweE1FcTZpWmRRT3hXTHNiUi8wL0szYUVHcUlOWnFrUHlKcEoz?=
 =?utf-8?B?ZUJGZUwyWjI1L1U4Zm54T21MM2V6RmFmK05Bb3RNUzhadWVIMld4clplaHhu?=
 =?utf-8?B?MmFnQ1ZoV1crcTZYNm52QjRrMGFsalZYOUhpT1ZBeW16SmdZSGNPQ3NJYTdu?=
 =?utf-8?B?djNBZEdKbURDQnArVzBvd1RneW1aNEN4bm15SmRiUHdtVXJ2QzFlSkhDZi9W?=
 =?utf-8?B?SXhxOUhXL3RvR1B0YXN1dTdjZkpJbWZ2NGhkQ3dYTlc2RlU5RzVCS1FVRkFv?=
 =?utf-8?B?UWpMWUp1bkl5b29idTNQbnkzeUhJNWxRL2pkNzJ3WW90TW91YU81ZlcxcGN5?=
 =?utf-8?B?VDlxeTJFQ3FSVFhocHgxNWtTM2luZDNLbjVKNVlhUWNVMTJjRDg2MG8rRjcx?=
 =?utf-8?B?N0hIcmxtQWhyemxrK0ljSFQ0VUVsK255OU1uV1dqR2VialNBamJBdzBrWmI4?=
 =?utf-8?B?STJoR1hqbEVscTM3THlwbVVBQm03U3NqMnFLbGpMT3JlRXRFcXZEWnpTMnY2?=
 =?utf-8?B?SkVmMHJxSVRsejIvQlF0b0xsTUxZSkRXTk96NHVkdjIycEhHdWNteDY1SXdv?=
 =?utf-8?B?UGxGR01zR0hxdEM0RDc0YUlKQ1EyOHhUNlhTQW50ck96WEU3ZmZCSWVzVzJm?=
 =?utf-8?B?dVk1QlY1aFJmdHp2TG1xSXdDc0dUN1FpREYrOXo1TW1uY1htNkp1b3ZJck83?=
 =?utf-8?B?R09YaEZwcTFzUFNDdS9oY21FUXFaZUtLdGo2UUtLcWRiQW1HT09QeFg4NkhC?=
 =?utf-8?B?TWVnNkk4MzZjZWpaSEtYSWZRNTNBUXdDcFlHYzZjdkNQTVJFY3ZxWEdyZ1o4?=
 =?utf-8?B?R1dFTGd3NEZXb2NmY21LQ3I4amFOdEFKZHlBemtpaFRJbFgvYVQvbW5aQS9F?=
 =?utf-8?B?RFA0cThxVFdvVFJMUzI5c1FBbTRPYlBndnpmb241UC9qVUVSZFF5aFYzUlh5?=
 =?utf-8?B?T3lIVXVrZWQ1YWZiazdENmFuU3RxWHZ5bGdPV2hwbFZCVUwzL1hRVmVOVlIv?=
 =?utf-8?B?R2w2OHpqZGRLK01ydmhtckl1czJYSHppOW0zbWhRQUsyZHVUMHRjV0tYV0Iw?=
 =?utf-8?B?emV0ZUg3SEY3cFhsWEpqTHliQ1IrQzdpY1VtSnloSGxMTEdnelhHcmF1VG0v?=
 =?utf-8?B?ZkdhS00wZEIvd1JHMng1blZOcEFoMEw4a2JuVG5MYlpwMnVHT1pnMUVkSVFJ?=
 =?utf-8?B?cGVzM0NsdmNLWEJEQTZNa0NDYVhtS0pmUVlnbEtWTTB3SHZNbC9ZY3RqbXYz?=
 =?utf-8?B?MnhIeTErbHpDWm45R3lCc2YvZExOWi83dlRQTjJlbFZ2aGsvdzBNU0wxM1Fk?=
 =?utf-8?B?MUFrNEpKUzVab2Z6U1VicmpDQVV2TFZBbFV4QnM0QXpDa3dVSk9mSjJHeCts?=
 =?utf-8?B?Rmt3SEIzVjlQRkU0c1I0MEZCSWlwUnRjTlBsRXFSL3hMSDc1R0VlTHpoRGxI?=
 =?utf-8?B?cDZhRnVhWkRtaUxiMzZhcmZFTldneUdNR2VXUVZiTVQvdkFSUmN2dy9FakZj?=
 =?utf-8?B?V01sZGEwT2c0aDhmbG5lV2dhSlc4Tm1yVlpZWlQ0Wm9KazJHdHBtbEdoMkFy?=
 =?utf-8?B?ckdlU3FPUktKSHlnSUdldHEvQ0ZjU3VxWkV0RnM4SmUyYnFxK3VOckd6NFVl?=
 =?utf-8?B?d0wrYU9BWGtkNDZubFQrSnhPWk8rZG9rQUFrbzVBSVU0VGUrL1Jqa2pFdkxC?=
 =?utf-8?B?Y240V1Y3U3NQUE5JS0xLT2FYT1JHYWEvVjYyMjZCVmVPZlZrYU9VSGUzTm5w?=
 =?utf-8?B?SytqUSsrL2c5Q08yZWhaUFNuZW1nK09EL2FxdFc4MEwyQ2MvaERPOEFSdlBk?=
 =?utf-8?B?VlpKR0s4bkxPWGxQR1hFMWZKMk1TWU4rcXJzcm5XMWlPZ010amhvejdyV0Zz?=
 =?utf-8?B?dHBzOFEzTHFhc0l2T2JhT3VNdnVvdXRwSXVQMUtVdkRWWHJPNUFhVUl4dFhK?=
 =?utf-8?B?NnVVaWE1YWNWeitkKzM0bHZiZTRaaFNkdWZZYS9GeGtDeWNzZUoydz09?=
X-Exchange-RoutingPolicyChecked: LDSObL/hAvycMOy6K7ue7voqe8aVCYy7MKKpG9PPM1H5mg5mV0X/K99eY0Zgc56tGPRM85RX5p8venzbt732vTtr7WkYxfj7JeTbE6gdW5w44mW9e4TBHULzd18V8VwBZr/Och3I949zT7p2ZrKu4/PrBPk6E4TxNl7/3JEdNCZ/Ut/gkQsiEqGa5ko85bq0ESgVFKDJO+XgCij+o1lZkIPWdESwJBXPJZg9juloE6N8pCYBrQpMnH/24DM17T57p1RarwRMo/JwFQUXjoCXv1tnQRajEyiBEixkDIC19/zi4QwuQ6S0AO1z21LNl0GWqJJJjXuR+is4a9kHPLzYhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4718e3d-d3c4-4f1c-7088-08ded8f59a2e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:24:10.3397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTWRNWI5i35wEyt1OZr3bLaKJ4asAXZ6mcRS4jEXSZb/pUeDUgN/lhBlwZiDN4uQ5xIek121xbHSC7kRdahKiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
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


On 24-06-2026 21:33, Mallesh, Koujalagi wrote:
>
> On 21-06-2026 12:59 am, Michal Wajdeczko wrote:
>>
>> On 6/17/2026 12:47 PM, Mallesh Koujalagi wrote:
>>> Add xe_ras_log.c and xe_ras_log.h so the driver can report
>>> faults in a structured, machine-readable way.
>> hmm, but the dmesg logs are mostly for the human admins, no?
>
> You are right, dmesg is mostly for humans. The machine-readable 
> interface appears to be the CPER
>
> payload exposed  through xe_error_cper/tracefs, while dmesg is a human 
> friendly rendering of the
>
> same event.
>
>>> The core is __xe_ras_log(), which emits a single log line with:
>>> SIG_ID, severity, location (device or tile/GT), errno, and message.
>> our dmesg logs are already to some extend structured as they contain:
>>
>>     severity:    <3>
>>     driver name:     xe
>>     device name:    0000:00:02.0
>>     subsystem name:    [drm]
>>     error tag:    *ERROR*
>>     location:    Tile0:
>>             Tile0: GT0:
>>     message:    GuC mmio request ...
> This patch add is a more uniform fault-event format plus the 
> CPER/tracepoint path for machine consumption.
>>> Fatal faults go to drm_err(); recoverable ones to drm_warn().
>> note that we already have xe_err() and xe_warn() wrappers
> Good catch.
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> v3:
>>> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
>>> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
>>> - Move __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
>>> - Make macro function properly.
>>> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
>>> - Add sig id documents. (Riana)
>>> - Change macro function same prefix as the file.
>>> - Handle __xe_ras_log() function with variable format.
>>> ---
>>>   drivers/gpu/drm/xe/Makefile     |   1 +
>>>   drivers/gpu/drm/xe/xe_ras_log.c |  63 +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ras_log.h | 108 
>>> ++++++++++++++++++++++++++++++++
>>>   3 files changed, 172 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 8e7b146880f4..607c9b099d03 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>>>       xe_query.o \
>>>       xe_range_fence.o \
>>>       xe_ras.o \
>>> +    xe_ras_log.o \
>>>       xe_reg_sr.o \
>>>       xe_reg_whitelist.o \
>>>       xe_ring_ops.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c 
>>> b/drivers/gpu/drm/xe/xe_ras_log.c
>>> new file mode 100644
>>> index 000000000000..0e836ef5dcf6
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
>>> @@ -0,0 +1,63 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include <drm/drm_print.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_ras_log.h"
>>> +
>>> +/**
>>> + * __xe_ras_log - Emit a structured RAS log entry
>>> + * @xe: xe device instance
>>> + * @gt: GT instance where the error occurred, or NULL if device-wide
>>> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
>>> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, 
>>> CPER_SEV_RECOVERABLE, etc.)
>>> + * @errno_val: negative errno describing the error condition
>>> + * @fmt: printf-style format string
>>> + * @...: format arguments
>>> + *
>>> + * Formats the message and emits a kernel log line via drm_err() 
>>> for fatal
>>> + * events or drm_warn() for all others. CPER record generation and 
>>> hex dump
>>> + * are planned as follow-ups.
>>> + *
>>> + * Format:
>>> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno 
>>> = <n> Message = "<msg>"
>>> + */
>>> +__printf(6, 7)
>>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>>> +          u16 sig_id, u32 cper_sev, int errno_val,
>>> +          const char *fmt, ...)
>>> +{
>>> +    char loc[32];
>>> +    struct va_format vaf;
>>> +    va_list ap;
>>> +
>>> +    if (gt)
>>> +        snprintf(loc, sizeof(loc), "tile%u/gt%u",
>>> +             gt->tile->id, gt->info.id);
>>> +    else
>>> +        snprintf(loc, sizeof(loc), "device");
>>> +
>>> +    va_start(ap, fmt);
>>> +    vaf.fmt = fmt;
>>> +    vaf.va = &ap;
>>> +
>>> +    if (cper_sev == CPER_SEV_FATAL)
>>> +        drm_err(&xe->drm,
>>> +            "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno 
>>> = %d Message = \"%pV\"",
>>> +            sig_id, cper_severity_str(cper_sev), loc,
>>> +            errno_val, &vaf);
>>> +    else
>>> +        drm_warn(&xe->drm,
>>> +             "[xe-err] SIG_ID = %u Severity = %s Location = %s 
>>> Errno = %d Message = \"%pV\"",
>>> +             sig_id, cper_severity_str(cper_sev), loc,
>>> +             errno_val, &vaf);
>> again, this is not a very friendly message for the human admin
>>
>> can't we just add severity/id pair to our updated xe_printk macros, like
>>
>>     xe_err_fatal(xe, id, fmt, ...)
>>     xe_err_recoverable(xe, id, fmt, ...)
>>
>>     xe_gt_err_fatal(gt, id, fmt, ...)
>>     xe_gt_err_recoverable(gt, id, fmt, ...)
>>
>> and print sev/id pair within single tag:
>>
>>     0000:02.0 xe [drm] *ERROR* [ID=123456] *FATAL* format ...
> Agreed, however we've per file macro reference.
>>> +
>>> +    va_end(ap);
>>> +
>>> +    /* TODO: Add CPER record driver handler */
>>> +    /* TODO: Add RAS dump cper hex handler */
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h 
>>> b/drivers/gpu/drm/xe/xe_ras_log.h
>>> new file mode 100644
>>> index 000000000000..08318dea75a9
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
>>> @@ -0,0 +1,108 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_RAS_LOG_H_
>>> +#define _XE_RAS_LOG_H_
>>> +
>>> +#include <linux/cper.h>
>>> +
>>> +#include "xe_sig_ids.h"
>>> +
>>> +struct xe_device;
>>> +struct xe_gt;
>>> +
>>> +/**
>>> + * DOC: RAS structured logging and SIG_IDs
>>> + *
>>> + * What this file is for
>>> + * ---------------------
>>> + * Use the xe_ras_log_*() macros to report faults in a
>>> + * machine-readable way.
>>> + *
>>> + * What is a SIG_ID?
>>> + * -----------------
>>> + * A SIG_ID (defined in xe_sig_ids.h) is a stable numeric error class.
>> hmm, so a SIG is now a CLASS ?
>> in the prev patch it was described as 'GPU fault signature'
> Sure, i'll make it consistence.
>> and this kernel-doc for SIG_IDs should be in .h file where we define 
>> those IDs
> Sure, I'll move to header.
>>> + * It tells tooling what kind of fault happened, independent of 
>>> message text.
>>> + *
>>> + * Driver SIG_ID classes:
>>> + *   XE_SIG_PROBE         - probe/init failure
>>> + *   XE_SIG_WEDGED        - device unrecoverable
>> hmm, in drm_dev_wedged_event() we can specify recovery method
>> so what unrecoverable means here?
> Good point, I'll fix the comment.
>>> + *   XE_SIG_SURVIVABILITY - degraded/safe mode
>>> + *   XE_SIG_FW            - firmware fault (GuC/HuC/GSC/CSC/PCODE)
>>> + *   XE_SIG_GT_TDR        - engine hang or GT reset (TDR)
>>> + *   XE_SIG_MEM_FAULT     - VM/page-fault/GTT error
>>> + *   XE_SIG_IO_BUS        - PCIe/IOMMU/MMIO bus error
>>> + *
>>> + * HW SIG_ID classes are hardware-defined categories, reported by 
>>> firmware via
>>> + * CPER records (for example XE_SIG_HW_DEVICE_MEMORY). Driver code 
>>> does not
>>> + * emit HW SIG_IDs directly.
>> if HW SIGs are HW defined, are below IDs also defined by the HW
>> or HW just defines different components, and we define IDs for them?
> No, the numeric values are not defined by the HW. HW defines the 
> categories; we define the IDs for them.
>>> + *   XE_SIG_HW_DEVICE_MEMORY  - device memory errors (e.g. ECC)
>>> + *   XE_SIG_HW_CORE_COMPUTE   - compute/shader core errors
>>> + *   XE_SIG_HW_PCIE           - PCIe interface errors
>>> + *   XE_SIG_HW_FABRIC         - on-package fabric errors
>>> + *   XE_SIG_HW_SOC_INTERNAL   - SoC-internal errors
>>> + *
>>> + * Why this exists
>>> + * ---------------
>>> + * SIG_IDs let RAS tools parse logs reliably, correlate CPER 
>>> events, and apply
>> dmesg is not reliable
>
> dmesg is explicitly not a stable API, it is emitted “for logging 
> purpose,”
>
> while the machine-consumable path is the CPER record
>
> via the existing xe_error_cper tracepoint.
>
>>> + * policy/thresholding without depending on fragile string matching.
>> if the whole idea is to group our errors per fault class,
>> then maybe our macros should be used like:
>>
>>     xe_err_fatal(xe, CLASS, fmt, ...)
>>     xe_err_recoverable(xe, CLASS, fmt, ...)
>>
>> and output should be:
>>
>>     0000:02.0 xe [drm] *ERROR* [PROBE] *FATAL* format ...
>>     0000:02.0 xe [drm] *ERROR* [TDR] *RECOVERABLE* format ...
>>
>> as printing magic ID numbers is not very friendly
>>
>> and any 'machine structured output' should be exposed elsewhere?
>> maybe as sysfs file on the xe module level (to catch probe errors)
>>
>> and maybe start with that alternate method first,
>> and use dmesg logging only as a best-effort informational step?
>
> We need component based helper, not based on severity.
>
>>> + *
>>> + * When to use xe_ras_log_*()
>>> + * --------------------------
>>> + * Use these macros when the event is:
>>> + *   1) a real hardware/firmware fault,
>>> + *   2) relevant to production monitoring, and
>>> + *   3) clearly mapped to one SIG_ID class.
>>> + *
>>> + * Do not use for all logs
>>> + * -----------------------
>>> + * Keep regular debug/info/driver-state messages on standard 
>>> logging helpers
>>> + * (xe_gt_dbg(), xe_gt_info(), xe_gt_warn(), xe_gt_err(), 
>>> drm_dbg(), drm_info()).
>>> + * RAS macros are for structured fault reporting only.
>>> + */
>>> +
>>> +/*
>>> + * Common backend helper
>>> + */
>>> +__printf(6, 7)
>>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>>> +          u16 sig_id, u32 cper_sev, int errno_val,
>>> +          const char *fmt, ...);
>>> +
>>> +/*
>>> + * Driver-facing reporting macros
>>> + */
>>> +
>>> +/* FATAL */
>>> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +/* RECOVERABLE */
>>> +#define xe_ras_log_fw(xe, gt, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>>> +
>>> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
>>> +    __xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
>>> +             (errno), fmt, ##__VA_ARGS__)
>> IMO those RAS customized macros, should be per severity and take
>> a CLASS as a param since there is much less severity levels than
>> your new SIG_IDs fault classes, so it scales better
>>
>>     xe_err_fatal(xe, PROBE, fmt, ...)
>>     xe_err_recoverable(xe, IO_BUS, fmt, ...)
>>
>> and I'm not sure that there is 1:1 relation between CLASS and severity
>

Agree with Michal here. Let's not force severity per class.

Developers should be allowed to set severity irrespective of sig id.
Having severity based helpers would also be useful for HW error logs.

Thanks
Riana

> ditto
>
> Thanks,
>
> -/Mallesh
>
>>> +
>>> +#endif /* _XE_RAS_LOG_H_ */
