Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4445ED3398B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 16:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0639010E0F4;
	Fri,  5 Dec 2025 16:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lj5LfuLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961D310E0F4
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 16:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764951660; x=1796487660;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=R2XozmNUe920I/dTseBo615vDayiNKkxkuGsYV2iBro=;
 b=lj5LfuLXxpIrkXbZg2CaxzP/4WfWn3IKjAQ3MrL3l+ES3YMMzqZ84VMN
 LCkS7KuyGN7ZkzRw38qQQM6ji4BgZCXhVQ1Y7izwgvM/gvzSaDauC/UOb
 wHzVzJrJmnSgPihvoKf1iviilTrD0G+8smhPXqpGGBIrObxMi8+BVtVQP
 K0bNYou20m+iDQrhc9E84LRqmrrV6lFL0jEfu8QqZFAutpNZCXhkthLxt
 GJ0Fiw1ghMTsGOzDpMwC9MgBk7QO/ZautMjYb9e/CuENMXEiDhro6E+ww
 RwhLc7BShS5DGtfHQ4S/HuGx+CcTig+Babvl4fkN92zAYyv1lXgc1udUt g==;
X-CSE-ConnectionGUID: NAmXAoeaTtOGnglYVwdKHA==
X-CSE-MsgGUID: oPb85KZdQcibbWq2eqBHjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67062112"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67062112"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:21:00 -0800
X-CSE-ConnectionGUID: KZy4fqN6TYSOTX0Kx6rQ9A==
X-CSE-MsgGUID: KwOndcCZS2+CLznbt7gxBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="225986239"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:21:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:20:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 08:20:59 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:20:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUQKhEw642vBTAbptLi6BXM2dsa9cAr3P6xnKNZJQuUKLii8Vg5KuV/i00owkZV67AHvqULN2mwQnKZTKbItyQ5p7w9p7xBRRyjwFZ2IyCCEHH0TsrD7IX1osYGL1kgEvUm9XeaEWUYv2DWfi9NRXLGNPBnz8fioZzCvJfXjIhhMzwWokFWsKAszWvzIstnGiLXIhhCVyFYnTI1h32TmKgjfwKDmbKhKENTG8iVVk6qoLJ9hgawmoMAFRtKvLJF+O2n7Dh/1G9Je2fCi5RiqLP8uWZ+0hFZZ61Gbncz6MNDr4zzry+tNVED3EtZgZ7z+KKCHDQd+S3HD8EaRWDlAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGUdxWs+qrEUd5gbd2Hzg+K5fUWwWIKqbcPUuBu8/8E=;
 b=ZHrcY65Fxdbo6nLGsa8mwYgWMAthufW1F0/CkAdsOF1Pvhf/kDqSYmhPgSLJUb2uWBMSrPmIyoTwwtBklMyJnkb80U9A4LJu0FHuD6ONN8hUCWlzsNV3/I5GeqgvNwwceM81VaQ7PdMW7W/T2IaBAHLuq4CTyCAGdFG5WnHvoBPgKxtqzQjMU/4HxX6f0EiutzZjcs6dUJ7KRpD8l8Ld0CMGyXW3vOZO3K7haIVL2koOn/ZV0vI6OWQfuhN/F38mDp3lEUoyKjuMIW99QKbLJMOx+q0xZaSbmfdaNbN1OX+gMaclmXh4J2lBjsguhjBCPb+XUiDjg1fesNv1AnaYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 16:20:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 16:20:56 +0000
Message-ID: <a606b491-c841-4bd0-89a7-36b76058f563@intel.com>
Date: Fri, 5 Dec 2025 17:20:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251205143815.1343989-1-vinay.belgaumkar@intel.com>
 <20251205143815.1343989-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251205143815.1343989-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b78b283-533d-46e6-9dcb-08de341a44d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFdsZURZR2pIMjdpb29JbWxBRGIrWndkbmFxSm03OGtXT0g0L3BNOGgrOWt5?=
 =?utf-8?B?eWR3MjNKZGtKSVJ3Vi8rZy9LRGE2OVVzNTJKbU5lMHY0RW1nbStndWkyQ1RN?=
 =?utf-8?B?bFV2L0IwcDd5Z3h3WHl0SE5IME1VMlZwS2xSRVBzOEN3eU5SUGtDSVR4VzNR?=
 =?utf-8?B?d2VpMXg2YlVwK0lFZG0wa3hqQm0vSzRIU3JQWXY3djFtUCtjTU9VR1VVZ3Fo?=
 =?utf-8?B?VG91M2FUcTNCMFRBMnc0NnlubjdOQW1RczVlS1lFTmtPenRVZW02OXhKb2pQ?=
 =?utf-8?B?cktUMDRjNGoxc05PbFZmV0t4UWYvaWIwWW04NWcyY0htaVJaOHh4V0ErRHFD?=
 =?utf-8?B?czNidExJSld0dFY2WXE5SmVpNlM1RnRIWjVVaUNHVkl6WnNuZ0lvVHpIVjhR?=
 =?utf-8?B?Rk9SZGVDNUx3bFRIeDVYcklmdlB4MEwvaC9kTHRiRXMwWmtVaTZhUlYxbEto?=
 =?utf-8?B?ZkdsMkVNeGorQnFQeFNxbVUxRzEwYnhRTGZSQUhkOU0rcHZzOElydGpTbk9v?=
 =?utf-8?B?TURXWm5UMlhDK2ZaYVBld3gxZlFPZFZaUHdueUxYUmowMG0wNDRwM3QvOFM0?=
 =?utf-8?B?K1pCMjlOSGpTdFAyekNKN1NaZ3VWUitRc3huQ1NzdnExWVc3UnhuVnZSbTVx?=
 =?utf-8?B?d0pUZEV4Q1RpaHNpNlBtR1FwVVVOY3pFb3hoTUVVMmZDZ3pjUE5uQnZLbE11?=
 =?utf-8?B?cUZhNldoRDBvT2NzbjRockF5NnJpYzBUMTNWOEdMMUtMMjBFTnp1Tm9BL2Ew?=
 =?utf-8?B?aS94OGhHUlpjUnpBaVlCdmJ3UDIxbGl6cCtUc21NQWsvb3l2dm9ZUHEvMGZ4?=
 =?utf-8?B?TEF2R0V1WTA5WGw4Q3VHOXZlSmJLTjNXYk92WUdoNXhZVVh2ejFVUStBajVp?=
 =?utf-8?B?azdtc29jcU1xMW8vcGpPc2RFOFhQQmcyazh6OG9WcGIxN3c3bmp5MGNJK21a?=
 =?utf-8?B?YW5ON2l2NjZrSFB2SWkvMWhKNVY3Z2JkNkFTb2FCR2JlbUM5WjBoNTJqWWhY?=
 =?utf-8?B?OCsvUE94emNwaE41WlBoL2p0RzlPN0dvMXBNbjkyT0l2L01XcWlSK1B5T3p4?=
 =?utf-8?B?MThkVXFDRWk3dXVTK0Q1M0hNZHQ4L2c4UGNLeFpkaEUxZDBnM0N0SEUva2JL?=
 =?utf-8?B?d0JEQnNmNTRVbmtqOG5WQVh0K1VwQU5lNFpURDlYdGNpM1RwZUlUa0wzeUVa?=
 =?utf-8?B?dkMzRFQ5N05WV25nWEQrYVVzWWxRS3IzTFFTdWdLdUQrZlAyU2xPcEZnYUdS?=
 =?utf-8?B?cXpPd1Z5cjN3YUE2bkFFbXF0U2MzS1hkN0dKaHd1Nml3UHVWbDhNL0RLUDE5?=
 =?utf-8?B?V09YS1VpcUVZYklibzQ5NG9kSlRHZ1ZyWTl5WjdYWlRJV3BDdy9talZ4S1A4?=
 =?utf-8?B?MUwxUmxJNWdQaFB6NkNML2pMeTZLTGVhbnpNTnZVQitOWEk3L0wzTDh1NTVh?=
 =?utf-8?B?elhxYzBaT1pqaXZWNnh3cm5IQWVxRDgyVkJIYUNtM3o4SVRIbWZWRksxNVc5?=
 =?utf-8?B?d3JrZitDQk5mNlI4Wm5DM2NTWDVtd0RuQzdxQm9aYUFZMDE5OE00aWJnNXo2?=
 =?utf-8?B?dnlZS0JqaTVnTmZlMHVXczlMNGlYdnZacm5CNis2NTNUNlk0cVBTTFNNeDlR?=
 =?utf-8?B?TXVIekl6anhKYnp6b1Q3NGtaNkhwRnBnTGl2S3NGVGh0eXpJdTIycXJmMHB0?=
 =?utf-8?B?LzNQRGM5RW1rNGNsZVJYemxha2VoQVo3a0g0U01sSFdWRm9kWTRJMFg5YnlV?=
 =?utf-8?B?dTl4SmZ6Q1kwZXQ0a1VTNzRLNWVJWll6SThUVzYxdlk5a3ZqUm41S3hla0cw?=
 =?utf-8?B?bytNVzFNcHJxOEtPYTJ0dW4zTDR4a25xbE1mb0gyeXZrWVcrRXVkNGNqeW5R?=
 =?utf-8?B?MC8vaDBOSHBSZlRPK2x3ekd0VnRsQ2QxNWxXWnhRR3k1RnVpMVlLSnJIeGg1?=
 =?utf-8?Q?CmwCM8btsAm5R2ED36oqtnbxZsB9YRQi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9BWEs4Um9Ka0hMa2RwL2MrNGZKenpXR2E2R1FYcktjbDdQL1EyZEhBZWhN?=
 =?utf-8?B?NG4ydzE3UVVFc1VZaGRLenc5ZW1DMUVRZytVRzlIMFZWRzUwZWhsNXBWT0F4?=
 =?utf-8?B?dDJNZ0F4dTc4K0JnSlJPb3RHWkhIbzJwRmZpS2xyYUJsT2sxd2ppWUVBZUo5?=
 =?utf-8?B?MW4xRGVjWS9GZktqbExEdVh5Q3EvbE9UKzNmdjJWMytoaW0ydHhtR3VZdC9L?=
 =?utf-8?B?Skl5LzVoU1NtWm5KTmRSYlVJTUxUdzIxL2ZVRUdCMjlBMzRHZ2I0OXJ4cE5P?=
 =?utf-8?B?akhrK29zSXgvak5UOHFQSlA4WW00enJOMzNHSkZaZGRGVVQxTzRKZ1BycGpU?=
 =?utf-8?B?VkNya2xURzVYQXpMaXlZWmlHM1ZWVnU1WTBHUllCS3N2SkZidGwrYkZVMnZS?=
 =?utf-8?B?dEdhVUUwdHU1aHV3MHMzMFMraVNVZlBNcGNVMmE5dkU5Y2NQajJiY0J6Ky9T?=
 =?utf-8?B?ZUtKZ0YyemNyYWpMREk2TWhCUGFmVG9LQ2I2YUM3N2FSdU8rcW5CUXV4V0x2?=
 =?utf-8?B?SnNFL250RGtKQ1lTd0V4OVd0ZGxMclVtWmtwdjdxSXpVWE1UOWxwWXBXSzh4?=
 =?utf-8?B?SHVWRGJYeFRqREVUK1Z3TmNHekJBY0NlMjB5ejh6ZjJCVndmdkJRZWsxR25T?=
 =?utf-8?B?VktFaEFZcENVQU4vR0lNbTZrNHpUUWsrMTY3L3ptZkRiMU5yMWNoWlpjbFE3?=
 =?utf-8?B?TVlxMlBrN1BMcitVTEg5d0UwOEIya3RCL29mbFMxbHRPNFZHZVdsVEd4c01z?=
 =?utf-8?B?cTZoakFPcHRGS3NmYkF3bmNQa2luVDlXV0NZb0NEdnVMcndTVzVNSEkvY2Zw?=
 =?utf-8?B?QnZoR1ovM1JQd2dKeFJLeDJKUGtWd1dOT0x3NkdHRi9FallNVERvOXkxR3pT?=
 =?utf-8?B?a2ozOUxBMFZBTWJiY2Q1VzlYc3lnREtkMkhXd0FEL29ERjB6QURqVWdUeUZI?=
 =?utf-8?B?NXB4K1JRU0hyMU5RT0N6ODBEbUE2dGplZkVmSElPS1NobHR2VzQra29oQ0tD?=
 =?utf-8?B?Sm9kSnlkbzNqcXBPSVdua2Rla2RxVHFGNmh5bjhTL2FKRGZvMEdjTVVxQkQ1?=
 =?utf-8?B?U1RxU2ZWV3NLNnFGekxwenZzN2hQZ2oxWWhjTFpkaFZQU2E5Qlo4bWRPN0da?=
 =?utf-8?B?Q0hWMFVBdks4TUs1RENSeDlDNGMwMVFTTUJmUXkwbUwzajJMbFBJUkVGZ0pl?=
 =?utf-8?B?M3R3cXZKM0s4bWQwS1J6Wi91TGkybmJyOTQ0SWUwWFZ0Y1FxaWUycExRTUdZ?=
 =?utf-8?B?aWdaeHhCRVd4Mmg0UUpKbmtldE1kOUw0RUZJTE52VW5ZK3pROUJYcUtlRldS?=
 =?utf-8?B?WWxuSDlWaWtIMXY3M0ZZS0p1UVJTVytRcGZGNWl5Tk56ckZvbkVsRXc3bFdV?=
 =?utf-8?B?Ujcwa21DTkZndEU5TGRxTUoyQy9NV0pDRzRmVnpoek5KMHAyLzBXQnR1T2dT?=
 =?utf-8?B?TXpaT3dHSUNsakVxYkE3eXNCTHliRjAxNG5UUGZGaTAyUVJ2bTE0aGtjN2Zp?=
 =?utf-8?B?YWpxOTFYekkzL0dtK0w0MC9oREdLY3JCN0JFY2trMEF4OTBGeitaTjl0UDh3?=
 =?utf-8?B?Wkdlc3k5ZG1ISkdMd09DdHJ6MEdyZEtBREMxK0h6RkxaenJJakVKMC9nZDJB?=
 =?utf-8?B?QkpVNXp1SVFaL1E3aE1oaisvREJuYzYrY2E4V1dEWkxudGxJblpqVmxyN3BY?=
 =?utf-8?B?UVUreHRWTG9nenlrZG1SOXkybmczVXJqVXpmcFhLWHlYTGxSQ29QT0pwVldi?=
 =?utf-8?B?YmZndEp4eVZiN3kzZTFqRTFTajRFMjFYWUU0NUUwVjVCb0d5OURMa3lURnRv?=
 =?utf-8?B?SWh1WkFYdkFEU3NMRi9ORXJuVUNFeHIwckdTbkF5VGNLZnBYRWRtOGhubkNh?=
 =?utf-8?B?SU9yeWRxRTJ1VTdZNHFoWEZpbGlNZFFOUm93NDUrdk9rQ2w4UzNkZHNLeG1j?=
 =?utf-8?B?ZkNKME9jMUI5eDdKaFpIcDk0bHVOSWxralRFSlAwdFVJcFE5MVhsME56U04z?=
 =?utf-8?B?Yi82UkxMRE5RYzJWYmZzVDBaTmVwVk1OM1Q4ZTc1YWc3NmVkTzk3MUVtVHFM?=
 =?utf-8?B?MlFKRkROQXNZcjhxZndnMVJiUTFRaTE0Z3ppbEpwMnFyT290V0cwVEEwUXdw?=
 =?utf-8?B?YWw0QkZrdURQTUQydUpCSVRUREdFU3B4V0N3Y1BYQ0wzN1Y4Wm1kNnV2NVo4?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b78b283-533d-46e6-9dcb-08de341a44d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:20:56.3608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNPl6pbcMhcKFFGWURrWMszCzuD8ipEFJa3KDJHGekb7vRQEapZUeEYe4snWT1rvqLaE8LGSQmb55ejGde8stZblyduFGbW8ReSNvVoMPCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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



On 12/5/2025 3:38 PM, Vinay Belgaumkar wrote:
> Move enable/disable GuC RC logic into the new file. This will
> allow us to independently enable/disable GuC RC and not rely
> on SLPC related functions. GuC already provides separate H2G
> interfaces to setup GuC RC and SLPC.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile    |   1 +
>  drivers/gpu/drm/xe/xe_guc.c    |   5 ++
>  drivers/gpu/drm/xe/xe_guc_pc.c |  50 -------------
>  drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>  drivers/gpu/drm/xe/xe_guc_rc.c | 128 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_rc.h |  18 +++++
>  drivers/gpu/drm/xe/xe_uc.c     |   7 +-
>  7 files changed, 158 insertions(+), 52 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a7e13a676f7d..d1258bd22752 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>  	xe_guc_log.o \
>  	xe_guc_pagefault.o \
>  	xe_guc_pc.o \
> +	xe_guc_rc.o \
>  	xe_guc_submit.o \
>  	xe_guc_tlb_inval.o \
>  	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 88376bc2a483..72740d17c769 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_memirq.h"
> @@ -865,6 +866,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> +	ret = xe_guc_rc_init(guc_to_gt(guc));
> +	if (ret)
> +		return ret;
> +
>  	ret = xe_guc_engine_activity_init(guc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e2e6edb851ae..5ced9ef37cf3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -253,22 +253,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  	return ret;
>  }
>  
> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> -{
> -	struct xe_guc_ct *ct = pc_to_ct(pc);
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> -		mode,
> -	};
> -	int ret;
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> -			  mode, ERR_PTR(ret));
> -	return ret;
> -}
> -
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1050,30 +1034,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -/**
> - * xe_guc_pc_gucrc_disable - Disable GuC RC
> - * @pc: Xe_GuC_PC instance
> - *
> - * Disables GuC RC by taking control of RC6 back from GuC.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe = pc_to_xe(pc);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret = 0;
> -
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
> -	if (ret)
> -		return ret;
> -
> -	return xe_gt_idle_disable_c6(gt);
> -}
> -
>  /**
>   * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>   * @pc: Xe_GuC_PC instance
> @@ -1257,15 +1217,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	if (xe->info.platform == XE_PVC) {
> -		xe_guc_pc_gucrc_disable(pc);
> -		return 0;
> -	}
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> -	if (ret)
> -		return ret;
> -
>  	/* Enable SLPC Optimized Strategy for compute */
>  	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> @@ -1310,7 +1261,6 @@ static void xe_guc_pc_fini_hw(void *arg)
>  		return;
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_gucrc_disable(pc);
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..1b95873b262e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>  int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> new file mode 100644
> index 000000000000..945433ef35f0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_guc_rc.h"
> +
> +#include <drm/drm_managed.h>

since you are using dev-managed action, maybe it should be:

#include <linux/device/devres.h>

> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_slpc_abi.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_ct.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: GuC RC
> + * ================

remove this underline, this is not a RST

> + *
> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
> + * GuC RC can be enabled independently of DVFS, which is also controlled
> + * by GuC.
> + *
> + */
> +
> +static int guc_action_setup_gucrc(struct xe_gt *gt, u32 control)

for "guc_action" functions we usually pass "guc" as param, not "gt"

> +{
> +	struct xe_guc_ct *ct = &gt->uc.guc.ct;
> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret && !(xe_device_wedged(gt_to_xe(gt)) && ret == -ECANCELED))

btw, is this wedged/ECANCELED check a GuC RC specific case or generic?
if latter maybe we should return dedicated error code from CTB ?

> +		xe_gt_err(gt, "GuC RC enable control=%u failed: %pe\n",
> +			  control, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_rc_disable - Disable GuC RC

for function doc, we should add () to function name

    * xe_guc_rc_disable() - Disable GuC RC

> + * @gt: Xe GT instance

hmm, as feature and file have "GuC" in their names, why functions take "gt"?
they should take "guc" like all other "xe_guc" functions

> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_disable(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret = 0;
> +
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
> +	ret = guc_action_setup_gucrc(gt, GUCRC_HOST_CONTROL);
> +	if (ret)
> +		return ret;
> +
> +	return xe_gt_idle_disable_c6(gt);
> +}
> +
> +static void xe_guc_rc_fini_hw(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	xe_guc_rc_disable(gt);
> +}
> +
> +/**
> + * xe_guc_rc_init - Initialize GuC RC
> + * @gt: Xe GT instance
> + *
> + * Initializes GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, gt);
> +}
> +
> +static int xe_guc_rc_enable(struct xe_gt *gt)
> +{
> +	return  guc_action_setup_gucrc(gt, GUCRC_FIRMWARE_CONTROL);
> +}
> +

missing kernel-doc

> +int xe_guc_rc_start(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret;
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +		return -ETIMEDOUT;
> +
> +	if (xe->info.skip_guc_pc) {
> +		if (xe->info.platform != XE_PVC)
> +			xe_gt_idle_enable_c6(gt);
> +
> +		return ret;
> +	}
> +
> +	if (xe->info.platform == XE_PVC) {
> +		xe_guc_rc_disable(gt);
> +		return 0;
> +	}
> +
> +	return xe_guc_rc_enable(gt);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> new file mode 100644
> index 000000000000..3a8c8d50313f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_RC_H_
> +#define _XE_GUC_RC_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_gt;
> +enum slpc_gucrc_mode;

enum forward not needed here

> +
> +int xe_guc_rc_disable(struct xe_gt *gt);
> +int xe_guc_rc_start(struct xe_gt *gt);
> +int xe_guc_rc_init(struct xe_gt *gt);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 157520ea1783..44e5fabe2a50 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
>  #include "xe_sriov.h"
> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	if (ret)
>  		goto err_out;
>  
> +	ret = xe_guc_rc_start(uc_to_gt(uc));
> +	if (ret)
> +		goto err_out;
> +
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
>  	/* We don't fail the driver load if HuC fails to auth */
> @@ -246,7 +251,7 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  
>  void xe_uc_gucrc_disable(struct xe_uc *uc)
>  {
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> +	XE_WARN_ON(xe_guc_rc_disable(uc_to_gt(uc)));

maybe use xe_gt_WARN_ONCE_ON(gt, ...) here

>  }
>  
>  void xe_uc_stop_prepare(struct xe_uc *uc)

