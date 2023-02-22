Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA178C636D6
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 13:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCBD10E9A7;
	Wed, 22 Feb 2023 13:40:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FE210E9A7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677073220; x=1708609220;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/1aVuQGQlIRZWBEDdEqYTuXyCnKu8WIm/pWuO5NR+d8=;
 b=NYidTsTnz8NytuCbr6/HVZU1OLJEo/DzoDtB5TaCyWQii6Hax2Rz0+A0
 GoWAb4Wfycyt86kiN5B1OHhwYF8jaE4+TPqzB9fPvhY8pQDy+8n4Ou0/T
 +SS8Ka87/kW2NJwx/OpBHc55pB58bAnVvbG4uas6KVUp7FfT0p0+MAMKe
 6nxrwuUsun1TcZo/uHGEjW/EBQPsb5d1+kwu9WSubYSdi3ox20ok10z67
 5sSLvPZnyiuz1Y5p6Inc/koeJ7miJdLw+D0mn55+GwqKlViEmbZF8KzYg
 8AMrgwMdB7PmMuztwzHKqPxXdt6sGGLyhx1hDMZh4ZXhpC0y0ewRl2CTU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331592617"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="331592617"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 05:40:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="760960355"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="760960355"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 05:40:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 05:40:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 05:40:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 05:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYthH27J7SrME2wIW+jh+C77I3BdkFQhiqpBRGNQSyzEDzKzsFmVrQk0QSugh+egt00jFQwnjyDbfGC3l0frrlLgAKdCNcJ5FCfRPpmKL/+HYcgq1rWFYzP2EtASjWNNRV6vyFPDWUw6+B5wXWE1EuHYs4QMU9WT+jBp2Br3lYtc85zxkYs4VmLEQYP5Gu901FgSF+OOr6t2rGVN9biERBnvxfrN5ePRok11f2fUnMUIDzlu2bItPvHwybyK/DkGNdIFmN1nvEWObBYIYLIkNjSDIukSW3ObADAsSBgAW74mLPYaHpfoG1wadKVLDGSPZFlXwgsgI7l++xErSbiOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1aVuQGQlIRZWBEDdEqYTuXyCnKu8WIm/pWuO5NR+d8=;
 b=FD+TXud/G6l0H53yMwMvrF9gbooU9rlVLRZ8gvPCjKbCvZW2S7iXszgxe7ZxURUR/oZERbQfvADlTYBrISxHXP3Knb0TkKH9SiC3JSKz28OaVvIS8G99MCUZj6iHRtLImktl8onJkWZVGE5PcNCZ05JEvlyDqhPrtvWvlNpg3BpT+BHQMMeBanU/0oghFiCunEE36jPWkxP5KDhel1gsKFUL1Ff/yVC8sDuUaoJvLsc92LBQz/eRz//VTV8FBfGV4ay+carTpqFjgDJ+dLHcLSvyYKqkGLt4ciEvxNGbLJmz5kXNxFmwWbT2S/wo0JPoKuXaIF6zJlrRBBUe7g5gEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by SA1PR11MB5922.namprd11.prod.outlook.com (2603:10b6:806:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 13:40:15 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::cda4:1259:d243:b6fe]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::cda4:1259:d243:b6fe%10]) with mapi id 15.20.6111.021; Wed, 22 Feb
 2023 13:40:14 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Remove duplicate media_ver
Thread-Index: AQHZRlR/AoQqXYuLxkiy5XkF2zjEeq7a+bQA
Date: Wed, 22 Feb 2023 13:40:13 +0000
Message-ID: <73aa6793930ca2e32fd89cf04e6e03bc93cb7de4.camel@intel.com>
References: <20230222002705.927386-1-lucas.demarchi@intel.com>
In-Reply-To: <20230222002705.927386-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|SA1PR11MB5922:EE_
x-ms-office365-filtering-correlation-id: 4cded4e0-887e-4009-fb40-08db14da539f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kH40EyMkpDgy4cZXYfrLmyvmgTARr5/DAv+tdmE9OWPNl4nLR1ARf6Z0IUD1fDqRWAcj+OKqtvRhF9F5VsDQ2nPLjbFoo6PxFFr+jNSRYnAa0GZ858hyTQ76Ef4YowBN34T410v+DcH38cWHSU/m9OlF0KWR9L6v3CzBei0ccwfnfsqo9CaFQS4GlxFjhw8D5+UjeNKZVLmgHafqQXI6BccUpoGCZY1+jXxMhV5zoLv9mNe/HU5Z72XSVdQiCoVnjieJusMRAV4jKvX4syjp/wbQnVGvdWwvi+v4j2zZIvrEImvZY2IU/61vo7/n1QUKrIj1EOimZx0qRaS+yJl53UbzOYbPgfswv42efOONoIcKOoBxWTrtM7r3/0lASDTzJBsm15r5efrhOj5L7uPzDzIPoou1bjeDIhfoOQ56u8k4dlFQGAZscGSQpsRDAUhs7mm76wD/AS6hzQBjeFYX+NHdV4iI+JSZRmttpWNsQ8II9FClkNqMcccNGLgeP4GAUVIrq66I63fmHNEdcfz0ycMupkYvUO9ZEFHsa7x/eG9MVO2ULO8orzUUDPcZIrcCV12jFHcdwhi2vCDYBVK3sPmzMXffi4vmaIpG9YN5RO7BkMIPwwwiFf3L1PjYtOnShdy4OLaHPcPhnI+7OweOKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199018)(5660300002)(8936002)(41300700001)(38070700005)(36756003)(86362001)(2906002)(38100700002)(82960400001)(66946007)(122000001)(2616005)(966005)(6486002)(478600001)(71200400001)(26005)(6512007)(186003)(6506007)(316002)(107886003)(66556008)(66476007)(66446008)(76116006)(64756008)(83380400001)(6636002)(110136005)(91956017)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3lFcmZwa1d1YkN6VXBNZ2VxWldILzhzR29QWHdINnVSL0J3SWFHc2dXU21H?=
 =?utf-8?B?RW1PckJ3cnJPbkdYS2VWOGNrOW84NnNCS0N6cHp5Y0pPd1cxWnREUkxiR0d6?=
 =?utf-8?B?QmF6TGxMZmR5UWZ0eCtNMXZYT2tLc2pDajdhNFZDa0UzVFljeHhhM1VKZG0w?=
 =?utf-8?B?N1FGTTU4SjVFV3Z5TDRqdHRpTXRCbXExUDNGU3U4Yk1jcHFHR016dWVkS0lS?=
 =?utf-8?B?Uit4czEwSzI2d2VLWndGVjdtSXJCNmpKV2RVcWlGR3ZlT1FlKzJqZ1BZKzRR?=
 =?utf-8?B?VEg1WU5jV0ZOaUtOalpLc3ZxQndHTCtsS1hYdmM1cTlCanB0WU1hMUhlWTc4?=
 =?utf-8?B?K3BndXNtVGg3VldIdmZFS2hHc0RTa0MzWSttTXZOb1dWN1E5d1R5NmVDYi9U?=
 =?utf-8?B?RzVJdTluNzBSN08zMXVQRnd1NUpkRVJzOHRFajFWcEZOY0pOYTA0b0RkTkUv?=
 =?utf-8?B?UVZZa2pJeEFRcVJZZGp2YUlQK2loVnNubHRvN2lJbFc1cWRibVRGZmkvOVlx?=
 =?utf-8?B?T1ljK0JwQ1Q2MjQzTjVWa1BrcXdMcW1OeWplaXVaUG9LTzJCN2VkSzU5TkZZ?=
 =?utf-8?B?S3h3U2l6MTBodDJQbkFaK1ZTWTFxRk9WS0RhQVo0ZGhLTE1oNTBrV1JwYzQv?=
 =?utf-8?B?alJqN3NWK3B5ZGh6d3JaYnFBS2g2NTZDQUwzN205Q0NWSjlmNllpUUVzcXVa?=
 =?utf-8?B?N3FTNUZVblFoYnBwOW0wQWQ1aHdxcFd2dVJaRDVmOXkzcUZWaUpveHB0VUd6?=
 =?utf-8?B?Z1ZnYVlDS1hzTnEvUWt3Z2xOc2c0N2J6b1Q3NFErdGVxZlBMQ2JLVHZpcTdH?=
 =?utf-8?B?YVpaL0gvMGlTUEF6S1k0a0NzdHpXTUtVQ0dMV1Q2QXFMdGZuck1NazhLcEth?=
 =?utf-8?B?UVR4dHF3YTBwbVQyTk0rN0RCM2VsRWZsSWJnbmR0bnAwTDhuQm1vSE93d0hs?=
 =?utf-8?B?b2pUY2FiaGl2VWIyVDRiU3dnOHdyR3l4VU4wRTNjeUdFY1VhTTFZckdqNU5B?=
 =?utf-8?B?QTNYa0NhYWdVTmtlUzJaWitHKzRwQ2o1Wm5qalFhQzM5WXFOUzBYc1FzR1Ri?=
 =?utf-8?B?bnVKdGNuNUxhRVhEU2xNeVhMb04vYmZWS21Cc2F5ZlhCRnR3ZzlkR3o0R1JL?=
 =?utf-8?B?aG10bmRiODR2U1ZJa1Exc09ZdklRajlKS3A1aVlFb1BSelZaM2NmaW1FS3F6?=
 =?utf-8?B?OHpKOVo5OE1PeVJSbHZCTEZWWHhTSHRDNXNJc0VCTC95WFQvKzdqbHNNZVZN?=
 =?utf-8?B?RWplQXNxMW5xeEJNN1NpS09scnN5L0tuLzY2Q0FsYWFVRXhiblJxS3NtSlgy?=
 =?utf-8?B?a200TUJJbDFGamJnNGZYS1VSdWVzRnBaWGVReC9nbzJrbFRpaGg0WjBBRmZx?=
 =?utf-8?B?Zy9FUmRKQ2NEZDNmdHV5ZlJMUWFFVGN5SjBnRmp6ZmdnVFNyeHJTT3pxNzZq?=
 =?utf-8?B?SUViNUovcDRqWlNsSHU0ejNCT1MxYy9MbUxBUWhyemxQekkyOUlMRmwzeS9l?=
 =?utf-8?B?S3Z4Z0owNGFvRUdSZ3dDNDJVZUVza1BYQTNWMlhqVzFqL2VtcWJFMHlmSTBp?=
 =?utf-8?B?eU9rUWVFaEFHWmlBN3lSdlFkcUZheks2WmRxV3lYOG9SSm02a1lscXlFc0Nn?=
 =?utf-8?B?NU9HbDl4b3NVUmNGOWZMUit3bVZnMUgzOTNsT1dDK3BzTEd1QStQV0JYak4r?=
 =?utf-8?B?VFlDK3BtOWcxaGcycTBta2dJMEYzRUJSajAyNTBJZ0tXdHFTNnBMZ2JacWxB?=
 =?utf-8?B?M3lWUHcrZGJBWkdMUHRUbVRrWkorYWlVZ2hVSk85cHBGT0p2UUFWYXBrM1hs?=
 =?utf-8?B?VjFWQUNLTVNMMlducnpxbHNILzJPcXhPdWh3My9nODVhY0Zyb3ZzSmxweUpn?=
 =?utf-8?B?YUd3aFZCN1F6TVVpZkRpQVNnbGVEVW1LU0IzZUxXK1RtRWg2eXdFSml4Y0Nh?=
 =?utf-8?B?eGJiK1ZDa1YxVmhoK1g1T3YyVmI3YTVQb0h5WWpkUnRIaXg2OExaQjVVRWJY?=
 =?utf-8?B?TUR1cHhZQWk5VmlnVDNQMnBNMno0elZTbkpKWnU5ajFESVl5RkVZMDgzdXF1?=
 =?utf-8?B?RC9lTWx6SUhlRUN1WndVaFh0VXpaU0t4ZVlsMms2WGhtajFCd3ZKWVpma1dH?=
 =?utf-8?B?aTRoKzB4M3NGRllJaloyS2NLemhhbDBXdW5WODU2ejh5bjBFdmpZMmNmRHRw?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70C0A7540F3526468A95DA5CC293DAE3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cded4e0-887e-4009-fb40-08db14da539f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 13:40:14.0851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQWOmsfIYQpFukaEvTWZh8rgwp8KlSX8p9cMsrCevHej6WQMegjwUMYf6cQDFJ35fz5kc4WHdnI5iDGZmhDFug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5922
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove duplicate media_ver
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAyLTIxIGF0IDE2OjI3IC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IG1lZGlhX3ZlcngxMDAgc3VwZXJzZWRlcyB0aGUgaW5mbyBmcm9tIG1lZGlhX3Zlci4gTGVh
dmUgbWVkaWFfdmVyIGluIHRoZQ0KPiBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MsIHVzZWQgaW4geGVf
cGNpLmMgc2luY2UgaXQncyBlYXNpZXIgdG8gZGVmaW5lDQo+IGNvbW1vbiBwYXJ0cyBvZiB0aGUg
cGxhdGZvcm1zIGxpa2UgdGhhdC4gSG93ZXZlciBhbGwgdGhlIHJlc3Qgb2YgdGhlDQo+IGRyaXZl
ciBzaG91bGQgYmUgdXNpbmcgbWVkaWFfdmVyeDEwMCB0aGF0IGlzIG1vcmUgZnV0dXJlIHByb29m
Lg0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+DQoNCj4gDQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Ry
bS94ZS9rZXJuZWwvLS9pc3N1ZXMvMjE2DQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNo
aSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaCB8IDIgLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlv
LmMgICAgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyAgICAgICAg
ICB8IDEgLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVz
LmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gaW5kZXggNmM3MWUx
YjJkYmY0Li5kM2JmZTVlZDRkZDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2VfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5
cGVzLmgNCj4gQEAgLTgyLDggKzgyLDYgQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ICAJCXU4IHRp
bGVfY291bnQ7DQo+ICAJCS8qKiBAdm1fbWF4X2xldmVsOiBNYXggVk0gbGV2ZWwgKi8NCj4gIAkJ
dTggdm1fbWF4X2xldmVsOw0KPiAtCQkvKiogQG1lZGlhX3ZlcjogTWVkaWEgdmVyc2lvbiAqLw0K
PiAtCQl1OCBtZWRpYV92ZXI7DQo+ICAJCS8qKiBAc3VwcG9ydHNfdXNtOiBTdXBwb3J0cyB1bmlm
aWVkIHNoYXJlZCBtZW1vcnkgKi8NCj4gIAkJYm9vbCBzdXBwb3J0c191c207DQo+ICAJCS8qKiBA
aGFzX2FzaWQ6IEhhcyBhZGRyZXNzIHNwYWNlIElEICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbW1pby5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiBp
bmRleCBiYTMyN2IxZThkZWEuLmM0MTRlY2U2ZGZlMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21taW8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5j
DQo+IEBAIC0yODcsNyArMjg3LDcgQEAgc3RhdGljIHZvaWQgeGVfbW1pb19wcm9iZV90aWxlcyhz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gIAltdGNmZyA9IHhlX21taW9fcmVhZDY0KGd0LCBYRUhQ
X01UQ0ZHX0FERFIucmVnKTsNCj4gIAlhZGpfdGlsZV9jb3VudCA9IHhlLT5pbmZvLnRpbGVfY291
bnQgPQ0KPiAgCQlSRUdfRklFTERfR0VUKFRJTEVfQ09VTlQsIG10Y2ZnKSArIDE7DQo+IC0JaWYg
KHhlLT5pbmZvLm1lZGlhX3ZlciA+PSAxMykNCj4gKwlpZiAoeGUtPmluZm8ubWVkaWFfdmVyeDEw
MCA+PSAxMzAwKQ0KPiAgCQl4ZS0+aW5mby50aWxlX2NvdW50ICo9IDI7DQo+ICANCj4gIAlkcm1f
aW5mbygmeGUtPmRybSwgInRpbGVfY291bnQ6ICVkLCBhZGpfdGlsZV9jb3VudCAlZFxuIiwNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wY2kuYw0KPiBpbmRleCAyNTU5OGRlM2ExZmMuLjUzZmNmZWQ1ZGU1ZSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuYw0KPiBAQCAtNDg1LDcgKzQ4NSw2IEBAIHN0YXRpYyBpbnQgeGVfcGNp
X3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAq
ZW50KQ0KPiAgCXhlLT5pbmZvLnZyYW1fZmxhZ3MgPSBkZXNjLT52cmFtX2ZsYWdzOw0KPiAgCXhl
LT5pbmZvLnRpbGVfY291bnQgPSBkZXNjLT5tYXhfdGlsZXM7DQo+ICAJeGUtPmluZm8udm1fbWF4
X2xldmVsID0gZGVzYy0+dm1fbWF4X2xldmVsOw0KPiAtCXhlLT5pbmZvLm1lZGlhX3ZlciA9IGRl
c2MtPm1lZGlhX3ZlcjsNCj4gIAl4ZS0+aW5mby5zdXBwb3J0c191c20gPSBkZXNjLT5zdXBwb3J0
c191c207DQo+ICAJeGUtPmluZm8uaGFzX2FzaWQgPSBkZXNjLT5oYXNfYXNpZDsNCj4gIAl4ZS0+
aW5mby5oYXNfZmxhdF9jY3MgPSBkZXNjLT5oYXNfZmxhdF9jY3M7DQoNCg==
