Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44587606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NAOwfKbm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hCJ6p+4x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E592410FC06;
	Wed, 25 Nov 2026 12:03:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A7110FC06
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 12:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795608205; x=1827144205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WSBaWHNSLZxWZv2VRM1GXzOIkx7w0pUZYn8SVcmO6dg=;
 b=NAOwfKbmH5Zw8EuKh3GTR405snSc8LBaOJZwxmW8JbqZL6cnoeAtiLp8
 ZB/u0QRomPfKPbd0Db5dxj++w0uQijhBKYq90RwFrYwRql6G+RzkONQQo
 rBv36//zmBJv54ogH1v7jCYHzZxuWq3pAMumNjOZjuN7C+w50CrUTbACS
 ZjTghc4cQqsofDMp05k3H+DbK+5AADFIJF3B7JsDrD45IW4Dh1h/RO7CU
 bEELQ68YKLBjNe6M5FFODxjBskQ8OBopRc+mwjD5PRKZnGFJQRQVNg8XX
 Z8wQ8gJNQoe+UPr1sTxE90RV5H9n5Tky92WJuj3prMfzeobAbXFDTaKes Q==;
X-CSE-ConnectionGUID: br/VsRi+RI+FmgXhuIhv8w==
X-CSE-MsgGUID: hX5ChZlzRjGHP8doX/vTuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4405148"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4405148"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 04:03:25 -0800
X-CSE-ConnectionGUID: zMN1Yj/gTuKoPaIjQXwnkw==
X-CSE-MsgGUID: Yx+OjECQTbiiA8pem5+NKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12281051"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 04:03:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 04:03:23 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 04:03:23 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 04:03:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMtpGUHO0hP4y8o4BVac8ExQGYxgpmP081Z7/c/VJKh48GPHo9ZL06HyXXNtBpF4wO/54KvbWt7rsr0iuC2gP2ONbJPoa1XSD3tG5AM/qdhYdSmmsh8/5J/cv3GgVRI+fzAAQ4Hi1irAM/GJ2wMcKh1MhWzgJrD26ew6XhDfIjN9kRuXR8IxUu95TgW2evqVXg9wY4Y47Q20q+F8lMMlDq70Fcuo/mm5UB0lCotsP1KNOqkjo4xBtGR3OWUftEsyCjsXA3pgqFwMvVQaPvrzfoAr//F1sJ+qxZaxR0N0XsJAqlSrVrG00EIud+gShrR832LvyRUqTZsnwMjArhfnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upTeCIwBnJBVowM1RjQz1MpI4tJ9Zb12q9wfoDTuMJQ=;
 b=b2EfkD37QKl34HFJyjpuf1sDEoWtJ30UjFMu5lqYfSn2cqiZnxUlLPt7dy+7FSCMzAmXJH1Q0ZlBQ0gfTnkXxRwMo4P7w2LSpNJny7h39Uh2VxcOeOg2h8N4DEJ/87Wu/EzAgC3H++5kxDpBOaGgHoAv33ZmawdzvtvMoawjm9FJ3klhNWZTAhqtDnePP1MTmcER+cI7uIdf+0zTf7Nal/gPL1TuJkG4jmrwGsxWNBpEQoWvXoJq8R4s1jv4NbXfyF/eUffpWBqM1PftFgTf9zMyA8WgQ7XU8iiPNttRAhPdB+iNXK65I9WiLVVXvAqG6kFjsZ4FzUFoA1Unv/kd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upTeCIwBnJBVowM1RjQz1MpI4tJ9Zb12q9wfoDTuMJQ=;
 b=hCJ6p+4xcasOTZtUgELckR+ZdSu9PXVdVSWIoxV50If9y5UaB8oVq7bt3eGJgoVjnnpz0QHS7456STJfkcHGoLXDEoBi2uJV4RFphGtGb9w4dGGDWlOLmZ6kALTI//euHmsVNUvjKN0i65hYFUzBqP2YM8uIa/rNwLh1KL23Obs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CH0PR11MB5314.namprd11.prod.outlook.com (2603:10b6:610:bd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 12:03:21 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 12:03:21 +0000
Message-ID: <7451c496-576f-461e-ad0c-f22aba4b2214@intel.com>
Date: Wed, 25 Nov 2026 13:03:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe: Retry when drm_gpusvm_get_pages() gives -EBUSY
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20261124152300.2450568-1-tomasz.lis@intel.com>
 <5659b906-98d7-4004-91a0-d43a6ba47276@intel.com>
 <aba1c1d4-a06e-4550-ab4f-731b9ed894e1@intel.com>
 <5fa24326-9c35-40ac-aa84-61e0ba09c79f@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <5fa24326-9c35-40ac-aa84-61e0ba09c79f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CH0PR11MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: b81c3457-c79a-44bf-79c3-08df4aec1995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|261009223027099003|18002099003|22082099003|56012099006|4143699003|11063799006|261028144727099003|261102123227099003|261026121527099003|261021135927099003|261021123027099003|261022075727099003|261021121427099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: kejTq3C1LdqHRyDfX+EnoCX32eWble9T9IzOnBa+d9uF43NQx7Sv7FmZ71bxxGACCWXRspGUXXVakgf+NXUxJZ21ew7u59QJWVEoZI5VzS1UwqBeo1L0NyHv+K7g8jmPpz89RO16ZFnZntvtjLrUXpasW7OTJvQd2bUJAck7JyDiZ+AZmzBdCeij2KvTzGBdgFtXFT5QydQhj99SzqD0/9CROIEcWdv/+/C+KfQxnJbjLalfasnhztLfXVDryszodh+YD4h3izw3aXOWLg3JKvT7jFae6ZxhdmPOW/Hu7alRK7pLrTSfUhboiKvBI0KeRWXrVXK2wVXZsiZX4jj5njB3J24XucAsUHt7JtwMOx2UGSgipOIWokrVC2aB7BjlTzNKWrIDl9OkKuQePbKRukOXbkKK2JZ2M41jMKwWamcVONIqVIqMRdrSR9FyW81tVI3XbZalKtqAAwzFaMHwSYO7Z9gg1Akhnpg6L+AMiTNuUPZrlnKXCxuRr5UeuWt+G7j3MZPCRu3m2Ol0Il3CGpLU715vWTM+vmXt52tXvcUVLtTFDSiMV3DzT3YhSn4kfV4F5GArU/I4GtnrA1Pa03TAndROk/ywiIVJgwOkvrlsMfsiaqNTzDwkTfGIyrGy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261021135927099003)(261021123027099003)(261022075727099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTRQYmlmNk1Wb3RHSGpPWFRLYUlSRjBzeVl3SmlEaW9XemZrNmhnSlc4N0Vi?=
 =?utf-8?B?UVQvdElvTEVMU1hacWRRZFFxc2hKU29ETCtCUDZtUHllTFd0Z0puV1NqTTIv?=
 =?utf-8?B?RTRFR3lJOENadkVqT21BOW9kZ0pIZkFvSkFtVDJYMmNvdk1YWCt5N3QwaEc5?=
 =?utf-8?B?MXVWbDZNZDFBQk80OXQ1U2d5bzNPdFJNWEg2VkRPYTcvWTkyY0xEcExZYVIx?=
 =?utf-8?B?NEJxN1Y2cktWNkJ1R1FoUm9XbjBMYVY0Z1NuSm9BYjJ3TXVObUJQNTNkamNy?=
 =?utf-8?B?SnZ0UVNhYkthekJFZHhIcnBNeDBzZUgyWCthc0FSUGhXYzNqZ0tIQy9CdGVO?=
 =?utf-8?B?U3QxdzlZcE56M3VCa1pWSGlwb2Y1bGNOcnlZT20yOHdrYnlGNnd0YVlSODBO?=
 =?utf-8?B?TjIwTUpiQVcxallXSXZBd0VPclZRSzlUR0UvR0hBMUFMdURqSENHZWVGTXdy?=
 =?utf-8?B?bEFmY215SE1oZmNhbWc1MGYwZlkrZDNLbWtVb2orT2xINXlRR2FBOVh3Rm00?=
 =?utf-8?B?azJpS2NzUktHVTZxV3pDaCsrMURqdmZrcXN1VXdtL2tKRU00Nmwxb1NDVmtH?=
 =?utf-8?B?VUVMNUZBTVJ4RGNKTzBpN0VDZWhMMnRMdXBSSjNYdjBwSy9sV3F6QUhMdnMw?=
 =?utf-8?B?SXRtWkJja2FWeStvaUJ3RVY0RldTL2FhS2RmRG1LdHd4L2VlUks0OXl4TDFL?=
 =?utf-8?B?YmNFdHJsRC9vSmZmVUNzREhSMEZPK1JzRkdBaytldTdKVW9BY3R3bHY1Qm9a?=
 =?utf-8?B?MmlnRWx4QmU5R05YTWdPZG9ydnptRmxyMkc3eGphSTErSG9icjgrRGFXSUo5?=
 =?utf-8?B?dklnSVdIeUFnQ0xxVWZQVzRyQXZHYTVnNm1zdXg1UEQ5eEtjNmd0Tm9sb0Nu?=
 =?utf-8?B?Rm1YUzFWV1RNNjJsSHBwNnpCenhtWHhNOWl2WTRTdXV3UXZXbU1XYXBBRlNM?=
 =?utf-8?B?M3BGaURtN0RnOEtyM29RRGM4RHcySzVTaExSTU50ZVBreWlGejE2cjZiekxu?=
 =?utf-8?B?MXF0Qk80dlcrc09mWUtJb2lWWjNEdVRvamp2YjhidXdpcFBRbHdzdGd0RXd4?=
 =?utf-8?B?N2k3T2RLZmliVjZ4VTlhRWEzWjl4YTFtWXVUN3ZYdXNSYTZpY0RSUFUxb0Y5?=
 =?utf-8?B?bHhQVGV3Q1pVVWZVOVpZSkJ1YUhPc2J2Z2V0eWVrZU1yeCtUcTFUVHpmT0V0?=
 =?utf-8?B?YjZyc0JLQkNMM3hjOTJUWk9MQ2dZbnVGKzNXT1Q1RnI4RDlPSzY2d2tUVmtz?=
 =?utf-8?B?cWVXZThlekcwRytOUmJza21zbTNMOGpVV3NUT0dMT2gwcFBKa2YxQW1HSnlE?=
 =?utf-8?B?K0ltRGlLdEJJRkRjYmRsd0dEejhwN3BhVFBFY2l6ay9VMnRtZ0hlWHk4Qlgz?=
 =?utf-8?B?R1N2cmxmaHJpaG1qZW1rSEg1ODhFay9KTENvNE51eElQZFUvd0h6T3dvMnM5?=
 =?utf-8?B?dkppNW9UcWlWTGgrbzY0Tk5wTkw3c0xsdWhMWjFZVkZucUFLQldETExnSGhr?=
 =?utf-8?B?NzNOZFljQ0pKL1d2ZmpzcU93b3hHdVZzTW5PTnFGMVNuMlBVMmJzYW16WmdO?=
 =?utf-8?B?NXBNbHFHeUJCOHNKUWR3dFVzNGRRNkNJYWlwUjNFUkFaUkFpQUtHd08zV044?=
 =?utf-8?B?aTZ5SDRrSUFUVnNJRC96dDljUDhlSVh1QmhkUDliSk55T2ZZbnc3bHc4Ujlz?=
 =?utf-8?B?emFXeHd0VGRDZVAzOXZkZm9IaFJmTmVSZ0U3a0hXK20zajJzZDM5dHdOcWZp?=
 =?utf-8?B?bUFFdjRMOXVMVXgzZCtjelFMUU9YVVFzZEpZZDRpOFYrNm53aE85b29Id3dJ?=
 =?utf-8?B?YTM4UnlEQXBsYWVNZXVpL3UvL0Z2T0tqbFYvTTByRm9CTE1iYzZacGdLbW9O?=
 =?utf-8?B?VEZ3MTBaeVZTTkZZdTVxa1JpRi9MTkpMWVZHRUlnTy93VTFYUmRnWW9zaXdp?=
 =?utf-8?B?OXQzVmtBMUNDWGxXMUJRWmtEOTR4RlRZUlFsZEhvMTNRK2c2RmZtdDRydlBI?=
 =?utf-8?B?M1FVZVRlMXFUVHZBUUFxOVNzejB0Q1NyRExsUzY4WTJUSXYzTW1pdEpGOFln?=
 =?utf-8?B?VXliWGN2VVN0aHFMSFJ2ZDdXNGpPS08zVlNEUEJubm1XN2JKbnlaM1ptNWJI?=
 =?utf-8?B?cVpRWUhoSVBvN1o5VncycVNTNWc4dmF1SHhLVUNNV01JS21vM0dEWnVEemgx?=
 =?utf-8?B?a0gzNnpLSU8zeFNqbm4zRUlnVVNhVGc0NTJVc2ZIQzJTdFRpTjdMK2RTWFpO?=
 =?utf-8?B?dXoxbWRSL2p1dTErY1F4QjFVZkUwb21JMUpnT05oNkQyTFhOaU1GNnBVWmEr?=
 =?utf-8?B?SjVYQnlZR2F0QzVNSjAzSk81Z1RJamFvRlRuYUtZSnJ0WUpkTTFNZz09?=
X-Exchange-RoutingPolicyChecked: El4LFuhY92vaJRbbks96qXCIa7uJpcWtosiI9KQcmQr+GOXz3BvA7cnFzsCpVJFpKWH4xmYHrevYKjZmu1FIhY2PBDu77otwIGd/RpdYKtN0ImjoBflM3HkuavNYqKWGgLwnwyjFTpIISasFWwB4aD+otMOhrh8u17KMtVeAEqGnWsdvQb5s00tV2wHi2mch9VWo5kxZsRMtECbNBI8ihmLIYWOsO4sUED6pTb+eDeZrOPimqsvR0hcI58FRZstFiyb/vBToMQKV3cE5vjSmKypO9+tSMLPmLJQnCeYDNIAVf+70jRw84Abz8jz8H6HjHAPkP58hluLp6hW2Xq0YNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b81c3457-c79a-44bf-79c3-08df4aec1995
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:03:21.4521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvQ08MLymd6G3tXgxn+3YZCOrlknuBricG8A0/B5bWttlO8Dx3I14qnpNXUeATIche/5hz7qBqZkA6G7+21Jxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5314
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


On 2026-11-24 18:39, Matthew Auld wrote:
> On 24/11/2026 16:15, Lis, Tomasz wrote:
>>
>> On 2026-11-24 16:27, Matthew Auld wrote:
>>> On 24/11/2026 15:23, Tomasz Lis wrote:
>>>> drm_gpusvm_get_pages() returns -EBUSY when its HMM retry budget is
>>>> exhausted. This can happen when the range was repeatedly invalidated
>>>> or faulting was slow. This is transient, but the callers treat -EBUSY
>>>> as fatal.
>>>>
>>>> The behavior causes sporadic fails after a VF post-migration recovery,
>>>> if drm_gpusvm_get_pages() run in parallel with the recovery, and the
>>>> recovery took longer than HMM_RANGE_DEFAULT_TIMEOUT (which isn't rare,
>>>> as the kernel bound to VF is running on virtual CPU).
>>>>
>>>> Example signature of the issue:
>>>>    xe 0000:00:04.0: [drm] VM worker error: -16
>>>>    xe 0000:00:04.0: [drm] Trying to schedule after vm is closed or 
>>>> banned
>>>>
>>>> Convert -EBUSY to -EAGAIN in both wrappers around 
>>>> drm_gpusvm_get_pages(),
>>>> through a common helper. The rebind worker, exec, the pagefault 
>>>> loop and
>>>> the SVM fault path already have a retry implemented on -EAGAIN.
>>>>
>>>> xe_vma_userptr_pin_pages() can now return -EAGAIN instead of 
>>>> -EBUSY, so
>>>> update the VMA creation path in xe_vm.c, which maps this error to
>>>> -ENOMEM. Tis way the bind ioctl keeps returning the same error as 
>>>> before.
>>>
>>> Do you have some more context for how you hit this?
>> For log context:
>>
>> [   25.058112] xe 0000:00:04.0: [drm] VF: Tile0: GT0: readyfor 
>> recovery after migration
>> [   25.058330] xe 0000:00:04.0: [drm] VF: Tile0: GT0: VF migration 
>> recovery scheduled
>> [   25.058334] xe 0000:00:04.0: [drm] VF: Tile0: GT1: readyfor 
>> recovery after migration
>> [   25.058336] xe 0000:00:04.0: [drm] VF: Tile0: GT1: VF migration 
>> recovery scheduled
>> [   25.609533] xe 0000:00:04.0: [drm:guc_ct_change_state [xe]] Tile0: 
>> GT0: GuC CT communication channel enabled
>> [   25.738796] xe 0000:00:04.0: [drm] VF: Tile0: GT0: migration 
>> recovery ended
>> [   31.351935] xe 0000:00:04.0: [drm:guc_ct_change_state [xe]] Tile0: 
>> GT1: GuC CT communication channel enabled
>> [   31.386304] xe 0000:00:04.0: [drm:xe_guc_submit_unpause_prepare_vf 
>> [xe]] Tile0: GT1: Replay JOB - guc_id=158, seqno=0
>> [   31.386392] xe 0000:00:04.0: [drm:xe_guc_submit_unpause_prepare_vf 
>> [xe]] Tile0: GT1: Replay JOB - guc_id=158, seqno=0
>> [   31.390497] xe 0000:00:04.0: [drm] VM worker error: -16
>> [   31.394348] xe 0000:00:04.0: [drm] Trying to schedule after vm is 
>> closed or banned
>> [   31.402756] xe 0000:00:04.0: [drm] VF: Tile0: GT1: migration 
>> recovery ended
>>
>> For description:
>> This is a rare hit when executing VM TestBench test 
>> `vmtb@test_migration.py::TestBusyMigrationIgtExecThreads5`.
>> The test executes 
>> `igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate` within the 
>> VM, and while that is executing, performs a Cold Migration to a VM 
>> with different GGTT range.
>> After PF restores the VM state, post-migration recovery starts 
>> executing. In the failing instance I analyzed, the recovery happen to 
>> take 6 seconds - far more than HMM_RANGE_DEFAULT_TIMEOUT.
>> Since updates of GGTT are blocked during the recovery, timeout was 
>> assured. In that instance, the call stack was 
>> xe_vm_userptr_pin()->xe_vma_userptr_pin_pages()->drm_gpusvm_get_pages().
>>
>>>
>>> This looks like:
>>> https://patchwork.freedesktop.org/series/179052/
>>
>> It does change the same code path, and the modification is similar, 
>> though more complex.
>>
>> I believe the 179052 series will fix the issue I'm seeing, though I 
>> think timeout should be larger that the 
>> XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT if the current device supports VM 
>> migration.
>
> Yeah, Thomas was also thinking the 10s might not be enough for some 
> cases, but we don't have any data for non-NUMA cases, so plan was to 
> bump as needed.
>
> We could just use 30s for everything? Or maybe push to 15s for 
> non-NUMA? Or something else?

I think all VMs deserve 30s. So we can make the larger timeout for 
IS_SRIOV_VF and for NUMA. Or we can just make universal timeout of 30s, 
I'm good with both solutions.

>
> Also, not sure if we should respin that series, or do this on top 
> instead?

On top. There is no need to re-review the large series just for a 
timeout update.

After the series is merged as-is, our CI will no longer be able to pick 
up timeouts anyway - we get recovery time over 10s in less than 1% of 
runs, and the repro rate is below 10% even now.

-Tomasz

>
>>
>> We actually cannot tell what is the limit for VF migration recovery 
>> time due to VCPU used, but we've seen in testing rare cases where 
>> times reached 10s.
>>
>> -Tomasz
>>
>>>
>>>>
>>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_svm.c     |  2 +-
>>>>   drivers/gpu/drm/xe/xe_userptr.c | 16 ++++++++++------
>>>>   drivers/gpu/drm/xe/xe_vm.c      |  8 ++++----
>>>>   drivers/gpu/drm/xe/xe_vm.h      | 16 ++++++++++++++++
>>>>   4 files changed, 31 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>>> index bc6902b5bf57..ffc624171d50 100644
>>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>>> @@ -1624,7 +1624,7 @@ int xe_svm_range_get_pages(struct xe_vm *vm, 
>>>> struct xe_svm_range *range,
>>>>           drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>>>>       }
>>>>   -    return err;
>>>> +    return xe_gpusvm_get_pages_err(err);
>>>>   }
>>>>     /**
>>>> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/ 
>>>> xe_userptr.c
>>>> index 9c1dac0fce6f..423c190ac68d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_userptr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_userptr.c
>>>> @@ -10,6 +10,7 @@
>>>>     #include "xe_tlb_inval.h"
>>>>   #include "xe_trace_bo.h"
>>>> +#include "xe_vm.h"
>>>>     static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
>>>>   {
>>>> @@ -84,6 +85,7 @@ int xe_vma_userptr_pin_pages(struct 
>>>> xe_userptr_vma *uvma)
>>>>           .device_private_page_owner = 
>>>> xe_svm_private_page_owner(vm, false),
>>>>           .allow_mixed = true,
>>>>       };
>>>> +    int err;
>>>>         xe_vma_userptr_lockdep(uvma);
>>>>       xe_assert(xe, xe_vma_is_userptr(vma));
>>>> @@ -91,12 +93,14 @@ int xe_vma_userptr_pin_pages(struct 
>>>> xe_userptr_vma *uvma)
>>>>       if (vma->gpuva.flags & XE_VMA_DESTROYED)
>>>>           return 0;
>>>>   -    return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma- 
>>>> >userptr.pages, 1,
>>>> -                    uvma->userptr.notifier.mm,
>>>> -                    &uvma->userptr.notifier,
>>>> -                    xe_vma_userptr(vma),
>>>> -                    xe_vma_userptr(vma) + xe_vma_size(vma),
>>>> -                    &ctx);
>>>> +    err = drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma- 
>>>> >userptr.pages, 1,
>>>> +                   uvma->userptr.notifier.mm,
>>>> +                   &uvma->userptr.notifier,
>>>> +                   xe_vma_userptr(vma),
>>>> +                   xe_vma_userptr(vma) + xe_vma_size(vma),
>>>> +                   &ctx);
>>>> +
>>>> +    return xe_gpusvm_get_pages_err(err);
>>>>   }
>>>>     static struct mmu_interval_notifier_finish *
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index dd855876f571..6e6937870ac6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -2746,11 +2746,11 @@ static struct xe_vma *new_vma(struct xe_vm 
>>>> *vm, struct drm_gpuva_op_map *op,
>>>>               err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>>>>               /*
>>>>                * -EBUSY has dedicated meaning that a user fence
>>>> -             * attached to the VMA is busy, in practice
>>>> -             * xe_vma_userptr_pin_pages can only fail with -EBUSY if
>>>> -             * we are low on memory so convert this to -ENOMEM.
>>>> +             * attached to the VMA is busy. xe_vma_userptr_pin_pages
>>>> +             * reports exhausted HMM retries as -EAGAIN, which makes
>>>> +             * no sense for the bind ioctl, so convert it to -ENOMEM.
>>>>                */
>>>> -            if (err == -EBUSY)
>>>> +            if (err == -EAGAIN)
>>>>                   err = -ENOMEM;
>>>>           }
>>>>       }
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>>> index b1c5f940bcc5..ba24f2e6022e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>>> @@ -38,6 +38,22 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, 
>>>> u32 flags, struct xe_file *xef)
>>>>   struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
>>>>   int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
>>>>   +/**
>>>> + * xe_gpusvm_get_pages_err() - Translate an error from 
>>>> drm_gpusvm_get_pages()
>>>> + * @err: error code returned by drm_gpusvm_get_pages()
>>>> + *
>>>> + * drm_gpusvm_get_pages() returns -EBUSY when its HMM retry budget 
>>>> ran out,
>>>> + * because the range was repeatedly invalidated or faulting was 
>>>> slow. That is
>>>> + * transient, so report -EAGAIN to let the callers retry. -EBUSY 
>>>> would be
>>>> + * treated as fatal, and has other meanings in the VM code.
>>>> + *
>>>> + * Return: @err, with -EBUSY replaced by -EAGAIN
>>>> + */
>>>> +static inline int xe_gpusvm_get_pages_err(int err)
>>>> +{
>>>> +    return err == -EBUSY ? -EAGAIN : err;
>>>> +}
>>>> +
>>>>   static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
>>>>   {
>>>>       drm_gpuvm_get(&vm->gpuvm);
>>>
>
