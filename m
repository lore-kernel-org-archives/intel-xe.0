Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9A5C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 05:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8479D10E127;
	Fri,  4 Sep 2026 05:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXNO6G7r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9B210E127;
 Fri,  4 Sep 2026 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788501210; x=1820037210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=biRhBZftcF71mo+PGTRYqox4kphfprdN++b7xMNojyg=;
 b=EXNO6G7rYdfuD09SlFXHOAPOlAIZy14bFx3y3zF0xzz+feLb4rUAexwg
 e0XxnsZXBwc6zzz8F0+c2+G1IPGiEiVgLwQsCIwzsIlfDQfuEai1THtOM
 qyiatc6q+XeW1XAJ1yb7tCsHxgNHECwxZw0DbUzPNBmz83GEBFail9hH1
 Vfzck74dJyCD7Q125f42qJXTJQBXT4lx98Zny5ilwguZc9HHv9fz6hLTH
 tpo6LHm82eDng9zOPceXOSpNPtVmdASKQGz3uqGkn1OQQsqR5Evrqz75c
 fRigyVvSKS7OHVUeB/d1OJKSCOiHoGfJl087Xu1sYXAiI4hcipmV3GbPh g==;
X-CSE-ConnectionGUID: hkaZ4B9MT2yHELKF4MWIcg==
X-CSE-MsgGUID: jDQQ+yZiR2ukNKU062FxJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111770420"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="111770420"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 22:53:30 -0700
X-CSE-ConnectionGUID: 1o1i9TxWSBKc7bk1IRM3dQ==
X-CSE-MsgGUID: jmiJ7QKNQ4SSS1sgfFR5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="269402720"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 22:53:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 22:53:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 22:53:29 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 22:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txXrIOxIExKpmE4P+bP7T5MsRC8H1o/RcbiEa0IH3YmmrK22NEfxo5io1mghL2b4PaVav/fy2Fykrgifut/0m+OfQV1bSMigMX5v36g8h0wAvoNGY/Se4Il82m2AEaBDJOonG5Ja/PzuxrvWYNuJ23CUz6E4wUCHfqsCyspsFzYza6pyR2pG2zdAy6I8F12exP4XsiYk4ilP/uEpvqN2kcw6ub8fu+kUCn60EvNYS3IDrJQg6BuDlJG0471nEzqpdf47VM63fP19QuMm41SAkPZhLxEEBQFNjAMldmC3SBV0Z0Egeg4jR4EUA0q3ORHKrrCK/dgfIR6rr19mKnVfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biRhBZftcF71mo+PGTRYqox4kphfprdN++b7xMNojyg=;
 b=e86P4oGo9k6eM0mMgn3ml408B+DKADlIZWNh3XvkpbMw93HCJkhoS4d7yi4f8agwDuevGuv+1ixwlhHO7YMaM4XqHuwfabNcNcvUzZ/a7CByh9EHriSNyCIVatav+ACYwnuN3e0vMZCwlCwtw2+g+70n7YwU72kBhC9dZfjNew0txT2OszgCaMosamLiCwHdMMdnBiuie387un5gYNuy16/apCPGhi6amAwQGK2oZi2GGdGBAeqXit0fOmGywAA7dYPCdVR+mFIa5MTPGeTMVkxDRdyH/g0OztuI5NU8OWzySSUOKf9nX9Z+vXSKxAgz9i+07gMICsn0Ysy7xDSKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by LV0PR11MB195454.namprd11.prod.outlook.com (2603:10b6:408:3ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 05:53:26 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 05:53:26 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v1] drm/i915/display: Add command line param for DC balance
Thread-Topic: [PATCH v1] drm/i915/display: Add command line param for DC
 balance
Thread-Index: AQHdNsvGSZRRVPFRI0mXYOec3HZDkrazPtKAgAq23OA=
Date: Fri, 4 Sep 2026 05:53:26 +0000
Message-ID: <IA1PR11MB6348B33BDBECAB92F9E5F87EB2B52@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
 <23a0819e-35b9-4061-ba87-288601f9fbeb@intel.com>
In-Reply-To: <23a0819e-35b9-4061-ba87-288601f9fbeb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|LV0PR11MB195454:EE_
x-ms-office365-filtering-correlation-id: a90faecf-a568-4c45-0be4-08df0a48d68c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: KrhtZ1ihCP7ApM88T/ktLByZET7hM5/vnFculzyqkYpwb3t3esxdBhtlzv+rdLC235vnDS9OINFabNCFLGBe2UYJQ6ebPmV4qvByVn259aBfTaphNa5ypJIH7JpScARfaOArZxKg9kQePdC+awjTGSS1GQWXpywGrLnAL/F1a/FSrdLOz7TuNSPl4QQGdhksgtGrzEuNbMi+3coGdLmMjP3uEGBzI21ohgfOlNC2ibKTlqNlq5oAoewyEJ4SyJrMoK2vi2pKwCWJjfpjntlLkVoKnZmHmhcCjvzfA7p1o7b8ZWSY+VeIWcuNHbzYvYBkix6FwPZvrB09twwFxXRGl1o4lWHYPYXSOvT1y1hSY+RqUTyN7KVNRrwCI1sdO7BlviS7RoXp5Og9ejPNhLmZkW84uClSm5373e+M0NOxq/2SjQ4AGgyN7R9f6rLSkoqTs6l4gLaWF+9gmagPSwlPjTBWpJ9pULC17n73j1QOLy0Fl6aUVkUaTHCAsl5sIJYdfXKaTRz1yB2MS5zjZ2YsnF7+RAP5lXjlGb8oC78TuWGACutO0zc8Uew2YQ3KoFfzuRM2jiHjhXmailVNOFEu2oSEyLW4eVpGKhZxQvJdRp32wpeZZ0+Y1FcjXB4qmNMkgNkEz/ZSDUkfEfqywStVLiFXFE36wlb1cU6tjfj4As4UQCiHwueopP5KJuxF3GPiZJC9RpkcMKjvkEIEVstIzKE2Y5lMr+Kmq4umToTaEaw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVdwQjQxKzB6R0ZnQm5KS2dMUVlsTmdoQmJXWWtKREpLc3FteDFweUV4WGp2?=
 =?utf-8?B?bm9zQW9nVjN5aTNtY3N2Uy9kY0RvdUdpTFJ2YWs1bGorT3VKcCtyMDg1RU00?=
 =?utf-8?B?VW5KR0tpR0JYK3JrSTQyWHlTajU0ZnlVdWoxM09GWGlzMG5kbVVVLzhhS2Y4?=
 =?utf-8?B?NmtVdmhvK3pBcjd5L01qeHZzU1EwTGZCUW90UHpEbDkyUkI4UzhFRU5DbEdp?=
 =?utf-8?B?a1V3bTYxMXNTSHV6emg3UkF4S2tYR1B1QVIvR2NYOERvY1ZTRG9QcXdYNzdU?=
 =?utf-8?B?NTlaQndidmZzb2RGYWZKek9EeWh2MlNOclFza3Q5ejFlSFVWWVBSTVkwTmJI?=
 =?utf-8?B?am1YK3hvc29JVVlQaWZMUitvT0RHalBKNHcwZU5KRjFvT3JUMk5XTU9nbFo5?=
 =?utf-8?B?TzRjOG50eUxhb21McUR0TUlGSXVRbkRFbWtFbDVyMUNzc3lRTElQOUduSXg4?=
 =?utf-8?B?YTcwL0F5dURNc2dTT3ZvWURpWE1kOEc4YUFZVTR4NElNTVBnTVgxOEdzYng0?=
 =?utf-8?B?c1NCWDdOcVNVM0RDZlFoakpFdUhURkxpdDB1Z2JCRHVKWGo4WlRpWCt3QlE2?=
 =?utf-8?B?TFY5Nm8wWTRaZU5oUXRGd29mVDBPYmZMYXZqVUJmcSsxb1g4S2MyMkJjakNa?=
 =?utf-8?B?RnZYUnlJZ3lmQTZwTEROaS8rZlBERGxuOS8rcnFQN1dkMG5LREh0bTIrQ0tJ?=
 =?utf-8?B?TStuY015S2JzQkZkNGJPRGk2MkRLRUdERVM0ZEdrYTEwMGo3ZzdVdHQ1TVEr?=
 =?utf-8?B?SXUyZjRUbXA2S3EyUHRKakFkR3lDQm9sVHVEQzlqNkpjZyttcGcyeTJSTnVL?=
 =?utf-8?B?VUs4U3V1d0hxazdwY0Vxd2Frb09tQ3Y3bVhsbXI2THM2N1l6dm9uZlRnbjZr?=
 =?utf-8?B?ZENGMDJHUk5EOHpzTVN0V29qQ1B4QlpkaEJGMWVVdVR3QTNrUXZWa0xvVjg3?=
 =?utf-8?B?VzNCdHkxY2FOYzhlMHlablc5NFpaSVp6TzJ3WmtYTnBJVnc2VHBtZ1IwaGw1?=
 =?utf-8?B?MEVOWFBtamVSbE1TN1FXMmIyMlpsaFkwSytNaWhNQVJ4L1pBYnVqdEhtTzZx?=
 =?utf-8?B?dFJSRTZuWE5ZQUo3YW5ydUlyNlVaS2pIbElCVUdjS3E0Vkt4QjVYQnBUeUo5?=
 =?utf-8?B?c2NzNElzdU5SRE55TXJCemVrc0lLQ1QySllobkdKWHFmTjlUaFNEcmNKY2tR?=
 =?utf-8?B?MUw0YUxFcFArc250MXFlTjZHTlF2a3hnUC8reDhTL0VrZUx6cVdvODFEYUdo?=
 =?utf-8?B?a3JEaUk5c0FxS1BOb3VyaWl6NUNJN0xSam1aTi8rLzIzZm1MYi83b28rallP?=
 =?utf-8?B?WmdHWW1XSmtHa205WGphK2JhVFUxYWRaSDVacnhTVEdhTVd3M2g3VDRvM1hL?=
 =?utf-8?B?NnYwWnRVSmhScm5LcDV3SGI0TjJMTi9sWXBnczJ3dW5PQlJRZ1doMTA0TTFP?=
 =?utf-8?B?TWs1K2tZRVYydGFuZlFUek5oUEg5aG1aUFFXSmZiNEd5bDZTbnZnZXJ6dDZk?=
 =?utf-8?B?d3ZweHg0OUdKaWMzZTN4TXQzWFprNlpqMjJEcUxQMWFLb0VwbUw1QWt4MnJT?=
 =?utf-8?B?aGJDM3ZFNld5SC8ra0hWZUd6U0JvSTdzWVQ3UE5EVFFnWVJZM1REWGVMMk9J?=
 =?utf-8?B?K2M0dC9MTWpRTzBzV1Q0blRWNytTaHB3T25iTTNiRTJzd08vdHZ1cHYraGV1?=
 =?utf-8?B?b0RFbkd6Yk44OXozWkZNQlc0YVFqNTNva2lsRVpBaDc0OFYyMnQwM0dPNzFt?=
 =?utf-8?B?a1picHBLQnUxcGtkcU1VYlhpTnk1RW02eWdMekhUUExwQm1EM0s5bGNvVXM4?=
 =?utf-8?B?eDJ0eHlsMno4RFNjYklUQlhBeWdsaTVjN0xpWWVwbm9vQVRZVE8ySXZCb1FB?=
 =?utf-8?B?VlVya1cxbFhlRHF5ajIrOEg0cFdFbGJpSTBRTWFkS3lSdTlKWWxVMHY5dVhH?=
 =?utf-8?B?SmJsaU93Y3VEOEdUdkZsbTd5VXo5cFRXSkdHc054S0hsYTZZK3Q3YW1QdGhh?=
 =?utf-8?B?SnpoajF2cHYra0NhWkhkLzV1THpxOXBWU21lSDJERUM1NVhibDUzZXV1SDAz?=
 =?utf-8?B?TFZDbDV4SWJmaE5pQ3hidzZ4SzZHOHRVaDNDSW9SZC9lOUY2ekVzU1pTWXVB?=
 =?utf-8?B?VXk1eklUaGJJL3EvZE9pNW45K1dsbzcvWktkd2dkWGYvWk95cEVrOHU3T1E1?=
 =?utf-8?B?MWN6NThPVUV0YmcxQVVyT21ZaDNaTE1lSXJETjlHN2xmQTZUYTk1WHYwTE5D?=
 =?utf-8?B?WjQ4Q2VFUmRHL1VVZFNaRm5KeFdRUmo0UXY0UnNtY004Tm5Jb2pVOXRBenFp?=
 =?utf-8?B?UW9hUU1TVVgySFJiaUlSMkRmTXdKVzZTM094cG1yU3hCb3MvQy81aDhhcnk4?=
 =?utf-8?Q?TVj6giN+k4PtzL3Doo3V5ayqLqZWdfJKLRfA2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jk5H2ilP78sBvmNvHflg/mEwzjOuV5wggXuXfztVXLSKRtsO49UrZMnENRnHfcpiUdHeDMn/h7ypLBngpoj5nxdj7RBViI+Rgeqkh28sN93DpJb6LpJocMhrddw9aDmJtD1ZzkQpDK03dbieEuILg04LXjrFZjt+B1Y/1mMe5q1FniD7M73PHVy0BrrS4C3U3vzSlkhJpgy6NUB/HwBtD0cyXs0hgdBqyzWXFW7EiX1N33cjfycGRynLdj3iGMniZ1G9R0D8AhOF0cQ7gJJ2I9yEghaAZrdNs/vQ+4U4jaI3Wk9goaddaM0ALunOhJb7qwPJLJDXNLypy6djxFm7YA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90faecf-a568-4c45-0be4-08df0a48d68c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 05:53:26.3033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtboseP8bdfAsRjC2/kX0jnYXsse5lhL020k09tRTZ50NdPeoeIbKqi0jBZgbbu2+ft85oYhws9mPrejjqh12P8ctRpM5Y2mmWJSeQ0BOJi6IsL3Lf9+sUzhhTC/LFuz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB195454
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogMjggQXVn
dXN0IDIwMjYgMTU6NDYNCj4gVG86IEdvbGFuaSwgTWl0dWxrdW1hciBBaml0a3VtYXIgPG1pdHVs
a3VtYXIuYWppdGt1bWFyLmdvbGFuaUBpbnRlbC5jb20+Ow0KPiBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE5hdXRp
eWFsLCBBbmtpdCBLDQo+IDxhbmtpdC5rLm5hdXRpeWFsQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MV0gZHJtL2k5MTUvZGlzcGxheTogQWRkIGNvbW1hbmQgbGluZSBwYXJhbSBm
b3IgREMNCj4gYmFsYW5jZQ0KPiANCj4gDQo+IA0KPiBPbiA4LzI4LzIwMjYgMjoyMCBQTSwgTWl0
dWwgR29sYW5pIHdyb3RlOg0KPiA+IEFkZCBhIG5ldyBtb2R1bGUgcGFyYW1ldGVyICdlbmFibGVf
ZGNfYmFsYW5jZScgdG8gYWxsb3cgZW5hYmxpbmcgb3INCj4gPiBkaXNhYmxpbmcgdGhlIFZSUiBE
QyBiYWxhbmNlIGZlYXR1cmUgYXQgcnVudGltZS4gVGhlIERDIGJhbGFuY2UNCj4gPiBjb21wdXRh
dGlvbiBpbiBpbnRlbF92cnJfZGNfYmFsYW5jZV9jb21wdXRlX2NvbmZpZygpIG5vdyBob25vdXJz
IHRoaXMNCj4gPiBwYXJhbWV0ZXIsIHNvIHRoZSBmZWF0dXJlIGNhbiBiZSB0b2dnbGVkIHdpdGhv
dXQgcmVjb21waWxpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXR1bCBHb2xhbmkgPG1p
dHVsa3VtYXIuYWppdGt1bWFyLmdvbGFuaUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMgfCAzICsrKw0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3BhcmFtcy5o
IHwgMSArDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jICAg
ICAgICAgICAgfCA0ICsrKy0NCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3BhcmFtcy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMNCj4gPiBpbmRleCAyYWVkMTEwYzVi
MDkuLmVkM2FhODRjNWQ0MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMNCj4gPiBAQCAtMTIwLDYgKzEyMCw5
IEBAIGludGVsX2Rpc3BsYXlfcGFyYW1fbmFtZWRfdW5zYWZlKGVuYWJsZV9wc3IsIGludCwNCj4g
MDQwMCwNCj4gPiAgIAkiKDA9ZGlzYWJsZWQsIDE9ZW5hYmxlIHVwIHRvIFBTUjEsIDI9ZW5hYmxl
IHVwIHRvIFBTUjIpICINCj4gPiAgIAkiRGVmYXVsdDogLTEgKHVzZSBwZXItY2hpcCBkZWZhdWx0
KSIpOw0KPiA+DQo+ID4gK2ludGVsX2Rpc3BsYXlfcGFyYW1fbmFtZWRfdW5zYWZlKGVuYWJsZV9k
Y19iYWxhbmNlLCBpbnQsIDA0MDAsDQo+ID4gKwkiRW5hYmxlIERDIEJhbGFuY2UgKDA9ZGlzYWJs
ZWQsIDE9ZW5hYmxlKS4gRGVmYXVsdDogMSAodXNlIHBlci1jaGlwDQo+ID4gK2RlZmF1bHQpIik7
DQo+ID4gKw0KPiA+ICAgaW50ZWxfZGlzcGxheV9wYXJhbV9uYW1lZF91bnNhZmUoZW5hYmxlX3Bh
bmVsX3JlcGxheSwgaW50LCAwNDAwLA0KPiA+ICAgCSJFbmFibGUgUGFuZWwgUmVwbGF5ICgwPWRp
c2FibGVkLCAxPWVuYWJsZWQpLiBEZWZhdWx0OiAtMSAodXNlDQo+ID4gcGVyLWNoaXAgZGVmYXVs
dCkiKTsNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9wYXJhbXMuaA0KPiA+IGluZGV4IGI5NWVjZjcyOGRhYS4uOGMyOGMy
N2UyYzQ2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9wYXJhbXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9wYXJhbXMuaA0KPiA+IEBAIC00Niw2ICs0Niw3IEBAIHN0cnVjdCBk
cm1fcHJpbnRlcjsNCj4gPiAgIAlwYXJhbShib29sLCBlbmFibGVfZHBfbXN0LCB0cnVlLCAwNjAw
KSBcDQo+ID4gICAJcGFyYW0oaW50LCBlbmFibGVfZmJjLCAtMSwgMDYwMCkgXA0KPiA+ICAgCXBh
cmFtKGludCwgZW5hYmxlX3BzciwgLTEsIDA2MDApIFwNCj4gPiArCXBhcmFtKGludCwgZW5hYmxl
X2RjX2JhbGFuY2UsIGZhbHNlLCAwNjAwKSBcDQo+IA0KPiBZb3UgbWVhbiB0cnVlPw0KDQpZZXMg
c2hvdWxkIGJlIHRydWUgYnkgZGVmYXVsdC4gSSB3aWxsIHVwZGF0ZSBpbiBuZXh0IHJldmlzaW9u
Lg0KDQpUaGFua3MNCg0KPiANCj4gPiAgIAlwYXJhbShpbnQsIGVuYWJsZV9wYW5lbF9yZXBsYXks
IC0xLCAwNjAwKSBcDQo+ID4gICAJcGFyYW0oYm9vbCwgcHNyX3NhZmVzdF9wYXJhbXMsIGZhbHNl
LCAwNDAwKSBcDQo+ID4gICAJcGFyYW0oYm9vbCwgZW5hYmxlX3BzcjJfc2VsX2ZldGNoLCB0cnVl
LCAwNDAwKSBcIGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfdnJyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdnJy
LmMNCj4gPiBpbmRleCBlMzZkYjExNzQ0NDAuLjE2OThjNTRlMjU4YiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92cnIuYw0KPiA+IEBAIC00MzksMTAgKzQz
OSwxMiBAQCBzdGF0aWMgYm9vbCBpbnRlbF92cnJfZGNfYmFsYW5jZV9wb3NzaWJsZShjb25zdA0K
PiBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdA0KPiA+ICAgc3RhdGljIHZvaWQNCj4g
PiAgIGludGVsX3Zycl9kY19iYWxhbmNlX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9jcnRj
X3N0YXRlICpjcnRjX3N0YXRlKQ0KPiA+ICAgew0KPiA+ICsJc3RydWN0IGludGVsX2Rpc3BsYXkg
KmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGNydGNfc3RhdGUpOw0KPiA+ICAgCWludCBndWFy
ZGJhbmRfdXNlYywgYWRqdXN0bWVudF91c2VjOw0KPiA+ICAgCXN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlICphZGp1c3RlZF9tb2RlID0NCj4gPiAmY3J0Y19zdGF0ZS0+aHcuYWRqdXN0ZWRfbW9kZTsN
Cj4gPg0KPiA+IC0JaWYgKCFpbnRlbF92cnJfZGNfYmFsYW5jZV9wb3NzaWJsZShjcnRjX3N0YXRl
KSB8fCAhY3J0Y19zdGF0ZS0NCj4gPnZyci5lbmFibGUpDQo+ID4gKwlpZiAoIWludGVsX3Zycl9k
Y19iYWxhbmNlX3Bvc3NpYmxlKGNydGNfc3RhdGUpIHx8DQo+ID4gKwkgICAgIWNydGNfc3RhdGUt
PnZyci5lbmFibGUgfHwgIWRpc3BsYXktPnBhcmFtcy5lbmFibGVfZGNfYmFsYW5jZSkNCj4gPiAg
IAkJcmV0dXJuOw0KPiA+DQo+ID4gICAJY3J0Y19zdGF0ZS0+dnJyLmRjX2JhbGFuY2Uudm1heCA9
IGNydGNfc3RhdGUtPnZyci52bWF4Ow0KDQo=
