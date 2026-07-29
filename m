Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AED3C53219
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 00:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FFD10E60A;
	Wed, 29 Jul 2026 00:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FC+LYKLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC3310E5C1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 00:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785283292; x=1816819292;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tIH+r+7pxje5nAzMFKovm8FkI7svMnzkvcZ/OgnWb48=;
 b=FC+LYKLnhRvOdgJ1UMWedHljl+9Y+NpPyErgeQVCwHm6l8QxR+5TvyII
 avSIk8QO1c2INzo2BFWOtZAP6OoRlvx/PgzMoKmVOmrkdJQdd1RUMzRdt
 G1d6QFANmJ1A9gnYkWyCg45C2g21z1XdmbJiV9fZY/wJSvfe7Cv6QS374
 o5s50K97Sk0/w/yJ0v5ZRRE05XRkRioCKoQiAdcTZoHRrIEEudTVpUJ55
 8gA1eAFMr41yi1f53MHa0q+k6P71mzV8hnBk1b7eIWi31fdUfrOjPWvT6
 LwQ3lncI/Q80ZsFsCKLE2Xtt7Gci+oXQLKD2q7kGWBNoIYtW0SID5IA6B Q==;
X-CSE-ConnectionGUID: O7XLJxKwTbeQswbyEgzNFg==
X-CSE-MsgGUID: UMmc4XZKTEC9QrZ9gkS91g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103422803"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="103422803"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 17:01:31 -0700
X-CSE-ConnectionGUID: 5VXiEfC2Q/qauZmwTQSK1g==
X-CSE-MsgGUID: I+kQy5WeRVaWCpNiMfCiSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="259916075"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 17:01:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 17:01:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 17:01:30 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 17:01:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRVpIt/KRpY2pqP/UAO2JuLpSqId1A4VwR7aRkd8vUAvGeJmeO5NNq4pOicxoT0aVOuJOaMMmLPvhOhRAhPrV7nQW1qlWLTKWLUREgH3z3qJlI3FiolkoooceRGUi76HbzbXpLOlAlprxxwtonBDtZQvRpXtUZJCR8gMttEyT57v//IVEzbrMInOEzn2rcQ6dUsSk4+zSjKzbWKx5/bq4kV1dle2Gh7pN4AKpu5D/xlVkhk14VRPbu0UKWkT44Idb8Px1PEp0oKqpAYRRREKZVpCu/hA+4UtSeBy8EBd2isCP5QEabypLgRtNuy1z8jOEuiBH1D9nnt4E51br/5kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIH+r+7pxje5nAzMFKovm8FkI7svMnzkvcZ/OgnWb48=;
 b=cCD3aDiMN9sEtgBWjoiayCGPXVsHqvqzXJhoIhX1rdIhu1S7s2NkDpAZmJDDSqYBEVu/HbZUpjNt5QHoLQNZQgkIoPXyyyJbYuSWgDoTDYAsq/HIIUaM1zISVNMOhCHFc/pb3yjBx8DfUFOD9gk8pmGEUq0CVVcpR1l49NtIr3f5MqJbeGPicba75LVcO3fdFwuD2Bktiw6GYCGXsYEWTUOomXa05hg2uwQ/wK3P4lj/ydlIc7o0VsXa/KUDPY857QcjqNzD8lTeAqAxWZRULMppmpPUIYPuN+xPEoAzPK65Zn+GTCfQelSRqEe2yaNclAeSoiseoZkXDVoLM6tGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH9PR11MB9904.namprd11.prod.outlook.com (2603:10b6:610:343::13)
 by PH8PR11MB7966.namprd11.prod.outlook.com (2603:10b6:510:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 00:01:27 +0000
Received: from CH9PR11MB9904.namprd11.prod.outlook.com
 ([fe80::44cb:c9de:97ec:baec]) by CH9PR11MB9904.namprd11.prod.outlook.com
 ([fe80::44cb:c9de:97ec:baec%6]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 00:01:27 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH v3] drm/xe/pxp: add termination on resume
Thread-Topic: [PATCH v3] drm/xe/pxp: add termination on resume
Thread-Index: AQHdGJcTvG1UWh3mVEac5dIP21Ndg7aDqZ4A
Date: Wed, 29 Jul 2026 00:01:27 +0000
Message-ID: <022017a6c1e93847a36867b4fbec508da15711a5.camel@intel.com>
References: <20260720222757.3876338-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260720222757.3876338-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH9PR11MB9904:EE_|PH8PR11MB7966:EE_
x-ms-office365-filtering-correlation-id: 8f7dadb1-8c3f-426b-bf78-08deed04896e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|22082099003|38070700021|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: aglbtzMKudo7YrE4+32VKcsu3mGX+jjy6vydRATgg1ZAXy3FAdYxgiUDNTChH9ANSuWNjFX99k0x0GCxoM4sEgghZy3fSgDCRRboc9vDdVPSTt2reQAsQ2IUG/WhXVA7lKXy8UDrm7TzG5VbjIj1ccYPJ5yAxw6J+PIjqDulSBLYyetDwMh8Vlh2m0erXimHK8p0GHkfFWN1+2C8Fo7O1rKma45zx6d6H+izcvNpN/fyJuqsRYooMdfTMYCo5ioHqdb0C7eEuwhA/DCezNM9uz85GfMhWesU93VgzqUY9ZBOYVpt9n9Iy/gmoh9FqDQrbatxn/za+C2M/JmaGaHMM6sPSuNgYLo5GplM5Rr4SeJJ7bUkdDjfL6V5Xre89yFkSwSXgLnIcLGgVoOYXEsZLHvMeSYlip7lqtGmwBoyaiOndIB0wxtfIVP1t+tZoO99cP7NeZsMjfkcWVVWMa5yfZEa8nTuWwEfApJnTry1di3z3aI9qNQGOGLuGMxjFsBI6zaacbJNKPnMn8YCLoUCv0EFpNu3Dly/RlK4vZTFtYUyLrYBwr8qdI58pqthn/HahH9o2ExvyZ+RSNlygVtj5vc9sXbT3zCIUkdMKM30DaxtmPnZuZjP8QlX/N6d3g7+eBR15XZTLswtblJ8spaBPDooRkpm5FZq9Z+CksyhKQZWnKuLpn7WuNNS69IuQsmPvf//e3i+jfbKFf0wVgCJPvS08UQ9LNSdsSS5PtGAzhc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH9PR11MB9904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VksvOHllcHQyR0RCNDBzZjRUSlZCcGhXUkFJakVpQlk3TzZQa1dsR1ovSFhp?=
 =?utf-8?B?SGxGbmg2ME82SzNhbE85UWp4SnE0OGcweFhydG1tWjBTWEx1WEY0Z1ZPTENj?=
 =?utf-8?B?NVlqK2pjTExHMDArQlNrRjV6SHZnWGFmMmNYK3BlTnNlb21LU0dmazJIU0J6?=
 =?utf-8?B?WkZSaElUNXdoY1d1cXUzV2hGUWMzS1JmeHdyM2YrVER6dElRVXY4T2c3cE9W?=
 =?utf-8?B?VjBrSC9makNhRnhrOGp5SnNtUzZQbXlkRVp2QUFUdE9DdmdXOXJXSk5pOGx2?=
 =?utf-8?B?Z3llclZ4RUJwVzVtK1pQTmJSbExZK2dNSE54OFlSWjZkdWJ6VUpTU0c2SlU2?=
 =?utf-8?B?bm05U3FJbzRhMzZWMWh1czZrTmhKQ0tRS0k5cnlsRVFZUTU5bFpHd2tGSzNj?=
 =?utf-8?B?OG8xTHc3R2dxZVd3VlY3T2ZzZVVzR3RUWXRmbW9oa3pCeVk0dzJqdjJnZWNV?=
 =?utf-8?B?bEdNdi9BN2JEQzlJUkhibkZSRDIyWm11dSt0eEJtT1M5NGo4UVh5RGNMSTBP?=
 =?utf-8?B?VjZRZzc3K1huemV3cXhraUVkSU5DZHdtbmMwUW50REx2YzBqbjM2Z05MQjFx?=
 =?utf-8?B?TCtPL3lLclBid25OaExRRTVzeFdPOGJVRDFOZStjNkQvTE5lR0tDN3k5UVlR?=
 =?utf-8?B?VVlGbDdhUmhhY3pyRzBqb1BNZkU1U04vc01pTXNEZGpJMXhyeWpBanBraEpO?=
 =?utf-8?B?Zi96TGpQNEppZEplWEQxeUVEUGhmYUVTalA0NVUwSWtzK1lhVTNUSy9zWml0?=
 =?utf-8?B?a3RhZTdDVXpTeEd0MkJRMGIyRHRTTXVXTEVNYk1UblN2ZFRYWVhETjVyN05U?=
 =?utf-8?B?NFZDOXR0T0Vocms1R2MvZ09kVGc0N08vZTRPTkIwenVzVDZsQkZpSkZ4dGVW?=
 =?utf-8?B?RjlqNDlITGpzUHk3MXk1Rng4azVXYlFXak9MbXpnQ3JqSWFtWkdGRkFGOWZo?=
 =?utf-8?B?UndhQU92cy9GdDl3Q240VWVxcC9QOGxVMHhNakdDdnVlbWlOcjJHR3l5Z3dj?=
 =?utf-8?B?SGtKM1NCZ0h4QWplNytnaEk0SjU1Q2haVDBpc0ZpVnFkZWEzanUrT25JRElt?=
 =?utf-8?B?OWcwQitoODZlTlV6cm90Uzdjb3hseEM2OGxrU0hYeFVoNVZ5bURBRzU2aE91?=
 =?utf-8?B?ZUdnNFVoT3FWMnhaZW9XU2tNYVBvWUJXbnhkaENMTVZjRm42dC9JcTBZRnBW?=
 =?utf-8?B?ZzdqajZUUkRqNzZSRWMxUUdpNlZFeFdUT2Q0RFZ0OUZ5ZHB4QWF2LzMvL3kz?=
 =?utf-8?B?MFpGclhXUnU1R1haMjdubkNSZFFWNzh2eUtuaHpxTHFheVVSdDg4b054dFpx?=
 =?utf-8?B?OWF3eWNwUm1mcVFmdHl4bzF2VnJKanhZOUErRW9EZm1BNVhtc2JyeWZsb1lQ?=
 =?utf-8?B?aElpU3RMZ3ROVUgzV1dMMGRnWGJlV3ZIS2djTUpubjNrMzVvSkhsdm5qTzMy?=
 =?utf-8?B?VE5HbUdrQ0l2U2NuT1pxWGY4WjFSSk1QL1F0MFpmaXQwU0pzbXJjc29lVnNq?=
 =?utf-8?B?eHA3b20yb2ExL3A0c055NGlFYlpMZUxDYndSdkJ4TXgxMDJ4MjFWK1lhSnNo?=
 =?utf-8?B?RWhtZUF0R1dlZVFHbndhdnJjN3YvK0hHOE5xZWF6NDgrclcyOE9tNS9HRlRy?=
 =?utf-8?B?cGY0eG1Gd3MzRDRIM3gxaXpkeHFqVFc4OW5FRmt5N3lZTHl3QndKSFUwb2pU?=
 =?utf-8?B?QlFkNFpYWXg5Z2hibkhOZW5Qa2pKc2hWYUszZ3ZRZEQ3QnlLQXI2RXlIOXNm?=
 =?utf-8?B?dWlwT084WWZWL2Y2alZnWks1NUsxOWY0UmVEcEQzRTJuMURxSDJ0WFZGdEwx?=
 =?utf-8?B?OVQ3cEtoSU1pT0R4V0dmaUVsTDJBNnI0d2lLOUFOUzRRWjlXd1plcWFFYURD?=
 =?utf-8?B?Y0gxcTRRUmpydGVlOWRyb3ZOYnFCRUx4NVBVOEtFaW1PUEpxV3BuMGJsTXh2?=
 =?utf-8?B?eDBjNzBTRW5oYWZQR3pXNUYxMG44Z0krbkFYSnpIajJoRVU5aC8wSE1Kckpi?=
 =?utf-8?B?bno3VE9XdkY4VDEwNkJlcksvUVpiOGR5ZVFnLzB0SkF2YWZaT3lpdzRJeldQ?=
 =?utf-8?B?c29XNUNiQmdVSlVyTVlwYWQyb1hHQUJZM2dPaVUxdy8yeGxFQmZ4UjZxVXNZ?=
 =?utf-8?B?cExYbmNXaG5Ka3luUElmRFFLQnV1OGt0eVNvV21tWkdiTWR6WlVibzZHNTdr?=
 =?utf-8?B?TmxaMGs5UVNKTGlYQ2EwTXlJUmdqZUtmSWp2b2dqNDVwSlFoUTdUZHBHb3Nq?=
 =?utf-8?B?aENBUTB2NVhaY21OU0l5SW5nRW51ZXBzMEJuN0hDa2RSek1FYXJyK2dDOGk0?=
 =?utf-8?B?dTZ4QmFOMGR0ci9DTmdlR01vZDVDVVpyOVhZYVVCN1pSak9saWtDQzhtNGJa?=
 =?utf-8?Q?haG6o8R0cGx9AmWxlaKU4ZIsr6d7Le1sWfKNt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <136A5D9736518A4CB60272A24800C5B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HT8YDkn1rsGgMJxpsegtE7zrbycAJLs5HlOETRb0oRZhYQ8PQmhIcsEavwHMfQqu3IfObGSuqrq10iZe4zqLlzt3ptFf1gEkkQ+YvgvZ+ABxkGfEM7Gqk+xY/Dp4KKF4f2/0EXvz5HIicG/oGC/xNHz87rfXqh0UqcpHT2osdJJTLbeAog470XV/6uILqi0x4G3x9QknwtPAYj1/3iwfx+kyvdSpAJhCMNIAPnbFH5tAPm7HkMN6GmU8NZ2lxByRUdS3p1ZWNjKeWsip7RgB8ea/TNMNjtW2Dkv5OEsAV2P8qbF1r6vQEUg3BNjuz1RmcbgA+LkUKnxV7R/A9t7irA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH9PR11MB9904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7dadb1-8c3f-426b-bf78-08deed04896e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 00:01:27.4365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64AyYJfjrqWpeRu5WoygZ7jjIhESvflOQX/0T31wwM6BqX9KQySEOBRCS21WjTHcBm1mnz8UqfWqytiTeagk7p8lVcvhVEEibpEIxrJbLdpoAWmoQIKr133x6nC/LUB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7966
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

T24gTW9uLCAyMDI2LTA3LTIwIGF0IDE1OjI3IC0wNzAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBTdXNwZW5kL3Jlc3VtZSBjYXVzZXMgdGhlIFBYUCBrZXlzIHRvIGJlY29tZSBp
bnZhbGlkLCBidXQgZG9lc24ndA0KPiBhY3R1YWxseSBraWxsIHRoZSBzZXNzaW9uLiBUaGUgZHJp
dmVyIGFsc28gZG9lc24ndCBleHBsaWNpdGx5IGtpbGwgYW5kDQo+IHJlLXN0YXJ0IHRoZSBzZXNz
aW9uIHVudGlsIGEgbmV3IFBYUCByZXF1ZXN0IGNvbWVzIGluLCB3aGljaCBtZWFucyB0aGF0DQo+
IHRoZSAiem9tYmllIiBzZXNzaW9uIGNhbiBwb3RlbnRpYWxseSBzdGljayBhcm91bmQgaWYgdGhl
cmUgYXJlIG5vIG5ldw0KPiByZXF1ZXN0cyBmcm9tIHVzZXJzcGFjZS4gV2hpbGUgdGhpcyBpcyBu
b3QgYW4gaXNzdWUgZm9yIFBYUCwgSERDUCBoYXMgYQ0KPiBuZXcgYmVoYXZpb3Igc3RhcnRpbmcg
b24gUFRMIHdoZXJlIGEgY29tbXVuaWNhdGlvbiBpcyBzZW50IHRvIEdTQyBpZiBhDQo+IHNlc3Np
b24gaXMgYWN0aXZlIGF0IHN1c3BlbmQgdGltZSAoZXZlbiBpZiBpdCBkb2Vzbid0IGhhdmUgYSB2
YWxpZCBrZXkpLA0KPiB3aGljaCBjYW4gbGVhZCB0byBkZWxheXMgaW4gdGhlIHN1c3BlbmQgZmxv
dyBpZiB3ZSBzdXNwZW5kIHdoaWxlIHRoZQ0KPiB6b21iaWUgc2Vzc2lvbiBpcyBzdGlsbCBhY3Rp
dmUuDQo+IFRvIGF2b2lkIHRoaXMsIHdlIGNhbiB0cmlnZ2VyIGEgdGVybWluYXRpb24gb24gcmVz
dW1lIGFuZCBraWxsIHRoZQ0KPiB6b21iaWUgc2Vzc2lvbiBpbW1lZGlhdGVseSwgaW5zdGVhZCBv
ZiBkZWxheWluZyB0aGUgdGVybWluYXRpb24gdG8gdGhlDQo+IA0KW3NuaXBdDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHhwLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cHhwLmMNCj4gaW5kZXggZmVhM2Q4Y2VlZGRiLi4yZmVmMjc0YTU4NWUgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcHhwLmMNCj4gQEAgLTgsNiArOCw4IEBADQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdl
ZC5oPg0KPiDCoCNpbmNsdWRlIDx1YXBpL2RybS94ZV9kcm0uaD4NCj4gwqANCj4gKyNpbmNsdWRl
IDxsaW51eC9kZXZpY2UuaD4NCj4gKw0KPiDCoCNpbmNsdWRlICJ4ZV9iby5oIg0KPiDCoCNpbmNs
dWRlICJ4ZV9ib190eXBlcy5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9kZXZpY2VfdHlwZXMuaCINCj4g
QEAgLTE3NCwxNiArMTc2LDkgQEAgc3RhdGljIHZvaWQgbWFya190ZXJtaW5hdGlvbl9pbl9wcm9n
cmVzcyhzdHJ1Y3QgeGVfcHhwICpweHApDQo+IMKgIHB4cC0+c3RhdHVzID0gWEVfUFhQX1RFUk1J
TkFUSU9OX0lOX1BST0dSRVNTOw0KPiDCoH0NCj4gwqANCj4gLXN0YXRpYyB2b2lkIHB4cF90ZXJt
aW5hdGUoc3RydWN0IHhlX3B4cCAqcHhwKQ0KPiArc3RhdGljIGJvb2wgcHhwX3ByZXBfZm9yX3Rl
cm1pbmF0aW9uKHN0cnVjdCB4ZV9weHAgKnB4cCkNCj4gwqB7DQo+IC0gaW50IHJldCA9IDA7DQo+
IC0gc3RydWN0IHhlX2RldmljZSAqeGUgPSBweHAtPnhlOw0KPiAtDQo+IC0gaWYgKCF3YWl0X2Zv
cl9jb21wbGV0aW9uX3RpbWVvdXQoJnB4cC0+YWN0aXZhdGlvbiwNCj4gLSBtc2Vjc190b19qaWZm
aWVzKFBYUF9BQ1RJVkFUSU9OX1RJTUVPVVRfTVMpKSkNCj4gLSBkcm1fZXJyKCZ4ZS0+ZHJtLCAi
ZmFpbGVkIHRvIHdhaXQgZm9yIFBYUCBzdGFydCBiZWZvcmUgdGVybWluYXRpb25cbiIpOw0KPiAt
DQo+IC0gbXV0ZXhfbG9jaygmcHhwLT5tdXRleCk7DQo+ICsgbG9ja2RlcF9hc3NlcnRfaGVsZCgm
cHhwLT5tdXRleCk7DQo+IMKgDQo+IMKgIGlmIChweHAtPnN0YXR1cyA9PSBYRV9QWFBfQUNUSVZF
KQ0KPiDCoCBweHAtPmtleV9pbnN0YW5jZSsrOw0KPiBAQCAtMTkyLDEwICsxODcsOCBAQCBzdGF0
aWMgdm9pZCBweHBfdGVybWluYXRlKHN0cnVjdCB4ZV9weHAgKnB4cCkNCj4gwqAgKiB3ZSdsbCBt
YXJrIHRoZSBzdGF0dXMgYXMgbmVlZGluZyB0ZXJtaW5hdGlvbiBvbiByZXN1bWUsIHNvIG5vIG5l
ZWQgdG8NCj4gwqAgKiBlbWl0IGEgdGVybWluYXRpb24gbm93Lg0KPiDCoCAqLw0KPiAtIGlmIChw
eHAtPnN0YXR1cyA9PSBYRV9QWFBfU1VTUEVOREVEKSB7DQo+IC0gbXV0ZXhfdW5sb2NrKCZweHAt
Pm11dGV4KTsNCj4gLSByZXR1cm47DQo+IC0gfQ0KPiArIGlmIChweHAtPnN0YXR1cyA9PSBYRV9Q
WFBfU1VTUEVOREVEKQ0KPiArIHJldHVybiBmYWxzZTsNCmFsYW46IGluIHhlX3B4cF9wbV9yZXN1
bWUsIHdlIGFzc2VydCAicHhwLT5zdGF0dXMgPT0gWEVfUFhQX1NVU1BFTkRFRCIgYmVmb3JlIGNh
bGxpbmcNCnByZXBfZm9yX3Rlcm1pbmF0aW9uLi4uIHRoaXMgYXNzZXJ0aW9uIHdpbGwgbW9zdGx5
IGJlIHRydWUgKGkuZS4gd2UgZGlkIHN1Y2Nlc3NmdWxseQ0KZ28gaW50byBzdXNwZW5kIGJlZm9y
ZSBleGVjdXRpbmcgdGhlIHJlc3VtZSBjb2RlKS4gSW4gdGhhdCBjYXNlLCBhYm92ZSBjaGVjayB3
aWxsIGFsd2F5cw0KcmV0dXJuIGZhbHNlIChpLmUuIHRoZSB3b3JrZXIgd2lsbCBub3QgZ2V0IGZp
cmVkKS4gaSBhbSBvbmx5IGd1ZXNzaW5nLCBidXQgcGVyaGFwcw0KYWJvdmUgY2hlY2sgKGZyb20g
b3JpZ2luYWwgcHhwX3Rlcm1pbmF0ZSkgd2FzIG1lYW50IHRvIGRlYWwgd2l0aCB0aGUgY2FzZSBv
ZiBhbiBpbmNvbWluZw0KdGVybWluYXRpb24gSVJRIHdoaWxlIHdlIGFyZSBpbiB0aGUgbWlkc3Qg
b2Ygc3VzcGVuZGluZz8gKGkuZS4gd2UganVzdCBkZWZlciB0aGUgdGVybWluYXRpb24NCmNvZGUp
LiBCdXQgZm9yIHRlcm1pbmF0ZS1wcmVwLCBpIGd1ZXNzIHdlIHNob3VsZCBub3QgY2hlY2sgdGhp
cz8gd291bGQganVzdCByZW1vdmluZyB0aGlzIHdvcmsNCmZpbmUgc2luY2UgdGhpcyBwYXRjaCBh
ZGRzICJQWFBfVEVSTUlOQVRJT05fUkVRVUVTVF9PTl9SRVNVTUUiIGludG8gcHhwLT5ldmVudHMu
cGVuZGluZw0KYW5kIHlvdSBoYW5kbGUgdGhpcyBpbiB0aGUgZXZlbnQtd29ya2VyIG5vdyAoaS5l
LiBpZiBpdCBpcyBhIEhXIElSUSwgdSBkcm9wIGl0IGlmIHdlDQpqdXN0IHN0YXJ0ZWQgc3VzcGVu
ZGluZyBhbmQgcHJvY2VlZCB3aXRoIHRoZSBuZXcgc3VzcGVuZC1wcmVwLT5yZXN1bWUtYWN0dWFs
IHRlcm1pbmF0aW9uLg0KPiANCltzbmlwXQ0KDQoNCg==
