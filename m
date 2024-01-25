Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F8AC47DDF
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 15:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17E910F03B;
	Thu, 25 Jan 2024 15:17:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1145510F03B
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706195845; x=1737731845;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+juhx/3uDV6FqKty1FpXaLBLVKHZToI3ZCte4a/fksE=;
 b=nmyhJUCpkc7X4ntSaE2T4ZU0kvxx3nOtOV2B47kNXuIBwBhc288JrPVh
 wEemS6jBNUdpCTiAHiI/jjKRvZrhxQkrDGdp4Om1qZzNDCePuJi1D7AiX
 G1Gj7st768nh9JWUACTz/KnPvEUmsopZLqcHGcgmryv1Z1j2m00tdNDm+
 XndK4Nk5hfuxBBrup0HY17pA1Hs+QtrSjoqsDTC6fYzZA7Zg/tNQE/d10
 T4LcH27FbpVt1wZakhsk41n/sc1ovEdBVxs0bF2oTQt9HBAxw3l80j7+F
 yhjzgy4nrZCdwMfC6pa+2219eKtd4fG2pHf47AOS/OI83H/hXS7z3HymN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9567270"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9567270"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857099000"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="857099000"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 07:17:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 07:17:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 07:17:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 07:17:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7qj5jdf0ODhHQP18K9K59yMCgBW3B6yGEh0TgJY7L8NtnqP05ZePQ2H4ZQwixQUauoQyhp02VE3jrN2o0Z7eqmeWX5lMyYmNXUFyuzQeu60eqgYkBwAzRqQxUsGq/fImamfhjnYPWpQR07kBjA9yW+aGGT/ysKb4oj2dFMW18dahjWqAqiROlr7QF14J753GZ7nSR+BPU713b7x6oHfdU+JkXt8dtXTOBEV3QGmJut6c3ZrXO/D7Lrvqhg0dLEjqREnn3gKoJw4KSKe/hC5yp/gf4019Gq5rFOC7/HaQC5iuJLCebnrKLhArum0BdUbtfo3GDpobq7TkzhsQ1YzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+juhx/3uDV6FqKty1FpXaLBLVKHZToI3ZCte4a/fksE=;
 b=D6Q8txhHBh19NOkWHy6BnOKHyNiKQ7WP9TQQTNmVsD2YK55c5Ay++9jKB22sU0clXctJ5iKh3GM23eCasU+WxY1PAjakXwKgHyfNkqNWfRcL/aiZWj/G9oCrTmi85iaPf2B3TtX8l+cQuDtOq23bsFF2Q4AXalfAsDePUIX8VP/ikn+dzrOH8ec3OTWDEJkMqPDYsXjnBht4GgsLTGPCGs4FPiZrf5PiPGOa46ml0ep20RflEsIQWcnIuDjoFUfMRdAmMhPwoUGvG4FoUyycF2nRm17x5IMfZKBNT07OwPiApCTHwOKUkr7yBmT+YcAizHcIRD9wWo0XfMzywizP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Thu, 25 Jan
 2024 15:17:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7202.034; Thu, 25 Jan 2024
 15:17:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yang, 
 Fei" <fei.yang@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: correct the assertion for number of PTEs
Thread-Topic: [PATCH 1/1] drm/xe: correct the assertion for number of PTEs
Thread-Index: AQHaT1rL5Oapr3DIYkWab82zQfnyhrDqpGIA
Date: Thu, 25 Jan 2024 15:17:04 +0000
Message-ID: <8230ee24525218996c831a14eb9a5e9360cd8e85.camel@intel.com>
References: <20240125065245.1204731-1-fei.yang@intel.com>
 <20240125065245.1204731-2-fei.yang@intel.com>
In-Reply-To: <20240125065245.1204731-2-fei.yang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA0PR11MB4558:EE_
x-ms-office365-filtering-correlation-id: 2e876fc4-be03-41dc-8d22-08dc1db8b04c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: utZRenbRfD6xBYP7mEZyUEg4ZmJ4tiNSvbN9yFi+CkZIGppBudJFlk+6sEA9OSjSzpG+NtPGCXsXu/9KdP6LX6m1sFm+4XISl0VPRwofJBTfSgL8YMKsb+fAuspikJMBt8tZXTpJGBbcfGxrrpt+OxYoMG89NYJZB69SsB7Rs3srdpHSB8mbDmr+Ukxf9WvUkLduIhoBrP6ebmkGdoGA5E8fKFZpdQDVyxZFqh9TvlOFZpZdv2yGqmeG4feMYgjDvNLpCCadpd6ag53gdzXubpt+c8XZJ+RUj+hsadegR0Qw4gFtT+AXQQBvmHdjuHyVYXIdm3VIwfP6rHt3YdXxrs/JX4z2n8AvkshVMt+VlY6ucNY/UhFM+FZ+shQxny7JY5cubCyqhF9iiLANOuvpSuD9B6jAepqdPTy760IF0LVBI52fkULuN+rBhYUc3YEBSqZk5SDhHImfl0e+pQcKZWWOrS7vS57gwwx+bQ6VVkEwkOO/MwG8tvHgMOgFVO+RYUZ4COtkmTAQ/SQxjIAs6yR+kLj014sK/wzbmlGvnxgPCOucHyi7/cy6b79FvDhicGrimh0R3PNkdnyOmt68cj8LXAa0oIefePNixOreqIQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6636002)(66946007)(26005)(76116006)(66446008)(66476007)(110136005)(5660300002)(316002)(107886003)(64756008)(4326008)(2616005)(8676002)(91956017)(8936002)(2906002)(83380400001)(6512007)(66556008)(41300700001)(36756003)(478600001)(6506007)(71200400001)(6486002)(966005)(38070700009)(86362001)(122000001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qzc1NExIa1VTK25RTFhYZC9tTlBSQW8rN2JmMy92QmthWG9FajM4OEMvWWc0?=
 =?utf-8?B?cGEvOHFSOG1qQ3ZJZEQvamc3M3FlK2dIRDY0WjRXcit2dm5HMjdoMkFJallN?=
 =?utf-8?B?ZmJ5MDJTa1p5ZGRpdmM4TkREWkdFcXpLOGdZRTdpeGo1SUFuZ0RKeElZQm5q?=
 =?utf-8?B?VHM1Vzh0dGtVelJFTmFRd2ZYSmQrdHpRUDQvNzlQUTl0cXhXbG9WR1ZlZzYz?=
 =?utf-8?B?SzJ2dHVjckhCQUVhVzhsNlVONkdaeVlNZWN5RmFoTGEzbjZLdVdSbVFCUWVy?=
 =?utf-8?B?aUFuZ1M1TWUwb1dGOXF0ZVAxUGl4STNYZ2tlaTRNb1huNnhjSVppd0llbHdi?=
 =?utf-8?B?MFlzckNpSndHTmVKWjhHWG9Wc1JrZzZYMFZkaWpPU0l6UmhOV0ZlSDYwSXdE?=
 =?utf-8?B?TWpPV0FySnJRVitoU3lESVhGOFpqeDRqWnRVQWh4Z1JqZjVROGxBQjZQcElj?=
 =?utf-8?B?MlZabVlVLytScXlXV21oWFEvcEFPQzlIbEdqdUdtekcxdXYxcXhFMHNyTXlU?=
 =?utf-8?B?QkF4TEhjaGNUcUVQUmMycFFTbGVIRW9HTGxKM2V2alp6SmxkZjYrcXp3a0tN?=
 =?utf-8?B?RXJxYjhnZEM3d2JYUG5hNlFtcWRrckg4MTNiM01VcTBYZWFQZUVpVS93QjZI?=
 =?utf-8?B?eVVXd3dqcUJNZm9JZkZnZ2krTVZBTXB5TmZOWE04ZnBRYTRlUTBnK1lZOVJG?=
 =?utf-8?B?b05zekRFNHJjL2lDSUZLWnFBb3h6NnExbFd1bWI0eUdkSVVQd3BJYVAra0Z4?=
 =?utf-8?B?V2MzL2lRNnY3ZmdHTWM2MEV6Q2V3a3ZsN3VtbWdBbmtMMVNwd2o4cUw1b1BO?=
 =?utf-8?B?NzRmeUZQMzdVRlFZU3NOTGYramdoYTRwcFRCQ2pYSFFlcmVYRmZRMzExQjFB?=
 =?utf-8?B?WlYyOGlaOTlCNk55M2Y4eFNsanJKa1M5U1RlcmRlSXUxU3hHdWRJcThhbTZV?=
 =?utf-8?B?RTg0M0kvTnBwN3BJTUtUUy8xQjV0SCtDMHppVlByOFdSQ3NHelRsYkFVempN?=
 =?utf-8?B?RTJKblRkUWR3Z25KYXJ1S1U3dDFYcERFT3EraXZ0R0xiRS9YRkxSY1RtZzRD?=
 =?utf-8?B?NGJ5eGVYOTFZU2NwS1d0UlAxSS9GTmNNbDAyK0xmeFBkaktwRDJ6aXdKNVBU?=
 =?utf-8?B?ZWQ4RTlqRURZalo5bTM0a3F3eUc3TlpQeTFoSGhvaHU3bjJkdGxPYUp0dE4y?=
 =?utf-8?B?dDZEZmtKVldaeVdNc0YwdFNIcENId2RiU2VjY3NjQk4yYXNIQ2txVG45WXMv?=
 =?utf-8?B?NG12QUlKM0txTmw5L1k3anhDRjJwanVXOHN5bTlWVEhWMndJMUMzanZTSDFu?=
 =?utf-8?B?a0kzSDR3QTA3TStRK2txODFXOGZBUVE5RG9VSWU2RVozYTZOdVdHRmY5TVRz?=
 =?utf-8?B?V1BEUVArbFViNEU3UGN3WmlDS2VqaVFzdEswU1RPMTRuNWZIVjNGNDIwcmw4?=
 =?utf-8?B?TUhyeFpVOUQxYWdhTmk3bGwxYk5VdjRIbnFhM1NyZkRpUTlQdUw1WUhZN2ZP?=
 =?utf-8?B?RG8ydzlkcG95R0FvcmJrMVpmVVBBTzcyZmgvZmFRRWQ0QU9hNStHcHFUUzJt?=
 =?utf-8?B?N0RFS0tIRFl2ZXF4T0NBbFRUVm9RZDQ3T2xwY0pKY1EwaDVtLzVremdObEZF?=
 =?utf-8?B?NUM3V2VGS0Y0dWxMcnRTeFNUYkQ3TEprUm9rMHNxRkpwTjlsVTNrc1NvRkZv?=
 =?utf-8?B?ZWUzbVBrVVozSFlSSmJVTDV6VnhtanVXNVMyaXkwTS9yNkFkZlFwNndEVEtx?=
 =?utf-8?B?bkRjenAzQnozR0hiWHd0bWoxZnlzeG82UzNyK0pHdU14RDFEYnFaUTkyb0dL?=
 =?utf-8?B?TDg2ZS95ZlBpL0Q3NHJvWk5pdEl5NGttanBVcGIxUUZFTkNqSEFVRm5hdDhu?=
 =?utf-8?B?RWhiaWNqczV0dVdSc0RWSTd0MVJ3azBXeGorU08rZ3RKN1dYY1hQMHlhWEd3?=
 =?utf-8?B?Vkc2YW5aMnNydW02V1hsQkJ1NXNLVy9iV04rcTJ0WEE5ZG0vOXZyMlQva2U5?=
 =?utf-8?B?RkV0bjlsY1d1c0JhWGlmNDBDem1WNmFNT25WUVNmR01EM095YkdiWFdTVVJN?=
 =?utf-8?B?VEtNTnNPYkhQSkV6ZFc2bkJDRzk1alVVMjB0V0hFSk80blFsZnY5emZybVJn?=
 =?utf-8?B?bTAzNVFLd0d2aWFZcVgzSEJFSEhRaVJPWk1MSzhnUW9PR2ZqUldnd0RwWlZR?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0814ECF7F103E2428C059469CC2C1DA2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e876fc4-be03-41dc-8d22-08dc1db8b04c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 15:17:04.8619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bKcZEURvI9IDlE9KXhnW4DJXJGvOq1mwYou0AGuOxJFuSFfC4UHDqW9et5d2GQ+8vDy7a3PuqjAxue+UvzJ0lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
X-OriginatorOrg: intel.com
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDI0LTAxLTI0IGF0IDIyOjUyIC0wODAwLCBmZWkueWFuZ0BpbnRlbC5jb20gd3Jv
dGU6DQo+IEZyb206IEZlaSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+DQo+IA0KPiBXaGlsZSBv
bmUgTUlfU1RPUkVfREFUQV9JTU0gY2FuIHRha2Ugbm8gbW9yZSB0aGFuIDB4MWZlIHF3b3JkcywN
Cj4gdGhlIHNpemUgb2YgdGhlIHBndGFibGUgY2FuIGJlIDUxMiBlbnRyaWVzLg0KPiANCg0KRml4
ZXMgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMv
MTE5Mw0KDQpUZXN0ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPg0KDQo+IEZpeGVzOiA0M2Q0ODM3OWM5MzkgKCJkcm0veGU6IGNvcnJlY3QgdGhlIGNh
bGN1bGF0aW9uIG9mIHJlbWFpbmluZyBzaXplIikNCj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcu
ZC5yb3BlckBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEZlaSBZYW5nIDxmZWkueWFuZ0Bp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYyB8IDMg
KystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gaW5kZXggN2FiZjE1NTQ2Y2VkLi45YWIwMDQ4
NzFmOWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiBAQCAtNzEsNiArNzEsNyBA
QCBzdHJ1Y3QgeGVfbWlncmF0ZSB7DQo+ICAjZGVmaW5lIE5VTV9LRVJORUxfUERFIDE3DQo+ICAj
ZGVmaW5lIE5VTV9QVF9TTE9UUyAzMg0KPiAgI2RlZmluZSBMRVZFTDBfUEFHRV9UQUJMRV9FTkNP
REVfU0laRSBTWl8yTQ0KPiArI2RlZmluZSBNQVhfTlVNX1BURSA1MTINCj4gIA0KPiAgLyoNCj4g
ICAqIEFsdGhvdWdoIE1JX1NUT1JFX0RBVEFfSU1NJ3MgImxlbmd0aCIgZmllbGQgaXMgMTAtYml0
cywgMHgzRkUgaXMgdGhlIGxhcmdlc3QNCj4gQEAgLTExMDcsNyArMTEwOCw3IEBAIHN0YXRpYyB2
b2lkIHdyaXRlX3BndGFibGUoc3RydWN0IHhlX3RpbGUgKnRpbGUsIHN0cnVjdCB4ZV9iYiAqYmIs
IHU2NCBwcGd0dF9vZnMsDQo+ICAJICogVGhpcyBzaG91bGRuJ3QgYmUgcG9zc2libGUgaW4gcHJh
Y3RpY2UuLiBtaWdodCBjaGFuZ2Ugd2hlbiAxNksNCj4gIAkgKiBwYWdlcyBhcmUgdXNlZC4gSGVu
Y2UgdGhlIGFzc2VydC4NCj4gIAkgKi8NCj4gLQl4ZV90aWxlX2Fzc2VydCh0aWxlLCB1cGRhdGUt
PnF3b3JkcyA8PSBNQVhfUFRFX1BFUl9TREkpOw0KPiArCXhlX3RpbGVfYXNzZXJ0KHRpbGUsIHVw
ZGF0ZS0+cXdvcmRzIDwgTUFYX05VTV9QVEUpOw0KPiAgCWlmICghcHBndHRfb2ZzKQ0KPiAgCQlw
cGd0dF9vZnMgPSB4ZV9taWdyYXRlX3ZyYW1fb2ZzKHRpbGVfdG9feGUodGlsZSksDQo+ICAJCQkJ
CQl4ZV9ib19hZGRyKHVwZGF0ZS0+cHRfYm8sIDAsDQoNCg==
