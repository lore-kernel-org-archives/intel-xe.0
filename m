Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE54CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 06:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7C710E488;
	Thu, 19 Oct 2023 06:36:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D8F10E488
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697697369; x=1729233369;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wOQviTju3Lfen8fBFjAutoUBiv6egNBbC6dgQNQtsBc=;
 b=OCD1zpubqrbMl07xlOnZuz30OYR7pR/jHDZaeubWb6J4A//ceXePGsPP
 2Sx5KNXzC5CdaVxrY7Rp9aVfKtqcRkXT2keqD0sUJISJfmjYtzosvlKX1
 bGMWxcRA6tntmGwnofxw8Kpcx+3bj0LS2lSUvd5bA06dYw2N5JBpwfaE5
 QOa555RFv49SC1KaOCkwM+oYIJk7RN/yZNCIuAvP+TMXKSkDKJzD3GFL+
 72g4apy8liYRz/9T/54aGcYO/2cy6AtRy83OKumZi3lekSSEWSvNUjyHQ
 lM6FfE3xF323yWSTxxlyX+MluXixWsgQ3686CnmCWpoMkwYHq40m6Znsy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417296330"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="417296330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 23:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822722570"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="822722570"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 23:36:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 23:36:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 23:36:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 23:36:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 23:36:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0WUCdaE6G7RmtTM1be3figkrGEArDGMMBzydLEbE8QYvqfEMy1Si+5+5GoJbQwGuJ/+eRRTj0VUFcMwGEskIKcA940D5f0HNaunbCNitvp+9c1JwP8hXvNj1PzDWmR7VwL2KInW4ZfwA2iFD1DQI7wvVoLk3deFT1yL0SckWb1B1agtgoFOgSziQMNQuyqIU6PcsgGCAoCzMy8DuYn6P1sjIHbUcOZKPhHoRvPNknM4CuSfCPiXxCpWlHQW3RENlZ1+Ltxdw7/pAWPTcYrZ8EHwC0/qUATun0CTOVuXABwxWhF8G/x1nZNJpAD14tA+f+Yq3RXDGpgQhg6LZzHb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOQviTju3Lfen8fBFjAutoUBiv6egNBbC6dgQNQtsBc=;
 b=P8m29oCfLIyF4OMwcvgxwi5Bc/GY6sI8wrVZ+whYZa0CyYEZdYWYxLtacNa2iuc7M+gaPj3bEKGZE4osD9nsSGvZAt3lyP+oErTXg55p35sXgs8/vkNg2yjKUoPZ2MuMolaai/o8pWZmrTTtl6U9lX6/a+I5QL1OSGUFxzffRNFSUYhtKiS9MYYVcRX3xlKFbuQrEOobLiOtvwWwx9l2HkT71h7/OoIfWS4yqyAqABv0OKE4RXXvLu253SYoDpkQV9ZBY9aThqUdFNNOXTu3Ls+hQoFneqX6gdLPPTlBttTAe3to8v7p+A7uSwAerzNacynsMhfWVVQgBpvsskEtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 06:36:01 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%7]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 06:36:00 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 05/10] drm/xe: Notify userspace about GSC
 HW errors.
Thread-Index: AQHaAXa9Yz4Xc9JKUEiCAF6UcmJxa7BQShAAgABOSnCAAAhEAIAACVGg
Date: Thu, 19 Oct 2023 06:36:00 +0000
Message-ID: <MW4PR11MB7056F43B742A19914EFAEB99B3D4A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
 <20231018040033.1227494-6-himal.prasad.ghimiray@intel.com>
 <be063286-ae1e-460c-80f2-89f86485a9c7@intel.com>
 <MW4PR11MB705661DB0BF942C87D8CBA75B3D4A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <b5456a04-312e-5ea9-d0d4-fa628beeb557@linux.intel.com>
In-Reply-To: <b5456a04-312e-5ea9-d0d4-fa628beeb557@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CY5PR11MB6233:EE_
x-ms-office365-filtering-correlation-id: 4566eb67-4ac7-4094-c651-08dbd06da8a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mhjT5Kh6Pbqc40WNn4Y8Bb20dgkN9Px54l2s4vt7NA/s16ymqsJw3zngfiZtKWlgWAe2EpaOnMeFzi0xR01Z3nvFJ7nlukIlGu+kw/ahxnYVbzW19ICfE3GxpeJX/JUU8ZF9aqtZQlhu7OdFen6F9GWmvKUyYX/rYZEs8OQXpI4WWTgcMQqO9A4gx8U6ntlbOrLprWqDo8EpgvKYC07Ui/vNKuhWhLgmr5TPNFxD1KMyDhpftohLkyMdd6z511e1piQAuAkxJ82IIjHYmN4Cnu9ziUG75BsRzpzy/J2E2r4MLyd+m4Q589SXibduGa3P/1rPhvlOwB3QTE2LGYrU6UFrGaRNuvieSONwxWAilZ6iB8ibhYubKCwl0PEqZrsU4IuwJ+lVKMXBn5MD1z6gwnJc1Ao71oagc2j5GIcy3EHT1cWPIEXu+/JzSm2yvyc9KvWlD17YUROp2z2xzqUfnhdneb4RO8V/gZVvhzqOtT+pK71ZkdYWsuGzYf8EYyDvnNKh2rj4UOq5dig858f+mpADwVvC4wILB8yqHeS0Dtjibj2EsK0FTDhCvZIf77EXqrIY1XRfp0qUpKPNDziKxmBzmEK3sccIOCEXRBKEo4M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38100700002)(55016003)(33656002)(82960400001)(478600001)(26005)(122000001)(83380400001)(86362001)(5660300002)(110136005)(52536014)(71200400001)(76116006)(966005)(66946007)(316002)(64756008)(2906002)(66476007)(7696005)(53546011)(9686003)(6506007)(66556008)(38070700005)(41300700001)(8936002)(66446008)(8676002)(84970400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3k0YmVNYzU0OGV1SVZISDlxUXZuenJWYTVmN3pjblpLZzZLRk5hbzNHMFdi?=
 =?utf-8?B?dXhFVFp2dVF2K1d5ZHh3SERPMUhaUjROMlE1a1VPNWJrVDcrQzNaSHk1QkVD?=
 =?utf-8?B?NytGMmJoOHZ1M0s0eDhHN2hZWSsraXVaU28yQmxzQlhrbkVRV3dzSzFqMXlH?=
 =?utf-8?B?amorNkdzUy9NcXRWelJlSGZENmxUQUo2ZnQ1bkFvOTZSd2FmL3I2eWU1aWV1?=
 =?utf-8?B?TUZTRm5sd2wzblRaU2NnbXV5NGwxZGtHcEJFelBrb2d2TTEvZjcrRkUyQ1o1?=
 =?utf-8?B?dGhLSUJzL3NkditubHFmOTlFUlpEM01vUXg4WFYrbDVUcUFwNWpoNlZQNktw?=
 =?utf-8?B?SWlEaTFNVnNCNThuSWJiZXQ0RzV0NVBHckVuYXZna2dpRzBjeDg5Yi8xSDBY?=
 =?utf-8?B?cGh6OEZZejlFTmpIYkpMNnM3SXU2ZXRwNk5IZ1BJTnhUSFpRMi93S0xXeEk3?=
 =?utf-8?B?WG1pS3dicHhIVE04MWgrUGNaVWJ3bm0zWXdkSWRLMW9FYUJCMFp3bFFRQjlu?=
 =?utf-8?B?Y3d6VnJSR053aUtrdWlldTY1NjZub3doNlU0QW5wSDNaUkxLVDlGNjUrSVJ2?=
 =?utf-8?B?Z2VmOWJtZWE4elJyc0UzUURnK2ZFZVJiY1N4cVJ6dmpSalpZWUlDWEhWN051?=
 =?utf-8?B?VGpiS0FpcEE3aHhxdm51ZWY4OE9EdnpGUkxIZS9ycnA2UGdwRDJiUGxRdlJj?=
 =?utf-8?B?c0xxdmtHSGgwY1ZIZGZEWjh6d2dnQ0ZNcUlSZlN5TlprMDhESGFHYnp3S3NC?=
 =?utf-8?B?bk9VZFNvRC9oNjBiMGY1aVJwQTlSL3NXVzBCRWJHT2dFcEdNMFYvVGZTQmtY?=
 =?utf-8?B?ZGNjSm55QnRmbGo0YXA1TWdQVkpEVnlpVEpVUWE5VHVYZjhuRy9PMHlYMHFV?=
 =?utf-8?B?UDhjVExkZGV2Zk9vYVQ3dzZTaVp2UnljWGhPMzlXQ1hkenNIUTVTbFF2RFRi?=
 =?utf-8?B?QTRWakkrbnE2MWJTS2FQZ0dBd2pLZDFWY0NqSzl2dXM1YUxYNUhoWTBFWWMv?=
 =?utf-8?B?WW5LZWo4dXNIaUVSbFExOXZoeUpjODNjSFA4c1c2enh1N2g1dHJEdm96elV6?=
 =?utf-8?B?cVNQSERoaVA2cnZoZ3E5akt5eE5hKzRxTm0vWUZmMkZhOHhSeVpqUWVKbUNi?=
 =?utf-8?B?ejJ5R3RVdXB0RkIwTTRBRXU2bEJCTHJWOXIwcEZ6SlFNaFQ4OXIvQ2hQazlO?=
 =?utf-8?B?b1lWelEyWFgvWTNNNWJCWW1vK09LUyszTVZGQVFSM0pyN2tneTZBaHN6NHVw?=
 =?utf-8?B?ak1TYnVURTkzRGREb1pnellFamtTcGlsSzF6T0FIeFFMKzE3MFBTRVFNaTFs?=
 =?utf-8?B?Sk5XOEJvZXcyakhYaGZVaGlzaHFqRGtJU3Y5bVE1TWp0NFRjeWNENUt1SHM4?=
 =?utf-8?B?NDdvRzBpZCsyWGUvYTVta2pqM0RaTDdxdjlIbXZoT3p3bnUxYmhNeldMRUFT?=
 =?utf-8?B?SnR0Lzd5ZHpnaDNjb0M3blRwZnpTelIyMlFxSGtNVEIrVTlEOFRwWU5LTUs1?=
 =?utf-8?B?Zk5TL0UxcW5NV0xuSVF6dHNUbHd2MzMxcG0rRjdQb0ROd29FSFlaLzVOSXI1?=
 =?utf-8?B?Rkt4YU9oTXlHdHVXc3l3T1dYRWxDbnJjNjlMTGExd3J0OWxFQnB2STVLNUhi?=
 =?utf-8?B?a21kVzZSODNtYUdoVUs0SHFSdzd6WFZra29iMEJFUUNFd2lvUEZhYkp3Tmlp?=
 =?utf-8?B?S09nd05SSTdja29ZTzB4V0NiOTFqNk1PQXRBZ2J0N2MreUlYV3dGM0FEL3Rr?=
 =?utf-8?B?bXUvcWNYNlBXK0piZ1hWYlFJc2NPdk05NVl3YUIrUmNyY0dRelNsckovSlhV?=
 =?utf-8?B?Nmdsd0dCY1BxNllkY3RnZmo4eWsxeDZsSWE5cDlHampWT3Aycno2eFFtOVBK?=
 =?utf-8?B?YnFycUhCV1p4WVBBV2ZPcmhUTURxaCtFdEZZcUtTRGdOVHBLR3hMUXR3cGwr?=
 =?utf-8?B?K05uV2VuaUc4MWlSZnJMUjFMRU8xTmJERWtsSjFBSGVxckRVOVYybm5KdVhJ?=
 =?utf-8?B?a0NIcVNSdFhKKzcxUk82dlE0WVNDdnNTb0lEQVFYSGtMcWFkVy9yVmtVRmM5?=
 =?utf-8?B?VE1Ib2d4bG9ycnZsN0loYndXSE56YXYzQlBYOEJqZHVVdU5xUDg5ZW0rSVVu?=
 =?utf-8?B?TUVLVnZTQjFLMzU5VjYyMmlNUXJmOHBRa1RQT0lNY1FlOWF5QzVvS2V5VTM3?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4566eb67-4ac7-4094-c651-08dbd06da8a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 06:36:00.2389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmiBY0EbJyl8lcYkNIaMVOc2ELDoKyx3MIM/2orrImvoiWsYc8blh4BDGmPhYpGeNxjF4pzkeVUsXKEpZMW6TKutfV6GZjFh9CGH6qet/Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/10] drm/xe: Notify userspace about GSC
 HW errors.
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJhdmluZCBJZGRhbXNl
dHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAxOSBPY3Rv
YmVyIDIwMjMgMTE6MzINCj4gVG86IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQgPGhpbWFsLnByYXNh
ZC5naGltaXJheUBpbnRlbC5jb20+OyBXZWx0eSwNCj4gQnJpYW4gPGJyaWFuLndlbHR5QGludGVs
LmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW0lu
dGVsLXhlXSBbUEFUQ0ggdjIgMDUvMTBdIGRybS94ZTogTm90aWZ5IHVzZXJzcGFjZSBhYm91dCBH
U0MNCj4gSFcgZXJyb3JzLg0KPiANCj4gDQo+IE9uIDE5LzEwLzIzIDExOjA2LCBHaGltaXJheSwg
SGltYWwgUHJhc2FkIHdyb3RlOg0KPiA+IEhpIEJyaWFuLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50
ZWwuY29tPg0KPiA+PiBTZW50OiAxOSBPY3RvYmVyIDIwMjMgMDY6MjINCj4gPj4gVG86IEdoaW1p
cmF5LCBIaW1hbCBQcmFzYWQgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+OyBpbnRl
bC0NCj4gPj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbSW50
ZWwteGVdIFtQQVRDSCB2MiAwNS8xMF0gZHJtL3hlOiBOb3RpZnkgdXNlcnNwYWNlDQo+ID4+IGFi
b3V0IEdTQyBIVyBlcnJvcnMuDQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDEwLzE3LzIwMjMg
OTowMCBQTSwgSGltYWwgUHJhc2FkIEdoaW1pcmF5IHdyb3RlOg0KPiA+Pj4gU2VuZCB1ZXZlbnQg
aW5jYXNlIG9mIG5vbmZhdGFsIGVycm9ycyByZXBvcnRlZCBieSBnc2MuDQo+ID4+Pg0KPiA+Pj4g
djINCj4gPj4+IC0gTm8gbmVlZCB0byBwcm92aWRlIHRpbGUgaW5mbyBpbiB1ZXZlbnQgYmVjYXVz
ZSBlcnJvciBpcyBhY2NlcHRlZA0KPiA+Pj4gb25seSBpbiB0aWxlMC4gKEFyYXZpbmQpDQo+ID4+
IFRoaXMgaXMgdXNlciBBUEkuICBEb24ndCB3ZSBuZWVkIHRvIGRlbW9uc3RyYXRlIHVzZXItc3Bh
Y2UgY29uc3VtZXINCj4gPj4gb2YgdGhpcyBiZWZvcmUgbWVyZ2U/ICBEbyB3ZSBhdCBsZWFzdCBo
YXZlIElHVD8gIEFsc28gc2VlIHF1ZXN0aW9uIGJlbG93Lg0KPiA+IGh0dHBzOi8vb25lLWFwaS5n
aXRsYWItDQo+IHBhZ2VzLmRldnRvb2xzLmludGVsLmNvbS9sZXZlbF96ZXJvL3N5c21hbi9hcGku
aHRtbCNfQ1BQdjQ0MVpFU19FVkVOVF8NCj4gVFlQRV9GTEFHX0RFVklDRV9SRVNFVF9SRVFVSVJF
RCBpcyB0aGUgY29uc3VtZXIgZm9yIHRoaXMgdWV2ZW50Lg0KPiA+IFRoZSBoYXJkd2FyZSBlcnJv
ciBpbmplY3Rpb24gdmlhIElHVCBpcyBub3QgcG9zc2libGUuIEl0IGV4cGxpY2l0bHkgbmVlZHMN
Cj4gcHl0aG9uIFNWIGFuZCBJVFAuDQo+ID4+PiBDYzogQXJhdmluZCBJZGRhbXNldHR5IDxhcmF2
aW5kLmlkZGFtc2V0dHlAaW50ZWwuY29tPg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJh
c2FkIEdoaW1pcmF5DQo+ID4+PiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4g
Pj4+IC0tLQ0KPiA+Pj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggfCAg
MyArKysNCj4gPj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMgICAgIHwgMTYg
KysrKysrKysrKysrKysrKw0KPiA+Pj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3Iu
aCAgICAgfCAgMyArKy0NCj4gPj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jICAgICAg
ICAgIHwgIDQgKysrKw0KPiA+Pj4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAgICAg
ICAgfCAgOCArKysrKysrKw0KPiA+Pj4gICA1IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2VfdHlwZXMuaA0KPiA+Pj4gaW5kZXggMjk5OGVlNTE3ZjBkLi5kMmVlNTU0OWQyMGMgMTAw
NjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4g
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+Pj4gQEAg
LTE5Niw2ICsxOTYsOSBAQCBzdHJ1Y3QgeGVfdGlsZSB7DQo+ID4+PiAgIAlzdHJ1Y3QgdGlsZV9o
d19lcnJvcnMgew0KPiA+Pj4gICAJCXN0cnVjdCB4YXJyYXkgaHdfZXJyb3I7DQo+ID4+PiAgIAl9
IGVycm9yczsNCj4gPj4+ICsNCj4gPj4+ICsJLyoqIEBnc2NfaHdfZXJyX3dvcms6IHdvcmtlciBm
b3IgdWV2ZW50IHRvIHJlcG9ydCBHU0MgSFcgZXJyb3JzDQo+ID4+ICovDQo+ID4+PiArCXN0cnVj
dCB3b3JrX3N0cnVjdCBnc2NfaHdfZXJyX3dvcms7DQo+ID4+PiAgIH07DQo+ID4+Pg0KPiA+Pj4g
ICAvKioNCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3Iu
Yw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYw0KPiA+Pj4gaW5kZXgg
MWU5NGVlNzJhMzRmLi45YWM4MTdjMWRkMDMgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZXJyb3IuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2h3X2Vycm9yLmMNCj4gPj4+IEBAIC0zLDYgKzMsOCBAQA0KPiA+Pj4gICAgKiBDb3B5cmlnaHQg
wqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+Pj4gICAgKi8NCj4gPj4+DQo+ID4+PiArI2lu
Y2x1ZGUgPGRybS94ZV9kcm0uaD4NCj4gPj4+ICsNCj4gPj4+ICAgI2luY2x1ZGUgInhlX2h3X2Vy
cm9yLmgiDQo+ID4+Pg0KPiA+Pj4gICAjaW5jbHVkZSAicmVncy94ZV9yZWdzLmgiDQo+ID4+PiBA
QCAtMzg3LDYgKzM4OSwxOSBAQCB4ZV9ndF9od19lcnJvcl9oYW5kbGVyKHN0cnVjdCB4ZV9ndCAq
Z3QsIGNvbnN0DQo+ID4+IGVudW0gaGFyZHdhcmVfZXJyb3IgaHdfZXJyKQ0KPiA+Pj4gICAJCXhl
X2d0X2h3X2Vycm9yX2xvZ192ZWN0b3JfcmVnKGd0LCBod19lcnIpOw0KPiA+Pj4gICB9DQo+ID4+
Pg0KPiA+Pj4gK3ZvaWQgeGVfZ3NjX2h3X2Vycm9yX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKSB7DQo+ID4+PiArCXN0cnVjdCB4ZV90aWxlICp0aWxlID0gY29udGFpbmVyX29mKHdvcmss
IHR5cGVvZigqdGlsZSksDQo+ID4+IGdzY19od19lcnJfd29yayk7DQo+ID4+PiArCWNoYXIgKmNz
Y19od19lcnJvcl9ldmVudFszXTsNCj4gPj4+ICsNCj4gPj4+ICsJY3NjX2h3X2Vycm9yX2V2ZW50
WzBdID0gWEVfR1NDX0hXX0hFQUxUSF9VRVZFTlQgIj0xIjsNCj4gPj4+ICsJY3NjX2h3X2Vycm9y
X2V2ZW50WzFdID0gIlJFU0VUX1JFUVVJUkVEPTEiOw0KPiA+Pj4gKwljc2NfaHdfZXJyb3JfZXZl
bnRbMl0gPSBOVUxMOw0KPiA+Pj4gKw0KPiA+Pj4gKwlrb2JqZWN0X3VldmVudF9lbnYoJnRpbGUt
PnhlLT5kcm0ucHJpbWFyeS0+a2Rldi0+a29iaiwNCj4gPj4gS09CSl9DSEFOR0UsDQo+ID4+PiAr
CQkJICAgY3NjX2h3X2Vycm9yX2V2ZW50KTsNCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+IC4uLg0K
PiA+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3Vh
cGkvZHJtL3hlX2RybS5oDQo+ID4+PiBpbmRleCBkNDhkOGUzYzg5OGMuLjA2ZjZmY2UxNTMxZCAx
MDA2NDQNCj4gPj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPj4+ICsrKyBi
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPj4+IEBAIC0xNiw2ICsxNiwxNCBAQCBleHRl
cm4gIkMiIHsNCj4gPj4+ICAgICogc3ViamVjdCB0byBiYWNrd2FyZHMtY29tcGF0aWJpbGl0eSBj
b25zdHJhaW50cy4NCj4gPj4+ICAgICovDQo+ID4+Pg0KPiA+Pj4gKy8qKg0KPiA+Pj4gKyAqIERP
QzogdWV2ZW50IGdlbmVyYXRlZCBieSB4ZSBvbiBpdCdzIHRpbGUgbm9kZS4NCj4gPj4gV2hhdCBk
b2VzICd0aWxlIG5vZGUnIG1lYW4/ICBJZiBJJ20gbm90IG1pc3Rha2VuLCBpc24ndA0KPiA+PiB0
aWxlLT54ZS0+ZHJtLnByaW1hcnktPmtkZXYtPmtvYmoganVzdCB0aGUgZGV2aWNlIG5vZGU/DQo+
ID4gTWlzcyBmcm9tIG15IGVuZC4gSXQgc2hvdWxkIGJlIGRldmljZSBub2RlLg0KPiA+Pj4gKyAq
DQo+ID4+PiArICogWEVfR1NDX0hXX0hFQUxUSF9VRVZFTlQgLSBFdmVudCBpcyBnZW5lcmF0ZWQg
d2hlbiBHU0MNCj4gcmVwb3J0cw0KPiA+PiBIVw0KPiA+Pj4gKyAqIGVycm9ycy4gVGhlIHZhbHVl
IHN1cHBsaWVkIHdpdGggdGhlIGV2ZW50IGlzIGFsd2F5cw0KPiA+PiAiUkVTRVRfUkVRVUlSRUQ9
MSIuDQo+ID4+PiArICovDQo+ID4+PiArI2RlZmluZSBYRV9HU0NfSFdfSEVBTFRIX1VFVkVOVCAi
REVWSUNFX1NUQVRVUyINCj4gPj4gU28gYm90aCBYRV9SRVNFVF9GQUlMRURfVUVWRU5UIGFuZCBY
RV9HU0NfSFdfSEVBTFRIX1VFVkVOVA0KPiBhcmUNCj4gPj4gZGVmaW5lZCBhcyAiREVWSUNFX1NU
QVRVUyIuICBTaG91bGQgYmUgdW5pcXVlIG9yIGlzbid0IHRoaXMgZ29pbmcgdG8NCj4gPj4gYmUg
Y29uZnVzaW5nIHRvIHRoZSB1c2VyIHJlYWRpbmcgdGhlc2UgZXZlbnRzPw0KPiA+IFRoZSB2YWx1
ZXMgcHJvdmlkZWQgYXJlIGRpZmZlcmVudCBhbmQgdWV2ZW50cyBhcmUgb24gZGlmZmVyZW50IG5v
ZGVzLg0KPiA+IFhFX1JFU0VUX0ZBSUxFRF9VRVZFTlQgaXMgYXQgcGNpIG5vZGUgb2YgeGUgZGV2
aWNlIHdoZXJlYXMNCj4gPiBYRV9HU0NfSFdfSEVBTFRIX1VFVkVOVCBJcyBhdCBkZXZpY2Ugbm9k
ZS4NCj4gdGhlIHJlc2V0IHRoYXQgeW91IGV4cGVjdCBoZXJlIHRvIHJlY292ZXIgdGhlIGRldmlj
ZSBpcyBhIFBDSWUgbGV2ZWwgcmVzZXQgc2FtZQ0KPiBhcyBpbiBYRV9SRVNFVF9GQUlMRURfVUVW
RU5Uc28gd2h5IHNob3VsZCB0aGlzIGJlIHdpdGggZHJtIGRldmljZSBub2RlLg0KPiANCj4gYWxz
byB0aGUgdWV2ZW50IGRvZXNuJ3Qgc2VlbSB0b8KgIGNvbnZleSB0aGUgY2F1c2UuDQo+IA0KPiB3
aXRoIFhFX0dTQ19IV19IRUFMVEhfVUVWRU5UIHVzZXJzcGFjZSB3aWxsIHNlZToNCj4gDQo+IERF
VklDRV9TVEFUVVM9MQ0KPiANCj4gUkVTRVRfUkVRVUlSRUQ9MQ0KPiANCj4gVElMRV9JRD0wDQo+
IA0KPiB3aGlsZSBmb3IgWEVfUkVTRVRfRkFJTEVEX1VFVkVOVDoNCj4gDQo+IERFVklDRV9TVEFU
VVM9TkVFRFNfUkVTRVQNCj4gDQo+IFJFU0VUX1JFUVVJUkVEPTENCj4gDQo+IFRJTEVfSUQ9MA0K
PiANCj4gR1RfSUQ9MA0KPiANCj4gSSB3b3VsZCByYXRoZXIgc2F5IHdlIGRlZmluZSBvbmUgVUVW
RU5UIFVBUEkNCj4gDQo+IFhFX1JFU0VUX1JFUVVJUkVEICJSRVNFVF9SRVFVSVJFRCINCj4gDQo+
IGFkZCBldmVudCBzcGVjaWZpYyBkZXRhaWxzIGxpa2U6DQo+IA0KPiBDU0NfSFdfRVJST1IgPSAx
DQo+IA0KPiBvcg0KPiANCj4gR1RfUkVTRVRfRkFJTEVEID0gMQ0KPiANCj4gb3IgbGlrZSBSRVNF
VF9SRUFTT049IkNTQ19IV19FUlJPUi9HVF9SRVNFVF9GQUlMRUQiDQo+IA0KPiBhbmQgYWRkIGFk
ZGl0aW9uYWwgZGV0YWlscyBsaWtlIHRpbGUgYW5kIEdULg0KPiANCj4gVGhhbmtzLA0KPiBBcmF2
aW5kDQoNClRoaXMgbWFrZXMgc2Vuc2UuIFdpbGwgbW9kaWZ5IGluIG5leHQgcGF0Y2guIA0KDQpC
Ug0KSGltYWwgR2hpbWlyYXkNCi4NCj4gPg0KPiA+IEJSDQo+ID4gSGltYWwNCj4gPj4gLUJyaWFu
DQo+ID4+DQo+ID4+DQo+ID4+PiArDQo+ID4+PiAgIC8qKg0KPiA+Pj4gICAgKiBET0M6IHVldmVu
dCBnZW5lcmF0ZWQgYnkgeGUgb24gaXQncyBwY2kgbm9kZS4NCj4gPj4+ICAgICoNCg==
