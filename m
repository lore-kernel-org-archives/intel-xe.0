Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CADC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 17:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9258410E8EC;
	Fri,  1 Dec 2023 17:16:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0F110E8EC
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701450967; x=1732986967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=q5zy57fheXizIwXXdWW6qJktDz5MYBhhDBqfnWRx488=;
 b=XARcIWw3DYZhANm8Y2OnWzwQJvHQkPdIbcerZkpSaZaAl34qOGJ1Xirx
 dU2MQNnZUlM+WjdxZtjo/P5g9DaXxEBjuIijrcC/aw+mNhmJ1q9Zd8JeV
 ODtC/X7F/vzMAnplWHT4uaKv2PbgnHBB+jsYsUy/hjNsbhBoa6VhInPtS
 wfbG93EjC17oJpbdObmjw/dIETIMD6GGp3PU1iLIYQQ8/N9VHlQsnIVkc
 oz/uwgEO1ueFZXQydoORCEC0K7OODHt70s/J3asuxt9Uexh+0Y/B1gogm
 bjvUdR3h4tyJLGGZBL/1goJ5wBs9Hssc4RCrIk69HIcOKjBP3YgkoNBt/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="390694355"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="390694355"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 09:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="17827862"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 09:16:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 09:16:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 09:16:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 09:16:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 09:16:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcFXq6zTCmdPH94z8H7/UJo8uf0DWummfsuqSfp9RZR+C7EuI8LaIok23jknK50bm1e0dz8hxnI2zq7H/E0nJEAjIBWPxeLYNgPngKynnNFhyMBTNkfN0arY4koHMugYS0bWiJw9JoZZBeApAlomkaPAbjIJBX1tTBk6ksttExR2U1iISh7vmLdpR2E7lsVte9jNabiNIR/hNLhQc9aVyqKauMuSvdPcVJrxzc9J61qv2UjvCzRUH8rxYk6SErmeQrLcP7tXohiUhznJuAd0Pn+56GlTbehbdI6M8jf4/O7m9mKuq4zHXJupvcaidr842TxeiGtvG30ik9W6Pp0WYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5zy57fheXizIwXXdWW6qJktDz5MYBhhDBqfnWRx488=;
 b=dB+IPfwNkNxo/KeMlv3tCKMIF86u0VukGsVq5z4+pPs/GasV5p7RDjlO56TX6oXY5sStpxgmqbaGYRd2XFQLXxjlpmzoi3H1JuSyRFl+QHobeqvqo3a67EueFpMWRwK49Ldd8u5exXHs7dTdKShFRcO/8U+F1HW2kmY+yCtLO1I+ITHJESMAzbxzNoetIqNeJPH3dWVHnhsYiKuNfxavuypzQ76S250M7SfWHCrwm8adfe1a8gJXY2XEP/i4HXspJNjt3Rz/wVvFNZm+NZRJlGSomwkSwQ42a2sSJ2mT8on1tzcr8Uq6h0F2jZ1YpuAIZPzf7ZA5GL2skj9KesGvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 17:16:04 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 17:16:03 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [PATCH] fixup! drm/xe/uapi: support pat_index selection with
 vm_bind
Thread-Index: AQHaJGjO8cDdijEn9UOuv2TdGocFgbCUq0uA
Date: Fri, 1 Dec 2023 17:16:03 +0000
Message-ID: <9e3473286c60a98d8e06d24bd8e21caf9dd3f057.camel@intel.com>
References: <20231201151147.538291-2-matthew.auld@intel.com>
In-Reply-To: <20231201151147.538291-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB8130:EE_
x-ms-office365-filtering-correlation-id: 6d2d320c-2332-4ffe-8464-08dbf29132c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r824tB2o2Mw7LeouFtFwCMxFoB9xeVDWSQnUXRuwtdIOV2htsp4DW9siz37XGctmsQNs00sFsJz7ouHXaXkABoWOPc/V8HGxjMnTmlHFjzzI6xXA4DiWPJLQsf+2a+IBAU+Aj6Z2MtyS67lFBPypCiK4VGqPRq44jPrZfgVoQidbv3ckubxoSQo/sihDNpS5Y9xtgiOir2H3hUK8jYvT9patyo66YCUa/BVZfnY6BGJrqm0NuItWjJqncCfIZMLT8Kj2/ZlPAV/wk34TbTwnncacQ+XbPc6XNzYiEXKqBeEm1mOmm51xs7JQer+6q1iEFOnK5szJHqkH/GWbH0ZR9KeiBS/koTT3Cm/iQMakiYeb7xWLhAmgDJ0d3FRJD9NjVn7+7Z9tS7Y46v7spvmPLNUNKPhOKCOhqXwrzCYOQM5byA+uaAuw4pHGEHfzJqClUBUoCmenAlqN6GNXl7NAQGkk9GoGUFSGYLInQVIk8IxkEZlOost7GFx6cVGlArDI0bq4vSeRk8tP3tlJGreH6vMPtv5NFVQdEwhGU5Wj49oTYspkkTJ5H4HfPOWbbVWMQ0RxoyLiGvPhBBPbB1Zucgb3OcTbWn+GlDX9KZLDwovKbKI9vzapSFx2VJCJiD6c10gdaPN1H1lLgIzVM2wvlw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(38070700009)(66946007)(66476007)(66556008)(64756008)(76116006)(91956017)(6636002)(71200400001)(82960400001)(38100700002)(36756003)(86362001)(122000001)(966005)(83380400001)(66446008)(6512007)(26005)(6506007)(107886003)(2616005)(110136005)(8936002)(6486002)(478600001)(316002)(4326008)(41300700001)(8676002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2N6b2xSOFBxOFVQM0pwdUFjOE16QUxuRXZEdEZrbXZLWEp1aDFOWll3dHMx?=
 =?utf-8?B?cGVIZmlRZjk1enFTd3RPTmhNdXRSR3NTL2lPOG5LOVYyUDh0bGlBYktjUzh0?=
 =?utf-8?B?VVpEY0ltUnluc2FLeFRVQjg0elI3Z1ZaNzZ5TlBkQmEybEpRbWxaclFtc0hy?=
 =?utf-8?B?V2JkWXA2cHAzSXIzNmtXSFdLbzlmRzdKWmZyL2NIM1dneW5DNVdmak4zam50?=
 =?utf-8?B?WG9jK21uSmVSNXcyNnQzQ2REdkNMQ3VWSTZVeloxWi9rWjlqbGdzcFkvVWtq?=
 =?utf-8?B?UDVPVHlrbU1WVW51OGdrV05iS25vOERjZGptU3pXK0lLeFVCZ25GVVJ2di9K?=
 =?utf-8?B?TUI3cHRoS0dnREtRbUpKUEJoMlU5M0c1NGw5MXl6dWZCbU14NXJoc3UwcHhE?=
 =?utf-8?B?bHpGZEk4d0theTdMZXd0dEc4ZS9ISVNmVGovbm9iU1d1aXk3c3dZT1E5RVM4?=
 =?utf-8?B?MXpaS3pkUkxKMEFuRW82cUIrcUUvSFFsVXNXdHI2NFR5Nzk0MWVyM2NBY1lF?=
 =?utf-8?B?Q0RVcWo0bXJyOXVJL01sRHBuc3hJaWRTUUt2YkdwRlZtMGt5NHRrN0g2dVNk?=
 =?utf-8?B?WnE4QTRiZHJTTmt6V0dJUlpRSzR6ZVVtbWw0ODNKVTlTMUdQMTVSTjRHKzQv?=
 =?utf-8?B?cDNKQ0crQ3lNUS92K25Bd0ZOQU1HN2o0QURxTThuYWg4TE12WWI4VUsyZkp3?=
 =?utf-8?B?bjFUd052N2xBUVBQMUUyN2RxUlE1TnJPdlFvUTFOWjYwb20yVm92dUFhQVh3?=
 =?utf-8?B?dHJTUC9PZ21HVnlDZG8xRERSc1ptYUhlWDRFMUs5Y2djQjhzY2txekJzZDB4?=
 =?utf-8?B?ajBXaUF5ZnVlWmJrMjV5Q0Q5RmI2Si9NeHFTcDhoekRpNFFvd1N5RmxabFFJ?=
 =?utf-8?B?SnNqR0djOEdZTjFweEg1QTV6RDdkTGg0Q25ZYlJKSTZla2EwS3MrbEpmcm5p?=
 =?utf-8?B?QjNxaFNNcXcxb1NXT0xOT0VpY1NOYi8xM2IvdUJuVzlNVFJPckNRTjA2YkNj?=
 =?utf-8?B?eFlLeXp0cEtwOGtlQjNuNFlqNUU5MnRKVHFuUTlNYjlsd0lGc2xrZGcxaGZz?=
 =?utf-8?B?UXg0Ymd5dFBRUHZVQTZBalI0b3QzQzN4eTNZSGdRdnRuZ1ZYVGtKaDRQWkdn?=
 =?utf-8?B?NkxVV1hjVHYwTElJOGUvK1J4QnpaSk0xajdVL2dCcWVIVTJHV09NUnUwUVow?=
 =?utf-8?B?RC9PMnQxM04yclpQblE2WUMzVjJWVDFzTk9uSFo0aXNuOUFvakZIOVpaamg5?=
 =?utf-8?B?czN5MzRydXJuZUQ2MGZiNkU2MGFpbnY3QnNiVXRnZDdOcDVKY3F2Zml4bk52?=
 =?utf-8?B?WERHcWV1UmF2QWdzVnZoZ0hPTHhTNGE3MmdqYnA4dTM2SDFKU0NITjRESmY4?=
 =?utf-8?B?WEE3L3kxRW03S2sybFc4d1BuU1FlSWlpM2ZITlZ0Vk82OWdxd3ZpT2xrMzdz?=
 =?utf-8?B?cTJrdElRNUJXRjRuZUYxeFEvN3NIcUNRWG96Vm53eDR2RHVkT2hQcWJxT0xi?=
 =?utf-8?B?aDYzZVhWWUxZUGZveE54aUdzbEE5QzZHRjhvTElEY2trR09zR1MzRE1PeDl5?=
 =?utf-8?B?QXdoWFVmeU1BaldqMm5BNTlKZlhON2ErRVJtTG11M2Q1SGR5T1hodzBhWjRK?=
 =?utf-8?B?RlJiQ3g2KzJJSEsweVVaL0F6N2lqMlJQckk4VDQ5UHpQRXp2QWhRQXFnK3ZH?=
 =?utf-8?B?V2h6K2hlRTNTRjZVSHhOQVp3SWkyOFJ2c05XalJwZDZmekdZYmJMK3Rtc2xP?=
 =?utf-8?B?MzI1YzRIc1ZnZE9uaStRVk9LZ2lzMC9oSW1LelJiRExYNE9MTWtUZnlPTXIr?=
 =?utf-8?B?SEMxS2dQekNjb00wVW5TNG8ybU5YVkFsSEFWM01uZHdtbkl1NnZwMG9FUDJw?=
 =?utf-8?B?cFl3WUxjaWtRalkyQmRtejR3elMxSy84bVZhOUIzMDBkRWg1Qy9kYVRzSWRq?=
 =?utf-8?B?NWtwTVJZWmN5KzNiWmlYZys2bmtUeDUxVnd4NWdpMVZGZkozWkVQcTZtcWg5?=
 =?utf-8?B?Y3EzU29ZbGI0K09ITE51MVFyV1FycWtDUFBhaDc2WGRIWXZiR0lTV1ZMaWk0?=
 =?utf-8?B?QWRRM011ckJ1NitBc3JsbTdVL1A1U3d5ZWFRQ29IQlhJN2g3NmxRUElPMGI1?=
 =?utf-8?B?TjkzeVJvV0NVc241ekxRd1dZc0QxOEFmb0g2T0YxM01ZYWQvUGZ6V1g1aWtU?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBE73C6BCF6BE141A80B0B131BCB0C3A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2d320c-2332-4ffe-8464-08dbf29132c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 17:16:03.8952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzX+Hgm7i7MKNUL7k9Y/IY66r808c9ZzvcpaKpkZ8stVAAO7RYFLeY+NhRZwSU0X6Corwq6jYP5o2A8T3tis0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/uapi: support pat_index
 selection with vm_bind
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

T24gRnJpLCAyMDIzLTEyLTAxIGF0IDE1OjExICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEFkZCBhIG5vdGUgaW4gdGhlIGRvY3MgZm9yIE5VTEwgYmluZGluZ3MgYW5kIGNvcnJlc3BvbmRp
bmcgcGF0X2luZGV4Og0KPiANCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Ev
bWVzYS8tL21lcmdlX3JlcXVlc3RzLzI2NDMwDQo+IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9i
ZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gVGVzdGNhc2U6IGlndEB4
ZV9wYXRAcGF0LWluZGV4LWFsbA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+DQo+IENjOiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGlu
dGVsLmNvbT4NCj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggfCA2ICsrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4
IDU4ZTY1NTk4MTk5Mi4uMWE4NDRmYTdhZjhhIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkv
ZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTY3
Myw2ICs2NzMsMTIgQEAgc3RydWN0IGRybV94ZV92bV9iaW5kX29wIHsNCj4gIAkgKg0KPiAgCSAq
IE5vdGU6IEZvciB1c2VycHRyIGFuZCBleHRlcm5hbGx5IGltcG9ydGVkIGRtYS1idWYgdGhlIGtl
cm5lbCBleHBlY3RzDQo+ICAJICogZWl0aGVyIDFXQVkgb3IgMldBWSBmb3IgdGhlIEBwYXRfaW5k
ZXguDQo+ICsJICoNCj4gKwkgKiBGb3IgRFJNX1hFX1ZNX0JJTkRfRkxBR19OVUxMIGJpbmRpbmdz
IHRoZXJlIGFyZSBubyBLTUQgcmVzdHJpY3Rpb25zDQo+ICsJICogb24gdGhlIEBwYXRfaW5kZXgu
IEZvciBzdWNoIG1hcHBpbmdzIHRoZXJlIGlzIG5vIGFjdHVhbCBtZW1vcnkgYmVpbmcNCj4gKwkg
KiBtYXBwZWQgKHRoZSBhZGRyZXNzIGluIHRoZSBQVEUgaXMgaW52YWxpZCksIHNvIHRoZSB2YXJp
b3VzIFBBVCBtZW1vcnkNCj4gKwkgKiBhdHRyaWJ1dGVzIGxpa2VseSBkbyBub3QgYXBwbHkuICBT
aW1wbHkgbGVhdmluZyBhcyB6ZXJvIGlzIG9uZQ0KPiArCSAqIG9wdGlvbiAoc3RpbGwgYSB2YWxp
ZCBwYXRfaW5kZXgpLg0KPiAgCSAqLw0KPiAgCV9fdTE2IHBhdF9pbmRleDsNCj4gIA0KDQo=
