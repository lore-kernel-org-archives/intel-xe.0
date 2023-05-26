Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B0EC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 15:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D0810E801;
	Fri, 26 May 2023 15:40:17 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328A610E801
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 15:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685115616; x=1716651616;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=fkefUa+17jBtuFi3pcnPxrVqCSNSqPxJwYILwoNO6Iw=;
 b=GPGTF2tSvP1OWrEd87oagTTEcXWZoa+2wxr1p7zqZQNEHh0OyN48IhU2
 kq3lr/9Uu5D3K9bL+MzOYC01H+9S13KEKu9Kkl6eIv+eHAihC4FjMpbwT
 6QWj1DgZ7XSFamTPYfBQI1wRprdFBQ0Fa/67nGcjVT/fbZ2aVcxfBLume
 3AKt5Co5fCx4R+seZbMezTYgGIdGXJ8gf/+CQWD1EQVemRWeulQNtOveZ
 FPFwxGI1xDVQrRhWj8xDUDzQ+3OeTRAWoBUb+z0yfi4OUnqNrz/M9oEtZ
 gy3dGBJ4YN8IqWyWIYCkRxbPN+LXT9cTxQrshP2zq2uy/uNs0GqYZPZPR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="419990117"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="419990117"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 08:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="951932899"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="951932899"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 26 May 2023 08:40:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 08:40:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 08:40:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 08:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj0E5WJEjPuW+DyaxmWhBx16x/oqIRZK9xL3xZRnenxI16JH3/+Z434qMBi/Ms62lsRE1nZRiu8JE1EQRJ0XK4dNNJmISzmhFSv43UJvm71/ibsAxGIChBQ6sLIT5ZLHcNb2frGKQF4MiMESVYA81JxEveonqpvIvZA+s9YApjlkPtuVK3XNHanhgsc/61taQdV3bjYrA+6WKWa46QXZmmQoqWZcrY9JkQjK7ybHbg7MkA2P+bFwWscAgf05JkFdXbYB3m6h2lcbHwd9N81v6Vm06ojiwsxUwRkP/ucWq/3cErRLEhHVDJNY1L7J8gXRNKw4ZfIL4s5v20PX4EPYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkefUa+17jBtuFi3pcnPxrVqCSNSqPxJwYILwoNO6Iw=;
 b=ieiv/EtdqjiYEAVPp5xygYF1zmwQCulw0430tFMY/bkNmel5MrSEMT16CQDBr+0cmaejns+xj50GEig6GVhFaNRkuENEbM7bRJfF+vFKEidcJ1m2phwvTis26C9d6f4SzkeeW0vOYktfvMDF10q5p8+0dUWeFmyPM+1e1nvwq0WYmS1LnGtaTOfxyHmY4eI0TezF4dj7ToW3VDRTtWEygcMd9UvCUmYHqpBVmNXx8KGpBDLpqc5WYnYWHJV1j89xH+z81yHTmpD7ichLY/oux02nMpFT08Z/JM+4KH9nWk3ZGa/+PSlJ3NtblJbzTzGILBr0m4WnSFnCcJ41QcwvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Fri, 26 May
 2023 15:40:09 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 15:40:08 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH] xe/xe_bo: Reject bo creation of unaligned size
Thread-Index: AQHZbdUs6tWdzGFVDUOcB1PyxL4mEa8z7yeAgDkF3YA=
Date: Fri, 26 May 2023 15:40:08 +0000
Message-ID: <29d1ab33fa487525dbd05ff59650bae6ca9f310a.camel@intel.com>
References: <20230413065645.187171-1-zbigniew.kempczynski@intel.com>
 <d18c10ec-bb41-f142-70dd-1788259f9045@linux.intel.com>
In-Reply-To: <d18c10ec-bb41-f142-70dd-1788259f9045@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB5113:EE_
x-ms-office365-filtering-correlation-id: d72a8b92-dc42-46c9-94c0-08db5dff7c23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DG/E5tFTabQBj9/zfZ0yIDd6s+leEaIkfFwLE3OW8tTifXc6vLYsRF3PbGffsxVFnVWmPeuWtFlk/nh0ESqTb096hUVgFu7JCEE8bsBbMIaCTB5fauINSBsicZWigbCceyyRuCqiM43Gljh0p9lmhszXlipHY9OdrFuMGsWY5t+Fbp2VK5nJ8FkteDqYTk3G1a6KRjFicCx0haBbz7UxuLL24JTMXHwtejKqtSGhvMnTTuw0SRgj3zhlryzJMgDuOrOKeVu0uzbz467Dm97A8ReyOXtmu3uZZG96loe9+gG0QAebWXBWL42pSAM7E5AhMcheHuDA3QUTtR9Ev4xygQn65/GbIaWxCM0Ky5qwSJ8dGGT26Eto2y34pqGCGfhl2cKNHYcV+Ix22cjRHvvaaiD6VU0luY4cPIWllWjDPhH2z8KmZ+vH4Czv1EnlZ8FGVzHTZqY1oGMDEILmmDOabLRWTGAZop4/rANbi7bE9gdqX6oC5WdOBXpsHqtnd+S3PpjPLwlKt90ckf2M9h3/L+XlPmPJjaaebg3PvTyzS3qeAaRoa6BKlZKGIMpRp3L2kKgsu07Asej5QD1xYF/Kg9j2QrY0fpUIrzgynfPeNUvIy0oZ+4vSTtAjfmYK2XCg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(122000001)(316002)(71200400001)(26005)(53546011)(76116006)(6506007)(6512007)(91956017)(36756003)(82960400001)(66446008)(64756008)(66476007)(66946007)(66556008)(38100700002)(5660300002)(6486002)(41300700001)(8936002)(8676002)(83380400001)(86362001)(478600001)(110136005)(66574015)(186003)(2906002)(2616005)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2V5dmJ5M2czS1g5QjdqV3AwMWtyYXBReWRJOHhEemF6VmRyNCtrLzZYTXF5?=
 =?utf-8?B?MXZwWEVDMUVpRDcvd1kvTFo0NVVzTi94U0g2aDR3U3pxbG4va3BnajZZZ2Jn?=
 =?utf-8?B?VlNzdWRqeVEyMFdaVjZwSFRjbUx4ZWFvODFkdjFLQjJoUkszNEpnNnpLQTF2?=
 =?utf-8?B?RzhBV2VSVFVHcjE4YXRHUE9JOVd6UEpZaVR6a3NPdm9UcmtzZ1VqWlBoaFpD?=
 =?utf-8?B?dVYvV2tFdWQ4NDZUV0xlQnRGbWFhd3h5MDlDcmFiT3R5bXBXYmdJa2dPQ0lp?=
 =?utf-8?B?bFFGdi9ibmxURjVOemxoUWZwbXh6QU9DNmZNU1RLZTM2dXArSFo0S3NRL1lN?=
 =?utf-8?B?U2VsUDNSblR2TDlURUxRdWRsRUYyc2NzV09GN1BqczhwSHZ3RG83K055d0pX?=
 =?utf-8?B?TjJ0d2JMSC9OdTRSM1EwTkptZXFxOXhHNmJCR1Y1VnBHc2tFMXF3MVdrOUpX?=
 =?utf-8?B?WEFFMllONkxVWWM3VlZYZHJFandyV2lBbDdDdHBwemlORVBnUkpwSS9ub0dl?=
 =?utf-8?B?MjQ1UFlkcjh4aXU4RVNRajJZVHI0a09mZi8zWHhGUThZdE80cDgyeDJwR0lD?=
 =?utf-8?B?WEdvZC9aNk83S3U2WUdGMlhzNUpVdEhycWFvWm5qOUN4SUFmUmw0ZW1FMVIw?=
 =?utf-8?B?NzFOdkpnbWVtTWRpT0Z5elBwUlZ4TFM2eG5PUTQ3VnJkbFhwWHJKdmJEUlJM?=
 =?utf-8?B?YjZlVWhTeUUvMVhBN29kSDVRa3FLd3ZnWTNIZ1B4aW9Wc20rZ3N2NzEzYTcx?=
 =?utf-8?B?aHA5Y2hlWEFWMC9zTFZ1K0xpdnJTUjF6Z1ZzR1pDRDZPUkF2TGY3RGpZd1p1?=
 =?utf-8?B?NkRDRVRiOWcwZmg5cjlqTGFWWWRrekhRamF6M2dwVWZDWmJtUWs5UUtiVFE5?=
 =?utf-8?B?cUd3S0E5Zng2bE9uSEk3ZmtzSEk2U1d2WXNhamN5MG11d0FwcGszTUgwemlh?=
 =?utf-8?B?aGxPelRXemt5MStCeldFWEtJSC9xOVd4NDk0aThPVG9VRFFyb1UvZm1WdkZr?=
 =?utf-8?B?TmRiV3lURFdxaFlTeEhMZjhEWlpVdzkzbUM3MGlCSXFoU1NnMGg2U2pPMGw3?=
 =?utf-8?B?RitpbUNSYUtlSnN3NVo2UzQxMnl6UlMxcVhsR1ZPTDc2c0NaOTM2bzZQM3Bh?=
 =?utf-8?B?azRCZXhVdytpOVc0cmQxYWtiMUVjKzRscW8xdjl5L3A5elE5c01RQUVVR1hI?=
 =?utf-8?B?bm1jZVZUSWc4dnpmRFlrSkV0T3FoYlhqcUV4K2lIUlRFWEk0U1kySGY2WS9q?=
 =?utf-8?B?Mm9MNkk5SU5pbHNJKy9CbmtQVmxDa0lkclkrdVJDNG1DVVBUUFk3VzM2Mk8x?=
 =?utf-8?B?a1JYaDM1ajc5VEpVMzhCWWZDY0hoNEFqWmNVR1luZHdreXZ6S24wZFM1M1lI?=
 =?utf-8?B?dzJFTk5zSDFHYVpEV3YxckVZbDdrZTNydWRRUGhOczVVNHlpQ2owNUJwNFN3?=
 =?utf-8?B?M3EwcFhOVjBpcXM0Szk5SU1OeGV6bkc1N1ZHajAxdXJLQWp5eXlWbFFvUVlN?=
 =?utf-8?B?dmlQaHVZZEgzaE5WbzZWOXlrd2h2cWZJZUhGZXpQZkkxcjFJUEFaeVhHWWlp?=
 =?utf-8?B?MWZlWlJuN1FXamc5R3FadG9kOVBpRTRhdnVYaXhtVmNhNlN5aCtqMHlNY3VP?=
 =?utf-8?B?TmlPYTg3Q3Jnd0hBajIvOVdyOUQ3azdvUXg3cnZQbXJudGZiUWswZWJjTVhM?=
 =?utf-8?B?L2pQQi81blpzMG1SSWMrQ3NOVlU0VzhrcU1QZk9PeDViMHRKYkFvR0RPbXg5?=
 =?utf-8?B?cmNFMHZ6OUNJMFV3eFVVdm9BMWxFUmwzY3lQZERDektQaFVEVnRid1NqVVpw?=
 =?utf-8?B?SzY4RS9NbFNlb2FHYkJkZ0p0U1NnUGtlbmVYaEpZWUxkMGRRM25mZDVsZVlY?=
 =?utf-8?B?QUJQOEEwbEFCb2Z6bXhSZFcvV3R1M1cwaDFEVTVyeXR6NTlvZWpCVjZySVpL?=
 =?utf-8?B?QzNwRVRmU0RQR0NROXNJaEdRb0MvYlB2WUswbHNPWTJEUHc0cTZrbkkyampl?=
 =?utf-8?B?Q2x0ajNXUUlRVGhBbVdSbFZPcUJpYzMwMjZjc0dwK0JObnNYeHRycHVHMHdR?=
 =?utf-8?B?dWFsZzh6NWJOb1NueERpQWFTZGdvYXJMZ3VOdDl3am4wQ3A0VmR0L2Vra0V3?=
 =?utf-8?Q?E6kmzFhH4L4gQw7IpilgTQzzM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EE0145987EAAC49B144E0DD62537F12@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72a8b92-dc42-46c9-94c0-08db5dff7c23
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 15:40:08.3395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zp5qE/bG2qOXgka19mCC4pWigHuV0f+/27pdjQrSf+rvcuAzvv9VqGJENZrdVsUhNKQieb49NixFsDNHmJ4mrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] xe/xe_bo: Reject bo creation of unaligned
 size
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

T24gVGh1LCAyMDIzLTA0LTIwIGF0IDEwOjUyICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gK01hYXJ0ZW4NCj4gDQo+IEhpLCBaYmlnbmlldywgTWF1cm8NCj4gDQo+IE9uIDQvMTMv
MjMgMDg6NTYsIFpiaWduaWV3IEtlbXBjennFhHNraSB3cm90ZToNCj4gPiBGcm9tOiBNYXVybyBD
YXJ2YWxobyBDaGVoYWIgPG1hdXJvLmNoZWhhYkBsaW51eC5pbnRlbC5jb20+DQo+ID4gDQo+ID4g
Rm9yIHhlIGJvIGNyZWF0aW9uIHdlIHJlcXVlc3QgcGFzc2luZyBzaXplIHdoaWNoIG1hdGNoZXMg
c3lzdGVtIG9yDQo+ID4gdnJhbSBtaW5pbXVtIHBhZ2UgYWxpZ25tZW50LiBUaGlzIHdheSB3ZSB3
YW50IHRvIGVuc3VyZSB1c2Vyc3BhY2UNCj4gPiBpcyBhd2FyZSBvZiByZWdpb24gY29uc3RyYWlu
dHMgYW5kIG5vdCBhbGlnbmVkIGFsbG9jYXRpb25zIHdpbGwgYmUNCj4gPiByZWplY3RlZCByZXR1
cm5pbmcgRUlOVkFMLg0KPiANCj4gUGVyc29uYWxseSwgSSB0aGluayB0aGUgYWxpZ25tZW50IGNv
bnN0cmFpbnRzIGlzIGEgcHJvcGVydHkgLyANCj4gcmVzdHJpY3Rpb24gb2YgdGhlIFhlIEdQVSBi
aW5kaW5nIHRoYXQgc2hvdWxkIG5vdCBpbnRlcmZlcmUgd2l0aCBibyANCj4gY3JlYXRpb24gLyBz
aXplIHRoYXQgc2hvdWxkIGluc3RlYWQgcmVmbGVjdCB0aGUgc2l6ZSBvZiB0aGUgZGF0YSB3ZSBu
ZWVkIA0KPiB0byBzdG9yZS4gU28gdGhlIGFsaWdubWVudCBjb25zdHJhaW50cyBzaG91bGQgYXBw
bHkgb25seSB0byB0aGUgR1BVIFZBIA0KPiBzcGFjZSBhbGxvY2F0aW9uLiBUaGlzIHdvdWxkIGFs
c28gbWFrZSB0aGUgc2VtYW50aWNzIG9mIGltcG9ydGluZyANCj4gZG1hLWJ1ZnMgb2YgdW5hbGln
bmVkIHNpemUgc3RyYWlnaHRmb3J3YXJkLg0KDQpTZWNvbmRlZCENCkluIG15IG9waW5pb24gaXQg
c2hvdWxkIG9ubHkgc2V0IHRoZSBzaXplIGFsbG9jYXRlZCBieSBYZSBLTUQgaW4gZHJtX3hlX2dl
bV9jcmVhdGUuc2l6ZSBhbmQgbGVhdmUgdGhlIHJlc3QgYXMgaXMuDQoNCj4gDQo+IEFsdGhvdWdo
IGFkbWl0dGVkbHkgSSdtIG5vdCBmdWxseSB1cC10by1kYXRlIHdpdGggdGhlIGRpc2N1c3Npb24g
DQo+IHByZWNlZGluZyB0aGUgY2hvaWNlIHRvIHJldHVybiAtRUlOVkFMIGlmIHRoZSBibyBzaXpl
IGlzIG5vdCBhbGlnbmVkIHRvIA0KPiBvdXIgR1BVIGJpbmRpbmcgY29uc3RyYWludHMuIChNYWFy
dGVuLCBjb3VsZCB5b3UgcGVyaGFwcyBmaWxsIGluPykNCj4gDQo+IFRoYW5rcywNCj4gDQo+IFRo
b21hcw0KPiANCj4gDQo+IA0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2
YWxobyBDaGVoYWIgPG1hdXJvLmNoZWhhYkBsaW51eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8IDIzICsrKysr
KysrKysrKysrKystLS0tLS0tDQo+ID4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICB8ICA1
ICsrLS0tDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gaW5kZXggM2FiNDA0ZTMzZmFlLi5k
Mzk3MmM4NGJjY2UgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+IEBAIC0xMDkwLDYgKzEw
OTAsNyBAQCBzdHJ1Y3QgeGVfYm8gKl9feGVfYm9fY3JlYXRlX2xvY2tlZChzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwgc3RydWN0IHhlX2JvICpibywNCj4gPiAgIAl9Ow0KPiA+ICAgCXN0cnVjdCB0dG1f
cGxhY2VtZW50ICpwbGFjZW1lbnQ7DQo+ID4gICAJdWludDMyX3QgYWxpZ25tZW50Ow0KPiA+ICsJ
c2l6ZV90IGFsaWduZWRfc2l6ZTsNCj4gPiAgIAlpbnQgZXJyOw0KPiA+ICAgDQo+ID4gICAJLyog
T25seSBrZXJuZWwgb2JqZWN0cyBzaG91bGQgc2V0IEdUICovDQo+ID4gQEAgLTEwOTgsMjIgKzEw
OTksMzAgQEAgc3RydWN0IHhlX2JvICpfX3hlX2JvX2NyZWF0ZV9sb2NrZWQoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIHN0cnVjdCB4ZV9ibyAqYm8sDQo+ID4gICAJaWYgKFhFX1dBUk5fT04oIXNpemUp
KQ0KPiA+ICAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gPiAgIA0KPiA+IC0JaWYgKCFi
bykgew0KPiA+IC0JCWJvID0geGVfYm9fYWxsb2MoKTsNCj4gPiAtCQlpZiAoSVNfRVJSKGJvKSkN
Cj4gPiAtCQkJcmV0dXJuIGJvOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAgIAlpZiAoZmxhZ3MgJiAo
WEVfQk9fQ1JFQVRFX1ZSQU1fTUFTSyB8IFhFX0JPX0NSRUFURV9TVE9MRU5fQklUKSAmJg0KPiA+
ICAgCSAgICAhKGZsYWdzICYgWEVfQk9fQ1JFQVRFX0lHTk9SRV9NSU5fUEFHRV9TSVpFX0JJVCkg
JiYNCj4gPiAgIAkgICAgeGUtPmluZm8udnJhbV9mbGFncyAmIFhFX1ZSQU1fRkxBR1NfTkVFRDY0
Sykgew0KPiA+IC0JCXNpemUgPSBBTElHTihzaXplLCBTWl82NEspOw0KPiA+ICsJCWFsaWduZWRf
c2l6ZSA9IEFMSUdOKHNpemUsIFNaXzY0Syk7DQo+ID4gKwkJaWYgKHR5cGUgIT0gdHRtX2JvX3R5
cGVfZGV2aWNlKQ0KPiA+ICsJCQlzaXplID0gQUxJR04oc2l6ZSwgU1pfNjRLKTsNCj4gPiAgIAkJ
ZmxhZ3MgfD0gWEVfQk9fSU5URVJOQUxfNjRLOw0KPiA+ICAgCQlhbGlnbm1lbnQgPSBTWl82NEsg
Pj4gUEFHRV9TSElGVDsNCj4gPiArDQo+ID4gICAJfSBlbHNlIHsNCj4gPiArCQlhbGlnbmVkX3Np
emUgPSBBTElHTihzaXplLCBTWl80Syk7DQo+ID4gKwkJZmxhZ3MgJj0gflhFX0JPX0lOVEVSTkFM
XzY0SzsNCj4gPiAgIAkJYWxpZ25tZW50ID0gU1pfNEsgPj4gUEFHRV9TSElGVDsNCj4gPiAgIAl9
DQo+ID4gICANCj4gPiArCWlmICh0eXBlID09IHR0bV9ib190eXBlX2RldmljZSAmJiBhbGlnbmVk
X3NpemUgIT0gc2l6ZSkNCj4gPiArCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gPiArDQo+
ID4gKwlpZiAoIWJvKSB7DQo+ID4gKwkJYm8gPSB4ZV9ib19hbGxvYygpOw0KPiA+ICsJCWlmIChJ
U19FUlIoYm8pKQ0KPiA+ICsJCQlyZXR1cm4gYm87DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAgCWJv
LT5ndCA9IGd0Ow0KPiA+ICAgCWJvLT5zaXplID0gc2l6ZTsNCj4gPiAgIAliby0+ZmxhZ3MgPSBm
bGFnczsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiBpbmRleCBiMGI4MGFhZTNlZTguLmQzZTY0YWY3ZWFi
YiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IEBAIC0yNTksOSArMjU5LDggQEAgc3RydWN0
IGRybV94ZV9nZW1fY3JlYXRlIHsNCj4gPiAgIAlfX3U2NCBleHRlbnNpb25zOw0KPiA+ICAgDQo+
ID4gICAJLyoqDQo+ID4gLQkgKiBAc2l6ZTogUmVxdWVzdGVkIHNpemUgZm9yIHRoZSBvYmplY3QN
Cj4gPiAtCSAqDQo+ID4gLQkgKiBUaGUgKHBhZ2UtYWxpZ25lZCkgYWxsb2NhdGVkIHNpemUgZm9y
IHRoZSBvYmplY3Qgd2lsbCBiZSByZXR1cm5lZC4NCj4gPiArCSAqIEBzaXplOiBTaXplIG9mIHRo
ZSBvYmplY3QgdG8gYmUgY3JlYXRlZCwgbXVzdCBtYXRjaCByZWdpb24NCj4gPiArCSAqIChzeXN0
ZW0gb3IgdnJhbSkgbWluaW11bSBhbGlnbm1lbnQuDQo+ID4gICAJICovDQo+ID4gICAJX191NjQg
c2l6ZTsNCj4gPiAgIA0KDQo=
