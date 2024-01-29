Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046BCC47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 20:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD2E112AE9;
	Mon, 29 Jan 2024 20:17:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB5E112690
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 20:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706559433; x=1738095433;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=FsMudJ4kGlLa6apiBx4H8UF0B/o3xEOScv0zNvXrb/k=;
 b=cLJ+aWs/Elg58s2yz0im1X6TOGVWQtm5dV0X3hvv95XHqty7CVVllh/8
 wdB5thkX3+a9geyAU3rbTHGfInZn17YfX5N2DlJTbIe2SYTDRKmvReGTD
 Y5WhB+iezg+eRaNSkKR14ee3TNu67KMmdkMQv5ZxirvPB7HOZ1ryTXFEZ
 9AgTgoF0un/ZvWt3IGWBLQ6EToqf5WSCvZ2FMTaGdyxwGa9gcqmeOqsb4
 8OnAWSnIWlOCZ6kAjFzAcIPkIWGuKA+H7/ursrSbqXhoefmtyDCeMtE3N
 XhDXhJWNAWwBI22MpPdRSa3y2Zs4MIBiS27ndCg9s6Gi6rV6L07fc5bKM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="21600712"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21600712"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 12:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3509121"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 12:17:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 12:17:09 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 12:17:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 12:17:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 12:17:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az4RtxqfTbdybLYrCn4x4kZxRw7eb04cC+TLAP59jFzw9/AxtOcyY3rVSQM/f2PnkPCmfjLAJ/eI6rx1CKyFoIhzpautJT+2BENTlTnSoSqPLWh/1VB4amDEyziKhrcEq+rcI1rEAoTPdZ/94mPZ65CdD2QcpPGoREUWOI4CvCYB/ku4cJsr7t/33Z1+2Rb9HPHHhHLh0obMSd5RL5RhrqCoJJrEFGE0cYEH7f2Hnxr5IoK7bOTWa6oxbu7uY/M+UvYV2dNghcjjStsV1zIVDYWz3H9Cuqshp3ltoVO0xU+dSp0SFu9k2eovIksb7TnG7yMZuAAYxmw/X9fm+uQ5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsMudJ4kGlLa6apiBx4H8UF0B/o3xEOScv0zNvXrb/k=;
 b=POb2W1ZaJhfArqBW5GZ4/egX68WFZtXTg5yWLzNmyCNe4e8/v6MaWtFRjRcruevpsKPHVNFaG1MGW95/SRlXg7O2kddLWXDI0Q5LzZorLZcAmBQ7Izgi7HG38k8VYRwn8UVzhHoFyiSglmlWqcq9ycM1nbJyihck1+09G39WKFDfBZ28XXnEHyELzyzpv7sEPL8vFhwAV6s+6DE76XmRGJEj4qkWNE9MgaiVLlry/hCDPZkZeQso+RyONMIcmpuI+TYvIt5IvwWPIKqRhcl3KJuVEZGMkay8tk76bpuNRLIeGqHJRf8n4cmZaN5gchu0gjPY0oARm/YK4UGf9FpcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Mon, 29 Jan 2024 20:17:07 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 20:17:07 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Expose number of dss per group and
 helpers
Thread-Topic: [PATCH v2 1/1] drm/xe/guc: Expose number of dss per group and
 helpers
Thread-Index: AQHaUK6uHDH/qoKNmEiDAFEJ7Yxp/LDxPuOA
Date: Mon, 29 Jan 2024 20:17:07 +0000
Message-ID: <c1dceee5cc5b45d8924302feda41264375f96345.camel@intel.com>
References: <20240126232308.305358-1-zhanjun.dong@intel.com>
 <20240126232308.305358-2-zhanjun.dong@intel.com>
In-Reply-To: <20240126232308.305358-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA3PR11MB7436:EE_
x-ms-office365-filtering-correlation-id: 7e14b00c-b2b4-460b-5bec-08dc21074440
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xoCEsgw2hTIm2N3a1DbVc782q6noUQwsfAEL1+S8NfgAgpg5s1EMBRToSUS6LZCkuxiFN6qxQmHMVC9rbV/7eDdvIYdPU+kU/3FYvDwlXz3kQeKiivF/yA13LjRDW3A8+YCc5Bk9F1mt8psZVa5cx3moFcUX3euIOvH3DOaDlYFpjZQQiH4Cx2SyAdeiBH2X3q8F8DthE7Wu/uMwBqjh5GeulnjO8bWOaD0h81zkawxJFPHHh3zMj1bGAbKTVzdTnv7jqpbCn34RnN1lJtqLQuwcpZXnlD2iZa/jLlktLholIgisT+dhn8i9pQptcFYprrjMaXnf0rwNT97i2QeoZnWwxL0Utkv0TcmtQm+H0IjaN1rCFqaUTwvSv/L5lFlg5IbCUkqJ/xtWv8LdeyK1RmEMtRzGn8jkmX+9eGCDy7BtZIigh9gryUh/7R/hIthZ8+gok3DNPVHwM3oVj8Id/Z5+rtd4s9XVyAptpzz7eJ0NEZo16EKJEXAAuu0jach6VXBZCa088336pqjMiVbHm9oPEKjyg4IZmJqFllrn1SP2q9fW5xkwmkfIuFMCgdT+mTmsXRq9V7kHCYVCNfG//+WLHuFIbJwGjvjbx9ldhomNqH/0uRX5nK9ZrE5KsNRX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(110136005)(316002)(76116006)(2616005)(83380400001)(6512007)(6506007)(66476007)(66556008)(66946007)(64756008)(66446008)(8676002)(122000001)(82960400001)(6486002)(26005)(38100700002)(8936002)(71200400001)(478600001)(2906002)(5660300002)(38070700009)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SllTcHp6bkYwd0k5RzQ1MEhIZE1PQSt2N0lxYWdmYm5XSEw3bGpUZEJJNnBu?=
 =?utf-8?B?TE1weVNOTU94TFhoejVaRDJsdWtRbFB5M0ZKL3lkOU1sOFJOdW1BbGNEZzQz?=
 =?utf-8?B?aE4vTzkvWFFaWkVabGdQa0V6ZDlRd3BEQzZzWVc1UFoxUWlGcEVuVXUvUHkw?=
 =?utf-8?B?TkJSYTFTRUZ0SktJWEZNWkxBcXZRWEpaYnIyVEVmM2g4OEhzNDgvYTJ5RkRY?=
 =?utf-8?B?MllvcUVKZDJvZ056Mmpvdms2N2hXVzdpbExQbUlGTzdsUzZtc211NVdMZkhC?=
 =?utf-8?B?eEcvYXViNDBCb004TlFpQnlwTlg2emJ3eDE4N1gyaEp0NWhKd0g0b2NhMEFG?=
 =?utf-8?B?MndPUmh2UEtqQ2c4bVVlWHVYTTZSM3NKaHlhci9MMUZwNzltaTdrcUZNWklL?=
 =?utf-8?B?Z1JraUtNeTlQWmdFSXF1REI4N3YyNFRPazVvWjlOS2FhVkh6TWNYVk5uOFJL?=
 =?utf-8?B?WkJ4SVpjT0s3WTE0bDFXWGRqc1Y4eXBGTHJZQ0VVUmUvNDdqaWNOWVROdHlR?=
 =?utf-8?B?TW9FNE44dWlrOS9CWTNDZGpBV3h3Zm5PNmRIOEtNc0ZjeE96Uk9QRHk5VVdR?=
 =?utf-8?B?N20xRDBvZWxHUlVlWDRRZU4wazlvdFlxTzZFN3JMMllyMDRZYVZnb3JoYSta?=
 =?utf-8?B?WGM4cTJuUDZuYmVESTlKdDhpU1NpNUo0TUVCb3BEVDNoMnhNV2NYdVByU2pJ?=
 =?utf-8?B?QWRub2orNUVqazU1d0l4SEg5dzJlNHhIdFFGRzJCRUJWMDRJYmczd2pKQUR1?=
 =?utf-8?B?ekkxOVdTT2hKbzNnZVh4K0ZCZm1VZm1nbHRNZnQ1VUQ3bTEydjRLWjNKR21U?=
 =?utf-8?B?dXZxOSs5bU5wZUhsQjhwemthOUNyY1pzZlV4L051ZWJxK3ZXQXZOWHBPZU9W?=
 =?utf-8?B?azgxUmxRZkhhY0JGYmhXNjF6QlJ2YVBTRzFqYzdIZUpHMmpMMG51U1VVUlU5?=
 =?utf-8?B?OWNHR3QwRVAyb2VPVm1MU3Z6RE9wRUdZcG9rSnpycFF6alEwQSsvQldoY1RB?=
 =?utf-8?B?TVF2elcvRUNiTkJIQ3NnZ0MxaUhRbTNldzI2eXVFdlVFcDczdTBzTEhLZ2J4?=
 =?utf-8?B?OWRCQnVrSXR0MXRuK012aFM0Qmx0MG14UGc1SjVXUlQ0cmF4Sy9GejBRQUdN?=
 =?utf-8?B?YnVwYW1JOWdPa2NmYitzZXNMeXdodzdMTERKNStOSTUzMlNGQnZta2tqS0No?=
 =?utf-8?B?elc5MEJYN0Z3aDJNb21JcklwdXhkQjVZd0MvajU3eXhRdGRqWTNvcGwvcHRk?=
 =?utf-8?B?NjBtUUE1S09LQXo0M0lnZzk5Sm9Sd3F2SWZwRVg4bEJmQnNMU0FmVnUzWW5Z?=
 =?utf-8?B?UFRXZzdsTWVWMk8wUUZaUEZwVGRKS2ViZkRoVEVvYzRaYVBMZmpsVkdIRHNG?=
 =?utf-8?B?UEhCSkliZHhGamRjbTVjenU0T25QRGxQck84MSswS1RBbVEvdmJwNXAvWE1K?=
 =?utf-8?B?WVpNVTlmbUIrcnF5V1VtSmNoRm8vYTdzZ3BjRlh6RW9vNHFvUUFjZytlc1dH?=
 =?utf-8?B?RVhGUUNuZkVmWDZJZTFRRE5YeDZ2UGRVd21nQ1M2OTRFWGhmeFRvU2lYZ25E?=
 =?utf-8?B?ZlF0MkNLSmg5bk5WRWp0OVdrUDduZnVJWDBEZGw5UWJKbHNRekhCK05xREJq?=
 =?utf-8?B?U3JSWEdEVHFPK0QvY1NySytoNm5xMjZnRDNmbDBqOXlwMnpTMFdzV3YwNlgy?=
 =?utf-8?B?MVlJT1J1cEhBeUs5Slptazh2OUdCc3UwRlA4TzZhV1Z3MkI5R3ZkV2tGdFRM?=
 =?utf-8?B?VkR3N0dFMFdTaVVCcjBDR3RKb3E0U3VyNXVLMEt6WkU1WW5Kb01IVXdwcWF3?=
 =?utf-8?B?RlBXUklqazg4Q1pQV2pxWHBzbStmc2ZHWGdEU1NDU2kyNDBWcnVTNHBtRVMy?=
 =?utf-8?B?RlFsV2JEOXk4UFhGYUwzM01wNTZQbHhidVQ0dUwydVNyakJFUUNTSmtKdytZ?=
 =?utf-8?B?Q1JFa3h0U2xRSlA5UmRabmtGYStpcUN6ZnhxK1FDLytyY3A1Zi9OeE9PMFdy?=
 =?utf-8?B?TjlnYmM0M1doRk13NWd0eWt2aW55MjVXZ2h3SnJ1VlBCRTZMYS9hVnVobXNO?=
 =?utf-8?B?cHpySWhqS1lIcXY5RldWYUZNSXVCa3BhVC90VUFKSlo1SGdMallhUVFqWWhX?=
 =?utf-8?B?TUdaWnIxcW9SbFdla1RJdm1VUXlzUWc5eTVFRHkvK1FJNUZJQzFJdC9QOXBq?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D60D4E0880E7947BAEA28EB17132AE7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e14b00c-b2b4-460b-5bec-08dc21074440
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 20:17:07.3035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEWV6EZneoPzl1NMNIJ1A8q8ZF16q/DWmtVf+1QL1bTWGiQSkX2SQpfpEs+EPEpQdODsvL0DYEVncUQrVbkca4Z0YlsK3mF/3p7bLWPWjp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI0LTAxLTI2IGF0IDE1OjIzIC0wODAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IEV4cG9zZSBoZWxwZXIgZm9yIGRzcyBwZXIgZ3JvdXAgb2YgbWNyLCBmZWF0dXJlcyBsaWtlIEd1
QyByZWdpc3Rlcg0KPiBjYXB0dXJlIHdpbGwgbmVlZCB0aGlzIGluZm8gdG8gcHJlcGFyZSBidWZm
ZXIgcmVxdWlyZWQuDQoNCkkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHRoaXMgc3BlY2lmaWNhbGx5
IGhhcyB0byBkbyB3aXRoIEd1Qy4gQ2FuIHdlDQpqdXN0IGxpc3QgdGhpcyBhcyBnZW5lcmFsIGZ1
bmN0aW9uYWxpdHksIG5vdCByZWxhdGVkIHRvIEd1QyAoY292ZXINCmxldHRlcikgb3IgTUNSIChm
dW5jdGlvbiBuYW1lcywgc2VlIGJlbG93KT8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1
biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfbWNyLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAzOA0KPiArKysrKysrKysrKysr
KysrKysrKysrKystDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5owqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTcgKysrKysrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
dG9wb2xvZ3kuY8KgwqDCoMKgIHzCoCAzIC0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3
X2VuZ2luZV90eXBlcy5oIHzCoCAzICsrDQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9tY3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYw0KPiBp
bmRleCA3NzkyNWIzNWNmOGQuLmY3MDAyNjIzZjNiNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X21jci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9t
Y3IuYw0KPiBAQCAtMjkxLDExICsyOTEsMTYgQEAgc3RhdGljIHZvaWQgaW5pdF9zdGVlcmluZ19t
c2xpY2Uoc3RydWN0IHhlX2d0DQo+ICpndCkNCj4gwqDCoMKgwqDCoMKgwqDCoGd0LT5zdGVlcmlu
Z1tMTkNGXS5pbnN0YW5jZV90YXJnZXQgPSAwO8KgwqDCoMKgwqDCoMKgwqDCoC8qIHVudXNlZCAq
Lw0KPiDCoH0NCj4gwqANCj4gK2ludCB4ZV9ndF9tY3JfZ2V0X2Rzc19wZXJfZ3JvdXAoc3RydWN0
IHhlX2d0ICpndCkNCg0KSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB3ZSdyZSB0eWluZyB0aGlzIG5h
bWUgdG8gTUNSLiBEU1MgYXJlIGludm9sdmVkDQppbiBtb3JlIHRoYW4ganVzdCBNQ1IgbmVnb3Rp
YXRpb24vY29uZmlndXJhdGlvbi4NCg0KSSBndWVzcyBub3QgYSBibG9ja2VyLCBidXQgSSdkIHJh
dGhlciB0aGlzIGp1c3QgYmUgc29tZXRoaW5nIGxpa2U6DQp4ZV9ndF9nZXRfZHNzX3Blcl9ncm91
cCgpDQoNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGd0X3RvX3hlKGd0KS0+aW5mby5w
bGF0Zm9ybSA9PSBYRV9QVkMgPyA4IDogNDsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyB2b2lkIGlu
aXRfc3RlZXJpbmdfZHNzKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDC
oMKgdW5zaWduZWQgaW50IGRzcyA9IG1pbih4ZV9kc3NfbWFza19ncm91cF9mZnMoZ3QtDQo+ID5m
dXNlX3RvcG8uZ19kc3NfbWFzaywgMCwgMCksDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9kc3NfbWFza19ncm91cF9mZnMo
Z3QtDQo+ID5mdXNlX3RvcG8uY19kc3NfbWFzaywgMCwgMCkpOw0KPiAtwqDCoMKgwqDCoMKgwqB1
bnNpZ25lZCBpbnQgZHNzX3Blcl9ncnAgPSBndF90b194ZShndCktPmluZm8ucGxhdGZvcm0gPT0N
Cj4gWEVfUFZDID8gOCA6IDQ7DQo+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBkc3NfcGVy
X2dycCA9IHhlX2d0X21jcl9nZXRfZHNzX3Blcl9ncm91cChndCk7DQo+IMKgDQo+IMKgwqDCoMKg
wqDCoMKgwqBndC0+c3RlZXJpbmdbRFNTXS5ncm91cF90YXJnZXQgPSBkc3MgLyBkc3NfcGVyX2dy
cDsNCj4gwqDCoMKgwqDCoMKgwqDCoGd0LT5zdGVlcmluZ1tEU1NdLmluc3RhbmNlX3RhcmdldCA9
IGRzcyAlIGRzc19wZXJfZ3JwOw0KPiBAQCAtNjgzLDMgKzY4OCwzNCBAQCB2b2lkIHhlX2d0X21j
cl9zdGVlcmluZ19kdW1wKHN0cnVjdCB4ZV9ndCAqZ3QsDQo+IHN0cnVjdCBkcm1fcHJpbnRlciAq
cCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+IMKgwqDCoMKgwqDCoMKg
wqB9DQo+IMKgfQ0KPiArDQo+ICsvKioNCj4gKyAqIHhlX2d0X21jcl9nZXRfc3Nfc3RlZXJpbmcg
LSByZXR1cm5zIHRoZSBncm91cC9pbnN0YW5jZSBzdGVlcmluZw0KPiBmb3IgYSBTUw0KPiArICog
QGd0OiBHVCBzdHJ1Y3R1cmUNCj4gKyAqIEBkc3M6IERTUyBJRCB0byBvYnRhaW4gc3RlZXJpbmcg
Zm9yDQo+ICsgKiBAZ3JvdXA6IHBvaW50ZXIgdG8gc3RvcmFnZSBmb3Igc3RlZXJpbmcgZ3JvdXAg
SUQNCj4gKyAqIEBpbnN0YW5jZTogcG9pbnRlciB0byBzdG9yYWdlIGZvciBzdGVlcmluZyBpbnN0
YW5jZSBJRA0KPiArICoNCj4gKyAqIFJldHVybnMgdGhlIHN0ZWVyaW5nIElEcyAodmlhIHRoZSBA
Z3JvdXAgYW5kIEBpbnN0YW5jZQ0KPiBwYXJhbWV0ZXJzKSB0aGF0DQo+ICsgKiBjb3JyZXNwb25k
IHRvIGEgc3BlY2lmaWMgc3Vic2xpY2UvRFNTIElELg0KPiArICovDQo+ICt2b2lkIHhlX2d0X21j
cl9nZXRfc3Nfc3RlZXJpbmcoc3RydWN0IHhlX2d0ICpndCwgdW5zaWduZWQgaW50IGRzcywNCj4g
dW5zaWduZWQgaW50ICpncm91cCwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50ICppbnN0YW5jZSkNCj4gK3sN
Cj4gK8KgwqDCoMKgwqDCoMKgaW50IGRzc19wZXJfZ3JwID0geGVfZ3RfbWNyX2dldF9kc3NfcGVy
X2dyb3VwKGd0KTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAqZ3JvdXAgPSBkc3MgLyBkc3NfcGVy
X2dycDsNCj4gK8KgwqDCoMKgwqDCoMKgKmluc3RhbmNlID0gZHNzICUgZHNzX3Blcl9ncnA7DQo+
ICt9DQo+ICsNCj4gK2Jvb2wgeGVfZ3RfbWNyX2Rzc19oYXNfc3Vic2xpY2Uoc3RydWN0IHhlX2d0
ICpndCwgaW50IHNsaWNlLCBpbnQNCj4gc3Vic2xpY2UpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDC
oGludCBkc3NfcGVyX2dycCA9IHhlX2d0X21jcl9nZXRfZHNzX3Blcl9ncm91cChndCk7DQo+ICvC
oMKgwqDCoMKgwqDCoGludCBpbmRleCA9IHNsaWNlICogZHNzX3Blcl9ncnAgKyBzdWJzbGljZTsN
Cj4gKw0KPiArwqDCoMKgwqDCoMKgwqBpZiAoaW5kZXggPj0gWEVfTUFYX0RTU19GVVNFX0JJVFMp
DQoNCk1heWJlIGludGVyZXN0aW5nIHRvIHByaW50IHNvbWV0aGluZyBoZXJlIGZyb20gYSBkZWJ1
Z2dpbmcgcGVyc3BlY3RpdmUsDQplc3BlY2lhbGx5IG9uIHByZS1zaWxpY29uIHdoZXJlIG1heWJl
IHRoZSBmdXNlIHJlZ2lzdGVycyBhcmVuJ3Qgc2V0IHVwDQpjb3JyZWN0bHkuIE90aGVyd2lzZSBp
dCdzIGEgYml0IG9mIGEgZ29vc2UgY2hhc2UgdHJ5aW5nIHRvIHRyYWNrIGRvd24NCndoeSB0aGUg
RFNTIGNvdW50IGlzIDAsIGV0Yy4NCg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIGZhbHNlOw0KPiArwqDCoMKgwqDCoMKgwqBlbHNlDQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gdGVzdF9iaXQoaW5kZXgsIGd0LT5mdXNlX3RvcG8uZ19kc3Nf
bWFzaykgfHwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0
ZXN0X2JpdChpbmRleCwgZ3QtPmZ1c2VfdG9wby5jX2Rzc19tYXNrKTsNCj4gK30NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaA0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9tY3IuaA0KPiBpbmRleCAyN2NhMWJjODgwYTAuLjEzNjViM2U3NzIyNiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaA0KPiBAQCAtNyw2ICs3LDcgQEANCj4gwqAjZGVmaW5l
IF9YRV9HVF9NQ1JfSF8NCj4gwqANCj4gwqAjaW5jbHVkZSAicmVncy94ZV9yZWdfZGVmcy5oIg0K
PiArI2luY2x1ZGUgInhlX2d0X3R5cGVzLmgiDQo+IMKgDQo+IMKgc3RydWN0IGRybV9wcmludGVy
Ow0KPiDCoHN0cnVjdCB4ZV9ndDsNCj4gQEAgLTI1LDUgKzI2LDIxIEBAIHZvaWQgeGVfZ3RfbWNy
X211bHRpY2FzdF93cml0ZShzdHJ1Y3QgeGVfZ3QgKmd0LA0KPiBzdHJ1Y3QgeGVfcmVnX21jciBt
Y3JfcmVnLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdTMyIHZhbHVlKTsNCj4gwqANCj4gwqB2b2lkIHhlX2d0X21jcl9zdGVl
cmluZ19kdW1wKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBkcm1fcHJpbnRlcg0KPiAqcCk7DQo+
ICtpbnQgeGVfZ3RfbWNyX2dldF9kc3NfcGVyX2dyb3VwKHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiAr
dm9pZCB4ZV9ndF9tY3JfZ2V0X3NzX3N0ZWVyaW5nKHN0cnVjdCB4ZV9ndCAqZ3QsIHVuc2lnbmVk
IGludCBkc3MsDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCAqZ3JvdXAsIHVuc2lnbmVkIGludA0KPiAqaW5z
dGFuY2UpOw0KPiArYm9vbCB4ZV9ndF9tY3JfZHNzX2hhc19zdWJzbGljZShzdHJ1Y3QgeGVfZ3Qg
Kmd0LCBpbnQgc2xpY2UsIGludA0KPiBzdWJzbGljZSk7DQo+ICsNCj4gKyNkZWZpbmUgX0hBU19T
Uyhzc18sIGd0XywgZ3JvdXBfLCBpbnN0YW5jZV8pDQoNCldoeSBkbyB3ZSBoYXZlIHRoZSBzc18g
cGFyYW1ldGVyPw0KDQo+IHhlX2d0X21jcl9kc3NfaGFzX3N1YnNsaWNlKGd0XywgZ3JvdXBfLCBp
bnN0YW5jZV8pDQoNClNhbWUgY29tbWVudCBhcyBhYm92ZSwgd2h5IGlzIHRoaXMgdGllZCBuYW1p
bmctd2lzZSB0byAibWNyIj8NCg0KPiArDQo+ICsvKg0KPiArICogTG9vcCBvdmVyIGVhY2ggc3Vi
c2xpY2UvRFNTIGFuZCBkZXRlcm1pbmUgdGhlIGdyb3VwIGFuZCBpbnN0YW5jZQ0KPiBJRHMgdGhh
dA0KPiArICogc2hvdWxkIGJlIHVzZWQgdG8gc3RlZXIgTUNSIGFjY2Vzc2VzIHRvd2FyZCB0aGlz
IERTUy4NCj4gKyAqLw0KPiArI2RlZmluZSBmb3JfZWFjaF9zc19zdGVlcmluZyhzc18sIGd0Xywg
Z3JvdXBfLCBpbnN0YW5jZV8pIFwNCj4gK8KgwqDCoMKgwqDCoMKgZm9yIChzc18gPSAwLCB4ZV9n
dF9tY3JfZ2V0X3NzX3N0ZWVyaW5nKGd0XywgMCwgJmdyb3VwXywNCj4gJmluc3RhbmNlXyk7IFwN
Cg0KSU1PIGl0J3MgY29uZnVzaW5nIGNhbGxpbmcgZ2V0X3NzX3N0ZWVyaW5nIHR3aWNlIGhlcmUu
IEkgdW5kZXJzdGFuZCB0aGUNCm1hY3JvIHBpZWNlLCBidXQgaXQgd291bGQgYmUgbmljZSBpZiB3
ZSBjb3VsZCByZWR1Y2UgdGhpcyB0byBvbmUgY2FsbC4NCg0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzc18gPCBYRV9NQVhfRFNTX0ZVU0VfQklUUzsgXA0KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzc18rKywgeGVfZ3RfbWNyX2dldF9zc19zdGVlcmluZyhndF8sIHNzXywgJmdyb3VwXywN
Cj4gJmluc3RhbmNlXykpIFwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvcl9l
YWNoX2lmKF9IQVNfU1Moc3NfLCBndF8sIGdyb3VwXywgaW5zdGFuY2VfKSkNCj4gwqANCj4gwqAj
ZW5kaWYgLyogX1hFX0dUX01DUl9IXyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X3RvcG9sb2d5LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xv
Z3kuYw0KPiBpbmRleCBhOGQ3ZjI3MmMzMGEuLmU5NzNlZWFhYzdmMSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmMNCj4gQEAgLTExLDkgKzExLDYgQEANCj4gwqAjaW5jbHVk
ZSAieGVfZ3QuaCINCj4gwqAjaW5jbHVkZSAieGVfbW1pby5oIg0KPiDCoA0KPiAtI2RlZmluZSBY
RV9NQVhfRFNTX0ZVU0VfQklUUyAoMzIgKiBYRV9NQVhfRFNTX0ZVU0VfUkVHUykNCj4gLSNkZWZp
bmUgWEVfTUFYX0VVX0ZVU0VfQklUUyAoMzIgKiBYRV9NQVhfRVVfRlVTRV9SRUdTKQ0KPiAtDQo+
IMKgc3RhdGljIHZvaWQNCj4gwqBsb2FkX2Rzc19tYXNrKHN0cnVjdCB4ZV9ndCAqZ3QsIHhlX2Rz
c19tYXNrX3QgbWFzaywgaW50IG51bXJlZ3MsDQo+IC4uLikNCj4gwqB7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lX3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZW5naW5lX3R5cGVzLmgNCj4gaW5kZXggZDdmODI4Yzc2Y2M1Li4zZTk3
OGExOTAwNDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVf
dHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lX3R5cGVzLmgN
Cj4gQEAgLTY1LDYgKzY1LDkgQEAgc3RydWN0IHhlX2JvOw0KPiDCoHN0cnVjdCB4ZV9leGVjbGlz
dF9wb3J0Ow0KPiDCoHN0cnVjdCB4ZV9ndDsNCj4gwqANCj4gKyNkZWZpbmUgWEVfTUFYX0RTU19G
VVNFX0JJVFMgKDMyICogWEVfTUFYX0RTU19GVVNFX1JFR1MpDQo+ICsjZGVmaW5lIFhFX01BWF9F
VV9GVVNFX0JJVFMgKDMyICogWEVfTUFYX0VVX0ZVU0VfUkVHUykNCg0KU29ycnkgbWF5YmUgb2J2
aW91cywgYnV0IHdoeSBkaWQgeW91IG1ha2UgdGhpcyBtb3ZlPw0KDQpUaGFua3MsDQpTdHVhcnQN
Cg0KPiArDQo+IMKgLyoqDQo+IMKgICogc3RydWN0IHhlX2h3X2VuZ2luZV9jbGFzc19pbnRmIC0g
cGVyIGh3IGVuZ2luZSBjbGFzcyBzdHJ1Y3QNCj4gaW50ZXJmYWNlDQo+IMKgICoNCg0K
