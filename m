Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F67ECA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 20:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C0110E218;
	Tue, 19 Aug 2025 20:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVGAJlOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB9710E20D;
 Tue, 19 Aug 2025 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755634806; x=1787170806;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JH+6asZbCcgc5fCYYK9fgjpcSDCCOxMjcus5tn97xjY=;
 b=HVGAJlOlQhQOje2O6j5pQ7z2XHpFW8G4StZCDTQ0GZhDSuUsyUomzG4n
 bDp5hBRV/CdDgM1XPY5H4Qz6EJPUke+bvvaus44OYlfpTKyE2Hi8L70jf
 41sdv8QA/WYjyJfrMUn3Gzege2so1ocK2oMwivPVPWLq9OaOEZj1x1LGA
 ex7z6iBauBWA5UqCw6fTHarH6xXfCCMI/o32i2fEqKHGmK8hXoNtrnaSB
 o77r/fdINtYUrbQeJ0D5MXkc7t74q3ypGBfG2+9EuVgD4weCxSJicNDBW
 zwqMT2HYKLHcadw86PAKKT8BEPRrJv5ItzKwbN9dFC4/7DQDP1xXu6pQB g==;
X-CSE-ConnectionGUID: EaVC9O7OQHS68m/OL2uxQg==
X-CSE-MsgGUID: i0NhcTLsRKmxu/S26JCaKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57845603"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57845603"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:20:05 -0700
X-CSE-ConnectionGUID: qKV4VJC7SaSq35YLrfq8cw==
X-CSE-MsgGUID: lY/OJYArQZmKw2Po+Y6obA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167167134"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:20:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 13:20:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 13:20:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 13:19:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpAhMHXhYqyyg2mdK/OLJZ6tqOmKk3XUH82x0Um40AvWJO9iV6ppT8q+OKobXek8JVZpjw3r3aPiqWomAegTm5IkJ3CQ/F0h6frMFm4GOGZ4DRTa+8Yy2sykIu8KRUO5qf2ukY5RQcOSSF7fNYBTV352KsTUhl5DpQ3y2lWg3xUR/Uagd6iT1rMvKV7e8rSJkHwga/6WZQs1GpMGX2W0DBaBY+Hkg9YDirD7VDwpduKLM4WjDyCKbpoWQ30zqO5ugpB66XZv7U1ysPj4V7X0zr31B2HtiDOp5ZI8vFg8JcT4TnQG9Mh3cmwBAH+Yhf9SJlXzZikBs1egqgB3fuNzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL2av/VrP9r2NnYYOOEAtXf0jV6K19sl0CAgTl1K7D0=;
 b=SyojbymnxY5xkGxAwSB2Rwi9EbTTB7fBYngsWShJNzL6L/voAZAxSlYi9pWT6u9AC2/dLEm2pycIwEDct8fVi6w+OwHd8KO1xO/q/DTfic12XzYl0VvIMvwl0ML5sfopWSxQdJjecwqW/TYjNee30rmCbXxg8bDUTVLXL+aqT+olGzmyXfYdNZmgYG/SYNd5w2hU7KjzKBQ+cun2tID9kWrlktcgECuqYWnrWqhq0vN9hB0gJ6Oc5aw+RZrVKzzOo1FW/rK0zfXBVxlnDv8a+MIaQYCx4BtWR1arNqZBNwUFQV4U/Xlo3ROO1q8PoCzBqnuo7wSl2mADl76BBYTESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 20:19:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 20:19:55 +0000
Message-ID: <8f2a87bd-6d00-4696-9455-7861a56043c7@intel.com>
Date: Tue, 19 Aug 2025 22:19:53 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/kuni?=
 =?UTF-8?Q?t=3A_Extend_platform_generator_with_PTL?=
To: <intel-xe@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20250818192032.633-1-michal.wajdeczko@intel.com>
 <175562394747.248501.1574627682997890883@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175562394747.248501.1574627682997890883@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 426c45a3-254f-47e0-4721-08dddf5dc344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODMvNVRHL3dFbXQ1RndDN1dPRGZFMVBpdFphYmtvL2NhSVhIRFVKd3VUY291?=
 =?utf-8?B?bHR0VDdlTC9HSFVhZkhGNHpPc3RhcjJ0K0tmdFRsVW9DQWVrTGgzd1NHVGhM?=
 =?utf-8?B?eGlVc2lLbnBJZU1xL3lUM0FtTkxSaE1TUTlDdnBWOExBbVpVeFhqRnA3bGp6?=
 =?utf-8?B?aGVBUExSeU9vQjBrUzZKc2ptYytMUVN1WmVXTUhsQTlZUWdYQWw2WVNmM1B3?=
 =?utf-8?B?eG10VW9vVGlDV1hDUkZSMkxhSkFMQkw3SENlWHZyK0NFTFRnYVlQZDh3Kzls?=
 =?utf-8?B?aEhkV0ZQYVBhM1BrWDhEZ0F6SU9hbVBXWTVhZS9GTVVIWmkrTWtsdTJYejlE?=
 =?utf-8?B?WFRKZUZpQU10L0pQQ0w2Zkl2YUJTREF3R2UwL2FPbE5QeEpMaDh4MFlyR1lt?=
 =?utf-8?B?a1pSeWkvTVVGK0N5OGRVZktETjUwUU01S0NUemJQNDdRcS9KbGVvTGRhY0pz?=
 =?utf-8?B?djF4NUtDYlYyaFdYMDJMZzAwTHhPZjZhajEvMjg3dmVCMXFWeWNzdTEybnpG?=
 =?utf-8?B?TXZWM1FUbVU0VXRpcjh1Z2p5OXZqblB1VTE5WjFFaUJqY0oxcldQUStqZFJx?=
 =?utf-8?B?U2FvTTVLRTl5ZUk0MUpMa2lKdmRPMW1NWGIwRUxqTkF2ZWR3WXlId3VxR29W?=
 =?utf-8?B?WGtMeVgrdG96MDEwd2I4dmpmZEFuMHd2ekpFQTZwVlFHcTA2S1F6cVg2Sm5K?=
 =?utf-8?B?eTZiVjh1WVV3VnhIRlFyMnBNUUtDMmd3QnZOWTJwTHdpeUpNajlDeGJIMENU?=
 =?utf-8?B?b2I3YVBlKzFKWkdJSEJsNTVGRUNVNzVzeFkxNGRZUDI5NWxOTEZGLzI4bHRT?=
 =?utf-8?B?NDRxcndXNW1uVEx5N04wQThtcmJncjg4eFR5bzFZTWE2MnBJQzZZalkvOHJt?=
 =?utf-8?B?NkdmN1Y1RGhCQitqTVVaZ0o0NWh0TG1KZkZkQjhMZExOUzcxTWRSWDlCNlJZ?=
 =?utf-8?B?ZzE1Wm4rWXdXZzFvcG9vU2JtSzR0YmNhNTg2aVFmNkk2dlpHVlptN0xSQVBq?=
 =?utf-8?B?aHdUbTM2dGdCOVFYZnRPM2NpOFkzcEc4RmxXbWVqWlM4MFBIZjR0a3Y0Tk82?=
 =?utf-8?B?RGtIU25RZ0ErbXhzK25SVEwxNGVrMFBJV0txbkxzL2tlK1JhcTJqVnNET0Z4?=
 =?utf-8?B?b3AzQy9RVHZZRU1XT0E2MENGU2xUbUYzeFRzTkFOZmFWZ1BidW5YV01tVS9p?=
 =?utf-8?B?cklwVlh4WVZoL1dZTFNZSkpiNEYzZjIyUVBNb1M3K2t0QUo3dExMc1RMT09s?=
 =?utf-8?B?S3lkdVh4cFoxTXljcFFLSUNvaElZdWFlRU0xczM0WEVhSWs0NUdLZGRPRWVI?=
 =?utf-8?B?dnN2L3dqemxkWm5McTFrYkY4QitwZ1pRbm5WMFkwNkE4SW1ZQzAvcWVJL21B?=
 =?utf-8?B?cERON2NSUkFWTTdzc3lrM0Y0M0hNaXUxVTVWL25mZmFxdWU1Zk00dVJlWTRv?=
 =?utf-8?B?U0VXcnMyaCtCZnVtOHJjcW16UHZSaXQrR1RrMDliN2FQSURYcjhJUTN6WE9h?=
 =?utf-8?B?ZGxzS1p6M0lZUnFHNWdDZURJVlR6Mzc2Wjc3K1J2WmRuZi80elpXc1ZUTzJ1?=
 =?utf-8?B?OExHZ05XMXkzSlU3eUZ0bjBieklIaFlpSEYxamo1VnluRllpbmtqRW1kbVVk?=
 =?utf-8?B?YzFsMWVEWU1CY2ppNjgyTGZsMVVzdUJvcEs2SjI4bTFNcFdjNG96Q3JSQjUy?=
 =?utf-8?B?TitQc28zSjA1UmszYjlad2xTa0N0NVkyY0NISlJVRUFMdTRseS9DZUVLVnAw?=
 =?utf-8?B?VTFxVEY4MUxHSjQ4K2x5RlRJaEk5ejhWMExQejRvWFNWVWRqZ0I3S2h0ekh2?=
 =?utf-8?B?RmVZUklsaHVBK00wM3BueHFlLzVQV0tpN1ZQc2d4bkoyZlZ1SDZtTG9PM2xB?=
 =?utf-8?Q?M6CIvCFXb72dk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGNFUVVyMnFUZFB0bVdUYXRVcXdOZ0lTcTZPY0ZRY3pSazA2VGkxRGZlN1E0?=
 =?utf-8?B?ckdIWWw2NUprVkM2V0ZuWUs4NTBFOEVjK2s4RkNLV0lZbVlTUnh5OUp6WjhI?=
 =?utf-8?B?ckE3MGhSY1F3SlFpck9JMUpVUGlwTy9sMEFlbnpiZGtyaGR0QVdNY3h3VFJm?=
 =?utf-8?B?dWVqSHhlbERNVVFEMVhiZ2syVXkwdE5nbkIzSTkwR3diMnBKQTYzekZEVjVV?=
 =?utf-8?B?V3VIK3FjNDdCaDhreFZYV2krYjE1ekFyS0Q4VWh3V1N2VWxZWDduMWYzVU5h?=
 =?utf-8?B?QWt4bmhoQzFQVWFJYldXM2o3WEZYRFZuQzhMM0ZRVkpXZFpVWnljYWt3V2xs?=
 =?utf-8?B?K2tSd3ROUGJpZlROZ2pWZmcwZUxXeUkzRFZ1aVBwb2ZlMTRxSk81bTJhLzgx?=
 =?utf-8?B?NnVhcm9jRHF0UTdGNm00U0pmNFk4TXlLNmNRZkVLcHF4azVsbTBJSS8zWTNm?=
 =?utf-8?B?S2dEaHA3bE5QSm44L0RTNHZzLzdBemo3L2dUUTNXR1ZJYmV3R3hGbjR1Rlph?=
 =?utf-8?B?TFp1YVUzZzJHRFJmdUtneUV0UlBLR2hKWFBzUzFzYzE3aDVweFMxS3d5cCtm?=
 =?utf-8?B?RmI5d1pUcC9JV3NUSzJFb1dhazM4eSt0SkJsd2FUR3Y0T1NCZG1FQXpHcHRr?=
 =?utf-8?B?L1JOencvZFRFRlNBTVk0N1JFYURTaFJWd3ZodnVoOUhQYitFQmFDQld1dTBO?=
 =?utf-8?B?clFVRTNwOFQ4S2cza0pDamZiMXNZdGd4UFVpcGd4Mzc5M0FoQ0U0UFB3WWVy?=
 =?utf-8?B?ZWJvT0VaVjV4K3JqVkQ3VkttWjFBYzE2VDFIQm92MWVWL0lnVm1yOFc3czVK?=
 =?utf-8?B?WER2WHhTVDdVU2lEd201OUNZVHVzR09XQVVlVTJVdWpFci9PcG1KYzN6ZlY0?=
 =?utf-8?B?TVMvUWE0NUpwczJlRzVQTU0wM0hjbVpTMWhhY1lOeGVHdWxVWVBCeU1jZEp4?=
 =?utf-8?B?VGprRG55cStra0RiUVprTW8rc3B5ZUhUZ0ttclBJSE5jU3plbW5VNTZqSWMv?=
 =?utf-8?B?dDFGRnJaMjVjbFFQeFJZdEM3KzhTNndtT2VSOG9JK3dwMVRVRkpBVjNNZ0Vw?=
 =?utf-8?B?ZTl3N1dhMlhEOWQ2amhaaVFmODJwMjFaNnRXZW1RUXFORXB4YUJ3MnIwR3B6?=
 =?utf-8?B?SjR4aVJxSWlaS2F1RXFoVlR0UCsvOXJiTmxqUldzQlQ5RGtVWnJzQ0tRVDBx?=
 =?utf-8?B?TTBBMEZDU2lXU2kxM1lhTkZ0WWJxTUdOMW5rRmRmSWZPUHRKYmNvSHlzZmFC?=
 =?utf-8?B?NkFReHpJVHFTV0xCU2pLOGJLSTA3NXk3bUdkZ0hkWVM4MFJSRkpIdGN5V1l1?=
 =?utf-8?B?Ri9vZVpVU1RUU05EbERUYm4vYjRoc3JmZU1ndFgzNVEyc0wxZHI4L21uZ1RC?=
 =?utf-8?B?ZWdMMGd5Yi9CWmIrWG5qbHd0Yk00czJocDdiaGVNdmJaa2l1QkpybThSZ2x0?=
 =?utf-8?B?bFlmNXhVZXczVWRpdklQMEpOd0xUUklkbkJkVTNMdEthbyswUlZNSmVoMmQ5?=
 =?utf-8?B?YWl6RUtsZUNaQlVKYm5yb2h1U2lDQzNQb2M0WnNmTTYvckZ0Wi83Wi9DUnFy?=
 =?utf-8?B?K2pUaWtVS2gyUWpqOEZ3UmhIRHVhYllzUTgzNjROU05WOHM1Ui9jMjBrejdq?=
 =?utf-8?B?T2pFR3VkdlRna3oyVUlLRHNZblBKUWVYVEduOTZNWGlFUnlaL1ZvSTFwZXJS?=
 =?utf-8?B?Q3RJR0YySkhTUGxCYXdKejQ2alYxdXhRL2xOR3liWEF2cDh2TlZNN2xnNDQy?=
 =?utf-8?B?cFFXZXhVTUJLVDcyL04wcVp2TlpKaEZWTktvN2hCbUxjTktwb1ZQZXd6d0cz?=
 =?utf-8?B?alV6NDkzY1laVUQ1VnJoSGV4Z2h6VlZBZEcrWWgvbWRUdXNEMjNOZkdIdDJm?=
 =?utf-8?B?TGJlZ3VWclNJK0JWMFJZMDI2TGpOMlljWDhDUGM0eG50bXN0a1JWOUQwTjFs?=
 =?utf-8?B?LzY1K0lFSmdFTW5nZEp2Mkd0QnFhV0xQdjMxZm1hbkpvS2s4NWtrNHdJOUNB?=
 =?utf-8?B?MThLZnJoaUd2dlduT3Jjb3pKaW5icTRBZjFiZkNqeHF1QjlvOE84UG4wQUM1?=
 =?utf-8?B?cWtXeUlWU0pFZVh1VFo2dnhpUXk0RmFMY1VIOFdONHJXYWxZeWdodm1IL2Ru?=
 =?utf-8?B?TXVKaTJHZ2R3dUpBVmNlcE51ckFrQ1FkMEFpUFMvMkxOZ3UzUzBJK0doMGZQ?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 426c45a3-254f-47e0-4721-08dddf5dc344
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 20:19:55.9566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5fu0rn7rZ7ENgC9mL58kqToUPUn07cm84ZFbJbn/ICz+BIIY8g57LWDwnzdU6DG3fVCDCyHhjMWmJp0gcnuJf5F4c+HMnp3wyv0xNPxFD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
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



On 8/19/2025 7:19 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/kunit: Extend platform generator with PTL
> *URL:*	https://patchwork.freedesktop.org/series/153088/ <https://patchwork.freedesktop.org/series/153088/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153088v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153088v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3572-c3cf4289245819615518b536cd16ebe6612694f9_FULL -> xe-pw-153088v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-153088v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-153088v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-153088v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

all unrelated

change is in pure kunit test code, not used during normal driver execution

> 
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3572-c3cf4289245819615518b536cd16ebe6612694f9/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153088v1/shard-lnl-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html>
>   *
> 
>     igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3572-c3cf4289245819615518b536cd16ebe6612694f9/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153088v1/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html>
> 
> 
