Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782BECD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 15:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A3F10E3A5;
	Mon, 25 May 2026 15:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+0o7pCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB9010E156
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779722247; x=1811258247;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jbCbMT9rIC2Z2b/GTc8lqZF8yQeyo8gru2cX+ZUiDy0=;
 b=M+0o7pCC+VvRqFGwyLngYLOi7PsTLgnOx4fYQ+GFzodsg29H6CncID5p
 n7ufqOGUFLsbKLZYcZH4VkorkOib3t1bsdVe0nk5MERNqV80aHzclAmeK
 UHviWJk/E26esDTDDufgqt/r1pm1BPJLabJGPETHp+Tb+wQfV6jwWwRfx
 xgr1/e93v9upeSAyEV/N3IJ3S6dI0hSKTET+PH2ROxIB+RDxFMHBUhEH/
 E34eNfK9SDLQ0PhBLUi3rZwfX/vpHAugwWkLwNgEApLMswUcLDRKfdq8X
 9q+798gOiu8Kk3JlbvTQIVFNv5uvuoVO0/qj/x+FMWnh0f0hhjMbd6svy g==;
X-CSE-ConnectionGUID: WHHSem7DSWGrUgKqN+vJqg==
X-CSE-MsgGUID: tQwySIa8SfucmXMR/gIAng==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80528218"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80528218"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 08:17:26 -0700
X-CSE-ConnectionGUID: imEniEcDQXqJAndsq5jxMA==
X-CSE-MsgGUID: kl5Dp+dLSK2AHjD5uqVbPw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 08:17:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 08:17:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 08:17:25 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 08:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLr5W2SiksG6n7rWQeXmb8I69guWDra/0O+LbC+QtEUSuZjojo0jkEmjq6WEX7ZlJNH8/3p+vw7XlOPPUpA36D/lmNSAa9ilmrr2lWM2GqHGG4nfPpxyZVzJlSoLAN23icmS8mkhbIJuRBuESe/gbXXAAPZTwTHG5iiymFQ7alTylMStk/LU+4aT1MAbIGERx3FMbb7os3xj+foz8yeR1SwMyw8kPGXZ9wVO5DxXT3/jELn1HGvqmu7BnK4gGvLmEDhB3YtlifEmNttnaxEBsXXHSQ6S5k5AjkBIIKtLVYWJtRo+0EwnIcEuRzKr93upAZ5fUWzhI7clP1AbkWD3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbCbMT9rIC2Z2b/GTc8lqZF8yQeyo8gru2cX+ZUiDy0=;
 b=J4zrFgg9XvpBUMABAtm0nfwE90OqOhntTFB3YkGFw3uYaxgQbWFtK2xZai+lLX4Kyf2EiJdlTpIVB/VsVwp+Y+GSLohCuzUo18qThToj8PUegwpfCSuvle6KjOoI76D8Txsm/+6dynZVq+baafsqlLEVs3SPO51QUQcpj6ZBv2DXKkGhD3TKu3TDwdvguNoeUy8aV0PVFOcjDL+3HSV3nJvsn6NhSot9nHFMwruRDn5Rdkllff4mwpCZ77ePf/benQiUONgJ6jUr8l38cUSc1SUC1xdOYVt7hp0gU3DpkK5zt/dYe7esq9i/R7QNfE2AgAbOHGXL8nF2QeuH8Tkorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 15:17:23 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 15:17:23 +0000
Message-ID: <29b9eb69-98a5-4fc0-9c89-9cab377b670c@intel.com>
Date: Mon, 25 May 2026 18:17:18 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/xe/mmio_gem: fix fault handler and destroy path
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Elbaz, Koby" <koby.elbaz@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
References: <20260525125801.975038-6-ilia.levi@intel.com>
 <77634462951f6f3a615a3032e0c69f83b5842f66.camel@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <77634462951f6f3a615a3032e0c69f83b5842f66.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0030.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::16) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: 08062181-fc7d-43be-32e2-08deba70b8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: fXDHG/9cF/AIiAMp+bgOJqQmfjAsgGCUbm6O9sR2SRDsTg5urfoX+cceZChGvQEJZsfH9H9d5bd2lxaPZztWlhJXxAFPJuDonnVVTzpYmaANiAOW2i5yAYHwtuJ+1iQVfXBqjBdPhiu9o2OXDruVXbg+9jxv4Gg5mJP1BPQd0cKmjG2cdfKz/CdKKbDOf1yvI0SGdvKvVr/HaJuiLI0j5n/iYIQiaIf1j9fsZZ96AT4gkkfs7SfOoBxY4M+G4ejEoWeWau9sprSQ/9IWW0klS8OH6nnW5UtV0ZzEqY47ta1mJZeZjb5PFGTacz2ZUtXFnHCBRDfsGeN1PkJUuj1vnRiWNiE9JGV0lyyDxtC6OG1SJmomZ5TpSwqk9MpEw+R10xXdHzpIJryYwbaZimbEkOV004dq7CNKTi27Rw+yLd3NtpadiwIIdMP9DsuD6pU2EtOOwWq9CvZlceUUthkUDT+ZE2T/mg57GOSzL0+w3BFdHO1tLgFgjJ9M7F0SMBWwT3xCjWGv1ObXWT1APUJZQ7OKnZcWiKuWvzxj+WXLmvUmUO1EpFkhWKoP15BVtU3jyIwJkdguLZH98P2OzBPo5v3zYbJwnXlWnyizNS5D0t1lzVAm15chaiwdYOvpWfjQ/YI2afqWPf8ikV+ojQZ9rE5XjKjKDlPI3hs5IokxryeXVnPueu+DqNKcUlr2l619
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnhINjYxL1gvckNXNEZBcWVkVmwzZUs2QzlDd2lvN1lwNHBoRnFDSDltSEZQ?=
 =?utf-8?B?VG1nUW5yUkEyWHcwbU1iWHRCbkRXbVlZT1hmYnpHbHEyZXJuQldXY1VBeURB?=
 =?utf-8?B?VVZydEc2U2hJLzBZY0w2cDhNZUJPZFBKWnZMME15V1BacUJSc1ZrM1cxWmZr?=
 =?utf-8?B?N1J5cXozbksvNHlObFZuWm14cmtScEFoYmtUQjhNTjdxZVM4ZmlBNytPSTFO?=
 =?utf-8?B?dlVqTVJVVS9RcHA5YmYrUlRJNm5qZE5tYkVUYWRhRGVYY2Nka1ZyaEZnaDVo?=
 =?utf-8?B?NGNTd1FjdnlpTlpQWWZrY21CeExzcG9pVU8weHUrYlFGMGhhMjM1R3lpaWRD?=
 =?utf-8?B?ZEFMM0UyWnRKbm5kQ2QwV1krVTIxUHdZcE9xc2I1d0xRNWhrNG8yM25LYnZG?=
 =?utf-8?B?a0JQTUZzb3EzektlcFgveW5FbW56TlJucitQRFFKdmV0Q3pzU3hTSmZqVHJu?=
 =?utf-8?B?UUhjRVJkc3dVUDNWWlhmZk9teDlqQk9zSUpCUmFKb2FVUzBnU0FXTytXdTJQ?=
 =?utf-8?B?NmloNTBQVGs2NE9tZDQyMW91WXZGanROWCtFUm14b1VmNjdNV1lLT1V3Uk1k?=
 =?utf-8?B?N0ppWFlrbWhRbUpwaFdOc1lJajJhZ0RpRlhpWHBpdW9YWFlvd3I2Y3VRWDhv?=
 =?utf-8?B?YyttK2l0OTdDWXU5M1pXcWhqSU9uQWtaMVlPL2o4d2FPQVhRYUFVQVpoTGlr?=
 =?utf-8?B?eDdYczdMUXhBay8vTzVuSzN6dHB5eHBPVmpSS1ZtUzNadE5NK005bzhld2V1?=
 =?utf-8?B?cThrM0JYWTlLRHdRdmw5WlUrd0tSVDFNQkhlaWdjR05ZRVlxUU5XOGIveE9v?=
 =?utf-8?B?dDU1TjhydVR0NHJhVFd3UEZQcWNha2xqR1M1UWtzNmkyajJYcnhXT2NJWmVK?=
 =?utf-8?B?dTE3UU9YaEkrUUdITDRpcTAxdlJsTDc4NVpLVTVHY25rcnphN2FlcVdmbWpq?=
 =?utf-8?B?djRxVndJMHZDME1Pbkpqam03RTFtQThpeWxIbVFjOHJKZXF3bFJDQUJTS2Ni?=
 =?utf-8?B?RmtiQm1XcGFhSTR2MXoweVdOS0ViY3M4dmFoNG4vY1JsM0t4blVvYk9sWUlq?=
 =?utf-8?B?UGM3VCs2c1dSZFNsaThUczBnN1dyL0M2emlFaDZZUmFHazNGaEdQa1FFY3Nm?=
 =?utf-8?B?WGhYZDk5WURFZ1F2MjNFSm51eVdpemNtbElNTWl3Q1Jua3RQdEoxWGRzZFZj?=
 =?utf-8?B?bUJEZzZZUndsVDd0U210bVNYeUZZYWhXMWpHMVBGZFZNaXRUam45dHNQd1NH?=
 =?utf-8?B?N0JidTN4ZGMxTkp3aDRTaVdIWlFiUURteXZvOGNWd2V5c3Nya1ltMmptWUQw?=
 =?utf-8?B?azdsZXBJaEhPdVBJOU9pM0ZZZEJnZXBORUVBTkYveGZ3aHhZNnJUZW9tRnVL?=
 =?utf-8?B?Z2FuWTVRdHFRRmpkUW9iTFNqdlhhOVNLUkNJb0VzOGF1eVBpR2NRZWhKRmJL?=
 =?utf-8?B?Si9uRURIa2wyeE9nTHNSTGxlSG5NTnZYUlczTmttRGY3V2k1Qzk1RVJJZWkw?=
 =?utf-8?B?bDdrbC9ZZ2lTKzAwaEZEWWk4WTFmQURsZ0pxWnMzd1NJWDdVaDJycjV2ekND?=
 =?utf-8?B?dVZKSW9HakpuMEpaWjNzVlVxT3pjaUkxVnRxWGVlTFVDOENwKytrS1R0NUVy?=
 =?utf-8?B?eDFxVzBhWUU5SlB2ejJrR2tTVVJ0RGttcmlDQ0svY3ZTTGNLeFJQMjdmVStr?=
 =?utf-8?B?RU9waFJHV1AweExkWVBvcVpJTWhxOXZZK0tuZXdNR3dDcEZSTWdNa1dsNTFX?=
 =?utf-8?B?TFdaMW5ZWGo5aEE1YmViazZjMGRGTVpXN3ovaytDd0krZkNBNGJUUmlqWTI3?=
 =?utf-8?B?MDRrLzRvTUFLWWRJWkZXNlRRcEU2ZTdZNk1GbzRkdXUzRGc5SG1hdUp5dU5B?=
 =?utf-8?B?b2hMVlVSMVYxODV0ZzFDTDJ3dXovZEJsMXpjWW42RDVVMlVWeFN6Y3NacmYy?=
 =?utf-8?B?eS9BaDFxM0xLcmVuNmlJNkRqTDNmR3RWRFFLa3VMcSsyNGJaUjVNVEI1Wkpk?=
 =?utf-8?B?aUNrUlJZOVQ4U01vZWNpV29HUE9aQmo1RGRvWk1wOG9jdWhHWWJEbGo3Z0cw?=
 =?utf-8?B?TVRDT282MkdaRUcrbHNlNkhOazRpbS9RY0ZxUGVFdmMrSWd3bmJBYVA1SjNV?=
 =?utf-8?B?RXhYckMxcGFFcGVLcXVsZWlaeFNxMU1zVjV2bmh2cHNZNmZOZnA1YzNIWVU3?=
 =?utf-8?B?Nm9ldXliZXRGQ244ZURQQ0FyMkRncGlpRkZCd1cwZ0hSS3NKVit5M1Nsb2ZS?=
 =?utf-8?B?dkRrRmYzT2tqNi9GeEtRenlSbW50UjNzMGpZNmtncXkzL1NUSkl5RzFCVS9y?=
 =?utf-8?B?MU0rWGVwU28wS29pKzFrMjZwK1MxQUlvKzh3SjJRQkVMYWZzcHl2dz09?=
X-Exchange-RoutingPolicyChecked: BrvTuqweOCWIMTRsWA1+2AOVtu2v19TWm+6JQWDUP/8vjDlZGYHHu8z55F2vnP2bcyCfMj0H/+p0Xv1v8w8lr7lG+Me7zMZC7Pk5BZVNYDxDRo+/1d3vhnm04aIMvYYVnqSQzapODWe87nOA4scd/bQO/+C++NeAzNGLJD9++eEE7dB7OBzo0qIjiGYtB1JwNH5BSl6g45OoildL8FSRtYNi2cBbckZtbiY1Cb3h9pJDs/LvfCejMCMCO6ojsnJEBlRBtCRBuRxAcSno5fNRpDKp6M7fqoOjav+nirkGU9XYp5BRyTT9uHoqQ2HKoLlRuhXizR6DwOR2dtQ1z0T/IQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08062181-fc7d-43be-32e2-08deba70b8a4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 15:17:23.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFMEHxcYn0bxVA6r2on6TPiCZ5A5tmf8i3HXgx2fI+pFm9yT50EphEhdMjl+GCV2SWQcoJ3l0XMGExnFfF8Ctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
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

On 5/25/2026 5:11 PM, Hellstrom, Thomas wrote:
> Hi, Ilia
>
> On Mon, 2026-05-25 at 15:58 +0300, Ilia Levi wrote:
>> This series fixes several issues in xe_mmio_gem, introduced by
>> 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions"):
>> split VMA fault handling, a rb-tree leak on destroy, dummy page
>> accumulation, and use-after-free / MMIO access after destroy.
>>
>> Ilia Levi (3):
>>   drm/xe/mmio_gem: fix fault handling for split VMA
>>   drm/xe/mmio_gem: cache the dummy page per object
>>   drm/xe/mmio_gem: fix destroy flow
>>
>> Shuicheng Lin (1):
>>   drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy
>>
>>  drivers/gpu/drm/xe/xe_mmio_gem.c | 85 +++++++++++++++++++++---------
>> --
>>  drivers/gpu/drm/xe/xe_mmio_gem.h |  2 +-
>>  2 files changed, 58 insertions(+), 29 deletions(-)
> Could io_remap_pfn_range() be used here instead of a fault handler?


Hi Thomas,

That was indeed the initial implementation (see https://lore.kernel.org/all/20250609095938.16782-1-ilia.levi@intel.com/). 
The fault handler was suggested by Tejas and Matthew Auld (CCed) to prevent violent killing of the userspace with SIGBUS.

- Ilia

>
> Other drivers sometimes export mmio ranges with doorbells with dma-buf.
> Is that a future potential application here? Any implications for the
> design?


That's an interesting idea... But will that allow cutting the access to the registers from the kernel side?
Won't we have to replicate the logic from xe_mmio_gem_destroy() on top of dma-buf abstraction?

- Ilia


>
> Thanks,
> Thomas


