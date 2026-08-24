Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E877C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 14:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E44410E569;
	Mon, 24 Aug 2026 14:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/mdLG7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3748A10E564
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787582719; x=1819118719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ikQGijzxe+NH1zV2rz7h7KHD3jVklK5nsFD5Jy6eWtE=;
 b=K/mdLG7Mi3VW7ov+UW39TaoSC3eDYsdiOThtV+ewsiNlXkJAbxAwU6fX
 v4sfvb8yynFU3W7S/dwl08f2v3thqg2DVyBSdzU63uSIcfpFbVIl05xnQ
 YFTJT6w1XDZvpQWGl0xeuTB5Fdi/gtYRx6977bY3xRi4TMvQ0v0L1vHhN
 nmltP5NJWSrhWHpwbMB/8JDxzFEtsDEkazCNW7v88IelP0JkWMkv1gpW2
 0pwckTRwZAAb9R8vDrF5VwkIiljYxfn9X/Z9uXvUc0lc/jcaxjGeOM8hc
 3wrMdabQmKqlp6K1QhlUQO7eZorb7GQHPiyYGVdtGgz/7apF4AqEAN6Dg A==;
X-CSE-ConnectionGUID: Xmlv9EdYQzufNpbcjqLinQ==
X-CSE-MsgGUID: ngFARDS0QFafbnwjXxZPbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88049647"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="88049647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 07:45:19 -0700
X-CSE-ConnectionGUID: 0SHqOk62RsOZpDUzVcexrA==
X-CSE-MsgGUID: g3Bzzq4hRkWfvuUOs2BXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="271229838"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 07:45:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 07:45:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 07:45:18 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 07:45:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRs2d6sZe/xDjX9BSkA3UFsGTn/21sIik6kGCuJ25EwObm0fZoTLxoawjXVYndoZ0NiTqp6oVmWcYYplPb6v4pEjxOExULq2bg3JfqsetK6/DkUM/MoASa3u1S+ttB3+G2loU57NEoDzffGXct3c+hIXbJwPveLDM332/RxM1AZxbW45yAsBzKpGd6yAIuJohFalPIfarAYvM8kyn2as3cTf9IVeciV1+cl98XFSlSQKGyyaU5axzCioYmDcR/cYc92+H/vxKRpavRq9p0IDRzz7DXlJfCbbtEg845M80bCkL5y5fY+JcghZQ3pXdl2/2VKmrD44PiKegwlVM5o6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikQGijzxe+NH1zV2rz7h7KHD3jVklK5nsFD5Jy6eWtE=;
 b=G1nP2WfWk9LebUHpzi6lS/gQVfFpFYEXaTcaIV7zHzhwvVuhDHz/TgxXZ204s4+5UzhbYNCT1ToO01ECuDR8PQmqwt/J2QjkfVbAlyywxC8Uj0HofkIe1HL7ithVh9jSSSxbo7iqmthfhobUd7m6mWdMWgjnFWkjE7gXjJ9iIYv9Et97uAhfFan+yRQ4Y+2wW1JXuqdcQ6NMsVUtoNhcHjjVHeQ1AkoqDTTX90iswyFlwTyGzwebdPlBxkaJ9CsIddJoSdghepphmES4whW+bZ+9JgxA2lwUaYT/53ZPrKs5KNPVpQyXrIEjbFY/vpCcj3rqQCQ8ZPegJ7LOLuLXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 14:45:16 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 14:45:16 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH 01/10] drm/xe: Guard configfs attribute reads in getters
Thread-Topic: [PATCH 01/10] drm/xe: Guard configfs attribute reads in getters
Thread-Index: AQHdMOfaofGfsg+XqEukhLQY+5kVCrao+UoAgARTPYA=
Date: Mon, 24 Aug 2026 14:45:15 +0000
Message-ID: <940a6dd2fe49676e0255cc7e9f7d4400772d0612.camel@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-13-stuart.summers@intel.com>
 <20260821204216.GB422236@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260821204216.GB422236@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|SA0PR11MB4607:EE_
x-ms-office365-filtering-correlation-id: 9f57c4f9-d41d-4356-8e8d-08df01ee4fb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: gvgGqaxc5o0j/7uM8uhnG1iB6XqDur2NAx9gHZjKfrrjt/aDFQFn+Te1x6zefzQ9/f2a0nk4csa+c05lc0FWotuN0vxoUttxlNc0r3CuNUC6KPnZVmTxw4yb4shKGOwVAk3eRJklkTfM1s9yfJxTGqQQTTDPPeC+ZE/07zwxk1H7yBJPfWny6BOzgpsgPP2ApVYKEtQXk0k2TqfR2Xb1APbRqTHyltImqcMREMotP1ehjRh2T2/12fSfnGFrxZAbNke36qx4/6nGCnP/Nd3LYiUToM/ZOG1/u4nFtUYLf5dw0PBOJ4Y/Nhg6K67MAcYJ59eARDLGTe2Ajxhn/vFR/BMAApaoX/DVNJEHQQFShK5C6H5SAa1pF20js9YlcWb0g5AW3wlw/eACvSUag2msjRBEw5L8CV0xsYL5//yHYWLmYBym4bqJbK7wrzgT6tz6jfnU4aRYItFIotyNa80LAA9s/EkyU9UkOrmucZRb2UwiYHpAvh+qn8+SKY/HY+imLJL85wYIVU/YoQYboPHTJqJQkAEKIJgtYL9kyi5GU4xBW8vlnDKezWdsgXqOp1Y6PsA2BvLfCEFzwmbYQARr/J9ThmGEeaF5Z5aEzIWR+qC/j23Dszas6ggEeLw2JePafmXdnGsMMAcmWPHVAqSiz5Ir54oCGDNn/tkDHtcOWzNyhGO3RKnDOzhgyIQht4VMuxMBzDaq7BDN7CUaLPCF1JkDY9E/Dm85yIS6w51QLuQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aE92NWxjZE9NNTAya3BqbjRySjhUS2prNkdvbUNhMGpycVU0UGJtNDVpaUxy?=
 =?utf-8?B?MVl6TFpYWTNYcVhFSnRHcU5rUld3d0t5Tm5XUEJia0lIRFFhMFI3QzBmV0lk?=
 =?utf-8?B?bmtPYm9hcmJ3NUxMa09xTTg1a2E5bzlEWlhnZnJNdWhveExKb3lYcnF5OWhM?=
 =?utf-8?B?aVF4L0xSdnp0VkpWT0lMNy9mK3ZOdU5NM2VPRHlGbEsySFBIU3VXcUpUa2Qv?=
 =?utf-8?B?YnFBWnhGaldCMjNkTzJxZmhLZ0wxc2VkQU9VK2NoM1pzTVE4UVJjNThSdTlB?=
 =?utf-8?B?SVNZQ01udUJvcEIwSitYQTBUNDJ1Q0JydkdoTTVIbGpEQzNETHZJc2FWb0lL?=
 =?utf-8?B?eUw0Ui9yYVBvbFcxYWpIZk9vbmlDM2pQQnpVdUk2THE2SERaajc1L0lHTlM1?=
 =?utf-8?B?eTZqM3dOTVdhWFNsaEx1VUNZaHhQeThHYUp0VnRBc0VKRUFiYmlMMUoyRFV5?=
 =?utf-8?B?cDRTMWEzVDh4MVIyU25WaTlrTnFCQnE3cGlkZzFLYkVXOWYvbUlzTDNHVWVl?=
 =?utf-8?B?aTlSdnYzbUErdmw3Q1pXdUQ2WHZUM0ZqaW9xNzcwUXBPSDMxWFRzS1hnRGgv?=
 =?utf-8?B?S3REQkozRTVTb0hKcVRVV1lYRmxPaEs5bFdvYlZTdVZlZFcvR1h2elUvTWVt?=
 =?utf-8?B?Tk5ZZkxjTGhabmt2OVhFZ0EzVTFSK2hIRisvdlU0aldTbzY5dHJjaTdLaDRR?=
 =?utf-8?B?RW1HRWhCVVZoQmlnMUR5N1QydTJOeXliOWp1L3lwVEpJdXlZVjRUOEF2aDNi?=
 =?utf-8?B?em1wY2ZLYXBDaWc2UXRiR1hXOHBUZFlTWUZ6ZTd1ZU9QZCtRc0FJMjJPc3Bo?=
 =?utf-8?B?cEZZUVBmS0QzRVNkTTl0cDdmaEwzLzU2TkFaUFlwQTZ0cWw0NXlaTDBSaGZL?=
 =?utf-8?B?Q1ZzcW5SV0RONlB6TCttQnkvNVhXLzNTWGVwYVh2NzZUWVR2YXVicEEyUGVa?=
 =?utf-8?B?cHNiL0xKS3B0ZkZJekdQTlZXUjE2cmxUbmNpeml2RE9HS3dHUmM0QXEwT2kz?=
 =?utf-8?B?WE5lQlN6N1ZTVzhraFJTZENLdmVtZW5DKy9VVHY4bWpYNEJZZE9mSmVTMWRT?=
 =?utf-8?B?OFpZRXhnZ3pCWlB6UVlyTllHUHZ0Yks1MjB6dkp5Qm5jSjZqM0h4NXBndWZD?=
 =?utf-8?B?MDNOZjhIUnFQOWtEVThPd3p6aUlGTmE1YUdYWllGbFBnWGNGZXpWZTM1OENQ?=
 =?utf-8?B?Z0cvdzdaRyt4d3YwRVpSVzhBYklCQkUzeDBheWxiazF3eVg0a2ljeG9sb3Fz?=
 =?utf-8?B?WWRoNnVwSHNsMm1hcnNDMVkxdStrSHBTWmZxQk1ZdUptNExPY0l6VUM5dTNG?=
 =?utf-8?B?azJxUXdsdjZsN3QzVFJ4UlpyZWNpcVIzYkMybGRqT01hcHMrNmt2RWg2ZFE2?=
 =?utf-8?B?Ulgrd1ZqVlM4VSt0MkhLMUhaR0NwNUVQQ1NiWVpqREdQZTk3cXFZN0ZFMTd1?=
 =?utf-8?B?NVl1MkZybWl1NlRWNW9zVGhNUytmL24wWXdUeVFwdVlKdDVYK0JDS2tUZm9J?=
 =?utf-8?B?SmROeG43MUVMdjFLbnh4MkxsMWVRVGVZVk44VXIzL09ONENRakVBVnR4S1g0?=
 =?utf-8?B?TEROdUhPRjh4bTdyZmRMald5SExQNDVUSUIrem92ZDB4eE9sVER6SmNvdkhB?=
 =?utf-8?B?UjhzckJ6SlY4anNLZ2lnRjBVRW15Mmg1WWhISWRxSEx2MkpSWDZhaW96L3lK?=
 =?utf-8?B?b2dWYUp6UTl5cWVsL2NMOUl6N09jOCtrSmtMblJMZTRscmk0czVwUGVVNGhV?=
 =?utf-8?B?ZS8vZndzNldFWG5UaVZvMzJkN1VkYXFid015ZFJUWXdaSjhEUnlkVk5kQXV2?=
 =?utf-8?B?Z1ZSY1JHVW9QZHp0V0c1NVE0ZVZacjNCZVJUVUt2T3l1SGloNFRVaWVZVWNj?=
 =?utf-8?B?SW1Ja2RuZ0JZR1ZUYlp6WHloQkRyZTYrTWhneisvUzN3YkxpeWNvZUF1T3VX?=
 =?utf-8?B?blRUdE9GeU1zdjRudWNiRHRpajJLL1cxeXNFbm9EUlB0dGNpZENUUzFaUkRv?=
 =?utf-8?B?MXdHaExVV3NxcEhDOGlpd3JodVJnS2t5c3J0TmZWY29vSnZrc3E5eGhmZmNv?=
 =?utf-8?B?cTFXaGxzZGJFRmNzUS9aSFlVOU1HN0s4c3NMcTJ4dGQ4a3pPYTJWYkdyMk85?=
 =?utf-8?B?SU9sVzNqSnpSS2U2VXg0YXFOeDh6NTU4dHQvMURGZ0NiMVhJenhtd21XSWRl?=
 =?utf-8?B?TnhhUWgvYmUvWTk5Qm9ySHJTUThXUjd2eDBhWTh2eXNEMFkvaDEzK0dNSjVD?=
 =?utf-8?B?YUNUTTBncC95dW1XNGF4UzRlUEYxRUpxQVN2NCs3NHlqT0k4RVZpSWhKL0NQ?=
 =?utf-8?B?b0xNb2Rra0R5YkdpdnUzUzdIbDJYTS9nYWVjZjVZTjVrTzZUMkdiL3E1VjN5?=
 =?utf-8?Q?R0okxtDoq4mENPhg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E14C108CE2E8E44A953268BF97F9308@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: feq2CAFNJNuxkmKjLsV4NNr46LVNnvvFKPbG1GRhPIZa135Iya5n3/DexlQen1XrLFUmHaAkdLuFJmu2oAudhBFIvZyIpLmQPQB4D+9j0Yz6mBbUbpJRKczl8/mEm7kQy3e6JZkRl7Fyk+K98sMCuIxRy8r8rStZ1jfYViFad8OfYLiI9tEjJqFRVpJwAhiDx1VNiJpmgwdZQ8v2FHPGNnSE4sGnpNNyPdLbMs66t1GkxvU6WlDUGlQN7WFPf1MCQaN3/2YImMOZfuXydrENTWKL3TDPhUiUM0k2abdTrMzZeGsaYD1mJGGYDXbcPeL9w2aaGU9IUgeigqTg50Bs/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f57c4f9-d41d-4356-8e8d-08df01ee4fb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 14:45:16.0674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMl5P8xS3FJuM5d2vJRZioy3dKzx9TAHv9kNnzKKKHyZluYvBECbaTbKDFFeHNV5w1UX2+3cXsHf3Vmif0G2qsohnbC0H2p8JJz8PABgT24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
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

T24gRnJpLCAyMDI2LTA4LTIxIGF0IDEzOjQyIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOgo+IE9u
IFRodSwgQXVnIDIwLCAyMDI2IGF0IDA5OjA2OjQwUE0gKzAwMDAsIFN0dWFydCBTdW1tZXJzIHdy
b3RlOgo+ID4gVGhlIGNvbmZpZ2ZzIGdldHRlcnMgcmVhZCBkZXYtPmNvbmZpZyBtZW1iZXJzIHdp
dGhvdXQgaG9sZGluZyBkZXYtCj4gPiA+bG9jaywKPiA+IHNvIGEgY29uY3VycmVudCBzdG9yZSBj
YW4gdGVhciB0aGUgdmFsdWUgYmVpbmcgcmV0dXJuZWQuIFRoZSBzdG9yZQo+ID4gcGF0aHMKPiA+
IGFuZCBhIGZldyBvZiB0aGUgZ2V0dGVycyBhbHJlYWR5IHRha2UgdGhlIGxvY2s7IG1ha2UgaXQg
Y29uc2lzdGVudAo+ID4gYnkKPiA+IHdyYXBwaW5nIGV2ZXJ5IHJlYWQgb2YgZGV2LT5jb25maWcg
aW4gdGhlIGdldHRlcnMgd2l0aCBhCj4gPiBzY29wZWRfZ3VhcmQoKSwKPiA+IGNvdmVyaW5nIHRo
ZSBzdXJyb3VuZGluZyBjaGVja3MgdGhhdCBjb25zdW1lIHRob3NlIHZhbHVlcyBhcyB3ZWxsLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50
ZWwuY29tPgo+ID4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLW9wdXMtNQo+IAo+IEkgZG9u
J3QgdGhpbmsgdGhlIGxvY2tpbmcgaXMgdGVycmlibHkgaW1wb3J0YW50IGZvciBtb3N0IG9mIHRo
ZXNlCj4gY29uZmlnZnMgaW50ZXJmYWNlcywgYnV0IGl0IGNlcnRhaW5seSBkb2Vzbid0IGh1cnQg
YW55dGhpbmcgYW5kIGlzCj4gZ29vZAo+IGZvciBjb25zaXN0ZW5jeS4KPiAKPiBSZXZpZXdlZC1i
eTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KClRoYW5rcyBmb3IgdGhl
IHJldmlldyEKCi1TdHVhcnQKCj4gCj4gPiAtLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2NvbmZpZ2ZzLmMgfCAyOSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gPiAtCj4gPiDC
oDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jCj4gPiBpbmRleCAwNTJjY2U5NjIxNjEuLjBh
ODUwNDNhOWRkMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdm
cy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYwo+ID4gQEAgLTEx
ODUsNyArMTE4NSw4IEBAIGJvb2wKPiA+IHhlX2NvbmZpZ2ZzX2dldF9zdXJ2aXZhYmlsaXR5X21v
ZGUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFkZXYpCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBkZXZpY2VfZGVmYXVsdHMu
c3Vydml2YWJpbGl0eV9tb2RlOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoG1vZGUgPSBkZXYt
PmNvbmZpZy5zdXJ2aXZhYmlsaXR5X21vZGU7Cj4gPiArwqDCoMKgwqDCoMKgwqBzY29wZWRfZ3Vh
cmQobXV0ZXgsICZkZXYtPmxvY2spCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
bW9kZSA9IGRldi0+Y29uZmlnLnN1cnZpdmFiaWxpdHlfbW9kZTsKPiA+IMKgwqDCoMKgwqDCoMKg
wqBjb25maWdfZ3JvdXBfcHV0KCZkZXYtPmdyb3VwKTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIG1vZGU7Cj4gPiBAQCAtMTE5OSw3ICsxMjAwLDggQEAgc3RhdGljIHU2NCBnZXRf
Z3RfdHlwZXNfYWxsb3dlZChzdHJ1Y3QKPiA+IHBjaV9kZXYgKnBkZXYpCj4gPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKCFkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biBkZXZpY2VfZGVmYXVsdHMuZ3RfdHlwZXNfYWxsb3dlZDsKPiA+IMKgCj4gPiAtwqDCoMKgwqDC
oMKgwqBtYXNrID0gZGV2LT5jb25maWcuZ3RfdHlwZXNfYWxsb3dlZDsKPiA+ICvCoMKgwqDCoMKg
wqDCoHNjb3BlZF9ndWFyZChtdXRleCwgJmRldi0+bG9jaykKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBtYXNrID0gZGV2LT5jb25maWcuZ3RfdHlwZXNfYWxsb3dlZDsKPiA+IMKg
wqDCoMKgwqDCoMKgwqBjb25maWdfZ3JvdXBfcHV0KCZkZXYtPmdyb3VwKTsKPiA+IMKgCj4gPiDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIG1hc2s7Cj4gPiBAQCAtMTI0Myw3ICsxMjQ1LDggQEAgdTY0
IHhlX2NvbmZpZ2ZzX2dldF9lbmdpbmVzX2FsbG93ZWQoc3RydWN0Cj4gPiBwY2lfZGV2ICpwZGV2
KQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghZGV2KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gZGV2aWNlX2RlZmF1bHRzLmVuZ2luZXNfYWxsb3dlZDsKPiA+IMKg
Cj4gPiAtwqDCoMKgwqDCoMKgwqBlbmdpbmVzX2FsbG93ZWQgPSBkZXYtPmNvbmZpZy5lbmdpbmVz
X2FsbG93ZWQ7Cj4gPiArwqDCoMKgwqDCoMKgwqBzY29wZWRfZ3VhcmQobXV0ZXgsICZkZXYtPmxv
Y2spCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZW5naW5lc19hbGxvd2VkID0g
ZGV2LT5jb25maWcuZW5naW5lc19hbGxvd2VkOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGNvbmZpZ19n
cm91cF9wdXQoJmRldi0+Z3JvdXApOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
ZW5naW5lc19hbGxvd2VkOwo+ID4gQEAgLTEyNjMsNyArMTI2Niw4IEBAIGJvb2wgeGVfY29uZmln
ZnNfZ2V0X3BzbWlfZW5hYmxlZChzdHJ1Y3QKPiA+IHBjaV9kZXYgKnBkZXYpCj4gPiDCoMKgwqDC
oMKgwqDCoMKgaWYgKCFkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiBmYWxzZTsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqByZXQgPSBkZXYtPmNvbmZpZy5l
bmFibGVfcHNtaTsKPiA+ICvCoMKgwqDCoMKgwqDCoHNjb3BlZF9ndWFyZChtdXRleCwgJmRldi0+
bG9jaykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkZXYtPmNvbmZp
Zy5lbmFibGVfcHNtaTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBjb25maWdfZ3JvdXBfcHV0KCZkZXYt
Pmdyb3VwKTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiA+IEBAIC0x
Mjg0LDcgKzEyODgsOCBAQCBib29sCj4gPiB4ZV9jb25maWdmc19nZXRfZW5hYmxlX211bHRpX3F1
ZXVlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghZGV2KQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsKPiA+IMKgCj4g
PiAtwqDCoMKgwqDCoMKgwqByZXQgPSBkZXYtPmNvbmZpZy5lbmFibGVfbXVsdGlfcXVldWU7Cj4g
PiArwqDCoMKgwqDCoMKgwqBzY29wZWRfZ3VhcmQobXV0ZXgsICZkZXYtPmxvY2spCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gZGV2LT5jb25maWcuZW5hYmxlX211bHRp
X3F1ZXVlOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGNvbmZpZ19ncm91cF9wdXQoJmRldi0+Z3JvdXAp
Owo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ID4gQEAgLTEzMDgsMTAg
KzEzMTMsMTIgQEAgdTMyCj4gPiB4ZV9jb25maWdmc19nZXRfY3R4X3Jlc3RvcmVfbWlkX2JiKHN0
cnVjdCBwY2lfZGV2ICpwZGV2LAo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghZGV2KQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+IMKgCj4gPiAtwqDCoMKg
wqDCoMKgwqBpZiAoY3MpCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzID0g
ZGV2LT5jb25maWcuY3R4X3Jlc3RvcmVfbWlkX2JiW2NsYXNzXS5jczsKPiA+ICvCoMKgwqDCoMKg
wqDCoHNjb3BlZF9ndWFyZChtdXRleCwgJmRldi0+bG9jaykgewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmIChjcykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgKmNzID0gZGV2LQo+ID4gPmNvbmZpZy5jdHhfcmVzdG9yZV9taWRf
YmJbY2xhc3NdLmNzOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoGxlbiA9IGRldi0+Y29uZmln
LmN0eF9yZXN0b3JlX21pZF9iYltjbGFzc10ubGVuOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGxlbiA9IGRldi0+Y29uZmlnLmN0eF9yZXN0b3JlX21pZF9iYltjbGFzc10ubGVu
Owo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gwqDCoMKgwqDCoMKgwqDCoGNvbmZpZ19ncm91cF9w
dXQoJmRldi0+Z3JvdXApOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gbGVuOwo+
ID4gQEAgLTEzMzUsOCArMTM0MiwxMCBAQCB1MzIKPiA+IHhlX2NvbmZpZ2ZzX2dldF9jdHhfcmVz
dG9yZV9wb3N0X2JiKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ID4gwqDCoMKgwqDCoMKgwqDCoGlm
ICghZGV2KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+
IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqAqY3MgPSBkZXYtPmNvbmZpZy5jdHhfcmVzdG9yZV9wb3N0
X2JiW2NsYXNzXS5jczsKPiA+IC3CoMKgwqDCoMKgwqDCoGxlbiA9IGRldi0+Y29uZmlnLmN0eF9y
ZXN0b3JlX3Bvc3RfYmJbY2xhc3NdLmxlbjsKPiA+ICvCoMKgwqDCoMKgwqDCoHNjb3BlZF9ndWFy
ZChtdXRleCwgJmRldi0+bG9jaykgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCpjcyA9IGRldi0+Y29uZmlnLmN0eF9yZXN0b3JlX3Bvc3RfYmJbY2xhc3NdLmNzOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxlbiA9IGRldi0+Y29uZmlnLmN0eF9yZXN0b3Jl
X3Bvc3RfYmJbY2xhc3NdLmxlbjsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDCoMKgwqDC
oMKgwqBjb25maWdfZ3JvdXBfcHV0KCZkZXYtPmdyb3VwKTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIGxlbjsKPiA+IC0tIAo+ID4gMi40My4wCj4gPiAKPiAKCg==
