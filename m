Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583C2606A32A
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AIC3syEl;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=g5nKWxZH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DFD10E2D3;
	Sat, 21 Nov 2026 12:14:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F2D10E29A
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795263242; x=1826799242;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pnAw+6vHdwdwTlFFuslXpi4dGhGCaOoITt0w2+ww+7g=;
 b=AIC3syElZXYz/XYKEcABykWuz/Qm3OcbWkOMBfBozbod8n3wQhqv1924
 5WC7+HO1zGWvZ1LaVqcmWs6IXKwjDyx+yVWJH7iJPgxhTcxAKJ1cfaH3U
 VGYQJCLrp3nrVnpHYPECMM19DpMlZYMwQyJfqLkEcZmt7WXuxjaM9uiHW
 MajBIiERo7dqIDPIM4M0FIbjqEFM3dC2wJMqLnUQuWF6GfeMSKAXNKKte
 voJbB7xuxPwTF3Q6JuB5AIJfjMpomYOdrARRIpOZy38gszvRmJ+54grl6
 z4/0JCIWeqGFJMJUUoajTecoE8DMi4Hm9OFRrhdsU3hrpVUsK9c0/EZlq A==;
X-CSE-ConnectionGUID: tDnX+yGcSESPcs6FinmrwA==
X-CSE-MsgGUID: EdtwWWpzRX6xqUpQB3KcXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4173081"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4173081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 04:14:02 -0800
X-CSE-ConnectionGUID: jRFZPQNORgiEIUWDqDU3MQ==
X-CSE-MsgGUID: AfdjUBoJQeeZwv9GoC1JAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="11482189"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 04:14:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 04:14:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 21 Nov 2026 04:14:00 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 04:14:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rG4kgnTPim4tnVTcbT665EMNz1bOo6ny4ALHfy1un29OCHU4bac8gz9AUnIUcUVTUVgvjAplYi1bk1KyKsk8xLMxf1u7g6pJMLn5qL18FHcqLRMSLZ95aOE0ToSzRvm9LZz/fmOq2UKpdFgHsDv4liw/yd93feJo7CCZJwXcqJWYvYzEiGXIQLbSK6CZw7qjY1ykmQO5NV3ZqTdhuNQnGu6+/KpFV7HMIE+ECaR+3oCLEgE+kO4KcR12Z6d5qwKyuF0SHyFKXIE9PqHy2c5wGsNFYB5kbSFs8HVoclcuKCGML7knYXCHpyccvFzPpxy0740CQ/xqyEomTa7cauRUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HceNEv/tKCRWn3PSmoFphG26QyPHcnKkpnheNITY0iA=;
 b=fNeCnYploZkZHqfqdmBf/NusYGOY42W875Z+yOjyVazFnqtP3dsIYFlUwSuJlyEMcI5DrFIjDjQbIu6z1Op/icpYc57qsKYzJtKr1H1owzuEcFrHz2dZFCcANdQrXeanNila+9QCIot6lxevYRhbNDJn9zSROJGkXzeu6Almm6VfVgANZpB5KxiS81TpNn+z3NVUNLs7j6jlvl4WBReXaLXxYAm9jO4IfMq9DDuUt5UAniK2C0lGRL/t8Hc6O3T8BOoCeeM2NdFVJ6mdjJhewc0M9B6pWwXrfzp8Ol1vYAC+ltfAItaWQgWHqVwaNcdH4sCMh3F+Lhn1zqs2/fDgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HceNEv/tKCRWn3PSmoFphG26QyPHcnKkpnheNITY0iA=;
 b=g5nKWxZHYgKOavqJwMMbfs1WBq/XWPvHlkRFoHmcWztKcG6s+ycXl4Ia0Z5g9mrXETrBD6pEM164cjBoPBiEQr5TK6LmdQPVh/5ru9C1lL3NJUzLUupJDcd/OyDHwzZde5l69jsiVlw5PL7fUuxqsTROGe4rVXiS42CkOeprLaI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 12:13:56 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 12:13:56 +0000
Message-ID: <6aa8c37e-4753-4c88-b729-9e115eb796a6@intel.com>
Date: Sat, 21 Nov 2026 17:43:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/7] drm/xe/oa: Free the OA buffer and the stream after
 the stream destroy
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <matthew.brost@intel.com>
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
 <20261121020145.147384-15-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261121020145.147384-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::17) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|DS7PR11MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: b90e1f7e-c72b-4565-fb7f-08df47c8ea52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261022113327099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nHGK+GCXaDj60mh0Tf1XliCCDJgkEaD9nQ6CYs36S/21+W7ahSPYDKx5PD+7wMZbVNioo6+99aOOAYFCVQVc4jsoSlzRSGty5HMw3yBwbxm1HO5xjH52l4K0z7kC6nZh/9mTNqyl3C6adfeULKMg7i2gVyoXqiWn+uR+/AcUtB1gp24DuU9VDLkcwuFcM4LvP7vhaeheJIhw8fxLk1S1Uyv6h7Fqnge2xcZ9KSUnAqGeLbJjN0iIBdWtPghYutCtsu4/p0cpG5td+iC3JeP1Cv/woXwapaO8Z+SZDQa2cdB7vPUgC5QzM9hXwDnaeAK0lKLakzyz1jtFD1K9WgVWHkzrrH7jQoolHnFswgI7jWvllFzjLX5iP0xR143ABRcmGtOFCgRT64otiWflfTzFfa7YvtZ0BspnWbMl4cOn0PFwuRoIz0KHZqFmTvCoph5ed3PdbrTiWuqAbpV5Z7agN3zWY+npGU2crzfOfhw2woWpmGGZXyhzHOVtDXkvQGwtyVq0QM6wUDbXb5KvFNbjTvC87lpDOiRVB16iK+UkiL6XqjKOxz73ZT1GK5AnPOuxh0dLUctrGcMvygKxbUgKwcsSbaj0ZPED30GngPq5DyLBNYVFpUw++FwR5WPA5Dcmwh0/zZ9dXRiH5F6vq8pCUmONOODEvQDgad/6sdCcnMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261022113327099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0ZocERWa3ZMVzdQQlkwdkxaY0cyd0xBK0RGRXlhNCs3L05RSTgwcS9qWDhE?=
 =?utf-8?B?YWpqVHRwMWRQeHJBODR2REdlekJOMjBvNkI3d2ZITDF1WVRaakRMN25hSnVS?=
 =?utf-8?B?MW1ONlJkQ2ZXaHdOM0FmRnNhVlpYWmtUZmsyMjZ0SGZTcDFnb1R3Nm92K05I?=
 =?utf-8?B?YzBodGFkN1IwS29FR3UzeCsxZkhtNlJiTTQ2UTB6QlVQSTFEd3Vja0tSS1N5?=
 =?utf-8?B?Z2lkaE43UkxRNWNBK1NhamhMLzJrWWMrTC80byswR3hKOXZsMlFGeGljMW03?=
 =?utf-8?B?R28rMXQ2b0E1czd4VTZNdFdWQzJsbVBwRENndG01V2Nta084a2ZqUTdQMjda?=
 =?utf-8?B?bVJNSkovTUZnRTJLTHQ3VWhaNENsY3huYTdRQmkwKzN4ZU5HeGhSRUFYdm5x?=
 =?utf-8?B?NU0xQkFCNWVLVFdLcjZSVnRiaHlGWjhtcU0yY1hPSEZwSXFKVFVqZWpxczJW?=
 =?utf-8?B?M25VWWpIeUFRbTJKK0s1YzNHY1FVeFZqeDNjcFc5bXYxZG9MazdSZUdQQjZQ?=
 =?utf-8?B?Z0JxSVo0QllCZ1dXQUdRNHNvUVk5c29JWVgwK1g4YWthY3lISXYxc1V0cjJL?=
 =?utf-8?B?ZkpPbndZODBjZlZTemhLSEZZUXFPNkhmbkJtRkw5L3htTnFoVjYwd3hQRlRX?=
 =?utf-8?B?dlNQbzRpcEhHUElJTDNlbUM2QTNkWHprK3F2emtqVTFGWVpURDBhVlJNTVV4?=
 =?utf-8?B?Q01IQmVaREE0bVZ1NGdVR3g0SUUwQi9ROXdncUZEaXU3OG0zYVh4MHVlSUZr?=
 =?utf-8?B?UjlveDNIRVFqV0h0eU13Qno1ZFhYcFA1eEtWbXRSbU5tK0VpcUc1MmZEU2NT?=
 =?utf-8?B?ZXNMbU5NdmZXWGlHc05rcnVTQ3lXKys2Y1phNGNBZ25wbk9lRFVTdVA4UjAy?=
 =?utf-8?B?RTV0QVdweWRnRHd3eFBSOUpEWEUvNGowRUdBSXY5MFhkeExJQzJ1UzBZaWdH?=
 =?utf-8?B?VE9lYUoxMjFydzhvTXBXUlN4VGF6UGtmZ1E3OW5Oa0ZCOWdSQm1qQjNTOHV0?=
 =?utf-8?B?QTNuYXlTWCs4WmlPT2NOdlNYM1k2cHRRRGRPMmFZM2JVcDNjZnBXRGlFRkN2?=
 =?utf-8?B?TjkwbFJFc3NEUktCSXJTSG9hMU53S3FJb2daTVFaTHBub2o3MUxzQTA2dXFE?=
 =?utf-8?B?aVdKYUZRTEZYZk1CNUVLdkJNWmgwS0hraG01bGZhN1Fjdk9mWkE2Q3BLTi9E?=
 =?utf-8?B?Q0JYKy9PVy9ac1pRekdTM0FoUGo2dW80ejJBZGhPc2QzWVI1Qm85elQ5TmxR?=
 =?utf-8?B?ekIrTXMrMU9iSmVrOVdqRnEwMWsyTkp1aDBlYkp4bnBwaHcxaHc4ZkprNHdJ?=
 =?utf-8?B?SjgwbW5jRUowK1ZSQUd1QTMrbDlSR3VPdmtxRlY3cnpEcU05QTRreFpUV3RB?=
 =?utf-8?B?OVUyTElQdjdDajhRRVRVYVZSQis3MklvYjh6M0Jxd1A3ZHgrL0VJQnhONk5j?=
 =?utf-8?B?cVNZamhoTnZuRnAya3YyeG0vakJBVXFpS0I2aDRCNXF6K2FsSzF5U0gzNVBr?=
 =?utf-8?B?dm5vcHVleGlIOVh1aHJBQ3IwM0dXN0N0d2NlbVBqd1JURzRzQWVTTStiODFm?=
 =?utf-8?B?Q1YrbWVTL21NT2xVSWttNkF1TDdqMVhUMnRualVQNkFxMDBEVlE2KzBqNWFS?=
 =?utf-8?B?bFcwVUIwejR4WjlDZEUzTWNsZGFrYVNSbUZ0MkkyanQ5SGxrbDV1TitONXdL?=
 =?utf-8?B?ajNEVEJva0hZZE05Q2MyaVdWdWthemRtcWV2YzdYSzNmOWg4QTY0TEZ1ejlV?=
 =?utf-8?B?U3Y5a29uZE9EZVhFZTNLclJSWitqcXRQS0lEdk9qU0diK2tLUHVzNFZFU0ts?=
 =?utf-8?B?Y1BJNzBEQ25nblpSSmRGNnkvd252ek45czhZdFZTWUN6Wi9Na3JwWnNNSWpm?=
 =?utf-8?B?a2xrYmdIV0JFVFNpTmRBVURBanFDdGsrc09aWWhzRXhJR2pBRjBOdWs0ajcv?=
 =?utf-8?B?OW1wUlg1eUwwOWREdnF0Zy9pL240VENKbTR1eGM1Wm05ZThWOHAzL1VIV2Q4?=
 =?utf-8?B?Vnc2Q21QK3JOMDRFdHlsQitiOFFPK0lXbmtLMzZCZGRKK2pNcFBUTHAyMXln?=
 =?utf-8?B?eXA2Y3MyaG1kYjlzRlJ6VU9MUzVReVNHU2lBRll1YkhXYVVnVG5oVS9LM1RH?=
 =?utf-8?B?dnlSSVVtelZFdjVUYjE5ZDNXdVBjWEdueUFtK2NSWWljelFVNlgxcS9GeDI3?=
 =?utf-8?B?SXRBUHBuQkY2SFZrVHlOOTVwWHBEdmQ0YmdLdktoUXk1a2srMTFURjlGbnYw?=
 =?utf-8?B?UHA3bUI5Z0NLTk9xOXVQKy9WNmxHRGxTQi9veHRseldHTXUxdm1WNk4yQytG?=
 =?utf-8?B?OVI4bE1qUzBRVU5yYlcwL2hiU3RXUGl2b1owN3pxbjRvOWUyUmpoQT09?=
X-Exchange-RoutingPolicyChecked: mzwZo+cvEYNXTOFvjbflxNxyBRhUAdFAHC3u1X1XMQgIlz2w1cTod+Z4gOSmLqvUOL8HcEW3qFwtHyZZS0nZ2aDt0kN+EpGLSSwgwUlIHKRt6Ot0AKukGNCH7HgLUyZqdl2EJkKIfLxj1L7J706JmRIuKPbqH+HX3LEFtGiS0BoSRnsn9ct7ldYgSECGoI/qxWQnojkBiE265oxTJL0EmGX7mpOsOUHxGOl1DSBxNXPOCj0byQeK01rn1Ibp3n3IGKKnO2a6xQcejod1/aJB4tZxvTaZTSAzpHQzB1I7WhEaQ551WTCZJq+FKAzPLngbQhyTRLmnw90/IJSrO1pnmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b90e1f7e-c72b-4565-fb7f-08df47c8ea52
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 12:13:56.3114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZ0jPfRZYUQgemxLNJLrWLvjRXe5nh+OV3/6LnvYKgoGS7ArmlGZw9jOmOWHQgj+7aw9Uy77ZkfDOa6NnUcjlIHV5F5sEx/79h+EQnFab5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
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


On 11/21/2026 7:31, Umesh Nerlige Ramappa wrote:
> Free the OA buffer, destroy stream_lock and free the stream struct in
> the callers, xe_oa_release() and the stream open error path, after
> xe_oa_stream_destroy() and xe_oa_destroy_locked() have released the
> rest of the stream.
>
> This lets a following patch release the stream resources when the
> device goes away, while keeping the stream struct and the OA buffer,
> which an mmap may still reference, until the stream fd is released.
>
> The OA buffer is still freed with a runtime PM reference held, by
> xe_oa_release() or by the ioctl in the stream open error path, so that
> unpinning it can't race with the pinned BO eviction of a D3cold runtime
> suspend.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v2: Free OA buffer with runtime PM held (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_oa.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 3f51dca91c51..9c4c4548c4a0 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -929,8 +929,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   
>   	WRITE_ONCE(u->exclusive_stream, NULL);
>   
> -	mutex_destroy(&stream->stream_lock);
> -
>   	xe_oa_stream_drain(stream);
>   
>   	if (stream->sample)
> @@ -939,8 +937,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   	xe_oa_disable_metric_set(stream);
>   	xe_exec_queue_put(stream->k_exec_q);
>   
> -	xe_oa_free_oa_buffer(stream);
> -
>   	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>   	xe_pm_runtime_put(stream->oa->xe);
>   
> @@ -1769,7 +1765,6 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
>   		xe_exec_queue_put(stream->exec_q);
>   
>   	drm_syncobj_put(stream->ufence_syncobj);
> -	kfree(stream);
>   }
>   
>   static int xe_oa_release(struct inode *inode, struct file *file)
> @@ -1781,6 +1776,10 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>   	mutex_lock(&gt->oa.gt_lock);
>   	xe_oa_destroy_locked(stream);
>   	mutex_unlock(&gt->oa.gt_lock);
> +
> +	xe_oa_free_oa_buffer(stream);
> +	mutex_destroy(&stream->stream_lock);
> +	kfree(stream);
>   	xe_pm_runtime_put(gt_to_xe(gt));

When you said you're just gonna drop patch 6 from the series, I was 
worried about whether you'll remember about freeing the buffer before 
xe_pm_runtime_put().  Since, the change is present here, it LGTM, and 
with that,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>   
>   	/* Release the reference the OA stream kept on the driver */
> @@ -2051,6 +2050,8 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
>   		xe_oa_disable_locked(stream);
>   err_destroy:
>   	xe_oa_stream_destroy(stream);
> +	xe_oa_free_oa_buffer(stream);
> +	mutex_destroy(&stream->stream_lock);
>   err_free:
>   	kfree(stream);
>   err_syncobj:

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

