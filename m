Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F94606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E4Q7lDHR;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OiVjX9M3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75A210F64F;
	Tue, 24 Nov 2026 16:15:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2253010F772
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795536948; x=1827072948;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=YvEM0BlPqRjBzJ6gcEjepo8gN/EtzIYjoEKdC/l9APs=;
 b=E4Q7lDHRu+YZrO+X0P/ZVZXAqaZptxrNtX9i8towCoJiKvItS9uHusM9
 qW2HexVuZN912IK6Nr81tagi/JeMzvF/cnPBu2NWeJrKzIHnJqCW2iNAm
 rdxq7IKnJ11OUA63XCKQ/QeB35Z2JixCz0iu5zKN40kS73blGUiqhNmGS
 AzbAoHBZlO8K9NVkuvfzQccdDN/Q0TCT1rjzuVDWVBo2aY5+ziux11TQt
 DM0drKOCQe0YAF4ShegRGlQ6jlftqF1oqL2aQAjUY7o+Csdd7iAUIGGdc
 KRULWiDyC8kM6T5whcKKLKvocWUSygD/Sc0Qdf+xQRQHOv/wbVC3lRLRv Q==;
X-CSE-ConnectionGUID: qcmYVuVIQGixq3lagtDDIQ==
X-CSE-MsgGUID: 2pBwnbKEQUKXO7Vw98Tobg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4246007"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208,217";a="4246007"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 08:15:48 -0800
X-CSE-ConnectionGUID: IgeAm1qSSzygmjm5a6h61w==
X-CSE-MsgGUID: iXwOekBST+qRpK8aAylXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208,217";a="13390581"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 08:15:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 08:15:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 08:15:47 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 08:15:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyDKhpUHgAAQg5fdvcCwZcLMf6XhjvhD35GIgNy83JY41dhzV9oLGReZZ9VsU87tO42+M3c7MVDUhsawyrpwPxSA35b/jfnBHe1YFxiTf2jJI09AdEHHFv7WNpMR+dQKBrUgt1c/jAe0OfbXQkSOSIJSsfWq0V0tUZD7o+1wyN/l4k4DNolSasFY3hzqDhH6kGTMfrmbAIO1mOt3b9pbh+Su0Az871r8yKusprN5AQofQvUe9VUNCEGM0hddpNveJKSkrCKiWAozx2JZno5JwdAXDbrh+t6PkjGdsUga2FEqMmk992M6K44Fg9ifgw2MZzCuRNRm0kZjkHglHF2E1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Tjq8WbD1XEORDQ1lYh1rzt7RuBfO2DdYkT7ijMdqpk=;
 b=MHGm/yjcp6qXFmCKbXJGaatr77oQMCZncRXWDkDszJKNfu8D1vKwK8qTuF9BY4cKSSQKchYKbRsYU4z43jQ8xObpWNlugLg5ZbNNKoy8BsVq4eO+bhZF3Lde9awz8a7cYAr0dqbLTsCh4T2TSatchCUP+Ze2dyD/yDSi63bAY3QKLCX3+YeAxbvInwxSDSDeUn3Z1ZciXEHrti4ObP/nzO6l7NoFk4YXcNHJulV0cY2DrksLDt8aprcPj8hqkfPtuFPzNWJ6Ed2vR671bDOqMf9NoCmOzXSRWcRvQJkd9aGH84Y15QPjRZKkuabGkc9cNokU95Ndc5pJoiXMArGELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Tjq8WbD1XEORDQ1lYh1rzt7RuBfO2DdYkT7ijMdqpk=;
 b=OiVjX9M3b93xCDnPiDSrFXRJAk7erufF4zRc8/vy+UHOJ3JO5HR0R6VD+NxkOiL09ht/XMwaCIkFvhtM+A7fqX0OK9OWEUfJd+kLe3eqf9bI3969uso7OYk1cZoGdrip3rDa2df9XIYK86hG3hDYIQmJ2e6KLpa+4wtAfb1I7Zc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 16:15:44 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 16:15:44 +0000
Content-Type: multipart/alternative;
 boundary="------------5dgH0sn7Vq4EuM42Kv3chG08"
Message-ID: <aba1c1d4-a06e-4550-ab4f-731b9ed894e1@intel.com>
Date: Tue, 24 Nov 2026 17:15:39 +0100
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
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <5659b906-98d7-4004-91a0-d43a6ba47276@intel.com>
X-ClientProxiedBy: AM6P192CA0076.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::39) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|BN9PR11MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 5092f5ee-12bc-4507-263d-08df4a4630f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261026140227099003|261021135927099003|261102123227099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: QzQDdncVGgh6wOE5arFAptAAQ3KGPcn1lULUnzHyHKPaK8yp5ygXPzlrMgHHQSownmgu91bBO2PVNcogIGkVuEkjlbzbENUHBT9llieVHxAP/aQCv4JFB1YVRFXqmnUWiA3zhg4HOmlhPUIXD2B7IBz/xNdXsBnp4NvAGCq4ySYoLNFiIWMoCaJcfTe2oS3+zyN8OHS2zmvy3oa06eBmqZu9HwM4RhIYo/Wm5jbT/OD8BRKIPWOhqMn/RlnY8bc1+GaBh5N8M7xpdKJMfByzfJnIlbnsN2exiOyMrBTSkOmcT0+3byfT5Rq18x+gT4WcWptDb1w58aAQ0ckOfpInXqEzhiO/l0MShZCc9QIHsAznUutXyKjnEp1yxXmP9UJc4/sQFpTEMUdDD+9wvPQOVIrzpn+jOPfXJ1wRV72drUySt2XlJ9eukw/EZbtCXtXbXybfYdStwN5kLrtAasjt9yPl3B5OhIm8KkejT5K7gF2Kp5qr6aHwPyvhqzDgABygtIo/rmYmvf0P7oKWrfI8TiLnM0+iI6fDomdOb+KYo2/erEmsfFCeomlVFH1Vzr1SHAy0F+9lH3MOCcD8PieRP3eWp+PGk704wzOqkPm6/WJakH6bqZ/FnkNxyc8h4Ldz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261026140227099003)(261021135927099003)(261102123227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWduSXlPZHQvSnhWQVF2SVlIVFQrRWU4NHE1djMzank5bVJpaHBSSkY5dVdo?=
 =?utf-8?B?SC9DODc5cTd6TmFFbTZYWTkwZGdmRU85MUtWblJXQXgrbmZ4UUxRTE9OU0p6?=
 =?utf-8?B?Z08vS2ZLWFpXTGI1S3FHeEIvRVN0Rys5am02ZFdjRnNZeWtlaGlqV0xQT3BQ?=
 =?utf-8?B?d0tmY0hkVlFzRUEwdWRJMmxsRjViU1RvUy9ZUVAyR05RQ0sybmY1cmh2QUp4?=
 =?utf-8?B?WXpyYjFrTWEzdENiWlppbThKbU9PeXpJVEt6L0l6OTFWUVJLODAxZmg4TElX?=
 =?utf-8?B?KzcyMkQ4Qmxxc01KcHNIbmZ0TlpadWZSL2JSa3hxWSthRWlZd1FneElSUCti?=
 =?utf-8?B?bURRNEJIYTd1bFBvd0I3ZmNuc0xPSFprNUx3SE9kMWlCQW5aOTB1ZERYQmhY?=
 =?utf-8?B?TVByczJJUEhJOEF6V2RtZzR0YUgyNWhhak52cXRRbHplSFdFOEhrZEF4UTY4?=
 =?utf-8?B?dUtGcWpyWW1ub2M3VUNKbWVKLzZ2cXhWWnNEeVhkUzVSZzkxTUcwelU3bFlK?=
 =?utf-8?B?Tm5nOXZNYVk3OFJxZDVQNTNYTGdEY0hjc2FONjJCVmoxZnludFhnMzMrNjBn?=
 =?utf-8?B?QVc4Q1NyYTBFNjJHaGxxeFZrZmMraTQraUxGNDNBdG02LzJDSmZkbCtZaVlI?=
 =?utf-8?B?OTR3TG1wcmdWVkNQY3I3ZndJTmJQOC9PLzhPQXgxVTQ2d0wvbkFTWGN5ZEZ6?=
 =?utf-8?B?aFp1b0puVThnRGYxMFV2SFMzMFBzSTFJenQ0NHhPVXRNS3B3UVpLODUwUzZl?=
 =?utf-8?B?a0EyT1BPQS9jK3FCTmVYUmc2N28wMFZmMHM2ZEdVYUxBYkJoOCt3RXNoV3A2?=
 =?utf-8?B?M3FoUExhZG96Y3BBUElsc2FDVEQwaFNGZXVRWFNrR0ZuS2ZwSmljbW5WbU5z?=
 =?utf-8?B?U2Z6NFppNW9zTEhyT1Flcml6VW8zc0RRNTRYYUxSdGk3bjBWbGI5NGtnN3ox?=
 =?utf-8?B?eno5ZFlyOCsvN0hGSVJtV3JlOElvZXJnREp3clBHL1ZFN29NRk5yMHJpa3VN?=
 =?utf-8?B?RFhmejFGbnFncSt4ZGdMcnM2dFJINWl4MVE1dmZyRnVOY01ucGpOQnBVa1JR?=
 =?utf-8?B?c0dOS1ZYaU1HNXVWTUozeG8zejZUeW5md0s4T29NMlFKcmtHMEhrZnRyaU9o?=
 =?utf-8?B?ZzF5VDEyRExlNmhmZ1BLcWxPL1BxeWNic1p0KzNXM0RBOE1EMkRTNklMd0ty?=
 =?utf-8?B?VkxVNERWVzh3NTZQQnZFSFRrME1JQW9GR2RPemRaNXlnRDU2VFJySzdHU1BW?=
 =?utf-8?B?YTNhYWE5NTl0SWE3VFVQSnQwWjIzdTJtSUh0NkRpMzI5dm5XWE5Kakx2TWFl?=
 =?utf-8?B?Skx5OThTSlJQcHV1bVVpdlR0QUc3K1VIVDJEWlJXV3JRSnIzdWlOdElGVldV?=
 =?utf-8?B?QllaaGFueTdlODdlV0dSVk00VzJ5Z3ZUcGNKcld0b3dKeTJjODVWSSs3enI5?=
 =?utf-8?B?djNZRzlJbGx2MHAvOGRJaGZDN2tNdFR5aDNpd2JKK0hFL0xFTHRXN3JrUHVx?=
 =?utf-8?B?UE1OYk5MTXB5T0MvS2tIMmNEMmxXNlYwTXZCbkR0QkhSYnNlRElEVmFrN2xS?=
 =?utf-8?B?OUExQlM4aXpjQWJrcURiNFhhL2VESEhhRlR3Q0pIcmRFOFlIeGk3N0pTTlRQ?=
 =?utf-8?B?cVoxOGZzVXFPd0Z2OG9NWU9SRUJVUS8rYmpPSnd0VzJ0LzlSZmkyTnNFRkxG?=
 =?utf-8?B?WHZsajZjRFZ2dTZxUWh0NnFLamR2NEw1TFVZa2N3L0I3clc5WEFLYjQ2VnVB?=
 =?utf-8?B?Zk9TUU1aUEJ4ai8wS1l5WWN5WHB0T1lkdFNyZnVwdGVQQk1iVGRObkhrUWpS?=
 =?utf-8?B?cWEwTmhMajBrVnJmZWJiS1hBZzVCSkZ2bzNaOVRKNDYrZnNmZlRYTFJPeC9V?=
 =?utf-8?B?YlNUZ3dmaGN0Mk02NktuSThTczZGWHFUSnZxZ05EUWlUczNoeGZOekc2Tng2?=
 =?utf-8?B?azJXdXorMUNUZDlSY2orTUhMUDlTb1hCTDNjRFRzRDBKVVMwaTFaRE8wT3V0?=
 =?utf-8?B?d3NzcENrQnlMT1BvcDFGZXg2bXN1bmhnZzVuU2JEQkgrMzNnTUFhTHlwOWxK?=
 =?utf-8?B?RDFNVjNKOG1NZ25lVDVVZmVxaGNoWWVDNGUvQjF5K1NQK01iWTBYTjVNSTRR?=
 =?utf-8?B?ci8zdXVaeVhUZE10V3Y2TUlhZ0lHeWdpckNsS2xyWWtHZ1VyWDNaYm5BMHF2?=
 =?utf-8?B?L3I0bFVNRmhIU21qRUhySDF6Q3gxZmJjL1lKbC9IQnVYUHo0RDhlQk9EajV6?=
 =?utf-8?B?b3NwRk1JbXVOYW9nWGgvdGZnY1E3TWhYck5ob3cxK1RFdmFYMzk5ZkhYUExz?=
 =?utf-8?B?T0Ftd3plZFFmZk56VG1naXh3cng3YmFoWk9STWlLZ0Y3cmFDVkJldz09?=
X-Exchange-RoutingPolicyChecked: JqCguaQcflBLfrNYapblXoUljf6hxTUoyoEzj3dvgse3osV082t2Nz9WMglWMNRnbjZqsZ1jg1vDR0wT1S6EHYV9hSFvSVE1lcZnJuEvSY4iBBdAhsjCilXI9pweadJI5rNg17497qFGgwPeQYdmECzbK+vdcOlLOybAd8EicKmGS3NEU4pogaEah4a0ODSGYZPZ+aXP8cKC+suz7elIsn7ggsObiuFzGLEYY7Zbr+CF/20vkVPJ7M3Jvm6h6w4LBS0VSqtE+HrnByYqWONL9SCVQuI7Ow+usTfkQkSL81Qvr3slgLXxrdyTfsLhfzK1uTxhP0saadCtYDRCy0eJSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5092f5ee-12bc-4507-263d-08df4a4630f6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:15:44.2765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvPzBnVLnpHYuY2jL4luIITqOCKaHFcESFCRASFdKnXZ+DcYP/kWeAHa2zR+Qqk7cOf0+eTZTDhkdBjClgNo6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------5dgH0sn7Vq4EuM42Kv3chG08
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2026-11-24 16:27, Matthew Auld wrote:
> On 24/11/2026 15:23, Tomasz Lis wrote:
>> drm_gpusvm_get_pages() returns -EBUSY when its HMM retry budget is
>> exhausted. This can happen when the range was repeatedly invalidated
>> or faulting was slow. This is transient, but the callers treat -EBUSY
>> as fatal.
>>
>> The behavior causes sporadic fails after a VF post-migration recovery,
>> if drm_gpusvm_get_pages() run in parallel with the recovery, and the
>> recovery took longer than HMM_RANGE_DEFAULT_TIMEOUT (which isn't rare,
>> as the kernel bound to VF is running on virtual CPU).
>>
>> Example signature of the issue:
>>    xe 0000:00:04.0: [drm] VM worker error: -16
>>    xe 0000:00:04.0: [drm] Trying to schedule after vm is closed or 
>> banned
>>
>> Convert -EBUSY to -EAGAIN in both wrappers around 
>> drm_gpusvm_get_pages(),
>> through a common helper. The rebind worker, exec, the pagefault loop and
>> the SVM fault path already have a retry implemented on -EAGAIN.
>>
>> xe_vma_userptr_pin_pages() can now return -EAGAIN instead of -EBUSY, so
>> update the VMA creation path in xe_vm.c, which maps this error to
>> -ENOMEM. Tis way the bind ioctl keeps returning the same error as 
>> before.
>
> Do you have some more context for how you hit this?
For log context:

[   25.058112] xe 0000:00:04.0: [drm] VF: Tile0: GT0: readyfor recovery after migration
[   25.058330] xe 0000:00:04.0: [drm] VF: Tile0: GT0: VF migration recovery scheduled
[   25.058334] xe 0000:00:04.0: [drm] VF: Tile0: GT1: readyfor recovery after migration
[   25.058336] xe 0000:00:04.0: [drm] VF: Tile0: GT1: VF migration recovery scheduled
[   25.609533] xe 0000:00:04.0: [drm:guc_ct_change_state [xe]] Tile0: GT0: GuC CT communication channel enabled
[   25.738796] xe 0000:00:04.0: [drm] VF: Tile0: GT0: migration recovery ended
[   31.351935] xe 0000:00:04.0: [drm:guc_ct_change_state [xe]] Tile0: GT1: GuC CT communication channel enabled
[   31.386304] xe 0000:00:04.0: [drm:xe_guc_submit_unpause_prepare_vf [xe]] Tile0: GT1: Replay JOB - guc_id=158, seqno=0
[   31.386392] xe 0000:00:04.0: [drm:xe_guc_submit_unpause_prepare_vf [xe]] Tile0: GT1: Replay JOB - guc_id=158, seqno=0
[   31.390497] xe 0000:00:04.0: [drm] VM worker error: -16
[   31.394348] xe 0000:00:04.0: [drm] Trying to schedule after vm is closed or banned
[   31.402756] xe 0000:00:04.0: [drm] VF: Tile0: GT1: migration recovery ended

For description:
This is a rare hit when executing VM TestBench test `vmtb@test_migration.py::TestBusyMigrationIgtExecThreads5`.
The test executes `igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate` within the VM, and while that is executing, performs a Cold Migration to a VM with different GGTT range.
After PF restores the VM state, post-migration recovery starts executing. In the failing instance I analyzed, the recovery happen to take 6 seconds - far more than HMM_RANGE_DEFAULT_TIMEOUT.
Since updates of GGTT are blocked during the recovery, timeout was assured. In that instance, the call stack was xe_vm_userptr_pin()->xe_vma_userptr_pin_pages()->drm_gpusvm_get_pages().

>
> This looks like:
> https://patchwork.freedesktop.org/series/179052/

It does change the same code path, and the modification is similar, 
though more complex.

I believe the 179052 series will fix the issue I'm seeing, though I 
think timeout should be larger that the 
XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT if the current device supports VM 
migration.

We actually cannot tell what is the limit for VF migration recovery time 
due to VCPU used, but we've seen in testing rare cases where times 
reached 10s.

-Tomasz

>
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c     |  2 +-
>>   drivers/gpu/drm/xe/xe_userptr.c | 16 ++++++++++------
>>   drivers/gpu/drm/xe/xe_vm.c      |  8 ++++----
>>   drivers/gpu/drm/xe/xe_vm.h      | 16 ++++++++++++++++
>>   4 files changed, 31 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index bc6902b5bf57..ffc624171d50 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -1624,7 +1624,7 @@ int xe_svm_range_get_pages(struct xe_vm *vm, 
>> struct xe_svm_range *range,
>>           drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>>       }
>>   -    return err;
>> +    return xe_gpusvm_get_pages_err(err);
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/xe/xe_userptr.c 
>> b/drivers/gpu/drm/xe/xe_userptr.c
>> index 9c1dac0fce6f..423c190ac68d 100644
>> --- a/drivers/gpu/drm/xe/xe_userptr.c
>> +++ b/drivers/gpu/drm/xe/xe_userptr.c
>> @@ -10,6 +10,7 @@
>>     #include "xe_tlb_inval.h"
>>   #include "xe_trace_bo.h"
>> +#include "xe_vm.h"
>>     static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
>>   {
>> @@ -84,6 +85,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma 
>> *uvma)
>>           .device_private_page_owner = xe_svm_private_page_owner(vm, 
>> false),
>>           .allow_mixed = true,
>>       };
>> +    int err;
>>         xe_vma_userptr_lockdep(uvma);
>>       xe_assert(xe, xe_vma_is_userptr(vma));
>> @@ -91,12 +93,14 @@ int xe_vma_userptr_pin_pages(struct 
>> xe_userptr_vma *uvma)
>>       if (vma->gpuva.flags & XE_VMA_DESTROYED)
>>           return 0;
>>   -    return drm_gpusvm_get_pages(&vm->svm.gpusvm, 
>> &uvma->userptr.pages, 1,
>> -                    uvma->userptr.notifier.mm,
>> -                    &uvma->userptr.notifier,
>> -                    xe_vma_userptr(vma),
>> -                    xe_vma_userptr(vma) + xe_vma_size(vma),
>> -                    &ctx);
>> +    err = drm_gpusvm_get_pages(&vm->svm.gpusvm, 
>> &uvma->userptr.pages, 1,
>> +                   uvma->userptr.notifier.mm,
>> +                   &uvma->userptr.notifier,
>> +                   xe_vma_userptr(vma),
>> +                   xe_vma_userptr(vma) + xe_vma_size(vma),
>> +                   &ctx);
>> +
>> +    return xe_gpusvm_get_pages_err(err);
>>   }
>>     static struct mmu_interval_notifier_finish *
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index dd855876f571..6e6937870ac6 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2746,11 +2746,11 @@ static struct xe_vma *new_vma(struct xe_vm 
>> *vm, struct drm_gpuva_op_map *op,
>>               err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>>               /*
>>                * -EBUSY has dedicated meaning that a user fence
>> -             * attached to the VMA is busy, in practice
>> -             * xe_vma_userptr_pin_pages can only fail with -EBUSY if
>> -             * we are low on memory so convert this to -ENOMEM.
>> +             * attached to the VMA is busy. xe_vma_userptr_pin_pages
>> +             * reports exhausted HMM retries as -EAGAIN, which makes
>> +             * no sense for the bind ioctl, so convert it to -ENOMEM.
>>                */
>> -            if (err == -EBUSY)
>> +            if (err == -EAGAIN)
>>                   err = -ENOMEM;
>>           }
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index b1c5f940bcc5..ba24f2e6022e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -38,6 +38,22 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, 
>> u32 flags, struct xe_file *xef)
>>   struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
>>   int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
>>   +/**
>> + * xe_gpusvm_get_pages_err() - Translate an error from 
>> drm_gpusvm_get_pages()
>> + * @err: error code returned by drm_gpusvm_get_pages()
>> + *
>> + * drm_gpusvm_get_pages() returns -EBUSY when its HMM retry budget 
>> ran out,
>> + * because the range was repeatedly invalidated or faulting was 
>> slow. That is
>> + * transient, so report -EAGAIN to let the callers retry. -EBUSY 
>> would be
>> + * treated as fatal, and has other meanings in the VM code.
>> + *
>> + * Return: @err, with -EBUSY replaced by -EAGAIN
>> + */
>> +static inline int xe_gpusvm_get_pages_err(int err)
>> +{
>> +    return err == -EBUSY ? -EAGAIN : err;
>> +}
>> +
>>   static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
>>   {
>>       drm_gpuvm_get(&vm->gpuvm);
>
--------------5dgH0sn7Vq4EuM42Kv3chG08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-11-24 16:27, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5659b906-98d7-4004-91a0-d43a6ba47276@intel.com">On
      24/11/2026 15:23, Tomasz Lis wrote:
      <br>
      <blockquote type="cite">drm_gpusvm_get_pages() returns -EBUSY when
        its HMM retry budget is
        <br>
        exhausted. This can happen when the range was repeatedly
        invalidated
        <br>
        or faulting was slow. This is transient, but the callers treat
        -EBUSY
        <br>
        as fatal.
        <br>
        <br>
        The behavior causes sporadic fails after a VF post-migration
        recovery,
        <br>
        if drm_gpusvm_get_pages() run in parallel with the recovery, and
        the
        <br>
        recovery took longer than HMM_RANGE_DEFAULT_TIMEOUT (which isn't
        rare,
        <br>
        as the kernel bound to VF is running on virtual CPU).
        <br>
        <br>
        Example signature of the issue:
        <br>
        &nbsp;&nbsp; xe 0000:00:04.0: [drm] VM worker error: -16
        <br>
        &nbsp;&nbsp; xe 0000:00:04.0: [drm] Trying to schedule after vm is closed
        or banned
        <br>
        <br>
        Convert -EBUSY to -EAGAIN in both wrappers around
        drm_gpusvm_get_pages(),
        <br>
        through a common helper. The rebind worker, exec, the pagefault
        loop and
        <br>
        the SVM fault path already have a retry implemented on -EAGAIN.
        <br>
        <br>
        xe_vma_userptr_pin_pages() can now return -EAGAIN instead of
        -EBUSY, so
        <br>
        update the VMA creation path in xe_vm.c, which maps this error
        to
        <br>
        -ENOMEM. Tis way the bind ioctl keeps returning the same error
        as before.
        <br>
      </blockquote>
      <br>
      Do you have some more context for how you hit this?
      <br>
    </blockquote>
    For log context:
    <pre class="code-java">[   25.058112] xe 0000:00:04.0: [drm] VF: Tile0: GT0: ready <span class="code-keyword">for</span> recovery after migration
[   25.058330] xe 0000:00:04.0: [drm] VF: Tile0: GT0: VF migration recovery scheduled
[   25.058334] xe 0000:00:04.0: [drm] VF: Tile0: GT1: ready <span class="code-keyword">for</span> recovery after migration
[   25.058336] xe 0000:00:04.0: [drm] VF: Tile0: GT1: VF migration recovery scheduled
[   25.609533] xe 0000:00:04.0: [drm:guc_ct_change_state [xe]] Tile0: GT0: GuC CT communication channel enabled
[   25.738796] xe 0000:00:04.0: [drm] VF: Tile0: GT0: migration recovery ended
[   31.351935] xe 0000:00:04.0: [drm:guc_ct_change_state [xe]] Tile0: GT1: GuC CT communication channel enabled
[   31.386304] xe 0000:00:04.0: [drm:xe_guc_submit_unpause_prepare_vf [xe]] Tile0: GT1: Replay JOB - guc_id=158, seqno=0
[   31.386392] xe 0000:00:04.0: [drm:xe_guc_submit_unpause_prepare_vf [xe]] Tile0: GT1: Replay JOB - guc_id=158, seqno=0
[   31.390497] xe 0000:00:04.0: [drm] VM worker error: -16
[   31.394348] xe 0000:00:04.0: [drm] Trying to schedule after vm is closed or banned
[   31.402756] xe 0000:00:04.0: [drm] VF: Tile0: GT1: migration recovery ended

For description:
This is a rare hit when executing VM TestBench test `<a class="moz-txt-link-abbreviated" href="mailto:vmtb@test_migration.py::TestBusyMigrationIgtExecThreads5">vmtb@test_migration.py::TestBusyMigrationIgtExecThreads5</a>`.
The test executes `igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate` within the VM, and while that is executing, performs a Cold Migration to a VM with different GGTT range.
After PF restores the VM state, post-migration recovery starts executing. In the failing instance I analyzed, the recovery happen to take 6 seconds - far more than HMM_RANGE_DEFAULT_TIMEOUT.
Since updates of GGTT are blocked during the recovery, timeout was assured. In that instance, the call stack was xe_vm_userptr_pin()-&gt;xe_vma_userptr_pin_pages()-&gt;drm_gpusvm_get_pages().

</pre>
    <blockquote type="cite" cite="mid:5659b906-98d7-4004-91a0-d43a6ba47276@intel.com"><br>
      This looks like:
      <br>
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/179052/">https://patchwork.freedesktop.org/series/179052/</a>
      <br>
    </blockquote>
    <p>It does change the same code path, and the modification is
      similar, though more complex.</p>
    <p>I believe the&nbsp;179052 series will fix the issue I'm seeing, though
      I think timeout should be larger that the&nbsp;<span class="p_add">XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT
        if the current device supports VM migration.</span></p>
    <p><span class="p_add">We actually cannot tell what is the limit for
        VF migration recovery time due to VCPU used, but we've seen in
        testing rare cases where times reached 10s.</span></p>
    <p><span class="p_add">-Tomasz</span></p>
    <blockquote type="cite" cite="mid:5659b906-98d7-4004-91a0-d43a6ba47276@intel.com"><br>
      <blockquote type="cite">
        <br>
        Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
        <br>
        Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
        <br>
        Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_svm.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_userptr.c | 16 ++++++++++------
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_vm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++++----
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_vm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 16 ++++++++++++++++
        <br>
        &nbsp; 4 files changed, 31 insertions(+), 11 deletions(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_svm.c
        b/drivers/gpu/drm/xe/xe_svm.c
        <br>
        index bc6902b5bf57..ffc624171d50 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_svm.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_svm.c
        <br>
        @@ -1624,7 +1624,7 @@ int xe_svm_range_get_pages(struct xe_vm
        *vm, struct xe_svm_range *range,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_gpusvm_range_evict(&amp;vm-&gt;svm.gpusvm,
        &amp;range-&gt;base);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; return err;
        <br>
        +&nbsp;&nbsp;&nbsp; return xe_gpusvm_get_pages_err(err);
        <br>
        &nbsp; }
        <br>
        &nbsp; &nbsp; /**
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_userptr.c
        b/drivers/gpu/drm/xe/xe_userptr.c
        <br>
        index 9c1dac0fce6f..423c190ac68d 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_userptr.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_userptr.c
        <br>
        @@ -10,6 +10,7 @@
        <br>
        &nbsp; &nbsp; #include &quot;xe_tlb_inval.h&quot;
        <br>
        &nbsp; #include &quot;xe_trace_bo.h&quot;
        <br>
        +#include &quot;xe_vm.h&quot;
        <br>
        &nbsp; &nbsp; static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
        <br>
        &nbsp; {
        <br>
        @@ -84,6 +85,7 @@ int xe_vma_userptr_pin_pages(struct
        xe_userptr_vma *uvma)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .device_private_page_owner =
        xe_svm_private_page_owner(vm, false),
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .allow_mixed = true,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };
        <br>
        +&nbsp;&nbsp;&nbsp; int err;
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vma_userptr_lockdep(uvma);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_assert(xe, xe_vma_is_userptr(vma));
        <br>
        @@ -91,12 +93,14 @@ int xe_vma_userptr_pin_pages(struct
        xe_userptr_vma *uvma)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vma-&gt;gpuva.flags &amp; XE_VMA_DESTROYED)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; return drm_gpusvm_get_pages(&amp;vm-&gt;svm.gpusvm,
        &amp;uvma-&gt;userptr.pages, 1,
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uvma-&gt;userptr.notifier.mm,
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;uvma-&gt;userptr.notifier,
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vma_userptr(vma),
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vma_userptr(vma) + xe_vma_size(vma),
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ctx);
        <br>
        +&nbsp;&nbsp;&nbsp; err = drm_gpusvm_get_pages(&amp;vm-&gt;svm.gpusvm,
        &amp;uvma-&gt;userptr.pages, 1,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uvma-&gt;userptr.notifier.mm,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;uvma-&gt;userptr.notifier,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vma_userptr(vma),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vma_userptr(vma) + xe_vma_size(vma),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ctx);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return xe_gpusvm_get_pages_err(err);
        <br>
        &nbsp; }
        <br>
        &nbsp; &nbsp; static struct mmu_interval_notifier_finish *
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_vm.c
        b/drivers/gpu/drm/xe/xe_vm.c
        <br>
        index dd855876f571..6e6937870ac6 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_vm.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_vm.c
        <br>
        @@ -2746,11 +2746,11 @@ static struct xe_vma *new_vma(struct
        xe_vm *vm, struct drm_gpuva_op_map *op,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =
        xe_vma_userptr_pin_pages(to_userptr_vma(vma));
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * -EBUSY has dedicated meaning that a user fence
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * attached to the VMA is busy, in practice
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * xe_vma_userptr_pin_pages can only fail with
        -EBUSY if
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * we are low on memory so convert this to -ENOMEM.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * attached to the VMA is busy.
        xe_vma_userptr_pin_pages
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * reports exhausted HMM retries as -EAGAIN, which
        makes
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * no sense for the bind ioctl, so convert it to
        -ENOMEM.
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err == -EBUSY)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err == -EAGAIN)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = -ENOMEM;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_vm.h
        b/drivers/gpu/drm/xe/xe_vm.h
        <br>
        index b1c5f940bcc5..ba24f2e6022e 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_vm.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_vm.h
        <br>
        @@ -38,6 +38,22 @@ struct xe_vm *xe_vm_create(struct xe_device
        *xe, u32 flags, struct xe_file *xef)
        <br>
        &nbsp; struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
        <br>
        &nbsp; int xe_vma_cmp_vma_cb(const void *key, const struct rb_node
        *node);
        <br>
        &nbsp; +/**
        <br>
        + * xe_gpusvm_get_pages_err() - Translate an error from
        drm_gpusvm_get_pages()
        <br>
        + * @err: error code returned by drm_gpusvm_get_pages()
        <br>
        + *
        <br>
        + * drm_gpusvm_get_pages() returns -EBUSY when its HMM retry
        budget ran out,
        <br>
        + * because the range was repeatedly invalidated or faulting was
        slow. That is
        <br>
        + * transient, so report -EAGAIN to let the callers retry.
        -EBUSY would be
        <br>
        + * treated as fatal, and has other meanings in the VM code.
        <br>
        + *
        <br>
        + * Return: @err, with -EBUSY replaced by -EAGAIN
        <br>
        + */
        <br>
        +static inline int xe_gpusvm_get_pages_err(int err)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; return err == -EBUSY ? -EAGAIN : err;
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_gpuvm_get(&amp;vm-&gt;gpuvm);
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------5dgH0sn7Vq4EuM42Kv3chG08--
