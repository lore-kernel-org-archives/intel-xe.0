Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DE8C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 03:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44AD10E418;
	Wed,  7 Jun 2023 03:38:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FBD10E418
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 03:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686109124; x=1717645124;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O4v+Czy6szEnUyEXxMG2YfOb2wX6rBdzxj7mIRRlYTM=;
 b=JooLUb6zo0m7gO9I1CL7y1Z+rd0/lu6qFf6A7oeORz4eXn/i54JKNlSV
 +fZaFEi+lBqiIwzs5cey+6VYX2d2YvMcL1w/MAY9h85/U3N6V1Bl0JCv3
 jhbiyLRXTZC56ilYYqkKV+Qs16uDGR1d4JdQ9x1ZJCxpe2aah6FVenMKZ
 i0HhITf+KtM/BAW35ykeomX/aFqx05YeZJKr2wU8yvMWestZrVGoda6I2
 gvQEWkH6fx02dROyw7be+FB5LnoJ5mTvH3t/GK+5XQB2xhiZh+rTLuvVX
 xPuI6LYssHjnWYkgZb8WPs7KGPxP2Y8dfESi4wq2iO0vhf9UFGPrbAd0A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359333702"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="359333702"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 20:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="659774944"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="659774944"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 20:38:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 20:38:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 20:38:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 20:38:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 20:38:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJM5TqVMcgvOWC7WLN8ibmFZgn1FcGFZrgnegBKsyduGqXsSN2uugSPJbBe3dBUSiteJ/V3cybS2GaCyms3oN2ltYb4XkgKsVdjj2mlxByd0vYmKuVV8MQB9AvZIN44UBH9kuAgadnOfx5Uyr/YatomgFMFQmoPaxt2BckRB3iJ0v3SCaeC79xZRb4Sg+PomKUtybLAgSHrHau4qHfwZ1oga+VpRSrKNni3qLZ8puCQYhUPcphaR/JRAOZy7lOiLhM0tNKobbhdNEF7haCobpkeKkIKXpm8rm+TwQJda4gNGkc2MHswaVxDyzN9Ddr+hF5IHrtQOGxvWqbLiKxuhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4v+Czy6szEnUyEXxMG2YfOb2wX6rBdzxj7mIRRlYTM=;
 b=ZK+C5JBYdfT92Aggaie2PboINtO7lMeluwz23S0VgvVZy6sbtmrBil1tZLH3A9nx1wPG6g+LIfubUo5QYsgPsvyMOEZDmslqpDyJ4ZOPfg7GVBFDLliM4PFzVC0fXDc1phV8NLXiNLclpXgcbmAGhJygc54Af1KU1cx91V40YyjUePy+/pIBw4OB/RBHwBN3h59F69FLZnJTtY8rkEbiwWbWvvJpFjPs9W7ul9RJOEa7dKQwUnAtW4b6eAl+tEHakC4y0U0casghFjKzWk7/xtKYy899wYAfqDEGtwhzM0ErMZp+K1WhPuQ/t+IeXFkhe2kqoKHuF+doE4xwBfCB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 03:38:35 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 03:38:35 +0000
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Thread-Topic: [Intel-xe] [PATCH] [RFC]drm/xe: Sysfs entries to query fused
 min, max frequency of lmem
Thread-Index: AQHZmFieYN/RVwoTQU6z+1PQEarokq997i6AgADEMw4=
Date: Wed, 7 Jun 2023 03:38:34 +0000
Message-ID: <01542752-02A7-4368-BF36-F4B568F63AD8@intel.com>
References: <20230606082142.7846-1-sujaritha.sundaresan@intel.com>
 <87h6rkmvoa.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87h6rkmvoa.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|CO1PR11MB5073:EE_
x-ms-office365-filtering-correlation-id: cdc7f274-f01a-4c11-c7d6-08db6708ac01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EwHRGcCrKW3b7X5M5UzFK11Mvl42QbIUGWkYBNczGsP5Kk6pHFfWsVScbX3jGRSB6bI20wPWUJWJK3UaBx3BT37xzuHbWm4l1FCtQMovN9Tm+o1K/G/TQ9XvdG1wgMH9kbSnXOkcYxzaqC1kBhwTnfrOBtWBALSaJKsNFkVngYWTCoGkTWJNCP8HuaZi8TL+POTRaCyEVgdsX9H+1RNZ/aeyxGkltxVhU44SvNDdn3KSVvwOdfca2OluxSN+UHYphcvrHgYN6FxKj1fYw7SJJRUmyH33fSr3/UBjwyAdew3JOiXlyNlQ1WlGPoSJTjstUg0pjQQDyJ6zdUiVzLOXLfuE+dlaTeHNOQ+C1PPvAgcpxyy6MoZykSuigAGunavNoFTVjVNEo6FcUTBBPKPlxMCHrHoZxQTpPujddInKJiwLd8yuO7oeb7w6H2AWmhJ9NFDDb2BrmZnGv4qxNlNj7VYhv3OfAL49Uj1k3DeC9Ml68ygvApqdhWAhWRNa81SSdzaX7OFkundKA/dImzu64muYwq6kPW2CGOF3liUm7rx7vRHb5AlVQcuc1bMJl4UETGLdBkG/SDi4K9+aE8GcjMqCMbFJDrVN++4mgYI+ItrJ1uYbO1LHz1EcRjNqqPtKblg5Xrav6UGLpiEP7p2T0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199021)(478600001)(66446008)(71200400001)(38100700002)(36756003)(82960400001)(66946007)(122000001)(76116006)(4326008)(6636002)(66476007)(64756008)(37006003)(86362001)(6862004)(8676002)(8936002)(5660300002)(33656002)(2906002)(38070700005)(316002)(41300700001)(66556008)(83380400001)(2616005)(6506007)(26005)(6512007)(53546011)(186003)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnpINkc1VG8vUnkzNmZ3MU1HQUZIeU9wUnRMYkVIbE1IOE4yQ3k5cm5BSjVK?=
 =?utf-8?B?VE5hV1R0cndFMGRhSDhBOUM0T29ycWtrQVJkdmd5VXpPbCtmdVlxZWhNb01D?=
 =?utf-8?B?Y2MvSUwyeDkzUEROMmVyRVg0cDdPaUQzbC9rUG1qcExWTjcxeVphYnpkSk5m?=
 =?utf-8?B?TmFMNFBnWDlRVmNqZXNtdFBqVmhuWnJsRjU2MWlINmZkbE1lREJuMHpiRzF0?=
 =?utf-8?B?VnRadURvbWo2dUlSNkI2cVJGZCsrR29zMmdLaGdzSHVRWDFkVnc4MnN5TWNn?=
 =?utf-8?B?V3hYU3V1WkR2OEw0bTROS1ZWb0VHbTFiK21DV0VZWGpMS28rT1Q2S0lVTHBm?=
 =?utf-8?B?NW9DcFQrdjRpcVBaV0g1T01JZ0hwQ3JPREtUVFZNNFBueUtid2V4OFZQcDNt?=
 =?utf-8?B?V2kwSFNNZFhPN2JaY0hPc2tKR3ovZzRHYnpwTGVMUVhEVW5NeGN6ODVJOExv?=
 =?utf-8?B?OHFQUUhUREI3NGorenN1Z1gzOHc5MnlWV3RIZldzVVgwZ2tZVHFDak9YTDZu?=
 =?utf-8?B?MXJtM3lKa2s3VkNHOCtHbXNDWkE3d1Zuc1EzUzQvQ2lLOG1Td0d1cmkrUHNT?=
 =?utf-8?B?SnRyT1gwYTcvV2dBaE1KZUZBU1dmaUFlUERhR3ZSM1I2UzErYkdiU0ZhZDBF?=
 =?utf-8?B?Zi9XaVluWnRvMjRPaCtzMVI0RkRoSmx2c1lXWmgrMFhqSWdWVHpDMEY2YWFV?=
 =?utf-8?B?RFFuZGpLdEc5Qm1yOXRYVms0eThoSGVsVzRnVEg1WEs1WUpLNVI2TkoyVjBq?=
 =?utf-8?B?c1kxaDBTTDRRQWN3ZDIvT2NzR2Y1b0VjSElPRzFJNEhPUkx2QkdsdWlTN3BQ?=
 =?utf-8?B?NUdURjN4bTdHR0hWeEZvekZPRzl0LzNPNUZ6V1puL1FQZzdFNzA5aFJ2K2xM?=
 =?utf-8?B?ekdJV3ZrTkQvcHlnV2N4M0hZN0Z2SlB3TFpQR0p5NFpoRG9LRitmL0tsUzV6?=
 =?utf-8?B?SGVJSGZJQUpZeDRPV0NEeGppVlZUWk1SbmdWdE9JL3BQTFlPdXo5S2VUcWta?=
 =?utf-8?B?Y1o2cURsZGVYdzNBM3dYT09tam02d1hQVmdQVkdINkNra1Npbjc4eHliTGFh?=
 =?utf-8?B?dEFCV0VycElYQzVZUmhwamZGcVdodGJRWWRLQXNNUzJsSDFtQTFnM3NjUTRt?=
 =?utf-8?B?dDlTVkR1UHZvUGc5NW5TT2xrM3pUcWJYdjd6blBKNTdqek5jeVpVSGlDMzJZ?=
 =?utf-8?B?NUZ5OUltbGs1eUxhMFQrUTJ2WFgxQlR2MGdRYUxLcVkvZGZiTk5VY241Zk1i?=
 =?utf-8?B?RGFudDcxUnNneUhiRXZRL3l0S21seWRGeDY0U1NqR2lpaWFqTXdpU2RkZUlR?=
 =?utf-8?B?VUVtemJWM0ZLNzV3L2ZYNUZYZHRDckN0RjNNRHBHcENHVHJ1SnE3RGpUT1Zi?=
 =?utf-8?B?K3VXeklvR3dTWnNweUxCQ1hpZkdaQXpnaW1TbmRFTHpRUU43WFN5THN2VXdJ?=
 =?utf-8?B?SzlMdnJUZ0xTSFRmVFByMUFSTWtNY0hQOUFNWEJtU1lYMGc5T2hOUEk1Y3Ny?=
 =?utf-8?B?WHRmaHFyYUJBZ2VyeUl5TVZLSnJ4U3N2UEoxaUFUdHY1NW5oUkRGaFBxVXll?=
 =?utf-8?B?aEZyUWU0elV2OWtsZjBSNk1uL3BQMTNjT3Z1dTluV1lpa3k4S3AwOW42Sktw?=
 =?utf-8?B?Z2R2bmc0dXZmeENXV1h1Q0NYOXVnelRndjYvTXdJVjFSTHgwMzZjdXVzeTN2?=
 =?utf-8?B?N1hQZk9aMS9DclQ2MUFPcEZkOGUyZjRIaDJKaU9lUlZUOW12WjRPMDA0SXk1?=
 =?utf-8?B?QVFiUkZqL3JDRG9XaExEa3lOcUJ4TFJybENUWmMvUUZTeHBub1FKZUxSa3Zo?=
 =?utf-8?B?T25YUjhyMTNubTRaN25NTkhHNXVMWlJRNXZBUGZlOWFiWW1LTmZTbVhVeXlk?=
 =?utf-8?B?SlNuZmpxV2ViRnV6bWNHVy9ZSTdDcm45VUpsRE1FZDkzMFhtTzlwTUNZSW9K?=
 =?utf-8?B?SldNbVYybWZla05mU1FlY3MrWDhhWW5GSkhmSXZkKzE2aXFXaWp6WngzY21t?=
 =?utf-8?B?OER3U3dnUHdObE1xTzl6dm9EbUdsMnpNQU0yV05TcDVhOU80L0ZmcHR2cGNH?=
 =?utf-8?B?RWY1dU1kc0R4YjFOMTJ1YWNkaTlidVFtWUhqL0M3d0VsZkNJeFZqcWtZQ3V0?=
 =?utf-8?B?WTFrdXVsY0pPVGc2T216czhqYklCaHlVdFhHbFFYaVVBWWRGNGkydmdXMTF1?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc7f274-f01a-4c11-c7d6-08db6708ac01
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 03:38:34.5911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9K3zxijlQRj4E7Y0nadF9LaQOMTdxumiks8vfZutTF107SNl6ZDVrcESucYdXT4sb9xqJlG0Ms6ASuL8ip/3eWyBAs/6CKyK4JZVQ0Zvy1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] [RFC]drm/xe: Sysfs entries to query fused
 min, max frequency of lmem
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

DQoNCj4gT24gSnVuIDYsIDIwMjMsIGF0IDk6MjcgUE0sIERpeGl0LCBBc2h1dG9zaCA8YXNodXRv
c2guZGl4aXRAaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFR1ZSwgMDYgSnVuIDIwMjMg
MDE6MjE6NDIgLTA3MDAsIFN1amFyaXRoYSBTdW5kYXJlc2FuIHdyb3RlOg0KPj4gDQo+IA0KPiBI
aSBTdWphLA0KPiANCj4gT25jZSBhZ2FpbiBzeXNmc19jcmVhdGVfZmlsZXMgaXMgbWlzc2luZyBm
cm9tIHRoZSBwYXRjaC4NCj4gDQo+IEFsc28geGUgY2FsbHMgbG1lbSB2cmFtLCBzbyBzeXNmcyBm
aWxlIG5hbWVzIHNob3VsZCBzb21ldGhpbmcgbGlrZQ0KPiB2cmFtX3JwMC9ycG5fZnJlcV9taHos
ICJtZW0iIGlzIHRvbyBnZW5lcmFsLg0KPiANCj4gQXNodXRvc2gNCg0KSGkgQXNodXRvc2gsDQoN
ClllYWggdGhpcyBpcyBub3QgdGhlIGNvbXBsZXRlIHBhdGNoLiBJIHdhcyBob3BpbmcgdG8gZ2V0
IHNvbWUgZmVlZGJhY2sgb24gdGhlIG5hbWluZyBhbmQgcGxhY2luZyBvZiB0aGUgY29kZS4gDQoN
ClRoYW5rcyBmb3IgdGhlIHJldmlldy4gSSB3aWxsIHJlbmFtZSB0aGUgYXR0cmlidXRlcyB0byBy
ZWZsZWN0IHRoZSB2cmFtLg0KDQpJcyBpdCBva2F5IHRvIGxlYXZlIHRoZSBjb2RlIGluIHRoZSBj
dXJyZW50IGZpbGUgPyBTaG91bGQgdGhlIFBDT0RFIGRlZmluaXRpb25zIGJlIGhlcmUgb3IgYW5v
dGhlciByZWdzIGZpbGUgPw0KDQpSZWdhcmRzLA0KU3VqYQ0KPiANCj4gDQo+PiBTaWduZWQtb2Zm
LWJ5OiBTdWphcml0aGEgU3VuZGFyZXNhbiA8c3VqYXJpdGhhLnN1bmRhcmVzYW5AaW50ZWwuY29t
Pg0KPj4gLS0tDQo+PiBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmggfCAgNyArKysr
Kw0KPj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jICAgIHwgNDQgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCsp
DQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmgg
Yi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmgNCj4+IGluZGV4IDhiZTYxNmExYmQ1
MS4uYmQ3YjI2Mjk2NDAyIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3Mv
eGVfcmVncy5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmgNCj4+
IEBAIC0xMDEsNCArMTAxLDExIEBADQo+PiAjZGVmaW5lIERTTUJBU0UgICAgICAgICAgICAgICAg
ICAgIFhFX1JFRygweDEwODBDMCkNCj4+ICNkZWZpbmUgICBCRFNNX01BU0sgICAgICAgICAgICAg
ICAgUkVHX0dFTk1BU0s2NCg2MywgMjApDQo+PiANCj4+ICsjZGVmaW5lICAgWEVIUF9QQ09ERV9G
UkVRVUVOQ1lfQ09ORklHICAgICAgICAgICAweDZlDQo+PiArLyogWEVIUF9QQ09ERV9GUkVRVUVO
Q1lfQ09ORklHIHN1Yi1jb21tYW5kcyAocGFyYW0xKSAqLw0KPj4gKyNkZWZpbmUgICAgIFBDT0RF
X01CT1hfRkNfU0NfUkVBRF9GVVNFRF9QMCAgICAgIDB4MA0KPj4gKyNkZWZpbmUgICAgIFBDT0RF
X01CT1hfRkNfU0NfUkVBRF9GVVNFRF9QTiAgICAgIDB4MQ0KPj4gKy8qIFBDT0RFX01CT1hfRE9N
QUlOXyogLSBtYWlsYm94IGRvbWFpbiBJRHMgKi8NCj4+ICsjZGVmaW5lICAgICBQQ09ERV9NQk9Y
X0RPTUFJTl9IQk0gICAgICAgICAgICAgICAweDINCj4+ICsNCj4+ICNlbmRpZg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfcGMuYw0KPj4gaW5kZXggNjdmYWE5ZWUwMDA2Li4xYjM0OWNlNzRjM2QgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPj4gQEAgLTQ1Myw2ICs0NTMsNDggQEAgc3RhdGlj
IHNzaXplX3QgZnJlcV9ycG5fc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiB9DQo+PiBzdGF0
aWMgREVWSUNFX0FUVFJfUk8oZnJlcV9ycG4pOw0KPj4gDQo+PiArc3RhdGljIHNzaXplX3QgZnJl
cV9tZW1fcnAwX3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPj4gKyAgICAgICAgICAgICAgICAg
c3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZmYpDQo+PiArew0KPj4gKyAg
ICBzdHJ1Y3Qga29iamVjdCAqa29iaiA9ICZkZXYtPmtvYmo7DQo+PiArICAgIHN0cnVjdCB4ZV9n
dCAqZ3QgPSBrb2JqX3RvX2d0KGtvYmopOw0KPj4gKyAgICB1MzIgdmFsOw0KPj4gKyAgICBpbnQg
ZXJyOw0KPj4gKw0KPj4gKyAgICBlcnIgPSB4ZV9wY29kZV9yZWFkKGRldiwgWEVIUFNEVl9QQ09E
RV9GUkVRVUVOQ1lfQ09ORklHLA0KPj4gKyAgICAgICAgICAgICAgICBQQ09ERV9NQk9YX0ZDX1ND
X1JFQURfRlVTRURfUDAsDQo+PiArICAgICAgICAgICAgICAgIFBDT0RFX01CT1hfRE9NQUlOX0hC
TSwgJnZhbCk7DQo+PiArICAgIGlmIChlcnIpDQo+PiArICAgICAgICByZXR1cm4gZXJyOw0KPj4g
Kw0KPj4gKyAgICAvKiBkYXRhX291dCAtIEZ1c2VkIFAwIGZvciBkb21haW4gSUQgaW4gdW5pdHMg
b2YgNTAgTUh6ICovDQo+PiArICAgIHZhbCAqPSBHVF9GUkVRVUVOQ1lfTVVMVElQTElFUjsNCj4+
ICsNCj4+ICsgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmZiwgIiV1XG4iLCB2YWwpOw0KPj4gK30N
Cj4+ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8oZnJlcV9tZW1fcnAwKTsNCj4+ICsNCj4+ICtzdGF0
aWMgc3NpemVfdCBmcmVxX21lbV9ycG5fc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+PiArICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmZikN
Cj4+ICt7DQo+PiArICAgIHN0cnVjdCBrb2JqZWN0ICprb2JqID0gJmRldi0+a29iajsNCj4+ICsg
ICAgc3RydWN0IHhlX2d0ICpndCA9IGtvYmpfdG9fZ3Qoa29iaik7DQo+PiArICAgIHUzMiB2YWw7
DQo+PiArICAgIGludCBlcnI7DQo+PiArDQo+PiArICAgIGVyciA9IHhlX3Bjb2RlX3JlYWQoZGV2
LCBYRUhQU0RWX1BDT0RFX0ZSRVFVRU5DWV9DT05GSUcsDQo+PiArICAgICAgICAgICAgICAgIFBD
T0RFX01CT1hfRkNfU0NfUkVBRF9GVVNFRF9QTiwNCj4+ICsgICAgICAgICAgICAgICAgUENPREVf
TUJPWF9ET01BSU5fSEJNLCAmdmFsKTsNCj4+ICsgICAgaWYgKGVycikNCj4+ICsgICAgICAgIHJl
dHVybiBlcnI7DQo+PiArDQo+PiArICAgIC8qIGRhdGFfb3V0IC0gRnVzZWQgUDAgZm9yIGRvbWFp
biBJRCBpbiB1bml0cyBvZiA1MCBNSHogKi8NCj4+ICsgICAgdmFsICo9IEdUX0ZSRVFVRU5DWV9N
VUxUSVBMSUVSOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gc3lzZnNfZW1pdChidWZmLCAiJXVcbiIs
IHZhbCk7DQo+PiArfQ0KPj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhmcmVxX21lbV9ycG4pOw0K
Pj4gKw0KPj4gc3RhdGljIHNzaXplX3QgZnJlcV9taW5fc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYs
DQo+PiAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIg
KmJ1ZikNCj4+IHsNCj4+IEBAIC02MzEsNiArNjczLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBh
dHRyaWJ1dGUgKnBjX2F0dHJzW10gPSB7DQo+PiAgICAmZGV2X2F0dHJfZnJlcV9ycDAuYXR0ciwN
Cj4+ICAgICZkZXZfYXR0cl9mcmVxX3JwZS5hdHRyLA0KPj4gICAgJmRldl9hdHRyX2ZyZXFfcnBu
LmF0dHIsDQo+PiArICAgICZkZXZfYXR0cl9mcmVxX21lbV9ycDAuYXR0ciwNCj4+ICsgICAgJmRl
dl9hdHRyX2ZyZXFfbWVtX3Jwbi5hdHRyLA0KPj4gICAgJmRldl9hdHRyX2ZyZXFfbWluLmF0dHIs
DQo+PiAgICAmZGV2X2F0dHJfZnJlcV9tYXguYXR0ciwNCj4+ICAgICZkZXZfYXR0cl9yY19zdGF0
dXMuYXR0ciwNCj4+IC0tDQo+PiAyLjM5LjENCj4+IA0K
