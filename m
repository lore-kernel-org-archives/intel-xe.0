Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31DAC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 19:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E68113F2F;
	Thu, 18 Apr 2024 19:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K10qMIr8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F456113F2F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713467824; x=1745003824;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=0U8zfpP+EI77P9M4RIHlOjk0dSe4Y+FYi8TkX0P05WM=;
 b=K10qMIr8blbQu0w9fduPMCjKwZpG7PDQsW5nAJ8FqU1sfS6ukOcNvLP7
 UvjqoNOim37vTtwJ4EE1kc3cH4qMWQ0qiPOjVYTNiJXyhsRNRMMJCUiO7
 YwZFQU2nckHM1c+mHbozrtuoyv+VaeIMUmMQURyTabxzP1XBqO/9Dgu6d
 WLwlsvae3rONguBxFqeH1BL3nrmB2o+ZDm07eshGuzvBH1alpKYMIiS/I
 F2YOywtYp5SVJEKbnrGH+K1oDrCjGwfZd8TDdangXVH/z/n9zyPoQ8Gkr
 q4yCbwX5pGSOvixdnfvExq/+cbkAUg9Dhn1gvI5b4tDmyPfCaOyOrZyT6 w==;
X-CSE-ConnectionGUID: ++yfkVDkThyL8YLDFnySrA==
X-CSE-MsgGUID: 3TpzlpkCS6uT0xlY47acZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34438007"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="34438007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 12:17:03 -0700
X-CSE-ConnectionGUID: zzjYahKCS+SU1Nw/NYDclw==
X-CSE-MsgGUID: jH8ow1fDR/6ZD2AuxMezUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23602695"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 12:17:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 12:17:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 12:17:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 12:17:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 12:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UE6ag9NvLPhbO1VN63kqg8uZ/7pGF8EIXpw2eQT0RAHxwzM2fyoCqLhcaBhXFGOk8Ik3pz5B+OfiLfu8GJ8Yxsrr8QvoZNVFLgLPGrNJVnasmad+unQ75os26v9658P6jN225xp6AHyoWCQdscDHtQB2pLJC/Txjgy3X2JxLO/lxIXAKpY8SKxBb1TxYyVDjH541ecrxUkMLhfzKmNZAYkCbJmQpBuqJ1plN+7t90CbkptwMAu6tWCmcoQODtN+AvjIWo5QVQnsivzC3Wg3C7haD/qFI4aHG9XrNpr+b9csntr+/DdEoT64YADaD9Ekr/vfln3Najor2nJ96oM4yMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0U8zfpP+EI77P9M4RIHlOjk0dSe4Y+FYi8TkX0P05WM=;
 b=DZ4ooOEYTARkQAHxSmHA+DPzjYn3hjWzm7jKrB8ZjAEQAZiFzs5oLx/DOMyKBZKiZfVZgtuyWNXUS09kpp2c5uO6Jas0GOlads7t8ANFa8qxNwPgpPOr0+/9+lmW+LLo+NfyfLI0peQCw2WLQeEw8nIqnv6XyjSs4j7w/e9sS2MwUx8cnfit6Bkbc8S9fvtRCyNTiVJyR41BSHxhFr2LKiONIlXoXZQyWEVWEwi6Wd9ULCudhRkFAOenD4ywt7Cp1qtJEOzmVa9tlh2eh9+5SyDHDC89ApgYFtMkyKvYe8oozHzTZrcvbxfaqBN1tHdIfoFeQbvEGhXAotZ1YdzdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Thu, 18 Apr
 2024 19:17:00 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 19:16:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 2/7] drm/xe/guc: Add XE_LP steered register lists
Thread-Topic: [PATCH v7 2/7] drm/xe/guc: Add XE_LP steered register lists
Thread-Index: AQHagIcTJ6Bx52/lYkumrPWoR8siZrFuiOeA
Date: Thu, 18 Apr 2024 19:16:59 +0000
Message-ID: <f91944e18c2e7e678c9436dceef8793e4782fa5a.camel@intel.com>
References: <20240327204041.178879-1-zhanjun.dong@intel.com>
 <20240327204041.178879-3-zhanjun.dong@intel.com>
In-Reply-To: <20240327204041.178879-3-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA1PR11MB6966:EE_
x-ms-office365-filtering-correlation-id: 7056adce-e10b-4a2c-25ce-08dc5fdc1f1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eloU2mE4PB7p74QgRcoPtk1l9Yf9RDs3npNnghJpaHK0cDPswGmGNg+VqlsSIOLpsZz7mi8JE86Awwcsef7OwQJDCuUYsADzOXL6T2choUPJ5veU20r3glkyOlHCW2M0DHJInyAZmpFW6dJz35GAtmMpM2K4ruVndIOn45vy8FvRqQlfeaUbF0TMa2NaKqCEtaE+QzCdSZZ4fFcOpqNi6q5bqyhMQgSZdqpMHIeK1RyR9MR3DWy0XkpXOFT7fIuc0FBIInJYnkKc2QhGsie0/1J+H13DRNrDnYmVTx2hPm1XRJlGna86P/Ozeh/VT89lXh2NvlxUONdComsz5DhmOZTFjEBYEmTvkzr6TwYyL38RK1bVtIVGr6hhmyO4YaN2BlYDin3wkabhtWbizONM/EgL1Xyw6g+WFGRrznxmfHNGu6IRxTVRfbkuThyFYe1WkUDLZsW1c6fv+ctHxG7VtQXlUGjelt+iojs48bOavHl3sBVVmSYSa7fo3wnPq/M2fNeG8EV+BHSKTeFs0FR8iXUTuGSBJIqESDwPed2Z4cJAcVoZHQ8qv38m+//od6jGcSIBcBGF1Kbo0JaynoZeDtPm6p8ZlLg5Z8K/lH+2DkpxMX7LekXav53PgCIp7F7jD+GyInRgJ29asW6Yvid6nmsDuAW6KaPKxt6qx8yGER+dsdfC4QxwqsKfGNRgg4SfZFHXqEfWNy2+i1LqmVj9x91fT7yq+LHznF/ZTLEeV1o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDRlS2FPUmlrWWJBM2ZjY0kvMWs2QUJNeGZoR1QwT3FFa2FINHRTNE1MMjQw?=
 =?utf-8?B?amdSUFVrQ0k1cTBVSnZRNVNrUVhkZTRsVU81cmlEdDcvbzFockR6bm96Mnk3?=
 =?utf-8?B?aGJ6c25TOW55TVYxVkwxWUxxTGZVNHlIWEVycm9EYXN6Ryt4NjUrWkpZaHB3?=
 =?utf-8?B?UDVPTCtqUGIzRGcvTW11UnU1MGlJbWFnbThCUUJaRVJDdzJyWVF0bW0weHk1?=
 =?utf-8?B?cXJJVWl1T2UvdmNpZDZpYmlVamNHbnJCa3dmeDFZRXpIeGlJcC84SGkwcTZu?=
 =?utf-8?B?bzhETmJZQnErUUhhYmJ3b2RCRGxPU2ZzTGhhTC9YMHYrYWJaUm5WajJtOHh6?=
 =?utf-8?B?UGJMT3RERVRwMk9sdXJnMHh5Ni9oOTNaOHVuV2U0T1h5Y3lCZGl5N1pzWTc3?=
 =?utf-8?B?cTl0RmVWVU84NDBMSHVGdTlWQXBpcG9iQ21ra0N5YWQzNXNXak1qN3dwa2x3?=
 =?utf-8?B?cktNYjRoWTJVL2RRT3IxR2llVlpBdC9YK3ZuSGZjaW1jVG1LUjJkQ2R5NjFn?=
 =?utf-8?B?Qklab0JmWGVnMkhISWFGM29OVm12ajBUVkFOM3BBZTJIZko4cThMVmZhTlRX?=
 =?utf-8?B?Vmw4ZElwN3ZkWCtDSUliTVhuMHlDMm1lSkJKZEdGejdteHMxbmdjKytqNW9M?=
 =?utf-8?B?bEwxQk9jRHZiNUxjemFhVktxMGNubzFxU25jVTZOT3pwQTNKdnluKy81Y0Rt?=
 =?utf-8?B?ZmF5dFh6V0FhWXFoeWwrTG5ySmYxaHExb2VMWklESUtLa2VGVXo4MW1HMVln?=
 =?utf-8?B?aTl4UGpDQytwaEFSRStNQXlVMEpGak9sbTV4YzZ3bUxCM0QyOG85RlFNVzR5?=
 =?utf-8?B?K2FINjVaQzBUK3VuRTNwdDlPOC9PYjVEUldLVVFzblNadFREdkhlTmlZWEx0?=
 =?utf-8?B?a3FBM2Jic0crZlh0UEZ4eEtFWXdGNmsxem1EQlB1SWlaRjhDOUgxb25rM1Fw?=
 =?utf-8?B?Ny9SeGtNN2J5dTZZeTRCTVowRjBKWitNUCtKQ25XbFl2WEdtYUF6UDVqWk9O?=
 =?utf-8?B?b1BsMXAzUW9JKzU4Qm5jd2RrK2pMWkw1QTYyamJ2Y3NqSTRPYmR1REpXZERn?=
 =?utf-8?B?OU5HaFBSK3hvK0hCc2ROSjRvYkVibkdTZVlBOUJnRGtKMUI1ZzNLckM0dE5G?=
 =?utf-8?B?T1V3Y3BJUm9rai9wVHQrVzNhWE5xNVdUdjNkTUErZ1BxZFJOS2Y2RkJtSTJr?=
 =?utf-8?B?UEVoYnZwTEE0WVRZblM1SlA0K21yQ2w5SGZUZEd0ZWN3NjZabjRDNVk2MEdQ?=
 =?utf-8?B?djBuNGFuWWpSMlRQZmsxbTBmekd3UmlBZjhKREVQT0J6cDlyMXJRdy8xVlRw?=
 =?utf-8?B?RVBkMkpkdGlwQnVMTlZGK2dRWkFkYVNzSDFhMGdLc0cvaEZaQ2JYVzdFRC9j?=
 =?utf-8?B?UHJsTmg2ZzhQdk9CcHRaRTB1aGFINVI4bzI3ZFpCT0ZpaVNXWlJNdDd6NjBz?=
 =?utf-8?B?eXVROFdZbytiekhiZXJISWxmZ2IycytxcEpzTlhyc2JuVGdBQ2wxQkNuNnNW?=
 =?utf-8?B?ZzQybVpNSlY1dVV6ZU83dmJPZ0NXOTZvN1BLa2JvdUIwNFd3ai9kUGQxOVM2?=
 =?utf-8?B?ZkNYZUNNUnU1ZDdYTlZlR3BMV0N4d3NBSmpzUTJjVjczdzVGQUI1cFkySFA4?=
 =?utf-8?B?MkVsRURBY1lhem5KYTduQVY4WmV6aW9xTDFpWjhia25nWTY5MEFpZXRWS2pX?=
 =?utf-8?B?T2pGaWVjNDhwU05qZFgzZ1ZnYURKZDB0RXZHaXhZSE0xWXROaXBnTUpqL3A3?=
 =?utf-8?B?TCsxYk42ZUZFa2FEd0Urck1Oa1pwK3l0YjVTWW1OOVNzT2czUnRJOVFQZHZq?=
 =?utf-8?B?MTRLR0p5aGNlUEdXM0t0NjcwRkNjaEdQUGRMSlFZSXpzMSt5WFFyR05NQ2hh?=
 =?utf-8?B?SGttQW1nT05oaW9mVFV6TzRXYzZKVDMrTnlYcnNkdlpNR1Z3dWI0alRDSEpK?=
 =?utf-8?B?emtmdjdpMVM3VG5jVVhpOVlHdjhFNWFUVm5Ld3c2aXQ5eEk4b0dQWHljaXc3?=
 =?utf-8?B?T2lBakNvMGRvUnROWFAzVkdVSDVnUFl2QkRjOERmWHBnUnViQmZjNWRabjBW?=
 =?utf-8?B?VThQV1BWMWJESnNFbU1qTmNFelpHb2s4czZkeDhzU1pzZ2hSV2tBK3V3WmxJ?=
 =?utf-8?B?N1RhbHZJaXp6RUxoZ0VRRDdDYkQxL1NYOFlwOEh1VmZwSEFHS0VQRGxLbEFv?=
 =?utf-8?Q?u6yzL+8uEZ+VbNur5SwcX3o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF8375245AC2D94FA607425064F2905D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7056adce-e10b-4a2c-25ce-08dc5fdc1f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 19:16:59.8998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOuwVA7+V0PJrS2S3y5EYbGIdUO6gRCN1cRoDhlSu5obmdAL3a3b+slZl6Dy1UF+7uvTDdMs+0jcKWxE6YvU5Tukk07x9ccjQ/XKiIIqbDCtJhhxzXcoYiDs5FV+xsEx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
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

T24gV2VkLCAyMDI0LTAzLTI3IGF0IDEzOjQwIC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6Cj4g
QWRkIHRoZSBhYmlsaXR5IGZvciBydW50aW1lIGFsbG9jYXRpb24gYW5kIGZyZWVpbmcgb2YKPiBz
dGVlcmVkIHJlZ2lzdGVyIGxpc3QgZXh0ZW50aW9ucyB0aGF0IGRlcGVuZCBvbiB0aGUKPiBkZXRl
Y3RlZCBIVyBjb25maWcgZnVzZXMuCmFsYW46c25pcC4uLgoKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUvcmVncy94ZV9ndF9yZWdzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94
ZV9ndF9yZWdzLmgKPiBAQCAtOTQsNiArOTQsOCBAQAo+IMKgI2RlZmluZcKgwqAgRkZfTU9ERTJf
VERTX1RJTUVSX01BU0vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVHX0dFTk1BU0soMjMs
IDE2KQo+IMKgI2RlZmluZcKgwqAgRkZfTU9ERTJfVERTX1RJTUVSXzEyOMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoFJFR19GSUVMRF9QUkVQKEZGX01PREUyX1REU19USU1FUl9NQVNLLCA0
KQo+IMKgCj4gKyNkZWZpbmUgWEVIUEdfSU5TVERPTkVfR0VPTV9TVkfCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9SRUdfTUNSKDB4NjY2YykKYWxhbjog
aSByYXRoZXIgd2UgZm9sbG93IHRoZSBuYW1pbmcgaW4gdGhlIGh3IHNwZWNzCgo+ICsKPiDCoCNk
ZWZpbmUgQ0FDSEVfTU9ERV8xwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgWEVfUkVHKDB4NzAwNCwgWEVfUkVHX09QVElPTl9NQVNLRUQpCj4gwqAj
ZGVmaW5lwqDCoCBNU0FBX09QVElNSVpBVElPTl9SRURVQ19ESVNBQkxFwqDCoMKgwqDCoMKgUkVH
X0JJVCgxMSkKPiDCoAo+IEBAIC0zMjMsNiArMzI1LDkgQEAKPiDCoCNkZWZpbmXCoMKgIElOVkFM
SURBVElPTl9CUk9BRENBU1RfTU9ERV9ESVPCoMKgwqDCoMKgwqBSRUdfQklUKDEyKQo+IMKgI2Rl
ZmluZcKgwqAgR0xPQkFMX0lOVkFMSURBVElPTl9NT0RFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBSRUdfQklUKDIpCj4gwqAKPiArI2RlZmluZSBTQU1QTEVSX0lOU1RET05FwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX1JFR19NQ1IoMHhlMTYwKQo+ICsj
ZGVmaW5lIFJPV19JTlNURE9ORcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoFhFX1JFR19NQ1IoMHhlMTY0KQphbGFuOiBiYXNlZCBvbiBodyBzcGVj
cywgd2UgaGF2ZSBhbiBvbGRlciB2ZXJzaW9uIG9mIFJPV19JTlNURE9ORSBhbmQgYSBuZXdlcgp2
ZXJzaW9uIGF0IGRpZmZlcmVudCBvZmZzZXRzLiBMb29rcyBsaWtlIGl0J3Mgb25lIG9yIHRoZSBv
dGhlciBiYXNlZCBvbiB0aGUgcGxhdGZvcm0uClRoYXQgc2FpZCwgeW91IGNvdWxkIHVzZSB0aGUg
bmV3ZXIgb25lIGlmIHdlIGFyZSBub3Qgc3VwcG9ydGluZyB0aGUgb2xkZXIgcGxhdGZvcm1zCm9u
IFhlIChidXQgdGhhdCBpbmNsdWRlcyBzb21lIG9mIG91ciBpbnRlcm5hbCB0ZXN0aW5nIHBsYXRm
b3JtcyBsaWtlIE1UTC9BUkwpLgpBY3R1YWxseSBpIHdvbmRlciBpZiB0aGlzIG1lYW5zIHdlIGhh
dmUgYSBnYXAgb24gaTkxNSBNVEwuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2NhcHR1cmUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5jCj4g
aW5kZXggYmM2YjY4Mjk5OGUyLi5iZmE0MTBmM2E3NzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2NhcHR1cmUuYwphbGFuOnNuaXAgLi4uCgo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19CQkFE
RFIoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqAgMCzCoMKgwqDCoMKgIDAsICJSSU5HX0JCQUREUl9M
T1czMiIgfSwgXAo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19CQkFERFJfVURXKDApLMKgwqDCoMKg
wqDCoCAwLMKgwqDCoMKgwqAgMCwgIlJJTkdfQkJBRERSX1VQMzIiIH0sIFwKPiArwqDCoMKgwqDC
oMKgwqB7IFJJTkdfQUNUSEQoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLMKgwqDCoMKgwqAg
MCwgIkFDVEhEX0xEVyIgfSwgXAo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19BQ1RIRF9VRFcoMCks
wqDCoMKgwqDCoMKgwqAgMCzCoMKgwqDCoMKgIDAsICJBQ1RIRF9VRFciIH0sIFwKPiArwqDCoMKg
wqDCoMKgwqB7IFJJTkdfU1RBUlQoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLMKgwqDCoMKg
wqAgMCwgIlNUQVJUIiB9LCBcCmFsYW46cGVyaGFwcyBzb21ldGhpZ24gd2UgbmVlZCB0byBhZGQ/
IC0+IFJJTkdfQlVGRkVSX1NUQVJUX1VEVy4gQWxzbyBsZXRzIGNoZWNrIG9mZmxpbmUgb24gdGhv
c2UgcGVyIGVuZ2luZSBQU01JCmNvbnRleHQgZGVidWcgcmVncywgdXNlZCB0byBiZSB0aGVyZSBh
cyBkaWZmZXJlbnQgcmVnaXN0ZXJzIG9uIGxlZ2FjeSwgYnV0IGkgZG9udCBzZWUgdGhlbSBpbiB0
aGlzIGxpc3QuCmFsYW46IG5pdDogYnR3LCBpbiBvbmUgb2YgdGhlIGVhcmxpZXIgcmV2J3MgcmV2
aWV3cywgaSB0aGluayBzb21lb25lIGFza2VkIGFib3V0IHdoYXQgdGhlICcwJ3Mgd2VyZSBmb3Iu
CkkgcmVjYWxsIHRoYXQgd2UgaGFkIGNhc2VzIHdoZXJlIHdlIHdhbnRlZCB0byB1c2UgbWFzaywg
YnV0IGkgZG9udCBzZWUgaXQgbm93LiBJZiB3ZSBkb250IGhhdmUgc3VjaApjYXNlcywgd2UgY291
bGQganVzdCBjaGFuZ2UgdGhlIG1hY3JvJ3MgZGVmaW5pdGlvbiB0byBhdXRvLWluc2VydCB0aGUg
MCdzIG1ha2luZyB0aGUgbGlzdCBhIGJpdApzaG9ydGVyLiBJIHBlcnNvbmFsbHkgcHJlZmVyIGhh
dmluZyB0aGlzIHJvd3MgdG8gYmUgZXhhY3RseSBhcyB0aGUgc3RydWN0dXJlIGlzIGRlZmluZWQg
c28gdGhlcmUKaXMgbGVzcyAiaW5mZXJlZC1tYWdpYyIgYW5kIHJlYWRlcnMgY2FuIGVhc2lseSBs
b29rdXAgZXhhY3RseSB3aGF0IHRoZSBzdHJ1Y3R1cmUgaXMgZGVmaW5lZCBhcyBmdWxseS4KYWxh
bjpzbmlwLi4uCgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rlc2NyIHBy
ZV94ZV9yY19pbnN0X3JlZ3NbXSA9IHsKYWxhbjogd2h5IGFyZSBzb21lIG9mIHRoZSBuYW1lcyBw
cmVmaXhlZCB3aXRoICJwcmVfeGVfIj8gaSB3b3VsZCB0aGluayB0aGF0CmV2ZXJ5dGhpbmcgaW4g
dGhpcyBwYXRjaCBpcyBmb3IgeGUgcGxhdGZvcm1zIG9ud2FyZHMuIG9yIHdhcyB0aGlzIGFncmVl
ZCBvbgphIHByaW9yIHJldmlldyBjb21tZW50PyAoaSBkb250IHdhbm5hIGNhdXNlIHVzIGdvaW5n
IGluIGNpcmNsZXMpLiBPciBkaWQgaQptaXN1bmRlcnN0YW5kICJ4ZSIgLSB3aGVyZSB5b3Ugd2Vy
ZSBtZWFuaW5nIFhlMiBwbGF0Zm9ybXMgd2hpbGUgaSB3YXMgbWVhbmluZwp4ZS1rbWQ/IGlmIGl0
cyB0aGUgZm9ybWVyLCB0aGVuIHlvdSBjYW4gY2hhbmdlIGl0IHRvICJwcmVfeGUyIiBlbHNlIGlm
IGl0cwp0aGUgbGF0dGVyLCB0aGVuIGp1c3QgcmVtb3ZlIHRoYXQgcHJlZml4LgphbGFuOnNuaXAu
Li4KCj4gK3N0YXRpYyB2b2lkIF9fZmlsbF9leHRfcmVnKHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19k
ZXNjciAqZXh0LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb25zdCBzdHJ1Y3QgX19leHRfc3RlZXJfcmVnICpleHRsaXN0LAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgc2xpY2VfaWQs
IGludCBzdWJzbGljZV9pZCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoGV4dC0+cmVnID0gWEVfUkVH
KGV4dGxpc3QtPnJlZy5fX3JlZy5hZGRyKTsKPiArwqDCoMKgwqDCoMKgwqBleHQtPmZsYWdzID0g
RklFTERfUFJFUChHVUNfUkVHU0VUX1NURUVSSU5HX0dST1VQLCBzbGljZV9pZCk7Cj4gK8KgwqDC
oMKgwqDCoMKgZXh0LT5mbGFncyB8PSBGSUVMRF9QUkVQKEdVQ19SRUdTRVRfU1RFRVJJTkdfSU5T
VEFOQ0UsIHN1YnNsaWNlX2lkKTsKPiArwqDCoMKgwqDCoMKgwqBleHQtPnJlZ25hbWUgPSBleHRs
aXN0LT5uYW1lOwphbGFuOiBvbmx5IG5vdyBhZnRlciBmb3JjaW5nIG15c2VsZiB0byByZWxvb2sg
YXQgdGhlIGZ3IHNwZWNzLCBpIG5vdGljZSB0aGF0IHdlIG1heSBoYXZlIG1pc3NlZCBhIGJpdC1m
bGFnIGZvcgoiU3RlZXJpbmdOZWVkZWQiIGluIGV4dC0+ZmxhZ3MgKGJpdCAnMScpLiB0aGlzIHRv
byBtaWdodCBiZSBhIGJ1ZyBpbiBpOTE1IChwZXJoYXBzIHNvbWV0aGluZyB3ZSBjb3VsZSBoYXZl
IG1pc3NlZApkdWUgdG8gZXZvbHZpbmcgc3BlY3MgdGhhdCB3ZXJlIG5ldyBiYWNrIHRoZW4pLiBs
ZXRzIGNvbm5lY3Qgb2ZmbGluZSBhbmQgY2hlY2sgd2l0aCBpbnRlcm5hbCBmdyBmb2xrcy4KPiAr
fQo+ICsKPiArc3RhdGljIGludAo+ICtfX2FsbG9jX2V4dF9yZWdzKHN0cnVjdCBfX2d1Y19tbWlv
X3JlZ19kZXNjcl9ncm91cCAqbmV3bGlzdCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnN0IHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNjcl9ncm91cCAqcm9vdGxpc3QsIGlu
dCBudW1fcmVncykKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19k
ZXNjciAqbGlzdDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgbGlzdCA9IGtjYWxsb2MobnVtX3JlZ3Ms
IHNpemVvZihzdHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVzY3IpLCBHRlBfS0VSTkVMKTsKYWxhbjog
ZG9udCB3ZSBoYXZlIGEgZHJtbSB2YXJpYXRpb24gZm9yIGtjYWxsb2M/IGVsc2Ugc2hvdWxkIHdl
IHRoZW4gdXNlIGRybW1fa3phbGxvYyBpbnN0ZWFkPwo+ICvCoMKgwqDCoMKgwqDCoGlmICghbGlz
dCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoG5ld2xpc3QtPmV4dGxpc3QgPSBsaXN0Owo+ICvCoMKgwqDCoMKgwqDC
oG5ld2xpc3QtPm51bV9yZWdzID0gbnVtX3JlZ3M7Cj4gK8KgwqDCoMKgwqDCoMKgbmV3bGlzdC0+
b3duZXIgPSByb290bGlzdC0+b3duZXI7Cj4gK8KgwqDCoMKgwqDCoMKgbmV3bGlzdC0+ZW5naW5l
ID0gcm9vdGxpc3QtPmVuZ2luZTsKPiArwqDCoMKgwqDCoMKgwqBuZXdsaXN0LT50eXBlID0gcm9v
dGxpc3QtPnR5cGU7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgdm9pZAo+ICtndWNfY2FwdHVyZV9hbGxvY19zdGVlcmVkX2xpc3RzKHN0cnVjdCB4ZV9n
dWMgKmd1YywgY29uc3Qgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rlc2NyX2dyb3VwICpsaXN0cykK
PiArewphbGFuOnNuaXAuLi4KCj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qIGFsbG9jYXRlIGFuIGV4
dHJhIGZvciBhbiBlbmQgbWFya2VyICovCj4gK8KgwqDCoMKgwqDCoMKgZXh0bGlzdHMgPSBrY2Fs
bG9jKDIsIHNpemVvZihzdHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVzY3JfZ3JvdXApLCBHRlBfS0VS
TkVMKTsKYWxhbjogc2FtZSBoZXJlIC11c2UgZHJtbSB2YXJpYXRpb24uIGRvbnQgZm9yZ2V0IHRo
ZSBrZnJlZSByZXBsYWNlbWVudCB0b28uCmFsYW46c25pcC4uLgoKPiArCj4gwqBzdGF0aWMgY29u
c3Qgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rlc2NyX2dyb3VwICoKPiDCoGd1Y19jYXB0dXJlX2dl
dF9kZXZpY2VfcmVnbGlzdChzdHJ1Y3QgeGVfZ3VjICpndWMpCj4gwqB7Cj4gLcKgwqDCoMKgwqDC
oMKgLy9GSVhNRTogYWRkIHJlZ2lzdGVyIGxpc3QKPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gTlVM
TDsKPiArwqDCoMKgwqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoCAqIEZvciBjZXJ0YWluIGVu
Z2luZSBjbGFzc2VzLCB0aGVyZSBhcmUgc2xpY2UgYW5kIHN1YnNsaWNlCj4gK8KgwqDCoMKgwqDC
oMKgICogbGV2ZWwgcmVnaXN0ZXJzIHJlcXVpcmluZyBzdGVlcmluZy4gV2UgYWxsb2NhdGUgYW5k
IHBvcHVsYXRlCj4gK8KgwqDCoMKgwqDCoMKgICogdGhlc2UgYXQgaW5pdCB0aW1lIGJhc2VkIG9u
IGh3IGNvbmZpZyBhZGQgaXQgYXMgYW4gZXh0ZW5zaW9uCj4gK8KgwqDCoMKgwqDCoMKgICogbGlz
dCBhdCB0aGUgZW5kIG9mIHRoZSBwcmUtcG9wdWxhdGVkIHJlbmRlciBsaXN0Lgo+ICvCoMKgwqDC
oMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoGd1Y19jYXB0dXJlX2FsbG9jX3N0ZWVyZWRfbGlz
dHMoZ3VjLCB4ZV9scF9saXN0cyk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiB4ZV9scF9s
aXN0czsKPiDCoH0KPiDCoAoK
