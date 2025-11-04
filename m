Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDF1CCFA07
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 16:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0630510E63F;
	Tue,  4 Nov 2025 16:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8vY3ilJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07D310E63E
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762274007; x=1793810007;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=i3ok+TTF8NncdYv054wtVERrbOnI1RY5t3hwDSFV3AA=;
 b=M8vY3ilJltTNbUkbDjwAVLEYwamaj7Z7sDrvtSdGxw09g1d+l2VDXxn+
 NK7n/2Dppke/sQcVLO4lTq4U7pGuqi81jdtAP+xxap6NdowaAbNYHgrrN
 ARzR9IBP/9Z0RtFkguZp6wP3sGpnKyo8VQYgHyQjjTShRX3KY/hNqBdE5
 p2KsD6ii8bqICd+uwiFZ8OMrzVaqv/3IwqETIg4/CpV8rmfl429A9V8Sx
 xKRMNo497Z1W4JoaROEvXrCcotqd+E0uBEmiKkxRSxjtNcKg9kV/v4glX
 A97rYZLz8uflOyH7Rf5MTC57z1yDUURHGekk2QG+Gb6O3MVhNoUFI3bTa g==;
X-CSE-ConnectionGUID: S0IPhb6bT76VroJ3CeC5Xg==
X-CSE-MsgGUID: 0RRrZ7pFRYO85KqkY4H7ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64405348"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64405348"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:33:26 -0800
X-CSE-ConnectionGUID: S058lE2nRnqTM3qwAbFBSA==
X-CSE-MsgGUID: a8HZNeETQ9Cg8O7ogofgog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186495388"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:33:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:33:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 08:33:25 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:33:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvvzufcgYFhZFpAPxNdoHt3ZQqCeo/VKv3PggdhSnnzeW/jib8tiVwHss0Ue8OWPsi4+l6E/nRecVpdacD0LLkKfH9KCFL7jegM/JQy1lFVboguLotXq1cGB1eOIb1LyNJKpvVwh3JeWfvD3Mlj6ZYIouf0z22/SIRpST/aY5hy0m2okfV6WhxR2u42E3oqsndDSfQWmxtQsgiU/uttONxjBAefFglv7hZJ+iyAaXonasKJwxzMXp5qMngcxiE/yo9MbodNWWwSuibVL0JODh7n6JDlosYjmO8Lj/Mu0LcFeYClvA8hGbnuMxz16IVv/rEmLZ1KZuoxgzkmQSI5rEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwlmxG/2yWDWUIdPUSswNZS8uZPJHu4FSPSUvjFQspE=;
 b=mHgLl7pJ1wBhZpILc8nveA+xaX7xv4EWif4cp5FZzUTsOmwvRzx+rKwtoqq3D3743hp1rrFJ8iA8MpLyS63XAH4Br7ZbVGTMcfRTbev3Q4K6uyZ4hlbq9c0zbJNLlrODFxyGqOLWoOcP1MlGDPYEkhztIBkhDLRdPsPh2HRW60VYWrdxhtA9dAeNM1eZISAHMiknSZxl0AXQF0RLVNr96V1WxYI0d/ujp4OPYsYEfX48C3rOcvTJd5sazq8DOCUj8dx3qn8UCgTjTN+z6/BTNfMFfx/yhrzbsckv1bjyZANJhKUyPMn1VL97ygkO/hoj6JcBLhTdLaD8AhpsfaqCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 4 Nov
 2025 16:33:23 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 16:33:23 +0000
Message-ID: <84fa5b89-61e7-4aec-ab17-5057f9c52d74@intel.com>
Date: Tue, 4 Nov 2025 11:33:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/uc: Add stop on hardware initialization error
To: <intel-xe@lists.freedesktop.org>
References: <20251028153820.3139977-1-zhanjun.dong@intel.com>
 <aQEgDjfMVDYELrWJ@lstrano-desk.jf.intel.com>
 <55e77810-bf9a-4914-9eec-8984d29684da@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <55e77810-bf9a-4914-9eec-8984d29684da@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:303:8e::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc07de4-a268-43df-8a18-08de1bbfded7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ak5scjlvKzZ3VC9IZnpoNnBBUzhWZGNFdU5zeEg5UUtsOXArZlQxdE81d2RH?=
 =?utf-8?B?UHNrVWlENklGQWxKL01Wbzd3RGlQZ1hyY3VlM0w1NHlRSzJKbXhreXZqUEE1?=
 =?utf-8?B?anhqbHNSOXpCZHhGV29QSnczRUtCU21GNkFqblA2Ui9sTEtWQTlVZ3BZQzhC?=
 =?utf-8?B?MzNyUXkvTGRsSk5HQlVpNllIdDVaYkpScmgyeExWYm9iVUpONW1jb2xJMDIz?=
 =?utf-8?B?ektoaWR6cWJzakVoL0VyOHRKcHF4MU15MllxNldZTjlPTk40dXMwWHhGQ0lN?=
 =?utf-8?B?eldRdlNBNWVtNG1xQ3R6ZGdMVnZVUWZwMUJOSkRJSEhDZEFBMngwZHVpOHZU?=
 =?utf-8?B?ZjcyVHRTZDRPdWR6b3pYZDlOVldNTk9EZ0JtWmd2NVNMNjI2ZVFLTHJlZXJK?=
 =?utf-8?B?ZFp2NHlFY3g2Z2ZQdWVvYWhwVWVJU0xyMDBSS1hRdmJOcWhCckxSL1VoMVAy?=
 =?utf-8?B?ZS9IMHdvNXk1ZDhEa2txcHdDNDhIQUZLRjNSMUxQYTBSckZybGZMSE91Tm9J?=
 =?utf-8?B?KzhPZjlzWVFMdUxIdWl4aEdLc1RZd3p3ZE16ellxV3plSUE2cmxJQ0c5YVJx?=
 =?utf-8?B?UnRNNm85MCtyN0xjREp4RWlpOWNrQ2dzbDlLL2NZY3NOMzVVYjYwOC9oY201?=
 =?utf-8?B?RUJKWlpRTHNGdkVZRWRRd2NyTWc5c01DNTdCcmswWk1sV0JHdTRTMG55Y2pJ?=
 =?utf-8?B?d2FyZVU0ZiswSWdyMnlERFJOT3ROSHBXZ1JuY011dEN1SlRTZjNBMEVhL0RC?=
 =?utf-8?B?cmgrd2dSSjBMVzdmT2tsR2JZMnJVQWpWd0draTVjVXlVZnZtM21KYVZvenE2?=
 =?utf-8?B?MVpJQU5IMWZCNzRnbmRjRVp0dXppT2U5L3B4MlIxOGNvL280eEZPWDdJeC96?=
 =?utf-8?B?cGhYaW1ZajlaN2J3ZnJHT0FWQVBkQ0Z6RFdYcDF1ekhOSUdXUHRVVU96TlZT?=
 =?utf-8?B?ZXRhOTNkVE1kT0RoTTd0WnBmWDNkN3VveHdOaHJsYTVDMGFkTFh2YTloNWMr?=
 =?utf-8?B?OVRwS3diSmQ1akJsUDFCVC8yL3BEMU8ybXFhclY5VmlJelIvNTZ4bVhTeVBS?=
 =?utf-8?B?TnhxMUVYRXAyWDRKdHlSdzFHVHVtcmMvOW1aOTV4WS85OVcxMFpTdld2b09q?=
 =?utf-8?B?NGllbkZYeGpjK1U5cDlwTURYVnJpR0pLZ3B1NnBEckt6L284emxQWTZSLzFo?=
 =?utf-8?B?cjdRYitGWTM3QUNFakIySHF2UGY0UjZVQVRnRTk2NTVTZGh3eU44ZVBlSmZI?=
 =?utf-8?B?ZHRxQjJTOUZ6L0hLUjczZnNqRHg1M0VzSGdoU3ZLb0Y3aFZxOTRmYStUcWFX?=
 =?utf-8?B?MUpXQ2FRbW1UNWxCWlJEWStmMHhYekxaaGNQQ3BPZzR0UjlWeks3aHRQMUVj?=
 =?utf-8?B?YUUwc2JncHhSWmtyS01MOFdXVVprejl4cWZ1QzJwUUpXUFdRd1F4K3A0ZCs2?=
 =?utf-8?B?dGQ1bDlpOG5yTmEvWC82WjZQREs1TjZLNzB0c2FlU3pWd3FZUXFaQUo1MTZm?=
 =?utf-8?B?dlluMmJ5V2liMkI1VEJDcmZCZXkrVXFPL2VyclNUY0RCWGxGRFBpd2JTUjBp?=
 =?utf-8?B?SnhtZGdBbjQ4bEM5aVVRUVFOYS96bVpyVXZXUldvbGZXeGRPY05xYVJTODQz?=
 =?utf-8?B?ZDh5QkcrazFLQkYybEJydzVlU3BZcEh2RGI2SnNtZUNVRFBqRVlWY3dvaUZq?=
 =?utf-8?B?YTBpZFVvYUV1b2xqZ1N0ZmFrUnZqaVlGM2JwRVJ2YS9JQU1rSVR6TUhoclNZ?=
 =?utf-8?B?NkViQ1FOYVpZRUV0TUZDNmY2azlTWEVtdTl2b1NmRHYxRHRBaHhoUjI2dmNM?=
 =?utf-8?B?Um5Yc0NVL0pJckxCYlNJL2ZraGNtc2RCSHBVOTZWTWIzTUMvZTFvKzVDUGpz?=
 =?utf-8?B?VkZWZkNXWEtVekphcTc4ekk3alltRjdBRSsvdG1aTkJ2b2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1QrVFViUmtpaGJwY1pHTWJWeWV5aUVJcCswdGRaZkFsamNGaFpwanpKa0pm?=
 =?utf-8?B?VElEdXlFNGlhUEVrUEp4R0p0aG5UZldjdHV2QkFxSldINE5vL1FsNitiUU44?=
 =?utf-8?B?ci9OZEF3aGk0RjNsS1dZdFd0c25RK3A0U2hxNVlKRGNYVjhrOXBSNVRiWlNr?=
 =?utf-8?B?bVZVZTM0QmhQcDBpOWh0Q2pFTmQzcHZEN0NHalp5d2IwNHc5dDZOL0NSenk3?=
 =?utf-8?B?S3Q1b1d6TWFaZU5yUjMzYkpRZjE3VkxXa20rRHpLQWM0TkJGNnUyMldGcVBI?=
 =?utf-8?B?M0JNYkMrckw0c0RUcVJwR3FUOXQwNjJ0NGsvdFp0dDJyTUU5c1RsYUN1b29S?=
 =?utf-8?B?eGM0TlI5MUhiTVZvYmVsVHVPY0hBRXpySVhSVkdDaG51OHdzdld4bm9jU2pJ?=
 =?utf-8?B?aUFYQjhSVEZGRlN0T0pKZ2V2ZHh6b2pvcHFtRDVySm5PTVY1cnhLTW1lNTBL?=
 =?utf-8?B?THphS2ZrbDRFTUxTdTlVK1JUbG1EMmdFSWIrZzNia0pQUWtyM1U4dzRMQ1FI?=
 =?utf-8?B?QWVMVnFoOXBrY2xxMXRXQlBkcmRLUWZhWW1GY0tnWkJFaURkLzBjOE1WUWVp?=
 =?utf-8?B?YmxGWEdLQy8rYzJYZXU2VlJadUZiLzY3MVl5RGNXWER2QnJDSUtRYVlOU1Rt?=
 =?utf-8?B?MjBadEJQdXJTaGtWUkJWUFFXT00zVzdMdTltU2VaWE9VbU1FOE9Cdm52cGdI?=
 =?utf-8?B?bllkUFpJWkZIRERlNXpmR0VvSE03c3p2TlNsYUQxeEo5eGdGNmdxKzVMZm5R?=
 =?utf-8?B?MmpxWHBXdVJpRFdndVpiMXUxTXowMXBsRGJZTzY5Vjh3YWl1WnpFWnhOUXBx?=
 =?utf-8?B?ZGRxdEVQYkZXR2ZxNUlrTHFtbDV4S1NackFySXNJUy80VDJtNTNqdGNDWHVX?=
 =?utf-8?B?aW9QZ0lHWVpBVXVKR0tHVCtiUUJUSVdON0NoY01SUjdCNUtQR2krZEZGTC9G?=
 =?utf-8?B?UUY0bXgzQWVIVS9TczZHMmRERXYyQUZnZHBURTAvZjdHUjJ2cFUyOVRvb2Y5?=
 =?utf-8?B?QllGeUhtYTA2bmtvaXMxYjV4SzJHTk4rY2RXK2gybjd4ZGtXMHlERFNJMWEy?=
 =?utf-8?B?UlJYbXNLRjVTdzN4U1lla3N5OGRYb2w3TEpFMlFNd0c0OVpzUXg1T0xyNmsz?=
 =?utf-8?B?Qnk3V09CNmdHMXl5QkN4NG9XZFYrMExnSVU4azUrbnNLaGYvb0tsc1pvcVM0?=
 =?utf-8?B?aVpJY1NqZVVGS21ia2JmUjJhN3M0REJWd2xnOUtEWkZRSmtaUlNuUWMrWGFv?=
 =?utf-8?B?RUk0ZVJub2tRREU2ajVlYyt2TnZzY09wQlZEQmxPaVdiL3F2cXhJNVBnS3Bv?=
 =?utf-8?B?cHRVNzE3RmVBL3B1WmkwbHY3OXNkR1Q5TS9nY2pKOGtDRXNXSWNXb3J5K3h4?=
 =?utf-8?B?QTVsQVBBYkZYR2VlY2JmSjIvTTBrMXM4akRaZ3ZvNi9NclFEakJuUUFKWEUx?=
 =?utf-8?B?WkNMckZxNVNmSWY2c1lWd1pkcnFUMHlYZGcxTjdydlp6cUVYbXBVeXdUMG8w?=
 =?utf-8?B?K0VRajczMS9EQUVwMGU2N3lVQXpKZWZja0xSYTZUSHEvOUtRbEM1MWRHc1M5?=
 =?utf-8?B?N1hLK3l2LzNIMHNFSFBtT0dhZ2VPbDJNQld5Q2w5Z2xzVlE3cm1pU1E2eWhG?=
 =?utf-8?B?VUl4VW4vdFA3aEV0UFNpYjR4NFlDdW9NMzl6NmVFb0QvQnkyYU52RVBwdkE1?=
 =?utf-8?B?d2NteEdaVWlUeStuRDUvd3hLeGdiVXU1dTZHY3BYMGhITlhkSTIxUVlDeGh1?=
 =?utf-8?B?aE5ZRWVvL0lNVVhhSHZtRlYxTmJrWDBzcm5XWVY3TWpUT0M5SWhsOXFVZDhK?=
 =?utf-8?B?Q2liUUlLRStDTVRQYjFURGhIQ29pbDJVTnhiTExQdGViOXhrNHJOMWtwcXJO?=
 =?utf-8?B?dER5RGRBeisraHF4R1l3aDNDcGJ1MTN4WEExY2w2THFYMmVUV2FmVkFSSGpG?=
 =?utf-8?B?Z3dQUi9ZdEtsenNnb2lwUnpQOFowQjFzbS9JMHFPZEFNcTdCU2FBcU1BWGZB?=
 =?utf-8?B?Q2UyMWs3MkFNdjRWcndDajZNRllEYi8xZG1MWFJGSXFNSDEyaUR0M0c3eUFR?=
 =?utf-8?B?RWVpbXI2YzRld044ZWhtYnA1YkRUMzVLK2JSZzN5SUtyMDdiVlJicDc2QWNy?=
 =?utf-8?B?ekhURGp4US9iaUpEOGdJN0tJQVVkcjkyWFAwMVd5ZWVFbGVSNkZkYTB2TDA1?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc07de4-a268-43df-8a18-08de1bbfded7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 16:33:22.6575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veKh01JY3RRGzcfjNQaAKcy6q0UcLAg5ds5Z4x8YejtFgvB1EjyobkFEasiKc9UnqftGwQMzDkLLHgbDwhqtLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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



On 2025-10-28 6:36 p.m., Dong, Zhanjun wrote:
> 
> 
> On 2025-10-28 3:57 p.m., Matthew Brost wrote:
>> On Tue, Oct 28, 2025 at 11:38:20AM -0400, Zhanjun Dong wrote:
>>> On hardware init fail, the hardware might no longer response, add GuC 
>>> stop
>>> to clean up exec_queue items.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>> v3: Switch to xe_guc_stop
>>> v2: Switch to xe_guc_ct_stop
>>> ---
>>>   drivers/gpu/drm/xe/xe_uc.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index 465bda355443..00ca5883e006 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>>       return 0;
>>>   err_out:
>>> +    xe_guc_stop(&uc->guc);
>>
>> If exec queues are destroyed later—after the submission backend has been
>> stopped—the final put on the queue may be lost, leading to dangling
>> memory when aborting the driver load or unloading it.
>>
>> I think you'll need to call xe_guc_submit_pause_abort somewhere to
>> ensure the final put cleanup messages are processed by the queues. Maybe
>> we add this call in guc_submit_fini before wait_event_timeout?
>>
>> Matt
> Thanks for review.
> My original thought is through xe_guc_stop/xe_guc_submit_stop/ 
> guc_exec_queue_stop, where will do clean up, might be not covers all 
> conditions, let me try.
Tested with call xe_guc_submit_pause_abort in guc_submit_fini before 
wait_event_timeout, works in some condition, while there is 1 condition 
might not cover: for lr queues, it won't clear, so I'm thinking of:

@@ -2375,7 +2382,9 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
                         continue;

                 xe_sched_submission_start(sched);
-               if (exec_queue_killed_or_banned_or_wedged(q))
+               if (exec_queue_killed_or_banned_or_wedged(q) || \
		    exec_queue_registered(q))
                         xe_guc_exec_queue_trigger_cleanup(q);
         }
         mutex_unlock(&guc->submission_state.lock);

@Matthew Brost <matthew.brost@intel.com>, Do you think this change has 
side effect to migration worker? I can make it another function if true.

Regards,
Zhanjun Dong

> 
> Regards,
> Zhanjun Dong
> 
>>
>>>       xe_guc_sanitize(&uc->guc);
>>>       return err;
>>>   }
>>> @@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>>       return 0;
>>>   err_out:
>>> +    xe_guc_stop(&uc->guc);
>>>       xe_guc_sanitize(&uc->guc);
>>>       return ret;
>>>   }
>>> -- 
>>> 2.34.1
>>>
> 

