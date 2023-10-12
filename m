Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BCDCDB482
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 04:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2954A10E404;
	Thu, 12 Oct 2023 04:02:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBE010E404
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 04:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697083322; x=1728619322;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zgLK4XdmP18xUAo8+k/BnhKVh0xOEnG7Fnl4CmKqUyk=;
 b=OxaLBSnH6WYIvpYMT5k5vrKd29qOB/XufKNmvmQfoK17sbT6LCf+IW16
 l3bUPj73CpCVBMcGut30JdcZ8+jEkYkjXpVFgPlxgs/aDcjnSuJpkGfCr
 d3C0I4QpYNEhWQKYvONgSDT8t+0qCa2psKhr5fx60dHtKRvk1ruyAGkdO
 FwZBnP7bIF/pBbHXP6mw58UtbzFXZgFjjTQOLgxA8LVsDkNbFYSMxvOlc
 HVp5ZsUXlmU+LG9N1QEcMh+GNEyYfGURravucxvra00UILpo4uqKm1P60
 LCqbQfxkbqvAvIryoUYNo1lYTLxPLprhWw6zISs5QLAW81HcRbKkGF5M+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364193048"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="364193048"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 21:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="819979842"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="819979842"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 21:01:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 21:01:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 21:01:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 21:01:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIKcdayl1HWN1pxjqj2ZdNlT15Sx8Yq9RD83egtarq89Qlsnv6pccUgn63vGckNkrQWWvYFwkdZKCcVN9ClSKdB0cllUEZwxIQiFg1ra4H+HrflhgEregVMTKLmdJ9tUqgc1WinYErBK1LhT+d+IXqTQzi5+fQSsGlVZZnOUnjpoPjkkEnRQPMoKzXNv+qAoNTwM3iAr4AhQ49hLrFOpZqQIpDhAw13DutKk8POooZ7WNF2GkhZ9hyu1iTOi6VoEu8ir3wTnQZphuTpeMvPHc+T6F10sO3QmUfrF75w7CoLbCCnSjop8sDcBtM3UI84OpC4HlHIVBrtKfCi3r8NzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgLK4XdmP18xUAo8+k/BnhKVh0xOEnG7Fnl4CmKqUyk=;
 b=mYvohIAIxnZ7WkHPldSA4qcdL+n3fMfFGzqE/rzc5MixNM0KaWzKSMFHvmHb8B1KCb8oydK7Zke8ezYfTfpoYmxLJkDszYq8Rf+NclFKkVmdgNfIdl+kOA1M07ElrQm0OVnRO/Vz8rL9BSkTAI3aV4W/jJxGSjHaFASlYaiUViueC7afx8eqk+CeKHuFxoailV5upZcOtV1kFnDpuyp4x91qOc11tMsokvNLFSvlrWecOUpNbmJ5tdyhKcsH3KxBJi1oqD3MbhI+GKo7PYLpKJmpUvArdZQvxJxLcn6+k2XVIUA1X0cidtXqbbaGcx+qqlQq1uXQkv/GT08Qr0rpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 04:01:53 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%6]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 04:01:53 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 10/11] drm/xe: Clear SOC CORRECTABLE error
 registers.
Thread-Index: AQHZ8Tdt4HxmYioqckCBH0d/YUqlkbBEO3GAgAAA/4CAAVF0gIAAET5g
Date: Thu, 12 Oct 2023 04:01:53 +0000
Message-ID: <MW4PR11MB7056B70BB65FDB92EB74BD7BB3D3A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-11-himal.prasad.ghimiray@intel.com>
 <c083d229-bfc1-4acc-421f-246d9be66f07@linux.intel.com>
 <ba352668-c77f-4b65-b487-ac18edaf26e8@intel.com>
 <ce44d9f3-deb6-33a6-a955-db3d8ec60da7@linux.intel.com>
In-Reply-To: <ce44d9f3-deb6-33a6-a955-db3d8ec60da7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|PH0PR11MB4901:EE_
x-ms-office365-filtering-correlation-id: 37de14b1-55d2-4e26-c50f-08dbcad7f84c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ion/JL01rZIHqki2t3jpPpa+dLWAGglzVFcg3zLtVsvuM7D/Ngr6892KKljuxaAyDIoCUOSHI2/CUvRkIhSHpPgZ2ZDq1c+6RrE/nXGeyRxO+/Is0pc0diS0l+qvi25Vd2jH/ibk5T/F++vSnhdQuVfg+C0MlRxy9PY2y2CO9mVIoCVXJyKaz7QrLqXAyigiZt1iZ105W88zuWqXQS2CCn/iV+VZ/NC/oIukOLIBhWrHqf/tf6xmQUk3m3M7V+2jqgl4MXwpVEV1yHmTJqbLq65Qm1tGdVJ119MkDy4fl8K5JGGBuGaCit3uWdC/wxpYgH0W2OF3zINrT826AL51K7vG3bh7yhaWGLnVJbW5XPZuQD+vLxvHBd9czGXbrmmfi+5yckOocDMY90yB44XEjYyqZ1NSXL6ZDhvFwNgu+dkrgzswOcm9oT6pd8HIC2IdekrznTfR3pg5bSCv091TF7H1+D1KTEGiDg+6x0TwIIYsB86qUxjU3nW+qI+lBV3YOiM3nEiaVMUKDIkd+6vmYPuzZJOYO3TH9uclbf9Eij36ZSIgwfTl2WlKWR4y5t0d2SSG14GjisN7+rGhun5dZ/1PUEouj27JGPTQNut/+XH/NXXBbRid8S9oCGJMzgf+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(82960400001)(122000001)(71200400001)(8676002)(2906002)(8936002)(5660300002)(52536014)(478600001)(7696005)(6506007)(53546011)(86362001)(9686003)(33656002)(41300700001)(38070700005)(38100700002)(83380400001)(76116006)(316002)(66946007)(26005)(64756008)(66476007)(66556008)(66446008)(110136005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGtFVGI1QnlGamV6NEpNSDBzdnU1N0N6VnZUNWZKQ0VobDUxUDlDQmVXTjhq?=
 =?utf-8?B?M1kyNUxVb1RranpMRHkwdWZ0YXZlQkpvVWFNSEhNaDdKYlRqSldQdzVFSXlH?=
 =?utf-8?B?NDQxZzBLL1Zsb29lUlZPWVVMWUw5M09WMlFXNm94R1JtNDl4MDBOVXJFdEwv?=
 =?utf-8?B?ZmlrNjYyRGRYbFkrbFkxQ3VvZXo4b3dnS3FtcU9WUWRtRmFkZGJOeS9hVzRQ?=
 =?utf-8?B?SHFIN2FrTnFPQnkrdXpYRnlOTDNuNi9mYjJobllvNzFZNTVONXlrSTJRQjg1?=
 =?utf-8?B?NG15MHhzaVRMREFTYUhZTXhERzJNZGhTUzFFbWxNelhHVkRsR0pBYUdFUEtO?=
 =?utf-8?B?TmhaVXcwT09JeG01cnRKOTNYTzBlM1pWcjZVNXJqUFpHamw0VHJmcXA2U0pK?=
 =?utf-8?B?Ukp2cWFlN0RJZ3laMktvWmU2Wi9xMU9lTzV2UkVscTNiUXFxWENKSGQ4RS9v?=
 =?utf-8?B?eXN4ZnFVME1RU280NkZvUmRNOEV0QnhJZzg3Vk9ZM1V1YWVhc0hCcEpla21T?=
 =?utf-8?B?TVdqcVY5eUtuSWRYRlJ5UHJkdEpycHVvM1FuWlFJNTBmZno2aGRZL0ZZNjZy?=
 =?utf-8?B?NlFNL25QZ1psblFZd3lSN1JtYWhMNEFjVmkvaGw0U0ZGK0dka1piaFR0VU5m?=
 =?utf-8?B?WnU3U1dNT1VFMlROOFJuR2Zrd0pOV1RyQndya216QlJOZlphOHJZbHEvNW1q?=
 =?utf-8?B?ekljM0F6S1Q5VTBocEFPYjVsSmZBSEtYRzQ2L2Ntcm12c0RMNm52SEtEVkJ0?=
 =?utf-8?B?dWRmTzFIZTFxTkM5c1RLZlcwc0plYkVSTTZXbXdDOGhJbHZpaGlRem1Lb254?=
 =?utf-8?B?SWNSNmtvbU5ML0RvZCtvWjNqTHlZQjdydjF2UklZQnJGWDJSeFoyZG9RRUVk?=
 =?utf-8?B?ZGpWMm1LS3JDa2NqTFM2RU1Mbm5LYnlvUWdUTldxRm1RSG8rTi9IZG8reGdP?=
 =?utf-8?B?eHZ0d096cFRXa0c2RklUcTliVzFBcWwzb2k5MzdxWXduS0JrRWptOElGTnBr?=
 =?utf-8?B?d2dmZkxmSjV5SXhiMmg0V3dxMytEZkxuYjlIOGxhWnBPVllyVEZRd1VHMUFP?=
 =?utf-8?B?S3NHQmlENVJpRzBkQ1JqSVJJWEliVDVhZndKc2o3N3h5cko1SnpBalpLaUo5?=
 =?utf-8?B?alIwUVNoZE9IVmd4NTRCVHJsOXJYbk00V1QyMEVGVjFNVkFaa24zek81WlJp?=
 =?utf-8?B?eWdpbVFFUDJ5bDBteHNnNjUza20rQU5tSG1jTUNFUnBHdFYxb01tbmZFaWFY?=
 =?utf-8?B?UDZaRGFTcEZyRElZUTVGdUZpTG9VVjJlRENHYkFmRGFwSmFmVHVnWWwxUGd3?=
 =?utf-8?B?RXh5V1ZGcWV1WHBQcU9TUXFuWDhqa3hJMVNkTEZ2dDdFa1kyUGtlbVo3YlIw?=
 =?utf-8?B?ZWhnNkZDdktmc1B0ZEFFa0lNNEFsNEVWQUlzMUYxc1Nxalh4YU56SlVmcUlG?=
 =?utf-8?B?ZzRPdEJBUC9YZ2xhbUpuRFoxcjhWazFvTGxtWUNNa21JZmJRRDB5LzUwTUlH?=
 =?utf-8?B?UjlheGQxVTJQQkl4OG5OR0FZZ0ZJZVdKaXFUdHZpaVh3WHZjSFNCQlBnZzlO?=
 =?utf-8?B?bVl4Z3dUbVYzZktMVEZ6c0VtZStxWEhObnFXTm80TTVIS1NSemExUVZ6YUxK?=
 =?utf-8?B?Q2ttLzBsVzZxbjZIOTJTYWsybkdwVUV1L3psaENVYmEvdTdOb2lqZU1sVUZZ?=
 =?utf-8?B?OU1ZUHJNVDAxQUpHd2MyT2pQQ1RBajhXT082dHZ6NFQzM1FjMnZva09kdUk1?=
 =?utf-8?B?TzFpSXhrSUc5aHpjOG5HVEVvTTk5TTRjT0cwaUdkbGpZMDRVendRM0lCVnhx?=
 =?utf-8?B?Yk1ycTdBVW5QUXl4L2hIc09VRnY4ZHBBZlhxQkcyc1lXek1YbVN5d2gvNkk4?=
 =?utf-8?B?Qk0xTW1INSswOXduU2dZT2RVdVBFOU11SE02WGx1Sk5seUZtTVp0akZWTjZY?=
 =?utf-8?B?K3BFTnlsNzZrMkIxVHNsOVN6TlBlM0krTW9KTGdCenpmZlpscml2d25UaGF3?=
 =?utf-8?B?cE05M1c1RVIxSTZ2SWNBYXZqNTNmZm5mL3FXanMyK2lZNGlXS1dub3lqZW1U?=
 =?utf-8?B?Z280aThibnRaWmxJQ29FenNYNk5ZMHJkREQxSWdDTGc0ajJxeFRJYVlwRUY1?=
 =?utf-8?B?TkxRcGtjTXcxeVpaTGorVGpzTFZNTHp0c3F6WDZGSDFKb0JVUnFNQWFkR2w4?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37de14b1-55d2-4e26-c50f-08dbcad7f84c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 04:01:53.5614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HS1Qvc05BbSEwTYIJSJ7fACGxJfAwlGM16EJPn8GkwHBEIfMgs8FHVfeN47iV80A3sw4LuNS0ddaO0OwkTjIfbfWftAva/aCAIueglCrK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/11] drm/xe: Clear SOC CORRECTABLE error
 registers.
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJhdmluZCBJZGRhbXNl
dHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAxMiBPY3Rv
YmVyIDIwMjMgMDg6MzANCj4gVG86IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQgPGhpbWFsLnByYXNh
ZC5naGltaXJheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQQVRDSCAxMC8xMV0gZHJtL3hlOiBDbGVhciBT
T0MgQ09SUkVDVEFCTEUgZXJyb3INCj4gcmVnaXN0ZXJzLg0KPiANCj4gDQo+IE9uIDExLzEwLzIz
IDEyOjIyLCBHaGltaXJheSwgSGltYWwgUHJhc2FkIHdyb3RlOg0KPiA+DQo+ID4gT24gMTEtMTAt
MjAyMyAxMjoxOCwgQXJhdmluZCBJZGRhbXNldHR5IHdyb3RlOg0KPiA+PiBPbiAyNy8wOS8yMyAx
NzoxNiwgSGltYWwgUHJhc2FkIEdoaW1pcmF5IHdyb3RlOg0KPiA+Pj4gUFZDIGRvZXNuJ3Qgc3Vw
cG9ydCBjb3JyZWN0YWJsZSBTT0MgZXJyb3JzLCBpZiB3ZSByZWNlaXZlIE1TSSBkdWUgdG8NCj4g
Pj4gc3RhdGVtZW50IGxvb2tzIGluY29tcGxldGUvaW5hcHByb3ByaWF0ZSwNCj4gPj4NCj4gPj4g
YmV0dGVyIHJlcGhyYXNlIHRvICJQVkMgZG9lc24ndCBzdXBwb3J0IGNvcnJlY3RhYmxlIFNPQyBl
cnJvciByZXBvcnRpbmciDQo+ID4gb2suDQo+ID4+DQo+ID4+IFRoYW5rcywNCj4gPj4gQXJhdmlu
ZC4NCj4gPj4+IGNvcnJlY3RhYmxlIGVycm9yLCBjbGFzc2lmeSB0aGVtIGFzIFVuZGVmaW5lZCBh
bmQgY2xlYXIgdGhlIHJlZ2lzdGVycy4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBIaW1h
bCBQcmFzYWQgR2hpbWlyYXkNCj4gPj4+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29t
Pg0KPiA+Pj4gLS0tDQo+ID4+PiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYyB8
IDI0ICsrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4gPj4+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2Vycm9yLmMNCj4gPj4+IGluZGV4IGRjZjM5NWJkOTg1Zi4uMGJjYjFiZWE3ZmZi
IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4g
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lcnJvci5jDQo+ID4+PiBAQCAtNjE2
LDkgKzYxNiwzMCBAQCB4ZV9zb2NfaHdfZXJyb3JfaGFuZGxlcihzdHJ1Y3QgeGVfdGlsZSAqdGls
ZSwNCj4gPj4+IGNvbnN0IGVudW0gaGFyZHdhcmVfZXJyb3IgaHdfZXJyKQ0KPiA+Pj4gwqAgwqDC
oMKgwqDCoCBsb2NrZGVwX2Fzc2VydF9oZWxkKCZ0aWxlX3RvX3hlKHRpbGUpLT5pcnEubG9jayk7
DQo+ID4+PiDCoCAtwqDCoMKgIGlmICgodGlsZV90b194ZSh0aWxlKS0+aW5mby5wbGF0Zm9ybSAh
PSBYRV9QVkMpICYmIGh3X2VyciA9PQ0KPiA+Pj4gSEFSRFdBUkVfRVJST1JfQ09SUkVDVEFCTEUp
DQo+ID4+PiArwqDCoMKgIGlmICgodGlsZV90b194ZSh0aWxlKS0+aW5mby5wbGF0Zm9ybSAhPSBY
RV9QVkMpKQ0KPiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4gPj4+IMKgICvCoMKg
wqAgaWYgKGh3X2VyciA9PSBIQVJEV0FSRV9FUlJPUl9DT1JSRUNUQUJMRSkgew0KPiA+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBQVkNfTlVNX0lFSDsgaSsrKQ0KPiA+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfbW1pb193cml0ZTMyKGd0LCBTT0NfR1NZU0VWVENUTF9S
RUcoYmFzZSwNCj4gPj4+ICtzbGF2ZV9iYXNlLCBpKSwNCj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB+UkVHX0JJVChod19lcnIpKTsNCj4gPj4+ICsNCj4gPj4+
ICvCoMKgwqDCoMKgwqDCoCB4ZV9tbWlvX3dyaXRlMzIoZ3QsIFNPQ19HTE9CQUxfRVJSX1NUQVRf
TUFTVEVSX1JFRyhiYXNlLA0KPiA+Pj4gK2h3X2VyciksDQo+ID4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFJFR19HRU5NQVNLKDMxLCAwKSk7DQo+ID4+PiArwqDCoMKgwqDCoMKg
wqAgeGVfbW1pb193cml0ZTMyKGd0LCBTT0NfTE9DQUxfRVJSX1NUQVRfTUFTVEVSX1JFRyhiYXNl
LA0KPiA+Pj4gK2h3X2VyciksDQo+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFJFR19HRU5NQVNLKDMxLCAwKSk7DQo+ID4+PiArwqDCoMKgwqDCoMKgwqAgeGVfbW1pb193cml0
ZTMyKGd0LA0KPiA+Pj4gK1NPQ19HTE9CQUxfRVJSX1NUQVRfU0xBVkVfUkVHKHNsYXZlX2Jhc2Us
IGh3X2VyciksDQo+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJFR19HRU5N
QVNLKDMxLCAwKSk7DQo+ID4+PiArwqDCoMKgwqDCoMKgwqAgeGVfbW1pb193cml0ZTMyKGd0LA0K
PiA+Pj4gK1NPQ19MT0NBTF9FUlJfU1RBVF9TTEFWRV9SRUcoc2xhdmVfYmFzZSwgaHdfZXJyKSwN
Cj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUkVHX0dFTk1BU0soMzEsIDAp
KTsNCj4gPj4+ICsNCj4gPj4+ICvCoMKgwqDCoMKgwqDCoCBkcm1faW5mbygmdGlsZV90b194ZSh0
aWxlKS0+ZHJtLCBIV19FUlINCj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiVGls
ZSVkIFVuZGVmaW5lIFNPQyAlcyBlcnJvci4iLA0KPiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHRpbGUtPmlkLCBod2Vycl90b19zdHIpOw0KPiA+PiBJIHN0aWxsIGZlZWwgaW4gdGhp
cyBzY2VuYXJpb3MgYXQgbGVhc3Qgd2Ugc2hhbGwgZmxhZyB0aGlzIGFzDQo+ID4+IGRybV9lcnIs
IHNpbmNlIGV2ZW4gdGhvdWdoIGl0IGlzIGNvcnJlY3RhYmxlIGFuZCBjb3JyZWN0ZWQgYnkgSFcs
DQo+ID4+IGFyZW4ndCB0aGV5IHNwdXJpb3VzIGFzIHdlIGRvbid0IGV4cGVjdCB0byByZWNlaXZl
IHRoZW0gYW5kIGEgSFcNCj4gbWlzYmVoYXZpb3VyLiBUaG91Z2h0cz8NCj4gPg0KPiA+IEFncmVl
ZC4gSU1PIHRoaXMgY2hhbmdlIHNob3VsZCBiZSBwYXJ0IG9mIGxvdyBkcml2ZXIgZXJyb3IgcmVw
b3J0aW5nLg0KPiA+IE5vdCBvbmx5IFNPQywgd2UgbmVlZCB0byByZXBvcnQgb3RoZXIgZ3QgYW5k
IHRpbGUgZXJyb3JzDQo+IA0KPiB0aGUgY2F0ZWdvcnkgd2lsbCBiZSBhZGRlZCBhcyBwYXJ0IG9m
IGxvdyBsZXZlbCBkcml2ZXIgZXJyb3IsIGJ1dCB0aGUgc2luY2UgeW91DQo+IGFyZSBhZGRpbmcg
dGhlIHByaW50LCBzdWdnZXN0aW5nIHRvIGNoYW5nZSB0byBkcm1fZXJyDQoNCk9rDQoNCj4gDQo+
IFRoYW5rcywNCj4gDQo+IEFyYXZpbmQuDQo+IA0KPiA+DQo+ID4gdG9vIGFzIHNwdXJpb3VzIGlu
dGVycnVwdCBlcnJvcnMgd2hlbiB0aGV5IGFyZSB1bmRlZmluZWQgaXJyZXNwZWN0aXZlIG9mDQo+
IGVycm9yIGNsYXNzZXMoY29ycmVjdGFibGUvdW5jb3JyZWN0YWJsZSkuDQo+ID4NCj4gPj4NCj4g
Pj4NCj4gPj4gVGhhbmtzLA0KPiA+PiBBcmF2aW5kLg0KPiA+Pj4gKw0KPiA+Pj4gK8KgwqDCoMKg
wqDCoMKgIGdvdG8gdW5tYXNrX2dzeXNldnRjdGw7DQo+ID4+PiArwqDCoMKgIH0NCj4gPj4+ICsN
Cj4gPj4+IMKgwqDCoMKgwqAgaWYgKGh3X2VyciA9PSBIQVJEV0FSRV9FUlJPUl9GQVRBTCkgew0K
PiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNvY19tc3RyX2dsYmxfZXJyX3JlZyA9IHNvY19tc3Ry
X2dsYmxfZXJyX3JlZ19mYXRhbDsNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzb2NfbXN0cl9s
Y2xfZXJyX3JlZyA9IHNvY19tc3RyX2xjbF9lcnJfcmVnX2ZhdGFsOyBAQA0KPiA+Pj4gLTcwOSw2
ICs3MzAsNyBAQCB4ZV9zb2NfaHdfZXJyb3JfaGFuZGxlcihzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwg
Y29uc3QNCj4gPj4+IGVudW0gaGFyZHdhcmVfZXJyb3IgaHdfZXJyKQ0KPiA+Pj4gwqDCoMKgwqDC
oCB4ZV9tbWlvX3dyaXRlMzIoZ3QsIFNPQ19HTE9CQUxfRVJSX1NUQVRfTUFTVEVSX1JFRyhiYXNl
LA0KPiA+Pj4gaHdfZXJyKSwNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1zdF9n
bGJfZXJyc3RhdCk7DQo+ID4+PiDCoCArdW5tYXNrX2dzeXNldnRjdGw6DQo+ID4+PiDCoMKgwqDC
oMKgIGZvciAoaSA9IDA7IGkgPCBQVkNfTlVNX0lFSDsgaSsrKQ0KPiA+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHhlX21taW9fd3JpdGUzMihndCwgU09DX0dTWVNFVlRDVExfUkVHKGJhc2UsIHNsYXZl
X2Jhc2UsDQo+ID4+PiBpKSwNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKEhBUkRXQVJFX0VSUk9SX01BWCA8PCAxKSArIDEpOw0K
