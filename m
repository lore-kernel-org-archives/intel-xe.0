Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21002C369C2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 23:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD16810E1A9;
	Thu, 17 Apr 2025 23:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUehhEoZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AED110E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 23:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744932324; x=1776468324;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+kgztkkWQamoDFOwq+JmjG077Ioo/RTwBRx5KEbVZIM=;
 b=VUehhEoZdSSsBMTqk2f+JmnZh8R7yMFm5B4iUibXkjyQHsuRrN++Vp5i
 MNwzH7DQfjoL8OqR521K0T5KwpVipk6IpKV2G5pQhtVES9eOdyl+HinW1
 lJAUb1IjroVJSbYP29ycX2VCDxFEZ+hUal8h3vGVuqI9Vz7P1E/sVlfMk
 ZuIMq8dCZs+Mqy2lEA0rxguavwG7Yi7OXJz5Gs8R2NiLeTaJeZGoU/iUT
 uVZ3xa0sLrthKeBkUcKoTbqCdrPzOCKszL/1mRXKCfw8z+RTzi6BmqXbD
 vAFOu3eSv+u0z4xK/rAm4Ap2vi6Mkhy7R7DTIjrMEidAsygFHZuFchJCz w==;
X-CSE-ConnectionGUID: Of1stJviTySIaphIAkJufg==
X-CSE-MsgGUID: mJ9PRjbESISH6d87aSJqUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57201626"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="57201626"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 16:25:19 -0700
X-CSE-ConnectionGUID: NHDuWiuIQEq1Gc9A0qq8Ag==
X-CSE-MsgGUID: oz/fQqymR06gFBYHNeHFmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="136136000"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 16:25:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 16:25:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 16:25:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 16:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3ShKeGQfTDu3AT7ez9ge4bsTMyiRxUwtNweAp7kqSRJGHV1Hj7ElCggKoINBCyzRlrXiD3FomRYmHLQsPQaeIjnYev6EX7N9qp7ju2WOLkuleT+ud2Q/RRBwTlrr9v2aSJ16Hpz9468RTI0Slw4AtjyfnzdrmHCruapFhxAEXvxDFfzLd1lP2eszCKRXB4bb1ZxYKDCuWkdKMWdZoyIK9JHwxV7uJ+wD6yN2oaG61J3DmefrYEg47+NqK6anMNHv7mRyH0WBW/ahE/xdW+bZIw42P5IQQB61eROOkfKqjhn5oHpXlOjT57wip0YEWytSky/ZqxoqCipvZgWyAiYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aiube32d9fMoH6vNEV86vkV4bX3aAoH6UIsuGss/1Tw=;
 b=Jia8E0UC3LhZ8mN71AaaoNGmGpDRn53P1zzn9O/0J+9Q97IHUqVCPV3NIWDVShUS31JbcYSbuPx5mYcqLr72brMZ9UYyCPLcb8WLGKG0OfEaKd+Fd2wYmh6byHKHYYIFqzYO+Ohquzd96KCMZkmD88+4Ln2MrtOdEefeQghzpwh4mCW7SDycJ15Bbzq+5nOWX6hxfoSIEMxCxohgnP5z1knJI8Myb9ruvnayYv2KSWbqrI+dTHol+anPqXafl7CkAAE3LtdW9az/guad4cHrqfqs0uW+YCdnP2LoYXTKxwOiX0ZCbXCA3AEjfQXvSl6dGpU6UAY4mYRAmT4WSro+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 23:25:15 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%5]) with mapi id 15.20.8655.025; Thu, 17 Apr 2025
 23:25:14 +0000
Message-ID: <926c850c-0507-4a66-9e25-e1b38f73354d@intel.com>
Date: Fri, 18 Apr 2025 01:25:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250415222030.3616494-1-tomasz.lis@intel.com>
 <20250415222030.3616494-5-tomasz.lis@intel.com>
 <1b69feb6-eb36-4eac-bbde-0bfef7d22f1b@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <1b69feb6-eb36-4eac-bbde-0bfef7d22f1b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::6) To PH8PR11MB6707.namprd11.prod.outlook.com
 (2603:10b6:510:1c6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SA2PR11MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: b16b38d2-7402-410b-d6af-08dd7e071b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWxScU9uallqekNWVTdkanhKUHJEMUtSVFRjenhSLy8veUlaMTJqYjRlZDUr?=
 =?utf-8?B?a1BwMHBKaDJTYklOdmF6ZlQ1L29Fb0kyVzZ1RGQxK3F2a1UzMXExU2sxb1Vp?=
 =?utf-8?B?d3Q3SU1RcklhZTUvSFMyT3NvRVU3YkJkTkFzTWhlaVhvZ1lSL3F4MGVSYmNS?=
 =?utf-8?B?RDR5U2t6WGw2dWhNYlJoTUs4Wmp5ckNJK1JUS256RUNtcVZkU3FtcUZ1TDhD?=
 =?utf-8?B?bk8yRE1HYkNhMFlnT1ZHTTVWVWkxVkg2clRFQk5ZQldYckhhVFNvY3BoNWFT?=
 =?utf-8?B?b3NvUWhucVFmazI0bDdURmVRTE9wbTFuNzFFdW9CQU5XTzZYakVLMFFXM3B3?=
 =?utf-8?B?WkdsS3VsTzh5TEZrUEJ4M2RnSXpGR3BpT1gvYlpqaFdTR0J2UTB4K3JQMmJo?=
 =?utf-8?B?NjNrMWw2MlpBQ25oaXhYM0NNZzFLV0tDZ2xkRm9YMVpEMlAvK3NMMFdyUGJP?=
 =?utf-8?B?WjdBRGE2S0daeXB0bytZZ09tVEdWU3JQaWhWQ1RMWFVXaWgrbFc3VWhUS0Fa?=
 =?utf-8?B?WlczMVY1YmZDZVZhQ1g3K1ltWHZtUElseHl5Wm9kKzgvTVBxaC8yWWJRSUR2?=
 =?utf-8?B?VHlueUVpUHloUEZMdTZFNzVVRU0zMWJJS2cvS0RwU2ViQUJFS3RJSDM2ZUFS?=
 =?utf-8?B?QVQrSXdYYkNhVjZjcTFLa2Z2VWFOMFZhS0NzampxS0Rvdzd3TWNjMUkxTk85?=
 =?utf-8?B?S01NcThmaG5DU2NDcjg1TEtuZ3ZHUnlJMk94TFY5cjkyQjFNNTBmeGZROVFs?=
 =?utf-8?B?RS9Dei9YMkhTZll6ZzFCWXZSUEtwb0IyQ3N4b0luQ0RCdWtqQkF0cDNsa0pi?=
 =?utf-8?B?R2thTnRUcytIVGpGbVpWc0pMSVEwR3JMeWtjZ05vUGY2ODVSaTJGaGNFMWV2?=
 =?utf-8?B?c2VWZnRiSFlkUHB5eGFBUk9wV0QyZ3NKb1EzZG1SbjdsNFpLb2pCdFdNL2Jy?=
 =?utf-8?B?bzVwU3hqWWwvRU1IRzVXTW5CWjBGK1FkSTU3YkZhOVdXdzRzbU54UWtXRW1G?=
 =?utf-8?B?emNPT3MvYzdBL1R2cGxxekFFZVRCZW4rOWFtdzZ1VTdRZldIQ1Yxem13OEl3?=
 =?utf-8?B?NE8zZjJteFRXOUFqdGx4WWNaNzN6c3VjZk1OTVpvUnhpdWlMVVpRbzJRS3FU?=
 =?utf-8?B?Qm16RXVqSXMyMHhBOTh2dG8xb1B2QitPc0ZvbU1MTjhXNnFsLy9pb3lhdTBq?=
 =?utf-8?B?Z2ZEL3dlQjNkR20xS3RNRTVKazZ3UU5SRWtXR2JvQVdDZ0hZZnpFTFhOY21X?=
 =?utf-8?B?VW9CK1MzSlU4RVBoaVlBTm02Y3k2WnlkcEkwZVRSOEJrUXJ2NXI3b0RiK1JY?=
 =?utf-8?B?VlVXeDNhR0N4aDkrcUI5V200dTFxalRPanZpbXR6MUt3andlLys1V3ZZdzlN?=
 =?utf-8?B?YkxoSEFQZ0hHQUxRQjFHOXhoNVc3VnhwZWRJOUIwRHNXWHVrOXRVWVpsRFNM?=
 =?utf-8?B?eDYwNHJ4OERSdFcza2swdldoUWxOcUkrTitXSGhFVkFtcjJqZmZzeEpnZzlr?=
 =?utf-8?B?VGxCbXBsd09EVWNqNTJrOXJYOFpydld6M3VWVFJLM2RsdnQraWN4OE9KMDVC?=
 =?utf-8?B?L3BWOGRrQWJ6ckRQUkV5enlPODFNQzY1U3U1LytJWU1ZeWJxWjhJM0Z1azVN?=
 =?utf-8?B?dm9GZnpjcFEvYTNjSmRGa3Z5K3lOZ1dGWHJKNEFFSnNrNU1Nb2k1b0l2Znpi?=
 =?utf-8?B?b2VCR0FxanpiMHhIVWRyRGhCRThScjZyRk1Oc3pxclFadDZqRzI2K3pFTkU2?=
 =?utf-8?B?cXQ4ZzEzOEhkanZpMnJVcHRZNnk0ZFNZQmJMVW1hcHBXcFU3ZUtzckRtZnJD?=
 =?utf-8?B?blNkZ0RsbmpVUGtZTnBnKzk4TkVaamNESEpUQWpYeFdNWkkzalJmeGpNVTRY?=
 =?utf-8?B?STd1U01ITHV0d3N2WHJHUC82b3dwODc3Y1ZDNUhDUm1keHZHeUpPcnkvOCti?=
 =?utf-8?Q?eZSTXG+rcMM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3k2YnZncHVUbk5iT0FNaGNWbXM3WkQ4K2V3dnI3UUg0SW4rZStkZHdZWlEw?=
 =?utf-8?B?NU1OdElCMjNxU3NVcEpRZEcwUmM3U3dBZWJOUFRXeEZSMGxEMCs5NWxNUXpq?=
 =?utf-8?B?QTVtSFVmMm5kTmpMQzFJUlZqY2dnS3RaallSTWhsWlhyRkFXajhxUUNZK28w?=
 =?utf-8?B?S3E0ck5NMWZYK0VrUkRZOTVjNG80a2FKYlc1dGpBZ0M0QjdhWUV2QUZrektj?=
 =?utf-8?B?cG4zQVlxMmVCTUJESVdFNXVCVzBvUjVBN0lWMkRoSXVMLzBnYndLN2VweTZ5?=
 =?utf-8?B?L2lzOC9FajdyTGV5S2xCUnhHdWtVTC9IbVMwNURUSDRMeEhVTGlqeTAyL3c4?=
 =?utf-8?B?LytIaDhVOTg1amtxKys1S0dpYmxKcGNVSG1zVVBxdDNRTUl6RnNBazVyWDdk?=
 =?utf-8?B?bEsvcUxiWTgxVE1DODNjZjBSYXdPYWdNMnpWYlUrYTVzMXhybktGNjVRdzMz?=
 =?utf-8?B?ODdLWjVmdTVDcS83a2tla2cwUERSYVdwdjQvNGRvV1pDdG4vVkZxTW44N1Bz?=
 =?utf-8?B?aTI4VVBzakxkdXBtNVk3ZWZkTk1uOXhYcjBKd0FkVmFHdE85YkZVMVAzcVdX?=
 =?utf-8?B?eDVDUFgyTyt4Zm5ySmN0NmppR25MOU45YWxPL0lwd1AwYmdoK1pmYU1pUVBn?=
 =?utf-8?B?d0dNZG9CMC8yODJWVFoxb2d2STQ1Z2pqcFN2aXpXZnZJSlU2MHdGVCtZUCtK?=
 =?utf-8?B?ZXNjTHJVSGxXajEzZ2pxWHNYYTc2K2JlZGRBMnNaaGRSaGQ0YWFXYVZvWTNM?=
 =?utf-8?B?TnBIQUFDTTl3a3hvRTJYM3F1RUZtU3JCL1ZYNUxLdlJIaUZUWHdkQS95REVp?=
 =?utf-8?B?ajNpSkFBTWZDbzFYT0ZkVHFVUFJ0Sks3UStGZFdjeHVWa3hMZGlMOUhGb1pZ?=
 =?utf-8?B?WHlRNkhTNjhOYUFOQlZrWjhkUy9xYkhMcGxhcUVDWkFuUm8wUG16b1lEdWd6?=
 =?utf-8?B?dWEwd3gvRE9seXhTOWNjOEttQ1BkbXhnV0hDYWZOM3VsRVk2aVFnNGI2OVFz?=
 =?utf-8?B?b3VpRmd5d25zMWp4M0tNT0FHeWY0V0tEQ2xOSWVBOEsyT1FUck1MbXdIVVRr?=
 =?utf-8?B?eWsrSVVOb0tNbG5udm1yMXE3N0JVV1IwNXlycXZKWFJaVWtQMXpMVjY2ZVZx?=
 =?utf-8?B?a1A4ZEhTNFl6Y001N0c2RytNTS9YUWxrQ29lK09SNkkvSG4rUThyMzVqNXFH?=
 =?utf-8?B?NVYwNFlRdm84NTdUK2xldkJpYmVTVGpjTzc0MktpcUh5MjZRNmYyWHAvYTgy?=
 =?utf-8?B?M3pSU0lna1ZwZ21LV2ZycVpBNUYydU5UMjZ1N3IzREJoL1ppWUIrZy9aNzli?=
 =?utf-8?B?RzRLekkrNUFLd200cFZIZDdkMzBJRFlvVmZlZytkZGhDNzdnUkQrR1ZrQU5L?=
 =?utf-8?B?VThnN1krcHJOSHBsMU8yY0NOUzNUTk1zTmN0TzQzK215YUR3bHZKeVhYb2dt?=
 =?utf-8?B?ampFRWhVeU55NHdaMjFGSzY2MHBzMExFbkpLVENNb3prVXhTeWxERHFzS2Fa?=
 =?utf-8?B?RFB1Zi8wTkpIT2VaRXVmd0E5ZjRiM0RKS0VLdDhqREVaOFhmeWM5aUZKc1Bp?=
 =?utf-8?B?UkR4WjFFWC96dHl4eUlvTzZ4ZUNXY1ZkTmF2S3Q3U3cwUFQxSkVFcFVLeWhw?=
 =?utf-8?B?bFRJQVpMMkZoVlZGdjVYajRvS2NtZVlRTnErTGJIMmhhS1V3NmlIUnZoRkI4?=
 =?utf-8?B?eGs0SFZzNmUrREFGdm1QRmw2N1ExcEFNN09mNTBIMi9yL2Z0WitoTnNSY1o3?=
 =?utf-8?B?K2J5ajRyREtxemxXbGFOd1dpNnFHMTJGTTJFdEF2NldidzdWeVlLNHpoa0xw?=
 =?utf-8?B?dmZzNXV2UjgxZFZtUEM0SXMvZzg2bHlPM0FaZ2MzblVGVVhQcVpnYWg3U3l2?=
 =?utf-8?B?ZEdaeW10Zkd3S3ZqdEN2SHZ6aWhzVCtJaitncnlidWMxTHovM0JWSi9VN0M3?=
 =?utf-8?B?d3BORlV1TUxlakVGcmhpSVB5eU42QVJVbDMzWDZFTHgwa25pSWdGYkpNN3lQ?=
 =?utf-8?B?Q0o0U3BXbXFTYkJkaDlDRXNaRXNXWXdkMkhGMXVyK2M1TnQ3NjNpL1RJMG5Q?=
 =?utf-8?B?U1BuT2Faa3hyeklMeW5mQlpOYkUxdUJRUk5TMldEVW8xTWY2QzQrK09LNnFL?=
 =?utf-8?Q?PWgEVHGXB2g+sKN9djVdLfdkD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b16b38d2-7402-410b-d6af-08dd7e071b14
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 23:25:14.8679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73eSMWMTiDW2gPZW5NQu/e26nFM9J9EWIrrL90ZqJMPOl/mk9SUFJ55ruNykRqorcUJt5ptahHj3VsyaEEE3Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
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


On 17.04.2025 21:06, Michal Wajdeczko wrote:
>
> On 16.04.2025 00:20, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it is necessary to update
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barrier taken remains GGTT address lock - which is ok,
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
>>
>> The GGTT address locking will be introduced in a future series.
>>
>> v2: removed storing shift as that's now done in VMA nodes patch;
>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>> v3: removed inline keywords, enums for offsets in CTB messages,
>>    less error messages, if return unused then made functs void (Michal)
>> v4: update the cached head before starting fixups
>> v5: removed/updated comments, wrapped lines, converted assert into
>>    error, enums for offsets to separate patch, reused xe_map_rd
>> v6: define xe_map_*_array() macros, support CTB wrap which divides
>>    a message, updated comments, moved one function to an earlier patch
>> v7: renamed few functions, wider use on previously introduced helper,
>>    separate cases in parsing messges, documented a static funct
>> v8: Introduced more helpers, fixed coding style mistakes
>> v9: Move xe_map*() functs to macros, add asserts, add debug print
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c   | 172 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>>   drivers/gpu/drm/xe/xe_map.h      |  18 ++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c |  18 ++++
>>   4 files changed, 210 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 0a4fef7d7225..b0fd05550af8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -25,6 +25,7 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_sriov_pf_control.h"
>>   #include "xe_gt_sriov_pf_monitor.h"
>> +#include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_log.h"
>> @@ -84,6 +85,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1623,6 +1626,175 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +static void xe_fixup_u64_in_cmds(struct xe_device *xe, struct iosys_map *cmds,
>> +				 u32 size, u32 idx, s64 shift)
>> +{
>> +	u32 hi, lo;
>> +	u64 offset;
>> +
>> +	lo = xe_map_rd_ring_u32(xe, cmds, idx, size);
>> +	hi = xe_map_rd_ring_u32(xe, cmds, idx + 1, size);
>> +	offset = make_u64(hi, lo);
>> +	offset += shift;
>> +	lo = lower_32_bits(offset);
>> +	hi = upper_32_bits(offset);
>> +	xe_map_wr_ring_u32(xe, cmds, idx, size, lo);
>> +	xe_map_wr_ring_u32(xe, cmds, idx + 1, size, hi);
>> +}
>> +
>> +/*
>> + * Shift any GGTT addresses within a single message left within CTB from
>> + * before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
>> + * @shift: the address shift to be added to each GGTT reference
>> + */
>> +static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
>> +				     struct iosys_map *cmds, u32 head,
>> +				     u32 len, u32 size, s64 shift)
>> +{
>> +	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
>> +	u32 action, i, n;
>> +
>> +	xe_gt_assert(gt, len >= GUC_HXG_MSG_MIN_LEN);
>> +
>> +	msg[0] = xe_map_rd_ring_u32(xe, cmds, head, size);
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +
>> +	xe_gt_sriov_dbg_verbose(gt, "fixing H2G %#x\n", action);
>> +
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
>> +		xe_gt_assert(gt, len >= XE_GUC_REGISTER_CONTEXT_MSG_LEN);
> I'm not sure assert is a good choice here, as this is different check
> than above where GUC_HXG_MSG_MIN_LEN is used to verify your code only
>
> here you are fixing specific action written to CTB and at this point you
> must be sure that 'len' is actually equal to MSG_LEN as only then you
> could be sure CTB is not broken and there is whole message available and
> you can continue with fixups at those offsets
>
> if you would read my comments for rev9 more carefully then you would
> notice that I was saying about 'missing check' not 'missing assert'

Only the KMD is writing the messages to that buffer. If messages are 
invalid, then either ctb writer de-synced from our parser, or 
LMEM/SYSMEM was restored incorrectly. Both situations justify an assert. 
Additionally, in place where we assert we already know that the message 
in CTB is something that does need fixups. In most cases the CTB parser 
issues wouldn't affect migration, as only two messages are affected, and 
these specific messages have below average use frequency. But in place 
of these asserts - we already know that we do have one of those 
problematic messages.

Well.. this is a simplistic view, as it leaves out consideration of 
concurrency. The bad message could be also an effect of concurrency 
issues within KMD, if it turns out our locking isn't perfect. Also there 
is that improbable but not impossible situation where GuC is still 
running during recovery (due to double migration), so both head and tail 
may change, before and after we've copied them.. in these cases the CTB 
fixups should just be skipped, maybe with a warning.

ok, will change.

>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
>> +		break;
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>> +		xe_gt_assert(gt, len >= XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN);
> this needs to be more than assert
>
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				     shift);
>> +		xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
>> +				     shift);
>> +		n = xe_map_rd_ring_u32(xe, cmds, head +
>> +				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS, size);
>> +		xe_gt_assert(gt, len >= XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN + 2 * n);
> and here
>
>> +		for (i = 0; i < n; i++)
>> +			xe_fixup_u64_in_cmds(xe, cmds, size, head +
>> +					     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
>> +					     + 2 * i, shift);
> and maybe all fixups should be done *after* checking that the whole
> message is not truncated, so
>
> 	// check min size (to make sure DATA10 is there)
> 	// read DATA_10_NUM_CTXS
> 	// check full size
> 	// fixups

That's true. For it to have any influence, the extremely rare case would 
have to occur. But yeah, that's how it should be done.

will fix.

>
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +/*
>> + * Apply fixups to the next outgoing CT message within given CTB
>> + * @ct: the &xe_guc_ct struct instance representing the target GuC
>> + * @h2g: the &guc_ctb struct instance of the target buffer
>> + * @shift: shift to be added to all GGTT addresses within the CTB
>> + * @mhead: pointer to an integer storing message start position; the
>> + *   position is changed to next message before this function return
>> + * @avail: size of the area available for parsing, that is length
>> + *   of all remaining messages stored within the CTB
>> + * Return: size of the area available for parsing after one message
>> + *   has been parsed, that is length remaining from the updated mhead
>> + */
>> +static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
>> +				   s64 shift, u32 *mhead, s32 avail)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 msg[GUC_HXG_MSG_MIN_LEN];
>> +	u32 size = h2g->info.size;
>> +	u32 head = *mhead;
>> +	u32 len;
>> +
>> +	xe_gt_assert(ct_to_gt(ct), avail >= (s32)GUC_CTB_MSG_MIN_LEN);
>> +
>> +	/* Read header */
>> +	msg[0] = xe_map_rd_ring_u32(xe, &h2g->cmds, head, size);
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
>> +	}
>> +
>> +	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
>> +	ct_fixup_ggtt_in_message(ct, &h2g->cmds, head, msg_len_to_hxg_len(len), size, shift);
>> +	*mhead = (head + msg_len_to_hxg_len(len)) % size;
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
>> + * @ct: pointer to CT struct of the target GuC
>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>> + *
>> + * Messages in GuC to Host CTB are owned by GuC and any fixups in them
>> + * are made by GuC. But content of the Host to GuC CTB is owned by the
>> + * KMD, so fixups to GGTT references in any pending messages need to be
>> + * applied here.
>> + * This function updates GGTT offsets in payloads of pending H2G CTB
>> + * messages (messages which were not consumed by GuC before the VF got
>> + * paused).
>> + */
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
>> +{
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	u32 head, tail, size;
>> +	s32 avail;
>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return;
>> +
>> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>> +	head = h2g->info.head;
>> +	tail = READ_ONCE(h2g->info.tail);
>> +	size = h2g->info.size;
>> +
>> +	if (unlikely(head > size))
>> +		goto corrupted;
>> +
>> +	if (unlikely(tail >= size))
>> +		goto corrupted;
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	xe_gt_assert(gt, avail >= 0);
>> +
>> +	while (avail > 0)
>> +		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &head, avail);
>> +
>> +	return;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
>> +		  head, tail, size);
>> +	h2g->info.broken = true;
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..5649bda82823 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
>> index f62e0c8b67ab..fa65e6c908fa 100644
>> --- a/drivers/gpu/drm/xe/xe_map.h
>> +++ b/drivers/gpu/drm/xe/xe_map.h
>> @@ -78,6 +78,24 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
>>   	iosys_map_wr(map__, offset__, type__, val__);			\
>>   })
>>   
>> +#define xe_map_rd_array(xe__, map__, index__, type__)			\
>> +	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
>> +
>> +#define xe_map_wr_array(xe__, map__, index__, type__, val__)		\
>> +	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
>> +
>> +#define xe_map_rd_array_u32(xe__, map__, index__)			\
>> +	xe_map_rd_array(xe__, map__, index__, u32)
>> +
>> +#define xe_map_wr_array_u32(xe__, map__, index__, val__)		\
>> +	xe_map_wr_array(xe__, map__, index__, u32, val__)
>> +
>> +#define xe_map_rd_ring_u32(xe__, map__, index__, size__)		\
>> +	xe_map_rd_array_u32(xe__, map__, (index__) % (size__))
>> +
>> +#define xe_map_wr_ring_u32(xe__, map__, index__, size__, val__)		\
>> +	xe_map_wr_array_u32(xe__, map__, (index__) % (size__), val__)
>> +
> nit: for simple line split no need to align \ to the far right
>
> instead
>
> 	#define xe_map_wr_ring_u32(...)				\
> 		xe_map_wr_array_u32(...)
>
> just
>
> 	#define xe_map_wr_ring_u32(...) \
> 		xe_map_wr_array_u32(...)

ok

-Tomasz

>>   #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
>>   	struct xe_device *__xe = xe__;					\
>>   	xe_device_assert_mem_access(__xe);				\
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index e70f1ceabbb3..2674fa948fda 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +
>> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>> +	}
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>> +	if (need_fixups)
>> +		vf_post_migration_fixup_ctb(xe);
>> +
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
