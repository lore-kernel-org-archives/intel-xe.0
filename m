Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5293EE49BC
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CE410E19E;
	Wed, 11 Sep 2024 15:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7N17if5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9877810E19E
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726069039; x=1757605039;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DfO429jgoiF1MbyoGgYyGLr51o2RtCMdGgLAIIkjnVc=;
 b=b7N17if5cqKq6t7ONHKmrBVne4eljaHYBmyLgCoWZeW4BAOBrHKby8UL
 Rb5ZEaL+pDIfM66K2T8LaoSh/DXUqFGc0dZU+ogwzUCu5WUMUWDmwyOxB
 N78UVmwf5Q75QL5yfMVMEVkcK1n6UF1yx7EMG60X13Ix5OdM63HTpMls2
 32reS+csQHV9qqVdB5eJ0rXQDPZb8E1/4rUOQozVnTwcQBRWKzgWm3DnR
 FDMjvloA8sSYc6tBZinZ6mK+BvOv4CGIMKEHWRWlAmodFy0qj0vzUUl67
 VBJItUFgi8upHYORFw8KEjDkhh7WBOjrxriBTZWJaWp/1dl8hxVMANzaH w==;
X-CSE-ConnectionGUID: Qb2WedtvRlCy/WjJV0/tIw==
X-CSE-MsgGUID: JjnAZ8CqQDWVs6IJtRJKzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24813636"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24813636"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:37:14 -0700
X-CSE-ConnectionGUID: dPd5FfRgRKmQ691HsmXbkw==
X-CSE-MsgGUID: wxk/bvrYQ5mtQ1hZ70mDXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="98116901"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 08:37:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 08:37:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 08:37:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 08:37:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLD0KM3yyNFPSyJqYWbMrUMuFB5bAw4oxFpeIR0ZE6yKgWwuHggK5Tv3QwAN2A1O/3FSCOLVKfFS6ipLulFvux+YYVCmlDhlHYAUKYj5OjzOuZMhsdbeIjU5S22Xh4V1RSJP5DlBJr6uOVkT63RPTujHdaXIjtowQtx4JHQamvIznR50/p7hWbjlUDUGHZeU2q9icZkmPUp51OxVLhfWjNl940hz7YJmTNev4+tUhThTsWjlORs6whTdWrVweJ7FNmuHKK82ut9yQ7AQBhLITj74Hv/OZ8G+EoshrWNcQZH2jCQt9e2KfqpfkdmOonLxAL5qYsLBGdOQUQ7YUDHOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfO429jgoiF1MbyoGgYyGLr51o2RtCMdGgLAIIkjnVc=;
 b=a50/T1ZUkTReMgtaT/3P4Y25pWcZr0G59BsjyqJbGbIhf8NEgSQZ1wNXYK//H0FZ9VCIK52u5i1aqhjmReqHbcAYRZtgRcuyMAW5eMxr6hmxjrLq+zBNmigBtEGIQWkZ3y6r0EOWRIrH5rw9h8vq+ns1lTcG/VRBasT7/AeZSCwdOfP00URH/sSJ7sAMLEHabvCEJRfeSuTO2ubGuY5ivUARKypnlbh9/Ojy5N9w1fmFXx1DEb1MsMoOFajipggk99qad1DAMQUxDjHZgJb5RUN5R8iZyvsFcoAYQikFuxFMNbjwZ4uZi79RMvifPIDPujI/byMUqVLuJTiQ1o6hfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 15:37:11 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 15:37:11 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, "Graunke, Kenneth W"
 <kenneth.w.graunke@intel.com>
Subject: Re: [PATCH] drm/xe: Use bookkeep slots for external BO's in exec IOCTL
Thread-Topic: [PATCH] drm/xe: Use bookkeep slots for external BO's in exec
 IOCTL
Thread-Index: AQHbBF7nrw2nDShf90206mMQ+X5ygbJSuCsA
Date: Wed, 11 Sep 2024 15:37:11 +0000
Message-ID: <7199ce6364bc4ae5d66600e49acb288fa58a585e.camel@intel.com>
References: <20240911152622.903058-1-matthew.brost@intel.com>
In-Reply-To: <20240911152622.903058-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB8449:EE_
x-ms-office365-filtering-correlation-id: 655ab024-8ca8-454f-3738-08dcd2779a54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bnhXQVQxd1pIWUxTMHNlWUx1RmpFbmFnTXFQTE5XOHljcEVDQjJ0K3JVblVy?=
 =?utf-8?B?MENtNExwZ0xFNTVETUluWEx5ZWRSWEtQNXVXdVpJN2hzSmpEMnhhVWp3OFZX?=
 =?utf-8?B?dHc1VXB2Q1phZlVPZm5xVDNENVdmU0VQMmt6bGJkYjAxTzNKTEl0ZU9IYnJZ?=
 =?utf-8?B?OVQ3SFZVVmZQNklOSXRDN1UzVzVXbGU2eEgrSWNmTlRhZXpaSDFzRG1vdkh3?=
 =?utf-8?B?MlYzVXNla0NvbllkRUNjZEVOeWJxTW5Wd05qV2NTeGI5RUVsa09qTzRDVmN3?=
 =?utf-8?B?OHZBeHpQN2hOVzFhQnZIdjVIeGFjWUUyZnpDTFV6VmNoUW1CQVlsN3E0TXYy?=
 =?utf-8?B?OERGZjFjWm1NTVNqcGE3T1NueWRiTFNHUitzbUtoeWNjZ3F1KzJDWU5oZEVM?=
 =?utf-8?B?VGRFa3pIRWZaTk9iZTg3OVN5RjA0NGZYeDJoL0tUK2g3dXNFZUhJajdGWjZW?=
 =?utf-8?B?aHZCUnBpZzZ5YTBtZ1EybWlZLzdlbHJMZkdlQW0reWZqQnRoZ3FpZ1FiZDlM?=
 =?utf-8?B?OE5RS3RoTSsrWkVSTUdUNXVBcUYwRzZBUk5ONjJsRHVhRTh3dk1yU1cvU0Vq?=
 =?utf-8?B?MFRBMGl6d3R5clRTa013UWEvSjZGdmZ4OEJ5cm8vTU1pNUQyTmZxUDFJTHFz?=
 =?utf-8?B?aHJpeTg5a2VodnFWSm9hdmVsMWpqdDVLZ3N1OVY0U0tJcjl6U2xvdUkwSTVi?=
 =?utf-8?B?VDFKZWtjbDF0REJHQVRoc1Rydk5QUXJyTEF0UEFFc2FHa0l3MEVtOE9ka0N5?=
 =?utf-8?B?NEI1S2FzY2V5T3VNRk5XNmZHcWx5NEZRb0NNQ29HbmVqTk13N0NPRkFVOGQx?=
 =?utf-8?B?SEpYS2JOZzRmZVlkMXZkWlRabDJVc1ZGRWFzL1RvQWV6R3lKRzdDYUVLdG1H?=
 =?utf-8?B?Y0xxTEIyNkdYQzRRcFRvWWRCN241QXFTMUk4YzhFcmRYUDlsY2JLSTR2S0xH?=
 =?utf-8?B?R090UzU0ek82cytoNGR5RFNmaGtBYTFDVzFQSXN1cHBleiswSEVRaVMrQ3R5?=
 =?utf-8?B?RnBjb2F4ZHBpRm0weDBaMHpMazZjNWxXMGNiWC90NE5oS29JYmFJYnc2Q0w5?=
 =?utf-8?B?SmU1aDJrK2F5dFh1dTJLZ2VFQzdlNkdTYnpVTElQTmJUNFJxcHJkUEI5ZlR3?=
 =?utf-8?B?RU1Hc0prd1JidjhEaHJFUTFTKzI3Mk00UjBQMWp3Tit6c0E3NWs2M0tROEdn?=
 =?utf-8?B?WVN6Wms5MGRBQ08vZ1JRV21DaVlvSjQrWVhJbWlrTHYydXlJcUw0cDY1WDhB?=
 =?utf-8?B?dm9BcHlDQkZCYXVXb1ZINE0yczArTEgzYTlmeURiTjk5eGx5WmxtNGd1bEIv?=
 =?utf-8?B?ZndCNmdMUkRjNW1iTGtPWUQrYS80WlBETVUwK0x4NkRidFBMazFKYWljbkhJ?=
 =?utf-8?B?aFFtNWpDcVZKR3hDeFRwZmxoY3I3c0hXdTMwMUNaRXA5Zm1YcjdvbTZVNDVz?=
 =?utf-8?B?T1Qxekk3SG9Cbk9WN0RBb3ViRTRkNUZXclV5dTVoVnQ0Q0RIT21FRlN0VjhI?=
 =?utf-8?B?L0lQVGVVajBLVFhqZ3JnUVl3ODRiWDU0SHIweUlpWUg4cVJwc0xRR1RqUWcz?=
 =?utf-8?B?dnA5cUorbUtwODdWTDlGSUhRTk44akRuRUdWcE1xRzhLNnZJMXNWU2hmSnA3?=
 =?utf-8?B?STkxbm9HbDluZ2s0OWZsVnZOelNtdGVnT3ppZENFZ21vRlMwTkFZN3Z2MWFK?=
 =?utf-8?B?aERhd3MwU3lLWkNudEFOenR5Vzh0a3BEWkk0eGtRWWhxb200cElXdE9SUEox?=
 =?utf-8?B?S0g2cWNvbWZPLzdDVWZkdXBReFF0aUtENVYwSVR3cjFzbk1EdDhBSythVTFT?=
 =?utf-8?Q?XEaAi/AbyfTQhBztlTOOyZ05DLJWc1tqB3gkE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXlCMExBTnZkVUNnWXUvek5EVlFOeEkvcDNrWTZKVkxTL3lTK1ZZRFRoY29F?=
 =?utf-8?B?QVZlQ05iWitFc3VFWEVvSzJORUF4cnZxaFlNNU55WStrdk9yd3dBcDY4b3VI?=
 =?utf-8?B?WTZJRjh2dk5zdm13c3JvNEpGVEtrK1dRWi92QUE3N01yeUxNUzc5Qk82cjhB?=
 =?utf-8?B?NEVFME50b0JXYldORTRVdm9TMGs4dTB6OGxRSjFoNjNZRXJkMUUvYm5jaXhF?=
 =?utf-8?B?Ny93SkJoQW1kQ085TkgyYkNzQmxPZ2hOYlg1WjE3VEtjK29neFluNnlneHdQ?=
 =?utf-8?B?WHE2czdoMjFtQ1hJK05pUzFrNmtxQnUxZk5LQUdpUzFTY3M3NEtBd3lqR1JI?=
 =?utf-8?B?TytqL0UvaEl4STJFUlExQ2FHS3J0QllrbEh3d1JzcHFjYlU5ZWx5bENuV3pU?=
 =?utf-8?B?ZlhRZ0M0SnlLZ2pMVHlWVzdmZUNUaFM4NGdOUzltR3NjR3YvRVhuYXRMUlZY?=
 =?utf-8?B?alljQlVDcTlkMmRXbmtMOHc3bm4yVlY0RTYraGkzV2s2THgwUmFSWWlzdW52?=
 =?utf-8?B?OW1TNitCQURqbDdzZHNGdjhCQ3Q3UGYyL29KRkl4RWpyY21FQWJyWWFEMzJ0?=
 =?utf-8?B?RlJaekhmdVNUakhxeGtEek5YRHljWE14cy9UYWZnZU5TM0lMNWNWVW9pTld4?=
 =?utf-8?B?bjNDbVNDQmRzS2JiVlVDSGpHK1ZiZENGWTZIelNaYVZrRUo4eGJtaVV2bGVk?=
 =?utf-8?B?aUdUMmhIZGdOL084NmdSckVLM0pweGRJYkhxdEl5QlIvd01rd3Y4emhnVWlz?=
 =?utf-8?B?cmVKVUVDQjF2UzlqTDVWUlBWZ2tlTUNPWFVMK2ViTVJzUlJnVTdBUWFrZldm?=
 =?utf-8?B?SWFrNUthN3JCRUtNRkhSM0hIUVRiajF3dWhON0UwaGxvUXRZQzQyMkFxNEg3?=
 =?utf-8?B?Z1J3Wnd5aDhoZmRrZU1mdUFQM0l5U2dkV00xUnJ3KzJpTHdUaWwzYUg3RWQ3?=
 =?utf-8?B?NnZ0SXVQSTRPOVo5aGR6UVJQcGlmV3piZE9LYlFTUHFTbE5yWTlvbTZiNGFl?=
 =?utf-8?B?VnF1bFlobnhyZUNNMG1GTzA4SDBScUdEa09CQmxqYjVGQUxNQ1IwTUVkblRX?=
 =?utf-8?B?WnMyKy9tT3FvU2MzRG9Cb2Fac3pBalEzM3B1UFdzZ1hJV2d2Si8vcVRqb0M1?=
 =?utf-8?B?Tm9vekl0Mk4va2VmbE8rbHpMVU15VGN4eHN3b0pWdHZjRGR1QmtPOFJQdEpv?=
 =?utf-8?B?N3o0YURoczg2RDdWajVSSENGWGtZNjM1WUs1TWFOUTFoVjhDeWpNVzlWcHVv?=
 =?utf-8?B?Uk56Rmpsd1p2eEdpQVNHTTh4bG1yL1Y2RjZla3JFb1BONDZGaHk2OHFDQ2dE?=
 =?utf-8?B?bjU1RWNjay9ZRUF6Wm5IVk9NMkcxS1ZoMHdxcEVyS2ZVU3dZMUtCRXBzbnFV?=
 =?utf-8?B?SmxOYkhSUUtYZUJoSVByMU1jODdZSmlaOTR4VS85Qlkyb2crTXUwUStLMFhx?=
 =?utf-8?B?R1hmVzQxNWRXcGo2RzcxS1E4ZFEwUjh2ZkJXNTd4UHNTUktXYXJ4ZXFPTi8z?=
 =?utf-8?B?MW85YWplQlNUOGI4QjZjYzVOME5GSVRTbmxQQnE0L0llR2NyaG5mTTFrd01W?=
 =?utf-8?B?Zmk2bnA2Mzl6bjVUS2Z2QTRBczZQd21ra2pDWVNxcjczRlE4aDF6QlEvVm5m?=
 =?utf-8?B?UU9lWWpjaUFtdWZXWjd3OUNjTXQ3emk1N3lFM2tjaSttZUdJaGtuQ3ZXd1M0?=
 =?utf-8?B?bjZTYjduV0x4QVlOM00veUFYOU9CWU0ramMvY0V5Zy92WnFLUnJQRGxzRzFT?=
 =?utf-8?B?K1QvZ2VuRFdmTGdSMW9QVkpEZVhUeGF0R1ZPSmN3OFhVQ1FLMWFwUFBsN1hm?=
 =?utf-8?B?ZWUvRDUrZU9wdjVSbENtUzIwK0FScVMvUVRqaW9FaXVMYnpYcFo4UmlrT0RV?=
 =?utf-8?B?Q0tPL002SVRGMDRtanZxQ0xsZkFEWUsyQkVxNFhTcnpOTFZZRU9jaUF0YWRa?=
 =?utf-8?B?WGZnN1FZaW10K21zWVl4WU1GeXZ1MHFaSE5NQVlhM2t0VmhiSFlOdUxuVVp1?=
 =?utf-8?B?eEs3WnpZbFByMTNCQTl2VlF2K0FWTjdiQTFuOEJKeXVhcXhOblJUMWJCTjFB?=
 =?utf-8?B?d2o3RjJLZk1GV0o4V2FUNUsvbkdXbnRacTFBdEhHQXJqN244VEhFL3lMUDVP?=
 =?utf-8?B?VGEwL05mMVQzdElKcWZtT2hBV1JWQlJOS0phaTJhYTNuWXlXaHFBSkdIQ0xw?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD59131E43A64E48817195841BDF295C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655ab024-8ca8-454f-3738-08dcd2779a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 15:37:11.1701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLsriz62s+maMn1XGcCZBUrK9bawZmXEQw6yJOUQ8/fcplBEhE21GYKTzPHTKQh427YsoMourj4NCQS4S1eqNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

T24gV2VkLCAyMDI0LTA5LTExIGF0IDA4OjI2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBGaXggZXh0ZXJuYWwgQk8ncyBkbWEtcmVzdiB1c2FnZSBpbiBleGVjIElPQ1RMIHVzaW5nIGJv
b2trZWVwIHNsb3RzDQo+IHJhdGhlciB0aGFuIHdyaXRlIHNsb3RzLiBUaGlzIGxlYXZlcyBzeW5j
aW5nIHRvIHVzZXIgc3BhY2UgcmF0aGVyIHRoYW4NCj4gdGhlIEtNRCBibGluZGx5IGVuZm9yY2lu
ZyB3cml0ZSBzZW1hbnRpY3Mgb24gZXZlcnkgZXh0ZXJuYWwgQk8uDQo+IA0KDQpSZXZpZXdlZC1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gRml4
ZXM6IGRkMDhlYmY2YzM1MiAoImRybS94ZTogSW50cm9kdWNlIGEgbmV3IERSTSBkcml2ZXIgZm9y
IEludGVsIEdQVXMiKQ0KPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBp
bnRlbC5jb20+DQo+IENjOiBLZW5uZXRoIEdyYXVua2UgPGtlbm5ldGgudy5ncmF1bmtlQGludGVs
LmNvbT4NCj4gQ2M6IFBhdWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0KPiBS
ZXBvcnRlZC1ieTogU2ltb25hIFZldHRlciA8c2ltb25hLnZldHRlckBmZndsbC5jaD4NCj4gQ2xv
c2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vl
cy8yNjczDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMgfCAxMiArKysr
LS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMNCj4gaW5kZXggN2IzODQ4NTgxN2RjLi5mMjNhYzFl
MmVkODggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0KPiBAQCAtNDEsMTEgKzQxLDYgQEANCj4g
ICAqIHVzZXIga25vd3MgYW4gZXhlYyB3cml0ZXMgdG8gYSBCTyBhbmQgcmVhZHMgZnJvbSB0aGUg
Qk8gaW4gdGhlIG5leHQgZXhlYywgaXQNCj4gICAqIGlzIHRoZSB1c2VyJ3MgcmVzcG9uc2liaWxp
dHkgdG8gcGFzcyBpbiAvIG91dCBmZW5jZSBiZXR3ZWVuIHRoZSB0d28gZXhlY3MpLg0KPiAgICoN
Cj4gLSAqIEltcGxpY2l0IGRlcGVuZGVuY2llcyBmb3IgZXh0ZXJuYWwgQk9zIGFyZSBoYW5kbGVk
IGJ5IHVzaW5nIHRoZSBkbWEtYnVmDQo+IC0gKiBpbXBsaWNpdCBkZXBlbmRlbmN5IHVBUEkgKFRP
RE86IGFkZCBsaW5rKS4gVG8gbWFrZSB0aGlzIHdvcmtzIGVhY2ggZXhlYyBtdXN0DQo+IC0gKiBp
bnN0YWxsIHRoZSBqb2IncyBmZW5jZSBpbnRvIHRoZSBETUFfUkVTVl9VU0FHRV9XUklURSBzbG90
IG9mIGV2ZXJ5IGV4dGVybmFsDQo+IC0gKiBCTyBtYXBwZWQgaW4gdGhlIFZNLg0KPiAtICoNCj4g
ICAqIFdlIGRvIG5vdCBhbGxvdyBhIHVzZXIgdG8gdHJpZ2dlciBhIGJpbmQgYXQgZXhlYyB0aW1l
IHJhdGhlciB3ZSBoYXZlIGEgVk0NCj4gICAqIGJpbmQgSU9DVEwgd2hpY2ggdXNlcyB0aGUgc2Ft
ZSBpbiAvIG91dCBmZW5jZSBpbnRlcmZhY2UgYXMgZXhlYy4gSW4gdGhhdA0KPiAgICogc2Vuc2Us
IGEgVk0gYmluZCBpcyBiYXNpY2FsbHkgdGhlIHNhbWUgb3BlcmF0aW9uIGFzIGFuIGV4ZWMgZnJv
bSB0aGUgdXNlcg0KPiBAQCAtNTksOCArNTQsOCBAQA0KPiAgICogYmVoaW5kIGFueSBwZW5kaW5n
IGtlcm5lbCBvcGVyYXRpb25zIG9uIGFueSBleHRlcm5hbCBCT3MgaW4gVk0gb3IgYW55IEJPcw0K
PiAgICogcHJpdmF0ZSB0byB0aGUgVk0uIFRoaXMgaXMgYWNjb21wbGlzaGVkIGJ5IHRoZSByZWJp
bmRzIHdhaXRpbmcgb24gQk9zDQo+ICAgKiBETUFfUkVTVl9VU0FHRV9LRVJORUwgc2xvdCAoa2Vy
bmVsIG9wcykgYW5kIGtlcm5lbCBvcHMgd2FpdGluZyBvbiBhbGwgQk9zDQo+IC0gKiBzbG90cyAo
aW5mbGlnaHQgZXhlY3MgYXJlIGluIHRoZSBETUFfUkVTVl9VU0FHRV9CT09LSU5HIGZvciBwcml2
YXRlIEJPcyBhbmQNCj4gLSAqIGluIERNQV9SRVNWX1VTQUdFX1dSSVRFIGZvciBleHRlcm5hbCBC
T3MpLg0KPiArICogc2xvdHMgKGluZmxpZ2h0IGV4ZWNzIGFyZSBpbiB0aGUgRE1BX1JFU1ZfVVNB
R0VfQk9PS0tFRVAgZm9yIHByaXZhdGUgQk9zIGFuZA0KPiArICogZm9yIGV4dGVybmFsIEJPcyku
DQo+ICAgKg0KPiAgICogUmViaW5kcyAvIGRtYS1yZXN2IHVzYWdlIGFwcGxpZXMgdG8gbm9uLWNv
bXB1dGUgbW9kZSBWTXMgb25seSBhcyBmb3IgY29tcHV0ZQ0KPiAgICogbW9kZSBWTXMgd2UgdXNl
IHByZWVtcHQgZmVuY2VzIGFuZCBhIHJlYmluZCB3b3JrZXIgKFRPRE86IGFkZCBsaW5rKS4NCj4g
QEAgLTMwNCw3ICsyOTksOCBAQCBpbnQgeGVfZXhlY19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+ICAJeGVfc2NoZWRfam9i
X2FybShqb2IpOw0KPiAgCWlmICgheGVfdm1faW5fbHJfbW9kZSh2bSkpDQo+ICAJCWRybV9ncHV2
bV9yZXN2X2FkZF9mZW5jZSgmdm0tPmdwdXZtLCBleGVjLCAmam9iLT5kcm0uc19mZW5jZS0+Zmlu
aXNoZWQsDQo+IC0JCQkJCSBETUFfUkVTVl9VU0FHRV9CT09LS0VFUCwgRE1BX1JFU1ZfVVNBR0Vf
V1JJVEUpOw0KPiArCQkJCQkgRE1BX1JFU1ZfVVNBR0VfQk9PS0tFRVAsDQo+ICsJCQkJCSBETUFf
UkVTVl9VU0FHRV9CT09LS0VFUCk7DQo+ICANCj4gIAlmb3IgKGkgPSAwOyBpIDwgbnVtX3N5bmNz
OyBpKyspIHsNCj4gIAkJeGVfc3luY19lbnRyeV9zaWduYWwoJnN5bmNzW2ldLCAmam9iLT5kcm0u
c19mZW5jZS0+ZmluaXNoZWQpOw0KDQo=
