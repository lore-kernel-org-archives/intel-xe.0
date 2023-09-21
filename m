Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05B2E7107E
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 14:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A9B10E5CC;
	Thu, 21 Sep 2023 14:29:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B127C10E5CC
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695306585; x=1726842585;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WVIaOt62HYJR7IZO63YB3MSZlk+M5emRmytiYURXGog=;
 b=iahA5PlKqIsmvg+cdsmprqNka5ziRqzH2WuYzqEBSk46oP80bnAOAK7J
 YTqRRqB6UzAqhn+gk9W+BVp8+4cysvtg4+sqL/FmwluD36yuZR8Z/ARap
 pVzXIE/THDy8bZF7xWoofbYnF50vXfM9Zo+E7DwZ//UpVN8/IiAoBNTmf
 zRzilE5Jb8h5hAJxHVnMUZransIXmaDHmxbjvMycnM+UxRee13ze1SuXC
 Ci6ryCJ26xfr2uuqYaeGONjigVFQY1NXx+Eaqj9Ex7284jkXQbd0wUSXg
 PFG8Ww/wSjPAZoABKbv0Y1v6Unmh/gKvBHGKTOXwO1Ziww+xkq3sJU6vZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447023044"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="447023044"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 07:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="862502746"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="862502746"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 07:25:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 07:25:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 07:25:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 07:25:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 07:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffD/LHIwqT6XBnqyQBuePF+NAhTypvu3h8RaeNBEcFaPZcPyEFVkL5zVHHu30xRvL+oKXYoECCddvmYlgM4QNKlukqALYWL5EtSojzH3NAI0E6fCn2ghczZ3CHew8Mh5oPErJHyWtZeSEu31DvF5i9eUDwLzd58M/91CSkrndlqHTwUry5yBXNVoMH/xg4FGAcUa9XybF2t7h8VEJPev1/Z6sVWQrBYDvrsoo9/gvgChGKYVTZt1SpiajeMaHjq02hSjrsnPcbbE+Lu1jB0v6MSuyD3TQuD0EZvrajjxfSESDWg/2NQTo1E9HYphZuhc/7r6SAe60cip/uh1z+Au+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVIaOt62HYJR7IZO63YB3MSZlk+M5emRmytiYURXGog=;
 b=Sjbld+v2RWUVWUhQYIhZsZ9HwjDkN3FcXTcq7oPOw3+58sn2HRvwbP6780bR493iDOZFe7huq+XsbhmpnQ4GDue1nlQ9qxlRVeFadxria8yHN2LY2AgDCchYGrqBlP2gYSPm1NAE1XrO46HD+uzsc93MByldWgm/bCuMxA9wk27RbuVsPsPAbnr1BZDBMVYl8Nlm2HKYeq6Rz9w2VI1dQSsgZkmk0SXErlBEVsFR8BrGHGkTrQoMxZGUkLay8XxDmvTgCbUbnw45lPuJPbjhrKVbfLDhW+z8+5YkZe6oWcvgCwqdYVAVy209pxyw8Ce/OiB0QwuoVgXskQ3p2Jr6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31; Thu, 21 Sep
 2023 14:25:09 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 14:25:09 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe/xe2: Report number of Xe2 EUs
Thread-Index: AQHZ7Ahka5x6aZR2sEayTtOqZN9pALAkQP+AgAEVxoA=
Date: Thu, 21 Sep 2023 14:25:09 +0000
Message-ID: <a218f63a79c8f4a5fca62a3655a0c0ca780675dc.camel@intel.com>
References: <20230920212103.2145677-1-lucas.demarchi@intel.com>
 <20230920212103.2145677-2-lucas.demarchi@intel.com>
 <20230920215055.GK233750@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230920215055.GK233750@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA0PR11MB7159:EE_
x-ms-office365-filtering-correlation-id: a051ca0a-f1b7-459a-771e-08dbbaae8f47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 48DADFZcJuJCcp9R1EF1f9n8GM6babZ4Mw+VWH1cIslmvuSpx8YQp3nk4cRhSU6PYvNmw0iZyc1DGj7OYSFeAsRMfBf2Ls3FLpGFTLbCwMrluhzfvq5s/xtpH+IXkSBQeh7y7cimNkOzOHvXfsMxfpQo1Yjm5X8m4MfJE9EjS19FE2ab6rOHgPUr5tV2mH/5G8IlT+NLtqGEMa7KkhyMlDg7VR0gkZeutVBz9SEz5b7RjW76wIxLh3eLWJf+xaU72Mgt0S78AdhZsybN2cAlVeAGcAGEf5UrGVvzlJhrNu++aEXXs/9oVDt29i/4NfMdS8tFY7CMvZPL1n0bA4eJT6B1te9ox/cURDwPQ94aZTit4sKTxLyG3nOQJVv6k58CR9LU5KIP08gNC7xO6CKcDV8LtJZzc9IfJdwUYBoTIipYxrtZC2G8w24fT/cL/19MmttnB6/pc441OCbtEjYnqr3scjeTfL1nkbQqKNw9AE6KVujxfTfW9qDJU5+q+q1rimhJxLS82lzHfn8OKvQj5dV3Y9RDcDzqaB98n0bQ23OXHivNA4G0V9fsxVWftf80AGJRMxAVMWbIoa6aR+R63r086+YC+MvZBvwY3UssenfN33Z1lWgK7X8KSTUeuTpZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199024)(186009)(1800799009)(86362001)(6512007)(2906002)(26005)(2616005)(107886003)(54906003)(66476007)(64756008)(66446008)(66556008)(316002)(6636002)(41300700001)(66946007)(91956017)(76116006)(110136005)(36756003)(122000001)(71200400001)(8936002)(4326008)(8676002)(83380400001)(478600001)(38100700002)(38070700005)(5660300002)(6506007)(6486002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkRKUVJ3QWVxWldKdEVLblMwaFB6UUlSaWx0cXZFRENtMzgrWlRFckVRVE56?=
 =?utf-8?B?dkR3bXJSbEcwRmcrNURNVVZIcXVxSnhHMHVYaW5Db2toczNRVXJOcTFOZnh3?=
 =?utf-8?B?OTh6NUI2RzV3WGlmKzlYTmllVVBESjRob3JBT29NS0FNN0pQN3VvSERBYjZk?=
 =?utf-8?B?QzRMWFQzdm03ZHFaZFRmL3B2b3lERHJrazIxSjFqOUw3cG9wYmluekt1ZnpF?=
 =?utf-8?B?U1FhTXhMWVB6dTU1c1U3bzRLbnhoL21nSmROSU9mQmJ1Um54NXNaVE9UTmNi?=
 =?utf-8?B?QU9TQVBqUFgzOEJ6NXFMRElhV1A3WjFzR29Tem9sU2IxQzdPa29oUjhoZGJp?=
 =?utf-8?B?WU1rOEgyWDlGQmMvMUpJMTFiTDdSaVIzeno0cDFrM3RmTGgvRHpPVXVkVzl3?=
 =?utf-8?B?VWdBaXd6eGpXLzhXeGxLSW5zRHhnMmxDcElDS3NQMkN1b0g0Qy9HNGpKVlIw?=
 =?utf-8?B?U1d0dlBWWWR2Y0VGaldMa2tHSlhBOUZCR2ROSVhYb2pzSlBDaUlteVhjL2hB?=
 =?utf-8?B?a1I4ZW5TdlBoNVVZWHNQbFJVUTJIODdGQ0tucTgwOFhnMWVBZEJLZ0Vmb3ZW?=
 =?utf-8?B?RHVWTTVLcUd1N0NFZ0czbjVuTHQ4ZmRNVU1USk9zclp1K3ZJck5ac3E2bC9t?=
 =?utf-8?B?T2ZYSnJQODQzZFJBZmVETTlpNTQ0K0haSmpHblpTa1NLSFA0TXBoREJ1ZVBC?=
 =?utf-8?B?RmpSS3I2TENxWjE4ZXRzdDUwWlowTGtjSWwyRXVaSENKcUZzS09hZkFmc3Bx?=
 =?utf-8?B?SWNuWFVBVXBCQys1M3U0aWxFTXdEMGFaTzN4dUFRZmk3ZExMd3l5M2hXSFdv?=
 =?utf-8?B?bytUaDcwMDhsb0h5T3pUOGVzbDJGcXJab1hSWmdvaFB2aXJsd3pEOWJsamdY?=
 =?utf-8?B?VWRDM0xtcWJwQmpjam5OaUl5eERBWm5nNExWTUdHTXppOEs5VXNyUHhqYmlZ?=
 =?utf-8?B?d2VRdWgyOFpnQ2x0WDNlOUJob01MQys0MXZ2c1lJSFJobVcrUHZvWGFKbEJD?=
 =?utf-8?B?a2NqY0Rmd0tNWjFmemxZL1J5MXhnNU5qb0VwQ09ZcW5TQjk4S2F6YlVha0pG?=
 =?utf-8?B?TW1nWnhZc1NaK01UVXduSUdVSDAwcHVlVEVyVHh3Ung1ZWt5Nk9mMnJieWdF?=
 =?utf-8?B?bUtiWFU5WU4ycGFDWnZKajJYQVpDR2ViejJYMklXeUpPUXJiZUVPR3lyaHM5?=
 =?utf-8?B?Y21Md0VHTzdjS0J5dVpVUGpabUZlSFU5TmEwUFVWbldRQURqd1ZyMlQ3ZlB0?=
 =?utf-8?B?UGpVNEtsMEc1VjBoUk5HU2dFNGdBMk91Q1ZPYThINUpjNGVaVjVrRG1iQk12?=
 =?utf-8?B?dElKdU5tVEg3TFlmR2FGbXBBaHpJSjJCN0ZDRXhtL04zb3V5QWJEc3Brc2M2?=
 =?utf-8?B?WnY1N3Y1Wmx5MGlnbmJrdTEveFkwY3p1a3V1UkJvc0xzcFQwVXdoa1pIWnVI?=
 =?utf-8?B?WFhQb0xCTXk5VThnSVFKbE93VjNOUjUzNTFxSmp5emNjQzdBZEpkbHY3SXh2?=
 =?utf-8?B?NXFickVMdmkraEJMZ2tDTFdmRWhGK0tCUGl6K3dUWTMyTWtEcGxMd3FaeHVL?=
 =?utf-8?B?SlVYV0M4TmVrSWtRMWYyN3JRcjV5ZHhmWGkxUUVBc2RpWEwxeVNoYzYrdkFv?=
 =?utf-8?B?WmtHeWZVcHBxUHJpdS92N0lteG4yNCs5RUwwbURNcHpMZG5QenhKbDNMNWNB?=
 =?utf-8?B?QTNhbXVRaHV0WWJhQkkya1Fkc2RRYjZCTlRvdmlpUTYxbURTdUpodUlsT2NF?=
 =?utf-8?B?bUVOKys4cjMrVU1Od25idVVnMkV6UkJEbnJVU1pHcXlBQk5ZVVZLUGQ3c1FJ?=
 =?utf-8?B?Q1U3SUZYZEJUd21TRUFzVHBXWERpWDExa1czUFhYc3BpdWdmL2krc1g2S250?=
 =?utf-8?B?cmQyYTNyVi9odWRGcStxZzB3TEZwbnQ5bXloakxaeDdrWTZMT3ZXQ0M3RHJw?=
 =?utf-8?B?T1kvMmE4T21mY3lYYUxxS0lZZWxTeFVkNXIwekxCbm0rNUdOMFFYSEYrTFNI?=
 =?utf-8?B?U05qcklpQU1RZlhTNVhCTDBUODU0ZHBOd2Z5NmY5aGphaTdrRVNzWTIxeWMz?=
 =?utf-8?B?Yjd2dnRkdWNTTEtEaVZOaU9YNERUc2VzMUFpZFE1a2kyVWdOeFgrTXlwUWhz?=
 =?utf-8?B?WnUvOW9KT3huTytVbzQ0a01pU2I0NFdDWWpkYUpyZUJ5Z0dvakIxSTFrVllr?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81AEFAFAE52894409F561FCBD3399A8F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a051ca0a-f1b7-459a-771e-08dbbaae8f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 14:25:09.3906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOEdV1qPEdFGTLUzZyBDoBJhKqcyYKy8powEbfwpWksM+U+ZEoAeK5KRwcDi66XcpabiWJBc/dmsUxlrUCJASw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/xe2: Report number of Xe2 EUs
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
Cc: "Kopryk, Kamil" <kamil.kopryk@intel.com>, "Hazubski,
 Filip" <filip.hazubski@intel.com>, "Chaberek,
 Jakub" <jakub.chaberek@intel.com>, "Yu, Effie" <effie.yu@intel.com>, "Dunajski,
 Bartosz" <bartosz.dunajski@intel.com>, "Zhang, Carl" <carl.zhang@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

KyBPdGhlciBVTUQgY29udGFjdHMNCg0KT24gV2VkLCAyMDIzLTA5LTIwIGF0IDE0OjUwIC0wNzAw
LCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBPbiBXZWQsIFNlcCAyMCwgMjAyMyBhdCAwMjoyMTowM1BN
IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gV2l0aCBYZTIsIG9uZSBiaXQgaW4g
dGhlIGZ1c2UgZW5hYmxlcyBvbmUgWGUyIEVVLiAgTm90ZSB0aGF0IGFsdGhvdWdoDQo+ID4gQnNw
ZWMgNjI1NjQgc3RpbGwgcmVmZXJzIHRvIDEgYml0ID09IGEgcGFpciBvZiBFVXMsIHRoaXMgaXMg
YWJvdXQgdGhlDQo+ID4gbGVnYWN5IG51bWJlciBhY2NvcmRpbmcgdG8gQnNwZWMgNzA4MjAuDQo+
IA0KPiArQ2MgSm9zZS4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIGJzcGVjIGhpc3RvcnkgaXQgZG9l
c24ndCBhcHBlYXIgdGhlcmUncyBhbnkgdHJ1ZSBoYXJkd2FyZQ0KPiBjaGFuZ2UgaGVyZTsgdGhp
cyBpcyBqdXN0IGEgdGVybWlub2xvZ3kgY2hhbmdlIHRoYXQgc29tZW9uZSB0aG91Z2h0DQo+IHdv
dWxkIG1ha2UgdGhlIGJzcGVjIG1vcmUgY2xlYXIgKHNvIHRoZXkgYWRkZWQgImxlZ2FjeSIgdG8g
dGhlIHRydWUNCj4gaGFyZHdhcmUgY291bnQgdG8gZGlzdGluZ3Vpc2ggaXQgZnJvbSB0aGUgZnVz
ZSByZWdpc3RlciwgYW5kIHRoZW4gbGF0ZXINCj4gY2FtZSBiYWNrIGFuZCBhZGRlZCBhIHNlcGFy
YXRlICJOdW0gRVUiIGNvbHVtbiB0aGF0IG1hdGNoZXMgZnVzZQ0KPiByZWdpc3RlcikuICBBbmQg
aXQgc2VlbXMgdGhhdCB0aGlzIGF0dGVtcHRlZCB0ZXJtaW5vbG9neSBjaGFuZ2Ugd2Fzbid0DQo+
IGV2ZW4gaGFuZGxlZCBjb25zaXN0ZW50bHkgYWNyb3NzIHZhcmlvdXMgcGxhdGZvcm1zLiAgVGhl
IGVxdWl2YWxlbnQNCj4gYnNwZWMgcGFnZXMgZm9yIG1vc3Qgb3RoZXIgcGxhdGZvcm1zIGFyZSBz
dGlsbCBnaXZpbmcgb25seSB0aGUgImxlZ2FjeSINCj4gbnVtYmVycywgZWl0aGVyIHdpdGggb3Ig
d2l0aG91dCB0aGUgImxlZ2FjeSIgbGFiZWwgaW4gdGhlIHRleHQuDQo+IA0KPiBCdXQgcmVnYXJk
bGVzcyBvZiB3aGljaCB0ZXJtaW5vbG9neSBpcyBhY3R1YWxseSBtb3JlL2xlc3MgY29uZnVzaW5n
IG9uDQo+IHRoYXQgYnNwZWMgcGFnZSwgd2hhdCByZWFsbHkgbWF0dGVycyBpcyB3aGF0IG91ciB1
c2Vyc3BhY2UgcGFydG5lcnMNCj4gd2FudC4gIElmIHdlIHdhbnQgdG8gY2hhbmdlIHRoZSB1YXBp
IGZyb20gcmVwb3J0aW5nIHRoZSB0cnVlIGhhcmR3YXJlDQo+IHZhbHVlIHRvIHJlcG9ydGluZyB0
aGUgZnVzaW5nIG51bWJlciwgd2Ugc2hvdWxkIGNvb3JkaW5hdGUgdGhhdA0KPiBiZWhhdmlvcmFs
IGNoYW5nZSB3aXRoIHRoZW0uICBBbmQgaWYgdGhleSdyZSB0cnlpbmcgdG8gYWNjZXNzDQo+IGhh
cmR3YXJlLWxldmVsICgibGVnYWN5IikgRVVzIGluZGVwZW5kZW50bHkgYW55d2hlcmUgYW5kIGNh
bid0IGp1c3QNCj4gb3BlcmF0ZSBvbiBwYWlycywgdGhlbiBzdWNoIGEgY2hhbmdlIG1heSBub3Qg
YmUgcG9zc2libGUuDQoNCkluIG15IG9waW5pb24gd2Ugc2hvdWxkIGF0IGxlYXN0IHN0YXJ0IFhl
IEtNRCBjb25zaXN0ZW50LCBoYXZlIGFsbCBwbGF0Zm9ybXMgd2l0aCBsZWdhY3kgb3IgYWN0dWFs
IGhhcmR3YXJlIEVVIGNvdW50Lg0KVGhlcmUgaXMgYW55IGd1aWRhbmNlIGZyb20gbWFya2V0aW5n
IG9uIHRoaXM/IE1lc2EgaGFzIGEgdG9vbCB0aGF0IHVzZXIgY2FuIGdldCBkZXZpY2UgaW5mb3Jt
YXRpb24gdGhhdCBpbmNsdWRlcyBFVSBjb3VudC4NCg0KSnVzdCB0byBwdXQgVU1EIGZvbGtzIGlu
IHRoZSBzYW1lIHBhZ2UuDQpUaGlzIHdpbGwgY2hhbmdlIHRoZSB2YWx1ZSBvZiBYRV9UT1BPX0VV
X1BFUl9EU1MgZm9yIExOTC4NCg0KVGhpcyBpcyB3aGF0IHdlIGhhdmUgQlNwZWMgZGlhZ3JhbXMg
YW5kIHdoYXQgWGUgS01EIHdpbGwgcmV0dXJuIHdpdGggdGhpcyBwYXRjaDoNClRHTCAxNiBsZWdh
Y3kgRVVzIHBlciBEU1MsIG1heCA5NiBsZWdhY3kgRVVzDQoNCkRHMiAxNiBsZWdhY3kgRVVzIHBl
ciBEU1MsIG1heCA1MTIgbGVnYWN5IEVVcw0KUFZDIDggYWN0dWFsIEVVcyBwZXIgRFNTLCBtYXgg
cGVyIHRpbGUgNTEyIGFjdHVhbCBFVXMNCk1UTCAxNiBsZWdhY3kgRVVzIHBlciBEU1MsIG1heCAx
MjggbGVnYWN5IEVVcw0KTE5MIDggYWN0dWFsIEVVcyBwZXIgRFNTLCBtYXggNjQgYWN0dWFsLzEy
OCBsZWdhY3kgRVVzDQoNCk1heWJlIHJlbmFtZSBYRV9UT1BPX0VVX1BFUl9EU1MgdG8gdGhlIHR5
cGUgZGVjaWRlZCBzbyBubyBvbmUgZ2V0cyBpdCB3cm9uZywgWEVfVE9QT19MRUdBQ1lfRVVfUEVS
X0RTUyBvciBYRV9UT1BPX0FDVFVBTF9FVV9QRVJfRFNTLg0KDQo+IA0KPiANCj4gTWF0dA0KPiAN
Cj4gPiANCj4gPiBCc3BlYzogNzA4MjAsIDcwODIxLCA2MjU2NA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3kuYyB8IDQgKystLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90b3BvbG9neS5jDQo+ID4gaW5kZXggMDExYWQ3ZjIzMjVjLi44Nzhm
M2VkN2JjMjYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RvcG9s
b2d5LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3kuYw0KPiA+
IEBAIC00OSw4ICs0OSw4IEBAIGxvYWRfZXVfbWFzayhzdHJ1Y3QgeGVfZ3QgKmd0LCB4ZV9ldV9t
YXNrX3QgbWFzaykNCj4gPiAgCWlmIChHUkFQSElDU19WRVJ4MTAwKHhlKSA8IDEyNTApDQo+ID4g
IAkJcmVnX3ZhbCA9IH5yZWdfdmFsICYgWEVMUF9FVV9NQVNLOw0KPiA+ICANCj4gPiAtCS8qIE9u
IFBWQywgb25lIGJpdCA9IG9uZSBFVSAqLw0KPiA+IC0JaWYgKEdSQVBISUNTX1ZFUngxMDAoeGUp
ID09IDEyNjApIHsNCj4gPiArCWlmIChHUkFQSElDU19WRVJ4MTAwKHhlKSA+PSAyMDAwIHx8IEdS
QVBISUNTX1ZFUngxMDAoeGUpID09IDEyNjApIHsNCj4gPiArCQkvKiBPbmUgYml0ID09IG9uZSBF
VSAqLw0KPiA+ICAJCXZhbCA9IHJlZ192YWw7DQo+ID4gIAl9IGVsc2Ugew0KPiA+ICAJCS8qIEFs
bCBvdGhlciBwbGF0Zm9ybXMsIG9uZSBiaXQgPSAyIEVVICovDQo+ID4gLS0gDQo+ID4gMi40MC4x
DQo+ID4gDQo+IA0KDQo=
