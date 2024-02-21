Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40691C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 17:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF70B10E5E2;
	Wed, 21 Feb 2024 17:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DcU21wFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9969510E5E2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708538219; x=1740074219;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=jmHCHsKFNT3NYS4CwSRiJ7iPbAsdUZBfWgB4+cxCRh0=;
 b=DcU21wFA7rRsjAIUCXbwKjqFx3TL1viaBBNlyplv0pRiUQBPF1lnObKA
 zawAM8x58Ud5ULFVeNmdL230ctjlBkyP73xJG0pxZOUnwf20ZipU50xEL
 Itd2gB7ZTWpTAtiRyExBOgxyGyFdzxWIOsoTXuwgMu9SqZExD7nbPCB5i
 I9KRinZy6B8JrRue1k1jaQapTTW/hd8HbWnxxyV7ybnTvMytYFk/1OYgS
 KpSO3lXXe+OxJHIXOq0xz+FHDrorF5DQQEbtWA55nFxvvfQPGx4UC8cXz
 s07pFmW4Mm6og6uPs0+QscxPrBGAPTQI9xH8IzqlLko9JmeVPzoh+ZPh0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2590236"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2590236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:56:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="9830995"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 09:56:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 09:56:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 09:56:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 09:56:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDFCHHQ+C53MjArm4O/KkmTzbe/QVOYHLCn44/LIwKCl83JmVw0Rv9Rpecglp/DNOwyGnmxtOyvSLFspgX7fmN10UfG1s8kZrWifCjxeFMYSc4ouHqBxUA+Ql+PyoEhF2C0+UTmC7ZAivq8kkIZN79NrI9KgeUBsVub0peZh18y1PRDTcfuc9Yy3+aRcX8Yof/9VrOWhCITMXTiPidtKKfqE+iLLYaO0Np3hGkaioy3GPNQjiEOB8xHAPWKaOU89xDVjsAud6D3VrHfrwzz2ODeN6FG+TK6TPD2+u+l0YXFEnZbuH37ivvk58ViJzR9Psfb7CK6n4eX8gCMa02Me7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmHCHsKFNT3NYS4CwSRiJ7iPbAsdUZBfWgB4+cxCRh0=;
 b=VccNpY0FDrUc/fcHu+fveMBac0MJFLw5A9I+XofoHdbao1FEhAQOVL5MD94ySoYQEnW29y5QtP8o6mAnRAvGDdt2L8zbPanlBRiNLSt/TOgLkITMkiB5o3XIQGe96TRwQAPpGVgstCmNVxhcceuaqEdJNn/fpvNH1TFB3lafzFdBApWVJFoSaom6zzR+zhCuvQz8g0mscjQ2rDGS3EGoq0QmwQDwMHVnnxD5AnsLBH1J6NZ1qQcwm+bn3hRI6h3rV0BpAe2RnjMuB+8F/v4as7qb2kTfbDhmn+yoZ0KDQ4fPnLu2MJC0uEhM0woEgDJR+S9u1m2O3DMvv2DWX27ojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 17:56:56 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 17:56:56 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v5 7/9] drm/xe: Move lrc snapshot capturing to xe_lrc.c
Thread-Topic: [PATCH v5 7/9] drm/xe: Move lrc snapshot capturing to xe_lrc.c
Thread-Index: AQHaZMo3TyNwgLk0FEae5CBCS5NZ9rEVFR+A
Date: Wed, 21 Feb 2024 17:56:56 +0000
Message-ID: <436f229b67e7120c7fd35ca100059e94837fba12.camel@intel.com>
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
 <20240221133024.898315-7-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240221133024.898315-7-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|CO1PR11MB4801:EE_
x-ms-office365-filtering-correlation-id: c05b9c0b-ff80-4150-f990-08dc33067e40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1+T8KFf8Mab/fvYVAF7JmNMp3S3aYEpUz/KkyfeZQHr6kfVH6QDuUnwYuYSEUMi25zM41J0e+7kOqsgCZVC2rQJy1BtCZs5HCdFEDwT8jPOfmwIyl3VFlgnBRjGZZQrx1jr9+mU64MEsX5Xs0prGBI7KbVnXpzy4YXbVryGaDB+TuK3dMAhklKtweZEr8ifZcKGtaZhG41b2OiSQdOlLxWGoGpriFUSP4WDJtKqL9VuXyqP6E1l5N8b+hu+lK/X7iD24yFKAo3RQdXX4e94Jp68sUPoVMryDSbLfEK3euw2e8MDgHFal3Za15XpK2UwTdWvkDCYHLiMKMh3MzTT8cN+Uch885Nvq8Mo3wn3WWMsa+7ed77HZveA5ZKcIODKmdRdTfK8ZCv00Qiy+8pKPYvyc7ydqxPVygAQlpzLLxs+ueW5/FK3DTkd9gLihu1kynC/ksnn2iRJtyD/LypaRHiyGEhxLAbb6R9+nkoykKdVeV1efGEDOHdAdPZZy2CdvxoXN1lcNfMVfLZxsqn3rvtBqPiiNHdw4jgrQhYsWnJ6grIp28RNop4LxmwkuyImIC27pH8mnhQsJw9DQjc1CyAMkhkQxInyf6pdw1YHT+4KrKDTZpVxHc6o2lbL01Qxk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjlzbFF5SDV5NDhPWTBGbVNvUEYwaXlpTHU1MlFraHNxQmZ1dU1SOWY2YWU2?=
 =?utf-8?B?K05kQjVpbFcrNnNvTWgrM2JhK0NJUHRwaXdNMWxESFRCcG90Yk1EYUNhYldJ?=
 =?utf-8?B?RmljWG8vcHovRkRoZ0JFRmlFeHBqNFNsbEtMVEs5SERhdTN4enEraXcxMlpT?=
 =?utf-8?B?Q3RqOHVTN08wdUcxYisrWFFENFgxMG9ZeW5HMGUxV04vcXVJaDJaMHJjZGU0?=
 =?utf-8?B?UmR1SWNJZXBoRkVPV09Uc2lTdGp0MHFnVVJPeHcxVHNEcHhXMWF2bWc5Smho?=
 =?utf-8?B?ZGUvVUYzSUpYUWw1aHlhRm0wSzZWTStBR1VzNkpmMVI2MWRFZmkvQVFtMzFH?=
 =?utf-8?B?a09PSUZZdlhaOXpWWXpRRkhjaE9xZlRIMHZmK2FZQ3RTV3AwaWx0MGNBOHI5?=
 =?utf-8?B?YnpCMWJpVEErSzV4N0pnTWxZRTBXMnNVNjY0eGxZNmJKY3dmM0dwY3RUV2wv?=
 =?utf-8?B?VTF5NjE2VEU1ejVxbVo0a0ZtS1NxVnNaNU1ZU2paUVhoL2gxamZSNm1FTGZF?=
 =?utf-8?B?d3doNC93RjM2eWFtTzdQMjZwcFhxNWRVU09velYydDE3Y3pPeWZtcjgzM2Qv?=
 =?utf-8?B?UldGcW13ZDFlbjVwRTh5TVVJZzluWnJnUXY4VkpyS3JRbnFXWFVYcWhlbEF1?=
 =?utf-8?B?VlphSS9pNXpUTk00b0xsaW5acFpnU3VJUUp4ZFR2a21rWnZCVWdhanFXbEY1?=
 =?utf-8?B?YjQ4NTZTZ1dubld3aXNwTjFGbEdBMUV0dFZLS0Y4NUxVUTlUUFJJVjYwZE5X?=
 =?utf-8?B?ZVNoRUIyUzhrVnNnRkFMYjVjaWFzbXFGbUJjWUhnd0NQUTQvVmtKSFhlaHZy?=
 =?utf-8?B?alNVem9DS2VqblUzNnR3VmlHL04zVmRpR3ZLS2ZVaW4yMFFxVVFjSVZ1Z2o3?=
 =?utf-8?B?M0hOZmpFd2w5a3JNT3ZPL2NZWDBaTHlQc1N2bEFSMjNyRFpyNDlvWFhUNy8x?=
 =?utf-8?B?RUV4WXF0TlhUMGFkN2xFbnBqTVVveklhYmE1ZmZQVUdhcUpMVzNCUjBSaGlz?=
 =?utf-8?B?TnlRcHg4K3FuTWcvSVo3ZGtnWnJsenB5Umo0NXZ5czhSTWtDRXowbmk5RWRr?=
 =?utf-8?B?SkFrSXE4RkFLYVlWemc2ZVNxODBnTDFpWVVoc2t1OCtXMmtKYkNLc2FXWmRK?=
 =?utf-8?B?SWx3bUd3aEIvbkdwR3RURUdCT1lHdHJRbUdoR3RLK2RGS0tKUi9udkIyWFZ6?=
 =?utf-8?B?Y2p1clpTOTk4RU5QYXBJNnJoK2VYZC9CVEh4WlUybURsUHFnYjBuVXJKODFa?=
 =?utf-8?B?UmNtUHlDaUpRZGhhNHFCUVp2aERueHJNcll5VVBGeUVMamY5NXN0aVlyeXJx?=
 =?utf-8?B?L2JwWEtXa1BqQ0VGK3h3RmU4bVJJcmJ5bGRGMWJIWFdPNTRJcnY1MTdMb05z?=
 =?utf-8?B?UnkrWXFxV2J4MGpmcTFoeXhpc2syVHdwaFRyRFBIRnVCOGYxYkZsOEVTVXVa?=
 =?utf-8?B?aDJvdmFJQm8wcm15ZDg3V3dvaHlLWk8vR0t4QTF4NmNOdVc1TUJEL2VLWkJV?=
 =?utf-8?B?MFRrWU5OUEIzWCt3MGxmRGFrSUhTM1VTQkwvV2ZEam9zcFUrQlVJMGtLZDJV?=
 =?utf-8?B?OTk5NlJMWnBwNlhvTnBlcVZKVFd3NnptUnhYQ0NiQ3JCUjI0SzNrNmFUMXhi?=
 =?utf-8?B?ZFlQSnFoQ0J5MWxiSkdiZ2k2TFZPM01sNk9qMHVlVFc0MVREM2E0bHhYQUhF?=
 =?utf-8?B?UUpSbGN0VTFXZU5tMkNqMnZ0ejN4cTlpcERaYXkwcjNWUXZOVmlCNDFqVWtU?=
 =?utf-8?B?bExQY09UN3pSUmdSNTZhc2RoUEEydHR3RHBOeEpYR0RSdWhjdU5aYTliQzVi?=
 =?utf-8?B?bE14dVJTQ1ZuUno3d2p6OXBEd2RDWmQ2TElsWGc2TmNlZ2JpQVFQSWl0RWRF?=
 =?utf-8?B?enMrK3BwMWIrdlY0aElsa1FaU3VHZXp1eFRqV2pDMC9LTlJYVEZrZk14cUhC?=
 =?utf-8?B?V0JkMFZNTEVNMTRwaWRqeFRUT0FuUU5xb2hsbXNKMUJwT3RlOE12YktDRGNF?=
 =?utf-8?B?V05ZVC9YQVhIOGxzMXFiWTUrMnErcllqYnBzbTJnc2ZkcHhZV2F0Rjdoc0lO?=
 =?utf-8?B?R0lQYmVoSnYyVWpNNFZmdjZyNXBheFBGY3c0UWtKRERZUTNKNU1wdDJmb25u?=
 =?utf-8?B?cnk0ZWdGVnhxN1hSOWdOMmRhZ3JYdldYMGlLb0VUMDkrMWJWUEZ4UHE4cjRt?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67B6EBEDF8F5EB419DA43FF39907721B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05b9c0b-ff80-4150-f990-08dc33067e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 17:56:56.0414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSR/ciPQNKQ8vAVUMoOFAbSNrVZt3RcasErOutY5/khVNZn4A5LL+xO5Ex2bvG8eVVOSreWMM7VHNTW/BknUOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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

T24gV2VkLCAyMDI0LTAyLTIxIGF0IDE0OjMwICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gVGhpcyBhbGxvd3MgdGhlIGR1bXBpbmcgb2YgSFdTUCBhbmQgSFcgQ29udGV4dCB3aXRo
b3V0IGV4cG9ydGluZyBtb3JlDQo+IGZ1bmN0aW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyAgICAgICB8IDMzICsrKysr
Ky0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdF90eXBlcy5o
IHwgMTMgKy0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jICAgICAgICAgICAg
ICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2xyYy5oICAgICAgICAgICAgICB8ICA0ICsrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xy
Y190eXBlcy5oICAgICAgICB8ICAyICsrDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlv
bnMoKyksIDM0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5j
DQo+IGluZGV4IGZmNzdiYzhkYTFiMjcuLjczNDg2ODllYzVhZWYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYw0KPiBAQCAtMTgxNCwyMSArMTgxNCwxNCBAQCB4ZV9ndWNfZXhl
Y19xdWV1ZV9zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYikNCj4gIAlz
bmFwc2hvdC0+c2NoZWRfcHJvcHMucHJlZW1wdF90aW1lb3V0X3VzID0NCj4gIAkJcS0+c2NoZWRf
cHJvcHMucHJlZW1wdF90aW1lb3V0X3VzOw0KPiAgDQo+IC0Jc25hcHNob3QtPmxyYyA9IGttYWxs
b2NfYXJyYXkocS0+d2lkdGgsIHNpemVvZihzdHJ1Y3QgbHJjX3NuYXBzaG90KSwNCj4gKwlzbmFw
c2hvdC0+bHJjID0ga21hbGxvY19hcnJheShxLT53aWR0aCwgc2l6ZW9mKHN0cnVjdCB4ZV9scmNf
c25hcHNob3QgKiksDQo+ICAJCQkJICAgICAgR0ZQX0FUT01JQyk7DQo+ICANCj4gIAlpZiAoc25h
cHNob3QtPmxyYykgew0KPiAgCQlmb3IgKGkgPSAwOyBpIDwgcS0+d2lkdGg7ICsraSkgew0KPiAg
CQkJc3RydWN0IHhlX2xyYyAqbHJjID0gcS0+bHJjICsgaTsNCj4gIA0KPiAtCQkJc25hcHNob3Qt
PmxyY1tpXS5jb250ZXh0X2Rlc2MgPQ0KPiAtCQkJCWxvd2VyXzMyX2JpdHMoeGVfbHJjX2dndHRf
YWRkcihscmMpKTsNCj4gLQkJCXNuYXBzaG90LT5scmNbaV0uaGVhZCA9IHhlX2xyY19yaW5nX2hl
YWQobHJjKTsNCj4gLQkJCXNuYXBzaG90LT5scmNbaV0udGFpbC5pbnRlcm5hbCA9IGxyYy0+cmlu
Zy50YWlsOw0KPiAtCQkJc25hcHNob3QtPmxyY1tpXS50YWlsLm1lbW9yeSA9DQo+IC0JCQkJeGVf
bHJjX3JlYWRfY3R4X3JlZyhscmMsIENUWF9SSU5HX1RBSUwpOw0KPiAtCQkJc25hcHNob3QtPmxy
Y1tpXS5zdGFydF9zZXFubyA9IHhlX2xyY19zdGFydF9zZXFubyhscmMpOw0KPiAtCQkJc25hcHNo
b3QtPmxyY1tpXS5zZXFubyA9IHhlX2xyY19zZXFubyhscmMpOw0KPiArCQkJc25hcHNob3QtPmxy
Y1tpXSA9IHhlX2xyY19zbmFwc2hvdF9jYXB0dXJlKGxyYyk7DQo+ICAJCX0NCj4gIAl9DQo+ICAN
Cj4gQEAgLTE4OTQsMTggKzE4ODcsOSBAQCB4ZV9ndWNfZXhlY19xdWV1ZV9zbmFwc2hvdF9wcmlu
dChzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVjX3F1ZXVlX3NuYXBzaG90ICpzbmFwcw0KPiAgCWRy
bV9wcmludGYocCwgIlx0UHJlZW1wdCB0aW1lb3V0OiAldSAodXMpXG4iLA0KPiAgCQkgICBzbmFw
c2hvdC0+c2NoZWRfcHJvcHMucHJlZW1wdF90aW1lb3V0X3VzKTsNCj4gIA0KPiAtCWZvciAoaSA9
IDA7IHNuYXBzaG90LT5scmMgJiYgaSA8IHNuYXBzaG90LT53aWR0aDsgKytpKSB7DQo+IC0JCWRy
bV9wcmludGYocCwgIlx0SFcgQ29udGV4dCBEZXNjOiAweCUwOHhcbiIsDQo+IC0JCQkgICBzbmFw
c2hvdC0+bHJjW2ldLmNvbnRleHRfZGVzYyk7DQo+IC0JCWRybV9wcmludGYocCwgIlx0TFJDIEhl
YWQ6IChtZW1vcnkpICV1XG4iLA0KPiAtCQkJICAgc25hcHNob3QtPmxyY1tpXS5oZWFkKTsNCj4g
LQkJZHJtX3ByaW50ZihwLCAiXHRMUkMgVGFpbDogKGludGVybmFsKSAldSwgKG1lbW9yeSkgJXVc
biIsDQo+IC0JCQkgICBzbmFwc2hvdC0+bHJjW2ldLnRhaWwuaW50ZXJuYWwsDQo+IC0JCQkgICBz
bmFwc2hvdC0+bHJjW2ldLnRhaWwubWVtb3J5KTsNCj4gLQkJZHJtX3ByaW50ZihwLCAiXHRTdGFy
dCBzZXFubzogKG1lbW9yeSkgJWRcbiIsDQo+IC0JCQkgICBzbmFwc2hvdC0+bHJjW2ldLnN0YXJ0
X3NlcW5vKTsNCj4gLQkJZHJtX3ByaW50ZihwLCAiXHRTZXFubzogKG1lbW9yeSkgJWRcbiIsIHNu
YXBzaG90LT5scmNbaV0uc2Vxbm8pOw0KPiAtCX0NCj4gKwlmb3IgKGkgPSAwOyBzbmFwc2hvdC0+
bHJjICYmIGkgPCBzbmFwc2hvdC0+d2lkdGg7ICsraSkNCj4gKwkJeGVfbHJjX3NuYXBzaG90X3By
aW50KHNuYXBzaG90LT5scmNbaV0sIHApOw0KPiArDQo+ICAJZHJtX3ByaW50ZihwLCAiXHRTY2hl
ZHVsZSBTdGF0ZTogMHgleFxuIiwgc25hcHNob3QtPnNjaGVkdWxlX3N0YXRlKTsNCj4gIAlkcm1f
cHJpbnRmKHAsICJcdEZsYWdzOiAweCVseFxuIiwgc25hcHNob3QtPmV4ZWNfcXVldWVfZmxhZ3Mp
Ow0KDQpjYW4geW91IHBsZWFzZSBwcmludCB0aGlzIGJlZm9yZSB4ZV9scmNfc25hcHNob3RfcHJp
bnQoKT8gdG8gbWFrZSB0aGUgZmlsZSBlYXNpZXIgdG8gcmVhZC4NCg0KPiAgDQo+IEBAIC0xOTMw
LDEwICsxOTE0LDE1IEBAIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X3ByaW50KHN0cnVjdCB4
ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25hcHNob3QgKnNuYXBzDQo+ICAgKi8NCj4gIHZvaWQg
eGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfZnJlZShzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVj
X3F1ZXVlX3NuYXBzaG90ICpzbmFwc2hvdCkNCj4gIHsNCj4gKwlpbnQgaTsNCj4gIAlpZiAoIXNu
YXBzaG90KQ0KPiAgCQlyZXR1cm47DQo+ICANCj4gLQlrZnJlZShzbmFwc2hvdC0+bHJjKTsNCj4g
KwlpZiAoc25hcHNob3QtPmxyYykgew0KPiArCQlmb3IgKGkgPSAwOyBpIDwgc25hcHNob3QtPndp
ZHRoOyBpKyspDQo+ICsJCQl4ZV9scmNfc25hcHNob3RfZnJlZShzbmFwc2hvdC0+bHJjW2ldKTsN
Cj4gKwkJa2ZyZWUoc25hcHNob3QtPmxyYyk7DQo+ICsJfQ0KPiAgCWtmcmVlKHNuYXBzaG90LT5w
ZW5kaW5nX2xpc3QpOw0KPiAgCWtmcmVlKHNuYXBzaG90KTsNCj4gIH0NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3N1Ym1pdF90eXBlcy5oDQo+IGluZGV4IDcyZmMwZjQyYjBhNWQuLmRjNzQ1
NmMzNDU4MzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0
X3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXRfdHlwZXMu
aA0KPiBAQCAtNjEsMTcgKzYxLDYgQEAgc3RydWN0IGd1Y19zdWJtaXRfcGFyYWxsZWxfc2NyYXRj
aCB7DQo+ICAJdTMyIHdxW1dRX1NJWkUgLyBzaXplb2YodTMyKV07DQo+ICB9Ow0KPiAgDQo+IC1z
dHJ1Y3QgbHJjX3NuYXBzaG90IHsNCj4gLQl1MzIgY29udGV4dF9kZXNjOw0KPiAtCXUzMiBoZWFk
Ow0KPiAtCXN0cnVjdCB7DQo+IC0JCXUzMiBpbnRlcm5hbDsNCj4gLQkJdTMyIG1lbW9yeTsNCj4g
LQl9IHRhaWw7DQo+IC0JdTMyIHN0YXJ0X3NlcW5vOw0KPiAtCXUzMiBzZXFubzsNCj4gLX07DQo+
IC0NCj4gIHN0cnVjdCBwZW5kaW5nX2xpc3Rfc25hcHNob3Qgew0KPiAgCXUzMiBzZXFubzsNCj4g
IAlib29sIGZlbmNlOw0KPiBAQCAtMTA5LDcgKzk4LDcgQEAgc3RydWN0IHhlX2d1Y19zdWJtaXRf
ZXhlY19xdWV1ZV9zbmFwc2hvdCB7DQo+ICAJfSBzY2hlZF9wcm9wczsNCj4gIA0KPiAgCS8qKiBA
bHJjOiBMUkMgU25hcHNob3QgKi8NCj4gLQlzdHJ1Y3QgbHJjX3NuYXBzaG90ICpscmM7DQo+ICsJ
c3RydWN0IHhlX2xyY19zbmFwc2hvdCAqKmxyYzsNCj4gIA0KPiAgCS8qKiBAc2NoZWR1bGVfc3Rh
dGU6IFNjaGVkdWxlIFN0YXRlIGF0IHRoZSBtb21lbnQgb2YgQ3Jhc2ggKi8NCj4gIAl1MzIgc2No
ZWR1bGVfc3RhdGU7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMNCj4gaW5kZXggOGM4NWU5MDIyMGRlNS4uMmZl
MDQ0ZmZhZTM4MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiBAQCAtMzEsNiArMzEsMTcgQEAN
Cj4gICNkZWZpbmUgRU5HSU5FX0NMQVNTX1NISUZUCQkJNjENCj4gICNkZWZpbmUgRU5HSU5FX0lO
U1RBTkNFX1NISUZUCQkJNDgNCj4gIA0KPiArc3RydWN0IHhlX2xyY19zbmFwc2hvdCB7DQo+ICsJ
dTMyIGNvbnRleHRfZGVzYzsNCj4gKwl1MzIgaGVhZDsNCj4gKwlzdHJ1Y3Qgew0KPiArCQl1MzIg
aW50ZXJuYWw7DQo+ICsJCXUzMiBtZW1vcnk7DQo+ICsJfSB0YWlsOw0KPiArCXUzMiBzdGFydF9z
ZXFubzsNCj4gKwl1MzIgc2Vxbm87DQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgc3RydWN0IHhlX2Rl
dmljZSAqDQo+ICBscmNfdG9feGUoc3RydWN0IHhlX2xyYyAqbHJjKQ0KPiAgew0KPiBAQCAtMTMw
OCwzICsxMzE5LDM3IEBAIHZvaWQgeGVfbHJjX2VtaXRfaHdlX3N0YXRlX2luc3RydWN0aW9ucyhz
dHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSwgc3RydWN0IHhlX2JiICpiDQo+ICAJCWJiLT5sZW4gKz0g
bnVtX2R3Ow0KPiAgCX0NCj4gIH0NCj4gKw0KPiArc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqeGVf
bHJjX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX2xyYyAqbHJjKQ0KPiArew0KPiArCXN0cnVj
dCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90ID0ga21hbGxvYyhzaXplb2YoKnNuYXBzaG90KSwg
R0ZQX0tFUk5FTCk7DQo+ICsNCj4gKwlpZiAoIXNuYXBzaG90KQ0KPiArCQlyZXR1cm4gTlVMTDsN
Cj4gKw0KPiArCXNuYXBzaG90LT5jb250ZXh0X2Rlc2MgPSBsb3dlcl8zMl9iaXRzKHhlX2xyY19n
Z3R0X2FkZHIobHJjKSk7DQo+ICsJc25hcHNob3QtPmhlYWQgPSB4ZV9scmNfcmluZ19oZWFkKGxy
Yyk7DQo+ICsJc25hcHNob3QtPnRhaWwuaW50ZXJuYWwgPSBscmMtPnJpbmcudGFpbDsNCj4gKwlz
bmFwc2hvdC0+dGFpbC5tZW1vcnkgPSB4ZV9scmNfcmVhZF9jdHhfcmVnKGxyYywgQ1RYX1JJTkdf
VEFJTCk7DQo+ICsJc25hcHNob3QtPnN0YXJ0X3NlcW5vID0geGVfbHJjX3N0YXJ0X3NlcW5vKGxy
Yyk7DQo+ICsJc25hcHNob3QtPnNlcW5vID0geGVfbHJjX3NlcW5vKGxyYyk7DQo+ICsJcmV0dXJu
IHNuYXBzaG90Ow0KPiArfQ0KPiArDQo+ICt2b2lkIHhlX2xyY19zbmFwc2hvdF9wcmludChzdHJ1
Y3QgeGVfbHJjX3NuYXBzaG90ICpzbmFwc2hvdCwgc3RydWN0IGRybV9wcmludGVyICpwKQ0KPiAr
ew0KPiArCWlmICghc25hcHNob3QpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWRybV9wcmludGYo
cCwgIlx0SFcgQ29udGV4dCBEZXNjOiAweCUwOHhcbiIsIHNuYXBzaG90LT5jb250ZXh0X2Rlc2Mp
Ow0KPiArCWRybV9wcmludGYocCwgIlx0TFJDIEhlYWQ6IChtZW1vcnkpICV1XG4iLCBzbmFwc2hv
dC0+aGVhZCk7DQo+ICsJZHJtX3ByaW50ZihwLCAiXHRMUkMgVGFpbDogKGludGVybmFsKSAldSwg
KG1lbW9yeSkgJXVcbiIsDQo+ICsJCSAgIHNuYXBzaG90LT50YWlsLmludGVybmFsLCBzbmFwc2hv
dC0+dGFpbC5tZW1vcnkpOw0KPiArCWRybV9wcmludGYocCwgIlx0U3RhcnQgc2Vxbm86IChtZW1v
cnkpICVkXG4iLCBzbmFwc2hvdC0+c3RhcnRfc2Vxbm8pOw0KPiArCWRybV9wcmludGYocCwgIlx0
U2Vxbm86IChtZW1vcnkpICVkXG4iLCBzbmFwc2hvdC0+c2Vxbm8pOw0KPiArfQ0KPiArDQo+ICt2
b2lkIHhlX2xyY19zbmFwc2hvdF9mcmVlKHN0cnVjdCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90
KQ0KPiArew0KPiArCWtmcmVlKHNuYXBzaG90KTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9scmMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiBp
bmRleCAyOGIxZDNmNDA0ZDRmLi5kNmRkNDA0NWQ2ZDdkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbHJjLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5o
DQo+IEBAIC01NSw0ICs1NSw4IEBAIHZvaWQgeGVfbHJjX2R1bXBfZGVmYXVsdChzdHJ1Y3QgZHJt
X3ByaW50ZXIgKnAsDQo+ICANCj4gIHZvaWQgeGVfbHJjX2VtaXRfaHdlX3N0YXRlX2luc3RydWN0
aW9ucyhzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSwgc3RydWN0IHhlX2JiICpiYik7DQo+ICANCj4g
K3N0cnVjdCB4ZV9scmNfc25hcHNob3QgKnhlX2xyY19zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4
ZV9scmMgKmxyYyk7DQo+ICt2b2lkIHhlX2xyY19zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfbHJj
X3NuYXBzaG90ICpzbmFwc2hvdCwgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gK3ZvaWQgeGVf
bHJjX3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNob3QpOw0KPiAr
DQo+ICAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmNfdHlw
ZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmNfdHlwZXMuaA0KPiBpbmRleCAyNGYyMGVk
NjZmZDEzLi5iNzE2ZGYwZGZiNGUzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbHJjX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyY190eXBlcy5o
DQo+IEBAIC00Myw0ICs0Myw2IEBAIHN0cnVjdCB4ZV9scmMgew0KPiAgCXN0cnVjdCB4ZV9od19m
ZW5jZV9jdHggZmVuY2VfY3R4Ow0KPiAgfTsNCj4gIA0KPiArc3RydWN0IHhlX2xyY19zbmFwc2hv
dDsNCj4gKw0KPiAgI2VuZGlmDQoNCg==
