Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D7606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 12:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y7wg/CjZ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UwIZR7gE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA5710E7A8;
	Tue, 24 Nov 2026 12:26:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DE510E7A8
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795523176; x=1827059176;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZkC7/jt4joPfl2+j0DvujzOvUcwDaxX9yQT8QJtumh0=;
 b=Y7wg/CjZj3a80DAXv5SlJxmnmZyQFxTyAiyzuqclfrhjUDdG4Z5JpXnP
 dslO6neC3Q0gcftDgIl+LjtuGUqoUbK8NvffcH/VbWUE+w6Ai8fU+S5Yu
 vz/M1SaLb1wKjJxrKnxi6k49ij4AU2JEHnr+ThMV074Mrngb5+j+epOrK
 b9rnXzgJwr0OOsRTNiEqFRczf5Cpxd+rvf+AgyeQcgwY0W2pSfeXpBV56
 4g4ohoxjVM9HG/faFl6gJSofwYVnJv/mwX4o5pkZ96sOBj8d31DNEOJOr
 QXg9jNnXDKzyuKFQgHspBfuAhVXL8R4fIMiktOP3GM0XuhzBhmp10UfrA w==;
X-CSE-ConnectionGUID: 55P6WBu0QJCm/mJPr50v9A==
X-CSE-MsgGUID: +phN3zvfTpy/k00bWf6KFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4245696"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4245696"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 04:26:13 -0800
X-CSE-ConnectionGUID: PKD11UPORyqsR7gmlgWGAQ==
X-CSE-MsgGUID: Ac6dHo7+TlaTTmYsvb9T4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11529096"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 04:26:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 04:26:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 04:26:13 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 04:26:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKD2S6bZIvU/F+87UMe0UuKZMi7upci+BHrjye1qLCpaLHEMNa0CYlZIgtjs0rj7y/Qt2gD9Kn+8MPLcaK83mPFLrtFk80SGVfe75HLcyFI/JFxjXHROmP4lZnPdgu9jHocTbqWYiXoUTMjruDcZXnkKN1fG/ZOl0nmz+EuemMtKrYzhKCeyw/DOg7iL3ovDdKA3ZBJCXObcqQRLbpZghmKBH0mNjb02lFpoBVhiA1CJxXZnng8GaP0GeFe8O5ZQHYuDGqVW6Kx8e/CAUeLGGmaETcOJ50W/ymRTMhUdq07tDxW97nI7MATj+i/KAD7h1Jxxtg9wiz27RlKCDCmrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V4H552WXokUfcBe1Z9kU1JTHz18LfxOKd7SL90oEnM=;
 b=uFJOsg80DZAQkoJNejhls53aHy9fd7jMVTxrlewsj0M2O0J7WsWTnCcZlbWKPIGO1YaeNH/Q8Tk6iZWFZxEeZ8sXQZRRbg3SUC1N4aSqlP4NWqu7Kv/pUOWgShmTHIxhr0yzgSr9V0cf3aE6Yt+Y7UM5ca9m7kIPBreLCMeanGQjfAQE35jP+les2c5c0MPvXztSuq0VpgSqFncdUrdEEC7hXelWkqvzpDv5dG0+JrvrnR5XMqQgeTcy34RwRS2qX0VWB0dPQISliFAz5jBwPDpaNTbgpVXOmkzpSNDZPCRhlbjOEuNWgrRGZNtVrlZftGkXId0pvX0CNxvMdpVvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8V4H552WXokUfcBe1Z9kU1JTHz18LfxOKd7SL90oEnM=;
 b=UwIZR7gE3rWlHsRzOrnRvihV/pHPAazCMcZ9TbEUbE+y710f+tQptCslnwKmQZAUNCUpmjmV7LVWMMRO9jFCfi2bEcjQ4heXqAazVwXpL3RGEWpxU4gMjSX9+iGXmtdjNpyj0MNW+5wUdCf4a13quBZ+z8XYdzoREsJ/9+TYEcY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 12:26:09 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 12:26:09 +0000
Message-ID: <9df8cd40-876e-4ab1-a475-9db39410a816@intel.com>
Date: Tue, 24 Nov 2026 17:55:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/hwmon: Expose powerX_cap_max
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <soham.purkait@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20261123170259.394360-1-karthik.poosa@intel.com>
 <20261123170259.394360-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261123170259.394360-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0349.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::8) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aae40f5-00b8-4353-f7c2-08df4a261e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: fpmK++m+ZINhVenwXLFjCWE5r26o97v5hs1aPofzcsewhClZgir2TBjF6zSFz7itt4K448NEFB5qMB64CzwBiRk5pUhQobTE0W4S9a1asH5ZLFcaPY/YxWzD3h4TmciiSntIy6CWVR2YQ4xPVO/pHfHgNa1Eek5EUoETiKCHOwBFP3W0JDKvizusQ9L4G6ncxpc4pvVgqov+ZrHfuaAMVmq4THSTwqw67ZnINxjrbJ2tZb5DbV60ESEOoLe2NhzmDuH6pcPSAvqyh2X6ybCqptwQMcGytwu+WKqiw7LOUs1CWkcSozIohYROBVCCDO/C99XS9jGjW9+o/WaggfQKjlQLLxWF+a/SVECCxuztb3YYZ2B2jrOgkw/8bA6bSC4tMjjskiZouEp0Z1FqI2QmX7DcK1ePXXKBXKa8gqqCiwiWmiEZlftY3stxTAX8oWfNWaQdfaLPtiCRypZLTqqZyCsAalHe1xH6Nk0VYXLyQ2aul5vBYsgq5024XV8xr9s8jeCsAcxOZu5DIjkf5rZNfXA1unRdhzHE5Y0LGMjKxAT+vc5yQons8HDHWkmEJki6XmX3xmGBwO01tjxeeL+E5Zu5m1ON8fHEzRwY5UbNYAfe8fjZfan+XFogPou5x3/i/GjiyIAuOqzCrgwsFC9Q0qbD8pF7tqu+YYMKVygbpzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWFxejVwOVl2anc3ZW9BeThsUUdKeStvMExSUVhxaHZ2dUoweUJXUFBCbkxi?=
 =?utf-8?B?c3Zkam1wNHlpRFdxSXh6NnJsYklXYmwxUFZFSkJHSXFFL01SN3ZQZkQ3bG1i?=
 =?utf-8?B?OWp0MkNwY1B0akw3MnFBclBlM21JanUzNnkwWTFicWtpa25PZlJRQVBudWhs?=
 =?utf-8?B?aHBhNFZSWHRCSUJBRWIxTUtHWjRwTVdoaXU3NEJNOGQyK2VXSHdQLzZoZ2Zl?=
 =?utf-8?B?d1NMRnpUcWltbzBWVmEwaHNXUU9XdTZKZkJGOXBVRXRrVnZGb1c3WGtMem1l?=
 =?utf-8?B?aFNRaTg0d2d1NlliUmpwTERHNFFsd2RCT0QrZWNBUWFMNE1iL0JCNEtNRHR1?=
 =?utf-8?B?eGU3NW5MOSt4b0dVNnlkMG1LV0UxYnprK3N5dmhyRDJJWmE2TUJTUGJUVU1m?=
 =?utf-8?B?bVdhVG1XM0tUYTZaR25EbXh4cy85SWdkNVQ4YzkrTDg0bzJNTE5wVEdrQkNP?=
 =?utf-8?B?WjRaMHE1M3B1RGlyRVNEMitWbXorTVFNZTRYKzFudVBvNU9SV0puZ3plbzY1?=
 =?utf-8?B?d1h0NkdQS2JKTnlZeStHMXUvdkJML0ZqNW1jblg2TFpWQkc1d2wyblVQeXFT?=
 =?utf-8?B?U1hlRU5yS1lPQUI2MXhNZjR1aWhYR0RHWEh5d2ZXQ3gwc1hlVmY2aVJwZHhx?=
 =?utf-8?B?SHFWQkV0bHlGWWtKbVpYcmprNDNSTy9sRFExd045Nk4yT1AyeUlSbExJNHRD?=
 =?utf-8?B?aGZNMVBaRTlpT1hMcEtDUE1uU1BLRWlPKzJXY1R6bkZOR1BYM3hjOTRYdG5s?=
 =?utf-8?B?UUljdk1lWTZYeCttZHZiTFFuazdCaFdsWUt2Z3poOXRJektmNUFPbFFNSGI2?=
 =?utf-8?B?TFgxK1pqMVhkUGRGVFhpRjVKSjltMnNmbWtxSGpyaUd1Vm1vcGtqd25BRVpY?=
 =?utf-8?B?dkFoMWJFMFBLRittelRzSk1ZTFo0NzhZendMeGJJWWU5MTE5UTM5elB0b2VE?=
 =?utf-8?B?ZUkxaFlYMFBadURxbHZVRURCcFVLNlNIMmFOQW1UWS85bi85MUNsK3hzWnNG?=
 =?utf-8?B?Mzk5bENYQjExd0hnMndyallINS9Tb09PWjY1YTBmYmh6Y01PUnRSajREWWZx?=
 =?utf-8?B?eExpaWZPWS9Oci9HUm1xdWFYakNrdHB0YVorT0R2TEMwejdaaEhnMy9zaTNy?=
 =?utf-8?B?Z005NnZFbDJoL0VBL0lPcDNoTHJSZVp1MXVuK0duQkh2TTZITVNMTjlJeElS?=
 =?utf-8?B?aHBQK0p2UG5Fb0c4RXZ1K1pQL2tuNWRoNFpTTnF4Qm15d1dGTHBzVE9ZT2hH?=
 =?utf-8?B?Tm9EQ2hlNmYwdG8xZ2Vzc3FNVXZkQmhkY2p4QnFWYzBNeXM5V210akh5c05z?=
 =?utf-8?B?dnQ3UG0xOFUyc1RCNGhGd21QZ1lXd1hWM2NQUGNCZy90RjRjSEhudm52SXhF?=
 =?utf-8?B?SXVmNzVoMGZybDFXVVJ4NGJqeXhtaVdrSitJS08xeEVTVFk1YzhWd1R5cW5p?=
 =?utf-8?B?d0xVVC9PdjZ0bUNIYi9YVjBHb3l5b29jNXJ2WFdnWlBWNkYxazJxU2J2Y1U3?=
 =?utf-8?B?ZGVkWjNGMjF2blB4am1BZFcxWlc2VjFyUlVUaFM4bTcvUktUWGFZUklDbjY4?=
 =?utf-8?B?eVdYT2s2Y1A4OEJwZ3BzSmx3cHp1bStDMmp2anVodk1VRVVyQk0xMmdEU1Bv?=
 =?utf-8?B?b0k3NVR2UU9McmZ3Tlo4RzV0R0k5Qm1RMUxrai9YOWdyTjJaaGwrcDFEUlh5?=
 =?utf-8?B?NGpRcTBaaTJRSXdVNnV5dUNyamVmT3haR3B0UEJwYWxaelo0bngzby9pZy9M?=
 =?utf-8?B?R3FDQWFCMmpPeHlHREFBMVFUS0hVQzQ0L0FzSTNrb08yYTJTT3c1ODJFUzU0?=
 =?utf-8?B?OGFkL3o2NERsNXdNL1VRQVZ1bE5BbU1PL3d5bElpb1NjNmN5YjZUS1ZleHJH?=
 =?utf-8?B?cGg3dUNPYWdlVTR2V05KaHpTdzdVK1VqRG14UXFnWVpONHNQaWJKc1o2MHBW?=
 =?utf-8?B?bUlzUlFacjNtMlZUWFRKQ1JlT3IxUkJaSTJickNyUHJueHloSld3eFY0KzRQ?=
 =?utf-8?B?NHlvb0dXQ1hQUmVRSU1ESlFzOFFkTDJOb1liS25JNStlLzdBQlhyckhpM0hQ?=
 =?utf-8?B?WmRhL0dKRHFHUm94MWJYb3VkL3k2Y0ZRSVhJT0RQZDZVYUd6eThaY0NiZ0hj?=
 =?utf-8?B?Q0V6K29VQTlxbnRkcHFtMCt1S2VjN0c4elZ5UmZoU0d6WUpxbEEyZDU3NVVL?=
 =?utf-8?B?UU9RQjJJQTBxMTJqQ0ovbVU1Mmo5Zk1RaDBkcDJERlBiRjdnUDdTSWU5ZWp2?=
 =?utf-8?B?UnFQUG04YS9yRWhmRmh1cisyRkUwWExSdFhwWllFdGh3TjBHQnBRUjlqdXYv?=
 =?utf-8?B?dW9HY1VRbk5pbVJUM3phRU9SallYbzRuYnE5RUwrRkphUlpMdXY1UmVQbks1?=
 =?utf-8?Q?OSGoP28UGU3e1PBo=3D?=
X-Exchange-RoutingPolicyChecked: GvNNz61nP7VyWs0sXO9bHLxDkBdT+KlWou1hZE4Qxu56/fxht88S/vyF54DRE8+xCpe46Q7Ai2Au4SDGDqVVGYXtnyTMVUxJHhYXSBg/ZL9TQ+RHdYfayj04VxiT9ypLfrFtob9CyoSIjTNdVirQQwp8h0VKny5pZrnMTcORxPaJEMUIEqpafHfeERqI7rEDKn4W5J4i9pKnVYxIF+8RD6Zph5t92tlCBmZpa2cSlDiQJtrosH8+JnDrZk+Em8Y227eThhhGeIZ6rX+kbksCKK7jj/jTp7qYsv7TImnS++/G/7pRVGHJcWU5FveiaF3OVtuKPSV6QwVpa+xrZ2xg9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aae40f5-00b8-4353-f7c2-08df4a261e81
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 12:26:09.4859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VvFQezMquEiIE+JaOhvgHLXnFvhbr6dd8HwoG9R82IAqPl0tRC+JZHn8yZmNQm82yRciON7HFN9HUgIiiwdCV9q+zSlO4PbqjahD6ytrh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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


On 23-11-2026 10:32 pm, Karthik Poosa wrote:
> Add a read-only power<i>_cap_max attribute for the card and package
> channels. It reports the PL2 (burst) power limit that firmware sets at
> boot, which is the highest value userspace can write to power<i>_cap.
> The attribute is present only on platforms using mailbox power limits
> where PL2 is enabled at boot.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> v2: Update KernelVersion to 7.5 Xe hwmon documentation. (Rodrigo)
>
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 11 +++++++--
>   2 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 0da739d9a816..e66e730f5ecd 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -296,6 +296,30 @@ Description:	RW. Package burst (PL2) power limit in microwatts.
>   
>   		Only supported for particular Intel Xe graphics platforms.
>   
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_max
> +Date:		November 2026
> +KernelVersion:	7.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Card default burst (PL2) power limit in microwatts.
> +
> +		This is the firmware-provided default limit and the maximum
> +		value accepted for power1_cap.

nit: Mention larger writes are clamped.

Looks good to me.

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +
> +		Only supported for particular Intel Xe graphics platforms where
> +		PL2 is enabled.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap_max
> +Date:		November 2026
> +KernelVersion:	7.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package default burst (PL2) power limit in microwatts.
> +
> +		This is the firmware-provided default limit and the maximum
> +		value accepted for power2_cap.
> +
> +		Only supported for particular Intel Xe graphics platforms where
> +		PL2 is enabled.
> +
>   What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_interval
>   Date:		May 2025
>   KernelVersion:	6.15
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 42c2f9129da5..8b848470d5e5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -865,8 +865,9 @@ static const struct hwmon_channel_info hwmon_temp_info = {
>   static const struct hwmon_channel_info * const hwmon_info[] = {
>   	&hwmon_temp_info,
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
> -			   HWMON_P_CAP,
> -			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
> +			   HWMON_P_CAP | HWMON_P_CAP_MAX,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP |
> +			   HWMON_P_CAP_MAX),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> @@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   
>   	switch (attr) {
> +	case hwmon_power_cap_max:
> +		return hwmon->pl2_on_boot[channel] ? 0444 : 0;
>   	case hwmon_power_max:
>   	case hwmon_power_cap:
>   		if (hwmon->xe->info.has_mbx_power_limits) {
> @@ -1486,6 +1489,10 @@ static int
>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
> +	case hwmon_power_cap_max:
> +		*val = mul_u32_u32(REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl2_on_boot[channel]),
> +				   SF_POWER) >> hwmon->scl_shift_power;
> +		return 0;
>   	case hwmon_power_max:
>   	case hwmon_power_cap:
>   		return xe_hwmon_power_max_read(hwmon, attr, channel, val);
