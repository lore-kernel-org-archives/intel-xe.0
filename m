Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5074D43341
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 18:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A162110E88B;
	Thu, 11 Dec 2025 18:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyT8Cvzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A8210E88A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 18:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765479168; x=1797015168;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EZ2+H6WYes7U2OU9aExTvfVTrpMq+3nPm095ks+00t4=;
 b=jyT8CvznWq9HbFprVZsw383BjK/O1Qygz23Hnmr8/Swm6Tgn1L29TID0
 4OqjzAP0ZBNHjYmgFCe/iIcFUGqqxGMFdq4um/oB0wWoE/ejM3jPV7AHc
 Yl2dgA2+otWXJ9UBwjoYGE95FKTnJdzuMbf7bdpVxEb9ZJiWuhkP3Ulii
 ZkqpU8XH63/5UZl8RY6+eGvWiA1Mx9zFRZwFO58eS7Rk1zq+oibHNz9rx
 tGhX+IDjkoSRbxVWH0DuYrrmV1o97DbAODj0dxEu7SYAf2Ph2jF6vmSso
 6o7leQwARAmh0ubBrobbqAUm+QvbePFVtvuA0M3gDBoSbWGt5NkrdcrhO Q==;
X-CSE-ConnectionGUID: b1i5sZrFQsy/2jHqHCVBsQ==
X-CSE-MsgGUID: HuT+VUu1T/S7DxlKqmNSyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67356759"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67356759"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:52:47 -0800
X-CSE-ConnectionGUID: O/PbUEU8T6qNtcUESfbEXQ==
X-CSE-MsgGUID: 6euPmUXQR/mV2kLCWkjcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="220252585"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:52:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 10:52:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 10:52:47 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 10:52:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EU4W+W2X77RRCmxOfMi9con13/RpaywR2illbyCnLii4d/GfiGZZ6rMkeAds3uWH9FKNJFHuozq8DzX7NPwQ9RpVgJ4HfIul91QCbg2jl0/1yIQ2o+Y7lSqNWcN+lDswDMacfEzjmND5Gbmbh1KcF5qtnau5+L67+m+a1Ny7W9aI4v9KrMBqEzE7M4xaR8y95fQdXQ90sKjmgh7rUSIOOwBIOVhbw+ieJl+VEX0yLZ3GHOJF0YSQ9epayvA1O1NcpqZPAMjloFiX4i7CpCUTCuhEo4QzXlRKL3mmMxq4f7t21B6XAonuE4bgQtR81L6l0AECyBhNbeGUuL5dV5LbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSqT18yPg5NYccE/rC3ViE2zBrqrdK68k3I+ktnlzao=;
 b=Q3ITEFkLkRHnP52xtaar0aD1NH0EK4QKE5eO4uZI/iPjFYvUkh+xcdWExBem1IeT5epgL87SAbD5BX7qjiHy6utZNpnWU+T4YN2dZLA3Db8ZvtrnCzti1xr5Fn9cDg8jfdC8OkUhYuDvET8f2ZV/5a2LXnyQ1PWrfy2Yk1VN+3vlrhQL9OOft7RH5lHi1pegQ0eskclrPO0N/2HuFm9/d5m5KSooTn+geDsbrKloWAnT/gw6XGjOutLTppfjyrWs95i8s3StKRIBKxFXZvkN1s0/qboYH30j/CFL//TTIbQZAsVzcvbxPUs2Uonkz6WxEbzeJvvLK+tkDbyQonzu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 18:52:40 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 18:52:40 +0000
Message-ID: <143fc553-229e-4bf8-8494-abb06cf7ade2@intel.com>
Date: Thu, 11 Dec 2025 19:52:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] drm/xe/sriov: Initialize scheduler groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-17-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-17-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:803:104::40) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: ce82dd71-1ebb-4064-9fa0-08de38e6758f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHRmRS9rZndoWlFIR2lBQ0kra0NFMWVvQXh1dlgxMWMvaHIzbmM4ODFkaXdS?=
 =?utf-8?B?aDRPTmU2TnE0VVBWWXVwcXRWTWdwNEpmQnhTRFFGY1pEcHRIZkNyck1nbmFB?=
 =?utf-8?B?UWhtb2xrUlB5M0ZnNXdQeFVGZml6N2JJUjR3MlZpNThCNWNvODVlQ3dmNnE2?=
 =?utf-8?B?MlVhTnU0ZENaS3Q2ekM4d2wrQ2dTTEtDZmtwUVkwNzJkdVlVM01CQVN0b3pW?=
 =?utf-8?B?dSs1eU9EWmlXSXJyaXFXckdla0pHYm94ZlA0UEpwYWZIUUkwRlFmSElVTGhy?=
 =?utf-8?B?bEJBVEdveWRsUTBJVk5jU3M5bzJzMnZrSVBpWXNKMitZOFJUK014WFlpd2ZI?=
 =?utf-8?B?d3ZuN2xQeG0weE16dTU3OXo3M0RxV2JIR0pSMGp2MFhBMy9TNnlPdmhzd2VE?=
 =?utf-8?B?NnlxaTNMRURJZWdkL2hqRHZrd3ZUbHo2YlB5TlNQYWMvbFlSRjBsTVRDOGV1?=
 =?utf-8?B?bDFVTldoL0xWWXpITVFaeVo1cTVuQWUrVmZQMkM1ZGp3MEdJanNSQVRLYndX?=
 =?utf-8?B?OE1tSTZYTDE4eVFPcjFkOG1MbnFMVi9NK1dURDRRYllIQ21Ma0JuZUZnMXM3?=
 =?utf-8?B?eVl2dHJROE94RDhsQ3JKZ1ZLNmVXNTJraTlsK3hjMVJIc1JDV1hMTnpVYi8y?=
 =?utf-8?B?K2Ntem8vYXNSTHNDSzc4QlMrWWFjN1p4QXVFN0V0QU9hcnoyZ1hDbExKSU1O?=
 =?utf-8?B?cEpiOTI0OVl0Y1F6cDVDSWJsbUV3SURybnZ6RnVVdDlYWjl2bjVBbnFFMG52?=
 =?utf-8?B?M09uNWhHNjNudFZPdFUrenRsZytsWlljcXZxQWNPU1VuV2xBRGVpdVFhNHU2?=
 =?utf-8?B?dktRbklWdDROZWxRZUp0ME9FVmVBZGZTOHZ1TGwwZjFrYjFRd0dqRjhHZDhX?=
 =?utf-8?B?RDFNV1pUblNsY1M1NWgvaWJUcDI2UVkzalNZNlgyVXlmMzRIVHBSVzU3WWhi?=
 =?utf-8?B?ZkZTWk1DRlIwNWtycXFRMkFVMXhOb2RwL2tCTS9vQS80MW43djVUSFM5WHJ6?=
 =?utf-8?B?VXhKRk9nWWhlNnMzU25jdDdJUm92N1lwdkVZQ0luQjJyR3RlY3ZWOGVtLzRk?=
 =?utf-8?B?V3QrK0F2ZDc4c2hGN0dLaEtzc2x2S1B1UGVZSENudnJuNWVBdXFicnY1NTJq?=
 =?utf-8?B?b3NkM2l3aHJPcDNmUFdQcXNWaFNCU1QzSHYzNHE0R0NEVGhidUVqNFNPKzV0?=
 =?utf-8?B?cmNpcnFvQjFzSHNNQTUxSVpHZUozTHhMWk1zNkEyVXZxRHBQR3kxRHpXaGdz?=
 =?utf-8?B?SmVPMHBkRjB1ZG96cmV5R1hoTmNCcmtTcE56cGJuSGF3aENPYXdhQVd6V2JJ?=
 =?utf-8?B?YTB3Q0FJVS80dzFXK3QzSi94RFlIMXpwVTI2OEVSYTZFamdyNmJIZHNpRGE3?=
 =?utf-8?B?WkxLNGVEV2hNWTN4TTBvTFNiS2JVZ0tuejk2YmFDQnpjVnh2TDYrV3NVSk9S?=
 =?utf-8?B?aUU3TmdvNnRuZHhtNDNQdDZLWG95Q1ZlQ2MwOWZGdlZacUk2V1hoK1BTazJm?=
 =?utf-8?B?SWc0UEx1VVlveTMxT0J1VTAreDJPaGlNSUMyOTBSZEdYYmU5ZFFIWldlbW02?=
 =?utf-8?B?SEpDQ2hUc3JZbk9ad3BMMVFtakx3VzY0OEF2cjFlcDhRbUs1N2M5TzBhVG1C?=
 =?utf-8?B?UzBsaUtKbW9HZjlURFFmbjUzbGZIYTZEcjAzWFBxMUorNjdBUjhWNUI4N3B0?=
 =?utf-8?B?OWtja0xDOWNuMmNXREJqQVJGY1RMYzFnd3VzZnBSN1h0NFJsS29XZ2l2eEZU?=
 =?utf-8?B?eUdKZjNKUmljN2wxSGNtSjdob1RrYXlwQXBsQ085RnhhTFlWYWo1aG5xS3lv?=
 =?utf-8?B?WU9nRGlqeENsdis0NTBYMEJyUDAzYStKNkxCNlVvcDltc0M4b1Z6enR3UVNZ?=
 =?utf-8?B?S1N4YmJQRmI0UnJyL3M0eFBZakdxM1loUmZ0RWtOTWFkUkR6VSszdlZzNmZa?=
 =?utf-8?Q?MaIoUXtOZ1CbKKqSdt73Z/UDdhfyEV0V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2VTV0x4bmdYNGw2aFhVWVdHVjcvYmMzUnBrcjZsTDZIYUNPL09vME56U0Mx?=
 =?utf-8?B?bC9mTmdENFozYzZuUWZSZXNXdDZMZ3FCT0Y4NloyN0F2bFFRaTl1NGdYUEsy?=
 =?utf-8?B?SXhNU3VuYy94M1JjVUdxRnozRCtVRjIzY3hhYnRCbk9WdUg4OWZjU0Q4akJS?=
 =?utf-8?B?Z1QzN0s2V3k4cEZRTFA0dmZoQkVwS1JSWkxIbUhzZVpES1ZzekJpMnV5ZEZH?=
 =?utf-8?B?c0lzbGVweW9PNTZrTXJqVWJVdVNPbDRxK09mQUV4dThNbG1MTmVtV3JaUVls?=
 =?utf-8?B?S3FCNnFCbjJDOEZoQXNNdTRKOFdNbCsweGJET3JMaWJRSFRGeE5BOFhyaEVB?=
 =?utf-8?B?dEJ4SHY3Vmh2TDl5OEtWa2tleDdiN0pYWm9rSXZCKzBXdnUyN2RSZDIzMEpY?=
 =?utf-8?B?bTdUV3JiM1lRTkJsTnBGb1k1UFU1N1Q3cTVaUUtCbUd4c2tjbDhyRlBIaG9m?=
 =?utf-8?B?enB0blNMcHRXeThUWmlERFEzcW9nMWh0VFBadFFMWXo4NEJvY3JqNi9VSHE4?=
 =?utf-8?B?RmYyUjJsQ3hVcmx1UDVDWTFKR1NIbktPT0JOMkxnUmM3TFRQV1dnbE1rNjNO?=
 =?utf-8?B?Z212NTRjR3VJdVRNOEN2dVVTRmZqUnlYSmovN280VEhPZHQvUFRzVE5vRDRN?=
 =?utf-8?B?Y0NnYnB4cXlxT0FINllZQmZ1TkJmQ296MjB3Q004RWxGUHJwSTA0WC9jMlVw?=
 =?utf-8?B?R0g5SUwyVmgrNTlwbktHNE9HUGRIalNRUWxQOS9JK2h4VmhselpyMGNlaWJw?=
 =?utf-8?B?cHZLRjh6a09HSDFEdFRBMnBNRHo3MW1zZFpnQWg4cFJxVmpmdkhENWZkbUhI?=
 =?utf-8?B?RHhYQmJjTFR2VTB6L0ltcWQrdmlELzJNN3dTVjdCZXNUUERWMXdvL1k5Qm9w?=
 =?utf-8?B?bDd4YmV1aTgva2IyTFB2b0czWS9aM2JwWWkxVkRQWjh5Y1puRk1jcTQwa29O?=
 =?utf-8?B?WDlVbmNud1hXOWdEaDVybkwwTmJBb3VETkZyZWo5MFNSWXhJRjdvS1p2RnhY?=
 =?utf-8?B?OVR3NFE4R3pldGpOZ21pU2IrdVptYTJ1YWhzSG43OWVrbGtpWUp0T240Q296?=
 =?utf-8?B?YlM5dDRNTm5Zc00wYmtJZm53NkFpaTNWNFlIcGVBODVscUdXT1J1UlBsOFEr?=
 =?utf-8?B?LzVEbEFUZFYzNEk0NUVXV0lyOUpRMDd0WGM5R1lJT0N3T2E1STBFSkN1MGRs?=
 =?utf-8?B?eXpFaHl5YVdkNTlqQ2xCK1ovUVk1NVY0STQzK0ZuMW5tbFZuMHkxSVBQa0dL?=
 =?utf-8?B?c1pHWmVEQTlhMEcvM2I5N3JCZDVOYlFzTFh4YUtlampwWVBIWEdWdTZ3L2JK?=
 =?utf-8?B?V2poZ2dFRzdmMGRQdTBwZWVLa3QwVS9nZWdldmc1NE0wM1Z4SlNobjA2YVNw?=
 =?utf-8?B?RHlrNk4zUDhHSi9aNGdSWXpoVUwvVXZYTkgrVmJLQVRJR1l6TCtVblhHUkZi?=
 =?utf-8?B?Yndzdk12V1BVelpLNXBCY3BSMC9JbmM3NjNweWhGeWNnZXVHdlQzRHFLY1FN?=
 =?utf-8?B?aUlXU292YmpHZ29sOHptK1NEKzRxSVNnYnpOMS9NSjNoS2RRZ2RlNzg2WFBY?=
 =?utf-8?B?ci94OFZ6d3ozcjhtZFRLd3lpaUs0Q0U4NEtiRFBqOVlKdXEzSjNFMWwzTmFR?=
 =?utf-8?B?cmxsRXhlRWI2VTM1V0VZTFN1azFGakxGbWliY0pvSG1CbjdzaDIvbnFEVVJG?=
 =?utf-8?B?K0k3TUxQWXFNMStVb3h4aXBPWDhQS1puT1J6ai8zbHFFd2xHYXRxV3lBU0hu?=
 =?utf-8?B?TEhieVppQzd3cjRyek5VTHdLWE5GcS9GSTkydS9CMDE2ZUQ3dUp5NHlFNHVW?=
 =?utf-8?B?aVAvL3hZSjQxWU5rbjBCQTdCTmxRSXF3RGJMdWcxRjVHVnhaT2UrbVM1aGtx?=
 =?utf-8?B?WDFuK3FPYWFSR2xhcWphTHd2MTVOWWZDVkNTVWxsOUtHaXRMcndZWEE2QWRT?=
 =?utf-8?B?UjVoVnJhTkZVdzBzZDRIY3I3bjVJcUZXNUpnVGZaZ0pLcjlDdmEvUTdDN0RI?=
 =?utf-8?B?U1dlUnA5WGNPRWNUQVlOSWdZTmR0NFNOazZ6M2preXN2U1dNR2I0Rm1hRnJy?=
 =?utf-8?B?OGpMYWlia1N5bWZieksxUjZnZnRDOXBVU29pQVZBak9VRHdia3JCcXBlNGQ0?=
 =?utf-8?B?RTl6RGZiNllmVFNnSEkwVTZDUHI5SVRneEZZK0trZ3B0eGY2OU02anZoUndN?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce82dd71-1ebb-4064-9fa0-08de38e6758f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 18:52:40.1732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OvIPqKCoZkLYjTFoEfqUxP9MyuJotT8fu7SEJ/5/HiaZ+PNRRL8RbTQhtUg4DAuftUnVmXpb+qqSvg9DE77cKPXPAMWrS0JF+Yj2TSTXZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
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



On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
> feature that allows the driver to define groups of engines that are
> independently scheduled across VFs, which allows different VFs to be
> active on the HW at the same time on different groups. The feature is
> available for BMG and newer HW starting on GuC 70.53.0, but some
> required fixes have been added to GuC 70.55.1.
> 
> This is intended for specific scenarios where the admin knows that the
> VFs are not going to fully utilize the HW and therefore assigning all of
> it to a single VF would lead to part of it being permanently idle.
> We do not allow the admin to decide how to divide the engines across
> groups, but we instead support specific configurations that are designed
> for specific use-cases. During PF initialization we detect which
> configurations are possible on a given GT and create the relevant
> groups. Since the GuC expect a mask for each class for each group, that
> is what we save when we init the configs.
> 
> Right now we only have one use-case on the media GT. If the VFs are
> running a frame render + encoding at a not-too-high resolution (e.g.
> 1080@30fps) the render can produce frames faster than the video engine
> can encode them, which means that the maximum number of parallel VFs is
> limited by the VCS bandwidth. Since our products can have multiple VCS
> engines, allowing multiple VFs to be active on the different VCS engines
> at the same time allows us to run more parallel VFs on the same HW.
> Given that engines in the same media slice share some resources (e.g.
> SFC), we assign each media slice to a different scheduling group. We
> refer to this configuration as "media_slices", given that each slice
> gets its own group. Since upcoming products have a different number of
> video engines per-slice, for now we limit the media_slices mode to BMG,
> but we expect to add support for newer HW soon.
> 
> Note that while the GuC interface supports a maximum of 8 groups, the
> actual number of groups that can be enabled can be lower than that and
> can be different on different devices. For now, all devices support up
> to 2 groups.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: Use asserts for coding errors, code cleanups, better docs (Michal),
>     limit groups to 2, limit to BMG and newer, bump required GuC to
>     70.55.1.
> v3: Use a struct sched_groups array instead of an array of u32 masks,
>     move the max_group check to the next patch, rename NONE to
>     DISABLED (Michal), limit the media_slices mode to BMG.
> ---
>  drivers/gpu/drm/xe/abi/guc_scheduler_abi.h    |   9 ++
>  drivers/gpu/drm/xe/xe_gt.h                    |   3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 142 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   2 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  33 ++++
>  6 files changed, 192 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> index db9c171f8b64..513b22a87428 100644
> --- a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> @@ -6,6 +6,8 @@
>  #ifndef _ABI_GUC_SCHEDULER_ABI_H
>  #define _ABI_GUC_SCHEDULER_ABI_H
>  
> +#include <linux/types.h>
> +
>  /**
>   * Generic defines required for registration with and submissions to the GuC
>   * scheduler. Includes engine class/instance defines and context attributes
> @@ -45,4 +47,11 @@
>  #define GUC_CONTEXT_DISABLE		0
>  #define GUC_CONTEXT_ENABLE		1
>  
> +/* scheduler groups */
> +#define GUC_MAX_SCHED_GROUPS		8
> +
> +struct guc_sched_group {
> +	u32 engines[GUC_MAX_ENGINE_CLASSES];
> +} __packed;
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index a2ba80c954a6..de7e47763411 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -29,6 +29,9 @@
>  #define CCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, CCS)
>  #define GSCCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, GSCCS)
>  
> +/* Our devices have up to 4 media slices */
> +#define MAX_MEDIA_SLICES 4
> +
>  #define GT_VER(gt) ({ \
>  	typeof(gt) gt_ = (gt); \
>  	struct xe_device *xe = gt_to_xe(gt_); \
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 0714c758b9c1..0d97a823e702 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
> +#include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_submit.h"
> @@ -123,6 +124,8 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	xe_gt_sriov_pf_policy_init(gt);
> +
>  	err = xe_gt_sriov_pf_migration_init(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 4445f660e6d1..003860661687 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023-2024 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
>  #include "abi/guc_actions_sriov_abi.h"
>  
>  #include "xe_bo.h"
> @@ -10,6 +12,7 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_guc.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_klv_helpers.h"
> @@ -351,6 +354,133 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
>  	return value;
>  }
>  
> +static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group **groups,
> +					u32 *num_groups)
> +{
> +	u8 slice_to_group[MAX_MEDIA_SLICES];
> +	u32 vecs_mask = VECS_INSTANCES(gt);
> +	u32 gsc_mask = GSCCS_INSTANCES(gt);
> +	u32 vcs_mask = VCS_INSTANCES(gt);
> +	struct guc_sched_group *values;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	int group = 0;
> +	int slice;
> +
> +	xe_gt_assert(gt, xe_gt_is_media_type(gt));
> +
> +	/*
> +	 * Post-BMG the matching of video engines to slices changes, so for now
> +	 * we don't allow this mode on those platforms.
> +	 */
> +	if (gt_to_xe(gt)->info.platform > XE_BATTLEMAGE)
> +		return;
> +
> +	/*
> +	 * On BMG and older platforms a media slice has 2 VCS and a VECS. We
> +	 * bundle the GSC with the first slice.
> +	 */
> +	for (slice = 0; slice < MAX_MEDIA_SLICES; slice++) {
> +		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
> +			slice_to_group[slice] = group++;
> +
> +		vcs_mask >>= 2;
> +		vecs_mask >>= 1;
> +		gsc_mask >>= 1;
> +	}
> +
> +	xe_gt_assert(gt, !vcs_mask);
> +	xe_gt_assert(gt, !vecs_mask);
> +	xe_gt_assert(gt, !gsc_mask);
> +
> +	/* We need at least 2 slices to split them up */
> +	if (group < 2)
> +		return;
> +
> +	/* The GuC expects an array with a guc_sched_group entry for each group */
> +	values = drmm_kcalloc(&gt_to_xe(gt)->drm, group, sizeof(struct guc_sched_group),
> +			      GFP_KERNEL);
> +	if (!values)
> +		return;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +			slice = hwe->instance / 2;
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			slice = hwe->instance;
> +			break;
> +		case XE_ENGINE_CLASS_OTHER:
> +			slice = 0;
> +			break;
> +		default:
> +			xe_gt_assert_msg(gt, false,
> +					 "unknown media gt class %u (%s) during EGS setup\n",
> +					 hwe->class, hwe->name);
> +			slice = 0;
> +		}
> +
> +		values[slice_to_group[slice]].engines[guc_class] |= BIT(hwe->logical_instance);
> +	}
> +
> +	*groups = values;
> +	*num_groups = group;
> +}
> +
> +/**
> + * xe_sriov_gt_pf_policy_has_sched_groups_support() - Checks whether scheduler
> + * groups are supported.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF.
> + *
> + * Return: true if scheduler groups are supported, false otherwise.
> + */
> +bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	/*
> +	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
> +	 * been merged in v70.55.1, so we require the latter. The feature is
> +	 * also only enabled on BMG and newer FW.
> +	 */
> +	return GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 55, 1) &&
> +	       gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE;
> +}
> +
> +static void pf_init_sched_groups(struct xe_gt *gt)
> +{
> +	int m;
> +
> +	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
> +		return;
> +
> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
> +		u32 *num_groups = &gt->sriov.pf.policy.guc.sched_groups.modes[m].num_groups;
> +		struct guc_sched_group **groups =
> +			&gt->sriov.pf.policy.guc.sched_groups.modes[m].groups;
> +
> +		switch (m) {
> +		case XE_SRIOV_SCHED_GROUPS_DISABLED:
> +			break;

nit: since we know that for DISABLED we have nothing to do in this loop,
so maybe we should not start with it?

	for (m = XE_SRIOV_SCHED_GROUPS_DISABLED + 1, ...
	for (m = XE_SRIOV_SCHED_GROUPS_DISABLED; ++m < ...
	

> +		case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
> +			/* this mode only has groups on the media GT */
> +			if (xe_gt_is_media_type(gt))
> +				pf_sched_group_media_slices(gt, groups, num_groups);
> +			break;
> +		default:

nit: since XE_SRIOV_SCHED_GROUPS are defined as enum, then if we declare 'm' as enum,
instead of this 'default' case we could just have dummy case for COUNT
and compiler will help us catch any new missed GROUP mode

> +			xe_gt_assert_msg(gt, false, "unknown sched group mode %u\n", m);
> +			return;

hmm, IIRC those modes are supposed to be per device, not per-GT,
so there is a high chance that in this loop we will have to handle non-media modes,
so maybe this assert and early return is too much?

> +		}
> +
> +		xe_gt_assert(gt, *num_groups < GUC_MAX_SCHED_GROUPS);
> +	}
> +}
> +
>  static void pf_sanitize_guc_policies(struct xe_gt *gt)
>  {
>  	pf_sanitize_sched_if_idle(gt);
> @@ -401,6 +531,18 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>  	return err ? -ENXIO : 0;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_policy_init() - Initializes the SW state of the PF policies.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF. This function does not touch the HW,
> + * but must be called after the engines have been initialized.
> + */
> +void xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
> +{
> +	pf_init_sched_groups(gt);
> +}
> +
>  static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
>  {
>  	drm_printf(p, "%s:\t%s\n",
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index 2a5dc33dc6d7..f5e3b2595063 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -17,7 +17,9 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>  bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
> +bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
>  
> +void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
>  int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> index 4de532af135e..d228cadcd8b0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> @@ -8,16 +8,49 @@
>  
>  #include <linux/types.h>
>  
> +#include "abi/guc_scheduler_abi.h"
> +
> +/**
> + * enum xe_sriov_sched_group_modes - list of possible scheduler group modes
> + * @XE_SRIOV_SCHED_GROUPS_DISABLED - no separate groups (i.e., all engines in group 0)
> + * @XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES - separate groups for each media slice
> + * @XE_SRIOV_SCHED_GROUPS_MODES_COUNT - number of valid modes
> + */
> +enum xe_sriov_sched_group_modes {
> +	XE_SRIOV_SCHED_GROUPS_DISABLED = 0,
> +	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES,
> +	XE_SRIOV_SCHED_GROUPS_MODES_COUNT

nit: maybe to emphasize that COUNT enumerator is not a real group mode, prefix it with underscore ?

	__XE_SRIOV_SCHED_GROUPS_MODES_COUNT /* must be last */

> +};
> +
> +/**
> + * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
> + * @modes: array of masks and their number for each mode
> + * @modes.groups: array of engine instance groups in given mode, with each group
> + *                consisting of GUC_MAX_ENGINE_CLASSES engine instances masks. A
> + *                A NULL value indicates that all the engines are in the same
> + *                group for this mode on this GT.
> + * @modes.num_groups: number of groups in given mode, zero if all the engines
> + *                    are in the same group.
> + */
> +struct xe_gt_sriov_scheduler_groups {
> +	struct {
> +		struct guc_sched_group *groups;
> +		u32 num_groups;
> +	} modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
> +};
> +
>  /**
>   * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
>   * @sched_if_idle: controls strict scheduling policy.
>   * @reset_engine: controls engines reset on VF switch policy.
>   * @sample_period: adverse events sampling period (in milliseconds).
> + * @sched_groups: available scheduling group configurations.
>   */
>  struct xe_gt_sriov_guc_policies {
>  	bool sched_if_idle;
>  	bool reset_engine;
>  	u32 sample_period;
> +	struct xe_gt_sriov_scheduler_groups sched_groups;
>  };
>  
>  /**

mostly nits, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


