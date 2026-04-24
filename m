Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03713FED3F0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 16:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FF410F642;
	Fri, 24 Apr 2026 16:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5UwciaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A0810F627
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777049253; x=1808585253;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jzwBtExyBFv8f5zqu/61Ufhy2ATJKcOyEuePeGe8640=;
 b=n5UwciaMrAdSsEgGvBHvHC8W9NeuMFVO2WI4dgZmOFn4M+drzFPakfsG
 cU0aWK9PmuvdbXX9+u65+svWyck+X0qB5f3ycdmIx2A71+Siw8fV31ArS
 GPoJfjInSqQ79RShItdHnP6GxDbX7iVMBFnIuEePOCpkmwjOTtqTlpx6T
 JsOcLeczTR8phTDpGEJH6Mw/y6NxhqE5sZfLE7hlomkHFR90mqvFQQF8X
 RWkW1d/sVSnmTfw08WDb80bI8tFAjZMJSxXWEJIQTIBOrA/Vybo1w8z6M
 6ZumeM1LMDK/GIyj9NSr7keNSlweioIhgUMehjQg6QIJhYxxsUPF9PQ5B Q==;
X-CSE-ConnectionGUID: 5QGyQBmoRfC4buAmhGZ/PQ==
X-CSE-MsgGUID: hdjubLvvTdewhx0Ls7W/EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="89497044"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="89497044"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 09:47:33 -0700
X-CSE-ConnectionGUID: /f+3jTg+SDWCXWs3+RNr2Q==
X-CSE-MsgGUID: 9tU8ohy8TfyHkMI9nTNPaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="234790933"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 09:47:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 09:47:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 09:47:32 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 09:47:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y21CLSEHzdrPrpHUWprxxv7KXje8CWjri6k8K7MNcXYB/jofvyEZmR1I9RbW0pzWcckhagpcuo3Rd/gjzktGhAQyKaKJS2MLHBul+8WwAQEQWUaPZgOr0h6FgQYiAnA+O6AUj+IIC3+XeyERHCJY7tAHiZpy/ECkZ6P+OV/MI4UIJTvjFVvx2YgaEKghpxd8HPU/KH9EqR7wgkjTtFIcMcNZamYsWDtGNYqU0biZ6fTyo+jAgp+6cBtJjfsGYVr8/aY/oibln6Vdaa/IwcyyK+IiyDaEvZbibA9JB+kW8XWiAuJuLbOsaildlUoqt4BYEdTipTmgKtxItG45CLVKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzwBtExyBFv8f5zqu/61Ufhy2ATJKcOyEuePeGe8640=;
 b=Jmv9ur1SfQjKufUokksfc9ja070mqW7qZbOITui/mF5jiMd57s9a596OIgYaE85h3n4rcp0gxU6DqOysNzhaFEjWhHqd8a6jJJka2tp4EJmXEySxvIbRAQPCttAX+C/GnIOtC3c19d/Vv0KZltjLXr0lxxsSR7qvzDKuqORDJDInRSVAAB1DcxZqE9tiTW5opuNeezyeblU0J9UWAPdAK9rQtusmdMf7mVqYFC7CcVHcN23k89f4FQIYFCoxE2uwCWHG3HQNLWStzCPiMvI2bGeZOZ6Wp2qj1COn42Ts1io7h5OimuTqrH5m4h/VV1yjnMjKJl+03W7RTM6lodJSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.14; Fri, 24 Apr
 2026 16:46:28 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 16:46:28 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 10/10] drm/xe: Mark BCS engines as belonging to the GT
 forcewake domain
Thread-Topic: [PATCH 10/10] drm/xe: Mark BCS engines as belonging to the GT
 forcewake domain
Thread-Index: AQHc03N26ysPd1M+fES0S22kJGz6tLXua/gw
Date: Fri, 24 Apr 2026 16:46:28 +0000
Message-ID: <DM4PR11MB5456890E4C1D0530B1511B21EA2B2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
 <20260423-engine-setup-v1-10-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-10-baa94014e3e5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB5873:EE_
x-ms-office365-filtering-correlation-id: 9592d291-3c7d-4bc4-494b-08dea221082d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: NgxbbeSGd4qg+8/0k4IlptKYObQggyOrZtKQef9sO43X1/8/dcupjqtAT+Ta+TamUOTR2imUu28Zb9DfWcPyjco2TcoyB/WcYdQiad398WmzeVUMW2EiP1zjuCNH/Z0vadpGuzyulpdRyk+bPCWzlYHENRbzG/btt9VXK2xn21Qkm52JPZgv252QlIybkvrbbtYj+6q9V5+07NKt20UQdOeo11cEcmaj01zWiwlGL6ZtllGt+DkzVXUJNDR/7okJCrRavydhIQIHU77wU7rl6quYcov/xcRkSskWA2ZrU0GOYH7KZzBcdokek+KiupcnRPrMu8d2EM0QtUCx+JxJfs4osQ1ZRGxAVzkN9cajXcbIzl8AaC4JqC5oqQB931oRnYJ/mrqQjdltvu7QND5HW67RYyG99fZyB48dUCpVgJh3dihssTiS41+fuCJLxmyHMFLesSElUUCnKb2yEqlQFzP6ol3K4ZUnSYisoXNYuVnmcvstzlGWm9V8zAeYvnxZqa8KgS0wudmiQ/W14yE7/51f7WXCi3rlLjn6AzjSEVEmxjfmqBcKMtFzWCBLKS1T0NTKqXCunbHIyXwr0f97rfT/oC1+CnzbKdk2ZBerklrkjhGfvaYo3lglxBhS+vw+tMK6YXluJs4TO2tR19uofXnNPjgFeLaw1Md2dHWJbK5D12/tfwjPRZ8z1GB8A+Dh4bz13/GZb3g+hZ5xFyApJz0iJE5y+ozcQWQgbbiQOl3ErDNcRLKJDz1ykvre5uyaDpvx5ziUm88VD5aQGGIMRc61U1Y9hvdGhRTgHLqgtw0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFd3NFJwS1pVT0hZNnVQQzlIaUxGRmUxTWszeEZFNW1WOC8vS0NsMG94SXhp?=
 =?utf-8?B?M0xEcE51eEdVSDBpbHo5WnNwSk9sM1pnWXRwcnJvZldUaFRVeHBsV3lLK0tG?=
 =?utf-8?B?SmkwK1BoWkN1cHg1alhkNVg5RmhwRzJlVFZZdkVidkhuSTV4VVJEalo1Nld3?=
 =?utf-8?B?U0NVY1BhWFVBcnFTREZLc1FQcWw2R0V3dlhPbnU4VE1mUUdRVmN3bmlWL0ZY?=
 =?utf-8?B?S1dGZWNuUXFDeDVPQllVeXVvNmV3TnBDcnFLUmdYVDVDbnZSSzVXdkF3VTBk?=
 =?utf-8?B?bXhqdjBnd204UGlhTEVjY3VjY09mSzJvd2xGb2xsUlBMMUJ2RUxNcmJDUWpE?=
 =?utf-8?B?bEdCS1ZMRUh0ajV6S1g2QSt5TUZJZUlNYlhrakNzMFJQOWRLQzZKd3JtR0dQ?=
 =?utf-8?B?SEhHSEpMSXhTa09ESzRTVmVUeU90dEpsV2xrMGlzZUhhYnBsdEw5WlowaWlk?=
 =?utf-8?B?OGUvWUprQXd6MWdYRFpNb3pZZHpSc2tnL1VnWjArUjdBbUpHaVhJV2l2Ti93?=
 =?utf-8?B?dThwMG4xWEdJREhPSXFkYXRXNk1YOU1VeUdmcjhuQllvOTRlNUNrMUZYR2NY?=
 =?utf-8?B?eWtVSEFTQlZrQkRqUnFxT3hRL3RzVEVobTdzdDc4Z1lHODMvUThjaUdPN1Ja?=
 =?utf-8?B?Nld2UUgxQTcrK2RRcTM5UUdmaHpKdS9RajIxai9xbldXUW55TWdGZ05tY2Za?=
 =?utf-8?B?SkhJOEFaTW9NYnlLS3VZRGwxZG9qS1FaaFE0ZFNDYlB1bDNTeGJBcjV1NlZM?=
 =?utf-8?B?cXJyREhQZEhFaC9valNubHd3TWNaVmEyYnpWeHNIcFhLemtYclBndjhycnFL?=
 =?utf-8?B?SDh5QzBOdWU2Tml4TVJpMEw1M2RLckRmVTloR3kwQTB4aTJ6OGxqM2loSHEx?=
 =?utf-8?B?Y1VOcm84OUNMREZsK0dIT29LUVpzcXFiWDJTV20zQjdMeWNvNTJEYmYwQnJt?=
 =?utf-8?B?Y1NUeUFxb0d3ZTMxWlJsSFpQWWFqQzE3NXY2ZU5tMnpQaTIwOG45THlHUURG?=
 =?utf-8?B?b0p3OEVaZWF0VGtqcm4wbmJKQXJ5Q2MwWjByMERGbWRVcFBwYlBxY2IxaklD?=
 =?utf-8?B?Rkl4NXVjRTFQeFcwK3VmQjNleHE5ZzY1ajBaSFQ2OVc2YkM3RlRCb0NQRU92?=
 =?utf-8?B?dFZzL1pzbkkzWXJDbndUT1d3V3B6MVJnSnVXUnFHTzVNQ1dHbFByb2xPcnJX?=
 =?utf-8?B?cDBiWnJtNFY0UWtyZ0VMbHh3YlJIOTlyQjJaM2Z2YWQ3R2FDQTlMQVUwQitV?=
 =?utf-8?B?UHBrSGJsQ2VXcmg2MTlsdi9uVU02NTA4cGdYUGJmZGtHa2JNUjJBSzJiZ3Zy?=
 =?utf-8?B?eHNRR0w4UGtzNkZ4Y0FCVDNBeEFLNDN2N3lXeHl1L0kvd3VnakE4OEprVG5I?=
 =?utf-8?B?Z0NzTUErekcwb0l5amlTME5DTE0vNm9qYXdBdFQ5OWJQb2tzMGYwenJtSlBG?=
 =?utf-8?B?Q3JhbklieFg4RFZyZlA4UE96dnpIODVNdHNMdzZ1N09HV1FEV3daRnBNa0dJ?=
 =?utf-8?B?bXNCNzloNnRSSFpQcTBEdlRGcjE5MUR4L2gyNURtdXdOUEdOSUFacnRWaXVI?=
 =?utf-8?B?TkYxVlNBRVdVY2FWRnJDZThsdmdKWisyREswMkhWZnJlR3A3S3Y1UVpyUGta?=
 =?utf-8?B?MnIyVDMzL0YvbGhHMVhuYUtpcXpld3V4WG9FUW1mSC9wQkl3aU9hUGRRWnp1?=
 =?utf-8?B?d3Zoa2NKREt2VHd6bVZYZ0RveDF2YWNHVGlTcmtPMC9SQWdMQ24zQk9RQ2Fj?=
 =?utf-8?B?Yld1V3NURjh0K0I4OUMzeURSOUlUK0xmWUZ4bzBPeGxZRFNCUTgvN1ltV2NJ?=
 =?utf-8?B?a053aDRGcUljZURjN1B3NHY4bFh3QUtpM2ZVTmt5R2lTYkRtLytWTEEyRzRC?=
 =?utf-8?B?dEk2L3phdENvK3dVaWZsM2pnR2E5QlJ4UUpXRU1xbkc0T0ZtTXJzeU0ydDFF?=
 =?utf-8?B?alJSU2xJcndDZWprNSsrMnF0amJibnlNWS9wOUJIWm43UVdCeUdzekU0Z0lj?=
 =?utf-8?B?dUpwR2ZqOTJHR3VYRngvaGEwSm5oWExWZlNiSERPdldUZDVmRWJSaXJHamN4?=
 =?utf-8?B?c1RYMnc0ZnYyTDlYT3RNSlNWcWtWTGkxd3gxa3B3a0tmVkV1NU9PZDF6TnRa?=
 =?utf-8?B?djZmRXVJdmh3dFp0RWo5NEJiWkt0NWRLYmJQd0hsOW5qTU5jclVZb24vVURx?=
 =?utf-8?B?azc3ZUJtS0FycVJIVGpXLzB1dmZhZC9NTTFRMitkR0kvT2FqSHlJZmhPc0RP?=
 =?utf-8?B?Mld0QUxTS09McWg2aFlxSTJYRUJUOWgySXFqT0t5SWhvWEh3aVIrczUzeTlE?=
 =?utf-8?B?ZEhURHVRZVVmdkxLdS9FdmNXMEFPSmhaTGlVUmJuNlNGdVQ5YTRCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QDXVTTDB6CNFgprS8Fdk4A1VQ4Drf4El+pqqRODesr82CIZFsYUFyEIEDiRiz7G8eXCc4wGsM5us0HSArM27kb0MQEC5IAZXS16eDf5tdnd/U+JwcAGxfeyuMIynKXF/ZMEnuY1xH7+xTHLeFIDTqboGZuacWxPGwdayY29xZ1t6Wjq5yW2/LILfWp21AZpncU4k0LvCvwdQ/CGVotx7AtNJM1HZEfZrLGS/9YjO/H+p+5j/swEiUYujGaKjcIA99TeOyvAjd/NESrHs5DUkcZwABQNvo3Rrue+3JdGD++yql0Sh0M4Oybd1tOeYPE+QKroPyDvg2aHB7XKIDYu7YQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9592d291-3c7d-4bc4-494b-08dea221082d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 16:46:28.7866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qGsTZjMqMfOH+BHaKd2cuBCYUL4tVVop3zdU+zXcLjBFCeaUuan3xUpSJxMts5sava4RRgE3ByJYo4ShZ5EkVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgMzo0OSBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBPbiBhbGwg
cGxhdGZvcm1zIHN1cHBvcnRlZCBieSB0aGUgWGUgZHJpdmVyLCBCQ1MgZW5naW5lcyBhcmUgcGFy
dCBvZiB0aGUgR1QNCj4gZm9yY2V3YWtlIGRvbWFpbiwgbm90IHRoZSBSRU5ERVIgZG9tYWluLiAg
Rml4IHRoZSBlbmdpbmUgbGlzdCBkZWZpbml0aW9uIHRvDQo+IG1hdGNoIHRoZSBzcGVjLiAgVGhp
cyBtaXN0YWtlIGRpZG4ndCByZWFsbHkgY2F1c2UgYW55IHJlYWwgcHJvYmxlbXMgYmVjYXVzZSB0
aGUNCj4gZm9yY2V3YWtlIGRvbWFpbiBoZXJlIHdhcyBvbmx5IHVzZWQgaW4gYSBjb3VwbGUgYXNz
ZXJ0aW9ucyB0aGF0IGFyZW4ndCByZWFsbHkNCj4gbmVjZXNzYXJ5IGFuZCBpbmNsdWRlZCBpbiB0
aGUgaW5mb3JtYXRpb24gZHVtcGVkIGR1cmluZyBlcnJvciBjYXB0dXJlLg0KPiANCj4gQnNwZWM6
IDY2Njk2LCA2NjUzNCwgNjc2MDksIDcxMTg1LCA3NDQxNywgNzUyNDIsIDc4Mjg2DQo+IFNpZ25l
ZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0u
DQpSZXZpZXdlZC1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo=
