Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C7C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 09:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B828610E7C4;
	Fri, 24 Nov 2023 09:04:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05ECC10E7C4
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700816685; x=1732352685;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1TUpV0RL8QmX0a5eqQn2+QoiSGT8cLrr06DWWO+4Y+0=;
 b=J/lNWQ8Jjfu5ZvBSqxYzaHIJUsHQac1+MwSz8K/l+dPeL/fuoyepf4Fl
 crqMRcBVqhOkp+tHviVuKde0dcl55zuV33WrhXS6Q0Nbh5ov/7Efv3hNc
 RsthR4uOnSWY7sm6BoMQE6GyxO8UOuta2/Al6RbMmQG4JJlZfCXn5VQU6
 8gvjVSGu7M5d4TpRatr1jByDKk2Vkt83wr7Rsxk8lhoR4e/waGv2Knwmg
 WTKnvgf1hzagwzWycE7Iz/sa6QhxqMfDqKgY0jsjTF0BP+n5bVcL/mHz+
 /x2LDsQqgHj4YC66e8BNVRMxBjGGYByO7HbzA5tNIQ/NW9uxGW1xIzDFn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13947989"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="13947989"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 01:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="891015249"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="891015249"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2023 01:04:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 01:04:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 01:04:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 01:04:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 01:04:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoxFnnQoIpqzdD5nNqMpDHNaB5aU8FMwjDVdJGsAJaWtMvH8jHIPMylGa1Z7yTooNpX2RzxCAEn0SbP/nVo6B3P671u+oFD1arM9BcREqgZQdexjf4vCYxRSis4cQWiePgE1apMQM/piMo02QlEjPTAqLtmXIJQ/TTOim1FgXUAm3HA2tjA7GYw4Xtsf41tHQq3ZEpuDOlHu4jPPiKQB/zIAvRTA99YKbLgb7qJhh+1ChK2eE3vhbv4lpIB5sUjbHcSrU+JsyS8UbZomttw1FALe6JGbLLDYQt1e4zkCwTSJaq6SpKlRkHxP1+m2peHlCz0RyMce3cjc+GSUvdQN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TUpV0RL8QmX0a5eqQn2+QoiSGT8cLrr06DWWO+4Y+0=;
 b=YFCiGOpAHmCS4tuUUSukdOa4vvXjyQNzN+IHSJXUtgLhusp4biwXo1bDe3UysO4aamnroO+l3VDveWSZ20XNileuWX5BfmFgfil7cYINVwPzBnQDH+K4xlCmRDlx8e3s8K2N+bMzoFxRri0Mmr5VnK+sDvDle4BgvmXmeHFXsI2Ph+OeBbZrT8UgZmnLdh5GtEeVIr7ag2+0dH4y/ULnJkLOuDYxLrRlk+eC74dmfVUFa9AtS0ArM7XXgYPTVGnUbSNScYxHKpwFNxgpV+aMbQBGsGpw4lqec5xEED3uiWczrJl8URqDHmLthFntTjkml7hT1WC/GpiF70ij5M5ecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.22; Fri, 24 Nov
 2023 09:04:40 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::2341:5d0e:a1b0:c7c8]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::2341:5d0e:a1b0:c7c8%2]) with mapi id 15.20.7025.020; Fri, 24 Nov 2023
 09:04:40 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>
Thread-Topic: [Intel-xe] [RFC 03/25] drm/xe/eudebug: Introduce exec_queue
 events
Thread-Index: AQHaEKOEcs+0toWelUGaWbqiQ9KTXLCGmD+AgAAZAYCAAU1OgIABSq2A
Date: Fri, 24 Nov 2023 09:04:39 +0000
Message-ID: <107214161009c5c5d6b2b35eca9c791a4daa63dd.camel@intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-4-mika.kuoppala@linux.intel.com>
 <ZV4lMfD0b37rhb7j@ashyti-mobl2.lan>
 <01ccd1935007538ed2a7b0347476e8c5ecb447b9.camel@intel.com>
 <ZV9RwyWZKIujjV9G@ashyti-mobl2.lan>
In-Reply-To: <ZV9RwyWZKIujjV9G@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|MN0PR11MB6112:EE_
x-ms-office365-filtering-correlation-id: dea1a3b5-aef1-4d1a-c094-08dbeccc6416
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dSRntXdglYnA5yzzsWYuu3omxNBltH66mfCpAJA9JKkfKZIiNxq15kJzMpxqM93ZAWs+ZMRfXaf6vIaZAgoggW/12u1us2NQqm0j1UL9J/0Tl+9NiPPknrR4Qb9iwqnoyvz1OLES91zx32gbtlTDVaA1NcyE58NfK5T8XqjYTbLLg70c/b/ujBe8BFPcE0wNU2+mCcHAqCuG9NUrC4uX0+Ih68+rNgvtrtN6NAH/IeLV3czx4nkcA7Y1Gh6KtscRbBAJMdmONPa+JkCnwBdGmrMn0hlmQ1rAsakKU1b5H/0xgNCt9S5cy9LvKbdjr5nqoAJ4ctzbtFmvYhhv2A0eCRytT6OoPmoGO72zvem6cbhsp7IsK9AZfqhFzSnDSQ72qxsUb25AblY5acmPHyym90kn1jJ8rKeRanhFKFqiTC4E7zWYYzTtpfx0sWwMMMtxteD1pMnPBw9GOMcHvj/I9v/NSpVZOcZllKAVbddBZ2JtYp4eklkC4r+N8PktlhtwiWndB8q5P7Wz+zWxZ2bCSKYWtNPDlFFxYIiGFOVJ9eTZEIYewyDZhqYePQBx4YX19Inj0dtz0/I5g2IpvPdKRPLItDKwxoT7PW6pXfMWyCYYbesEsLITEfBoslMzBj9w
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(478600001)(6486002)(6512007)(71200400001)(6506007)(316002)(6916009)(64756008)(66476007)(76116006)(91956017)(66946007)(66446008)(66556008)(54906003)(8936002)(4326008)(8676002)(38070700009)(4001150100001)(2906002)(122000001)(36756003)(41300700001)(38100700002)(86362001)(2616005)(82960400001)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzFoWEttQkZkQ1lvaDRaL2JCNnloVzBINS9oZkMwNTI4cXFnYTNUeldNWlIx?=
 =?utf-8?B?LzRib3lYa2UraVJ3RnY3MTE0aWVWd3JFaXgwcXFpb1kxUmhnUDgyVWpKb3FB?=
 =?utf-8?B?dkFYOUNqUXBYcGZobWZ6U3U3ZnpJOGtlYys0OUo5TVNMTmdScFBJWHhQVUpC?=
 =?utf-8?B?VjNsL09TcGxTNTdaeHZodVEwNHFma1NUTzJWYThJRzdKQzY1UEZiM3Rib2po?=
 =?utf-8?B?RkhPOFkwQ3d1SktHK3JzTVV1akVLa2JpVXNKSTc0aUlhQmtybTZMZ2RXMnF2?=
 =?utf-8?B?ZnZvdXEvRVVEMmdud1VhTE5KekxVdzhMTG14N3hCOTdMOGZtYUh4OHdrNlhq?=
 =?utf-8?B?Z0dDLy9BMG1oODNYSXdBVVhETlFFVXNkYnk2NzVBcFlJR2FwN2p5WDBUNFhO?=
 =?utf-8?B?T0FtQ0Vlc3VkVGdDdjNIUUYzNWgyZ1ZkZ294a2xqSTdDZkZHZHFIRFgzc0FH?=
 =?utf-8?B?QTZLbWUrcG5IK1pNZHB3K1FiSDg2SWhOb0VFdFdnaEc2ZzVmcmRVQVFUdisx?=
 =?utf-8?B?aVNtM09zalFxWXRjZkxpMWVWek9DaVBPMDZQTVFSWHNaZHBiOGQrRVNQS2dn?=
 =?utf-8?B?UDR3Z2hJWmpHSEgramVoQ1llNFFDMjh6cmN2ci82NWt1Q3pLdXM4dnJHZTJZ?=
 =?utf-8?B?VWFsZTh1WUdlTUxJb2FuR1E2SUVFOUdJSHdCUUNveEFkR1VDUFh6bUg1QVF4?=
 =?utf-8?B?L1FsbVFESzJwb1NIeWNpOFQ4Tm52WVhCR1FZM1krS3RhUm13bjZnbVRkVHU5?=
 =?utf-8?B?MHpvVWxWRmwyTmJ0dGN0RWw2YjJTYVpwbXY3Vmpzd0FLMGp1V2pkWjhhb2I0?=
 =?utf-8?B?TTdNUEFjclcwQU1hYU9Pd1ppOVU1VHRsR0RKanBnNUM4TVpTY3hraFZnd0FQ?=
 =?utf-8?B?L3VZZXlzNEdOZDZ3bC9TQU1kZWRCelc2VVpuNDhoOHk1VXlzNHJiem05bnRk?=
 =?utf-8?B?bDJoSTBVdWNUc0VRVDBIVVdXWjdtZXN6ZEg1cXVlcERCc25kTUtNYjEwemNz?=
 =?utf-8?B?b0J1ajVXcEQzQ1hVU2JlYWZadXQza2Vla0Z0SmorRUdWcTF4RHZvWHkwOHVs?=
 =?utf-8?B?VE91M0poeTdFYStuQXY2bmFUcWhudkFRZDFjQk5DcWpDSVNGSXA2L0VpeWda?=
 =?utf-8?B?RXJZeVlSVG5kOGdDVUtOZHNHSnhuUlRCdlJjZzRIUnI5QlpPM2pKZUpIZjh6?=
 =?utf-8?B?aFJ2cTBtZWFDeFN0REhpbXc5anlCdS9PbjV5Wkd5M01ZME9qSmNRREtFamky?=
 =?utf-8?B?NlNPaDZWUDdsOXc0VWM3YXZCdXRkRW1WZ044Y1FRV0dUeUxmOGsxL2IyK2hx?=
 =?utf-8?B?QUd1L0hrSDFUN09ic3MreGRvcmcrYml3VktscUZybytlTTltUXRVdjBJZktr?=
 =?utf-8?B?dkFWWEl5aklLaCt6VllKc1A2TzFEQjZvbjkvc2UvUU9OZjN4NVhmZklxOE41?=
 =?utf-8?B?cEFEaTBRV0tONmVBTm8wN090Z1Npai91RG1tZytZM2hSRlhkWXZxWmJqYWhP?=
 =?utf-8?B?OER0REowZ3FsV3RJUEl5QzBFRlNIRkQybVhid2tISktJWnFvMzQzcXdzTyt6?=
 =?utf-8?B?M2pZSWY5ZHllSDlIUjZKSmQrbXRkTmcvdnpMcmZqWW5aZVlwWW9WcWtXajNp?=
 =?utf-8?B?Y1lpaUk0Z1JVTytRYktLQndpY09BWm1oOC93TUlQTXgxVDEwUFdQdFZTMjVK?=
 =?utf-8?B?OFJlcU9FZi9acjBBOHlFN1RxY1VJWk1meGwwazFNaEpYUEdlN0VQRFRDSHkx?=
 =?utf-8?B?cVVYT1pTWk9QRExiQzdubW1pVGpKbVdOUXZvOWZacCtyTC9hdElFRlhpV01w?=
 =?utf-8?B?MVBSRlRKWjlxcjJjdG9yTnoxWjk4U0poMWdkUEtHcGVmaGYzWVI2U29xcnZV?=
 =?utf-8?B?ZUdpT2w1V1VlQjMwa3VuMU13c0tGSjdDTzRRZW9sdnNzdmtiMmxzS1pFZ0Y0?=
 =?utf-8?B?SmZBTmdiTCtVZjQvSm5lRURoOXV5Y1M1WDdoQ3lLcXVLTUVKN09QL3JGWDJO?=
 =?utf-8?B?VDBLYVk2YXdTNlp3elZETXBvelllTlBRUTBGOUE3dGpnSVpuaXZCVlRTUHE0?=
 =?utf-8?B?VU9ENG5XZVdNSngyaElZZWE4VmlNd3RIanNBd0J6cHAzWlZyeTdxQ21LVlhK?=
 =?utf-8?B?OEIrKzNZcDFoOVpYNUlyc1lmcXRaeWgyMEpPeWRPakdJTjlPeDV2MDI1aytI?=
 =?utf-8?Q?MhC0I6ZsujrNrw7Xlw/yeCY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EAD41478D8DE944A7244B8BAA3A0435@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea1a3b5-aef1-4d1a-c094-08dbeccc6416
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 09:04:39.9228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySTMHEcTpWNtnWQU2vsGxbmQHI6+N/otXUmxZKHm+962OQX21+NQw6izvJdgKl8tdjsbqlseCIiJRLZXto2bH42jJoPBvoykkn61JfJ2UoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 03/25] drm/xe/eudebug: Introduce exec_queue
 events
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

T24gVGh1LCAyMDIzLTExLTIzIGF0IDE0OjIxICswMTAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBI
aSBEb21pbmlrLA0KPiANCj4gPiA+ID4gKwkJaWYgKGggPCAwKQ0KPiA+ID4gPiArCQkJcmV0dXJu
IGg7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkJaF9scmNbaV0gPSBoOw0KPiA+ID4gPiArCX0NCj4g
PiA+ID4gKw0KPiA+ID4gPiArCS8qIE5vIG5lZWQgdG8gY2xlYW51cCBmb3IgYWRkZWQgaGFuZGxl
cyBvbiBlcnJvciBhcyBpZiB3ZSBmYWlsDQo+ID4gPiA+ICsJICogd2UgZGlzY29ubmVjdA0KPiA+
ID4gPiArCSAqLw0KPiA+ID4gDQo+ID4gPiB0aGlzIGNvbW1lbnQgaXMgbWlzcGxhY2VkIGFuZCBu
b3QgcHJvcGVybHkgZm9ybWF0dGVkLg0KPiA+ID4gDQo+ID4gPiBBbnl3YXksIGZvciAtRUVYSVNU
IGFuZCAtRU5PVENPTk4sIHlvdSBkb24ndCByZWFsbHkgZmFpbCwgSSB0aGluaw0KPiA+ID4gdGhv
c2UgbmVlZCB0byBiZSBjaGVja2VkIGFuZCB0cmVhdGVkIHNlcGFyYXRlbHkuIElmIC1FRVhJU1Qs
IEkNCj4gPiA+IGJlbGlldmUgdGhlIGNvcnJlY3QgYmVoYXZpb3Igc2hvdWxkIGJlICdjb250aW51
ZScsIHJhdGhlciB0aGFuDQo+ID4gPiAncmV0dXJuJy4NCj4gPiANCj4gPiBJc24ndCB0aGF0IGFs
cmVhZHkgaGFuZGxlZCBpbiB4ZV9ldWRlYnVnX2V4ZWNfcXVldWVfY3JlYXRlPyBJbiBmYWN0LCAN
Cj4gPiBpZiByZXNvdXJjZSBleGlzdHMgd2UgZG8gY29udGludWUsIHdlIGp1c3QgZG8gbm90IHNl
bmQgYW4gZXZlbnQgdHdpY2UuDQo+IA0KPiBubywgeW91IHJldHVybi4gaWYgKGggPT0gLUVFWElT
VCkgcmV0dXJuIC1FRVhJU1Q7DQo+IA0KPiAtRUVYSVNUIGlzIHRyZWF0ZWQgYXQgdGhlIHNhbWUg
d2F5IGFzIC1FTk9UQ09OTiwgd2hpY2ggbW9zdA0KPiBwcm9iYWJseSBtZWFucyB0aGF0IHRoZSBx
dWV1ZSBpcyBmdWxsLg0KDQpBaGggb2ssIEkgdGhvdWhndCB1IHJlZmVyZWQgdG8gJ3JldHVybiBz
ZW5kX2V4ZWNfcXVldWVfZXZlbnQuJyANClN1cmUsIEkgc2hvdWxkIHByb2JhYmx5IGF0IGxlYXN0
IHRyeSB0byBhZGQgYWxsIGhhbmRsZXMuDQoNCj4gPiBZb3UgYWN0dWFsbHkgbWFkZSBtZSB0aGlu
ayBpZiB3ZSBzaG91bGRuJ3QgYmUgbW9yZSByYWRpY2FsIGFuZCBkaXNjb25uZWN0IGlmIHN0aMKg
DQo+ID4gYWxyZWFkeSBleGlzdHMgaW4gb3VyIHJlc291cmNlIHRyYWNraW5nLiANCj4gDQo+IG5h
aC4uLiBJIGRvbid0IHRoaW5rIHNvLiBJZiB0aGluZ3MgZ28gd3JvbmcgbGV0IHRoZW0gZmFpbCBv
bg0KPiB0aGVpciBvd24sIGRvbid0IGtpbGwgYnkgc3BlY3VsYXRpb24uDQo+IA0KPiA+ID4gPiAr
CXJldHVybiBzZW5kX2V4ZWNfcXVldWVfZXZlbnQoZCwgRFJNX1hFX0VVREVCVUdfRVZFTlRfQ1JF
QVRFLA0KPiA+ID4gPiArCQkJCSAgICAgaF9jLCBoX3ZtLCBoX3F1ZXVlLCAodTE2KXEtPmNsYXNz
LA0KPiA+ID4gPiArCQkJCSAgICAgcS0+d2lkdGgsIGhfbHJjKTsNCj4gPiA+ID4gK30NCj4gPiA+
ID4gKw0KPiA+ID4gPiArc3RhdGljIGludCBleGVjX3F1ZXVlX2Rlc3Ryb3lfZXZlbnQoc3RydWN0
IHhlX2V1ZGVidWcgKmQsDQo+ID4gPiA+ICsJCQkJICAgIHN0cnVjdCB4ZV9maWxlICp4ZWYsIHN0
cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArCWludCBoX2MsIGhf
dm0sIGhfcXVldWU7DQo+ID4gPiA+ICsJdTY0IGhfbHJjW1hFX0hXX0VOR0lORV9NQVhfSU5TVEFO
Q0VdOw0KPiA+ID4gPiArCWludCBpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJaF9jID0gZmluZF9o
YW5kbGUoZC0+cmVzLCBYRV9FVURFQlVHX1JFU19UWVBFX0NMSUVOVCwgeGVmKTsNCj4gPiA+ID4g
KwlpZiAoaF9jIDwgMCkNCj4gPiA+ID4gKwkJcmV0dXJuIGhfYzsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArCWhfdm0gPSBmaW5kX2hhbmRsZShkLT5yZXMsIFhFX0VVREVCVUdfUkVTX1RZUEVfVk0sIHEt
PnZtKTsNCj4gPiA+ID4gKwlpZiAoaF92bSA8IDApDQo+ID4gPiA+ICsJCXJldHVybiBoX3ZtOw0K
PiA+ID4gPiArDQo+ID4gPiA+ICsJaF9xdWV1ZSA9IHhlX2V1ZGVidWdfcmVtb3ZlX2hhbmRsZShk
LA0KPiA+ID4gPiArCQkJCQkgICBYRV9FVURFQlVHX1JFU19UWVBFX0VYRUNfUVVFVUUsDQo+ID4g
PiA+ICsJCQkJCSAgIHEpOw0KPiA+ID4gPiArCWlmIChoX3F1ZXVlIDwgMCkNCj4gPiA+ID4gKwkJ
cmV0dXJuIGhfcXVldWU7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlmb3IgKGkgPSAwOyBpIDwgcS0+
d2lkdGg7IGkrKykgew0KPiA+ID4gPiArCQlpbnQgaCA9IHhlX2V1ZGVidWdfcmVtb3ZlX2hhbmRs
ZShkLA0KPiA+ID4gPiArCQkJCQkJIFhFX0VVREVCVUdfUkVTX1RZUEVfTFJDLA0KPiA+ID4gPiAr
CQkJCQkJICZxLT5scmNbaV0pOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJCWlmIChoIDwgMCkNCj4g
PiA+ID4gKwkJCXJldHVybiBoOw0KPiA+ID4gDQo+ID4gPiB3aHkgbm90IGNvbnRpbnVlPw0KPiA+
ID4gDQo+ID4gPiBBbmRpDQo+ID4gQmVjYXVzZSB3ZSBjYW4ndCBzZW5kIHZhbGlkIGRlc3Ryb3kg
ZXZlbnQsIHNvIHdlIGRpc2Nvbm5lY3QuIElmIHdlIGVuZCB1cCBpbiBzaXR1YXRpb24gd2hlcmUg
dGhlcmUNCj4gPiBpcyBleGVjX3F1ZXVlIHdpdGggbHJjIG1pc3NpbmcsIGl0IG1lYW5zIHdlIGFy
ZSBhbHJlYWR5IGluIGFuIGludmFsaWQgc3RhdGUuIA0KPiANCj4gU28gdGhhdCBpZiBvbmUgaGFu
ZGxlIGZhaWxlcyB0byBiZSByZW1vdmVkIHdlIGRpc2Nvbm5lY3QgdGhlDQo+IGRlYnVnZ2VyIGFu
ZCBjbGVhciBldmVyeXRoaW5nLiBSaWdodD8NCg0KSW5kZWVkLA0KRG9taW5paw0KPiANCj4gQW5k
aQ0KDQo=
