Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4683ACDB482
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 10:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E618010E2C7;
	Tue, 17 Oct 2023 10:58:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A7810E2C7
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697540310; x=1729076310;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=DI37RIEdMbUrpq23pAcRsLPTGYe/uuhvVYzysJVrD3c=;
 b=bFvhMlh/SlRQNYIPQf3PlErkiouBygSN0nRVSQyJMzcecGeIEGX431TE
 sDpPcW4wgD4UCA73LdebyEB6C2HWj21q7utFZWzRovBO5J95hFhBHLMcx
 gzBvX4GV7gcoyTsImxLOhZCqhTxQQVBvcj+QkGCMZypiniRBb311enJvh
 bve7gPfEcdUxJCxSIce//9X2TkPKXMJ0lmhltkNOR4imjJdC6oY14IO6k
 M7nbJE1+LWo+HK3OxaOZtVdZf6JuyGCubBYuGwdREhyeUf0J/54pY8m9v
 OvQDPSIabzvyKJWQELY2G34sXkheqUHibwwVWexsLwAbRN+0VFEO3MesE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="4356067"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="4356067"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 03:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="879776309"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="879776309"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 03:58:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 03:58:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 03:58:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 03:58:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 03:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RecrFdVXsFZ8h500vmqMyRZJNz8KFIMoLZnmatk2jpE+mcIvqn4PP1+j19gFgbC0asWyQJOyYU17EWvXMXI0//sL/HfWjZ/zmKZZHK3fnqOFyuLAC/m0BhCskkZbKqNtfFpU4I3JKyg35d896/BHKtCAbpmDLi+nk1dka6bAGmNWsjuRcybXP34dmSnBBBBq+cY6QUF7PBCkA8XbGQK7pGm0TjWUIkizhUBSd6NfDlu3TfchGpTlTj2+O73Di7u7Kr52p8Maof9t9bB7QOzPF8udOwVkLwQ1F2NYTKHdXXQ59Z3WFRgCOjBIwVooxZlOuTY4bH8/458n9N/0FhrCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI37RIEdMbUrpq23pAcRsLPTGYe/uuhvVYzysJVrD3c=;
 b=cTkebFWz5oXEsltlv7fC9hsXRAdKIbeYCYxIWJo1/GviAC3nq8dcn/RE9FGxm0l4FdVw9QQuf3/QVmgWS8GGPTDo6TpRX/CjT8JRMLCKTtWJ+//Zqbyo5peq6CsLEQot50HI38xR24onPDjw839R9GKrhqpgxplVGAWtAN6Les9pxDWziAeo4nwPI3Ais23DLFFeBGoESxAj4osOd86WJvFwM5RtMy2F9ha0AuM7T03H8f0XRY9FUmj//oB6L1f78o/no3Xb0ddwUKcdk9etag+FUuk9tVTaN77pc+k07+ShyvWEFl4wcXUTb7vVlL9BWTgKHMJxSI/lhCHXZ9Gh8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB8106.namprd11.prod.outlook.com (2603:10b6:510:255::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 10:58:26 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::483:8093:febb:f038]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::483:8093:febb:f038%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 10:58:26 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v6 0/3] Remove Stubs in HDCP code
Thread-Index: AQHaAOjaZe4I8t+gNUOQjANiRKCvxQ==
Date: Tue, 17 Oct 2023 10:58:26 +0000
Message-ID: <637ee7a5a91296c9aa74541bf6d49937461325d3.camel@intel.com>
References: <20231016090139.850525-1-suraj.kandpal@intel.com>
In-Reply-To: <20231016090139.850525-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB8106:EE_
x-ms-office365-filtering-correlation-id: 4c5eb888-ceff-4181-5623-08dbcefffd36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iIM6OnErnmH5XbT65vmzSaofYJ9gm4q/mWGU/4tVRSE4/Il6KWzejbP5QBxEPDZd5VrinBvOWteK7GPDopZzXLQgLJc5VDy6PDmn07mFvCfldoE2VbT7HSWCyYOUWdBBoyVGOU71J2NgmNJR2FwQvpUOEAfJVrcTPv1SC7BgNIWYxte0ZVvPT7vAv1CYlMEda2R3XfBM2uVw0JDNjXV6Bx9SZ/PxpCFKyyDkBj0WY2i0sYFj6JdlqQf9CGfCamFE9Lzr1Mge/hhPXqotrYGoQPvkq/XICATTQ+vZtpbHBvbn7YCUGcNzKSgQcvrja/g6Iek4X1o3AIXYfwC1/fnfOW3DZhn8kA4qCcnMyPSSHCDL+5vGz53lNpZzkn1FZFfEwoNRZhbxBWYVOh4q+TDw3MMDY0yJzRNG9/dT13e5UzXViHgn53QGrFtPCI3FYpJn+QpwZD+ZgM32nqKOuf+ypAjKE3wtyJbkIrIcDdU+JdCwUFg2XGfd9nq7tbe08jsGiuGxy69uOTBXgeu0oHcXks4so499bLfhcew35YjUSCnsirmfJdY5DgbzZoaOtMBZysB+XFk1dx4tEvj+7PT+O9XGxWFNg4b2LLTRIS0t6mA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(83380400001)(82960400001)(38070700005)(6506007)(38100700002)(71200400001)(6512007)(2616005)(26005)(122000001)(6486002)(478600001)(66946007)(64756008)(66556008)(66476007)(66446008)(316002)(8936002)(76116006)(110136005)(91956017)(8676002)(41300700001)(2906002)(86362001)(4001150100001)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlloQ0tuNUJDbWd4MkI5QUZ6VHZheFpGWFNlMklwYUExaFBYU0lmWkd5d3c4?=
 =?utf-8?B?R3E0L0VqMk5vNEFDYkdQSE85VERsTWlPSE1sR2RKZ3IraEhFclVuem5FdGtE?=
 =?utf-8?B?SDc0MEtrb1RxZWF0T2hYVUk3T3B6cUE4ZXNob0lvWCtTQ0pvYTYwaVAvNkNG?=
 =?utf-8?B?STFWNmFsSVlOME9xOCs5cWVwL0lqK2E2ZEg4Z1pDSTJyWERubDNoV0tzZjRi?=
 =?utf-8?B?WmJwbStsYnIxQ0ZacHJ3bm1wbndJcXgvS2xBdkhSRHZ4UlVVWkdRWGFVQnpP?=
 =?utf-8?B?ZHZybTQrb3BJRFZUTElFOXJSVDR0RlZuNkhsaFFRZm9EL1RiSzllQVB6Nk5B?=
 =?utf-8?B?cEk2ZWdBdkFhUThkUGUvemZKNnh6eXlvNldRcHVjNWRuOGZFNGk0eTlqekRO?=
 =?utf-8?B?eGVvY1lBUnZZZnFvN1ROd0N1dWN1azhxVVpyMEFrVVlQdFdJOFRqSHFvcXQy?=
 =?utf-8?B?THJWb3pMU0x5dzZWOFcxeHlad3dmT1RXZlBjTWYvallyRnJxK1g4QXg2L0Jj?=
 =?utf-8?B?MStOMnpnUExtb3cwNGJMWms3eHorcHVlU0VoVDZIZU1hTmxqU0NFbHF2Vm5S?=
 =?utf-8?B?Y3NlK1dJSlpmSStpMm5ZUkZWTm5zSnVOdFlRY0NOYkw0UDErei9ac0lkU2g2?=
 =?utf-8?B?VnZ5ZEpWdEREak92QXJzN1FGdy9ZblFmYkp4Z3R5RlZzdlN3T3VCL3JwTUNs?=
 =?utf-8?B?aGllUTBUT2RibEc2UUtQbWFCa1djcFBqemRRNWFDYWhKaUNpbVdGdmxFWDRy?=
 =?utf-8?B?QXhoUmE2aVNYaG9XQnFQUFo3UkhTZ2tRNitKbTYwZHhwYVpSYmd6U1BZVjli?=
 =?utf-8?B?L3FMVmlmSUorRXhyOWpvSENEQWxXT0FXZ29NWTRUMnRJOGFKMUtYcGdWdHNU?=
 =?utf-8?B?MTdKdkl6aDlMQjl1dmVYRkgyNWtQOGpvZHFSK0YrYllNcnlkR29QUmNERVR1?=
 =?utf-8?B?U0dFZ1JzUzR2MEZBN25meVRuSkV4K1U3YzdMWnVTdDNQUFowWW0rcm1KYkF3?=
 =?utf-8?B?MVlmL2xYT045OFc1bUdiazllL1o2K3puMjlxVWVha3MzVUhNWXc2NnAxYmwz?=
 =?utf-8?B?ODdGSm43ZFlnY2NpOGNVUkpWV2ZVY3NwS0RMTlE3TjFNWUtvRWFZWDRyUTNt?=
 =?utf-8?B?VytpVS9oRmlGWVl0cXdqamM2U0toU1RVRUFmY0RKZGxkdmRaeTR1SmdFUHMr?=
 =?utf-8?B?L2p1aW1YY1B1Qk0yZEJiZHJYVWRGVVFIVDRtR0QzNms4QktNOWZ2WEY2R0Nl?=
 =?utf-8?B?dlArSWp5SzdzYzZ1TTNSQ0xya2doV1JjWUxibGlmQTFBM0Z1STZVcjhIdTgy?=
 =?utf-8?B?UytNSlliQjBMWFpBOXhka3I2TExjRlJ5SWEwMmpwL0J2dVhjOXVmZFA4MVdG?=
 =?utf-8?B?RXhjWkhQRk95UGFaNmsrNnhuWmtmZnp3UnhPZXlydk1NMCtKZzFhbTJzaDRB?=
 =?utf-8?B?RHpnbGkvUy9jTkJzOXBnUGd3SHJ4ODk0YjdOZE5tcEE1YUsvRGJaZnR4MWVx?=
 =?utf-8?B?ZVcvSnVsSnVycWJ1dmo4MnF3Z0dzOEV2UzZ2aDRURHdvUXhHUEFOamg4Mit4?=
 =?utf-8?B?RVVXTlFwdC95akZCTlNEOVVCQnpiTjRMczNMMDdvVHBiUzVLQXBsSmthVVc4?=
 =?utf-8?B?WUdoVklHSDN6SjhyNVVIbCttc2lraEtZRVF2OVNqak5JS2xTUDJzS2lsVTZI?=
 =?utf-8?B?aEIwYVdWVEwxUHd6K3J4ekdiQzVuSUhtaTY2NldrM2pMV0wvdnRMajR2clhT?=
 =?utf-8?B?ZTFEMHMyZGl2MlVJenNDQzVMNG5mOHZXcVhac0U2TzNPNHEvenR0NnQyUjgz?=
 =?utf-8?B?dmhvcGhXc1hpZXUvc2pWTnUwTHBOZWNmdFBaRGx4bGdnb0k4L2N3V1o2WHZu?=
 =?utf-8?B?anNxNyt6SHk5QzEvWGtOZ3YyNE1heXFlTkRycnhKeHV6NU1VNW9wMmsxaXJr?=
 =?utf-8?B?My9nckRsNGlIOFRQcTFtVkNFeisvT09rQkloSHlndnlIeEwrRkc0VU5qN2Nm?=
 =?utf-8?B?UklDU01YU3MrK1hGRk9HdlhNNWQwUU5LSnpkN0dzVE9LTlA1TjdEQ2VJRmdp?=
 =?utf-8?B?Vm44anZRZEVuZGwxQ0VwZ3lYcjVXa0JtOUtTcUNFNHRIUDkxeGlJT25rb1dm?=
 =?utf-8?B?L2JzU3kzdktxRE16ZmEreUVtZ0JxRytzWTNiUlNsNjJMVFZSeURBQW1HaVJj?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEE1C88F82EDFB4AB1F118C04D174ADD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5eb888-ceff-4181-5623-08dbcefffd36
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 10:58:26.3149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qg4tH4ARO6swYgpThU/TGHR3FAthmxdqWAFm6ZH2Eqq4+wmC0XE+KMwT28JE7fSaYsdvVFxNUbgz+4+697KwgUhSI2F43g/xnZyEton1+IM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8106
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 0/3] Remove Stubs in HDCP code
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

T24gTW9uLCAyMDIzLTEwLTE2IGF0IDE0OjMxICswNTMwLCBTdXJhaiBLYW5kcGFsIHdyb3RlOg0K
PiBUaGlzIHBhdGNoIHNlcmllcyBhaW1zIHRvIHJlbW92ZSBzdHVicyBmcm9tIGNvZGUgaW4gSERD
UCBjb2RlLg0KPiBQYXRjaCAxIGlzIGEgZml4dXAgcGF0Y2ggd2hpY2ggcmVtb3ZlcyB0aGUgc3R1
Yg0KPiBQYXRjaCAyIGlzIGk5MTUgcmVmYWN0b3Igd2hpY2ggaGFzIGJlZW4gYWxyZWFkeSBtZXJn
ZWQgYW5kDQo+IGNoZXJyeS1waWNrZWQgaGVyZS4NCj4gKGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvMTIzOTU1LykNCj4gUGF0Y2ggMyBhZGRzIHRoZSBkZWZpbml0aW9u
IG9mIGludGVsX2hkY3BfZ3NjX2NoZWNrX3N0YXR1cyBpbiBYZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQpUaGFuayB5b3Ug
U3VyYWogZm9yIHlvdXIgcGF0Y2hlcy4gVGhlc2UgYXJlIG5vdyBtZXJnZWQuDQoNCkJSLA0KDQpK
b3VuaSBIw7ZnYW5kZXINCg0KPiANCj4gU3VyYWogS2FuZHBhbCAoMyk6DQo+IMKgIFJldmVydCAi
RklYTUU6IGRybS9pOTE1OiB4ZSBkb2Vzbid0IGhhdmUgZ3NjIGhkY3AgaW50ZXJmYWNlIG9yDQo+
IMKgwqDCoCBzb21ldGhpbmciDQo+IMKgIGRybS9pOTE1L2hkY3A6IE1vdmUgY2hlY2tzIGZvciBn
c2MgaGVhbHRoIHN0YXR1cw0KPiDCoCBkcm0veGUvaGRjcDogRGVmaW5lIGludGVsX2hkY3BfZ3Nj
X2NoZWNrX3N0YXR1cyBpbiBYZQ0KPiANCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2hkY3AuY8KgwqDCoMKgIHwgMTMgKy0tLS0tLS0tLS0tLQ0KPiDCoGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcF9nc2MuYyB8IDE5DQo+ICsrKysrKysrKysrKysr
KysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkY3BfZ3NjLmgg
fCAxMCArKysrLS0tLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfaGRjcF9n
c2MuY8KgwqDCoMKgwqAgfCAxMSArKysrKysrKysrKw0KPiDCoDQgZmlsZXMgY2hhbmdlZCwgMzUg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KDQo=
