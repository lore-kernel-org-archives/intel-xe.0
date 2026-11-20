Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA98606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nuhXiJzJ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Yq+wrpY0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C6310E2A0;
	Fri, 20 Nov 2026 07:50:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8006410E2A0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795161046; x=1826697046;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LwG/G1xIJ8gmc66jIQfrqKuwI09jTC9LjM3VQGMljrQ=;
 b=nuhXiJzJEc0vjvCIedIt3aidK3oxUHaTKYnA18+F6a0OeDIWPKExdDw+
 9afNPht1IqoVgjaY3rkoQ+5yUKyILFMbQEFHsTM6P5V5ni2wYIyfb6sfA
 u+tEHLhO5gfOvMhEDhWI/74Zyh1GtnrXIvF8wkr6HBFqHIZaPpIDqVefA
 g0lcpssX82ThDr4ZQOyOCWcN4m9PLQ71jj5hAaWJQiFcyBrtaLrGJ2UsB
 uuaspYekTwwm9eDP8vB/39SfS9AW9rWVx2jjPoa98MchxDW3IUIUcYP5Z
 p9PnZ20LInDscBlO7BCk55dP1094TzhtRKvVqOZPgX4rZhdoQo0UO/eFy A==;
X-CSE-ConnectionGUID: gro0y5m4RnSERqqPySiOuA==
X-CSE-MsgGUID: 37NdjZN5TfGyxMJJ6qWEjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4042435"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4042435"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:50:45 -0800
X-CSE-ConnectionGUID: RciiZ2eIRROzvIr0BXtRnA==
X-CSE-MsgGUID: n6B7TLttSZC8SYgyjafH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10529604"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:50:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:50:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:50:44 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:50:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGLfUs30pacJuUmZjv5GzXZUOHp2SPoXBWgqgzQl7GQkiER9FKJNnyoY2X2pFdgK6E1D/Xrg1QMzVkiRrdmwdp2HKwLHMWagr1eDASMcpB6enwcEcVLcB1fZj0LOGBoALFqAZcf95zdrzo6sBoGsa3c3t/Vo8EN8fpfpEgmDSYXU3AMD6zqGLEbP9gMOeXx9t+eu29dtPTJWVttElYbzwjL6dGrvdpYGnyl9iEW/vmRxCjdQ8+xQXwqbhpAtvc4sPURjjhWK+H3FaENvlHuwgzRbqCGC+3o126DRqdUH7vygjZg4lYN01i92FCh/wOUlrJ4+FYWAoVbzD5d1JUkV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCoFYneefzsr90azJtR6wwM44CO3Kb03yf7/uPv71bo=;
 b=NXZ3SjuS0ShGwveQP3C6OWnWaTG6o5HfJ+n+gna8cnbI6/sNlFes4uIvSJ1NzykOczWPAUORUl/FKvCiaXYy+OJ8mKNyEMrw9JHOFc1FDDq0i1x3g8BEwnRcwtUbzDTuiN7uAtyrKOBevhE7vre4mWFUTith+6GbP7Z1XM3pI6JVVJgOpqsVlsxGJCHaWarmevUyukZdumTTEFveRKY7Ofi7uCw0ydDnHBy4qSenXE5TxegrFaGxVdBxs5HeOJ350AWePwWFjMG2v018PzyR19A8C7bQdfsgGzJOZsBzdGafg3Pb852A8FT4by6wx0d69QS9NEVQpvI9rWFlHdb61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCoFYneefzsr90azJtR6wwM44CO3Kb03yf7/uPv71bo=;
 b=Yq+wrpY07GtMfHXUc5oMsYq+n/txWf7X7+thXsL4CfZRLzM/YIG/aIxTQNPcFtDo4peteDue8gijziWpuBmPX/uqLoiA3ris3TMv1+oibLpGUkYhjDs6Y6vd99jqBJnTp04LY3Swltmcupmj6NPq1ySXbc86x31n5fx0kWfNJeU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:50:37 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 07:50:37 +0000
Message-ID: <f530bf9a-7427-4b97-a30c-8924c4e448e8@intel.com>
Date: Fri, 20 Nov 2026 13:20:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog
 where supported
To: <tilak.tirumalesh.tangudu@intel.com>, <piotr.piorkowski@intel.com>,
 <jesus.narvaez@intel.com>, <daniele.ceraolospurio@intel.com>,
 <stuart.summers@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-4-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261113155734.4164230-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::17) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 932094aa-8023-4d33-1a57-08df46daf711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|260925021911599003|11063799006|260925022911599003|260925021311599003|261009223027099003|261021123027099003|10067099003|261021121427099003|261102123227099003|261022105027099003|56012099006|261028144727099003|261022075727099003|261022113327099003|261026140227099003|261026121527099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: B3tiFpkZKOA+hhhoKWRkEwu3/5ZhL8MhT5ZZAoIel+HWp9/fyGYr4uJxht6v2z/2dPjsmINZU4q3Tq+KrZ6z58asA57iZKaey6Q/Zx1JpUcU4Xn1cpywpi6BmJ5cD6m4F3cLOdT9Yv4Xf8tkWtges624mA9RA3+vbEQKwJrQ/gHfSiBSnwAAAI8DLEohTbjpxQk4tFPtBPoozbY2qEFDfXj2zBb0rY0i7W23IOVeOskZQyyu3raDSSnpIiu83AeSgmUa8Mwnj/Zn7gRji5JF5DFs1AlFBkiRXQ5SeXyPsM1tQV309Cqvzjcfhj1YK6j9CLGIpXUMn1vDygJmjJ+jWGQbHkLRqZzFM7r1Yy0DQjceYeaVMGbzTmoh/162LlccuOZJmBZLtz3Y7WDGKdB/HAZSd7uTcpOjiFxQZs9NxTqzeqPeN1QE6TL04ogmeHsuNe4NKRiIEYycSOvALUOgSXfITc7IwMJUnJebuwknCOzSqEhWxjD+TvmEGrz6hIsEZ6yojWDMV0bPs8jCzoPMkLwgl085pxBvSrEdmzOZNbUB3xwYSL72+hRTBS+uVERcp+2D0OqXEtI0thcgGv4y2cbZAdgPiC4z48pP6K/ws4n7XcWtvEb1LQD2omPYWp4S94Vyo2oLMFn3yBn80+Q8Xd/7hqlnTnJa2PoCl5XuGCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(260925021911599003)(11063799006)(260925022911599003)(260925021311599003)(261009223027099003)(261021123027099003)(10067099003)(261021121427099003)(261102123227099003)(261022105027099003)(56012099006)(261028144727099003)(261022075727099003)(261022113327099003)(261026140227099003)(261026121527099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VitKSmRHV1pJWkF1dUVwSTFZb1BKYUt4a0tyMk4zcTdFVjNBalZpN1doRTdS?=
 =?utf-8?B?MDE1WFpobWdiMWtKSnRpZ2FpOGdMakdYZC9abitvZGgyYkZLczUwY2krY05q?=
 =?utf-8?B?KzRmd1d2bmk1UWFyV2N4clJWUWdIU1I5SUtJT01jTC9vSi83cVUwczVmOTRR?=
 =?utf-8?B?bFJwdW5aY2c1TkZNTkd2R0JJWmlPUE9YZ0RzNmhBUlVIYWs2V3N0ZFpEZEdi?=
 =?utf-8?B?b0svYnRNQ3RRS1pLRTNoOXRJc2NkWUYyUy9ROVdXVUdGTlc1UElNM00vck9K?=
 =?utf-8?B?YmdNZ040K0Q5b2ZXR2dJNlRaL3B0OFZjZVkrRllNLzNibEVuTHFzNGsrUnN4?=
 =?utf-8?B?RFBKYkhwNldVY0U2dkxpeGlyNzdNY2lTeUIxK0t4eW5DTlB1WUZnTCs2dDEx?=
 =?utf-8?B?cVpLMzVFakppMnJLWm10MGRBd1kycEwySmJubnJWY05YS3RnTHQ5d29KT0xj?=
 =?utf-8?B?ejB0ZGJidy9IRXc4Qkk0S1dDUVFhSHRvR3JWYUxsVDZ5eXJCRVpKYVljUk9Z?=
 =?utf-8?B?TVo2bnY3azBoTjBLd2hBYkpuN3R0eUxOdWs1OTBsSEpISW5WVVdOd3RLSGor?=
 =?utf-8?B?QkpvS20wM3l0b3pJRnArVnVKdDlacVRoZWt6ejhuc2xXdXFWMUZHTjdmVFVR?=
 =?utf-8?B?NDN5cjFjSDRNOUlIb2ZzbEFnb1ZkcmhOVlZRYUJFdXFTL0JuNktqamZRMnpp?=
 =?utf-8?B?Z0dMdmJUSW9qRC9sSEVjT3BqVEtZS1NNUTJCWVRyQ0RQeWF0K0N3RVZhYWdy?=
 =?utf-8?B?S2NnMHBCb3IrdkxpYS9KNWZSKzZlbjAwZ3hDSWhRczdCMk1xN3g4Rk5TL0xn?=
 =?utf-8?B?ei9FTEQyMWo0OVBmekhPbjVmWDhKRGhLR0pOUWNHTHIyUE0yVjBYL2JteEtO?=
 =?utf-8?B?THd4dTlyZEQyZFpWWWhvTE5ubFlFb3NWclYzNFZyUStWaTNnU3dXS1lVT3B0?=
 =?utf-8?B?Zkc4TG1uZGxhcnNxSzFxdTFtM2JBWE01MHVXWGRmcnluUG8xTStOajdVWXQ1?=
 =?utf-8?B?bFUzTDFDZ0dHVUtrSWx6MEpBQXcyRkhnUFFPeWk0cERYZHh1bTVxajhkYWJC?=
 =?utf-8?B?MFBWTGIyWFJTOE53MGlaRTBSZW0wQzhuYkFlQ2tIdm4rTG1IeEJxbk5HOGxl?=
 =?utf-8?B?aWFZN25NbUE0bmhXdVBFSUErSk9TNE1MM3I1cVl6K3ZFMURwK3k3Z2xaT3dG?=
 =?utf-8?B?UjVqT1JNMnJ1dDJwN1k0aVdtc3JvUGl1NjFneXJMQkdKWHg3UmxPT1FaRVJH?=
 =?utf-8?B?czZLck44SEk3azRWREM4c0FJS1ErYjBFd2gvcWY4S2syT1RtVVlvVXFxWU9z?=
 =?utf-8?B?ckF2NVJ6WC83aENNMHVwaFJqNEhlQlZmWFF5VHFRQ1RjSS9ySXA0NWdqblJE?=
 =?utf-8?B?R3FVYS9CMU9vRW8rMTRwNFF4REY1WUpqL2ludjF3ZVJ0dUxlRFIxcEFkM00w?=
 =?utf-8?B?NFNxRHdpTFAwc0NVTmUxcWptM3ZvNEZMTWtwM3g4QXB1T29CM29CUmtiSno4?=
 =?utf-8?B?aTMyV0JuSW9TWlJYbFE3NER3M2hSajRBL3dBRFV5VUs1TEdPY2RUa2t0dDZ2?=
 =?utf-8?B?R2p0c0Y0RXlOQ0hQbnRjT0VYR25lUEVWeExtb3ZMdzQ5UUhxSTg2ZVVGTnp5?=
 =?utf-8?B?clJuVzIrdUg3dlMwQWZCRnBubU0zMVJjYzMzUHJRYU4rOHFQdEliQ2tJUVhB?=
 =?utf-8?B?R1RkRnV1cCtzRXV0Vkt0aUpyMzNZOUs3ZFZOMGM0cVF4MVh5Znd3UUxYbjlR?=
 =?utf-8?B?cEV2cFRQdDFEdEpMZmkwMEc3Z2t0aWd5NnVPZlZSNkxoSTJqbkFFQjZSa3dD?=
 =?utf-8?B?cCs4WmowNlh2RFUwbllsZlVMRVJkbjdWSE5FeEoyckF4dVA5SXZuckVmTmsr?=
 =?utf-8?B?MStHSEwza0F5UzF3YVJsRDh1OWVqYk9MTTEyUE85NWpTOVU1K041N3I5SHRU?=
 =?utf-8?B?UU1EQjZ1WUVtTjZiOHNPZmNNL3V0U3JrWVRKTW1sdTNQQTlIMHlWcnhaZStD?=
 =?utf-8?B?cFI1b0RkTVM3NEVoWDlZWGM5Um9jQWFUd0liM3BKK2g2U1FSblpzdTBTV1V3?=
 =?utf-8?B?YU56cDR4MStaSzZ0VkUvd1FIYi9pTVBBL0JXV1lDa2xydzZxdGpoQlRMck1s?=
 =?utf-8?B?OFV2bXQwTUU3YWUreXU5TkxnSytiRloxLzBOZTJDTXRVZkd4Qnd3N0phalRV?=
 =?utf-8?B?MFRCQjNYTDJmSFRqckhhTW01bDdUYk4vUW45MDhXNmhmL2J4cVNrL3pqMU5y?=
 =?utf-8?B?eHdDTytiWGtBUmF4Ums0R3RSdTNscmxvbkNyc1lmMm1ha2RWUm1iUU5hT0Vz?=
 =?utf-8?B?YlU2Vy9KdDBObmhmN1l6LzRDU1NPZWYrK1hqMnNPdUdEaHNYUG5kYVhQTWpt?=
 =?utf-8?Q?TXauwOoGedbaoxWM=3D?=
X-Exchange-RoutingPolicyChecked: cbfZU+A6J1WiHGDHDoHkHZGe7TXhqtpAuBU2TG0fLMEqTZLnz5qd2eXmqUuTPwjibpCI7wQbL0gjvosG2BmA2Al4YxsExpSGurue3O3TpWkwY4xEbGUDWp99lWwGOZZYqPx+kL0f5ZkF+ogzjWwvPBlSKpwkeZ2pmKq8zy+NQ4UxNJc9zt9F/XC2ToJ89S3a/PcSOtfxnTleCK/YwGIVDpJvHMWa/mHfmQZHvewRZSoGmIVCe4k3V0Un9qB+eXYaxyNMU9dRPAfJfxYq4bQsr5exhKoyOhp//+Ef5dKB4D3ULzDUT2Bd6K6gCeQke9mDvodVWcTlV9RGtWTazl3oxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 932094aa-8023-4d33-1a57-08df46daf711
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:50:37.5257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8g32B0DyhkcB/xq4zvCBbXJciTPVbhDjGb/hx1fqnl4wVtfjWAp6oos6umKzAmWl0JGAp3yv/QJk4+vIS9RK83sZ6KWXwKPpbR0+tovy1iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 13-Nov-26 9:27 PM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Use the MI_SEMAPHORE_WAIT_64 instruction in emit_fake_watchdog() on
> platforms whose GT supports it, per gt->info.has_sem64 (Wa_16029281913).
> Platforms without support keep using the existing 32-bit
> MI_SEMAPHORE_WAIT path.
>
> Assisted-by: LLM
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ring_ops.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index ad63181938e3..fbff2973a204 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -316,11 +316,25 @@ static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
>   	dw[i++] = PR_CTR_CTRL(0).addr;
>   	dw[i++] = CTR_LOGIC_OP(START);
>   
> -	dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
> -	dw[i++] = 0xdead; /* this should never be seen */
> -	dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> -	dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
> -	dw[i++] = 0; /* unused token */
> +	/* Wa_16029281913: legacy semaphore has an issue on some Xe3p platforms, prefer sem64 */

No need to mention this WA. As per below condition, if has_sem64 is 
enabled, sem64 will be used.

If we need to use this only for this WA, we may need to derive this in 
some different way.

> +	if (lrc->gt->info.has_sem64) {
> +		dw[i++] = MI_SEMAPHORE_WAIT_64 | MI_SEMW_GGTT | MI_SEMW64_32B_COMPARE |
> +			  MI_SEMW64_INHIBIT_CTX_SWITCH | MI_SEMW64_INTERRUPT |
> +			  MI_SEMW_COMPARE(SAD_EQ_SDD);
> +		dw[i++] = 0xdead; /* this should never be seen */
> +		dw[i++] = 0;
Mention why is it zero here.
> +		dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +		dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
> +		dw[i++] = 0; /* token, must be 0 */
> +		dw[i++] = 0;
> +	} else {
> +		dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT
> +			  | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
> +		dw[i++] = 0xdead; /* this should never be seen */
> +		dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +		dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
> +		dw[i++] = 0; /* unused token */
> +	}
>   
>   	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_LRM_CS_MMIO;
>   	dw[i++] = PR_CTR_CTRL(0).addr;
