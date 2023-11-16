Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1762CC54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB98510E621;
	Thu, 16 Nov 2023 15:35:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E3010E621
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700148910; x=1731684910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=r64TxKJpKGzGhAzs9aKJ2Q8fhF5KKsQl8EcLMTaK1m8=;
 b=CLUKegY2qqhDf7jFM1oWcQ5kGBhgh1p1Va8nSFg4LhEzBCbU3EX2Vzbs
 zpORrbHgpphSTowgv6l7ad0MoyYeeu6A4QleQRNi08eqqnmea7n6w53C4
 VUm85zrylkECBEIRaVKj0IrJ74SDaGINJIh8+3SQQSxqjcw0LU9dXtCGf
 hXrt4lpPzqpiGYBBD/ozz6wC7N5vEYAoYz/9YBEBmUKx0hpqSQE8gheEP
 b/ICogq/ffYCUfH1iZZINJtLYF+AntzI9Ipg/eTPPADYGPXiaSYCHeOz5
 hoqzaSqjrnQWQpNcsQUuyX30Qq5i7aLc2/wOmy88zklLE7ENZbojsAXHS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457603132"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="457603132"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="758865673"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="758865673"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 07:35:09 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:35:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:34:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 07:34:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 07:34:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZOtuZHpAm0/SxSadz075A/+iGpfMgJp/m8b4OaM3i5GPil5tOEHscA0qi+oJH0CAeLW6cWOfMu3Q8zcQVO9LNtIyOzyrvxOWWWAW+xZWpZveJqS8dmaBd0zFQItr6HkAy65gt7O1fLfikmNMB1tDH7gecbgv44CmIhgiXuYgMfv3kB+Jg4cbISrzBaWZ018SAfWKbpjgr5bcjx/9gGazkIrnmSFb1ClAL1cC0RQy7WX4+h0Tz9GsnWCYtpadGoDBhv5muCBFE/OVpSOS34GHmg4lPipx5D/pufUdoOy+qGu6xOItKxBUUbzjVvEX18Pe12c7mCprvhp8WAcAApOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r64TxKJpKGzGhAzs9aKJ2Q8fhF5KKsQl8EcLMTaK1m8=;
 b=bMp7j79mku0fRKJv00VV8oojhxWZ3CV5ZH24jffTIhHh1j3yrnwVuAN+gDq1tlUNDMZbMMvWdaDyAmhP8aFUIVuNJb3dlQnwlJ9dxQsxCdUSUulLGnbpxSR/mMCJU0QCDgSo5mrDfDzsbwdz9IejI6JEujtufyunQ+z+ILMgybL3BIIaXHUFnBLXLtRbKnkQXielXjdFc310KOjNHGQNMpmqDQagV3YsjnekjV8gM3sXSW1CG9Vb/pkPPaa7qIstlOFil0PFRofeU7OxKBx4yUZ8dIcT+xu60KIFrMkqBE/crRnf/qJJozhOZeVE/HQHQkqRPqqwh5f5O1GwlenA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6747.namprd11.prod.outlook.com (2603:10b6:510:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 15:34:09 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 15:34:09 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v1 4/8] drm/xe/uapi: Rename *_mem_regions masks
Thread-Index: AQHaFv9bH6pQ81ZhSUyOemiSQiHYx7B9Fq2A
Date: Thu, 16 Nov 2023 15:34:09 +0000
Message-ID: <68a98904548240720410d30d8d0bd6f0e3630a96.camel@intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-5-francois.dugast@intel.com>
In-Reply-To: <20231114133434.7-5-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6747:EE_
x-ms-office365-filtering-correlation-id: ddbfbd8c-2512-44f2-8ee2-08dbe6b97a4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w4Q9EW7ElCcj0ZxlLJCcLRFUUrxsyhPzQbrj4t2j+GF69LU5NEv62+0OLf+VV7/hTl+dx27aIkhUVP1eBcRdzQGaDx7unq/f0DgiLLphAsUQHXjBd4EX7QsQh48i7O+BVS6j7ueaYiiMHV/pQ1xmR2TtvsSWIWcdctQigojRB0I42ZEkR4oxIlvQasvJXsOqLEAJB1dqGw5dHvwxISlj7iD6JxYYw1dyK/Kb5SllQlp+lVrXjKA6B5W89ZLB8wRld1UpN7XBegbxBk+QIbnrB7ih3PstlfG9FWUPXv4+kZ/kdkHqrmTK2knPZM0fCyfFe58BZv4TuEsjGPZKEDoQNCSOk7mvj0XJ4PY768hUZFKPD44++zdeqRpssz01CCiUK52mZ2Ts9eY9sOM52fsqy7PRN4BQBcBw7NHTlWFGWULu6E6oYxgOBiiQxc6xPZmDrLggJEDOWGCSvTsesgCAey3l8dR/Yc8nmyt2LLYKYZOGt60u3F8n0xiov3XQnBeREEP0tqmYDLDVTvD4M2UpwZJLVeez+FFiwVbi1rdnWfv/cJqHB14Z/t9K1WKJyOrQCEWAZ5d/W98occJ8YOlMG3faCamtWrMKkTzmkvSPv5yQeUy7HiVdj05BdTXWBCR7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(91956017)(110136005)(66446008)(66476007)(76116006)(66556008)(64756008)(66946007)(316002)(6636002)(83380400001)(2616005)(26005)(36756003)(6506007)(38070700009)(71200400001)(6512007)(6486002)(107886003)(478600001)(38100700002)(5660300002)(122000001)(4001150100001)(82960400001)(41300700001)(2906002)(86362001)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzRaamdqTXF3RS9FNHhmRUxjTk1JTlp4eTRnNTkyQ3FyL0hVRmdpTWVWaHJi?=
 =?utf-8?B?UXI0empuVnVlekVHa0pJa1czY21XL0o1eVFuZWZ2SmU4OWVhc0lmRzJuMlRs?=
 =?utf-8?B?eFFzTGgxeG9VZHVIZm1GQjlkTHZVQjBKSUY5azRVV3hyQXgxWnNPZTVpV1FT?=
 =?utf-8?B?UzNOMXNJRFd0RDMvdHNwOGZBYU9LZHhLa2FJMTVRTU5vZlJtS0dLL29TTm5a?=
 =?utf-8?B?RlhocGlQUHVXRjF2U0Q5a2VSVFJKQWpjTDA4cnV4cnQ4eHNxekk0elVlUlc0?=
 =?utf-8?B?NWRGYjlmc0hCbExzRStnRzUwTmNrb0RNUElZZVFGUnZFUGRDMFJBK2s5MUcx?=
 =?utf-8?B?ZVFia1pGNHg5UnQweU1DTU1Ia2dnWk1xNkpJQVIwK2pxU1ZtN29XU3pjWGdK?=
 =?utf-8?B?c2VIYUthNzM3OXBBNGx5MW1GUWMzUTRvOTFIYUFORUkvYXMwWTNEeXhZb1hB?=
 =?utf-8?B?R2lmMW1Vc3g5TnZFV3RadDJUUU14Q2xxTk1sT1UxU2I2V0xMS2FZSmdkVnZW?=
 =?utf-8?B?cGx0ZkVvRFJmM2cyd0hYYUdRb1FqODRaYmlYaVFTazVSWElXaGF4LzhjYkV4?=
 =?utf-8?B?VzVlM0kwbk5peGNiY05YZnVUWWU1Q0h4NktqMmxoT2prcWZ6dGpPb2F1UnBs?=
 =?utf-8?B?WHFiMWhpMWNFR3hBd3dPZ1p0YWs0b081dmxqLy8wTVJSMmdaL0ZrV0gzK2I4?=
 =?utf-8?B?S2NqYVU4QVV3M3JHb2laK292WFBCTUYvQjhrOHNIMFpObG5sM3U4WGYrQzhD?=
 =?utf-8?B?RG12M1JvUnViV2NlbStCYTlEN3pJbnJqcjlpNForRE5Hamo0Z0p5S2p5WHRS?=
 =?utf-8?B?ZHg3bm9pZ0czbVZva0tEb0w5elY0VXdBN2dwQmhKdTlwN3cvSXNXcXRzZ2xR?=
 =?utf-8?B?L1VYN3RsSEFOaHYzZXpkOXp4YnlRQmovRHlROXE0YVBnQ2pNTEhJZk80K3J3?=
 =?utf-8?B?L0JSZHZQdmxyMmU2UG5FaFY0aEUxcjRQTE90NEs5RjVBcVRSbXJvVTNNay81?=
 =?utf-8?B?bHo3RlRyUEtlSk1EeXphSHlGckE3M0VuYk5zWlREMXV0ZVZxMXNyaGdQWXhQ?=
 =?utf-8?B?WlVYU2FRTDM0a25rTStTcmJqNVhnQittclkzRXhMTkdOZjVKaStjc3RDNGlh?=
 =?utf-8?B?cExzUGs1SUVNWFdEVjRNSzBndFp3bHlpQ05HZVloUXJiMkp2c0txbkVSblln?=
 =?utf-8?B?aTlRVUFpQlJsRlQzTjFNeExCVWJmci81M2c4WURCTXJUcjRLS0xwcmlEZ1Fv?=
 =?utf-8?B?eFNKbGZrV21MV3RZWDVEQkJsK2NtMHhxR2tSZ3BmQUF0aEJEZ2dLenJPcWsz?=
 =?utf-8?B?RHJYbDdhYzJPellzMkZLSEV6NHlpTnNBNE9vZDdGTHFQOEJ2b29wYlcvV0Jk?=
 =?utf-8?B?aXBkeE9tQTd1UjVzbVc5NEhUc1FBQ01pTE1hdXBCaGRmSjR2Z0FudVc0aFg3?=
 =?utf-8?B?TWNlMElIRXFoMFRiNEZWYmpJcWdUcHMxL0dOMnNrUFZpTVNURG1YNVorRzlJ?=
 =?utf-8?B?OWdEU1FjbzZQQzJVZXNtbFNMakJna3YxM0NBN0tHbmJJVWhWb05NU290OWx1?=
 =?utf-8?B?VlhDZUJiWnhjWXJpbjIxODhrUkNFTXo4UUZ1K0VBTW9oazdkRkQvY1Y5S2Ru?=
 =?utf-8?B?RWFZajdiSkxQZGc0QTlvVFNtSW5wMjdyYk5MQkg0TlVPWGxQOFRCZkpmQ3kw?=
 =?utf-8?B?UXZTVUpGSXhlYjJZTWh4YWdXSlFmaFFRNEgxMXpCRU1BSnpJQk1kVUN1azlm?=
 =?utf-8?B?S0xiR05HQ0NjZnF6OUZBQmVYdC9KckNndDAxZGpHV2lubTFadDV5eElIVFNj?=
 =?utf-8?B?QXFwMGVLUC8ydE1DUVdFZDBJMkdCWUdMQkNKdk54RFJ3QVJTaDFFdCtMKzZI?=
 =?utf-8?B?cDJ4cWRiZ1gvVUJrWjBCOWNCYXRZRTVTZE5EREZYTkhLTkh6STJXenF5YU5l?=
 =?utf-8?B?L0E1dXM1UVN0NzR6a21PYU51NjgxQkVWVElQcVZHY0N5VVBWQi85c080cDJk?=
 =?utf-8?B?Mjl4bzUyTXE3cm9rMUhoeHhtY3p4Y0xJcUE1QkFmTVNnZFJhU2h4S1lDL01z?=
 =?utf-8?B?TXpqUVhQZjBTZTFZc2dFSDQ0M25QYm5wQWJxNC93TCszRG40QVZ0SEVJTFVW?=
 =?utf-8?B?VXQ1TEdoSUIxK3hURzJGQlFUdzZudDd2R0haazJWY0J5bVNLbjJDNmZUSWpR?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B74ED460952FC846ABD97399CD246893@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbfbd8c-2512-44f2-8ee2-08dbe6b97a4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 15:34:09.8149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8T/U1JQD0jY3Pa8J7RjfrbIIq3iP48bHxDVF0Ic6MQ7YiUzqYjMZnodm6tqi2WuSTZwsXyXi3EBMYi62lh0qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6747
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 4/8] drm/xe/uapi: Rename *_mem_regions
 masks
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTE0IGF0IDEzOjM0ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IC0g
J25hdGl2ZScgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2Ugb24gaW50ZWdyYXRlZCBkZXZpY2VzLg0K
PiAtICdzbG93JyBpcyBub3QgbmVjZXNzYXJpbHkgdHJ1ZSBhbmQgZG9lc24ndCBnbyB3ZWxsIHdp
dGggb3Bwb3NpdGlvbg0KPiAgIHRvICduYXRpdmUnLg0KPiANCj4gSW5zdGVhZCwgbGV0J3MgdXNl
ICduZWFyJyB2cyAnZmFyJy4gSXQgbWFrZXMgc2Vuc2Ugd2l0aCBhbGwgdGhlIGN1cnJlbnQNCj4g
SW50ZWwgR1BVcyBhbmQgaXQgaXMgZnV0dXJlIHByb29mLiBSaWdodCBub3csIHRoZXJlJ3MgYWJz
b2x1dGVseSBubyBuZWVkDQo+IHRvIGRlZmluZSBhbW9uZyB0aGUgJ2ZhcicgbWVtb3J5LCB3aGlj
aCBvbmVzIGFyZSBzbG93ZXIsIGVpdGhlciBpbiB0ZXJtcw0KPiBvZiBsYXRlbmN5LCBudW5tYmVy
IG9mIGhvcHMgb3IgYmFuZHdpZHRoLg0KPiANCj4gSW4gY2FzZSBvZiB0aGlzIG1pZ2h0IGJlY29t
ZSBhIHJlcXVpcmVtZW50IGluIHRoZSBmdXR1cmUsIGEgbmV3IHF1ZXJ5DQo+IGNvdWxkIGJlIGFk
ZGVkIHRvIGluZGljYXRlIHRoZSBjZXJ0YWluICdkaXN0YW5jZScgYmV0d2VlbiBhIGdpdmVuIGVu
Z2luZQ0KPiBhbmQgYSBtZW1vcnlfcmVnaW9uLiBCdXQgZm9yIG5vdywgdGhpcyBmdWxmaWxsIGFs
bCBvZiB0aGUgY3VycmVudA0KPiByZXF1aXJlbWVudHMgaW4gdGhlIG1vc3Qgc3RyYWlnaHRmb3J3
YXJkIHdheSBmb3IgdGhlIHVzZXJzcGFjZSBkcml2ZXJzLg0KDQpSZXZpZXdlZC1ieTogSm9zw6kg
Um9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgIDggKysrKy0tLS0NCj4gIGluY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMTcgKysrKysrKysrLS0tLS0tLS0NCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcXVlcnkuYw0KPiBpbmRleCA0OGJlZmQ5ZjA4MTIuLjhiNTEzNjQ2MGVhNiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gQEAgLTM3NywxMiArMzc3LDEyIEBAIHN0YXRpYyBpbnQg
cXVlcnlfZ3RfbGlzdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2Vf
cXVlcnkgKnF1ZXJ5DQo+ICAJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLmd0X2lkID0gZ3QtPmluZm8u
aWQ7DQo+ICAJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLmNsb2NrX2ZyZXEgPSBndC0+aW5mby5jbG9j
a19mcmVxOw0KPiAgCQlpZiAoIUlTX0RHRlgoeGUpKQ0KPiAtCQkJZ3RfbGlzdC0+Z3RfbGlzdFtp
ZF0ubmF0aXZlX21lbV9yZWdpb25zID0gMHgxOw0KPiArCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0u
bmVhcl9tZW1fcmVnaW9ucyA9IDB4MTsNCj4gIAkJZWxzZQ0KPiAtCQkJZ3RfbGlzdC0+Z3RfbGlz
dFtpZF0ubmF0aXZlX21lbV9yZWdpb25zID0NCj4gKwkJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLm5l
YXJfbWVtX3JlZ2lvbnMgPQ0KPiAgCQkJCUJJVChndF90b190aWxlKGd0KS0+aWQpIDw8IDE7DQo+
IC0JCWd0X2xpc3QtPmd0X2xpc3RbaWRdLnNsb3dfbWVtX3JlZ2lvbnMgPSB4ZS0+aW5mby5tZW1f
cmVnaW9uX21hc2sgXg0KPiAtCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0ubmF0aXZlX21lbV9yZWdp
b25zOw0KPiArCQlndF9saXN0LT5ndF9saXN0W2lkXS5mYXJfbWVtX3JlZ2lvbnMgPSB4ZS0+aW5m
by5tZW1fcmVnaW9uX21hc2sgXg0KPiArCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0ubmVhcl9tZW1f
cmVnaW9uczsNCj4gIAl9DQo+ICANCj4gIAlpZiAoY29weV90b191c2VyKHF1ZXJ5X3B0ciwgZ3Rf
bGlzdCwgc2l6ZSkpIHsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgg
Yi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IGE4ZDM1MWM5ZmE3Yy4uZmQ1MWQ0
NDQ0MTE5IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBi
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTM0OSwxNyArMzQ5LDE4IEBAIHN0cnVj
dCBkcm1feGVfcXVlcnlfZ3Qgew0KPiAgCS8qKiBAY2xvY2tfZnJlcTogQSBjbG9jayBmcmVxdWVu
Y3kgZm9yIHRpbWVzdGFtcCAqLw0KPiAgCV9fdTMyIGNsb2NrX2ZyZXE7DQo+ICAJLyoqDQo+IC0J
ICogQG5hdGl2ZV9tZW1fcmVnaW9uczogQml0IG1hc2sgb2YgaW5zdGFuY2VzIGZyb20NCj4gLQkg
KiBkcm1feGVfcXVlcnlfbWVtX3VzYWdlIHRoYXQgbGl2ZXMgb24gdGhlIHNhbWUgR1BVL1RpbGUg
YW5kIGhhdmUNCj4gLQkgKiBkaXJlY3QgYWNjZXNzLg0KPiArCSAqIEBuZWFyX21lbV9yZWdpb25z
OiBCaXQgbWFzayBvZiBpbnN0YW5jZXMgZnJvbQ0KPiArCSAqIGRybV94ZV9xdWVyeV9tZW1fdXNh
Z2UgdGhhdCBpcyBuZWFyIHRoZSBjdXJyZW50IGVuZ2luZXMgb2YgdGhpcyBHVC4NCj4gIAkgKi8N
Cj4gLQlfX3U2NCBuYXRpdmVfbWVtX3JlZ2lvbnM7DQo+ICsJX191NjQgbmVhcl9tZW1fcmVnaW9u
czsNCj4gIAkvKioNCj4gLQkgKiBAc2xvd19tZW1fcmVnaW9uczogQml0IG1hc2sgb2YgaW5zdGFu
Y2VzIGZyb20NCj4gLQkgKiBkcm1feGVfcXVlcnlfbWVtX3VzYWdlIHRoYXQgdGhpcyBHVCBjYW4g
aW5kaXJlY3RseSBhY2Nlc3MsIGFsdGhvdWdoDQo+IC0JICogdGhleSBsaXZlIG9uIGEgZGlmZmVy
ZW50IEdQVS9UaWxlLg0KPiArCSAqIEBmYXJfbWVtX3JlZ2lvbnM6IEJpdCBtYXNrIG9mIGluc3Rh
bmNlcyBmcm9tDQo+ICsJICogZHJtX3hlX3F1ZXJ5X21lbV91c2FnZSB0aGF0IGlzIGZhciBmcm9t
IHRoZSBlbmdpbmVzIG9mIHRoaXMgR1QuDQo+ICsJICogSW4gZ2VuZXJhbCwgaXQgaGFzIGV4dHJh
IGluZGlyZWN0aW9ucyB3aGVuIGNvbXBhcmVkIHRvIHRoZQ0KPiArCSAqIEBuZWFyX21lbV9yZWdp
b25zLiBGb3IgYSBkaXNjcmV0ZSBkZXZpY2UgdGhpcyBjb3VsZCBtZWFuIHN5c3RlbQ0KPiArCSAq
IG1lbW9yeSBhbmQgbWVtb3J5IGxpdmluZyBpbiBhIGRpZmZlcmVudCBUaWxlLg0KPiAgCSAqLw0K
PiAtCV9fdTY0IHNsb3dfbWVtX3JlZ2lvbnM7DQo+ICsJX191NjQgZmFyX21lbV9yZWdpb25zOw0K
PiAgCS8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ICAJX191NjQgcmVzZXJ2ZWRbOF07DQo+
ICB9Ow0KDQo=
