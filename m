Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA72C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 16:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24A710E2B8;
	Mon, 12 Jun 2023 16:57:51 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EBA10E2B8
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 16:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686589069; x=1718125069;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l4iDfwsZFOF+vy1mTlcp+mUQsoOxtzmwYSGiL7kdQSk=;
 b=RA2rCHZwlyxyT3xRwZWsaxz2H70Tn+WeqLuXT3pwo80YBJYzNtSvd8pz
 0F7WVi8JFDzT0Zten72pWni3E4Pk97lM3zZtr5tL+Q/pefxwEh7SLT2aZ
 0o1fSORj8JNf6IUTsnt8Rht/NG1m7XLsJZ80HUilrEhQqsd94PbVxKPou
 4Q6elhVW5fw/X4oaSRMB3D4x7bRSS+pn2LKMBJ7oP1BeiERh1B6t79Zu4
 rMI+0g+helAxzDAbtQ5Iv3xN5hC+FLN9kX1pdr27992Kio5Ai6s/fEekX
 bsAJb/QjAQ8Q5yn2zk6oZcZta22tbYZzCX8wKMx6pfi3Ox1SAxw5bjn2M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="421692438"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="421692438"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 09:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711299041"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="711299041"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 12 Jun 2023 09:57:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 09:57:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 09:57:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 09:57:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 09:57:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdAnAVmpSMQvaPdLxTNdDJRvPhLlUQDE81nIh+4Ch3dRXRY1AbY0qbSFkNDwMiFpc+KOJSGNWK6rqclS6oDBmE2MGvD8xIyKUyXAlpSD08hLyzqGP3gwvjpwqCpX78SpAx2XVxkz3YShRraSkqf0giNOftoMKXBLJD0Xyg7VK3q1Ss7g8Ih/1uASC5HctV8GeJp1zYGkW/QA82XMPz0dv4xG7XiF0OudSSs9lmRwPh99EzemJiKaFssRVS+GrGm878Cex1tJVcs+WrOrxgVUg7dDO7bzrvTXX8WlTXV86cObHNncxAt3jWWM2L5xheZ7DDEcGqhvXY3rWX+lwxbwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4iDfwsZFOF+vy1mTlcp+mUQsoOxtzmwYSGiL7kdQSk=;
 b=nu3hPD//Uuz0wXmMy96nYdL3NRHyvZKcyBIW2Atgpq4FP/7KmIQmYIgpWGYN9CxZ7TbT3rxT6tn4STmI87gJSpxNQH27UZaHJ+eMf4Qv9Y5QPvpFCZ5DXL5iimpfUpoNUN/Ors9fYFGDxlwOAnJNxJu0h3c6wRGZKaFI5RApPYzSMIpUm2zbZXVVtvT3tUqq8vUmhorRKC6jtv5jHAwr8ueXhObJj0tz2EKQBzeCYbklMadd9zYhv7WLjm7+0PUAv5rEXj6YsFDm9Xv7UZdDoVvOH66wFKrXIGulnabK59jBlmI9o4DhxjQoyqJlPEqFpodZC84lmrjb0Bk6H4EOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 16:57:42 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::2728:b097:ff42:bd19%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 16:57:42 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size calculation
Thread-Index: AQHZmwMkE9ZwbW5bG0OfpoIpw7ynha+HM9YAgAAUkgCAAA5IgIAAEMqQ
Date: Mon, 12 Jun 2023 16:57:42 +0000
Message-ID: <IA1PR11MB6418697D9D67C3DCB7D8FCA0C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230609185249.2032370-1-aravind.iddamsetty@intel.com>
 <20230609185249.2032370-2-aravind.iddamsetty@intel.com>
 <IA1PR11MB6418E0AF6621EE62DF042E06C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
 <bfa7f6cd-3cca-7c3f-413b-25f8c50b41dc@intel.com>
 <bbedf796-f393-5da6-ee5d-9d476aaf5225@intel.com>
In-Reply-To: <bbedf796-f393-5da6-ee5d-9d476aaf5225@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CYYPR11MB8405:EE_
x-ms-office365-filtering-correlation-id: 2fd519d8-096c-4bdf-7925-08db6b66231e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o2Xorw3HApMOvRwNvhttG8S8OiTMm5hkTozyV1DaLzcMkRo7AgWijYyxS5RMXRaGx5yRxxGmsiQOPhmd9XreFPkGhw2R9pKSjsXsyfyQJxdHMElpBbIwNtjKnPFzMhgOybT1xw5dkQPSz8bQqudeNK4J51pC9RGiPUFCv1QelhGbQQHx75z39WInMwFiX5tBnKA+mQpeEthfJIVoe72AS0zjRTLm8I8qAgCJB59FYJ846OG6CUEkYwJQCmyIPp9OoLRe0XFHrzuV9Fk9MjO48BKfQLB0VcN+tLA/7jyL0cpJWQvoe/JucfB2BN8sfuFOYAxOjcv1qldyZlpbOTifzVpgRojQ5x2LGJcfr3AMQRl7ci168MSG9bzQ/RuSsrGWMkYCso32Jbw7ZqIuBFBqb2tDSsbZeIA37T+YQnAG/ApCV74sxJyM1HPUcIsQgFY7GyZe4rbxIfDfmpeli9dIhceQyjYpoXJB71rroer1/1qVUf8XuP0no0FblNcX08VmtMTZetshekgupa0Cy4VghRIEhAcx+UYfF9Cs0M47YyKQW8NqSjCoje5OMR8mMqbi64qss5KrjvrRMqM8qDX3UPrh+6BqJpMwmsx6LVkuxsZzspPvIigL+BC7yGhGzA91
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199021)(5660300002)(33656002)(2906002)(38070700005)(86362001)(52536014)(71200400001)(82960400001)(55016003)(83380400001)(9686003)(53546011)(7696005)(107886003)(6506007)(26005)(316002)(478600001)(110136005)(64756008)(4326008)(76116006)(38100700002)(66946007)(66476007)(122000001)(8936002)(66556008)(41300700001)(66446008)(186003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjY1eklMaGI2dkJQdjNRV0RWckdQV1JRYk84SmtqY2xleHA4RzRLbDhUWXoz?=
 =?utf-8?B?RDNURFFaK0ZyeXNNNmdBY0loN2w4R1VQbHk4MGdtM1dOSHl1bzkyOWdPT0Fw?=
 =?utf-8?B?d0ZDdXRLS2RWTC9MUG5Uay9pS3pvNngzY2hJQUtnNnRsejJGdVQ1aG5Gbzgv?=
 =?utf-8?B?dkJKUndKOGp4di9udWExelpJb1l5aTljejA0cTBYenlDVTVHWldqa3d0TnR5?=
 =?utf-8?B?VmxCcndvVzMrY2dkbmlodW0wNHJEdy9GbG1uTFIxay9SVnNGaU9BcUFHcVJi?=
 =?utf-8?B?Zm9tYjhuRG1keTB1QTVBaHdCL1EzTkM3ODhUOElFRms5em1nMUhiZm9WelVQ?=
 =?utf-8?B?cUR0TjMwbk5sdDQ2WjBsZDJ2dDRaSEt3TTBOcHJsRTdHRmJXT3RueUlNR080?=
 =?utf-8?B?c1F5YWxTb285ampvZWJyU205MSsxYUJDOHcvVVJGRVUyNmo0dm1nS2dTcGZ1?=
 =?utf-8?B?elFBWUxsejUxa0tTdjV5NXNlR1dERnVSVUdhUy9mWHRaczI1cGNCdUUvRDRz?=
 =?utf-8?B?UU1kdVY3Lzl3bjR3aktOTDg3cHB5MEVNNmhVaGl0NFNzVVIxTnFBcVl0Um9y?=
 =?utf-8?B?aVpzajZGL2toS2JscDFVQnRBTVJSdTdNODZLZmd5UmpoSU1XMVBQYTJEMnZ1?=
 =?utf-8?B?V3U4VVN6Ymp6dFl0ZCtESjhQSGFSZjJpN0M2RXJBSGZDOVlCaEE5UEVjWk54?=
 =?utf-8?B?SUVBQVZrOWdaT09XZG5Sck9qYlNxSDdFRUhUS2pWM25IVVhOUk5GYXhET1Z6?=
 =?utf-8?B?a3U0VytWZWNGQUJ1UnFudW45dnhJdi9VRkRidFVINlhzeGswSHkraTNSdC9s?=
 =?utf-8?B?VDFtTFVrZm12akNqTU1vNFFsU29jdEVCNUNXS1NVdmRHSzZVQ1hueHBxS2RV?=
 =?utf-8?B?cGthVzdTL3VuOXQvRFc3UmxSaEdxYTBwOU0zU3hkOTluQStzVjBMcEJvcHlp?=
 =?utf-8?B?aVZVOXBTNFg1RFJpU24yNWVtK0JGRUlXdjg5MHJMRUpjQm5VNE9kSk9scmp0?=
 =?utf-8?B?dmxnZjhleC80REYzNWg3MDZMZkhTei9XNkF4bHU4Q0pIQU1QOFVjR1dGdHZO?=
 =?utf-8?B?UmJoVzIvaDJZalJnT242clBvOHlQY1hZMjY2K21BMkVtSExhT3lFYUlOZVAy?=
 =?utf-8?B?SXczcU1CZWhIb2hGR3lsd0VzdUtpUzZNanFxc0E3dUxFYXFEWHlGYkhra0V1?=
 =?utf-8?B?NTRKM2V4UVdYQXJMTUh2bzdpRFpYVmw2UnFzVDh1aDQybkMwUUtkN09kSGYw?=
 =?utf-8?B?SkRObmgxTGZCUStGM3o2VytZTUpWRVhjSFJmN2lKZVhMYmNDckRPUWczMVhT?=
 =?utf-8?B?ZjNNTnYvWmFaN2g4MzgwNjJaN1oxODlERXVzdWFtUm5zV1RXbUFqT1U2VmVo?=
 =?utf-8?B?Y3VGcExPWGdpYkVSeFNqekk2M1p0aHBFU2FodWpySDBZWnNyb0gzcGgvZUN6?=
 =?utf-8?B?WXJMRWRMZm5HVWJuVU1aQmhNVkoycGU1MytyNFNTYkg1TEFlZGJhdDJHVUhl?=
 =?utf-8?B?cmR4UEt2eHlRbSs3dGpNMmxBWGhRM2Y0c0VGN2ZJZkdVbE5KOXhGRjJhTlQ2?=
 =?utf-8?B?aHBsRjZNN3I3ejVha2R3TWkwUUNjelRrUXZROXVQLzNTeFZ6RFpNWkNpS2pC?=
 =?utf-8?B?MmkxaTVYM0IzTmN5TVBUMkpFWHExbDZyRjBiK1dmTXJxWlhnTXZPbUpLTGxr?=
 =?utf-8?B?ZEVIdktDTDh2d2pVNVYwU28vcVNEM04rTU9JYWIrZnc5cnJQU3NQVmZFVDZz?=
 =?utf-8?B?K1UrcWNYQTBGLzlEVmlBeFdHK2pkMGZyVUM5bUtEZXpvZEM4OVNINC8vOWxE?=
 =?utf-8?B?dTV5akV3Y3VwK2FJK2crb0paVnNJSzh2cnpEZ3VIM3FsY21MVGU3RkttR0RX?=
 =?utf-8?B?NGlWRFdSa095NkZuR2Z3cHdrU1RLK0ZJcE5iZ2R1NzEya3UvL20rZHVwNXpx?=
 =?utf-8?B?eDhPa2N6RUNHMlpUQlJKaXFIMVd2Lzg2S0lsaFNzMVJvZGIxQTVkS2l6Tzg3?=
 =?utf-8?B?MVRYR2JoWnlzSzk0VE9rVFBUWHN0YXZaQ25UTkJMajhrWStVdHRTMVEvVlkr?=
 =?utf-8?B?aElES1FMRGtVNXRDc1dkOGVmYlY3a2ZmOStEV2xSeTR0T3JkK1VBMWx3Qllr?=
 =?utf-8?Q?spHqvDlLpNWXzIYrJTrAh0tk2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd519d8-096c-4bdf-7925-08db6b66231e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 16:57:42.2888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8cBPKIgyWKGSm1ZMCPCZFQZVn1GmZ1s4VazDgiXmy2/uTZVycSFFVaJTtXEhP5jicIEmdHzXtgn+w9Umd/jiQZPrurQLDUzbW/0XgskVgFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8405
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Fix stolen memory size
 calculation
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQXVsZCwgTWF0dGhldyA8bWF0dGhl
dy5hdWxkQGludGVsLmNvbT4NCj5TZW50OiBNb25kYXksIEp1bmUgMTIsIDIwMjMgMTE6NTYgQU0N
Cj5UbzogSWRkYW1zZXR0eSwgQXJhdmluZCA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT47
IFJ1aGwsIE1pY2hhZWwgSg0KPjxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+OyBpbnRlbC14ZUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj5DYzogUm9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJv
cGVyQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW0ludGVsLXhlXSBbUEFUQ0ggMS8xXSBkcm0v
eGU6IEZpeCBzdG9sZW4gbWVtb3J5IHNpemUgY2FsY3VsYXRpb24NCj4NCj5PbiAxMi8wNi8yMDIz
IDE2OjA0LCBJZGRhbXNldHR5LCBBcmF2aW5kIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAxMi0wNi0y
MDIzIDE5OjU5LCBSdWhsLCBNaWNoYWVsIEogd3JvdGU6DQo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+Pj4+IEZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Pj4+IEFyYXZpbmQgSWRkYW1zZXR0eQ0KPj4+
PiBTZW50OiBGcmlkYXksIEp1bmUgOSwgMjAyMyAyOjUzIFBNDQo+Pj4+IFRvOiBpbnRlbC14ZUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcu
ZC5yb3BlckBpbnRlbC5jb20+DQo+Pj4+IFN1YmplY3Q6IFtJbnRlbC14ZV0gW1BBVENIIDEvMV0g
ZHJtL3hlOiBGaXggc3RvbGVuIG1lbW9yeSBzaXplDQo+Y2FsY3VsYXRpb24NCj4+Pj4NCj4+Pj4g
VGhlIHN0b2xlbiBtZW1vcnkgYmFzZSBzaG91bGQgYmUgZGVyaXZlZCBmcm9tIEdTTUJBU0Ugb3IN
Cj4+Pj4gRkxBVF9DQ1NfQkFTRV9BRERSIHdoZW4gZmxhdCBjY3MgaXMgYXBwbGljYWJsZS4NCj4+
Pj4NCj4+Pj4gRml4ZXM6IGFjZjA2N2MyZjVhNSAoImRybS94ZTogSW1wbGVtZW50IHN0b2xlbiBt
ZW1vcnkuIikNCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQXJhdmluZCBJZGRhbXNldHR5IDxh
cmF2aW5kLmlkZGFtc2V0dHlAaW50ZWwuY29tPg0KPj4+PiAtLS0NCj4+Pj4gZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3R0bV9zdG9sZW5fbWdyLmMgfCA3ICsrKy0tLS0NCj4+Pj4gMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fc3RvbGVuX21nci5jDQo+Pj4+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3R0bV9zdG9sZW5fbWdyLmMNCj4+Pj4gaW5kZXggMjFlY2M3MzRmMTBh
Li4yOWNlNjliZjgyMDAgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90
dG1fc3RvbGVuX21nci5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fc3Rv
bGVuX21nci5jDQo+Pj4+IEBAIC01NCw3ICs1NCw2IEBAIGJvb2wgeGVfdHRtX3N0b2xlbl9jcHVf
YWNjZXNzX25lZWRzX2dndHQoc3RydWN0DQo+Pj4+IHhlX2RldmljZSAqeGUpDQo+Pj4+IHN0YXRp
YyBzNjQgZGV0ZWN0X2JhcjJfZGdmeChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0DQo+eGVf
dHRtX3N0b2xlbl9tZ3INCj4+Pj4gKm1ncikNCj4+Pj4gew0KPj4+PiAJc3RydWN0IHhlX3RpbGUg
KnRpbGUgPSB4ZV9kZXZpY2VfZ2V0X3Jvb3RfdGlsZSh4ZSk7DQo+Pj4+IC0Jc3RydWN0IHhlX2d0
ICptbWlvID0geGVfcm9vdF9tbWlvX2d0KHhlKTsNCj4+Pj4gCXN0cnVjdCBwY2lfZGV2ICpwZGV2
ID0gdG9fcGNpX2Rldih4ZS0+ZHJtLmRldik7DQo+Pj4+IAl1NjQgc3RvbGVuX3NpemU7DQo+Pj4+
IAl1NjQgdGlsZV9vZmZzZXQ7DQo+Pj4+IEBAIC02NiwxMiArNjUsMTIgQEAgc3RhdGljIHM2NCBk
ZXRlY3RfYmFyMl9kZ2Z4KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPj4+PiBzdHJ1Y3QgeGVfdHRt
X3N0b2xlbl9tZ3IgKm1ncikNCj4+Pj4gCQlyZXR1cm4gMDsNCj4+Pj4gCX0NCj4+Pj4NCj4+Pj4g
LQkvKiBVc2UgRFNNIGJhc2UgYWRkcmVzcyBpbnN0ZWFkIGZvciBzdG9sZW4gbWVtb3J5ICovDQo+
Pj4+IC0JbWdyLT5zdG9sZW5fYmFzZSA9ICh4ZV9tbWlvX3JlYWQ2NChtbWlvLCBEU01CQVNFKSAm
DQo+PkJEU01fTUFTSykgLSB0aWxlX29mZnNldDsNCj4+Pj4gKwkvKiBzdG9sZW4gYmFzZSBzaG91
bGQgYmUgYXQgZW5kIG9mIHVzYWJsZSB2cmFtICovDQo+Pj4+ICsJbWdyLT5zdG9sZW5fYmFzZSA9
IHZyYW1fc2l6ZTsNCj4+Pg0KPj4+IEhpIEFydmluZCwNCj4+Pg0KPj4+IFRoZSBzdG9sZW4gbWVt
b3J5IGluIGk5MTUgaXMgbm90IGNhbGN1bGF0ZWQgbGlrZSB0aGlzLiAgSXQgdXNlcyB0aGUgRFNN
QkFTRQ0KPmZvciB0aGUgb2Zmc2V0IGxpa2UgdGhlDQo+Pj4gY3VycmVudCBjb2RlLg0KPj4+DQo+
Pj4gVGhlIGxtZW0gc2l6ZSBpbmNsdWRlcyB0aGUgQ1NTIHNpemluZywgYnV0IHRoYXQgaXMgZm9y
IHRoZSBMTUVNIG1lbW9yeQ0KPnJlZ2lvbi4NCj4+Pg0KPj4+IFRoaXMgaXMgY2FsY3VsYXRpbmcg
YW5kIGNyZWF0aW5nIHRoZSAic3RvbGVuIiByZWdpb24gZm9yIHVzZSBpbiBrZXJuZWwgc3BhY2Uu
DQo+SWYgdGhlIG9mZnNldCBpbmNsdWRlcyB0aGUgQ1NTIHNwYWNlLA0KPj4+IHdvbid0IHRoZSBE
U00gdXNhZ2UgYmUgaW4gdGhlIHdyb25nIHBsYWNlPw0KPj4NCj4+IEkgZGlkbid0IHJlYWxpemUg
dW50aWwgeW91IG1lbnRpb25lZCBoZXJlIHdlIHdhbnRlZCB0byBjYXJ2ZSBvdXQgdXNhYmxlDQo+
PiBzdG9sZW4gaW4gd2hpY2ggY2FzZSB3aGF0IEkgZGlkIGlzIHdyb25nLCBtYWtlcyBzZW5zZS4N
Cj4+DQo+PiBidXQgd2h5IGlzIHRoYXQgd2UgYXJlIGRvaW5nIG9ubHkgb24gcm9vdCB0aWxlIGV2
ZW4gcmVtb3RlIHRpbGUgaGFzDQo+PiBzdG9sZW4gYXJlYSByaWdodD8NCj4NCj5JIHRoaW5rIHRo
ZSBtYWluIHJlYXNvbiBpcyBiZWNhdXNlIHRoZXJlIGlzIG5vIHVzZXIgaW4gdGhlIGRyaXZlciBm
b3IgaXQNCj5vdXRzaWRlIG9mIGRpc3BsYXkgc3R1ZmYsIGFuZCBkaXNwbGF5IG9ubHkgY2FyZXMg
YWJvdXQgcm9vdCB0aWxlIGF0bS4gSWYNCj53ZSBjYW4gYWN0aXZlbHkgdXRpbGlzZSBpdCBvdXRz
aWRlIG9mIGRpc3BsYXkgKGxpa2Ugc29tZSBwZXIgdGlsZQ0KPnJlc291cmNlIG5lZWRlZCBieSB0
aGUgZHJpdmVyKSB0aGVuIG1heWJlIGl0IG1ha2VzIHNlbnNlIHRvIHByb2JlIGl0IGZvcg0KPmFs
bCB0aWxlcywgYXNzdW1pbmcgaXQncyBzdGlsbCBwcmVzZW50IG9uIHN1Y2ggcGxhdGZvcm1zLg0K
DQpJIGRpZCBtb3ZlIHRoaXMgZnJvbSB0aGUgeGUgZGV2aWNlIHRvIHRoZSBndCAodGlsZT8pIGRl
dmljZSB3aXRoIG11bHRpLXRpbGUgaW4gbWluZCwgYnV0DQpiZWNhdXNlIG9mIHRoZSBhYm92ZSBj
b21tZW50cywgSSBkaWQgbm90IHVwZGF0ZSB0byBkbyB0aGUgY2FsY3VsYXRpb24gZm9yIGFsbCB0
aWxlcy4NCg0KTWlrZQ0KDQoNCj4+DQo+PiBUaGFua3MsDQo+PiBBcmF2aW5kLg0KPj4+DQo+Pj4+
IAlpZiAoZHJtX1dBUk5fT04oJnhlLT5kcm0sIHRpbGVfc2l6ZSA8IG1nci0+c3RvbGVuX2Jhc2Up
KQ0KPj4+PiAJCXJldHVybiAwOw0KPj4+Pg0KPj4+PiAtCXN0b2xlbl9zaXplID0gdGlsZV9zaXpl
IC0gbWdyLT5zdG9sZW5fYmFzZTsNCj4+Pj4gKwlzdG9sZW5fc2l6ZSA9IHRpbGVfc2l6ZSAtIHZy
YW1fc2l6ZTsNCj4+Pg0KPj4+IFRoZSB0aWxlIHNpemUgd2FzIHBpY2tlZCB0byB3b3JrIHdpdGgg
ZGV2aWNlcyB0aGF0IGRvIG5vdCBoYXZlIHRpbGUNCj5pbmZvcm1hdGlvbiAocGNpX3Jlc291cmNl
IF9sZW4gdXNlZCkuICB2cmFtX3NpemUNCj4+PiBjYW4gYmUgd3JvbmcgaW4gdGhvc2UgaW5zdGFu
Y2VzLg0KPj4+DQo+Pj4gTXkgb3JpZ2luYWwgcGF0Y2ggc2V0IHVzZWQgdGhlIHZyYW1fc2l6ZSwg
YnV0IHRoYXQgd2FzIG5vdCBhY2N1cmF0ZSBmb3IgdGhpcw0KPnVzYWdlLg0KPj4+DQo+Pj4gQXJl
IHlvdSBzZWVpbmcgYW4gaXNzdWUgd2l0aCB0aGUgY3VycmVudCBjb2RlPw0KPj4+DQo+Pj4gVGhh
bmtzDQo+Pj4NCj4+PiBNaWtlDQo+Pj4NCj4+Pj4gCS8qIFZlcmlmeSB1c2FnZSBmaXRzIGluIHRo
ZSBhY3R1YWwgcmVzb3VyY2UgYXZhaWxhYmxlICovDQo+Pj4+IAlpZiAobWdyLT5zdG9sZW5fYmFz
ZSArIHN0b2xlbl9zaXplIDw9IHBjaV9yZXNvdXJjZV9sZW4ocGRldiwNCj4+R0VOMTJfTE1FTV9C
QVIpKQ0KPj4+PiAtLQ0KPj4+PiAyLjI1LjENCj4+Pg0K
