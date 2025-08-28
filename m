Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DD6C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 20:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3D910EAB9;
	Thu, 28 Aug 2025 20:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chejtUr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35AC10EAB9
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756412404; x=1787948404;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kl6Hn7N6hkQkA9/WMZbo01qmS6rw4dZeikBhFp3Jpno=;
 b=chejtUr7yfiZzMZhgEG4wUjoTY4pdYNg/Ub9Do9hqn4nX1tuanIKBTPx
 l/TFk8M0Fs1KW1WTmHArJrYYqOy1cnpKqj27ig1XgZGOdCY4356Xa+3VJ
 H5c0IJMNEaW8i0nT3UijlpyvTnYuKDK7Y0FqwB9Im9KL2uPVnHLNBboug
 Oa0CgE0yRkpkPqk2uIhRVJfj+sn1x4gWw9rInm50WVGojqdZw3Cs6spau
 emurMQkDGXvpju+yK7wFHae7xUQyORntz4Q3xWVmlC2Ww2Qh9CxikvOhh
 n7v9oFn5sKOsSrDxIHcHxl7nY4uopHm69KpK6HGi31fvUQC8U8V31h7hk w==;
X-CSE-ConnectionGUID: z3ayp00RSGCsdWj/Yv992w==
X-CSE-MsgGUID: 9qPM266QTpKk91rYqyN/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="70068283"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70068283"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:20:04 -0700
X-CSE-ConnectionGUID: 5hBKh+dsTGCFKcK3qZK+Eg==
X-CSE-MsgGUID: cauOcajhRHO53kgxp5T0Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170596666"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:20:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:20:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 13:20:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:20:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIXelU8V0qQLngOROd2akgg9Kr98cuSX6IZehIjI0ONrU4JefENFm1KLyYd+Xs/70ZWrSnGQfXdfI23q5P7t6lutZ6WyPGlJ2NfAhqZ7hDKUnQ5OwOJ+7RhhbDqjocug+KpKU2joUSCc6Gz93n0dIKB8ipci619+s9LE251f07vL8ECQp3D6S+BMubbRNVHARh9VNo0AtExCEhiVFVaVW13PokVxiqFxxwSQw78DZO9A2oBDtoRcYQc4XWfkR5VV0wQgB4E378mx5CvGKtE7sN3hC9opqVXcNUNGAG0pwK4pZKe4qQFoKyw692VFcpY5BYzpVzYuvV1TzJgYN3KM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl6Hn7N6hkQkA9/WMZbo01qmS6rw4dZeikBhFp3Jpno=;
 b=qQ2bDmTPgj33/w4GUDjrSbsIQejpoxmlHz++6WPIanrhsjBFBwc//eJqcZMnMk2M82F4Q467oTrzEZMnK9tzYpE0t/Ug0mv1d1VchyMaAcw+pqvoA1bjJEqOVQlTdnl3k7c/DBAbHyrg+VRvXqVYAErDM7+kyZbdxSAZcIsJUzYvfotx0MDrX+ApZVkP6mOte23uzo7bYmvesz6bxfb4Hdbt0i5rKG02Mhl0EXwkuyhwAgVj2yFx/8NzV0Vg+lA5sOaNJF2uxsVd4MGaMTUctmEsQmA9Dics3ICU2q+Qv8n8sghV/giWoRZlooLH2P48p5P815AtQUvDIgCKV/T46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA3PR11MB9039.namprd11.prod.outlook.com (2603:10b6:208:570::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Thu, 28 Aug 2025 20:19:57 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Thu, 28 Aug 2025
 20:19:57 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Thread-Topic: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Thread-Index: AQHcBpqUULnsSN/1VEeqxSPKxk3pY7R4okKAgAABVwCAAAFvAA==
Date: Thu, 28 Aug 2025 20:19:57 +0000
Message-ID: <dfd6d9b3057bc323c56da2af732d91b0b21ec919.camel@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-3-matthew.brost@intel.com>
 <2efe98148129c4233337d92f28fba91dc2cf6f89.camel@intel.com>
 <aLC4uGWyD2V6hXgl@lstrano-desk.jf.intel.com>
In-Reply-To: <aLC4uGWyD2V6hXgl@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA3PR11MB9039:EE_
x-ms-office365-filtering-correlation-id: 1cd3979b-187b-446d-741c-08dde6704204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cXArWXlBUk5uRGM1ZzNDaHA5VXNxcnZtZmpMa1htTHhBaFFjUERJWmo2Uml4?=
 =?utf-8?B?MXJiSmdnVEJ5NVZmU0swb2VmN05jQ2J1bUh4dmtnT0h4TDRvUFdOZEhIeW9k?=
 =?utf-8?B?anBvSFhIUHE3UTE3T1krbGIxSFNQc1kwK2lvUzh4Tno0QUhLTHhZcUJ2OVdq?=
 =?utf-8?B?eEVWVWJYRnM1Qy9iMHNJMnZvdk54MjFEVGh1MHBSNUZsQmg5OENTaW15amxk?=
 =?utf-8?B?RWU1Q2plcjhvYzBJYlBpbGFLWHZraGZRWWhsQ3hXeGpQcjZPZ21nTlBISE1p?=
 =?utf-8?B?ZTltMnVkb1FIZWZ3dzhVZFMrR0tqNFVsdkJnUE1adnZTWXZHUGJrSzlVUmtr?=
 =?utf-8?B?VVRRcUxoeFdoQ3BRZENEb3FpeEtMVUNSTHNHRkdUZHhVNGI2TU1BWGIyUkFv?=
 =?utf-8?B?OWR2ODA1QWRLRnd2QzIxaXg3aDk4SlhvbVlHcURkK3lyVWt1YWlmTUd5VW4r?=
 =?utf-8?B?TTdjSVY2QWNraGFWNkJJenNYVkZxRXJNTzk0T3dZaTBhdC83Rk96MitESXJS?=
 =?utf-8?B?UEFqUW9TbHZiTTBXSFBkYUJQbjI3MUdkZmVGZnIzUmc0Uks0ckt2RWo0T3Nl?=
 =?utf-8?B?VG1oaTNia2NDc01tZDJMSlMzZjNZdS9Gck8xeFFKdzRpK1ExSjhmbU1MbUVn?=
 =?utf-8?B?dFN0dURDMDZyVTVhaGtXZXExbWZBbnVvMDdpQkN0R3o2ZzNSM0xWRHhKR2lt?=
 =?utf-8?B?SkQwSmkxajZNU29IeFdRaHVDVDBWWnM2NGhaOVJuTVZtNWpXRnhlZXdzNDcv?=
 =?utf-8?B?K3RFNUVPd2krRjRMTm9YenQwQkdKUDNtMXc4YWl1ajNqQWxkamN0RWhjMm1X?=
 =?utf-8?B?VnJCYXdTRzFaUlBZV1ZqVmI4T1FOOCtINEZ1NWVBdU5jR2NlMXBmS1BFQkUw?=
 =?utf-8?B?K0dFQ0VLZkptWnBaVnRxcVMzbkgvNko5UHM2MjNqWlNHTmZqSUpmMkVjUjFk?=
 =?utf-8?B?V0pQTm54WXBxdzlPcTRNZ0RCRXZNcFdkaWNTMElUcU1NYWp5Rm5tdXNQa2g3?=
 =?utf-8?B?TE9LZGc4aHZicVoyNE9JUkZ6TDczRFBwcjM0a2w0VzJ4aDAxM3Zkd05EZEJE?=
 =?utf-8?B?djl6OHBobjhZSXVPcWQ1dEZBdXlraXFWWFJSQk9ESVd4WWQ1MCtRVmFycUNY?=
 =?utf-8?B?MWRraTN5NmRpTk9scTc0U1lLWjZJNFZPelNkWjdweGxycGdVR0l6VVlzdytV?=
 =?utf-8?B?K3pQdmx2emliUUxncjBrUVNyU1VQcXhIUXpJbDhmVzJaVVFaOVZwV3ZuYzhG?=
 =?utf-8?B?UlZNNTZRLzc5b2lwQzU2aDdXRUNrUEY0eHRzdGpKSXQyVjRyL1pNMWhpNTZM?=
 =?utf-8?B?YThPKytFYjJTYUJnRVJjcmsrdXlnVFJKYmlzZ3liRkVJaDZpZkVnanBEWGcy?=
 =?utf-8?B?TmlZMnNBU2M2a29wUUx4cUZVaWRWM2I4TGFvaFNFNFhVUTRqVFFsejZKN0xt?=
 =?utf-8?B?TEQ4azdya3FyMUFraWY2VGt0MVpnZ0xqbUZFZkpuenZwTXpLLzZWUnZjZ0c0?=
 =?utf-8?B?alBiRjBpekZrWmx1YVhuUXhIcTZuaU1BQ0dObitsdlFGblB4ZFpKNkhKbDMv?=
 =?utf-8?B?OC9VbXVuZGNseDB3QldIOVNnb0FXeVV1ekc5Qk9sOStDNVh0UmdyV1AzMkc5?=
 =?utf-8?B?VTZud0UyMWZPMVJhRWRtdHNIUmVaUFBPT2I4VW56WUp3THdFb1FSMThVTnRw?=
 =?utf-8?B?RzNUMms0M2RQOGd5cjBLaUpqTkZ6MUNUckVZYTJHMWJXMnlzV1BRbi9mdncx?=
 =?utf-8?B?NDNzd1FKMXNmWlpXRkJLTzN0cFFlVDdSeVVrUm05MDVGYTlxTEhIaFRpaFp0?=
 =?utf-8?B?L0Z5aTZwcE9tbTh2YkNkOGhWTllTTElYTlBPcDRrNlhGeXUrTTk0WmxaWERI?=
 =?utf-8?B?bUVBaVMyemlsZnNpUm5tazV4V3JMWi8zQ1BLVFhCUUdzRDdSbStEaVNjWXQ5?=
 =?utf-8?B?TFRHSWRRR245MU43QWgrdUtKRGRmQkV2VGhBS1drd0RrblJ5VGNNYmlmVjQ2?=
 =?utf-8?Q?1M9/g6CMV8bsZ5Qj4uZj0nt6qX23Yg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWY5U1dyNHlWdzdvUlo4R2JkWkR1SkdLczRtTERzT2tPNlIzOUg2cUFXbk5s?=
 =?utf-8?B?Y2FSY0JBUjdqVkd0NkVLeVRBZTR6djRSdThudkZZT1FLRGVBb0ZKL0VNNjMy?=
 =?utf-8?B?Zkd2a0ZXV3RuS2JucC9pL2VCa3FvYkhRSkloZUcwQWVJYXFIeWNYUEFkczdT?=
 =?utf-8?B?SjV3dHdZOUNadXpBc3NzQUFZbUVhNTVUdUJwc1Y1S3AyNzk3STJ4SWd0T0E3?=
 =?utf-8?B?V3pxbThQVmtSN29MRHJQakMxK0RORGlNaEJJbUxaNjliTlQyYWhXZHFxdWpX?=
 =?utf-8?B?TEVzQkYycWErWG0rSWViVjJoNEh2L1RwUDdURm50MlVuSWZTSGk3S0JVZ3hx?=
 =?utf-8?B?ZmUrazZQRGprK21YdllnUnYvb1pUd2dRbG1PZk1xNk9IZkJOVmFwUEFHY2lW?=
 =?utf-8?B?ZFJEMG1KaDlqZXc5a3hkdFBPUDJ3MGtNcTJKUVd0UmFKbVVmT1hTRzVLVHZq?=
 =?utf-8?B?TjdLeDViSzlsSHFRNitYYWp5Lzl5dzdEQTV6dWpqOUZ3VDgvdkJTZk5YY3lR?=
 =?utf-8?B?SmVMbzdCYzVMOWVhYzVxd2w2em5ReUczVlJZdVFRdEZaUVB5WFJ5NlBPYTdp?=
 =?utf-8?B?cGZpeUg5ZXdBdUNlOW9CRW9BSDlXQlpmNVhxUDBlZHRQdktVclFQWFBhSXhM?=
 =?utf-8?B?MkVjUno1UGJRYzdCYWxMdWIrNWlxbzlwZlcyczNUKy9QYlk3em1vNnFCL0dD?=
 =?utf-8?B?UkVWUjc4QzVMK0F5S0hSc0VGNm1IZW9mTjI1VDROVmtGVWF6ajhwN3ZCaklK?=
 =?utf-8?B?Tm5NY3pIK0I1RGsyYzE4NXFWelR0STdpdGZVWW1pRGxsZjlJUnRuc1cxdWUr?=
 =?utf-8?B?N2pzajRtZU5Sb1BJQ1A0dFF2b01Md0YzTzlKM2VsVFdNUHA4YWd0Z05PY0Rl?=
 =?utf-8?B?V2pmQ2k4V3pTMTU0b2l0dDNoalVPVjc1TktvY3ExcmhHRllnODMyZTErMHFO?=
 =?utf-8?B?MFg5cFhNWFo2UUkwSWZsUTh3RERhQVBvMDViSnlORVprc2diUnJkcXhxdUhK?=
 =?utf-8?B?VnhzQ1FQUGdBWHFQL2xTeWd5SDFHQ1JNcUkvT1lvUk44MjJualAzSGlrVTJ1?=
 =?utf-8?B?VnFsUzdvZlNPayt0Zk5UNUVDaE55aXFOKzFqZFBCRXM1M09HNnBBVzlxamtK?=
 =?utf-8?B?T0hPWW1tVUVWN2E4blNWUCtad3pzeGNHbFJpMktqanZGZGhqRDFGNWg0UzA0?=
 =?utf-8?B?Z0NSMWtCOFQ5Y3pDNGRSTklPNy9EYkZyelhHQWlvNFNScUZVNERueVIrNEJY?=
 =?utf-8?B?ZkkvSWlJVGMzdW5Sa056RTgwb29FelpJUXhnRGNFcGNVRWFkTTVBMnVqR0NH?=
 =?utf-8?B?S3Z4ejlnSjJRM0ZIRWpGb3pVeDNCZ2FmY2tlem9VWmlhUnh3MkFrRk1DdHpq?=
 =?utf-8?B?UVVDTFIzbGh5MHNOejFTRHBrd1FDQkZ6NmlNNEdKSGZIY3h3M0gxSVJpTTBJ?=
 =?utf-8?B?ZUZ5NmJtdWkwN0dPaU5rTDgzbi81NXlkSmYxRTQyRmxnZEh3NHdSTnB6RmpR?=
 =?utf-8?B?N0pPK2xFZTdPb0ZoZ1dFREo3SUlvc3B6NllQQ3p0WnNNT25QdSs0eElCeVE5?=
 =?utf-8?B?Zkp5bzRzb2VOaW1TVFNNR3A1K1MybENtckZzSWR2TFN0SWYwOUdhbFZuTDFa?=
 =?utf-8?B?UGxZTEtwZFBPL0UvaWZMc01FZ3hvYmhaK2dHaXlQNVZzVUNhTGF2am5oY1V4?=
 =?utf-8?B?TDl0WVdzOUxiWmtIUHR5Y3EzcjVQQVlTQURHU0lOWlVTMjNLeitSK3Z2bnpB?=
 =?utf-8?B?U3l5WTkxUGFwb3RxRGk0OHFTUlFhK3djc0V1ZFRabWRvU1paR0FEWlRJd2pi?=
 =?utf-8?B?MElKYUIydWdpMlg5bDduYVBEZ3dQbzlJMVc4TndrdVIvbm1pOUZlQ2hNOGxI?=
 =?utf-8?B?eDlTc3NiOVFPVDVKbGcrcFRUNi9DYkRjVG5mRFRrUExvREV4Rkd2Z2VZVG1P?=
 =?utf-8?B?NG9ZS1JrM2ZuOVYxdndhS1AwNkhEQ2oxK3hWV2tiK3Zyc3piZ0MxUHh2cFQ1?=
 =?utf-8?B?RVBZWnlXVktDc3cySXN0QThnWUxadjgwMUtOTmJHTzhpVS9PUkVwWUsyL2pQ?=
 =?utf-8?B?TnVDUlNCZlowTWFQc3dhV3ZGWnQ0N3N6WllXS0dKNEtJc3VoMlpndURKdU9n?=
 =?utf-8?B?UkNFQTBzNFNqbngxQkVLbzU2L3Yxd2V0WFJlWTh4ZDV6bFBZNGtnU0ZBNUxm?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <512230E8488EDE46BA09E84299AAE3B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd3979b-187b-446d-741c-08dde6704204
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 20:19:57.4520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvyMUl/2OP6AnEFr0dh5MLcAgXr890HbmXkUZhstIvKYj7fn9uX2p3KdhkUbUg+O+G4hKDHgAQuuIZCuNvVNfYpXAE20MYCH7X6mFzgOHGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9039
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

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDEzOjE0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIFRodSwgQXVnIDI4LCAyMDI1IGF0IDAyOjEwOjAyUE0gLTA2MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE9uIFR1ZSwgMjAyNS0wOC0wNSBhdCAyMzoyMiAtMDcwMCwgTWF0dGhldyBC
cm9zdCB3cm90ZToKPiA+ID4gQ3JlYXRlIHBhZ2VmYXVsdCBxdWV1ZXMgYW5kIGluaXRpYWxpemUg
dGhlbS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmPCoMKgwqDCoMKgwqAgfMKgIDUgKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmggfMKgIDYgKysKPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cGFnZWZhdWx0LmPCoMKgwqAgfCA5Mwo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKyst
Cj4gPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMKPiA+ID4gaW5kZXggNTdl
ZGJjNjNkYTZmLi5jN2M4YWVlMDM4NDEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2UuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMKPiA+ID4gQEAgLTUwLDYgKzUwLDcgQEAKPiA+ID4gwqAjaW5jbHVkZSAieGVfbnZtLmgiCj4g
PiA+IMKgI2luY2x1ZGUgInhlX29hLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX29ic2VydmF0aW9u
LmgiCj4gPiA+ICsjaW5jbHVkZSAieGVfcGFnZWZhdWx0LmgiCj4gPiA+IMKgI2luY2x1ZGUgInhl
X3BhdC5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9wY29kZS5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4
ZV9wbS5oIgo+ID4gPiBAQCAtODkwLDYgKzg5MSwxMCBAQCBpbnQgeGVfZGV2aWNlX3Byb2JlKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+ID4gPiDCoAo+ID4g
PiArwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9wYWdlZmF1bHRfaW5pdCh4ZSk7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoGlmIChlcnIpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gZXJyOwo+ID4gPiArCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9udm1faW5pdCh4ZSk7
Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9oZWNpX2dzY19pbml0KHhl
KTsKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMu
aAo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaAo+ID4gPiBpbmRl
eCAwMWU4ZmEwZDJmOWYuLjZhYTExOTAyNmNlOSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaAo+ID4gPiBAQCAtMTcsNiArMTcsNyBAQAo+ID4gPiDCoCNpbmNs
dWRlICJ4ZV9sbXR0X3R5cGVzLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX21lbWlycV90eXBlcy5o
Igo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9vYV90eXBlcy5oIgo+ID4gPiArI2luY2x1ZGUgInhlX3Bh
Z2VmYXVsdF90eXBlcy5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9wbGF0Zm9ybV90eXBlcy5oIgo+
ID4gPiDCoCNpbmNsdWRlICJ4ZV9wbXVfdHlwZXMuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfcHRf
dHlwZXMuaCIKPiA+ID4gQEAgLTM5NCw2ICszOTUsMTEgQEAgc3RydWN0IHhlX2RldmljZSB7Cj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTMyIG5leHRfYXNpZDsKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHVzbS5sb2NrOiBwcm90ZWN0cyBV
TSBzdGF0ZSAqLwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBy
d19zZW1hcGhvcmUgbG9jazsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8q
KiBAdXNtLnBmX3dxOiBwYWdlIGZhdWx0IHdvcmsgcXVldWUsIHVuYm91bmQsCj4gPiA+IGhpZ2gK
PiA+ID4gcHJpb3JpdHkgKi8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0
cnVjdCB3b3JrcXVldWVfc3RydWN0ICpwZl93cTsKPiA+ID4gKyNkZWZpbmUgWEVfUEFHRUZBVUxU
X1FVRVVFX0NPVU5UwqDCoMKgwqDCoMKgwqA0Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAvKiogQHBmX3F1ZXVlOiBQYWdlIGZhdWx0IHF1ZXVlcyAqLwo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3BhZ2VmYXVsdF9xdWV1ZQo+ID4gPiBw
Zl9xdWV1ZVtYRV9QQUdFRkFVTFRfUVVFVUVfQ09VTlRdOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
fSB1c207Cj4gPiA+IMKgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiogQHBpbm5lZDogcGlubmVk
IEJPIHN0YXRlICovCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFn
ZWZhdWx0LmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMKPiA+ID4g
aW5kZXggM2NlMGU4ZDc0YjlkLi4xNDMwNGM0MWViMjMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcGFnZWZhdWx0LmMKPiA+ID4gQEAgLTMsNiArMywxMCBAQAo+ID4gPiDCoCAqIENvcHly
aWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uCj4gPiA+IMKgICovCj4gPiA+IMKgCj4gPiA+
ICsjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+Cj4gPiA+ICsKPiA+ID4gKyNpbmNsdWRlICJ4
ZV9kZXZpY2UuaCIKPiA+ID4gKyNpbmNsdWRlICJ4ZV9ndF90eXBlcy5oIgo+ID4gPiDCoCNpbmNs
dWRlICJ4ZV9wYWdlZmF1bHQuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfcGFnZWZhdWx0X3R5cGVz
LmgiCj4gPiA+IMKgCj4gPiA+IEBAIC0xOSw2ICsyMyw3MSBAQAo+ID4gPiDCoCAqIHdpdGggYSBz
aW5nbGUgc2hhcmVkIGNvbnN1bWVyLgo+ID4gPiDCoCAqLwo+ID4gPiDCoAo+ID4gPiArc3RhdGlj
IGludCB4ZV9wYWdlZmF1bHRfZW50cnlfc2l6ZSh2b2lkKQo+ID4gPiArewo+ID4gPiArwqDCoMKg
wqDCoMKgwqByZXR1cm4gcm91bmR1cF9wb3dfb2ZfdHdvKHNpemVvZihzdHJ1Y3QgeGVfcGFnZWZh
dWx0KSk7Cj4gPiAKPiA+IEFuZCBoZXJlLCBpdCB3b3VsZCBiZSBuaWNlIGlmIHlvdSBjb3VsZCBh
ZGQgYSBicmllZiBjb21tZW50IHRoYXQKPiA+IHRoaXMKPiA+IGFzc3VtZXMgdGhlIHNpemUgb2Yg
c3RydWN0IHhlX3BhZ2VmYXVsdCBhbGlnbnMgdG8gdGhlIGhhcmR3YXJlCj4gPiByZXF1aXJlbWVu
dHMuCj4gPiAKPiAKPiBJdCBpcyBhY3R1YWxseSBub3QgYSBoYXJkd2FyZSB0aGluZywgaXQgdGhl
IHBhZ2VmYXVsdCBxdWV1ZQo+IG1hbmFnZW1lbnQKPiBjb2RlIChzb2Z0d2FyZSkgd2hlcmUgdGhl
IGxvZ2ljIGJyZWFrcyBpZiB3ZSBhcmUgbm90IGRvaW5nIGV2ZXJ5dGhpbmcKPiBvbgo+IHBvdzIg
Ym91bmRhcmllcy4gT2ZjLCB0aGlzIGlzbid0IGEgc3RyaWNrIHJlcXVpcmVtZW50LCByYXRoZXIg
aXQganVzdAo+IG1ha2VzIHRoZSBjb2RlIHNpbXBsaWVyLgo+IAo+IEkgY2FuIGFkZCBhIGNvbW1l
bnQgYXJvdW5kIHRoaXMuCgpPayBnb3QgaXQuIFllYWggdGhhdCB3b3VsZCBiZSBoZWxwZnVsIGhl
cmUgSSBhZ3JlZS4KClRoYW5rcywKU3R1YXJ0Cgo+IAo+IE1hdHQKPiAKPiA+IFRoYW5rcywKPiA+
IFN0dWFydAo+ID4gCj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB2b2lkIHhlX3BhZ2Vm
YXVsdF9xdWV1ZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqdykKPiA+ID4gK3sKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgLyogVE9ETzogSW1wbGVtZW50ICovCj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4g
K3N0YXRpYyBpbnQgeGVfcGFnZWZhdWx0X3F1ZXVlX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUs
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX3BhZ2VmYXVsdF9xdWV1ZQo+ID4gPiAqcGZfcXVl
dWUpCj4gPiA+ICt7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3Q7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoGludCB0b3RhbF9udW1fZXVzID0gMDsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgdTggaWQ7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgZm9yX2VhY2hfZ3QoZ3QsIHhl
LCBpZCkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZHNzX21hc2tf
dCBhbGxfZHNzOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IG51bV9k
c3MsIG51bV9ldXM7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGJpdG1hcF9vcihhbGxfZHNzLCBndC0+ZnVzZV90b3BvLmdfZHNzX21hc2ssCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3QtPmZ1c2VfdG9w
by5jX2Rzc19tYXNrLAo+ID4gPiBYRV9NQVhfRFNTX0ZVU0VfQklUUyk7Cj4gPiA+ICsKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG51bV9kc3MgPSBiaXRtYXBfd2VpZ2h0KGFs
bF9kc3MsCj4gPiA+IFhFX01BWF9EU1NfRlVTRV9CSVRTKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoG51bV9ldXMgPSBiaXRtYXBfd2VpZ2h0KGd0LQo+ID4gPiA+IGZ1c2Vf
dG9wby5ldV9tYXNrX3Blcl9kc3MsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9NQVhf
RVVfRlVTRV9CSVRTKSAqCj4gPiA+IG51bV9kc3M7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHRvdGFsX251bV9ldXMgKz0gbnVtX2V1czsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgfQo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHhlX2Fzc2VydCh4ZSwgdG90
YWxfbnVtX2V1cyk7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyoKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgICogdXNlciBjYW4gaXNzdWUgc2VwYXJhdGUgcGFnZSBmYXVsdHMgcGVyIEVVIGFu
ZCBwZXIgQ1MKPiA+ID4gK8KgwqDCoMKgwqDCoMKgICoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgICog
WFhYOiBNdWx0aXBsaWVyIHJlcXVpcmVkIGFzIGNvbXB1dGUgVU1EIGFyZSBnZXR0aW5nIFBGCj4g
PiA+IHF1ZXVlIGVycm9ycwo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKiB3aXRob3V0IGl0LiBGb2xs
b3cgb24gd2h5IHRoaXMgbXVsdGlwbGllciBpcyByZXF1aXJlZC4KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgICovCj4gPiA+ICsjZGVmaW5lIFBGX01VTFRJUExJRVLCoMKgOAo+ID4gPiArwqDCoMKgwqDC
oMKgwqBwZl9xdWV1ZS0+c2l6ZSA9ICh0b3RhbF9udW1fZXVzICsgWEVfTlVNX0hXX0VOR0lORVMp
ICoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVsdF9lbnRy
eV9zaXplKCkgKiBQRl9NVUxUSVBMSUVSOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+
c2l6ZSA9IHJvdW5kdXBfcG93X29mX3R3byhwZl9xdWV1ZS0+c2l6ZSk7Cj4gPiA+ICsjdW5kZWYg
UEZfTVVMVElQTElFUgo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRybV9kYmcoJnhlLT5k
cm0sICJ4ZV9wYWdlZmF1bHRfZW50cnlfc2l6ZT0lZCwKPiA+ID4gdG90YWxfbnVtX2V1cz0lZCwg
cGZfcXVldWUtPnNpemU9JXUiLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
eGVfcGFnZWZhdWx0X2VudHJ5X3NpemUoKSwgdG90YWxfbnVtX2V1cywKPiA+ID4gcGZfcXVldWUt
Cj4gPiA+ID4gc2l6ZSk7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmRh
dGEgPSBkZXZtX2t6YWxsb2MoeGUtPmRybS5kZXYsIHBmX3F1ZXVlLQo+ID4gPiA+c2l6ZSwKPiA+
ID4gR0ZQX0tFUk5FTCk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcGZfcXVldWUtPmRhdGEp
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiA+
ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaW5pdCgmcGZfcXVldWUtPmxvY2sp
Owo+ID4gPiArwqDCoMKgwqDCoMKgwqBJTklUX1dPUksoJnBmX3F1ZXVlLT53b3JrZXIsIHhlX3Bh
Z2VmYXVsdF9xdWV1ZV93b3JrKTsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
MDsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIHZvaWQgeGVfcGFnZWZhdWx0X2Zpbmko
dm9pZCAqYXJnKQo+ID4gPiArewo+ID4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSA9IGFyZzsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqBkZXN0cm95X3dvcmtxdWV1
ZSh4ZS0+dXNtLnBmX3dxKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiDCoC8qKgo+ID4gPiDCoCAq
IHhlX3BhZ2VmYXVsdF9pbml0KCkgLSBQYWdlIGZhdWx0IGluaXQKPiA+ID4gwqAgKiBAeGU6IHhl
IGRldmljZSBpbnN0YW5jZQo+ID4gPiBAQCAtMjksOCArOTgsMjggQEAKPiA+ID4gwqAgKi8KPiA+
ID4gwqBpbnQgeGVfcGFnZWZhdWx0X2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gPiA+IMKg
ewo+ID4gPiAtwqDCoMKgwqDCoMKgwqAvKiBUT0RPIC0gaW1wbGVtZW50ICovCj4gPiA+IC3CoMKg
wqDCoMKgwqDCoHJldHVybiAwOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBpbnQgZXJyLCBpOwo+ID4g
PiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICgheGUtPmluZm8uaGFzX3VzbSkKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gPiArCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoHhlLT51c20ucGZfd3EgPQo+ID4gPiBhbGxvY193b3JrcXVldWUoInhlX3BhZ2Vf
ZmF1bHRfd29ya19xdWV1ZSIsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBXUV9VTkJPVU5E
IHwgV1FfSElHSFBSSSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX1BBR0VGQVVMVF9R
VUVVRV9DT1VOVCkKPiA+ID4gOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT51c20ucGZf
d3EpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsK
PiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgWEVfUEFHRUZBVUxU
X1FVRVVFX0NPVU5UOyArK2kpIHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGVyciA9IHhlX3BhZ2VmYXVsdF9xdWV1ZV9pbml0KHhlLCB4ZS0KPiA+ID4gPnVzbS5wZl9xdWV1
ZSArCj4gPiA+IGkpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVy
cikKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBn
b3RvIGVycl9vdXQ7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gKwo+ID4gPiArwqDCoMKg
wqDCoMKgwqByZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHhlLT5kcm0uZGV2LAo+ID4g
PiB4ZV9wYWdlZmF1bHRfZmluaSwgeGUpOwo+ID4gPiArCj4gPiA+ICtlcnJfb3V0Ogo+ID4gPiAr
wqDCoMKgwqDCoMKgwqBkZXN0cm95X3dvcmtxdWV1ZSh4ZS0+dXNtLnBmX3dxKTsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgcmV0dXJuIGVycjsKPiA+ID4gwqB9Cj4gPiA+IMKgCj4gPiA+IMKgLyoqCj4g
PiAKCg==
