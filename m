Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97081E81E1B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BC610E54E;
	Fri,  6 Oct 2023 17:24:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C12110E54E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696613038; x=1728149038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ix+M1vl9uxnwbeJGv4qsFp08J+GaqvFl+Hlf3o0qDl4=;
 b=krtPDHprdHDkTrxcxyIbJI+JCWWGvqrRgTb65cGT117i9w3CaCLJs/6Z
 QJ+mq6BscdnmTdWgTq4KJFPOp/Hx9ihgNrm3seXOnK7UYiiV9m81ibTE4
 p4vpSeZyf7xhg2Wryesy4riFF4kpbqqDJZLTbQLNamG3bPo6D1pJJWfp8
 ceB+aosu/jqi1rrxncqoRfDcGKPVNlC47yEM3RmhPH6nyip4+CqiB593R
 oTNyaF8SKyOYOCm8NQoDTfdpphwELe5xkZ61M3yq0u7znfEiP+BC75BVg
 LZnF7bS6jsxDgJYmb39yQqZcUUIgiEHmL0GogwceMWjv9bhTFtH2QSeC2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382656480"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="382656480"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="787461345"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="787461345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:23:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:23:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:23:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fK/j+LWvWoDgW2AX8iRD3FXitDRfk9aJposK7ND5nZU6Rf8ie1ZYVeZsepFn7Cd0TdFvdNjpLiok6UHnyLYmz9ALvuPAo3VS5NWHfSvD+CxHb0VbUJdWB96THajE6WS5cLhTH5EIgoDtuR3MU43Qya3P55tQJOqJCVspjG/ZKY40bfA+wqvVrqrkxI6BpgEXWApcEREf0eySc0W6HV4fu6YD+aMUPduPdKFSdRGmfmSRzUkdqYFqDAC+yapwmZAs36i/zvx81bwBjz35a5fW8s9k5e/kxSj3VaCQlavn6iYPDR3I9ZtdEaD5fX9lKPbSxtnrBpthmjiMQEtRQ5S0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ix+M1vl9uxnwbeJGv4qsFp08J+GaqvFl+Hlf3o0qDl4=;
 b=gtNBLQUACRl5olCIYm7jQbVsyVpfDRSYo5xvRuYDXjOmBH46/mI9nYCTI545klQqXEQGknnGD8vrvyUF4FHojJ388a6J/jwiBO8CKFPHF697yPTMlSAhHkkWsdcP9NauNhXKMhHdHdFiNYrCPuEAen4qtqJFqn+3jwxq2XAbKwuzsUTwZK/0DylYPAkn5/Br5Pf0uWfAnWdnHfrqC3aS+JvT1ir2+ZxqMhkuQpEmfUOyMCYXRStXdbLSsxoLM+z/vWfFe/DyGjFhTsQiuW6k605H/b5VlgrPWq73XvBZWBUMRxAAt5Gu9q8uuO/oY8SMQkNTZJE3izAqf+2ELAamNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 17:23:37 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:23:37 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Remove PIPE_CONTROL_TILE_CACHE_FLUSH
 from PIPE_CONTROL in gfx20+
Thread-Index: AQHZ+HVL7IIGDwrhyUyoJQTTCwROmrA9AKSAgAACHAA=
Date: Fri, 6 Oct 2023 17:23:36 +0000
Message-ID: <5a8e6f5807c5271e2327b7e0d4f8f04530d08d4b.camel@intel.com>
References: <20231006165053.55479-1-jose.souza@intel.com>
 <tecwsvc6m7wofukfl2fsroircqfyla6i5rnewl3dzclhyigm3n@ryoralndd7cx>
In-Reply-To: <tecwsvc6m7wofukfl2fsroircqfyla6i5rnewl3dzclhyigm3n@ryoralndd7cx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BL1PR11MB5256:EE_
x-ms-office365-filtering-correlation-id: 1641afd2-1658-42cd-5cc5-08dbc690f998
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5/LLV5YKAAppYV1pWROsW2pF7XBUi3cSOhtaOfvAh7BMyYZkrKO1UDuQitq8mzeOxjJCCT9UlHzx4FIoqYk5uxMHV64c7IIJWQFQyFJ+duMZWDYw5T6DbigS3prPCYCuKunEqV7+xxX3KZEBf7S80DswJdi6JVS9crz6JfIVgjgSq5LGlxUepdULBesKjE39X13RPTvrM3L+/fMIPuPyzrMMDbY+HyQhQGVXT4vcWMTIftE1a3p5zAlHUC4VMFSMkMgPoG0Piyb1XVkh2lYTp84tiiBiq/dWemgvLUZBP9H7S4yb2pw2jc5ibFEkKRI+vdGPMHjgRC7NgSF6YB4xYgsOip6kML9NEX5pFQpdBL43i5sB6RHCLtzxSZwXvQharGgtQFHgHuaR6yigY3k/gQuBzWKmVraOzI2xBwwgWaVDV3zx3qFQTsDsJhBnVSUKpBD/RpUcYSDf2MR/gdFddfOuEihrI+wtqD9OPmTj0eeKUNCx0IykcTPTUaBAzwDV8f6129/WJnncweEzZJhizBVkb77VDYFYRWFGxZPaYnDb+c9Juw7+me8+/ezuTI9kPOphh7DI4SYFy2QLrioXkV+ozBZcEtFQxiy1LgG6o3snIgS4JfW0Av2ZcQrHK/+W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6506007)(71200400001)(6512007)(6486002)(478600001)(38100700002)(86362001)(38070700005)(82960400001)(122000001)(41300700001)(316002)(2906002)(83380400001)(2616005)(26005)(37006003)(36756003)(66946007)(66556008)(66476007)(66446008)(64756008)(5660300002)(6636002)(91956017)(76116006)(8936002)(4326008)(8676002)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW1sTkFlUHU5YUgzRkdNTitQTkFZR2hueWxaaFZMT0F4NjVtUVhvZ0NmTUtO?=
 =?utf-8?B?dTY2UUFtRnFpVnZSdEsxL2tiemc4ci9jZmxValFCNUlDWkpQNndlUWFJL2xV?=
 =?utf-8?B?UGtFeHFPdHR3TWR3Nkl5ZWkvby80Qlg5OEU1VlpEM1phdm5UR1JQczdDRmxQ?=
 =?utf-8?B?alZSMTVoNEZZMmlOdFBHWEFHcnZlcks3SUUvWi9YZ3A0UUNkaVBpbkVVWEcw?=
 =?utf-8?B?TDBWbGlhdHB1KzV1UnByREdiUDBtaDdGRXpySjZ2WmhCczdSTVo0VVNhZzBm?=
 =?utf-8?B?bVJwYVFFY1Fpa0NSSnRxVHZNMmZBNnptWjNvUTJkaStGdU4wRkptaFpBVnFX?=
 =?utf-8?B?TVVtMnJadlZPY3NqWFQ3N3dCWVd5YS9nMkVzeTZWejVBalVMY0N2UUhGQzIx?=
 =?utf-8?B?MWhtQXJNbHhnMG9vMlMwTHN3dXVmcWlBRXM4RWJJNk1vQWlrTCtNVmpnTVJi?=
 =?utf-8?B?SmFHNkdYZ3ZxQzNJcS9NVE5hVTF4ZVR4eXk5YXJlQXhCK0kvc09rWEg4R2Vy?=
 =?utf-8?B?aXlCR1YxU3dYMEM2ajU5OEpSa0JBdkVwSEVqVkVsb3lGUHUxZWFSSEFTYkNT?=
 =?utf-8?B?ekpWbUNVOWYzQ054R1lsRW9SY2tVMmc4TFpXMVFXdEFTeHZLVm83VkxncE4x?=
 =?utf-8?B?RStjZVdtc2dLb213MWwzaExOWkwwN0JNS0VYaHU3WXpvcTVkblJJb09LZ3pV?=
 =?utf-8?B?Rkh4dFZETU1nR0I2bGN4cmQ5QWhCczkwclBNbG15YVdaTUZtL01nOFROeDNI?=
 =?utf-8?B?UmRFTG84V3lDTHZVdjFGc3hwNDhiblowRHExbkFHYVJVMU12blBlb3hsTWFt?=
 =?utf-8?B?Ujg5M0ZEZWJTZzlFaC9qYmJBK3hKSkFxdy9NMVJrSDVNRnNxWTJ6RTFMeEdy?=
 =?utf-8?B?dWRaSmtZWVFQcXl4aFFSbVRPM2lXWHBCVnhJcGE3YzJBOHJDcHZnUmM5TCtX?=
 =?utf-8?B?YUYxbFJxeW0yZEZqRng5ODNkTjdyRFhubVdYQnk4L0hRbE5LeFN5QU9uRVZL?=
 =?utf-8?B?MHhZN214U2M5Nk1vS1RkT3VhOW93MlFUdEFvRnRsOG9JZkxLeG5CYnlzc3Fl?=
 =?utf-8?B?REE5bmlCMzJIVnNvNnh0UHg2MSs0TTJpZjkrTE9jRDVmSS9aVFNFWHVQMXNp?=
 =?utf-8?B?RnZzQ3ZHS3kwTGx0KzJoM2pRWCtqZ1JrWlJxWGFhbk1sZ0o3NFRYeEpTS25V?=
 =?utf-8?B?YjRzWFhzYTZiSUdNT0Y2NVZOMk5oK1Nsd2JLS1BtWFVpQi8zU0VkOXQzbWVn?=
 =?utf-8?B?amJuUWJ2SHlIZ3VUTXFvVGY4VnNFcU5RODQrQ3RVdzk5TVIrNXNrRElRQ0N6?=
 =?utf-8?B?bFlGelpTSG1YcmkycVR3Wmh3UXA0VkozaE5RTXdQa25jd1F0VndWcGsxK0NL?=
 =?utf-8?B?ZzlVNGRKaEtMU3liVGdUamIxaExwTWF2bUZGRGJIZll2RW1mcnZFL0U2Njh0?=
 =?utf-8?B?WUJTZjNvSWx5Vkl0VmM4bEQ3MU9HN0tkVllrSmNDWXJFVUlVTlpsYlQ5cFFx?=
 =?utf-8?B?RTZUYzA2eHdGbmNKVTR1Zm9RRWppRkowZlZIZUZTZU9uL29tVkhoRjFGakhS?=
 =?utf-8?B?VTFGNkVZOXpsVU94OXJsOGlIdG1SNGJwUlA2d0hmNXRWRlBZUWNmUnNQaDFL?=
 =?utf-8?B?OGp2RTBzbHhTRHZuazYrTTJ0endDMHFmQXFpbzhYT0ZhRlIyb0trZkNYRGpP?=
 =?utf-8?B?NU5IQVhSY0dYcDNFVVU1L1o5Zmxxamw4WnFtT2hrSUdyQ05GR3g5NU1WemNI?=
 =?utf-8?B?WWN4L3dMcmlLK283Y0FQR29SVHI5M2laL2cwOG5xV01zckZKNEZrVzdiMGp1?=
 =?utf-8?B?b2IyZFdmY2ZnV0theHlRWUNLZ09KZ1FqTm9adTlUMExZUWJVYVVGRE1UTE1H?=
 =?utf-8?B?VGJyZUxKbFBpTGloWnlOdWNKK2tNYUl3amRNY1ZlV0FvWWlvNUkrWi90dFla?=
 =?utf-8?B?b0x5a1hJL0pLb1puNW9wL2p3TUp5TVBKMkdwcDdjRjFoeEJ1b2k4MkdEWUpj?=
 =?utf-8?B?eDhLa3hoanpVYWFua2dwWjYzWVYwaytwUnEwYUdFUUFqYTJDZ1JYSzJ0QWkw?=
 =?utf-8?B?enBtWE5neG9uUzhqa01OYVNGcmMyN1BzUUNKZHlhbVE2dEFCMmpNem9rcVdj?=
 =?utf-8?B?Skl0Sk9oYkZvM3FYczYrZDZVaFg4M0p2dWVSSldpWnBsVVBpNk5iOWF3UEFO?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7CCEA8AC93869499FAD6BE056B22917@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1641afd2-1658-42cd-5cc5-08dbc690f998
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 17:23:36.7828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0grFO5YDwDJH80kPVeXWHJGHoeYCM2jkChgOli/7oeuO3+PsDJrZHF1XC6FHNt0fGhlVBgvLn+AbYXLaBOwv+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove PIPE_CONTROL_TILE_CACHE_FLUSH
 from PIPE_CONTROL in gfx20+
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

T24gRnJpLCAyMDIzLTEwLTA2IGF0IDEyOjE2IC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIEZyaSwgT2N0IDA2LCAyMDIzIGF0IDA5OjUwOjUzQU0gLTA3MDAsIEpvc2UgU291emEg
d3JvdGU6DQo+ID4gUElQRV9DT05UUk9MX1RJTEVfQ0FDSEVfRkxVU0gvYml0IDI4IGlzIG5vdyBy
ZXNlcnZlZCBiaXQgaW4gUElQRV9DT05UUk9MDQo+ID4gaW5zdHJ1Y3Rpb24gZm9yIGdmeDIwKywg
c28gaGVyZSBvbmx5IHNldHRpbmcgaXQgZm9yIG9sZGVyIGdyYXBoaWNzDQo+ID4gdmVyc2lvbnMu
DQo+ID4gDQo+ID4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5j
IHwgNSArKysrLQ0KPiA+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdf
b3BzLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+IGluZGV4IDZlZWM3
YzdlNGJjNTYuLmMyYWVjMzJmYzQ2YWQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3Jpbmdfb3BzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19v
cHMuYw0KPiA+IEBAIC0xNTcsMTYgKzE1NywxOSBAQCBzdGF0aWMgaW50IGVtaXRfc3RvcmVfaW1t
X3BwZ3R0X3Bvc3RlZCh1NjQgYWRkciwgdTY0IHZhbHVlLA0KPiA+IHN0YXRpYyBpbnQgZW1pdF9y
ZW5kZXJfY2FjaGVfZmx1c2goc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iLCB1MzIgKmR3LCBpbnQg
aSkNCj4gPiB7DQo+ID4gCXN0cnVjdCB4ZV9ndCAqZ3QgPSBqb2ItPnEtPmd0Ow0KPiA+ICsJc3Ry
dWN0IHhlX2RldmljZSAqeGUgPSBndC0+dGlsZS0+eGU7DQo+IA0KPiBndF90b194ZSgpDQo+IA0K
PiA+IAlib29sIGxhY2tzX3JlbmRlciA9ICEoZ3QtPmluZm8uZW5naW5lX21hc2sgJiBYRV9IV19F
TkdJTkVfUkNTX01BU0spOw0KPiA+IAl1MzIgZmxhZ3M7DQo+ID4gDQo+ID4gCWZsYWdzID0gKFBJ
UEVfQ09OVFJPTF9DU19TVEFMTCB8DQo+ID4gLQkJIFBJUEVfQ09OVFJPTF9USUxFX0NBQ0hFX0ZM
VVNIIHwNCj4gPiAJCSBQSVBFX0NPTlRST0xfUkVOREVSX1RBUkdFVF9DQUNIRV9GTFVTSCB8DQo+
ID4gCQkgUElQRV9DT05UUk9MX0RFUFRIX0NBQ0hFX0ZMVVNIIHwNCj4gPiAJCSBQSVBFX0NPTlRS
T0xfRENfRkxVU0hfRU5BQkxFIHwNCj4gPiAJCSBQSVBFX0NPTlRST0xfRkxVU0hfRU5BQkxFKTsN
Cj4gPiANCj4gPiArCWlmIChHUkFQSElDU19WRVJ4MTAwKHhlKSA8IDIwMDApDQo+ID4gKwkJZmxh
Z3MgfD0gUElQRV9DT05UUk9MX1RJTEVfQ0FDSEVfRkxVU0g7DQo+IA0KPiBMb29rcyBjb3JyZWN0
IHRoYXQgaXQgZG9lc24ndCBleGlzdCBpbiB4ZTIuIEJ1dCBsb29raW5nIGF0IGJzcGVjIDU2NTUx
LA0KPiBpdCBkb2Vzbid0IHNlZW0gaXQgY2FuJ3QgYmUgc2V0LCBidXQgcmF0aGVyIHRoYXQgaXQg
ZG9lc24ndCBoYXZlIGFueQ0KPiBlZmZlY3Qgb24geGUyLiBJcyB0aGlzIG5vdCB0aGUgY2FzZT8N
Cg0KWWVhaCBJIGRvbid0IHNlZSBhbnkgdGVzdHMgZmFpbGluZyBiZWNhdXNlIHRoaXMgYml0IGlz
IHNldCBpbiBYZSBvciBNZXNhIGJ1dCBiZXR0ZXIgbm90IHNldCByZXNlcnZlZCBiaXRzLg0KDQo+
IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+ID4gKw0KPiA+IAlpZiAoWEVfV0EoZ3QsIDE0MDk2
MDA5MDcpKQ0KPiA+IAkJZmxhZ3MgfD0gUElQRV9DT05UUk9MX0RFUFRIX1NUQUxMOw0KPiA+IA0K
PiA+IC0tIA0KPiA+IDIuNDIuMA0KPiA+IA0KDQo=
