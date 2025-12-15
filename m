Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CD6D5B17D
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 15:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC59310E556;
	Mon, 15 Dec 2025 15:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Syc8vovP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D1410E556
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765811555; x=1797347555;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TrINTfvS+JB7v+W+mUw7FPUfYQu9/6yWIUszN42KWk8=;
 b=Syc8vovPP5i+viwbEAQ7BeqEv1WburFoQ9v3evTy2bhb6xXD/XqzYfTS
 rfrITLt6DoalCT+pARxsZdBxCv7plf1/HO4TKhd1XT/Nk3oUY312GdLlQ
 T49Gg8YjXG+Gbban808G0q/SzFv9sbeV8Ggx/IPqy43691QTi4G62Qv0w
 PXnqaNTgcusFw90S3nLOkNnuAF+QSliesumr6qRREPXCl4rqf+F6tndIc
 hE00D563UH+pw7lCbfvC8BXjDpDBg/csuYi1sCmLlL62SytODg9Bi3fKo
 aA0ycLuN4C41NfqVE+yGZDD2fl6IWvg40xO8ubPEXRGrwxe54zxhGL5H6 A==;
X-CSE-ConnectionGUID: OW3y4TbVQKS27xEfwE+mWw==
X-CSE-MsgGUID: v9o/yrCnRviu2rhcP3JXtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71347581"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="71347581"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:12:35 -0800
X-CSE-ConnectionGUID: tM12LVCwQpGy7F0SK99+KA==
X-CSE-MsgGUID: lunYNSghQuqtcrer2+DrQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="221123039"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:12:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 07:12:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 07:12:34 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 07:12:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4RufP141P5hTHtmQj9dvtdcmQGmZXoWVPWfDldSA4HtWt2OhDH+aaIU8OKFTl9n1sI6Fc++0zQTm+FwA0DEGTzGV5EndfADpaqyJ1jhsJ0gWREj4tRfSM0eMVFLaBQ8iukAanA2LLGcJP2uJMPjW21vPiQ37CQRXhLBijZKqFtKBqVJYG0pdvWb0iYFud0nuseaCvMEHBji7CJGeZRMROBsdAzSKIJ4EbtcBFeHCpRETfGE+4jvqMtZh/tlhFQnXCiSCr8Hsr0lEp2qRg3v+9TPegRSrz1s6jJQJU+J2XLT7d0lHMHWDNpghIxrbdhU+knci64AUOHxb+8Zsin9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kEHKAXtZWt9B/1Cr8k9yKYR/z9z8AXUMyQaYQxDYso=;
 b=yfj6GLYdUzY+tCZ9SySJVeqgy/EeTpC2tcSL67TXE3GyFKSVUE3E+M22bT89WL0/Zia8N7a7a+nEH0zIErd28Ww5stsPR3OLommEGFgdI/5JE8kfbVHJN73jccKR5dLWXJY3bzg9PLaBHCYkjgYM0U9TnuGI7w9yzTMHTgIsNBR3xs1F72/0I0xDKqNmcmBffBZ2um92xC+J7kpcfhiZTyrGynANhVxKEb5m88gW+I3U2yuwTZuhu4wMnGqmuwass5ouDzwoC80yv/DwDkHCtemSt5yEeJT68PEk0VJTqDTu1mawAxnpxNgag7V6h2rUc13HMmNdkMXBdmF7kAwxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA0PR11MB7281.namprd11.prod.outlook.com (2603:10b6:208:43b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:12:30 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:12:30 +0000
Message-ID: <2a983e61-78aa-4636-8680-00971e5bc38c@intel.com>
Date: Mon, 15 Dec 2025 20:42:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/xe/hwmon: Read thermal sensors count
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20251210062301.4080549-1-karthik.poosa@intel.com>
 <20251210062301.4080549-5-karthik.poosa@intel.com>
 <fd96fa00-cb6d-46c3-928e-9a5d5c08122f@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <fd96fa00-cb6d-46c3-928e-9a5d5c08122f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0102.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::6) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA0PR11MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: cba2d215-c2f8-48a4-3234-08de3bec5d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDN3a2lURVZCYlcyRG01ZmxlRU1lVFMzWGpoVnhWeWM2Mnk4RzlTOVF6K3hQ?=
 =?utf-8?B?VHdsWjROZDBtalZ2YUZ2TTdvclQ4bVBBVU5mTXQ2V0hsRlNoRDZQOUlmdjBs?=
 =?utf-8?B?MHlsODlTcDJoNHRIenhIdUFMbkZNY1lyZzN0R1BpVDNNWUtTY29pUDRlUFg5?=
 =?utf-8?B?ak9CbVN0dFZaVTFUbll4NXBWVU5IUTBiTFpibVdjQWZqSlczeEUxa2pyOVcr?=
 =?utf-8?B?V2tHaEE1MUJvNDVMUmhaWEtpV3k1WXN4Yk9sM3B1aXBvNVltSlFRNTZPM0hl?=
 =?utf-8?B?d1k4TU0zSWpjMmsxR0Z5b3R4VHpKdE1QOUlOdVRsMnNWc2p6MDJURUZiVkx5?=
 =?utf-8?B?YU1lK3FqT0ZFa0doVGt4Mkl4dFRRcFUwUmlvekZtTm8vUElPNHJrMHRLOUdQ?=
 =?utf-8?B?LzlrNVJSRVM4OWlDZFlDbnlYT3k0aFNOd0thMXY0TTRqVCtkcVo3UXpJNUhj?=
 =?utf-8?B?WmhoOVlscXR4M1huQWpucTdodS9LUHg3a0E2SDhxRDJ2MExkbStMNzVsdDZi?=
 =?utf-8?B?dEd2Y08vWmJpaWh5dFNsTEFFNkU1VnZvaTFTVG80NmdRLy9IakdhNjhRNGx6?=
 =?utf-8?B?MTF0a1ZpZGx1cnRJYjlWa0dTSmUrZ2xXd1BGSXBCcXdLeloxc0g1ck9DRHVG?=
 =?utf-8?B?aTZDVE4vSG0ybnN2bkMvaC9sTjMzMEp4d1Rkc1AySUN1NXBWcExoQlppSDgy?=
 =?utf-8?B?Y1V6emR3ZmNld20rWHM0a0F3WWZqVzBDUkVDaDBaZGtqTDlpTSs2Yjd5VS91?=
 =?utf-8?B?ZUJEcThqM1J5eC8rRHY1SXArNEJGVzUzNTlJZnlwaTVTWndPeHNaaEZrbmRX?=
 =?utf-8?B?L2FYWmd4UG12ZXhiQVk2akFGalpNN1ZIWFIyMk8wYTdwbG9OcVo2bVViUlZp?=
 =?utf-8?B?TUFQS2R4OWZhalZhSWxBOVYvdlBpalR3VVREWXptWFNuNlNFVzhQZHZ3alJw?=
 =?utf-8?B?QmE5SHFKc1BiSGVnbWt5VmczMjluRnJjaEtDcndNL3pRMm9WZk84YjRWMVMr?=
 =?utf-8?B?aDBQczRxSU9tb2VDWnpkZGljalVPbTIwRzZBYm5OYUYwQTE4VVVyRkEyOTl5?=
 =?utf-8?B?b1RMSVFkMWRJc1I4SmZRVkc3TWJVWFd6RWZZWTZUS3NWSmVKeUl4LzhDM2l0?=
 =?utf-8?B?ZVcvdkxGNHh0M01RL29aVW82aUtBNndKRFhaSnJETjk2MHlnWXFlL1lybHZI?=
 =?utf-8?B?VDRkUE5tM3doVmp3aWhvV1ZqT3FRZjRBdGt1VE1wRjFmTmRMZ3JLYzA2cGR5?=
 =?utf-8?B?djhOcno3d2dOQ2pBajFmdHVZQWc2Njg5Q1NRZVprN1R3cGpLUzYvQmNYRld3?=
 =?utf-8?B?OFBVOEF1cCtOVi9tRzJDY0prSFBOZzdFV204aDJtVXRRTm1BZzZGQnBMWDZH?=
 =?utf-8?B?M2xwZnJRMURkTkI3QXIvZWp1T0JqbWthTFNFbno0UnNweTlZMG5Bc3dyckgx?=
 =?utf-8?B?TjVFQTlMUmdpTGFBbHE3UXIybXBKVkJ2NTJpbEY0VmFGL3pKT2hLTUlveXlL?=
 =?utf-8?B?OFduM0tVTVN4U01DUWg1WTFFaFdWSTVKQ1NEemN6aTV3eEJqVDlNY0xQQjlW?=
 =?utf-8?B?QWpYeFpyUUtkM2RNbno2TmJGcHRUZ3R3ZCszallxK2tka2hDS0paYVZ5eVVJ?=
 =?utf-8?B?a3Z2WlpUODNwMStzNUNaT2d6T3NNaFRnaVdqKzAwWVc4MEw1L1JyYyt2VmRW?=
 =?utf-8?B?V281Zm5Qai9qWFNHM0c3WFRURk5QZkhXMFFCelhPbmFHS1lJSzB0cjVqWHB5?=
 =?utf-8?B?YitjTlBpU1RqQUZ4SnM0bHlsTmFxN09hcE5OdVpRbmIycDNrOFZweForeXRD?=
 =?utf-8?B?aEJpeEJoTG4vL2U0aDlHbTJqRFhndlZ4b3F5aUpyZVR2dlcrKzJaSWZXbUVG?=
 =?utf-8?B?UjlvcTlRWXh3WnQ2YXM3Sks3SjFUaENpcUluMkJDdThUdmdvcWYxWmJrcjhv?=
 =?utf-8?Q?VPzihpqSEC1k9JFYBFAwXL2IPMdgOqbN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDhKOGNQRzVjLzUzOFNTN3pNUFgrcXJNTmhpRGRzM1NkTjlveW9xMmJFY002?=
 =?utf-8?B?VGV3M0daRm96bEVyUnh1T1JIQjJwU1Q5aTdLNjVYdEg4ZlQrNkxjTWZvTGxq?=
 =?utf-8?B?RHB4K3FIeDJVL25qZ3FFc21HUlVvMUFkRW9POFhpNm5DWnFJcTBMM3FycGJS?=
 =?utf-8?B?d25HU1E1c2FvdWg2YlhHajdBNmpTZjcvNnkxdWN5bE82eVVYSTVyQWNCZVJ3?=
 =?utf-8?B?MjA2djAyMDNrTHJlQlVDc1JCbURSdU1mekpQR3hWdkpBV3o3V1RzTlJGbm9u?=
 =?utf-8?B?M2lIdk00N0hac2hpQjFUcDN5YW8wdXNKLzQ0TjJ5cVlJRVhsaFo5YjJ1Yy9r?=
 =?utf-8?B?em1ubm9sZXVvcmlxOWp2bmtsQjZNRGVDTHVnK1ZIby9nSmVMNGVTOW9QeU9l?=
 =?utf-8?B?QjJrZHdzeXJGOGtVMUt2c3lERGxiR1piYStJZktKR2FsY1hrRitnNEYyVzEy?=
 =?utf-8?B?QkFJU3N4a3cxdkdTeWxZem1laExUYnQ0bll2WVBtL3hiTEd3UVNMVHJ4SmJs?=
 =?utf-8?B?cnZicXVQa1ZSaFNMVi96bitKR0k4dUVPZDN6eEJFaWQ3LzFmVDEraDFuTFJp?=
 =?utf-8?B?TndjYmo0RmhHRDM0QVYvRGNLZzQ5b25saFl4YzF6OHFJR1U2YmZhbGNWb2cz?=
 =?utf-8?B?ZzNFRGR1dkJBRTg2SStRbklBeis3dzJONzluVDNuWFk5b2xiWTRmSEZScm5t?=
 =?utf-8?B?LzB1dVdEQkI2TWVQRDlMbk92NGNWR2JtcmdYanJLcTc4dGdYMGpJVEJ1MURi?=
 =?utf-8?B?a0dHdG4xRDAyQUk1UGo0dE1RMnllcFJJeXZtY1BJMmFRYkxZVWNIc0wyeit3?=
 =?utf-8?B?SWxqczJqdVM4bktrTHRMSm1YLzBkd0RXQ05rTWMrQ3RVS09SVlFhWUZjc2hR?=
 =?utf-8?B?M3VQL0xYOGZkYm1VUmhjdWNtSHJhV1VxcytZMGkzZW9KVnk0dnhwRXFQSit5?=
 =?utf-8?B?VXEzOHVjSUc0eFByY2pVTVBCbCtGQkVULzNrV3M3UVdKRDY5WHZpc1BYRzYv?=
 =?utf-8?B?aHlPQVFzRkxXRTI0SkdRM0k5eCtwKzZHVEdZTVZWczFWZGIxL3J2Mi9Jc3hL?=
 =?utf-8?B?czhQVFdSK1JxQ29jSnVYRHlKYTRSYm5xWUNoZGxqU1NqQ3BKWFRxYXdmVFFE?=
 =?utf-8?B?bDVIcEZyR3hNMHorTEs4bDZQQWZ5MGxVeGhzajhua090WjlNMGwxOTlLNUs5?=
 =?utf-8?B?YnMvRCt1OTU1VDZicXZVSW5sTzE4K2NjdXNrVG05TlhPVFp2ZjZuMTFBcFdY?=
 =?utf-8?B?SjVCRmFUYksxcnc3VEJKYS9KQitrNXNjTVo0U3ROMnpnb1QwQ0ZWRldSWDgv?=
 =?utf-8?B?OGlWVDE3YnhRT1hLQ2tKUTNpaHVxVEZUNDE4ODE1WHM5MWlGUEFWbkZxREZx?=
 =?utf-8?B?enZtekt6c1ZqOGF0UExQV3U5L3RZTTFidUhlWUZER0ZZTnE5WjBrNmVKMitW?=
 =?utf-8?B?TzR0U1gxRkVvcDNaeHZpZDUwMzBYUmxUMk5TTy96a25LaXEyZ0ZPRzlsRC8z?=
 =?utf-8?B?cnE3eEdwT3BsNDJ5dnhOSFBibStjKzNrUHE4L3JXM2VuUU5HUlJEZWVHSEVz?=
 =?utf-8?B?ZDNhSXd2Z3VaUzhSQ1o2WjN2QUgxU2pqdFgrcHVDM2dKNUhVVGlPOGNQMk45?=
 =?utf-8?B?dXhZVXd0bENzOGIvK2xybExva2hpQVRRMkV1TC9pN2dveWljdlBxcFZQYUVG?=
 =?utf-8?B?Wm9XdWlWMysvZWlrWnU5clk0MFdJUFMyZTloMXhHUVM5cFNUbnlrMlJleHdH?=
 =?utf-8?B?ZXFaN0hRMFRoOERVR0pqZDVNRnM1MjQ2Y0lwdTRvY08xUUN3ZkRxRDRxekNY?=
 =?utf-8?B?bFo0aDd3NHlHbTFOY1liOHAxVnVrVjhLeklMazNCRDNITzdEWXRqSW94UDFu?=
 =?utf-8?B?YlJFL082b0xJT2NtTmJmdjN2QTVHeVJJdlNQNGkybVFTR1hmVWtMUWZDQ0RM?=
 =?utf-8?B?K2JneENaT2Y2djVJMnBZR3UrOWlPbnJzMEQ5N29XbzcyYUhiSkpvT2FmWXoy?=
 =?utf-8?B?UjRRVkdRVVdWKzVOMmkwYXZWS0EwR1NTRFB4OGwrWTh4aGtyR1EzNmlpZVcz?=
 =?utf-8?B?TFZPSkxSQjRaMEx0a0NUNVY0Y21oZHZwWkIrQ3pwTVBlbWtLSjMwUTR5OVBK?=
 =?utf-8?Q?napK+9wXOpwYBjO8ILj92igzM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cba2d215-c2f8-48a4-3234-08de3bec5d6a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:12:30.2680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlAK4aSRmwB+V4LkBTn05i8xwm06vLLCKCJjl6NayCMHUgDwWm+jlCDWHY/QXuAZO5coNJXElkJI857y/vc+Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7281
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


On 11-12-2025 22:58, Nilawar, Badal wrote:
>
> On 10-12-2025 11:52, Karthik Poosa wrote:
>> Read number of thermal sensors available.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 28 ++++++++++++++++++++++++----
>>   1 file changed, 24 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index c4a200cc2c23..e843021d13ec 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -99,6 +99,11 @@ enum sensor_attr_power {
>>    */
>>   #define PL_WRITE_MBX_TIMEOUT_MS    (1)
>>   +/*
>> + * Number of thermal sensors.
>> + */
>> +#define MAX_THERMAL_SENSORS    (11)
>> +
>>   /**
>>    * struct xe_hwmon_energy_info - to accumulate energy
>>    */
>> @@ -126,9 +131,11 @@ struct xe_hwmon_thermal_info {
>>       union {
>>           /** @limits: temperatures limits */
>>           u8 limit[8];
>> -        /** @data: limits data dwords */
>> -        u32 data[2];
>> +        /** @dword: limit dwords */
>> +        u32 dword[2];
> Please maintain variable name consistent throughout the series.
>>       };
>> +    /** @count: no of temperature sensors */
>> +    u8 count;
>>   };
>>     /**
>> @@ -716,18 +723,31 @@ static int 
>> xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>       int ret = 0;
>> +    u32 val = 0;
>>         if (!hwmon->xe->info.has_mbx_power_limits)
>>           return -ENXIO;
>>         /* Read thermal info */
>>       ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, 
>> READ_THERMAL_LIMITS, 0),
>> -                &hwmon->temp.data[0], &hwmon->temp.data[1]);
>> +                &hwmon->temp.dword[0], &hwmon->temp.dword[1]);
>>       drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x 
>> val1 0x%x\n", ret,
>> -        hwmon->temp.data[0], hwmon->temp.data[1]);
>> +        hwmon->temp.dword[0], hwmon->temp.dword[1]);
>>       if (ret)
>>           return ret;
>>   +    /* Read thermal config */
>> +    ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, 
>> READ_THERMAL_CONFIG, 0),
>> +                &val, NULL);
>> +    drm_dbg(&hwmon->xe->drm, "thermal config read ret %d, count 
>> %d\n", ret, val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    hwmon->temp.count = val & TEMP_MASK;
>> +    if (hwmon->temp.count > MAX_THERMAL_SENSORS)
>
> Why this restriction?

Because we created the structure to hold sensor data of 
MAX_THERMAL_SENSORS only.

I think we can increase MAX_THERMAL_SENSORS to 255 as that is max count 
supported by thermal mailbox.

>> + drm_warn(&hwmon->xe->drm, "thermal config count %d exceeds 
>> supported limit %d\n",
>> +             hwmon->temp.count, MAX_THERMAL_SENSORS);
>> +
>>       return 0;
> I am seeing patch 5 is exposing avj of hwmon->temp.count sensors, so 
> could you please combine patch 4 and 5.
>
> Thanks,
> Badal
>
>>   }
