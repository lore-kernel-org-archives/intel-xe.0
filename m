Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F2CC61DC6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05E610F00B;
	Thu, 27 Aug 2026 12:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTL1KV+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14AC10F00B
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787835027; x=1819371027;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4bjguaQtdiGj1L1KfbkYqyCKOVlrQx5WFmBRhmcXUHo=;
 b=aTL1KV+lfGmnYPKFxgOePviHBXCqdCen1nlfFSttO+PG4NEKQcZfSpFf
 BXJGQQECoTV5Fja3JGNUgywKnNaAkPxJFkn//Spwg/+afk9O6XlCj5Fx0
 AUtm8qBCYh5AI+LyR3RB/Jtp0nSEc5+636U+Nhnb2GfuVx6mtLcXjxffd
 26WU/ad3rYKscqCLvQjiW4Va4U23ggnOnFNjsca+FnR/lFBFvUy/9Mgub
 ejKXSbCuBqZ1Y5jWkRe93NMTmemMywegmjZwK9fMfV0ocgDkvplBjBFdI
 PZf47Ep3UVAbhiXKRM6CS8Pqa79dbexH9Ut1bxSGdgvuUeMxKdfhSqXLf A==;
X-CSE-ConnectionGUID: G8OU0IO3SpiQXvPqB8MJLg==
X-CSE-MsgGUID: wWH39YbWSGaq480+m1Jh0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105708632"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="105708632"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:50:27 -0700
X-CSE-ConnectionGUID: mOmvMwLBSq20Y5DBCgag0Q==
X-CSE-MsgGUID: zhdMh9XLROCh+wE3KI4ZmA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:50:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 05:50:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 05:50:25 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 05:50:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLb1lvDPMeLNUXm1S9VokiWwAaZxwXn86AV82VqxSZuWtv0oxDWrIQDNvhA8m+6zFHobUrQihfZHwSEPpoECdcIeWl7MSlk36oXyKySvJOYk3H1hLqMQTBRvEMYVgOsL0ZPGwdoB+u46VPbE9P8B+NxkX1Fi0oNRyOiNd6zKy/OiQwZIPGGzG4TbGebKcCqZipGoZyjMcODiD3m7WOCcHrFKmUE9v88PB7DTlICTyboooIOh2NovEHBkhc3+7W+Yz87tnsWry+A/wEOkZPpNEgH5+/oV0pVIRIGIhLup7SDwSwItWTZttsVPdkQJooRwhNZ55xtnI8A+rPTNM8zAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=runlvA89Nj5MskP/0Jli57qNBpAqCakTEdZ2iNjh+Tk=;
 b=KL7F3SNnzdo4mWumK76zc3ENvVS2Nz7Cy01NIkcoAeD3v1QkzhpWQqoBtEVrg80Jh9GNBo9p/Yj3+xwIMH84dh83effRp9VQx/Cui0W5kEVLDfFYhSlrdP3NQATJX4PXuoJw3n8Z7Gc4oIdklXq9uY39oLuYXu3V1G2emhdLWMbocHicufOjxsDNfWRhFb5YCMJV6FXxZzdcrnweXFS8CyGhKJjWSMcTTU9dAI3glAHh3RtlUPgJqO1peXZNppNe3rFTthhfStQYo9DV5Ltsr8U49fpcfyK/An02enhiaH4d+wgbFvBRqM8BKPNIcXckhznPoTqx6dW2FXFvEGiObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS3PR11MB9865.namprd11.prod.outlook.com (2603:10b6:8:366::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 12:50:23 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 12:50:22 +0000
Message-ID: <1b5b9d19-75bf-4c7c-86da-d7f8434f4695@intel.com>
Date: Thu, 27 Aug 2026 18:20:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/xe/sysctrl: Improve firmware response error
 logging
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-14-mallesh.koujalagi@intel.com>
 <d24a07b8-3977-40d8-a7ca-35eeed9c6f9b@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <d24a07b8-3977-40d8-a7ca-35eeed9c6f9b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0214.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS3PR11MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: 380602ad-e1f7-4e31-1ecc-08df0439c1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9hvpHYldf0WmIiTzsDQPlykmdcb2GJNNCgxS6TZ1QAr4x+whN6OxanW2VHmPIMsI50hZd8Z+2EexsN38Oej4fYDOEXVJ+dB8SzCtQMCLfSa3BWC7bXjralwm3GJyYYmkGQZwXNo4ueQQrPVpm/1KRj7QH06rwTGqIxlnQsQcfha428AipNHxMPAzZGd2fNSqmbCFm9rpKs5T1T//lXXnRXyZPcNClEs/i59DwFCvswPitwdbUdL4aNhq3dSyz7HEfwISY90f+ypbVtvkacMdCYrghQx2N4IisLiBCZjNg7wlBwvmPR92oF/1+QVRgi1BqqoSP5BJjpChcbPasZZnpHAh77RldvuKbetGGpcrhW+lF4UvExr4pRLIlOMbunxNVSR6qwZl4J633F9MwgT3ZRJyAof3UpxGm2sQ+iFokzCyt8kwiolKw/1ra2ygziVwEcZzGkISR82zeGBkI65Qq5pGSy6eZqFgUIf8qWzuEdCUsVvDbeQ1CNOyZ9VJCoPjv4E47zFloXIJ4ZmfgjTYGuLlkBGpC+sKtOWrL3zR4BUEMv2gTfznBZ8peP/M5fThE3YNi/k6XGuDht0iQaeqRD0PLV9buXa3+BfX91CNjgy/SqgAgL1zoM1gpy8Fi/O9ORMxfMn5nC2p8M/bik8fqhaD5ajvN1udnNqxgtWOLz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0JIWVlHTUZpbnJ0aXZqRFdHeUZPZ3Fya3Fwb3IydGh6MEVUNXU2aE1pZ1Z2?=
 =?utf-8?B?ZWdzUmJOaEkzeWFlbUZyTFVEUUJkOEpyb0RMWWtET3FIRWVCMFNBWEtoWHpj?=
 =?utf-8?B?VzAzZEtuUFcrV3NKQlVDZXJlV01qVzlIb09KbXI5bFgxdDZydCs5Nzh6RnNw?=
 =?utf-8?B?dUl0RCtqeWdkNHFxaEdRdjNUbGJleVY1QStKOW1PM2QyWXI2VUdETkk0TmN1?=
 =?utf-8?B?cDRRVElJY21mYWRXSlFLOE5BTmppV3cwdDU4aFFKWDNkTTNPNjVRUGcyVy9p?=
 =?utf-8?B?MDBPYkVOQm0xYjBWSHBmWUdIclUvbEdmOFNmaDZFMTRJaEZzOExjUDc5NFIz?=
 =?utf-8?B?V2dtV0hZaFhSalRlNFpqeTlCQnFzbmNpcFdaZzhZVlI2cGJKU2FIY3NqcjRv?=
 =?utf-8?B?c0F5MGV2MW5GL2RReG4vTm1TbUFpenRyNUlGRWdoWm9oRmgwSFhnS1RKN3N6?=
 =?utf-8?B?NFpXOU8xdUhuQ3hLUExpTXFWOTVKUDh1dlVSVUhNdEJrYWYvWW43K24rNmsr?=
 =?utf-8?B?b2FYNzg5YmNrUW9PeTdyUnZtZkIvZDM3R2tya0FHKzZld3I4THhFTE1lZzB1?=
 =?utf-8?B?L0daVHFPVDNOL2pzVWVxcGJUN1JmSGRBZjdDRHl4QVVXMzc5ZFB1Wno5MWlz?=
 =?utf-8?B?MUdsZS9ycUxiTHZXc21QSVpIWUQrclN5ZVI2SnJNdSt2UzloZW5BaHZUTnhs?=
 =?utf-8?B?TVYxZS9PSURrKzZOSFBNWU8xRHBjTGl6cjZCeFBJQ3dEaXFUMG5seUNZZ0d0?=
 =?utf-8?B?azIzaUNwNlBNV3VNMGg3cThLeXpKWlMxK1B1VDhoaTJ1a0hxWlJkS2hjc3BR?=
 =?utf-8?B?QVFnUmFnSjZSWitMbW5PdVNkejFHc3pHRzI5cjVEMy9uSkFtZzJLTVpNWXAr?=
 =?utf-8?B?QXRJM0hhTzFNZ0k3SWpKaGtBOENZOEhhdDdYUktGRWFvcVZLNWFjWUp4UlIv?=
 =?utf-8?B?d3ZYMC9SUm4rZ1RJNlJ6SXVFYVNjbDJCQVhmMkFXR01lVitSQXZ2eGl1dE82?=
 =?utf-8?B?NTBDbGdsM2plRXY5K0RMY1RJMXpLVDRMY3RndGVJYnBmZjZYUHRiYVpmSzhm?=
 =?utf-8?B?SEt2WXdRZlN3U25OUnNDVkdobFh3WFNUTHRaSEQ1SmwwM2MwTit4ay9aOUpU?=
 =?utf-8?B?c3ZGMEc0OUN5TW1wZFVXbGt3UGRJMGdXOUtNSUtCbjJ6bHp4T1Z6TlJJTHhH?=
 =?utf-8?B?RkFzeDhSTnFyaWYzR2x2RGM3VEVNV0MzamtMOG03Q3dObkF6U1JYcjZDdExL?=
 =?utf-8?B?S2dTR3pnNHdiZmVVK1BNcktLS2gvNTY0dTBKdTl1a3hBeldWZkVxaCszdTBk?=
 =?utf-8?B?czdWay81bU9PSDAzZVBGS1NHVTUwYnc4MDV0UVVxUlVDKzBSU1NUbzJzekQw?=
 =?utf-8?B?UVNVMm1vSmVkUEc0K01kVGVLbGJsZXBtU0t4Z0lhcWMyZ3VDRS9icGh0RDdG?=
 =?utf-8?B?cE9jM3pWZGRYUmlnQlorNTR0bVF3T244SDN6L0oweTdoK2xpMzJWYXF0M1VO?=
 =?utf-8?B?SEltUXN6elFvUFNjaE0yUlZmN0U0dFhkOFlxNU5TcUMzL2U1V2pSZU85aVFP?=
 =?utf-8?B?QmVLSzhkY0hDTmtYaG9Zenpqdll1YWw4VmkyeHFYVjU1T0Q2YS90SW5GMVVq?=
 =?utf-8?B?SGQyWmtqeHBmOFF0cUpwQ1Zad3pkREFMTTNuZ3lCZTBRM1hPc1FVN3VWZXU1?=
 =?utf-8?B?MjNNWitsVXlZZThqU0NrdTIvOUROZmt6NjZ6cDdocWM2NFV3VmVYbFVJVzJV?=
 =?utf-8?B?a1N1TlFRY0l2R2dHVE8xa2JjclhQQThQdmtKSUsyZXBJS1pQUSsxV0VtTU5P?=
 =?utf-8?B?MUZQMTQvbDV5aitEL0dZR2ovVFlUaExrczZENlA0WEIvVS9yMStma2MvQkcr?=
 =?utf-8?B?UXdXLzNOWTJvMkc1TFk0TG55UCt3WDlaODFjTUJpcEVmT0FzUzVJd3htNDdo?=
 =?utf-8?B?dlowb0NxRzFXYThjUUFZZ2xxOGREWXpsam80ZXVCek5Gd3pOU3haRDUzOFQy?=
 =?utf-8?B?RmNUU1hJWGUwcmNOc042RE55NjBHUlZzQ01GSTkvODRQWGkvVEtueDhNWncr?=
 =?utf-8?B?UmFrWWw2eFhTdEZFTkM2dUI2aWJGZFNjY0VxUkRUTm12cnhiYWcycWQ5SFpl?=
 =?utf-8?B?VVd4ZWlaWnZINTV3U0pQZEhpNFMrT0lZUVZuSWVSa1U2cTBnQkJXM2ZUNW45?=
 =?utf-8?B?cGsyS1lpdSt4T2lrRi94Y1hKeUVrRk9uRmZGT25WdS94d2RJME93NXQ1Z083?=
 =?utf-8?B?blpOS3JnR1I5dUk5UTVXcnU1UENCVjNiMDF0cDNteHc3a1o0Nk1yc3FSMjJV?=
 =?utf-8?B?ZVdEdDlUV29COEVSTDlZVGZkZFVRa3BNcDE0ZGVZUU53U1lqUmVTWlFCcDgy?=
 =?utf-8?Q?XmYcLZdOMJlgDwRI=3D?=
X-Exchange-RoutingPolicyChecked: sIuvCGF7Ts3yDxXWKuXWfS9c8qkUxhGg/73o0RehM+mRV+xo2+gqUk22agOzOIrr3Ya6xsExBlkuFbSyQmkcuoCxnbYE3IPTyH0cd/sl5e376x+m3XxLvMcjMuU45v7lePA16cziemswd9z3RAxbR30HePNkcCkq7sDeH0Yq9U/sQ4NsxdN9MZGuChAnx1t0e1Ec3cHQN/C9yLPMbVan0gj2SZObZHGgAv5z+iL0xae+I55Mr8a+Tak+xRjaptoFIxWMVrIcHGQYTmFgpubecBjA1VVp8Qsw+w4njdAWxIdSSfziNvF4a+1HFBvF/hDWmji9SuYyIyuRV5jAC4TXfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 380602ad-e1f7-4e31-1ecc-08df0439c1e2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 12:50:22.6581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVmppP/5G4q/rLJ3X/m74fbZGhpNtio3zLqBp6wxVznx1Iba+HhfKzVCAKwNNZhqf3tBkSUsA/ysOqWrgzwXryMfhq8DMEZqyFvIO2kwyGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9865
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


On 27-08-2026 04:27 pm, Michal Wajdeczko wrote:
>
> On 8/25/2026 1:05 PM, Mallesh Koujalagi wrote:
>> Use xe_log_err() helper and include additional details when a
>> response header mismatch occurs.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v5:
>> - Use %#x after REG_FIELD_GET change. (Michal)
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index f8b518dcafa2..5032d766b314 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>   } __packed;
>>   
>>   #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>   
>>   #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>   
>>   #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>   
>>   #define XE_SYSCTRL_HDR_RESULT(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>> +	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> this should be mentioned in this commit message
>
> nit: or maybe above changes should be done in its own patch?
Sure! will make different patch for that.
>
>>   
>>   static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>   				  unsigned int timeout_ms)
>> @@ -237,13 +237,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>>   	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>>   	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>>   	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>> -		xe_err(xe, "sysctrl: Response header mismatch\n");
>> +		xe_log_err(xe, SYSCTRL, -EPROTO,
>> +			   "Response header mismatch: got group=%#x cmd=%#x is_resp=%u, expected group=%#x cmd=%#x\n",
>> +			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
>> +			   XE_SYSCTRL_HDR_IS_RESPONSE(hdr),
>> +			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
> nit: as admin may not know what is "group" "cmd" "resp"
> maybe we can just log raw hdr value?
>
> 	"Response header mismatch: %#x\n", hdr

"Response header mismatch: got=%#x expected=%#x\n", 
le32_to_cpu(hdr->data), le32_to_cpu(req->data)); please let me know, is 
this fine?

Thanks,

-/Mallesh

>>   		return -EPROTO;
>>   	}
>>   
>>   	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>> -		       XE_SYSCTRL_HDR_RESULT(hdr));
>> +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
>> +			   XE_SYSCTRL_HDR_RESULT(hdr));
>>   		return -EIO;
>>   	}
>>   
