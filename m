Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F3F606A333
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CZVAfM/D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C731A10E400;
	Wed, 11 Nov 2026 13:17:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3683710E3BF;
 Wed, 11 Nov 2026 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794403067; x=1825939067;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PGG6jUiEaLS0OY1wAi8Gh4ZKi7RH8GPV1oHWpPN9ssw=;
 b=CZVAfM/DSIyfZF14QAfMdrnVenFX0Ge2geP5JLK7Gic40gQ6jXmhW9jH
 tKz0UyvEXmFdAAHyt1vCln5Ohq0RhGDv/GHzF2bBegpvR5hT7X3Zgtv1z
 FcG/DvJWC6jKckBUhKHNVhYYdlepogjLTfRkIHyz6arcQRpKVpdgBCXjF
 hdNQ3yNV/U0kfcUfnIO+iEEAwzMUEiE3Xvte7ElUvz9iJnFFAM4PJihX4
 6Xm2tM6yLLi+zUlTnYHZg3Yx8iO0NiUcRamHyu0euK5TuyFIad8dkVAAM
 V9y+GZcRbPM3672pckintFKm7woxxWuK4YOoSuSchHNXMtEOXqfb9+53G A==;
X-CSE-ConnectionGUID: rxqW96yATLuUK+fo3Cogew==
X-CSE-MsgGUID: rjuzBDWURIu1rjqjheLQ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3179222"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3179222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:17:47 -0800
X-CSE-ConnectionGUID: 8RpVgndjQ3ypSkwFZ4eEdg==
X-CSE-MsgGUID: PnTR7/evQmCSrpZZXbegnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8280778"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:17:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 05:17:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 05:17:45 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 05:17:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/Yu8fmhKWA9RYzqBttVzI2NuvCkyZ89Ckhgrpip5KAEhRMYu833B19zlzzMjBpn1akm1TL2EfqZc1F1pis7TmeqDEgLhrBc/lF+IHnJWi9lYv5CKEK0czgaj/iq5ylfPf3jXsD6YIFQCEaBqpQP9ds7o6fs4LKRv7BalFIaMrR5rBj4C6HvI3ZcYM4fNQ6Xz07ddnvjwzUbqcYG7rx1O5ZwnQ2Lx5oTLOUfKwFVwjUCklrOLjboWNS/uohiEexV/+Ihjt730uwAJlmN8G//Zl7evbJ5IU+mPeMfprFbxYgoUQlJFXANbFOVTJBGwHWAf/6mPrPTycXMWevjCjNgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WIncSbNcdYp+InoDlJI3YtnYdwT6GG6OtMvvPYzeNU=;
 b=zFdsaFu+/lbgwK6CUQBPdq77T/xvtpPUlVTdC2iUFbackJjE6Ag/w7awdEQMyjXVo4lfhhN2BwRmCGdWOAigAESrbPyw6Z4nShOoQ876y27NfY1ydLl/ACTAK8phJ8sWDqXRwyCFypaPZyotAQ9Sa9SmTk4Ouh/Zn89kVdxpUAH2j/LgPMcZpPreN71rUl/VMFv0v0VxzJaC0hXt5mE/Yld5Rd4xp7Pa64CkUX6ILo1cy3jgLGcxWaJtwZ8y4hnauEN3XINua/xvq5seX/Uu1DVFHlY3cZNbxQv2CvuNvqsOvIiDBFWMW/Zq7iHFzBEBYs23AD6xiwAGHAfdTXoljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by CH9PR11MB759243.namprd11.prod.outlook.com
 (2603:10b6:610:30f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 13:17:39 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 13:17:38 +0000
Message-ID: <5fa1b644-2389-458f-b8dd-cfec57a7ebad@intel.com>
Date: Wed, 11 Nov 2026 18:47:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dip: Write the DIP header last with SDP
 transmission lines
To: Xiao Lu <xiaolu.xie@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ankit.k.nautiyal@intel.com>, <suraj.kandpal@intel.com>
References: <20261111103542.4093652-1-chaitanya.kumar.borah@intel.com>
 <20261111121653.79410-1-xiaolu.xie@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261111121653.79410-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0069.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::17) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|CH9PR11MB759243:EE_
X-MS-Office365-Filtering-Correlation-Id: 969177a8-4bc9-4420-e133-08df3ff628b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|260925021911599003|260925021311599003|260925022911599003|10067099003|11063799006|4143699003|56012099006|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gyRwQ5AWpD8OYeL6ovsxNxMsaTrM7u3l7meK0i28MrqJEe+fkKCr0eTzHBf/8fW5Ljt7hMBI+51aAiz9sRj1HO6Ygx4uH3oebV3hZESqRRjVNERFREzhM4PoKV4DpMr0KI8p/ZCo/2QZpo+laMa5WFC/vEHUSk3v36iy3lqsaat4enHXNkaISH5seznmeiXKVp18I+8W6GHOgU0RlU59/e2D45Db+WJsDLlABTFCn2rhcQ4rEOYiZSk+Hpptp07atOHp170i098zD318J15BGiUvJ0KoeDmA/hNcjWrwdBx3pR12nMRt6qxgEkZuS0zSrD6LB71RoF/Ks69oQcBJ6O7WJEWGju7q68msmfQ/pW1EmNrdQRwvww2jlprVP+C3Xcoaynp568ZWknoIb5AU+9Vys1kUw32KVhc91pbIyiv9pYeO4wC+smv+8an4iQDRLJV/tvw5IA0lTjGDkYWITd58vBIETxej+GBpxJUU0XIb8qNPUhzCUDtBqqV7Wot5BF6em7d2NVUumm1BRVl/fVZFy4SjiS6BHLjf3DBS60pFKl/aDo15f+/M3zc66KmZkhan60aFj1ZAuEdtvgVbaJ8IQByuwgMhu60WxX+KMGg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlQzSUFqY1dsNTJkVXFpcUF5T2Y0dElkaHFWRWlPRGttYzA1Titjb3hHQ0hq?=
 =?utf-8?B?Wm1sYXpsblVJQ0xsYTlrZ3pBWWJwaXhVV09kWS9Iai9vTWswNUw3Tkc5MmlL?=
 =?utf-8?B?RUVTTEtqTmgvMFZmdGdmdUh4b1ZIdkhTSlpTUU9nTkh2dlZoSENCUStnL3lD?=
 =?utf-8?B?UzM4NzE0azV6RlFvZTNsdCtpV1VCNjZianBrZyswdFFMQlVUTUZnWjh3bnBY?=
 =?utf-8?B?M2FsdWRvNHFBUSsyb2RJa092RTFiNDZxYmgrdk5FOVlsbWFYY1JYa2lqUVhS?=
 =?utf-8?B?Q2hSL2wxT3JxY3lpSWdtRU45K2R6N1hHc00xL25nUllvd3NRWnV0alZXdnYz?=
 =?utf-8?B?ejJYWHkwRlpPOHNJaThMeFVlaU15WXR3K29VOHh6elVjU2NsQzRRRzBpRTF4?=
 =?utf-8?B?VzI1eXIwNXJIeEFTejJmZlVaaEdEVUN0SXFURVNNM2J4bUxNY3RhaWlkMUlK?=
 =?utf-8?B?WlhsL1RTY2ZTMkV0bVZXQ0VyV2Z6N1NzQjRFRmFxQis3emtlTCtDQUdrcmFj?=
 =?utf-8?B?NlFrUFpSMUxYdDNId0NqMUMzeFdORElHRzJSUk80b04xQVU5TGRMZTFXb3Bu?=
 =?utf-8?B?bmJSTi96MkpVTUFoRnFRdVRUemI3RkdrR2pIajZ5SG8wQWZ0Q0IwbmlZMTBh?=
 =?utf-8?B?VG1yR3RMbzVrMmhoallUbHN3N0NHSG9DSWpxVllKR0hYNTk3OTgxVjBwb0FV?=
 =?utf-8?B?dllZT0x2eGxNVUZhN0cwWHJLUkJlNi9CdFkwL0VPUU11RFRoOXpuSHNBZ3hS?=
 =?utf-8?B?bVNQdHk3cHpZNlB2eXhnSHBnRUZiUVMrMVBNSTdsbDNhQjg2V0Z0Q2Rndzlt?=
 =?utf-8?B?c0hET1VTamRUK042Tkx1UTBqaFhUN3ZyaXU1TDdWRG9zMi9TWmMyNG1DVWhB?=
 =?utf-8?B?MXJQbUUzZ1pmRkE2WkFLS2c5MW4xM3ZldUVZSXBCNjIwTitoSVNBU0lJcSt2?=
 =?utf-8?B?YklnUDZDZDl5U0svdE1hUU5aN1BybFhLUzc4VWFnTkJndGwrWmxIbTJYVEdO?=
 =?utf-8?B?L2cxemhRckdCK09rTXFsbGFET25ESEVkaTd4WlNZc2w5bGJWRU9pZnNwQmgy?=
 =?utf-8?B?SWJ5NVhERjlQWWJFdkVIbTdFOGdSYnhEN3UzOVZ1VWwyVFoxRWxpZGJyN1RV?=
 =?utf-8?B?eE10Y2tEa2IvbmdVTm5IZVg1NnUwSjVrY0xKckRGTzJYdEZnTExaTUFQVlVw?=
 =?utf-8?B?TzRleW1UWFgvYXNSckdjV2NhaTZoQkJlOXFvUlRFMS9janBndmRiTGVicTFo?=
 =?utf-8?B?bVlKQ3dxVlpkN1hjT2NNeXkwRjJLQ2U0eU5SSTVSYzFZa1JDNlIxUXVBRGNE?=
 =?utf-8?B?RUJXMlpZbWl6TnB6QlloWUhIb2ZqdE5rUzNlQWJHK2xuQ0xHL1ExTXdEdmty?=
 =?utf-8?B?K0tBSTBEVXRPSnZkRldCWDJVbjZCek54RDA4YUplTUpPTXRrdU5INlRnU1pB?=
 =?utf-8?B?enBscVM2V3RXNng1akpSOHd3eVl5MHh6Q1h2R2I5aXlITldRNnQ1WjFEbGdu?=
 =?utf-8?B?NEVOR0M3T0xab2RFWDVKWHZKempXdFd5N2g3cURpWUVIQjdLM0xMME5jS3hh?=
 =?utf-8?B?RElPV2syNkVkcHA1emNDaUg2dHluS0loWEFKelkvTHA0LzN6cUh2bWtJT1Fy?=
 =?utf-8?B?NVcvSnhEOU96eUlWaHVQT1dFQ0xBUFB5RllSNFhWZGU2SnhUSUcxNVAvQ292?=
 =?utf-8?B?M1Fqenp3MWhhejdZSWV4RG5pcGVaZ1krZCtjakR6b3dkQ1lRRXJ5b1FBa21T?=
 =?utf-8?B?c2RISlY2dkZhdFBTMCtuSEdaU0VsaGp6RkFIRm1JVGVkTm41aGVWbE9yaDA5?=
 =?utf-8?B?a244QWdWLzZQZytmcmtpNWYwUVhQVFo0d3hZQ3dNbUdEeUZEdjNVQ0F6ajVR?=
 =?utf-8?B?b0E0Ni8vL2tkSDRRQVNhS3VVbXZvMEFaM1FwVzl4dXVCMWp2RDl6MEw0MzIz?=
 =?utf-8?B?WVlJVEZiZm1ueit2NXd2Mi84TGFRWFk4U1gwZklhYkZyaVJoVm53MDhFSzA4?=
 =?utf-8?B?YTRYWTI1aWxiN1EvbVlJbktkTkxEZENxTDIwTXpFSUw2YlJKNTRwMTNzRUNM?=
 =?utf-8?B?S0gwWXV4NjZYYlRwV3dleUZIelhCOVh2eWZ4NTZGQzdLMjZaMWMvcFhVL21u?=
 =?utf-8?B?ak8yM1M5RE5veitLSXNRMk9Qc1l5OEdGcVZnMHRlUnJUd29HdTF5TU8yR1Nk?=
 =?utf-8?B?YmFUUm82S25BRTRNQmxyTkc5MzRZdVpoNGtwWWVTNHJwbTl4d2ljaG00U0l0?=
 =?utf-8?B?N21iVjdvYkVIMTgvRDBrV3Erd0ZOZG5MK3crRWhuZzI1WUFINE9mVGIxSW5F?=
 =?utf-8?B?NjBQN0E0NWt2MHJYbG81MnFDU3VubVErMUoyUHF1Y1ZFekRickZ3Q1R4Kyti?=
 =?utf-8?Q?EtLCDleFAU2YECU4=3D?=
X-Exchange-RoutingPolicyChecked: ezePIPubAGcCL48grWCv616OLyRwMpzu3vcQT1JNHbAUaAqJhvGLcRX81sxq8Zmet7Kam6ln5d9aalH01OjMnkbcfwT17r9kQclfU2tHk0j8fvJAhGMceyrbT8vYdlWGOKvnbtr5ALrWmlekten06QnoKzsH1SjWpNBiwewyLJJx2SqmwsIDtQ6S7nhJy3sh+xTJ1iQBkaltY/GlguSYzig2zeY4+2Qh1wvRl2WDS7InzI5vdrnN4zWsFFTFdD+MaOmSGaRRAfGHb8vOudzZ6JG+K9ueep43hTKAYb5edxf7NQqIIzZGSVmIyVERcCZz3vAqaAeGgY+amZXM9jcPXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 969177a8-4bc9-4420-e133-08df3ff628b1
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 13:17:38.7749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THzwga+eIICZedui2jtDpwLbqEJ/tj8yWpZTMRQ+HVkJ8ylt1h2jCzPLTaYsxKqL2pfHFJSBzpaCeWjoDaSNCmbk9pHssVlzDHQMFx1SUC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB759243
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

Hello Xiao,

On 11/11/2026 5:46 PM, Xiao Lu wrote:
> Hi Chaitanya,
> 
> On Wed, 11 Nov 2026 16:05:42 +0530, Chaitanya Kumar Borah wrote:
>> On platforms with SDP transmission line registers, the packets anchored
>> to them are double buffered in the transcoder (TC) clock domain. The packet
>> registers are in the core display (CD) clock domain and the whole packet is
>> clock crossed on the write of the header (dword 0), so Bspec requires the
>> data to be programmed first and the header last.
>>
>> hsw_write_infoframe() writes the header first, so the packet is crossed
>> before its payload is in place and the previous payload keeps being sent.
> 
> This is the same change, with the same reasoning (Bspec 75640), as the one
> I posted for Xe2+ two weeks ago:
> 
>    https://patchwork.freedesktop.org/patch/763779/
>    Message-ID: <20261028112423.2445450-1-xiaolu.xie@intel.com>
> 
> Yours looks like the better base for that part, as HAS_EMP_AS_SDP_TL also
> covers BMG and it has the Fixes: and stable tags, so I'm happy to rebase on
> top of it.
> 
> [...]
> 
>> Alternatives considered:
>>   - 6a1712052859 (v7.2): AS SDP on whenever VRR is possible. The PTL
>>     report is fixed by reverting it. Narrower than the spec argument, as
>>     it only covers v7.2 and later.
> 
> Is that PTL report this one?
> 
>    https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9693
> 
> Our patch was written for it: an eDP panel dropping the VSC SDP after some
> HDR modesets on PTL, with different VSC ECC registers compared to the
> working case. The reporter tested our patch on the affected machine and
> commented in the issue that the test passes.
> 
> [...]
>

Thanks for the pointer to your earlier patch. Sorry, I missed it. The 
PTL issue I was referring to was a different one:

   https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9746

where reverting 6a1712052859 ("drm/i915/dp: Enable AS SDP whenever VRR 
is possible or PR !async") helps, but it looks like the same problem as 
seen in

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17732


>> +	if (header_last)
>> +		intel_de_write(display,
>> +			       hsw_dip_data_reg(display, cpu_transcoder, type, 0),
>> +			       data[0]);
>> +
>>   	/* Wa_14013475917 */
>>   	if (!(IS_DISPLAY_VER(display, 13, 14) && crtc_state->has_psr &&
>>   	      !crtc_state->has_panel_replay && type == DP_SDP_VSC))
> 
> There is one more hunk in our patch that yours does not have. Right below
> this, hsw_write_infoframe() ORs VSC_DIP_HW_DATA_SW_HEA into VIDEO_DIP_CTL
> for the VSC SDP. VSC_SELECT is a two bit field (VSC_SELECT_MASK), so a
> stale value is not replaced but merged with the new one, e.g. 1 | 2 results
> in 3. We clear the field before setting it, and also clear it in
> intel_dp_set_infoframes() when the SDPs get disabled.
> 
> Was leaving that out intentional, e.g. because the field is guaranteed to be
> clear at that point, or is it something that was missed? If it is needed, I
> can send it as a separate patch on top of yours.
> 

I didn't look at VSC_SELECT, as the header write order alone fixed what 
I was seeing. The driver only ever writes the "data only" value there, 
so a stale value would have to come from state the driver didn't write 
(e.g. BIOS) but I reckon clearing it first is harmless. You can post it 
on top of v2 where I plan to drop the HAS_EMP_AS_SDP_TL check, as Ville 
suggested.

==
Chaitanya

> Thanks,
> Xiao

