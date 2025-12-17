Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098ABD6552C
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 10:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAC710E800;
	Wed, 17 Dec 2025 10:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibsiJTMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D9B10E800
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765968849; x=1797504849;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zwN6mn+tzw+3SGDmQmfSo11vrcPhtbM3uOsz3wSPuLU=;
 b=ibsiJTMuGO0mWFPP9/8zJDtkMIDFJ1pqJ/IwGOIWHfz1V6k+Jl952nnD
 k2iAPo3lFTDkDw0D/vdffIw1dBHV7Eg8JuboyddbAkxaEsmnxQ0YvW12n
 v6o4+9sCUOh4tvy9O7cywQAtLdFVe6WJkh1sfx/CkFASrDj6xtJJI/HEX
 JiMzlJNXmo9t0cyG1pUQ3eLpATvuFVVn0kc148tmwsWdAZPI2qfw3ZsVz
 f80rGcHJWcsZZr/tE6TMijieGluimbx4qWs6dJ1ZJL1CX4kdq/rqNBxdu
 wxMu1m0jfHj2p8pDXRCohEyeVktJuCJe1zsY8gHX0mUPVIhjmHarNnQRJ g==;
X-CSE-ConnectionGUID: 0fXd0yc6TS2fVN2QNWsBTA==
X-CSE-MsgGUID: L+UJddlMRTKGEUjpmEJxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79360451"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="79360451"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 02:54:08 -0800
X-CSE-ConnectionGUID: Ifs4xM1WQ3qp2YSGA9oWEg==
X-CSE-MsgGUID: 5eUDtV9QSkC14wfq2CVdkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202470958"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 02:54:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 02:54:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 02:54:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 02:54:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dK6QlHB9Xe4mq3T8al1UAwhTATS2sFQTr9rSW+tsOUgZgBvoKQXAqoNnM3jlVmCYyexVjXSM3Y8Xj0V5jBOzP5LLXr6VH5Vof0PH1YIWNn2pj6snbSIHXjRoT/kFLZnP0TzgA1q2Pgrlh5YBbEWz/TxdKdChWQtRuYm74S4wN3O30g/qVetDL5pduF2sFSHHMCrTo6+lSM/FKWwlO37X/mxoscr8wLfKntf/j7LZHAC65aBfrAnczOlQZB2T8W8eW4x7a1bii083Nh3CikVoHV0B1hrZZif0cA19OtmbuRj2d5gWM92G7Ps5rzuiR51WU983Qf82UAtfBTHqiYV9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdyn8qOTiEH48uqR+BvApb/BvPe0D0s3A7bd6RgYTa8=;
 b=TYsd2ZhiQEun+I0FCm7T/98GODNbuYHiLjVSMWu2mjDxWb6x1mMy45aGTbVYix4QNqVOwpN+IpvdQX2BxLinAwXpGlda5/UvhuelZQAIjfyM3VrOWVUml6j/zxLLWUMV5eKN2Q4F4T/fmJ/x9KrMi8c+KlpvGEaJZ6Wh7zXepw8n4dVR4jsFLEeieL4jpLkV9wW6L10jI8wM2E/rIFZG7DBMaX4oh7ZGBKxCRVKmVFlIeFO/z+bWIEAIZBE33Kai9YQ+SLUB7hx/tTzU38wxu7nGYcagbJnMe/PP8yS8X517GjW22ewuy8zfz+QTZ9vIXnTRqcVIXW6/PU+0t+oC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 10:54:05 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349%2]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 10:54:05 +0000
Message-ID: <dfaff8d8-9158-411c-8feb-b2dfddf85e29@intel.com>
Date: Wed, 17 Dec 2025 12:51:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20251217061728.35768-1-tapani.palli@intel.com>
 <773d97c4-defc-422c-a3a9-c7769f367493@intel.com>
 <e14dc32f-3c4a-453e-b0fe-09da137e172c@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
In-Reply-To: <e14dc32f-3c4a-453e-b0fe-09da137e172c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::14) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4cf0dc-6be2-4ce7-3f69-08de3d5a982e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmtYM3hVSHZGUVJ2d21EQ2UyNnJHVVBtejVnM1FKUW03dU1udHQrR2p3NWhY?=
 =?utf-8?B?NVYyaGRpeDBvY0NHNy9JNkpiSnNqRXpXaUNHSmZleGlsbEk4QWR0VWlYV0dU?=
 =?utf-8?B?RUdRZWdSc3MxSk5VaUtJR0NXbmJFNkM5cHpxc0ZnVXJma255YzVLNlA0MitC?=
 =?utf-8?B?Rk8yZ2ozd096Smk5SDRhekFUVFlyOURaS3RTNTJReEZaMWtrdU9YTi9ySVVX?=
 =?utf-8?B?Y3JEUVJoREZEQ2dQNTJMckJQNlFaVUF4Z0VzTTZoU2VUUG55Qk9iUnZUamRh?=
 =?utf-8?B?SUR5YkhsQ2toVDRNM2dVL3JaZWIyRHJVVzNNWGZmWHkvS0drQzBZdDFGV1pK?=
 =?utf-8?B?Uk1jMjZTNjdmSXFvakJucVRMcGVTWGNXRFJkMW82djlPRGpHTjd5blBMYjRy?=
 =?utf-8?B?aWNJQUgwQVROUFRUZkJxNGRuZUovQnpFTzlIN0U3a2did1Z2em5sNWV6dEVz?=
 =?utf-8?B?YXZWamMwMlBsRUsxeDV5MDI1eGZGV0NESmxrb0JQLzRDYndoenBnUThETFFW?=
 =?utf-8?B?cW56YjdJTitXZW1RK01BWHhrSXNSYWJxTHZqSnMrYloxNmZtejdHendlNjU4?=
 =?utf-8?B?NHIvNFRjd0lGRkNkbVRjY0NhOWY1QUk0eTY0a3JoalZVMFFjUU5SQkoyZTJX?=
 =?utf-8?B?RGJxb3dadHFJb1hmblZ2L0s1RjMyaEFTZW80YWZmejY3Qy81ajUrb2RJZzd1?=
 =?utf-8?B?cnlTeHlIRFd6RDBSbHBGN3AyQVBtNjFaNEcwRGhjb2dmRnM4dnNLQVYyK0or?=
 =?utf-8?B?alFTTVppclpQaGU5aXY2MUNwSHd6L2s1cEtBbHhMYWdSVVNDNmR2bzNEejhN?=
 =?utf-8?B?ZGFZTTJLZnRQQTQ3a3AzMGhDZFp6NHozU0lSVU0wU2xNdzVraXlSZzJQY3M5?=
 =?utf-8?B?WXk1Vm10L2dEOUFueFUvMThzRDl0NjJmRE9yNHlZVmxOVFdtbVlDU2VqQU1Q?=
 =?utf-8?B?c3lkMmNvZVB3YlpDUWhOd01LUG9mNHViYXQ3MmhJdEJNVUo5bTZFVy9qNmVC?=
 =?utf-8?B?M1paRWt0QVFVVnd0dWF6SkRaT3lXSGFXdFJ0N20wTlk3NjA5cFN0MjZTcU9P?=
 =?utf-8?B?TTRSaWdTSlZ0R3RYZVA2M0hLM3N4NVNJMzlQRlU3NWtBN0Z2NGo5c1pwZ0h3?=
 =?utf-8?B?QXIxSjlKUU9VcysxSnRiRHhsZVIrN0RqenhJVmo4b2FYZ0VWWndSNFdSKzRq?=
 =?utf-8?B?Sjg2M3ZDY3N5VGtRalJuWG4xNG5HbEpuTUpWRlBPRkNmbmxNdTgvNnJaQXoy?=
 =?utf-8?B?SW84WjBnUlpzZ1pBdU5KMDMzLytQZ3krVEJZWlphUVBodmc0aFFIUytQY0cw?=
 =?utf-8?B?aFkwZzNuVjU0WkRlYVRzWm1mMUx4OUZPbjJKSlZyQ2hTdFFGOW5CZjNoRWE4?=
 =?utf-8?B?UmpwbUNOS2xFUExtY3h5cjRKZFJZNERtcG56Zi9KM3o3V3VocWVlc2JsS3dP?=
 =?utf-8?B?QTh0bm0wU1F2ZHFjcjRDcmhveloxMnNHczE0cWhXWjhJNXlSR0pWa093WUxS?=
 =?utf-8?B?NHlKTUdzaldCenMzSCs0U3ZrZ1pHUTI3ZFgzMVpwaEpibG9Ma3V2QmN3bTlM?=
 =?utf-8?B?cXJNcWR3WlR0c05tc0xGWnJKZG5UOWlMalZUblZtMVBqM3pLZzc4aG5aVnRL?=
 =?utf-8?B?TVd4MFptV25EMG9pbXJ2VVMvbnNUcnhXZXJnckJCTTRiMTFBb2pZRzVxOXdN?=
 =?utf-8?B?bkwvNjRKL0VHRVhRZGQ0V242SVVza2t4SXJseHZPL29qU0R3dHBpOGlEWGpu?=
 =?utf-8?B?ZXhKZXI0Y0J2RUphQkhEUVAxK1JvMTk4ZkVHM0FDL3MvemxyNjR1cmVZVkpC?=
 =?utf-8?B?akxLbklkeUx5bWRodzkyMU5uRGFFNStBZEMvVFdib0E0TzNDTmQyNXNQMG44?=
 =?utf-8?B?VU1YN0gxSTI5ZFdKdlp2TkJUYlB4R3lxYjYrTVdhcGlKYXpjZWlJWnRBcVc0?=
 =?utf-8?Q?y1AOGjdkyx5bUpVjUZZF+srTut53d+0a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1NqTU01djJneXh5bC9SdDV0dTEvdC9JeDJ5NUpTU2pVdkdLSUl6VzRCRjBJ?=
 =?utf-8?B?MGMxMzJTQ2JhTXRqa0s4T3RVVnY4OEFhTDJadlNLUkR0TXc5QncrangwOThp?=
 =?utf-8?B?T2FJN2V4TEIrUHprL1ZwdldkM0cvVmdxU2UxUks3aUJ2OCtrTkVHa3owdC9z?=
 =?utf-8?B?SnNDY3ZUTVRpbjVJc1l4NEg1dkp6TGRQZm1mamFsRVI2emxIcjExemI4K1cx?=
 =?utf-8?B?SVBhMkgzL2dZWTBWWGpBdUdMUnR3V0lYQm5lcGpCVVdTK2lkZUc3UExJbWlB?=
 =?utf-8?B?YmtEWnhiTFNVbEZadUxhK0RYZkJGRFFMS0YxQ1pBVVR6MW1wb2ZZK3VVa2J2?=
 =?utf-8?B?d0hiSm5xWUpjRnAvMkVVakZRdUo5QWZFbFNVWjFCdmNUanU0Z0JCcXdldkE0?=
 =?utf-8?B?cTdqVmhUaUJmNFp4UDRPdU1LTnJxbnZsMVRBbkNQVzN4TDJPcVNBbjNkV3d5?=
 =?utf-8?B?cXV0NFFWMFZxbUd1THN6TTFyZVFFWUVRb0hRYnhoV0d5alY2Z0NUaDJvLzRh?=
 =?utf-8?B?WVYzZEVSQ2dZZ3FwZ3FzRHJnb0xwSUdkeEtQYkkvTDFSay9EWWhrend6NFhX?=
 =?utf-8?B?U1ZRKzc4ekNUUlpPZE1iMFJYKzlQRmpNY0RlZ3dqdEIwVTV6RmUzRmluZDhv?=
 =?utf-8?B?UzZ2UFlraWNLYjlXVmFJenQzNmZ4N2kwVk53NUJvblo0YmpYYWU1VXdOdW5I?=
 =?utf-8?B?eTAxZ2xpTmNIQmJOdFRvWjlWVkRrNTl2cXk1TjlVeW9sTUU0b0RuR2V1Wkhj?=
 =?utf-8?B?MWZTeUdoQndCZVZCY0F6UklsQktSd3VYMmc4QWZiZHhlL1Y4MDJqYUhaNWRx?=
 =?utf-8?B?c2haQWEzQW52WFdsdFkzby90elZlTGZFQXFZb1BHK1d1TG1LcjA2S1ZhV083?=
 =?utf-8?B?REpNU0RUNVo0RUJhd2hVQ3pHbmhIZDlDaFAwRm14UnRuRXBHUmMyTDZmb1Jo?=
 =?utf-8?B?SGNOVGVhSy8va2lqaURmTHZiaXQvNHorRFgzNGtBVGZHV1ZxSFJGcEdBN3VR?=
 =?utf-8?B?MnZFaGRtUFRsb3Zaem9IL21uYWd1d2dxTHVzazM2bCtGSURLV293VUlWSmFr?=
 =?utf-8?B?OTBIMDU0blZWYzJjQUd0ZFlvYnByWTRCWU5reERRcG84QXg0ZENjcFZ2dFZv?=
 =?utf-8?B?V3E3S0wrc3g2NXEwWWp0M3pMdkNtejVYdVUwdWllMzUyenB5WmE5VGtQclJQ?=
 =?utf-8?B?SmI1SERGSTdqMFVyVDNleTFsZ3VYNXRaenBXdzN6RGpMRFdHOTQ0VFIzRVpI?=
 =?utf-8?B?K2s2VXIvZXphdGhIbGd4QmE5VVVscWs0R3RVT0V3MXlJelZLd2VHcWdRZVA4?=
 =?utf-8?B?Tk0yekpLVnpXcVFGSEVyRTJweXdOSHBMbVJNaE84ZkhEdUlLbW0vaXFTRnRM?=
 =?utf-8?B?b3NoTUZSRGIrbHhNTittek9WYmFuQ2E2WEFCencrUS9PQ3QzV2RtTW1teVlz?=
 =?utf-8?B?eWlLYTNiK1ZYdUJTRFV5YmtFQlQzVEhHMmRKb1ltdTJLbDZEdEhKUWpkUjlP?=
 =?utf-8?B?K1BSdElEQ3hKWXk4NDhwbnd4cGxmaDViSTAxU3cyd3FqQzFxZWNzTFFMOUIx?=
 =?utf-8?B?Vy9idnhvUnhyRE5VR0RTVmNWdUczdXJReGdOZVRCSllRSDFYUk13WVFUREg1?=
 =?utf-8?B?TTA5dDRkdEtQcjBJV3RKYmg2azdreFpnaXdPcitHOVVKU3h0YXI2U1g4TGNB?=
 =?utf-8?B?NHNURUEyZ3JuYXY3Y2h4bWVMbzJHa0pQRzN5SkxPYXN0dHdmbnlLVFVHYnFI?=
 =?utf-8?B?QTRublhUU1B3S2dJMlowbkRvcTlTSGZvM21JMlZDK0dTTGZJYmpzMENoMzZP?=
 =?utf-8?B?eTcwTlhybXBxRkRoTkZLc1dEQloxTWhtZ1lXaTBoYk1LVlZrU1RudUdUMU4v?=
 =?utf-8?B?SjBkeFBKd0FJcGVPV292S3ZPK2wvZ0o5RlE1U3VUMC9RQ2lLWHlXUkQ4MGY4?=
 =?utf-8?B?U2tTUVBGWkM3LzdoNU5waHIzQ290STVoc2N6ZWx5RzR4R040N0FjV3hSblQ0?=
 =?utf-8?B?azVIeHJIT3I4eFhlcjllM1pSNTRjZXVnemk4cnc2aHNJYnVBQjdhV2xLTFNY?=
 =?utf-8?B?bGMyM0R4VUcrN3V4YWp0UThPdXVHd1NrK2VuQ2ZtTkNibnZGOC9yUGFHM2Nw?=
 =?utf-8?B?TEVURm1pTlpucnBoZUQ4VXFyRk1OcG5SanRNd3UxQWFhVThwaitDNWRMWFZv?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4cf0dc-6be2-4ce7-3f69-08de3d5a982e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 10:54:04.8709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwCW9O2XxraYccYcMzWltELZwkIrL9qdPUne1wZ4WoIu7RV7KjHw1Ze9GKsYMaqCGUXUwlrkUsZU28KDeHt9GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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


On 12/17/25 12:31, Matthew Auld wrote:
> On 17/12/2025 10:27, Matthew Auld wrote:
>> On 17/12/2025 06:17, Tapani Pälli wrote:
>>> Helper function xe_sync_needs_wait expects sync->fence when accessing
>>> flags, patch makes sure we call only when sync->fence exists.
>>>
>>> Fixes NULL pointer dereference seen with Vulkan workloads:
>>>
>>> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
>>>
>>> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to 
>>> dma- fence mode")
>>> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c 
>>> b/drivers/gpu/drm/xe/xe_exec.c
>>> index 730a5c9c2637..ea368f02cb9f 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>> @@ -184,7 +184,8 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>> *data, struct drm_file *file)
>>>           if (xe_sync_is_ufence(&syncs[num_syncs]))
>>>               num_ufence++;
>>> -        if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
>>> +        if (!num_in_sync && syncs[num_syncs].fence &&
>>> +            xe_sync_needs_wait(&syncs[num_syncs]))
>>
>> In xe_sync_entry_parse() it looks like it will always populate the 
>> fence for the !signal case, otherwise throwing an error if that is 
>> not possible. And xe_sync_needs_wait() will only touch the fence if 
>> it's the signal case? So it seems like this should not be possible?
>
> Sorry meant to type:
>
> s/touch the fence if it's the signal/touch the fence if it's the !signal/
>
I'm not sure of the complete flow but it is quite easy to reproduce.

Here is the stacktrace snippet:

[  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
[  118.410940] Code: 90 90 90 0f 1f 44 00 00 55 48 89 f1 48 89 e5 48 83 
ec 08 48 83 7e 08 00 0f 84 79 be 1c 00 31 c0 f6 41 4c 01 75 11 48 8b 41 
08 <48> 8b 40 30 48 d1 e8 83 e0 01 83 f0 01 c9 31 d2 31 c9 31 f6 31 ff
[  118.410949] RSP: 0018:ffffccec8ea7bb18 EFLAGS: 00010246
[  118.410957] RAX: 0000000000000000 RBX: 00007ff23812f460 RCX: 
ffff8c1790db4800
[  118.410964] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
[  118.410968] RBP: ffffccec8ea7bb20 R08: 0000000000000000 R09: 
0000000000000000
[  118.410973] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff8c1790db4800
[  118.410978] R13: 0000000000000000 R14: ffff8c178b67e000 R15: 
0000000000000000
[  118.410984] FS:  0000000101aff6c0(0000) GS:ffff8c27350d1000(0000) 
knlGS:000000007fe20000
[  118.410992] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  118.410998] CR2: 0000000000000030 CR3: 00000001037ef005 CR4: 
0000000000772ef0
[  118.411004] PKRU: 55555554
[  118.411008] Call Trace:
[  118.411013]  <TASK>
[  118.411022]  xe_exec_ioctl+0x375/0xea0 [xe]
[  118.411377]  ? __x64_sys_ioctl+0xbd/0x100
[  118.411392]  ? do_syscall_64+0xa7/0x580
[  118.411403]  ? dma_fence_free+0x1a/0x30
[  118.411419]  ? __pfx_xe_exec_fn+0x10/0x10 [xe]
[  118.411752]  ? drm_syncobj_array_free+0x56/0x80 [drm]
[  118.411915]  ? drm_syncobj_query_ioctl+0x20f/0x460 [drm]
[  118.412035]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
[  118.412372]  drm_ioctl_kernel+0xae/0x110 [drm]
[  118.412524]  drm_ioctl+0x2ee/0x5d0 [drm]
[  118.412649]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
[  118.412989]  ? __pm_runtime_resume+0x5f/0x90
[  118.413002]  xe_drm_ioctl+0x61/0xb0 [xe]
[  118.413329]  __x64_sys_ioctl+0xa3/0x100
[  118.413338]  x64_sys_call+0x1060/0x2360
[  118.413347]  do_syscall_64+0x74/0x580
[  118.413355]  ? x64_sys_call+0x1060/0x2360
[  118.413360]  ? do_syscall_64+0xa7/0x580
[  118.413368]  ? __do_sys_getpid+0x1d/0x30
[  118.413377]  ? x64_sys_call+0xf9d/0x2360
[  118.413383]  ? do_syscall_64+0xa7/0x580
[  118.413389]  ? x64_sys_call+0x1060/0x2360
[  118.413395]  ? do_syscall_64+0xa7/0x580
[  118.413401]  ? sysvec_apic_timer_interrupt+0x54/0xd0
[  118.413410]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  118.413418] RIP: 0033:0x7ff29c93287d



>>
>>>               num_in_sync++;
>>>       }
>>
>
