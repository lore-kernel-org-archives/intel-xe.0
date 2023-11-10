Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620B5C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294D310E10B;
	Fri, 10 Nov 2023 15:54:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA8910E10B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699631696; x=1731167696;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=5x3uF8UFdAeaIH7nkY5UzV/JpI+pFtkmtDKuBGLYMhE=;
 b=JN7k7y9ax23SB6Hj1D0J/JoeU7LB8MHxuDjGpSPH1la/qtj587cG2Msf
 sbPiZCIQHu25wsDON3Jcj8wtReyElhTPhl2rWF3j4IRDQsyHBxUUbmveW
 1+1pYdSfeDwUai85zPBb9/eq+4VgAkDFTN7KwXhQE/UQNdoPYPrYHvKrg
 vVP4qELRk1FH6r294qxELIKbW5vvgjmb1jqGVWsyYMZL95/UeYNyxVX6Q
 pvK23+tQMWoqSm4khkzl6WIZCaO/OPzawuRyQEcHy87xGsyc3ZRbwJeqi
 48z1vbmYvQMF5R+JG/2ET7tmogpYOefQDqS2sCCW75SL2sYjB9v82gADx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476423264"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="476423264"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="5082140"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 07:54:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 07:54:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 07:54:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 07:54:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkS12iB2S7gaoMqdsTLDkaN5qiCiZHKAu5140fKOEWflq2P3cQ1pp0UL9oMxR9xyBZb5Jj5cEytL5tMjUPKr/qpzDCxVH+TBU5zi3AHjawJP5WnltbDjQv2DJ9iOrfCM70+jXSbhw7ejYrAb1/qIBZE5agAtX6F8ar2ydyFJUSDS1DDbTvdEEDcC5zF1KIVIKmZ1s1H8P/g2a1XVh+XQUWM6dMZygvMgn1n2i4Vh1iUgYv5ZqGw5BrDf4YNRCXMwfz3QmCsjHiKSriD8fjp6Aiqe2eLgCWF+EuZt3ZRkD4yrmpjyLYgoMS51t0V6S+GJz7PLo38VGimZwK0py1ZgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5x3uF8UFdAeaIH7nkY5UzV/JpI+pFtkmtDKuBGLYMhE=;
 b=QNXZU3n6J3/xUErU90rsfs1TvD6PyUaRfA1Ui7r1muNwIkMdhaL8w5AnNeccaEC9HUASEI3IIbx9bOG2WOcl26ryhlR3pfDyiLMg6+6xVwJhiZWv3DZBTYkDQgapreNcekY6rKH+2jf005BFdBxAtAB1csntwAi6PIteQu6OjDqqla1eJS3dXiXh6C9fWqr552qha5WGRoSo55yVH3ShZBClKuXozo+KJaqcvCd4xf6Vd5YqW92uVE9+fUxWhzdmLzzpx3ToelJnLuK+h8AE75vj6PEfQqJfc8+W/BMqlbwsh6Q1cfBJOMRpj08mPWL7FtKSjcy2/+JskXt9b81IoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 15:54:53 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6977.020; Fri, 10 Nov 2023
 15:54:52 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v1 4/7] drm/xe/uapi: Remove unused
 inaccessible memory region
Thread-Index: AQHaE+yK++C3cpX9rUGjC/L/Y9bWV7BztKAA
Date: Fri, 10 Nov 2023 15:54:52 +0000
Message-ID: <4b4864d391e7beef250225b6eed05460b0b2f33b.camel@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
 <20231110154156.6-5-francois.dugast@intel.com>
In-Reply-To: <20231110154156.6-5-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5420:EE_
x-ms-office365-filtering-correlation-id: a9fb6d08-f5da-45b7-827f-08dbe20560c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qC8PULlIpU5Fq/wVdB4SbApKDK5hGn8DyavjCnJ6wxGnNCDbn/FvpO6bIqdgQdcdL2kIoJGSYixO5l8PMrEtCY1fjG7qd8iJp9X+VslWYF5B2bUoBUpyxWDndd5ubyo6rAvDoV9zjzBAzgM3ZpXfx2DuG0QYRFTil1gfwnflGbPn/ae4AV2ThQsHJlNbQLx613+lBSSVHrw3O8gK2UetcXYTENpKYJHtx/MRh9YKMRGZRri4iq8FrcW2etmKRwwcHG2T/BosMwkiA5tX/j36jGRPqxsfow+nxBj7xlyfPGAvaKxXwCwpCV27Iqi5uiISx5nybfws+LmzDlVl4pltBAM7dtHjbOHAQ1IhNZRX31Nmyz/UqMgT4y3WIyu37g4cfrhGY16g8MIS6FNc9ouiL9kHm8GuHX/SS5RtP+QMyhWdgPaZ+95QF8CL2UMQxmUACqbwQDCeVxlBrIRpLnZDtpWhSbFPH7TMcajiNFw613PMzdG/QQ+gMqBhKXZ762dWbWXnzNSUbwwzhCTxbCvfWGz0M/qAnQuynuefrS3lIV9Bvz6MD6wuP9tWKd9wNApl42Gz2/bzwG/8/FIMvkvl1nye2fmDKE2vRSEni13CqCmOEC75ZLc8BHMQOomNDEUh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2616005)(6506007)(6486002)(38070700009)(71200400001)(478600001)(6512007)(36756003)(86362001)(4744005)(2906002)(122000001)(38100700002)(5660300002)(4001150100001)(82960400001)(83380400001)(8936002)(41300700001)(8676002)(26005)(91956017)(316002)(6636002)(110136005)(66446008)(76116006)(66556008)(64756008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmFwclVMcHZGV1N1dlV1eXR0dU4yN2pwUE9aeFJMZHBuZ3licG5jNzRMbEZq?=
 =?utf-8?B?cGNPbkRHUEJsQjhOTU9hT09IOU82WmtEWVdCYnRqOWUvLzRJR0wxRkVzcGY5?=
 =?utf-8?B?d1dZWmhOeUFEeG4xWVZTRTlaekxyMitDQWJrcWR5bUJNK0RxekF3K0p4YVRI?=
 =?utf-8?B?aVZIajhXK28yMHc3d2hJbW5Qbi82eVBISHArUVFaaFU5SEU0cmp1S0h2ajFE?=
 =?utf-8?B?aFRZMS9OOFRocVB5c0hFb2t4ZC9rK2xaNU5TNU44cXliR1NxazJJOXpnNWR5?=
 =?utf-8?B?d1NWRDdVSkZncDVPL1VnOEZyOHoyVkhrNDhLei9IbzNYYnVhTFR6YXpCWUhr?=
 =?utf-8?B?ZGtELzlCdGNaUUQ5bjBxT2lWUHBUdGdSZE1qL00va2oyRkJEQ2JhWmtGWWtW?=
 =?utf-8?B?UU8xb2RwUEhuUXRZR01ta3dIQzM0Vk1OZEljZVVhcFA0NkdkQTI4Z3lGdmRz?=
 =?utf-8?B?U21CbTlWbmorYzYvbTBKNll3V1o1bHRyNENxSjRBdUpNK3U0cmRCdUt3OUIx?=
 =?utf-8?B?UTZDTG05bEhnZ1Z6NUZHTXNlaUYzNkRZMmpZaWdPR3R1ZmxFcTVnR0pmR2d4?=
 =?utf-8?B?QlI3Q2N1dVBIQTVnU0ZMRkFMZjF3dUJKWC9Ya3BPcHRLeVp2U2JwaFZTQ0Zh?=
 =?utf-8?B?VWhlRkhFQlQ1NGVhUjlKWTlmNGNDeG1mcHpSSk5ScEhFMjhnRHJ4R0d1dFpH?=
 =?utf-8?B?eUlQbE96SE9janZxazI1RkEwdWtaMmVLcU9UeDIxTkNCUHUwd2xsR0cxbmpp?=
 =?utf-8?B?dFZFbmEyeVp6bUtLN2t4RFRZU3ZwQjhFUnBhRHRCQzcrQmxJeHpkekE1alVk?=
 =?utf-8?B?L0R6VnVEUi81LzFQNXFRWStKTDRIV0Zjbys0MWJGb3R3ZUsxQ2YybWQyRGc2?=
 =?utf-8?B?cXN4RGxYNm53SXJTbjhIeVg3bFVPTXBjaDdlaE1LWVg0N0hvc0haVWJJUEZl?=
 =?utf-8?B?UEF3ais2UW1oeVdoQ1ZJYUFCRmJsMXZXNHRscnhvVHFkOTd1OWxrMy9ZcmpQ?=
 =?utf-8?B?WndiL0RIQUtVS3F0WVZUN0k0L1RjSHljM3BLWnY5d1VtVmN2blUwbEFPNkMz?=
 =?utf-8?B?SDJ2a2NrcW4yZVpPQ0ZrRnArd3JLalZGalMwa0ViUkdsRWdqTHFNTXhldUpD?=
 =?utf-8?B?cnpGMEQ5aDREQTNRZFJBbXlXbEFRMWRpOW9JR3dKTXV1TzdRS0xORG9DTm92?=
 =?utf-8?B?UUlDZldmbzlQU20wOUR0OUkyZWs0ZlNmWVhwWjViSmk3ZWFWTjdQRFlJSGVE?=
 =?utf-8?B?YnFsdnZ1dXp0aG1NNkwrSDFOc1FTeGJ2UVBYY0hCSE05QUdiNlRxTTAwMms3?=
 =?utf-8?B?Y1A2MnJmS0NOcXFtU2RKYlFtZGNvMGhRQm40NG41MERFWlVjVEZJRWx3MmRw?=
 =?utf-8?B?Qm5uSkhtZWphdHRwQlE5OWllSXdqNE1QZ3RJSlRsanlIVXlsR1FhWnUwZnNo?=
 =?utf-8?B?dzNWZFZ6NFNmaHpJOTRDaUY0ZXJJUmZSSHFTdzY2ejhodnlFQ0Q5OWVBZ05j?=
 =?utf-8?B?RFU1bTVIalFaVmJIZFB4S2I4cThzSEt2YURySUQrdXVwVTFFRy96Y2UzMk1K?=
 =?utf-8?B?UjFpaGI5RjJnK1FQWFNoYU1rb1AxODVlaFJsL05DZnZJbUxkaU9FUVBYNXJS?=
 =?utf-8?B?NnhMRjB4U05kSFA2WS8zS0hCdkV1LzFENXZZU1A5Q1hvODdwbUkwY3RGN01M?=
 =?utf-8?B?aGl0RWNTNVB1SExhL1BnbGZWSmNmN2lhL3lOdGtROEdUQmpSQWJUZjRWeERj?=
 =?utf-8?B?aTZReE9ZYlhhZ0dSUG1sYXYxbG05TXhXNEt3aThRdjhWYnpSejBvd2hxVWFR?=
 =?utf-8?B?bjVyVWowNGpBeXZoYmZNMXJzdUlGd04xd20wT1pwTkRZb0w2bnR1QUZQdkNz?=
 =?utf-8?B?V1UweHpxQUpRRjVrNDM1V1JUOWdrNXVlN1ByeVU0YmRjMW1FSWllNkhmRlFW?=
 =?utf-8?B?L004RzdZRGt3aFJYcGVOTnFuMTRYN0M4ck9QUmhYMXhhb2k4UmFkM0E2Qzhl?=
 =?utf-8?B?TnhmWU91ZTFRdHdCdTlMU3BRNjZ3VUtmci9GNEpIWXluWStnR1hnZWw2WUNG?=
 =?utf-8?B?VjM0cGg3NWwyVXBvQlM1TmdMbWF5Wk1ML01kaU1KYS9hM1NnMjVsL2JXM0Zq?=
 =?utf-8?B?NWFpaDNUb3ZGaXhjb2lHNkVma3c0ckxNSWNCYk5HaVZ3TzRydGhhZ1J3TGE4?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00563F975F52D84C815B641363B39793@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fb6d08-f5da-45b7-827f-08dbe20560c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 15:54:52.8991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRbJK5VzOBxj9ZxVXO013KpiiXgThNTnMW2bFGV9XQobmORdt+Pszb/JLMnJZj9W3LeQzO/F4w2eJV3ly7dFQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 4/7] drm/xe/uapi: Remove unused
 inaccessible memory region
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

T24gRnJpLCAyMDIzLTExLTEwIGF0IDE1OjQxICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoaXMgaXMgbm90IHVzZWQgYW5kIGFsc28gdGhlIG5lZ2F0aXZlIG9mIHRoZSBvdGhlciAy
IHJlZ2lvbnM6DQo+IG5hdGl2ZV9tZW1fcmVnaW9ucyBhbmQgc2xvd19tZW1fcmVnaW9ucy4NCg0K
UmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
Pg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2Fz
dEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDUgLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+
IGluZGV4IDgwOGQ5MjI2MmJjZC4uMGY4YzVhZmQzNTg0IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4g
QEAgLTM2MCwxMSArMzYwLDYgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9ndCB7DQo+ICAJICogdGhl
eSBsaXZlIG9uIGEgZGlmZmVyZW50IEdQVS9UaWxlLg0KPiAgCSAqLw0KPiAgCV9fdTY0IHNsb3df
bWVtX3JlZ2lvbnM7DQo+IC0JLyoqDQo+IC0JICogQGluYWNjZXNzaWJsZV9tZW1fcmVnaW9uczog
Qml0IG1hc2sgb2YgaW5zdGFuY2VzIGZyb20NCj4gLQkgKiBkcm1feGVfcXVlcnlfbWVtX3VzYWdl
IHRoYXQgaXMgbm90IGFjY2Vzc2libGUgYnkgdGhpcyBHVCBhdCBhbGwuDQo+IC0JICovDQo+IC0J
X191NjQgaW5hY2Nlc3NpYmxlX21lbV9yZWdpb25zOw0KPiAgCS8qKiBAcmVzZXJ2ZWQ6IFJlc2Vy
dmVkICovDQo+ICAJX191NjQgcmVzZXJ2ZWRbOF07DQo+ICB9Ow0KDQo=
