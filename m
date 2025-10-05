Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49736CAC5B8
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 12:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECE310E0BA;
	Sun,  5 Oct 2025 12:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYGJ5x2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A56210E0BA
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759667309; x=1791203309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FN36gYn0reodGaTF789y/r9klUG/giLFeSE9WVVeTPs=;
 b=UYGJ5x2Lq7Dkg4Aagooxy+wQn9nB1V7eBO97YFvkq9EUkwJ70NIVyrDb
 R5lwaQMKwgkINcZpJNg73+Y1qe7TYjGoHr6DIzN/uVxzdHI3tLXIoI7P8
 Nsneua4O5J4EQMnT4dqiCc7qI9d6Fmuq552WW0rsglt3t76t7a25pA0wu
 5XCN3MbtHpJKrWay7sDgRH9ulKyAdvek7ZwStW8h/5VYTSF686ByU044w
 Unfv4t0L05LaWuMaDvU0ThpTQqTwVObHLFXPhPYCxKXBTl9dqKu3YoMGo
 QvNiQ8NgI/5QL5G0K8MH38DJEg2eSbgXdGq63oUr4u4LqB1s7NC8IS7FZ Q==;
X-CSE-ConnectionGUID: +fw5rknyQYq7lBjDuOY+rQ==
X-CSE-MsgGUID: ByTg/cGgQnSJ+iK0l2XKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73296120"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="73296120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 05:28:28 -0700
X-CSE-ConnectionGUID: dzCFTkigRxK5kPeKlAW24w==
X-CSE-MsgGUID: zdpvRZ6gR6SMJmGN5RogoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="210335405"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 05:28:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 05:28:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 5 Oct 2025 05:28:27 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 05:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXdfRspfeGlASWj7RHtZzI5Wm66G0w4tqdQ8t79FcUdB8LcDds7Fu/ot8gc0JTu4vNQ5rR9RctXOjJz2kf2JuFmZlI361cJv21U171J5KWeizib+18a9gxBRTF+cwodZuNcDE+e5GPa2QRFfBNMGTDvnWRvQUOD1H24a9l6Bwiok8h89Vm/awGj+45Rt8t49hZgZnZWIkkLMXBxW8PwTGeR7UNiKjbZq7PG0zv5yYo64aC5FnTfhizq4DpGI/eYgRX4dCA7uCgCUVzBkQz2GlULD5+t3JmQFBNOWSkG+rFdLKiYCUxiaJbAb8z7yPGe3IKfLSz03Dh/uC3lBot2IPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S44mNn6T+YVoLq4oDuLsIOM0cwRn52BU//DYqYOG3ik=;
 b=D2CQAt6bDdg3u0id7IgLbQcAdwe60+ejJwtdUBFdHlouabzVXfE4fbyepbL6U9z278AhFyocS0y7LY7kl+CjxacprqdXo30CB6QvGTbdxF2Yg/Wt2xM2+jZ2N2uVZNZhaJDwFJ1pQwzKJTs2648qZ5TGIs6pT7YlcIFCq7Y1ORBOWqKufYVxUsTKo8/CMIzqBHcCMqSzXAVO1yPAV8IFsKDyV/7cN3Q68kIocfGn1Xdith+Okn7vBHq4ogRL1HG9Ij/ZiTQqGIbvv5WrJ+3+7TmuoSQaQm0f1yMOtuW50v9mPMOdXCAb+Bm4bo59MTqW6+DrzDDslwLYsnFD0McH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sun, 5 Oct
 2025 12:28:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 12:28:21 +0000
Message-ID: <3ebcca86-c110-44c7-84cc-e4240e074dc7@intel.com>
Date: Sun, 5 Oct 2025 14:28:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/34] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-25-matthew.brost@intel.com>
 <0cfeca19-dd2c-4cc4-8725-c7526fe0611f@intel.com>
 <aOIVEF6cPfw+BH56@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aOIVEF6cPfw+BH56@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 11948317-e786-401c-d3cb-08de040aab81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzY0bE4rdE50cFdZelhCbnFXWFg3Uko4OG5jMmkwbEllWHdJSTB1Y3E3aTRP?=
 =?utf-8?B?UE85L1FTdFlRTzlXQ0VTYWxTUUFkdUJURW9hYWZIdHZOWTR5dmxEaHRhUXh3?=
 =?utf-8?B?U0VuUWdJcGZrQnBPeE1SeUpxdlo5dFBOYlJBRVpjNHRnTEFwNWtrTVhLVk5l?=
 =?utf-8?B?d3B3cGZYU1JOcTFlbkhDZzdtQkJwRWt1OWt5aEFGZEN0bU05Y1BXQ2EvbE9l?=
 =?utf-8?B?UGNKYWNTWnJKMExiSEpkakxrMEFGVG1VV2Y2Z25ubHBCSktJVVI1dWZnSi9n?=
 =?utf-8?B?d01haXBXTWRTVUE2Mm5Wd05kZkRLZXFiTTdZbGRkWWdnWmhCbXVlKzlrWklo?=
 =?utf-8?B?RnMydDRUTjY4dWpSS1BvYmJHZ3FubDFZUzcyNkl5c2VWRXliNHVvVGM3M0lL?=
 =?utf-8?B?aDZVbmRDQ01EZ3JiSjhKUHRaZEFHbFFqM0FhV0FXT29NZEVuejUzY0dLMUZo?=
 =?utf-8?B?RVpBWkNmVnZwbXRrbDZWUndNNllKSWlaSU9mZVdFRXVlVndqRFQ2R0JlTmZx?=
 =?utf-8?B?TkFjak5YbHA0YktEVU9KWis3cnlnUnRKNkFacXp2UmFieDJ5dzR5QlY1WGo2?=
 =?utf-8?B?aUh2TFp1dWEvMXZsV0UzVEtUNTlPNjRuODBBczJ2bHBmazZGYWtQblZYcHA5?=
 =?utf-8?B?QXRBbUZqQ1pod0JUN3J3L0xIeXB6d0ZJQXlJUzJ5RktDTTRUYUlNTmRJR3pC?=
 =?utf-8?B?SGhGSWRHMWhoNzd3d1IyMGJCVXBPUnRWNGNEYUVDSlhzTkhPRUt3aU1QTU1L?=
 =?utf-8?B?VWFjbDhKLzk0SWVlWGk4TXc4QlYwYUZvMEFNZUErU2RrVjZRUExRTW5DMWJo?=
 =?utf-8?B?Tk5nYytnd1NyWWVPU09odVEyUDJ6RVRNVE1IZFE3ZDJPYWlYZ2V4T1dxMENz?=
 =?utf-8?B?VzJ6bnJWaitjT0w5R1dtUFByejFEUlJWU3JWem9EcExaZTFQc21WVGxBTXNh?=
 =?utf-8?B?RlV2NHdaOTlJTTVCdDhucWdnR3N0M1MyMmY3UDlNWWxnOGFma1h6eHV4QzFV?=
 =?utf-8?B?L0JoTGUzRmVtb2ZFSDh6dWpKUDArTVVsQ1VLc1FQSDJPQ01wenlFQjVNSEcr?=
 =?utf-8?B?c0ExRklGeGRWNWRlL0FubU1xNVlTYTErRjJXaDR6YkJRNkR0Y3lxMVVZR0kw?=
 =?utf-8?B?cFdBZDhHMDBSdDlwaGpmRmxPU0JGa0YvRHZDSktwV2txUU0xckRlcER1UnhK?=
 =?utf-8?B?R3hScWJRSlR4TzBvUkVXNWhLT2VqNFdPZEp0TnlKeFhkdm1IVmNUdDdyT0Rr?=
 =?utf-8?B?bVVFRjE2RjYyU2RXalBWQktFN3pkMW42VmNEcm9BVnNVd1EzcldNZ3lrOTZB?=
 =?utf-8?B?Q2gvTzVEcDZ3QVZKakhYUlFSUm1xTFkvWlNEZTVyVjFuZENPRGx5YTBHOE4w?=
 =?utf-8?B?bTNSZ1FVTnFXTnlqM1NYd281NGR0WlJDQ0tGYzVyS0V5ZHU3a1Bpa1lzQzFT?=
 =?utf-8?B?OXkwV2xrUFhSOFhqK0pwN2gzUjVGVVJ4QkpFV2x6bDhJcXdUV3VTc1o2YXg5?=
 =?utf-8?B?OUorbVA2bTRhV25ldWEzenUwWVd6dE9RelNlaUxKZFRCZmxOcWhGUWxKSkNN?=
 =?utf-8?B?djdBKzZ6aGozcFQ5TUZDZkh3MHphRWN3bFNVS2UyeDg1dmdZTS9GSXl2TW1B?=
 =?utf-8?B?NWwrWXE2L29sN25ncVNTWmRnaXFQWm40S2JUZS9RQjFGV2svYWZVMENaUXRh?=
 =?utf-8?B?Zkh2TlBFcGdYeVJVM1RRRFJ4K2F4TzU4ZDdyRlJDd2ZJZkkwejJxRktmUGlv?=
 =?utf-8?B?RVkrMzJsdUw0bEl0R3JSTzJJUG93end4eWJvcUUvOG9UVDdIN05YeFFHNitm?=
 =?utf-8?B?MFhqdStVMG9QNGpoTmZCZ1NhK0RzUXlzSjFLTmppZHdxdnJTdXhsUW1ZREMz?=
 =?utf-8?B?OFJYRjEzekQ1Rlg4WTdlYllRNzA1ME9Ob2txMURGcFE2SXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFSZkRpdmdKZEk2Z1hQRHQ4U1Y4RTdOdWFXZTYyNytrYzZuTzQ5dnJ6QUlD?=
 =?utf-8?B?UmQ5bUJWOVIxWFdkb3pmckU3UVBERmpBbTF2dkFBUU5hZDJaQ3VleU9XcjNt?=
 =?utf-8?B?SEV4K0NyTUVuYk5Qc2tSbTBqZGp4ZEdIbEFVTkNrZWVZT0cyZnJiK0M5STBC?=
 =?utf-8?B?STcxK1FLWWFocDNDeGpsSkFRcGJjTGtYRGswb2ZpZU5vUnZjbzdEUHUybm56?=
 =?utf-8?B?Qmo4dlh4cVZIWjdhL0JhZVlvSmQ1Y2RjOFNBeWowZE5SWTZiVnJKZTNVUVlY?=
 =?utf-8?B?RUxORGJHeEJBaTVwcjJXYkZhZzVHV0U0OGF5dDFiKzFKd3J6dGEwM1FyWENE?=
 =?utf-8?B?RVJjV0tTSnVlK1NIYmtDeDY4aDJ0VXU3L0xCaFEwQW1JUTEySlRHci8vYTY2?=
 =?utf-8?B?WVBkcHZSQWxYV0dLVnpGNXdncjFGbVQvUzdoaXpuWWMrcTdGOURDTTVjYU01?=
 =?utf-8?B?M1hFT3hYQllneThiWURyQ0p5YWJia01JemVDUTBJTEFTa1V6NFJ6dlFHL3Qv?=
 =?utf-8?B?RTNkaXNOdWFZTFRUY0ZOVkdORHVRNHRjVmZvNEJQK2tUeXFZTVFoSGNCejB5?=
 =?utf-8?B?UVU1SkpybElVSTZadytER05lV0cwbHprcmlHd1p3bzB6OHRjL2Jyd1hhWnFi?=
 =?utf-8?B?dld3MnIwSVZPRDFCWGJERVlwNWpvOWZHTHl6ay9sazJhZnl6VlNEdDRIakFM?=
 =?utf-8?B?bkpQZ3pPYzQ2dlBmYjRmdkJ6bnFiZDVvUzN6VmpRdVJrNEZpbngyV1BqNDht?=
 =?utf-8?B?bSthcXcwWS8rT2k2M3lucjR6ZFppTXhzdDVyYmdUKzIrRFdmMUhlM1Nhb0Jj?=
 =?utf-8?B?TWFQbWZaVTE3MkU2eVQ5OUlQaEdaTW1pcVNRemsrU0owTDVJVlZuKzY4UGFj?=
 =?utf-8?B?WHdua0RnMGJieldlSXAyb2wwazBoVlNGR1hFQlkvNkVVR21lSW9kQXNkQ3Zn?=
 =?utf-8?B?MDRDVlg0VGtLaXpTNW53NlJHdDE5R2t5azNybkNFLzlxMk00RWNmQU5JdllW?=
 =?utf-8?B?N2pxS1pwNDZ2T0JBRU93S1ZVbURydWVudUZHTmZxS0RzR05TbVJlTktCUW5Z?=
 =?utf-8?B?b1IwTk5meHJ5OGsrQVhxQXhMeW5OeEFINXhCOEtKdWgxRU9pem5NS0tMN1d5?=
 =?utf-8?B?M1VRNE4xKzJWT2Z3SHJ3WUMxOHFodWRVYzBTcUdFKzdhdHVLUkF5bHFNbnNn?=
 =?utf-8?B?M3BLRllhWmhndzZQMzZrcGE4RWlESWE1dGpnNTJlU1RocTcyUzVPVGo1TUV5?=
 =?utf-8?B?SkkwRW8zcHkyZWNzVFdKSTNpQTRWL0JXd0J1OVBpc1hDNW4zTkFWUGUvSWlS?=
 =?utf-8?B?THRDTzAycFh2RWFoTnFhc2NXQUVaWkhmT3BMOU9LQWc4OW9HOExaVDZ2Ui9o?=
 =?utf-8?B?SzFLZGVYcEtMTnlVWXZuWVA3bXZPNm5CWXlaamMxVTZjemRlMFZlK1VsRS8z?=
 =?utf-8?B?Rmg1a0dTSWh1cXpRajdxamE1THFyQnZlR2RUUTU3eGZOMkl3bVkyVzA3SGl2?=
 =?utf-8?B?aFIxUS9wbzEwS0xmcmg1K0c0T0huUituc1dTcEh4bFZiR0NVOGVOb2tkWWVV?=
 =?utf-8?B?ZU5zTmkybG82T2RMWXFLek5qK2hDOTA5UjE4MGlEZzI3bE5QNnppcUpUd1o1?=
 =?utf-8?B?ZzEzcjY1NHArcm1CVWhmYittRVBkTHcvc041SzZCNWptUHYzUjFnNG42c1Bh?=
 =?utf-8?B?WUxzT2RMVlExVFhhWWdLdDdLcm02T0dIcU5pdVQ4UHBzaXJyMThjS0NqUzNP?=
 =?utf-8?B?TCtpcko0WTNsNEZwZlFwSVI2ZnFIMWpkYk5sdkxIcDFJWFRmdEJjRUxaR3A0?=
 =?utf-8?B?RDB3Y1NHbG1WUHhONmwrekNOdTFZL3QzNDlCbTl4SUl0M25pVklCV0FPd1JI?=
 =?utf-8?B?cE8yTk1PenNzNjdCczBGQXpzRkZkYTIxdHB4MjY4R0FOQjFRUHZWVEM1YTdl?=
 =?utf-8?B?aWYveS9tSCtoTmtUNndLT29hYUxKakRPYzhYMmtVSUxwcER5aUdhTEp4Sndh?=
 =?utf-8?B?SUxtZlZsTllxN2Mzc3NnTStKYnlJZjI4YitjalRRU1NaUkorV0dCSjQ2QjRL?=
 =?utf-8?B?Z1NCNHVHQ1N3UnVRU2NQaGVlckZ6MXI5d2daUHNzL2ptSGZBb1hXWVlYVE1m?=
 =?utf-8?B?dUJqTUpVZDdoVXFnMlVrYXpwMTBrN0RzeGMvM2U2T1FabnRDeWFhR1ZKcFNw?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11948317-e786-401c-d3cb-08de040aab81
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 12:28:20.9898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXKsJuBMrA9ltQUj8ue8UTCPFdb1ou/pJaV980bEp+3HU2goR7PUiRwFUOQRR6mb08BPwGRv/XUSq8OVz1mLawcFoauIVKXfBYNI4XroHu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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



On 10/5/2025 8:49 AM, Matthew Brost wrote:
> On Fri, Oct 03, 2025 at 05:10:12PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 10/2/2025 7:53 AM, Matthew Brost wrote:
>>> Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as
>>> they may contain stale or invalid data.
>>>
>>> Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
>>> resubmitted by the GuC submission state machine.
>>>
>>> v3:
>>>  - Don't mess with head / tail values (Michal)
>>> v4:
>>>  - Don't mess with broke (Michal)
>>>  - Add CTB_H2G_BUFFER_OFFSET (Michal)
>>
>> I guess those small fixes shall be done separately
>>
> 
> Are you suggesting I break this is different patch? Seems overkill and
> not particularly how I want to spend my time. This was basically
> unrelated nit of a suggestion to add CTB_H2G_BUFFER_OFFSET which I
> absord, now further nit to break into different patch. This is a great
> way to get to me just abandon this series.

nit or not nit, still the same rules apply [2], and suggestion to use separate macro is a 'separate logical change'

so don't kill the messenger

[2] https://docs.kernel.org/process/submitting-patches.html#separate-your-changes

> 
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++
>>>  drivers/gpu/drm/xe/xe_guc_ct.c      | 70 +++++++++++++++++++++--------
>>>  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>>>  3 files changed, 60 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index c7bd1f6e9dca..55662b9a4f5b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -1137,6 +1137,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>>>  	return 0;
>>>  }
>>>  
>>> +static void vf_post_migration_rearm(struct xe_gt *gt)
>>> +{
>>> +	xe_guc_ct_restart(&gt->uc.guc.ct);
>>> +}
>>> +
>>>  static void vf_post_migration_kickstart(struct xe_gt *gt)
>>>  {
>>>  	xe_guc_submit_unpause(&gt->uc.guc);
>>> @@ -1188,6 +1193,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>>>  	if (err)
>>>  		goto fail;
>>>  
>>> +	vf_post_migration_rearm(gt);
>>> +
>>>  	err = vf_post_migration_notify_resfix_done(gt);
>>>  	if (err && err != -EAGAIN)
>>>  		goto fail;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index fd6e731c0395..92822d131612 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -166,6 +166,7 @@ ct_to_xe(struct xe_guc_ct *ct)
>>>   */
>>>  
>>>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>>> +#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>>>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>>>  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
>>>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
>>> @@ -189,7 +190,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>>>  
>>>  static size_t guc_ct_size(void)
>>>  {
>>> -	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
>>> +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
>>>  		CTB_G2H_BUFFER_SIZE;
>>>  }
>>>  
>>> @@ -330,7 +331,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>>>  	h2g->desc = *map;
>>>  	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>>>  
>>> -	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
>>> +	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
>>>  }
>>>  
>>>  static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>>> @@ -348,7 +349,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>>>  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
>>>  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>>>  
>>> -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
>>> +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
>>>  					    CTB_H2G_BUFFER_SIZE);
>>>  }
>>>  
>>> @@ -359,7 +360,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
>>>  	int err;
>>>  
>>>  	desc_addr = xe_bo_ggtt_addr(ct->bo);
>>> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
>>> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
>>>  	size = ct->ctbs.h2g.info.size * sizeof(u32);
>>>  
>>>  	err = xe_guc_self_cfg64(guc,
>>> @@ -386,7 +387,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
>>>  	int err;
>>>  
>>>  	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
>>> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
>>> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
>>>  		CTB_H2G_BUFFER_SIZE;
>>>  	size = ct->ctbs.g2h.info.size * sizeof(u32);
>>>  
>>> @@ -500,7 +501,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>>>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>>>  }
>>>  
>>> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>> +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>>>  {
>>>  	struct xe_device *xe = ct_to_xe(ct);
>>>  	struct xe_gt *gt = ct_to_gt(ct);
>>> @@ -508,21 +509,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>  
>>>  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>>>  
>>> -	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
>>> -	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>>> -	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>>> +	if (needs_register) {
>>> +		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
>>> +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>>> +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>>>  
>>> -	err = guc_ct_ctb_h2g_register(ct);
>>> -	if (err)
>>> -		goto err_out;
>>> +		err = guc_ct_ctb_h2g_register(ct);
>>> +		if (err)
>>> +			goto err_out;
>>>  
>>> -	err = guc_ct_ctb_g2h_register(ct);
>>> -	if (err)
>>> -		goto err_out;
>>> +		err = guc_ct_ctb_g2h_register(ct);
>>> +		if (err)
>>> +			goto err_out;
>>>  
>>> -	err = guc_ct_control_toggle(ct, true);
>>> -	if (err)
>>> -		goto err_out;
>>> +		err = guc_ct_control_toggle(ct, true);
>>> +		if (err)
>>> +			goto err_out;
>>> +	} else {
>>> +		ct->ctbs.h2g.info.broken = false;
>>> +		ct->ctbs.g2h.info.broken = false;
>>> +		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
>>> +			      CTB_H2G_BUFFER_SIZE);
>>
>> nit: we may want to add some debug dump to see what H2G actually are about to be lost by this memset
>>
>> this would also allow us to verify test scenarios which may assume something was not processed by the source GuC before VF pause
>>
> 
> The debug messages in [1] provide all information needed to reason which
> code paths are being tested on VF recovery.

IMO those logs do not provide the same info (here logs are about what was lost, your logs are about what's replayed)

but if you feel it's sufficient, then I'm fine

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/677965/?series=154627&rev=4
> 
>> but we can do that as follow up
>>
>>> +	}
>>>  
>>>  	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
>>>  
>>> @@ -554,6 +562,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>  	return err;
>>>  }
>>>  
>>> +/**
>>> + * xe_guc_ct_restart() - Restart GuC CT
>>> + * @ct: the &xe_guc_ct
>>> + *
>>> + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
>>> + *
>>> + * Return: 0 on success, or a negative errno on failure.
>>> + */
>>> +int xe_guc_ct_restart(struct xe_guc_ct *ct)
>>> +{
>>> +	return __xe_guc_ct_start(ct, false);
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_ct_enable() - Enable GuC CT
>>> + * @ct: the &xe_guc_ct
>>> + *
>>> + * Enable GuC CT to an empty state and issue a CT register MMIO command.
>>> + *
>>> + * Return: 0 on success, or a negative errno on failure.
>>> + */
>>> +int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>> +{
>>> +	return __xe_guc_ct_start(ct, true);
>>> +}
>>> +
>>>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>>>  {
>>>  	cancel_work_sync(&ct->g2h_worker);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> index 0a88f4e447fa..b1cba250c51c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>>>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>>>  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>>>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>>> +int xe_guc_ct_restart(struct xe_guc_ct *ct);
>>>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>>  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>>
>> otherwise, lgtm
>>

