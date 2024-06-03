Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668ABC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 03:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CB310E01F;
	Mon,  3 Jun 2024 03:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fv9Axtk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F7210E01F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 03:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717386814; x=1748922814;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RFaEKFUbORYhEAIOPJnDLgAvKEOJhfZ18wfyK8fkgrg=;
 b=Fv9Axtk+vxCO/ONz1JiM3feS7tH268LchRtCVUrkUt8MxLbp6tj28AAr
 ZzNAZtlZldv7Sv5pmCEVkmd7aYWvuhmg9hxZjXbJfGAU+vE0KQBwToh90
 AePUzoX1YICKoDpH/iQ0RccwEAMmgkg2ut4oMPbUp57VXZ1jxpQpVVyym
 aspcwBVuAfYCuHsBaBJ0nP07YR47BFKymYE++GU0EKwgY8EtCdzU4OTsW
 WfrsmPfKYH8F3aXhdP6z//tG65fu3KY6n0OelnaBKE8NPrEUHYAMhsJD3
 Zh0VadC4OsqOeK+mX+2rPzN8pVt+ldOp3Rc+Sw/w04yR6NPefiplKwYob g==;
X-CSE-ConnectionGUID: 066tEwdEQIClBvBjyW+vDg==
X-CSE-MsgGUID: hliaarWpRrq2TNfsXx+rtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13989964"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="13989964"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 20:53:33 -0700
X-CSE-ConnectionGUID: h8n73TJvRr6AP7C+HMwMcw==
X-CSE-MsgGUID: CMELNFOARPe3PZ1/OOSOHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="74235260"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jun 2024 20:53:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 20:53:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 20:53:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 2 Jun 2024 20:53:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 2 Jun 2024 20:53:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZV+/xvN+p96eOLyvn5aGz5ftOB7waUKHg3O8acnJWf2R6LzZJ6Q61HG7vgrHvMzw9miTbDH9VbT17usi546SlJ7Vrw+NhDgTsyEb4RCk6KbBIr/LxP5tE7otYFiPusmXQ0AmkTZD4NjOLbrUG18b2jzb1oIAvcUyXs5dsPt+SRLLnhB33VhIqAMheMKXQ3U+HFwdn71EQaeQWxcNSJo/W36MVSD2wDBiGNUd0YAm3y+gP4ZwRIWRLsKeKuD73hc+A6oIFrAlfEBhSlIqy+4FHF7zivOpO5S4bgCQQfMb6GYoQRaDk0UBLHS7r98r56xDHJsLABYhwfpgGoPw1unIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0IRaYNAosvI7EfGXJ4sKQ5z4Ad1bxri+NBbo4NxxBs=;
 b=ZSdNaA00UNGK4Ug53lQ8FgYjlcKv1qeNWDmlD70eW20N0keim4yujTF1KZgIax9Oq3iHnlcc80pFSCUsnwJQUSjfrzHT5P/HmYdryHLiQp4+KDQrKmxRBqudJcaXO+AEvqIvaYpUgWYVh6VOLRlmeO/l54lwg5Kv61VFzbtrs20VZZElNzNgwjN7sd5xKbvzCUdWhi+mZSogKBL86+9BrV5tIQ6kcvyGY4bxhR7XWhHNAmzRavpEPyZ9lXX9nkcjnshvm6YONXDYKkGTxTrYB5s0YEGJ4bGs9StQnAkMApaUWzcYfaQfYr0QXBNauxYLs/jWv6g9dus4s3zLD269Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB7889.namprd11.prod.outlook.com (2603:10b6:208:3fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.35; Mon, 3 Jun
 2024 03:53:28 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7611.030; Mon, 3 Jun 2024
 03:53:28 +0000
Message-ID: <18804474-f4ef-47e9-a3c4-c5e504c922d8@intel.com>
Date: Mon, 3 Jun 2024 09:23:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
 <20240531064845.930740-2-himal.prasad.ghimiray@intel.com>
 <ZlnOVvmtsrWS80Ff@intel.com> <41051b48-6217-46d2-afca-ba3d11c61daa@intel.com>
 <ZlnsPgvMTx_iiPqc@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZlnsPgvMTx_iiPqc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 192d7081-8ced-46ea-21b3-08dc8380ba29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0VEUnV0RHY3K3J0ZlF3TlhybkxMaVNzbVBURVQ4Szl5SkprNkpBbnJ4NXRj?=
 =?utf-8?B?VW5qNVVXbHllRk5Zd1FmS2drZkNFNWJBbStwU1FscjlKaGRIWUtDK3Vzd3NX?=
 =?utf-8?B?Wk1FNUxEclJuOTVHclkxcVhFT29MTjUvY0RRejBDaE5rQXJzalVaNHQzWk9U?=
 =?utf-8?B?T093SG5tQ2V6Z0VlWmtBU1ZzaXhXcENuWHpOM0ZLSFRKMU5mVUgvTi9kSGgx?=
 =?utf-8?B?c1I5NzNCNmVMR09kQTlmT21vY3F4NlVicGdIdWpTck1VWTdLdUNrU09RM3dS?=
 =?utf-8?B?dGM4QVkrNi8wOFVQQlJDRDRjYWhad2tOZHYzMkZPWEYxb081M1QyUlhIdlkv?=
 =?utf-8?B?UGxJUzFFVGVNYkhNQmxFUm1qR0dWZW9rTUpZUkdTTjdpOUJDTWtaSFVNZUhp?=
 =?utf-8?B?aUlpeHg0MnIzbjloWHh1d0JYc0NWb1B0K1Y3V0pRQ2duK2tqWmFZbm5SVEdz?=
 =?utf-8?B?R0I2ZVRGbUZxcGZ0aThxMUphL09TejYrZ2wzWXNCMTU2bTBXb1hGbjVlNkpj?=
 =?utf-8?B?YmpzdmxuMk5iMWJRRGRKcEZBTXVlRmYvdGI0THFUejhOdG44MFYyTWJsN3B3?=
 =?utf-8?B?S3h3SE4xVU5qR2I0RGY1MWVGRXV6SDk1Vjk3UXRuYUZGSmhYamxkTDRyeUQ1?=
 =?utf-8?B?U01xWkRsWFRLY1JsTkpMdFRhYXdnN2QzdFdoWGJjY0lKSk5yMTVMdXRwY0Ew?=
 =?utf-8?B?emt6Rm1kSDk0Q0oyTW5LOFoyNFFzYjlNSnNEQWxUYUxXVjg4NTV5TVNYTTJF?=
 =?utf-8?B?UFFHUVRWWGp5cSs2ci84ODByVEpBM3NKMmExTGNoWWJHQkljUVNwWXFPSjEv?=
 =?utf-8?B?YUVOTC90V2h3ZWxiZmFWWXA2TC82YUMvSmNCMk5ZZGFJNmIzdU1aYWsxMTJF?=
 =?utf-8?B?V2M1NGUrMU9PeVNkTVJrSzV1OWQxdVRncG9IU2wzYWJEOS9aejN4T05OS0tB?=
 =?utf-8?B?a3JsRitmSGN0ekcxTzVhcTRzcHRqS2dNVzl3ODJleHpJRzBCdWFGNTYrdVMr?=
 =?utf-8?B?R2JjUm1RYklObmhsOGxGcnlzYzR1WVV0c3ZzZ0JKcnVkVE8wci9xTUhteCt6?=
 =?utf-8?B?SmNjemJic2RoYmtrT3NCVytxeHMwQkxIY0F0WTE3akl5Uzhha2x0aEF5UTNJ?=
 =?utf-8?B?VHk4OHZFa2toMzVWNVNtRllWNkpwUnRLRnYwSENiTVdXSUs0L1BIUkVzTjEw?=
 =?utf-8?B?emUxV0czdk5NN0NKSnp5ODREMnh5TUNzcGRUTjZVTWYxRlRsekZ4TlBnV2Jj?=
 =?utf-8?B?Y1VuN0VOQ00wTDVCbHplbmFhQTNPb1U1WndEc010Y1R0WXdoN2pOSXJieFh6?=
 =?utf-8?B?OXVQZUNCTDEvR0dGQVJrTEJ4c3lkSUZUMFozelZkaGp2dXhpQnVQMSttMnRI?=
 =?utf-8?B?aGlHVmdUelBmaTM3TFdpK2M2UXo5eFpIcU41L2tXWlNsQTFIb3cvQnFkMFNV?=
 =?utf-8?B?QU4wTUtCVHRZeGZ2TGtRc3Bpay9IRGdPOWJYTEN0bllyc3JVMHZVSnhGcUZm?=
 =?utf-8?B?aTRtM0plTFAxc0RvRDVkZkNFT0kxY2NCZUdaQVdnampHZ2MrMXJTSFRlbkdJ?=
 =?utf-8?B?TndleCtiVTdVVjhpQlFWcGszQmdjcEJkck1aaWd2NnN4a2lnZXZwNjIvN1RL?=
 =?utf-8?B?RUVsVEdJUFppV01TM3FlMUZNb2Jtci9ObTdtNTl4OXI3OXV3NUE5Rk5Ebk1o?=
 =?utf-8?B?dGJZeUpDSi9GV0xuMmdBOUFFdU9WSlNmNjN2bm5wMUxrMXJOZnhWMU13PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmRacEdDSVg5eWdic00wSWRZR3lxenYrcXVCdDFvK0x3TFpKUjlPSUZVTDNz?=
 =?utf-8?B?Vm04MG1BM3paa3I1MjBVL1A0cU9mOGNIUmYwZjcwS1hySWNQRlQrZ0I2UmdX?=
 =?utf-8?B?ei9wMGZRT0Fkd2tBMkEvNXNsZzgzRDRUMGgza2NVTDQ3WEN1aVVCSkJodW1N?=
 =?utf-8?B?bUdmZHppejBybERpWjI1Sy9nZVVhNWRqeVBZa3p3eStqQlNjUFk0WDVtZ0Iw?=
 =?utf-8?B?ZWlxQ3F0TGtZYnQrZFBub2t5SkNjb1VEV3VkWldKWnlUNlBPTGMxY0FRTnBU?=
 =?utf-8?B?NkcvRTNzcFJlRHhKUW8wZ1ZQY3VIRkZxZDB4Q2ViVFYwVzdaV0xsSFc0a0E2?=
 =?utf-8?B?NXdmN2NDWlhyNXVhRXpSZmQwSzJwdE90RzIwUGJWMDlqeWtpemExQnA2SThP?=
 =?utf-8?B?YW1tM1NSTDhVSktIMmlTenorZk5QRHJVeStBbTRlams5K1MxaXhHdFZrYzlw?=
 =?utf-8?B?akpkbjNuVXgzMUg3RzgwV3hJY2dYUm1LRmNUam1KKy8xVmhBb1lJZ3V2ZVVp?=
 =?utf-8?B?dG1YVm1LY0xPWU01SXkyQmM5cWNOdzBRUVZuMWNtVGxSQ1lJNEc3SHkxdC8r?=
 =?utf-8?B?ckVNVmdnVTZPNi8zdTl0Vk5wU1BUWStPdml3R1NYZXFQellLZTJuaE9pRkpY?=
 =?utf-8?B?VWx6ZEZOUmE5MXhzOHduSnQwTnZSUmpYbFYrRlZXNmYxZDgyZWltd0JBa3hy?=
 =?utf-8?B?Z21DYi9qekVUcXRVVm1xUUhnZzU5enRETlFOb1ZQQlhTMzBEbWtQR2R3T044?=
 =?utf-8?B?MmVQcEVCekpibnY2blFNV2x3QlYyZ3hRQ3NUQURwMUdMYm5DRXZqMFJjclI5?=
 =?utf-8?B?QUtudmxUNXpZakIrSElacHU1bkI5d1JNSng0S3dGbHNTcHlNQ3hKMmlYdFZT?=
 =?utf-8?B?UnhFc3Z2dGRpQXgwZFFFdVNrUjJqYmpqM2xaaFhEMldydnZsZTVYTkJUa0Zn?=
 =?utf-8?B?SmNUV3hwRXBJQ2dLVnRDYXBTa3ZjbzR1WDVzdDQxYVA2MTI5MWQ4UjFvaGJk?=
 =?utf-8?B?a3lGZTV2bVA4cHJ2ZC83UmEwV2VqOGRnR0p4Ri9UQzFETFpmS0ViSW9UanZk?=
 =?utf-8?B?MHd6SFhqU3hobkYyTS8xUzladUc5NitTN1pZOUpueC9IYnowZjdjaXNiZzNa?=
 =?utf-8?B?ZVhMN0FpK2w3c3VqSXRqdUY0dmYycExEK1JSUUNqUDdlVm9OSys2Wm1DRjBO?=
 =?utf-8?B?SnlzQzhmb0FoRnEwTkVEdC95L2toYWRiazBwMlZ0Q1Buak8xNzhlY2QwbGhx?=
 =?utf-8?B?RlRpTUhMdksrNFQyRi9nM2hHQjh1NlJtYXQvTlFtZGt2UHliRjNzQXlUcW5i?=
 =?utf-8?B?SVFKdzZPakFzUVZua1F0S2JpZ250KzhZRlc4K0xBdXg4bmhOOUxZSjRXZkdV?=
 =?utf-8?B?SGwyM3lhMG1NSkxKOVcrRTh5Z3FNVFBVR1k1UUI4NW9nSnFBUGV4K0JwUU51?=
 =?utf-8?B?ZlA1d1ZpYyswQkVBbU8za1FtU0xNSUU3N3RKOThadXc4dituNlBXQVgzKysz?=
 =?utf-8?B?a0d3bEtHWUxqTGlSQVIzczdpLzM4TzJSam5kYkRQUEdITmdKTVdCY1ZLUGJl?=
 =?utf-8?B?aS9jdkpHckFOTUtFZ0N1V0x1dVBaVk45TFVmWUltNXZlTWZJaUJDUUZXRzdz?=
 =?utf-8?B?TW5jRlZScEZHSVdCZ3MrbVpEN2NFMVZGNWdXakpNVTU4bWFVSFZsRjNSanlw?=
 =?utf-8?B?cThicmxnM0JaNmw2dXc4MW9tT2lGSy9XenE3UElZQk9GelArcldMYTF0STYy?=
 =?utf-8?B?MTJ3K2hRSFFoR2hxQUlMTU1ucnJwNWZRN0JkTEpVZWVqOFlZM1I2TGFQYWtL?=
 =?utf-8?B?cDlwMjRwTVhVMlpndkQzSG1nKy9PSVFWK0NyWVBacFJMZlRTbU1zMmlHdEJk?=
 =?utf-8?B?QlVnWmFSNjlac2FuRHJuVmZKUXoydDNQOWx5N3Fhbzc3SEhYYWxMWDhhMGp4?=
 =?utf-8?B?bG9FdGdTeVRkNXMxOWR6Vk05QTVxbXBRWml6OTY5ZU4zNE56alA1WWp6TnRn?=
 =?utf-8?B?Z3FDOTk1UWZ3WWMwNms1bVRsQXRuRk1IcDZRVUlVcFRDeXgwbVVrYkZHbGVW?=
 =?utf-8?B?R1FhbTB5S3dHbi9GVG9qRU9iK2llSEkySnp0TlZOeWZuZzlEL24zN0VoamRy?=
 =?utf-8?B?bmhYOFdaL3JFMGhhVVFiclN3eGx3RVl2Ny9pQlczc0YwcHJGeGp1Q2M0bjVN?=
 =?utf-8?Q?prNLNoXmLIjCjkayEzS541I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 192d7081-8ced-46ea-21b3-08dc8380ba29
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 03:53:28.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh0NaweSS3ZFWxGOee5hqtaZAHFelxNXyNW1klSwueLFAKM7kWVTDss9UFBFCECqdag8Ex+uxz9j0HYCdJcAvF271rl5JoLSYWkZdus7EfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
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


On 31-05-2024 20:56, Rodrigo Vivi wrote:
> On Fri, May 31, 2024 at 07:26:33PM +0530, Ghimiray, Himal Prasad wrote:
>>     On 31-05-2024 18:49, Rodrigo Vivi wrote:
>>                                                                                  
>>     On Fri, May 31, 2024 at 12:18:45PM +0530, Himal Prasad Ghimiray wrote:
>>                                                                                  
>>     >Make sure that the assertion condition covers the wakefulness of all
>>     >supported domains for XE_FORCEWAKE_ALL.
>>                                                                                  
>>     The most important part is missing here: why? what issue are we trying to solve?
>>                                                                                  
>>     Hi Rodrigo,
>>                                                                                  
> Please avoid Outlook...
>
>>     AFAIU,  xe_force_wake_assert_held is designed to trigger an assertion if
>>     the provided domain is not awake, which works correctly for individual
>>     domains. However, the assertion condition becomes incorrect for
>>     XE_FORCEWAKE_ALL.
>>                                                                                  
>>     For instance, if we assume all domains are in sleep mode, invoking
>>     xe_force_wake_get(fw, XE_FORCEWAKE_GT) will only awaken the "gt" domain.
>>     Subsequently, another function needs that all domains are awake and
>>     utilizes xe_force_wake_assert_held(fw, XE_FORCEWAKE_ALL).
>>                                                                                  
>>     In this scenario, the condition will inaccurately return success because
>>     fw->awake_domains (0x1) & XE_FORCEWAKE_ALL (0xFF) will still be 0x1 and
>>     Ideally it should have asserted.
> It makes total sense. Could you please ensure that the commit message include
> this important reasoning?!


sure. Will update the commit message.


>
> Then, the other commit also needs to explain why a simple
> (XE_FORCEWAKE_ALL & fw->awake_domains) == XE_FORCEWAKE_ALL doesn't work so
> the supported/initialized domains needed to be created.


ok.


>
> Btw, perhaps initialized_domains is better then supported?


Ok. Will use initialized_domains.


>
>>                                                                                  
>>                                                                                  
>>                                                                                  
>>     >Cc: Rodrigo Vivi [1]<rodrigo.vivi@intel.com>
>>     >Cc: Badal Nilawar [2]<badal.nilawar@intel.com>
>>     >Signed-off-by: Himal Prasad Ghimiray [3]<himal.prasad.ghimiray@intel.com>
>>     >---
>>     > drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
>>     > 1 file changed, 6 insertions(+), 1 deletion(-)
>>                                                                                  
>>     >diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>>     >index 83cb157da7cc..4c986d72cba7 100644
>>     >--- a/drivers/gpu/drm/xe/xe_force_wake.h
>>     >+++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>     >@@ -32,7 +32,12 @@ static inline void
>>     > xe_force_wake_assert_held(struct xe_force_wake *fw,
>>     >                          enum xe_force_wake_domains domain)
>>     > {
>>     >-       xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>     >+       enum xe_force_wake_domains is_awake;
>>     >+
>>     >+       is_awake = (domain == XE_FORCEWAKE_ALL) ?
>>     >+                   fw->supported_domains : domain;
>>     >+
>>     >+       xe_gt_assert(fw->gt, (fw->awake_domains & is_awake) == is_awake);
>>     > }
>>     >
>>     > #endif
>>     >--
>>     >2.25.1
>>
>> References
>>
>>     Visible links
>>     1. mailto:rodrigo.vivi@intel.com
>>     2. mailto:badal.nilawar@intel.com
>>     3. mailto:himal.prasad.ghimiray@intel.com
