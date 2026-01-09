Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C9D232CC
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 02:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293F410E7E1;
	Fri,  9 Jan 2026 02:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVhg5quT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EB010E7E1
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 02:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767926658; x=1799462658;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kIUWhergfEFi73KhE68juwKQc9ll8UbvKIZ3g4mHfRw=;
 b=WVhg5quTcEdhAg2apkmqydxf+fMDAQUxWami9lvo+vgMx7xzgkjopNqw
 8YBeB9huaXJpiUBbBs0gR0g3yMrAIvJJBm6i5Eb7X0IjFjGMQ/GQDtVIX
 rlfA7pHPht5BG9DZN2RTzLcbQ76ZuikV911LpT6OqahGVORc4nsEysIxW
 NdQWJbCmbTA87j2BAnN+B01pFuw2S5tQL2Lc75llnAM8UKIovLZQPwirU
 g6YHYgH24ePgAz9DFj5g5Kej3VlWni3lrBNTt40W8jUVAxmMc9qbBsBlS
 uQkX1avaVlMLxp8RAcgGx8Fi1lSJvtR7Me7nYL6+AHLAnLsx/cUm/6WPl w==;
X-CSE-ConnectionGUID: zRvap3VATsy6xTr8GZGRzg==
X-CSE-MsgGUID: RcsBES0nTIixpIkXVgkCBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79948598"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="79948598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 18:44:18 -0800
X-CSE-ConnectionGUID: GeNq8+3mQICbRwCgrPyinQ==
X-CSE-MsgGUID: st7V00xcRSO219gsjm8NWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203277453"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 18:44:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 18:44:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 18:44:17 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 18:44:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpQHsUEllMdUgqiK65ZXB4qNR4nYuzBPFu+hZ1a6bDHiheORXoaSwrR05bx2i72YufrXBYNqa+GVHZeNBVOqzfMKMlk9MVd+8d2nlwl4f9PHVBl+yLdEHOkZPHAg0l9x4vxMbkxHYe6381xTP/Bt62o3vMP+0UokbiPtzaQq6gfHRPoUNh3aKD4jchPh6gw3FPiMLP6H2QYbgNU4x94Kfa9GHV+lrgMqq6TN52RNclhBsddDF9knqnYs/Y9uaYdbTUpaXlsZ7Y44f60OQsrXuEoEV+4nCIJ8l8kFz9NmXGOpk1R1krR7+ir7sDNANoNPoNu6aYwPf2IAP1mG2vcpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B41ylszqbDFrsLsMwhZ6kE1XL3psxorQ7mmuS5C3n1U=;
 b=KJp0zS4hSTtgNeOQ/kBWefFIA7gM0q68y0XNDnmYH/CsFp6/cokTydwBmq2WZ2sDjzdoyCxgzK5iPYv4hyv9Dsg3XbzvYaoz4K636TrzpTZc/FvysOEHin8+7qVU5F6yjN40spyUFkAqa+IF7EKGOo7NRMAWuG9nF0/pdWb+rdWER8t9SNG0RXUJZGLoodunE5ZNNVmnscymAdw73+lno06oyFLSCrBGfBUOk2L/zkos8OL74icOz2x7/2PySMJtPs2xtfjf4ItiedN9SuciGZg8bAyKQLNHQakE8HRqivu0TJN69MBcJKT+viCTlhdoFLVDCv8H6KY3ftH9HtVckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ5PPF9FBA0498D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::848) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 02:44:15 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 02:44:14 +0000
Message-ID: <78e5bb9e-595c-490d-96b0-bb01126d2f8a@intel.com>
Date: Fri, 9 Jan 2026 08:14:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <karthik.poosa@intel.com>,
 <matthew.d.roper@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <ville.syrjala@linux.intel.com>, <uma.shankar@intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251220073657.166810-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ5PPF9FBA0498D:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f349ad-f6cd-4d86-daae-08de4f28fa0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFIrNW94RGM4OUM2c1dHVEdjWnhzYkxTUFIwNStsaGkwSTlmWVJCOEZYS3dy?=
 =?utf-8?B?N0JHSGMvYkJFM09WbnhyenJtUVBRVktQVFNaTFZWRjh4c2NRbDJtV1VGYWxD?=
 =?utf-8?B?Mk85R2h3VVlOTEY4WDA0MDlzU1dTdE04dG9qNHJuZGEyTExPRUp3WmpxWFBL?=
 =?utf-8?B?MWtPNGtPZDlwN2tEdlFHVUIzdlpVZEp6SVpKZnEvTnpzcUxIb2VnZ0dneVJU?=
 =?utf-8?B?bHpJWjlSZmZOTU1sMVVQSHl2TTkyUXlIYnJHc2N5UFA5M1NrU2xaZWpBN0c2?=
 =?utf-8?B?eHBLNXBhRE5yWFBJUzJvNmczMHhWRUpFaEhOTGs3U0c1cmYrV3BTazFVNFNV?=
 =?utf-8?B?VC80QnlVYkJLci9CeThqSVBFNDlqaWVqVXh3VGtzdm1EV01GcFhOUThDWGd4?=
 =?utf-8?B?d0pCb3dkOEswdkx3SEJkN1d5MDdGK1NML3BKUlQ1N09qRGdYb0d6eXhrNlFi?=
 =?utf-8?B?VG83dU9vTDNnZFRLeE9mNmhmWElvbFk4aWVmVS9MRzRSUkRYbkxodDR4b1lD?=
 =?utf-8?B?MGp2U1JvQTZkU2QvbzFvTFF5QXdNakYvanJwVVRzelhJMVVvdTl1RFd4bGM3?=
 =?utf-8?B?KzBqallhKy9wakFRVTY5em9HZ0NuWk1tWVR6eFN4d0V5eTkxekdKb3YwMjRs?=
 =?utf-8?B?VkJNRTlZUTBoNFVJNGU1amNSTVo3TkFyQS9Yc2tmNFlGc1NZckJ1TXVXMTdU?=
 =?utf-8?B?K1RBSjRsQW0rWmdSZnh6cmduczdneE9sZXU2VzlJM2ZLSjlleUdFRy9qQlVE?=
 =?utf-8?B?REs0SFVDWDJ5ekU4ajlrNU51TEJsQnBJemwyMFRGQkM3UDB3OVRXNUZta0ZP?=
 =?utf-8?B?aVZvK1Z6Ukc2U0EwSXYvbytOZ3RpUnF1ai9kWXFvdHoxS3JMdFRucHM4WldT?=
 =?utf-8?B?RHVWN1p3Si96Rzk0bGp5Z0VxU21Hekl0clFOUkN0NzY1ZFM5NEx2dVhXUEls?=
 =?utf-8?B?dlBlL0ZJZjJrNVpRdkFDUFM5enFrcml3Z2EyTFpvcmJjN2FFaDhWK3o2ZlVQ?=
 =?utf-8?B?ck5VZHNTYTAwM2I3bVUxMmxKaVhVQ0puY0tVazF2UG9oTHVzam4xMmtBWU51?=
 =?utf-8?B?TVB1cll5RHQveVFSRmllVHJDYW9XVDJER2pacE9Wa1JOS3pMTmZ3WnFFaU14?=
 =?utf-8?B?Q3k4M3lQMkJLSW1iemQ1dDZ6K0ljT3pXeVIybHh5dWJmUm80VHVnWWhTd1BK?=
 =?utf-8?B?ZzROWiszNGdkZUNhRkhYRTBINitGZS9ueXVvRC8xVUo2YTBIekg1NkNYM1Fr?=
 =?utf-8?B?WkJBeWZYcGttUTJ1YXVPYU9rTmVYY29qd3dKR1MvbEdYdi9XdWlVVnNoRGsr?=
 =?utf-8?B?SEFiWHhibEdWZ1dpZXBZcE5YbHVxQkx5SkNaQU83aWp4VjVuR0ZuVUNWelpl?=
 =?utf-8?B?VEhiQmVIZU5UYjB5aHlYMk0yaStDY3h5V3N2NXZ3Nmk2UTgrYWIyUDgwckxU?=
 =?utf-8?B?SDlQeWRhYTJpT1NNRUdTK3dYZUx3WHg4aFFEWElJak1vVkQrOUU0NEhGMzJs?=
 =?utf-8?B?eXN6TXhLcFRwZzdqZzRXdEl1UVBsOGVTOXQvQ2JyRVhrOXRJRDRvQUdXODg1?=
 =?utf-8?B?dWlEb2VmdWI2NW1DQUZFSngwN3JsQTNnNmg1alZ4RitOekdRd2YrMjVOeVFs?=
 =?utf-8?B?NHBLU0hJWUZud3pYc2IrbTNTQ1UvRUp5QjdBSXFpOExScXNjZUJ3dGZFRTh0?=
 =?utf-8?B?OWxaKys3MUpxU0tsZkR6K1ozd3h1NDRkSjV6VXhFT0t6aFNIcU5HQmlwWjdo?=
 =?utf-8?B?TDhBOVdPajFuSW9qN01ORFJ6eGxDc21mUjhDSzJOV011VlJJeHRQMEVHVnI5?=
 =?utf-8?B?VlpkaStxc1llY1NNbnlKVEtYYlg0ZDhjZW0yMjBxNW9KcnJ1VGUrU1p1ZnV3?=
 =?utf-8?B?d09KUnUzSitPemcrRThFTzU5UU1ySjNoY002L1l1VGl5OENBVXZjaE8vdnVU?=
 =?utf-8?Q?GYjVT76ahWjPctQfRHuQXXK7+HpRDr75?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1dBRThrVUE0WUU1QnIwcFZ6dWZuOCtnaXBjRW5XOExxbXFzVFU5N0k5anE4?=
 =?utf-8?B?bFd6TzF5YU53WmNuU2RUZGtTMElvdXY0WVZKWU9tWWc5azlmNGZjMU1CWHgv?=
 =?utf-8?B?N1hacUt6cFlzdFd6c2YzVERsc1NTU1dyb3MrOVJhREM4RXpUUUZ3Q2k5WFpX?=
 =?utf-8?B?SURoMWtTZk5Xek5nYTVGZDh3Rks4U1R6R0F1Q0o3RWtUVExGQlZiaW56SjRU?=
 =?utf-8?B?UFhnekcwT25DN2ZLSDBnV2Q5Qys0d0hUL2VwZHdybVZLM1JJWEFOd2pBZjhn?=
 =?utf-8?B?R1hIclJ1OGI4SG00ejNIZEk2S0o2dGhPY3VaUkxsTzJSaERmNEJGS2xMbnpz?=
 =?utf-8?B?RnU2QTlMTEZzb1lFK1BVTHE0aGRLQ3NrV3ZBTTlaenZDS1M2L3p4S0ZvS2xW?=
 =?utf-8?B?R0M4VTZXSmxaYWgzbnBSN0JOdzY4OTg0VWlhaVZpNVBRQU1iWHBJY3RHMkhu?=
 =?utf-8?B?MGlnTHF5eCtqbjNCYThBR3doSk1mc013c3liNmZDUlo3cmJvZm1nTHNjRnQv?=
 =?utf-8?B?S3JvcmNCTjYrb0wxUlpkc3haeXh4Q3Vxc1FvbDJPOWhRMGduRW9JREZ0anV4?=
 =?utf-8?B?ZnptZm5MekpiS1VlU1hmeEQ4WWZlYktpKzllaTBKVzRmSkh5NERGOEk5d1BE?=
 =?utf-8?B?eVI0WnhmbDJhOE4vNEFhcDZJUUpCMDQwbTlpcE9oNGNGeXNTQ1RWMmVpT3lY?=
 =?utf-8?B?NzV5cEh2cG9zdmg3My9PbzlpODNHKzQybVVJOW5zNzRRYTkvU0UrSnJ4WENW?=
 =?utf-8?B?WnRrOUZBS05mOThzSzIxU2ZNWFU4d2hhb1RDQW5mdEtoS0RUM0x2aGNQMUJ0?=
 =?utf-8?B?cVFsWUFHS0JNZXkxWmtWZTZON21vc0lKVXorSmxmNFlNbC9HemtxN0ptcml4?=
 =?utf-8?B?T0dMTytmTCtxczlZSzlGWFFJWnZoa3NwQmVPMStoQzh0WHZTZ3Z2RmFnbU90?=
 =?utf-8?B?Wjl2TmV6S0dJcGdNSG51MmVOaDduV1JGTXh5bW03eW0xUElkWUpaWU1ybm5B?=
 =?utf-8?B?SkwyN0lBdTI5eG1oK09mQVJQYkRzcjQyZFVnSjBMVlpBSlFseVdYQ3ZqM29k?=
 =?utf-8?B?UlJxKys3WmVYenRWSU1McC96R1pBUkZLelNaWG10OHpUNEdMUjdlbjhnZUhP?=
 =?utf-8?B?VC95SzJSNWFibW93cFZGR3Y3dzNQRVNTWkV4elJMUHRlRjhpUkJldDhyTkNQ?=
 =?utf-8?B?K0ZtUm1yWHlUei9zNy9pWWU4ZVlFSGlBVVdhYmg3OHRRSTU3dzFDd3ZtS1Jt?=
 =?utf-8?B?YTZkaFFVZGxDU1dCcUM2d0ZncnJWelFDSDU3M0VCTG5nN2JtQXJhb2FTVDFk?=
 =?utf-8?B?UTk4OTBIc20xb3crYUlSazltSWdyTDRkeDY5cDBHZUVPUnpRd09rTWozeWEz?=
 =?utf-8?B?NEtuNm1XTTBiSkxqV1RPV3QzRHRuOVNuNklWelBsVTNaTDZOSlE2OU9NaDE3?=
 =?utf-8?B?eDBXRU1GMTBQcEZuNVk1eGJNMTRmZkJtTkltVE1weG1XTnJTSklCWm4xa05Z?=
 =?utf-8?B?OTB4Q01jdmlaL1dvaTFRVTIzem42SDBrY2hQdWtPYzZmeUtBRCtBenEydzMv?=
 =?utf-8?B?RUtna3RvNWNyNkx4ZXdhbXlua204QitSNkNMaG5YSC92T0pOTlEwUFB2cnVL?=
 =?utf-8?B?N1ZSdTNQaFl0RVY4TENpcjRweEpZald1a2oyQyt5Q3FLa0QvRlRXbjZyekJH?=
 =?utf-8?B?Y0RpalYxN3dRMkJUaEZCaWphSU5jQndyYXE1K3JQUWVRMkxuNmt0elluK2l0?=
 =?utf-8?B?MDRJelNWQ1AxRkNIc1EwZGhGNHluZ2dESGh1ZVRUK3ZvVGxqeFVSb1k3Y2Ni?=
 =?utf-8?B?NjVMSitOUHFCaURXQTFGWXFzREIwV3lXekR5LzhFTHdwNit1THBzUHF5RnhN?=
 =?utf-8?B?UG1MRkVqNlZjaml6UlRvdkF3WSt4VTc0b3U3Rzh2NHRaRWN2RElVd2FLc1F0?=
 =?utf-8?B?a1hHNUtEMnZ4ZVVSWS95N29YU2RFaEV5VFZUdXZKTTR4YXFHeENwTm1mWE1C?=
 =?utf-8?B?bmhYem9FcUVYQmtUTmc3SG00bVBEQ0xaUzRva0JHaFRYQUw3YzRieFJMeUVw?=
 =?utf-8?B?aXdNb2sxbXVRbk45eWM5Q0VaS08yWUFvR1N0YnFrb1c2ZzBDVlZYelBhWjBx?=
 =?utf-8?B?N0NWeXlPaVVLWlZQdVBqbFcvVzIzdFFHcTB1NUNOajViN244V2RPMWdjMC9u?=
 =?utf-8?B?dkc3amlHcnNORE9jNC9BS3hLQ1dUNWIyY3h2RHl3cVVWRXRSTDlST1F6aTdU?=
 =?utf-8?B?eFkvTHFyZ1Y1Yzl3UWZjSytwUDM5NlZvbHI1SU9JQlJ6VjFjQ1h2Mmg3VXpL?=
 =?utf-8?B?WUx6NVo3QlBldWE1c2htZURhTXd6ZU5FWTlwcWN2dmIxZW1aWmZIQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f349ad-f6cd-4d86-daae-08de4f28fa0c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 02:44:14.9169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2o9RrsTq6PfYrMGx+VgUTnPoZ7sBjT3j/HgjhCKG4tlaeGLGLdnjIgJ+zB1GHq/j4CBrYlvT4MZdTiibRfiWZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF9FBA0498D
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


On 20-12-2025 13:06, Raag Jadav wrote:
> We've been historically ignoring GT resume failure. Since the function
> can return error, handle it properly.
>
> v2: Bring up display before bailing (Matt Roper, Rodrigo)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4390ba69610d..559cf5490ac0 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -260,10 +260,19 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_irq_resume(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_resume(gt);
> +		if (err)
> +			break;

GT and SAMedia are different entities (even if both are treated as GTs 
in software), should we not continue attempting to resume the remaining 
GT even if resuming first one fails.

Thanks,
Badal

> +	}
>   
> +	/*
> +	 * Try to bring up display before bailing from GT resume failure,
> +	 * so we don't leave the user clueless with a blank screen.
> +	 */
>   	xe_display_pm_resume(xe);
> +	if (err)
> +		goto err;
>   
>   	err = xe_bo_restore_late(xe);
>   	if (err)
> @@ -656,10 +665,19 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_irq_resume(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> +		if (err)
> +			break;
> +	}
>   
> +	/*
> +	 * Try to bring up display before bailing from GT resume failure,
> +	 * so we don't leave the user clueless with a blank screen.
> +	 */
>   	xe_display_pm_runtime_resume(xe);
> +	if (err)
> +		goto out;
>   
>   	if (xe->d3cold.allowed) {
>   		err = xe_bo_restore_late(xe);
