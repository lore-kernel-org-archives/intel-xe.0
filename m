Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970FC36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 14:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7FD10EBD3;
	Fri, 11 Apr 2025 14:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWBItCNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE8F10EBD3
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744382192; x=1775918192;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MB2uIv4Waq7SBlC8lBzjuZKEeTih+cBxYz2K4rLIGq8=;
 b=kWBItCNPV3UcPQBwJQSiYgJeIxrZ4vc4Z3t9frjQ58Uy/hwfi6+I6ZmK
 B8sauzT5CeRGlFJ6cIr7mUx0imGa35F05pNgXDj9Pzm3yrh4A4J2+fgXs
 EZbxWha2p1QqlPrWGrYayShAmAi5Rjpsc0WB2tVPxZC7ucorwWC4ZQZnJ
 g2s51eTI1RsrtnAHq2JD95FrNiTaMccWB5e32KI5TZosJ9DM358KJK1+j
 PCZkOhOwnQJD7QytA5DeZLyYwVwuKkPnajKRnY/iqKrcT/hbIpcfMvb40
 EaYJOjPicw7X57nRjjALq+KWJm/QYSBHFZoseRHCG4BzZakHmMEvA1IOr Q==;
X-CSE-ConnectionGUID: 3YgZzz7kQg6MdknfQt0AuQ==
X-CSE-MsgGUID: bZdVNoZAR5WadI0ohhM78g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="71323033"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="71323033"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:36:31 -0700
X-CSE-ConnectionGUID: 3cn+mtShSYGxgeh6Gee5Sw==
X-CSE-MsgGUID: 6Iv2nG/BRzCUXTSsfL5OgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="133319957"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:36:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 07:36:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 07:36:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 07:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKR57Z5fPnD46DaS/FQG/5JpF5hc7fRfuwXygF5mGTo878+zpsB4WRY5TOqL6GwfRes9tLKmOpaV0MZaxzzGyaICpBy8znOlgrnzE1UeSuqdS7Xc48d2wj5B7GJYCRMNa3twTir2VLV5Sl7rScHUtW8R6J7ckK1O950/nsb/rdoURcKQ7fX7WFWIt3uDV1OIIXG/6kiYSkbxwju+icr74T+gn6d2rYn8EjRJMsOL/AnWCie2mUR75qzQeOCTy9zCSYK/Z3lUl4TDAsVVL7V3tRFHY9L7df+YGbWduvma1rsdlXLH2u9yit4XvSU3x/4eeyllPNyGJ1vjuzpanUBiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAxzd8+sUlwhQ5A1SuZnclaAqkCUr0xfZEEy5vElg8I=;
 b=E7kMn/EGoTbmO5VmtKsTV14PwIqAoAozfR/QIt4gwKe6w0/MSaFkdQh2NZb/AuEXYf0mCxomS3yLZxoqJMfDEdin0IbZZUC8XUzWaad/2F1MjhLVLMdXFj2ur1M/8WMxvRY1AEgHO94uKcm4CsvGdajjwM+TGpdbKgByYb1o5zniiBYjWSbOFnBP8OD5OtQrA7sFYvNaK5F1WfJl1Hzb9q5bKktY7/EIBjHmhVsccWodFZHbYwLOGhOn/Ioy78rUTEqAcf9jj68ykYBB9DvF4qFvU4DLrXA9RnlqDKbTe17bEHJqKX7MMVoKamPVLZm6EqMceQaw99JB8iL9aYYhfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 14:35:47 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:35:46 +0000
Message-ID: <8de5029e-cffc-4973-9c62-ff3683d38c9a@intel.com>
Date: Fri, 11 Apr 2025 16:35:42 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v8 1/4] drm/xe/vf: Divide GGTT ballooning into allocation
 and insertion
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250409211340.3046931-1-tomasz.lis@intel.com>
 <20250409211340.3046931-2-tomasz.lis@intel.com>
 <9f2fd22b-a439-4e86-bb6e-9efe7944fe7f@intel.com>
Content-Language: en-US
In-Reply-To: <9f2fd22b-a439-4e86-bb6e-9efe7944fe7f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ad96b1-79ff-4cd4-5549-08dd790625c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGNLM05YRzBMR3g2NW1pV1d0Qk15STltNTE4SWlOUTk3QnhQcVFxNGFwQldw?=
 =?utf-8?B?dDUra0Y5dlcvL1J4T1ZEVlVwbkdnR0NWK1pJSGFLZ2E5WmFmVk5GM2hCWWxF?=
 =?utf-8?B?M1RleFFXYzRDcVIxWDRZUDBMT2lTTUpYSXRCdk5UZ054QVpDMlpxOERTSklP?=
 =?utf-8?B?TnpJZE9XU0trK3NGdCtFUi9VUmNEN0VXQVl5YWpXTVo0UlhybXhyK1dSS1Z0?=
 =?utf-8?B?UWhPRTU1Z0NuWWx0OHdBUjZFNVVLaDcrc1ZLclFlOWFqVk9EbUZIMmRkSk9t?=
 =?utf-8?B?UksrNGNJaU9aaThnTFhrZkNEZGp5V1Ywb3FqVWtMS1JoOVRkSmN3OTBqbysx?=
 =?utf-8?B?SEdXdUVVc1gra2tCSVArWkJLeGdwSEY5YUF1b3gzZEY0dlo2YkpMVXJxWE90?=
 =?utf-8?B?T0ZLaHM3MjFnbXdvaEFmazVFamtPdjcwNFk2TmJCWnloa3g0YkU4Yyt0TGZO?=
 =?utf-8?B?emcrQVRjcjFqZmw5TnNwSkZzSXpOWGI4YW00eXNJSDRSTXZqMWRpY1NkOHUz?=
 =?utf-8?B?QUM1WlkrT1NaV24vV0lYTUJXeVErbUhzU1F1c2hUaDVxUTNmdTVkQVhKc1dD?=
 =?utf-8?B?WVgzckxmWFNPUlA1d2hTZXl5SVh6V3kvYTZmTDZrbEZHS1o3S3lSbEZiUnlO?=
 =?utf-8?B?bmRrNERzTGRPQ3UrcXRHRVNTRlNmbXJ6b2JXV0UyUFAvZFJSMm1PZnVtTTZV?=
 =?utf-8?B?K0lYYnBzU2l0eXBwd1RLNDlnNW1BVHV1WGpwczQ4a2FaSnRPaGtJK3dFdjF2?=
 =?utf-8?B?Y210M3FLVFZ1bWErMi9ESGpnOGJrTUtMeHBYOHZDSHdvQ2VpYjZDOEtWMmQr?=
 =?utf-8?B?OEhvZ1VtajhkZWhBWGFBSlA3R3NsQkFoWHBnc3o2aE5LVUYrVXRhSlBENzYx?=
 =?utf-8?B?SGlHYlVhQ0JmeDhxYW94Y2pVcjlOTUNWZVpDZHZpbU5kejFJZVM1ZG02bzlD?=
 =?utf-8?B?L205TnYvV3VObWlTOEpvNTlwZy91M0FRYndTV0lYaVd4YkpKeUVqRXNHUFlu?=
 =?utf-8?B?amVWZGhBTk50cTh3YXBtVFlPV0t2SG80STVSTDNoalpHK2dMRThUM1kya1M3?=
 =?utf-8?B?VWRXMDUzcFF3M0FVeHg4bFVRN21KUGFWMGJSZFIyZUFyYWZHV3U2ejhpcjN6?=
 =?utf-8?B?K2duWEhFUmdpWGpiZXphRlpSUzlqWGZYVHZaWmxrRkRISjJmNlRiOENRM3Y3?=
 =?utf-8?B?MWhaNUlCMHF0VDNqZDFoRHlHTVlyS1lsTVpNNFlJTUVzS3VWU2hoWlRucTUz?=
 =?utf-8?B?NjVxZE5iUURrcW1vOFR1RnNnUEdpTSt4aFY1M1RyNitKQ2puM1daN24wZHk3?=
 =?utf-8?B?aEpDL1ZzK0YzTlhOVWd2a29TK1pFd2hFNk55cUF5b0dWa3JZc05XYTBaVzQ5?=
 =?utf-8?B?VCtsRUg1c3BFc2w3ajNWajMrTTdlNHIxVmZ6MWVLOWlrYnJ2bVl1UGhTU1ph?=
 =?utf-8?B?S0VPRzlvRCtoak10cUJrQ3lyS0loYWhWQTQzbEpJMzhJNEpQT0c2RWhMZG5K?=
 =?utf-8?B?VjdsMDJteTJoYzBIeDZZQy9hTU0zRy9MNGFybis1RExvUjc2RnJQZjVNbTRn?=
 =?utf-8?B?R2pjNDVVMm1WdmxDeFhMWFFZN0xUSytkbXVOQlNZV09ZN0RPc1h6ekhDajBB?=
 =?utf-8?B?b2xDaTJ2SnRCcG5GOHZQRHpHOWZONXpUTGpiamlORDMyQkg0UlN1QWJMQU5S?=
 =?utf-8?B?Z0V6NFVSdU9RbFFxRlZmNjFGVG0xRXgwMjdCQnptUXVtTVlNSE42ZjdwTlc3?=
 =?utf-8?B?Sk5QKzJmaGNWbklqSVhibHhPSmpUQlR1Wis1OHA4ZHp0L3FoQTBMQU5IdDBm?=
 =?utf-8?B?akhXRy9iUjhsRG5JZTZ2UHVnSFp0Qlp4NGdRRGVCN3JXOGwrYmNDaUM1aW5K?=
 =?utf-8?B?c3ZId1p5aHVDU2x3cSs1Tktra0JwTFBLaXdNQk9sNFVtdmozM1kwdUxReUt2?=
 =?utf-8?Q?fwW1HrVZaBQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hiQ1lGb2phL3JRQlJVQmkvT3hHUkhBTGVjbkQyVjk0QlQ1WXVkZUxyekZn?=
 =?utf-8?B?Q1J4THNRSmJDYnhXVzBiWitFRThVWFBjM1lMZFRyb21vYncwUFN1eDB4RHhV?=
 =?utf-8?B?enptS3ZrYUo1eFp3eXVZL0hxUm01d1RsRGVab2tnMnk3WmVZWnhvOGxsYWZF?=
 =?utf-8?B?UklwQmw3bUdmWVNvSUd2bXhveWtzMUxMbWpxNHNnNjlkakV6T3hNZzF1Ti9R?=
 =?utf-8?B?RVFXbk13VTlscXhwYXVKa1RiTlgwYVhLcmhxRUJ0WnZNZmpmTkZHUnZpaUtH?=
 =?utf-8?B?bm5KVGJ4MXBQNTU5U3h3bzZtN3hqMitsMUx6UzZSU0xwblNPYjBCS1dJOG84?=
 =?utf-8?B?TzRZT0ExT1ora1c1dldoTlg4MHVnY2s5RUt3cmFCRGxOZWk3Ry90b1hlZ1Nz?=
 =?utf-8?B?dmg1M3BFc0U3UjB3Umt3M1BsWUlhMWtyMStOUWErS2l1NmdEMkdGWnZHOERs?=
 =?utf-8?B?QkkzOHpCYU5ReGkwbE8yd0JJSjY2bEczWjN2RHZmejlBUHA0ek15MGIwZFZK?=
 =?utf-8?B?TVBGUkNXVHphMEcxenBiSEhSREhNMXVyYk5xOHIzWWgzU0FzbWUzVGdVNjNq?=
 =?utf-8?B?SnJyNEpYdTFjSWpTSFBBRk1Sd3dUWVVGNmdJWDhLNlZ0eWxQMjhyQU1vcGM4?=
 =?utf-8?B?UWpqNjVIcEQrV0hFTFNpZFhtZ3ZMVVB1cEJEQTJUUkhLclN5UGlEcmdhZ2xO?=
 =?utf-8?B?VUhUM1g1amk5czZvcG01T0ZFc2Rsa3R3TzJ0WUN2MXRGQTFmUUl5dDErM0JS?=
 =?utf-8?B?enBzcURORzdQUXFJdzdXYnNESExrV1ZTRVg0OGNQeFNMTW1PWlpIdjBDbjF2?=
 =?utf-8?B?bi9zS3p3QU5HVURJeElrU3dUVW5qVVdCVWlGWktVM2RwWWlkelJMeHM1aWRU?=
 =?utf-8?B?b0dFajdoNnFLV0VWcDhFYWw0bHNwTkFtemtoamlwTmM2cjNoVHdOMUFFY2N3?=
 =?utf-8?B?OThTT0hZYkxKUlZ0enpXMjB3bTNUdEQ2VE1ZNUtYQkppSHhiM3JJR1NtNlh6?=
 =?utf-8?B?M1l1RVdKOXRraFQrd2hNR0s3VldYNmFzYkdkd3dVdmIxUUxTSlpYY2xLOWY3?=
 =?utf-8?B?OFFuU01UNTh1SCtiaFJnMmcyZlNSTHBndUd4S3pTOVZVSFJ1L1hVNFNMUVVP?=
 =?utf-8?B?UFB4RXFROXVMTVFmSXVtcUpMQmZuZzFqbFoybnJ0aXJ2WWQ5Y3JPVkFaY0dS?=
 =?utf-8?B?Z0R1bmZBdGRtQVBLeGhObnFIOUxCejR6T2lpVGZPYkpndURTNVk4SGduVy9Q?=
 =?utf-8?B?NGVrNFpUcGFDb0xiQTBzTUNTR3BZejBscUhValVMYlFHTlFyZFQ4ZDlnMHN3?=
 =?utf-8?B?WlBsbkFzLytqUUJqRllNQVA5cTF2eXk4UlptTi9hVzI3cHJsTjJtem9pNkFY?=
 =?utf-8?B?OGcxRTl3RlF2VWtTMFQwZENWcVVHdDhDVSt5T3lkdVNHdDYrN09GdnpNQkhT?=
 =?utf-8?B?c3JTKytCKzN6MzBWU0h5UFFNQXRJM0pQTWljaEVFUHoxazNITWxrNGFhd2tI?=
 =?utf-8?B?UW9MaTJtQXBOeHFXQlhLWWc1V1lKWEdYMUJlY3hNY0hNV1VvS253cmIxU21B?=
 =?utf-8?B?T2M4TVFlazIwMU5CT2ZkQUsyWDZwekVQeWF2bTczL0tkOC9tNHZrT2pSYXpQ?=
 =?utf-8?B?ZFAvcnlLTDlhSzIxb1FpOS9iZXVGQUtBRDNLb0t4MXQvakRtbnp1czhHVzJ5?=
 =?utf-8?B?OVNkTXBsd3Z2WFhGdWxqcVQ4U2lYRStxZFI5OGcrQzdaUmxlOGluZTJaQTgz?=
 =?utf-8?B?dGplV3ZtYjVYZk9QWGJRZ1QyajJHOUs1Y3Q0ZXhDOENJbG9DcHBZSzhkcDN6?=
 =?utf-8?B?Tk1ndTVuREIrdHVEcXlrbVloZUtuOUd5R3dUTHZqVlF5NjZic0lOeHd5eCtK?=
 =?utf-8?B?YXpoMTlFWkxJOGU3bDM5TkRpNEJraHZJNHNra0RuVm5qM2d5QnYrQjIveXV5?=
 =?utf-8?B?ZjBWNTZmYnh2bzFmckxPR01SWFJvTkovN1dhcVFBZjZJYXA3a0dOczBzVUJt?=
 =?utf-8?B?RUFuWmJuTWQ0blhKU2RQRm1neFZjaThwdGpiTU9vdGo2MGNUZm1NampzVzB0?=
 =?utf-8?B?MFc1d1dBR1ZDQnYvWUZBWTNmelorZG1qZzRCRitwdEFqRFhVNm16OEY3TXFH?=
 =?utf-8?Q?kxRXrx054w/Wk6p4YydXPBzaL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ad96b1-79ff-4cd4-5549-08dd790625c2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:35:46.9394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNW5aD1r9TNX11xRYGGh2+l2NNltKLsCnbK7lS8AFB3XSov2jqGHlFD9BKr88fy0rQAtP+lt71cawYkBtiSJzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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


On 10.04.2025 18:54, Michal Wajdeczko wrote:
> On 09.04.2025 23:13, Tomasz Lis wrote:
>> The balloon nodes, which are used to fill areas of GGTT inaccessible
>> for a specific VF, were allocated and inserted into GGTT within one
>> function. To be able to re-use that insertion code during VF
>> migration recovery, we need to split it.
>>
>> This patch separates allocation (init/fini functs) from the insertion
>> of balloons (balloon/deballoon functs). Locks are also moved to ensure
>> calls from post-migration recovery worker will not cause a deadlock.
>>
>> v2: Moved declarations to proper header
>> v3: Rephrased description, introduced "_locked" versions of some
>>    functs, more lockdep checks, some functions renamed, altered error
>>    handling, added missing kerneldocs.
>> v4: Suffixed more functs with `_locked`, moved lockdep asserts,
>>    fixed finalization in error path, added asserts
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c        |  34 ++++-----
>>   drivers/gpu/drm/xe/xe_ggtt.h        |   6 +-
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 109 +++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |   2 +
>>   4 files changed, 103 insertions(+), 48 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 7062115909f2..e7d474bd0cfe 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -1,4 +1,4 @@
>> -// SPDX-License-Identifier: MIT
>> +/// SPDX-License-Identifier: MIT
> what's this?
happens when I have lagged connection to my dev machine. Will remove.
>>   /*
>>    * Copyright © 2021 Intel Corporation
>>    */
>> @@ -429,16 +429,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>>   }
>>   
>>   /**
>> - * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
>> + * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
>>    * @node: the &xe_ggtt_node to hold reserved GGTT node
>>    * @start: the starting GGTT address of the reserved region
>>    * @end: then end GGTT address of the reserved region
>>    *
>> - * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
>> + * To be used in cases where ggtt->lock is already taken.
>> + * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
>>    *
>>    * Return: 0 on success or a negative error code on failure.
>>    */
>> -int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>> +int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
>>   {
>>   	struct xe_ggtt *ggtt = node->ggtt;
>>   	int err;
>> @@ -447,14 +448,13 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>>   	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
>>   	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
>>   	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
>> +	lockdep_assert_held(&ggtt->lock);
>>   
>>   	node->base.color = 0;
>>   	node->base.start = start;
>>   	node->base.size = end - start;
>>   
>> -	mutex_lock(&ggtt->lock);
>>   	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>> -	mutex_unlock(&ggtt->lock);
>>   
>>   	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>>   		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
>> @@ -466,27 +466,25 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>>   }
>>   
>>   /**
>> - * xe_ggtt_node_remove_balloon - release a reserved GGTT region
>> + * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
>>    * @node: the &xe_ggtt_node with reserved GGTT region
>>    *
>> - * See xe_ggtt_node_insert_balloon() for details.
>> + * To be used in cases where ggtt->lock is already taken.
>> + * See xe_ggtt_node_insert_balloon_locked() for details.
>>    */
>> -void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>> +void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
>>   {
>> +	lockdep_assert_held(&node->ggtt->lock);
>> +
>>   	if (!node || !node->ggtt)
>>   		return;
>>   
>>   	if (!drm_mm_node_allocated(&node->base))
> nit: we should use xe_ggtt_node_allocated() instead
will switch.
>> -		goto free_node;
>> +		return;
>>   
>>   	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
>>   
>> -	mutex_lock(&node->ggtt->lock);
>>   	drm_mm_remove_node(&node->base);
>> -	mutex_unlock(&node->ggtt->lock);
>> -
>> -free_node:
>> -	xe_ggtt_node_fini(node);
>>   }
>>   
>>   /**
>> @@ -539,10 +537,10 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>>    *
>>    * This function will allocated the struct %xe_ggtt_node and return it's pointer.
> since you're around, can you fix above s/allocated/allocate
ok. "it's" sounds dubious as well - we're not returning whether "it is 
pointer" but just "its pointer".
>>    * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
>> - * or xe_ggtt_node_remove_balloon().
>> + * or xe_ggtt_node_remove_balloon_locked().
>>    * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
>>    * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
>> - * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
>> + * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
>>    *
>>    * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>>    **/
>> @@ -564,7 +562,7 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>>    * @node: the &xe_ggtt_node to be freed
>>    *
>>    * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
>> - * or xe_ggtt_node_insert_balloon(); and this @node is not going to be reused, then,
>> + * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
>>    * this function needs to be called to free the %xe_ggtt_node struct
>>    **/
>>   void xe_ggtt_node_fini(struct xe_ggtt_node *node)
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 27e7d67de004..d468af96b465 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -15,9 +15,9 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>>   
>>   struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>>   void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>> -int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>> -				u64 start, u64 size);
>> -void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
>> +int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
>> +				       u64 start, u64 size);
>> +void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
>>   
>>   int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>>   int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index a439261bf4d7..d2f6bfb3aacf 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -560,35 +560,40 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>   	return gt->sriov.vf.self_config.lmem_size;
>>   }
>>   
>> -static struct xe_ggtt_node *
>> -vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
>> +static int vf_init_ggtt_balloons(struct xe_gt *gt)
>>   {
>> -	struct xe_ggtt_node *node;
>> -	int err;
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>>   
>> -	node = xe_ggtt_node_init(ggtt);
>> -	if (IS_ERR(node))
>> -		return node;
>> +	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
>> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
>> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> as mentioned earlier in similar case, since you are accessing vf
> specific fields we should have asserts in this function:
>
>    	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>    	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
ack
>>   
>> -	err = xe_ggtt_node_insert_balloon(node, start, end);
>> -	if (err) {
>> -		xe_ggtt_node_fini(node);
>> -		return ERR_PTR(err);
>> +	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
>> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
>> +		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
>> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
>>   	}
>>   
>> -	return node;
>> +	return 0;
>>   }
>>   
>> -static int vf_balloon_ggtt(struct xe_gt *gt)
>> +/**
>> + * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
>> + * @gt: the &xe_gt struct instance
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
>>   {
>>   	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	u64 start, end;
>> +	int err;
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>   	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +	lockdep_assert_held(&tile->mem.ggtt->lock);
>>   
>>   	if (!config->ggtt_size)
>>   		return -ENODATA;
>> @@ -611,31 +616,75 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>>   	start = xe_wopcm_size(xe);
>>   	end = config->ggtt_base;
>>   	if (end != start) {
>> -		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
>> -		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
>> -			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
>> +		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0], start, end);
>> +		if (err)
>> +			return err;
>>   	}
>>   
>>   	start = config->ggtt_base + config->ggtt_size;
>>   	end = GUC_GGTT_TOP;
>>   	if (end != start) {
>> -		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
>> -		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
>> -			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>> -			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
>> +		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1], start, end);
>> +		if (err) {
>> +			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
>> +			return err;
>>   		}
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> -static void deballoon_ggtt(struct drm_device *drm, void *arg)
>> +static int vf_balloon_ggtt(struct xe_gt *gt)
>>   {
>> -	struct xe_tile *tile = arg;
>> +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
>> +	int err;
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
>> +	mutex_unlock(&ggtt->lock);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes which limited used address renge.
> typo
>
> hmm, but I'm not sure we need "which ..." part anyway
it is repeating the same from "balloon" co-function. Will shorten.
>> + * @gt: the &xe_gt struct instance
>> + */
>> +void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>>   
>>   	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>> -	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
>> -	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
>> +	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
>> +	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
>> +}
>> +
>> +static void vf_deballoon_ggtt(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>> +	mutex_lock(&tile->mem.ggtt->lock);
>> +	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
>> +	mutex_unlock(&tile->mem.ggtt->lock);
>> +}
>> +
>> +static void vf_balloon_fini(struct xe_gt *gt)
> naming... since this is a cleanup of the vf_init_ggtt_balloons() then it
> should be named in matching fashion, so
>
> s/vf_balloon_fini/vf_fini_ggtt_balloons
ok
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +
>> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
>> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
>> +}
>> +
>> +static void deballoon_and_fini_ggtt(struct drm_device *drm, void *arg)
> hmm, naming again...
>
> as this is a cleanup action for the xe_gt_sriov_vf_prepare_ggtt() then maybe
> 	s/deballoon_and_fini_ggtt/cleanup_ggtt
> will suffice?

Sounds less descriptive, but ok will rename.

-Tomasz

>> +{
>> +	struct xe_tile *tile = arg;
>> +
>> +	vf_deballoon_ggtt(tile->primary_gt);
>> +	vf_balloon_fini(tile->primary_gt);
>>   }
>>   
>>   /**
>> @@ -655,11 +704,17 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
>>   	if (xe_gt_is_media_type(gt))
>>   		return 0;
>>   
>> -	err = vf_balloon_ggtt(gt);
>> +	err = vf_init_ggtt_balloons(gt);
>>   	if (err)
>>   		return err;
>>   
>> -	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
>> +	err = vf_balloon_ggtt(gt);
>> +	if (err) {
>> +		vf_balloon_fini(gt);
>> +		return err;
>> +	}
>> +
>> +	return drmm_add_action_or_reset(&xe->drm, deballoon_and_fini_ggtt, tile);
>>   }
>>   
>>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index ba6c5d74e326..d717deb8af91 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -18,6 +18,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
