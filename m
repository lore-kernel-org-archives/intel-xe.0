Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E74DCD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 14:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB7B10E451;
	Tue,  9 Jun 2026 14:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxImEYPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DF510E44A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781014226; x=1812550226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mbSJHzQNi25wBVGyZFIxonE7Qk4ZxFxSqObyBpEmErQ=;
 b=MxImEYPy4oG2sorT9IgKbU03+hpJANZchYmPLJns7+wF2V/gQTxS5yQx
 Bf0ZTtnOvgWc/GLoC/kLz3POC1HVCTql9iXc/qVXGWVLgYugmrGrThQDN
 tgsq/JAbCR3nBpILmmJEm1fcdzK1KP1gjeJYttjpgHFUhRoityrEhBbxz
 KDkL0lhCZY9h2ITeGUhogWFbBbWmBLpjbW+d2bQKRcf08J7t7QTD4zBMW
 TYQD/5XXFrpCedpm17hc0JPPXa1lkGfaH1+XlU61+onFW1dEaUogc8enh
 5tjHTTQrOsjvioZg8RdP+Z0dqy/Y2igiPrWolp8wuuZCwiKCMBqr+GZEo A==;
X-CSE-ConnectionGUID: +NggqijWTieEYxepQbs3Qg==
X-CSE-MsgGUID: AfZVpXaxTIinYr72cDBXQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93262531"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="93262531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:10:24 -0700
X-CSE-ConnectionGUID: 8bVQt5F7TI2q57T9DGbGLQ==
X-CSE-MsgGUID: aI7Ahlt+SauTG3uNn0LezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="245021371"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:10:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:10:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:10:23 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyyooO+UcWxu0oT35cpGqUQAMIhZsz1powKnOPjisqFCPNX4undu2KPe4SGKuQab0FMOy7OBu984RBV11jwYDMuP6TBRZXXlKKjtzWh6jIG8pYrpOZzOa5R9zzttfMr1pLd3+x3dgbctIc3gCJMO3YSa7ITiAnDcChuJc4uf0/2KBvwfOzVxVN9IAmHzcwQjKg/N3xMu8gP0az3RS+m0pijztg90X5BJ6kz1yg2cJ9+dBQonc6ivRFEOi6xXvU4Bk2kMa/B9tgUfcSjJtojVU0oEXWNXLhJ3w8DWvmx9O4h98k1c276CuyLgmlh470yuzQloE40bvqBCP8FzIXGviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mygXF5hHje0q08EN8Nw61V1cughguNMB6wsFhyyFVf8=;
 b=oEfJOkh8G5tTILVNkXQeGomD/XpqDxGpye1Komsv3/oaUDi3bW9uhuUlawiRzyS4bQE2ylAhULK9nCbuUVDEtfNMbd6W3Up/+EjO5kEPbZQcD1eJyzn05pqOtD93pc55f0Q2a0oP3FrlUpp338VMGpTbw1pqGe4B5n1/stQ9Zd/h+I74knV+yNAOzAO8FV+e6ObLt9xQ2650aet1jhxypm51MphjEN7dp/qFqSvWf0COBLqtR6gVSsgTbejJPxIq13uDR9wR1O9Sq3xfk9tKMNC1J+MRrkggODBn24BxfoOzGJf2eyQJy3EA8cKpm71gOeIarmQYMB6cdiQR1IjZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 14:10:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:10:18 +0000
Message-ID: <4ec46336-2d4f-4249-a742-2667dd12279e@intel.com>
Date: Tue, 9 Jun 2026 19:40:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
To: Soham Purkait <soham.purkait@intel.com>
CC: <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>,
 <mallesh.koujalagi@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <badal.nilawar@intel.com>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
 <20260608052556.1744123-7-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260608052556.1744123-7-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 268b4c92-7205-4cf0-ccca-08dec630d61e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|6133799003|3023799007|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: ihhG6TMYcLMJd309pH4kgX9HpgvAOrhNKe1azaEKU7i8bUse6bNzNzppDAzmh+EUGBJxUfMe7BhWj2YYDkmgy3vVGxKfPJ/jnRB6SkwEkj0d5yeNtdDb/DoDvlxrHV3Uee64whuZEAikQCeVMg+WInhA/GGXkomCrlytG21AdWZKG5UvVujTr8FJyYvaig3pSlhmbk4uRCRDAKqoPoSuXutfxHoUZ9177bAT9mixeiggI6o4Yt4wBdn24YlSzAo3jpMW5NqIMteiSYOu0KRB6KjqEQXHGJ8VBuwmBhmULvsUB327brxlS2+9OQXgfgui79OODc6kcDbDlfRfze3h3DS7t/u/9yT01rkVUzOkGRObkGV/tzVHGEKRoZ9mo8NxgVcK74G6gelih4Ln+IIIBKAIIwrfnkABvRGUGdEcV5gZ4ge//baNd0pVkBKTSXETs8GvcLniMNO2YKJQtfkT7hYmgAL/gIEhKWGb9nz8pFjB+7rVyEVtferEp68x0eAmEz1zlE2Vkg7ZzWvrKpO4piCVIc/8YR0JOj8b9rxEbCW/Z/xKmUToSI6IiOxa/tBDGph4Eo9F6b8D2Z7hfIK3qSEVf1tYvFvnyBCLxi3lu6JhBcDRum/DyjbXePDo0WvGKee00y0xAx4O0QGOvIRHiQGfvCVPWFNRdq6UnjeK454DRscJfDOXtSqAeWBz/OpZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjB4SWF0d2RNdkVYUkJYdWRYVklreDkxdXEzd25vS3lkbVZGdUJ6bndvZnBH?=
 =?utf-8?B?VXk0TjBIOUw4ZXRRRDd1SDI2a1dldGNVQ0R1UDgrM2hKc2hZRGdGSUx6T1l6?=
 =?utf-8?B?WCtnUGw4S2JQVkM4UDdMM0VGdDZ6SjZMZ3gvK3hDR0FOQWJqdnExYWtmNGdF?=
 =?utf-8?B?UUFQNlAxRDVERVVaUVp5K1ZhS2hCOWxZNDZMTFF2RklyZ2NIWEFRaExmcGFM?=
 =?utf-8?B?ck5FNU5EdEdkWlFHYzNNeGJOSStkbXBQTDNKQ1FXc29GaVpDNG5aYUZ0WHJ2?=
 =?utf-8?B?NE9IVi9zRmRDSnczNmxmU0R1Q3ZkeXlDSG9KQWFpbmxDV1NSMlUwV244b2pW?=
 =?utf-8?B?WjBnK1pwWFFwYXdXQWdPdVR0M21PMmIxc3VTeDZtYnlOcVlaNWJiSHRlQXcy?=
 =?utf-8?B?RUl2UFFDN21BNFd0Uk5zcUsrNUl4a2FQWDdhOEozYzVwY2tLTDVTNDhNYzRy?=
 =?utf-8?B?UWREL0JBUmhFdEoyaGpJd0VILzJhVU9jUXM4Ny9vRFZGcXlRM0FMVFluV2dp?=
 =?utf-8?B?b1BvWEpJenRCTXZNaU5ScnFmRG9qcXRpU3M5WFJ4U1lMUkF2dTNUWDg0Q0o2?=
 =?utf-8?B?aG1kUEdqR2x4YVBJSnFlbHlQTGxmM001RGRlQWZaTnU2dEx3eE5CTHdCU1J4?=
 =?utf-8?B?VFJKRE9ZUVEwanljVXhoOWJTMkxOZmtJNFM5dGZWbFMxU295QWhYNE1PdE5V?=
 =?utf-8?B?WUVBRmVEYnVpekpGNzM3Z1J1dUNrbWtaVmVCWkFLNzVOUEk1VVNJRzcwZnBm?=
 =?utf-8?B?eEx5OEZyOU5zMFZIRklMM01RQXhXNmE2ZFFiMytPNWpZZ1B3a1RTLzI2QXFC?=
 =?utf-8?B?TnJUdnhORmdscDFhQ3NZOFNNZkFZdFBXZmRvVG5mMDF2Qm9VYlFqWG1BYmtK?=
 =?utf-8?B?U1VxK2xwZkVpdkJGZ0JaSWVrVTR2OGJaSWx6TTVkWTZkYm01WFVqODJHcmoz?=
 =?utf-8?B?U2c4MTh2aUhZaEc4ckgyLzlITExBdVBrakxrc0VJYlkyMmtnOTNZemV1REJ4?=
 =?utf-8?B?QWUxdVd0UTJyY1lNWE1wemwwZ1pjeVBDTU44L0Y5VzhON2QzNmNsWUFHcnN4?=
 =?utf-8?B?bFk0UGl0WlZkeXgxaHl0amhVdTNMS25Nb2dFL0hRTFVTN1RkTmZJU25jcmtT?=
 =?utf-8?B?TkZuSTBSWEVBZHo1SkE1R09PM1pidGhGWTVkZ294RkVtZFVzNmRLVE5rUXUy?=
 =?utf-8?B?MFVGdG5Ec2RFTG5zZGVua21zaytFdHlhTmVBQ2JQcmVxOTdMenFFcXUwZTZC?=
 =?utf-8?B?USsxd0ZvRmJQY0ZXdEZOdVZSbk55cUU5bFAxbTUycTNmNERxS0FuZ0FMRkE0?=
 =?utf-8?B?R3ZmMTRDWElVYXVibnEwR01mMWZhSWNsbEN4YnJuNUpKZWZJcFN3Q05HQi9J?=
 =?utf-8?B?dWFsZzJFU3dzRWVwWFRPaFNOK3ZvTjVSZ25hTXIwVFd1YktaOTJYb3RaMTE0?=
 =?utf-8?B?K0lwdWg3UTRmOXVTRnBEL1Y5YndTdzZocmhTcjhxTWhwWUQxSVNpWXhXbk43?=
 =?utf-8?B?R2tNRUg1QzRsRlVNV1BERWp5d2pWTk1XVjcrVmdEWDJsLzhERCttb0tTc0NG?=
 =?utf-8?B?cU9sU05kUE90cjR2T240bDQzd1pVRzNCM0tOY3hVOUJaNWZMY0JCUGwveHpT?=
 =?utf-8?B?dDVqY2xZeWgzSzY1K0gwQnh5NmhJVEpIUDlNS1B2a3k0WVZMbzZUcy9xZDd5?=
 =?utf-8?B?RGhyWkNVbmVnK2ZCWDZhUHpUc25POVNsR2ZyYkY5aklsSmxnUGxRQUFRdlp5?=
 =?utf-8?B?VE1HWC9ycWhDbFUwM0E4K001WnRKVG5zS0hFQWZFanNUWVlYV3VPR0xpbERs?=
 =?utf-8?B?Z0RzRVpxQ29aSmUvRUp2VG1SSnB2aFBWUC9pZldpeUJ1Wit6Y1JqRkE3ZG83?=
 =?utf-8?B?TEZpekNMM0d3dmF4SVNOdjRtZ1F0dW5YODduTWx1RkpPU3FqQTdtYThrZXhv?=
 =?utf-8?B?YnViZ3NqbFEweUFEZEF1b2t1UlRaZnhnK3lXUmdMV0xRYjRObU5IQjRTYm94?=
 =?utf-8?B?WWF0d2doOGdKOXlPRHRlR0lQSzhIS0V2SmVydkxnTHJFQVNUY2lBcEpJeTUw?=
 =?utf-8?B?Ym5ud3FLQ3pZZGp5QmZMOHhJdlJBRW5RWlAyMUJJQnZUM3ZXU0VqckNub0Jx?=
 =?utf-8?B?Z0dRc0cvdEk2dnN4WkhIWTdheTVRMzVRTzc1Z0pnZG9rTGtNT1AvbU44OWg5?=
 =?utf-8?B?WW02M01HRUpYMHJwRjdFcWN5VS9raGVwM2lKSHVPbnZ2UGh0S3p2TmNrY2pD?=
 =?utf-8?B?aEErcVljdUN5a3d0RTRjTGo1dVc2ZUVrQjVHWjZNcUN5bWw2UDdBMmpoK2lt?=
 =?utf-8?B?WjliMlErcG1GUDl6S216NXAzOUl2Q2lyT0JqWXUwYStaYlJ2UmovQT09?=
X-Exchange-RoutingPolicyChecked: qCRiAy5g163Z//8Lzqkj6wvqkp7PPkU4zEWRQiJWUugbnlvZhnCjADN6hzQlZKWliuo4XLKCn4jrvKnA43cvfjN+dFpc/2KTmidgYLq0CcrpX31QD6/HH3AC+wDQBf7aLgtWCwQv9Is5Q6cgPfcTkfSQez/umronRjh7btDWa7k/EHSPBcAm8fNi+LjuDgsNhe4Y1I2T+eOH7rLfpNc37x7nqiKBrAZsOJJfxFe/9u3r2anlA+EUAfLtY+VtklrAZ0uvEMEqI4JmvkQLdj9W1y3MEQ0FconBkv3/2+dZ/NVcRNx8W3WHQXTMrSjIXwat+6EbdI2DgOjBDHlISiKVtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 268b4c92-7205-4cf0-ccca-08dec630d61e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:10:18.7753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RN2PGVvY1hEiIAQa5kg16hWoi7BC+DxxyseZkYYgR5TDD4TcCj+7bPd+q1ITHTmINj49yjTE/jhsqK4HJXqtMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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


On 6/8/2026 10:55 AM, Soham Purkait wrote:
> Add RAS GPU health status values and mailbox payload types for
> querying and updating GPU health. GPU health states are encoded as
> numeric values defined by enum xe_ras_health_status, and the GET_HEALTH
> and SET_HEALTH commands fetch and update the current state through the
> System Controller mailbox. struct xe_ras_get_health_request/response and
> struct xe_ras_set_health_request/response describe the corresponding
> request and response payloads, with the SET response also carrying the
> operation status and resulting health state.

As suggested in previous revisions, please keep commit message brief 
without structure names .
Instead explain functionality, when user can use this and values.

please keep the structures in the same patch as implementation. Either 
split get health/set health
or combine.

Also do we have a consumer for this? and igt?

>
> v1:
>   - Add enum for health status instead of xe_ras_health_status_t.
>                                                           (Andi), (Rodrigo)
> v2:
>   - Make logs and structures consistent with their counterparts.
>                                                           (Riana)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras_types.h             | 57 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 ++
>   2 files changed, 61 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 6688e11f57a8..438746b5ffd9 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   
> +/**
> + * enum xe_ras_health_status - Device health status values
> + *
> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health_status {
> +	XE_RAS_HEALTH_STATUS_OK = 0,
> +	XE_RAS_HEALTH_STATUS_WARNING,
> +	XE_RAS_HEALTH_STATUS_CRITICAL,
> +	XE_RAS_HEALTH_STATUS_MAX
> +};
> +
>   /**
>    * struct xe_ras_error_common - Error fields that are common across all products
>    */
> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>   	/** @reserved1: Reserved for future use */
>   	u32 reserved1[3];
>   } __packed;
> +
> +/**
> + * struct xe_ras_get_health_request - Request structure for get health
> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for get health
> + */
> +struct xe_ras_get_health_response {
> +	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;

Nit: It's already in get_health. So can just be health
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for set health
> + */
> +struct xe_ras_set_health_request {
> +	/** @new_health: New GPU health to set, see &enum xe_ras_health_status */
> +	u8 new_health;

Ditto

> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for set health
> + */
> +struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation, see &enum xe_ras_response_status */

Nit: Can just be status. It's already part of set_health structure

> +	u32 status;
> +	/** @current_health: Resulting current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;

Ditto

Thanks
Riana


> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
> +} __packed;
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 6e3753554510..d4da6e9ef774 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>    */
>   enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
>   
>   /**
