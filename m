Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D892C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA40110E62F;
	Wed, 25 Oct 2023 10:03:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0710E62F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698228223; x=1729764223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zRQKF5Jsi2JmlnjSzr0jAgV9eJMRpzyrpeVYHo6ibPI=;
 b=QEZDwwnVL6zGNSzH0s9PPmMCUATOap5CmWHZJZsUf7bhRKDs13V055Yh
 YD2k7SfqI8jRY7JdatXLNdIA0g/faSrW+7AavdUaoi//CQc39zEhwzTYO
 DuGuPP9Wq6hRooo9kxj7OYdP+fMI5Bi/+A7fbVZ6hkDXaQoyeBchvOaeu
 1O9eQsfSCFEqUNmJDyAGg3jEq7pyxg1TK9BKJUgeDT7qIT7hdPqspxyAn
 NoAu9FlKpqNxMPZb4H0ICoJq3yBTosxU1a7tnKCka2ep5BQ2SHBRn4uTs
 gu5FY9FR7/RtUKFqDLT8VFYzJ/W5flXOtfNuk7rL7ycfybP/nRmXZe2k+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="390129871"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="390129871"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 03:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1090159874"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="1090159874"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 03:03:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 03:03:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 03:03:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 03:03:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 03:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P175UZOYzTLIw7FmeBnS0Dhxf0giYm0bWlpD3t4LsVwJa/2vjtKdVaR8MjvDidZY4wNIIEHAiyvgsBSNxYm/YEDW9m98gWRAFyPUOC1jZvalWB/i5rp0j1JN+QfxynYYFDBGULblnVr3Y0veFKAwF0Teq6j8rx4fq3AdquNWpNu7xntdEhX9OC6qPoBJTruWhjPuf90aPQM5yFesMIiTaqDIeK4gn0ZUA3ghPLCQqMAbpgjSu2Jjiz5BFrUQjNUbV7bOnYzjxOKVL30PjwqSgvl1xfWWpVItGzzsVaw+bN4DHRTw+bCC1irreq3aFM2eF181aPNJCAbVGldRqajDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRQKF5Jsi2JmlnjSzr0jAgV9eJMRpzyrpeVYHo6ibPI=;
 b=DnC0reQBRjd5CYCzBWr3SvN33lb504/80g4qmNEJm8LBT14BRKb+clv4E1ab6wyR/cpVhqdQ0WuVvJyr/F8IZ7Z20DKHrRX58eNAxzj8I6o/0epq6vqLYLM26gMpRKVvYaVJvTqydcPdu6dd249Zf18uLsTQFfoy5ef/Yc/1z4OzwplXO3V7qQrUhdi9Rk6SuCMZnAPTGOZnpkr+Xb6fyz41P/QsvGvRIiPY+6dEq0YbwY4uDrtaQbvbJlIqMJveRIMJj/Pj83ZofZXsTF6hBcnSu1Jd2igILEefaTBIB4ON+tQUbjQYYdRlAjNsYE2eHtBiG5RuB47PKh4hs55srA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 10:03:27 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6907.028; Wed, 25 Oct 2023
 10:03:27 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH 0/4] Revert remaining local fb tracking patches and
 backport
Thread-Index: AQHaBXsKFV0mofLl6EOovs+kenNVqrBaP4mAgAAKfgA=
Date: Wed, 25 Oct 2023 10:03:27 +0000
Message-ID: <af8ac8ea2029322216635be5993f901f5a1f68a8.camel@intel.com>
References: <20231023063420.3298731-1-jouni.hogander@intel.com>
 <87a5s79hpa.fsf@intel.com>
In-Reply-To: <87a5s79hpa.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW6PR11MB8312:EE_
x-ms-office365-filtering-correlation-id: 58232fd1-fe5e-4c50-a579-08dbd541a218
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 81AQzfXt5eYS+aGBSKscqH4veq4cLV7oCBWQzGNZaxYZLJ3/Ryd8DUDxJf+Ie3eEenm8DMWgJ2gi/SHNh1jiS9FoHIzfVW2wDmVFWG9X+J7weY0KQhrWRq254r0hcnN2agZ63LJgxiZBMuYp6uLCILmbyKpjt0QYJLUv2CshQ8P0/QyFSo/yLmjI4WwsdAAUUDhWDeOhcCs+bqnyePo9FDl6l9uNtvsQWpP+AJLtR7SRQkOVITmGvuT1Jeq+8BMUkadcc1pkFp6w0mYpc4KyNITrf+tdzMWLIaDc7JCzZimYF9IrzX2c2ZAm2YPpjk9xXweKlU3vgQgrNH5OtNDHr/rF7Y8evPICS50UdXG07n3p1OvVD4x2io378sKcaMCoSpkzpOT0W+513xwZT3fXLhymsdW5sep5ygqWNMOXd/3WaJcn1IbCE525CyMMR90W2EyX5NUH5tNijsTcQSi6cG7m0435nQWbXaEIneEOOr+1r6LUkDI+ZiV+ZuOzSKRoRVxjZdLhpeQzKrVcV1fc2WLmzkLP7KSXTXWLFoXW3b61FOT2AD5KI7QqROjC/vM8wwM1698WHZHOOPLk8+71COI9N3+tKxXNWPHaGBR70fL0HSZwqaddYKUZxRYItkd5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2906002)(41300700001)(478600001)(110136005)(66556008)(66476007)(91956017)(6636002)(64756008)(66446008)(76116006)(8936002)(71200400001)(6486002)(66946007)(316002)(8676002)(5660300002)(4326008)(6506007)(4744005)(38100700002)(82960400001)(36756003)(2616005)(26005)(4001150100001)(86362001)(122000001)(6512007)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkY0Z2s0VnNSekZzb2FrbHBvWkE2YUdzMjIwcElGb0Y2NmNOL2d3Zjd5bmJs?=
 =?utf-8?B?a1Jka21IZnorYURlVk1Zd0N3bmQ1d25zK0dIbWdtWDRQY0xMUXIzVkRPcTZP?=
 =?utf-8?B?MGdpcWk3VU9sQUVPTUlHaHo2OHpLRmkrY1ZOaldGeW1FZUdKc3lod0VKWEJn?=
 =?utf-8?B?ejV1ZklQQmlYZTU5bHYrQTIwenhTMlNkYXZLYXczK0VBWlp5eDhaUk5CMjNO?=
 =?utf-8?B?SldDOGtKeUQva0picUt4ZHVoU1lsd1B6WEZvNFg0QVJ3VUxRZFJyQm5yYlpR?=
 =?utf-8?B?ZkhpcEkxNk9lalhtWUplSzhMT3J6SHh0NDRVYUljbS9oSmxteXV1U0xvb1lW?=
 =?utf-8?B?Rmx3OTQ2WmtQZGhvL0QwNlZWb3E5bEhZall3NXdYWFhTZzBUcHI0Y1h6L0ZQ?=
 =?utf-8?B?ZkpFbEcwN2JDR2hjeXExWFN1ZjJEMWRtNmJyeWVQY3ljazhTY0xSemt5ME1l?=
 =?utf-8?B?cEFxWjJ6VEhIaWtmVTcwRE1STUNHYzRoU0R0THpkUWdTa3BwWVFWcHhaczFN?=
 =?utf-8?B?S1NVODF4d1NVU2ZSenRiYUhKcTNoS0RVaE1telorTlR5M0U0Y3UyM1lTb2JZ?=
 =?utf-8?B?NkY0YlBwQk12Z1dUYUJRQ3JsNzJHSkROMFpEMTdaaUpJWVlOdkVQdmNaNThH?=
 =?utf-8?B?OElONXlaYlJNNWMxcXlXUFlISVJMN3Qwcm8zUU5HaGNRRDcxK2xWUVlCTExP?=
 =?utf-8?B?c0VnNmNseStvaGVjNng2RHhvaEROYjJ6U09qWE9kbk94U282aGdJcXlxWDhx?=
 =?utf-8?B?cGdVSld5d2w0VjNaMFZ3VXUxZXUycFVkbldySGZuTFRtN0V4TzJ2cXdtdDRy?=
 =?utf-8?B?K1BLNytVWWFpOGQ2OG5QejJFV3JUSTZLSE15WTBTalltUU40Sy8vcEkxMlRQ?=
 =?utf-8?B?ZVpFSUoyd1dGK1crUUJ2OHdjSHVGTnVUaUtndXplbGhNNGZxVUYwdkUvNFYy?=
 =?utf-8?B?TERpZE5UUXdZeHIzOGFsSDZrSWRrWDlERUpWR0NsZUVuUWFEaGczdkhicGsw?=
 =?utf-8?B?VTMxbnkvZ3VxRWhYWlVKL0hwMzBsYS9Damxvb3NNU214aWxpcUx6TUdkblIz?=
 =?utf-8?B?eFE0RkM5eWQyeEMyVXlhWEcxWjd6enAyNlRkZEgzbFFZNTFmZ1ExelF2aE9Q?=
 =?utf-8?B?Rm1ZZlpVYXdWTEdKVXUrL3BrNE1PNUlyQTdyMzRuRUdtTkhqc25qOWI1dStp?=
 =?utf-8?B?QnNQQ2ZGS3JWSk54RFNxT1Jza3lhWC9DSUtFUW5zRUNGbkdiQ2dOU0sxZ1Av?=
 =?utf-8?B?S201YWdmT3B1QVFXWDU4N2tjYmt2dHdTc1ZESjFWYWxUZ280Y05PMmZGKzV2?=
 =?utf-8?B?QUd0WFJZSGFRS2ptR3ZLbUswajd3RzdkbWFxVkJPT0g1MC9ObnNtaXA4d3lY?=
 =?utf-8?B?d1pBVVJuYkJ1djdQNE1ldjF0WERWRFhVNlZLMTVQOEJ0VzExUlRmSFpFZVFz?=
 =?utf-8?B?bnBkYmJjNmlVcHFSa0oyS25rdGRWUE9HS0drZlRyc1B1ZHVvR05NdHZxRDZt?=
 =?utf-8?B?a0lZeUJEUlpJblV5aUtMWlY1MmhhU1BoQVV4cW1rUWJLYnNpeDA3dmk3M2JU?=
 =?utf-8?B?YlUySERMSUVoTmhxM0FDRG40dU10KzJRNjhZS2Y5a24wdDR2VHEvODlvdVQ0?=
 =?utf-8?B?emcxbkUzTW5KWk02elpCRDV6Nnc5Zm9KcnNrK1dSUXpkMnVkb1ZsTC9BMjY5?=
 =?utf-8?B?WWptMVRmZWpUTGEyNFZPazViK243UVVPN0RzREcvcm5GTytNWjlMYSszOFUw?=
 =?utf-8?B?MHlKRk9EcFYwaWYyQ0lqNFBUcHJkejk2UjlxRm1iTVhJUkVmQlZXbWlYZXBV?=
 =?utf-8?B?Z3BIVTdGRUNScFVvbis4V0Z1WkxkNFBHTEZkU3hYcll3Uk9XUFhhV3VNaFVz?=
 =?utf-8?B?T1REQ1pnbGdEbVFsQjAyZytoMFVicENBR0pLZVNaQXRCQ1lWcUFyTzJJVEFB?=
 =?utf-8?B?VmNEUW9TVTRPcFBORFVSQytDbFJUenJGL1JOcXZOc21vV2RTUk5UVko1TGFh?=
 =?utf-8?B?VkRsZkdVWGQzajZLQzNZTHYvMEFGeXpMRGJSZDEvdlo0QXlVTlZqK0cxS0dR?=
 =?utf-8?B?d2RyQVhvR0phcUFPWHRBSXpKRU9naXFncnpaYmViVCtodXB2cERxQ1JBZUhB?=
 =?utf-8?B?c2lkWGtpMTQ4SmVMdXR3OEk1Wk1qM3NZMXZNZmtuUlBEUlJJcldxcHVOem9E?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E867E0FE7D66F4429A50E7D98AD00688@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58232fd1-fe5e-4c50-a579-08dbd541a218
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:03:27.1980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D0iow/zt3KbmLCEyg68U9yb/aLefKFN/X1+T8iKXk23gsesxNu+5USWNEwUev+44M7Q0qZIms/m69ypBPAfoLvMnETOyMwL2X2kjp7JTe18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] Revert remaining local fb tracking
 patches and backport
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

T24gV2VkLCAyMDIzLTEwLTI1IGF0IDEyOjI1ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gTW9uLCAyMyBPY3QgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IFRoZXJlIGFyZSBzdGlsbCB0d28gbG9jYWwgZnJvbnRidWZmZXIg
dHJhY2tpbmcgcGF0Y2hlcy4gUmV2ZXJ0DQo+ID4gdGhlc2UNCj4gPiBhbmQgYmFja3BvcnQgc2Ft
ZSBwYXRjaGVzIGZyb20gdXBzdHJlYW0uDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBBY2tlZC1ieTog
SmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCg0KVGhhbmsgeW91IEphbmkuIFRo
ZXNlIGFyZSBub3cgbWVyZ2VkLg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IA0K
PiA+IA0KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+IENj
OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiA+
IA0KPiA+IEpvdW5pIEjDtmdhbmRlciAoNCk6DQo+ID4gwqAgUmV2ZXJ0ICJkcm0vaTkxNS9kaXNw
bGF5OiBVc2UgaW50ZWxfYm9fdG9fZHJtX2JvIGluc3RlYWQgb2Ygb2JqLQ0KPiA+ID5iYXNlIg0K
PiA+IMKgIFJldmVydCAiZHJtL2k5MTUvZGlzcGxheTogTW92ZSByZWxlYXNpbmcgZ2VtIG9iamVj
dCBhd2F5IGZyb20gZmINCj4gPiDCoMKgwqAgdHJhY2tpbmciDQo+ID4gwqAgZHJtL2k5MTUvZGlz
cGxheTogTW92ZSByZWxlYXNpbmcgZ2VtIG9iamVjdCBhd2F5IGZyb20gZmIgdHJhY2tpbmcNCj4g
PiDCoCBkcm0vaTkxNS9kaXNwbGF5OiBVc2UgaW50ZWxfYm9fdG9fZHJtX2JvIGluc3RlYWQgb2Yg
b2JqLT5iYXNlDQo+IA0KDQo=
