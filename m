Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42595C25B10
	for <intel-xe@archiver.kernel.org>; Sat, 11 May 2024 00:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F4210E4B9;
	Sat, 11 May 2024 00:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZXmdt+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CB810E4B9
 for <intel-xe@lists.freedesktop.org>; Sat, 11 May 2024 00:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715386629; x=1746922629;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=sOKrCpqmvq4i82ncvMVHd2GUVgQ4JTDaE9bgzwJny3s=;
 b=eZXmdt+N4tKofkPJ8ivnrISnWFKaz4YCbrIiIZc17eKhA3KoSpBPbVXD
 +kAVd90u2FYfi2v6N2WnrYUm2A8wJvUuSmd6oJd7+JRvPyVw2pFWQSyVF
 xUmjKRxsLKNQmGTiJqH38l5Lmh5+/aFDa9j/sWCLcMiqPSDfvA1gBnwK6
 GIfBs54r0OeXap4Y23twbVQOsYEg9SeLq8looaD4PjdvE9NG4WwR7vNrt
 pg6qo+83ca53OYaE22+s8TswLv1h3EeOUcI3oILUcxXI1AFpc9ZW19Poa
 KlbFdAaLr2DJHyuvYjpfpF1UzXJk3VwjYA1bBwO6iBB57qT8tVZmQZ7O0 g==;
X-CSE-ConnectionGUID: f3nTfAr1RZmMdjghwh063g==
X-CSE-MsgGUID: TakD8bSmQIOT8iZJQQaP9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11523382"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; d="scan'208";a="11523382"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 17:17:08 -0700
X-CSE-ConnectionGUID: TnRUxuS8SNOtfr0cOmJbyA==
X-CSE-MsgGUID: BeIWD7yaTpaPWw+7ZXnV2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; d="scan'208";a="60946531"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 17:17:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 17:17:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 17:17:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 17:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzG4GiFzsWEG1yQVu2XL6vLGlOAiGfjdm46Ft2dqU51VhNhXD/DO8wIgAhnGgjEmnWz7RRM7ThZdrqy4Ad9gJTW8wy2mPErYIyoK8jPtDGj73OLV135V0LhEHrNe6C938h66XEEwe01ZwEKUSjn/JXH12MEedALboK+LD3ldSpCXAjWPlZgpM/yhUlHOU4PjXpMNRdNFyugifxKK42q5LugOpu5/ydRsVXx1s78cAMb64sijIHewjotcuHr4FAM6tlCq4EICyslcdAFeGgYiL9NtCfFMbyLe/ZJEwhOrw3A+76IIuVNsPRMJa08TcCqUSk+I6UM10mvfdvhwc/3siQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOKrCpqmvq4i82ncvMVHd2GUVgQ4JTDaE9bgzwJny3s=;
 b=aPmztuT2j2746SYbFBmNbHldfuynLKn2toBOP9mUVadfVqsNn/Y5xIQHYRagP6jpvEzncP3kHZzxYgwClwCGyhW1zAsJQOEkamep6cxOxo7SNCaqAKASeTl3JG2fh0Dyw+jHDEzDujq9693otCYaIL20y74LvB9Z702iZ09wcccqYhldiaBYWO6e7YTxbM2kfXRno9Qd18wxTwnclqG+HhOT8P/QiEreH/d10XHSM9wVmjoMSlp62cuSDof1rKlGP6RZhWwqANfBj6JNCeZ845h9MZiWjPDXyFyPU/huYcAvKE80xr9XPrS7K+9IckBfiASmFwMyJBZ8puVkhxHm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Sat, 11 May
 2024 00:17:04 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 00:17:04 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 2/6] drm/xe/guc: Add XE_LP steered register lists
Thread-Topic: [PATCH v8 2/6] drm/xe/guc: Add XE_LP steered register lists
Thread-Index: AQHaoCCrLS+kTzIuf0CedjwkQnX9crGRMNYA
Date: Sat, 11 May 2024 00:17:04 +0000
Message-ID: <4d68b6cc674d6350fc0e0ef1995c5ae00beaa691.camel@intel.com>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-3-zhanjun.dong@intel.com>
In-Reply-To: <20240507014736.1057093-3-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5177:EE_
x-ms-office365-filtering-correlation-id: e777b9a4-a397-471d-886a-08dc714fafd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?MEZudlBOUzRFSkNOUHpYU1BURDd1bTJ1eDQ1TUUvSTVjZXdYalRRYnE3aTVx?=
 =?utf-8?B?WXNKd3NRdFJrVkZXUkJDRU1HWVFrZzRaclpSSTJVUkdKL3FRRHRNb0VMZjgr?=
 =?utf-8?B?Y3lxSjRDTEZKUGFRbndiYmFVbW9kMjcrZzVoUnRYVTg5bDVYd3V6dVBmY0pP?=
 =?utf-8?B?dmY1SVY2YzVDSnJNQ2dXL0pIbUF5Mnc3SmdORVV4TGJNZ29qY1g4ejZYbkJx?=
 =?utf-8?B?NzhwR1JzMXU2RkY0M1g1SFVBbXpsUlJHYW9QbzQ3Ynh5SVhINGdSQmtONkVu?=
 =?utf-8?B?b3NBN1d5bHowdkRFM2taL1pXR3czem14UVBxR3BtSlZkdmluL05qYzFydFVI?=
 =?utf-8?B?MzVDbW50K2o3endwdzlkQU1sQ2x1c21iYVpjbWJJYVgzREI0Qi9za2NUUU54?=
 =?utf-8?B?ZGRTL3VFQUV3VkxoSDVrZlFES1BPOGRXcXFTT085K2pCQ1BTYm1PZDhTYzFT?=
 =?utf-8?B?dVMvOU9pelgwT3RCVW42TmZxNmg0TEROUmFzTE1LTlJJTm5ZOHMvTXBNUW1l?=
 =?utf-8?B?NllwcE9NdmlJME9MUFFPVGxIRXpTR2h0NmxoS2puaXJuZ0FTNzExVVF3eHpm?=
 =?utf-8?B?cVRKU0d4d0xGMjZCTWVIWEorOUF1enUrZ0FKU1ZSeGxPMldrSlQ5WkdBMDJ6?=
 =?utf-8?B?dmxZVk1vZE5SLzJSVVBXMEFqbnhrUnozS2poRDN3UlJyemNxQzlvdk5Ea3Nj?=
 =?utf-8?B?RDdXMlhMUFhRTzc0RzRtOGdiSU5hZzdkb3EyZ0tudU5uc2syckVucjFhdGk1?=
 =?utf-8?B?WUNHdTBVYk5BeUNkMzF2eDhwSy8rdjdLQVJZcFN6Y1RoMWRrQzFVQVEyL2tF?=
 =?utf-8?B?Y21BS1VTUzlXMzEvYVpiNDlaMHJ5a3BKaE81VWwvbnJpQ2pmMXVMbWhFdHFJ?=
 =?utf-8?B?TUJLOGRaVXJVTTZpd3dWa1p3QWhTV1ErVjU3RzN5bmprRm5Zakp5SU9ka3g4?=
 =?utf-8?B?YUhyRkFYT2FmTGkyNGxLQlBpREVUbnFlSkFhYXNxVlpEWXRhRk90ekpQcGJE?=
 =?utf-8?B?eXAySU1Ud0xEcGQ5VkJrVEJ5clBHazQ3MUNwaUVqTUxBVndxTTNZcDlnQWEw?=
 =?utf-8?B?YUw3dEJnWWsyRHNzUHp1eU9kbFpiMkxiSk53OEs1Tkc5QzNNeTR3d3J0K1dM?=
 =?utf-8?B?cXdHV3RtOVFpeFZZcTlpaFc5Q3FSM1V3cVZ4blVkY3RMaWFZMTlNM203Mzdx?=
 =?utf-8?B?MmNxUS91VVJ1TDgyRlV3WTRkdHhaYVdpVWswNlBzMDUxWURHbGFmdHNhOXha?=
 =?utf-8?B?U3AyNS9tVHZCR25pcDdYZFluTVdKektXZitvT2o2bEsxZnhkSlZnUlZHWlVo?=
 =?utf-8?B?bGVRN2dHTlY4d3Q1aTRsVXNLT01SdzNTQzY5UGFJQzZFWGVldTBRSVJDYVRL?=
 =?utf-8?B?dysyVVBoWEg5R3BLRWVLaHBwdSt1R1BmSDNCNTR0bk93NzkzaXNEd0ZSdWt6?=
 =?utf-8?B?THlQWGhRSXd2V1JneHZpRzdIZk9BTVd0VHExQTlmbGIwc2tTYWhjWFNVeGZn?=
 =?utf-8?B?VHVHdGZ2R1BYOGxGVnhmMndVZFJLOVJkRG1oc0FEYmEwRmFKTUswSUVxcmxF?=
 =?utf-8?B?RnNFYk1NUXJLdmpkZDdheWovZ2E4YWl1UzdrMENLM3g3bWYxVUxwZlBBNXlO?=
 =?utf-8?B?NTJtbjR0WHg3ck5aVVJDaFNDc25MY0doSDhQa0J5b3RXT0hZbE1GNXVmT1Rm?=
 =?utf-8?B?aHhGaVNmZisyUHdHYXJLUElIcHRVWU1sYldXazNwUExteTlWdlI4SDRBMUQr?=
 =?utf-8?B?ZzI4SDRoVkhzYjJTNCtKSndwQ3RZNXZMWUkwQWhXWStyUWkwTUpLMHAxYmZi?=
 =?utf-8?B?c2ROWHpYcE93RFFUVE9mZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGlWUWdWS2Q3VTJGa1JUM2NsRmp4SXpsamJVekdtTWlBRWhaME5xdVJ1TDBw?=
 =?utf-8?B?cVBOR0Vyd3F3RXZXN1NCK2dIS0hxVjRYekZGalZGeFlRcGRsWjJST0xYZ041?=
 =?utf-8?B?cFhzVmJ4YWYvakR6c3lOQlpQcTlOMXJSS3pVV04vS2o3TXpGdFo0Q084Mm9l?=
 =?utf-8?B?ejN2ekY1ZVM3bjNRaEdHODJFVDBiUmM5ek5kN1ZlUUk1UnJtTTNMTlBhUTNY?=
 =?utf-8?B?SmdHSEgwZDFodFVSb0dBSlBXUFh6TjFuUmtMWGROV3pjSi9hQXlvbnVyU0Ez?=
 =?utf-8?B?d0NHUUpuMEc1ckxXYnNOT1JIWnB2YU9HSWEwck03WExVTnF5eWxwYlNPU1NX?=
 =?utf-8?B?R2hLRUhONzZXaHMvSWtNYks0bEJNTFFtQk9pNXpac0xOMzJ0Uk9ObXJkM3BB?=
 =?utf-8?B?WGRVNmpLT0N1TUU0Vk9oNWtlcWFTMi9QRnpudVFoMitNVWhyR3pQY0NOOTRP?=
 =?utf-8?B?TFdJRndKZFJXR2ljbXZUZmwxc29RWmRhbllxQlIyYU5kU3RHRmlHY1FvTnVE?=
 =?utf-8?B?Y2R0eEVpcitpNnRJK3BRSllQNDJpcGZyeTIwUnZwemhoVkNDcXROZ0hKRWow?=
 =?utf-8?B?NHdtOHlYNDZxbXhWWURoTUl4Yjlsek9rVVlwL1dFa0dhMzVnS2xZdncyYUdz?=
 =?utf-8?B?Rk9XWjZhOVJ5WWs2aitwQXQ4SmllNVZsVTQ1M3BlVk1jeGU2akxPWUhFTjJn?=
 =?utf-8?B?OVlackZsNC9wUlJTWnFtN1kvNzA4ZXk1MVhqdlFoZmxzcWVnaGF4czVjRUlI?=
 =?utf-8?B?QWdTQVVkYm8vZWZVenE1MTQvckhrcDlvWHR3cUhKVFM1VjF1UmQwNFozNGpY?=
 =?utf-8?B?VGpqUDZMelE5VzFnR0pxMFVwZU4vVDUzcWJ6d3lHbjRqYTJiN0RPT0FiVHp3?=
 =?utf-8?B?aGt0emVZS0xsS3hac1RIVVBGTjF0VnMvRjIzUGY4NWdKSUE3TEVVaC9xZkZF?=
 =?utf-8?B?N29GU04rVmhYUXVCbFY0RXhvOVFPbDkvb2dDVTEyZFJkRmVNa3lWTFNNNExo?=
 =?utf-8?B?dnBCbnh6VXFOeUxucTZqTDZKVnFwQVFZSjNkeUkwZmFUZi9zblQwR2gxT3J1?=
 =?utf-8?B?M1M2bUVtOTl5NFJQQUJHcGRuRmNuWE5ueWhkTTVTNjVqZFlkcnRmckNraWRw?=
 =?utf-8?B?ZUNSN1ZjYnB6YzRlU3dlbE1ZZi90M1phb29STEQ0TnA4aGpJeDRoUTM2RCtW?=
 =?utf-8?B?dkkyMnZNbExLU2Zqc25EMTZSZHI5UWhYZTByQjlLY3FReVQ2UTNQcjNCWFpP?=
 =?utf-8?B?Kys5SVRESFZXTER5QmNPd1ZKZnRoL3E1c25saTFZZG1XaW42MmtlYzBJNjlD?=
 =?utf-8?B?TmYxT0J4ck4zRGNQbHI3UUFQN25CNWRBSlRRdXUzM2owV1IyelZmVU56OFNP?=
 =?utf-8?B?b2dOZTlnZmdPTVNpRVdlUVFNZDIrcGJycjQzOUdXZ1E2dzZOcEo1UnFTc29u?=
 =?utf-8?B?RjVjakN4eXk2a2gra0xPZDZtWVkxS1lXYkUxNDgyd3B5TlNDdXR3ZWNGZ2NB?=
 =?utf-8?B?blM4RFc4by9UVndlY0U4WGV3TFhjQXJXSVJaNytuZ1VtNVhtT0w4YkRtLzRq?=
 =?utf-8?B?bWQzRHV1U3htazJ1eUVrbFlQTlFzRFQ3WTkya2JWdEc3dWNrUzBZRTQzNEov?=
 =?utf-8?B?SFgwUHBhUmlxNG16NWlYS0EwajVnS2dCTGZwamVLOWpSVUhnWlVXMWxFWWRX?=
 =?utf-8?B?cndEYmppSnIyZVh3Q1F6cEY5elNORzJBMlBUZ3prVytrTEpIem9KZng3SjVj?=
 =?utf-8?B?THArcEhFQWQzdytQOXFTcTYrSGJxRzFYV2hIMVZ1N0ZrTkl5WkovMkF2aGVv?=
 =?utf-8?B?V29KUDJQbThVTHV3TnFCOUxjU1F1Z0tJU3FuT2pSdms4U21OZTV0YjV0OGVZ?=
 =?utf-8?B?ZWxVKytuQTJwQXVqZmdUWk1KakdDUkNldnZzK1NqdVVkSmw0OWF2SjBiK3B0?=
 =?utf-8?B?ZzFOTWtnNXpCcnoxN1JCU2RMdkJ0bkpER2Rpd3FaeFFOVHhxRHZvTDZWRzd3?=
 =?utf-8?B?SEllL244YzB4ZWtpTEVNZHJBYUM3dXFhU2o4bjZPVG1vRGVtOFZuQTZhVEMy?=
 =?utf-8?B?N2xYaEVFN2NycjlOY3NGY3ovT212a3dhNTR3RUp2d3B3QWF4dndIVTVaclVt?=
 =?utf-8?B?N1JjNmJndHdOSVNkYmMvblNNU1dhZ3gxY3ZZL2g1QnoxZSs0TkpxdFo0aXpD?=
 =?utf-8?Q?BNmsRlM6t6m5/YgxE0LuNmk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43EA941F4AAC4C45911D343B18325011@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e777b9a4-a397-471d-886a-08dc714fafd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2024 00:17:04.5376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mQWs6i6vK7yLkKcQKyay2K79oTO/amUuImCje96/1/Q/8lOh0TVbEwtuJzNlZcq9DlPveL3qi+gKHVyyfTTpGWukhucLAV7GD345g0J1VqyhbclMUCFtYqNG8ZrLgFe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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

b25seSBhIGNvdXBsZSBvZiBuaXRzLCBzbywgClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxh
bi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4KCk9uIE1vbiwgMjAyNC0wNS0wNiBhdCAx
ODo0NyAtMDcwMCwgWmhhbmp1biBEb25nIHdyb3RlOgo+IEFkZCB0aGUgYWJpbGl0eSBmb3IgcnVu
dGltZSBhbGxvY2F0aW9uIGFuZCBmcmVlaW5nIG9mCj4gc3RlZXJlZCByZWdpc3RlciBsaXN0IGV4
dGVudGlvbnMgdGhhdCBkZXBlbmQgb24gdGhlCj4gZGV0ZWN0ZWQgSFcgY29uZmlnIGZ1c2VzLgo+
IAphbGFuOnNuaXAKPiArc3RhdGljIHZvaWQKPiArZ3VjX2NhcHR1cmVfYWxsb2Nfc3RlZXJlZF9s
aXN0cyhzdHJ1Y3QgeGVfZ3VjICpndWMsIGNvbnN0IHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNj
cl9ncm91cCAqbGlzdHMpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0g
Z3VjX3RvX2d0KGd1Yyk7Cj4gK8KgwqDCoMKgwqDCoMKgdTE2IHNsaWNlLCBzdWJzbGljZTsKPiAr
wqDCoMKgwqDCoMKgwqBpbnQgaXRlciwgaSwgbnVtX3N0ZWVyX3JlZ3MsIG51bV90b3RfcmVncyA9
IDA7Cj4gK8KgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rlc2NyX2dy
b3VwICpsaXN0Owo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNjcl9n
cm91cCAqZXh0bGlzdHM7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rl
c2NyICpleHRhcnJheTsKPiArwqDCoMKgwqDCoMKgwqBib29sIGhhc194ZWhwZ19leHRyZWdzOwo+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSAmZ3RfdG9feGUoZ3QpLT5k
cm07CmFsYW46IG5pdDogb3JkZXIgdmFycyBhcyByZXZlcnNlIGNocmlzdG1hcyB0cmVlLiBJJ20g
bm90IHN1cmUgaWYgdGhpcyBpcyBhIGhhcmQgcnVsZSwKSSd2ZSBzZWVuIG1hbnkgcmV2aWV3IGNv
bW1lbnRzIGFib3V0IHRoaXMgYnV0IGNhbnQgZmluZCBhIGhhcmQgcnVsZSBpbiBrZXJuZWwgZG9j
LgpJIHdhc250IHBheWluZyBhdHRlbnRpb24gdG8gdGhpcyBlYXJsaWVyIGFuZCByZWFsaXplIHRo
YXQgUGF0Y2ggIzEgaGFzIGF0IGxlYXN0IDQgZnVuY3Rpb25zCndpdGggdGhpcyBpc3N1ZS4gSSdt
IGdvaW5nIHRvIGxlYXZlIGF0IHlvdXIgZGlzY3JldGlvbiBzaW5jZSBpIGFzc3VtZSB0aGlzIGlz
IGEgbml0LgoKPiArCj4gK8KgwqDCoMKgwqDCoMKgLyogc3RlZXJlZCByZWdpc3RlcnMgY3VycmVu
dGx5IG9ubHkgZXhpc3QgZm9yIHRoZSByZW5kZXItY2xhc3MgKi8KPiArwqDCoMKgwqDCoMKgwqBs
aXN0ID0gZ3VjX2NhcHR1cmVfZ2V0X29uZV9saXN0KGxpc3RzLCBHVUNfQ0FQVFVSRV9MSVNUX0lO
REVYX1BGLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHVUNfQ0FQVFVSRV9MSVNUX1RZUEVfRU5H
SU5FX0NMQVNTLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBHVUNfQ0FQVFVSRV9MSVNUX0NMQVNT
X1JFTkRFUl9DT01QVVRFKTsKPiArwqDCoMKgwqDCoMKgwqAvKiBza2lwIGlmIGV4dGxpc3RzIHdh
cyBwcmV2aW91c2x5IGFsbG9jYXRlZCAqLwo+ICvCoMKgwqDCoMKgwqDCoGlmICghbGlzdCB8fCBn
dWMtPmNhcHR1cmUtPmV4dGxpc3RzKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm47Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGhhc194ZWhwZ19leHRyZWdzID0gR1JBUEhJQ1Nf
VkVSeDEwMChndF90b194ZShndCkpID49IDEyNTU7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG51bV9z
dGVlcl9yZWdzID0gQVJSQVlfU0laRSh4ZV9leHRyZWdzKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAo
aGFzX3hlaHBnX2V4dHJlZ3MpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG51bV9z
dGVlcl9yZWdzICs9IEFSUkFZX1NJWkUoeGVocGdfZXh0cmVncyk7Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoG51bV90b3RfcmVncyArPSBudW1fc3RlZXJfcmVncyAqIGJpdG1hcF93ZWlnaHQoZ3QtPmZ1
c2VfdG9wby5nX2Rzc19tYXNrLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNpemVvZihndC0+ZnVzZV90b3BvLmdfZHNzX21hc2spICogOCk7CmFs
YW46IG5pdDogYSBiaXQgY29uZnVzaW5nIHdlIGFyZSB1c2luZyAibnVtX3RvdF9yZWdzICs9IiB3
aGVuIGl0cyB0aGUgZmlyc3QgdXNlIG9mIHRoaXMKdmFyaWFibGUgYWZ0ZXIgaW5pdCB0byB6ZXJv
LCBzbyBqdXN0ICJudW1fdG90X3JlZ3MgPSIgaXMgZmluZSBoZXJlLgoKYWxhbjpzbmlwCgo=
