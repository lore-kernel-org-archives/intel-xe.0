Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD74CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F204310E0DC;
	Tue,  7 Oct 2025 13:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qq40QXpe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F7910E0DC
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759844254; x=1791380254;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oe6QzopvdmohpsTAux6d8hkd0/aVDoKi9SUIGMf4fjE=;
 b=Qq40QXpei6kx4YwWP2xM3mAz98h8ATyTp54SBFRjNVlmrkwsvZxwibjT
 HrlsKskUlRuVcrj5OMv/a6JGmvmMaEDsfshV3rIxjS0//lEsttxHdng+l
 0JY2QG8KZ9CUxeDlFEmBi5Mr+5yRVbafsecsk6p/N2wD1iKgyaCurX9Vf
 A+429bHLsxC9rTcN+0bS7Bfmauc81O+SAhq70HcjU7lU2UqL/BdJ45wS8
 Z9rLfzRo2RIr6ZiNLK3w9fLx2yCmDeOA1BdC5CqrQiU4iM2UOgvXzsFaw
 NlAP8dIHmYnNV/CzrkNLK3zBP67URC93Wlp0rX1+jCWHVUggP7jjicwfT A==;
X-CSE-ConnectionGUID: ptE6zlmwSjiCnXcTrom6vQ==
X-CSE-MsgGUID: G0S5DUrYQxyQhi+9yd+VLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73450812"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="73450812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:37:34 -0700
X-CSE-ConnectionGUID: b3G5hjZJQuWSpt0cJelkLg==
X-CSE-MsgGUID: xPATZOzVSj2FdxsoAPXHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="211109474"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:37:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 06:37:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 06:37:33 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 06:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Si0fj4LxaB0l2RGmWyVejkuKik2fY5rUecyPHjaxn92EzWgNvpfPi4cwSAQDFQNUDNDgPDzCXlntdfI85B9qThwCMGqtSmY43DokdJlC15Dm3iBPoXyD4lMNNUk44xT1bCh77pieRLaiMNscEFAGho11oKbhsqc9H3EadRN/FblGO7cv7GeWP1e/gAGMkXmQ7IKwgksxJEXqMbKn2GT0HQPqmCDDalRW13edN6NtV6Is9Iy0wJQtwDSkdfhlfBjMB9WnYogJIAZtIvttInZq9Q/oaAHB7ZRPzP9+KEKHGzK8dIhOI+dY91RLSdoWUEVHPOpQ3polQr88zk0Jseemkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypfJ+B7Hiw1kvOQknO8ZnVmB1pTIgG+C3H6fae+jznk=;
 b=IKmMrKIRA8zofyZDM8hSnRng314XQHFBkFCRW3J60MnU7ycl/n6IpqadIgMKcz9NMteqq+t0a6Z4GbZAuTInEf5EiEQkEm5gaZ7R59U9zl7oyxCDTuDHKpiraZCEgcACjVwyTky+/a9doSYSaHT1m6cbNhQw+/GA8UtetagLlJVtBGXvYUWY1XiJvMKk2vWU3v5H0slzGm/m7eLIUyEig/YFzCMQ8DtVMj+viiY+FZh1KBLei59lPPqyI+rW/EFYyKpy+dAztdnSQrHro2QzOJ3zeSAvx7ezcOTKp5mJvy9zPXp3JaNKyzcrOGFtomWfhv4DpsMymEGUEK8TBSCsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:37:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 13:37:26 +0000
Message-ID: <c80e65db-92a2-472f-a2ef-50e333cc416a@intel.com>
Date: Tue, 7 Oct 2025 15:37:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/33] drm/xe: Move GGTT lock init to alloc
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
 <20251007130505.2694829-13-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251007130505.2694829-13-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0032.eurprd05.prod.outlook.com
 (2603:10a6:803:1::45) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: f191411f-448c-4cc6-c68e-08de05a6a783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0JMYndMYng4N0xHUForQUdqUkhSSEhxWVJncHQ2eTc4MEo4dDZxV2ZvdGRm?=
 =?utf-8?B?OGRuV1VuVDAyeUlZcEk3MUVHcDRCMVBDdkVUQTFSWHBXMFFoZ09JQ1l0L0J6?=
 =?utf-8?B?cGVuZTQ5OXF1SVdXeHFLTmxCdk1OdFdHaWt1SXhLc01RdFJUbXpRUjJaeFJR?=
 =?utf-8?B?RWY3NUVZa2s1VHdTYzRBS3JzenBYUGkyM3RFYlgvTlVnbWpHbXd4K2xLYWUy?=
 =?utf-8?B?eERZZnNPOUtoeU9CMXFrU2p4cnIraG5mMktwMy9DTFBiWkZhT1NpaVlHM2hn?=
 =?utf-8?B?U2M0eDB6V2pvR0U0NUZLWUpQZk5mOHBZaGRYZjlzVFdhZ3BMU2ZVZlZzVzRj?=
 =?utf-8?B?VHpJN0w4TzBESmxVYzF6L0NHUFhLTE9oSmorbmFrdTEydVFRNnh2QVZybEdY?=
 =?utf-8?B?S3dtR2dlYmRYM2hEeHlHUzVJNldpd0tlNjFVVVdhTDdRZzhlMlk2eTBkV0ZG?=
 =?utf-8?B?eHZBeXJQNUQ2N21ZWEhldXhCMWc5QjkzakhSUnRsUnp3ZWJMUTJ6WjFjMTVQ?=
 =?utf-8?B?VlhFcDVsbzBON1IvOGQ3Zm81cGlVNHNuU3l3ZWpGNjUyNVUrTkYwcVJqTHhx?=
 =?utf-8?B?ZkI4THE0N0ZYY3BvS2QyNmNUb05aRGNkQUQ5YVpxaGFYZnhzMGZlSmlxYmlI?=
 =?utf-8?B?UjlUa2lFT0I2RHl1SzE0UUpHNXgySldBOXZ6eGQwT2dqai9TdFNpRlBkYlUv?=
 =?utf-8?B?dU1nM1Fna2FDWnJ6bHdYa3UxbU9tb21jVkRQZXVndlF6MTlHTVdzZDcwNXcz?=
 =?utf-8?B?aXZtNHVTclNEaXI4b2paaGZvbThHTmRkbm5VRE5ldWJsUkhjSEkrQ25XcmFE?=
 =?utf-8?B?NUE2R1RVK0crT2dkLy9kVCtSSkpWMmxlc0hCSVJWUktDaHh2MWJudk1sbDJa?=
 =?utf-8?B?K1ZwVWVLY2dlbGhNYTYzelljWnpISFZlNzRtcU83Zkp3MHk1OWp0SmZzK1RO?=
 =?utf-8?B?RktKZm5xQzFFSnh1S3I2dWpWMWdqVE5xK2Qwc2ZSaDFoRWdRZXlodkd1dVRr?=
 =?utf-8?B?VVROS0ZXS1FLcGVZY3hYckpIRlNVL0VJczQ0Z2JqODR3UDFJVXdWemkrTWhS?=
 =?utf-8?B?cE9POTZHaVB2NVQyQkliaVlnZjBtUkFSaFc4QWE5N05ZSVAvUEFRcC9Sd0U0?=
 =?utf-8?B?Mk5HTlQ2Z0FCbUN2aHU2QmJwb2grY1BvTERWZFBmaUQvSHRDNHdjWVorTFcr?=
 =?utf-8?B?cHp1VHRDSFVOL3lYcTBMYk1yVFcvS08xNFUxVndNZkZzT2l1SnJDWlpoK1BW?=
 =?utf-8?B?ci9aeG16TTl0ZFZub2VMK0h0YVk5SXlEY0NkZGxKUzNjUzU5ZkVmRXkzVms1?=
 =?utf-8?B?TnVCYTdCS0ZWM1BzSERBTnN5eXBFb2lFUG1jd2ptb2QvblpLeU1FbmtVM1lL?=
 =?utf-8?B?dGRJSmZZMVA1eFd0alQ5bUdLTmxLL2hzTVZDcG9xUzhpdWNIVThmTURlZ0hV?=
 =?utf-8?B?Uk11eVBUS0l2UUFTS000RzFBZWk5VE8waSszbXpFcFFiSzB4TlBBQnczSFlK?=
 =?utf-8?B?K1BkNHMzMVRydHNlTTdDcHJnclVoLzMwdWpTV2QxYjJ6NWxEZ2Vwb0ZFNnN2?=
 =?utf-8?B?RjI3ZGNwN3dBb1FCdUc3Y1ZzV1pEdG16bEpKamN1dWhZcTh5bi9veHFJOU9w?=
 =?utf-8?B?K3ZiVC9vQU1XbzliTmF1N01iMXFsS1FZeXBtUWhIOHZVa21YL01XN0pjK0RD?=
 =?utf-8?B?eEppZzU5YWNaNlMxWklSQnczTmN4bkJBeTl5RG5QMEVORmMybnlZeDhBSjZR?=
 =?utf-8?B?dUFCa3RMN3Z5NlNQZ3gxcGt2SncrMzZqZmNvMzFBQ1VOWXduYXdJSzFMV3Ft?=
 =?utf-8?B?MWpYQmhOKzZDZmxlR3h1ZVB1UWtMUnZsWk9BWThCK2NDVGI1OVdlY3ZoWGxD?=
 =?utf-8?B?SWhnVm90NDBaKy90cTlMdHk1dmJ6L1lxNUNFVXFpZk12YVJaWkptMnA5ZzV1?=
 =?utf-8?Q?NldASBVgpqnm0K+uc8ISTgVx5SVPhBvB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFpsMHNjendZTzYvVmNvWDR2bml2TVlYTDZpc21pMS95TDNSU0d0SGt3cCtj?=
 =?utf-8?B?dCtUY0NkRVZLWHZZbTk1c1NnZU8yVlJuczk5THhxd3EySTB3SytlSkJoY0Uw?=
 =?utf-8?B?WTZEY3g3eDdIN294dkRyemU2Y0FKTkxwcDU1d0xiSFlnbFVyR1R5ZUhkZFFs?=
 =?utf-8?B?T09WeEF1R0M0MEJCdzdweVVtSXNramMrdDdrZlRJRmZVMzErMFdReXFldzNU?=
 =?utf-8?B?anVaeGNXMzVtVVRjaFNET1RZQUFxdDRtLy93WVNSVjlBR1lLY3JCa05aTUtE?=
 =?utf-8?B?T1JaRDNDS0x1eTVEVFk4ajFIMFNZZUdlb3ZKZWZlSEtUSzRzMTA1TXR4SmRx?=
 =?utf-8?B?enkzUkVYcnlEeGp0NkcxaS8xU1pFZ3ZwdDM2bUpHZnRjTHpPM0lBd3ZPUkNO?=
 =?utf-8?B?Rmx3UmRnWmc4dUJ4VXFOcUpLekNDaDZPVmFwWERTWjVqN0VqNy9EMXV2V0pE?=
 =?utf-8?B?OHdKTy8wSXRCZVI2c0FOUkVubS84akFYZEZMelR5QWJLdXZGdTVOVjROVWlQ?=
 =?utf-8?B?VlpQNlFBdlVpa244emFDRXllY3JIZ2QxQ0YvKzZhN01aTHhnaEFLZ3FlSlg5?=
 =?utf-8?B?S24rZUhMYmtHT3NibCsrTDJZVzJOd2V5OUlzYnA4MlZLL251QmlDd0lkZnJJ?=
 =?utf-8?B?dW1XbEdOTStJNHZYcEpvZi9NZXpNZFBRZ2REYk5PejhIMEYzaEFiT29yeDJH?=
 =?utf-8?B?dUt5cWw5T2d0VFprVXBESk1GSWFmS1c1ZUxKcisvNEp0c3BON05nZFl2OS96?=
 =?utf-8?B?SC9GYTBHVFUrKzdXK2FoV0RYNHd0MjNMb1JkbmZoeVNEeWZ4UW9CSzRsZzRy?=
 =?utf-8?B?YVlaTHNISG11cWQyODQ2OFFiTUtUT2FQMG5UYWIrVGJFSVFTVGJCRktYajVW?=
 =?utf-8?B?b2QrVlh0cHEzYk5meWwxMTBtTG5ZQW5wczcxckJLYnBNTElabUlpSEF3b1VH?=
 =?utf-8?B?Sis0YUlFeW5wQ2xkdE8xL3pEOGR2bU5ZbXgvTVR5aDNDeUswcERlVEpwaytU?=
 =?utf-8?B?aHhhUWNhYnJsWFJjejlaQXN0eVQ4Y0ZaVlM5dTl1ay9xUGFEVTFDZ09yK1Y0?=
 =?utf-8?B?SGpuZ1EwQmpRbkE4ZFdjQzIzd2VITUQ5R2tlc2xrWElQdjROM25nMllEbFBv?=
 =?utf-8?B?bEhJTUNacExjODllUU9vNlRoMEVoRVFmVjkrN2psK3RiQnFNNDQ0VGliV0xG?=
 =?utf-8?B?M250cm93L0Q2bTc1cUJES0lpdXFnTVozMnBTSmx3c204NkhrU1Y2MVprb0dG?=
 =?utf-8?B?RFloUUZHSTVoOEhsV0RzUHZWQ3pvTGxwRzVxd0VUYVhGeXM0NVNIRkpETTlz?=
 =?utf-8?B?VU1UQUlYMzZkSnl2NG51MUVnYnptQU0xYnRTRFJ6ZE5uTU5ENjA3TktNdVN3?=
 =?utf-8?B?K3o1ODJYNWxVT1NETURBTmVxMVZqQ01YUDI3bmUvSTBDZTdaZzBHQU53ZDlR?=
 =?utf-8?B?bnhjV1ZLSEdzbmxQWFZIODRudGk3RFh3NWtZOU0rbmx6WVpDVHd2S3pLeE5J?=
 =?utf-8?B?V2hLRXBQaWNZVTFUOGtUd0pRaG85TUV6bEV5a1BFWm9OU2xzN01rNUpHdCtT?=
 =?utf-8?B?T201T3NyVk9McE5meEpUSC9PS2ZKNTBUQ3l5Z0pxbklRZTdZUnRDa1k0cWFu?=
 =?utf-8?B?RDVSRmNCTmszMXZuT3NXcFZud3YxcFpSSnBXSWs5a0VOTkUyNmg1QTBHbWcy?=
 =?utf-8?B?YTNoUjVTNGtmWlZnOTBmaVJyMzgxTnJ0em9ROW1QbkRZYnBkck10aWlBZCtJ?=
 =?utf-8?B?WVhNdElzVWNSekpQckNoSWZrRnR3VHFoZHZqMnJHakp1UEFJam9IcFpvZVRy?=
 =?utf-8?B?TEVjaEN2aC84YUFtZjYybWhMUFJlUGt1UXFxYUZQaEFsemZEL2RGa3VUUG55?=
 =?utf-8?B?Sk8yUlNhWmZYVi84a0lWQ2ExVEpvQ1VMV0p0WlRHSEV1c1hkbmMrWnhmZUpZ?=
 =?utf-8?B?WHZvRmVaZFZvdDFzV1NUV21EcVpXWUZWbTVSaDI2WnVwUTFRcEV2UmwrdUhU?=
 =?utf-8?B?OFJRZUh6NWNPSFIvKzZoZlMwME1kVWhWWHdHL2wrcXpSRUN0RS9EV0xKK2Mr?=
 =?utf-8?B?RnVUNTJDVW5kWU5hNEo1WUN6SEMxTGhxNHpmc0lNUUNpemJVTjNqcEJ0R21m?=
 =?utf-8?B?Z3pUMThRanY0NkFVWkJaTnBRODJLTVFEUE5BbDZuSW1HR3VtclpBUlJYY2xL?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f191411f-448c-4cc6-c68e-08de05a6a783
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:37:26.8050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuPFq6H+pxucpveG1cPLHVL8uZA9Kbc4eUojaC+bDmcq8KgVej6cjGgfqNh8gJw9tdmgMzRuApHEZchyFES+/nF6hsjv8OV5x4kgu96YiDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6011
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



On 10/7/2025 3:04 PM, Matthew Brost wrote:
> The GGTT lock is needed very early during GT initialization for a VF;
> move the GGTT lock initialization to the allocation phase.
> 
> v8:
>  - Rework function structure (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 39 +++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7fdd0a97a628..aca7ae5489b9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -159,6 +159,16 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  	}
>  }
>  
> +static void primelockdep(struct xe_ggtt *ggtt)
> +{
> +	if (!IS_ENABLED(CONFIG_LOCKDEP))
> +		return;
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&ggtt->lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +}
> +
>  /**
>   * xe_ggtt_alloc - Allocate a GGTT for a given &xe_tile
>   * @tile: &xe_tile
> @@ -169,9 +179,19 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>   */
>  struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile)
>  {
> -	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
> -	if (ggtt)
> -		ggtt->tile = tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_ggtt *ggtt;
> +
> +	ggtt = drmm_kzalloc(&xe->drm, sizeof(*ggtt), GFP_KERNEL);
> +	if (!ggtt)
> +		return NULL;
> +
> +	if (drmm_mutex_init(&xe->drm, &ggtt->lock))
> +		return NULL;
> +
> +	primelockdep(ggtt);
> +	ggtt->tile = tile;
> +
>  	return ggtt;
>  }
>  
> @@ -180,7 +200,6 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  	struct xe_ggtt *ggtt = arg;
>  
>  	destroy_workqueue(ggtt->wq);
> -	mutex_destroy(&ggtt->lock);
>  	drm_mm_takedown(&ggtt->mm);
>  }
>  
> @@ -198,16 +217,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
>  }
>  #endif
>  
> -static void primelockdep(struct xe_ggtt *ggtt)
> -{
> -	if (!IS_ENABLED(CONFIG_LOCKDEP))
> -		return;
> -
> -	fs_reclaim_acquire(GFP_KERNEL);
> -	might_lock(&ggtt->lock);
> -	fs_reclaim_release(GFP_KERNEL);
> -}
> -
>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>  	.pte_encode_flags = xelp_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
> @@ -227,8 +236,6 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
>  {
>  	drm_mm_init(&ggtt->mm, reserved,
>  		    ggtt->size - reserved);
> -	mutex_init(&ggtt->lock);
> -	primelockdep(ggtt);
>  }
>  
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)

