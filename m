Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7D5C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 06:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C631E10E0DD;
	Fri, 14 Aug 2026 06:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e58IpwBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E5410E0DD
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786689521; x=1818225521;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bnePJmtcp2TxRaf/Jwfl7Q/3pvmIj2xEsFIRx3to4eM=;
 b=e58IpwBcWsS8gwl3csztWjRbdH30o+phI3O2REc5TaUWXYd93GzWJYta
 6d09jC08AjhJMe2MGFN6GPmgXU5OjXXKvTpSL7XylhVD5odBVmo3wTLtm
 eQL24jU3+IQZ+XMka6XHVWcKzv2q4IUUvWs2FoFY1awc5l6QnzRcF3Ikn
 H8QIjmKCEsr5kYhdwr3LSpDbCtCeEVHxjRKtsGY/BgUqNEFaxk/z19qop
 uMLtxuFyJQfiqMxfgDmXNKPEWQv/m3npl+BO8nFuDxk+nRAdu9g7eeX3W
 au5wLYHn4jjjlMj/nBLpi04e9jfUsNJqyVml6XWELRSAZTsaAij7IdwoH Q==;
X-CSE-ConnectionGUID: 006OlH7SSUu8LHdHNEIK8g==
X-CSE-MsgGUID: emWumhi0SvylUfV5Te+WNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98423658"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98423658"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 23:38:41 -0700
X-CSE-ConnectionGUID: 4QTONDomQmmRMTn1xw1Sjw==
X-CSE-MsgGUID: ci7oBXeBRw62/RTEYeXorg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="268004095"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 23:38:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 23:38:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 23:38:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 23:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F565lkWu+A182GKGpWoy58RVba8eppNLcmRDGvnPbGk09NHE5hEc8C0is8IyzyeaERurFFfr1/TMHeamBboUZ671YYy0Prxinq1g6vpPvV/0kyV04kLKhesgwTotBfGMD+6tyD5DcvWH0FCSQ2mZRftwAKq5U/4PgwQfCWmGyfmsHn1d4BnHZHA+NzA3kBYcNOF3XRc5O3iFjfvx9XR5g2sNaZcTGWxh8Fez7khXRUUBuKnX6VrXhozfMd5yX8WGq+e4mWcVkeTx4r3CtM8Mrpdpo2ATYKQ9/fVTTlCwVX1K9Aa+VY5c/sT8EOpnf3s+9kcBr/mQkmqj9pLTZ4DkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnePJmtcp2TxRaf/Jwfl7Q/3pvmIj2xEsFIRx3to4eM=;
 b=NiqFpWk7tw81N3wEgR2yiBuzHTlppgeSfR1hBw3yYhCh7KGvnPmulDZfTUxzARnEuANggR5cmiyynY2d4kgHcrpgb8HOvaltFn6LpWgDlLlHz0ZtPOIVPJAuT9dQc/XxXUhM2HSxH5zZh7+VTtC63qJtHKhuTAaJtyTinWxNWEVaDsOOtaxDyXMjaWnw5x46IDRFAnZA+jHP4RCzD044gWMFKJEAu1Kt09hvx4LbgD4k+/573cM2O87iLfVFOzv1fvGz3IGeSSzFR3MVQ/gbHEV8b81RRgTI0Ojd3Rt6QfTqp7xFD9STD4g08iRXmk8RzE+RCGsRsQlpBR6MwLRM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by BL1PR11MB6003.namprd11.prod.outlook.com (2603:10b6:208:387::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 06:38:31 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 06:38:31 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V15 08/14] drm/xe/vram: Add page offline data structures
 and lifecycle
Thread-Topic: [PATCH V15 08/14] drm/xe/vram: Add page offline data structures
 and lifecycle
Thread-Index: AQHdKY6pMyD3hzaA4E2zmxgxDgAbsraaUXKAgALGBOA=
Date: Fri, 14 Aug 2026 06:38:31 +0000
Message-ID: <DS0PR11MB871889986B5B4260D33BB50881DA2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-24-tejas.upadhyay@intel.com>
 <f6b491df-d74c-4540-8db5-6b028c85bf25@intel.com>
In-Reply-To: <f6b491df-d74c-4540-8db5-6b028c85bf25@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|BL1PR11MB6003:EE_
x-ms-office365-filtering-correlation-id: caaa21c4-1619-4810-82bd-08def9cea867
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|38070700021|56012099006|4143699003|18002099003|11063799006|22082099003;
x-microsoft-antispam-message-info: 2bRt1iiNZj7UZ1g9FmXfZ+kXZozot6ZI+/Bf7BQrPcYj5YmTES5pucc22xu7/w0EmLpHPYYxd1Mp1H8tuPhXqOnpmC/Q9/c9l4R9M7Knhchj9i5hPCLMrawBv4Ap0xExTkiETeMHzui11gCVnnkLtxMJLbzqegwtlHWlhlOd8bj2lWaWjFSZerExVBuwgIBNaCoTxTw05NQIm9b+vZ6YwOP4dLO9PmdzfcvT+sQRRViKyC8p3qNGIjUfcfH4zaUXhlL9XEJZ4ZJEgPRvWL67WBUUHqNBqz0PZ4P/Tob/lI0rVdWJBmMwdqKZBceSbxMof2Ijm8ZPJnvbbtkaRWdk60WYVsO/P5bikMOGFSUrziJuqnf7Lr5NzMBwv3YPhXz8bjDrcr6N36Nz7mcogD+DDRZlalVKBZxmV60MFx9BkeGXoVB2iigUDwAKP1jPjE/5FI5VaXD9hrtesyP8GMcGrlADgHXDq3XgQ1oJ0bJlLdgWR6FuRRKtTyPkQw+ERvDJMtO+QpCpEmH8yXrovzQfwZEEDWTIYyrPlGwy/FGlU7I+wDk6LmF826BTxlkxxWjWGAUewn2EcVw0ZWYN+9lY65qY5DP18A2vvKN0glC4Nkwwcst3IjDonXnZNGrZCyJCZyI5/Psen9Ui/0ijuksUXazvkx6fqC+J+BBo+IjammHeYTv0+3z4FZnkqYVAY6sku/JMziX2nOLaIvbd2v5m2w2NxrkUXnsnfQ+m2o9R+wo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(38070700021)(56012099006)(4143699003)(18002099003)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWMvb3RaQTZEQUZkdFZaaG15MjVVM0ZJM1RTc3p3S2xiOFFxS0MwSkNkTk9D?=
 =?utf-8?B?OGI1eXRmUTA5WENURlhRdnp1MTVEbis1OUFGUk1DZmt3MXFEeXB1anA5WDFR?=
 =?utf-8?B?c0dvZnBKSWFLb1dLQVBReGFab015WjcranpDRkZaaWVmMmtkWFAwOFUySlZx?=
 =?utf-8?B?c3BISm00UU9SdUtRaVRJcWFrRVJxbHppWmJ3b1RvOVNYQ01oeCtZNGxVWlhG?=
 =?utf-8?B?UHJ3TXRlUDdsN2tQNGxVV3FBVTRlUEowTVZkZTk3VVhDNlBXNy9LZ2J5Q0Jw?=
 =?utf-8?B?cmhDa2F3RHdpWE1tYjFKSXJ4NUxaM1B4N0xoT0lYM3ZmTnhMelp0NWFPTkIv?=
 =?utf-8?B?UStKemtZSUtEdXdPSWo4Mk1tdE1iKzdaN0haTERvajQ3bVEzTHpNbmZaRnYz?=
 =?utf-8?B?OHZ6dEZyVmplQkNWb1pSSm5xQ3pGQlJ3ZUlYUGRxR3lvTWtVTGxCbmtBL2xP?=
 =?utf-8?B?Z0ZEYjU2RnFnbnRkT3BaZ0J6dlRGTmNvdmwyWE5CRHY0THNrTWZwL0d1MW9k?=
 =?utf-8?B?RWx5QlZXd1AwZ0RxZkhhaENka3RhMHgrVVBaelJMQU1hYXl4bSsvb0xmR1Rp?=
 =?utf-8?B?dzYwamtFeVlxb2x4VW4xL3Z4ZTFrWW9CUzNmSnNNSEtYVXRsdFpRc01wdkRG?=
 =?utf-8?B?QmEzdnZWWjVqcWFmb1NlUmhDODNRVjVNTElHQmdIZW1weDdVa1JVNDhEMEFv?=
 =?utf-8?B?ZmNvOE9mL29sa3VTcUo5L25IY0Z1dVNualdKSlEwRW9FWU9PWVpsZkVMdWZK?=
 =?utf-8?B?TTEyQkZiT0c0UGRvOU5YWnU4cVorZEJvRmtYbWRBbURxMjRVaEFVK3AwQ0hw?=
 =?utf-8?B?eC9ob1p1L2t5cDlOVERkMEVFL0w4K2o5LzRBclV0NjJFdXVzWk1ocUxsc0Zq?=
 =?utf-8?B?eExZMjJmL0pucXM4T2JhMGZ4YTdkdFA4YnB2djFieTZqeDAxb3dnVFBPL1RK?=
 =?utf-8?B?elpKODYzVDJJRWdjTkM1ZGhTNjRpamVRU3VWTURSeVEzMkI0eGN2M25xNmw4?=
 =?utf-8?B?OW55OXhrbkRQN2FyY1o5aGExWVR3d3loeTJGdFBOUVRnazI1MDN4TVlwVHlG?=
 =?utf-8?B?azZDUEwxOUJTZHhaUndDenFmUGdrT0FwK2prdEQybVlPcXR1MHZMaUg2dnZk?=
 =?utf-8?B?cCtCWTMydHRvRmdxN254dlMyWUdVTWlZanVwR243bUxXMllrSkNVMEtaWjlF?=
 =?utf-8?B?alJyMVVXZnRBRUZiZmpYNDIwUktqdm1vMFNxV1dSbnZaRjZ1RWJ6a1hZL0Rt?=
 =?utf-8?B?YnlpS2diK200TTF4V1lRZEhIamNxbVBpMjNOa1RYWk5KK3h6VURISm5sYnND?=
 =?utf-8?B?RTJ1UmJQQ2w5eHJRQklpcmRUY3R5NmVGK1Y4ZUxxK2ZCNkVUYnd2WXNhMkU3?=
 =?utf-8?B?Vjk2Uit3dkVJMWJFYzVGSnZTNWxFMU05Y3VBWHArcHk4YnYxNlBoVmJXY3Bz?=
 =?utf-8?B?cE5oNUJZT2gzQmhrWWJRZDJLTi9QeXBhMGlxWmVLT0pzeEdWQm1YejFJTWFr?=
 =?utf-8?B?dmZLWE40eGd1MnJVY1FmWDhLZkNEWVBiZVIxQkhnTDNvOHFXcFdSZURJZ0dP?=
 =?utf-8?B?a0t6VXZmbnZscmJUbk1ESjZkYWNXck4xdGtEWnEwdCsvR2NoWlhrNGx2NERS?=
 =?utf-8?B?Z1NKanU0NEhUcUtjVGNMbE9GRUJTUmJlS3pFTW1HbVdzMyt6Snp1dkVEb2NG?=
 =?utf-8?B?d25rL2FsRFN5c0RETGNvRnhTSmZQMytPU3lwNHhDY2xWRjI0SVZibFc1dW05?=
 =?utf-8?B?OWR0bC8yT0xQajJqZEt3U3lmc2IxL2pNbnVuQVFQeDV1UjZ2KzJsM3VWcWcy?=
 =?utf-8?B?NzRhRWNrY2NTdEpqMDlNVEs3NXJ0ODFjSlhDYzJPRWlzcXZudjdsTHM2elY0?=
 =?utf-8?B?WmRoUStnSUZWNkorR1BTR0lyU0R5MlY5N2h6WHA1dVB6b3oveUJlUURjeWZv?=
 =?utf-8?B?b1RYak9yZi9qNkxLZy8rWURwSlUyME50ellFN0diWmR5RG5JTFlqQk1CZUJI?=
 =?utf-8?B?ZndQOHhDaE84VXpIN3J5VUZYRzEwRGxqWWpZSmxPMDZqQmMwOSt3S1MrVm1z?=
 =?utf-8?B?K21FWUc5a085UHRES1pMRXJSMHl0dndEQnJlajc2N3dWYlZrYytrVGxnMlJp?=
 =?utf-8?B?dkV5dFdIeFYyLzhlWHo1NmM3WlJsVyt0ci9pL1UxcGRDWVdDdVJob3drUWNU?=
 =?utf-8?B?L3kvZDRiZzlqdy9EcVl0bjdCMW5VeURvUE9ZOXZuVnF1a1JDaUUxOWMxbitC?=
 =?utf-8?B?Y3Z0T0g2b2R6b0dBTWt1TmNVRDNNTzFpNnJmaUZRQnRqd05ES0pXenh3R1VH?=
 =?utf-8?B?cHJSZFRkVkQ1and2ZWVxQ3BlQlZXZUlNejgrZmp4YlI4MlJTQW92dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QsIX1sj0blpbVsJ4MxjsC7wIO63WTW75DiMdpGf7SDxqHP7atwNSsSyJ4kwAgXdMllcx3tSilEvLE5/sz1xauCX+18Q3HPb84VUOZVkDqHRF+IpdTWUDtOpj1p+Z8lRnP4uJpEnMWyDpbTa5BQeFHam0zJY5wJWQUCIgbqe9CWplgWiIK+Pds61a96EywRdKUn/sbVVV9Z/dsyOZxq/4AJCuElbDBOtohsybVthtJEDEskaf7kSsdn4PNDbJksIPvl+QuwlBF/x4Ayl7ux79ItUcUWS/j0PCMKm2kx+n7z2rJmrK5NveKhc0Qoh3I8tvL0Xjuoah6aB/KG4umdI85g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caaa21c4-1619-4810-82bd-08def9cea867
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 06:38:31.6626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4FSTeTZJj7qPABTqxT2L92Y+/aupdAcb49Jaqq0iUKekHVQ6nhxQR4KVK0IZrkYojhZ7L3OLNpYccC7w54/41o+HozdHh8GZQtoNBevJ6cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6003
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2hpbWlyYXksIEhpbWFs
IFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU2VudDogMTIgQXVn
dXN0IDIwMjYgMTc6MzENCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50
ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFYxNSAwOC8xNF0gZHJtL3hlL3ZyYW06IEFkZCBwYWdlIG9mZmxpbmUgZGF0YQ0K
PiBzdHJ1Y3R1cmVzIGFuZCBsaWZlY3ljbGUNCj4gDQo+IA0KPiANCj4gT24gMTEtMDgtMjAyNiAx
ODoxMCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gQWRkIHhlX3R0bV92cmFtX29mZmxpbmVf
cmVzb3VyY2UgdG8gdHJhY2sgaW5kaXZpZHVhbCBvZmZsaW5lZCBWUkFNDQo+ID4gcGFnZXMsIGFu
ZCBleHRlbmQgeGVfdHRtX3ZyYW1fbWdyIHdpdGggb2ZmbGluZWRfcGFnZXMvcXVldWVkX3BhZ2Vz
DQo+ID4gbGlzdHMgYW5kIHRoZWlyIGNvdW50ZXJzLg0KPiA+DQo+ID4gSW5pdGlhbGl6ZSB0aGUg
bGlzdHMgaW4gX194ZV90dG1fdnJhbV9tZ3JfaW5pdCgpIGFuZCBhZGQNCj4gPiB4ZV90dG1fdnJh
bV9mcmVlX2JhZF9wYWdlcygpIHRvIHJlbGVhc2UgYWxsIHRyYWNrZWQgcGFnZXMgZHVyaW5nDQo+
ID4geGVfdHRtX3ZyYW1fbWdyX2ZpbmkoKSB0ZWFyZG93bi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMgICAgICAgfCAyNA0KPiAr
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFt
X21ncl90eXBlcy5oIHwgMjYNCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdHRtX3ZyYW1fbWdyLmMNCj4gPiBpbmRleCA0OWVlZWM5MGE0NzAuLjI4MTNhZTY4MzI1ZSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMNCj4gPiBAQCAtMzAw
LDYgKzMwMCwyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2Z1
bmMNCj4geGVfdHRtX3ZyYW1fbWdyX2Z1bmMgPSB7DQo+ID4gICAJLmRlYnVnCT0geGVfdHRtX3Zy
YW1fbWdyX2RlYnVnDQo+ID4gICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIHhlX3R0bV92cmFt
X2ZyZWVfYmFkX3BhZ2VzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdA0KPiA+ICt4ZV90
dG1fdnJhbV9tZ3IgKm1ncikgew0KPiANCj4gRG9uJ3Qgc2VlIGRldiBiZWluZyB1c2VkID8NCg0K
T2ssIHdpbGwgcmVtb3ZlLg0KDQo+IA0KPiA+ICsJc3RydWN0IHhlX3R0bV92cmFtX29mZmxpbmVf
cmVzb3VyY2UgKnBvcywgKm47DQo+ID4gKw0KPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KHBvcywgbiwgJm1nci0+b2ZmbGluZWRfcGFnZXMsIG9mZmxpbmVkX2xpbmspDQo+IHsNCj4gPiAr
CQl4ZV90dG1fdnJhbV9idWRkeV9mcmVlKG1nciwgJnBvcy0+YmxvY2tzLCBwb3MtDQo+ID51c2Vk
X3Zpc2libGVfc2l6ZSk7DQo+ID4gKwkJbGlzdF9kZWwoJnBvcy0+b2ZmbGluZWRfbGluayk7DQo+
ID4gKwkJLS1tZ3ItPm5fb2ZmbGluZWRfcGFnZXM7DQo+ID4gKwkJa2ZyZWUocG9zKTsNCj4gPiAr
CX0NCj4gDQo+IFRoaXMgY2FuIGJlIHJhY3ksIGJldHRlciB0byB1c2UNCj4gbGlzdF9kZWxfcmN1
KCkgKyBrZnJlZV9yY3UoKQ0KDQpUaGlzIGlzIGFscmVhZHkgaGFuZGxlZCBpbiBwYXRjaCAxMSB3
aGVyZSB3ZSBpbnRyb2R1Y2UgUkNVIGxvY2suDQoNCj4gDQo+ID4gKwlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUocG9zLCBuLCAmbWdyLT5xdWV1ZWRfcGFnZXMsIHF1ZXVlZF9saW5rKQ0KPiB7DQo+
ID4gKwkJeGVfdHRtX3ZyYW1fYnVkZHlfZnJlZShtZ3IsICZwb3MtPmJsb2NrcywgMCk7DQo+IA0K
PiBOaXQ6IHBvcy0+dXNlZF92aXNpYmxlX3NpemUgaXMgYWx3YXlzIDAsIGhhcmRjb2RpbmcgaXMg
T2suIGNvbW1lbnQgaXQgPw0KDQpTdXJlDQoNCj4gDQo+ID4gKwkJbGlzdF9kZWwoJnBvcy0+cXVl
dWVkX2xpbmspOw0KPiA+ICsJCS0tbWdyLT5uX3F1ZXVlZF9wYWdlczsNCj4gPiArCQlrZnJlZShw
b3MpOw0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgc3RhdGljIHZvaWQgeGVfdHRtX3Zy
YW1fbWdyX2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqYXJnKQ0KPiA+ICAgew0K
PiA+ICAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gdG9feGVfZGV2aWNlKGRldik7IEBAIC0zMTEs
NiArMzI5LDEwIEBADQo+ID4gc3RhdGljIHZvaWQgeGVfdHRtX3ZyYW1fbWdyX2Zpbmkoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqYXJnKQ0KPiA+ICAgCWlmICh0dG1fcmVzb3VyY2VfbWFu
YWdlcl9ldmljdF9hbGwoJnhlLT50dG0sIG1hbikpDQo+ID4gICAJCXJldHVybjsNCj4gPg0KPiAN
Cj4gDQo+IHBvdGVudGlhbCBsZWFrIGhlcmUgZHVlIHRvIGVhcmx5IHJldHVybiA/DQoNClJpZ2h0
LCBvZmZsaW5lZCBwYWdlIGVudHJpZXMgYXJlIGluZGVwZW5kZW50IG9mIGFjdGl2ZSBCb3Mgd2hp
Y2ggYWJvdmUgZWFybHkgcmV0dXJuIGlzIHByb3RlY3RpbmcgYnkgbGVha2luZywgc28gbW92aW5n
IGl0IGFib3ZlIHRoZSBlYXJseSByZXR1cm4gd291bGQgYmUgYSB2YWxpZCBpbXByb3ZlbWVudC4N
Cg0KVGVqYXMNCj4gDQo+ID4gKwltdXRleF9sb2NrKCZtZ3ItPmxvY2spOw0KPiA+ICsJeGVfdHRt
X3ZyYW1fZnJlZV9iYWRfcGFnZXMoZGV2LCBtZ3IpOw0KPiA+ICsJbXV0ZXhfdW5sb2NrKCZtZ3It
PmxvY2spOw0KPiA+ICsNCj4gPiAgIAlXQVJOX09OX09OQ0UobWdyLT52aXNpYmxlX2F2YWlsICE9
IG1nci0+dmlzaWJsZV9zaXplKTsNCj4gPg0KPiA+ICAgCWdwdV9idWRkeV9maW5pKCZtZ3ItPm1t
KTsNCj4gPiBAQCAtMzM4LDYgKzM2MCw4IEBAIGludCBfX3hlX3R0bV92cmFtX21ncl9pbml0KHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiBzdHJ1Y3QgeGVfdHRtX3ZyYW1fbWdyICptZ3IsDQo+ID4g
ICAJZXJyID0gZHJtbV9tdXRleF9pbml0KCZ4ZS0+ZHJtLCAmbWdyLT5sb2NrKTsNCj4gPiAgIAlp
ZiAoZXJyKQ0KPiA+ICAgCQlyZXR1cm4gZXJyOw0KPiA+ICsJSU5JVF9MSVNUX0hFQUQoJm1nci0+
b2ZmbGluZWRfcGFnZXMpOw0KPiA+ICsJSU5JVF9MSVNUX0hFQUQoJm1nci0+cXVldWVkX3BhZ2Vz
KTsNCj4gPiAgIAltZ3ItPmRlZmF1bHRfcGFnZV9zaXplID0gZGVmYXVsdF9wYWdlX3NpemU7DQo+
ID4gICAJbWdyLT52aXNpYmxlX3NpemUgPSBpb19zaXplOw0KPiA+ICAgCW1nci0+dmlzaWJsZV9h
dmFpbCA9IGlvX3NpemU7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90
dG1fdnJhbV9tZ3JfdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFt
X21ncl90eXBlcy5oDQo+ID4gaW5kZXggOTEwNmRhMDU2YjQ5Li5iZGZkZjZlYzEyMTggMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21ncl90eXBlcy5oDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21ncl90eXBlcy5oDQo+ID4g
QEAgLTE5LDYgKzE5LDE0IEBAIHN0cnVjdCB4ZV90dG1fdnJhbV9tZ3Igew0KPiA+ICAgCXN0cnVj
dCB0dG1fcmVzb3VyY2VfbWFuYWdlciBtYW5hZ2VyOw0KPiA+ICAgCS8qKiBAbW06IERSTSBidWRk
eSBhbGxvY2F0b3Igd2hpY2ggbWFuYWdlcyB0aGUgVlJBTSAqLw0KPiA+ICAgCXN0cnVjdCBncHVf
YnVkZHkgbW07DQo+ID4gKwkvKiogQG9mZmxpbmVkX3BhZ2VzOiBMaXN0IG9mIG9mZmxpbmVkIHBh
Z2VzICovDQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIG9mZmxpbmVkX3BhZ2VzOw0KPiA+ICsJLyoq
IEBuX29mZmxpbmVkX3BhZ2VzOiBOdW1iZXIgb2Ygb2ZmbGluZWQgcGFnZXMgKi8NCj4gPiArCXUx
NiBuX29mZmxpbmVkX3BhZ2VzOw0KPiA+ICsJLyoqIEBxdWV1ZWRfcGFnZXM6IExpc3Qgb2YgcXVl
dWVkIHBhZ2VzICovDQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIHF1ZXVlZF9wYWdlczsNCj4gPiAr
CS8qKiBAbl9xdWV1ZWRfcGFnZXM6IE51bWJlciBvZiBxdWV1ZWQgcGFnZXMgKi8NCj4gPiArCXUx
NiBuX3F1ZXVlZF9wYWdlczsNCj4gPiAgIAkvKiogQHZpc2libGVfc2l6ZTogUHJvcGVkIHNpemUg
b2YgdGhlIENQVSB2aXNpYmxlIHBvcnRpb24gKi8NCj4gPiAgIAl1NjQgdmlzaWJsZV9zaXplOw0K
PiA+ICAgCS8qKiBAdmlzaWJsZV9hdmFpbDogQ1BVIHZpc2libGUgcG9ydGlvbiBzdGlsbCB1bmFs
bG9jYXRlZCAqLyBAQA0KPiA+IC00NSw0ICs1MywyMiBAQCBzdHJ1Y3QgeGVfdHRtX3ZyYW1fbWdy
X3Jlc291cmNlIHsNCj4gPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICAgfTsNCj4gPg0K
PiA+ICsvKioNCj4gPiArICogc3RydWN0IHhlX3R0bV92cmFtX29mZmxpbmVfcmVzb3VyY2UgLSBU
cmFja3MgYSBzaW5nbGUgb2ZmbGluZWQNCj4gPiArVlJBTSBwYWdlICAqLyBzdHJ1Y3QgeGVfdHRt
X3ZyYW1fb2ZmbGluZV9yZXNvdXJjZSB7DQo+ID4gKwkvKiogQG9mZmxpbmVkX2xpbms6IExpbmsg
aW50byBtZ3ItPm9mZmxpbmVkX3BhZ2VzICovDQo+ID4gKwlzdHJ1Y3QgbGlzdF9oZWFkIG9mZmxp
bmVkX2xpbms7DQo+ID4gKwkvKiogQHF1ZXVlZF9saW5rOiBMaW5rIGludG8gbWdyLT5xdWV1ZWRf
cGFnZXMgKi8NCj4gPiArCXN0cnVjdCBsaXN0X2hlYWQgcXVldWVkX2xpbms7DQo+ID4gKwkvKiog
QGJsb2NrczogQnVkZHkgYmxvY2tzIHJlc2VydmVkIGZvciB0aGlzIHBhZ2UgKi8NCj4gPiArCXN0
cnVjdCBsaXN0X2hlYWQgYmxvY2tzOw0KPiA+ICsJLyoqIEB1c2VkX3Zpc2libGVfc2l6ZTogQ1BV
LXZpc2libGUgYnl0ZXMgY29uc3VtZWQgKi8NCj4gPiArCXU2NCB1c2VkX3Zpc2libGVfc2l6ZTsN
Cj4gPiArCS8qKiBAYWRkcjogRmF1bHR5IERQQSByZXBvcnRlZCBieSBIVyAqLw0KPiA+ICsJdTY0
IGFkZHI7DQo+ID4gKwkvKiogQHN0YXR1czogUmVzZXJ2YXRpb24gc3RhdHVzICgwPXBlbmRpbmcs
IDE9ZmFpbCkgKi8NCj4gPiArCWJvb2wgc3RhdHVzOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgICNl
bmRpZg0KDQo=
