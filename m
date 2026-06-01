Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA2ECD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE525113418;
	Mon,  1 Jun 2026 14:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAgNiMnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA7D10E7DC
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780324542; x=1811860542;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=SPqabbTv8H9r/OXUx/IccGWjcuMGox00DViK/kur0zU=;
 b=DAgNiMnBQxI39KmyRUEd9ydwYcb1ZT21skeSgDHv3+0/nyKbDw46jK2o
 dD+z96K5NgVJxd4OQZ0vmuq/5C6KKB7LzIyZE6Gdn3GCew9edXqtoK6nD
 d6WoXKLMZwBj/OkNPuQIKVfIVsTFWVaZDC9xpa2o3NV725D/fOaMhUmMn
 FsH0gUIbh1BSZaSv/9C6kmZyM77xP7i8UqP0LNFQJj/IpPedS3qun+wzS
 eTHjgSw+pXEHiW2KZ8OIhQid8xu6SHWknwE3kVffWW4DWX824OxPgdRpQ
 4LpYMw+SehVABgCJGSLBilWTMnmRNjJQPJejDWusFAxBMesyTus3qo3la g==;
X-CSE-ConnectionGUID: IsW/1ZGDQFSIHijfLjtZmQ==
X-CSE-MsgGUID: 1nrzP5CZSO2vgAdRkJ5YCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="84708147"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="84708147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 07:35:42 -0700
X-CSE-ConnectionGUID: MSKliB+ySI+2ctsJ8hzNmQ==
X-CSE-MsgGUID: cRo0UVwjRvm7A6No6wQTdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="239173349"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 07:35:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:35:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 07:35:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 07:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftXVMEL75Gbm/u8DhHN7DbyLCiS8vA7YNIGSQNqroj6WIEfhli5z6ISs1dsQw5qJq7FCrnwDWunc+kTzQlzIxIRNQNr936gnES+QexIZR2EvNTgaUL/wbm1DAoz4Ua0BIVERbMUAchXlXAGBzBD3jSUtuJPCTu3kXwmK6cdgK3TIzIFtFlaFCoskFaWuDBS2DNfoy8IlThEdD1YGWW27h26Mqp0gNtLZZKxrNcGlS6um31jtfZ3Wjm106HmwZc5aA5L7qQv9icPipOPP0NPQJd6wnhxUEb8UjHREEzJ7k6u2j9SyXcTc17copj5Xj9pueHFPg+mor3ea130NaeUsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPqabbTv8H9r/OXUx/IccGWjcuMGox00DViK/kur0zU=;
 b=VYfgx6XHgo0bsk/nElm4EpE0dgbq9y4FG5PkiidhT5IYvt2WVrP5KMAc5jVfycmDAngrqhipPFKs79fQzQHQGmjfRr5BW1rOZA3ljmvmV7mQVf/VFEZP81PpNDzpAX/GJXiB5PKZcsN2qcWe0LxvMtJDNV5y28AJXyMmlnH/JgyAA/ZgAH6M27DVR0BHNDCvW4bQqdgR3lXACEmdVeG8bZ095K0NvJ4wUffpjoWUKhFqF2jbZX4SWy0HY9dv2QeYK8LDVhbqnR8h48ybfOvCJ/5++0Szdy1CQoLMDdxhFIK2cWeRW20CgGDhXLqZlVW9oUdHQVEqXfjremg/CCptjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 14:35:28 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 14:35:28 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>, "Nguyen,
 Brian3" <brian3.nguyen@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wang, X" <x.wang@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: explicit TLB flush for context based tlb
 invalidation
Thread-Topic: [PATCH 3/3] drm/xe: explicit TLB flush for context based tlb
 invalidation
Thread-Index: AQHc8dNEMHudXWu3fk6IcSs17+3a9LYpxCCA
Date: Mon, 1 Jun 2026 14:35:28 +0000
Message-ID: <5e4292ab047aab609519318c6fbef854bce083e6.camel@intel.com>
References: <20260601143000.2830227-1-tilak.tirumalesh.tangudu@intel.com>
 <20260601143000.2830227-4-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260601143000.2830227-4-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SA1PR11MB6991:EE_
x-ms-office365-filtering-correlation-id: 7cd0acdf-6844-47d3-8b6b-08debfeb06df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|921020|4143699003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: Vxd0Wacz5uxhBpAbJ5WmZsV28ohPpFY8Gn6T4HvRoh4rWcuBdoydHK5Xc0Hg9Y7r1aD2YfRETcW+Di5ybAX5TtUcuQqJlhQflMIUG5oljM8fwF2kPNqZ7NXVvCOiGvfjn4GhM4o4bngDbgiPVYSRdidaSLJmI6K3/lJk2SDml9j4NV2OeqXBqMDBJKmUjR/KCMxUW70bQwyRBoibEwBioQ5t75CFz9/fdWMp0/v8ItlAS6eHIirS7fj0e74WCY33nzx1iyPjlWDD+Q5uAXWBzZ8TP3ROlm0NZ1ry13+ftUiMbeexF30vS6hZyNpxZlYdtHfKQ6z3rR+9DVs0+xcZKRTyZTO3Dc9ikoZSUSajR9tdKjMYTtj0h7tyxxxnDMDElQbH78EEX6gZmPv1BQqkJYK0jYczokr8z4194AfARQqwFle2z8BbE1uKN+UCx3294I69iTuqyOEKm/PWQg8MRtOYfFzR6eZtWABPj8dagbaVDEliK0KiGjnDDWENN/2TCL3Rn2YDjsrM3ntPWi9wc6zhZkAsDBBwP5AYARQ7OJV/UKwYnXzjDwDlBTZBNJ3xxtuiPVe/Fymyvq2mGM13MGgDG8I3KxKE27VQ6KC0FYAV9WOwT7vo2GXlb45R+2IqlryuixJEkH5u+IW3ysXwrWZVHrdVN1ACYABD6aoPBh/quJQxsE+2j4Fy2oZL3iWiCPmPucamGLt2j33WtKAidew+M6r5ZLYRUKBQEd76DM7UliHEog0IR+ZAToO88JqBBNpB0RjBVjrE6cIE5LDXeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(921020)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzF2L0ZNNzErSmUzMHc3RGp1MkZIR1MwSmFqdSt6V3hiaWhsNkhQdjlMdVhT?=
 =?utf-8?B?bkx6SklpM3JFck1aVFVPa2lUSUtRUWRkUXB5QktwNFFvcnhQTk4yVk5nb1pw?=
 =?utf-8?B?L2tDL09Ta1R5akpNZ25DRndoc3F5eDlkZkg3eWhZNUFnV3NDbi9jUUFZZ2Qz?=
 =?utf-8?B?MlU0UHRmNFUwNkQvSHZOSk0yMHI3K2xwRTJtZ1BPell0clZPMkkxa1hUbkxK?=
 =?utf-8?B?bUpRdzN1TW9XVHM2VHhDNkd3YkpWMVVZaWt4bFo0WXNyY2d0c2dVaENwMm0y?=
 =?utf-8?B?TitXaFQ4NW1vYUtYN0RmM1luVlB4R3ZLTUpJdFdRUE9ucHJzVXZ4MEpMQWtR?=
 =?utf-8?B?RThPaWxCMVVVckdwMlZtSE90bnhidWRPZ3JKM1pNcFhlekdYQ3kvYXZrWFh6?=
 =?utf-8?B?STFuZ1JTNmlFQklteXBtVTZPQTNubzdobE9iOWk3RjlYUVNYK3Y4OWpaZE5q?=
 =?utf-8?B?T0pha2czNmpBNnc2bDhRZEZ3NDVPQUxFUlh4SzhBeXhQb29kZFFyaWJhWDYx?=
 =?utf-8?B?emo4WTlrVWZ6SlRGMWFmbkQxeFRMM3V4THp5WTljQlVIbHc2Q0ZaTngrQlJl?=
 =?utf-8?B?YktpaFBvQXJ2aEdpQXRtNnRIL3dlSEladWFDQ0tsdWV2MGN1WEpBd3Iyanh0?=
 =?utf-8?B?RzhVRkxTc1FaYU1vVU00M0JWTVV0VkRwS3lJbTZ6ZnNVOFN6TTZBem14UlJU?=
 =?utf-8?B?ZU9EVjhYR2VZQVZ0UlBKd3pFSmJmWFlFcTFuQ2Rzb1NocUxTNmJOVHhJTURR?=
 =?utf-8?B?dmtoWkpyUzUxRml3RVpHMG9GQ3FwcTNBNnVzTlN3THg1T3dGWHBmQzdjajFz?=
 =?utf-8?B?R29XQnhmenlyeEEwWW8xdjJzVDhjeU9pOXhLc21YR0t5dGMxUzdRb2ZwYkxK?=
 =?utf-8?B?QXE5Qk5WajFjWVNDeDd4UEpJNmxEUHpnbWp2ckRzVlQzK2lKWVpUZnoyMUZx?=
 =?utf-8?B?eEdWMzFLZlpKM2pCa0t5Yldjc0MrMUpYaGJmN09ZWGxQQUhiU1B5SjZUd1dM?=
 =?utf-8?B?VUdWVmgyVTAwNkJoRW1qb2E2L0tFNGlvb3IwYURmQUsrb1VCbzBRSXN0a2l4?=
 =?utf-8?B?SGxpS3ppM0w5QTdJMmpBenp5WURSMGN6MCt0K2VReEJqNnd0T1REZVF3SlZm?=
 =?utf-8?B?a1RKQ2o4YUJEdmZXUVM2N3BNRHplZjFxancwMG96a1gzazFUaEtCcTFhNlRE?=
 =?utf-8?B?cy8ySmhnZzRCc2QzME5PSXh6UEdCUDJUa0xwU0lkRUphTzZsOWxTYzFUQkFo?=
 =?utf-8?B?L1pBZ201NGsrR1B5YnFFZlJXR1I4Rkx6SEVON0trcmwyaG1LZEt3dGs0cy9a?=
 =?utf-8?B?MjZ0aGZqYjVlZTBJV1FQWGhaN0poUnVFbCs1MHBMRW4wZDRYSzVBazdlcTMv?=
 =?utf-8?B?cmszNmFMeU1zM0pMLytVYzJKTHhyY01lZFNWZW5UaEd4eGdJWmY1eXJCWUcv?=
 =?utf-8?B?V2pUUklvSGdIb0xXRCtNOWFIZ3poNlZSRFRnZkFQbzA1WlF6Q0QxbVM5b1BU?=
 =?utf-8?B?dURYekJ0dTZyL2ZTQTdkdHZuTDZPdUFlc1M4ckdtY013di9KbEFNZmFIb3dh?=
 =?utf-8?B?Ui9GUTBYRS9DTkpyelRsN0ZPTU0wOGk5VSt6L0VJRkp0MnZPdHYvekhqQ1FO?=
 =?utf-8?B?b0llZ3I2NUw2N2VURzVKSFhJdmFMdStEYTJFTG5EaFU4Qit0MW1PZWVHbEph?=
 =?utf-8?B?emVxaXJDZDJTMWZMMUZrWXFZcWx3V2lTbUZmTkF2RzUvV0JqcEtHdTdDcXQr?=
 =?utf-8?B?czZFY0RsOUZHUnM1dGhJTkNEY2lYWUVFd0xvcjlEcGtqbkVzbWxicUdWMFAx?=
 =?utf-8?B?cllnaUtQYVJIY2xvMEh1TU5KcUlPbkhHVkdFUTV0RGlNZ1NEYUJKNCswdThm?=
 =?utf-8?B?NVgrcVRIOXpleUJTY2I3azJmcDhWYlR6WElTaW9ROFd4ZzMrWGZIZEZDZEIw?=
 =?utf-8?B?cUJUUWowMWpySy91Mk05MEVYRUlMRER6eGhCTmlVZGk4MzIxM3UvdVBFZzFZ?=
 =?utf-8?B?NDBtYkpHQ3dsemFFelkwbTczbmdlVXNmTU1YTGNTMDE5eVp3bGlmbEFlV1Jj?=
 =?utf-8?B?UHV2ekc1Z0dqTTBJdmt3S28vWVlidEV3QlUrNEwyWWdEbmJUWDFVYm83RDY3?=
 =?utf-8?B?ZEJVRU5nUDdKSmRuZGhySWdFcGs4V2NNMWJCSUVKQ2VLSDJzTGdmclBTMjJk?=
 =?utf-8?B?RURva0g5NDdiQkdvNTVCckovN3lFa3RxNWEwRGJJZjBCTkRkT0RGNWw2dE5x?=
 =?utf-8?B?U0FuU01TSGtkNDRUdFBkSzdPd2N1K0NDZ0ZwcnhtTDlOVjBMcHNLR1FmUUZp?=
 =?utf-8?B?TmQyYkttWDZOaWE0eGRzZ0FmU3JoODM4Tzd1bUZHQkN4RHpnTUZDT0w5WlRT?=
 =?utf-8?Q?u1ORTrmEpo6utum3hTiXv2T3qPdvSEsJSnk7gFofmqCeu?=
x-ms-exchange-antispam-messagedata-1: eEo2ZbCFFoJMQA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <E06073EE6E3147468F8DBFD0D31AE781@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cpWv3wfUlokQ+dtAIEL8NoDA1L5rkVD+LF8PeXsVBQwsE9TK0XBCnSsmIAiwdT/KMKmZ7fwu15K8pr+DEjZJCGdhOfgwSFxSogB+D9FZ2k7hplj9HFQ4unlJCJQEHCxrW86mAxcHnlrjM05mkb4Pg0xGftAwspsyWn1ebBrkftKUoZPWsFS2o4z0hNERO9lPSn3u1N3+vwAVB9Dd8bvL4TB4cDgIIAc7Y3eCrj/PrStI3jXSiVxgxplUfrnMOjMHHJDY4S7rf4NjH7ux6Jmma+0cL7lkCVmfK1SroA1w5OClZtgqB/2/iQbgQA5FxROcFeYElUD8IfENSlST67JSyQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd0acdf-6844-47d3-8b6b-08debfeb06df
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 14:35:28.6415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AX+5WE0tk6sTg+WknrjRcFIznBYtEyPW1Cfovq/Seqqh5gexQFpC+ET2KAPuGycFpC9UlqBoANWOkUW+8MlJfvEopcw0wYboqn1qM7d4SKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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

T24gTW9uLCAyMDI2LTA2LTAxIGF0IDIwOjAwICswNTMwLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1
ZHVAaW50ZWwuY29tDQp3cm90ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0
aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gSW4gTFIgcHJlZW1wdC1m
ZW5jZSBtb2RlLCBvbiBkZXZpY2VzIHdpdGggY29udGV4dCBiYXNlZA0KPiBUTEIgSW52YWxpZGF0
aW9uLCByZWJpbmQgb3BlcmF0aW9ucyBmb3IgVk1BcyByZXF1aXJlDQo+IGFuIGV4cGxpY2l0IGlu
dmFsaWRhdGlvbiByZXF1ZXN0Lg0KPiANCj4gUmVxdWVzdCBleHBsaWNpdCBUTEIgSW52YWxpZGF0
aW9uIGluIG5vdGlmaWVyIHBhdGgNCj4gYW5kIGluIFBUIHBhdGguDQo+IA0KPiBVc2VycHRyIFZN
QXMgYXJlIGV4Y2x1ZGVkIGluIFBUIHBhdGggc2luY2UgdGhlIG5vdGlmaWVyIHBhdGgNCj4gYWxy
ZWFkeSBzdWJtaXRzIGludmFsaWRhdGlvbiwgcHJldmVudGluZyBkdXBsaWNhdGUNCj4gcmVxdWVz
dHMgZm9yIHRoZSBzYW1lIHJlYmluZCB3aW5kb3cuDQo+IA0KPiB2MjogUmVtb3ZlIGV4cGxpY2l0
IFRMQiBJbnZhbGlkYXRpb24gaW4gbm90aWZpZXIgcGF0aCBhcw0KPiBQVCBwYXRoIGlzIHN1ZmZp
Y2llbnQuDQo+IFJlZmFjdG9yIG9mIGFib3ZlIHRvIHJlbW92ZSBleGNsdXNpb24gb2YgdXNlcnB0
ciBWTUFzIG4NCj4gUFQgcGF0aC4tIFRob21hcw0KPiANCj4gdjM6IEtuaXQtUmVtb3ZlIHVucmVs
YXRlZCBjaGFuZ2UuLVRob21hcw0KPiANCj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1
cy00LjYNCj4gU2lnbmVkLW9mZi1ieTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoDQo+IDx0aWxh
ay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfcHQuYyB8IDYgKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gaW5kZXggMjY2OWZmNWVlNzQ3Li4xNWNlNzdjZTc3
OTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+IEBAIC0yMDEwLDYgKzIwMTAsOSBAQCBzdGF0aWMg
aW50IGJpbmRfb3BfcHJlcGFyZShzdHJ1Y3QgeGVfdm0gKnZtLA0KPiBzdHJ1Y3QgeGVfdGlsZSAq
dGlsZSwNCj4gwqAJCSAqIGF1dG9tYXRpY2FsbHkgd2hlbiB0aGUgY29udGV4dCBpcyByZS1lbmFi
bGVkIGJ5DQo+IHRoZSByZWJpbmQgd29ya2VyLA0KPiDCoAkJICogb3IgaW4gZmF1bHQgbW9kZSBp
dCB3YXMgaW52YWxpZGF0ZWQgb24gUFRFDQo+IHphcHBpbmcuDQo+IMKgCQkgKg0KPiArCQkgKiBJ
ZiByZWJpbmQsIHdlIGhhdmUgdG8gaW52YWxpZGF0ZSBUTEIgb24gY29udGV4dA0KPiBiYXNlZCBU
TEIgaW52YWxpZGF0aW9uDQo+ICsJCSAqIExSIHZtcywgYXMgdGhleSBjYW5ub3QgYmUgcmVsaWVk
IG9uIGNvbnRleHQgcmUtDQo+IGVuYWJsZS4NCj4gKwkJICoNCj4gwqAJCSAqIElmICFyZWJpbmQs
IGFuZCBzY3JhdGNoIGVuYWJsZWQgVk1zLCB0aGVyZSBpcyBhDQo+IGNoYW5jZSB0aGUgc2NyYXRj
aA0KPiDCoAkJICogUFRFIGlzIGFscmVhZHkgY2FjaGVkIGluIHRoZSBUTEIgc28gaXQgbmVlZHMg
dG8NCj4gYmUgaW52YWxpZGF0ZWQuDQo+IMKgCQkgKiBPbiAhTFIgVk1zIHRoaXMgaXMgZG9uZSBp
biB0aGUgcmluZyBvcHMgcHJlY2VkaW5nDQo+IGEgYmF0Y2gsIGJ1dCBvbg0KPiBAQCAtMjAxOSw2
ICsyMDIyLDkgQEAgc3RhdGljIGludCBiaW5kX29wX3ByZXBhcmUoc3RydWN0IHhlX3ZtICp2bSwN
Cj4gc3RydWN0IHhlX3RpbGUgKnRpbGUsDQo+IMKgCQlpZiAoKCFwdF9vcC0+cmViaW5kICYmIHhl
X3ZtX2hhc19zY3JhdGNoKHZtKSAmJg0KPiDCoAkJwqDCoMKgwqAgeGVfdm1faW5fbHJfbW9kZSh2
bSkpKQ0KPiDCoAkJCXB0X3VwZGF0ZV9vcHMtPm5lZWRzX2ludmFsaWRhdGlvbiA9IHRydWU7DQo+
ICsJCWVsc2UgaWYgKHB0X29wLT5yZWJpbmQgJiYNCj4geGVfdm1faW5fcHJlZW1wdF9mZW5jZV9t
b2RlKHZtKSAmJg0KPiArCQkJIHZtLT54ZS0+aW5mby5oYXNfY3R4X3RsYl9pbnZhbCkNCj4gKwkJ
CXB0X3VwZGF0ZV9vcHMtPm5lZWRzX2ludmFsaWRhdGlvbiA9IHRydWU7DQo+IMKgCQllbHNlIGlm
IChwdF9vcC0+cmViaW5kICYmICF4ZV92bV9pbl9scl9tb2RlKHZtKSkNCj4gwqAJCQkvKiBXZSBi
dW1wIGFsc28gaWYgYmF0Y2hfaW52YWxpZGF0ZV90bGIgaXMNCj4gdHJ1ZSAqLw0KPiDCoAkJCXZt
LT50bGJfZmx1c2hfc2Vxbm8rKzsNCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0
aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCg==
