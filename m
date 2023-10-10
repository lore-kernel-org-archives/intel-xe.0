Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F028CD68F5
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 07:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210F10E319;
	Tue, 10 Oct 2023 07:31:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DACD10E319
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696923082; x=1728459082;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gw0Gq/MBfStv3kdzhziuUfDOj5nEe3IdZxoFFx3FpXc=;
 b=Rh3XMDEe9r2H3daibTS0L6oIiPWfECk2/fByAbG+hZotYAxhLqIsXSQU
 WzJswh4RyEuPDDocsLlaxBL3J25ncuqv1tuLoI3uvEIghfYiLlH0++VNa
 RqzN9jnIydl3D7zj1DiX6rx4qIu3AzcBdG39bHnff0oz+p90Kv3jQuga7
 lzeLj16WZtovcI/t9sfQIscdOeWYJd/b1W+g4dd+8wK9fIF4LggW3Mb5Y
 DRGzDzyOLzg6GQyTFBm9R3QgTlYaZ8z3a2RhhK5GrFVvZ3NrNgApKgVCF
 PhMoqJXkEvX1vKjOFc8NoZEVMLNDRC+th+uFb1Fbu8oo+cDaegsvLK+Wa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="374673261"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="374673261"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 00:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="819127839"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="819127839"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 00:31:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 00:31:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 00:31:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 00:31:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 00:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAkoGsydMNeeJ45BsW5h8CkSGgv2cgByPbT0O24cA/9jYcHRzYz7RJX6UU34qk3IIWxyHT2QkrUzmXih4ATFIncM1oJEUbEBSonewm8FGlp7ai2eI9XYdAyyeG+p0hbbyLBvYl8vaWgQ+UduVkurP9r84uwpmKYgMQQG/0bU1VYNO1wNb0sCnp0pyljBvUD2rOiCLlL+zKQbqre0X4H+2Br53800Oz1A5lFolHftXFx9BjTHXoXh0WcZ2tTpZETnBEyyQvP62d+FXwLLA4h/UvXD9tkl2Xuu06JcWYcoQkSVkuBzML0FRaVvA2XZkQxyuWmBm625zhmrzcFot0BhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gw0Gq/MBfStv3kdzhziuUfDOj5nEe3IdZxoFFx3FpXc=;
 b=a9v/32+wGHnl+8PaVuj6N01y3ybZmbcYy/VSWvw0D4YCezkwWpVgwiS09Qzqy1J20WbAo6eaKPILt7gvYsLF5gVSxRUpzn0fun2HHaJtVp4xkhcYq14H1oVC8JZX0OUxcXmM+QcgQWr1h/BMU6dZaDXorbuhhSz7huErHL2mGqz5/AWYAzxJUWjMModmJXLZtRt4UeBzzcTit7OLylCvJli0b8LWEJH/8OAZdQCn3lrAx7PEpSXFB/r1n1CS15c1Xgv+k58HcPKWACfeo15yQMoR8cLfcpAjYlXZSSsnD9Bn8LZauWwMRJS524vYXtC31VP/YH0zERELMKOeUT0pXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 BL1PR11MB5955.namprd11.prod.outlook.com (2603:10b6:208:386::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 07:31:16 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6838.040; Tue, 10 Oct 2023
 07:31:15 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [v2 3/3] drm/xe: Create a dummy version for vga decode
Thread-Index: AQHZ+Es95OLVhsE7Lk6eXQ+hkYlbSLBA4VmAgAHE8HA=
Date: Tue, 10 Oct 2023 07:31:15 +0000
Message-ID: <DM4PR11MB63604707F3239BFE7A0A1E58F4CDA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20231006115645.2402795-1-uma.shankar@intel.com>
 <20231006115645.2402795-4-uma.shankar@intel.com>
 <DM6PR11MB3177EAD727A47713E825B03FBACEA@DM6PR11MB3177.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3177EAD727A47713E825B03FBACEA@DM6PR11MB3177.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|BL1PR11MB5955:EE_
x-ms-office365-filtering-correlation-id: 7cd8a4d1-29b1-4da4-f3b8-08dbc962e2d0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GHOpi07XbSadcEXmk2HoRBd+ohYFVz2ha6+khuyOEb6q8mMfk7mcpjzyk+SFyUxc7nIHEpcbzdKdIb6/QYKVg82Xk4FRQ+3VGTVQU/EqLytv2mdbujRp7m9QzCICaxAqJh9TQGBDkYl8q/f6i6TFFTOI6GKndERIxO+G3gq3y0G3QlAXxeAQUCLj4dai6RzFb+EF57cyWCnnDQaPSXS+c8LjJ0DUVWMJqo2Cvd10puIksk4A4WHsVtwrc7iEebC4W4uIsDfAn5h4qZqKK6Al+rYqS9BDH0aAAFPtOYAUpnf6b2cuKxjQWqw0ZuaspwXvn80CgWy68z9sm1d3uNJfgD9kNRWEo5FDlzGSrXSITvPXKb5QExggjc5s3rytzjohdLHgHj9E1GPwDYqcruZFzcotaQW4W+85hs8ZYFQVGh+qMJ8SVkYskDyHzQ8+SxF22v+2C+onab+0v4zSWzby98D7Av2yTEA2YeG1dG8os3QICNN+Dnk/NXvUQnlx3THY45EtDBkxTDWMZCA+2QJrphYnDH8Gttqe2asvEUDS+aI/hKfxUaiEENOpS+kKJFumb4X8nvVQOwA6i7bijYSF4OIzrT46vcakpOmmFqhMoHzmtjC0asf6Rfo97CNFSnEB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(55016003)(38100700002)(41300700001)(66476007)(64756008)(66446008)(66556008)(316002)(66946007)(76116006)(110136005)(4326008)(8676002)(8936002)(52536014)(5660300002)(83380400001)(86362001)(71200400001)(38070700005)(7696005)(6506007)(2906002)(478600001)(53546011)(122000001)(82960400001)(107886003)(33656002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlNmbkdPSGF0dW9IVTJoQTcxcWovK294OGFqdnNoTnhDMm90c3RERW8yVmpl?=
 =?utf-8?B?R2Y5R2hVY0IxRkh0UjJyc1dZdDZjbTZodHR2TUR0NUdLcnFJc3grWTJ3aHdQ?=
 =?utf-8?B?RldyQUoyaXhZYW1jRTdwdWJpaEZxZksvRm4vVHJEMmxiTlJGMTFHSGpvQmMz?=
 =?utf-8?B?b3BwbkVoMUt4aTdsL0lSQ2h1Q0ZiWDdDMFRQWUMycFNVaE5DKzd1SEdkTStV?=
 =?utf-8?B?ZEdxNzhXUndlVnVjR3ZHUmFwc2xnbWV6UFJiVG8zOThXYi94MEtoTzJEWVBL?=
 =?utf-8?B?S3hCbzRkU0Ywb3FYRHlMTWw1Z3FkYnhtNVpGN1AxZXJFcmRWa210NzY0aGFs?=
 =?utf-8?B?QTZ5SlFBS2lSZ2QzNk5Nb29OdkJ5bXMzV3JoZzkrNnU1ZHhBdXlXSWRKemhW?=
 =?utf-8?B?eGgyNWhoR1FUTHBMcHMvVmM4aVhQalcvbGFteUUzdm9EUTB5MEFlc1R2Y2Fo?=
 =?utf-8?B?L3FwYXBCNU80TzNpOWUrclRWSGhUNFp6Q1pNZGJLRnUxeDVPbWJidkZQWlFV?=
 =?utf-8?B?VVpTcXpsVEhSeGRseUo0b2ZxOVVJVEs5TUExNlRKODhMUkI4NktYeWh4UGgv?=
 =?utf-8?B?ajJGdU14VTVtL3ZIYmdiQmNzcUZaSWptc3Y1dlpDTnJSZU5FUFBDU3JSVmdj?=
 =?utf-8?B?ZUN1RThVaWEzODcrYUZiczFGNElPWDcxdkdFbzRXVUI3WGExazRwRUVsd21T?=
 =?utf-8?B?a01VYTJVZnArc0daSktoa0QrSFNYdzhJemlFbElYWU0yS1J5T2lXcGtNcmxt?=
 =?utf-8?B?STloMThKbXI0d1dlbHVqU3d3YUxyMTZMZUd2UnVTODZ6V3VRQm5nRnBuMnRu?=
 =?utf-8?B?UklNREM1UFpZcUdHSnpNVVBnc3dkSEhlcGphUmRwNk5zN1dRN2tRMmRQYTJS?=
 =?utf-8?B?N3pweUY1Q3hmakJGN3diWjQxTTMxSHRhcFJvQ0ZhUHJPWDNaSG5aVGhabFNX?=
 =?utf-8?B?bHkwV2pvbjV4eW53NkJmUDhxNkZyaTJMakZpeFh3VnZsL3ViTmhhWlpkdDZ0?=
 =?utf-8?B?VTBmOEtyd09LdDJGR3FWZkVCYkk0V3dzdXNUcVNDbFdtZjM2QUNxQ215b3Uv?=
 =?utf-8?B?ellZM280ZUZGcXNSWldmNjRxMVBTSUMvNG4wTWFrNDRtdDc2Zk9qYnhrTUU3?=
 =?utf-8?B?ZGdLRm90NTFXVE1oNHI0Y1dOYUVVT2JvUTk3ZDU1dnlraUxvd2ZqSVBjemZG?=
 =?utf-8?B?MzZybTUzVDhXZDNqMmJwdjVBUzUrdUo5OC84NXU2ZUVWeU5sdURqMFhQMEFp?=
 =?utf-8?B?MlEybDVDWVhmREFNWWxyK00ra3VUY1JPTWN6YXFWdkhLdGVqQ2h3ZzFLWjg2?=
 =?utf-8?B?UjRVSU9IcXlnejVUZ01hbzlWQ0JKZmJZV2hSNDhXS3NpenN1RTlqYzlCZ2pC?=
 =?utf-8?B?cnhtQkV0MzhtZ3ZmOVJBcXF2WlNDOTROSlBzVmVFbUtZaVAzRkNMVWUxYVV2?=
 =?utf-8?B?dzN3dFlmL1VzdGV5bUxrM2pxOEE4QnltVGM2cWVUcEFzWlQ2blRKN3pXQVZh?=
 =?utf-8?B?OTNvbDlmRlRpL0U3dVJ5dEE4bzFmRU9MWHpOYUVMN0JZRkpKRU1HbkJTTG9p?=
 =?utf-8?B?ZWpTakNlVnJOTE5nWFRCamd1aTZNR3IrRnRKK1NjL3FUd1FjVDNmV3lzV21P?=
 =?utf-8?B?c0JheGZscGphdWtVZkZpRFAvRmc0OUhTYzcyVU1SUTRrcnNWMVAyY3dmbmlP?=
 =?utf-8?B?aTdKcVJyV2NmdjJ1ZzU5aUVzNnRTRDh4RkF6RjVmbkt4VVUxSjlRQXhwNHlL?=
 =?utf-8?B?MWgrNEhrcXk1MXpVV0VodW8rekFtS0xueTlDc0F3N3I1aFBmMHUzLzJubFZC?=
 =?utf-8?B?aEhBenRpTHM0Uk5zV2xQSHhtQVgrUS9SaVNrRWFWem5GdTVlVmZNN2RlUVhH?=
 =?utf-8?B?b2IzVndSN3AvcFM3WEdxVDlkOWtvMS9RTDBkUUJ6WnEvNmVBN015U1RtcHVU?=
 =?utf-8?B?SDY4TmVDVE5MZ3k3eitORXBkcjJ1eEtBaG43d2lwWUYrVWZnNTNBaWM3dlRD?=
 =?utf-8?B?SXFYMkpZUGFOSXRnandkSlZMWVkyd0tRNUc1NlhQR0kzY2o2OVYwREsvd0FV?=
 =?utf-8?B?OXd4SHczdkxCeVR6SzV0Ryttc0NTcStVVTlUbGgwYmlnd0tlTnVZZnpGMUZL?=
 =?utf-8?Q?jVes=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd8a4d1-29b1-4da4-f3b8-08dbc962e2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 07:31:15.2154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHLpiuYV+ejCGzOQ7wHfXz+zTVRrMR9r3zEyLOtx90v1C+0KOTN6IZL5LtWsaNiGMvoCLkyVLpVy2RnssqreZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5955
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 3/3] drm/xe: Create a dummy version for vga
 decode
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBTaGFua2Fy
LCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIE9jdG9iZXIg
NiwgMjAyMyA1OjI3IFBNDQo+ID4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+IENjOiBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47IE11cnRoeSwgQXJ1
biBSDQo+ID4gPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgU2hhbmthciwgVW1hIDx1bWEuc2hh
bmthckBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogW3YyIDMvM10gZHJtL3hlOiBDcmVhdGUgYSBk
dW1teSB2ZXJzaW9uIGZvciB2Z2EgZGVjb2RlDQo+ID4NCj4gPiBUaGlzIGludHJvZHVjZXMgYW4g
ZXhjbHVzaXZlIHZlcnNpb24gb2YgdmdhIGRlY29kZSBmb3IgeGUuDQo+ID4gUmVzdCBvZiB0aGUg
ZGlzcGxheSBjaGFuZ2VzIHdpbGwgYmUgcmUtdXNlZCBmcm9tIGk5MTUuDQo+ID4NCj4gPiBDdXJy
ZW50bHkgaXQgYWRkcyBqdXN0IGEgZHVtbXkgaW1wbGVtZW50YXRpb24uIFZHQSBkZWNvZGUgbmVl
ZHMgdG8gYmUNCj4gPiBoYW5kbGVkIGNvcnJlY3RseSBpbiBpOTE1LCBwcm9wZXIgaW1wbGVtZW50
YXRpb24gd2lsbCBiZSBhZG9wdGVkIG9uY2UNCj4gPiB0aGUgaTkxNSBjaGFuZ2VzIGFyZSBmaW5h
bGl6ZWQgYW5kIG1lcmdlZCBpbiB1cHN0cmVhbS4NCj4gPg0KPiA+IHYyOiBBZGRyZXNzZWQgQXJ1
bidzIHJldmlldyBjb21tZW50cw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIg
PHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gUmV2aWV3ZWQtYnk6IEFydW4gUiBN
dXJ0aHkgPGFydW4uci5tcnV0aHlAaW50ZWwuY29tPg0KDQpUaGFua3MgQXJ1biBmb3IgdGhlIHJl
dmlld3MuDQoNCkhpIEphbmksDQpDYW4geW91IHBsZWFzZSBhY2sgdGhpcyBjaGFuZ2UsIEkgd2ls
bCB0cmlnZ2VyIGEgdGFzayBmb3IgdmdhIGRlY29kZSBoYW5kbGluZyBjbGVhbnVwDQpmb3IgaTkx
NSBhcyBuZXh0IHN0ZXAuDQoNClRoYW5rcyAmIFJlZ2FyZHMsDQpVbWEgU2hhbmthcg0KDQoNCj4g
VGhhbmtzIGFuZCBSZWdhcmRzLA0KPiBBcnVuIFIgTXVydGh5DQo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwg
IDEgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5X21pc2MuYyB8
IDE0ICsrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZGlzcGxheV9taXNjLmMNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
TWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gPiBpbmRleA0KPiA+IGRm
ZjEzODZlZTZiMy4uMTc1YTM1NzM2NmQ5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+
IEBAIC0xNTAsNiArMTUwLDcgQEAgeGUtJChDT05GSUdfRFJNX1hFX0RJU1BMQVkpICs9IFwNCj4g
PiAgCWRpc3BsYXkveGVfaGRjcF9nc2MubyBcDQo+ID4gIAlkaXNwbGF5L3hlX3BsYW5lX2luaXRp
YWwubyBcDQo+ID4gIAlkaXNwbGF5L3hlX2Rpc3BsYXlfcnBzLm8gXA0KPiA+ICsJZGlzcGxheS94
ZV9kaXNwbGF5X21pc2MubyBcDQo+ID4gIAlkaXNwbGF5L2V4dC9pOTE1X2lycS5vIFwNCj4gPiAg
CWRpc3BsYXkvZXh0L2k5MTVfdXRpbHMubw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUvZGlzcGxheS94ZV9kaXNwbGF5X21pc2MuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44MWZmOTdlNzA0ZWENCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheV9taXNjLmMN
Cj4gPiBAQCAtMCwwICsxLDE0IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBN
SVQNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24g
ICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAiaW50ZWxfZGlzcGxheV90eXBlcy5oIg0KPiA+ICsN
Cj4gPiArc3RydWN0IHBjaV9kZXY7DQo+ID4gKw0KPiA+ICt1bnNpZ25lZCBpbnQgaW50ZWxfZ21j
aF92Z2Ffc2V0X2RlY29kZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgYm9vbA0KPiA+ICtlbmFibGVf
ZGVjb2RlKSB7DQo+ID4gKwkvKiBUb0RvOiBJbXBsZW1lbnQgdGhlIGFjdHVhbCBoYW5kbGluZyBv
ZiB2Z2EgZGVjb2RlICovDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+IC0tDQo+ID4gMi40
Mi4wDQoNCg==
