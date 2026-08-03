Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D9DC55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 18:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BAE10E098;
	Mon,  3 Aug 2026 18:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/L3KvC6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BB710E098
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785782061; x=1817318061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=x0cI9HbMJuD9LUgKoJkRV/UBZR1Z8bnDOrjjwF0f4nw=;
 b=O/L3KvC65czhXtVzjtRF+/Hwqv9cTl6oEx5UIEq/9K6zciea03Ce4ZaC
 mmJFh/4Ar3EesTmaWsQcinSKMoLpvGXfgcBUdxAwlJwPdZOHQvDCKS7k9
 3+X0D7ohXIk26un6KlWFDgoLXRINAzRsZc6Z/zDIdDUXpj4gij9A+gHdJ
 e6WGBJ3uMpvL5B785uAMlDy8Pftxcp8fXbFUG/xU2iAkkmd0nQ5hTx34U
 1VETBMM/X0AzQYzwleCQNtZ9EKPZ68DwQt1+ONml+b82R0vVnHznrDct1
 7pCjznjqTZ3cH7p8CtYPosIqrRjdX7MZVbd+D5wnAw3cRAaCIDFUmJAtB A==;
X-CSE-ConnectionGUID: i2ciBYqYR3iM1Arv2h12Kw==
X-CSE-MsgGUID: F/j9Wa9sTROZzy2/5PI82w==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86524825"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86524825"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 11:34:20 -0700
X-CSE-ConnectionGUID: F0sAGOtcT4a3NQNTCmT4Gw==
X-CSE-MsgGUID: XyvAHdu1RKK8nJ6gCGDQ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="261881009"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 11:34:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 11:34:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 11:34:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 11:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hi/x0KByX0/eJUqoYk+c0lmD+9OxW5oODLIQyDq7WqJDFV01jW1sZ6TVYG75TypDF5FTadMKtqmRNQCwRb0Iatb+sAyGooTc5g3zX4ai+rfg8EDA7YJxRJ8NAs2PFuQT4dqgnxpANAD8FsfHEA2jmldG7F2zZHuKPRMrasTDMn1dNt74spFOhi79H20hLLqyF5DBUCDgCAp21AqxYMrLDkXenYjMAbVC2xveYY2/U8CMephfADovMuH6vdswS/QioacpRi9MfMB3t2BG4Ytm69NvZWspaHfjrRZT0q0BMeh9AHmy3MO/RwkHVbyZJeh+Cg4JW1orX+JvDDP91ERYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0cI9HbMJuD9LUgKoJkRV/UBZR1Z8bnDOrjjwF0f4nw=;
 b=KqFi9tO7gIsLiObUDngKhmmC9mC/yFY4UyzgnPUjyrUwaY0xNcOgoHEbhEjyQLP1FR+szWzDXRsKlTjafQVcCzZ8e8JJXGpkB50b79flgfXrrnKE+9ImGgTDPC6oG3IMUkVdagwjxx8w8n7ONB3Fu6NQ16WjcLj0ESIZs81rpIISB4yzigHJU97oVGJIHfcRLj64qcnIzrRtIcZPQcUdA9a3v47mcl8VaLnmbNhzmd051EShq/DqegGhVch5fDyF2hw86Owy4csIztDGS0e8Ya9Lj2J5IFAU/YDKfE9e3zyhKhO5B4eoVY5JzEuXsXajlQX8QtEEULq70sGdx5mzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 18:34:15 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 18:34:15 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/9] drm/xe: Add a new debug focused configfs group
Thread-Topic: [PATCH 3/9] drm/xe: Add a new debug focused configfs group
Thread-Index: AQHdG6qjF1VL0nOo1U6Aq566cYWyw7aMtgYA
Date: Mon, 3 Aug 2026 18:34:15 +0000
Message-ID: <16435244665fade9cd1079386c572b0bb6edf4d7.camel@intel.com>
References: <20260724202539.53850-11-stuart.summers@intel.com>
 <20260724202539.53850-14-stuart.summers@intel.com>
In-Reply-To: <20260724202539.53850-14-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|PH8PR11MB7119:EE_
x-ms-office365-filtering-correlation-id: 2be9d55d-cc1d-4077-5b34-08def18dd276
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|38070700021|56012099006|3023799007|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: OQgPvbdQE0OZuAM5auzOSGepWegHTeQgz4w97TaCo0M7y7qb82lkQQSHGumTFNNG2frQqV/ySl3TrE5FNgmkP/ZPWKttdliWGg2QHOTAqZz9MGoDBCNvrP5Nj0amJzCUFTgJxPyz+y53lZ/Mq7RVDC/iv9P3D5TBfIcmDEM1Ig/wYtKwedbSH3RTD9rbCscaXocQOzA3jYrbaI5YV7FELejEuhU0lvPPiNExlBuHuPbfvw5wiXjmQgfgGK/j+nP7NQ7JQxzU+N+2dmcIOWCyUB/cvGJpBtY8RyrXscoebGzVfPXJ+kC1X+VTLS39ODHPUCQEpNlvR8YsQF79ZuOX2+mRKiMaltK8W/J/xjQV5iCGyeqgsO0G4kzYXNuMpNpY+RYhjEuLwFckxUp7PXsqKJ3V2q28sBzhYIHfC/DcT7o8SAa0OksrelNWf4l/T+VcyYwj3XywfvHKOi961eQPaYGkOxy7EJyzr3FGmi1A+UpUf68EDkPYxln6DjZNCvpayZ/s7997xqc4Qe7KVrcJUd5Sk0ZTc77LERhYeUOhu/zWO5CVbFthoepPzzcwbUuxUnouvISgtWbphtcTctGVcn43Yygeo8pvSctA+mhxfCRL3rcM2iJOJ5BURpvz0EJQCw5pPkNEji7Lws4Ai6oTe8udPrmxIvD0GFaysO/Oz27gwfY6AfbygkxuaeJNuRiHM32AYnpdnA+SEbJs9ZGxPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(38070700021)(56012099006)(3023799007)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2JYVyt3eStXVDQvZnFRdUZMWlZ4bk5JZEFsYXVVcitIOHplYldVbHNDa2lP?=
 =?utf-8?B?MGdaZG1LTjZIQVE1SEFCanlsT0hZbDFKMzFrUFhBSGJ3Q01tTEltSW9wVmJi?=
 =?utf-8?B?QnlwRW0rZnNOUFZETE85cWY5dE5PWGdNNnRIQ0hQSEhoS3FKMEEwQWJUckRs?=
 =?utf-8?B?eEJTaTZQQjdGN05FeHZpRUpKUndNa3pMSnVWbThJTW9FMlQ1MUFkdVJBSVRv?=
 =?utf-8?B?NE9zMFRSNnBmOWl6MUxFQi9UUFRQaUg1MldGcmh2eWZyK2VnK0hCUk5MZnUy?=
 =?utf-8?B?My96aWRubVByZDRaSVdhdEhwMHhNaHRpVU5SVE9qVDJDRU5Udmo4QmdZRWdR?=
 =?utf-8?B?eUJuUDBGUTR5ZnM1YTl6NzVHdStNZkx5VkZXMUtyamlHcmtzQnByZHU1TGF3?=
 =?utf-8?B?THFxN2hUMlFhMGlqVXRhckxwZWU1NW5ocTlZS21sd3greElGMThEeDl2NXRR?=
 =?utf-8?B?V3NVRGdKdUE0ZzlzbWFOazJuSE1PT3hHL0tQbk5FMnQyL3dIZlhNODVHL1gv?=
 =?utf-8?B?NXRuYXN6L0kzSnYrUjY5YjhFMTBWbUYwVU80Y0ZrdWZ0QzcyT0pGZEdiVFpv?=
 =?utf-8?B?QWhmMVVUZERURGdOZjFUM0o0OGM2a1JJcTA5M1VMR1JSZDVCZC9vMkRSK1Bk?=
 =?utf-8?B?V1JFQ0RFaU9hOWE5VGZwdHRPYVNvcFVMMXU1T1FrK1JRUHNGUTdNc0FCTmpn?=
 =?utf-8?B?RERqYzh1MzVGaCtweFJQcmFJVHlnNnRoWmpmQUp0Z3JBYmZYamNGOVdoMXFk?=
 =?utf-8?B?dFJieWtOOFFpUS9UTU1VQ25McEdKb0FVbFByVGFXV2VGZkhLVm9rbmN5bkxJ?=
 =?utf-8?B?YURSTW9VVE9xQndyWmdxVnJ3Y0gvNytQNklJR0dQTGxtejVzcnhldFRFdG9i?=
 =?utf-8?B?bTRVWmZxSjZpUTZuTVRnRW9WK1pUYUdlMWxsWmlVODFEMlNITWJsV0hZdXlp?=
 =?utf-8?B?a2Q0cEUzR1AvSGZ3SWpNdk9QSStJZ2tpZGFTZEhhaGN2U1BubjhVYmNyY1lH?=
 =?utf-8?B?dFBlajM2SHYrMHUvbEI4VE5Sa1pabmhLRHFWeUF0UmxwaTJ6dnMwaFVjbjdH?=
 =?utf-8?B?QmNFVFl6RmU2VHFPTkZ4VzdBQmhFb1BCcnF1Wm5iREQyNG4xZ3RUVjI0RExH?=
 =?utf-8?B?VGQ3TCtydzBOM3Q1RVNiZkZSZkVjMVhmaVJ6UXRxQ2FCV3lEZnZvejFrbzNx?=
 =?utf-8?B?cmFDUjY1dFhiVzYrWHozVXlzQlZXaDZ0WWMxMVl1a0lFV2hTQ0ZzL2pOVlQx?=
 =?utf-8?B?d0VCTWpKUklWNlRpOC83U0l5RmZxZUNRdnM5NlRDT1ZVRXYwUzU0VmtzOExJ?=
 =?utf-8?B?N1JVRWt0d0daZnZqWEJqUC9UQllzNnp6b3ArRCsxcVFMU0lNUjg3ajlVUkVu?=
 =?utf-8?B?WGszVVdJUlBXSTFZTndKdyt2Y2JUd0VKakUzNUZnVUVRTWtZN3FhVCsxSTRS?=
 =?utf-8?B?bGlkQjgrWS9zUFBxVTZHVkxIQWk3Y1ArMS9aTml2MnFQMFhJNFovRzZWMHhU?=
 =?utf-8?B?dSsxRzJ0dlNjQnl3ZnUxOG1tSGJvU2ErV3dRVzE4WjZnR0hjb1drY0V0RnlW?=
 =?utf-8?B?aVp0VVM3VDBjM3d5MUdub1ZGWHFtRERjRlUvSXcyckxoUTZOd20yMUFxSkg4?=
 =?utf-8?B?d1Z0NkJ1dUFzN1JoMGlWM0JlUnhOT3lkOGwzcEVmaEFjRVRLYzE5RnZScEQ4?=
 =?utf-8?B?Z2RrV2JrV0hlMUhHaWdhYnFUMWpKWG8xcXNZN1dMSktLR3RBZlZiQk90WFpu?=
 =?utf-8?B?ZjdCTGVwdWtwRkRSSitPQ0RSb2VscXdqbEQ1RWYxYWNMclIwRitDUkpyOTRv?=
 =?utf-8?B?Q0ZWN0VCa3FZcWFJUzRaWlpGZ0lJNnZ5bTkvVlJNb0wzN1pNSmV4aWlCWVlG?=
 =?utf-8?B?a0QwbDNTTk8yd28yZmpBWmRqNENNUFJPTWUvS3dZaGt4Q0RsRDZzMGV0N09Z?=
 =?utf-8?B?VEtKSjdqNy9tSSsvaWx3YWJ3N3I1RlpRVjZEUytaMHo0NlFVQzBYNmcrVmQ2?=
 =?utf-8?B?MEZkRUhvV3lqNjkxWFc5eVBucXRaSHNrVVVNOGtrVzhJNGRLQkxpTThwMWk5?=
 =?utf-8?B?WEwvaEJoVUpsbnhUUGRrOWx5NU55YklQOWZ6b1FaN1BTcWdUbEZmNFpLcFZQ?=
 =?utf-8?B?SGh1TFB3NFVrRExjbkp6bmNqWDE3QkVGRE5Sa1dEQjdlK1NzTkdETUpGUzE4?=
 =?utf-8?B?UW5qRUJ6QnhEZmNMQ2VDTHVOZnA0ZDVlamd5Q0t4U2U4eUFISloxNDA1a3lo?=
 =?utf-8?B?WjdMOGJuc3ZpeWtDOEMxNVJacmsyQ0RTaHd6QzFON3M2TzdZVEhGbEgxM09E?=
 =?utf-8?B?WEo0R1NGdlJqSS9aK3FzYmhydDIyL0hGeDZqbG9QZHBna2Rlc1d0Qy95aXcy?=
 =?utf-8?Q?dkQCOuPeLHvhV9e4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FA88A0D87B351439C13E4C2E908B939@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DUCLcnCLQwxFqwkLd60df6jvT4ky4z7pybft43jZ4toinrAaCJ0ZTci8FucBUdvHcTf1JWiiukahflsCHwzg9T0Brhbe3SbviSEo9k4Jj+cePUmn88vcPEX6+GduykT6Ph7Y1ZnXxz55HfN6PUyGv8P5Qf9H9ddYGRruIBbn7BAoFADYYnuWJlTlK/CfUeCGlBufImqaY/yEg3O+X5WUssj90b7g6tmktVqlNNwuBRBFpueaLTwe888ZmEf8vlTpqKBKeUHoxJ82c4v5GdW4U1r3Vry4NIXWiabmXQ4S8Yy0X6d4GiMHzlK7lPA7e997knE0I2q38rHmlPtHppKVGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be9d55d-cc1d-4077-5b34-08def18dd276
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 18:34:15.6754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PA2sB2Hd8m2H+hqheWsMiJcKf2Kfsfd8EPBK6b4VSoSO5crSiho+JcEds+lgj0TX0SNrG0uARm6TB1NKkE7KDN4GgMTJeUbYoqO3rQnagPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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

T24gRnJpLCAyMDI2LTA3LTI0IGF0IDIwOjI1ICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToN
Cj4gQWRkIHRoZSBza2VsZXRvbiBjb2RlIGZvciBhIG5ldyBkZWJ1ZyBzcGVjaWZpYyBjb25maWdm
cyBncm91cC4NCj4gSnVzdCBhZGQgdGhlIHN0cnVjdHVyZSBmb3Igbm93LiBBY3R1YWwgZGVidWcg
Y29udGVudCB3aWxsIGJlDQo+IGFkZGVkIGluIGEgc3Vic2VxdWVudCBwYXRjaC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+
IEFzc2lzdGVkLWJ5OiBDb3BpbG90OmNsYXVkZS1zb25uZXQtNC42LGNsYXVkZS1vcHVzLTQuNw0K
PiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICsrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmPCoMKgwqDC
oMKgwqAgfMKgIDUgKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVi
dWcuYyB8IDE0ICsrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZp
Z2ZzX2RlYnVnLmggfCAxMyArKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2NvbmZpZ2ZzX3R5cGVzLmggfMKgIDMgKysrDQo+IMKgNSBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNl
cnRpb25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9j
b25maWdmc19kZWJ1Zy5jDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9jb25maWdmc19kZWJ1Zy5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL01ha2VmaWxlDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+IGluZGV4IDY3
YWRhMWQ2YzJmYi4uNTc2NTc1MTc4MWFlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+IEBAIC0x
NjIsNiArMTYyLDggQEAgeGUtJChDT05GSUdfSFdNT04pICs9IHhlX2h3bW9uLm8NCj4gwqANCj4g
wqB4ZS0kKENPTkZJR19QRVJGX0VWRU5UUykgKz0geGVfcG11Lm8NCj4gwqB4ZS0kKENPTkZJR19D
T05GSUdGU19GUykgKz0geGVfY29uZmlnZnMubw0KPiAreGVfZGVidWdfY29uZmlnZnNfb2JqLSQo
Q09ORklHX0RSTV9YRV9ERUJVRykgOj0geGVfY29uZmlnZnNfZGVidWcubw0KDQpAUm9kcmlnbywg
aW4gb2ZmbGluZSBkaXNjdXNzaW9uIHRvZGF5IHlvdSBoYWQgbWVudGlvbmVkIHdhbnRpbmcgdGhp
cw0KaGVsZCB1bmRlciBhbiBFWFBFUklNRU5UQUwga2NvbmZpZy4gSSBzZWUgdGhpcyBpcyBhbGwg
dW5kZXIgRVhQRVJUDQpyaWdodCBub3cgKHRoZSB3aG9sZSBDT05GSUdfRFJNX1hFX0RFQlVHIGlu
ZnJhc3RydWN0dXJlKS4gSXMgdGhpcw0KZW5vdWdoPyBPciB3ZSBuZWVkIHRvIGFkZCBhIG5ldyBr
Y29uZmlnIGV4cGxpY2l0bHkgdW5kZXIgRVhQRVJJTUVOVEFMPw0KDQpUaGFua3MsDQpTdHVhcnQN
Cg0KPiAreGUtJChDT05GSUdfQ09ORklHRlNfRlMpICs9ICQoeGVfZGVidWdfY29uZmlnZnNfb2Jq
LXkpDQo+IMKgDQo+IMKgIyBncmFwaGljcyB2aXJ0dWFsaXphdGlvbiAoU1ItSU9WKSBzdXBwb3J0
DQo+IMKgeGUteSArPSBcDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29u
ZmlnZnMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+IGluZGV4IGY4
ZjlhZmU4MjQ4OC4uNGI5MmUzMDcyZDU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfY29uZmlnZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMu
Yw0KPiBAQCAtMTQsNiArMTQsNyBAQA0KPiDCoA0KPiDCoCNpbmNsdWRlICJpbnN0cnVjdGlvbnMv
eGVfbWlfY29tbWFuZHMuaCINCj4gwqAjaW5jbHVkZSAieGVfY29uZmlnZnMuaCINCj4gKyNpbmNs
dWRlICJ4ZV9jb25maWdmc19kZWJ1Zy5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9kZWZhdWx0cy5oIg0K
PiDCoCNpbmNsdWRlICJ4ZV9ndF90eXBlcy5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9tb2R1bGUuaCIN
Cj4gQEAgLTEyMzMsNiArMTIzNCwxMCBAQCBzdGF0aWMgc3RydWN0IGNvbmZpZ19ncm91cA0KPiAq
eGVfY29uZmlnX21ha2VfZGV2aWNlX2dyb3VwKHN0cnVjdCBjb25maWdfZ3JvdXAgKmdybw0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbmZpZ19ncm91cF9pbml0X3R5cGVfbmFt
ZSgmZGV2LT5zcmlvdiwgInNyaW92IiwNCj4gJnhlX2NvbmZpZ19zcmlvdl90eXBlKTsNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb25maWdmc19hZGRfZGVmYXVsdF9ncm91cCgm
ZGV2LT5zcmlvdiwgJmRldi0+Z3JvdXApOw0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiArI2lmIElT
X0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ERUJVRykNCj4gK8KgwqDCoMKgwqDCoMKgY29uZmlnX2dy
b3VwX2luaXRfdHlwZV9uYW1lKCZkZXYtPmRlYnVnLCAiZGVidWciLA0KPiAmeGVfY29uZmlnZnNf
ZGVidWdfdHlwZSk7DQo+ICvCoMKgwqDCoMKgwqDCoGNvbmZpZ2ZzX2FkZF9kZWZhdWx0X2dyb3Vw
KCZkZXYtPmRlYnVnLCAmZGV2LT5ncm91cCk7DQo+ICsjZW5kaWYNCj4gwqANCj4gwqDCoMKgwqDC
oMKgwqDCoG11dGV4X2luaXQoJmRldi0+bG9jayk7DQo+IMKgDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uNDU2MTcyODJjZWM1DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmMNCj4gQEAgLTAsMCArMSwxNCBAQA0KPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDC
qSAyMDI2IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4
L2NvbmZpZ2ZzLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICsNCj4gKyNpbmNs
dWRlICJ4ZV9jb25maWdmc19kZWJ1Zy5oIg0KPiArI2luY2x1ZGUgInhlX2NvbmZpZ2ZzX3R5cGVz
LmgiDQo+ICsNCj4gK2NvbnN0IHN0cnVjdCBjb25maWdfaXRlbV90eXBlIHhlX2NvbmZpZ2ZzX2Rl
YnVnX3R5cGUgPSB7DQo+ICvCoMKgwqDCoMKgwqDCoC5jdF9vd25lcsKgwqDCoMKgwqDCoMKgPSBU
SElTX01PRFVMRSwNCj4gK307DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Y29uZmlnZnNfZGVidWcuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1
Zy5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNWY5Mzg0
NTBhZWQyDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Nv
bmZpZ2ZzX2RlYnVnLmgNCj4gQEAgLTAsMCArMSwxMyBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IE1JVCAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI2IEludGVsIENv
cnBvcmF0aW9uDQo+ICsgKi8NCj4gKyNpZm5kZWYgX1hFX0NPTkZJR0ZTX0RFQlVHX0hfDQo+ICsj
ZGVmaW5lIF9YRV9DT05GSUdGU19ERUJVR19IXw0KPiArDQo+ICsjaWYgSVNfRU5BQkxFRChDT05G
SUdfRFJNX1hFX0RFQlVHKSAmJg0KPiBJU19FTkFCTEVEKENPTkZJR19DT05GSUdGU19GUykNCj4g
K3N0cnVjdCBjb25maWdfaXRlbV90eXBlOw0KPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBjb25maWdf
aXRlbV90eXBlIHhlX2NvbmZpZ2ZzX2RlYnVnX3R5cGU7DQo+ICsjZW5kaWYNCj4gKw0KPiArI2Vu
ZGlmIC8qIF9YRV9DT05GSUdGU19ERUJVR19IXyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Y29uZmlnZnNfdHlwZXMuaA0KPiBpbmRleCAzYmU3ZDYxNjBiNGMuLmUyMmI5NDI0ZjcxOSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmgNCj4gQEAgLTIyLDYgKzIy
LDkgQEAgc3RydWN0IHdhX2JiIHsNCj4gwqBzdHJ1Y3QgeGVfY29uZmlnX2dyb3VwX2RldmljZSB7
DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgY29uZmlnX2dyb3VwIGdyb3VwOw0KPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IGNvbmZpZ19ncm91cCBzcmlvdjsNCj4gKyNpZiBJU19FTkFCTEVEKENP
TkZJR19EUk1fWEVfREVCVUcpDQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBjb25maWdfZ3JvdXAg
ZGVidWc7DQo+ICsjZW5kaWYNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoC8qDQo+IMKgwqDCoMKg
wqDCoMKgwqAgKiBGaWVsZHMgc29ydGVkIGJ5IHR5cGUgKGxhcmdlc3QgZmlyc3QpIHRoZW4gbmFt
ZTogc3RydWN0DQo+IGFycmF5cywNCg0K
