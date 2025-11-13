Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B822FCD8CAF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 17:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7958510E1E9;
	Thu, 13 Nov 2025 17:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcXH0bMD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56F610E1E9
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763055951; x=1794591951;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=rjQKHuJGPBDIV87e/hIbymoHE1LelS/+BwosHSxVDuI=;
 b=hcXH0bMDTmFXVBlBH7j4IkRxwx6/WYvutQwPx41K1pW9FuP1A1+r9sEn
 nLFk4I6iHmMH2mQDQkWx6FVYLJQC/RFtNN8Wo7fWRaV0lOPUIdJjrnNEN
 O7FWFHGvWSXaYj6k9chasXqkliWj3BqZUBD3JV/JZiwitykaRccyaHKvx
 kSD2F9dH5Zziro1WE/wHYJ8k0u+SxuBFM43llyBjD3BR4DFMv+lx6uBBL
 0CKu6ug8bOn8KtuwZcVyVcJOuNKtB6dAadrl+2QIQWEL9WpaHn60CU5tA
 XKDCg14F/R6Ih52BHjQUXY2JZrWSyopzzYHWfycP4nTl/h4QYK65cKjkQ Q==;
X-CSE-ConnectionGUID: 9vp6cW0MTCqLjbGlH9QCQA==
X-CSE-MsgGUID: INzKFR5gQ0y57SCFucvtTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64853913"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="64853913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:45:51 -0800
X-CSE-ConnectionGUID: 4T1uZmQ1RxKDVPtTbYEJbQ==
X-CSE-MsgGUID: hndhlSQwTfW2fGa58bwmNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193820467"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:45:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:45:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 09:45:50 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:45:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHbJqRf2gAjjVYJLlPcbqz4UabjeUqbuzjdyxs/xCPgWqvhB0/08g07AFnm6ZV+HSvLwOrE8bx1c3ml7LT78Awe4+mm5kP/PR8N0rFubN8ZGWucOetv+G7yeFi5LlI8TZwm/SevzxYSTlmhOycQGc98VxzMjHVbG4tI+ch6dSGzU8tx8oYrhTcr9pGLPCyFlZmaPzNJI4sRa2vK0KQJM8PqITAkcqoZGJ381QE8vY8cO18QIFCGkaccvHon2rIijeDvbVFRLs4mWLxvMMmMdXVlKGrIEYrwLhxkopGeBBkQgmvfQlOzuMxDJlwYk4XB+/XHgGvjGvr7SnBk1V3wfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HV/7AOI98YQuJis4STbxcO3ADC8wDjcgnMktvYyrXx4=;
 b=qr4GtdGWPmEor43Hkea9qDj02ecCF/aMYDN8f2dAzMEufs/VxHTBQUrXVagRMhlg0y/TvhhG7vEI7dVM7klz42F/v0HcPPs1DYDcJW0VRb2U5pifrHjeaziXfUPHuPDNqdnsxik++xwAS6DJdkJqslz4m3YWqsN2qj9s3GoIykVcyumxLgaOb6CK2Yng9TzpM1twiRSXP1uHRzgFngTQURhLdHIgix9BNHuau7/tkMa1KTXyCHdhmeoYpMVZ7AhIr5UuXuA35+Dl7VE0Q0++XVgylf3DLtyneepdDCiCiBbO5OKYnX1A+bYZZQBgCOLF0n1HNpngTd6w/SXe8x28Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ5PPF66B2E927F.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::830) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:45:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:45:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-51-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-51-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 19/30] drm/xe/gt_debugfs: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 14:45:26 -0300
Message-ID: <176305592668.3698.18085811795558934795@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:a03:338::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ5PPF66B2E927F:EE_
X-MS-Office365-Filtering-Correlation-Id: ad93d92a-a33f-40c9-6985-08de22dc7a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHozcGtqZTJET0VJVThoNWxQZkpkdWI2ZTltTTgyQzlKM2QzaWp6amlYbFQx?=
 =?utf-8?B?VHlSOWVMMEZCQ3oxM2UxQWRKN0NmbmtmMmlLa2dqYlVqNWJmeE9BOHJlSGhU?=
 =?utf-8?B?Qkx6QUpSbC9Tc2lVRXBoRHJPWHY0MFNDOTNNUmh5THREZjQwWFJnUjhFZlpM?=
 =?utf-8?B?MkFURVFzTTNVUUl2ZExYOU5KaWNVSVYrUTBFNCtMU3g5VjN5bjBGVjdiVW9J?=
 =?utf-8?B?RzVVZVRLZU1VYmNjUklSNDhQbldpZnhYNHBrY1JWSitjRTV3aGhzbVBxRlhu?=
 =?utf-8?B?Vy9pNVBkVXlsY0syckpnWkZUQUNGdWZxUGJMN1BPYXkrVHh4V3loZFVBSGFQ?=
 =?utf-8?B?YjBDd0xXVkdGSm9VdVlKU1dNOVB6ZWJkdFNRQVc2SFZKNGRKSWJGVXlCS3N1?=
 =?utf-8?B?UGdpNy9lb3B5TVBFeWRVMHBKaDNNYzVCRi85cGh6ZnYySk9mRkdJNlRkSFJB?=
 =?utf-8?B?bmdrR01Vb2pDQ1UwSjBhWDJ4bWVWcFVWYm9USGRDd2NmNzVQUTkrS0FUcCtL?=
 =?utf-8?B?cXZQRHlZZmZmUFZpNzlTWTJNbWR3bDVHWUlzZTlDWllLTDBpUGo0R0J1dHph?=
 =?utf-8?B?K3JDUXpaWGNYa20xUXA4Z3dKeVJYTTQvR2oxalVFc2E1cnQ3a3N1a1NLQ1VX?=
 =?utf-8?B?WlhhMDJ6cjZpWEd0Vm9UeXJoZUEvTnhZSG5ZQU9Rb2FBUTU1bTJJRzYrbm1R?=
 =?utf-8?B?UG4vZm5ub3JvNGhqZ1A1SXJPd1lRUEhzRVpheEJ4NEdVM3NNWkVHZkVRS3d0?=
 =?utf-8?B?ZzNHSG0zNTNoT0VHck9KSzJ2cjF6RWRJSFRyTUNoYXg5VjhzeUVrZmFDTlhX?=
 =?utf-8?B?RFBjaWNvMWFTWnd2S3c1VlBZcGNIOENtbk1tS2M0Q3hLNlRxNzJNeUt5MFZk?=
 =?utf-8?B?Mk5qMEYrTU5wNkVMUThXSXR2NWxaNWt6MmNhQUpvbUVsM2JtbHRaam5yVEM0?=
 =?utf-8?B?SnZwa3RVYkFTaUJWazNLcksxYjBPVjR1WXV1dUp5bndsVmwxdDh3MjlYK2tX?=
 =?utf-8?B?YXN3bElNVUdyQ1VTYVhHbTh5UlY5dk1sQVFKWDBnempGMzNWZnE4MkJpUWJW?=
 =?utf-8?B?NWs4K2NReExmUlF3OU9XMHVyZWtMUngzTTJiamRUK2NqZjdqeGl3UzkxSnF5?=
 =?utf-8?B?cnlDenRCLzZFRDhPLzQ2WklTMlZYRUd1RnpUKzJqeXo5R0lYbzdjWEZCTXlB?=
 =?utf-8?B?NW9LQlN3MmdyWnRxQlVZWHY3RkVtTUtlTFJLeFpGa2pqaTNDY3dBdVJTMHZ5?=
 =?utf-8?B?MzhxM3RqNGJzQUlpdWlWVmRtbEtveTFPd2R1MXVkek1BOWd6NmQwSnNXRjN1?=
 =?utf-8?B?SThjR2hXLzNKQlNvbDN5UWtKUlIxTnVvL1podmZ3eVY0ZlEvSHp5SSs0Nng1?=
 =?utf-8?B?L2hUekJRMENSMVFiTkRkckwwTG43Qm53cnJobjZ1RU5yV2VNUk1XODRsZ3Vz?=
 =?utf-8?B?RStmR1k2Z0lDczdqMlU0Mk9DMmpMcUgzNEVjd0ZKWHcwWkxKdXNsNmJaQnhZ?=
 =?utf-8?B?aDBaOFM1dWtNbWtlT1Rva2pOaDRKUjV4T2xyR1VDTnF1YTRQR2wyMXhpK2xH?=
 =?utf-8?B?WlljVjNMS2ZiSDZSSDV2R1hKOEowVms3UW1pZldOb0YyVEhWSmNoOTFydXNM?=
 =?utf-8?B?cUVQV3BsRVBmTXhRbHVZQllPRzFqaWduMHN5U2FRV3U4bGlxaU1RaC83dlAv?=
 =?utf-8?B?Q2ZtaW9NU3p4Szd6SU83Y1FBQzZRNlVvTGRPcjBXMmxiQUlLSFoxN1N2RnZj?=
 =?utf-8?B?VVpra0JTZWxLZzl3bUlVWmJ6UkFRd1FaMDA0ZEhFZlMxMGdwZCtpc1hMMUlI?=
 =?utf-8?B?Mkdub1N1SllnZmJwMll0RnNMQXZIMDZqZno3a3g5eUxMNHhVVkMxWmo2L0p1?=
 =?utf-8?B?a2RiZEF6eVJkQkFHMHZNSGRkVUpQR0UxbFRyWndnQ1B0VWN5LzVvVVZ6NXh5?=
 =?utf-8?Q?zvlFR/DLQVimJmbB40gVNEMnqxuJSZGr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2NIYzF4R3JlZEZ4V0NKWW5UZlhTaUFRTzdzSzEya21xTytZQytKQzAxMmd3?=
 =?utf-8?B?TlJ1VVZIL2h1MVY5U3BGRzlyUGxPZlQxS0RBaUZpWmFoVHdUSWszaFYxa1pa?=
 =?utf-8?B?RWkwcDlrYUdGbmV3ZWJnUkM2eTBaSy9Mb1h1ZXhTeWdCcHlmNkNodXBlcVEv?=
 =?utf-8?B?bHF5dlYxYnRoajFQckNNMlduUnRPVncrSXpqYjBHTms3L0R0VUdoaUdLeGtq?=
 =?utf-8?B?WG5yd05zS20ybnJrcEVTa0xCNUZzMlVYeG41TmlvMkZ3WEJibW85Z3BHaGFp?=
 =?utf-8?B?M21YQkhFa1JIeHJEOTk1SWV1alhRV2NiZmFadlJFbithOU1sVTBJa2UwYm1R?=
 =?utf-8?B?OERjYXBhMGFicjVtM2FjZGJRaVJiempwL3Q5VFBoVWNoQ1ZESEROYkpXYkl4?=
 =?utf-8?B?L2dEZG90QUdvcFRGMGNObWxIM0FsTzYrUEpud1dpd2dJWVlVaDhmUHVJbExt?=
 =?utf-8?B?VVNTbWhKQ3M4aVNOdGMyamU5Q2drOVovalp1b1J5Q1Nobnk5cldVSlE1YlNX?=
 =?utf-8?B?bmg1NmhLbmxiMVdMTGxpMzdTZ3ZRNlZCV3MvcmcrSG9oQUoyYUxWKzBNZDBk?=
 =?utf-8?B?S2NjL0R1TGpBYXpyaUxCbitIUCs5akJaa0trcXVuVWZqM0lDdU5lbHMydS83?=
 =?utf-8?B?TEp5RFRPYWlESUV2bmNsdzFpeGJzVzdkeUZObDIxcE9zMU92OTlKbVNGRWFZ?=
 =?utf-8?B?YjJIbnBwaGw5UVFUR1poTzFOYTFVUnQ4bi81U241ZzRHZ040aTJiRlVBNWNW?=
 =?utf-8?B?V1VBdyttempkWnFGc2N6L285S1A1UldNSFVseXpIUUlnclZiLzU4aFFTVkd1?=
 =?utf-8?B?cGw5MGNvQjAyK3I2RkNFbjB2blBqekpBdTdQaXhtUDB0a0NYcFFXdkxuSkll?=
 =?utf-8?B?TmltOEdHTE1meUg5alJ6OWZYZmdkWTdqWkdjeXZKM1JwUnFUT0U0cnlBUDlE?=
 =?utf-8?B?SG5BVFNiNmdoVmhzbys5NU81aEVSQXh1SEZaWUJLUTBINVkwQkxDWHhRdVRN?=
 =?utf-8?B?Ky9tZ0xtWnBJN0dYLy81N0liREg4YkdKK0FrZVB1V1ljOFMwZjMyUlNrWDVF?=
 =?utf-8?B?dC9xanZYN2d5bDZlYndXbDNoMzNlSU1iWFhFZ1hzRWFNRTM1cTlOUmtGa1No?=
 =?utf-8?B?V1l0d3I2Vi9EU3FCNm5yY055NmN6UVRqUEcrRVhzNlNwRlFxc3hqaW1yQTRJ?=
 =?utf-8?B?c2ZhV3UzbTZwZlpnWENzZ1VLQnhnZ24rcUluL3RsOTg4YWVldE4zbEF1ZzRL?=
 =?utf-8?B?a0gvVXM0Q1pmSUVQcTBpa3I3Qk9kdHlqaDRrdkU4V21rL3JyS2dMZEJKMlRH?=
 =?utf-8?B?T2FHZjFyeGpjOVBFNUZhaWM5UmJPVTBMTkVTSG5TWjNISFVkdHVxUE54dmFH?=
 =?utf-8?B?ZTZvR0dXV0o0QmIyTHVnNWlwN1JZb21yTG1HL0NRQkxHRm9yMlhPeE9aTFN0?=
 =?utf-8?B?eVhSaU1NVGJ0WlAwc0NFYVFXV3FYakY5RlNLT3Zkb2NqZmIzS3NSWFplb2hu?=
 =?utf-8?B?eG56TUJsZVJRSlB6ck5VZmptRVhJajRhNCtIOWpkYmt5VUNsb3RUa29Qc2hz?=
 =?utf-8?B?V2lIR2tQZHpzMTFyQXI4cGRROVoyekJ3Tm1HVDZweVU1RW1BUlZLaVlWK29P?=
 =?utf-8?B?blpXTmo3YTRGSkhNeStGNDdZbVk3Rk0yem9USThFUmpjS2R3eU9qNkpvQXlt?=
 =?utf-8?B?aTJoUWNhaHpSV1hIQVVxb2duVyt2QWtqT1pBZEcxYTRlazRUVjc2YzlBVlVo?=
 =?utf-8?B?akozT1IwYXRHeGg0NnpJODdkVEp3WlB6NVZEcWNuVGpYRnpSek1OQnpBRHFr?=
 =?utf-8?B?QkhSU3VDNm1TVW41K1pHYkxZZEJpUnN4N2RoemRlTVFvKzZ6NGtPTlFXTVM1?=
 =?utf-8?B?UHNxcktHeCtERURuRkhjNml0bVE5eC9heHgzZm5TWjNoY2RodHRrcTUxSjBm?=
 =?utf-8?B?L0JHSHBCVWlIR2xJU2pNL1I5cEw4a1F2K0FidHdLSHhJVXdpK3VZamhEMG0z?=
 =?utf-8?B?Q1Z4aVFNTEhNNkNFMWhwS0JpQThFNnd4V09mdkJZc0I4NmhiMkMwRzZtTFdZ?=
 =?utf-8?B?cEJQaXdtZ2VXbWNoVUJjNU1FL3BTQkVXN3lPSU9wOTYvYXV0OGtVZmRwMkZi?=
 =?utf-8?B?UlpFbXltVkVrQjFOdkVJTEFjT3NMUkk2azNGUW5hVlVPM0ltZkRVK2FTSlhy?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad93d92a-a33f-40c9-6985-08de22dc7a9e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:45:47.9931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy+OkFsIt7qxSGwoV72xHZR7ct44ZLq6AoypuGo32MyvdZ+bf5P0QUuBR0zSZG+iD/rJSjVB+JRtZtNEABfc5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF66B2E927F
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

Quoting Matt Roper (2025-11-10 20:20:37-03:00)
>Use scope-based cleanup for forcewake and runtime PM to simplify the
>debugfs code slightly.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c | 29 ++++++++---------------------
> 1 file changed, 8 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt=
_debugfs.c
>index e4fd632f43cf..7c3de6539044 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -105,35 +105,24 @@ int xe_gt_debugfs_show_with_rpm(struct seq_file *m, =
void *data)
>         struct drm_info_node *node =3D m->private;
>         struct xe_gt *gt =3D node_to_gt(node);
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        int ret;
>=20
>-        xe_pm_runtime_get(xe);
>-        ret =3D xe_gt_debugfs_simple_show(m, data);
>-        xe_pm_runtime_put(xe);
>-
>-        return ret;
>+        guard(xe_pm_runtime)(xe);
>+        return xe_gt_debugfs_simple_show(m, data);
> }
>=20
> static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
> {
>         struct xe_hw_engine *hwe;
>         enum xe_hw_engine_id id;
>-        unsigned int fw_ref;
>-        int ret =3D 0;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>-                ret =3D -ETIMEDOUT;
>-                goto fw_put;
>-        }
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_AL=
L))
>+                return -ETIMEDOUT;
>=20
>         for_each_hw_engine(hwe, gt, id)
>                 xe_hw_engine_print(hwe, p);
>=20
>-fw_put:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>-        return ret;
>+        return 0;
> }
>=20
> static int steering(struct xe_gt *gt, struct drm_printer *p)
>@@ -269,9 +258,8 @@ static void force_reset(struct xe_gt *gt)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         xe_gt_reset_async(gt);
>-        xe_pm_runtime_put(xe);
> }
>=20
> static ssize_t force_reset_write(struct file *file,
>@@ -297,9 +285,8 @@ static void force_reset_sync(struct xe_gt *gt)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         xe_gt_reset(gt);
>-        xe_pm_runtime_put(xe);
> }
>=20
> static ssize_t force_reset_sync_write(struct file *file,
>--=20
>2.51.1
>
