Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FFFCE7A95
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 10:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0C010E230;
	Mon, 25 Sep 2023 10:24:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FAA10E230
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695637454; x=1727173454;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=biNLYq3yTcYjzJB+TQ+j4I+cxXaLoosX2JIXSYzhkiY=;
 b=MN85VPg4BF2Ndd1sS6Nh3jaKQhx0Ivi6qu27SaQWewI/4AiL1mEGos2j
 3hrTmFcQK9lZIUjBxkDSEM0uNmSiQf2bEq+Hy/gx7d9nnHUHfAbhfoT0l
 1q/tWTXyUPgHJc+/V5ItbwUXOymWDn6/nqmAWnMD9DC1ANAliVfqTTwXt
 uMCnBBAWcNBjfVrewOYA9A9RRzL2vl9C7Py8glJZX3JSp755dMW6bF3Q+
 KtmVD7I5wD1kqZNIIgUJeMRXUWTz8Rc4K75jIeiBN2jwS04MMFQO48vxb
 pJQe2j2c4F2QCNY3O7OqhVSszPbNXntl5qrXGLa+RY/LgYibB+vNrsySu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="381126990"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="381126990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 03:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777609109"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="777609109"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 03:24:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 03:24:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 03:24:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 03:24:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 03:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAMFsebXVrhpDXzUF2CfIEarEd1R/01jIYATRP1M0oFPblu5bUItypIh2JBTkecftR9iYmiVaiscyDxpepSF7wVFE6GW4UPoGQGI2lzBf2qtL0ApPkLS8NYiO0JH6HFmp7uHkFvkpecCvaGbp0LB+C4k8+/W2LrdJ5bOQyTM3v7BIHMV5or/vVBdQzvZNIMs5PCgE5bKykgAx51OyJuBIeDUZtErUy2EHZISBw2sBnP/TNLGIEWtkjNeXWP2DHo8aUWmjiHz69+X6k9STQhZTxgko1so02UqAUqDaEpv7/X0o84/5ZlE4U5o+bZiQWJWP9Wj4zrPMk8h15rEUtRG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biNLYq3yTcYjzJB+TQ+j4I+cxXaLoosX2JIXSYzhkiY=;
 b=TdDownDlv0Yfggsmmz36l7ht/ozDHXXGxrEYFo7Cn836+GjB79vIZT0ieagMN8Qd7fyam4dAWF/agyJso5l7DkpepFUOpBZz9HJrpy+08/N7dIfdD2zRU/jfJ/Xm9LGNXxFSVsP55YDFYKfYDZc9+EE/E/KFXc+67Rx4cLM88PVxUIORduHS5dGmQNHMovm5oHIrz5AfPLbPWmYAX1+/KElIKS+h6MW9YzLbNbFk3qSDbVx5kzEwK69+OEJoWY+JJWzNQ278Yyn8Rded6aSvcE5lE/aGeZkICiBfX3fMte7FauA1uyyfKrsxJ5CsvhVd89nK9PIwlUPS8xkyjbjheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 10:24:08 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 10:24:08 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Indroduce low level driver error
 counting APIs
Thread-Index: AQHZ7FA+/gSrS/qPS0+hZrbQdj0ZdbAk1YWAgAaD6jA=
Date: Mon, 25 Sep 2023 10:24:08 +0000
Message-ID: <SJ1PR11MB62045802ADC278FF4CCD65E081FCA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230921060314.5933-1-tejas.upadhyay@intel.com>
 <20230921060314.5933-2-tejas.upadhyay@intel.com>
 <db2ee607-2f4e-b7b5-9bf7-b306eea198f0@intel.com>
In-Reply-To: <db2ee607-2f4e-b7b5-9bf7-b306eea198f0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CO1PR11MB5028:EE_
x-ms-office365-filtering-correlation-id: 754e9f79-a6ea-4609-3441-08dbbdb18d69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: szEqQaZp1zV8leFqpqj4gcHy60uzdEdEyExNKv0mjVWEbRBmtgiK9xsJ0I4u1LgJwDMixGtJt7wtbqpQRwhJkutUf/XKcpYJLWg/ckqj2LEgR7N4AcK03cImI6os7RpkRyiGjRlI5MPIj3V48MlFJIayB4V6EgKkLQ7St1fMbBUGUpgJswKmyrdSSVNbdaGIZ4d6tinCXD6Om5T7JxgaggpDUh1E7fFguXXTh7Blje2uXOEBcyBgym7dU2LSSlo+c/tRAfCVoatAkRWAo6r7sk80qRR1o5Y1QPdygNMy6rqVsVCQMqjCMC4UwVz/J16ZMdRciGp1qy1twFMuhmh9QSuleeHQI9ZaqvaJzLFxAHKZ/0+7eRgA77dX9yQOInyDU1xpiVIWW+ptA8u9rYtdrMRfiXKknDpR1agYbiVxqQ1DHK5iV3/krqacpHBQVC/P5GOszI2TujGMsbiwVKsyNAfA4zTMDVv6VM1Jrj+VtLEh9zo9cZSyqjApqu+KrNVVQLvufPXiEUHyNfe7lkMWrUSd20m2aFSYSjp89C27iRDEvDxfJB5x/5VQbj4LoeAHajMyRXJ+9ng4rbe9FGfxDQhlIYwdR3Hm9ywEovKheeL2u3R2or53VyeO+/7NRDiQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(1800799009)(186009)(55016003)(82960400001)(33656002)(478600001)(41300700001)(38100700002)(8936002)(110136005)(52536014)(5660300002)(38070700005)(4326008)(8676002)(86362001)(76116006)(2906002)(66446008)(64756008)(66946007)(122000001)(66556008)(71200400001)(316002)(83380400001)(53546011)(107886003)(66476007)(6506007)(9686003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjZoMU9RVlJLVWJHWGFkWklFVXdFVU5Kd2d6Q0R0OGMwU1dPcy9DTjJ3Qi9u?=
 =?utf-8?B?OXJOdXZScU1PTTBnaUdteTZBMXEzeE1FM2ZNZnBUYllJU2RYbnFBck11a0Vy?=
 =?utf-8?B?SnJUYWFheVdEdmd4ak9NZjBHM2NtOGxidzNyb0F0TDB1WWs2RmNaK0xWUE9F?=
 =?utf-8?B?TEJ5T2syMWxkRVVvZEVHSVFXWEFBVEUrSmh1M05wWnVJMDR3czFIS082cFBi?=
 =?utf-8?B?M081Um8yWlNjc1grYytMUDJxQ0t5RE0wTTZ0T3RTODVUZkNvaC85eStrWFlO?=
 =?utf-8?B?dmg4OFBQMmpJTW1hT3VDMDlGa3E0VTBlcXBqM0NlaUYxemZmaGxoNXlOaU4y?=
 =?utf-8?B?MW5BS2lJdmRaYnEyV3Q5YXR1MUZDRzdvN09vdFZJOHBJVDZCKzM4OXN3engx?=
 =?utf-8?B?VDNNOEVOdmhFd3pteExWOUhycWJYem12Vy9Mck1Pby9zclIvWURvUFJQZzVv?=
 =?utf-8?B?Lzk4dk11TWF4WlZ1RFVrRTA0UlFEYmZETlJaSFN6alp2YTdVYlpiM1prQlZE?=
 =?utf-8?B?YWtyRHNNalhNOXZjZ0J4a0prN1lXTVRRQXk0eENzdk5sUUw0bGJ5UHZkSnBH?=
 =?utf-8?B?UGREb1RkNmdtcXZHM3YyVXdWZGp4YlkzSFgxeXl6dXVzbFpkVjh6TmNxSnNS?=
 =?utf-8?B?SzBPRDNNS0FjcGxRNU5QekY3TE5uVW9mcUJUQW9BTkVpZ25lemxDcTJyK01F?=
 =?utf-8?B?eEFMSlVsSDJLcXppY1MwTVVVMUxmK1pqNERJeVhxU1NBOTVaU3VxdjdrZ05F?=
 =?utf-8?B?eEJOelNNalNOVGhmZStjb0xUdjloWmdRV0dxbHphQzRNOUhGcDkwWEkzOVhm?=
 =?utf-8?B?N3dLZVIzanc0aUxpYndyMFRBb2hPd09wU1Fqeko3TXlDUi9QRjVDSWcwMFFR?=
 =?utf-8?B?eWZ1cldOWCtkUDNKeSs4eDdOclprbnZlV1Y4d2dIYy9pK1ltMGgxOGIrRmFz?=
 =?utf-8?B?ZUUrY254U0NXbmtlQ095TjJyNXRFeUYxbVN5UW9YYnBuUmNlczZWK05IdUlJ?=
 =?utf-8?B?Q0FLdUk0NXhJeVU5U0s0Z2xsT0FtWnZjc240Y3pucUVrZGh1a2pMU3l4a2Qx?=
 =?utf-8?B?YXdJNW11SkFOUTNYVU5WSFVXenFBWldHOXJhWFRqUDVjVFM0L1lqSjBmUkRW?=
 =?utf-8?B?amwyTEhiaFhzY2JWeWllQ3I0ZDZ1RHpyKyt1SjUwSENXeGszSnpoRjd2R1Iv?=
 =?utf-8?B?UVZJaEluME5TcVJ2TXJRaWgvU01ZNnk5VlpxWEw3VGZoTlZJODRBa0VucmUw?=
 =?utf-8?B?OXVwSUhJQVlFaURTSWk0UjZhRkQzV21sSzdnakJ5eXNOa1dzenFTQ0prTG9Q?=
 =?utf-8?B?N1YvV1lZRkJmaGdRc1FNdS9yZkpMSjRXTU0wQmQyV3M2NzhUZXpVbktvYWc0?=
 =?utf-8?B?SGF0S3d0WFhMVDJ5aTcvcE5qOE5Sa2I1dzI0UWhWdGg1MUd5K2ZLQSt0dUE3?=
 =?utf-8?B?RlBQbVpuOWlLeXhybUF3VEFJcUIvM2dkNHZENEROMVJzUFpSanBaQUR5RnpM?=
 =?utf-8?B?eTNrU1BGQndCMTRyK0NmTDNBWGVPQlBpVkIwRHNXM1lPSk05bFB3VEd5dWpN?=
 =?utf-8?B?dHJxczJqMmtpWHc3Z21hazhmaDFsVkgwSFhjaUxCZU5KMWZEcUk2YlpQMWE1?=
 =?utf-8?B?ZDJKdkUza3BwbGxsSU5CUnJBb3RmNUxhYS9JNFJPOElsc3EyekF3OXcwSnBN?=
 =?utf-8?B?QnBFQmxHdFljc2ZnQzY1Zy9lZ01rRlB2T1lRSDJZZ0RpellicEVyZXlYMXd4?=
 =?utf-8?B?MzRheGcyeGMwZVIvdHM5QnptbkViZHVtU2dhMWN4cjljczRkY0x0R0pOdFZz?=
 =?utf-8?B?TStmRUpHbng0akdMbUQvZ09penVvNUFWRFNDVzM2NndBQlNhOExDQUNVOFNQ?=
 =?utf-8?B?QmRCYm9QemdIbG9ZT1hteUtxRi9UbWszcHRYejRaa0lxOHc5MjB0WnkrekRu?=
 =?utf-8?B?TnZjSnRiQlpaaUViUzdvQU5tU1N3TlEzclNCSUZvYjRsWkpuLys0a1E2eHdy?=
 =?utf-8?B?K0dwV3ZTR3lxWWxlYUxiQWJqUGg3cTFuVmZkeng3alpqQlhKM3ZXMWNDOXdH?=
 =?utf-8?B?VHA5OHc5b0E4VEZ5MGVDSzl1NkVNeU9pWU5wbXVGMFp3VkhLVUlMdWRGQURU?=
 =?utf-8?B?OHNzc0JadmVPZy9iZW9CWHYzK2V6d3B3S0FhTU1ISDBycEFvMm1vV2JVVkw3?=
 =?utf-8?Q?o6SC2QMhgtM7E6G8ob5RjrpWHXTdUiHQ243SyKroEGb3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754e9f79-a6ea-4609-3441-08dbbdb18d69
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 10:24:08.1877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+uhugkBhOSfhUCPQt22aFf6Hghy00R/WuI889xpKf5wOF04xR6VdGV4F9ay5wpKqX8xoKUXGMpUuVJZ2Ehj93HvN9oiMusMnSVa+DDAh6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Indroduce low level driver error
 counting APIs
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

VGhhbmtzIGZvciBjb21tZW50cywgcmVwbGllcyBpbmxpbmUuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNoYWwgPE1pY2hhbC5XYWpkZWN6a29A
aW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDIxLCAyMDIzIDEyOjE1IFBN
DQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47IGludGVs
LQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQQVRD
SCAxLzJdIGRybS94ZTogSW5kcm9kdWNlIGxvdyBsZXZlbCBkcml2ZXIgZXJyb3INCj4gY291bnRp
bmcgQVBJcw0KPiANCj4gDQo+IA0KPiBPbiAyMS4wOS4yMDIzIDA4OjAzLCBUZWphcyBVcGFkaHlh
eSB3cm90ZToNCj4gPiBMb3cgbGV2ZWwgZHJpdmVyIGVycm9yIHRoYXQgbWlnaHQgaGF2ZSBwb3dl
ciBvciBwZXJmb3JtYW5jZSBpbXBhY3Qgb24NCj4gPiB0aGUgc3lzdGVtLCB3ZSBhcmUgYWRkaW5n
IGEgbmV3IGVycm9yIGNvdW50ZXIgdG8gR1QgYW5kIHRpbGUgYW5kDQo+ID4gaW5jcmVtZW50IG9u
IGVhY2ggb2NjdXJyYW5jZS4gTGV0cyBpbnRyb2N1Y2UgQVBJcw0KPiANCj4gdHlwb3MNCg0KVGhh
bmtzLCB3aWxsIGNvcnJlY3QgaXQuDQoNCj4gDQo+ID4gdG8gZGVmaW5lIGFuZCBpbmNyZW1lbnQg
ZWFjaCBlcnJvciB0eXBlIGNvdW50ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBV
cGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggfCAxMyArKysrKysrKysrKysrDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysr
KysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCAgICAgfCAxMiAr
KysrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYyAgICAgICAgIHwg
MjUgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDc0IGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlX3R5cGVzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMu
aA0KPiA+IGluZGV4IGE4MmYyOGM2YTNhMC4uMTRmNDc3NDEyNTgxIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IEBAIC01Nyw2ICs1NywxMyBAQCBzdHJ1
Y3QgeGVfZ2d0dDsNCj4gPiAgCQkgY29uc3Qgc3RydWN0IHhlX3RpbGUgKiA6IChjb25zdCBzdHJ1
Y3QgeGVfZGV2aWNlICopKCh0aWxlX18pLT54ZSksDQo+IAlcDQo+ID4gIAkJIHN0cnVjdCB4ZV90
aWxlICogOiAodGlsZV9fKS0+eGUpDQo+ID4NCj4gPiArZW51bSB4ZV90aWxlX2Vycl90eXBlIHsN
Cj4gDQo+IHRvIGZvbGxvdyBlbnVtIG5hbWUsIGJlbG93IGVudW1lcmF0b3IgbmFtZXMgbGlrZWx5
IHNob3VsZCBzdGFydCB3aXRoOg0KPiANCj4gCVhFX1RJTEVfRVJSXy4uDQo+IA0KPiBvciBjaGFu
Z2UgZW51bSB0eXBlIG5hbWUgdG86DQo+IA0KPiAJeGVfdGlsZV9kcnZfZXJyX3R5cGUNCg0KVGhp
cyBsb29rcyBnb29kLCB3aWxsIGFkZCBpdC4NCg0KPiANCj4gPiArCVhFX1RJTEVfRFJWX0VSUl9H
R1RUID0gMCwNCj4gDQo+IHZhbHVlIG9mIGZpcnN0IGVudW1lcmF0b3IgaXMgMCBieSBkZWZhdWx0
LCBubyBuZWVkIHRvIHNldCBleHBsaWNpdGx5DQoNCk9rDQoNCj4gDQo+ID4gKwlYRV9USUxFX0RS
Vl9FUlJfR1VDX0NPTU0sDQo+IA0KPiBHdUMgaXMgcGVyIEdULCBub3QgcGVyIHRpbGUsIHNvIHdo
eSBoZXJlPw0KDQpZZXMgaXRzIHBlciBHVC4gTW92aW5nIHVuZGVyIEdULiBUaGFua3MhDQoNCj4g
DQo+ID4gKwlYRV9USUxFX0RSVl9FUlJfSU5UUiwNCj4gPiArCVhFX1RJTEVfRFJWX0VSUl9NQVgN
Cj4gDQo+IHdoaWxlIHRoaXMgaXMgY29tbW9uIHByYWN0aWNlIHRvIGhhdmUgIk1BWCIgYXMgcGFy
dCBvZiB0aGUgZW51bSwgaXQgaXMNCj4gYnJlYWtpbmcgdGhlIG9uZSBvZiB0aGUgYmVuZWZpdCBv
ZiBhbGxvd2luZyBvbmx5IGV4cGxpY2l0IGNvbnN0YW50cyBhcyBwYXJhbXMgLQ0KPiBub3RlIHRo
YXQgaWYgc29tZW9uZSBwYXNzZXMgIk1BWCIgaXQgd29udCBiZSB0cmVhdGVkIGFzIGVycm9yIGJ5
IHRoZQ0KPiBjb21waWxlciAuLi4NCj4gDQo+IG1heWJlIGF0IGxlYXN0IG5hbWUgdGhhdCBlbnVt
ZXJhdG9yIGRpZmZlcmVudGx5IHRvIGF2b2lkIG1pc3Rha2VzID8NCj4gb3IgYmVzdCBtYWtlIGl0
IGFzICNkZWZpbmUgb3V0c2lkZSBlbnVtIGRlZmluaXRpb24gPw0KDQpIYXZpbmcgI2RlZmluZSBs
b29rcyBnb29kLg0KDQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgLyoqDQo+ID4gICAqIHN0cnVj
dCB4ZV9tZW1fcmVnaW9uIC0gbWVtb3J5IHJlZ2lvbiBzdHJ1Y3R1cmUNCj4gPiAgICogVGhpcyBp
cyB1c2VkIHRvIGRlc2NyaWJlIGEgbWVtb3J5IHJlZ2lvbiBpbiB4ZSBAQCAtMTczLDggKzE4MCwx
NA0KPiA+IEBAIHN0cnVjdCB4ZV90aWxlIHsNCj4gPg0KPiA+ICAJLyoqIEBzeXNmczogc3lzZnMn
IGtvYmogdXNlZCBieSB4ZV90aWxlX3N5c2ZzICovDQo+ID4gIAlzdHJ1Y3Qga29iamVjdCAqc3lz
ZnM7DQo+ID4gKw0KPiA+ICsJLyoqIEBkcnZfZXJyX2NudDogZHJpdmVyIGVycm9yIGNvdW50ZXIg
Zm9yIHRoaXMgdGlsZSAqLw0KPiA+ICsJdTMyIGRydl9lcnJfY250W1hFX1RJTEVfRFJWX0VSUl9N
QVhdOw0KPiA+ICB9Ow0KPiA+DQo+ID4gK3ZvaWQgeGVfdGlsZV9jbnRfZHJ2X2VycihzdHJ1Y3Qg
eGVfdGlsZSAqdGlsZSwNCj4gPiArCQkJIGNvbnN0IGVudW0geGVfdGlsZV9lcnJfdHlwZSBlcnIp
Ow0KPiANCj4gdGhpcyBfdHlwZXMuaCBoZWFkZXIsIG5vIGZvcndhcmQgZGVjbHMgaGVyZSwgcGxl
YXNlIG1vdmUgaXQgdG8geGVfZGV2aWNlLmgNCg0KT2sgDQoNCj4gDQo+ID4gKw0KPiA+ICAvKioN
Cj4gPiAgICogc3RydWN0IHhlX2RldmljZSAtIFRvcCBsZXZlbCBzdHJ1Y3Qgb2YgWEUgZGV2aWNl
DQo+ID4gICAqLw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4gaW5kZXggMWFhNDRkNGY5YWMxLi42MWU0
ZDAyMjI4MzYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IEBAIC00Nyw2ICs0NywzMCBA
QA0KPiA+ICAjaW5jbHVkZSAieGVfd2EuaCINCj4gPiAgI2luY2x1ZGUgInhlX3dvcGNtLmgiDQo+
ID4NCj4gPiArc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHhlX2d0X2Rydl9lcnJfdG9fc3RyW10g
PSB7DQo+ID4gKwlbWEVfR1RfRFJWX0VSUl9FTkdJTkVdID0gIkVOR0lORSBPVEhFUiIsDQo+ID4g
KwlbWEVfR1RfRFJWX0VSUl9PVEhFUlNdID0gIkdUIE9USEVSIg0KPiANCj4gbml0OiBia20gaXMg
dG8gaGF2ZSB0cmFpbGluZyAsIHRvIG1pbmltaXplIGRpZmYgb25jZSB3ZSBhZGQgbmV3IGl0ZW0g
OykNCj4gDQo+IG5pdDogd2h5IGFsbCBuYW1lcyBhcmUgdXBwZXItY2FzZSA/DQoNCk5vIHNwZWNp
ZmljIHJlYXNvbi4gSSBjYW4gY2hhbmdlIHRvIGxvd2VyIGNhc2UuDQoNCj4gDQo+IGhtbSwgYW5k
IHN0YXJ0aW5nIG9ubHkgd2l0aCAib3RoZXIiIGl0ZW1zIGRvZXMgbm90IHNvdW5kIHByb21pc2lu
ZywgYXJlDQo+IHRoZXJlIG5vIHNwZWNpZmljIGNsYXNzIG9mIGVycm9ycyB0aGF0IHdlIHdhbnQg
dG8gc2hvdz8NCg0KV2Ugb25seSBoYXZlICJndWMgY29tbXVuaWNhdGlvbiIgYXMgbWFpbiBjYXRl
Z29yeS4gT3RoZXIgR1QgYW5kIGVuZ2luZSBlcnJvcnMgbGlrZSByZWdpc3RlciBzYXZlL3Jlc3Rv
cmUsIHN1c3BlbmQvcmVzdW1lIHJlZ2lzdGVyIGZhaWx1cmVzIG9yIGVuZ2luZSBpZCBtaXNtYXRj
aCB3aGlsZSBkb2luZyBndWMgY29tbXVuaWNhdGlvbiBhcmUgdGFrZW4gdW5kZXIgb3RoZXIgY2F0
ZWdvcnkuDQoNCj4gDQo+ID4gK307DQo+IA0KPiBhbmQgdGhpcyB3aG9sZSB0YWJsZSBzZWVtcyB0
byBiZSB1bnVzZWQgaW4gdGhpcyBwYXRjaA0KPiANCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiB4
ZV9ndF9jbnRfZHJ2X2VyciAtIENvdW50IGRyaXZlciBlcnIgZm9yIGd0DQo+IA0KPiBtYXliZSB4
ZV9ndF9yZXBvcnRfZHJpdmVyX2Vycm9yKCkgd2lsbCBiZSBhIGJldHRlciBuYW1lPw0KDQpPaw0K
DQo+IA0KPiBmcm9tIGNvZGluZy1zdHlsZS5yc3QNCj4gDQo+ICIgSWYgeW91IGhhdmUgYSBmdW5j
dGlvbiB0aGF0IGNvdW50cyB0aGUgbnVtYmVyIG9mIGFjdGl2ZSB1c2VycywgeW91IHNob3VsZA0K
PiBjYWxsIHRoYXQgYGBjb3VudF9hY3RpdmVfdXNlcnMoKWBgIG9yIHNpbWlsYXIsIHlvdSBzaG91
bGQgKipub3QqKiBjYWxsIGl0DQo+IGBgY250dXNyKClgYC4gIg0KPiANCj4gPiArICogQGd0OiBH
VCB0byBjb3VudCBlcnJvciBmb3INCj4gPiArICogQGVycjogZW51bSBlcnJvciB0eXBlDQo+ID4g
KyAqDQo+ID4gKyAqIEluY3JlbWVudCB0aGUgZHJpdmVyIGVycm9yIGNvdW50ZXIgaW4gcmVzcGVj
dGl2ZSBlcnJvcg0KPiA+ICsgKiBjYXRlZ29yeSBmb3IgdGhpcyBHVC4NCj4gPiArICoNCj4gPiAr
ICogUmV0dXJucyB2b2lkLg0KPiA+ICsgKi8NCj4gPiArdm9pZCB4ZV9ndF9jbnRfZHJ2X2Vycihz
dHJ1Y3QgeGVfZ3QgKmd0LA0KPiA+ICsJCSAgICAgICBjb25zdCBlbnVtIHhlX2d0X2Vycl90eXBl
IGVycikgew0KPiA+ICsJaWYgKGVyciA+PSBBUlJBWV9TSVpFKGd0LT5kcnZfZXJyX2NudCkpDQo+
ID4gKwkJcmV0dXJuOw0KPiANCj4gd2l0aCBjb3JyZWN0bHkgZGVmaW5lZCBlbnVtcyB0aGF0IHdv
dWxkbid0IGJlIHBvc3NpYmxlIDspDQo+IA0KPiBhbmQgc2luY2UgdGhpcyBpcyBvbmx5IHBvc3Np
YmxlIGR1ZSB0byBvdXIgY29kaW5nIG1pc3Rha2UsIHdlIHNob3VsZCB1c2UNCj4geGVfZ3RfYXNz
ZXJ0KCkgaGVyZSByYXRoZXIgdGhlbiBzaWxlbnRseSBpZ25vcmUgdGhlIHByb2JsZW0NCg0KT2sN
Cg0KPiANCj4gPiArCVdSSVRFX09OQ0UoZ3QtPmRydl9lcnJfY250W2Vycl0sDQo+ID4gKwkJICAg
UkVBRF9PTkNFKGd0LT5kcnZfZXJyX2NudFtlcnJdKSArIDEpOw0KPiANCj4gbWF5YmUgdGhlcmUg
aXMgYWxyZWFkeSBzb21lIGhlbHBlciB0aGF0IGluYyBnaXZlbiBjb3VudGVyID8NCg0KTm8gdGhl
cmUgaXMgbm9uZSB0aGF0IEkgZm91bmQgaW4geGUuIEluZmFjdCBzaW1pbGFyIHdheSBpdCBpcyB1
c2VkIGluIG90aGVyIHBsYWNlcy4NCg0KVGhhbmtzLA0KVGVqYXMNCg0KPiANCj4gPiArfQ0KPiA+
ICsNCj4gPiAgc3RydWN0IHhlX2d0ICp4ZV9ndF9hbGxvYyhzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkg
IHsNCj4gPiAgCXN0cnVjdCB4ZV9ndCAqZ3Q7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlw
ZXMuaA0KPiA+IGluZGV4IGQ0MzEwYmUzZTFlNy4uY2I3MWFmZjE2YTBiIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgNCj4gPiBAQCAtMjQsNiArMjQsMTIgQEAgZW51bSB4ZV9n
dF90eXBlIHsNCj4gPiAgCVhFX0dUX1RZUEVfTUVESUEsDQo+ID4gIH07DQo+ID4NCj4gPiArZW51
bSB4ZV9ndF9lcnJfdHlwZSB7DQo+ID4gKwlYRV9HVF9EUlZfRVJSX0VOR0lORSA9IDAsDQo+ID4g
KwlYRV9HVF9EUlZfRVJSX09USEVSUywNCj4gPiArCVhFX0dUX0RSVl9FUlJfTUFYDQo+IA0KPiBk
aXR0bw0KPiANCj4gPiArfTsNCj4gPiArDQo+ID4gICNkZWZpbmUgWEVfTUFYX0RTU19GVVNFX1JF
R1MJMw0KPiA+ICAjZGVmaW5lIFhFX01BWF9FVV9GVVNFX1JFR1MJMQ0KPiA+DQo+ID4gQEAgLTM0
Nyw2ICszNTMsMTIgQEAgc3RydWN0IHhlX2d0IHsNCj4gPiAgCQkvKiogQG9vYjogYml0bWFwIHdp
dGggYWN0aXZlIE9PQiB3b3JrYXJvdWRucyAqLw0KPiA+ICAJCXVuc2lnbmVkIGxvbmcgKm9vYjsN
Cj4gPiAgCX0gd2FfYWN0aXZlOw0KPiA+ICsNCj4gPiArCS8qKiBAZHJ2X2Vycl9jbnQ6IGRyaXZl
ciBlcnJvciBjb3VudGVyIGZvciB0aGlzIEdUICovDQo+ID4gKwl1MzIgZHJ2X2Vycl9jbnRbWEVf
R1RfRFJWX0VSUl9NQVhdOw0KPiA+ICB9Ow0KPiA+DQo+ID4gK3ZvaWQgeGVfZ3RfY250X2Rydl9l
cnIoc3RydWN0IHhlX2d0ICpndCwNCj4gPiArCQkgICAgICAgY29uc3QgZW51bSB4ZV9ndF9lcnJf
dHlwZSBlcnIpOw0KPiANCj4gd3JvbmcgaGVhZGVyLCBtb3ZlIGl0IHRvIHhlX2d0LmgNCj4gDQo+
ID4gKw0KPiA+ICAjZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3RpbGUuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYyBpbmRleCAxMzE3NTJh
NTdmNjUuLmM2ZGZjYjQ0MzFmMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdGlsZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYw0KPiA+IEBA
IC03MSw2ICs3MSwzMSBAQA0KPiA+ICAgKiAgLSBNT0NTIGFuZCBQQVQgcHJvZ3JhbW1pbmcNCj4g
PiAgICovDQo+ID4NCj4gPiArc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0IHhlX3RpbGVfZHJ2X2Vy
cl90b19zdHJbXSA9IHsNCj4gPiArCVtYRV9USUxFX0RSVl9FUlJfR0dUVF0gPSAiR0dUVCIsDQo+
ID4gKwlbWEVfVElMRV9EUlZfRVJSX0dVQ19DT01NXSA9ICJHVUMgQ09NTVVOSUNBVElPTiIsDQo+
ID4gKwlbWEVfVElMRV9EUlZfRVJSX0lOVFJdID0gIklOVEVSUlVQVCINCj4gPiArfTsNCj4gDQo+
IGRpdHRvDQo+IA0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHhlX3RpbGVfY250X2Rydl9lcnIg
LSBDb3VudCBkcml2ZXIgZXJyIGZvciB0aWxlDQo+IA0KPiBtYXliZSB4ZV90aWxlX3JlcG9ydF9k
cml2ZXJfZXJyb3IoKSB3aWxsIGJlIGEgYmV0dGVyIG5hbWU/DQo+IA0KPiA+ICsgKiBAdGlsZTog
VGlsZSB0byBjb3VudCBlcnJvciBmb3INCj4gPiArICogQGVycjogZW51bSBlcnJvciB0eXBlDQo+
ID4gKyAqDQo+ID4gKyAqIEluY3JlbWVudCB0aGUgZHJpdmVyIGVycm9yIGNvdW50ZXIgaW4gcmVz
cGVjdGl2ZSBlcnJvcg0KPiA+ICsgKiBjYXRlZ29yeSBmb3IgdGhpcyB0aWxlLg0KPiA+ICsgKg0K
PiA+ICsgKiBSZXR1cm5zIHZvaWQuDQo+ID4gKyAqLw0KPiA+ICt2b2lkIHhlX3RpbGVfY250X2Ry
dl9lcnIoc3RydWN0IHhlX3RpbGUgKnRpbGUsDQo+ID4gKwkJCSBjb25zdCBlbnVtIHhlX3RpbGVf
ZXJyX3R5cGUgZXJyKQ0KPiA+ICt7DQo+ID4gKwlpZiAoZXJyID49IEFSUkFZX1NJWkUodGlsZS0+
ZHJ2X2Vycl9jbnQpKQ0KPiA+ICsJCXJldHVybjsNCj4gDQo+IGRpdHRvDQo+IA0KPiA+ICsJV1JJ
VEVfT05DRSh0aWxlLT5kcnZfZXJyX2NudFtlcnJdLA0KPiA+ICsJCSAgIFJFQURfT05DRSh0aWxl
LT5kcnZfZXJyX2NudFtlcnJdKSArIDEpOyB9DQo+ID4gKw0KPiA+ICAvKioNCj4gPiAgICogeGVf
dGlsZV9hbGxvYyAtIFBlcmZvcm0gcGVyLXRpbGUgbWVtb3J5IGFsbG9jYXRpb24NCj4gPiAgICog
QHRpbGU6IFRpbGUgdG8gcGVyZm9ybSBhbGxvY2F0aW9ucyBmb3INCg==
