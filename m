Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA63EC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 02:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66F910E30A;
	Fri, 15 Dec 2023 02:20:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4568A10E30A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 02:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702606844; x=1734142844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uJvxT450U088ZNpTRNQd1xMIWRJ61luO8tsJs9pRfvU=;
 b=SXjh7+kSwVmIVlh0qAMZxPNdsOi9NsqmQ6NNuAO7URqHkvz7utx1vt/x
 MdvOaz7xpQbhfhypXRxrPxVLAaakxhW/mWOCDSmIOIVYbCmBbZeXz3mX+
 S3d3mdcACv7bOLvGWqYMo8hr/kai6mVwM0btHKM3eyeIQfzMVI53YTRAR
 OsMYHsm5kf2SYeJwyIK4c2AARbTE7TyT2Bkbhvira8J7rJSUbGM79kWjc
 +NGKht/Ife6Q+upiDUwchWbvEAbd8NmxVB2Cue/IJOasyFEYhV3AY1RkB
 y3qFtd7oowxue3XwCGfgpYtPal0RtaNaYg6KzTefK1bBoqCzSopAdHt/W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2307566"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="2307566"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 18:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803546746"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="803546746"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 18:20:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 18:20:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 18:20:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 18:20:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYY1oUD1n/1zUoCuimFJcdPc7P1jpJTgUUDrJ3FHZRoZBUDW8U0AsuJx2z3wRN+vw2EpeGf7gOJq+ffs2ls2gMAe/QrxxBhP8BqXauBjnzwSThm2DhoXcx5QMvgreRZmpjZV3XYU9sQvKhSfi94u2I0/k0vEQN7ELvvB/sl3y5hcPeE1m5ktlR+fOH3X7LZr1tc5VZGm+XAjrC0cVvDL575m7+u4S/y8//UQX9rlycCKqkhAZJVLavDp8rMG/JmkD7BsjZWb2/r82kGZ8rBDWsdGClEeT2BUDUGpx2XKVD9HKi9gV0Vf2CFJuCWtH2wtl74LubDs7NmG4L7Twf0ggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJvxT450U088ZNpTRNQd1xMIWRJ61luO8tsJs9pRfvU=;
 b=CDy6Rjn9ndLeUEnEqSUeWkwlt3y0L3Z0r101EOEXiEE8cw7lWX6gwBIFpIJCUJnigLm9Sg9wAJpVfvTPzBo/552dT9PZrXknnZB3zyeBYQzgaAkvesnGO7/NFHRD1csKlMM74fimJzuzRdGD3OpwmGbUFBJoEG33zNeWbPV2TxJiu1inaAtMmZWa0ZGuBTtDVEpGH9urBn0QO4aEDYp02WcJBaUumdXBj97Y+PVN7Mz9vlxiz85JIDS9rLJ2Qf1PE693f3aTHCLP3Y7rwWVaayeN3vmRAGN+6PaTc3Q38/terkt8DCCpavaxO7hTPmh8IVjSOnW8fa4KKMByolyVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM6PR11MB4515.namprd11.prod.outlook.com (2603:10b6:5:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 02:20:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fcae:ecc0:72c7:cc9d]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fcae:ecc0:72c7:cc9d%6]) with mapi id 15.20.7091.029; Fri, 15 Dec 2023
 02:20:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>
Subject: RE: [PATCH] drm/xe: Remove vram size info from sysfs
Thread-Topic: [PATCH] drm/xe: Remove vram size info from sysfs
Thread-Index: AQHaLJEx2khPekE0FEWWPo7DPrY6Y7Cml9mggAAWkYCAALFgAIAA6ngAgABAgoCAARYLAA==
Date: Fri, 15 Dec 2023 02:20:17 +0000
Message-ID: <SJ1PR11MB62048929FA571D9D817EA3D08193A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
 <SJ1PR11MB620471C7291527E350731CC0818DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ca95972f-2d5d-4fc6-bca3-e80f984e79cf@linux.intel.com>
 <5403be007f18a7df3e3dacb283794a4fb60185e0.camel@intel.com>
 <63d56a37-5460-4c32-abf7-7860f358023d@linux.intel.com>
 <CAM0jSHO+qYFYEPKetsCY+U7xcDX7N3J75K848RPjpqqB_h+cHw@mail.gmail.com>
In-Reply-To: <CAM0jSHO+qYFYEPKetsCY+U7xcDX7N3J75K848RPjpqqB_h+cHw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM6PR11MB4515:EE_
x-ms-office365-filtering-correlation-id: ba068193-bc5a-4726-af0e-08dbfd146172
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r8ekcp+tdw4df0PDTdOuKEfBR8iZGO1BpZZ9GfnwslRwv7oC/bVXZdCeDWJg4uTizYPplhzu/XmT3zEYm1mIQbELXcwu/x2ZJ/OgudZnhmZXSaBjW6qsEX4g8h/qH6TlTk36+FwLX2qhgCFaRZy1V+uJmpWM/5pwNyLPXQaA2ECKjvkAVCx75W/TWEqVli/G0AjR1G6KcF/K8OXVouCLCob40hxvDt1TLd0OyC9CPwlEVLqWk7xwNrOX5Kx+IFJVU3cjmPSgfxtLPdnHsBxfYYcTbnQR63Mxyl4m+87WRgMRWFQt+1GO/fQVsA8fDXGwXXSyM8d1417pURMsR5r7LjPKuY9LHoOlqNqEY2DHciNWprPxkaSn1N9vr/FY6MH2ke+FVYtmEPBkXGwOvncHMoDW5Gn65v4PJQXLUj3EztIMmHi/s2loHiNX3RgrRL1dedWj2RxYZu4CpLzp2aRNWbww0CEB5ICurkr1BLheEcd5rgOTE1cQYVfVvuJVGjjazrceXaHZrcT0y8oQSjwHwntXChbx3gMZCAVLZ+lSH3h5iE08bQ/ugpZDkQEARnERWNWgIs1dgXGYKi9AFJEPxEqpT11qz9DOpy/t0lrRhZuzw6cZShNV1n6+dzD3HhjEtePsu9astBWw7ysMLqRUFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(33656002)(83380400001)(38100700002)(41300700001)(76116006)(64756008)(110136005)(66556008)(66476007)(66446008)(66946007)(54906003)(86362001)(71200400001)(122000001)(55016003)(38070700009)(7696005)(6506007)(9686003)(4001150100001)(53546011)(19627235002)(478600001)(2906002)(966005)(316002)(52536014)(82960400001)(8676002)(8936002)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXdYL2dOaHloSkpXYXV6VkcyMlVCRFZPRFQ3TFhielMxVU94QVNrKzNjQzkr?=
 =?utf-8?B?L05lcHJvVmxmZzRURm1wV3ZXQ3BqTTNtYnpzTUU1eG1MeWlkYnlHUXE5WUNH?=
 =?utf-8?B?OXZDQkxCenZOUEovSGtjZThBN0lvVjhnWXdFaXhFN0dYWWw2bDllWDB0TEsz?=
 =?utf-8?B?Y3ovNmZMT1l3ajNFVjIyc09lcVFTQkkvQzVMNE5yeGkxOUlXYlpzSXJlTnFG?=
 =?utf-8?B?d0s5cFF5aGlneFhrN1VUMWRIeTc5aWpCZnhva3lFTFJUaVNUZm0wbUhWaVYv?=
 =?utf-8?B?T25FUjc0QzViSC9aK3RiZXd0QTMxUm5pOUR0T2YwYkFQU1ExMGlHM3AwY0NR?=
 =?utf-8?B?dzVNUm90VjBzZWVpbFNrWS9JcG01R2pMdlF2VEVieEoyc2Iwd3JWZXNSaUV1?=
 =?utf-8?B?Y0s0eG5KZWlFSTdRWlpLb0pKMDFiek14VEVLeENzUFQrSVRqeDQ4eCsxZWhv?=
 =?utf-8?B?aGVVdVAzaEtXRktkODgva3kxSHBVNXdrMjNDY0lGbm9UamxhZ0dEZ0cwNmtV?=
 =?utf-8?B?UmVEcmR0Nm5iWGJuWWQ0VUhQalFtbFpvK2VoOGgvOHNoblNCUlUxZVRDcVlK?=
 =?utf-8?B?U2wyWTUzTVIvdWZhTkV6VUZCQWxYZ1NwSGFyVWV0TVk0cXJzakxGeHFtVUs5?=
 =?utf-8?B?QTY3MGRnY0trbGFpbUdmMDNrUmwvS0dZdWVoL3QwZ25oU0JXZk4wdi9BdUt0?=
 =?utf-8?B?VlMyRnZoY1V2ZkR4cVQ1THlHeTRHZnhobmFRZ3VyWGVwQTUrcTRqWm1NTkFG?=
 =?utf-8?B?QmlQNzVtQ0V2OVFZdm5Tc2tWL2JMWExjVXNBS1dEQkNocFRKMWJrVXJFOHlG?=
 =?utf-8?B?TFZ6QWFyckY2dXEwajZsbVltN3ZDN2lhUW1TZDJzZ2JBTzNvcjdSaHYxTTNx?=
 =?utf-8?B?bnppMGFxK095Sm8zT1lmTXFyMVNqZzJQdVIvT0RDa0JwS29IU0ZMeXdqRnNt?=
 =?utf-8?B?TkRvYmZTT21GUFdIT08vOVNuaERiY2NKRUMvU2Y0WlVuT3ZsdWdYS0ltTlhQ?=
 =?utf-8?B?QUh4Qm1heENEQ3lodHhSUjdhTE9GVFIrWW9OM1Nleld0bnpOMndKUko0c0Fv?=
 =?utf-8?B?b3hBYStncEw1by9taEtmU0NQbHlwUTZ5aUpBdTF5TjYwYlZYUmhKalhlQWQ5?=
 =?utf-8?B?U0hVSVdpS2JUS1dFcmQ5eXVxUUg1SW5TRFVpbnpVa2tLdDMxazV2NW9hQTFm?=
 =?utf-8?B?TkM4bnQ1T1pDeE9USzdvbFpsVUh2YUl6NGMvaWFvWUpkOGNDanJCS3lldDQ1?=
 =?utf-8?B?VlZkWFV4QWNtSm9IOHpRZ2w5OVcyYXNwMlo2dWRaSUN5dFRHakJER3grRllm?=
 =?utf-8?B?dXZYWlBUZnhxSUljN2hhN0xvSkNUajJKSXV6TmlaV1hadHN6elJvaG9hNUN1?=
 =?utf-8?B?dy9pU3ptcVNPeGJycEQ5NmtVaGtDQWMvOE53R2R4VEdqMVpEM1FKanNhNmJQ?=
 =?utf-8?B?ME1zV3VKQnVFdHI1cGtNZ3hnd3hSRGlGaU1PS3hiZlRKMXQvRTR4NWd5bXpH?=
 =?utf-8?B?TVhYTG42OFZBT002L04zUlhPZjZ4Q3hUOGU2VGJsVHgzbDVndElxcEtybGI0?=
 =?utf-8?B?TDViTnlDZS8vTzJFZW9wYkRYaW9HaFdmOU5lMDRxd1lZcjJheUM5d21rckFw?=
 =?utf-8?B?aW8zQXdSVG5BWGRJMXR4eTBvKzRUZHF6SmFYditYQ0pOWitROGhHblBSelRo?=
 =?utf-8?B?VnF0SEhmaW1nMEN5Yk4zcXRZeXNuN2U4TXNuQUpLSDV2U1drQXNHTjVTRkI2?=
 =?utf-8?B?QWxmdzRNVXBTWnZYVEdvNWNMSE5HL0tKZjZSRkM0WXBHRDFhZnRQenExVVA4?=
 =?utf-8?B?K1JtZjMvLzVJbW8xRW0vbDBkNkUxamZpWjBteEc3WmhMalo0NVpYK1h5TkVO?=
 =?utf-8?B?a2FLSWJLRlhKbXp1SEZ0bkZLMXJJUU9WaG5ac0UyWlk3QlNCLytTbExEVFdV?=
 =?utf-8?B?b2hSVTNlSm14cW92cnp2aHJlQm5JM1VnbVVkeXFnb1BiUklBaTBQenFCTGdz?=
 =?utf-8?B?cXJmVW5SR3pvcnVmUDBvL0hSVCtna0laRkl4aHRtVWJBNEdnYU54THh0WlB3?=
 =?utf-8?B?bjh5a3FUbGEvSXdQVDRlWjl4aUp3My9xaTgzZnhqbnQ4Uit2RW8xSUI4dzB2?=
 =?utf-8?B?cGdHVGh0UFFscFNpOEhJU3B2S2h6RkE0a01TQUExL1VlcmgvdzlSNVQ0UlVF?=
 =?utf-8?Q?SMUrwHQukK4PeMP4jcCrS3RL0wRMHY2uq9rQATBNbAEO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba068193-bc5a-4726-af0e-08dbfd146172
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 02:20:17.8980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qXsw1u3HNlnj3yYJzNGcLp9/cCrghBbAd1RD3EMc1w36QBX1A1zPySXjl96BClIsnyjJU1sGtL5AOhHnz4MJSayX9VrdiRn0YtoDQK1weI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4515
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0dGhldyBBdWxkIDxt
YXR0aGV3LndpbGxpYW0uYXVsZEBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJl
ciAxNCwgMjAyMyAzOjEzIFBNDQo+IFRvOiBBcmF2aW5kIElkZGFtc2V0dHkgPGFyYXZpbmQuaWRk
YW1zZXR0eUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBVcGFkaHlh
eSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQNCj4g
PG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94
ZTogUmVtb3ZlIHZyYW0gc2l6ZSBpbmZvIGZyb20gc3lzZnMNCj4gDQo+IE9uIFRodSwgMTQgRGVj
IDIwMjMgYXQgMDU6NTYsIEFyYXZpbmQgSWRkYW1zZXR0eQ0KPiA8YXJhdmluZC5pZGRhbXNldHR5
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+IE9uIDEyLzEzLzIzIDIxOjIz
LCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0KPiA+ID4gT24gV2VkLCAyMDIzLTEyLTEzIGF0IDEwOjQ4
ICswNTMwLCBBcmF2aW5kIElkZGFtc2V0dHkgd3JvdGU6DQo+ID4gPj4gT24gMTIvMTMvMjMgMDk6
NDMsIFVwYWRoeWF5LCBUZWphcyB3cm90ZToNCj4gPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPj4+PiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0KPiA+ID4+Pj4gT2YgUm9kcmlnbyBWaXZpDQo+ID4g
Pj4+PiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMiwgMjAyMyA1OjUxIEFNDQo+ID4gPj4+PiBU
bzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPj4+PiBDYzogUm9wZXIsIE1h
dHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28NCj4gPiA+
Pj4+IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+ID4+Pj4gU3ViamVjdDogW1BBVENIXSBk
cm0veGU6IFJlbW92ZSB2cmFtIHNpemUgaW5mbyBmcm9tIHN5c2ZzDQo+ID4gPj4+Pg0KPiA+ID4+
Pj4gVGhpcyBpbmZvcm1hdGlvbiBpcyBhbHJlYWR5IHBhcnQgb2YgdGhlIHF1ZXJ5IElPQ1RMLg0K
PiA+ID4+Pj4gTGV0J3Mgbm90IGR1cGxpY2F0ZSBpdCBoZXJlIGluIHRoZSBzeXNmcy4NCj4gPiA+
Pj4gVGhpcyBwYXRjaCB3YXMgb24gcmVxdWVzdCBmcm9tIEwwIGFzIHRoZXkgd2FudGVkIGFjdHVh
bCBWUkFNIHNpemUNCj4gPiA+Pj4gaW5jbHVkaW5nIHJlc2VydmVkIHBvcnRpb24uIFdlIHNob3Vs
ZCBjaGVjayB3aXRoIFVNRCB0ZWFtIGlmIHRoZXkNCj4gPiA+Pj4gcmVxdWlyZSB0aGlzIHN5c2Zz
IG9yIG5vdC4gSSB3aWxsIGNoZWNrLg0KPiA+ID4+IEhpIFJvZHJpZ28sDQo+ID4gPj4NCj4gPiA+
PiBBcyBUZWphcyBtZW50aW9uZWQgdGhlIHN5c2ZzIGludGVyZmFjZSBleHBvc2VzIHRoZSB0b3Rh
bCBwaHlzaWNhbA0KPiA+ID4+IHZyYW0gaW5jbHVkaW5nIHRoZSBzdG9sZW4gc2l6ZSB3aGljaCBp
cyBuZWVkZWQgYnkgc3lzbWFuLCBpbiB0aGUNCj4gPiA+PiBJT0NUTCBvbmx5IHVzYWJsZSBzaXpl
KHdpdGhvdXQgc3RvbGVuKSBpcyBleHBvc2VkLg0KPiA+ID4gSSBoYXZlIHJlbW92ZWQgaXQgbm93
IHNvIHdlIGNhbiBkaXNjdXNzIGJldHRlciBhbmQgZW5zdXJlIHRoYXQgd2UNCj4gPiA+IGFyZSB0
YWtpbmcgdGhlIGJlc3QgdWFwaSBkZWNpc2lvbnMgdGhhdCBhcmUgYWNjZXB0YWJsZSBhbmQgd29u
J3QNCj4gPiA+IGJyZWFrIHRoZSBjb21wYXRpYmlsaXR5IGxhdGVyIGFmdGVyIHdlIGFyZSBtZXJn
ZWQgdXBzdHJlYW0uDQo+ID4gPg0KPiA+ID4gVGhlIHRpbWUgdG8gYnJlYWsgd2FzIG5vdywgc28g
SSByZW1vdmVkLg0KPiA+ID4NCj4gPiA+IEJ1dCB3ZSBjYW4gY29udGludWUgd2l0aCB0aGUgZGlz
Y3Vzc2lvbiBhbmQgc2VlIHdoYXQgaXMgdGhlIGJlc3QNCj4gPiA+IGFwcHJvYWNoLg0KPiA+ID4N
Cj4gPiA+IE15IGZpcnN0IHF1ZXN0aW9uIHdvdWxkIGJlOiB3aHkgZG9lcyBMZXZlbDAgbmVlZHMg
dG8ga25vdyB0aGUgc3RvbGVuDQo+ID4gPiBzaXplPyBTbywgd2h5IHdlIGRvbid0IGFkZCB0aGF0
IGluZm9ybWF0aW9uIGFsb25nIHdpdGggdGhlIHF1ZXJ5IHVhcGk/DQo+ID4gQXMgcGFydCBvZiB0
aGVpciBtZW1vcnkgcHJvcGVydHkgQVBJKGRldmljZSBwcm9wZXJ0eSkgaXQgbmVlZHMgdGhlDQo+
ID4gdG90YWwgbWVtb3J5IG9uIHRoZSBjYXJkIG5vdCBqdXN0IHRoZSB1c2FibGUuDQo+ID4NCj4g
PiBodHRwczovL3NwZWMub25lYXBpLmlvL2xldmVsLXplcm8vbGF0ZXN0L3N5c21hbi9hcGkuaHRt
bCNfQ1BQdjROMjB6ZXNfDQo+ID4gbWVtX3Byb3BlcnRpZXNfdDEycGh5c2ljYWxTaXplRQ0KPiA+
DQo+ID4gPg0KPiA+ID4gSXQgd291bGQgYmUgcmVhbGx5IGF3a3dhcmQgdG8gc2VlIGEgdmFsdWUg
aW4gdGhlIHN5c2ZzIGFzIHRvdGFsDQo+ID4gPiBtZW1vcnkgYW5kIGEgY29tcGxldGVseSBkaWZm
ZXJlbnQgdmFsdWUgb24gdGhlIHF1ZXJ5IGlvY2x0PyB0aGlzDQo+ID4gPiBzdG9sZW4gcGFydCBh
cHBhcmVudGx5IG5lZWRzIHRvIGJlIG1vcmUgdHJhbnNwYXJlbnQgdGhlbiwgbm8/IQ0KPiA+IFRo
ZSBxdWVyeSBJT0NUTCBpcyB0byBzaG93IHRoZSB1c2FibGUgbWVtb3J5IGZvciB0aGUgYXBwbGlj
YXRpb24gdG8ga25vdw0KPiBob3cgbXVjaCBpdCBjYW4gcmVxdWVzdCBoZW5jZSBzdG9sZW4gaXMg
cmVtb3ZlZC4NCj4gPiB3aGlsZSB0aGUgc3lzZnMgaXMgbGlrZSBhIGRldmljZSBwcm9wZXJ0eSB0
byBzaG93IHRvdGFsIG1lbW9yeSBvbiBjYXJkLg0KPiANCj4gV2hhdCBhYm91dCBtYWtpbmcgcmVn
aW9uLnRvdGFsX3NpemUgYmUgdGhlIGFjdHVhbCBwaHlzaWNhbCBzaXplLCBhbmQgdGhlbg0KPiBz
L3JlZ2lvbi51c2VkL3JlZ2lvbi5hdmFpbC8gd2hpY2ggaXMgdGhlbiBqdXN0IHRoZSBzdGF0aWMg
dXNhYmxlIHNpemUsIG9yIGlmDQo+IHBlcmZtb25fY2FwYWJsZSgpIGl0IGlzIHRoZSBsaXZlIHVz
YWJsZSBzaXplPw0KDQpJIHRoaW5rIGl0IHNob3VsZCBiZSBvayBLTUQgcG93LCBidXQgbmVlZCBh
Z3JlZW1lbnQgd2l0aCBjb25zdW1lciBvZiB0aGlzLCBJIGhhdmUgZW1haWwgdGhyZWFkIGdvaW5n
IG9uIHRoaXMgYXMgd2VsbCBhcyBvbiBKSVJBIGZpbGVkLiBJIHdpbGwgbG9vcCBldmVyeW9uZSB0
aGVyZS4NCg0KVGVqYXMNCj4gDQo+ID4NCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBBcmF2aW5kLg0K
PiA+ID4NCj4gPiA+Pg0KPiA+ID4+IFRoYW5rcywNCj4gPiA+PiBBcmF2aW5kLg0KPiA+ID4+PiBU
ZWphcw0KPiA+ID4+Pj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+
DQo+ID4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRl
bC5jb20+DQo+ID4gPj4+PiAtLS0NCj4gPiA+Pj4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGls
ZV9zeXNmcy5jIHwgMjMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+Pj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIyIGRlbGV0aW9ucygtKQ0KPiA+ID4+Pj4NCj4gPiA+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jDQo+ID4g
Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPiA+Pj4+IGluZGV4
IDE2Mzc2NjA3YzY4Zi4uMGY4ZDNlN2ZjZTQ2IDEwMDY0NA0KPiA+ID4+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+ID4+Pj4gQEAgLTIwLDIwICsyMCw2IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga29ial90eXBlDQo+ID4gPj4+PiB4ZV90aWxlX3N5c2ZzX2tvYmpfdHlw
ZSA9IHsNCj4gPiA+Pj4+ICAgICAgICAgLnN5c2ZzX29wcyA9ICZrb2JqX3N5c2ZzX29wcywgIH07
DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gLXN0YXRpYyBzc2l6ZV90DQo+ID4gPj4+PiAtcGh5c2ljYWxf
dnJhbV9zaXplX2J5dGVzX3Nob3coc3RydWN0IGRldmljZSAqa2Rldiwgc3RydWN0DQo+ID4gPj4+
PiBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiA+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY2hhciAqYnVmKQ0KPiA+ID4+Pj4gLXsNCj4gPiA+Pj4+IC0gICAgICAgc3RydWN0
IHhlX3RpbGUgKnRpbGUgPSBrb2JqX3RvX3RpbGUoJmtkZXYtPmtvYmopOw0KPiA+ID4+Pj4gLQ0K
PiA+ID4+Pj4gLSAgICAgICByZXR1cm4gc3lzZnNfZW1pdChidWYsICIlbGx1XG4iLCB0aWxlLQ0K
PiA+ID4+Pj4+IG1lbS52cmFtLmFjdHVhbF9waHlzaWNhbF9zaXplKTsNCj4gPiA+Pj4+IC19DQo+
ID4gPj4+PiAtDQo+ID4gPj4+PiAtc3RhdGljIERFVklDRV9BVFRSX1JPKHBoeXNpY2FsX3ZyYW1f
c2l6ZV9ieXRlcyk7DQo+ID4gPj4+PiAtDQo+ID4gPj4+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBh
dHRyaWJ1dGUgKnBoeXNpY2FsX21lbXNpemVfYXR0ciA9DQo+ID4gPj4+PiAtICAgICAgICZkZXZf
YXR0cl9waHlzaWNhbF92cmFtX3NpemVfYnl0ZXMuYXR0cjsNCj4gPiA+Pj4+IC0NCj4gPiA+Pj4+
ICBzdGF0aWMgdm9pZCB0aWxlX3N5c2ZzX2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgdm9p
ZCAqYXJnKSB7DQo+ID4gPj4+PiAgICAgICAgIHN0cnVjdCB4ZV90aWxlICp0aWxlID0gYXJnOyBA
QCAtNjQsMTUgKzUwLDggQEAgdm9pZA0KPiA+ID4+Pj4geGVfdGlsZV9zeXNmc19pbml0KHN0cnVj
dCB4ZV90aWxlICp0aWxlKQ0KPiA+ID4+Pj4NCj4gPiA+Pj4+ICAgICAgICAgdGlsZS0+c3lzZnMg
PSAma3QtPmJhc2U7DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gLSAgICAgICBpZiAoSVNfREdGWCh4ZSkg
JiYgeGUtPmluZm8ucGxhdGZvcm0gIT0gWEVfREcxICYmDQo+ID4gPj4+PiAtICAgICAgICAgICBz
eXNmc19jcmVhdGVfZmlsZSh0aWxlLT5zeXNmcywNCj4gPiA+Pj4+IHBoeXNpY2FsX21lbXNpemVf
YXR0cikpDQo+ID4gPj4+PiAtICAgICAgICAgICAgICAgZHJtX3dhcm4oJnhlLT5kcm0sDQo+ID4g
Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgIlN5c2ZzIGNyZWF0aW9uIHRvIHJlYWQgYWRk
cl9yYW5nZSBwZXINCj4gPiA+Pj4+IHRpbGUgZmFpbGVkXG4iKTsNCj4gPiA+Pj4+IC0NCj4gPiA+
Pj4+ICAgICAgICAgZXJyID0gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZ4ZS0+ZHJtLCB0aWxl
X3N5c2ZzX2ZpbmksDQo+ID4gPj4+PiB0aWxlKTsNCj4gPiA+Pj4+IC0gICAgICAgaWYgKGVycikg
ew0KPiA+ID4+Pj4gKyAgICAgICBpZiAoZXJyKQ0KPiA+ID4+Pj4gICAgICAgICAgICAgICAgIGRy
bV93YXJuKCZ4ZS0+ZHJtLCAiJXM6IGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldA0KPiA+ID4+Pj4g
ZmFpbGVkLCBlcnI6ICVkXG4iLA0KPiA+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIF9f
ZnVuY19fLCBlcnIpOw0KPiA+ID4+Pj4gLSAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiA+Pj4+
IC0gICAgICAgfQ0KPiA+ID4+Pj4gIH0NCj4gPiA+Pj4+IC0tDQo+ID4gPj4+PiAyLjQzLjANCg==
