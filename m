Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2536AC5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 19:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F5510F3BF;
	Fri, 21 Aug 2026 19:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CI8xSZSI";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE0B10F3BF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787340483; x=1818876483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XLsu5J1bTROMAhh0QsyymmxW9B7iU7EDdjzO1r+E4U4=;
 b=CI8xSZSIQe2XkZTAMwsCgZXeAq4rYWtXg+ntDZGxoial7zsvkJtpadNv
 INBzybVqo7KH9bdl4rXbxS+LrffYDqRfCOarSgoCTJPAOHOtYGcpOAyIf
 pk+jW13JXGB8aBRsiBDhFt3BwRwLs80/1r/nFcj7/lRbjRlT9txhsoXz3
 LPicpsoqo73oR+5/jhJrMeTbaFBwRZ8bMmcMGs9+ZfjyJRDZ+jFCYhun1
 F8dksrxJX6V2GYB3SdQsEotX5aOcg0INTX/7/7kFzhpOtO2I8IiM/qOt0
 J90oS9n+P/5UtAo55ScTs1T00e+rRv7cBSkSNl7QQ5vwcjEGmjhpE5vtz g==;
X-CSE-ConnectionGUID: 3c+4ZmM1RQOtNePBn8oSYA==
X-CSE-MsgGUID: B6cpY0UxTrO8GSKEHXz4LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87914719"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87914719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 12:27:48 -0700
X-CSE-ConnectionGUID: OGM8RVYnSg2d+x2NV473sg==
X-CSE-MsgGUID: +3rEL0ftSpCWV+863eLB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291273213"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 12:27:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 12:27:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 12:27:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 12:27:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIbS09cfetH6XnkzUretwFG9zbZt7znG61yRiHNlD+HvbtBN5ajlA2VtJA+veLxpRtFrJLYprOx9ZQ/uE8/+Qp+//7b2PblAIlN3IFki2WPMYoLnsuxByiU6Ck+cRWIsYuQ7SoZrJ+/lOLs5FhjLz6xKe1L6G6e5YR5kBfPOoSUZ6s+2dizSi1ONe7jbJTAqU1YaDNmj8uuneHpXMBlZytD+BmmGzcspCep3H+BHk0oZwMbs3yDyj2sC69x44iwq+r3xHWF+YAxeB3WoBRBj1kE6n4CSwBnreBZuR2seMZTd1yeSqlJKJMFypYcJtMH7W2JDIqNJmZYXEga5XvCkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLsu5J1bTROMAhh0QsyymmxW9B7iU7EDdjzO1r+E4U4=;
 b=V3hyFNegcVgiq+uG28cSfZqfDaTVq8sZZtxke30iXsgIUu2VZE/uIqewSjF/aRk1RNI2vlmQJBTz1QVyZHFIE7VdZbmpVix9/F1dnGzNSxUqfIITFkI7J897rhcAf4dTXvzMPuRZ4isVsnJpKbUfIZJJZfbcaHBtc5XyX0GQOi0WJ1dtTuNonRVOd3B7oelr3MC2V1/LyP243p4rFarXP99QgfyF054wB7NqTJTPfAwh/xgomZA4ak1N1ZQH2pPxv31gEAlhkgZbevu4hCcwRTTBaehgOZil+iFHdRzKfkj9lwfMG4sSxHJ4o0MBzfy9LT0stQYnuZEgykLZB25iVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 19:27:41 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 19:27:40 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 00/10] Add new debug infrastructure for configfs
Thread-Topic: [PATCH 00/10] Add new debug infrastructure for configfs
Thread-Index: AQHdMOfUK5eGV8r2v0SuBiOWxjQFCLao5HAA
Date: Fri, 21 Aug 2026 19:27:40 +0000
Message-ID: <0ba4ffc43ff72d710db8d3bd834879e76232cf2b.camel@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
In-Reply-To: <20260820210639.107524-12-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|CO1PR11MB5059:EE_
x-ms-office365-filtering-correlation-id: ecbc3c3e-d704-4742-5149-08deffba443b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 4l7Sf0SU3GxwJ5glftYljzu0YQ6IV81JXrz7lIrP9ihG8VxwzFh7TdKAYe+jIHXmTZcKs98RsagtP+NKkdqdQG5z9bYHN7Xd4mGqjWvvi/Bp9eoh7qj6omwQQDow3hRoL2nqD1GkDpAst3RHJxsWSxNfNsl/5LhNzEnPjMQkQyVPkuDy7phHnjuRtZKEHGcOUOw6JyVe6Fb1YXUoMmydIAZ2q11rXW89xUoePWuhL1XCVQWsDYX6UfRB5fWnQU664b22Ao0f9kY6m0eEMzMO/gVlTq/4S+HEvV2M/+oVc3t6hyPA0trNu5mOSOZZewo8TOdOmnnCnDqQXG4xumHomAbDEJ1bra/uVqxgV6Eb5Q+A751mGd49H4pFKGp+e8bkjYS2NQ91rd0W3KJFEFGIC1belc7601NKplsZumnDg7uSvSdPm896HZ/A2INyybQO4bQqbh2ZTQy2Vk0Cr99++CPvg/ZDsydrPOapph6RUYK0WWVjimtnxL7mvEGO1bYGWe+9bwxvYKAc5YQ4PawRK8qfhlPBlg+jkMfA7+zXYcFhtBEch6+iXhEtHvwKePT75k8k+JEzb+9QkZ1+nly+I3j1FYEgmmlE1KERWTWxM/rWDLoRTUs8xz3ZZng0TKWmAT4q+OboFOgo3W2WYeMZBLoAy/Ok+Q9tXq3SvXOwVKo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVNpMXZhZnlkQkR1ZkluNTNhMS9jUnk3blc1dWFENEluQUxwdE9EMy9xM0pQ?=
 =?utf-8?B?dVdsWCtxZFIrUCt3R1hXazlRaDdUWTNveXhRUHRPdHhTUTJzbm9lMS9HeUJJ?=
 =?utf-8?B?WWVQZERNTlRYeDJBOWRvTnRaMFNjWk9KNy9JQ3RmRVQ0ejcxdUtrdk5rSmFl?=
 =?utf-8?B?eXEwcjcyM3hyRHdHaGg2QlVIUmV4Z0tHY1Zjcm83Q2JodlAvY21ObDNwZUds?=
 =?utf-8?B?Q1FmWWhrVkxpRWN2OVYxOWNKUnNwRTJrb0tXRnBZdEpYdXp3ZUkxdkhiKzRZ?=
 =?utf-8?B?R0ZCN2Q0cnZXTHpIUG1Jei94dFMySnhUQTVybHJFVkJEWWFIZ2pod3RIeGJC?=
 =?utf-8?B?RVA1bEZ4VDRlRkhVSy8xYTFwM0lKREdwUVVJaEtqd3J0SkpJVDl5UXJDelRn?=
 =?utf-8?B?a09VdzhLNU5udVNnRWp4TzdMdkFUaHRreFRzSHdBQ1I5aS96bUFGS1lHemRl?=
 =?utf-8?B?VVdTakcxRE1reFJHU1AwYmVHQ2V1Snh4eUY1Z2cyMGZNQnFEVUNVcEIvRnB3?=
 =?utf-8?B?bzNKMUM3dFErT0J3OXpZdzAvaVZiMGFvbHNRZ24vbFNkTDVRU2M1d2k2L25t?=
 =?utf-8?B?b0Via3lNZXdGVFEzbVhtWlZ0RVBqRk0wdk9Icit0NEhXRWFQY0RGRmlGR002?=
 =?utf-8?B?VEVCTGRMblFEbmxpVFVQUXRCV1FaLy9BUWE3TmxqdE1NRjc3aForNCtCRjVu?=
 =?utf-8?B?aHk2Y2R3OG1ib0w4aUdvaC91NGwyT3FwTGE1TjJJdHlaY0hmUS92VXJhd0do?=
 =?utf-8?B?QjBoNCtoeGp5WktZS0pndWxiVHdBVHllL3d4Q0NhS0hLSWVrVG9hYjQ4dnEw?=
 =?utf-8?B?RlZPS0NjOXZxU042Rm5oR2dXZjg2Q0JPaEtYYU8ySGFUUlBVbnBrVkRLQjRK?=
 =?utf-8?B?WjkvUWNIcmpqdGRNanVocUVQMUM4TE9aMGE3bitIWWw2MXZpWUs2WUs3M21w?=
 =?utf-8?B?dkRyRmNudzhlVVEzajdaYld5alp0U1Z4ZDdQMEV1cUorZmlBbkpQUDk4eDFn?=
 =?utf-8?B?RHBLTFdwK0Q3eGFKbXptSjlLWjRPbUk0NzRydWlnTXN4a3JabG9VS0tOVEVR?=
 =?utf-8?B?VkNSa0s3aVpBR1BHZThGZXp2QVF4U3QzcVVQMU5tamVNbCtwZEVxZ0ZYUXZB?=
 =?utf-8?B?Vkp2bXhQZmljakhwdW9SK1p4cW54TGw0dFhXMVN4a3dwMnRsQkFBZkMyRFg4?=
 =?utf-8?B?K2ZXMW9ZUlFFaVpPWW43WHEyaXBxT0QwSmJ1dGF2TFYxY2ZJbDBLb0wzYzM0?=
 =?utf-8?B?QzJENDR4OWNBVXFhVVllbDd2SWl0T0ptcGNoNWMzUzFZLzRzUlRwOEwrZC9S?=
 =?utf-8?B?dno3Y3p3NFJPRjMzQUx5VzljS0Z1WVJRMzJFQ09nZUpDSzByVXBtbndXNG9n?=
 =?utf-8?B?U3ZiS005Qkg2TDkyNDQ5MmtvenhVTUM5MmhlcCsrSkd5OWVBL3diKzFIL0N0?=
 =?utf-8?B?ci9OZWxpMSsyYzNZdFRVaEhwVHpiK1RHcVAzUThDT2RLT1FIRVovRnVMT1A0?=
 =?utf-8?B?U24vYXl2SkZTNjFhRmNVdGVFS0pCVnZPV3Z6YmJjM2ZaV2ZBWGx1aGszVE1y?=
 =?utf-8?B?NlZqWVVKQjBlcFNQZHp0aml5UkFDRjB2dm13MlZjMjY0WVhac05rRCs0SW1P?=
 =?utf-8?B?UGFmc3d3VkVFdmFGVlZ5cnk5Rkpld1NvQ00zdi96MXFCU1BUdjliK1JleFU4?=
 =?utf-8?B?MXFEZzFJTFQva1hUUTF6eWtXOElidWEwTjYwOXArQ3JIM3RHa3Z6VzB4Q1Bv?=
 =?utf-8?B?aXRmVEdKWTlMb1JmOU5VYnZxNTU2RW9SOVdRWnRwbjdGL0prcGlOMWtvcmxY?=
 =?utf-8?B?bUtubHV6UHU4ek53a0dEaGFMVkFJZGZBNEdYYkg1RVJOdUY3RlBiT0s0VFNp?=
 =?utf-8?B?Z1J1ekFVYWE5ZjhSS3V3MHV5cXBWZkVPUWxBMHBmZzhodWRMekZIaU1wTmhm?=
 =?utf-8?B?MkllcmN5TVQ3NGRtS0xEb0RneU1iTGdWME5zdGNKMUFwVnAydHc3eHJuQU9D?=
 =?utf-8?B?ZjR1aDRqR0pBTzdERXBWeVVId1BkV21nMXZZRVJBc25ycE5QaHJjeFFxZjJK?=
 =?utf-8?B?c0NnWW1LUjk4ZDBpb2ovREc4a1VvM0MyS0lnQ2RqdTQvK3g1UmNVVWNkd0lm?=
 =?utf-8?B?dy9wZkpocTdqUStsVjZldHA3c2N3dEI5VHM4YUtBY1NxTk5wVllveUVMTFJv?=
 =?utf-8?B?alFnRmRtRUt0Q0JWNDRqZ2x4b0ZFeGJsVDBudnAvODlzWlZjUkJGQ1lnekYx?=
 =?utf-8?B?ZUs3UEVxZ2kyTkE2TzgxMHU5WjM3NHBVMTl6L0haU09RdmI0dCtjT1FRL2hk?=
 =?utf-8?B?TVAxUHI3ZG1vMWc3QVd2a1hqMkRsdXlheUwyL3h4NjBoUTlEbjZ1UGRRNnlr?=
 =?utf-8?Q?pmxVT6it0eqitIk4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <526CE3F170B3E540A03CDCB1ED09B6E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: F/bNo3P5WkTjEK72+lq4zMh43XHJwHTyQPU4oFtBXaNLDN4xCq9mHGQ53hey/meyfBA/Fhu8vQXFDls7P1YImaQXvwh9uWLxxfT+rxkSCfsZag/UABPX+tkPozzkdR60pwfuE1D6u23knKiNxi6jMcOGO1TQpZ5c6qn78XICZAen1r9WiiO9zSUsJtOV/KaveToCjpfbAvFdFYwI62JtMsup5JtbSIjkACr34zB+DHjq1qWYHJgjzO/MWY/kAGFkNvBRkzP0HGtCfyWld61UFPBS4aVMeQ6eP4MFGqup7MMj/6qwsoHmdxLYAjQHc+m68lw2uhFz1ktElouWt3F01A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbc3c3e-d704-4742-5149-08deffba443b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 19:27:40.6888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 58PVi5Xzgm5pZeMPigRFC7saIHF/+/JSnat5nEz2cr0jtzxMcNTHqFbBIAOusTxbH1ReCYoNRselrom4ApYJ/j30HVqj76jLtUqokLEyYLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
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

SSBoYXZlIHRoZSB0ZXN0IGNoYW5nZXMgZm9yIHRoaXMgdXAgb24gdGhlIElHVCBtYWlsaW5nIGxp
c3Q6DQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3MjYwMi8NCg0K
VGhhbmtzLA0KU3R1YXJ0DQoNCk9uIFRodSwgMjAyNi0wOC0yMCBhdCAyMTowNiArMDAwMCwgU3R1
YXJ0IFN1bW1lcnMgd3JvdGU6DQo+IEFkZCBhIG5ldyBjb25maWdmcyBkZWJ1ZyBncm91cC4gVGhl
IGludGVudCBvZiB0aGlzIHN0cnVjdHVyZSBpcw0KPiB0byBhbGxvdyB1cyB0byBzZXBhcmF0ZSBB
QkkgZmFjaW5nIGNvbmZpZ2ZzIGVudHJpZXMgZnJvbSB0aG9zZQ0KPiB3aGljaCBhcmUgcHVyZWx5
IGZvciBkZWJ1ZyBwdXJwb3Nlcy4gQW5kIGl0IGFsbG93cyB1cyBtb3JlDQo+IGZsZXhpYmlsaXR5
DQo+IGluIGhvdyB3ZSBkZWZpbmUgdGhvc2UgcGFyYW1ldGVycyB1c2VkIGZvciBkZWJ1Zy4NCj4g
DQo+IEFkZCBhIG5ldyBpbmZyYXN0cnVjdHVyZSB0byB0aGlzIGRlYnVnIGNvbmZpZ2ZzIGdyb3Vw
IHRoYXQgbGV0cyB1cw0KPiBlYXNpbHkgZGVmaW5lIHRoZSBwYXJhbWV0ZXJzIGluIGEgcXVpY2sg
bGlzdC4gVGhpcyBpcyBwcmltYXJpbHkNCj4gdXNlZnVsIGZvciBzaW1wbGUsIHNpbmdsZS10eXBl
IHBhcmFtZXRlcnMgc3VjaCBhcyBlbmFibGUvZGlzYWJsZQ0KPiBmZWF0dXJlcyBvciBzaW1wbGUg
dmFsdWVzIHBhc3NlZC4gRm9yIG1vcmUgY29tcGxleCBwYXJhbWV0ZXJzLA0KPiB3ZSB3aWxsIHN0
aWxsIG5lZWQgdG8gZGVmaW5lIHRoZXNlIHNlcGFyYXRlbHkuDQo+IA0KPiBQdWxsIHRoZSBHdUMg
dGFyZ2V0IHJlbGF0ZWQgY2hhbmdlcyBmcm9tIFsxXSB0byBmaXQgd2l0aGluDQo+IHRoaXMgbmV3
IHN0cnVjdHVyZSBhbmQgYWRkIGEgbmV3IGRlZmluaXRpb24gZm9yIGd1Y19sb2dfbGV2ZWwNCj4g
b24gdG9wIG9mIHRoZSBleGlzdGluZyBtb2R1bGUgcGFyYW1ldGVyICh0byBlbnN1cmUgd2UgYXJl
bid0DQo+IGltcGFjdGluZyBleGlzdGluZyB1c2VycyBvZiB0aGUgbW9kdWxlIHBhcmFtZXRlciku
DQo+IA0KPiBOb3RlIHRoYXQgdGhlIGRlYnVnIHBhcmFtZXRlcnMgaGVyZSBhcmUgYWxsIHRvIGJl
IHVzZWQgImF0IHlvdXINCj4gb3duIHJpc2siLiBXaXRob3V0IGhhdmluZyBpbiBkZXB0aCBrbm93
bGVkZ2Ugb2YgaG93IHRoZXNlIGltcGFjdA0KPiB0aGUgc29mdHdhcmUgYW5kIGhhcmR3YXJlLCB0
aGVyZSBjb3VsZCBiZSB1bmZvcmVzZWVuIGNvbnNlcXVlbmNlcw0KPiBvZiBzZXR0aW5nIHRoZW0u
IEFzIHN1Y2gsIHRoZXkgYXJlIGFsbCB3cmFwcGVkIGluIGENCj4gQ09ORklHX0RSTV9YRV9ERUJV
RyBjb25maWdmcyBvcHRpb24uDQo+IA0KPiBJbiB0ZXJtcyBvZiB0aGUgcGF0Y2hlcyBoZXJlLCBJ
J20gc29ydGluZyB0aGUgZXhpc3RpbmcgcGFyYW1ldGVycw0KPiBieSBuYW1lL3R5cGUuIEkga25v
dyB3ZSBoYXZlIGEgZmV3IG90aGVyIG1vZHVsZSBwYXJhbWV0ZXJzIHRoYXQNCj4gY291bGQgbWln
cmF0ZSBoZXJlLCBidXQgSSBkaWRuJ3Qgd2FudCB0byBvdmVybG9hZCB0aGlzIHNlcmllcw0KPiB0
b28gbXVjaCwgc28gdGhlIGZvY3VzIGZvciBub3cgaXMgb24gdGhlIGV4aXN0aW5nIGNvbmZpZ2Zz
IGVudHJpZXMNCj4gYW5kIGRlbW9uc3RyYXRpbmcgdGhlIG5ldyBzdHJ1Y3R1cmVzIHdpdGggdGhl
IEd1QyBsb2cgbGV2ZWwgYW5kDQo+IHRhcmdldCBwYXJhbWV0ZXJzLg0KPiANCj4gSSB1c2VkIEdp
dEh1YiBDb3BpbG90IHdpdGggQ2xhdWRlIHByZXR0eSBleHRlbnNpdmVseSB0aHJvdWdoIHRoZQ0K
PiBwcm9jZXNzIGhlcmUgYW5kIGF0dHJpYnV0ZWQgYXMgc3VjaC4gSGFwcHkgdG8gYW5zd2VyIGFu
eSBxdWVzdGlvbnMNCj4gYXJvdW5kIHRoaXMuIFRvb2sgYSBiaXQgb2YgdGltZSBnZXR0aW5nIGJh
Y2sgdG8gdGhpcyBzZXJpZXMgYXJvdW5kDQo+IG90aGVyIHdvcmssIGFuZCBpbiB0aGF0IHRpbWUg
SSB3YXMgcGxheWluZyBhcm91bmQgd2l0aCBhIGZldw0KPiBkaWZmZXJlbnQNCj4gbW9kZWxzLCBo
ZW5jZSBzb21lIG9mIHRoZSBwYXRjaGVzIGFyZSBzaG93aW5nIG11bHRpcGxlIG9mIHRoZW0uIEkN
Cj4gdHJpZWQgdG8gYXR0cmlidXRlIGVhY2ggYXMgSSB3YXMgaW1wbGVtZW50aW5nIHRoZSBjaGFu
Z2VzLg0KPiANCj4gSSBhbHNvIGRlY2lkZWQgdG8gZHJvcCBKb2huIEhhcnJpc29uIGZyb20gdGhl
IE5QSyBwYXRjaC4gSXQgaGFzDQo+IGJlZW4gbW9kaWZpZWQgcXVpdGUgYSBiaXQgZnJvbSB0aGUg
b3JpZ2luYWwsIGJ1dCBtb3JlIGltcG9ydGFudGx5DQo+IEpvaG4gaXMgbm8gbG9uZ2VyIHdpdGgg
SW50ZWwgYW5kIHRoYXQgZW1haWwgYWRkcmVzcyBpc24ndCBhdmFpbGFibGUNCj4gYW55IG1vcmUu
IElmIGl0IG1ha2VzIGEgZGlmZmVyZW5jZSBoZXJlLCBKb2huIGFuZCBJIGhhZCBib3RoDQo+IHNl
cGFyYXRlbHkNCj4gaW1wbGVtZW50ZWQgdGhpcyBzYW1lIGNoYW5nZSBhdCBkaWZmZXJlbnQgb2Nj
YXNpb25zIGZvciBkZWJ1Zy4gVGhlDQo+IG9uZSBJIHVzZWQgdG8gc3RhcnQgdGhhdCBpbml0aWFs
IHNlcmllcyB3YXMgY2hlcnJ5LXBpY2tlZCBmcm9tIGhpcw0KPiBsYXRlc3QgdmFyaWFudC4NCj4g
DQo+IHYyOg0KPiDCoC0gSW4gdGhpcyBzZWNvbmQgcmV2aXNpb24gSSBkaWQgY29uZmlybSB0aGF0
IHRoZSBndWNfbG9nX2xldmVsDQo+IMKgwqAgbW9kdWxlIHBhcmFtZXRlciBpcyB0YWtpbmcgcHJl
Y2VkZW5jZSBvdmVyIHRoZSBjb25maWdmcyBwYXJhbWV0ZXINCj4gwqDCoCBhbmQgZW5zdXJlZCB0
aGUgb3RoZXIgcGFyYW1ldGVycyBzZWVtIHRvIGJlIGF1dG9nZW5lcmF0aW5nIGFuZA0KPiDCoMKg
IHdvcmtpbmcgYXMgZXhwZWN0ZWQuDQo+IMKgLSBJIHRyaWVkIHRvIGFkZHJlc3MgYWxsIHRoZSBy
ZXZpZXcgZmVlZGJhY2sgZnJvbSB0aGUgZmlyc3QNCj4gwqDCoCByZXZpc2lvbiwgWzJdLg0KPiDC
oC0gSSBhbHNvIGRpZCBhbm90aGVyIHBhc3Mgb24gdGhlIHNvcnRpbmcgc2luY2UgdGhlcmUgd2Vy
ZSBhIGZldw0KPiDCoMKgIGRpc2NyZXBhbmNpZXMgSSBub3RpY2VkIGluIHRoZSBmaXJzdCByZXZp
c2lvbi4gSSBrZXB0IEd1c3Rhdm8ncw0KPiDCoMKgIFItQiBvbiB0aGF0IG9uZSwgYnV0IHdvdWxk
IGxpa2UgYW4gYWNrIGJlZm9yZSBtZXJnaW5nIGF0IGxlYXN0DQo+IMKgwqAgdG8gY29uZmlybSB0
aGUgcGF0Y2ggaXMgc2FuZS4NCj4gwqAtIEFuZCBmaW5hbGx5IEkgbW92ZWQgdGhlIGdldHRlciBm
dW5jdGlvbnMgaW50byB0aGUgWC1tYWNybw0KPiDCoMKgIGdlbmVyYXRvcnMgc28gd2UgY2FuIGF1
dG9nZW5lcmF0ZSBtb3JlIG9mIHRoZSBzaW1pbGFyIGZ1bmN0aW9ucw0KPiDCoMKgIGJldHdlZW4g
dGhlIGRpZmZlcmVudCBwYXJhbWV0ZXJzIGluIHRoYXQgZGVidWcgcGFyYW0gbGlzdC4NCj4gdjM6
DQo+IMKgLSBBZGRyZXNzIGEgY291cGxlIG9mIGNvbW1lbnRzIGZyb20gU2FzaGlrbyBhcm91bmQg
R3VDIGxvZyBsZXZlbA0KPiDCoMKgIGlucHV0IGNoZWNraW5nIGFuZCBwcm9wZXIgZ3VhcmQgaW1w
bGVtZW50YXRpb24uDQo+IHY0Og0KPiDCoC0gTW9yZSByZXZpZXcgZmVlZGJhY2sgZnJvbSBTYXNo
aWtvIGFkZHJlc3NlZC4uLg0KPiB2NToNCj4gwqAtIE1vdmUgdGhlIGdvdG8gdG8gYSByZXR1cm4g
KG1vcmUgU2FzaGlrbyBmZWVkYmFjaykgaW4gdGhlIEd1Qw0KPiDCoMKgIGxvZyBsZXZlbCBzZXR0
ZXIgYmVmb3JlIG1vdmluZyB0byB0aGUgWC1tYWNybyBzb2x1dGlvbi4NCj4gdjY6DQo+IMKgLSBN
YWtlIHRoZSBhdXRvZ2VuZXJhdGVkIFgtbWFjcm8gZnVuY3Rpb24gbmFtZXMgbW9yZSBzcGVjaWZp
YyB0bw0KPiDCoMKgIGF2b2lkIG5hbWluZyBjb2xsaXNpb25zIChTYXNoaWtvIGFnYWluKS4NCj4g
DQo+IFN0dWFydCBTdW1tZXJzICgxMCk6DQo+IMKgIGRybS94ZTogR3VhcmQgY29uZmlnZnMgYXR0
cmlidXRlIHJlYWRzIGluIGdldHRlcnMNCj4gwqAgZHJtL3hlOiBTb3J0IHhlX2NvbmZpZ19kZXZp
Y2UgZmllbGRzDQo+IMKgIGRybS94ZTogU3BsaXQgb3V0IGNvbmZpZ2ZzIGRhdGEgc3RydWN0dXJl
cw0KPiDCoCBkcm0veGU6IEFkZCBhIG5ldyBkZWJ1ZyBmb2N1c2VkIGNvbmZpZ2ZzIGdyb3VwDQo+
IMKgIGRybS94ZTogTW92ZSBkZWJ1ZyBjb25maWdmcyBlbnRyaWVzIHRvIHhlX2NvbmZpZ2ZzX2Rl
YnVnLmMNCj4gwqAgZHJtL3hlL2d1YzogQWRkIGNvbmZpZ2ZzIHN1cHBvcnQgZm9yIGd1Y19sb2df
bGV2ZWwNCj4gwqAgZHJtL3hlL2d1YzogQWRkIHN1cHBvcnQgZm9yIE5QSyBhcyBhIEd1QyBsb2cg
dGFyZ2V0DQo+IMKgIGRybS94ZTogQWRkIGluZnJhc3RydWN0dXJlIGZvciBkZWJ1ZyBjb25maWdm
cyBwYXJhbWV0ZXJzDQo+IMKgIGRybS94ZTogTWlncmF0ZSBleGlzdGluZyBkZWJ1ZyBjb25maWdm
cyBlbnRyaWVzIHRvIHBhcmFtcw0KPiDCoMKgwqAgaW5mcmFzdHJ1Y3R1cmUNCj4gwqAgZHJtL3hl
OiBUYWludCBrZXJuZWwgd2hlbiBkZWJ1ZyBjb25maWdmcyBwYXJhbWV0ZXJzIGFyZSBzZXQNCj4g
DQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqAgMiArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9ndWNf
bG9nX2FiaS5owqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgOCArDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2NvbmZpZ2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEwMTcgKy0t
LS0tLS0tLS0tLS0tDQo+IC0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA5MCArLQ0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jwqDCoMKgwqDCoMKgwqAgfMKgIDg3MiArKysrKysrKysr
KysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5owqDCoMKgwqDC
oMKgwqAgfMKgwqAgNDggKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1
Z19wYXJhbXMuYyB8wqAgMTU4ICsrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdm
c19kZWJ1Z19wYXJhbXMuaCB8wqAgMTk0ICsrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Y29uZmlnZnNfdHlwZXMuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDU5ICsNCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGVmYXVsdHMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAg
NSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDE0ICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19hZHMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxICsNCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgIDMgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
bHJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxICsNCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqDCoCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHNtaS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDMgKy0NCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcnRwLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqDCoCAzICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9k
ZS5jwqDCoMKgIHzCoMKgwqAgMSArDQo+IMKgMTkgZmlsZXMgY2hhbmdlZCwgMTQ5NSBpbnNlcnRp
b25zKCspLCA5ODYgZGVsZXRpb25zKC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5oDQo+IMKgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Z19wYXJhbXMuYw0KPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWdfcGFy
YW1zLmgNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZp
Z2ZzX3R5cGVzLmgNCj4gDQoNCg==
