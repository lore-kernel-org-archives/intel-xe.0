Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E97DCD8CB0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 17:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FAB10E081;
	Thu, 13 Nov 2025 17:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfPueBf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FFC10E081
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056225; x=1794592225;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=XkKQ3BbrxbZhM852LPBKdgHsZ4ZASDmHtZti3BoEa0U=;
 b=XfPueBf7ZbpBiMoekUrBI13aHWqZCTWbuPbIqJ5vNNbWX1LaC/M+yF+9
 yf/Tp2hrQXeOb/KoKW8BNZiv8RJhM9f6sa2glw8yslvdWQsh+ALW7yRSs
 G6ml7OUnjy3Clb7Z2DlBsg8WcY7GfYGTs2ZWuERQ+AgWOu6h+f0EdaobJ
 LpJ7Yw6OryF4RCXW5kAnq1+cSTQT6kX3vAHu/l+7H6Z7plUshHwGoG4By
 vdLoxgLWTriTy/8ASGZQB0OxM0+RboVVXJN0ne0n7JlS6uYMzz0NfKby6
 tXVEcZkU57HWnkcK9QTzV0GuudEm8EnePJ9oKPGGBrKgT0UXTvICbQYlv g==;
X-CSE-ConnectionGUID: hve02zu4TSCsq2MTcOCX5Q==
X-CSE-MsgGUID: bCktImEmTxmuT0vriBlL7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65030750"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65030750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:50:25 -0800
X-CSE-ConnectionGUID: AtBcPCJ+R9WI9dniTMAh3Q==
X-CSE-MsgGUID: lNZVomyLS6aseIx9vaP+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189825340"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:50:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:50:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 09:50:24 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:50:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtQ4Sfp1Z2WmPwiQ3PHqMe2SIBboypWmY7U669kekBIan8YmLAFnOlopjSmSjsZo4UBL/3umUNi3eW9MUQKiSpD3nIy8R9tNyAayjztLSnZLcMCsSetCSi1rXc0yp5oY8zJyVhtcP1OSWV1dZsBueU22bSGL0+LsWWRaXo4N3T5Q/94EoeIP9L5g5yUix13NrRVxgn9n8hUW95StezZP9HMSinevsQs3eRXvcxwIEetY4qiiorqwQ4GK2ICt3o6V8GkazaK+hqZi9qQwHQ9fIpLIG8M8OceBLcaDVeStNbduIIY3fwnICozxnd+XnDOqNvEwW0yY4X9QC/GQB9b77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwm3y/KypLo/crU/cQcxJ1eTYQFnJkx1TQRWl1o613U=;
 b=ydvPMalg/xTxZC1vtSwmqZuLEbJ8vtFZ+jLMn42G1CM4jXv186NnX/4s9w43zySGKlRZpd9aopJT/6AWIxSqe937XWfwQcc2yyyfav3EYt7WwyiSppphOdoa3F73KijrlJzjKD1FvIFPpCKj0IPYCddVlwQ8le4Y9wfyMD1WmFZDHNBAhkZaMNS/f+tgB/0+/Z/CzacKgi6K3ANb0Md5CS9m6mNj0uxYhU+nqN1a0ADNs9LFB+5XjDzh2uHAVtlpcEgXpT+bDrPMiYNWyYQBok6CSfwSGOdYYaLkVoSKfcFE07AcGl8irkMHOfT6kYvcvw5dsZiLbc/+OY4H32Oc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 17:50:21 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:50:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-53-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-53-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 21/30] drm/xe/query: Use scope-based forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 14:50:00 -0300
Message-ID: <176305620042.3698.9799853462384317318@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV3PR11MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f617c82-b059-4d2d-4a4b-08de22dd1dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU85MDJWRUhDSjd1NXRnSzV6ZE5ZV2NpRXZFZ1R4OU1QTzVyMTFQblFIT1FL?=
 =?utf-8?B?K1UyMlExVkx1N1hacXA2MndFeUUzSHY0T1JUbW9UeExzMjJQTVZoWHhQYlRp?=
 =?utf-8?B?SXVYNWFDUzU0TGhMYmFyWDBQdml5V0lpNEdLVzNIZUdDT1NWSHdQSGREOGtR?=
 =?utf-8?B?MHlvMTF6aVU0WjZUbllHLzFxdTFuT0gvZEt2ZWVnSkRSQUlkN24wVHhvQnBn?=
 =?utf-8?B?N2xQK253NCtoSndoTERhWEdxazlKQXhIL05kbEFFTlM0Mk1HMHVOS1hYZFIz?=
 =?utf-8?B?b3VQNEdvbGxQRWpyQUdlbHpvVmJjcURnMFNZcnpZTnYvMUZhVlVqVlVRajdt?=
 =?utf-8?B?aGFCTjJ4ZTM1WjNnSndlTkxzZk5NNHk5SmlGTHZaZnZCcndNM3N4RW5kOHFl?=
 =?utf-8?B?VUYxd3cxVURqYWZKYVp6aktyQWt0ek9lYnNEM2pibkQyWGgzK1RUajNYVVVV?=
 =?utf-8?B?WnNEMGxZb29pNTV3eWJSZzlSUDFJWHJkb1I2eDhLMC91RmhpYUhyTjZ4bnYw?=
 =?utf-8?B?THFxN0Z1cE1pdnZIY3BwOGxWclc5M2JQdHY5b1ptSXZBVTljQnM2SUdhNS9K?=
 =?utf-8?B?NGUxdFVSTWNHNk91WW5IandYQTBlUm55WGdiMmZhdnp6L1UvRFcvUE1zQXBi?=
 =?utf-8?B?M0FNZ1pteVZGY21EZzFuRWJGeW5NaEEyY2J2V1dVeXpmL2pRam01MWZYMVVX?=
 =?utf-8?B?SGtOcVo1eXhyVUtveVpudko4NmNidUlobkNoNkRjTko0SDJJRGVOSkVKMW9h?=
 =?utf-8?B?aXpHSlpDZHBOVmZiKytGQjl2STV5NGVFNjRYNEVGYUFIaS94cGZQRG1uN2c0?=
 =?utf-8?B?RnUxWCtZTmNxZWx2K0ZLZWhDemd1QStrTW56TG81WjlqemFhRHRoVThaMndC?=
 =?utf-8?B?b0NvNS9JWUkxbnZ2Z0daN2RiZG94Q2pDdGFrZ0dkenNsUHJHbWM2WTRVZHFv?=
 =?utf-8?B?NzFKUFNpNFJyREhqWHFmZysxU3ZkTHNzRWtzWnNEUnJNbkdYMmlIN0x4eFBU?=
 =?utf-8?B?c3NqL2h1WCtuUGRZeFZyYWhSMVlyeGdVZEFnWTFINVpHNW9nNVZjWkk0TS9X?=
 =?utf-8?B?Y2NtM2dWd3c2a3gvK2o2ZURoNzAyZ0pEeitXWmpubktWMjBhOU9qSmc4TjQ4?=
 =?utf-8?B?R2VpclRiY0cwS0g1YUpvQlFpZU9PRWw3d3RKQVZkVzRPSkF4MXNaNTZINnNP?=
 =?utf-8?B?U2xOblNKYURON2tzK3l2dGpyNjFBbEw3UGxGQUd5RjJHZnN3cmJzamE2a2V6?=
 =?utf-8?B?S05uT0s3aDc0TlZUbHJyK3pLUFc2UmJ1NkV4YTNDOTl1WWczWGtDV3h1M1NN?=
 =?utf-8?B?dVZqTFJhWmdaYXQxK295Zk04V0xyUVYrN1lBbnZXTjNnc0g3Q1ROdk9qcnBs?=
 =?utf-8?B?N25zK0x4bW1oQWlGeENzM2FLcjRpL2ErdXlaTUVFNEtWUXRIOFhVRUxBOVp2?=
 =?utf-8?B?MGdEdEFHS0psSzUyQytIeWgrMlorV0tLNHZCdTVPdjIzNnNrSTJGNVVTNFJU?=
 =?utf-8?B?eFd2QTMwanpEekdDd1E0alpMd01xS28rbEZOa2RuV3krcWFhdlEyeDlycEJG?=
 =?utf-8?B?MGRIbS8wdFZHUnFvOXVBaW9ZYkhvTnFhY2J4MldNOHVsT29kRTRrclcxb05x?=
 =?utf-8?B?b3ByMzdoc2NtTHRIZ1AyYTA1RDFaQmJDRHhzVG8rb2Z5dk5ZN0tNb29XSy9h?=
 =?utf-8?B?NVl6djZjTm56Uk5QSllUNHJwUi9ONDJUeDNoTkRrNElzVTRRYmJUc3FmYlN4?=
 =?utf-8?B?cVVYOWhJQUQwakdFNjRkVkZOa005R3hOcjNsL2hOdkwvUHU4b1VHdVVGRndv?=
 =?utf-8?B?ZmtnMlhYWllZNGQ0Q25URjNvQWZpQmtJZXRKQmlpbmdHRXRHYlZ2NTdyVEFX?=
 =?utf-8?B?OXRGRlZPSkducTcxZnN3V2o2OFZqQkhqeEJSdDU5TDQ5VUIzeW5mOS9lOUVD?=
 =?utf-8?Q?1K1L5Vqfae8hWInAIcyHY7cTW1W9Lju3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZnb2JSa0ZpZ3lVMzZWK1BENXZtbHYyVWg0dXhEb1VyNHZSN0JZWjdnU3Mw?=
 =?utf-8?B?K3NCdVJGNFRZWFNDbVMzYzF0bWdzT0VQWWR3WG1ic3ZtVmJyUnJRTTRhejZm?=
 =?utf-8?B?S3Z0R1U0M0h3NGN1eWFxTHlJOWIyZHdmSFRIemtGeUJ6cVRhNk5ub3ZmUUtv?=
 =?utf-8?B?RDZDdXF3YVNuQjV1dU1Vcnc2VVlHbU9RYzhnWnlGYStLOUJkK1M1cmNPMVFX?=
 =?utf-8?B?RE1JSDUvcXUzRFRER3NDL2p4WXRvOWJLSVU1enpra244UlNSaXZ2YmhTdWZt?=
 =?utf-8?B?L0J4bFl2V25TVitqYlFjQjJYOUliTE82SDZNSzF5WU9uZ0hlQnZxOXBsMmNL?=
 =?utf-8?B?TGNtUEFHWFdIU0UvNnIreE9SU1JEODdJK2U1RElrWjdSeUF1UTducXdNUEVQ?=
 =?utf-8?B?WFZJZnJ2bUtaMTVOK2NTWXRkejNYM3EvZWdZM2xETGUxNEM3QzZtaFVDUU1k?=
 =?utf-8?B?SDR2SE5LZjBRbTZxa2IxUUVyZXJPcnY4ZkV1M2dodStXczdxbjNwajExVzZl?=
 =?utf-8?B?RFdEZlVsS29qS0tKQ1I5QTVKZHBWZmllcCtsUGEzVWxkSVpXQUxRTkI2UTRF?=
 =?utf-8?B?dVpSNmVDODBpUWY4UlEyVG9pcFArMFRabElnd0tpTUVLMHUxYmJtZ0p5bkV3?=
 =?utf-8?B?S3M0Y1JweGlSdGZ1RktNZmFCaEpKQzMxaThEODlMWkg3aVo1Z0RXZGxGZGVN?=
 =?utf-8?B?ckdXKzNlWHVjVXFNRHN5VlNOeXJzUGswQ2Z3MTk1Ris5Y1NJM1pPS3ByWXNv?=
 =?utf-8?B?cFltU2trenJPT253SDExZEJvbm1SdEJyVlJhMjRYOGVyUXFYUXQ5bHJYNFIz?=
 =?utf-8?B?djFpeWQyaENSSm91Y1huNmpPY3RyVHY5OVNZMzBVU0JIMnVzUlBvRndwclZq?=
 =?utf-8?B?S3E0aGx4RkRzR2Jiakp2Uy9OOVMwVlg3Vnp1WFhOV2ZVV013RGJ4SG1PRnRo?=
 =?utf-8?B?VC9BUjJmalFMTnlPdHVkQm02RXZ0N0lSdm1GOG10RFZwd201eDhBYnh4WVJt?=
 =?utf-8?B?cmUvbGJnR0tjeXBJVjY1b21QVWxMaU5qTi91ZTRzVDcwRDU1NU5QK084WFB2?=
 =?utf-8?B?U3BUT09iNjFkWDNOcHF5enVlekVGaktmWm1ZUkZwUllpc3VhM2tWM1RzaUdL?=
 =?utf-8?B?dWdPNUdwRkdjeUVwaUQzeUlXa3RhRlg3Y00xVkdkalBVcjFPbjdVOXpuZjkr?=
 =?utf-8?B?alA1dHQ0NTlqc3VuNVhKVnVxdExuY1ZvbVJacElGRCtxVEhCNGxBYlBBRFVD?=
 =?utf-8?B?RWhLVmh4NzNXRnVleklaOW1RVTVhRnJaMy9RbmJBWDA5dDI5dlhTckxlL2sy?=
 =?utf-8?B?OXFpSzFvbURWdys1L0l2eVdmb2l6MGR3dS93VGd3Ty9NeDJMamZJaUhtT2NE?=
 =?utf-8?B?MXFoVWNRWlRPUzJwVjVVRHYrYzQwYWNhSTJza1NBVWF5TlN4aGhIR0E1VDg5?=
 =?utf-8?B?WFBhaC9OdHJlOE5aZStwdjdVbXNvNzFOdVZpWDV3SGxPSVNpandLWUlIVDI2?=
 =?utf-8?B?UVFEUCtVMTFKTC9YelY2VGlKWUl1MHBEMGpjMU15K2wvQnZmRkFBMkpCUnRs?=
 =?utf-8?B?Qkh5TENraWNmOEh4TDBxOFk2ZmQwNGRuZXV2VTl6ZUozRjF2Tzlzb2kyR1Ra?=
 =?utf-8?B?SUhVYW5aMkpScFdudjVyNTJuYU1tSmdWZDJGS0d4OHJxZjR0T1ZLTzJNU1o4?=
 =?utf-8?B?RjRXUTRrMlQrY1ZlLzlBRGNpa0JVcmMzdXRrNTdXaVN5a3A0UnFNSVBsSDlE?=
 =?utf-8?B?a2EvRGVBUUpFaEpKWXBuZmlVdVNyOUpGeCtGa2M3emJhc2hFaHU0amJ0NG5t?=
 =?utf-8?B?c29PelI1ekc3dExwcmJqK3RCeTYwZENmMDJXdGFlTTloMFNjUUdGL094VTkw?=
 =?utf-8?B?VDdtMG5TZ0g1V3QwZDE2NExKS01YZjc4clV4NVc5Mktsdzh1bXhCd2c4ZXNT?=
 =?utf-8?B?R3pOMkgzMFRGaGNKT2lWb1k3cWxkNEJuN2dXNW9iMXRNRlI3aUo4TnN3MmpL?=
 =?utf-8?B?aDVKYk9YbW1VL0QzY2Z0c0RsdmJoV3ZHMEwvYTA0dWJpQ1N5dzQzWWx3ODJa?=
 =?utf-8?B?cHVyZ2gwd3FseURCNzBtbmNxN21pRU0yQUIrWVNMbkh4UitMd2QzVFZOViti?=
 =?utf-8?B?Tk9pT1NsZ0g5V3ZNS3JiTXpBMFlXWHlrWWRXMHNMdkczQmhzclBXNHBaWi9K?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f617c82-b059-4d2d-4a4b-08de22dd1dc4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:50:21.6966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVDn+K+dTfOeZunddXlNwkVwSHcltOAQjzftd2L44XfOVw5v0kJVBFKA7XhKm0oFWKf2L083zvp7S8wrDM/W9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
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

Quoting Matt Roper (2025-11-10 20:20:39-03:00)
>Use scope-based forcewake handling for consistency with other parts of
>the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_query.c | 16 ++++++----------
> 1 file changed, 6 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 1c0915e2cc16..a7bf1fd6dd6a 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -122,7 +122,6 @@ query_engine_cycles(struct xe_device *xe,
>         __ktime_func_t cpu_clock;
>         struct xe_hw_engine *hwe;
>         struct xe_gt *gt;
>-        unsigned int fw_ref;
>=20
>         if (IS_SRIOV_VF(xe))
>                 return -EOPNOTSUPP;
>@@ -158,17 +157,14 @@ query_engine_cycles(struct xe_device *xe,
>         if (!hwe)
>                 return -EINVAL;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))  {
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-                return -EIO;
>+        xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL) {
>+                if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORC=
EWAKE_ALL))
>+                        return -EIO;
>+
>+                hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_ti=
mestamp,
>+                                   &resp.cpu_delta, cpu_clock);
>         }
>=20
>-        hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
>-                           &resp.cpu_delta, cpu_clock);
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>         if (GRAPHICS_VER(xe) >=3D 20)
>                 resp.width =3D 64;
>         else
>--=20
>2.51.1
>
