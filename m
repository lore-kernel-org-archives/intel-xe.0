Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5931C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 18:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670AC10E03A;
	Wed, 12 Jun 2024 18:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzIQRMwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E8910E03A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718216453; x=1749752453;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=UwrbWd/y+MAFzHfRV4a9EYgxX1k6mxzF4ldp51tr5wU=;
 b=bzIQRMwOmNVxZNlaj5736UMSWTaPtW+Bsi9/A4TjAwHhEmx1egwSmqdT
 tHD8pv8wh2doIlMJfdkHvElMgGcDYRXQLve4BMTZRgQTnkt217h5E0OhU
 MroVkgfUVImkSQyIT+oZISjJRFHMOx1F9Xr2Rkanij3oA0KWN4Ng29jM9
 IYsk9q7OfXrY1fIYAfUxT7msTijST7Jr2YaqDQHjZKoWbK9CQ1ImcT2N9
 nzwPhw0L9xFqhZYLBGhf1kHlx/lD1TsdD/mpADYkABHCYm1D2PWe+l24q
 VwMkPNDSVMVOuAK5/Ryq9BOklj6jSbKkIH3v4R1LRKNYut1q9UCQBwXU8 w==;
X-CSE-ConnectionGUID: rLV8/5VyTHeyOeerBoxaUg==
X-CSE-MsgGUID: 3yE6rhDRS0muRki8eAiHxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="40406220"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40406220"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 11:20:52 -0700
X-CSE-ConnectionGUID: EAvHlqTPSYirDH5BUpSoug==
X-CSE-MsgGUID: 2bsteIFXQmiyW9VQFPgDcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="71068818"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 11:20:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 11:20:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 11:20:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 11:20:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaQEv0Qw1avU95IPZDu3YOhlzZSuBinjVQM6yZHV6j2ilnXH2aHHt9vXdozvVkZkU1JnMkhLm2Cmmr9D9YeQ4jeXmHLGUsmsxe9PImZe5lKVNHCSUk79zv65i5uJOu4jYE+O+sEBowsB+0IUD0zPZxWiztdzMGi2SmjwXa+AFeXUNChHS8yI17rl4a2/78+7OXdAN1BfsY4cxu9JDDmmWYFCMJg3kW0nl2HnrLmOW9cMSp4fLaCvmvjmJ1NajqI74xxr3hsXF4vSbi2qoWRRusBFhSMCw6Ni9uWnk6aC7Gj0u71HzfAcmeA/GZREdTWnC7s8F6v3xc283OOAE8pk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryiP7Koc+QaHirAOQd0wuStJmqSi/sN+mjXZtvuNyDM=;
 b=l62FsKzLIVSGDf3cS1Rl5i/JUcpy+jhOCyq328HtDzdUX7h9q+c+jwj0Z6eOhEC/O33UC1u6b11P3BzBQINE95UG79TSjEPzfOfCBUaGviTDbzy9TW1FEl9eXw08zxwmadO9mIgYwddyFrRoy6fOh+pYY2cJ29sIykcSp4U1Y1Wlpm7N36MAXDagLgnrlbR96ysp2fSVGzoIt/s8PFkwWbGhhbFQ19pnaU/m+rHymuOP2jYY4gJi82r5Szk7Q3QhMny6KefbXGbItGwEgoA7qVKLLyePM98TtTIJq+jem/Ryl7L0txybXiDXDMykW88o3SXW76qmahY8nSfDRbBI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7515.namprd11.prod.outlook.com (2603:10b6:510:278::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 18:20:44 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 18:20:41 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Wed, 12 Jun 2024 14:20:38 -0400
Message-ID: <20240612182038.249360-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0039.prod.exchangelabs.com (2603:10b6:a03:94::16)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: a2724b9f-b7a3-4606-7f29-08dc8b0c5e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3NoejJXRUhYWDIxUjlJVThIdGpUQXFIWnVzUlJQYm5RUm9UUGtzbjNaWFBj?=
 =?utf-8?B?NFpsdUl0Yk1HQ29JeVBnUUZ2YlcxSUN5cSt0d0ZmY2g1U0ZIaVlpYlRBby9u?=
 =?utf-8?B?eEc0WlE4OXRPczJWWDV5dWdMczk5eFJuU3ZCRnNRUzBDTS9WM1kyODZrd3RS?=
 =?utf-8?B?bDBVc2lYSE52U1RxR2lXT3pZZ2lHTmdxZnMvRThZZk15MGZRVEhBMXl2ckt1?=
 =?utf-8?B?VXNYQnZqYnJURGszc1orVkxtZmpoeUJGMTBQczlEdDdROGFySkErMUxCckQ1?=
 =?utf-8?B?QWpXR0kwSUNieTFXOVVoUnFvVCtrWnIydVU0QlV5WXNzSDluc1ZPQTM4R3RI?=
 =?utf-8?B?ZFJERW12WjZ1T0VodHF3T1RZdmtOZU5uaTRmUSszRWUwN2NvNGFPZ2kxYWIv?=
 =?utf-8?B?NnNsT2tISXhLZW5ERU5OUEdNUTFBQi9XZjNIRVhicVBZQUZ2VUFYZWpEVWtU?=
 =?utf-8?B?aGU3KzVyQnB5Z0UrRklJajFXZDQ0YVRmSCsvMHhDOXU3emswbVo5ZjQrQk1C?=
 =?utf-8?B?MDgvMUh3WjBiaG9xb1JsMUYxTS95STlwdUY2ZDVrWXRNeUcyVzg4L1dYaGxw?=
 =?utf-8?B?ZjRENVVWMUdBYitHVFlxUXJHNVZENm9NSTIyNS92TU0rUVB5TWlvTGRnZ1NJ?=
 =?utf-8?B?cVZaRWhDZXFQVXV2SEJpWGFMcUVzem5hN2hXZU10TmFJeG5GaW5iZEhFRXcy?=
 =?utf-8?B?WGpYSTk1Si9KODQ3MGJKVnZjTjRuR1RFNW5NRk94UkxldkVwV1YwdGxxV3o4?=
 =?utf-8?B?K05XS3R5RlNZdHdFS3RlbStzTnBXelFVa1pRM01RNHJKQWZ2cGU0b09ZbjJr?=
 =?utf-8?B?ZWtXa2hXdEtQbXFoV3M1ZmRjUmxjTTQwaHpFRVVWT0VzQVdHTktKYk15QTFp?=
 =?utf-8?B?bW5Xc0tYVUkxWkk2c3dOTGFsTm9lTWVxeUIrTVhWeGo3M2g4ZFVYbGVGaDQz?=
 =?utf-8?B?WmZVOGdHcHUzZGNxb24xblczcERRem5UMWg1OG1XMCtwMitUbFBtMGRtMWg2?=
 =?utf-8?B?OVRIVXNtT1lNWVBuUE9vdXdRamhzUzlTalZuUHJuVEpac2s1NzFhdVQyNHV1?=
 =?utf-8?B?TjF6REhwTHBhWFg3VWVyRTYzWEV6RUk4cUF5aVZmSWl0Q2tUcWJPYTV3M1dm?=
 =?utf-8?B?Q1BERnhMa3IzdjdGZXNaZEYxckNxTU1SNDgvb2M5TnFhczk2UER1Ym5iQUJT?=
 =?utf-8?B?ckZBUmUzQjJEUnVGcVFKbEsydVpBK00yb1RYa09yWFlKVDh5UFVDbzNKSGQ4?=
 =?utf-8?B?Q2N2clprQUh1d1cvV2ZHejhIMEtWTWc3VUMxcThhbGxGeEN1VGsxQjhEbU9H?=
 =?utf-8?B?WXdOY0RMcjBNZXhkUHBSdnhDTG1EVVVUb1JFNDl2dDRiMk5RbTZDbUFsRHlE?=
 =?utf-8?B?ZWZGVkI1OVpqZTIyQVNVdis2VFZtVWpVUEpYaytmbHU2VmZPUitxZnhUS0VS?=
 =?utf-8?B?Z2xQdDdIWCtzczJvdWMwZjhsb2VyTG1ldnZQenVyYzJnL2llUEZYVEFqdW9i?=
 =?utf-8?B?QVJmYi81SFhYRTJOS29lWWdyTndWOG5aNFFpQi9kR21JSnNzQzUvb1d6eU45?=
 =?utf-8?B?UkJYRlQyYjZ0Q0hjWnJETGtGQitxVkJMZXp0MytZNVZyM1k3WHZNS0NTbFND?=
 =?utf-8?B?TU9BYWQ4VENlcGlCWXFSMmZUR29hMWMwa2FkK3ovaFJQTmp5bGRJRG1ONVkz?=
 =?utf-8?B?M0RpNjZNM1lnRWVLeHVMWWo3a3U3YTNaRlNCUzRrV1NKWXdFa25pN3ljL1ZX?=
 =?utf-8?Q?pq1ZBiEnIGVkTEhr4aXEyi/5j2Vs+JGEu6cZS9j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRPcVgxcHlwNDBFZGtnUEk3azh5Y0tZVXM1TWFMUjBlQktmdkpVZUtnZEFp?=
 =?utf-8?B?UUR2OWdNcmprV0xMY3c4N0JxSVFvQ1JpUmhOaXhFWUdrVDgraWlOUitwMnM5?=
 =?utf-8?B?ZEVwU0kvcWV4eVhKV3ZRVzhxR0U5RGF4TGVNWFNVSnZodFMwSmZ3dGFRTXBN?=
 =?utf-8?B?R3hIM0pLNVBWL1JrYVR0bVVDNllEeGRPWVdEMnZjTDN1MjRrOXFLY1d4T2Vn?=
 =?utf-8?B?TnpUUk90NUNSQTY5a3Rjd1hZZ3d2T2t1RXM5eTFHSzRWTTZIQzBLK1Y2VGpQ?=
 =?utf-8?B?a0RROUw3SnZ1Q3RwZ0dzNVJsM0I5YjhPbnpEckJSdFJ2Tm01SElpTFFERzBj?=
 =?utf-8?B?ZWovMzZLeTU1SURjb2xsTFdQMVBLbFg3NmNOSDhZQWFsdFp4WDBSTFF4aURl?=
 =?utf-8?B?cmEyVkc3WXRnbjRtWGFieWxmV3FCM3Btdjl3VVkrRFZIc3F0M3grUFI1TGJq?=
 =?utf-8?B?VURhWkJZTnRsRy9PM3pJR285T205ZDRhZGpuSWxqR2dxVENWZ1NhUlIzS1Zt?=
 =?utf-8?B?OGFBdlJ6VXY1bE13a0NSRXptT28xaU1jdjI1cjcxbGY1ejJ5aUIvdUVRbXRO?=
 =?utf-8?B?T0hpNWxyNUJWVCt5aXpyblZFRXVHNmlreVA1WjNTTDNXRzgyT1h1ZXE4TDlF?=
 =?utf-8?B?dURLMyszZUE2TzZsS3Z1U214Z1AwcEtFZytoRjhTU1R6S3hsUHpTNWIxcVpV?=
 =?utf-8?B?b3dWWWdrN1RmWXlsY2lPdjgvZVNTVUU5T0ovM29YZlgvWVpPd1lvb0ZmTEdn?=
 =?utf-8?B?amtVRmEwUzFtOHpEanA2ODcwajErSGM0Ukw5dFVscnFSOXdjbnhxTCtkeWZ0?=
 =?utf-8?B?VjAvdVo3MTRZUFByYWJXKzdmdjArQ08rdUp0NFpSb1pGbkk5anRoSXpkSzlH?=
 =?utf-8?B?RFRJWnl0OEQ0WkRTNGc3U3hEVEJuUGtDN2l4M3NFUzh3emxnNDRZbDAyN0kz?=
 =?utf-8?B?RVVPTjlYRld3aCtYZTZwczJLeDA2VlZHbEV2UTBYNFNTUlBOK1I0R09GRDZM?=
 =?utf-8?B?N2tGOWlidjBaMkprWHpZa0c5SWhEN3crR2dhZUpZTVJ2YWoxR2tVdU9aYWJM?=
 =?utf-8?B?by9VdjRKSGkxYlhUNkpwYTYra2ljQjZ4ekpSNG13Njh0VHh6ZFpEdDZnVkxy?=
 =?utf-8?B?QnROT2pWTmQ3UWJLaXYxTnpMblgrekMzaEpkSHlMdm9tdGtmeWVMWkpNMXFy?=
 =?utf-8?B?SE9DNnlnRUFYMTBqN2VJbzJ6TzdhL0JKUkI4TEZEYWxNQ2djOTNTN2VYdngx?=
 =?utf-8?B?aEROU1czLzNEZzRuN1hKbUxFZGphVGYyRFlGY3pXem91R3NTc0xTTUsraWFN?=
 =?utf-8?B?RE5TNEpGcml0MTQyd0JJdjZucEhkTFlxR2dhUUtCTk1qN1BoYUF1VUFxVVAv?=
 =?utf-8?B?MmRmeTF3UWQyejIvV3V1ZG1RUDlNWHBwb2pIeFNKL1dSUTJBVDU4MVVqTWtP?=
 =?utf-8?B?cE9tYjRDNG0rYVphYlNhNG1ra2s3a0tXV1IrTjZDQUwvTnZIVFFlUUY1QmNQ?=
 =?utf-8?B?L2dsdHJCZGxxcXN6anhxQVM5Wk1sRzNRZW80blVPRUJhRnpVam43S0N4L3I2?=
 =?utf-8?B?ajA0RjFxVzdUc1paSVREWVlGejdmS25jaExQZGtLWGpKNjN0dm9rQ2d6azA2?=
 =?utf-8?B?QXpOYTJISWE3WHVVeW84T2ExMzZtSUVvYi9wQmQrR2FlVmtJb1RKdXl4c1RK?=
 =?utf-8?B?VGdoRjV2eGVra2crQU9KamRzbHpaM01pZjczZE5nOW5vUUtRYlhoektrVG9j?=
 =?utf-8?B?NDFpN0VkZGlncHhBdVRLNUVOUkQ5akFLTThpNXJ2eVh1cUs3dTNLb2NURjdi?=
 =?utf-8?B?U0VSMC91UXM0SENlM2xHRTBERkZDYklDVUFDQWdVdWZ6cXBXWFl1N1NJRFZu?=
 =?utf-8?B?TFBLSGhUZGZpWW13S2NYc3BBM3N2QitpM1F4U0dldERPZC9SR0xIMWpzcFdG?=
 =?utf-8?B?R0ZGdk8xVHkvZW50aENWdXoyVTV4YzdMd1Rja2xVRm1CWjhGaTZWQXViTHdy?=
 =?utf-8?B?RDRndXpIYzlFeFFYKzFiWU44WUhsSnk4VWRmelUvaW1tUTN6eFk3QlFCZ2hB?=
 =?utf-8?B?aG1XTW1kK0xta1J0ZFJta3FmYmdacUc4dzRSUW82OXZuS3IzSWxYeUlBRGx5?=
 =?utf-8?B?UlVoWjNCUGpNYVRjWmVVejMvSDc3QTg3dTJoRGl5MmhXby9yWjNSVUpWNWxx?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2724b9f-b7a3-4606-7f29-08dc8b0c5e0d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 18:20:41.5912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkQNl9XV+sOGEDmSdoLREgH9YL61R3tKqevYR7lr297ByiifKp8Wh5QF5d44Egpfv3DnWhWddbYoScg1qFHLhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7515
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Matt)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Matt)

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  10 +--
 drivers/gpu/drm/xe/xe_bo.c             |   2 +-
 drivers/gpu/drm/xe/xe_bo.h             |   6 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c           | 113 +++++++++++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h     |  21 +++++
 7 files changed, 112 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a2f417209124..b54d8850463a 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -153,7 +153,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	}
 
 	vma->dpt = dpt;
-	vma->node = dpt->ggtt_node;
+	vma->node = dpt->ggtt_region.node;
 	return 0;
 }
 
@@ -203,8 +203,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
-		vma->node = bo->ggtt_node;
+	if (bo->ggtt_region.node.size && view->type == I915_GTT_VIEW_NORMAL) {
+		vma->node = bo->ggtt_region.node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
@@ -322,8 +322,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.start != vma->node.start)
+	else if (!drm_mm_node_allocated(&vma->bo->ggtt_region.node) ||
+		 vma->bo->ggtt_region.node.start != vma->node.start)
 		xe_ggtt_remove_node(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bae01ce4e5b..c807c0fe8d4a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1072,7 +1072,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.size)
+	if (bo->ggtt_region.node.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..79e77dac48f3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
-	return bo->ggtt_node.start;
+	XE_WARN_ON(bo->ggtt_region.node.size > bo->size);
+	XE_WARN_ON(bo->ggtt_region.node.start + bo->ggtt_region.node.size > (1ull << 32));
+	return bo->ggtt_region.node.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 86422e113d39..d905fa5e1b52 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -14,6 +14,8 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "xe_ggtt_types.h"
+
 struct xe_device;
 struct xe_vm;
 
@@ -38,8 +40,8 @@ struct xe_bo {
 	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
-	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct drm_mm_node ggtt_node;
+	/** @ggtt_region: GGTT region node if this BO is mapped in the GGTT */
+	struct xe_ggtt_region ggtt_region;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ff91fd1b7c8..5f7c335020ce 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -389,7 +389,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.start;
+	u64 start = bo->ggtt_region.node.start;
 	u64 offset, pte;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
@@ -398,6 +398,75 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	}
 }
 
+static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->start, node->size);
+	drm_mm_remove_node(node);
+	node->size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		return;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+}
+
+static void ggtt_remove_node_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(work,
+							  typeof(*ggtt_region),
+							  delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_remove_node(ggtt_region->ggtt, &ggtt_region->node,
+			 ggtt_region->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+static void ggtt_queue_remove_node(struct drm_mm_node *node, bool invalidate)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(node,
+							  typeof(*ggtt_region),
+							  node);
+	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
+
+	ggtt_region->delayed_removal.invalidate = invalidate;
+	queue_work(xe->unordered_wq, &ggtt_region->delayed_removal.work);
+}
+
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_remove_node(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		ggtt_queue_remove_node(node, invalidate);
+	}
+}
+
+static void ggtt_region_init(struct xe_ggtt *ggtt,
+			     struct xe_ggtt_region *ggtt_region)
+{
+	INIT_WORK(&ggtt_region->delayed_removal.work, ggtt_remove_node_work_func);
+	ggtt_region->ggtt = ggtt;
+}
+
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
@@ -407,9 +476,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (XE_WARN_ON(bo->ggtt_region.node.size)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_region.node.size == bo->size);
 		return 0;
 	}
 
@@ -417,9 +486,11 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
+	ggtt_region_init(ggtt, &bo->ggtt_region);
+
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_region.node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
@@ -443,43 +514,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->start, node->size);
-	drm_mm_remove_node(node);
-	node->size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (XE_WARN_ON(!bo->ggtt_region.node.size))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_region.node.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_remove_node(ggtt, &bo->ggtt_region.node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 4a41a1762358..75511b5f43eb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -30,7 +30,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d8c584d9a8c3..bea66aa0d843 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -36,4 +36,25 @@ struct xe_ggtt {
 	struct drm_mm mm;
 };
 
+/**
+ * struct xe_ggtt_region - GGTT region node
+ * It needs to be initialized before the drm_mm_node insertion in the GGTT.
+ */
+struct xe_ggtt_region {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
+	/** @node: The drm_mm_node itself */
+	struct drm_mm_node node;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
+};
+
 #endif
-- 
2.45.1

