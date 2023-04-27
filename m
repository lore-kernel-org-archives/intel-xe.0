Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C249C77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 18:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A4110E396;
	Thu, 27 Apr 2023 18:55:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A501110EBBD
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 18:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682621716; x=1714157716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G9iqm6lC2OjJG3DMtTrt7rakeqpwSccR++k59Q/ceDE=;
 b=J+VkJmOci0r2wc6qsMTLoCTQSmNLQchPQ0QNfp1SqRkoP9mZuM5wTJAF
 ink/Q5vPi4JMlRunuB/1VSZpqngMVn6gsq9xAFpi646Tqi5YBIBrP60TZ
 Y9E3ye7/tBahXWxHkejhWF9E/FceXhimu/wNiZp0yxy90Veu+usIBrIhK
 6i4N4EnOWfosgJ3x5uZbRs4oh0grkdvgWWzu7uCfaWbojWn1rGpRZm/8w
 kO5Rh8CyuqKC55+RTmx/lxNuLUfgAFQFep+/IahEvwt5MveC2ZijLuNuh
 RV/SjuUQkcheNfC4RVFz8DsaJvOqHxa8AChmpGjpxOkfLY80Cq3qU72+r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336531295"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="336531295"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 11:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="688534282"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="688534282"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 27 Apr 2023 11:53:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 11:53:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 11:53:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 11:53:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 11:53:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHfo7J1HJHLk1gc8HXwcPqcylKd980VxAt/vs6YG41336X3GMeYy+4q+qRluEEWMl6ebNwKw3VvMwmCcGY65B7nbLG36tVc9CpIbg+4OmVkzEV/fNrsYcEwwn6LTfCn+z0keEvYX0ekqCjFePArj4jVNysZlF6fEyK7LW7GOmyrD8md0LcwK1cvBs7rqo4tYg//hstGqSCz1MiyGp1dKGN+xj/j/YOhkVmXXOwX1buTAwxGPo0tOjRfzBR7pWxFesNIyZbBPcoTNiQcvvdQs8aM2YBijmv3JC35rgrhzTp+rEYR5oj09PKHJc2uf4siAtzP8/BigiTfc6bJC87zDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9iqm6lC2OjJG3DMtTrt7rakeqpwSccR++k59Q/ceDE=;
 b=KbEJdRFcnxIvN5wvVTKyz5sfLyhElBfjUWsZapEv4gCnK/Skb82eAein4MhXxJoP6cDU7rBibjKyh+XGPkHliT6V/y3k0PFbrgnWOkONpsPbVremkmebqHU/LM28HuYSuX6/uC84jrFCjsKkIi3VrafTk+LoKAZEfIhR3zWqULfk6ssiSPO2m9kg/uGgagsyt/opiclOJGtAJ+Agp5pFuGPufmCakH7kc1HRd0llqmdnrmbQPveLKLu8pM7/CzfcBxDAN1nsOnJVahOo6SZD15pfZH/CjgVrlAVphI71H6F/u5j6DHuURxJu8e6BdsOgJUWU8XjFD+zAqiym38MELg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Thu, 27 Apr
 2023 18:53:15 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6340.021; Thu, 27 Apr 2023
 18:53:15 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Fix media detection for pre-GMD_ID
 platforms
Thread-Index: AQHZeThcydNUTm25+UmIMKlAJmshha8/gJUA
Date: Thu, 27 Apr 2023 18:53:14 +0000
Message-ID: <aefebbc38f67223c6124ca74e8761c45f6cef605.camel@intel.com>
References: <20230427184408.1340988-1-lucas.demarchi@intel.com>
In-Reply-To: <20230427184408.1340988-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6836:EE_
x-ms-office365-filtering-correlation-id: f3e4ec36-9d1a-4c34-7d62-08db4750a824
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sXLkYsvzatCqvgjrMDzWM9LDo77E2qn8tyNWjk2U27GvE78QRHAM1HZlRnBA7yDC/xappLNqtj1tuT6YyIYes8okHTgOw63DayVE82JpOyfoqioQUHPZsDt2Nu5wwccSCSjaO+YLgHfYxSLY0voQFZ9UhYCeXgic1CJNsWKVZai5MM5rrq4E9zp4PTlsjQ243L1w9b7QXVeKKmV41pbU5gH+tYKOr/LzKXXoTTs5Az+HO1c5RIxAcz6toKtuEKFmCJwON5TOBKqF5Vwejm03AZEUZQHH2qxdNkf2oV0dPMQ9QS49IPw5WVRCyfeT6sfObLtMiILZbtGc9UdbHvRVhwY62crozeTtRoMirfxd6gQfwTATQLtRFFUsJqFXKymzg+tteJ1Py6ueUUpGs8BdIwQGyGGRnlMerGSkWoAt4IKWcLMAsAhmjkpWqZkH2qoX7Xg1WUS3Uu5OC2p7Ifa/9ogXv54zQ0ZSaAml1RnmOpFs5s/yDxFLwrGEQ1fTxkg30C4DmeL9Yl/yBDKqAGhbhp6Q0yTWkxDds+6wA7kZveudWLBUjLzwDrE6xoY0wG0dvwFLo3G2OVc7R2YHf+Te8u5u5QYsL7kEAFZxQ4deeUwQHp58VBHtHlC8ItUn7WhO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(110136005)(36756003)(82960400001)(38100700002)(8936002)(122000001)(8676002)(38070700005)(316002)(66946007)(41300700001)(6636002)(64756008)(4326008)(2906002)(86362001)(66446008)(107886003)(91956017)(6506007)(76116006)(66476007)(2616005)(83380400001)(71200400001)(186003)(66556008)(26005)(6512007)(478600001)(6486002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTUrdWJUOHF3R3d0OXNQL1NkS1RsQlFpSUNwQXZmYlFZbTNYb2xiVFpSK1lq?=
 =?utf-8?B?a1MxTzlXREtBU2I4MmcxRmhEZXBlSEdqcjZrSmF5dlAwKzI2ODNjak9qSmhy?=
 =?utf-8?B?Mkd0OUREaXFMaE9oR1hnSWdCRWlTK3EyZFVHWTkvdlN1QWw0ZWc0YjFRbUhx?=
 =?utf-8?B?ek8zRzl0Yk9jb01ic2ZwdklHek0xYTZ1Mm9VVnp6NjcwNUdSVjBMa3JvSEV6?=
 =?utf-8?B?VlV4K250WlUxN3dFTVRidGs5RkxwWGhQcytRb0w4VXRYdXdYRER1NTBKcXNK?=
 =?utf-8?B?LzhHOXdIQ1pmMHBBVi9tNW9lbEpPUFpIcjZ5M1FPb0NOOVowRnFrK2lIY3JG?=
 =?utf-8?B?TUhWZkxlbWJLLzlTakxXR3RYUy9CaWpBRDhKazNwTzNobUNSbXl2VG11UlpN?=
 =?utf-8?B?aGwyM3ZEWGZJc2ZjSElJd3N5VWQrcEZhY1d5eGpoWVY2aUNEaWMySm5scEM2?=
 =?utf-8?B?SkxCaE1MOHRySzZ0SmtxSlc3RnJvRVBVNVNybytrSVJwUG1FbzNFL0tEYWF5?=
 =?utf-8?B?VEVjUGZva0U2NDVrMGZKZDBxWGQ1bithZDVyWnBvaTNiR2NaRVh3SGpidGZn?=
 =?utf-8?B?a0VUVHFpQXNmMHBxcllqMDN4UTc5S0JHSWRnVXI1N0tEbUk0VlFPVVpVMlZz?=
 =?utf-8?B?Q2VKZ0c2NkVHTHd0a1krdzlmaGhtS3FTUEd4WVZwSWxUamR5ajlYdDl1KytS?=
 =?utf-8?B?VnNMVTlEYWdwZE9BQjd1Q2RZTER4SFdRd0ZlZWNvUUtJem9yU3VCM1dWQjJn?=
 =?utf-8?B?Qk1RelVQc2Z2ZFBFVFZmTnU0TldudUM2TklFazVIZHNKMnkyb0p5MW9JdTVp?=
 =?utf-8?B?RzJWZ0VmTVlNSXdYOGlIY3VBbm05ZGFyTmpXeGR0NGNJRy8wYXFrVXh0bkZk?=
 =?utf-8?B?eVdydlIwZjUyazdtb1pCUnhzdUpsSHFUbXl6c2VtU3hUM2Z4WU9HNWJlQ2Vn?=
 =?utf-8?B?dDErNjA3cHVTUXh4a2w0RVplU0ZGYzlVa05ucFBrcEtVWEF0SUppdWMybW9j?=
 =?utf-8?B?VENnMDQzOThJdkZCSUhZRGFKRUcvZlZhWktKbGdJTWQ3SlVWaVA2Q3p3UFJM?=
 =?utf-8?B?blV2bU8xLys0aG5sbW9uV20vWExtWDZ1bHN6Mi9rK1ZnRDkvbG56N1JTSHZN?=
 =?utf-8?B?dVlRMnRUOGk3M0ZvOS9zL3BIRFNGTzNEaURpL1RrVVdodmNrNGtsTEdiOXVB?=
 =?utf-8?B?SFVxV1BiMlJJZkd1ckhvVEtNTHFLejREbzk1V0xxclRZcFJ4TDhUZjhBb3JX?=
 =?utf-8?B?aklYSktmMkU5TmlZT05xU3ROWU51dzhUMXBoWDh4QXNMOUxKOXpTbE1yZWtp?=
 =?utf-8?B?bkJFMW0xYmtzNnEvc01HUXB1UlUvTmNCVHJvMEdNODBJVGZPbk9JTDlKVlRE?=
 =?utf-8?B?KzRHMFBib2NJNm5MNzBiMXk2VGdwRFdyTVFrbVlDN1ZxU2duMUFjWXhvdHg4?=
 =?utf-8?B?TUtiZUtxTkRXSnZHdmZkSlVXdjlXdjBnVHFmV3JmeTRyQkFFMEtscndkRjk4?=
 =?utf-8?B?Wnhzc25aRG9oTTQxNTYxZ1VITE1yUFYrcXZQZkszQUNPMkxQV2wxSlpyR0py?=
 =?utf-8?B?WjRZR1IvaGpTYW14MkY5eEZnQXB0RmJKSVNjQzdldEExR3FCZ0E1T1hjUkFp?=
 =?utf-8?B?L3hBM1B6UEdSU1VNbEdyU0ZkL2h0a0ZITUhWVVpkdDA4cnFBb3M4elBMOG1R?=
 =?utf-8?B?dXFucGU4OHhnd2J3UlFsUEYySzRvNDA1Y0dWaUcwU2tNT1lvSEZwejdIZEZL?=
 =?utf-8?B?RGZSbE0rcVdvekZhcmdUOHN1VTNwZy9sTDdSd3QxemRTUHl4NGx5aWZpQkRI?=
 =?utf-8?B?NmdMM3dGdXp4OGUxdzhlTzRPSS9ETjh3NU1YRFFvcmo1VW5SN0NCUGcvY1pi?=
 =?utf-8?B?NFQvTktrTm5tdkdPemNXMEppQlFZTEhBOG5YeTdQdzhXZGFQdGVIYyttZU5M?=
 =?utf-8?B?S3FmOC9HMkRqRTd4aXYyL08rVmRSZzRmZ2ZRNWQ3czk5ZTBTWmhINzZ2OFpj?=
 =?utf-8?B?b3VMcGJDOG0yQ0VZdk5YM3hUS3ZiVDhzTmM1UGZGRzNOY00zYXRiRFYxaU96?=
 =?utf-8?B?TWNOZ2lJRW5lb0RPQm4rUndPQjJGYmtnY2QzZjZHM2V0UzBRbDZqaVUzWlNR?=
 =?utf-8?Q?Rf1+9YWf0DwbXA/OxvBqhschW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C16CAF84B485E488A69FD16520CEE58@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e4ec36-9d1a-4c34-7d62-08db4750a824
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 18:53:14.6627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4rHRRz5HNSkIAL2GI6t4kBjA/ADn6rcNXlodMvA3H7/R6vn+pINBhQWkONTEEsYN3+eaH1XrU85QkiClnArpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix media detection for pre-GMD_ID
 platforms
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTI3IGF0IDExOjQ0IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IFJlYWRpbmcgdGhlIEdNRF9JRCByZWdpc3RlciBvbiBwbGF0Zm9ybXMgYmVmb3JlIHRoYXQg
cmVnaXN0ZXINCj4gYmVjYW1lIGF2YWlsYWJsZSBpcyBub3QgcmVsaWFibGUuIFRoZSBhc3N1bXB0
aW9uIHdhcyB0aGF0IHNpbmNlIHRoZQ0KPiByZWdpc3RlciB3YXMgbm90IGFsbG9jYXRlZCwgaXQg
d291bGQgcmV0dXJuIDAuIEJ1dCBvbiBQVkMgZm9yIGV4YW1wbGUgaXQNCj4gcmV0dXJucyBnYXJi
YWdlIChvciBhIHZlcnkgc3BlY2lmaWMgbnVtYmVyKSwgdHJpZ2dlcmluZyB0aGUgZm9sbG93aW5n
DQo+IGVycm9yOg0KPiANCj4gCXhlIDAwMDA6OGM6MDAuMDogW2RybV0gKkVSUk9SKiBIYXJkd2Fy
ZSByZXBvcnRzIHVua25vd24gbWVkaWEgdmVyc2lvbiAxMDI1LjU1DQo+IA0KPiBGaXggaXQgYnkg
c3RvcCByZWx5aW5nIG9uIHRoZSB2YWx1ZSByZXR1cm5lZCBieSB0aGF0IHJlZ2lzdGVycyBvbg0K
PiBwbGF0Zm9ybXMgYmVmb3JlIEdNRF9JRC4gSW5zdGVhZCB0aGlzIHJlbGllcyBvbiB0aGUgZ3Jh
cGhpY3MgZGVzY3JpcHRpb24NCj4gc3RydWN0IGJlaW5nIGFscmVhZHkgcHJlLXNldCBvbiB0aGUg
ZGV2aWNlOiB0aGlzIGNhbiBvbmx5IGV2ZXIgYmUgdHJ1ZQ0KPiBmb3IgcGxhdGZvcm1zIGJlZm9y
ZSB0aGUgR01EX0lEIHN1cHBvcnQuIEluIHRoYXQgY2FzZSwgR01EX0lEIGlzIHNraXBwZWQNCj4g
YW5kIHRoZSBoYXJkY29kZWQgdmFsdWVzIGFyZSB1c2VkLiAgVGhpcyBzaG91bGQgYWxzbyBoZWxw
IG9uIGVhcmx5DQo+IGJyaW5nLXVwIGluIGNhc2UgdGhlIEdNRF9JRCByZXR1cm5zIHNvbWV0aGlu
ZyBub3QgZXhwZWN0ZWQgYW5kIHdlIG5lZWQgdG8NCj4gdGVtcG9yYXJpbHkgaGFyZGNvZGUgdmFs
dWVzLiBXaXRoIHRoaXMsIFBWQyBkb2Vzbid0IHRyaWdnZXIgdGhlIGVycm9yDQo+IGFuZCBnb2Vz
IHN0cmFpZ2h0IHRvOg0KPiANCj4gCXhlIDAwMDA6OGM6MDAuMDogW2RybTp4ZV9kaXNwbGF5X2lu
Zm9faW5pdCBbeGVdXSBObyBkaXNwbGF5IElQLCBza2lwcGluZw0KPiAJeGUgMDAwMDo4YzowMC4w
OiBbZHJtOnhlX3BjaV9wcm9iZSBbeGVdXSBYRV9QVkMgIDBiZDU6MDAyZiBkZ2Z4OjEgZ2Z4Olhl
X0hQQyAoMTIuNjApIG1lZGlhOm5vbmUgKDAuMDApIGRtYV9tX3M6NTIgdGM6Mg0KPiAJeGUgMDAw
MDo4YzowMC4wOiBbZHJtOnhlX3BjaV9wcm9iZSBbeGVdXSBTdGVwcGluZyA9IChHOkMwLCBNOioq
LCBEOioqLCBCOkIzKQ0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IEZpeGVzOiBkNTViNTJkYWE5NmMgKCJkcm0veGU6
IFNlbGVjdCBncmFwaGljcy9tZWRpYSBkZXNjcmlwdG9ycyBmcm9tIEdNRF9JRCIpDQo+IFNpZ25l
ZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyB8IDExMyArKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCsp
LCA1OCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGNpLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gaW5kZXggZjU4N2JkOTcw
NmFmLi4zNWRjYjg3ODFmMmEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
Y2kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gQEAgLTM5LDcgKzM5
LDkgQEAgc3RydWN0IHhlX2d0X2Rlc2Mgew0KPiAgfTsNCj4gIA0KPiAgc3RydWN0IHhlX2Rldmlj
ZV9kZXNjIHsNCj4gKwkvKiBTaG91bGQgb25seSBldmVyIGJlIHNldCBmb3IgcGxhdGZvcm1zIHdp
dGhvdXQgR01EX0lEICovDQo+ICAJY29uc3Qgc3RydWN0IHhlX2dyYXBoaWNzX2Rlc2MgKmdyYXBo
aWNzOw0KPiArCS8qIFNob3VsZCBvbmx5IGV2ZXIgYmUgc2V0IGZvciBwbGF0Zm9ybXMgd2l0aG91
dCBHTURfSUQgKi8NCj4gIAljb25zdCBzdHJ1Y3QgeGVfbWVkaWFfZGVzYyAqbWVkaWE7DQo+ICAN
Cj4gIAljb25zdCBjaGFyICpwbGF0Zm9ybV9uYW1lOw0KPiBAQCAtNDA4LDYgKzQxMCwzMCBAQCBz
dGF0aWMgdTMyIHBlZWtfZ21kaWQoc3RydWN0IHhlX2RldmljZSAqeGUsIHUzMiBnbWRpZF9vZmZz
ZXQpDQo+ICAJCVJFR19GSUVMRF9HRVQoR01EX0lEX1JFTEVBU0VfTUFTSywgdmVyKTsNCj4gIH0N
Cj4gIA0KPiArLyoNCj4gKyAqIFByZS1HTURfSUQgcGxhdGZvcm06IGRldmljZSBkZXNjcmlwdG9y
IGFscmVhZHkgcG9pbnRzIHRvIHRoZSBhcHByb3ByaWF0ZQ0KPiArICogZ3JhcGhpY3MgZGVzY3Jp
cHRvci4gU2ltcGx5IGZvcndhcmQgdGhlIGRlc2NyaXB0aW9uIGFuZCBjYWxjdWxhdGUgdGhlIHZl
cnNpb24NCj4gKyAqIGFwcHJvcHJpYXRlbHkuICJncmFwaGljcyIgc2hvdWxkIGJlIHByZXNlbnQg
aW4gYWxsIHN1Y2ggcGxhdGZvcm1zLCB3aGlsZQ0KPiArICogbWVkaWEgaXMgb3B0aW9uYWwuDQo+
ICsgKi8NCj4gK3N0YXRpYyB2b2lkIGhhbmRsZV9wcmVfZ21kaWQoc3RydWN0IHhlX2RldmljZSAq
eGUsDQo+ICsJCQkgICAgIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyAqZGVzYywNCj4gKwkJ
CSAgICAgY29uc3Qgc3RydWN0IHhlX2dyYXBoaWNzX2Rlc2MgKipncmFwaGljcywNCj4gKwkJCSAg
ICAgY29uc3Qgc3RydWN0IHhlX21lZGlhX2Rlc2MgKiptZWRpYSkNCj4gK3sNCj4gKwkqZ3JhcGhp
Y3MgPSBkZXNjLT5ncmFwaGljczsNCj4gKwl4ZS0+aW5mby5ncmFwaGljc192ZXJ4MTAwID0gKCpn
cmFwaGljcyktPnZlciAqIDEwMCArICgqZ3JhcGhpY3MpLT5yZWw7DQo+ICsNCj4gKwkqbWVkaWEg
PSBkZXNjLT5tZWRpYTsNCj4gKwlpZiAoKm1lZGlhKQ0KPiArCQl4ZS0+aW5mby5tZWRpYV92ZXJ4
MTAwID0gKCptZWRpYSktPnZlciAqIDEwMCArICgqbWVkaWEpLT5yZWw7DQo+ICsNCj4gK30NCj4g
Kw0KPiArLyoNCj4gKyAqIEdNRF9JRCBwbGF0Zm9ybTogcmVhZCBJUCB2ZXJzaW9uIGZyb20gaGFy
ZHdhcmUgYW5kIHNlbGVjdCBncmFwaGljcyBkZXNjcmlwdG9yDQo+ICsgKiBiYXNlZCBvbiB0aGUg
cmVzdWx0Lg0KPiArICovDQo+ICBzdGF0aWMgdm9pZCBoYW5kbGVfZ21kaWQoc3RydWN0IHhlX2Rl
dmljZSAqeGUsDQo+ICAJCQkgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjICpkZXNjLA0KPiAg
CQkJIGNvbnN0IHN0cnVjdCB4ZV9ncmFwaGljc19kZXNjICoqZ3JhcGhpY3MsDQo+IEBAIC00MTUs
NjkgKzQ0MSwzNSBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfZ21kaWQoc3RydWN0IHhlX2RldmljZSAq
eGUsDQo+ICB7DQo+ICAJdTMyIHZlcjsNCj4gIA0KPiAtCWlmIChkZXNjLT5ncmFwaGljcykgew0K
PiAtCQkvKg0KPiAtCQkgKiBQcmUtR01EX0lEIHBsYXRmb3JtOyBkZXZpY2UgZGVzY3JpcHRvciBh
bHJlYWR5IHBvaW50cyB0bw0KPiAtCQkgKiB0aGUgYXBwcm9wcmlhdGUgZ3JhcGhpY3MgZGVzY3Jp
cHRvci4NCj4gLQkJICovDQo+IC0JCSpncmFwaGljcyA9IGRlc2MtPmdyYXBoaWNzOw0KPiAtCQl4
ZS0+aW5mby5ncmFwaGljc192ZXJ4MTAwID0gKCpncmFwaGljcyktPnZlciAqIDEwMCArICgqZ3Jh
cGhpY3MpLT5yZWw7DQo+IC0JfSBlbHNlIHsNCj4gLQkJLyoNCj4gLQkJICogR01EX0lEIHBsYXRm
b3JtOyByZWFkIElQIHZlcnNpb24gZnJvbSBoYXJkd2FyZSBhbmQgc2VsZWN0DQo+IC0JCSAqIGdy
YXBoaWNzIGRlc2NyaXB0b3IgYmFzZWQgb24gdGhlIHJlc3VsdC4NCj4gLQkJICovDQo+IC0JCXZl
ciA9IHBlZWtfZ21kaWQoeGUsIEdNRF9JRC5yZWcpOw0KPiAtCQlmb3IgKGludCBpID0gMDsgaSA8
IEFSUkFZX1NJWkUoZ3JhcGhpY3NfaXBfbWFwKTsgaSsrKSB7DQo+IC0JCQlpZiAodmVyID09IGdy
YXBoaWNzX2lwX21hcFtpXS52ZXIpIHsNCj4gLQkJCQl4ZS0+aW5mby5ncmFwaGljc192ZXJ4MTAw
ID0gdmVyOw0KPiAtCQkJCSpncmFwaGljcyA9IGdyYXBoaWNzX2lwX21hcFtpXS5pcDsNCj4gLQ0K
PiAtCQkJCWJyZWFrOw0KPiAtCQkJfQ0KPiAtCQl9DQo+ICsJdmVyID0gcGVla19nbWRpZCh4ZSwg
R01EX0lELnJlZyk7DQo+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGdyYXBoaWNz
X2lwX21hcCk7IGkrKykgew0KPiArCQlpZiAodmVyID09IGdyYXBoaWNzX2lwX21hcFtpXS52ZXIp
IHsNCj4gKwkJCXhlLT5pbmZvLmdyYXBoaWNzX3ZlcngxMDAgPSB2ZXI7DQo+ICsJCQkqZ3JhcGhp
Y3MgPSBncmFwaGljc19pcF9tYXBbaV0uaXA7DQo+ICANCj4gLQkJaWYgKCF4ZS0+aW5mby5ncmFw
aGljc192ZXJ4MTAwKSB7DQo+IC0JCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAiSGFyZHdhcmUgcmVwb3J0
cyB1bmtub3duIGdyYXBoaWNzIHZlcnNpb24gJXUuJTAydVxuIiwNCj4gLQkJCQl2ZXIgLyAxMDAs
IHZlciAlIDEwMCk7DQo+ICsJCQlicmVhazsNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KPiAtCWlmIChk
ZXNjLT5tZWRpYSkgew0KPiAtCQkvKg0KPiAtCQkgKiBQcmUtR01EX0lEIHBsYXRmb3JtOyBkZXZp
Y2UgZGVzY3JpcHRvciBhbHJlYWR5IHBvaW50cyB0bw0KPiAtCQkgKiB0aGUgYXBwcm9wcmlhdGUg
bWVkaWEgZGVzY3JpcHRvci4NCj4gLQkJICovDQo+IC0JCSptZWRpYSA9IGRlc2MtPm1lZGlhOw0K
PiAtCQl4ZS0+aW5mby5tZWRpYV92ZXJ4MTAwID0gKCptZWRpYSktPnZlciAqIDEwMCArICgqbWVk
aWEpLT5yZWw7DQo+IC0JfSBlbHNlIHsNCj4gLQkJLyoNCj4gLQkJICogR01EX0lEIHBsYXRmb3Jt
OyByZWFkIElQIHZlcnNpb24gZnJvbSBoYXJkd2FyZSBhbmQgc2VsZWN0DQo+IC0JCSAqIG1lZGlh
IGRlc2NyaXB0b3IgYmFzZWQgb24gdGhlIHJlc3VsdC4NCj4gLQkJICoNCj4gLQkJICogZGVzYy0+
bWVkaWEgY2FuIGFsc28gYmUgTlVMTCBmb3IgYSBwcmUtR01EX0lEIHBsYXRmb3JtIHRoYXQNCj4g
LQkJICogc2ltcGx5IGRvZXNuJ3QgaGF2ZSBtZWRpYSAoZS5nLiwgUFZDKTsgaW4gdGhhdCBjYXNl
IHRoZQ0KPiAtCQkgKiBhdHRlbXB0IHRvIHJlYWQgR01EX0lEIHdpbGwgcmV0dXJuIDAgKHNpbmNl
IHRoZXJlJ3Mgbm8NCj4gLQkJICogcmVnaXN0ZXIgYXQgdGhhdCBsb2NhdGlvbikuDQo+IC0JCSAq
Lw0KPiAtCQl2ZXIgPSBwZWVrX2dtZGlkKHhlLCBHTURfSUQucmVnICsgMHgzODAwMDApOw0KPiAt
CQlpZiAodmVyID09IDApDQo+IC0JCQlyZXR1cm47DQo+IC0NCj4gLQkJZm9yIChpbnQgaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKG1lZGlhX2lwX21hcCk7IGkrKykgew0KPiAtCQkJaWYgKHZlciA9PSBt
ZWRpYV9pcF9tYXBbaV0udmVyKSB7DQo+IC0JCQkJeGUtPmluZm8ubWVkaWFfdmVyeDEwMCA9IHZl
cjsNCj4gLQkJCQkqbWVkaWEgPSBtZWRpYV9pcF9tYXBbaV0uaXA7DQo+IC0NCj4gLQkJCQlicmVh
azsNCj4gLQkJCX0NCj4gLQkJfQ0KPiArCWlmICgheGUtPmluZm8uZ3JhcGhpY3NfdmVyeDEwMCkg
ew0KPiArCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAiSGFyZHdhcmUgcmVwb3J0cyB1bmtub3duIGdyYXBo
aWNzIHZlcnNpb24gJXUuJTAydVxuIiwNCj4gKwkJCXZlciAvIDEwMCwgdmVyICUgMTAwKTsNCj4g
Kwl9DQo+ICsNCj4gKwl2ZXIgPSBwZWVrX2dtZGlkKHhlLCBHTURfSUQucmVnICsgMHgzODAwMDAp
Ow0KPiArCWZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShtZWRpYV9pcF9tYXApOyBpKysp
IHsNCj4gKwkJaWYgKHZlciA9PSBtZWRpYV9pcF9tYXBbaV0udmVyKSB7DQo+ICsJCQl4ZS0+aW5m
by5tZWRpYV92ZXJ4MTAwID0gdmVyOw0KPiArCQkJKm1lZGlhID0gbWVkaWFfaXBfbWFwW2ldLmlw
Ow0KPiAgDQo+IC0JCWlmICgheGUtPmluZm8ubWVkaWFfdmVyeDEwMCkgew0KPiAtCQkJZHJtX2Vy
cigmeGUtPmRybSwgIkhhcmR3YXJlIHJlcG9ydHMgdW5rbm93biBtZWRpYSB2ZXJzaW9uICV1LiUw
MnVcbiIsDQo+IC0JCQkJdmVyIC8gMTAwLCB2ZXIgJSAxMDApOw0KPiArCQkJYnJlYWs7DQo+ICAJ
CX0NCj4gIAl9DQo+ICsNCj4gKwlpZiAoIXhlLT5pbmZvLm1lZGlhX3ZlcngxMDApIHsNCj4gKwkJ
ZHJtX2VycigmeGUtPmRybSwgIkhhcmR3YXJlIHJlcG9ydHMgdW5rbm93biBtZWRpYSB2ZXJzaW9u
ICV1LiUwMnVcbiIsDQo+ICsJCQl2ZXIgLyAxMDAsIHZlciAlIDEwMCk7DQo+ICsJfQ0KPiAgfQ0K
PiAgDQo+ICANCj4gQEAgLTQ5Miw5ICs0ODQsMTQgQEAgc3RhdGljIGludCB4ZV9pbmZvX2luaXQo
c3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICANCj4gIAkvKg0KPiAgCSAqIElmIHRoaXMgcGxhdGZv
cm0gc3VwcG9ydHMgR01EX0lELCB3ZSdsbCBkZXRlY3QgdGhlIHByb3BlciBJUA0KPiAtCSAqIGRl
c2NyaXB0b3IgdG8gdXNlIGZyb20gaGFyZHdhcmUgcmVnaXN0ZXJzLg0KPiArCSAqIGRlc2NyaXB0
b3IgdG8gdXNlIGZyb20gaGFyZHdhcmUgcmVnaXN0ZXJzLiBkZXNjLT5ncmFwaGljcyB3aWxsIG9u
bHkNCj4gKwkgKiBldmVyIGJlIHNldCBhdCB0aGlzIHBvaW50IGZvciBwbGF0Zm9ybXMgYmVmb3Jl
IEdNRF9JRC4gSW4gdGhhdCBjYXNlDQo+ICsJICogdGhlIElQIGRlc2NyaXB0aW9ucyBhbmQgdmVy
c2lvbnMgYXJlIHNpbXBseSBkZXJpdmVkIGZyb20gdGhhdC4NCj4gIAkgKi8NCj4gLQloYW5kbGVf
Z21kaWQoeGUsIGRlc2MsICZncmFwaGljc19kZXNjLCAmbWVkaWFfZGVzYyk7DQo+ICsJaWYgKGRl
c2MtPmdyYXBoaWNzKQ0KPiArCQloYW5kbGVfcHJlX2dtZGlkKHhlLCBkZXNjLCAmZ3JhcGhpY3Nf
ZGVzYywgJm1lZGlhX2Rlc2MpOw0KPiArCWVsc2UNCj4gKwkJaGFuZGxlX2dtZGlkKHhlLCBkZXNj
LCAmZ3JhcGhpY3NfZGVzYywgJm1lZGlhX2Rlc2MpOw0KPiAgDQo+ICAJLyoNCj4gIAkgKiBJZiB3
ZSBjb3VsZG4ndCBkZXRlY3QgdGhlIGdyYXBoaWNzIElQLCB0aGF0J3MgY29uc2lkZXJlZCBhIGZh
dGFsDQoNCg==
