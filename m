Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC2EC44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 11:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1910E76D;
	Tue, 21 Jul 2026 11:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcFuTiMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D38D10E74B;
 Tue, 21 Jul 2026 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784631645; x=1816167645;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qPtCOfPsAnB3lUhET0u2e6NyMHi9AJkXmNXp71mHg2A=;
 b=UcFuTiMIwegdvapNjMAo9BrCeWa3MDCGT2ULQ4yfmsHyLc1YSeitVjSh
 C427pBc0dy8GxMmOfL2JYKQsvRrKyCEK84RI+Av/fTCtDqOzDfji/GJtr
 2OIdfUS1zIhRkoZNS0/QDmBpKujH1b30fLlWtdz9g24ofrc3ecDZ9Wknh
 O4AX5haU2c3fxXTczmINWOTy8FbZadf7xvYBwJy2j4ffboLYk88+IhqAV
 aRzf54LEhZ1ZqGkO3OWZiH+5jPGEQhl2okkLE2z7j7YUQINL3bcMcGXaz
 kBQzGVQHnFO9TnZTbc1j8eGkJs+QyPQHzcynThmgV2b+3W0Uk+5ID+Ecg A==;
X-CSE-ConnectionGUID: 1nLlCydARXGy1RXuGXYUPg==
X-CSE-MsgGUID: PB9fP8MgRs2VD1ni1vs2Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="102776781"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="102776781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 04:00:45 -0700
X-CSE-ConnectionGUID: MTxe1ns3S0ybM0XGBZ9vXQ==
X-CSE-MsgGUID: Rw0L+yQDTkCjv7DgSrfBOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="255090375"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 04:00:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 04:00:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 04:00:44 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 04:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cO6TglbcSNemQpkd+av6/8ELuTZjIT39VHbF2uA85Fe+VrISrW6g7J0cuVlSzlut4jhmYqkkZyfJu5B3lrWv2AlL2lEUlgYHvnSY54ZuB9+ZoHRYuAhCPNoKoPl5ID46fWcWGpOIk6cH91KFaYUJkOVFqJH9v56yGhQJXcsVF2rdePmztSvbsWFHcvcdtU2oYacIFV2Ou0UQ72he1dJ8tO01lpLF4+M/Yerr8PgIdlSsUOWtkOmzXxIHwPE9V5E0uGoOM3rKS8Q6sgKYB+LQGotHwJrQxOyMdyCXeOI8NVQiskz7ynWRVomFRl2gcva2iRhNQpyVJUWkWSfOGCOFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPtCOfPsAnB3lUhET0u2e6NyMHi9AJkXmNXp71mHg2A=;
 b=UU65TpnECZRmt5WoQOKQEI/DK4C6YVUYA5mIVIqgLsky6a52R63CAB9B9n+nmnWjWf07Gemnx7xek2v18nEaLpt4BFB+09Gmnmql1+ovVyXNLVB3LQI31FZNjNiY14QPpD/XaUaRQrg5NX5VhhHXc8+mEw5ZVYqQC/OIFoZh0zMEw79hkdR8qbj6wiZ1QsEmq+uPXkz+dkYgyO2rj0N6oN9DGPJ6biNO7qfVqQ6H0/4TN3DpbyzCWZ7YEn2AXnuYPhAz6EJu77cVeftzoEPUdkHG+I1I7qONRUv0ceHoZz8tk0e9ZhqN2KTJUc04DAQkiIXkLD+FPdyFkNdlyX0IPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 11:00:42 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 11:00:42 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/i915/fbc: xe2_lpd+ don't require any hardcoded
 plane width limit
Thread-Topic: [PATCH 3/4] drm/i915/fbc: xe2_lpd+ don't require any hardcoded
 plane width limit
Thread-Index: AQHdFXbygQsSN1dcMEq25My4sO+tVLZ3tCKAgAAMvgCAABSHAA==
Date: Tue, 21 Jul 2026 11:00:41 +0000
Message-ID: <38582f7a3e9032a64dc9cdffec5331c84098e4ca.camel@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
 <20260716225956.555995-4-vinod.govindapillai@intel.com>
 <0206cb61e7e0a4746b1ca561ba9123ef85d097e5.camel@intel.com>
 <9f270f8a27ac8d13648ab07621fd4fe609eadf45.camel@intel.com>
In-Reply-To: <9f270f8a27ac8d13648ab07621fd4fe609eadf45.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|BN9PR11MB5307:EE_
x-ms-office365-filtering-correlation-id: a561d822-1933-46ca-d7c2-08dee7174e86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|38070700021|56012099006|11063799006|5023799004|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: FzbnIT/j6gkQhuNsXguyUBZKr2TsuPzF03LK7Q0FqQzC1jrG3/z1+8Dh0b9eRbOUMDv0ehSaKOOAdWFoSFjWydSQ2QheUkKcOlBQx/+61HutXFnR9HBJfML0h9HnKx9XzERxrbUBezanA81t4CZg5QlF4sOpkSsrYRnI3qHvASQGRUM278193VQ/WMN5Dw3YD+rcN2lk8lhr8Vu7xa8r7w94Cz5TN2znUPPkiShiF7Xg+DSKD4u378WJnNt2EkIZgYMVbH3fmYKmBfmXIT1YQb1luktCyh1hEaOwhxzbvJQlWGpfMPHpPuwClEUGkZpiZUcVEUKuN2BRK27xt3jyqTIdOyhyuZJvTD1tBJxXH1roiEz/YfQW2CFq63+uunmX+hHs65/0nrOmvQ/8Qd5rNtWQuAk1jAyCcfEZ3yEYftP6TQ/rku5H8NrdTff/dhv/dzB2kgw1jQYlwglKtWBBZAc6dVVabz5L14D7zDzJuCxgYPEI3f3vbXjkeulozx2u5VQpnhnQxN21ipehNzyfKnbb/x8vLRodHmxWJYhKshfYRh99M0eHMw3MkzvjUyh7o1gzXfC5/aDSW0IaNWFHYmTvBtG/cwJgdmz436za9IXfXv8dfredRPnEvoUBLBfRtNXeV8opMLov4q5lTqx6Nl+ZA1yDVuwA5QSbmstoDmlQeehNG/MJ/Dqt7Y3GMxOfBq/mCO7Mi20CVi+qJY0Z3LWWqpc8akaINEr6IwK0Si4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(38070700021)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk14T3AvbVoxU0RhaWYwbmNjRHl3bTJ1V2JseElsbTk1VTAxcE1aVnF5R053?=
 =?utf-8?B?WXNBcXVOdEJmYXJoYS9xYytqYUgxMnV2UWZmQkMvWTIzckZOWHlVcmlmRDY0?=
 =?utf-8?B?REZEb2ZCQVAyTUw5Y2NVT0xkUFpqVTd1c1Npdi9wK20xRXZJOG53aGJOY05w?=
 =?utf-8?B?NWpRWHVIb09NVllZNkt0bUh1dGcxSFdqeFVEVmhIZ2p1REdBckRJaGduWFhy?=
 =?utf-8?B?S1k1NjJpem5zcWswK0dsWlVGd2lBeGpFbElLbndIcWlyRjBlNXFsdWFZUzE1?=
 =?utf-8?B?cEIyNC9KYUJjOUo3YUpzb1Z6S3Ara1lCb2FWUjNEOEZZWXJlQUw1dGtuTURu?=
 =?utf-8?B?dnF6ZVorQ1NHL2pBS2g1aGpxYmRpcTZYMmRHdmpvN1JKajF1d21KTkp6VnUv?=
 =?utf-8?B?QjR1dytYVmtwdXlFUHV3OGYvMVpIMmxZejB3UXIxNlh1VEpBMlhUTmI0VUtG?=
 =?utf-8?B?QVphMGJUVVpLdFJ3MXNWdnJ1MnBmaHB3dXVIdy8zN2w2VzdtRnErdmhqb2V4?=
 =?utf-8?B?OThJWWM2dXNDRWRWSjZnQnMzNEpNTzVFMGZzQ1FSWm1aWUZOSjFPNDI1WEdq?=
 =?utf-8?B?dVZTTjhrUzdPNm1zaFdadHgvMjRnWWtCbzFtQmJtaGVDUDJSTkhlRVpXWTRL?=
 =?utf-8?B?WUc4dlJETTZQRTlEOFpvd0MycUFJSkV5UDRpODZZaFdlVGZwN2dmVkM5V0FX?=
 =?utf-8?B?K2JTTFl0dTh3VkZTQXdRT3hMQWlaTmVhRjNSM3Z3UURuWWxDNHJyNEZJQWx3?=
 =?utf-8?B?OTl3ZWlTbzEwcnowa2hzS2hzdnhnaE4xVDdmUGhGZ1BZN1doYkx2WGdObElw?=
 =?utf-8?B?WWkxcThmR2k2cWhoQncvNGVoVDh2MHIvMUhGeE9JT2NodExaUGN6c2VnQ0t2?=
 =?utf-8?B?SlVzenhjVjVSVTJkL0FRdUNkZmxXR2M5MVhpa2dHS2h2Zk5nY0JiMlNmVlJh?=
 =?utf-8?B?dVF3UE5zbzRvaExLeGVYd2NIN2dGNmR2SHkrbGpDc3BDc3V3eFYxM2cveTFx?=
 =?utf-8?B?RXl5TXducllSQlFhd1dpeWc3SmVNSFVCc1c1SUdEaTVVY1I4dTdzLzhkZU43?=
 =?utf-8?B?MEVmL1dHT1ZyOUkzZ3ZGdERNZ0s1Y2hoZTVZSUhZMlNnRjRLcitpRHVrQVJQ?=
 =?utf-8?B?NFNOVzl2T0tVSHFVcWtkL3doRlI2azdWeHpLYWNvNEdVenp1aklRL05Razg4?=
 =?utf-8?B?TFFtZUpqLzBTbXAwNzY1UGtRRWtDc3NBVzZUcTlSekg1NER5QzZyS0E2eTNp?=
 =?utf-8?B?RkR6L21ybk9MR1hwcnFUd29iTXd2Skl2a3UxYytFanJJdDN2N2Y0YkFDNEcw?=
 =?utf-8?B?L1BQNkwyeXdyelNjOWFCYUFoUzhTSUFLNFYvK2hkaW1ZNDBMelpvLzhtNExs?=
 =?utf-8?B?SXIyT2RXUnBpVWttSGp1dW9IT04wT0ZkVnBmWlRkdmNZcmtpNC9kc0ttWjJZ?=
 =?utf-8?B?ejNWYzhDOXFEUmI3SVI2TmlBU3ZkdEcwdi9uRG1WbEw5NU5UcWttbnBnRGZ4?=
 =?utf-8?B?OW5GWWtZMnpaZURmVmFnM0E0cTBhSEs4a2lqQjBVZDRUNDA3WVYyREh2OFAz?=
 =?utf-8?B?d25abkdqT3EvOTA1b3FHQ3RiWmhJd0dHeXFGZ0pHbHN5SklxR0xZT0thU1Rn?=
 =?utf-8?B?SHNnOXhUZlVUOGtNTHQ2Vmd6eGpkUUZUMld4dzkvdDg5VzN2UUNLYVVXRXpZ?=
 =?utf-8?B?ZTBKdDNnREtST0dlVnJmdFRKQjkzYldxektEa1o3MG9GUTAzUTU4WFRkaVRj?=
 =?utf-8?B?b0N5ZDdlbUFjT2lGRXh2eEVhVExmaHZaMjV5WFlPeTRwakJsZ2Vra1NJbFFw?=
 =?utf-8?B?Q0MyU1pySGcvWnd6Sk5Jb1VCK0h4WjdrWEhpN2ZnUDBhVnBsdnNidU5xTXBI?=
 =?utf-8?B?NVFRUWhkR1BzdWlFTzJxME9tdHBPanlKZ21CZ2M3RlZpeVpmN3BmMmxMVlBx?=
 =?utf-8?B?NSsyc1lEWVRkZTZTQzVDaW1tVFdUc2t2Znhnd0ZtVTY4RDV0NzRRWExGaTYv?=
 =?utf-8?B?YnZPbTlzVDhHK0VSMDJKQThtVmJXZk1iOVhsQU1IbjRXS2xWY2Z3eDUrZHJB?=
 =?utf-8?B?dVkxdlB4S1hObnhCUXRIdzlLdy9KRzB0eTkrY1pNNS92alVGdmxjUWcxaWN4?=
 =?utf-8?B?eEYvZjc5SXVhTS9TR2pwQlNuVzRoWGZuUmhDc0gvek5YaXpEZlFOWm1ReHlm?=
 =?utf-8?B?UHBmOTVSZko2cldKRVhWd0dmamt4MWNiMDAwRzR0SVN4NTdjWGhqa0RGalN6?=
 =?utf-8?B?cnlXUnk5OGZMbTdwcSs1ekZTSVZaa3R3QjhJRm5UTFRReGxvaG91L3k0LzQ1?=
 =?utf-8?B?cVFraG9NcWNTd3pTSW1VelBIejZLREtZaDZDQnhEeUJVTUtQbEVtOTBIR2pT?=
 =?utf-8?Q?alIgUvZEOELyvNeGnmOEE6c8wyArFUYY7mUF60ORtaUqv?=
x-ms-exchange-antispam-messagedata-1: CSwjnvzexKLwwiVcEQNE2h8w/eGe1vu+h5XlSEQudceZdRn/umrZklbd
Content-Type: text/plain; charset="utf-8"
Content-ID: <942DA9E45814CD43AF492B4A3240BBB0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aHOMufb6pepV8JokBMVB5cW8JozYtD/79fpGXFscApzZf8THSy+hvzwC8rUVsOQft7/a5Mn1AXhDuJYwvWN4fjItPkZ0dSy/L/wm/mx11butahgdHkrX2zzg/Uq+OcNS5Bcb6X9o9SD93jvDeFdA+XpJma/Ls+RSs3y3PdlcL9RD/dBGWYrxIlcEArBNoWrrMuIpWzXT0E+TGE6fOf+o411v4TGCZX000Zg2rOL8ADuAGzdTajw1uQxubVRxWazy+7tReC53vGfZLlMpyqZWJvhYLbVaFJncsdO4ETSxEGDNQTOJEPEU5+CmwTWn363TwT67W5WkHKaLofaBdc8lcA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a561d822-1933-46ca-d7c2-08dee7174e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 11:00:42.0879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqkaYEI6b1GhCoXD+Cm44H+G2VLcMQzueWHjjnin08eQjtmv/wsZEUduXYnGNG7vidsuiEAEuSoQ+mxMMMPC0/stK/U7VIZ8DBJBPfQqnWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
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

T24gVHVlLCAyMDI2LTA3LTIxIGF0IDEyOjQ3ICswMzAwLCBHb3ZpbmRhcGlsbGFpLCBWaW5vZCB3
cm90ZToNCj4gT24gVHVlLCAyMDI2LTA3LTIxIGF0IDA5OjAxICswMDAwLCBIb2dhbmRlciwgSm91
bmkgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDI2LTA3LTE3IGF0IDAxOjU5ICswMzAwLCBWaW5vZCBH
b3ZpbmRhcGlsbGFpIHdyb3RlOg0KPiA+ID4gSW4geGUyX2xwZCsgcGxhdGZvcm1zLCB0aGVyZSBh
cmUgbm8gcmVzdHJpY3Rpb25zIHRvIGVuYWJsZSBGQkMNCj4gPiA+IG9uIHBsYW5lcyB3aXRoIHJl
c3BlY3QgdG8gdGhlIHBsYW5lIHdpZHRoIC0gd2lkdGggY2FuIGJlIGFzIHBlcg0KPiA+ID4gdGhl
IHBsYXRmb3JtJ3MgbWF4aW11bSBzdXBwb3J0ZWQgcmVzb2x1dGlvbi4NCj4gPiANCj4gPiBJIHdv
dWxkIHN0aWNrIGluIGRpc3BsYXkgdmVyc2lvbi4gWGUyX2xwZCsgc2F5cyBub3RoaW5nIHRvIG1l
Lg0KPiANCj4gT2suDQo+ID4gDQo+ID4gPiANCj4gPiA+IEJzcGVjOiA2OTU2MA0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaQ0KPiA+ID4gPHZpbm9kLmdvdmluZGFwaWxs
YWlAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZmJjLmMgfCA5ICsrKysrKysrLQ0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gPiA+IGluZGV4IDc4MjI4YTVl
NzY1Zi4uMjBmMDJlZjkzODdhIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9mYmMuYw0KPiA+ID4gQEAgLTU5LDYgKzU5LDcgQEANCj4gPiA+IMKgI2lu
Y2x1ZGUgImludGVsX2ZiY19yZWdzLmgiDQo+ID4gPiDCoCNpbmNsdWRlICJpbnRlbF9mcm9udGJ1
ZmZlci5oIg0KPiA+ID4gwqAjaW5jbHVkZSAiaW50ZWxfcGFyZW50LmgiDQo+ID4gPiArI2luY2x1
ZGUgInNrbF91bml2ZXJzYWxfcGxhbmUuaCINCj4gPiA+IMKgDQo+ID4gPiDCoCNkZWZpbmUgZm9y
X2VhY2hfZmJjX2lkKF9fZGlzcGxheSwgX19mYmNfaWQpIFwNCj4gPiA+IMKgCWZvciAoKF9fZmJj
X2lkKSA9IElOVEVMX0ZCQ19BOyAoX19mYmNfaWQpIDwNCj4gPiA+IEk5MTVfTUFYX0ZCQ1M7DQo+
ID4gPiAoX19mYmNfaWQpKyspIFwNCj4gPiA+IEBAIC0xMzE5LDggKzEzMjAsMTQgQEAgc3RhdGlj
IHZvaWQgaW50ZWxfZmJjX21heF9wbGFuZV9zaXplKGNvbnN0DQo+ID4gPiBzdHJ1Y3QgaW50ZWxf
cGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlDQo+ID4gPiDCoAkJCQnCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgKncsIHVuc2lnbmVkDQo+ID4gPiBpbnQNCj4gPiA+ICpoKQ0KPiA+ID4gwqB7DQo+ID4gPiDC
oAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9DQo+ID4gPiB0b19pbnRlbF9kaXNwbGF5
KHBsYW5lX3N0YXRlKTsNCj4gPiA+ICsJc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSA9IHRvX2lu
dGVsX3BsYW5lKHBsYW5lX3N0YXRlLQ0KPiA+ID4gPiB1YXBpLnBsYW5lKTsNCj4gPiA+ICsJY29u
c3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFuZV9zdGF0ZS0+aHcuZmI7DQo+ID4g
PiArCXVuc2lnbmVkIGludCByb3RhdGlvbiA9IHBsYW5lX3N0YXRlLT5ody5yb3RhdGlvbjsNCj4g
PiA+IMKgDQo+ID4gPiAtCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAxMCkgew0KPiA+ID4g
KwlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMjApIHsNCj4gPiA+ICsJCSp3ID0gaW50ZWxf
cGxhbmVfbWF4X3dpZHRoKHBsYW5lLCBmYiwgMCwNCj4gPiA+IHJvdGF0aW9uKTsNCj4gPiA+ICsJ
CSpoID0gNDA5NjsNCj4gPiANCj4gPiBCc3BlYyBzYXlzIDQwODguDQo+IA0KPiBZZWFoLiBJIGhh
ZCB0aGUgc2FtZSBxdWVzdGlvbi4gQWNjb3JkaW5nIHRvIEhBUywgdGhlc2UgbGluZXMgbGltaXRz
DQo+IGV4aXN0cyBiZWNhdXNlIG9mIG51bWJlciBvZiBiaXRzIGFsbG9jYXRlZCB0byBhIGZhY3Rv
ciB0cmFja2VkIGJ5IHRoZQ0KPiBody7CoA0KPiANCj4gQW5kIHdoeSBJIGtlcHQsIHRoZSBsaW5l
cyBhcyA0MDk2LCBiZWNhdXNlIG9mIHRoZSBoaXN0b3J5IG9mIHRoYXQNCj4gdmFsdWUNCj4gYmVp
bmcgdXNlZCBpbiBvdGhlciBwbGF0Zm9ybXMgZXZlbiB0aG91Z2ggYnNwZWMgaGFzIDQwODguIFRo
aXMNCj4gc3BlY2lmaWMNCj4gcGF0Y2ggaXMgbWFpbmx5IGFib3V0IHRoZSBob3Jpem9udGFsIHNp
emUsIEZCQyBjYW4gbm93IHN1cHBvcnQgdXAgdG8NCj4gdGhlIG1heGltdW0gd2lkdGggYSBwbGF0
Zm9ybSBzdXBwb3J0cy4gVGhlIHZlcnRpY2FsIGxpbmVzIHJlc3RyaWN0aW9uDQo+IHN0aWxsIGhv
bGRzIGFzIGluIHRoZSBwcmV2aW91cyBwbGF0Zm9ybXMuIEhpc3RvcmljYWxseSBpdCBoYXMgYmVl
bg0KPiBzZXQNCj4gYXQgNDA5NiBpbiB0aGUgZHJpdmVyLiBTbyBJIGRpZG4ndCB3YW50IHRvIGNo
YW5nZSB0aGF0LiBNeQ0KPiBhc3N1bXB0aW9uLA0KPiB3aHkgaXQgd2FzIGtlcHQgbGlrZSB0aGF0
IGluIHRoZSBkcml2ZXIgY291bGQgYmUgdGhhdCwgdGhpcyBpcyB0aGUNCj4gbGluZXMgRkJDIGNh
biBjb21wcmVzcywgYmV5b25kIHRoYXQgbGluZXMgd29udCBiZSBjb21wcmVzc2VkIGJ1dA0KDQp3
ZWxsLS0gSSBqdXN0IG5vdGljZWQgYSBtaXN0YWtlIGluIG15IHJlc3BvbnNlLi4uIEZCQyBjYW4g
Y29tcHJlc3Mgb25seQ0KMjU2MCBsaW5lcy4gQmV5b25kIHRoYXQgbGluZXMgcmVtYWluIHVuY29t
cHJlc3NlZCBidXQgRkJDIGlzIHN0aWxsDQp1c2VmdWwgZm9yIHdpZHRoKjI1NjAgcGFydC4NCg0K
PiBzdGlsbA0KPiBGQkMgaXMgdXNlZnVsLiBPdGhlcndpc2Ugd2UgbWlnaHQgYmUgcmVmdXNpbmcg
dG8gZW5hYmxlIEZCQyBpbg0KPiBjb21tb25seQ0KPiB1c2VkIG1vZGVzLiBCYXNpY2FsbHkgSSBq
dXN0IHN0aWNrIHRvIHRoZSBoaXN0b3JpYyB2YWx1ZSBiZWluZyB1c2VkLg0KPiANCj4gQlINCj4g
Vmlub2QgDQo+IA0KPiA+IA0KPiA+IEJSLA0KPiA+IEpvdW5pIEjDtmdhbmRlcg0KPiA+IA0KPiA+
ID4gKwl9IGVsc2UgaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDEwKSB7DQo+ID4gPiDCoAkJ
KncgPSA1MTIwOw0KPiA+ID4gwqAJCSpoID0gNDA5NjsNCj4gPiA+IMKgCX0gZWxzZSBpZiAoRElT
UExBWV9WRVIoZGlzcGxheSkgPj0gOCB8fCBkaXNwbGF5LQ0KPiA+ID4gPiBwbGF0Zm9ybS5oYXN3
ZWxsKSB7DQo+ID4gDQo+IA0KDQo=
