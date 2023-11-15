Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C77C47072
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 10:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5027010E541;
	Wed, 15 Nov 2023 10:40:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913410E541
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700044834; x=1731580834;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Bvdv88eNAUnKskB6u3cJxW4bt0XuNS+qTWCvp9wk12I=;
 b=bNZN+dWbRzMbVWdOTxXULtPp2xaztz7R7lEdTW+yaAEZHlHtRWxi8IwG
 EG9f6E/ko3kvXr1r4fW/eFMFphqOzRA2xRYBd4FXxrC7U5o41x/CJED5z
 Bwv1jcS651TZfuzxRm6MjpEr4jLCQOE+4ygA3nFjpxWM+OrE1CPnbk4BR
 OL85ZMSxMG6ek+Cxh2CkkLhuGJvn09lHIiZN7UHKopGKXR6lLm7ftUJ44
 ZqC9X1ob/LoZX3OAK2zQwVnCrlAKIN+ii8lDNxBGRjagS8Jr6eQeYHo1a
 Oe7SXvVrFkNkfPSK5Meu2GCGiCGaVTmQQb8M1wvhoONfq6BC0/lZilXyO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="477074570"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="477074570"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 02:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096415660"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="1096415660"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 02:40:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 02:40:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 02:40:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 02:40:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 02:40:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMFY/vCqS58kf1YxtCiTeMqbytZ2/R56IRDUGLuKpQvUDwwiOvJKKFCEAZ7zMzAB0CVNIAvsVX6y5OhlxBB4sNVo2JW2ehzbwPOumY2bTqbmtxSUebociwL9l+FfCqiaYox76sK+ZzcO1fjhSQovPJBYlJBsQ8SlpvHlrsMaexuR7eLltdv6wtZ59CaMH9dRdJQIqiujJ0ZStjgPSaw8nX62lXt1Mx1zxdxCHc6WeV9X9vldWCeHgHHsf5dvD40s0WRkl1BTs2Xz6Cs49fHQUa5UJkRSYRG9fZtFbMvfym9MRvXYBUb4uBfTZ2ZsLxzOBNCjV9/5B6Jxihb2xVrVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bvdv88eNAUnKskB6u3cJxW4bt0XuNS+qTWCvp9wk12I=;
 b=doLe6n9pXF3UYueoKdiACV1X2XEE0PKhbyCMr/tS4Wrs34n7CgtGJFlH9c5790ADX6MG1wNvKm8jmme2Zn9faw52OH/lSo/P0Npiu/IoESj2OPXYZzcT4+VykhBuWLZH7Z7HJRlj5DqJfEGlat2D1eJ5GDZEnYzzC44fs8RCRDgv6pcJM8rZkfTqhZBYaITu6VcSgkXHMKrurHVIxyjHMeWzVNjoHk1ofMvWEgLFDSnYZK3wKjPeIUPuC13e/XWGUDp1budZipXdkZUf/Lu20oHDan5fW1zle7IMrrNoEkDROaUWFDRc2V7rH7UhPvTPKksJ2mk1oPK4t86fK9BkQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 10:40:29 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 10:40:29 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/3] Split i915-display and xe-display patches
Thread-Index: AQHaF7AmJK/G40LtyEiI75D7WWpRrQ==
Date: Wed, 15 Nov 2023 10:40:29 +0000
Message-ID: <9099fc3c8caa098abd7595211b05f76bcd95261b.camel@intel.com>
References: <20231114211233.498338-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231114211233.498338-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA2PR11MB5081:EE_
x-ms-office365-filtering-correlation-id: ff57fee2-bef2-4f25-35b7-08dbe5c74977
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GpESMu2DiOpAslgSFjM3c0fxS0pr0SPOD9fEBbTmcsflwSo+ekSSGed1V38FE64r+ZGfULpqLpS2kIqr3ty69QG4+l9SX3cALY+noD8mBQFkhdM5BLdp/g1M1rslnep8MZLSLulQue0BM3uUT4Wd6tb7m7pGEgMYwJMLZthzeRFB7+zYQFchc28xmcsEOX492pFykiTcc24O4iIlvRKGwg6FBmLcIKzAOLYxbcSQa4HsFIDYSZgQMpf/vIJp3sC/IwjPw06SZs/u+N7AzIwQwbLg6UtE4KiN/5RCtCbvp65zjFs7i2j6BrEFNtl5mlNUfS/8XgOfwQB5pppPdny/zmi6xRX0kWRnLoSV5DWL/hwqoAOnzhU0m+it2Quk4arbPE5EBzERQoXLnA7SU46+12+h3c8BM3wyLse3aANmwgKYPTQm8KYtg7H9Nh+Py1zPqZfTF2sIlti12CQkA+t8T4LKln2qo2FgE9M9/Sp574dk5KfwbA+7waTtco776PTzXiKx5SdH0TZk+cNSyOsGMgJjmr/pgejcU4IYEHon8E714ixlnwqeYM26uPejd518w9Y3gOs8wco7Iqbn7qiap6BnTVKWOlIMla/nXhp6xtAM3pz6N4xzM0PLrclW6+6G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38070700009)(86362001)(316002)(36756003)(110136005)(76116006)(66899024)(91956017)(66946007)(66446008)(66476007)(64756008)(66556008)(6636002)(71200400001)(8676002)(8936002)(4744005)(26005)(4001150100001)(2906002)(41300700001)(6512007)(2616005)(5660300002)(6506007)(82960400001)(6486002)(478600001)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzN3dE5Pcmk2cXRQODQyL1pWYlM1TnM4SjRXWldzQjZtNitsME1lc0ptMm1p?=
 =?utf-8?B?dWNjQWlNUEUxZFpxQ0RQbmoyelBOeUFSU0tlMGRydXloZE1mdTBPMVlVa2VH?=
 =?utf-8?B?bjZwK1BoOEtBSG4rclBCTVBkK1MrVEZQZVhvSjlHSkRnK0ZZeGsrZTZoK0VO?=
 =?utf-8?B?akQ2S2tISHlZU3RSakFzYmFNVHZUcWg5YTIrUU5pdng0SHJObWwyMzlqR3Na?=
 =?utf-8?B?U2ZNOUU4NmxXNk9xSHFiTGt1d2lqckxkSGlhN0ZoVXBTcGF0ZndzbmhtdXA5?=
 =?utf-8?B?dFMzMW8zWjEwYkcxeGRSS29VNzZFUGtxcW9rL2VnSUxWNUJQRzNBZEk2NENP?=
 =?utf-8?B?QWZaSi9PU0FHamk4UTIwb0VWWEQwVCt4QkM4WkU1NUcyMVF5TXZsTHhhRmt2?=
 =?utf-8?B?SXhkNk5vSFBiVlpUaDVCcW12TEk5aVpQbWsxZ0VIZFBNVk8zanVLT2grcG5z?=
 =?utf-8?B?YlBlazdBc1IrV2Q5YzlZamxRWUdmM3lMU2lwMWtXWVQvZ0hQbXlEb0xRMDM5?=
 =?utf-8?B?ZmI0OW4wbVlha0JNSVhoRlQ3aWEwaFJQZ2t5b0dQUlVhc3ozV3o3d1BGL0RT?=
 =?utf-8?B?QUVLTFovNnU3VnJNZHg3VjMrZDdLQXFEdGxFZm4rdlh4OERZQzl2YU5uV0xr?=
 =?utf-8?B?TlErZzZkc2cvVXUraGJuMmZ3RjdkV1RRdStXN2VQODJmQWNrYis0WksvRUJ5?=
 =?utf-8?B?WlQ5WC9TV2ZxT29HUlB5T1ZyM1RCTnRTSkdFV2dCZERvZ3RuajBzR3BTT05m?=
 =?utf-8?B?K1JmSStFRWdUTFllaTgrSjM3OG9jdGVnb05MbEJpeVpZQnJWaTI2OTRoTDFj?=
 =?utf-8?B?MFlpTWYyc3dWMldCZFl1bXlWQVY3UXp5U1FtT0VOZDVhMG9WQnpsKzlZRXFS?=
 =?utf-8?B?MEw2UmF3c0xPSkVTWFFSZEd0TmZyMW5KS0dRTWsrNEdLRVFkdnAxaDhSWTYr?=
 =?utf-8?B?Q3YxRFRURE8wRXdqNGFrNDFTNm5SbFRMNTlPS2VlUWRtdi9CZDkzakN2aEEy?=
 =?utf-8?B?cS90VEo4eDA2TzdZSTgwbmRmU1EzNFpzN0lpMU00YkxUUi9ST3Y2MURlNW94?=
 =?utf-8?B?NUpkQlR1SW4zOURKNUdrTlIxUVJCRW5HSUpxSGZyS1dmL0o0ek9GWWJFM2ZW?=
 =?utf-8?B?MU9XTld3cEhQNXBvS0xKdnFjdy8wQnlVUkZ2eStPY092dEhROGY2czlvS2ZB?=
 =?utf-8?B?cy9WVUNsS2M4M24wRXhuOURJV3lLNjJPaXFUQ1ZCRFRPWU9TT0R3L2VaRlRm?=
 =?utf-8?B?WU1nT3dGQnEveGhYMFpneC9FRWN1T0FWUnZOcHJSOFBQNGVmLzAvVlFMeEcx?=
 =?utf-8?B?ZW1saWdMZCtJT2RQd1gydXBId2dSbCtiMXlNSE4yZTdmRVRGZHlKSS9LNmoz?=
 =?utf-8?B?dTdsWURlNUNDOEs0Y1I1dDZ6b3FHRXpuWkRuNnQxTjlEbkNoR3dyWHRocmlz?=
 =?utf-8?B?b0dHdlBJOFBXbzJOaGlBMXowcEJUYzJEaTZwcElpN1plZ1hXbWtYTURadWxT?=
 =?utf-8?B?eG1IQlpTL1R3d3JSU3pZeU5oOVZ0dnp1TXdnNFViZDlxaUF6VUc0bno2Z2pG?=
 =?utf-8?B?MjNnOVFTK05HYk1yU3E4bXo5OVFyMFRIeWdDZEVHOTE2RkNQSHlGZ09rTzlp?=
 =?utf-8?B?enpzTWFrQjNuTGhjVFhEaTBqb1E1WnZhdEV3bXdZUEdSS210ZjAzTm5NdEZp?=
 =?utf-8?B?b3BRWkt5NW9hblY2QjI2VHNWZzhSVTM5MFNQdXA3TTNIY0ZUOVV1Z1NVbFdB?=
 =?utf-8?B?ZUd6OTJ5ZWU5NkcwVlZTTXZTRTJGMDZ4eEdlWWp3azR3M285a1JGMnRHYWFZ?=
 =?utf-8?B?M25Yd1FEdU00OEtGVVlqdHNPdWlXNFpHUUhJZ0N1Y3NXeUp4NVJzOG1oa0FW?=
 =?utf-8?B?eG9lVzFFdHFUTmIzc1pVM1ptUWtJeUk2a2kzVGZ6VmFMdyt6K29ZUTJUNGhx?=
 =?utf-8?B?ZEUrSFZYaUx1clRoU054VHZTdmRQcnFpQlBqajhnY0hWbmR0TkRONnhyYnNj?=
 =?utf-8?B?WG5FVUg5MkY4OE9sdjkxY0pQYSs1YXlpTzZUc3h6clEwdWQ3Tk9YYTdiVFRo?=
 =?utf-8?B?TVNrNWlGdUFGdTBjUU91UTRTUWZxYkY0NC9kTHd2clVVZjBLcHBQam1HeS9Y?=
 =?utf-8?B?Ly9qMEE3dmoyN1F4MFpTOWkzOFBreFdmU3RXT2FEY0dFVDBFY3pmK3laV3Q0?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12F97249A5C2C741BFC02E4B977031CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff57fee2-bef2-4f25-35b7-08dbe5c74977
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 10:40:29.6618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BvV+92Xc0EFbzCF2xAjlhFQRvnRAoay3GDE4fgyKjFpxlJBMadpyrOc71TN+UHL0xYMmHSHB3WGTlEh81n4UxQXvdDbVmg94m4WZ4qNjd0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] Split i915-display and xe-display patches
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

T24gVHVlLCAyMDIzLTExLTE0IGF0IDE2OjEyIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IFdlIGNhbm5vdCBoYXZlIHRoaXMgcGF0Y2ggYXMgaXMgYmVjYXVzZSBpdCBpcyB0b3VjaGluZyBi
b3RoIGk5MTUgYW5kDQo+IHhlIGluIHRoZSBzYW1lIHBhdGNoIGFuZCBhbHNvIGJlY2F1c2UgdGhl
IGNoYW5nZSBpbiBpOTE1IGlzIHBhcnQNCj4gb2YgdGhlIGNvbW1pdCAoIkZJWE1FOiBkcm0vaTkx
NS9kaXNwbGF5OiBSZW1haW5pbmcgY2hhbmdlcyB0byBtYWtlIHhlDQo+IGNvbXBpbGUiKQ0KPiB0
aGF0IGlzIGdldHRpbmcgc3BsaXQgYW5kIGNsZWFuZWQtdXAuDQo+IA0KPiBJbnN0ZWFkLCBsZXQn
cyBzcXVhc2ggdGhlc2UgY2hhbmdlcyB0byB0aGUgb3JpZ2luYWwgcGF0Y2hlcyBhbmQgdGhlbg0K
PiBkZWFsIHdpdGggdGhlIGk5MTUncyBGSVhNRSBwYXRjaCBsYXRlci4NCg0KRm9yIHRoZSB3aG9s
ZSBzZXJpZXM6DQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVy
QGludGVsLmNvbT4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBSb2RyaWdvIFZp
dmkgKDMpOg0KPiDCoCBSZXZlcnQgImRybS94ZS9kaXNwbGF5OiBBbGxvdyBzY2Fub3V0IG9mIGJv
cyB0aGF0IGNhbiBiZSBtaWdyYXRlZA0KPiB0bw0KPiDCoMKgwqAgbG1lbSINCj4gwqAgZml4dXAh
IEZJWE1FOiBkcm0vaTkxNS9kaXNwbGF5OiBSZW1haW5pbmcgY2hhbmdlcyB0byBtYWtlIHhlDQo+
IGNvbXBpbGUNCj4gwqAgZml4dXAhIGRybS94ZS9kaXNwbGF5OiBJbXBsZW1lbnQgZGlzcGxheSBz
dXBwb3J0DQo+IA0KPiANCg0K
