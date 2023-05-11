Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBCDC77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 13:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688FD10E4BB;
	Thu, 11 May 2023 13:04:21 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5547710E237
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683810260; x=1715346260;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GhG+6uGvMKrks7dVGmI8tG64Bsudfdg6x2tNd+KB8Xk=;
 b=LX+3Ggr64zvRSzmb9Sp31qMaXYV8ENtkgcJwPZ3SYMNApFI3586pUGRK
 GW9R4viRaU1yuqWuPo5O13ytns5dOdLmPe0Sfx/hSVVpzDEqllUt7mQr8
 Na5MUUlCcyX/FqSV+iVqG/+jfX0dVa9vnPMCusrDKU77Uuku3qMbTSZgW
 ZVhHQ5JpjPHPUkWx5wlTyfQOg0E3OgxDObGO1cLqnb3uOyAAseBFHkq/E
 LCFuWsat9/J7nSWplcXF+V8v2Nmbo0qgE6ivhL8CpIHbNhZFWej5TZQq6
 Am4lBhpRUnqp3jPuGa3p1SeC7SS/AYIyOnBWJgvK4CkO5YpegRiGXmdVp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352708015"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="352708015"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789379329"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789379329"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 05:47:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 05:47:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 05:47:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 05:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhUSh1FDm9dp+W43QACwQVWJD3StaVl55SMqtL1tjwwIZ2IIqXO5AC+6C5Zd211EWQyZ6r/zkA6fTDjoY2ZgcmxaihJhbzwrdXyn4r1SOQb//w3723JMRiYTNuyyyzyxCIEWW/QENzAGrDzJRCozIy7zXhl6i7FL16NIqbpWqqmeVL4hVWjbVcDNilsUS7K/T2mDXPKN+v0GrFenVIW9XbZcJ/Q2/77fhw1dR3CSmXnZdHxBHz9UdqB3NPd4bJ3HLytoZy7sLVvGYxyNvjdOdl5frmQfQGj3hMv3X86pA53IB5FS6TfLesLoyKh1nJazqDirtMSeoyNn+AWfO3VJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhG+6uGvMKrks7dVGmI8tG64Bsudfdg6x2tNd+KB8Xk=;
 b=IBH9hFBP7n2f306Jurut0CRU3MW4LXnlQdsNdQF/+PUPFNq7G/Qf85QChdJva1B4HlHG+fZIQm2dA0haZ1hmX28k7Oq6ipcLoKuzB1Zu+HDdTBk8AVdfn+x2PPV+7y0UKq3TxVKHhxUjOjXE89FAzrcWGrr5T8lV/osdjHS5PsMk8pm8zpIsM9kmlWVnBFn+fm1f9uTQvSIz9m+LB/DqsrHPcMB8rxMcEJBNUGzywx+03LPHHqy2TPGKO0DYWuHjWIe+FyXyVgpagw1RYRKDo47EczseMDiI+SqHYM5q0I877RE6Z89ORmA1r8Lu0NnUikiDbp/dp/CgeKizAWHjLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Thu, 11 May
 2023 12:47:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6387.021; Thu, 11 May 2023
 12:47:26 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
Thread-Index: AQHZg3lXlCg7AEmARk2GyxyIlQQR0q9VBoIA
Date: Thu, 11 May 2023 12:47:26 +0000
Message-ID: <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
In-Reply-To: <20230510195424.3045127-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6005:EE_
x-ms-office365-filtering-correlation-id: 71f4c77a-dbf6-49f7-2684-08db521ddfa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eDDEjXLxKgZIEQ194dblJglwZkIpxJIeQwLMnMZJyV52Z96vEhu+peXgW4gxXGVX792Rrhkn5H+DWac0pfYOzafY8XAN9AXVnodBTDbr5d8QzBwaH6vihqmT90LCmbkVE00FOInoJxtrH6P57E8HMhuZyH5/E/wmCD+idLN/Dv2Fzd0o0sXTAmySBD3t7NQk6cTpt0fBUfYdlQm/UPAWVx3AodBOfw/X+RGwo36+0H8Enk9NEtIv4R1JuKkmiJunVcq1rX5456Vl524t9564ew8yO49G+UuTYXso4DpxVVRiTW3WpLYJXHuBIur8EkfNOVVO/HWEj4hkgBxxiwv8ZLClTTves37zalOxKmkocMzfYEwfN2FeOU+SD3yw3+tPKHkgaPOMElMa1+e+I2k4H3mt0Zsv/9h72YzkbdQLmE5GGZSTg/sLlSDxgoI9fRvnDEjjPhNBYdsPPHZ1UDZSSTzLrFvTN1WvmqAod4+OE2sB5Or7xSmbQrFKUAmmiZ8uFkjNeJFP0mus+nZNhJH4cHEv0ptIQHbXG/kI6LNUE0gYkhp4HiOeF1aQAjmL2tDn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(5660300002)(110136005)(6486002)(8936002)(71200400001)(41300700001)(966005)(316002)(8676002)(26005)(6512007)(6506007)(76116006)(478600001)(66446008)(66476007)(91956017)(66946007)(66556008)(6636002)(64756008)(186003)(83380400001)(2616005)(2906002)(122000001)(82960400001)(38070700005)(86362001)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3Y3NWw0cW83dU1jZlhGMGxla0I2S3ZCam1BUzRXU05UREJpYUtYMWlQNVly?=
 =?utf-8?B?M2h4Q04xL2FhWkptVmhCNUszYXQ3b3BXdW1rQjcxU3R0bkNTUSsvQUgyQlRT?=
 =?utf-8?B?OGo2U3JVWTlhTHI4RzB0RnBuNmFkRWd4SjY5TUViY0VLTTBtT09VblJ4YXN5?=
 =?utf-8?B?MDRBSG4waTU0UDJPaFRsZzAxVmNIQW5QLy9xNzRoNTNITG1ld1FVMCtjYkw2?=
 =?utf-8?B?dWMvTEhwSldneVQvdThvVmFsZUE5OG5SWVA2Y0ZCQTBEMUIwN2JvOUpaK3Rw?=
 =?utf-8?B?WlhURkxxMm90UXVHNFhNcThpK0tVbXBHVnNLMEpweGkrbGVtZDkrRW1LSkp3?=
 =?utf-8?B?U2E0Vmc2N0k4ZC9SWm9oY3ErNXdqM3VGY3dnd3NhSHBVRTAvV2M5TUV0alRG?=
 =?utf-8?B?TFBzWkIvbGlvUjlMMzkza2c0TGtSWm42Tm1TUlE4RW95U0tRbXoxbjhXWm9W?=
 =?utf-8?B?cXZ4djB3SFJZcDZBVGdiRHZRZmR1eXphUndTU0hrNStNbEtGYnpuMEdmSWgv?=
 =?utf-8?B?QkJrQWJjQWp0UllhMHdYczNhcDNZZTJscUJvdUFaNGgydGxta1djTm9wRXJ6?=
 =?utf-8?B?ZDB2QU1oTk9wbFQ4T1dsV01QZHZZa0hvdjV1Zk92RlhONUpBQTdpeE50MWg0?=
 =?utf-8?B?amczbGtFZlBuNnk3U2YxOUFYM1hWajd2dFNqeHdGSXZwZ09YbmJiQ1pRcE1o?=
 =?utf-8?B?NHJzL3lrSEdUK0E5T3B6VzdpVlNSNjUwV0ppNUZuVkoyd3pDYUJ0d2IwbEM0?=
 =?utf-8?B?L3RKK1h0NDVWaFBjNmlZVzBkWk1yNG1Ha3FPdkZ2U2RnSmJManNnRjhmS0NT?=
 =?utf-8?B?TC9UUW8zc01JY016ZXZ0T2xicU5RUmpQd2tNSFFpMm5kZWZOeElpRzUrbjlN?=
 =?utf-8?B?eHRId2pEdWJ4OEdQTng4VEZGYUdqeHVzVnZpTmE0R3dkKzlKVml1a1E0dFcv?=
 =?utf-8?B?aGg1ekFBWDkzMjZSbXNrNUdRMlJxOUVkUWRuZnhQN2E3Z0UrZExxVTRNUmxh?=
 =?utf-8?B?aTRkcHMvbVcrNUpGbDVKRktZKy9oZnk5bjFVMDVHb2JXSlF5TlI3V1VWS3hv?=
 =?utf-8?B?Rm1XakNUK1FqV1FMYmRDQ1p3ZjZxRUkwcjYvVWpaRSt3cFEwSU9pVFN5MDlw?=
 =?utf-8?B?LzNXcVZvZCtTcHVIQzZZSjZIM1VhREZrNFJQaEQzVDZSVVhjWjZkMkVFa3JN?=
 =?utf-8?B?aEtTZnJad1M5amRVMDZVeU5uNjRGcmJDWURZUytXaVpMUC9kbTVWVERWUDBj?=
 =?utf-8?B?OVB3c3UxQll1RzYzWnJHUkU5SFR3ZW5TY01vSEU1S1hyazFFenZLU0NTeXg2?=
 =?utf-8?B?bHQ5QUdudTk2RGZJc2FkMlhoZkNqY3VVaEdtOG1PT01qdXRpc0pnT1NTNDhS?=
 =?utf-8?B?aXNVWVE0UEJHV0ZjTzVDNDVLR2l0cGxIQm50bjk4WFZyM0t6Z1BCQVRhc1hk?=
 =?utf-8?B?b09UQkZ1aERORU9yK2RZdHpIc2RYdzJmNnU0NTlRcVZCaWN0QlprY2xnM0Rl?=
 =?utf-8?B?K21QNkpaazZtaU55M3BCRy9nRlE0allydTBOK1d0ODdZekRPdmsxU1pLNEQv?=
 =?utf-8?B?WGNkTk93TjF0SzB5N1FhYm1BNGtyakRHM0w1UHhMalA0bjJYdnhRbUhCQ3hS?=
 =?utf-8?B?Q2R2aFh0VmxJY01KV25VN0ZlbjRQVWxMdzBYZ0kwb1BUSllzOGxKWXVNaGFW?=
 =?utf-8?B?U0JWUHJFSmNucTJtUHFQejRzd3pCZVpwemhHc1VBdkZKSzJGNlBQSnBkelk3?=
 =?utf-8?B?OEYwRmRZcENxaFZGOHZxaHZqcGRRT2NVNlZaeUNGVzZEMU1CMUJHVm5HRTlH?=
 =?utf-8?B?dXMvc0N6YWllWUhnSHVITmRXclZ1dlAydkp6WUJ2ekxDYzh4cHhIc2JZMEhM?=
 =?utf-8?B?aXpKbXR2ZUxObWphckdmMFlHK3RzalpnbkMrWmNVL2pQb0MxUEJ1MkNRODZN?=
 =?utf-8?B?OXE4d24zYnFJWlJkL0FFN2tQZ3ZOWldzNTh0UC9XYnQ2eUtPblBDNGorQ0tT?=
 =?utf-8?B?T0NiazVuanR5emZhSyttZEFRM3ArbHlGUXB6ZzRScEZweGdqTDAyTkFRWFpG?=
 =?utf-8?B?eC9BSWhoTkR6WEt1ajZMdDl2SHBweVdpeDExUU9XYm5saUJjRmIrZ3Y1Znor?=
 =?utf-8?Q?mUBwewD+Hk1rPN9akJKaVPfEt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F0C6EB0F29C2F47B576B1A20DE37A46@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f4c77a-dbf6-49f7-2684-08db521ddfa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 12:47:26.2506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ASDXJPLKCB5J1bdFRI6sRWfBs6lNWYXihSOaCThB4ZGQ6WWH89AtCsEx46eZzDWrFnBEKSM0/DLxkT90K1CkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6005
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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

T24gV2VkLCAyMDIzLTA1LTEwIGF0IDEyOjU0IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IFN0b3AgdGhlIGRhbmNlIG9mIGVuYWJsaW5nIHRoZSBkaXNwbGF5LXJlbGF0ZWQgZHJpdmVy
X2ZlYXR1cmVzIHRvIGxhdGVyDQo+IGRpc2FibGUgdGhlbSBvbiBkaXNwbGF5IGluZm8gaW5pdCBp
ZiB0aGUgcGxhdGZvcm0gZG9lc24ndCBoYXZlIGRpc3BsYXkNCj4gSVAuIEJlc2lkZXMgYmVpbmcg
bmVlZGxlc3Mgd29yaywgaXQgd2Fzbid0IGNvdmVyaW5nIHRoZSBBVFMtTSBjYXNlIHRoYXQNCj4g
aXMgdGhlIHNhbWUgcGxhdGZvcm0gYXMgREcyLCBidXQgd2l0aG91dCBkaXNwbGF5Lg0KDQpYZSBz
aG91bGQgc2V0IHBpcGVfbWFzayA9IDAgYW5kIGNhbGwgaTkxNSBmdW5jdGlvbnMgdGhhdCB3aWxs
IGhhbmRsZSBubyBkaXNwbGF5IGNhc2VzLg0KQWxzbyBpbnRlbF9kZXZpY2VfaW5mb19ydW50aW1l
X2luaXQoKSBuZWVkcyB0byBiZSBjYWxsZWQgZWFybGllciwgYXMgcGlwZXMgY291bGQgYmUgZnVz
ZWQgb2ZmIGFuZCB0aGVyZSBpcyBhIGNhc2UgZm9yIGRpc2NyZXRlIHBsYXRmb3JtcyB3aXRoIGRp
c3BsYXkNCj49IDE0IHRoYXQgY2FuIGhhdmUgZGlzcGxheSBmdXNlZCBvZmYgdG9vLg0KDQo+IA0K
PiBTaW5jZSBub3cgdGhlIGRpc3BsYXkgaXMgY3JlYXRlZCBhZnRlciB0aGUgY29tcGxldGUgZGV2
aWNlIGluZm8gaXMNCj4gcG9wdWxhdGVkLCB0aGUgbmV3IGhhc19kaXNwbGF5IGZsYWcgY2FuIGJl
IGNvbnNpZGVyIHRvIGVuYWJsZSBpdC4NCj4gDQo+IFJlZmVyZW5jZXM6IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzI2NQ0KPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgIHwgMSAtDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGlzcGxheS5jIHwgNiArKysrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
Y2kuYyAgICAgfCA2ICsrKysrLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+IGluZGV4IDMyY2M4
M2M0M2IyYS4uMWRhYWNjNTMzMDgzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+IEBA
IC0xOTIsNyArMTkyLDYgQEAgc3RydWN0IHhlX2RldmljZSAqeGVfZGV2aWNlX2NyZWF0ZShzdHJ1
Y3QgcGNpX2RldiAqcGRldiwNCj4gIAl4ZS0+aW5mby5kZXZpZCA9IHBkZXYtPmRldmljZTsNCj4g
IAl4ZS0+aW5mby5yZXZpZCA9IHBkZXYtPnJldmlzaW9uOw0KPiAgCXhlLT5pbmZvLmVuYWJsZV9n
dWMgPSBlbmFibGVfZ3VjOw0KPiAtCXhlLT5pbmZvLmVuYWJsZV9kaXNwbGF5ID0gZW5hYmxlX2Rp
c3BsYXk7DQo+ICANCj4gIAlzcGluX2xvY2tfaW5pdCgmeGUtPmlycS5sb2NrKTsNCj4gIA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kaXNwbGF5LmMNCj4gaW5kZXggNzdhMTU4ZWNmNGNiLi40M2M1YWYxZmY4MGUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kaXNwbGF5LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuYw0KPiBAQCAtNDg3LDggKzQ4NywxMCBAQCBf
X2RpYWdfaWdub3JlX2FsbCgiLVdvdmVycmlkZS1pbml0IiwgIkFsbG93IGZpZWxkIG92ZXJyaWRl
cyBpbiB0YWJsZSIpOw0KPiAgDQo+ICB2b2lkIHhlX2Rpc3BsYXlfaW5mb19pbml0KHN0cnVjdCB4
ZV9kZXZpY2UgKnhlKQ0KPiAgew0KPiAtCWlmICgheGUtPmluZm8uZW5hYmxlX2Rpc3BsYXkpDQo+
ICsJaWYgKCF4ZS0+aW5mby5lbmFibGVfZGlzcGxheSkgew0KPiArCQl1bnNldF9kcml2ZXJfaG9v
a3MoeGUpOw0KPiAgCQlyZXR1cm47DQo+ICsJfQ0KPiAgDQo+ICAJc3dpdGNoICh4ZS0+aW5mby5w
bGF0Zm9ybSkgew0KPiAgCWNhc2UgWEVfVElHRVJMQUtFOg0KPiBAQCAtNTM1LDcgKzUzNyw3IEBA
IHZvaWQgeGVfZGlzcGxheV9pbmZvX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAJCXhl
LT5pbmZvLmRpc3BsYXkgPSAoc3RydWN0IHhlX2RldmljZV9kaXNwbGF5X2luZm8pIHsgWEVfTFBE
UCB9Ow0KPiAgCQlicmVhazsNCj4gIAlkZWZhdWx0Og0KPiAtCQlkcm1fZGJnKCZ4ZS0+ZHJtLCAi
Tm8gZGlzcGxheSBJUCwgc2tpcHBpbmdcbiIpOw0KPiArCQlkcm1fd2FybigmeGUtPmRybSwgIlVu
a25vd24gZGlzcGxheSBJUFxuIik7DQo+ICAJCXhlLT5pbmZvLmVuYWJsZV9kaXNwbGF5ID0gZmFs
c2U7DQo+ICAJCXVuc2V0X2RyaXZlcl9ob29rcyh4ZSk7DQo+ICAJCXJldHVybjsNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wY2kuYw0KPiBpbmRleCA3ZGZiYzRmYTEzOGEuLjNmYTNlODcwNmQ5OCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wY2kuYw0KPiBAQCAtNTI5LDYgKzUyOSw5IEBAIHN0YXRpYyBpbnQgeGVfaW5mb19pbml0
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCXhlLT5pbmZvLmhhc19yYW5nZV90bGJfaW52YWxp
ZGF0aW9uID0gZ3JhcGhpY3NfZGVzYy0+aGFzX3JhbmdlX3RsYl9pbnZhbGlkYXRpb247DQo+ICAJ
eGUtPmluZm8uaGFzX2xpbmtfY29weV9lbmdpbmUgPSBncmFwaGljc19kZXNjLT5oYXNfbGlua19j
b3B5X2VuZ2luZTsNCj4gIA0KPiArCXhlLT5pbmZvLmVuYWJsZV9kaXNwbGF5ID0gSVNfRU5BQkxF
RChDT05GSUdfRFJNX0RJU1BMQVkpICYmIFwNCj4gKwkJCQkgIGVuYWJsZV9kaXNwbGF5ICYmIFwN
Cj4gKwkJCQkgIGRlc2MtPmhhc19kaXNwbGF5Ow0KPiAgCS8qDQo+ICAJICogQWxsIHBsYXRmb3Jt
cyBoYXZlIGF0IGxlYXN0IG9uZSBwcmltYXJ5IEdULiAgQW55IHBsYXRmb3JtIHdpdGggbWVkaWEN
Cj4gIAkgKiB2ZXJzaW9uIDEzIG9yIGhpZ2hlciBoYXMgYW4gYWRkaXRpb25hbCBkZWRpY2F0ZWQg
bWVkaWEgR1QuICBBbmQNCj4gQEAgLTYyOSw3ICs2MzIsNyBAQCBzdGF0aWMgaW50IHhlX3BjaV9w
cm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVu
dCkNCj4gIA0KPiAgCXhlX2Rpc3BsYXlfaW5mb19pbml0KHhlKTsNCj4gIA0KPiAtCWRybV9kYmco
JnhlLT5kcm0sICIlcyAlcyAlMDR4OiUwNHggZGdmeDolZCBnZng6JXMgKCVkLiUwMmQpIG1lZGlh
OiVzICglZC4lMDJkKSBkbWFfbV9zOiVkIHRjOiVkIiwNCj4gKwlkcm1fZGJnKCZ4ZS0+ZHJtLCAi
JXMgJXMgJTA0eDolMDR4IGRnZng6JWQgZ2Z4OiVzICglZC4lMDJkKSBtZWRpYTolcyAoJWQuJTAy
ZCkgZGlzcGxheTolcyBkbWFfbV9zOiVkIHRjOiVkIiwNCj4gIAkJZGVzYy0+cGxhdGZvcm1fbmFt
ZSwNCj4gIAkJc3VicGxhdGZvcm1fZGVzYyA/IHN1YnBsYXRmb3JtX2Rlc2MtPm5hbWUgOiAiIiwN
Cj4gIAkJeGUtPmluZm8uZGV2aWQsIHhlLT5pbmZvLnJldmlkLA0KPiBAQCAtNjQwLDYgKzY0Myw3
IEBAIHN0YXRpYyBpbnQgeGVfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBz
dHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPiAgCQl4ZS0+aW5mby5tZWRpYV9uYW1lLA0KPiAg
CQl4ZS0+aW5mby5tZWRpYV92ZXJ4MTAwIC8gMTAwLA0KPiAgCQl4ZS0+aW5mby5tZWRpYV92ZXJ4
MTAwICUgMTAwLA0KPiArCQlzdHJfeWVzX25vKHhlLT5pbmZvLmVuYWJsZV9kaXNwbGF5KSwNCj4g
IAkJeGUtPmluZm8uZG1hX21hc2tfc2l6ZSwgeGUtPmluZm8udGlsZV9jb3VudCk7DQo+ICANCj4g
IAlkcm1fZGJnKCZ4ZS0+ZHJtLCAiU3RlcHBpbmcgPSAoRzolcywgTTolcywgRDolcywgQjolcylc
biIsDQoNCg==
