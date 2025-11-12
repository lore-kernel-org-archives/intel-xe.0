Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F67CCD3440
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 18:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAB410E78F;
	Wed, 12 Nov 2025 18:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0Uc/7jw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369C310E1CA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 18:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762971753; x=1794507753;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9I1hu9hLAY4t9X4A59cHkjZ7W5Qj+PGM+DqAAn4b7Bo=;
 b=H0Uc/7jw2eJw2zxShm3WSk90DwAdajiZE8NEyCD3ZPQ7l02akubPcB5h
 3pGxcWtqNSHYfbcMxT61EqtnI9yMe2uXrbsxMS5oAJzBlLvmSgRo2ukX3
 rwpadZKtu4BxeD6WTSsf6gSbAaDSCTtfV4Uf+CfWn0sw7sWxiorCMW7t+
 vJTi4ufB1cy99dklN4PqRu8+6XzCMRRObtx1EFKHIEUuvgOU2dmyN4h1A
 0gBCbghVawIQwpBH10aM00NuKrRoGKlQDE4mOno4I6Z8TZ+/pTAeaJr1K
 0ckCUx5gtvW09yzgj3WQ+8hRB6glQrDGS2KrCaBuo9iEr9iwIOBYBbdms A==;
X-CSE-ConnectionGUID: UtLhMK4WQ7+KWCHApFCqyg==
X-CSE-MsgGUID: tL5x2Pc4Ty+vOrGSdm+l2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75724618"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="75724618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:22:33 -0800
X-CSE-ConnectionGUID: pH3ClMDMR9ervIrB6dtJbw==
X-CSE-MsgGUID: gtvX26iQSU2SJhctVN96sg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:22:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 10:22:32 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 10:22:32 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 10:22:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqmS158t1KR2vBRNRxyplrrMyVQU6fMrae3akUAENuVhGBZM8ImB7+qFwn2gTEbwmbBZs/FJhagY/0aWYa+X2ert7aoZR2KCpmIX3j92yNi870oTjPxQdFNSmmnkcHXA7CM4S+fsy447VKWsX4Y94phD4DG8Q7QZvrE8dDhkkxuI6SN7hLzPebmarXjoGVxrtPL6Tkyh7i80W5aHcu5v+NDxelFyrsAlll74P3vtn79suCgoMVQQg918OR1fvsOSG7/iL6Fbrrr8FlY4JMNzZC79HQWaR+M9OySoShyO2rbPzfbZFRwEB+xt6H8WxMgzNTwyyJti+a8iszHfAaV1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2iKIvoFORZ4cA5N7h5yuguYAGvo7AXJ7J/HkOKjhiU=;
 b=ITnlLzJcxEPXZI/Ix4UwrqWxbBpiOxDN9E6Nxb/Rc+S4WBojLyCI2P6QSPIAIDVC1/myc4Ta3qmahRbBI21/rWScUOEzCQsvdf+KjLKtiBN7xxI62c94DWGXKfmrwRSWx2R0BuIaMy7RT1RrOkfrIhFzTdyaLYJSDgI3m7eVuTSe34NqjSlGG6reO3iGdKFLD+3IZQOZSCxMYwAJLa7iaohPj3u25sKtWLrYa1nydYhoJrTYPiyYdFpDnJPHoyk+M7Sb5Ht9W3hqmdu5Mtv3qoI1kTNbSHQgZlyqzelTB3jstt7xqQZstJbEoC3+j2BzjzTkK/ce8yL3pGhPai1fmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 18:22:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 18:22:28 +0000
Date: Wed, 12 Nov 2025 13:22:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/xe_survivability: Redesign survivability mode
 sysfs entries
Message-ID: <aRTQYPQkLyZYfD0w@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
 <20251112103336.1468261-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112103336.1468261-5-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: b00e87f1-416f-43c2-54b1-08de22186f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzdxaFJDV3pwQ0dXbkgxUWZNSXB6ZWRJUStqdHJ3eHpURFNoaWxMVENYQWYv?=
 =?utf-8?B?bWxzVnhSaDE0NFVVSE4vQ2dQK2dESTlpQ2pOdW56UWZnaGxWd1FzZ01kNXhN?=
 =?utf-8?B?alZ4ekd1aloxMW8xZ1BSejdQRGwrc29IMEZNaDBWN2Q2SEdPcFVCQWoxYUtk?=
 =?utf-8?B?NWVsejY2T1hGenBwNDlKT1htVG9lRkc2ZnlFeWprT2YxbXNTTDV0Q3Y3aTAv?=
 =?utf-8?B?YWIxc3ZhZjlQSGxwMXdCR3U4ekJFSUZrTGlxNEF3ZFFBSE1xTFFWdjU0SHFE?=
 =?utf-8?B?VTRYbHMwTTFHWml0N1IrWEltc3hiSE9wZVVJNXRldUV3eURjdTdJVi81Mmky?=
 =?utf-8?B?bWRKRFozUDk5ejYzYnh3QXZaei9pclNLVTY5SDFvVk5kTnRHL0twMmdNSDJF?=
 =?utf-8?B?WS9lSWNCQmpXcXB2YUliUHZ5VkVzZi9BK1JsOU9CUlVKSWJodGZMZDMwdWlq?=
 =?utf-8?B?bDBKc0h6a3k4YjUvUnRNU2U4VGNDSVdRa0VKVnZXVE55Y1FoS0xSU3UvbHRo?=
 =?utf-8?B?QklZbUlKQ2RGNmU5VmpjMzl0dkRBMmV0WnNWN0s5QWdIc0VXTlp4ajc4azBV?=
 =?utf-8?B?K3U5TFE5bDFKK1RIeDBRb20vTzVCdDM2RXhjMXlUQnp6T1Jia3M1RFJXRHpF?=
 =?utf-8?B?OGdIYWVqZWsvYWM3QTNPWnA1ZDFGc0hxa0V0UmU5OUViSHRtM1lRazhWOXM0?=
 =?utf-8?B?YmM4RzZvMUcxN1pSL2UwUDJ0c1laYUR6c004UHVabVFkQmhWRmppalR0YWY5?=
 =?utf-8?B?N3JVNTBYdUVYTG1zZksrbGc0bGg2c09vSlduWWZmUTI4a1AyNFV5RmgzWVlI?=
 =?utf-8?B?VVRZRUpYTXNkRGlQUjF6ZFN6UjArOCt5QVI5QkJiQ3BRa0NSUmx3K2pHZ0Nj?=
 =?utf-8?B?Myszd1EzK2V4akM2T1lyV0swd1JjSjUzcWkvd0xadWhSMzZXMjJ5eXUzS3pp?=
 =?utf-8?B?b2pTRGJmbGI4S1hGV1pnN0VnbzZGbEtCSnY5NUhLK0FUMStlMElMaUFIMXBP?=
 =?utf-8?B?KzBHTkhsb200Sk16N2ZvQXJnZmU1bWMwWTkrSWg3T0thcHlNY3Y3YTVnM0hw?=
 =?utf-8?B?TGRDSU1mblIrUkw1b1Z1UVFWd3MwS3BYSEg4YUV4dmFteWVpZ2VvczV6dGhX?=
 =?utf-8?B?MWZYU21YZDJSUnBkb3dMd0JFbm5sc05LWkR2azZNemxyRG1zUVFaRjY1R1JO?=
 =?utf-8?B?ZXdwSFVVVVJjblBGSDJWcStlOGpSYTg3emZmYnNoclhXc1dGYW0yYjAxeEg1?=
 =?utf-8?B?N3AwYXZrRGFXUFNYK3U5YVJmL21vOGNHVlFtdSs2aHRoNlFKQkFubFFlQXFk?=
 =?utf-8?B?ZFc2VGtjN1JVRThmNjBpT2NSSmdIL1d4TEhSOGQxZFhodzRTekc5bGRjWk5n?=
 =?utf-8?B?WnVSZm9xOFdKVmI5RU5LK1BOZnBZdGczelNCWnA4RVZocjJ1eGpsZ1VXWk9o?=
 =?utf-8?B?YjhPZVRLMDZDVEJlYnZHMHMrVVJZWWlLam0wNEZELzZia2FtYnJFaXVGUmFu?=
 =?utf-8?B?Y1FBU2FZSW1yaDJKR0lOUUxQYU5PT0ZaeUtIOXpLUUdHcHo3cEpMcUhhK2dp?=
 =?utf-8?B?NUtpa3JKTmxHRmd1bmpxRmwyT2w4d2RubnpGWjdCM005ZXZvQ0tMQTlXbTVL?=
 =?utf-8?B?bzRYNloyNHllOG5jZHk3cEJWVkxYU3lTZFJPSjczMmxCdkJEY2FoWjd1VkUy?=
 =?utf-8?B?UVhDbXpKbTY2WU15a09uY3BSdEx3QWtYdEs5eGx3citJSFo0K2wvU29vTE9I?=
 =?utf-8?B?RnNGVW01aDdua3QyTlFQYklPb0c1QnJNY3Erb2o2WUt2UkNlZmQ2dzMrZ2F2?=
 =?utf-8?B?SERlWDZKdUpOQjNUOUtpd0gxb1llcFkreVlSQ2xwcEVJa3BFKzdTdkhzTFd2?=
 =?utf-8?B?TXIraVRjNDlQb0w0SzR6eXYvSUpSMWxBRGhpYXdlSFhRalAvbkhCUlJZeWZJ?=
 =?utf-8?Q?W544l5XySarE+UaZ6MDKu2NtHiMvipbJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlNGKzlMRnJvTFhEbmFrUVFMOEpEa3JBTHkyek16cmJvaTBUZFM3QTJZT1Iv?=
 =?utf-8?B?bmRyS2NDT1RYRm5CRCtxb1ErT0VzT2tSMWVvSE1Jemd3QTI0ZVBLM0NFc1dW?=
 =?utf-8?B?ZytpQkU5UGRBT3E5MG9LMWpoMTRoVDBQSUNaT0xtN3ZqWHN1a2l6SFc0bmJZ?=
 =?utf-8?B?SXVnTUdUN05RVTZ6ZHZMbUd3VUhrVVR2YVNzOFdPQkRoZTd6WE1mQUQ4bWF5?=
 =?utf-8?B?RE9KT2c1Z3BkRk1lNWF4clRsWUtZcEY1WUo5Zm9sL21ibTNKdDhMNzhXanpR?=
 =?utf-8?B?dWxrbkFFeDNyMldxQmFWYS9keWNXbDBtMmJFblZkS2tIRFhaVjFLRDBsRm5Q?=
 =?utf-8?B?aWx6R0dEUW5sSS81T0szSk9LeEhHbzFRS2FUTGIrZU1mTmF5M0F2dkk5VXlG?=
 =?utf-8?B?U3dHM204bng0d2VIU3dPZllOVnBaTEFGV0hZSENnYW9ySTBhVVRBbVJhcUNn?=
 =?utf-8?B?RnRhQzZGeS9uRndhZ0lTc0tmR3FQOTdUeE5RNXo4Wk9kcTY5bFR4T2tRSUlM?=
 =?utf-8?B?UHV3NnlPRDRFaTdxeXFKeDRJR0hXQzFBNlBtSmN2WXB0a0ZJRkxicjI5azZt?=
 =?utf-8?B?b0tYK2RjY0FPbWVPVHhBUXZWYmRNK2lJOFNtbU5Qek1VQjAwdVVrSGZzajdN?=
 =?utf-8?B?SytjVGYzMVZlYW1FT0c3ekUvZnRERGhKVVJ3S1l3RTMwa0VNbXBTVUdpNUR6?=
 =?utf-8?B?RVJnZExwMy9YbkpuWEVGTndJNHBzRUUya0lIbER6RzlWQTN4cjNwd3U2QURm?=
 =?utf-8?B?em1abGxtVG9CaGRMZGs3aXk3di9WTVhnTmNMTGFaZjlDMmhlMmx1dUZnbFdZ?=
 =?utf-8?B?MTRvNGpkdUFRMVpueG45ZHpQRFh3UjBFU1A5MElPdHhwa3BLdEtudDBqLzZ3?=
 =?utf-8?B?V2pUM0dYZEtSbHpNcHNpUVd2R1J4cW14cUZTMmlyY2Q3UEk3ZjFHdGliWHlJ?=
 =?utf-8?B?ZnBXOTdFTzZyTVI3bWpDSnRGaDlrSjZQSGJYQUJCa0xqZ3FuWHhNY2N6YnBN?=
 =?utf-8?B?UGMzcy9IbmQzZnR3cUJtZm5YZTdOdjdzRENsN2lKUDUyM0taeElWZWVHUUtP?=
 =?utf-8?B?Y0s0QVlSRnFqYXBHUHFnUm12Qk1Ndi8zejhybTBmNzhEODl6ZEkvWWNJSTdi?=
 =?utf-8?B?ZFRQckpLWEFCMGxYMEg4NVY1MElsTVYxRTIwQnRsZXdyenJaTmkwTisvRmVp?=
 =?utf-8?B?RXR5TjlTV3A4V2VjYUxSdTNGb21aWGVEQmZuTjZzbkZpS2hURktRRWlWbG8v?=
 =?utf-8?B?YTFGUUpGYXhjVFR5K2hzZVNZSnlEMGxmODB2RmxDdC9tTDJBY2pLcW9sREhq?=
 =?utf-8?B?N0lxRFZkU09oZy91K0NHT3pLc3VEblpKUDJybnVtNmJPQUNFbTA3ZTgxWEJP?=
 =?utf-8?B?aUNseGlSTCtUYkNRb3B4QmFKSk94MjJ3Z1hWeVFXR2IwL28rUXRncTlTakJz?=
 =?utf-8?B?c1JWZFVFOG1TeUdNQVJ6RWtWRFdDZFlNZlU1Y3d4OWlZb2Yrd0VUcWtqNDhO?=
 =?utf-8?B?WW1VSmpKRFErTmVMb2psYlczQUh5K3hBZ295SlYxOUs1ekNqVmpVOUpYSWxP?=
 =?utf-8?B?NDhraWFBWTQ3aFduTGIwRkZ3bDJONHNkK0hvVlVReEpqNUJRdUtTMUoyVmts?=
 =?utf-8?B?bFdRK2VMUzdDVU11VjVqZFU2cHVRbytHNEM5WjBsSVhQcFpZOVA0My9EL3Fx?=
 =?utf-8?B?Q0xGeGRaUkJlOFNYUFl5MnMzSWxjcDB6Rmc0NndhamZXRjM0WHdWcmtNRmtB?=
 =?utf-8?B?S1ltS3pINXhLK1JVL0RHSHhDN0k0VUMzL2k0WTY5VTBHRG9LRUV4L2NJYi8w?=
 =?utf-8?B?WU96VW81Y0ExQjlTb0lXeWhPaXpQa1lUaFhISkN6Y1ZJak1zaExaTEkzY2ZQ?=
 =?utf-8?B?ZkFTMkxXbXMxcEZjWVI5NEQzN3A0SDZlQkU3ZTZLcVpLZjVwMTBlVVVGOHlz?=
 =?utf-8?B?b1ltQnhNOFJHNE8rUm9ZMmpCcUJzQVpvVVhITnpUWGpCNlE1VStoUFNxVkxz?=
 =?utf-8?B?WVlSOHlLaEZEYlhhdFo5Z00zT2hjbWtxa3BDSW42UzhpYjJmcVJPVHJmdG1m?=
 =?utf-8?B?U0lOcUh4RjR4WUhLcTdabVRWQzlLTXF6eFR3UHU4WDhuWWxmWUk4U1RtSit4?=
 =?utf-8?B?T3VjRHd1eGY3ek40dkdlZFRJTmVPQU12NzMzZEtyUUMxcXJQSDI3cEtUTWNh?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b00e87f1-416f-43c2-54b1-08de22186f45
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 18:22:28.0112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyurNaGF8jhJwK5L6rjOtOdLpIU/NUkNqZme71AxeYMhEIx3aFyeY/v5UzpVrVtiOxZB/ScoBIcPnr+1UJ/NBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Wed, Nov 12, 2025 at 04:03:38PM +0530, Riana Tauro wrote:
> Redesign survivability mode to have only one value per file.
> 
> 1) Retain the survivability_mode sysfs to indicate the type
> 
> 	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
> 	(Boot / Runtime)
> 
> 2) Add survivability_info directory to expose boot breadcrumbs.
> Entries in survivability mode sysfs are only visible when
> boot breadcrumb registers are populated.
> 
> 	/sys/bus/pci/devices/0000:03:00.0/survivability_info
> 	├── aux_info0
> 	├── aux_info1
> 	├── aux_info2
> 	├── aux_info3
> 	├── aux_info4
> 	├── capability_info
> 	├── postcode_trace
> 	└── postcode_trace_overflow
> 
> Capability_info:
> 
> 	Provides data about boot status and has bits that
> 	indicate the support for the other breadcrumbs
> 
> Postcode Trace / Postcode Trace Overflow :
> 
> 	Each postcode is represented as an 8-bit value and represents
> 	a boot failure event. When a new failure event is logged by Pcode
> 	the existing postcodes are shifted left. These entries provide a
> 	history of 8 postcodes.
> 
> Auxiliary Info:
> 
> 	Some failures have additional debug information.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 159 +++++++++++++-----
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |   1 -
>  2 files changed, 115 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 1662bfddd4bc..3d9417911c33 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -19,8 +19,6 @@
>  #include "xe_pcode_api.h"
>  #include "xe_vsec.h"
>  
> -#define MAX_SCRATCH_MMIO 8
> -
>  /**
>   * DOC: Survivability Mode
>   *
> @@ -48,19 +46,25 @@
>   *
>   * Refer :ref:`xe_configfs` for more details on how to use configfs
>   *
> - * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
> - * debug information::
> + * Survivability mode is indicated by the below admin-only readable sysfs entry::
>   *
>   *	/sys/bus/pci/devices/<device>/survivability_mode
>   *
> - * Capability Information:
> - *	Provides boot status
> - * Postcode Information:
> - *	Provides information about the failure
> - * Overflow Information
> - *	Provides history of previous failures
> - * Auxiliary Information
> - *	Certain failures may have information in addition to postcode information
> + * Survivability mode sysfs provides information about the type of survivability mode.
> + * Any additional debug information if present will be visible under the directory
> + * ``survivability_info``::
> + *
> + *     /sys/bus/pci/devices/<device>/survivability_info/
> + *
> + * This directory has the following attributes
> + *
> + * - ``capability_info`` : Indicates Boot status and support for additional information
> + *
> + * - ``postcode_trace``, ``postcode_trace_overflow`` : Each postcode is a 8bit value and
> + *   represents a boot failure event. When a new failure event is logged by PCODE the
> + *   existing postcodes are shifted left. These entries provide a history of 8 postcodes.
> + *
> + * - ``aux_info<n>`` : Some failures have additional debug information
>   *
>   * Runtime Survivability
>   * =====================
> @@ -79,6 +83,29 @@
>   * to restore device to normal operation.
>   */
>  
> +enum scratch_reg {
> +	CAPABILITY_INFO,
> +	POSTCODE_TRACE,
> +	POSTCODE_TRACE_OVERFLOW,
> +	AUX_INFO0,
> +	AUX_INFO1,
> +	AUX_INFO2,
> +	AUX_INFO3,
> +	AUX_INFO4,
> +	MAX_SCRATCH_REG,
> +};
> +
> +struct xe_survivability_attribute {
> +	struct device_attribute attr;
> +	u8 index;
> +};
> +
> +static struct
> +xe_survivability_attribute *dev_attr_to_survivability_attr(struct device_attribute *attr)
> +{
> +	return container_of(attr, struct xe_survivability_attribute, attr);
> +}
> +
>  static u32 aux_history_offset(u32 reg_value)
>  {
>  	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
> @@ -88,7 +115,6 @@ static void set_survivability_info(struct xe_mmio *mmio, struct xe_survivability
>  				   int id, char *name)
>  {
>  	strscpy(info[id].name, name, sizeof(info[id].name));
> -	info[id].reg = PCODE_SCRATCH(id).raw;
>  	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
>  }
>  
> @@ -102,26 +128,23 @@ static void populate_survivability_info(struct xe_device *xe)
>  	int index;
>  
>  	mmio = xe_root_tile_mmio(xe);
> -	set_survivability_info(mmio, info, id, "Capability Info");
> -	reg_value = info[id].value;
> +	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
> +	reg_value = info[CAPABILITY_INFO].value;
>  
>  	if (reg_value & HISTORY_TRACKING) {
> -		id++;
> -		set_survivability_info(mmio, info, id, "Postcode Info");
> +		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
>  
> -		if (reg_value & OVERFLOW_SUPPORT) {
> -			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
> -			set_survivability_info(mmio, info, id, "Overflow Info");
> -		}
> +		if (reg_value & OVERFLOW_SUPPORT)
> +			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW, "Postcode Trace Overflow");

Are these name strings useful for anything right now?
We should only have the values inside the file and meaningful file names no?!

If they are needed it is probably better to have an array map.

The rest of the patch looks great

>  	}
>  
>  	if (reg_value & AUXINFO_SUPPORT) {
>  		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>  
> -		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
> -		     id = aux_history_offset(reg_value)) {
> +		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
>  			snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
>  			set_survivability_info(mmio, info, id, name);
> +			id = aux_history_offset(info[id].value);
>  		}
>  	}
>  }
> @@ -135,10 +158,9 @@ static void log_survivability_info(struct pci_dev *pdev)
>  
>  	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>  		 survivability->boot_status);
> -	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
> -		if (info[id].reg)
> -			dev_info(&pdev->dev, "%s: 0x%x - 0x%x\n", info[id].name,
> -				 info[id].reg, info[id].value);
> +	for (id = 0; id < MAX_SCRATCH_REG; id++) {
> +		if (info[id].value)
> +			dev_info(&pdev->dev, "%s: 0x%x\n", info[id].name, info[id].value);
>  	}
>  }
>  
> @@ -156,25 +178,38 @@ static ssize_t survivability_mode_show(struct device *dev,
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info = survivability->info;
> -	int index = 0, count = 0;
>  
> -	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
> -			       survivability->type ? "Runtime" : "Boot");
> +	return sysfs_emit(buff, "%s\n", survivability->type ? "Runtime" : "Boot");
> +}
>  
> -	if (!check_boot_failure(xe))
> -		return count;
> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>  
> -	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> -		if (info[index].reg)
> -			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> -					       info[index].reg, info[index].value);
> -	}
> +static ssize_t survivability_info_show(struct device *dev,
> +				       struct device_attribute *attr, char *buff)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
>  
> -	return count;
> +	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
>  }
>  
> -static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> +#define SURVIVABILITY_ATTR_RO(name, _index)					\
> +	struct xe_survivability_attribute attr_##name =	{			\
> +		.attr =  __ATTR(name, 0400, survivability_info_show, NULL),	\
> +		.index = _index,						\
> +	}
> +
> +SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
> +SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
> +SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
> +SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
> +SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> +SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> +SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> +SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>  
>  static void xe_survivability_mode_fini(void *arg)
>  {
> @@ -182,17 +217,47 @@ static void xe_survivability_mode_fini(void *arg)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = &pdev->dev;
>  
> -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	device_remove_file(dev, &dev_attr_survivability_mode);
>  }
>  
> +static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct attribute *attr,
> +						int idx)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(kobj_to_dev(kobj));
> +	struct xe_survivability *survivability = &xe->survivability;
> +	struct xe_survivability_info *info = survivability->info;
> +
> +	if (info[idx].value)
> +		return 0400;
> +
> +	return 0;
> +}
> +
> +static struct attribute *survivability_info_attrs[] = {
> +	&attr_capability_info.attr.attr,
> +	&attr_postcode_trace.attr.attr,
> +	&attr_postcode_trace_overflow.attr.attr,
> +	&attr_aux_info0.attr.attr,
> +	&attr_aux_info1.attr.attr,
> +	&attr_aux_info2.attr.attr,
> +	&attr_aux_info3.attr.attr,
> +	&attr_aux_info4.attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group survivability_info_group = {
> +	.name = "survivability_info",
> +	.attrs = survivability_info_attrs,
> +	.is_visible = survivability_info_attrs_visible,
> +};
> +
>  static int create_survivability_sysfs(struct pci_dev *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	int ret;
>  
> -	/* create survivability mode sysfs */
> -	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	ret = device_create_file(dev, &dev_attr_survivability_mode);
>  	if (ret) {
>  		dev_warn(dev, "Failed to create survivability sysfs files\n");
>  		return ret;
> @@ -203,6 +268,12 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>  	if (ret)
>  		return ret;
>  
> +	if (check_boot_failure(xe)) {
> +		ret = devm_device_add_group(dev, &survivability_info_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -244,7 +315,7 @@ static int init_survivability_mode(struct xe_device *xe)
>  	struct xe_survivability *survivability = &xe->survivability;
>  	struct xe_survivability_info *info;
>  
> -	survivability->size = MAX_SCRATCH_MMIO;
> +	survivability->size = MAX_SCRATCH_REG;
>  
>  	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
>  			    GFP_KERNEL);
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> index cd65a5d167c9..1ed122cf62f2 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -16,7 +16,6 @@ enum xe_survivability_type {
>  
>  struct xe_survivability_info {
>  	char name[NAME_MAX];
> -	u32 reg;
>  	u32 value;
>  };
>  
> -- 
> 2.47.1
> 
