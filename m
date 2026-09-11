Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD4EC88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 17:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7030A10E0BD;
	Fri, 11 Sep 2026 17:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhpGdsDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C3D10E0BD
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 17:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789148860; x=1820684860;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LPQPXdwif1rXC2P4H86RZETb0TniJH+91xc9RxNucIA=;
 b=JhpGdsDVC2KeuzUsRhkekFADzGlcZ2nYhBxblokhhWshrGeM0RQ0K6UU
 1Sozq9UcbinlBuX2EPWqd5/HD3B9pDb8dZGvNfbimprsfNUjSmxScTfpC
 N9hRGGd1YVO58dHn4W6NWNPStoBQBNktCQQMIRntnWxecAjsiv1wUKJRQ
 ipksQrBZ7jPaSbmIJwjHuCGowD9SuVICUFVre2CLwKZnqQkx3Fg55MpC1
 Jp4WkNLuMHmfcuKdpRYtl2X6ZTGZgTBOEWgU8oQR+4LhHhPVWmpsbQOt0
 YDjMWvFViKQ2tI7DZrh8zWG3yI4pOemrEUxPLRjU0/N2y0hsoIAmpkDEJ Q==;
X-CSE-ConnectionGUID: 4QBSeoFQS7qxVLDL/rO4OA==
X-CSE-MsgGUID: 0eq/7KYnSmqVlypz3NfWnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="92125794"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="92125794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 10:47:37 -0700
X-CSE-ConnectionGUID: 0M4LZbYkQICVr2uVbQ8r/Q==
X-CSE-MsgGUID: mrZnBjHFQxS0+vqSbGqn0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="275739522"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 10:47:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 10:47:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 10:47:36 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 10:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHnejmZF9hjsnDfGn/6ESCsRu6Jq3DEno7mw8Eqmc1n7+USgnqX/9M1DVnK55AFGGS6dBU4z6hZDluUHFJVzy30rEKvdNwEFfTCk2IJNI4WMZNrGj0wA1JJQPwegpqyMXGP3h91Tacf+Gh1sEtvGJW5c1PrCjEpt2+USxAgTsfvYUAA1ywbPeLmZVSGwsigS1ydnzPnWnOCVkHHWZDqDpner5ENwWaJdfY+qNPOwqi222Rw3LOKO3oyzvyi0g3GNvWpZ5A1oiyJtp4u59ruhYYxqn86d5ZMrLGVhCQHznYWkQdmeoTE/vP0L6UjBGHzCWfKa+JSPJtmerielqD0duA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5PL6he0EXCR4ZhwJJI77gbZSk7QJWLshdnmRVDMDBY=;
 b=oa1vF/P+4JWMVtcf40ra0NYbMVjmKfSz3RLToZ+sO/TXCw6UczqEiDIE/VsiW0DZ5QM4/MPwETJM6WelESulH8rB63QC3rkGo5WF10Mv+iM+SYjsOjISKrc0ymp6RgpvETlEw/boxJrc6XFEExYVOGS7VFYcd9xyKdmtImAcet8nxY043W1MeI9YobCSUhf+tiorHduh2lcm6O6xGlByKAsyqS98UrpPz5Fiz/gm1e1U5h9BoZUOlWaWbWeh7c6fPmLaB+BHgqjBI3Da4oTLmqpFxQ5hhT0m1y36SodxOVFv6NPuAmFWk5LVXYjqvsJLLUvmOx5IWI8AetMdFBvuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 17:47:34 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 17:47:34 +0000
Message-ID: <644cf111-d4aa-404a-8867-95019098080e@intel.com>
Date: Fri, 11 Sep 2026 10:47:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: harden adjust_idledly() against
 divide-by-zero and overflow
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
 <20260909161844.125147-2-tilak.tirumalesh.tangudu@intel.com>
 <8ad01b22-8f27-4971-85ae-a806c5910769@intel.com>
 <SA3PR11MB762565FCDC02A5E620D24CD5C8BE2@SA3PR11MB7625.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <SA3PR11MB762565FCDC02A5E620D24CD5C8BE2@SA3PR11MB7625.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: e85dbd24-a902-413e-1478-08df102cc2be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qOwlnbBDQY5ElBt3Eg1i+9VF2xmqWv8FT5HJje0h9tqnxx3dXZZodEa4rliWICr/5ysLDWFgT9Z8KymlxBzo1/GMWuJTDAQ/PjH8pzNH305/WbQNBZwDhnMKyKyEWj1PBymgZlTyD+0MVBVx3fXZsNDC0llHk05f5CyWq7GygxDiqFRt9FtRL2QVWMiH/C0cAZYCkV6Cd+4AVTZ/EMsSviDbFzYV1TRiVDXZkIvxlepQb9nuS3MzJorX/Nx+Z/7KrSeI5rS62D4nRJjws+OcQ1Wdib/lvExKUs2CgKGaFJRG+JTKNlAv4i2Qiw6NlsGVHA6hn3wZD6MMM3ZRqhe2V8F0woE+WnPb8Y5m/ypcJ3KyNx3MUwvjMcykvyazaxnzYoTabPrwghHCW/OyO4QZOZxuptMjzD6+MTmgp19XvdQYmWCSKrQBv8bP3BRmpnjg3jE1gp44+XFZ/LKQElvaIdeLQ/ZHct9fpPD4b04XlEK4SMKdOwDANhG83TaFPYfPU1ZU01QXOU6K0xLcwivAIE/xfAfD4oWc5ltWdYjBrri47emxBvsVyrUw7N3DmiFHAJLkmjLny0rjwFYwsd/nnSoRAbbnUbn9veUElLirGqKMs400wEI1ZXfHjtyErF798pE3BNeSVKDsZ1E86WNhKgUojQfeYTietqOF2CAgm3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUh4bmkvb3pJMEZrN09uT25nSmEwbUVIUHVLMzg3Q04xNlhISVJRUHlyOUVr?=
 =?utf-8?B?S3NiVmZLQVIvdCtDV29TVmUyRVRwVUdQV3AxSkNUelRsc2V6SkU5UkZBY1ls?=
 =?utf-8?B?azFkdWhnOW9vQWliOWlTbHU4OTU0bzF2c1JBMFBuVUZhdTdIa1lLamxyVGZO?=
 =?utf-8?B?a0JRalBoSW9YRG1BVUdYcnlTQk1MQWYzT055Q0oyamxiZjArQTBzN2JYUXVp?=
 =?utf-8?B?bFdzVENDZjlmYzBEQnFrQ2FES2xiOHNwZXAyUzIzMFc4b0lZcDkra0p0b2lu?=
 =?utf-8?B?YVpNZmc5VVpSUklrcUNxeTJwZ01BYTNRVWwvV1lJajY3bjdXWC8vaUdieHlQ?=
 =?utf-8?B?NmU4NlJPRE4wSVRXYUVPRXJ5N2FLNTM3bmFUbVhFQW9keVdNaEJha20raTkv?=
 =?utf-8?B?WTByUnlYTUtLbkJyOUFzQlorN1dYZzlJK3A0bXNuZzZZZnJDaVdrQXdqUmFX?=
 =?utf-8?B?UmMxVWhXUUg5NHRFWW5tN1BQT3E4R3hQMFkxSjB3b2VkWlFJOUhrRlY1QmxO?=
 =?utf-8?B?YTEwVTBXNW1Zc1o2UTZqVmlvcGMwcEMwaTllcmJPWWJBK3J5ZFdtMWNXczNZ?=
 =?utf-8?B?VVRaZDFsb2krYnZwNEdXN2NVWldUb1R2cWdSTDBlcWlQQnZ0YUJSM0R0d01Z?=
 =?utf-8?B?TXZLQmJlZnhSRWcvclgxbFdRTjhOSk5DaG1vODBnbWkrTHdjSHlyVldoY3dj?=
 =?utf-8?B?Tm1rOXRBSzYrNHZjd1ZpTFZWbWVsQWZHdjhsM3U4R3pleHhZNWtqWWJQcWpM?=
 =?utf-8?B?SlFrTUFQcUVMNml6dkdaeDJaQVpzdDZtekFnUUZlVVM1Yi9nWGZ4YllqWUhH?=
 =?utf-8?B?LytmaDU4SG1xZkJpMFoxU0R2UHYyTGRxTzg2bGRiSzY4RXZGeGpCcmcvUXZK?=
 =?utf-8?B?Q040NGpmQ0ZKR2FURCtXc01HcStnUy9wcG9tdUMzem1XWUZWWEFMOU13akpn?=
 =?utf-8?B?U2lPbi94ZGdFcUFnNWdNN2JxL0RKQUN4QisvcFN1UE9UM3JSRlNDUHZiV1pF?=
 =?utf-8?B?K0hkNjBUMUNVckVsOUhSbGEwOXRpVG1HdGpRRCtKZHgvWGZQVXZsNXhwTXdt?=
 =?utf-8?B?bE9UdEhaSno2SG9tNHFvTnBNN0xHaitBbVBObDJNN3MrNXBnSk9HUEpwdk1E?=
 =?utf-8?B?TVU3Y25ROU8rdkRsV0xWQVpydXhXL0o4ZTZxLzdJeEMzWDQyVUdnR2JuUHQx?=
 =?utf-8?B?K0pndDJBSWV2MUkvVDhwQWF2Z20vZWN4OXFqVzBvVzk1ZUNVdGJhOHhEWTBw?=
 =?utf-8?B?NU4yM09ldTUzcWpJb1pKbTREYk9JK0E4bHRaYnFVazh2TGxUQk9FK2JIV3hr?=
 =?utf-8?B?US9teWVnYTdSTFI2NFVublRzcHlWL09STUxaM3cwUEhOSDRqempHckcyOUc1?=
 =?utf-8?B?L0xQUmpvNExxRzlKdURLZnFFNVZMZ1A4RVFVN3RHalUvVWxUZFN1MDljUWFn?=
 =?utf-8?B?UmtEM0FYMktUeTZUaytFT2NzdFVOMTFkUllEci9UaXhWMWZuR1dnQk0xczhZ?=
 =?utf-8?B?dWd1NWdMWGIwbDBSSlBGeXQ1alVWRHlKZG9LYXhFSWFDbmJKaGxQenZSOEhJ?=
 =?utf-8?B?NGk5Wm1KYW9tVy9WU1U1MW1PdXpJV21qSWlvRUNzWm1idGhZcm8xdHRFcW05?=
 =?utf-8?B?TzQ2djJKdEs5cDF3SzN6L3N4WFZVKzZ5L2tXTVZZYTNEKzBMUjBIcVZJWUMr?=
 =?utf-8?B?ZE5TekJWb3JBREhwSFRyenNaUE9RMmZ1WHNzVlh1WHg4bHVqZzhNM2RyVFNt?=
 =?utf-8?B?UzgwYjFidWZCT2tod0FFR3QwQkpTbE9qV1RYWkc4NXRnajZCdEFRczBYY0s2?=
 =?utf-8?B?Y040bnVJaWVFNTlDS3BlMXBjSUg5eXJLVGhockw3Y1Z3aEVLUDdnVFNiVXpi?=
 =?utf-8?B?eVZSZ1JuTjRobTYxOEJ6Um0zR281bHkxQzBFN1RUb0NqVEMvOEZDZGpvREtK?=
 =?utf-8?B?Rm1lbE1qRmtkNmh1cjlsWFVKd3MzR0lNVDZUa1BXa1dXd3NzQjZaY2hjUmZv?=
 =?utf-8?B?bkFwMEl6aTcvWlZoZWl1a0tNM3VBTU9wZWZFR2RGQTdCMUd6dlZuakxPaU9X?=
 =?utf-8?B?bDBDMERmbC83VzVBVUo2dkZlR3VtNHczelhyL2NibkpSMWFUZHBQYVlNTk5P?=
 =?utf-8?B?dE1pZlVBbDE4QlRUYjZYckNZUytpdDhGdTc4RFAyTzJjOHR2TlM0eU5KdStV?=
 =?utf-8?B?WUtHaXF3TVNCQUhCMysvMmp6MzBhNG5Pd3FSVzBWdE5KcHdTSVZqTlhPa2tI?=
 =?utf-8?B?ak4yWVZ3eEkrQXkwVmFjWXZHd2JxVGt4RWw1YUtjVzYwTGFRWTgzN3J1M3hh?=
 =?utf-8?B?NjVBbXFtamRUMklsY1Qxc2ZNRzZkTUdQR0hwMmo1UzM5MUQ5TFpzVW1BaXV5?=
 =?utf-8?Q?dDuQNbmiT2bdc7Qw=3D?=
X-Exchange-RoutingPolicyChecked: JHMLAUUJqOJerybKJQZ4S/arcXxWuZdTCI5/I0KaBxG3Unwzz2jM6XINC510HjUkfOx/VQSQM37M3j3aYJ5oKphoakOhuGPJlcRrKimu3CS8h87415EAlatPS9+xF0NAp+qOt+jGZEQZUCRvwkCxZ85i9xcHyeYE1cPniBDHWy6hR5b3nzbox/36G7zf4j+uAzmmVFldEGU/vxQm+sbkB3FIh+yWwMPhl1JEduYUITx4DVpZ/W0pUgGl4HSzUNnXgSdh9m69YcZZQKDAPADxF8VQ7mh7HSTsmQ+fZJz1kP6jUULEmP5IZIpbiFIKkOFc4BK+qMwkBDrqh8XnumQtEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e85dbd24-a902-413e-1478-08df102cc2be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 17:47:34.5938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZraGBLmlTZjbXqd/xXTkk5eDaT1FMVOL2xyqev+55ZMGLqqdtTXbioHh24phwODV6iEqaIctGWrZCt2d5Ir0RxAUWn//zV/UAInzAJq7Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
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


On 9/11/2026 10:44 AM, Tangudu, Tilak Tirumalesh wrote:
>
>> -----Original Message-----
>> From: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
>> Sent: 11 September 2026 23:09
>> To: Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>;
>> Upadhyay, Tejas <tejas.upadhyay@intel.com>; Sousa, Gustavo
>> <gustavo.sousa@intel.com>; intel-xe@lists.freedesktop.org
>> Subject: Re: [PATCH 1/2] drm/xe: harden adjust_idledly() against divide-by-
>> zero and overflow
>>
>>
>> On 9/9/2026 9:18 AM, tilak.tirumalesh.tangudu@intel.com wrote:
>>> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>>>
>>> adjust_idledly() has several corner-case issues flagged during review:
>>>
>>>     1. If xe_gt_clock_init() failed to recognise the crystal clock,
>>>        gt->info.timestamp_base is 0, which makes idledly_units_ps also 0.
>>>        The subsequent DIV_ROUND_CLOSEST(..., idledly_units_ps) is then a
>>>        divide-by-zero and panics the kernel.
>>>
>>>     2. The tick-to-ns conversions are done in u32:
>>>           idledly * idledly_units_ps, (maxcnt - 1) * 1000
>>>        Both overflow u32 before DIV_ROUND_CLOSEST() sees them.
>>>
>>>     3. If IDLE_WAIT_TIME reads back as 0, maxcnt evaluates to 0 and
>>>        the maxcnt - 1 clamp wraps to 0xFFFFFFFF in u32.
>>>
>>>     4. The register only stores whole ticks, so the clamped ns value has
>>>        to be converted to ticks and back. DIV_ROUND_CLOSEST() can round
>>>        that conversion up past maxcnt:
>>>
>>>          maxcnt = 640 ns, one tick = 666664 ps
>>>
>>>          clamp:        maxcnt - 1        = 639 ns
>>>          ns -> ticks:  639000 / 666664   = 0.958 -> rounds to 1 tick
>>>          tick -> ns:    1 * 666664 / 1000 = 667 ns
>>>
>>>        667 ns is programmed into RING_IDLEDLY, but 667 >= maxcnt (640),
>>>        so xe_gt_WARN_ON() fires again on every subsequent init.
>>>
>>> Warn and return early if timestamp_base is 0 (the unknown-crystal path).
>>> Do the conversions in u64 via the *_ULL() helpers so they cannot wrap.
>>> Clamp with a floor (DIV_ROUND_DOWN_ULL) so the programmed delay
>> stays
>>> strictly below maxcnt, and guard the maxcnt == 0 case with a zero
>>> delay while still writing RING_IDLEDLY so
>>> INHIBIT_SWITCH_UNTIL_PREEMPTED is cleared.
>>>
>>> Fixes: d2de4410a88f ("drm/xe: Apply Wa_16023105232")
>>> Cc: stable@vger.kernel.org
>>> Assisted-by: GitHub_Copilot:claude-opus-4.8
>>> Signed-off-by: Tangudu Tilak Tirumalesh
>>> <tilak.tirumalesh.tangudu@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_hw_engine.c | 14 +++++++++++---
>>>    1 file changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> index 010499766fce..c86890e09b55 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -594,18 +594,26 @@ static void adjust_idledly(struct xe_hw_engine
>> *hwe)
>>>    	bool inhibit_switch = 0;
>>>
>>>    	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt,
>> 16023105232)) {
>>> +		/* xe_gt_clock_init() zeroes timestamp_base on unknown
>> crystal clock. */
>>> +		if (!idledly_units_ps) {
>>> +			xe_gt_warn(gt, "idledly WA skipped: timestamp_base
>> is 0\n");
>> There is already a xe_gt_warn in xe_gt_clock.c when timestamp_base is set to
>> 0 in xe_gt_clock.c, so this is redundant. CI failures will happen if this is the
>> case anyway.
> I will make it silent and remove warn but "return" should stay right?
>>> +			return;
>>> +		}
>>> +
>>>    		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe-
>>> mmio_base));
>>>    		maxcnt = xe_mmio_read32(&gt->mmio,
>>> RING_PWRCTX_MAXCNT(hwe->mmio_base));
>>>
>>>    		inhibit_switch = idledly &
>> INHIBIT_SWITCH_UNTIL_PREEMPTED;
>>>    		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
>>> -		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps,
>> 1000);
>>> +		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly *
>> idledly_units_ps,
>>> +1000);
>>>    		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>>>    		maxcnt *= maxcnt_units_ns;
>>>
>>>    		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
>>> -			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
>>> -						    idledly_units_ps);
>>> +			/* Floor below maxcnt; write 0 to still clear the inhibit
>> bit. */
>>> +			idledly = maxcnt ?
>> shouldn't this be idledly >= maxcnt ?
>   idledly >= maxcnt  this is already in if guard
> the above check is for maxcnt zero case

ok, makes sense. LGTM.

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
>> Thanks,
>>
>> Vinay.
>>
>>> +				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) *
>> 1000,
>>> +						   idledly_units_ps) : 0;
>>>    			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe-
>>> mmio_base), idledly);
>>>    		}
>>>    	}
