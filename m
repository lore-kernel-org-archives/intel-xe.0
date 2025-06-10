Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80662C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 06:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289E810E00F;
	Tue, 10 Jun 2025 06:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9m5+ow9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5D510E23A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 06:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749535890; x=1781071890;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rGUUee/fTRF69C2u3QQZ4kJPvgziBqWhgo93L8RSNwY=;
 b=X9m5+ow9HkE78duMu7JH5kCXeUpJX8B33mj1Eb6EgBwXHOrVrNczMsus
 oyLpWPokK/ycKbigk6cL5ZPsoxTi2FAdjdfzwa+zU4NzOWaQPYgfdXrek
 l8e4KDi5xIApSgGty44lC8PJSME6e0XCPqKolIIf90soU8t4Lmfkr1yFy
 ieIE7VLfIvBa7raN4biRmDmilYLLNvxAXfnaC9SXlramn2sGNsBf16HHX
 b+DbDUic8boehzN48JY+IayzBSyde50mdjc0Vah9kXfODj/xyIcpefivy
 FBiPEesfdQaYgCyGp+MGYpoPx4xBe7SCw/Hqlj0WuGvUsINpUejYwg+RC g==;
X-CSE-ConnectionGUID: wslmqcTqRxyAAQrM+hnbtg==
X-CSE-MsgGUID: X5FOqn7XTHSOs7jQd5auGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="54261014"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="54261014"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 23:11:26 -0700
X-CSE-ConnectionGUID: dAq8tfHSQb6r6VmeNTFTRg==
X-CSE-MsgGUID: 1so43pN7S4icQ8eujTfQTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="147244461"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 23:11:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 23:11:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 23:11:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.87)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 23:11:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMFyjzEZGNoPA5s8q7/bFX5P2CTWP8DIEcv6U1VoqMTqconDXF19mujAWZjAHFcgl9EZ6hLIB1f1lMHhYhmMlJ4FUJIY3caqbvZ7YBui8VNoLB/x2oDzMQaxfpvhZbKjRWqTyNfN1wJOmJWKyyzCrtb3X+rHI1zZI2yuBBZecTZoE1vd1oJxWB7V8yhMyvUN0dcxfSbBn9Df34loFpoJOmxRH9Ud33RsSWofXziFTeLElNPVsiH2sJb/10FTcwWpqM+xo2PuG7PLE9tngjoWI8XSQafsr3K9tvLmqy54JLruMnDWXhsk0U9ZvdgurNXeKS+0LKq64Vv/AgHCHwfGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dB10rFH/ppyzHeCJZCKVBOI63/zZaqv3wNt1q1EG0U4=;
 b=u9rPeFrS9HpzBQtB/yQPbpvlQTLum7AIY6+RN5Qqqgspo2RZBxWkwTy7xXzGDajP32AHa3ObmWA7VnkMpWcQABfdjc7X/2wrxvNd0b2QYeadloToVD/RtDISbXEo9+hNDD2Or1mEN+9HNwbLC3XBL4JGExpul4+ZEm2VPJVsbEkzzyqV4mrVlJSL+2BCB2UgEveCwHb6hdNEX9d1lJsOticqxT07ixin0L0e7fBiWP7rtc0Ri1atVSslSQwKkD3SYMuTigAX16jrLqAk+oEzReHFmgTicoGowW0xcQ0Qy11qG4ntPwAUtgIO3t58GZbdYHlJvb/1tYVBFgGMxcFGSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 10 Jun
 2025 06:11:07 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%7]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 06:11:07 +0000
Message-ID: <c9e93180-72a0-4c33-99df-e699cd05dcc0@intel.com>
Date: Tue, 10 Jun 2025 08:11:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [2/2] drm/xe/pf: Print configuration KLVs using debug printer
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250604190021.725-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250604190021.725-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0245.eurprd07.prod.outlook.com
 (2603:10a6:802:58::48) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|MW5PR11MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ed56c5-ee8f-4f95-1f8a-08dda7e59659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUdBWkN2TXM3VG9QSm9GZDg0Nmo3cFpsY2RlTjNBOEU2N05oRHN5SzJKWTBZ?=
 =?utf-8?B?Yy9mRWprY2EyREZEMUF2WXQ2ZEo2L2NDVzlTdjYwa2JscEhaeUkzUGtnN2Zm?=
 =?utf-8?B?UHpyNUxVN2hQdWZSZXo3RzVvNzAxNjc2NEMzSXJnMllrQzRMTjFxdlYvSU5l?=
 =?utf-8?B?QVNWb2pNMlhzSFhnU3ZheXRFTEwrbytudVA2eEk4bmxKc1FEMFgyaDVOZzZm?=
 =?utf-8?B?M1JRM2sremFyRXNtU0xBZnNMdG5TNnJZSWowbGI0Y0NHdjAyd05zRnp5VVlY?=
 =?utf-8?B?RmFRY0lac0h2bXcyaVNiZy9XWTRlWnZuZ1UrcUt1b2NZQ09nazFGcFAveEVq?=
 =?utf-8?B?bVp0QUk5dy9uRTMwSklzSXFwekNCNEduUjFOdGc5bUFkanREY2hTei9DaGhi?=
 =?utf-8?B?UWpxb2VvVzN3a0VJSUUxaXcyQzIxMVJoaStlZXptMGI0RFZ2WHZIQXI3NVpK?=
 =?utf-8?B?T3lING4yZzFJT0lCRGI1eVFtZ1ovanFmYjh1L28yVnNIUkN2TGhLVjJnQlNW?=
 =?utf-8?B?dk9ocTZMQkJsT0RIREMyaFZSaktzck9lZG1ldmx1a3ltMmRqV3VadWZ5UnZS?=
 =?utf-8?B?d2EwMzVMT25jMHErQmJFZzVoZU1HWVFLVHk5bnZFV0FDdk5FTnYrNHlxcm9u?=
 =?utf-8?B?YkN4OHBiRVlQMHl1SVVZNVVJTWo3aDMwRXp5a3FCYkhSR1hPaUFEbDdzV2NC?=
 =?utf-8?B?UGJmQjFlS3pOZVlZa09BUkNHa2xLRVk3K2ZONFNnVzdOdzJDeU02Z1Nib3lU?=
 =?utf-8?B?ajhiMEhnc3daMURnVzRRUlU1RHNuakxuR05sU1BCOFV2ZWhHRHdWV1ZSRGRI?=
 =?utf-8?B?OU9lMzNleTRBTDdTbUFqZ0FUMXFFbi9Ic1JZRXJzemJpMjEreDhEK2h2aE1i?=
 =?utf-8?B?dnVkM2NKdGNFS3MvbmtqMGxRZlUxU2ZXTUp5R3MvckkvRmo0WWI3WFhlbGRx?=
 =?utf-8?B?Z1VrRi9yU2Y3NkFDNnA5OStXT1dnQk9QeTFTREE0V1paTkhIdGhRVElTTnRx?=
 =?utf-8?B?dWp3T1p1dFg5TXo2a0pNbFRXLzN1LzMwVWpRUWc1aTFQcFlmTFFzODY4dEdP?=
 =?utf-8?B?ZVFOT2g1bFlILzl4SDVzbFZaZGNhUHlvVERzb3NneGZ4R2RrTEZMb211OWZJ?=
 =?utf-8?B?NDRvS1lhOHphUUVON21NZHpINTNwM1A5UTdndGFpdHdCL2N2dWdYSFg5S0ZC?=
 =?utf-8?B?bUI3aFFIQ1lSQitEeTdRNWFabDliUFdPQ016SE13M0xyYkJhUlJTZThRRzl0?=
 =?utf-8?B?clBqaEV2THloYVU5ZFZOaXltTjJtRDN2QTFNRC8wYWd5K29KWFo5SmsvVlJI?=
 =?utf-8?B?RjZwUWluRGJPTUVHSlhmblpSSUFpUFBubGtiN1FucE1aZ2NTeUZYZ2M3V1Jl?=
 =?utf-8?B?bFl4blR4RlFsd2h0OWtpbnl4Wm9PRDlNQmVEZm5vd3ZTdnlWMjk2dFhUS3F4?=
 =?utf-8?B?dkEreHVxcEVENWpQNlJUQnMzSGxEaGhic3NQZVFzeWZNd0RGNUhjbVl1N2wr?=
 =?utf-8?B?bmNkNzNsaDFTZjNMeFgrWEUwSmpxVHFMV0h6V3dMYkEwNjhSblBPd3VETTdZ?=
 =?utf-8?B?QjFIV1Y4YVdmOGkvbkVlTDFTOE1ibmlyTjROSDloajhGQS9RTGY0aU1GSnpv?=
 =?utf-8?B?ZWNXREZKdWhPT0dheXE4dGxJUHB2c01Mc2ZhdWZBMUwycGVxUURlek4rQUNO?=
 =?utf-8?B?dlZqRGVGcDA2cGRlNCt3MHhZVTJQTVZ0QXBaODYrbCs5RmZzMHAwak9YNU81?=
 =?utf-8?B?Vk8wQVBuUE9zZ3N2TW93NmZwTTltRWJIaVE0YkY0YUM1cFRqZVJQS2tURlhu?=
 =?utf-8?B?L1BJdTlIRmJiMmhmVmliaEJYenZxVG9CWkNDbnpXNG9KWDFWMDdKVVRkVHR3?=
 =?utf-8?B?NzQvVzJtaG5vM3luY3pDeVRzNUVXR2hndEF0UEVNTE9mSGRSM3N5SnpmbHkr?=
 =?utf-8?Q?jQdPXw9LsRA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk90dEtjcmc1eUFNNUFQZzM4Qm10OVhNSThhMkpBSEtqeUFwQmR6bUkxZXpj?=
 =?utf-8?B?ZDE2MnJMcFViZzZuK0tKdSt6SXJsVW5rKzduZW5vdnc0VStOVWZPM1JJWHFX?=
 =?utf-8?B?czNsd3lYZ1BRd1NYdURxWWVsNFNnZmdTWWVSUHFZQm45VXAwS214M1NDTjNu?=
 =?utf-8?B?VkdhY0Z2T09TMGpzTEV1WHVMRkZIeXZFWTJtM2Y0cW5UTThaVXBIVm1hMk90?=
 =?utf-8?B?MFBpVWtjeUZHQnVlNnFvUzdSeFRuVmdsSDRkOTFQTXpxOFVDczByV21BTmZs?=
 =?utf-8?B?aVRyU0pXYlVCNTlhN1dJZ2NQeHFXak9Kb3FxTENWa1ZERERHRmIyTG05UkJx?=
 =?utf-8?B?cm81eUZNQk1wdi9sVXhBbVUzYmE4MmlrMFJnVHo3b0xOOUdvNGpraXJETk9D?=
 =?utf-8?B?L0FkUFI2N20xRVNEWmh6eXVEdDZWd3ByV21mRTJ1QlhEeW1OckFDVzJMSk5s?=
 =?utf-8?B?UlVjTDNCWkNXZ05IYWdEWnVwRFhXNkkzK1g3T1Rvd0tSd2lZUWgyVFhlOVpZ?=
 =?utf-8?B?REUyZHBLMzZlSDdrVGpOOFFOMkVweHN4ekpWWXJVanl6d0pkWHorOXM4dVI1?=
 =?utf-8?B?Z09NSUVTOXFJcGIvVUlQS3FzWnk5YWJLYlhWd284R3NheWxrOVpQYWMwaGZR?=
 =?utf-8?B?SndSMS9YdXJEc3dmUlFSSzhhNW1uVWJPRDczT0xSa011UzdtMC83ZnlGNi9r?=
 =?utf-8?B?cHB5RkdBNlg0cG9xVmV2UHFRSmlWOGpXd0dPejhRVFJqbDFHbDU4dlk4WThm?=
 =?utf-8?B?ZG5hdCtvcEFqVmQxQlI0b3F1RVpzNDFQTUd0M0JxaXdZaEM4dWJuZ2xSbFZx?=
 =?utf-8?B?K2ZuQlYzSGRlNnZ5TEdVV0M4VUlZUGxLZW1pTU45S3ZMUFpxNEZobTNVNGNj?=
 =?utf-8?B?bGpnUSs1cklOM0JOcmtmVkVyamhobytMR1hGQUJVWSs4ckxWaTRqTkppS2l0?=
 =?utf-8?B?YitJNWlGWXVzbHh4YzJMR245bGMxU1Y4b2FqaEdRb002SlhIVzJwdFFSdFRD?=
 =?utf-8?B?ZldNZVB5c29FamJ3RllGMVovL0cxRk42cnFlYk1CWXY2WnVLSnZHNVlFSnNs?=
 =?utf-8?B?VzI0QjB5V0UrZU1meW1OVFlsZ1kyTkNpc2VaYTJybG9sd3lHYnJZZE84QjBi?=
 =?utf-8?B?OWRFOGZORWwyUWhWSSs1M1ZnWGY2VVJ2cGdxem1kRDV1YmxRWW1SRm55M21T?=
 =?utf-8?B?S01GUTNtQU14Y1gyUzBmQnQ4N2VQYkpiUzlSUm1GelpmQmVUZGdCSXJmT2o0?=
 =?utf-8?B?bTJPYXE3WEhRSGNKWCtKUlFrY2tqOGpqQm5xQnRIT1V0SXpjQ0tvZXlUZUl1?=
 =?utf-8?B?RHZLZ2FrWUVyNUcwejRSODlXd2xUanI1eVB0MWNTSExZNGdjTExDRmdRODd1?=
 =?utf-8?B?Wkh3MWFubVdwclZMTzV6UGViWHh5QmRKUmZyUklDUW9XYjF3TXo4a0FkVVdJ?=
 =?utf-8?B?MjhGc2xxU1VVZ0ZnOW5weEFUcjBqYmJUK004enpvQzdxRWJlN05VYkoxSGdU?=
 =?utf-8?B?czRDMEkvOGJWNmVjM2pXRHpaSFNSeVprM1REM1ZsT0M4T2VkOWNGN0Ezazll?=
 =?utf-8?B?Ukx5ckpJd2ZxUHA2b1FVdStIZnNoTU9uMUk1WTE1UU5IQWVaUUgxNVoyUzR1?=
 =?utf-8?B?YnNmWjZMTHgrd0I5UGp1eldxNk9YcmR1VUpxNEs1c0hxR2NoVi9lKzhoOHFm?=
 =?utf-8?B?TGhodEIxeWFTNGlwcHFOejBzVWVJT05vUTR6OTlmSzF2NlNOTVFIVCsxVWhC?=
 =?utf-8?B?U3lCaERwK1JRTEM0dS9NaWhCc0xPWlVMMi9acGZuc1RxOVhnS2pVUjNSOFNl?=
 =?utf-8?B?Vm9yWVRTVXdia2V2Z0prZzRaYnhKTXoxWDNpUlFSSWVwWU41K3dhN3FaejZk?=
 =?utf-8?B?WmJwZU5qSkV5cmxaVzVkR0kzdkJ5OHdaaS9oK2FVNkxtUTJTSWNMRmt3eklI?=
 =?utf-8?B?RENhclN1ZG9IUSszaHRnZ0lJT1FubkhKR24vSkhiWnRyd3hmU0RyT1FOaW9i?=
 =?utf-8?B?UG9FZlAwV00zMVFzNmVJaWJKZW5CZWNJVm10R0NtQ2x1VkRYUlBzOFNwSUF3?=
 =?utf-8?B?Q3lVY2w3MUtueE1udnN4bktrMmppQk9zK2dPMUwxR1ZIQXo4aFZrR0NSdWQ5?=
 =?utf-8?B?K2FPZ3U2WVhVVy9td1hvbFZUMXA3ZjZRMk10c3Q0aHViK1NEK1VSUG1idjV1?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ed56c5-ee8f-4f95-1f8a-08dda7e59659
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 06:11:07.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmD/zPCnFBXZBmzJ40geBk0isUAd095shwFOYOE+b7z13rjevyvZUSt2e5mntANGBGaNW7ghuxlW4B2JRjNuVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
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


On 6/4/2025 21:00, Michal Wajdeczko wrote:
> While we print VF's configuration KLVs only under DEBUG_SRIOV
> config, we should be doing it at debug level, not info level.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 3556c41c041b..3128d9adc10e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -104,13 +104,13 @@ static int pf_push_vf_buf_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs
>   	}
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> -		struct drm_printer p = xe_gt_info_printer(gt);
> +		struct drm_printer p = xe_gt_dbg_printer(gt);
>   		void *klvs = xe_guc_buf_cpu_ptr(buf);
>   		char name[8];
>   
> -		xe_gt_sriov_info(gt, "pushed %s config with %u KLV%s:\n",
> -				 xe_sriov_function_name(vfid, name, sizeof(name)),
> -				 num_klvs, str_plural(num_klvs));
> +		xe_gt_sriov_dbg(gt, "pushed %s config with %u KLV%s:\n",
> +				xe_sriov_function_name(vfid, name, sizeof(name)),
> +				num_klvs, str_plural(num_klvs));
>   		xe_guc_klv_print(klvs, num_dwords, &p);
>   	}
>   
Shouldn't xe_gt_sriov_pf_config_restore() be updated in the same way on 
the occasion?
