Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD83BC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 21:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868A410E106;
	Mon, 18 Sep 2023 21:23:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56D710E106
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695072188; x=1726608188;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tAAmukanK2MjQmoay0WT4C5la8xhyYso6iR5h3aOsO4=;
 b=MKcNX7QuoAMnReYgEH0DZeG7EMOAde2OC8rooMQofUjAM/kIkWlH/MH9
 +1pmzclalcttHQvE/bmf6IxPtHJdMShPHhCw7TLsSQYWCIZfqS0y4rgNQ
 UbBGGG+0W8A1w40e0u0IdS7oSCdLAAk9RBRiNm2oFado63GAjQJ+YyB0E
 87TQ1L4MESrsCJxpfX/ZNSW0F+ruSom/7ndH/aIv4gXRbV7H1YuF8SCcC
 yth3rO8BfVsfRvGCC2y9yTkzQmWQHiYvWHX5PHnuCYPhvNOXTAmSPvlVZ
 6kfhAjaUqwciV/p/A2oj7wlSSrIZgAb+UOIjgPlsU6Cfig8VLqRkLB/D6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377090008"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="377090008"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 14:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745970513"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="745970513"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 14:23:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 14:22:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 14:22:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 14:22:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 14:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRAfkNp3V1aPe5tGnW8T0GvKsJFZDS11W9OM/1cuIIZMWL9tPxUcJ72bhobQnBJ8b7LJI/F2WA5ds8DwLB15Sr/U8alaqUblQrPQfgGN3fo1lljNBMAO+7WPpIc/YFJ7puqK0QP1YQag1/pUJBrXBqTb3NNLldIRdQAkxqEMSoHX88y/8sveNF4dIPwjRSg3VC7O/6EIAXDeSU3eOkLr7ahktCKko5TAySv5Lt14VzkpmC8AenP/iTBTO4FEk/m47e4c5quAh1tRYWNDIZcFAJbuSAQLKyucK8ynIwtamhhvbXwScP/L+oOmZfeacMAvAapR/onOKO9lXpNTh3gmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAAmukanK2MjQmoay0WT4C5la8xhyYso6iR5h3aOsO4=;
 b=ihheae2q4zheNyUSfIx/xAPew3ysYVKeigwUD2o07pNu61h99R+LHIWyrm6e/G7FhTMfUuHuaeI+LzaRihCvzNgrv2VoGXYSch45baoI9tlmSgzfZRWiv8PYz8TVZwpRHG+chGXH6gt34cCNwFGSYbvTXST1f0sbcgbUWp7Evlgs+6XHj+QwUA50IBzkNz37mWZT23VKs5aHNbDnq72kgIJ4hR8cfWDqLkzNCcj1W26gN/z1iGltULMyZ6JMpRErqSgYsyP4ohBESDaAD7ucA1roZBzodRCTRBoNJQ8Vm50SAaJDTpT5mYONxihPI+YhK5tnljthedIFyWDYHLYaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 21:22:56 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 21:22:55 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 4/4] fixup! drm/xe/display: Implement display
 support
Thread-Index: AQHZ6f4XsfbyxanTbUyzGDSKEjnQM7AhGJYA
Date: Mon, 18 Sep 2023 21:22:55 +0000
Message-ID: <9db125737b0792c5ccaeba7356fd34d548baca56.camel@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
 <20230918070100.1387082-5-jouni.hogander@intel.com>
In-Reply-To: <20230918070100.1387082-5-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SN7PR11MB6851:EE_
x-ms-office365-filtering-correlation-id: 50d65d77-723e-4c23-58d1-08dbb88d6cdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tnoFsS5tgvujxz5z0VT4W1aLQD+goKLIun1GOibeHqTu3ezxNK3Dw4vnpwx9KxnIHYCjAMLZNX/Cbs5AX6ICWcGICeVMO7d4HUnv3POOxJKalDtfr+cIYHcIZkJ6BMxm06M92p3WuvIlAFPxmfQVS/2hM+Jw3tMJGBIROYORAGvdCjvjS5dekvxqRF07FQvjt4qzBhygipm+uqsYGHVci61loyH02zIZKPTH3bIP2beOlaTRWN89Crg3xEfTsnhfW8pG5VTXFVLc8jcR/rZl7eu/BPp5Z9/5ZUb7ejLIqAfnJ7i0kg7/s3Lr5UxmX4325UYzSv0DZowOBFg5RXfLdUjvDMWNQX8k8VODH6bE6OupfoAyz5Q1fShiYcE5JbReVrKuDtaqW6+2mJEyxeM3v+7N5pekO48jAXKGrx74lGbQLwLVu/LjS2pjOsDWT0478tdHI2WfWfamdH+kL/xrJND/zmrEEA+yCnXneZNAlBf9aX8SW5TnhRZq+C0g1c+vjFCHmQwmRWDkZDbfxz9kiXtZjGA+hCMc3KCe2KpuKo8tNYETflUpYfbJbS3/oPU2gf8mEtnuSTiCeBOGmbiMBqPGM1O7jfyaYsymaejVdgVt7BWVyaslmNUPmjjIzIdQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(26005)(2616005)(8676002)(8936002)(83380400001)(82960400001)(2906002)(122000001)(36756003)(41300700001)(86362001)(66476007)(64756008)(66446008)(66556008)(66946007)(76116006)(316002)(6636002)(110136005)(38100700002)(38070700005)(91956017)(71200400001)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVZOWjFlWVBKdUY2c1N5bndFTEt2ZUJnZVhwQUgybHlLT3ZnZWowclRLcGVh?=
 =?utf-8?B?YzRqZTI5UGlWUGkwcm53NDBRcmMyQmQ1Z05odU9RK2dFamN2elo5dU8vVitu?=
 =?utf-8?B?SHVVSTRQMVJpYzJkampURXJHKzlibnJjRjNGNjRHbXQvMkY5NlY4cDRMVHM5?=
 =?utf-8?B?cWZIT0xva1JFTm9hWkp6Z0tubitFZ2cwWEdGeE1NRFk1KzlUZTg3bjJ1NUln?=
 =?utf-8?B?QTRtN3pxQ2I0YzNkNkxQVE5reTdCMmVtSXFMNVhWeHRHeWFOYUxDbStJN1Zp?=
 =?utf-8?B?cTh1NVUzVlcxOVdWcU1BbjdHSklMSUVuelF1emVtT0ZyZlpiYW8rK2EzSTlB?=
 =?utf-8?B?MXJsb1dUWG9OcklGTysvQXNxTHdBc2YwYVJFYU90NE1HdEdxbU83OHlrRGMv?=
 =?utf-8?B?czRIT3NybVhjZG5HR3FLYWpsWWlVa0p1MnV2dVozaGtkdDQ5ditTTHpjQVBT?=
 =?utf-8?B?TFhGZTE2MHFyOElTSXh4ZUhGM0pjOUpPQ25CSmV5dUxGUXVIY3hodklWNFBp?=
 =?utf-8?B?V0dIamFFdnRhdyt0Z3lpVzY4VVlFcFJJRUlYRWRxUGNMQ0psSE9nV2Iwbmlw?=
 =?utf-8?B?eVVObk82Tk1oejd1aTN1QlBPM285WXBHOEtMSHY1c1NVZVcxYWY0b09vdXI5?=
 =?utf-8?B?cmRsMTErY2lHdTJoSDVZK084cFFBbVl5K2JkckRCRlVhMm1PUm9QRU5RaHlC?=
 =?utf-8?B?OU5KUTR6L2ZDbGVEcmxUbnlPSlZjYjQ0dGxFaWw5S1ovdHBxSmIwNkxRMGVV?=
 =?utf-8?B?YzB2UDR5aDhLdS9XemNuSzVxMkVyb0Fid0ZrVFlIYzEzMHNTcFZ5S0NSOXlG?=
 =?utf-8?B?SzcvMnVWbUd5RHI1Ky9LMCszZmRQeFpQUi9sa24zN1NtQzN5b2VLR3BaY2pv?=
 =?utf-8?B?dTJ1VkJiZUlheDdTRFcrWjk1bkppR3d4YW5WdXdTVUd1c0JHeW15S29GcEJ4?=
 =?utf-8?B?ZmsrU3Q1SzdWYTQwYmNMRjdrR2pka2VwZjNweGRuY0JkUGwxaFpwV3N1MkJn?=
 =?utf-8?B?SWF1cW9Wb1dGSFpMWWpPMWNzZHo3cHpvSE9pdXNaS1d6VTZJQWVUMm1WT21W?=
 =?utf-8?B?TWJ4aVVsZzl0eGhUQnhxcVgrNUJTMVlOd3libkE4QVlrMWNTVUFBRkhHRXcz?=
 =?utf-8?B?ZThEOFU2QWFpL09YN1UzYUFPdXlkbUpYNGI5eVdOL3pVSlIraHZkMGRjOER4?=
 =?utf-8?B?cHB5MTRqbU5RR2RhMnFiTGdRb0RqdDUzYVphMkx4d3dCNTlINDFUUDlySVFN?=
 =?utf-8?B?SXdxQUtqWWZGWlg5clcyL0hWc0FPMnF6eXc4d3pLdytHM2dhMndOQmZsb2NT?=
 =?utf-8?B?MjFXdWJlUDViVVkvY0kvRFlxcmpJSkk1ZHlWc21MNFhoYnFHazVWa083dGJF?=
 =?utf-8?B?c25XMUExU3NTWVdXaXo2VnMvN3JrVG1lTXMwRHdrQjUzK3JRcTBpNTR6MUZX?=
 =?utf-8?B?RUU1cHFsTURIRk42UFE1UENuWkFyK1hhUjNRRzFKVzN6QUM5OW4yb2lDTFJh?=
 =?utf-8?B?dVFOQ1JNaEJIaFUxZjZPdTVTTk5Ec25hU094Y29yQnJVSHlhWkZKZWlHcW1T?=
 =?utf-8?B?b2NUN3A1aEpXTTFFbm13SHc4ZVJPaEFaSHI3UlB4TDlCNUsvWTd6Mjh3cEtT?=
 =?utf-8?B?OHdCYVFqVXdIbGFNRCtGRnBXazVFTXZsQ3RoWnNiRTk4Y3cyeTVMSDJwQU9q?=
 =?utf-8?B?cUlUOW9Wb0MyUjh2bjRVaUFUTjhmVFpWb09kc1RBdlU3SUlnT1VjOFVMRVl5?=
 =?utf-8?B?dW9BeEptSEVGc2k0cDEyemF1cFRRdG9la24vMkJRVTJxSStnSDZTVzBNTk0r?=
 =?utf-8?B?MU52WnNGeUxDdVUreEpmVUZiTmoxVlg3MnJRWkpQNGtIRXg1dmhEWThmU1Vn?=
 =?utf-8?B?eXU3ZFcrb3RzZlBXSUJTVjBjYWEwM1pvbmR4UW8rL3kzNmR3bEc1cmhDTlJG?=
 =?utf-8?B?ZEFWcC8zRTl6NGdQZzQyRnZvNUk1eUozSGhYeWhpcXF3UXZQbU16NE51Snpm?=
 =?utf-8?B?dFJkcE00UUlodTExQjFtVWNuSGhRS2REak85bVF2UC9acXl2dyt5TE5wWjZa?=
 =?utf-8?B?d2lKczlTWm4xOXIwdERtd1NyTTlIblJUdG9XZlJPRW9uQWc2UnFwYkU3SElj?=
 =?utf-8?B?NkNJN0ZWaEluZCsvUEZtV3RmSXgxTWU2S3NZT3kvdmNDcFBoUlZ4OVZ1bGdz?=
 =?utf-8?Q?DvbvBJC3cxOIp+PkFFhV4rM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A88959651ECAB4BA43D9C3E094B479C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d65d77-723e-4c23-58d1-08dbb88d6cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 21:22:55.8923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ar/Io8tdaYso8xD9Q952m4GVLXKUke63W65lHBcX9fM+gm26ACbhV2+/ZL+dDTDTSR3lSIRUv91oo6bz6W8Equ5RwgGtXHa+hbNw+R3ceqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] fixup! drm/xe/display: Implement display
 support
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

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDEwOjAxICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IHhlX3J1bnRpbWVfcG0gY2hhbmdlZCB0byBpbnRlbF9ydW50aW1lX3BtLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+
IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZHJ2
LmggfCA4ICsrKystLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdv
dmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS94
ZS9jb21wYXQtaTkxNS0NCj4gaGVhZGVycy9pOTE1X2Rydi5oDQo+IGluZGV4IDAzYWMzOWVmYmEz
OC4uMmQ1ZDhiZTUyZjg4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0
LWk5MTUtaGVhZGVycy9pOTE1X2Rydi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9jb21w
YXQtaTkxNS1oZWFkZXJzL2k5MTVfZHJ2LmgNCj4gQEAgLTE1Niw3ICsxNTYsNyBAQCBzdGF0aWMg
aW5saW5lIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICprZGV2X3RvX2k5MTUoc3RydWN0IGRldmlj
ZSAqa2RldikNCj4gwqANCj4gwqAjaW5jbHVkZSAiaW50ZWxfd2FrZXJlZi5oIg0KPiDCoA0KPiAt
c3RhdGljIGlubGluZSBib29sIGludGVsX3J1bnRpbWVfcG1fZ2V0KHN0cnVjdCB4ZV9ydW50aW1l
X3BtICpwbSkNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpbnRlbF9ydW50aW1lX3BtX2dldChzdHJ1
Y3QgaW50ZWxfcnVudGltZV9wbSAqcG0pDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX2RldmljZSAqeGUgPSBjb250YWluZXJfb2YocG0sIHN0cnVjdCB4ZV9kZXZpY2UsIHJ1bnRp
bWVfcG0pOw0KPiDCoA0KPiBAQCAtMTY3LDIxICsxNjcsMjEgQEAgc3RhdGljIGlubGluZSBib29s
IGludGVsX3J1bnRpbWVfcG1fZ2V0KHN0cnVjdCB4ZV9ydW50aW1lX3BtICpwbSkNCj4gwqDCoMKg
wqDCoMKgwqDCoHJldHVybiB0cnVlOw0KPiDCoH0NCj4gwqANCj4gLXN0YXRpYyBpbmxpbmUgYm9v
bCBpbnRlbF9ydW50aW1lX3BtX2dldF9pZl9pbl91c2Uoc3RydWN0IHhlX3J1bnRpbWVfcG0gKnBt
KQ0KPiArc3RhdGljIGlubGluZSBib29sIGludGVsX3J1bnRpbWVfcG1fZ2V0X2lmX2luX3VzZShz
dHJ1Y3QgaW50ZWxfcnVudGltZV9wbSAqcG0pDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2RldmljZSAqeGUgPSBjb250YWluZXJfb2YocG0sIHN0cnVjdCB4ZV9kZXZpY2UsIHJ1
bnRpbWVfcG0pOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHhlX3BtX3J1bnRpbWVf
Z2V0X2lmX2FjdGl2ZSh4ZSk7DQo+IMKgfQ0KPiDCoA0KPiAtc3RhdGljIGlubGluZSB2b2lkIGlu
dGVsX3J1bnRpbWVfcG1fcHV0X3VuY2hlY2tlZChzdHJ1Y3QgeGVfcnVudGltZV9wbSAqcG0pDQo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgaW50ZWxfcnVudGltZV9wbV9wdXRfdW5jaGVja2VkKHN0cnVj
dCBpbnRlbF9ydW50aW1lX3BtICpwbSkNCj4gwqB7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSA9IGNvbnRhaW5lcl9vZihwbSwgc3RydWN0IHhlX2RldmljZSwgcnVudGlt
ZV9wbSk7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+
IMKgfQ0KPiDCoA0KPiAtc3RhdGljIGlubGluZSB2b2lkIGludGVsX3J1bnRpbWVfcG1fcHV0KHN0
cnVjdCB4ZV9ydW50aW1lX3BtICpwbSwgYm9vbCB3YWtlcmVmKQ0KPiArc3RhdGljIGlubGluZSB2
b2lkIGludGVsX3J1bnRpbWVfcG1fcHV0KHN0cnVjdCBpbnRlbF9ydW50aW1lX3BtICpwbSwgYm9v
bCB3YWtlcmVmKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh3YWtlcmVmKQ0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX3J1bnRpbWVfcG1fcHV0X3VuY2hlY2tl
ZChwbSk7DQoNCg==
