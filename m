Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3248BD74EDC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 15:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E137910EB0D;
	Fri, 23 Jan 2026 15:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMev4Ci3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DDF10EB0D
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769180834; x=1800716834;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GHhDdi25F6yD0GigjIzkPmTnh5oY7Gh4NUWLBpo5vrw=;
 b=CMev4Ci3Pf77DNo1ebfeBNsMEmkxz14WCShjbc8x6IS7fOGL6nwGaURO
 zbd2WFNrA7su/fg7GENOQWyk/Noqvmd5UxwNNHFJONNEuLPStYAOJNUqf
 28Jz27exXmkKSFiCkyF8hWHggaifTOo9oFnVAWS7JNXchr25ugRxYeIbW
 zIGOY2BkmHlQC0B6iHIWSBKYXiraFmEsWVVru0jkwLj09HItho3tZ1j3k
 7SlBOVL1/2CjcH4mLc9kSYuwnnUVThPObQPoylTRcvPfkQBHTm757R3PZ
 YlWzW6oL8fotprjUBP84kqIcb2H8i7j8Y9yXIaLMTLyJjX8BoYIzSj67I w==;
X-CSE-ConnectionGUID: z0V6GRBGTX+og/ypNy7EAw==
X-CSE-MsgGUID: 25ndShuiTy6fbPqx6C2khA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70154389"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70154389"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 07:07:13 -0800
X-CSE-ConnectionGUID: 6b0SZNJXSHqPH5xutag/Xw==
X-CSE-MsgGUID: zhQasJBnTDmYDf15O96sHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211914901"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 07:07:12 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 07:07:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 07:07:11 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 07:07:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxeOITugls037OixtexE4/kBfZaSJH/q8lpwGf1m/B+WWRI7hwzQNvAqwe6zoFylO3bHisGKWv6sClJdsnjOvc4q3E0NClO/1uZmrKZGo2n1ii3t21Hq4FqdfnHKXZ2Hs7nbq5dl5nVd97RABz3qiIsL8g+dhupz3w6kEUDoR4f7RD8exTgxU30R5+Onu82lEgmLBuSJzuUSpjjIZzA10Amd8otcVbfsNd+oO2AxrkpBKFS1ZjSkwzdJ7meM7VyRoxlm44LK6go1AAG8gWTp57QRPQCgM02BK5ig/MBF0L80rxieJsrT10+6KRD9Le62dFmw2dCsorokx5G25dxS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkWxr48v/J1+a8LbvsYCnEeaVnGSvEqeu5bJ8eftPko=;
 b=jpWgeW2N2Abne8cMM/w56pqlRALzbQgAts5TJ5EGAV9Kv62seEMmou/7mj2qBXnpvHD4FN2froaO6anxmdJfovzTP017/Sx9tG0cXv7Z1rjkVmS4c/ZksAUnkdQ/KmYcxU/8pLkSRggdgv00uGcGjU3eu1kmhTGa32h9JXX6y4Chk5YgE+kcZ6jbIcO+irTWx3Ksap/K8eX+cgmW4PxGabdiXd4YvWcJ/kNZULS1OW9AlRyQQ1AdznqCEnenqfOTDY6RgWJlDq0E6xI4wqdoX5n5fS/ukE8JOhc4FjYjm43eEOEpa7CqFaZRPcLpYk1TXvXfEWNlNNqTAFRbZoHETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:07:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 15:07:02 +0000
Message-ID: <1c0060d5-7ff2-4123-b1c3-f0d7fdeb0b8f@intel.com>
Date: Fri, 23 Jan 2026 16:06:58 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Reset_VF_GuC_state_on_fini?=
To: <intel-xe@lists.freedesktop.org>
References: <20260122151924.3726-1-michal.wajdeczko@intel.com>
 <176915093422.186555.4666512957786201448@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176915093422.186555.4666512957786201448@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0273.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::46) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: 640cbba8-6b65-4e0f-bc86-08de5a911032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVlNNnI4T1BDVVY3MFdlYkNhdE9EWGpKRmZRWGNMaXJVMU8rZU0xM28rUkts?=
 =?utf-8?B?TklIUWF3czVzdW5nekx2ODFoWWx2eTM3MXUrSWE2Q0dVOGFEQnR1TGE4R1BC?=
 =?utf-8?B?cXo4dTNYY1RDZEMwSHhSa3EvV3h0N0hXRVpkdnNZRktiV291cTVhTGJWT2w4?=
 =?utf-8?B?cTUwQVJueklvR3d0OW9lWlJ2QXhWc09EYXFhYjRCeHhjaFVOcXJTNUZTOERx?=
 =?utf-8?B?bFRFcDFHZzlWRTh5S2gwVnpET1hpT3NpT3paajErbHU2bzFBdGRJdE91d0hF?=
 =?utf-8?B?UUw4UzRzQTVzUzdNc1pYUktWYUlIbEdJVmRKeWZPNit5THFlN1owdit1dW8v?=
 =?utf-8?B?TS8vb2wrTUd3bml4VWRiRTM5VTBYTGgzNTdCc2VJQkZKWmw4RzY4Q0ZHa1dT?=
 =?utf-8?B?TWdGU0FuanpGa2M1U1pDMDJ2RGphT0F1VVNzM0J6TjNwNjFXcFFrREMvWWNa?=
 =?utf-8?B?VkVGc01RbnN3QmoyK204cXBWbUhuUUpxVElBZnZHMHVTTDIvK21LV0pBYkxH?=
 =?utf-8?B?cHNtZmkrQUNvakZ3R1JJdGNJYzVGZFFMQXE4TzlqVnBCUmh0RHBEWlYzcSty?=
 =?utf-8?B?dUNLQlRhVUYyWkM5WnJvTjFsU1V1YmZqQmNIVW5CbFFHdU43R1c2NDZVYUdD?=
 =?utf-8?B?eEF5WTdNOTg4T3ljdVZzS3RoTFJxekdjMlRwQUhzc0Q3YTdsaEZaVVhZa3pX?=
 =?utf-8?B?RVZYcWgzZGFoL3dIWnhsY3FkTEVrUHl2K3ZaUDZ0bVZsVDJXYzQwYTF4Ylps?=
 =?utf-8?B?OUp2QVNseWR3M3BFeWdUMGMwRXpPTVNzQVVTZ1cvNlJydlh4aUJWNFMwZDRE?=
 =?utf-8?B?bGdwakk1dVltc1N4ZFg2Smo3UXVZWG9wazhweWt2SkZ0ZXZpYXhlb3dVcWJL?=
 =?utf-8?B?amszMmZrMGozc3BnRG15NkpTR2JDYTRhM2hJL0s5akxkbzFIWmMzdHNsVFpK?=
 =?utf-8?B?RllXakJHcVI3OTlCSWlsR2ZjNXVGcVVnemI1SHFjek04TWRvdjdFbEY3NXVO?=
 =?utf-8?B?ZEtQUVBGeERwcHg5TE1wRGVtTndUWldLRlJnK2Z2S0k1ZmMwTWpiTFUydWRE?=
 =?utf-8?B?ekVEekx2QW9CMmkyZGJQTFo2T3pKb2Rzbjc2NXg4a3JIUmxuRi9EVVZPSTFv?=
 =?utf-8?B?VU1pSElDR3FIdFpDOW1kcXNwcVA2eFJLRCs3cmM5c1owcm5DRlVjaTdQdHpz?=
 =?utf-8?B?azdkT3RWNk1weWhseDkxZG90cGdycGg5SmtRWENkeHM5NWNPaVRyNFhQcWZB?=
 =?utf-8?B?dGJJWWdaOFJQUDlmZmpzYUZFazhqV0UwTGlFMVBZVytjTm1oYWlkL1Q0aXBj?=
 =?utf-8?B?eTRnSVBlZ21oZ05WNGZCTmJ6TTg0RWp6VFlnSk9kL1pzRXdtRXF1RjJCTWNV?=
 =?utf-8?B?Mjg0c1lHVHpKM0VtU0p1VllZRVBFWWV1N2N0ZWJDSkI5bFhkU2tnVHNjem5S?=
 =?utf-8?B?TjZ4b1FBZEF5TFd0S2RiVTZJcHVTS0NvcjIwVk1MZDVyZjBWZXp4MEoxY3VJ?=
 =?utf-8?B?YmY5eno3cjNua3kvQ1hFZ3RvbENPbWljRDd3M0ZKR2JVY2k4d3U1M05JWWdH?=
 =?utf-8?B?SGZJTkQ3UjdGbU04cm0xeWMwc2t3bmhzUnFkOVBua0t3VG1Xa2JYNDdDSUlU?=
 =?utf-8?B?bnlBL2tFVzNLL1JMSTVEbUxJaXhFMElKckVMK1dEYzdUWVNEUk0wcUVHMGgr?=
 =?utf-8?B?eHBnYTVYWTNpVjNVRTF6bTVsU1ZQS2duZGdlSlNJWUtmVGxrRy80b2tKQ0pO?=
 =?utf-8?B?OUkzZkZXQnMzUm03L05QZXVMdjk2YTNCMFlxc0R2UlB6Q25MOFdYN2lWS1p4?=
 =?utf-8?B?dXZCY0dGbWIvRHZtNDVhUmNpcHN1NFdlbUluUVRmSVdwTW1XN2IveWFaRSty?=
 =?utf-8?B?a2VSa2RNUDRhN3p1YmZITWlJbW9DRW5pNlRONjhrRVNabDBDd3U1azBpSldr?=
 =?utf-8?B?YS82RFRDb1VhT25vYUZJd0xpNzAyRXh3U2FkT3RjN2NRdWh1dTB3Z1dtZXlr?=
 =?utf-8?B?VUVnd1RxVEVnemNlN0hTdGs2c2I1RHdBTnd2MzBwMStNeHB3MnBKeFhEbStT?=
 =?utf-8?Q?nCOOf6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUJYOGlLeWY3cDF1YXNFYTEyeDc3WUxva0pob3gwWisvalMwT0ZzWHgvU0pq?=
 =?utf-8?B?Q3RkQXYrOU9GS1dMWmpodmVvbTcxZlp6L1dUMHRhOVJBMGQvZGM1TkIyeDY1?=
 =?utf-8?B?UWM0dXhDd3hEd2x2SUpzSC9yZk1sclIzeThuaU9zQ2l1UFh2QndKZFJnWVd4?=
 =?utf-8?B?YW40cFNkN1MzVzlIUHhLRkdUNWRxb212ZnBJNytRZmhmaDVxeVJkS3lmcXNo?=
 =?utf-8?B?TnVrRjVaMDRYYjhiUEc4S1dhZTVLOUhLdW5scXNpT3BOaWdUTWlxaDJTbHlC?=
 =?utf-8?B?b0ZYMzRhMmlvN2ZHTDJjeDVVcXgvQS9Bd1NnUERCdmluQ2ZNWk1tTWRxaTlr?=
 =?utf-8?B?M0twME5zU0FyOTIxejhZZmp1N29PM2E1blYyTHFWU2RVdXhLSzQ5RkMxelVC?=
 =?utf-8?B?SzRZYWN4bHpHT0ZvY3dvRW5JbUYxamEwejBhZlUxSmZpVzkzdjNCMUtXRTZy?=
 =?utf-8?B?NFFYNGZvdkZ6cnplOU8vdEhjcVlIL1RGKzlIbkFpdWM1WlZtMVZUVE5VUXU0?=
 =?utf-8?B?dEc0Z3BsTXBISk11UWk2MHE5RjQvWjdhdFVpc1ZQbUU0QW9wRjV4bkUwSGJs?=
 =?utf-8?B?cVR0NEpyMk1vR1BROWJmbjNiY2lPaldULzB5VnByRkNub2tuYllaMkF3VHFP?=
 =?utf-8?B?KzJoS1EvOTNzcnc0MHhpZnBUakx2TjEvTlp4NHZvUlFzZlRjVlpycE9BRXRT?=
 =?utf-8?B?ZlkwZGhYQzY5U3ZGbkpaSmNLZFpPQlZtS25nNE1wenFpZHozWDltaDBWYW1j?=
 =?utf-8?B?VlByUDNWYjM1bTVCZ3BjTmNWelExNzhQUzRYRmdKdExPUnpDNmJmWENsQlBE?=
 =?utf-8?B?RXhiNGsxTVorWTlWVmF6dnZFT1djdERMVVV1ZndUS2x4TFE4cXllTHJSNXpk?=
 =?utf-8?B?S0wwYmNzWU9zNWVheElYVEExM0Z6bWUyRmpEQXpvL2ZIdUlGT1pmQU92N2Yw?=
 =?utf-8?B?ZVR6V0dJNmYvSTlRTUtnWmhxQ3d5RFNSTnVDVkUybjZ0MWMvbmZjejFRd0x5?=
 =?utf-8?B?YkUxeFAySFVKT2VEa3BBS3lQUjFISGJ6RkJhYnR0T2I3cnlySERoa1cxOG9N?=
 =?utf-8?B?WlhDTFZCREo1VlI3U0VpMG9Lb01YTk5OQmxvNFJrRU9icmdpNWRUZU9ZNnhJ?=
 =?utf-8?B?Z1JvSmptVllYbk9MTk1haFRlSi9CTWN1VUhXc3c3cTFRTk1yakZFSmpVMG9W?=
 =?utf-8?B?V1ZnaEt3aFFZS1RkcDByYW0wdE1YUHlMUVozM1E4SnRPRmlaVWNYaWxxNTdr?=
 =?utf-8?B?bTJ0YnNBc1NKd25QMnpQbWZ5NklQaXA1MCt0cS9MUkxZejNkNSt0RW11RmYv?=
 =?utf-8?B?MXVsRjJnWm9aUFg2Rm9rdUI0bGpxVEI1MmQ0aWRZMjcrbXZmMWdCUFluMFV2?=
 =?utf-8?B?Rng0akdqWlo4YktrS1BFcytPQW9IY0ovckxuZGMzblRmZzczNDFxZkRzbHpI?=
 =?utf-8?B?VnFLME9XTGt5RU5UR0Jxem5WMlBvaTc4QTBHN3diT1NkZExET0Z2dXo4VEQv?=
 =?utf-8?B?ZGFEc1pnakZVdlU0MDIvOGpCUytoRUNwcVc0OUxUNGxxSjkzTERqU1NnK0h1?=
 =?utf-8?B?L1dhMDNWRXJxL1RWaHVXbUJ4bkhzM1dHa3VENVBhM0hPNkU5ZHB4MHU1TElZ?=
 =?utf-8?B?UGxBc3dtamRaeHF1VjVIY2I1U1ZuL3JBTUY5aGlQMTMvcEhSODRGQVl2cUNq?=
 =?utf-8?B?dlNocDdCbGozUlBxSFFTUGtVRTAxR2pFbWV1WDFpL09tekt6Z1B3Nm0renpz?=
 =?utf-8?B?OXM3RWlXOHdrQW1tdWRZb1ZwbHBGV0Rma3RTd2ZIZlZnd29Jd2lOeEYvWlBO?=
 =?utf-8?B?WUdZS1VjRFcxRExHcG1VYlB6cmtHNzNPY2wzZFRzZUZTTDI5T3NsWHNKaTZy?=
 =?utf-8?B?V1hsN1hkT2lJclpLREVsU0VNbXIrNGNmbEc2ZytKa0IvTGcyNlk0Y3lVWExa?=
 =?utf-8?B?TzBKdWVNWjhPdXVHb04vVzBqc0FYZEdrMXEzOXdJd2dFY2F0ajVyRU4yaW5z?=
 =?utf-8?B?djBod3dLWDUrNW9BWmVBTU0zMEhGZ2QraC9VNHBUSm8zcFpWeURsdHdaYmlL?=
 =?utf-8?B?ZkV3TzNOcGJDUU5hZmZRVWNCaGhwcVVQN3pYVnZVTHdTUjExK0NTRTBqL3p3?=
 =?utf-8?B?amxjZTFpRGdCbEQ0aS9wVWl4cjA3VG4vUHRiZThINDhoZUdHaUVaSXdkWHUw?=
 =?utf-8?B?amlaZVVSSjRDTVBvdzR3S2VuZ09kV0FWeEk5MlFFRGptMWJuTG9vbVNxUG5s?=
 =?utf-8?B?SlpKUFJiS1BTQ3V2ZG1DTjE0UTJlMUdSa0ZYdmpuZzMzU2lQQi8rN281TTF2?=
 =?utf-8?B?MW96Q01Ld21WZVRUSGJWSnRZMEl0eGZDTTZRdVJyTU9kRHlaV1o0UzBnaWVD?=
 =?utf-8?Q?gnHJhXLpcEnz/2j4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640cbba8-6b65-4e0f-bc86-08de5a911032
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:07:02.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3pp/2ED4LkqbUr8aX4at2Of2hxf5dr9nnkk/Ry4pCnorAAvyEqKaBZuGGNQmo1hgQdp50wn3MVvrTuO7MxeyyaHGTkj/wzEtjQ7Pa9Klc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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



On 1/23/2026 7:48 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/vf: Reset VF GuC state on fini
> *URL:*	https://patchwork.freedesktop.org/series/160505/ <https://patchwork.freedesktop.org/series/160505/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160505v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160505v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-4436-479789324a94c793623d75dc6d36f89c82ce0a61_FULL -> xe-pw-160505v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-160505v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-160505v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-160505v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

unrelated, series was strictly for the VF code, while tests below failed during non-VF run

> 
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160505v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate.html>
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4436-479789324a94c793623d75dc6d36f89c82ce0a61/shard-bmg-2/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160505v1/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_render0.html> +3 other tests incomplete
> 
> 
