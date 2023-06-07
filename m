Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC3AC7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 19:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D3610E0ED;
	Wed,  7 Jun 2023 19:27:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F297810E0ED
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686166038; x=1717702038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8TpP4ftBirB9oeUkZkrM10+LkViVlyg/ihtMNzs7yNU=;
 b=WnR3nK46m3OFrFaWhGiVgFfOLaOui9aBxVPJBM5CsgMegNdjPgA1Aqzf
 XnODSS/oNI8IMdA5AgPXXsz4T8RSJMrg6li9ZOpN/tHJeWzJd6U5iTnHn
 bw8LlXUNnMc41URmDg7RQ4sPDd4DsR1D1kgTgGRujtqwZ5Ew3MfaI973A
 WQeslBn2EVQ2i5/RbJs7BhNVU4wMcue97CNutZm4rwLXWowhyFCOeF8tP
 8rHCUs7l8uJUPP/Cp9bOpLNj/w+NPi6pPvCXSJ2Edc2o2qj1cl7J4T/bD
 4jM6YrDKR0hGbOGOZZfie4Rkzd5kSqg8PUAch9EIfTfLbFA+fqvg2E7vC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360417988"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="360417988"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 12:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="956412709"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="956412709"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2023 12:27:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 12:27:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 12:27:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 12:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOZl9+NIsNaIV3pKKGbMSvoBdRm9rZUA3dRgSjd+TZy39rR6MVqRPfcwyVuETIP9dVBf4KPugnTMllBplHofxDW82pIUtvkrA2+UGwTQGorf2gE5h803vFpDiE3CLpzi+H6nLdLyA23zXvErUua+BHZK9h/KSgKEZg5XoZZhM/4xQY6gm2C9rzxJ2As1mQXXgpbMhHdXeE0NuuYrjhRZYeitib33gm4VHeD2AU7lGEcggNS0uq6WhgnkGnebXSi66ImuU+AXcThjjPAIcp4997RIPQfYJYQEI0lyiSvi/hOUqDRbGqIdApIIc5PmmqzT0SDT7Fye2FZpppC033DTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TpP4ftBirB9oeUkZkrM10+LkViVlyg/ihtMNzs7yNU=;
 b=E/BqSXlF+J6eg1ehAi0kMzoKSQiaPzEHaMhvcY4Nm8dVC1gGO1Swj+1qCJ0gtMPR+ij1f/J+41w6HcNGOh4zvUXpNomTySy8VWx0zFFJCwP3+trliDy8XiE1GFdTI8ZAGx/yxmqTNE1XBbzYJbnTsl/CGXuZ2idNw3+3pAF9HyHGJldixS41k1nQwUj1sJB78RqLXolQy65/QghQ3+zAzGQhAAM7+iuOt2G/s/qvql3TFMqOpoI42YV47fG99wQGp8rZZrF1IIymrbbILnI5/pR/QJ4Fc/WHl6MRY/VunkS9yAsAiKkf9f2c+mfyv6auW3EmLbAEuQwA2GLnVRLQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB7389.namprd11.prod.outlook.com (2603:10b6:610:14d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 19:27:14 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Wed, 7 Jun 2023
 19:27:13 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/1] drm/xe: Report tile count from device
 query api.
Thread-Index: AQHZmPtysiyQKW0ULEegHazUJjuE569/qoWAgAAMzoCAAALQgA==
Date: Wed, 7 Jun 2023 19:27:13 +0000
Message-ID: <1fa8b4c7d2569b34296b9d2ade72b744e1be1459.camel@intel.com>
References: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
 <20230606195555.GH5433@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB705690A2A21050E31CBF545CB353A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <20230607183115.GN5433@mdroper-desk1.amr.corp.intel.com>
 <87edmnm6a6.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87edmnm6a6.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB7389:EE_
x-ms-office365-filtering-correlation-id: fcdd5612-2d9a-49dc-860b-08db678d3243
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DORXiYrYXVJN+n6X5Rdchkcx0sv260L9ynVYrGnmSH7+33R+V+rW/bqZ74yLLPRoyMDMyE2hWDwLQltzgQtw9VYQcZtcbJb8uVJ9+j+fPyrJFkVetzFbPAoiaF70760LIZNVZBFFL0HDSIg4Bm5pRC8YJsqbpuceiz52hCH2j/x/r912daoW+V7bw8Fv+B6d42lMAESUgDUuXwzjToIBQymYMZsFmg48+nalPjnSYai8PnJFUJ9VzimqGySoqsIg/OqTnil7VSEVGnhcb7/2LHoF8YZp3ocK9YcnJl04+kjONbS1T/p0yfCtsrTGwKGi8hLKmi//oxgDtX8+H/Ypo9fTouY30c1GKm5Botkh958+zeg5tkBLPVgQAT1fXMo8jvRAlKY322zkLfWEWsf80lznYkVcQiTYfSWemuraGCsZd7AFa/LeQKJgioXyyIO7hccWlPR6/koX7agOswSDCdT1jaJFjYmbAyYb3Axj4q3nGkhqAP08G0H6I4PI2GaUU53u3FIAR0uyHIoKXhswZCcA+7jGt/dGTWVYebAsCf4zbNeWQz0Ts3hjZW/H4i2N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(6512007)(53546011)(38100700002)(6506007)(2616005)(41300700001)(6486002)(26005)(83380400001)(966005)(186003)(66899021)(71200400001)(478600001)(110136005)(64756008)(66476007)(91956017)(122000001)(66446008)(4326008)(82960400001)(316002)(76116006)(66946007)(8676002)(66556008)(6636002)(8936002)(5660300002)(38070700005)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S29ZTE9uL3ZpaWU2cUViS2xPWXZCa1RXb3pycStHR25FckRhTHdtTHcxVWJY?=
 =?utf-8?B?ZUxucTVueEkvOWx5WVFneGZVMmZWc1pqdHdDeGJld3ZBOFFTbFRkbVdodHJm?=
 =?utf-8?B?SGtaSXN0ajI1NFZNQ3FKWGxkZUl3VGtiTldMczRyY0gwK0VMOTczVVFDQ0kz?=
 =?utf-8?B?OG5zYUhudzRQQUs4QzNDYlFES3NSMFlGZ1NxZ3Z4QzJURkh3NXB5RWlTMkZp?=
 =?utf-8?B?YU5rbUlIY0g1UW1PVGdadmJuRFUxRXlBV09GbmRLQkJxWkRNdkhGWEZIbVRw?=
 =?utf-8?B?OFBaQXkyM0pFTEV6N2VaZXNJbzZVZnprM0o5cTRJdW9YWThSNW9yYUxpSFJv?=
 =?utf-8?B?MXk5bitSWXBPdFM3RFpPRkFEamtlbGJUVjRoQUwxRFA5bFZ5Zk1WZ0JoRTJa?=
 =?utf-8?B?REVsbzF5cHJrSmU3VHVTanBubE8zK0hpK2lsT1RMWDBvYVc1NTNQNFRtWmIv?=
 =?utf-8?B?ekhudE1yS1hYLy82ZFhBVEF6M0VPMjM4Sm1kbldOYU5DWWtEbkpFQ1Z3dzhz?=
 =?utf-8?B?THRyYWV2aitMb053dVNiT3ZVd1F3ay9RY2ZWT1ltWUJTMVgyNnVsYUkzM3FF?=
 =?utf-8?B?cTJxbGtzcWMxQWg1YnB5WDRQY2NtZXY4MFdMMW9SeDd6bzQvZjJDRnc1cWIy?=
 =?utf-8?B?b1pSVk5MaGI2RDhYZ1piZW8zdzFzaERVR0x5WWoya3dPTmJaS2dQZnFodmVT?=
 =?utf-8?B?M2ZxODB4WHEwK1lSZjFSdWZySFpNSmcyeURYYXp6VFN4WVp2WENGUkdoRXZu?=
 =?utf-8?B?ZDFZY1BVeGhMUURIcHlKb3hCRFdZaU1FaXE3NHFsUUdCZzdndXJqeERlN3lB?=
 =?utf-8?B?azV2bHY2Qkc1Z3ZEK0hRV3dKRklDODZYSzY3Q3lsVDdGRTRXaHpQVmlVNVM5?=
 =?utf-8?B?UFNVVnhKbXZjQmlXT1drcVVrQytFREQ3TFg3Y3NxejE1cGJmTjI0LzR3SDl0?=
 =?utf-8?B?MmFzb1ZXYzJGR1hlZG5RUTlrazZDcmVKRHk0Y2VYY0xYL29DSzB0S3l0V1Fo?=
 =?utf-8?B?djR5R3JSNS9pdHZscUxMMHlpZEZhM3lydWR5YnlBNFYvK1MwZGJtZEZtNnRM?=
 =?utf-8?B?TVM2b0ltdkhSc1RvdlFaV1Rvc1hMeXB0dVE0RWlGWVFrWXQrdSs2NlI4OW5w?=
 =?utf-8?B?NzVEWGNvOVN3T0R4dzZ4SFBLZWJPZHZZSWFieTJndmdnaGpKZEFyNnlENm8r?=
 =?utf-8?B?Q2lqYU9DbjdjSkFSUEJzUXVONnhhUmYwU3IwVlpZMUpsSkIxekJWS2VWY09i?=
 =?utf-8?B?YkFxcVpHc0NRWUJnZVBXN3pxVVRpY0g3YmdMRUJzUnB3VHV1MjBXRW9lOElZ?=
 =?utf-8?B?M0FSa3lpeGtzS3dKOHhlYU1mVFQ2a2Y5M2dTb2JuRmtzRUhCTitrcm1uVkMv?=
 =?utf-8?B?WWRrNHNWZ2UvQ0w1Q1BUVWJhMjdzZ3YwbjJ2TjNiNy8yZGpqWHAydC96TVl3?=
 =?utf-8?B?MXZEN05Dd1F2VjhtSFpRYWtwTHJEMWEySXh0RndSVmEwN0lOYUlGR21QeDJs?=
 =?utf-8?B?cXFRZEU1SXJrUW5tRFRpZmQ4d2hhNzF4ZnpHVUEzRUkvcWlrTTJoK1ZtZ1Q1?=
 =?utf-8?B?UytrT1E5bjJnQk0zMDUrNjRtNEswL2tJOFFUNUVrc1RUbnNpeG9Cc1huTmsr?=
 =?utf-8?B?TW4vVDJRZUx2bmJoTXYzQzY1NFJrcHJweSs3Wmt3eVRMdUtoc0Y2VnYrb1VT?=
 =?utf-8?B?TkFpNjRCOHJVOFBSOU5ZZGhNaUoyRm1FZXl3QVdMeU53cGlJQWRzSjN4dWJM?=
 =?utf-8?B?N3dqaE9xSnRRSk13b1VzZzBjdnltcjRJby9rWkxWNGZqTGJxcmtJTHhlT1J3?=
 =?utf-8?B?VmZLWEtGSUpRdlkwV0Z6K0Zwb3drS3RpVDNuU2lkelJwVkFibTd6d2JhMHJy?=
 =?utf-8?B?K0pVcHVFeGJEYy95NXBBZGVnd1AxZTJDUHVTSzh1ZkQ0cUR6blhyNTdTdGVX?=
 =?utf-8?B?bnNaMlBSN1M0MUE3NDhKeENWRjBKVFExZm9TRjRHMkErRXJpOW5HWjNuUCt6?=
 =?utf-8?B?ZXZsRDZNY1dObUZJOG5Wa2RRdFA5Wm1jaW1TLzM0NmpFb2QvWUhMMUl5Z3FY?=
 =?utf-8?B?ekdZcmlSSUM0U0xyV3E4WEZFK1JzNHNuUng5ekJJZHBycy9kNjhUbUdBUm8z?=
 =?utf-8?Q?3c8Cp1lq6mhOnPnMONeiH40tm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E101800D9B9E8E4BA159F23B5FE37C0C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdd5612-2d9a-49dc-860b-08db678d3243
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 19:27:13.4245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NehfdsnNJkhG/a/ocPFZLJjx1LMioyaJbI/5wwUdg17GVlIW8NT/amRYlEaT7U/ejBiMCyf0QuSJ35cMyagoiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7389
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Report tile count from device
 query api.
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

T24gV2VkLCAyMDIzLTA2LTA3IGF0IDEyOjE3IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFdlZCwgMDcgSnVuIDIwMjMgMTE6MzE6MTUgLTA3MDAsIE1hdHQgUm9wZXIgd3JvdGU6
DQo+ID4gDQo+ID4gT24gV2VkLCBKdW4gMDcsIDIwMjMgYXQgMDQ6NDk6MDlBTSArMDAwMCwgR2hp
bWlyYXksIEhpbWFsIFByYXNhZCB3cm90ZToNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IFJvcGVyLCBNYXR0aGV3IEQgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gPiA+IFNlbnQ6IDA3IEp1bmUgMjAyMyAwMToy
Ng0KPiA+ID4gPiBUbzogR2hpbWlyYXksIEhpbWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1p
cmF5QGludGVsLmNvbT4NCj4gPiA+ID4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgRHVnYXN0LCBGcmFuY29pcw0KPiA+ID4gPiA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4N
Cj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzFdIGRybS94ZTogUmVwb3J0IHRpbGUgY291
bnQgZnJvbSBkZXZpY2UgcXVlcnkgYXBpLg0KPiA+ID4gPiANCj4gPiA+ID4gT24gVHVlLCBKdW4g
MDYsIDIwMjMgYXQgMDM6MTk6MjlQTSArMDUzMCwgSGltYWwgUHJhc2FkIEdoaW1pcmF5IHdyb3Rl
Og0KPiA+ID4gPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0K
PiA+ID4gPiA+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJhc2FkIEdoaW1p
cmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiA+ID4gPiANCj4gPiA+ID4g
RG9lcyB1c2Vyc3BhY2UgYWN0dWFsbHkgbmVlZCB0aGlzIHJlcG9ydGVkIGluIHRoZSBkZXZpY2Ug
cXVlcnk/ICBJdCBzZWVtcyBtb3JlDQo+ID4gPiA+IGxpa2VseSB0aGF0IHRoZXkncmUgZ29pbmcg
dG8gbmVlZCBhIHRpbGUtYmFzZWQgZXF1aXZhbGVudCBvZiAnZHJtX3hlX3F1ZXJ5X2d0Jw0KPiA+
ID4gPiB0aGF0IHJldHVybnMgbm90IG9ubHkgdGhlIHRpbGUgY291bnQsIGJ1dCBhbHNvIGZ1cnRo
ZXIgZGV0YWlscyBhYm91dCBlYWNoIHRpbGUuICBJZg0KPiA+ID4gPiB0aGF0J3MgdGhlIGNhc2Us
IHRoZW4gYWxzbyBhZGRpbmcgdGhpcyBjb3VudCBhcyBhbiBleHRyYSBmaWVsZCB0byB0aGUgZGV2
aWNlLWxldmVsDQo+ID4gPiA+IHF1ZXJ5IHNlZW1zIHJlZHVuZGFudCAoYW5kIHRoZSBleGlzdGlu
ZyBHVCBjb3VudCBzZWVtcyBsaWtlIGl0J3MgcHJvYmFibHkNCj4gPiA+ID4gcmVkdW5kYW50IGFz
IHdlbGwpLg0KPiA+ID4gSGkgTWF0dCwNCj4gPiA+IA0KPiA+ID4gRnJvbSB1c2Vyc3BhY2UgIHBl
cnNwZWN0aXZlIHRoZSByZXF1aXJlbWVudCBpcyB0byBrbm93IG51bWJlciBvZiB0aWxlcyBzdXBw
b3J0ZWQgYnkgZGV2aWNlDQo+ID4gPiBhbmQgYWdyZWVkICdkcm1feGVfcXVlcnlfdGlsZScgc2hv
dWxkIHByb3ZpZGUgdGhpcyBpbmZvIGFsb25nIHdpdGggb3RoZXIgZGV0YWlscy4NCj4gPiA+IENh
biB5b3UgcGxlYXNlIHByb3ZpZGUgeW91ciBpbnB1dHMgb24gd2hhdCBvdGhlciBkZXRhaWxzIGNh
biBiZSBwYXJ0IG9mIHRpbGUgcXVlcnkgPw0KPiA+IA0KPiA+IEl0J3MgcmVhbGx5IHNvbWV0aGlu
ZyB0aGF0IHdvdWxkIG5lZWQgdG8gYmUgZGlzY3Vzc2VkIGFuZCBhZ3JlZWQgdXBvbg0KPiA+IHdp
dGggdGhlIHVzZXJzcGFjZSB0ZWFtcywgYnV0IEkgaW1hZ2luZSBkZXRhaWxzIGFib3V0IFZSQU0g
bWlnaHQgYmUNCj4gPiBzb21ldGhpbmcgdGhleSdkIHdhbnQgdG8gcmVjZWl2ZSB2aWEgc3VjaCBh
IHF1ZXJ5Lg0KPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gQXJlIHRoZXJlIHBhdGNoZXMgZm9yIGFu
eSBvZiB0aGUgdXNlcnNwYWNlIGNvbXBvbmVudHMgeWV0IHRoYXQgc2hvdw0KPiA+ID4gPiBob3cv
d2hlbiB0aGV5J2QgdXNlIHRoaXM/DQo+ID4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzExODkyNy8gZXhwb3NlcyBwZXIgdGlsZSB2cmFtIGFkZHJfcmFuZ2Ugdmlh
IHN5c2ZzLg0KPiA+ID4gV2hpbGUgd3JpdGluZyBJR1QgdG8gdGVzdCB0aGlzIHN5c2ZzIGVudHJ5
LCBJIGNhbWUgYWNyb3NzIHRoZSByZXF1aXJlbWVudC4gSUdUIHBhdGNoZXMgYXJlIFdJUC4NCj4g
PiA+IA0KPiA+ID4gSnVzdCBhIHRob3VnaHQsIHdpbGwgaXQgbWFrZXMgc2Vuc2UgdG8gZXhwb3Nl
IG51bWJlciBvZiB0aWxlcyBkZXZpY2Ugc3VwcG9ydHMgYnkgc3lzZnMgPw0KPiA+ID4gU29tZXRo
aW5nIGxpa2U6IDxkZXZpY2UtcHJvcGVydGllcz4vbnVtYmVyX3RpbGVzDQo+IA0KPiBJbiBpOTE1
IGUuZy4gdGhlIG51bWJlciBvZiBndCdzIHdhcyBuZXZlciBleHBvc2VkLCB1c2VybGFuZCB3b3Vs
ZCBqdXN0DQo+IGNvdW50IHRoZSBudW1iZXIgb2YgZ3QvZ3ROIGRpcmVjdG9yaWVzIGluIHN5c2Zz
IHRvIGdldCBudW1iZXIgb2YgZ3QncyAoc2VlDQo+IGhvdyB0aGlzIGlzIGRvbmUgaW4gSUdUKS4g
U28gc29tZXRoaW5nIGxpa2UgdGhhdCBpcyBwb3NzaWJsZSBmb3IgdGlsZXMgdG9vDQo+IChzZWUg
ZW1haWwgdGhyZWFkICJSZTogW1BBVENIIDAvM10gZHJtL3hlOiBBZGQgc3lzZnMgZW50cnkgdG8g
cmVwb3J0IHBlciBndA0KPiBtZW1vcnkgc2l6ZSIpLCB0aG91Z2ggbGlrZSBNYXR0IHNheXMgbmVl
ZHMgZGlzY3Vzc2lvbiB3aXRoIFVNRCB0ZWFtcyB0byBzZWUNCj4gd2hpY2ggcGFydGljdWxhciBv
cHRpb24gdG8gZ28gd2l0aC4NCj4gDQo+IFNvbWV0aW1lcyBJIHRoaW5rIHdlIHNob3VsZCBwdXQg
d2hhdGV2ZXIgd2UgY2FuIGluIHN5c2ZzIGFuZCBtaW5pbWl6ZQ0KPiB0aGluZ3MgZXhwb3NlZCB2
aWEgdGhlIHF1ZXJ5IGlvY3RsLiBUaG91Z2ggYWdhaW4gbm90IHN1cmUgYWJvdXQgdGhlDQo+IHRy
YWRlb2ZmJ3Mgb2Ygb25lIHdheSB2cyBhbm90aGVyLg0KDQpNeSA1Y2VudHMgaGVyZTogTWVzYSBk
b24ndCByZWFkIGFueSBzeXNmcy4NCg0KPiANCj4gQXNodXRvc2gNCj4gDQo+ID4gPiBJTU8gdGhp
cyBpbmZvIHNob3VsZCBiZSBhdmFpbGFibGUgdG8gdXNlcnNwYWNlIGV2ZW4gd2l0aG91dCBtYWtp
bmcgYW55IGNvZGUgY2hhbmdlcyAuDQo+ID4gPiBUaGVyZSBtYXkgYmUgb3RoZXIgc3VjaCBwb3Rl
bnRpYWwgY2FuZGlkYXRlcyB3aGljaCBjYW4gZmFsbCB1bmRlciBkZXZpY2UtcHJvcGVydGllcy4N
Cj4gPiANCj4gPiBUaGF0J3MgcmVhbGx5IHNvbWV0aGluZyB0aGF0IHdlIG5lZWQgZ3VpZGFuY2Ug
b24gZnJvbSB0aGUgdXNlcnNwYWNlDQo+ID4gdGVhbXMgKG1lc2EsIG1lZGlhLCBjb21wdXRlLCBl
dGMuKS4gIEl0J3MgaGFyZCBmb3IgdXMga2VybmVsIGRldmVsb3BlcnMNCj4gPiB0byByZWFsbHkg
a25vdyBleGFjdGx5IHdoYXQgdGhlIGJlc3QgdWFwaSB3b3VsZCBiZSBmb3IgdXNlcnNwYWNlLg0K
PiA+IFRoYXQncyBwYXJ0IG9mIHdoeSB0aGUgRFJNIHN1YnN5c3RlbSByZXF1aXJlcyB0aGF0IGFu
eSB1YXBpIGNoYW5nZQ0KPiA+IHByb3Bvc2VkIGZvciBpOTE1IG9yIFhlIGNhbid0IGJlIGFkZGVk
IHRvIHRoZSBkcml2ZXIgdW50aWwgdGhlDQo+ID4gY29ycmVzcG9uZGluZyB1c2Vyc3BhY2UgcGF0
Y2hlcyBoYXZlIGFsc28gYmVlbiBkZXZlbG9wZWQgYW5kIGZ1bGx5DQo+ID4gcmV2aWV3ZWQuICBX
ZSBkb24ndCB3YW50IHRvIHdyaXRlIFVBUEkgdGhhdCB3aW5kcyB1cCBub3QgcmVhbGx5IG1lZXRp
bmcNCj4gPiB1c2Vyc3BhY2UncyBuZWVkcyBhbmQgdGhlbiBiZSBzdHVjayBzdXBwb3J0aW5nIHRo
YXQgYnJva2VuIHVhcGkgZm9yZXZlci4NCj4gPiANCj4gPiANCj4gPiBNYXR0DQo+ID4gDQo+ID4g
PiANCj4gPiA+IEhpbWFsDQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gTWF0dA0KPiA+ID4g
PiANCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5
LmMgfCAxICsNCj4gPiA+ID4gPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgfCAzICsr
LQ0KPiA+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcXVlcnkuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMg
aW5kZXggYzQxNjVmYTM0MjhlLi41NGVmYmVmZDY2M2YNCj4gPiA+ID4gPiAxMDA2NDQNCj4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gPiA+ID4gQEAgLTE5Nyw2ICsxOTcs
NyBAQCBzdGF0aWMgaW50IHF1ZXJ5X2NvbmZpZyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0
DQo+ID4gPiA+IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiA+ID4gPiA+IAkJCWh3ZWln
aHRfbG9uZyh4ZS0+aW5mby5tZW1fcmVnaW9uX21hc2spOw0KPiA+ID4gPiA+IAkJY29uZmlnLT5p
bmZvW1hFX1FVRVJZX0NPTkZJR19NQVhfRU5HSU5FX1BSSU9SSVRZXSA9DQo+ID4gPiA+ID4gCQkJ
eGVfZW5naW5lX2RldmljZV9nZXRfbWF4X3ByaW9yaXR5KHhlKTsNCj4gPiA+ID4gPiArCWNvbmZp
Zy0+aW5mb1tYRV9RVUVSWV9DT05GSUdfVElMRV9DT1VOVF0gPSB4ZS0+aW5mby50aWxlX2NvdW50
Ow0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IAkJaWYgKGNvcHlfdG9fdXNlcihxdWVyeV9wdHIsIGNv
bmZpZywgc2l6ZSkpIHsNCj4gPiA+ID4gPiAJCQlrZnJlZShjb25maWcpOw0KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94
ZV9kcm0uaA0KPiA+ID4gPiA+IGluZGV4IDBlYmM1MGJlYjVlNS4uOGU1NTJhYTU1MDM3IDEwMDY0
NA0KPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+ID4gPiAr
KysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+ID4gQEAgLTE4NSw3ICsxODUs
OCBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2NvbmZpZyB7DQo+ID4gPiA+ID4gICNkZWZpbmUgWEVf
UVVFUllfQ09ORklHX0dUX0NPVU5UCQk0DQo+ID4gPiA+ID4gICNkZWZpbmUgWEVfUVVFUllfQ09O
RklHX01FTV9SRUdJT05fQ09VTlQJNQ0KPiA+ID4gPiA+ICAjZGVmaW5lIFhFX1FVRVJZX0NPTkZJ
R19NQVhfRU5HSU5FX1BSSU9SSVRZCTYNCj4gPiA+ID4gPiAtI2RlZmluZSBYRV9RVUVSWV9DT05G
SUdfTlVNX1BBUkFNDQo+ID4gPiA+IAlYRV9RVUVSWV9DT05GSUdfTUFYX0VOR0lORV9QUklPUklU
WSArIDENCj4gPiA+ID4gPiArI2RlZmluZSBYRV9RVUVSWV9DT05GSUdfVElMRV9DT1VOVAkJNw0K
PiA+ID4gPiA+ICsjZGVmaW5lIFhFX1FVRVJZX0NPTkZJR19OVU1fUEFSQU0NCj4gPiA+ID4gCVhF
X1FVRVJZX0NPTkZJR19USUxFX0NPVU5UICsgMQ0KPiA+ID4gPiA+IAkJX191NjQgaW5mb1tdOw0K
PiA+ID4gPiA+ICB9Ow0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IC0tDQo+ID4gPiA+ID4gMi4yNS4x
DQo+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiAtLQ0KPiA+ID4gPiBNYXR0IFJvcGVyDQo+
ID4gPiA+IEdyYXBoaWNzIFNvZnR3YXJlIEVuZ2luZWVyDQo+ID4gPiA+IExpbnV4IEdQVSBQbGF0
Zm9ybSBFbmFibGVtZW50DQo+ID4gPiA+IEludGVsIENvcnBvcmF0aW9uDQo+ID4gDQo+ID4gLS0N
Cj4gPiBNYXR0IFJvcGVyDQo+ID4gR3JhcGhpY3MgU29mdHdhcmUgRW5naW5lZXINCj4gPiBMaW51
eCBHUFUgUGxhdGZvcm0gRW5hYmxlbWVudA0KPiA+IEludGVsIENvcnBvcmF0aW9uDQoNCg==
