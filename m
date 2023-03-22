Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6C0C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 17:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB8C10E9B1;
	Wed, 22 Mar 2023 17:51:09 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05DB10E9B1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 17:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679507468; x=1711043468;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=F6T/o5JWeHs4mT3qabitvAjNXa4bYRDYiTyG4uQItdQ=;
 b=J0zbokplicp66m2ScQwFY4eTNldI4OkOBHS84ojfao1kK+LNvIwvHxKl
 iSOOUko/h1BmXYpHUAef4MzMeecUKL72Koqzrcv1jlZMVN7m8prFU9KwT
 uvNEyuyOFgnjmDuzw6szSYD5lHoQwd4CLzxEUDJxynjZiPxsON5KoG8qd
 xjGvnNu9kytb7/VkT+pWwsII1Ah427Bz+2vaR20q1cb2kwPb3qfntQx3o
 aO7YgqXBeAesRXLIMQBbw3K0vqqPQf/tbDs0JbOL70YHKkcbguzoqwbII
 Cj5rkOgkJjX73jaKgb9az/H+8q7ae3YzH6gTRIXKEkW/R0YCo4WrV8Ssy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340825825"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="340825825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 10:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684400470"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="684400470"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2023 10:51:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 10:51:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 10:51:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 10:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTAL/MRjhN25MBe8fELlT63hXvvd8G0Q4u1jaEc/8FF3vXV8ig7UQJzmT4opOwZfMonncWG2+2ZpODZFdLzslFBAIIENY0LT83jX590heSWrk6xUP0AJy8vZzEMN0RlPCDOGB7ltFXExifM6WfjqiqRz3qGHYw3Hn/zON4MVyfWprx/PIP9jxoF1kVTT6RsgJV56exqMi+K7fJCGW89SVLHjcGoW3Rbvk++dxPrS1YNiHq9NQNyslQgQAYfmS3euBNNhOK7LjGzzxyZBbKUnexEV2nWIMYpLglwzlU04NbDiF6wxwj1yNnE1MzuF1fN9HA7DirxTKHwI/Ec9SrQsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6T/o5JWeHs4mT3qabitvAjNXa4bYRDYiTyG4uQItdQ=;
 b=ALT4GyL049hv5B3vCtfmTSR589eRH/RCqQmAJRWIFheQmDdebyN29NDAgcleB8m7H3VIhl3L2wnos3a0gIE1yM2RoCwd5as352WL4vXWDlEfSf23PJoUpZcXyKZsz3lLasBMigrOSFtOWBC8PgNwIRZ1V9+A3mJmegvEKAn0oRrpKTn3ZTNfzsCj//LrSeGRnSsyH0+bAMPctR3DBjgWljDBzf5o9DHxw7owItP/cSHnRJbwfcMYwGhQ6KPaY0EQ6TvrUBot3FeGXs10ldsKPfuT8EZZt1MYuTEgIA2S0N6oZ+6POPQtK6r98Km/aQ6mZGIav5p848r2zIZZVwXHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 17:51:05 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.037; Wed, 22 Mar
 2023 17:51:05 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH] Revert "drm/xe: Allocate regset space for
 Wa_1607983814 unconditionally"
Thread-Index: AQHZXN9/6yXj3Fi9V06icjVaSROmYK8HE/uA
Date: Wed, 22 Mar 2023 17:51:04 +0000
Message-ID: <aa60c2742360614e4e14fcba6ae683895c8e59d1.camel@intel.com>
References: <20230322165733.309447-1-matthew.auld@intel.com>
In-Reply-To: <20230322165733.309447-1-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|SA1PR11MB5948:EE_
x-ms-office365-filtering-correlation-id: f8d74bb2-54ad-4214-db83-08db2afe021d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XPBoxOfxoWAvqM6ntxNCvpwi7lEJZRPX/trhVvkq6Qc/2u/INeXJM1OA/DIrjygnhq+8CVtRSBs7MTU9UkKpKZQ87fFhPiHy/RhQgp2lvajHapxoPLQII9APdT7AgKcu8vi8wutSVa0n7cEL/cU/tFh3/quzVY8aTac5VNlAF3XLc8k+3NqnOGJz3jzQpWZfTYBdBjk8xCcXM21QFh7cbv8RvRXeVlhnYMmPUTIOCPRPlNXXd0Og184Gahea1h5He2ZBWTDk6p8He/7WDNpB8htFve+9dzEgc6monHSGBFHhAJb1bYtwVoPYWTHj8UPcGgdopSUA8tyjVKdE1SWr9U0OsEdLUNrjSZSr0H3K3qGnODj22WfwM7ewx1jsNARzgyWF8aIVWLKe7fiYiHH1upaNX+e55/k9MeK9fBRKowJFip7cP9P5Z0OABUJMuz446QY4NyaZw2caVIMlhJpx1lES0tYik7C9Zh3BPg+h10Jf84Ko2g3FiF0cqh2783MgX9hSsTswD2NZWiz01txJHnX1Qlsd130kfCTOFWr7d1h7hDgLKgETRnEb2p0cZzrw1xpTWaNcZ2AY/63F+NZooVB3seCTUYJ8G4ksDMCzrK6CYp2ncX4qLmN1nWdg7EXwYs6AOayNyaiYIWCs4dYbtbjwWRmzfu78aGpFv/lNlba+8nEiXzFKnGQ+uJRoW2VzncXl1Pmd5V7BmL01Fyc+UA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199018)(82960400001)(86362001)(38100700002)(83380400001)(122000001)(2616005)(6486002)(66946007)(38070700005)(26005)(186003)(6512007)(71200400001)(6506007)(6636002)(316002)(110136005)(478600001)(91956017)(66446008)(64756008)(41300700001)(66556008)(8676002)(76116006)(66476007)(5660300002)(2906002)(36756003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1c5bnBxQk9TRXhrakwzQ0JKT2p5eVEyRTRRODVHZ3JPQ2pUdzVld1UrQWt1?=
 =?utf-8?B?ckZEamZHbjl0TXRzbUhNclpwalZOSkZjV1owbzllc2ZxTjhrcXh5NGp3M0Ja?=
 =?utf-8?B?RCtDdDFDS2U0L21yR0VxbkowQlUvT2NqOWNqamFsTzRNcW0zVzlBNTZQZzZL?=
 =?utf-8?B?U3ptaFRUdEd1K3ZxUnNvWkJZZm5CS1dHamdPdjdhYVkxYkw5RzM3THo1eEtR?=
 =?utf-8?B?aUk3SFpTcG1HZm4vcGJwSzVGL3NyWmJMYW5CdUdVbFU4eklHRHo4N0tGOHJh?=
 =?utf-8?B?RHhkeGxxT3o0WlZKbisrUU16MDVuU2cweExsRWEzUUtXTXBDYmNYaFZsVjFX?=
 =?utf-8?B?Z1lnU09SQXlEZTdFbW9sYnpxc3QzUnA4UDNMRmJMMHNEelMxcERqd3BBekdz?=
 =?utf-8?B?eWVtN3lmZEJQYTVvZ3U2U0lmUGJwdkJLdVJuVnc1bEZwRGovY0tLL0t6cUlu?=
 =?utf-8?B?QWx6Um5BQ3dtOHlHR3hoTDRURHVvVlBmaEFnS0NhQlJGWXoyZnAxMGE1QThI?=
 =?utf-8?B?WnRreklJY2loanhkZ2JSbytheXJudFlMLy9yc1BYMFcweXorRUxrS1dJVUdE?=
 =?utf-8?B?OXRqZWNvdWJTeVJabmJhc0ZiRE5xVzlqVlZFNU80aDZaNXd1VmFvOE8zeGp3?=
 =?utf-8?B?YmJaRi9uV2xIL3BxNkE2M1ZMUzNhVXVjSTRyL2Z0YVk4RHBFd0xqaTljcVRx?=
 =?utf-8?B?RjdTQmlFVERFL1NlS3hXTUo0Szg0cUJ5SVYyNm9ua2pvZWNXSkRQOXo2TkUy?=
 =?utf-8?B?bFNNUGFGb3o0WjFicVJDZmJMamNtU3ZidkJtcHhhWWFMc1lYcUxNTDhyU0dJ?=
 =?utf-8?B?MnRDM2g1Z2g5UjBmb1lJOHR3NXZDNlpKOHM4VVNwNlJFNFhtWjFYRnhFZmVw?=
 =?utf-8?B?K1hoVE50bjByanZnL0VEWFNhbitOTGZHZ2RuL0ZNa0ZCTzVOajBmaVpmTlJy?=
 =?utf-8?B?ZmJlOXhnTVpIMmMrUnI4UVJETVFYeVgxR2ZZbGZReDlyaksvTmRHbnVsbytM?=
 =?utf-8?B?b0Nmd3k5aG4vS2VCZnZaVC9pcmVUZmk4akVzTDI3Zm82aHVUc2lRcVh6b3lO?=
 =?utf-8?B?U0NRQnJBQk9VWkExeVQ2MVlJRC9nMnNzWGkxbVFObC95QXJJdXlrV3NOWkpn?=
 =?utf-8?B?UzQ0SEdBQndUemRFVnM2YXpqMkRycGZMZzNlNndOMmQwWFhOYmo3U05vK0tG?=
 =?utf-8?B?RzQ0UWJRZFNrM1RBcU9FWG5GZVNoWFlsVXhjYlowWkliZnl0em1VOGdLOThF?=
 =?utf-8?B?enFjTmZzUi9jOTBsNHN4c1BkUnNSZFRmODhkMFFDTHlXSEtLb1RhcnpsM21h?=
 =?utf-8?B?N0J1MFB5aDVsUnFQSE9NVytTRlNjZ1Z2UmE3QUFxd0NVdG1qdGNwNWxvQ2pa?=
 =?utf-8?B?T0kwc0xac3V6UEJJTFNTVmNTRmkrMEpRMWhId1dLVFZBQWRyZjRrdkhxblRv?=
 =?utf-8?B?RStmcmVBcVlkQkFVaEFuNFdzVENnVW5vQUQ2Y2ZoczhLakFXSDFYK2toSFBQ?=
 =?utf-8?B?d0Y4UW9VNVIyUFc0UWRvZW8weDhneW9XekxENFMzNDU0bXhaaEtaV25Oa01E?=
 =?utf-8?B?bEx3RUsrY3NPVytPenBiek5DMVU1dUQzOUhzS0V6dmQ3aVhCTnFoK1c2b2ZI?=
 =?utf-8?B?K3lXQ29oNkRKTHJGYnNBaDFuYUdwbFJTMFZlWnFRYjhDSDE2U0dFMlZmS0hC?=
 =?utf-8?B?S3NvZnY2QllWZ1BNTzZwK2RXYXpNalY0RGZrQXdCQSswZU5zVHZnNUg1Y0tv?=
 =?utf-8?B?dVBPTDZQOTh4RVpJSFZIV2lnbHNBelovRk9vUEV0eXorc1B2ajcwdmo2bVpp?=
 =?utf-8?B?NmlMWFJwdDJHUkJoL3lmTEN6NTNZdXA2c1d5aFlhcGNCcUhKTzM5RUJVenBu?=
 =?utf-8?B?TEJuM1NJY01pVEk0YlFrbkg4TmI4SnNGVHdLMEhrdmFuWnAyVkVPZ3NLOTE0?=
 =?utf-8?B?bS9MUCtnYUZkUEdveFdUd2l2Vm1QSnVRejNOdUc5cjlDT3QxbzFKN0ExL3dT?=
 =?utf-8?B?NFpJSkJ1NHRxUjM1cjBiOFhEdFJoaklVNkdoRm5iaVhhZWYxZ2tvNEV2NU5H?=
 =?utf-8?B?SG03dnR0YWlIMFoyd1EwRVVkTHhaQTJmL0xsQlJ6OURLbnp4VGVYL0RseVQx?=
 =?utf-8?B?Y2p0Z2EvL0xkY3QyeVJKSW5SeEVicDZlWW80S21SSzF4THdJSHg1T2xjRE8v?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5574B4AFB6C74F4DB5605662FE46E288@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d74bb2-54ad-4214-db83-08db2afe021d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 17:51:04.8003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZgXXkt0PQ1oHBtv7YqhRtwExLHxNr2GH+BDjNdkEqIQQuKCEnrNWMqY71DMUyxr/+eMDX00R3mZILlqNR2GMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] Revert "drm/xe: Allocate regset space for
 Wa_1607983814 unconditionally"
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

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDE2OjU3ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgZDUxYWZlYWFlMDQ3OWM5NjRlNzIwZjM4NTU4MzRhODI5MTQx
MTJmNi4NCj4gDQo+IFNlZSBpZiB0aGlzIGhlbHBzIHRoZSBBREwtUCBpbiBDSS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jIHwgNSArKysrLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2Fkcy5jDQo+IGluZGV4IDMwNGE5NTAxYjQ0Ny4uZmQ5OTExZmZlYWU0IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gQEAgLTIyNCw3ICsyMjQsMTAgQEAgc3RhdGljIHNp
emVfdCBjYWxjdWxhdGVfcmVnc2V0X3NpemUoc3RydWN0IHhlX2d0ICpndCkNCj4gIAkJeGFfZm9y
X2VhY2goJmh3ZS0+cmVnX3NyLnhhLCBzcl9pZHgsIHNyX2VudHJ5KQ0KPiAgCQkJY291bnQrKzsN
Cj4gIA0KPiAtCWNvdW50ICs9IChBRFNfUkVHU0VUX0VYVFJBX01BWCArIExOQ0ZDTU9DU19SRUdf
Q09VTlQpICogWEVfTlVNX0hXX0VOR0lORVM7DQo+ICsJY291bnQgKz0gQURTX1JFR1NFVF9FWFRS
QV9NQVggKiBYRV9OVU1fSFdfRU5HSU5FUzsNCj4gKw0KPiArCWlmIChuZWVkc193YV8xNjA3OTgz
ODE0KGd0X3RvX3hlKGd0KSkpDQo+ICsJCWNvdW50ICs9IExOQ0ZDTU9DU19SRUdfQ09VTlQ7DQoN
Cm5lZWRzX3dhXzE2MDc5ODM4MTQoKSBhbHNvIGFwcGxpZXMgdG8gQURMLVAsIHNvIGl0IHNob3Vs
ZCBub3QgZmxpcCBhZGxwLXAgcmVzdWx0cy4NCg0KSSBndWVzcyB0aGUgcHJvYmxlbSBpcyB0aGUg
Y2FsY3VsYXRpb246DQooQURTX1JFR1NFVF9FWFRSQV9NQVggKiBYRV9OVU1fSFdfRU5HSU5FUykg
KyBMTkNGQ01PQ1NfUkVHX0NPVU5UICE9IChBRFNfUkVHU0VUX0VYVFJBX01BWCArIExOQ0ZDTU9D
U19SRUdfQ09VTlQpICogWEVfTlVNX0hXX0VOR0lORVMuDQoNCkRpZCBub3QgY2hlY2tlZCB3aGF0
IGlzIGNvcnJlY3QgZm9yIHRoZSB3b3JrYXJvdW5kIGltcGxlbWVudGF0aW9uLg0KDQo+ICANCj4g
IAlyZXR1cm4gY291bnQgKiBzaXplb2Yoc3RydWN0IGd1Y19tbWlvX3JlZyk7DQo+ICB9DQoNCg==
