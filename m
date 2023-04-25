Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338FDC6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 17:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077BF10E083;
	Tue, 25 Apr 2023 17:59:01 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7D010E083
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682445539; x=1713981539;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hhBkX29GdISYcnaecT3j5AutbyMgpnSvW3Fftsv12kg=;
 b=PazaMtSA4lGd6SgswJRgHoDPjSxvnI2XuyNBfM5YkG+ODzhNjH18B4Dp
 y6LUte/SFC0s/YwE2JjNEAsUPx58v8S8jl1TsQvbG9wc1Ws16dGluvQBh
 tcbA0hI2QOnUHfjuIZP2sBvB3TBqJkPWLSa6iPtFneZKS/l63csnUKG+Z
 /+58Ah0RmBEzXbn38+TC05SrrPm6uHJ7145nF1auGsd3Cb6jc6/VEgIcE
 CsZIe2MQe9x9jxTNFtNZuD+cJP9itCyNVxQOZ5J4iVRPKLB9NI3OoGTzy
 mvuNvqHkd4EzBx6WPzp/wDWaju+9fHvb/Oha3EeBEuL81dT3LW3gZrMyW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="374804818"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="374804818"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 10:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="867976000"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="867976000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 25 Apr 2023 10:58:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 10:58:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 10:58:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 10:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1SXwsn6oINHhbHCD7AmKxW2FlTRVu/C3pOroZIy49S0hs+b9abQ9u83u/4XjDj8m3q0JvxZa7H2YHBbQsFjli6GUFhgjBEhXvd+mKq7RnpocPNtFwCsi8chYi+fWF6YOH+xIXh94G5O9snEZXPeSF3ZgdBgfXWiARf+6GIETUtHxSvcyOcl5QFETfGCTaiXljM9oG+/Y4U/pzdO4eMM0WeIFNErj7BFbDMzyrLkibeESAQwd4QOa16HaHLLbRxzFMDQW25oBmBzKO75VQ91KVGDPPPan1eF+pMLh6IRw/mocFSX8SeMyiIZ15LIqMRJupFAN1XtrfYg2QsnJb/5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhBkX29GdISYcnaecT3j5AutbyMgpnSvW3Fftsv12kg=;
 b=BU+QWZZCKf3VBmY/LhYsP4lGMNu2+MhOHWWEkYkRpXmU1gmlM6HIgceGhnOGiVcPd4hkdLu9ZqqggQtwLSSwVYt6QReWKceAZNPiJ5fidjASfU9c8yP9kMeD5ARz37q4Y//TGxghrEX8hBw7PTvqkLbcqsmmRFFF0YUWEw1cMZK95r3syGUatP1XfNA4i0BAR4NR9j/wynS3iYhoxrsCFQdi1UtB8yZGbIPL+SzkjE2+7Y85kUt7e0fTrjpYPBl6K7o3PBRrp0GA/gWBXWDoLjC9u/F0zdLB/tvxowk7rI+2TCWal9Tlp39sfH7zDv6tdjI+PQNAppyDp3TFN7TpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Tue, 25 Apr
 2023 17:58:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 17:58:55 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Set default MOCS value for copy
 cs instructions
Thread-Index: AQHZb1AVxIjxhfc9O06bkM8wplsizq87Ik6AgAE+QIA=
Date: Tue, 25 Apr 2023 17:58:54 +0000
Message-ID: <f3bdffa9fd9fb2c780af10b8354b60b955a776ff.camel@intel.com>
References: <20230415040906.13230-1-jose.souza@intel.com>
 <20230415040906.13230-2-jose.souza@intel.com>
 <20230424225947.GH10045@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230424225947.GH10045@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7035:EE_
x-ms-office365-filtering-correlation-id: a9ad4fce-5f45-48b2-4903-08db45b6bc69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pRri6Xzw1ciCVDJGykKjr1GN6dh42obu9vLPS2WDfE381VBQwDF7TQZ3yv6JoUOAQVn28h39m+2Q44ASY6YM2eZGjkJ9xFm5TjTdvh5Ei3E08Icvq+lz13SesNppKB4Wa5P18B2zpPbtBk2w4qIIGoK6nuHyGFwf8AIxF1g71jQfeZEC8IYaI0c+OKrFJgEPR4eLAp8pR1EdiBe2rDM9fC/OpVwPArOZ8XLI4cU6i8Y2ykldQhyp/mlM/f7VyY2cXpYDWBJ7WhRdH+qmJShBrUpjwJRE/4trT5Ni19chShthxW3nahZH5AOjKPp28q0xekdsc2ww2mfnrNU2N4S93vBJ1q9cN2H4dtQUoSsnE0F1sroQ/tUhAiIVCukSAmVYUxsSBrbHOhqG4KR+VQ37D/KG+wwPdxcU5FNuXEtDuD9XszdYQtHGZfmhdFZzib/n+l+I4mnIg/CAiTPGC823A/rnXYHPNY9+2nRpyrudwY2scN+RV7Py2/c0vKh+vVFWM6QjbNBLzF252siog1DXEIexPNzyi8RWzh7KXcarswid5CihOD4WitrzOHHJV33MGdu2ljnFKSgPEzott9mYMLgHZWTkR8pD2yNfduLXvsWIf4SD1sWgh5P7BNlWfu59
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199021)(2906002)(38070700005)(36756003)(38100700002)(5660300002)(8676002)(8936002)(86362001)(6486002)(71200400001)(26005)(110136005)(6636002)(478600001)(6506007)(6512007)(2616005)(186003)(82960400001)(91956017)(316002)(4326008)(41300700001)(122000001)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2tqSzhVUWh5NlFYcHRBNHZTRkNQdUJHZVpkWkx4dzhKVk1laFJPNjhacEE2?=
 =?utf-8?B?YlNuQkFGS0g3ZXh2am1hcXRHVktYa1FlTjdOZXBPZG1oVTVPcVJ0LzdHby9F?=
 =?utf-8?B?S1BMM1R4OFdMbHhPZ2hKcGV6RFIxclMvRGlLRytWcmt6VGYvUHdETmpFV2Vj?=
 =?utf-8?B?QUJMSXhkR0N3dDA3VllIZ1BpbU9hN25nRXZOSnRUVjFjTjEwYkhtYUttaTdG?=
 =?utf-8?B?cjFFMjY3c3V1TS9lVFhzYXRjcVZGdFRwaUpLdWdaMVVwS21QNFJjWCtwN1NR?=
 =?utf-8?B?ODF1OHJBSExrTU9lQU10MURtN011VVBreW8vMldacTh6b1N5aDNJSzJhT2hX?=
 =?utf-8?B?ZjFtZ3VIRUZWY1JDYTRYTDY0RVg4WmU5Ykc4WER6SEphNXg0TWN3MHlYaVBB?=
 =?utf-8?B?MVNhTGltb3RFOVQ2RjdQRm9DN1V5NTRiM2oyWENzVlYvWngrK2lsMHZRZk5V?=
 =?utf-8?B?YnlNWWtyVjBuaTB3NlBRaXg0RTFyWUc1RzhXNW41b1RXdElNeTVwNTJ2NUpw?=
 =?utf-8?B?d3FIZlRtbDUvbTZoVFloMVpQMG5pVXhvM3E5OTVMZ3BIUGgvMFd1TXVzNDNC?=
 =?utf-8?B?NU9nZDVrUCthc0VOV0ZtSFhCSXFHNmtZQTNlVUl4WlRSUWNTU0R4UkJuckRE?=
 =?utf-8?B?OVg2UElDMzFXUnNQSG5HazZEZGFZZzVLY1BGM2hMMXFVQU1iOVpwRWs4VUJa?=
 =?utf-8?B?STlyZzJmS3hHQVpuVGdhcm0wNjlWcExnZHRmSGkrNUFicmpSZE4yMUsvWjJp?=
 =?utf-8?B?OCt5TGFpd1p2UTVpVUVxQjJNNWlRaEl0L1d1MldmYjRCSDN4eGNpVjVGMUlY?=
 =?utf-8?B?SGZlRjhLeHB1QUhsU08zeHpPNUJDOVNGVDR3WjFnSm1ZcXV2S0pSQndHbGMw?=
 =?utf-8?B?S1c5ZEZ0SFVVeEZXS0ZEUUVnMjhzenFoZWpGbEhsd1pkNzkyRHVOdDVlR2Qy?=
 =?utf-8?B?MkV5Zm9ZdDZNS3U5TGQwRTV6RGZleDBnbm52UEtkOTY4U0hzaXNkTW1DWVdm?=
 =?utf-8?B?eXcybUZhZVoraFM1TUNBY1Yxb3poaUhBK0Fmb0xLNzZGbmRYSUFlYXN6Znd2?=
 =?utf-8?B?TzhHbmpGS0pnNGZtQmkrWG1LYUVmMkMvbG5LbXNONVZvUlliL2tVMFBGTkVR?=
 =?utf-8?B?V2RQNS92dk5pU2xnRVk1dFhEaXlYMGFCZ3pWNnpGeUU3WW1aengreVNOZGdL?=
 =?utf-8?B?dWZUM2xtOEVxUzF3d3dUNlIrdmM5ajMrcUhyYmxkUjF2ZmdHbEpIMmErN20w?=
 =?utf-8?B?MFVKQzhmUzBCYXZ3Z2NpbnFLVllJOCtKa0hGdzN6dVFkRkVBaDE3NWVsalIr?=
 =?utf-8?B?b1hCTGtWcE1oMmVEYk1qVVdkbXlBNFBuSnRXVXkwOHpCK1Jsd3llKzAvZTJt?=
 =?utf-8?B?VXNodGMrNkdXWXEzUzlmaFVvUzM0QmZrZ293SWhYTDNwOEJEMFdzWUloN2cz?=
 =?utf-8?B?RjUxS01makR0NkJzL0YxalVPVG9tR3dDSUlLN2lqZDFOY2RYYXpwelJ4NXMx?=
 =?utf-8?B?aDJzLzhHMTFjQmRyR0tqc1dleTlnMzd4dTlQc2ZETGlkbDdObVBXd20vUU40?=
 =?utf-8?B?Z01BTmxXOXhoc0hLSjdhUXFnMU1SSFVwN2FWUGdIa1ErdWVhb3Vxc1pZS2FI?=
 =?utf-8?B?SmJoYVdtMThRZUtUL1J2TndkOXNBczJzOWVPWkFVdmRTeVp4NUo3cjZJQ1hs?=
 =?utf-8?B?OXpLUWFtR0F0WGNkLzMwUGlDaEpadUh5UXFWMXV1TmxoemVnOWYxQlowVjJQ?=
 =?utf-8?B?OG1SKzQzL0tIMXFNc0lkRW1LUjE1ZS9jK0JObDBOWjBxNk11ekdFTVA2Z0o5?=
 =?utf-8?B?S1FzUlJTRTJtNTBmR25JUXZEb0JUT2xwblFJQTk5YXA3aXVna1hMVUtGWVRn?=
 =?utf-8?B?Z1dmK2RnTWJtSXpNNS9ieC9Rd1IwVmRtYngrNWd4S2d4V1ZmRzRhWWE4amFK?=
 =?utf-8?B?YnhEQUFBYUtZVDQzUGhGek92eGZxZ2c1czJjcGJBbE1wVlhEdEs5UTlqYVBm?=
 =?utf-8?B?Y2xwa2doUGlSZllQY2hOWisxWEZHamJhbEl0ZmkxV1ovdGVKYlJuZDVCMGJs?=
 =?utf-8?B?VDRQSVlybjJkS0FPbmhUaEpGVS95TjRWZlVaVS9GWTNGTEE4eHVjR3pWOG94?=
 =?utf-8?Q?/fQ0q1aIH9n7+q6iRN5mumB8d?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E34FC8DD3E3BAC4D9125E150EE31EAEB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ad4fce-5f45-48b2-4903-08db45b6bc69
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 17:58:55.0129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0idrP/1fJkoNdFvdO7iMDU+JC/8PgG4f6/xU6IoKXMWCswW2kTirpqbMj28RnmHC/yuiVOoYfP1EWj66OzlnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Set default MOCS value for copy
 cs instructions
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA0LTI0IGF0IDE1OjU5IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBGcmksIEFwciAxNCwgMjAyMyBhdCAwOTowOTowNlBNIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIHdyb3RlOg0KPiA+IGNvcHkgY3MgaW5zdHJ1Y3Rpb25zIHRoYXQgZG9udCBoYXZlIGEg
ZXhwbGljdCBNT0NTIGZpZWxkIHdpbGwgdXNlIHRoaXMNCj4gPiBkZWZhdWx0IE1PQ1MgdmFsdWUu
DQo+ID4gDQo+ID4gVGhpcyB3YXMgbWFpbmx5IGNvcGllZCBmcm9tIGk5MTUgc291cmNlIGNvZGUu
DQo+ID4gDQo+ID4gQlNwZWM6IDQ1ODA3DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0
byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmggfCAgOSArKysrKysrKysNCj4gPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3dhLmMgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKysN
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmggYi9kcml2ZXJz
L2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+ID4gaW5kZXggY2M4NzQzNDhmNzZi
Yy4uZGJjNGI5ZjE1YjRlOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVn
cy94ZV9lbmdpbmVfcmVncy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVf
ZW5naW5lX3JlZ3MuaA0KPiA+IEBAIC0xMDUsNiArMTA1LDE1IEBADQo+ID4gIAkJKFJFR19GSUVM
RF9QUkVQKENNRF9DQ1RMX1dSSVRFX09WRVJSSURFX01BU0ssICh3cml0ZSkgPDwgMSkgfCBcDQo+
ID4gIAkJIFJFR19GSUVMRF9QUkVQKENNRF9DQ1RMX1JFQURfT1ZFUlJJREVfTUFTSywgKHJlYWQp
IDw8IDEpKQ0KPiA+ICANCj4gPiArI2RlZmluZSBCTElUX0NDVEwoYmFzZSkJCQkJX01NSU8oKGJh
c2UpICsgMHgyMDQpDQo+ID4gKyNkZWZpbmUgICBCTElUX0NDVExfRFNUX01PQ1NfTUFTSwkJUkVH
X0dFTk1BU0soMTQsIDgpDQo+ID4gKyNkZWZpbmUgICBCTElUX0NDVExfU1JDX01PQ1NfTUFTSwkJ
UkVHX0dFTk1BU0soNiwgMCkNCj4gPiArI2RlZmluZSAgIEJMSVRfQ0NUTF9NQVNLIChCTElUX0ND
VExfRFNUX01PQ1NfTUFTSyB8IFwNCj4gPiArCQkJICBCTElUX0NDVExfU1JDX01PQ1NfTUFTSykN
Cj4gPiArI2RlZmluZSAgIEJMSVRfQ0NUTF9NT0NTKGRzdCwgc3JjKQkJCQkgICAgICAgXA0KPiA+
ICsJCShSRUdfRklFTERfUFJFUChCTElUX0NDVExfRFNUX01PQ1NfTUFTSywgKGRzdCkgPDwgMSkg
fCBcDQo+ID4gKwkJIFJFR19GSUVMRF9QUkVQKEJMSVRfQ0NUTF9TUkNfTU9DU19NQVNLLCAoc3Jj
KSA8PCAxKSkNCj4gDQo+IFNhbWUgZ2VuZXJhbCBjb21tZW50cyBmcm9tIGxhc3QgcGF0Y2ggYWJv
dXQgZmlsZSBwb3NpdGlvbiwgbWFzaw0KPiBkZWZpbml0aW9uLCBhbmQgcG90ZW50aWFsbHkgZHJv
cHBpbmcgbGFzdCB0d28gbWFjcm9zIGFwcGx5IHRvIHRoaXMgcGF0Y2gNCj4gYXMgd2VsbC4NCj4g
DQo+ID4gKw0KPiA+ICAjZGVmaW5lIFZEQk9YX0NHQ1RMM0YxMChiYXNlKQkJCV9NTUlPKChiYXNl
KSArIDB4M2YxMCkNCj4gPiAgI2RlZmluZSAgIElFQ1BVTklUX0NMS0dBVEVfRElTCQkJUkVHX0JJ
VCgyMikNCj4gPiAgDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gPiBpbmRleCA1ZWYzNTYxMTAxNDY2Li4w
YzEyNzAwYmVkZGU1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gPiBAQCAtNjYwLDYgKzY2
MCwxOSBAQCB4ZV93YV9wcm9jZXNzX3J1bnRpbWVfd2FzX2VuZ2luZShzdHJ1Y3QgeGVfcmVnX3Ny
ICpzciwNCj4gPiAgCQkJCQkgICBDTURfQ0NUTF9NT0NTX09WRVJSSURFKG1vY3NfdywgbW9jc19y
KSwNCj4gPiAgCQkJCQkgICBYRV9SVFBfQUNUSU9OX0ZMQUcoTUFTS0VEX1JFRywgRU5HSU5FX0JB
U0UpKSksDQo+ID4gIAkJfSwNCj4gPiArCQkvKg0KPiA+ICsJCSAqIFNvbWUgYmxpdHRlciBjb21t
YW5kcyBkbyBub3QgaGF2ZSBhIGZpZWxkIGZvciBNT0NTLCB0aG9zZQ0KPiA+ICsJCSAqIGNvbW1h
bmRzIHdpbGwgdXNlIE1PQ1MgaW5kZXggcG9pbnRlZCBieSBCTElUX0NDVEwuDQo+ID4gKwkJICog
QkxJVF9DQ1RMIHJlZ2lzdGVycyBhcmUgbmVlZGVkIHRvIGJlIHByb2dyYW1tZWQgdG8gdW4tY2Fj
aGVkLg0KPiA+ICsJCSAqLw0KPiA+ICsJCXsgWEVfUlRQX05BTUUoIkJMSVRfQ0NUTF9kZWZhdWx0
X01PQ1MiKSwNCj4gPiArCQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEy
MDAsIFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpLA0KPiA+ICsJCQkgICAgICAgRU5HSU5F
X0NMQVNTKENPUFkpKSwNCj4gPiArCQkgIFhFX1JUUF9BQ1RJT05TKEZJRUxEX1NFVChCTElUX0ND
VEwoMCksDQo+ID4gKwkJCQkgQkxJVF9DQ1RMX01BU0ssDQo+ID4gKwkJCQkgQkxJVF9DQ1RMX01P
Q1MobW9jc193LCBtb2NzX3IpLA0KPiA+ICsJCQkJIFhFX1JUUF9BQ1RJT05fRkxBRyhNQVNLRURf
UkVHLCBFTkdJTkVfQkFTRSkpKQ0KPiANCj4gRXZlbiB0aG91Z2ggQkxJVF9DQ1RMIGxvb2tzIGEg
bG90IGxpa2UgQ01EX0NDVEwgb24gdGhlIHN1cmZhY2UsIHRoZXJlDQo+IGFyZSBzb21lIGltcG9y
dGFudCBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSB0d28gdGhhdCBuZWVkIHRvIGJlIG5vdGVkDQo+
IGhlcmU6DQo+IA0KPiAgLSBCTElUX0NDVEwgaXMgbm90IGEgbWFza2VkIHJlZ2lzdGVyLg0KPiAg
LSBCTElUX0NDVEwgaXMgcGFydCBvZiBhbiBlbmdpbmUgY29udGV4dCAoZS5nLiwgYnNwZWMgNDU1
ODUpLCBzbyBpdA0KPiAgICB3b3VsZCBuZWVkIHRvIGV2ZW50dWFsbHkgd2luZCB1cCBvbiBhbiBM
UkMgbGlzdCwgbm90IGEgSFdFIGxpc3QuDQo+IA0KPiBUaGUgaW5jb25zaXN0ZW5jeSBpbiBoYXJk
d2FyZSBkZXNpZ24gaGVyZSBpcyBmcnVzdHJhdGluZy4uLg0KPiANCj4gQWxzbyBub3RlIHRoYXQg
QkxJVF9DQ1RMIGlzIGRpcmVjdGx5IHdyaXRhYmxlIGJ5IHVzZXJzcGFjZSAoYnNwZWMgNDU1NDYp
DQo+IHNvIEkgcXVlc3Rpb24gd2hldGhlciBpdCdzIGV2ZW4gb3VyIHJlc3BvbnNpYmlsaXR5IHRv
IGRvIHRoaXMgaW4gWGUuDQo+IEl0J3MgdG9vIGxhdGUgdG8gZml4IGk5MTUgbm93IChhdCBsZWFz
dCBmb3IgY3VycmVudCBwbGF0Zm9ybXMpLCBidXQgSSdkDQo+IHN1Z2dlc3QganVzdCBkcm9wcGlu
ZyB0aGlzIHNlY29uZCBwYXRjaCBmb3IgWGUgYW5kIGxlYXZpbmcgaXQgdG8NCj4gdXNlcnNwYWNl
IHRvIHByb2dyYW0gd2hhdGV2ZXIgdmFsdWUgdGhleSB3aXNoIGZvciB0aGVpciBvd24gY29udGV4
dC4NCg0KQ2M6IFJvZHJpZ28NCg0KT2theSB3aWxsIHNlbmQgdGhlIGZpcnN0IHBhdGNoIHdpdGgg
Y29tbWVudHMgYWRkcmVzc2VkLg0KDQpUaGVuIGlmIGRlY2lkZWQgdG8gbm90IHByb2dyYW0gdGhp
cyBpbiBLTUQgaXQgbmVlZHMgdG8gYmUgZG9jdW1lbnRlZCBwdWJsaWNseS4NClRvZ2V0aGVyIHdp
dGggYWxsIG90aGVyIHNtYWxsIGJlaGF2aW9yIGNoYW5nZXMgZnJvbSBpOTE1LCBNSV9CQVRDSF9C
VUZGRVJfU1RBUlQgaXMgb3RoZXIgY2FzZSB3aGVyZSBiZWhhdmlvciBjaGFuZ2VkLg0KDQpUaGlz
IHdpbGwgc2F2ZSBhIGxvdCBvZiBkZWJ1ZyB0aW1lIGluIHRoZSBvdGhlciBVTURzLg0KDQo+IA0K
PiANCj4gTWF0dA0KPiANCj4gPiArCQl9LA0KPiA+ICAJCXt9DQo+ID4gIAl9Ow0KPiA+ICANCj4g
PiAtLSANCj4gPiAyLjQwLjANCj4gPiANCj4gDQoNCg==
