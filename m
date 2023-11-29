Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C80C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 05:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3055F10E336;
	Wed, 29 Nov 2023 05:59:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB45910E336
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 05:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701237574; x=1732773574;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z4xGT3yfFSx56fjszS/yb6EHqeWkthtj4fVLnCXActY=;
 b=EekXgUGdYX1qWuwW/X/zvTrwLuQRJLAMzXqFAmEcYsyq3oMtopVxU75y
 ddYCaimG+Sg6cbMZRrEuSuA74v7j+A1SpZbjQ0kSxI7PNm2s42jQsH1VI
 tzL+iLtIV0AMLJD1eqpeF2VOBgg0fl4pqOPq7v2LpqoaCfHR+G0wbasOJ
 MQJELC1R3tI0cXFAof9FpTic0Wj5umlMfnmO/1AFaIgvKzV4k4uHd8ZIF
 Yb2BBc5UYaCxN2n74s9huJaGKiCwmJx361AEbGpvCZxCQWIsQaGjWjN8Z
 R0S3JiyD3g2Er6iWVWvqh1u6JvpvNSmd67DLeWfwDlTd+H4BCOWjjxsqT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372472662"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="372472662"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 21:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="16906013"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 21:59:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 21:59:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 21:59:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 21:59:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 21:59:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9IZx54tMh9ta+tIHNhosqX9G/O0sViUymaIJeOZXFAYsFPQXcV7Jhs70znSV/UScL0+bASYXfh3rbDKVpYzIlloQi1ZXyZnnBuarzmsy8z3/2N9cnlRCvB/khsqbSh3l9CImvrPhpnPSfuQRfFaVlM+WKnqPNomlY/6WVAFYvXC8HG9Lj2ifH3rEJSPGb1qxOaqQaZLxBecsMg89jdr5rMWKQ7cMArNaTQE9v6YofYTEfUnsWw37BEPB4f5tkW3Q7j8EspMgEjyNzUERAUELIjxbq1OHyGKW0HS3oL46tHo6lpbJHUESmRPDl9lTY81LP+1vCONFooxoWH1iqrH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4xGT3yfFSx56fjszS/yb6EHqeWkthtj4fVLnCXActY=;
 b=BApX+KJz53FocWMcnBeA7Xg8WSC/rvTYSpDhK/nM9MZYde+cZbTpaYQoeXFfU7zgRP5G2o06Bu+P6Wlv00wDDKjRXp9x1USLZXRLP/p9NCRV6uXV1Sp6ICphwG2HG5FddoQtuUN941ixmnir7c+/H4dUtTs3/wKypbB8uGuDFJJ5nhmdNABVeHseAckM90ikLZwc5bUmyeiILZqjTDBMBAeHWtpwY5snmgnsiVPxXjOUpqL2FS9hsRW9WhHsX4gq7DqUgtYvgF1+U7YVAxtTrBsIOqBvWhbDHA66JtIFHbN9ecBHJk4Jz6+Bh/7AFcEezT667BveTyqYvXvc69ek/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 05:59:30 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::a420:47f0:a9d2:ed2a]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::a420:47f0:a9d2:ed2a%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 05:59:29 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/1] drm/xe: explicitly set GGTT access for
 GuC DMA
Thread-Index: AQHaHYSdf2clDlxcgkWjp2E2BsRkqrCOj40AgAAZd4CAAixJsA==
Date: Wed, 29 Nov 2023 05:59:29 +0000
Message-ID: <BYAPR11MB2567D4E758801174BCF0904B9A83A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20231122204501.1353325-1-fei.yang@intel.com>
 <20231122204501.1353325-2-fei.yang@intel.com>
 <ymi5rgc3ba562kxellzosdndtlo23wwlsz75rrafxg6qfevmc4@owfjmqn5tesj>
 <2144662b-4c97-4101-b6fd-cb092b7713d4@intel.com>
In-Reply-To: <2144662b-4c97-4101-b6fd-cb092b7713d4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|DS7PR11MB6102:EE_
x-ms-office365-filtering-correlation-id: cd9c693d-ad31-4381-a735-08dbf0a05a00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rl6NLCmzTjZnUDcgfcXZSbgDTVs90iYlChEAyyc/PxUg5FhEZ36BlZ+Xk5glLvsZ+YoMD9H2UFSmqATp8FJgoKDD3pEnXhN2ZfPMsEoohi+UhibL1kwXKFSZ4Q0hEe5GUitGvxhOR9BW8QzuFfseaZEqaxdt330vOpHHq59DmnZ8givjCjybR7DnQTIy8fX6UBYprK6KIV/LaEmU2oyJZCu9QlwUs5931NfCPBI4FY/LbMuDrHMohY0+rwK0dr8unsnkeQPkid2F6afWa8CwTCFwbF5REC+JCHGtR/KKECwn38dXQcYgP7pigMUD+kLafmLiI87+A9b/ZbTH/IjEPd84kUBuqLd01j/e22rcoRQSRMUFkIjbNWtVAAGA7VlaVfdbBTT5hY0ghDt9uWIHOD/Y3L8dhE2KzygW8F7y4ODh31UVNAcqlIDe/bKT01YSRTgBR0VKYOUjoYLFJ3PCzzH3B30vlsKeSyVu1KkUSnikUEQwG95pIDDB/PAL6IDwZwhmDkoTLsg98SbS3yHOIyCXGKxnRGSieKYYyj/dLTN0Pxq8vQMrwOrMbSlRZV+TrIHdwTfmlIZHLBaJ37s40qQhuoLbr/IegZfS54BSwp2SDt3Kgomh6t9cMtAKEFqtiq6MJBUSO1qf2HE1OICdPGIsgUAOXCpTZIZpQsHAWsQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(230173577357003)(230273577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38070700009)(55016003)(5660300002)(86362001)(33656002)(122000001)(41300700001)(53546011)(82960400001)(9686003)(71200400001)(107886003)(38100700002)(6506007)(7696005)(83380400001)(26005)(2906002)(110136005)(66476007)(478600001)(52536014)(54906003)(6636002)(66556008)(64756008)(66446008)(4326008)(8676002)(76116006)(8936002)(66946007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TSthMUkxYTMvdFEvSXp0ZUY5MzNZUGVQMEI3VVI2NkV2ZG8xdTc1enlXNlJr?=
 =?utf-8?B?SHN6WHFqKzArb0JmNjVQa0FkaEU1WE15dTJFbFhISkI1L3I3dGE3Qk5pV2RV?=
 =?utf-8?B?bzJWamdwTThWUmhHa0FkdXd1SkpDYlF0Y3JlengwRkZvYnNMYjRRRnl1RU9T?=
 =?utf-8?B?U0REVzZXUENyZUE1bFVRSU5OQjBTQjVBazhGR21mMjUrMVB0dVpXQllKMGEw?=
 =?utf-8?B?bG80OVRXVi9xemtZUzloa2hpcU1pWlpKVWtKaUpYMHErK2UwOS8yRGRQU3VT?=
 =?utf-8?B?Qm1GNzRGaXZQWjU1ZXFFaVFSajBTbnVWSjFaQVpnQXpjNitJdWlCblJrdVA5?=
 =?utf-8?B?SWRqTGxHUExBRFVvR0wxSUVZNy8ybnl4TVduelY0c1VWS3lyVFIvVXd3SXJO?=
 =?utf-8?B?b0FwWmFmb2VPRnN6TTVTaWFiOWZWMlFtalA4Ylh1N2FDaXMyQnhWbjFrRWc5?=
 =?utf-8?B?VE80dEx6TFNlb3FDUitJdnZaZWRESlJSdHZoVTVkalhNV09oQ2h3Wk5GN01j?=
 =?utf-8?B?K1BkaWExZWZybGNQeURtQ3BXQzNjUDFDbk9XZ2JmWFh2NmJOaU5tOTN6bU1z?=
 =?utf-8?B?Q1luMll0RUhld3dVUEpzU0JQUzJVSmNITXo1T3FsZi9POWJQek0zRlJoMVdv?=
 =?utf-8?B?azV6YXFvM2RkbXkwTUZMSEswOGs3aXg2ZTdrT2NHa3hkOGR3ZTI0clU5bmJ3?=
 =?utf-8?B?OG14S0E0WkxybkdkK3AxaExwOUx3WmQrWjdwMDF4U1dLK2dvUUtFVHlmdVdk?=
 =?utf-8?B?ajlKaUVTRWgrdVVGc0NWVW9DUEhvMVVzNzE5ZGEwclluaGVJcnJ1WTJKUmhx?=
 =?utf-8?B?bTFyMlJqY2ZpaWpZR0JKNjBPZ3hUaWoxMnkwcXVDRVQ2MzlObk5oeTJrTExH?=
 =?utf-8?B?VWFOMzlYYXlQL29iMExPQU0relRmdk4zUUtpUEFmMWxkVlh0V3BqK09jRWs0?=
 =?utf-8?B?UVlQNmMrVFZDR1VCejVwbG1sa0thTTRtc2YwK0oxb0xrcXBieDhuc1ZkU1JF?=
 =?utf-8?B?a1ZTaEtFbFR1Z01ob25Udzc0YmpRRHM5ZmJXSld6a1IwYkRvYWExbE5EMEhx?=
 =?utf-8?B?aUNqYldJREY4VWZjNlpydEZ2T25lUWR1NWFrV2ZGdEJwQWUySEZXdmgzSk1G?=
 =?utf-8?B?MUFsazlaMFVSWmhkY0cvUUVWaE1ETTFGaEhkOWs0UUZja2ZZWkxaK01WYUVU?=
 =?utf-8?B?ZUFsSW1uOVh1WGxaVGV5Q2loZllEbkZxc0o3WXRkSEtsUVV4NnRLUC9JSlBC?=
 =?utf-8?B?eXdkL0dFc1dUUVhNd1huTGJuNVRiZlJhTmpqTVZIc3BXVFFybUhPdkNyQm9x?=
 =?utf-8?B?T3JDaEwrTGV3d2dXU3RtTjZ6SkJYZ1luNnZ3NGI4bHFrcXlQRnVCSWt4eGp2?=
 =?utf-8?B?NmxTZ2pOSTlpUG9LaG1wQ0trb3ZhRjVZTjJNR08yK2FJQy9oVzY2eURqMGVV?=
 =?utf-8?B?U29vYjUzTVpBRjJLYWNuKzdBbmZhTGpwWnVPU2ZCMGVuY2VyOTZNdXZpVkJW?=
 =?utf-8?B?dWtjcHRYRnpJWkY2OWhyNFNrVEt5elk4Z1duZW53K0hDRnVzaWJqQXFwWThr?=
 =?utf-8?B?dVRYOHdib0t4WUl6MW8rNXdUN2RUaVpRSVVUUkZtNU5TRnovMUVvYnlzcEpP?=
 =?utf-8?B?ZXE3QXcwaHRyUzlzVHpqUzhxRWNjLyszbFd0blhiSk8vK2FvNTRNcjNtN0Rq?=
 =?utf-8?B?OE5EVmJXV0E2UnNXQVFzYVNBM1ZlRHpQWTNsWS9LSEpFVFFjajFDS3RyQnY0?=
 =?utf-8?B?T2hkTWdtWjdLNjdud2lYSnloMXJKOVNCVmJyZ1lKdkFuTldNc3lSejdFanZj?=
 =?utf-8?B?d1drQkhCWEovV0JOeTZHc0pnMCt3MjBvUmxjSUk4VlJ2SkZnUUh1aHZrKzVO?=
 =?utf-8?B?Qnd1aVRqNU40NnVuSmtQTUNPb294emZtK2VVUTFhUVVDdWx2bWt5bVVvM1ZC?=
 =?utf-8?B?NFdFYXBuVGpXOW1Ea2NJM3pXcHduUHBUUndFdjcwT0hDTWJrcnRpSDluSno3?=
 =?utf-8?B?WFBZNFo1akdDSmwrSGMwS3lSUG5YRXlKSE54VUw1Q005eCs4eVRLWFhWM1lo?=
 =?utf-8?B?cGRTNVpYdWhFeWVGRG1UcTVFcXBlTDJ5NUh0d05ZakdiMjJXcUYzQWtxa3dU?=
 =?utf-8?Q?Ua8s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9c693d-ad31-4381-a735-08dbf0a05a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 05:59:29.7932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b00rjqNVN+3WpYxXMNe0H1mYS9nPNYeJ6fSd+cGR5m9U+j4Vd2D1f1G5uEF2tb3y7qw7hnUDAVdae6/0xmH1XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: explicitly set GGTT access for
 GuC DMA
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PiBPbiAxMS8yNy8yMDIzIDExOjA5IEFNLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+PiBPbiBX
ZWQsIE5vdiAyMiwgMjAyMyBhdCAxMjo0NTowMVBNIC0wODAwLCBmZWkueWFuZ0BpbnRlbC5jb20g
d3JvdGU6DQo+Pj4gRnJvbTogRmVpIFlhbmcgPGZlaS55YW5nQGludGVsLmNvbT4NCj4+Pg0KPj4+
IENvbmZpcm1lZCB3aXRoIGhhcmR3YXJlIHRoYXQgc2V0dGluZyBHR1RUIG1lbW9yeSBhY2Nlc3Mg
Zm9yIEd1Qw0KPj4+IGZpcm13YXJlIGxvYWRpbmcgaXMgY29ycmVjdCBmb3IgYWxsIHBsYXRmb3Jt
cyBhbmQgcmVxdWlyZWQgZm9yIG5ldw0KPj4+IHBsYXRmb3JtcyBnb2luZyBmb3J3YXJkLg0KPj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogRmVpIFlhbmcgPGZlaS55YW5nQGludGVsLmNvbT4NCj4+PiAt
LS0NCj4+PiBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndWNfcmVncy5oIHwgMSArDQo+Pj4g
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMgICAgICAgICB8IDMgKystDQo+Pj4gMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndWNfcmVncy5oDQo+Pj4gYi9kcml2
ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndWNfcmVncy5oDQo+Pj4gaW5kZXggYmEzNzVmYzUxYTg3
Li45MjMyMGJiYzlkM2QgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3Mv
eGVfZ3VjX3JlZ3MuaA0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d1Y19y
ZWdzLmgNCj4+PiBAQCAtNzAsNiArNzAsNyBAQA0KPj4+ICNkZWZpbmUgRE1BX0FERFJfMV9ISUdI
ICAgICAgICAgICAgICAgIFhFX1JFRygweGMzMGMpICNkZWZpbmUNCj4+PiBETUFfQUREUl9TUEFD
RV9NQVNLICAgICAgICAgICAgUkVHX0dFTk1BU0soMjAsIDE2KSAjZGVmaW5lDQo+Pj4gRE1BX0FE
RFJFU1NfU1BBQ0VfV09QQ00gUkVHX0ZJRUxEX1BSRVAoRE1BX0FERFJfU1BBQ0VfTUFTSywgNykN
Cj4+PiArI2RlZmluZSAgIERNQV9BRERSRVNTX1NQQUNFX0dHVFQgUkVHX0ZJRUxEX1BSRVAoRE1B
X0FERFJfU1BBQ0VfTUFTSywNCj4+PiArOCkNCj4+PiAjZGVmaW5lIERNQV9DT1BZX1NJWkUgICAg
ICAgICAgICAgICAgWEVfUkVHKDB4YzMxMCkgI2RlZmluZSBETUFfQ1RSTA0KPj4+IFhFX1JFRygw
eGMzMTQpICNkZWZpbmUgICBIVUNfVUtFUk5FTCAgICAgICAgICAgICAgICBSRUdfQklUKDkpIGRp
ZmYNCj4+PiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3VjX2Z3LmMNCj4+PiBpbmRleCAzMDMyYzRmMTQ4ZDQuLjQzOGNlNTFkZDM3
MyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYw0KPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jDQo+Pj4gQEAgLTYyOSw3ICs2MjksOCBA
QCBzdGF0aWMgaW50IHVjX2Z3X3hmZXIoc3RydWN0IHhlX3VjX2Z3ICp1Y19mdywgdTMyDQo+Pj4g
b2Zmc2V0LCB1MzIgZG1hX2ZsYWdzKQ0KPj4+ICAgICAvKiBTZXQgdGhlIHNvdXJjZSBhZGRyZXNz
IGZvciB0aGUgdUNvZGUgKi8NCj4+PiAgICAgc3JjX29mZnNldCA9IHVjX2Z3X2dndHRfb2Zmc2V0
KHVjX2Z3KSArIHVjX2Z3LT5jc3Nfb2Zmc2V0Ow0KPj4+ICAgICB4ZV9tbWlvX3dyaXRlMzIoZ3Qs
IERNQV9BRERSXzBfTE9XLCBsb3dlcl8zMl9iaXRzKHNyY19vZmZzZXQpKTsNCj4+PiAtICAgIHhl
X21taW9fd3JpdGUzMihndCwgRE1BX0FERFJfMF9ISUdILCB1cHBlcl8zMl9iaXRzKHNyY19vZmZz
ZXQpKTsNCj4+DQo+PiBub3QgdGhhdCB0aGlzIHBhdGNoIGNoYW5nZXMgYW55dGhpbmcgYnV0IHRo
aXMgdXBwZXJfMzJfYml0cygpIGlzIGENCj4+IGNvZGUgc21lbGwuIElmIHVjX2Z3X2dndHRfb2Zm
c2V0KCkgY2FuIG9ubHkgcmV0dXJuIHUzMiwgd2h5IGV4YWN0bHkgd2UNCj4+IHdvdWxkIHRyeSB0
byBnZXQgdGhlIHVwcGVyIDMyIGJpdHMgKGFuZCBzdXBwcmVzcyB0aGUgd2FybmluZyBieSBkb2lu
Zw0KPj4gMnggPj4gMTY/KS4gSHVtbi4uLiBjb21taXQgZWUyZGVlODFlNDg0ICgiZHJtL3hlL2h1
YzogRXh0cmFjdCB2ZXJzaW9uDQo+PiBhbmQgYmluYXJ5IG9mZnNldCBmcm9tIG5ldyBIdUMgaGVh
ZGVycyIpIGV4dHJhY3RlZCBjc3Nfb2Zmc2V0IGFuZCBub3cNCj4+IHdlIGFyZSBhZGRpbmcgMiB1
MzIuIFNvIG1heWJlIGtlZXAgdGhlIHVwcGVyXzMyX2JpdHMoKSwgYnV0IG1vdmUNCj4+IHNyY19v
ZmZzZXQgdG8NCj4NCj4gVGhpcyBpcyBzdGlsbCBndWFyYW50ZWVkIHRvIGJlIGEgMzJiIG51bWJl
ciBldmVuIGFmdGVyIHRoZSBzdW0sIGJlY2F1c2UNCj4gd2UncmUgYWRkaW5nIGFuIG9mZnNldCB3
aXRoaW4gdGhlIEdHVFQtbWFwcGVkIG9iamVjdCBhbmQgdGhlcmVmb3JlIHRoZQ0KPiByZXN1bHRp
bmcgdmFsdWUgaXMgc3RpbGwgd2l0aGluIHRoZSAzMmIgYWRkcmVzcyBzcGFjZS4NCj4gQUZBSUNU
IHRoZSByZWFzb24gd2UgaGF2ZSB1cHBlcl8zMl9iaXRzKCkgY2FsbHMgaW4gc2V2ZXJhbCBwbGFj
ZXMgd2l0aA0KPiBHR1RUIG9mZnNldHMgaXMgYmVjYXVzZSBvZiBhIHF1aXJrIG9mIHRoZSBIVyBz
cGVjczogd2hlbiA0OGIgUFBHVFQgd2FzDQo+IGludHJvZHVjZWQgYmFjayBpbiBnZW44LCBhbGwg
YWRkcmVzcyBmaWVsZHMgaW4gR1QgSFcgKG5vdCBzdXJlIGFib3V0IHRoZQ0KPiBkaXNwbGF5IHNp
ZGUpIGhhdmUgYmVlbiB1cGRhdGVkIHRvIDQ4YiwgZXZlbiB0aGUgb25lcyB3aGVyZSB0aGUgYWRk
cmVzcw0KPiB3YXMgZ3VhcmFudGVlZCB0byBiZSBHR1RUIGFuZCB0aGVyZWZvcmUgMzJiLCBhbmQg
dGhlIHNwZWNzIGhhdmUgYmVlbg0KPiB1cGRhdGVkIHRvIGFsd2F5cyBzYXkgIndyaXRlIHRoZSB1
cHBlciAxNiBiaXRzIGluIHRoZSBIRFcgcmVnL2ZpZWxkIg0KPiBldmVuIGlmIHRoYXQgaXMgYWx3
YXlzIGd1YXJhbnRlZWQgdG8gYmUgMCBmb3IgR0dUVCBvZmZzZXRzLiBJJ20gZ3Vlc3NpbmcNCj4g
dGhlIGFpbSBvbiB0aGUgc3BlY3Mgc2lkZSB3YXMgdG8gYmUgcmVhZHkgaWYgdGhlIEdHVFQgZXZl
ciBnZXRzIGJpZ2dlcg0KPiB0aGFuIDMyYiwgc28gSSB0aGluayB3ZSBzaG91bGQgZG8gdGhlIHNh
bWUgaW4gU1cgYW5kIHByb2NlZWQgbGlrZSB5b3UncmUNCj4gc3VnZ2VzdGluZyB3aXRoIG1vdmlu
ZyB0aGUgdmFyaWFibGUgdG8gYmUgYSB1NjQuDQo+DQo+IERhbmllbGUNCg0KSSBhZ3JlZSB3ZSBj
YW4gZGVmaW5lIHNyY19vZmZzZXQgYXMgdTY0LCBidXQgdGhhdCBoYXMgdG8gYmUgYSBzZXBhcmF0
ZQ0KcGF0Y2gsIHJpZ2h0PyBTaG91bGQgSSBzZW5kIHRoYXQgY2hhbmdlIHRvZ2V0aGVyIHdpdGgg
dGhpcyBvbmUgaW4gdGhlDQpzYW1lIHNlcmllcywgb3IgdGhpcyBwYXRjaCBpdHNlbGYgY2FuIGJl
IG1lcmdlZCBhcyBpcz8NCg0KLUZlaQ0KDQo+PiB1NjQuIFRoYXQgYWxzbyBtYXRjaGVzIHdoYXQg
d2UgaGF2ZSBpbiBpOTE1LiBCZWZvcmUgdGhhdCBjb21taXQsIGRvaW5nDQo+PiB0aGF0IHdyaXRl
IHdhcyBiYXNpY2FsbHkgYWx3YXlzIHdyaXR0aW5nIDAuDQo+Pg0KPj4gV2l0aCB0aGF0LA0KPj4N
Cj4+ICAgICBSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRl
bC5jb20+DQo+Pg0KPj4NCj4+ICtEYW5pZWxlIC8gK01hdHQgQnJvc3QNCj4+DQo+PiBMdWNhcyBE
ZSBNYXJjaGkNCj4+DQo+Pj4gKyAgICB4ZV9tbWlvX3dyaXRlMzIoZ3QsIERNQV9BRERSXzBfSElH
SCwNCj4+PiArICAgICAgICAgICAgdXBwZXJfMzJfYml0cyhzcmNfb2Zmc2V0KSB8IERNQV9BRERS
RVNTX1NQQUNFX0dHVFQpOw0KPj4+DQo+Pj4gICAgIC8qIFNldCB0aGUgRE1BIGRlc3RpbmF0aW9u
ICovDQo+Pj4gICAgIHhlX21taW9fd3JpdGUzMihndCwgRE1BX0FERFJfMV9MT1csIG9mZnNldCk7
DQo+Pj4gLS0NCj4+PiAyLjI1LjENCj4+Pg0K
