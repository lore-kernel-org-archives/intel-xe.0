Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D136DC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E5388E45;
	Thu,  9 Nov 2023 16:29:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468BD88E45
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699547394; x=1731083394;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Jvur8n6umo3Aen+lYP68mIwYcy7ujw50H9oBWb3zwvk=;
 b=Nsi8+o6KCq8R6GIcnAwkYHLF/uEnof7VIhbDML2hwp2hUvYC2k9mHpU7
 oSLeVIXM3+iVlbCMQeG/iBQbiJITB/nOUI2ZgXWQOflzkjX5C2PowXLn6
 b99cX7jut8wh+o2nFHCkE+2dR795SzDX1EGxdGYl0Sn7zIf7ymXOE1XZl
 sL1cOxTLlzcJSEutM+Rlb4EE0WkDdjmlHTknzAzCf6OK946ycH5cWg2GY
 +VRDNM63LZNw/q2hVuzUlJW8SeL8aHweUlius9qwHFdw0apSJigkT/g6Z
 glYPxUOdB+Du0d46JHfn/sTGKju5MiLx9Gdl7x02wXRPs93S3TAVoHaI2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3049171"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3049171"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="713354476"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="713354476"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 08:29:35 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 08:29:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 08:29:35 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 08:29:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/kMlyE1jL7U6bCijfjOD1oxU8vign83J5JlUtS56S8M3QzShzXaF2HfbyPkGZI+n8gdIIbURhmTDiibhrg/HRyaKk6zp2SrTWTMsY+grIX8v1/MzGt1pRJjAlj7/ecEY/4riDcnIQDjS4kHsfsPxW3JfQ2J/ht/NpN9i1F8urR0A6N007jKAEROxsPjPCA4+9jaz9nda16jHsFTXfqTKY+7GRXuc1AIJlvP9vx6dyfuU1l+gIjS74xn53fKSi0Qc0boC/g0xW8e0eNyL3Hi9g6NB9Rv6vf3BLpDtqHPazckB4FvKPlDoyeCYPcv6JIr1hXvMHQoUw3FOYLdSoryUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jvur8n6umo3Aen+lYP68mIwYcy7ujw50H9oBWb3zwvk=;
 b=m2zDL3GAF/bkHPMJRiaaRK1qLVIe5l/33piOuIJcvlgsWcad9deQ108pnLiI6jjK+SUznk/Qm+BnTY3kw3Y70wzN+oty8T+AwWsDj603MZEAKklmgTnZg6p9Q3yLNq0SVdjP8Xh7ahqF3YnTxrHj0O/2HPgDiY9J1xLEnx7cA3OLezqUSqPuLF4FWESJM0MJOBddP81+GHYzQHm/MFEkV5+j+iucrq4pV8MKwwXhCcRjhUyGAqoLXE0VCQXNvHADZyaV+BjyvE946zlTTSh45wx6/AMhl8B11xhw00cVRuIvtRPinsEALPvz6se8VVw8IWJMNqotQdpqYAoB7XKcWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 16:29:31 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 16:29:31 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 34/50] drm/xe/uapi: Move memory_region
 masks from GT to engine
Thread-Index: AQHaDmMf7nJI6LFhLUWelNaG6AbJNrByNwyA
Date: Thu, 9 Nov 2023 16:29:31 +0000
Message-ID: <0ed7636f3caa90a01cb1128bf106d9da899f8939.camel@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-35-francois.dugast@intel.com>
In-Reply-To: <20231103143456.7-35-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB6848:EE_
x-ms-office365-filtering-correlation-id: c91f0d4c-e95e-41c2-60cc-08dbe1410d47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sm9lJUSCGEM0Zk/viP6jzaLlbT1eMBo1gBCxJ+RHum0PeVwua2yFvsioCevIH6+T+1jcl36+cjKlsCMXwsyl0FI40+BdPT32y29KTOmjhtGVSvTuRUu3Pgnb8xW+4hZbWuHhvYt+YRk54jU8NXxObvnRxjIJeyZAjWGP9r1ELhDiYJeiNj2gJ5Z6AwA7bpGWKvTcMtwI00VSRG1u9slZYyN7YacjpBC3vMR1kafFZO2x/9gNMqHQWykUNWDwKPtP7v62RHs5F5KxXJL/KM+gQBtpJrJOCdqn35Aq/ATUon3cSVGtWygjF/y1dxeuvCHUU/j0sWRCg8eMh/KSTRlgjjAPa2XTx4xmifxheEku+SxXQBZD088aZ/Bit0c3HqjuDf+vihkawZAq1ZNW+xyo8bpjeGep80Doi0ZAcgUOLXfTxWTzL7DsbxedXNrLyifFsUXQAq1ttyp9BNrhjM8HTuqNCqAhvMTxCuSTItu+YFu6youeCaLBJJHnvj2Dn0iMGxXoKcK9hUAC+PhdGypMULWkWlG0D2EGppt+hTtviRtGG0I8rwa5VA0m+y73qQFIl3EB3fm3rgv1UTjyjNK5+MUayOHXAnRlgaqNO53HWi0west6p3+UNSSWudOK/RHO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82960400001)(36756003)(86362001)(2906002)(83380400001)(107886003)(478600001)(26005)(41300700001)(71200400001)(4326008)(8676002)(6486002)(6512007)(5660300002)(8936002)(6506007)(2616005)(122000001)(66556008)(6636002)(64756008)(38070700009)(66446008)(66476007)(110136005)(91956017)(316002)(66946007)(76116006)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUVBUmJ6c05QVFN6NjV6bUtqaXdTZWJVQ1M5QnEwQk8yNnBkQStFbEwva3JM?=
 =?utf-8?B?ZTZjV2VoTW5qRDJ1Z21rRXRpUFF0UDRRSThDVWxDZWU2cjVjdkpDSEhnTWxM?=
 =?utf-8?B?SytiSEJGZ0luazdFMU5HRFZvZE9iQ0NURTErd25Cby9yRS9raVFubVpHeEth?=
 =?utf-8?B?TWF0aUNkbmY4SjY3citmWVlPODBNMzJRQ3YxendLdXhLSEVieXFhM0FjekVz?=
 =?utf-8?B?eFA0R0NOb2VsTjFCUHFxRVl5TGJCNmJpaklLUWt6MEpxbXE5aDVpSnpxUm1P?=
 =?utf-8?B?R2Q2d2dYa09DZjZ0dTZxOWJaZXR3ZkpTald5cHIxdzJLZmZWM0xkZ0V0WGNL?=
 =?utf-8?B?ZWhJYXFVR3dkSWNqeDBrREUzU0kveGZiWUZGVElYQWljRkthWExiVWZZem01?=
 =?utf-8?B?WUduaWZ0bUNRTUVRVUJkcS9pRWQ2UXo5UFdFWUpJYUVnVFdSdTJlT1doMVBX?=
 =?utf-8?B?cDVkVTJ2cGJja1R2aHI2TElEajlLZDk2V2NqdG9rYjdQcVF5WmRwd2xrUnB4?=
 =?utf-8?B?YWVMSjVsMk1heFFobjM4V3pselRXL09DUTA5aE1ydUNkc2Q4UkFYa2VQQkwx?=
 =?utf-8?B?MExzdGprY3ZtR0pnWmJ4VkN5eGZmYjNSaGE5c21TTTdaanRXNnpIYkk1WHdq?=
 =?utf-8?B?L2ZOWHpkdm9QZVRrL0hMakVndXkrZFFVbTcrYlhwM1lrN04rU0pMam92OS9Z?=
 =?utf-8?B?Y0htRnhNTW9EeDJSaU84ZG1QeTFZdHRSb0J6YVAzWk40R0RhK0FreUFiaUp6?=
 =?utf-8?B?S2l6QzlZK1MrNlVRMThuT1U1Z2hENDQ4ay9hb3RIYzNOT2FsQVpzMFEvM3dw?=
 =?utf-8?B?Y2ZYbXdPNjZIaVpIL085S3pzdlRUKzh5UnVoQ0NBOEF0NjM4YWdEVE43R21S?=
 =?utf-8?B?OElndCtKa2tsZG83em9xVmRUWkJFSFJXd2dhWGdZOUpDejBOZEVURDYzK25m?=
 =?utf-8?B?SUVCNFdoUnFBYWlzWmVzTmw4ZzdJa085cXdBbVZZamhBdkE1Z2dSdHBvWFVO?=
 =?utf-8?B?SVhYdGMxWStTdHpjVzRGWktIOGE3Mmp0NVhLcTdHb29rS3Jxbm14MGJ3bmFi?=
 =?utf-8?B?dmJVeTVOb1oyVUgzeHFiQjZaYWRueEwxRlV0NExGZFdVT3cwaXV5Rnd1WGh2?=
 =?utf-8?B?SkJCRkl0N3h6U2RKTGdpRUxXb0hrYkhPRTJ4akNEeFFYZjRNTmJmOCt6VUla?=
 =?utf-8?B?R1lkaFpQVFVoWUU2UUczQmpVdHdlWW9LS1MxSWtET01BeW5TdkM4SnRuU2hU?=
 =?utf-8?B?UWNHR0xIMzZxNnhsWWJqT1NsMm8wZ2E2U3hjTkdiMVpjRGxxR0JTbGdRUmlQ?=
 =?utf-8?B?ZVZLVUltSGxJdlhwelg0VnpOd0MyK1VSVDE3KzhkdDF2d3R4NTRTaWxIVkdI?=
 =?utf-8?B?YzZkMkE1NlVKTjZIY0VOVkNFZmp6SUJrWmVIbUE5VEdJWVBEeVk1bkJCdjNM?=
 =?utf-8?B?SDZINkxIQ2kzazJqbjM2di8wNk9lUlE0L3pCTjVyTVd5S21HTTF5WEp6RjBZ?=
 =?utf-8?B?TW5JZ2wrTTRSMkRoamJkeGZKUFo1cHpOWnJqeHN6aWxGLzBmeFJ4MXBwbUEv?=
 =?utf-8?B?R05GNGltRTRjN2UrNzZLQ21UVEtnc3RPMmdwVWYveCttUkd3Ym91L1pDV1hw?=
 =?utf-8?B?RHFtdWlJWHZ4c1hHVWVteXA2QXJndWJEaFdTMmhwRlhvK0thR3lTdHhUL3BT?=
 =?utf-8?B?SmNzMVRzL2M5OVh6RE9EKzBSVEtEVUU3VzZMSVlrd1A3aVEzUGhoanZ1VlND?=
 =?utf-8?B?OGd1ZjFOWXhZZ3Z6ZVdQK2NkWnh6eTBsOTd3MEtMNGIzeGY5TmxYd0FiZ1Bx?=
 =?utf-8?B?am5JM1hNZXpteXo5MnhJQmEzM0V5TkRMSE5rS1VyZTl5NTRKVDRwMG52SEh5?=
 =?utf-8?B?RGduNUlzZURIVWZKd3VzaFBXTmNZZWlybFVIaXE0Wm1BOEVPNXk1blpmYjU2?=
 =?utf-8?B?QjNCVmc0aE5lek5nVWJTa2FKdGI1TUFVQVBtc1JWakZ4ZVppNDRZRm0zeEdv?=
 =?utf-8?B?YkZQbEd5eHgvYitzRGFyS09MYUtuWWFHb3JtV2JORXdEK2JnRGgyY0dMWDVa?=
 =?utf-8?B?bVJvVm1jZW5pUzRUdWVRd3JiM2NZUkQ3cEZlWkhqdHhJbitFdVJMSDNia1RF?=
 =?utf-8?B?aHBodG9TTEtYdlVSOW9rN3FIZWxvRi9RRHRRTzN0MGdWcEJKbnNIRHFrVzg3?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <556611514454614B8653ECEC1097E8DA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91f0d4c-e95e-41c2-60cc-08dbe1410d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 16:29:31.4537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcEuiRYzEU7chBxJ8YK/UznPp3xXcaJY3b5eJZHKk9ZJosmz56ViOIJ0ZTq2SBBhPb+w8xMrt7EICzECqo6LAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 34/50] drm/xe/uapi: Move memory_region
 masks from GT to engine
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

T24gRnJpLCAyMDIzLTExLTAzIGF0IDE0OjM0ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IElu
IHRoZSBUaWxlZCBwbGF0Zm9ybXMsIHRoZSBtZW1vcnkgaXMgbW9yZSB0aWVkIHRvIHRoZSBUaWxl
DQo+IHRoYW4gdG8gdGhlIEdULg0KPiBUaGUgZGlzdGFuY2UgKG5lYXIgdnMgZmFyKSBtYWtlcyBt
b3JlIHNlbnNlIGZyb20gdGhlIEVuZ2luZQ0KPiBwZXJzcGVjdGl2ZSB0aGFuIGZyb20gdGhlIEdU
IHBlcnNwZWN0aXZlLg0KDQp3aHkgbm90IGFkZCBhIHVBUEkgdG8gcXVlcnkgdGlsZSBpbmZvcm1h
dGlvbj8NCnRoaXMgaXMgZHVwbGljYXRpbmcgYSB0aWxlIGluZm9ybWF0aW9uIG9udG8gZXZlcnkg
ZW5naW5lIG9mIHRoYXQgdGlsZS4NCndlIGNvdWxkIGxlYXZlIHJlc2VydmVkIGZpZWxkcyBpbiB0
aGUgdGlsZSB1QVBJIHRvIGluY2x1ZGUgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiB0aGF0IG1pZ2h0
IGJlIHJlbGV2YW50IGluIGZ1dHVyZS4NCg0KPiANCj4gU28sIGxldCdzIG1vdmUgdGhpcyBvdXQg
ZnJvbSB0aGUgR1QgYW5kIGludG8gdGhlIGVuZ2luZSBpbmZvLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgMTQgKysrKysrKy0tLS0tLS0NCj4gIGluY2x1ZGUv
dWFwaS9kcm0veGVfZHJtLmggICAgIHwgMjcgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gaW5kZXggYWE1NzQzZTJlNGQwLi40OWE5YjM2ZjExOTMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IEBAIC0yMTcsNiArMjE3LDEzIEBAIHN0YXRp
YyBpbnQgcXVlcnlfZW5naW5lcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAkJCQlod2UtPmxv
Z2ljYWxfaW5zdGFuY2U7DQo+ICAJCQlod19lbmdpbmVfaW5mb1tpXS5pbnN0YW5jZS5ndF9pZCA9
IGd0LT5pbmZvLmlkOw0KPiAgCQkJaHdfZW5naW5lX2luZm9baV0uaW5zdGFuY2UucGFkID0gMDsN
Cj4gKwkJCWlmICghSVNfREdGWCh4ZSkpDQo+ICsJCQkJaHdfZW5naW5lX2luZm9baV0ubmVhcl9t
ZW1fcmVnaW9ucyA9IDB4MTsNCj4gKwkJCWVsc2UNCj4gKwkJCQlod19lbmdpbmVfaW5mb1tpXS5u
ZWFyX21lbV9yZWdpb25zID0NCj4gKwkJCQkJQklUKGd0X3RvX3RpbGUoZ3QpLT5pZCkgPDwgMTsN
Cj4gKwkJCWh3X2VuZ2luZV9pbmZvW2ldLmZhcl9tZW1fcmVnaW9ucyA9IHhlLT5pbmZvLm1lbV9y
ZWdpb25fbWFzayBeDQo+ICsJCQkJaHdfZW5naW5lX2luZm9baV0ubmVhcl9tZW1fcmVnaW9uczsN
Cj4gIAkJCW1lbXNldChod19lbmdpbmVfaW5mby0+cmVzZXJ2ZWQsIDAsIHNpemVvZihod19lbmdp
bmVfaW5mby0+cmVzZXJ2ZWQpKTsNCj4gIA0KPiAgCQkJaSsrOw0KPiBAQCAtMzc3LDEzICszODQs
NiBAQCBzdGF0aWMgaW50IHF1ZXJ5X2d0X2xpc3Qoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVj
dCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeQ0KPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0u
dHlwZSA9IERSTV9YRV9RVUVSWV9HVF9UWVBFX01BSU47DQo+ICAJCWd0X2xpc3QtPmd0X2xpc3Rb
aWRdLmd0X2lkID0gZ3QtPmluZm8uaWQ7DQo+ICAJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLmNsb2Nr
X2ZyZXEgPSBndC0+aW5mby5jbG9ja19mcmVxOw0KPiAtCQlpZiAoIUlTX0RHRlgoeGUpKQ0KPiAt
CQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0ubmVhcl9tZW1fcmVnaW9ucyA9IDB4MTsNCj4gLQkJZWxz
ZQ0KPiAtCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0ubmVhcl9tZW1fcmVnaW9ucyA9DQo+IC0JCQkJ
QklUKGd0X3RvX3RpbGUoZ3QpLT5pZCkgPDwgMTsNCj4gLQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0u
ZmFyX21lbV9yZWdpb25zID0geGUtPmluZm8ubWVtX3JlZ2lvbl9tYXNrIF4NCj4gLQkJCWd0X2xp
c3QtPmd0X2xpc3RbaWRdLm5lYXJfbWVtX3JlZ2lvbnM7DQo+ICAJfQ0KPiAgDQo+ICAJaWYgKGNv
cHlfdG9fdXNlcihxdWVyeV9wdHIsIGd0X2xpc3QsIHNpemUpKSB7DQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBp
bmRleCA1MTY0ZWQxNTBhMmUuLjhlODRlZjZmZDQ2ZSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91
YXBpL2RybS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBA
IC0yMjgsNiArMjI4LDIwIEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZW5naW5lX2luZm8gew0KPiAg
CS8qKiBAaW5zdGFuY2U6IFRoZSBAZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqLw0KPiAg
CXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGluc3RhbmNlOw0KPiAgDQo+ICsJ
LyoqDQo+ICsJICogQG5lYXJfbWVtX3JlZ2lvbnM6IEJpdCBtYXNrIG9mIGluc3RhbmNlcyBmcm9t
DQo+ICsJICogZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb25zIHRoYXQgaXMgbmVhciB0aGlzIGVuZ2lu
ZS4NCj4gKwkgKi8NCj4gKwlfX3U2NCBuZWFyX21lbV9yZWdpb25zOw0KPiArCS8qKg0KPiArCSAq
IEBmYXJfbWVtX3JlZ2lvbnM6IEJpdCBtYXNrIG9mIGluc3RhbmNlcyBmcm9tDQo+ICsJICogZHJt
X3hlX3F1ZXJ5X21lbV9yZWdpb25zIHRoYXQgaXMgZmFyIGZyb20gdGhpcyBlbmdpbmUuDQo+ICsJ
ICogSW4gZ2VuZXJhbCwgaXQgaGFzIGV4dHJhIGluZGlyZWN0aW9ucyB3aGVuIGNvbXBhcmVkIHRv
IHRoZQ0KPiArCSAqIEBuZWFyX21lbV9yZWdpb25zLiBGb3IgYSBkaXNjcmV0ZSBkZXZpY2UgdGhp
cyBjb3VsZCBtZWFuIHN5c3RlbQ0KPiArCSAqIG1lbW9yeSBhbmQgbWVtb3J5IGxpdmluZyBpbiBh
IGRpZmZlcmVudCBUaWxlLg0KPiArCSAqLw0KPiArCV9fdTY0IGZhcl9tZW1fcmVnaW9uczsNCj4g
Kw0KPiAgCS8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ICAJX191NjQgcmVzZXJ2ZWRbM107
DQo+ICB9Ow0KPiBAQCAtNDAxLDE5ICs0MTUsNiBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0IHsN
Cj4gIAlfX3UxNiBndF9pZDsNCj4gIAkvKiogQGNsb2NrX2ZyZXE6IEEgY2xvY2sgZnJlcXVlbmN5
IGZvciB0aW1lc3RhbXAgKi8NCj4gIAlfX3UzMiBjbG9ja19mcmVxOw0KPiAtCS8qKg0KPiAtCSAq
IEBuZWFyX21lbV9yZWdpb25zOiBCaXQgbWFzayBvZiBpbnN0YW5jZXMgZnJvbQ0KPiAtCSAqIGRy
bV94ZV9xdWVyeV9tZW1fcmVnaW9ucyB0aGF0IGlzIG5lYXIgdGhlIGN1cnJlbnQgZW5naW5lcyBv
ZiB0aGlzIEdULg0KPiAtCSAqLw0KPiAtCV9fdTY0IG5lYXJfbWVtX3JlZ2lvbnM7DQo+IC0JLyoq
DQo+IC0JICogQGZhcl9tZW1fcmVnaW9uczogQml0IG1hc2sgb2YgaW5zdGFuY2VzIGZyb20NCj4g
LQkgKiBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbnMgdGhhdCBpcyBmYXIgZnJvbSB0aGUgZW5naW5l
cyBvZiB0aGlzIEdULg0KPiAtCSAqIEluIGdlbmVyYWwsIGl0IGhhcyBleHRyYSBpbmRpcmVjdGlv
bnMgd2hlbiBjb21wYXJlZCB0byB0aGUNCj4gLQkgKiBAbmVhcl9tZW1fcmVnaW9ucy4gRm9yIGEg
ZGlzY3JldGUgZGV2aWNlIHRoaXMgY291bGQgbWVhbiBzeXN0ZW0NCj4gLQkgKiBtZW1vcnkgYW5k
IG1lbW9yeSBsaXZpbmcgaW4gYSBkaWZmZXJlbnQgVGlsZS4NCj4gLQkgKi8NCj4gLQlfX3U2NCBm
YXJfbWVtX3JlZ2lvbnM7DQo+ICAJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gIAlfX3U2
NCByZXNlcnZlZFs4XTsNCj4gIH07DQoNCg==
