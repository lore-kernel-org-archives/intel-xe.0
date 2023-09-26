Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33EFE7E635
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5771410E3EB;
	Tue, 26 Sep 2023 13:33:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E851210E3EC
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695735196; x=1727271196;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=w5nVtbxDmlxqLXEfD8OzJEcpG5hYXUFIscOQ8jdxs94=;
 b=liP/zEy4W2KovdcbMwc/IYeFl/lVQTRWW/y3j+qsKcOvN6sZ4w9lcO+w
 ZkndkSiFKiT+myZpBiXFIfwLTfP/V+xswyRaVA056Ez50M4gghJL62kT2
 lAIs5UP9Wzv+vKdMPlYlZFV6/U7vs5gFibRBoEmRcaNWjaeuykrpLpcgu
 7RTfN8tHpZYxC+sBpc6nXlLU7tKyCAvo/79FBxIZzexGvCgx/z7ievMbM
 dJjlZN85eZfP1oU2bYGPVM0AekKx1WrF69l9bzht9S9ZkOIl/Jnx0gItq
 yGF1/tuKOFz/rU7Z4b0EP2yZjl4bbmA31/L2ZdSlKyW0YVxQJ4cHg4BA3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="371897438"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="371897438"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 06:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819024720"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="819024720"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 06:32:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 06:32:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 06:32:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 06:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6HO2I3xIAObqWPcVhw4ZpxjAPiMyWh1roND64o1hjzRrqAakqC//hFngI9RnaAJqthiPBDDR2YB9Kd3E+peUYdobNLXZqX5YyK95/eWRbqE05esHa8UMgN6tkoNKty1gJbKJv82iqzQIZCLFWiOj3wSNff39GkYexHtIk2hzZQYbRu5YCF3YF9hZdgnvaXSDbrSlnaTpMU/MidKgMK9Tmk2Yl0mqEHq89rvirRoQBzLJh6JCDsj1AUMEI4cUi7pBZQEMPqgCbOHSfr15ZJwl1K9EQA9Ki2vGl1cciJjbNKarWvpdjJpF0VYnIoWEWAZu+QNoq7fnA7CDl2gzX/j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5nVtbxDmlxqLXEfD8OzJEcpG5hYXUFIscOQ8jdxs94=;
 b=HKFpjche59c3c42fs1HV/H+sMeFdhZualUBTQlfwXNaSriNEYCZ9OBWH05yaioG38UFREx8IXHoQk1XttpdBpDGfAi4eAAKo+xbP98VebRHgJvr9lO8gztaRQYUgtWWja8y8lI1hyPzOjW6OVhwOEGqHJlHVlTYxlJExJvjhTU7IVismlJNz1HVYrFWTxY1wqpBtMXhhvMOCYLl0xayvLDD+SQ3cLdJP+tHM1KyGkBoSECUskYBFjpnJoerkRiGnTvigrunYuASnTu0Cibf35ZWTvuciYtPGTcn3JRNjaFBdowMfwdZh/KwDyxMiW7aIKxOsbnlgpBRmoYSVKxcZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Tue, 26 Sep 2023 13:32:45 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 13:32:45 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 02/12] drm/i915: Ignore set frontbuffer
 return value on release
Thread-Index: AQHZ5UUG+OxCjHWDbUG8sVGsz1xmzLAtLQ4AgAAEQoA=
Date: Tue, 26 Sep 2023 13:32:45 +0000
Message-ID: <d8353dde58f121dd88642949d6c4ee6e1fa5e616.camel@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
 <20230912064709.2802305-3-jouni.hogander@intel.com>
 <87a5t9kr9z.fsf@intel.com>
In-Reply-To: <87a5t9kr9z.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BN0PR11MB5709:EE_
x-ms-office365-filtering-correlation-id: 5ac52c41-8d63-4f20-6918-08dbbe95115f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KBt4L9RtAKP1Fudj8o9qY17zSZ2Yu65tT63IvCJJj0ApxpMIZaYC0lGlD6UHxWhjpQQZkzcGdo+hkbTSaCU2CfnGoWrwYQ9DNOK0m/VlMecbE05+JLVFyxKc12IVZJm4ZMyvc5wwC5Jj+3E0cZc+DW2lssrPZqNE0dE/m2dXNrElQTwT89vWpf3fDYumXihU6Po/BPKzK4eNVpUZ8mOnPaQ7XY0qdCuvYYG92oPDPvsr5W483Dh3NNvzxrKpiG4oeMUuBjASBJVZpFT9mYL7DVU4A454hwBr2vL8n2MMMxs+fd89FGHjtWRtL8EOEAJfwgCF7WRwEvC8+MKrNY8M1ESsmgjono+yR0SlzA17ZDFLWYfFxxPCSgXoY0lp8zOEREzzkM6lM3sqVaEIU9yyqvdfbz0bYnxmSJS6VlxhsPxSCVl67OBmvbGLfJ3/L/acB5UtxpRP5mUCQyfNXPCDGQkQ2vsf0FidGG933+Wkxt25vcB7qlBj13NyghSRQH5pP4uOH9kD1qCt/2uyqmQOMgF4MHhfxcxv695uTlCycGg8r1fPAwDkwkeMOI7gi5Z/HbL1Pi3H8ou0ZBUWXYvUbhiYWHN6VzlzQj9fYqeO9ecKRaqPIehBXKiCJ0Eu/Vw0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(1800799009)(186009)(5660300002)(83380400001)(316002)(41300700001)(8676002)(8936002)(36756003)(2616005)(76116006)(66476007)(66946007)(66556008)(66446008)(91956017)(110136005)(64756008)(6486002)(6512007)(6506007)(71200400001)(86362001)(66574015)(82960400001)(26005)(122000001)(38100700002)(2906002)(478600001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzFiSnJCclBmeE5yRmYwU3ZBSDVjNVJ2c21yZkhNdU1jWnpGNXg4L2Ewa1RS?=
 =?utf-8?B?RSszaHVFS0xxN1lHK1V4K1B1citwaUk1VG1PZngvM1NUK3FEUXdPTFpIVnJl?=
 =?utf-8?B?NjRKZWdGNXVwUDErNXc0eVZOVE5KT093R3pmdTJtWnFrQ2NhQktZeXB3OWpZ?=
 =?utf-8?B?OHZPUGZZYVNVTFlrL3NkWGJTZWQ3WGt0VHRkaDA3NUx2RHdQUko2bFJPd3Jx?=
 =?utf-8?B?QXZTQlVSTWFMQTFjQ3FWVHljblpIcFd6S3NBTnZGVEFRd3l5SmFlWlFCNzVC?=
 =?utf-8?B?eU8yc3hDeThDdlRsTlQvRmNlR0s0ZjlKa3J0YS9WUlk0UVJaUUxiNE1ZL1hw?=
 =?utf-8?B?bDQ5S1pQZktyLyt5N3VYTWNrYW9YM0l4cGUyUWVZbVVUSUJXcUNyMEJiWjJp?=
 =?utf-8?B?SzFYVUU0L2x1NlNVNFBkZzdFLzRHWWl6eHp2QWJKaWVtWUVMV2VnREQ5Sjg1?=
 =?utf-8?B?VTFmYjc4VzZremd1OXhUTlZ1d2JnLzg3NkNSaitWbTh6UUFXRkFaN2UrM1FD?=
 =?utf-8?B?STZwNVh5aGRIR0RHaDZFL3o3ZjFCQVRrblhJREtiSS9BZUk2WW9KK3ZDMFdl?=
 =?utf-8?B?TWMxSnROOGdUOHVkY05ieDNzbUpwd3d4L0lzTGQvU29mR1U1SDdxcS9tQ2d3?=
 =?utf-8?B?V2cvSHR1OWxDMDVHTjFzT3pXWnRNM3lpbGRORXU2RWpUZVB6TzNqR1F4eGJk?=
 =?utf-8?B?eUU2R29HVEtUbU1jaWl4VStyQjBBenlrcDZua0NoQmhGZWhiUHVnVjFJMGFz?=
 =?utf-8?B?NWsxVElkUEpSdTFkWlluRTNyWEFZRFdjK3hDL3l2Z2hINmtiQjBmZFRiK2Rh?=
 =?utf-8?B?YkZJak9VeHhNRmFZd244WjBlcFBteFNTalV6aFFaUkVKTmEwTnQ5VWQrdFdr?=
 =?utf-8?B?TlMzTTl5cUV5ZHpXQ0k2YnN0OHdwaGJLTThzUGpmbnJpUHI2RnlyT2VHMjBa?=
 =?utf-8?B?NUtReG55NERNV1hITHYybEI1OGw3MWVKaVUyS013b0M4VmM2OElvcE9rQmly?=
 =?utf-8?B?M3lJc0syQXJCRkhCQmF5a1pwMG1OVDNVcyt3SldpV1REYzViZk5iU3lzY1Rt?=
 =?utf-8?B?QmZENkVNTHpyZFNtRDFMMENocnkrMGpESTFvaDBMbVlNMWpHWDFrUGo4WFhQ?=
 =?utf-8?B?Skk2OWpqSUtNZ0FKWVU4VjRkdnpDUFRqdENrZ0c5bHUyOWVUVlpLTTRGblpG?=
 =?utf-8?B?SHNKTG16K09Ed21zZG92Wkk1ZjdMOHhPTHZCYkhBM25PeXRFMzdDUVhJQk9a?=
 =?utf-8?B?Y2h3TnRDUWVEQW9yaGRvdVhVTHJaRE9JMkxRSWJCQ2x3RmlESFg5Z202YWNU?=
 =?utf-8?B?ck80blZBbXAxQnZKa0FtRTExUS9NMFpkSFNEY3FLU2V4MVFEbHJVeE9PS3Iz?=
 =?utf-8?B?QU9DeVJhNjhveTZRYUVnM0xsNS9ta0Nodnc0TUY3WXNDK0JQNmcxRmxRb2Q5?=
 =?utf-8?B?LzV3VitDb2Q3Z1RTMlNDUUUydmxLRTVUdW5YRTVKc0lNRGx6Yk9KWUw0cXhr?=
 =?utf-8?B?WlA1MjgyNkNueEIwV1RpNlRIKzdNc09VWUhEdHo1MWl6OWgwMzk5UjQzdnF0?=
 =?utf-8?B?VW45K04yQjNwSGJ2ZDNZelQzZGwzbmFFbDVJZkRpSThtQTJkaTV5MDdqU2Z5?=
 =?utf-8?B?M3B0VnYwYUVrYVhIeDZtOXRQMG9pS01EMHNEZGdlUXBQUUZrQ09hdVovcC82?=
 =?utf-8?B?SFJNMlRSSjdLcEN4WlREakZoL1FadzBsZmtaV3M2alNqdmFpTm5qRU1JeGFR?=
 =?utf-8?B?VE53dWNER2NqUGVPN1RlcDJVY1ZpQ3FqNlFOMUdLNUk0OHRwckhjN0EwUVp0?=
 =?utf-8?B?T1lvbmRWajUrRzM3YXZDYTRUcnMvRmVBZ1gwUU1EdTJZWW92YnpIRm55ZFNy?=
 =?utf-8?B?YU5EUzhzT1dGbE9nUmI1aDFxT2dTNnBwTmc4bmoxZUNxcXBvTEhhdmlnZ1o2?=
 =?utf-8?B?OERhMFExOVZtZVVxRUY2K25oV3hBdUhybEFWWmIrSzVCcXo5Y081SjFUZ1la?=
 =?utf-8?B?UXdGUFp1TUVMUjFaZzhaanhBYW8wdlI2ZnZiNVdITkl1WTkvZktkUXp3MSsv?=
 =?utf-8?B?TWZiNnd2b3JsMzRFZ0dJSUliRXlNdy8xdXNwZ1JaL0ZaWkRMaWZ1b3lKMVhu?=
 =?utf-8?B?TXpOQW5CUFdMM1h1UHc2RVJFVCtSMldLTzA5c2VPbU10TWdBSUNmODlXNVRU?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A11E9249A1B7514DB063945916B40B8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac52c41-8d63-4f20-6918-08dbbe95115f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 13:32:45.3917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/+Lc8rKzYKFnTG96OGorw2FQ68cdL65NzgwppKrp/FOIOA/F11ELprFfpRZeEN29zcLfco9b0UHPE+GgAJnPpPkC8RB927u/qiI47KSSVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5709
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 02/12] drm/i915: Ignore set frontbuffer
 return value on release
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

T24gVHVlLCAyMDIzLTA5LTI2IGF0IDE2OjE3ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVHVlLCAxMiBTZXAgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IGk5MTVfZ2VtX29iamVjdF9zZXRfZnJvbnRidWZmZXIgcmV0dXJu
cyBzZXQgZnJvbnRidWZmZXIgcG9pbnRlci4NCj4gPiBXaGVuIHdlIGFyZSByZWxlYXNpbmcgZnJv
bnRidWZmZXIgd2UgYXJlIGNsZWFyaW5nIHRoZSBwb2ludGVyIGZyb20NCj4gPiB0aGUgb2JqZWN0
IGFuZCB0aGUgdmFsdWUgY2FuIGJlIGlnbm9yZWQuDQo+IA0KPiBXYXMgdGhpcyBzdXBwb3NlZCB0
byBiZSBzZW50IHRvIHVwc3RyZWFtIGk5MTU/IFdoYXQncyB0aGUgc3Rvcnk/IEl0DQo+IGRlcGVu
ZHMgb24gInJlbWFpbmluZyBjaGFuZ2VzIHRvIG1ha2UgeGUgY29tcGlsZSIsIGFuZCB0aGUgc3Vi
c2VxdWVudA0KPiBwYXRjaGVzIHRoYXQgYXJlIGZpeHVwcyB0byB0aGF0LCB3b24ndCBhcHBseSB3
aXRob3V0IHRoaXMuIFNvIGl0J3MgYQ0KPiBiaXQNCj4gb2YgYSBtZXNzIG5vdy4gOi8NCg0KWWVz
LCB0aGF0IGlzIGk5MTUgY2hhbmdlIGFuZCBjb3VsZC9zaG91bGQgYmUgc2VudCB0byB1cHN0cmVh
bSBhcyBhDQpzZXBhcmF0ZSBwYXRjaC4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0K
PiBKLg0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5p
LmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuYyB8IDIgKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250YnVmZmVyLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuYw0KPiA+IGluZGV4
IGE5YThjNzViODIzNi4uNjI5MTg1ZTVhODgwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuYw0KPiA+IEBAIC0yMzgsNyAr
MjM4LDcgQEAgc3RhdGljIHZvaWQgZnJvbnRidWZmZXJfcmVsZWFzZShzdHJ1Y3Qga3JlZg0KPiA+
ICpyZWYpDQo+ID4gwqAjaWZkZWYgSTkxNQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpOTE1X2dndHRf
Y2xlYXJfc2Nhbm91dChvYmopOw0KPiA+IMKgDQo+ID4gLcKgwqDCoMKgwqDCoMKgaTkxNV9nZW1f
b2JqZWN0X3NldF9mcm9udGJ1ZmZlcihvYmosIE5VTEwpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoCh2
b2lkKSBpOTE1X2dlbV9vYmplY3Rfc2V0X2Zyb250YnVmZmVyKG9iaiwgTlVMTCk7DQo+ID4gwqAj
ZW5kaWYNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2soJmludGVsX2JvX3RvX2k5MTUo
b2JqKS0NCj4gPiA+ZGlzcGxheS5mYl90cmFja2luZy5sb2NrKTsNCj4gDQoNCg==
