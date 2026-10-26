Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7521606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JWaRFER9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9959A10E239;
	Mon, 26 Oct 2026 17:41:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3446B10E2D9
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 17:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793036507; x=1824572507;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MDCVjeDMSw2stBt+P3p4aQAWPFvEBB18K2vxpD7OP54=;
 b=JWaRFER9RTKObfDaa4SLuWgCHIUWJ6oE6ELL2GRLOInmCx28HdKX1uNs
 +WUvq7cjhUMnZUNaf1WVsDPLFN+4xxpT29L3aYhVK4txxPF1ANaUvwGH7
 aKXOFa267IElhvSE3i3HswteQEXNMYfaCEPKjig8VPLLHYxrm2ZNUtcRW
 AMYvUIEV5u/LH6kyvAkMAuY64FeBtzGKuK8r9HD1XgqZG0d3ZRlocsVIP
 xaDUwYDeH6XG7dCsGlepbl2ynUzPaU35BYGiW1qoxbA6Xb7WILlebCRhl
 NRc/jnGzjMqUer6rLDfJqxlZDDJBN8tjyeaSVXuiqRRdqg1iFMgZ1zMUq w==;
X-CSE-ConnectionGUID: fqt+cZlQRtmBZ039LeXuig==
X-CSE-MsgGUID: HUznSIROTqWEr9BQWv+XEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1805500"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1805500"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:41:46 -0700
X-CSE-ConnectionGUID: 2A9vIseFTjqDkQy0DtsR/Q==
X-CSE-MsgGUID: rQS0Pp1uR4yd0p2BQf7gaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6180221"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:41:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 10:41:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 10:41:45 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 10:41:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qmly4mP2/u2fuOL1HIWpqRN6jY49bAJRwQTf2pSXs78RuwZ/mFwLowCvo8zVo4PVxOr7kxhPqFb2E7R8FLdprubwqhCHYs/8ofwXdLVoeR3WKpgZ8lCnL4Xx8QEzDa61+qZHtkxBgXCwRyqiU3LG7iI+dStfSqp0Pfryx8Su5oUvWMA1V5/cKn6EDJSkNL3+D7apvLWwA2Honot+XaLlVJjdLB9jZqEwNLSpEn6fhJeDZHNcpx9bKm3tWcMq87acOxKwENn+wLbLgyrUOvl3unTOW9UJc8lsFtgim60o2jqn4nXo+0BVCnIPWx+OV1Hg0riCXS+9zzNXR9fDsPxIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDCVjeDMSw2stBt+P3p4aQAWPFvEBB18K2vxpD7OP54=;
 b=kgWVyK/gJc0NeJmZB1Hg21o09jolht4JaZeQGAi1Yt3+4wdT7gdJZM/K5e+W40fERktrBAc5ycdkOHQ5YasRygSF6uXMTZQ7qS+Ci52usrWE5qLVNROOoRGxpw9DF7lLf0sEw0HnnhKCZ13cKN/RbjeNUCrdPy/cN3lKhQXYbTcmDm/Fw0n4+OMRCFGOpFRwn6syNtiddBcyE9FReDYj83gmtYjdR1LbGsE93S4q4dNuxo7gTO5nByndRyrSSSINBSvuS9rD5izXhPbbUQnsAOuEDrBbnPM+yVd/Qhi2gkpjFbe0ayi1qpSDmK60U5zRMtsXXR0bTub1Ig/HHPIgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DSWPR11MB9560.namprd11.prod.outlook.com (2603:10b6:8:36d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Mon, 26 Oct 2026 17:41:37 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 17:41:37 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/bo: Protect pinned list check with pinned.lock
Thread-Topic: [PATCH] drm/xe/bo: Protect pinned list check with pinned.lock
Thread-Index: AQHdZWcAVobbZ7Hg+Emdg6C9EvjMu7cQF7AA
Date: Mon, 26 Oct 2026 17:41:37 +0000
Message-ID: <386706f1ccb81ab06257e75567976350f54d923b.camel@intel.com>
References: <20261026162530.74757-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261026162530.74757-1-naresh.kumar.g@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-2.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DSWPR11MB9560:EE_
x-ms-office365-filtering-correlation-id: 361952fa-93d3-487b-5bed-08df338862d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|23010399003|38070700021|11063799006|56012099006|261021123027099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: SXQvNpwpGugv8Z0WGG4os2fFOWfxStCAHPFv0cqEI/1DDtsg5rk35hZRNR+Sq0r+4d8whNU3MSLq7a3f+/lOq+CDd3p1HfmrQs1CPuYIGtnTEPDnE00H7+f6f4bVP9f34BkNZQZWxF6ojGhxKfCagwwssFzyMknBsPCODVVcVPnUkFppnFt8RMawdUoud5bqPw1IyjAuVn52DF9arKzB+aG/H+H5mZGoYNR+MVhZawrw4caaBlcFPhvQXPdFchSC4J5CHZzIDszTiTbsHv9uf60iYN1qlbfJS4a/U0Hqwm/Jxy0CRmxOc01N9juLVqt/lzU97twLhiuFsk/R150vsIrGkBx5xrYWP2E4wk0IisJiwJGpqVLjHZgWK8yaWmQRtSAhx8+9IUjuj2LLFArG6MLyLUQLnfPCckZuOaRtxaWCzSS5hOUZPei14tJonSZ0yQA4jCuZ8yyRAfUYryEipNuIZ9xf1lUOxG/N9oQvtoCVhQOGU7Fq3/A73CySWIPd9ZDKDHw0Yd0ds6uDLaZyTZMNB/8qq7fJ5qjdoEMgYpfkTQkeSgvIU3tS6xXAbNETRXEag44wcEw++e++qnofAJi5zqAEukj82b43yPt+Y+VUoLbExWfWKcEgryLmcI00QYODSx6w6HBKcMCgLKqNKugTJ8U8MjKGe0XxaHSwuGMUAbrIfWtiTD272T9+OSGETnnlzBgeIXgbeFzABfH+QvI60TBhsDshOGh0rSTm4kY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVA4Nmwyb0NIME53MFhTWENoamlWeVJiR1lJbCsyZVg4L2drV2hmMkJSUDdX?=
 =?utf-8?B?Y3BtT0ltVUE2MHhYU2hsd0hFRVhjWVBySDV5c2tuZ0xpTW0xYVdGR1BkSlNx?=
 =?utf-8?B?NEJmTWU1ZlE4N1psSUZjWU9SMXZhdnRvRmpkUHcvZkwzVGxDeUJuajFQWXlx?=
 =?utf-8?B?bjY4WGxuL2tNMjVWRVhsZmhMRHNFS28vbWxhQzZxOHFPSFFmdElHY2ludFds?=
 =?utf-8?B?eStGNzVUdDNoVkQzYVVPTUY3ZkIzbkM5ZU4rd0JRU0I1KzBmZFBwbkRTVmcw?=
 =?utf-8?B?aUtTc2xpUHBCMTJnbklhMUhaRnNGdTRqTzFRSERQVDdSSlNpNTluK08reS8x?=
 =?utf-8?B?emgyUkRHVk5jbjZLWmtwMmZlL0RJSG8xOVAyYWZpaXo1MjE5ZFhDSEZpYmpL?=
 =?utf-8?B?aGYzbUl5RGcvQ0V5cHlxQWx4SVZhTmwxaG9WWXY4UVBJM1VFamIwdUNMajVv?=
 =?utf-8?B?bUhJTWtDUjdFMXU4S0t4cUZFNVZCOTFvaklwSXY1MzNHL09BN1V2RnEzcXcw?=
 =?utf-8?B?eE1CTTk2cjZtKzZ1N2k2MWxRVUlQT2dERTBKWUM3SUpSTWpSYlRUNkhQZEJQ?=
 =?utf-8?B?amlZd1FNVjg2K3BNTUJ6QkpuQ1FXTDZlNmNvWnJzUGlFb2p0blNqM2x5cEll?=
 =?utf-8?B?TGhTcnptTmIvejRPYk5XNExRc1orT285bnhsSzNQY3YvT1VIMEJYR3lmSGxh?=
 =?utf-8?B?eThRTGxWRkxVUHZyUUtwNzBsUkQ5NjI1aU5uMDFIaS9GYzY3blpIZVA4MG1W?=
 =?utf-8?B?b1ZGNGFrbUdZTy9ha3Nqc1lwb1I0c1BqR3NjV2w1eVNRWXBGSHBXRktkRnpi?=
 =?utf-8?B?TjJjQ3E0bVpvalkzUDVTWnlGQitSMm1sZUJ0S2J2ZEpRMHhQV253RHN1YXRL?=
 =?utf-8?B?S09YMUh2OGpMNGdKRlk4bzRJS1hwbzdtWElXaXB0b0hvL3FyeXd6T2U2b1Bz?=
 =?utf-8?B?QzZmbWo1bVQwRy9GNFRwSGhqTEZUeVRnVHZ6QnRyV2Z5U3h6aHdNS2ZXeTJX?=
 =?utf-8?B?dXZFUmR4ZmlCVXkzcVFPOERXSFd4SldjdFdlcy9wcHpQQVBOZ3lxSHJOWjB3?=
 =?utf-8?B?UXBwRTRlUm9EbFc2aytGenJnZ1RnaGx0VGhNd2xKZEtGTlQ0ZGhrVndaM1FN?=
 =?utf-8?B?bmRRdktoMkc5VnN2U3B1NUd0eVVJWjBQTjVCNUxhQW5LWWlldjF0Ty9qNDFk?=
 =?utf-8?B?YW9BV21aek80eE8zZENTWUdqMXU1Q29raHF1YTRZQ0kxLzZVYjN2ZUcrckpy?=
 =?utf-8?B?SzVxaGY1a3Rac09KN3FORE5qVjZHOXhLWlVnU3pEbDFJakJteFVUOGRTcWJU?=
 =?utf-8?B?TFhFM1NlMEU1Z0tncG9maHp3ZFc5dUl5TXlGT290THZ0ZVE4RE1QcDNXZ0ly?=
 =?utf-8?B?RU11d0owa0htUU8xTGRIQzA1UGZrS2swZ3kyLzNBekNNVGZjV3Z3UVRWL2dv?=
 =?utf-8?B?MmtxVGFHMDdFeGlTbnMxa3haTU5yaWgwK0FjeG9CVTdTUllKY2RRVmgzMlp3?=
 =?utf-8?B?TStQWk1tZGV1eGNzUkV6c0NiNlNCaTNFQ29xejRCSndLT0o2QjFDWXordVky?=
 =?utf-8?B?Z1VOaC9vOWFYb1BQZG0vL0U1U09rZENWV0ZZVlhBOHo5L0RLWEpLUG9MYUlr?=
 =?utf-8?B?elhoY2VBdVRERGZwZlBPMm1rTFlOc0VWbFYydWw3N1JlUVpCYjRkcTl3dXc5?=
 =?utf-8?B?TXc1c2EzNTJ0VWMrRGU5Mi9aOUFnanpHd2Z0Ym9uQUNIS3pwRll3L1Z0WGVB?=
 =?utf-8?B?cVlVR1NRNFZURGJreHlaUVBzRGFkWkZxa0xLbzNrR2U4MUxCckRvalBpVEdr?=
 =?utf-8?B?ZHY5eXArdXBlWTFac043WGpoZlBZbFBJbUhBdUhIait4c2YyR3k4d3kxd1Nh?=
 =?utf-8?B?aVBVWnJFUnpTVndkUGJLd0FCNTByaHhNSjd2ZmV2bVYxMkIvY0U1OEFaLytQ?=
 =?utf-8?B?Vjg2NmJvVXJlbVBxcVFlMzFUVHBqaTlOeUNsWWh3eXA0Vjl0WEtsRDArNFVw?=
 =?utf-8?B?SVdLZkl2Y1FhM3FTNnBhVUwvcXdYd293VklQWGZZR2ZqVDQ5MVNHMEIvaHdN?=
 =?utf-8?B?WkxkalArWncxdGxKOXdVVkJWRjBRSmFvR2VRN0pWSHphUyszVXR4VVlQLzJK?=
 =?utf-8?B?QjExQ0xRYThjbVZBcytLaEw3NGJ1MFlTM2Fua2RqZGYrRzVRQkY1bEE2Nkx1?=
 =?utf-8?B?MndERk9uMWpZV1UydXZoekNmOHlhY3paMnJLeDNQQk90UkZlcE9MdVk0alNQ?=
 =?utf-8?B?K3R5Nk82QldwYW5ibVJoa1d2M1BqeXREaC91M2x0NUI1WHlBWGFRblJGNnV4?=
 =?utf-8?B?M2dvdnJvS3NIKzh3WW5WNlRaS3kwL0hZK1p1M2NKamhCTEsveDVQcnhTTi92?=
 =?utf-8?Q?+1eSuvvq3RNSvGsV0xcUiBpuKQZGQUSdU0a1l+Au+sPip?=
x-ms-exchange-antispam-messagedata-1: +Dnyauo9v47/Xg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <6655CD977CA3414881E7389F0D9964D5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jZBNCbminH8A/sR9G6jgem0IGrEkW1OlGmB4d/DosCGz4Grr86zmDtizxN7XANCcMdLqcx7SU1va7F1/z3Lelw+Z/3deZs9GkAqpNCD6WbfB3HVYd4/PAeBTxfNFevknuOssltO+gpAO4YsC/5redWYCMdEeuPbKjuh7i+JLGcIpHAhSsu3piEo6TLlSngAjYoFjHUqoREdVKB4jnjs46oCo2x8eHameciCG/daLIVCf6kFWNTViAHs+cTKZJDzg5hEjgXNXpEMp+X69bAAjhshnEbgThTAB65XXimjSyhXKEsa89HDQyA0Ru/SEsgZXNdSSxXx0/G8go36oZLbqLQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361952fa-93d3-487b-5bed-08df338862d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 17:41:37.5351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F0FIKl+Er9Fe8rWqUEc8KF4mQxAYzrz/ukQNKxoUzBpshz9M5fuoovWj3jdF2prWJrlhF9WfQfqIwosSW/Rtz3FHokJt2IDoyBq5DKLzgc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9560
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkhDQoNCk9uIE1vbiwgMjAyNi0xMC0yNiBhdCAyMTo1NSArMDUzMCwgTmFyZXNoa3VtYXIgR29s
bGFrb3RpIHdyb3RlOg0KPiBNb3ZlIHRoZSBwaW5uZWRfbGluayBlbXB0aW5lc3MgY2hlY2sgdW5k
ZXIgeGUtPnBpbm5lZC5sb2NrIHRvDQo+IHNlcmlhbGl6ZSBpdCB3aXRoIGNvbmN1cnJlbnQgcGlu
bmVkIGxpc3QgdXBkYXRlcy4NCg0KV2hhdCBpcyB0aGUgcHJvYmxlbSB0aGlzIHBhdGNoIGlzIHRy
eWluZyB0byBzb2x2ZT8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFyZXNoa3VtYXIgR29sbGFr
b3RpIDxuYXJlc2gua3VtYXIuZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9iby5jIHwgNSArKystLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBpbmRleCA0MmE2YWExYTJl
NGEuLmZmYzJmNDY3ZTQ0ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Jv
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gQEAgLTUyNiw5ICs1MjYs
MTAgQEAgc3RhdGljIHZvaWQgeGVfYm9fYWNjb3VudF91bnBpbihzdHJ1Y3QgeGVfYm8NCj4gKmJv
KQ0KPiDCoAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHhlX2JvX2RldmljZShibyk7DQo+IMKgCWJv
b2wgbGFzdF91bnBpbiA9IGJvLT50dG0ucGluX2NvdW50ID09IDE7DQo+IMKgDQo+IC0JaWYgKGxh
c3RfdW5waW4gJiYgIWxpc3RfZW1wdHkoJmJvLT5waW5uZWRfbGluaykpIHsNCg0KQ29tbW9uIGxv
Y2tsZXNzIG9wdGltaXphdGlvbj8NCg0KPiArCWlmIChsYXN0X3VucGluKSB7DQo+IMKgCQlzcGlu
X2xvY2soJnhlLT5waW5uZWQubG9jayk7DQo+IC0JCWxpc3RfZGVsX2luaXQoJmJvLT5waW5uZWRf
bGluayk7DQo+ICsJCWlmICghbGlzdF9lbXB0eSgmYm8tPnBpbm5lZF9saW5rKSkNCg0KbGlzdF9k
ZWxfaW5pdCgpIGlzIHNhZmUgb24gYW4gZW1wdHkgbGlzdD8NCg0KVGhhbmtzLA0KVGhvbWFzDQoN
Cg0KPiArCQkJbGlzdF9kZWxfaW5pdCgmYm8tPnBpbm5lZF9saW5rKTsNCj4gwqAJCXNwaW5fdW5s
b2NrKCZ4ZS0+cGlubmVkLmxvY2spOw0KPiDCoAl9DQo+IMKgDQo=
