Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C48DCEFD1E
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 23:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E3810E0AA;
	Tue,  6 Jan 2026 23:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EE+cBUBV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7318610E0AA
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 23:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767741091; x=1799277091;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ox7A3Vkf+xIwDmS1Mbb6JrwSMIttkiRWjxYGmtukEkE=;
 b=EE+cBUBVTtPBnlJECjgtEniuo8Tw7rvFiC+BP36phfoMFcSP5zm/7uIH
 ezyL9E28EIGUoJrTztelg8HnexNgduyznji53O+mjttj/gpwuMNwwRhCU
 T9fcxrNJwWajI34mMGNcgNTcktcGNNEA1tgdvKewdUufdcZ/b6dOTz2wn
 CIGen12znUs7hkqO5yD6HeYePQrIvEnP3DkFqfinFQtgI61fIJD4AgntC
 A6Eroe+LcneWiavhm7SreLmUjiyUe+dX8GhAC+5eAx/M+WZcBCrsWlS0u
 KMM/ibHSPo2T7bTrvGcFgBv7JXZY82ejGxhCPD6GkPpHAIABR8s95LD2U A==;
X-CSE-ConnectionGUID: RpgMveWeRXq0rF3kh9qRMg==
X-CSE-MsgGUID: wEjiY6WBQ4CpJr0KAo6d6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94577257"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="94577257"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 15:11:30 -0800
X-CSE-ConnectionGUID: PfuaZ07sQW2yJkm7e26fWA==
X-CSE-MsgGUID: mRkiVy27QmOhVa+D/bxoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="207319733"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 15:11:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 15:11:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 15:11:30 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 15:11:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mti0M875k8b5jehY7om0JQQtzvi6OoIuSmVFiQoB4cUd4zJF2OYQqNeqpqxb3N95RRVsmleW4eyfI7JstxK/dXQ79aVRQ+Pw8QttQobHb/GpF4jy49ScyvDyDr03TBnybmPJWYHcMNpkfOVfXqV6+FyDrNql9thoLpnbrlcis5vArKlerISNIhcge8leyMQEWrvZ+UFqxjMIvjl/mKaJwJI57h71YsPQ9q9HBPcdSC2dG2dili8YntcU19U3+qAr23pSde1Hn1uC+8yw8qafCpAicJRW5y33Eplgft4Bt/Ju9hWriPz4PgWRqjJgO7Rs2QbJAcHtMFd86ZWPdctfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ox7A3Vkf+xIwDmS1Mbb6JrwSMIttkiRWjxYGmtukEkE=;
 b=UgyNDXAT7RyMNDrGYlNNhYeQGwyM8xLIPo+JBOXZTjs5znS9f3B3ohCoOprtSeqTDZP209rV8P8205TOV8X0Q0fNL3QWERQotDvYkjOhuQ+7b0v7Dmp8FgOZqf1LRXWFaz6KYg4hAN35LGf2AtDVLrqbMay1Z1uAgaMyy75BZ0tDbooJxnQ2QURq5NpYKpz6upALzLapGB8jXHPDyV/RGrwqOanZ9Ju+bZAyqXYirnc0FVS5SCEOOapy7Z6L8I+Lf1M5QTGg7L4N/x9qrqAAM4ZwtR/HI6DASiqTUjRqhzgl+98IROmpyxDS7ZF6roCCi+0cP5VvMfoaEjxMLm85DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 23:11:27 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 23:11:27 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Thread-Topic: [PATCH v3] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Thread-Index: AQHcf07Wj84xdLdnPka6tNxok99P1LVFxEWAgAAArIA=
Date: Tue, 6 Jan 2026 23:11:27 +0000
Message-ID: <9e8fd19f0297426bde379e01a8a9ad3f109de12d.camel@intel.com>
References: <20260106205533.60180-2-jonathan.cavitt@intel.com>
 <aV2WDZ0uaMW6TYmE@lstrano-desk.jf.intel.com>
In-Reply-To: <aV2WDZ0uaMW6TYmE@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BN9PR11MB5308:EE_
x-ms-office365-filtering-correlation-id: d47444f1-9c8c-405d-ff8d-08de4d78eb7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RDB4UlMzNkN1bm0xb0RpaVZFc0d5Y1VLeStsSWVuRHY4WHJZSkZjVlV5MzBS?=
 =?utf-8?B?MUZJZThCeHd5ZHpvc2tKQW44RFdxUm9YMjMvbXZEWmQzZ3Iya21iMysxcktC?=
 =?utf-8?B?bE8zc2JGRWZ2bDJ2MHJzYWk5bjVxa3E2UVlTazVkcmxqVVRWb0FvUm1sWTlC?=
 =?utf-8?B?Vmsvc0RWTVN0aSsyVVNkOGoyeTZJNUREUzQzTUswS3pST0Q1MDBqeGUyQUJx?=
 =?utf-8?B?bitqNnNGRUhUdE81NmJWV3R2NjFRUDJmV1JsYnJ1bkVkeEhRWWprMDBHR1VB?=
 =?utf-8?B?dUxSVEZsdWpGclJuQlBRV3IwdlBhOGFLUkkyVHlYNTFvc2ZzelUybFRPRGhC?=
 =?utf-8?B?VUZEQTExZnhCTHNmOGs2T2lOVTZXR0Y1ZTdteHlwb245aTB6Ry9xVG9RUWZH?=
 =?utf-8?B?clVhSFcyc3I4WENFMUhGQnl5cm8wa1ZhbFdkamhPS1krMkZ1cDNYWVVsNUpI?=
 =?utf-8?B?S1hycjByUUxabWREcUNkZ2dxWDVuUE1OTm41NjJQSmRzOVBWS00rZDcxaXNV?=
 =?utf-8?B?SmJlcXpqYUszY0JNZXQwQ2xRaFFBRzBCanhGRklCeml0cmNmd0UzbmxZZ3ox?=
 =?utf-8?B?bjh0TlZXSXJ0QVdpczJWc0t6OGQrV2ZqOXpnWkFBeUgxbG1lOXVPMTVxY2ZT?=
 =?utf-8?B?YXpLQ3ZMMHhkd3IzQkNhdkdnZmxKVzJjdWlIQVVsR09oTWlDbHFzSHRDUFZY?=
 =?utf-8?B?eGtCbnpqZUNLZUVHYzFPTTk0TlhHczlTclp0YU4xRklncS8yUlB2U1J6NTFF?=
 =?utf-8?B?UU5JNWZwRjZldXUyM0VlL1ZLaXN2VHpzcjlKTDJJVXpOdGVORU9MZHdvd0dB?=
 =?utf-8?B?MTZoTXJnVlltNmY3TjB2dTVKQkRPSUJpZHFzRUpCRmViY0lnaW9tNXdsV3JY?=
 =?utf-8?B?ZXJ4K2RLZWVNMjByck8rQXFQQ2htblJ3Myt4TGM3cStObVIxV3RNS3dhYVli?=
 =?utf-8?B?VGxXTmVDWmpLSW1LSmdXR3BOVm0xaWtpWDRNQlV5bTBoblFabVZTUVRSbGRT?=
 =?utf-8?B?SWdROWFrWHJoalUrbUY4dkN6U1h3d1RJWkJzdVVnQTF2eUlOdkxRRWI5d2ty?=
 =?utf-8?B?K25hUTRTRmVqNUpTejIzYTNicDBycjhVUVBDbWVWVGcwSkZtUllmZ0d1VzNh?=
 =?utf-8?B?ZFduU3JLSk5FaFJpVDJHSzliNmlHMTZRbHNuY0VwZzlxZFYwai9rbkdEL1VJ?=
 =?utf-8?B?dzVqakpabVJFR040Vis5TTNEUEx6SkdEbm13R0FXOTB5aDRiRVN1eUNzTTBD?=
 =?utf-8?B?TzFYYUtEdSs2cTM2c2RFZERBRFJ5Ylh0bUZvdUplaTJRd3VTci9NRkVSak9Z?=
 =?utf-8?B?NHFEZlk0TGlEUXkvTDVCZkNURmtOenpISkM4eG1LakQ2c1FCaGFtdzZoK1Vm?=
 =?utf-8?B?bi9UN3l2MUNRM1hjOGFQVERleWd1WGdOckNzY0cxUCt1N2Nnbi9jcWM0NzNk?=
 =?utf-8?B?UDBLZDRPbVgwWk1qcHJVOXBtajJWSmM1VjlxUFJqTVVtdDlpMW1GTWRNaGtY?=
 =?utf-8?B?R2d0YWJjejRwMWNUbzNybVhlOVZOUFUrcDUraDZMcEltUTBlWmNFbGswSXFs?=
 =?utf-8?B?b1AxMWdYN1kxMlJ2STdzK3JSWGdoQm56NXBXOUlMKzMzSFVZZWkxL0JyKzZ4?=
 =?utf-8?B?RzJhZmUyd0hMRDBBVHBROHk4cCt3UktYSFF0SkhZMzg2NU8rcUNqMXkvdFl5?=
 =?utf-8?B?VGcyUk5YQ0V5U2R5eWwrT0hLOG1iR1lXMTE1UHJuNTNrdU01NDZiK3FRZHBE?=
 =?utf-8?B?dUprbWJtNFp3NGVORkoySUQ1cVI4NE83S2FZYXRwMXhkMHdIS0VMQzFXczVv?=
 =?utf-8?B?VXNhbEUxRFNqUmR5bFZPUGx2bWR3SzU0bVNPMzQxWWprSTFtNTJldUlVT3Y0?=
 =?utf-8?B?MFZmNE4xRmdmd2t1a0VzUjV3Wmo3alZJK1loRUdTdlhmc3ZNQjRtcFRYWkJY?=
 =?utf-8?B?K2YwanJhcDRTR3A2WTB2OXl5SzYzL3l3emJNbnV4eDljemt4RnFFcW9mWm1q?=
 =?utf-8?B?enVnZjZRMHFsZzNlMFdnZTdWOExnWTZqZFlGMU8xOEl5SjFUTTQyWWlpQ3JG?=
 =?utf-8?Q?0GSqp3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHU3Z3VBMWUxM21Oc1k4V200M3dIMit5T29tbVBVdWpaaERnOC9RVThLMW01?=
 =?utf-8?B?ZEhFa1RkUjhqSHAxYWpJVGdmUXErQzVrZTRWU3FCYUc1Zk5Ub0hkU1hlVXRz?=
 =?utf-8?B?TzRqYkNkTmlhcTR5ckhRSlpRd3NabVEyeUl5eU11THczRDlscUd0RG5pclpo?=
 =?utf-8?B?WGF3L1RiWkFkNGdXMWtUSlgwTzltUmxWYmE0L1E0S0dlUTZDUEJOT2pPQWVB?=
 =?utf-8?B?ZFgrU2NsZWp3V3FvVFJHdnlVZ01jYjNKZjhXZkJsR0wySlhGTHBjbS81Wjk1?=
 =?utf-8?B?U3pPRzVLeTVENFV1ODZYcUtTTlo1M1NxRXc0eDZaS2VhVmo3VVQ4RitONk92?=
 =?utf-8?B?ZDYxMmQ4ZkxDSXRJUGVOR0JMdVlnVEdxTUxqYkZzZ0g0V3g4d3N1WUJROWk4?=
 =?utf-8?B?b2RvdlpLSlRHSCtVRDlzUGo3Ni9MQkJwYlpHOTFYdll3eVg0bTdWSEtMU2Vr?=
 =?utf-8?B?OTRWR2lHV0dGbysrTDRaeHBLZjRQL2hZZjh2UUtTL2h1aFFTR0Y1K08rTXRR?=
 =?utf-8?B?VzNtd0oyZjhBTmRFdVVudWsxTml5MGYvck8yZ1ZIV2NMeElhZkpjV2oyVzhq?=
 =?utf-8?B?WUJGaFZaenB1ZWJEdXprUnlhNHE0cWtPWlVKZytUMHQzbi8yVUNLV1dzY0Vy?=
 =?utf-8?B?UFFZOGVsUzN6RzRSOGhzb3NRN2NFd2NZbFhLVkRjSjkzNjI2b2paeFd4L3gw?=
 =?utf-8?B?Z28zUldWSFdjOFZlLzhHaVRsUEwvNEZoWW9WbjlxRnB4dmt4NG9laDZpb1lZ?=
 =?utf-8?B?V0JkUDZPTU56N1hpaWEyNTRLUmR0SFVacWQxQTRFZGkyeEFDcnZ3c3FFdmVL?=
 =?utf-8?B?ZGdTT29FVXF0eVBSTVRJZFB4SGE3a0VUT0RvbVlodmhQR1puS3pvSEw5Ni9z?=
 =?utf-8?B?R2kwQlkrRXQ3bFJpaWJibnNOMlkxS2w1U0NKcE9KdjQreFJmVld4bWw3RkdM?=
 =?utf-8?B?WnRzY0lXeXMrdUdvdFNEYnB3YjNFbXZrVWRzTXJkZHR1anI4eEZnUkJ3bzNR?=
 =?utf-8?B?anJoeGpFQk55RW5xV1RSeTA0dXNJZnVGSklSdFpUSGdXM1cxOHdBWG5oSzdZ?=
 =?utf-8?B?NzRtcFZ0L1RLR3JvbVpGR2V0MENmbTNGMi9ySWVyalFtVmk4dU5SUnp4YTZI?=
 =?utf-8?B?TGVsUDlVb1VTNnNFVmwwSWU4aE5pdHUwWEpoYmJjblg4KzJsNTgzaDJ0TW8v?=
 =?utf-8?B?ZTRGcDNkR0RTL3Rncy9VZytYN2VYUDRqcjd1M0hJR1dzelFYMzcrR0l4ekJq?=
 =?utf-8?B?bWcxREpWalFXY1doSmc5WnZHSitqb1kyYkN4L2lPYXduMGIyL1ZiWEh4cnRH?=
 =?utf-8?B?dmJMcnFZd0ZEWnZmbUlsaXhOUGVKa3VHb1p1SVNKSGcrODZxbG9ieW14dytM?=
 =?utf-8?B?RHlvcitJVERtdDJWTEV4d2NYaFV0cGtCVzhjb1B3VTJZWjZXVHNSQ1YzNVRr?=
 =?utf-8?B?cWs5UFNzTWs4UWoyU3M3dXo4Mk8zTWxtV3AwcVNZanRlWUdiQ0xJbkxQa1dz?=
 =?utf-8?B?SHlGRHhDQ3h4RkhHd1pkK2pCQnc3MWFtNUxDNE4rbEZlZGNxWW5qdXJNZG10?=
 =?utf-8?B?cWI2VjdyekVpcTJZOEUxNEk5dk1GRXZUNS9ja0kyUWZWWFpQL0FuZWx4VmJJ?=
 =?utf-8?B?eXZReWtzZ3hlcE1XUHpQUjU4NEFHVnpwd0tQb2lrUXBBMHgvU3EyVEZKcVQw?=
 =?utf-8?B?ejMwSTYwRXM1a0Z1aVlKQlEzTGsyQjZSaHkwYTROaVJ1Mnd6d1lGR0hsYi93?=
 =?utf-8?B?Zkh5U0tEeWY4THBKaThHeUtSUkN5bmhCUlhwSkkyUi9RQ0JmbXFtaGFPcmh3?=
 =?utf-8?B?S0FTN1dtZGc4a2R2eTRLbC8weDlib1daVS9hSHZWbUpSRDk2eTB2OFgrdUgy?=
 =?utf-8?B?SjQ1cHNLelRmYXljMXVDWllPK01MVittcU5kaS9Sa3FKa3lxZFN1ZmZ4WlFU?=
 =?utf-8?B?eVlXc3htUE1EVm5qSDBvRnVFYVFpMG9zSGRKSGZFSUY1bERjUG03UmxCdHF6?=
 =?utf-8?B?ZVVLMVIrM0tYQ08zQXV4T0hORDI1Z3hoUm9obmtmekZTMGI4akZBa01mak9R?=
 =?utf-8?B?V3JtV0lob292WHViUnlMd1YyT3A3VmZ3UWxPaGt5Y2prc0RiaytNN0YzOW1Y?=
 =?utf-8?B?a2F2UGNhY3lKQmk3azRMQUhzZjk0NFh0VTErUnhFV2tsZVV5a210NGVZa2Z6?=
 =?utf-8?B?b3QvakRBRkFOczQyT0tTSTh0UzYwa2F0UkxZa0pTVUVYdGtFdmVkUVFlTFJ5?=
 =?utf-8?B?bVBrVTJWWUduK1N0eWVBYnNkbG1ySzNGdEJCTWRLQzhFck1HdS9aYVh2NnJS?=
 =?utf-8?B?MVNYbDdOdTAzTENnUWF1WklFMThIVnl5Y2ROVXRjS0g2NWRqWm1TVnQ0blZr?=
 =?utf-8?Q?oDryWj49DzvtM9i8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A427DC42F07154A9298EFD3FACF903D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47444f1-9c8c-405d-ff8d-08de4d78eb7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 23:11:27.5168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvrIziUNPi+oy5CFZGvj+8psxlh/Agz5GT2m5pOgEs3eZXSctP7lDC4rkCZAlzRpyoAn6jkgTElLLVQKIGL+uQ5lxROOK/d5NVxvMZxftfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
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

T24gVHVlLCAyMDI2LTAxLTA2IGF0IDE1OjA5IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUdWUsIEphbiAwNiwgMjAyNiBhdCAwODo1NTozNFBNICswMDAwLCBKb25hdGhhbiBDYXZp
dHQgd3JvdGU6DQo+ID4gSXQncyBwb3NzaWJsZSBpZiB1bmxpa2VseSB0aGF0IHRoZSBHdUMgY291
bGQgYmUgcmVzZXQgaW4gdGhlIHRpbWUNCj4gPiBiZXR3ZWVuIHBlcmZvcm1pbmcgYSBndWNfY3Rf
c2VuZCBhbmQgdGhlIEcySCBmZW5jZSBjb21wbGV0aW5nIGluDQo+ID4gZ3VjX2N0X3NlbmRfcmVj
di7CoCBFeGl0IGVhcmx5IGlmIHRoaXMgaXMgb2NjdXJzLg0KPiA+IA0KPiA+IHYyOiBSZWJhc2UN
Cj4gPiANCj4gPiB2MzogZ290byByZXRyeV9zYW1lX2ZlbmNlIGlmIGN0IGlzIG5vdCBhbGl2ZSAo
U3R1YXJ0KQ0KPiA+IA0KPiA+IFN1Z2dlc3RlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5z
dW1tZXJzQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpv
bmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX2N0LmMgfCAxNCArKysrKysrKystLS0tLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2N0LmMNCj4gPiBpbmRleCBkZmJmNzYwMzdiMDQuLjBiZGNiZTY1MDNhNyAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gPiBAQCAtMTIzOCw2ICsxMjM4LDEwIEBAIGlu
dCB4ZV9ndWNfY3Rfc2VuZF9nMmhfaGFuZGxlcihzdHJ1Y3QNCj4gPiB4ZV9ndWNfY3QgKmN0LCBj
b25zdCB1MzIgKmFjdGlvbiwgdTMyIGxlbikNCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJl
dDsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+ICsjZGVmaW5lIGN0X2FsaXZlKGN0KcKgwqDCoCBcDQo+
ID4gK8KgwqDCoMKgwqDCoMKgKHhlX2d1Y19jdF9lbmFibGVkKGN0KSAmJiAhY3QtPmN0YnMuaDJn
LmluZm8uYnJva2VuICYmIFwNCj4gPiArwqDCoMKgwqDCoMKgwqAgIWN0LT5jdGJzLmcyaC5pbmZv
LmJyb2tlbikNCj4gPiArDQo+ID4gwqAvKg0KPiA+IMKgICogQ2hlY2sgaWYgYSBHVCByZXNldCBp
cyBpbiBwcm9ncmVzcyBvciB3aWxsIG9jY3VyIGFuZCBpZiBHVA0KPiA+IHJlc2V0IGJyb3VnaHQg
dGhlDQo+ID4gwqAgKiBDVCBiYWNrIHVwLiBSYW5kb21seSBwaWNraW5nIDUgc2Vjb25kcyBmb3Ig
YW4gdXBwZXIgbGltaXQgdG8gZG8NCj4gPiBhIEdUIGEgcmVzZXQuDQo+ID4gQEAgLTEyNDcsMTIg
KzEyNTEsOCBAQCBzdGF0aWMgYm9vbCByZXRyeV9mYWlsdXJlKHN0cnVjdCB4ZV9ndWNfY3QNCj4g
PiAqY3QsIGludCByZXQpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghKHJldCA9PSAtRURFQURM
SyB8fCByZXQgPT0gLUVQSVBFIHx8IHJldCA9PSAtRU5PREVWKSkNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsNCj4gPiDCoA0KPiA+IC0jZGVmaW5lIGN0
X2FsaXZlKGN0KcKgwqDCoFwNCj4gPiAtwqDCoMKgwqDCoMKgwqAoeGVfZ3VjX2N0X2VuYWJsZWQo
Y3QpICYmICFjdC0+Y3Ricy5oMmcuaW5mby5icm9rZW4gJiYgXA0KPiA+IC3CoMKgwqDCoMKgwqDC
oCAhY3QtPmN0YnMuZzJoLmluZm8uYnJva2VuKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXdh
aXRfZXZlbnRfaW50ZXJydXB0aWJsZV90aW1lb3V0KGN0LT53cSwgY3RfYWxpdmUoY3QpLA0KPiA+
IEhaICogNSkpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFs
c2U7DQo+ID4gLSN1bmRlZiBjdF9hbGl2ZQ0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiB0cnVlOw0KPiA+IMKgfQ0KPiA+IEBAIC0xMzA0LDcgKzEzMDQsMTEgQEAgc3RhdGljIGlu
dCBndWNfY3Rfc2VuZF9yZWN2KHN0cnVjdCB4ZV9ndWNfY3QNCj4gPiAqY3QsIGNvbnN0IHUzMiAq
YWN0aW9uLCB1MzIgbGVuLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBSRUFEX09OQ0VzIHBhaXJz
IHdpdGggV1JJVEVfT05DRXMgaW4gcGFyc2VfZzJoX3Jlc3BvbnNlDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoCAqIGFuZCBnMmhfZmVuY2VfY2FuY2VsLg0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4g
PiAtwqDCoMKgwqDCoMKgwqByZXQgPSB3YWl0X2V2ZW50X3RpbWVvdXQoY3QtPmcyaF9mZW5jZV93
cSwNCj4gPiBSRUFEX09OQ0UoZzJoX2ZlbmNlLmRvbmUpLCBIWik7DQo+ID4gK8KgwqDCoMKgwqDC
oMKgcmV0ID0gd2FpdF9ldmVudF90aW1lb3V0KGN0LT5nMmhfZmVuY2Vfd3EsICFjdF9hbGl2ZShj
dCkgfHwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgUkVBRF9PTkNFKGcyaF9mZW5jZS5kb25lKSwgSFopOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoGlmICghY3RfYWxpdmUoY3QpKQ0KPiANCj4gSSB0aGluayB5b3Ugb25seSB3
YW50IHRvIGRvIHRoaXMgaWYgbm9fZmFpbCBpcyBzZXQsIGJ1dCBhZ2FpbiB0aGF0IGlzDQo+IGRl
YWQgY29kZSBhbmQgbGlrZWx5IGRvZXNuJ3QgZXZlbiB3b3JrIGFzIGlzLiBJIGRvbid0IGhhbmRs
ZSB0aGUNCj4gZGV2aWNlDQo+IHdlZGdpbmcgbm9yIGRvZXMgdGhpcyBwYXRjaCwgc28gZWl0aGVy
IGNhc2UgY291bGQgbGl2ZSBsb2NrLg0KDQpTbyBpcyB0aGUgc3VnZ2VzdGlvbiB0byBqdXN0IGJh
aWwgb3V0IGlmIHdlJ3JlIGluIHJlc2V0IGhlcmU/IFdlIGNvdWxkDQphbHNvIHRlYXIgZXZlcnl0
aGluZyBkb3duIGxpa2Ugd2UgZG8gaW4gdGhlICFyZXQgY2FsbCBsYXRlci4gT3Igd2UNCmNvdWxk
IGFkZCBhIHJldHJ5IGNvdW50IGhlcmUgc28gd2UgYXQgbGVhc3QgYXJlbid0IHN0dWNrIGxvb3Bp
bmcgaGVyZQ0KZm9yZXZlci4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IE1hdHQNCj4gDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gcmV0cnlfc2FtZV9mZW5jZTsN
Cj4gPiArDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghcmV0KSB7DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBMTkxfRkxVU0hfV09SSygmY3QtPmcyaF93b3JrZXIpOw0KPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKFJFQURfT05DRShnMmhfZmVuY2Uu
ZG9uZSkpIHsNCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCg0K
